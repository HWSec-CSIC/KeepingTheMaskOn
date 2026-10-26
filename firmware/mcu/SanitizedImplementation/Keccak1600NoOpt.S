.thumb
.syntax unified
.text
.thumb_func



@----------------------------------------------------------------------------------
@----------------------------------SYMBOLIC VARIABLES------------------------------
@----------------------------------------------------------------------------------
@Definition of symbolic variables associated with the memory regions of the three Keccak state shares.
@Lane naming convention: A<x><y><m>_s<n>
@  <x> = row (b=0, g=1, k=2, m=3, s=4)
@  <y> = column (a=0, e=1, i=2, o=3, u=4)
@  <m> = lane half (0=low/even, 1=high/odd)
@  <n> = share index (0,1,2)

@----------------------------------------------------------------------------------
@Memory zone A (read in even rounds, written in odd rounds)
@----------------------------------------------------------------------------------

.equ Aba0_s0   , 0*4
.equ Aba1_s0   , 1*4
.equ Abe0_s0   , 2*4
.equ Abe1_s0   , 3*4
.equ Abi0_s0   , 4*4
.equ Abi1_s0   , 5*4
.equ Abo0_s0   , 6*4
.equ Abo1_s0   , 7*4
.equ Abu0_s0   , 8*4
.equ Abu1_s0   , 9*4
.equ Aga0_s0   , 10*4
.equ Aga1_s0   , 11*4
.equ Age0_s0   , 12*4
.equ Age1_s0   , 13*4
.equ Agi0_s0   , 14*4
.equ Agi1_s0   , 15*4
.equ Ago0_s0   , 16*4
.equ Ago1_s0   , 17*4
.equ Agu0_s0   , 18*4
.equ Agu1_s0   , 19*4
.equ Aka0_s0   , 20*4
.equ Aka1_s0   , 21*4
.equ Ake0_s0   , 22*4
.equ Ake1_s0   , 23*4
.equ Aki0_s0   , 24*4
.equ Aki1_s0   , 25*4
.equ Ako0_s0   , 26*4
.equ Ako1_s0   , 27*4
.equ Aku0_s0   , 28*4
.equ Aku1_s0   , 29*4
.equ Ama0_s0   , 30*4
.equ Ama1_s0   , 31*4
.equ Ame0_s0   , 32*4
.equ Ame1_s0   , 33*4
.equ Ami0_s0   , 34*4
.equ Ami1_s0   , 35*4
.equ Amo0_s0   , 36*4
.equ Amo1_s0   , 37*4
.equ Amu0_s0   , 38*4
.equ Amu1_s0   , 39*4
.equ Asa0_s0   , 40*4
.equ Asa1_s0   , 41*4
.equ Ase0_s0   , 42*4
.equ Ase1_s0   , 43*4
.equ Asi0_s0   , 44*4
.equ Asi1_s0   , 45*4
.equ Aso0_s0   , 46*4
.equ Aso1_s0   , 47*4
.equ Asu0_s0   , 48*4
.equ Asu1_s0   , 49*4

.equ Aba0_s1   , 0*4+200
.equ Aba1_s1   , 1*4+200
.equ Abe0_s1   , 2*4+200
.equ Abe1_s1   , 3*4+200
.equ Abi0_s1   , 4*4+200
.equ Abi1_s1   , 5*4+200
.equ Abo0_s1   , 6*4+200
.equ Abo1_s1   , 7*4+200
.equ Abu0_s1   , 8*4+200
.equ Abu1_s1   , 9*4+200
.equ Aga0_s1   , 10*4+200
.equ Aga1_s1   , 11*4+200
.equ Age0_s1   , 12*4+200
.equ Age1_s1   , 13*4+200
.equ Agi0_s1   , 14*4+200
.equ Agi1_s1   , 15*4+200
.equ Ago0_s1   , 16*4+200
.equ Ago1_s1   , 17*4+200
.equ Agu0_s1   , 18*4+200
.equ Agu1_s1   , 19*4+200
.equ Aka0_s1   , 20*4+200
.equ Aka1_s1   , 21*4+200
.equ Ake0_s1   , 22*4+200
.equ Ake1_s1   , 23*4+200
.equ Aki0_s1   , 24*4+200
.equ Aki1_s1   , 25*4+200
.equ Ako0_s1   , 26*4+200
.equ Ako1_s1   , 27*4+200
.equ Aku0_s1   , 28*4+200
.equ Aku1_s1   , 29*4+200
.equ Ama0_s1   , 30*4+200
.equ Ama1_s1   , 31*4+200
.equ Ame0_s1   , 32*4+200
.equ Ame1_s1   , 33*4+200
.equ Ami0_s1   , 34*4+200
.equ Ami1_s1   , 35*4+200
.equ Amo0_s1   , 36*4+200
.equ Amo1_s1   , 37*4+200
.equ Amu0_s1   , 38*4+200
.equ Amu1_s1   , 39*4+200
.equ Asa0_s1   , 40*4+200
.equ Asa1_s1   , 41*4+200
.equ Ase0_s1   , 42*4+200
.equ Ase1_s1   , 43*4+200
.equ Asi0_s1   , 44*4+200
.equ Asi1_s1   , 45*4+200
.equ Aso0_s1   , 46*4+200
.equ Aso1_s1   , 47*4+200
.equ Asu0_s1   , 48*4+200
.equ Asu1_s1   , 49*4+200

.equ Aba0_s2   , 0*4+400
.equ Aba1_s2   , 1*4+400
.equ Abe0_s2   , 2*4+400
.equ Abe1_s2   , 3*4+400
.equ Abi0_s2   , 4*4+400
.equ Abi1_s2   , 5*4+400
.equ Abo0_s2   , 6*4+400
.equ Abo1_s2   , 7*4+400
.equ Abu0_s2   , 8*4+400
.equ Abu1_s2   , 9*4+400
.equ Aga0_s2   , 10*4+400
.equ Aga1_s2   , 11*4+400
.equ Age0_s2   , 12*4+400
.equ Age1_s2   , 13*4+400
.equ Agi0_s2   , 14*4+400
.equ Agi1_s2   , 15*4+400
.equ Ago0_s2   , 16*4+400
.equ Ago1_s2   , 17*4+400
.equ Agu0_s2   , 18*4+400
.equ Agu1_s2   , 19*4+400
.equ Aka0_s2   , 20*4+400
.equ Aka1_s2   , 21*4+400
.equ Ake0_s2   , 22*4+400
.equ Ake1_s2   , 23*4+400
.equ Aki0_s2   , 24*4+400
.equ Aki1_s2   , 25*4+400
.equ Ako0_s2   , 26*4+400
.equ Ako1_s2   , 27*4+400
.equ Aku0_s2   , 28*4+400
.equ Aku1_s2   , 29*4+400
.equ Ama0_s2   , 30*4+400
.equ Ama1_s2   , 31*4+400
.equ Ame0_s2   , 32*4+400
.equ Ame1_s2   , 33*4+400
.equ Ami0_s2   , 34*4+400
.equ Ami1_s2   , 35*4+400
.equ Amo0_s2   , 36*4+400
.equ Amo1_s2   , 37*4+400
.equ Amu0_s2   , 38*4+400
.equ Amu1_s2   , 39*4+400
.equ Asa0_s2   , 40*4+400
.equ Asa1_s2   , 41*4+400
.equ Ase0_s2   , 42*4+400
.equ Ase1_s2   , 43*4+400
.equ Asi0_s2   , 44*4+400
.equ Asi1_s2   , 45*4+400
.equ Aso0_s2   , 46*4+400
.equ Aso1_s2   , 47*4+400
.equ Asu0_s2   , 48*4+400
.equ Asu1_s2   , 49*4+400


@----------------------------------------------------------------------------------
@Memory zone B (written in even rounds, read in odd rounds)
@----------------------------------------------------------------------------------


.equ Aba0_s0_M2   , 0*4+600
.equ Aba1_s0_M2   , 1*4+600
.equ Abe0_s0_M2   , 2*4+600
.equ Abe1_s0_M2   , 3*4+600
.equ Abi0_s0_M2   , 4*4+600
.equ Abi1_s0_M2   , 5*4+600
.equ Abo0_s0_M2   , 6*4+600
.equ Abo1_s0_M2   , 7*4+600
.equ Abu0_s0_M2   , 8*4+600
.equ Abu1_s0_M2   , 9*4+600
.equ Aga0_s0_M2   , 10*4+600
.equ Aga1_s0_M2   , 11*4+600
.equ Age0_s0_M2   , 12*4+600
.equ Age1_s0_M2   , 13*4+600
.equ Agi0_s0_M2   , 14*4+600
.equ Agi1_s0_M2   , 15*4+600
.equ Ago0_s0_M2   , 16*4+600
.equ Ago1_s0_M2   , 17*4+600
.equ Agu0_s0_M2   , 18*4+600
.equ Agu1_s0_M2   , 19*4+600
.equ Aka0_s0_M2   , 20*4+600
.equ Aka1_s0_M2   , 21*4+600
.equ Ake0_s0_M2   , 22*4+600
.equ Ake1_s0_M2   , 23*4+600
.equ Aki0_s0_M2   , 24*4+600
.equ Aki1_s0_M2   , 25*4+600
.equ Ako0_s0_M2   , 26*4+600
.equ Ako1_s0_M2   , 27*4+600
.equ Aku0_s0_M2   , 28*4+600
.equ Aku1_s0_M2   , 29*4+600
.equ Ama0_s0_M2   , 30*4+600
.equ Ama1_s0_M2   , 31*4+600
.equ Ame0_s0_M2   , 32*4+600
.equ Ame1_s0_M2   , 33*4+600
.equ Ami0_s0_M2   , 34*4+600
.equ Ami1_s0_M2   , 35*4+600
.equ Amo0_s0_M2   , 36*4+600
.equ Amo1_s0_M2   , 37*4+600
.equ Amu0_s0_M2   , 38*4+600
.equ Amu1_s0_M2   , 39*4+600
.equ Asa0_s0_M2   , 40*4+600
.equ Asa1_s0_M2   , 41*4+600
.equ Ase0_s0_M2   , 42*4+600
.equ Ase1_s0_M2   , 43*4+600
.equ Asi0_s0_M2   , 44*4+600
.equ Asi1_s0_M2   , 45*4+600
.equ Aso0_s0_M2   , 46*4+600
.equ Aso1_s0_M2   , 47*4+600
.equ Asu0_s0_M2   , 48*4+600
.equ Asu1_s0_M2   , 49*4+600


