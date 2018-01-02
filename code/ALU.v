`timescale 1ns / 1ps

`define AND_CTL	4'b0000
`define OR_CTL		4'b0001
`define ADD_CTL	4'b0010
`define SUB_CTL	4'b0110
`define SLT_CTL	4'b0111 // –°”⁄‘Ú÷√1
`define NOR_CTL	4'b1100
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:15:16 12/16/2017 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
	input [31:0] SrcA,
	input [31:0] SrcB,
	input [3:0] ALU_Opt,
	output Zero,
	output reg [31:0] ALU_Res
    );
	 
assign Zero = (ALU_Res == 1'b0);

always @(SrcA or SrcB or ALU_Opt)
begin
	casex (ALU_Opt)
		`AND_CTL:	ALU_Res = SrcA & SrcB;
		`OR_CTL:		ALU_Res = SrcA | SrcB;
		`ADD_CTL:	ALU_Res = SrcA + SrcB;
		`SUB_CTL:	ALU_Res = SrcA - SrcB;
		`SLT_CTL:	ALU_Res = (SrcA < SrcB) ? 1 : 0;
		`NOR_CTL:	ALU_Res = ~(SrcA | SrcB);
	default:
		ALU_Res = 32'h0;
	endcase
end

endmodule
