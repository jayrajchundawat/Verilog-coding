module prio_encoder_4to2 (
                input [3:0]d,
		output reg v,
		output reg [1:0] q
		);
		
		always @ (*) begin
		  if (d[3])
		    q = 2'd3;
		  else if (d[2])
		    q = 2'd2;
		  else if (d[1])
		    q = 2'd1;
		  else
		    q = 2'd0;
		end
		
		always @ (*) begin
		  if (d==4'b0000)
		   v=0;
		  else
		   v=1;
		end
endmodule
		
         
