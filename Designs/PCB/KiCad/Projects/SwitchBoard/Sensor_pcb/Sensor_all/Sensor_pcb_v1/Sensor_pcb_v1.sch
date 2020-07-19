EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:Crystal Y2
U 1 1 5F0D9577
P 7350 7900
F 0 "Y2" V 7304 8031 50  0000 L CNN
F 1 "8Mhz" V 7395 8031 50  0000 L CNN
F 2 "Crystals:Crystal_HC49-4H_Vertical" H 7350 7900 50  0001 C CNN
F 3 "~" H 7350 7900 50  0001 C CNN
	1    7350 7900
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 5F0DAA87
P 6350 7550
F 0 "Y1" V 6304 7681 50  0000 L CNN
F 1 "32.768K" V 6395 7681 50  0000 L CNN
F 2 "Crystals:Crystal_HC49-4H_Vertical" H 6350 7550 50  0001 C CNN
F 3 "~" H 6350 7550 50  0001 C CNN
	1    6350 7550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5F0E2D13
P 7350 7400
F 0 "R2" H 7420 7446 50  0000 L CNN
F 1 "1M" H 7420 7355 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" V 7280 7400 50  0001 C CNN
F 3 "~" H 7350 7400 50  0001 C CNN
	1    7350 7400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7200 7900 7000 7900
Wire Wire Line
	7000 7900 7000 7400
Wire Wire Line
	7500 7900 7700 7900
Wire Wire Line
	7700 7900 7700 7400
Wire Wire Line
	7500 7400 7700 7400
Wire Wire Line
	7200 7400 7000 7400
$Comp
L Device:C C4
U 1 1 5F0E49DE
P 7000 8100
F 0 "C4" V 6748 8100 50  0000 C CNN
F 1 "20pf" V 6839 8100 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 7038 7950 50  0001 C CNN
F 3 "~" H 7000 8100 50  0001 C CNN
	1    7000 8100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5F0E6674
P 7700 8100
F 0 "C5" V 7448 8100 50  0000 C CNN
F 1 "20pf" V 7539 8100 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 7738 7950 50  0001 C CNN
F 3 "~" H 7700 8100 50  0001 C CNN
	1    7700 8100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 7950 7700 7900
Connection ~ 7700 7900
Wire Wire Line
	7000 7950 7000 7900
Connection ~ 7000 7900
Wire Wire Line
	7000 8250 7700 8250
$Comp
L Device:C C3
U 1 1 5F0E94E8
P 6550 8100
F 0 "C3" V 6298 8100 50  0000 C CNN
F 1 "20pf" V 6389 8100 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 6588 7950 50  0001 C CNN
F 3 "~" H 6550 8100 50  0001 C CNN
	1    6550 8100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5F0E9AA7
P 6150 8100
F 0 "C2" V 5898 8100 50  0000 C CNN
F 1 "20pf" V 5989 8100 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 6188 7950 50  0001 C CNN
F 3 "~" H 6150 8100 50  0001 C CNN
	1    6150 8100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 8250 6550 8250
Connection ~ 6550 8250
Wire Wire Line
	6550 8250 7000 8250
Connection ~ 7000 8250
Wire Wire Line
	6550 7950 6550 7550
Wire Wire Line
	6550 7550 6500 7550
Wire Wire Line
	6200 7550 6150 7550
Wire Wire Line
	6150 7550 6150 7950
$Comp
L Connector_Generic:Conn_02x03_Top_Bottom J1
U 1 1 5F0FF079
P 1250 1450
F 0 "J1" H 1300 1767 50  0000 C CNN
F 1 "Header 3x2" H 1300 1250 50  0000 C CNN
F 2 "Custom_Libraries:Pin_Header_02x03" H 1250 1450 50  0001 C CNN
F 3 "~" H 1250 1450 50  0001 C CNN
	1    1250 1450
	1    0    0    -1  
$EndComp
Text Label 1800 1050 2    50   ~ 0
VCC3V3
Wire Wire Line
	1550 1050 1550 1150
Wire Wire Line
	1550 1150 1050 1150
Wire Wire Line
	1050 1150 1050 1350
Connection ~ 1550 1150
Wire Wire Line
	1550 1150 1550 1350
Wire Wire Line
	1050 1550 950  1550
Wire Wire Line
	950  1550 950  1850
Wire Wire Line
	950  1850 1150 1850
Wire Wire Line
	1150 1850 1550 1850
Wire Wire Line
	1550 1850 1550 1550
