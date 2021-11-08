

`include "fifo.v"
`include "true_dpram_sclk.v"

module fifo_memory
(
    output reg [11:0] data_out,
    output reg almost_full, almost_empty,               // almost bounds flags
    input [11:0] data_in,
    input reset, clk,
    input push, pop                                     // push/pop inputs from Referees
);
    
    wire [11:0] data_w, data_r, q_w, q_r;
    wire [2:0] wr_ptr, rd_ptr;

true_dpram_sclk memory0(.data_w(data_w),
                        .data_r(data_r),
	                    .wr_ptr(wr_ptr),
                        .rd_ptr(rd_ptr),
	                    input wr_e, rd_e,
                        .clk(clk),
	                    output reg [LINE_SIZE-1:0] q_w, q_r);

fifo fifo0(
            .data_out(data_out),
            .data_w(data_w),
            .wr_ptr(wr_ptr),
            .rd_ptr(rd_ptr),
            .almost_full(almost_full),
            .almost_empty(almost_empty),
            .data_in(data_in),
            .data_r(data_r),
            .reset(reset),
            .clk(clk),
            .push(push),
            .pop(pop)
            );



endmodule
