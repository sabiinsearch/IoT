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
$Comp
L transformer:F12-090 T1
U 1 1 5F54CADA
P 8491 1456
F 0 "T1" H 8491 933 50  0000 C CNN
F 1 "F12-090" H 8491 933 50  0001 C CNN
F 2 "Custom_Libraries:Transformer" H 8491 1456 50  0001 L BNN
F 3 "Manufacturer Recommendations" H 8491 1456 50  0001 L BNN
F 4 "Triad Magnetics" H 8491 1456 50  0001 L BNN "Field4"
	1    8491 1456
	-1   0    0    1   
$EndComp
$Comp
L Device:D D4
U 1 1 5F54E60B
P 7427 1245
F 0 "D4" V 7427 1325 50  0000 L CNN
F 1 "FR107" V 7472 1325 50  0001 L CNN
F 2 "Diodes_SMD:D_0805" H 7427 1245 50  0001 C CNN
F 3 "~" H 7427 1245 50  0001 C CNN
	1    7427 1245
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5F54F368
P 6740 1205
F 0 "R6" H 6810 1205 50  0000 L CNN
F 1 "100K" H 6810 1160 50  0001 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6670 1205 50  0001 C CNN
F 3 "~" H 6740 1205 50  0001 C CNN
	1    6740 1205
	1    0    0    -1  
$EndComp
Wire Wire Line
	8191 1056 7000 1055
Wire Wire Line
	7000 1055 6740 1055
Wire Wire Line
	6740 1355 6740 1588
Wire Wire Line
	6740 1588 7659 1588
Wire Wire Line
	7659 1095 7427 1095
Wire Wire Line
	7659 1095 7659 1588
Wire Wire Line
	8191 1356 7468 1356
Wire Wire Line
	7468 1356 7468 1394
Wire Wire Line
	7468 1394 7427 1395
$Comp
L Device:C_Small C5
U 1 1 5F55F5FD
P 6840 1803
F 0 "C5" V 6703 1803 50  0000 C CNN
F 1 "2A222J / 2.2nF" V 6702 1803 50  0001 C CNN
F 2 "Capacitors_THT:C_Axial_L3.8mm_D2.6mm_P7.50mm_Horizontal" H 6840 1803 50  0001 C CNN
F 3 "~" H 6840 1803 50  0001 C CNN
	1    6840 1803
	0    1    1    0   
$EndComp
Wire Wire Line
	6740 1588 6740 1803
Connection ~ 6740 1588
Wire Wire Line
	6940 1803 7119 1803
Wire Wire Line
	7119 1803 7117 1055
Connection ~ 7117 1055
$Comp
L capacitor_electolytic:ECA-1EM102 C4
U 1 1 5F567865
P 6987 2312
F 0 "C4" H 6987 2487 50  0000 C CNN
F 1 "4.7uF/400V" H 6987 2488 50  0001 C CNN
F 2 "Capacitors_THT:CP_Radial_D4.0mm_P2.00mm" H 6987 2312 50  0001 L BNN
F 3 "PANASONIC" H 6987 2312 50  0001 L BNN
	1    6987 2312
	1    0    0    -1  
$EndComp
$Comp
L Device:D D12
U 1 1 5F569D72
P 7052 2649
F 0 "D12" H 7051 2740 50  0000 C CNN
F 1 "IN4007" V 7097 2729 50  0001 L CNN
F 2 "Diodes_SMD:D_0805" H 7052 2649 50  0001 C CNN
F 3 "~" H 7052 2649 50  0001 C CNN
	1    7052 2649
	1    0    0    -1  
$EndComp
Wire Wire Line
	7202 2312 7202 2649
$Comp
L Device:D D11
U 1 1 5F56BC49
P 7052 2866
F 0 "D11" H 7053 2794 50  0000 C CNN
F 1 "IN4007" V 7097 2946 50  0001 L CNN
F 2 "Diodes_SMD:D_0805" H 7052 2866 50  0001 C CNN
F 3 "~" H 7052 2866 50  0001 C CNN
	1    7052 2866
	-1   0    0    1   
$EndComp
Wire Wire Line
	6902 2866 6902 2649
$Comp
L Device:D D6
U 1 1 5F56F65A
P 7052 3101
F 0 "D6" H 7053 3029 50  0000 C CNN
F 1 "IN4007" V 7097 3181 50  0001 L CNN
F 2 "Diodes_SMD:D_0805" H 7052 3101 50  0001 C CNN
F 3 "~" H 7052 3101 50  0001 C CNN
	1    7052 3101
	-1   0    0    1   
$EndComp
Wire Wire Line
	7202 2866 7202 2981
