module demultiplex(
		   input [11:0]      p0, p1, p2, p3,
		   input [3:0] 	     state,
		   input 	     valid0, valid1, valid2, valid3,
		   input 	     clk,
		   output reg [11:0] demuxOut
		   );
   reg [3:0] buffer0, buffer1;
   always @(posedge clk) begin
	   buffer0[0] <= valid0;
	   buffer0[1] <= valid1;
	   buffer0[2] <= valid2;
	   buffer0[3] <= valid3;
		//buffer1 <= buffer0;
      if(state == 'b0001) begin
	 demuxOut <= 0;
      end else begin
	 if(buffer0[0] == 1)
	   demuxOut <= p0;
	 else if(buffer0[1] == 1)
	   demuxOut <= p1;
	 else if(buffer0[2] == 1)
	   demuxOut <= p2;
	 else if(buffer0[3] == 1)
	   demuxOut <= p3;
	 else
	   demuxOut <= demuxOut;
      end // else: !if(state == 'b0001)
   end // always @ (posedge clk)
endmodule // demultiplex

