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
L stm32wb_Dev_v1-rescue:+5V-power #PWR01
U 1 1 5F2E4AB0
P 919 6969
F 0 "#PWR01" H 919 6819 50  0001 C CNN
F 1 "+5V" H 934 7142 50  0000 C CNN
F 2 "" H 919 6969 50  0001 C CNN
F 3 "" H 919 6969 50  0001 C CNN
	1    919  6969
	1    0    0    -1  
$EndComp
Wire Wire Line
	1167 6972 1167 7072
Wire Wire Line
	919  6969 1168 6972
Wire Wire Line
	1168 6972 1167 6972
Connection ~ 1167 6972
$Comp
L stm32wb_Dev_v1-rescue:+3V3-power #PWR03
U 1 1 5F2E929C
P 1855 6971
F 0 "#PWR03" H 1855 6821 50  0001 C CNN
F 1 "+3V3" H 1870 7144 50  0000 C CNN
F 2 "" H 1855 6971 50  0001 C CNN
F 3 "" H 1855 6971 50  0001 C CNN
	1    1855 6971
	1    0    0    -1  
$EndComp
Wire Wire Line
	1855 6971 1767 6972
$Comp
L stm32wb_Dev_v1-rescue:GND-power #PWR02
U 1 1 5F2EB74C
P 1473 7482
F 0 "#PWR02" H 1473 7232 50  0001 C CNN
F 1 "GND" H 1478 7309 50  0000 C CNN
F 2 "" H 1473 7482 50  0001 C CNN
F 3 "" H 1473 7482 50  0001 C CNN
	1    1473 7482
	1    0    0    -1  
$EndComp
Wire Wire Line
	1473 7373 1468 7372
Text Label 1662 7468 2    50   ~ 0
GND
Wire Wire Line
	1473 7482 1473 7468
Text Label 1944 6971 0    50   ~ 0
3V3
Wire Wire Line
	1944 6971 1855 6971
Connection ~ 1855 6971
$Comp
L Device:C C1
U 1 1 5F2F209A
P 919 7173
F 0 "C1" H 1034 7219 50  0000 L CNN
F 1 "100nf" H 1034 7128 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_2012Metric" H 957 7023 50  0001 C CNN
F 3 "~" H 919 7173 50  0001 C CNN
	1    919  7173
	1    0    0    -1  
$EndComp
Wire Wire Line
	919  7023 919  6969
Wire Wire Line
	919  7323 919  7373
Wire Wire Line
	919  7373 1167 7372
$Comp
L Device:C C4
U 1 1 5F2F48A0
P 1855 7221
F 0 "C4" H 1970 7267 50  0000 L CNN
F 1 "100nf" H 1970 7176 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_2012Metric" H 1893 7071 50  0001 C CNN
F 3 "~" H 1855 7221 50  0001 C CNN
	1    1855 7221
	1    0    0    -1  
$EndComp
Wire Wire Line
	1855 7071 1855 6971
Wire Wire Line
	1855 6971 1855 6970
Text Label 687  6970 0    50   ~ 0
5V
$Comp
L Connector:Conn_01x05_Female J2
U 1 1 5F2A8464
P 8915 941
F 0 "J2" H 8862 645 50  0000 C CNN
F 1 "Conn_01x05_Female" H 8864 1281 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 8915 941 50  0001 C CNN
F 3 "~" H 8915 941 50  0001 C CNN
	1    8915 941 
	-1   0    0    1   
$EndComp
Wire Notes Line
	7966 478  7966 3076
Wire Notes Line
	7966 3076 11217 3057
Wire Notes Line
	11217 3057 11214 3057
Text Notes 8756 1338 0    50   ~ 0
ST-Link headers
Text Label 9327 741  2    50   ~ 0
Reset
Wire Wire Line
	9115 741  9327 741 
Text Label 9324 841  2    50   ~ 0
SWIO
Wire Wire Line
	9115 841  9324 841 
Text Label 9302 1141 2    50   ~ 0
3V3
Wire Wire Line
	9115 1141 9302 1141
