module Mux16 (
  input wire [15:0] a, b,
  input wire sel,
  output wire [15:0] out
);

MuxN #(.width(16)) MuxN(.a(a), .b(b), .sel(sel), .out(out));

endmodule
