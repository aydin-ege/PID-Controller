----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/15/2020 07:06:35 PM
-- Design Name: 
-- Module Name: top_module_tb - Behavioral
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

entity top_module_tb is
end top_module_tb;

architecture Behavioral of top_module_tb is
    signal clk : STD_LOGIC := '0';
    signal feedback, s_output : STD_LOGIC_VECTOR(11 downto 0) := x"000";
begin
    clk <= not clk after 10ns;
    feedback <= x"007", x"008" after 100ns, x"002" after 200ns, x"003" after 300ns, x"005" after 400ns;
    top_module_inst : entity work.top_module(Behavioral)
        port map(
            i_adc_clk => clk, 
            i_feedback => feedback,
            i_reference => x"005",
            i_kp => to_slv(to_sfixed(2,13,-18)),
            i_ki => to_slv(to_sfixed(0,13,-18)),
            i_kd => to_slv(to_sfixed(0,13,-18)),
            o_output => s_output
        );

end Behavioral;
