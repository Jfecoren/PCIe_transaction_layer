module multiplexOut(
		   input [11:0]      dataInput,
		   input [3:0] 	     states,
		   input 	     clk,
		   output reg [11:0] out0, out1, out2, out3
		   );

   always @(posedge clk) begin
      if(states == 'b0001) begin
	 {out0, out1, out2, out3} <= 0;
      end else begin
	 if(dataInput[9:8] == 'b00)
	   out0 <= dataInput;
	 else if(dataInput[9:8] == 'b01)
	   out1 <= dataInput;
	 else if(dataInput[9:8] == 'b10)
	   out2 <= dataInput;
	 else
	   out3 <= dataInput;
      end // else: !if(states == 'b0001)
   end // always @ (posedge clk)
   
endmodule // multiplexOut

