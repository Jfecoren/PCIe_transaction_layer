

module tester(
	      input [11:0] 	data_out, data_out_str,
	      input 		almost_full, almost_empty, almost_full_str, almost_empty_str,
	      output reg [11:0] data_in,
	      output reg 	reset, clk,
	      output reg 	push, pop
	      );
   initial begin
      $dumpfile("fifo.vcd");
      $dumpvars;

      // Initial values
      {reset, push, pop, data_in} = 0;
      

      @(posedge clk);
      reset <= 1;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      
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
      pop <= 0;

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
      pop <= 0;

      @(posedge clk);
      pop <= 1;
      
      @(posedge clk);
      pop <= 0;
      @(posedge clk);
      @(posedge clk);
      
      
      $finish;			
   end // initial begin
   
   
   // Clock
   initial clk <= 0;
   always #8.4 clk <= ~clk;
   
endmodule
