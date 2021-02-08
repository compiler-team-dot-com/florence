Florence Core
==========================

Inspired by:

* LC-3
* https://github.com/lowRISC/ibex

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

# Guidelines and good coding habits

* Guideline #1: When modeling sequential logic, use nonblocking assignments.
* Guideline #2: When modeling latches, use nonblocking assignments.
* Guideline #3: When modeling combinational logic with an always block, use
  blocking assignments.
* Guideline #4: When modeling both sequential and combinational logic within the
  same always block, use nonblocking assignments.
* Guideline #5: Do not mix blocking and nonblocking assignments in the same
  always block.
* Guideline #6: Do not make assignments to the same variable from more than one
  always block.
* Guideline #7: Use $strobe to display values that have been assigned using
  nonblocking assignments.
* Guideline #8: Do not make assignments using #0 delays

From: http://www.sunburst-design.com/papers/

Test benches
-----------------

Good coding style for time-0 reset assertion:

.. code-block:: verilog

  initial begin                     // Clock oscillator.
    clk <= 0;                       // Time 0 nonblocking assignment.
    forever #(`CYCLE/2) clk = ~clk;
  end
  
  initial begin
    rst_n <= 0;                     // Time 0 nonblocking assignment.
    @(posedge clk);                 // Wait to get past time 0.
    @(negedge clk) rst_n = 1;       // rst_n low for one clock cycle.
  end


From: http://www.sunburst-design.com/papers/
