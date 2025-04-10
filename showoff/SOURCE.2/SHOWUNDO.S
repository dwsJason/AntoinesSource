;------------------------------------------------------------------
;
; FILE : SHOWUNDO.S                     - undo -
;        ----------
;
;------------------------------------------------------------------
;...............................................................
;
;        DoUndo : faire le undo
;
;...............................................................
DoUndo         START
               Using GlobalData

               jsr Load_Undo
;--
               jsr Cop_rgn0_shape
;--
               ldy #6
RDoUndo        lda RectF_Undo,y
               sta Rect_SelectF,y
               dey
               dey
               bpl RDoUndo
;-
               jsr Cop_rgn1_shape
               jsr Aff_ShapeS
;--
               jsr Del_Undo

               rts
;...............................................................
;
;        Save_Undo : Sauver l'etat des objets selectionnes
;
;...............................................................
Save_Undo      ENTRY
;--
               lda Ch_Group
               cmp #8
               bne Save_Undo1
Ko_SU          rts
;--
Save_Undo0     ENTRY
               lda Nb_List_Select
               beq Ko_SU
               bra Ok_SU0
;--
Save_Undo1     ENTRY
               lda Nb_List_Select       |y a du monde ?
               bne ok_SU
               rts
;--
ok_SU          ANOP
               jsr Copy_Rect_Undo       |Sauve Select Rect
;--
Ok_SU0         ANOP
               jsr Taille_Undo
               bcc okSU1
;--
Del_Undo       ENTRY
               lda #0
               sta Taille_B_Undo
               lda #1
               jsr Resize_Undo
               PushWord #265            |desole mais pas de place
               _DisableMItem
               rts
;--
OkSU1          ANOP
               jsr Copy_List_Undo       |copie la list select
               jsr Copy_Undo            |stocke dans le buffer
               PushWord #265
               _EnableMItem
               rts
;...............................................................
;
;        Load_Undo : remettre l'etat des objets selectionnes
;
;...............................................................
Load_Undo      ENTRY

               jsr Rest_Undo
               rts
;...............................................................
;
;   Taille_Undo : reserve buffer si possible
;
;...............................................................
Taille_Undo    ENTRY

               lda #0
               sta Taille_B_Undo
;--
               lda Nb_List_Select
               bne okTU
               sec
               rts
;--
okTU           ANOP

LoopTU         pha
               asl a
               tay
               lda List_Record,y
               jsr Taille_Elt
               pla
               dec a
               bne LoopTU
;--
               lda Taille_B_Undo
               jsr Resize_Undo
               rts
;--------------------------------------
;        Taille_Elt
;--------------------------------------
Taille_Elt     ANOP
               and #$FF00
               xba
               asl a
               tax
               jsr (Table_Taille_Elt,x)
               clc
               adc Taille_B_Undo
               sta Taille_B_Undo
               rts
;--
Taille_texte   ANOP
               lda #T_U_Texte
               rts
Taille_Shape   ANOP
               lda #T_U_Shape
               rts
Taille_Icon    ANOP
               lda #T_U_Icon
               rts
Taille_Number  ANOP
               lda #T_U_Number
               rts
Taille_Graph   ANOP
               lda #T_U_Graph
               rts
Taille_Sticker ANOP
               lda #T_U_Sticker
               rts
;...............................................................
;
;   Copy_Undo : Copy element
;
;...............................................................
Copy_Undo      ENTRY
;--
               lda #0                   |des buffers vers UNDO
               sta Mode_Undo
               bra SCopy_Undo
;--
Rest_Undo      ENTRY
               lda #1                   |du UNDO vers Buffers
               sta Mode_Undo
;--
SCopy_Undo     lda Nb_Elt_Undo
               bne OkCU
               clc
               rts
;--
OkCU           ANOP
               lda #0                   |debut du buffer
               sta Indice_Undo

               lda Nb_Elt_Undo
LoopCU         pha
               asl a
               tay
               lda Undo_Record,y
               jsr Copy_Elt
               pla
               dec a
               bne LoopCU

               jsr Copy_Undo_List

               rts