Wire Wire Line
	6772 2312 6774 2981
Wire Wire Line
	6774 2981 7202 2981
Connection ~ 7202 2981
Wire Wire Line
	7202 2981 7202 3101
Wire Wire Line
	6772 2312 6772 2000
Wire Wire Line
	6772 2000 7121 2000
Wire Wire Line
	7121 2000 7119 1803
Connection ~ 6772 2312
Connection ~ 7119 1803
$Comp
L Device:D D5
U 1 1 5F575102
P 7052 3309
F 0 "D5" H 7053 3237 50  0000 C CNN
F 1 "IN4007" V 7097 3389 50  0001 L CNN
F 2 "Diodes_SMD:D_0805" H 7052 3309 50  0001 C CNN
F 3 "~" H 7052 3309 50  0001 C CNN
	1    7052 3309
	1    0    0    -1  
$EndComp
Wire Wire Line
	6902 3309 6902 3101
Wire Wire Line
	8352 2611 7852 2610
Wire Wire Line
	7852 2610 7852 1995
Wire Wire Line
	7852 1995 7442 1994
Wire Wire Line
	7442 1994 7441 1395
Connection ~ 7441 1395
Connection ~ 6902 2649
$Comp
L Device:Thermistor_NTC TH1
U 1 1 5F58AD84
P 6950 3748
F 0 "TH1" V 7046 3767 50  0000 C CNN
F 1 "NTC" V 6751 3748 50  0001 C CNN
F 2 "Varistors:RV_Disc_D7_W3.4_P5" H 6950 3798 50  0001 C CNN
F 3 "~" H 6950 3798 50  0001 C CNN
	1    6950 3748
	0    1    1    0   
$EndComp
Wire Wire Line
	6902 3309 6902 3567
Wire Wire Line
	6902 3567 7100 3567
Wire Wire Line
	7100 3567 7100 3748
Connection ~ 6902 3309
Wire Wire Line
	8352 2611 8452 2611
$Comp
L ap8022:AP8022 J1
U 1 1 5F578FE3
P 8557 3031
F 0 "J1" V 8557 2701 50  0000 R CNN
F 1 "AP8022" H 8557 3307 50  0001 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_SMDSocket_SmallPads" H 8557 3031 50  0001 L BNN
F 3 "Compliant with Exemptions" H 8557 3031 50  0001 L BNN
F 4 "1571552-2" H 8557 3031 50  0001 L BNN "Field4"
	1    8557 3031
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8452 2611 8557 2611
Connection ~ 8452 2611
Wire Wire Line
	8557 2611 8657 2611
Connection ~ 8557 2611
Wire Wire Line
	8657 2611 8757 2611
Connection ~ 8657 2611
$Comp
L Device:D D7
U 1 1 5F5980A8
P 9755 2194
F 0 "D7" V 9755 2114 50  0000 R CNN
F 1 "IN4148" V 9800 2274 50  0001 L CNN
F 2 "Diodes_SMD:D_0805" H 9755 2194 50  0001 C CNN
F 3 "~" H 9755 2194 50  0001 C CNN
	1    9755 2194
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8191 1556 7950 1556
Wire Wire Line
	7950 1556 7949 2043
Wire Wire Line
	7949 2043 9343 2044
Wire Wire Line
	8757 3451 9362 3452
Wire Wire Line
	9362 3452 9362 2344
Wire Wire Line
	9343 2044 9755 2044
Wire Wire Line
	9362 2344 9755 2344
$Comp
L Device:C_Small C8
U 1 1 5F5A69FF
P 9152 2926
F 0 "C8" H 9060 2926 50  0000 R CNN
F 1 "2A222J / 2.2nF" V 9014 2926 50  0001 C CNN
F 2 "Capacitors_THT:C_Axial_L3.8mm_D2.6mm_P7.50mm_Horizontal" H 9152 2926 50  0001 C CNN
F 3 "~" H 9152 2926 50  0001 C CNN
	1    9152 2926
	-1   0    0    1   
$EndComp
Wire Wire Line
	8191 1856 8191 2396
Wire Wire Line
	8191 2396 8956 2396
Wire Wire Line
	8956 2396 8957 3571
Wire Wire Line
	8957 3571 8958 3571
Wire Wire Line
	9152 3571 9152 3026
Wire Wire Line
	8958 3571 8093 3572
Wire Wire Line
	8093 3572 8092 2661
Wire Wire Line
	8092 2661 7202 2661
Wire Wire Line
	7202 2661 7202 2649
Connection ~ 8958 3571
Wire Wire Line
	8958 3571 9152 3571
Connection ~ 7202 2649
Wire Wire Line
	8557 3451 8457 3451
