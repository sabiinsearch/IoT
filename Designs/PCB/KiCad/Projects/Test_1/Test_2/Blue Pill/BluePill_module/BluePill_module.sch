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
L stm32:STM32 U2
U 1 1 5F0D833D
P 4950 1850
F 0 "U2" H 5950 2750 60  0000 L CNN
F 1 "STM32" H 4800 1550 118 0000 L CNN
F 2 "Custom_Libraries:STM32(LQFP48)" H 4950 1850 60  0001 C CNN
F 3 "" H 4950 1850 60  0001 C CNN
	1    4950 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y2
U 1 1 5F0D9577
P 8250 1650
F 0 "Y2" V 8204 1781 50  0000 L CNN
F 1 "8Mhz" V 8295 1781 50  0000 L CNN
F 2 "Crystals:Crystal_HC49-4H_Vertical" H 8250 1650 50  0001 C CNN
F 3 "~" H 8250 1650 50  0001 C CNN
	1    8250 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 5F0DAA87
P 7250 1300
F 0 "Y1" V 7204 1431 50  0000 L CNN
F 1 "32.768K" V 7295 1431 50  0000 L CNN
F 2 "Crystals:Crystal_HC49-4H_Vertical" H 7250 1300 50  0001 C CNN
F 3 "~" H 7250 1300 50  0001 C CNN
	1    7250 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5F0E2D13
P 8250 1150
F 0 "R2" H 8320 1196 50  0000 L CNN
F 1 "1M" H 8320 1105 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" V 8180 1150 50  0001 C CNN
F 3 "~" H 8250 1150 50  0001 C CNN
	1    8250 1150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8100 1650 7900 1650
Wire Wire Line
	7900 1650 7900 1150
Wire Wire Line
	8400 1650 8600 1650
Wire Wire Line
	8600 1650 8600 1150
Wire Wire Line
	8400 1150 8600 1150
Wire Wire Line
	8100 1150 7900 1150
$Comp
L Device:C C4
U 1 1 5F0E49DE
P 7900 1850
F 0 "C4" V 7648 1850 50  0000 C CNN
F 1 "20pf" V 7739 1850 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 7938 1700 50  0001 C CNN
F 3 "~" H 7900 1850 50  0001 C CNN
	1    7900 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5F0E6674
P 8600 1850
F 0 "C5" V 8348 1850 50  0000 C CNN
F 1 "20pf" V 8439 1850 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 8638 1700 50  0001 C CNN
F 3 "~" H 8600 1850 50  0001 C CNN
	1    8600 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 1700 8600 1650
Connection ~ 8600 1650
Wire Wire Line
	7900 1700 7900 1650
Connection ~ 7900 1650
Wire Wire Line
	7900 2000 8600 2000
$Comp
L Device:C C3
U 1 1 5F0E94E8
P 7450 1850
F 0 "C3" V 7198 1850 50  0000 C CNN
F 1 "20pf" V 7289 1850 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 7488 1700 50  0001 C CNN
F 3 "~" H 7450 1850 50  0001 C CNN
	1    7450 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5F0E9AA7
P 7050 1850
F 0 "C2" V 6798 1850 50  0000 C CNN
F 1 "20pf" V 6889 1850 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 7088 1700 50  0001 C CNN
F 3 "~" H 7050 1850 50  0001 C CNN
	1    7050 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 2000 7450 2000
Connection ~ 7450 2000
Wire Wire Line
	7450 2000 7900 2000
Connection ~ 7900 2000
Wire Wire Line
	7450 1700 7450 1300
Wire Wire Line
	7450 1300 7400 1300
Wire Wire Line
	7100 1300 7050 1300
Wire Wire Line
	7050 1300 7050 1700
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
Text Label 7050 1000 3    50   ~ 0
PC14
Wire Wire Line
	7050 1300 7050 1000
Connection ~ 7050 1300
Text Label 7450 1000 3    50   ~ 0
PC15
Wire Wire Line
	7450 1000 7450 1300
