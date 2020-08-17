----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/25/2020 06:25:09 PM
-- Design Name: 
-- Module Name: top_module - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;
library floatfixlib;
use floatfixlib.fixed_pkg.all;


entity proportional is
    Port ( i_adc_clk : in STD_LOGIC;
           i_error : in STD_LOGIC_VECTOR (31 downto 0);
           i_kp : in STD_LOGIC_VECTOR (31 downto 0);
           o_P_result : out STD_LOGIC_VECTOR (31 downto 0);
           o_overflow : out STD_LOGIC);
end proportional;

architecture Behavioral of proportional is
    signal s_P_result : STD_LOGIC_VECTOR (63 downto 0)  := (others => '0');
begin

      
    o_overflow <= '1' when to_sfixed(s_P_result, 27, -36) > to_sfixed(4095, 27, -36) or to_sfixed(s_P_result, 27, -36) < to_sfixed(-4096, 27, -36) else '0';
        
    process(i_adc_clk)
    begin
		if rising_edge(i_adc_clk) then
			s_P_result <= to_slv(to_sfixed(i_kp, 13, -18) * to_sfixed(i_error, 13, -18));
		end if;
        if falling_edge(i_adc_clk) then       
            o_P_result <= to_slv(resize(to_sfixed(s_P_result, 27, -36), 13, -18));
        end if;
    end process;

end Behavioral;
