*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

         mx    %00

         rel
         dsk   Seg24.L
         lst   off

*-----------

         use   Seg24.X

*-----------

         use   4/Dialog.Macs
         use   4/Qd.Macs
         use   4/Util.Macs
         use   4/Window.Macs

*-----------

L240000  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00D8
         TCS
         PHB
         LDA   #^L0201D3
         SEP   #$20
         PHA
         PLB
         REP   #$20
         LDA   $F9
         SEC
         SBC   #$0004
         LSR
         STA   $EC
         LDA   $EC
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L032DD7
         LDX   #^L032DD7
         JSL   L1A0EFF
         PLA
         PLX
         STA   $EE
         STX   $F0
         LDY   #$0006
         LDA   [$EE],Y
         TAX
         LDY   #$0004
         LDA   [$EE],Y
         STX   $E8
         STA   $E6
         LDY   #$001A
         LDA   [$E6],Y
         TAX
         LDY   #$0018
         LDA   [$E6],Y
         STX   $DC
         STA   $DA
         LDA   $FF
         BRL   L2402C5
L24005B  LDA   #$000A
         STA   $EA
         BRL   L2402D3
L240063  LDY   #$0006
         LDA   [$DA],Y
         PHA
         LDY   #$0008
         LDA   [$DA],Y
         PLX
         STX   $F2
         SEC
         SBC   $F2
         CLC
         ADC   #$000A
         STA   $EA
         BRL   L2402D3
L24007D  LDY   #$0006
         LDA   [$DA],Y
         PHA
         LDA   [$DA]
         PLX
         STX   $F2
         SEC
         SBC   $F2
         STA   $EA
         BRL   L2402D3
L240090  PHA
         PEI   $FD
         PEI   $FB
         PEI   $F9
         _GetDItemValue
         BCS   L2400A3
         LDA   #$0000
L2400A3  STAL  L0201E7
         PLA
         STA   L0201D3
         INC   L0201D3
         LDY   #$0006
         LDA   [$DA],Y
         PHA
         LDY   #$0008
         LDA   [$DA],Y
         PLX
         STX   $F2
         SEC
         SBC   $F2
         CMP   L0201D3
         BCS   L2400D8
         LDY   #$0006
         LDA   [$DA],Y
         PHA
         LDY   #$0008
         LDA   [$DA],Y
         PLX
         STX   $F2
         SEC
         SBC   $F2
         STA   L0201D3
L2400D8  LDY   #$0006
         LDA   [$DA],Y
         PHA
         LDA   L0201D3
         PLX
         STX   $F2
         CLC
         ADC   $F2
         STA   [$DA]
         LDA   [$DA]
         PHA
         PEI   $FD
         PEI   $FB
         LDA   $F9
         SEC
         SBC   #$0001
         PHA
         _SetDItemValue
         BCS   L240103
         LDA   #$0000
L240103  STAL  L0201E7
         LDA   L0201D3
         STA   $EA
         BRL   L2402D3
L24010F  PHA
         PEI   $FD
         PEI   $FB
         PEI   $F9
         _GetDItemValue
         BCS   L240122
         LDA   #$0000
L240122  STAL  L0201E7
         PLA
         STA   L0201D3
         DEC   L0201D3
         LDA   L0201D3
         AND   #$8000
         TAY
         BEQ   L240139
         STZ   L0201D3
L240139  LDY   #$0006
         LDA   [$DA],Y
         PHA
         LDA   L0201D3
         PLX
         STX   $F2
         CLC
         ADC   $F2
         STA   [$DA]
         LDA   [$DA]
         PHA
         PEI   $FD
         PEI   $FB
         LDA   $F9
         SEC
         SBC   #$0001
         PHA
         _SetDItemValue
         BCS   L240164
         LDA   #$0000
L240164  STAL  L0201E7
         LDA   L0201D3
         STA   $EA
         BRL   L2402D3
L240170  PHA
         PEI   $FD
         PEI   $FB
         PEI   $F9
         _GetDItemValue
         BCS   L240183
         LDA   #$0000
L240183  STAL  L0201E7
         PLA
         STA   L0201D3
         LDA   L0201D3
         CLC
         ADC   #$0005
         STA   L0201D3
         LDY   #$0006
         LDA   [$DA],Y
         PHA
         LDY   #$0008
         LDA   [$DA],Y
         PLX
         STX   $F2
         SEC
         SBC   $F2
         CMP   L0201D3
         BCS   L2401BF
         LDY   #$0006
         LDA   [$DA],Y
         PHA
         LDY   #$0008
         LDA   [$DA],Y
         PLX
         STX   $F2
         SEC
         SBC   $F2
         STA   L0201D3
