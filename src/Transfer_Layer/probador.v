module probador(
	        output reg 	  clk, req, reset, init, popOutP0, popOutP1, popOutP2, popOutP3, pushIn,
		output reg [2:0]  Umbral_bajo, Umbral_alto, idx,
		output reg [11:0] dataInputFIFO,
		input 		  counterValid,
		input [4:0] 	  counterOut,
		input [11:0] 	  dataOutputP0, dataOutputP1, dataOutputP2, dataOutputP3
		);

   initial begin
      $dumpfile("transferLayer.vcd");	// Nombre de archivo del "dump"
      $dumpvars;		// Directiva para "dumpear" variables

      // Valores iniciales cero
      {req, reset, init, popOutP0, popOutP1, popOutP2, popOutP3, pushIn, idx, Umbral_bajo, Umbral_alto, dataInputFIFO} = 0;

      @(posedge clk);
      reset <= 1;
      @(posedge clk);
      reset <= 0;
      @(posedge clk);
      init <= 1;
      @(posedge clk);
      init <= 0;
      @(posedge clk);
      
      

      // Termina de almacenar senales
      $finish;			
   end // initial begin
   
   
   // Reloj
   initial	clk 	<= 0;			// Valor inicial al reloj, sino siempre ser indeterminado
   always	#8.4 clk 	<= ~clk;
		
endmodule // probador
