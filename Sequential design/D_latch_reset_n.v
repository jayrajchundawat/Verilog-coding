module D_latch (
        input d,
		input enable,
		input reset_n,
		output q,
		output q_not
		);
		
		reg d_latch;
		
		always@ (enable or d or reset_n) begin
		   if (!reset_n)
		     d_latch <= 1'b0;
		   else if (enable)
		     d_latch <= d;
		end
		
		assign q = d_latch;
		assign q_not = ~q;
		
endmodule