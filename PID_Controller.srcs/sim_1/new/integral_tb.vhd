----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/03/2020 05:16:24 PM
-- Design Name: 
-- Module Name: integral_tb - Behavioral
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
use ieee.fixed_pkg.all;

entity integral_tb is
end integral_tb;

architecture Behavioral of integral_tb is
    signal clk, i_adc_clk : STD_LOGIC := '0';
    signal s_result : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
begin
    clk <= not clk after 10ns;
    
    Integral : entity work.integral(Behavioral)
        Generic map( 
            g_max_accumulator => to_sfixed(1000, 13, -18),
            g_min_accumulator => to_sfixed(-1000, 13, -18)
        )
        Port map( 
            i_clk => clk,
            i_adc_clk => clk,
            i_error => to_slv(to_sfixed(1, 13, -18)),
            i_ki => to_slv(to_sfixed(1, 13, -18)),
            o_I_result => s_result
        );

end Behavioral;















