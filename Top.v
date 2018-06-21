module Top(	
	input clk_t,
	input rst_t,
	output clk_div_t
);

wire[31:0] w1;
wire w2;

Counter DUT2(
.counter(w1),
.out(w2)
);

ClockDivider(
.clk_div(clk_div_t),
.D(w2),
.clk(clk_t),
.rst(rst_t),

);

endmodule
