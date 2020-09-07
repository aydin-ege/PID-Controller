
library IEEE;
library ieee_proposed;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee_proposed.fixed_pkg.all;



entity PID_to_Plant is
    Generic(
        g_ADC_range_n : integer;
        g_ADC_range_d : integer
    );
    
    Port ( 
        i_clk : in STD_LOGIC;
        i_adc_clk : in STD_LOGIC;
        i_overflow : in STD_LOGIC;
        i_input : in STD_LOGIC_VECTOR (31 downto 0);
        o_output : out STD_LOGIC_VECTOR (11 downto 0)
    );
    constant c_ADC_range : ufixed(7 downto -8):= resize(to_ufixed(g_ADC_range_n, 31, 0) / to_ufixed(g_ADC_range_d, 31, 0), 7, -8 );
    constant c_DAC_max : ufixed(11 downto 0) := "111111111111";
    constant c_DAC_min : ufixed(11 downto 0) := (others => '0');
end PID_to_Plant;

architecture Behavioral of PID_to_Plant is

    signal s_input : ufixed(34 downto -13);

begin
    s_input <= (to_ufixed(i_input, 25, -6) / c_ADC_range);  --input multiplied by 4096 and divided with ADC range
    process(i_clk)
    begin
        if s_input > c_DAC_max then
            o_output <= to_slv(c_DAC_max);
        else
            o_output <= to_slv(resize(s_input, 11, 0, false, false));
        end if;
    end process;
end Behavioral;
