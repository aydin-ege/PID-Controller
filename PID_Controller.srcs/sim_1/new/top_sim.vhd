

library IEEE;
library ieee_proposed;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee_proposed.fixed_pkg.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_sim is
    Port (
    i_clk : in STD_LOGIC;
    i_adc_clk : in STD_LOGIC;
    i_reset : in STD_LOGIC;
    i_reference : in STD_LOGIC_VECTOR (11 downto 0);
    o_overflow : out STD_LOGIC;
    o_output : out STD_LOGIC_VECTOR(11 downto 0)
    );
end top_sim;

architecture Behavioral of top_sim is

    component Plant_sim 
        Port ( 
            i_input : in STD_LOGIC_VECTOR(11 downto 0);
            o_output : out STD_LOGIC_VECTOR(11 downto 0)
        );
    end component;
    
    component PID_to_Plant
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
        end component;

    signal s_feedback, s_referance, s_DAC_output : STD_LOGIC_VECTOR (11 downto 0);
    signal s_PID_output : STD_LOGIC_VECTOR (31 downto 0);
    signal s_overflow : STD_LOGIC;
begin

    top_module : entity work.top_module(RTL)
        Generic map(
            g_max_accumulator_n => 1000,
            g_max_accumulator_d => 1,
            g_min_accumulator_n => -1000,
            g_min_accumulator_d => 1,
            g_ADC_range_n => 10,
            g_ADC_range_d => 1,
            g_cutoff_n => 30,
            g_cutoff_d => 1,
            g_ADC_frequency => 100000
        )
        Port map ( 
            i_clk => i_clk,
            i_adc_clk => i_adc_clk,
            i_reset => i_reset,
            i_feedback => s_feedback,
            i_reference => s_referance,
            i_kp => to_slv(to_sfixed(0.158364770198146, 13, -18)),
            i_ki => to_slv(to_sfixed(15.8364770198146, 13, -18)),
            i_kd => to_slv(to_sfixed(0, 13, -18)),
            o_output => s_PID_output,
            o_overflow => s_overflow
        );
        
        
    PID_to_DAC : PID_to_Plant
        Generic map(
            g_ADC_range_n => 10,
            g_ADC_range_d => 1
        )
        Port map ( 
            i_clk => i_clk,
            i_adc_clk => i_adc_clk,
            i_overflow => s_overflow,
            i_input => s_PID_output,
            o_output => s_DAC_output
        );
        
    Plant : Plant_sim
        Port map ( 
            i_input => s_DAC_output,
            o_output =>  s_feedback
        );
        o_output <= s_feedback;
end Behavioral;
