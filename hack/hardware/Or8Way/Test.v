`timescale 1ns/1ns

module Test;
  reg [7:0] in;
  wire out;

  Or8Way Or8Way(.in(in), .out(out));

  parameter step = 100;
  initial begin
    $dumpvars;
    in <= 8'b0000_0000;
    #step

    in <= 8'b1111_1111;
    #step

    in <= 8'b0001_0000;
    #step

    in <= 8'b0000_0001;
    #step

    in <= 8'b0010_0110;
    #step
    $finish;
  end

  integer fd;
  integer t;
  initial begin
    fd = $fopen("output.txt", "w");
    for (t = step; t <= step * 5; t += step) begin
      #step;
      $fdisplay(fd, "%b %b", in, out);
    end
    $finish;
  end
endmodule
