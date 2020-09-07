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
library ieee_proposed;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee_proposed.fixed_pkg.all;

entity top_module is
    Generic(
        g_max_accumulator_n : integer;
        g_max_accumulator_d : integer;
        g_min_accumulator_n : integer;
        g_min_accumulator_d : integer;
        g_ADC_range_n : integer;
        g_ADC_range_d : integer;
        g_cutoff_n : integer;
        g_cutoff_d : integer;
        g_ADC_frequency : integer
    );
    
    Port ( 
        i_clk : in STD_LOGIC;
        i_adc_clk : in STD_LOGIC;
        i_reset : in STD_LOGIC;
        i_feedback : in STD_LOGIC_VECTOR (11 downto 0);
        i_reference : in STD_LOGIC_VECTOR (11 downto 0);
        i_kp : in STD_LOGIC_VECTOR (31 downto 0);
        i_ki : in STD_LOGIC_VECTOR (31 downto 0);
        i_kd : in STD_LOGIC_VECTOR (31 downto 0);
        o_output : out STD_LOGIC_VECTOR (31 downto 0);
        o_overflow : out STD_LOGIC
    );
    
    constant c_max_accumulator : sfixed(13 downto -18):= resize(to_sfixed(g_max_accumulator_n, 31, 0) / to_sfixed(g_max_accumulator_n, 31, 0), 13, -18 );
    constant c_min_accumulator : sfixed(13 downto -18):= resize(to_sfixed(g_min_accumulator_n, 31, 0) / to_sfixed(g_min_accumulator_n, 31, 0), 13, -18 );
    constant c_ADC_range : ufixed(7 downto -8):= resize(to_ufixed(g_ADC_range_n, 31, 0) / to_ufixed(g_ADC_range_d, 31, 0), 7, -8 );
    constant c_cutoff : ufixed(13 downto -18) := resize(to_ufixed(g_cutoff_n, 31, 0) / to_ufixed(g_cutoff_d, 31, 0), 13, -18 );
  
end top_module;

architecture RTL of top_module is 
    signal s_error : STD_LOGIC_VECTOR(12 downto 0) := (others => '0'); 
    signal s_P_result, s_I_result, s_D_result : STD_LOGIC_VECTOR(31 DOWNTO 0):= (others => '0');
    signal s_P_overflow, s_D_overflow : STD_LOGIC := '0';
begin 
    o_overflow <= s_P_overflow or s_D_overflow;
    
    process(i_clk)
    begin
        if rising_edge(i_clk) then
            s_error <= to_slv(to_sfixed(i_reference, 11, 0) - to_sfixed(i_feedback, 11, 0));
        end if;
    end process;
        
    Proportional : entity work.proportional(RTL)
        Generic map ( g_ADC_range => c_ADC_range)
        port map(
            i_clk => i_clk,
            i_adc_clk => i_adc_clk,
            i_reset => i_reset,
            i_error => s_error,
            i_kp => i_kp,
            o_P_result => s_P_result,
            o_overflow => s_P_overflow
        );
        
    Integral : entity work.integral(RTL)
        generic map ( 
            g_max_accumulator => c_max_accumulator,
            g_min_accumulator => c_min_accumulator,
            g_ADC_range => c_ADC_range,
            g_clk_frequency => g_ADC_frequency
        )
        port map(
            i_clk => i_clk,
            i_adc_clk => i_adc_clk,
            i_reset => i_reset,
            i_error => s_error,
            i_ki => i_ki,
            o_I_result => s_I_result
        ); 
    
    Derivative : entity work.derivative (RTL)
        generic map (
            g_cutoff => c_cutoff,
            g_clk_frequency => g_ADC_frequency,
            g_ADC_range => c_ADC_range 
        )
        port map ( 
            i_clk => i_clk,
            i_adc_clk => i_adc_clk,
            i_reset => i_reset,
            i_error => s_error,
            i_kd => i_kd,
            o_D_result => s_D_result,
            o_overflow => s_D_overflow
        );
                 
    PID_sum : entity work.PID_to_output(RTL)
        port map (
            i_adc_clk => i_adc_clk,
            i_P_result => s_P_result,
            i_I_result => s_I_result,
            i_D_result => s_D_result,
            o_output => o_output
        );
               

end RTL;
