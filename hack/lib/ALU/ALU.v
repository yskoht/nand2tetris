module ALU (
  input wire [15:0] x, y,
  input wire zx, nx, zy, ny, f, no,
  output wire [15:0] out,
  output wire zr, ng
);

ALUN #(.width(16)) ALUN(
  .x(x),
  .y(y),
  .zx(zx),
  .nx(nx),
  .zy(zy),
  .ny(ny),
  .f(f),
  .no(no),
  .out(out),
  .zr(zr),
  .ng(ng)
);

endmodule
