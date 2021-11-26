module tester #(
    parameter LINE_SIZE = 12
)(
    input [3:0] push_signal,
    input [3:0] pop_signal,
    input [LINE_SIZE-1:0] data_out,
    output reg [3:0] almost_full_signal, almost_empty_signal, 
    output reg [3:0] empty_f_signal, state,
    output reg clk,
    output reg [LINE_SIZE-1:0] data_in
);

    initial begin
        $dumpfile("referee_1.vcd");
        $dumpvars;
        {almost_full_signal, almost_empty_signal, data_in, empty_f_signal} <= 'b0;
        state <= 1;
        @(posedge clk)
            state <= 8;
            almost_empty_signal <= 1;
        @(posedge clk)
            almost_empty_signal <= 0;
            data_in <= 12'b110111100100;
        @(posedge clk)
        @(posedge clk)
            data_in <= 12'b100101101100;
        @(posedge clk)
        @(posedge clk)
            data_in <= 12'b000101101110;
        @(posedge clk)
        @(posedge clk)
            data_in <= 12'b000101001100;
        @(posedge clk)
        @(posedge clk)
            data_in <= 12'b100101100100;
        repeat (16) begin
            @(posedge clk);
                data_in[9:8]++;
            @(posedge clk);
        end
            almost_full_signal <= 4'b0100;
        @(posedge clk)
        @(posedge clk)
            data_in <= 12'b010101111000;
        @(posedge clk)
        @(posedge clk)
            data_in <= 12'b000101111000;
        @(posedge clk)
        @(posedge clk)
            data_in <= 12'b010101101011;
            almost_full_signal <= 0;
        @(posedge clk)
        @(posedge clk)
            data_in <= 12'b010101111000;
        @(posedge clk)
        @(posedge clk)
            data_in <= 12'b010101111000;
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
            almost_empty_signal <= 1;
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)



        #32 $finish;
    end






    // Clock
    initial clk <= 0;
    always #4 clk <= ~clk;
endmodule