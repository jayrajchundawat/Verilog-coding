
module lfsr_16 (
           input clk,
	   input reset_n,
	   input enable,
	   output reg [15:0]lfsr
	   );
	   
	   localparam RST_SEED = 16'h1001;
	   wire feedback;
	   
	   assign feedback = lfsr[15] ^ lfsr[13] ^ lfsr[12] ^ lfsr[10];
	   
	   always @ (posedge clk or negedge reset_n) begin
	      if (!reset_n)
		     lfsr <= RST_SEED;
	      else if (enable == 1'b1)
		     lfsr <= {lfsr [14:0],feedback};
	      end
endmodule
		  
	   
	   
