*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

            mx    %00

            rel
            dsk   Seg14.L
            lst   off

*-----------

            use   Seg14.E
            use   Seg14.X

*-----------

            use   4/Qd.Macs
            use   4/Util.Macs

*-----------

L140000     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   $00C8
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
            JSL   L0901BD
            PLY
            PLY
            PLY
            PLY
            PLY
            LDX   L02014D
            LDA   L02014B
            PHX
            PHA
            JSL   L0600EB
            PLY
            PLY
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L140048     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00D6
            TCS
            PEA   ^L0320FE
            PEA   L0320FE
            JSL   L1A0E02
            PLY
            PLY
            LDA   $FB
            PHA
            LDA   #$0140
            SEC
            JSL   L1A109A
            PLA
            CLC
            ADC   $F9
            STA   $E2
            LDA   #$001E
            PHA
            LDA   $F9
            SEC
            JSL   L1A0F19
            PLY
            STA   $EC
            LDA   #$001E
            PHA
            LDA   #$013F
            SEC
            SBC   $FD
            SEC
            JSL   L1A0F19
            PLY
            STA   $EA
            LDA   #$001E
            PHA
            LDA   $FB
            SEC
            JSL   L1A0F19
            PLY
            STA   $E8
            LDA   #$001E
            PHA
            LDA   #$00C7
            SEC
            SBC   $FF
            SEC
            JSL   L1A0F19
            PLY
            STA   $E6
            LDA   $EC
            CLC
            ADC   $EA
            STA   $DE
            LDA   $E8
            CLC
            ADC   $E6
            STA   $DC
            LDA   $E8
            PHA
            LDA   #$0140
            SEC
            JSL   L1A109A
            LDA   $EC
            PLX
            STX   $F2
            CLC
            ADC   $F2
            STA   $E0
            LDA   $FD
            SEC
            SBC   $F9
            STA   $DA
            LDA   $FF
            SEC
            SBC   $FB
            STA   $D8
            STZ   $E4
            BRL   L14015E
L1400E6     PEA   $0001
            JSL   L180073
            PLY
            PEI   $DA
            PEI   $D8
            LDA   #$0001
            PHA
            LDA   $E2
            SEC
            JSL   L1A184A
            PLA
            LDX   #$0000
            TAY
            BPL   L140105
            DEX
L140105     PHX
            PHA
            LDX   L0200A2
            LDA   L0200A0
            JSL   L1A0EFF
            LDA   #$0001
            PHA
            LDA   $E2
            SEC
            JSL   L1A184A
            PLA
            LDX   #$0000
            TAY
            BPL   L140124
            DEX
L140124     PHX
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
            JSL   L1A0EFF
            JSL   L0A017E
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   $DA
            CLC
            ADC   $DE
            STA   $DA
            LDA   $D8
            CLC
            ADC   $DC
            STA   $D8
            LDA   $E2
            SEC
            SBC   $E0
            STA   $E2
            INC   $E4
L14015E     LDA   $E4
            CMP   #$001E
            BNE   L1400E6
            JSL   L1A0E95
            TSC
            CLC
            ADC   #$001C
            TCS
            PLD
            RTL

L140171     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDX   L02014D
            LDA   L02014B
            PHX
            PHA
            LDX   L020114
            LDA   L020112
            PHX
            PHA
            JSL   L05058F
            PLY
            PLY
            PLY
            PLY
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
            JSL   L2603BA
            LDX   L020114
            LDA   L020112
            PHX
            PHA
            PEA   $FFFF
            JSL   L09013B
            PLY
            PLY
            PLY
            PEA   $008B
            PEA   $00C7
            PEA   $005A
            PEA   $005A
            JSL   L140048
            PLY
            PLY
            PLY
            PLY
            PEA   $00C8
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
            JSL   L0901BD
            PLY
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

L140206     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   ^L032119
            PEA   L032119
            JSL   L1A0E02
            PLY
            PLY
            _HideCursor
* BCS L140229
* LDA #$0000
*L140229 STAL L0201E7
            LDX   L0200A6
            LDA   L0200A4
            STX   $F6
            ORA   $F6
            BNE   L14024B
            PEA   ^L03212C
            PEA   L03212C
            JSL   L050542
            PLY
            PLY
            STX   L0200A6
            STA   L0200A4
L14024B     LDX   L0200A2
            LDA   L0200A0
            PHX
            PHA
            JSL   L04039E
            PLY
            PLY
            JSL   L060000
            LDX   L02014D
            LDA   L02014B
            PHX
            PHA
            LDX   L0200A6
            LDA   L0200A4
            PHX
            PHA
            JSL   L05058F
            PLY
            PLY
            PLY
            PLY
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
            JSL   L260215
            JSL   L140000
            JSL   L040311
            PEA   $00C8
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
            JSL   L0901BD
            PLY
            PLY
            PLY
            PLY
            PLY
            JSL   L060000
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
            LDX   L020155
            LDA   L020153
            PHX
            PHA
            JSL   L0600EB
            PLY
            PLY
            _ShowCursor
* BCS L1402FB
* LDA #$0000
*L1402FB STAL L0201E7
            JSL   L1A0E95
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

