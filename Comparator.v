module Comparator(
	input[31:0] counter,
	output reg out
);

reg[31:0] cntNumber = 250000000;

always@(counter or cntNumber) begin
	if(counter != cntNumber)
		out <= 0;
		else
		out<=1;
	end
endmodule
