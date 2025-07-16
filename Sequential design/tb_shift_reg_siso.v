`timescale 1us/1ns
module tb_shift_reg_siso();
	
    reg sdi;
	reg clk = 0;
	reg reset_n;
	wire sdo;
	
    shift_reg_siso SISO0(
		.reset_n(reset_n),
	    .clk    (clk    ),
        .sdi    (sdi    ),
	    .sdo    (sdo    )
    );
	

	always begin #0.5 clk = ~clk; end
		  
    initial begin
	    #1; 
        reset_n = 0; sdi = 0;
		
		#1.3; 
		reset_n = 1;
		
		@(posedge clk); sdi = 1'b1; @(posedge clk); sdi = 1'b0;
        
        repeat (5) @(posedge clk); 
		@(posedge clk); sdi = 1'b1; 
		@(posedge clk);
		@(posedge clk); sdi = 1'b0;
	end
	
    initial begin
        #40 $finish;
    end  
endmodule
