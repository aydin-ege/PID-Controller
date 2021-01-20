vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/xbip_utils_v3_0_7
vlib activehdl/xbip_pipe_v3_0_3
vlib activehdl/xbip_bram18k_v3_0_3
vlib activehdl/mult_gen_v12_0_12
vlib activehdl/ieee_proposed

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap xbip_utils_v3_0_7 activehdl/xbip_utils_v3_0_7
vmap xbip_pipe_v3_0_3 activehdl/xbip_pipe_v3_0_3
vmap xbip_bram18k_v3_0_3 activehdl/xbip_bram18k_v3_0_3
vmap mult_gen_v12_0_12 activehdl/mult_gen_v12_0_12
vmap ieee_proposed activehdl/ieee_proposed

vlog -work xil_defaultlib  -sv2k12 \
"D:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"D:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_7 -93 \
"../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_3 -93 \
"../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_3 -93 \
"../../../ipstatic/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_12 -93 \
"../../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/mult_gen_4/sim/mult_gen_4.vhd" \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/mult_gen_2/sim/mult_gen_2.vhd" \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/mult_gen_0/sim/mult_gen_0.vhd" \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/mult_gen_1/sim/mult_gen_1.vhd" \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/mult_gen_3/sim/mult_gen_3.vhd" \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/mult_gen_5/sim/mult_gen_5.vhd" \

vcom -work ieee_proposed -93 \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/ieee_proposed/src/ieee_proposed/fixed_pkg_2008.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/derivative.vhd" \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/proportional.vhd" \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/integral.vhd" \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/PID_to_output.vhd" \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/src/top_module.vhd" \
"../../../../test_code.srcs/sources_1/ip/PID_controller_0/sim/PID_controller_0.vhd" \

vlog -work xil_defaultlib "glbl.v"

