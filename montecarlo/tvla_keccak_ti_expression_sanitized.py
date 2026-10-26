#!/usr/bin/env python3
"""Fixed-vs-random TVLA for a three-share Threshold Implementation.

Leakage model:
    old = D1                         (independent share of a separate value D)
    new = A1 ^ C1 ^ (B1 & C1) ^ (B1 & C2) ^ (B2 & C1)
    L = HW(old ^ new)

A, B, C and D are independently masked into three XOR shares.
D1 is therefore uniform and independent of the shares of A, B and C.

The program:
  1. Exhaustively verifies the single-bit leakage probabilities.
  2. Predicts mean, variance and Welch's t statistic analytically.
  3. Runs fixed-vs-random Monte Carlo simulations.
  4. Plots the analytical expected leakage against HW(B) (Figure 1).
  5. Plots only empirical simulated leakage histograms (Figure 2).

In Figure 2 no theoretical distribution or theoretical probability is plotted.
Every histogram value comes from observed integer-leakage frequencies.
"""

from __future__ import annotations

import argparse
import math
from dataclasses import dataclass
from itertools import product

import matplotlib.pyplot as plt
import numpy as np


TVLA_THRESHOLD = 4.5
POPCOUNT_LUT = np.array([i.bit_count() for i in range(256)], dtype=np.uint8)
Shares = tuple[np.ndarray, np.ndarray, np.ndarray]


@dataclass
class Stats:
    """Streaming statistics with an integer-valued leakage histogram."""

    hist: np.ndarray
    n: int = 0
    s1: float = 0.0
    s2: float = 0.0

    def update(self, leakage: np.ndarray) -> None:
        x = leakage.astype(np.float64, copy=False)
        self.n += x.size
        self.s1 += float(x.sum(dtype=np.float64))
        self.s2 += float(np.square(x).sum(dtype=np.float64))
        # Leakage values are integers in 0, 1, ..., bits.
        self.hist += np.bincount(leakage, minlength=self.hist.size)

    @property
    def mean(self) -> float:
        return self.s1 / self.n

    @property
    def var(self) -> float:
        return (self.s2 - self.s1 * self.s1 / self.n) / (self.n - 1)

    @property
    def pmf_empirical(self) -> np.ndarray:
        """Normalize the observed histogram; this is not a theoretical PMF."""
        return self.hist / self.n


def dtype_for_bits(bits: int):
    if bits == 32:
        return np.uint32
    if bits == 64:
        return np.uint64
    raise ValueError("Only 32-bit and 64-bit words are supported.")


def rand_words(rng: np.random.Generator, n: int, bits: int) -> np.ndarray:
    if bits == 32:
        return rng.integers(0, 1 << 32, size=n, dtype=np.uint32)
    lo = rng.integers(0, 1 << 32, size=n, dtype=np.uint32).astype(np.uint64)
    hi = rng.integers(0, 1 << 32, size=n, dtype=np.uint32).astype(np.uint64)
    return (hi << np.uint64(32)) | lo


def popcount_words(x: np.ndarray, bits: int) -> np.ndarray:
    nbytes = bits // 8
    raw = np.ascontiguousarray(x).view(np.uint8).reshape(-1, nbytes)
    return POPCOUNT_LUT[raw].sum(axis=1, dtype=np.uint16)


def share3(secret: np.ndarray, rng: np.random.Generator, bits: int) -> Shares:
    """Create fresh, independent XOR shares of a secret word."""
    s0 = rand_words(rng, secret.size, bits)
    s1 = rand_words(rng, secret.size, bits)
    s2 = secret ^ s0 ^ s1
    return s0, s1, s2


def leakage_hd(A: Shares, B: Shares, C: Shares, D: Shares, bits: int) -> np.ndarray:
    """HD between independent old share D1 and the TI output new."""
    _, A1, _ = A
    _, B1, B2 = B
    _, C1, C2 = C
    _, D1, _ = D

    old = D1  # NOT derived from A, B or C
    new = A1 ^ C1 ^ (B1 & C1) ^ (B1 & C2) ^ (B2 & C1)
    return popcount_words(old ^ new, bits)


