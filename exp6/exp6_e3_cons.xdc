set_property BITSTREAM.General.UnconstrainedPins {Allow} [current_design];
## Clock signal
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk }]; 
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clk }];

##LEDs
set_property -dict { PACKAGE_PIN C17   IOSTANDARD LVCMOS33 } [get_ports { cnt[31] }]; 
set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { cnt[30] }]; 
set_property -dict { PACKAGE_PIN E18   IOSTANDARD LVCMOS33 } [get_ports { cnt[29] }]; 
set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports { cnt[28] }]; 
set_property -dict { PACKAGE_PIN D17   IOSTANDARD LVCMOS33 } [get_ports { cnt[27] }]; 
set_property -dict { PACKAGE_PIN E17   IOSTANDARD LVCMOS33 } [get_ports { cnt[26] }]; 
set_property -dict { PACKAGE_PIN F18   IOSTANDARD LVCMOS33 } [get_ports { cnt[25] }]; 
set_property -dict { PACKAGE_PIN G18   IOSTANDARD LVCMOS33 } [get_ports { cnt[24] }]; 
