--------------------------------------------------------------------------------
-- Company: 		 Xilinx
--
-- Create Date:    12:38:25 01/27/05
-- Design Name:    Stopwatch
-- Module Name:    clk_div_262k - clk_div_262k_arch
-- Project Name:   ISE In Depth Tutorial
-- Target Device:  xc3s200-4ft256
-- Tool versions:  ISE 7.1i
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

entity clk_div_8388k is
    Port ( CLK : in std_logic;
           DIV_8388608 : out std_logic);
end clk_div_8388k;	  


architecture clk_div_8388k_arch of clk_div_8388k is

  signal div_32, div_1024, div_32768, div_262144 : std_logic_vector (15 downto 0);
  signal temp_div_8388608 : std_logic_vector (3 downto 0);
  signal div_32_clk, div_1024_clk, div_32768_clk, div_262144_clk : std_logic;

begin

  process (CLK)
  begin
    if CLK'event and CLK='1' then
      div_32 <= div_32(14 downto 0) & not div_32(15);
    end if;
  end process;

  div_32_clk <= div_32(15);

  process (div_32_clk)
  begin
    if div_32_clk'event and div_32_clk='1' then
      div_1024 <= div_1024(14 downto 0) & not div_1024(15);
    end if;
  end process;

  div_1024_clk <= div_1024(15);

  process (div_1024_clk)
  begin
    if div_1024_clk'event and div_1024_clk='1' then
      div_32768 <= div_32768(14 downto 0) & not div_32768(15);
    end if;
  end process;

  div_32768_clk <= div_32768(15);

  process (div_32768_clk)
  begin
    if div_32768_clk'event and div_32768_clk='1' then
      div_262144 <= div_262144(14 downto 0) & not div_262144(15);
    end if;
  end process;

  div_262144_clk <= div_262144(15);		

  process (div_262144_clk)
  begin
    if div_262144_clk'event and div_262144_clk='1' then
      temp_div_8388608 <= temp_div_8388608(2 downto 0) & not temp_div_8388608(3);
    end if;
  end process;

  DIV_8388608 <= temp_div_8388608(3); 


end clk_div_8388k_arch;
