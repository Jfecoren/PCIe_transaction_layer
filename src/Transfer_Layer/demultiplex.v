module demultiplex(
		   input [11:0]      p0, p1, p2, p3,
		   input [3:0] 	     state,
		   input 	     valid0, valid1, valid2, valid3,
		   input 	     clk,
		   output reg [11:0] demuxOut
		   );
   reg buffer0, buffer1, buffer2, buffer3;
   always @(posedge clk) begin
	   buffer0 <= valid0;
	   buffer1 <= valid1;
	   buffer2 <= valid2;
	   buffer3 <= valid3;

      if(state == 'b0001) begin
	 demuxOut <= 0;
      end else begin
	 if(buffer0 == 1)
	   demuxOut <= p0;
	 else if(buffer1 == 1)
	   demuxOut <= p1;
	 else if(buffer2 == 1)
	   demuxOut <= p2;
	 else if(buffer3 == 1)
	   demuxOut <= p3;
	 else
	   demuxOut <= demuxOut;
      end // else: !if(state == 'b0001)
   end // always @ (posedge clk)
endmodule // demultiplex

