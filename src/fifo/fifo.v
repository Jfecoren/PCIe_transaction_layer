
`include "true_dpram_sclk.v"
`include "cmos_cells.v"

module fifo #( // the ALMOST bounds are parameters and can be changed ass required
    parameter ALMOST_FULL = 6,
    parameter ALMOST_EMPTY = 1
)(
    output reg [11:0] data_out,
    output reg 	      almost_full, almost_empty,
    input [11:0]      data_in,
    input 	      reset, clk,
    input 	      push, pop
);

   reg [2:0] addr_w, addr_r;
   reg [11:0] data_w;
   reg [2:0]  wr_ptr, rd_ptr;           // write and read pointers. 3 bits index for a 8 bits memory
   reg [7:0]  memory_state;             // memory state register. check how many lines have been used
   wire [11:0] out_ni;
   reg [11:0]  in_ni;
   reg 	       we_a, we_b;
   wire [11:0] data_r;
   reg [11:0]  data_in_buff;
   reg 	       init;
   
   
   initial begin
      in_ni <= 0;
      we_a <= 1;
      we_b <= 0;
      data_out <= 0;
   end
   
    // reset logic 
    always @(posedge clk) begin
       if(~reset) begin
          wr_ptr <= 0;
          rd_ptr <= 0;
          memory_state <= 0;          // counter of used lines in memory
          almost_full <= 0;
          almost_empty <= 0;
	  addr_r <= 0;
	  addr_w <= 0;
	   
	   
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
            //addr_w <= wr_ptr;
            //addr_r <= rd_ptr;
            /*  push logic: receive push signal from respective Referee
             *  how address is updated, its saves the data and updates the write pointer
            */
            if(push) begin
                data_w <= data_in;
                //wr_ptr <= wr_ptr + 1;
	       addr_w <= addr_w + 1;
                memory_state <= memory_state + 1; // Possible-bug: Short-circuit with itself pop logic
                // flag for write memory is missing
            end
            /*  pop logic: receive pop signal from respective Referee
             *  how address is updated, its ask for the data in that address and updates the read pointer
            */
            else if(pop) begin
                
                //rd_ptr <= rd_ptr + 1;
	       addr_r <= addr_r + 1;
	       data_out <= data_r;
                memory_state <= memory_state - 1; // Possible-bug: Short-circuit with itself push logic
                // flag for read memory is missing
            end
        end
    end // always @ (posedge clk)

   
   
   true_dpram_sclk memoria(/*AUTOINST*/
			   // Outputs
			   .q_a			(out_ni[11:0]),
			   .q_b			(data_r[11:0]),
			   // Inputs
			   .data_a		(data_in[11:0]),
			   .data_b		(in_ni[11:0]),
			   .addr_a		(addr_w[2:0]),
			   .addr_b		(addr_r[2:0]),
			   .we_a		(we_a),
			   .we_b		(we_b),
			   .clk			(clk));
endmodule // fifo
// Outputs
			      
