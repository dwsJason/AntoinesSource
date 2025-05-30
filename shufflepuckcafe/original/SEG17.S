*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

         mx    %00

         rel
         dsk   Seg17.L
         lst   off

*-----------

         use   Seg17.E
         use   Seg17.X

*-----------

         use   4/Event.Macs
         use   4/Qd.Macs
         use   4/Util.Macs

*-----------

L170000  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
L17000B  JSL   L0F15F0
         TAY
         BEQ   L17001C
         JSL   L0F11B0
         JSL   L1D0395
         BRA   L17000B
L17001C  JSL   L1602ED
         LDA   L020108
         CMP   #$0000
         BNE   L17002E
         JSL   L1607D4
         BRA   L17003C
L17002E  JSL   L1602C7
         JSL   L1F0219
         LDA   #$0001
         STA   L02010A
L17003C  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L170044  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L020108
         CMP   #$0001
         BNE   L17005C
         STZ   L020108
         BRA   L170062
L17005C  LDA   #$0001
         STA   L020108
L170062  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L17006A  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         SEC
         LDA   L020163
         SBC   #$0000
         BNE   L170086
         LDA   L020165
         SBC   #$0000
         BRA   L17008E
L170086  LDA   L020165
         SBC   #$0000
         REP   #$02
L17008E  BEQ   L170097
         BVS   L170095
         EOR   #$8000
L170095  BMI   L1700A3
L170097  JSL   L170044
         JSL   L0D0281
         JSL   L21016B
L1700A3  SEC
         LDA   L020163
         SBC   #$0578
         BNE   L1700B4
         LDA   L020165
         SBC   #$0000
         BRA   L1700BC
L1700B4  LDA   L020165
         SBC   #$0000
         REP   #$02
L1700BC  BVS   L1700C1
         EOR   #$8000
L1700C1  BPL   L1700CF
         JSL   L170044
         JSL   L0D02BC
         JSL   L21016B
L1700CF  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L1700D7  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   ^L032501
         PEA   L032501
         JSL   L1A0E02
         PLY
         PLY
         JSL   L0D01AE
         JSL   L0E0000
         JSL   L1F01E8
         JSL   L2201EA
         LDA   #$0001
         STA   L020108
         JSL   L1A0E95
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L170110  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         JSL   L180000
L17011F  LDA   L020106
         BNE   L170127
         BRL   L170151
L170127  JSL   L160645
         JSL   L0802D6
         JSL   L08034B
         JSL   L0E0019
         JSL   L21016B
         JSL   L1F025A
         JSL   L0F11B0
         JSL   L1D0000
         JSL   L1302A9
         JSL   L17006A
         BRA   L17011F
L170151  JSL   L13007B
         TAY
         BNE   L170170
         JSL   L0F15F0
         TAY
         BEQ   L170170
         JSL   L0D01C7
         TAY
         BEQ   L170170
         JSL   L0F11B0
         JSL   L1D0395
         BRA   L170151
L170170  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L170178  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   ^L032510
         PEA   L032510
         JSL   L1A0E02
         PLY
         PLY
         _HideCursor
         BCS   L17019B
         LDA   #$0000
L17019B  STAL  L0201E7
         JSL   L0F1632
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
         LDX   L020155
         LDA   L020153
         CLC
         ADC   #$0020
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         JSL   L0B0054
         PLY
         PLY
         PLY
         PLY
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
         JSL   L0F1864
         PEA   $00C8
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
         JSL   L0901BD
         PLY
         PLY
         PLY
         PLY
         PLY
         JSL   L0F0CFA
         JSL   L0D0000
         JSL   L0D04FB
         LDA   L02010C
         BEQ   L170241
         JSL   L060000
L170241  JSL   L0F01B9
         PEA   $00C8
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         JSL   L0901BD
         PLY
         PLY
         PLY
         PLY
         PLY
         LDA   L02010C
         BEQ   L170277
         STZ   L02010C
         LDX   L020155
         LDA   L020153
         PHX
         PHA
         JSL   L0600EB
         PLY
         PLY
L170277  LDA   #$0001
         STA   L020106
         JSL   L0F01F7
         JSL   L0D01C7
         TAY
         BEQ   L17029C
         JSL   L0D0322
         JSL   L1700D7
         PEA   ^L03251C
         PEA   L03251C
         JSL   L1A0DAA
         PLY
         PLY
L17029C  JSL   L21016B
         JSL   L170000
         JSL   L170110
         JSL   L0F15CB
         JSL   L130000
         TAY
         BNE   L1702B6
         BRL   L17030B
L1702B6  JSL   L13007B
         TAY
         BEQ   L1702C0
         BRL   L17030B
L1702C0  JSL   L1D0333
         PEA   $00C8
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
         JSL   L0901BD
         PLY
         PLY
         PLY
         PLY
         PLY
         PEA   $00C8
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         JSL   L0901BD
         PLY
         PLY
         PLY
         PLY
         PLY
         JSL   L1C01FD
L17030B  JSL   L0D005E
         JSL   L160000
         _InitCursor
         BCS   L17031F
         LDA   #$0000
L17031F  STAL  L0201E7
         PHA
         PEA   $FFFF
         PEA   $0000
         _FlushEvents
         BCS   L170336
         LDA   #$0000
L170336  STAL  L0201E7
         PLA
         JSL   L1A0E95
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL
