EESchema Schematic File Version 4
EELAYER 26 0
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
L MCU_ST_STM8:STM8S003F3P U1
U 1 1 5DEB715A
P 3400 2350
F 0 "U1" H 3400 3528 50  0000 C CNN
F 1 "STM8S003F3P" H 3400 3437 50  0000 C CNN
F 2 "Package_SO:TSSOP-20_4.4x6.5mm_P0.65mm" H 3450 3450 50  0001 L CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00024550.pdf" H 3350 1950 50  0001 C CNN
	1    3400 2350
	1    0    0    -1  
$EndComp
$Comp
L Transistor_Array:ULN2003A U3
U 1 1 5DEB7283
P 6600 2300
F 0 "U3" H 6600 2967 50  0000 C CNN
F 1 "ULN2003A" H 6600 2876 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 6650 1750 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/uln2003a.pdf" H 6700 2100 50  0001 C CNN
	1    6600 2300
	1    0    0    -1  
$EndComp
Text GLabel 2400 2350 0    50   Input ~ 0
L2_STM_OUT
Text GLabel 2400 2450 0    50   Input ~ 0
L3_STM_OUT
Text GLabel 2400 2550 0    50   Input ~ 0
L4_STM_OUT
Wire Wire Line
	2800 2350 2400 2350
Wire Wire Line
	2800 2450 2400 2450
Wire Wire Line
	2800 2550 2400 2550
Text GLabel 5800 2100 0    50   Input ~ 0
L4_STM_OUT
Text GLabel 5800 2500 0    50   Input ~ 0
L2_STM_OUT
Wire Wire Line
	6200 2100 6050 2100
$Comp
L power:+3.3V #PWR011
U 1 1 5DEB775C
P 3400 950
F 0 "#PWR011" H 3400 800 50  0001 C CNN
F 1 "+3.3V" H 3415 1123 50  0000 C CNN
F 2 "" H 3400 950 50  0001 C CNN
F 3 "" H 3400 950 50  0001 C CNN
	1    3400 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 1350 3400 1200
$Comp
L power:GND #PWR012
U 1 1 5DEB7861
P 3400 3850
F 0 "#PWR012" H 3400 3600 50  0001 C CNN
F 1 "GND" H 3405 3677 50  0000 C CNN
F 2 "" H 3400 3850 50  0001 C CNN
F 3 "" H 3400 3850 50  0001 C CNN
	1    3400 3850
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR05
U 1 1 5DEB78EC
P 1650 2450
F 0 "#PWR05" H 1650 2300 50  0001 C CNN
F 1 "+3.3V" H 1665 2623 50  0000 C CNN
F 2 "" H 1650 2450 50  0001 C CNN
F 3 "" H 1650 2450 50  0001 C CNN
	1    1650 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5DEB795A
P 1650 2750
F 0 "R5" H 1580 2704 50  0000 R CNN
F 1 "1K" H 1580 2795 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 1580 2750 50  0001 C CNN
F 3 "~" H 1650 2750 50  0001 C CNN
	1    1650 2750
	-1   0    0    1   
$EndComp
Wire Wire Line
	1650 2450 1650 2600
Wire Wire Line
	2800 2950 1650 2950
Wire Wire Line
	1650 2950 1650 2900
Text GLabel 1450 2950 0    50   Input ~ 0
NRST
Wire Wire Line
	1650 2950 1450 2950
Connection ~ 1650 2950
$Comp
L Connector:Conn_01x04_Male SWIM1
U 1 1 5DEB8330
P 1050 950
F 0 "SWIM1" H 1156 1228 50  0000 C CNN
F 1 "Conn_01x04_Male" H 1156 1137 50  0000 C CNN
F 2 "Connector_JST:JST_EH_B04B-EH-A_1x04_P2.50mm_Vertical" H 1050 950 50  0001 C CNN
F 3 "~" H 1050 950 50  0001 C CNN
	1    1050 950 
	1    0    0    -1  
$EndComp
Text GLabel 2000 850  2    50   Input ~ 0
NRST
$Comp
L power:GND #PWR06
U 1 1 5DEB83F0
P 2000 1050
F 0 "#PWR06" H 2000 800 50  0001 C CNN
F 1 "GND" V 2005 922 50  0000 R CNN
F 2 "" H 2000 1050 50  0001 C CNN
F 3 "" H 2000 1050 50  0001 C CNN
	1    2000 1050
	0    -1   -1   0   
