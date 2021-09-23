`timescale 1ns/1ns

module Test;
  reg clk, clk_rst;
  wire main_clk, vga_clk;

  ClockGen ClockGen(
    .clk(clk),
    .clk_rst(clk_rst),
    .main_clk(main_clk),
    .vga_clk(vga_clk)
  );

  parameter step = 8;

  initial begin
    clk <= 1;
  end

  always begin
    #(step/2)
    clk = ~clk;
  end

  integer t;
  initial begin
    $dumpvars;
    clk_rst <= 1;
    #step
    #step

    clk_rst <= 0;
    #step

    for (t = step; t <= step * 500; t += step) begin
      #step;
    end
    $finish;
  end

endmodule
