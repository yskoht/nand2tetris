`timescale 1ns/1ns

module Test;
  reg a, b;
  wire sum, carry;

  HalfAdder HalfAdder(.a(a), .b(b), .sum(sum), .carry(carry));

  parameter step = 100;
  initial begin
    $dumpvars;
    a <= 0; b <= 0;
    #step

    a <= 0; b <= 1;
    #step

    a <= 1; b <= 0;
    #step

    a <= 1; b <= 1;
    #step
    $finish;
  end

  integer fd;
  integer t;
  initial begin
    fd = $fopen("output.txt", "w");
    for (t = step; t <= step * 5; t += step) begin
      #step;
      $fdisplay(fd, "%b %b %b %b", a, b, sum, carry);
    end
    $finish;
  end
endmodule