def make_secrets(
    rng: np.random.Generator,
    n: int,
    bits: int,
    fixed_a: int,
    fixed_b: int,
    fixed_c: int,
    fixed_d: int,
    randomize: str,
) -> tuple[np.ndarray, np.ndarray, np.ndarray, np.ndarray]:
    dtype = dtype_for_bits(bits)
    mask = (1 << bits) - 1
    fixed = {
        "A": fixed_a & mask,
        "B": fixed_b & mask,
        "C": fixed_c & mask,
        "D": fixed_d & mask,
    }
    out = []
    for name in "ABCD":
        if name in randomize:
            out.append(rand_words(rng, n, bits))
        else:
            out.append(np.full(n, fixed[name], dtype=dtype))
    return tuple(out)  # type: ignore[return-value]


def evaluate_group(
    rng: np.random.Generator,
    n_total: int,
    chunk: int,
    bits: int,
    fixed_a: int,
    fixed_b: int,
    fixed_c: int,
    fixed_d: int,
    randomize: str,
    verify_reconstruction: bool = True,
) -> Stats:
    """Simulate leakage and accumulate its histogram in bounded-size chunks."""
    st = Stats(hist=np.zeros(bits + 1, dtype=np.int64))
    done = 0
    while done < n_total:
        n = min(chunk, n_total - done)
        sec_a, sec_b, sec_c, sec_d = make_secrets(
            rng, n, bits, fixed_a, fixed_b, fixed_c, fixed_d, randomize
        )
        # Fresh, independent randomness for ALL four masked values.
        A = share3(sec_a, rng, bits)
        B = share3(sec_b, rng, bits)
        C = share3(sec_c, rng, bits)
        D = share3(sec_d, rng, bits)

        if verify_reconstruction:
            assert np.array_equal(A[0] ^ A[1] ^ A[2], sec_a)
            assert np.array_equal(B[0] ^ B[1] ^ B[2], sec_b)
            assert np.array_equal(C[0] ^ C[1] ^ C[2], sec_c)
            assert np.array_equal(D[0] ^ D[1] ^ D[2], sec_d)

        st.update(leakage_hd(A, B, C, D, bits))
        done += n
    return st


def welch_t(fixed: Stats, random: Stats) -> float:
    denom = math.sqrt(fixed.var / fixed.n + random.var / random.n)
    return (fixed.mean - random.mean) / denom if denom else float("nan")


def exact_single_bit_probabilities() -> dict[int, float]:
    """Exhaustive verification, conditional on the reconstructed bit B."""
    counts = {0: [0, 0], 1: [0, 0]}
    for a, b, c, d in product((0, 1), repeat=4):
        for a0, a1, b0, b1, c0, c1, d0, d1 in product((0, 1), repeat=8):
            # The final XOR shares enforce reconstruction for each secret.
            a2 = a ^ a0 ^ a1
            b2 = b ^ b0 ^ b1
            c2 = c ^ c0 ^ c1
            d2 = d ^ d0 ^ d1
            # a2 and d2 are unused by this combinational leakage expression.
            _ = (a2, d2)
            old = d1
            new = a1 ^ c1 ^ (b1 & c1) ^ (b1 & c2) ^ (b2 & c1)
            e = old ^ new
            counts[b][0] += e
            counts[b][1] += 1
    return {b: ones / total for b, (ones, total) in counts.items()}


def analytic_hd_prediction(
    bits: int,
    fixed_b: int,
    n_fixed: int,
    n_random: int,
    randomize: str,
) -> tuple[float, float, float, float, float]:
    """Uniform independent D1 => L ~ Binomial(bits, 1/2) in both groups."""
    _ = (fixed_b, randomize)  # No influence on the analytical distribution.
    mu_fixed = mu_random = bits / 2.0
    var_fixed = var_random = bits / 4.0
    t_expected = (mu_fixed - mu_random) / math.sqrt(
        var_fixed / n_fixed + var_random / n_random
    )
    return mu_fixed, var_fixed, mu_random, var_random, t_expected


