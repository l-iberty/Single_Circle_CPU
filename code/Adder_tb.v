`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:11:14 12/22/2017
// Design Name:   Adder
// Module Name:   E:/Xilnx Workspace/CPU/code/Adder_tb.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Adder_tb;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;

	// Outputs
	wire [31:0] Sum;

	// Instantiate the Unit Under Test (UUT)
	Adder uut (
		.A(A), 
		.B(B), 
		.Sum(Sum)
	);

	initial begin
		// Initialize Inputs
		A = 1;
		B = 2;
		
		#10;
		A = 4;
		B = 10;
        
		// Add stimulus here

	end
      
endmodule

