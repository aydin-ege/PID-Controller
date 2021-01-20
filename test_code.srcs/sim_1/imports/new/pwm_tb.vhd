----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/06/2020 07:54:17 AM
-- Design Name: 
-- Module Name: pwm_tb - Behavioral
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
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pwm_tb is
end pwm_tb;

architecture Behavioral of pwm_tb is
component pwm_gen_top is
    Port ( 
            clk_200M : in std_logic;
            clk_400M : in std_logic;
            pwm_trigger : in std_logic;
            v_in_cal : in std_logic_vector (14 downto 0);
            v_in_ref : in std_logic_vector (14 downto 0);
            PWM_R : out std_logic;
            PWM_L : out std_logic 
    );
end component;

signal s_pwm_input : std_logic_vector (14 downto 0) := "111"&x"E00"; -- change this to what its supposed to be
signal s_ref : STD_LOGIC_VECTOR(14 DOWNTO 0) := "001"&x"000";
signal clk_200M, clk_400M, PWM_R, PWM_L : STD_LOGIC := '1';
signal pwm_enable : STD_LOGIC := '1';

begin
clk_200M <= not clk_200M after 2.5ns;
clk_400M <= not clk_400M after 1.25ns;

pwm_gen_top_i: pwm_gen_top port map (
    clk_200M => clk_200M,
    clk_400M => clk_400M,
    pwm_trigger => pwm_enable,
    v_in_cal => s_pwm_input,
    v_in_ref => s_ref,
    PWM_R => PWM_R,
    PWM_L => PWM_L
);

end Behavioral;
