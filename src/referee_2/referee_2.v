

module referee_2 #(
    //parameter POP_FIFO = 1,                       // This code supposes there is only one FIFO emissor
    //parameter PUSH_FIFO = 4,                      // This code suposses there are four FIFO receptors
    /*For data_in -> class[1:0], dest[1:0], data[7:0]: This code suposses data_in can change its structure*/
    parameter LINE_SIZE = 12,
    parameter CLASS_BITS = 2,
    parameter DEST_BITS = 2
)(
    output reg [3:0] push_signal,
    output reg pop_signal,
    output reg [LINE_SIZE-1:0] data_out,
    input [3:0] almost_full_signal, state,
    input almost_empty_signal, empty_f_signal,
    input clk,
    input [LINE_SIZE-1:0] data_in
);
    reg push_toggle, pop_toggle;

    always @(posedge clk) begin
        if(state == 4'b0001) begin                                      //RESET state
            push_signal <= 0;
            pop_signal <= 0;
            push_toggle <= 0;
            pop_toggle <= 0;
            data_out <= 0;
        end
        else if(state == 4'b1000) begin                                 // ACTIVE state
            if(|almost_full_signal || empty_f_signal) begin        // If at least one receptor is full OR emissor is empty, do not pop
                pop_signal <= 0;
                pop_toggle <= 0;
            end
            else if(~empty_f_signal) begin                         // After previous condition, if emmissor is not empty, do pop (toggle pop)
                if(~pop_toggle) begin
                    pop_toggle <= 1;
                    pop_signal <= 1;
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
                push_signal[data_in[LINE_SIZE-1 -: CLASS_BITS]] <= 1;
                data_out <= data_in;
                push_toggle <= 0;
            end
            else begin
                push_signal <= 0;
            end
        end
        else begin                  // IDLE state
            push_signal <= 0;
            pop_signal <= 0;
            push_toggle <= 0;
            pop_toggle <= 0;
        end
    end /*posedge clk*/
    
endmodule