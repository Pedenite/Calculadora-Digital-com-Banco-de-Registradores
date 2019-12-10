module regbank(	
	input	logic	clk, 
	input	logic reset, //sinal de reset ativo em 1. Quando reset = 1 todos registradores serão zerados
  	input	logic	we, //sinal "write enable", quando o sinal é 1 o valor de 8 bits contido em wdata será gravado (na borda de subida de clock) no registrador de endereço definido por address
  	input	logic	[3:0]	address, //endereço do registrador
   input	logic	[7:0]	wdata, //valor de 8 bits a ser escrito no registrador quando we = 1
   output logic [7:0] rdata); //valor de 8 bits lido do registrador. rdata recebe o valor de 8 bits contido no registrador de endereço definido por address
  
	logic [7:0] bancoreg[9:0]; //define 10 registradores endereçados de 0 a 9 de tamanho 8 bits

	always_ff @(posedge clk)
		if(reset) bancoreg <= '{default:0}; //Quando reset = 1 todos registradores serão zerados
		else
			if (we) bancoreg[address] <= wdata; //se we = 1 o registrador de endereço address recebe o valor de 8 bits contido em wdata

	assign rdata = bancoreg[address]; //rdata recebe o valor de 8 bits contido no registrador de endereço address

endmodule