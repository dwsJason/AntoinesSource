*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

         mx    %00

         rel
         dsk   Seg21.L
         lst   off

*-----------

         use   Seg21.X

*-----------

         use   4/Event.Macs
         use   4/Util.Macs

*-----------

         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F2
         TCS
         LDA   $FF
         STA   L02018B
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L210018  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00EE
         TCS
         LDA   L02018D
         SEC
         SBC   L02018B
         STA   $F4
         LDA   #$0104
         STA   $F2
         LDA   L02018F
         STA   $F0
         LDA   $F0
         LDX   #$0000
         TAY
         BPL   L21003F
         DEX
L21003F  CLC
         ADC   #$0240
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         LDA   $F4
         LDX   #$0000
         TAY
         BPL   L210055
         DEX
L210055  PEA   $0000
         PEA   $0168
         CLC
         JSL   L1A10DF
         PLA
         PLX
         SEC
         JSL   L1A0F9E
         PLY
         PLY
         CLC
         ADC   #$00A0
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         STA   L02019B
         LDA   $F0
         LDX   #$0000
         TAY
         BPL   L210080
         DEX
L210080  CLC
         ADC   #$0240
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         LDA   $F2
         LDX   #$0000
         TAY
         BPL   L210096
         DEX
L210096  PEA   $0000
         PEA   $0153
         CLC
         JSL   L1A10DF
         PLA
         PLX
         SEC
         JSL   L1A0F9E
         PLY
         PLY
         CLC
         ADC   #$0011
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         STA   L020199
         LDA   L02018D
         CLC
         ADC   L02018B
         STA   $F4
         LDA   $F0
         LDX   #$0000
         TAY
         BPL   L2100CA
         DEX
L2100CA  CLC
         ADC   #$0240
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         LDA   $F4
         LDX   #$0000
         TAY
         BPL   L2100E0
         DEX
L2100E0  PEA   $0000
         PEA   $0168
         CLC
         JSL   L1A10DF
         PLA
         PLX
         SEC
         JSL   L1A0F9E
         PLY
         PLY
         CLC
         ADC   #$00A0
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         STA   L02019F
         LDA   $F0
         LDX   #$0000
         TAY
         BPL   L21010B
         DEX
L21010B  CLC
         ADC   #$0240
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         LDX   #$0001
         LDA   #$8D44
         SEC
         JSL   L1A0F9E
         PLY
         PLY
         CLC
         ADC   #$0011
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         STA   L02019D
         TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L21013B  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         STZ   L0201A3
         STZ   L0201A1
         LDA   L02018B
         ASL
         PHA
         LDA   #$01F4
         PLX
         STX   $FA
         SEC
         SBC   $FA
         STA   L0201A7
         LDA   #$00C8
         STA   L0201A5
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L21016B  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00EC
         TCS
         LDA   L02018F
         STA   L020195
         LDA   L02018D
         STA   L020193
         SEP   #$30
         LDAL  $00047C
         STA   $F2
         LDAL  $00057C
         STA   $F3
         LDAL  $0004FC
         STA   $F4
         LDAL  $0005FC
         STA   $F5
         REP   #$30
         LDA   $F2
         ASL
         ASL
         ASL
         STA   $F2
         LDX   $F2
         LDA   #$0005
         JSL   L090000
         STA   $F2
         LDA   $F4
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   $F4
         LSR
         TAX
         LDA   #$0005
         JSL   L090000
         STA   $F4
         LDA   #$0000
         STA   $EE
         STA   $F0
         LDA   L0201A7
         CMP   $F2
         BCS   L2101DC
         LDA   $F2
         SEC
         SBC   L0201A7
         STA   $F0
         BRA   L2101ED
L2101DC  LDA   L0201A3
         CMP   $F2
         BEQ   L2101ED
         BCC   L2101ED
         LDA   $F2
         SEC
         SBC   L0201A3
         STA   $F0
L2101ED  LDA   L0201A5
         CMP   $F4
         BCS   L2101FE
         LDA   $F4
         SEC
         SBC   L0201A5
         STA   $EE
         BRA   L21020F
L2101FE  LDA   L0201A1
         CMP   $F4
         BEQ   L21020F
         BCC   L21020F
         LDA   $F4
         SEC
         SBC   L0201A1
         STA   $EE
