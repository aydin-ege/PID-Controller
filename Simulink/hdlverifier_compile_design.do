# Create design library
vlib work
# Create and open project
project new . compile_project
project open compile_project
# Add source files to project
project addfile "D:/my/Vivado/PID_Controller/ModelSim.srcs/derivative.vhd"
project addfile "D:/my/Vivado/PID_Controller/ModelSim.srcs/integral.vhd"
project addfile "D:/my/Vivado/PID_Controller/ModelSim.srcs/PID_to_output.vhd"
project addfile "D:/my/Vivado/PID_Controller/ModelSim.srcs/proportional.vhd"
project addfile "D:/my/Vivado/PID_Controller/ModelSim.srcs/top_module.vhd"
# Calculate compilation order
project calculateorder
set compcmd [project compileall -n]
# Close project
project close
# Compile all files and report error
if [catch {eval $compcmd}] {
    exit -code 1
}
