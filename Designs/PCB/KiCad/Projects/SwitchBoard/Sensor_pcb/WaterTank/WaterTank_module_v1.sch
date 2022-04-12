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
Text Label 6453 3894 3    50   ~ 0
OSCOUT
Text Label 4364 1590 0    50   ~ 0
PC14
Text Label 4364 1690 0    50   ~ 0
PC15
Text Label 4364 1790 0    50   ~ 0
OSCIN
Text Label 4364 1890 0    50   ~ 0
OSCOUT
Text Label 4314 2190 0    50   ~ 0
VCC3V3
Text Label 4364 1990 0    50   ~ 0
RESET
$Comp
L Switch:SW_Push SW2
U 1 1 5F125580
P 1527 1241
F 0 "SW2" V 1527 1191 50  0000 R CNN
F 1 "SW_Push" V 1427 1691 50  0001 R CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm_h5mm" H 1527 1441 50  0001 C CNN
F 3 "~" H 1527 1441 50  0001 C CNN
	1    1527 1241
	0    -1   -1   0   
$EndComp
Text Label 2027 1041 2    50   ~ 0
RESET
Wire Wire Line
	1527 1041 1827 1041
Wire Wire Line
	1827 1091 1827 1041
Connection ~ 1827 1041
Wire Wire Line
	1827 1041 2027 1041
Text Label 2077 591  2    50   ~ 0
VCC3V3
$Comp
L Device:R R2
U 1 1 5F12CF37
P 1827 791
F 0 "R2" H 1897 837 50  0000 L CNN
F 1 "10K" H 1897 746 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" V 1757 791 50  0001 C CNN
F 3 "~" H 1827 791 50  0001 C CNN
	1    1827 791 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1827 641  1827 591 
Wire Wire Line
	1827 591  2077 591 
Wire Wire Line
	1827 941  1827 1041
Wire Wire Line
	2645 4347 2645 4447
$Comp
L Sensor_PCB_v7-rescue:GND-power-Sensor_PCB_v5-rescue #PWR01
U 1 1 5F13CA0F
P 2945 4797
F 0 "#PWR01" H 2950 4624 50  0001 C CNN
F 1 "GND" H 2950 4624 50  0000 C CNN
F 2 "" H 2945 4797 50  0001 C CNN
F 3 "" H 2945 4797 50  0001 C CNN
	1    2945 4797
	1    0    0    -1  
$EndComp
Text Label 3145 4747 0    50   ~ 0
GND
Text Label 9796 5487 2    50   ~ 0
SWIO
Text Label 9796 5587 2    50   ~ 0
SWCLK
Wire Wire Line
	9446 5487 9796 5487
Wire Wire Line
	9796 5587 9446 5587
Text Label 9696 5687 2    50   ~ 0
GND
Wire Wire Line
	9696 5687 9446 5687
Text Label 9746 5187 2    50   ~ 0
VCC3V3
$Comp
L Device:C C1
U 1 1 5F152167
P 2445 4547
F 0 "C1" H 2595 4547 50  0000 C CNN
F 1 "100 nf" V 2345 4547 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 2483 4397 50  0001 C CNN
F 3 "~" H 2445 4547 50  0001 C CNN
	1    2445 4547
	-1   0    0    1   
$EndComp
Wire Wire Line
	2445 4347 2445 4397
Text Label 4414 2090 0    50   ~ 0
GND
Text Label 2127 1441 0    50   ~ 0
GND
Text Label 6511 6440 2    50   ~ 0
GND
Text Label 4611 6540 0    50   ~ 0
GND
Wire Wire Line
	4611 6540 4911 6540
Text Label 4611 6640 0    50   ~ 0
VCC3V3
Wire Wire Line
	4611 6640 4911 6640
Text Label 6511 7140 2    50   ~ 0
GND
Wire Wire Line
	6311 7140 6511 7140
Text Notes 9074 6302 0    79   Italic 0
Programming Headers
Text Notes 1500 7500 0    79   Italic 0
Power
Text Notes 1422 1845 0    79   Italic 0
 Reset