L21020F  LDA   L0201A1
         CLC
         ADC   $EE
         STA   L0201A1
         LDA   L0201A5
         CLC
         ADC   $EE
         STA   L0201A5
         LDA   L0201A7
         CLC
         ADC   $F0
         STA   L0201A7
         LDA   L0201A3
         CLC
         ADC   $F0
         STA   L0201A3
         LDA   $F2
         SEC
         SBC   L0201A3
         PHA
         LDA   L02018B
         PLX
         STX   $FA
         CLC
         ADC   $FA
         SEC
         SBC   #$00FA
         STA   L02018D
         LDA   $F4
         SEC
         SBC   L0201A1
         PHA
         LDA   #$00C8
         PLX
         STX   $FA
         SEC
         SBC   $FA
         STA   L02018F
         JSL   L210018
         TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L210269  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         STZ   L020191
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L21027F  PHD
         TSC
         SEC
         SBC   #$00ED
         TCD
         ADC   #$00E6
         TCS
         LDA   L020191
         SEC
         SBC   #$0000
         BEQ   L21029D
         BVS   L210298
         EOR   #$8000
L210298  BPL   L21029D
         BRL   L2103E2
L21029D  LDX   #$0000
         LDA   #$0007
         PHX
         PHA
         LDA   [$FB]
         LDX   #$0000
         TAY
         BPL   L2102AE
         DEX
L2102AE  PHX
         PHA
         LDX   L020169
         LDA   L020167
         SEC
         JSL   L1A10DF
         PLA
         PLX
         SEC
         JSL   L1A186E
         PLA
         PLX
         STX   L020169
         STA   L020167
         LDA   $FF
         BNE   L2102D1
         BRL   L210318
L2102D1  LDX   #$0000
         LDA   #$0007
         PHX
         PHA
         LDY   #$0002
         LDA   [$FB],Y
         LDX   #$0000
         TAY
         BPL   L2102E5
         DEX
L2102E5  PHX
         PHA
         LDX   L02016D
         LDA   L02016B
         SEC
         JSL   L1A10DF
         PLA
         PLX
         SEC
         JSL   L1A186E
         PLA
         PLX
         STX   L02016D
         STA   L02016B
         LDX   L02016D
         LDA   L02016B
         PHX
         PHA
         JSL   L1B002E
         PLY
         PLY
         STX   L02016D
         STA   L02016B
         BRL   L210360
L210318  LDX   #$0000
         LDA   #$0007
         PHX
         PHA
         LDY   #$0002
         LDA   [$FB],Y
         LDX   #$0000
         TAY
         BPL   L21032C
         DEX
L21032C  PHX
         PHA
         LDX   L02016D
         LDA   L02016B
         SEC
         JSL   L1A10DF
         PLA
         PLX
         SEC
         JSL   L1A186E
         PLA
         PLX
         STX   L02016D
         STA   L02016B
         LDX   L02016D
         LDA   L02016B
         PHX
         PHA
         JSL   L1B002E
         PLY
         PLY
         JSL   L1A0F0A
         STX   L02016D
         STA   L02016B
L210360  LDX   #$0000
         LDA   #$0007
         PHX
         PHA
         LDY   #$0004
         LDA   [$FB],Y
         LDX   #$0000
         TAY
         BPL   L210374
         DEX
L210374  PHX
         PHA
         LDX   $F5
         LDA   $F3
         SEC
         JSL   L1A10DF
         PLA
         PLX
         SEC
         JSL   L1A186E
         PLA
         PLX
         STX   $F5
         STA   $F3
         LDX   #$0000
         LDA   #$0007
         PHX
         PHA
         LDY   #$0006
         LDA   [$FB],Y
         LDX   #$0000
         TAY
         BPL   L2103A0
         DEX
L2103A0  PHX
         PHA
         LDX   $F9
         LDA   $F7
         SEC
         JSL   L1A10DF
         PLA
         PLX
         SEC
         JSL   L1A186E
         PLA
         PLX
         STX   $F9
         STA   $F7
         LDX   L020169
         LDA   L020167
         CLC
         ADC   $F3
         PHA
         TXA
         ADC   $F5
         TAX
         PLA
         STX   L020169
         STA   L020167
         LDX   L02016D
         LDA   L02016B
         CLC
         ADC   $F7
         PHA
         TXA
         ADC   $F9
         TAX
         PLA
         STX   L02016D
         STA   L02016B
L2103E2  LDA   $FF
         BEQ   L21041F
         LDA   L02018F
         CLC
         ADC   #$0018
         LDX   #$0000
         TAY
         BPL   L2103F4
         DEX
L2103F4  PHX
         PHA
         LDX   L020165
         LDA   L020163
         JSL   L1A130B
         BEQ   L21041D
         BVS   L210407
         EOR   #$8000
