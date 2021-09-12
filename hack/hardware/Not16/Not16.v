module Not16 (
  input wire[15:0] in,
  output wire[15:0] out
);

NotN #(.width(16)) NotN(.in(in), .out(out));

endmodule
