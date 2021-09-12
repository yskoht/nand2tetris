module AddN #(
  parameter width = 16
) (
  input wire [width-1:0] a, b,
  output wire [width-1:0] out
);

// width + 1
wire [width:0] t;
assign t[0] = 0;

genvar i;
generate
  for (i = 0; i < width; i = i + 1) begin
    FullAdder FullAdder(.a(a[i]), .b(b[i]), .c(t[i]), .sum(out[i]), .carry(t[i+1]));
  end
endgenerate

endmodule
