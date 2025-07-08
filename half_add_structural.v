module half_add_structural(
           input a,
	   input b,
	   output sum,
	   output carry);
	   
	   xor XOR1 (sum,a,b);
	   and AND1 (carry,a,b);
	   
endmodule
