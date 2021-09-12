module Or8Way (
  input wire [7:0] in,
  output wire out
);

OrNWay #(.way(8)) OrNWay(.in(in), .out(out));

endmodule
