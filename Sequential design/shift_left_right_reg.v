module shift_left_right_reg (
        input load_enable,
		input clk,
		input reset_n,
		input [7:0] i,
		input shift_left_right,
		output reg [7:0] q
		);
		
		always @ (posedge clk or negedge reset_n) begin
		  if (!reset_n)
		     q <= 8'b0;
		  else if (load_enable == 1'b0)
		     q <= i;
		  else begin
		     if (shift_left_right == 1'b0) begin
		        q <= {q[6:0], 1'b0};
			 end else begin
			    q <= {1'b0, q[6:0]};
			 end
		  end
		end
endmodule
		
		