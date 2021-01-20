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

entity top_top_module is
    Port (         
            SYSCLK_P : in std_logic;
            SYSCLK_N : in std_logic;
            reset: in std_logic;
            adc_input : in STD_LOGIC_VECTOR(1 downto 0);
            PWM_R : out std_logic;
            PWM_L : out std_logic;
            ADC_alarm : out STD_LOGIC
          );
end top_top_module;

architecture Behavioral of top_top_module is
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
        probe_in0 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        probe_in1 : IN STD_LOGIC_VECTOR(31 DOWNTO 18);
        probe_in2 : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        probe_out0 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
        probe_out1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        probe_out2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        probe_out3 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        probe_out4 : OUT STD_LOGIC_VECTOR(14 DOWNTO 0)
    );
END COMPONENT;
COMPONENT xadc_wiz_0
    PORT (
        di_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        daddr_in : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
        den_in : IN STD_LOGIC;
        dwe_in : IN STD_LOGIC;
        drdy_out : OUT STD_LOGIC;
        do_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        dclk_in : IN STD_LOGIC;
        reset_in : IN STD_LOGIC;
        vp_in : IN STD_LOGIC;
        vn_in : IN STD_LOGIC;
        vauxp0 : IN STD_LOGIC;
        vauxn0 : IN STD_LOGIC;
        channel_out : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
        eoc_out : OUT STD_LOGIC;
        alarm_out : OUT STD_LOGIC;
        eos_out : OUT STD_LOGIC;
        busy_out : OUT STD_LOGIC
    );
END COMPONENT;

signal s_pid_output : std_logic_vector (31 downto 0) := (others => '0');
signal s_pwm_input : std_logic_vector (14 downto 0) := (others => '0'); --13 downto -18
signal s_ref : STD_LOGIC_VECTOR(14 DOWNTO 0) := "000001000000000";
signal clk_100M, clk_200M, clk_400M : STD_LOGIC := '1';
signal pwm_enable : STD_LOGIC := '1';
signal s_reference : std_logic_vector (11 downto 0) := (others => '0');
signal s_kp, s_ki, s_kd : std_logic_vector (31 downto 0) := (others => '0');
signal s_feedback : STD_LOGIC_VECTOR(11 DOWNTO 0) := (others => '0');
signal s_ADC_out : STD_LOGIC_VECTOR(15 DOWNTO 0) := (others => '0');
signal s_enableInt : STD_LOGIC := '1';
signal s_test : STD_LOGIC;


signal s_pid_output2 : std_logic_vector (31 downto 0) := (others => '0');
signal s_reference2 : std_logic_vector (11 downto 0) := (others => '0');
signal s_kp2, s_ki2, s_kd2 : std_logic_vector (31 downto 0) := (others => '0');
signal s_ADC_out1 : STD_LOGIC_VECTOR(15 DOWNTO 0) := (others => '0');
signal adc_clk : STD_logic := '0';

begin
    -- Hello there.
    -- General Kenobi!
    ---------------------------
    -- The pins on VC707 are a bit weird so i don't know which pin the PWM_R and PWM_L should connect to.
    -- ADC pins is commented in constraints file, uncomment them accordingly.
    ----------------------------
s_feedback <= s_ADC_out(15 downto 4);
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
            probe_in0 => s_ADC_out(15 downto 4),
            probe_in1 => s_pid_output2(31 downto 18),
            probe_in2 => s_pid_output2(17 downto 0),
            probe_out0 => s_reference2,
            probe_out1 => s_kp2,
            probe_out2 => s_ki2,
            probe_out3 => s_kd2,
            probe_out4 => s_ref
          );

    s_pwm_input <= s_pid_output(22 downto 8); --(4 downto -10)*1024

    pid_module : PID_controller_0
    PORT MAP (
        i_clk => clk_100M,
        i_adc_clk => s_enableInt,
        i_reset => reset,
        i_feedback => s_feedback,
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

    XADC_Wizard : xadc_wiz_0
    PORT MAP (
        di_in => (others => '0'),
        daddr_in => "0010000",  --0x10 is VAUXP[0]  
        den_in => adc_clk,
        dwe_in => '0',
        drdy_out => open,
        do_out => s_ADC_out1,
        dclk_in => clk_100M,
        reset_in => reset,
        vp_in => '0',
        vn_in => '0',
        vauxp0 => adc_input(0),             -- positive pin of adc
        vauxn0 => adc_input(1),             -- negative pin of adc
        channel_out => open,
        eoc_out => s_enableInt,
        alarm_out => ADC_alarm,
        eos_out => open,
        busy_out => open
    );
    
    process(clk_100M)
        begin
            if rising_edge(clk_100M) then
                s_ADC_out <= s_ADC_out1;
                s_kp <= s_kp2;
                s_ki <= s_ki2;
                s_kd <= s_kd2;
                s_pid_output2 <= s_pid_output;
                s_reference <= s_reference2;
                if (s_enableInt and not adc_clk)='1' then
                    adc_clk <= '1';
                elsif (not s_enableInt and adc_clk)='1' then
                    adc_clk <='0';
                end if;
            end if;
        end process;
    
    
end Behavioral;