$EndComp
Text GLabel 2000 950  2    50   Input ~ 0
SWIM
$Comp
L power:+3.3V #PWR07
U 1 1 5DEB8550
P 2000 1150
F 0 "#PWR07" H 2000 1000 50  0001 C CNN
F 1 "+3.3V" V 2015 1278 50  0000 L CNN
F 2 "" H 2000 1150 50  0001 C CNN
F 3 "" H 2000 1150 50  0001 C CNN
	1    2000 1150
	0    1    1    0   
$EndComp
Wire Wire Line
	2000 850  1250 850 
Wire Wire Line
	1250 950  2000 950 
Wire Wire Line
	1250 1050 2000 1050
$Comp
L Device:C_Small C2
U 1 1 5DEB9140
P 3650 1050
F 0 "C2" V 3421 1050 50  0000 C CNN
F 1 "0.1uF" V 3512 1050 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 3650 1050 50  0001 C CNN
F 3 "~" H 3650 1050 50  0001 C CNN
	1    3650 1050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5DEB9180
P 3950 1150
F 0 "#PWR013" H 3950 900 50  0001 C CNN
F 1 "GND" H 3955 977 50  0000 C CNN
F 2 "" H 3950 1150 50  0001 C CNN
F 3 "" H 3950 1150 50  0001 C CNN
	1    3950 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1050 3400 1050
Connection ~ 3400 1050
Wire Wire Line
	3400 1050 3400 950 
Wire Wire Line
	3750 1050 3850 1050
Wire Wire Line
	3950 1050 3950 1150
$Comp
L power:GND #PWR020
U 1 1 5DEB9880
P 6600 3150
F 0 "#PWR020" H 6600 2900 50  0001 C CNN
F 1 "GND" H 6605 2977 50  0000 C CNN
F 2 "" H 6600 3150 50  0001 C CNN
F 3 "" H 6600 3150 50  0001 C CNN
	1    6600 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2900 6600 3150
$Comp
L Device:C_Small C3
U 1 1 5DEB9F53
P 3650 1200
F 0 "C3" V 3421 1200 50  0000 C CNN
F 1 "1uF" V 3512 1200 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 3650 1200 50  0001 C CNN
F 3 "~" H 3650 1200 50  0001 C CNN
	1    3650 1200
	0    1    1    0   
$EndComp
Wire Wire Line
	3550 1200 3400 1200
Connection ~ 3400 1200
Wire Wire Line
	3400 1200 3400 1050
Wire Wire Line
	3750 1200 3850 1200
Wire Wire Line
	3850 1200 3850 1050
Connection ~ 3850 1050
Wire Wire Line
	3850 1050 3950 1050
$Comp
L Device:C_Small C1
U 1 1 5DEBA616
P 2700 3400
F 0 "C1" H 2608 3354 50  0000 R CNN
F 1 "1uF" H 2608 3445 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2700 3400 50  0001 C CNN
F 3 "~" H 2700 3400 50  0001 C CNN
	1    2700 3400
	-1   0    0    1   
$EndComp
Wire Wire Line
	2800 3050 2700 3050
Wire Wire Line
	2700 3050 2700 3300
Wire Wire Line
	3400 3350 3400 3700
Wire Wire Line
	2700 3500 2700 3700
Wire Wire Line
	2700 3700 3400 3700
Connection ~ 3400 3700
Wire Wire Line
	3400 3700 3400 3850
$Comp
L Regulator_Linear:LM1117-3.3 U2
U 1 1 5DEBB5DE
P 5450 4450
F 0 "U2" H 5450 4692 50  0000 C CNN
F 1 "LM1117-3.3" H 5450 4601 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 5450 4450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm1117.pdf" H 5450 4450 50  0001 C CNN
	1    5450 4450
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR014
U 1 1 5DEBF733
P 3950 4250
F 0 "#PWR014" H 3950 4100 50  0001 C CNN
F 1 "+12V" H 3965 4423 50  0000 C CNN
F 2 "" H 3950 4250 50  0001 C CNN
F 3 "" H 3950 4250 50  0001 C CNN
	1    3950 4250
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:IRF4905 Q1
U 1 1 5DEBF788
P 4300 4550
F 0 "Q1" V 4643 4550 50  0000 C CNN
F 1 "IRF4905" V 4552 4550 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-263-2" H 4500 4475 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/irf4905.pdf?fileId=5546d462533600a4015355e32165197c" H 4300 4550 50  0001 L CNN
	1    4300 4550
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Zener D1
U 1 1 5DEBF94D
P 4550 4650
F 0 "D1" V 4504 4729 50  0000 L CNN
F 1 "SMBJ15A" V 4595 4729 50  0000 L CNN
F 2 "Diode_SMD:D_SMB" H 4550 4650 50  0001 C CNN
F 3 "~" H 4550 4650 50  0001 C CNN
	1    4550 4650
	0    1    1    0   
