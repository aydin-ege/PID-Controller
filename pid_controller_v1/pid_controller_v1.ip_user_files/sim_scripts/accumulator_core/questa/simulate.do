onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib accumulator_core_opt

do {wave.do}

view wave
view structure
view signals

do {accumulator_core.udo}

run -all

quit -force
