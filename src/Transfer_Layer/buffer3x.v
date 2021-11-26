
module buffer3x(
    input [3:0] data_in,
    input clk,
    output reg [3:0] data_out);

    reg [3:0] buffer0, buffer1, buffer2;

    always @(posedge clk) begin
        buffer0 <= data_in;
        buffer1 <= buffer0;
        //buffer2 <= buffer1;
        data_out <= buffer1;
    end

endmodule
