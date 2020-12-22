#!/bin/bash

which vsim
vsim -version
vsim -c -do sim/alu_sim.do
