module mux(
	   input [4:0] in0, in1, in2, in3, in4,
	   input [2:0] idx,
	   input req, reset, clk, idle,
	   output reg [4:0] data,
	   output reg valid
	   );
   
   always @(posedge clk) begin
      if(~reset) begin
	 data <= 0;
	 valid <= 0;
      end else
	if(idle) begin
	   valid <= 1;
	   if(idx == 0)
	     data <= in0;
	   else if(idx == 1)
	     data <= in1;
	   else if(idx == 2)
	     data <= in2;
	   else if(idx == 3)
	     data <= in3;
	   else
	     data <= in4;
	end else // if (idle)
	  valid <= 0;
   end // always @ (posedge clk)
   
endmodule // mux
