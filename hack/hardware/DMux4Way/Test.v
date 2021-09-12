`timescale 1ns/1ns

module Test;
  reg in;
  reg [1:0] sel;
  wire a, b, c, d;

  DMux4Way DMux4Way(.in(in), .sel(sel), .a(a), .b(b), .c(c), .d(d));

  parameter step = 100;
  initial begin
    $dumpvars;
    in <= 0;
    sel <= 2'b00;
    #step

    sel <= 2'b01;
    #step

    sel <= 2'b10;
    #step

    sel <= 2'b11;
    #step

    in <= 1;
    sel <= 2'b00;
    #step

    sel <= 2'b01;
    #step

    sel <= 2'b10;
    #step

    sel <= 2'b11;
    #step
    $finish;
  end

  integer fd;
  integer t;
  initial begin
    fd = $fopen("output.txt", "w");
    for (t = step; t <= step * 8; t += step) begin
      #step;
      $fdisplay(fd, "%b %b %b %b %b %b", in, sel, a, b, c, d);
    end
    $finish;
  end
endmodule
