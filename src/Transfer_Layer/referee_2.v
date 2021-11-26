
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

    always @(posedge clk) begin
        if (state == 'b0001) begin
            push_0 <= 0;
            push_1 <= 0;
            push_2 <= 0;
            push_3 <= 0;
            pop <= 0;
            cont <= 0;
            pop_toggle <= 0;
        end
        else if(state == 'b1000 || state == 'b0100) begin

            if (almost_full_0|almost_full_1|almost_full_2|almost_full_3) begin
                push_0 <= 0;
                push_1 <= 0;
                push_2 <= 0;
                push_3 <= 0;

                // ROUND ROBIN STARTS FOR FIFOS

                if (empty) begin
                    pop <= 0;
                end    
                else begin
                    if (~pop_toggle) begin
                        pop <= 0;
                        pop_toggle <= pop_toggle + 1;                                                
                    end
                    else begin
                        pop <= 1;
                        pop_toggle <= pop_toggle + 1;
                    end
                end
            end            
            else if (cont == 0) begin
                push_3 <= 0;
                push_0 <= 1;
                cont <= cont + 1;
                if (empty) begin
                    pop <= 0;
                    pop_toggle <= pop_toggle + 1;                    
                end    
                else begin
                    if (~pop_toggle) begin
                        pop <= 0;
                        pop_toggle <= pop_toggle + 1;                                                
                    end
                    else begin
                        pop <= 1;
                        pop_toggle <= pop_toggle + 1;
                    end
                end
            end
            else if (cont == 1) begin
                push_0 <= 0;
                push_1 <= 1;
                cont <= cont + 1;                
                if (empty) begin
                    pop <= 0;
                    pop_toggle <= pop_toggle + 1;
                end    
                else begin
                    if (~pop_toggle) begin
                        pop <= 0;
                        pop_toggle <= pop_toggle + 1;                        
                    end
                    else begin
                        pop <= 1;
                        pop_toggle <= pop_toggle + 1;
                    end
                end
            end
            else if (cont == 2) begin
                push_1 <=0; 
                push_2 <=1;
                cont <= cont + 1;
                if (empty) begin
                    pop <= 0;
                    pop_toggle <= pop_toggle + 1;
                end    
                else begin
                    if (~pop_toggle) begin
                        pop <= 0;
                        pop_toggle <= pop_toggle + 1;                        
                    end
                    else begin
                        pop <= 1;
                        pop_toggle <= pop_toggle + 1;
                    end
                end
            end
            else if (cont == 3) begin
                push_2 <= 0;
                push_3 <= 1;
                cont <= 0;
                if (empty) begin
                    pop <= 0;
                    pop_toggle <= pop_toggle + 1;                    
                end    
                else begin
                    if (~pop_toggle) begin
                        pop <= 0;
                        pop_toggle <= pop_toggle + 1;                        
                    end
                    else begin
                        pop <= 1;
                        pop_toggle <= pop_toggle + 1;
                    end
                end
            end  
        end
    end
endmodule

               
               
