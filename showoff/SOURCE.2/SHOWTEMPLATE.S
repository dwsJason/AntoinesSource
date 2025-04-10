;------------------------------------------------------------------
;
; FILE : SHOWTEMPLATE.S                 -Define Template -
;        --------------
;
;------------------------------------------------------------------
;...............................................................
;
;        DoTemplate : Fabrique un Template
;
;...............................................................
DoTemplate     START
               Using GlobalData
               Using MenuData
               Using WindowData
               Using SeqEditData

               lda Mode_Showoff
               cmp #Mode_Rien
               beq GotoTemplate
               cmp #Mode_Frame
               bne EnterFrame
;--
GotoTemplate   brl EnterTemplate
;--------------------------------------
EnterFrame     ANOP                     |Retour en Frame Editor

               lda FrameOn              |Retour sur Frame ou rien
               beq RtNoFrame
;--
RtInFrame      ANOP                     |Retour avec une frame courante
;--
               jsr Really_Template      |Attention a la Modif
               bcc OufNon

               jsr CreateTemplate       |Assign un template a la Frame
               bcc SRIFT
;--
               rts                      |probleme template on reste
;--
SRIFT          jsr Gere_Template        |CAUTION DEBUG +++++
               bcc OufNon

               lda #1
               sta TMPBeenMod

               jsr NewOldTemplate       |Creation du Template

OufNon         ANOP

SOufNon        jsr LoadCurFrame         |Recharge la Frame

               lda #Mode_Frame
               sta Mode_Showoff

               jsr Raz_Select
               jsr MenuItemOn

               PushLong #ClearFrame     |Clear Frame
               PushWord #266
               _SetMItem

               PushLong #TemplateMenu   |Template
               PushWord #272
               _SetMItem

               PushWord #271            |Label On
               _EnableMItem

               jsr Recal_Menu

               PushWord #0              |le retaille
               PushWord #0
               PushWord #3
               _CalcMenuSize

               _DrawMenuBar

               PushLong #0
               _RefreshDeskTop

               rts
;--
RtNoFrame      ANOP                     |Retour sur une Place Vide
               jsr Save_Before
               bcc SRtNoFrame
               rts
SRtNoFrame     jsr Reset_Frame

               lda #Mode_rien           |Rien dans le Mode
               sta Mode_showoff

               lda #$FFFF
               sta Status_Ecran

               stz Top_Action
               stz Top_ActionG

               rts
;--------------------------------------
EnterTemplate  ANOP                     |Passe en Template Mode
               lda FrameOn              |y a t'il une frame courante
               beq NoFrameTemp
;----------
okFrameTemp    ANOP

               lda Sequ_Template        |POUR L'ALERT
               sta ZSequ_Template
               sta Z1Sequ_Temp
               lda Sequ_TemplateB
               sta Z1Sequ_TempB
;--
               lda Top_Action
               beq okFT0
               sta Top_ActionG
               lda #$F1
               sta FrameType
               jsr SetFlagFrame
               jsr SaveCurFrame         |Sauve la Frame courante
               bcc okFT0
               jsl Maj_FrameW
               rts
;--
okFT0          ANOP
               jsr ETFrame
               lda #0
               sta Beware_Change
               sta Top_Action

               jsr FindTemplate         |Affiche ou en blanc

               rts
;-----------
NoFrameTemp    ANOP
               jsr ETFrame
               jsr createFrameT         |creation d'une frame Template
;-----------
ETFrame        ANOP
               lda #Mode_Template
               sta Mode_ShowOff

               jsr SetMenuTempl         |Menu Du Template
               rts
;--------------------------------------
;        SetMenuTempl : grille de menu
;--------------------------------------
SetMenuTempl   ENTRY

               lda #NbMenuT-1
rMenuItemOn    pha
               asl a
               tax
               lda TableMenuT,x
               pha
               _EnableMItem
               pla
               dec a
               bpl rMenuItemOn
;--
SetMenuTemplf  ENTRY

               lda #NbMenuTf-1
rMenuItemOff   pha
               asl a
               tax
               lda TableMenuTf,x
               pha
               _DisableMItem
               pla
               dec a
               bpl rMenuItemOff
;--
               lda Mode_ShowOff         |si label on arrete la
               cmp #Mode_Label
               bne Snolabel
               rts
