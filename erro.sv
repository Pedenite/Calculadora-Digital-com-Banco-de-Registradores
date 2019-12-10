module erro (
	input ov,
	output [6:0] d0, d1, d2, d3
);

assign d3 = ~7'b1111001;
assign d2 = ~7'b1010000;
assign d1 = ~7'b1010000;
assign d0 = ~7'b1011100;

endmodule