L210407  BPL   L21041D
         LDA   L02018F
         CLC
         ADC   #$0018
         LDX   #$0000
         TAY
         BPL   L210417
         DEX
L210417  STX   L020165
         STA   L020163
L21041D  BRA   L210454
L21041F  LDA   L02018F
         SEC
         SBC   #$0018
         LDX   #$0000
         TAY
         BPL   L21042D
         DEX
L21042D  PHX
         PHA
         LDX   L020165
         LDA   L020163
         JSL   L1A130B
         BVS   L21043E
         EOR   #$8000
L21043E  BMI   L210454
         LDA   L02018F
         SEC
         SBC   #$0018
         LDX   #$0000
         TAY
         BPL   L21044E
         DEX
L21044E  STX   L020165
         STA   L020163
L210454  SEC
         LDA   L020163
         SBC   #$00C8
         BNE   L210465
         LDA   L020165
         SBC   #$0000
         BRA   L21046D
L210465  LDA   L020165
         SBC   #$0000
         REP   #$02
L21046D  BEQ   L2104A2
         BVS   L210474
         EOR   #$8000
L210474  BPL   L2104A2
         SEC
         LDA   L02016B
         SBC   #$0005
         BNE   L210487
         LDA   L02016D
         SBC   #$0000
         BRA   L21048F
L210487  LDA   L02016D
         SBC   #$0000
         REP   #$02
L21048F  BVS   L210494
         EOR   #$8000
L210494  BMI   L2104A2
         LDX   #$0000
         LDA   #$0005
         STX   L02016D
         STA   L02016B
L2104A2  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L2104AA  PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00E8
         TCS
         PHA
         PEA   $0000
         _Button
         BCS   L2104C5
         LDA   #$0000
L2104C5  STAL  L0201E7
         PLA
         STA   $EA
         LDA   $EA
         BNE   L210513
         LDA   L02010A
         CMP   #$0001
         BNE   L2104F5
         STZ   L02010A
         LDA   L020181
         PHA
         LDA   L02017F
         PHA
         LDX   $FD
         LDA   $FB
         PHA
         LDX   $F9
         LDA   $F7
         PHA
         JSL   L2201FD
         PLY
         PLY
         PLY
         PLY
L2104F5  PEI   $FF
         PEA   ^L02017B
         PEA   L02017B
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEI   $F7
         JSL   L21027F
         TAY
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
         BRA   L210554
L210513  LDA   L02010A
         CMP   #$0001
         BNE   L210538
         STZ   L02010A
         LDA   L020189
         PHA
         LDA   L020187
         PHA
         LDX   $FD
         LDA   $FB
         PHA
         LDX   $F9
         LDA   $F7
         PHA
         JSL   L2201FD
         PLY
         PLY
         PLY
         PLY
L210538  PEI   $FF
         PEA   ^L020183
         PEA   L020183
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEI   $F7
         JSL   L21027F
         TAY
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
L210554  TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L21055C  PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F0
         TCS
         STZ   $F2
         LDX   L020161
         LDA   L02015F
         SEC
         SBC   L020167
         PHA
         TXA
         SBC   L020169
         TAX
         PLA
         PHX
         PHA
         LDX   L020161
         LDA   L02015F
         PHX
         PHA
         JSL   L1B0170
         PLY
         PLY
         PLY
         PLY
         CLC
         ADC   #$0014
         PHA
         LDA   L020193
         PHA
         LDA   L02018D
         PHA
         JSL   L1B0070
         PLY
         PLY
         SEC
         SBC   L02018B
         PLX
         STX   $F4
         SEC
         SBC   $F4
         BVS   L2105AE
         EOR   #$8000
L2105AE  BPL   L2105B3
         BRL   L210601
L2105B3  LDX   L020161
         LDA   L02015F
         SEC
         SBC   L020167
         PHA
         TXA
         SBC   L020169
         TAX
         PLA
         PHX
         PHA
         LDX   L020161
         LDA   L02015F
         PHX
         PHA
         JSL   L1B0135
         PLY
         PLY
         PLY
         PLY
         SEC
         SBC   #$0014
         PHA
         LDA   L020193
         PHA
         LDA   L02018D
         PHA
         JSL   L1B0099
         PLY
         PLY
         CLC
         ADC   L02018B
         PLX
         STX   $F4
         SEC
         SBC   $F4
         BEQ   L210601
         BVS   L2105FA
         EOR   #$8000
L2105FA  BPL   L210601
         LDA   #$0001
         STA   $F2
L210601  LDA   $F2
         TAY
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         PLD
         RTL