$EndComp
Wire Wire Line
	4500 4450 4550 4450
Wire Wire Line
	5450 4900 5450 4750
Wire Wire Line
	4300 4750 4300 4900
Wire Wire Line
	4300 4900 4550 4900
$Comp
L power:GND #PWR017
U 1 1 5DEC219A
P 5450 5000
F 0 "#PWR017" H 5450 4750 50  0001 C CNN
F 1 "GND" H 5455 4827 50  0000 C CNN
F 2 "" H 5450 5000 50  0001 C CNN
F 3 "" H 5450 5000 50  0001 C CNN
	1    5450 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 4900 5450 5000
Connection ~ 5450 4900
$Comp
L power:+3.3V #PWR019
U 1 1 5DEC2D34
P 6400 4300
F 0 "#PWR019" H 6400 4150 50  0001 C CNN
F 1 "+3.3V" H 6415 4473 50  0000 C CNN
F 2 "" H 6400 4300 50  0001 C CNN
F 3 "" H 6400 4300 50  0001 C CNN
	1    6400 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 4450 6000 4450
Wire Wire Line
	6400 4450 6400 4300
$Comp
L Device:CP C4
U 1 1 5DEC377F
P 4900 4700
F 0 "C4" H 5018 4746 50  0000 L CNN
F 1 "1uF" H 5018 4655 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-7343-15_Kemet-W" H 4938 4550 50  0001 C CNN
F 3 "~" H 4900 4700 50  0001 C CNN
	1    4900 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C5
U 1 1 5DEC37D9
P 6000 4700
F 0 "C5" H 6118 4746 50  0000 L CNN
F 1 "10uF" H 6118 4655 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-7343-15_Kemet-W" H 6038 4550 50  0001 C CNN
F 3 "~" H 6000 4700 50  0001 C CNN
	1    6000 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 4550 4900 4450
Connection ~ 4900 4450
Wire Wire Line
	4900 4450 5150 4450
Wire Wire Line
	4900 4850 4900 4900
Connection ~ 4900 4900
Wire Wire Line
	4900 4900 5450 4900
Wire Wire Line
	5450 4900 6000 4900
Wire Wire Line
	6000 4900 6000 4850
Wire Wire Line
	6000 4550 6000 4450
Connection ~ 6000 4450
Wire Wire Line
	6000 4450 6400 4450
$Comp
L power:+12V #PWR021
U 1 1 5DEC6E0B
P 7300 1600
F 0 "#PWR021" H 7300 1450 50  0001 C CNN
F 1 "+12V" H 7315 1773 50  0000 C CNN
F 2 "" H 7300 1600 50  0001 C CNN
F 3 "" H 7300 1600 50  0001 C CNN
	1    7300 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 1900 7300 1900
Wire Wire Line
	7300 1900 7300 1600
$Comp
L Device:Q_PMOS_GSD Q6
U 1 1 5DEC93CF
P 10150 1550
F 0 "Q6" H 10355 1596 50  0000 L CNN
F 1 "5505" H 10355 1505 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 10150 1550 50  0001 C CIN
F 3 "https://www.infineon.com/dgdl/irf9383mpbf.pdf?fileId=5546d462533600a40153561169a11dab" H 10150 1550 50  0001 L CNN
	1    10150 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 5DEC1618
P 9850 1300
F 0 "R11" H 9780 1254 50  0000 R CNN
F 1 "1K" H 9780 1345 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9780 1300 50  0001 C CNN
F 3 "~" H 9850 1300 50  0001 C CNN
	1    9850 1300
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR026
U 1 1 5DEC16D0
P 10250 1050
F 0 "#PWR026" H 10250 900 50  0001 C CNN
F 1 "+12V" H 10265 1223 50  0000 C CNN
F 2 "" H 10250 1050 50  0001 C CNN
F 3 "" H 10250 1050 50  0001 C CNN
	1    10250 1050
	1    0    0    -1  
$EndComp
Text GLabel 9750 1550 0    50   Input ~ 0
lamp2_ctrl
Wire Wire Line
	9850 1150 9850 1100
