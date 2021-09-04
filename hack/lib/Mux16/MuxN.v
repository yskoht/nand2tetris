module MuxN #(
  parameter width = 16
) (
  input wire[width-1:0] a, b,
  input wire sel,
  output wire [width-1:0] out
);

genvar i;
generate
  for (i = 0; i < width; i = i + 1) begin
    Mux Mux(.a(a[i]), .b(b[i]), .sel(sel), .out(out[i]));
  end
endgenerate

endmodule
