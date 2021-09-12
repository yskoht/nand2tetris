`timescale 1ns/1ns

module Test;
  reg clk, load;
  reg [15:0] in;
  reg [5:0] address;
  wire [15:0] out;

  RAM64 RAM64(.clk(clk), .load(load), .in(in), .address(address), .out(out));

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

    in <= 0; load <= 0; address <= 0; #step;
    load <= 1; #step;
    in <= 1313; load <= 0; #step;
    load <= 1; address <= 13; #step;
    load <= 0; address <= 0; #step;
    in <= 4747; address <= 47; #step;
    load <= 1; #step;
    load <= 0; #step;
    address <= 13; #step;
    in <= 6363; #step;
    load <= 1; address <= 63; #step;
    load <= 0; #step;
    address <= 47; #step;
    address <= 63; #step;

    load <= 0;
    address <= 16'b101000;
    #step;
    address <= 16'b101001;
    #step;
    address <= 16'b101010;
    #step;
    address <= 16'b101011;
    #step;
    address <= 16'b101100;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b101110;
    #step;
    address <= 16'b101111;
    #step;

    load <= 1;
    in <= 16'b0101010101010101;
    address <= 16'b101000;
    #step;
    address <= 16'b101001;
    #step;
    address <= 16'b101010;
    #step;
    address <= 16'b101011;
    #step;
    address <= 16'b101100;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b101110;
    #step;
    address <= 16'b101111;
    #step;

    load <= 0;
    address <= 16'b101000;
    #step;
    address <= 16'b101001;
    #step;
    address <= 16'b101010;
    #step;
    address <= 16'b101011;
    #step;
    address <= 16'b101100;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b101110;
    #step;
    address <= 16'b101111;
    #step;

    load <= 1;
    address <= 16'b101000;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    address <= 16'b101000;
    #step;
    address <= 16'b101001;
    #step;
    address <= 16'b101010;
    #step;
    address <= 16'b101011;
    #step;
    address <= 16'b101100;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b101110;
    #step;
    address <= 16'b101111;
    #step;

    load <= 1;
    address <= 16'b101000;
    in <= 16'b0101010101010101;
    #step;
    address <= 16'b101001;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    address <= 16'b101000;
    #step;
    address <= 16'b101001;
    #step;
    address <= 16'b101010;
    #step;
    address <= 16'b101011;
    #step;
    address <= 16'b101100;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b101110;
    #step;
    address <= 16'b101111;
    #step;

    load <= 1;
    address <= 16'b101001;
    in <= 16'b0101010101010101;
    #step;
    address <= 16'b101010;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    address <= 16'b101000;
    #step;
    address <= 16'b101001;
    #step;
    address <= 16'b101010;
    #step;
    address <= 16'b101011;
    #step;
    address <= 16'b101100;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b101110;
    #step;
    address <= 16'b101111;
    #step;

    load <= 1;
    address <= 16'b101010;
    in <= 16'b0101010101010101;
    #step;
    address <= 16'b101011;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    address <= 16'b101000;
    #step;
    address <= 16'b101001;
    #step;
    address <= 16'b101010;
    #step;
    address <= 16'b101011;
    #step;
    address <= 16'b101100;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b101110;
    #step;
    address <= 16'b101111;
    #step;

    load <= 1;
    address <= 16'b101011;
    in <= 16'b0101010101010101;
    #step;
    address <= 16'b101100;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    address <= 16'b101000;
    #step;
    address <= 16'b101001;
    #step;
    address <= 16'b101010;
    #step;
    address <= 16'b101011;
    #step;
    address <= 16'b101100;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b101110;
    #step;
    address <= 16'b101111;
    #step;

    load <= 1;
    address <= 16'b101100;
    in <= 16'b0101010101010101;
    #step;
    address <= 16'b101101;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    address <= 16'b101000;
    #step;
    address <= 16'b101001;
    #step;
    address <= 16'b101010;
    #step;
    address <= 16'b101011;
    #step;
    address <= 16'b101100;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b101110;
    #step;
    address <= 16'b101111;
    #step;

    load <= 1;
    address <= 16'b101101;
    in <= 16'b0101010101010101;
    #step;
    address <= 16'b101110;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    address <= 16'b101000;
    #step;
    address <= 16'b101001;
    #step;
    address <= 16'b101010;
    #step;
    address <= 16'b101011;
    #step;
    address <= 16'b101100;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b101110;
    #step;
    address <= 16'b101111;
    #step;

    load <= 1;
    address <= 16'b101110;
    in <= 16'b0101010101010101;
    #step;
    address <= 16'b101111;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    address <= 16'b101000;
    #step;
    address <= 16'b101001;
    #step;
    address <= 16'b101010;
    #step;
    address <= 16'b101011;
    #step;
    address <= 16'b101100;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b101110;
    #step;
    address <= 16'b101111;
    #step;

    load <= 1;
    address <= 16'b101111;
    in <= 16'b0101010101010101;
    #step;

    load <= 0;
    address <= 16'b101000;
    #step;
    address <= 16'b101001;
    #step;
    address <= 16'b101010;
    #step;
    address <= 16'b101011;
    #step;
    address <= 16'b101100;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b101110;
    #step;
    address <= 16'b101111;
    #step;


    load <= 0;
    address <= 16'b000101;
    #step;
    address <= 16'b001101;
    #step;
    address <= 16'b010101;
    #step;
    address <= 16'b011101;
    #step;
    address <= 16'b100101;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b110101;
    #step;
    address <= 16'b111101;
    #step;

    load <= 1;
    in <= 16'b0101010101010101;
    address <= 16'b000101;
    #step;
    address <= 16'b001101;
    #step;
    address <= 16'b010101;
    #step;
    address <= 16'b011101;
    #step;
    address <= 16'b100101;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b110101;
    #step;
    address <= 16'b111101;
    #step;

    load <= 0;
    address <= 16'b000101;
    #step;
    address <= 16'b001101;
    #step;
    address <= 16'b010101;
    #step;
    address <= 16'b011101;
    #step;
    address <= 16'b100101;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b110101;
    #step;
    address <= 16'b111101;
    #step;

    load <= 1;
    address <= 16'b000101;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    address <= 16'b000101;
    #step;
    address <= 16'b001101;
    #step;
    address <= 16'b010101;
    #step;
    address <= 16'b011101;
    #step;
    address <= 16'b100101;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b110101;
    #step;
    address <= 16'b111101;
    #step;

    load <= 1;
    address <= 16'b000101;
    in <= 16'b0101010101010101;
    #step;
    address <= 16'b001101;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    address <= 16'b000101;
    #step;
    address <= 16'b001101;
    #step;
    address <= 16'b010101;
    #step;
    address <= 16'b011101;
    #step;
    address <= 16'b100101;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b110101;
    #step;
    address <= 16'b111101;
    #step;

    load <= 1;
    address <= 16'b001101;
    in <= 16'b0101010101010101;
    #step;
    address <= 16'b010101;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    address <= 16'b000101;
    #step;
    address <= 16'b001101;
    #step;
    address <= 16'b010101;
    #step;
    address <= 16'b011101;
    #step;
    address <= 16'b100101;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b110101;
    #step;
    address <= 16'b111101;
    #step;

    load <= 1;
    address <= 16'b010101;
    in <= 16'b0101010101010101;
    #step;
    address <= 16'b011101;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    address <= 16'b000101;
    #step;
    address <= 16'b001101;
    #step;
    address <= 16'b010101;
    #step;
    address <= 16'b011101;
    #step;
    address <= 16'b100101;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b110101;
    #step;
    address <= 16'b111101;
    #step;

    load <= 1;
    address <= 16'b011101;
    in <= 16'b0101010101010101;
    #step;
    address <= 16'b100101;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    address <= 16'b000101;
    #step;
    address <= 16'b001101;
    #step;
    address <= 16'b010101;
    #step;
    address <= 16'b011101;
    #step;
    address <= 16'b100101;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b110101;
    #step;
    address <= 16'b111101;
    #step;

    load <= 1;
    address <= 16'b100101;
    in <= 16'b0101010101010101;
    #step;
    address <= 16'b101101;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    address <= 16'b000101;
    #step;
    address <= 16'b001101;
    #step;
    address <= 16'b010101;
    #step;
    address <= 16'b011101;
    #step;
    address <= 16'b100101;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b110101;
    #step;
    address <= 16'b111101;
    #step;

    load <= 1;
    address <= 16'b101101;
    in <= 16'b0101010101010101;
    #step;
    address <= 16'b110101;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    address <= 16'b000101;
    #step;
    address <= 16'b001101;
    #step;
    address <= 16'b010101;
    #step;
    address <= 16'b011101;
    #step;
    address <= 16'b100101;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b110101;
    #step;
    address <= 16'b111101;
    #step;

    load <= 1;
    address <= 16'b110101;
    in <= 16'b0101010101010101;
    #step;
    address <= 16'b111101;
    in <= 16'b1010101010101010;
    #step;

    load <= 0;
    address <= 16'b000101;
    #step;
    address <= 16'b001101;
    #step;
    address <= 16'b010101;
    #step;
    address <= 16'b011101;
    #step;
    address <= 16'b100101;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b110101;
    #step;
    address <= 16'b111101;
    #step;

    load <= 1;
    address <= 16'b111101;
    in <= 16'b0101010101010101;
    #step;

    load <= 0;
    address <= 16'b000101;
    #step;
    address <= 16'b001101;
    #step;
    address <= 16'b010101;
    #step;
    address <= 16'b011101;
    #step;
    address <= 16'b100101;
    #step;
    address <= 16'b101101;
    #step;
    address <= 16'b110101;
    #step;
    address <= 16'b111101;
    #step;
    $finish;
  end

  integer fd;
  integer t;
  initial begin
    fd = $fopen("output.txt", "w");
    for (t = step; t <= step * 238; t += step) begin
      #step;
      $fdisplay(fd, "%b %b %b %b", in, load, address, out);
    end
    $finish;
  end
endmodule