;--
Snolabel       PushLong #FrameMenu      |now Frame
               PushWord #272
               _SetMItem

               PushLong #ClearTemplate  |Clear Template
               PushWord #266
               _SetMItem

               PushWord #0
               PushWord #0
               PushWord #3
               _CalcMenuSize

               _DrawMenuBar

               jsl Maj_OptionW          |Maj Cartouche

               rts
;--
NbMenuT        equ 17

TableMenuT     dc i'258,259,260,261,262,263'
               dc i'266,270,272'
               dc i'277,278,279'
               dc i'282,283,284,285,288'
;--
NbMenuTf       equ 8

TableMenuTf    dc i'271,273,274,281,287,289,290,293'
;--------------------------------------
;        CreateFrameT
;--------------------------------------
CreateFrameT   ENTRY

               PushLong #0              |Fenetre FRAME
               PushLong #FrameWindow
               _NewWindow
               pla
               sta Ptr_FrameW
               pla
               sta Ptr_FrameW+2
;--
               stz Status_Ecran         |Half Page
;--
               lda #0                   |mode MOVE
               sta Choix_Option
               jsr In_Option1

               rts
;--------------------------------------
;        FindTemplate
;--------------------------------------
FindTemplate   ENTRY

               lda Sequ_Template
               beq TemplateBlanc
;--
TemplateExist  ANOP

               jsr LoadaTemplate        |le Charge

               jsr Recal_Menu           |Menu Change

               jsl Maj_FrameW           |l'affiche

               rts
;--------------------------------------
;        TemplateBlanc
;--------------------------------------
TemplateBlanc  ENTRY

               jsr OkClearFrame         |Frame raz

               rts
;--------------------------------------
;        Rest_Debut
;--------------------------------------
Reset_Frame    ENTRY

               jsr OkClearFrame1        |Nettoyage complet

               PushLong Ptr_FrameW      |Ferme Fenetre
               _CloseWindow

               jsr MenuDebut            |menu initiale

               lda #Mode_Rien           |Mode Rien
               sta Mode_ShowOff

               jsl Maj_OptionW

               rts
;--------------------------------------
;        MenuDebut
;--------------------------------------
MenuDebut      ENTRY

               lda #NbMenuDb-1
rMenudb        pha
               asl a
               tax
               lda TableMenudb,x
               pha
               _DisableMItem
               pla
               dec a
               bpl rMenudb

               PushLong #ClearFrame     |Clear Frame
               PushWord #266
               _SetMItem

               PushLong #TemplateMenu   |Template
               PushWord #272
               _SetMItem

               PushWord #271            |Label On
               _EnableMItem

               PushWord #0
               PushWord #0
               PushWord #3
               _CalcMenuSize

               _DrawMenuBar

               jsl Maj_OptionW          |Maj Cartouche

               rts
;--
NbMenudb       equ 29

TableMenudb    dc i'259,260,261,262,263'
               dc i'265,266,267,268,269,273,274'
               dc i'275,276,277,278,279,280,281'
               dc i'282,283,284,285,286,287,288'
               dc i'289,290,293'
;--------------------------------------
;        CreateTemplate
;--------------------------------------
CreateTemplate ENTRY

               lda Frame_Border         |Border or No Border
               sta Sequ_TemplateB
;--
Save2Template  ENTRY
;--
;              jsr Make_NameT           |creation NAME.T (T for Template)
;              jsr Swap_TName
;--
               jsr FindTempName
               lda #$F1
               sta FrameType
               jsr SaveTemplate
;--
;              php
;              jsr Swap_TName
;              plp
;--
FS2T           rts                      |CARRY +++
;--------------------------------------
;        Make_NameT
;--------------------------------------
Make_NameT     ENTRY

               jsr Copy_FrameName

               lda Sequ_NTemplate
               and #$00FF
               sec
               sbc #2
               tax
               lda #'T.'
               sta Sequ_NTemplate,x

               dec Sequ_NTemplate

               rts
;--------------------------------------
;        Really_Template
;--------------------------------------
Really_Template ENTRY

               lda Top_Action
               beq SRTemp

               lda #1
               sta Sequ_Template
               bra Alert_Beware
;--
SRTemp         lda Beware_Change
               beq OufRt
;--
Alert_Beware   lda #TxBeware
               sta ItemAp2Tx
               lda #^TxBeware
               sta ItemAp2Tx+2

               lda #TxBeware1
               sta ItemAp3Tx
               lda #^TxBeware1
               sta ItemAp3Tx+2

               PushWord #0
               PushLong #Alert_Dialog
               PushLong #0
               _NoteAlert
               pla
               cmp #1
               beq okRT
