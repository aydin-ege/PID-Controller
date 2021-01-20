----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/06/2020 03:49:51 PM
-- Design Name: 
-- Module Name: PID_tb - Behavioral
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
library IEEE_proposed;
use IEEE_proposed.fixed_pkg.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PID_tb is
end PID_tb;

architecture Behavioral of PID_tb is
COMPONENT PID_controller_0
    PORT (
        i_clk : IN STD_LOGIC;
        i_adc_clk : IN STD_LOGIC;
        i_reset : IN STD_LOGIC;
        i_feedback : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        i_reference : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        i_kp : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        i_ki : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        i_kd : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        o_output : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
END COMPONENT;

    signal clk, adc_clk : STD_LOGIC := '0';
    signal plant_in : STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
    signal plant_out : STD_LOGIC_VECTOR(11 downto 0):= (others => '0');
    signal x : unsigned(11 downto 0) := (others => '0');
begin
    x <= x+1 after 100us;   
    adc_clk <= not adc_clk after 1.039998us/2;        
    clk <= not clk after 5ns;        
    plant_out <= std_logic_vector(x);
    
    pid_module : PID_controller_0
    PORT MAP (
          i_clk => clk,
          i_adc_clk => adc_clk,
          i_reset => '0',
          i_feedback => plant_out,
          i_reference => to_slv(to_sfixed(0, 11, 0)),
          i_kp => to_slv(to_sfixed(1, 13, -18)),
          i_ki => to_slv(to_sfixed(1, 13, -18)),
          i_kd => to_slv(to_sfixed(1, 13, -18)),
          o_output => plant_in
    );


end Behavioral;
