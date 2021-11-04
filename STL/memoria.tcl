read_verilog true_dpram_sclk.v
hierarchy -check -top true_dpram_sclk
proc; opt; fsm; opt; memory; opt
techmap; opt
dfflibmap -liberty cmos_cells.lib
abc -liberty cmos_cells.lib
clean
show  -lib cmos_cells.v true_dpram_sclk
write_verilog true_dpram_sclk_est.v
