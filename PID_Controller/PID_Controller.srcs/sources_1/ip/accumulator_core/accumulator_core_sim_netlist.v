// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Mon Aug 03 21:24:58 2020
// Host        : Ege-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/my/Vivado/PID_Controller/PID_Controller.srcs/sources_1/ip/accumulator_core/accumulator_core_sim_netlist.v
// Design      : accumulator_core
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx485tffg1761-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "accumulator_core,c_accum_v12_0_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_accum_v12_0_10,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module accumulator_core
   (B,
    CLK,
    SCLR,
    Q);
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [31:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) output [31:0]Q;

  wire [31:0]B;
  wire CLK;
  wire [31:0]Q;
  wire SCLR;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "1" *) 
  (* C_LATENCY = "1" *) 
  (* C_OUT_WIDTH = "32" *) 
  (* C_SCALE = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "virtex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  accumulator_core_c_accum_v12_0_10 U0
       (.ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(CLK),
        .C_IN(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "32" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_SCLR = "1" *) (* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) 
(* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "1" *) (* C_OUT_WIDTH = "32" *) 
(* C_SCALE = "0" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "virtex7" *) (* ORIG_REF_NAME = "c_accum_v12_0_10" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module accumulator_core_c_accum_v12_0_10
   (B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    Q);
  input [31:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output [31:0]Q;

  wire [31:0]B;
  wire CLK;
  wire [31:0]Q;
  wire SCLR;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "1" *) 
  (* C_LATENCY = "1" *) 
  (* C_OUT_WIDTH = "32" *) 
  (* C_SCALE = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "virtex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  accumulator_core_c_accum_v12_0_10_viv i_synth
       (.ADD(1'b0),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b0),
        .CLK(CLK),
        .C_IN(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
Uvl61+F2jvFGPGXL9WiWhcWb4LzbhwN+9DvDzd4rkxMe5sXaN+2YqDLzFwzB6vfiLUxXH693X6eB
Xw9FFPM1iA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
BeTt/KsmuO7XXvcPPGcvJJiQH1hDvudia/H3fXSfmZqGxHq5FH69lX6HCQK0lKxlipo8vRGlq3gb
BeDM4WgBEU3EVPMfluCKT/277shLx64kW1YAg5A/ZL0xuFbUKF/8dSZRl0vWcHnnAV1tZyjUWQHW
QvVSCt6ae9p4fTeo0w4=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
ZJEtzAnBsQJb6m+rRnrtp017n+edqSkKT7Njs3vIqQsPAXEtfVKPZTdMBYBGildQ4yBZP1gHaYl4
HhPEEgSmokGak/A8PV2gLy6DsIJAKXvFMiifZbivOMIXRF04sBnGM/GkdENF9S+jbL77D6Luyk83
w5cWTgAOOUBXMPVi6lU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
wkq0D4n81d8ZVuh/vPN08pClpOQRlLT+U5FzDOSKM5llc8hH5se66RgXkOQcFk5xPG3+ftPfmuNz
BpRGyIFvvLIt0eyXsuCHTYgJjxgoaLgq4eHPX+o6y1dMo9SJ+LCWChx8a1AOO4l+CMt92cvCcOY3
BZWyG/dm8LsmOWosLmtOh/IpbyKpYiDjrdCMLbiKYr2pb50t+SsJ18r6ny6PgnCHrfqXe7BfsJcL
YfofPZBsIeoTYV6crQeX+r+7hO7QWd2/mQiRRMD2kzSHDG7lGx884zwv9HV118hRRtFFI+5qD17d
7mY6AtYtF9gISAARzMc7bMoKkhD7fiVuXCjFGQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
d4l+AKOVa7f+qX7Yw1IpZT2kjhG08YXuNTqjA9DNQkDDpqYPxmpNKcBhP/d1yjBQuVQAqsCwAtAh
eRObpb9GFV1Z8Z7DwUb56x3qu9pLRA0WYGmpvuhbObD1hCUYj1PlSO+4gpkFuqkamSlJRAnjJVUL
BtK+P0Ddo45S+XnIXTcO6IuS6WwDkKfnfCt1qBRmvXpbETKgTC0iRuFXdCK1RXdRgVVO00HNGORg
K/wDRBptqRzxkhKPGM9xj0hAzOnLgJXXTw9gnephIMPJstdScm0ylJ330rfvAORCPl5qVNZHuzX7
QcPqtyGbMIZMGn28GS2YBAj0pGKlp+kNke85hw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hmj4LHRUoxj0jCOnh1N8gGuBwiXpxvNiRmGLQJIepX8XFpiqMhyFlwLup+O+ovFJYPrq1LMUSAqt
6TjUIuIBD9XZFQ72hVab+PE/cYVOAyej1xneX2sKJG70/9sO6yVvnJ9rzzlEOGjehchm7rgyZbw2
CRJ7u3ZRjIjZQSgb02p/g0oogghB7dfRASzg6BNoCo2T79or5C2ncLg7eeq+dEbZHowCQDP/b6oy
ZoKcxcVNGpt6kfIIl16ueybdxpu6lQ+qUGn2FzXFeawfn/z82bG3nBnQcJt09EWyhH04qJZAe7BJ
HFsybNiIIaXrJzz0aDmEs1nT6LfWnc9bQhMGVA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
db8z8m/xNm3qwBl1yxJMoMA35Qfp5CAFmIyGVGblV/26RlIP2Wu6PtaIIyAXuYRFc6q1aGctosty
Rp46xqsHtfM8lnkwmr82Moc1bK8ln9S28N0sgLPWxKDk2HZEK0WiW4if7SJgxLMC91nihRewq3Bf
/Pmkh0j6R5d95wId+MAqZZxCOGVhr09EcPZozTXEi2d5s8Ai0BdVk/ToKbTCdqunz6O1gDEfrB5m
Gp2jFWvTVfdDT6i3u3zvWVcIj1B3NAHgWR5tvLrK2dGaeb7njHPfGQQuBjSPA7HYEVoxV1QQbfGj
crnGAQjgVXIi+4IUUmGMFTKvi+RUzDaQMVLW1A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
SbCmS5/pTZA0BAHqa4r36L6f1gPlj+2bSHFIEHj2ixLcDGuk3cP6jU8OaigJ2hHJOfayDRDbemzj
TiAg58pxCBiNpRA4Ny7Pb+qn2Cz2EdX2CbmfaOTUjW0y39UzZyGcj0QIdNwr55CZ3HW50nWQ8b/1
P32Nuy0wnqGrpWMqjlpx0BcF/SpGe3lnbACyJMMwcx8BgGnLuLCYiJQCTC/BxZ5cSvUwZdmE6m1p
5pgZVeYsbLInsncM+JY56VktvQ638fGfu/mJqpDVOYJDdd9eFV06GDuLqA0aSAmJ1rHhc2iiVYCX
d+d48PltCBzOWC8z10y6SgXWhBFS+WFD32JZtg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10784)
`pragma protect data_block
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
4lPyhkAsLFCnUgY=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
