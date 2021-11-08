
//`include "true_dpram_sclk_est.v"

module fifo #( // the ALMOST bounds are parameters and can be changed ass required
    parameter ALMOST_FULL = 6,
    parameter ALMOST_EMPTY = 1,
	parameter LINE_SIZE = 12,
	parameter BLOCK_SIZE = 8,
	parameter ADRRESS_SIZE = 3
)(
    output reg [LINE_SIZE-1:0] data_out, data_w,
    output reg [ADRRESS_SIZE-1:0] rd_ptr, wr_ptr,       // write and read pointers. 3 bits index for a 8 bits memory
    output reg almost_full, almost_empty,               // almost bounds flags
    input [LINE_SIZE-1:0] data_in, data_r,
    input reset, clk,
    input push, pop                                     // push/pop inputs from Referees
);

    // write and read pointers. 3 bits index for a 8 bits memory
    reg [BLOCK_SIZE-1:0] memory_state;             // memory state register. check how many lines have been used
    // reset logic 
    always @(posedge clk) begin
        if(~reset) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
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
        end            
    end

    // fifo logic
    always @(posedge clk) begin
        if(reset) begin
            // addresses must be updated always
            /*  push logic: receive push signal from respective Referee
             *  how address is updated, its saves the data and updates the write pointer
            */
            if(push) begin
                data_w <= data_in;
                wr_ptr <= wr_ptr + 1;
                memory_state <= memory_state + 1; // Possible-bug: Short-circuit with itself pop logic (fixed with else if in pop logic)
                // flag for write memory is missing
            end
            /*  pop logic: receive pop signal from respective Referee
             *  how address is updated, its ask for the data in that address and updates the read pointer
            */
            else if(pop) begin
                data_out <= data_r;
                rd_ptr <= rd_ptr + 1;
                memory_state <= memory_state - 1; // Possible-bug: Short-circuit with itself push logic (fixed with else if in pop logic)
                // flag for read memory is missing
            end
        end
    end
endmodule