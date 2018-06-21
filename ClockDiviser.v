module ClockDiviser(
	input D,
	input clk,
	input rst,
	output reg clk_div
);

always@(posedge  clk)begin
	if(D == 1)
		clk_div <= clk_div;
		else
		clk_div <= ~clk_div;
	
end
endmodule
