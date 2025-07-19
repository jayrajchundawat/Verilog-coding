`timescale 1ns/1ps
module tb_nbit_counter ();
         parameter CNT_WIDTH = 3;
	 reg clk=0;
	 reg reset_n;
	 wire [CNT_WIDTH-1:0] counter;
	 
	 nbit_counter 
	  #(.CNT_WIDTH(CNT_WIDTH))
	          CNT1 (
	                 .clk(clk),
			 .reset_n(reset_n),
			 .counter (counter)
			);
			
	 always begin 
	   #0.5; clk=~clk;
	 end
	 
	 initial begin
	   $monitor ($time,"counter = %d", counter);
	   #1; reset_n =0; 
	   #1.3; reset_n= 1;
	   #20; $stop;
	 end
endmodule
    
	
