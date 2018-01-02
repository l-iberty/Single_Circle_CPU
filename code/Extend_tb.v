`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:11:10 12/22/2017
// Design Name:   Extend
// Module Name:   E:/Xilnx Workspace/CPU/code/Extend_tb.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Extend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Extend_tb;

	// Inputs
	reg [15:0] Imm;
	reg SignExt;

	// Outputs
	wire [31:0] DataExt;

	// Instantiate the Unit Under Test (UUT)
	Extend uut (
		.Imm(Imm), 
		.SignExt(SignExt), 
		.DataExt(DataExt)
	);

	initial begin
		Imm = 16'h8000;
		SignExt = 0;
		
		#10;
		SignExt = 1;
        
		// Add stimulus here

	end
      
endmodule

