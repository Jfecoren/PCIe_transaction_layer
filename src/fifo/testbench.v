`timescale 	1ns	/ 100ps

`include "cmos_cells.v"
`include "fifo.v"
`include "fifo_str.v"
`include "tester.v"



module testbench;
	parameter LINE_SIZE = 12;
	parameter BLOCK_SIZE = 8;
	parameter ADDRESS_SIZE = 3;

   wire [11:0] data_out, data_out_str;
   wire        almost_full, almost_empty, empty_f;
   wire        almost_full_str, almost_empty_str, empty_f_str;
   wire [2:0]  addr_r, addr_w;
   wire [3:0] state;
   wire [11:0] data_in;
   wire 	   reset, clk;
   wire 	   push, pop;
   wire [2:0] init_full, init_empty;
   


    fifo fifo_cnd(/*AUTOINST*/
		  // Outputs
		  .data_out		(data_out[LINE_SIZE-1:0]),
		  .almost_full		(almost_full),
		  .almost_empty		(almost_empty),
		  .empty_f		(empty_f),
		  // Inputs
		  .data_in		(data_in[LINE_SIZE-1:0]),
		  .init_full		(init_full[ADDRESS_SIZE-1:0]),
		  .init_empty		(init_empty[ADDRESS_SIZE-1:0]),
		  .state		(state[3:0]),
		  .clk			(clk),
		  .push			(push),
		  .pop			(pop));

    fifo_str fifo_strt(/*AUTOINST*/
		       // Outputs
		       .almost_empty_str(almost_empty_str),
		       .almost_full_str	(almost_full_str),
		       .data_out_str	(data_out_str[11:0]),
		       .empty_f_str	(empty_f_str),
		       // Inputs
		       .clk		(clk),
		       .data_in		(data_in[11:0]),
		       .init_empty	(init_empty[2:0]),
		       .init_full	(init_full[2:0]),
		       .pop		(pop),
		       .push		(push),
		       .state		(state[3:0]));

    tester tester0(/*AUTOINST*/
		   // Outputs
		   .data_in		(data_in[11:0]),
		   .state		(state[3:0]),
		   .clk			(clk),
		   .push		(push),
		   .pop			(pop),
		   .init_full		(init_full[2:0]),
		   .init_empty		(init_empty[2:0]),
		   // Inputs
		   .data_out		(data_out[11:0]),
		   .data_out_str	(data_out_str[11:0]),
		   .almost_full		(almost_full),
		   .almost_empty	(almost_empty),
		   .empty_f		(empty_f),
		   .almost_full_str	(almost_full_str),
		   .almost_empty_str	(almost_empty_str),
		   .empty_f_str		(empty_f_str));



endmodule
