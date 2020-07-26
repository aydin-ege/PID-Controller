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

entity derivative is
    Generic ( g_cutoff : STD_LOGIC_VECTOR (31 downto 0) );
    Port ( i_clk : in STD_LOGIC;
           i_adc_clk : in STD_LOGIC;
           i_error : in STD_LOGIC_VECTOR (31 downto 0);
           i_error_tvalid : in STD_LOGIC;
           i_kd : in STD_LOGIC_VECTOR (31 downto 0);
           i_kd_tvalid : in STD_LOGIC;
           o_D_result : out STD_LOGIC_VECTOR (31 downto 0);
           o_D_tvalid : out STD_LOGIC;
           i_D_tready : in STD_LOGIC);
end derivative;

architecture Behavioral of derivative is

begin


end Behavioral;
