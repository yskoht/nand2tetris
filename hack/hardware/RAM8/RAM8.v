module RAM8 (
  input wire clk, load,
  input wire [15:0] in,
  input wire [2:0] address,
  output wire [15:0] out
);

RAM8N #(.width(16)) RAM8N(
  .clk(clk),
  .load(load),
  .in(in),
  .address(address),
  .out(out)
);

endmodule
