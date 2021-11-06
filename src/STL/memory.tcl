read_verilog true_dpram_sclk.v
hierarchy -check -top true_dpram_sclk
proc; opt; fsm; opt; memory; opt
techmap; opt
dfflibmap -liberty ../../include/cmos_cells.lib
abc -liberty ../../include/cmos_cells.lib
clean
show  -lib ../../include/cmos_cells.v true_dpram_sclk
write_verilog true_dpram_sclk_est.v
