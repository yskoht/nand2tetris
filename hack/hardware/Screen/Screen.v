module Screen (
  input wire clk, load,
  input wire [15:0] in,
  input wire [12:0] address,
  output wire [15:0] out,

  input wire vga_clk, vga_rst,
  output reg [3:0] vga_r, vga_g, vga_b,
  output wire vga_hs, vga_vs
);

wire display_enable;

VGASyncGen VGASyncGen(
  .clk(vga_clk),
  .rst(vga_rst),
  .hsync(vga_hs),
  .vsync(vga_vs),
  .display_enable(display_enable)
);

reg [8:0] xcnt;
reg [7:0] ycnt;

always @(posedge vga_clk) begin
  if (vga_rst) begin
    xcnt <= 0;
    ycnt <= 0;
  end else if (display_enable) begin
    if (xcnt == 511) begin
      xcnt <= 0;
      if (ycnt == 255)
        ycnt <= 0;
      else
        ycnt <= ycnt + 1;
    end else
      xcnt <= xcnt + 1;
  end
end

wire [12:0] vga_address = { ycnt, 5'b0 } + { 9'b0, xcnt[8:4] };
wire [15:0] vga_out;

RAM8Kp2 RAM8Kp2(
  .clk(clk),
  .load(load),
  .in(in),
  .address1(address),
  .out1(out),
  .address2(vga_address),
  .out2(vga_out)
);

wire pixel = vga_out[xcnt[3:0]];

always @(posedge vga_clk) begin
  if (vga_rst)
    { vga_r, vga_g, vga_b } <= 12'h00F;
  else if (display_enable) begin
    if (pixel == 1)
      { vga_r, vga_g, vga_b } <=  12'h000;
    else
      { vga_r, vga_g, vga_b } <=  12'hFFF;
  end
end

endmodule