Text Notes 1287 6492 0    50   Italic 0
Power
Text Label 9396 1041 2    50   ~ 0
GND
Wire Wire Line
	9115 1041 9396 1041
Text Label 9392 941  2    50   ~ 0
SWCLK
Wire Wire Line
	9115 941  9392 941 
Text Label 6469 2614 2    50   ~ 0
P0.02
Wire Notes Line
	7966 3075 7977 6536
Text Notes 9351 6149 0    50   ~ 0
Extra Connectors
Wire Wire Line
	919  7023 687  7024
Wire Wire Line
	687  7024 687  6970
Connection ~ 919  7023
Wire Wire Line
	1167 7372 1467 7372
Wire Wire Line
	1473 7373 1467 7372
$Comp
L stm32wb_Dev_v1-rescue:AP2112K-3.3-Regulator_Linear-stm32wb_Dev_v1-rescue U1
U 1 1 5F2E2378
P 1467 7072
F 0 "U1" H 1467 7414 50  0000 C CNN
F 1 "AP2112K-3.3" H 1467 7323 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5" H 1467 7397 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/AP2112.pdf" H 1467 7172 50  0001 C CNN
	1    1467 7072
	1    0    0    -1  
$EndComp
Wire Wire Line
	1855 7371 1467 7371
Wire Wire Line
	1467 7371 1467 7372
Connection ~ 1467 7372
Wire Wire Line
	1467 7372 1468 7372
Wire Wire Line
	1856 7468 1856 7371
Wire Wire Line
	1856 7371 1855 7371
Wire Wire Line
	1473 7468 1856 7468
Connection ~ 1855 7371
Text Label 6313 1668 0    50   ~ 0
xyl1
Wire Wire Line
	6637 1668 6313 1668
Text Label 6415 2414 2    50   ~ 0
xyl1
Wire Wire Line
	6249 2414 6415 2414
Text Label 6415 2514 2    50   ~ 0
xyl2
Wire Wire Line
	6249 2514 6415 2514
Text Label 2532 4451 2    50   ~ 0
XL1
Text Label 3130 4451 2    50   ~ 0
XL2
Text Label 2932 4016 2    50   ~ 0
GND
Wire Wire Line
	2932 4151 2932 4150
Wire Wire Line
	2565 4151 2932 4150
Connection ~ 2932 4150
Wire Wire Line
	2932 4150 2932 4016
Text Label 3461 5114 0    50   ~ 0
XL2
Wire Wire Line
	3649 5114 3461 5114
Text Label 3461 4714 0    50   ~ 0
XL1
Wire Wire Line
	3649 4714 3461 4714
$Comp
L Device:C C7
U 1 1 621BB3E2
P 3999 2114
F 0 "C7" V 4054 1946 50  0000 L CNN
F 1 "100nf" V 3867 2010 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_2012Metric" H 4037 1964 50  0001 C CNN
F 3 "~" H 3999 2114 50  0001 C CNN
	1    3999 2114
	0    1    1    0   
$EndComp
Wire Wire Line
	3849 2114 3849 1999
Text Label 3849 1999 2    50   ~ 0
GND
Text Label 4949 1687 2    50   ~ 0
3V3
Text Label 5064 1284 2    50   ~ 0
GND
Wire Wire Line
	4949 1284 5064 1284
$Comp
L Device:C C10
U 1 1 621E49F1
P 4949 1434
F 0 "C10" H 4978 1364 50  0000 L CNN
F 1 "100nf" H 4631 1438 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_2012Metric" H 4987 1284 50  0001 C CNN
F 3 "~" H 4949 1434 50  0001 C CNN
	1    4949 1434
	-1   0    0    1   
$EndComp
Wire Wire Line
	5049 2114 5049 2020
Wire Wire Line
	5049 2020 4949 2020
Wire Wire Line
	4949 1584 4949 2020
