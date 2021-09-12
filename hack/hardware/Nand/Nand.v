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
    2'b0x: nand_gate = 1'b1;
    2'bx0: nand_gate = 1'b1;
    2'b1x: nand_gate = 1'bx;
    2'bx1: nand_gate = 1'bx;
    2'bxx: nand_gate = 1'bx;
    default: nand_gate = 1'bx;
  endcase
end
endfunction

assign out = nand_gate(a, b);

endmodule
