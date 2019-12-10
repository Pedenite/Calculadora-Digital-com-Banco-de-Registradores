module Mux16(
	input [7:0] Dado0, 
	input [7:0] Dado1, 
	input [7:0] Dado2,
	input [7:0] Dado3, 
	input [7:0] Dado4, 
	input [7:0] Dado5, 
	input [7:0] Dado6, 
	input [7:0] Dado7, 
	input [7:0] Dado8, 
	input [7:0] Dado9,
	input [3:0] Escolha,
	output [7:0] Saida
);

always_comb
	casex(Escolha)
		4'b 0000: Saida = Dado0;
		4'b 0001: Saida = Dado1;
		4'b 0010: Saida = Dado2;
		4'b 0011: Saida = Dado3;
		4'b 0100: Saida = Dado4;
		4'b 0101: Saida = Dado5;
		4'b 0110: Saida = Dado6;
		4'b 0111: Saida = Dado7;
		4'b 1000: Saida = Dado8;
		4'b 1001: Saida = Dado9;
		default:Saida = 8'b 00000000;
	endcase
		
endmodule
