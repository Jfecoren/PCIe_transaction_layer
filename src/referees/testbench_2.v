`timescale 	1ns	/ 100ps

`include "cmos_cells.v"
`include "referee_2.v"
`include "referee_2_str.v"
`include "tester_2.v"


module testbench;
    parameter LINE_SIZE = 12;

    wire [3:0] push_signal, push_signal_str;
    wire pop_signal, pop_signal_str;
    wire [3:0] almost_full_signal;
    wire almost_empty_signal;
    wire clk, reset;
    wire [LINE_SIZE-1:0] data_out, data_out_str, data_in;



    referee_2 referee_2_cond(/*AUTOINST*/
			     // Outputs
			     .push_signal	(push_signal[3:0]),
			     .pop_signal	(pop_signal),
			     .data_out		(data_out[LINE_SIZE-1:0]),
			     // Inputs
			     .almost_full_signal(almost_full_signal[3:0]),
			     .almost_empty_signal(almost_empty_signal),
			     .clk		(clk),
			     .reset		(reset),
			     .data_in		(data_in[LINE_SIZE-1:0]));

    referee_2_str referee_2_strl(/*AUTOINST*/
				 // Outputs
				 .data_out_str		(data_out_str[11:0]),
				 .pop_signal_str	(pop_signal_str),
				 .push_signal_str	(push_signal_str[3:0]),
				 // Inputs
				 .almost_empty_signal	(almost_empty_signal),
				 .almost_full_signal	(almost_full_signal[3:0]),
				 .clk			(clk),
				 .data_in		(data_in[11:0]),
				 .reset			(reset));

    tester_2 referee_tester(/*AUTOINST*/
			    // Outputs
			    .almost_full_signal	(almost_full_signal[3:0]),
			    .almost_empty_signal(almost_empty_signal),
			    .clk		(clk),
			    .reset		(reset),
			    .data_in		(data_in[LINE_SIZE-1:0]),
			    // Inputs
			    .push_signal	(push_signal[3:0]),
			    .pop_signal		(pop_signal),
			    .data_out		(data_out[LINE_SIZE-1:0]));

endmodule
