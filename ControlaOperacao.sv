module ControlaOperacao(
	input logic ready,
	input logic reset,
	input logic [3:0] tecla,
	input logic [7:0] load,
	input logic [7:0] VAanterior, VBanterior, Vresult,
	output logic [7:0] valorA,
	output logic [7:0] valorB,
	output logic Cin,
	output logic we,
	output logic res,
	output logic [3:0] adress,
	output logic err,
	output logic en,
	output logic [7:0] store,
	output logic [3:0] estado
);

	typedef enum logic [3:0] {INICIAL, INICIAL_A, INICIAL_B, INICIAL_SOMA, INICIAL_SUB, RESULT_SOMA, RESULT_SUB, SOMA, SUBTRACAO, STORE_A, STORE_RES_SOMA, STORE_RES_SUB, LOAD_A, LOAD_SOMA, LOAD_SUB, ERRO} statetype;
	statetype state, nextstate;

	always_ff @(posedge ready, posedge reset)
		if (reset) state <= INICIAL;
		else state <= nextstate;
		
	always @(*)
	  	case (state)
			//0
			INICIAL: if (tecla == 10) nextstate = SOMA;
			else if (tecla == 11) nextstate = SUBTRACAO;
			else if (tecla == 12) nextstate = STORE_A;
			else if (tecla == 13) nextstate = LOAD_A;
			else if (tecla == 14) nextstate = INICIAL;
			else if (tecla == 15) nextstate = INICIAL;
			else nextstate = INICIAL_A;
			//1
			INICIAL_A: if (tecla == 10) nextstate = SOMA;
			else if (tecla == 11) nextstate = SUBTRACAO;
			else if (tecla == 12) nextstate = STORE_A;
			else if (tecla == 13) nextstate = LOAD_A;
			else if (tecla == 14) nextstate = INICIAL_B;
			else if (tecla == 15) nextstate = INICIAL;
			else nextstate = INICIAL_B;
			//2
			INICIAL_B: if (tecla == 10) nextstate = SOMA;
			else if (tecla == 11) nextstate = SUBTRACAO;
			else if (tecla == 12) nextstate = STORE_A;
			else if (tecla == 13) nextstate = LOAD_A;
			else if (tecla == 14) nextstate = INICIAL_SOMA;
			else if (tecla == 15) nextstate = INICIAL;
			else nextstate = INICIAL;
			//3
			INICIAL_SOMA: if (tecla == 10) nextstate = SOMA;
			else if (tecla == 11) nextstate = SUBTRACAO;
			else if (tecla == 12) nextstate = STORE_RES_SOMA;
			else if (tecla == 13) nextstate = LOAD_SOMA;
			else if (tecla == 14) nextstate = RESULT_SOMA;
			else if (tecla == 15) nextstate = INICIAL;
			else nextstate = INICIAL_SOMA;
			//4
			INICIAL_SUB: if (tecla == 10) nextstate = SOMA;
			else if (tecla == 11) nextstate = SUBTRACAO;
			else if (tecla == 12) nextstate = STORE_RES_SUB;
			else if (tecla == 13) nextstate = LOAD_SUB;
			else if (tecla == 14) nextstate = RESULT_SUB;
			else if (tecla == 15) nextstate = INICIAL;
			else nextstate = INICIAL_SUB;
			//5
			RESULT_SOMA: if (tecla == 12) nextstate = STORE_RES_SOMA;
			else nextstate = INICIAL;
			//6
			RESULT_SUB: if (tecla == 12) nextstate = STORE_RES_SUB;
			else nextstate = INICIAL;
			//7
			SOMA: if (tecla < 10) nextstate = INICIAL_SOMA;
			else if (tecla == 13) nextstate = LOAD_SOMA;
			else if (tecla == 15) nextstate = INICIAL;
			else nextstate = ERRO;
			//8
			SUBTRACAO: if (tecla < 10) nextstate = INICIAL_SUB;
			else if (tecla == 13) nextstate = LOAD_SUB;
			else if (tecla == 15) nextstate = INICIAL;
			else nextstate = ERRO;
			//9
			STORE_A: if (tecla < 10) nextstate = INICIAL_A;
			else if (tecla == 15) nextstate = INICIAL;
			else nextstate = ERRO;
			//10
			STORE_RES_SOMA: if (tecla < 10) nextstate = INICIAL;
			else if (tecla == 15) nextstate = INICIAL;
			else nextstate = ERRO;
			//11
			STORE_RES_SUB: if (tecla < 10) nextstate = INICIAL;
			else if (tecla == 15) nextstate = INICIAL;
			else nextstate = ERRO;
			//12			
			LOAD_A: if (tecla < 10) nextstate = INICIAL_B;
			else if (tecla == 15) nextstate = INICIAL;
			else nextstate = ERRO;
			//13		
			LOAD_SOMA: if (tecla < 10) nextstate = INICIAL_SOMA;
			else if (tecla == 15) nextstate = INICIAL;
			else nextstate = ERRO;
			//14
			LOAD_SUB: if (tecla < 10) nextstate = INICIAL_SUB;
			else if (tecla == 15) nextstate = INICIAL;
			else nextstate = ERRO;
			//15
			ERRO: nextstate = INICIAL;
			
			default: nextstate = INICIAL;

		endcase
	
	always_comb
				case (state)

				INICIAL:	begin 
								valorA = 0; 
								valorB = 0;
								Cin = 0;
								we = 0;
								res = 0;
								adress = 0;
								err = 0;
								en = 1;
								store = 0;
								estado = 4'b 0000;
							end	
							
				INICIAL_A:	begin 
								valorA = tecla; 
								valorB = 0;
								Cin = 0;
								we = 0;
								res = 0;
								adress = 0;
								err = 0;
								en = 1;
								store = 0;
								estado = 4'b 0001;
							end	
							
				INICIAL_B:	begin 
								valorA = VAanterior; 
								valorB = 0;
								Cin = 0;
								we = 0;
								res = 0;
								adress = 0;
								err = 0;
								en = 1;
								store = 0;
								estado = 4'b 0010;
							end	
							
				INICIAL_SOMA:	begin 
								if(tecla == 14) begin
									valorA = VAanterior; 
									valorB = VBanterior;
									Cin = 0;
									we = 0;
									res = 1;
									adress = 0;
									err = 0;
									en = 1;
									store = 0;
									estado = 4'b 0011;
								end
								else begin
								valorA = VAanterior; 
								valorB = VBanterior;
								Cin = 0;
								we = 0;
								res = 0;
								adress = 0;
								err = 0;
								en = 1;
								store = 0;
								estado = 4'b 0011;
								end
							end	
					
				INICIAL_SUB:	begin 
								if(tecla == 14) begin
									valorA = VAanterior; 
									valorB = VBanterior;
									Cin = 1;
									we = 0;
									res = 1;
									adress = 0;
									err = 0;
									en = 1;
									store = 0;
									estado = 4'b 0100;
								end
								else begin
								valorA = VAanterior; 
								valorB = VBanterior;
								Cin = 1;
								we = 0;
								res = 0;
								adress = 0;
								err = 0;
								en = 1;
								store = 0;
								estado = 4'b 0100;
								end
							end	
							
				RESULT_SOMA: begin
									valorA = VAanterior;
									valorB = VBanterior;
									Cin = 0;
									we = 0;
									res = 1;
									adress = 0;
									err = 0;
									en = 1;
									store = 0;
									estado = 4'b 0101;
								end
								
				RESULT_SUB: begin
									valorA = VAanterior;
									valorB = VBanterior;
									Cin = 1;
									we = 0;
									res = 1;
									adress = 0;
									err = 0;
									en = 1;
									store = 0;
									estado = 4'b 0110;
								end

				 SOMA: begin  
								valorA = VAanterior;
								if(tecla > 9) valorB = 0;
								else valorB = tecla;
								Cin = 0;
								we = 0;
								res = 0;
								adress = 0;
								err = 0;
								en = 1;
								store = 0;
								estado = 4'b 0111;
						end
				
				 SUBTRACAO:	begin  
									valorA = VAanterior;
									if(tecla > 9) valorB = 0;
									else valorB = tecla;
									Cin = 1;
									we = 0;
									res = 0;
									adress = 0;
									err = 0;
									en = 1;
									store = 0;
									estado = 4'b 1000;
								end	 

				 STORE_A: begin 
								valorA = VAanterior;
								valorB = VBanterior;
								Cin = 0;
								we = 1;
								res = 0;
								adress = tecla;
								err = 0;
								en = 0;
								store = valorA;
								estado = 4'b 1001;
							end	
							
				STORE_RES_SOMA: begin 
								valorA = VAanterior;
								valorB = VBanterior;
								Cin = 0;
								we = 1;
								res = 1;
								adress = tecla;
								err = 0;
								en = 0;
								store = Vresult;
								estado = 4'b 1010;
							end
							
				STORE_RES_SUB: begin 
								valorA = VAanterior;
								valorB = VBanterior;
								Cin = 1;
								we = 1;
								res = 1;
								adress = tecla;
								err = 0;
								en = 0;
								store = Vresult;
								estado = 4'b 1011;
							end
				
				LOAD_A: begin 
								valorA = load; 
								valorB = VBanterior;
								Cin = 0;
								we = 0;
								res = 0;
								adress = tecla;
								err = 0;
								en = 1;
								store = 0;
								estado = 4'b 1100;
						end
					
				LOAD_SOMA: begin 
								valorA = VAanterior;
								valorB = load;
								Cin = 0;
								we = 0;
								res = 0;
								adress = tecla;
								err = 0;
								en = 1;
								store = 0;
								estado = 4'b 1101;
						end	
						
				LOAD_SUB: begin 
								valorA = VAanterior;
								valorB = load;
								Cin = 1;
								we = 0;
								res = 0;
								adress = tecla;
								err = 0;
								en = 1;
								store = 0;
								estado = 4'b 1110;
						end	
				
				ERRO: begin
							valorA = 0;
							valorB = 0;
							Cin = 0;
							we = 0;
							res = 1;
							adress = 0;
							err = 1;
							en = 1;
							store = 0;
							estado = 4'b 1111;
						end
									
				default: begin
								valorA = 0;
								valorB = 0;
								Cin = 0;
								we = 0;
								res = 0;
								adress = 0;
								err = 0;
								en = 0;
								store = 0;
								estado = 4'b 0000;
							end

			endcase
		
endmodule