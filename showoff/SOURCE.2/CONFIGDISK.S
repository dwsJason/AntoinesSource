;...............................................................
;
; FILE : CONFIGDISK.S                   - routines bank 00 -
;        ------------
;...............................................................
;...............................................................
;
;        Config_Disk                    - routines SmartPort -
;
;...............................................................
Config_Disk    START
               Using FormatData
;--------------------------------------
;        Search_DeviceName
;--------------------------------------
Search_deviceName ENTRY

               jsr RamYesOrNot

               lda >$00BF31             |number of device -1
               and #$00FF
               sta DevCnt

               lda DevCnt               |Device List
               tax
               asl a
               tay
LoopDevLst     lda >$00BF32,x
               and #$00FF
               sta DevLst,y
               dey
               dey
               dex
               bpl LoopDevLst

               ldx #$1E                 |Device Adresse
LoopDevAdr     lda >$00BF10,x
               sta DevAdr,x
               dex
               dex
               bpl LoopDevAdr
;--
               lda #1                   |init a 1
               sta DeviceNumber
               lda DevCnt               |DevCnt
               sta zDevCnt
               lda #0
               sta NbDrive35
               sta NbDrive54
;--
LoopSearch     lda zDevCnt              |Search Device Name
               asl a
               tax
               lda DevLst,x
               bit #$0080
               bmi drive2
drive1         and #$0070
               asl a
               tay
               lda DevAdr,y
               cmp >$00BF10             |no device
               beq NoDevice
               bra YesDevice
drive2         and #$0070
               asl a
               tay
               lda DevAdr+16,y
               cmp >$00BF10             |no device
               beq NoDevice
               bra YesDevice
;--
YesDevice      lda zDevCnt
               asl a
               tax
               lda DevLst,x
               and #$000F
               cmp #$000B
               beq Drive35
               cmp #0
               bne NoDevice
;--
Drive54        ANOP
               lda NbDrive54
               cmp #2
               bcs fDrive54
               asl a
               tax
               lda DeviceNumber
               sta Tab_Slot_Drive+4,x
               inc NbDrive54
fDrive54       bra NoDevice
;--
Drive35        ANOP
               lda NbDrive35
               cmp #2
               bcs fDrive35
               asl a
               tax
               lda DeviceNumber
               sta Tab_Slot_Drive,x
               inc NbDrive35

               lda DeviceNumber
               clc
               adc RamOrNot
               sta DeviceNumber

fDrive35       bra NoDevice
;--
NoDevice       ANOP
               inc DeviceNumber
               dec zDevCnt
               bmi fSearch
               brl LoopSearch
;--
fSearch        rts
;--------------------------------------
;        RamYesOrNot
;--------------------------------------
RamYesOrNot    ANOP

               lda #0
               sta RamOrNot

               lda >$00BF31
               and #$00FF
               tax
rRYON          lda >$00BF32,x
               and #$00FF
               cmp #$2B
               beq sRYON_P
               cmp #$AB
               beq sRYON_P
sRYON          dex
               bpl rRYON
               rts
sRYON_P        inc RamOrNot
               bra sRYON
;--------------------------------------
;        Data
;--------------------------------------
RamOrNot       ds 2
;--
NbDrive35      ds 2
NbDrive54      ds 2
;-
DeviceNumber   ds 2
DevLst         ds 32
DevCnt         ds 2
DevAdr         ds 32
zDevCnt        ds 2
;-
               END
