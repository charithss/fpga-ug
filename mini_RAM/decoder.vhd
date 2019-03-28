--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:    17:24:05 07/26/06
-- Design Name:    
-- Module Name:    decoder - data_flow
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

entity decoder is
    Port ( A0 : in std_logic;
           A1 : in std_logic;
           D0 : out std_logic;
           D1 : out std_logic;
           D2 : out std_logic;
           D3 : out std_logic);
end decoder;

architecture data_flow of decoder is

begin
	D0 <= (not A0) and (not A1);
	D1 <= (not A0) and (A1);
	D2 <= (A0) and (not A1);
	D3 <= (A0) and (A1);

end data_flow;
