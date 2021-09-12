module DMux8Way (
  input wire in,
  input wire [2:0] sel,
  output wire a, b, c, d, e, f, g, h
);

wire ae, bf, cg, dh;

DMux4Way DMux4Way(.in(in), .sel(sel[1:0]), .a(ae), .b(bf), .c(cg), .d(dh));

DMux DMux1(.in(ae), .sel(sel[2]), .a(a), .b(e));
DMux DMux2(.in(bf), .sel(sel[2]), .a(b), .b(f));
DMux DMux3(.in(cg), .sel(sel[2]), .a(c), .b(g));
DMux DMux4(.in(dh), .sel(sel[2]), .a(d), .b(h));

endmodule
