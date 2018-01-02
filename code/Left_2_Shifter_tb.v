`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:47:38 12/22/2017
// Design Name:   Left_2_Shifter
// Module Name:   E:/Xilnx Workspace/CPU/code/Left_2_Shifter_tb.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Left_2_Shifter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Left_2_Shifter_tb;

	// Inputs
	reg [31:0] InputData;

	// Outputs
	wire [31:0] OutputData;

	// Instantiate the Unit Under Test (UUT)
	Left_2_Shifter uut (
		.InputData(InputData), 
		.OutputData(OutputData)
	);

	initial begin
		// Initialize Inputs
		InputData = 32'h00000001;

		#50;
		InputData = 32'h000000FF;
		
		#50;
		InputData = 32'h80000010;
        
		// Add stimulus here

	end
      
endmodule