Text Notes 5161 7490 0    79   Italic 0
LoRa Module
Text Label 6511 6740 2    50   ~ 0
MISO
Text Label 6511 6640 2    50   ~ 0
MOSI
Text Label 6511 6840 2    50   ~ 0
SCK
Wire Wire Line
	6311 6840 6511 6840
Wire Wire Line
	6511 6740 6311 6740
Wire Wire Line
	6311 6640 6511 6640
Text Label 4661 6840 0    50   ~ 0
DIO0
Wire Wire Line
	4661 6840 4911 6840
Text Label 4501 6737 0    50   ~ 0
Reset_LoRa
Wire Wire Line
	4661 6740 4662 6740
Text Label 6511 6540 2    50   ~ 0
NSS
Wire Wire Line
	6511 6540 6311 6540
Wire Wire Line
	6311 6440 6511 6440
Text Label 4414 2290 0    50   ~ 0
DIO0
Text Label 4216 1490 0    50   ~ 0
Reset_LoRa
NoConn ~ 6311 6940
NoConn ~ 6311 7040
NoConn ~ 4911 7140
$Comp
L Sensor_PCB_v7-rescue:Antenna-Device-Sensor_PCB_v5-rescue AE1
U 1 1 5F2C5F88
P 4411 6090
F 0 "AE1" H 4491 6079 50  0000 L CNN
F 1 "Antenna" H 4491 5988 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 4411 6090 50  0001 C CNN
F 3 "~" H 4411 6090 50  0001 C CNN
	1    4411 6090
	1    0    0    -1  
$EndComp
Wire Wire Line
	4411 6290 4411 6440
Wire Wire Line
	4411 6440 4911 6440
Text Notes 9556 4199 0    50   Italic 0
Sensors\n
NoConn ~ 4664 1390
Wire Wire Line
	2445 4697 2445 4747
Wire Wire Line
	3495 4647 3495 4747
Wire Wire Line
	3745 4297 3745 4347
Wire Wire Line
	6453 4244 6453 3894
Connection ~ 6453 4244
Connection ~ 6453 4744
Wire Wire Line
	6453 4794 6453 4744
Wire Wire Line
	6453 4744 6453 4244
Text Label 5914 3290 1    50   ~ 0
GND
Wire Wire Line
	5414 3290 5414 2990
Wire Wire Line
	5514 3290 5514 2990
Wire Wire Line
	5614 2990 5614 3290
Wire Wire Line
	5914 2990 5914 3290
Text Label 5414 3290 1    50   ~ 0
SCK
Text Label 5514 3290 1    50   ~ 0
MISO
Text Label 5614 3290 1    50   ~ 0
MOSI
Wire Wire Line
	5314 2990 5314 3290
Text Label 5314 3290 1    50   ~ 0
NSS
Text Notes 5303 3583 0    79   Italic 0
STM32FXXX\n
Text Label 7164 1490 2    50   ~ 0
GND
Wire Wire Line
	5314 690  5314 890 
Text Label 5314 690  3    50   ~ 0
GND
Wire Wire Line
	5214 640  5214 890 
Text Label 5214 640  3    50   ~ 0
VCC3V3
Wire Wire Line
	6314 590  6314 890 
Text Label 6314 590  3    50   ~ 0
SWCLK
Text Label 7214 1590 2    50   ~ 0
SWIO
Wire Wire Line
	4903 5444 4903 5094
Text Label 4903 5444 1    50   ~ 0
GND
Text Label 7264 1390 2    50   ~ 0
VCC3V3
Text Label 5614 540  3    50   ~ 0
GND
Connection ~ 5753 4244
Wire Wire Line
	5753 4244 5753 3944
Text Label 5753 3944 3    50   ~ 0
OSCIN
Connection ~ 5303 4394
Wire Wire Line
	5303 4094 5303 4394
Text Label 5303 4094 3    50   ~ 0
PC15
Wire Wire Line
	5303 4394 5253 4394
Wire Wire Line
	5303 4794 5303 4394
Connection ~ 5753 5094
Wire Wire Line
	5303 5094 5753 5094
Connection ~ 5303 5094
Wire Wire Line
	4903 5094 5303 5094
