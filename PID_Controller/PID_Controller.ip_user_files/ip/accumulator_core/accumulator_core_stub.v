// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Mon Aug 03 21:24:58 2020
// Host        : Ege-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/my/Vivado/PID_Controller/PID_Controller.srcs/sources_1/ip/accumulator_core/accumulator_core_stub.v
// Design      : accumulator_core
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1761-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_accum_v12_0_10,Vivado 2016.4" *)
module accumulator_core(B, CLK, SCLR, Q)
/* synthesis syn_black_box black_box_pad_pin="B[31:0],CLK,SCLR,Q[31:0]" */;
  input [31:0]B;
  input CLK;
  input SCLR;
  output [31:0]Q;
endmodule
