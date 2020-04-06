`timescale 1ns / 1ps    //Es una escala de tiempo que indica el valor de cada unidad de tiempo, en este caso cada unidad es 1ns y la simulacion tiene una presicion de 1ps


module BCDtoSSeg_TB;

	// Inputs
	reg [3:0] BCD;

	// Outputs
	wire [6:0] SSeg;

	// Instantiate the Unit Under Test (UUT)
	BCDtoSSeg uut (
		.BCD(BCD), 
		.SSeg(SSeg)
	);

	initial begin

		BCD = 0; #10;
		BCD = 1; #10;
		BCD = 2; #10;
		BCD = 3; #10;
		BCD = 4; #10;
		BCD = 5; #10;
		BCD = 6; #10;
		BCD = 7; #10;
		BCD = 8; #10;
		BCD = 9; #10;
		BCD = 10; #10;
		BCD = 11; #10;
		BCD = 12; #10;
		BCD = 13; #10;
		BCD = 14; #10;
		BCD = 15; #10;

	end

   initial begin: TEST_CASE
     $dumpfile("BCDtoSSeg_TB.vcd");   //Se usa para volcar los cambios en los registros de un archivo,los cambios se registran en un archivo llamado VCD que significa volcado de cambio de valor. En este caso volcara los cambios del archivo llamado BCDtoSSeg_TB.vcd
     #(200) $finish;                  //Tenemos un retardo de tiempo de 200, seguido de $finish que significa que sale de la simulación y devuelve el control al sistema operativo   
   end

endmodule