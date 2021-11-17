module probador(
		input [4:0] 	  cuenta,
		input [4:0] 	  cuenta_est,
		output reg [11:0] data_in, data_low,
		output reg [2:0]  idx,
		output reg 	  reset, req, idle,
		output reg 	  clk
		);

   initial begin
      $dumpfile("contador.vcd");	// Nombre de archivo del "dump"
      $dumpvars;		// Directiva para "dumpear" variables

      // Valores iniciales cero
      {data_in, reset, req, idle, idx, data_low} = 0;

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
      idx <= 0;
      idle <= 1;
      
      @(posedge clk);
      idle <= 0;
      
      @(posedge clk);

      @(posedge clk);
      data_in <= 'b0000;
      idx <= 1;
      idle <= 1;

      @(posedge clk);
      data_in <= 'b0001;
      idle <= 0;
      

      @(posedge clk);
      data_in <= 'b0010;
      idx <= 2;
      idle <= 1;

      @(posedge clk);
      data_in <= 'b0011;
      idle <= 0;
      
      @(posedge clk);
      
      @(posedge clk);
      idx <= 3;
      idle <= 1;
      
      @(posedge clk);
      data_in <= 'b0010;
      idle <= 0;
      
      @(posedge clk);
      
      @(posedge clk);
      @(posedge clk);
      data_in <= 'b0011;
      idx <= 4;
      idle <= 1;
      @(posedge clk);
      idle <= 0;
      
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
