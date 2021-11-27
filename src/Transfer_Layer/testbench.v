`timescale 	1ns	/ 100ps
`include "tcl.v"
`include "tcl_synth.v"
`include "probador_spec.v"


module testbench();
   wire clk, req, reset, init, popOutP0, popOutP1, popOutP2, popOutP3, pushIn, counterValid, counterValid_synth;
   wire [2:0] Umbral_bajo, Umbral_alto, idx;
   wire [4:0] counterOut, counterOut_synth;
   wire [11:0] dataOutputP0, dataOutputP1, dataOutputP2, dataOutputP3, dataOutputP0_synth, dataOutputP1_synth, dataOutputP2_synth, dataOutputP3_synth, dataInputFIFO;
   
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
   tcl_synth transferLayer_synth(/*AUTOINST*/
				 // Outputs
				 .counterOut_synth	(counterOut_synth[4:0]),
				 .counterValid_synth	(counterValid_synth),
				 .dataOutputP0_synth	(dataOutputP0_synth[11:0]),
				 .dataOutputP1_synth	(dataOutputP1_synth[11:0]),
				 .dataOutputP2_synth	(dataOutputP2_synth[11:0]),
				 .dataOutputP3_synth	(dataOutputP3_synth[11:0]),
				 // Inputs
				 .Umbral_alto		(Umbral_alto[2:0]),
				 .Umbral_bajo		(Umbral_bajo[2:0]),
				 .clk			(clk),
				 .dataInputFIFO		(dataInputFIFO[11:0]),
				 .idx			(idx[2:0]),
				 .init			(init),
				 .popOutP0		(popOutP0),
				 .popOutP1		(popOutP1),
				 .popOutP2		(popOutP2),
				 .popOutP3		(popOutP3),
				 .pushIn		(pushIn),
				 .req			(req),
				 .reset			(reset));
   
   
endmodule // testbench
