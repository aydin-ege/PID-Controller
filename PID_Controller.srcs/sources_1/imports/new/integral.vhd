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
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use ieee.fixed_pkg.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity integral is
    Generic ( 
        g_max_accumulator : sfixed (13 downto -18);
        g_min_accumulator : sfixed (13 downto -18)
    );
    Port ( 
        i_clk : in STD_LOGIC;
        i_adc_clk : in STD_LOGIC;
        i_error : in STD_LOGIC_VECTOR (31 downto 0);
        i_ki : in STD_LOGIC_VECTOR (31 downto 0);
        o_I_result : out STD_LOGIC_VECTOR (31 downto 0)
    );
end integral;

architecture Behavioral of integral is
    COMPONENT multiplier_core
        PORT (
            CLK : IN STD_LOGIC;
            A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            P : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
        );
    END COMPONENT;
    
    signal s_buf_I_result, s_before_output  : sfixed(13 downto -18) := (others => '0');
    signal s_scaled_error, s_buf_scaled_error, s_until_max : sfixed(13 downto -18) := (others => '0');
    signal s_scaled_error_vector : STD_LOGIC_VECTOR(63 downto 0) := (others => '0');
begin    
    
    ki_mult : multiplier_core
        PORT MAP (
            CLK => i_clk,
            A => i_ki,
            B => i_error,
            P => s_scaled_error_vector
        );
    s_scaled_error <= to_sfixed(s_scaled_error_vector, s_scaled_error);  
    s_before_output <= resize(abs(s_scaled_error + s_buf_I_result), s_before_output);  
    
    process(i_adc_clk)
    begin
        if rising_edge(i_adc_clk) then
            if s_buf_I_result + s_scaled_error < g_max_accumulator and s_buf_I_result + s_scaled_error > g_min_accumulator then
                s_buf_I_result <= resize(s_buf_I_result + s_scaled_error, s_buf_I_result);
            else
                if s_buf_I_result + s_scaled_error < 0 then
                    s_buf_I_result <= g_min_accumulator;
                else
                    s_buf_I_result <= g_max_accumulator; 
                end if;
            end if;
        end if;
    end process;
    o_I_result <= to_slv(s_buf_I_result);
end Behavioral;
