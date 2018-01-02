`timescale 1ns / 1ps

`define AND_CTL	4'b0000
`define OR_CTL		4'b0001
`define ADD_CTL	4'b0010
`define SUB_CTL	4'b0110
`define SLT_CTL	4'b0111 // –°”⁄‘Ú÷√1
`define NOR_CTL	4'b1100
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:43:50 12/16/2017
// Design Name:   ALU
// Module Name:   E:/Xilnx Workspace/CPU/code/ALU_tb.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

	// Inputs
	reg [31:0] SrcA;
	reg [31:0] SrcB;
	reg [3:0] ALU_Opt;

	// Outputs
	wire Zero;
	wire [31:0] ALU_Res;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.SrcA(SrcA), 
		.SrcB(SrcB), 
		.ALU_Opt(ALU_Opt), 
		.Zero(Zero), 
		.ALU_Res(ALU_Res)
	);

initial
	begin
		// Initialize Inputs
		SrcA = 32'hf0f0ffff;
		SrcB = 32'h0000f0f0;
		ALU_Opt = `AND_CTL;
		
		#10;
		ALU_Opt = `OR_CTL;
		
		#10;
		ALU_Opt = `ADD_CTL;
		
		#10;
		ALU_Opt = `SUB_CTL;
		
		#10;
		ALU_Opt = `SLT_CTL;
		
		#10;
		ALU_Opt = `NOR_CTL;
	end
      
endmodule

