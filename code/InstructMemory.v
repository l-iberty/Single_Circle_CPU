`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:05:39 12/16/2017 
// Design Name: 
// Module Name:    InstructMemory 
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
module InstructMemory(
	input [31:0] ImemRdAddr,
	output reg [31:0] Instruct
    );
	 
reg [31:0] InstMem [0:255]; // memory space for stroing instructions 256 * 32 bits

// initialize `InstMem` via file "Instruction"
initial
begin
	$readmemh("Instruction", InstMem, 32'h0);
end

always @(ImemRdAddr)
begin
	Instruct <= InstMem[ImemRdAddr >> 2]; // 右移2位的目的：InstMem每个元素4字节, 为了实现按字节编址, 使PC+4能正确寻址
end

endmodule
