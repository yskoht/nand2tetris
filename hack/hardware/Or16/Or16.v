module Or16 (
  input wire [15:0] a, b,
  output wire [15:0] out
);

OrN #(.width(16)) OrN(.a(a), .b(b), .out(out));

endmodule
