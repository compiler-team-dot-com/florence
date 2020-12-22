dict for {test args} $tests {
  echo "Running \"$test\""
  dict with args {
    force operator_i $op
    force operand_a_i $a
    force operand_b_i $b

    run 5

    if {[examine -unsigned result_o] != $want} {
      echo "Error: want $want, result_o is [examine -unsigned result_o]."
      quit -code 1
    } else {
      echo "Test passed. result_o is [examine -unsigned result_o]."
    }
  }
}
