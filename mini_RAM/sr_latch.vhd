--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:    16:48:02 07/26/06
-- Design Name:    
-- Module Name:    sr_latch - Behavioral
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
           Q : inout std_logic);
end sr_latch;

architecture data_flow of sr_latch is

Signal Q_bar : std_logic;
begin
	Q <= NOT (R or Q_bar) after 6ns;
	Q_bar <= NOT (S or Q)after 6ns;

end data_flow;
