## Constraint file for D Flip-Flop Frequency Divider
## Target: Basys 3 (Artix-7 XC7A35T)
## Design: dflipflop_fd.v

## Clock signal (100 MHz onboard clock)
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]

## Reset — mapped to center button (BTNC)
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

## D input — mapped to Switch SW0
set_property PACKAGE_PIN V17 [get_ports d]
set_property IOSTANDARD LVCMOS33 [get_ports d]

## Q output — mapped to LED0
set_property PACKAGE_PIN U16 [get_ports q]
set_property IOSTANDARD LVCMOS33 [get_ports q]

## Bitstream settings
set_property BITSTREAM.STARTUP.STARTUPCLK JTAGCLK [current_design]
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
