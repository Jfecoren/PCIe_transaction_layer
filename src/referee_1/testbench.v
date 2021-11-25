`timescale 	1ns	/ 100ps

`include "cmos_cells.v"
`include "referee_1.v"
`include "referee_1_str.v"
`include "tester.v"


module testbench;
    parameter LINE_SIZE = 12;

    wire [3:0] push_signal, push_signal_str;
    wire [3:0] pop_signal, pop_signal_str;
    wire [3:0] almost_full_signal, almost_empty_signal, empty_f_signal;
    wire clk;
	wire [3:0] state;
    wire [LINE_SIZE-1:0] data_out, data_out_str, data_in;



    referee_1 referee_1_cond(/*AUTOINST*/
			     // Outputs
			     .push_signal	(push_signal[3:0]),
			     .pop_signal	(pop_signal[3:0]),
			     .data_out		(data_out[LINE_SIZE-1:0]),
			     // Inputs
			     .almost_full_signal(almost_full_signal[3:0]),
			     .almost_empty_signal(almost_empty_signal[3:0]),
			     .empty_f_signal	(empty_f_signal[3:0]),
			     .clk		(clk),
			     .state		(state[3:0]),
			     .data_in		(data_in[LINE_SIZE-1:0]));

    referee_1_str referee_1_strl(/*AUTOINST*/
				 // Outputs
				 .data_out_str		(data_out_str[11:0]),
				 .pop_signal_str	(pop_signal_str[3:0]),
				 .push_signal_str	(push_signal_str[3:0]),
				 // Inputs
				 .almost_empty_signal	(almost_empty_signal[3:0]),
				 .almost_full_signal	(almost_full_signal[3:0]),
				 .clk			(clk),
				 .data_in		(data_in[11:0]),
				 .empty_f_signal	(empty_f_signal[3:0]),
				 .state			(state[3:0]));

    tester referee_tester(/*AUTOINST*/
			  // Outputs
			  .almost_full_signal	(almost_full_signal[3:0]),
			  .almost_empty_signal	(almost_empty_signal[3:0]),
			  .empty_f_signal	(empty_f_signal[3:0]),
			  .clk			(clk),
			  .state		(state),
			  .data_in		(data_in[LINE_SIZE-1:0]),
			  // Inputs
			  .push_signal		(push_signal[3:0]),
			  .pop_signal		(pop_signal[3:0]),
			  .data_out		(data_out[LINE_SIZE-1:0]));

endmodule
