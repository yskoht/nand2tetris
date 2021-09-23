module ClockGen(
  input wire clk, clk_rst,
  output reg main_clk, vga_clk
);

// main
reg [6:0] main_cnt;
localparam main_max = 125;

always @(posedge clk) begin
  if (clk_rst)
    main_cnt <= 0;
  else if (main_cnt == main_max - 1)
    main_cnt <= 0;
  else
    main_cnt <= main_cnt + 1;
end

always @(posedge clk) begin
  if (clk_rst)
    main_clk <= 0;
  else if (main_cnt == main_max - 1)
    main_clk <= 1;
  else
    main_clk <= 0;
end

// vga
reg [2:0] vga_cnt;
localparam vga_max = 5;

always @(posedge clk) begin
  if (clk_rst)
    vga_cnt <= 0;
  else if (vga_cnt == vga_max - 1)
    vga_cnt <= 0;
  else
    vga_cnt <= vga_cnt + 1;
end

always @(posedge clk) begin
  if (clk_rst)
    vga_clk <= 0;
  else if (vga_cnt == vga_max - 1)
    vga_clk <= 1;
  else
    vga_clk <= 0;
end

endmodule
