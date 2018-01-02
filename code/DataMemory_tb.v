`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:11:02 12/16/2017
// Design Name:   DataMemory
// Module Name:   E:/Xilnx Workspace/CPU/code/DataMemory_tb.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DataMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DataMemory_tb;

	// Inputs
	reg Clk;
	reg DmemWrite;
	reg DmemRead;
	reg [31:0] DmemAddr;
	reg [31:0] DmemWrData;

	// Outputs
	wire [31:0] DmemRdData;

	// Instantiate the Unit Under Test (UUT)
	DataMemory uut (
		.Clk(Clk), 
		.DmemWrite(DmemWrite), 
		.DmemRead(DmemRead), 
		.DmemAddr(DmemAddr), 
		.DmemWrData(DmemWrData), 
		.DmemRdData(DmemRdData)
	);
reg [7:0] index;
	initial begin
		// Initialize Inputs
		Clk = 0;
		DmemWrite = 0;
		DmemRead = 0;
		DmemAddr = 0;
		DmemWrData = 0;

		// read data from memory
		DmemWrite = 1'b0;
		DmemRead = 1'b1;
		for (index = 0;index < 8;index = index + 1)
			begin
			#10;
			DmemAddr <= index;
			end
			
		// write data into memory
		DmemWrite = 1'b1;
		DmemRead = 1'b0;
		for (index = 0;index < 8;index = index + 1)
			begin
			#10;
			DmemAddr <= index;
			DmemWrData <= index + 1;
			end
      
		// read data from memory(检查写内存的结果)
		DmemWrite = 1'b0;
		DmemRead = 1'b1;
		for (index = 0;index < 8;index = index + 1)
			begin
			#10;
			DmemAddr <= index;
			end
	end
// Clock generator
always #2 Clk = !Clk;
      
endmodule