Wire Wire Line
	8457 3451 8093 3451
Connection ~ 8457 3451
Connection ~ 8093 3451
Wire Wire Line
	7202 3309 7518 3309
Connection ~ 8093 3309
$Comp
L Device:C_Small C3
U 1 1 5F5B4585
P 7801 4173
F 0 "C3" H 7709 4173 50  0000 R CNN
F 1 "47nf" V 7663 4173 50  0001 C CNN
F 2 "Capacitors_THT:C_Axial_L3.8mm_D2.6mm_P7.50mm_Horizontal" H 7801 4173 50  0001 C CNN
F 3 "~" H 7801 4173 50  0001 C CNN
	1    7801 4173
	-1   0    0    1   
$EndComp
$Comp
L capacitor_electolytic:ECA-1EM102 C2
U 1 1 5F5B5CCA
P 8541 4273
F 0 "C2" H 8543 4133 50  0000 C CNN
F 1 "1uF/63V" H 8541 4449 50  0001 C CNN
F 2 "Capacitors_THT:CP_Radial_D4.0mm_P2.00mm" H 8541 4273 50  0001 L BNN
F 3 "PANASONIC" H 8541 4273 50  0001 L BNN
	1    8541 4273
	-1   0    0    1   
$EndComp
Wire Wire Line
	8757 3451 8756 4273
Connection ~ 8757 3451
Wire Wire Line
	8326 4273 7801 4273
Wire Wire Line
	8652 3451 8651 4064
Wire Wire Line
	8651 4064 7801 4064
$Comp
L Isolator:EL817 U1
U 1 1 5F5E0DB6
P 9657 4119
F 0 "U1" H 9657 3802 50  0000 C CNN
F 1 "EL817" H 9657 3893 50  0000 C CNN
F 2 "Housings_DIP:DIP-4_W8.89mm_SMDSocket_LongPads" H 9457 3919 50  0001 L CIN
F 3 "http://www.everlight.com/file/ProductFile/EL817.pdf" H 9657 4119 50  0001 L CNN
	1    9657 4119
	-1   0    0    1   
$EndComp
Wire Wire Line
	9152 2826 9150 1653
Wire Wire Line
	9150 1653 8791 1656
$Comp
L capacitor_electolytic:ECA-1EM102 C1
U 1 1 5F5ECD43
P 9891 1258
F 0 "C1" H 9891 1433 50  0000 C CNN
F 1 "4.7uF/400V" H 9891 1434 50  0001 C CNN
F 2 "Capacitors_THT:CP_Radial_D4.0mm_P2.00mm" H 9891 1258 50  0001 L BNN
F 3 "PANASONIC" H 9891 1258 50  0001 L BNN
F 4 "C" H 9891 1258 50  0001 C CNN "Spice_Primitive"
F 5 "4.7uF/400V" H 9891 1258 50  0001 C CNN "Spice_Model"
F 6 "Y" H 9891 1258 50  0001 C CNN "Spice_Netlist_Enabled"
	1    9891 1258
	-1   0    0    1   
$EndComp
Wire Wire Line
	9676 1258 9149 1258
Wire Wire Line
	9149 1258 9150 1653
Connection ~ 9150 1653
$Comp
L Device:D D3
U 1 1 5F5F1EAB
P 8941 867
F 0 "D3" H 9003 778 50  0000 R CNN
F 1 "SR360" V 8986 947 50  0001 L CNN
F 2 "Diodes_SMD:D_0805" H 8941 867 50  0001 C CNN
F 3 "~" H 8941 867 50  0001 C CNN
	1    8941 867 
	-1   0    0    1   
$EndComp
Wire Wire Line
	8791 1256 8791 867 
Wire Wire Line
	9091 867  10105 867 
$Comp
L Device:R R3
U 1 1 5F5FA846
P 10255 867
F 0 "R3" V 10158 814 50  0000 L CNN
F 1 "2.2K" H 10325 822 50  0001 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 10185 867 50  0001 C CNN
F 3 "~" H 10255 867 50  0001 C CNN
	1    10255 867 
	0    1    1    0   
$EndComp
Connection ~ 10105 867 
$Comp
L Device:LED D1
U 1 1 5F600974
P 10405 717
F 0 "D1" V 10403 636 50  0001 R CNN
F 1 "LED1" V 10394 935 50  0000 R CNN
F 2 "Diodes_SMD:D_0805" H 10405 717 50  0001 C CNN
F 3 "~" H 10405 717 50  0001 C CNN
	1    10405 717 
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5F6041C9
P 10304 3448
F 0 "R4" H 10145 3437 50  0000 L CNN
F 1 "330 R" H 10374 3403 50  0001 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 10234 3448 50  0001 C CNN
F 3 "~" H 10304 3448 50  0001 C CNN
	1    10304 3448
	-1   0    0    1   
