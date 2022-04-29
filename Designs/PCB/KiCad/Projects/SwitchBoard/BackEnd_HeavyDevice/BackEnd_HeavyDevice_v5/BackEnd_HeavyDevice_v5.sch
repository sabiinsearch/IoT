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
Wire Notes Line
	11229 3169 11221 3169
Text Label 653  1436 0    50   ~ 0
Mains_Live_Out
$Comp
L Device:Fuse_Small F1
U 1 1 5F656F09
P 979 1836
F 0 "F1" H 985 1781 50  0000 C CNN
F 1 "Fuse_Small" H 979 1930 50  0001 C CNN
F 2 "Fuse_Holders_and_Fuses:Fuse_TE5_Littlefuse-395Series" H 979 1836 50  0001 C CNN
F 3 "~" H 979 1836 50  0001 C CNN
	1    979  1836
	1    0    0    -1  
$EndComp
Wire Wire Line
	1079 1836 1169 1836
Text Label 355  1835 0    50   ~ 0
Mains_Live_In
Wire Wire Line
	879  1836 355  1835
Text Label 2486 1336 2    50   ~ 0
5V
Text Label 2544 1936 2    50   ~ 0
GND
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 5F66980C
P 1516 724
F 0 "J2" H 1596 670 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 1596 625 50  0001 L CNN
F 2 "TerminalBlocks_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2_1x02_P5.00mm_Horizontal" H 1516 724 50  0001 C CNN
F 3 "~" H 1516 724 50  0001 C CNN
	1    1516 724 
	1    0    0    -1  
$EndComp
Text Notes 1375 996  0    59   Italic 0
Mains
Text Notes 1357 2265 0    59   Italic 0
Current Sensor
$Comp
L Regulator_Linear:AP2112K-3.3 U4
U 1 1 5F678A39
P 9683 2891
F 0 "U4" H 9683 3233 50  0000 C CNN
F 1 "AP2112K-3.3" H 9683 3142 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5_HandSoldering" H 9683 3216 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/AP2112.pdf" H 9683 2991 50  0001 C CNN
	1    9683 2891
	1    0    0    -1  
$EndComp
Text Label 9221 2791 2    50   ~ 0
5V
Wire Wire Line
	9383 2891 9383 2791
Wire Wire Line
	9383 2791 9221 2791
Connection ~ 9383 2791
Text Label 9683 3289 2    50   ~ 0
GND
Wire Wire Line
	9983 2791 10167 2791
Wire Wire Line
	9683 3191 9683 3289
Text Label 10167 2791 2    50   ~ 0
3.3V
$Comp
L Isolator:4N35 U3
U 1 1 5F6907F0
P 7113 1375
F 0 "U3" H 7113 1608 50  0000 C CNN
F 1 "4N35" H 7113 1609 50  0001 C CNN
F 2 "Housings_DIP:DIP-6_W8.89mm_SMDSocket_LongPads" H 6913 1175 50  0001 L CIN
F 3 "https://www.vishay.com/docs/81181/4n35.pdf" H 7113 1375 50  0001 L CNN
	1    7113 1375
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener D2
U 1 1 5F6922E0
P 6390 1425
F 0 "D2" V 6390 1505 50  0000 L CNN
F 1 "IN14007" V 6435 1505 50  0001 L CNN
F 2 "Diodes_SMD:D_0805" H 6390 1425 50  0001 C CNN
F 3 "~" H 6390 1425 50  0001 C CNN
	1    6390 1425
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 5F6968FD
P 6390 1725
F 0 "R1" H 6460 1725 50  0000 L CNN
F 1 "220K" H 6460 1680 50  0001 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6320 1725 50  0001 C CNN
F 3 "~" H 6390 1725 50  0001 C CNN
	1    6390 1725
	1    0    0    -1  
$EndComp
Text Label 5787 1875 0    50   ~ 0
Mains_Neutral
Wire Wire Line
	6390 1875 5787 1875
Text Label 5866 1274 0    50   ~ 0
Mains_Live_Out
Wire Wire Line
	6390 1275 5866 1274
Wire Wire Line
	6813 1275 6390 1275
Wire Wire Line
	6813 1475 6812 1550
Wire Wire Line
	6812 1550 6400 1550
Wire Wire Line
	6400 1550 6400 1575
Wire Wire Line
	6400 1575 6390 1575
Connection ~ 6390 1575
Connection ~ 6390 1275
Text Label 7413 1562 3    50   ~ 0
GND
Wire Wire Line
	7413 1475 7413 1562
Text Label 7714 1375 2    50   ~ 0
Opto_In
Wire Wire Line
	7413 1375 7714 1375
NoConn ~ 7413 1275
Wire Wire Line
	2296 3459 2515 3459
