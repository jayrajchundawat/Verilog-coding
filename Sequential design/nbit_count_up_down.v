module nbit_count_up_down 
      # (parameter CNT_WIDTH = 3)
              (
                input clk,
		input reset_n,
		input count_up_down,
		output reg [CNT_WIDTH-1:0] counter);
		
		always @ (posedge clk or negedge reset_n) begin
		        if (!reset_n)
			  counter <= 0;
			else if (count_up_down == 1'b1) begin 
			  counter <= counter + 1'b1;
			end else begin
			  counter <= counter - 1'b1; 
			end
		end
endmodule