Wire Wire Line
	9850 1100 10250 1100
Connection ~ 10250 1100
Wire Wire Line
	10250 1100 10250 1350
Wire Wire Line
	9950 1550 9850 1550
Connection ~ 9850 1550
Wire Wire Line
	9850 1550 9750 1550
Text GLabel 10450 1850 2    50   Input ~ 0
lamp2_out
Wire Wire Line
	10250 1750 10250 1850
Wire Wire Line
	10250 1850 10450 1850
Wire Wire Line
	9850 1450 9850 1550
Wire Wire Line
	10250 1050 10250 1100
$Comp
L Device:R R7
U 1 1 5DECD4C6
P 8250 1250
F 0 "R7" H 8180 1204 50  0000 R CNN
F 1 "1K" H 8180 1295 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 8180 1250 50  0001 C CNN
F 3 "~" H 8250 1250 50  0001 C CNN
	1    8250 1250
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR022
U 1 1 5DECD546
P 8650 1050
F 0 "#PWR022" H 8650 900 50  0001 C CNN
F 1 "+12V" H 8665 1223 50  0000 C CNN
F 2 "" H 8650 1050 50  0001 C CNN
F 3 "" H 8650 1050 50  0001 C CNN
	1    8650 1050
	1    0    0    -1  
$EndComp
Text GLabel 8150 1500 0    50   Input ~ 0
lamp2_ctrl
Text GLabel 8750 1800 2    50   Input ~ 0
lamp2_out
Wire Wire Line
	8650 1050 8250 1050
Wire Wire Line
	8250 1050 8250 1100
Wire Wire Line
	8650 1300 8650 1050
Connection ~ 8650 1050
Wire Wire Line
	8250 1400 8250 1500
Wire Wire Line
	8250 1500 8350 1500
Wire Wire Line
	8250 1500 8150 1500
Connection ~ 8250 1500
Wire Wire Line
	8650 1700 8650 1800
Wire Wire Line
	8650 1800 8750 1800
$Comp
L Device:Q_PMOS_GSD Q3
U 1 1 5DED75E9
P 8550 3050
F 0 "Q3" H 8755 3096 50  0000 L CNN
F 1 "5505" H 8755 3005 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 8550 3050 50  0001 C CIN
F 3 "https://www.infineon.com/dgdl/irf9383mpbf.pdf?fileId=5546d462533600a40153561169a11dab" H 8550 3050 50  0001 L CNN
	1    8550 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 5DED75EF
P 8250 2800
F 0 "R8" H 8180 2754 50  0000 R CNN
F 1 "1K" H 8180 2845 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 8180 2800 50  0001 C CNN
F 3 "~" H 8250 2800 50  0001 C CNN
	1    8250 2800
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR023
U 1 1 5DED75F5
P 8650 2600
F 0 "#PWR023" H 8650 2450 50  0001 C CNN
F 1 "+12V" H 8665 2773 50  0000 C CNN
F 2 "" H 8650 2600 50  0001 C CNN
F 3 "" H 8650 2600 50  0001 C CNN
	1    8650 2600
	1    0    0    -1  
$EndComp
Text GLabel 8150 3050 0    50   Input ~ 0
lamp3_ctrl
Text GLabel 8750 3350 2    50   Input ~ 0
lamp3_out
Wire Wire Line
	8650 2600 8250 2600
Wire Wire Line
	8250 2600 8250 2650
Wire Wire Line
	8650 2850 8650 2600
Connection ~ 8650 2600
Wire Wire Line
	8250 2950 8250 3050
Wire Wire Line
	8250 3050 8350 3050
Wire Wire Line
	8250 3050 8150 3050
Connection ~ 8250 3050
Wire Wire Line
	8650 3250 8650 3350
Wire Wire Line
	8650 3350 8750 3350
$Comp
L Device:Q_PMOS_GSD Q7
U 1 1 5DED8D30
P 10150 3050
F 0 "Q7" H 10355 3096 50  0000 L CNN
F 1 "5505" H 10355 3005 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 10150 3050 50  0001 C CIN
F 3 "https://www.infineon.com/dgdl/irf9383mpbf.pdf?fileId=5546d462533600a40153561169a11dab" H 10150 3050 50  0001 L CNN
	1    10150 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5DED8D36