$Comp
L Device:C C9
U 1 1 6223F050
P 4749 1964
F 0 "C9" H 4640 2051 50  0000 L CNN
F 1 "4.7uf" H 4753 1875 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_2012Metric" H 4787 1814 50  0001 C CNN
F 3 "~" H 4749 1964 50  0001 C CNN
	1    4749 1964
	-1   0    0    1   
$EndComp
Text Label 4749 1814 2    50   ~ 0
GND
$Comp
L Device:C C6
U 1 1 6226AEE8
P 3467 3263
F 0 "C6" H 3582 3309 50  0000 L CNN
F 1 "0.8pf" H 3582 3218 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_2012Metric" H 3505 3113 50  0001 C CNN
F 3 "~" H 3467 3263 50  0001 C CNN
	1    3467 3263
	1    0    0    -1  
$EndComp
$Comp
L Fixed_Inductor_0805:MLF2012DR33MT000 L1
U 1 1 6226B148
P 3167 3113
F 0 "L1" H 3242 3037 50  0000 C CNN
F 1 "3.3nH" H 3178 3169 50  0000 C CNN
F 2 "Inductors_SMD:L_0805_2012Metric" H 3167 3113 50  0001 L BNN
F 3 "" H 3167 3113 50  0001 C CNN
	1    3167 3113
	1    0    0    -1  
$EndComp
Wire Wire Line
	2867 3413 3467 3413
Wire Wire Line
	3471 3114 3466 3113
Wire Wire Line
	3466 3113 3467 3113
$Comp
L Device:C C3
U 1 1 6226B158
P 2867 3263
F 0 "C3" H 2982 3309 50  0000 L CNN
F 1 "0.5pf" H 2982 3218 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_2012Metric" H 2905 3113 50  0001 C CNN
F 3 "~" H 2867 3263 50  0001 C CNN
	1    2867 3263
	1    0    0    -1  
$EndComp
Wire Wire Line
	2867 3113 2523 3112
Wire Wire Line
	3467 3114 3649 3114
Wire Wire Line
	3467 3114 3466 3113
Wire Wire Line
	3467 3113 3467 3114
Text Label 2867 3413 2    50   ~ 0
GND
Text Label 5049 7714 0    50   ~ 0
VSS_PA
Text Label 3467 3413 0    50   ~ 0
VSS_PA
Text Label 4949 7753 2    50   ~ 0
B7
Wire Wire Line
	4949 7714 4949 7753
Wire Wire Line
	4449 2114 4449 718 
Wire Wire Line
	4449 718  5950 715 
$Comp
L Device:C C12
U 1 1 623641B7
P 6100 715
F 0 "C12" V 6236 678 50  0000 L CNN
F 1 "100nf" V 5955 598 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_2012Metric" H 6138 565 50  0001 C CNN
F 3 "~" H 6100 715 50  0001 C CNN
	1    6100 715 
	0    1    1    0   
$EndComp
Text Label 6250 715  0    50   ~ 0
GND
Text Label 6250 801  0    50   ~ 0
B7
Wire Wire Line
	6250 715  6250 801 
Text Label 3403 6814 0    50   ~ 0
SWDIO
Wire Wire Line
	3649 6814 3403 6814
Text Label 3403 6714 0    50   ~ 0
SWCLK
Wire Wire Line
	3649 6714 3403 6714
Text Label 3403 6614 0    50   ~ 0
Reset
Wire Wire Line
	3649 6614 3403 6614
Text Label 6370 7314 2    50   ~ 0
D-
Wire Wire Line
	6249 7314 6370 7314
Text Label 6370 7414 2    50   ~ 0
D+
Wire Wire Line
	6249 7414 6370 7414
$Comp
L Device:C C8
U 1 1 623D265A
P 4349 1964
F 0 "C8" H 4354 2045 50  0000 L CNN
F 1 "100nf" H 4266 1880 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_2012Metric" H 4387 1814 50  0001 C CNN
F 3 "~" H 4349 1964 50  0001 C CNN
	1    4349 1964
	-1   0    0    1   
