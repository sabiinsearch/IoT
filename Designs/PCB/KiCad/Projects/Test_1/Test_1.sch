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
Entry Wire Line
	4300 1750 4400 1850
$Comp
L Test_1-rescue:R R1
U 1 1 5EFF1FA7
P 1350 2350
F 0 "R1" V 1430 2350 50  0000 C CNN
F 1 "R" V 1350 2350 50  0000 C CNN
F 2 "" V 1280 2350 50  0001 C CNN
F 3 "" H 1350 2350 50  0001 C CNN
	1    1350 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 2500 1750 2500
Wire Wire Line
	1750 2500 1750 2200
Wire Wire Line
	1750 2200 1350 2200
$Comp
L Test_1-rescue:LoRa U2
U 1 1 5F002757
P 5550 3600
F 0 "U2" H 5550 3150 60  0000 C CNN
F 1 "LoRa" H 5550 3700 60  0000 C CNN
F 2 "" H 5550 3150 60  0001 C CNN
F 3 "" H 5550 3150 60  0001 C CNN
	1    5550 3600
	1    0    0    -1  
$EndComp
$Comp
L Test_1-rescue:ESP32-WROOM U5
U 1 1 5F00452F
P 8200 3650
F 0 "U5" H 8200 5250 60  0000 C CNN
F 1 "ESP32-WROOM" V 8250 3600 118 0000 C CNN
F 2 "" H 8100 3650 60  0001 C CNN
F 3 "" H 8100 3650 60  0001 C CNN
	1    8200 3650
	1    0    0    -1  
$EndComp
$Comp
L Test_1-rescue:L7805 U4
U 1 1 5F0045A3
P 5950 1800
F 0 "U4" H 5800 1925 50  0000 C CNN
F 1 "L7805" H 5950 1925 50  0000 L CNN
F 2 "" H 5975 1650 50  0001 L CIN
F 3 "" H 5950 1750 50  0001 C CNN
	1    5950 1800
	1    0    0    -1  
$EndComp
$Comp
L Test_1-rescue:STM32 U1
U 1 1 5F084833
P 3300 4650
F 0 "U1" H 4100 5350 60  0000 C CNN
F 1 "STM32" H 3300 4550 118 0000 C CNN
F 2 "" H 3300 4650 60  0001 C CNN
F 3 "" H 3300 4650 60  0001 C CNN
	1    3300 4650
	1    0    0    -1  
$EndComp
$Comp
L Test_1-rescue:LoRa U3
U 1 1 5F08489C
P 5750 5000
F 0 "U3" H 5750 4550 60  0000 C CNN
F 1 "LoRa" H 5750 5100 60  0000 C CNN
F 2 "" H 5750 4550 60  0001 C CNN
F 3 "" H 5750 4550 60  0001 C CNN
	1    5750 5000
	1    0    0    -1  
$EndComp
$EndSCHEMATC
