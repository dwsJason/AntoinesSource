0  ONERR  GOTO 10000
1  POKE 791,32
5  REM   CLUBHOUSE, COPYRIGHT 1981, LESLIE M. GRIMM 
10 B$ = "FIRST VARIABLE DEFINED"
12 YY = 16777:XX = 16778:CC = 16779:WM = 16779: REM  LINE, COLUMN, COLOR, WHICH MOPPET
14 LG = 16384:SG = 16387:MG = 16390: REM  LARGE, SMALL, AND MOPPET GENERATORS
16  POKE 232,76: POKE 233,3: SCALE= 1: ROT= 0:SQUARE = 1:EX = 2: REM   SHAPES
24  DIM PP(17),RU(3),X(17),Y(17):HCOLR = 7: SCALE= 1: ROT= 0
26  FOR I = 1 TO 8:X(I) = 19 + 28 * I: NEXT I: FOR I = 9 TO 16:X(I) = X(I - 8): NEXT I
28  FOR I = 1 TO 8:Y(I) = 0: NEXT I: FOR I = 9 TO 16:Y(I) = 32: NEXT I
30  DIM XC(9),YC(9): REM  MOPPETS IN CLUBHOUSE  
32 X = 12: FOR I = 1 TO 4:XC(I) = X:XC(I + 4) = X:YC(I) = 128:YC(I + 4) = 160:X = X + 4: NEXT 
34  DIM XP(17),YP(17): REM  LOCATIONS OF MOPPETS AT TOP OF SCREEN
36 X = 4: FOR I = 1 TO 8:YP(I) = 32:YP(I + 8) = 64:XP(I) = X:XP(I + 8) = X:X = X + 4: NEXT 
40  DIM PP$(18):PP$(1) = "GGBG":PP$(2) = "GMBG":PP$(3) = "GGBB":PP$(4) = "GMBB":PP$(5) = "PGBB":PP$(6) = "PMBB":PP$(7) = "PGBG":PP$(8) = "PMBG"
42 PP$(9) = "GGRG":PP$(10) = "GMRG":PP$(11) = "GGRB":PP$(12) = "GMRB":PP$(13) = "PGRB":PP$(14) = "PMRB":PP$(15) = "PGRG":PP$(16) = "PMRG"
48  DIM RU$(9):RU$(1) = "GRANDS":RU$(2) = "PETITS":RU$(3) = "GROS":RU$(4) = "MINCES":RU$(5) = "ROUGES":RU$(6) = "BLEUS":RU$(7) = "BIBBITS":RU$(8) = "GRIBBITS"
50  GOSUB 3000
60  HOME : PRINT : PRINT "VEUX-TU DES INSTRUCTIONS? (O OU N) ";
62  GOSUB 80: IF  ASC (IN$) = 27 THEN  GOSUB 130:IN$ = "": GOTO 60
64  IF IN$ <  > "O" AND IN$ <  > "N" THEN 60
66  IF IN$ = "O" THEN  GOSUB 2000
70  HOME : GOTO 1000
80  GET IN$: IF  LEN (IN$) < 1 THEN 80
82  RETURN 
100  GOSUB 80: IF IN$ = "" THEN 100
102  IF  ASC (IN$) = 27 THEN  GOSUB 130:IN$ = "ESC": RETURN 
104  IF IN$ = "?" THEN  GOSUB 2000:IN$ = "?"
106  RETURN 
110  GOSUB 80: IF  ASC (IN$) <  > 27 AND  ASC (IN$) <  > 13 AND IN$ <  > "?" THEN 110
112  IF IN$ = "?" THEN  GOSUB 2000: POKE  - 16304,0: POKE 34,20
114  IF  ASC (IN$) = 27 THEN  GOSUB 130
116  RETURN 
130  HOME : PRINT "VEUX-TU T'ARRETER ? (O/N) ";
132  GOSUB 80: IF IN$ <  > "O" AND IN$ <  > "N" THEN 132
134  IF IN$ = "O" THEN  GOTO 1500
136  RETURN 
200  FOR J = 1 TO 16: IF P$ = PP$(J) THEN K = J
202  NEXT J: RETURN 
210  ON RULE GOTO 212,216,220,224,228,232,236,240
212  IF  LEFT$ (P$,1) = "G" THEN FLAG = FLAG + 1
214  RETURN 
216  IF  LEFT$ (P$,1) = "P" THEN FLAG = FLAG + 1
218  RETURN 
220  IF  MID$ (P$,2,1) = "G" THEN FLAG = FLAG + 1
222  RETURN 
224  IF  MID$ (P$,2,1) = "M" THEN FLAG = FLAG + 1
226  RETURN 
228  IF  MID$ (P$,3,1) = "R" THEN FLAG = FLAG + 1
230  RETURN 
232  IF  MID$ (P$,3,1) = "B" THEN FLAG = FLAG + 1
234  RETURN 
236  IF  RIGHT$ (P$,1) = "B" THEN FLAG = FLAG + 1
238  RETURN 
240  IF  RIGHT$ (P$,1) = "G" THEN FLAG = FLAG + 1
242  RETURN 
300  REM  ** PRINTER **
310  POKE XX,X: POKE YY,Y: POKE CC,C: CALL LG: RETURN 
320 C = 3:B$ =  CHR$ (113) + "UELLE":X = 12:Y = 112: GOSUB 310:B$ = "EST":X = 18:Y = 128: GOSUB 310
322 B$ = "MA " + CHR$ (114) + "EGLE ?":X = 14:Y = 144: GOSUB 310: RETURN 
400  REM  ** MOPPET PRINTER **
402  POKE XX,X: POKE YY,Y: POKE WM,M: CALL MG: RETURN 
410 X = 4:Y = 32: FOR I = 0 TO 7
412 M = I: GOSUB 400:X = X + 4: NEXT I
414 X = 4:Y = 64: FOR I = 8 TO 15
416 M = I: GOSUB 400:X = X + 4: NEXT I
420  HCOLOR= 5: FOR I = 68 TO 78: HPLOT 43,I TO 235,I: NEXT : FOR I = 78 TO 159: HPLOT 51,I TO 227,I: NEXT 
422  HCOLOR= 4: HPLOT 147,160 TO 147,120 TO 183,120 TO 183,160: HPLOT 89,144 TO 89,120 TO 125,120 TO 125,144 TO 89,144: HPLOT 43,79 TO 227,79
424  HPLOT 107,144 TO 107,120: HPLOT 89,132 TO 125,132: HPLOT 151,140 TO 151,136 TO 155,136 TO 155,140 TO 151,140: HPLOT 183,127 TO 173,130 TO 183,133: HPLOT 183,147 TO 173,150 TO 183,153
426 B$ =  CHR$ (99) + "LUB":X = 13:Y = 96:C = 3: GOSUB 310
428  RETURN 
440  HCOLOR= 7: FOR I = 0 TO 64 STEP 32: HPLOT 27,I TO 251,I: NEXT I: FOR I = 27 TO 251 STEP 28: HPLOT I,0 TO I,64: NEXT I: RETURN 
450 B$ = "UNE REGLE": GOTO 454
452 B$ = "DEUX REGLES"
454  HCOLOR= 4: FOR I = 80 TO 160: HPLOT 54,I TO 223,I: NEXT 
456 X = 8:Y = 96:C = 7: GOSUB 310
458  RETURN 
500  POKE 768,N: POKE 769,T: CALL 770: RETURN 
510 N = 96:T = 60: GOSUB 500:N = 76:T = 140: GOSUB 500:T = 60: GOSUB 500:T = 60: GOSUB 500:N = 85: GOSUB 500:N = 76: GOSUB 500:N = 72:T = 160: GOSUB 500:N = 76:T = 100: GOSUB 500
512 N = 76:T = 60: GOSUB 500:N = 85:T = 140: GOSUB 500:T = 60: GOSUB 500: GOSUB 500:N = 96: GOSUB 500:N = 85: GOSUB 500:N = 76:T = 140: GOSUB 500:N = 96:T = 180: GOSUB 500
514  RETURN 
520 T = 60:N = 64: GOSUB 500:N = 48:T = 100: GOSUB 500: RETURN 
530 T = 60:N = 64: GOSUB 500:N = 96:T = 100: GOSUB 500: RETURN 
600  POKE 34,20: HOME : PRINT "(APPUIE SUR 'R' POUR DEVINER LA REGLE)": PRINT : PRINT "GRAND OU PETIT ? (G OU P) ";
601  GOSUB 100: IF IN$ = "ESC" OR IN$ = "?" THEN  POKE  - 16304,0: POKE 34,20: GOTO 600
602  IF IN$ = "R" THEN  RETURN 
603  IF IN$ =  CHR$ (8) THEN 600: REM  ARROW
604  IF IN$ <  > "G" AND IN$ <  > "P" THEN 600
606 G1$ = IN$:GA$ = "GRAND": IF G1$ = "P" THEN GA$ = "PETIT"
608  HOME : PRINT GA$: POKE 34,22
610  HOME : PRINT "GROS OU MINCE ? (G OU M) ";
612  GOSUB 100: IF IN$ = "ESC" OR IN$ = "?" THEN  POKE  - 16304,0: POKE 34,20: GOTO 606
613  IF IN$ =  CHR$ (8) THEN 600: REM  ARROW
614  IF IN$ <  > "G" AND IN$ <  > "M" THEN 612
616 G2$ = IN$:GB$ = "GROS": IF G2$ = "M" THEN GB$ = "MINCE"
618  HOME : VTAB 21: PRINT GA$;", ";GB$
620  HOME : PRINT "ROUGE OU BLEU ? (R OU B) ";
622  GOSUB 100: IF IN$ = "ESC" OR IN$ = "?" THEN  POKE  - 16304,0: POKE 34,20: HOME : PRINT GA$;", ";GB$: POKE 34,22: GOTO 620
623  IF IN$ =  CHR$ (8) THEN 600
624  IF IN$ <  > "R" AND IN$ <  > "B" THEN 622
626 G3$ = IN$:GC$ = "ROUGE": IF G3$ = "B" THEN GC$ = "BLEU"
628  HOME : VTAB 21: PRINT GA$;", ";GB$;", ";GC$
630  HOME : PRINT "BIBBIT OU GRIBBIT? (B OU G) ";
632  GOSUB 100: IF IN$ = "ESC" OR IN$ = "?" THEN  POKE  - 16304,0: POKE 34,20: HOME : PRINT GA$;", ";GB$;", ";GC$: POKE 34,22: GOTO 630
633  IF IN$ =  CHR$ (8) THEN 600: REM  ARROW  
634  IF IN$ <  > "B" AND IN$ <  > "G" THEN 632
636 G4$ = IN$:GD$ = "BIBBIT": IF G4$ = "G" THEN GD$ = "GRIBBIT"
638  HOME : VTAB 21: PRINT GA$;", ";GB$;", ";GC$;" ";GD$
640 GUESS$ = G1$ + G2$ + G3$ + G4$: RETURN 
900 Z = 1: IF  RND (1) < .5 THEN Z = 2
901  RETURN 
902 Z = 3: IF  RND (1) < .5 THEN Z = 4
903  RETURN 
904 Z = 5: IF  RND (1) < .5 THEN Z = 6
905  RETURN 
906 Z = 7: IF  RND (1) < .5 THEN Z = 8
907  RETURN 
1000  HGR :Z =  FRE (0):CO = 0:CT = 0: POKE 34,20: FOR I = 1 TO 16:PP(I) = 0: NEXT I: GOSUB 410: GOSUB 440
1020 A =  INT ( RND (1) * 4) + 1:B =  INT ( RND (1) * 4) + 1: IF A = B THEN 1020
1022  ON A GOSUB 900,902,904,906:A = Z: ON B GOSUB 900,902,904,906:B = Z:RU(1) = A:RU(2) = B
1030  HOME : PRINT "CHOISIS :": PRINT "1. UNE REGLE": PRINT "2. DEUX REGLES": PRINT "TAPE 1 OU 2 : ";: GOSUB 100: IF IN$ = "?" THEN  POKE  - 16304,0: POKE 34,20: GOTO 1030
1032  IF IN$ <  > "1" AND IN$ <  > "2" THEN 1030
1034 IN =  VAL (IN$): HOME :R = 1: IF IN = 2 THEN R = 2
1036  IF R = 1 THEN RU(1) = RU(2): GOSUB 450
1038  IF R = 2 THEN  GOSUB 452
1100  GOSUB 600: IF IN$ = "R" THEN CO = CO + 1: GOTO 1200
1120 P$ = GUESS$:CO = CO + 1: GOSUB 200: IF PP(K) = 1 THEN 1180
1122 PP(K) = 1:RU = RU(1):FLAG = 0: GOSUB 210:RU = RU(2): GOSUB 210: IF FLAG = 2 THEN X = XP(K):Y = YP(K):M = 16: GOSUB 400:CT = CT + 1:X = XC(CT):Y = YC(CT):M = K - 1: GOSUB 400: GOSUB 520
1124  IF FLAG <  > 2 THEN  XDRAW 2 AT X(K),Y(K): GOSUB 530
1126  GOSUB 440:FLAG = 1: FOR I = 1 TO 16: IF PP(I) = 0 THEN FLAG = 0
1128  NEXT I: IF FLAG = 1 THEN 1250
1130  POKE 34,20: GOTO 1100
1180  GOSUB 530: HOME : PRINT "TU AS DEJA ESSAYE CE MOPPET.": VTAB 24: PRINT "APPUIE SUR <RETURN> POUR RE-ESSAYER. ";: GOSUB 110: POKE 34,20: GOTO 1100
1200  GOSUB 4000: IF IN = RU(1) THEN 1300
1202  IF R = 1 THEN 1210
1204  IF I1 <  > RU(1) AND I1 <  > RU(2) THEN 1210
1206  IF I2 = RU(1) OR I2 = RU(2) THEN 1300
1210  GOSUB 530: POKE 34,20: PRINT : HOME : PRINT "DESOLE, CE N'EST PAS MA REGLE.": PRINT "APPUIE SUR <RETURN> POUR CONTINUER. ": GOSUB 110: PRINT : GOTO 1100
1250  GOSUB 530: POKE 34,20: HOME : PRINT "TU AS ESSAYE TOUS LES MOPPETS ! VEUX-TU DEVINER MA REGLE ? (O OU N) ";: GOSUB 100: IF IN$ = "?" THEN  POKE  - 16304,0: POKE 34,20: HOME 
1252  IF IN$ <  > "O" AND IN$ <  > "N" THEN 1250
1254  IF IN$ = "N" THEN 1270
1260  GOSUB 4000: IF IN = RU(1) THEN 1300
1264  IF I1 <  > RU(1) AND I1 <  > RU(2) THEN 1270
1266  IF I2 = RU(1) OR I2 = RU(2) THEN 1300
1270  HOME : PRINT "MA REGLE ETAIT :": PRINT "TOUS LES MOPPETS SONT ";RU$(RU(1));: IF R = 2 THEN  PRINT " ET ";RU$(RU(2));
1272  PRINT ".": GOTO 1310
1300  POKE 34,20: HOME : VTAB 21: PRINT "TU AS RAISON ! ILS SONT TOUS ";RU$(RU(1));: IF R = 2 THEN  PRINT : PRINT " ET ";RU$(RU(2));
1302  PRINT ".": PRINT "TU AS TROUVE EN ";CO - 1;" ESSAI";:IF CO>2 THEN PRINT "S";:PRINT".": GOSUB 510
1310  VTAB 24: HTAB 1: PRINT "VEUX-TU REJOUER ? (O OU N) ";
1312  GET IN$: IF IN$ <  > "O" AND IN$ <  > "N" THEN 1312
1314  IF IN$ = "O" THEN  HOME : GOTO 1000
1500  TEXT : HOME : PRINT : POKE 791,2: PRINT  CHR$ (4);"RUN MENU"
2000  REM   ** INSTRUCTIONS **
2002  TEXT : HOME : VTAB 2: INVERSE : PRINT ">>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<";
2004  VTAB 23: PRINT ">>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<";: NORMAL 
2006  POKE 32,5: POKE 33,30: POKE 34,4: POKE 35,22: REM  WINDOW  
2008  POKE 48,30: VLIN 4,43 AT 0: VLIN 4,43 AT 39: HOME 
2010  PRINT " LE CLUB DES MARIONNETTES !"
2020  PRINT : PRINT "CHOISIS ";: INVERSE : PRINT "UNE REGLE": NORMAL : PRINT "  (LES MOPPETS ";: INVERSE : PRINT "GROS";: NORMAL: PRINT ")": PRINT "OU ";
2022  INVERSE : PRINT "DEUX REGLES": NORMAL : PRINT "  (LES MOPPETS ";: INVERSE : PRINT "GROS";: NORMAL : PRINT " ET ";: INVERSE : PRINT "ROUGES";: NORMAL : PRINT ")"
2030  PRINT : PRINT "POUR JOUER, DECRIS UN MOPPET, S'IL CORRESPOND, IL IRA DANS  LE CLUB. SINON, IL SERA MARQUED'UN X."
2040  PRINT : PRINT "DEVINE LA REGLE EN TAPANT 'R'."
2050  FOR I = 1 TO 2000: NEXT I: POKE  - 16368,0
2052  VTAB 20: PRINT "APPUIE SUR <RETURN> POUR      JOUER. ";
2054  GOSUB 80: IF  ASC (IN$) <  > 27 AND  ASC (IN$) <  > 13 THEN 2054
2056  IF  ASC (IN$) = 27 THEN  GOSUB 130
2060  TEXT : HOME : RETURN 
3000  TEXT : HOME : HGR : POKE 34,20: HOME 
3002  IF  PEEK ( - 16384) = 160 THEN 3060
3010  HCOLOR= 5: FOR I = 84 TO 92: HPLOT 63,I TO 225,I: NEXT I: FOR I = 93 TO 160: HPLOT 68,I TO 220,I: NEXT I
3012  HCOLOR= 4: HPLOT 147,160 TO 147,120 TO 183,120 TO 183,160: HPLOT 89,144 TO 89,120 TO 125,120 TO 125,144 TO 89,144: HPLOT 68,93 TO 220,93
3014  HPLOT 107,144 TO 107,120: HPLOT 89,132 TO 125,132: HPLOT 151,140 TO 151,136 TO 155,136 TO 155,140 TO 151,140: HPLOT 183,127 TO 173,130 TO 183,133: HPLOT 183,147 TO 173,150 TO 183,153
3016  IF  PEEK ( - 16384) = 160 THEN 3060
3020 B$ =  CHR$ (108) + "E " + CHR$(99) + "LUB":X = 14:Y = 20:C = 3: GOSUB 310
3022 B$ =  "DES " + CHR$ (109) + "ARIONNETTES":X = 5:Y = 36: GOSUB 310
3024 B$ = CHR$(114) + "ESERVE":X = 14:Y = 64: GOSUB 310
3026 B$ = "AUX " + CHR$(109) + "EMBRES":X = 10:Y = 80: GOSUB 310
3028  IF  PEEK ( - 16384) = 160 THEN 3060
3030 M = 2:X = 4:Y = 160: GOSUB 400:M = 13:X = 32: GOSUB 400:M = 9:X = 0: GOSUB 400
3040  IF  PEEK ( - 16384) = 160 THEN 3060
3050  GOSUB 510
3060  RETURN 
4000  TEXT : HOME : VTAB 6: HTAB 4: PRINT "1. GRAND";: HTAB 20: PRINT "2. PETIT": PRINT : HTAB 4: PRINT "3. GROS";: HTAB 20: PRINT "4. MINCE"
4010  PRINT : HTAB 4: PRINT "5. ROUGE";: HTAB 20: PRINT "6. BLEU": PRINT : HTAB 4: PRINT "7. BIBBIT";: HTAB 20: PRINT "8. GRIBBIT": POKE 34,18: IF R = 2 THEN 4030
4020  HOME : PRINT "QUELLE EST MA REGLE ? ": PRINT : PRINT "CHOISIS UN CHIFFRE : ";: GOSUB 100: IF IN$ = "?" THEN  GOTO 4000
4022 IN =  VAL (IN$): IF IN < 1 OR IN > 8 THEN 4020
4024  GOTO 4050
4030  HOME : PRINT "QUELLE EST L'UNE DE MES REGLES ?": PRINT : PRINT "CHOISIS UN CHIFFRE : ";: GOSUB 100: IF IN$ = "?" THEN 4000
4032 IN =  VAL (IN$): IF IN < 1 OR IN > 8 THEN 4030
4034 I1 = IN: PRINT  STR$ (IN): POKE 34,22
4036  HOME : PRINT "CHOISIS LE CHIFFRE D'UNE AUTRE REGLE : ";: GOSUB 100: IF IN$ = "?" THEN  GOTO 4000
4038 IN =  VAL (IN$): IF IN < 1 OR IN > 8 THEN 4036
4040 I2 = IN: PRINT  STR$ (IN): IF IN = I1 THEN  HOME : PRINT "OUPS ! TU AS DEJA CHOISI ";I1: GOTO 4036
4044 IN = 0
4050  TEXT : POKE  - 16301,0: POKE  - 16304,0: POKE 34,20: RETURN 
10000  CALL 37632
