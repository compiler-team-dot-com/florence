force operand_a_i 3
force operand_b_i 2

force operator_i 0
run 5

if {[examine -decimal result_o] != {8'd5}} {
  echo "Error: Counting to 8'd5 failed. result_o is [examine -decimal result_o]."
  quit -code 1
} else {
  echo "Test passed. result_o is [examine -decimal result_o]."
}

force operator_i 1
run 5

if {[examine -decimal result_o] != {8'd1}} {
  echo "Error: Counting to 8'd1 failed. result_o is [examine -decimal result_o]."
  quit -code 1
} else {
  echo "Test passed. result_o is [examine -decimal result_o]."
}
