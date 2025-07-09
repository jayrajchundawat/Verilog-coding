module tb_ripple_add_4bit_behavioral();
        reg [3:0] a;
		reg [3:0] b;
		reg carry_in;
		wire [3:0] sum;
		wire carry_out;
		
		wire [2:0] c;
		
		ripple_add_4bit_behavioral RIP_ADD(
		
		  .a(a),
		  .b(b),
		  .carry_in(carry_in),
		  .carry_out(carry_out),
		  .sum(sum)
		  );
		  
		  
		initial begin
		 $monitor ("a=%b,b=%b,carry_in=%b,sum=%b,carry_out=%b",a,b,carry_in,sum,carry_out);
		 #1; a=4'b0000; b=4'b0000; carry_in=0;
		 #1; a = 4'b0000; b = 4'b0000; carry_in = 1;
         #1; a = 4'b0001; b = 4'b0001; carry_in = 0;
         #1; a = 4'b0001; b = 4'b0001; carry_in = 1;
         #1; a = 4'd3;    b = 4'd6;    carry_in = 0;
		end
endmodule