--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:    17:02:53 07/26/06
-- Design Name:    
-- Module Name:    binary_cell - Behavioral
-- Project Name:   
-- Target Device:  
-- Tool versions:  
-- Description:
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity binary_cell is
    Port ( CS : in std_logic;
           RW : in std_logic;
           D_in : in std_logic;
           D_out : out std_logic);
end binary_cell;

architecture data_flow of binary_cell is
	signal	S1, R1, Q1: std_logic;

component sr_latch
	Port ( S : in std_logic;
          R : in std_logic;
          Q : inout std_logic);
end component;

begin
	S1 <= (not RW) and D_in and CS;
	R1 <= (not RW) and (not D_in) and CS;
	SRL1 : sr_latch port map (S1, R1, Q1);
	
	D_out <= CS and RW and Q1;


end data_flow;
