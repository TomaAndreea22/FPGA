module VGA(
	input clk_in,
	input clk_div,
	input rst,
	output [11:0] xpose, ypose,
	output hsync, vsync,
	output vga_black_n,
	output disp_active,
	output reg [3:0] MODE
);

reg [9:0] h_count;
reg [9:0] v_count;

localparam LINE = 640;
localparam SCREEN = 480;
localparam HORIZONTAL_SYNC_START = 16;
localparam HORIZONTAL_SYNC_END = 16 + 96; 
localparam HA_STA = 16 + 96 + 48;
localparam VERTICAL_SYNC_STA = 480 + 11;
localparam VERTICAL_SYNC_END = 480 + 11 + 2;
localparam VA_END = 480;

assign hsync = ~((h_count >= HORIZONTAL_SYNC_START)&&(h_count < HORIZONTAL_SYNC_END));
assign vsync = ((v_count >= VERTICAL_SYNC_STA )&&(v_count < VERTICAL_SYNC_END));

assign xpose = (h_count < HA_STA) ? 0 : (h_count - HA_STA);
assign ypose = (v_count >= VA_END) ? (VA_END - 1) : (v_count);

assign vga_black_n = ((h_count < HA_STA) | (v_count > VA_END - 1));
assign disp_active = ~((h_count < HA_STA) | (v_count > VA_END - 1)); 

always@(posedge clk_in) begin

	if(rst == 0) begin
		h_count <= 0;
		v_count <= 0;
	end
	if(clk_div) begin 
		if(h_count == LINE) begin 
					h_count <= 0;
					v_count <= v_count + 1;
					end
					else 
					h_count <= h_count + 1;
				if(v_count == SCREEN)
					v_count <= 0;
				end
	MODE <= MODE + 4'b0001;
		
	end

endmodule
	