$EndComp
Text Label 4196 1814 0    50   ~ 0
GND
Text Label 2523 3112 2    50   ~ 0
RF
$Comp
L stm32wb_Dev_v1-rescue:Antenna-Device AE1
U 1 1 6240FD2C
P 2523 2912
F 0 "AE1" H 2638 2895 50  0000 L CNN
F 1 "Antenna" H 2503 3090 50  0000 L CNN
F 2 "Pin_Headers:PinHeader_1x01_P2.54mm_Vertical" H 2523 2912 50  0001 C CNN
F 3 "~" H 2523 2912 50  0001 C CNN
	1    2523 2912
	1    0    0    -1  
$EndComp
Connection ~ 2867 3113
Connection ~ 3466 3113
Connection ~ 4949 2020
Wire Wire Line
	4949 2020 4949 2114
NoConn ~ 5449 2114
Wire Wire Line
	6249 2614 6469 2614
Text Label 6469 2714 2    50   ~ 0
P0.03
Wire Wire Line
	6249 2714 6469 2714
Text Label 6469 2814 2    50   ~ 0
P0.04
Wire Wire Line
	6249 2814 6469 2814
Text Label 6469 2914 2    50   ~ 0
P0.05
Wire Wire Line
	6249 2914 6469 2914
Text Label 6469 3014 2    50   ~ 0
P0.06
Wire Wire Line
	6249 3014 6469 3014
Text Label 6469 3114 2    50   ~ 0
P0.07
Wire Wire Line
	6249 3114 6469 3114
Text Label 6469 3214 2    50   ~ 0
P0.08
Wire Wire Line
	6249 3214 6469 3214
Text Label 6469 3314 2    50   ~ 0
P0.09
Wire Wire Line
	6249 3314 6469 3314
Text Label 6469 3414 2    50   ~ 0
P0.10
Wire Wire Line
	6249 3414 6469 3414
Text Label 6469 3514 2    50   ~ 0
P0.11
Wire Wire Line
	6249 3514 6469 3514
Text Label 6469 3614 2    50   ~ 0
P0.12
Wire Wire Line
	6249 3614 6469 3614
Text Label 6469 3714 2    50   ~ 0
P0.13
Wire Wire Line
	6249 3714 6469 3714
Text Label 6469 3814 2    50   ~ 0
P0.14
Wire Wire Line
	6249 3814 6469 3814
Text Label 6469 3914 2    50   ~ 0
P0.15
Wire Wire Line
	6249 3914 6469 3914
Text Label 6469 4014 2    50   ~ 0
P0.16
Wire Wire Line
	6249 4014 6469 4014
Text Label 6469 4114 2    50   ~ 0
P0.17
Wire Wire Line
	6249 4114 6469 4114
Text Label 6469 4214 2    50   ~ 0
P0.19
Wire Wire Line
	6249 4214 6469 4214
Text Label 6469 4314 2    50   ~ 0
P0.20
Wire Wire Line
	6249 4314 6469 4314
Text Label 6469 4414 2    50   ~ 0
P0.21
Wire Wire Line
	6249 4414 6469 4414
Text Label 6469 4514 2    50   ~ 0
P0.22
Wire Wire Line
	6249 4514 6469 4514
Text Label 6469 4614 2    50   ~ 0
P0.23
Wire Wire Line
	6249 4614 6469 4614
Text Label 6469 4714 2    50   ~ 0
P0.24
Wire Wire Line
	6249 4714 6469 4714
Text Label 6469 4814 2    50   ~ 0
P0.25
Wire Wire Line
	6249 4814 6469 4814
Text Label 6469 4914 2    50   ~ 0
P0.26
Wire Wire Line
	6249 4914 6469 4914
Text Label 6469 5014 2    50   ~ 0
P0.27
Wire Wire Line
	6249 5014 6469 5014
Text Label 6469 5114 2    50   ~ 0
P0.28
Wire Wire Line
	6249 5114 6469 5114
Text Label 6469 5214 2    50   ~ 0
P0.29
Wire Wire Line
	6249 5214 6469 5214
Text Label 6469 5314 2    50   ~ 0
P0.30
Wire Wire Line
	6249 5314 6469 5314
