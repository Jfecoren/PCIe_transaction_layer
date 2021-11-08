`timescale 	1ns	/ 100ps
// escala	unidad temporal (valor de "#1") / precision
// includes de archivos de verilog
`include "cmos_cells.v"
`include "true_dpram_sclk.v"
`include "true_dpram_sclk_est.v"
`include "probador.v"

module BancoPruebas; // Testbench
	parameter LINE_SIZE = 12, ADDRESS_SIZE = 3;
	wire wr_e, rd_e, clk;
	wire [2:0] wr_ptr, rd_ptr;
	wire [11:0] data_w, data_r, q_w, q_r, q_w_est, q_r_est;
   

   // Descripcion conductual del circuito
   true_dpram_sclk memoria_cond(/*AUTOINST*/
				// Outputs
				.q_w		(q_w[LINE_SIZE-1:0]),
				.q_r		(q_r[LINE_SIZE-1:0]),
				// Inputs
				.data_w		(data_w[LINE_SIZE-1:0]),
				.data_r		(data_r[LINE_SIZE-1:0]),
				.wr_ptr		(wr_ptr[ADDRESS_SIZE-1:0]),
				.rd_ptr		(rd_ptr[ADDRESS_SIZE-1:0]),
				.wr_e		(wr_e),
				.rd_e		(rd_e),
				.clk		(clk));

   // Descripcion estructural del circuito
   true_dpram_sclk_est memoria_est(/*AUTOINST*/
				   // Outputs
				   .q_r_est		(q_r_est[11:0]),
				   .q_w_est		(q_w_est[11:0]),
				   // Inputs
				   .clk			(clk),
				   .data_r		(data_r[11:0]),
				   .data_w		(data_w[11:0]),
				   .rd_e		(rd_e),
				   .rd_ptr		(rd_ptr[2:0]),
				   .wr_e		(wr_e),
				   .wr_ptr		(wr_ptr[2:0]));

   // Probador: generador de senales y monitor
   probador probador0(/*AUTOINST*/
		      // Outputs
		      .wr_e		(wr_e),
		      .rd_e		(rd_e),
		      .wr_ptr		(wr_ptr[2:0]),
		      .rd_ptr		(rd_ptr[2:0]),
		      .data_w		(data_w[11:0]),
		      .data_r		(data_r[11:0]),
		      .clk		(clk),
		      // Inputs
		      .q_w		(q_w[11:0]),
		      .q_r		(q_r[11:0]),
		      .q_w_est		(q_w_est[11:0]),
		      .q_r_est		(q_r_est[11:0]));
   
endmodule // BancoPruebas
