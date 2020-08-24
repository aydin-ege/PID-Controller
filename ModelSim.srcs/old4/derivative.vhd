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
        g_cutoff : ufixed(13 downto -18);   -- This is N
        g_clk_frequency : integer;          -- This is F
        g_ADC_range : ufixed(7 downto -8)   -- This is ADC
    );
    Port (
        i_clk : in STD_LOGIC;
        i_adc_clk : in STD_LOGIC;
        i_reset : in STD_LOGIC;
        i_error : in STD_LOGIC_VECTOR (12 downto 0);
        i_kd : in STD_LOGIC_VECTOR (31 downto 0);
        o_D_result : out STD_LOGIC_VECTOR (31 downto 0);
        o_overflow : out STD_LOGIC 
    );
    
    constant c_clk_frequency : ufixed(28 downto 0) := resize(to_ufixed(g_clk_frequency, 31, 0), 28, 0);
    constant c_N_times_ADC : ufixed(21 downto -26) := g_cutoff * g_ADC_range; --before dividing by 4096
    constant c_Nk_ufixed : ufixed(9 downto -38) := to_ufixed(to_slv(c_N_times_ADC), 9, -38);-- N*ADC/4096
    constant c_Nk : STD_LOGIC_VECTOR(47 downto 0) := to_slv(c_Nk_ufixed); 
    
    constant c_f_times_ADC : ufixed(36 downto -8) := c_clk_frequency*g_ADC_range;
    constant c_reciprocal_fADC : ufixed(8 downto -37) := to_ufixed(1, 0, 0)/c_f_times_ADC; --1/(f*ADC)
    --constant c_integral_constant_ufixed : ufixed(20 downto -25) := to_ufixed(to_slv(c_reciprocal_fADC), 20, -25); --4096/(f*adc)
    --constant c_integral_constant : STD_LOGIC_VECTOR(24 downto 0) := to_slv(resize(c_integral_constant_ufixed, -1, -25)); -- f*adc > 4096 so this is less than 1.
	constant c_integral_constant : STD_LOGIC_VECTOR(24 downto 0) := to_slv(resize(shift_left(resize(c_reciprocal_fADC, 20, -37), 12), -1, -25));
end derivative;

architecture RTL of derivative is
   
    signal s_mult_0 : STD_LOGIC_VECTOR(44 downto 0) := (others => '0'); --26 downto -18
    signal s_mult_1 : STD_LOGIC_VECTOR(93 downto 0) := (others => '0'); --38 downto -56
    signal s_mult_2 : STD_LOGIC_VECTOR(56 downto 0) := (others => '0'); --13 downto -43
    signal s_scaled_error : sfixed(26 downto -18):= (others => '0');
    signal s_cutoff_input : sfixed(27 downto -18):= (others => '0');
    signal s_cutoff_output : sfixed(13 downto -18):= (others => '0');
    signal s_sum_input : sfixed(13 downto -43) := (others => '0');
    signal s_integral_buffer : sfixed(13 downto -43) := (others => '0');
    signal s_integral_output : sfixed(13 downto -18) := (others => '0');
    
begin
   	s_mult_0 <= std_logic_vector(signed(i_error)*signed(i_kd));
    s_scaled_error <= to_sfixed(s_mult_0, s_scaled_error);
    
    process(i_clk)
    begin
        if rising_edge(i_clk) then    
            s_cutoff_input <= s_scaled_error - s_integral_output;
        end if;
    end process;
   
	s_mult_1 <= std_logic_vector(signed(to_slv(s_cutoff_input))*signed(c_Nk));   
    
    s_cutoff_output <= resize(to_sfixed(s_mult_1, 37, -56), s_cutoff_output);
    o_D_result <= to_slv(s_cutoff_output);
    
	s_mult_2 <= std_logic_vector(signed(to_slv(s_cutoff_output))*signed(c_integral_constant));   
    
    s_sum_input <= to_sfixed(s_mult_2, 13, -43); --DELETE RESIZE
    
    process(i_adc_clk)
    begin
        if rising_edge(i_adc_clk) then
            s_integral_buffer <= resize(s_integral_buffer + s_sum_input, s_integral_buffer);
        end if;
    end process;
	
	s_integral_output <= resize(s_integral_buffer, s_integral_output); --ADD LINE
    
    o_overflow <= '1' when s_cutoff_output /= to_sfixed(s_mult_1, 37, -56) or s_sum_input /= to_sfixed(s_mult_2, 33, -43) else '0';

end RTL;