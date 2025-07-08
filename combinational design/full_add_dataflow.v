module full_add_dataflow (
           input a,
	   input b,
	   input carry_in,
	   output sum,
	   output carry_out);
	   
	   wire sum1;
	   wire carry1;
	   wire carry2;
	   
	   assign sum1 = a^b;
	   assign carry1 = a&b;
	   assign carry2 = sum1&carry_in;
	   
	   assign sum = sum1^carry_in;
	   assign carry_out = carry1 | carry2;
	   
endmodule
