onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib multiplier_core_opt

do {wave.do}

view wave
view structure
view signals

do {multiplier_core.udo}

run -all

quit -force
