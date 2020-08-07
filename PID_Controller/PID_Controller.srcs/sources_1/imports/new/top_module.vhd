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
use IEEE.fixed_pkg.ALL;
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
    signal s_buf_feedback, s_buf_reference : STD_LOGIC_VECTOR(11 downto 0) := (others => '0');
    signal s_error : STD_LOGIC_VECTOR(31 downto 0) := (others => '0'); 
    signal s_P_result, s_I_result, s_D_result : STD_LOGIC_VECTOR(31 DOWNTO 0):= (others => '0');
    signal s_buf_kp, s_buf_ki, s_buf_kd : STD_LOGIC_VECTOR(31 DOWNTO 0):= (others => '0');

begin
    s_buf_feedback <= i_feedback when i_feedback_tvalid = '1' else s_buf_feedback; -- last valid feedback
    s_buf_reference <= i_reference when i_reference_tvalid = '1' else s_buf_reference; -- last valid reference
    s_buf_kp <= i_kp when i_kp_tvalid = '1' else i_kp;
    s_buf_ki <= i_ki when i_ki_tvalid = '1' else i_ki;
    s_buf_kd <= i_kd when i_kd_tvalid = '1' else i_kd;
    
    s_error <= std_logic_vector(signed(x"0" & i_reference) - signed(x"0" & i_feedback)) & x"0000" & "00"; 
        
    Proportional : entity work.proportional(Behavioral)
        port map(
            i_clk => i_clk,
            i_error => s_error,
            i_kp => s_buf_kp,
            o_P_result => s_P_result
        );
        
    Integral : entity work.integral(Behavioral)
        generic map ( g_max_accumulator => to_sfixed(1000, 13, -18)) --Change these later
        port map(
            i_clk => i_clk,
            i_adc_clk => i_adc_clk,
            i_error => s_error,
            i_ki => i_ki,
            o_I_result => s_I_result
        ); 
        
                 
    PID_sum : entity work.PID_to_output(Behavioral)
        port map (
            i_clk => i_clk,
            i_P_result => s_P_result,
            i_I_result => s_I_result,
            i_D_result => s_D_result,
            o_output => o_output,
            o_failure => o_failure
        );

end Behavioral;
