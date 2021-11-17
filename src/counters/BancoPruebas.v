`timescale 	1ns	/ 100ps
// escala	unidad temporal (valor de "#1") / precision
// includes de archivos de verilog
`include "cmos_cells.v"
`include "contador.v"
`include "contador_est.v"
`include "mux.v"
`include "probador.v"

module BancoPruebas; // Testbench

   wire reset, clk, req, idle;
   wire [11:0] data_in, data_low;
   wire [4:0]  cuenta, cuenta_est, cuenta0, cuenta1, cuenta2, cuenta3, cuenta4, cuenta_est0, cuenta_est1, cuenta_est2, cuenta_est3, cuenta_est4;
   wire [2:0]  idx;
   
   
   
   // Descripcion conductual del circuito
   contador contador_cond0(
			   // Outputs
			   .cuenta		(cuenta0[4:0]),
			   // Inputs
			   .data_in		(data_in[11:0]),
			   .reset		(reset),
			   .clk			(clk));
   contador contador_cond1(
			   // Outputs
			   .cuenta		(cuenta1[4:0]),
			   // Inputs
			   .data_in		(data_low),
			   .reset		(reset),
			   .clk			(clk));
   contador contador_cond2(
			   // Outputs
			   .cuenta		(cuenta2[4:0]),
			   // Inputs
			   .data_in		(data_in[11:0]),
			   .reset		(reset),
			   .clk			(clk));
   contador contador_cond3(
			   // Outputs
			   .cuenta		(cuenta3[4:0]),
			   // Inputs
			   .data_in		(data_low),
			   .reset		(reset),
			   .clk			(clk));
   contador contador_cond4(
			   // Outputs
			   .cuenta		(cuenta4[4:0]),
			   // Inputs
			   .data_in		(data_in[11:0]),
			   .reset		(reset),
			   .clk			(clk));
   
   // Descripcion estructural del circuito
   contador_est contador_est0(
			      // Outputs
			      .cuenta_est	(cuenta_est0[4:0]),
			      // Inputs
			      .clk		(clk),
			      .data_in		(data_in[11:0]),
			      .reset		(reset));
   contador_est contador_est1(
			      // Outputs
			      .cuenta_est	(cuenta_est1[4:0]),
			      // Inputs
			      .clk		(clk),
			      .data_in		(data_low),
			      .reset		(reset));
   contador_est contador_est2(
			      // Outputs
			      .cuenta_est	(cuenta_est2[4:0]),
			      // Inputs
			      .clk		(clk),
			      .data_in		(data_in[11:0]),
			      .reset		(reset));
   contador_est contador_est3(
			      // Outputs
			      .cuenta_est	(cuenta_est3[4:0]),
			      // Inputs
			      .clk		(clk),
			      .data_in		(data_low),
			      .reset		(reset));
   contador_est contador_est4(
			      // Outputs
			      .cuenta_est	(cuenta_est4[4:0]),
			      // Inputs
			      .clk		(clk),
			      .data_in		(data_in[11:0]),
			      .reset		(reset));
   
   // Mux para manejar entradas
   mux mux_cond(
		// Outputs
		.data			(cuenta[4:0]),
		.valid			(valid),
		// Inputs
		.in0			(cuenta0[4:0]),
		.in1			(cuenta1[4:0]),
		.in2			(cuenta2[4:0]),
		.in3			(cuenta3[4:0]),
		.in4			(cuenta4[4:0]),
		.idx			(idx[2:0]),
		.req			(req),
		.reset			(reset),
		.clk			(clk),
		.idle			(idle));
   
   mux mux_est(
		// Outputs
		.data			(cuenta_est[4:0]),
		.valid			(valid_est),
		// Inputs
		.in0			(cuenta_est0[4:0]),
		.in1			(cuenta_est1[4:0]),
		.in2			(cuenta_est2[4:0]),
		.in3			(cuenta_est3[4:0]),
		.in4			(cuenta_est4[4:0]),
		.idx			(idx[2:0]),
		.req			(req),
		.reset			(reset),
		.clk			(clk),
		.idle			(idle));
   

   // Probador: generador de senales y monitor
   probador probador0(/*AUTOINST*/
		      // Outputs
		      .data_in		(data_in[11:0]),
		      .data_low		(data_low[11:0]),
		      .idx		(idx[2:0]),
		      .reset		(reset),
		      .req		(req),
		      .idle		(idle),
		      .clk		(clk),
		      // Inputs
		      .cuenta		(cuenta[4:0]),
		      .cuenta_est	(cuenta_est[4:0]));
   
endmodule // BancoPruebas
