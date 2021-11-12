
module referee_2 (
    output reg push_0, push_1, push_2, push_3,
    output reg pop_0, pop_1, pop_2, pop_3,
    output reg [11:0] data_out,
    input [11:0] data_in, 
    input almost_full_0, almost_full_1, almost_full_2, almost_full_3,
    input empty_0, empty_1, empty_2, empty_3,
    input clk, reset
);
    reg toggle_flag;
    reg [1:0] cont;
    
    always @(posedge clk) begin
        if (~reset) begin
            push_0  <= 0;
            push_1 <= 0;
            push_2 <= 0;
            push_3 <= 0;
            pop_0 <= 0;
            pop_1 <= 0;
            pop_2 <= 0;
            pop_3 <= 0;
            data_out <= 0;
            toggle_flag <=0;
            cont <= 0;
        end
        else begin
            if (almost_full_0|almost_full_1|almost_full_2|almost_full_3) begin
                pop_0 <= 0;
                pop_1 <= 0;
                pop_2 <= 0;
                pop_3 <= 0;
            end
            else begin
                if (~toggle_flag) begin
                    toggle_flag <= 1; 
                    cont <= cont +1;
                    if (~empty_0 && cont == 0) begin
                        pop_0 <= 1;
                        pop_1 <= 0;
                        pop_2 <= 0;
                        pop_3 <= 0;
                    end
                    else if (~empty_1 && cont == 1) begin
                        pop_0 <= 0;
                        pop_1 <= 1;
                        pop_2 <= 0;
                        pop_3 <= 0;
                    end
                    else if (~empty_2 && cont == 2) begin
                        pop_0 <= 0;
                        pop_1 <= 0;
                        pop_2 <= 1;
                        pop_3 <= 0;
                    end
                    else if (~empty_3 && cont == 3) begin
                        pop_0 <= 0;
                        pop_1 <= 0;
                        pop_2 <= 0;
                        pop_3 <= 1;
                    end
                    else begin
                        pop_0 <= 0;
                        pop_1 <= 0;
                        pop_2 <= 0;
                        pop_3 <= 0;
                        toggle_flag <=0;
                    end
                end                   
            end
        end
    end



endmodule