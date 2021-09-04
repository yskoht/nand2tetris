module AndN #(
  parameter width = 16
) (
  input wire[width-1:0] a, b,
  output wire [width-1:0] out
);

genvar i;
generate
  for (i = 0; i < width; i = i + 1) begin
    And And(.a(a[i]), .b(b[i]), .out(out[i]));
  end
endgenerate

endmodule
