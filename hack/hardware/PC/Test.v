`timescale 1ns/1ns

module Test;
  reg clk, load, inc, reset;
  reg [15:0] in;
  wire [15:0] out;

  PC PC(
    .clk(clk),
    .load(load),
    .inc(inc),
    .reset(reset),
    .in(in),
    .out(out)
  );

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
    reset <= 0;
    load <= 0;
    inc <= 0;
    #step;

    #step;

    inc <= 1;
    #step;

    #step;

    in <= -32123;
    #step;

    #step;

    load <= 1;
    #step;

    #step;

    load <= 0;
    #step;

    #step;

    #step;

    #step;

    in <= 12345;
    load <= 1;
    inc <= 0;
    #step;

    #step;

    reset <= 1;
    #step;

    #step;

    reset <= 0;
    inc <= 1;
    #step;

    #step;

    reset <= 1;
    #step;

    #step;

    reset <= 0;
    load <= 0;
    #step;

    #step;

    reset <= 1;
    #step;

    #step;

    in <= 0;
    reset <= 0;
    load <= 1;
    #step;

    #step;

    load <= 0;
    inc <= 1;
    #step;

    #step;

    in <= 22222;
    reset <= 1;
    inc <= 0;
    #step;

    #step;

    $finish;
  end

  integer fd;
  integer t;
  initial begin
    fd = $fopen("output.txt", "w");
    for (t = step; t <= step * 30; t += step) begin
      #step;
      $fdisplay(fd, "%b %b %b %b %b", in, reset, load, inc, out);
    end
    $finish;
  end
endmodule
