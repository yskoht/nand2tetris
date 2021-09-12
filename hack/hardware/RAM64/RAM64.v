module RAM64 (
  input wire clk, load,
  input wire [15:0] in,
  input wire [5:0] address,
  output wire [15:0] out
);

RAM64N #(.width(16)) RAM16N(
  .clk(clk),
  .load(load),
  .in(in),
  .address(address),
  .out(out)
);

endmodule