$EndComp
Wire Wire Line
	10105 867  10105 1258
Wire Wire Line
	9957 4219 10304 4217
Wire Wire Line
	10304 4217 10304 3598
Wire Wire Line
	10303 1258 10300 1259
Wire Wire Line
	10300 1259 10300 1258
Wire Wire Line
	10718 567  10718 868 
Wire Wire Line
	10718 868  10723 868 
Wire Wire Line
	10718 567  10404 566 
Wire Wire Line
	10404 566  10405 566 
Wire Wire Line
	10405 566  10405 567 
Connection ~ 10405 566 
Connection ~ 10718 567 
Text Label 11064 567  2    50   ~ 0
GND
Wire Wire Line
	10718 567  11064 567 
$Comp
L Device:R R5
U 1 1 5F6385CB
P 9958 3402
F 0 "R5" H 9799 3391 50  0000 L CNN
F 1 "330 R" H 10028 3357 50  0001 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 9888 3402 50  0001 C CNN
F 3 "~" H 9958 3402 50  0001 C CNN
	1    9958 3402
	-1   0    0    1   
$EndComp
Wire Wire Line
	9957 4019 9958 3552
Wire Wire Line
	9958 3252 9958 2662
Wire Wire Line
	7518 3309 7519 4275
Wire Wire Line
	7519 4275 7801 4275
Wire Wire Line
	7801 4273 7801 4275
Connection ~ 7518 3309
Wire Wire Line
	7518 3309 8093 3309
Connection ~ 7801 4273
Text Label 6126 2649 0    50   ~ 0
Mains_Neutral
Wire Wire Line
	6126 2649 6902 2649
Text Label 6049 3747 0    50   ~ 0
Mains_Live_Out
Wire Wire Line
	10304 3298 10303 1258
Wire Wire Line
	9955 2662 9958 2662
Wire Wire Line
	6800 3748 6049 3747
Wire Wire Line
	9357 4019 7801 4020
Wire Wire Line
	7801 4020 7801 4064
Connection ~ 7801 4064
Wire Wire Line
	7801 4064 7801 4073
Wire Wire Line
	9357 4219 9357 4273
Wire Wire Line
	9357 4273 8756 4273
Connection ~ 8756 4273
Wire Wire Line
	10723 868  10723 1222
$Comp
L capacitor_electolytic:ECA-1EM102 C6
U 1 1 5F61A471
P 10723 1437
F 0 "C6" V 10723 1612 50  0000 C CNN
F 1 "470uF/10V" H 10723 1613 50  0001 C CNN
F 2 "Capacitors_THT:CP_Radial_D4.0mm_P2.00mm" H 10723 1437 50  0001 L BNN
F 3 "PANASONIC" H 10723 1437 50  0001 L BNN
	1    10723 1437
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10105 1258 10106 1258
Wire Wire Line
	10723 1652 10120 1651
Wire Wire Line
	10120 1651 10120 1266
Wire Wire Line
	10120 1266 10106 1266
Wire Wire Line
	10106 1266 10106 1258
Connection ~ 10106 1258
Wire Wire Line
	10106 1258 10300 1258
Text Label 10849 1652 2    50   ~ 0
5V
Wire Wire Line
	10723 1652 10849 1652
Connection ~ 10723 1652
$Comp
L Device:D D8
U 1 1 5F636A56
P 9805 2662
F 0 "D8" H 9856 2558 50  0000 R CNN
F 1 "PH C4V3" V 9850 2742 50  0001 L CNN
F 2 "Diodes_SMD:D_0805" H 9805 2662 50  0001 C CNN
F 3 "~" H 9805 2662 50  0001 C CNN
	1    9805 2662
	-1   0    0    1   
$EndComp
Wire Wire Line
	9152 2826 9651 2826
Wire Wire Line
	9651 2826 9651 2662
Wire Wire Line
	9651 2662 9655 2662
Connection ~ 9152 2826
Wire Notes Line
	5710 448  5724 4486
Wire Notes Line
	5724 4486 11219 4495
$Comp
L acs712:ACS712 U2
U 1 1 5F6511EC
P 4087 2360
F 0 "U2" H 4100 2489 31  0000 C CNN
F 1 "ACS712" H 4100 2489 31  0001 C CNN
F 2 "Custom_Libraries:ACS712" H 4087 2360 50  0001 C CNN
F 3 "" H 4087 2360 50  0001 C CNN
	1    4087 2360
	1    0    0    -1  
