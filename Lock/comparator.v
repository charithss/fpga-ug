`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:00:23 02/02/2007 
// Design Name: 
// Module Name:    comparator 
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
module comparator(codein, coderetrive, compare);
    input [2:0] codein;
    input [2:0] coderetrive;
    output compare;
	 
	 reg compare;
	 
	 always @(codein or coderetrive)
		begin
			if(coderetrive == codein) compare = 1'b1;
			else compare = 1'b0;
		end

endmodule