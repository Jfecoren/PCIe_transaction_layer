
module referee_2 (
    output reg push_0, push_1, push_2, push_3,
    output reg pop,
    //output reg [11:0] data_out,
    input [11:0] data_in, // [11:10] class
    input almost_full_0, almost_full_1, almost_full_2, almost_full_3,
    input empty,
    input clk,
    input [3:0] state
);
    reg [1:0] cont;
    reg pop_toggle; 
    reg push_toggle;
    reg push_enable;
    reg toggle_en;  
    reg pop_enable;
    always @(posedge clk) begin
        if (state == 'b0001) begin
            push_0 <= 0;
            push_1 <= 0;
            push_2 <= 0;
            push_3 <= 0;
            pop <= 0;
            cont <= 0;
            pop_toggle <= 0;
            push_toggle <= 0;  
            push_enable <= 0;
            toggle_en <= 0;
            pop_enable <= 0;
        end
        else if(state == 'b1000 || state == 'b0100) begin
            if (empty) begin
                pop <= 0;
                push_0 <= 0;
                push_1 <= 0;
                push_2 <= 0;
                push_3 <= 0;                 
                pop_toggle <= 0;
                push_enable <= 0;
            end
            else if (~(almost_full_0||almost_full_1||almost_full_2||almost_full_3)) begin 
                
                if (~pop_toggle) begin
                    pop <= 1;
                    pop_toggle <= 1;
                end
                else begin
                    pop <= 0;
                    pop_toggle <= 0;
                end


                if(pop)
                    push_enable <= 1;
                else
                    push_enable <= 0;
                if(push_enable) begin
                    if (data_in[11:10] == 'b00) begin
                        push_0 <= 1;
                    end
                    else if (data_in[11:10] == 'b01) begin
                        push_1 <= 1;
                    end
                    else if (data_in[11:10] == 'b10) begin
                        push_2 <= 1;
                    end
                    else if (data_in[11:10] == 'b11) begin
                        push_3 <= 1;
                    end 
                end
                else begin
                    push_0 <= 0;
                    push_1 <= 0;
                    push_2 <= 0;
                    push_3 <= 0;
                end     
            end
        end
    end
endmodule

               
               
