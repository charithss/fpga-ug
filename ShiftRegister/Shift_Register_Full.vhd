--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:    18:31:38 08/05/06
-- Design Name:    
-- Module Name:    Shift_Register_Full - Behavioral
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

entity Shift_Register_Full is
    Port ( 
	 	CLK : in std_logic;
      reset : in std_logic;
      Din : in std_logic;
      Dout : out std_logic);
end Shift_Register_Full;

architecture dataflow of Shift_Register_Full is
signal DCM_OUT, DIVIDER_OUT	: std_logic;
 
component DCM1
	port(	  
		CLKIN_IN : in std_logic;
		RST_IN : in std_logic;          
		CLKFX_OUT : out std_logic;
		CLKIN_IBUFG_OUT : out std_logic;
		LOCKED_OUT : out std_logic
		);
end component;

component clk_div_8388k
  Port ( 
  		CLK : in std_logic;
      DIV_8388608 : out std_logic
		);

end component;	 

component shift_register
  Port ( 
  		serial_in : in std_logic;
      clk : inout std_logic;
      serial_out : out std_logic
		);
end component;

begin
 
Inst_DCM1: DCM1 PORT MAP(
		CLKIN_IN => CLK,
		RST_IN => not reset,
		CLKFX_OUT => DCM_OUT,
		CLKIN_IBUFG_OUT => open ,
		LOCKED_OUT => open
		);

Inst_clk_div_8388k: clk_div_8388k PORT MAP(
		CLK => DCM_OUT,
		DIV_8388608 => DIVIDER_OUT
		);

Inst_shift_register: shift_register PORT MAP(
		serial_in => not Din,
		clk => DIVIDER_OUT,
		serial_out => Dout
		);
					
end dataflow;
