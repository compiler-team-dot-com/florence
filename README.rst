Florence Core
==========================

Inspired by:

* `LC-3 <https://www.amazon.com/Introduction-Computing-Systems-Gates-Beyond-ebook/dp/B07VWKMJBX/ref=sr_1_2?dchild=1&keywords=introduction+to+computing+systems&qid=1612820675&sr=8-2>`_
* https://github.com/lowRISC/ibex

The Florence Core inspires to be a small and efficient, 32-bit, in-order
RISC-V core with a 2-stage pipeline that implements the RV32IMC instruction
set architecture.

Documentation
------------------------

The user manual can be found at `florence-core.readthedocs.io <https://florence-core.readthedocs.io>`_.

Instruction cycle
-----------------------

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

Guidelines and good coding habits
------------------------------------------

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
