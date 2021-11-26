module tester(
    input [2:0] umbral_superior, umbral_inferior,
    input [3:0] State,
    output reg clk,
    output reg[2:0] Umbral_bajo, Umbral_alto,
    output reg reset,
    output reg init,
    output reg empty0,empty1,empty2,empty3,empty4,empty5,empty6,empty7
);
    initial begin
        $dumpfile("state_machine.vcd");	// Nombre de archivo del "dump"
      $dumpvars;		// Directiva para "dumpear" variables

      // Valores iniciales cero
      {clk, reset, Umbral_bajo, Umbral_alto, init} = 0;
      {empty0,empty1,empty2,empty3,empty4,empty5,empty6,empty7}=0;

    @(posedge clk);
      reset <= 1;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
    
    @(posedge clk);
    reset <= 0;
    empty0 <=1;
    init<=1;
    Umbral_bajo<=1;
    Umbral_alto<=7;
    @(posedge clk);
    init<=0;
    @(posedge clk);
    empty1 <=1;
    @(posedge clk);
    empty2 <=1;
    @(posedge clk);
    empty3 <=1;
    @(posedge clk);
    empty4 <=1;
    @(posedge clk);
    empty5 <=1;
    @(posedge clk);
    empty6 <=1;
    @(posedge clk);
    empty7 <=1;
    @(posedge clk);
    reset <=1;
    @(posedge clk);
    reset <=0;  
    @(posedge clk);
    @(posedge clk);  
    @(posedge clk);
    @(posedge clk);  
    @(posedge clk);

    $finish;
    end
    initial	clk 	<= 0;			
  always	#1 clk 	<= ~clk;


endmodule