L2401BF  LDY   #$0006
         LDA   [$DA],Y
         PHA
         LDA   L0201D3
         PLX
         STX   $F2
         CLC
         ADC   $F2
         STA   [$DA]
         LDA   [$DA]
         PHA
         PEI   $FD
         PEI   $FB
         LDA   $F9
         SEC
         SBC   #$0001
         PHA
         _SetDItemValue
         BCS   L2401EA
         LDA   #$0000
L2401EA  STAL  L0201E7
         LDA   L0201D3
         STA   $EA
         BRL   L2402D3
L2401F6  PHA
         PEI   $FD
         PEI   $FB
         PEI   $F9
         _GetDItemValue
         BCS   L240209
         LDA   #$0000
L240209  STAL  L0201E7
         PLA
         STA   L0201D3
         LDA   L0201D3
         SEC
         SBC   #$0005
         STA   L0201D3
         LDA   L0201D3
         AND   #$8000
         TAY
         BEQ   L240227
         STZ   L0201D3
L240227  LDY   #$0006
         LDA   [$DA],Y
         PHA
         LDA   L0201D3
         PLX
         STX   $F2
         CLC
         ADC   $F2
         STA   [$DA]
         LDA   [$DA]
         PHA
         PEI   $FD
         PEI   $FB
         LDA   $F9
         SEC
         SBC   #$0001
         PHA
         _SetDItemValue
         BCS   L240252
         LDA   #$0000
L240252  STAL  L0201E7
         LDA   L0201D3
         STA   $EA
         BRL   L2402D3
L24025E  PHA
         PEI   $FD
         PEI   $FB
         PEI   $F9
         _GetDItemValue
         BCS   L240271
         LDA   #$0000
L240271  STAL  L0201E7
         PLA
         STA   L0201D3
         LDY   #$0006
         LDA   [$DA],Y
         PHA
         LDA   L0201D3
         PLX
         STX   $F2
         CLC
         ADC   $F2
         STA   [$DA]
         LDA   [$DA]
         PHA
         PEI   $FD
         PEI   $FB
         LDA   $F9
         SEC
         SBC   #$0001
         PHA
         _SetDItemValue
         BCS   L2402A4
         LDA   #$0000
L2402A4  STAL  L0201E7
         LDA   L0201D3
         STA   $EA
         BRL   L2402D3
L2402B0  BRL   L2402D3
L2402B3  DA    L24005B
         DA    L240063
         DA    L24007D
         DA    L24010F
         DA    L240090
         DA    L2401F6
         DA    L240170
         DA    L24025E
         DA    L2402B0
L2402C5  DEC
         CMP   #$0008
         BCC   L2402CE
         LDA   #$0008
L2402CE  ASL
         TAX
         JMP   (L2402B3,X)

L2402D3  LDA   $EA
         PLB
         TAY
         TSC
         CLC
         ADC   #$001A
         TCS
         PLD
         LDA   $02,S
         STA   $0A,S
         LDA   $01,S
         STA   $09,S
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         STA   $04,S
         RTL

L2402F0  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L240303  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EE
         TCS
         PHA
         PEI   $FF
         PEI   $FD
         _StringWidth
         BCS   L24031F
         LDA   #$0000
L24031F  STAL  L0201E7
         PLA
         STA   $F0
         LDA   #$0002
         PHA
         LDA   $F0
         SEC
         JSL   L1A0F19
         PLY
         EOR   #$FFFF
         INC
         PHA
         PEA   $0000
         _Move
         BCS   L240346
         LDA   #$0000
L240346  STAL  L0201E7
         PEI   $FF
         PEI   $FD
         _DrawString
         BCS   L24035A
         LDA   #$0000
L24035A  STAL  L0201E7
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L240366  ENT
         PHD
         TSC
         SEC
         SBC   #$00F5
         TCD
         ADC   #$00DE
         TCS
         LDA   $FB
         SEC
         SBC   #$0002
         LSR
         STA   $EE
         LDA   $EE
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L032DD7
         LDX   #^L032DD7
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F0
         STX   $F2
         LDY   #$0002
         LDA   [$F0],Y
         TAX
         LDA   [$F0]
         STX   $EA
         STA   $E8
         LDA   $E8
         CLC
         ADC   #$0002
         LDX   $EA
         BCC   L2403AB
         INX
L2403AB  PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E0
         PHA
         PEA   $0008
         JSL   L1A1336
         PLA
         PLA
         PLA
         PLA
         PLX
         LDAL  L032DFB
         BNE   L2403CB
         BRL   L240475
L2403CB  PEA   $0000
         _SetSolidPenPat
         BCS   L2403DA
         LDA   #$0000
