     0  REM [HEX:\
85,89,89,89,89,89,89,89,\
89,89,89,89,89,89,89,89,\
89,89,89,89,89,89,05,00,\
82,00,00,00,00,00,00,00,\
88,05,88,88,88,88,00,31,\
26,00,32,26,2E,38,34,33,\
00,88,88,88,88,85,88,00,\
80,82,00,00,00,00,00,00,\
88,05,88,88,00,29,3A,00,\
35,37,34,2B,2A,38,38,2A,\
3A,37,00,88,88,85,88,00,\
80,80,82,00,00,00,00,00,\
88,05,88,88,88,88,88,00,\
2B,34,31,2E,27,3A,38,00,\
88,88,88,88,88,85,88,00,\
80,80,80,05,00,00,00,00,\
85,8A,8A,8A,8A,8A,8A,8A,\
8A,8A,8A,8A,8A,8A,8A,8A,\
8A,8A,8A,8A,8A,8A,05,00,\
80,80,07,00,00,00,00,00,\
00,00,35,37,34,2C,37,26,\
32,32,2A,00,2A,28,37,2E,\
39,00,35,26,37,00,00,00,\
80,07,00,00,00,00,00,00,\
00,00,00,00,00,26,31,26,\
2E,33,00,27,37,2A,2C,2A,\
34,33,00,00,00,00,00,00,\
07,00,00,00,00,00,00,00,\
00,00,35,34,3A,37,00,32,\
2E,28,37,34,16,38,3E,38,\
39,2A,32,2A,38,1B,00,76,\
76,2A,16,40,ED,4B,7B,40,\
23,7E,FE,76,CA,5B,00,CB,\
7F,28,F5,0B,78,B1,20,F0,\
23,7E,CB,7F,20,0D,FE,0C,\
28,0F,FE,01,20,02,3E,0B,\
D7,18,ED,CB,BF,D7,C3,5B,\
00,ED,5B,0E,40,1A,FE,76,\
28,DE,3E,00,D7,13,18,F5,\
11,82,40,01,04,06,ED,43,\
7B,40,D5,CD,F5,08,D1,62,\
6B,01,17,00,D5,CD,6B,0B,\
D1,EB,01,20,00,09,EB,ED,\
4B,7B,40,04,ED,43,7B,40,\
78,FE,0E,28,02,18,DB,01,\
07,06,ED,43,7B,40,C9 ]

   1 REM LES LIGNES 10 A 6040   \
          ET 9000 A 9999 ONT    \
    ETE REPRODUITES DE L"OUVRAGE\
      "LE PETIT LIVRE DU ZX81"  \
 (D"APRES �THE ZX81 POCKET BOOK"\
   DE PHIPPS ASSOCIATES) AVEC L"\
 AUTORISATION D"EDITIONS DU PSI
 3 GOSUB 8699
 4 SAVE"FOLIBUS2"
 5 RAND USR 16826
 6 FOR Z=0 TO 1000
 7 NEXT Z
 8 POKE 16508,0
 9 CLS
