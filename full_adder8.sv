module full_adder8(
	input A[7:0], B[7:0], Cin,
	output F[7:0], overflow
);
reg Cout[7:0];

assign {Cout[0], F[0]} = A[0]+B[0]+Cin;
assign {Cout[1], F[1]} = A[1]+B[1]+Cout[0];
assign {Cout[2], F[2]} = A[2]+B[2]+Cout[1];
assign {Cout[3], F[3]} = A[3]+B[3]+Cout[2];
assign {Cout[4], F[4]} = A[4]+B[4]+Cout[3];
assign {Cout[5], F[5]} = A[5]+B[5]+Cout[4];
assign {Cout[6], F[6]} = A[6]+B[6]+Cout[5];
assign {Cout[7], F[7]} = A[7]+B[7]+Cout[6];

endmodule