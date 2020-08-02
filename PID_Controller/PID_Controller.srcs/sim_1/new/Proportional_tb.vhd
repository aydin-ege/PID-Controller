library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity proportional_tb is
end;

architecture bench of proportional_tb is

  component proportional
      Port ( i_clk : in STD_LOGIC;
             i_error : in STD_LOGIC_VECTOR (31 downto 0);
             i_error_tvalid : in STD_LOGIC;
             i_kp : in STD_LOGIC_VECTOR (31 downto 0);
             i_kp_tvalid : in STD_LOGIC;
             o_P_result : out STD_LOGIC_VECTOR (31 downto 0);
             o_P_tvalid : out STD_LOGIC;
             i_P_tready : in STD_LOGIC);
  end component;

  signal i_clk: STD_LOGIC;
  signal i_error: STD_LOGIC_VECTOR (31 downto 0);
  signal i_error_tvalid: STD_LOGIC;
  signal i_kp: STD_LOGIC_VECTOR (31 downto 0);
  signal i_kp_tvalid: STD_LOGIC;
  signal o_P_result: STD_LOGIC_VECTOR (31 downto 0);
  signal o_P_tvalid: STD_LOGIC;
  signal i_P_tready: STD_LOGIC;

  constant clock_period: time := 5 ns;
  signal stop_the_clock: boolean;

begin

  uut: proportional port map ( i_clk          => i_clk,
                               i_error        => i_error,
                               i_error_tvalid => i_error_tvalid,
                               i_kp           => i_kp,
                               i_kp_tvalid    => i_kp_tvalid,
                               o_P_result     => o_P_result,
                               o_P_tvalid     => o_P_tvalid,
                               i_P_tready     => i_P_tready );

  stimulus: process
  begin

  i_error <= "0x0";
  i_error_tvalid <= "1";
  i_kp <= "";
  i_kp_tvalid <= "0x0";

end process;

a: process
  begin
    loop
      i_error_tvalid <= '0', '1' after 7 ns;
      wait for 7ns;
    end loop;
    wait;
  end process;

b: process
  begin
    loop
      i_kp <= i_kp + "1"; 
      wait for 7ns;
    end loop;
    wait;
  end process;
  
c: process
    begin
      loop
        i_error <= i_error + "1"; 
        wait for 7ns;
      end loop;
      wait;
    end process;

d: process
  begin
    loop
      i_kp_tvalid <= '0', '1' after 9 ns;
      wait for 9ns;
    end loop;
    wait;
  end process;



  clocking: process
  begin
    while not stop_the_clock loop
      i_clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;