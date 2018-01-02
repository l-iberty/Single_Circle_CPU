`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:38:31 12/16/2017
// Design Name:   Register
// Module Name:   E:/Xilnx Workspace/CPU/code/Register_tb.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Register_tb;

	// Inputs
	reg Clk;
	reg [4:0] RegARdAddr;
	reg [4:0] RegBRdAddr;
	reg [4:0] RegWrAddr;
	reg [31:0] RegWrData;
	reg RegWrite;

	// Outputs
	wire [31:0] RegARdData;
	wire [31:0] RegBRdData;

	// Instantiate the Unit Under Test (UUT)
	Register uut (
		.Clk(Clk), 
		.RegARdAddr(RegARdAddr), 
		.RegBRdAddr(RegBRdAddr), 
		.RegWrAddr(RegWrAddr), 
		.RegWrData(RegWrData), 
		.RegWrite(RegWrite), 
		.RegARdData(RegARdData), 
		.RegBRdData(RegBRdData)
	);
	
reg [7:0] RegIndex;
	initial begin
		// Initialize Inputs
		Clk = 0;
		RegARdAddr = 0;
		RegBRdAddr = 0;
		RegWrAddr = 0;
		RegWrData = 0;
		RegWrite = 0;

		// read from register-heap
		RegWrite = 1'b0;
		for (RegIndex = 1;RegIndex <= 5'b11111;RegIndex = RegIndex + 1)
			begin
			#10; // Wait for 10ns
			RegARdAddr <= RegIndex;
			RegBRdAddr <= RegIndex;
			end
			
		// write into register-heap
		RegWrite = 1'b1;
		for (RegIndex = 1;RegIndex <= 5'b11111;RegIndex = RegIndex + 1)
			begin
			#10;
			RegWrAddr <= RegIndex;
			RegWrData <= RegIndex;
			end;
			
		// read again and check out
		RegWrite = 1'b0;
		for (RegIndex = 1;RegIndex <= 5'b11111;RegIndex = RegIndex + 1)
			begin
			#10;
			RegARdAddr <= RegIndex;
			RegBRdAddr <= RegIndex;
			end
	end
// Clock generator
always #2 Clk = !Clk;

endmodule

