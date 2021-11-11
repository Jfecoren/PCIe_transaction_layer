

module referee_2 #(
    parameter POP_FIFO = 1,
    parameter PUSH_FIFO = 4
)(
    output reg [PUSH_FIFO-1:0] push_monarchy,
    output reg [POP_FIFO-1:0] pop_monarchy,
    input [PUSH_FIFO-1:0] almost_full_monarchy,
    input [POP_FIFO-1:0] almost_empty_monarchy
    input clk, reset
);

    generate
        genvar push_control;
        for(push_control = 0; push_control < PUSH_FIFO; push_control = push_control + 1) begin
            always @(posedge clk) begin
                if(almost_full_monarchy[push_control]) begin
                    push_monarchy[push_control] <= 0;
                end
            end
        end
    endgenerate

    
endmodule