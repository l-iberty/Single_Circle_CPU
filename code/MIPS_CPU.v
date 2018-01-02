`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:15:43 12/22/2017 
// Design Name: 
// Module Name:    MIPS_CPU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MIPS_CPU(
	input ClkIn,
	input Rst,
	output [31:0] PCResult,
	output [31:0] ALUResult
	);

//// Misc ////
reg [31:0] PC;
reg [31:0] NextPC;
wire Clk;

//// Control ////
// inputs
wire [5:0] OpCode;
wire [5:0] Func;
wire ZeroCtl;
// outputs
wire RegDst;
wire ALUSrc;
wire Mem2Reg;
wire RegWriteOut;
wire MemWrite;
wire MemRead;
wire Branch;
wire [3:0] ALUControl;
wire Jump;
wire ExtOp;

//// ALU ////
// inputs
wire [31:0] SrcA;
wire [31:0] SrcB;
wire [3:0] ALU_Opt;
// outputs
wire Zero;
wire [31:0] ALU_Res;

//// Register ////
// inputs
wire [4:0] RegARdAddr;
wire [4:0] RegBRdAddr;
wire [4:0] RegWrAddr;
wire [31:0] RegWrData;
wire RegWriteIn;
// outputs
wire [31:0] RegARdData;
wire [31:0] RegBRdData;

//// InstructMemory ////
// inputs
wire [31:0] ImemRdAddr;
// outputs
wire [31:0] Instruct;

//// DataMemory ////
// inputs
wire DmemWrite;
wire DmemRead;
wire [31:0] DmemAddr;
wire [31:0] DmemWrData;
// outputs
wire [31:0] DmemRdData;

//// Extend ////
// inputs
wire [15:0] Imm;
wire SignExt;
// outputs
wire [31:0] DataExt;

//// Left_2_Shifter ////
// outputs
wire [31:0] OutBrOffset; // BEQ指令中的"E(imm)<<2"
wire [31:0] OutJAddr; // J-Type指令中的"address<<2"

//// Adder ////
// outputs
wire [31:0] PCPlus4;
wire [31:0] PCBranch;

//// Union ////
// outputs
wire [31:0] PCJump;

	// Clock
	assign Clk = ClkIn;
	
	Control Control (
		.OpCode(OpCode), 
		.Func(Func), 
		.Zero(ZeroCtl),
		.RegDst(RegDst), 
		.ALUSrc(ALUSrc), 
		.Mem2Reg(Mem2Reg), 
		.RegWrite(RegWriteOut), 
		.MemWrite(MemWrite), 
		.MemRead(MemRead), 
		.Branch(Branch), 
		.ALUControl(ALUControl), 
		.Jump(Jump), 
		.ExtOp(ExtOp)
	);
	
	ALU ALU(
		.SrcA(SrcA), 
		.SrcB(SrcB), 
		.ALU_Opt(ALU_Opt), 
		.Zero(Zero), 
		.ALU_Res(ALU_Res)
	);

	Register Register(
		.Clk(Clk), 
		.RegARdAddr(RegARdAddr), 
		.RegBRdAddr(RegBRdAddr), 
		.RegWrAddr(RegWrAddr), 
		.RegWrData(RegWrData), 
		.RegWrite(RegWriteIn), 
		.RegARdData(RegARdData), 
		.RegBRdData(RegBRdData)
	);
	
	InstructMemory InstructMemory (
		.ImemRdAddr(ImemRdAddr), 
		.Instruct(Instruct)
	);
	
	DataMemory DataMemory (
		.Clk(Clk), 
		.DmemWrite(DmemWrite), 
		.DmemRead(DmemRead), 
		.DmemAddr(DmemAddr), 
		.DmemWrData(DmemWrData), 
		.DmemRdData(DmemRdData)
	);
	
	Extend Extend (
		.Imm(Imm), 
		.SignExt(SignExt), 
		.DataExt(DataExt)
	);
	
	// PC <- PC + 4
	Adder PCPlus4_Adder (
		.A(PC),
		.B(4),
		.Sum(PCPlus4)
	);
	
	// 用于BEQ指令: PC <- PCPlus4 + E(imm)<<2
	Adder PCBranch_Adder (
		.A(PCPlus4),
		.B(OutBrOffset),
		.Sum(PCBranch)
	);
	
	// 用于BEQ指令的"E(imm)<<2"
	Left_2_Shifter L2S_Imm (
		.InputData(DataExt), 
		.OutputData(OutBrOffset)
	);
	
	// 用于J型指令扩展address
	Left_2_Shifter L2S_Addr (
		.InputData({6'b000000, Instruct[25:0]}),
		.OutputData(OutJAddr)
	);
	
	// J型指令输出 {PCPlus4[31:28], OutJAddr[27:0]}
	Union Union (
		.PC(PCPlus4), 
		.AddrShiftered(OutJAddr), 
		.PCJump(PCJump)
	);
	
	//// inputs of Control ////
	assign OpCode = Instruct[31:26];
	assign Func = Instruct[5:0];
	assign ZeroCtl = Zero;
	
	//// inputs of ALU ////
	assign SrcA = RegARdData;
	// ALUSrc = 1 选通符号扩展器的输出
	// ALUSrc = 0 选通寄存器堆的B端口的输出
	assign SrcB = (ALUSrc == 1'b1) ? DataExt : RegBRdData;
	assign ALU_Opt = ALUControl;
	
	//// inputs of Register ////
	assign RegARdAddr = Instruct[25:21]; // rs
	assign RegBRdAddr = Instruct[20:16]; // rt
	// RegDst = 1 选通rt
	// RegDst = 0 选通rd
	assign RegWrAddr = (RegDst == 1'b1) ? Instruct[20:16] : Instruct[15:11];
	// Mem2Reg = 1 Mem读出
	// Mem2Reg = 0 ALU输出
	assign RegWrData = (Mem2Reg == 1'b1) ? DmemRdData : ALU_Res;
	assign RegWriteIn = RegWriteOut;
	
	//// inputs of InstructMemory ////
	assign ImemRdAddr = PC;
	
	//// inputs of DataMemory ////
	assign DmemAddr = ALU_Res;
	assign DmemWrData = RegBRdData;
	assign DmemWrite = MemWrite;
	assign DmemRead = MemRead;
	
	//// inputs of Extend ////
	assign Imm = Instruct[15:0];
	assign SignExt = ExtOp;
	
	always @(*)
	begin
		if (Jump)
			NextPC = PCJump;
		else if (Branch) // BEQ or BNE
			NextPC = PCBranch;
		else
			NextPC = PCPlus4;
	end
	
	always @(negedge Clk or posedge Rst)
	begin
		if (Rst)
			PC = 32'hFFFFFFFC;
		else
			PC = NextPC;
	end
	
	assign PCResult = PC;
	assign ALUResult = ALU_Res;

endmodule
