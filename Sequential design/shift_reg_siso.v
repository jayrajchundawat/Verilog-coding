
module shift_reg_siso(
	input reset_n,
	input clk,
    input sdi, 
	output sdo 
    );
		
	reg [3:0] siso;
	
	always @(posedge clk or negedge reset_n) begin
	    if (!reset_n)
		    siso <= 4'b0;
	    else
		    siso[3:0] <= {siso[2:0], sdi};
	end

    assign sdo = siso[3];

endmodule


