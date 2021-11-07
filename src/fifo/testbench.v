`timescale 	1ns	/ 100ps

`include "cmos_cells.v"
`include "fifo.v"
//`include "fifo_str.v"
`include "tester.v"



module testbench;
    wire [11:0] data_out, data_w,
    wire [2:0] addr_w, addr_r,
    wire almost_full, almost_empty,
    wire [11:0] data_in, data_r,
    wire reset, clk,
    wire push, pop


    fifo fifo_cond(/*AUTOINST*/);

    //fifo_est fifo_strl(/*AUTOINST*/);

    tester mtester(/*AUTOINST*/);



endmodule