`timescale 1ns/1ns

module Test;
  reg [15:0] in;
  wire [15:0] out;

  Inc16 Inc6(.in(in), .out(out));

  parameter step = 100;
  initial begin
    $dumpvars;
    in <= 16'b0000_0000_0000_0000;
    #step

    in <= 16'b1111_1111_1111_1111;
    #step

    in <= 16'b0000_0000_0000_0101;
    #step

    in <= 16'b1111_1111_1111_1011;
    #step
    $finish;
  end

  integer fd;
  integer t;
  initial begin
    fd = $fopen("output.txt", "w");
    for (t = step; t <= step * 4; t += step) begin
      #step;
      $fdisplay(fd, "%b %b", in, out);
    end
    $finish;
  end
endmodule
