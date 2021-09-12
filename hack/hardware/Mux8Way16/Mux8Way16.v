module Mux8Way16 (
  input wire [15:0] a, b, c, d, e, f, g, h,
  input wire [2:0] sel,
  output wire [15:0] out
);

Mux8WayN #(.width(16)) Mux8WayN(.a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .h(h), .sel(sel), .out(out));

endmodule
