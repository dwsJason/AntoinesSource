*
* Tout a disparu
*
* (c) 1992, Fran�ois Coulon
* (c) 2022, Antoine Vignau & Olivier Zardini
*

	mx	%00

*-----------------------
* CONSTANTES
*-----------------------

NB_INDICATEURS =	10
NB_MOTS	=	25	; on ne peut pas avoir plus de 25 mots par ecran
NB_TEXTES	=	160	; nombre de textes du jeu

linksON	=	TRUE
linksOFF	=	FALSE

colorBLACK	=	0
colorWHITE	=	15

*-----------------------
* set_language
*-----------------------

set_language
	PushWord #0
	PushWord #$29
	_ReadBParam
	pla
	cmp	#20
	bcc	st_ok
	rts

* index
* TEXTES : +16

st_ok
	jsr	st_setit	; try IIgs language
	bcc	st_ok99
	
	lda	#0	; if not, try EN US
	jsr	st_setit
	bcc	st_ok99

	lda	#2	; it not, force FR - It always exists
	jsr	st_setit
st_ok99
	rts

*---

st_setit			; set language code
	sta	saveLANGUAGE
	asl
	tax
	lda	tblLANG,x
	sta	pINDEX+16
	sta	pTEXTES+16

	lda	#pINDEX	; check file exists
	sta	proOPEN+4

	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	bcs	st_setit99
	
	lda	proOPEN+2
	sta	proCLOSE+2
	
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

st_setit99
	rts

*---
	
tblLANG
	asc	'us'	; 0
	asc	'uk'
	asc	'fr'	; 2
	asc	'nl'
	asc	'es'	; 4
	asc	'it'
	asc	'de'	; 6
	asc	'se'
	asc	'us'
	asc	'ca'
	asc	'nl'
	asc	'he'
	asc	'jp'
	asc	'ar'
	asc	'gr'
	asc	'tr'
	asc	'fi'
	asc	'ta'
	asc	'hi'
	asc	'us'	; 19

*-----------------------
* load_index
*-----------------------

load_index
	lda	#pINDEX
	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcs	li_err

	tya
	jsr	unpackLZ4

	PushLong	ptrIMAGE
	PushLong	ptrINDEX
	PushLong	lenDATA
	_BlockMove

	clc
	rts

li_err	pha
	PushLong #filSTR1
	PushLong #errSTR2
	PushLong #errSTR1
	PushLong #errSTR2
	_TLTextMountVolume
	pla
	brl	meQUIT1

*-----------------------
* next_index
*-----------------------

next_index	inc	dpINDEX
	bne	ni_1
	inc	dpINDEX+2
ni_1	lda	[dpINDEX]
	and	#$ff
	rts

*-----------------------
* load_textes
*-----------------------

load_textes	lda	#pTEXTES
	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcs	lt_err

	tya
	jsr	unpackLZ4

	lda	lenDATA
	sta	proEOF
	lda	lenDATA+2
	sta	proEOF+2
	
	PushLong	ptrIMAGE
	PushLong	ptrTEXTES
	PushLong	lenDATA
	_BlockMove

	clc
	rts

lt_err	pha
	PushLong #filSTR1
	PushLong #errSTR2
	PushLong #errSTR1
	PushLong #errSTR2
	_TLTextMountVolume
	pla
	brl	meQUIT1

*-----------------------
* init_textes
*-----------------------

init_textes
	stz	nbTEXTES	; 0 texts on entry

	lda	proEOF	; is file empty?
	ora	proEOF+2
	bne	it1
	rts

it1	lda	ptrTEXTES
	sta	dpFROM
	clc
	adc	proEOF
	sta	dpTO
	lda	ptrTEXTES+2
	sta	dpFROM+2
	adc	proEOF+2
	sta	dpTO+2

*--- Saute le nombre de textes (en little endian)

	lda	dpFROM	; += 2
	clc
	adc	#2
	sta	dpFROM
	lda	dpFROM+2
	adc	#0
	sta	dpFROM+2

*---
	
	ldy	#1	; tell to store string
it2	cpy	#1	; save string pointer?
	bne	it3	; nope

	lda	nbTEXTES	; yes, save the address of the string
	asl
	asl
	tax
	lda	dpFROM
	sta	tblTEXTES,x
	lda	dpFROM+2
	sta	tblTEXTES+2,x
	dey		; string is saved

	inc	nbTEXTES	; increment the number of strings
	lda	nbTEXTES	; into our limit
	cmp	#NB_TEXTES
	bcc	it3
	rts

it3	lda	[dpFROM]	; is it the end of a string?
	and	#$ff
	bne	it4	; nope
	iny		; yes, tell to store string
	
it4	inc	dpFROM
	bne	it5
	inc	dpFROM+2
	
it5	lda	dpFROM+2	; did we reach the end of the file?
	cmp	dpTO+2
	bcc	it2
	lda	dpFROM
	cmp	dpTO
	bcc	it2
	rts		; we are done!

*-----------------------
* get_textes(textes%)
*-----------------------

get_textes	lda	scene_actuelle
	beq	get_textes1
	cmp	nbTEXTES
	bcc	get_textes2
	beq	get_textes2

	pha
	PushLong #pgmSTR1
	PushLong #pgmSTR2
	PushLong #errSTR3
	PushLong #errSTR2
	_TLTextMountVolume
	pla

get_textes1	sec
	rts

get_textes2	dec
	asl
	asl
	tax
	lda	tblTEXTES,x
	sta	dpTEXTES
	lda	tblTEXTES+2,x
	sta	dpTEXTES+2
	clc
	rts

*-----------------------
* LE JEU
*-----------------------

*-----------------------
* GENERIQUE - OK
*-----------------------
* generique

generique	jsr	switch_640

	PushLong	#$e19e00
	_InitColorTable

	jsr	tag
	
	PushWord	#0
	_GetForeColor
	PushWord	#0
	_GetBackColor

	PushWord	#15
	_SetForeColor
	PushWord	#0
	_SetBackColor

	@cprint	#gen_str1;8
	@cprint	#gen_str2;9
	@cprint	#gen_str3;10
	@cprint	#gen_str4;12

	@cprint	#gen_str7;14	; Apple IIgs
	@cprint	#gen_str8;15	; version by nous :-)
	
	@cprint	#gen_str5;17
	@cprint	#gen_str6;18

	jsr	attente
	
	_SetBackColor
	_SetForeColor
	
	rts

*-----------

gen_str1	asc	'Un logiciel de Fran'8d'ois Coulon'00
gen_str2	asc	'&'00
gen_str3	asc	'Sylvie Sarrat, Faustino Ribeiro, Laurent Cotton'00
gen_str4	asc	'Programmation : Pascal Piat - Noiz'27': Erik Ecqier'00
gen_str5	asc	'Les logiciels d'27'en face 1992'00
gen_str6	asc	'Reproduction, location et revente interdites'00
gen_str7	asc	'Version Apple IIgs par Brutal Deluxe Software'00
gen_str8	asc	'Antoine Vignau & Olivier Zardini'00

*-----------------------
* TAG - OK 
*-----------------------
* tag

tag	PushLong	#old_pattern
	_GetPenPat

	PushLong	#the_pattern	; blue pattern
	_SetPenPat

	ldx	#0
]lp	phx
	lda	tag_points,x
	cmp	#$ffff
	beq	tag_end
	
	and	#$ff	; keep X
	clc
	adc	#194	; 40 center it
	sta	tag_rect+2
	clc
	adc	#4
	sta	tag_rect+6
	
	lda	tag_points+1,x
	and	#$ff	; keep Y
	sta	tag_rect
	clc
	adc	#4
	sta	tag_rect+4

	PushLong	#tag_rect
	_PaintOval

