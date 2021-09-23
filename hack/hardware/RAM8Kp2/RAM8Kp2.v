module RAM8Kp2 (
  input wire clk, load,
  input wire [15:0] in,
  input wire [12:0] address1, address2,
  output wire [15:0] out1, out2
);

RAMp2 #(.width(16), .k(13)) RAMp2(
  .clk(clk),
  .load(load),
  .in(in),
  .address1(address1),
  .out1(out1),
  .address2(address2),
  .out2(out2)
);

endmodule
