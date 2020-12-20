# Florence Core

**Reference implementations**

* LC-3
* https://github.com/lowRISC/ibex

## Word size

16 bits

## Data types

* 2's complement integers

Between -2ˆ15 and +2ˆ15-1.
Between -32,768 and +32,767.

* ASCII codes

## von Neumann model

The central idea in the von Neumann model of computer processing is that the
program and data are both stored as sequences of bits in the computer's memory.

See: von Neumann bottleneck.

* Memory
* Processing unit: eight (8) general purpose registers.

LC-3 ALU can perform one arithmetic operation (addition) and two logical
operations (bitwise "AND" and bitwise "NOT").

* Control unit
* Input
* Output

# ISA

Three kinds of instructions:

1. Operates (3): "ADD", "AND" and "NOT";
2. Data movement (6);
3. Control: load the PC during the EXECUTE phase.

# Addressing modes

1. Immediate;
2. Register;
3. PC-relative;
4. Indirect;
5. Base + offset.

# Condition codes

Three single-bit registers: N, Z and P.

# Trap

Up to 256 service routines can be specified.

Trap Vector Table is stored in memory locations x0000 to 0x00FF.

## ADD

Two formats:

```

ADD 15 0
    14 0
    13 0
    12 1

R6  11 1
    12 1
    09 0

R2  08 0
    07 1
    06 0

    05 0 <=

    04 0
    03 0

R6  02 1
    01 1
    00 0

```

```

ADD 15 0
    14 0
    13 0
    12 1

R6  11 1
    12 1
    09 0

R2  08 0
    07 1
    06 0

    05 1 <=

imm 04 0
    03 0
    02 1
    01 1
    00 0

```

# Instruction cycle

1. Fetch: load the "MAR" with the contents of the "PC", and simultaneously
   increment the "PC";
2. Decode: 4-to-16 decoder;
3. Evaluate address;
4. Fetch operands;
5. Execute;
6. Store result.

Not all instructions require all six phases.

The ADD instruction can fetch its source operands, perform the "ADD" in the ALU,
and store the result in the destination register all in a single clock cycle.
