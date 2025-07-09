module ripple_add_4bit_behavioral (
           input [3:0] a,
		   input [3:0] b,
		   input carry_in,
		   output [3:0] sum,
		   output carry_out
		   );
		   
		   wire [2:0] c;
		   
		 full_add_behavioral FA_ADD0(
	      .a(a[0]),
		  .b(b[0]),
		  .sum(sum[0]),
		  .carry_in(carry_in),
		  .carry_out(c[0])
		  );
		 full_add_behavioral FA_ADD1(
	      .a(a[1]),
		  .b(b[1]),
		  .sum(sum[1]),
		  .carry_in(c[0]),
		  .carry_out(c[1])
		  );
		 full_add_behavioral FA_ADD2(
	      .a(a[2]),
		  .b(b[2]),
		  .sum(sum[2]),
		  .carry_in(c[1]),
		  .carry_out(c[2])
		  );
		 full_add_behavioral FA_ADD3(
	      .a(a[3]),
		  .b(b[3]),
		  .sum(sum[3]),
		  .carry_in(c[2]),
		  .carry_out(carry_out)
		  );
endmodule
		  