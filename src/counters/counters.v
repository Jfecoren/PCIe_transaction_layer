module counters(
	input [11:0] data_in,
	input [3:0] state,
	input clk,
	output reg [7:0] counts
);

	reg [11:0] detector;
   
   
always @(posedge clk) begin
    if(state == 4'b0001) begin
		counts <= 0;
		detector <= 0;
    end
    else if(detector != data_in) begin
		counts <= counts + 1;
		detector <= data_in;
	end else
		counts <= counts;
	end // always @ (posedge clk)
	
endmodule // countsers
