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
L Connector_Generic:Conn_02x03_Top_Bottom J1
U 1 1 5F0FF079
P 1443 2144
F 0 "J1" H 1493 2461 50  0000 C CNN
F 1 "Header 3x2" H 1493 1944 50  0000 C CNN
F 2 "Custom_Libraries:Pin_Header_02x03" H 1443 2144 50  0001 C CNN
F 3 "~" H 1443 2144 50  0001 C CNN
	1    1443 2144
	1    0    0    -1  
$EndComp
Text Label 1993 1744 2    50   ~ 0
VCC3V3
Wire Wire Line
	1743 1744 1743 1844
Wire Wire Line
	1743 1844 1243 1844
Wire Wire Line
	1243 1844 1243 2044
Connection ~ 1743 1844
Wire Wire Line
	1743 1844 1743 2044
Wire Wire Line
	1243 2244 1143 2244
Wire Wire Line
	1143 2244 1143 2544
Wire Wire Line
	1143 2544 1343 2544
Wire Wire Line
	1343 2544 1743 2544
Wire Wire Line
	1743 2544 1743 2244
Connection ~ 1343 2544
Text Label 1993 2144 2    50   ~ 0
BOOT1
Text Label 943  2144 0    50   ~ 0
BOOT0
Wire Wire Line
	943  2144 1243 2144
Wire Wire Line
	1743 2144 1993 2144
Wire Wire Line
	1743 1744 1993 1744
Text Label 6453 3894 3    50   ~ 0
OSCOUT
Text Label 4364 1590 0    50   ~ 0
PC14
Text Label 4364 1690 0    50   ~ 0
PC15
Wire Wire Line
	4664 1590 4364 1590
Wire Wire Line
	4364 1690 4664 1690
Text Label 4364 1790 0    50   ~ 0
OSCIN
Text Label 4364 1890 0    50   ~ 0
OSCOUT
Wire Wire Line
	4364 1790 4664 1790
Wire Wire Line
	4664 1890 4364 1890
Text Label 4314 2190 0    50   ~ 0
VCC3V3
Wire Wire Line
	4314 2190 4664 2190
Text Label 4364 1990 0    50   ~ 0
RESET
Wire Wire Line
	4364 1990 4664 1990
$Comp
L Switch:SW_Push SW1
U 1 1 5F125580
P 2393 2294
F 0 "SW1" V 2393 2244 50  0000 R CNN
F 1 "SW_Push" V 2293 2744 50  0001 R CNN
F 2 "Buttons_Switches_SMD:SW_DIP_x1_W7.62mm_Slide_Copal_CHS-B" H 2393 2494 50  0001 C CNN
F 3 "~" H 2393 2494 50  0001 C CNN
	1    2393 2294
	0    -1   -1   0   
$EndComp
Text Label 2893 2094 2    50   ~ 0
RESET
Wire Wire Line
	2393 2094 2693 2094
$Comp
L power:GNDREF #PWR04
U 1 1 5F102D01
P 1343 2544
F 0 "#PWR04" H 1348 2371 50  0001 C CNN
F 1 "GNDREF" H 1348 2371 50  0000 C CNN
F 2 "" H 1343 2544 50  0001 C CNN
F 3 "" H 1343 2544 50  0001 C CNN
	1    1343 2544
	1    0    0    -1  
$EndComp
Wire Wire Line
	2393 2494 2693 2494
Wire Wire Line
	2793 2494 2793 2544
$Comp
L Device:C C1
U 1 1 5F129E71
P 2693 2294
F 0 "C1" H 2578 2248 50  0000 R CNN
F 1 "1.0uf" H 2578 2339 50  0000 R CNN
F 2 "Capacitors_SMD:C_0805" H 2731 2144 50  0001 C CNN
F 3 "~" H 2693 2294 50  0001 C CNN
	1    2693 2294
	-1   0    0    1   
$EndComp
Wire Wire Line
	2693 2444 2693 2494