tag_hop	plx
	inx
	inx
	bra	]lp
tag_end	plx

	PushLong	#old_pattern
	_SetPenPat
	rts

*-----------

old_pattern	ds	32
the_pattern	ds	32,$dd

*-----------

tag_rect	ds	2	; y0
	ds	2	; x0
	ds	2	; y1
	ds	2	; x1

*-----------------------
* CHOIX_AVENTURE - OK
*-----------------------
* choix_aventure

choix_aventure
	lda	#pMENU	; premier chargement
	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcc	ca_ok

	pha
	PushLong #filSTR1
	PushLong #errSTR2
	PushLong #errSTR1
	PushLong #errSTR2
	_TLTextMountVolume
	pla
	brl   meQUIT

ca_ok	tya
	jsr	unpackLZ4

	PushLong	ptrIMAGE
	PushLong	ptrMENU
	PushLong	#32768
	_BlockMove

*--- On arrive ici si restart
	
ca_restart	lda	escape
	cmp	#fgLOAD
	beq	ca_load
	
	jsr	switch_320

	lda	#TRUE
	ldx	ptrMENU+2
	ldy	ptrMENU
	jsr	fadeIN

*--- On restaure les patterns

	PushLong	#old_pattern
	_GetBackPat

	PushLong	#black_pattern	; black pattern
	_SetBackPat

	jsr	ca_choice	; choix de l'aventure
	sta	aventure	; num�ro de l'aventure

*--- Pr�pare le pr�fixe GS/OS 7 pour les images

ca_load	lda	aventure
	sep	#$20	; sauve
	ora	#'0'
	sta	pathIMAGES+25
	rep	#$20

	jsl	GSOS
	dw	$2009
	adrl	proSETPFX
	
*---

	jsr	resumeMUSIC	; NTP on

	lda	escape
	cmp	#fgLOAD
	bne	ca_exit
	rts
	
ca_exit	PushLong	#old_pattern
	_GetBackPat

	lda	#2
	jsr	nowWAIT
	jmp	fadeOUT
	
*----------- Wait for a click

ca_choice	jsr	attente
	cmp	#mouseDownEvt
	bne	ca_choice
	
	lda	taskREC+12	; where did we click?
	cmp	#106+1
	bcc	ca_clear23
	cmp	#212+1
	bcc	ca_clear13

*----------- Clear accordingly...
	
ca_clear12	jsr	ca_clear1
	jsr	ca_clear2
	lda	#3
	rts

ca_clear23	jsr	ca_clear2
	jsr	ca_clear3
	lda	#1
	rts

ca_clear13	jsr	ca_clear1
	jsr	ca_clear3
	lda	#2
	rts

ca_clear1	PushLong	#ca_rect1
	_EraseRect
	rts
	
ca_clear2	PushLong	#ca_rect2
	_EraseRect
	rts
	
ca_clear3	PushLong	#ca_rect3
	_EraseRect
	rts

*-----------

ca_rect1	dw	0,0,200,106
ca_rect2	dw	0,106,200,212
ca_rect3	dw	0,212,200,320

black_pattern
	ds	32,$00
	
*-----------------------
* INITIALISATION_ABSOLUE - OK
*-----------------------
* initialisation_absolue

initialisation_absolue
	jsr	initialisation_resolution
	jsr	noircit_ecran
	jsr	initialisation_constantes
	jsr	initialisation_fonte
	jsr	initialisation_fond
	jmp	initialisation_souris
	
*-----------------------
* INITIALISATION_CONSTANTES - OK
*-----------------------
* initialisation_constantes

initialisation_constantes
	rts
	
*-----------------------
* INITIALISATION_RESOLUTION - OK
*-----------------------
* initialisation_resolution

initialisation_resolution
	rts
	
*-----------------------
* INITIALISATION_FONTE - OK
*-----------------------
* initialisation_fonte

initialisation_fonte
	rts
	
*-----------------------
* INITIALISATION_FOND - OK
*-----------------------
* initialisation_fond

initialisation_fond
	lda	#pFOND
	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcc	fo_ok

	pha
	PushLong #filSTR1
	PushLong #errSTR2
	PushLong #errSTR1
	PushLong #errSTR2
	_TLTextMountVolume
	pla
	brl   meQUIT

fo_ok	tya
	jsr	unpackLZ4

	PushLong	ptrIMAGE
	PushLong	ptrFOND
	PushLong	#32768
	_BlockMove
	rts
	
*-----------------------
* INITIALISATION_SOURIS - OK
*-----------------------
* initialisation_souris

initialisation_souris
	rts
	
*-----------------------
* INITALISATION_RELATIVE - OK
*-----------------------
* initialisation_relative

initialisation_relative
	jsr	initialisation_textes
	jsr	initialisation_tableaux
	jsr	initialisation_cache
	jmp	debut_aventure
	
*-----------------------
* INITIALISATION_TEXTES - OK
*-----------------------

initialisation_textes
	sep	#$20	; put aventure value
	lda	aventure
	ora	#'0'
	sta	pINDEX+25
	sta	pTEXTES+25
	rep	#$20
	
	jsr	load_textes
	jsr	init_textes
	
	lda	nbTEXTES
	dec
	sta	nombre_scenes
	rts

*-----------------------
* INITIALISATION_TABLEAUX - OK
*-----------------------

instrSPACE	=	$20
instrDIESE	=	$23
instrECOMM	=	$26
instrPERCE	=	$25

*---

initialisation_tableaux
	jsr	load_index	; exit if error

	lda	ptrINDEX	; d�but du fichier IND
	sta	dpINDEX
	lda	ptrINDEX+2
	sta	dpINDEX+2

*--- Initialise les valeurs RVB

	ldx	#1	; RVB par d�faut
	sep	#$20
]lp	lda	#4
	sta	rouge1-1,x
	lda	#1
	sta	rouge2-1,x
	lda	#7
	sta	vert1-1,x
	sta	vert2-1,x
	stz	bleu1-1,x
	stz	bleu2-1,x
	inx
	cpx	#NB_TEXTES
	bcc	]lp
	beq	]lp
	rep	#$20

*--- Decode chaque ligne

itab_loop	lda	[dpINDEX]	; read a byte
	and	#$ff
	bne	itab_1
	rts		; we reached 0, we exit

itab_1	cmp	#instrECOMM
	bne	itab_2

	jsr	doECOMM	; handle & - "image � charger"
	bra	itab_4
	
itab_2	cmp	#instrPERCE
	bne	itab_3

	jsr	doPERCE	; handle % - "couleur de fond du texte"
	bra	itab_4
	
itab_3	cmp	#instrDIESE
	bne	itab_4

	jsr	doDIESE	; handle # - "mot clicable"

*--- Next index

itab_4	jsr	next_index	; move to the first char of the next line
	bra	itab_loop	; loop

*--- Handle % - les valeurs RVB

doPERCE	jsr	next_index
	dec
	tax		; la scene

	jsr	next_index
	sep	#$20
	sec
	sbc	#'0'
	sta	rouge1,x
	rep	#$20

	jsr	next_index
	sep	#$20
	sec
	sbc	#'0'
	sta	vert1,x
	rep	#$20

	jsr	next_index
	sep	#$20
	sec
	sbc	#'0'
	sta	bleu1,x
	rep	#$20

	jsr	next_index
	sep	#$20
	sec
	sbc	#'0'
	sta	rouge2,x
	rep	#$20

	jsr	next_index
	sep	#$20
	sec
	sbc	#'0'
	sta	vert2,x
	rep	#$20

	jsr	next_index
	sep	#$20
	sec
	sbc	#'0'
	sta	bleu2,x
	rep	#$20
	
	jmp	next_index	; skip the final 0

