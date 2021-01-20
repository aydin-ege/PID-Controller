-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Mon Jan 18 15:36:26 2021
-- Host        : DESKTOP-5DGGSE0 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Users/ahmet/Desktop/test_code/test_code.srcs/sources_1/ip/vio_0/vio_0_stub.vhdl
-- Design      : vio_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx485tffg1761-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vio_0 is
  Port ( 
    clk : in STD_LOGIC;
    probe_in0 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    probe_in1 : in STD_LOGIC_VECTOR ( 13 downto 0 );
    probe_in2 : in STD_LOGIC_VECTOR ( 17 downto 0 );
    probe_out0 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    probe_out1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out2 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out3 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out4 : out STD_LOGIC_VECTOR ( 14 downto 0 )
  );

end vio_0;

architecture stub of vio_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe_in0[11:0],probe_in1[13:0],probe_in2[17:0],probe_out0[11:0],probe_out1[31:0],probe_out2[31:0],probe_out3[31:0],probe_out4[14:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "vio,Vivado 2016.4";
begin
end;
