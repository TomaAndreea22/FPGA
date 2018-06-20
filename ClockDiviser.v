module ClockDiviser(
	output clk_div,
	input EN,
	input clk,
	input rst
);

always@(posedge  clk)
	if(EN == 1)
		clk <= clk;
		else
		clk <= ~clk;
	
end
endmodule