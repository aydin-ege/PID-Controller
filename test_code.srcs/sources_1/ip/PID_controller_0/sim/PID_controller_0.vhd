-- (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: UMRAM:user:PID_controller:1.3.2
-- IP Revision: 9

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY PID_controller_0 IS
  PORT (
    i_clk : IN STD_LOGIC;
    i_adc_clk : IN STD_LOGIC;
    i_reset : IN STD_LOGIC;
    i_feedback : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    i_reference : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    i_kp : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    i_ki : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    i_kd : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    o_output : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    o_overflow : OUT STD_LOGIC
  );
END PID_controller_0;

ARCHITECTURE PID_controller_0_arch OF PID_controller_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF PID_controller_0_arch: ARCHITECTURE IS "yes";
  COMPONENT top_module IS
    GENERIC (
      g_max_accumulator_n : INTEGER;
      g_max_accumulator_d : INTEGER;
      g_min_accumulator_n : INTEGER;
      g_min_accumulator_d : INTEGER;
      g_ADC_range_n : INTEGER;
      g_ADC_range_d : INTEGER;
      g_cutoff_n : INTEGER;
      g_cutoff_d : INTEGER;
      g_ADC_frequency : INTEGER
    );
    PORT (
      i_clk : IN STD_LOGIC;
      i_adc_clk : IN STD_LOGIC;
      i_reset : IN STD_LOGIC;
      i_feedback : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      i_reference : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      i_kp : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      i_ki : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      i_kd : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      o_output : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      o_overflow : OUT STD_LOGIC
    );
  END COMPONENT top_module;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF i_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 i_clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF i_adc_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 i_adc_clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF i_reset: SIGNAL IS "xilinx.com:signal:reset:1.0 i_reset RST";
BEGIN
  U0 : top_module
    GENERIC MAP (
      g_max_accumulator_n => 7,
      g_max_accumulator_d => 10,
      g_min_accumulator_n => -7,
      g_min_accumulator_d => 10,
      g_ADC_range_n => 1,
      g_ADC_range_d => 1,
      g_cutoff_n => 20,
      g_cutoff_d => 1,
      g_ADC_frequency => 961540
    )
    PORT MAP (
      i_clk => i_clk,
      i_adc_clk => i_adc_clk,
      i_reset => i_reset,
      i_feedback => i_feedback,
      i_reference => i_reference,
      i_kp => i_kp,
      i_ki => i_ki,
      i_kd => i_kd,
      o_output => o_output,
      o_overflow => o_overflow
    );
END PID_controller_0_arch;