Connection ~ 2693 2494
Wire Wire Line
	2693 2494 2793 2494
Wire Wire Line
	2693 2144 2693 2094
Connection ~ 2693 2094
Wire Wire Line
	2693 2094 2893 2094
Text Label 2943 1644 2    50   ~ 0
VCC3V3
$Comp
L Device:R R1
U 1 1 5F12CF37
P 2693 1844
F 0 "R1" H 2763 1890 50  0000 L CNN
F 1 "10K" H 2763 1799 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" V 2623 1844 50  0001 C CNN
F 3 "~" H 2693 1844 50  0001 C CNN
	1    2693 1844
	1    0    0    -1  
$EndComp
Wire Wire Line
	2693 1694 2693 1644
Wire Wire Line
	2693 1644 2943 1644
Wire Wire Line
	2693 1994 2693 2094
$Comp
L power:GNDREF #PWR02
U 1 1 5F1282A4
P 2793 2544
F 0 "#PWR02" H 2798 2371 50  0001 C CNN
F 1 "GNDREF" H 2798 2371 50  0000 C CNN
F 2 "" H 2793 2544 50  0001 C CNN
F 3 "" H 2793 2544 50  0001 C CNN
	1    2793 2544
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:AP2112K-3.3 U1
U 1 1 5F13570F
P 2675 4952
F 0 "U1" H 2675 5294 50  0000 C CNN
F 1 "APK2112.K-3.3" H 2675 5203 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5" H 2675 5152 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 2775 4702 50  0001 C CNN
	1    2675 4952
	1    0    0    -1  
$EndComp
Wire Wire Line
	2375 4852 2375 4952
Wire Wire Line
	2175 4852 2375 4852
Connection ~ 2375 4852
$Comp
L power:GNDREF #PWR03
U 1 1 5F13CA0F
P 2675 5302
F 0 "#PWR03" H 2680 5129 50  0001 C CNN
F 1 "GNDREF" H 2680 5129 50  0000 C CNN
F 2 "" H 2675 5302 50  0001 C CNN
F 3 "" H 2675 5302 50  0001 C CNN
	1    2675 5302
	1    0    0    -1  
$EndComp
Wire Wire Line
	2675 5252 2675 5302
Text Label 3475 4802 2    50   ~ 0
Supply_Reg
Text Label 2875 5252 0    50   ~ 0
GND
Connection ~ 2675 5252
$Comp
L Connector_Generic:Conn_01x05 J2
U 1 1 5F0DE12E
P 10269 5607
F 0 "J2" H 10187 5182 50  0000 C CNN
F 1 "Prog Hdr" H 10187 5273 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 10269 5607 50  0001 C CNN
F 3 "~" H 10269 5607 50  0001 C CNN
	1    10269 5607
	-1   0    0    1   
$EndComp
Text Label 10669 5407 2    50   ~ 0
GND
Text Label 1275 4852 2    50   ~ 0
BAT_IN
Connection ~ 2175 4852
Text Label 10769 5507 2    50   ~ 0
5V
Text Label 10969 5607 2    50   ~ 0
VCC3V3
Wire Wire Line
	10469 5407 10669 5407
Wire Wire Line
	10769 5507 10469 5507
Wire Wire Line
	10469 5607 10969 5607
Text Label 10819 5707 2    50   ~ 0
RX0
Text Label 10819 5807 2    50   ~ 0
TX0
Wire Wire Line
	10819 5807 10469 5807
Wire Wire Line
	10469 5707 10819 5707
$Comp
L Connector:Conn_01x04_Female J4
U 1 1 5F12B0FD
P 9246 5587
F 0 "J4" H 9346 5337 50  0000 C CNN
F 1 "SWD" H 9096 5837 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 9246 5587 50  0001 C CNN
F 3 "~" H 9246 5587 50  0001 C CNN
	1    9246 5587
	-1   0    0    1   
