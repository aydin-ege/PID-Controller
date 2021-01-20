-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Mon Jan 18 16:21:17 2021
-- Host        : DESKTOP-5DGGSE0 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Users/ahmet/Desktop/test_code/test_code.srcs/sources_1/ip/PID_controller_0/PID_controller_0_stub.vhdl
-- Design      : PID_controller_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx485tffg1761-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PID_controller_0 is
  Port ( 
    i_clk : in STD_LOGIC;
    i_adc_clk : in STD_LOGIC;
    i_reset : in STD_LOGIC;
    i_feedback : in STD_LOGIC_VECTOR ( 11 downto 0 );
    i_reference : in STD_LOGIC_VECTOR ( 11 downto 0 );
    i_kp : in STD_LOGIC_VECTOR ( 31 downto 0 );
    i_ki : in STD_LOGIC_VECTOR ( 31 downto 0 );
    i_kd : in STD_LOGIC_VECTOR ( 31 downto 0 );
    o_output : out STD_LOGIC_VECTOR ( 31 downto 0 );
    o_overflow : out STD_LOGIC
  );

end PID_controller_0;

architecture stub of PID_controller_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "i_clk,i_adc_clk,i_reset,i_feedback[11:0],i_reference[11:0],i_kp[31:0],i_ki[31:0],i_kd[31:0],o_output[31:0],o_overflow";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "top_module,Vivado 2016.4";
begin
end;
