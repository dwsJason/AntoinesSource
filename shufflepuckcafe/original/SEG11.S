*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

         mx    %00

         rel
         dsk   Seg11.L
         lst   off

*-----------

         use   Seg11.E
         use   Seg11.X

*-----------

         use   4/Util.Macs

*-----------

L110000  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EE
         TCS
         LDA   $FF
         CLC
         ADC   #$0032
         STA   $FF
         LDA   $FD
         SEC
         SBC   #$000C
         BEQ   L11002A
         BVS   L110020
         EOR   #$8000
L110020  BPL   L11002A
         LDA   $FD
         SEC
         SBC   #$000C
         BRA   L11002D
L11002A  LDA   #$0000
L11002D  STA   $F0
         LDA   $FF
         CLC
         ADC   #$0005
         PHA
         LDA   $FD
         CLC
         ADC   #$005A
         PHA
         LDA   $FF
         SEC
         SBC   #$0035
         PHA
         PEI   $F0
         LDX   L02014D
         LDA   L02014B
         CLC
         ADC   #$0020
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         JSL   L060318
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         LDX   L020118
         LDA   L020116
         PHX
         PHA
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         PEI   $FF
         PEI   $FD
         PEA   $0000
         JSL   L070000
         TAY
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
         JSL   L180000
         LDA   $FF
         CLC
         ADC   #$0005
         PHA
         LDA   $FD
         CLC
         ADC   #$005A
         PHA
         LDA   $FF
         SEC
         SBC   #$0035
         PHA
         PEI   $F0
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         JSL   L060318
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         LDA   $FF
         CLC
         ADC   #$0005
         PHA
         LDA   $FD
         CLC
         ADC   #$005A
         PHA
         LDA   $FF
         SEC
         SBC   #$0035
         PHA
         PEI   $F0
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         LDX   L02014D
         LDA   L02014B
         CLC
         ADC   #$0020
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         JSL   L060318
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   ^L032054
         PEA   L032054
         JSL   L1A0E02
         PLY
         PLY
         JSL   L180000
         PEA   $0096
         PEA   $0060
         PEA   $000F
         PEA   $0000
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         JSL   L060318
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         JSL   L1A0E95
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L11015C  ENT
         PHD
         TSC
         SEC
         SBC   #$00F5
         TCD
         ADC   #$00EE
         TCS
         LDA   $FF
         BNE   L11016E
         BRL   L110201
L11016E  LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         JSL   L04039E
         PLY
         PLY
         PEA   $000F
         LDA   $FD
         CLC
         ADC   #$0006
         PHA
         LDA   $FB
         CLC
         ADC   #$0031
         PHA
         LDA   L020093
         CLC
         ADC   #$0006
         PHA
         LDA   L020091
         CLC
         ADC   #$0031
         PHA
         JSL   L0705E1
         PLY
         PLY
         PLY
         PLY
         PLY
         PEA   $000F
         LDA   $FD
         CLC
         ADC   #$0006
         PHA
         LDA   $FB
         CLC
         ADC   #$0032
         PHA
         LDA   L020093
         CLC
         ADC   #$0006
         PHA
         LDA   L020091
         CLC
         ADC   #$0032
         PHA
         JSL   L0705E1
         PLY
         PLY
         PLY
         PLY
         PLY
         LDA   $FB
         CMP   L020091
         BEQ   L110201
         PEA   $000F
         LDA   $FD
         CLC
         ADC   #$0007
         PHA
         LDA   $FB
         CLC
         ADC   #$0032
         PHA
         LDA   L020093
         CLC
         ADC   #$0007
         PHA
         LDA   L020091
         CLC
         ADC   #$0032
         PHA
         JSL   L0705E1
         PLY
         PLY
         PLY
         PLY
         PLY
L110201  LDX   L020151
         LDA   L02014F
         PHX
         PHA
         JSL   L04039E
         PLY
         PLY
         PEA   $000F
         LDA   $FD
         CLC
         ADC   #$0006
         PHA
         LDA   $FB
         CLC
         ADC   #$0031
         PHA
         LDA   L020093
         CLC
         ADC   #$0006
         PHA
         LDA   L020091
         CLC
         ADC   #$0031
         PHA
         JSL   L0705E1
         PLY
         PLY
         PLY
         PLY
         PLY
         PEA   $000F
         LDA   $FD
         CLC
         ADC   #$0006
         PHA
         LDA   $FB
         CLC
         ADC   #$0032
         PHA
         LDA   L020093
         CLC
         ADC   #$0006
         PHA
         LDA   L020091
         CLC
         ADC   #$0032
         PHA
         JSL   L0705E1
         PLY
         PLY
         PLY
         PLY
         PLY
         LDA   $FB
         CMP   L020091
         BEQ   L110294
         PEA   $000F
         LDA   $FD
         CLC
         ADC   #$0007
         PHA
         LDA   $FB
         CLC
         ADC   #$0032
         PHA
         LDA   L020093
         CLC
         ADC   #$0007
         PHA
         LDA   L020091
         CLC
         ADC   #$0032
         PHA
         JSL   L0705E1
         PLY
         PLY
         PLY
         PLY
         PLY
L110294  LDA   $FB
         STA   L020091
         LDA   $FD
         STA   L020093
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L1102A6  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDX   L020118
         LDA   L020116
         PHX
         PHA
         LDX   L02014D
         LDA   L02014B
         CLC
         ADC   #$0020
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         PEA   $0024
         PEA   $0000
         PEA   $4001
         JSL   L070000
         TAY
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
         LDA   L020093
         CLC
         ADC   #$0006
         CLC
         ADC   #$000A
         PHA
         LDA   L020091
         CLC
         ADC   #$0031
         CLC
         ADC   #$000C
         PHA
         LDA   L020093
         CLC
         ADC   #$0006
         PHA
         LDA   L020091
         CLC
         ADC   #$0031
         PHA
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         LDX   L02014D
         LDA   L02014B
         CLC
         ADC   #$0020
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         JSL   L060318
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         LDA   L020093
         CLC
         ADC   #$0006
         CLC
         ADC   #$000A
         PHA
         LDA   L020091
         CLC
         ADC   #$0031
         CLC
         ADC   #$000C
         PHA
         LDA   L020093
         CLC
         ADC   #$0006
         PHA
         LDA   L020091
         CLC
         ADC   #$0031
         PHA
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         JSL   L060318
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         LDA   $FD
         STA   L020091
         LDA   $FF
         STA   L020093
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L110386  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         LDA   $FD
         STA   L020091
         LDA   $FF
         STA   L020093
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L1103A3  ENT
         PHD
         TSC
         SEC
         SBC   #$00F5
         TCD
         ADC   #$00EE
         TCS
         LDA   $FB
         LDX   #$0000
         TAY
         BPL   L1103B7
         DEX
L1103B7  STX   L02008B
         STA   L020089
         LDA   $FD
         LDX   #$0000
         TAY
         BPL   L1103C6
         DEX
L1103C6  STX   L02008F
         STA   L02008D
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L1103D4  ENT
         PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00DC
         TCS
         LDA   $FF
         LDX   #$0000
         TAY
         BPL   L1103E8
         DEX
L1103E8  STX   L020097
         STA   L020095
         LDA   $F9
         LDX   #$0000
         TAY
         BPL   L1103F7
         DEX
L1103F7  STX   $E4
         STA   $E2
         LDA   $FB
         LDX   #$0000
         TAY
         BPL   L110404
         DEX
L110404  STX   $E0
         STA   $DE
         LDX   L020097
         LDA   L020095
         PHX
         PHA
         LDX   $E4
         LDA   $E2
         SEC
         SBC   L020089
         PHA
         TXA
         SBC   L02008B
         TAX
         PLA
         SEC
         JSL   L1A0F9E
         PLY
         PLY
         STX   $EC
         STA   $EA
         LDX   L020097
         LDA   L020095
         PHX
         PHA
         LDX   $E0
         LDA   $DE
         SEC
         SBC   L02008D
         PHA
         TXA
         SBC   L02008F
         TAX
         PLA
         SEC
         JSL   L1A0F9E
         PLY
         PLY
         STX   $E8
         STA   $E6
         LDX   $EC
         LDA   $EA
         STX   $EE
         ORA   $EE
         BNE   L11048B
         LDX   #$0000
         LDA   #$0000
         PHX
         PHA
         LDX   $E4
         LDA   $E2
         SEC
         SBC   L020089
         PHA
         TXA
         SBC   L02008B
         TAX
         PLA
         JSL   L1A130B
         BVS   L110476
         EOR   #$8000
L110476  BMI   L11047D
         LDA   #$0001
         BRA   L110480
