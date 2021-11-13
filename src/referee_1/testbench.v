`timescale 	1ns	/ 100ps

`include "referee_1.v"
`include "referee_1_est.v"
`include "tester_referee_1.v"
`include "cmos_cells.v"



module testbench;
   //wire [11:0] data_out, data_out_est;
   wire almost_full_0, almost_full_1, almost_full_2, almost_full_3;
   wire empty_0, empty_1, empty_2, empty_3;
   //wire [11:0] 	     data_in;
   wire reset, clk;
   wire push_0, push_1, push_2, push_3, pop_0, pop_1, pop_2, pop_3;
   


    referee_1 referee_1_cond(/*AUTOINST*/
			     // Outputs
			     .push_0		(push_0),
			     .push_1		(push_1),
			     .push_2		(push_2),
			     .push_3		(push_3),
			     .pop_0		(pop_0),
			     .pop_1		(pop_1),
			     .pop_2		(pop_2),
			     .pop_3		(pop_3),
			     // Inputs
			     .almost_full_0	(almost_full_0),
			     .almost_full_1	(almost_full_1),
			     .almost_full_2	(almost_full_2),
			     .almost_full_3	(almost_full_3),
			     .empty_0		(empty_0),
			     .empty_1		(empty_1),
			     .empty_2		(empty_2),
			     .empty_3		(empty_3),
			     .clk		(clk),
			     .reset		(reset));

    referee_1_est referee_1_strl(/*AUTOINST*/
				 // Outputs
				 .pop_0			(pop_0),
				 .pop_1			(pop_1),
				 .pop_2			(pop_2),
				 .pop_3			(pop_3),
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
				 .empty_0		(empty_0),
				 .empty_1		(empty_1),
				 .empty_2		(empty_2),
				 .empty_3		(empty_3),
				 .reset			(reset));


    tester_referee_1 referee_tester(/*AUTOINST*/
				    // Outputs
				    .almost_full_0	(almost_full_0),
				    .almost_full_1	(almost_full_1),
				    .almost_full_2	(almost_full_2),
				    .almost_full_3	(almost_full_3),
				    .empty_0		(empty_0),
				    .empty_1		(empty_1),
				    .empty_2		(empty_2),
				    .empty_3		(empty_3),
				    .reset		(reset),
				    .clk		(clk),
				    // Inputs
				    .push_0		(push_0),
				    .push_1		(push_1),
				    .push_2		(push_2),
				    .push_3		(push_3),
				    .pop_0		(pop_0),
				    .pop_1		(pop_1),
				    .pop_2		(pop_2),
				    .pop_3		(pop_3));

endmodule
