module Bit (
  input wire clk, in, load,
  output wire out
);

wire t;

Mux Mux(.a(out), .b(in), .sel(load), .out(t));
DFF DFF(.clk(clk), .in(t), .out(out));

endmodule
