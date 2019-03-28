--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:    12:56:18 04/05/06
-- Design Name:    
-- Module Name:    Adder4 - Structure
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

entity Adder2 is
    Port ( A : in bit_vector(1 downto 0);
           B : in bit_vector(1 downto 0);
           Ci : in bit;
           S : out bit_vector(1 downto 0);  			  
           Co : out bit);
			  
end Adder2;

architecture Structure of Adder2 is
component FullAdder
	port(X,Y,Cin :in bit;
			Cout, Sum:out bit);
end component;

Signal C: bit;

begin
FA0 : FullAdder port map (A(0), B(0), Ci, C, S(0));
FA1 : FullAdder port map (A(1), B(1), C, Co, S(1));

end Structure;	 