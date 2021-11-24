
`include "true_dpram_sclk.v"

module fifo(
    output reg [11:0] data_out,
    output reg 	      almost_full, almost_empty,
    input [11:0]      data_in,
    input 	      reset, clk,
    input [2:0]       umbral_AF_in, umbral_AE_in, 
    input 	      push, pop,
    input [3:0]       state
);

   reg 		      we_a, we_b;               // Write enables
   reg [2:0] 	      addr_w, addr_r;           // R/W addresses
   reg [2:0] 	      wr_ptr, rd_ptr;           // write and read pointers. 3 bits index for a 8 bits memory
   reg [7:0] 	      memory_state;             // memory state register. check how many lines have been used
   reg [11:0] 	      in_ni;                    // Temp variable
   reg [11:0] 	      data_w;                   // Data to write
   wire [11:0] 	      data_r;                   // Data read 
   wire [11:0] 	      out_ni;                   // Temp variable
   reg [2:0] 	      umbral_AF, umbral_AE;
   
   

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
			   .clk			(clk)
			   );
    
    always @(posedge clk) begin
       // Reset logic
       if(state == 'b0001) begin
	  in_ni <= 0;
	  we_a <= 1;
	  we_b <= 0;
          wr_ptr <= 0;
          rd_ptr <= 0;
          memory_state <= 0;          // counter of used lines in memory
          almost_full <= 0;
          almost_empty <= 0;
	  umbral_AF <= 6;
	  umbral_AE <= 0;
	  addr_r <= 0;
	  addr_w <= 0;
	  data_out <= 0;
       end // if (state == 'b0001)
       // fifo logic
       else if(state == 'b0010) begin //estado init
	  umbral_AF <= umbral_AF_in;
	  umbral_AE <= umbral_AE_in;
       end else if(state == 'b0100) begin
	  data_out <= 0;
       end else if(state == 'b1000) begin
	  


          /*  push logic: receive push signal from respective Referee
           *  how address is updated, its saves the data and updates the write pointer
           */
         if(push & pop) begin
            data_w <= data_in;
	         addr_w <= addr_w + 1;
	         addr_r <= addr_r + 1;
	         data_out <= data_r;
            memory_state <= memory_state;
         end

          if(push & ~pop) begin
            data_w <= data_in;
	         addr_w <= addr_w + 1;
            memory_state <= memory_state + 1; // Possible-bug: Short-circuit with itself pop logic
          end
          /*  pop logic: receive pop signal from respective Referee
           *  how address is updated, its ask for the data in that address and updates the read pointer
           */
          if(pop & ~push) begin
	         addr_r <= addr_r + 1;
	         data_out <= data_r;
            memory_state <= memory_state - 1; // Possible-bug: Short-circuit with itself push logic
             // flag for read memory is missing
          end
           if(/*SUGGESTION*/ memory_state >= umbral_AF)
                     almost_full <= 1;
                  else if(/*SUGGESTION*/ memory_state <= umbral_AE)
                     almost_empty <= 1;
                  else begin
                     almost_full <= 0;
                     almost_empty <= 0;
                  end
       end // if (reset)

        



    end // always @ (posedge clk)
   
endmodule // fifo	      
