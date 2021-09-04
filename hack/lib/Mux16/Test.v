`timescale 1ns/1ns

module Test;
  reg [15:0] a, b;
  reg sel;
  wire [15:0] out;

  Mux16 Mux16(.a(a), .b(b), .sel(sel), .out(out));

  parameter step = 100;
  initial begin
    $dumpvars;
    a <= 16'b0000_0000_0000_0000;
    b <= 16'b0000_0000_0000_0000;
    sel = 0;
    #step

    sel <= 1;
    #step

    a <= 16'b0000_0000_0000_0000;
    b <= 16'b0001_0010_0011_0100;
    sel <= 0;
    #step

    sel <= 1;
    #step

    a <= 16'b1001_1000_0111_0110;
    b <= 16'b0000_0000_0000_0000;
    sel <= 0;
    #step

    sel <= 1;
    #step

    a <= 16'b1010_1010_1010_1010;
    b <= 16'b0101_0101_0101_0101;
    sel <= 0;
    #step

    sel <= 1;
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