Connection ~ 1150 1850
Text Label 1800 1450 2    50   ~ 0
BOOT1
Text Label 750  1450 0    50   ~ 0
BOOT0
Wire Wire Line
	750  1450 1050 1450
Wire Wire Line
	1550 1450 1800 1450
Wire Wire Line
	1550 1050 1800 1050
Text Label 6150 7250 3    50   ~ 0
PC14
Wire Wire Line
	6150 7550 6150 7250
Connection ~ 6150 7550
Text Label 6550 7250 3    50   ~ 0
PC15
Wire Wire Line
	6550 7250 6550 7550
Connection ~ 6550 7550
Text Label 7000 7100 3    50   ~ 0
OSCIN
Wire Wire Line
	7000 7400 7000 7100
Connection ~ 7000 7400
Text Label 7700 7050 3    50   ~ 0
OSCOUT
Connection ~ 7700 7400
Wire Wire Line
	7700 7400 7700 7050
Text Label 2700 7950 0    50   ~ 0
PC14
Text Label 2700 8050 0    50   ~ 0
PC15
Wire Wire Line
	3000 7950 2700 7950
Wire Wire Line
	2700 8050 3000 8050
Text Label 2700 8150 0    50   ~ 0
OSCIN
Text Label 2700 8250 0    50   ~ 0
OSCOUT
Wire Wire Line
	2700 8150 3000 8150
Wire Wire Line
	3000 8250 2700 8250
Text Label 3950 6900 3    50   ~ 0
BOOT0
Wire Wire Line
	3950 7250 3950 6900
Text Label 5600 7750 2    50   ~ 0
VCC3V3
Wire Wire Line
	5200 7750 5600 7750
Text Label 2650 8550 0    50   ~ 0
VCC3V3
Wire Wire Line
	2650 8550 3000 8550
Text Label 2700 8350 0    50   ~ 0
RESET
Wire Wire Line
	2700 8350 3000 8350
$Comp
L Switch:SW_Push SW1
U 1 1 5F125580
P 2200 1600
F 0 "SW1" V 2200 1550 50  0000 R CNN
F 1 "SW_Push" V 2100 2050 50  0001 R CNN
F 2 "Buttons_Switches_SMD:SW_DIP_x1_W7.62mm_Slide_Copal_CHS-B" H 2200 1800 50  0001 C CNN
F 3 "~" H 2200 1800 50  0001 C CNN
	1    2200 1600
	0    -1   -1   0   
$EndComp
Text Label 2700 1400 2    50   ~ 0
RESET
Wire Wire Line
	2200 1400 2500 1400
$Comp
L power:GNDREF #PWR04
U 1 1 5F102D01
P 1150 1850
F 0 "#PWR04" H 1155 1677 50  0001 C CNN
F 1 "GNDREF" H 1155 1677 50  0000 C CNN
F 2 "" H 1150 1850 50  0001 C CNN
F 3 "" H 1150 1850 50  0001 C CNN
	1    1150 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 1800 2500 1800
Wire Wire Line
	2600 1800 2600 1850
$Comp
L Device:C C1
U 1 1 5F129E71
P 2500 1600
F 0 "C1" H 2385 1554 50  0000 R CNN
F 1 "105" H 2385 1645 50  0000 R CNN
F 2 "Capacitors_SMD:C_0805" H 2538 1450 50  0001 C CNN
F 3 "~" H 2500 1600 50  0001 C CNN
	1    2500 1600
	-1   0    0    1   
$EndComp
Wire Wire Line
	2500 1750 2500 1800
Connection ~ 2500 1800
Wire Wire Line
	2500 1800 2600 1800
Wire Wire Line
	2500 1450 2500 1400
Connection ~ 2500 1400
Wire Wire Line
	2500 1400 2700 1400
Text Label 2750 950  2    50   ~ 0
VCC3V3
$Comp
L Device:R R1
U 1 1 5F12CF37
P 2500 1150
F 0 "R1" H 2570 1196 50  0000 L CNN
F 1 "10K" H 2570 1105 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" V 2430 1150 50  0001 C CNN
F 3 "~" H 2500 1150 50  0001 C CNN
	1    2500 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1000 2500 950 
Wire Wire Line
	2500 950  2750 950 
Wire Wire Line
	2500 1300 2500 1400
