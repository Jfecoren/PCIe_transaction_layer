

module tester(
	      input [11:0] 	data_out,
	      input 		almost_full, almost_empty,
	      output reg [11:0] data_in,
	      output reg 	reset, clk,
	      output reg 	push, pop,
	      output reg [3:0] 	state,
	      output reg [2:0] umbral_AF_in, umbral_AE_in
	      
	      );
   initial begin
      $dumpfile("fifo.vcd");	// Nombre de archivo del "dump"
      $dumpvars;		// Directiva para "dumpear" variables

      // Valores iniciales cero
      {reset, push, pop, data_in, umbral_AF_in, umbral_AE_in} = 0;
      

      @(posedge clk);
      state <= 'b0001;
      @(posedge clk);
      umbral_AF_in <= 7;
      umbral_AE_in <= 0;
      @(posedge clk);
      state <= 'b0010;
      @(posedge clk);
      state <= 'b1000;
      @(posedge clk);      
      data_in <= 'h00A;
      push <= 1;

      @(posedge clk);      
      data_in <= 'h00B;

      @(posedge clk);
      push <= 0;

      @(posedge clk);
      push <= 0;

      @(posedge clk);
      pop <= 1;
      
      @(posedge clk);
      pop <= 1;

      @(posedge clk);
      pop <= 1;
      
      @(posedge clk);
      pop <= 0;
      @(posedge clk);
      
      @(posedge clk);      
      data_in <= 'h00C;
      push <= 1;

      @(posedge clk);      
      data_in <= 'h00D;

      @(posedge clk);
      push <= 0;

      @(posedge clk);
      push <= 0;

      @(posedge clk);
      pop <= 1;
      
      @(posedge clk);
      pop <= 1;

      @(posedge clk);
      pop <= 1;
      
      @(posedge clk);
      pop <= 0;
      @(posedge clk);
      @(posedge clk);
      
      // Termina de almacenar senales
      $finish;			
   end // initial begin
   
   
   // Reloj
   initial	clk 	<= 0;			// Valor inicial al reloj, sino siempre ser indeterminado
   always	#8.4 clk 	<= ~clk;
   
endmodule