;--------------------------------------
;        Copy_Elt
;--------------------------------------
Copy_Elt       ENTRY
               pha
               and #$FF00
               xba
               asl a
               tax
               pla
               jsr (Table_Copy_Elt,x)
               rts
;--------------------------------------
Copy_texte     ANOP
               jsr Swap_U_Text
               rts
;--------------------------------------
Copy_Shape     ANOP
               jsr Swap_U_Shape
               rts
;--------------------------------------
Copy_Icon      ANOP
               jsr Swap_U_Icon
               rts
;--------------------------------------
Copy_Number    ANOP
               jsr Swap_U_Number
               rts
;--------------------------------------
Copy_Graph     ANOP
               jsr Swap_U_Graph
               rts
;--------------------------------------
Copy_Sticker   ANOP
               jsr Swap_U_Sticker
               rts
;...............................................................
;
;        Resize_Undo : buffer reduit a 1
;
;...............................................................
Resize_Undo    ENTRY

               Pea $0000
               pha
               PushLong Hdl_Undo
               _SetHandleSize
               rts
;...............................................................
;
;    Swap_U_Shape : Copie Buffer Shape -> Record UNDO
;                     ACC=N% de shape   mode0->   1<-
;...............................................................
Swap_U_Shape   ENTRY
;--
               pha
               jsr D_Hdl_Shape          |Deref
               jsr D_Hdl_Undo           |Deref
               pla
               and #$00FF
               dec a

               PushLong #0
               Pha                      |n% de Shape
               PushWord lg_ShapeRecord  |taille d'1 Shape
               _Multiply
               pla
               plx
               sta Pt_buffer

               lda Indice_Undo
               sta Pt_Undo

               ldx #T_U_Shape
               dex
               dex
;--
               lda Mode_Undo
               bne Loop_SUS1
;--
LOOP_SUS0      ldy Pt_Buffer            |buffer -> undo
               lda [Ptr_Shape],y
               ldy Pt_Undo
               sta [Ptr_Undo],y
               inc Pt_Buffer
               inc Pt_Buffer
               inc Pt_Undo
               inc Pt_Undo
               dex
               dex
               bpl LOOP_SUS0
               bra S_SUS
;--
LOOP_SUS1      ldy Pt_Undo              |Undo -> Buffer
               lda [Ptr_Undo],y
               ldy Pt_Buffer
               sta [Ptr_Shape],y
               inc Pt_Buffer
               inc Pt_Buffer
               inc Pt_Undo
               inc Pt_Undo
               dex
               dex
               bpl LOOP_SUS1
;--
S_SUS          lda Indice_Undo
               clc
               adc #T_U_Shape
               sta Indice_Undo

               jsr U_Hdl_Shape          |libere
               jsr U_Hdl_Undo           |libere

               rts
;...............................................................
;
;    Swap_U_Icon : Copie Buffer Icon -> Record UNDO
;                     ACC=N% de shape   mode 0->   1 <-
;...............................................................
Swap_U_Icon    ENTRY
;--
               pha
               jsr D_Hdl_BIcon          |Deref
               jsr D_Hdl_Undo           |Deref
               pla
               and #$00FF
               dec a

               PushLong #0
               Pha                      |n% de Icon
               PushWord lg_IconRecord   |taille d'1 Icon
               _Multiply
               pla
               plx
               sta Pt_buffer

               lda Indice_Undo
               sta Pt_Undo

               ldx #T_U_Icon
               dex
               dex
;--
               lda Mode_Undo
               bne Loop_SUI1
;--
LOOP_SUI0      ldy Pt_Buffer            |buffer -> undo
               lda [Ptr_BIcon],y
               ldy Pt_Undo
               sta [Ptr_Undo],y
               inc Pt_Buffer
               inc Pt_Buffer
               inc Pt_Undo
               inc Pt_Undo
               dex
               dex
               bpl LOOP_SUI0
               bra S_SUI
;--
LOOP_SUI1      ldy Pt_Undo              |Undo -> Buffer
               lda [Ptr_Undo],y
               ldy Pt_Buffer
               sta [Ptr_BIcon],y
               inc Pt_Buffer
               inc Pt_Buffer
               inc Pt_Undo
               inc Pt_Undo
               dex
               dex
               bpl LOOP_SUI1
