`timescale 1ns/1ns

module Test;
  reg in;
  reg [2:0] sel;
  wire a, b, c, d, e, f, g, h;

  DMux8Way DMux8Way(.in(in), .sel(sel), .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .h(h));

  parameter step = 100;
  initial begin
    $dumpvars;
    in <= 0;
    sel <= 3'b000;
    #step

    sel <= 3'b001;
    #step

    sel <= 3'b010;
    #step

    sel <= 3'b011;
    #step

    sel <= 3'b100;
    #step

    sel <= 3'b101;
    #step

    sel <= 3'b110;
    #step

    sel <= 3'b111;
    #step

    in <= 1;
    sel <= 3'b000;
    #step

    sel <= 3'b001;
    #step

    sel <= 3'b010;
    #step

    sel <= 3'b011;
    #step

    sel <= 3'b100;
    #step

    sel <= 3'b101;
    #step

    sel <= 3'b110;
    #step

    sel <= 3'b111;
    #step
    $finish;
  end

  integer fd;
  integer t;
  initial begin
    fd = $fopen("output.txt", "w");
    for (t = step; t <= step * 16; t += step) begin
      #step;
      $fdisplay(fd, "%b %b %b %b %b %b %b %b %b %b", in, sel, a, b, c, d, e, f, g, h);
    end
    $finish;
  end
endmodule