Text Label 6469 5414 2    50   ~ 0
P0.31
Wire Wire Line
	6249 5414 6469 5414
Text Label 6469 5814 2    50   ~ 0
P1.02
Text Label 6488 5614 2    50   ~ 0
P1.00
Text Label 6488 5714 2    50   ~ 0
P1.01
Wire Wire Line
	6249 5814 6469 5814
Text Label 6469 5914 2    50   ~ 0
P1.03
Wire Wire Line
	6249 5914 6469 5914
Text Label 6469 6014 2    50   ~ 0
P1.04
Wire Wire Line
	6249 6014 6469 6014
Text Label 6469 6114 2    50   ~ 0
P1.05
Wire Wire Line
	6249 6114 6469 6114
Text Label 6469 6214 2    50   ~ 0
P1.06
Wire Wire Line
	6249 6214 6469 6214
Text Label 6469 6314 2    50   ~ 0
P1.07
Wire Wire Line
	6249 6314 6469 6314
Text Label 6469 6414 2    50   ~ 0
P1.08
Wire Wire Line
	6249 6414 6469 6414
Text Label 6469 6514 2    50   ~ 0
P1.09
Wire Wire Line
	6249 6514 6469 6514
Text Label 6469 6614 2    50   ~ 0
P1.10
Wire Wire Line
	6249 6614 6469 6614
Text Label 6469 6714 2    50   ~ 0
P1.11
Wire Wire Line
	6249 6714 6469 6714
Text Label 6469 6814 2    50   ~ 0
P1.12
Wire Wire Line
	6249 6814 6469 6814
Text Label 6469 6914 2    50   ~ 0
P1.13
Wire Wire Line
	6249 6914 6469 6914
Text Label 6469 7014 2    50   ~ 0
P1.14
Wire Wire Line
	6249 7014 6469 7014
Text Label 6469 7114 2    50   ~ 0
P1.15
Wire Wire Line
	6249 7114 6469 7114
Wire Wire Line
	6249 5614 6488 5614
Wire Wire Line
	6249 5714 6488 5714
Text Label 9589 3577 2    50   ~ 0
P0.02
Wire Wire Line
	9369 3577 9589 3577
Text Label 9589 3677 2    50   ~ 0
P0.03
Wire Wire Line
	9369 3677 9589 3677
Text Label 9589 3777 2    50   ~ 0
P0.04
Wire Wire Line
	9369 3777 9589 3777
Text Label 9589 3877 2    50   ~ 0
P0.05
Wire Wire Line
	9369 3877 9589 3877
Text Label 9589 3977 2    50   ~ 0
P0.06
Wire Wire Line
	9369 3977 9589 3977
Text Label 9589 4077 2    50   ~ 0
P0.07
Wire Wire Line
	9369 4077 9589 4077
Text Label 9589 4177 2    50   ~ 0
P0.08
Wire Wire Line
	9369 4177 9589 4177
Text Label 9589 4277 2    50   ~ 0
P0.09
Wire Wire Line
	9369 4277 9589 4277
Text Label 9589 4377 2    50   ~ 0
P0.10
Wire Wire Line
	9369 4377 9589 4377
Text Label 9589 4477 2    50   ~ 0
P0.11
Wire Wire Line
	9369 4477 9589 4477
Text Label 9589 4577 2    50   ~ 0
P0.12
Wire Wire Line
	9369 4577 9589 4577
Text Label 9589 4677 2    50   ~ 0
P0.13
Wire Wire Line
	9369 4677 9589 4677
Text Label 8659 3569 2    50   ~ 0
P0.14
Wire Wire Line
	8439 3569 8659 3569
Text Label 8659 3669 2    50   ~ 0
P0.15
Wire Wire Line
	8439 3669 8659 3669
Text Label 8659 3769 2    50   ~ 0
P0.16
Wire Wire Line
	8439 3769 8659 3769
Text Label 8659 3869 2    50   ~ 0
P0.17
Wire Wire Line
	8439 3869 8659 3869
