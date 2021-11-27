`include "cmos_cells.v"
`include "contador.v"
`include "mux.v"
`include "fifo.v"
`include "referee_1.v"
`include "referee_2.v"
`include "state_machine.v"
`include "demultiplex.v"
`include "multiplexIn.v"
`include "multiplexOut.v"
`include "buffer3x.v"
`include "buffer2x.v"

module tcl(
	   input 	 clk, req, reset, init, popOutP0, popOutP1, popOutP2, popOutP3, pushIn,
	   input [2:0] 	 Umbral_bajo, Umbral_alto, idx,
	   input [11:0]  dataInputFIFO,
	   output 	 counterValid,
	   output [4:0]  counterOut,
	   output [11:0] dataOutputP0, dataOutputP1, dataOutputP2, dataOutputP3
	   );

   wire 		     clk, reset, init, empty0, empty1, empty2, empty3, empty4, empty5, empty6, empty7, req, push_P0_A1, push_P1_A1, push_P2_A1, push_P3_A1, pop_P0_A1, pop_P1_A1, pop_P2_A1, pop_P3_A1;
   wire 		     almost_full_P0_A1, almost_full_P1_A1, almost_full_P2_A1, almost_full_P3_A1, almost_empty_P0_A1, almost_empty_P1_A1, almost_empty_P2_A1, almost_empty_P3_A1, push_P0_A2, push_P1_A2, push_P2_A2, push_P3_A2;
   wire 		     almost_full_P0_A2, almost_full_P1_A2, almost_full_P2_A2, almost_full_P3_A2, almost_empty_A2, pushIn, pop_A2, popOutP0, popOutP1, popOutP2, popOutP3, counterValid;
   wire [2:0] 		     umbral_AF_in, umbral_AE_in, Umbral_alto, Umbral_bajo, idx;
   wire [3:0] 		     state;
   wire [4:0] 		     cuenta0, cuenta1, cuenta2, cuenta3, cuenta4, counterOut;
   wire [11:0] 		     dataInFIFO, dataInP0, dataInP1, dataInP2, dataInP3, dataOutP0, dataOutP1, dataOutP2, dataOutP3, demuxOut;
   wire [11:0] 		     dataMidP0, dataMidP1, dataMidP2, dataMidP3, dataInputFIFO, dataOutputP0, dataOutputP1, dataOutputP2, dataOutputP3;
   
   // Buffer 3x referee 1
   wire [3:0]			buffer_ref1;
	wire [3:0] buffer_pushes;
	assign push_P0_A1 = buffer_pushes[0];
	assign push_P1_A1 = buffer_pushes[1];
	assign push_P2_A1 = buffer_pushes[2];
	assign push_P3_A1 = buffer_pushes[3];

	buffer3x buffer_referee_1(
				.data_in		(buffer_ref1),
				.clk			(clk),
				.data_out		(buffer_pushes)

	);

	// Buffer 2x referee 2
   wire [3:0]			buffer_ref2;
	wire [3:0] buffer_pushes_2;
	assign push_P0_A2 = buffer_pushes_2[0];
	assign push_P1_A2 = buffer_pushes_2[1];
	assign push_P2_A2 = buffer_pushes_2[2];
	assign push_P3_A2 = buffer_pushes_2[3];

	buffer2x buffer_referee_2(
				.data_in		(buffer_ref2),
				.clk			(clk),
				.data_out		(buffer_pushes_2)

	);

   // Maquina de Estados
   state_machine maquinaEstados(
				// Outputs
				.umbral_superior(umbral_AF_in[2:0]),
				.umbral_inferior(umbral_AE_in[2:0]),
				.State		(state[3:0]),
				// Inputs
				.clk		(clk),
				.Umbral_bajo	(Umbral_bajo[2:0]), 
				.Umbral_alto	(Umbral_alto[2:0]), 
				.reset		(reset),            
				.init		(init),             
				.empty0		(almost_empty_P0_A1),
				.empty1		(almost_empty_P1_A1),
				.empty2		(almost_empty_P2_A1),
				.empty3		(almost_empty_P3_A1),
				.empty4		(empty4),
				.empty5		(empty5),
				.empty6		(empty6),
				.empty7		(empty7));
   // Banco Contadores
   mux bancoContadores(
		       // Outputs
		       .data		(counterOut[4:0]), 
		       .valid		(counterValid),    
		       // Inputs
		       .in0		(cuenta0[4:0]),
		       .in1		(cuenta1[4:0]),
		       .in2		(cuenta2[4:0]),
		       .in3		(cuenta3[4:0]),
		       .in4		(cuenta4[4:0]),
		       .state		(state[3:0]),
		       .idx		(idx[2:0]), 
		       .req		(req),      
		       .clk		(clk));
   // Contadores
   contador c0(
	       // Outputs
	       .cuenta			(cuenta0[4:0]),
	       // Inputs
	       .data_in			(dataOutputP0[11:0]),
	       .state			(state[3:0]),
	       .clk			(clk));
   contador c1(
	       // Outputs
	       .cuenta			(cuenta1[4:0]),
	       // Inputs
	       .data_in			(dataOutputP1[11:0]),
	       .state			(state[3:0]),
	       .clk			(clk));
   contador c2(
	       // Outputs
	       .cuenta			(cuenta2[4:0]),
	       // Inputs
	       .data_in			(dataOutputP2[11:0]),
	       .state			(state[3:0]),
	       .clk			(clk));
   contador c3(
	       // Outputs
	       .cuenta			(cuenta3[4:0]),
	       // Inputs
	       .data_in			(dataOutputP3[11:0]),
	       .state			(state[3:0]),
	       .clk			(clk));
   contador c4(
	       // Outputs
	       .cuenta			(cuenta4[4:0]),
	       // Inputs
	       .data_in			(dataInFIFO[11:0]),
	       .state			(state[3:0]),
	       .clk			(clk));
   
   // Arbitros
   referee_1 arbitro1(
		      // Outputs
		      .push_0		(buffer_ref1[0]),
		      .push_1		(buffer_ref1[1]),
		      .push_2		(buffer_ref1[2]),
		      .push_3		(buffer_ref1[3]),
		      .pop_0		(pop_P0_A1),
		      .pop_1		(pop_P1_A1),
		      .pop_2		(pop_P2_A1),
		      .pop_3		(pop_P3_A1),
			  .data_in  (demuxOut[11:0]),			  			  			  
		      // Inputs
		      .almost_full_0	(almost_full_P0_A1),
		      .almost_full_1	(almost_full_P1_A1),
		      .almost_full_2	(almost_full_P2_A1),
		      .almost_full_3	(almost_full_P3_A1),
		      .empty_0		(almost_empty_P0_A1),
		      .empty_1		(almost_empty_P1_A1),
		      .empty_2		(almost_empty_P2_A1),
		      .empty_3		(almost_empty_P3_A1),
		      .clk		(clk),
		      .state		(state[3:0])); //Hay que cambiar a estado
   referee_2 arbitro2(
		      // Outputs
		      .push_0		(buffer_ref2[0]),
		      .push_1		(buffer_ref2[1]),
		      .push_2		(buffer_ref2[2]),
		      .push_3		(buffer_ref2[3]),
		      .pop		(pop_A2),
			  .data_in  (dataInFIFO[11:0]),
		      // Inputs	
		      .almost_full_0	(almost_full_P0_A2),
		      .almost_full_1	(almost_full_P1_A2),
		      .almost_full_2	(almost_full_P2_A2),
		      .almost_full_3	(almost_full_P3_A2),
		      .empty		(almost_empty_A2),
		      .clk		(clk),
		      .state		(state[3:0])); //Hay que cambiar a estado
   // Multiplexor entradas
   multiplexIn multiplexorEntrada(
				  // Outputs
				  .p0			(dataInP0[11:0]),
				  .p1			(dataInP1[11:0]),
				  .p2			(dataInP2[11:0]),
				  .p3			(dataInP3[11:0]),
				  // Inputs
				  .dataInput		(dataInFIFO[11:0]),
				  .states		(state[3:0]),
				  .clk			(clk));
   // Multiplexor salidas
   multiplexOut multiplexorSalida(
				  // Outputs
				  .out0			(dataOutP0[11:0]),
				  .out1			(dataOutP1[11:0]),
				  .out2			(dataOutP2[11:0]),
				  .out3			(dataOutP3[11:0]),
				  // Inputs
				  .dataInput		(demuxOut[11:0]),
				  .states		(state[3:0]),
				  .clk			(clk));
   // Demultiplexor
   demultiplex demultiplexor(
			     // Outputs
			     .demuxOut		(demuxOut[11:0]),
			     // Inputs
			     .p0		(dataMidP0[11:0]),
			     .p1		(dataMidP1[11:0]),
			     .p2		(dataMidP2[11:0]),
			     .p3		(dataMidP3[11:0]),
			     .state		(state[3:0]),
			     .valid0		(pop_P0_A1),
			     .valid1		(pop_P1_A1),
			     .valid2		(pop_P2_A1),
			     .valid3		(pop_P3_A1),
			     .clk		(clk));
   
   // FIFO Entrada
   fifo fifoIn(
	       // Outputs
	       .data_out		(dataInFIFO[11:0]),
	       .almost_empty		(almost_empty_A2),
	       // Inputs
	       .data_in			(dataInputFIFO[11:0]),
	       .clk			(clk),
	       .umbral_AF_in		(umbral_AF_in[2:0]),
	       .umbral_AE_in		(umbral_AE_in[2:0]),
	       .push			(pushIn),
	       .pop			(pop_A2),
	       .state			(state[3:0]));

   // Bloque FIFOs entrada
   fifo fifoInP0(
		 // Outputs
		 .data_out		(dataMidP0[11:0]),
		 .almost_full		(almost_full_P0_A2),
		 .almost_empty		(almost_empty_P0_A1),
		 // Inputs
		 .data_in		(dataInP0[11:0]),
		 .clk			(clk),
		 .umbral_AF_in		(umbral_AF_in[2:0]),
		 .umbral_AE_in		(umbral_AE_in[2:0]),
		 .push			(push_P0_A2),
		 .pop			(pop_P0_A1),
		 .state			(state[3:0]));
   fifo fifoInP1(
		 // Outputs
		 .data_out		(dataMidP1[11:0]),
		 .almost_full		(almost_full_P1_A2),
		 .almost_empty		(almost_empty_P1_A1),
		 // Inputs
		 .data_in		(dataInP1[11:0]),
		 .clk			(clk),
		 .umbral_AF_in		(umbral_AF_in[2:0]),
		 .umbral_AE_in		(umbral_AE_in[2:0]),
		 .push			(push_P1_A2),
		 .pop			(pop_P1_A1),
		 .state			(state[3:0]));
   fifo fifoInP2(
		 // Outputs
		 .data_out		(dataMidP2[11:0]),
		 .almost_full		(almost_full_P2_A2),
		 .almost_empty		(almost_empty_P2_A1),
		 // Inputs
		 .data_in		(dataInP2[11:0]),
		 .clk			(clk),
		 .umbral_AF_in		(umbral_AF_in[2:0]),
		 .umbral_AE_in		(umbral_AE_in[2:0]),
		 .push			(push_P2_A2),
		 .pop			(pop_P2_A1),
		 .state			(state[3:0]));
   fifo fifoInP3(
		 // Outputs
		 .data_out		(dataMidP3[11:0]),
		 .almost_full		(almost_full_P3_A2),
		 .almost_empty		(almost_empty_P3_A1),
		 // Inputs
		 .data_in		(dataInP3[11:0]),
		 .clk			(clk),
		 .umbral_AF_in		(umbral_AF_in[2:0]),
		 .umbral_AE_in		(umbral_AE_in[2:0]),
		 .push			(push_P3_A2),
		 .pop			(pop_P3_A1),
		 .state			(state[3:0]));
   // Bloque FIFOs salida
   fifo fifoOutP0(
		  // Outputs
		  .data_out		(dataOutputP0[11:0]),
		  .almost_full		(almost_full_P0_A1),
		  .almost_empty		(empty4),
		  // Inputs
		  .data_in		(dataOutP0[11:0]),
		  .clk			(clk),
		  .umbral_AF_in		(umbral_AF_in[2:0]),
		  .umbral_AE_in		(umbral_AE_in[2:0]),
		  .push			(push_P0_A1),
		  .pop			(popOutP0),
		  .state		(state[3:0]));
   fifo fifoOutP1(
		  // Outputs
		  .data_out		(dataOutputP1[11:0]),
		  .almost_full		(almost_full_P1_A1),
		  .almost_empty		(empty5),
		  // Inputs
		  .data_in		(dataOutP1[11:0]),
		  .clk			(clk),
		  .umbral_AF_in		(umbral_AF_in[2:0]),
		  .umbral_AE_in		(umbral_AE_in[2:0]),
		  .push			(push_P1_A1),
		  .pop			(popOutP1),
		  .state		(state[3:0]));
   fifo fifoOutP2(
		  // Outputs
		  .data_out		(dataOutputP2[11:0]),
		  .almost_full		(almost_full_P2_A1),
		  .almost_empty		(empty6),
		  // Inputs
		  .data_in		(dataOutP2[11:0]),
		  .clk			(clk),
		  .umbral_AF_in		(umbral_AF_in[2:0]),
		  .umbral_AE_in		(umbral_AE_in[2:0]),
		  .push			(push_P2_A1),
		  .pop			(popOutP2),
		  .state		(state[3:0]));
   fifo fifoOutP3(
		  // Outputs
		  .data_out		(dataOutputP3[11:0]),
		  .almost_full		(almost_full_P3_A1),
		  .almost_empty		(empty7),
		  // Inputs
		  .data_in		(dataOutP3[11:0]),
		  .clk			(clk),
		  .umbral_AF_in		(umbral_AF_in[2:0]),
		  .umbral_AE_in		(umbral_AE_in[2:0]),
		  .push			(push_P3_A1),
		  .pop			(popOutP3),
		  .state		(state[3:0]));
   
   
endmodule // tcl
