`timescale 1ns/1ns

module Test;
  localparam step = 100;

  localparam width = 16;
  localparam k = 3;
  localparam size = 2**k;

  reg clk, load;
  reg [width-1:0] in;
  reg [k-1:0] address1;
  wire [width-1:0] out1;
  reg [k-1:0] address2;
  wire [width-1:0] out2;

  RAMp2 #(.width(width), .k(k)) RAMp2(
    .clk(clk),
    .load(load),
    .in(in),
    .address1(address1),
    .out1(out1),
    .address2(address2),
    .out2(out2)
  );

  initial begin
    clk <= 1;
  end

  always begin
    #(step/2)
    clk = ~clk;
  end

  integer i;
  initial begin
    $dumpvars;
    for (i = 0; i < size; i += 1) begin
      address1 <= i;
      address2 <= i - 1;
      load <= 0;
      in <= i;
      #step;

      load <= 1;
      #step;

      load <= 0;
      #step;
    end

    load <= 1;
    for (i = 0; i < size; i += 1) begin
      address1 <= i;
      address2 <= i + 1;
      in <= i;
      #step;
    end

    $finish;
  end

  integer fd;
  integer t;
  initial begin
    fd = $fopen("output.txt", "w");
    for (t = step; t <= step * (size * 3 + size); t += step) begin
      #step;
      $fdisplay(fd, "%b %b %b %b %b %b", in, load, address1, out1, address2, out2);
    end
    $finish;
  end
endmodule
