################################################################################
# VC707 Constraints File
# Sorted (except for FMC, fuck FMC) and human readable
# Author: Mitchell Gu
################################################################################

################################################################################
# CLOCKS
################################################################################

# SYSCLK 200MHz
set_property PACKAGE_PIN E19 [get_ports SYSCLK_P]
set_property IOSTANDARD LVDS [get_ports SYSCLK_P]
set_property PACKAGE_PIN E18 [get_ports SYSCLK_N]
set_property IOSTANDARD LVDS [get_ports SYSCLK_N]


## LEDs
set_property PACKAGE_PIN AM39 [get_ports {ADC_alarm}]
set_property IOSTANDARD LVCMOS18 [get_ports {ADC_alarm}]
#set_property PACKAGE_PIN AN39 [get_ports GPIO_LED_1_LS]
#set_property IOSTANDARD LVCMOS18 [get_ports GPIO_LED_1_LS]

## obviously change these :)
#set_property PACKAGE_PIN AR37 [get_ports {PWM_R}] 
#set_property IOSTANDARD LVCMOS18 [get_ports {PWM_R}]
#set_property PACKAGE_PIN AT37 [get_ports {PWM_L}]
#set_property IOSTANDARD LVCMOS18 [get_ports {PWM_L}]
## ^^^^^

set_property PACKAGE_PIN AK39 [get_ports PWM_R]
set_property IOSTANDARD LVCMOS18 [get_ports PWM_R]
set_property PACKAGE_PIN AJ42 [get_ports PWM_L]
set_property IOSTANDARD LVCMOS18 [get_ports PWM_L]


#set_property PACKAGE_PIN AR35 [get_ports GPIO_LED_4_LS]
#set_property IOSTANDARD LVCMOS18 [get_ports GPIO_LED_4_LS]
#set_property PACKAGE_PIN AP41 [get_ports GPIO_LED_5_LS]
#set_property IOSTANDARD LVCMOS18 [get_ports GPIO_LED_5_LS]
#set_property PACKAGE_PIN AP42 [get_ports GPIO_LED_6_LS]
#set_property IOSTANDARD LVCMOS18 [get_ports GPIO_LED_6_LS]
#set_property PACKAGE_PIN AU39 [get_ports GPIO_LED_7_LS]
#set_property IOSTANDARD LVCMOS18 [get_ports GPIO_LED_7_LS]

## DIP Switches
set_property PACKAGE_PIN AV30 [get_ports {reset}]
set_property IOSTANDARD LVCMOS18 [get_ports {reset}]
#set_property PACKAGE_PIN AY33 [get_ports GPIO_DIP_SW1]
#set_property IOSTANDARD LVCMOS18 [get_ports GPIO_DIP_SW1]
#set_property PACKAGE_PIN BA31 [get_ports GPIO_DIP_SW2]
#set_property IOSTANDARD LVCMOS18 [get_ports GPIO_DIP_SW2]
#set_property PACKAGE_PIN BA32 [get_ports GPIO_DIP_SW3]
#set_property IOSTANDARD LVCMOS18 [get_ports GPIO_DIP_SW3]
#set_property PACKAGE_PIN AW30 [get_ports GPIO_DIP_SW4]
#set_property IOSTANDARD LVCMOS18 [get_ports GPIO_DIP_SW4]
#set_property PACKAGE_PIN AY30 [get_ports GPIO_DIP_SW5]
#set_property IOSTANDARD LVCMOS18 [get_ports GPIO_DIP_SW5]
#set_property PACKAGE_PIN BA30 [get_ports GPIO_DIP_SW6]
#set_property IOSTANDARD LVCMOS18 [get_ports GPIO_DIP_SW6]
#set_property PACKAGE_PIN BB31 [get_ports GPIO_DIP_SW7]
#set_property IOSTANDARD LVCMOS18 [get_ports GPIO_DIP_SW7]

## Pushbuttons
#set_property PACKAGE_PIN AV39 [get_ports GPIO_SW_C]
#set_property IOSTANDARD LVCMOS18 [get_ports GPIO_SW_C]
#set_property PACKAGE_PIN AR40 [get_ports GPIO_SW_N]
#set_property IOSTANDARD LVCMOS18 [get_ports GPIO_SW_N]
#set_property PACKAGE_PIN AU38 [get_ports GPIO_SW_E]
#set_property IOSTANDARD LVCMOS18 [get_ports GPIO_SW_E]
#set_property PACKAGE_PIN AP40 [get_ports GPIO_SW_S]
#set_property IOSTANDARD LVCMOS18 [get_ports GPIO_SW_S]
#set_property PACKAGE_PIN AW40 [get_ports GPIO_SW_W]
#set_property IOSTANDARD LVCMOS18 [get_ports GPIO_SW_W]

################################################################################
# XADC
################################################################################

set_property PACKAGE_PIN AN38 [get_ports {adc_input[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {adc_input[0]}]
set_property PACKAGE_PIN AP38 [get_ports {adc_input[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {adc_input[1]}]
#set_property PACKAGE_PIN AM41 [get_ports XADC_VAUX8P_R]
#set_property IOSTANDARD LVCMOS18 [get_ports XADC_VAUX8P_R]
#set_property PACKAGE_PIN AM42 [get_ports XADC_VAUX8N_R]
#set_property IOSTANDARD LVCMOS18 [get_ports XADC_VAUX8N_R]

#set_property PACKAGE_PIN BA21 [get_ports XADC_GPIO_0]
#set_property IOSTANDARD LVCMOS18 [get_ports XADC_GPIO_0]
#set_property PACKAGE_PIN BB21 [get_ports XADC_GPIO_1]
#set_property IOSTANDARD LVCMOS18 [get_ports XADC_GPIO_1]
#set_property PACKAGE_PIN BB24 [get_ports XADC_GPIO_2]
#set_property IOSTANDARD LVCMOS18 [get_ports XADC_GPIO_2]
#set_property PACKAGE_PIN BB23 [get_ports XADC_GPIO_3]
#set_property IOSTANDARD LVCMOS18 [get_ports XADC_GPIO_3]

