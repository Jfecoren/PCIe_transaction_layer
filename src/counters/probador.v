module probador(
		input [15:0] 	  cuenta,
		input [15:0] 	  cuenta_est,
		output reg [11:0] data_in,
		output reg 	  reset,
		output reg 	  clk
		);

   initial begin
      $dumpfile("contador.vcd");	// Nombre de archivo del "dump"
      $dumpvars;		// Directiva para "dumpear" variables

      // Valores iniciales cero
      {data_in, reset} = 0;

      @(posedge clk);
      @(posedge clk);
      reset <= 1;
      @(posedge clk);
      @(posedge clk);
      
      @(posedge clk);
      data_in <= 'b0000;

      @(posedge clk);
      data_in <= 'b0001;

      @(posedge clk);
      data_in <= 'b0010;

      @(posedge clk);
      data_in <= 'b0011;

      @(posedge clk);
      @(posedge clk);
      @(posedge clk);

      @(posedge clk);
      data_in <= 'b0000;

      @(posedge clk);
      data_in <= 'b0001;

      @(posedge clk);
      data_in <= 'b0010;

      @(posedge clk);
      data_in <= 'b0011;
      @(posedge clk);
      
      @(posedge clk);
      @(posedge clk);
      data_in <= 'b0010;
      @(posedge clk);
      
      @(posedge clk);
      @(posedge clk);
      data_in <= 'b0011;
      @(posedge clk);
      @(posedge clk);
      data_in <= 'b0000;
      @(posedge clk);
       @(posedge clk);
      data_in <= 'b0000;

      @(posedge clk);
      data_in <= 'b0001;

      @(posedge clk);
      data_in <= 'b0010;

      @(posedge clk);
      data_in <= 'b0011;
       @(posedge clk);
      data_in <= 'b0000;

      @(posedge clk);
      data_in <= 'b0001;

      @(posedge clk);
      data_in <= 'b0010;

      @(posedge clk);
      data_in <= 'b0011;
       @(posedge clk);
      data_in <= 'b0000;

      @(posedge clk);
      data_in <= 'b0001;

      @(posedge clk);
      data_in <= 'b0010;

      @(posedge clk);
      data_in <= 'b0011;
       @(posedge clk);
      data_in <= 'b0000;

      @(posedge clk);
      data_in <= 'b0001;

      @(posedge clk);
      data_in <= 'b0010;

      @(posedge clk);
      data_in <= 'b0011;
       @(posedge clk);
      data_in <= 'b0000;

      @(posedge clk);
      data_in <= 'b0001;

      @(posedge clk);
      data_in <= 'b0010;

      @(posedge clk);
      data_in <= 'b0011;
       @(posedge clk);
      data_in <= 'b0000;

      @(posedge clk);
      data_in <= 'b0001;

      @(posedge clk);
      data_in <= 'b0010;

      @(posedge clk);
      data_in <= 'b0011;
       @(posedge clk);
      data_in <= 'b0000;

      @(posedge clk);
      data_in <= 'b0001;

      @(posedge clk);
      data_in <= 'b0010;

      @(posedge clk);
      data_in <= 'b0011;
       @(posedge clk);
      data_in <= 'b0000;

      @(posedge clk);
      data_in <= 'b0001;

      @(posedge clk);
      data_in <= 'b0010;

      @(posedge clk);
      data_in <= 'b0011;

      // Termina de almacenar senales
      $finish;			
   end // initial begin
   
   
   // Reloj
   initial	clk 	<= 0;			// Valor inicial al reloj, sino siempre ser indeterminado
   always	#8.4 clk 	<= ~clk;
		
endmodule // probador
