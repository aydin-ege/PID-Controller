create_clock -period 50.000 -name i_adc_clk -waveform {0.000 25.000} -add [get_ports i_adc_clk]
create_clock -period 2.500 -name i_clk -waveform {0.000 1.250} -add [get_ports i_clk]
#set_output_delay -clock [get_clocks i_adc_clk] -min -add_delay -2.667 [get_ports {o_output[*]}]
#set_output_delay -clock [get_clocks i_adc_clk] -max -add_delay 0.817 [get_ports {o_output[*]}]


