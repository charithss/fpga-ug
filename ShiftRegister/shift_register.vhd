--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:    17:53:15 07/27/06
-- Design Name:    
-- Module Name:    shift_register - Behavioral
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

entity shift_register is
    Port ( serial_in : in std_logic;
           clk : inout std_logic;
           serial_out : out std_logic);

end shift_register;

architecture dataflow of shift_register is
signal Q1, Q2, Q3  : std_logic;

component D_ff
		Port ( D : in std_logic;
           cclk : in std_logic;
           Q : out std_logic);
end component;


begin

	dff1 : D_ff port map (serial_in, clk, Q1);
	dff2 : D_ff port map (Q1, clk, Q2);
	dff3 : D_ff port map (Q2, clk, Q3);
	dff4 : D_ff port map (Q3, clk, serial_out);	

end dataflow;
