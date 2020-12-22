vlog ../rtl/alu.sv
vopt +acc alu -o alu_opt

# Tests
vsim -c -do sim/alu_sim_1.do alu_opt

quit -code 0