$EndComp
Text Label 9796 5487 2    50   ~ 0
SWIO
Text Label 9796 5587 2    50   ~ 0
SWCLK
Wire Wire Line
	9446 5487 9796 5487
Wire Wire Line
	9796 5587 9446 5587
Wire Wire Line
	9746 5387 9446 5387
Text Label 9696 5687 2    50   ~ 0
GND
Wire Wire Line
	9696 5687 9446 5687
$Comp
L Device:LED D1
U 1 1 5F13F264
P 1875 5152
F 0 "D1" H 1868 4897 50  0000 C CNN
F 1 "LED" H 1868 4988 50  0000 C CNN
F 2 "Diodes_SMD:D_0805" H 1875 5152 50  0001 C CNN
F 3 "~" H 1875 5152 50  0001 C CNN
	1    1875 5152
	0    1    1    0   
$EndComp
Text Label 9746 5387 2    50   ~ 0
VCC3V3
Text Label 1175 5402 2    50   ~ 0
GND
$Comp
L Device:R R3
U 1 1 5F141954
P 1525 5402
F 0 "R3" V 1425 5352 50  0000 L CNN
F 1 "510 R" V 1625 5302 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" V 1455 5402 50  0001 C CNN
F 3 "~" H 1525 5402 50  0001 C CNN
	1    1525 5402
	0    1    1    0   
$EndComp
Wire Wire Line
	1875 5002 1875 4852
Wire Wire Line
	1875 5402 1675 5402
Wire Wire Line
	1375 5402 1175 5402
$Comp
L Device:C C7
U 1 1 5F14D815
P 3225 5002
F 0 "C7" H 2973 5002 50  0000 C CNN
F 1 "100 nf" V 3064 5002 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 3263 4852 50  0001 C CNN
F 3 "~" H 3225 5002 50  0001 C CNN
	1    3225 5002
	-1   0    0    1   
$EndComp
Wire Wire Line
	2675 5252 3225 5252
$Comp
L Device:C C6
U 1 1 5F152167
P 2175 5052
F 0 "C6" H 2325 5052 50  0000 C CNN
F 1 "100 nf" V 2075 5052 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 2213 4902 50  0001 C CNN
F 3 "~" H 2175 5052 50  0001 C CNN
	1    2175 5052
	-1   0    0    1   
$EndComp
Wire Wire Line
	2175 4852 2175 4902
Wire Wire Line
	2675 5202 2675 5252
Text Label 4414 2090 0    50   ~ 0
GND
Wire Wire Line
	4414 2090 4664 2090
Text Label 2993 2494 0    50   ~ 0
GND
Wire Wire Line
	2793 2494 2993 2494
Connection ~ 2793 2494
Text Label 1893 2544 0    50   ~ 0
GND
Wire Wire Line
	1743 2544 1893 2544
Connection ~ 1743 2544
$Comp
L lora:LoRa U3
U 1 1 5F21A746
P 5611 6790
F 0 "U3" H 5611 7527 60  0000 C CNN
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
Text Notes 1750 2983 0    79   Italic 0
Boot & Reset
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
Text Label 4661 6940 0    50   ~ 0
DIO1
Wire Wire Line
	4911 6940 4661 6940
Text Label 4661 6740 0    50   ~ 0
Reset
Wire Wire Line
	4661 6740 4911 6740
Text Label 6511 6540 2    50   ~ 0
NSS
Wire Wire Line
	6511 6540 6311 6540
Wire Wire Line
	6311 6440 6511 6440
Text Label 4414 2490 0    50   ~ 0
DIO0
Wire Wire Line
	4414 2490 4664 2490
Text Label 4414 2390 0    50   ~ 0
Reset
Wire Wire Line
	4414 2390 4664 2390
