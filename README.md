# LABORATORIO BCD 

INTENGRANTES

Bryan Daniel Melo Guzman 49686

Fabian Santiago Martin Morantes 60821

Juan David Sandoval Suarez 39718

# Introduccion

Para la realizacion de este laboratorio, utilizamos los codigos entregados por el profesor para el correcto funcionamiento del laboratorio. Cabe resaltar que se debe entender cada linea del codigo para poder tener un mejor entendimiento a la hora de hacer preguntas que surgen a lo largo de este.   

## Dise�o BCD-7seg

En este Ejercicio se propone que realicen el dise�o, sintentizacion e implementacion del Display de 7 segmentos, el cual permita visualizar numeros  en representacion hexadecimal (0x0 a 0xF).  En el siguiente grafico, se observa cual es el funcionamiento deseado del display:

[ Display 7 Segmentos](https://en.wikipedia.org/wiki/Seven-segment_display) 

![gif display](https://upload.wikimedia.org/wikipedia/commons/2/2b/Seven_segment_display-animated.gif)

Imagen tomada de [User:Guam + Various](https://commons.wikimedia.org/wiki/File:Seven_segment_display-animated.gif)

A continuacion se presentan los pasos recomendados para el ejercicio:

**Definir la caja funcional del BCD**: 

![bcd_black](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab03-BCD2SSeg/doc/BCD2SSeg.jpg)

Si observa la caja negra/ funcional  ademas  de la salidad de 7 segmentos contiene  una salida `An`. esta salida es para conectar eventualmente el ánodo del display y  poder hacer visualización dinámica, cuando se tiene mas de un display conectado.


**Definir la descripcion Funcional**

Un display 7 segmentos es un visualizador de numeros o letras dependiendo de la conexion externa para lo que se desee implementar. Esta construido por unos leds que tienen unas conexiones internas para su correcto funcionamiento, existen dos tipos de visualizadores y se diferencian en la entrada de alimentacion. 

**Anodo Comun:** Este visualizador tiene todos los anodos de los leds conectados internamente. Para poder encender cada uno de los segmentos, se debe aplicar un potencial negativo (en logica binaria 0).

**Catodo Comun:** Este visualizador tiene todos los catodos de los leds conectados internamente. Para poder encender cada uno de los segmentos, se debe aplicar un potencial positivo (en logica binaria 1).

Se recomienda implementar externamente una resitencia detro de lo posible de 330? a cada segmento del display para asi poder limitar la corriente.
Despues de tener claro lo anterior, procedemos a realizar la tabla de verdad del visualizador de 7 segmentos (display), para cada numero y/o letra que se desee ver. Para ello se tiene en cuenta la conexion interna del display que se presenta a continuacion:

![imagen_display_7_seg](https://http2.mlstatic.com/display-7-segmentos-D_NQ_NP_965598-MLM29489271353_022019-F.jpg)

De la anterior imagen podemos sacar las siguientes tablas de verdad:

![tabla_de_verdad](https://http2.mlstatic.com/display-7-segmentos-D_NQ_NP_965598-MLM29489271353_022019-F.jpg)

Para ello recuerde  que puede hacer uso, bien sea, de las tablas de verdad o de la descripción algorítmica del BCD a  siete segmentos. Recuerde que cada Segmento es una salida  del dise�o. Ejemplo, si desea  visualizar el numero **1**, la salida seria  de `Sseg es 0110000`. observe la grafica a continuacion, para generar las salidas acorde al numero de entrada.

![sseg](https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/7_segment_display_labeled.svg/1024px-7_segment_display_labeled.svg.png)


* Definir en QUARTUS el comportamiento del sistema ** :  Use Verilog para hacer la descripcion funcional
**simulacion de Sistema** :  Use el Testbench para este fin.

Se realiza verificacion de los siguientes codigos en el programa QUARTUS

BCDtoSSeg

![diagrama](https://github.com/ELINGAP-7545/lab04-grupo-7/blob/master/Imagenes/BCDtoSSeg.PNG)

Display

![diagrama](https://github.com/ELINGAP-7545/lab04-grupo-7/blob/master/Imagenes/display.PNG)

BCDtoSSeg_TB

![diagrama](https://github.com/ELINGAP-7545/lab04-grupo-7/blob/master/Imagenes/BCDtoSSeg_TB.PNG)

Dejando como TOP a BCDtoSSeg, al momento de realizar la simulacion Testbench se obtienen los siguientes resultados

![diagrama](https://github.com/ELINGAP-7545/lab04-grupo-7/blob/master/Imagenes/Quartus%207seg1Display.jpg)


# Ejercicio - Visualizacion Dinamica 4 Display


Si el diseño digital de algún sistema se requiere mas de un display de 7 segmentos, es necesario  generar una visualización tal que sea necesario el menor número de pines para conectar todos los display en con la FPGA.


Por ahora, se ha visualizado el numeros en un solo display de 7 segmentos. Pero en la mayoría de los casos, los 7 pines de los cátodos estan inter-conectados entre cada display, como se observa en la figura:

![conex](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab04_display_7segx4/doc/conex.png)

Por lo tanto, se debe  realizar una multiplexacion  entre los Anodos de cada Display, con el fin de visualizar en cada display un número diferente.  En otras palabras, en cada instante de tiempo, solo un display se encuentra activo. En este sentido, se debe garantizar que el destello en la visualización entre cada display no se perciba. Para ello, cada display debe activarse máximo cada 16 ms.

Visualmente esto se entiende mas con la siguiente simulación, donde se desea visualizar el  número en representación hexadecimal `0x4321`:

![diagrama](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab04_display_7segx4/doc/4sseg.jpg).

## Diagrama Caja negra 

Como siempre, antes de realizar la descripción del hardware se debe diseñar la caja funcional del modulo, con las entradas y salidas

![diagrama caja negra ](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab04_display_7segx4/doc/display_7segx4.jpg)

En este sentido, se adiciona al HDL de siete segmentos 4 se�ales de control para el LCD, llamadas An. cada bit de la se�al `An` debe ser modificado en el tiempo, con el fin de activar solo un display.  

## Diagrama Estructural 

![estructural](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab04_display_7segx4/doc/display_7segx4_Diag_Estructural.jpg)

Se evidencia que se deben construir cuatro módulos  básicos, de los cuales uno de ellos esta descrito en el ejercicio anterior, [BCDtoSSeg.v](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab04_display_7segx4/src_ise_basys2/display_7segx4/BCDtoSSeg.v) . Los otros tres bloques son:

* Divisor de frecuencia: Su función es dividir la frecuencia de  `clk` de entrada, en el tiempo requerido para cada camvio de ánodo
* Selector de Ánodo: Sincronizado con la frecuencia  que genera el divisor, cambia en cada instante de tiempo el  ánodo, se puede ver como un registro de desplazamiento del bit 0 `1110 1101 1011 0111`
* Selector de Datos: dependiendo del ánodo activado, activa los datos correspondientes.

# Entregables

Una vez clone el repositorio y lea la anterior guia, realice lo siguiente:

En el paquete de trabajo [WP04](https://classroom.github.com/g/zCBwHHKX)   esta la descripción del hardware que se implementa para visualizar un número hexadecimal de 32 bits en un display  y en 4 display de 7 segmentos.


* Comprenda cada li�nea del codigo HDL de los  archivos que se encuentra en la carpera src. Si cree necesario realice los respectivos comentarios en el mismo archivo y comente
* Realice en quartus la simulación para el BCD-7seg, analice los resultados.
* Cree el nuevo proyecto HDL para Visualización Dinámica 4 Display, tomando como base los archivos dados.
* Creer el archivo testbench.v
* Genera la simulación, Revise que el sistema funciona como usted lo esperaba. Realice lo comentarios necesarios en el archivo README.md.
* Modificar o Añadir los bloques necesarios para que la visualización sea en representación Decimal y no Hexadecimal.
* Realice la respectiva publicación del repositorio antes de la fecha dada con todo el código  fuente 

# VERILOG QUARTUS

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

`timescale 1ns / 1ps //se utiliza para especificar unidad de tiempo en la simulación donde dará una 
					//duración de tiempo de 1ns en los delays que se encuentran posteriormente y 1ps para el 
					//análisis de recolección de datos. 


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
     $dumpfile("BCDtoSSeg_TB.vcd");
     #(200) $finish;
   end

endmodule

```

## Simulación Quartus

![diagrama](https://github.com/ELINGAP-7545/lab04-grupo-7/blob/master/Imagenes/Quartus%207seg1Display.jpg)


# 7 Segmentos x4Displays

## VHL

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
`timescale 1ns / 1ps//se utiliza para especificar unidad de tiempo en la simulación donde dará una 
					//duración de tiempo de 1ns en los delays que se encuentran posteriormente y 1ps para el 
					//análisis de recolección de datos. 

module testbench;

	// Inputs
	reg [15:0] num=0;
	reg [15:0] i;
	reg clk2;
	reg rst;

	// Outputs
	wire [0:6] sseg;
	wire [3:0] an;

	// Instantiate the Unit Under Test (UUT)
	display uut (
		.num(num), 
		.clk(clk2), 
		.sseg(sseg), 
		.an(an), 
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		
		
		clk2= 0;
		rst = 1;
		#10 rst =0;
		
		num = 16'h8439;
		
      

	end
      

	always #1 clk2 = ~clk2;
	
endmodule

```


## Simulación Quartus

![diagrama](https://github.com/ELINGAP-7545/lab04-grupo-7/blob/master/Imagenes/Display4Seg.png)

# Conclusiones 

## 1
Para poder entender el archivo buscamos identificar los valores numéricos que se encuentran dado, para iniciar quitamos los comentarios dentro del de “.num(num)” ya que es necesario contar con esta dado que dará la instrucción del display actualmente esta en valor hexadecimal 4321 lo que significa que en el primer display mostrará el numero 1 luego el numero 2, 3 y finalmente el numero 4. Para poder identificar esto se modifica para que quede en 8439, para que muestre la combinación de la siguiente manera display 1: numero 9, display 2: numero 3, display 3: numero 4, display 4: numero 8, se realiza la simulación y esta funciona sin problemas.




prueba


