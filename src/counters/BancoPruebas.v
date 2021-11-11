`timescale 	1ns	/ 100ps
// escala	unidad temporal (valor de "#1") / precision
// includes de archivos de verilog
`include "cmos_cells.v"
`include "contador.v"
`include "contador_est.v"
`include "probador.v"

module BancoPruebas; // Testbench

   wire reset, clk;
   wire [11:0] data_in;
   wire [15:0]  cuenta, cuenta_est;
   
   
   // Descripcion conductual del circuito
   contador contador_cond0(/*AUTOINST*/
			   // Outputs
			   .cuenta		(cuenta[15:0]),
			   // Inputs
			   .data_in		(data_in[11:0]),
			   .reset		(reset),
			   .clk			(clk));
   
   // Descripcion estructural del circuito
   contador_est contador_est0(/*AUTOINST*/
			      // Outputs
			      .cuenta_est	(cuenta_est[15:0]),
			      // Inputs
			      .clk		(clk),
			      .data_in		(data_in[11:0]),
			      .reset		(reset));

   // Probador: generador de senales y monitor
   probador probador0(/*AUTOINST*/
		      // Outputs
		      .data_in		(data_in[11:0]),
		      .reset		(reset),
		      .clk		(clk),
		      // Inputs
		      .cuenta		(cuenta[15:0]),
		      .cuenta_est	(cuenta_est[15:0]));
   
endmodule // BancoPruebas