Text Label 2296 3459 0    50   ~ 0
GND
Text Label 2298 3359 0    50   ~ 0
5V
Wire Wire Line
	2515 3359 2298 3359
Text Label 2296 3259 0    50   ~ 0
3.3V
Wire Wire Line
	2515 3259 2296 3259
Text Label 2223 3159 0    50   ~ 0
Opto_In
Wire Wire Line
	2515 3159 2223 3159
Text Label 1964 3059 0    50   ~ 0
Energy_toStm
Wire Wire Line
	2515 3059 1964 3059
Text Label 2306 2960 0    50   ~ 0
DSW1
Wire Wire Line
	2515 2959 2306 2960
$Comp
L Relay_SolidState:MOC3021M U5
U 1 1 5F759D7C
P 5783 3098
F 0 "U5" H 5786 2892 50  0000 C CNN
F 1 "MOC3021" H 5783 3332 50  0001 C CNN
F 2 "Housings_DIP:DIP-6_W8.89mm_SMDSocket_LongPads" H 5583 2898 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/MO/MOC3020M.pdf" H 5783 3098 50  0001 L CNN
	1    5783 3098
	-1   0    0    1   
$EndComp
$Comp
L Device:R R2
U 1 1 5F76C623
P 6265 3198
F 0 "R2" V 6167 3145 50  0000 L CNN
F 1 "100E" H 6335 3153 50  0001 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6195 3198 50  0001 C CNN
F 3 "~" H 6265 3198 50  0001 C CNN
	1    6265 3198
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6083 3198 6115 3198
Wire Wire Line
	6415 3198 6468 3198
Text Label 6306 2998 2    50   ~ 0
DSW1
Wire Wire Line
	6083 2998 6306 2998
$Comp
L Triac_Thyristor:BT136-500 Q1
U 1 1 5F77F666
P 4959 3099
F 0 "Q1" H 5109 3098 50  0000 C CNN
F 1 "BT136-500" V 5134 3099 50  0001 C CNN
F 2 "Custom_Libraries:GN27120BN" H 5159 3024 50  0001 L CIN
F 3 "http://www.micropik.com/PDF/BT136-600.pdf" H 4959 3099 50  0001 L CNN
	1    4959 3099
	-1   0    0    1   
$EndComp
$Comp
L Device:R R7
U 1 1 5F787825
P 5259 2998
F 0 "R7" V 5332 2949 50  0000 L CNN
F 1 "470E" H 5329 2953 50  0001 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5189 2998 50  0001 C CNN
F 3 "~" H 5259 2998 50  0001 C CNN
	1    5259 2998
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5409 2998 5483 2998
Wire Wire Line
	4959 3249 5481 3249
Wire Wire Line
	5481 3249 5483 3198
Text Label 4864 2949 2    50   ~ 0
Out1
Wire Wire Line
	4959 2949 4864 2949
Wire Wire Line
	5109 2999 5109 2998
Text Notes 6821 1996 0    59   Italic 0
Zero-Crossing
Text Notes 2069 3700 0    59   Italic 0
Input / Output Header
$Comp
L Connector:Screw_Terminal_01x02 J5
U 1 1 5F97D0BF
P 5453 4660
F 0 "J5" H 5456 4347 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 5371 4326 50  0001 C CNN
F 2 "TerminalBlocks_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 5453 4660 50  0001 C CNN
F 3 "~" H 5453 4660 50  0001 C CNN
	1    5453 4660
	-1   0    0    1   
$EndComp
Text Label 5839 4660 2    50   ~ 0
Out1
Wire Wire Line
	5653 4660 5839 4660
Text Notes 5390 4881 0    59   Italic 0
Device
$Comp
L Device:C_Small C7
U 1 1 5FB031C3
P 9984 3055
F 0 "C7" H 9892 3055 50  0000 R CNN
F 1 "2.2uf" V 9846 3055 50  0001 C CNN
F 2 "Capacitors_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 9984 3055 50  0001 C CNN
F 3 "~" H 9984 3055 50  0001 C CNN
	1    9984 3055
	-1   0    0    1   
$EndComp
Wire Wire Line
	9983 2791 9984 2955
Connection ~ 9983 2791
Wire Wire Line
	9683 3191 9984 3191
Wire Wire Line
	9984 3191 9984 3155
Connection ~ 9683 3191
Text Label 6193 4560 2    50   ~ 0
Mains_Neutral
Wire Wire Line
	5653 4560 6193 4560
$Comp
L RAC20-05SK_277:RAC20-05SK_277 PS1
U 1 1 60F8ACFB
P 9850 1165
F 0 "PS1" H 9850 1632 50  0000 C CNN
F 1 "HLK-PM01" H 9850 1541 50  0000 C CNN
F 2 "Custom_Libraries:277" H 9850 865 50  0001 C CNN
F 3 "http://www.hlktech.net/product_detail.php?ProId=54" H 10250 815 50  0001 C CNN
	1    9850 1165
	1    0    0    -1  
