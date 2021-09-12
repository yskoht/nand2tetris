module Not (
  input wire in,
  output wire out
);

Nand Nand(.a(in), .b(in), .out(out));

endmodule
