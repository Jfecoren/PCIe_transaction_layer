`timescale 	1ns	/ 100ps
`include "tcl.v"
`include "probador.v"

module testbench();
   wire clk, req, reset, init, popOutP0, popOutP1, popOutP2, popOutP3, pushIn, counterValid;
   wire [2:0] Umbral_bajo, Umbral_alto, idx;
   wire [4:0] counterOut;
   wire [11:0] dataOutputP0, dataOutputP1, dataOutputP2, dataOutputP3, dataInputFIFO;
   
   probador tester(/*AUTOINST*/
		   // Outputs
		   .clk			(clk),
		   .req			(req),
		   .reset		(reset),
		   .init		(init),
		   .popOutP0		(popOutP0),
		   .popOutP1		(popOutP1),
		   .popOutP2		(popOutP2),
		   .popOutP3		(popOutP3),
		   .pushIn		(pushIn),
		   .Umbral_bajo		(Umbral_bajo[2:0]),
		   .Umbral_alto		(Umbral_alto[2:0]),
		   .idx			(idx[2:0]),
		   .dataInputFIFO	(dataInputFIFO[11:0]),
		   // Inputs
		   .counterValid	(counterValid),
		   .counterOut		(counterOut[4:0]),
		   .dataOutputP0	(dataOutputP0[11:0]),
		   .dataOutputP1	(dataOutputP1[11:0]),
		   .dataOutputP2	(dataOutputP2[11:0]),
		   .dataOutputP3	(dataOutputP3[11:0]));
   
   tcl transferLayer(/*AUTOINST*/
		     // Outputs
		     .counterValid	(counterValid),
		     .counterOut	(counterOut[4:0]),
		     .dataOutputP0	(dataOutputP0[11:0]),
		     .dataOutputP1	(dataOutputP1[11:0]),
		     .dataOutputP2	(dataOutputP2[11:0]),
		     .dataOutputP3	(dataOutputP3[11:0]),
		     // Inputs
		     .clk		(clk),
		     .req		(req),
		     .reset		(reset),
		     .init		(init),
		     .popOutP0		(popOutP0),
		     .popOutP1		(popOutP1),
		     .popOutP2		(popOutP2),
		     .popOutP3		(popOutP3),
		     .pushIn		(pushIn),
		     .Umbral_bajo	(Umbral_bajo[2:0]),
		     .Umbral_alto	(Umbral_alto[2:0]),
		     .idx		(idx[2:0]),
		     .dataInputFIFO	(dataInputFIFO[11:0]));
   
endmodule // testbench
