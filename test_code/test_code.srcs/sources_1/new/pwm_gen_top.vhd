----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/17/2020 09:49:55 AM
-- Design Name: 
-- Module Name: pwm_gen_top - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;

entity pwm_gen_top is
    
    Port ( 
            clk_200M : in std_logic;
            clk_400M : in std_logic;
            pwm_trigger : in std_logic;
            v_in_cal : in std_logic_vector (14 downto 0);
            v_in_ref : in std_logic_vector (14 downto 0);
            PWM_R : out std_logic;
            PWM_L : out std_logic 
    );
end pwm_gen_top;

architecture structural of pwm_gen_top is

component duty_cycle_cal is

port (
    clk_200M : in     std_logic;
    v_cal : in integer;
    v_ref : in integer;
    rightside_a : out std_logic_vector (14 downto 0);
    rightside_b : out std_logic_vector (14 downto 0);
    leftside_a : out std_logic_vector (14 downto 0);
    leftside_b : out std_logic_vector (14 downto 0)
    );
    
end component;

component pwm is

port (
    clk_400M : in     std_logic;
    pwm_trigger : in std_logic;
    rightside_a : in std_logic_vector (14 downto 0);
    rightside_b : in std_logic_vector (14 downto 0);
    leftside_a : in std_logic_vector (14 downto 0);
    leftside_b : in std_logic_vector (14 downto 0);
    PWM_R : out std_logic;
    PWM_L : out std_logic;
    pwm_right_cntvaluein : out std_logic_vector (4 downto 0);
    pwm_left_cntvaluein : out std_logic_vector (4 downto 0)
    );

end component;


signal v_cal,v_ref : integer := 0;
signal rightside_a :  std_logic_vector (14 downto 0) :=(others => '0');
signal rightside_b :  std_logic_vector (14 downto 0):=(others => '0');
signal leftside_a :  std_logic_vector (14 downto 0):=(others => '0');
signal leftside_b :  std_logic_vector (14 downto 0):=(others => '0');
signal pwm_right_cntvaluein : std_logic_vector (4 downto 0) :=(others => '0');
signal pwm_right_cntvalueout : std_logic_vector (4 downto 0) :=(others => '0');
signal pwm_left_cntvaluein : std_logic_vector (4 downto 0):=(others => '0');
signal pwm_left_cntvalueout : std_logic_vector (4 downto 0):=(others => '0');
signal pwm_R_i : std_logic := '0';
signal pwm_L_i : std_logic := '0';


begin

v_cal <= CONV_INTEGER (v_in_cal) ;
v_ref <= CONV_INTEGER (v_in_ref) ;




duty_cycle_cal_i: duty_cycle_cal port map (
                                    clk_200M => clk_200M,
                                    v_cal => v_cal,
                                    v_ref => v_ref,
                                    rightside_a => rightside_a,
                                    rightside_b => rightside_b,
                                    leftside_a => leftside_a,
                                    leftside_b => leftside_b
);


pwm_i: pwm port map (
                                clk_400M => clk_400M,
                                pwm_trigger => pwm_trigger,
                                rightside_a => rightside_a,
                                rightside_b => rightside_b,
                                leftside_a => leftside_a,
                                leftside_b => leftside_b,
                                pwm_R => pwm_R_i,
                                pwm_L => pwm_L_i,
                                pwm_right_cntvaluein => pwm_right_cntvaluein,
                                pwm_left_cntvaluein => pwm_left_cntvaluein

);  
IDELAYCTRL_inst : IDELAYCTRL
port map (
   RDY => open,       -- 1-bit output: Ready output
   REFCLK => clk_200M, -- 1-bit input: Reference clock input
   RST => '0'        -- 1-bit input: Active high reset input
);

