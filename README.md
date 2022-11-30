# Electronic safe using the Basys 3 FPGA
Project written in VHDL to create an electronic safe with password functionality and PMOD interfacing.

## Components
 - Basys 3 FPGA
 - Digilent PMOD KYPD 16-button keypad
 - Servo motor (MicroServo 9g SG90)
 - Passive buzzer
 - Green LED

![](https://raw.githubusercontent.com/mnolander/SmartSafe/main/Overview.png?token=GHSAT0AAAAAAB2G5BWQQP2G3VCVIP2BS5LEY4G7YWA)

## FPGA Pins
- **Servo:** POWER -> VCC on JB, GND -> GND on JB, SIGNAL -> JB4
- **Buzzer:** GND -> GND on JC, POSITIVE -> JC4
- **LED:** GND -> GND on JC, POSITIVE -> JC10

## Operation
 - The safe will boot up in 'SET' mode. 
 - The four leftmost switches on the FPGA are used to select a digit to input through the keypad. 
 - To set a password, press the left button on the FPGA and the green LED should turn on indicating the password was set. (safe must be in 'UNLOCKED' mode and switches must be down)
 - To lock the safe, press the right button on the FPGA. The servo will move to the 'closed' position and the seven-segment display will reset to "0000".
 - To unlock the safe, type in the correct password and press the top button on the FPGA.
 
 ## VHDL Component Files
 - [SmartSafeMain](https://github.com/mnolander/SmartSafe/blob/main/SmartSafeMain.vhd): Main file, handles component port mapping and global states
 - [Decoder](https://github.com/mnolander/SmartSafe/blob/main/Decoder.vhd): For decoding input from keypad and selecting digits
 - [SevenSeg](https://github.com/mnolander/SmartSafe/blob/main/SmartSafeProject.srcs/sources_1/new/SevenSeg.vhd): Contains decoder for displaying proper numbers and letters on seven-segment and refreshes display in order to show different digits on each display
 - [ServoClock](https://github.com/mnolander/SmartSafe/blob/main/SmartSafeProject.srcs/sources_1/new/ServoClock.vhd): Divides main clock to be used for servo PWM generation
 - [ServoPWM](https://github.com/mnolander/SmartSafe/blob/main/SmartSafeProject.srcs/sources_1/new/ServoPWM.vhd): Takes divided clock from ServoClock and uses it to generate a PWM signal for servo position
 - [BuzzerClock](https://github.com/mnolander/SmartSafe/blob/main/SmartSafeProject.srcs/sources_1/new/BuzzerClock.vhd): Divides main clock to generate square wave for buzzer to make audible sound
 - [state_package](https://github.com/mnolander/SmartSafe/blob/main/SmartSafeProject.srcs/sources_1/new/state_package.vhd): Contains global states to be used across files
