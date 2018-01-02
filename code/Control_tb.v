`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:03:13 12/21/2017
// Design Name:   Control
// Module Name:   E:/Xilnx Workspace/CPU/code/Control_tb.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Control_tb;

	// Inputs
	reg [5:0] OpCode;
	reg [5:0] Func;
	reg Zero;

	// Outputs
	wire RegDst;
	wire ALUSrc;
	wire Mem2Reg;
	wire RegWrite;
	wire MemWrite;
	wire MemRead;
	wire Branch;
	wire [3:0] ALUControl;
	wire Jump;
	wire ExtOp;

	// Instantiate the Unit Under Test (UUT)
	Control uut (
		.OpCode(OpCode), 
		.Func(Func), 
		.Zero(Zero),
		.RegDst(RegDst), 
		.ALUSrc(ALUSrc), 
		.Mem2Reg(Mem2Reg), 
		.RegWrite(RegWrite), 
		.MemWrite(MemWrite), 
		.MemRead(MemRead), 
		.Branch(Branch), 
		.ALUControl(ALUControl), 
		.Jump(Jump), 
		.ExtOp(ExtOp)
	);

	initial begin
		Zero = 1'b0;
		
		// R-Type ADD
		OpCode = 6'b000000;
		Func = 6'b100000;
		
		// R-Type SUB
		#10;
		OpCode = 6'b000000;
		Func = 6'b100010;

		// I-Type ORI
		#10;
		OpCode = 6'b001101;
      Func = 6'bxxxxxx;
		
		// I-Type LW
		#10;
		OpCode = 6'b100011;
      Func = 6'bxxxxxx;
		
		// I-Type SW
		#10;
		OpCode = 6'b101011;
      Func = 6'bxxxxxx;
		
		// I-Type BEQ
		#10;
		OpCode = 6'b000100;
      Func = 6'bxxxxxx;
		Zero = 1'b1;
		
		// J-Type J
		#10;
		OpCode = 6'b000010;
		Func = 6'bxxxxxx;
		
		// Add stimulus here

	end
      
endmodule

