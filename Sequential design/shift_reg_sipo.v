module shift_reg_sipo(
	input reset_n,
	input clk,
	input sdi,
	output reg [3:0] q
    );
	
	always @(posedge clk or negedge reset_n) begin
	    if (!reset_n)
		    q <= 4'b0;
	    else
		    q[3:0] <= {q[2:0],sdi};  
	end

endmodule



