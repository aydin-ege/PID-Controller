// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Fri Aug 21 19:57:12 2020
// Host        : Ege-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/my/Vivado/PID_Controller/PID_Controller.srcs/sources_1/ip/mult_gen_0/mult_gen_0_sim_netlist.v
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
  (* C_OPTIMIZE_GOAL = "0" *) 
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
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "0" *) (* C_OUT_HIGH = "28" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "virtex7" *) (* ORIG_REF_NAME = "mult_gen_v12_0_12" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
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
  (* C_OPTIMIZE_GOAL = "0" *) 
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
mlZuox9lJCHFuB5wb7tv7CdjS5UvArVESiDSkOU5hp0TvkbLT1eXkcLWjn5J7VZQHCH6g1wKFH4e
8K81k+livO6iB6Uc7FXVyfJjHt8FSILkIweXuc/gHgH298x6U61hhrKujjM2xTDvVKwHPk1MAkrL
ohhuucCCNBzrG86/TFlkpCN+xysiS3tbqG2IANRR84J3XOsXEeQpbly32B0qtdLuQFCN4ChCaXG5
Hjb5dPTc6R82uw9dTGzIcYwPYTif82jsfywsGMI5PYHmaURZ61JVpfc9G+MiFKHQr0Z8RXV0BTC8
Prn6g/Or43UX0GNaWtZWfrdEfGsQqdyLmH4IKg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
twRYYIEOAzV7vzfruoMN0tz+T0+5uBFemkqWCWipyuX0ASNMb0ULOOAITO7+PLOBbbwdSLQBdmbn
st72UZWT4cjNdH2Bcf8qpS8kaK3Yr/boIm6x+sinFWpcQET8iTFedeY/lPmg5z498ZX28yJs4QIz
+k8jnSn3yp3tho855pqqSRnuEttaqSbfoABUx/veUMMsISleXjBGIe/H3wx8l8swvbywteZMbsuw
wFbeZMu0OJLP8ldtirs7LcdO8wXAGwNLiPgCdTl0feHlc6qdrPYsMt7QBG8VPALhZwOZJS7yaD3A
8blGuri04lrbcfGanh/lMxNqJ7+hhc+KZhJIFw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7680)
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
