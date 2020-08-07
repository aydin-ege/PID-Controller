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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity proportional is
    Port ( i_clk : in STD_LOGIC;
           i_error : in STD_LOGIC_VECTOR (31 downto 0);
           i_kp : in STD_LOGIC_VECTOR (31 downto 0);
           o_P_result : out STD_LOGIC_VECTOR (31 downto 0));
end proportional;

architecture Behavioral of proportional is
    COMPONENT multiplier_core
        PORT (
            CLK : IN STD_LOGIC;
            A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            P : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
        );
    END COMPONENT;
    
    signal s_buf_kp, s_buf_error : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal s_P_result : STD_LOGIC_VECTOR (63 downto 0)  := (others => '0');
begin

    Proportional : multiplier_core
        PORT MAP (
            CLK => i_clk,
            A => s_buf_kp,
            B => s_buf_error,
            P => s_P_result
        );

     o_P_result <= s_P_result(63) & s_P_result(48 downto 18); -- TODO: overflow indicator

end Behavioral;
