module VGA(
	input clk_in,
	input rst,
	input [7:0] R, G, B,
	output [7:0] R_t, G_t, B_t,
	input [11:0] xpose, ypose,
	output hsync, vsync,
	output vga_blck_n, vga_sync_n,
	input disp_active
);

reg [9:0] h_count;
reg [9:0] v_count;
localparam horizontal_sync_start;
localparam vertical_sync_start;
localparam LINE = 640;
localparam SCREEN = 480;
always@(posedge clk_in) begin

	if(rst == 0) begin
		h_count <= 0;
		v_count <= 0;
			if (clk_in) begin 
				if(h_count == LINE)begin
					 h_count <= 0;
					 v_count <= v_count +1;
				end
				else 
					h_count <= h_count + 1;
				if(v_count == SCREEN)
					v_count <= 0;
				end
		
	end
	