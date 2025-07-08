module half_add_behavioural(
       input a,
	   input b,
	   
	   output reg sum,
	   output reg carry);
	   
	   always@(*) begin
	      sum = a^b;
		  carry = a&b;
		end	   
endmodule
