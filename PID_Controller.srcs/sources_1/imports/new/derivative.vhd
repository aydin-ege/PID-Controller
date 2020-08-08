----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/25/2020 10:09:10 PM
-- Design Name: 
-- Module Name: derivative - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments: 53 cycles (some ops are in parallel so not exactly 53)
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.fixed_pkg.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity derivative is
    Generic ( g_cutoff : STD_LOGIC_VECTOR (31 downto 0) );
    Port ( i_clk : in STD_LOGIC;
           i_adc_clk : in STD_LOGIC;
           i_error : in STD_LOGIC_VECTOR (31 downto 0);
           i_kd : in STD_LOGIC_VECTOR (31 downto 0);
           o_D_result : out STD_LOGIC_VECTOR (31 downto 0));
end derivative;

architecture Behavioral of derivative is

COMPONENT multiplier_core
      PORT (
        CLK : IN STD_LOGIC;
        A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        P : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
        );
    END COMPONENT;
    

    signal s_scaled_error_slv, s_cutoff_output_slv : STD_LOGIC_VECTOR (63 downto 0) := (others => '0');                 -- 28 integer part and 36 fraction part 

    signal s_integrated_output_slv, s_cutoff_input_slv : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal s_buf_output, s_buf_scaled_error : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');

    signal s_scaled_error, s_cutoff_input, s_integrated_output, s_cutoff_output : sfixed(13 downto -18):= (others => '0');

begin

    kd_multiplier : multiplier_core
        PORT MAP (
            CLK => i_clk,
            A => i_kd,                                                      --32bit signed  (14-integer, 18-fraction)
            B => i_error,                                                   --32bit signed  (14-integer, 18-fraction)
            P => s_scaled_error_slv                                         -- 64bit signed (28-integer part, 36 fraction)
        );   
   
    cutoff_multiplier : multiplier_core
        PORT MAP (
            CLK => i_clk,
            A => s_cutoff_input_slv,                                                --32bit signed  (14-integer, 18-fraction)
            B => g_cutoff,                                                          --32bit signed  (14-integer, 18-fraction)
            P => s_cutoff_output_slv                                                -- 64bit signed (28-integer part, 36-fraction)
        );
    
    
    s_scaled_error <= to_sfixed(s_scaled_error_slv, s_scaled_error); 
    s_cutoff_output <= to_sfixed(s_cutoff_output_slv, s_cutoff_output);  
    s_cutoff_input_slv <= to_slv(s_cutoff_input);
    
    process(i_clk)
    begin
        if rising_edge(i_clk) then                
            s_cutoff_input <= s_scaled_error - s_integrated_output;                                                --Loop subtraction
            s_integrated_output <= resize(s_integrated_output + s_cutoff_output, s_integrated_output);             --Integration
                
        end if;
    end process;

    o_D_result <= to_slv(s_cutoff_output); 
    
end Behavioral;
