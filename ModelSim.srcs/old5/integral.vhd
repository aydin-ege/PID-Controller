----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/25/2020 10:09:10 PM
-- Design Name: 
-- Module Name: integral - Behavioral
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


entity integral is
    Generic ( 
        g_ADC_range : ufixed(7 downto -8);
        g_clk_frequency : integer;
        g_max_accumulator : sfixed (13 downto -18);
        g_min_accumulator : sfixed (13 downto -18)
    );
    Port ( 
        i_clk : in STD_LOGIC;
        i_adc_clk : in STD_LOGIC;
        i_reset : in STD_LOGIC;
        i_error : in STD_LOGIC_VECTOR (12 downto 0);
        i_ki : in STD_LOGIC_VECTOR (31 downto 0);
        o_I_result : out STD_LOGIC_VECTOR (31 downto 0)
    );
    constant c_clk_frequency : ufixed(27 downto 0) := resize(to_ufixed(g_clk_frequency, 31, 0), 27, 0);
    constant c_before_dividing : ufixed(8 downto -35) := g_ADC_range/c_clk_frequency; --/4096
    constant c_integral_constant_ufixed : ufixed(-16 downto -47) :=  to_ufixed(to_slv(resize(c_before_dividing, -4, -35)), -16, -47);
    constant c_integral_constant : STD_LOGIC_VECTOR(31 downto 0) := to_slv(c_integral_constant_ufixed);
end integral;

architecture RTL of integral is   
    
    signal s_mult_0 : STD_LOGIC_VECTOR(44 downto 0) := (others => '0'); --26 downto -18
    signal s_mult_1 : STD_LOGIC_VECTOR(76 downto 0) := (others => '0'); --10 downto -66
    
    signal s_new_data : sfixed(10 downto -66) := (others => '0');
    signal s_integral_buffer : sfixed(13 downto -66) := (others => '0');
    signal s_future_integral : sfixed(14 downto -66) := (others => '0');
begin     
    
	s_mult_0 <= std_logic_vector(signed(i_error)*signed(i_ki));
	s_mult_1 <= std_logic_vector(signed(s_mult_0)*signed(c_integral_constant));
    s_new_data <= to_sfixed(s_mult_1, 10, -66); 
    
    process(i_clk)
    begin
        if rising_edge(i_clk) then
            s_future_integral <= s_integral_buffer + s_new_data;
        end if;
    end process;
    
    
    process(i_adc_clk)
    begin
        if rising_edge(i_adc_clk) then
            if s_future_integral < g_max_accumulator and s_future_integral > g_min_accumulator then
                s_integral_buffer <= resize(s_future_integral, s_integral_buffer);
            else
                if s_future_integral < g_min_accumulator then
                    s_integral_buffer <= resize(g_min_accumulator, s_integral_buffer);
                else
                    s_integral_buffer <= resize(g_max_accumulator, s_integral_buffer); 
                end if;
            end if;
        end if;
    end process;
    o_I_result <= to_slv(resize(s_integral_buffer, 13, -18));
end RTL;
