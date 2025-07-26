module Seq_det_overlap (
            input clk,
			input reset_n,
			input seq_in,
			output reg detected,
			output [1:0] state_out
			);
			
			parameter [1:0] s1 = 2'd0,
			                s10 = 2'd1,
							s101= 2'd2;
							
			reg [1:0] state;
			reg [1:0] next_state;
			
			always @(*) begin
			   detected = 1'b0;
			   
			   case (state) 
			        
				s1: begin	
					 if (seq_in == 1) next_state = s10;
					 else             next_state = s1;
					end
				s10: begin
				      if (seq_in == 0) next_state = s101;
					  else             next_state = s10;
					 end
				s101: begin
				       if (seq_in == 1) begin
					    detected = 1'b1;
					   end
					   next_state = s10;  // Overlapping: allows 1 to be reused
					  end
				default: next_state = s1;
			  endcase
			end
			
			always @(posedge clk or negedge reset_n) begin
			  if (!reset_n)
			    state <= s1;
			  else
			    state <= next_state;
			end
			
			assign state_out = state;
endmodule
					
			