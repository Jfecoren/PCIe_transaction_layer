

module referee_1 #(
    //parameter POP_FIFO = 4,                       // This code supposes there are four FIFO emissor
    //parameter PUSH_FIFO = 4,                      // This code suposses there are four FIFO receptors
    /*For data_in -> class[1:0], dest[1:0], data[7:0]: This code suposses data_in can change its structure*/
    parameter LINE_SIZE = 12,
    parameter CLASS_BITS = 2,
    parameter DEST_BITS = 2
)(
    output reg [3:0] push_signal,
    output reg [3:0] pop_signal,
    output reg [LINE_SIZE-1:0] data_out,
    input [3:0] almost_full_signal,
    input [3:0] almost_empty_signal,
    input clk, reset,
    input [LINE_SIZE-1:0] data_in
);
    /*
    localparam POP_COUNTER = $clog2(POP_FIFO);
    localparam PUSH_COUNTER = $clog2(PUSH_FIFO);
    reg [POP_COUNTER-1:0] pop_counter;
    reg [PUSH_COUNTER-1:0] push_counter;
    */
    reg push_toggle, pop_toggle;
    reg [1:0] counter;
    reg [3:0] counter_flag;

    always @(posedge clk) begin
        if(~reset) begin
            push_signal <= 0;
            pop_signal <= 0;
            push_toggle <= 0;
            pop_toggle <= 0;
            data_out <= 0;
            counter <= 0;
            counter_flag <= 0;
            counter <= 0;
        end
        else begin
            if(|almost_full_signal || almost_empty_signal) begin        // If at least one receptor is full OR emissor is empty, do not pop
                pop_signal <= 0;
                pop_toggle <= 0;
            end
            else if(~|almost_empty_signal) begin                         // After previous condition, if emmissor is not empty, do pop (toggle pop)
                
                    

                if(~pop_toggle) begin
                    pop_toggle <= 1;

                    if(~almost_empty_signal[3] && ~counter_flag[3]) begin
                        pop_signal[3] <= 1;
                        if(counter == 3) begin
                            counter_flag[3] <= 1;
                            counter <= 0;
                        end
                        else
                            counter++;

                    end
                    else if(~almost_empty_signal[2] && ~counter_flag[2]) begin
                        pop_signal[2] <= 1;
                        if(counter == 2) begin
                            counter_flag[2] <= 1;
                            counter <= 0;
                        end
                        else
                            counter++;
                        
                    end
                    else if(~almost_empty_signal[1] && ~counter_flag[1]) begin
                        pop_signal[1] <= 1;
                        if(counter == 1) begin
                            counter_flag[1] <= 1;
                            counter <= 0;
                        end
                        else
                            counter++;
                        
                    end
                    else if(~almost_empty_signal[0] && ~counter_flag[0]) begin
                        pop_signal[0] <= 1;
                        if(counter == 0) begin
                            counter_flag <= 0;
                        end
                        else
                            counter <= 0;
                        
                    end
                end
                else begin
                    pop_signal <= 0;
                    pop_toggle <= 0;
                end
            end
            
            if(pop_toggle) begin                                        // This considers the delay between pops and pushes
                push_toggle <= 1;
                push_signal <= 0;
            end
            else if(push_toggle) begin
                push_signal[data_in[LINE_SIZE-CLASS_BITS-1 -: DEST_BITS]] <= 1;
                data_out <= data_in;
                push_toggle <= 0;
            end
            else begin
                push_signal <= 0;
            end
            
        end /*else (reset)*/
    end /*posedge clk*/
    
endmodule