$Comp
L Device:C C5
U 1 1 5F0E94E8
P 5303 4944
F 0 "C5" V 5051 4944 50  0000 C CNN
F 1 "20pf" V 5142 4944 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 5341 4794 50  0001 C CNN
F 3 "~" H 5303 4944 50  0001 C CNN
	1    5303 4944
	1    0    0    -1  
$EndComp
Wire Wire Line
	5753 5094 6453 5094
Connection ~ 5753 4744
Wire Wire Line
	5753 4794 5753 4744
$Comp
L Device:C C7
U 1 1 5F0E6674
P 6453 4944
F 0 "C7" V 6201 4944 50  0000 C CNN
F 1 "20pf" V 6292 4944 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 6491 4794 50  0001 C CNN
F 3 "~" H 6453 4944 50  0001 C CNN
	1    6453 4944
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5F0E49DE
P 5753 4944
F 0 "C6" V 5501 4944 50  0000 C CNN
F 1 "20pf" V 5592 4944 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 5791 4794 50  0001 C CNN
F 3 "~" H 5753 4944 50  0001 C CNN
	1    5753 4944
	1    0    0    -1  
$EndComp
Wire Wire Line
	5953 4244 5753 4244
Wire Wire Line
	6253 4244 6453 4244
Wire Wire Line
	6253 4744 6453 4744
Wire Wire Line
	5753 4744 5753 4244
Wire Wire Line
	5953 4744 5753 4744
$Comp
L Device:R R3
U 1 1 5F0E2D13
P 6103 4244
F 0 "R3" H 6173 4290 50  0000 L CNN
F 1 "1M" H 6173 4199 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" V 6033 4244 50  0001 C CNN
F 3 "~" H 6103 4244 50  0001 C CNN
	1    6103 4244
	0    -1   -1   0   
$EndComp
$Comp
L Device:Crystal Y2
U 1 1 5F0D9577
P 6103 4744
F 0 "Y2" V 6057 4875 50  0000 L CNN
F 1 "8Mhz" V 6148 4875 50  0000 L CNN
F 2 "Crystals:Crystal_HC49-4H_Vertical" H 6103 4744 50  0001 C CNN
F 3 "~" H 6103 4744 50  0001 C CNN
	1    6103 4744
	1    0    0    -1  
$EndComp
Wire Notes Line
	10521 11270 10519 11263
Text Notes 5267 5556 0    79   Italic 0
Crystals for Clock\n
Wire Notes Line
	469  4000 3831 3991
Wire Notes Line
	7659 6537 7680 6558
Wire Notes Line
	7680 6558 7680 6579
Text Label 2800 7280 2    50   ~ 0
GND
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 5F191EAA
P 1139 7173
F 0 "J1" H 739 6973 50  0000 L CNN
F 1 "Solar_input" H 939 7273 50  0000 L CNN
F 2 "Custom_Libraries:Battery_holder" H 1139 7173 50  0001 C CNN
F 3 "~" H 1139 7173 50  0001 C CNN
	1    1139 7173
	-1   0    0    1   
$EndComp
Text Label 1789 7173 2    50   ~ 0
Solar_-ve
Wire Wire Line
	1339 7173 1789 7173
Text Label 1789 7073 2    50   ~ 0
Solar_+ve
Wire Wire Line
	1789 7073 1339 7073
Text Label 2550 6800 2    50   ~ 0
BAT_IN
$Comp
L Connector:Conn_01x02_Female J2
U 1 1 5F1AA8B3
P 2350 7030
F 0 "J2" H 2250 6830 50  0000 L CNN
F 1 "Battery_input" H 2190 7174 50  0000 L CNN
F 2 "Custom_Libraries:Battery_holder" H 2350 7030 50  0001 C CNN
F 3 "~" H 2350 7030 50  0001 C CNN
	1    2350 7030
	-1   0    0    1   
$EndComp
Wire Wire Line
	2550 6930 2550 6800
Wire Wire Line
	2550 7280 2800 7280
Wire Wire Line
	4414 2290 4664 2290
Wire Wire Line
	4314 2190 4664 2190
Wire Wire Line
	4414 2090 4664 2090
