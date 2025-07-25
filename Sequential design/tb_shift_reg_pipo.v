`timescale 1us/1ns
module tb_shift_reg_pipo();
	
        reg [3:0] d;
	reg clk = 0;
	reg reset_n;
	wire [3:0] q;
       integer i;
	
    shift_reg_pipo PIPO0(
	    .reset_n(reset_n),
	    .clk    (clk    ),
            .d      (d      ),
	    .q      (q      )
    );
	
	always begin
	    #0.5 clk = ~clk;
	end
		  
         initial begin
	        #1; 
                reset_n = 0; d = 0;		
		#1.3; 
		reset_n = 1;
		
		for (i=0; i<5; i=i+1) begin
                   @(posedge clk); d = $random;
		end	
         end
	
    initial begin
        #20 $finish;
    end  
endmodule
