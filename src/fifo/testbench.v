`timescale 	1ns	/ 100ps

`include "fifo.v"
`include "fifo_est.v"
`include "tester.v"
`include "cmos_cells.v"



module testbench;
   wire [11:0] data_out, data_out_est;
   wire        almost_full, almost_empty;
   wire [2:0]  addr_r, addr_w, umbral_AE_in, umbral_AF_in;
   
   wire [11:0] 	     data_in;
   wire 	     reset, clk;
   wire 	     push, pop;
   wire [3:0] 	     state;
   


    fifo fifo_cond(/*AUTOINST*/
		   // Outputs
		   .data_out		(data_out[11:0]),
		   .almost_full		(almost_full),
		   .almost_empty	(almost_empty),
		   // Inputs
		   .data_in		(data_in[11:0]),
		   .reset		(reset),
		   .clk			(clk),
		   .umbral_AF_in	(umbral_AF_in[2:0]),
		   .umbral_AE_in	(umbral_AE_in[2:0]),
		   .push		(push),
		   .pop			(pop),
		   .state		(state[3:0]));

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
		       .reset		(reset),
		       .state		(state[3:0]),
		       .umbral_AE_in	(umbral_AE_in[2:0]),
		       .umbral_AF_in	(umbral_AF_in[2:0]));

    tester mtester(/*AUTOINST*/
		   // Outputs
		   .data_in		(data_in[11:0]),
		   .reset		(reset),
		   .clk			(clk),
		   .push		(push),
		   .pop			(pop),
		   .state		(state[3:0]),
		   .umbral_AF_in	(umbral_AF_in[2:0]),
		   .umbral_AE_in	(umbral_AE_in[2:0]),
		   // Inputs
		   .data_out		(data_out[11:0]),
		   .almost_full		(almost_full),
		   .almost_empty	(almost_empty));



endmodule
