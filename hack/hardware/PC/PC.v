module PC (
  input wire clk, load, inc, reset,
  input wire [15:0] in,
  output wire [15:0] out
);

PCN #(.width(16)) PCN(
  .clk(clk),
  .load(load),
  .inc(inc),
  .reset(reset),
  .in(in),
  .out(out)
);

endmodule