$EndComp
Wire Wire Line
	1316 824  792  823 
Text Label 792  823  0    50   ~ 0
Mains_Live_In
Wire Wire Line
	1316 724  713  724 
Text Label 713  724  0    50   ~ 0
Mains_Neutral
Wire Wire Line
	9150 965  8626 964 
Text Label 8626 964  0    50   ~ 0
Mains_Live_Out
Wire Wire Line
	9150 1365 8547 1365
Text Label 8547 1365 0    50   ~ 0
Mains_Neutral
Text Label 10550 965  0    50   ~ 0
5V
Text Label 10550 1365 0    50   ~ 0
GND
Text Label 6468 3198 0    50   ~ 0
3.3V
$Comp
L Connector:Conn_01x06_Female J3
U 1 1 6111B526
P 2715 3159
F 0 "J3" H 2743 3089 50  0000 L CNN
F 1 "Conn_01x06_Female" H 2743 3044 50  0001 L CNN
F 2 "Pin_Headers:PinHeader_1x06_P2.54mm_Vertical" H 2715 3159 50  0001 C CNN
F 3 "~" H 2715 3159 50  0001 C CNN
	1    2715 3159
	1    0    0    -1  
$EndComp
Text Label 5480 3249 3    50   ~ 0
Mains_Live_Out
$Comp
L Device:R R3
U 1 1 614E1714
P 3605 2072
F 0 "R3" V 3678 2023 50  0000 L CNN
F 1 "5K" H 3675 2027 50  0001 L CNN
F 2 "Resistors_SMD:R_0805_2012Metric" V 3535 2072 50  0001 C CNN
F 3 "~" H 3605 2072 50  0001 C CNN
	1    3605 2072
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R4
U 1 1 614E2D98
P 4052 2065
F 0 "R4" V 4125 2016 50  0000 L CNN
F 1 "5K" H 4122 2020 50  0001 L CNN
F 2 "Resistors_SMD:R_0805_2012Metric" V 3982 2065 50  0001 C CNN
F 3 "~" H 4052 2065 50  0001 C CNN
	1    4052 2065
	0    -1   -1   0   
$EndComp
Text Label 4202 2065 0    50   ~ 0
Energy_frmSensor
Wire Wire Line
	3755 2072 3902 2072
Wire Wire Line
	3902 2072 3902 2065
Text Label 3455 2072 2    50   ~ 0
GND
Text Label 3816 2072 3    50   ~ 0
Energy_toStm
$Comp
L ACS712_20:ACS712-20 U2
U 1 1 6194FE73
P 1769 1636
F 0 "U2" H 1769 2203 50  0000 C CNN
F 1 "ACS712-20" H 1769 2112 50  0000 C CNN
F 2 "Custom_Libraries:ACS712_20" H 1769 1636 50  0001 L BNN
F 3 "" H 1769 1636 50  0001 L BNN
F 4 "Allegro microsystems" H 1769 1636 50  0001 L BNN "MANUFACTURER"
F 5 "IPC-7351B" H 1769 1636 50  0001 L BNN "STANDARD"
F 6 "1.75mm" H 1769 1636 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 7 "19" H 1769 1636 50  0001 L BNN "PARTREV"
	1    1769 1636
	1    0    0    -1  
$EndComp
Wire Wire Line
	1169 1436 653  1436
Wire Wire Line
	2369 1536 3035 1535
Text Label 3035 1535 2    50   ~ 0
Energy_frmSensor
Wire Wire Line
	2369 1336 2486 1336
Wire Wire Line
	2369 1936 2544 1936
$Comp
L Device:C_Small C2
U 1 1 61970715
P 2369 1836
F 0 "C2" H 2277 1836 50  0000 R CNN
F 1 "1nf" V 2231 1836 50  0001 C CNN
F 2 "Capacitors_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 2369 1836 50  0001 C CNN
F 3 "~" H 2369 1836 50  0001 C CNN
	1    2369 1836
	-1   0    0    1   
$EndComp
Connection ~ 2369 1936
$Comp
L Device:C_Small C1
U 1 1 6197312A
P 2369 1236
F 0 "C1" H 2277 1236 50  0000 R CNN
F 1 "100nf" V 2231 1236 50  0001 C CNN
F 2 "Capacitors_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 2369 1236 50  0001 C CNN
F 3 "~" H 2369 1236 50  0001 C CNN
	1    2369 1236
	-1   0    0    1   
$EndComp
Connection ~ 2369 1336
Text Label 2369 1136 2    50   ~ 0
GND
$EndSCHEMATC