10 DIM S(10)
15 DIM C(5)
20 LET O=20
30 LET SALLE=1
40 DIM P$(2,2)
50 DIM O(O)
60 FOR X=1 TO O
70 LET O(X)=Q(X)
80 NEXT X
90 RAND
100 IF NOT S(2) THEN GOTO 200
110 IF C(2) THEN LET C(2)=C(2)-1
120 IF S(3) THEN GOTO 200
130 PRINT "ON N�Y VOIT RIEN,MIEUX VAUDRAIT","ALLUMER POUR EVITER LES ENNUIS."
140 IF C(3) THEN LET C(3)=C(3)-1
150 GOTO 1000
200 REM DESCRIPTION DE LA SALLE
210 PRINT,,
220 POKE 16507,SALLE
230 PRINT USR 16763;"�\
VOUS ETES DEVANT UNE MAISON�\
LA PORTE EST OUVERTE�\
VOUS ETES DANS UN COULOIR,IL Y A\
UNE PORTE A L�EST ET UNE PORTE�\
A L�OUEST�\
VOUS ETES DANS UN SALON,IL Y A�\
UNE PORTE A L�OUEST�\
IL Y A UNE DROLE D�ODEUR�\
IL Y A UNE GROSSE MACHINE QUI�\
RESSEMBLE A 1 GENERATRICE AVEC  \
UN BOUTON VERT, UN BOUTON ROUGE \
IL Y A UNE PORTE AU NORD�\
UNE MACHINERIE D�ASCENCEUR,UNE�\
PORTE AU NORd\
IL Y A PLEIN DE MATERIEL�\
VOUS ETES DANS UN ASCENCEUR.IL Y\
 A UN BOUTON HAUT,UN BOUTON BAs\
L�ASCENCEUR VIENT DE S�ARRETER�\
LA PIECE EST HUMIDE,IL Y A DES�\
FILS QUI TRAINENT PAR TERRE IL Y\
A UNE FENETRE ET UNE PORTE AU N�\
LA PORTE VIENT DE SE REFERMER.  \
BONJOUR..�\
COMMENT ECRIVEZ VOUS CECI�\
EN 4 LETTREs\
VOUS ETES DANS UNE MACHINE A�\
REMONTER LE TEMPS 3 BOUTONS:�\
PASSE,PRESENT ET AVENIr\
VOUS VOUS RETROUVEZ DANS LE�\
LABORATOIRE DU PROFESSEUR.IL Y A\
UNE PORTE EN FER A L�OUEST�\
PORTE AU SUD MARQUE DANGER�\
IL Y A UNE DOUCHE,UN TROU DANS�\
LE SOl\
IL Y A UN CUBE NOIR D�AU MOINS�\
UNE TONNE,UNE ECHELLE MONTE.UNE \
PORTE A L�ESt\
VOUS ETES DANS UNE BIBLIOTHEQUe\
VOUS ETES DANS UNE SOUCOUPE SUR \
UNE TERRASSe"
240 PRINT
300 LET F=0
310 FOR X=1 TO O
320 IF O(X)<>SALLE THEN GOTO 500
330 IF F THEN GOTO 400
340 PRINT
345 PRINT ,,"IL Y A AUSSI:"
350 LET F=1
400 PRINT "    ";O$(X)
500 NEXT X
#
1000 REM ACCEPTATION DE LA COMMANDE
1010 LET T=1
1020 GOTO 2000
1100 IF C(1) THEN LET C(1)=C(1)-1
1110 IF C(4) THEN LET C(4)=C(4)-1
1120 PRINT
1125 PRINT ,,"QUE FAITES-VOUS? >"
1130 INPUT Y$
1140 CLS
1150 LET Y=0
1160 PRINT ">";Y$
1170 LET P$(2)="00"
1200 FOR W=1 TO 2
1210 GOSUB 6000
1220 IF Y>=LEN Y$ THEN GOTO 1300
1230 IF P$(W)="00" THEN GOTO 1210
1240 NEXT W
1300 IF P$(1)<>"00" THEN GOTO 1600
1310 PRINT "PARDON?"
1320 GOTO 100
1600 REM CONTROLE DU MOUVEMENT
1610 LET Z=1
1620 LET T$=M$(SALLE)(Z TO Z+1)
1630 IF T$="00" THEN GOTO 1900
1640 IF T$<>P$(1) THEN GOTO 1700
1650 LET SALLE=VAL(M$(SALLE)(Z+2 TO Z+3))
1660 GOTO 100
1700 LET Z=Z+4
1710 GOTO 1620
1900 LET T=0
1910 LET CORRESP=0
2000 REM COTROLE DES CONDITIONS
2010 LET CP=0
2100 LET CP=CP+1
2110 IF NOT T THEN GOTO 2300
2120 LET E$=C$(CP)
2130 GOTO 2600
2300 IF CP<=A THEN GOTO 2400
2310 IF CORRESP THEN GOTO 1000
2320 PRINT"IMPOSSIBLE";
2330 IF VAL(P$(1))<13 THEN PRINT" DE PRENDRE CETTE","DIRECTION";
2340 PRINT "."
2350 GOTO 100
2400 IF A$(CP)(1 TO 2)<>P$(1) THEN GOTO 2100
2410 LET Y$=A$(CP)(3 TO 4)
2420 IF Y$<>"00" AND Y$<>P$(2) THEN GOTO 2100
2430 LET E$=A$(CP)(5 TO)
2600 REM CONDITIONS
2610 LET E=1
2700 IF E$(E)="." THEN GOTO 3000
2710 LET TYPE=CODE(E$(E))-38
2720 LET N=VAL(E$(E+1 TO E+2))
#
2800 GOSUB 2900+TYPE*10
#
2810 IF NOT OK THEN GOTO 2100
2820 LET E=E+3
2830 GOTO 2700

