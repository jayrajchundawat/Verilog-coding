`timescale 1ns/1ps
module tb_nbit_count_up_down ();
         parameter CNT_WIDTH = 3;
	 reg clk=0;
	 reg reset_n;
	 reg count_up_down;
	 wire [CNT_WIDTH-1:0] counter;
	 
	 nbit_count_up_down 
	  #(.CNT_WIDTH(CNT_WIDTH))
	         CNTUD (
	                 .clk(clk),
			 .reset_n(reset_n),
			 .count_up_down(count_up_down),
			 .counter (counter)
			);
			
	 always begin 
	   #0.5; clk=~clk;
	 end
	 
	 initial begin
	   $monitor ($time,"counter = %d", counter);
	   #1; reset_n =0; 
	   #1.3; reset_n= 1; count_up_down = 1'b1;
	   #4; reset_n = 1; count_up_down = 1'b0;
	   #20; $stop;
	 end
endmodule
    
	
