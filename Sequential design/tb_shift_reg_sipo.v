`timescale 1ns/1ps
module tb_shift_reg_sipo ();

          reg sdi;
	  reg clk=0;
	  reg reset_n;
	  wire [3:0] q;
	  integer i;
	  
	  
	  always begin
	   #1; clk=~clk;
	  end
	  
	  shift_reg_sipo SIPO(
	       .sdi(sdi),
		   .clk (clk),
		   .reset_n(reset_n),
		   .q(q)
		   );
		   
	  initial begin
	    #1;
		reset_n = 0; sdi=0;
		#1.5;
		reset_n =1;
		for (i=0; i<5; i=i+1) begin
		 @(posedge clk); sdi=$random;
		end
	  end
	  initial begin
            #20 $finish;
          end 
endmodule
	  