L2403DA  STAL  L0201E7
         PEA   $0000
         TDC
         CLC
         ADC   #$00E0
         PHA
         _PaintRect
         BCS   L2403F3
         LDA   #$0000
L2403F3  STAL  L0201E7
         PEA   $FFFF
         _SetSolidPenPat
         BCS   L240406
         LDA   #$0000
L240406  STAL  L0201E7
         PEA   $0001
         PEA   $0001
         _SetPenSize
         BCS   L24041C
         LDA   #$0000
L24041C  STAL  L0201E7
         LDA   $E2
         CLC
         ADC   #$0001
         PHA
         PEI   $E0
         _MoveTo
         BCS   L240435
         LDA   #$0000
L240435  STAL  L0201E7
         LDA   $E2
         CLC
         ADC   #$0001
         PHA
         LDA   $E4
         SEC
         SBC   #$0002
         PHA
         _LineTo
         BCS   L240453
         LDA   #$0000
L240453  STAL  L0201E7
         LDA   $E6
         SEC
         SBC   #$0002
         PHA
         LDA   $E4
         SEC
         SBC   #$0002
         PHA
         _LineTo
         BCS   L240471
         LDA   #$0000
L240471  STAL  L0201E7
L240475  LDA   $E2
         CLC
         ADC   #$0002
         PHA
         LDA   $E4
         SEC
         SBC   #$0004
         PHA
         _MoveTo
         BCS   L24048F
         LDA   #$0000
L24048F  STAL  L0201E7
         PEA   $000F
         _SetForeColor
         BCS   L2404A2
         LDA   #$0000
L2404A2  STAL  L0201E7
         PEA   $0000
         _SetBackColor
         BCS   L2404B5
         LDA   #$0000
L2404B5  STAL  L0201E7
         LDY   #$001A
         LDA   [$E8],Y
         TAX
         LDY   #$0018
         LDA   [$E8],Y
         PHX
         PHA
         _DrawString
         BCS   L2404D2
         LDA   #$0000
L2404D2  STAL  L0201E7
         PHA
         PEI   $FF
         PEI   $FD
         PEI   $FB
         _GetDItemValue
         BCS   L2404E9
         LDA   #$0000
L2404E9  STAL  L0201E7
         PLA
         STA   $EC
         PEI   $EC
         JSL   L0406DF
         PLY
         TSC
         CLC
         ADC   #$0016
         TCS
         PLD
         LDA   $02,S
         STA   $08,S
         LDA   $01,S
         STA   $07,S
         TSC
         CLC
         ADC   #$0006
         TCS
         RTL

L24050D  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDA   [$FD]
         PHA
         LDY   #$000C
         LDA   [$FD],Y
         TAX
         LDY   #$000A
         LDA   [$FD],Y
         STA   $F2
         STX   $F4
         PLA
         STA   [$F2]
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L240535  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDY   #$000C
         LDA   [$FD],Y
         TAX
         LDY   #$000A
         LDA   [$FD],Y
         STA   $F2
         STX   $F4
         LDA   [$F2]
         STA   [$FD]
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L24055B  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00D8
         TCS
         PEA   ^L032DFD
         PEA   L032DFD
         JSL   L1A0E02
         PLY
         PLY
         PEA   $0000
         TDC
         CLC
         ADC   #$00E2
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0140
         PEA   $00C8
         _SetRect
         BCS   L240593
         LDA   #$0000
L240593  STAL  L0201E7
         LDA   #$0002
         PHA
         LDA   $FD
         SEC
         JSL   L1A0F19
         PLY
         PHA
         LDA   #$0002
         PHA
         LDA   $E6
         SEC
         SBC   $E2
         SEC
         JSL   L1A0F19
         PLY
         PHA
         LDA   $E2
         PLX
         STX   $F6
         CLC
         ADC   $F6
         PLX
         STX   $F6
         SEC
         SBC   $F6
         STA   $EA
         LDA   $EA
         CLC
         ADC   $FD
         STA   $EE
         LDA   #$0002
         PHA
         LDA   $E8
         SEC
         SBC   $E4
         SEC
         JSL   L1A0F19
         PLY
         PHA
         LDA   $E4
         PLX
         STX   $F6
         CLC
         ADC   $F6
         SEC
         SBC   #$0090
         STA   $EC
         LDA   $EC
         CLC
         ADC   #$0120
         STA   $F0
         PEA   $0000
         TDC
         CLC
         ADC   #$00EA
         PHA
         PEA   $FFFA
         PEA   $FFFC
         _InsetRect
         BCS   L24060C
         LDA   #$0000
