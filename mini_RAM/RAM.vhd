--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:    17:29:49 07/26/06
-- Design Name:    
-- Module Name:    RAM - Behavioral
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

entity RAM is
    Port ( A0 : in std_logic;
           A1 : in std_logic;
           RW : in std_logic;
           D_in0 : in std_logic;
           D_in1 : in std_logic;
           D_out0 : out std_logic;
           D_out1 : out std_logic);
end RAM;

architecture data_flow of RAM is
signal w : std_logic_vector(0 to 3);
signal o : std_logic_vector(0 to 7);

component binary_cell
	Port ( CS : in std_logic;
          RW : in std_logic;
          D_in : in std_logic;
          D_out : out std_logic);
end component;

component decoder
	Port ( A0 : in std_logic;
          A1 : in std_logic;
          D0 : out std_logic;
          D1 : out std_logic;
          D2 : out std_logic;
          D3 : out std_logic);
end component;
	

begin
	decoder1 : decoder port map (A0, A1, w(0), w(1), w(2), w(3));
	bc0_0 : binary_cell port map (w(0), RW, D_in0, o(0));
	bc0_1 : binary_cell port map (w(0), RW, D_in1, o(1));
	bc1_0 : binary_cell port map (w(1), RW, D_in0, o(2));
	bc1_1 : binary_cell port map (w(1), RW, D_in1, o(3));
	bc2_0 : binary_cell port map (w(2), RW, D_in0, o(4));
	bc2_1 : binary_cell port map (w(2), RW, D_in1, o(5));
	bc3_0 : binary_cell port map (w(3), RW, D_in0, o(6));
	bc3_1 : binary_cell port map (w(3), RW, D_in1, o(7));

	D_out0 <= o(0) OR o(2) OR o(4) OR o(6);
	D_out1 <= o(1) OR o(3) OR o(5) OR o(7);


end data_flow;
