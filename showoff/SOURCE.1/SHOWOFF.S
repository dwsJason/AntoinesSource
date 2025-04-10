;---------------------------------------------------------------
;
; FILE : SHOWOFF.S                      corps principal
;        ---------
;---------------------------------------------------------------

               list off
               absaddr on
               instime on
               GEN   off
               SYMBOL off
               KEEP showoff

               mcopy showoff.mac

showoff        START

               bra DoIt

;...............................................................
;
; global equates : Variables generales
;
;...............................................................

True           gequ $8000
False          gequ $0000

disque         gequ 1                   |0 Version debug 1 Version finale
langue         gequ 0                   |0 francais 1 anglais

ScreenMode     gequ $00                 |resolution = 320 * 200
MaxX           gequ 320
;...............................................................
;
; Pointeurs en Page ZERO
;
;...............................................................
Ptr_Pzero      gequ $10                 |Ca peut Servir
Ptr_Pun        gequ Ptr_PZero+4         |Ca aussi

Ptr_Upro3      gequ Ptr_Pun+4           |ptr sur code protection
Ptr_Line       gequ Ptr_Upro3+4         |Ptr sur Buffer des Lignes Texte
Ptr_Shape      gequ Ptr_Line+4          |Ptr sur Buffer des Shapes Geometriques
Ptr_Icon       gequ Ptr_Shape+4         |Ptr sur Buffer ICON
Ptr_ScIcon     gequ Ptr_Icon+4          |Ptr sur Buffer Ecran
Ptr_DsIcon     gequ Ptr_ScIcon+4        |Ptr sur Buffer LOUPE
Ptr_PBuffer    gequ Ptr_DsIcon+4        |Ptr sur zone de decompactage
Ptr_Buffer1    gequ Ptr_PBuffer+4       |Ptr sur Buffer SCRAP
Ptr_FIcon      gequ Ptr_Buffer1+4       |Ptr sur Buffer File Icon
Ptr_BitMap     gequ Ptr_FIcon+4         |Ptr sur Buffer Fond BitMap
Ptr_BIcon      gequ Ptr_BitMap+4        |Ptr sur Buffer des Icons
Ptr_Fond       gequ Ptr_BIcon+4         |Ptr sur Buffer Fond Bitmap ou Couleur
Ptr_Border     gequ Ptr_Fond+4          |Ptr sur Buffer Bordure
Ptr_Graph      gequ Ptr_Border+4        |Ptr sur Buffer Graph
Ptr_Template   gequ Ptr_Graph+4         |Ptr sur Buffer Template Bitmap
Ptr_Undo       gequ Ptr_Template+4      |Ptr sur Buffer de Undo
Ptr_CCP        gequ Ptr_Undo+4          |Ptr sur Buffer de Cut/Copy/Paste
Ptr_Sticker    gequ Ptr_CCP+4           |Ptr sur Buffer des Stickers
Ptr_IoStk      gequ Ptr_Sticker+4       |Ptr sur Buffer Load Stickers

Ptr_PK0        gequ Ptr_IoStk+4
Ptr_PK1        gequ Ptr_Pk0+4
Ptr_PK2        gequ Ptr_Pk1+4

Ptr_BufStick   gequ Ptr_Pk2+4
Ptr_Orders     gequ Ptr_BufStick+4

               END
;---------------------------------------------------------------
;
;   -- PROGRAMME --
;
;--------------------------------------------------------------
DoIt           START
               using GlobalData
               using windowdata

               phk                      |position des BANKS
               plb

               tdc                      |la page zero
               sta MyZP

               jsr InitStuff            |init de demarrage
               bcs Adieu                | des problemes

               stz QuitFlag             |flag de sortie

               jsr PlayWithIt           |application demarree

Adieu          anop
;--
               jsr CopyBeenToWMod       |jcl destroy Work File
               jsr KillWorkAndCCP
;--
               jsr reset_bordure        |remettre le bord ecran d'origine

               jsr retour_pfx           |prefix d'origine
;--
               PushLong #PortFond       |on ferme le port de travail
               _ClosePort
