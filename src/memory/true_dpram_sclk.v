/* Verilog True Dual Port RAM with a Single Clock Design Example v1.0
 Copyright (c) 2010 Altera Corporation. All rights reserved.
 */
module true_dpram_sclk
(
	input [11:0] data_a, data_b,
	input [2:0] addr_a, addr_b,
	input we_a, we_b, clk,
	output reg [11:0] q_a, q_b
);
	// Declare the RAM variable
	reg [11:0] ram[7:0];
	
	// Port A
	always @ (posedge clk)
		begin
			if (we_a) 
				begin
					ram[addr_a] <= data_a;
					q_a <= data_a;
				end
			else 
				begin
					q_a <= ram[addr_a];
				end
		end
	
	// Port B
	always @ (posedge clk)
		begin
			if (we_b)
				begin
					ram[addr_b] <= data_b;
					q_b <= data_b;
				end
			else
				begin
					q_b <= ram[addr_b];
				end
		end
	
endmodule
