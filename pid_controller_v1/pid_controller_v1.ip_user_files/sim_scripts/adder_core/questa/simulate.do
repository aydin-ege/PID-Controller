onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib adder_core_opt

do {wave.do}

view wave
view structure
view signals

do {adder_core.udo}

run -all

quit -force