*--- Handle & - une image � charger

doECOMM	jsr	next_index
	dec
	asl		; tableau de words
	tax		; index du nom de l'image

	jsr	next_index	; pointe sur le nom du fichier
	lda	dpINDEX	; sauve son adresse dans le tableau
	sta	image_a_charger,x

]lp	jsr	next_index	; move to the end of the string (final zero)
	bne	]lp
	rts

*--- Handle # - les mots cliquables

doDIESE	jsr	next_index
	dec
	tax		; la scene
	
	sep	#$20	; un mot en plus
	inc	pointeur_mots,x
	lda	pointeur_mots,x
	dec
	sta	localPOINT
	rep	#$20

	pha		; calcul l'index dans la dimension NB_MOTS
	pha
	phx		; index de sc�ne
	PushWord #NB_MOTS	; taille d'une dimension
	_Multiply
	pla
	sta	localOFFSET	; 0=>0, 1=>25, 2=>50
	pla

*-- fonction_mot$(scene|,pointeur_mots|(scene|))=MID$(ligne$,2,espace%-2)

	jsr	next_index

	lda	localOFFSET	; 0/25/50 => 0/50/100
	asl
	pha
	lda	localPOINT	; 0/1/2 => 0/2/4
	asl
	clc
	adc	1,s	; +=
	tax
	pla
	
	lda	dpINDEX	; sauve l'offset du mot
	sta	fonction_mots,x

	jsr	next_index

*--- Maintenant, on parcout la cha�ne jusqu'� l'espace

]lp	jsr	next_index
	cmp	#instrSPACE
	bne	]lp

*--- condition&(scene|,pointeur_mots|(scene|)) = 
*--- ASC(MID$(ligne$,espace%+2,1))*VAL(MID$(ligne$,espace%+1,1)+"1")
*--- Ici, on ne fait pas le calcul de la version Atari

	jsr	next_index

	lda	localOFFSET	; 0/25/50 => 0/50/100
	asl
	pha
	lda	localPOINT	; 0/1/2 => 0/2/4
	asl
	clc
	adc	1,s	; +=
	tax
	pla
	
	lda	[dpINDEX]	; prend le mot sur 16-bit
	sta	condition,x

	jsr	next_index

*--- aiguillage|(scene|,pointeur_mots|(scene|))=ASC(MID$(ligne$,espace%+3))

	jsr	next_index

	lda	localOFFSET	; 0/25/50 => 0/50/100
	clc
	adc	localPOINT	; +=
	tax
	
	sep	#$20
	lda	[dpINDEX]	; prend le caract�re 8-bit
	sta	aiguillage,x
	rep	#$20

*--- Recopie la phrase si elle existe

	jsr	next_index
	bne	doDIESE1	; on a une cha�ne
	rts

doDIESE1	lda	localOFFSET	; 0/25/50 => 0/50/100
	asl
	pha
	lda	localPOINT	; 0/1/2 => 0/2/4
	asl
	clc
	adc	1,s	; +=
	tax
	pla
	
	lda	dpINDEX	; prend le mot sur 16-bit
	sta	phrase,x

*--- Maintenant, on parcout la cha�ne jusqu'� la fin (00)

]lp	jsr	next_index
	bne	]lp
	rts

*-----------------------
* INITIALISATION_CACHE - OK
*-----------------------
* initialisation_cache

initialisation_cache
	rts

*-----------------------
* PREPARE_TEXTE
*-----------------------
* prepare_texte

texteSPACE	=	$5f
texteRC	=	$9c

prepare_texte
	stz	i	; on commence � 0
	stz	nb_lignes
	
	lda	#texte_final
	sta	dpTO

	sep	#$20	; A en 8-bits

* 1- clear le texte final

	ldx	#0	; on initialise les buffers
]lp	lda	#texteSPACE
	sta	texte_final,x
	lda	#colorBLACK
	sta	texte_color,x
*	stz	texte_index,x
	inx
	cpx	#max_colonnes*max_lignes
	bcc	]lp

* 2- recopie le texte entier

	ldy	#0
]lp	lda	[dpTEXTES],y
	sta	texte,y
	iny
	cmp	#0
	bne	]lp

	sty	longueur_texte

* ligne_max$=MID$(texte$,i%,max_colonnes|)

at_2	sep	#$20

	ldx	i
	ldy	#0
]lp	lda	texte,x	
	sta	ligne_max,y
	inx
	iny
	cpy	#max_colonnes
	bcc	]lp
	
* return$=LEFT$(ligne_max$,INSTR(ligne_max$,"�")) = index d'un RC

	ldx	#0
]lp	lda	ligne_max,x
	cmp	#texteRC
	beq	at_3	; on a trouv� un RC
	inx
	cpx	#max_colonnes
	bcc	]lp
	bcs	at_case0	; pas de RC sur la ligne

at_3	stx	return	; on a l'index du RC

	cpx	#0
	beq	at_case1	; 1er car est un RC, on sort une ligne blanche
	brl	at_default	; on a un RC qq part
	
* CASE 0 - aucun RC, on coupe le texte

* ligne_max$=LEFT$(ligne_max$,RINSTR(ligne_max$," "))

at_case0	ldx	#max_colonnes-1
]lp	lda	ligne_max,x
	cmp	#instrSPACE	; un vrai espace
	beq	at_4
	dex
	bne	]lp
	ldx	#1	; eventuel cas douteux

at_4	stx	len_max

* b$=b$+ligne_max$+SPACE$(max_colonnes|-LEN(ligne_max$))

	ldx	#0
]lp	lda	ligne_max,x
	jsr	set_textefinal
	inx
	cpx	len_max
	bcc	]lp

	cpx	#max_colonnes
	bcs	noSPC
	
	lda	#instrSPACE
]lp	jsr	set_textefinal
	inx
	cpx	#max_colonnes
	bcc	]lp
	
noSPC
	
* ADD i%,LEN(ligne_max$)

	rep	#$20
	lda	i
	clc
	adc	len_max
	inc
	sta	i
	sep	#$20
	bra	at_8
	
* CASE 1 - ligne blanche

at_case1	ldx	i	; on utilise X pour �tre en 16-bits
	inx
	stx	i

	ldx	#0
	lda	#instrSPACE
]lp	jsr	set_textefinal
	inx
	cpx	#max_colonnes
	bcc	]lp
	bcs	at_8

* DEFAULT

at_default	ldx	#0	; ligne_max$=LEFT$(return$,return%)
]lp	lda	ligne_max,x
	jsr	set_textefinal
	inx
	cpx	return
	bcc	]lp

* b$=b$+ligne_max$+SPACE$(max_colonnes|-return%)

	cpx	#max_colonnes
	bcs	noSPC2
	
	lda	#instrSPACE
]lp	jsr	set_textefinal
	inx
	cpx	#max_colonnes
	bcc	]lp

noSPC2

* ADD i%,return%+1
	
	rep	#$20
	lda	i
	clc
	adc	return
	inc
	sta	i

* UNTIL i%>=longueur_texte%

	mx	%10
	
at_8	inc	nb_lignes

	ldx	i
	cpx	longueur_texte
	bcs	at_9
	brl	at_2	; we loop

at_9
	
*--- on centre le texte

	rep	#$20
	
	lda	#max_lignes	; on est au max, on ne fait rien
	sec
	sbc	nb_lignes
	bpl	at_10
	lda	#0
