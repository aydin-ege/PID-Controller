----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/25/2020 10:09:10 PM
-- Design Name: 
-- Module Name: derivative - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments: 53 cycles (some ops are in parallel so not exactly 53)
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library floatfixlib;
use floatfixlib.fixed_pkg.all;

entity derivative is

    Generic ( 
        g_cutoff : sfixed(13 downto -18);
        g_clk_frequency : integer;
        g_ADC_range : sfixed(13 downto -18) 
    );
    Port (
        i_adc_clk : in STD_LOGIC;
        i_error : in STD_LOGIC_VECTOR (31 downto 0);
        i_kd : in STD_LOGIC_VECTOR (31 downto 0);
        o_D_result : out STD_LOGIC_VECTOR (31 downto 0);
        o_failure : out STD_LOGIC 
    );
        
    constant c_ADC_step_voltage : sfixed(13 downto -50) := resize(g_ADC_range/4096, 13, -50);
    constant c_clk_period : sfixed(13 downto -50) := resize(1/to_sfixed(g_clk_frequency, 31, 0), 13, -50);
    constant c_Nk : sfixed(27 downto -68) := g_cutoff * c_ADC_step_voltage;
    constant c_T_over_k : sfixed(13 downto -50) :=  resize(c_clk_period / c_ADC_step_voltage, 13, -50);
end derivative;

architecture Behavioral of derivative is
    signal s_integrated_output : sfixed(27 downto -50):= (others => '0');
    signal s_scaled_error : sfixed(27 downto -36):= (others => '0');
    signal s_kd, s_error : sfixed(13 downto -18):= (others => '0');
    signal s_cutoff_input, s_cutoff_output : sfixed(27 downto -50):= (others => '0');
    signal s_overflow_1, s_overflow_2, s_overflow_3 : STD_LOGIC;
begin
   
    s_kd <= to_sfixed(i_kd, s_kd);
    s_error <= to_sfixed(i_error, s_error);
    s_scaled_error <= s_kd * s_error;                                                                       --s_scaled 27.36 bits
    s_cutoff_input <= resize(s_scaled_error - s_integrated_output, s_cutoff_input);                         --Loop subtraction
    o_D_result <= to_slv(resize(s_cutoff_output,13,-18));
    
    process(i_adc_clk)
    begin
        if rising_edge(i_adc_clk) then
            s_cutoff_output <= resize(s_cutoff_input * c_Nk, s_cutoff_output);                                     --s_Kcutoff 27,50 bits 
        end if;
        if falling_edge(i_adc_clk) then                
            s_integrated_output <= resize(s_integrated_output + s_cutoff_output*c_T_over_k, s_integrated_output);             --Integration    
        end if;
    end process;

 
    
    
    s_overflow_1 <= '1' when s_scaled_error > 4095 or s_scaled_error < -4096 else '0';     -- These are prob wrong check later
    s_overflow_2 <= '1' when s_cutoff_output > 4095 or s_cutoff_output < -4096 else '0';
    s_overflow_3 <= '1' when s_cutoff_output > 4095 or s_cutoff_output < -4096 else '0';
    o_failure <= s_overflow_1 or s_overflow_2 or s_overflow_3;
end Behavioral;
