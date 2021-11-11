
`include "true_dpram_sclk.v"

module fifo #( // the ALMOST bounds are parameters and can be changed ass required
    parameter ALMOST_FULL = 6,
    parameter ALMOST_EMPTY = 1,
	parameter LINE_SIZE = 12,
	parameter BLOCK_SIZE = 8,
	parameter ADRRESS_SIZE = 3
)(
    output reg [LINE_SIZE-1:0] data_out,
    output reg almost_full, almost_empty,               // almost bounds flags
    input [LINE_SIZE-1:0] data_in,
    input reset, clk,
    input push, pop                                     // push/pop inputs from Referees
);

    reg [ADRRESS_SIZE-1:0] wr_ptr, rd_ptr;                  // write and read pointers. 3 bits index for a 8 bits memory
    reg [LINE_SIZE-1:0] data_w;
    wire [LINE_SIZE-1:0] data_r;                  // registers for read and write memory
    reg wr_e, rd_e;
    reg [BLOCK_SIZE-1:0] memory_state;                      // memory state register. check how many lines have been used
    // internal un-used signals (maybe for debuggin)
    wire [LINE_SIZE-1:0] in_deb, out_deb;

    // define internal Memory
    true_dpram_sclk fiforam(.data_w(data_w),
                            .data_r(in_deb),
                            .wr_ptr(wr_ptr),
                            .rd_ptr(rd_ptr),
                            .wr_e(wr_e),
                            .rd_e(rd_e),
                            .clk(clk),
                            .q_w(out_deb),
                            .q_r(data_r)
                            );


    always @(posedge clk) begin
        if(~reset) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
            wr_e <= 1;
            rd_e <= 1;
            memory_state <= 0;          // counter of used lines in memory
            almost_full <= 0;
            almost_empty <= 0;
        end
        else begin
            if(/*SUGGESTION*/ memory_state >= ALMOST_FULL)
                almost_full <= 1;
            else if(/*SUGGESTION*/ memory_state <= ALMOST_EMPTY)
                almost_empty <= 1;
            else begin
                almost_full <= 0;
                almost_empty <= 0;
            end

            if(push) begin
                data_w <= data_in;
                wr_ptr <= wr_ptr + 1;
                memory_state <= memory_state + 1;           // Possible-bug: Short-circuit with itself pop logic (fixed with else if in pop logic)
                // flag for write memory is missing
            end
            /*  pop logic: receive pop signal from respective Referee
             *  how address is updated, its ask for the data in that address and updates the read pointer
            */
            else if(pop) begin
                data_out <= data_r;
                rd_ptr <= rd_ptr + 1;
                memory_state <= memory_state - 1;           // Possible-bug: Short-circuit with itself push logic (fixed with else if in pop logic)
                // flag for read memory is missing
            end
        end            
    end
endmodule