Connection ~ 7450 1300
Text Label 7900 850  3    50   ~ 0
OSCIN
Wire Wire Line
	7900 1150 7900 850 
Connection ~ 7900 1150
Text Label 8600 800  3    50   ~ 0
OSCOUT
Connection ~ 8600 1150
Wire Wire Line
	8600 1150 8600 800 
Text Label 3600 1700 0    50   ~ 0
PC14
Text Label 3600 1800 0    50   ~ 0
PC15
Wire Wire Line
	3900 1700 3600 1700
Wire Wire Line
	3600 1800 3900 1800
Text Label 3600 1900 0    50   ~ 0
OSCIN
Text Label 3600 2000 0    50   ~ 0
OSCOUT
Wire Wire Line
	3600 1900 3900 1900
Wire Wire Line
	3900 2000 3600 2000
Text Label 4850 650  3    50   ~ 0
BOOT0
Wire Wire Line
	4850 1000 4850 650 
Text Label 5150 3400 1    50   ~ 0
BOOT1
Wire Wire Line
	5150 3100 5150 3400
Text Label 6500 1500 2    50   ~ 0
VCC3V3
Wire Wire Line
	6100 1500 6500 1500
Text Label 3550 2300 0    50   ~ 0
VCC3V3
Wire Wire Line
	3550 2300 3900 2300
Text Label 3600 2100 0    50   ~ 0
RESET
Wire Wire Line
	3600 2100 3900 2100
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
P 1500 4500
F 0 "U1" H 1500 4842 50  0000 C CNN
F 1 "APK2112.K-3.3" H 1500 4751 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5" H 1500 4700 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 1600 4250 50  0001 C CNN
	1    1500 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 4400 1200 4500
$Comp
L power:+5V #PWR01
U 1 1 5F13A2AD
P 1000 4300
F 0 "#PWR01" H 1000 4150 50  0001 C CNN
F 1 "+5V" H 1015 4473 50  0000 C CNN
F 2 "" H 1000 4300 50  0001 C CNN
F 3 "" H 1000 4300 50  0001 C CNN
	1    1000 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 4300 1000 4400
Wire Wire Line
	1000 4400 1200 4400
Connection ~ 1200 4400
$Comp
L power:GNDREF #PWR03
U 1 1 5F13CA0F
P 1500 4850
F 0 "#PWR03" H 1505 4677 50  0001 C CNN
F 1 "GNDREF" H 1505 4677 50  0000 C CNN
F 2 "" H 1500 4850 50  0001 C CNN
F 3 "" H 1500 4850 50  0001 C CNN
	1    1500 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 4800 1500 4850
Text Label 2100 4400 2    50   ~ 0
VCC3V3
Wire Wire Line
	1800 4400 2050 4400
Text Label 1700 4800 0    50   ~ 0
GND
Connection ~ 1500 4800
Text Label 7050 2350 1    50   ~ 0
GND
Wire Wire Line
	7050 2350 7050 2000
Connection ~ 7050 2000
$Comp
L Connector_Generic:Conn_01x05 J2
U 1 1 5F0DE12E
P 10150 1200
F 0 "J2" H 10068 775 50  0000 C CNN
F 1 "Prog Hdr" H 10068 866 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 10150 1200 50  0001 C CNN
F 3 "~" H 10150 1200 50  0001 C CNN
	1    10150 1200
	-1   0    0    1   
$EndComp
Text Label 10550 1000 2    50   ~ 0
GND
Text Label 800  4400 0    50   ~ 0
5V
Wire Wire Line
	800  4400 1000 4400
Connection ~ 1000 4400
Text Label 10650 1100 2    50   ~ 0
5V
Text Label 10850 1200 2    50   ~ 0
VCC3V3
Wire Wire Line
	10350 1000 10550 1000
Wire Wire Line
	10650 1100 10350 1100
Wire Wire Line
	10350 1200 10850 1200
Text Label 6450 2100 2    50   ~ 0
TX0
Wire Wire Line
	6100 2100 6450 2100
Text Label 6450 2000 2    50   ~ 0
RX0
Wire Wire Line
	6450 2000 6100 2000
