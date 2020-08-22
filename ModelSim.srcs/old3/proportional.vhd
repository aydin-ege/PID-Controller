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
    Generic ( g_ADC_range : sfixed(13 downto -18) );
    Port ( i_adc_clk : in STD_LOGIC;
           i_error : in STD_LOGIC_VECTOR (31 downto 0);
           i_kp : in STD_LOGIC_VECTOR (31 downto 0);
           o_P_result : out STD_LOGIC_VECTOR (31 downto 0);
           o_overflow : out STD_LOGIC);
    constant c_ADC_step_voltage : sfixed(13 downto -50) := resize(g_ADC_range / 4096, 13, -50);
end proportional;

architecture Behavioral of proportional is   
    signal s_scaled_error : sfixed(27 downto -68) := (others => '0'); 
    signal s_P_result : sfixed(13 downto -18)  := (others => '0');
begin
        
    o_overflow <= '1' when s_P_result > 4095 or s_P_result < -4096 else '0';
    o_P_result <= to_slv(s_P_result);
    
    process(i_adc_clk)
    begin
        if rising_edge(i_adc_clk) then
            s_scaled_error <= to_sfixed(i_error, 13, -18)*c_ADC_step_voltage;    
            s_P_result <= resize(s_scaled_error*to_sfixed(i_kp, 13, -18), 13, -18);
        end if;
    end process;

end Behavioral;
