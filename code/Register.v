`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:27:46 12/16/2017 
// Design Name: 
// Module Name:    Register 
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
module Register(
	input Clk,
	input [4:0] RegARdAddr,
	input [4:0] RegBRdAddr,
	input [4:0] RegWrAddr,
	input [31:0] RegWrData,
	input RegWrite,
	output [31:0] RegARdData,
	output [31:0] RegBRdData
    );

reg [31:0] regFile [0:31]; // 32 * 32 bits registers

initial
begin
	$readmemh("register", regFile, 32'h0);
end

// Write on falling clock edge
always @(negedge Clk)
begin
	if (RegWrite == 1'b1)
		regFile[RegWrAddr] <= RegWrData;
end
		
assign RegARdData = (RegARdAddr != 0) ? regFile[RegARdAddr] : 0;
assign RegBRdData = (RegBRdAddr != 0) ? regFile[RegBRdAddr] : 0;

endmodule