Text Label 8659 3969 2    50   ~ 0
P0.19
Wire Wire Line
	8439 3969 8659 3969
Text Label 8659 4069 2    50   ~ 0
P0.20
Wire Wire Line
	8439 4069 8659 4069
Text Label 8659 4169 2    50   ~ 0
P0.21
Wire Wire Line
	8439 4169 8659 4169
Text Label 8659 4269 2    50   ~ 0
P0.22
Wire Wire Line
	8439 4269 8659 4269
Text Label 8659 4369 2    50   ~ 0
P0.23
Wire Wire Line
	8439 4369 8659 4369
Text Label 8659 4469 2    50   ~ 0
P0.24
Wire Wire Line
	8439 4469 8659 4469
Text Label 8659 4569 2    50   ~ 0
P0.25
Wire Wire Line
	8439 4569 8659 4569
Text Label 8659 4669 2    50   ~ 0
P0.26
Wire Wire Line
	8439 4669 8659 4669
Text Label 10296 3577 2    50   ~ 0
P0.27
Wire Wire Line
	10076 3577 10296 3577
Text Label 10296 3677 2    50   ~ 0
P0.28
Wire Wire Line
	10076 3677 10296 3677
Text Label 10296 3777 2    50   ~ 0
P0.29
Wire Wire Line
	10076 3777 10296 3777
Text Label 10296 3877 2    50   ~ 0
P0.30
Wire Wire Line
	10076 3877 10296 3877
Text Label 10296 3977 2    50   ~ 0
P0.31
Wire Wire Line
	10076 3977 10296 3977
Text Label 10296 4077 2    50   ~ 0
P1.00
Wire Wire Line
	10076 4077 10296 4077
Text Label 10296 4177 2    50   ~ 0
P1.01
Wire Wire Line
	10076 4177 10296 4177
Text Label 10296 4277 2    50   ~ 0
P1.02
Wire Wire Line
	10076 4277 10296 4277
Text Label 10296 4377 2    50   ~ 0
P1.03
Wire Wire Line
	10076 4377 10296 4377
Text Label 10296 4477 2    50   ~ 0
P1.04
Wire Wire Line
	10076 4477 10296 4477
Text Label 10296 4577 2    50   ~ 0
P1.05
Wire Wire Line
	10076 4577 10296 4577
Text Label 10296 4677 2    50   ~ 0
P1.06
Wire Wire Line
	10076 4677 10296 4677
Text Label 10876 3566 2    50   ~ 0
P1.07
Wire Wire Line
	10656 3566 10876 3566
Text Label 10876 3666 2    50   ~ 0
P1.08
Wire Wire Line
	10656 3666 10876 3666
Text Label 10876 3766 2    50   ~ 0
P1.09
Wire Wire Line
	10656 3766 10876 3766
Text Label 10876 3866 2    50   ~ 0
P1.10
Wire Wire Line
	10656 3866 10876 3866
Text Label 10876 3966 2    50   ~ 0
P1.11
Wire Wire Line
	10656 3966 10876 3966
Text Label 10876 4066 2    50   ~ 0
P1.12
Wire Wire Line
	10656 4066 10876 4066
Text Label 10876 4166 2    50   ~ 0
P1.13
Wire Wire Line
	10656 4166 10876 4166
Text Label 10876 4266 2    50   ~ 0
P1.14
Wire Wire Line
	10656 4266 10876 4266
Text Label 10876 4366 2    50   ~ 0
P1.15
Wire Wire Line
	10656 4366 10876 4366
Text Label 10876 4466 2    50   ~ 0
GND
Wire Wire Line
	10656 4466 10876 4466
Text Label 10876 4566 2    50   ~ 0
GND
Wire Wire Line
	10656 4566 10876 4566
Text Label 10876 4666 2    50   ~ 0
3V3
Wire Wire Line
	10656 4666 10876 4666
Text Label 5149 2114 0    50   ~ 0
3V3
Text Label 5264 1814 2    50   ~ 0
GND
Wire Wire Line
	5149 1814 5264 1814