;--
S_SUI          lda Indice_Undo
               clc
               adc #T_U_Icon
               sta Indice_Undo

               jsr U_Hdl_BIcon          |libere
               jsr U_Hdl_Undo           |libere

               rts
;...............................................................
;
;    Swap_U_Sticker : Copie Buffer Sticker -> Record UNDO
;                     ACC=N% de sticker mode 0->   1 <-
;...............................................................
Swap_U_Sticker ENTRY
;--
               pha
               jsr D_Hdl_Sticker        |Deref
               jsr D_Hdl_Undo           |Deref
               pla
               and #$00FF
               dec a

               PushLong #0
               Pha                         |n% de sticker
               PushWord lg_StickerRecord   |taille d'1 sticker
               _Multiply
               pla
               plx
               sta Pt_buffer

               lda Indice_Undo
               sta Pt_Undo

               ldx #T_U_Sticker
               dex
               dex
;--
               lda Mode_Undo
               bne Loop_SUK1
;--
LOOP_SUK0      ldy Pt_Buffer            |buffer -> undo
               lda [Ptr_Sticker],y
               ldy Pt_Undo
               sta [Ptr_Undo],y
               inc Pt_Buffer
               inc Pt_Buffer
               inc Pt_Undo
               inc Pt_Undo
               dex
               dex
               bpl LOOP_SUK0
               bra S_SUK
;--
LOOP_SUK1      ldy Pt_Undo              |Undo -> Buffer
               lda [Ptr_Undo],y
               ldy Pt_Buffer
               sta [Ptr_Sticker],y
               inc Pt_Buffer
               inc Pt_Buffer
               inc Pt_Undo
               inc Pt_Undo
               dex
               dex
               bpl LOOP_SUK1
;--
S_SUK          lda Indice_Undo
               clc
               adc #T_U_Sticker
               sta Indice_Undo

               jsr U_Hdl_Sticker        |libere
               jsr U_Hdl_Undo           |libere

               rts
;...............................................................
;
;    Swap_U_Graph: Copie Buffer Graph-> Record UNDO
;                     ACC=N% de Graph   mode 0->   1 <-
;...............................................................
Swap_U_Graph   ENTRY
;--
               pha
               jsr D_Hdl_Graph          |Deref
               jsr D_Hdl_Undo           |Deref
               pla
               and #$00FF
               dec a

               PushLong #0
               Pha                      |n% de Icon
               PushWord lg_GraphRecord  |taille d'1 Graph
               _Multiply
               pla
               plx
               sta Pt_buffer

               lda Indice_Undo
               sta Pt_Undo

               ldx #T_U_Graph
               dex
               dex
;--
               lda Mode_Undo
               bne Loop_SUG1
;--
LOOP_SUG0      ldy Pt_Buffer            |buffer -> undo
               lda [Ptr_Graph],y
               ldy Pt_Undo
               sta [Ptr_Undo],y
               inc Pt_Buffer
               inc Pt_Buffer
               inc Pt_Undo
               inc Pt_Undo
               dex
               dex
               bpl LOOP_SUG0
               bra S_SUG
;--
LOOP_SUG1      ldy Pt_Undo              |Undo -> Buffer
               lda [Ptr_Undo],y
               ldy Pt_Buffer
               sta [Ptr_Graph],y
               inc Pt_Buffer
               inc Pt_Buffer
               inc Pt_Undo
               inc Pt_Undo
               dex
               dex
               bpl LOOP_SUG1
;--
S_SUG          lda Indice_Undo
               clc
               adc #T_U_Graph
               sta Indice_Undo

               jsr U_Hdl_Graph          |libere
               jsr U_Hdl_Undo           |libere

               rts
;...............................................................
;
;    Swap_U_Text: Copie Buffer Text-> Record UNDO
;                     ACC=N% de Text   mode 0->   1 <-
;...............................................................
Swap_U_Text    ENTRY
;--
               pha
               jsr D_Hdl_Line           |Deref
               jsr D_Hdl_Undo           |Deref
               pla
               and #$00FF

               PushLong #0
               Pha                      |n% de ligne
               PushWord lg_LineRecord   |taille d'1 ligne
               _Multiply
               pla
               plx
               sta Pt_buffer

               lda Indice_Undo
               sta Pt_Undo

               ldx #T_U_Texte
               dex
               dex
