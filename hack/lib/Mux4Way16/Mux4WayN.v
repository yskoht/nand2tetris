module Mux4WayN #(
  parameter width = 16
) (
  input wire[width-1:0] a, b, c, d,
  input wire [1:0] sel,
  output wire [width-1:0] out
);

wire [width-1:0] w1, w2;

MuxN #(.width(width)) MuxN1(.a(a), .b(b), .sel(sel[0]), .out(w1));
MuxN #(.width(width)) MuxN2(.a(c), .b(d), .sel(sel[0]), .out(w2));
MuxN #(.width(width)) MuxN3(.a(w1), .b(w2), .sel(sel[1]), .out(out));

endmodule
