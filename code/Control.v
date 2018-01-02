`timescale 1ns / 1ps

`define AND_CTL	4'b0000
`define OR_CTL		4'b0001
`define ADD_CTL	4'b0010
`define SUB_CTL	4'b0110
`define SLT_CTL	4'b0111 // С������1
`define NOR_CTL	4'b1100
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:45:20 12/21/2017 
// Design Name: 
// Module Name:    MainControl 
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
module Control(
	input [5:0] OpCode,
	input [5:0] Func,
	input Zero,
	output reg RegDst,
	output reg ALUSrc,
	output reg Mem2Reg,
	output reg RegWrite,
	output reg MemWrite,
	output reg MemRead,
	output reg Branch,
	output reg [3:0] ALUControl,
	output reg Jump,
	output reg ExtOp
    );
	 
reg [3:0] ALUOp;
reg Rtype;
reg Beq;
reg Bne;

always @(OpCode)
begin
	case (OpCode)
		// R type
		// $rd <- $rs op $rt
		6'b000000:
		begin
			RegDst = 0; // rd
			ALUSrc = 0; // �Ĵ����ѵ�����˿�B
			Mem2Reg = 0; // ALU���
			RegWrite = 1; // �����д�ؼĴ�����
			MemWrite = 0;
			MemRead = 0;
			Beq = 0;
			Bne = 0;
			Jump = 0;
			ExtOp = 0;
			Rtype = 1;
		end
		
		// addi rt, rs, imm
		// $rt <- $rs + E(imm)
		6'b001000:
		begin
			RegDst = 1; // rt
			ALUSrc = 1; // Extend���
			Mem2Reg = 0;
			RegWrite = 1;
			MemWrite = 0;
			MemRead = 0;
			Beq = 0;
			Bne = 0;
			Jump = 0;
			ExtOp = 1;
			ALUOp = `ADD_CTL;
			Rtype = 0;
		end
		
		// andi rt, rs, imm
		// $rt <- $rs AND E(imm)
		6'b001100:
		begin
			RegDst = 1; // ѡͨ rt
			ALUSrc = 1; // ѡͨ������չ�������
			Mem2Reg = 0;
			RegWrite = 1; // �����д�ؼĴ�����
			MemWrite = 0;
			MemRead = 0;
			Beq = 0;
			Bne = 0;
			Jump = 0;
			ExtOp = 1; // ������չ
			ALUOp = `AND_CTL;
			Rtype = 0;
		end
		
		// ori rt, rs, imm
		// $rt <- $rs OR E(imm)
		6'b001101:
		begin
			RegDst = 1; // ѡͨ rt
			ALUSrc = 1; // ѡͨ������չ�������
			Mem2Reg = 0;
			RegWrite = 1; // �����д�ؼĴ�����
			MemWrite = 0;
			MemRead = 0;
			Beq = 0;
			Bne = 0;
			Jump = 0;
			ExtOp = 1; // ������չ
			ALUOp = `OR_CTL;
			Rtype = 0;
		end
		
		// lw rt, imm(rs)
		// $rt <- Mem[$rs + E(imm)]
		6'b100011:
		begin
			RegDst = 1; // ѡͨ rt
			ALUSrc = 1; // ѡͨ������չ�������
			Mem2Reg = 1; // ѡͨDataMemory��RD�˿ڵ����
			RegWrite = 1; // �����д�ؼĴ�����
			MemWrite = 0;
			MemRead = 1; // ���ڴ�
			Beq = 0;
			Bne = 0;
			Jump = 0;
			ExtOp = 1; // ������չ
			ALUOp = `ADD_CTL;
			Rtype = 0;
		end
		
		// sw rt, imm(rs)
		// Mem[$rs + E(imm)] <- $rt
		6'b101011:
		begin
			RegDst = 0;
			ALUSrc = 1; // ѡͨ������չ�������
			Mem2Reg = 0;
			RegWrite = 0;
			MemWrite = 1; // д�ڴ�
			MemRead = 0;
			Beq = 0;
			Bne = 0;
			Jump = 0;
			ExtOp = 1; // ������չ
			ALUOp = `ADD_CTL;
			Rtype = 0;
		end
		
		// beq rs, rt, imm
		// if ($rs == $rt)
		// then PC <- PC + 4 + E(imm)<<2
		6'b000100:
		begin
			RegDst = 0;
			ALUSrc = 0; // ѡͨ�Ĵ����ѵ�����˿�B
			Mem2Reg = 0;
			RegWrite = 0;
			MemWrite = 0;
			MemRead = 0;
			Beq = 1;
			Bne = 0;
			Jump = 0;
			ExtOp = 1; // ������չ
			ALUOp = `SUB_CTL; // $rs-$rt, ����0��־λ
			Rtype = 0;
		end
		
		// bne rs, rt, imm
		// if ($rs != $rt)
		// then PC <- PC + 4 + E(imm)<<2
		6'b000101:
		begin
			RegDst = 0;
			ALUSrc = 0; // ѡͨ�Ĵ����ѵ�����˿�B
			Mem2Reg = 0;
			RegWrite = 0;
			MemWrite = 0;
			MemRead = 0;
			Beq = 0;
			Bne = 1;
			Jump = 0;
			ExtOp = 1; // ������չ
			ALUOp = `SUB_CTL; // $rs-$rt, ����0��־λ
			Rtype = 0;
		end
		
		// j address
		// PC <- (PC+4)[31:28] U (address<<2)
		6'b000010:
		begin
			RegDst = 0;
			ALUSrc = 0;
			Mem2Reg = 0;
			RegWrite = 0;
			MemWrite = 0;
			MemRead = 0;
			Beq = 0;
			Bne = 0;
			Jump = 1;
			ExtOp = 0;
			ALUOp = 0;
			Rtype = 0;
		end
	endcase
	
	Branch = (~Zero & ~Beq & Bne) | (Zero & Beq & ~Bne);
	
end

always @(ALUOp or Func or Rtype)
begin
	if (Rtype)
	begin
		case (Func) // �ж�Rָ���Func�ֶ�
			6'b100000: ALUControl = `ADD_CTL;
			6'b100010: ALUControl = `SUB_CTL;
			6'b100100: ALUControl = `AND_CTL;
			6'b100101: ALUControl = `OR_CTL;
			6'b101010: ALUControl = `SLT_CTL;
			6'b100111: ALUControl = `NOR_CTL;
		endcase
	end
	else
		ALUControl = ALUOp;
end

endmodule
