read_verilog tcl.v
hierarchy -check -top tcl
proc; opt; fsm; opt; memory; opt
techmap; opt
dfflibmap -liberty ../../include/cmos_cells.lib
abc -liberty ../../include/cmos_cells.lib
clean
show  -lib ../../include/cmos_cells.v tcl
write_verilog tcl_synth.v