$Comp
L Device:C C11
U 1 1 622D5BFC
P 5149 1964
F 0 "C11" H 4953 1971 50  0000 L CNN
F 1 "4.7uf" H 5137 1881 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_2012Metric" H 5187 1814 50  0001 C CNN
F 3 "~" H 5149 1964 50  0001 C CNN
	1    5149 1964
	-1   0    0    1   
$EndComp
NoConn ~ 4249 2114
NoConn ~ 4549 2114
NoConn ~ 4649 2114
$Comp
L nrf52840_Dev_v1-rescue:nRF52840-MCU_Nordic U2
U 1 1 6211700A
P 4949 4914
F 0 "U2" H 4949 2025 50  0000 C CNN
F 1 "nRF52840" H 4953 5200 50  0000 C CNN
F 2 "Custom_Libraries:NRF52840-QIAA-R" H 4949 2014 50  0001 C CNN
F 3 "http://infocenter.nordicsemi.com/topic/com.nordic.infocenter.nrf52/dita/nrf52/chips/nrf52840.html" H 4299 6814 50  0001 C CNN
	1    4949 4914
	1    0    0    -1  
$EndComp
Wire Wire Line
	7437 1368 6637 1368
Wire Wire Line
	7437 1668 7702 1668
$Comp
L Device:C C14
U 1 1 6212F8F6
P 7437 1518
F 0 "C14" H 7278 1600 50  0000 L CNN
F 1 "12pf" H 7532 1525 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_2012Metric" H 7475 1368 50  0001 C CNN
F 3 "~" H 7437 1518 50  0001 C CNN
	1    7437 1518
	1    0    0    -1  
$EndComp
Text Label 7702 1668 2    50   ~ 0
xyl2
$Comp
L crystal_768KHz:ABS07-32.768KHZ-7-1-T Y2
U 1 1 622EEBB0
P 7037 1668
F 0 "Y2" H 7175 1392 50  0000 C CNN
F 1 "ABS07-32.768KHZ-7-1-T" H 7213 1296 50  0001 C CNN
F 2 "Custom_Libraries:XTAL320X150X90" H 7037 1668 50  0001 L BNN
F 3 "" H 7037 1668 50  0001 L BNN
	1    7037 1668
	1    0    0    -1  
$EndComp
$Comp
L Device:C C13
U 1 1 6212F909
P 6637 1518
F 0 "C13" H 6657 1600 50  0000 L CNN
F 1 "12pf" H 6359 1526 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_2012Metric" H 6675 1368 50  0001 C CNN
F 3 "~" H 6637 1518 50  0001 C CNN
	1    6637 1518
	1    0    0    -1  
$EndComp
Text Label 6637 1368 2    50   ~ 0
GND
Connection ~ 6637 1668
Connection ~ 7437 1668
$Comp
L crystal_32MHz:ABM7-32.000MHZ-D2Y-T Y1
U 1 1 6234C749
P 2732 4451
F 0 "Y1" H 2732 4596 50  0000 C CNN
F 1 "ABM7-32.000MHZ-D2Y-T" H 2732 4597 50  0001 C CNN
F 2 "Custom_Libraries:XTAL_ABM7-32.000MHZ-D2Y-T" H 2732 4451 50  0001 L BNN
F 3 "" H 2732 4451 50  0001 L BNN
F 4 "ABRACON" H 2732 4451 50  0001 L BNN "MANUFACTURER"
F 5 "MANUFACTURER RECOMMENDATIONS" H 2732 4451 50  0001 L BNN "STANDARD"
F 6 "08.06.15" H 2732 4451 50  0001 L BNN "PARTREV"
	1    2732 4451
	1    0    0    -1  
$EndComp
Wire Wire Line
	2932 4451 3130 4451
