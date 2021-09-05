module Inc16 (
  input wire [15:0] in,
  output wire [15:0] out
);

IncN #(.width(16)) IncN(.in(in), .out(out));

endmodule
