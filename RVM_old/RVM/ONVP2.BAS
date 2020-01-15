10 DIM TG2(35,15):DIM TB2(35,15):DIM PG2(35,15):DIM PB2(35,15)
20 DIM T2(15):DIM P(15):DIM T1(35):DIM P1(35)
30 DIM QOG(35,15):DIM QOG1(35,15):DIM QOGS(35,15):DIM QB(35,15):DIM QB1(35,15):DIM QBS(35,15)
40 DIM RE(35,15):DIM REB(35,15):DIM RE2(15):DIM REB2(15)
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
260 OPEN "C:\basbula\tbas\BUL\ud2 " FOR INPUT AS #2
270 INPUT #2,GG,TG2,PG2,DEG,NEG,NKY2,LG,SG,FG,FEG,GB,TB2,PB2,DEB,NEB,NKE,LB,ME,BETACT,HPG,FPG,HN,SB,FB
280 CLOSE 2:GOTO 618
290 PRINT SPC(25);"ВВЕДИТЕ ИСХОДНЫЕ ДАННЫЕ:"
300 PRINT SPC(10);"ПО ГОРЯЧЕЙ СТОРОНЕ: "
310 INPUT "     массовый расход теплонос. (кг), Gг= ",GG
320 INPUT "     температ. теплоносителя ,град   tг= ",TG2
330 INPUT "     абс.давл.теплоносителя,(кгс/кв.см) Рг= ",PG2
340 INPUT "     эквивалентный диаметр ,(м)     dэг= ",DEG
350 INPUT "     число элементов в пакете ,(шт) Nэг= ",NEG
360 INPUT "     число каналов.в 1-ом элем.(шт) Nку= ",NKY2
370 INPUT "     длина хода теплоносит.в яч.(м) Lэг= ",LG
380 INPUT "    площ.сечения, (кв.м),           Sг= ",SG
390 INPUT "    площ.поверхн. с ребрами, (кв.м), Fг= ",FG
400 INPUT "    площ.поверхн. без ребер, (кв.м), Fэг= ",FEG
410 PRINT SPC(10);"ПО ХОЛОДНОЙ СТОРОНЕ: "
420 INPUT "     массовый расход теплонос. (кг), Gв= ",GB
430 INPUT "     температ. теплоносителя ,град   tв= ",TB2
440 INPUT "     абс.давл.теплоносителя,(кгс/кв.см) Рв= ",PB2
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
580 OPEN "C:\basbula\tbas\BUL\UD2 " FOR OUTPUT AS #2
582 PRINT#2,USING "##.###";GG
583 PRINT#2,USING "###";TG2
584 PRINT#2,USING "#####";PG2
585 PRINT#2,USING "#.###^^^^";DEG
586 PRINT#2,USING "###";NEG
587 PRINT#2,USING "###";NKY2
588 PRINT#2,USING "#.###^^^^";LG
589 PRINT#2,USING "###.##^^^^";SG
590 PRINT#2,USING "###.##^^^^";FG
591 PRINT#2,USING "###.##^^^^";FEG
592 PRINT#2,USING "#.###";GB
593 PRINT#2,USING "###";TB2
594 PRINT#2,USING "#####";PB2
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
618 PRINT SPC(25);"ВВЕДИТЕ СРЕДУ ТЕПЛОНОСИТЕЛЕЙ:"
620 INPUT "          ПО ГОРЯЧЕЙ СТОРОНЕ: 1 - воздух; 2 - вода; 3 - масло ";CPED1
630 INPUT "          ПО ХОЛОДНОЙ СТОРОНЕ: 1 - воздух; 2 - вода; 3 - масло ";CPED2
640 PRINT SPC(25);"ВВЕДИТЕ МАТЕРИАЛ ЭЛЕМЕНТОВ:"
650 INPUT "          Сталь 12Х18Н10Т - 1;  алюм.- 2;  cталь углер. - 3. ";MATEP
660 FOR K=1 TO NKY2
670 TG2(NKE,K)=TG2:PG2(NKE,K)=PG2
680 NEXT K
690 FOR I=NKE TO 1 STEP -1
700 TB2(I,0)=TB2:PB2(I,0)=PB2
710 QOG(I,0)=0:QB(I,0)=0
720 NEXT I
730 QOGS(0,NKY2)=0:QBS(0,NKY2)=0
740 FOR I=NKE TO 1 STEP -1
750 FOR K=1 TO NKY2
760 IF CPED1=1 THEN 770 ELSE 800
770 TGP=TG2(I,K)+273.1
780 PG1=PG2(I,K)
790 ROG=PG1/(29.27*TGP):TG1=TG2(I,K):GOTO 830
800 TG1=TG2(I,K)
810 ROG=1001.67-TG1*.163947-(TG1^2)*.002619
820 TGP=TG2(I,K)+273.1:PG1=PG2(I,K)
830 WG=GG/(ROG*NEG*NKY2*SG)
840 MUG=(17.0579+(TG1*.055383)-(TG1^2*7.38713E-05)+(TG1^3*9.3917E-08))/1000000!
850 NJG=MUG/ROG
860 RE(I-1,K)=(WG*DEG)/NJG
870 PRG=.706703-(TG1*1.4958E-04)-(TG1^2*1.32215E-06)+(TG1^3*1.43419E-08)-(TG1^4*4.71376E-11)+(TG1^5*5.17353E-14)
900 NUG=(.001888)*RE(I-1,K)^(1.1717)*PRG^(.43)
910 KSIG1=.3
920 LAMG=(7.26633E-03*TG1+2.46078)/100
930 ALFAG=(NUG*LAMG)/DEG
940 IF CPED2=1 THEN 950 ELSE 970
950 TBP=TB2(I-1,K-1)+273.1:PB1=PB2(I-1,K-1)
960 ROB=PB1/(29.27*TBP):TB1=TB2(I-1,K-1):GOTO 995
970 TB1=TB2(I-1,K-1)
980 ROB=1001.67-TB1*.163947-(TB1^2)*.002619
990 TBP=TB2(I-1,K-1)+273.1
995 PRINT TB1,I
1000 WB=GB/(ROB*NKE*NEB*SB)
1010 LAMB=(7.26633E-03*TB1+2.46078)/100
1020 MUB=(17.0579+(TB1*.055383)-(TB1^2*7.38713E-05)+(TB1^3*9.3917E-08))/1000000!
1030 NJB=MUB/ROB
1040 REB(I-1,K)=(WB*DEB)/NJB
1050 PRB=.706703-(TB1*1.4958E-04)-(TB1^2*1.32215E-06)+(TB1^3*1.43419E-08)-(TB1^4*4.71376E-11)+(TB1^5*5.17353E-14)
1060 NUB=.11613*REB(I-1,K)^.7148*PRB^.43
1070 ALFAB=(NUB*LAMB)/DEB
1080 FI=ALFAB/ALFAG
1090 DELTG=(TB1-TG1)/(1+FI)
1100 TCT=TG1-DELTG
1110 IF MATEP=1 THEN 1140
1120 IF MATEP=2 THEN 1150
1130 IF MATEP=3 THEN 1160
1140 LAMCT=.0140857*TCT+14.82:MAT$="Ст.12Х18Н10Т":GOTO 1170
1150 LAMCT=152.702+(.599547*TCT)-(4.50183E-03*TCT^2)+(TCT^3*1.37909E-05)-(TCT^4*1.42909E-08):MAT$="Алюминий":GOTO 1170
1160 LAMCT=-.0475*TCT+65.09:MAT$="Ст.углер.":GOTO 1170
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
1440 QOG(I-1,K)=QNG+QPG
1450 QB(I-1,K)=ALFAB*FB*DELTNB
1452 IF CPED1=2 THEN 1455 ELSE 1460
1455 CPG=4.21085-(TG1*.0020377)+(TG1^2*3.08919E-05)-(TG1^3*9.615539E-08):GOTO 1465
1460 CPG=1.00546-(TG1*1.55415E-04)+(TG1^2*6.82078E-06)-(TG1^3*9.803309E-08)+(TG1^4*6.71777E-10)-(TG1^5*2.06063E-12)+(TG1^6*2.31421E-15)
1465 IF CPED2=2 THEN 1467 ELSE 1470
1467 CPB=4.21085-(TG1*.0020377)+(TG1^2*3.08919E-05)-(TG1^3*9.615539E-08):GOTO 1480
1470 CPB=1.00546-(TB1*1.55415E-04)+(TB1^2*6.82078E-06)-(TB1^3*9.803309E-08)+(TB1^4*6.71777E-10)-(TB1^5*2.06063E-12)+(TB1^6*2.31421E-15)
1480 MGE=GG/(NEG*NKY2):MBE=GB/(NEB*NKE)
1490 BETATG=QOG(I-1,K)/(CPG*MGE*1000)
1500 BETATB=QB(I-1,K)/(CPB*MBE*1000)
1510 DELPG=(LG*KSIG1*ROG*WG^2)/(DEG*2*9.810001)
1520 KSIB=.419834*REB(I-1,K)^(-.110047)
1530 DELPB=(LB*KSIB*ROB*WB^2)/(DEB*2*9.810001)
1540 PG2(I-1,K)=PG1-DELPG
1550 TG2(I-1,K)=TG1+BETATG
1560 PB2(I-1,K)=PB1-DELPB
1570 TB2(I-1,K)=TB1-BETATB
1580 QOG1(I-1,K)=QOG1(I,K-1)+QOG(I-1,K)
1590 QB1(I-1,K)=QB1(I,K-1)+QB(I-1,K)
1600 NEXT K
1610 NEXT I
1620 T2(0)=0:P2(0)=0:RE2(0)=0
1630 FOR K=1 TO NKY2
1640 T2(K)=T2(K-1)+TG2(NKE,K)
1650 P2(K)=P2(K-1)+PG2(NKE,K)
1660 RE2(K)=RE2(K-1)+RE(NKE,K)
1670 NEXT K
1680 TGSR2=T2(NKY2)/NKY2
1690 PGSR2=P2(NKY2)/NKY2
1700 RESR2=RE2(NKY2)/NKY2
1705 PRINT TGSR2,PGSR2,RESR2
1706 FOR I=NKE TO 1 STEP -1
1707 PRINT TB2(I,NKY2),PB2(I,NKY2)
1710 NEXT I
1715 STOP
1718 T2(0)=0:P2(0)=0:REB2(0)=0
1720 FOR I=NKE TO 1 STEP -1
1730 T2(I)=T2(I-1)+TB2(I,NKY2)
1740 P2(I)=P2(I-1)+PB2(I,NKY2)
1750 REB2(I)=REB2(I-1)+REB(I,NKY2)
1760 QOGS(I,NKY2)=QOGS(I-1,NKY2)+QOG1(I,NKY2)
1770 QBS(I,NKY2)=QBS(I-1,NKY2)+QB1(I,NKY2)
1780 NEXT I
1790 TBSR=T1(NKE)/NKE
1800 PBSR=P1(NKE)/NKE
1810 REBSR=REB1(NKE)/NKE
1820 DLTPG=PG(0,1)-PGSR: DLTPB=PB(1,0)-PBSR
1830 DPG=PGSR/PG(0,1)
1840 DPB=PBSR/PB(1,0)
1850 E=(TG(0,1)-TGSR)/(TG(0,1)-TB(1,0))
1860 REM   Подгот.данных для печати
1870 NKYP=LG*NKE*1000:DEGP=DEG*1000:SGP=SG*1000000!:NKYR=NKY*10:DEBP=DEB*1000:SBP=SB*1000000!:BETACTP=BETACT*1000
1880 QOGP=QOGS(NKE,NKY)*NEG/1000:QBP=QBS(NKE,NKY)*NEB/1000
1890 FGP=(NKE*NKY*NEG)*FG:FBP=(NKE*NKY*NEB)*FB:FSUM=FGP+FBP
1900 BETACT1=BETACT*1000
1910 LPRINT SPC(20);"РАСЧЕТ ТЕПЛООБМЕННИКА "
1920 IF CPED1=1 AND CPED2=1 GOTO 1950
1930 IF CPED1=1 AND CPED2=2 GOTO 1960
1940 IF CPED1=2 AND CPED2=1 GOTO 1970
1950 LPRINT SPC(20);"ТИПА 'воздух-воздух'":GOTO 1980
1960 LPRINT SPC(20);"ТИПА 'воздух-вода'":GOTO 1980
1970 LPRINT SPC(20);"ТИПА 'вода-воздух'":GOTO 1980
1980 LPRINT :LPRINT
1990 LPRINT TAB(2);"Вариант-";VAR$;
2000 LPRINT TAB(43);"   ''РУТА'' "
2010 LPRINT TAB(2);"Дата - ";DAT$;
2020 LPRINT TAB(43);"  Мухачев В.А."
2030 LPRINT TAB(43);"  Губайдуллин Б.Т."
2040 LPRINT :LPRINT
2050 LPRINT TAB(2);"ИСХОДНЫЕ ПАРАМЕТРЫ:"
2060 LPRINT TAB(2);"По стороне наддувочного воздуха"
2070 LPRINT USING "   Расход ................................(кг/с)     #.###";GG
2080 LPRINT USING "   Давление...............................(кг/кв.м)  #####";PG
2090 LPRINT USING "   Температура............................(град.С)   ###.##";TG
2100 LPRINT
2110 LPRINT TAB(2);"По стороне охлаждающего воздуха"
2120 LPRINT USING "   Расход ................................(кг/с)     #.###";GB
2130 LPRINT USING "   Давление...............................(кг/кв.м)  #####";PB
2140 LPRINT USING "   Температура............................(град.С)  ###.##";TB
2150 LPRINT
2160 LPRINT TAB(2);"КОНСТРУКТИВНЫЕ ПАРАМЕТРЫ:"
2170 LPRINT "   Количество элементов в пакете .........шт        ";NEG
2180 LPRINT "   Количество трубчатых канал.в элемен....шт        ";NKE
2190 LPRINT USING "   Длина хода наддувочн.воздуха...........мм         ###";NKYP
2200 LPRINT USING "   Гидравлический диаметр.................мм        ##.##";DEGP
2210 LPRINT USING "   Площадь сечения канала ................кв.мм     ###.##";SGP
2220 LPRINT USING "   Длина хода охлажд.воздуха..............мм        ###";NKYR
2230 LPRINT USING "   Гидравлический диаметр.................мм        ##.##";DEBP
2240 LPRINT USING "   Площадь сечения канала.................кв.мм     ###.##";SBP
2250 LPRINT "   Суммарная площадь поверхности:"
2260 LPRINT USING "   по стороне наддув.воздуха..............(кв.м)     ###.##";FGP
2270 LPRINT USING "   по стороне охлажд.воздуха..............(кв.м)     ###.##";FBP
2280 LPRINT USING "   общая..................................(кв.м)     ###.##";FSUM
2290 LPRINT
2300 LPRINT  "   Материал:";MAT$
2310 LPRINT USING "   Толщина (мм.):  #.####";BETACT1
2320 LPRINT :PRINT
2330 LPRINT TAB(2);"РЕЗУЛЬТАТЫ РАСЧЕТА:"
2340 LPRINT USING "   Температ.(средн.)надд.возд.на выходе...(град.С)  ###.##";TGSR
2350 LPRINT USING "   Степень регенерации....................(%)        #.###";E
2360 LPRINT  "   Потери давления:"
2370 LPRINT  "    по стороне наддув.воздуха"
2380 LPRINT USING "   абсолютные.............................(кг/кв.м)  #####";DLTPG
2390 LPRINT USING "   относительные..........................(%)        #.###";DPG
2400 LPRINT "     по стороне охлажд.воздуха"
2410 LPRINT USING "   абсолютные.............................(кг/кв.м)  #####";DLTPB
2420 LPRINT USING "   относительные..........................(%)        #.###";DPB
2430 LPRINT  "   Суммарный теплосъем:"
2440 LPRINT USING "    по стороне наддув.воздуха.............(квт)     ###.##";QOGP
2450 LPRINT USING "    по стороне охлажд.воздуха.............(квт)     ###.##";QBP
2460 LPRINT  "   Число Рейнольдса:"
2470 LPRINT USING  "   на входе по надд.воздуху.................        ######.#";RE(1,1)
2480 LPRINT USING  "   на входе по охлажд.воздуху................        ######.#";REB(1,1)
2490 LPRINT USING  "   среднее на выходе по надд.возд............        ######.#";RESR
2500 LPRINT USING  "   среднее на выходе по охлажд.возд..........        ######.#";REBSR
2505 END
