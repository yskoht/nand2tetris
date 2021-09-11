module RegisterN #(
  parameter width = 16
) (
  input wire clk, load,
  input wire [width-1:0] in,
  output wire [width-1:0] out
);

genvar i;
generate
  for (i = 0; i < width; i = i + 1) begin
    Bit Bit(.clk(clk), .in(in[i]), .load(load), .out(out[i]));
  end
endgenerate

endmodule
