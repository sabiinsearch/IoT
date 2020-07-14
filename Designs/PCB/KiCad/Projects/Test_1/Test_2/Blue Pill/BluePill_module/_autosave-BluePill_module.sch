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
P 2900 5250
F 0 "Y1" V 2854 5381 50  0000 L CNN
F 1 "32.768K" V 2945 5381 50  0000 L CNN
F 2 "Crystals:Crystal_HC49-4H_Vertical" H 2900 5250 50  0001 C CNN
F 3 "~" H 2900 5250 50  0001 C CNN
	1    2900 5250
	0    1    1    0   
$EndComp
Text GLabel 5150 3400 0    50   Input ~ 0
OSCIN
Text GLabel 5150 3500 0    50   Input ~ 0
OSCOUT
Wire Wire Line
	5150 3400 5350 3400
Wire Wire Line
	5150 3500 5350 3500
Text GLabel 4200 5600 2    50   Input ~ 0
OSCIN
Text GLabel 4200 6300 2    50   Input ~ 0
OSCOUT
$Comp
L Device:R R?
U 1 1 5F0E2D13
P 4000 5950
F 0 "R?" H 4070 5996 50  0000 L CNN
F 1 "R" H 4070 5905 50  0000 L CNN
F 2 "" V 3930 5950 50  0001 C CNN
F 3 "~" H 4000 5950 50  0001 C CNN
	1    4000 5950
	1    0    0    -1  
$EndComp
$EndSCHEMATC
