// out
// = (!s & a) + (s & b)
// = !!(!s & a) + !!(s & b)
// = !(!(!s & a) & !(s & b))

module Mux (
  input wire a, b, sel,
  output wire out
);

wire nsel;
wire p, q;

Not Not1(.in(sel), .out(nsel));
Nand Nand1(.a(nsel), .b(a), .out(p));
Nand Nand2(.a(sel), .b(b), .out(q));
Nand Nand3(.a(p), .b(q), .out(out));

endmodule
