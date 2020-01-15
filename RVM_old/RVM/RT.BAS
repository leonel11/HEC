10 DIM TG(90,25):DIM TB(90,25):DIM PG(90,25):DIM PB(90,25)
20 DIM T(30):DIM P(30):DIM T1(90):DIM P1(90)
30 DIM QOG(90,30):DIM QOG1(90,30):DIM QOGS(90,30):DIM QB(90,30):DIM QB1(90,30):DIM QBS(90,30)
40 DIM RE(90,30):DIM REB(90,30):DIM RE1(30):DIM REB1(90)
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
170 COLOR 14,1:LOCATE 13,26:PRINT "Для начала расчета введите "
175 LOCATE 14,26:PRINT "только Вам известный код?";
178 QZ$=INPUT$ (3)
180 IF QZ$="MOK" THEN 197 ELSE 182
182 COLOR 7,1:CLS:KEY OFF
190 COLOR 14,1:LOCATE 14,25:PRINT "Поскольку код Вам неизвестен,"
191 LOCATE 15,29:PRINT "программа заблокирована !"
192 LOCATE 16,21:PRINT "Для выхода в DOS нажмите любую клавишу"
194 A$=INKEY$
195 IF A$="" THEN 194
196 SYSTEM
197 CLS:KEY OFF
198 INPUT "            Введите дату:";DAT$
200 PRINT
210 INPUT "            номер варианта-";VAR$
220 PRINT
230 PRINT
240 INPUT "   БУДЕТЕ ИСПРАВЛЯТЬ ИСХОДНЫЕ ДАННЫЕ?  да - 1, нет - ввод";U
250 IF U=1 THEN 290 ELSE 260
260 OPEN "C:\rt.dat " FOR INPUT AS #2
270 INPUT #2,GG,TG,PG,DEG,NEG,NKY,LG,SG,FG,FEG,GB,TB,PB,DEB,NEB,NKE,LB,ME,BETACT,HPG,FPG,HN,SB,FB
280 CLOSE 2:GOTO 618
290 PRINT SPC(25);"ВВЕДИТЕ ИСХОДНЫЕ ДАННЫЕ:"
300 PRINT SPC(10);"ПО ГОРЯЧЕЙ СТОРОНЕ: "
310 INPUT "     массовый расход теплонос. (кг), Gг= ",GG
320 INPUT "     температ. теплоносителя ,град   tг= ",TG
330 INPUT "     абс.давл.теплоносителя,(кгс/кв.см) Рг= ",PG
340 INPUT "     эквивалентный диаметр ,(м)     dэг= ",DEG
350 INPUT "     число элементов в пакете ,(шт) Nэг= ",NEG
360 INPUT "     число каналов.в 1-ом элем.(шт) Nку= ",NKY
370 INPUT "     длина хода теплоносит.в яч.(м) Lэг= ",LG
380 INPUT "    площ.сечения, (кв.м),           Sг= ",SG
390 INPUT "    площ.поверхн. с ребрами, (кв.м), Fг= ",FG
400 INPUT "    площ.поверхн. без ребер, (кв.м), Fэг= ",FEG
410 PRINT SPC(10);"ПО ХОЛОДНОЙ СТОРОНЕ: "
420 INPUT "     массовый расход теплонос. (кг), Gв= ",GB
430 INPUT "     температ. теплоносителя ,град   tв= ",TB
440 INPUT "     абс.давл.теплоносителя,(кгс/кв.см) Рв= ",PB
450 INPUT "     эквивалентный диаметр, (м)     dэв= ",DEB
460 INPUT "     число элементов в пакете, (шт) Nэв= ",NEB
470 INPUT "     число канал.в 1-ом элем.  (шт) Nкэ= ",NKE
480 INPUT "     длина хода теплоносит.    (м)  Lэв= ",LB
490 INPUT "    площ.сечения по холодн.сторон.(кв.м),Sв= ",SB
500 INPUT "    площ.поверхн.по холодн. сторон.(кв.м), Fв= ",FB
510 PRINT SPC(10);"ОБЩИЕ ДАННЫЕ: "
520 INPUT "     масса одн. элем.без ребер(кг)   Мэ= ",ME
530 INPUT "     толщина стенки  (м)            бст= ",BETACT
540 INPUT "     высота ребра    (м)            hрг= ",HPG
550 INPUT "     относит.высота ребра (м)       fрг= ",FPG
560 INPUT "     1/4 перим.основн.поверхн.(м)    hn= ",HN
570 GOSUB 580:GOTO 618
580
OPEN "C:\rt.dat " FOR OUTPUT AS #2
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
592 PRINT#2,USING "###.###";GB
593 PRINT#2,USING "###";TB
594 PRINT#2,USING "#####";PB
595 PRINT#2,USING "##.###^^^^";DEB
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
618 PRINT SPC(25);"ВВЕДИТЕ СРЕДУ ТЕПЛОНОСИТЕЛЕЙ:"
620 INPUT "          ПО ГОРЯЧЕЙ СТОРОНЕ: 1 - воздух; 2 - вода; 3 - масло ";CPED1
630 INPUT "          ПО ХОЛОДНОЙ СТОРОНЕ: 1 - воздух; 2 - вода; 3 - масло ";CPED2
640 PRINT SPC(25);"ВВЕДИТЕ МАТЕРИАЛ ЭЛЕМЕНТОВ:"
650 INPUT "          Сталь 12Х18Н10Т - 1;  алюм.- 2;  cталь углер. - 3. ";MATEP
660 FOR K=1 TO NKY
670 TG(0,K)=TG:PG(0,K)=PG
680 NEXT K
690 FOR I=1 TO NKE
700 TB(I,0)=TB:PB(I,0)=PB
710 QOG(I,0)=0:QB(I,0)=0
720 NEXT I
730 QOGS(0,NKY)=0:QBS(0,NKY)=0
740 FOR I=1 TO NKE
750 FOR K=1 TO NKY
760 IF CPED1=1 THEN 770 ELSE 800
770 TGP=TG(I-1,K)+273.1
780 PG1=PG(I-1,K)
790 ROG=PG1/(29.27*TGP):TG1=TG(I-1,K):GOTO 830
800 TG1=TG(I-1,K)
802 IF CPED1=2 THEN 810 ELSE 805
805 ROG=-.64303*TG1+921.067:GOTO 820
810 ROG=1001.67-TG1*.163947-(TG1^2)*.002619
820 TGP=TG(I-1,K)+273.1:PG1=PG(I-1,K)
830 WG=GG/(ROG*NEG*NKY*SG)
835 IF CPED1=1 THEN 840 ELSE 855
840 MUG=(17.0579+(TG1*.055383)-(TG1^2*7.38713E-05)+(TG1^3*9.3917E-08))/1000000!
850 NJG=MUG/ROG
851 PRG=.706703-(TG1*1.4958E-04)-(TG1^2*1.32215E-06)+(TG1^3*1.43419E-08)-(TG1^4*4.71376E-11)+(TG1^5*5.17353E-14)
852 LAMG=(7.26633E-03*TG1+2.46078)/100:GOTO 895
855 IF CPED1=2 THEN 857 ELSE 880
857 NJG=(1.78311-.05548*TG1+.001*TG1^2-9.2918E-6*TG1^3+3.3508E-8*TG1^4)/1000000
860 LAMG=(.560797+.0019284*TG1-7.07446E-6*TG1^2)
865 PRG=13.4443-.467137*TG1+.008843*TG1^2-8.3934E-5*TG1^3+3.05653E-7*TG1^4:GOTO 895
880 NJG=(592818*TG1^(-2.348241))/1000000
882 LAMG=(-6.9091E-5*TG1+.1288)
885 PRG=4527230*TG1^(-2.18017)
895 RE(I,K)=(WG*DEG)/NJG
897 IF CPED1=3 THEN 898 ELSE 900
898 NUG=.408*RE(I,K)^(.5846)*PRG^(.43)*(0.5)^.25:GOTO 910
900 NUG=(.001888)*RE(I,K)^(1.1717)*PRG^(.43)
910 KSIG1=.3
930 ALFAG=(NUG*LAMG)/DEG
940 IF CPED2=1 THEN 950 ELSE 970
950 TBP=TB(I,K-1)+273.1:PB1=PB(I,K-1)
960 ROB=PB1/(29.27*TBP):TB1=TB(I,K-1):GOTO 1000
970 TB1=TB(I,K-1)
975 IF CPED2=2 THEN 980 ELSE 985
980 ROB=1001.67-TB1*.163947-(TB1^2)*.002619:GOTO 990
985 ROB=-.64303*TB1+921.067
990 TBP=TB(I,K-1)+273.1
1000 WB=GB/(ROB*NKE*NEB*SB)
1005 IF CPED2=1 THEN 1010 ELSE 1025
1010 LAMB=(7.26633E-03*TB1+2.46078)/100
1015 MUB=(17.0579+(TB1*.055383)-(TB1^2*7.38713E-05)+(TB1^3*9.3917E-08))/1000000!
1017 NJB=MUB/ROB
1020 PRB=.706703-(TB1*1.4958E-04)-(TB1^2*1.32215E-06)+(TB1^3*1.43419E-08)-(TB1^4*4.71376E-11)+(TB1^5*5.17353E-14):GOTO 1055
1025 IF CPED2=2 THEN 1027 ELSE 1035
1027 LAMB=.560797+.0019284*TB1-7.0746E-6*TB1^2
1029 NJB=(1.78311-.05548*TB1+.001*TB1^2-9.2918E-6*TB1^3+3.3508E-8*TB1^4)/1000000
1032 PRB=13.4443-.467137*TB1+.008843*TB1^2-8.3934E-5*TB1^3+3.05653E-7*TB1^4:GOTO 1055
1035 LAMB=-6.9091E-5*TB1+1.76927
1037 NJB=(592818*TB1^(-2.34824))/1000000
1040 PRB=4527230*TB1^(-2.18017)
1055 REB(I,K)=(WB*DEB)/NJB
1060 NUB=.11613*REB(I,K)^.7148*PRB^.43
1070 ALFAB=(NUB*LAMB)/DEB
1080 FI=ALFAG/ALFAB
1090 DELTG=(TG1-TB1)/(1+FI)
1100 TCT=TG1-DELTG
1110 IF MATEP=1 THEN 1140
1120 IF MATEP=2 THEN 1150
1130 IF MATEP=3 THEN 1160
1140 LAMCT=.0140857*TCT+14.82:MAT$="Ст.12Х18Н10Т":GOTO 1170
1150 LAMCT=152.702+(.599547*TCT)-(4.50183E-03*TCT^2)+(TCT^3*1.37909E-05)-(TCT^4*1.42909E-08):MAT$="Алюминий":GOTO 1170
1160 LAMCT=-.0475*TCT+65.09:MAT$="Ст.углер.":GOTO 1170
1170 DELTCT=(ALFAG*DELTG*BETACT)/LAMCT
1180 DELTSUM=TG1-TB1
1190 DELTG=(DELTSUM-DELTCT)/(1+FI)
1200 DELTB=(DELTSUM-DELTCT)*FI/(1+FI)
1210 IF CPED1=2 THEN 1390 ELSE 1220
1220 MG=(2*ALFAG/(LAMCT*BETACT))^.5
1230 E1=EXP(MG*HPG):E2=EXP(-MG*HPG)
1240 TH(MH)=(E1-E2)/(E1+E2)
1250 PSIPG=TH(MH)/(MG*HPG)
1260 BH=((ALFAG+ALFAB)/(LAMCT*BETACT))^.5*HN
1270 EX1=EXP(BH):EX2=EXP(-BH):THBH=(EX1-EX2)/(EX1+EX2)
1280 PSIN=(THBH)/BH
1290 FPG=HPG/HN
1300 QPG=((TG1-TB1)*ALFAG*HN*FPG*PSIN*4*.01)/(PSIPG*FPG+PSIN*(FI+1))
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
1410 DELTNG=DELTG-BETATN
1420 DELTNB=DELTB+BETATN
1430 QNG=ALFAG*FEG*DELTNG
1440 QOG(I,K)=QNG+QPG
1450 QB(I,K)=ALFAB*FB*DELTNB
1452 IF CPED1=1 THEN 1455 ELSE 1460
1455 CPG=1.00546-(TG1*1.55415E-04)+(TG1^2*6.82078E-06)-(TG1^3*9.803309E-08)+(TG1^4*6.71777E-10)-(TG1^5*2.06063E-12)+(TG1^6*2.31421E-15):GOTO 1465
1460 IF CPED1=2 THEN 1462 ELSE 1464
1462 CPG=4.21085-(TG1*.0020377)+(TG1^2*3.08919E-05)-(TG1^3*9.615539E-08):GOTO 1465
1464 CPG=1.76927+.00352424*TG1
1465 IF CPED2=1 THEN 1467 ELSE 1470
1467 CPB=1.00546-(TB1*1.55415E-04)+(TB1^2*6.82078E-06)-(TB1^3*9.803309E-08)+(TB1^4*6.71777E-10)-(TB1^5*2.06063E-12)+(TB1^6*2.31421E-15):GOTO 1480
1470 IF CPED2=2 THEN 1472 ELSE 1475
1472 CPB=4.21085-(TB1*.0020377)+(TB1^2*3.08919E-05)-(TB1^3*9.615539E-08):GOTO 1480
1475 CPB=1.76927+.00352424*TB1
1480 MGE=GG/(NEG*NKY):MBE=GB/(NEB*NKE)
1490 BETATG=QOG(I,K)/(CPG*MGE*1000)
1500 BETATB=QB(I,K)/(CPB*MBE*1000)
1510 DELPG=(LG*KSIG1*ROG*WG^2)/(DEG*2*9.810001)
1520 KSIB=.419834*REB(I,K)^(-.110047)
1530 DELPB=(LB*KSIB*ROB*WB^2)/(DEB*2*9.810001)
1540 PG(I,K)=PG1-DELPG
1550 TG(I,K)=TG1-BETATG
1560 PB(I,K)=PB1-DELPB
1570 TB(I,K)=TB1+BETATB
1580 QOG1(I,K)=QOG1(I,K-1)+QOG(I,K)
1590 QB1(I,K)=QB1(I,K-1)+QB(I,K)
1600 NEXT K
1610 NEXT I
1620 T(0)=0:P(0)=0:RE1(0)=0
1630 FOR K=1 TO NKY
1640 T(K)=T(K-1)+TG(NKE,K)
1650 P(K)=P(K-1)+PG(NKE,K)
1660 RE1(K)=RE1(K-1)+RE(NKE,K)
1670 NEXT K
1680 TGSR=T(NKY)/NKY
1690 PGSR=P(NKY)/NKY
1700 RESR=RE1(NKY)/NKY
1710 T1(0)=0:P1(0)=0:REB1(0)=0
1720 FOR I=1 TO NKE
1730 T1(I)=T1(I-1)+TB(I,NKY)
1740 P1(I)=P1(I-1)+PB(I,NKY)
1750 REB1(I)=REB1(I-1)+REB(I,NKY)
1760 QOGS(I,NKY)=QOGS(I-1,NKY)+QOG1(I,NKY)
1770 QBS(I,NKY)=QBS(I-1,NKY)+QB1(I,NKY)
1780 NEXT I
1790 TBSR=T1(NKE)/NKE
1800 PBSR=P1(NKE)/NKE
1810 REBSR=REB1(NKE)/NKE
1820 DLTPG=PG(0,1)-PGSR: DLTPB=PB(1,0)-PBSR
1830 DPG=PGSR/PG(0,1)
1840 DPB=PBSR/PB(1,0)
1850 E=(TB(1,0)-TBSR)/(TB(1,0)-TG(0,1))
1860 REM   Подгот.данных для печати
1870 NKYP=LG*NKE*1000:DEGP=DEG*1000:SGP=SG*1000000!:NKYR=NKY*10:DEBP=DEB*1000:SBP=SB*1000000!:BETACTP=BETACT*1000
1880 QOGP=QOGS(NKE,NKY)*NEG/1000:QBP=QBS(NKE,NKY)*NEB/1000
1890 FGP=(NKE*NKY*NEG)*FG:FBP=(NKE*NKY*NEB)*FB:FSUM=FGP+FBP
1900 BETACT1=BETACT*1000
1909 OPEN "C:\rt.rez " FOR OUTPUT AS #10
1910
PRINT#10,SPC(20);"РАСЧЕТ ТЕПЛООБМЕННИКА "
1920 IF CPED1=1 AND CPED2=1 GOTO 1950
1930 IF CPED1=1 AND CPED2=2 GOTO 1960
1940 IF CPED1=2 AND CPED2=1 GOTO 1970
1950 PRINT#10,SPC(20);"ТИПА 'воздух-воздух'":GOTO 1980
1960 PRINT#10,SPC(20);"ТИПА 'воздух-вода'":GOTO 1980
1970 PRINT#10,SPC(20);"ТИПА 'вода-воздух'":GOTO 1980
1980 PRINT#10,:PRINT#10,
1990 PRINT#10,TAB(2);"Вариант-";VAR$;
2000 PRINT#10,TAB(43);"   ''РУТА'' "
2010 PRINT#10,TAB(2);"Дата - ";DAT$;
2020 PRINT#10,TAB(43);"  Мухачев В.А."
2030 PRINT#10,TAB(43);"  Губайдуллин Б.Т."
2040 PRINT#10,:PRINT#10,
2050 PRINT#10,TAB(2);"ИСХОДНЫЕ ПАРАМЕТРЫ:"
2060 PRINT#10,TAB(2);"По стороне наддувочного воздуха"
2070 PRINT#10,USING "   Расход ................................(кг/с)     #.###";GG
2080 PRINT#10,USING "   Давление...............................(кг/кв.м)  #####";PG
2090 PRINT#10,USING "   Температура............................(град.С)   ###.##";TG
2100 PRINT#10,
2110 PRINT#10,TAB(2);"По стороне охлаждающего воздуха"
2120 PRINT#10,USING "   Расход ................................(кг/с)     #.###";GB
2130 PRINT#10,USING "   Давление...............................(кг/кв.м)  #####";PB
2140 PRINT#10,USING "   Температура............................(град.С)  ###.##";TB
2150 PRINT#10,
2160 PRINT#10,TAB(2);"КОНСТРУКТИВНЫЕ ПАРАМЕТРЫ:"
2170 PRINT#10,"   Количество элементов в пакете .........шт        ";NEG
2180 PRINT#10,"   Количество трубчатых канал.в элемен....шт        ";NKE
2190 PRINT#10,USING "   Длина хода наддувочн.воздуха...........мм         ###";NKYP
2200 PRINT#10,USING "   Гидравлический диаметр.................мм        ##.##";DEGP
2210 PRINT#10,USING "   Площадь сечения канала ................кв.мм     ###.##";SGP
2220 PRINT#10,USING "   Длина хода охлажд.воздуха..............мм        ###";NKYR
2230 PRINT#10,USING "   Гидравлический диаметр.................мм        ##.##";DEBP
2240 PRINT#10,USING "   Площадь сечения канала.................кв.мм     ###.##";SBP
2250 PRINT#10,"   Суммарная площадь поверхности:"
2260 PRINT#10,USING "   по стороне наддув.воздуха..............(кв.м)     ###.##";FGP
2270 PRINT#10,USING "   по стороне охлажд.воздуха..............(кв.м)     ###.##";FBP
2280 PRINT#10,USING "   общая..................................(кв.м)     ###.##";FSUM
2290 PRINT#10,
2300 PRINT#10, "   Материал:";MAT$
2310 PRINT#10,USING "   Толщина (мм.):  #.####";BETACT1
2320 PRINT#10,:PRINT
2330 PRINT#10,TAB(2);"РЕЗУЛЬТАТЫ РАСЧЕТА:"
2340 PRINT#10,USING "   Температ.(средн.)надд.возд.на выходе...(град.С)  ###.##";TGSR
2345 PRINT#10,USING "   Температура (средн.) газа на выходе....(град.С)  ###.##";TBSR
2350 PRINT#10,USING "   Степень регенерации....................(%)        #.###";E
2360 PRINT#10, "   Потери давления:"
2370 PRINT#10, "    по стороне наддув.воздуха"
2380 PRINT#10,USING "   абсолютные.............................(кг/кв.м)  #####";DLTPG
2390 PRINT#10,USING "   относительные..........................(%)        #.###";DPG
2400 PRINT#10,"     по стороне охлажд.воздуха"
2410 PRINT#10,USING "   абсолютные.............................(кг/кв.м)  #####";DLTPB
2420 PRINT#10,USING "   относительные..........................(%)        #.###";DPB
2430 PRINT#10, "   Суммарный теплосъем:"
2440 PRINT#10,USING "    по стороне наддув.воздуха.............(квт)     ###.##";QOGP
2450 PRINT#10,USING "    по стороне охлажд.воздуха.............(квт)     ###.##";QBP
2460 PRINT#10, "   Число Рейнольдса:"
2470 PRINT#10,USING  "   на входе по надд.воздуху.................        ######.#";RE(1,1)
2480 PRINT#10,USING  "   на входе по охлажд.воздуху................        ######.#";REB(1,1)
2490 PRINT#10,USING  "   среднее на выходе по надд.возд............        ######.#";RESR
2500 PRINT#10,USING  "   среднее на выходе по охлажд.возд..........        ######.#";REBSR
2501 CLOSE
2505 END

