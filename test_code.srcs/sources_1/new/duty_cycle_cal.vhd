----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/17/2020 01:59:01 PM
-- Design Name: 
-- Module Name: duty_cycle_cal - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;

entity duty_cycle_cal is
port (
    clk_200M : in     std_logic;
    v_cal : in integer;
    v_ref : in integer;
    rightside_a : out std_logic_vector (14 downto 0);
    rightside_b : out std_logic_vector (14 downto 0);
    leftside_a : out std_logic_vector (14 downto 0);
    leftside_b : out std_logic_vector (14 downto 0)
    );
end duty_cycle_cal;

architecture Behavioral of duty_cycle_cal is

constant pwm_period_quarter : integer := 6400 ; -- (800 * 32) / 4 
constant pwm_period_3quarter : integer := 19200 ; -- 3* (800 * 32) / 4 
signal rightside_a_i :  integer  :=0;
signal rightside_b_i : integer  :=0;
signal leftside_a_i : integer  :=0;
signal leftside_b_i : integer  :=0;
signal dummy_1 : integer range - 2**30 to 2**30 -1 := 0;
signal dummy_2 : integer range - 2**15 to 2**15 -1 := 0;

begin



process (clk_200M)
begin

              if (rising_edge(clk_200M)) then
                    
                    dummy_1 <= pwm_period_quarter * v_cal ;
                    dummy_2 <= dummy_1 / v_ref ;
                    
                    rightside_a_i <= pwm_period_quarter - dummy_2 ;
                    rightside_b_i <= pwm_period_3quarter + dummy_2 ;
                    leftside_a_i <= pwm_period_quarter + dummy_2 ;
                    leftside_b_i <= pwm_period_3quarter - dummy_2 ;
                    
               end if;
end process;


rightside_a <= CONV_STD_LOGIC_VECTOR(rightside_a_i, 15);
                                    
rightside_b <= CONV_STD_LOGIC_VECTOR(rightside_b_i, 15);
                               
leftside_a <= CONV_STD_LOGIC_VECTOR(leftside_a_i, 15); 
                               
leftside_b <= CONV_STD_LOGIC_VECTOR(leftside_b_i, 15); 

end Behavioral;
