----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/09/2020 07:12:34 PM
-- Design Name: 
-- Module Name: proportional_tb - Behavioral
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

entity proportional_tb is
end proportional_tb;

architecture Behavioral of proportional_tb is
    signal clk : STD_LOGIC := '0';
    signal s_result, kp, error : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
begin
    clk <= not clk after 10ns;
    error <= to_slv(to_sfixed(1, 13, -18)), to_slv(to_sfixed(2, 13, -18)) after 100ns, to_slv(to_sfixed(-3, 13, -18)) after 200ns,  to_slv(to_sfixed(9, 13, -18)) after 700ns;
    kp <= to_slv(to_sfixed(1, 13, -18)), to_slv(to_sfixed(0.333333, 13, -18)) after 140ns, to_slv(to_sfixed(-2, 13, -18)) after 280ns, to_slv(to_sfixed(0.1, 13, -18)) after 400ns;
    
    Proportional : entity work.proportional(Behavioral)
        Port map( 
            i_clk => clk,
            i_error => error,
            i_kp => kp,
            o_P_result => s_result
        );

end Behavioral;
