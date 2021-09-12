module Register (
  input wire clk, load,
  input wire [15:0] in,
  output wire [15:0] out
);

RegisterN #(.width(16)) RegisterN(.clk(clk), .load(load), .in(in), .out(out));

endmodule