L24060C  STAL  L0201E7
         LDA   $FD
         STA   $DE
         LDA   $DE
         SEC
         SBC   #$000D
         STA   $DA
         LDA   #$0115
         STA   $E0
         LDA   $E0
         SEC
         SBC   #$003C
         STA   $DC
         LDX   #$0000
         TDC
         CLC
         ADC   #$00DA
         PHX
         PHA
         PEA   ^L032CAB
         PEA   L032CAB
         PEA   $0008
         JSL   L1A1336
         PLA
         PLA
         PLA
         PLA
         PLX
         LDA   $FF
         BEQ   L24066A
         PEA   $0000
         TDC
         CLC
         ADC   #$00DA
         PHA
         PEA   $FFB8
         PEA   $0000
         _OffsetRect
         BCS   L240664
         LDA   #$0000
L240664  STAL  L0201E7
         BRA   L240689
L24066A  PEA   $0000
         TDC
         CLC
         ADC   #$00DA
         PHA
         PEA   $4000
         PEA   $0000
         _OffsetRect
         BCS   L240685
         LDA   #$0000
L240685  STAL  L0201E7
L240689  LDX   #$0000
         TDC
         CLC
         ADC   #$00DA
         PHX
         PHA
         PEA   ^L032CC7
         PEA   L032CC7
         PEA   $0008
         JSL   L1A1336
         PLA
         PLA
         PLA
         PLA
         PLX
         LDX   #$0000
         TDC
         CLC
         ADC   #$00EA
         PHX
         PHA
         PEA   ^L032DC1
         PEA   L032DC1
         PEA   $0008
         JSL   L1A1336
         PLA
         PLA
         PLA
         PLA
         PLX
         LDA   #$FFFF
         STAL  L032DFB
         PHX
         PHA
         PEA   ^L032DC1
         PEA   L032DC1
         _GetNewModalDialog
         BCS   L2406DC
         LDA   #$0000
L2406DC  STAL  L0201E7
         PLA
         PLX
         STX   L0201D7
         STA   L0201D5
         LDX   L0201D7
         LDA   L0201D5
         PHX
         PHA
         _SetPort
         BCS   L2406FC
         LDA   #$0000
L2406FC  STAL  L0201E7
         PEA   $0002
         _SetSolidBackPat
         BCS   L24070F
         LDA   #$0000
L24070F  STAL  L0201E7
         LDX   L0201D7
         LDA   L0201D5
         PHX
         PHA
         _ShowWindow
         BCS   L240727
         LDA   #$0000
L240727  STAL  L0201E7
         LDX   L0201D7
         LDA   L0201D5
         PHX
         PHA
         _DrawDialog
         BCS   L24073F
         LDA   #$0000
L24073F  STAL  L0201E7
         LDX   L0201D7
         LDA   L0201D5
         STA   $F2
         STX   $F4
         LDA   $F2
         LDX   $F4
         CLC
         ADC   #$0014
         BCC   L240758
         INX
L240758  PHX
         PHA
         _ValidRect
         BCS   L240766
         LDA   #$0000
L240766  STAL  L0201E7
         LDA   #$0000
         STAL  L032DFB
         JSL   L1A0E95
         TSC
         CLC
         ADC   #$001E
         TCS
         PLD
         RTL

L24077D  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00EA
         TCS
         PHA
         LDX   L0201DB
         LDA   L0201D9
         PHX
         PHA
         _StringWidth
         BCS   L24079D
         LDA   #$0000
L24079D  STAL  L0201E7
         PLA
         STA   $EC
         PEA   $0000
         TDC
         CLC
         ADC   #$00EE
         PHA
         LDA   #$0002
         PHA
         LDA   $EC
         SEC
         JSL   L1A0F19
         PLY
         PHA
         LDA   #$0090
         PLX
         STX   $FA
         SEC
         SBC   $FA
         SEC
         SBC   #$0004
         PHA
         PEA   $0003
         LDA   #$0002
         PHA
         LDA   $EC
         SEC
         JSL   L1A0F19
         PLY
         PHA
         LDA   #$0090
         PLX
         STX   $FA
         CLC
         ADC   $FA
         CLC
         ADC   #$0004
         PHA
         PEA   $0010
         _SetRect
         BCS   L2407F5
         LDA   #$0000
L2407F5  STAL  L0201E7
         PEA   $0000
         _SetSolidPenPat
         BCS   L240808
         LDA   #$0000
L240808  STAL  L0201E7
         PEA   $0000
         TDC
         CLC
         ADC   #$00EE
         PHA
         _PaintRect
         BCS   L240821
         LDA   #$0000
L240821  STAL  L0201E7
         PEA   $FFFF
         _SetSolidPenPat
         BCS   L240834
         LDA   #$0000
