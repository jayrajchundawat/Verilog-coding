`timescale 1ns/100ps
 module tb_encoder_8to3 ();
                 reg [7:0] d;
		 reg enable;
		 wire [2:0] y;
		 
		 encoder_8to3 END_8to3 (
		        .d(d),
			.enable(enable),
			.y(y)
			);
			
		initial begin 
		   $monitor ("d=%b,enable=%d,y=%d",d,enable,y);
		   d=0; enable=0;
		   #1; d=8'b00000000; enable=1;
		   #1; d=8'b00000010; enable=1;
		   #1; d=8'b00000100; enable=1;
		   #1; d=8'b00001000; enable=1;
		   #1; d=8'b00010000; enable=1;
		   #1; d=8'b00100000; enable=1;
		   #1; d=8'b01000000; enable=1;
		   #1; d=8'b10000000; enable=1;
		   #1; $stop;
		end
endmodule
