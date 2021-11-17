module contador(
		input [11:0] 	 data_in,
		input 		 reset,
		input 		 clk,
		output reg [4:0] cuenta
		);
   reg [11:0] 			 detector;
   
   
   always @(posedge clk) begin
      if(~reset) begin
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