;--
OufRT          ENTRY
               lda Z1Sequ_Temp
               sta Sequ_Template
               lda Z1Sequ_TempB
               sta Sequ_TemplateB
               clc
               rts
;--
OkRt           lda BeenModiFied
               ora #$0001
               sta BeenModified
;--
               sec
               rts
;...............................................................
;
;        Gere_Template
;
;...............................................................
Gere_Template  ENTRY

               lda Sequ_Template
               bne YesTemp
;--------
NoTemp         ANOP
               lda ZSequ_Template
               bne Del_Old
;-
Nothing        clc
               rts
;-
Del_Old        jsr Dealloc_Template
               clc
               rts
;--------
YesTemp        ANOP
               lda ZSequ_Template
               bne simpload
;-
cre_buf        jsr Alloc_Template
               sec
               rts
;-
simpload       sec
               rts
;--
Z1Sequ_Temp    ds 2
Z1Sequ_TempB   ds 2
;--
               END
;...............................................................
;
;        DoNewT : Do New Template
;
;...............................................................
DoNewT         START
               Using GlobalData
               Using WindowData

               lda Top_Action           |Modif
               beq ok
;--
               lda #TxClearTempl
               sta ItemAp3Tx
               lda #^TxClearTempl
               sta ItemAp3Tx+2

               jsr Really_New
               cmp #1
               beq ok
               rts
;--
ok             jsr OkClearFrame         |init Fenetre

               lda #0
               sta Top_Action
               sta Ya1Nom

               lda ZSequ_Template       |ALERT
               sta Beware_Change

               lda #0                   |No Template
               sta Sequ_Template

               rts

               END
;...............................................................
;
;        DoOpenT : Do Open Template
;
;...............................................................
DoOpenT        START
               Using GlobalData
               Using ProdosData
               Using SeqEditData
               Using WindowData
;--
               PushWord #20
               PushWord #20
               PushLong #TxLoadTempl
               PushLong #0
               PushLong #TypeListTempl
               PushLong #Reply
               _SFGetFile

               lda Reply_Good
               bne ok
               rts
;--
ok             jsr Copy_TName

               jsr LoadaTemplate1

               jsr Recal_Menu

               PushLong Ptr_FrameW
               _SetPort

               PushLong #FullRect
               _InvalRect

               lda #1
               sta Beware_Change
               sta Sequ_Template

               rts
;--------------------------------------
;        LoadaTemplate
;--------------------------------------
LoadaTemplate1 ENTRY

               lda #0
               sta Top_Action

               jsr Swap_TName

               jsr LoadNameDTmp
               bcs koLT
               bcc SLoadaTemp1
;--------
LoadaTemplate  ENTRY

               jsr Make_NameT
;--
               lda #0
               sta Top_Action

               jsr Swap_TName

               jsr LoadTemplate
               bcs koLT
;--
SLoadATemp1    jsr Swap_TName

               jsr Raz_Select           |No Selection

               jsr Resize_Frame         |Retaille les Buffers

               lda Mode_ShowOff
               cmp #Mode_Label
               beq cba

               lda #1
               sta Ya1Nom

cba            clc
               rts
KoLT           sec
               rts
;--------------------------------------
;        Copy_Tname
;--------------------------------------
Copy_TName     ENTRY

               ldy #128
RCopy_TName    lda Reply_Fullname,y
               sta Sequ_NTemplate,y
               dey
               dey
               bpl RCopy_TName

               rts
;--------------------------------------
;        Copy_FrameName
;--------------------------------------
Copy_FrameName ENTRY

               ldy #128
RCopy_FrameNam lda FrameFullName,y
               sta Sequ_NTemplate,y
               dey
               dey
               bpl RCopy_FrameNam

               rts
;--------------------------------------
;        Swap_TName
;--------------------------------------
Swap_TName     ENTRY

               ldy #128

               sep #$30
               longa off
               longi off

RSwap_Name     lda Sequ_NTemplate,y
               tax
               lda FrameFullName,y
               sta Sequ_NTemplate,y
               txa
               sta FrameFullName,y
               dey
               bpl RSwap_Name

               rep #$30
               longa on
               longi on

               rts
;--------------------------------------
;        Copy_To_FullN
;--------------------------------------
Copy_To_FullN  ENTRY

               ldy #128

               sep #$30
               longa off
               longi off

