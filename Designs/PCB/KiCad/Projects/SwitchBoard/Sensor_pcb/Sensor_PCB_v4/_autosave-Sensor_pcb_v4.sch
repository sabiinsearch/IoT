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
L power:GND #PWR01
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
$Comp
L lora:LoRa U2
U 1 1 5F21A746
P 5611 6790
F 0 "U2" H 5611 7527 60  0000 C CNN
F 1 "LoRa" H 5611 7421 60  0000 C CNN
F 2 "Custom_Libraries:LoRa" H 5611 6340 60  0001 C CNN
F 3 "" H 5611 6340 60  0001 C CNN
	1    5611 6790
	1    0    0    -1  
$EndComp
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
L Device:Antenna AE1
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
Text Notes 9768 2065 0    50   Italic 0
Temp / Hum
Text Notes 8373 2097 0    50   Italic 0
Light_sensor
Text Notes 10230 3370 0    50   Italic 0
Air Quality
Wire Wire Line
	2445 4697 2445 4747
Wire Wire Line
	3495 4647 3495 4747
Wire Wire Line
	3745 4297 3745 4347
$Comp
L Sensor_Optical:LDR03 R5
U 1 1 5F2B3D21
P 8523 1447
F 0 "R5" H 8593 1493 50  0000 L CNN
F 1 "LDR" H 8232 1395 50  0000 L CNN
F 2 "Diodes_THT:D_A-405_P5.08mm_Vertical_AnodeUp" V 8698 1447 50  0001 C CNN
F 3 "" H 8523 1397 50  0001 C CNN
	1    8523 1447
	1    0    0    -1  
$EndComp
Text Label 8923 897  2    50   ~ 0
VCC3V3
$Comp
L Device:R R4
U 1 1 5F2C1175
P 8523 1047
F 0 "R4" H 8373 1097 50  0000 L CNN
F 1 "10K" V 8623 947 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" V 8453 1047 50  0001 C CNN
F 3 "~" H 8523 1047 50  0001 C CNN
	1    8523 1047
	-1   0    0    1   
$EndComp
Wire Wire Line
	8523 897  8923 897 
Wire Wire Line
	8523 1297 8523 1247
Text Label 8273 1247 2    50   ~ 0
LDR_IN
Wire Wire Line
	8273 1247 8523 1247
Connection ~ 8523 1247
Wire Wire Line
	8523 1247 8523 1197
$Comp
L Sensor_Humidity:BME_280 U4
U 1 1 5F2EAD59
P 10068 1265
F 0 "U4" H 9868 1765 50  0000 C CNN
F 1 "BME_280" H 10068 765 50  0000 C CNN
F 2 "Custom_Libraries:BME280" H 10068 1365 50  0001 C CNN
F 3 "" H 10068 1365 50  0001 C CNN
	1    10068 1265
	1    0    0    -1  
$EndComp
Text Label 10868 1165 2    50   ~ 0
GND
Wire Wire Line
	10568 1165 10868 1165
Text Label 10868 965  2    50   ~ 0
VCC3V3
Wire Wire Line
	10568 965  10868 965 
Text Label 10868 1365 2    50   ~ 0
SCL
Wire Wire Line
	10868 1365 10568 1365
Text Label 10868 1565 2    50   ~ 0
SDA
Wire Wire Line
	10568 1565 10868 1565
Wire Wire Line
	6453 4244 6453 3894
Connection ~ 6453 4244
Connection ~ 6453 4744
Wire Wire Line
	6453 4794 6453 4744
Wire Wire Line
	6453 4744 6453 4244
Wire Wire Line
	5714 690  5714 890 
Text Label 5714 690  3    50   ~ 0
SDA
Wire Wire Line
	5814 690  5814 890 
Text Label 5814 690  3    50   ~ 0
SCL
Wire Wire Line
	5714 3290 5714 2990
Text Label 5714 3290 1    50   ~ 0
LDR_IN
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
Wire Wire Line
	5614 890  5614 540 
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
Text Notes 8380 3390 0    50   Italic 0
Ultra Sonic
Text Label 8450 2820 3    50   ~ 0
GND
Wire Wire Line
	8450 2820 8450 3040
Text Label 8250 2840 3    50   ~ 0
Trig
Wire Wire Line
	8250 2840 8250 3040
Text Label 8150 2730 3    50   ~ 0
OUT_5V
Wire Wire Line
	8150 3040 8150 2730
Text Label 8349 2486 3    50   ~ 0
EchoToStm32
Text Label 6013 3463 1    50   ~ 0
EchoToStm32
Text Label 6117 3157 1    50   ~ 0
Trig
Wire Wire Line
	6117 3157 6114 2990
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
L power:GND #PWR02
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
L Regulator_Linear:AP2112K-3.3 U1
U 1 1 5F13570F
P 2945 4447
F 0 "U1" H 2945 4789 50  0000 C CNN
F 1 "APK2112.K-3.3" H 2945 4698 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5" H 2945 4647 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 3045 4197 50  0001 C CNN
	1    2945 4447
	1    0    0    -1  
