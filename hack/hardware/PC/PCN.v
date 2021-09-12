module PCN #(
  parameter width = 16
) (
  input wire clk, load, inc, reset,
  input wire [width-1:0] in,
  output wire [width-1:0] out
);

wire [width-1:0] load_out;
wire [width-1:0] reset_out;
wire [width-1:0] register_out;
wire [width-1:0] incrementer_out;
wire [width-1:0] inc_out;

wire [width-1:0] zero = {width{1'b0}};

MuxN #(.width(width)) MuxN_load(.a(inc_out), .b(in), .sel(load), .out(load_out));
MuxN #(.width(width)) MuxN_reset(.a(load_out), .b(zero), .sel(reset), .out(reset_out));

RegisterN #(.width(width)) RegisterN(.clk(clk), .load(1'b1), .in(reset_out), .out(register_out));
IncN #(.width(width)) IncN(.in(register_out), .out(incrementer_out));

MuxN #(.width(width)) MuxN_inc(.a(register_out), .b(incrementer_out), .sel(inc), .out(inc_out));

assign out = register_out;

endmodule