$Comp
L power:GNDREF #PWR02
U 1 1 5F1282A4
P 2600 1850
F 0 "#PWR02" H 2605 1677 50  0001 C CNN
F 1 "GNDREF" H 2605 1677 50  0000 C CNN
F 2 "" H 2600 1850 50  0001 C CNN
F 3 "" H 2600 1850 50  0001 C CNN
	1    2600 1850
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:AP2112K-3.3 U1
U 1 1 5F13570F
P 2250 3500
F 0 "U1" H 2250 3842 50  0000 C CNN
F 1 "APK2112.K-3.3" H 2250 3751 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5" H 2250 3700 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 2350 3250 50  0001 C CNN
	1    2250 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 3400 1950 3500
$Comp
L power:+5V #PWR01
U 1 1 5F13A2AD
P 1750 3300
F 0 "#PWR01" H 1750 3150 50  0001 C CNN
F 1 "+5V" H 1765 3473 50  0000 C CNN
F 2 "" H 1750 3300 50  0001 C CNN
F 3 "" H 1750 3300 50  0001 C CNN
	1    1750 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 3300 1750 3400
Wire Wire Line
	1750 3400 1950 3400
Connection ~ 1950 3400
$Comp
L power:GNDREF #PWR03
U 1 1 5F13CA0F
P 2250 3850
F 0 "#PWR03" H 2255 3677 50  0001 C CNN
F 1 "GNDREF" H 2255 3677 50  0000 C CNN
F 2 "" H 2250 3850 50  0001 C CNN
F 3 "" H 2250 3850 50  0001 C CNN
	1    2250 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 3800 2250 3850
Text Label 2850 3400 2    50   ~ 0
VCC3V3
Wire Wire Line
	2550 3400 2800 3400
Text Label 2450 3800 0    50   ~ 0
GND
Connection ~ 2250 3800
Text Label 6150 8600 1    50   ~ 0
GND
Wire Wire Line
	6150 8600 6150 8250
Connection ~ 6150 8250
$Comp
L Connector_Generic:Conn_01x05 J2
U 1 1 5F0DE12E
P 12300 7950
F 0 "J2" H 12218 7525 50  0000 C CNN
F 1 "Prog Hdr" H 12218 7616 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 12300 7950 50  0001 C CNN
F 3 "~" H 12300 7950 50  0001 C CNN
	1    12300 7950
	-1   0    0    1   
$EndComp
Text Label 12700 7750 2    50   ~ 0
GND
Text Label 1550 3400 0    50   ~ 0
5V
Wire Wire Line
	1550 3400 1750 3400
Connection ~ 1750 3400
Text Label 12800 7850 2    50   ~ 0
5V
Text Label 13000 7950 2    50   ~ 0
VCC3V3
Wire Wire Line
	12500 7750 12700 7750
Wire Wire Line
	12800 7850 12500 7850
Wire Wire Line
	12500 7950 13000 7950
Text Label 5550 8350 2    50   ~ 0
TX0
Wire Wire Line
	5200 8350 5550 8350
Text Label 5550 8250 2    50   ~ 0
RX0
Wire Wire Line
	5550 8250 5200 8250
Text Label 12850 8050 2    50   ~ 0
RX0
Text Label 12850 8150 2    50   ~ 0
TX0
Wire Wire Line
	12850 8150 12500 8150
Wire Wire Line
	12500 8050 12850 8050
$Comp
L Connector:Conn_01x04_Female J4
U 1 1 5F12B0FD
P 10200 8000
F 0 "J4" H 10300 7750 50  0000 C CNN
F 1 "SWD" H 10050 8250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 10200 8000 50  0001 C CNN
F 3 "~" H 10200 8000 50  0001 C CNN
	1    10200 8000
	-1   0    0    1   
$EndComp
Text Label 5550 7950 2    50   ~ 0
SWIO
Wire Wire Line
	5200 7950 5550 7950
Text Label 4650 6950 3    50   ~ 0
SWCLK
Wire Wire Line
	4650 6950 4650 7250
Text Label 10750 7900 2    50   ~ 0
SWIO
Text Label 10750 8000 2    50   ~ 0
SWCLK
Wire Wire Line
	10400 7900 10750 7900
Wire Wire Line
	10750 8000 10400 8000
Wire Wire Line
	10700 7800 10400 7800
Text Label 10650 8100 2    50   ~ 0
GND
Wire Wire Line
	10650 8100 10400 8100
$Comp
L Device:LED D1
U 1 1 5F13F264
P 3150 4600
F 0 "D1" H 3143 4345 50  0000 C CNN
F 1 "LED" H 3143 4436 50  0000 C CNN
F 2 "Diodes_SMD:D_0805" H 3150 4600 50  0001 C CNN
F 3 "~" H 3150 4600 50  0001 C CNN
	1    3150 4600
	0    1    1    0   
