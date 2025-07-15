module D_ff_sync_reset (
        input d,
		input enable,
		input clk,
		input reset_n,
		output reg q,
		output q_not
		);
		
		
		always@ (posedge clk) begin
		   if (!reset_n)
		     q <= 1'b0;
		   else if (enable)
		     q <= d;
		end
	
		assign q_not = ~q;
		
endmodule