def configure_publication_plot_style() -> None:
    plt.rcParams.update({
        "font.family": "serif",
        "font.size": 8.5,
        "mathtext.fontset": "stix",
        "axes.labelsize": 8.5,
        "legend.fontsize": 7.2,
        "xtick.labelsize": 7.5,
        "ytick.labelsize": 7.5,
        "axes.linewidth": 0.8,
        "lines.linewidth": 1.15,
        "savefig.dpi": 600,
        "savefig.bbox": "tight",
        "pdf.fonttype": 42,
        "ps.fonttype": 42,
    })


def plot_expected_leakage_vs_hw(bits: int, fixed_b: int, randomize: str) -> None:
    """Figure 1: flat theoretical mean for all values of HW(B)."""
    _ = randomize
    configure_publication_plot_style()
    hw = np.arange(bits + 1)
    mu = np.full(hw.shape, bits / 2.0, dtype=np.float64)
    fig, ax = plt.subplots(figsize=(4.8, 2.75))
    ax.plot(hw, mu, color="#d62728", linewidth=1.3,
            label=r"$\mathbb{E}[L_{\mathrm{fixed}}\mid\mathrm{HW}(B)]$")
    ax.plot(hw, mu, color="#1f77b4", linestyle="--", linewidth=1.2,
            label=r"$\mathbb{E}[L_{\mathrm{random}}]$")

    fixed_hw = (fixed_b & ((1 << bits) - 1)).bit_count()
    ax.plot(fixed_hw, bits / 2.0, marker="s", color="black", linestyle="none",
            zorder=5, label=rf"Selected fixed $B$ ($\mathrm{{HW}}={fixed_hw}$)")
    ax.set_xlabel(r"HW($B$)")
    ax.set_ylabel(r"Expected HD leakage $\mathbb{E}[L]$")
    ax.set_xticks(np.arange(0, bits + 1, max(1, bits // 4)))
    ax.set_xlim(0, bits)
    ax.set_ylim(bits / 2.0 - 1.0, bits / 2.0 + 1.0)
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.tick_params(direction="out")
    ax.legend(loc="upper center", bbox_to_anchor=(0.5, -0.23), ncol=3,
              handlelength=2.2, columnspacing=1.2)
    fig.tight_layout(pad=0.4)
    plt.show()


def fixed_b_with_hw(hw: int, bits: int) -> int:
    """Return a word with exactly 'hw' ones."""
    if not (0 <= hw <= bits):
        raise ValueError("HW(B) must lie between 0 and bits.")
    return (1 << hw) - 1


def plot_leakage_distributions(
    bits: int,
    n_fixed: int,
    n_random: int,
    chunk: int,
    seed: int,
    fixed_a: int,
    fixed_b: int,
    fixed_c: int,
    fixed_d: int,
    randomize: str,
    tvla_fixed_stats: Stats,
    tvla_random_stats: Stats,
) -> None:
    """Figure 2: empirical histograms only, calculated from Monte Carlo samples.

    Separate fixed groups are simulated for selected HW(B). When B is
    randomized in the random group, that histogram is reused across panels.
    Otherwise random-group simulations are performed separately per HW(B).
    """
    configure_publication_plot_style()
    selected_hw = (0, bits // 4, bits // 2, 3 * bits // 4, bits)
    rng_seeds = iter(np.random.SeedSequence(seed).spawn(2 * len(selected_hw)))
    selected_fixed_hw = (fixed_b & ((1 << bits) - 1)).bit_count()
    x = np.arange(bits + 1)
    random_color, fixed_color = "#1f77b4", "#d62728"

    results = []
    for h in selected_hw:
        scenario_b = fixed_b_with_hw(h, bits)
        if h == selected_fixed_hw:
            st_fixed = tvla_fixed_stats
        else:
            st_fixed = evaluate_group(
                np.random.default_rng(next(rng_seeds)), n_fixed, chunk, bits,
                fixed_a, scenario_b, fixed_c, fixed_d, randomize="",
            )

        if "B" in randomize or h == selected_fixed_hw:
            st_random = tvla_random_stats
        else:
            st_random = evaluate_group(
                np.random.default_rng(next(rng_seeds)), n_random, chunk, bits,
                fixed_a, scenario_b, fixed_c, fixed_d, randomize=randomize,
            )
        results.append((h, st_fixed, st_random))

    max_y = max(max(sf.pmf_empirical.max(), sr.pmf_empirical.max())
                for _, sf, sr in results)
    fig, axes = plt.subplots(1, len(selected_hw), figsize=(13.0, 2.55),
                             sharex=True, sharey=True)
    for ax, (h, st_fixed, st_random) in zip(axes, results):
        # Plot only relative frequencies measured in the simulation.
        random_line, = ax.plot(
            x, st_random.pmf_empirical, color=random_color,
            linestyle="-", linewidth=1.35, label="Random group",
        )
        fixed_line, = ax.plot(
            x, st_fixed.pmf_empirical, color=fixed_color,
            linestyle="--", marker="o", markevery=2,
            markerfacecolor="white", markeredgecolor=fixed_color,
            markeredgewidth=0.75, linewidth=1.15, label="Fixed group",
        )
        ax.axvline(st_random.mean, color=random_color, linestyle=":",
                   linewidth=0.9, alpha=0.9)
        ax.axvline(st_fixed.mean, color=fixed_color, linestyle=":",
                   linewidth=0.9, alpha=0.9)
        ax.set_title(rf"$\mathrm{{HW}}(B)={h}$", pad=3.0)
        ax.set_xlim(0, bits)
        ax.set_xticks(np.arange(0, bits + 1, max(1, bits // 4)))
        ax.set_ylim(0, max_y * 1.10)
        ax.spines["top"].set_visible(False)
        ax.spines["right"].set_visible(False)
        ax.tick_params(direction="out")
        ax.set_xlabel("HD of the leaking transition")
    axes[0].set_ylabel("Probability mass")
    fig.legend(handles=[random_line, fixed_line],
               labels=["Random group", "Fixed group"], loc="upper center",
               bbox_to_anchor=(0.5, 0.9), ncol=2, frameon=False,
               handlelength=2.5, columnspacing=1.8)
    fig.subplots_adjust(left=0.055, right=0.995, bottom=0.22,
                        top=0.78, wspace=0.16)
    plt.show()


def parse_int(value: str) -> int:
    return int(value, 0)


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Fixed-vs-random TVLA with independent D1 as the old value."
    )
    parser.add_argument("--bits", type=int, choices=(32, 64), default=32)
    parser.add_argument("--n-fixed", type=int, default=500_000)
    parser.add_argument("--n-random", type=int, default=500_000)
    parser.add_argument("--chunk", type=int, default=1_000_000)
    parser.add_argument("--seed", type=int, default=12345)
    parser.add_argument("--fixed-a", type=parse_int, default=0)
    parser.add_argument("--fixed-b", type=parse_int, default=0)
    parser.add_argument("--fixed-c", type=parse_int, default=0)
    parser.add_argument("--fixed-d", type=parse_int, default=0,
                        help="Independent secret D for the fixed group (default: 0).")
    parser.add_argument("--randomize", default="ABC",
                        help="Secrets randomized in the random group: ABC, B, BCD, ABCD, etc.")
    parser.add_argument("--no-plots", action="store_true",
                        help="Compute results without displaying figures.")
    args = parser.parse_args()

    if args.n_fixed < 2 or args.n_random < 2 or args.chunk < 1:
        parser.error("--n-fixed and --n-random must be >= 2; --chunk must be >= 1")
    if args.seed < 0:
        parser.error("--seed must be nonnegative")
    if any(ch not in "ABCD" for ch in args.randomize.upper()):
        parser.error("--randomize may only contain A, B, C, D")
    randomize = "".join(dict.fromkeys(args.randomize.upper()))
    if not randomize:
        parser.error("--randomize must contain at least one of A, B, C, D")

    exact = exact_single_bit_probabilities()
    print("=== Exact single-bit verification ===")
    print(f"P(e=1 | B=0) = {exact[0]:.6f}  (expected 1/2 = 0.500)")
    print(f"P(e=1 | B=1) = {exact[1]:.6f}  (expected 1/2 = 0.500)")
    assert exact[0] == exact[1] == 0.5
    print("Independent D1 makes first-order HD independent of B.\n")

    mu_f, var_f, mu_r, var_r, t_expected = analytic_hd_prediction(
        args.bits, args.fixed_b, args.n_fixed, args.n_random, randomize
    )
    mask = (1 << args.bits) - 1
    print("=== Analytical prediction ===")
    print(f"Word size              : {args.bits} bits")
    print(f"Fixed A                : 0x{args.fixed_a & mask:0{args.bits // 4}X}")
    print(f"Fixed B                : 0x{args.fixed_b & mask:0{args.bits // 4}X}")
    print(f"Fixed C                : 0x{args.fixed_c & mask:0{args.bits // 4}X}")
    print(f"Fixed D                : 0x{args.fixed_d & mask:0{args.bits // 4}X}")
    print(f"HW(fixed B)            : {(args.fixed_b & mask).bit_count()}")
    print(f"Randomized values      : {randomize}")
    print(f"N fixed / random       : {args.n_fixed} / {args.n_random}")
    print(f"E[L_fixed]             : {mu_f:.6f}")
    print(f"E[L_random]            : {mu_r:.6f}")
    print(f"Var[L_fixed]           : {var_f:.6f}")
    print(f"Var[L_random]          : {var_r:.6f}")
    print(f"Expected Welch t       : {t_expected:.3f}")
    print("Predicted TVLA         : " +
          ("LEAKAGE" if abs(t_expected) >= TVLA_THRESHOLD else "NOT DETECTED") + "\n")

    seed_sequence = np.random.SeedSequence(args.seed)
    fixed_rng, random_rng = [np.random.default_rng(s) for s in seed_sequence.spawn(2)]
    fixed_stats = evaluate_group(
        fixed_rng, args.n_fixed, args.chunk, args.bits,
        args.fixed_a, args.fixed_b, args.fixed_c, args.fixed_d, randomize="",
    )
    random_stats = evaluate_group(
        random_rng, args.n_random, args.chunk, args.bits,
        args.fixed_a, args.fixed_b, args.fixed_c, args.fixed_d, randomize=randomize,
    )

    t_mc = welch_t(fixed_stats, random_stats)
    print("=== Monte Carlo validation ===")
    print(f"Mean fixed             : {fixed_stats.mean:.6f}")
    print(f"Mean random            : {random_stats.mean:.6f}")
    print(f"Variance fixed         : {fixed_stats.var:.6f}")
    print(f"Variance random        : {random_stats.var:.6f}")
    print(f"Welch t                : {t_mc:.3f}")
    print(f"|t|                    : {abs(t_mc):.3f}")
    print(f"TVLA threshold         : {TVLA_THRESHOLD:.1f}")
    print("TVLA result            : " + (
        "FIRST-ORDER LEAKAGE DETECTED" if abs(t_mc) >= TVLA_THRESHOLD
        else "NOT DETECTED BY THIS FIRST-ORDER TEST"
    ))
    print("Note: finite-sample t may differ from the theoretical value 0.")

    if not args.no_plots:
        plot_expected_leakage_vs_hw(args.bits, args.fixed_b, randomize)
        plot_leakage_distributions(
            bits=args.bits, n_fixed=args.n_fixed, n_random=args.n_random,
            chunk=args.chunk, seed=args.seed + 999,
            fixed_a=args.fixed_a, fixed_b=args.fixed_b,
            fixed_c=args.fixed_c, fixed_d=args.fixed_d,
            randomize=randomize,
            tvla_fixed_stats=fixed_stats, tvla_random_stats=random_stats,
        )


if __name__ == "__main__":
    main()