# A NN: SI NOUS SOMMES DANS LA SALLE NN

2900 LET OK=(N=SALLE)
2905 RETURN

# B NN: SI L OBJET NN EST PRESENT OU TRANSPORTE

2910 LET OK=(O(N)=SALLE OR O(N)<0)
2915 RETURN

# C NN: SI L OBJET NN EST NON PRESENT OU NON TRANSPORTE

2920 LET OK=(O(N)<>SALLE AND O(N)>=0)
2925 RETURN

# D NN: SI L OBJET NN EST TRANSPORTE

2930 LET OK=(O(N)<0)
2935 RETURN

# E NN: SI LE POINTEUR NN EST ACTIVE

2940 LET OK=S(N)
2945 RETURN

# F NN: SI LE POINTEUR NN N EST PAS ACTIVE

2950 LET OK=(NOT S(N))
2955 RETURN

# G NN: SI LE COMPTEUR NN A ATTEINT LA VALEUR 1

2960 LET OK=(C(N)=1)
2965 RETURN

# H NN: SI LE NOMBRE ALEATOIRE (1-99) EST INFERIEUR A NN

2970 LET OK=((INT(RND*100)+1)<=N)
2975 RETURN

3000 REM ACTIONS
3010 LET CORRESP=1
3020 LET E=E+1
3100 IF E$(E)="." THEN GOTO 2100
3110 LET TYPE=CODE(E$(E))-38
3120 IF E$(E+1)<>"." THEN LET N=VAL(E$(E+1 TO E+2))
3200 LET BREAK=0
###
3210 GOSUB 4000+TYPE*100
###
3220 IF BREAK THEN GOTO BREAK
3230 LET E=E+3
3240 GOTO 3100

# A NN: SI NOUS SOMMES DANS LA SALLE NN
## 4000 GOSUB 2910
## 4010 RETURN

### B NN : TRANSPORTES OBJETS NN

### OBJET DANS L'INVENTAIRE
## 4100 IF O(N)=-1 THEN GOTO 4110
## 4102 IF Q(SALLE)=0 THEN GOTO 4110
## 4103 LET OK=1
## 4105 RETURN
## 4110 PRINT "UN QUOI?"
## 4120 LET BREAK=100
## 4130 RETURN
4100 IF S(1)<5 THEN GOTO 4140
4110 PRINT "VOUS NE POUVEZ PORTER PLUS"
4120 LET BREAK=100
4130 RETURN
4140 IF O(N)=-1 THEN GOTO 4180
4150 LET O(N)=-1
4160 LET S(1)=S(1)+1
4170 RETURN
4180 PRINT "VOUS L�AVEZ DEJA"
4190 GOTO 4120

### C NN : POSE OBJETS NN

4200 IF O(N)=-1 THEN GOTO 4240
4210 PRINT "VOUS N�AVEZ PAS ";O$(N)
4220 LET BREAK=100
4230 RETURN
4240 LET O(N)=SALLE
4250 LET S(1)=S(1)-1
4260 RETURN

### D NN : AFFICHE LE MESSAGE EN 7000+(NN*10)

