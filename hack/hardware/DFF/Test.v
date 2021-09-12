`timescale 1ns/1ns

module Test;
  reg clk;
  reg in;
  wire out;

  DFF DFF( .clk(clk), .in(in), .out(out));

  parameter step = 100;

  initial begin
    clk <= 1;
  end

  always begin
    #(step/2)
    clk = ~clk;
  end

  initial begin
    $dumpvars;
    in <= 0;
    #step

    in <= 1;
    #step

    in <= 1;
    #step

    in <= 1;
    #step

    in <= 0;
    #step

    in <= 0;
    #step

    in <= 1;
    #step

    in <= 0;
    #step

    in <= 1;
    #step

    in <= 0;
    #step
    $finish;
  end

  integer fd;
  integer t;
  initial begin
    fd = $fopen("output.txt", "w");
    for (t = step; t <= step * 10; t += step) begin
      #step;
      $fdisplay(fd, "%b %b", in, out);
    end
    $finish;
  end
endmodule