$EndComp
Text Label 10700 7800 2    50   ~ 0
VCC3V3
Text Label 3150 4300 1    50   ~ 0
VCC3V3
Text Label 3150 5450 3    50   ~ 0
GND
$Comp
L Device:R R3
U 1 1 5F141954
P 3150 5100
F 0 "R3" V 3050 5050 50  0000 L CNN
F 1 "510 R" V 3250 5000 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" V 3080 5100 50  0001 C CNN
F 3 "~" H 3150 5100 50  0001 C CNN
	1    3150 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 4450 3150 4300
Wire Wire Line
	3150 4750 3150 4950
Wire Wire Line
	3150 5250 3150 5450
$Comp
L Device:C C7
U 1 1 5F14D815
P 2800 3600
F 0 "C7" H 2548 3600 50  0000 C CNN
F 1 "100 nf" V 2639 3600 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 2838 3450 50  0001 C CNN
F 3 "~" H 2800 3600 50  0001 C CNN
	1    2800 3600
	-1   0    0    1   
$EndComp
Wire Wire Line
	2800 3800 2800 3750
Wire Wire Line
	2250 3800 2800 3800
Wire Wire Line
	2800 3450 2800 3400
Connection ~ 2800 3400
Wire Wire Line
	2800 3400 2850 3400
$Comp
L Device:C C6
U 1 1 5F152167
P 1750 3600
F 0 "C6" H 1900 3600 50  0000 C CNN
F 1 "100 nf" V 1650 3600 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 1788 3450 50  0001 C CNN
F 3 "~" H 1750 3600 50  0001 C CNN
	1    1750 3600
	-1   0    0    1   
$EndComp
Wire Wire Line
	1750 3400 1750 3450
Wire Wire Line
	1750 3750 2250 3750
Wire Wire Line
	2250 3750 2250 3800
Text Label 3550 7000 3    50   ~ 0
VCC3V3
Wire Wire Line
	3550 7000 3550 7250
Text Label 4650 9700 1    50   ~ 0
VCC3V3
Text Label 4550 9600 1    50   ~ 0
GND
Text Label 2750 8450 0    50   ~ 0
GND
Wire Wire Line
	2750 8450 3000 8450
Text Label 3650 7050 3    50   ~ 0
GND
Wire Wire Line
	3650 7050 3650 7250
Text Label 5500 7850 2    50   ~ 0
GND
Wire Wire Line
	5500 7850 5200 7850
Text Label 2800 1800 0    50   ~ 0
GND
Wire Wire Line
	2600 1800 2800 1800
Connection ~ 2600 1800
Text Label 1700 1850 0    50   ~ 0
GND
Wire Wire Line
	1550 1850 1700 1850
Connection ~ 1550 1850
Wire Notes Line
	3400 500  3400 5700
$Comp
L lora:LoRa U3
U 1 1 5F21A746
P 6000 3650
F 0 "U3" H 6000 4387 60  0000 C CNN
F 1 "LoRa" H 6000 4281 60  0000 C CNN
F 2 "Custom_Libraries:LoRa" H 6000 3200 60  0001 C CNN
F 3 "" H 6000 3200 60  0001 C CNN
	1    6000 3650
	1    0    0    -1  
$EndComp
Text Label 6900 3300 2    50   ~ 0
GND
Text Label 5000 3400 0    50   ~ 0
GND
Wire Wire Line
	5000 3400 5300 3400
Text Label 5000 3500 0    50   ~ 0
VCC3V3
Wire Wire Line
	5000 3500 5300 3500
Text Label 6900 4000 2    50   ~ 0
GND
Wire Wire Line
	6700 4000 6900 4000
Text Notes 10250 8550 0    79   Italic 0
Programming Headers
Text Notes 1500 5500 0    79   Italic 0
Power
Text Notes 1550 2500 0    79   Italic 0
Boot & Reset
Text Notes 5550 4350 0    79   Italic 0
LoRa Module
Text Notes 5800 9600 0    79   Italic 0
STM & Crystals\n
Text Label 6900 3600 2    50   ~ 0
MISO
Text Label 6900 3500 2    50   ~ 0
MOSI
Text Label 6900 3700 2    50   ~ 0
SCK
Wire Wire Line
	6700 3700 6900 3700
Wire Wire Line
	6900 3600 6700 3600
