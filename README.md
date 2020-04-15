
# EE2026 Final Project
Basys 3 Microphone and OLED Entertainment System

## Features
1. Real-time audio volume indicator
2. Graphical visualisations and configurations
3. Musical Note detector

## User Guide
### Real-time volume indicator

#### Input Devices
`
SW0, PmodMIC3 on JA
`

#### Description

`
Display the peak volume (refreshing at ~3 Hz) on the 7-segment displays as a number between 0-15 and on the LED array. Turning on SW0 will display the input from the microphone directly on LEDs 0-11.  
`
### Graphical visualisations and configurations
#### Input Devices
`
SW1, SW2, SW3, btnR, btnL, btnC
`

#### Description 
##### SW1, SW2: 
`2’b01: 1 pixel-thick border 
2’b10: 3 pixel-thick border 
Else: No border 
`
##### SW3: 
`1’b1: Turn on volume bar 
1’b0: Turn off volume bar 
`
##### btnR: 
Toggle colour-modes 
`
Basic --> Pastel --> Dark`

1. Basic 
Bar: Green, Yellow, Red 
Border: White 
Background: Black 

2. Pastel 
Bar: Pink, Lilac, Periwinkle 
Border: Orange 
Background: Amber


3. Dark
Bar: Dark-grey, grey, light-grey 
Border: Black 
Background: Blue 


##### btnL: 
`Toggle freeze frame 
`
###### btnC: 
`Reset 
`

### Additional Volume Modes
#### Input Devices
`
SW12, SW13, SW14, SW15
`

#### Description
`
When SW15 is on, refresh the volume at 47Hz for a much smoother appearance.  
When SW14 is on, volume display on the 7-seg display is between 0-255 instead of 0-15. 
When SW13 is on, the volume display is logarithmic (overridden by SW14 if on) 
When SW12 is on, the seven-segment displays behave like a bar graph for the volume. (overridden by SW13 and 14 if on) 
`
### Additional Display Modes
#### Input Devices
`
SW10 
`

#### Description
`
When volume is within medium (5 ~ 10) range: 
Approving Drake will show on the display. 
When volume falls below (< 5) or above (10 >) medium range: 
Disapproving Drake will show on the display. 
`
### Note Detector
#### Input Devices
`
SW11, PmodMIC3 on JA 
`

#### Description
`
The microphone reads a note in the 4th or 5th octave, and displays the note on the 7-segment display and on a piano keyboard on the OLED display 
`

## Created by:
* Nur Amalina Sani
* Neil Banerjee