4300 POKE 16507,N
4310 PRINT USR 16763;"�\
LA GENERATRICE VIENT D�EXPLOSER \
LA MAISON N�EXISTE PLUS,VOUS NON\
PLUS�\
L�ASCENSSEUR NE BOUGE PAS.�\
IL FAUT PEUT ETRE DU COURANT�\
LA PORTE VIENT DE SE FERMER�\
IMPOSSIBLE DE L�OUVRIr\
VOUS AVEZ RAISON.LA CURIOSITE�\
EST UN VILAIN DEFAUT..�\
L�ODEUR QUE VOUS SENTIEZ ETAIT�\
CELLE D�UN GAZ EXPLOSIF.VOUS�\
ETES MORT�\
IL FAUDRAIT PEUT ETRE DU FEU..�\
AH,AH...VOUS ETES PRISONNIEr\
VOUS AVEZ DIT PAPIER?QUEL PAPIEr\
BRAVEZ LES INTERDITS�\
ELLE A L�AIR DE S�EMBALLER..�\
LA GENERATRICE SE MET EN MARCHe\
IMPOSSIBLE,ELLE NE VEUT RIEN�\
SAVOIR�\
BRAVO,JE NE SAVAIS PAS QUE VOUS�\
AVIEZ DES DONS D�ELECTRICIEN�\
VOTRE MACHINE EST REPAREE.MAIS�\
ELLE SENT LE CHAUD�\
LA MACHINE EST REPAREE.DOMMAGE�\
QU�IL N�Y AIT PAS DE COURANT�\
IL FAUDRAIT PEUT-ETRE DES OUTILs\
L�ASCENSEUR SEMBLE MONTER..�\
L�ASCENSEUR NE BOUGE PAs\
LE CABLE VIENT DE CASSER.VOUS�\
VOUS ECRASEZ EN BAS:MORt\
IL FAIT NOIR.IL FAUT ALLUMEr\
VOUS VOUS ECRASEZ AU SOl\
IL Y A UNE CLEF�\
LA PORTE EST FERMEE A CLEf\
TIENS,LA PORTE DU PLACARD SE�\
REFERME�\
LA GENERATRICE VIENT D�EXPLOSER,\
L�ASCENSSEUR EST DETRUIT.�\
VOUS EN ECHAPPEZ DE JUSTESSe\
VOUS ETES MORT ELECTROCUTe\
VOUS AVEZ RAISON,RIEN NE SERT DE\
COURRIR�\
DEHORS IL FAIT NOIR,ON NE VOIT  \
PAS LE SOL�\
C�EST DEJA FAIT�\
VOUS ETES AU BOUT DE LA CORDE�\
VRAIMENT PAS AU POINT CETTE�\
MACHINE.�\
VOUS ETES MORt\
IL FAUDRAIT PEUT ETRE OUVRIR LA \
FENETRE�\
TANT PIS.ON A ESSAYE�\
BRAVO,QUEL TRAIT DE GENIE�\
UNE TRAPPE S�OUVRE SOUS VOS�\
PIEDS.VOUS ETES MORT�\
SAGE PRECAUTION�\
C�EST DU POISON.VOUS ETES MORT�\
VOUS APPRENEZ A PILOTER UNE�\
SOUCOUPE EN 1 LECOn\
CA NE SE PILOTE PAS COMME Ca\
C�EST DE L�ACIDE.�VOUS ETES MORT�\
IL Y A DE L�EAU.VOUS VOUS NOYEz\
OUF,VOUS VOUS RETROUVEZ DEHORS.�\
SAIN ET SAUF..�\
CA MARCHE...MAIS IL N�Y AVAIT�\
PAS ASSEZ DE CARBURANT�\
MAIS,VOUS ETES TOUT BLEU�\
CE DOIT ETRE LES PILLULEs\
ET IRRADIE.VOUS MOUREZ AU BOUT�\
DE QUELQUES JOURs"
4315 PRINT
4320 RETURN

### E NN : ACTIVE LE POINTEUR NN

4400 LET S(N)=1
4410 RETURN

### F NN : DESACTIVE LE POINTEUR NN

4500 LET S(N)=0
4510 RETURN

### G NNMM : FIXE LE COMPTEUR (-) NN A MM

4600 LET C(N)=VAL (E$(E+3 TO E+4))
4610 LET E=E+2
4620 RETURN

### H NN : INVERSE LES LIGNES NN ET NN+1 DANS LE TABEAU OBJET

