module state_machine(
    output reg [2:0] upper_bound, lower_bound,
    output reg [3:0] state,
    input [7:0] empties,
    input [2:0] low_bound, up_bound,
    input reset, init,
    input clk
);
    reg [3:0] next_state, pres_state;

    // Using One-Hot Codification
    parameter [3:0] RESET = 4'b0001;
    parameter [3:0] INIT = 4'b0010;
    parameter [3:0] IDLE = 4'b0100;
    parameter [3:0] ACTIVE = 4'b1000;

    always @(posedge clk) begin
        if (~reset) begin
            state <= RESET;
            upper_bound <=0;
            lower_bound <=0;
        end
        else begin
            if(init) begin
            state <= INIT;
                upper_bound <= up_bound;
                lower_bound <= low_bound;
            end
            else begin
                pres_state <= next_state;
            end
        end
    end

    always @(*) begin
        if (~reset) begin
            state = RESET;
            next_state = 0;
        end
        else begin 
            State=pres_state;
            next_state=pres_state;
            case (pres_state)
            // RESET
            RESET: begin
                next_state=INIT;
            end  
            // INIT
            INIT: begin
                next_state=IDLE;
            end
            // IDLE
            IDLE: begin
                if (empty0==0||empty1==0||empty2==0||empty3==0||empty4==0||empty5==0||empty6==0||empty7==0 ) begin
                    next_state=ACTIVE;
                end
                else begin
                    next_state=IDLE;
                end  
            end
            // ACTIVE
            ACTIVE: begin
                if (empty0==0||empty1==0||empty2==0||empty3==0||empty4==0||empty5==0||empty6==0||empty7==0 ) begin
                    next_state=ACTIVE;
                end
                else begin
                    next_state = IDLE;
                end
            end
            endcase
        end
    end
endmodule