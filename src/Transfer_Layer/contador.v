module contador(
		input [11:0] 	 data_in,
		input [3:0] 	 state,
		input 		 clk, reset,
		output reg [4:0] cuenta
		);
   reg [11:0] 			 detector;
   
   
   always @(posedge clk) begin
      if(state == 'b0001) begin
	 cuenta <= 0;
	 detector <= 0;
      end
      else
	if(detector != data_in) begin
	   cuenta <= cuenta + 1;
	   detector <= data_in;
	end
	else
	  cuenta <= cuenta;
   end // always @ (posedge clk)
	
endmodule // contador
