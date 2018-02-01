## Generated SDC file "EECS301_Lab3_Project.sdc"

## Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, the Altera Quartus II License Agreement,
## the Altera MegaCore Function License Agreement, or other 
## applicable license agreement, including, without limitation, 
## that your use is for the sole purpose of programming logic 
## devices manufactured by Altera and sold by Altera or its 
## authorized distributors.  Please refer to the applicable 
## agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 15.0.2 Build 153 07/15/2015 SJ Web Edition"

## DATE    "Sun Jan 29 19:55:24 2017"

##
## DEVICE  "5CSEMA5F31C6"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {CLOCK_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK_50}]

# Virtual clocks for input and output signals
create_clock -name {ext_input_vclk} -period 20.0
create_clock -name {ext_output_vclk} -period 20.0


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

derive_clock_uncertainty


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {ext_input_vclk}] -max 0.0 [get_ports {KEY[*]}]
set_input_delay -add_delay  -clock [get_clocks {ext_input_vclk}] -min 0.0 [get_ports {KEY[*]}]
set_input_delay -add_delay  -clock [get_clocks {ext_input_vclk}] -max 0.0 [get_ports {SW[*]}]
set_input_delay -add_delay  -clock [get_clocks {ext_input_vclk}] -min 0.0 [get_ports {SW[*]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {ext_output_vclk}]  2.000 [get_ports {HEX0[*]}]
set_output_delay -add_delay  -clock [get_clocks {ext_output_vclk}]  2.000 [get_ports {HEX1[*]}]
set_output_delay -add_delay  -clock [get_clocks {ext_output_vclk}]  2.000 [get_ports {HEX2[*]}]
set_output_delay -add_delay  -clock [get_clocks {ext_output_vclk}]  2.000 [get_ports {HEX3[*]}]
set_output_delay -add_delay  -clock [get_clocks {ext_output_vclk}]  2.000 [get_ports {HEX4[*]}]
set_output_delay -add_delay  -clock [get_clocks {ext_output_vclk}]  2.000 [get_ports {HEX5[*]}]
set_output_delay -add_delay  -clock [get_clocks {ext_output_vclk}]  2.000 [get_ports {LEDR[*]}]


#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group { CLOCK_50 } -group { ext_input_vclk } -group { ext_output_vclk }


#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