P 9850 2800
F 0 "R12" H 9780 2754 50  0000 R CNN
F 1 "1K" H 9780 2845 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9780 2800 50  0001 C CNN
F 3 "~" H 9850 2800 50  0001 C CNN
	1    9850 2800
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR027
U 1 1 5DED8D3C
P 10250 2600
F 0 "#PWR027" H 10250 2450 50  0001 C CNN
F 1 "+12V" H 10265 2773 50  0000 C CNN
F 2 "" H 10250 2600 50  0001 C CNN
F 3 "" H 10250 2600 50  0001 C CNN
	1    10250 2600
	1    0    0    -1  
$EndComp
Text GLabel 9750 3050 0    50   Input ~ 0
lamp3_ctrl
Text GLabel 10350 3350 2    50   Input ~ 0
lamp3_out
Wire Wire Line
	10250 2600 9850 2600
Wire Wire Line
	9850 2600 9850 2650
Wire Wire Line
	10250 2850 10250 2600
Connection ~ 10250 2600
Wire Wire Line
	9850 2950 9850 3050
Wire Wire Line
	9850 3050 9950 3050
Wire Wire Line
	9850 3050 9750 3050
Connection ~ 9850 3050
Wire Wire Line
	10250 3250 10250 3350
Wire Wire Line
	10250 3350 10350 3350
$Comp
L Device:Q_PMOS_GSD Q8
U 1 1 5DEDAC45
P 10150 4300
F 0 "Q8" H 10355 4346 50  0000 L CNN
F 1 "5505" H 10355 4255 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 10150 4300 50  0001 C CIN
F 3 "https://www.infineon.com/dgdl/irf9383mpbf.pdf?fileId=5546d462533600a40153561169a11dab" H 10150 4300 50  0001 L CNN
	1    10150 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R13
U 1 1 5DEDAC4B
P 9850 4050
F 0 "R13" H 9780 4004 50  0000 R CNN
F 1 "1K" H 9780 4095 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9780 4050 50  0001 C CNN
F 3 "~" H 9850 4050 50  0001 C CNN
	1    9850 4050
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR028
U 1 1 5DEDAC51
P 10250 3800
F 0 "#PWR028" H 10250 3650 50  0001 C CNN
F 1 "+12V" H 10265 3973 50  0000 C CNN
F 2 "" H 10250 3800 50  0001 C CNN
F 3 "" H 10250 3800 50  0001 C CNN
	1    10250 3800
	1    0    0    -1  
$EndComp
Text GLabel 9750 4300 0    50   Input ~ 0
lamp4_ctrl
Wire Wire Line
	9850 3900 9850 3850
Wire Wire Line
	9850 3850 10250 3850
Connection ~ 10250 3850
Wire Wire Line
	10250 3850 10250 4100
Wire Wire Line
	9950 4300 9850 4300
Connection ~ 9850 4300
Wire Wire Line
	9850 4300 9750 4300
Text GLabel 10450 4600 2    50   Input ~ 0
lamp4_out
Wire Wire Line
	10250 4500 10250 4600
Wire Wire Line
	10250 4600 10450 4600
Wire Wire Line
	9850 4200 9850 4300
Wire Wire Line
	10250 3800 10250 3850
$Comp
L Device:Q_PMOS_GSD Q4
U 1 1 5DEDAC64
P 8550 4250
F 0 "Q4" H 8755 4296 50  0000 L CNN
F 1 "5505" H 8755 4205 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 8550 4250 50  0001 C CIN
F 3 "https://www.infineon.com/dgdl/irf9383mpbf.pdf?fileId=5546d462533600a40153561169a11dab" H 8550 4250 50  0001 L CNN
	1    8550 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5DEDAC6A
P 8250 4000
F 0 "R9" H 8180 3954 50  0000 R CNN
F 1 "1K" H 8180 4045 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 8180 4000 50  0001 C CNN
F 3 "~" H 8250 4000 50  0001 C CNN
	1    8250 4000
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR024
U 1 1 5DEDAC70
P 8650 3800
F 0 "#PWR024" H 8650 3650 50  0001 C CNN
F 1 "+12V" H 8665 3973 50  0000 C CNN
F 2 "" H 8650 3800 50  0001 C CNN
F 3 "" H 8650 3800 50  0001 C CNN
	1    8650 3800
	1    0    0    -1  
$EndComp
Text GLabel 8150 4250 0    50   Input ~ 0
lamp4_ctrl
Text GLabel 8750 4550 2    50   Input ~ 0
lamp4_out
Wire Wire Line
	8650 3800 8250 3800
Wire Wire Line
	8250 3800 8250 3850