L240834  STAL  L0201E7
         PEA   $0001
         PEA   $0001
         _SetPenSize
         BCS   L24084A
         LDA   #$0000
L24084A  STAL  L0201E7
         PEI   $F0
         PEI   $EE
         _MoveTo
         BCS   L24085E
         LDA   #$0000
L24085E  STAL  L0201E7
         PEI   $F0
         LDA   $F2
         SEC
         SBC   #$0002
         PHA
         _LineTo
         BCS   L240877
         LDA   #$0000
L240877  STAL  L0201E7
         LDA   $F4
         SEC
         SBC   #$0002
         PHA
         LDA   $F2
         SEC
         SBC   #$0002
         PHA
         _LineTo
         BCS   L240895
         LDA   #$0000
L240895  STAL  L0201E7
         PEA   $008E
         PEA   $000D
         _MoveTo
         BCS   L2408AB
         LDA   #$0000
L2408AB  STAL  L0201E7
         PEA   $000F
         _SetForeColor
         BCS   L2408BE
         LDA   #$0000
L2408BE  STAL  L0201E7
         PEA   $0000
         _SetBackColor
         BCS   L2408D1
         LDA   #$0000
L2408D1  STAL  L0201E7
         LDX   L0201DB
         LDA   L0201D9
         PHX
         PHA
         JSL   L240303
         PLY
         PLY
         TSC
         CLC
         ADC   #$0010
         TCS
         PLD
         RTL

L2408EB  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDX   $FF
         LDA   $FD
         STX   L0201DB
         STA   L0201D9
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L240908  PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00E8
         TCS
         LDA   $F7
         PHA
         LDA   #$001C
         CLC
         JSL   L1A109A
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L032CE1
         LDX   #^L032CE1
         JSL   L1A0EFF
         LDA   $F7
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L032DD7
         LDX   #^L032DD7
         JSL   L1A0EFF
         PLA
         PLX
         STA   $EC
         STX   $EE
         PLA
         PLX
         LDY   #$0002
         PHA
         TXA
         STA   [$EC],Y
         PLA
         STA   [$EC]
         LDA   $F7
         PHA
         LDA   #$001C
         CLC
         JSL   L1A109A
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L032CE1
         LDX   #^L032CE1
         JSL   L1A0EFF
         PLA
         PLX
         STA   $EC
         STX   $EE
         LDX   $FB
         LDA   $F9
         LDY   #$001A
         PHA
         TXA
         STA   [$EC],Y
         PLA
         LDY   #$0018
         STA   [$EC],Y
         PHA
         PEI   $FB
         PEI   $F9
         _StringWidth
         BCS   L240997
         LDA   #$0000
L240997  STAL  L0201E7
         PLA
         STA   $EA
         LDA   $F7
         PHA
         LDA   #$001C
         CLC
         JSL   L1A109A
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L032CE1
         LDX   #^L032CE1
         JSL   L1A0EFF
         PLA
         PLX
         STA   $EC
         STX   $EE
         LDA   $FD
         LDY   #$0010
         STA   [$EC],Y
         LDA   $F7
         PHA
         LDA   #$001C
         CLC
         JSL   L1A109A
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L032CE1
         LDX   #^L032CE1
         JSL   L1A0EFF
         PLA
         PLX
         STA   $EC
         STX   $EE
         LDA   $EC
         LDX   $EE
         CLC
         ADC   #$0002
         BCC   L2409F2
         INX
L2409F2  PHX
         PHA
         LDA   $EA
         LSR
         PHA
         LDA   #$0090
         PLX
         STX   $F0
         SEC
         SBC   $F0
         SEC
         SBC   #$0011
         PHA
         LDA   $FF
         SEC
         SBC   #$0019
         PHA
         LDA   $EA
         LSR
         PHA
         LDA   #$0090
         PLX
         STX   $F0
         CLC
         ADC   $F0
         CLC
         ADC   #$0011
         PHA
         LDA   $FF
         SEC
         SBC   #$000D
         PHA
         _SetRect
         BCS   L240A32
         LDA   #$0000