NoConn ~ 6311 6940
NoConn ~ 6311 7040
NoConn ~ 4911 7140
NoConn ~ 4911 7040
$Comp
L Device:Antenna AE1
U 1 1 5F2C5F88
P 4411 6090
F 0 "AE1" H 4491 6079 50  0000 L CNN
F 1 "Antenna" H 4491 5988 50  0000 L CNN
F 2 "SMD_Packages:1Pin" H 4411 6090 50  0001 C CNN
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
Text Label 4364 2290 0    50   ~ 0
Touch_1
Wire Wire Line
	4364 2290 4664 2290
Text Label 4364 1490 0    50   ~ 0
Touch_3
Wire Wire Line
	4364 1490 4664 1490
NoConn ~ 4664 1390
Text Notes 9768 2065 0    50   Italic 0
Temp / Hum
Text Notes 8373 2097 0    50   Italic 0
Light_sensor
Text Notes 9434 3524 0    50   Italic 0
Air Quality
$Comp
L Switch:SW_Push SW2
U 1 1 5F213119
P 1525 4852
F 0 "SW2" H 1525 5052 50  0000 R CNN
F 1 "SW_Push" V 1425 5302 50  0001 R CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm_h5mm" H 1525 5052 50  0001 C CNN
F 3 "~" H 1525 5052 50  0001 C CNN
	1    1525 4852
	1    0    0    -1  
$EndComp
Wire Wire Line
	1725 4852 1875 4852
Wire Wire Line
	1275 4852 1325 4852
Connection ~ 1875 4852
Wire Wire Line
	1875 4852 2175 4852
Wire Wire Line
	1875 5302 1875 5402
Wire Wire Line
	2175 5202 2175 5252
Wire Wire Line
	2175 5252 2675 5252
Text Label 2075 4652 2    50   ~ 0
BAT_+ve
Wire Wire Line
	1875 4852 1875 4652
Wire Wire Line
	1875 4652 2075 4652
Wire Wire Line
	2975 4852 3225 4852
Wire Wire Line
	3225 4852 3475 4852
Connection ~ 3225 4852
Wire Wire Line
	3225 5152 3225 5252
Wire Wire Line
	3475 4802 3475 4852
$Comp
L Sensor_Optical:LDR03 R5
U 1 1 5F2B3D21
P 8523 1447
F 0 "R5" H 8593 1493 50  0000 L CNN
F 1 "LDR" H 8523 1097 50  0000 L CNN
F 2 "Diodes_THT:D_A-405_P5.08mm_Vertical_AnodeUp" V 8698 1447 50  0001 C CNN
F 3 "" H 8523 1397 50  0001 C CNN
	1    8523 1447
	1    0    0    -1  
$EndComp
Text Label 9023 1597 2    50   ~ 0
GND
Wire Wire Line
	8523 1597 9023 1597
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
	5414 690  5414 890 
Text Label 5414 690  3    50   ~ 0
SDA
Wire Wire Line
	5514 690  5514 890 
Text Label 5514 690  3    50   ~ 0
SCL
NoConn ~ 6864 2290
NoConn ~ 6864 2190
NoConn ~ 6864 2090
Wire Wire Line
	5814 3290 5814 2990
Text Label 5814 3290 1    50   ~ 0
Energy
Wire Wire Line
	5714 3290 5714 2990
Text Label 5714 3290 1    50   ~ 0
LDR_IN
Text Label 5914 3290 1    50   ~ 0
BOOT1
Wire Wire Line
	6864 2490 7214 2490
Wire Wire Line
	7214 2390 6864 2390
Wire Wire Line
	6214 2990 6214 3240
Wire Wire Line
	6114 3290 6114 2990
Text Label 6114 3290 1    50   ~ 0
DSW_4
Wire Wire Line
	6014 3290 6014 2990
Text Label 6014 3290 1    50   ~ 0
DSW_3
Wire Wire Line
	7214 1790 6864 1790
Text Label 7214 1790 2    50   ~ 0
DSW_2
Wire Wire Line
	7214 1690 6864 1690
