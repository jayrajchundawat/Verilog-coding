`timescale 1ns/100ps
module tb_MUX_4x_nbit ();
          parameter BUS_WIDTH = 8;
	  reg [BUS_WIDTH-1:0] a;
	  reg [BUS_WIDTH-1:0] b;
	  reg [BUS_WIDTH-1:0] c;
	  reg [BUS_WIDTH-1:0] d;
	  reg [1:0] sel;
	  wire [BUS_WIDTH-1:0] y;
	  
	  MUX_4x_nbit  
	  #(.N(BUS_WIDTH))
	   MUX1 
	    (
	          .a(a),
		  .b(b),
		  .c(c),
		  .d(d),
		  .sel(sel),
		  .y(y)
		  );
	  initial begin 
	         $monitor ("a=%b,b=%b,c=%b,d=%b,sel=%b,y=%b",a,b,c,d,sel,y);
		 a = 0; b=0; c=0; d=0; sel=0;
		 #1; a = 8'b00110011; b = 8'b00000000; c = 8'b00011100; d = 8'b11111111; sel = 0;
		 #1; a = 8'b00110011; b = 8'b00000000; c = 8'b00011100; d = 8'b11111111; sel = 1;
		 #1; a = 8'b00110011; b = 8'b00000000; c = 8'b00011100; d = 8'b11111111; sel = 2;
		 #1; a = 8'b00110011; b = 8'b00000000; c = 8'b00011100; d = 8'b11111111; sel = 3;
		 #2; $stop;
	  end
endmodule
		 
		 
	  
