module D_ff_async_reset (
        input d,
		input enable,
		input clk,
		input reset_n,
		output reg q,
		output q_not
		);
		
		
		always@ (posedge clk or negedge reset_n) begin
		   if (!reset_n)
		     q <= 1'b0;
		   else if (enable)
		     q <= d;
		end
	
		assign q_not = ~q;
		
endmodule