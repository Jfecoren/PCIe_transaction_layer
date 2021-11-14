read_verilog -I ../referees referee_2.v
hierarchy -check -top referee_2
proc; opt; fsm; opt; memory; opt
techmap; opt
dfflibmap -liberty ../../include/cmos_cells.lib
abc -liberty ../../include/cmos_cells.lib
clean
show  -lib ../../include/cmos_cells.v referee_2
write_verilog referee_2_str.v