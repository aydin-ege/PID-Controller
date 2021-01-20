// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Mon Jan 18 16:21:16 2021
// Host        : DESKTOP-5DGGSE0 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ PID_controller_0_stub.v
// Design      : PID_controller_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1761-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "top_module,Vivado 2016.4" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(i_clk, i_adc_clk, i_reset, i_feedback, 
  i_reference, i_kp, i_ki, i_kd, o_output, o_overflow)
/* synthesis syn_black_box black_box_pad_pin="i_clk,i_adc_clk,i_reset,i_feedback[11:0],i_reference[11:0],i_kp[31:0],i_ki[31:0],i_kd[31:0],o_output[31:0],o_overflow" */;
  input i_clk;
  input i_adc_clk;
  input i_reset;
  input [11:0]i_feedback;
  input [11:0]i_reference;
  input [31:0]i_kp;
  input [31:0]i_ki;
  input [31:0]i_kd;
  output [31:0]o_output;
  output o_overflow;
endmodule
