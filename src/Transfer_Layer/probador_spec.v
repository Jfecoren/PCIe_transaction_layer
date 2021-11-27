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
      $dumpvars;		                  // Directiva para "dumpear" variables

      // Valores iniciales cero
      {req, init, popOutP0, popOutP1, popOutP2, popOutP3, pushIn, idx, Umbral_bajo, Umbral_alto, dataInputFIFO} = 0;

      // Inicialmente activamos tanto el reset como el init
      @(posedge clk);
         reset <= 1;
         init <= 1;
      
      // Esperamos un par de ciclos de reloj
      @(posedge clk);
      @(posedge clk);
         reset <= 0;             // Liberamos la señal de reset
         Umbral_alto <= 5;       // Modificamos los umbrales una vez
         Umbral_bajo <= 1;       
      @(posedge clk);     
      @(posedge clk);
         Umbral_alto <= 6;       // Modificamos los umbrales por segunda vez
         Umbral_bajo <= 0;       
         init <= 0;              // Liberamos la señal de init
      @(posedge clk);   
      // Se debe provocar almost full en todos los FIFOS de salida (no se puede hacer de forma simultanea) /*SOLAMENTE IMPLEMENTADO PARA P0*/
      repeat (7) begin
         @(posedge clk);
            pushIn <= 0;
         @(posedge clk);
            dataInputFIFO <= dataInputFIFO + 12'b000000000001;    // Almost Full P0_Out (Se deben enviar las señales de POP0_out)
            pushIn <= 1;
      end
         @(posedge clk);
            pushIn <= 0;
      
      repeat (7) begin     // Señales de P0 out
         @(posedge clk);
            popOutP0 <= 1;
         @(posedge clk);
            popOutP0 <= 0;
      end
      // Una vez todo vacio, enviamos datos al FIFO P0 de entrada
      repeat (7) begin
         @(posedge clk);
            pushIn <= 0;
         @(posedge clk);
            dataInputFIFO <= dataInputFIFO + 12'b00000000011;    // Almost Full P0_Out (Se deben enviar las señales de POP0_out)
            pushIn <= 1;
      end
         @(posedge clk);
            pushIn <= 0;
      repeat (7) begin     // Señales de P0 out
         @(posedge clk);
            popOutP0 <= 1;
         @(posedge clk);
            popOutP0 <= 0;
      end
      // En este punto se deben confirmar que los contadores concuerden
      @(posedge clk);
      @(posedge clk);
      dataInputFIFO <= 15;
      @(posedge clk);
      @(posedge clk);
      pushIn <= 1;
      dataInputFIFO <= 20;
      @(posedge clk);
      pushIn <= 0;
      @(posedge clk);
      dataInputFIFO <= 25;
      @(posedge clk);
      pushIn <= 1;
      @(posedge clk);
      dataInputFIFO <= 30;
      pushIn <= 0;
      @(posedge clk);
      @(posedge clk);
      dataInputFIFO <= 35;
      @(posedge clk);
      pushIn <= 1;
      @(posedge clk);
      pushIn <= 0;
      dataInputFIFO <= 21;
      @(posedge clk);
      @(posedge clk);
      dataInputFIFO <= 22;
      @(posedge clk);
      pushIn <= 1;
      @(posedge clk);
      dataInputFIFO <= 31;
      pushIn <= 0;
      @(posedge clk);
      @(posedge clk);
      dataInputFIFO <= 36;
      @(posedge clk);
      pushIn <= 1;
      @(posedge clk);
      pushIn <= 0;
      dataInputFIFO <= 24;
      @(posedge clk);
      @(posedge clk);
      dataInputFIFO <= 29;
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
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
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