$EndComp
Text Label 3293 2323 0    50   ~ 0
Mains_Live_Out
Wire Wire Line
	3896 2323 3293 2323
$Comp
L Device:Fuse_Small F1
U 1 1 5F656F09
P 3707 2401
F 0 "F1" H 3713 2346 50  0000 C CNN
F 1 "Fuse_Small" H 3707 2495 50  0001 C CNN
F 2 "Fuse_Holders_and_Fuses:Fuse_TE5_Littlefuse-395Series" H 3707 2401 50  0001 C CNN
F 3 "~" H 3707 2401 50  0001 C CNN
	1    3707 2401
	1    0    0    -1  
$EndComp
Wire Wire Line
	3807 2401 3897 2401
Text Label 3083 2400 0    50   ~ 0
Mains_Live_In
Wire Wire Line
	3607 2401 3083 2400
Text Label 4423 2317 2    50   ~ 0
5V
Wire Wire Line
	4302 2317 4423 2317
Text Label 4381 2412 3    50   ~ 0
GND
Wire Wire Line
	4304 2412 4381 2412
Text Label 4969 2363 2    50   ~ 0
Energy_Sensor
Wire Wire Line
	4303 2364 4969 2363
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 5F66980C
P 1516 724
F 0 "J2" H 1596 670 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 1596 625 50  0001 L CNN
F 2 "TerminalBlocks_Phoenix:TerminalBlock_Phoenix_MKDS1.5-2pol" H 1516 724 50  0001 C CNN
F 3 "~" H 1516 724 50  0001 C CNN
	1    1516 724 
	1    0    0    -1  
$EndComp
Text Label 713  724  0    50   ~ 0
Mains_Neutral
Wire Wire Line
	1316 724  713  724 
Text Label 792  823  0    50   ~ 0
Mains_Live_In
Wire Wire Line
	1316 824  792  823 
Text Notes 1375 996  0    59   Italic 0
Mains
Text Notes 3778 2712 0    59   Italic 0
Current Sensor
$Comp
L Regulator_Linear:AP2112K-3.3 U4
U 1 1 5F678A39
P 9399 5379
F 0 "U4" H 9399 5721 50  0000 C CNN
F 1 "AP2112K-3.3" H 9399 5630 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5_HandSoldering" H 9399 5704 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/AP2112.pdf" H 9399 5479 50  0001 C CNN
	1    9399 5379
	1    0    0    -1  
$EndComp
Text Label 8937 5279 2    50   ~ 0
5V
Wire Wire Line
	9099 5379 9099 5279
Wire Wire Line
	9099 5279 8937 5279
Connection ~ 9099 5279
Text Label 9399 5777 2    50   ~ 0
GND
Wire Wire Line
	9699 5279 9883 5279
Wire Wire Line
	9399 5679 9399 5777
Text Label 9883 5279 2    50   ~ 0
3.3V
$Comp
L Isolator:4N35 U3
U 1 1 5F6907F0
P 4518 769
F 0 "U3" H 4518 1002 50  0000 C CNN
F 1 "4N35" H 4518 1003 50  0001 C CNN
F 2 "Housings_DIP:DIP-6_W8.89mm_SMDSocket_LongPads" H 4318 569 50  0001 L CIN
F 3 "https://www.vishay.com/docs/81181/4n35.pdf" H 4518 769 50  0001 L CNN
	1    4518 769 
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener D2
U 1 1 5F6922E0
P 3795 819
F 0 "D2" V 3795 899 50  0000 L CNN
F 1 "IN4148" V 3840 899 50  0001 L CNN
F 2 "Diodes_SMD:D_0805" H 3795 819 50  0001 C CNN
F 3 "~" H 3795 819 50  0001 C CNN
	1    3795 819 
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 5F6968FD
P 3795 1119
F 0 "R1" H 3865 1119 50  0000 L CNN
F 1 "220K" H 3865 1074 50  0001 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3725 1119 50  0001 C CNN
F 3 "~" H 3795 1119 50  0001 C CNN
	1    3795 1119
	1    0    0    -1  
$EndComp
Text Label 3192 1269 0    50   ~ 0
Mains_Neutral
Wire Wire Line
	3795 1269 3192 1269
Text Label 3271 668  0    50   ~ 0
Mains_Live_In
Wire Wire Line
	3795 669  3271 668 
Wire Wire Line
	4218 669  3795 669 
Wire Wire Line
	4218 869  4217 944 
Wire Wire Line
	4217 944  3805 944 
Wire Wire Line
	3805 944  3805 969 
Wire Wire Line
	3805 969  3795 969 
