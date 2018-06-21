module VGA_TOP(
	input rst_f,
	input clk_f,
	output HSYNC_OUT,
	output VSYNC_OUT,
	output [7:0] R,
	output [7:0] G,
	output [7:0] B
);

wire [7:0] x;
wire [7:0] y;
reg clk_div_f;
wire sq_a, sq_b, sq_c, sq_d;

TOP DUT1(
.clk_t(clk_f),
.rst_t(rst_f),
.clk_div_t()
);

VGA_TOP DUT2(
.clk_in(clk_f),
.clk_div(clk_div_f),
.rst(rst_f),
.xpose(x),
.ypose(y),
.hsync(HSYNC_OUT),
.vsync(VSYNC_OUT),
.vga_black_n(),
);

assign sq_a = ((x > 120) & (y >  40) & (x < 280) & (y < 200)) ? 1 : 0;
assign sq_b = ((x > 200) & (y > 120) & (x < 360) & (y < 280)) ? 1 : 0;
assign sq_c = ((x > 280) & (y > 200) & (x < 440) & (y < 360)) ? 1 : 0;
assign sq_d = ((x > 360) & (y > 280) & (x < 520) & (y < 440)) ? 1 : 0;
assign R[3] = sq_b;
assign G[3] = sq_a | sq_d;
assign B[3] = sq_c; 
endmodule