;--
               _DeskShutdown            |Fermeture OUTILS

               _PMShutDown
               _MenuShutDown
               _IMShutDown
               _FMShutDown
               _SFShutdown
               _DialogShutdown
               _LEShutdown
               _CtlShutdown
               _WindShutDown
;--
               PushLong Rgn_DeskFull    |dispose des regions
               _DisposeRgn

               PushLong Rgn_DeskHalf
               _DisposeRgn
;--
               _QDAuxShutDown
               _EMShutDown
               _QDShutDown
               _MTShutdown
;--
               PushLong ZPHandle        |Dispose Des Handles
               _DisposeHandle

               PushLong Hdl_PPI_Option
               _DisposeHandle

               PushLong Hdl_Line
               _DisposeHandle

               PushLong Hdl_Shape
               _DisposeHandle

               PushLong Hdl_BIcon
               _DisposeHandle

               PushLong Hdl_Sticker
               _DisposeHandle

               PushLong Hdl_Undo
               _DisposeHandle

               PushLong Hdl_CCP
               _DisposeHandle

               jsr U_Hdl_BufStick
               PushLong Hdl_BufStick
               _DisposeHandle

               jsr U_Hdl_Fond
               PushLong Hdl_Fond
               _DisposeHandle

               jsr U_Hdl_Upro3
               PushLong Hdl_Upro3
               _DisposeHandle

               PushLong Hdl_Orders
               _DisposeHandle
;--
               jsl Eff_BitMap

               jsr Eff_Border

               jsr Eff_Template
;--
               PushWord MyID
               _MMShutdown

               _TLShutdown

               _Quit QuitParams         | Do a ProDOS Quit call

               END

****************************************************************
*
* PlayWithIt
*
****************************************************************

PlayWithIt     START
               using GlobalData
               using windowdata

Again          anop

               jsr DoShowActif          |init du show si demande

               jsr DoAutomatique        |mode show automatique

               jsr trt_Cursor           |Fleche ou Caret Ou ETC...

               jsr trt_flash            |Flashing >|<

               lda QuitFlag
               bne AllDone

analyse        PushWord #0
               PushWord #$FFFF
               PushLong #EventRecord
               _TaskMaster
               pla
               beq Again

;----------------------------------------
;----- gerons les evenements ------------
;----------------------------------------
qqchose        asl a
               tax

               jsr (TaskTable,x)

               bra Again

AllDone        ANOP

suredone       rts

TaskTable      anop
;----------------------------------------------------
;
; Event manager events
;
               dc i'ignore'             | 0 null
               dc i'ignore'             | 1 mouse down
               dc i'ignore'             | 2 mouse up
               dc i'dokey'              | 3 key down
               dc i'ignore'             | 4 undefined
               dc i'dokey'              | 5 auto-key down
               dc i'ignore'             | 6 update event
               dc i'ignore'             | 7 undefined
               dc i'DoActivate'         | 8 activate
               dc i'ignore'             | 9 switch
               dc i'ignore'             | 10 desk acc
               dc i'ignore'             | 11 device driver
               dc i'ignore'             | 12 ap
               dc i'ignore'             | 13 ap
               dc i'ignore'             | 14 ap
               dc i'ignore'             | 15 ap
               dc i'Ignore'             | 0 in desk

;----------------------------------------------------
;
; Task master events

               dc i'DoMenu'             | 1                       17
               dc i'ignore'             | 2 in system window      18
               dc i'doclick'            | 3 in content of window  19
               dc i'ignore'             | 4 in drag               20
               dc i'ignore'             | 5 in grow               21
               dc i'DoGoAway'           | 6 in goaway             22
               dc i'ignore'             | 7 in zoom               23
               dc i'ignore'             | 8 in info bar           24
               dc i'ignore'             | 9 in ver scroll         25
               dc i'ignore'             | 10 in hor scroll        26
               dc i'ignore'             | 11 in frame             27
               dc i'ignore'             | in drop                 28

               END

;---------------------------------------------------------------
;
; ignore :
;
;---------------------------------------------------------------
Ignore         START

doactivate     ENTRY

dogoaway       ENTRY

               rts

               END
;---------------------------------------------------------------
;
; DoMenu :
;
;---------------------------------------------------------------
DoMenu         START
               using GlobalDATA

               lda TaskDATA
               cmp #256
               bcc non                  |menu standard

