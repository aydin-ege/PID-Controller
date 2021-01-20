vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../test_code.srcs/sources_1/ip/vio_0/hdl/verilog" "+incdir+../../../../test_code.srcs/sources_1/ip/vio_0/hdl" "+incdir+../../../../test_code.srcs/sources_1/ip/vio_0/hdl/verilog" "+incdir+../../../../test_code.srcs/sources_1/ip/vio_0/hdl" \
"D:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"D:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../test_code.srcs/sources_1/ip/vio_0/sim/vio_0.vhd" \


vlog -work xil_defaultlib "glbl.v"
