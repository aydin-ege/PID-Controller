----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/28/2020 08:35:33 AM
-- Design Name: 
-- Module Name: PID_to_output - Behavioral
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

entity PID_to_output is
    Port ( 
            i_ADC_clk : in STD_LOGIC;
            i_P_result : in STD_LOGIC_VECTOR(31 DOWNTO 0);
            i_I_result : in STD_LOGIC_VECTOR(31 DOWNTO 0);
            i_D_result : in STD_LOGIC_VECTOR(31 DOWNTO 0);
            o_output : out STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
end PID_to_output;

architecture RTL of PID_to_output is
    signal s_P, s_I, s_D : sfixed(13 downto -18);
begin
    s_P <= to_sfixed(i_P_result, s_P);
    s_I <= to_sfixed(i_I_result, s_I);
    s_D <= to_sfixed(i_D_result, s_D);
    process(i_ADC_clk)
    begin
        if rising_edge(i_ADC_clk) then
            o_output <= to_slv(resize(s_P + s_I + s_D, 13, -18));
        end if;
    end process;
    
end RTL;
