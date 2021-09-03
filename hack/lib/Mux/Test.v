`timescale 1ns/1ns

module Test;
  reg a, b, sel;
  wire out;

  Mux Mux(.a(a), .b(b), .sel(sel), .out(out));

  parameter step = 100;
  initial begin
    $dumpvars;
    a <= 0; b <= 0; sel <= 0;
    #step

    a <= 0; b <= 0; sel <= 1;
    #step

    a <= 0; b <= 1; sel <= 0;
    #step

    a <= 0; b <= 1; sel <= 1;
    #step

    a <= 1; b <= 0; sel <= 0;
    #step

    a <= 1; b <= 0; sel <= 1;
    #step

    a <= 1; b <= 1; sel <= 0;
    #step

    a <= 1; b <= 1; sel <= 1;
    #step
    $finish;
  end

  integer fd;
  integer t;
  initial begin
    fd = $fopen("output.txt", "w");
    for (t = step; t <= step * 8; t += step) begin
      #step;
      $fdisplay(fd, "%b %b %b %b", a, b, sel, out);
    end
    $finish;
  end
endmodule
