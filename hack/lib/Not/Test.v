`timescale 1ns/1ns

module Test;
  reg in;
  wire out;

  Not Not(.in(in), .out(out));

  parameter step = 100;
  initial begin
    $dumpvars;
    in <= 0;
    #step

    in <= 1;
    #step
    $finish;
  end

  integer fd;
  integer t;
  initial begin
    fd = $fopen("output.txt", "w");
    for (t = step; t <= step * 2; t += step) begin
      #step;
      $fdisplay(fd, "%b %b", in, out);
    end
    $finish;
  end
endmodule
