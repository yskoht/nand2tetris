module Mux4Way16 (
  input wire [15:0] a, b, c, d,
  input wire [1:0] sel,
  output wire [15:0] out
);

Mux4WayN #(.width(16)) Mux4WayN(.a(a), .b(b), .c(c), .d(d), .sel(sel), .out(out));

endmodule