RCopy_To_FN    lda Sequ_NTemplate,y
               sta Reply_FullName,y
               dey
               bpl RCopy_To_FN

               rep #$30
               longa on
               longi on

               rts

               END
;...............................................................
;
;        DoSaveT : Do Save Template
;
;...............................................................
DoSaveAsT      START
               Using GlobalData
               Using ProdosData
;--
               PushWord #20
               PushWord #20
               PushLong #TxSaveTempl
               PushLong #0
               PushWord #15
               PushLong #reply
               _SFPutFile

               lda reply_good
               bne OkSave
               sec
               rts
;--
oksave         ANOP
               jsr Copy_TName
               lda #1
               sta Ya1Nom
;--
DoSaveT        ENTRY
               lda Ya1Nom
               beq DoSaveAsT

               jsr Swap_TName

               lda #$F3
               sta FrameType
               jsr SaveTemplate
               php
               jsr Swap_TName
               plp
               bcc SDST
               rts
;--
SDST           lda Top_Action
               beq FSaveT
               lda #1
               sta Beware_Change
;--
               lda #0                   |ok Sauve
               sta Top_Action

FSaveT         rts

               END
;...............................................................
;
;        ShowTemplate : faire ou defaire Template
;
;...............................................................
DoShowHideTp   START
               Using Globaldata
               Using ProdosData

               lda Frame_Template
               beq Show_Template
;--
Hide_Template  ANOP

               lda #0
               sta Frame_Template
               jsl Maj_FrameW
               jsr Recal_Menu

               lda #1
               sta Top_Action
               rts
;--
Show_Template  ANOP

               lda #1
               sta Frame_Template
               jsl Maj_FrameW
               jsr Recal_Menu

               lda #1
               sta Top_Action
               rts
;--------------------------------------
;        NewOldTemplate
;--------------------------------------
NewOldTemplate ENTRY

               lda Sequ_Template
               beq NewTemplate1
               cmp #1
               beq Old_Template
               rts

NewTemplate1   lda #1
               sta Sequ_Template

;--------------------------------------
;        New_Template
;--------------------------------------
New_Template   ENTRY

               lda Sequ_Template
               bne ok
               clc
               rts
;--
ok             jsr Alloc_Template       |Creation d'un Buffer template
;--
Old_Template   ENTRY

               jsr LoadATemplate        |Charge template .T
               bcs Ko_SF

               lda #1                   |Le Calcul
               sta Top_Bitmap
               sta Force_Bitmap

               jsl Maj_FrameW

               jsr D_Hdl_Template

               ldy #$7CFE
ROLD_T         lda [Ptr_Fond],y
               sta [Ptr_Template],y
               dey
               dey
               bpl ROLD_T

Ok_Sf          jsr U_Hdl_Template       |unlock
               clc

Ko_SF          rts
;--------------------------------------
;        Trt_ErrLoadTM
;--------------------------------------
Trt_ErrLoadTM  ANOP

               _InitCursor

               jsr Eff_Template

               lda #0
               sta Sequ_Template

               rts
;--------------------------------------
;        Eff_Template
;--------------------------------------
Eff_Template   ENTRY

               lda Sequ_Template
               bne OkEff
               rts
;--
OkEff          jsr Dealloc_Template     |enleve la bitmap Template

               rts

               END
;...............................................................
;
;        Redraw_Template
;
;...............................................................
Redraw_Template START
               Using GlobalData
               Using WindowData
;--
               lda Mode_ShowOff         |uniquement pour la frame
               cmp #Mode_Frame
               bne ko
;--
               lda Sequ_Template
               beq ko
               lda Frame_Template
               bne ok
ko             rts
;--
ok             PushLong #PortFond
               _SetPort
;--
Fond_Template  lda #0
               sta >DestY
               lda #0
               sta >DestX

               lda Hdl_Template
               ldx Hdl_Template+2
               jsr PaintPixelF

               rts

               END
;...............................................................
;
;        DoLabel : Creation d'un Label
;
;...............................................................
DoLabel        START
               Using GlobalData
               Using MenuData
               Using WindowData
               Using SeqEditData
               Using ProdosData

               lda Mode_Showoff
               cmp #Mode_Rien
               beq EnterLabel
               cmp #Mode_Frame
               beq EnterLabel
;--------------------------------------
ReturnFrame    ANOP                     |Retour en Frame Editor
;--
               jsr Save_Before
               bcc SReturnFrame
               rts
