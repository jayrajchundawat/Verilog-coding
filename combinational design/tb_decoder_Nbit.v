`timescale 1ns/1ns
module tb_decoder_Nbit ();
      parameter DEC_WIDTH =3;
      reg [DEC_WIDTH-1:0]a;
      reg enable;
      wire [2**DEC_WIDTH-1:0]y;
	  
	  integer i;
	  
	  decoder_Nbit  
	  #(.N(DEC_WIDTH))
	    DECO1
	  (
	   .a(a),
	   .enable(enable),
	   .y(y)
	   );
	   
	  initial begin
	   $monitor("a=%b, enable=%b, y=%b", a, enable, y);
	   a=0; enable=0;
	   #1; for (i=0; i<2**DEC_WIDTH; i=i+1) begin
	          #1;  a = i; enable=1;
		   end
	   #1; $stop;
	  end
endmodule
	   