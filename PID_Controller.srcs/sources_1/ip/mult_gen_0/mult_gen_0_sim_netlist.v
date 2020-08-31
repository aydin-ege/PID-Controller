// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Fri Aug 21 18:29:52 2020
// Host        : Ege-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top mult_gen_0 -prefix
//               mult_gen_0_ mult_gen_0_sim_netlist.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx485tffg1761-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_12,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module mult_gen_0
   (CLK,
    A,
    B,
    SCLR,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [12:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) output [28:0]P;

  wire [12:0]A;
  wire [15:0]B;
  wire CLK;
  wire [28:0]P;
  wire SCLR;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "13" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "3" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "28" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "virtex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_0_mult_gen_v12_0_12 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "13" *) (* C_B_TYPE = "1" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "16" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "3" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "28" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "virtex7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module mult_gen_0_mult_gen_v12_0_12
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [12:0]A;
  input [15:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [28:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [12:0]A;
  wire [15:0]B;
  wire CLK;
  wire [28:0]P;
  wire SCLR;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "13" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "3" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "28" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "virtex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_0_mult_gen_v12_0_12_viv i_mult
       (.A(A),
        .B(B),
        .CE(1'b0),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
bFAU4jIi/OTjA94vyfnsINNZ7LQWPG29HYkOd7NDkV8lqkXg9mHJMdeO/ddubgSM/sXxKlaXmA3R
hjN3ZgzXnQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
W4pzVOdCk+Osd8V98r7V424v8cMuJ1L0a2T97bjbYz9BlDO5CsA4mcoNmSuAJFfazBJHS9h+h7LE
KqqXnmtym3qUkXiQdJNFGAe/G4Ovlcklh8LNrMAFBTlnBMiUTEKq7LIeO66Gua02Y/CNVE7QLRmT
qtz5VkYAYCV1hNYQa3k=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
2tP45HcM2W2S/CUrxpXf22Jx9C2GPG9qdptdnbsVyOBzOknq3dZxUr6F7BuApQ+kwIyDuLVal2Je
65TF2B6mOjh8T9V6NrR+TPe8eWIjv0YJkDEVs+CRnIhskOOLkjFF8Q/pZewPfNjOuNcj3NcANJpp
LdLum3sfyqDD8w2O+4U=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
iUSxrlEtEIUWrfmSGGc5rEqWsgwtYNtDuohLyKA9r9sc438enelL+pkPMweQgpxELN+5b9Tzja6s
WrutVGs8CgDIVDvzskrCs/IA+qNqUVe1aD8BKxjgQSVXWIhINgLsicgn6SrPI/Qz6L+mQSXsCbYM
u11kSPVCaXbgVjwbU++KCOAGgNoiE0cd5DEbJ99aAVPo1cZ1hmQnpMxwlLDKb6wwCcp/6aJsTJ7u
t/Zx39OPZ7lOcT0DkS0HyIK0jMBnpdj+aD2HTaiCsGksVDbO9lBgmJk1/wprTeehoYlY/At9IGcl
gfaHRLmzjxPOoDl0ILBaYSZhY2cyamDGFPOM3A==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PAF2wcbv+xa/IjRBjPbtAGboK+pB8eyLGc2kWWsniJuUUbHG2DsOmrnVYHw1tbZzhNHrdtSAYba0
GEfPliCJfoeYxFtoQeg9UOP05fSwgTFTJwaTQMC/x9COnSWzNccNzkiDjVAdC70PJ0Wy4vbChycz
apxSfj0hQ3PyiBtg4d2m3ISitycO4STLtlvzoe9wGBP15u+SRMtWvpy4v1X7Se0gq+pbm4UD0QSu
M1RGOMf1CdqDRvvRTMJLvaQFL1A3r8/d5YGEEAG/ZrZ7Jn3yHePnwk9CkjjCtbSa8ZowOhdo0kRQ
3VXl4b/QkGyKlms6UI1CdudkR/1eXKk+oOy+Mg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ip5seGgbaB1WFLqbtP2FDkxBilP47VvmybKUe7Mmnq4U9GIiaj6WuAi35cp5ZmEWP1U/urjIASXD
/O2rMjjxQfJgWYFVLXPHNjuNfMtgOw4zWj8yDVzLbWFBKhzgJSzvethgJSV3H2JzMnyXs6Qq5ADS
y/Zk35yGxgORErmwMw4e3b1cQZ3cJ1GBM1LUY2uby9k4uunnQPN09yI5QAKJmlWaQIVsKr4W9AHP
V1KOjSi13CX4/J/Mmztnjv+Vm3ImkJdgHzljirA4FE8biujTSK/Yh3sNQ4NE/eEBIGQTuV2Btmaa
DgybzA5DG85vb0DOBqqXjwo6j6KZ59rn+bE/7A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
qVfK/kB9TQULsY/Z55f+p0NDstAES6hONLVmhRcwgH2i1q5GeSGdVAsFJEZ7AcaVY7ArX50EeyQO
9OP7+Bu4cSzqblAaWTN/bjEajyM67OQWCON0mx/RK/HlGbqXsp5m0DE4S3nMqcM/UVoqiSRkjgjc
j0MC+4U3/h8oBEfsoEopMZzUhz/sxbaPw25q0SnSeRy5l1GjeXLXc83FO1oyaUGCql8IVolSwkS5
Kk2FZ96ie9ntyqOPmYzL4hYD3pisXfXxsMk9wgiZt9Vdpi86YFyaU9hpWHsX9ohafEhV4D+glKJ8
yFok3naNF9RRjAPe5EVDvYqG0PDTkr0W1uKUVg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
lkCFPLzReljEMFKi5WIe0Kuv8r8XtmUiY3JKPSMsRJXpFsVdRL5x2ziGiM32ZHvnxlgZ+mQGNcN3
Ag6TyEvWXJJvvJrM96U4pGXI4qp9K+nL3Rmiy/oOsozD2rWEtASP5cxaf1Kwoy6tXRqvZ/32TjJC
MhNgjWiOjPhi+iLFB9r+QsJvloKzt/V3pxoxjhtG8vldmUn60wMJJ9DvAs/5B9uzYrUpQVDCauMP
30mC77krmjRSfd28ukXk+/CSFXpjBIA38hN62jpGWbvyejUp7rdMitloGPr2kVRcaah8GAoFIAmh
VlBARLxjz5AArtcu5IwhDXgC7ntpW8WfjdATsw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7312)
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
