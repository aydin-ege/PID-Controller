// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Sun Aug 23 16:23:35 2020
// Host        : Ege-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top mult_gen_1 -prefix
//               mult_gen_1_ mult_gen_1_stub.v
// Design      : mult_gen_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1761-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "mult_gen_v12_0_12,Vivado 2016.4" *)
module mult_gen_1(CLK, A, B, SCLR, P)
/* synthesis syn_black_box black_box_pad_pin="CLK,A[28:0],B[31:0],SCLR,P[60:0]" */;
  input CLK;
  input [28:0]A;
  input [31:0]B;
  input SCLR;
  output [60:0]P;
endmodule