.equ Aba0_s1_M2   , 0*4+800
.equ Aba1_s1_M2   , 1*4+800
.equ Abe0_s1_M2   , 2*4+800
.equ Abe1_s1_M2   , 3*4+800
.equ Abi0_s1_M2   , 4*4+800
.equ Abi1_s1_M2   , 5*4+800
.equ Abo0_s1_M2   , 6*4+800
.equ Abo1_s1_M2   , 7*4+800
.equ Abu0_s1_M2   , 8*4+800
.equ Abu1_s1_M2   , 9*4+800
.equ Aga0_s1_M2   , 10*4+800
.equ Aga1_s1_M2   , 11*4+800
.equ Age0_s1_M2   , 12*4+800
.equ Age1_s1_M2   , 13*4+800
.equ Agi0_s1_M2   , 14*4+800
.equ Agi1_s1_M2   , 15*4+800
.equ Ago0_s1_M2   , 16*4+800
.equ Ago1_s1_M2   , 17*4+800
.equ Agu0_s1_M2   , 18*4+800
.equ Agu1_s1_M2   , 19*4+800
.equ Aka0_s1_M2   , 20*4+800
.equ Aka1_s1_M2   , 21*4+800
.equ Ake0_s1_M2   , 22*4+800
.equ Ake1_s1_M2   , 23*4+800
.equ Aki0_s1_M2   , 24*4+800
.equ Aki1_s1_M2   , 25*4+800
.equ Ako0_s1_M2   , 26*4+800
.equ Ako1_s1_M2   , 27*4+800
.equ Aku0_s1_M2   , 28*4+800
.equ Aku1_s1_M2   , 29*4+800
.equ Ama0_s1_M2   , 30*4+800
.equ Ama1_s1_M2   , 31*4+800
.equ Ame0_s1_M2   , 32*4+800
.equ Ame1_s1_M2   , 33*4+800
.equ Ami0_s1_M2   , 34*4+800
.equ Ami1_s1_M2   , 35*4+800
.equ Amo0_s1_M2   , 36*4+800
.equ Amo1_s1_M2   , 37*4+800
.equ Amu0_s1_M2   , 38*4+800
.equ Amu1_s1_M2   , 39*4+800
.equ Asa0_s1_M2   , 40*4+800
.equ Asa1_s1_M2   , 41*4+800
.equ Ase0_s1_M2   , 42*4+800
.equ Ase1_s1_M2   , 43*4+800
.equ Asi0_s1_M2   , 44*4+800
.equ Asi1_s1_M2   , 45*4+800
.equ Aso0_s1_M2   , 46*4+800
.equ Aso1_s1_M2   , 47*4+800
.equ Asu0_s1_M2   , 48*4+800
.equ Asu1_s1_M2   , 49*4+800


.equ Aba0_s2_M2   , 0*4+1000
.equ Aba1_s2_M2   , 1*4+1000
.equ Abe0_s2_M2   , 2*4+1000
.equ Abe1_s2_M2   , 3*4+1000
.equ Abi0_s2_M2   , 4*4+1000
.equ Abi1_s2_M2   , 5*4+1000
.equ Abo0_s2_M2   , 6*4+1000
.equ Abo1_s2_M2   , 7*4+1000
.equ Abu0_s2_M2   , 8*4+1000
.equ Abu1_s2_M2   , 9*4+1000
.equ Aga0_s2_M2   , 10*4+1000
.equ Aga1_s2_M2   , 11*4+1000
.equ Age0_s2_M2   , 12*4+1000
.equ Age1_s2_M2   , 13*4+1000
.equ Agi0_s2_M2   , 14*4+1000
.equ Agi1_s2_M2   , 15*4+1000
.equ Ago0_s2_M2   , 16*4+1000
.equ Ago1_s2_M2   , 17*4+1000
.equ Agu0_s2_M2   , 18*4+1000
.equ Agu1_s2_M2   , 19*4+1000
.equ Aka0_s2_M2   , 20*4+1000
.equ Aka1_s2_M2   , 21*4+1000
.equ Ake0_s2_M2   , 22*4+1000
.equ Ake1_s2_M2   , 23*4+1000
.equ Aki0_s2_M2   , 24*4+1000
.equ Aki1_s2_M2   , 25*4+1000
.equ Ako0_s2_M2   , 26*4+1000
.equ Ako1_s2_M2   , 27*4+1000
.equ Aku0_s2_M2   , 28*4+1000
.equ Aku1_s2_M2   , 29*4+1000
.equ Ama0_s2_M2   , 30*4+1000
.equ Ama1_s2_M2   , 31*4+1000
.equ Ame0_s2_M2   , 32*4+1000
.equ Ame1_s2_M2   , 33*4+1000
.equ Ami0_s2_M2   , 34*4+1000
.equ Ami1_s2_M2   , 35*4+1000
.equ Amo0_s2_M2   , 36*4+1000
.equ Amo1_s2_M2   , 37*4+1000
.equ Amu0_s2_M2   , 38*4+1000
.equ Amu1_s2_M2   , 39*4+1000
.equ Asa0_s2_M2   , 40*4+1000
.equ Asa1_s2_M2   , 41*4+1000
.equ Ase0_s2_M2   , 42*4+1000
.equ Ase1_s2_M2   , 43*4+1000
.equ Asi0_s2_M2   , 44*4+1000
.equ Asi1_s2_M2   , 45*4+1000
.equ Aso0_s2_M2   , 46*4+1000
.equ Aso1_s2_M2   , 47*4+1000
.equ Asu0_s2_M2   , 48*4+1000
.equ Asu1_s2_M2   , 49*4+1000

@-----------------------------------------------------------------------------------------------------------
@Definition of symbolic variables associated with the memory regions of diffusions for each column and share
@-----------------------------------------------------------------------------------------------------------

@   --- offsets on stack
.equ mDa0_s0   , 0*4+1200
.equ mDa1_s0   , 1*4+1200
.equ mDe0_s0   , 2*4+1200
.equ mDe1_s0   , 3*4+1200
.equ mDi0_s0   , 4*4+1200
.equ mDi1_s0   , 5*4+1200
.equ mDo0_s0   , 6*4+1200
.equ mDo1_s0   , 7*4+1200
.equ mDu0_s0   , 8*4+1200
.equ mDu1_s0   , 9*4+1200

.equ mDa0_s1   , 10*4+1200
.equ mDa1_s1   , 11*4+1200
.equ mDe0_s1   , 12*4+1200
.equ mDe1_s1   , 13*4+1200
.equ mDi0_s1   , 14*4+1200
.equ mDi1_s1   , 15*4+1200
.equ mDo0_s1   , 16*4+1200
.equ mDo1_s1   , 17*4+1200
.equ mDu0_s1   , 18*4+1200
.equ mDu1_s1   , 19*4+1200

.equ mDa0_s2   , 20*4+1200
.equ mDa1_s2   , 21*4+1200
.equ mDe0_s2   , 22*4+1200
.equ mDe1_s2   , 23*4+1200
.equ mDi0_s2   , 24*4+1200
.equ mDi1_s2   , 25*4+1200
.equ mDo0_s2   , 26*4+1200
.equ mDo1_s2   , 27*4+1200
.equ mDu0_s2   , 28*4+1200
.equ mDu1_s2   , 29*4+1200

@----------------------------------------------------------------------------------
@Definition of symbolic variable associated with round counter
@----------------------------------------------------------------------------------

.equ mRC    , 30*4+1200


@----------------------------------------------------------------------------------
@-----------------------------------------XOR5 MACRO-------------------------------
@----------------------------------------------------------------------------------
@Used in theta step (at the beginning of each macro KeccakRound0, KeccakRound1, 
@KeccakRound2, KeccakRound3) to compute the parities C(x) of each column (considering
@a particular half and share). 
@
@It receives as inputs:
@   -i1, i2, i3, i4, i5: memory addresses where 32-bit lanes from the same column, half, and share
@                        are stored in the INPUT SPACE
@   -res: register where the parity value will be stored 
@
@This macro XORs all i1, i2, i3, i4, i5 inputs and stores the result in the "res" register
@
@Equivalent operation: res <-- i1 XOR i2 XOR i3 XOR i4 XOR i5
@
@Intermediate registers: r1, r2, r12
@----------------------------------------------------------------------------------


