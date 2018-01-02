`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:39:02 12/22/2017 
// Design Name: 
// Module Name:    Union 
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
/**
 * ”√”⁄ J-Type ÷∏¡Ó£∫ PC <- {(PC + 4)[31:28], address<<2}
 */
module Union(
	input [31:0] PC,
	input [31:0] AddrShiftered,
	output [31:0] PCJump
    );
	 
assign PCJump = {PC[31:28], AddrShiftered[27:0]};

endmodule
