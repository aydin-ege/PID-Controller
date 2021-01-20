@echo off
set xv_path=D:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 6a963442494446658543334aba3670a0 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L xbip_utils_v3_0_7 -L xbip_pipe_v3_0_3 -L xbip_bram18k_v3_0_3 -L mult_gen_v12_0_12 -L ieee_proposed -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot top_module_tb_behav xil_defaultlib.top_module_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
