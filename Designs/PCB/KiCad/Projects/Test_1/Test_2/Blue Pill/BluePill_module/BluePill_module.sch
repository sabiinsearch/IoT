EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
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
L stm32:STM32 U?
U 1 1 5F0D833D
P 6400 3350
F 0 "U?" H 7594 3246 60  0000 L CNN
F 1 "STM32" H 7594 3097 118 0000 L CNN
F 2 "" H 6400 3350 60  0001 C CNN
F 3 "" H 6400 3350 60  0001 C CNN
	1    6400 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y2
U 1 1 5F0D9577
P 3500 5950
F 0 "Y2" V 3454 6081 50  0000 L CNN
F 1 "8Mhz" V 3545 6081 50  0000 L CNN
F 2 "Crystals:Crystal_HC49-4H_Vertical" H 3500 5950 50  0001 C CNN
F 3 "~" H 3500 5950 50  0001 C CNN
	1    3500 5950
	0    1    1    0   
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 5F0DAA87
P 3850 4950
F 0 "Y1" V 3804 5081 50  0000 L CNN
F 1 "32.768K" V 3895 5081 50  0000 L CNN
F 2 "Crystals:Crystal_HC49-4H_Vertical" H 3850 4950 50  0001 C CNN
F 3 "~" H 3850 4950 50  0001 C CNN
	1    3850 4950
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F0E2D13
P 4000 5950
F 0 "R?" H 4070 5996 50  0000 L CNN
F 1 "1M" H 4070 5905 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" V 3930 5950 50  0001 C CNN
F 3 "~" H 4000 5950 50  0001 C CNN
	1    4000 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 5800 3500 5600
Wire Wire Line
	3500 5600 4000 5600
Wire Wire Line
	3500 6100 3500 6300
Wire Wire Line
	3500 6300 4000 6300
Wire Wire Line
	4000 6100 4000 6300
Wire Wire Line
	4000 5800 4000 5600
$Comp
L Device:C C?
U 1 1 5F0E49DE
P 3300 5600
F 0 "C?" V 3048 5600 50  0000 C CNN
F 1 "20pf" V 3139 5600 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 3338 5450 50  0001 C CNN
F 3 "~" H 3300 5600 50  0001 C CNN
	1    3300 5600
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5F0E6674
P 3300 6300
F 0 "C?" V 3048 6300 50  0000 C CNN
F 1 "20pf" V 3139 6300 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 3338 6150 50  0001 C CNN
F 3 "~" H 3300 6300 50  0001 C CNN
	1    3300 6300
	0    1    1    0   
$EndComp
Wire Wire Line
	3450 6300 3500 6300
Connection ~ 3500 6300
Wire Wire Line
	3450 5600 3500 5600
Connection ~ 3500 5600
Wire Wire Line
	3150 5600 3150 6300
$Comp
L Device:C C?
U 1 1 5F0E94E8
P 3300 5150
F 0 "C?" V 3048 5150 50  0000 C CNN
F 1 "20pf" V 3139 5150 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 3338 5000 50  0001 C CNN
F 3 "~" H 3300 5150 50  0001 C CNN
	1    3300 5150
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5F0E9AA7
P 3300 4750
F 0 "C?" V 3048 4750 50  0000 C CNN
F 1 "20pf" V 3139 4750 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 3338 4600 50  0001 C CNN
F 3 "~" H 3300 4750 50  0001 C CNN
	1    3300 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	3150 4750 3150 5150
Connection ~ 3150 5150
Wire Wire Line
	3150 5150 3150 5600
Connection ~ 3150 5600
Wire Wire Line
	3450 5150 3850 5150
Wire Wire Line
	3850 5150 3850 5100
Wire Wire Line
	3850 4800 3850 4750
Wire Wire Line
	3850 4750 3450 4750
$Comp
L power:GNDREF #PWR?
U 1 1 5F0FB70B
P 2750 4750
F 0 "#PWR?" H 2755 4577 50  0001 C CNN
F 1 "GNDREF" H 2755 4577 50  0000 C CNN
F 2 "" H 2750 4750 50  0001 C CNN
F 3 "" H 2750 4750 50  0001 C CNN
	1    2750 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 4750 2750 4750
Connection ~ 3150 4750
$Comp
L Connector_Generic:Conn_02x03_Top_Bottom J?
U 1 1 5F0FF079
P 3000 1750
F 0 "J?" H 3050 2067 50  0000 C CNN
F 1 "Header 3x2" H 3050 1550 50  0000 C CNN
F 2 "" H 3000 1750 50  0001 C CNN
F 3 "~" H 3000 1750 50  0001 C CNN
	1    3000 1750
	1    0    0    -1  
$EndComp
Text Label 3550 1350 2    50   ~ 0
VCC3V3
Wire Wire Line
	3300 1350 3300 1450
Wire Wire Line
	3300 1450 2800 1450
Wire Wire Line
	2800 1450 2800 1650
Connection ~ 3300 1450
Wire Wire Line
	3300 1450 3300 1650
Wire Wire Line
	2800 1850 2700 1850
Wire Wire Line
	2700 1850 2700 2150
Wire Wire Line
	2700 2150 2900 2150
Wire Wire Line
	2900 2150 3300 2150
Wire Wire Line
	3300 2150 3300 1850
Connection ~ 2900 2150
Text Label 3550 1750 2    50   ~ 0
BOOT1
Text Label 2500 1750 0    50   ~ 0
BOOT0
Wire Wire Line
	2500 1750 2800 1750
Wire Wire Line
	3300 1750 3550 1750
Wire Wire Line
	3300 1350 3550 1350
Text Label 4150 4750 2    50   ~ 0
PC14
Wire Wire Line
	3850 4750 4150 4750
