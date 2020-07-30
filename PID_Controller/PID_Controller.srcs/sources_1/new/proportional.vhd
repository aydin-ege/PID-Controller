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
           i_error_tvalid : in STD_LOGIC;
           i_kp : in STD_LOGIC_VECTOR (31 downto 0);
           i_kp_tvalid : in STD_LOGIC;
           o_P_result : out STD_LOGIC_VECTOR (31 downto 0);
           o_P_tvalid : out STD_LOGIC;
           i_P_tready : in STD_LOGIC);
end proportional;

architecture Behavioral of proportional is
    COMPONENT multiplier_core
      PORT (
        aclk : IN STD_LOGIC;
        s_axis_a_tvalid : IN STD_LOGIC;
        s_axis_a_tready : OUT STD_LOGIC;
        s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        s_axis_b_tvalid : IN STD_LOGIC;
        s_axis_b_tready : OUT STD_LOGIC;
        s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        m_axis_result_tvalid : OUT STD_LOGIC;
        m_axis_result_tready : IN STD_LOGIC;
        m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
      );
    END COMPONENT;
    
    signal s_buf_kp, s_buf_valid_kp, s_buf_error, s_buf_valid_error : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal s_kp_tready, s_kp_tvalid : STD_LOGIC := '0';
    signal s_error_tready, s_error_tvalid : STD_LOGIC := '0';
    signal s_sent : STD_LOGIC := '0';
begin
    Proportional : multiplier_core
        PORT MAP (
            aclk => i_clk,
            s_axis_a_tvalid => s_kp_tvalid,
            s_axis_a_tready => s_kp_tready,
            s_axis_a_tdata => s_buf_kp,
            s_axis_b_tvalid => s_error_tvalid,
            s_axis_b_tready => s_error_tready,
            s_axis_b_tdata => s_buf_error,
            m_axis_result_tvalid => o_P_tvalid,
            m_axis_result_tready => i_P_tready,
            m_axis_result_tdata => o_P_result
        );
     s_buf_valid_error <= i_error when i_error_tvalid = '1' else s_buf_valid_error; -- last error that is valid
     s_buf_error <= s_buf_valid_error when s_error_tready = '1' else s_buf_error; -- if multiplier is ready, send last error
     s_error_tvalid <= '1' when i_error_tvalid='1' else '0' when s_sent='1' else s_error_tvalid; -- raise whenever, keep until sent, reset after sending.
     
     s_buf_valid_kp <= i_kp when i_kp_tvalid = '1' else s_buf_valid_kp; -- last kp that is valid
     s_buf_kp <= s_buf_valid_kp when s_kp_tready = '1' else s_buf_kp; -- if multiplier is ready, send last kp
     s_kp_tvalid <= '1' when i_kp_tvalid='1' else '0' when s_sent='1' else s_kp_tvalid; -- raise whenever, keep until sent, reset after sending.

     process(i_clk)
     begin
        if rising_edge(i_clk) then
            s_sent <= s_error_tvalid and s_error_tready and s_kp_tvalid and s_kp_tready;
        end if;
     end process;

end Behavioral;
