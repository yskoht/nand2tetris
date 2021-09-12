module DMux (
  input wire in, sel,
  output wire a, b
);

wire nsel;

Not Not(.in(sel), .out(nsel));
And And1(.a(in), .b(nsel), .out(a));
And And2(.a(in), .b(sel), .out(b));

endmodule
