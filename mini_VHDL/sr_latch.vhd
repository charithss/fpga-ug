--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:    13:49:40 07/25/06
-- Design Name:    
-- Module Name:    sr_latch - data_flow
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

entity sr_latch is
    Port ( S : in std_logic;
           R : in std_logic;
           Q_bar : out std_logic;
           Q : out std_logic);
end sr_latch;

architecture behav of sr_latch is
begin
process (S, R)							  
	variable Q_temp, Q_bar_temp: std_logic;
begin
   if S = '1' then
		if R = '0' then
			Q_temp := '1';
			Q_bar_temp := '0';
		else
			Q_temp := Q_temp;
			Q_bar_temp := Q_bar_temp;
		end if;
	else
		if R = '0' then
			Q_temp := '0';
			Q_bar_temp := '0';
		else
			Q_temp := '0';
			Q_bar_temp := '1';
		end if;
	end if;

	Q <= Q_temp;
	Q_bar <= Q_bar_temp;
end process; 
	

end behav;