at_10	clc
	adc	#1
	lsr
	sta	printY	; output line
	sta	motY
	asl
	tax
	lda	y_coord,x
	sta	offsetY
	rts

	mx	%10
	
*--- output dans texte final

	mx	%10
	
set_textefinal
	sta	(dpTO)
	inc	dpTO
	bne	set_tf1
	inc	dpTO+1
set_tf1	rts

	mx	%00	; on revient en 16-bits

*-----------------------
* AFFICHE_TEXTE
*-----------------------
* affiche_texte
	
* on imprime le texte (enfin)

modeForeCopy =	$0004	; QDII Table 16-10

affiche_texte
	jsr	switch_640	; switch to 640

* on s'occupe des couleurs de la palette
	
	lda	ptrFOND
	sta	dpFROM
	lda	ptrFOND+2
	sta	dpFROM+2

	ldx	scene_actuelle
	sep	#$20
	lda	rouge1-1,x
	asl
	sta	rvb1+1
	lda	vert1-1,x
	asl
	asl
	asl
	asl
	asl
	sta	rvb1
	lda	bleu1-1,x
	asl
	ora	rvb1
	sta	rvb1

	lda	rouge2-1,x
	asl
	sta	rvb2+1
	lda	vert2-1,x
	asl
	asl
	asl
	asl
	asl
	sta	rvb2
	lda	bleu2-1,x
	asl
	ora	rvb2
	sta	rvb2

	rep	#$20

	lda	rvb2
	ldy	#$7E02
	sta	[dpFROM],y
	ldy	#$7E0A
	sta	[dpFROM],y
	ldy	#$7E12
	sta	[dpFROM],y
	ldy	#$7E1A
	sta	[dpFROM],y

	lda	rvb1
	ldy	#$7E04
	sta	[dpFROM],y
	ldy	#$7E0C
	sta	[dpFROM],y
	ldy	#$7E14
	sta	[dpFROM],y
	ldy	#$7E1C
	sta	[dpFROM],y

* et on affiche enfin

	lda	#TRUE
	ldx	ptrFOND+2
	ldy	ptrFOND
	jsr	fadeIN

	PushWord	#0	; save current mode
	_GetTextMode

	PushWord	#modeForeCopy
	_SetTextMode

	PushLong	#texte_color
	PushLong	#texte_final
	PushWord	#3		; x
	PushWord	printY		; y
	PushWord	#max_colonnes	; largeur
	jsr	print

	_SetTextMode	; restore original mode
	rts

*-----------------------
* DEBUT_AVENTURE - OK
*-----------------------
* debut_aventure

debut_aventure
	lda	#-1
	sta	scene_ancienne
*	sta	mot_ancien

	lda	#$d2	; initialise la cha�ne de commentaire
	sta	ligne_commentaire
	
	lda	escape	; on saute ce que l'on vient
	cmp	#fgLOAD	; de charger en m�moire !
	beq	da_1
	
	lda	#1
	sta	scene_actuelle
	lda	#TRUE
	sta	deplacement

	ldx	#1
	sep	#$20
	lda	#FALSE
]lp	sta	scene_visitee-1,x
	inx
	cpx	#NB_TEXTES
	bcc	]lp
	beq	]lp
	rep	#$20

da_1	lda	#FALSE
	sta	escape
	rts
	
*-----------------------
* FIN_AVENTURE - OK
*-----------------------
* fin_aventure

fin_aventure
	jsr	noircit_ecran
	
	ldx	#DEBUT_DATA	; on efface tout
]lp	stz	|$0000,x
	inx
	cpx	#FIN_DATA
	bcc	]lp
	rts
	
*-----------------------
* FIN - OK
*-----------------------
* fin

fin	rts
	
*-----------------------
* NOUVELLE_SCENE - OK
*-----------------------
* nouvelle_scene(scene � charger)

nouvelle_scene
	lda	scene_actuelle
	beq	ns_99
*	cmp	scene_ancienne
*	beq	ns_98

*	ldx	scene_actuelle
*	stx	scene_ancienne

	tax
	lda	#TRUE
	sep	#$20
	sta	scene_visitee-1,x
	rep	#$20

ns_98	lda	#FALSE
	sta	deplacement
	
ns_99	rts

	mx	%00
	
*-----------------------
* SURLIGNER_MOT
*-----------------------
* surligner_mot(texte$,mot$,pointeur_mot%,cycles)

surligner_mot
	pha		; le nombre de cycles

	_HideCursor

	pha		; save current mode
	_GetTextMode
	pla
	sta	motOFFSET
	
	PushWord	#modeForeCopy
	_SetTextMode

	pla		; le nombre de cycles

]lp	pha
	jsr	sm_blink
	pla
	dec
	bne	]lp

	PushWord	motOFFSET
	_SetTextMode
	_ShowCursor
	rts

* noir puis blanc

sm_blink	PushWord	#colorBLACK
	_SetForeColor
	jsr	sm_print
	PushWord	#colorWHITE
	_SetForeColor

* affiche
	
sm_print	PushLong	#mot
	PushWord	motX
	PushWord	motY2
	jsr	printc

	lda	#3	; wait 3 VBLS
	jmp	nowWAIT1	; or 1/20 sec

*--- Data

motX	ds	2
motY	ds	2
motY2	ds	2
motOFFSET	ds	2
	
*-----------------------
* PRINT - OK
*-----------------------
* print(couleur$,texte$,colonne&,ligne&,largeur&)
* 1,s	w	return address
* 3,s	w	width
* 5,s	w	Y
* 7,s	w	X
* 9,s	l	text pointer
* 13,s	l	color pointer

max_colonnes =	75	; 80 - 75
max_lignes	=	20	; 20 - 18
max_colonnes2 =	80	; 80 - 75
largeur_caractere = 	8
hauteur_caractere =	10
marge_gauche =	3	; nombre de caract�res saut�s pour la marge

*---

print	lda	15,s
	sta	dpTO+2
	lda	13,s
	sta	dpTO
	lda	11,s
	sta	dpFROM+2
	lda	9,s
	sta	dpFROM
	lda	7,s
	sta	printX
	lda	5,s
	sta	printY
	lda	3,s	; calcule la largeur de texte
	clc
	adc	printX
	cmp	#max_colonnes2
	bcc	printINIT
	lda	#max_colonnes2
printINIT	sta	printWIDTH
	
printLOOP	lda	[dpFROM]
	and	#$ff
	bne	print1

printEXIT	lda	1,s
	plx
	plx
	plx
	plx
	plx
	plx
	plx
	sta	1,s
	rts

* 1- print char

print1	cmp	#instrSPACE	; skip space char
	beq	print2
	cmp	#texteSPACE
	beq	print2
	cmp	#texteRC
	beq	print3

	tax
	lda	tblATARI,x
	and	#$ff
	pha

	lda	printX
	asl
	tax
	lda	x_coord,x
	pha
	
	lda	printY
	asl
	tay
	lda	y_coord,y
	pha
	_MoveTo

* Set font color

	lda	[dpTO]
	and	#$ff
	pha
	_SetForeColor
	
	_DrawChar

* 4- next character

print2	inc	printX
	lda	printX
	cmp	printWIDTH
	bcc	print4

print3	lda	7,s	; reset X-coord
	sta	printX

	inc	printY
	lda	printY
	cmp	#max_lignes
	bcc	print4
	
	brl	printEXIT	; out of SHR screen, we exit

* 6- we loop

print4	inc	dpFROM
	bne	print5
	inc	dpFROM+2

print5	inc	dpTO	; next color char
	bne	print6
	inc	dpTO+2
	
print6	brl	printLOOP

