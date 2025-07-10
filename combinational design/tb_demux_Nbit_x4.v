`timescale 1ns/1ps
module tb_demux_Nbit_x4 ();
    
	parameter BUS_width = 8;
    reg [BUS_width-1:0] y;
    reg [1:0] sel;
	wire [BUS_width-1:0]a;
	wire [BUS_width-1:0]b;
	wire [BUS_width-1:0]c;
	wire [BUS_width-1:0]d;
	
	demux_Nbit_x4  
	#(.N(BUS_width))
	DEMUXn (
	         .y(y),
			 .sel(sel),
			 .a(a),
			 .b(b),
			 .c(c),
			 .d(d)
			);
			
	initial begin
	 $monitor ("y=%b,sel=%d,a=%b,b=%b,c=%b,d=%b",y,sel,a,b,c,d);
	 y=0; sel=0;
	 #1; y=8'b00001111; sel =2'd0;
	 #1; y=8'b00101111; sel =2'd1;
	 #1; y=8'b00011111; sel =2'd2;
	 #1; y=8'b01001111; sel =2'd3;
	 #3; $stop;
	end
endmodule