;--
SReturnFrame   PushLong #ClearFrame     |Clear Frame
               PushWord #266
               _SetMItem

               PushLong #LabelMenu      |Label
               PushWord #271
               _SetMItem

               PushWord #272            |Template On
               _EnableMItem

               lda FrameOn              |Retour sur Frame ou rien
               beq RtNoFrame
;--
RtInFrame      ANOP                     |Retour avec une frame courante

               jsr LoadCurFrame         |Recharge la Frame

               lda #Mode_Frame
               sta Mode_Showoff

               jsr Raz_select
               jsr MenuItemOn

               jsr Recal_Menu

               PushLong #0
               _RefreshDeskTop

               rts
;--
RtNoFrame      ANOP                     |Retour sur une Place Vide
               jsr Reset_Frame

               lda #Mode_rien           |Rien dans le Mode
               sta Mode_showoff

               lda #$FFFF
               sta Status_Ecran

               stz Top_Action
               stz Top_ActionG

               rts
;--------------------------------------
EnterLabel     ANOP                     |Passe en Template Mode
               lda FrameOn              |y a t'il une frame courante
               beq NoFrameTemp
;-----------
okFrameTemp    ANOP
               lda Top_Action
               beq okFT0
               sta Top_ActionG
;--
               lda #$F1
               sta FrameType
               jsr SetFlagFrame
               jsr SaveCurFrame         |Sauve la Frame courante
               bcc okFT0
               jsl Maj_frameW
               rts
;--
okFT0          ANOP
               jsr ELFrame
               lda #0
               sta Top_Action
               sta Ya1NomL
               jsr OkClearFrame
               rts
;-----------
NoFrameTemp    ANOP
               jsr ELFrame
               jsr createFrameT         |creation d'une frame Template
               rts
;--
ELFrame        lda #Mode_Label
               sta Mode_ShowOff

               jsr SetMenuTempl         |Menu Du Template
               jsr SetMenuLabel         |mais en Label

               rts
;--------------------------------------
SetMenuLabel   ENTRY

               PushWord #272            |no template
               _DisableMItem

               PushWord #271            |label = frame
               _EnableMItem

               PushLong #FrameMenu      |now Frame
               PushWord #271
               _SetMItem

               PushLong #ClearLabel     |Clear Label
               PushWord #266
               _SetMItem

               PushWord #0
               PushWord #0
               PushWord #3
               _CalcMenuSize

               _DrawMenuBar

               jsl Maj_OptionW          |Maj Cartouche

               rts
;...............................................................
;
;        DoNewL : Do New Label
;
;...............................................................
DoNewL         ENTRY

               lda Top_Action           |Modif
               beq ok
;--
               lda #TxClearLabel
               sta ItemAp3Tx
               lda #^TxClearLabel
               sta ItemAp3Tx+2

               jsr Really_New
               cmp #1
               beq ok
               rts
;--
ok             jsr OkClearFrame         |init Fenetre

               lda #0
               sta Top_Action
               sta Ya1NomL

               rts
;...............................................................
;
;        DoOpenL : Do Open Label
;
;...............................................................
DoOpenL        ENTRY
;--
               PushWord #20
               PushWord #20
               PushLong #TxLoadLabel
               PushLong #0
               PushLong #TypeListLabel
               PushLong #Reply
               _SFGetFile

               lda Reply_Good
               bne okL
               rts
;--
okL            jsr Copy_TName

               jsr LoadaTemplate1

               lda #1
               sta Ya1NomL

               jsr Recal_Menu

               PushLong Ptr_FrameW
               _SetPort

               PushLong #FullRect
               _InvalRect

               rts
;...............................................................
;
;        DoSaveL : Do Save Label
;
;...............................................................
DoSaveAsL      ENTRY
;--
               brk $EE
;--
               PushWord #20
               PushWord #20
               PushLong #TxSaveLabel
               PushLong #0
               PushWord #15
               PushLong #reply
               _SFPutFile

               lda reply_good
               bne OkSave
               sec
               rts
;--
oksave         ANOP
               jsr Copy_TName
               lda #1
               sta Ya1NomL
;--
DoSaveL        ENTRY
               lda Ya1NomL
               beq DoSaveAsL

               jsr Swap_TName

               lda #$F4
               sta FrameType
               jsr SaveTemplate
               php
               jsr Swap_TName
               plp
               bcs FDSL

               lda #0                   |ok Sauve
               sta Top_Action

FDSL           rts
;--------------------------------------
Ya1NomL        dc i'0'
;--------------------------------------
               END
