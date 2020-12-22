`timescale 1ns / 1ns

module alu_tb;
  reg [7:0] a, b;
  reg [1:0] sel;
  reg [7:0] out;

  initial begin
    sel = 0;
    a   = 3;
    b   = 2;
    #5 sel = 1;
  end

  alu dut (
      .operator_i (sel),
      .operand_a_i(a),
      .operand_b_i(b),
      .result_o   (out)
  );
endmodule
