`timescale 1ns/1ns

module Test;
  reg clk, load;
  reg [15:0] in;
  wire [15:0] out;

  Register Register(.clk(clk), .in(in), .load(load), .out(out));

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
    in <= 0; load <= 0; #step;
    in <= 0; load <= 1; #step;
    in <= -32123; load <= 0; #step;
    in <= 11111; load <= 0; #step;
    in <= -32123; load <= 1; #step;
    in <= -32123; load <= 1; #step;
    in <= -32123; load <= 0; #step;
    in <= 12345; load <= 1; #step;
    in <= 0; load <= 0; #step;
    in <= 0; load <= 1; #step;
    in <= 16'b0000000000000001; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b0000000000000010; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b0000000000000100; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b0000000000001000; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b0000000000010000; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b0000000000100000; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b0000000001000000; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b0000000010000000; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b0000000100000000; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b0000001000000000; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b0000010000000000; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b0000100000000000; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b0001000000000000; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b0010000000000000; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b0100000000000000; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b1000000000000000; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b1111111111111110; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b1111111111111101; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b1111111111111011; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b1111111111110111; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b1111111111101111; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b1111111111011111; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b1111111110111111; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b1111111101111111; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b1111111011111111; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b1111110111111111; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b1111101111111111; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b1111011111111111; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b1110111111111111; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b1101111111111111; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b1011111111111111; load <= 0; #step;
    load <= 1; #step;
    in <= 16'b0111111111111111; load <= 0; #step;
    load <= 1; #step;
    $finish;
  end

  integer fd;
  integer t;
  initial begin
    fd = $fopen("output.txt", "w");
    for (t = step; t <= step * 107; t += step) begin
      #step;
      $fdisplay(fd, "%b %b %b", in, load, out);
    end
    $finish;
  end
endmodule
