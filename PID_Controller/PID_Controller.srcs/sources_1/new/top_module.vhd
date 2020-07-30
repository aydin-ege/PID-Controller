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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_module is
    Port ( 
        i_clk : in STD_LOGIC;
        i_adc_clk : in STD_LOGIC;
        i_feedback : in STD_LOGIC_VECTOR (11 downto 0);
        i_feedback_tvalid : in STD_LOGIC;
        i_reference : in STD_LOGIC_VECTOR (11 downto 0);
        i_reference_tvalid : in STD_LOGIC;
        i_kp : in STD_LOGIC_VECTOR (31 downto 0);
        i_kp_tvalid : in STD_LOGIC;
        i_ki : in STD_LOGIC_VECTOR (31 downto 0);
        i_ki_tvalid : in STD_LOGIC;
        i_kd : in STD_LOGIC_VECTOR (31 downto 0);
        i_kd_tvalid : in STD_LOGIC;
        o_output : out STD_LOGIC_VECTOR (11 downto 0);
        o_failure : out STD_LOGIC
    );
end top_module;

architecture Behavioral of top_module is 
    COMPONENT fixed_to_float
        PORT (
            aclk : IN STD_LOGIC;
            s_axis_a_tvalid : IN STD_LOGIC;
            s_axis_a_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            m_axis_result_tvalid : OUT STD_LOGIC;
            m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
    END COMPONENT;
    

    signal s_buf_feedback, s_buf_reference : STD_LOGIC_VECTOR(11 downto 0) := (others => '0');
    signal s_error : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal s_error_float : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
    signal s_error_tvalid, s_error_float_tvalid : STD_LOGIC := '0';
    
    signal s_P_result, s_I_result, s_D_result : STD_LOGIC_VECTOR(31 DOWNTO 0):= (others => '0');
    signal s_P_tvalid, s_P_tready : STD_LOGIC := '0';
    signal s_I_tvalid, s_I_tready : STD_LOGIC := '0';
    signal s_D_tvalid, s_D_tready : STD_LOGIC := '0';
    

    
begin
    s_buf_feedback <= i_feedback when i_feedback_tvalid = '1' else s_buf_feedback; -- last valid feedback
    s_buf_reference <= i_reference when i_reference_tvalid = '1' else s_buf_reference; -- last valid reference
    
    s_error <= std_logic_vector(signed(x"0" & i_reference) - signed(x"0" & i_feedback)); --Assuming unsigned feedback from ADC and similarly unsigned reference signal
    s_error_tvalid <= i_feedback_tvalid and i_reference_tvalid; 
    
    error_to_float : fixed_to_float
        port map(
            aclk => i_clk,
            s_axis_a_tvalid => s_error_tvalid,
            s_axis_a_tdata => s_error,
            m_axis_result_tvalid => s_error_float_tvalid,
            m_axis_result_tdata => s_error_float
        );
    
    Proportional : entity work.proportional(Behavioral)
        port map(
            i_clk => i_clk,
            i_error => s_error_float,
            i_error_tvalid => s_error_float_tvalid,
            i_kp => i_kp,
            i_kp_tvalid => i_kp_tvalid,
            o_P_result => s_P_result,
            o_P_tvalid => s_P_tvalid,
            i_P_tready => s_P_tready
        );
    Integral : entity work.integral(Behavioral)
        generic map ( g_max_accumulator => b"000" & x"AAAAAAA") --Change these later
        port map(
            i_clk => i_clk,
            i_adc_clk => i_adc_clk,
            i_error => s_error_float,
            i_error_tvalid => s_error_float_tvalid,
            i_ki => i_ki,
            i_ki_tvalid => i_ki_tvalid,
            o_I_result => s_I_result,
            o_I_tvalid => s_I_tvalid,
            i_I_tready => s_I_tready
        ); 
    Derivative : entity work.derivative(Behavioral)
        generic map ( g_cutoff => x"AAAAAAAA")
        port map(
            i_clk => i_clk,
            i_adc_clk => i_adc_clk,
            i_error => s_error_float,
            i_error_tvalid => s_error_float_tvalid,
            i_kd => i_kd,
            i_kd_tvalid => i_kd_tvalid,
            o_D_result => s_D_result,
            o_D_tvalid => s_D_tvalid,
            i_D_tready => s_D_tready
        ); 
                 
    PID_sum : entity work.PID_to_output(Behavioral)
        port map (
            i_clk => i_clk,
            i_P_result => s_P_result,
            i_P_tvalid => s_P_tvalid,
            o_P_tready => s_P_tready,
            i_I_result => s_I_result,
            i_I_tvalid => s_I_tvalid,
            o_I_tready => s_I_tready,
            i_D_result => s_D_result,
            i_D_tvalid => s_D_tvalid,
            o_D_tready => s_D_tready,
            o_output => o_output,
            o_failure => o_failure
        );

end Behavioral;
