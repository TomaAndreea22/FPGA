module Counter(
input clk,
input rst,
output reg [7:0] out
); 

always@(posedge clk) begin
	if(rst == 1'b1)
		out <= 8'b0;
			else
		out <= out + 8'b00000001;
end

endmodule