L240A32  STAL  L0201E7
         LDA   $F7
         CLC
         ADC   #$0001
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L032DD7
         LDX   #^L032DD7
         JSL   L1A0EFF
         PLA
         PLX
         STA   $EC
         STX   $EE
         LDX   #$0000
         LDA   #$0000
         LDY   #$0002
         PHA
         TXA
         STA   [$EC],Y
         PLA
         STA   [$EC]
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L240A6C  PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00EA
         TCS
         LDA   $F7
         PHA
         LDA   #$001C
         CLC
         JSL   L1A109A
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L032D51
         LDX   #^L032D51
         JSL   L1A0EFF
         LDA   $F7
         ASL
         ASL
         ASL
         LDX   #$0000
         PHX
         PHA
         LDA   #L032DD7
         LDX   #^L032DD7
         JSL   L1A0EFF
         PLA
         PLX
         STA   $EC
         STX   $EE
         PLA
         PLX
         LDY   #$0006
         PHA
         TXA
         STA   [$EC],Y
         PLA
         LDY   #$0004
         STA   [$EC],Y
         LDA   $F7
         PHA
         LDA   #$001C
         CLC
         JSL   L1A109A
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L032D51
         LDX   #^L032D51
         JSL   L1A0EFF
         PLA
         PLX
         STA   $EC
         STX   $EE
         LDX   $FF
         LDA   $FD
         LDY   #$001A
         PHA
         TXA
         STA   [$EC],Y
         PLA
         LDY   #$0018
         STA   [$EC],Y
         LDA   $F7
         PHA
         LDA   #$001C
         CLC
         JSL   L1A109A
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L032D51
         LDX   #^L032D51
         JSL   L1A0EFF
         PLA
         PLX
         STA   $EC
         STX   $EE
         LDA   $EC
         LDX   $EE
         CLC
         ADC   #$0002
         BCC   L240B19
         INX
L240B19  PHX
         PHA
         PEI   $F9
         LDA   $FB
         SEC
         SBC   #$000B
         PHA
         LDA   #$0120
         SEC
         SBC   $F9
         CLC
         ADC   #$0005
         PHA
         LDA   $FB
         CLC
         ADC   #$0002
         PHA
         _SetRect
         BCS   L240B42
         LDA   #$0000
L240B42  STAL  L0201E7
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L240B4E  PHD
         TSC
         SEC
         SBC   #$00E9
         TCD
         ADC   #$00DE
         TCS
         PEA   ^L032E0E
         PEA   L032E0E
         JSL   L1A0E02
         PLY
         PLY
         LDA   $EF
         PHA
         LDA   #$0012
         CLC
         JSL   L1A109A
         PLA
         LDX   #$0000
         PHX
         PHA
         LDA   #L032E2B
         LDX   #^L032E2B
         JSL   L1A0EFF
         PLA
         PLX
         STX   $E2
         STA   $E0
         LDA   $F1
         LDY   #$0002
         STA   [$E0],Y
         LDA   $F3
         LDY   #$0004
         STA   [$E0],Y
         LDA   $F9
         LDY   #$0006
         STA   [$E0],Y
         LDA   $FB
         LDY   #$0008
         STA   [$E0],Y
         LDX   $F7
         LDA   $F5
         LDY   #$000C
         PHA
         TXA
         STA   [$E0],Y
         PLA
         LDY   #$000A
         STA   [$E0],Y
         PEI   $E2
         PEI   $E0
         JSL   L240535
         PLY
         PLY
         LDX   $FF
         LDA   $FD
         LDY   #$0010
         PHA
         TXA
         STA   [$E0],Y
         PLA
         LDY   #$000E
         STA   [$E0],Y
         PEI   $E2
         PEI   $E0
         PEI   $F3
         PEI   $F1
         PEI   $EF
         JSL   L240A6C
         PLY
         PLY
         PLY
         PLY
         PLY
         PEI   $F3
         LDA   [$E0]
         PHA
         PEI   $FF
         PEI   $FD
         PEI   $EF
         JSL   L240908
         PLY
         PLY
         PLY
         PLY
         PLY
         JSL   L1A0E95
         TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L240C01  ENT
         PHD
         TSC
         SEC
         SBC   #$00EF
         TCD
         ADC   #$00E2
         TCS
         PHX
         PHA
         _GetPort
         BCS   L240C1A
         LDA   #$0000
L240C1A  STAL  L0201E7
         PLA
         PLX
         STX   $E6
         STA   $E4
         PEI   $F7
         PEI   $F5
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEA   $002A
         PEA   $000C
         PEA   $0000
         JSL   L240B4E
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         PEA   $FFFF
         PEA   $0050
         JSL   L24055B
         PLY
         PLY
L240C51  PHA
         PEA   $0000
         PEA   $0000
         _ModalDialog
         BCS   L240C64
         LDA   #$0000
L240C64  STAL  L0201E7
         PLA
         STA   $E8
         CMP   #$0002
         BEQ   L240C74
         BCC   L240C74
         BRA   L240C51
L240C74  LDX   #$0000
         LDA   #$C036
         STA   $EA
         STX   $EC
         LDA   [$EA]
         AND   #$00FF
         ORA   #$0080
         SEP   #$20
         STA   [$EA]
         REP   #$20
         LDX   L0201D7
         LDA   L0201D5
         PHX
         PHA
         _CloseDialog
         BCS   L240CA0
         LDA   #$0000