Wire Wire Line
	6700 3500 6900 3500
Text Label 5050 3700 0    50   ~ 0
DIO0
Wire Wire Line
	5050 3700 5300 3700
Text Label 5050 3800 0    50   ~ 0
DIO1
Wire Wire Line
	5300 3800 5050 3800
Wire Notes Line
	500  5700 3400 5700
Text Label 5050 3600 0    50   ~ 0
Reset
Wire Wire Line
	5050 3600 5300 3600
Text Label 6900 3400 2    50   ~ 0
NSS
Wire Wire Line
	6900 3400 6700 3400
Wire Wire Line
	6700 3300 6900 3300
Text Label 3650 9650 1    50   ~ 0
NSS
Wire Wire Line
	3650 9350 3650 9650
Text Label 3950 9650 1    50   ~ 0
MOSI
Text Label 3850 9650 1    50   ~ 0
MISO
Text Label 3750 9650 1    50   ~ 0
SCK
Text Label 3550 9650 1    50   ~ 0
DIO1
Wire Wire Line
	3550 9650 3550 9350
Text Label 2750 8850 0    50   ~ 0
DIO0
Wire Wire Line
	2750 8850 3000 8850
Text Label 2750 8750 0    50   ~ 0
Reset
Wire Wire Line
	2750 8750 3000 8750
NoConn ~ 6700 3800
NoConn ~ 6700 3900
NoConn ~ 5300 4000
NoConn ~ 5300 3900
$Comp
L Device:Antenna AE1
U 1 1 5F2C5F88
P 4800 2950
F 0 "AE1" H 4880 2939 50  0000 L CNN
F 1 "Antenna" H 4880 2848 50  0000 L CNN
F 2 "SMD_Packages:1Pin" H 4800 2950 50  0001 C CNN
F 3 "~" H 4800 2950 50  0001 C CNN
	1    4800 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 3150 4800 3300
Wire Wire Line
	4800 3300 5300 3300
Wire Notes Line
	12100 500  12150 6850
Wire Notes Line
	12150 6850 16100 6850
Text Notes 13900 6750 0    50   Italic 0
Sensors\n
Text Label 2700 8650 0    50   ~ 0
Touch_1
Wire Wire Line
	2700 8650 3000 8650
Text Label 5550 8850 2    50   ~ 0
Touch_2
Wire Wire Line
	4650 9700 4650 9350
Wire Wire Line
	4250 9350 4250 9650
Wire Wire Line
	3950 9350 3950 9650
Wire Wire Line
	3850 9650 3850 9350
Wire Wire Line
	3750 9650 3750 9350
$Comp
L stm32:STM32 U2
U 1 1 5F0D833D
P 4050 8100
F 0 "U2" H 5050 9000 60  0000 L CNN
F 1 "STM32" H 3900 7800 118 0000 L CNN
F 2 "Custom_Libraries:STM32(LQFP48)" H 4050 8100 60  0001 C CNN
F 3 "" H 4050 8100 60  0001 C CNN
	1    4050 8100
	1    0    0    -1  
$EndComp
Text Label 5550 8750 2    50   ~ 0
Touch_3
Text Label 2700 7850 0    50   ~ 0
Touch_3
Wire Wire Line
	2700 7850 3000 7850
Text Label 5550 8050 2    50   ~ 0
DSW_1
Wire Wire Line
	5550 8050 5200 8050
Text Label 5550 8150 2    50   ~ 0
DSW_2
Wire Wire Line
	5550 8150 5200 8150
Text Label 4350 9650 1    50   ~ 0
DSW_3
Wire Wire Line
	4350 9650 4350 9350
Text Label 4450 9650 1    50   ~ 0
DSW_4
Wire Wire Line
	4450 9650 4450 9350
Wire Wire Line
	4550 9350 4550 9600
Wire Wire Line
	5550 8750 5200 8750
Wire Wire Line
	5200 8850 5550 8850
Text Label 4250 9650 1    50   ~ 0
BOOT1
Text Label 4050 9650 1    50   ~ 0
Opto_IN
Wire Wire Line
	4050 9650 4050 9350
Text Label 4150 9650 1    50   ~ 0
Energy
Wire Wire Line
	4150 9650 4150 9350
$Comp
L Connector:Conn_01x08_Female J3
U 1 1 5F27D392
P 10050 2400
F 0 "J3" H 10250 1950 50  0000 C CNN
F 1 "Header_In" H 10000 2850 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08_Pitch2.54mm" H 10050 2400 50  0001 C CNN
F 3 "~" H 10050 2400 50  0001 C CNN
	1    10050 2400
	-1   0    0    1   
