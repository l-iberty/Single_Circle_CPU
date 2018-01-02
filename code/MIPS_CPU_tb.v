`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:48:43 12/22/2017
// Design Name:   MIPS_CPU
// Module Name:   E:/Xilnx Workspace/CPU/code/MIPS_CPU_tb.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MIPS_CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MIPS_CPU_tb;

	// Inputs
	reg ClkIn;
	reg Rst;

	// Outputs
	wire [31:0] PCResult;
	wire [31:0] ALUResult;

	// Instantiate the Unit Under Test (UUT)
	MIPS_CPU uut (
		.ClkIn(ClkIn), 
		.Rst(Rst), 
		.PCResult(PCResult),
		.ALUResult(ALUResult)
	);

	initial begin
		// Initialize Inputs
		ClkIn = 0;
		Rst = 1;
		
		#10;
		Rst = 0;

		// Add stimulus here

	end
always #5 ClkIn = !ClkIn;      
endmodule

