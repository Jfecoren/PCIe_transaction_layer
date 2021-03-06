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
      Umbral_alto <= 6;
      @(posedge clk);
      init <= 1;
      @(posedge clk);
      init <= 0;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      dataInputFIFO <= 15;
      pushIn <= 1;
      @(posedge clk);
      dataInputFIFO <= 20;
      pushIn <= 0;
      @(posedge clk);
      dataInputFIFO <= 25;
      @(posedge clk);
      pushIn <= 1;
      @(posedge clk);
      dataInputFIFO <= 30;
      pushIn <= 0;
      @(posedge clk);
      dataInputFIFO <= 35;
      pushIn <= 1;
      @(posedge clk);
      pushIn <= 0;
      dataInputFIFO <= 21;
      @(posedge clk);
      pushIn <= 1;
      @(posedge clk);
      dataInputFIFO <= 22;
      pushIn <= 0;
      @(posedge clk);
      pushIn <= 1;
      @(posedge clk);
      dataInputFIFO <= 31;
      pushIn <= 0;
      @(posedge clk);
      pushIn <= 1;
      @(posedge clk);
      dataInputFIFO <= 36;
      pushIn <= 0;
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 24;
      @(posedge clk);
      pushIn <= 0;
      @(posedge clk);
      dataInputFIFO <= 29;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      @(posedge clk);
      dataInputFIFO <= 30;
      pushIn <= 0;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 0;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 'b010111111111;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 0;
      dataInputFIFO <= 'b101011111111;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 'b111111111111;
      @(posedge clk);
      @(posedge clk);
      dataInputFIFO <= 30;
      pushIn <= 0;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 35;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 0;
      dataInputFIFO <= 20;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 25;
      @(posedge clk);
      @(posedge clk);
      dataInputFIFO <= 30;
      pushIn <= 0;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 35;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 0;
      dataInputFIFO <= 20;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 25;
      @(posedge clk);
      @(posedge clk);
      dataInputFIFO <= 30;
      pushIn <= 0;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 35;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 15;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 0;
      dataInputFIFO <= 20;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 25;
      @(posedge clk);
      @(posedge clk);
      dataInputFIFO <= 30;
      pushIn <= 0;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 35;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 0;
      dataInputFIFO <= 20;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 25;
      @(posedge clk);
      @(posedge clk);
      dataInputFIFO <= 30;
      pushIn <= 0;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 35;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 0;
      dataInputFIFO <= 20;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 25;
      @(posedge clk);
      @(posedge clk);
      dataInputFIFO <= 30;
      pushIn <= 0;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 35;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 15;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 0;
      dataInputFIFO <= 20;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 25;
      @(posedge clk);
      @(posedge clk);
      dataInputFIFO <= 30;
      pushIn <= 0;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 35;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 0;
      dataInputFIFO <= 20;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 25;
      @(posedge clk);
      @(posedge clk);
      dataInputFIFO <= 30;
      pushIn <= 0;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 35;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 0;
      dataInputFIFO <= 20;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 25;
      @(posedge clk);
      @(posedge clk);
      dataInputFIFO <= 30;
      pushIn <= 0;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 35;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 0;
      dataInputFIFO <= 35;
      @(posedge clk);
      @(posedge clk);
      popOutP0 <= 1;
      popOutP1 <= 1;
      popOutP2 <= 1;
      popOutP3 <= 1;
      @(posedge clk);
      popOutP0 <= 0;
      popOutP1 <= 0;
      popOutP2 <= 0;
      popOutP3 <= 0;
      @(posedge clk);
      popOutP0 <= 1;
      popOutP1 <= 1;
      popOutP2 <= 1;
      popOutP3 <= 1;
      @(posedge clk);
      popOutP0 <= 0;
      popOutP1 <= 0;
      popOutP2 <= 0;
      popOutP3 <= 0;
      @(posedge clk);
      popOutP0 <= 1;
      popOutP1 <= 1;
      popOutP2 <= 1;
      popOutP3 <= 1;
      @(posedge clk);
      popOutP0 <= 0;
      popOutP1 <= 0;
      popOutP2 <= 0;
      popOutP3 <= 0;
      @(posedge clk);
      popOutP0 <= 1;
      popOutP1 <= 1;
      popOutP2 <= 1;
      popOutP3 <= 1;
      @(posedge clk);
      popOutP0 <= 0;
      popOutP1 <= 0;
      popOutP2 <= 0;
      popOutP3 <= 0;
      @(posedge clk);
      popOutP0 <= 1;
      popOutP1 <= 1;
      popOutP2 <= 1;
      popOutP3 <= 1;
      @(posedge clk);
      popOutP0 <= 0;
      popOutP1 <= 0;
      popOutP2 <= 0;
      popOutP3 <= 0;
      @(posedge clk);
      popOutP0 <= 1;
      popOutP1 <= 1;
      popOutP2 <= 1;
      popOutP3 <= 1;
      @(posedge clk);
      popOutP0 <= 0;
      popOutP1 <= 0;
      popOutP2 <= 0;
      popOutP3 <= 0;
      @(posedge clk);
      popOutP0 <= 1;
      popOutP1 <= 1;
      popOutP2 <= 1;
      popOutP3 <= 1;
      @(posedge clk);
      popOutP0 <= 0;
      popOutP1 <= 0;
      popOutP2 <= 0;
      popOutP3 <= 0;
      @(posedge clk);
      popOutP0 <= 1;
      popOutP1 <= 1;
      popOutP2 <= 1;
      popOutP3 <= 1;
      @(posedge clk);
      popOutP0 <= 0;
      popOutP1 <= 0;
      popOutP2 <= 0;
      popOutP3 <= 0;
      @(posedge clk);
      popOutP0 <= 1;
      popOutP1 <= 1;
      popOutP2 <= 1;
      popOutP3 <= 1;
      @(posedge clk);
      popOutP0 <= 0;
      popOutP1 <= 0;
      popOutP2 <= 0;
      popOutP3 <= 0;
      @(posedge clk);
      popOutP0 <= 1;
      popOutP1 <= 1;
      popOutP2 <= 1;
      popOutP3 <= 1;
      @(posedge clk);
      popOutP0 <= 0;
      popOutP1 <= 0;
      popOutP2 <= 0;
      popOutP3 <= 0;
      @(posedge clk);
      popOutP0 <= 1;
      popOutP1 <= 1;
      popOutP2 <= 1;
      popOutP3 <= 1;
      @(posedge clk);
      popOutP0 <= 0;
      popOutP1 <= 0;
      popOutP2 <= 0;
      popOutP3 <= 0;
      @(posedge clk);
      popOutP0 <= 1;
      popOutP1 <= 1;
      popOutP2 <= 1;
      popOutP3 <= 1;
      @(posedge clk);
      popOutP0 <= 0;
      popOutP1 <= 0;
      popOutP2 <= 0;
      popOutP3 <= 0;
      @(posedge clk);
      popOutP0 <= 1;
      popOutP1 <= 1;
      popOutP2 <= 1;
      popOutP3 <= 1;
      @(posedge clk);

      popOutP0 <= 0;
      popOutP1 <= 0;
      popOutP2 <= 0;
      popOutP3 <= 0;

      @(posedge clk);
      idx <= 1;
      req <= 1;
      @(posedge clk);
      idx <= 2;
      @(posedge clk);
      idx <= 3;
      @(posedge clk);
      idx <= 4;
      @(posedge clk);
      req <= 0;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      
      

      // Termina de almacenar senales
      $finish;			
   end // initial begin
   
   
   // Reloj
   initial	clk 	<= 0;			// Valor inicial al reloj, sino siempre ser indeterminado
   always	#8.4 clk 	<= ~clk;
		
endmodule // probador