Connection ~ 3795 969 
Connection ~ 3795 669 
Text Label 4818 956  3    50   ~ 0
GND
Wire Wire Line
	4818 869  4818 956 
Text Label 5119 769  2    50   ~ 0
Opto_In
Wire Wire Line
	4818 769  5119 769 
NoConn ~ 4818 669 
Wire Wire Line
	1118 2588 1337 2588
$Comp
L Connector:Conn_01x09_Female J3
U 1 1 5F6EACCF
P 1537 2188
F 0 "J3" H 1565 2168 50  0000 L CNN
F 1 "Conn_01x09_Female" H 1565 2123 50  0001 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x09_Pitch2.54mm" H 1537 2188 50  0001 C CNN
F 3 "~" H 1537 2188 50  0001 C CNN
	1    1537 2188
	1    0    0    -1  
$EndComp
Text Label 1118 2588 0    50   ~ 0
GND
Text Label 1120 2488 0    50   ~ 0
5V
Wire Wire Line
	1337 2488 1120 2488
Text Label 1118 2388 0    50   ~ 0
3.3V
Wire Wire Line
	1337 2388 1118 2388
Text Label 1045 2288 0    50   ~ 0
Opto_In
Wire Wire Line
	1337 2288 1045 2288
Text Label 786  2188 0    50   ~ 0
Energy_Sensor
Wire Wire Line
	1337 2188 786  2188
Text Label 1119 1788 0    50   ~ 0
DSW1
Wire Wire Line
	1337 1788 1119 1788
Text Label 1121 1888 0    50   ~ 0
DSW2
Wire Wire Line
	1337 1888 1121 1888
Text Label 1126 1988 0    50   ~ 0
DSW3
Wire Wire Line
	1337 1988 1126 1988
Text Label 1128 2089 0    50   ~ 0
DSW4
Wire Wire Line
	1337 2088 1128 2089
$Comp
L Relay_SolidState:MOC3021M U5
U 1 1 5F759D7C
P 1222 5418
F 0 "U5" V 1225 5212 50  0000 C CNN
F 1 "MOC3021" H 1222 5652 50  0001 C CNN
F 2 "Housings_DIP:DIP-6_W8.89mm_SMDSocket_LongPads" H 1022 5218 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/MO/MOC3020M.pdf" H 1222 5418 50  0001 L CNN
	1    1222 5418
	0    -1   -1   0   
$EndComp
Text Label 1122 6103 2    50   ~ 0
3.3V
$Comp
L Device:R R2
U 1 1 5F76C623
P 1122 5900
F 0 "R2" H 992 5888 50  0000 L CNN
F 1 "100E" H 1192 5855 50  0001 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1052 5900 50  0001 C CNN
F 3 "~" H 1122 5900 50  0001 C CNN
	1    1122 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1122 5718 1122 5750
Wire Wire Line
	1122 6050 1122 6103
Text Label 1322 5941 1    50   ~ 0
DSW1
Wire Wire Line
	1322 5718 1322 5941
$Comp
L Triac_Thyristor:BT136-500 Q1
U 1 1 5F77F666
P 1221 4594
F 0 "Q1" V 1396 4594 50  0000 C CNN
F 1 "BT136-500" V 1396 4594 50  0001 C CNN
F 2 "Custom_Libraries:BT136S" H 1421 4519 50  0001 L CIN
F 3 "http://www.micropik.com/PDF/BT136-600.pdf" H 1221 4594 50  0001 L CNN
	1    1221 4594
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R7
U 1 1 5F787825
P 1322 4894
F 0 "R7" H 1392 4894 50  0000 L CNN
F 1 "470E" H 1392 4849 50  0001 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1252 4894 50  0001 C CNN
F 3 "~" H 1322 4894 50  0001 C CNN
	1    1322 4894
	1    0    0    -1  
$EndComp
Wire Wire Line
	1322 5044 1322 5118
Wire Wire Line
	1071 4594 1071 5116
Wire Wire Line
	1071 5116 1122 5118
Text Label 1371 4499 1    50   ~ 0
Out1
Wire Wire Line
	1371 4594 1371 4499
Wire Wire Line
	1321 4744 1322 4744
$Comp
L Relay_SolidState:MOC3021M U6
U 1 1 5F7A80F7
P 2183 5453
F 0 "U6" V 2186 5247 50  0000 C CNN
F 1 "MOC3021" H 2183 5687 50  0001 C CNN
F 2 "Housings_DIP:DIP-6_W8.89mm_SMDSocket_LongPads" H 1983 5253 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/MO/MOC3020M.pdf" H 2183 5453 50  0001 L CNN
	1    2183 5453
	0    -1   -1   0   
