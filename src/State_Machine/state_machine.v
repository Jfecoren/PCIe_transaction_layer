module state_machine(
    output reg [2:0] umbral_superior, umbral_inferior,
    output reg [3:0] State,
    input clk,
    input [2:0] Umbral_bajo, Umbral_alto,
    input reset,
    input init,
    input empty0,empty1,empty2,empty3,empty4,empty5,empty6,empty7
);
reg [3:0] Nxt_State, Estado;

parameter [3:0] RESET = 4'b0001 ;
parameter [3:0] INIT = 4'b0010 ;
parameter [3:0] IDLE = 4'b0100 ;
parameter [3:0] ACTIVE = 4'b1000 ;

always @(posedge clk ) begin
    if (reset) begin
        Estado <= RESET;
        umbral_superior <=0;
        umbral_inferior <=0;
    end
    else begin
        if(init) begin
           Estado <= INIT;
            umbral_superior <=Umbral_alto;
            umbral_inferior <=Umbral_bajo;
        end
        else begin
            Estado <=Nxt_State;
        end
    end
end

always @(*) begin
    if (reset) begin
        State <= RESET;
        Nxt_State=0;
    end

    else begin 
        State=Estado;
        Nxt_State=Estado;
        case (Estado)
        // RESET
        RESET: begin
            Nxt_State=INIT;
        end  
        // INIT
        INIT: begin
            Nxt_State=IDLE;
        end
        // IDLE
        IDLE: begin
            if (empty0==0||empty1==0||empty2==0||empty3==0||empty4==0||empty5==0||empty6==0||empty7==0 ) begin
                Nxt_State=ACTIVE;
            end
            else begin
                Nxt_State=IDLE;
            end  
        end
        // ACTIVE
        ACTIVE: begin
            if (empty0==0||empty1==0||empty2==0||empty3==0||empty4==0||empty5==0||empty6==0||empty7==0 ) begin
                Nxt_State=ACTIVE;
            end
            else begin
                Nxt_State = IDLE;
            end
        end
        endcase
    end
end
endmodule