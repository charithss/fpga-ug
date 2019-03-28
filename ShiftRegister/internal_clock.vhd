--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:    18:20:16 07/27/06
-- Design Name:    
-- Module Name:    internal_clock - Behavioral
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

entity internal_clock is
    Port ( clock : out std_logic);
end internal_clock;

architecture Behavioral of internal_clock is

begin
	clkk :Process (clock)
	begin
	clock <='1' after 100ns;
	if (clock='0') then
		clock <='1' after 100ns;
	else
		clock <='0'after 100ns;
	end if;
	end process clkk;
			  
end Behavioral;
