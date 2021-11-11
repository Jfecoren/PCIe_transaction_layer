module tester(
    input [11:0]      q_w,
    input [11:0]      q_r,
    input [11:0]      q_w_str,
    input [11:0]      q_r_str,
    output reg 	     wr_e,
    output reg 	     rd_e,
    output reg [2:0] wr_ptr,
    output reg [2:0] rd_ptr,
    output reg [11:0] data_w,
    output reg [11:0] data_r,
    output reg 	     clk
);

   initial begin
      $dumpfile("memory.vcd");	// Nombre de archivo del "dump"
      $dumpvars;		// Directiva para "dumpear" variables

      // Valores iniciales cero
      {wr_e, rd_e, wr_ptr, rd_ptr, data_w, data_r} = 0;

      @(posedge clk);
      wr_e <= 1;
      rd_e <= 1;
      
      @(posedge clk);
      wr_ptr <= 'b000;
      rd_ptr <= 'b001;
      data_w <= 'h00A;
      data_r <= 'h00B;
      
      @(posedge clk);
      wr_ptr <= 'b010;
      rd_ptr <= 'b011;
      data_w <= 'h0AA;
      data_r <= 'h0BB;

      @(posedge clk);
      wr_e <= 0;
      rd_e <= 0;

      @(posedge clk);
      wr_ptr <= 'b000;
      rd_ptr <= 'b001;
      
      @(posedge clk);
      
      @(posedge clk);
      wr_ptr <= 'b010;
      rd_ptr <= 'b011;

      // Termina de almacenar senales
      $finish;			
   end // initial begin
   
   
   // Reloj
   initial	clk 	<= 0;			// Valor inicial al reloj, sino siempre ser indeterminado
   always	#8.4 clk 	<= ~clk;
		
endmodule // probador
