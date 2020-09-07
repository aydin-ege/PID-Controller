-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 7.9.2020 17:55:35 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_top_sim is
end tb_top_sim;

architecture tb of tb_top_sim is

    component top_sim
        port (i_clk       : in std_logic;
              i_adc_clk   : in std_logic;
              i_reset     : in std_logic;
              i_reference : in std_logic_vector (11 downto 0);
              o_overflow  : out std_logic;
              o_output : out STD_LOGIC_VECTOR(11 downto 0));
    end component;

    signal i_clk       : std_logic := '0';
    signal i_adc_clk   : std_logic:= '0';
    signal i_reset     : std_logic:= '0';
    signal i_reference, o_output : std_logic_vector (11 downto 0):= (others => '0');
    signal o_overflow  : std_logic:= '0';

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : top_sim
    port map (i_clk       => i_clk,
              i_adc_clk   => i_adc_clk,
              i_reset     => i_reset,
              i_reference => i_reference,
              o_overflow  => o_overflow,
              o_output => o_output);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that i_clk is really your main clock signal
    i_clk <= TbClock;
    i_adc_clk <= not i_adc_clk after 10 us;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed

        -- Reset generation
        -- EDIT: Check that i_reset is really your reset signal
        i_reset <= '1';
        wait for 100 ns;
        i_reset <= '0';
        wait for 100 ns;
        
        i_reference <= "000011110000";
        
        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_top_sim of tb_top_sim is
    for tb
    end for;
end cfg_tb_top_sim;