*-----------------------
* PRINTC - OK
*-----------------------
* printc(texte$,colonne&,ligne&)
* 1,s	w	return address
* 3,s	w	Y
* 5,s	w	X
* 7,s	l	text pointer

printc	lda	9,s
	sta	dpFROM+2
	lda	7,s
	sta	dpFROM
	lda	5,s
	sta	printX
	lda	3,s
	sta	printY
	
printcLOOP	lda	[dpFROM]
	and	#$ff
	bne	printc1

printcEXIT	lda	1,s
	plx
	plx
	plx
	plx
	sta	1,s
	rts

* 1- print char

printc1	cmp	#instrSPACE	; skip space char
	beq	printc2
	cmp	#texteSPACE
	beq	printc2
	cmp	#texteRC
	beq	printc3

	tax
	lda	tblATARI,x
	and	#$ff
	pha

	lda	printX
	asl
	tax
	lda	x_coord,x
	pha
	
	lda	printY
	asl
	tay
	lda	y_coord,y
	pha
	_MoveTo

	_DrawChar

* 4- next character

printc2	inc	printX
	lda	printX
	cmp	#max_colonnes2
	bcc	printc4

printc3	lda	7,s	; reset X-coord
	sta	printX

	inc	printY
	lda	printY
	cmp	#max_lignes
	bcc	printc4
	
	brl	printcEXIT	; out of SHR screen, we exit

* 6- we loop

printc4	inc	dpFROM
	bne	printc5
	inc	dpFROM+2

printc5	brl	printcLOOP

*-----------------------
* DATA FOR PRINT
*-----------------------

printWIDTH	ds	2
printX	ds	2
printY	ds	2
offsetY	ds	2

*---

x_coord	=	*	; For all texts
]x	=	0	; Premi�re ligne
	lup	max_colonnes2
	dw	]x
]x	=	]x+largeur_caractere
	--^

y_coord	=	*	; For all texts
]y	=	0	; Premi�re ligne
	lup	max_lignes
	dw	]y
]y	=	]y+hauteur_caractere
	--^

x_text	=	*
]x	=	0	; Premi�re colonne
	lup	max_colonnes
	dw	]x,]x,]x,]x,]x,]x,]x,]x
]x	=	]x+1
	--^

y_text	=	*
]y	=	0	; Premi�re ligne
	lup	max_lignes
	dw	]y,]y,]y,]y,]y,]y,]y,]y,]y,]y
]y	=	]y+max_colonnes
	--^

y_text2	=	*
]y	=	0	; Premi�re ligne
	lup	max_lignes
	dw	]y,]y,]y,]y,]y,]y,]y,]y,]y,]y
]y	=	]y+1
	--^

*---

* Apple		Atari
* 22	"	7E
* 82	�	80
* 88	�	85
* 89	�	83
* 8D	�	87
* 8E	�	82
* 8F	�	8A
* 90	�	88
* 91	�	
* 94	�	8C
* 95	�	8B
* 99	�	93
* 9E	�	96
* 9D	�	97
* CE	OE	B4
* CF	oe	B5

tblATARI	hex	000102030405060708090A0B0C0D0E0F
	hex	101112131415161718191A1B1C1D1E1F
	hex	202122232425262728292A2B2C2D2E2F
	hex	303132333435363738393A3B3C3D3E3F
	hex	404142434445464748494A4B4C4D4E4F
	hex	505152535455565758595A5B5C5D5E5F
	hex	606162636465666768696A6B6C6D6E6F
	hex	707172737475767778797A7B7C7D227F
	hex	82818E898488868D90898F95948D8E8F
	hex	9091929994959E9D98999A9B9C9D9E9F
	hex	A0A1A2A3A4A5A6A7A8A9AAABACADAEAF
	hex	B0B1B2B3CFCEB6B7B8B9BBBABCBDBEBF
	hex	C0C1C2C3C4C5C6C7C8C9CACBCCCDCECF
	hex	D0D1D2D3D4D5D6D7D8D9DADBDCDDDEDF
	hex	E0E1E2E3E4E5E6E7E8E9EAEBECEDEEEF
	hex	F0F1F2F3F4F5F6F7F8F9FAFBFCFDFEFF

tblUPPER	hex	000102030405060708090A0B0C0D0E0F
	hex	101112131415161718191A1B1C1D1E1F
	hex	202122232425262728292A2B2C2D2E2F
	hex	303132333435363738393A3B3C3D3E3F
	hex	404142434445464748494A4B4C4D4E4F
	hex	505152535455565758595A5B5C5D5E5F
	hex	604142434445464748494A4B4C4D4E4F	; a-z => A-Z
	hex	505152535455565758595A7B7C7D7E7F
	hex	808182838485868788898A8B8C8D8E8F
	hex	909192939495969798999A9B9C9D9E9F
	hex	A0A1A2A3A4A5A6A7A8A9AAABACADAEAF
	hex	B0B1B2B3B4B5B6B7B8B9BABBBCBDBEBF
	hex	C0C1C2C3C4C5C6C7C8C9CACBCCCDCECF
	hex	D0D1D2D3D4D5D6D7D8D9DADBDCDDDEDF
	hex	E0E1E2E3E4E5E6E7E8E9EAEBECEDEEEF
	hex	F0F1F2F3F4F5F6F7F8F9FAFBFCFDFEFF

*-----------------------
* CPRINT - OK
*-----------------------
* cprint(texte$,ligne&)
* X/Y= ptr to string
* A= line index

cprint	phx		; ptr to text
	phy
	pea	$0000	; X	; qu'on va initialiser
	pha		; Y

	pea	$0000	; count nb of chars in the string
	sty	dpFROM
	stx	dpFROM+2
	
	ldy	#0
	sep	#$20
]lp	lda	[dpFROM],y
	beq	cprint1
	iny
	bne	]lp

cprint1	rep	#$20	; nb chars x 8 to get width
	tya
	asl
	asl
	asl
	sta	1,s

*--- now, calculate where we should display it online
	
	lda	mainWIDTH	; 320 or 640
	sec
	sbc	1,s	; stringWidth in pixels
	plx		; free stack
	lsr		; /2
	lsr		; /4
	lsr		; /8
	lsr		; /16
	sta	3,s	; fill X from above
	jsr	printc	; the new centered print routine
	rts		; must be RTS
	
*-----------------------
* ATTENTE - OK
*-----------------------
* attente

attente	jmp	waitEVENT	; LoGo - check if we support keypresses as well
	
*-----------------------
* IMAGE - OK
*-----------------------
* image(scene � charger)

image	lda	scene_actuelle	; not 0
	beq	image_ko
	dec
	asl
	tax
	lda	image_a_charger,x
	bne	image_1
	
image_ko	lda	#FALSE
	sta	image_chargee
	rts

*--- on copie le nom � pIMAGE+2

image_1	sta	Debut
	lda	ptrINDEX+2
	sta	Debut+2
	
	ldy	#0	; 1METRO.PI1
	sep	#$20	; 01234567
]lp	lda	[Debut],y
	sta	pIMAGE+4,y
	iny
	cmp	#'.'	
	bne	]lp

	lda	aventure	; 1->A ($41), 2->B ($42), 3->C ($43)
	ora	#'A'-1
	sta	pIMAGE+4	; 1METRO. -> AMETRO.
	
	lda	#'l'	; lz4
	sta	pIMAGE+4,y
	iny		; 8
	lda	#'z'
	sta	pIMAGE+4,y
	iny		; 9
	lda	#'4'
	sta	pIMAGE+4,y

	tya
	clc
	adc	#3	; strl (2) + '7/' (2) + la correction sur la longueur de cha�ne
	sta	pIMAGE
	rep	#$20
	
