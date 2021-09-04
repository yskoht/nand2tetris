module DMux4Way (
  input wire in,
  input wire [1:0] sel,
  output wire a, b, c, d
);

wire ac, bd;

DMux DMux1(.in(in), .sel(sel[0]), .a(ac), .b(bd));
DMux DMux2(.in(ac), .sel(sel[1]), .a(a), .b(c));
DMux DMux3(.in(bd), .sel(sel[1]), .a(b), .b(d));

endmodule
