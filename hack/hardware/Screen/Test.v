`timescale 1ns/1ns

module Test;
  reg clk, load;
  reg [15:0] in;
  reg [12:0] address;
  wire [15:0] out;

  wire vga_clk;
  reg clk_rst, rst;
  wire [3:0] vga_r, vga_g, vga_b;
  wire vga_hs, vga_vs;

  ClockGen ClockGen(
    .clk(clk),
    .clk_rst(clk_rst),
    .main_clk(),
    .vga_clk(vga_clk)
  );

  Screen Screen(
    .clk(clk),
    .load(load),
    .in(in),
    .address(address),
    .out(out),

    .vga_clk(vga_clk),
    .vga_rst(rst),
    .vga_r(vga_r),
    .vga_g(vga_g),
    .vga_b(vga_b),
    .vga_hs(vga_hs),
    .vga_vs(vga_vs)
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
    rst <= 1;
    #step
    #step

    clk_rst <= 0;
    #step

    for (t = step; t <= step * 100; t += step) begin
      #step;
    end

    rst <= 0;

    in <= 16'h5050;
    address <= 0;
    load <= 1;
    #step
    #step

    in <= 16'h0505;
    address <= 1;
    load <= 1;
    #step
    #step

    load <= 0;
    #step

    for (t = step; t <= step * 2000000; t += step) begin
      #step;
    end
    $finish;
  end

endmodule