$EndComp
Wire Wire Line
	6014 2990 6013 3463
NoConn ~ 6114 890 
NoConn ~ 6014 890 
$Comp
L Connector:Conn_01x04_Female J5
U 1 1 5F614E50
P 10470 3280
F 0 "J5" V 10380 3490 50  0000 L CNN
F 1 "Airquality" V 10580 2890 50  0001 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 10470 3280 50  0001 C CNN
F 3 "~" H 10470 3280 50  0001 C CNN
	1    10470 3280
	0    1    1    0   
$EndComp
Text Label 10570 2746 3    50   ~ 0
VCC3V3
Wire Wire Line
	10570 3081 10570 3080
Connection ~ 10570 3080
Wire Wire Line
	10570 3080 10570 2746
Wire Wire Line
	10270 3080 10270 2766
NoConn ~ 10370 3080
Wire Wire Line
	10470 3080 10469 2775
Text Label 10469 2775 3    50   ~ 0
GND
Wire Wire Line
	5814 2990 5814 3283
Text Label 5814 3283 1    50   ~ 0
Air_in
Text Label 10270 2766 3    50   ~ 0
Air_in
Wire Wire Line
	4664 2390 4312 2390
Text Label 4312 2390 0    50   ~ 0
BAT_IN
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
Text Notes 1087 3755 0    79   Italic 0
Step up to for Ultrasonic
NoConn ~ 5214 2990
NoConn ~ 6864 2390
NoConn ~ 6864 2490
Wire Wire Line
	8350 3040 8349 2486
$Comp
L capacitor_electolytic:ECA-1EM102 C9
U 1 1 5FA81C57
P 3308 3008
F 0 "C9" V 3305 2789 50  0000 L CNN
F 1 "100 uF" V 3353 3138 50  0001 L CNN
F 2 "Custom_Libraries:CAPAE660X550N" H 3308 3008 50  0001 L BNN
F 3 "PANASONIC" H 3308 3008 50  0001 L BNN
	1    3308 3008
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Zener D5
U 1 1 5FA83197
P 2549 2589
F 0 "D5" H 2549 2464 50  0000 C CNN
F 1 "SS14" H 2549 2715 50  0001 C CNN
F 2 "Diodes_SMD:D_1206" H 2549 2589 50  0001 C CNN
F 3 "~" H 2549 2589 50  0001 C CNN
	1    2549 2589
	-1   0    0    1   
$EndComp
Text Label 1103 2332 2    50   ~ 0
Supply_Reg
Wire Wire Line
	2310 2932 2310 2589
Wire Wire Line
	2310 2589 2250 2589
Wire Wire Line
	2310 2589 2399 2589
Connection ~ 2310 2589
Wire Wire Line
	2699 2589 2904 2589
Wire Wire Line
	2904 2589 2904 2793
Wire Wire Line
	2904 2927 2910 2927
Wire Wire Line
	2910 2927 2910 2932
Wire Wire Line
	3308 2793 2904 2793
Connection ~ 2904 2793
Wire Wire Line
	2904 2793 2904 2927
Wire Wire Line
	2610 3232 3308 3232
Wire Wire Line
	3308 3232 3308 3223
Wire Wire Line
	1263 3231 2610 3230
Text Label 3600 2793 2    50   ~ 0
OUT_5V
Wire Wire Line
	3308 2793 3600 2793
Connection ~ 3308 2793
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
NoConn ~ 5514 890 
NoConn ~ 5414 890 
Wire Notes Line
	7851 519  7856 6577
$Comp
L Connector:Conn_01x04_Female J3
U 1 1 5FB05D28
P 8350 3240
F 0 "J3" V 8260 3450 50  0000 L CNN
F 1 "Distance /" V 8460 2850 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 8350 3240 50  0001 C CNN
F 3 "~" H 8350 3240 50  0001 C CNN
	1    8350 3240
	0    1    1    0   
$EndComp
Text Label 7180 2090 2    50   ~ 0
Activate
Wire Wire Line
	6864 2090 7180 2090
$Comp
L Power_Management:BL8530 U5
U 1 1 5FA6D060
P 2610 2932
F 0 "U5" H 2854 3061 50  0000 C CNN
F 1 "BL8530" H 2610 3083 50  0001 C CNN
F 2 "Custom_Libraries:SOT89" H 2635 2782 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 2610 2882 50  0001 C CNN
	1    2610 2932
	1    0    0    -1  
$EndComp
Wire Wire Line
	818  2032 538  2032
Text Label 538  2032 0    50   ~ 0
Activate
Wire Wire Line
	1303 2032 1118 2032
