`timescale 1ns/1ns
module tb_adder_tree_procedural();
           reg [3:0] a;
	   reg [3:0] b;
	   reg [7:0] c;
	   reg [7:0] d;
	   wire [4:0] sum1;
	   wire [8:0] sum2;
	   wire [9:0] sum3;
	   
	   adder_tree_procedural ADD_TREE_PROCD (
	                .a(a),
			.b(b),
			.c(c),
			.d(d),
			.sum1(sum1),
			.sum2(sum2),
			.sum3(sum3)
			);
	    
		initial begin
		  $monitor ("a=%b,b=%b,c=%b,d=%b,sum1=%b,sum2=%b,sum3=%b",a,b,c,d,sum1,sum2,sum3);
		  a=0; b=0; c=0; d=0; 
		  #1; a=4'b0011; b=4'b1010; c=8'b00101111; d=8'b00101101;
		  #1; a=4'b0001; b=4'b0010; c=8'b01001111; d=8'b10001101;
		  #1; a=4'b0111; b=4'b1110; c=8'b00101111; d=8'b10101111;
		  #1; a=4'b0110; b=4'b1011; c=8'b10001111; d=8'b11101101;
		  #5; $stop;
		end
endmodule
		  
		  