$EndComp
Text Label 2083 6138 2    50   ~ 0
3.3V
$Comp
L Device:R R8
U 1 1 5F7A8102
P 2083 5935
F 0 "R8" H 1953 5923 50  0000 L CNN
F 1 "100E" H 2153 5890 50  0001 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2013 5935 50  0001 C CNN
F 3 "~" H 2083 5935 50  0001 C CNN
	1    2083 5935
	1    0    0    -1  
$EndComp
Wire Wire Line
	2083 5753 2083 5785
Wire Wire Line
	2083 6085 2083 6138
Text Label 2283 5976 1    50   ~ 0
DSW2
Wire Wire Line
	2283 5753 2283 5976
$Comp
L Triac_Thyristor:BT136-500 Q2
U 1 1 5F7A8110
P 2182 4629
F 0 "Q2" V 2357 4629 50  0000 C CNN
F 1 "BT136-500" V 2357 4629 50  0001 C CNN
F 2 "Custom_Libraries:BT136S" H 2382 4554 50  0001 L CIN
F 3 "http://www.micropik.com/PDF/BT136-600.pdf" H 2182 4629 50  0001 L CNN
	1    2182 4629
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R9
U 1 1 5F7A811A
P 2283 4929
F 0 "R9" H 2353 4929 50  0000 L CNN
F 1 "470E" H 2353 4884 50  0001 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2213 4929 50  0001 C CNN
F 3 "~" H 2283 4929 50  0001 C CNN
	1    2283 4929
	1    0    0    -1  
$EndComp
Wire Wire Line
	2283 5079 2283 5153
Wire Wire Line
	2032 4629 2032 5151
Wire Wire Line
	2032 5151 2083 5153
Text Label 2332 4534 1    50   ~ 0
Out2
Wire Wire Line
	2332 4629 2332 4534
Wire Wire Line
	2282 4779 2283 4779
$Comp
L Relay_SolidState:MOC3021M U7
U 1 1 5F7B44C1
P 3039 5446
F 0 "U7" V 3042 5240 50  0000 C CNN
F 1 "MOC3021" H 3039 5680 50  0001 C CNN
F 2 "Housings_DIP:DIP-6_W8.89mm_SMDSocket_LongPads" H 2839 5246 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/MO/MOC3020M.pdf" H 3039 5446 50  0001 L CNN
	1    3039 5446
	0    -1   -1   0   
$EndComp
Text Label 2939 6131 2    50   ~ 0
3.3V
$Comp
L Device:R R10
U 1 1 5F7B44CC
P 2939 5928
F 0 "R10" H 2809 5916 50  0000 L CNN
F 1 "100E" H 3009 5883 50  0001 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2869 5928 50  0001 C CNN
F 3 "~" H 2939 5928 50  0001 C CNN
	1    2939 5928
	1    0    0    -1  
$EndComp
Wire Wire Line
	2939 5746 2939 5778
Wire Wire Line
	2939 6078 2939 6131
Text Label 3139 5969 1    50   ~ 0
DSW3
Wire Wire Line
	3139 5746 3139 5969
$Comp
L Triac_Thyristor:BT136-500 Q3
U 1 1 5F7B44DA
P 3038 4622
F 0 "Q3" V 3213 4622 50  0000 C CNN
F 1 "BT136-500" V 3213 4622 50  0001 C CNN
F 2 "Custom_Libraries:BT136S" H 3238 4547 50  0001 L CIN
F 3 "http://www.micropik.com/PDF/BT136-600.pdf" H 3038 4622 50  0001 L CNN
	1    3038 4622
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R11
U 1 1 5F7B44E4
P 3139 4922
F 0 "R11" H 3209 4922 50  0000 L CNN
F 1 "470E" H 3209 4877 50  0001 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3069 4922 50  0001 C CNN
F 3 "~" H 3139 4922 50  0001 C CNN
	1    3139 4922
	1    0    0    -1  
$EndComp
Wire Wire Line
	3139 5072 3139 5146
Wire Wire Line
	2888 4622 2888 5144
Wire Wire Line
	2888 5144 2939 5146
Text Label 3188 4527 1    50   ~ 0
Out3
Wire Wire Line
	3188 4622 3188 4527
Wire Wire Line
	3138 4772 3139 4772
$Comp
L Relay_SolidState:MOC3021M U8
U 1 1 5F7C08E7
P 3838 5467
F 0 "U8" V 3841 5261 50  0000 C CNN
F 1 "MOC3021" H 3838 5701 50  0001 C CNN
F 2 "Housings_DIP:DIP-6_W8.89mm_SMDSocket_LongPads" H 3638 5267 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/MO/MOC3020M.pdf" H 3838 5467 50  0001 L CNN
	1    3838 5467
	0    -1   -1   0   
