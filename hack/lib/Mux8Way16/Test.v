`timescale 1ns/1ns

module Test;
  reg [15:0] a, b, c, d, e, f, g, h;
  reg [2:0] sel;
  wire [15:0] out;

  Mux8Way16 Mux8Way16(.a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .h(h), .sel(sel), .out(out));

  parameter step = 100;
  initial begin
    $dumpvars;
    a <= 0;
    b <= 0;
    c <= 0;
    d <= 0;
    e <= 0;
    f <= 0;
    g <= 0;
    h <= 0;
    sel <= 0;
    #step

    sel <= 1;
    #step

    sel <= 2;
    #step

    sel <= 3;
    #step

    sel <= 4;
    #step

    sel <= 5;
    #step

    sel <= 6;
    #step

    sel <= 7;
    #step

    a <= 16'b0001_0010_0011_0100;
    b <= 16'b0010_0011_0100_0101;
    c <= 16'b0011_0100_0101_0110;
    d <= 16'b0100_0101_0110_0111;
    e <= 16'b0101_0110_0111_1000;
    f <= 16'b0110_0111_1000_1001;
    g <= 16'b0111_1000_1001_1010;
    h <= 16'b1000_1001_1010_1011;
    sel <= 0;
    #step

    sel <= 1;
    #step

    sel <= 2;
    #step

    sel <= 3;
    #step

    sel <= 4;
    #step

    sel <= 5;
    #step

    sel <= 6;
    #step

    sel <= 7;
    #step
    $finish;
  end

  integer fd;
  integer t;
  initial begin
    fd = $fopen("output.txt", "w");
    for (t = step; t <= step * 16; t += step) begin
      #step;
      $fdisplay(fd, "%b %b %b %b %b %b %b %b %b %b", a, b, c, d, e, f, g, h, sel, out);
    end
    $finish;
  end
endmodule
