
`include "true_dpram_sclk.v"

module fifo #(
	parameter LINE_SIZE = 12,
	parameter BLOCK_SIZE = 8,
	parameter ADDRESS_SIZE = 3
)(
    output reg [LINE_SIZE-1:0] data_out,
    output reg almost_full, almost_empty, empty_f,               // almost bounds flags
    input [LINE_SIZE-1:0] data_in,
    input [ADDRESS_SIZE-1:0] init_full, init_empty,     // Almost full & Almost empty init inputs
    input [3:0] state,
    input clk,
    input push, pop                                     // push/pop inputs from Referees

);

    reg [ADDRESS_SIZE-1:0] wr_ptr, rd_ptr;                  // write and read pointers. 3 bits index for a 8 bits memory
    reg [LINE_SIZE-1:0] data_w;
    wire [LINE_SIZE-1:0] data_r;                  // registers for read and write memory
    reg wr_e, rd_e;
    reg [BLOCK_SIZE-1:0] memory_state;                      // memory state register. check how many lines have been used

    reg [ADDRESS_SIZE-1:0] full_th, empty_th;                          // Almost Full & Almost Empty Threshold registers


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
        if(state == 'b0001) begin       // RESET state
            wr_ptr <= 0;
            rd_ptr <= 0;
            wr_e <= 1;
            rd_e <= 1;
            memory_state <= 0;          // counter of used lines in memory
            full_th <= 6;
            empty_th <= 1;
        end
        else if(state == 4'b0010) begin  // INIT state
            full_th <= init_full;
            empty_th <= init_empty;
        end
        else if(state == 4'b1000) begin   // ACTIVE state
            if(/*SUGGESTION*/ memory_state >= full_th)
                almost_full <= 1;
            else if(/*SUGGESTION*/ memory_state <= empty_th)
                almost_empty <= 1;
            else begin
                almost_full <= 0;
                almost_empty <= 0;
            end

            if(memory_state == 0)
                empty_f <= 1;
            else
                empty_f <= 0;


            if(push & pop && memory_state != 0 && memory_state != 7) begin
                data_w <= data_in;
                wr_ptr <= wr_ptr + 1;
                data_out <= data_r;
                rd_ptr <= rd_ptr + 1;
            end
            else if(push) begin
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
        else begin          // IDLE STATE
            almost_empty <= 1;
            empty_f <= 1;
            almost_full <= 0;
        end 
    end
endmodule