module multiplexIn(
		   input [11:0]      dataInput,
		   input [3:0] 	     states,
		   input 	     clk,
		   output reg [11:0] p0, p1, p2, p3
		   );

   always @(posedge clk) begin
      if(states == 'b0001) begin
	 {p0, p1, p2, p3} <= 0;
      end else begin
	 if(dataInput[11:10] == 'b00)
	   p0 <= dataInput;
	 else if(dataInput[11:10] == 'b01)
	   p1 <= dataInput;
	 else if(dataInput[11:10] == 'b10)
	   p2 <= dataInput;
	 else
	   p3 <= dataInput;
      end // else: !if(states == 'b0001)
   end // always @ (posedge clk)
   
endmodule // multiplexIn
