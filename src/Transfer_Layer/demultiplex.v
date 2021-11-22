module demultiplex(
		   input [11:0]      p0, p1, p2, p3,
		   input [3:0] 	     state,
		   input 	     valid0, valid1, valid2, valid3,
		   input 	     clk,
		   output reg [11:0] demuxOut
		   );
   
   always @(posedge clk) begin
      if(state == 'b0001) begin
	 demuxOut <= 0;
      end else begin
	 if(valid0 == 1)
	   demuxOut <= p0;
	 else if(valid1 == 1)
	   demuxOut <= p1;
	 else if(valid2 == 1)
	   demuxOut <= p2;
	 else if(valid3 == 1)
	   demuxOut <= p3;
	 else
	   demuxOut <= demuxOut;
      end // else: !if(state == 'b0001)
   end // always @ (posedge clk)
endmodule // demultiplex

