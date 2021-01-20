-makelib ies/xil_defaultlib -sv \
  "D:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies/xpm \
  "D:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../test_code.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

