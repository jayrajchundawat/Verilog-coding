module full_add_structural (
           input a,
	   input b,
	   input carry_in,
	   output sum,
	   output carry_out);
	   
	   wire sum1;
	   wire carry1;
	   wire carry2;
	   
	   half_add_structural HALF_ADD1(
	      .a(a),
		  .b(b),
		  .sum(sum1),
		  .carry(carry1)
		  );
		  
	   half_add_structural HALF_ADD2(
	      .a(sum1),
		  .b(carry_in),
		  .sum(sum),
		  .carry(carry2)
		  );
		  
		or (carry_out,carry1,carry2);
endmodule
