/* Verilog True Dual Port RAM with a Single Clock Design Example v1.0
 Copyright (c) 2010 Altera Corporation. All rights reserved.
 Modified for Academic Purposes Only.
 */
module true_dpram_sclk #(
	parameter LINE_SIZE = 12,
	parameter BLOCK_SIZE = 8,
	parameter ADDRESS_SIZE = 3
)
(
	input [LINE_SIZE-1:0] data_w, data_r,
	input [ADDRESS_SIZE-1:0] wr_ptr, rd_ptr,
	input wr_e, rd_e, clk,
	output reg [LINE_SIZE-1:0] q_w, q_r
);
	// Declare the RAM variable
	reg [LINE_SIZE-1:0] ram[BLOCK_SIZE-1:0];
	
	// Port A
	always @ (posedge clk)
		begin
			if (wr_e)
				begin
					ram[wr_ptr] <= data_w;
					q_w <= data_w;
				end
			else 
				begin
					q_w <= ram[wr_ptr];
				end
		end
	
	// Port B
	always @ (posedge clk)
		begin
			if (~rd_e)
				begin
					ram[rd_ptr] <= data_r;
					q_r <= data_r;
				end
			else
				begin
					q_r <= ram[rd_ptr];
				end
		end
	
endmodule
