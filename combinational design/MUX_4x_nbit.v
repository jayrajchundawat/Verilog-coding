module MUX_4x_nbit 
  #(parameter N = 8)
  (
   input [N-1:0] a,
   input [N-1:0] b,
   input [N-1:0] c,
   input [N-1:0] d,
   input [1:0] sel,
   output reg [N-1:0] y
   );
   
   always @(*) begin
      case (sel)
	   2'd0 : y = a;
	   2'd1 : y = b;
	   2'd2 : y = c;
	   2'd3 : y = d;
	   default : y = a;
	  endcase
	end
endmodule
	   
   