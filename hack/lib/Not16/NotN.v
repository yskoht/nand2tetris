module NotN #(
  parameter width = 16
) (
  input wire[width-1:0] in,
  output wire [width-1:0] out
);

genvar i;
generate
  for (i = 0; i < width; i = i + 1) begin
    Not Not(.in(in[i]), .out(out[i]));
  end
endgenerate

endmodule