Wire Wire Line
	8250 4150 8250 4250
Wire Wire Line
	8250 4250 8350 4250
Wire Wire Line
	8250 4250 8150 4250
Connection ~ 8250 4250
Wire Wire Line
	8650 4450 8650 4550
Wire Wire Line
	8650 4550 8750 4550
Text GLabel 7300 2100 2    50   Input ~ 0
lamp2_ctrl
Text GLabel 7300 2300 2    50   Input ~ 0
lamp3_ctrl
Text GLabel 7300 2500 2    50   Input ~ 0
lamp4_ctrl
Text GLabel 5800 2300 0    50   Input ~ 0
L3_STM_OUT
Wire Wire Line
	7000 2100 7100 2100
Wire Wire Line
	4550 4450 4550 4500
Connection ~ 4550 4450
Wire Wire Line
	4550 4450 4900 4450
Wire Wire Line
	4550 4800 4550 4900
Connection ~ 4550 4900
Wire Wire Line
	4550 4900 4900 4900
Wire Wire Line
	3950 4250 3950 4450
Wire Wire Line
	3950 4450 4100 4450
Text GLabel 2400 2050 0    50   Input ~ 0
CNT1
Text GLabel 2400 2150 0    50   Input ~ 0
CNT2
Wire Wire Line
	2400 2150 2800 2150
Wire Wire Line
	2400 2050 2800 2050
Text GLabel 1250 3750 0    50   Input ~ 0
CNT1
$Comp
L Device:R R1
U 1 1 5DF124D9
P 1500 3500
F 0 "R1" H 1430 3454 50  0000 R CNN
F 1 "1K" H 1430 3545 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 1430 3500 50  0001 C CNN
F 3 "~" H 1500 3500 50  0001 C CNN
	1    1500 3500
	-1   0    0    1   
$EndComp
$Comp
L Device:R R2
U 1 1 5DF12541
P 1500 4000
F 0 "R2" H 1430 3954 50  0000 R CNN
F 1 "1K" H 1430 4045 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 1430 4000 50  0001 C CNN
F 3 "~" H 1500 4000 50  0001 C CNN
	1    1500 4000
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5DF12689
P 1500 4250
F 0 "#PWR02" H 1500 4000 50  0001 C CNN
F 1 "GND" H 1505 4077 50  0000 C CNN
F 2 "" H 1500 4250 50  0001 C CNN
F 3 "" H 1500 4250 50  0001 C CNN
	1    1500 4250
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR01
U 1 1 5DF129BA
P 1500 3300
F 0 "#PWR01" H 1500 3150 50  0001 C CNN
F 1 "+3.3V" H 1515 3473 50  0000 C CNN
F 2 "" H 1500 3300 50  0001 C CNN
F 3 "" H 1500 3300 50  0001 C CNN
	1    1500 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 3750 1500 3750
Wire Wire Line
	1500 3750 1500 3650
Wire Wire Line
	1500 3350 1500 3300
Wire Wire Line
	1500 3850 1500 3750
Connection ~ 1500 3750
Wire Wire Line
	1500 4150 1500 4250
Text GLabel 1250 5250 0    50   Input ~ 0
CNT2
$Comp
L Device:R R3
U 1 1 5DF238CC
P 1500 5000
F 0 "R3" H 1430 4954 50  0000 R CNN
F 1 "1K" H 1430 5045 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 1430 5000 50  0001 C CNN
F 3 "~" H 1500 5000 50  0001 C CNN
	1    1500 5000
	-1   0    0    1   
$EndComp
$Comp
L Device:R R4
U 1 1 5DF238D2
P 1500 5500
F 0 "R4" H 1430 5454 50  0000 R CNN
F 1 "1K" H 1430 5545 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 1430 5500 50  0001 C CNN
F 3 "~" H 1500 5500 50  0001 C CNN
	1    1500 5500
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5DF238D8
P 1500 5750
F 0 "#PWR04" H 1500 5500 50  0001 C CNN
F 1 "GND" H 1505 5577 50  0000 C CNN
F 2 "" H 1500 5750 50  0001 C CNN
F 3 "" H 1500 5750 50  0001 C CNN
	1    1500 5750
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR03
U 1 1 5DF238DE
P 1500 4800
F 0 "#PWR03" H 1500 4650 50  0001 C CNN
F 1 "+3.3V" H 1515 4973 50  0000 C CNN
F 2 "" H 1500 4800 50  0001 C CNN
F 3 "" H 1500 4800 50  0001 C CNN
	1    1500 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 5250 1500 5250
