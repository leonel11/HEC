10 DIM TG(70,25):DIM TB(70,25):DIM PG(70,25):DIM PB(70,25)
20 DIM T(25):DIM P(25):DIM T1(70):DIM P1(70)
30 DIM QOG(70,25):DIM QOG1(70,25):DIM QOGS(70,25):DIM QB(70,25):DIM QB1(70,25):DIM QBS(70,25)
40 DIM RE(70,25):DIM REB(70,25):DIM RE1(25):DIM REB1(70)
50 COLOR 7,1:CLS
60 P$=STRING$(43,219)
70 COLOR 11,1
80 FOR I%=12 TO 17 STEP 1
90 LOCATE I%,19:PRINT P$
100 NEXT I%
110 COLOR 10,1:LOCATE 11,18:PRINT STRING$(43,177)
120 LOCATE 12,18:PRINT CHR$(177)+STRING$(41,32)+CHR$(177)
130 LOCATE 13,18:PRINT CHR$(177)+STRING$(41,32)+CHR$(177)
140 LOCATE 14,18:PRINT CHR$(177)+STRING$(41,32)+CHR$(177)
150 LOCATE 15,18:PRINT CHR$(177)+STRING$(41,32)+CHR$(177)
160 LOCATE 16,18:PRINT STRING$(43,177)
170 COLOR 14,1:LOCATE 13,26:PRINT "��� ��砫� ���� ������ "
175 LOCATE 14,26:PRINT "⮫쪮 ��� ������� ���?";
178 QZ$=INPUT$ (3)
180 IF QZ$="MOK" THEN 197 ELSE 182
182 COLOR 7,1:CLS:KEY OFF
190 COLOR 14,1:LOCATE 14,25:PRINT "��᪮��� ��� ��� �������⥭,"
191 LOCATE 15,29:PRINT "�ணࠬ�� �������஢��� !"
192 LOCATE 16,21:PRINT "��� ��室� � DOS ������ ���� �������"
194 A$=INKEY$
195 IF A$="" THEN 194
196 SYSTEM
197 CLS:KEY OFF
198 INPUT "            ������ ����:";DAT$
200 PRINT
210 INPUT "            ����� ��ਠ��-";VAR$
220 PRINT
230 PRINT
240 INPUT "   ������ ���������� �������� ������?  �� - 1, ��� - ����";U
250 IF U=1 THEN 290 ELSE 260
260 OPEN "C:\mx\vm\rt1 " FOR INPUT AS #2
270 INPUT #2,GG,TG,PG,DEG,NEG,NKY,LG,SG,FG,FEG,GB,TB,PB,DEB,NEB,NKE,LB,ME,BETACT,HPG,FPG,HN,SB,FB
280 CLOSE 2:GOTO 618
290 PRINT SPC(25);"������� �������� ������:"
300 PRINT SPC(10);"�� ������� �������: "
310 INPUT "     ���ᮢ� ��室 ⥯�����. (��), G�= ",GG
320 INPUT "     ⥬����. ⥯�����⥫� ,�ࠤ   t�= ",TG
330 INPUT "     ���.����.⥯�����⥫�,(���/��.�) ��= ",PG
340 INPUT "     ����������� ������� ,(�)     d��= ",DEG
350 INPUT "     �᫮ ������⮢ � ����� ,(��) N��= ",NEG
360 INPUT "     �᫮ �������.� 1-�� ����.(��) N��= ",NKY
370 INPUT "     ����� 室� ⥯������.� ��.(�) L��= ",LG
380 INPUT "    ����.�祭��, (��.�),           S�= ",SG
390 INPUT "    ����.������. � ॡࠬ�, (��.�), F�= ",FG
400 INPUT "    ����.������. ��� ॡ��, (��.�), F��= ",FEG
410 PRINT SPC(10);"�� �������� �������: "
420 INPUT "     ���ᮢ� ��室 ⥯�����. (��), G�= ",GB
430 INPUT "     ⥬����. ⥯�����⥫� ,�ࠤ   t�= ",TB
440 INPUT "     ���.����.⥯�����⥫�,(���/��.�) ��= ",PB
450 INPUT "     ����������� �������, (�)     d��= ",DEB
460 INPUT "     �᫮ ������⮢ � �����, (��) N��= ",NEB
470 INPUT "     �᫮ �����.� 1-�� ����.  (��) N��= ",NKE
480 INPUT "     ����� 室� ⥯������.    (�)  L��= ",LB
490 INPUT "    ����.�祭�� �� 宫���.��஭.(��.�),S�= ",SB
500 INPUT "    ����.������.�� 宫���. ��஭.(��.�), F�= ",FB
510 PRINT SPC(10);"����� ������: "
520 INPUT "     ���� ���. ����.��� ॡ��(��)   ��= ",ME
530 INPUT "     ⮫騭� �⥭��  (�)            ���= ",BETACT
540 INPUT "     ���� ॡ�    (�)            h�= ",HPG
550 INPUT "     �⭮��.���� ॡ� (�)       f�= ",FPG
560 INPUT "     1/4 ��ਬ.�᭮��.������.(�)    hn= ",HN
570 GOSUB 580:GOTO 618
580 OPEN "C:\mx\vm\rt1 " FOR OUTPUT AS #2
582 PRINT#2,USING "##.###";GG
583 PRINT#2,USING "###";TG
584 PRINT#2,USING "#####";PG
585 PRINT#2,USING "#.###^^^^";DEG
586 PRINT#2,USING "###";NEG
587 PRINT#2,USING "###";NKY
588 PRINT#2,USING "#.###^^^^";LG
589 PRINT#2,USING "###.##^^^^";SG
590 PRINT#2,USING "###.##^^^^";FG
591 PRINT#2,USING "###.##^^^^";FEG
592 PRINT#2,USING "#.###";GB
593 PRINT#2,USING "###";TB
594 PRINT#2,USING "#####";PB
595 PRINT#2,USING "#.###^^^^";DEB
596 PRINT#2,USING "###";NEB
597 PRINT#2,USING "###";NKE
598 PRINT#2,USING "#.###^^^^";LB
599 PRINT#2,USING "#.###^^^^";ME
600 PRINT#2,USING "#.###^^^^";BETACT
601 PRINT#2,USING "#.###^^^^";HPG
602 PRINT#2,USING "#.####";FPG
603 PRINT#2,USING "#.###^^^^";HN
604 PRINT#2,USING "###.##^^^^";SB
605 PRINT#2,USING "###.###^^^^";FB
617 CLOSE 2
618 PRINT SPC(25);"������� ����� ��������������:"
620 INPUT "          �� ������� �������: 1 - ������; 2 - ����; 3 - ��᫮ ";CPED1
630 INPUT "          �� �������� �������: 1 - ������; 2 - ����; 3 - ��᫮ ";CPED2
640 PRINT SPC(25);"������� �������� ���������:"
650 INPUT "          �⠫� 12�18�10� - 1;  ���.- 2;  c⠫� 㣫��. - 3. ";MATEP
660 FOR K=1 TO NKY1
670 TG(0,K)=TG:PG(0,K)=PG
680 NEXT K
690 FOR I=1 TO NKE
700 TB(I,0)=TB2(I,NKY2) :PB(I,0)=PB2(I,NKY2)
710 QOG(I,0)=0:QB(I,0)=0
720 NEXT I
730 QOGS(0,NKY1)=0:QBS(0,NKY1)=0
740 FOR I=1 TO NKE
750 FOR K=1 TO NKY1
760 IF CPED1=1 THEN 770 ELSE 800
770 TGP=TG(I-1,K)+273.1
780 PG1=PG(I-1,K)
790 ROG=PG1/(29.27*TGP):TG1=TG(I-1,K):GOTO 830
800 TG1=TG(I-1,K)
810 ROG=1001.67-TG1*.163947-(TG1^2)*.002619
820 TGP=TG(I-1,K)+273.1:PG1=PG(I-1,K)
830 WG=GG/(ROG*NEG*NKY1*SG)
840 MUG=(17.0579+(TG1*.055383)-(TG1^2*7.38713E-05)+(TG1^3*9.3917E-08))/1000000!
850 NJG=MUG/ROG
860 RE(I,K)=(WG*DEG)/NJG
870 PRG=.706703-(TG1*1.4958E-04)-(TG1^2*1.32215E-06)+(TG1^3*1.43419E-08)-(TG1^4*4.71376E-11)+(TG1^5*5.17353E-14)
900 NUG=(.001888)*RE(I,K)^(1.1717)*PRG^(.43)
910 KSIG1=.3
920 LAMG=(7.26633E-03*TG1+2.46078)/100
930 ALFAG=(NUG*LAMG)/DEG
940 IF CPED2=1 THEN 950 ELSE 970
950 TBP=TB(I,K-1)+273.1:PB1=PB(I,K-1)
960 ROB=PB1/(29.27*TBP):TB1=TB(I,K-1):GOTO 1000
970 TB1=TB(I,K-1)
980 ROB=1001.67-TB1*.163947-(TB1^2)*.002619
990 TBP=TB(I,K-1)+273.1
1000 WB=GB/(ROB*NKE*NEB*SB)
1010 LAMB=(7.26633E-03*TB1+2.46078)/100
1020 MUB=(17.0579+(TB1*.055383)-(TB1^2*7.38713E-05)+(TB1^3*9.3917E-08))/1000000!
1030 NJB=MUB/ROB
1040 REB(I,K)=(WB*DEB)/NJB
1050 PRB=.706703-(TB1*1.4958E-04)-(TB1^2*1.32215E-06)+(TB1^3*1.43419E-08)-(TB1^4*4.71376E-11)+(TB1^5*5.17353E-14)
1060 NUB=.11613*REB(I,K)^.7148*PRB^.43
1070 ALFAB=(NUB*LAMB)/DEB
1080 FI=ALFAG/ALFAB
1090 DELTG=(TB1-TG1)/(1+FI)
1100 TCT=TB1-DELTG
1110 IF MATEP=1 THEN 1140
1120 IF MATEP=2 THEN 1150
1130 IF MATEP=3 THEN 1160
1140 LAMCT=.0140857*TCT+14.82:MAT$="��.12�18�10�":GOTO 1170
1150 LAMCT=152.702+(.599547*TCT)-(4.50183E-03*TCT^2)+(TCT^3*1.37909E-05)-(TCT^4*1.42909E-08):MAT$="�����":GOTO 1170
1160 LAMCT=-.0475*TCT+65.09:MAT$="��.㣫��.":GOTO 1170
1170 DELTCT=(ALFAG*DELTG*BETACT)/LAMCT
1180 DELTSUM=TB1-TG1
1190 DELTG=(DELTSUM-DELTCT)/(1+FI)
1200 DELTB=(DELTSUM-DELTCT)*FI/(1+FI)
1210 IF CPED1=2 THEN 1390 ELSE 1220
1220 MG=(2*ALFAG/(LAMCT*BETACT))^.5
1230 E1=EXP(MG*HPG):E2=EXP(-MG*HPG)
1240 THM=(E1-E2)/(E1+E2)
1250 PSIPG=THM/(MG*HPG)
1260 BH=((ALFAG+ALFAB)/(LAMCT*BETACT))^.5*HN
1270 EX1=EXP(BH):EX2=EXP(-BH):THB=(EX1-EX2)/(EX1+EX2)
1280 PSIN=THB/BH
1290 FPG=HPG/HN
1300 QPG=((TB1-TG1)*ALFAG*HN*FPG*PSIN*4*.01)/(PSIPG*FPG+PSIN*(FI+1))
1310 IF MATEP=1 THEN 1340
1320 IF MATEP=2 THEN 1350
1330 IF MATEP=3 THEN 1360
1340 CM=.000244*TCT+.4456:GOTO 1370
1350 CM=1.24-(TCT*.00325)+(TCT^2*.0000205)-(TCT^3*3E-08):GOTO 1370
1360 CM=.4884+(TCT*3.35001E-05)+(TCT^2*7.17857E-07):GOTO 1370
1370 BETATN=QPG/(CM*ME*1000)
1380 GOTO 1410
1390 DELTNG=DELTG
1400 DELTNB=DELTB:GOTO 1430
1410 DELTNG=DELTG+BETATN
1420 DELTNB=DELTB-BETATN
1430 QNG=ALFAG*FEG*DELTNG
1440 QOG(I,K)=QNG+QPG
1450 QB(I,K)=ALFAB*FB*DELTNB
1452 IF CPED1=2 THEN 1455 ELSE 1460
1455 CPG=4.21085-(TG1*.0020377)+(TG1^2*3.08919E-05)-(TG1^3*9.615539E-08):GOTO 1465
1460 CPG=1.00546-(TG1*1.55415E-04)+(TG1^2*6.82078E-06)-(TG1^3*9.803309E-08)+(TG1^4*6.71777E-10)-(TG1^5*2.06063E-12)+(TG1^6*2.31421E-15)
1465 IF CPED2=2 THEN 1467 ELSE 1470
1467 CPB=4.21085-(TG1*.0020377)+(TG1^2*3.08919E-05)-(TG1^3*9.615539E-08):GOTO 1480
1470 CPB=1.00546-(TB1*1.55415E-04)+(TB1^2*6.82078E-06)-(TB1^3*9.803309E-08)+(TB1^4*6.71777E-10)-(TB1^5*2.06063E-12)+(TB1^6*2.31421E-15)
1480 MGE=GG/(NEG*NKY1):MBE=GB/(NEB*NKE)
1490 BETATG=QOG(I,K)/(CPG*MGE*1000)
1500 BETATB=QB(I,K)/(CPB*MBE*1000)
1510 DELPG=(LG*KSIG1*ROG*WG^2)/(DEG*2*9.810001)
1520 KSIB=.419834*REB(I,K)^(-.110047)
1530 DELPB=(LB*KSIB*ROB*WB^2)/(DEB*2*9.810001)
1540 PG(I,K)=PG1-DELPG
1550 TG(I,K)=TG1+BETATG
1560 PB(I,K)=PB1-DELPB
1570 TB(I,K)=TB1-BETATB
1580 QOG1(I,K)=QOG1(I,K-1)+QOG(I,K)
1590 QB1(I,K)=QB1(I,K-1)+QB(I,K)
1600 NEXT K
1610 NEXT I
1620 T(0)=0:P(0)=0:RE1(0)=0
1630 FOR K=1 TO NKY1
1640 T(K)=T(K-1)+TG(NKE,K)
1650 P(K)=P(K-1)+PG(NKE,K)
1660 RE1(K)=RE1(K-1)+RE(NKE,K)
1670 NEXT K
1680 TGSR=T(NKY1)/NKY1
1690 PGSR=P(NKY1)/NKY1
1700 RESR=RE1(NKY1)/NKY1
1710 T1(0)=0:P1(0)=0:REB1(0)=0
1720 FOR I=1 TO NKE
1730 T1(I)=T1(I-1)+TB(I,NKY1)
1740 P1(I)=P1(I-1)+PB(I,NKY1)
1750 REB1(I)=REB1(I-1)+REB(I,NKY1)
1760 QOGS(I,NKY1)=QOGS(I-1,NKY1)+QOG1(I,NKY1)
1770 QBS(I,NKY1)=QBS(I-1,NKY1)+QB1(I,NKY1)
1780 NEXT I
1790 TBSR=T1(NKE)/NKE
1800 PBSR=P1(NKE)/NKE
1810 REBSR=REB1(NKE)/NKE
1820 DLTPG=PG(0,1)-PGSR: DLTPB=PB(1,0)-PBSR
1830 DPG=PGSR/PG(0,1)
1840 DPB=PBSR/PB(1,0)
1850 E=(TG(0,1)-TGSR)/(TG(0,1)-TB(1,0))
1860 REM   ������.������ ��� ����
1870 NKYP=LG*NKE*1000:DEGP=DEG*1000:SGP=SG*1000000!:NKYR=NKY*10:DEBP=DEB*1000:SBP=SB*1000000!:BETACTP=BETACT*1000
1880 QOGP=QOGS(NKE,NKY)*NEG/1000:QBP=QBS(NKE,NKY)*NEB/1000
1890 FGP=(NKE*NKY*NEG)*FG:FBP=(NKE*NKY*NEB)*FB:FSUM=FGP+FBP
1900 BETACT1=BETACT*1000
1910 LPRINT SPC(20);"������ �������������� "
1920 IF CPED1=1 AND CPED2=1 GOTO 1950
1930 IF CPED1=1 AND CPED2=2 GOTO 1960
1940 IF CPED1=2 AND CPED2=1 GOTO 1970
1950 LPRINT SPC(20);"���� '������-������'":GOTO 1980
1960 LPRINT SPC(20);"���� '������-����'":GOTO 1980
1970 LPRINT SPC(20);"���� '����-������'":GOTO 1980
1980 LPRINT :LPRINT
1990 LPRINT TAB(2);"��ਠ��-";VAR$;
2000 LPRINT TAB(43);"   ''����'' "
2010 LPRINT TAB(2);"��� - ";DAT$;
2020 LPRINT TAB(43);"  ���祢 �.�."
2030 LPRINT TAB(43);"  �㡠��㫫�� �.�."
2040 LPRINT :LPRINT
2050 LPRINT TAB(2);"�������� ���������:"
2060 LPRINT TAB(2);"�� ��஭� ����㢮筮�� ������"
2070 LPRINT USING "   ���室 ................................(��/�)     #.###";GG
2080 LPRINT USING "   ��������...............................(��/��.�)  #####";PG
2090 LPRINT USING "   ���������............................(�ࠤ.�)   ###.##";TG
2100 LPRINT
2110 LPRINT TAB(2);"�� ��஭� �嫠����饣� ������"
2120 LPRINT USING "   ���室 ................................(��/�)     #.###";GB
2130 LPRINT USING "   ��������...............................(��/��.�)  #####";PB
2140 LPRINT USING "   ���������............................(�ࠤ.�)  ###.##";TB
2150 LPRINT
2160 LPRINT TAB(2);"�������������� ���������:"
2170 LPRINT "   ������⢮ ������⮢ � ����� .........��        ";NEG
2180 LPRINT "   ������⢮ ������� �����.� ������....��        ";NKE
2190 LPRINT USING "   ����� 室� ����㢮�.������...........��         ###";NKYP
2200 LPRINT USING "   ���ࠢ���᪨� �������.................��        ##.##";DEGP
2210 LPRINT USING "   ���頤� �祭�� ������ ................��.��     ###.##";SGP
2220 LPRINT USING "   ����� 室� �嫠��.������..............��        ###";NKYR
2230 LPRINT USING "   ���ࠢ���᪨� �������.................��        ##.##";DEBP
2240 LPRINT USING "   ���頤� �祭�� ������.................��.��     ###.##";SBP
2250 LPRINT "   �㬬�ୠ� ���頤� �����孮��:"
2260 LPRINT USING "   �� ��஭� �����.������..............(��.�)     ###.##";FGP
2270 LPRINT USING "   �� ��஭� �嫠��.������..............(��.�)     ###.##";FBP
2280 LPRINT USING "   ����..................................(��.�)     ###.##";FSUM
2290 LPRINT
2300 LPRINT  "   ���ਠ�:";MAT$
2310 LPRINT USING "   ���騭� (��.):  #.####";BETACT1
2320 LPRINT :PRINT
2330 LPRINT TAB(2);"���������� �������:"
2340 LPRINT USING "   �������.(�।�.)����.����.�� ��室�...(�ࠤ.�)  ###.##";TGSR
2350 LPRINT USING "   �⥯��� ॣ����樨....................(%)        #.###";E
2360 LPRINT  "   ���� ��������:"
2370 LPRINT  "    �� ��஭� �����.������"
2380 LPRINT USING "   ��᮫���.............................(��/��.�)  #####";DLTPG
2390 LPRINT USING "   �⭮�⥫��..........................(%)        #.###";DPG
2400 LPRINT "     �� ��஭� �嫠��.������"
2410 LPRINT USING "   ��᮫���.............................(��/��.�)  #####";DLTPB
2420 LPRINT USING "   �⭮�⥫��..........................(%)        #.###";DPB
2430 LPRINT  "   �㬬��� ⥯���ꥬ:"
2440 LPRINT USING "    �� ��஭� �����.������.............(���)     ###.##";QOGP
2450 LPRINT USING "    �� ��஭� �嫠��.������.............(���)     ###.##";QBP
2460 LPRINT  "   ��᫮ ��������:"
2470 LPRINT USING  "   �� �室� �� ����.�������.................        ######.#";RE(1,1)
2480 LPRINT USING  "   �� �室� �� �嫠��.�������................        ######.#";REB(1,1)
2490 LPRINT USING  "   �।��� �� ��室� �� ����.����............        ######.#";RESR
2500 LPRINT USING  "   �।��� �� ��室� �� �嫠��.����..........        ######.#";REBSR
2505 END
