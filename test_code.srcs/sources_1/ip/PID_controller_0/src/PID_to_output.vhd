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
library ieee_proposed;
use ieee_proposed.fixed_pkg.all;

entity PID_to_output is
    Port (  i_clk : in STD_LOGIC;
            i_ADC_clk : in STD_LOGIC;
            i_P_result : in STD_LOGIC_VECTOR(31 DOWNTO 0);
            i_I_result : in STD_LOGIC_VECTOR(31 DOWNTO 0);
            i_D_result : in STD_LOGIC_VECTOR(31 DOWNTO 0);
            o_output : out STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
end PID_to_output;

architecture RTL of PID_to_output is
    signal s_sync_0, s_sync_1, s_sync_2 , s_sync_old : STD_LOGIC := '0';
    signal s_P, s_I, s_D : sfixed(13 downto -18) := (others => '0');
    signal s_future_output : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
begin
    s_P <= to_sfixed(i_P_result, s_P);
    s_I <= to_sfixed(i_I_result, s_I);
    s_D <= to_sfixed(i_D_result, s_D);
    
    process(i_clk)
    begin
        if rising_edge(i_clk) then
            s_future_output <=  to_slv(resize(s_P + s_I + s_D, 13, -18,false,false));
            s_sync_1 <= s_sync_0;
            s_sync_2 <= s_sync_1;
            if s_sync_2 /= s_sync_old then
                s_sync_old <= s_sync_2;
                o_output <= s_future_output;
            end if;
        end if;
    end process;
    
    process(i_adc_clk)
    begin
        if rising_edge(i_adc_clk) then
            s_sync_0 <= not s_sync_0;
        end if;
    end process;
end RTL;