Wire Wire Line
	4364 1990 4664 1990
Wire Wire Line
	4664 1890 4364 1890
Wire Wire Line
	4364 1790 4664 1790
Wire Wire Line
	4364 1690 4664 1690
Wire Wire Line
	4664 1590 4364 1590
Wire Wire Line
	6864 1390 7264 1390
Wire Wire Line
	7164 1490 6864 1490
Wire Wire Line
	6864 1590 7214 1590
Text Label 6314 3340 1    50   ~ 0
VCC3V3
Text Label 6214 3240 1    50   ~ 0
GND
Wire Wire Line
	6314 3340 6314 2990
Wire Wire Line
	6214 2990 6214 3240
NoConn ~ 5914 890 
NoConn ~ 6214 890 
Wire Notes Line
	3809 482  3870 7798
Wire Wire Line
	1906 4924 1906 4824
Wire Wire Line
	1906 4524 1906 4394
Connection ~ 4903 5094
$Comp
L Device:Crystal Y1
U 1 1 5F0DAA87
P 5103 4394
F 0 "Y1" V 5057 4525 50  0000 L CNN
F 1 "32.768K" V 5148 4525 50  0000 L CNN
F 2 "Crystals:Crystal_HC49-4H_Vertical" H 5103 4394 50  0001 C CNN
F 3 "~" H 5103 4394 50  0001 C CNN
	1    5103 4394
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5F0E9AA7
P 4903 4944
F 0 "C4" V 4651 4944 50  0000 C CNN
F 1 "20pf" V 4742 4944 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 4941 4794 50  0001 C CNN
F 3 "~" H 4903 4944 50  0001 C CNN
	1    4903 4944
	1    0    0    -1  
$EndComp
Wire Wire Line
	4953 4394 4903 4394
Wire Wire Line
	4903 4394 4903 4794
Text Label 4903 4094 3    50   ~ 0
PC14
Wire Wire Line
	4903 4394 4903 4094
Connection ~ 4903 4394
Wire Wire Line
	4501 6737 4662 6740
Connection ~ 4662 6740
Wire Wire Line
	4662 6740 4911 6740
Text Label 2297 4347 0    50   ~ 0
BAT_IN
Wire Wire Line
	2297 4347 2445 4347
Connection ~ 2445 4347
Wire Wire Line
	2445 4347 2645 4347
NoConn ~ 6864 1690
NoConn ~ 6864 1790
$Comp
L Sensor_PCB_v7-rescue:GND-power-Sensor_PCB_v5-rescue #PWR02
U 1 1 5F17DC84
P 2127 1544
F 0 "#PWR02" H 2132 1371 50  0001 C CNN
F 1 "GND" H 2132 1371 50  0000 C CNN
F 2 "" H 2127 1544 50  0001 C CNN
F 3 "" H 2127 1544 50  0001 C CNN
	1    2127 1544
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5F129E71
P 1827 1241
F 0 "C2" H 1712 1195 50  0000 R CNN
F 1 "1.0uf" H 1712 1286 50  0000 R CNN
F 2 "Capacitors_SMD:C_0805" H 1865 1091 50  0001 C CNN
F 3 "~" H 1827 1241 50  0001 C CNN
	1    1827 1241
	-1   0    0    1   
$EndComp
$Comp
L stm32:STM32 U3
U 1 1 5F0D833D
P 5714 1740
F 0 "U3" H 6714 2640 60  0000 L CNN
F 1 "STM32" H 5564 1440 118 0000 L CNN
F 2 "Custom_Libraries:STM32(LQFP48)" H 5714 1740 60  0001 C CNN
F 3 "" H 5714 1740 60  0001 C CNN
	1    5714 1740
	1    0    0    -1  
$EndComp
Wire Wire Line
	1527 1441 1827 1441
Wire Wire Line
	2127 1441 2127 1544
Wire Wire Line
	1827 1391 1827 1441
Connection ~ 1827 1441
Wire Wire Line
	1827 1441 2127 1441
Wire Wire Line
	2445 4747 2945 4747
Connection ~ 2945 4747
Wire Wire Line
	2945 4747 3495 4747