L21060D  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EE
         TCS
         STZ   $F0
         LDX   L020165
         LDA   L020163
         SEC
         SBC   L02016B
         PHA
         TXA
         SBC   L02016D
         TAX
         PLA
         PHX
         PHA
         LDA   L020195
         LDX   #$0000
         TAY
         BPL   L210637
         DEX
L210637  JSL   L1A130B
         BEQ   L210678
         BVS   L210642
         EOR   #$8000
L210642  BPL   L210678
         LDA   #$0001
         STA   [$FD]
         LDX   L020165
         LDA   L020163
         SEC
         SBC   #$0018
         PHA
         TXA
         SBC   #$0000
         TAX
         PLA
         PHX
         PHA
         LDA   L02018F
         LDX   #$0000
         TAY
         BPL   L210666
         DEX
L210666  JSL   L1A130B
         BVS   L21066F
         EOR   #$8000
L21066F  BMI   L210676
         LDA   #$0001
         STA   $F0
L210676  BRA   L2106AC
L210678  LDA   #$0000
         STA   [$FD]
         LDX   L020165
         LDA   L020163
         CLC
         ADC   #$0018
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         LDA   L02018F
         LDX   #$0000
         TAY
         BPL   L21069A
         DEX
L21069A  JSL   L1A130B
         BEQ   L2106AC
         BVS   L2106A5
         EOR   #$8000
L2106A5  BPL   L2106AC
         LDA   #$0001
         STA   $F0
L2106AC  LDA   $F0
         TAY
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         PLD
         RTL

L2106B8  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00EA
         TCS
         PEA   $0000
         TDC
         CLC
         ADC   #$00F4
         PHA
         JSL   L21060D
         PLY
         PLY
         TAY
         BNE   L2106D8
         BRL   L210746
L2106D8  JSL   L21055C
         TAY
         BNE   L2106E2
         BRL   L210746
L2106E2  LDA   L020193
         LDX   #$0000
         TAY
         BPL   L2106EC
         DEX
L2106EC  PHX
         PHA
         LDA   L02018D
         LDX   #$0000
         TAY
         BPL   L2106F8
         DEX
L2106F8  JSL   L1A108F
         PLA
         PLX
         STX   $F2
         STA   $F0
         LDA   L020195
         LDX   #$0000
         TAY
         BPL   L21070C
         DEX
L21070C  PHX
         PHA
         LDA   L02018F
         LDX   #$0000
         TAY
         BPL   L210718
         DEX
L210718  JSL   L1A108F
         PLA
         PLX
         STX   $EE
         STA   $EC
         LDA   L020191
         BNE   L21072B
         JSL   L230BBC
L21072B  PEI   $F4
         PEI   $EE
         PEI   $EC
         PEI   $F2
         PEI   $F0
         JSL   L2104AA
         PLY
         PLY
         PLY
         PLY
         PLY
         LDA   #$0005
         STA   L020191
         BRA   L210759
L210746  LDA   L020191
         SEC
         SBC   #$0000
         BEQ   L210759
         BVS   L210754
         EOR   #$8000
L210754  BPL   L210759
         DEC   L020191
L210759  TSC
         CLC
         ADC   #$0010
         TCS
         PLD
         RTL

L210761  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   #$0032
         STA   L02017B
         LDA   #$0032
         STA   L02017D
         LDA   #$0046
         STA   L02017F
         LDA   #$0082
         STA   L020181
         LDA   #$0032
         STA   L020183
         LDA   #$0032
         STA   L020185
         LDA   #$0046
         STA   L020187
         LDA   #$008C
         STA   L020189
         LDA   #$0032
         STA   L02018B
         JSL   L21013B
         JSL   L1C05C2
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L2107B2  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L02017B
         CMP   #$0032
         BEQ   L2107C8
         BRL   L210814
L2107C8  LDA   L02017D
         CMP   #$0032
         BEQ   L2107D3
         BRL   L210814
L2107D3  LDA   L02017F
         CMP   #$0046
         BEQ   L2107DE
         BRL   L210814
L2107DE  LDA   L020181
         CMP   #$0082
         BNE   L210814
         LDA   L020183
         CMP   #$0032
         BNE   L210814
         LDA   L020185
         CMP   #$0032
         BNE   L210814
         LDA   L020187
         CMP   #$0046
         BNE   L210814
         LDA   L020189
         CMP   #$008C
         BNE   L210814
         LDA   L02018B
         CMP   #$0032
         BNE   L210814
         JSL   L1C05C2
         BRA   L210818
L210814  JSL   L1C05EB
L210818  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL
