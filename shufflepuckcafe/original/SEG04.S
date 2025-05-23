*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

         mx    %00

         rel
         dsk   Seg04.L
         lst   off

*-----------

         use   Seg04.E
         use   Seg04.X

*-----------

         use   4/Event.Macs
         use   4/Locator.Macs
         use   4/Mem.Macs
         use   4/Qd.Macs
         use   4/Util.Macs

*-----------

L040000  ENT
         PHD              ; BOGUS FOR ROM3
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         SEP   #$20
         LDAL  $00047C
         STA   L020011
         LDAL  $00057C
         STA   L020012
         LDAL  $0004FC
         STA   L020013
         LDAL  $0005FC
         STA   L020014
         REP   #$20
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L040033  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         PEA   $0014
         PEA   $0014
         PEI   $FB
         PEI   $F9
         JSL   L1A17A7
         PLY
         PLY
         PHX
         PHA
         PEI   $FF
         PEI   $FD
         JSL   L1A17A7
         PLY
         PLY
         PHX
         PHA
         PEA   ^L030018
         PEA   L030018
         PEA   ^L03001D
         PEA   L03001D
         _TLMountVolume
         BCS   L040074
         LDA   #$0000
L040074  STAL  L0201E7
         JSL   L010254
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         PEI   $FF
         PEI   $FD
         PEA   ^L030024
         PEA   L030024
         JSL   L040033
         PLY
         PLY
         PLY
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0400A9  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L1A1166
         PLY
         PLY
         PLY
         PLY
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L0400CE  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L1A1649
         PLY
         PLY
         PLY
         PLY
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L0400F3  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         JSL   L1A13B3
         PLY
         PLY
         PLY
         PLY
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L040118  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EE
         TCS
L040123  PEA   $0020
         PEI   $FF
         PEI   $FD
         JSL   L1A1248
         PLY
         PLY
         PLY
         STA   $F0
         CMP   #$FFFF
         BNE   L040146
         PEA   ^L030038
         PEA   L030038
         JSL   L240DF3
         PLY
         PLY
         BRA   L040123
L040146  LDA   $F0
         TAY
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         PLD
         RTL

L040152  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EE
         TCS
         PEA   $0020
         PEI   $FF
         PEI   $FD
         JSL   L1A1248
         PLY
         PLY
         PLY
         STA   $F0
         LDA   $F0
         CMP   #$FFFF
         BNE   L04017B
         LDA   #$0000
         BRA   L04017D
         BRA   L04017D
L04017B  LDA   $F0
L04017D  TAY
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         PLD
         RTL

L040187  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         PEA   $00AA
         PEA   $0024
         PEI   $FF
         PEI   $FD
         JSL   L1A1390
         PLY
         PLY
         PLY
         PLY
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L0401AE  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F2
         TCS
         PEI   $FF
         JSL   L1A13FF
         PLY
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L0401CA  ENT
         PHD
         TSC
         SEC
         SBC   #$00F5
         TCD
         ADC   #$00E9
         TCS
         STZ   $ED
         STZ   $EB
         LDA   #$0000
         SEP   #$20
         STAL  L0301A1
         REP   #$20
L0401E4  PHA
         PEA   $0008
         PEA   ^L03343D
         PEA   L03343D
         _GetNextEvent
         BCS   L0401FA
         LDA   #$0000
L0401FA  STAL  L0201E7
         PLA
         TAY
         BNE   L040204
         BRA   L0401E4
L040204  LDAL  L033441
         TAX
         LDAL  L03343F
         AND   #$00FF
         PHA
         TXA
         AND   #$0000
         TAX
         PLA
         SEP   #$20
         STA   $EF
         REP   #$20
         LDA   $EF
         AND   #$00FF
         CMP   #$007F
         BNE   L040250
         LDA   $ED
         BEQ   L040250
         DEC   $ED
         LDA   $ED
         LDX   #$0000
         PHX
         PHA
         LDA   #L0301A1
         LDX   #^L0301A1
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F0
         STX   $F2
         LDA   #$0000
         SEP   #$20
         STA   [$F0]
         REP   #$20
         BRL   L0402BA
L040250  LDA   $EF
         AND   #$00FF
         SEC
         SBC   #$001F
         BEQ   L0402AB
         BVS   L040260
         EOR   #$8000
L040260  BPL   L0402AB
         LDA   $ED
         CMP   $FF
         BCS   L0402AB
         LDA   $ED
         INC   $ED
         LDX   #$0000
         PHX
         PHA
         LDA   #L0301A1
         LDX   #^L0301A1
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F0
         STX   $F2
         LDA   $EF
         SEP   #$20
         STA   [$F0]
         REP   #$20
         LDA   $ED
         LDX   #$0000
         PHX
         PHA
         LDA   #L0301A1
         LDX   #^L0301A1
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F0
         STX   $F2
         LDA   #$0000
         SEP   #$20
         STA   [$F0]
         REP   #$20
         BRA   L0402BA
L0402AB  LDA   $EF
         AND   #$00FF
         CMP   #$000D
         BNE   L0402BA
         LDA   #$0001
         STA   $EB
L0402BA  PEI   $FB
         PEI   $FD
         _MoveTo
         BCS   L0402CA
         LDA   #$0000
L0402CA  STAL  L0201E7
         PEA   ^L0301A1
         PEA   L0301A1
         _DrawCString
         BCS   L0402E0
         LDA   #$0000
L0402E0  STAL  L0201E7
         PEA   ^L030050
         PEA   L030050
         _DrawCString
         BCS   L0402F6
         LDA   #$0000
L0402F6  STAL  L0201E7
         LDA   $EB
         BNE   L040301
         BRL   L0401E4
L040301  LDA   #L0301A1
         LDX   #^L0301A1
         TAY
         TSC
         CLC
         ADC   #$000B
         TCS
         TYA
         PLD
         RTL

L040311  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
L04031C  PHA
         PEA   $0002
         PEA   ^L03343D
         PEA   L03343D
         _GetNextEvent
         BCS   L040332
         LDA   #$0000
L040332  STAL  L0201E7
         PLA
         TAY
         BNE   L04033C
         BRA   L04031C
L04033C  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L040344  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PHX
         PHA
         _GetPort
         BCS   L04035D
         LDA   #$0000
L04035D  STAL  L0201E7
         PLA
         PLX
         CLC
         ADC   #$0002
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         STX   L020017
         STA   L020015
         LDX   L020017
         LDA   L020015
         STA   $F6
         STX   $F8
         LDY   #$0002
         LDA   [$F6],Y
         TAX
         LDA   [$F6]
         PHX
         PHA
         PEA   ^L030054
         PEA   L030054
         JSL   L1A0DAA
         PLY
         PLY
         PLY
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L04039E  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDX   L020017
         LDA   L020015
         STA   $F2
         STX   $F4
         LDX   $FF
         LDA   $FD
         LDY   #$0002
         PHA
         TXA
         STA   [$F2],Y
         PLA
         STA   [$F2]
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00ED
         TCD
         ADC   #$00DE
         TCS
         LDX   L020017
         LDA   L020015
         STA   $E8
         STX   $EA
         LDX   $FF
         LDA   $FD
         LDY   #$0002
         PHA
         TXA
         STA   [$E8],Y
         PLA
         STA   [$E8]
         PEA   $0000
         TDC
         CLC
         ADC   #$00E0
         PHA
         PEI   $F3
         PEI   $F5
         PEI   $F7
         PEI   $F9
         _SetRect
         BCS   L040409
         LDA   #$0000
L040409  STAL  L0201E7
         PEI   $FB
         _SetSolidPenPat
         BCS   L04041B
         LDA   #$0000
L04041B  STAL  L0201E7
         PEA   $0000
         TDC
         CLC
         ADC   #$00E0
         PHA
         _FrameRect
         BCS   L040434
         LDA   #$0000
L040434  STAL  L0201E7
         TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L040440  ENT
         PHD
         TSC
         SEC
         SBC   #$00F5
         TCD
         ADC   #$00EA
         TCS
L04044B  PHX
         PHA
         PEI   $FD
         PEI   $FB
         LDA   L0201E3
         PHA
         LDA   #$8000
         ORA   $FF
         PHA
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L04046D
         LDA   #$0000
L04046D  STAL  L0201E7
         PLA
         PLX
         STX   $EE
         STA   $EC
         PHX
         PHA
         _MaxBlock
         BCS   L040485
         LDA   #$0000
L040485  STAL  L0201E7
         PHX
         PHA
         _FreeMem
         BCS   L040497
         LDA   #$0000
L040497  STAL  L0201E7
         PEI   $FD
         PEI   $FB
         LDY   #$0002
         LDA   [$EC],Y
         TAX
         LDA   [$EC]
         PHX
         PHA
         PEA   ^L03005F
         PEA   L03005F
         JSL   L1A0DAA
         TAY
         TSC
         CLC
         ADC   #$0014
         TCS
         TYA
         LDX   $EE
         LDA   $EC
         STX   $F0
         ORA   $F0
         BNE   L0404E8
         PEA   ^L030084
         PEA   L030084
         JSL   L1A0DAA
         PLY
         PLY
         PEA   ^L0300B6
         PEA   L0300B6
         PEA   ^L030098
         PEA   L030098
         JSL   L040033
         PLY
         PLY
         PLY
         PLY
         BRL   L04044B
L0404E8  LDA   $FF
         BNE   L040502
         LDY   #$0002
         LDA   [$EC],Y
         TAX
         LDA   [$EC]
         ORA   #$0000
         PHA
         TXA
         ORA   #$8000
         TAX
         PLA
         BRA   L04050A
         BRA   L04050A
L040502  LDY   #$0002
         LDA   [$EC],Y
         TAX
         LDA   [$EC]
L04050A  TAY
         TSC
         CLC
         ADC   #$000A
         TCS
         TYA
         PLD
         RTL

L040514  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         PEA   $0010
         PEI   $FF
         PEI   $FD
         JSL   L040440
         PLY
         PLY
         PLY
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L040537  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDX   $FF
         LDA   $FD
         AND   #$FFFF
         PHA
         TXA
         AND   #$7FFF
         TAX
         PLA
         STX   $FF
         STA   $FD
         PHX
         PHA
         PEI   $FF
         PEI   $FD
         _FindHandle
         BCS   L040566
         LDA   #$0000
L040566  STAL  L0201E7
         _DisposeHandle
         BCS   L040576
         LDA   #$0000
L040576  STAL  L0201E7
         PHX
         PHA
         _MaxBlock
         BCS   L040588
         LDA   #$0000
L040588  STAL  L0201E7
         PHX
         PHA
         _FreeMem
         BCS   L04059A
         LDA   #$0000
L04059A  STAL  L0201E7
         PEI   $FF
         PEI   $FD
         PEA   ^L0300BE
         PEA   L0300BE
         JSL   L1A0DAA
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0405BC  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         STX   $F2
         ORA   $F2
         BEQ   L0405F5
         LDY   #$0002
         LDA   [$FD],Y
         TAX
         LDA   [$FD]
         PHX
         PHA
         JSL   L040537
         PLY
         PLY
         LDX   #$0000
         LDA   #$0000
         LDY   #$0002
         PHA
         TXA
         STA   [$FD],Y
         PLA
         STA   [$FD]
L0405F5  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDX   $FF
         LDA   $FD
         AND   #$FFFF
         PHA
         TXA
         AND   #$7FFF
         TAX
         PLA
         STX   $FF
         STA   $FD
         PHX
         PHA
         PHX
         PHA
         PEI   $FF
         PEI   $FD
         _FindHandle
         BCS   L04062E
         LDA   #$0000
L04062E  STAL  L0201E7
         _GetHandleSize
         BCS   L04063E
         LDA   #$0000
L04063E  STAL  L0201E7
         PLA
         PLX
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L04064E  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00E8
         TCS
         LDA   #$0000
         SEP   #$20
         STA   $F1
         REP   #$20
         LDA   #$0006
         STA   $F2
L040667  LDA   #$000A
         PHA
         LDA   $FF
         CLC
         JSL   L1A0F19
         LDA   #$0030
         PLX
         STX   $F8
         CLC
         ADC   $F8
         PHA
         LDA   $F2
         DEC   $F2
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00EA
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F4
         STX   $F6
         PLA
         SEP   #$20
         STA   [$F4]
         REP   #$20
         LDA   #$000A
         PHA
         LDA   $FF
         CLC
         JSL   L1A0F19
         PLY
         STA   $FF
         LDA   $FF
         BNE   L040667
         LDA   $F2
         CLC
         ADC   #$0001
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00EA
         JSL   L1A0EFF
         _DrawCString
         BCS   L0406D3
         LDA   #$0000
L0406D3  STAL  L0201E7
         TSC
         CLC
         ADC   #$0010
         TCS
         PLD
         RTL

L0406DF  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00EA
         TCS
         STZ   $F2
         BRA   L040712
L0406EE  LDA   $F2
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00EC
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F4
         STX   $F6
         LDA   #$0030
         SEP   #$20
         STA   [$F4]
         REP   #$20
         INC   $F2
L040712  LDA   $F2
         CMP   #$0004
         BNE   L0406EE
         LDA   #$0000
         SEP   #$20
         STA   $F0
         REP   #$20
         LDA   $FF
         SEC
         SBC   #$0000
         BVS   L04072D
         EOR   #$8000
L04072D  BMI   L040742
         LDA   $FF
         EOR   #$FFFF
         INC
         STA   $FF
         LDA   #$002D
         SEP   #$20
         STA   $EC
         REP   #$20
         BRA   L04074B
L040742  LDA   #$002B
         SEP   #$20
         STA   $EC
         REP   #$20
L04074B  LDA   #$000A
         PHA
         LDA   $FF
         SEC
         JSL   L1A0F19
         PLA
         STA   $F2
         LDA   #$000A
         PHA
         LDA   $FF
         SEC
         JSL   L1A0F19
         PLY
         STA   $FF
         LDA   #$0030
         CLC
         ADC   $F2
         SEP   #$20
         STA   $EF
         REP   #$20
         LDA   #$000A
         PHA
         LDA   $FF
         SEC
         JSL   L1A0F19
         PLA
         STA   $F2
         LDA   #$000A
         PHA
         LDA   $FF
         SEC
         JSL   L1A0F19
         PLY
         STA   $FF
         LDA   #$0030
         CLC
         ADC   $F2
         SEP   #$20
         STA   $EE
         REP   #$20
         LDA   #$000A
         PHA
         LDA   $FF
         SEC
         JSL   L1A0F19
         PLA
         STA   $F2
         LDA   #$0030
         CLC
         ADC   $F2
         SEP   #$20
         STA   $ED
         REP   #$20
         PEA   $0000
         TDC
         CLC
         ADC   #$00EC
         PHA
         _DrawCString
         BCS   L0407CA
         LDA   #$0000
L0407CA  STAL  L0201E7
         TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L0407D6  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00E6
         TCS
         PEA   ^L0300E0
         PEA   L0300E0
         JSL   L1A0E02
         PLY
         PLY
         LDA   #$0000
         SEP   #$20
         STA   $EF
         REP   #$20
         LDA   #$0006
         STA   $F0
L0407FB  LDX   #$0000
         LDA   #$000A
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         CLC
         JSL   L1A0F9E
         LDX   #$0000
         LDA   #$0030
         JSL   L1A0EFF
         PLA
         PLX
         PHA
         LDA   $F0
         DEC   $F0
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00E8
         JSL   L1A0EFF
         PLA
         PLX
         STA   $F2
         STX   $F4
         PLA
         SEP   #$20
         STA   [$F2]
         REP   #$20
         LDX   #$0000
         LDA   #$000A
         PHX
         PHA
         LDX   $FF
         LDA   $FD
         CLC
         JSL   L1A0F9E
         PLY
         PLY
         STX   $FF
         STA   $FD
         LDX   $FF
         LDA   $FD
         STX   $F2
         ORA   $F2
         BNE   L0407FB
         LDA   $F0
         CLC
         ADC   #$0001
         LDX   #$0000
         PHX
         PHA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00E8
         JSL   L1A0EFF
         _DrawCString
         BCS   L04087F
         LDA   #$0000
L04087F  STAL  L0201E7
         JSL   L1A0E95
         TSC
         CLC
         ADC   #$0010
         TCS
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00F5
         TCD
         ADC   #$00EE
         TCS
         PEI   $FB
         PEI   $FD
         _MoveTo
         BCS   L0408AA
         LDA   #$0000
L0408AA  STAL  L0201E7
         PEI   $FF
         JSL   L04064E
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         PEI   $F9
         PEI   $FB
         _MoveTo
         BCS   L0408D8
         LDA   #$0000
L0408D8  STAL  L0201E7
         PEI   $FF
         PEI   $FD
         JSL   L0407D6
         PLY
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         PEI   $FD
         _SetForeColor
         BCS   L040907
         LDA   #$0000
L040907  STAL  L0201E7
         PEI   $FF
         _SetBackColor
         BCS   L040919
         LDA   #$0000
L040919  STAL  L0201E7
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         PEI   $F9
         PEI   $FB
         _MoveTo
         BCS   L040940
         LDA   #$0000
L040940  STAL  L0201E7
         PEI   $FF
         PEI   $FD
         _DrawCString
         BCS   L040954
         LDA   #$0000
L040954  STAL  L0201E7
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL
