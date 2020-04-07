`timescale 1ns / 1ps

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
		
		//for(i=0;i<10;i=i+1)begin
		clk2= 0;
		rst = 1;
		#10 rst =0;
		
		num = 16'h8439;
		
      //end

	end
      

	always #1 clk2 = ~clk2;
	
endmodule

