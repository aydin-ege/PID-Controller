----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/25/2020 06:25:09 PM
-- Design Name: 
-- Module Name: top_module - Behavioral
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


entity proportional is
    Generic ( 
        g_ADC_range : ufixed(7 downto -8) 
    );
    Port ( 
        i_clk : in STD_LOGIC;
        i_adc_clk : in STD_LOGIC;
        i_reset : in STD_LOGIC;
        i_error : in STD_LOGIC_VECTOR (12 downto 0);
        i_kp : in STD_LOGIC_VECTOR (31 downto 0);
        o_P_result : out STD_LOGIC_VECTOR (31 downto 0);
        o_overflow : out STD_LOGIC
    );
end proportional;


architecture RTL of proportional is   

    COMPONENT mult_gen_0
        PORT (
        CLK : IN STD_LOGIC;
            A : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            SCLR : IN STD_LOGIC;
            P : OUT STD_LOGIC_VECTOR(28 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT mult_gen_1
        PORT (
            CLK : IN STD_LOGIC;
            A : IN STD_LOGIC_VECTOR(28 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            SCLR : IN STD_LOGIC;
            P : OUT STD_LOGIC_VECTOR(60 DOWNTO 0)
        );
    END COMPONENT;
    
    signal s_mult_result : sfixed(22 downto -18)  := (others => '0');
    signal s_P_result : sfixed(13 downto -18) := (others => '0');
    signal s_mult0 : STD_LOGIC_VECTOR(28 downto 0) := (others => '0');
    signal s_mult1 : STD_LOGIC_VECTOR(60 downto 0) := (others => '0');
    
begin

    mult_0 : mult_gen_0
        PORT MAP (
            CLK => i_clk,
            A => i_error, --13, 0
            B => to_slv(g_ADC_range),  --8, -8
            SCLR => i_reset,
            P => s_mult0 --21, -8
        );
    mult_1 : mult_gen_1
        PORT MAP (
            CLK => i_clk,
            A => s_mult0, --21, -8
            B => i_kp,  --14,-18 
            SCLR => i_reset,
            P => s_mult1  -- 34 downto -26
        );
        
    s_mult_result <= resize(to_sfixed(s_mult1, 22, -38), s_mult_result); -- divided by 4096 (shift 12 times)
    s_P_result <= resize(s_mult_result, s_P_result);
    o_overflow <= '0' when s_mult_result = s_P_result else '1'; -- if not equal important bit is cut off 
    o_P_result <= to_slv(s_P_result); 

end RTL;
