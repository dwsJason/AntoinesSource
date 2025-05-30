*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

            mx    %00

            rel
            dsk   Seg13.L
            lst   off

*-----------

            use   Seg13.E
            use   Seg13.X

*-----------

            use   4/Event.Macs
            use   4/Menu.Macs
            use   4/Qd.Macs
            use   4/Util.Macs

*-----------

L130000     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L02009D
            CMP   #$0003
            BNE   L13001A
            LDA   #$0000
            BRA   L13001D
* BRA L13001D
L13001A     LDA   #$0001
L13001D     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L130027     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   #$0002
            STA   L02009D
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L130040     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   #$0003
            STA   L02009D
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L130059     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            LDA   #$0001
            STA   L02009D
            LDA   $FF
            SEP   #$20
            STA   L02009F
            REP   #$20
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L13007B     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L02009D
            CMP   #$0002
            BEQ   L13009B
            LDA   L02009D
            CMP   #$0003
            BEQ   L13009B
            LDA   #$0000
            BRA   L13009E
L13009B     LDA   #$0001
L13009E     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L1300A8     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            LDA   L02009D
            BNE   L1300BD
            STZ   $F4
            BRL   L13014E
L1300BD     LDA   #$0001
            STA   $F4
            LDA   L02009D
            PHA
            PEA   ^L0320A4
            PEA   L0320A4
            JSL   L1A0DAA
            PLY
            PLY
            PLY
            LDA   L02009D
            CMP   #$0001
            BEQ   L1300DE
            BRL   L130130
L1300DE     STZ   L02009D
            LDA   #$0005
            STAL  L03343D
            LDA   L02009F
            AND   #$00FF
            LDX   #$0000
            PHA
            TXA
            STAL  L033441
            PLA
            STAL  L03343F
            LDA   #$0100
            STAL  L03344B
            PEA   ^L03343D
            PEA   L03343D
            PEA   $0000
            PEA   $0000
            _MenuKey
* BCS L13011B
* LDA #$0000
*L13011B STAL L0201E7
            LDAL  L03344F
            TAX
            LDAL  L03344D
            PHX
            PHA
            JSL   L1C0764
            PLY
            PLY
L130130     LDA   L02009D
            CMP   #$0003
            BNE   L13013F
            STZ   L02009D
            JSL   L1004F3
L13013F     LDA   L02009D
            CMP   #$0002
            BNE   L13014E
            STZ   L02009D
            JSL   L170178
L13014E     LDA   $F4
            TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

L13015A     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            LDA   #$0003
            PHA
            LDA   $FF
            PHA
            LDA   #$0005
            SEC
            JSL   L1A109A
            PLA
            SEC
            JSL   L1A184A
            PLA
            TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L130185     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            PEA   ^L0320B1
            PEA   L0320B1
            JSL   L1A0E02
            PLY
            PLY
            JSL   L090036
            JSL   L040344
            PEA   $0000
            JSL   L090091
            PLY
            JSL   L05008E
            _InitCursor
* BCS L1301BC
* LDA #$0000
*L1301BC STAL L0201E7
            _HideCursor
* BCS L1301CC
* LDA #$0000
*L1301CC STAL L0201E7

*--- Patch for ROM3 random values

            lda   PTRROM+2     ; already loaded?
            ora   PTRROM
            bne   noPATCH

            PEA   ^ROMFILE     ; no load it
            PEA   ROMFILE
            JSL   L050542
            PLY
            PLY
            STX   PTRROM+2
            STA   PTRROM

            lda   PTRROM       ; table 1
            clc
            adc   #$0F00
            stal  PATCHROM+1
            sep   #$20
            lda   PTRROM+2
            adc   #0
            stal  PATCHROM+3
            rep   #$20

            lda   PTRROM       ; table 2
            clc
            adc   #$7F00
            stal  PATCHROM+5
            sep   #$20
            lda   PTRROM+2
            adc   #0
            stal  PATCHROM+7
            rep   #$20

            lda   PTRROM       ; table 3
            clc
            adc   #$F000
            stal  PATCHROM+9
            sep   #$20
            lda   PTRROM+2
            adc   #0
            stal  PATCHROM+11
            rep   #$20

