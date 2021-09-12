module RAM #(
  parameter width = 16,
  parameter k = 3 // k = log2(size)
) (
  input wire clk, load,
  input wire [width-1:0] in,
  input wire [k-1:0] address,
  output wire [width-1:0] out
);

reg [width-1:0] ram[2**k-1:0];

always @(posedge clk) begin
  if (load == 1'b1) begin
    ram[address] <= in;
  end
end

assign out = ram[address];

endmodule
