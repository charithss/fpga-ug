`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:38:39 02/04/2007 
// Design Name: 
// Module Name:    main_fsm 
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

// To do : output [write] to enable write to RAM......

module main_fsm(decode_in, program, enter, reset,CLK, code_no, enable, error);
	 input decode_in;
    input program;
    input CLK,enter,reset;
    output [1:0] code_no;
    output enable,error;
	 
	 parameter S_initial = 4'b0000, S_ok0 = 4'b0001, S_ok1 = 4'b0010,S_ok2 = 4'b0011, S_prog0 = 4'b0100,S_prog1 = 4'b0101,S_prog2 = 4'b0110, S_bad0 = 4'b0111,S_bad1 = 4'b1000,S_bad2 = 4'b1001;
	 
	 reg enable, error;
	 reg [1:0] code_no;
	 reg [3:0] state, nxtstate;
	 
	 initial
		begin
			state = 4'b0000;
			nxtstate = 4'b0000;
			enable = 1'b0;
		end
		 
	 always @(posedge CLK)								  // Current state block transition
		if (reset) state = S_initial;
		else state = nxtstate;
	
		
	always @(posedge enter or program or reset)   // Next state transition :: current state & inputs
		case (state)
		
			S_initial: if (decode_in == 1'b1 & ~program & enter) nxtstate = S_ok0;
						  else if (decode_in == 1'b0 & ~program) nxtstate = S_bad0;
			
			S_ok0: if (decode_in == 1'b1 & ~program & enter) nxtstate = S_ok1;
					 else if (decode_in == 1'b0 & ~program) nxtstate = S_bad1;
			
			S_ok1: if (decode_in == 1'b1 & ~program & enter) nxtstate = S_ok2;
					 else if (decode_in == 1'b0 & ~program) nxtstate = S_bad2;
			
			S_ok2: if (program) nxtstate = S_prog0;
					 else if (reset) nxtstate = S_initial;
					 
			S_prog0: if (program & enter) nxtstate = S_prog1;
			S_prog1: if (program & enter) nxtstate = S_prog2;
			S_prog2: if (program & enter) nxtstate = S_ok2;
			S_bad0: if (enter) nxtstate = S_bad1;
			S_bad1: if (enter) nxtstate = S_bad2;	
			
		endcase
			
			
	always @(state)		// Output conditioning state only needed
		case (state)
		
			S_initial: 
			begin
			code_no <= 2'b00;
			error <= 1'b0;
			enable <= 1'b0;
			end
			
			S_ok0: code_no = 2'b01;			
			S_ok1: code_no = 2'b10;				
			S_ok2: enable = 1'b1; 		
			S_prog0: code_no = 2'b00;			
			S_prog1: code_no = 2'b01;			
			S_prog2: code_no = 2'b10;			
			S_bad2: error = 1'b1;
			
		endcase			
			
endmodule
