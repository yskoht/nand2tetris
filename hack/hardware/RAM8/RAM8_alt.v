module RAM8 (
  input wire clk, load,
  input wire [15:0] in,
  input wire [2:0] address,
  output wire [15:0] out
);

RAM #(.width(16), .k(3)) RAM(
  .clk(clk),
  .load(load),
  .in(in),
  .address(address),
  .out(out)
);

endmodule
