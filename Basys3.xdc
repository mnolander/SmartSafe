## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
    set_property IOSTANDARD LVCMOS33 [get_ports clk]
    create_clock -add -name sys_clk_pin -period 20.00 -waveform {0 5} [get_ports clk]
set_property PACKAGE_PIN R2 [get_ports reset]     
        set_property IOSTANDARD LVCMOS33 [get_ports reset]
 
 ## Switches
set_property PACKAGE_PIN V17 [get_ports {selectDigit[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {selectDigit[0]}]
set_property PACKAGE_PIN V16 [get_ports {selectDigit[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {selectDigit[1]}]
set_property PACKAGE_PIN W16 [get_ports {selectDigit[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {selectDigit[2]}]
set_property PACKAGE_PIN W17 [get_ports {selectDigit[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {selectDigit[3]}]
	
##Buttons
#Left button
set_property PACKAGE_PIN W19 [get_ports passwordButton]						
	set_property IOSTANDARD LVCMOS33 [get_ports passwordButton]
#Right button
set_property PACKAGE_PIN T17 [get_ports lockButton]						
	set_property IOSTANDARD LVCMOS33 [get_ports lockButton]
#Top button
set_property PACKAGE_PIN T18 [get_ports unlockButton]						
	set_property IOSTANDARD LVCMOS33 [get_ports unlockButton]

##7 segment display
set_property PACKAGE_PIN W7 [get_ports {seg[6]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]
set_property PACKAGE_PIN W6 [get_ports {seg[5]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property PACKAGE_PIN U8 [get_ports {seg[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property PACKAGE_PIN V8 [get_ports {seg[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property PACKAGE_PIN U5 [get_ports {seg[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property PACKAGE_PIN V5 [get_ports {seg[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
set_property PACKAGE_PIN U7 [get_ports {seg[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]
 
set_property PACKAGE_PIN U2 [get_ports {an[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]
     
##Pmod Header JA
##Sch name = JA1
set_property PACKAGE_PIN J1 [get_ports {JA[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {JA[0]}]
#Sch name = JA2
set_property PACKAGE_PIN L2 [get_ports {JA[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {JA[1]}]
#Sch name = JA3
set_property PACKAGE_PIN J2 [get_ports {JA[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {JA[2]}]
#Sch name = JA4
set_property PACKAGE_PIN G2 [get_ports {JA[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {JA[3]}]
#Sch name = JA7
set_property PACKAGE_PIN H1 [get_ports {JA[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {JA[4]}]
#Sch name = JA8
set_property PACKAGE_PIN K2 [get_ports {JA[5]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {JA[5]}]
#Sch name = JA9
set_property PACKAGE_PIN H2 [get_ports {JA[6]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {JA[6]}]
#Sch name = JA10
set_property PACKAGE_PIN G3 [get_ports {JA[7]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {JA[7]}]
    
##Pmod Header JB
##Sch name = JB1
#set_property PACKAGE_PIN A14 [get_ports {JB[0]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[0]}]
##Sch name = JB2
#set_property PACKAGE_PIN A16 [get_ports {JB[1]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[1]}]
##Sch name = JB3
#set_property PACKAGE_PIN B15 [get_ports {JB[2]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[2]}]
##Sch name = JB4
set_property PACKAGE_PIN B16 [get_ports {servoOut}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {servoOut}]
##Sch name = JB7
#set_property PACKAGE_PIN A15 [get_ports {JB[4]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[4]}]
##Sch name = JB8
#set_property PACKAGE_PIN A17 [get_ports {JB[5]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[5]}]
##Sch name = JB9
#set_property PACKAGE_PIN C15 [get_ports {JB[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[6]}]
##Sch name = JB10 
#set_property PACKAGE_PIN C16 [get_ports {JB[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[7]}]
 
##Pmod Header JC
##Sch name = JC4
set_property PACKAGE_PIN P18 [get_ports {buzzer}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {buzzer}]
##Sch name = JC10
set_property PACKAGE_PIN R18 [get_ports {greenLED}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {greenLED}]

 
 
## Configuration options, can be used for all designs
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]