`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:57:47 12/22/2017 
// Design Name: 
// Module Name:    Extend 
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
module Extend(
	input [15:0] Imm,
	input SignExt,
	output [31:0] DataExt
    );

assign DataExt = (SignExt == 1'b1) ? {{16{Imm[15]}}, Imm[15:0]} : {16'b0, Imm[15:0]};

endmodule