*--- et on charge l'image

	lda	#pIMAGE
	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcs	image_ko
	tya
	jsr	unpackLZ4

	lda	#TRUE
	sta	image_chargee
	jmp	affiche_image

*-----------------------
* CHARGEMENT_HARD - OK
*-----------------------
* chargement_hard(fichier$)

chargement_hard
	rts
	
*-----------------------
* AFFICHE_IMAGE - OK
*-----------------------
* affiche_image(adresse_image%,palette$,fondu!)

affiche_image
	lda	image_chargee
	cmp	#TRUE
	beq	ai_1
	rts

ai_1	jsr	noircit_ecran
	jsr	switch_320

	lda	#TRUE
	ldx	ptrIMAGE+2
	ldy	ptrIMAGE
	jsr	fadeIN

	jsr	attente
	jsr	fadeOUT	; noircit_ecran
	jmp	switch_640

*-----------------------
* SUITE_FORCEE - 
*-----------------------
* suite_forcee(scene)

suite_forcee
	lda	scene_actuelle
	beq	sf_false
	
	dec		; prend la scene
	pha		; calcul l'index dans la dimension NB_MOTS
	pha
	pha		; index de sc�ne
	PushWord #NB_MOTS	; taille d'une dimension
	_Multiply
	pla
	sta	localOFFSET	; 0=>0, 1=>25, 2=>50
	asl		; parce qu'on est sur des words
	clc
	adc	#fonction_mots
	sta	dpFROM	; on pointe sur l'index du premier mot
	pla

	lda	(dpFROM)	; prend la valeur du premier mot
	sta	dpINDEX	; de fonction_mots
	lda	ptrINDEX+2
	sta	dpINDEX+2	; et met son pointeur 32-bits

*	ldy	#6-2	; len('suite ') sur 16-bits
*]lp	lda	[dpINDEX],y
*	sta	mot,y
*	cmp	strSUITE,y
*	bne	sf_false
*	dey
*	dey
*	bpl	]lp

	lda	#0
	tax
	txy

	sep	#$20	; mot_upper$=UPPER$(mot$)
	ldy	#6-1
]lp	lda	[dpINDEX],y
	tax
	lda	tblATARI,x
	tax
	lda	tblUPPER,x
	cmp	strSUITE,y
	bne	sf_false
	dey
	bpl	]lp

	rep	#$20

	lda	#aiguillage
	clc
	adc	localOFFSET
	sta	dpFROM
	
	lda	(dpFROM)	; la prochaine sc�ne
	and	#$ff
	sta	scene_actuelle

	lda	#TRUE
	bra	sf_99
sf_false	rep	#$20
	lda	#FALSE
sf_99	sta	fgSUITEFORCEE
	rts

strSUITE	asc	'SUITE '

*-----------------------
* CLIC_MOT - OK
*-----------------------
* clic_mot
* on regarde sur quel mot on a cliqu�

clic_mot	lda	taskWHERE+2	; X
	cmp	#marge_gauche*largeur_caractere
	bcc	tc_ko
	cmp	#640-{2*largeur_caractere}
	bcs	tc_ko
	
	sec
	sbc	#marge_gauche*largeur_caractere
	clc
	adc	#7
	lsr
	lsr
	lsr
	sta	motX
	pha
	
	lda	taskWHERE	; Y
	sec
	sbc	offsetY	; d�calage li� au centrage du texte
	clc
	adc	#9
	asl
	tax
	lda	y_text2,x
	clc
	adc	motY
	sta	motY2	; la ligne
	lda	y_text,x
	sta	motOFFSET	; l'offset dans le texte
	clc
	adc	1,s
	tax
	pla

* on a un mot mais on ne sait pas lequel

*	lda	texte_index,x
	lda	texte_color,x
	and	#$ff
	bne	tc_2

tc_ko	sec		; pas de mot
	rts

*--- on a un mot

tc_2
*	ldx	mot_clique	; on sauvegarde l'ancien mot
*	stx	mot_ancien
*	sta	mot_clique	; et le nouveau
	
	lda	motOFFSET	; on en a encore besoin
	clc
	adc	#texte_final
	sta	dpFROM

*- on cherche le d�but

	ldy	motX
]lp	cpy	#0	; condition de sortie : on est � gauche
	beq	tc_debut
	lda	(dpFROM),y
	and	#$ff
	cmp	#'A'-1	; instrSPACE
	bcc	tc_debutok	; beq
	dey
	bra	]lp

tc_debutok	iny	
tc_debut	sty	motX	; on a le debut

	ldx	#0
	sep	#$20
]lp	cpy	#max_colonnes
	bcs	tc_fin
	lda	(dpFROM),y
	cmp	#'A'-1	; #instrSPACE
	bcc	tc_fin	; beq
	sta	mot,x
	iny
	inx
	bne	]lp	; on a recopi� le mot
	
tc_fin	stz	mot,x	; fin de cha�ne
	rep	#$20

	lda	motX	; corrige la marge
	clc
	adc	#marge_gauche
	sta	motX

	clc		; on a un mot
	rts

*-----------------------
* AIGUILLAGE
*-----------------------
* aiguille(scene)
* parce que le tableau aiguillage existe
* si on est ici, on sait qu'on a un mot

aiguille
*	lda	scene_actuelle
*	sta	scene_ancienne
	stz	numero_mot	; l'index du mot en sortie, le vrai !

*--- mot_upper$=UPPER$(mot$)

	lda	#0	; on init les registres (mais pourquoi ?)
	tax
	tay

	sep	#$20	; mot_upper$=UPPER$(mot$)
	ldx	#0
]lp	lda	mot,x
	tay
	lda	tblATARI,y
	tay
	lda	tblUPPER,y
	sta	mot_upper,x
	inx
	cpx	#128
	bcc	]lp
	rep	#$20
	
*--- pointeur_mots|(scene_actuelle|)

	pha		; calcul l'index dans la dimension NB_MOTS
	pha
	lda	scene_actuelle
	dec
	pha
	PushWord	#NB_MOTS	; taille d'une dimension
	_Multiply
	pla
	asl
	sta	localOFFSET
	clc
	adc	#fonction_mots
	sta	dpFROM	; on pointe sur fonction_mots(scene_actuelle)
	pla

	lda	#1
	sta	i

*--- FOR i|=1 TO pointeur_mots|(scene_actuelle|)

aig_fori	rep	#$20

	lda	i	; prend l'adresse du mot
	dec
	asl		; dans ptrINDEX
	tay
	lda	(dpFROM),y
	sta	dpINDEX
	lda	ptrINDEX+2
	sta	dpINDEX+2
	
	lda	#0	; on initialise les registres
	tax
	tay
	sep	#$20	; on majusculinise le mot
]lp	lda	[dpINDEX],y
	cmp	#instrSPACE
	beq	aig_finmot
	tax
	lda	tblATARI,x	; from Atari to IIgs
	tax
	lda	tblUPPER,x	; to upper case
	cmp	mot_upper,y
	bne	aig_nexti
	iny
	cpy	#128
	bcc	]lp
	
aig_finmot	lda	#0	; on met un zero final
	sta	mot_upper,y
	
	jsr	aiguille_condition	; on teste la condition
	bcs	aig_nexti		; non satisfaite

	lda	i		; satisfaite
	sta	numero_mot
	
*--- NEXT i%

aig_nexti	inc	i
	lda	i
	cmp	nb_mots
	bcc	aig_fori
	beq	aig_fori
	
*-----------------------

*--- IF numero_mot|<>0

aig_suite	rep	#$20	; on sort

	lda	numero_mot
	bne	ai_onaunmot

