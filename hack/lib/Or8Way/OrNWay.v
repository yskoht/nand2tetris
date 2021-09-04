module OrNWay #(
  parameter way = 8
) (
  input wire [way-1:0] in,
  output wire out
);

wire [way-1:0] t;

assign t[0] = in[0];
assign out = t[way-1];

genvar i;
generate
  for (i = 1; i < way; i = i + 1) begin
    Or Or(.a(t[i-1]), .b(in[i]), .out(t[i]));
  end
endgenerate

endmodule
