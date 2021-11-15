


module referee_1 (
    output reg push_0, push_1, push_2, push_3,
    output reg pop_0, pop_1, pop_2, pop_3,
    //output reg [11:0] data_out,
    //input [11:0] data_in, 
    input almost_full_0, almost_full_1, almost_full_2, almost_full_3,
    input empty_0, empty_1, empty_2, empty_3,
    input clk, reset
);
    //reg [3:0] rr_pop_toggle;
    reg [3:0] wrr_pop_toggle;
    reg [1:0] push_toggle;
    
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
            //data_out <= 0;
            wrr_pop_toggle <= 0;
            push_toggle <= 0;

        end
        else begin
            if (almost_full_0|almost_full_1|almost_full_2|almost_full_3) begin
                push_0 <= 0;
                push_1 <= 0;
                push_2 <= 0;
                push_3 <= 0;

                // WEIGHTED ROUND ROBIN STARTS FOR FIFOS
                                

                if (empty_0|empty_1|empty_2|empty_3) begin
                    if(wrr_pop_toggle >= 0 && wrr_pop_toggle < 4)begin
                        if (empty_0) begin
                            pop_3 <= 0;
                            pop_0 <= 0;
                            wrr_pop_toggle <= 4;
                        end
                        else if (pop_0 == 1) begin
                            pop_0 <= 0;
                            pop_1 <= 0;
                            pop_2 <= 0;
                            pop_3 <= 0;
                        end
                        else begin
                            pop_3 <= 0;                        
                            pop_0 <= 1;                    
                            wrr_pop_toggle <= wrr_pop_toggle + 1;
                        end
                    end
                    else if(wrr_pop_toggle >= 4  && wrr_pop_toggle < 7)begin
                        if (empty_1) begin
                            pop_0 <= 0;
                            pop_1 <= 0;
                            wrr_pop_toggle <= 7;
                        end
                        else if (pop_1 == 1) begin
                            pop_0 <= 0;
                            pop_1 <= 0;
                            pop_2 <= 0;
                            pop_3 <= 0;
                        end
                        else begin
                            pop_0 <= 0;                        
                            pop_1 <= 1;                    
                            wrr_pop_toggle <= wrr_pop_toggle + 1;
                        end
                    end
                    else if(wrr_pop_toggle >= 7  && wrr_pop_toggle < 9)begin
                        if (empty_2) begin
                            pop_1 <= 0;                            
                            pop_2 <= 0;
                            wrr_pop_toggle <= 9;
                        end
                        else if (pop_2 == 1) begin
                            pop_0 <= 0;
                            pop_1 <= 0;
                            pop_2 <= 0;
                            pop_3 <= 0;
                        end
                        else begin
                            pop_1 <= 0;                        
                            pop_2 <= 1;                    
                            wrr_pop_toggle <= wrr_pop_toggle + 1;
                        end
                    end
                    else if(wrr_pop_toggle == 9)begin
                        if (empty_3) begin
                            pop_2 <= 0;                            
                            pop_3 <= 0;
                            wrr_pop_toggle <= 0;
                        end
                        else if (pop_3 == 1) begin
                            pop_0 <= 0;
                            pop_1 <= 0;
                            pop_2 <= 0;
                            pop_3 <= 0;
                        end
                        else begin
                            pop_2 <= 0;                        
                            pop_3 <= 1;                    
                            wrr_pop_toggle <= 0;
                        end
                    end
                end
                else begin
                    if (wrr_pop_toggle >= 0 && wrr_pop_toggle < 4) begin
                        if (pop_0 == 1) begin
                            pop_0 <= 0;
                            pop_1 <= 0;
                            pop_2 <= 0;
                            pop_3 <= 0;
                        end
                        else begin 
                            pop_3 <= 0;
                            pop_0 <= 1;
                            wrr_pop_toggle <= wrr_pop_toggle + 1;
                        end
                    end
                    else if (wrr_pop_toggle >= 4  && wrr_pop_toggle < 7) begin
                        if (pop_1 == 1) begin
                            pop_0 <= 0;
                            pop_1 <= 0;
                            pop_2 <= 0;
                            pop_3 <= 0;

                        end
                        else begin 
                            pop_0 <= 0;
                            pop_1 <= 1;
                            wrr_pop_toggle <= wrr_pop_toggle + 1;
                        end                   
                    end
                    else if (wrr_pop_toggle >= 7  && wrr_pop_toggle < 9) begin
                        if (pop_2 == 1) begin
                            pop_0 <= 0;
                            pop_1 <= 0;
                            pop_2 <= 0;
                            pop_3 <= 0;
                        end
                        else begin 
                            pop_1 <= 0;
                            pop_2 <= 1;
                            wrr_pop_toggle <= wrr_pop_toggle + 1;
                        end                   
                    end
                    else if (wrr_pop_toggle == 9) begin
                        if (pop_3 == 1) begin
                            pop_0 <= 0;
                            pop_1 <= 0;
                            pop_2 <= 0;
                            pop_3 <= 0;
                        end
                        else begin 
                            pop_2 <= 0;
                            pop_3 <= 1;
                            wrr_pop_toggle <= 0;
                        end
                    end
                end
            end

            // ROUND ROBIN STARTS FOR FIFOS

            else begin
                if (push_toggle == 0) begin
                    push_3 <= 0;
                    push_0 <= 1;
                    push_toggle <= push_toggle + 1;
                    if (empty_0|empty_1|empty_2|empty_3) begin
                        if(wrr_pop_toggle >= 0 && wrr_pop_toggle < 4)begin
                            if (empty_0) begin
                                pop_3 <= 0;
                                pop_0 <= 0;
                                wrr_pop_toggle <= 4;
                            end
                            else if (pop_0 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin
                                pop_3 <= 0;                        
                                pop_0 <= 1;                    
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end
                        end
                        else if(wrr_pop_toggle >= 4  && wrr_pop_toggle < 7)begin
                            if (empty_1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                wrr_pop_toggle <= 7;
                            end
                            else if (pop_1 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin
                                pop_0 <= 0;                        
                                pop_1 <= 1;                    
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end
                        end
                        else if(wrr_pop_toggle >= 7  && wrr_pop_toggle < 9)begin
                            if (empty_2) begin
                                pop_1 <= 0;                            
                                pop_2 <= 0;
                                wrr_pop_toggle <= 9;
                            end
                            else if (pop_2 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin
                                pop_1 <= 0;                        
                                pop_2 <= 1;                    
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end
                        end
                        else if (wrr_pop_toggle >= 7  && wrr_pop_toggle < 9) begin
                            if (pop_2 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin 
                                pop_1 <= 0;
                                pop_2 <= 1;
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end                   
                        end
                        else if (wrr_pop_toggle == 9) begin
                            if (pop_3 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin 
                                pop_2 <= 0;
                                pop_3 <= 1;
                                wrr_pop_toggle <= 0;
                            end
                        end
                    end
                    else begin
                        if (wrr_pop_toggle >= 0 && wrr_pop_toggle < 4) begin
                            if (pop_0 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin 
                                pop_3 <= 0;
                                pop_0 <= 1;
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end
                        end
                        else if (wrr_pop_toggle >= 4  && wrr_pop_toggle < 7) begin
                            if (pop_1 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;

                            end
                            else begin 
                                pop_0 <= 0;
                                pop_1 <= 1;
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end                   
                        end
                        else if (wrr_pop_toggle >= 7  && wrr_pop_toggle < 9) begin
                            if (pop_2 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin 
                                pop_1 <= 0;
                                pop_2 <= 1;
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end                   
                        end
                        else if (wrr_pop_toggle == 9) begin
                            if (pop_3 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin 
                                pop_2 <= 0;
                                pop_3 <= 1;
                                wrr_pop_toggle <= 0;
                            end
                        end
                    end
                end
                else if (push_toggle == 1) begin
                    push_0 <= 0;
                    push_1 <= 1;
                    push_toggle <= push_toggle + 1;
                    if (empty_0|empty_1|empty_2|empty_3) begin
                        if(wrr_pop_toggle >= 0 && wrr_pop_toggle < 4)begin
                            if (empty_0) begin
                                pop_3 <= 0;
                                pop_0 <= 0;
                                wrr_pop_toggle <= 4;
                            end
                            else if (pop_0 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin
                                pop_3 <= 0;                        
                                pop_0 <= 1;                    
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end
                        end
                        else if(wrr_pop_toggle >= 4  && wrr_pop_toggle < 7)begin
                            if (empty_1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                wrr_pop_toggle <= 7;
                            end
                            else if (pop_1 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin
                                pop_0 <= 0;                        
                                pop_1 <= 1;                    
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end
                        end
                        else if(wrr_pop_toggle >= 7  && wrr_pop_toggle < 9)begin
                            if (empty_2) begin
                                pop_1 <= 0;                            
                                pop_2 <= 0;
                                wrr_pop_toggle <= 9;
                            end
                            else if (pop_2 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin
                                pop_1 <= 0;                        
                                pop_2 <= 1;                    
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end
                        end
                        else if (wrr_pop_toggle >= 7  && wrr_pop_toggle < 9) begin
                            if (pop_2 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin 
                                pop_1 <= 0;
                                pop_2 <= 1;
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end                   
                        end
                        else if (wrr_pop_toggle == 9) begin
                            if (pop_3 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin 
                                pop_2 <= 0;
                                pop_3 <= 1;
                                wrr_pop_toggle <= 0;
                            end
                        end
                    end
                    else begin
                        if (wrr_pop_toggle >= 0 && wrr_pop_toggle < 4) begin
                            if (pop_0 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin 
                                pop_3 <= 0;
                                pop_0 <= 1;
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end
                        end
                        else if (wrr_pop_toggle >= 4  && wrr_pop_toggle < 7) begin
                            if (pop_1 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;

                            end
                            else begin 
                                pop_0 <= 0;
                                pop_1 <= 1;
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end                   
                        end
                        else if (wrr_pop_toggle >= 7  && wrr_pop_toggle < 9) begin
                            if (pop_2 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin 
                                pop_1 <= 0;
                                pop_2 <= 1;
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end                   
                        end
                        else if (wrr_pop_toggle == 9) begin
                            if (pop_3 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin 
                                pop_2 <= 0;
                                pop_3 <= 1;
                                wrr_pop_toggle <= 0;
                            end
                        end
                    end                    
                end
                else if (push_toggle == 2) begin
                    push_1 <= 0;
                    push_2 <= 1;
                    push_toggle <= push_toggle + 1;
                    if (empty_0|empty_1|empty_2|empty_3) begin
                        if(wrr_pop_toggle >= 0 && wrr_pop_toggle < 4)begin
                            if (empty_0) begin
                                pop_3 <= 0;
                                pop_0 <= 0;
                                wrr_pop_toggle <= 4;
                            end
                            else if (pop_0 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin
                                pop_3 <= 0;                        
                                pop_0 <= 1;                    
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end
                        end
                        else if(wrr_pop_toggle >= 4  && wrr_pop_toggle < 7)begin
                            if (empty_1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                wrr_pop_toggle <= 7;
                            end
                            else if (pop_1 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin
                                pop_0 <= 0;                        
                                pop_1 <= 1;                    
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end
                        end
                        else if(wrr_pop_toggle >= 7  && wrr_pop_toggle < 9)begin
                            if (empty_2) begin
                                pop_1 <= 0;                            
                                pop_2 <= 0;
                                wrr_pop_toggle <= 9;
                            end
                            else if (pop_2 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin
                                pop_1 <= 0;                        
                                pop_2 <= 1;                    
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end
                        end
                        else if (wrr_pop_toggle >= 7  && wrr_pop_toggle < 9) begin
                            if (pop_2 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin 
                                pop_1 <= 0;
                                pop_2 <= 1;
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end                   
                        end
                        else if (wrr_pop_toggle == 9) begin
                            if (pop_3 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin 
                                pop_2 <= 0;
                                pop_3 <= 1;
                                wrr_pop_toggle <= 0;
                            end
                        end
                    end
                    else begin
                        if (wrr_pop_toggle >= 0 && wrr_pop_toggle < 4) begin
                            if (pop_0 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin 
                                pop_3 <= 0;
                                pop_0 <= 1;
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end
                        end
                        else if (wrr_pop_toggle >= 4  && wrr_pop_toggle < 7) begin
                            if (pop_1 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;

                            end
                            else begin 
                                pop_0 <= 0;
                                pop_1 <= 1;
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end                   
                        end
                        else if (wrr_pop_toggle >= 7  && wrr_pop_toggle < 9) begin
                            if (pop_2 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin 
                                pop_1 <= 0;
                                pop_2 <= 1;
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end                   
                        end
                        else if (wrr_pop_toggle == 9) begin
                            if (pop_3 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin 
                                pop_2 <= 0;
                                pop_3 <= 1;
                                wrr_pop_toggle <= 0;
                            end
                        end
                    end                    
                end
                else if (push_toggle == 3) begin
                    push_2 <= 0;
                    push_3 <= 1;
                    push_toggle <= push_toggle + 1;
                    if (empty_0|empty_1|empty_2|empty_3) begin
                        if(wrr_pop_toggle >= 0 && wrr_pop_toggle < 4)begin
                            if (empty_0) begin
                                pop_3 <= 0;
                                pop_0 <= 0;
                                wrr_pop_toggle <= 4;
                            end
                            else if (pop_0 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin
                                pop_3 <= 0;                        
                                pop_0 <= 1;                    
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end
                        end
                        else if(wrr_pop_toggle >= 4  && wrr_pop_toggle < 7)begin
                            if (empty_1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                wrr_pop_toggle <= 7;
                            end
                            else if (pop_1 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin
                                pop_0 <= 0;                        
                                pop_1 <= 1;                    
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end
                        end
                        else if(wrr_pop_toggle >= 7  && wrr_pop_toggle < 9)begin
                            if (empty_2) begin
                                pop_1 <= 0;                            
                                pop_2 <= 0;
                                wrr_pop_toggle <= 9;
                            end
                            else if (pop_2 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin
                                pop_1 <= 0;                        
                                pop_2 <= 1;                    
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end
                        end
                        else if (wrr_pop_toggle >= 7  && wrr_pop_toggle < 9) begin
                            if (pop_2 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin 
                                pop_1 <= 0;
                                pop_2 <= 1;
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end                   
                        end
                        else if (wrr_pop_toggle == 9) begin
                            if (pop_3 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin 
                                pop_2 <= 0;
                                pop_3 <= 1;
                                wrr_pop_toggle <= 0;
                            end
                        end
                    end
                    else begin
                        if (wrr_pop_toggle >= 0 && wrr_pop_toggle < 4) begin
                            if (pop_0 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin 
                                pop_3 <= 0;
                                pop_0 <= 1;
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end
                        end
                        else if (wrr_pop_toggle >= 4  && wrr_pop_toggle < 7) begin
                            if (pop_1 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;

                            end
                            else begin 
                                pop_0 <= 0;
                                pop_1 <= 1;
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end                   
                        end
                        else if (wrr_pop_toggle >= 7  && wrr_pop_toggle < 9) begin
                            if (pop_2 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin 
                                pop_1 <= 0;
                                pop_2 <= 1;
                                wrr_pop_toggle <= wrr_pop_toggle + 1;
                            end                   
                        end
                        else if (wrr_pop_toggle == 9) begin
                            if (pop_3 == 1) begin
                                pop_0 <= 0;
                                pop_1 <= 0;
                                pop_2 <= 0;
                                pop_3 <= 0;
                            end
                            else begin 
                                pop_2 <= 0;
                                pop_3 <= 1;
                                wrr_pop_toggle <= 0;
                            end
                        end
                    end                    
                end
            end
        end
    end
endmodule