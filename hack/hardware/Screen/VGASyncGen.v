module VGASyncGen(
  input wire clk, rst,
  output reg hsync, vsync,
  output wire display_enable
);

`include "VGAParam.vh"

localparam W = 10;

reg [W-1:0] hcnt, vcnt;
wire hcnt_end = (hcnt == H_PERIOD - 1);

always @(posedge clk) begin
  if (rst)
    hcnt <= 0;
  else if (hcnt_end)
    hcnt <= 0;
  else
    hcnt <= hcnt + 1;
end

always @(posedge clk) begin
  if (rst)
    vcnt  <= 0;
  else if (hcnt_end) begin
    if (vcnt == V_PERIOD - 1)
      vcnt <= 0;
    else
      vcnt <= vcnt + 1;
  end
end

wire [W-1:0] hsync_start = H_FRONT - 1;
wire [W-1:0] hsync_end = H_FRONT + H_WIDTH - 1;
wire [W-1:0] vsync_start = V_FRONT;
wire [W-1:0] vsync_end = V_FRONT + V_WIDTH;

always @(posedge clk) begin
  if (rst)
    hsync <= 1;
  else if (hcnt == hsync_start)
    hsync <= 0;
  else if (hcnt == hsync_end)
    hsync <= 1;
end

always @(posedge clk) begin
  if (rst)
    vsync <= 1;
  else if (hcnt == hsync_start) begin
    if (vcnt == vsync_start)
      vsync <= 0;
    else if (vcnt == vsync_end)
      vsync <= 1;
  end
end

wire [W-1:0] H_BLANK = H_FRONT + H_WIDTH + H_BACK;
wire [W-1:0] V_BLANK = V_FRONT + V_WIDTH + V_BACK;

assign display_enable = (vcnt >= V_BLANK) && (hcnt >= H_BLANK - 1) && (hcnt < H_PERIOD - 1);

endmodule
