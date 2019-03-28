`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:29:06 02/02/2007 
// Design Name: 
// Module Name:    comparator_store 
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
module comparator_store(codein, code_no, program, compare);
    input [2:0] codein;
    input [1:0] code_no;
    input program;
    output [2:0] compare;
	 
	 //reg [2:0] compare;
	 
	 reg [2:0] codestore0 = 3'b001;
	 reg [2:0] codestore1 = 3'b010;
	 reg [2:0] codestore2 = 3'b100;
	 
	 always @(program or codein or code_no)
		begin
			if(program == 1'b1 && code_no == 0) codestore0 <= codein;
			else if(program == 1'b1 && code_no == 1) codestore1 <= codein;
			else if(program == 1'b1 && code_no == 2) codestore2 <= codein;
		end
		
	comparator comp0(codein, codestore0, compare[0]);
	comparator comp1(codein, codestore1, compare[1]);
	comparator comp2(codein, codestore2, compare[2]);
	
endmodule

//	BACKUP CODE
//	
// Change compare output to single output introduce reg compare
//	always @(program or codein or code_no)	
//		if(program == 1'b0 && code_no == 0 && codestore0 == codein) compare = 1'b1;
//		else if(program == 1'b0 && code_no == 1 && codestore1 == codein) compare = 1'b1;
//		else if(program == 1'b0 && code_no == 2 && codestore2 == codein) compare = 1'b1;
//		else compare = 1'b0;

