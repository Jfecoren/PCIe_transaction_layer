`timescale 	1ns	/ 100ps

`include "cmos_cells.v"
`include "fifo.v"
`include "fifo_str.v"
`include "tester.v"



module testbench;
    parameter ALMOST_FULL = 6;
    parameter ALMOST_EMPTY = 1;
	parameter LINE_SIZE = 12;
	parameter BLOCK_SIZE = 8;
	parameter ADRRESS_SIZE = 3;

   wire [11:0] data_out, data_out_str;
   wire        almost_full, almost_empty;
   wire        almost_full_str, almost_empty_str;
   wire [2:0]  addr_r, addr_w;
   
   wire [11:0] 	 data_in;
   wire 	     reset, clk;
   wire 	     push, pop;
   


    fifo fifo_cnd(/*AUTOINST*/
		  // Outputs
		  .data_out		(data_out[LINE_SIZE-1:0]),
		  .almost_full		(almost_full),
		  .almost_empty		(almost_empty),
		  // Inputs
		  .data_in		(data_in[LINE_SIZE-1:0]),
		  .reset		(reset),
		  .clk			(clk),
		  .push			(push),
		  .pop			(pop));

    fifo_str fifo_strt(/*AUTOINST*/
		       // Outputs
		       .almost_empty_str(almost_empty_str),
		       .almost_full_str	(almost_full_str),
		       .data_out_str	(data_out_str[11:0]),
		       // Inputs
		       .clk		(clk),
		       .data_in		(data_in[11:0]),
		       .pop		(pop),
		       .push		(push),
		       .reset		(reset));

    tester tester0(/*AUTOINST*/
		   // Outputs
		   .data_in		(data_in[11:0]),
		   .reset		(reset),
		   .clk			(clk),
		   .push		(push),
		   .pop			(pop),
		   // Inputs
		   .data_out		(data_out[11:0]),
		   .data_out_str	(data_out_str[11:0]),
		   .almost_full		(almost_full),
		   .almost_empty	(almost_empty),
		   .almost_full_str	(almost_full_str),
		   .almost_empty_str	(almost_empty_str));



endmodule
