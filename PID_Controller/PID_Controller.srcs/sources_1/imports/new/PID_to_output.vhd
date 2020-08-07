----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/28/2020 08:35:33 AM
-- Design Name: 
-- Module Name: PID_to_output - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PID_to_output is
    Port (  i_clk : in STD_LOGIC;
            i_P_result : in STD_LOGIC_VECTOR(31 DOWNTO 0);
            i_I_result : in STD_LOGIC_VECTOR(31 DOWNTO 0);
            i_D_result : in STD_LOGIC_VECTOR(31 DOWNTO 0);
            o_output : out STD_LOGIC_VECTOR(11 DOWNTO 0);
            o_failure : out STD_LOGIC --TODO
        );
end PID_to_output;

architecture Behavioral of PID_to_output is
    signal s_output: signed(31 downto 0);
begin
    s_output <= signed(i_P_result) + signed(i_I_result) + signed(i_D_result);
    o_output <= std_logic_vector(s_output(29 downto 18));
    o_failure <= s_output(30); -- only one overflow here tie with other module fails
    
end Behavioral;
