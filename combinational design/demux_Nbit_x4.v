module demux_Nbit_x4
  # (parameter N = 8)
  (
   input [N-1:0]y,
   input [1:0]sel,
   output reg [N-1:0]a,
   output reg [N-1:0]b,
   output reg [N-1:0]c,
   output reg [N-1:0]d
   );
   
   always @(*) begin
     a=0; b=0; c=0; d=0;
	 
	 case (sel)
	    2'd0: a=y;
		2'd1: b=y;
		2'd2: c=y;
		2'd3: d=y;
		default: a=y;
	 endcase
   end
endmodule
		
       
   