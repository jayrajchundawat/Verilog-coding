module nbit_comparator 
      # (parameter N = 4)
	  (
      input [N-1:0]a,
	  input [N-1:0]b,
	  output reg smaller,
	  output reg equal,
	  output reg greater
	  );
	  
	  always @(*) begin
	     smaller = a<b;
		 equal = a==b;
		 greater = a>b;
	  end
	  
endmodule