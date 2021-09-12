module FullAdder (
  input wire a, b, c,
  output wire sum, carry
);

wire t1, t2, t3;

HalfAdder HalfAdder1(.a(a), .b(b), .sum(t1), .carry(t2));
HalfAdder HalfAdder2(.a(t1), .b(c), .sum(sum), .carry(t3));
Or Or(.a(t2), .b(t3), .out(carry));

endmodule
