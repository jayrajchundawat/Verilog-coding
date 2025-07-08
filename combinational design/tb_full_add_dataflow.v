module tb_full_add_dataflow();
       reg  a;
	   reg b;
	   reg carry_in;
	   wire sum;
	   wire carry;
	   
	   full_add_dataflow FULL_ADD2 (
	       .a(a),
		   .b(b),
		   .carry_in(carry_in),
		   .sum(sum),
		   .carry(carry)
		   );
		   
	   initial begin
         $monitor("a=%b, b=%b, carry_in=%0b, sum=%b, carry =%b", a, b, carry_in, sum, carry);
       end  
  
    initial begin
        #1; a = 0; b = 0; carry_in = 0;
        #1; a = 0; b = 0; carry_in = 1;
        #1; a = 0; b = 1; carry_in = 0;
        #1; a = 0; b = 1; carry_in = 1;
        #1; a = 1; b = 0; carry_in = 0;
        #1; a = 1; b = 0; carry_in = 1;
        #1; a = 1; b = 1; carry_in = 0;
        #1; a = 1; b = 1; carry_in = 1;
    end
  
endmodule