`timescale 	1ns	/ 100ps

`include "referee_2.v"
`include "referee_2_est.v"
`include "tester_referee_2.v"
`include "cmos_cells.v"



module testbench;
   //wire [11:0] data_out, data_out_est;
   wire almost_full_0, almost_full_1, almost_full_2, almost_full_3;
   wire empty;
   //wire [11:0] 	     data_in;
   wire reset, clk;
   wire push_0, push_1, push_2, push_3, pop;
   


    referee_2 referee_2_cond(/*AUTOINST*/
			     // Outputs
			     .push_0		(push_0),
			     .push_1		(push_1),
			     .push_2		(push_2),
			     .push_3		(push_3),
			     .pop		(pop),
			     // Inputs
			     .almost_full_0	(almost_full_0),
			     .almost_full_1	(almost_full_1),
			     .almost_full_2	(almost_full_2),
			     .almost_full_3	(almost_full_3),
			     .empty		(empty),
			     .clk		(clk),
			     .reset		(reset));

    referee_2_est referee_2_strl(/*AUTOINST*/
				 // Outputs
				 .pop			(pop),
				 .push_0		(push_0),
				 .push_1		(push_1),
				 .push_2		(push_2),
				 .push_3		(push_3),
				 // Inputs
				 .almost_full_0		(almost_full_0),
				 .almost_full_1		(almost_full_1),
				 .almost_full_2		(almost_full_2),
				 .almost_full_3		(almost_full_3),
				 .clk			(clk),
				 .empty			(empty),
				 .reset			(reset));


    tester_referee_2 referee_tester(/*AUTOINST*/
				    // Outputs
				    .almost_full_0	(almost_full_0),
				    .almost_full_1	(almost_full_1),
				    .almost_full_2	(almost_full_2),
				    .almost_full_3	(almost_full_3),
				    .empty		(empty),
				    .reset		(reset),
				    .clk		(clk),
				    // Inputs
				    .push_0		(push_0),
				    .push_1		(push_1),
				    .push_2		(push_2),
				    .push_3		(push_3),
				    .pop		(pop));

endmodule