ODELAYE2_inst_right_1: ODELAYE2
     generic map (
        CINVCTRL_SEL             => "FALSE",         -- Enable dynamic clock inversion (FALSE, TRUE)
        DELAY_SRC                => "ODATAIN",       -- Delay input (ODATAIN, CLKIN)
        HIGH_PERFORMANCE_MODE    => "TRUE",          -- Reduced jitter ("TRUE"), Reduced power ("FALSE")
        ODELAY_TYPE              => "VAR_LOAD",      -- FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
        ODELAY_VALUE             => 0,               -- Output delay tap setting (0-31)
        PIPE_SEL                 => "FALSE",         -- Select pipelined mode, FALSE, TRUE
        REFCLK_FREQUENCY         => 200.0,           -- IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
        SIGNAL_PATTERN           => "DATA"           -- DATA, CLOCK input signal
     )
     port map (
        CNTVALUEOUT              => pwm_right_cntvalueout, -- 5-bit output: Counter value output
        DATAOUT                  => pwm_R,         -- 1-bit output: Delayed data/clock output
        C                        => clk_200M,              -- 1-bit input: Clock input
        CE                       => '0',                  -- 1-bit input: Active high enable increment/decrement input
        CINVCTRL                 => '0',                  -- 1-bit input: Dynamic clock inversion input
        CLKIN                    => '0',                  -- 1-bit input: Clock delay input
        CNTVALUEIN               => pwm_right_cntvaluein,  -- 5-bit input: Counter value input
        INC                      => '1',                  -- 1-bit input: Increment / Decrement tap delay input
        LD                       => '1',        -- 1-bit input: Loads ODELAY_VALUE tap delay in VARIABLE mode, in VAR_LOAD or
                                                          -- VAR_LOAD_PIPE mode, loads the value of CNTVALUEIN
        LDPIPEEN                 => '0',                  -- 1-bit input: Enables the pipeline register to load data
        ODATAIN                  => pwm_R_i,         -- 1-bit input: Output delay data input
        REGRST                   => '0'                   -- 1-bit input: Active-high reset tap-delay input
     );
 
     
ODELAYE2_inst_left_1: ODELAYE2
          generic map (
             CINVCTRL_SEL             => "FALSE",         -- Enable dynamic clock inversion (FALSE, TRUE)
             DELAY_SRC                => "ODATAIN",       -- Delay input (ODATAIN, CLKIN)
             HIGH_PERFORMANCE_MODE    => "TRUE",          -- Reduced jitter ("TRUE"), Reduced power ("FALSE")
             ODELAY_TYPE              => "VAR_LOAD",      -- FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
             ODELAY_VALUE             => 0,               -- Output delay tap setting (0-31)
             PIPE_SEL                 => "FALSE",         -- Select pipelined mode, FALSE, TRUE
             REFCLK_FREQUENCY         => 200.0,           -- IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
             SIGNAL_PATTERN           => "DATA"           -- DATA, CLOCK input signal
          )
          port map (
             CNTVALUEOUT              => pwm_left_cntvalueout, -- 5-bit output: Counter value output
             DATAOUT                  => pwm_L,         -- 1-bit output: Delayed data/clock output
             C                        => clk_200M,              -- 1-bit input: Clock input
             CE                       => '0',                  -- 1-bit input: Active high enable increment/decrement input
             CINVCTRL                 => '0',                  -- 1-bit input: Dynamic clock inversion input
             CLKIN                    => '0',                  -- 1-bit input: Clock delay input
             CNTVALUEIN               => pwm_left_cntvaluein,  -- 5-bit input: Counter value input
             INC                      => '1',                  -- 1-bit input: Increment / Decrement tap delay input
             LD                       => '1',        -- 1-bit input: Loads ODELAY_VALUE tap delay in VARIABLE mode, in VAR_LOAD or
                                                               -- VAR_LOAD_PIPE mode, loads the value of CNTVALUEIN
             LDPIPEEN                 => '0',                  -- 1-bit input: Enables the pipeline register to load data
             ODATAIN                  => pwm_L_i,         -- 1-bit input: Output delay data input
             REGRST                   => '0'                   -- 1-bit input: Active-high reset tap-delay input
          ); 
--pwm_L <= pwm_L_i; It generates bitstream when i just do this while commenting the delays above
--pwm_R <= pwm_R_i;
             



end structural;