*---

noPATCH     PEA   $0000
            PEA   $7D20
            JSL   L040514
            PLY
            PLY
            STX   L02014D
            STA   L02014B
            LDX   #$00E1
            LDA   #$2000
            STX   L0200A2
            STA   L0200A0
            PEA   ^L0320BC
            PEA   L0320BC
            JSL   L050542
            PLY
            PLY
            STX   $F4
            STA   $F2
            LDX   L02014D
            LDA   L02014B
            PHX
            PHA
            PEI   $F4
            PEI   $F2
            JSL   L05058F
            PLY
            PLY
            PLY
            PLY
            JSL   L060000
            JSL   L140000
            PEI   $F4
            PEI   $F2
            JSL   L040537
            PLY
            PLY
            JSL   L0803B6
            JSL   L200000
            JSL   L2402F0
            JSL   L21013B
            JSL   L1B0296
            PEA   ^L0320CD
            PEA   L0320CD
            JSL   L050542
            PLY
            PLY
            STX   $F4
            STA   $F2
            LDX   L02014D
            LDA   L02014B
            PHX
            PHA
            PEI   $F4
            PEI   $F2
            JSL   L05058F
            PLY
            PLY
            PLY
            PLY
            PEI   $F4
            PEI   $F2
            JSL   L040537
            PLY
            PLY
            JSL   L060000
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
            JSL   L04039E
            PLY
            PLY
            JSL   L140000
            PEA   ^L0320DF
            PEA   L0320DF
            JSL   L05051F
            PLY
            PLY
            STX   L02009B
            STA   L020099
            JSL   L1004F3
            JSL   L1A0E95
            TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L1302A9     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            PHA
            PEA   $0008
            PEA   ^L03343D
            PEA   L03343D
            _GetNextEvent
* BCS L1302CA
* LDA #$0000
*L1302CA STAL L0201E7
            PLA
            TAY
            BNE   L1302D5
            BRL   L130328
L1302D5     LDAL  L033441
            TAX
            LDAL  L03343F
            AND   #$00FF
            PHA
            TXA
            AND   #$0000
            TAX
            PLA
            STA   $F4
            PEI   $F4
            PEA   ^L0320F2
            PEA   L0320F2
            JSL   L1A0DAA
            PLY
            PLY
            PLY
            LDA   $F4
            BRL   L13031B
L1302FE     JSL   L040311
            BRL   L130328
L130305     STZ   L020106
            LDAL  L03344B
            AND   #$0100
            TAY
            BEQ   L130319
            PEI   $F4
            JSL   L130059
            PLY
L130319     BRA   L130328
L13031B     CMP   #$0050
            BEQ   L1302FE
            CMP   #$0070
            BEQ   L1302FE
            JMP   L130305

L130328     TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

L130330     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00DA
            TCS
            PHA
            PEA   $0008
            PEA   $0000
            TDC
            CLC
            ADC   #$00DE
            PHA
            _GetNextEvent
* BCS L130354
* LDA #$0000
*L130354 STAL L0201E7
            PLA
            CMP   #$0000
            BNE   L130361
            BRL   L1303B8
L130361     LDA   $EC
            AND   #$0100
            TAY
            BNE   L13036C
            BRL   L1303B8
L13036C     LDX   $E2
            LDA   $E0
            AND   #$003F
            PHA
            TXA
            AND   #$0000
            TAX
            PLA
            STA   $DC
            LDA   $DC
            BRL   L1303A7
L130381     LDA   #$0001
            STA   L02011E
            BRL   L1303B8
L13038A     JSL   L230B1C
            BRL   L1303B8
L130391     JSL   L19003E
            JSL   L140206
            BRL   L1303B8
L13039C     BRL   L1303B8
L13039F     DA    L130381
            DA    L130391
            DA    L13038A
            DA    L13039C
L1303A7     SEC
            SBC   #$0051
            CMP   #$0003
            BCC   L1303B3
            LDA   #$0003
L1303B3     ASL
            TAX
            JMP   (L13039F,X)

L1303B8     TSC
            CLC
            ADC   #$0020
            TCS
            PLD
            RTL