$EndComp
Text Label 10600 2000 2    50   ~ 0
DSW_1
Wire Wire Line
	10250 2000 10600 2000
Text Label 10600 2100 2    50   ~ 0
DSW_2
Wire Wire Line
	10600 2100 10250 2100
Text Label 10600 2200 2    50   ~ 0
DSW_3
Wire Wire Line
	10600 2200 10250 2200
Text Label 10600 2300 2    50   ~ 0
DSW_4
Wire Wire Line
	10600 2300 10250 2300
Text Label 10600 2400 2    50   ~ 0
Opto_IN
Wire Wire Line
	10600 2400 10250 2400
Text Label 10600 2500 2    50   ~ 0
Energy
Wire Wire Line
	10600 2500 10250 2500
Text Label 10550 2600 2    50   ~ 0
GND
Wire Wire Line
	10550 2600 10250 2600
Text Label 10550 2700 2    50   ~ 0
5V
Wire Wire Line
	10550 2700 10250 2700
NoConn ~ 3000 7750
NoConn ~ 5200 8450
NoConn ~ 5200 8550
NoConn ~ 5200 8650
Wire Notes Line
	8350 500  8400 11250
Wire Notes Line
	3400 4950 8350 4950
Text Notes 9800 3800 0    50   Italic 0
Input / Output Headers
Wire Notes Line
	8350 5000 12150 5000
Text Notes 13950 2100 0    50   Italic 0
Temp / Hum
Text Notes 13950 3900 0    50   Italic 0
Light_sensor
Text Notes 13950 5400 0    50   Italic 0
Air Quality
Wire Notes Line
	450  2900 3400 2900
$Comp
L power:+BATT #PWR?
U 1 1 5F190AD7
P 900 4300
F 0 "#PWR?" H 900 4150 50  0001 C CNN
F 1 "+BATT" H 915 4473 50  0000 C CNN
F 2 "" H 900 4300 50  0001 C CNN
F 3 "" H 900 4300 50  0001 C CNN
	1    900  4300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J?
U 1 1 5F191EAA
P 750 5150
F 0 "J?" H 350 4950 50  0000 L CNN
F 1 "Solar_input" H 550 5250 50  0000 L CNN
F 2 "" H 750 5150 50  0001 C CNN
F 3 "~" H 750 5150 50  0001 C CNN
	1    750  5150
	-1   0    0    1   
$EndComp
Text Label 1400 5150 2    50   ~ 0
Solar_-ve
Wire Wire Line
	950  5150 1400 5150
Text Label 1400 5050 2    50   ~ 0
Solar_+ve
Wire Wire Line
	1400 5050 950  5050
$Comp
L Connector:Conn_01x02_Female J?
U 1 1 5F1AA8B3
P 1850 5150
F 0 "J?" H 1750 4950 50  0000 L CNN
F 1 "Battery_input" H 1400 5250 50  0000 L CNN
F 2 "" H 1850 5150 50  0001 C CNN
F 3 "~" H 1850 5150 50  0001 C CNN
	1    1850 5150
	-1   0    0    1   
$EndComp
Text Label 2500 5200 2    50   ~ 0
Solar_-ve
$Comp
L Simulation_SPICE:DIODE D?
U 1 1 5F1B7D1B
P 2200 4950
F 0 "D?" H 2200 4733 50  0000 C CNN
F 1 "DIODE" H 2200 4824 50  0000 C CNN
F 2 "" H 2200 4950 50  0001 C CNN
F 3 "~" H 2200 4950 50  0001 C CNN
F 4 "Y" H 2200 4950 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "D" H 2200 4950 50  0001 L CNN "Spice_Primitive"
	1    2200 4950
	-1   0    0    1   
$EndComp
Wire Wire Line
	2050 5150 2050 5200
Wire Wire Line
	2050 5200 2500 5200
Text Label 2050 4750 2    50   ~ 0
BAT_+ve
Text Label 2300 5400 2    50   ~ 0
GND
Wire Wire Line
	2050 5400 2050 5200
Connection ~ 2050 5200
Wire Wire Line
	2050 4950 2050 5050
Text Label 2800 4950 2    50   ~ 0
Solar_+ve
Wire Wire Line
	2800 4950 2350 4950
Wire Wire Line
	2050 5400 2300 5400
$EndSCHEMATC
