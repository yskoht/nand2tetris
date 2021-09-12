module RAM64N #(
  parameter width = 16
) (
  input wire clk, load,
  input wire [width-1:0] in,
  input wire [k-1:0] address,
  output wire [width-1:0] out
);

localparam k = 6;

wire [k/2-1:0] address_top = address[k-1:k-3];
wire [k/2-1:0] address_bottom = address[k-4:0];

wire [2**k-1:0] w_load;
wire [width-1:0] w_out[2**k-1:0];

DMux8Way DMux8Way(
  .in(load),
  .sel(address_top),
  .a(w_load[0]),
  .b(w_load[1]),
  .c(w_load[2]),
  .d(w_load[3]),
  .e(w_load[4]),
  .f(w_load[5]),
  .g(w_load[6]),
  .h(w_load[7])
);

genvar i;
generate
  for (i = 0; i < 2**k; i = i + 1) begin
    RAM8N #(.width(16)) RAM8N(.clk(clk), .load(w_load[i]), .in(in), .address(address_bottom), .out(w_out[i]));
  end
endgenerate

Mux8WayN #(.width(width)) Mux8WayN(
  .a(w_out[0]),
  .b(w_out[1]),
  .c(w_out[2]),
  .d(w_out[3]),
  .e(w_out[4]),
  .f(w_out[5]),
  .g(w_out[6]),
  .h(w_out[7]),
  .sel(address_top),
  .out(out)
);

endmodule
