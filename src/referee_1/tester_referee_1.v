

module tester_referee_1(
	    //input [11:0] 	data_out,
        input push_0, push_1, push_2, push_3,
	    input pop_0, pop_1, pop_2, pop_3,
	    //output reg [11:0] data_in,
        output reg almost_full_0, almost_full_1, almost_full_2, almost_full_3,
        output reg empty_0, empty_1, empty_2, empty_3,
	    output reg reset, clk
	    );

     
   initial begin
      $dumpfile("referee_1.vcd");	// Nombre de archivo del "dump"
      $dumpvars;		// Directiva para "dumpear" variables

      // Valores iniciales cero
      {reset, almost_full_0, almost_full_1, almost_full_2, almost_full_3, empty_0, empty_1, empty_2, empty_3} = 0;

		repeat (2)
			begin
				@(posedge clk)
              	 reset <= 1;

				@(posedge clk)
              	 reset <= 1;					
					
				@(posedge clk)
              	 reset <= 1;					
					
				@(posedge clk)
              	 reset <= 1;					
					
				@(posedge clk)
              	 reset <= 1;				

				@(posedge clk)
              	 reset <= 1;

				@(posedge clk)
              	 reset <= 1;					
                   
			end
		//$finish;
		repeat (2)
			begin
				@(posedge clk)
              	almost_full_0 <= 1;

				@(posedge clk)
              	almost_full_0 <= 1;					
					
				@(posedge clk)
              	almost_full_0 <= 1;					
					
				@(posedge clk)
              	almost_full_0 <= 1;					
					
				@(posedge clk)
              	almost_full_0 <= 1;					

				@(posedge clk)
              	 reset <= 1;

				@(posedge clk)
              	empty_0 <= 1;

				@(posedge clk)
				reset <= 1;					
                
				@(posedge clk)
				reset <= 1;
				empty_0 <= 0;
			
				@(posedge clk)
				reset <= 1;

				@(posedge clk)
				reset <= 1;

				@(posedge clk)
				reset <= 1;

				@(posedge clk)
				reset <= 1;

				@(posedge clk)
				reset <= 1;


			end
		$finish;
	end

   	initial clk <= 0;
	always #1 clk <= ~clk;


endmodule 