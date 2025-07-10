`timescale 1ns/1ps
module tb_Hex_7seg_decoder();
     
	 reg [3:0] in;
	 wire a,b,c,d,e,f,g;
	 wire dot;
	 
	 integer i;
	 
	 Hex_7seg_decoder  DEC7 (
	                 .in(in),
			 .a(a),
			 .b(b),
			 .c(c),
			 .d(d),
			 .e(e),
			 .f(f),
			 .g(g),
			 .dot(dot)
			 );
			 
	 initial begin 
	   $monitor ("in=%b,a=%b,b=%b,c=%b,d=%b,e=%b,f=%b,g=%b,dot=%b",in,a,b,c,d,e,f,g,dot);
	   #1; in =0;
	   for (i=0; i<16; i=i+1) begin
	        #1;    in = i;
           end
	 end
endmodule
			
	
	
