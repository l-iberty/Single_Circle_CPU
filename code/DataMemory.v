`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:51:40 12/16/2017 
// Design Name: 
// Module Name:    DataMemory 
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
module DataMemory(
	input Clk,
	input DmemWrite,
	input DmemRead,
	input [31:0] DmemAddr,
	input [31:0] DmemWrData,
	output [31:0] DmemRdData
    );
	 
reg [31:0] DataMem [0:255]; // memory space for stroing data: 256 * 32 bits

// initialize `DataMem` via filr "Data"
initial
begin
	$readmemh("Data", DataMem, 32'h0);
end

// write memory
always @(posedge Clk) //  ±÷”…œ…˝—ÿ
begin
	if (DmemWrite == 1'b1 && DmemRead == 1'b0) 
		DataMem[DmemAddr] <= DmemWrData;
end

// read memory
assign DmemRdData = (DmemWrite == 1'b0 && DmemRead == 1'b1) ? DataMem[DmemAddr] : 0;

endmodule