Wire Wire Line
	2945 4747 2945 4797
$Comp
L Sensor_PCB_v7-rescue:AP2112K-3.3-Regulator_Linear-Sensor_PCB_v5-rescue U1
U 1 1 5F13570F
P 2945 4447
F 0 "U1" H 2945 4789 50  0000 C CNN
F 1 "APK2112.K-3.3" H 2945 4698 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5" H 2945 4647 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 3045 4197 50  0001 C CNN
	1    2945 4447
	1    0    0    -1  
$EndComp
NoConn ~ 6114 890 
NoConn ~ 6014 890 
Text Label 5814 3392 1    50   ~ 0
frmSensor
Wire Notes Line
	7856 4517 11223 4516
Wire Wire Line
	6864 2190 6998 2190
Wire Wire Line
	7297 2187 7298 2190
Wire Wire Line
	7395 2187 7297 2187
$Comp
L Device:R R9
U 1 1 5F6F66E1
P 7148 2190
F 0 "R9" V 7062 2138 50  0000 L CNN
F 1 "510 R" V 7248 2090 50  0001 L CNN
F 2 "Resistors_SMD:R_0805" V 7078 2190 50  0001 C CNN
F 3 "~" H 7148 2190 50  0001 C CNN
	1    7148 2190
	0    1    -1   0   
$EndComp
Wire Wire Line
	7695 2187 7695 2034
$Comp
L Device:LED D4
U 1 1 5F6F66ED
P 7545 2187
F 0 "D4" V 7525 2287 50  0000 C CNN
F 1 "Bat_Low" H 7475 2377 50  0001 C CNN
F 2 "Diodes_SMD:D_0805" H 7545 2187 50  0001 C CNN
F 3 "~" H 7545 2187 50  0001 C CNN
	1    7545 2187
	-1   0    0    -1  
$EndComp
Text Label 7695 2034 1    50   ~ 0
GND
Wire Wire Line
	4664 1490 4216 1490
NoConn ~ 4664 2490
Connection ~ 3495 4347
Wire Wire Line
	3495 4347 3745 4347
Wire Wire Line
	3245 4347 3495 4347
$Comp
L Device:C C3
U 1 1 5F14D815
P 3495 4497
F 0 "C3" H 3243 4497 50  0000 C CNN
F 1 "100 nf" V 3334 4497 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 3533 4347 50  0001 C CNN
F 3 "~" H 3495 4497 50  0001 C CNN
	1    3495 4497
	-1   0    0    1   
$EndComp
Text Label 3745 4297 2    50   ~ 0
Supply_Reg
NoConn ~ 5214 2990
NoConn ~ 6864 2390
NoConn ~ 4911 6940
NoConn ~ 4911 7040
Wire Wire Line
	6864 1990 7028 1990
Text Label 7028 1990 2    50   ~ 0
TX
Text Label 6999 1890 2    50   ~ 0
RX
Wire Wire Line
	6864 1890 6999 1890
$Comp
L Connector:Conn_01x06_Female J4
U 1 1 5FB978B5
P 9246 5487
F 0 "J4" H 9138 5054 50  0000 C CNN
F 1 "Conn_01x06_Female" H 9138 5053 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 9246 5487 50  0001 C CNN
F 3 "~" H 9246 5487 50  0001 C CNN
	1    9246 5487
	-1   0    0    1   
$EndComp
Text Label 9624 5287 2    50   ~ 0
TX
Text Label 9621 5387 2    50   ~ 0
RX
Wire Wire Line
	9446 5187 9746 5187
Wire Wire Line
	9446 5287 9624 5287
Wire Wire Line
	9446 5387 9621 5387
NoConn ~ 6864 2290
Wire Notes Line
	7851 519  7856 6577
Text Label 7180 2090 2    50   ~ 0
Activate
Wire Wire Line
	6864 2090 7180 2090
Wire Wire Line
	8248 3706 7968 3706
Text Label 7968 3706 0    50   ~ 0
Activate
Wire Wire Line
	8733 3706 8548 3706
