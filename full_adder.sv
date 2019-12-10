module full_adder(
	input A, B, Cin,
	output F, Cout
);
assign {Cout, F} = A+B+Cin;

endmodule