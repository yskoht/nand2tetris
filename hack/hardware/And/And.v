module And (
  input wire a, b,
  output wire out
);

wire t;

Nand Nand(.a(a), .b(b), .out(t));
Not Not(.in(t), .out(out));

endmodule
