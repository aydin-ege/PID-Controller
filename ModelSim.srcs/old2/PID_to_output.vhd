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
            i_P_result : in STD_LOGIC_VECTOR(31 DOWNTO 0);
            i_I_result : in STD_LOGIC_VECTOR(31 DOWNTO 0);
            i_D_result : in STD_LOGIC_VECTOR(31 DOWNTO 0);
            o_output : out STD_LOGIC_VECTOR(11 DOWNTO 0);
            o_overflow : out STD_LOGIC --TODO
        );
end PID_to_output;

architecture Behavioral of PID_to_output is
    signal s_P, s_I, s_D : sfixed(13 downto -18);
    signal s_p_overflow, s_n_overflow : Boolean := False;
begin
    s_P <= to_sfixed(i_P_result, s_P);
    s_I <= to_sfixed(i_I_result, s_I);
    s_D <= to_sfixed(i_D_result, s_D);
    s_p_overflow <= s_P + s_I + s_D > 4095;
    s_n_overflow <= s_P + s_I + s_D < -4096;
    o_overflow <= '1' when s_p_overflow or s_n_overflow else '0';
    o_output <= x"FFF" when s_p_overflow else x"000" when s_n_overflow else to_slv(resize(s_P + s_I + s_D, 11, 0));
    
end Behavioral;
