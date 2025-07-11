module comparator (
          input a,
	  input b,
	  output smaller,
	  output equal,
	  output greater
	  );
	  
	  wire not_a;
	  wire not_b;
	  
	  and and1 (smaller,not_a,b);
	  nxor nxor1 (equal,a,b);
	  and and2 (greater,not_b,a);
	  
endmodule
