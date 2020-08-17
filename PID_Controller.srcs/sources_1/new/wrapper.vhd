----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/09/2020 02:49:16 PM
-- Design Name: 
-- Module Name: wrapper - Behavioral
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
library ieee_proposed;
use ieee_proposed.fixed_pkg.all;

entity wrapper is
    Port ( 
        clk_pin_p : in STD_LOGIC;
        clk_pin_n : in STD_LOGIC;
        o_output: out STD_LOGIC_VECTOR(7 downto 0)
    );
end wrapper;

architecture Behavioral of wrapper is
    component clk_wiz_0
        port
        (
            clk_out1          : out    std_logic;
            clk_out2          : out    std_logic;
            reset             : in     std_logic;
            locked            : out    std_logic;
            clk_in1_p         : in     std_logic;
            clk_in1_n         : in     std_logic
        );
    end component;

    signal s_locked, s_clk_100, s_clk_200 : STD_LOGIC := '0';
    signal s_output, s_feedback : std_logic_vector(11 downto 0) :=  (others => '0'); 
    signal s_ki : sfixed(13 downto -18) :=  (others => '0');
begin
    o_output <= s_output(7 downto 0);
    clk_core : clk_wiz_0
        port map ( 
            -- Clock out ports  
            clk_out1 => s_clk_100,
            clk_out2 => s_clk_200,
            -- Status and control signals                
            reset => '0',
            locked => s_locked,
            -- Clock in ports
            clk_in1_p => clk_pin_p,
            clk_in1_n => clk_pin_n
        );
    PID_module : entity work.top_module(Behavioral)
        port map(
            i_adc_clk => s_clk_200, 
            i_feedback => s_feedback,
            i_reference => x"000",
            i_kp => to_slv(s_ki),
            i_ki => to_slv(s_ki),
            i_kd => to_slv(s_ki),
            o_output => s_output
        );
    process(s_clk_100)
    begin
        if rising_edge(s_clk_100) then
            s_feedback <= s_feedback xor x"101";
            s_ki <= resize(s_ki + 0.01, s_ki);
        end if;
    end process;
end Behavioral;
