read_verilog -I ../referee_1 referee_1.v
hierarchy -check -top referee_1
proc; opt; fsm; opt; memory; opt
techmap; opt
dfflibmap -liberty ../../include/cmos_cells.lib
abc -liberty ../../include/cmos_cells.lib
clean
show  -lib ../../include/cmos_cells.v referee_1
write_verilog referee_1_str.v