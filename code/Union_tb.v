`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:45:24 12/22/2017
// Design Name:   Union
// Module Name:   E:/Xilnx Workspace/CPU/code/Union_tb.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Union
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Union_tb;

	// Inputs
	reg [31:0] PC;
	reg [31:0] AddrShiftered;

	// Outputs
	wire [31:0] PCJump;

	// Instantiate the Unit Under Test (UUT)
	Union uut (
		.PC(PC), 
		.AddrShiftered(AddrShiftered), 
		.PCJump(PCJump)
	);

	initial begin
		// Initialize Inputs
		PC = 32'h80FFFFFF;
		AddrShiftered = 32'hAABBCCDD;
		
		// PCJump should be 0x8ABBCCDD

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