$EndComp
Text Label 3738 6152 2    50   ~ 0
3.3V
$Comp
L Device:R R12
U 1 1 5F7C08F2
P 3738 5949
F 0 "R12" H 3608 5937 50  0000 L CNN
F 1 "100E" H 3808 5904 50  0001 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3668 5949 50  0001 C CNN
F 3 "~" H 3738 5949 50  0001 C CNN
	1    3738 5949
	1    0    0    -1  
$EndComp
Wire Wire Line
	3738 5767 3738 5799
Wire Wire Line
	3738 6099 3738 6152
Text Label 3938 5990 1    50   ~ 0
DSW4
Wire Wire Line
	3938 5767 3938 5990
$Comp
L Triac_Thyristor:BT136-500 Q4
U 1 1 5F7C0900
P 3837 4643
F 0 "Q4" V 4012 4643 50  0000 C CNN
F 1 "BT136-500" V 4012 4643 50  0001 C CNN
F 2 "Custom_Libraries:BT136S" H 4037 4568 50  0001 L CIN
F 3 "http://www.micropik.com/PDF/BT136-600.pdf" H 3837 4643 50  0001 L CNN
	1    3837 4643
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R13
U 1 1 5F7C090A
P 3938 4943
F 0 "R13" H 4008 4943 50  0000 L CNN
F 1 "470E" H 4008 4898 50  0001 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3868 4943 50  0001 C CNN
F 3 "~" H 3938 4943 50  0001 C CNN
	1    3938 4943
	1    0    0    -1  
$EndComp
Wire Wire Line
	3938 5093 3938 5167
Wire Wire Line
	3687 4643 3687 5165
Wire Wire Line
	3687 5165 3738 5167
Text Label 3987 4548 1    50   ~ 0
Out4
Wire Wire Line
	3987 4643 3987 4548
Wire Wire Line
	3937 4793 3938 4793
Text Notes 4226 1390 0    59   Italic 0
Zero-Crossing
Text Notes 891  2829 0    59   Italic 0
Input / Output Header
$Comp
L Connector:Screw_Terminal_01x02 J4
U 1 1 5F955AE6
P 6070 5500
F 0 "J4" H 6026 5634 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 6150 5401 50  0001 L CNN
F 2 "TerminalBlocks_Phoenix:TerminalBlock_Phoenix_MKDS1.5-2pol" H 6070 5500 50  0001 C CNN
F 3 "~" H 6070 5500 50  0001 C CNN
	1    6070 5500
	1    0    0    -1  
$EndComp
Text Label 5291 5500 0    50   ~ 0
Mains_Neutral
Wire Wire Line
	5870 5500 5870 5600
Wire Wire Line
	5870 5500 5291 5500
Connection ~ 5870 5500
$Comp
L Connector:Screw_Terminal_01x04 J5
U 1 1 5F97D0BF
P 6647 5494
F 0 "J5" H 6650 5181 50  0000 C CNN
F 1 "Screw_Terminal_01x04" H 6565 5160 50  0001 C CNN
F 2 "TerminalBlocks_Phoenix:TerminalBlock_Phoenix_MKDS1.5-4pol" H 6647 5494 50  0001 C CNN
F 3 "~" H 6647 5494 50  0001 C CNN
	1    6647 5494
	-1   0    0    1   
$EndComp
Text Label 7033 5294 2    50   ~ 0
Out4
Wire Wire Line
	6847 5294 7033 5294
Text Label 7033 5394 2    50   ~ 0
Out3
Wire Wire Line
	6847 5394 7033 5394
Text Label 7033 5494 2    50   ~ 0
Out2
Wire Wire Line
	6847 5494 7033 5494
Text Label 7033 5594 2    50   ~ 0
Out1
Wire Wire Line
	6847 5594 7033 5594
Text Notes 6608 5824 0    59   Italic 0
Devices
Text Notes 5388 5840 0    59   Italic 0
Neutral for Sockets
$Comp
L Device:C_Small C7
U 1 1 5FB031C3
P 9700 5543
F 0 "C7" H 9608 5543 50  0000 R CNN
F 1 "2.2uf" V 9562 5543 50  0001 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 9700 5543 50  0001 C CNN
F 3 "~" H 9700 5543 50  0001 C CNN
	1    9700 5543
	-1   0    0    1   
$EndComp
Wire Wire Line
	9699 5279 9700 5443
Connection ~ 9699 5279
Wire Wire Line
	9399 5679 9700 5679
Wire Wire Line
	9700 5679 9700 5643
Connection ~ 9399 5679
$EndSCHEMATC
