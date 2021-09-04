module Mux8WayN #(
  parameter width = 16
) (
  input wire[width-1:0] a, b, c, d, e, f, g, h,
  input wire [2:0] sel,
  output wire [width-1:0] out
);

wire [width-1:0] w1, w2;

Mux4WayN #(.width(width)) Mux4WayN1(.a(a), .b(b), .c(c), .d(d), .sel(sel[1:0]), .out(w1));
Mux4WayN #(.width(width)) Mux4WayN2(.a(e), .b(f), .c(g), .d(h), .sel(sel[1:0]), .out(w2));
MuxN #(.width(width)) MuxN(.a(w1), .b(w2), .sel(sel[2]), .out(out));

endmodule
