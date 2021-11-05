module probador(
    input [11:0]      q_a,
    input [11:0]      q_b,
    input [11:0]      q_a_est,
    input [11:0]      q_b_est,
    output reg 	     we_a,
    output reg 	     we_b,
    output reg [2:0] addr_a,
    output reg [2:0] addr_b,
    output reg [11:0] data_a,
    output reg [11:0] data_b,
    output reg 	     clk
);

   initial begin
      $dumpfile("memoria.vcd");	// Nombre de archivo del "dump"
      $dumpvars;		// Directiva para "dumpear" variables

      // Valores iniciales cero
      {we_a, we_b, addr_a, addr_b, data_a, data_b} = 0;

      @(posedge clk);
      we_a <= 1;
      we_b <= 1;
      
      @(posedge clk);
      addr_a <= 'b000;
      addr_b <= 'b001;
      data_a <= 'h00A;
      data_b <= 'h00B;
      
      @(posedge clk);
      addr_a <= 'b010;
      addr_b <= 'b011;
      data_a <= 'h0AA;
      data_b <= 'h0BB;

      @(posedge clk);
      we_a <= 0;
      we_b <= 0;

      @(posedge clk);
      addr_a <= 'b000;
      addr_b <= 'b001;
      
      @(posedge clk);
      
      @(posedge clk);
      addr_a <= 'b010;
      addr_b <= 'b011;

      // Termina de almacenar senales
      $finish;			
   end // initial begin
   
   
   // Reloj
   initial	clk 	<= 0;			// Valor inicial al reloj, sino siempre ser indeterminado
   always	#8.4 clk 	<= ~clk;
		
endmodule // probador