4700 LET X=O(N)
4710 LET O(N)=O(N+1)
4720 LET O(N+1)=X
4730 RETURN

### I NN : POSE OBJET NN DANS LA SALLE EN COURS

4800 LET O(N)=SALLE
4810 RETURN

### J NN : MET LE NO DE SALLE CONTENANT L OBJET NN A 0

4900 IF O(N)<0 THEN LET S(1)=S(1)-1
4910 LET O(N)=0
4920 RETURN

### K NN : FIXE LE NO DE SALLE EN COURS A LA VALEUR NN

5000 LET SALLE=N
5010 RETURN

### L    : AFFICHE D ACCORD ET ATTEND

5100 PRINT "D�ACCORD."

### M    : ATTEND UNE NOUVELLE COMMANDE MAIS RESANNE LE TABLEAU DES ACTIONS

5200 LET BREAK=1000
5210 RETURN

### N    : ATTEND UNE NOUVELLE COMMANDE

5300 LET BREAK=1100
5310 RETURN

### O    : AFFICHE LA DESCRIPTION DE LA SALLE EN COURS

5400 LET BREAK=100
5410 RETURN

### P    : ETES VOUS SURE ? >>> STOP

5500 PRINT "ETES VOUS SUR ?";
5510 INPUT W$
5520 PRINT W$ 
5530 IF CHR$ CODE W$<>"O" THEN RETURN

### Q    : STOP

5600 GOTO 9999

### R    : INVENTAIRE
###  AFFICHE LA LISTE DES OBJETS TRANSPORTES
### 
5700 PRINT
5710 PRINT "VOUS TENEZ:"
5720 LET F=1
5730 FOR X=1 TO O
5740 IF O(X)>=0 THEN GOTO 5770
5750 PRINT "   ";O$(X)
5760 LET F=0
5770 NEXT X
5780 IF F THEN PRINT ,"RIEN."
5790 LET BREAK=100
5795 RETURN

### S PRENDRE UN OBJET
5800 IF S(1)<5 THEN GOTO 4140
5810 PRINT "VOUS NE POUVEZ PORTER PLUS"
5820 LET BREAK=100
5830 RETURN
5840 IF O(N)=-1 THEN GOTO 4180
5850 LET O(N)=-1
5860 LET S(1)=S(1)+1
5870 RETURN
5880 PRINT "VOUS L�AVEZ DEJA"
5890 GOTO 4120

6000 REM ANALYSE LE MOT
6010 DIM W$(4)
6015 LET P$(W)="00"
6020 GOSUB 6600
6025 IF FIN THEN RETURN
6030 FOR Q=1 TO 4
6040 LET W$(Q)=Y$(Y)
6050 GOSUB 6500
6060 IF FIN THEN GOTO 6100
6070 NEXT Q
6080 GOSUB 6500
6090 IF NOT FIN THEN GOTO 6080
6100 IF W$="    " THEN RETURN
6110 FOR Q=1 TO V
6120 IF W$=V$(Q)(3 TO) THEN GOTO 6200
6130 NEXT Q
6140 RETURN
6200 LET P$(W)=V$(Q)(TO 2)
6210 RETURN
6500 LET Y=Y+1
6510 LET FIN=(Y>LEN Y$)
6520 IF FIN THEN RETURN
6530 LET FIN=(Y$(Y)=" ")
6540 RETURN
6600 LET Y=Y+1
6610 LET FIN=(Y>LEN Y$)
6620 IF FIN THEN RETURN
6630 IF Y$(Y)=" " THEN GOTO 6600
6640 RETURN
8699 LET V=73
8700 DIM V$(73,6)
8799 LET R=18
8800 DIM M$(18,14)
8819 LET O=20
8899 DIM Q(20)
8900 DIM O$(21,16)
8950 DIM Q(20)
8980 LET C=13
8981 LET CP=0
9000 DIM C$(13,21)
9014 LET A=92
9100 DIM A$(92,31)
9193 RETURN
9997 REM
9998 REM TAPEZ GOTO 10 POUR REJOUER.
9999 LIST 9997
