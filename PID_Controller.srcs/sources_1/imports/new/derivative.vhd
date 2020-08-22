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
library ieee_proposed;
use ieee_proposed.fixed_pkg.all;

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
    constant c_Nk_ufixed : ufixed(9 downto -37) := resize(to_ufixed(to_slv(c_N_times_ADC), 9, -38), 9, -37);-- N*ADC/4096
    constant c_Nk : STD_LOGIC_VECTOR(46 downto 0) := to_slv(c_Nk_ufixed); 
    
    constant c_f_times_ADC : ufixed(36 downto -8) := c_clk_frequency*g_ADC_range;
    constant c_reciprocal_fADC : ufixed(8 downto -37) := to_ufixed(1, 0, 0)/c_f_times_ADC; --1/(f*ADC)
    constant c_integral_constant_ufixed : ufixed(20 downto -25) := to_ufixed(to_slv(c_reciprocal_fADC), 20, -25); --4096/(f*adc)
    constant c_integral_constant : STD_LOGIC_VECTOR(24 downto 0) := to_slv(resize(c_integral_constant_ufixed, -1, -25)); -- f*adc > 4096 so this is less than 1.
end derivative;

architecture RTL of derivative is

    COMPONENT mult_gen_2
        PORT (
            CLK : IN STD_LOGIC;
            A : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            SCLR : IN STD_LOGIC;
            P : OUT STD_LOGIC_VECTOR(44 DOWNTO 0)
        );
    END COMPONENT; 
    
    COMPONENT mult_gen_4
        PORT (
            CLK : IN STD_LOGIC;
            A : IN STD_LOGIC_VECTOR(45 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR(46 DOWNTO 0);
            SCLR : IN STD_LOGIC;
            P : OUT STD_LOGIC_VECTOR(92 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT mult_gen_5
        PORT (
            CLK : IN STD_LOGIC;
            A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
            SCLR : IN STD_LOGIC;
            P : OUT STD_LOGIC_VECTOR(56 DOWNTO 0)
        );
    END COMPONENT;
    
    signal s_mult_0 : STD_LOGIC_VECTOR(44 downto 0) := (others => '0'); --26 downto -18
    signal s_mult_1 : STD_LOGIC_VECTOR(92 downto 0) := (others => '0'); --38 downto -55
    signal s_mult_2 : STD_LOGIC_VECTOR(56 downto 0) := (others => '0'); --13 downto -43
    signal s_scaled_error : sfixed(26 downto -18):= (others => '0');
    signal s_cutoff_input : sfixed(27 downto -18):= (others => '0');
    signal s_cutoff_output, s_integral_input : sfixed(13 downto -18):= (others => '0');
    signal s_sum_input : sfixed(13 downto -43) := (others => '0');
    signal s_integral_buffer, s_future_integral : sfixed(13 downto -43) := (others => '0');
    signal s_integral_output : sfixed(13 downto -18) := (others => '0');
begin
   
    mult_kd : mult_gen_2
    PORT MAP (
        CLK => i_clk,
        A => i_error,
        B => i_kd,
        SCLR => i_reset,
        P => s_mult_0
    );
    s_scaled_error <= to_sfixed(s_mult_0, s_scaled_error);
    
    process(i_clk, i_adc_clk)
        variable v_set_buffer : boolean := true;
    begin
        if rising_edge(i_clk) then    
            s_cutoff_input <= s_scaled_error - s_integral_output;
            s_future_integral <= resize(s_integral_buffer + s_sum_input, s_future_integral);
            if v_set_buffer then
                s_integral_buffer <= s_future_integral;
                v_set_buffer := false;
            end if;
        end if;
        if rising_edge(i_adc_clk) then
            v_set_buffer := true;
        end if;
    end process;
   
    mult_Nk : mult_gen_4
    PORT MAP (
        CLK => i_clk,
        A => to_slv(s_cutoff_input),
        B => c_Nk,
        SCLR => i_reset,
        P => s_mult_1
    );    
    
    s_cutoff_output <= resize(to_sfixed(s_mult_1, 37, -55), s_cutoff_output);
    o_D_result <= to_slv(s_cutoff_output);
    s_integral_input <= s_cutoff_output; -- I tried pipelining this but nothing worked
    
    mult_integral : mult_gen_5
    PORT MAP (
        CLK => i_clk,
        A => to_slv(s_integral_input),
        B => c_integral_constant,
        SCLR => i_reset,
        P => s_mult_2
    ); 
    
    s_sum_input <= to_sfixed(s_mult_2, 13, -43);
    
    s_integral_output <= resize(s_integral_buffer, s_integral_output);
    o_overflow <= '1' when s_cutoff_output /= to_sfixed(s_mult_1, 37, -56) or s_sum_input /= to_sfixed(s_mult_2, 33, -43) else '0';

end RTL;