Connection ~ 3850 4750
Text Label 4150 5150 2    50   ~ 0
PC15
Wire Wire Line
	4150 5150 3850 5150
Connection ~ 3850 5150
Text Label 4300 5600 2    50   ~ 0
OSCIN
Wire Wire Line
	4000 5600 4300 5600
Connection ~ 4000 5600
Text Label 4350 6300 2    50   ~ 0
OSCOUT
Connection ~ 4000 6300
Wire Wire Line
	4000 6300 4350 6300
Text Label 5050 3200 0    50   ~ 0
PC14
Text Label 5050 3300 0    50   ~ 0
PC15
Wire Wire Line
	5350 3200 5050 3200
Wire Wire Line
	5050 3300 5350 3300
Text Label 5050 3400 0    50   ~ 0
OSCIN
Text Label 5050 3500 0    50   ~ 0
OSCOUT
Wire Wire Line
	5050 3400 5350 3400
Wire Wire Line
	5350 3500 5050 3500
Text Label 6300 2150 3    50   ~ 0
BOOT0
Wire Wire Line
	6300 2500 6300 2150
Text Label 6600 4900 1    50   ~ 0
BOOT1
Wire Wire Line
	6600 4600 6600 4900
Text Label 7950 3000 2    50   ~ 0
VCC3V3
Wire Wire Line
	7550 3000 7950 3000
Text Label 5000 3800 0    50   ~ 0
VCC3V3
Wire Wire Line
	5000 3800 5350 3800
Text Label 5050 3600 0    50   ~ 0
RESET
Wire Wire Line
	5050 3600 5350 3600
$Comp
L Switch:SW_Push SW?
U 1 1 5F125580
P 1000 2450
F 0 "SW?" V 1000 2400 50  0000 R CNN
F 1 "SW_Push" V 900 2900 50  0001 R CNN
F 2 "" H 1000 2650 50  0001 C CNN
F 3 "~" H 1000 2650 50  0001 C CNN
	1    1000 2450
	0    -1   -1   0   
$EndComp
Text Label 1500 2250 2    50   ~ 0
RESET
Wire Wire Line
	1000 2250 1300 2250
$Comp
L power:GNDREF #PWR?
U 1 1 5F102D01
P 2900 2150
F 0 "#PWR?" H 2905 1977 50  0001 C CNN
F 1 "GNDREF" H 2905 1977 50  0000 C CNN
F 2 "" H 2900 2150 50  0001 C CNN
F 3 "" H 2900 2150 50  0001 C CNN
	1    2900 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 2650 1300 2650
Wire Wire Line
	1400 2650 1400 2700
$Comp
L Device:C C?
U 1 1 5F129E71
P 1300 2450
F 0 "C?" H 1185 2404 50  0000 R CNN
F 1 "105" H 1185 2495 50  0000 R CNN
F 2 "Capacitors_SMD:C_0805" H 1338 2300 50  0001 C CNN
F 3 "~" H 1300 2450 50  0001 C CNN
	1    1300 2450
	-1   0    0    1   
$EndComp
Wire Wire Line
	1300 2600 1300 2650
Connection ~ 1300 2650
Wire Wire Line
	1300 2650 1400 2650
Wire Wire Line
	1300 2300 1300 2250
Connection ~ 1300 2250
Wire Wire Line
	1300 2250 1500 2250
Text Label 1550 1800 2    50   ~ 0
VCC3V3
$Comp
L Device:R R?
U 1 1 5F12CF37
P 1300 2000
F 0 "R?" H 1370 2046 50  0000 L CNN
F 1 "10K" H 1370 1955 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" V 1230 2000 50  0001 C CNN
F 3 "~" H 1300 2000 50  0001 C CNN
	1    1300 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 1850 1300 1800
Wire Wire Line
	1300 1800 1550 1800
Wire Wire Line
	1300 2150 1300 2250
$Comp
L power:GNDREF #PWR?
U 1 1 5F1282A4
P 1400 2700
F 0 "#PWR?" H 1405 2527 50  0001 C CNN
F 1 "GNDREF" H 1405 2527 50  0000 C CNN
F 2 "" H 1400 2700 50  0001 C CNN
F 3 "" H 1400 2700 50  0001 C CNN
	1    1400 2700
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:AP2112K-3.3 U?
U 1 1 5F13570F
P 1650 3850
F 0 "U?" H 1650 4192 50  0000 C CNN
F 1 "APK2112.K-3.3" H 1650 4101 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5" H 1650 4050 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 1750 3600 50  0001 C CNN
	1    1650 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 3750 1350 3850
$Comp
L power:+5V #PWR?
U 1 1 5F13A2AD
P 1150 3650
F 0 "#PWR?" H 1150 3500 50  0001 C CNN
F 1 "+5V" H 1165 3823 50  0000 C CNN
F 2 "" H 1150 3650 50  0001 C CNN
F 3 "" H 1150 3650 50  0001 C CNN
	1    1150 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 3650 1150 3750
Wire Wire Line
	1150 3750 1350 3750
Connection ~ 1350 3750
$Comp
L power:GNDREF #PWR?
U 1 1 5F13CA0F
P 1650 4200
F 0 "#PWR?" H 1655 4027 50  0001 C CNN
F 1 "GNDREF" H 1655 4027 50  0000 C CNN
F 2 "" H 1650 4200 50  0001 C CNN
F 3 "" H 1650 4200 50  0001 C CNN
	1    1650 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 4150 1650 4200
Text Label 2250 3750 2    50   ~ 0
VCC3V3
Wire Wire Line
	1950 3750 2250 3750
$EndSCHEMATC