Wire Wire Line
	1500 5250 1500 5150
Wire Wire Line
	1500 4850 1500 4800
Wire Wire Line
	1500 5350 1500 5250
Connection ~ 1500 5250
Wire Wire Line
	1500 5650 1500 5750
Text GLabel 4200 2050 2    50   Input ~ 0
SWIM
Wire Wire Line
	4000 2050 4200 2050
Text GLabel 4200 2250 2    50   Input ~ 0
LEARN
Wire Wire Line
	4000 2250 4200 2250
$Comp
L Connector:Conn_01x02_Male LEARN1
U 1 1 5DF38860
P 4650 800
F 0 "LEARN1" H 4756 978 50  0000 C CNN
F 1 "Conn_01x02_Male" H 4756 887 50  0000 C CNN
F 2 "Connector_JST:JST_EH_B02B-EH-A_1x02_P2.50mm_Vertical" H 4650 800 50  0001 C CNN
F 3 "~" H 4650 800 50  0001 C CNN
	1    4650 800 
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR015
U 1 1 5DF38B20
P 5000 800
F 0 "#PWR015" H 5000 650 50  0001 C CNN
F 1 "+3.3V" V 5015 928 50  0000 L CNN
F 2 "" H 5000 800 50  0001 C CNN
F 3 "" H 5000 800 50  0001 C CNN
	1    5000 800 
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5DF38D8F
P 5050 1200
F 0 "R6" H 4980 1154 50  0000 R CNN
F 1 "1K" H 4980 1245 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 4980 1200 50  0001 C CNN
F 3 "~" H 5050 1200 50  0001 C CNN
	1    5050 1200
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5DF38E53
P 5050 1500
F 0 "#PWR016" H 5050 1250 50  0001 C CNN
F 1 "GND" H 5055 1327 50  0000 C CNN
F 2 "" H 5050 1500 50  0001 C CNN
F 3 "" H 5050 1500 50  0001 C CNN
	1    5050 1500
	1    0    0    -1  
$EndComp
Text GLabel 5150 900  2    50   Input ~ 0
LEARN
Wire Wire Line
	4850 900  5050 900 
Wire Wire Line
	5050 1050 5050 900 
Connection ~ 5050 900 
Wire Wire Line
	5050 900  5150 900 
Wire Wire Line
	4850 800  5000 800 
Wire Wire Line
	5050 1500 5050 1350
$Comp
L power:+12V #PWR010
U 1 1 5DF4EDAE
P 2600 5150
F 0 "#PWR010" H 2600 5000 50  0001 C CNN
F 1 "+12V" H 2615 5323 50  0000 C CNN
F 2 "" H 2600 5150 50  0001 C CNN
F 3 "" H 2600 5150 50  0001 C CNN
	1    2600 5150
	1    0    0    -1  
$EndComp
Text GLabel 2600 5550 0    50   Input ~ 0
lamp4_out
Text GLabel 2600 5450 0    50   Input ~ 0
lamp3_out
Text GLabel 2600 5350 0    50   Input ~ 0
lamp2_out
Wire Wire Line
	2600 5350 2750 5350
Wire Wire Line
	2600 5450 2750 5450
Wire Wire Line
	2600 5550 2750 5550
Wire Wire Line
	2750 5250 2600 5250
Wire Wire Line
	2600 5250 2600 5150
$Comp
L Connector:Screw_Terminal_01x02 IN1
U 1 1 5DF6CABB
P 2950 4350
F 0 "IN1" H 3030 4342 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 3030 4251 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-2_P5.00mm" H 2950 4350 50  0001 C CNN
F 3 "~" H 2950 4350 50  0001 C CNN
	1    2950 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5DF6CB90
P 2600 4550
F 0 "#PWR09" H 2600 4300 50  0001 C CNN
F 1 "GND" H 2605 4377 50  0000 C CNN
F 2 "" H 2600 4550 50  0001 C CNN
F 3 "" H 2600 4550 50  0001 C CNN
	1    2600 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR08
U 1 1 5DF6CBE5
P 2600 4200
F 0 "#PWR08" H 2600 4050 50  0001 C CNN
F 1 "+12V" H 2615 4373 50  0000 C CNN
F 2 "" H 2600 4200 50  0001 C CNN
F 3 "" H 2600 4200 50  0001 C CNN
	1    2600 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 4350 2600 4350
Wire Wire Line
	2600 4350 2600 4200
