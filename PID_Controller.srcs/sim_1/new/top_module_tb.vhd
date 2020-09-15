----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/06/2020 03:49:51 PM
-- Design Name: 
-- Module Name: PID_tb - Behavioral
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
library IEEE_proposed;
use IEEE_proposed.fixed_pkg.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PID_tb is
end PID_tb;

architecture Behavioral of PID_tb is
    signal clk, adc_clk, o_overflow : STD_LOGIC := '0';
    signal plant_in : STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
    signal plant_out : STD_LOGIC_VECTOR(11 downto 0):= (others => '0');
    signal x : unsigned(11 downto 0) := (others => '0');
begin
    adc_clk <= not adc_clk after 5us;        
    clk <= not clk after 5ns;        
    process(adc_clk)
    begin
        if falling_edge(adc_clk) then
            x <= x + 1;
        end if;
    end process;
    plant_out <= std_logic_vector(x);
--    plant : entity work.Plant(rtl)
--      PORT map( 
--          clk => clk,
--          reset => '0',
--          clk_enable => '1',
--          Input => plant_in,     
--          Measured_Output => plant_out  
--          );
    PID : entity work.top_module(RTL)
        Generic map (
            g_max_accumulator_n => 1000,
            g_max_accumulator_d => 1,
            g_min_accumulator_n => -1000,
            g_min_accumulator_d => 1,
            g_ADC_range_n => 4096,
            g_ADC_range_d => 10000,
            g_cutoff_n => 100,
            g_cutoff_d => 1,
            g_ADC_frequency => 10000
        )
        PORT MAP (
          i_clk => clk,
          i_adc_clk => adc_clk,
          i_reset => '0',
          i_feedback => plant_out,
          i_reference => to_slv(to_sfixed(1, 11, 0)),
          i_kp => to_slv(to_sfixed(1, 13, -18)),
          i_ki => to_slv(to_sfixed(1, 13, -18)),
          i_kd => to_slv(to_sfixed(1, 13, -18)),
          o_output => plant_in,
          o_overflow => o_overflow
    );


end Behavioral;
