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
      Umbral_alto <= 7;
      @(posedge clk);
      init <= 1;
      @(posedge clk);
      init <= 0;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 15;
      @(posedge clk);
      pushIn <= 0;
      dataInputFIFO <= 20;
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 25;
      @(posedge clk);
      dataInputFIFO <= 30;
      pushIn <= 0;
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 35;
      @(posedge clk);
      pushIn <= 0;
      dataInputFIFO <= 20;
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 25;
      @(posedge clk);
      dataInputFIFO <= 30;
      pushIn <= 0;
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 35;
      @(posedge clk);
      pushIn <= 0;
      dataInputFIFO <= 20;
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 25;
      @(posedge clk);
      dataInputFIFO <= 30;
      pushIn <= 0;
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 35;
      popOutP0 <= 1;
      popOutP1 <= 1;
      popOutP2 <= 1;
      popOutP3 <= 1;
      
      @(posedge clk);
      pushIn <= 0;
      @(posedge clk);
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
