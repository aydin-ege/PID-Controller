onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib float_to_fixed_opt

do {wave.do}

view wave
view structure
view signals

do {float_to_fixed.udo}

run -all

quit -force
