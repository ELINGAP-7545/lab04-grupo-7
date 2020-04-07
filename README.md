# laboratorio 4

## Grupo 7

## Integrantes

Bryan Daniel Melo Guzman 49686

Fabian Santiago Martin Morantes 60821

Juan David Sandoval Suarez 39718



# Entregables

Una vez clone el repositorio y lea la anterior guia, realice lo siguiente:

En el paquete de trabajo [WP04](https://classroom.github.com/g/zCBwHHKX)   esta la descripci車n del hardware que se implementa para visualizar un n迆mero hexadecimal de 32 bits en un display  y en 4 display de 7 segmentos.


* Comprenda cada l赤nea del c車digo HDL de los  archivos que se encuentra en la carpera src. Si cree necesario realice los respectivos comentarios en el mismo archivo y comente
* Realice en quartus la simulaci車n para el BCD-7seg, analice los resultados.
* Cree el nuevo proyecto HDL para Visualizaci車n Din芍mica 4 Display, tomando como base los archivos dados.
* Creer el archivo testbench.v
* Genera la simulaci車n, Revise que el sistema funciona como usted lo esperaba. Realice lo comentarios necesarios en el archivo README.md.
* Modificar o A?adir los bloques necesarios para que la visualizaci車n sea en representaci車n Decimal y no Hexadecimal.
* Realice la respectiva publicaci車n del repositorio antes de la fecha dada con todo el c車digo  fuente 

# Introduccion

Para la realizacion de este laboratorio, utilizamos los codigos base que el profesor nos proporciono para el correcto funcionamiento del laboratorio. Cabe resaltar que se debe entender cada linea del codigo para poder tener un mejor entendimiento a la hora de hacer preguntas que surgen a lo largo del laboratorio.   

## Dise?o BCD-7seg

Para el diseo de un display de 7 segmentos y su respectiva visualizacion, se debe implementar el codigo base que tenemos y entender cada linea para asi poder conseguir conocimientos mas exactos al momento de implementar mas displays.


**Definir la descripcion Funcional**

Un display de 7 segmentos es un visualizador de numeros o letras, dependiendo de la conexion externa para lo que se desee implementar. Esta construido por unos leds que tienen unas conexiones internas para su correcto funcionamiento, existen dos tipos de visualizadores y se diferencian en la entrada de alimentacion. 

**Anodo Comun:** Este visualizador tiene todos los anodos de los leds conectados internamente. Para poder encender cada uno de los segmentos, se debe aplicar un potencial negativo (en logica binaria 0).

**Catodo Comun:** Este visualizador tiene todos los catodos de los leds conectados internamente. Para poder encender cada uno de los segmentos, se debe aplicar un potencial positivo (en logica binaria 1).

Se recomienda implementar externamente una resitencia detro de lo posible de 330 ohmios a cada segmento del display para asi poder limitar la corriente.

Despues de tener claro lo anterior, procedemos a realizar la tabla de verdad del visualizador de 7 segmentos (display), para cada numero y/o letra que se desee ver. Para ello se tiene en cuenta la conexion interna del display que se presenta a continuacion:

![imagen_display_7_seg](https://http2.mlstatic.com/display-7-segmentos-D_NQ_NP_965598-MLM29489271353_022019-F.jpg)

De la anterior imagen podemos sacar las siguientes tablas de verdad:

![tabla_de_verdad](https://github.com/ELINGAP-7545/lab04-grupo-7/blob/master/Imagenes/Tabla%20de%20Verdad.jpg)

# VERILOG QUARTUS

Tener encuenta que el siguiente codigo representa los leds que se van a encontrar activados durante el proceso, tomando como 0 los que se van a encontrar activos y 1 como apagados.

## 7 Segmentos 1 Display 
```verilog
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
```

## Testbench

```verilog

`timescale 1ns / 1ps  //Es una escala de tiempo que indica el valor de cada unidad de tiempo, en este caso cada unidad es 1ns y la simulacion tiene una presicion de 1ps



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
     $dumpfile("BCDtoSSeg_TB.vcd");     //Se usa para volcar los cambios en los registros de un archivo,los cambios se registran en un archivo llamado VCD que significa volcado de cambio de valor. En este caso volcara los cambios del archivo llamado BCDtoSSeg_TB.vcd
     #(200) $finish;      //Tenemos un retardo de tiempo de 200, seguido de $finish que significa que sale de la simulaci籀n y devuelve el control al sistema operativo   
   end

endmodule

```

## Simulacion Quartus

![diagrama](https://github.com/ELINGAP-7545/lab04-grupo-7/blob/master/Imagenes/Quartus%207seg1Display.jpg)


# 7 Segmentos x4Displays

## VERILOG QUARTUS

Se crea en la siguiente ruta: https://github.com/ELINGAP-7545/lab04-grupo-7/tree/master/7segx4Display

```verilog
`timescale 1ns / 1ps
module display(
    input [15:0] num,
    input clk,
    output [0:6] sseg,
    output reg [3:0] an,
	 input rst,
	 output led
    );



reg [3:0]bcd=0;
//wire [15:0] num=16'h4321;
 
BCDtoSSeg bcdtosseg(.BCD(bcd), .SSeg(sseg));

reg [26:0] cfreq=0;
wire enable;

// Divisor de frecuecia

assign enable = cfreq[16];
assign led =enable;
always @(posedge clk) begin
  if(rst==1) begin
		cfreq <= 0;
	end else begin
		cfreq <=cfreq+1;
	end
end

reg [1:0] count =0;
always @(posedge enable) begin
		if(rst==1) begin
			count<= 0;
			an<=4'b1111; 
		end else begin 
			count<= count+1;
			an<=4'b1101; 
			case (count) 
				2'h0: begin bcd <= num[3:0];   an<=4'b1110; end 
				2'h1: begin bcd <= num[7:4];   an<=4'b1101; end 
				2'h2: begin bcd <= num[11:8];  an<=4'b1011; end 
				2'h3: begin bcd <= num[15:12]; an<=4'b0111; end 
			endcase
		end
end

endmodule
```

## Testbench


```verilog
`timescale 1ns / 1ps //Especifica la unidad de tiempo y precisi車n para la simulaci車n  donde se tiene el valor de la unidad de tiempo y el valor de la unidad de precisi車n.

module testbench;

	// registro de ingreso
	reg [15:0] num; // registro de 16 bits
	reg clk2; //registro de reloj
	reg rst; // registro de reset

	// Outputs
	wire [0:6] sseg; 
	wire [3:0] an;

	// Instanciaci車n del top, nombraremos los registros que se encuentran en otro archivo para poder simular aplicando cambios en nuestro bloque de inicio.
	display uut (
		.num(num), 
		.clk(clk2), 
		.sseg(sseg), 
		.an(an), 
		.rst(rst)
	);

	initial begin
				
		clk2= 0; //reloj empieza en cero
		rst = 1; //el registro rst se pone en 1 para iniciar con el bloque de divisor de frecuencia, adem芍s de ser fundamental para poner dos registros en valores iniciales como lo es "count" y "an"
		#10 rst =0; //tiene un temporizador de 10ns, con rst en 0 nos pone en el else que nos permite poner variables definidas a "count", "an", y entrar al case donde realizara la selecci車n de cada n迆mero para cada display 
		
		num = 16'h8439;//dado que num es un registro de 16b de esta manera disponemos de los displays de derecha a izquierda, podemos seleccionar el n迆mero que queremos poner en forma hexadecimal.

      

	end
      

	always #1 clk2 = ~clk2;//podemos hacer oscilar el reloj entre 0 y 1 para tener una frecuancia.
	
endmodule
```


## Simulaci車n Quartus

![diagrama](https://github.com/ELINGAP-7545/lab04-grupo-7/blob/master/Imagenes/Display4Seg.png)

# Conclusiones 

## 1
Para poder entender el archivo buscamos identificar los valores num谷ricos que se encuentran dado, para iniciar quitamos los comentarios dentro del de ※.num(num)§ ya que es necesario contar con esta dado que dar芍 la instrucci車n del display actualmente esta en valor hexadecimal 4321 lo que significa que en el primer display mostrar芍 el numero 1 luego el numero 2, 3 y finalmente el numero 4. Para poder identificar esto se modifica para que quede en 8439, para que muestre la combinaci車n de la siguiente manera display 1: numero 9, display 2: numero 3, display 3: numero 4, display 4: numero 8, se realiza la simulaci車n y esta funciona sin problemas. 

