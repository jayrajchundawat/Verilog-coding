`timescale 1ns/1ps
module tb_half_add_behavioural(
               );
	reg a;
	reg b;
	wire sum;
	wire carry;
	
	half_add_structural HALF_ADD1(
	          .a(a),
		  .b(b),
		  .sum(sum),
		  .carry(carry)
		  );
		  
	initial begin
	  $monitor ($time,"a=%b,b=%b,sum=%b,carry=%b",a,b,sum,carry);
	  a=0; b=0;
	  #1; a=1'b0; b=1'b1;
	  #1; a=1'b1; b=1'b0;
	  #1; a=1'b1; b=1'b1;
	end
endmodule
	  
