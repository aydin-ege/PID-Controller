// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Mon Sep 07 21:05:43 2020
// Host        : Erdem running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/Users/90534/Desktop/xx/PID_Controller.srcs/sources_1/ip/mult_gen_0/mult_gen_0_sim_netlist.v
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
oJ9YNUYJN/WYuBP+t5Z84NaBUeVQql676VBQBTv11IRfMSFtwOLBt01/wUW74NTlu7ubzbFw5Jpn
oTr3gP9csdrAKgMZxMphwqZFvfy8ms4uXbCVF4DxxtlpxKJB68htsl07FXzRcB9WLF1AgPnAiOR1
vgCwmJ3qFdilrYrnXZac8EuM/Ltnz8QLEQ6v4hkE4YerEuID0VFafQ2lDzFfb18pL6QQAHgaEYuT
8pfys20B972ST3AxuxKNNK8uTkeyLTee6KMstGjZtNA/mlmgRv4aRqoOAllf3vH+BCc+8iT+OfJv
sKLr8dRt0N5/0JdXZlnQ2B1GJJfK5os7zZTHPA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
rUjzHfdTxI2sGtVTWRp5pGjuY8Xl7kJYepTbud2iVn5GUMxwMxYIFWK35fR6T+J36vXqRu61zSit
XUlgAJ7pXBUHCmxpmLwaV/lkoHQ271hVK+oTDuYGTnTLs/pdn/sTteGSuVfY8O/UeyisuEYqKp8z
CPjDx9KgAsxWo9CwE0P92oF3JUKzXjiCL2xke29LoeMhJdHEMwUauSAfunAOpUtK0TtbrIoFljxb
2kzg2BC85r2QpBhExN7Wt2E5N5GCNTwywew5gwTADgPCka70iZr8oZbPm4YzBFaKIewiiCqJRsxl
Liq+xKBzF4c25DuMjPS3A0z97DIHmbc6kfV+yg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7280)
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
