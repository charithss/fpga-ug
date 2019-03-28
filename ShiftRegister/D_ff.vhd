--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:    17:06:53 07/27/06
-- Design Name:    
-- Module Name:    D_ff - Behavioral
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

entity D_ff is
    Port ( D : in std_logic;
           cclk : in std_logic;
           Q : out std_logic);
end D_ff;

architecture Behavioral of D_ff is
		signal temp: std_logic;
begin
		dff:process (cclk)
		begin
			if (cclk'event and cclk='1') then
				temp <= D;
			end if;
		end process dff;

		Q <= temp;

end Behavioral;

