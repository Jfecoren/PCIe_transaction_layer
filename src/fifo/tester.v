

module tester(
	      input [11:0] 	data_out, data_out_str,
	      input 		almost_full, almost_empty, empty_f, almost_full_str, almost_empty_str, empty_f_str,
	      output reg [11:0] data_in,
         output reg [3:0] state,
	      output reg 	clk,
	      output reg 	push, pop,
         output reg [2:0] init_full, init_empty
	      );
   initial begin
      $dumpfile("fifo.vcd");
      $dumpvars;

      // Initial values
      {push, pop, data_in} = 0;
      state = 4'b0001;

      @(posedge clk);
         init_full <= 6;
         init_empty <= 1;
      @(posedge clk);
      @(posedge clk);
         state <= 4'b0010;
      @(posedge clk);
         state <= 4'b0100;
      
      @(posedge clk);
         state <= 4'b1000;      
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
