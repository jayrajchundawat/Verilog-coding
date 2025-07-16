`timescale 1us/1ns

module tb_shift_reg_piso();
	
    reg sdi;
	reg [3:0] d;
	reg preload;
	reg clk = 0;
	reg reset_n;
	wire sdo;
	reg [1:0] delay;
    integer i;
	
    shift_reg_piso PISO0(
	    .clk(clk),
	    .reset_n(reset_n),
		.sdi(sdi),
        .pl(preload), 
        .d(d),
	    .sdo(sdo)		
    );
	
	always begin
	    #0.5 clk = ~clk;
	end
		  
    initial begin
	    #1; 
        reset_n = 0; sdi = 0; preload = 0; d = 0;		
		#1.3; 
		reset_n = 1;
		
		@(posedge clk); d = 4'b0101; preload = 1; @(posedge clk); preload = 0;
        
        repeat (5) @(posedge clk); 
	end
	
    initial begin
        #40 $finish;
    end  
endmodule