read_verilog -I ../memory contador.v
hierarchy -check -top contador
proc; opt; fsm; opt; memory; opt
techmap; opt
dfflibmap -liberty ../../include/cmos_cells.lib
abc -liberty ../../include/cmos_cells.lib
clean
show  -lib ../../include/cmos_cells.v contador
write_verilog contador_est.v
