module adder_ff(
  input CK,
  input rst_n,
  input scan_enable,
  input scan_in,
  input [3:0] a,
  input [3:0] b,
  output [4:0] sum,
  output scan_out
);

  wire _00_, _01_, _02_, _03_, _04_, _05_, _06_, _07_, _08_, _09_;
  wire _10_, _11_, _12_, _13_, _14_, _18_, _19_, _20_, _21_, _22_;
  wire [4:0] _15_, _16_, _17_;
  wire [4:0] sum_reg;

  // Intermediate logic
  assign _00_ = a[1] ^ b[1];
  assign _01_ = ~(a[0] & b[0]);
  assign _17_[1] = ~(_01_ ^ _00_);
  assign _02_ = ~(a[2] ^ b[2]);
  assign _03_ = ~(a[1] & b[1]);
  assign _04_ = _00_ & ~(_01_);
  assign _05_ = _04_ | ~(_03_);
  assign _17_[2] = ~(_05_ ^ _02_);
  assign _06_ = ~(a[3] ^ b[3]);
  assign _07_ = ~(a[2] & b[2]);
  assign _08_ = _05_ & ~(_02_);
  assign _09_ = _07_ & ~(_08_);
  assign _17_[3] = _09_ ^ _06_;
  assign _16_[0] = a[0] ^ b[0];
  assign _10_ = a[3] & b[3];
  assign _11_ = ~(_07_ | _06_);
  assign _12_ = _11_ | _10_;
  assign _13_ = _06_ | _02_;
  assign _14_ = _05_ & ~(_13_);
  assign _15_[3] = _14_ | _12_;
  assign _15_[4] = 1'b0;
  assign _16_[4] = 1'b0;
  assign { _17_[4], _17_[0] } = { _15_[3], _16_[0] };

  assign _18_ = rst_n ? _16_[0] : 1'b0;
  assign _19_ = rst_n ? _17_[1] : 1'b0;
  assign _20_ = rst_n ? _17_[2] : 1'b0;
  assign _21_ = rst_n ? _17_[3] : 1'b0;
  assign _22_ = rst_n ? _15_[3] : 1'b0;

  // Scan Flip-Flops only (no scan chain yet)
  SDFF_X1 u0 (.CK(CK), .D(_18_), .Q(sum_reg[0]), .RN(rst_n), .SE(scan_enable), .SI(1'b0));
  SDFF_X1 u1 (.CK(CK), .D(_19_), .Q(sum_reg[1]), .RN(rst_n), .SE(scan_enable), .SI(1'b0));
  SDFF_X1 u2 (.CK(CK), .D(_20_), .Q(sum_reg[2]), .RN(rst_n), .SE(scan_enable), .SI(1'b0));
  SDFF_X1 u3 (.CK(CK), .D(_21_), .Q(sum_reg[3]), .RN(rst_n), .SE(scan_enable), .SI(1'b0));
  SDFF_X1 u4 (.CK(CK), .D(_22_), .Q(sum_reg[4]), .RN(rst_n), .SE(scan_enable), .SI(1'b0));

  assign sum = sum_reg;
  assign scan_out = 1'b0;  // Not connected yet

endmodule
