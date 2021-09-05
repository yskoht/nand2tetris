module ALUN #(
  parameter width = 16
) (
  input wire [width-1:0] x, y,
  input wire zx, nx, zy, ny, f, no,
  output wire [width-1:0] out,
  output wire zr, ng
);

wire [width-1:0] zx_out, zy_out;
wire [width-1:0] not_zx_out, not_zy_out;
wire [width-1:0] nx_out, ny_out;
wire [width-1:0] add_out;
wire [width-1:0] and_out;
wire [width-1:0] not_out;
wire [width-1:0] f_out;
wire [width-1:0] not_f_out;
wire or_out;

wire [width-1:0] zero = {width{1'b0}};

MuxN #(.width(width)) MuxN_zx(.a(x), .b(zero), .sel(zx), .out(zx_out));
MuxN #(.width(width)) MuxN_zy(.a(y), .b(zero), .sel(zy), .out(zy_out));

NotN #(.width(width)) NotN_zx(.in(zx_out), .out(not_zx_out));
NotN #(.width(width)) NotN_zy(.in(zy_out), .out(not_zy_out));

MuxN #(.width(width)) MuxN_nx(.a(zx_out), .b(not_zx_out), .sel(nx), .out(nx_out));
MuxN #(.width(width)) MuxN_ny(.a(zy_out), .b(not_zy_out), .sel(ny), .out(ny_out));

AddN #(.width(width)) AddN(.a(nx_out), .b(ny_out), .out(add_out));
AndN #(.width(width)) AndN(.a(nx_out), .b(ny_out), .out(and_out));

MuxN #(.width(width)) MuxN_f(.a(and_out), .b(add_out), .sel(f), .out(f_out));

NotN #(.width(width)) NotN_f_out(.in(f_out), .out(not_f_out));

MuxN #(.width(width)) MuxN_no(.a(f_out), .b(not_f_out), .sel(no), .out(out));

OrNWay #(.way(width)) OrNWay(.in(out), .out(or_out));
Not Not_zr(.in(or_out), .out(zr));

Mux Mux_ng(.a(1'b0), .b(1'b1), .sel(out[width-1]), .out(ng));

endmodule
