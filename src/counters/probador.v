module probador(
		input [4:0] 	  cuenta,
		input [4:0] 	  cuenta_est,
		output reg [11:0] data_in, data_low,
		output reg [2:0]  idx,
		output reg [3:0]  state,
		output reg 	  reset, req, idle,
		output reg 	  clk
		);

   initial begin
      $dumpfile("contador.vcd");	// Nombre de archivo del "dump"
      $dumpvars;		// Directiva para "dumpear" variables

      // Valores iniciales cero
      {data_in, req, idle, idx, data_low, reset} = 0;

      @(posedge clk);
      reset <= 1;
      state <= 'b0001;
 
      @(posedge clk);
      state <= 'b1000;
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
      state <= 'b0100;
      req <= 1;
      
      @(posedge clk);
      state <= 'b1000;
      
      @(posedge clk);

      @(posedge clk);
      data_in <= 'b0000;
      idx <= 1;
      state <= 'b0100;

      @(posedge clk);
      data_in <= 'b0001;
      state <= 'b1000;
      

      @(posedge clk);
      data_in <= 'b0010;
      idx <= 2;
      state <= 'b0100;

      @(posedge clk);
      data_in <= 'b0011;
      state <= 'b1000;
      
      @(posedge clk);
      
      @(posedge clk);
      idx <= 3;
      state <= 'b0100;
      
      @(posedge clk);
      data_in <= 'b0010;
      state <= 'b1000;
      
      @(posedge clk);
      
      @(posedge clk);
      @(posedge clk);
      data_in <= 'b0011;
      idx <= 4;
      state <= 'b0100;
      @(posedge clk);
      state <= 'b1000;
      

      // Termina de almacenar senales
      $finish;			
   end // initial begin
   
   
   // Reloj
   initial	clk 	<= 0;			// Valor inicial al reloj, sino siempre ser indeterminado
   always	#8.4 clk 	<= ~clk;
		
endmodule // probador