;--
               lda Mode_Undo
               bne Loop_SUT1
;--
LOOP_SUT0      ldy Pt_Buffer            |buffer -> undo
               lda [Ptr_Line],y
               ldy Pt_Undo
               sta [Ptr_Undo],y
               inc Pt_Buffer
               inc Pt_Buffer
               inc Pt_Undo
               inc Pt_Undo
               dex
               dex
               bpl LOOP_SUT0
               bra S_SUT
;--
LOOP_SUT1      ldy Pt_Undo              |Undo -> Buffer
               lda [Ptr_Undo],y
               ldy Pt_Buffer
               sta [Ptr_Line],y
               inc Pt_Buffer
               inc Pt_Buffer
               inc Pt_Undo
               inc Pt_Undo
               dex
               dex
               bpl LOOP_SUT1
;--
S_SUT          lda Indice_Undo
               clc
               adc #T_U_Texte
               sta Indice_Undo

               jsr U_Hdl_Line           |libere
               jsr U_Hdl_Undo           |libere

               rts
;...............................................................
;
;    Swap_U_Number: Copie Buffer Number-> Record UNDO
;                     ACC=N% de Number  mode 0->   1 <-
;...............................................................
Swap_U_Number  ENTRY
;--
               lda Mode_Undo
               bne Loop_SUN1
;--
               ldy #6                   |buffer -> undo
LOOP_SUN0      lda NumberRecord,y
               sta UNumberRecord,y
               dey
               dey
               bpl LOOP_SUN0
               bra S_SUN
;--
LOOP_SUN1      ldy #6                   |Undo -> Buffer
LOOP_SUN2      lda UNumberRecord,y
               sta NumberRecord,y
               dey
               dey
               bpl LOOP_SUN2
;--
S_SUN          rts
;...............................................................
;
;        Copy_List_Undo
;
;...............................................................
Copy_List_Undo ENTRY

               lda nb_List_Select
               asl a
               tax
RCLU           lda List_Record,x
               sta Undo_Record,x
               dex
               dex
               bpl RCLU
               rts
;--
Copy_Undo_List ENTRY

               lda nb_Elt_Undo
               asl a
               tax
RCUL           lda Undo_Record,x
               sta List_Record,x
               dex
               dex
               bpl RCUL
               rts
;--------------------------------------
;        Copy Rect Select F
;--------------------------------------
Copy_Rect_Undo ENTRY

               ldy #6
RCLU1          lda Rect_SelectF,y
               sta RectF_Undo,y
               dey
               dey
               bpl RCLU1
               rts
;--------------------------------------
;        Des Data
;--------------------------------------
Mode_Undo      ds 2                     |0 buffer -> undo 1 <-
;--
Indice_Undo    ds 2                     |rang sur Ptr_Undo
Pt_Undo        ds 2
;--
UNumberRecord  ds 8                     |Undo du Number
;--
Taille_B_Undo  ds 2
;--
Table_Taille_Elt ANOP
               dc i'Taille_texte'
               dc i'Taille_shape'
               dc i'Taille_Icon'
               dc i'Taille_Number'
               dc i'Taille_Graph'
               dc i'Taille_Sticker'
;--
Table_Copy_Elt ANOP
               dc i'Copy_texte'
               dc i'Copy_shape'
               dc i'Copy_Icon'
               dc i'Copy_Number'
               dc i'Copy_Graph'
               dc i'Copy_Sticker'
;--
T_U_Texte      equ 382
T_U_Shape      equ 26
T_U_Icon       equ 6
T_U_Sticker    equ 6
T_U_Number     equ 8
T_U_Graph      equ 16
;--
Undo_Record    ANOP                     |100 elements
Nb_Elt_Undo    ds 2
List_Undo      ds 100*2
;--
RectF_Undo     ds 8                     |rect de selection

               END