Text Label 10700 1300 2    50   ~ 0
RX0
Text Label 10700 1400 2    50   ~ 0
TX0
Wire Wire Line
	10700 1400 10350 1400
Wire Wire Line
	10350 1300 10700 1300
$Comp
L Connector:Conn_01x04_Female J?
U 1 1 5F12B0FD
P 10100 2000
F 0 "J?" H 10200 1750 50  0000 C CNN
F 1 "SWD" H 9950 2250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 10100 2000 50  0001 C CNN
F 3 "~" H 10100 2000 50  0001 C CNN
	1    10100 2000
	-1   0    0    1   
$EndComp
Text Label 6450 1700 2    50   ~ 0
SWIO
Wire Wire Line
	6100 1700 6450 1700
Text Label 5550 700  3    50   ~ 0
SWCLK
Wire Wire Line
	5550 700  5550 1000
Text Label 10650 1900 2    50   ~ 0
SWIO
Text Label 10650 2000 2    50   ~ 0
SWCLK
Wire Wire Line
	10300 1900 10650 1900
Wire Wire Line
	10650 2000 10300 2000
Wire Wire Line
	10600 1800 10300 1800
Text Label 10550 2100 2    50   ~ 0
GND
Wire Wire Line
	10550 2100 10300 2100
$Comp
L Device:LED D?
U 1 1 5F13F264
P 1750 3550
F 0 "D?" H 1743 3295 50  0000 C CNN
F 1 "LED" H 1743 3386 50  0000 C CNN
F 2 "" H 1750 3550 50  0001 C CNN
F 3 "~" H 1750 3550 50  0001 C CNN
	1    1750 3550
	-1   0    0    1   
$EndComp
Text Label 10600 1800 2    50   ~ 0
VCC3V3
Text Label 2050 3550 0    50   ~ 0
VCC3V3
Text Label 900  3550 2    50   ~ 0
GND
$Comp
L Device:R R?
U 1 1 5F141954
P 1250 3550
F 0 "R?" V 1150 3500 50  0000 L CNN
F 1 "510 R" V 1350 3450 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" V 1180 3550 50  0001 C CNN
F 3 "~" H 1250 3550 50  0001 C CNN
	1    1250 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	1900 3550 2050 3550
Wire Wire Line
	1600 3550 1400 3550
Wire Wire Line
	1100 3550 900  3550
$Comp
L Device:C C?
U 1 1 5F14D815
P 2050 4600
F 0 "C?" H 1798 4600 50  0000 C CNN
F 1 "100 nf" V 1889 4600 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 2088 4450 50  0001 C CNN
F 3 "~" H 2050 4600 50  0001 C CNN
	1    2050 4600
	-1   0    0    1   
$EndComp
Wire Wire Line
	2050 4800 2050 4750
Wire Wire Line
	1500 4800 2050 4800
Wire Wire Line
	2050 4450 2050 4400
Connection ~ 2050 4400
Wire Wire Line
	2050 4400 2100 4400
$Comp
L Device:C C?
U 1 1 5F152167
P 1000 4600
F 0 "C?" H 1150 4600 50  0000 C CNN
F 1 "100 nf" V 900 4600 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 1038 4450 50  0001 C CNN
F 3 "~" H 1000 4600 50  0001 C CNN
	1    1000 4600
	-1   0    0    1   
$EndComp
Wire Wire Line
	1000 4400 1000 4450
Wire Wire Line
	1000 4750 1500 4750
Wire Wire Line
	1500 4750 1500 4800
Text Label 4450 750  3    50   ~ 0
VCC3V3
Wire Wire Line
	4450 750  4450 1000
Text Label 5550 3450 1    50   ~ 0
VCC3V3
Wire Wire Line
	5550 3450 5550 3100
Text Label 5450 3300 3    50   ~ 0
GND
Wire Wire Line
	5450 3300 5450 3100
Text Label 3650 2200 0    50   ~ 0
GND
Wire Wire Line
	3650 2200 3900 2200
