# Keeping the Mask On: Secure Porting of Masked Software

This repository provides the firmware and experimental analysis code accompanying **Keeping the Mask On**, a study of the secure portability of masked software across microcontrollers.

The case study investigates a first-order masked implementation of **Keccak** and shows how porting masked software to a different microcontroller can introduce exploitable side-channel leakage, even when architectural compatibility is preserved. The repository includes the original and sanitized STM32F4 implementations, tools for acquiring and assessing physical power traces, and statistical experiments focused on the instruction identified as leaking in the original implementation.

> **Anonymous artifact:** This repository is made available for anonymous peer review at [KeepingTheMaskOn-A0D7](https://anonymous.4open.science/r/KeepingTheMaskOn-A0D7/).

## Repository structure

```
KeepingTheMaskOn/
├── firmware/
│   └── mcu/
│       ├── OriginalImplementation/
│       ├── SanitizedImplementation/
│       └── hal/
├── notebooks/
│   ├── CaptureTraces.ipynb
│   └── TVLA.ipynb
├── montecarlo/
│   ├── tvla_keccak_ti_expression_original.py
│   └── tvla_keccak_ti_expression_sanitized.py
└── README.md
```

The tree highlights the directories and files used in the experiments; individual directories may contain additional support files.

### `firmware/mcu/`

This directory contains the firmware used for the **STM32F4** experiments and the supporting hardware-abstraction code.

- **`OriginalImplementation/`** — STM32F4 firmware for the **original masked Keccak implementation**, before applying the proposed sanitization. This is the implementation in which the relevant leakage was identified.
- **`SanitizedImplementation/`** — STM32F4 firmware for the **sanitized masked Keccak implementation** proposed in the paper. It incorporates the changes intended to eliminate the identified leakage mechanism.
- **`hal/`** — Hardware-abstraction-layer (HAL) drivers and supporting files used for communication with the microcontrollers.

The original and sanitized implementations provide the two firmware variants used to assess the effect of the proposed mitigation on physical leakage.

### `notebooks/`

This directory contains the Jupyter notebooks used in the physical side-channel evaluation.

- **`CaptureTraces.ipynb`** — Acquires **physical side-channel traces** from the microcontroller during execution of the target firmware.
- **`TVLA.ipynb`** — Applies **Test Vector Leakage Assessment (TVLA)** to the captured traces to evaluate the presence of statistically detectable leakage.

These notebooks support the experimental sequence from physical trace acquisition to leakage assessment for the original and sanitized firmware.

### `montecarlo/`

This directory contains the statistical analyses of the instruction associated with the leakage observed in the original implementation.

- **`tvla_keccak_ti_expression_original.py`** — Performs a **statistical analysis of the leaking instruction** in the original masked Keccak implementation.
- **`tvla_keccak_ti_expression_sanitized.py`** — Performs the **corresponding statistical analysis of the same instruction** in the sanitized implementation.

The two scripts are intended to support a comparison of the instruction's statistical leakage behavior before and after sanitization. They are distinct from the TVLA performed on experimentally acquired physical traces in `notebooks/TVLA.ipynb`.

## Experimental workflow

The repository supports two complementary lines of evaluation:

**Physical measurements**

1. Prepare and program the STM32F4 with the firmware from `firmware/mcu/OriginalImplementation/`.
2. Use `notebooks/CaptureTraces.ipynb` to acquire physical traces.
3. Analyze the captured traces with `notebooks/TVLA.ipynb`.
4. Repeat the acquisition and TVLA analysis using `firmware/mcu/SanitizedImplementation/` to assess the effect of sanitization.

**Statistical analysis**

1. Use `montecarlo/tvla_keccak_ti_expression_original.py` to analyze the leaking instruction in the original implementation.
2. Use `montecarlo/tvla_keccak_ti_expression_sanitized.py` to analyze the corresponding instruction in the sanitized implementation.
3. Compare the two results to study the impact of sanitization on the targeted leakage mechanism.

## Requirements and execution

The experiments involve two execution environments:

- **Embedded firmware:** An STM32F4 microcontroller and a compatible firmware build/programming setup. The `hal/` directory provides drivers and files for microcontroller communication.
- **Host-side analysis:** Python and Jupyter for running the notebooks, plus the Python dependencies and trace-acquisition hardware/software required by the particular experiment.

To open the analysis notebooks from the repository root, with Jupyter installed:

```
jupyter lab notebooks/
```

The statistical analysis scripts are located at:

```
montecarlo/tvla_keccak_ti_expression_original.py
montecarlo/tvla_keccak_ti_expression_sanitized.py
```

Before running an experiment, consult the relevant source file or notebook for its imports, input data, acquisition settings, and any target-specific configuration. **No universal build command, dependency manifest, or end-to-end execution command is assumed here**, since these details depend on the experimental setup.

## Methodological context

The accompanying paper uses a simulator-assisted methodology to investigate why masked software may exhibit different leakage behavior across microcontrollers. It combines instruction-level leakage assessment, data-dependency analysis, and data-exposure indicators with physical validation.

In particular, the proposed **remanence** and **revive** metrics describe how sensitive intermediate values persist or reappear in architectural registers. They are exposure indicators, not direct physical leakage measurements. The firmware, physical-trace notebooks, and targeted statistical scripts in this repository provide complementary experimental material for evaluating the identified leakage mechanism and its proposed mitigation.

## Citation

This repository is provided as an anonymous research artifact. If using the code in published work, please cite the accompanying paper once its bibliographic details are publicly available.