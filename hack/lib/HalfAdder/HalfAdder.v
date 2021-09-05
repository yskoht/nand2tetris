module HalfAdder (
  input wire a, b,
  output wire sum, carry
);

Xor Xor(.a(a), .b(b), .out(sum));
And And(.a(a), .b(b), .out(carry));

endmodule
