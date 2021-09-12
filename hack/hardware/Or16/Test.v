`timescale 1ns/1ns

module Test;
  reg [15:0] a, b;
  wire [15:0] out;

  Or16 Or16(.a(a), .b(b), .out(out));

  parameter step = 100;
  initial begin
    $dumpvars;
    a <= 16'b0000_0000_0000_0000;
    b <= 16'b0000_0000_0000_0000;
    #step

    a <= 16'b0000_0000_0000_0000;
    b <= 16'b1111_1111_1111_1111;
    #step

    a <= 16'b1111_1111_1111_1111;
    b <= 16'b1111_1111_1111_1111;
    #step

    a <= 16'b1010_1010_1010_1010;
    b <= 16'b0101_0101_0101_0101;
    #step

    a <= 16'b0011_1100_1100_0011;
    b <= 16'b0000_1111_1111_0000;
    #step

    a <= 16'b0001_0010_0011_0100;
    b <= 16'b1001_1000_0111_0110;
    #step
    $finish;
  end

  integer fd;
  integer t;
  initial begin
    fd = $fopen("output.txt", "w");
    for (t = step; t <= step * 6; t += step) begin
      #step;
      $fdisplay(fd, "%b %b %b", a, b, out);
    end
    $finish;
  end
endmodule