$Comp
L Device:R R10
U 1 1 5FE3FFF9
P 8398 3706
F 0 "R10" V 8495 3712 50  0000 L CNN
F 1 "1K" V 8326 3668 50  0001 L CNN
F 2 "Resistors_SMD:R_0805" V 8328 3706 50  0001 C CNN
F 3 "~" H 8398 3706 50  0001 C CNN
	1    8398 3706
	0    -1   -1   0   
$EndComp
$Comp
L bc547:BC547 Q1
U 1 1 5FE0E407
P 8733 3906
F 0 "Q1" V 8630 4014 50  0000 C CNN
F 1 "BC547" V 8970 3906 50  0001 C CNN
F 2 "Custom_Libraries:BC547" H 8933 3831 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 8733 3906 50  0001 L CNN
	1    8733 3906
	0    1    1    0   
$EndComp
Wire Wire Line
	1566 4287 1387 4287
Wire Wire Line
	1566 4394 1566 4287
Wire Wire Line
	1906 4394 1866 4394
$Comp
L Device:R R1
U 1 1 5F141954
P 1906 4674
F 0 "R1" V 1806 4624 50  0000 L CNN
F 1 "510 R" V 2006 4574 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" V 1836 4674 50  0001 C CNN
F 3 "~" H 1906 4674 50  0001 C CNN
	1    1906 4674
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 5F13F264
P 1716 4394
F 0 "D1" V 1696 4494 50  0000 C CNN
F 1 "Pwr_L.E.D" H 1646 4584 50  0001 C CNN
F 2 "Diodes_SMD:D_0805" H 1716 4394 50  0001 C CNN
F 3 "~" H 1716 4394 50  0001 C CNN
	1    1716 4394
	-1   0    0    -1  
$EndComp
Text Label 1906 4924 0    50   ~ 0
GND
Text Label 1387 4287 0    50   ~ 0
VCC3V3
Text Label 475  4387 0    50   ~ 0
Supply_Reg
Connection ~ 2645 4347
Text Label 2775 6485 0    50   ~ 0
GND
Wire Wire Line
	2707 6485 2775 6485
Text Label 3307 6425 0    50   ~ 0
GND
Wire Wire Line
	3307 6373 3307 6425
Text Label 2036 5403 0    50   ~ 0
VCC_IN
Text Label 759  7091 1    50   ~ 0
VCC_IN
Wire Wire Line
	758  6757 759  7091
NoConn ~ 858  6757
NoConn ~ 958  6757
NoConn ~ 1058 6757
Text Label 3306 5345 0    50   ~ 0
BAT_IN
Wire Wire Line
	1396 5605 1381 5605
Wire Wire Line
	1396 5686 1396 5605
Wire Wire Line
	1399 5686 1396 5686
Wire Wire Line
	1399 5832 1399 5686
Wire Wire Line
	1996 5688 1996 5686
Wire Wire Line
	2050 5687 1996 5688
Wire Wire Line
	2050 5885 2050 5687
Wire Wire Line
	2107 5885 2050 5885
Wire Wire Line
	2003 5832 1999 5832
Wire Wire Line
	2004 5985 2003 5832
Wire Wire Line
	2107 5985 2004 5985
$Comp
L Device:R R7
U 1 1 600C9C79
P 1849 5832
F 0 "R7" V 1772 5784 50  0000 L CNN
F 1 "1K" V 1949 5732 50  0001 L CNN
F 2 "Resistors_SMD:R_0805" V 1779 5832 50  0001 C CNN
F 3 "~" H 1849 5832 50  0001 C CNN
	1    1849 5832
	0    1    -1   0   
$EndComp
$Comp
L Device:R R6
U 1 1 600C86CA
P 1846 5686
F 0 "R6" V 1913 5645 50  0000 L CNN
F 1 "1K" V 1946 5586 50  0001 L CNN
F 2 "Resistors_SMD:R_0805" V 1776 5686 50  0001 C CNN
F 3 "~" H 1846 5686 50  0001 C CNN
	1    1846 5686
	0    1    -1   0   
