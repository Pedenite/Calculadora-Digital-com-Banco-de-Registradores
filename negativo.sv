module negativo(
	input neg,
	output [6:0] disp
);
always @(*)
if(neg == 0)
	disp = ~7'b1000000;
else
	disp = ~7'b0111111;

endmodule