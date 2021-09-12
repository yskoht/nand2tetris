`timescale 1ns/1ns

module Test;
  reg in, sel;
  wire a, b;

  DMux DMux(.in(in), .sel(sel), .a(a), .b(b));

  parameter step = 100;
  initial begin
    $dumpvars;
    in <= 0; sel <= 0;
    #step

    in <= 0; sel <= 1;
    #step

    in <= 1; sel <= 0;
    #step

    in <= 1; sel <= 1;
    #step
    $finish;
  end

  integer fd;
  integer t;
  initial begin
    fd = $fopen("output.txt", "w");
    for (t = step; t <= step * 4; t += step) begin
      #step;
      $fdisplay(fd, "%b %b %b %b", in, sel, a, b);
    end
    $finish;
  end
endmodule
