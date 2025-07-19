`timescale 1ns/1ps
module tb_lfsr_16 ();
   
   reg clk=0;
   reg enable;
   reg reset_n;
   wire [15:0] lfsr;
   
   lfsr_16  LFSR16 (
          .clk(clk),
	  .enable(enable),
	  .reset_n(reset_n),
	  .lfsr(lfsr)
	  );
	  
	always begin
	 #0.5; clk = ~clk;
	end
	  
	  initial begin
	   $monitor ($time,"enable = %d, lfsr = 0x%x", enable, lfsr);
	   
	   #1; reset_n=0; enable=0;
	   
	   #1.3; reset_n=1; 
	   repeat(2) @ (posedge clk);
	   
	   enable=1;
	   repeat (10) @ (posedge clk);
	   
	   enable=0;
	   end
	
    initial begin
        #20 $stop;
    end  
endmodule
	   
