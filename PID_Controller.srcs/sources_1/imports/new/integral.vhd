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
library ieee_proposed;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee_proposed.fixed_pkg.all;


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

    COMPONENT mult_gen_2
        PORT (
            CLK : IN STD_LOGIC;
            A : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            SCLR : IN STD_LOGIC;
            P : OUT STD_LOGIC_VECTOR(44 DOWNTO 0)
        );
    END COMPONENT; 
    COMPONENT mult_gen_3
        PORT (
            CLK : IN STD_LOGIC;
            A : IN STD_LOGIC_VECTOR(44 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            SCLR : IN STD_LOGIC;
            P : OUT STD_LOGIC_VECTOR(76 DOWNTO 0)
        );
    END COMPONENT;
    
    signal s_mult_0 : STD_LOGIC_VECTOR(44 downto 0) := (others => '0'); --26 downto -18
    signal s_mult_1 : STD_LOGIC_VECTOR(76 downto 0) := (others => '0'); --10 downto -66
    
    signal s_new_data : sfixed(10 downto -50) := (others => '0');
    signal s_integral_buffer : sfixed(13 downto -50) := (others => '0');
    signal s_set_integral_0, s_set_integral_1, s_set_integral_2 , s_set_integral_old : STD_LOGIC := '0';
    signal s_future_integral : sfixed(13 downto -50) := (others => '0');
    signal s_max_overflow, s_min_overflow : boolean := false;
begin     
    
    mult_0 : mult_gen_2
    PORT MAP (
        CLK => i_clk,
        A => i_error,
        B => i_ki,
        SCLR => i_reset,
        P => s_mult_0
    );
    mult_1 : mult_gen_3
    PORT MAP (
        CLK => i_clk,
        A => s_mult_0,
        B => c_integral_constant,
        SCLR => i_reset,
        P => s_mult_1
    );
    s_new_data <= resize(to_sfixed(s_mult_1, 10, -66), s_new_data, false, false); 
    
    process(i_clk)
    begin
        if rising_edge(i_clk) then
            s_future_integral <= resize(s_integral_buffer + s_new_data, s_future_integral, false, false);
            s_max_overflow <= resize(s_future_integral, 13, -18, false, false) > g_max_accumulator;
            s_min_overflow <= resize(s_future_integral, 13, -18, false, false) < g_min_accumulator;
            
            s_set_integral_1 <= s_set_integral_0;
            s_set_integral_2 <= s_set_integral_1;
            
            if s_set_integral_2 /= s_set_integral_old then
                s_set_integral_old <= s_set_integral_2;
                if not s_max_overflow then
                    if not s_min_overflow then
                        s_integral_buffer <= s_future_integral;
                    else
                        s_integral_buffer <= resize(g_min_accumulator, s_integral_buffer, false, false);
                    end if;
                else
                    s_integral_buffer <= resize(g_max_accumulator, s_integral_buffer, false, false); 
                end if;
            end if;
            
        end if;
    end process;
    

    process(i_adc_clk)
    begin
        if rising_edge(i_adc_clk) then
            s_set_integral_0 <= not s_set_integral_0;
        end if;
    end process;
    
    
    o_I_result <= to_slv(resize(s_integral_buffer, 13, -18, false, false));
end RTL;
