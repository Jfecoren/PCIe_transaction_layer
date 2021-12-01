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
      /*INICIA SECCION*/ 
      // Se debe provocar almost full en todos los FIFOS de salida (no se puede hacer de forma simultanea)
      // Para esto, se utilizan cambiando los bits de destino (se debe considerar la prioridad y observar los contadores)
      repeat (15) begin
         @(posedge clk);
            dataInputFIFO <= dataInputFIFO + 12'b000100000001;    // Almost Full P0_Out (Se deben enviar las señales de POP0_out)
            pushIn <= 0;
         @(posedge clk);
            pushIn <= 1;
      end
         @(posedge clk);
            pushIn <= 0;
      // Se debe hacer pop a los fifos de salida
      /*FINALIZA SECCION*/ 
      repeat (16)
         @(posedge clk); // Esperamos a que se termine de procesar


      repeat (7) begin     // Señales de P0 out
         @(posedge clk);
            popOutP0 <= 1;
         @(posedge clk);
            popOutP0 <= 0;
      end
      repeat (7) begin     // Señales de P1 out
         @(posedge clk);
            popOutP1 <= 1;
         @(posedge clk);
            popOutP1 <= 0;
      end
      repeat (7) begin     // Señales de P2 out
         @(posedge clk);
            popOutP2 <= 1;
         @(posedge clk);
            popOutP2 <= 0;
      end
      repeat (7) begin     // Señales de P3 out
         @(posedge clk);
            popOutP3 <= 1;
         @(posedge clk);
            popOutP3 <= 0;
      end
      repeat (16) begin     // Esperamos que se actualice todo
         @(posedge clk);
      // Verificamos los contadores
      end
      // Una vez todo vacio, enviamos datos al FIFO P0 de entrada
      repeat (7) begin
         @(posedge clk);
            pushIn <= 0;
         @(posedge clk);
            dataInputFIFO <= dataInputFIFO + 12'b00000000011;    // Almost Full P0_Out (Se deben enviar las señales de POP0_out)
         @(posedge clk);
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
      repeat (16) begin
         
         @(posedge clk) begin
            popOutP0 <= 0;
            popOutP1 <= 0;
            popOutP2 <= 0;
            popOutP3 <= 0;
         end
       
         @(posedge clk) begin
            popOutP0 <= 1;
            popOutP1 <= 1;
            popOutP2 <= 1;
            popOutP3 <= 1;
         end
      end
       @(posedge clk) begin
            popOutP0 <= 0;
            popOutP1 <= 0;
            popOutP2 <= 0;
            popOutP3 <= 0;
         end
      @(posedge clk);
      idx <= 0;
      req <= 1;
      @(posedge clk);
      idx <= 1;
      @(posedge clk);
      idx <= 2;
      @(posedge clk);
      idx <= 3;
      @(posedge clk);
      idx <= 4;
      @(posedge clk);
      req <= 0;
      @(posedge clk);
      repeat (10) begin
         @(posedge clk);
      end
      

      // Termina de almacenar senales
      $finish;			
   end // initial begin
   
   
   // Reloj
   initial	clk 	<= 0;			// Valor inicial al reloj, sino siempre ser indeterminado
   always	#8 clk 	<= ~clk;
		
endmodule // probador
