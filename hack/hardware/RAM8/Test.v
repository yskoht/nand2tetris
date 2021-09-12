`timescale 1ns/1ns

module Test;
  reg clk, load;
  reg [15:0] in;
  reg [2:0] address;
  wire [15:0] out;

  RAM8 RAM8(.clk(clk), .load(load), .in(in), .address(address), .out(out));

  parameter step = 100;

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
    in <= 0; load <= 0; address <= 0; #step;
    load <= 1; #step;
    in <= 11111; load <= 0; #step;
    load <= 1; address <= 1; #step;
    load <= 0; address <= 0; #step;
    in <= 3333; address <= 3; #step;
    load <= 1; #step;
    load <= 0; #step;
    address <= 1; #step;
    in <= 7777; #step;
    load <= 1; #step;
    address <= 7; #step;
    load <= 0; #step;
    address <= 3; #step;
    address <= 7; #step;

    load <= 0;
    for (i = 0; i < 8; i += 1) begin
      address <= i;
      #step;
    end

    load <= 1;
    in <= 16'b0101010101010101;
    for (i = 0; i < 8; i += 1) begin
      address <= i;
      #step;
    end

    load <= 0;
    for (i = 0; i < 8; i += 1) begin
      address <= i;
      #step;
    end

    load <= 1;
    address <= 0;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    for (i = 0; i < 8; i += 1) begin
      address <= i;
      #step;
    end

    load <= 1;
    address <= 0;
    in <= 16'b0101010101010101;
    #step;

    address <= 1;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    for (i = 0; i < 8; i += 1) begin
      address <= i;
      #step;
    end

    load <= 1;
    address <= 1;
    in <= 16'b0101010101010101;
    #step;

    address <= 2;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    for (i = 0; i < 8; i += 1) begin
      address <= i;
      #step;
    end

    load <= 1;
    address <= 2;
    in <= 16'b0101010101010101;
    #step;

    address <= 3;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    for (i = 0; i < 8; i += 1) begin
      address <= i;
      #step;
    end
    #step;

    load <= 1;
    address <= 3;
    in <= 16'b0101010101010101;
    #step;

    address <= 4;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    for (i = 0; i < 8; i += 1) begin
      address <= i;
      #step;
    end

    load <= 1;
    address <= 4;
    in <= 16'b0101010101010101;
    #step;

    address <= 5;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    for (i = 0; i < 8; i += 1) begin
      address <= i;
      #step;
    end

    load <= 1;
    address <= 5;
    in <= 16'b0101010101010101;
    #step;

    address <= 6;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    for (i = 0; i < 8; i += 1) begin
      address <= i;
      #step;
    end

    load <= 1;
    address <= 6;
    in <= 16'b0101010101010101;
    #step;

    address <= 7;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    for (i = 0; i < 8; i += 1) begin
      address <= i;
      #step;
    end

    load <= 1;
    address <= 7;
    in <= 16'b0101010101010101;
    #step;

    load <= 0;
    for (i = 0; i < 8; i += 1) begin
      address <= i;
      #step;
    end
    $finish;
  end

  integer fd;
  integer t;
  initial begin
    fd = $fopen("output.txt", "w");
    for (t = step; t <= step * 127; t += step) begin
      #step;
      $fdisplay(fd, "%b %b %b %b", in, load, address, out);
    end
    $finish;
  end
endmodule
