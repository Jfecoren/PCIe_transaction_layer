
module buffer2x(
    input [3:0] data_in,
    input clk,
    output reg [3:0] data_out);

    reg [3:0] buffer0, buffer1;

    always @(posedge clk) begin
        buffer0 <= data_in;
        data_out <= data_in;
    end

endmodule