L11047D  LDA   #$FFFF
L110480  LDX   #$0000
         TAY
         BPL   L110487
         DEX
L110487  STX   $EC
         STA   $EA
L11048B  LDX   $E8
         LDA   $E6
         STX   $EE
         ORA   $EE
         BNE   L1104CA
         LDX   #$0000
         LDA   #$0000
         PHX
         PHA
         LDX   $E0
         LDA   $DE
         SEC
         SBC   L02008D
         PHA
         TXA
         SBC   L02008F
         TAX
         PLA
         JSL   L1A130B
         BVS   L1104B5
         EOR   #$8000
L1104B5  BMI   L1104BC
         LDA   #$0001
         BRA   L1104BF
L1104BC  LDA   #$FFFF
L1104BF  LDX   #$0000
         TAY
         BPL   L1104C6
         DEX
L1104C6  STX   $E8
         STA   $E6
L1104CA  LDA   $FD
         CMP   #$0001
         BEQ   L1104D8
         LDA   $FD
         CMP   #$0002
         BNE   L1104EC
L1104D8  LDX   L02008F
         LDA   L02008D
         PHA
         LDX   L02008B
         LDA   L020089
         PHA
         JSL   L110386
         PLY
         PLY
L1104EC  LDA   L020089
         CMP   $E2
         BNE   L110515
         LDA   L02008B
         CMP   $E4
         BNE   L110515
         SEC
         LDA   L02008D
         SBC   $DE
         BNE   L110509
         LDA   L02008F
         SBC   $E0
         BRA   L110510
L110509  LDA   L02008F
         SBC   $E0
         REP   #$02
L110510  BNE   L110515
         BRL   L110629
L110515  JSL   L0F11B0
         JSL   L1D0395
         JSL   L1302A9
         PEI   $EC
         PEI   $EA
         JSL   L1B002E
         PLY
         PLY
         PHX
         PHA
         LDX   L02008B
         LDA   L020089
         SEC
         SBC   $E2
         PHA
         TXA
         SBC   $E4
         TAX
         PLA
         PHX
         PHA
         JSL   L1B002E
         PLY
         PLY
         JSL   L1A130B
         BVS   L11054D
         EOR   #$8000
L11054D  BMI   L110566
         LDX   L02008B
         LDA   L020089
         CLC
         ADC   $EA
         PHA
         TXA
         ADC   $EC
         TAX
         PLA
         STX   L02008B
         STA   L020089
         BRA   L110570
L110566  LDX   $E4
         LDA   $E2
         STX   L02008B
         STA   L020089
L110570  PEI   $E8
         PEI   $E6
         JSL   L1B002E
         PLY
         PLY
         PHX
         PHA
         LDX   L02008F
         LDA   L02008D
         SEC
         SBC   $DE
         PHA
         TXA
         SBC   $E0
         TAX
         PLA
         PHX
         PHA
         JSL   L1B002E
         PLY
         PLY
         JSL   L1A130B
         BVS   L11059C
         EOR   #$8000
L11059C  BMI   L1105B5
         LDX   L02008F
         LDA   L02008D
         CLC
         ADC   $E6
         PHA
         TXA
         ADC   $E8
         TAX
         PLA
         STX   L02008F
         STA   L02008D
         BRA   L1105BF
L1105B5  LDX   $E0
         LDA   $DE
         STX   L02008F
         STA   L02008D
L1105BF  LDA   $FD
         CMP   #$0001
         BNE   L1105DE
         PEA   $0001
         LDX   L02008F
         LDA   L02008D
         PHA
         LDX   L02008B
         LDA   L020089
         PHA
         JSL   L11015C
         PLY
         PLY
         PLY
L1105DE  LDA   $FD
         CMP   #$0002
         BNE   L1105F9
         LDX   L02008F
         LDA   L02008D
         PHA
         LDX   L02008B
         LDA   L020089
         PHA
         JSL   L1102A6
         PLY
         PLY
L1105F9  LDX   L02008F
         LDA   L02008D
         PHA
         LDX   L02008B
         LDA   L020089
         PHA
         JSL   L110000
         PLY
         PLY
         LDA   $FD
         SEC
         SBC   #$0002
         BVS   L110618
         EOR   #$8000
L110618  BMI   L110626
         JSL   L120231
         JSL   L1F006F
         JSL   L12019F
L110626  BRL   L1104EC
L110629  TSC
         CLC
         ADC   #$0016
         TCS
         PLD
         RTL
