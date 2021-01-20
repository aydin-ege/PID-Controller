-makelib ies/xil_defaultlib -sv \
  "D:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies/xpm \
  "D:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/xbip_utils_v3_0_7 \
  "../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies/xbip_pipe_v3_0_3 \
  "../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies/xbip_bram18k_v3_0_3 \
  "../../../ipstatic/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies/mult_gen_v12_0_12 \
  "../../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/mult_gen_4/sim/mult_gen_4.vhd" \
  "../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/mult_gen_2/sim/mult_gen_2.vhd" \
  "../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/mult_gen_0/sim/mult_gen_0.vhd" \
  "../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/mult_gen_1/sim/mult_gen_1.vhd" \
  "../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/mult_gen_3/sim/mult_gen_3.vhd" \
  "../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/mult_gen_5/sim/mult_gen_5.vhd" \
-endlib
-makelib ies/ieee_proposed \
  "../../../../test_code.srcs/sources_1/ip/PID_controller_0/ieee_proposed/src/ieee_proposed/fixed_pkg_2008.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/derivative.vhd" \
  "../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/proportional.vhd" \
  "../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/integral.vhd" \
  "../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/PID_to_output.vhd" \
  "../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/top_module.vhd" \
  "../../../../test_code.srcs/sources_1/ip/PID_controller_0/sim/PID_controller_0.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