Text Label 7214 1690 2    50   ~ 0
DSW_1
Text Label 7214 2390 2    50   ~ 0
Touch_3
$Comp
L stm32:STM32 U2
U 1 1 5F0D833D
P 5714 1740
F 0 "U2" H 6714 2640 60  0000 L CNN
F 1 "STM32" H 5564 1440 118 0000 L CNN
F 2 "Custom_Libraries:STM32(LQFP48)" H 5714 1740 60  0001 C CNN
F 3 "" H 5714 1740 60  0001 C CNN
	1    5714 1740
	1    0    0    -1  
$EndComp
Wire Wire Line
	5414 3290 5414 2990
Wire Wire Line
	5514 3290 5514 2990
Wire Wire Line
	5614 2990 5614 3290
Wire Wire Line
	5914 2990 5914 3290
Wire Wire Line
	6314 3340 6314 2990
Text Label 7214 2490 2    50   ~ 0
Touch_2
Wire Wire Line
	5214 3290 5214 2990
Text Label 5214 3290 1    50   ~ 0
DIO1
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
Wire Wire Line
	7164 1490 6864 1490
Text Label 7164 1490 2    50   ~ 0
GND
Wire Wire Line
	5314 690  5314 890 
Text Label 5314 690  3    50   ~ 0
GND
Text Label 6214 3240 1    50   ~ 0
GND
Text Label 6314 3340 1    50   ~ 0
VCC3V3
Wire Wire Line
	5214 640  5214 890 
Text Label 5214 640  3    50   ~ 0
VCC3V3
Wire Wire Line
	6314 590  6314 890 
Text Label 6314 590  3    50   ~ 0
SWCLK
Wire Wire Line
	6864 1590 7214 1590
Text Label 7214 1590 2    50   ~ 0
SWIO
Wire Wire Line
	7214 1890 6864 1890
Text Label 7214 1890 2    50   ~ 0
RX0
Wire Wire Line
	6864 1990 7214 1990
Text Label 7214 1990 2    50   ~ 0
TX0
Connection ~ 4903 5094
Wire Wire Line
	4903 5444 4903 5094
Text Label 4903 5444 1    50   ~ 0
GND
Wire Wire Line
	6864 1390 7264 1390
Text Label 7264 1390 2    50   ~ 0
VCC3V3
Wire Wire Line
	5614 890  5614 540 
Text Label 5614 540  3    50   ~ 0
BOOT0
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
Connection ~ 4903 4394
Wire Wire Line
	4903 4394 4903 4094
Text Label 4903 4094 3    50   ~ 0
PC14
Wire Wire Line
	4903 4394 4903 4794
Wire Wire Line
	4953 4394 4903 4394
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
L Device:C C2
U 1 1 5F0E9AA7
P 4903 4944
F 0 "C2" V 4651 4944 50  0000 C CNN
F 1 "20pf" V 4742 4944 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 4941 4794 50  0001 C CNN
F 3 "~" H 4903 4944 50  0001 C CNN
	1    4903 4944
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5F0E94E8
P 5303 4944
F 0 "C3" V 5051 4944 50  0000 C CNN
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
L Device:C C5
U 1 1 5F0E6674
P 6453 4944
F 0 "C5" V 6201 4944 50  0000 C CNN
F 1 "20pf" V 6292 4944 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 6491 4794 50  0001 C CNN
F 3 "~" H 6453 4944 50  0001 C CNN
	1    6453 4944
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5F0E49DE
P 5753 4944
F 0 "C4" V 5501 4944 50  0000 C CNN
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
L Device:R R2
U 1 1 5F0E2D13
P 6103 4244
F 0 "R2" H 6173 4290 50  0000 L CNN
F 1 "1M" H 6173 4199 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" V 6033 4244 50  0001 C CNN
F 3 "~" H 6103 4244 50  0001 C CNN
	1    6103 4244
	0    -1   -1   0   
