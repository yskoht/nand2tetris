module Nand (
  input wire a, b,
  output wire out
);

function nand_gate (
  input a, b
);
begin
  case ({a, b})
    2'b00: nand_gate = 1'b1;
    2'b01: nand_gate = 1'b1;
    2'b10: nand_gate = 1'b1;
    2'b11: nand_gate = 1'b0;
    default: nand_gate = 1'bx;
  endcase
end
endfunction

assign out = nand_gate(a, b);

endmodule
