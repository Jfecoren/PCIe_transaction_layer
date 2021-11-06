`timescale 	1ns				/ 100ps
// escala	unidad temporal (valor de "#1") / precision
// includes de archivos de verilog
`include "cmos_cells.v"
`include "true_dpram_sclk.v"
`include "true_dpram_sclk_est.v"
`include "probador.v"

module BancoPruebas; // Testbench
   wire we_a, we_b, clk;
   wire [2:0] addr_a, addr_b;
   wire [11:0] data_a, data_b, q_a, q_b, q_a_est, q_b_est;
   

   // Descripcion conductual del circuito
   true_dpram_sclk memoria_cond(/*AUTOINST*/
				// Outputs
				.q_a		(q_a[11:0]),
				.q_b		(q_b[11:0]),
				// Inputs
				.data_a		(data_a[11:0]),
				.data_b		(data_b[11:0]),
				.addr_a		(addr_a[2:0]),
				.addr_b		(addr_b[2:0]),
				.we_a		(we_a),
				.we_b		(we_b),
				.clk		(clk));

   // Descripcion estructural del circuito
   true_dpram_sclk_est memoria_est(/*AUTOINST*/
				   // Outputs
				   .q_a_est		(q_a_est[11:0]),
				   .q_b_est		(q_b_est[11:0]),
				   // Inputs
				   .addr_a		(addr_a[2:0]),
				   .addr_b		(addr_b[2:0]),
				   .clk			(clk),
				   .data_a		(data_a[11:0]),
				   .data_b		(data_b[11:0]),
				   .we_a		(we_a),
				   .we_b		(we_b));

   // Probador: generador de senales y monitor
   probador probador0(/*AUTOINST*/
		      // Outputs
		      .we_a		(we_a),
		      .we_b		(we_b),
		      .addr_a		(addr_a[2:0]),
		      .addr_b		(addr_b[2:0]),
		      .data_a		(data_a[11:0]),
		      .data_b		(data_b[11:0]),
		      .clk		(clk),
		      // Inputs
		      .q_a		(q_a[11:0]),
		      .q_b		(q_b[11:0]),
		      .q_a_est		(q_a_est[11:0]),
		      .q_b_est		(q_b_est[11:0]));
   
endmodule // BancoPruebas
