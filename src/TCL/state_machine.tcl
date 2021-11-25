read_verilog state_machine.v
hierarchy -check -top state_machine
proc; opt; fsm; opt; memory; opt
techmap; opt
dfflibmap -liberty ../../include/cmos_cells.lib
abc -liberty ../../include/cmos_cells.lib
clean
show  -lib ../../include/cmos_cells.v state_machine
write_verilog state_machine_synth.v