$EndComp
$Comp
L Device:LED D6
U 1 1 600C7E79
P 1549 5832
F 0 "D6" H 1537 5909 50  0000 C CNN
F 1 "Pwr_L.E.D" H 1479 6022 50  0001 C CNN
F 2 "Diodes_SMD:D_0805" H 1549 5832 50  0001 C CNN
F 3 "~" H 1549 5832 50  0001 C CNN
	1    1549 5832
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 600C666A
P 1546 5686
F 0 "D3" H 1534 5763 50  0000 C CNN
F 1 "Pwr_L.E.D" H 1476 5876 50  0001 C CNN
F 2 "Diodes_SMD:D_0805" H 1546 5686 50  0001 C CNN
F 3 "~" H 1546 5686 50  0001 C CNN
	1    1546 5686
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1382 5585 2107 5585
Wire Wire Line
	1382 5585 1381 5605
Wire Wire Line
	2107 5578 2107 5585
Wire Wire Line
	2106 5578 2107 5578
Wire Wire Line
	2106 5547 2106 5578
Wire Wire Line
	2036 5547 2106 5547
Wire Wire Line
	2036 5403 2036 5547
$Comp
L TP4056:TP4056 IC1
U 1 1 5FF0A5EF
P 2707 5885
F 0 "IC1" H 2919 6425 50  0000 C CNN
F 1 "TP4056" H 2707 6361 50  0001 C CNN
F 2 "Custom_Libraries:TP4056" H 2707 5885 50  0001 L BNN
F 3 "" H 2707 5885 50  0001 L BNN
	1    2707 5885
	1    0    0    -1  
$EndComp
Wire Wire Line
	3307 5585 3306 5345
Text Label 3462 5885 0    50   ~ 0
GND
Wire Wire Line
	3307 5585 3462 5585
$Comp
L Device:C C11
U 1 1 5FF7DABF
P 3462 5735
F 0 "C11" H 3339 5658 50  0000 C CNN
F 1 "10uf" V 3301 5735 50  0001 C CNN
F 2 "Capacitors_SMD:C_0805" H 3500 5585 50  0001 C CNN
F 3 "~" H 3462 5735 50  0001 C CNN
	1    3462 5735
	-1   0    0    1   
$EndComp
Wire Wire Line
	3307 5985 3307 6073
$Comp
L Device:R R11
U 1 1 5FF6C50C
P 3307 6223
F 0 "R11" H 3122 6214 50  0000 L CNN
F 1 "510R" V 3407 6123 50  0001 L CNN
F 2 "Resistors_SMD:R_0805" V 3237 6223 50  0001 C CNN
F 3 "~" H 3307 6223 50  0001 C CNN
	1    3307 6223
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 60111EEF
P 1886 5403
F 0 "C10" V 1763 5326 50  0000 C CNN
F 1 "10uf" V 1725 5403 50  0001 C CNN
F 2 "Capacitors_SMD:C_0805" H 1924 5253 50  0001 C CNN
F 3 "~" H 1886 5403 50  0001 C CNN
	1    1886 5403
	0    1    1    0   
$EndComp
Text Label 1736 5403 2    50   ~ 0
GND
Connection ~ 1396 5686
Connection ~ 2107 5585
Wire Wire Line
	2107 5585 2107 5685
Connection ~ 3307 5585
Wire Wire Line
	3307 5885 3462 5885
Text Label 1358 6878 2    50   ~ 0
Solar_-ve
Text Label 1358 6757 0    50   ~ 0
GND
Wire Wire Line
	1358 6757 1158 6757
Wire Wire Line
	1358 6757 1358 6878
Wire Wire Line
	2550 7030 2550 7280
$Comp
L usb_mini:USB_mini J6
U 1 1 60227883
P 1058 6357
F 0 "J6" V 951 5927 50  0000 R CNN
F 1 "USB3130-XX-X_REVD" V 906 5927 50  0001 R CNN
F 2 "Custom_Libraries:Conn_USBmicro-B_ebay-side_TH" H 1058 6357 50  0001 L BNN
F 3 "" H 1058 6357 50  0001 L BNN
F 4 "GCT" H 1058 6357 50  0001 L BNN "MANUFACTURER"
	1    1058 6357
	0    -1   -1   0   
