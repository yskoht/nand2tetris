module IncN #(
  parameter width = 16
) (
  input wire [width-1:0] in,
  output wire [width-1:0] out
);

wire [width-1:0] one = {{width - 1{1'b0}}, 1'b1};

AddN #(.width(width)) AddN(.a(in), .b(one), .out(out));

endmodule