.macro    xor5      res, i1, i2, i3, i4, i5
    ldr         \res, [r0, #\i1]
    ldr         r1, [r0, #\i2]
    ldr         r2, [r0, #\i3]
    ldr         r12, [r0, #\i4]
    eors        \res, \res, r1
    eors        \res, \res, r2
    eors        \res, \res, r12
    ldr         r1, [r0, #\i5]
    eors        \res, \res, r1
.endm


@----------------------------------------------------------------------------------
@----------------------------------------XORROL MACRO------------------------------
@----------------------------------------------------------------------------------
@Used in theta step (at the beginning of each macro KeccakRound0, KeccakRound1, 
@KeccakRound2, KeccakRound3) to compute the diffusions D(x) of low halfs of the lanes
@in the OUTPUT space.
@
@It receives as inputs:
@   -aa, bb: registers containing the 32-bit half-lanes that will be XORed
@   -res: register where the resulting 
@ 
@This macro XORs the input "aa" with the input "bb" rotated left by 1 bit,
@and stores it in the "res" register.
@
@Equivalent operation: res <-- aa XOR ROTL(bb, 1)
@
@Intermediate registers: None
@----------------------------------------------------------------------------------



.macro    xorrol      res, aa, bb
    eor         \res, \aa, \bb, ROR #31
.endm


@----------------------------------------------------------------------------------
@----------------------------------------OPCHI MACRO-------------------------------
@----------------------------------------------------------------------------------
@Used in the macros KeccakThetaRhoPiChi and KeccakThetaRhoPiChiIota to
@compute the masked Chi function for one given share.
@
@For a given row, it computes the share j of the lane i (Y^i_j) at the output of the 
@Chi step using the 32-bit half-lanes i, i+1, i+2 of the shares j+1, j+2 (X_{j+1}, X_{j+2})
@
@It receives as inputs:
@   -Ia0, Ia1, Ia2: for a given row, registers containing the 32-bit half-lanes i, i+1, i+2 of the share j+1 (GROUP A)
@   -Ib1, Ib2: for a given row, registers containing the 32-bit half-lanes i+1, i+2 of the share j+1 (GROUP B)
@   -memW: memory address where the resulting Y^i_j will be stored
@
@Equivalent operation: Y^i_j <-- f(X_{j+1}, X_{j+2}) = 
@ =X^{i}_{j+1} XOR X^{i+2}_{j+1} XOR (X^{i+1}_{j+1} & X^{i+2}_{j+1}) XOR (X^{i+1}_{j+1} & X^{i+2}_{j+2}) XOR (X^{i+2}_{j+1} & X^{i+1}_{j+2})
@
@Intermediate registers: r1, r2
@----------------------------------------------------------------------------------



.macro    OpChi      memW, Ib1, Ib2, Ia0, Ia1, Ia2
    eors r1, \Ia0, \Ia2
    and r2, \Ia1, \Ia2
    eors r1, r1, r2
    and r2, \Ia1, \Ib2
    eors r1, r1, r2
    and r2, \Ib1, \Ia2 
    eors r1, r1, r2
    str r1, [r0, \memW]
.endm


@----------------------------------------------------------------------------------
@----------------------------------KECCAKTHETARHOPICHI MACRO-----------------------
@----------------------------------------------------------------------------------
@Used in the macros KeccakRound0, KeccakRound1, KeccakRound2, KeccakRound3 to compute
@the steps Theta, Rho, Pi Chi.
@
@It receives as inputs:
@   -reg_Aya, reg_Aye, reg_Ayi, reg_Ayo, reg_Ayu: given the diagonal defined for in-place processing, registers where the half-lanes of a given column (a,e,i,o,u) will be stored. SHARE J+1 (GROUP A) 
@   -reg_AyaB, reg_AyeB, reg_AyiB, reg_AyoB, reg_AyuB: given the diagonal defined for in-place processing, registers where the half-lanes of a given column (a,e,i,o,u) will be stored. SHARE J+2 (GROUP B) 
@   -memAya, memAye, memAyi, memAyo, memAyu: given the diagonal defined for in-place processing, memory addresses where the half-lanes of a given column (a,e,i,o,u) are stored. SHARE J+1 (GROUP A). Accessing memory addresses of share j+2 (Group B) using offsets. 
@   -Dya, Dye, Dyi, Dyo, Dyu: registers where the diffusion values for each half-lane OF THE SHARE 1 are currently stored
@   -memDya, memDye, memDyi, memDyo, memDyu: memory addresses where the diffusion values for each half-lane OF THE SHARE 1 are stored. Memory addresses of shares 0 and 2 computed using offsets. 
@   -rotAya, rotAye, rotAyi, rotAyo, rotAyu: rotation values for each half-lane according to rho step. 
@
@Although the group A and group B of registers contains always {r3-r7} and {r8-r12}, respectively, the association with columns a, b, e, i, o, u varies in each of the four cyclic rounds in order to implement in-place processing in a efficient way
@----------------------------------------------------------------------------------



.macro    KeccakThetaRhoPiChi reg_Aya, memAya, Dya, rotAya, reg_Aye, memAye, Dye, rotAye, reg_Ayi, memAyi, Dyi, rotAyi, reg_Ayo, memAyo, Dyo, rotAyo, reg_Ayu, memAyu, Dyu, rotAyu, reg_AyaB, reg_AyeB, reg_AyiB, reg_AyoB, reg_AyuB, memDya, memDye, memDyi, memDyo, memDyu
    @THETA+RHO APPLIED TO S1
    push {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, lr}


    @Loading the half-lanes of share 1 into the group A registers
    ldr     \reg_Aya, [r0, #\memAya]
    ldr     \reg_Aye, [r0, #\memAye]
    ldr     \reg_Ayi, [r0, #\memAyi]
    ldr     \reg_Ayo, [r0, #\memAyo]
    ldr     \reg_Ayu, [r0, #\memAyu]

    @ Applying diffusion values to the lanes of share 1
    eors    \reg_Aya, \reg_Aya, \Dya
    eors    \reg_Aye, \reg_Aye, \Dye
    eors    \reg_Ayi, \reg_Ayi, \Dyi
    eors    \reg_Ayo, \reg_Ayo, \Dyo
    eors    \reg_Ayu, \reg_Ayu, \Dyu


    @ Applying rotations of the Rho step to the half-lanes of share 1
    rors    \reg_Aya, #32-\rotAya
    .if  \rotAye > 0
        rors    \reg_Aye, #32-\rotAye
    .endif
    rors    \reg_Ayi, #32-\rotAyi
    rors    \reg_Ayo, #32-\rotAyo
    rors    \reg_Ayu, #32-\rotAyu


    @ Storing half-lanes of the share 1 after applying Theta+Rho
    str \reg_Aya, [r0, #\memAya]
    str \reg_Aye, [r0, #\memAye]
    str \reg_Ayi, [r0, #\memAyi]
    str \reg_Ayo, [r0, #\memAyo]
    str \reg_Ayu, [r0, #\memAyu]



    @THETA+RHO APPLIED TO S2 
    @Loading the half-lanes of share 2 into the group B registers 
    @Loading the diffusion values for the half-lanes of share 2 into the auxiliar registers r1, r2, lr
    @Applying diffusion values to the half lanes of share 2
    
    ldr     \reg_AyaB, [r0, #\memAya+200]
    ldr     r1, [r0, #\memDya+40]
    ldr     \reg_AyeB, [r0, #\memAye+200]
    ldr     r2, [r0, #\memDye+40]
    ldr     \reg_AyiB, [r0, #\memAyi+200]
    ldr     lr, [r0, #\memDyi+40]

    eors    \reg_AyaB, \reg_AyaB, r1
    eors    \reg_AyeB, \reg_AyeB, r2
    eors    \reg_AyiB, \reg_AyiB, lr

    ldr     \reg_AyoB, [r0, #\memAyo+200]
    ldr     r1, [r0, #\memDyo+40]
    ldr     \reg_AyuB, [r0, #\memAyu+200]
    ldr     lr, [r0, #\memDyu+40]
    
    eors    \reg_AyoB, \reg_AyoB, r1
    eors    \reg_AyuB, \reg_AyuB, lr   
    
    @ Applying rotations of the Rho step to the half-lanes of share 2
    rors    \reg_AyaB, #32-\rotAya
    .if  \rotAye > 0
        rors    \reg_AyeB, #32-\rotAye
    .endif
    rors    \reg_AyiB, #32-\rotAyi
    rors    \reg_AyoB, #32-\rotAyo
    rors    \reg_AyuB, #32-\rotAyu



    @PI+CHI APPLIED TO SHARE 0 (SHARES 1 - 2). 
    @At this point, the register values are:
    @   - r3-r7: half-lanes of the share 1 with Theta and Rho steps applied (Group A)
    @   - r8-r12: half-lanes of the share 2 with Theta and Rho steps applied (Group B)

    @The following expansions of OpChi macro computes the output share Y_0 from input shares
    @X_1, X_2 and write them in the corresponding memory address according to in-place processing
    @(it will be one of the other positions in the diagonal, but not the same)
    @If we read from memory zone A, we write in the corresponding memory zone B. Else, we have read from memory zone B and we write in the corresponding memory zone A

    push {r1, r2}
    .if     \memAya < 599
        OpChi   #\memAya+400, r9, r10, r3, r4, r5
        OpChi   #\memAye+400, r10, r11, r4, r5, r6
        OpChi   #\memAyi+400, r11, r12, r5, r6, r7
        OpChi   #\memAyo+400, r12, r8, r6, r7, r3
        OpChi   #\memAyu+400, r8, r9, r7, r3, r4
    .else 
        OpChi   #\memAya-800, r9, r10, r3, r4, r5
        OpChi   #\memAye-800, r10, r11, r4, r5, r6
        OpChi   #\memAyi-800, r11, r12, r5, r6, r7
        OpChi   #\memAyo-800, r12, r8, r6, r7, r3
        OpChi   #\memAyu-800, r8, r9, r7, r3, r4
    .endif
    pop {r1, r2}



    @THETA+RHO APPLIED TO S0

    @Loading the half-lanes of share 0 into the group A of registers 
    @Loading the diffusion values for the half-lanes of share 2 into the auxiliar registers r1, r2, lr
    @Applying diffusion values to the half lanes of share 2

    ldr     \reg_Aya, [r0, #\memAya-200]
    ldr     r1, [r0, #\memDya-40]
    ldr     \reg_Aye, [r0, #\memAye-200]
    ldr     r2, [r0, #\memDye-40]
    ldr     \reg_Ayi, [r0, #\memAyi-200]
    ldr     lr, [r0, #\memDyi-40]

    eors    \reg_Aya, \reg_Aya, r1
    eors    \reg_Aye, \reg_Aye, r2
    eors    \reg_Ayi, \reg_Ayi, lr


    ldr     \reg_Ayo, [r0, #\memAyo-200]
    ldr     r1, [r0, #\memDyo-40]
    ldr     \reg_Ayu, [r0, #\memAyu-200]
    ldr     lr, [r0, #\memDyu-40]
    
    eors    \reg_Ayo, \reg_Ayo, r1
    eors    \reg_Ayu, \reg_Ayu, lr
    
    @ Applying rotations of the Rho step to the half-lanes of share 2

    rors    \reg_Aya, #32-\rotAya
    .if  \rotAye > 0
        rors    \reg_Aye, #32-\rotAye
    .endif
    rors    \reg_Ayi, #32-\rotAyi
    rors    \reg_Ayo, #32-\rotAyo
    rors    \reg_Ayu, #32-\rotAyu



    @PI+CHI APPLIED TO SHARE 1 (SHARES 2 - 0)
    @At this point, the register values are:
    @   - r3-r7: half-lanes of the share 0 with Theta and Rho steps applied (Group A)
    @   - r8-r12: half-lanes of the share 2 with Theta and Rho steps applied (Group B)
    @The following expansions of OpChi macro computes the output share Y_1 from input shares
    @X_2, X_0 and write them in the corresponding memory address according to in-place processing
    @(it will be one of the other positions in the diagonal, but not the same)
    @If we read from memory zone A, we write in the corresponding memory zone B. Else, we have read from memory zone B and we write in the corresponding memory zone A
    
    push {r1, r2}
    .if     \memAya < 599
        OpChi   #\memAya+600, r4, r5, r8, r9, r10
        OpChi   #\memAye+600, r5, r6, r9, r10, r11
        OpChi   #\memAyi+600, r6, r7, r10, r11, r12
        OpChi   #\memAyo+600, r7, r3, r11, r12, r8
        OpChi   #\memAyu+600, r3, r4, r12, r8, r9
    .else 
        OpChi   #\memAya-600, r4, r5, r8, r9, r10
        OpChi   #\memAye-600, r5, r6, r9, r10, r11
        OpChi   #\memAyi-600, r6, r7, r10, r11, r12
        OpChi   #\memAyo-600, r7, r3, r11, r12, r8
        OpChi   #\memAyu-600, r3, r4, r12, r8, r9
    .endif
    pop {r1, r2}


    @PI+CHI APPLIED TO SHARE 2 (SHARES 0 - 1). Stack at this point (old --> new): r8-r12: Diffusions, r3-r7: SHARE 1. r3-r7 storing SHARE 0
    
    @Loading the half-lanes of share 1 (Theta+Rho already applied) into the group B of registers 

    ldr     \reg_AyaB, [r0, #\memAya]             
    ldr     \reg_AyeB, [r0, #\memAye]         
    ldr     \reg_AyiB, [r0, #\memAyi]            
    ldr     \reg_AyoB, [r0, #\memAyo]           
    ldr     \reg_AyuB, [r0, #\memAyu]           

    @At this point, the register values are:
    @   - r3-r7: half-lanes of the share 0 with Theta and Rho steps applied (Group A)
    @   - r8-r12: half-lanes of the share 1 with Theta and Rho steps applied (Group B)
    @The following expansions of OpChi macro computes the output share Y_2 from input shares
    @X_0, X_1 and write them in the corresponding memory address according to in-place processing
    @(it will be one of the other positions in the diagonal, but not the same)
    @If we read from memory zone A, we write in the corresponding memory zone B. Else, we have read from memory zone B and we write in the corresponding memory zone A

    push {r1, r2}
    .if     \memAya < 599
        OpChi   #\memAya+800, r9, r10, r3, r4, r5
        OpChi   #\memAye+800, r10, r11, r4, r5, r6
        OpChi   #\memAyi+800, r11, r12, r5, r6, r7
        OpChi   #\memAyo+800, r12, r8, r6, r7, r3
        OpChi   #\memAyu+800, r8, r9, r7, r3, r4
    .else 
        OpChi   #\memAya-400, r9, r10, r3, r4, r5
        OpChi   #\memAye-400, r10, r11, r4, r5, r6
        OpChi   #\memAyi-400, r11, r12, r5, r6, r7
        OpChi   #\memAyo-400, r12, r8, r6, r7, r3
        OpChi   #\memAyu-400, r8, r9, r7, r3, r4
    .endif
    pop {r1, r2}


    pop {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, lr}
.endm



@----------------------------------------------------------------------------------
@--------------------------------KECCAKTHETARHOPICHIIOTA MACRO---------------------
@----------------------------------------------------------------------------------
@Used in the macros KeccakRound0, KeccakRound1, KeccakRound2, KeccakRound3 to compute
@the steps Theta, Rho, Pi, Chi, and apply the Round Constant of Iota step to lane Aba (0,0)
@
@It receives as inputs:
@   -memAya, memAye, memAyi, memAyo, memAyu: given the diagonal defined for in-place processing, memory addresses where the half-lanes of a given column (a,e,i,o,u) are stored. SHARE J+1 (GROUP A). Accessing memory addresses of share j+2 (Group B) using offsets. 
@   -Dya, Dye, Dyi, Dyo, Dyu: registers where the diffusion values for each half-lane OF THE SHARE 1 are currently stored
@   -rotAya, rotAye, rotAyi, rotAyo, rotAyu: rotation values for each half-lane according to rho step. 
@   -memDya, memDye, memDyi, memDyo, memDyu: memory addresses where the diffusion values for each half-lane OF THE SHARE 1 are stored. Memory addresses of shares 0 and 2 computed using offsets. 
@   -offset: offset applied to access to the round constant of Iota step
@   -last: flag to indicate if this is the last Iota applied in the fourth cyclic round
@Registers where lanes will be stores are fixed, due to the fact that this macro processes always the
@same diagonal (Aba, Age, Aki, Amo, Asu) --> Registers {r3-r7} and {r8-r12} of groups A and B, respectively, don't change.

@----------------------------------------------------------------------------------

.macro    KeccakThetaRhoPiChiIota  memAya, Dya, memAye, Dye, rotAye, memAyi, Dyi, rotAyi, memAyo, Dyo, rotAyo, memAyu, Dyu, rotAyu, offset, last, memDya, memDye, memDyi, memDyo, memDyu
    
    @THETA+RHO APPLIED TO S1
    push {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, lr}

    @Loading the half-lanes of share 1 into the group A registers
    ldr     r3, [r0, #\memAya]
    ldr     r4, [r0, #\memAye]
    ldr     r5, [r0, #\memAyi]
    ldr     r6, [r0, #\memAyo]
    ldr     r7, [r0, #\memAyu]

    @ Applying diffusion values to the lanes of share 1
    eors    r3, r3, \Dya
    eors    r4, r4, \Dye
    eors    r5, r5, \Dyi
    eors    r6, r6, \Dyo
    eors    r7, r7, \Dyu

    @ Applying rotations of the Rho step to the half-lanes of share 1
    .if  \rotAye > 0
        rors    r4, #32-\rotAye
    .endif
    rors    r5, #32-\rotAyi
    rors    r6, #32-\rotAyo
    rors    r7, #32-\rotAyu

    @ Storing half-lanes of the share 1 after applying Theta+Rho
    str r3, [r0, #\memAya]
    str r4, [r0, #\memAye]
    str r5, [r0, #\memAyi]
    str r6, [r0, #\memAyo]
    str r7, [r0, #\memAyu]



    @THETA+RHO APPLIED TO S2 
    @Loading the half-lanes of share 2 into the group B registers 
    @Loading the diffusion values for the half-lanes of share 2 into the auxiliar registers r1, r2, lr
    @Applying diffusion values to the half lanes of share 2  
    
    ldr     r8, [r0, #\memAya+200]
    ldr     r1, [r0, #\memDya+40]
    ldr     r9, [r0, #\memAye+200]
    ldr     r2, [r0, #\memDye+40]
    ldr     r10, [r0, #\memAyi+200]
    ldr     lr, [r0, #\memDyi+40]

    eors    r8, r8, r1
    eors    r9, r9, r2
    eors    r10, r10, lr

    ldr     r11, [r0, #\memAyo+200]
    ldr     r1, [r0, #\memDyo+40]
    ldr     r12, [r0, #\memAyu+200]
    ldr     lr, [r0, #\memDyu+40]
    
    eors    r11, r11, r1
    eors    r12, r12, lr

    @ Applying rotations of the Rho step to the half-lanes of share 2     
    .if  \rotAye > 0
        rors    r9, #32-\rotAye
    .endif
    rors    r10, #32-\rotAyi
    rors    r11, #32-\rotAyo
    rors    r12, #32-\rotAyu




    @PI+CHI APPLIED TO SHARE 0 (SHARES 1 - 2)

    @At this point, the register values are:
    @   - r3-r7: half-lanes of the share 1 with Theta and Rho steps applied (Group A)
    @   - r8-r12: half-lanes of the share 2 with Theta and Rho steps applied (Group B)

    @The following expansions of OpChi macro computes the output share Y_0 from input shares
    @X_1, X_2 and write them in the corresponding memory address according to in-place processing
    @(it will be one of the other positions in the diagonal, but not the same)

    @If we read from memory zone A, we write in the corresponding memory zone B. Else, we have read from memory zone B and we write in the corresponding memory zone A
    
    push {r1, r2}
    .if     \memAya < 599
        OpChi   #\memAya+400, r9, r10, r3, r4, r5
        OpChi   #\memAye+400, r10, r11, r4, r5, r6
        OpChi   #\memAyi+400, r11, r12, r5, r6, r7
        OpChi   #\memAyo+400, r12, r8, r6, r7, r3
        OpChi   #\memAyu+400, r8, r9, r7, r3, r4
    .else 
        OpChi   #\memAya-800, r9, r10, r3, r4, r5
        OpChi   #\memAye-800, r10, r11, r4, r5, r6
        OpChi   #\memAyi-800, r11, r12, r5, r6, r7
        OpChi   #\memAyo-800, r12, r8, r6, r7, r3
        OpChi   #\memAyu-800, r8, r9, r7, r3, r4
    .endif
    pop {r1, r2}




    @THETA+RHO APPLIED TO S0. Stack at this point (old --> new): r8-r12: Diffusions, r3-r7: SHARE 1; r8-r12: SHARE 2.

    @Loading the half-lanes of share 0 into the group A of registers 
    @Loading the diffusion values for the half-lanes of share 2 into the auxiliar registers r1, r2, lr
    @Applying diffusion values to the half lanes of share 2

    ldr     r3, [r0, #\memAya-200]
    ldr     r1, [r0, #\memDya-40]
    ldr     r4, [r0, #\memAye-200]
    ldr     r2, [r0, #\memDye-40]
    ldr     r5, [r0, #\memAyi-200]
    ldr     lr, [r0, #\memDyi-40]

    eors    r3, r3, r1
    eors    r4, r4, r2
    eors    r5, r5, lr


    ldr     r6, [r0, #\memAyo-200]
    ldr     r1, [r0, #\memDyo-40]
    ldr     r7, [r0, #\memAyu-200]
    ldr     lr, [r0, #\memDyu-40]
    
    eors    r6, r6, r1
    eors    r7, r7, lr

    @ Applying rotations of the Rho step to the half-lanes of share 2
    .if  \rotAye > 0
        rors    r4, #32-\rotAye
    .endif
    rors    r5, #32-\rotAyi
    rors    r6, #32-\rotAyo
    rors    r7, #32-\rotAyu




    @PI+CHI APPLIED TO SHARE 1 (SHARES 2 - 0)
    @At this point, the register values are:
    @   - r3-r7: half-lanes of the share 0 with Theta and Rho steps applied (Group A)
    @   - r8-r12: half-lanes of the share 2 with Theta and Rho steps applied (Group B)
    @The following expansions of OpChi macro computes the output share Y_1 from input shares
    @X_2, X_0 and write them in the corresponding memory address according to in-place processing
    @(it will be one of the other positions in the diagonal, but not the same)
    @If we read from memory zone A, we write in the corresponding memory zone B. Else, we have read from memory zone B and we write in the corresponding memory zone A

    push {r1, r2}
    .if     \memAya < 599
        OpChi   #\memAya+600, r4, r5, r8, r9, r10
        OpChi   #\memAye+600, r5, r6, r9, r10, r11
        OpChi   #\memAyi+600, r6, r7, r10, r11, r12
        OpChi   #\memAyo+600, r7, r3, r11, r12, r8
        OpChi   #\memAyu+600, r3, r4, r12, r8, r9
    .else 
        OpChi   #\memAya-600, r4, r5, r8, r9, r10
        OpChi   #\memAye-600, r5, r6, r9, r10, r11
        OpChi   #\memAyi-600, r6, r7, r10, r11, r12
        OpChi   #\memAyo-600, r7, r3, r11, r12, r8
        OpChi   #\memAyu-600, r3, r4, r12, r8, r9
    .endif
    pop {r1, r2}



    @PI+CHI APPLIED TO SHARE 2 (SHARES 0 - 1).
    @Loading the half-lanes of share 1 (Theta+Rho already applied) into the group B of registers

    ldr     r8, [r0, #\memAya]
    ldr     r9, [r0, #\memAye]
    ldr     r10, [r0, #\memAyi]
    ldr     r11, [r0, #\memAyo]
    ldr     r12, [r0, #\memAyu]

    @If we read from memory zone A, we write in the corresponding memory zone B. Else, we have read from memory zone B and we write in the corresponding memory zone A
    
    push {r1, r2}
    .if     \memAya < 599
        OpChi   #\memAye+800, r10, r11, r4, r5, r6
        OpChi   #\memAyi+800, r11, r12, r5, r6, r7
        OpChi   #\memAyo+800, r12, r8, r6, r7, r3
        OpChi   #\memAyu+800, r8, r9, r7, r3, r4
    .else 
        OpChi   #\memAye-400, r10, r11, r4, r5, r6
        OpChi   #\memAyi-400, r11, r12, r5, r6, r7
        OpChi   #\memAyo-400, r12, r8, r6, r7, r3
        OpChi   #\memAyu-400, r8, r9, r7, r3, r4
    .endif
    pop {r1, r2}

    @Loading the address where the Round Constants table starts
    ldr     r1, [r0, #mRC]

    @Chi step applied to lane (0,0)
    eors r6, r3, r5
    and r7, r4, r5
    eors r6, r6, r7
    and r7, r4, r10
    eors r6, r6, r7
    and r7, r9, r5
    eors r6, r6, r7  

    @Loading the Round Constant of Iota step applying the input offset to the memory address where the Round Constants table is stored
    ldr     r4, [r1, #\offset]

    @Lane(0,0) XOR RoundConstant 
    eors r6, r6, r4

    .if  \last == 1
    ldr     r4, [r1, #32]!
    str     r1, [r0, #mRC]
    cmp     r4, #0xFF
    .endif

    @Writing-back the lane (0,0) after applying Iota step in the writing memory zone
    .if     \memAya <599
        str     r6, [r0, #\memAya+800]
    .else
        str     r6, [r0, #\memAya-400]
    .endif


    pop {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, lr}
.endm



@----------------------------------------------------------------------------------
@------------------------------------KECCAKROUND0 MACRO----------------------------
@----------------------------------------------------------------------------------
@This macro performs the first cyclic round of Keccak
@----------------------------------------------------------------------------------

.macro    KeccakRound0

    @DIFFUSION SHARE 0
    xor5        r3,  Abu0_s0, Agu0_s0, Aku0_s0, Amu0_s0, Asu0_s0
    xor5        r7, Abe1_s0, Age1_s0, Ake1_s0, Ame1_s0, Ase1_s0
    xorrol      r6, r3, r7
    str         r6, [r0, #mDa0_s0]
    xor5        r6,  Abu1_s0, Agu1_s0, Aku1_s0, Amu1_s0, Asu1_s0
    xor5        lr, Abe0_s0, Age0_s0, Ake0_s0, Ame0_s0, Ase0_s0
    eors        r8, r6, lr
    str         r8, [r0, #mDa1_s0]

    xor5        r5,  Abi0_s0, Agi0_s0, Aki0_s0, Ami0_s0, Asi0_s0
    xorrol      r9, r5, r6
    str         r9, [r0, #mDo0_s0]
    xor5        r4,  Abi1_s0, Agi1_s0, Aki1_s0, Ami1_s0, Asi1_s0
    eors        r3, r3, r4
    str         r3, [r0, #mDo1_s0]

    xor5        r3,  Aba0_s0, Aga0_s0, Aka0_s0, Ama0_s0, Asa0_s0
    xorrol      r10, r3, r4
    str         r10, [r0, #mDe0_s0]
    xor5        r6,  Aba1_s0, Aga1_s0, Aka1_s0, Ama1_s0, Asa1_s0
    eors        r11, r6, r5
    str         r11, [r0, #mDe1_s0]

    xor5        r4,  Abo1_s0, Ago1_s0, Ako1_s0, Amo1_s0, Aso1_s0
    xorrol      r5, lr, r4
    str         r5, [r0, #mDi0_s0]
    xor5        r5,  Abo0_s0, Ago0_s0, Ako0_s0, Amo0_s0, Aso0_s0
    eors        r2, r7, r5
    str         r2, [r0, #mDi1_s0]

    xorrol      r12, r5, r6
    str         r12, [r0, #mDu0_s0]
    eors        lr, r4, r3
    str         lr, [r0, #mDu1_s0]

    @DIFFUSION SHARE 2
    xor5        r3,  Abu0_s2, Agu0_s2, Aku0_s2, Amu0_s2, Asu0_s2
    xor5        r7, Abe1_s2, Age1_s2, Ake1_s2, Ame1_s2, Ase1_s2
    xorrol      r6, r3, r7
    str         r6, [r0, #mDa0_s2]
    xor5        r6,  Abu1_s2, Agu1_s2, Aku1_s2, Amu1_s2, Asu1_s2
    xor5        lr, Abe0_s2, Age0_s2, Ake0_s2, Ame0_s2, Ase0_s2
    eors        r8, r6, lr
    str         r8, [r0, #mDa1_s2]

    xor5        r5,  Abi0_s2, Agi0_s2, Aki0_s2, Ami0_s2, Asi0_s2
    xorrol      r9, r5, r6
    str         r9, [r0, #mDo0_s2]
    xor5        r4,  Abi1_s2, Agi1_s2, Aki1_s2, Ami1_s2, Asi1_s2
    eors        r3, r3, r4
    str         r3, [r0, #mDo1_s2]

    xor5        r3,  Aba0_s2, Aga0_s2, Aka0_s2, Ama0_s2, Asa0_s2
    xorrol      r10, r3, r4
    str         r10, [r0, #mDe0_s2]
    xor5        r6,  Aba1_s2, Aga1_s2, Aka1_s2, Ama1_s2, Asa1_s2
    eors        r11, r6, r5
    str         r11, [r0, #mDe1_s2]

    xor5        r4,  Abo1_s2, Ago1_s2, Ako1_s2, Amo1_s2, Aso1_s2
    xorrol      r5, lr, r4
    str         r5, [r0, #mDi0_s2]
    xor5        r5,  Abo0_s2, Ago0_s2, Ako0_s2, Amo0_s2, Aso0_s2
    eors        r2, r7, r5
    str         r2, [r0, #mDi1_s2]

    xorrol      r12, r5, r6
    str         r12, [r0, #mDu0_s2]
    eors        lr, r4, r3
    str         lr, [r0, #mDu1_s2]

    @DIFFUSION SHARE 1
    xor5        r3,  Abu0_s1, Agu0_s1, Aku0_s1, Amu0_s1, Asu0_s1
    xor5        r7, Abe1_s1, Age1_s1, Ake1_s1, Ame1_s1, Ase1_s1
    xorrol      r6, r3, r7
    str         r6, [r0, #mDa0_s1]
    xor5        r6,  Abu1_s1, Agu1_s1, Aku1_s1, Amu1_s1, Asu1_s1
    xor5        lr, Abe0_s1, Age0_s1, Ake0_s1, Ame0_s1, Ase0_s1
    eors        r8, r6, lr
    str         r8, [r0, #mDa1_s1]

    xor5        r5,  Abi0_s1, Agi0_s1, Aki0_s1, Ami0_s1, Asi0_s1
    xorrol      r9, r5, r6
    str         r9, [r0, #mDo0_s1]
    xor5        r4,  Abi1_s1, Agi1_s1, Aki1_s1, Ami1_s1, Asi1_s1
    eors        r3, r3, r4
    str         r3, [r0, #mDo1_s1]

    xor5        r3,  Aba0_s1, Aga0_s1, Aka0_s1, Ama0_s1, Asa0_s1
    xorrol      r10, r3, r4
    str         r10, [r0, #mDe0_s1]
    xor5        r6,  Aba1_s1, Aga1_s1, Aka1_s1, Ama1_s1, Asa1_s1
    eors        r11, r6, r5
    str         r11, [r0, #mDe1_s1]

    xor5        r4,  Abo1_s1, Ago1_s1, Ako1_s1, Amo1_s1, Aso1_s1
    xorrol      r5, lr, r4
    str         r5, [r0, #mDi0_s1]
    xor5        r5,  Abo0_s1, Ago0_s1, Ako0_s1, Amo0_s1, Aso0_s1
    eors        r2, r7, r5
    str         r2, [r0, #mDi1_s1]

    xorrol      r12, r5, r6
    str         r12, [r0, #mDu0_s1]
    eors        lr, r4, r3
    str         lr, [r0, #mDu1_s1]



    KeccakThetaRhoPiChi r5, Aka1_s1, r8,  2, r6, Ame1_s1, r11, 23, r7, Asi1_s1, r2, 31, r3, Abo0_s1, r9, 14, r4, Agu0_s1, r12, 10, r10, r11, r12, r8, r9, mDa1_s1, mDe1_s1, mDi1_s1, mDo0_s1, mDu0_s1
    KeccakThetaRhoPiChi r7, Asa1_s1, r8,  9, r3, Abe0_s1, r10,  0, r4, Agi1_s1, r2,  3, r5, Ako0_s1, r9, 12, r6, Amu1_s1, lr,  4, r12, r8, r9, r10, r11, mDa1_s1, mDe0_s1, mDi1_s1, mDo0_s1, mDu1_s1
    ldr         r8, [r0, #mDa0_s1]
    KeccakThetaRhoPiChi r4, Aga0_s1, r8, 18, r5, Ake0_s1, r10,  5, r6, Ami1_s1, r2,  8, r7, Aso0_s1, r9, 28, r3, Abu1_s1, lr, 14, r9, r10, r11, r12, r8, mDa0_s1, mDe0_s1, mDi1_s1, mDo0_s1, mDu1_s1
    KeccakThetaRhoPiChi r6, Ama0_s1, r8, 20, r7, Ase1_s1, r11,  1, r3, Abi1_s1, r2, 31, r4, Ago0_s1, r9, 27, r5, Aku0_s1, r12, 19, r11, r12, r8, r9, r10, mDa0_s1, mDe1_s1, mDi1_s1, mDo0_s1, mDu0_s1
    ldr         r9, [r0, #mDo1_s1]
    KeccakThetaRhoPiChiIota  Aba0_s1, r8,          Age0_s1, r10, 22,      Aki1_s1, r2, 22,      Amo1_s1, r9, 11,      Asu0_s1, r12,  7, 0, 0, mDa0_s1, mDe0_s1, mDi1_s1, mDo1_s1, mDu0_s1

    ldr         r2, [r0, #mDi0_s1]
    KeccakThetaRhoPiChi r5, Aka0_s1, r8,  1, r6, Ame0_s1, r10, 22, r7, Asi0_s1, r2, 30, r3, Abo1_s1, r9, 14, r4, Agu1_s1, lr, 10, r10, r11, r12, r8, r9, mDa0_s1, mDe0_s1, mDi0_s1, mDo1_s1, mDu1_s1
    KeccakThetaRhoPiChi r7, Asa0_s1, r8,  9, r3, Abe1_s1, r11,  1, r4, Agi0_s1, r2,  3, r5, Ako1_s1, r9, 13, r6, Amu0_s1, r12,  4, r12, r8, r9, r10, r11, mDa0_s1, mDe1_s1, mDi0_s1, mDo1_s1, mDu0_s1
    ldr         r8, [r0, #mDa1_s1]
    KeccakThetaRhoPiChi r4, Aga1_s1, r8, 18, r5, Ake1_s1, r11,  5, r6, Ami0_s1, r2,  7, r7, Aso1_s1, r9, 28, r3, Abu0_s1, r12, 13, r9, r10, r11, r12, r8, mDa1_s1, mDe1_s1, mDi0_s1, mDo1_s1, mDu0_s1
    KeccakThetaRhoPiChi r6, Ama1_s1, r8, 21, r7, Ase0_s1, r10,  1, r3, Abi0_s1, r2, 31, r4, Ago1_s1, r9, 28, r5, Aku1_s1, lr, 20, r11, r12, r8, r9, r10, mDa1_s1, mDe0_s1, mDi0_s1, mDo1_s1, mDu1_s1
    ldr         r9, [r0, #mDo0_s1]
    KeccakThetaRhoPiChiIota  Aba1_s1, r8,          Age1_s1, r11, 22,      Aki0_s1, r2, 21,      Amo0_s1, r9, 10,      Asu1_s1, lr,  7, 4, 0, mDa1_s1, mDe1_s1, mDi0_s1, mDo0_s1, mDu1_s1
.endm


@----------------------------------------------------------------------------------
@------------------------------------KECCAKROUND1 MACRO----------------------------
@----------------------------------------------------------------------------------
@This macro performs the second cyclic round of Keccak
@----------------------------------------------------------------------------------


.macro    KeccakRound1
    @DIFFUSION SHARE 0
    xor5        r3,  Asu0_s0_M2, Agu0_s0_M2, Amu0_s0_M2, Abu1_s0_M2, Aku1_s0_M2
    xor5        r7,  Age1_s0_M2, Ame0_s0_M2, Abe0_s0_M2, Ake1_s0_M2, Ase1_s0_M2
    xorrol      r6, r3, r7
    str         r6, [r0, #mDa0_s0]
    xor5        r6,  Asu1_s0_M2, Agu1_s0_M2, Amu1_s0_M2, Abu0_s0_M2, Aku0_s0_M2
    xor5        lr,  Age0_s0_M2, Ame1_s0_M2, Abe1_s0_M2, Ake0_s0_M2, Ase0_s0_M2
    eors        r8, r6, lr
    str         r8, [r0, #mDa1_s0]

    xor5        r5,  Aki1_s0_M2, Asi1_s0_M2, Agi0_s0_M2, Ami1_s0_M2, Abi0_s0_M2
    xorrol      r9, r5, r6
    str         r9, [r0, #mDo0_s0]
    xor5        r4,  Aki0_s0_M2, Asi0_s0_M2, Agi1_s0_M2, Ami0_s0_M2, Abi1_s0_M2
    eors        r3, r3, r4
    str         r3, [r0, #mDo1_s0]

    xor5        r3,  Aba0_s0_M2, Aka1_s0_M2, Asa0_s0_M2, Aga0_s0_M2, Ama1_s0_M2
    xorrol      r10, r3, r4
    str         r10, [r0, #mDe0_s0]
    xor5        r6,  Aba1_s0_M2, Aka0_s0_M2, Asa1_s0_M2, Aga1_s0_M2, Ama0_s0_M2
    eors        r11, r6, r5
    str         r11, [r0, #mDe1_s0]

    xor5        r4,  Amo0_s0_M2, Abo1_s0_M2, Ako0_s0_M2, Aso1_s0_M2, Ago0_s0_M2
    xorrol      r5, lr, r4
    str         r5, [r0, #mDi0_s0]
    xor5        r5,  Amo1_s0_M2, Abo0_s0_M2, Ako1_s0_M2, Aso0_s0_M2, Ago1_s0_M2
    eors        r2, r7, r5
    str         r2, [r0, #mDi1_s0]

    xorrol      r12, r5, r6
    str         r12, [r0, #mDu0_s0]
    eors        lr, r4, r3
    str         lr, [r0, #mDu1_s0]



    @DIFFUSION SHARE 2
    xor5        r3,  Asu0_s2_M2, Agu0_s2_M2, Amu0_s2_M2, Abu1_s2_M2, Aku1_s2_M2
    xor5        r7,  Age1_s2_M2, Ame0_s2_M2, Abe0_s2_M2, Ake1_s2_M2, Ase1_s2_M2
    xorrol      r6, r3, r7
    str         r6, [r0, #mDa0_s2]
    xor5        r6,  Asu1_s2_M2, Agu1_s2_M2, Amu1_s2_M2, Abu0_s2_M2, Aku0_s2_M2
    xor5        lr,  Age0_s2_M2, Ame1_s2_M2, Abe1_s2_M2, Ake0_s2_M2, Ase0_s2_M2
    eors        r8, r6, lr
    str         r8, [r0, #mDa1_s2]

    xor5        r5,  Aki1_s2_M2, Asi1_s2_M2, Agi0_s2_M2, Ami1_s2_M2, Abi0_s2_M2
    xorrol      r9, r5, r6
    str         r9, [r0, #mDo0_s2]
    xor5        r4,  Aki0_s2_M2, Asi0_s2_M2, Agi1_s2_M2, Ami0_s2_M2, Abi1_s2_M2
    eors        r3, r3, r4
    str         r3, [r0, #mDo1_s2]

    xor5        r3,  Aba0_s2_M2, Aka1_s2_M2, Asa0_s2_M2, Aga0_s2_M2, Ama1_s2_M2
    xorrol      r10, r3, r4
    str         r10, [r0, #mDe0_s2]
    xor5        r6,  Aba1_s2_M2, Aka0_s2_M2, Asa1_s2_M2, Aga1_s2_M2, Ama0_s2_M2
    eors        r11, r6, r5
    str         r11, [r0, #mDe1_s2]

    xor5        r4,  Amo0_s2_M2, Abo1_s2_M2, Ako0_s2_M2, Aso1_s2_M2, Ago0_s2_M2
    xorrol      r5, lr, r4
    str         r5, [r0, #mDi0_s2]
    xor5        r5,  Amo1_s2_M2, Abo0_s2_M2, Ako1_s2_M2, Aso0_s2_M2, Ago1_s2_M2
    eors        r2, r7, r5
    str         r2, [r0, #mDi1_s2]

    xorrol      r12, r5, r6
    str         r12, [r0, #mDu0_s2]
    eors        lr, r4, r3
    str         lr, [r0, #mDu1_s2]

    @DIFFUSION SHARE 1
    xor5        r3,  Asu0_s1_M2, Agu0_s1_M2, Amu0_s1_M2, Abu1_s1_M2, Aku1_s1_M2
    xor5        r7,  Age1_s1_M2, Ame0_s1_M2, Abe0_s1_M2, Ake1_s1_M2, Ase1_s1_M2
    xorrol      r6, r3, r7
    str         r6, [r0, #mDa0_s1]
    xor5        r6,  Asu1_s1_M2, Agu1_s1_M2, Amu1_s1_M2, Abu0_s1_M2, Aku0_s1_M2
    xor5        lr,  Age0_s1_M2, Ame1_s1_M2, Abe1_s1_M2, Ake0_s1_M2, Ase0_s1_M2
    eors        r8, r6, lr
    str         r8, [r0, #mDa1_s1]

    xor5        r5,  Aki1_s1_M2, Asi1_s1_M2, Agi0_s1_M2, Ami1_s1_M2, Abi0_s1_M2
    xorrol      r9, r5, r6
    str         r9, [r0, #mDo0_s1]
    xor5        r4,  Aki0_s1_M2, Asi0_s1_M2, Agi1_s1_M2, Ami0_s1_M2, Abi1_s1_M2
    eors        r3, r3, r4
    str         r3, [r0, #mDo1_s1]

    xor5        r3,  Aba0_s1_M2, Aka1_s1_M2, Asa0_s1_M2, Aga0_s1_M2, Ama1_s1_M2
    xorrol      r10, r3, r4
    str         r10, [r0, #mDe0_s1]
    xor5        r6,  Aba1_s1_M2, Aka0_s1_M2, Asa1_s1_M2, Aga1_s1_M2, Ama0_s1_M2
    eors        r11, r6, r5
    str         r11, [r0, #mDe1_s1]

    xor5        r4,  Amo0_s1_M2, Abo1_s1_M2, Ako0_s1_M2, Aso1_s1_M2, Ago0_s1_M2
    xorrol      r5, lr, r4
    str         r5, [r0, #mDi0_s1]
    xor5        r5,  Amo1_s1_M2, Abo0_s1_M2, Ako1_s1_M2, Aso0_s1_M2, Ago1_s1_M2
    eors        r2, r7, r5
    str         r2, [r0, #mDi1_s1]

    xorrol      r12, r5, r6
    str         r12, [r0, #mDu0_s1]
    eors        lr, r4, r3
    str         lr, [r0, #mDu1_s1]


    KeccakThetaRhoPiChi r5, Asa1_s1_M2, r8,  2, r6, Ake1_s1_M2, r11, 23, r7, Abi1_s1_M2, r2, 31, r3, Amo1_s1_M2, r9, 14, r4, Agu0_s1_M2, r12, 10, r10, r11, r12, r8, r9, mDa1_s1, mDe1_s1, mDi1_s1, mDo0_s1, mDu0_s1
    KeccakThetaRhoPiChi r7, Ama0_s1_M2, r8,  9, r3, Age0_s1_M2, r10,  0, r4, Asi0_s1_M2, r2,  3, r5, Ako1_s1_M2, r9, 12, r6, Abu0_s1_M2, lr,  4, r12, r8, r9, r10, r11, mDa1_s1, mDe0_s1, mDi1_s1, mDo0_s1, mDu1_s1
    ldr         r8, [r0, #mDa0_s1]
    KeccakThetaRhoPiChi r4, Aka1_s1_M2, r8, 18, r5, Abe1_s1_M2, r10,  5, r6, Ami0_s1_M2, r2,  8, r7, Ago1_s1_M2, r9, 28, r3, Asu1_s1_M2, lr, 14, r9, r10, r11, r12, r8, mDa0_s1, mDe0_s1, mDi1_s1, mDo0_s1, mDu1_s1
    KeccakThetaRhoPiChi r6, Aga0_s1_M2, r8, 20, r7, Ase1_s1_M2, r11,  1, r3, Aki0_s1_M2, r2, 31, r4, Abo0_s1_M2, r9, 27, r5, Amu0_s1_M2, r12, 19, r11, r12, r8, r9, r10, mDa0_s1, mDe1_s1, mDi1_s1, mDo0_s1, mDu0_s1
    ldr         r9, [r0, #mDo1_s1]
    KeccakThetaRhoPiChiIota  Aba0_s1_M2, r8,          Ame1_s1_M2, r10, 22,      Agi1_s1_M2, r2, 22,      Aso1_s1_M2, r9, 11,      Aku1_s1_M2, r12,  7, 8, 0, mDa0_s1, mDe0_s1, mDi1_s1, mDo1_s1, mDu0_s1

    ldr         r2, [r0, #mDi0_s1]
    KeccakThetaRhoPiChi r5, Asa0_s1_M2, r8,  1, r6, Ake0_s1_M2, r10, 22, r7, Abi0_s1_M2, r2, 30, r3, Amo0_s1_M2, r9, 14, r4, Agu1_s1_M2, lr, 10, r10, r11, r12, r8, r9, mDa0_s1, mDe0_s1, mDi0_s1, mDo1_s1, mDu1_s1
    KeccakThetaRhoPiChi r7, Ama1_s1_M2, r8,  9, r3, Age1_s1_M2, r11,  1, r4, Asi1_s1_M2, r2,  3, r5, Ako0_s1_M2, r9, 13, r6, Abu1_s1_M2, r12,  4, r12, r8, r9, r10, r11, mDa0_s1, mDe1_s1, mDi0_s1, mDo1_s1, mDu0_s1
    ldr         r8, [r0, #mDa1_s1]
    KeccakThetaRhoPiChi r4, Aka0_s1_M2, r8, 18, r5, Abe0_s1_M2, r11,  5, r6, Ami1_s1_M2, r2,  7, r7, Ago0_s1_M2, r9, 28, r3, Asu0_s1_M2, r12, 13, r9, r10, r11, r12, r8, mDa1_s1, mDe1_s1, mDi0_s1, mDo1_s1, mDu0_s1
    KeccakThetaRhoPiChi r6, Aga1_s1_M2, r8, 21, r7, Ase0_s1_M2, r10,  1, r3, Aki1_s1_M2, r2, 31, r4, Abo1_s1_M2, r9, 28, r5, Amu1_s1_M2, lr, 20, r11, r12, r8, r9, r10, mDa1_s1, mDe0_s1, mDi0_s1, mDo1_s1, mDu1_s1
    ldr         r9, [r0, #mDo0_s1]
    KeccakThetaRhoPiChiIota  Aba1_s1_M2, r8,          Ame0_s1_M2, r11, 22,      Agi0_s1_M2, r2, 21,      Aso0_s1_M2, r9, 10,      Aku0_s1_M2, lr,  7, 12, 0, mDa1_s1, mDe1_s1, mDi0_s1, mDo0_s1, mDu1_s1

.endm


@----------------------------------------------------------------------------------
@------------------------------------KECCAKROUND2 MACRO----------------------------
@----------------------------------------------------------------------------------
@This macro performs the third cyclic round of Keccak
@----------------------------------------------------------------------------------

.macro KeccakRound2
    @DIFFUSION SHARE 0
    xor5        r3, Aku1_s0, Agu0_s0, Abu1_s0, Asu1_s0, Amu1_s0
    xor5        r7, Ame0_s0, Ake0_s0, Age0_s0, Abe0_s0, Ase1_s0
    xorrol      r6, r3, r7
    str         r6, [r0, #mDa0_s0]
    xor5        r6,  Aku0_s0, Agu1_s0, Abu0_s0, Asu0_s0, Amu0_s0
    xor5        lr, Ame1_s0, Ake1_s0, Age1_s0, Abe1_s0, Ase0_s0
    eors        r8, r6, lr
    str         r8, [r0, #mDa1_s0]

    xor5        r5,  Agi1_s0, Abi1_s0, Asi1_s0, Ami0_s0, Aki1_s0
    xorrol      r9, r5, r6
    str         r9, [r0, #mDo0_s0]
    xor5        r4,  Agi0_s0, Abi0_s0, Asi0_s0, Ami1_s0, Aki0_s0
    eors        r3, r3, r4
    str         r3, [r0, #mDo1_s0]

    xor5        r3,  Aba0_s0, Asa1_s0, Ama1_s0, Aka1_s0, Aga1_s0
    xorrol      r10, r3, r4
    str         r10, [r0, #mDe0_s0]
    xor5        r6,  Aba1_s0, Asa0_s0, Ama0_s0, Aka0_s0, Aga0_s0
    eors        r11, r6, r5
    str         r11, [r0, #mDe1_s0]

    xor5        r4,  Aso0_s0, Amo0_s0, Ako1_s0, Ago0_s0, Abo0_s0
    xorrol      r5, lr, r4
    str         r5, [r0, #mDi0_s0]
    xor5        r5,  Aso1_s0, Amo1_s0, Ako0_s0, Ago1_s0, Abo1_s0
    eors        r2, r7, r5
    str         r2, [r0, #mDi1_s0]

    xorrol      r12, r5, r6
    str         r12, [r0, #mDu0_s0]
    eors        lr, r4, r3
    str         lr, [r0, #mDu1_s0]


    @DIFFUSION SHARE 2
    xor5        r3, Aku1_s2, Agu0_s2, Abu1_s2, Asu1_s2, Amu1_s2
    xor5        r7, Ame0_s2, Ake0_s2, Age0_s2, Abe0_s2, Ase1_s2
    xorrol      r6, r3, r7
    str         r6, [r0, #mDa0_s2]
    xor5        r6,  Aku0_s2, Agu1_s2, Abu0_s2, Asu0_s2, Amu0_s2
    xor5        lr, Ame1_s2, Ake1_s2, Age1_s2, Abe1_s2, Ase0_s2
    eors        r8, r6, lr
    str         r8, [r0, #mDa1_s2]

    xor5        r5,  Agi1_s2, Abi1_s2, Asi1_s2, Ami0_s2, Aki1_s2
    xorrol      r9, r5, r6
    str         r9, [r0, #mDo0_s2]
    xor5        r4,  Agi0_s2, Abi0_s2, Asi0_s2, Ami1_s2, Aki0_s2
    eors        r3, r3, r4
    str         r3, [r0, #mDo1_s2]

    xor5        r3,  Aba0_s2, Asa1_s2, Ama1_s2, Aka1_s2, Aga1_s2
    xorrol      r10, r3, r4
    str         r10, [r0, #mDe0_s2]
    xor5        r6,  Aba1_s2, Asa0_s2, Ama0_s2, Aka0_s2, Aga0_s2
    eors        r11, r6, r5
    str         r11, [r0, #mDe1_s2]

    xor5        r4,  Aso0_s2, Amo0_s2, Ako1_s2, Ago0_s2, Abo0_s2
    xorrol      r5, lr, r4
    str         r5, [r0, #mDi0_s2]
    xor5        r5,  Aso1_s2, Amo1_s2, Ako0_s2, Ago1_s2, Abo1_s2
    eors        r2, r7, r5
    str         r2, [r0, #mDi1_s2]

    xorrol      r12, r5, r6
    str         r12, [r0, #mDu0_s2]
    eors        lr, r4, r3
    str         lr, [r0, #mDu1_s2]


    @DIFFUSION SHARE 1
    xor5        r3, Aku1_s1, Agu0_s1, Abu1_s1, Asu1_s1, Amu1_s1
    xor5        r7, Ame0_s1, Ake0_s1, Age0_s1, Abe0_s1, Ase1_s1
    xorrol      r6, r3, r7
    str         r6, [r0, #mDa0_s1]
    xor5        r6,  Aku0_s1, Agu1_s1, Abu0_s1, Asu0_s1, Amu0_s1
    xor5        lr, Ame1_s1, Ake1_s1, Age1_s1, Abe1_s1, Ase0_s1
    eors        r8, r6, lr
    str         r8, [r0, #mDa1_s1]

    xor5        r5,  Agi1_s1, Abi1_s1, Asi1_s1, Ami0_s1, Aki1_s1
    xorrol      r9, r5, r6
    str         r9, [r0, #mDo0_s1]
    xor5        r4,  Agi0_s1, Abi0_s1, Asi0_s1, Ami1_s1, Aki0_s1
    eors        r3, r3, r4
    str         r3, [r0, #mDo1_s1]

    xor5        r3,  Aba0_s1, Asa1_s1, Ama1_s1, Aka1_s1, Aga1_s1
    xorrol      r10, r3, r4
    str         r10, [r0, #mDe0_s1]
    xor5        r6,  Aba1_s1, Asa0_s1, Ama0_s1, Aka0_s1, Aga0_s1
    eors        r11, r6, r5
    str         r11, [r0, #mDe1_s1]

    xor5        r4,  Aso0_s1, Amo0_s1, Ako1_s1, Ago0_s1, Abo0_s1
    xorrol      r5, lr, r4
    str         r5, [r0, #mDi0_s1]
    xor5        r5,  Aso1_s1, Amo1_s1, Ako0_s1, Ago1_s1, Abo1_s1
    eors        r2, r7, r5
    str         r2, [r0, #mDi1_s1]

    xorrol      r12, r5, r6
    str         r12, [r0, #mDu0_s1]
    eors        lr, r4, r3
    str         lr, [r0, #mDu1_s1]

    KeccakThetaRhoPiChi r5, Ama0_s1, r8,  2, r6, Abe0_s1, r11, 23, r7, Aki0_s1, r2, 31, r3, Aso1_s1, r9, 14, r4, Agu0_s1, r12, 10, r10, r11, r12, r8, r9, mDa1_s1, mDe1_s1, mDi1_s1, mDo0_s1, mDu0_s1
    KeccakThetaRhoPiChi r7, Aga0_s1, r8,  9, r3, Ame1_s1, r10,  0, r4, Abi0_s1, r2,  3, r5, Ako0_s1, r9, 12, r6, Asu0_s1, lr,  4, r12, r8, r9, r10, r11, mDa1_s1, mDe0_s1, mDi1_s1, mDo0_s1, mDu1_s1
    ldr         r8, [r0, #mDa0_s1]
    KeccakThetaRhoPiChi r4, Asa1_s1, r8, 18, r5, Age1_s1, r10,  5, r6, Ami1_s1, r2,  8, r7, Abo1_s1, r9, 28, r3, Aku0_s1, lr, 14, r9, r10, r11, r12, r8, mDa0_s1, mDe0_s1, mDi1_s1, mDo0_s1, mDu1_s1
    KeccakThetaRhoPiChi r6, Aka1_s1, r8, 20, r7, Ase1_s1, r11,  1, r3, Agi0_s1, r2, 31, r4, Amo1_s1, r9, 27, r5, Abu1_s1, r12, 19, r11, r12, r8, r9, r10, mDa0_s1, mDe1_s1, mDi1_s1, mDo0_s1, mDu0_s1
    ldr         r9, [r0, #mDo1_s1]
    KeccakThetaRhoPiChiIota  Aba0_s1, r8,          Ake1_s1, r10, 22,      Asi0_s1, r2, 22,      Ago0_s1, r9, 11,      Amu1_s1, r12,  7, 16, 0, mDa0_s1, mDe0_s1, mDi1_s1, mDo1_s1, mDu0_s1

    ldr         r2, [r0, #mDi0_s1]
    KeccakThetaRhoPiChi r5, Ama1_s1, r8,  1, r6, Abe1_s1, r10, 22, r7, Aki1_s1, r2, 30, r3, Aso0_s1, r9, 14, r4, Agu1_s1, lr, 10, r10, r11, r12, r8, r9, mDa0_s1, mDe0_s1, mDi0_s1, mDo1_s1, mDu1_s1
    KeccakThetaRhoPiChi r7, Aga1_s1, r8,  9, r3, Ame0_s1, r11,  1, r4, Abi1_s1, r2,  3, r5, Ako1_s1, r9, 13, r6, Asu1_s1, r12,  4, r12, r8, r9, r10, r11, mDa0_s1, mDe1_s1, mDi0_s1, mDo1_s1, mDu0_s1
    ldr         r8, [r0, #mDa1_s1]
    KeccakThetaRhoPiChi r4, Asa0_s1, r8, 18, r5, Age0_s1, r11,  5, r6, Ami0_s1, r2,  7, r7, Abo0_s1, r9, 28, r3, Aku1_s1, r12, 13, r9, r10, r11, r12, r8, mDa1_s1, mDe1_s1, mDi0_s1, mDo1_s1, mDu0_s1
    KeccakThetaRhoPiChi r6, Aka0_s1, r8, 21, r7, Ase0_s1, r10,  1, r3, Agi1_s1, r2, 31, r4, Amo0_s1, r9, 28, r5, Abu0_s1, lr, 20, r11, r12, r8, r9, r10, mDa1_s1, mDe0_s1, mDi0_s1, mDo1_s1, mDu1_s1
    ldr         r9, [r0, #mDo0_s1]
    KeccakThetaRhoPiChiIota  Aba1_s1, r8,          Ake0_s1, r11, 22,      Asi1_s1, r2, 21,      Ago1_s1, r9, 10,      Amu0_s1, lr,  7, 20, 0, mDa1_s1, mDe1_s1, mDi0_s1, mDo0_s1, mDu1_s1
.endm

@----------------------------------------------------------------------------------
@------------------------------------KECCAKROUND3 MACRO----------------------------
@----------------------------------------------------------------------------------
@This macro performs the fourth cyclic round of Keccak
@----------------------------------------------------------------------------------


.macro KeccakRound3
    @DIFFUSION SHARE 0
    xor5        r3,  Amu1_s0_M2, Agu0_s0_M2, Asu1_s0_M2, Aku0_s0_M2, Abu0_s0_M2
    xor5        r7, Ake0_s0_M2, Abe1_s0_M2, Ame1_s0_M2, Age0_s0_M2, Ase1_s0_M2
    xorrol      r6, r3, r7
    str         r6, [r0, #mDa0_s0]
    xor5        r6,  Amu0_s0_M2, Agu1_s0_M2, Asu0_s0_M2, Aku1_s0_M2, Abu1_s0_M2
    xor5        lr, Ake1_s0_M2, Abe0_s0_M2, Ame0_s0_M2, Age1_s0_M2, Ase0_s0_M2
    eors        r8, r6, lr
    str         r8, [r0, #mDa1_s0]

    xor5        r5,  Asi0_s0_M2, Aki0_s0_M2, Abi1_s0_M2, Ami1_s0_M2, Agi1_s0_M2
    xorrol      r9, r5, r6
    str         r9, [r0, #mDo0_s0]
    xor5        r4,  Asi1_s0_M2, Aki1_s0_M2, Abi0_s0_M2, Ami0_s0_M2, Agi0_s0_M2
    eors        r3, r3, r4
    str         r3, [r0, #mDo1_s0]

    xor5        r3,  Aba0_s0_M2, Ama0_s0_M2, Aga1_s0_M2, Asa1_s0_M2, Aka0_s0_M2
    xorrol      r10, r3, r4
    str         r10, [r0, #mDe0_s0]
    xor5        r6,  Aba1_s0_M2, Ama1_s0_M2, Aga0_s0_M2, Asa0_s0_M2, Aka1_s0_M2
    eors        r11, r6, r5
    str         r11, [r0, #mDe1_s0]

    xor5        r4,  Ago1_s0_M2, Aso0_s0_M2, Ako0_s0_M2, Abo0_s0_M2, Amo1_s0_M2
    xorrol      r5, lr, r4
    str         r5, [r0, #mDi0_s0]
    xor5        r5,  Ago0_s0_M2, Aso1_s0_M2, Ako1_s0_M2, Abo1_s0_M2, Amo0_s0_M2
    eors        r2, r7, r5
    str         r2, [r0, #mDi1_s0]

    xorrol      r12, r5, r6
    str         r12, [r0, #mDu0_s0]
    eors        lr, r4, r3
    str         lr, [r0, #mDu1_s0]



    @DIFFUSION SHARE 2
    xor5        r3,  Amu1_s2_M2, Agu0_s2_M2, Asu1_s2_M2, Aku0_s2_M2, Abu0_s2_M2
    xor5        r7, Ake0_s2_M2, Abe1_s2_M2, Ame1_s2_M2, Age0_s2_M2, Ase1_s2_M2
    xorrol      r6, r3, r7
    str         r6, [r0, #mDa0_s2]
    xor5        r6,  Amu0_s2_M2, Agu1_s2_M2, Asu0_s2_M2, Aku1_s2_M2, Abu1_s2_M2
    xor5        lr, Ake1_s2_M2, Abe0_s2_M2, Ame0_s2_M2, Age1_s2_M2, Ase0_s2_M2
    eors        r8, r6, lr
    str         r8, [r0, #mDa1_s2]

    xor5        r5,  Asi0_s2_M2, Aki0_s2_M2, Abi1_s2_M2, Ami1_s2_M2, Agi1_s2_M2
    xorrol      r9, r5, r6
    str         r9, [r0, #mDo0_s2]
    xor5        r4,  Asi1_s2_M2, Aki1_s2_M2, Abi0_s2_M2, Ami0_s2_M2, Agi0_s2_M2
    eors        r3, r3, r4
    str         r3, [r0, #mDo1_s2]

    xor5        r3,  Aba0_s2_M2, Ama0_s2_M2, Aga1_s2_M2, Asa1_s2_M2, Aka0_s2_M2
    xorrol      r10, r3, r4
    str         r10, [r0, #mDe0_s2]
    xor5        r6,  Aba1_s2_M2, Ama1_s2_M2, Aga0_s2_M2, Asa0_s2_M2, Aka1_s2_M2
    eors        r11, r6, r5
    str         r11, [r0, #mDe1_s2]

    xor5        r4,  Ago1_s2_M2, Aso0_s2_M2, Ako0_s2_M2, Abo0_s2_M2, Amo1_s2_M2
    xorrol      r5, lr, r4
    str         r5, [r0, #mDi0_s2]
    xor5        r5,  Ago0_s2_M2, Aso1_s2_M2, Ako1_s2_M2, Abo1_s2_M2, Amo0_s2_M2
    eors        r2, r7, r5
    str         r2, [r0, #mDi1_s2]

    xorrol      r12, r5, r6
    str         r12, [r0, #mDu0_s2]
    eors        lr, r4, r3
    str         lr, [r0, #mDu1_s2]



    @DIFFUSION SHARE 1
    xor5        r3,  Amu1_s1_M2, Agu0_s1_M2, Asu1_s1_M2, Aku0_s1_M2, Abu0_s1_M2
    xor5        r7, Ake0_s1_M2, Abe1_s1_M2, Ame1_s1_M2, Age0_s1_M2, Ase1_s1_M2
    xorrol      r6, r3, r7
    str         r6, [r0, #mDa0_s1]
    xor5        r6,  Amu0_s1_M2, Agu1_s1_M2, Asu0_s1_M2, Aku1_s1_M2, Abu1_s1_M2
    xor5        lr, Ake1_s1_M2, Abe0_s1_M2, Ame0_s1_M2, Age1_s1_M2, Ase0_s1_M2
    eors        r8, r6, lr
    str         r8, [r0, #mDa1_s1]

    xor5        r5,  Asi0_s1_M2, Aki0_s1_M2, Abi1_s1_M2, Ami1_s1_M2, Agi1_s1_M2
    xorrol      r9, r5, r6
    str         r9, [r0, #mDo0_s1]
    xor5        r4,  Asi1_s1_M2, Aki1_s1_M2, Abi0_s1_M2, Ami0_s1_M2, Agi0_s1_M2
    eors        r3, r3, r4
    str         r3, [r0, #mDo1_s1]

    xor5        r3,  Aba0_s1_M2, Ama0_s1_M2, Aga1_s1_M2, Asa1_s1_M2, Aka0_s1_M2
    xorrol      r10, r3, r4
    str         r10, [r0, #mDe0_s1]
    xor5        r6,  Aba1_s1_M2, Ama1_s1_M2, Aga0_s1_M2, Asa0_s1_M2, Aka1_s1_M2
    eors        r11, r6, r5
    str         r11, [r0, #mDe1_s1]

    xor5        r4,  Ago1_s1_M2, Aso0_s1_M2, Ako0_s1_M2, Abo0_s1_M2, Amo1_s1_M2
    xorrol      r5, lr, r4
    str         r5, [r0, #mDi0_s1]
    xor5        r5,  Ago0_s1_M2, Aso1_s1_M2, Ako1_s1_M2, Abo1_s1_M2, Amo0_s1_M2
    eors        r2, r7, r5
    str         r2, [r0, #mDi1_s1]

    xorrol      r12, r5, r6
    str         r12, [r0, #mDu0_s1]
    eors        lr, r4, r3
    str         lr, [r0, #mDu1_s1]




KeccakThetaRhoPiChi r5, Aga0_s1_M2, r8,  2, r6, Age0_s1_M2, r11, 23, r7, Agi0_s1_M2, r2, 31, r3, Ago0_s1_M2, r9, 14, r4, Agu0_s1_M2, r12, 10, r10, r11, r12, r8, r9, mDa1_s1, mDe1_s1, mDi1_s1, mDo0_s1, mDu0_s1
KeccakThetaRhoPiChi r7, Aka1_s1_M2, r8,  9, r3, Ake1_s1_M2, r10,  0, r4, Aki1_s1_M2, r2,  3, r5, Ako1_s1_M2, r9, 12, r6, Aku1_s1_M2, lr,  4, r12, r8, r9, r10, r11, mDa1_s1, mDe0_s1, mDi1_s1, mDo0_s1, mDu1_s1
ldr         r8, [r0, #mDa0_s1]
KeccakThetaRhoPiChi r4, Ama0_s1_M2, r8, 18, r5, Ame0_s1_M2, r10,  5, r6, Ami0_s1_M2, r2,  8, r7, Amo0_s1_M2, r9, 28, r3, Amu0_s1_M2, lr, 14, r9, r10, r11, r12, r8, mDa0_s1, mDe0_s1, mDi1_s1, mDo0_s1, mDu1_s1
KeccakThetaRhoPiChi r6, Asa1_s1_M2, r8, 20, r7, Ase1_s1_M2, r11,  1, r3, Asi1_s1_M2, r2, 31, r4, Aso1_s1_M2, r9, 27, r5, Asu1_s1_M2, r12, 19, r11, r12, r8, r9, r10, mDa0_s1, mDe1_s1, mDi1_s1, mDo0_s1, mDu0_s1
ldr         r9, [r0, #mDo1_s1]
KeccakThetaRhoPiChiIota  Aba0_s1_M2, r8,          Abe0_s1_M2, r10, 22,      Abi0_s1_M2, r2, 22,      Abo0_s1_M2, r9, 11,      Abu0_s1_M2, r12,  7, 24, 0, mDa0_s1, mDe0_s1, mDi1_s1, mDo1_s1, mDu0_s1

ldr         r2, [r0, #mDi0_s1]
KeccakThetaRhoPiChi r5, Aga1_s1_M2, r8,  1, r6, Age1_s1_M2, r10, 22, r7, Agi1_s1_M2, r2, 30, r3, Ago1_s1_M2, r9, 14, r4, Agu1_s1_M2, lr, 10, r10, r11, r12, r8, r9, mDa0_s1, mDe0_s1, mDi0_s1, mDo1_s1, mDu1_s1
KeccakThetaRhoPiChi r7, Aka0_s1_M2, r8,  9, r3, Ake0_s1_M2, r11,  1, r4, Aki0_s1_M2, r2,  3, r5, Ako0_s1_M2, r9, 13, r6, Aku0_s1_M2, r12,  4, r12, r8, r9, r10, r11, mDa0_s1, mDe1_s1, mDi0_s1, mDo1_s1, mDu0_s1
ldr         r8, [r0, #mDa1_s1]
KeccakThetaRhoPiChi r4, Ama1_s1_M2, r8, 18, r5, Ame1_s1_M2, r11,  5, r6, Ami1_s1_M2, r2,  7, r7, Amo1_s1_M2, r9, 28, r3, Amu1_s1_M2, r12, 13, r9, r10, r11, r12, r8, mDa1_s1, mDe1_s1, mDi0_s1, mDo1_s1, mDu0_s1
KeccakThetaRhoPiChi r6, Asa0_s1_M2, r8, 21, r7, Ase0_s1_M2, r10,  1, r3, Asi0_s1_M2, r2, 31, r4, Aso0_s1_M2, r9, 28, r5, Asu0_s1_M2, lr, 20, r11, r12, r8, r9, r10, mDa1_s1, mDe0_s1, mDi0_s1, mDo1_s1, mDu1_s1
ldr         r9, [r0, #mDo0_s1]
KeccakThetaRhoPiChiIota  Aba1_s1_M2, r8,          Abe1_s1_M2, r11, 22,      Abi1_s1_M2, r2, 21,      Abo1_s1_M2, r9, 10,      Abu1_s1_M2, lr,  7, 28, 1, mDa1_s1, mDe1_s1, mDi0_s1, mDo0_s1, mDu1_s1

.endm


@----------------------------------------------------------------------------------
@---------------------KECCAKF1600_STATEPERMUTE FUNCTION----------------------------
@----------------------------------------------------------------------------------
@This function sets up the round constants pointer and jumps to the permutation core (function KeccakP1600_Permute)
@----------------------------------------------------------------------------------


@  void KeccakF1600_StatePermute( void *state )
@
.align 8
.global  KeccakF1600_StatePermute
.type	KeccakF1600_StatePermute, %function;
KeccakF1600_StatePermute:
    adr     r1, KeccakP1600_Permute_RoundConstants24
    b       KeccakP1600_Permute
.align 8
KeccakP1600_Permute_RoundConstants24:
    @       0           1
		.long      0x00000001, 0x00000000
		.long      0x00000000, 0x00000089
		.long      0x00000000, 0x8000008b
		.long      0x00000000, 0x80008080
		.long      0x00000001, 0x0000008b
		.long      0x00000001, 0x00008000
		.long      0x00000001, 0x80008088
		.long      0x00000001, 0x80000082
		.long      0x00000000, 0x0000000b
		.long      0x00000000, 0x0000000a
		.long      0x00000001, 0x00008082
		.long      0x00000000, 0x00008003
KeccakP1600_Permute_RoundConstants12:
		.long      0x00000001, 0x0000808b
		.long      0x00000001, 0x8000000b
		.long      0x00000001, 0x8000008a
		.long      0x00000001, 0x80000081
		.long      0x00000000, 0x80000081
		.long      0x00000000, 0x80000008
		.long      0x00000000, 0x00000083
		.long      0x00000000, 0x80008003
KeccakP1600_Permute_RoundConstants0:
		.long      0x00000001, 0x80008088
		.long      0x00000000, 0x80000088
		.long      0x00000001, 0x00008000
		.long      0x00000000, 0x80008082
KeccakP1600_Permute_RoundConstants0Mod4:
		.long      0x000000FF  @terminator


@----------------------------------------------------------------------------------
@---------------------KECCAKP1600_PERMUTE FUNCTION----------------------------
@----------------------------------------------------------------------------------
@This function applies the four cyclic rounds 6 times to perform a 24 rounds based Keccak
@----------------------------------------------------------------------------------

@ void KeccakP1600_Permute( void *state, void * rc )
.align 8
KeccakP1600_Permute:
    push    { r4 - r12, lr }
    str     r1, [r0, #mRC]
KeccakP1600_Permute_RoundLoop:
    KeccakRound0
KeccakP1600_Permute_Round3Mod4:
    KeccakRound1
KeccakP1600_Permute_Round2Mod4:
    KeccakRound2
KeccakP1600_Permute_Round1Mod4:
    KeccakRound3
    bne     KeccakP1600_Permute_RoundLoop
    pop     { r4 - r12, pc }