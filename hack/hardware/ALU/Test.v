`timescale 1ns/1ns

module Test;
  reg [15:0] x, y;
  reg zx, nx, zy, ny, f, no;
  wire [15:0] out;
  wire zr, ng;

  ALU ALU(
    .x(x),
    .y(y),
    .zx(zx),
    .nx(nx),
    .zy(zy),
    .ny(ny),
    .f(f),
    .no(no),
    .out(out),
    .zr(zr),
    .ng(ng)
  );

  parameter step = 100;
  initial begin
    $dumpvars;
    x <= 16'b0000_0000_0000_0000;  // x = 0
    y <= 16'b1111_1111_1111_1111;  // y = -1

    // Compute 0
    zx <= 1; nx <= 0; zy <= 1; ny <= 0; f <= 1; no <= 0;
    #step

    // Compute 1
    zx <= 1; nx <= 1; zy <= 1; ny <= 1; f <= 1; no <= 1;
    #step

    // Compute -1
    zx <= 1; nx <= 1; zy <= 1; ny <= 0; f <= 1; no <= 0;
    #step

    // Compute x
    zx <= 0; nx <= 0; zy <= 1; ny <= 1; f <= 0; no <= 0;
    #step

    // Compute y
    zx <= 1; nx <= 1; zy <= 0; ny <= 0; f <= 0; no <= 0;
    #step

    // Compute !x
    zx <= 0; nx <= 0; zy <= 1; ny <= 1; f <= 0; no <= 1;
    #step

    // Compute !y
    zx <= 1; nx <= 1; zy <= 0; ny <= 0; f <= 0; no <= 1;
    #step

    // Compute -x
    zx <= 0; nx <= 0; zy <= 1; ny <= 1; f <= 1; no <= 1;
    #step

    // Compute -y
    zx <= 1; nx <= 1; zy <= 0; ny <= 0; f <= 1; no <= 1;
    #step

    // Compute x + 1
    zx <= 0; nx <= 1; zy <= 1; ny <= 1; f <= 1; no <= 1;
    #step

    // Compute y + 1
    zx <= 1; nx <= 1; zy <= 0; ny <= 1; f <= 1; no <= 1;
    #step

    // Compute x - 1
    zx <= 0; nx <= 0; zy <= 1; ny <= 1; f <= 1; no <= 0;
    #step

    // Compute y - 1
    zx <= 1; nx <= 1; zy <= 0; ny <= 0; f <= 1; no <= 0;
    #step

    // Compute x + y
    zx <= 0; nx <= 0; zy <= 0; ny <= 0; f <= 1; no <= 0;
    #step

    // Compute x - y
    zx <= 0; nx <= 1; zy <= 0; ny <= 0; f <= 1; no <= 1;
    #step

    // Compute y - x
    zx <= 0; nx <= 0; zy <= 0; ny <= 1; f <= 1; no <= 1;
    #step

    // Compute x & y
    zx <= 0; nx <= 0; zy <= 0; ny <= 0; f <= 0; no <= 0;
    #step

    // Compute x | y
    zx <= 0; nx <= 1; zy <= 0; ny <= 1; f <= 0; no <= 1;
    #step

    x <= 16'b0000_0000_0001_0001;  // x = 17
    y <= 16'b0000_0000_0000_0011;  // y =  3

    // Compute 0
    zx <= 1; nx <= 0; zy <= 1; ny <= 0; f <= 1; no <= 0;
    #step

    // Compute 1
    zx <= 1; nx <= 1; zy <= 1; ny <= 1; f <= 1; no <= 1;
    #step

    // Compute -1
    zx <= 1; nx <= 1; zy <= 1; ny <= 0; f <= 1; no <= 0;
    #step

    // Compute x
    zx <= 0; nx <= 0; zy <= 1; ny <= 1; f <= 0; no <= 0;
    #step

    // Compute y
    zx <= 1; nx <= 1; zy <= 0; ny <= 0; f <= 0; no <= 0;
    #step

    // Compute !x
    zx <= 0; nx <= 0; zy <= 1; ny <= 1; f <= 0; no <= 1;
    #step

    // Compute !y
    zx <= 1; nx <= 1; zy <= 0; ny <= 0; f <= 0; no <= 1;
    #step

    // Compute -x
    zx <= 0; nx <= 0; zy <= 1; ny <= 1; f <= 1; no <= 1;
    #step

    // Compute -y
    zx <= 1; nx <= 1; zy <= 0; ny <= 0; f <= 1; no <= 1;
    #step

    // Compute x + 1
    zx <= 0; nx <= 1; zy <= 1; ny <= 1; f <= 1; no <= 1;
    #step

    // Compute y + 1
    zx <= 1; nx <= 1; zy <= 0; ny <= 1; f <= 1; no <= 1;
    #step

    // Compute x - 1
    zx <= 0; nx <= 0; zy <= 1; ny <= 1; f <= 1; no <= 0;
    #step

    // Compute y - 1
    zx <= 1; nx <= 1; zy <= 0; ny <= 0; f <= 1; no <= 0;
    #step

    // Compute x + y
    zx <= 0; nx <= 0; zy <= 0; ny <= 0; f <= 1; no <= 0;
    #step

    // Compute x - y
    zx <= 0; nx <= 1; zy <= 0; ny <= 0; f <= 1; no <= 1;
    #step

    // Compute y - x
    zx <= 0; nx <= 0; zy <= 0; ny <= 1; f <= 1; no <= 1;
    #step

    // Compute x & y
    zx <= 0; nx <= 0; zy <= 0; ny <= 0; f <= 0; no <= 0;
    #step

    // Compute x | y
    zx <= 0; nx <= 1; zy <= 0; ny <= 1; f <= 0; no <= 1;
    #step
    $finish;
  end

  integer fd;
  integer t;
  initial begin
    fd = $fopen("output.txt", "w");
    for (t = step; t <= step * 36; t += step) begin
      #step;
      $fdisplay(fd, "%b %b %b %b %b %b %b %b %b %b %b", x, y, zx, nx, zy, ny, f, no, out, zr, ng);
    end
    $finish;
  end
endmodule
