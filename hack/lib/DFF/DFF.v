module DFF (
  input wire clk, in,
  output reg out
);

always @(posedge clk) begin
  out <= in;
end

endmodule
