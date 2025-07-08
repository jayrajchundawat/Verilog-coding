module tb_full_add_behavioral();
       reg  a;
	   reg b;
	   reg carry_in;
	   wire sum;
	   wire carry_out;
	   
	   full_add_behavioral FULL_ADD3 (
	       .a(a),
		   .b(b),
		   .carry_in(carry_in),
		   .sum(sum),
		   .carry_out(carry_out)
		   );
		   
	   initial begin
         $monitor("a=%b, b=%b, carry_in=%0b, sum=%b, carry_out =%b", a, b, carry_in, sum, carry_out);
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