$EndComp
Connection ~ 1358 6757
Text Label 724  6758 2    50   ~ 0
Solar_+ve
Wire Wire Line
	758  6758 724  6758
Connection ~ 758  6758
Text Label 8533 4006 2    50   ~ 0
VCC3V3
Text Label 8933 4006 0    50   ~ 0
VCC3V3_Sensor
NoConn ~ 4664 2390
Text Label 1399 5832 2    50   ~ 0
Solar_+ve
$Comp
L Connector:Conn_01x02_Female J7
U 1 1 60C157A9
P 3246 7035
F 0 "J7" H 2846 6835 50  0000 L CNN
F 1 "Water_level" H 2858 7568 50  0000 L CNN
F 2 "Custom_Libraries:Battery_holder" H 3246 7035 50  0001 C CNN
F 3 "~" H 3246 7035 50  0001 C CNN
	1    3246 7035
	-1   0    0    1   
$EndComp
Text Label 3446 6935 0    50   ~ 0
VCC3V3_Sensor
Text Label 3446 7035 0    50   ~ 0
frmSensor
Wire Wire Line
	5614 890  5614 540 
NoConn ~ 5714 890 
NoConn ~ 5814 890 
NoConn ~ 8749 5153
$Comp
L Ceramic_Antenna:YC0009AA E1
U 1 1 6127EAD6
P 5011 6071
F 0 "E1" H 5096 6054 50  0000 L CNN
F 1 "YC0009AA" H 5096 6009 50  0001 L CNN
F 2 "Custom_Libraries:XCVR_YC0009AA" H 5011 6071 50  0001 L BNN
F 3 "" H 5011 6071 50  0001 L BNN
F 4 "0.6 mm" H 5011 6071 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 5 "Manufacturer Recommendations" H 5011 6071 50  0001 L BNN "STANDARD"
F 6 "1.1" H 5011 6071 50  0001 L BNN "PARTREV"
F 7 "Quectel" H 5011 6071 50  0001 L BNN "MANUFACTURER"
	1    5011 6071
	1    0    0    -1  
$EndComp
$Comp
L lora:LoRa U2
U 1 1 5F21A746
P 5611 6790
F 0 "U2" H 5936 7401 60  0000 C CNN
F 1 "Ra-01" H 5603 6869 60  0000 C CNN
F 2 "Custom_Libraries:LoRa" H 5611 6340 60  0001 C CNN
F 3 "" H 5611 6340 60  0001 C CNN
	1    5611 6790
	1    0    0    -1  
$EndComp
Wire Wire Line
	4411 6290 4861 6290
Wire Wire Line
	4861 6290 4861 6071
Wire Wire Line
	4861 6071 4911 6071
Connection ~ 4411 6290
NoConn ~ 6864 2490
Wire Wire Line
	5814 2990 5814 3392
NoConn ~ 6014 2990
NoConn ~ 6114 2990
NoConn ~ 5714 2990
Wire Wire Line
	3446 7435 3446 7335
$Comp
L Device:R R4
U 1 1 62149E98
P 3446 7185
F 0 "R4" H 3521 7202 50  0000 L CNN
F 1 "1k" V 3546 7085 50  0001 L CNN
F 2 "Resistors_SMD:R_0805_2012Metric" V 3376 7185 50  0001 C CNN
F 3 "~" H 3446 7185 50  0001 C CNN
	1    3446 7185
	-1   0    0    -1  
$EndComp
Text Label 3446 7435 0    50   ~ 0
GND
NoConn ~ 5414 890 
NoConn ~ 5514 890 
$Comp
L slide_switch_SPDT:OS102011MA1QN1 S1
U 1 1 621FBFAC
P 1087 4387
F 0 "S1" H 974 4651 50  0000 C CNN
F 1 "OS102011MA1QN1" H 1187 4661 50  0001 C CNN
F 2 "Custom_Libraries:slide_switch_SPDT" H 1087 4387 50  0001 L BNN
F 3 "" H 1087 4387 50  0001 L BNN
	1    1087 4387
	1    0    0    -1  
$EndComp
Wire Wire Line
	987  4387 475  4387
NoConn ~ 1387 4487
$EndSCHEMATC
