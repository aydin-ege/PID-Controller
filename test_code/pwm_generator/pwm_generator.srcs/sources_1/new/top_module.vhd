----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/20/2020 09:21:44 PM
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

entity top_module is
    Port (         
            SYSCLK_P : in std_logic;
            SYSCLK_N : in std_logic;
            i_feedback : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            PWM_R : out std_logic; --which pin to connect?
            PWM_L : out std_logic 
          );
end top_module;

architecture Behavioral of top_module is
component pwm_gen_top is
    Port ( 
        clk_200M : in std_logic;
        clk_400M : in std_logic;
        pwm_trigger : in std_logic;
        v_in_cal : in std_logic_vector (14 downto 0);
        v_in_ref : in std_logic_vector (14 downto 0);
        PWM_R : out std_logic;
        PWM_L : out std_logic 
    );
end component;
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
component clk_wiz_0
    port
    (
        clk_out1          : out    std_logic;
        clk_out2          : out    std_logic;
        clk_out3          : out    std_logic;
        clk_in1_p         : in     std_logic;
        clk_in1_n         : in     std_logic
    );
end component;
COMPONENT vio_0
    PORT (
        clk : IN STD_LOGIC;
        probe_out0 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
        probe_out1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        probe_out2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        probe_out3 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
END COMPONENT;

signal s_pid_output : std_logic_vector (31 downto 0) := (others => '0');
signal s_pwm_input : std_logic_vector (14 downto 0) := (others => '0'); --13 downto -18
signal s_ref : STD_LOGIC_VECTOR(14 DOWNTO 0) := "000001000000000";
signal clk_adc, clk_100M, clk_200M, clk_400M : STD_LOGIC := '1';
signal pwm_enable : STD_LOGIC := '1';
signal s_reference : std_logic_vector (11 downto 0) := (others => '0');
signal s_kp, s_ki, s_kd : std_logic_vector (31 downto 0) := (others => '0');
begin
    -- Hello there.
    -- General Kenobi!
    ---------------------------
    -- clk_adc is unconnected. If there is no ADC clock present just add a new signal to clocking wizard at adc clock frequency.
    -- i_feedback should be output of the XADC not an input of the top module.
    -- The pins on VC707 are a bit weird so i don't know which pin the PWM_R and PWM_L should connect to.
    -- ADC pins is commented in constraints file, uncomment them accordingly.
    ----------------------------

    clk_IP : clk_wiz_0
    port map ( 
        -- Clock out ports  
        clk_out1 => clk_100M,
        clk_out2 => clk_200M,
        clk_out3 => clk_400M,
        -- Clock in ports
        clk_in1_p => SYSCLK_P,
        clk_in1_n => SYSCLK_N
    );
    
    PC_FPGA_bridge : vio_0
      PORT MAP (
        clk => clk_100M, 
        probe_out0 => s_reference,
        probe_out1 => s_kp,
        probe_out2 => s_ki,
        probe_out3 => s_kd
      );

    s_pwm_input <= s_pid_output(22 downto 8); --(4 downto -10)*1024

    pid_module : PID_controller_0
    PORT MAP (
        i_clk => clk_100M,
        i_adc_clk => clk_adc,
        i_reset => '0',
        i_feedback => i_feedback,
        i_reference => s_reference,
        i_kp => s_kp,
        i_ki => s_ki,
        i_kd => s_kd,
        o_output => s_pid_output
    );
  
    pwm_module: pwm_gen_top 
    port map (
        clk_200M => clk_200M,
        clk_400M => clk_400M,
        pwm_trigger => pwm_enable,
        v_in_cal => s_pwm_input,
        v_in_ref => s_ref,
        PWM_R => PWM_R,
        PWM_L => PWM_L
    );

end Behavioral;
