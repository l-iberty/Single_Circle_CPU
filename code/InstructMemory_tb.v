`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:22:03 12/16/2017
// Design Name:   InstructMemory
// Module Name:   E:/Xilnx Workspace/CPU/code/InstructMemory_tb.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InstructMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module InstructMemory_tb;

	// Inputs
	reg [31:0] ImemRdAddr;

	// Outputs
	wire [31:0] Instruct;

	// Instantiate the Unit Under Test (UUT)
	InstructMemory uut (
		.ImemRdAddr(ImemRdAddr), 
		.Instruct(Instruct)
	);
	
reg [7:0] index;
	initial begin
		// Initialize Inputs
		ImemRdAddr = 0;
		index = 0;

		// Wait 10 ns for global reset to finish
		#10;
		for (index = 0;index < (256 / 4);index = index + 4)
			begin
			#5 ImemRdAddr <= index;
			end
        
		// Add stimulus here

	end
      
endmodule