*	lda	scene_ancienne
*	sta	scene_actuelle
	rts

*--- IF option_mot$=mot$
	
ai_onaunmot	sep	#$20
	ldx	#0
]lp	lda	mot_upper,x
	cmp	option_mot,x
	bne	ai_diff
	cmp	#0	; fin de cha�ne
	beq	ai_entry
	inx
	cpx	#128
	bcc	]lp

*--- ELSE 

ai_diff	ldx	#0	; option_mot$=mot$
]lp	lda	mot_upper,x
	sta	option_mot,x
	inx
	cpx	#128
	bcc	]lp
		
	rep	#$20

	lda	#1	; fait clignoter
	jsr	surligner_mot
	
	jsr	affiche_commentaire

ai_false	lda	#FALSE
	sta	deplacement
	rts

*---
	mx	%10
	
ai_entry	rep	#$20	; m�me mot

	lda	scene_actuelle
	dec		; prend la scene
	pha		; calcul l'index dans la dimension NB_MOTS
	pha
	pha		; index de sc�ne
	
	lda	#3	; bien plac� le saut :-)
	jsr	surligner_mot
	
	PushWord #NB_MOTS	; taille d'une dimension
	_Multiply
	pla
	clc		; 0=>0, 1=>25, 2=>50
	adc	#aiguillage
	sta	dpFROM	; on pointe sur l'index du premier mot
	pla

	ldy	numero_mot	; 1..+
	dey
	lda	(dpFROM),y	; la prochaine sc�ne
	and	#$ff
	sta	scene_actuelle

	lda	#TRUE
	sta	deplacement
	rts

	mx	%00

*-----------------------
* AIGUILLE_CONDITION
*-----------------------
* aiguille_condition
* test de la condition pour 
* la routine aiguille

* test_condition
* on entre en A=8-bits
* on doit ressortir en A=8-bits
* si le mot est cliquable on remplit texte_color

	mx	%00
	
aiguille_condition
	rep	#$20
	
* condition&=condition&(scene_actuelle|,i%)

	lda	i
	dec
	asl
	clc
	adc	localOFFSET
	tax
	lda	condition,x	; xx2B ou yy2D
	pha
	and	#$ff00	; index dans scene_visitee
	xba
	tax
	lda	scene_visitee-1,x
	and	#$ff
	tax		; true ou false
	pla
	and	#$00ff	; 2B ou 2D

* IF (condition&>0 AND scene_visitee!(ABS(condition&))=TRUE) OR (condition&<0 AND scene_visitee!(ABS(-condition&))=FALSE)

	cmp	#'+'
	bne	ac_moins
	cpx	#TRUE
	beq	ac_oui
	bne	ac_non

ac_moins	cpx	#FALSE
	bne	ac_non

ac_oui	sep	#$20
	clc
	rts
	
ac_non	sep	#$20
	sec
	rts
	
	mx	%00

*-----------------------
* AFFICHE_COMMENTAIRE
*-----------------------
* affiche_commentaire

affiche_commentaire
	lda	scene_actuelle
	bne	ac_1
	rts

ac_1	dec		; prend la scene
	pha		; calcul l'index dans la dimension NB_MOTS
	pha
	pha		; index de sc�ne
	PushWord #NB_MOTS	; taille d'une dimension
	_Multiply

	lda	1,s	; calcule l'offset pour les deux tableaux utiles
	asl
	sta	1,s

	lda	numero_mot
	dec
	asl
	clc
	adc	1,s
	sta	localOFFSET
	pla
	pla

*--- on construit la cha�ne

* 1- le mot

	lda	localOFFSET
	clc
	adc	#fonction_mots
	sta	dpFROM
	lda	(dpFROM)
	sta	dpINDEX
	lda	ptrINDEX+2
	sta	dpINDEX+2

	sep	#$20
	ldy	#0
]lp	lda	[dpINDEX],y
	cmp	#instrSPACE
	beq	ac_2
	sta	ligne_commentaire+1,y
	iny
	bne	]lp

* 2- la s�paration

ac_2	tyx
	rep	#$20
	lda	#$20d3	; double quote fermant + espace "-" -"
	sta	ligne_commentaire+1,x
	lda	#$203a	; deux-points + espace "-: -"
	sta	ligne_commentaire+3,x

* 3- le commentaire

	lda	localOFFSET
	clc
	adc	#phrase
	sta	dpFROM
	lda	(dpFROM)
	sta	dpINDEX
	lda	ptrINDEX+2
	sta	dpINDEX+2

	sep	#$20
	ldy	#0
]lp	lda	[dpINDEX],y
	beq	ac_3
	sta	ligne_commentaire+5,x
	iny
	inx
	cpx	#126	; len max
	bcc	]lp

ac_3	stz	ligne_commentaire+5,x	; pour finir
	
	rep	#$20
	
*--- Pr�pare l'�cran

	PushLong	#old_pattern
	_GetPenPat

	pha
	_GetForeColor

	pha
	_GetTextMode

	PushLong	#black_pattern	; black pattern
	_SetPenPat

	PushLong #commentRECT
	_PaintRect

	PushWord	#15
	_SetForeColor

	PushWord	#modeForeCopy
	_SetTextMode
	
	ldx	#^ligne_commentaire
	ldy	#ligne_commentaire
	lda	#19
	jsr	cprint

	_SetTextMode
	_SetForeColor
	_SetPenPat
	rts

*---

commentRECT	dw	182,16,192,623
	
*-----------------------
* CHARGE_IMAGE - OK
*-----------------------
* charge_image(fichier$)

charge_image
	rts

*-----------------------
* IMAGE_ECRAN - OK
*-----------------------
* image_ecran(adresse_image%)

image_ecran
	rts
	
*-----------------------
* FADEIN - OK
*-----------------------
* fadein(palette2$)
	rts

*-----------------------
* FADEOUT - OK
*-----------------------
* fadeout(palette2$)
	rts

*-----------------------
* FADEIN_MID - OK
*-----------------------
* fadein_mid

fadein_mid
	rts
	
*-----------------------
* FADEOUT_MID - OK
*-----------------------
* fadeout_mid

fadeout_mid
	rts
	
*-----------------------
* PALETTE - OK
*-----------------------
* palette_texte

palette_texte
	rts
	
*-----------------------
* NOIRCIT_ECRAN - OK
*-----------------------
* noircit_ecran

noircit_ecran
	PushWord #0
	_ClearScreen
	rts

*-----------------------
* PALETTE - OK
*-----------------------
* palette(palette$)

palette
	rts
	
*-----------------------
* HELP - OK
*-----------------------
* help

help	lda	mainWIDTH	; save current width
	sta	oldWIDTH
	jsr	saveBACK	; save background
	jsr	switch_640	; switch to 640

	lda	#TRUE
	ldx	ptrFOND+2
	ldy	ptrFOND
	jsr	fadeIN
	
	PushLong	#old_pattern	; save current pattern
	_GetPenPat

* The frame

	PushLong	#black_pattern	; black pattern
	_SetPenPat

	PushLong #helpRECT1
	PushWord #10
	PushWord #10
	_FrameRRect
	
* The rectangle

	PushLong	#white_pattern	; white pattern
	_SetPenPat

	PushLong #helpRECT2
	PushWord #10
	PushWord #10
	_PaintRRect

	lda	aventure
	cmp	#2
	beq	help2
	cmp	#3
	beq	help3

	@cprint	#help_str1_1;3
	@cprint	#help_str1_2;5
	bra	help4
help2	@cprint	#help_str2_1;3
	@cprint	#help_str2_2;5
	bra	help4
help3	@cprint	#help_str3_1;3
	@cprint	#help_str3_2;5

