// a ^ b
// = (!a & b) + (a & !b)
// = !!(!a & b) + !!(a & !b)
// = !(!(!a & b) & !(a & !b))

module Xor (
  input wire a, b,
  output wire out
);

wire na, nb;
wire p, q;

Not Not1(.in(a), .out(na));
Not Not2(.in(b), .out(nb));

Nand Nand1(.a(na), .b(b), .out(p));
Nand Nand2(.a(a), .b(nb), .out(q));

Nand Nand(.a(p), .b(q), .out(out));

endmodule
