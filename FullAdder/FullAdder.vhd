--------------------------------------------------------------------------------
-- Company: 		 IERC
-- Engineer:		 Charith
--
-- Create Date:    12:47:58 04/05/06
-- Design Name:    Full Adder
-- Module Name:    FullAdder - Equations
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

entity FullAdder is
    Port ( X : in bit;
           Y : in bit;
           Cin : in bit;
           Cout : out bit;
           Sum : out bit);
end FullAdder;

architecture Equations of FullAdder is

begin
Sum <= X xor Y xor Cin after 10ns;
Cout <= (X and Y) or (X and Cin) or (Y and Cin) after 10ns;
end Equations;
