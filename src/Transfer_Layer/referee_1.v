


module referee_1 (
    output reg push_0, push_1, push_2, push_3,
    output reg pop_0, pop_1, pop_2, pop_3,
    output reg push_enable_0, push_enable_1, push_enable_2, push_enable_3,
    //output reg [11:0] data_out,
    input [11:0] data_in, // [9:8] dest
    input almost_full_0, almost_full_1, almost_full_2, almost_full_3,
    input empty_0, empty_1, empty_2, empty_3,
    input clk,
    input [3:0] state
);
    reg [3:0] counter_pop;
    reg [3:0] enable_pop;
    reg pop_toggle;
    reg push_toggle;

    always @(posedge clk) begin
        if (state == 'b0001) begin
            push_0 <= 0;
            push_1 <= 0;
            push_2 <= 0;
            push_3 <= 0;

            pop_0 <= 0;
            pop_1 <= 0;
            pop_2 <= 0;
            pop_3 <= 0;

            counter_pop <= 0;
            push_toggle <= 0;
            pop_toggle <= 0;
            enable_pop <= 4'b0001;

            push_enable_0 <= 1;
            push_enable_1 <= 1;
            push_enable_2 <= 1;
            push_enable_3 <= 1;           


        end
        else if(state == 'b1000 || state == 'b0100) begin
            
            if(pop_0 | pop_1 | pop_2 | pop_3) begin
                pop_0 <= 0;
                pop_1 <= 0;
                pop_2 <= 0;
                pop_3 <= 0;
            end

            if (almost_full_0|almost_full_1|almost_full_2|almost_full_3) begin
                // stops everything
                push_0 <= 0;
                push_1 <= 0;
                push_2 <= 0;
                push_3 <= 0;
                push_toggle <= 0;
                pop_0 <= 0;
                pop_1 <= 0;
                pop_2 <= 0;
                pop_3 <= 0;
                pop_toggle <= 0;
                                
            end
            else if(~(empty_0|empty_1|empty_2|empty_3)) begin
                if(~pop_toggle) begin
                    pop_toggle <= 1;
                    counter_pop++;
                    if(~empty_0 & enable_pop[0]) begin
                        pop_0 <= 1;
                    end
                    if(~empty_1 & enable_pop[1]) begin
                        pop_1 <= 1;
                    end
                    if(~empty_2 & enable_pop[2]) begin
                        pop_2 <= 1;
                    end
                    if(~empty_3 & enable_pop[3]) begin
                        pop_3 <= 1;
                    end

                    if((counter_pop == 3 & enable_pop[0]) | empty_0) begin
                            enable_pop <= 4'b0010;
                            counter_pop <= 0;
                    end
                    else if((counter_pop == 2 & enable_pop[1]) | empty_1) begin
                            enable_pop <= 4'b0100;
                            counter_pop <= 0;
                    end
                    else if((counter_pop == 1 & enable_pop[2]) | empty_2) begin
                            enable_pop <= 4'b1000;
                            counter_pop <= 0;
                    end
                    else if((counter_pop == 0 & enable_pop[3]) | empty_3) begin
                            enable_pop <= 4'b0001;
                            counter_pop <= 0;
                    end

                end
                else begin
                    pop_toggle <= 0;
                end



                if(~push_toggle & (pop_0 | pop_1 | pop_2 | pop_3)) begin
                    push_toggle <= 1;
                    if(data_in[9:8] == 2'b00)
                        push_0 <= 1;
                    else if(data_in[9:8] == 2'b01)
                        push_1 <= 1;
                    else if(data_in[9:8] == 2'b10)
                        push_2 <= 1;
                    else if(data_in[9:8] == 2'b11)
                        push_3 <= 1;
                    else begin
                        push_0 <= 0;
                        push_1 <= 0;
                        push_2 <= 0;
                        push_3 <= 0;
                    end

                end
                else begin
                    push_0 <= 0;
                    push_1 <= 0;
                    push_2 <= 0;
                    push_3 <= 0;
                    push_toggle <= 0;
                end
            end
        end // end else
    end // end always posedge
endmodule //endmodule
