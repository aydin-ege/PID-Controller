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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PID_to_output is
    Port (  i_clk : in STD_LOGIC;
            i_P_result : in STD_LOGIC_VECTOR(31 DOWNTO 0);
            i_P_tvalid : in STD_LOGIC;
            o_P_tready : out STD_LOGIC;
            i_I_result : in STD_LOGIC_VECTOR(31 DOWNTO 0);
            i_I_tvalid : in STD_LOGIC;
            o_I_tready : out STD_LOGIC;
            i_D_result : in STD_LOGIC_VECTOR(31 DOWNTO 0);
            i_D_tvalid : in STD_LOGIC;
            o_D_tready : out STD_LOGIC;
            o_output : out STD_LOGIC_VECTOR(11 DOWNTO 0);
            o_failure : out STD_LOGIC
        );
end PID_to_output;

architecture Behavioral of PID_to_output is
    COMPONENT adder_core
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
    COMPONENT float_to_fixed
        PORT (
            aclk : IN STD_LOGIC;
            s_axis_a_tvalid : IN STD_LOGIC;
            s_axis_a_tready : OUT STD_LOGIC;
            s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            m_axis_result_tvalid : OUT STD_LOGIC;
            m_axis_result_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            m_axis_result_tuser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
        );
    END COMPONENT;
    signal s_PI_result, s_PID_result : STD_LOGIC_VECTOR(31 DOWNTO 0):= (others => '0');
    signal s_PI_tvalid, s_PI_tready, s_PID_tvalid, s_PID_tready : STD_LOGIC := '0';
    
    signal s_output : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal s_buf_output : STD_LOGIC_VECTOR(11 downto 0) := (others => '0');
    signal s_output_tvalid, s_overflow : STD_LOGIC := '0';
begin
    PI : adder_core
        PORT MAP (
            aclk => i_clk,
            s_axis_a_tvalid => i_P_tvalid,
            s_axis_a_tready => o_P_tready,
            s_axis_a_tdata => i_P_result,
            s_axis_b_tvalid => i_I_tvalid,
            s_axis_b_tready => o_I_tready,
            s_axis_b_tdata => i_I_result,
            m_axis_result_tvalid => s_PI_tvalid,
            m_axis_result_tready => s_PI_tready,
            m_axis_result_tdata => s_PI_result
        );
        
    PID : adder_core
        PORT MAP (
            aclk => i_clk,
            s_axis_a_tvalid => s_PI_tvalid,
            s_axis_a_tready => s_PI_tready,
            s_axis_a_tdata => s_PI_result,
            s_axis_b_tvalid => i_D_tvalid,
            s_axis_b_tready => o_D_tready,
            s_axis_b_tdata => i_D_result,
            m_axis_result_tvalid => s_PID_tvalid,
            m_axis_result_tready => s_PID_tready,
            m_axis_result_tdata => s_PID_result
        );
        
    PID_to_output : float_to_fixed
        PORT MAP (
            aclk => i_clk,
            s_axis_a_tvalid => s_PID_tvalid,
            s_axis_a_tready => s_PID_tready,
            s_axis_a_tdata => s_PID_result,
            m_axis_result_tvalid => s_output_tvalid,
            m_axis_result_tdata => s_output,
            m_axis_result_tuser(0) => s_overflow
    );   -- todo add overflow sign
    
    s_buf_output <= s_output(11 downto 0) when s_output_tvalid = '1' else s_buf_output;
    o_output <= s_buf_output;
    o_failure <= s_overflow or s_output(12);
    
end Behavioral;
