# 
# Synthesis run script generated by Vivado
# 

namespace eval rt {
    variable rc
}
set rt::rc [catch {
  uplevel #0 {
    set ::env(BUILTIN_SYNTH) true
    source $::env(HRT_TCL_PATH)/rtSynthPrep.tcl
    rt::HARTNDb_resetJobStats
    rt::HARTNDb_startJobStats
    set rt::cmdEcho 0
    rt::set_parameter writeXmsg true
    rt::set_parameter enableParallelHelperSpawn true
    set ::env(RT_TMP) "C:/Users/90534/Desktop/sum proj/PID_Controller/.Xil/Vivado-21444-Erdem/realtime/tmp"
    if { [ info exists ::env(RT_TMP) ] } {
      file delete -force $::env(RT_TMP)
      file mkdir $::env(RT_TMP)
    }

    rt::delete_design

    set rt::partid xc7vx485tffg1761-2

    set rt::multiChipSynthesisFlow false
    source $::env(SYNTH_COMMON)/common_vhdl.tcl
    set rt::defaultWorkLibName xil_defaultlib

    set rt::useElabCache false
    if {$rt::useElabCache == false} {
      rt::read_verilog {
      {C:/Users/90534/Desktop/sum proj/PID_Controller/.Xil/Vivado-21444-Erdem/realtime/fixed_to_float_stub.v}
      {C:/Users/90534/Desktop/sum proj/PID_Controller/.Xil/Vivado-21444-Erdem/realtime/multiplier_core_stub.v}
      {C:/Users/90534/Desktop/sum proj/PID_Controller/.Xil/Vivado-21444-Erdem/realtime/adder_core_stub.v}
      {C:/Users/90534/Desktop/sum proj/PID_Controller/.Xil/Vivado-21444-Erdem/realtime/accumulator_core_stub.v}
      {C:/Users/90534/Desktop/sum proj/PID_Controller/.Xil/Vivado-21444-Erdem/realtime/float_to_fixed_stub.v}
      {C:/Users/90534/Desktop/sum proj/PID_Controller/.Xil/Vivado-21444-Erdem/realtime/subtractor_core_stub.v}
    }
      rt::read_vhdl -lib xil_defaultlib {
      {C:/Users/90534/Desktop/sum proj/PID_Controller/PID_Controller.srcs/sources_1/imports/new/proportional.vhd}
      {C:/Users/90534/Desktop/sum proj/PID_Controller/PID_Controller.srcs/sources_1/imports/new/PID_to_output.vhd}
      {C:/Users/90534/Desktop/sum proj/PID_Controller/PID_Controller.srcs/sources_1/imports/new/integral.vhd}
      {C:/Users/90534/Desktop/sum proj/PID_Controller/PID_Controller.srcs/sources_1/imports/new/derivative.vhd}
      {C:/Users/90534/Desktop/sum proj/PID_Controller/PID_Controller.srcs/sources_1/imports/new/top_module.vhd}
    }
      rt::filesetChecksum
    }
    rt::set_parameter usePostFindUniquification false
    set rt::top top_module
    set rt::reportTiming false
    rt::set_parameter elaborateOnly true
    rt::set_parameter elaborateRtl true
    rt::set_parameter eliminateRedundantBitOperator false
    rt::set_parameter writeBlackboxInterface true
    rt::set_parameter merge_flipflops true
    rt::set_parameter srlDepthThreshold 3
    rt::set_parameter rstSrlDepthThreshold 4
# MODE: 
    rt::set_parameter webTalkPath {}
    rt::set_parameter enableSplitFlowPath "C:/Users/90534/Desktop/sum proj/PID_Controller/.Xil/Vivado-21444-Erdem/"
    set ok_to_delete_rt_tmp true 
    if { [rt::get_parameter parallelDebug] } { 
       set ok_to_delete_rt_tmp false 
    } 
    if {$rt::useElabCache == false} {
        set oldMIITMVal [rt::get_parameter maxInputIncreaseToMerge]; rt::set_parameter maxInputIncreaseToMerge 1000
        set oldCDPCRL [rt::get_parameter createDfgPartConstrRecurLimit]; rt::set_parameter createDfgPartConstrRecurLimit 1
      rt::run_rtlelab -module $rt::top
        rt::set_parameter maxInputIncreaseToMerge $oldMIITMVal
        rt::set_parameter createDfgPartConstrRecurLimit $oldCDPCRL
    }

    set rt::flowresult [ source $::env(SYNTH_COMMON)/flow.tcl ]
    rt::HARTNDb_stopJobStats
    if { $rt::flowresult == 1 } { return -code error }

    if { [ info exists ::env(RT_TMP) ] } {
      if { [info exists ok_to_delete_rt_tmp] && $ok_to_delete_rt_tmp } { 
        file delete -force $::env(RT_TMP)
      }
    }


  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] && [info exists rt::doParallel] && $rt::doParallel} { 
     $rt::db killSynthHelper $hsKey
  } 
  rt::set_parameter helper_shm_key "" 
    source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  } ; #end uplevel
} rt::result]

if { $rt::rc } {
  $rt::db resetHdlParse
  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] && [info exists rt::doParallel] && $rt::doParallel} { 
     $rt::db killSynthHelper $hsKey
  } 
  source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  return -code "error" $rt::result
}