`timescale 1ns/1ns

module Test;
  reg a, b, c;
  wire sum, carry;

  FullAdder FullAdder(.a(a), .b(b), .c(c), .sum(sum), .carry(carry));

  parameter step = 100;
  initial begin
    $dumpvars;
    a <= 0;
    b <= 0;
    c <= 0;
    #step

    c <= 1;
    #step

    b <= 1;
    c <= 0;
    #step

    c <= 1;
    #step

    a <= 1;
    b <= 0;
    c <= 0;
    #step

    c <= 1;
    #step

    b <= 1;
    c <= 0;
    #step

    c <= 1;
    #step
    $finish;
  end

  integer fd;
  integer t;
  initial begin
    fd = $fopen("output.txt", "w");
    for (t = step; t <= step * 8; t += step) begin
      #step;
      $fdisplay(fd, "%b %b %b %b %b", a, b, c, sum, carry);
    end
    $finish;
  end
endmodule
