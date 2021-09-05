module Add16 (
  input wire [15:0] a, b,
  output wire [15:0] out
);

AddN #(.width(16)) AddN(.a(a), .b(b), .out(out));

endmodule
