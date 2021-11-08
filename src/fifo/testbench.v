`timescale 	1ns	/ 100ps

`include "fifo.v"
`include "fifo_est.v"
`include "tester.v"
`include "cmos_cells.v"



module testbench;
   wire [11:0] data_out, data_out_est;
   wire        almost_full, almost_empty;
   wire [2:0]  addr_r, addr_w;
   
   wire [11:0] 	     data_in;
   wire 	     reset, clk;
   wire 	     push, pop;
   


    fifo fifo_cond(/*AUTOINST*/
		   // Outputs
		   .data_out		(data_out[11:0]),
		   .almost_full		(almost_full),
		   .almost_empty	(almost_empty),
		   // Inputs
		   .data_in		(data_in[11:0]),
		   .reset		(reset),
		   .clk			(clk),
		   .push		(push),
		   .pop			(pop));

    fifo_est fifo_strl(/*AUTOINST*/
		       // Outputs
		       .almost_empty_est(almost_empty_est),
		       .almost_full_est	(almost_full_est),
		       .data_out_est	(data_out_est[11:0]),
		       // Inputs
		       .clk		(clk),
		       .data_in		(data_in[11:0]),
		       .pop		(pop),
		       .push		(push),
		       .reset		(reset));

    tester mtester(/*AUTOINST*/
		   // Outputs
		   .data_in		(data_in[11:0]),
		   .reset		(reset),
		   .clk			(clk),
		   .push		(push),
		   .pop			(pop),
		   // Inputs
		   .data_out		(data_out[11:0]),
		   .almost_full		(almost_full),
		   .almost_empty	(almost_empty));



endmodule
