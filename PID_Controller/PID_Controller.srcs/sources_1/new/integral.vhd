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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity integral is
    Generic ( g_max_accumulator : STD_LOGIC_VECTOR (30 downto 0) );
    Port ( i_clk : in STD_LOGIC;
           i_adc_clk : in STD_LOGIC;
           i_error : in STD_LOGIC_VECTOR (31 downto 0);
           i_error_tvalid : in STD_LOGIC;
           i_ki : in STD_LOGIC_VECTOR (31 downto 0);
           i_ki_tvalid : in STD_LOGIC;
           o_I_result : out STD_LOGIC_VECTOR (31 downto 0);
           o_I_tvalid : out STD_LOGIC;
           i_I_tready : in STD_LOGIC);
end integral;

architecture Behavioral of integral is
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
    
    COMPONENT accumulator_core
      PORT (
        aclk : IN STD_LOGIC;
        s_axis_a_tvalid : IN STD_LOGIC;
        s_axis_a_tready : OUT STD_LOGIC;
        s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        s_axis_a_tlast : IN STD_LOGIC;
        m_axis_result_tvalid : OUT STD_LOGIC;
        m_axis_result_tready : IN STD_LOGIC;
        m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        m_axis_result_tlast : OUT STD_LOGIC
      );
    END COMPONENT;
    
    signal s_buf_ki, s_buf_valid_ki, s_buf_error, s_buf_valid_error : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal s_ki_tready, s_ki_tvalid : STD_LOGIC := '0';
    signal s_error_tready, s_error_tvalid : STD_LOGIC := '0';
    signal s_scaled_error, s_buf_scaled_error : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal s_scaled_error_tready, s_scaled_error_tvalid : STD_LOGIC := '0';
    signal s_sent : STD_LOGIC := '0';
begin
    ki_mult : multiplier_core
      PORT MAP (
        aclk => i_clk,
        s_axis_a_tvalid => s_ki_tvalid,
        s_axis_a_tready => s_ki_tready,
        s_axis_a_tdata => s_buf_ki,
        s_axis_b_tvalid => s_error_tvalid,
        s_axis_b_tready => s_error_tready,
        s_axis_b_tdata => s_buf_error,
        m_axis_result_tvalid => s_scaled_error_tvalid,
        m_axis_result_tready => s_scaled_error_tready,
        m_axis_result_tdata => s_scaled_error
      );
      
     integral_accumulator : accumulator_core
      PORT MAP (
        aclk => i_adc_clk,
        s_axis_a_tvalid => s_scaled_error_tvalid,
        s_axis_a_tready => s_scaled_error_tready,
        s_axis_a_tdata => s_buf_scaled_error,
        s_axis_a_tlast => '0',  -- Change: Use to reset
        m_axis_result_tvalid => o_I_tvalid,
        m_axis_result_tready => i_I_tready,
        m_axis_result_tdata => o_I_result
      );
     
     s_buf_scaled_error <= s_scaled_error when s_scaled_error(30 downto 0) < g_max_accumulator else
                           s_scaled_error(31) & g_max_accumulator; --clamping
     
     s_buf_valid_error <= i_error when i_error_tvalid = '1' else s_buf_valid_error; -- last error that is valid
     s_buf_error <= s_buf_valid_error when s_error_tready = '1' else s_buf_error; -- if multiplier is ready, send last error
     s_error_tvalid <= '1' when i_error_tvalid='1' else '0' when s_sent='1' else s_error_tvalid; -- raise whenever, keep until sent, reset after sending.
     
     s_buf_valid_ki <= i_ki when i_ki_tvalid = '1' else s_buf_valid_ki; -- last kp that is valid
     s_buf_ki <= s_buf_valid_ki when s_ki_tready = '1' else s_buf_ki; -- if multiplier is ready, send last kp
     s_ki_tvalid <= '1' when i_ki_tvalid='1' else '0' when s_sent='1' else s_ki_tvalid; -- raise whenever, keep until sent, reset after sending.

     process(i_clk)
     begin
        if rising_edge(i_clk) then
            s_sent <= s_error_tvalid and s_error_tready and s_ki_tvalid and s_ki_tready;
        end if;
     end process;

    
end Behavioral;
