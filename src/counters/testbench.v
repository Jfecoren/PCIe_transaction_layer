`timescale 	1ns	/ 100ps
// escala	unidad temporal (valor de "#1") / precision
// includes de archivos de verilog
`include "cmos_cells.v"
`include "counters.v"
`include "counters_str.v"
`include "counter_mux.v"
`include "tester.v"

module testbench; // Testbench

   wire reset, clk, req, idle, valid, valid_str;
   wire [11:0] data_in, data_low;
   wire [7:0]  counts, counts_str, counts0, counts1, counts2, counts3, counts4, counts_str0, counts_str1, counts_str2, counts_str3, counts_str4;
   wire [2:0]  idx;
   wire [3:0]  state;
   
   
   
   
   // Descripcion conductual del circuito
   counters counters_cond0(
			   // Outputs
			   .counts		(counts0),
			   // Inputs
			   .data_in		(data_in[11:0]),
			   .state		(state),
			   .clk			(clk));
   counters counters_cond1(
			   // Outputs
			   .counts		(counts1),
			   // Inputs
			   .data_in		(data_low),
			   .state		(state),
			   .clk			(clk));
   counters counters_cond2(
			   // Outputs
			   .counts		(counts2),
			   // Inputs
			   .data_in		(data_in[11:0]),
			   .state		(state),
			   .clk			(clk));
   counters counters_cond3(
			   // Outputs
			   .counts		(counts3),
			   // Inputs
			   .data_in		(data_low),
			   .state		(state),
			   .clk			(clk));
   counters counters_cond4(
			   // Outputs
			   .counts		(counts4),
			   // Inputs
			   .data_in		(data_in[11:0]),
			   .state		(state),
			   .clk			(clk));
   
   // Descripcion estructural del circuito
   counters_str counters_str0(
			      // Outputs
			      .counts_str	(counts_str0),
			      // Inputs
			      .clk		(clk),
			      .data_in		(data_in[11:0]),
			      .state		(state));
   counters_str counters_str1(
			      // Outputs
			      .counts_str	(counts_str1),
			      // Inputs
			      .clk		(clk),
			      .data_in		(data_low),
			      .state		(state));
   counters_str counters_str2(
			      // Outputs
			      .counts_str	(counts_str2),
			      // Inputs
			      .clk		(clk),
			      .data_in		(data_in[11:0]),
			      .state		(state));
   counters_str counters_str3(
			      // Outputs
			      .counts_str	(counts_str3),
			      // Inputs
			      .clk		(clk),
			      .data_in		(data_low),
			      .state		(state));
   counters_str counters_str4(
			      // Outputs
			      .counts_str	(counts_str4),
			      // Inputs
			      .clk		(clk),
			      .data_in		(data_in[11:0]),
			      .state		(state));
   
   // Mux para manejar entradas
   counter_mux mux_cond(
		// Outputs
		.data			(counts),
		.valid			(valid),
		// Inputs
		.in0			(counts0),
		.in1			(counts1),
		.in2			(counts2),
		.in3			(counts3),
		.in4			(counts4),
		.idx			(idx[2:0]),
		.req			(req),
	        .state			(state[3:0]),
		.clk			(clk));
   
   
   counter_mux mux_str(
		// Outputs
		.data			(counts_str),
		.valid			(valid_str),
		// Inputs
		.in0			(counts_str0),
		.in1			(counts_str1),
		.in2			(counts_str2),
		.in3			(counts_str3),
		.in4			(counts_str4),
		.idx			(idx[2:0]),
		.req			(req),
	    .state			(state[3:0]),
		.clk			(clk));
   

   // Probador: generador de senales y monitor
   tester tester0(/*AUTOINST*/
		  // Outputs
		  .data_in		(data_in[11:0]),
		  .data_low		(data_low[11:0]),
		  .idx			(idx[2:0]),
		  .state		(state[3:0]),
		  .req			(req),
		  .idle			(idle),
		  .clk			(clk),
		  // Inputs
		  .counts		(counts[4:0]),
		  .counts_str		(counts_str[4:0]));
   
endmodule // BancoPruebas
