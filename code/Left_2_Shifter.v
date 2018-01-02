`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:43:19 12/22/2017 
// Design Name: 
// Module Name:    Left_2_Shifter 
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
module Left_2_Shifter(
	input [31:0] InputData,
	output [31:0] OutputData
    );
assign OutputData = {InputData[29:0], 2'b00};

endmodule