$Comp
L Device:C C5
U 1 1 62186626
P 2932 4301
F 0 "C5" H 2827 4386 50  0000 L CNN
F 1 "12pf" H 3027 4308 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_2012Metric" H 2970 4151 50  0001 C CNN
F 3 "~" H 2932 4301 50  0001 C CNN
	1    2932 4301
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 62186641
P 2532 4301
F 0 "C2" H 2427 4386 50  0000 L CNN
F 1 "12pf" H 2254 4309 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_2012Metric" H 2570 4151 50  0001 C CNN
F 3 "~" H 2532 4301 50  0001 C CNN
	1    2532 4301
	1    0    0    -1  
$EndComp
Wire Wire Line
	2565 4151 2532 4151
Connection ~ 2932 4451
$Comp
L Connector:Conn_01x12_Female J1
U 1 1 623DCF0D
P 8239 4169
F 0 "J1" H 8131 3436 50  0000 C CNN
F 1 "Conn_01x12_Female" H 8131 3435 50  0001 C CNN
F 2 "Pin_Headers:PinHeader_1x12_P2.54mm_Vertical" H 8239 4169 50  0001 C CNN
F 3 "~" H 8239 4169 50  0001 C CNN
	1    8239 4169
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x12_Female J4
U 1 1 62413EC3
P 9169 4177
F 0 "J4" H 9061 3444 50  0000 C CNN
F 1 "Conn_01x12_Female" H 9061 3443 50  0001 C CNN
F 2 "Pin_Headers:PinHeader_1x12_P2.54mm_Vertical" H 9169 4177 50  0001 C CNN
F 3 "~" H 9169 4177 50  0001 C CNN
	1    9169 4177
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x12_Female J6
U 1 1 62419AC4
P 10456 4166
F 0 "J6" H 10348 3433 50  0000 C CNN
F 1 "Conn_01x12_Female" H 10348 3432 50  0001 C CNN
F 2 "Pin_Headers:PinHeader_1x12_P2.54mm_Vertical" H 10456 4166 50  0001 C CNN
F 3 "~" H 10456 4166 50  0001 C CNN
	1    10456 4166
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x12_Female J5
U 1 1 62432B0C
P 9876 4177
F 0 "J5" H 9768 3444 50  0000 C CNN
F 1 "Conn_01x12_Female" H 9768 3443 50  0001 C CNN
F 2 "Pin_Headers:PinHeader_1x12_P2.54mm_Vertical" H 9876 4177 50  0001 C CNN
F 3 "~" H 9876 4177 50  0001 C CNN
	1    9876 4177
	-1   0    0    1   
$EndComp
$Comp
L nrf52840_Dev_v1-rescue:1734328-1-usb_mini_2 J3
U 1 1 624B5E84
P 2041 5350
F 0 "J3" H 2041 5817 50  0000 C CNN
F 1 "1734328-1" H 2041 5726 50  0000 C CNN
F 2 "Custom_Libraries:usb_mini_TE_1734328-1" H 2041 5350 50  0001 L BNN
F 3 "" H 2041 5350 50  0001 L BNN
F 4 "1734328-1" H 2041 5350 50  0001 L BNN "Comment"
	1    2041 5350
	1    0    0    -1  
$EndComp
Text Label 2441 5550 0    50   ~ 0
GND
Text Label 1641 5350 2    50   ~ 0
D+
Text Label 1641 5250 2    50   ~ 0
D-
Text Label 1641 5150 2    50   ~ 0
5V
Text Label 1641 5550 2    50   ~ 0
GND
Wire Wire Line
	1641 5550 1641 5450
NoConn ~ 5349 2114
Wire Wire Line
	4349 1814 4196 1814
$Comp
L nrf52840_Dev_v1-rescue:M830520-Device AE2
U 1 1 622F54D2
P 2423 3212
F 0 "AE2" H 2423 3412 50  0001 R CNN
F 1 "M830520" H 2581 3317 50  0000 L CNN
F 2 "Custom_Libraries:M830520" H 2323 3387 50  0001 C CNN
F 3 "~" H 2323 3387 50  0001 C CNN
	1    2423 3212
	-1   0    0    1   
$EndComp
Text Label 2323 3112 2    50   ~ 0
GND
$EndSCHEMATC
