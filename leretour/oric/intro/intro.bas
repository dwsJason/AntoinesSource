## BASIC ORIC FILE.
## NAME: GENIUS
##
 10 REM   COPYRIGHT LORICIELS NOV. 84
 11 REM 
 90 TEXT:CALL #2400:DOKE998,10000						; #2400 image Loriciels ?
 95 FOR N=1 TO 10:PING:WAIT 5:NEXT 						; image en $2500
 99 POKE 48036,0							; desti at $B538
 100 POKE #26A,10:CLS:PAPER 0:INK 7						; 3 lignes de $E0 bytes
 105 Z=PEEK(#D000)
 107 IF Z=169 THEN GOSUB 11000
 110 IF Z=169 THEN A$=CHR$(27)+"Q"+CHR$(27)+"J":PRINT CHR$(4):GOTO 125			; Fond rouge, texte blanc
 120 A$=CHR$(27)+"Q"+CHR$(27)+"@"+CHR$(27)+"J":PRINT CHR$(4):GOTO 130			; Police double hauteur
 125 PRINT A$;"Une heure du matin (heure francaise)";:GOTO 140
 130 PRINT A$;" Une heure du matin (heure francaise)";
 135 PRINT:PRINT A$;"sur tous les telex du monde apparait":GOTO 150
 140 PRINT:PRINT:PRINT A$;"sur tous les telex du monde apparait":PRINT 
 145 IF Z=169 THEN PRINT A$;"ce message angoissant...";CHR$(4):GOTO 160
 150 PRINT:PRINT A$;"ce message angoissant...";CHR$(4):GOTO 160
 160 WAIT 550
 200 CLS:PAPER 0:INK 6:POKE 48036,0
 210 A$(1)="  Moi, GENIUS, je defie le monde.J'ai"
 220 A$(2)="invente une nouvelle arme capable de"
 230 A$(3)="raser la terre, ce que je ferais dans"
 240 A$(4)="deux semaines...Mais, comme je ne suis "
 250 A$(5)="pas un monstre, je vous laisse une"
 260 A$(6)="chance. J'accepte que des hommes de"
 270 A$(7)="tout pays se rendent sur mon vaisseau"
 280 A$(8)="en orbite autour de la terre afin de"
 290 A$(9)="tenter de desamorcer mes armes. Mais,"
 300 A$(10)="jamais plus d'un homme a la fois...."
 310 FOR N=1 TO 10:FOR I=1 TO LEN(A$(N)):CALL #2440:PRINT MID$(A$(N),I,1);		; #2440 bip, send 14 bytes to the sound chip
 315 WAIT 5:NEXT I
 320 IF LEN(A$(N))<38 THEN PRINT 
 330 PRINT:NEXT N:WAIT 100
 400 CLS:PAPER 0:INK 3:POKE #30E,64:A=254:S=420					; Affiche un serpent � la Tron
 405 PLAY 1,0,0,0:FOR K=0 TO 7 STEP 2
 410 FOR N=1+K TO 38-K:PLOT N,K,A:SOUND 1,S,10:S=S-1:NEXT N
 420 FOR N=1+K TO 26-K:PLOT 38-K,N,A:SOUND 1,S,10:S=S-1:NEXT N
 430 FOR N=37-K TO 1+K STEP -1:PLOT N,26-K,A:SOUND 1,S,10:S=S-1:NEXT N
 440 FOR N=25-K TO 2+K STEP -1:PLOT 1+K,N,A:SOUND 1,S,10:S=S-1:NEXT N
 450 IF K<>6 THEN PLOT K+2,2+K,254
 460 NEXT K:POKE #30E,192:PING 
 470 PLOT 24,9,8:PLOT 24,10,8:PLOT 25,9,3:PLOT 25,10,3:PLOT 13,9,14:PLOT 13,10,14		; LORICIELS en rouge
 480 PLOT 14,9,1:PLOT 14,10,1:PLOT 15,9,"LORICIELS":PLOT 15,10,"LORICIELS"
 490 PLOT 11,13,"Vous propose ce que":PLOT 13,15,"vous redoutiez"			; le reste en blanc
 500 PLOT 12,17,"depuis longtemps"
 510 WAIT 700
 600 CLS:INK 0:PAPER 3:HIRES:POKE #26A,10:PAPER 3:INK 0:CURSET 12,100,0:FILL 25,1,0		; Ecran jaune de titre
 605 DOKE998,40000							; Le retour du Docteur GENIUS
 610 FILL 25,1,5:FILL 25,1,4:FILL 25,1,1:CALL #51BB:CALL #5200:CALL #528A		; $51BB : affiche Dracula en petit
 630 POKE #21A,145:FOR N=35 TO 210 STEP 5:POKE #219,N:CIRCLE 4,1:NEXT 			; $5200 : 
 640 FOR N=145 TO 195 STEP 5:POKE #21A,N:CIRCLE 4,1:NEXT 				; $528A : installe l'interruption
 650 FOR N=210 TO 35 STEP -5:POKE #219,N:CIRCLE 4,1:NEXT 				; $529C : enl�ve l'interruption
 660 FOR N=195 TO 145 STEP -5:POKE #21A,N:CIRCLE 4,1:NEXT 
 670 A$="Ecrit par Laurent Benes"
 680 B$="Assiste de Karine Le Pors"
 690 FOR N=1 TO LEN(A$):CURSET 48+N*6,155,0:CHAR ASC(MID$(A$,N,1)),0,1:NEXT 
 700 FOR N=1 TO LEN(B$):CURSET 42+N*6,167,0:CHAR ASC(MID$(B$,N,1)),0,1:NEXT 
 710 CURSET 108,155,0:FILL 20,1,12:CURSET 198,155,0:FILL 20,1,8
 720 A$="`: LORICIELS    AOUT 1984"
 730 FOR N=1 TO LEN(A$):CURSET 42+N*6,179,0:CHAR ASC(MID$(A$,N,1)),0,1:NEXT 
 740 WAIT 20:GOSUB 10000						; joue la musique (Toccata & fugue de J.-S. Bach)
 750 CALL #529C:PRINT:PRINT CHR$(4)CHR$(27)"T"CHR$(27)"F"CHR$(27)"J";			; Restore interrupt / Blue paper, Cyan ink
 760 PRINT "3 jours plus tard dans les journaux";				; en double hauteur, en bas de l'�cran
 770 DOKE998,10000:WAIT 300:CLS:CALL #3000					; #3000 La une du Monde
 780 PRINT CHR$(4):WAIT 1000:A=0:X$=KEY$					; data en $3026 sur $2000 octets
 790 A=A+1:IF A=1000 THEN 810
 800 IF KEY$<>"" THEN 810 ELSE 790
 810 TEXT:PAPER 0:INK 3:POKE #26A,10:PRINT:PRINT:POKE 48036,0			; Fond noir, texte jaune
 820 PRINT "  C'est ainsi que vous decidez de"
 830 PRINT "vous rendre aux autorites pour combat-";
 840 PRINT "tre a nouveau le Dr Genius."
 850 PRINT "Le lendemain , on vous emmene au vais-";
 860 PRINT "seau ou vous allez maintenant tenter"
 870 PRINT "de vaincre le Dr Genius afin de sauver";
 880 PRINT "la terre."
 890 PRINT:PRINT:PRINT SPC(10)"BON COURAGE..."
 900 PRINT:PRINT:PRINT "Vous en aurez besoin !"
 910 GOSUB 8000
 920 CLS:PRINT:PRINT "Voici quelques explications";				; Fond noir, texte jaune
 930 PRINT:PRINT "Le jeu est en temps reel,un chronome-"
 940 PRINT "tre sera affiche en permanence."
 950 PRINT "D'autre part, vous devrez prendre"
 960 PRINT "garde a votre energie qui diminuera au";
 970 PRINT "fil de la partie."
 980 PRINT "Attention, plus vous transportez"
 990 PRINT "d'objets, plus votre force decroit."
 1000 PRINT:PRINT "Pour converser avec l'ordinateur,vous"
 1010 PRINT "pouvez utiliser un vocabulaire choisi"
 1020 PRINT "parmi pres de 150 mots que vous allez"
 1030 PRINT "donc decouvrir au fur et a mesure..."
 1040 PRINT "et oui, c'est ca l'aventure."
 1050 PRINT:PRINT "D'autre part, l'ordinateur ne prendra"
 1060 PRINT "en compte que les 4 premieres lettres"
 1070 PRINT "de chaque mot, ainsi: PRENDS CARTON"
 1080 PRINT "sera compris comme:   PREN CART"
 1090 GOSUB 8000:CLS:INK 6						; Fond noir, texte cyan
 1100 PRINT:PRINT "L'ordinateur ne prend en compte en"
 1110 PRINT "general que deux mots, exemple:"
 1120 PRINT "- ALLUME SALLE":PRINT "- EST  ou  E  ou  AVANCE EST"
 1130 PRINT:PRINT "Dans certains cas,l'ordinateur prendra";
 1140 PRINT "en compte trois mots. Il s'agit de cas";
 1150 PRINT "ou un qualificatif est necessaire, ou"
 1160 PRINT "lorsque l'on veut mettre une chose"
 1180 PRINT "dans une autre. Exemple:"
 1190 PRINT:PRINT "PRENDS LIVRE VERT"
 1200 PRINT "PRENDS MOUCHOIR PAPIER"
 1210 PRINT "  ou"
 1220 PRINT "CRAYON DANS BOITE"
 1230 PRINT:PRINT "Ce dernier cas indiquera qu'il faut"
 1240 PRINT "mettre le crayon dans la boite."
 1250 PRINT "a condition que vous possediez crayon"
 1260 PRINT "et boite, evidemment."
 1270 GOSUB 8000:CLS:INK 1						; Fond noir, texte rouge
 1280 PRINT:PRINT "Une derniere chose, il est possible de";
 1290 PRINT "sauver une partie en cours, et de la"
 1300 PRINT "recharger, mais a vous de trouver le"
 1310 PRINT "vocabulaire adequat..."
 1320 PRINT:PRINT:PRINT:PRINT "Et maintenant, tres bonne aventure..."
 1330 PRINT:PRINT "et prenez garde a vous !"
 1340 PRINT:PRINT:PRINT "Tapez une touche pour charger le"
 1350 PRINT "programme de jeu."						; Fond rouge, encre noire
 1380 X$="":GET A$:HIRES:PAPER 1:INK 0:CALL #5100				; #5100 affiche Dracula (le Dr Genius)
 1390 PRINT:PRINT " voulez-vous revoir la presentation                  (O/N)"		; source $2A60
 1400 GET F$							; destination $A004
 1500 IF F$="O" THEN RUN 
 1600 CLS:NEW
 8000 X$=KEY$:PLOT 7,24,"Appuyez sur une touche.":GET A$:RETURN 
 10000 REM 
 10010 REM ***************************
 10020 REM *                         *
 10030 REM *    TOCCATA ET FUGUE     *
 10040 REM *                         *
 10050 REM *       J.S  BACH         *
 10060 REM *                         *
 10070 REM ***************************
 10080 REM 
 10100 FOR N=1 TO 168:READ A1,A2,A3,A4,A5,A6
 10110 MUSIC 1,A1,A2,10:MUSIC 2,A3,A4,10:PLAY A5,0,0,0:WAIT A6*.4:NEXT 
 10120 FOR N=10 TO 1 STEP -1:MUSIC 1,2,3,N:MUSIC 2,3,3,N:PLAY 3,0,0,0:WAIT 6:NEXT 
 10130 PLAY 0,0,0,0:RETURN 
 10200 DATA 4,10,3,10,3,48,1,1,1,1,0,12,4,8,3,8,3,6,4,6,3,6,3,6
 10210 DATA 4,5,3,5,3,6,4,3,3,3,3,6,4,2,3,2,3,12,4,3,3,3,3,24
 10220 DATA 1,1,1,1,0,72,3,10,2,10,3,48,1,1,1,1,0,12,3,5,2,5,3,12
 10230 DATA 3,6,2,6,3,12,3,2,2,2,3,12,3,3,2,3,3,24,1,1,1,1,0,72
 10240 DATA 2,10,1,10,3,48,1,1,1,1,0,12,2,8,1,8,3,6,2,6,1,6,3,6
 10250 DATA 2,5,1,5,3,6,2,3,1,3,3,6,2,2,1,2,3,12,2,3,1,3,3,24
 10260 DATA 1,1,1,1,0,48,3,10,1,1,1,8,3,8,1,1,1,8,3,10,1,1,1,8
 10270 DATA 3,6,1,1,1,8,3,10,1,1,1,8,3,5,1,1,1,8,3,10,1,1,1,8
 10280 DATA 3,3,1,1,1,8,3,10,1,1,1,8,3,2,1,1,1,8,3,10,1,1,1,8
 10290 DATA 3,3,1,1,1,8,3,10,1,1,1,8,3,5,1,1,1,8,3,10,1,1,1,8
 10300 DATA 3,6,1,1,1,8,3,10,1,1,1,8,2,10,1,1,1,8,3,10,1,1,1,8
 10310 DATA 2,12,1,1,1,8,3,10,1,1,1,8,3,2,1,1,1,8,3,10,1,1,1,8
 10320 DATA 3,3,1,1,1,8,3,10,1,1,1,8,3,2,1,1,1,8,3,10,1,1,1,8
 10330 DATA 3,3,1,1,1,8,3,10,1,1,1,8,3,5,1,1,1,8,3,10,1,1,1,8
 10340 DATA 3,6,1,1,1,8,3,6,4,3,3,8,3,7,4,1,3,8,3,7,4,3,3,8
 10350 DATA 3,8,3,11,3,8,3,8,4,3,3,8,3,1,3,10,3,8,3,1,4,3,3,8
 10360 DATA 2,11,3,8,3,8,2,11,4,3,3,8,2,10,3,7,3,8,2,10,4,3,3,8
 10370 DATA 2,11,3,8,3,8,2,11,4,3,3,8,3,1,3,10,3,8,3,1,4,3,3,8
 10380 DATA 3,3,3,11,3,8,3,3,4,3,3,8,2,7,3,3,3,8,2,7,4,3,3,8
 10390 DATA 2,8,3,5,3,8,2,8,4,3,3,8,2,10,3,7,3,8,2,10,4,3,3,8
 10400 DATA 2,11,3,8,3,8,2,11,4,3,3,8,2,10,3,7,3,8,2,10,4,3,3,8
 10410 DATA 2,11,3,8,3,8,2,11,4,3,3,8,2,7,3,10,3,8,2,7,4,3,3,8
 10420 DATA 2,8,3,11,3,8,1,1,3,8,2,8,2,8,4,3,3,8,1,1,3,8,2,8
 10430 DATA 3,3,3,11,3,8,1,1,3,8,2,8,3,3,4,3,3,8,1,1,3,8,2,8
 10440 DATA 3,1,4,4,3,8,1,1,3,4,2,8,3,1,3,8,3,8,1,1,3,8,2,8
 10450 DATA 3,1,4,4,3,8,1,1,3,4,2,8,3,1,3,8,3,8,1,1,3,4,2,8
 10460 DATA 3,1,4,1,3,8,1,1,3,6,2,8,3,1,3,10,3,8,1,1,3,6,2,8
 10470 DATA 3,1,4,1,3,8,1,1,3,6,2,8,3,1,3,10,3,8,1,1,3,6,2,8
 10480 DATA 2,11,4,3,3,8,1,1,3,3,2,8,2,11,3,6,3,8,1,1,3,3,2,8
 10490 DATA 2,11,4,3,3,8,1,1,3,3,2,8,2,11,3,6,3,8,1,1,3,3,2,8
 10500 DATA 2,11,3,11,3,8,1,1,3,5,2,8,2,11,3,8,3,8,1,1,3,5,2,8
 10510 DATA 2,11,3,11,3,8,1,1,3,5,2,8,2,11,3,8,3,8,1,1,3,5,2,8
 10520 DATA 2,10,4,2,3,8,1,1,3,2,2,8,2,10,3,5,3,8,1,1,3,2,2,8
 10530 DATA 2,10,4,2,3,8,1,1,3,2,2,8,2,10,3,5,3,8,1,1,3,2,2,8
 10540 DATA 2,6,3,10,3,8,1,1,3,3,2,8,2,6,3,6,3,8,1,1,3,3,2,8
 10550 DATA 2,6,3,10,3,8,1,1,3,3,2,8,2,6,3,6,3,8,1,1,3,3,2,8
 10560 DATA 2,5,3,8,3,8,1,1,2,11,2,8,2,5,3,2,3,8,1,1,2,11,2,8
 10570 DATA 2,5,3,8,3,8,1,1,2,11,2,8,2,5,3,2,3,8,1,1,2,11,2,8
 10580 DATA 2,3,3,6,3,8,1,1,2,10,2,8,2,3,3,3,3,8,1,1,2,10,2,8
 10590 DATA 2,3,3,6,3,8,1,1,2,10,2,8,2,3,3,3,3,8,1,1,2,10,2,8
 10600 DATA 2,5,3,5,3,8,1,1,2,8,2,8,2,5,2,11,3,8,1,1,2,8,2,8
 10610 DATA 2,5,3,5,3,8,1,1,2,8,2,8,2,5,2,11,3,8,1,1,2,8,2,8
 11000 DOKE#2445,#FA86:DOKE#524E,#EE22:DOKE#5295,#246:DOKE#5298,#245
 11100 POKE #529E,#EE:POKE #52A0,#22:DOKE#52A2,#246:DOKE#52A5,#245
 11200 RETURN 
 