$EndComp
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
Text Label 2200 6000 0    50   ~ 0
Supply_Reg
Text Label 2400 5800 0    50   ~ 0
BAT_+ve
Text Notes 5267 5556 0    79   Italic 0
Crystals for Clock\n
Wire Notes Line
	3809 482  3870 7798
Wire Notes Line
	469  4000 3831 3991
Wire Notes Line
	7654 479  7659 6537
Wire Notes Line
	7659 6537 7680 6558
Wire Notes Line
	7680 6558 7680 6579
Wire Notes Line
	7680 4885 11280 4885
Text Label 2400 5900 0    50   ~ 0
VCC3V3
Text Label 3700 5900 2    50   ~ 0
VCC3V3
Wire Wire Line
	2400 5900 2700 5900
Text Label 3700 5800 2    50   ~ 0
BAT_+ve
Wire Wire Line
	2400 5800 2700 5800
Text Label 3800 6000 2    50   ~ 0
Supply_Reg
Wire Wire Line
	2200 6000 2700 6000
Text Label 3300 6700 2    50   ~ 0
Solar_+ve
Wire Wire Line
	3800 6000 3400 6000
Wire Wire Line
	3700 5900 3400 5900
Wire Wire Line
	3700 5800 3400 5800
Text Label 2800 7280 2    50   ~ 0
GND
$Comp
L Switch:Slide_switch U5
U 1 1 5F77381B
P 3200 5900
F 0 "U5" H 3200 6200 50  0000 C CNN
F 1 "Slide_switch" H 3100 5600 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_DIP_x3_W7.62mm_Slide_LowProfile" H 3200 5900 50  0001 C CNN
F 3 "" H 3200 5900 50  0001 C CNN
	1    3200 5900
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J3
U 1 1 5F191EAA
P 1275 7002
F 0 "J3" H 875 6802 50  0000 L CNN
F 1 "Solar_input" H 1075 7102 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 1275 7002 50  0001 C CNN
F 3 "~" H 1275 7002 50  0001 C CNN
	1    1275 7002
	-1   0    0    1   
$EndComp
Text Label 1925 7002 2    50   ~ 0
Solar_-ve
Wire Wire Line
	1475 7002 1925 7002
Text Label 1925 6902 2    50   ~ 0
Solar_+ve
Wire Wire Line
	1925 6902 1475 6902
Text Label 2580 6800 2    50   ~ 0
BAT_IN
$Comp
L Connector:Conn_01x02_Female J5
U 1 1 5F1AA8B3
P 2350 7030
F 0 "J5" H 2250 6830 50  0000 L CNN
F 1 "Battery_input" H 1900 7130 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 2350 7030 50  0001 C CNN
F 3 "~" H 2350 7030 50  0001 C CNN
	1    2350 7030
	-1   0    0    1   
$EndComp
$Comp
L Simulation_SPICE:DIODE D2
U 1 1 5F1B7D1B
P 2800 6800
F 0 "D2" H 2800 6583 50  0000 C CNN
F 1 "DIODE" H 2800 6674 50  0000 C CNN
F 2 "Diodes_SMD:D_0805" H 2800 6800 50  0001 C CNN
F 3 "~" H 2800 6800 50  0001 C CNN
F 4 "Y" H 2800 6800 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "D" H 2800 6800 50  0001 L CNN "Spice_Primitive"
	1    2800 6800
	-1   0    0    1   
$EndComp
Wire Wire Line
	2950 6800 3300 6800
Wire Wire Line
	3300 6800 3300 6700
Wire Wire Line
	2550 6930 2550 6800
Wire Wire Line
	2550 6800 2650 6800
Text Label 3000 7080 2    50   ~ 0
Solar_-ve
Wire Wire Line
	2550 7030 2550 7080
Wire Wire Line
	2550 7080 3000 7080
Wire Wire Line
	2550 7080 2550 7280
Wire Wire Line
	2550 7280 2800 7280
Connection ~ 2550 7080
$EndSCHEMATC