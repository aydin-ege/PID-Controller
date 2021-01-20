----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/21/2019 10:35:19 AM
-- Design Name: 
-- Module Name: pwm_gen - Behavioral
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
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
--use IEEE.STD_LOGIC_SIGNED.ALL;


entity pwm is
port (
    clk_400M : in     std_logic;
    pwm_trigger : in std_logic;
    rightside_a : in std_logic_vector (14 downto 0);
    rightside_b : in std_logic_vector (14 downto 0);
    leftside_a : in std_logic_vector (14 downto 0);
    leftside_b : in std_logic_vector (14 downto 0);
    PWM_R : out std_logic;
    PWM_L : out std_logic;
    pwm_right_cntvaluein : out std_logic_vector (4 downto 0);
    pwm_left_cntvaluein : out std_logic_vector (4 downto 0)
    );
end pwm;

architecture Behavioral of pwm is

signal PWM_counter : std_logic_vector (9 downto 0) :=(others => '0') ;
signal test : std_logic := '0';

begin

process (clk_400M, pwm_trigger)
begin
    if (rising_edge(clk_400M )) then
        if pwm_trigger = '1' then
            PWM_counter <= std_logic_vector(unsigned(PWM_counter) + 1);
            if (PWM_counter = "1100011111" ) then
                PWM_counter <= "0000000000";
            end if;



            if ( unsigned(PWM_counter) > unsigned(rightside_a (14 downto 5)) and unsigned(PWM_counter) < unsigned(rightside_b (14 downto 5))) then
                pwm_R <= '1';
            else
                pwm_R <= '0';
            end if;



            if ( PWM_counter < leftside_a (14 downto 5) ) then
                pwm_L <= '0';           
            else
                if ( PWM_counter < leftside_b (14 downto 5) ) then
                    pwm_L <= '1';
                    test <= '1';
                else
                    pwm_L <= '0';
                end if;
            end if;

            if (PWM_counter < "0110001111") then
                pwm_right_cntvaluein <= rightside_a (4 downto 0) ;
                pwm_left_cntvaluein <= leftside_a (4 downto 0) ;
            else
                pwm_right_cntvaluein <= rightside_b (4 downto 0) ;
                pwm_left_cntvaluein <= leftside_b (4 downto 0) ;
            end if;  


        else 
            PWM_R <= '0' ;
            PWM_L <= '0' ;
            pwm_right_cntvaluein <= "00000" ;
            pwm_left_cntvaluein <= "00000" ;
        end if;
    end if;
end process;

end Behavioral;
