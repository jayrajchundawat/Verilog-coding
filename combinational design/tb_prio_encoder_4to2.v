`timescale 1ns/100ps
module tb_prio_encoder_4to2 ();
         reg [3:0]d;
		 wire [1:0] q;
		 wire v;
		 
		 integer i;
		 
		 prio_encoder_4to2 PRIO1(
		   .d(d),
		   .q(q),
		   .v(v)
		   );
		   
		initial begin
		  $monitor ("d=%b,q=%b,v=%d",d,q,v);
		  for (i=0; i<4; i=i+1) begin
		    #1; d = 1<<i;
		  end
		  #1; d = 4'b1111;
		  #1; d = 4'b0000;
		  #1; d = 4'b1001;
		  #1; d = 4'b0101;
		end
endmodule
		  
         