module alu #(
    parameter SIZE = 7
);

  input logic [1:0] operator_i;
  input logic [SIZE:0] operand_a_i;
  input logic [SIZE:0] operand_b_i;

  output logic [SIZE:0] result_o;

  always_comb begin
    case (operator_i)
      1'b0: result_o = operand_a_i + operand_b_i;
      1'b1: result_o = operand_a_i - operand_b_i;
      // default: result_o = operand_a_i + operand_b_i;
    endcase
  end

endmodule
