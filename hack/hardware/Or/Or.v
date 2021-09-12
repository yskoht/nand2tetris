// a | b
// = !(!a & !b)

module Or (
  input wire a, b,
  output wire out
);

wire na, nb;

Not Not1(.in(a), .out(na));
Not Not2(.in(b), .out(nb));
Nand Nand(.a(na), .b(nb), .out(out));

endmodule
