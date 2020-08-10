----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/10/2020 02:31:13 PM
-- Design Name: 
-- Module Name: derivative_tb - Behavioral
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
library ieee_proposed;
use ieee_proposed.fixed_pkg.all;

entity derivative_tb is
end derivative_tb;

architecture Behavioral of derivative_tb is
    signal clk, adc_clk : STD_LOGIC := '0';
    signal s_result, kd, error : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
begin
    clk <= not clk after 10ns;
    adc_clk <= not adc_clk after 20ns;
    error <= to_slv(to_sfixed(1, 13, -18)), to_slv(to_sfixed(2, 13, -18)) after 100ns, to_slv(to_sfixed(-3, 13, -18)) after 200ns,  to_slv(to_sfixed(9, 13, -18)) after 200000ns;
    kd <= to_slv(to_sfixed(1, 13, -18)), to_slv(to_sfixed(0.333333, 13, -18)) after 5000ns;
    
    Derivative : entity work.derivative(Behavioral)
        Generic map( 
            g_cutoff => to_slv(to_sfixed(1, 13, -18))
        )
        Port map( 
            i_clk => clk,
            i_adc_clk => adc_clk,
            i_error => error,
            i_kd => kd,
            o_D_result => s_result
        );

end Behavioral;