MenuUp256      jsr Check_Text
               lda TaskData             |My Menus
               and #$00FF
               asl a
               tax

               jsr (MenuTable,x)

GiveUp         anop

               PushWord #False          | draw normal
               PushWord TaskDATA+2      | which menu
               _HiliteMenu

non            rts

;--------------------------------------
;        TABLE DES ACTIONS MENUS
;--------------------------------------
MenuTable      anop
;
; ABOUT
;
               dc i'doaboutAPP'
;
; FILE
;
               dc i'DoNewG'             'donew'
               dc i'DoOpenG'            'doopen'
               dc i'DoLoad_Picture'     'doloadpic'
               dc i'DoSaveG'            'dosave'
               dc i'DoSaveasG'          'dosaveas'
               dc i'DoSaveBitmap'       'dosavebitmap'
               dc i'DoPrint'            'doprint'
               dc i'doquit'
;
; EDIT
;
               dc i'DoUndo'             'doundo'
               dc i'DoClearFrame'       'doclearframe'
               dc i'DoCut'              'docut'
               dc i'DoCopy'             'docopy'
               dc i'DoPaste'            'dopaste'
               dc i'DoEditIcon'         'doiconedit'
               dc i'DoLabel'            'dolabeledit'
               dc i'DoTemplate'         'doTemplate'
               dc i'DoSeqEdit'          'dosequence'
               dc i'DoNextFrame'        'donextframe'
;
; GOODIES
;
               dc i'DoFlipVert'         'doflipvert'
               dc i'DoFlipHori'         'dofliphori'
               dc i'DoBar'              'dobargraph'
               dc i'DoSale'             'dosalegraph'
               dc i'DoPie'              'dopiechart'
               dc i'DoShadow'           'doshadow'
               dc i'DoAutoNumber'       'doautonumber'
;
; GRAPHICS
;
               dc i'DoCallBG'           'dobackground'
               dc i'DoSticker'          'dosticker'
               dc i'DoIconAppel'        'doicon'
               dc i'DoBorderAppel'      'doborder'
               dc i'DoNoBorder'         'donoborder'
               dc i'DoShowHideTp'       'doshowtemplate'
               dc i'DoChar'             'font'
;
; SERIALS
;
               dc i'DoCallSU'           'doSetUp'
               dc i'DoOrders'           'doOrders'
;
; PRINT +
;
               dc i'DoCallCP'           'DoCallCP' choose printer
               dc i'DoCallPS'           'DoCallPS' Page setup
               dc i'DoCallTS'           'DoCallTS' transition
;
; FORMAT
;
               dc i'DoFormat'           |format a disk 3.5

               END
;---------------------------------------------------------------
;
;              COPIE DES MODULES
;
;---------------------------------------------------------------
               copy showinit.s          |init des tools ETC ..

               copy showdata.s          |les donnees

               copy showdata1.s         |les Donnees suite

               copy showuti.s           |SBR utilitaires

               copy showecran.s         |SBR ecran (full page , border)

               copy showfonct.s         |SBR mineures

               copy showfenetre.s       |les fenetres (dialog etc)

               copy showtask.s          |aiguillage des events

               copy Showtext.s          |saisie des TEXTES

               copy ShowFont.s          |Ensemble Fonts

               copy ShowShape.s         |les Figures Geometrique

               copy ShowSelect.s        |Selection d'un OBJET

               copy ShowISelect.s       |Icon Selection Window

               copy ShowIo.s            |Acces Disk

               copy ShowGraph.s         |Routine Graphiques

               copy ShowBIcon.s         |Routines des ICONS

               copy ShowGChart.s        |la gestion des Camenberts

               copy ShowSequence.s      |Sequence

               copy ShowSeqEdit.s       |Sequence Editor

               copy SeqEditData.s       |sequence

               copy ShowTemplate.s      |Template

               copy Seqeditsub.s        |Seq Editor

               copy ShowUndo.s          |undo

               copy ShowCCP.s           |Cut/Copy/Paste

               copy ShowShow.s          |le Show

               copy ShowSticker.s       |les Stickers
