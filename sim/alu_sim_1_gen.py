#!/usr/bin/env python

out = open("alu_sim_1_data_gen.do", "w")

args_a = [a for a in range(100)]
args_b = [b + 1 for b in range(100)]
for t in zip(args_a, args_b):
    name = "add {0} + {1}".format(t[0], t[1])
    out.write("quietly dict set tests \"{0}\" op 0\n".format(name))
    out.write("quietly dict set tests \"{0}\" a 8'd{1}\n".format(name, t[0]))
    out.write("quietly dict set tests \"{0}\" b 8'd{1}\n".format(name, t[1]))
    out.write("quietly dict set tests \"{0}\" want 8'd{1}\n".format(name, t[0] + t[1]))
    out.write("\n")

out.close()
