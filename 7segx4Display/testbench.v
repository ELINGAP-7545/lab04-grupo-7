`timescale 1ns / 1ps


module testbench;

	// Inputs
	reg [15:0] num=0;
	reg clk;
	reg rst;
	reg [15:0] i;

	// Outputs
	wire [0:6] sseg;
	wire [3:0] an;
	

	// Instantiate the Unit Under Test (UUT)
	display uut (
		.num(num), 
		.clk(clk), 
		.sseg(sseg), 
		.an(an), 
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		
		for(i=0;i<1;i=i+1)begin
		
		
		clk= 0;
		rst = 1;
		#10 rst =0;
		
	//	if(rst==0)begin
		
		num=num+1;
		
		//end
		
		//num = 16'h4321;
		
		//num = 16'h4321;
        
	end
	end
      

	always #1 clk = ~clk;
	
endmodule