Wire Wire Line
	2750 4450 2600 4450
Wire Wire Line
	2600 4450 2600 4550
Connection ~ 8650 3800
Wire Wire Line
	8650 3800 8650 4050
NoConn ~ 7000 2700
$Comp
L power:GND #PWR018
U 1 1 5DFAF7AA
P 6050 2800
F 0 "#PWR018" H 6050 2550 50  0001 C CNN
F 1 "GND" H 6055 2627 50  0000 C CNN
F 2 "" H 6050 2800 50  0001 C CNN
F 3 "" H 6050 2800 50  0001 C CNN
	1    6050 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 2700 6050 2700
Wire Wire Line
	6050 2700 6050 2800
Wire Wire Line
	1250 1150 2000 1150
$Comp
L Device:LED D2
U 1 1 5DED1403
P 2300 1850
F 0 "D2" H 2291 2066 50  0000 C CNN
F 1 "LED" H 2291 1975 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 2300 1850 50  0001 C CNN
F 3 "~" H 2300 1850 50  0001 C CNN
F 4 "TO-3216BC-MYF" H 2300 1850 50  0001 C CNN "Field4"
	1    2300 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R15
U 1 1 5DED14DF
P 1850 1850
F 0 "R15" H 1780 1804 50  0000 R CNN
F 1 "68" H 1780 1895 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 1780 1850 50  0001 C CNN
F 3 "~" H 1850 1850 50  0001 C CNN
	1    1850 1850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR030
U 1 1 5DED15D5
P 1450 1900
F 0 "#PWR030" H 1450 1650 50  0001 C CNN
F 1 "GND" H 1455 1727 50  0000 C CNN
F 2 "" H 1450 1900 50  0001 C CNN
F 3 "" H 1450 1900 50  0001 C CNN
	1    1450 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1900 1450 1850
Wire Wire Line
	1450 1850 1700 1850
Wire Wire Line
	2150 1850 2000 1850
$Comp
L Device:Q_PMOS_GSD Q2
U 1 1 5DF05E66
P 8550 1500
F 0 "Q2" H 8756 1546 50  0000 L CNN
F 1 "IRFR5505TRLPBF" H 8756 1455 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 8750 1600 50  0001 C CNN
F 3 "~" H 8550 1500 50  0001 C CNN
	1    8550 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 2200 6050 2200
Wire Wire Line
	6050 2200 6050 2100
Connection ~ 6050 2100
Wire Wire Line
	6050 2100 5800 2100
Wire Wire Line
	5800 2300 6050 2300
Wire Wire Line
	5800 2500 6050 2500
Wire Wire Line
	6200 2400 6050 2400
Wire Wire Line
	6050 2400 6050 2300
Connection ~ 6050 2300
Wire Wire Line
	6050 2300 6200 2300
Wire Wire Line
	6200 2600 6050 2600
Wire Wire Line
	6050 2600 6050 2500
Connection ~ 6050 2500
Wire Wire Line
	6050 2500 6200 2500
Wire Wire Line
	7000 2200 7100 2200
Wire Wire Line
	7100 2200 7100 2100
Connection ~ 7100 2100
Wire Wire Line
	7100 2100 7300 2100
Wire Wire Line
	7000 2300 7100 2300
Wire Wire Line
	7000 2400 7100 2400
Wire Wire Line
	7100 2400 7100 2300
Connection ~ 7100 2300
Wire Wire Line
	7100 2300 7300 2300
Wire Wire Line
	7000 2500 7100 2500
Wire Wire Line
	7000 2600 7100 2600
Wire Wire Line
	7100 2600 7100 2500
Connection ~ 7100 2500
Wire Wire Line
	7100 2500 7300 2500
$Comp
L Connector:Screw_Terminal_01x04 J1
U 1 1 5DF53380
P 2950 5350
F 0 "J1" H 3030 5342 50  0000 L CNN
F 1 "Screw_Terminal_01x04" H 3030 5251 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-4_1x04_P5.00mm_Horizontal" H 2950 5350 50  0001 C CNN
F 3 "~" H 2950 5350 50  0001 C CNN
	1    2950 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 1850 2450 1850
NoConn ~ 2800 1650
NoConn ~ 2800 1750
NoConn ~ 2800 2650
NoConn ~ 2800 2750
NoConn ~ 4000 2150
NoConn ~ 4000 2350
NoConn ~ 4000 2450
NoConn ~ 4000 2550
$EndSCHEMATC
