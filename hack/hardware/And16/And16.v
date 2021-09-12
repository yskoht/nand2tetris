module And16 (
  input wire [15:0] a, b,
  output wire [15:0] out
);

AndN #(.width(16)) AndN(.a(a), .b(b), .out(out));

endmodule
