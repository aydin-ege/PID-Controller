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
    
    signal s_buf_kd, s_buf_valid_kd, s_buf_error, s_buf_valid_error : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal s_kd_tready, s_kd_tvalid : STD_LOGIC := '0';
    signal s_error_tready, s_error_tvalid : STD_LOGIC := '0';
    signal s_scaled_error : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal s_scaled_error_tready, s_scaled_error_tvalid : STD_LOGIC := '0';
    signal s_sent : STD_LOGIC := '0';
    
    signal s_integrated_output, s_cutoff_output, s_cutoff_input : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal s_cutoff_output_tready, s_cutoff_output_tvalid : STD_LOGIC := '0';
    signal s_cutoff_input_tready, s_cutoff_input_tvalid : STD_LOGIC := '0';
    signal s_integrated_output_tready, s_integrated_output_tvalid : STD_LOGIC := '0';

begin

    kd_mult : multiplier_core                       --the inputted error is multiplied by Kd
      PORT MAP (
        aclk => i_clk,
        s_axis_a_tvalid => s_kd_tvalid,
        s_axis_a_tready => s_kd_tready,
        s_axis_a_tdata => s_buf_kd,
        s_axis_b_tvalid => s_error_tvalid,
        s_axis_b_tready => s_error_tready,
        s_axis_b_tdata => s_buf_error,
        m_axis_result_tvalid => s_scaled_error_tvalid, 
        m_axis_result_tready => s_scaled_error_tready, 
        m_axis_result_tdata => s_scaled_error  
      );
      
      loop_subtraction: adder_core                                      --loop subtraction
        PORT MAP (
            aclk => i_clk,
            s_axis_a_tvalid => s_scaled_error_tvalid,
            s_axis_a_tready => s_scaled_error_tready,
            s_axis_a_tdata => s_scaled_error,
            s_axis_b_tvalid => s_integrated_output_tvalid,              --check what to do in order to obtain subtraction @@@@@@@@@@@@@@@@@@@@@@@@
            s_axis_b_tready => s_integrated_output_tready,
            s_axis_b_tdata => s_integrated_output,
            m_axis_result_tvalid => s_cutoff_input_tvalid,
            m_axis_result_tready => s_cutoff_input_tready,
            m_axis_result_tdata => s_cutoff_input
        );

    cutoff_mult : multiplier_core                       --multiplying with cutoff inside the feedback loop
      PORT MAP (
        aclk => i_clk,
        s_axis_a_tvalid => s_kd_tvalid,                 --check the tvalid and tready signals  @@@@@@@@@@@@@@@@@@@@@
        s_axis_a_tready => s_kd_tready,
        s_axis_a_tdata => g_cutoff,
        s_axis_b_tvalid => s_cutoff_input_tvalid,
        s_axis_b_tready => s_cutoff_input_tready,
        s_axis_b_tdata => s_cutoff_input,
        m_axis_result_tvalid => s_cutoff_output_tvalid,
        m_axis_result_tready => s_cutoff_output_tready,
        m_axis_result_tdata => s_cutoff_output
      );
      
    feedback_integral_path : accumulator_core       --integral accumulator for the feedback loop
      PORT MAP (
        aclk => i_adc_clk,
        s_axis_a_tvalid => s_cutoff_output_tvalid,
        s_axis_a_tready => s_cutoff_output_tready,
        s_axis_a_tdata => s_cutoff_output,
        s_axis_a_tlast => '0',  -- Change: Use to reset
        m_axis_result_tvalid => s_integrated_output_tvalid,
        m_axis_result_tready => s_integrated_output_tready,
        m_axis_result_tdata => s_integrated_output
      );

     s_buf_valid_error <= i_error when i_error_tvalid = '1' else s_buf_valid_error; -- last error that is valid
     s_buf_error <= s_buf_valid_error when s_error_tready = '1' else s_buf_error; -- if multiplier is ready, send last error
     s_error_tvalid <= '1' when i_error_tvalid='1' else '0' when s_sent='1' else s_error_tvalid; -- raise whenever, keep until sent, reset after sending.
     
     s_buf_valid_kd <= i_kd when i_kd_tvalid = '1' else s_buf_valid_kd; -- last kd that is valid
     s_buf_kd <= s_buf_valid_kd when s_kd_tready = '1' else s_buf_kd; -- if multiplier is ready, send last kd
     s_kd_tvalid <= '1' when i_kd_tvalid='1' else '0' when s_sent='1' else s_kd_tvalid; -- raise whenever, keep until sent, reset after sending.

     o_D_result <= s_cutoff_output;                 -- do this part work as a buffer?

    process(i_clk)
    begin
        if rising_edge(i_clk) then
            s_sent <= s_error_tvalid and s_error_tready and s_kd_tvalid and s_kd_tready;
        end if;
    end process;
    
end Behavioral;
