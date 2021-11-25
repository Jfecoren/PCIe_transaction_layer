`timescale 	1ns	/ 100ps

`include "state_machine.v"
`include "tester.v"
`include "cmos_cells.v"
`include "state_machine_synth.v"

module testbench;
 wire [2:0] umbral_superior, umbral_inferior, Umbral_alto, Umbral_bajo;
 wire [3:0] State, State_est;
 wire clk, reset, init, empty0,empty1,empty2,empty3,empty4,empty5,empty6,empty7;

    state_machine sm(/*AUTOINST*/
		     // Outputs
		     .umbral_superior	(umbral_superior[2:0]),
		     .umbral_inferior	(umbral_inferior[2:0]),
		     .State		(State[3:0]),
		     // Inputs
		     .clk		(clk),
		     .Umbral_bajo	(Umbral_bajo[2:0]),
		     .Umbral_alto	(Umbral_alto[2:0]),
		     .reset		(reset),
		     .init		(init),
		     .empty0		(empty0),
		     .empty1		(empty1),
		     .empty2		(empty2),
		     .empty3		(empty3),
		     .empty4		(empty4),
		     .empty5		(empty5),
		     .empty6		(empty6),
		     .empty7		(empty7));

    
    tester t(/*AUTOINST*/
	     // Outputs
	     .clk			(clk),
	     .Umbral_bajo		(Umbral_bajo[2:0]),
	     .Umbral_alto		(Umbral_alto[2:0]),
	     .reset			(reset),
	     .init			(init),
	     .empty0			(empty0),
	     .empty1			(empty1),
	     .empty2			(empty2),
	     .empty3			(empty3),
	     .empty4			(empty4),
	     .empty5			(empty5),
	     .empty6			(empty6),
	     .empty7			(empty7),
	     // Inputs
	     .umbral_superior		(umbral_superior[2:0]),
	     .umbral_inferior		(umbral_inferior[2:0]),
	     .State			(State[3:0]));
    
    state_machine_synth sms(/*AUTOINST*/
			    // Outputs
			    .State_est		(State_est[3:0]),
			    .umbral_inferior	(umbral_inferior[2:0]),
			    .umbral_superior	(umbral_superior[2:0]),
			    // Inputs
			    .Umbral_alto	(Umbral_alto[2:0]),
			    .Umbral_bajo	(Umbral_bajo[2:0]),
			    .clk		(clk),
			    .empty0		(empty0),
			    .empty1		(empty1),
			    .empty2		(empty2),
			    .empty3		(empty3),
			    .empty4		(empty4),
			    .empty5		(empty5),
			    .empty6		(empty6),
			    .empty7		(empty7),
			    .init		(init),
			    .reset		(reset));


endmodule





    
