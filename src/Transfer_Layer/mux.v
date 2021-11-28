module mux(
	   input [4:0] 	    in0, in1, in2, in3, in4,
	   input [3:0] 	    state, 
	   input [2:0] 	    idx,
	   input 	    req, clk,
	   output reg [4:0] data,
	   output reg 	    valid
	   );
   
   always @(posedge clk) begin
      if(state == 4'b0001) begin //estado reset
	 data <= 0;
	 valid <= 0;
      end else if(state == 4'b0010) begin // estado init
	 valid <= 0;
      end else if(state == 4'b0100) begin // estado idle
	 if(req == 1) begin
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
	 end else
	   valid <= 0;
	 // if (req == 1)     
      end else if(state == 4'b1000) begin //estado active
	 valid <= 0;
      end
   end // always @ (posedge clk)
endmodule // mux
