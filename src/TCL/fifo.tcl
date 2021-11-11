read_verilog -I ../memory fifo.v
hierarchy -check -top fifo
proc; opt; fsm; opt; memory; opt
techmap; opt
dfflibmap -liberty ../../include/cmos_cells.lib
abc -liberty ../../include/cmos_cells.lib
clean
show  -lib ../../include/cmos_cells.v fifo
write_verilog fifo_str.v