help4
	@cprint	#help_str8;8
	@cprint	#help_str9;9
	@cprint	#help_str11;11
	@cprint	#help_str12;12
	@cprint	#help_str14;14
	@cprint	#help_str16;16

	jsr	attente

*--- Restore all
	
	PushLong	#old_pattern
	_SetPenPat

	jsr	fadeOUT	; fade
	jsr	loadBACK	; restore background
	lda	oldWIDTH	; restore width
	sta	mainWIDTH
	rts		; and exit

*---

helpRECT1	dw	5,125,195,515
helpRECT2	dw	7,127,193,512

white_pattern
	ds	32,$ff

*--- Caract�res Atari SVP
	
help_str1_1	asc	'1. 'd2' Heurts d'27'ouverture 'd300
help_str1_2	asc	'- Fran'8d'ois Coulon et Sylvie Sarrat -'00
help_str2_1	asc	'2. 'd2' Cheek to cheek & ashes to ashes 'd300
help_str2_2	asc	'- Fran'8d'ois Coulon et Faustino Ribeiro -'00
help_str3_1	asc	'3. 'd2' Un appel '85' la m'8e'moire 'd300
help_str3_2	asc	'- Fran'8d'ois Coulon et Laurent Cotton -'00

help_str8	asc	'OA-S : sauver la situation'00
help_str9	asc	'OA-O : recharger une situation'00
help_str11	asc	'OA-Z : musique on/off'00
help_str12	asc	'OA-R : retour au menu'00
help_str14	asc	'Toute autre touche : retour '85' l'27'aventure'00
help_str16	asc	'OA-Q : quitter le jeu'00

*-----------------------
* MOTS_CLICABLES
*-----------------------
* mots_clicables(texte$)

mots_clicables
*	lda	#-1	; force un mot diff�rent en entr�e de sc�ne
*	sta	mot_ancien

	lda	#0	; on init les registres (mais pourquoi ?)
	tax
	tay
	sep	#$20	; texte2$=UPPER$(texte$)
	ldx	#0
]lp	lda	texte_final,x
	tay
	lda	tblATARI,y
	tay
	lda	tblUPPER,y
	sta	texte,x
	inx
	cpx	#max_colonnes*max_lignes
	bcc	]lp
	
	ldx	scene_actuelle
	lda	pointeur_mots-1,x
	sta	nb_mots
	stz	index_mot

* FOR i%=1 TO pointeur_mots|(scene_actuelle|)

mc_1	rep	#$20

	pha		; calcul l'index dans la dimension NB_MOTS
	pha
	lda	scene_actuelle
	dec
	pha
	PushWord	#NB_MOTS	; taille d'une dimension
	_Multiply
	pla
	asl
	sta	localOFFSET
	clc
	adc	#fonction_mots
	sta	dpINDEX	; on pointe sur fonction_mots(scene_actuelle)
	pla

	stz	i	; l'index dans texte
	
*-- mot$=fonction_mot$(scene_actuelle|,i%)
*-- mot2$=UPPER$(mot$)

	lda	index_mot	; prend l'adresse du mot
	asl		; dans ptrINDEX
	tay
	lda	(dpINDEX),y
	sta	dpINDEX
	lda	ptrINDEX+2
	sta	dpINDEX+2
	
	lda	#0	; on initialise les registres
	tax
	tay
	sep	#$20	; on majusculinise le mot
]lp	lda	[dpINDEX],y
	cmp	#instrSPACE
	beq	mc_2
	tax
	lda	tblATARI,x	; from Atari to IIgs
	tax
	lda	tblUPPER,x	; to upper case
	sta	mot,y
	iny
	bne	]lp

mc_2	sty	len_max

*--- REPEAT
*--- pointeur_mot%=INSTR(texte2$,mot2$,pointeur_mot%)
*--- IF INSTR(alphabet$,UPPER$(MID$(texte$,pointeur_mot%-1,1)),1)=0 AND INSTR(alphabet$,UPPER$(MID$(texte$,pointeur_mot%+LEN(mot$),1)))=0
	
	ldx	i	; on commence avec 0
mc_3	ldy	#0
]lp	lda	mot,y	; compare le mot
	cmp	texte,x
	bne	mc_5	; pas le m�me mot

	inx
	iny
	cpy	len_max
	bcc	]lp

	jsr	test_condition	; v�rifie s'il est cliquable
	bra	mc_6		; mot suivant

mc_5	inx	
	cpx	#max_colonnes*max_lignes
	bcc	mc_3

*--- UNTIL affichage!=TRUE

*--- NEXT i%

mc_6	inc	index_mot
	lda	index_mot
	cmp	nb_mots
	bcs	mc_99
	brl	mc_1
mc_99	rep	#$20	; on sort
	rts

*---
* test_condition
* on entre en A=8-bits
* on doit ressortir en A=8-bits
* si le mot est cliquable on remplit texte_color


	mx	%00
	
test_condition
	rep	#$20
	phx		; 3,s
	phy		; 1,s
	
* condition&=condition&(scene_actuelle|,i%)

	lda	index_mot
	asl
	clc
	adc	localOFFSET
	tax
	lda	condition,x	; xxx2B ou yy2D
	pha
	and	#$ff00	; index dans scene_visitee
	xba
	tax
	lda	scene_visitee-1,x
	and	#$ff
	tax		; true ou false
	pla
	and	#$00ff	; 2B ou 2D

* IF (condition&>0 AND scene_visitee!(ABS(condition&))=TRUE) OR (condition&<0 AND scene_visitee!(ABS(-condition&))=FALSE)

	cmp	#'+'
	bne	tc_moins
	cpx	#TRUE
	beq	tc_addmot
	bne	tc_prendpas

tc_moins	cpx	#FALSE
	bne	tc_prendpas

tc_addmot	ply		; marque le mot dans les buffers
	plx
	sep	#$20
]lp	dex
	dey
	bmi	tc_ok	; on sort sans d�piler
	lda	#colorWHITE
	sta	texte_color,x
*	lda	index_mot
*	inc
*	sta	texte_index,x
	bra	]lp
	
tc_prendpas	ply
	plx
	
tc_ok	sep	#$20
	rts

	mx	%00

*-----------------------
* MUSIQUE - OK
*-----------------------
* musique(module$)

musique
	rts
	
*-----------------------
* FIN_MUSIQUE - OK
*-----------------------
* fin_musique

fin_musique
	rts

*-----------------------
* MON BEAU CURSEUR
*-----------------------

monCURSEUR
	dw	16,4
	hex	0000000000000000	; data
	hex	00000000000000F0
	hex	000000000000FFF0
	hex	000000000000F0F0
	hex	0000000000FFF0F0
	hex	00000000FFF00FF0
	hex	000000FFF0000F00
	hex	0000FFF00000FF00
	hex	000FF0000000F000
	hex	00FF0000000FF000
	hex	00F00000000F0000
	hex	00F0000000FF0000
	hex	00F0000000F00000
	hex	00F000000FF00000
	hex	00000000FF000000
	hex	0000FFFFF0000000
	hex	0000000000000000	; mask
	hex	0000000000000FF0
	hex	00000000000FFFF0
	hex	000000000FFF0F00
	hex	0000000FFF00FF00
	hex	00000FFF0000F000
	hex	000FFF00000FF000
	hex	00FF0000000F0000
	hex	0FF0000000FF0000
	hex	0F00000000F00000
	hex	0F0000000FF00000
	hex	0F0000000F000000
	hex	0F000000FF000000
	hex	0FF0000FF0000000
	hex	00FFFFFF00000000
	hex	0000000000000000
	dw	2,14

*--- The end