L240CA0  STAL  L0201E7
         JSL   L1D04F0
         PEI   $E6
         PEI   $E4
         _SetPort
         BCS   L240CB8
         LDA   #$0000
L240CB8  STAL  L0201E7
         LDA   $E8
         CMP   #$0001
         BNE   L240CCF
         PEA   ^L032E2B
         PEA   L032E2B
         JSL   L24050D
         PLY
         PLY
L240CCF  TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L240CD7  ENT
         PHD
         TSC
         SEC
         SBC   #$00DF
         TCD
         ADC   #$00D0
         TCS
         PHX
         PHA
         _GetPort
         BCS   L240CF0
         LDA   #$0000
L240CF0  STAL  L0201E7
         PLA
         PLX
         STX   $D4
         STA   $D2
         LDA   #$0030
         STA   $D8
         PEI   $EB
         PEI   $E9
         PEI   $F3
         PEI   $F1
         PEI   $EF
         PEI   $ED
         PEI   $D8
         PEA   $000C
         PEA   $0000
         JSL   L240B4E
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         LDA   $D8
         CLC
         ADC   #$001C
         STA   $D8
         PEI   $F7
         PEI   $F5
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEI   $D8
         PEA   $000C
         PEA   $0001
         JSL   L240B4E
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         PEA   $FFFF
         PEA   $006E
         JSL   L24055B
         PLY
         PLY
         PEI   $E7
         PEI   $E5
         JSL   L2408EB
         PLY
         PLY
         JSL   L24077D
L240D61  PHA
         PEA   $0000
         PEA   $0000
         _ModalDialog
         BCS   L240D74
         LDA   #$0000
L240D74  STAL  L0201E7
         PLA
         STA   $D6
         CMP   #$0002
         BEQ   L240D84
         BCC   L240D84
         BRA   L240D61
L240D84  LDX   #$0000
         LDA   #$C036
         STA   $DA
         STX   $DC
         LDA   [$DA]
         AND   #$00FF
         ORA   #$0080
         SEP   #$20
         STA   [$DA]
         REP   #$20
         LDX   L0201D7
         LDA   L0201D5
         PHX
         PHA
         _CloseDialog
         BCS   L240DB0
         LDA   #$0000
L240DB0  STAL  L0201E7
         JSL   L1D04F0
         PEI   $D4
         PEI   $D2
         _SetPort
         BCS   L240DC8
         LDA   #$0000
L240DC8  STAL  L0201E7
         LDA   $D6
         CMP   #$0001
         BNE   L240DEB
         PEA   ^L032E2B
         PEA   L032E2B
         JSL   L24050D
         PLY
         PLY
         PEA   ^L032E3D
         PEA   L032E3D
         JSL   L24050D
         PLY
         PLY
L240DEB  TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L240DF3  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EA
         TCS
         PHX
         PHA
         _GetPort
         BCS   L240E0C
         LDA   #$0000
L240E0C  STAL  L0201E7
         PLA
         PLX
         STX   $EE
         STA   $EC
         LDX   #$0000
         LDA   #$0000
         PHA
         TXA
         STAL  L032DD9
         PLA
         STAL  L032DD7
         PEA   $0000
         PEA   $002D
         JSL   L24055B
         PLY
         PLY
         PEI   $FF
         PEI   $FD
         JSL   L2408EB
         PLY
         PLY
         JSL   L24077D
         _ShowCursor
         BCS   L240E4D
         LDA   #$0000
L240E4D  STAL  L0201E7
L240E51  PHA
         PEA   $0000
         PEA   $0000
         _ModalDialog
         BCS   L240E64
         LDA   #$0000
L240E64  STAL  L0201E7
         PLA
         STA   $F0
         CMP   #$0002
         BEQ   L240E74
         BCC   L240E74
         BRA   L240E51
L240E74  LDX   #$0000
         LDA   #$C036
         STA   $F2
         STX   $F4
         LDA   [$F2]
         AND   #$00FF
         ORA   #$0080
         SEP   #$20
         STA   [$F2]
         REP   #$20
         _HideCursor
         BCS   L240E98
         LDA   #$0000
L240E98  STAL  L0201E7
         LDX   L0201D7
         LDA   L0201D5
         PHX
         PHA
         _CloseDialog
         BCS   L240EB0
         LDA   #$0000
L240EB0  STAL  L0201E7
         JSL   L1D04F0
         PEI   $EE
         PEI   $EC
         _SetPort
         BCS   L240EC8
         LDA   #$0000
L240EC8  STAL  L0201E7
         TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L240ED4  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EA
         TCS
         PHX
         PHA
         _GetPort
         BCS   L240EED
         LDA   #$0000
