module RAMp2 #(
  parameter width = 16,
  parameter k = 3 // k = log2(size)
) (
  input wire clk, load,
  input wire [width-1:0] in,
  input wire [k-1:0] address1,
  output wire [width-1:0] out1,
  input wire [k-1:0] address2,
  output wire [width-1:0] out2
);

reg [width-1:0] ram[2**k-1:0];

always @(posedge clk) begin
  if (load == 1'b1) begin
    ram[address1] <= in;
  end
end

assign out1 = ram[address1];
assign out2 = ram[address2];

endmodule
