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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned value
use IEEE.NUMERIC_STD.ALL;
library floatfixlib;
use floatfixlib.fixed_pkg.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity integral is
    Generic ( 
        g_ADC_range : sfixed(13 downto -18);
        g_clk_frequency : integer;
        g_max_accumulator : sfixed (13 downto -18);
        g_min_accumulator : sfixed (13 downto -18)
    );
    Port ( 
        i_adc_clk : in STD_LOGIC;
        i_error : in STD_LOGIC_VECTOR (31 downto 0);
        i_ki : in STD_LOGIC_VECTOR (31 downto 0);
        o_I_result : out STD_LOGIC_VECTOR (31 downto 0)
    );
    constant c_ADC_step_voltage : sfixed(13 downto -50) := resize(g_ADC_range / 4096, 13, -50);
    constant c_clk_period : sfixed(13 downto -50) := resize(1/to_sfixed(g_clk_frequency, 31, 0), 13, -50);
    constant c_integral_constant : sfixed(13 downto -50) := resize(c_ADC_step_voltage*c_clk_period, 13, -50);
end integral;

architecture Behavioral of integral is    
    signal s_future_ACC : sfixed(14 downto -50) := (others => '0');
    signal s_ACC, s_error_constant_multiple  : sfixed(13 downto -50) := (others => '0');
    signal s_scaled_error : sfixed(27 downto -36) := (others => '0');
begin     
    s_future_ACC <= s_error_constant_multiple + s_ACC;
    process(i_adc_clk)
    begin
        if rising_edge(i_adc_clk) then
            s_scaled_error <= to_sfixed(i_error, 13, -18) * to_sfixed(i_ki, 13, -18); 
            s_error_constant_multiple <= resize(s_scaled_error * c_integral_constant, s_error_constant_multiple);
            if s_future_ACC < g_max_accumulator and s_future_ACC > g_min_accumulator then
                s_ACC <= resize(s_future_ACC, s_ACC);
            else
                if s_future_ACC < g_min_accumulator then
                    s_ACC <= resize(g_min_accumulator, s_ACC);
                else
                    s_ACC <= resize(g_max_accumulator, s_ACC); 
                end if;
            end if;
        end if;
    end process;
    o_I_result <= to_slv(resize(s_ACC, 13, -18));
end Behavioral;
