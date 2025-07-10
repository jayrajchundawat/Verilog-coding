module Tri_buffer (
      input a,
	  input x,
	  output y
	  );
	  
	  bufif1 (y,a,x);
endmodule