L240EED  STAL  L0201E7
         PLA
         PLX
         STX   $EE
         STA   $EC
         LDX   #$0000
         LDA   #$0000
         PHA
         TXA
         STAL  L032DD9
         PLA
         STAL  L032DD7
         PEA   $0000
         PEA   $002D
         JSL   L24055B
         PLY
         PLY
         PEA   ^L032E1A
         PEA   L032E1A
         JSL   L2408EB
         PLY
         PLY
         JSL   L24077D
         _ShowCursor
         BCS   L240F30
         LDA   #$0000
L240F30  STAL  L0201E7
         PEA   $000C
         PEA   $0028
         PEA   $0028
         JSL   L0401CA
         PLY
         PLY
         PLY
         LDY   #$0002
         PHA
         TXA
         STA   [$FD],Y
         PLA
         STA   [$FD]
         _HideCursor
         BCS   L240F5A
         LDA   #$0000
L240F5A  STAL  L0201E7
         LDX   L0201D7
         LDA   L0201D5
         PHX
         PHA
         _CloseDialog
         BCS   L240F72
         LDA   #$0000
L240F72  STAL  L0201E7
         JSL   L1D04F0
         PEI   $EE
         PEI   $EC
         _SetPort
         BCS   L240F8A
         LDA   #$0000
L240F8A  STAL  L0201E7
         TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L240F96  ENT
         PHD
         TSC
         SEC
         SBC   #$00C7
         TCD
         ADC   #$00B8
         TCS
         PHX
         PHA
         _GetPort
         BCS   L240FAF
         LDA   #$0000
L240FAF  STAL  L0201E7
         PLA
         PLX
         STX   $BC
         STA   $BA
         LDA   #$002A
         STA   $C0
         PEI   $D3
         PEI   $D1
         PEI   $DB
         PEI   $D9
         PEI   $D7
         PEI   $D5
         PEI   $C0
         PEA   $000C
         PEA   $0000
         JSL   L240B4E
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         LDA   $C0
         CLC
         ADC   #$001C
         STA   $C0
         PEI   $DF
         PEI   $DD
         PEI   $E7
         PEI   $E5
         PEI   $E3
         PEI   $E1
         PEI   $C0
         PEA   $000C
         PEA   $0001
         JSL   L240B4E
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         LDA   $C0
         CLC
         ADC   #$0008
         STA   $C0
         LDA   $C0
         CLC
         ADC   #$001C
         STA   $C0
         PEI   $EB
         PEI   $E9
         PEI   $F3
         PEI   $F1
         PEI   $EF
         PEI   $ED
         PEI   $C0
         PEA   $000C
         PEA   $0002
         JSL   L240B4E
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         LDA   $C0
         CLC
         ADC   #$001C
         STA   $C0
         PEI   $F7
         PEI   $F5
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEI   $C0
         PEA   $000C
         PEA   $0003
         JSL   L240B4E
         TAY
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         PEA   $FFFF
         PEA   $0098
         JSL   L24055B
         PLY
         PLY
         PEI   $CF
         PEI   $CD
         JSL   L2408EB
         PLY
         PLY
         JSL   L24077D
L241078  PHA
         PEA   $0000
         PEA   $0000
         _ModalDialog
         BCS   L24108B
         LDA   #$0000
L24108B  STAL  L0201E7
         PLA
         STA   $BE
         CMP   #$0002
         BEQ   L24109B
         BCC   L24109B
         BRA   L241078
L24109B  LDX   #$0000
         LDA   #$C036
         STA   $C2
         STX   $C4
         LDA   [$C2]
         AND   #$00FF
         ORA   #$0080
         SEP   #$20
         STA   [$C2]
         REP   #$20
         LDX   L0201D7
         LDA   L0201D5
         PHX
         PHA
         _CloseDialog
         BCS   L2410C7
         LDA   #$0000
L2410C7  STAL  L0201E7
         JSL   L1D04F0
         PEI   $BC
         PEI   $BA
         _SetPort
         BCS   L2410DF
         LDA   #$0000
L2410DF  STAL  L0201E7
         LDA   $BE
         CMP   #$0001
         BEQ   L2410ED
         BRL   L24111D
L2410ED  PEA   ^L032E2B
         PEA   L032E2B
         JSL   L24050D
         PLY
         PLY
         PEA   ^L032E3D
         PEA   L032E3D
         JSL   L24050D
         PLY
         PLY
         PEA   ^L032E4F
         PEA   L032E4F
         JSL   L24050D
         PLY
         PLY
         PEA   ^L032E61
         PEA   L032E61
         JSL   L24050D
         PLY
         PLY
L24111D  TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL
