module D_latch (
                input d,
		input enable,
		output q,
		output q_not
		);
		
		reg d_latch;
		
		always@ (enable or d) begin
		   if (enable)
		     d_latch <= d;
		end
		
		assign q = d_latch;
		assign q_not = ~q;
		
endmodule
