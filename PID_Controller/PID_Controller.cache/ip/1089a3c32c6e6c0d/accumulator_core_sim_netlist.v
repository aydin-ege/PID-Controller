// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Mon Aug 03 21:24:58 2020
// Host        : Ege-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ accumulator_core_sim_netlist.v
// Design      : accumulator_core
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx485tffg1761-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "accumulator_core,c_accum_v12_0_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_accum_v12_0_10,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_accum_v12_0_10 U0
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
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "virtex7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_accum_v12_0_10
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_accum_v12_0_10_viv i_synth
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
OE8my75peQoTPS4CzUK6ytkz2GHLDNEq02rvDxw2UJksWLFgS4Y3j5gD3yESBKaMbyDdnCBw//Lo
F2AEtgfB9O3YbLhEyoTiw+MFzAwVIoB/rNA0OIxd9OpUYfrlPb7AE7pXGUV/7dey6rc/euAL0mBZ
FKmkp+NMGP1iUpo6zxHBu4FpLlHdVe303nx6NlleKDGyqbQ2OsqRRs0+M/MHoKL0a+ymBzkb95oA
FisL0ySaNp4LkCP2psBMLZA35Yy6HlTdsPTe+ow9BUMiIIBX/1JimnkdAMXG3euss49WYI3Gq1EU
GZLh4xiU/6GGRZ2STy+Kzfxz9PE1qJZSMKitog==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
hN0HwlZPMuwBDua4KV6GmQW/gwIx9bvjD02v+XKCFctjSbnAOV/9iwn0ZMkEku2fQ4Yhn5wSFq0K
tBRxL4voE9vYr0x1ahNoDWwOElMFczK4XKrxe8djaioOFIclwnOAkO90bhnmauYztWbKoQj8osyz
HKNk35ANEisgZ4lEf6FLkO23CIHkkEnj0k+ZGvQd36VdAITXcvuK5lOzBGMkCFaRoXETz7KslXS0
uC+vSdwMcXtpCpxqH5Hz6dGO1CT08zOdvjlAG2k50dwzTIufq3dwsOdsAhfjf9lFCOd0f50oootT
WElUlV6JO94dmaX1i8CYo+palM8R/YLzMahCyg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10768)
`pragma protect data_block
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
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
