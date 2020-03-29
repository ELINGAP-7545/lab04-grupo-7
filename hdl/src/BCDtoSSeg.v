module BCDtoSSeg (BCD, SSeg, an);

  input [3:0] BCD;
  output reg [0:6] SSeg;
  output [3:0] an;

assign an=4'b1110;

//programacion para 7 segmentos de anodo comun
always @ ( * ) begin
  case (BCD)//Inicio de casos en orden decendente
   4'b0000: SSeg = 7'b0000001; // "0"  
	4'b0001: SSeg = 7'b1001111; // "1" 
	4'b0010: SSeg = 7'b0010010; // "2" 
	4'b0011: SSeg = 7'b0000110; // "3" 
	4'b0100: SSeg = 7'b1001100; // "4" 
	4'b0101: SSeg = 7'b0100100; // "5" 
	4'b0110: SSeg = 7'b0100000; // "6" 
	4'b0111: SSeg = 7'b0001111; // "7" 
	4'b1000: SSeg = 7'b0000000; // "8"  
	4'b1001: SSeg = 7'b0000100; // "9" 
	//paso de binario a hexa
   4'ha: SSeg = 7'b0001000;	//A
   4'hb: SSeg = 7'b1100000;	//B
   4'hc: SSeg = 7'b0110001;	//C
   4'hd: SSeg = 7'b1000010;	//D
   4'he: SSeg = 7'b0110000;	//E
   4'hf: SSeg = 7'b0111000;	//F
    default:
    SSeg = 0;
  endcase
end

endmodule
