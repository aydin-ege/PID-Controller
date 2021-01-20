vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xpm
vlib msim/xbip_utils_v3_0_7
vlib msim/xbip_pipe_v3_0_3
vlib msim/xbip_bram18k_v3_0_3
vlib msim/mult_gen_v12_0_12
vlib msim/ieee_proposed

vmap xil_defaultlib msim/xil_defaultlib
vmap xpm msim/xpm
vmap xbip_utils_v3_0_7 msim/xbip_utils_v3_0_7
vmap xbip_pipe_v3_0_3 msim/xbip_pipe_v3_0_3
vmap xbip_bram18k_v3_0_3 msim/xbip_bram18k_v3_0_3
vmap mult_gen_v12_0_12 msim/mult_gen_v12_0_12
vmap ieee_proposed msim/ieee_proposed

vlog -work xil_defaultlib -64 -sv \
"D:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"D:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_7 -64 -93 \
"../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_3 -64 -93 \
"../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_3 -64 -93 \
"../../../ipstatic/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_12 -64 -93 \
"../../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/mult_gen_4/sim/mult_gen_4.vhd" \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/mult_gen_2/sim/mult_gen_2.vhd" \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/mult_gen_0/sim/mult_gen_0.vhd" \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/mult_gen_1/sim/mult_gen_1.vhd" \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/mult_gen_3/sim/mult_gen_3.vhd" \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/mult_gen_5/sim/mult_gen_5.vhd" \

vcom -work ieee_proposed -64 -93 \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/ieee_proposed/src/ieee_proposed/fixed_pkg_2008.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/derivative.vhd" \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/proportional.vhd" \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/integral.vhd" \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/PID_to_output.vhd" \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/top_module.vhd" \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/sim/PID_controller_0.vhd" \

vlog -work xil_defaultlib "glbl.v"

