
library IEEE;
library ieee_proposed;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee_proposed.fixed_pkg.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Plant_sim is
    Port ( 
        i_input : in STD_LOGIC_VECTOR(11 downto 0);
        o_output : out STD_LOGIC_VECTOR(11 downto 0)
    );
    
    constant multiplier : ufixed(0 downto -19) := "01001100110011001101";
end Plant_sim;

architecture Behavioral of Plant_sim is

begin
    o_output <= to_slv(resize(((to_ufixed(unsigned(i_input)))*multiplier), 11, 0, false, false));

end Behavioral;
