module Counter(
input clk,
input rst,
output [7:0] Q
); 

always@(posedge clk) begin
	if(rst == 1'b1)
		out <= 8'b0;
			else
		out <= out + 1'b1;
end