$Comp
L Device:R R10
U 1 1 5FE3FFF9
P 968 2032
F 0 "R10" V 1065 2038 50  0000 L CNN
F 1 "1K" V 896 1994 50  0001 L CNN
F 2 "Resistors_SMD:R_0805" V 898 2032 50  0001 C CNN
F 3 "~" H 968 2032 50  0001 C CNN
	1    968  2032
	0    -1   -1   0   
$EndComp
Text Label 8523 1712 2    50   ~ 0
GND
Wire Wire Line
	8523 1597 8523 1712
$Comp
L bc547:BC547 Q1
U 1 1 5FE0E407
P 1303 2232
F 0 "Q1" V 1200 2340 50  0000 C CNN
F 1 "BC547" V 1540 2232 50  0001 C CNN
F 2 "Custom_Libraries:BC547-SOT23" H 1503 2157 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 1303 2232 50  0001 L CNN
	1    1303 2232
	0    1    1    0   
$EndComp
Text Label 2610 3419 2    50   ~ 0
GND
Wire Wire Line
	2610 3230 2610 3419
Connection ~ 1566 4394
Wire Wire Line
	1566 4287 1387 4287
Wire Wire Line
	1566 4394 1566 4287
NoConn ~ 766  4294
Text Label 1566 4701 2    50   ~ 0
GND
Wire Wire Line
	1566 4594 1566 4701
Wire Wire Line
	766  4494 418  4494
$Comp
L Slide_switch:MLL1200S SW1
U 1 1 5F40052F
P 1166 4494
F 0 "SW1" H 1166 4959 50  0000 C CNN
F 1 "MLL1200S" H 1166 4868 50  0000 C CNN
F 2 "Custom_Libraries:SW_MLL1200S" H 1166 4494 50  0001 L BNN
F 3 "1437575-1" H 1166 4494 50  0001 L BNN
	1    1166 4494
	1    0    0    -1  
$EndComp
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
Text Label 418  4494 0    50   ~ 0
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
Text Label 2336 5403 0    50   ~ 0
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
Text Label 1081 5605 2    50   ~ 0
Solar_+ve
$Comp
L Device:R R8
U 1 1 6006DBBE
P 2186 5403
F 0 "R8" V 2299 5354 50  0000 L CNN
F 1 "0.4R" V 2286 5303 50  0001 L CNN
F 2 "Resistors_SMD:R_0805" V 2116 5403 50  0001 C CNN
F 3 "~" H 2186 5403 50  0001 C CNN
	1    2186 5403
	0    1    -1   0   
$EndComp
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
$Comp
L Simulation_SPICE:DIODE D2
U 1 1 5F1B7D1B
P 1231 5605
F 0 "D2" H 1224 5699 50  0000 C CNN
F 1 "IN4007" H 1231 5479 50  0001 C CNN
F 2 "Diodes_SMD:D_1206" H 1231 5605 50  0001 C CNN
F 3 "~" H 1231 5605 50  0001 C CNN
F 4 "Y" H 1231 5605 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "D" H 1231 5605 50  0001 L CNN "Spice_Primitive"
	1    1231 5605
	1    0    0    -1  
$EndComp
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
F 2 "Custom_Libraries:SOP-8" H 2707 5885 50  0001 L BNN
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
F 0 "R11" H 3157 6238 50  0000 L CNN
F 1 "1.2k" V 3407 6123 50  0001 L CNN
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
Connection ~ 1381 5605
Connection ~ 1396 5686
Connection ~ 2036 5403
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
Wire Wire Line
	1263 2801 1263 2589
Wire Wire Line
	1263 2589 1250 2589
$Comp
L capacitor_electolytic:ECA-1EM102 C8
U 1 1 5FE90C10
P 1263 3016
F 0 "C8" V 1260 2797 50  0000 L CNN
F 1 "100 uF" V 1308 3146 50  0001 L CNN
F 2 "Custom_Libraries:CAPAE660X550N" H 1263 3016 50  0001 L BNN
F 3 "PANASONIC" H 1263 3016 50  0001 L BNN
	1    1263 3016
	0    -1   -1   0   
$EndComp
Text Label 724  6758 2    50   ~ 0
Solar_+ve
Wire Wire Line
	758  6758 724  6758
Connection ~ 758  6758
$Comp
L 1248AS-H-220M_P3:Inductor_22uH L1
U 1 1 5FA7A56F
P 1750 2589
F 0 "L1" H 1750 2681 50  0000 C CNN
F 1 "Inductor_22uH" H 1350 2789 50  0001 L BNN
F 2 "Custom_Libraries:IND_1248AS-H-220M=P3" H 1286 2446 50  0001 L BNN
F 3 "N/A" H 1581 2673 50  0001 L BNN
	1    1750 2589
	1    0    0    -1  
$EndComp
Wire Wire Line
	1503 2332 1503 2486
Wire Wire Line
	1503 2486 1264 2486
Wire Wire Line
	1264 2486 1263 2589
Connection ~ 1263 2589
$EndSCHEMATC
