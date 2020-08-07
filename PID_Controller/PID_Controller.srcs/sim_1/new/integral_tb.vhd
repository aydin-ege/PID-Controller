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

entity integral_tb is
end integral_tb;

architecture Behavioral of integral_tb is
    signal i_clk, i_adc_clk : STD_LOGIC := '0';
    signal s_error_float : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
begin
    clk <= not clk after 10ns;
    
    Integral : entity work.integral(Behavioral)
        generic map ( g_max_accumulator => b"000" & x"AAAAAAA") --Change these later
        port map(
            i_clk => i_clk,
            i_adc_clk => i_adc_clk,
            i_error => s_error_float,
            i_error_tvalid => s_error_float_tvalid,
            i_ki => i_ki,
            i_ki_tvalid => i_ki_tvalid,
            o_I_result => s_I_result,
            o_I_tvalid => s_I_tvalid,
            i_I_tready => '1'
        ); 

end Behavioral;