Text Label 4550 800  3    50   ~ 0
GND
Wire Wire Line
	4550 800  4550 1000
Text Label 6400 1600 2    50   ~ 0
GND
Wire Wire Line
	6400 1600 6100 1600
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
Wire Notes Line
	700  2900 3400 2900
Wire Notes Line
	3400 3600 9000 3600
Wire Notes Line
	9000 2700 11250 2700
Wire Notes Line
	9000 500  9000 3600
$Comp
L lora:LoRa U?
U 1 1 5F21A746
P 5450 5000
F 0 "U?" H 5450 5737 60  0000 C CNN
F 1 "LoRa" H 5450 5631 60  0000 C CNN
F 2 "" H 5450 4550 60  0001 C CNN
F 3 "" H 5450 4550 60  0001 C CNN
	1    5450 5000
	1    0    0    -1  
$EndComp
Text Label 6350 4650 2    50   ~ 0
GND
Text Label 4450 4750 0    50   ~ 0
GND
Wire Wire Line
	4450 4750 4750 4750
Text Label 4450 4850 0    50   ~ 0
VCC3V3
Wire Wire Line
	4450 4850 4750 4850
Text Label 6350 5350 2    50   ~ 0
GND
Wire Wire Line
	6150 5350 6350 5350
Text Notes 9650 2550 0    79   Italic 0
Programming Headers
Text Notes 1500 5500 0    79   Italic 0
Power
Text Notes 1550 2500 0    79   Italic 0
Boot & Reset
Text Notes 5000 5700 0    79   Italic 0
LoRa Module
Text Notes 6700 3350 0    79   Italic 0
STM & Crystals\n
Text Label 6350 4950 2    50   ~ 0
MISO
Text Label 6350 4850 2    50   ~ 0
MOSI
Text Label 6350 5050 2    50   ~ 0
SCK
Wire Wire Line
	6150 5050 6350 5050
Wire Wire Line
	6350 4950 6150 4950
Wire Wire Line
	6150 4850 6350 4850
Text Label 4500 5050 0    50   ~ 0
DIO0
Wire Wire Line
	4500 5050 4750 5050
Text Label 4500 5150 0    50   ~ 0
DIO1
Wire Wire Line
	4750 5150 4500 5150
Wire Notes Line
	500  5700 3400 5700
Text Label 4500 4950 0    50   ~ 0
Reset
Wire Wire Line
	4500 4950 4750 4950
Text Label 6350 4750 2    50   ~ 0
NSS
Wire Wire Line
	6350 4750 6150 4750
Wire Wire Line
	6150 4650 6350 4650
Text Label 4550 3400 1    50   ~ 0
NSS
Wire Wire Line
	4550 3100 4550 3400
Text Label 4850 3400 1    50   ~ 0
MOSI
Wire Wire Line
	4850 3100 4850 3400
Text Label 4750 3400 1    50   ~ 0
MISO
Wire Wire Line
	4750 3400 4750 3100
Text Label 4650 3400 1    50   ~ 0
SCK
Wire Wire Line
	4650 3400 4650 3100
Text Label 4450 3400 1    50   ~ 0
DIO1
Wire Wire Line
	4450 3400 4450 3100
Text Label 3650 2600 0    50   ~ 0
DIO0
Wire Wire Line
	3650 2600 3900 2600
Text Label 3650 2500 0    50   ~ 0
Reset
Wire Wire Line
	3650 2500 3900 2500
NoConn ~ 6150 5150
NoConn ~ 6150 5250
NoConn ~ 4750 5350
NoConn ~ 4750 5250
$Comp
L Device:Antenna AE?
U 1 1 5F2C5F88
P 4250 4300
F 0 "AE?" H 4330 4289 50  0000 L CNN
F 1 "Antenna" H 4330 4198 50  0000 L CNN
F 2 "SMD_Packages:1Pin" H 4250 4300 50  0001 C CNN
F 3 "~" H 4250 4300 50  0001 C CNN
	1    4250 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 4500 4250 4650
Wire Wire Line
	4250 4650 4750 4650
$EndSCHEMATC
