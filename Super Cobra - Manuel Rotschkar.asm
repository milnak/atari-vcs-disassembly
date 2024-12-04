; Super Cobra for the Atari 2600 VCS
;
; Copyright 1983 Parker Brothers
; Written by Mike Brodie
;
; Reverse-Engineered by Manuel Rotschkar (cybergoth@nexgo.de)
; Compiles with DASM
;
; History
; 09.10.2.5K      - Started

TIA_BASE_READ_ADDRESS   = $30

    processor 6502
    include vcs.h

; First bank

       ORG $1000
       RORG $D000

LD000: JSR    $FC2D
       LDA    SWCHB
       AND    #$01
       BEQ    LD000
LD00A: LDA    SWCHB
       AND    #$01
       BNE    LD014
       JMP    LD0B3
LD014: LDA    $E9
       BEQ    LD01C
       DEC    $E9
       BNE    LD023
LD01C: LDA    SWCHB
       AND    #$02
       BEQ    LD065
LD023: LDA    SWCHB
       AND    #$08
       BNE    LD02D
       JMP    LD0BF
LD02D: INC    $C4
       LDA    $AA
       AND    #$01
       BNE    LD053
       LDA    $86
       ORA    #$08
       STA    $86
       JMP    LD505
LD03E: JSR    LD17D
       JSR    LD35B
       JSR    LD621
       JSR    LD681
       JSR    LD3F7
LD04D: JSR    $FC2D
       JMP    LD00A
LD053: LDA    INPT4
       BPL    LD0B3
       LDA    $C4
       BNE    LD062
       LDA    $C2
       CLC
       ADC    #$10
       STA    $C2
LD062: JMP    LD04D
LD065: LDA    #$0F
       STA    $E9
       LDA    $86
       AND    #$F7
       STA    $86
       LDA    $AA
       ORA    #$01
       STA    $AA
       AND    #$04
       BEQ    LD087
       DEC    $B3
       LDA    $B3
       AND    #$0F
       BNE    LD087
       LDA    $B3
       ORA    #$03
       STA    $B3
LD087: LDA    $B3
       AND    #$0F
       STA    $EF
       ASL
       ADC    $EF
       TAX
       LDY    #$02
LD093: DEX
       LDA    LD0AA,X
       STA.wy $00E6,Y
       DEY
       BPL    LD093
       LDA    #$0A
       STA    $EA
       LDA    $AA
       ORA    #$04
       STA    $AA
       JMP    LD04D
LD0AA: .byte $B0,$9A,$00,$78,$56,$04,$30,$12,$00
LD0B3: LDA    #$FF
       STA    $E0
       STA    $E1
       JSR    LD112
       JMP    LD000
LD0BF: LDA    $86
       AND    #$F7
       STA    $86
       LDA    $AA
       AND    #$0F
       STA    $EF
       LDA    $BF
       AND    #$F0
       ORA    $EF
       STA    $BF
       LDA    $AA
       ORA    #$01
       STA    $AA
       LDA    #$FF
       STA    $E9
LD0DD: LDA    #$FF
       STA    $C4
LD0E1: LDA    SWCHB
       AND    #$08
       BNE    LD0FD
       JSR    $FC2D
       DEC    $C4
       BNE    LD0E1
       LDA    $C2
       CLC
       ADC    #$10
       STA    $C2
       DEC    $E9
       BNE    LD0DD
       JMP    $FC00
LD0FD: LDA    #$B2
       STA    $C2
       LDA    $BF
       AND    #$0F
       STA    $EF
       LDA    $AA
       AND    #$F0
       ORA    $EF
       STA    $AA
       JMP    LD02D
LD112: LDA    $B3
       AND    #$0F
       STA    $EF
       LDA    #$00
       LDX    #$41
LD11C: STA    $80,X
       DEX
       BPL    LD11C
       STX    $D0
       LDA    $EF
       STA    $B3
       LDA    #$00
       STA    $E6
       STA    $E7
       STA    $E8
       STA    $EA
       STA    $C7
       STA    $C4
       LDA    #$5A
       STA    $EB
       LDA    #$B2
       STA    $C2
       LDA    #$03
       STA    $80
       LDA    SWCHB
       AND    #$40
       BNE    LD150
       LDA    $83
       AND    #$F0
       ORA    #$00
       STA    $83
LD150: JSR    LDA85
       LDA    #$2B
       STA    $C3
       LDA    #$0B
       STA    $C8
       LDA    #$18
       STA    $CC
       LDA    #$4A
       STA    $CD
LD163: LDA    #$01
       STA    $DC
       LDA    #$3D
       STA    $DD
LD16B: LDA    $BC
       ORA    #$08
       STA    $BC
       LDX    #$01
       STX    $DE
       STX    $DF
       DEX
       STX    $E0
       STX    $E1
       RTS

LD17D: JSR    LD4F7
       BEQ    LD183
       RTS

LD183: LDA    $A7
       AND    #$F0
       STA    $A7
       LDA    $A4
       AND    #$0F
       ORA    $A7
       STA    $A7
       LDA    $A4
       AND    #$F0
       ORA    $C7
       STA    $A4
       LDA    $83
       CMP    #$0A
LD19D: BNE    LD1A2
       JMP    LD2F8
LD1A2: LDA    $83
       AND    #$0F
       TAY
       LDA    $86
       AND    #$02
       BEQ    LD1B0
LD1AD: JMP    LD291
LD1B0: LDA    $92
       AND    #$0F
       BNE    LD1C1
       LDA    $8F
       AND    #$0F
       BEQ    LD1AD
       DEC    $8F
       JMP    LD211
LD1C1: LDA    $8F
       AND    #$0F
       STA    $EE
       CMP    $C7
       BEQ    LD1AD
       JSR    LD342
       STA    $EF
       LDA    $92
       AND    #$01
       BEQ    LD202
       LDA    $C7
       CLC
       ADC    $EF
       CMP    $EE
       BCC    LD1E1
       LDA    $EE
LD1E1: STA    $C7
       LDA    $C8
       CMP    #$0B
       BEQ    LD1FF
       SEC
       SBC    $C7
LD1EC: BMI    LD1F2
       CMP    #$05
       BCS    LD1FF
LD1F2: LDA    $C8
       CLC
       ADC    $EF
       CMP    #$0A
       BCC    LD1FD
       LDA    #$0A
LD1FD: STA    $C8
LD1FF: JMP    LD211
LD202: LDA    $C7
       SEC
       SBC    $EF
       BMI    LD20D
       CMP    $EE
       BCS    LD20F
LD20D: LDA    $EE
LD20F: STA    $C7
LD211: DEC    $CA
       BNE    LD232
       LDA    LDAF1,Y
       BEQ    LD22D
       LDA    $86
       AND    #$02
       BNE    LD22D
       LDA    $86
       EOR    #$01
       STA    $86
       LDX    LDB28,Y
       AND    #$01
       BNE    LD230
LD22D: LDX    LDB1D,Y
LD230: STX    $CA
LD232: DEC    $C9
       BNE    LD290
       JSR    LDAC6
       AND    LDAE6,Y
       STA    $C9
       INC    $C9
       LDA    $B9
       AND    #$F0
       ORA    $C8
       STA    $B9
       LDA    $86
       AND    #$01
       BNE    LD253
       LDA    #$0B
       STA    $C8
       RTS

LD253: JSR    LD342
       AND    #$01
       LDX    $EC
LD25A: BPL    LD261
       EOR    #$FF
       CLC
       ADC    #$01
LD261: STA    $EF
       LDA    $86
       AND    #$02
       BEQ    LD26D
       LDA    #$01
       STA    $EF
LD26D: LDA    $C8
       CLC
       ADC    $EF
       CMP    #$0B
       BCC    LD278
       LDA    #$0A
LD278: STA    $C8
       SEC
       SBC    $C7
       BMI    LD283
       CMP    #$05
       BCS    LD290
LD283: LDA    $C7
       CLC
       ADC    #$05
       CMP    #$0A
       BCC    LD28E
       LDA    #$0A
LD28E: STA    $C8
LD290: RTS

LD291: JSR    LDAC6
       AND    #$0F
       TAX
       LDA    LDB58,X
       PHA
       LDA    $86
       AND    #$02
       BEQ    LD2A5
       PLA
       LDA    #$00
       PHA
LD2A5: LDA    $86
       AND    #$FB
       STA    $86
       PLA
       CMP    #$08
       BNE    LD2B7
       LDX    LDAF1,Y
LD2B3: BNE    LD2B7
       LDA    #$0A
LD2B7: STA    $EE
       LDA    $8F
       AND    #$F0
       ORA    $EE
       STA    $8F
       LDA    $C7
       CMP    $EE
       BEQ    LD2DC
       BCC    LD2CD
       LDA    #$02
       BNE    LD2CF
LD2CD: LDA    #$01
LD2CF: STA    $EF
       LDA    $92
       AND    #$F0
       ORA    $EF
       STA    $92
       JMP    LD1B0
LD2DC: JSR    LDAC6
       AND    #$0F
       STA    $EE
       BNE    LD2E7
       INC    $EE
LD2E7: LDA    $8F
       AND    #$F0
       ORA    $EE
       STA    $8F
       LDA    $92
       AND    #$F0
       STA    $92
       JMP    LD1B0
LD2F8: LDA    $86
       AND    #$02
       BNE    LD32C
       LDA    $86
       AND    #$FB
       STA    $86
       LDA    $C9
       BEQ    LD30B
       DEC    $C9
       RTS

LD30B: LDX    $CB
       LDA    LDB68,X
       AND    #$0F
       STA    $C9
       LDA    LDB68,X
       LSR
       LSR
       LSR
       LSR
       STA    $C7
       DEX
       BNE    LD329
       LDA    $BC
       AND    #$01
       BNE    LD337
       LDX    LDB68
LD329: STX    $CB
       RTS

LD32C: LDA    #$03
       STA    $C9
       LDA    $C7
       BEQ    LD336
       DEC    $C7
LD336: RTS

LD337: LDA    $86
       ORA    #$02
       STA    $86
       LDA    #$40
       STA    $CB
       RTS

LD342: JSR    LDAC6
       AND    LDB07,Y
       BNE    LD353
       LDA    $EC
       AND    LDB12,Y
       BEQ    LD353
       LDA    #$01
LD353: BPL    LD35A
       AND    #$7F
       CLC
       ADC    #$01
LD35A: RTS

LD35B: JSR    LD4F7
       CMP    #$01
       BEQ    LD363
       RTS

LD363: INC    $B6
       LDA    $86
       AND    #$02
       BEQ    LD3AB
       DEC    $CB
       BNE    LD39A
       LDA    $86
       AND    #$FC
       STA    $86
       LDA    #$0B
       STA    $C8
       INC    $83
       LDA    $83
       AND    #$0F
       CMP    #$0B
       BNE    LD397
       LDA    $83
       AND    #$F0
       STA    $83
       LDA    #$00
       STA    $D6
       STA    $DB
       STA    $A1
       LDA    $BC
       AND    #$FE
       STA    $BC
LD397: JSR    LDA85
LD39A: LDA    $CB
       CMP    #$15
       BNE    LD3AB
       JSR    LD16B
       LDA    #$7B
       STA    $DC
       LDA    #$92
       STA    $DD
LD3AB: LDX    #$03
       LDY    #$0A
LD3AF: CPY    $C8
       BCS    LD3BB
       CPY    $C7
       BCS    LD3BA
       SEC
       BCS    LD3BB
LD3BA: CLC
LD3BB: ROR    $82,X
       ROL    $81,X
       LDA    $80,X
       AND    #$0F
       STA    $EF
       ROR    $80,X
       LDA    $80,X
       ROR
       ROR
       ROR
       ROR
       LDA    $80,X
       AND    #$F0
       ORA    $EF
       STA    $80,X
       DEX
       DEX
       DEX
       TXA
       AND    #$01
       BEQ    LD3BB
       TXA
       CLC
       ADC    #$0C
       TAX
       DEY
       BPL    LD3AF
       LDA    $BC
       AND    #$01
       BNE    LD3F6
       LDX    #$04
LD3ED: LDA    $D7,X
       BEQ    LD3F3
       DEC    $D7,X
LD3F3: DEX
       BPL    LD3ED
LD3F6: RTS

LD3F7: JSR    LD4F7
       CMP    #$01
       BEQ    LD409
       CMP    #$02
       BEQ    LD409
       CMP    #$08
       BEQ    LD409
       JMP    LD4A8
LD409: LDX    $CC
       BMI    LD42F
       LDA    $86
       AND    #$02
       BEQ    LD432
       LDA    $CB
       CMP    #$15
       BCS    LD432
       CPX    #$18
       BEQ    LD425
       BCC    LD422
       DEX
       BNE    LD423
LD422: INX
LD423: STX    $CC
LD425: LDX    $CD
       CPX    #$4A
       BCS    LD42F
       INX
       INX
       STX    $CD
LD42F: JMP    LD491
LD432: LDA    $C3
       BNE    LD43F
       LDA    $CC
       BEQ    LD43C
       DEC    $CC
LD43C: JMP    LD4A8
LD43F: LDX    $CD
       LDA    SWCHA
       ROL
       BCS    LD45D
       CPX    #$4A
       BCS    LD45D
       INC    $CD
       INC    $CD
       TAY
       LDA    $89
       AND    #$F3
       ORA    #$08
       STA    $89
       TYA
       ROL
       JMP    LD47D
LD45D: ROL
       BCS    LD475
       CPX    #$0F
       BCC    LD475
       DEC    $CD
       DEC    $CD
       TAY
       LDA    $89
       AND    #$F3
       ORA    #$04
       STA    $89
       TYA
       JMP    LD47D
LD475: TAY
       LDA    $89
       AND    #$F3
       STA    $89
       TYA
LD47D: LDX    $CC
       ROL
       BCS    LD488
       CPX    #$02
       BCC    LD488
       DEC    $CC
LD488: ROL
       BCS    LD491
       CPX    #$2C
       BCS    LD491
       INC    $CC
LD491: LDA    $BC
       AND    #$01
       BEQ    LD4AE
       LDA    $CC
       SEC
       SBC    #$01
       STA    $D6
       LDA    $CD
       LSR
       LSR
       CLC
       ADC    #$01
       STA    $DB
       RTS

LD4A8: LDA    $BC
       AND    #$01
       BNE    LD4B8
LD4AE: LDA    INPT4
       BPL    LD4B9
       LDA    $BC
       AND    #$FD
       STA    $BC
LD4B8: RTS

LD4B9: LDA    $BC
       AND    #$02
       BNE    LD4B8
       LDA    $BC
       ORA    #$02
       STA    $BC
       LDA    $AA
       EOR    #$08
       STA    $AA
       AND    #$08
       BEQ    LD4E2
       LDX    $CC
       DEX
       STX    $CE
       LDA    $CD
       CLC
       ADC    #$05
       STA    $CF
       LDA    $E4
       ORA    #$10
       STA    $E4
       RTS

LD4E2: LDA    $CD
       CLC
       ADC    #$0C
       STA    $D1
       LDA    $CC
       SEC
       SBC    #$03
       STA    $D0
       LDA    $AD
       ORA    #$05
       STA    $AD
       RTS

LD4F7: LDA    $B3
       AND    #$0F
       TAX
       LDA    LD501,X
       AND    $C4
LD501: RTS

LD502: .byte $03,$07,$0F
LD505: LDA    $CE
       BMI    LD51E
       JSR    LD4F7
       CMP    #$01
       BEQ    LD51E
       INC    $CF
       INC    $CF
       LDA    $CF
       CMP    #$95
       BCC    LD51E
       LDA    #$FF
       STA    $CE
LD51E: LDA    $D0
       BMI    LD554
       LDA    $AD
       AND    #$0F
       BEQ    LD534
       LDA    $C4
       AND    #$03
       BNE    LD534
       INC    $D1
       INC    $D1
       DEC    $AD
LD534: LDA    $AD
       AND    #$0F
       CMP    #$04
       BCS    LD554
       LDA    $B3
       AND    #$01
       BEQ    LD54A
       LDA    $C4
       AND    #$01
       BEQ    LD54A
       DEC    $D0
LD54A: LDA    $B3
       AND    #$0F
       CMP    #$03
       BCS    LD554
       DEC    $D0
LD554: LDA    $C4
       AND    #$01
       BNE    LD566
       LDA    $89
       AND    #$02
       BNE    LD569
       LDA    $8C
       EOR    #$01
       STA    $8C
LD566: JMP    LD61E
LD569: LDA    $C4
       AND    #$03
       BNE    LD566
       LDA    $8C
       AND    #$0F
       INC    $8C
       CMP    #$04
       BNE    LD566
       JSR    $FC64
       LDA    #$4B
       STA    $C4
       LDA    $AA
       AND    #$01
       BEQ    LD5A6
       LDA    #$F0
       STA    $C4
       LDA    $E6
       STA    $CA
       LDA    $E7
       STA    $CB
       LDA    $E8
       STA    $CF
       LDA    #$16
       STA    $EA
       LDA    #$01
       STA    $E8
       LDA    #$23
       STA    $E7
       LDA    #$45
       STA    $E6
LD5A6: JSR    $FC2D
       LDA    SWCHB
       AND    #$01
       BEQ    LD61E
       LDA    SWCHB
       AND    #$02
       BEQ    LD61E
       LDA    $AA
       AND    #$01
       BEQ    LD5C7
       LDA    $C4
       CMP    #$E1
       BCS    LD5C7
       LDA    INPT4
       BPL    LD5F4
LD5C7: LDA    $BC
       EOR    #$04
       STA    $BC
       AND    #$04
       BNE    LD5A6
       DEC    $C4
       BNE    LD5A6
       LDA    $AA
       AND    #$01
       BEQ    LD61B
       LDA    $CA
       STA    $E6
       LDA    $CB
       STA    $E7
       LDA    $CF
       STA    $E8
       LDA    #$00
       STA    $EA
       STA    $CA
       STA    $CB
       STA    $CF
       JMP    LD61E
LD5F4: LDA    $AA
       AND    #$FE
       STA    $AA
       LDA    #$03
       STA    $80
       LDA    #$00
       STA    $E6
       STA    $E7
       STA    $E8
       STA    $EA
       STA    $CA
       STA    $CB
       STA    $CF
       LDA    #$B2
       STA    $C2
       JSR    $FC88
       JSR    LD163
       JMP    LD03E
LD61B: JSR    $FC88
LD61E: JMP    LD03E
LD621: LDA    $B6
       AND    #$04
       BNE    LD628
       RTS

LD628: LDA    $B6
       AND    #$F0
       STA    $B6
       LDA    $B0
       AND    #$0F
       BNE    LD650
       LDA    $B0
       ORA    #$03
       STA    $B0
       LDA    $C3
       BEQ    LD650
       DEC    $C3
       CMP    #$10
       BCS    LD650
       LDA    $E3
       AND    #$80
       BNE    LD650
       LDA    $E4
       ORA    #$80
       STA    $E4
LD650: DEC    $B0
       LDA    $83
       AND    #$0F
       CMP    #$0A
       BNE    LD65B
       RTS

LD65B: LDA    $86
       AND    #$06
       BNE    LD668
       LDA    #$10
       LDY    #$00
       JSR    $FCE2
LD668: DEC    $EB
       BNE    LD680
       LDA    $83
       AND    #$0F
       CMP    #$0A
       BCS    LD680
       LDA    $86
       ORA    #$02
       AND    #$FE
       STA    $86
       LDA    #$40
       STA    $CB
LD680: RTS

LD681: JSR    LD4F7
       AND    #$03
       CMP    #$03
       BEQ    LD68D
       JMP    LDA30
LD68D: LDX    #$04
       LDY    #$0C
       LDA    #$00
       STA    $EF
LD695: LDA    $D7,X
       CMP    #$05
       BCS    LD6BD
       LDA.wy $0095,Y
       AND    #$0F
       CMP    #$09
       BNE    LD6AA
       LDA    $BC
       AND    #$01
       BNE    LD6E1
LD6AA: LDA    #$00
       STA    $D7,X
       STA    $D2,X
       LDA.wy $0095,Y
       AND    #$F0
       STA.wy $0095,Y
       INC    $EF
       JMP    LD6E1
LD6BD: LDA.wy $0095,Y
       AND    #$0F
       CMP    #$0A
       BCC    LD6E1
       CMP    #$0C
       BEQ    LD6AA
       BCC    LD6D8
       CMP    #$0F
       BEQ    LD6AA
       LDA    $C4
       AND    #$0F
       CMP    #$07
       BNE    LD6E1
LD6D8: LDA.wy $0095,Y
       CLC
       ADC    #$01
       STA.wy $0095,Y
LD6E1: DEY
       DEY
       DEY
       DEX
       BPL    LD695
       LDA    $EF
       BNE    LD6EE
LD6EB: JMP    LD855
LD6EE: LDA    $BC
       AND    #$01
       BNE    LD6EB
       LDA    $86
       AND    #$06
       BNE    LD6EB
       TAX
       TAY
LD6FC: LDA    $D2,X
       BEQ    LD706
       INY
       INY
       INY
       INX
       BNE    LD6FC
LD706: STX    $F2
       STY    $F3
       LDA    $83
       AND    #$0F
       TAX
       LDA    LDB49,X
       TAX
       AND    #$01
       BEQ    LD720
       LDA    $86
       AND    #$01
       BEQ    LD728
       JMP    LD7DA
LD720: TXA
       AND    #$02
       BEQ    LD728
       JMP    LD82B
LD728: LDX    $C5
       LDA    $A7
       AND    #$0F
       STA    $EF
       LDA    #$00
       CLC
LD733: ADC    $EF
       DEX
       BNE    LD733
       PHA
       LDA    $83
       AND    #$0F
       TAX
       PLA
       CLC
       ADC    LDAFC,X
       STA    $EF
       SEC
       SBC    #$08
       BPL    LD74C
       LDA    #$00
LD74C: STA    $F0
       LDX    #$04
       LDY    #$0C
LD752: LDA    $D2,X
       BEQ    LD77D
       LDA    $D2,X
       SEC
       SBC    #$07
       BPL    LD75F
       LDA    #$00
LD75F: STA    $F1
       LDA    $D2,X
       CMP    $F0
       BCC    LD770
       LDA    $EF
       CMP    $F1
       BCC    LD77D
LD76D: JMP    LD855
LD770: LDA.wy $0095,Y
       AND    #$0F
       CMP    #$02
       BEQ    LD76D
       CMP    #$05
       BEQ    LD76D
LD77D: DEY
       DEY
       DEY
       DEX
       BPL    LD752
       LDA    $83
       AND    #$0F
       CMP    #$0A
       BNE    LD79A
       LDA    $A7
       AND    #$0F
       CMP    #$03
       BEQ    LD797
       CMP    #$05
       BNE    LD79A
LD797: JMP    LD855
LD79A: LDX    #$01
       LDA    $A4
       AND    #$0F
       STA    $F1
       LDA    $A7
       AND    #$0F
       CMP    $F1
       BNE    LD7C4
       LDX    #$03
       CMP    #$06
       BCC    LD7B2
       LDX    #$04
LD7B2: LDA    $83
       AND    #$0F
       CMP    #$0A
       BNE    LD7C4
       LDA    $F1
       LDX    #$04
       CMP    #$04
       BNE    LD7C4
       LDX    #$09
LD7C4: TXA
       LDY    $F3
       ORA.wy $0095,Y
       STA.wy $0095,Y
       LDX    $F2
       LDA    $EF
       STA    $D2,X
       LDA    #$27
       STA    $D7,X
       JMP    LD963
LD7DA: LDA    $B9
       AND    #$0F
       CMP    #$08
       BCC    LD813
       CMP    #$0B
       BCS    LD813
       ADC    #$01
       ASL
       ASL
       STA    $EF
       LDX    #$04
       LDY    #$0C
LD7F0: LDA.wy $0095,Y
       AND    #$0F
       BEQ    LD808
       CMP    #$02
       BEQ    LD813
       CMP    #$05
       BEQ    LD813
       LDA    $D2,X
       CLC
       ADC    #$07
       CMP    $EF
       BCS    LD813
LD808: DEY
       DEY
       DEY
       DEX
       BPL    LD7F0
       LDX    #$06
       JMP    LD7C4
LD813: LDA    $A4
       AND    #$0F
       STA    $EF
       LDA    $A7
       AND    #$0F
       CMP    $EF
       BNE    LD828
       CMP    #$06
       BCS    LD828
       JMP    LD728
LD828: JMP    LD855
LD82B: LDX    #$04
       LDY    #$0C
LD82F: LDA.wy $0095,Y
       AND    #$0F
       BEQ    LD840
       CMP    #$08
       BEQ    LD813
       LDA    $D2,X
       CMP    #$14
       BCS    LD813
LD840: DEY
       DEY
       DEY
       DEX
       BPL    LD82F
       LDA    $AA
       ORA    #$02
       STA    $AA
       LDA    #$1E
       STA    $EF
       LDX    #$08
       JMP    LD7C4
LD855: LDA    $83
       AND    #$0F
       TAX
       LDA    LDB49,X
       AND    #$04
       BEQ    LD883
       LDX    #$04
       LDY    #$0C
LD865: LDA.wy $0095,Y
       AND    #$0F
       CMP    #$06
       BEQ    LD886
       CMP    #$02
       BEQ    LD8DB
       CMP    #$01
       BNE    LD883
       LDA    $CC
       SEC
       SBC    $D2,X
       BPL    LD899
       LDA    $D7,X
       CMP    #$14
       BCC    LD8CB
LD883: JMP    LD8E4
LD886: LDA    $D7,X
       ASL
       ASL
       SEC
       SBC    $CD
       BCC    LD893
       CMP    #$0F
       BCS    LD883
LD893: TYA
       TAX
       INC    $95,X
       BNE    LD883
LD899: STA    $EF
       LDA    $CD
       LSR
       LSR
       SEC
       SBC    $D7,X
       BPL    LD8CB
       EOR    #$FF
       CLC
       ADC    #$01
       STA    $F0
       LDA    $B3
       AND    #$0F
       CMP    #$01
       BEQ    LD8BB
       ASL    $F0
       CMP    #$02
       BEQ    LD8BB
       ASL    $F0
LD8BB: LDA    $EF
       SEC
       SBC    $F0
       BPL    LD8C7
       EOR    #$FF
       CLC
       ADC    #$01
LD8C7: CMP    #$0A
       BCS    LD8E4
LD8CB: LDA.wy $0095,Y
       AND    #$F0
       ORA    #$02
       STA.wy $0095,Y
       LDA    $E5
       ORA    #$20
       STA    $E5
LD8DB: DEY
       DEY
       DEY
       DEX
       BMI    LD8E4
       JMP    LD865
LD8E4: LDA    $83
       AND    #$0F
       TAX
       LDA    LDB49,X
       AND    #$08
       BEQ    LD920
       LDX    #$04
       LDY    #$0C
LD8F4: LDA.wy $0095,Y
       AND    #$0F
       CMP    #$05
       BEQ    LD945
       DEY
       DEY
       DEY
       DEX
LD901: BPL    LD8F4
       LDA    $A1
       AND    #$0F
       CMP    #$04
       BNE    LD920
       LDA    $D6
       CMP    #$26
       BCS    LD920
       LDA    $DB
       CMP    #$09
       BCC    LD920
       LDX    #$04
LD919: LDA    $D2,X
       BEQ    LD923
       DEX
       BPL    LD919
LD920: JMP    LD963
LD923: TXA
       STA    $EF
       ASL
       ADC    $EF
       TAY
       LDA.wy $0095,Y
       ORA    #$05
       STA.wy $0095,Y
       LDA    $D6
       CLC
       ADC    #$03
       STA    $D2,X
       LDA    $DB
       STA    $D7,X
       DEC    $D7,X
       LDA    $E4
       ORA    #$08
       STA    $E4
LD945: INC    $D2,X
       DEC    $D7,X
       LDA    $D2,X
       CMP    #$2C
       BCS    LD955
       LDA    $D7,X
       CMP    #$05
       BCS    LD963
LD955: LDA.wy $0095,Y
       AND    #$F0
       STA.wy $0095,Y
       LDA    #$00
       STA    $D2,X
       STA    $D7,X
LD963: LDX    #$04
       LDY    #$0C
LD967: LDA.wy $0095,Y
       AND    #$0F
       CMP    #$02
       BNE    LD97E
       LDA    $D2,X
       CMP    #$2C
       BCS    LD97B
       INC    $D2,X
       JMP    LDA27
LD97B: JMP    LDA17
LD97E: CMP    #$07
       BNE    LD9B6
       DEC    $D2,X
       LDA    $D2,X
       SEC
       SBC    #$07
       BMI    LD97B
       STA    $EF
       STX    $F2
       STY    $F3
       LDX    #$04
       LDY    #$0C
LD995: LDA.wy $0095,Y
       AND    #$0F
       BEQ    LD9AA
       CMP    #$06
       BEQ    LD9AA
       CMP    #$07
       BEQ    LD9AA
       LDA    $D2,X
       CMP    $EF
       BCS    LDA13
LD9AA: DEY
       DEY
       DEY
       DEX
       BPL    LD995
       LDX    $F2
       LDY    $F3
       BPL    LDA27
LD9B6: CMP    #$08
       BNE    LDA27
       LDA    $AA
       AND    #$02
       BNE    LD9C4
       DEC    $D2,X
       BNE    LD9C6
LD9C4: INC    $D2,X
LD9C6: LDA    $D2,X
       CMP    #$2B
       BCS    LDA0A
       LDA    $D1,X
       CLC
       ADC    #$09
       CMP    $D2,X
       BCS    LDA02
       CMP    $CC
       BCS    LDA27
       LDA    $CC
       SEC
       SBC    $D2,X
       BPL    LD9E2
       EOR    #$FF
LD9E2: STA    $EF
       LDA    $CC
       CMP    #$27
       BCS    LD9F6
       LDA    $83
       AND    #$0F
       CMP    #$05
       BCS    LD9F6
       LDA    #$0F
       BNE    LD9F8
LD9F6: LDA    #$08
LD9F8: CMP    $EF
       BCS    LDA27
       LDA    $CC
       CMP    $D2,X
       BCC    LDA0A
LDA02: LDA    $AA
       ORA    #$02
       STA    $AA
       BNE    LDA27
LDA0A: LDA    $AA
       AND    #$FD
       STA    $AA
       JMP    LDA27
LDA13: LDX    $F2
       LDY    $F3
LDA17: LDA.wy $0095,Y
       AND    #$F0
       ORA    #$0A
       STA.wy $0095,Y
       LDA    $E4
       ORA    #$40
       STA    $E4
LDA27: DEY
       DEY
       DEY
       DEX
       BMI    LDA30
       JMP    LD967
LDA30: LDA    #$00
       STA    $F0
       LDX    #$04
       LDY    #$0C
LDA38: LDA    $D2,X
       CMP    $D1,X
       BCS    LDA7A
       LDA    $D1,X
       STA    $EF
       LDA    $D2,X
       STA    $D1,X
       LDA    $EF
       STA    $D2,X
       LDA    $D6,X
       STA    $EF
       LDA    $D7,X
       STA    $D6,X
       LDA    $EF
       STA    $D7,X
       LDA.wy $0092,Y
       AND    #$0F
       STA    $EF
       LDA.wy $0095,Y
       AND    #$0F
       STA    $F0
       LDA.wy $0092,Y
       AND    #$F0
       ORA    $F0
       STA.wy $0092,Y
       LDA.wy $0095,Y
       AND    #$F0
       ORA    $EF
       STA.wy $0095,Y
       INC    $F0
LDA7A: DEY
       DEY
       DEY
       DEX
       BNE    LDA38
       LDA    $F0
       BNE    LDA30
       RTS

LDA85: LDA    $83
       AND    #$0F
       TAX
       LDA    $86
       ORA    #$04
       STA    $86
       LDA    LDB1D,X
       STA    $CA
       LDA    #$01
       STA    $C9
       LDA    #$FF
       STA    $CE
       LDA    LDADB,X
       STA    $C5
       TAX
       LDA    LDB53,X
       STA    $C6
       LDA    $83
       AND    #$0F
       ASL
       TAX
       LDA    LDB33,X
       STA    $EC
       LDA    LDB34,X
       STA    $ED
       LDA    $83
       AND    #$0F
       CMP    #$0A
       BNE    LDAC5
       LDA    LDB68
       STA    $CB
LDAC5: RTS

LDAC6: LDA    $EC
       ROL    $EC
       EOR    $EC
       ROR    $EC
       INC    $ED
       ADC    $ED
       BVC    LDAD8
       INC    $ED
       ADC    $ED
LDAD8: STA    $EC
       RTS

LDADB: .byte $04,$04,$02,$04,$03,$04,$04,$02,$04,$03,$04
LDAE6: .byte $00,$01,$03,$01,$01,$00,$01,$03,$01,$03,$01
LDAF1: .byte $01,$01,$00,$01,$00,$01,$01,$00,$01,$00,$01
LDAFC: .byte $08,$08,$03,$08,$03,$08,$08,$03,$08,$03,$08
LDB07: .byte $01,$81,$01,$02,$83,$81,$01,$03,$03,$03,$81
LDB12: .byte $11,$11,$01,$11,$11,$11,$11,$11,$11,$11,$11
LDB1D: .byte $82,$37,$00,$4B,$00,$6E,$46,$00,$28,$00,$05
LDB28: .byte $BE,$96,$00,$6E,$00,$FF,$32,$00,$46,$00,$FF
LDB33: .byte $85
LDB34: .byte $00,$7F,$00,$3F,$00,$59,$00,$BF,$00,$FE,$00,$57,$00,$59,$02,$F7
       .byte $01,$DA,$03,$FF,$02
LDB49: .byte $00,$04,$0A,$0C,$0C,$09,$0D,$02,$0D,$0C
LDB53: .byte $0C,$26,$1B,$10,$00
LDB58: .byte $00,$05,$06,$08,$02,$01,$04,$06,$07,$08,$03,$04,$01,$00,$05,$07
LDB68: .byte $36,$0F,$0F,$21,$70,$60,$80,$60,$40,$30,$20,$30,$40,$20,$30,$71
       .byte $81,$61,$51,$60,$81,$1F,$2F,$30,$96,$76,$48,$8F,$64,$74,$91,$53
       .byte $40,$50,$32,$23,$40,$50,$62,$81,$70,$61,$90,$70,$51,$82,$92,$60
       .byte $70,$40,$30,$40,$1F,$20,$1F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LDC00: LDA    #$17
       STA    TIM64T
       LDA    $C4
       AND    #$03
       BNE    LDC5F
       LDA    $89
       AND    #$02
       BNE    LDC5F
       LDA    CXP0FB
       AND    #$C0
       BNE    LDC34
       LDA    CXPPMM
       AND    #$80
       BEQ    LDC5F
       LDA    $CC
       STA    $FB
       JSR    $F1EC
       LDA.wy $0095,Y
       AND    #$0F
       CMP    #$0C
       BCS    LDC5F
LDC2D: CMP    #$09
       BEQ    LDC56
       JSR    $F25A
LDC34: LDA    $8C
       AND    #$F0
       ORA    #$02
       STA    $8C
       LDA    $89
       ORA    #$02
       STA    $89
       LDA    $BC
       AND    #$F7
       STA    $BC
       LDA    #$00
       STA    $E2
       STA    $E3
       STA    $E5
       LDA    #$40
       STA    $E4
       BNE    LDC5F
LDC56: LDA    $BC
       AND    #$01
       BNE    LDC5F
       JMP    $F27C
LDC5F: LDA    CXM0P
       AND    #$80
       BEQ    LDC91
       LDA    $CE
       STA    $FB
       JSR    $F1EC
       LDA.wy $0095,Y
       AND    #$0F
       CMP    #$03
       BNE    LDC88
       LDA    $83
       AND    #$0F
       TAX
       LDA    $C3
       CLC
       ADC    $F901,X
       CMP    #$2B
       BCC    LDC86
       LDA    #$2A
LDC86: STA    $C3
LDC88: JSR    $F25A
       LDA    #$FF
       STA    $CE
       BNE    LDCA1
LDC91: LDA    CXM0FB
       AND    #$80
       BEQ    LDCA1
       LDA    #$FF
       STA    $CE
       LDA    $E4
       ORA    #$10
       STA    $E4
LDCA1: LDA    CXP1FB
       AND    #$40
       BEQ    LDCCF
       LDA    $D0
       STA    $FB
       JSR    $F1EC
       LDA.wy $0095,Y
       AND    #$0F
       CMP    #$03
       BNE    LDCCA
       LDA    $83
       AND    #$0F
       TAX
       LDA    $C3
       CLC
       ADC    $F901,X
       CMP    #$2B
       BCC    LDCC8
       LDA    #$2A
LDCC8: STA    $C3
LDCCA: JSR    $F25A
       BNE    LDCD5
LDCCF: LDA    CXBLPF
       AND    #$80
       BEQ    LDCDF
LDCD5: LDA    #$FF
       STA    $D0
       LDA    $E4
       ORA    #$10
       STA    $E4
LDCDF: LDA    $BC
       AND    #$08
       BEQ    LDCE8
       JMP    $F2B3
LDCE8: LDX    #$00
       JSR    $F17B
       LDA    $E2,X
       BEQ    LDD0B
       LDY    $E0
       LDA    $FD00,Y
       STA    $F4
       LDA    $FD01,Y
       STA    $F5
       LDA    $E4,X
       BEQ    LDD08
LDD01: JSR    $F19D
       LDA    #$00
       STA    $E4,X
LDD08: JSR    $F1B9
LDD0B: INX
       JSR    $F17B
       LDA    $E2,X
LDD11: BEQ    LDD30
       LDY    $E1
       LDA    $FD10,Y
       STA    $F4
       LDA    $FD11,Y
       STA    $F5
       LDA    $E4,X
       BEQ    LDD2A
       JSR    $F19D
       LDA    #$00
       STA    $E4,X
LDD2A: JSR    $F1B9
       JMP    $F156
LDD30: LDA    $86
       AND    #$08
       STA    AUDV1
       LDA    #$0E
       STA    AUDC1
       LDA    $89
       AND    #$04
       BEQ    LDD46
       LDA    #$1F
       STA    AUDF1
       BNE    LDD56
LDD46: LDA    $89
       AND    #$08
       BEQ    LDD52
       LDA    #$10
       STA    AUDF1
       BNE    LDD56
LDD52: LDA    #$16
       STA    AUDF1
LDD56: LDA    INTIM
       BNE    LDD56
       STA    WSYNC
       LDA    #$02
       STA    VBLANK
       STA    VSYNC
       LDA    #$2C
       STA    TIM8T
LDD68: LDA    INTIM
       BNE    LDD68
       LDA    #$00
       STA    WSYNC
       STA    VSYNC
       LDA    #$2C
       STA    TIM64T
       JMP    $FC39

LDD7B:
       LDY    #$07
       LDA    #$80
       STA    $EF
LDD81: LDA    $EF
       AND    $E4,X
       BNE    LDD8D
       LSR    $EF
       DEY
       BPL    LDD81
       RTS

LDD8D: CMP    $E2,X
       BCC    LDD98
       STA    $E2,X
       TYA
       ASL
       STA    $E0,X
       RTS

LDD98: LDA    #$00
       STA    $E4,X
       RTS

LDD9D:
       LDY    #$00
       LDA    ($F4),Y
       TAY
       LDA    ($F4),Y
       STA    $DC,X
       DEY
       LDA    ($F4),Y
       STA    AUDF0,X
       DEY
       LDA    ($F4),Y
       STA    AUDV0,X
       DEY
       LDA    ($F4),Y
       STA    AUDC0,X
       DEY
       STY    $DE,X
       RTS

LDDB9:
       LDY    $DE,X
       BNE    LDDC8
       LDA    #$00
       STA    AUDV0,X
       STA    $E2,X
       LDA    #$FF
       STA    $E0,X
       RTS

LDDC8: LDA    $DC,X
       AND    #$01
       BEQ    LDDD3
       LDA    ($F4),Y
       STA    AUDF0,X
       DEY
LDDD3: LDA    $DC,X
       AND    #$02
       BEQ    LDDDE
       LDA    ($F4),Y
       STA    AUDV0,X
       DEY
LDDDE: LDA    $DC,X
       AND    #$04
       BEQ    LDDE9
       LDA    ($F4),Y
       STA    AUDC0,X
       DEY
LDDE9: STY    $DE,X
       RTS

LDDEC:
       LDA    #$FF
       STA    $FA
       LDX    #$04
LDDF2: LDA    $D2,X
       BEQ    LDE08
       SEC
       SBC    $FB
       BPL    LDE00
       EOR    #$FF
       CLC
       ADC    #$01
LDE00: CMP    $FA
       BCS    LDE08
       STA    $FA
       TXA
       TAY
LDE08: DEX
       BPL    LDDF2
       TYA
       STA    $FB
       TAX
       ASL
       ADC    $FB
       TAY
       STY    $EE
       LDA.wy $0095,Y
       AND    #$0F
       CMP    #$01
       BEQ    LDE36
       CMP    #$02
       BEQ    LDE36
       CMP    #$04
       BEQ    LDE40
       CMP    #$06
       BEQ    LDE36
       CMP    #$07
       BEQ    LDE40
       CMP    #$09
       BEQ    LDE4A
       CMP    #$08
       BNE    LDE57
LDE36: LDA    #$50
       LDY    #$00
       JSR    $FCE2
       JMP    $F257
LDE40: LDA    #$00
       LDY    #$01
       JSR    $FCE2
       JMP    $F257
LDE4A: LDA    $BC
       AND    #$01
       BNE    LDE57
       LDA    #$00
       LDY    #$50
       JSR    $FCE2
LDE57: LDY    $EE
       RTS

LDE5A:
       LDA.wy $0095,Y
       AND    #$0F
       CMP    #$04
       BEQ    LDE67
       LDA    #$0A
       BNE    LDE69
LDE67: LDA    #$0D
LDE69: STA    $FB
       LDA.wy $0095,Y
       AND    #$F0
       ORA    $FB
       STA.wy $0095,Y
       LDA    $E4
       ORA    #$40
       STA    $E4
       RTS

LDE7C:
       LDX    #$04
       LDY    #$0C
LDE80: LDA    #$00
       STA    $D2,X
       STA    $D7,X
       LDA.wy $0095,Y
       AND    #$F0
       STA.wy $0095,Y
       DEY
       DEY
       DEY
       DEX
       BPL    LDE80
       LDA    $CC
       SEC
       SBC    #$01
       STA    $D6
       LDA    $CD
       LSR
       LSR
       CLC
       ADC    #$01
       STA    $DB
       LDA    $A1
       ORA    #$09
       STA    $A1
       LDA    $BC
       ORA    #$01
       STA    $BC
       JMP    $F0DF

LDEB3:
       LDX    #$01
LDEB5: LDY    $DC,X
       BEQ    LDF03
       LDA    $E0,X
       BEQ    LDEC3
       DEC    $E0,X
       LDA    $E0,X
       STA    AUDV0,X
LDEC3: DEC    $DE,X
       BNE    LDF03
LDEC7: LDA    $F31F,Y
       BEQ    LDEFD
       INY
       STY    $DC,X
       CMP    #$20
       BCC    LDEE5
       STA    AUDF0,X
       AND    #$E0
       LSR
       LSR
       LSR
       STA    $DE,X
       LDA    $E2,X
       STA    $E0,X
       STA    AUDV0,X
       JMP    $F303
LDEE5: LDA    $F31F,Y
       STA    $E0,X
       LSR
       LSR
       LSR
       LSR
       STA    AUDC0,X
       LDA    $E0,X
       AND    #$0F
       STA    $E0,X
       STA    $E2,X
       STA    AUDV0,X
       INY
       BNE    LDEC7
LDEFD: LDA    #$00
       STA    AUDV0,X
       STA    $DC,X
LDF03: DEX
       BPL    LDEB5
       LDA    $DC
       ORA    $DD
       BNE    LDF1C
       LDA    $BC
       AND    #$F7
       STA    $BC
       LDA    #$00
       STA    $E4
       STA    $E5
       STA    $E2
       STA    $E3
LDF1C: JMP    $F156

LDF1F: .byte $00,$01,$48,$57,$56,$57,$53,$57,$56,$57,$53,$57,$56,$57,$53,$57
       .byte $56,$57,$53,$4B,$4A,$4B,$49,$4B,$4A,$4B,$49,$4B,$4A,$4B,$49,$4B
       .byte $4A,$4B,$49,$CB,$2B,$2B,$CB,$2B,$2B,$4B,$4E,$4B,$49,$4B,$4E,$4B
       .byte $4E,$4B,$49,$4B,$4E,$4B,$4E,$4B,$49,$4B,$4E,$89,$00,$01,$18,$4D
       .byte $4C,$4D,$4B,$4D,$4C,$4D,$4B,$4D,$4C,$4D,$4B,$4D,$4C,$4D,$4B,$01
       .byte $48,$5A,$58,$5A,$56,$5A,$58,$5A,$56,$5A,$58,$5A,$56,$5A,$58,$5A
       .byte $56,$CE,$2E,$2E,$CE,$2E,$2E,$4E,$53,$4E,$4B,$4E,$53,$4E,$53,$4E
       .byte $4B,$4E,$53,$4E,$53,$4E,$4B,$4E,$53,$8B,$00,$01,$48,$9D,$97,$93
       .byte $53,$53,$51,$4F,$4E,$4C,$8B,$8E,$8A,$4A,$4A,$8B,$49,$4A,$8B,$8C
       .byte $8E,$00,$01,$17,$91,$8D,$8B,$4B,$4B,$01,$C7,$59,$57,$55,$53,$91
       .byte $95,$99,$59,$59,$9D,$5F,$59,$9D,$01,$17,$8B,$8F,$00,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF

; Second bank

       ORG $2000
       RORG $F000

LF000: LDA    INTIM
       BNE    LF000
       STA    WSYNC
       STA    VBLANK
       LDA    $C2
       STA    COLUPF
       STA    COLUBK
       LDX    #$18
       STX    COLUP0
       STX    COLUP1
       NOP
       NOP
       LDX    #$00
       STX    HMP0
       LDA    #$10
       STA    HMP1
       LDA    #$06
       STA    RESP0
       STA    RESP1
       STA    $FB
       LDY    #$0A
LF029: LDA    $E6,X
       AND    #$0F
       STA.wy $00EE,Y
       DEY
       DEY
       LDA    $E6,X
       LSR
       LSR
       LSR
       LSR
       STA.wy $00EE,Y
       INX
       DEY
       DEY
       BPL    LF029
       STA    WSYNC
       LDY    #$00
       LDA    #$0A
       STA    $FA
LF048: LDA.wy $00EE,Y
       CLC
       ADC    $EA
       BNE    LF059
       CPY    #$0A
       BEQ    LF059
       LDA    $FA
       JMP    LF05D
LF059: LDX    #$00
       STX    $FA
LF05D: TAX
       LDA    $F800,X
       STA.wy $00EE,Y
       LDA    #$F8
       STA.wy $00EF,Y
       INY
       INY
       CPY    #$0C
       BNE    LF048
       STA    WSYNC
       STA    HMOVE
       LDA    #$03
       STA    NUSIZ0
       STA    NUSIZ1
       STA    VDELP0
       STA    VDELP1
       LDA    #$00
       STA    GRP0
       STA    GRP1
       LDY    #$05
LF085: DEY
       BNE    LF085
LF088: LDY    $FB
       LDA    ($EE),Y
       STA    GRP0
       STA    WSYNC
       LDA    ($F0),Y
       STA    GRP1
       LDA    ($F2),Y
       STA    GRP0
       LDA    ($F4),Y
       STA    $FA
       LDA    ($F6),Y
       TAX
       LDA    ($F8),Y
       TAY
       LDA    $FA
       STA    GRP1
       STX    GRP0
       STY    GRP1
       STY    GRP0
       DEC    $FB
       BPL    LF088
       JSR    LFC43
       LDA    $CF
       JSR    LF768
       STA    WSYNC
       LDA    #$DB
       STA    PF1
       LDA    #$B6
       STA    PF2
       STX    HMM0
       CPY    #$00
       BEQ    LF0CC
       NOP
LF0C9: DEY
       BNE    LF0C9
LF0CC: STA    RESM0
       LDA    $D1
       JSR    LF768
       STA    WSYNC
       LDA    #$01
       STA    CTRLPF
       LDA    VSYNC
       NOP
       STX    HMBL
       CPY    #$00
       BEQ    LF0E6
       NOP
LF0E3: DEY
       BNE    LF0E3
LF0E6: STA    RESBL
       STA    WSYNC
       STA    WSYNC
       LDA    $83
       AND    #$0F
       STA    $FA
       ASL
       ADC    $FA
       STA    $FA
       LDA    #$33
       SEC
       SBC    $FA
       STA    $EF
       LDA    #$F1
       SBC    #$00
       STA    WSYNC
       STA    $F0
       LDY    #$07
       NOP
       NOP
       NOP
       NOP
       LDA    #$16
       STA    COLUPF
       LDX    #$10
LF112: JMP.ind ($00EF)

LF115:
       LDA    $0300
       LDA    $0300
       LDA    $0300
       LDA    $0300
       LDA    $0300
       LDA    $0300
       LDA    $0300
       LDA    $0300
       LDA    $0300
       LDA    $0300
       LDA    $0300
       STX    COLUPF
       STA    WSYNC
       DEY
       BNE    $F108
       JSR    LFC43
       LDA    $CD
       JSR    LF768
       STA    WSYNC
       LDA    #$20
       JSR    LF784
       STA    WSYNC
       STA    HMOVE
       LDA    #$04
       STA    $F5
       STA    WSYNC
       STA    HMCLR
       LDA    #$10
       STA    CTRLPF
       TSX
       STX    $F1
       LDA    #$7F
       STA    $F2
       LDA    #$0C
       STA    COLUP0
       STA    WSYNC
       STA    CXCLR
       LDX    #$00
       LDA    $AA
       AND    #$01
       BEQ    LF179
       LDA    $C2
       CLC
       ADC    #$10
       TAX
LF179: LDA    $89
       AND    #$02
       BEQ    LF187
       LDA    $C4
       AND    #$03
       BNE    LF187
       LDX    #$0A
LF187: STX    COLUBK
       LDA    $83
       AND    #$0F
       TAX
       LDA    $F8E0,X
       STA    COLUPF
       LDA    #$0B
       STA    $EE
       LDA    #$30
       STA    $F3
       LDA    $8C
       AND    #$0F
       ASL
       ASL
       ASL
       TAY
       LDA    #$B0
       STA    TIM64T
       STA    WSYNC
       LDA    $C6
       STA    $F4
       BNE    LF1B7
       LDA    $C5
       STA    $F4
       JMP    LF3C0
LF1B7: LDA    $F95C,Y
       STA    COLUP0
       LDA    $F984,Y
       STA    GRP0
       BEQ    $F1C4
       INY
LF1C4: STA    WSYNC
       DEC    $F3
       DEC    $F4
       BNE    $F1CF
       JMP    $F390
LF1CF: LDA    $F3
       CMP    $CC
       BNE    $F1D6
       INY
LF1D6: NOP
       NOP
       NOP
       LDA    $F95C,Y
       STA    COLUP0
       LDA    $F984,Y
       STA    GRP0
       BEQ    LF1E6
       INY
LF1E6: STA    WSYNC
       LDA    $F3
       CMP    $CE
       BNE    LF1F2
       LDA    #$02
       STA    ENAM0
LF1F2: LDX    #$08
LF1F4: DEX
       BNE    LF1F4
       LDA    $F984,Y
       STA    GRP0
       BEQ    LF1FF
       INY
LF1FF: STA    WSYNC
       STX    ENAM0
       LDX    $F5
       LDA    $D7,X
       TAX
       LDA    $F90C,X
       STA    $FA
       LDA    $F934,X
       STA    HMP1
       LDA    $F5
       ASL
       CLC
       ADC    $F5
       TAX
       LDA    $95,X
       AND    #$0F
       TAX
       LDA    $F8F1,X
       STA    $FB
       LDA    $F9AC,X
       STA    COLUP1
       LDA    $F95C,Y
       STA    COLUP0
       LDA    $F984,Y
       STA    GRP0
       BEQ    LF235
       INY
LF235: DEC    $F3
       DEC    $F4
       BNE    LF23E
       JMP    LF39C
LF23E: NOP
       NOP
       NOP
       NOP
       NOP
       NOP
       NOP
       LDA    $F3
       CMP    $CC
       BNE    LF24C
       INY
LF24C: LDA    $F984,Y
       STA    GRP0
       BEQ    LF254
       INY
LF254: STA    WSYNC
       LDA    $F3
       CMP    $CE
       BNE    LF260
       LDA    #$02
       STA    ENAM0
LF260: LDX    #$08
LF262: DEX
       BNE    LF262
       LDA    $F984,Y
       STA    GRP0
       BEQ    LF26D
       INY
LF26D: STA    WSYNC
       STX    ENAM0
       NOP
       NOP
       NOP
       NOP
       LDX    $FA
LF277: DEX
       BNE    LF277
       STA    RESP1
       STA    WSYNC
       LDA    $F95C,Y
       STA    COLUP0
       LDA    $F984,Y
       STA    GRP0
       BEQ    LF28B
       INY
LF28B: DEC    $F3
       DEC    $F4
       BNE    LF294
       JMP    LF3A8
LF294: NOP
       NOP
       NOP
       NOP
       NOP
       NOP
       NOP
       LDA    $F3
       CMP    $CC
       BNE    LF2A2
       INY
LF2A2: LDA    $F984,Y
       STA    GRP0
       BEQ    LF2AA
       INY
LF2AA: STA    WSYNC
       LDA    $F3
       CMP    $CE
       BNE    LF2B6
       LDA    #$02
       STA    ENAM0
LF2B6: LDX    #$08
LF2B8: DEX
       BNE    LF2B8
       LDA    $F984,Y
       STA    GRP0
       BEQ    LF2C3
       INY
LF2C3: STA    WSYNC
       STA    HMOVE
       STX    ENAM0
       LDX    $F5
       BEQ    LF2CF
       DEC    $F5
LF2CF: LDA    $D2,X
       STA    $FA
       LDX    $FB
       LDA    $FA
       CMP    $F3
       BNE    LF2DC
       INX
LF2DC: NOP
       NOP
       NOP
       NOP
       NOP
       NOP
       NOP
       LDA    $F95C,Y
       STA    COLUP0
       LDA    $F984,Y
       STA    GRP0
       BEQ    LF2F0
       INY
LF2F0: STA    WSYNC
       LDA    $F9BC,X
       STA    GRP1
       BEQ    LF2FA
       INX
LF2FA: DEC    $F3
       DEC    $F4
       BNE    LF303
       JMP    LF3B4
LF303: NOP
       NOP
       NOP
       NOP
       NOP
       LDA    $F3
       CMP    $CC
       BNE    LF30F
       INY
LF30F: LDA    $F984,Y
       STA    GRP0
       BEQ    LF317
       INY
LF317: STA    WSYNC
       LDA    $F3
       CMP    $CE
       BNE    LF323
       LDA    #$02
       STA    ENAM0
LF323: PLA
       PHA
       PLA
       PHA
       PLA
       PHA
       PLA
       PHA
       PLA
       PHA
       LDA    $F984,Y
       STA    GRP0
       BEQ    LF335
       INY
LF335: LDA    #$00
       STA    WSYNC
       STA    ENAM0
       LDA    $F9BC,X
       STA    GRP1
       BEQ    LF346
       INX
       JMP    LF357
LF346: LDA    $F9BD,X
       CMP    #$80
       BEQ    LF38D
       LDA    $FA
       CMP    $F3
       BNE    LF35D
       INX
       JMP    LF35F
LF357: NOP
       NOP
       NOP
       NOP
       NOP
       NOP
LF35D: NOP
       NOP
LF35F: CLC
       LDA    $F3
       ADC    #$02
       CMP    $CC
       BCS    LF37C
       LDA    $D0
       CMP    $F3
       BNE    LF375
       LDA    #$02
       STA    ENABL
       JMP    LF2F0
LF375: LDA    #$00
       STA    ENABL
       JMP    LF2F0
LF37C: NOP
       LDA    $F95C,Y
       STA    COLUP0
       LDA    $F984,Y
       STA    GRP0
       BEQ    LF38A
       INY
LF38A: JMP    LF2F0
LF38D: JMP    LF1B7
LF390: TXA
       LDX    $F2
       TXS
       TAX
       LDA    $C5
       STA    $F4
       JMP    LF3F0
LF39C: TXA
       LDX    $F2
       TXS
       TAX
       LDA    $C5
       STA    $F4
       JMP    LF48C
LF3A8: TXA
       LDX    $F2
       TXS
       TAX
       LDA    $C5
       STA    $F4
       JMP    LF503
LF3B4: TXA
       LDX    $F2
       TXS
       TAX
       LDA    $C5
       STA    $F4
       JMP    LF597
LF3C0: LDA    $F95C,Y
       STA    COLUP0
       LDA    $F984,Y
       STA    GRP0
       BEQ    LF3CD
       INY
LF3CD: STA    WSYNC
       DEC    $F3
       DEC    $F4
       BNE    LF3E6
       TSX
       STX    $F2
       DEC    $EE
       BNE    LF3DF
       JMP    LF636
LF3DF: LDA    $C5
       STA    $F4
       JMP    LF3F0
LF3E6: LDX    $F2
       TXS
       NOP
       NOP
       NOP
       NOP
       NOP
       NOP
       NOP
LF3F0: LDA    $F3
       CMP    $CC
       BNE    LF3F7
       INY
LF3F7: NOP
       NOP
       NOP
       LDA    $F95C,Y
       STA    COLUP0
       LDA    $F984,Y
       STA    GRP0
       BEQ    LF407
       INY
LF407: STA    WSYNC
       PLA
       STA    PF0
       PLA
       STA    PF1
       LDA    $F3
       CMP    $CE
       BNE    LF419
       LDA    #$02
       STA    ENAM0
LF419: PLA
       STA    PF2
       PLA
       STA    PF0
       PLA
       STA    PF1
       PLA
       STA    PF2
       LDA    $F984,Y
       STA    GRP0
       BEQ    LF42D
       INY
LF42D: LDX    #$00
       STX    PF0
       STA    WSYNC
       STX    PF1
       STX    PF2
       STX    ENAM0
       LDX    $F5
       LDA    $D7,X
       TAX
       LDA    $F90C,X
       STA    $FA
       LDA    $F934,X
       STA    HMP1
       LDA    $F5
       ASL
       CLC
       ADC    $F5
       TAX
       LDA    $95,X
       AND    #$0F
       TAX
       LDA    $F8F1,X
       STA    $FB
       LDA    $F9AC,X
       STA    COLUP1
       LDA    $F95C,Y
       STA    COLUP0
       LDA    $F984,Y
       STA    GRP0
       BEQ    LF46B
       INY
LF46B: DEC    $F3
       DEC    $F4
       BNE    LF482
       TSX
       STX    $F2
       DEC    $EE
       BNE    LF47B
       JMP    LF636
LF47B: LDA    $C5
       STA    $F4
       JMP    LF48C
LF482: LDX    $F2
       TXS
       NOP
       NOP
       NOP
       NOP
       NOP
       NOP
       NOP
LF48C: LDA    $F3
       CMP    $CC
       BNE    LF493
       INY
LF493: LDA    $F984,Y
       STA    GRP0
       BEQ    LF49B
       INY
LF49B: STA    WSYNC
       PLA
       STA    PF0
       PLA
       STA    PF1
       LDA    $F3
       CMP    $CE
       BNE    LF4AD
       LDA    #$02
       STA    ENAM0
LF4AD: PLA
       STA    PF2
       PLA
       STA    PF0
       PLA
       STA    PF1
       PLA
       STA    PF2
       LDA    $F984,Y
       STA    GRP0
       BEQ    LF4C1
       INY
LF4C1: LDX    #$00
       STX    PF0
       STA    WSYNC
       STX    PF1
       STX    PF2
       STX    ENAM0
       NOP
       LDX    $FA
LF4D0: DEX
       BNE    LF4D0
       STA    RESP1
       STA    WSYNC
       LDA    $F95C,Y
       STA    COLUP0
       LDA    $F984,Y
       STA    GRP0
       BEQ    LF4E4
       INY
LF4E4: DEC    $F3
       DEC    $F4
       BNE    LF4FB
       TSX
       STX    $F2
       DEC    $EE
       BNE    LF4F4
       JMP    LF636
LF4F4: LDA    $C5
       STA    $F4
       JMP    LF503
LF4FB: NOP
       LDX    $F2
       TXS
       NOP
       NOP
       NOP
       NOP
LF503: LDA    $F3
       CMP    $CC
       BNE    LF50A
       INY
LF50A: LDA    $F984,Y
       STA    GRP0
       BEQ    LF512
       INY
LF512: STA    WSYNC
       PLA
       STA    PF0
       PLA
       STA    PF1
       LDA    $F3
       CMP    $CE
       BNE    LF524
       LDA    #$02
       STA    ENAM0
LF524: PLA
       STA    PF2
       PLA
       STA    PF0
       PLA
       STA    PF1
       PLA
       STA    PF2
       LDA    $F984,Y
       STA    GRP0
       BEQ    LF538
       INY
LF538: LDX    #$00
       STX    PF0
       STA    WSYNC
       STA    HMOVE
       STX    PF1
       STX    PF2
       STX    ENAM0
       LDX    $F5
       BEQ    LF54C
       DEC    $F5
LF54C: LDA    $D2,X
       STA    $FA
       LDX    $FB
       LDA    $FA
       CMP    $F3
       BNE    LF559
       INX
LF559: NOP
       NOP
       NOP
       NOP
       LDA    $F95C,Y
       STA    COLUP0
       LDA    $F984,Y
       STA    GRP0
       BEQ    LF56A
       INY
LF56A: STA    WSYNC
       LDA    $F9BC,X
       STA    GRP1
       BEQ    LF574
       INX
LF574: DEC    $F3
       DEC    $F4
       BNE    LF58D
       TXA
       TSX
       STX    $F2
       TAX
       DEC    $EE
       BNE    LF586
       JMP    LF636
LF586: LDA    $C5
       STA    $F4
       JMP    LF597
LF58D: TXA
       LDX    $F2
       TXS
       TAX
       NOP
       NOP
       NOP
       NOP
       NOP
LF597: LDA    $F3
       CMP    $CC
       BNE    LF59E
       INY
LF59E: LDA    $F984,Y
       STA    GRP0
       BEQ    LF5A6
       INY
LF5A6: STA    WSYNC
       PLA
       STA    PF0
       PLA
       STA    PF1
       LDA    $F3
       CMP    $CE
       BNE    LF5B8
       LDA    #$02
       STA    ENAM0
LF5B8: PLA
       STA    PF2
       PLA
       STA    PF0
       PLA
       STA    PF1
       PLA
       STA    PF2
       LDA    $F984,Y
       STA    GRP0
       BEQ    LF5CC
       INY
LF5CC: LDA    #$00
       STA    PF0
       STA    PF1
       STA    ENAM0
       STA    PF2
       LDA    $F9BC,X
       STA    GRP1
       BEQ    LF5E1
       INX
       JMP    LF5F2
LF5E1: LDA    $F9BD,X
       CMP    #$80
       BEQ    LF627
       LDA    $FA
       CMP    $F3
       BNE    LF5F8
       INX
       JMP    LF5FA
LF5F2: NOP
       NOP
       NOP
       NOP
       NOP
       NOP
LF5F8: NOP
       NOP
LF5FA: CLC
       LDA    $F3
       ADC    #$02
       CMP    $CC
       BCS    LF617
       LDA    $D0
       CMP    $F3
       BNE    LF610
       LDA    #$02
       STA    ENABL
       JMP    LF56A
LF610: LDA    #$00
       STA    ENABL
       JMP    LF56A
LF617: LDA    $F95C,Y
       STA    COLUP0
       LDA    $F984,Y
       STA    GRP0
       BEQ    LF624
       INY
LF624: JMP    LF56A
LF627: NOP
       LDA    #$00
       STA    ENABL
       STA    ENABL
       NOP
       NOP
       NOP
       NOP
       NOP
       JMP    LF3C0
LF636: LDX    $F1
       TXS
LF639: LDX    #$02
LF63B: LDA    INTIM
       BMI    LF658
       LDA    $F8EB,X
       STA    WSYNC
       BNE    LF64D
       STA    GRP0
       STA    GRP1
       STA    ENABL
LF64D: STA    PF0
       STA    PF1
       STA    PF2
       DEX
       BPL    LF63B
       BMI    LF639
LF658: STA    WSYNC
       JSR    LFC43
       LDX    #$D2
       LDA    $AA
       AND    #$01
       BEQ    LF66B
       LDA    $C2
       CLC
       ADC    #$20
       TAX
LF66B: STX    COLUPF
       STX    COLUBK
       LDA    $80
       AND    #$0F
       STA    $FA
       TAX
       LDA    $F8ED,X
       STA    NUSIZ0
       STA    WSYNC
       LDY    #$03
LF67F: DEY
       BNE    LF67F
       NOP
       STA    RESP0
       STA    WSYNC
       STA    WSYNC
       LDY    #$00
LF68B: STA    WSYNC
       INY
       LDA    $FA
       BEQ    LF6A0
       LDA    $F95C,Y
       STA    COLUP0
       LDA    $F984,Y
       STA    GRP0
       BNE    LF68B
       BEQ    LF6A5
LF6A0: LDA    $F984,Y
       BNE    LF68B
LF6A5: STA    WSYNC
       JMP    LF700
LF6AA: .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF
LF700: JSR    LFC43
       LDA    #$01
       STA    CTRLPF
       LDA    #$7F
       STA    PF1
       LDA    #$FF
       STA    PF2
       LDA    $C3
       LSR
       STA    $FA
       LDA    #$4E
       SEC
       SBC    $FA
       STA    $EF
       LDX    #$32
       LDA    $E2
       AND    #$80
       BEQ    LF725
       LDX    #$16
LF725: LDA    #$F7
       STA    WSYNC
       STA    $F0
       LDY    #$05
       LDA    #$70
       STA    COLUPF
       LDA    $C3
       ROR
       BCS    LF736
LF736: JMP.ind ($00EF)
LF739: .byte $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA
       .byte $EA,$EA,$EA,$EA,$EA,$A5,$00,$86,$08,$85,$02,$88,$D0,$D6,$20,$43
       .byte $FC,$85,$02,$85,$02,$A9,$00,$85,$09,$8D,$E3,$FF,$4C,$00,$F0

LF768: TAY
       AND    #$0F
       STA    $FA
       TYA
       LSR
       LSR
       LSR
       LSR
       TAY
       ADC    $FA
       CMP    #$0F
       BCC    LF77C
       SBC    #$0F
       INY
LF77C: EOR    #$07
       ASL
       ASL
       ASL
       ASL
       TAX
       RTS

LF784:
       STA    NUSIZ0
       STX    HMP0
       CPY    #$00
       BEQ    LF790
       NOP
LF78D: DEY
       BNE    LF78D
LF790: STA    RESP0
       RTS

       STA    NUSIZ1
       STX    HMP1
       CPY    #$00
       BEQ    LF79F
       NOP
LF79C: DEY
       BNE    LF79C
LF79F: STA    RESP1
       RTS

       .byte $FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

$F800:
       .byte $1C ; |   XXX  | $F800
       .byte $23 ; |  X   XX| $F801
       .byte $2A ; |  X X X | $F802
       .byte $31 ; |  XX   X| $F803
       .byte $38 ; |  XXX   | $F804
       .byte $3F ; |  XXXXXX| $F805
       .byte $46 ; | X   XX | $F806
       .byte $4D ; | X  XX X| $F807
       .byte $54 ; | X X X  | $F808
       .byte $5B ; | X XX XX| $F809
       .byte $62 ; | XX   X | $F80A
       .byte $69 ; | XX X  X| $F80B
       .byte $70 ; | XXX    | $F80C
       .byte $77 ; | XXX XXX| $F80D
       .byte $7E ; | XXXXXX | $F80E
       .byte $85 ; |X    X X| $F80F
       .byte $8C ; |X   XX  | $F810
       .byte $93 ; |X  X  XX| $F811
       .byte $9A ; |X  XX X | $F812
       .byte $A1 ; |X X    X| $F813
       .byte $A8 ; |X X X   | $F814
       .byte $AF ; |X X XXXX| $F815
       .byte $B6 ; |X XX XX | $F816
       .byte $BD ; |X XXXX X| $F817
       .byte $C4 ; |XX   X  | $F818
       .byte $CB ; |XX  X XX| $F819
       .byte $D2 ; |XX X  X | $F81A
       .byte $D9 ; |XX XX  X| $F81B
       .byte $3C ; |  XXXX  | $F81C
       .byte $66 ; | XX  XX | $F81D
       .byte $66 ; | XX  XX | $F81E
       .byte $66 ; | XX  XX | $F81F
       .byte $66 ; | XX  XX | $F820
       .byte $66 ; | XX  XX | $F821
       .byte $3C ; |  XXXX  | $F822
       .byte $3C ; |  XXXX  | $F823
       .byte $18 ; |   XX   | $F824
       .byte $18 ; |   XX   | $F825
       .byte $18 ; |   XX   | $F826
       .byte $18 ; |   XX   | $F827
       .byte $38 ; |  XXX   | $F828
       .byte $18 ; |   XX   | $F829
       .byte $7E ; | XXXXXX | $F82A
       .byte $60 ; | XX     | $F82B
       .byte $60 ; | XX     | $F82C
       .byte $3C ; |  XXXX  | $F82D
       .byte $06 ; |     XX | $F82E
       .byte $46 ; | X   XX | $F82F
       .byte $3C ; |  XXXX  | $F830
       .byte $3C ; |  XXXX  | $F831
       .byte $46 ; | X   XX | $F832
       .byte $06 ; |     XX | $F833
       .byte $0C ; |    XX  | $F834
       .byte $06 ; |     XX | $F835
       .byte $46 ; | X   XX | $F836
       .byte $3C ; |  XXXX  | $F837
       .byte $0C ; |    XX  | $F838
       .byte $0C ; |    XX  | $F839
       .byte $7E ; | XXXXXX | $F83A
       .byte $4C ; | X  XX  | $F83B
       .byte $2C ; |  X XX  | $F83C
       .byte $1C ; |   XXX  | $F83D
       .byte $0C ; |    XX  | $F83E
       .byte $7C ; | XXXXX  | $F83F
       .byte $46 ; | X   XX | $F840
       .byte $06 ; |     XX | $F841
       .byte $7C ; | XXXXX  | $F842
       .byte $60 ; | XX     | $F843
       .byte $60 ; | XX     | $F844
       .byte $7E ; | XXXXXX | $F845
       .byte $3C ; |  XXXX  | $F846
       .byte $66 ; | XX  XX | $F847
       .byte $66 ; | XX  XX | $F848
       .byte $7C ; | XXXXX  | $F849
       .byte $60 ; | XX     | $F84A
       .byte $62 ; | XX   X | $F84B
       .byte $3C ; |  XXXX  | $F84C
       .byte $18 ; |   XX   | $F84D
       .byte $18 ; |   XX   | $F84E
       .byte $18 ; |   XX   | $F84F
       .byte $0C ; |    XX  | $F850
       .byte $06 ; |     XX | $F851
       .byte $42 ; | X    X | $F852
       .byte $7E ; | XXXXXX | $F853
       .byte $3C ; |  XXXX  | $F854
       .byte $66 ; | XX  XX | $F855
       .byte $66 ; | XX  XX | $F856
       .byte $3C ; |  XXXX  | $F857
       .byte $66 ; | XX  XX | $F858
       .byte $66 ; | XX  XX | $F859
       .byte $3C ; |  XXXX  | $F85A
       .byte $3C ; |  XXXX  | $F85B
       .byte $46 ; | X   XX | $F85C
       .byte $06 ; |     XX | $F85D
       .byte $3E ; |  XXXXX | $F85E
       .byte $66 ; | XX  XX | $F85F
       .byte $66 ; | XX  XX | $F860
       .byte $3C ; |  XXXX  | $F861
       .byte $00 ; |        | $F862
       .byte $00 ; |        | $F863
       .byte $00 ; |        | $F864
       .byte $00 ; |        | $F865
       .byte $00 ; |        | $F866
       .byte $00 ; |        | $F867
       .byte $00 ; |        | $F868
       .byte $F3 ; |XXXX  XX| $F869
       .byte $0A ; |    X X | $F86A
       .byte $0A ; |    X X | $F86B
       .byte $72 ; | XXX  X | $F86C
       .byte $82 ; |X     X | $F86D
       .byte $82 ; |X     X | $F86E
       .byte $7A ; | XXXX X | $F86F
       .byte $E7 ; |XXX  XXX| $F870
       .byte $08 ; |    X   | $F871
       .byte $08 ; |    X   | $F872
       .byte $08 ; |    X   | $F873
       .byte $08 ; |    X   | $F874
       .byte $08 ; |    X   | $F875
       .byte $07 ; |     XXX| $F876
       .byte $22 ; |  X   X | $F877
       .byte $B6 ; |X XX XX | $F878
       .byte $AA ; |X X X X | $F879
       .byte $AA ; |X X X X | $F87A
       .byte $A2 ; |X X   X | $F87B
       .byte $A2 ; |X X   X | $F87C
       .byte $22 ; |  X   X | $F87D
       .byte $8B ; |X   X XX| $F87E
       .byte $8A ; |X   X X | $F87F
       .byte $8A ; |X   X X | $F880
       .byte $8B ; |X   X XX| $F881
       .byte $AA ; |X X X X | $F882
       .byte $DA ; |XX XX X | $F883
       .byte $8B ; |X   X XX| $F884
       .byte $EF ; |XXX XXXX| $F885
       .byte $08 ; |    X   | $F886
       .byte $08 ; |    X   | $F887
       .byte $88 ; |X   X   | $F888
       .byte $08 ; |    X   | $F889
       .byte $08 ; |    X   | $F88A
       .byte $EF ; |XXX XXXX| $F88B
       .byte $3E ; |  XXXXX | $F88C
       .byte $88 ; |X   X   | $F88D
       .byte $88 ; |X   X   | $F88E
       .byte $88 ; |X   X   | $F88F
       .byte $88 ; |X   X   | $F890
       .byte $88 ; |X   X   | $F891
       .byte $3E ; |  XXXXX | $F892
       .byte $72 ; | XXX  X | $F893
       .byte $8A ; |X   X X | $F894
       .byte $8A ; |X   X X | $F895
       .byte $8A ; |X   X X | $F896
       .byte $8A ; |X   X X | $F897
       .byte $8B ; |X   X XX| $F898
       .byte $8A ; |X   X X | $F899
       .byte $20 ; |  X     | $F89A
       .byte $20 ; |  X     | $F89B
       .byte $20 ; |  X     | $F89C
       .byte $20 ; |  X     | $F89D
       .byte $A0 ; |X X     | $F89E
       .byte $60 ; | XX     | $F89F
       .byte $20 ; |  X     | $F8A0
       .byte $82 ; |X     X | $F8A1
       .byte $82 ; |X     X | $F8A2
       .byte $82 ; |X     X | $F8A3
       .byte $E3 ; |XXX   XX| $F8A4
       .byte $82 ; |X     X | $F8A5
       .byte $82 ; |X     X | $F8A6
       .byte $F9 ; |XXXXX  X| $F8A7
       .byte $2F ; |  X XXXX| $F8A8
       .byte $20 ; |  X     | $F8A9
       .byte $20 ; |  X     | $F8AA
       .byte $E7 ; |XXX  XXX| $F8AB
       .byte $28 ; |  X X   | $F8AC
       .byte $28 ; |  X X   | $F8AD
       .byte $C7 ; |XX   XXX| $F8AE
       .byte $08 ; |    X   | $F8AF
       .byte $88 ; |X   X   | $F8B0
       .byte $88 ; |X   X   | $F8B1
       .byte $08 ; |    X   | $F8B2
       .byte $08 ; |    X   | $F8B3
       .byte $08 ; |    X   | $F8B4
       .byte $BE ; |X XXXXX | $F8B5
       .byte $71 ; | XXX   X| $F8B6
       .byte $8A ; |X   X X | $F8B7
       .byte $82 ; |X     X | $F8B8
       .byte $82 ; |X     X | $F8B9
       .byte $82 ; |X     X | $F8BA
       .byte $8A ; |X   X X | $F8BB
       .byte $71 ; | XXX   X| $F8BC
       .byte $C8 ; |XX  X   | $F8BD
       .byte $29 ; |  X X  X| $F8BE
       .byte $29 ; |  X X  X| $F8BF
       .byte $2A ; |  X X X | $F8C0
       .byte $2A ; |  X X X | $F8C1
       .byte $2C ; |  X XX  | $F8C2
       .byte $C8 ; |XX  X   | $F8C3
       .byte $88 ; |X   X   | $F8C4
       .byte $88 ; |X   X   | $F8C5
       .byte $88 ; |X   X   | $F8C6
       .byte $88 ; |X   X   | $F8C7
       .byte $88 ; |X   X   | $F8C8
       .byte $88 ; |X   X   | $F8C9
       .byte $BE ; |X XXXXX | $F8CA
       .byte $FA ; |XXXXX X | $F8CB
       .byte $22 ; |  X   X | $F8CC
       .byte $22 ; |  X   X | $F8CD
       .byte $22 ; |  X   X | $F8CE
       .byte $22 ; |  X   X | $F8CF
       .byte $23 ; |  X   XX| $F8D0
       .byte $FA ; |XXXXX X | $F8D1
       .byte $27 ; |  X  XXX| $F8D2
       .byte $68 ; | XX X   | $F8D3
       .byte $68 ; | XX X   | $F8D4
       .byte $A8 ; |X X X   | $F8D5
       .byte $A8 ; |X X X   | $F8D6
       .byte $28 ; |  X X   | $F8D7
       .byte $28 ; |  X X   | $F8D8
       .byte $3E ; |  XXXXX | $F8D9
       .byte $A0 ; |X X     | $F8DA
       .byte $A0 ; |X X     | $F8DB
       .byte $B8 ; |X XXX   | $F8DC
       .byte $A0 ; |X X     | $F8DD
       .byte $A0 ; |X X     | $F8DE
       .byte $BE ; |X XXXXX | $F8DF
       .byte $24 ; |  X  X  | $F8E0
       .byte $34 ; |  XX X  | $F8E1
       .byte $44 ; | X   X  | $F8E2
       .byte $C4 ; |XX   X  | $F8E3
       .byte $B4 ; |X XX X  | $F8E4
       .byte $A4 ; |X X  X  | $F8E5
       .byte $94 ; |X  X X  | $F8E6
       .byte $84 ; |X    X  | $F8E7
       .byte $74 ; | XXX X  | $F8E8
       .byte $64 ; | XX  X  | $F8E9
       .byte $54 ; | X X X  | $F8EA
       .byte $00 ; |        | $F8EB
       .byte $00 ; |        | $F8EC
       .byte $FF ; |XXXXXXXX| $F8ED
       .byte $00 ; |        | $F8EE
       .byte $01 ; |       X| $F8EF
       .byte $03 ; |      XX| $F8F0
       .byte $00 ; |        | $F8F1
       .byte $10 ; |   X    | $F8F2
       .byte $20 ; |  X     | $F8F3
       .byte $30 ; |  XX    | $F8F4
       .byte $40 ; | X      | $F8F5
       .byte $50 ; | X X    | $F8F6
       .byte $60 ; | XX     | $F8F7
       .byte $70 ; | XXX    | $F8F8
       .byte $80 ; |X       | $F8F9
       .byte $90 ; |X  X    | $F8FA
       .byte $A0 ; |X X     | $F8FB
       .byte $B0 ; |X XX    | $F8FC
       .byte $C0 ; |XX      | $F8FD
       .byte $D0 ; |XX X    | $F8FE
       .byte $E0 ; |XXX     | $F8FF
       .byte $F0 ; |XXXX    | $F900
       .byte $19 ; |   XX  X| $F901
       .byte $19 ; |   XX  X| $F902
       .byte $19 ; |   XX  X| $F903
       .byte $14 ; |   X X  | $F904
       .byte $14 ; |   X X  | $F905
       .byte $14 ; |   X X  | $F906
       .byte $0F ; |    XXXX| $F907
       .byte $0F ; |    XXXX| $F908
       .byte $0F ; |    XXXX| $F909
       .byte $0D ; |    XX X| $F90A
       .byte $0D ; |    XX X| $F90B
       .byte $01 ; |       X| $F90C
       .byte $01 ; |       X| $F90D
       .byte $01 ; |       X| $F90E
       .byte $01 ; |       X| $F90F
       .byte $02 ; |      X | $F910
       .byte $02 ; |      X | $F911
       .byte $02 ; |      X | $F912
       .byte $02 ; |      X | $F913
       .byte $03 ; |      XX| $F914
       .byte $03 ; |      XX| $F915
       .byte $03 ; |      XX| $F916
       .byte $03 ; |      XX| $F917
       .byte $04 ; |     X  | $F918
       .byte $04 ; |     X  | $F919
       .byte $04 ; |     X  | $F91A
       .byte $05 ; |     X X| $F91B
       .byte $05 ; |     X X| $F91C
       .byte $05 ; |     X X| $F91D
       .byte $05 ; |     X X| $F91E
       .byte $06 ; |     XX | $F91F
       .byte $06 ; |     XX | $F920
       .byte $06 ; |     XX | $F921
       .byte $06 ; |     XX | $F922
       .byte $07 ; |     XXX| $F923
       .byte $07 ; |     XXX| $F924
       .byte $07 ; |     XXX| $F925
       .byte $07 ; |     XXX| $F926
       .byte $08 ; |    X   | $F927
       .byte $08 ; |    X   | $F928
       .byte $08 ; |    X   | $F929
       .byte $09 ; |    X  X| $F92A
       .byte $09 ; |    X  X| $F92B
       .byte $09 ; |    X  X| $F92C
       .byte $09 ; |    X  X| $F92D
       .byte $0A ; |    X X | $F92E
       .byte $0A ; |    X X | $F92F
       .byte $0A ; |    X X | $F930
       .byte $0A ; |    X X | $F931
       .byte $0B ; |    X XX| $F932
       .byte $0B ; |    X XX| $F933
       .byte $70 ; | XXX    | $F934
       .byte $30 ; |  XX    | $F935
       .byte $F0 ; |XXXX    | $F936
       .byte $B0 ; |X XX    | $F937
       .byte $60 ; | XX     | $F938
       .byte $20 ; |  X     | $F939
       .byte $E0 ; |XXX     | $F93A
       .byte $A0 ; |X X     | $F93B
       .byte $50 ; | X X    | $F93C
       .byte $10 ; |   X    | $F93D
       .byte $D0 ; |XX X    | $F93E
       .byte $90 ; |X  X    | $F93F
       .byte $40 ; | X      | $F940
       .byte $00 ; |        | $F941
       .byte $C0 ; |XX      | $F942
       .byte $70 ; | XXX    | $F943
       .byte $30 ; |  XX    | $F944
       .byte $F0 ; |XXXX    | $F945
       .byte $B0 ; |X XX    | $F946
       .byte $60 ; | XX     | $F947
       .byte $20 ; |  X     | $F948
       .byte $E0 ; |XXX     | $F949
       .byte $A0 ; |X X     | $F94A
       .byte $50 ; | X X    | $F94B
       .byte $10 ; |   X    | $F94C
       .byte $D0 ; |XX X    | $F94D
       .byte $90 ; |X  X    | $F94E
       .byte $40 ; | X      | $F94F
       .byte $00 ; |        | $F950
       .byte $C0 ; |XX      | $F951
       .byte $70 ; | XXX    | $F952
       .byte $30 ; |  XX    | $F953
       .byte $F0 ; |XXXX    | $F954
       .byte $B0 ; |X XX    | $F955
       .byte $60 ; | XX     | $F956
       .byte $20 ; |  X     | $F957
       .byte $E0 ; |XXX     | $F958
       .byte $A0 ; |X X     | $F959
       .byte $50 ; | X X    | $F95A
       .byte $10 ; |   X    | $F95B
       .byte $0C ; |    XX  | $F95C
       .byte $0C ; |    XX  | $F95D
       .byte $D6 ; |XX X XX | $F95E
       .byte $D6 ; |XX X XX | $F95F
       .byte $D6 ; |XX X XX | $F960
       .byte $D4 ; |XX X X  | $F961
       .byte $06 ; |     XX | $F962
       .byte $FF ; |XXXXXXXX| $F963
       .byte $0C ; |    XX  | $F964
       .byte $0C ; |    XX  | $F965
       .byte $D6 ; |XX X XX | $F966
       .byte $D6 ; |XX X XX | $F967
       .byte $D6 ; |XX X XX | $F968
       .byte $D4 ; |XX X X  | $F969
       .byte $06 ; |     XX | $F96A
       .byte $FF ; |XXXXXXXX| $F96B
       .byte $0E ; |    XXX | $F96C
       .byte $0E ; |    XXX | $F96D
       .byte $0E ; |    XXX | $F96E
       .byte $0E ; |    XXX | $F96F
       .byte $0E ; |    XXX | $F970
       .byte $0E ; |    XXX | $F971
       .byte $0E ; |    XXX | $F972
       .byte $0E ; |    XXX | $F973
       .byte $18 ; |   XX   | $F974
       .byte $18 ; |   XX   | $F975
       .byte $18 ; |   XX   | $F976
       .byte $18 ; |   XX   | $F977
       .byte $18 ; |   XX   | $F978
       .byte $18 ; |   XX   | $F979
       .byte $18 ; |   XX   | $F97A
       .byte $18 ; |   XX   | $F97B
       .byte $32 ; |  XX  X | $F97C
       .byte $32 ; |  XX  X | $F97D
       .byte $32 ; |  XX  X | $F97E
       .byte $32 ; |  XX  X | $F97F
       .byte $32 ; |  XX  X | $F980
       .byte $32 ; |  XX  X | $F981
       .byte $32 ; |  XX  X | $F982
       .byte $32 ; |  XX  X | $F983
       .byte $00 ; |        | $F984
       .byte $7E ; | XXXXXX | $F985
       .byte $88 ; |X   X   | $F986
       .byte $5C ; | X XXX  | $F987
       .byte $7E ; | XXXXXX | $F988
       .byte $0A ; |    X X | $F989
       .byte $1F ; |   XXXXX| $F98A
       .byte $00 ; |        | $F98B
       .byte $00 ; |        | $F98C
       .byte $BF ; |X XXXXXX| $F98D
       .byte $48 ; | X  X   | $F98E
       .byte $5C ; | X XXX  | $F98F
       .byte $7E ; | XXXXXX | $F990
       .byte $0A ; |    X X | $F991
       .byte $1F ; |   XXXXX| $F992
       .byte $00 ; |        | $F993
       .byte $00 ; |        | $F994
       .byte $BF ; |X XXXXXX| $F995
       .byte $48 ; | X  X   | $F996
       .byte $5C ; | X XXX  | $F997
       .byte $7E ; | XXXXXX | $F998
       .byte $0A ; |    X X | $F999
       .byte $1F ; |   XXXXX| $F99A
       .byte $00 ; |        | $F99B
       .byte $00 ; |        | $F99C
       .byte $BF ; |X XXXXXX| $F99D
       .byte $48 ; | X  X   | $F99E
       .byte $5C ; | X XXX  | $F99F
       .byte $7E ; | XXXXXX | $F9A0
       .byte $0A ; |    X X | $F9A1
       .byte $1F ; |   XXXXX| $F9A2
       .byte $00 ; |        | $F9A3
       .byte $00 ; |        | $F9A4
       .byte $BF ; |X XXXXXX| $F9A5
       .byte $48 ; | X  X   | $F9A6
       .byte $5C ; | X XXX  | $F9A7
       .byte $7E ; | XXXXXX | $F9A8
       .byte $0A ; |    X X | $F9A9
       .byte $1F ; |   XXXXX| $F9AA
       .byte $00 ; |        | $F9AB
       .byte $00 ; |        | $F9AC
       .byte $18 ; |   XX   | $F9AD
       .byte $18 ; |   XX   | $F9AE
       .byte $86 ; |X    XX | $F9AF
       .byte $08 ; |    X   | $F9B0
       .byte $34 ; |  XX X  | $F9B1
       .byte $86 ; |X    XX | $F9B2
       .byte $86 ; |X    XX | $F9B3
       .byte $28 ; |  X X   | $F9B4
       .byte $A6 ; |X X  XX | $F9B5
       .byte $08 ; |    X   | $F9B6
       .byte $1C ; |   XXX  | $F9B7
       .byte $38 ; |  XXX   | $F9B8
       .byte $08 ; |    X   | $F9B9
       .byte $08 ; |    X   | $F9BA
       .byte $08 ; |    X   | $F9BB
       .byte $00 ; |        | $F9BC
       .byte $00 ; |        | $F9BD
       .byte $80 ; |X       | $F9BE
       .byte $00 ; |        | $F9BF
       .byte $00 ; |        | $F9C0
       .byte $00 ; |        | $F9C1
       .byte $00 ; |        | $F9C2
       .byte $00 ; |        | $F9C3
       .byte $00 ; |        | $F9C4
       .byte $00 ; |        | $F9C5
       .byte $00 ; |        | $F9C6
       .byte $00 ; |        | $F9C7
       .byte $00 ; |        | $F9C8
       .byte $00 ; |        | $F9C9
       .byte $00 ; |        | $F9CA
       .byte $00 ; |        | $F9CB
       .byte $00 ; |        | $F9CC
       .byte $40 ; | X      | $F9CD
       .byte $40 ; | X      | $F9CE
       .byte $40 ; | X      | $F9CF
       .byte $40 ; | X      | $F9D0
       .byte $A0 ; |X X     | $F9D1
       .byte $A0 ; |X X     | $F9D2
       .byte $00 ; |        | $F9D3
       .byte $80 ; |X       | $F9D4
       .byte $00 ; |        | $F9D5
       .byte $00 ; |        | $F9D6
       .byte $00 ; |        | $F9D7
       .byte $00 ; |        | $F9D8
       .byte $00 ; |        | $F9D9
       .byte $00 ; |        | $F9DA
       .byte $00 ; |        | $F9DB
       .byte $00 ; |        | $F9DC
       .byte $40 ; | X      | $F9DD
       .byte $40 ; | X      | $F9DE
       .byte $40 ; | X      | $F9DF
       .byte $A0 ; |X X     | $F9E0
       .byte $A0 ; |X X     | $F9E1
       .byte $40 ; | X      | $F9E2
       .byte $00 ; |        | $F9E3
       .byte $80 ; |X       | $F9E4
       .byte $00 ; |        | $F9E5
       .byte $00 ; |        | $F9E6
       .byte $00 ; |        | $F9E7
       .byte $00 ; |        | $F9E8
       .byte $00 ; |        | $F9E9
       .byte $00 ; |        | $F9EA
       .byte $00 ; |        | $F9EB
       .byte $00 ; |        | $F9EC
       .byte $7E ; | XXXXXX | $F9ED
       .byte $FF ; |XXXXXXXX| $F9EE
       .byte $7E ; | XXXXXX | $F9EF
       .byte $3C ; |  XXXX  | $F9F0
       .byte $42 ; | X    X | $F9F1
       .byte $42 ; | X    X | $F9F2
       .byte $00 ; |        | $F9F3
       .byte $80 ; |X       | $F9F4
       .byte $00 ; |        | $F9F5
       .byte $00 ; |        | $F9F6
       .byte $00 ; |        | $F9F7
       .byte $00 ; |        | $F9F8
       .byte $00 ; |        | $F9F9
       .byte $00 ; |        | $F9FA
       .byte $00 ; |        | $F9FB
       .byte $00 ; |        | $F9FC
       .byte $40 ; | X      | $F9FD
       .byte $20 ; |  X     | $F9FE
       .byte $14 ; |   X X  | $F9FF
       .byte $1C ; |   XXX  | $FA00
       .byte $1E ; |   XXXX | $FA01
       .byte $1E ; |   XXXX | $FA02
       .byte $00 ; |        | $FA03
       .byte $80 ; |X       | $FA04
       .byte $00 ; |        | $FA05
       .byte $00 ; |        | $FA06
       .byte $00 ; |        | $FA07
       .byte $00 ; |        | $FA08
       .byte $00 ; |        | $FA09
       .byte $00 ; |        | $FA0A
       .byte $00 ; |        | $FA0B
       .byte $00 ; |        | $FA0C
       .byte $40 ; | X      | $FA0D
       .byte $00 ; |        | $FA0E
       .byte $80 ; |X       | $FA0F
       .byte $00 ; |        | $FA10
       .byte $00 ; |        | $FA11
       .byte $00 ; |        | $FA12
       .byte $00 ; |        | $FA13
       .byte $00 ; |        | $FA14
       .byte $00 ; |        | $FA15
       .byte $00 ; |        | $FA16
       .byte $00 ; |        | $FA17
       .byte $00 ; |        | $FA18
       .byte $00 ; |        | $FA19
       .byte $00 ; |        | $FA1A
       .byte $00 ; |        | $FA1B
       .byte $00 ; |        | $FA1C
       .byte $04 ; |     X  | $FA1D
       .byte $0A ; |    X X | $FA1E
       .byte $0A ; |    X X | $FA1F
       .byte $04 ; |     X  | $FA20
       .byte $04 ; |     X  | $FA21
       .byte $04 ; |     X  | $FA22
       .byte $00 ; |        | $FA23
       .byte $80 ; |X       | $FA24
       .byte $00 ; |        | $FA25
       .byte $00 ; |        | $FA26
       .byte $00 ; |        | $FA27
       .byte $00 ; |        | $FA28
       .byte $00 ; |        | $FA29
       .byte $00 ; |        | $FA2A
       .byte $00 ; |        | $FA2B
       .byte $00 ; |        | $FA2C
       .byte $04 ; |     X  | $FA2D
       .byte $0A ; |    X X | $FA2E
       .byte $0A ; |    X X | $FA2F
       .byte $04 ; |     X  | $FA30
       .byte $04 ; |     X  | $FA31
       .byte $04 ; |     X  | $FA32
       .byte $00 ; |        | $FA33
       .byte $80 ; |X       | $FA34
       .byte $00 ; |        | $FA35
       .byte $00 ; |        | $FA36
       .byte $00 ; |        | $FA37
       .byte $00 ; |        | $FA38
       .byte $00 ; |        | $FA39
       .byte $00 ; |        | $FA3A
       .byte $00 ; |        | $FA3B
       .byte $00 ; |        | $FA3C
       .byte $1C ; |   XXX  | $FA3D
       .byte $3E ; |  XXXXX | $FA3E
       .byte $7F ; | XXXXXXX| $FA3F
       .byte $7F ; | XXXXXXX| $FA40
       .byte $3E ; |  XXXXX | $FA41
       .byte $1C ; |   XXX  | $FA42
       .byte $00 ; |        | $FA43
       .byte $80 ; |X       | $FA44
       .byte $00 ; |        | $FA45
       .byte $00 ; |        | $FA46
       .byte $00 ; |        | $FA47
       .byte $00 ; |        | $FA48
       .byte $00 ; |        | $FA49
       .byte $00 ; |        | $FA4A
       .byte $00 ; |        | $FA4B
       .byte $00 ; |        | $FA4C
       .byte $D6 ; |XX X XX | $FA4D
       .byte $80 ; |X       | $FA4E
       .byte $56 ; | X X XX | $FA4F
       .byte $82 ; |X     X | $FA50
       .byte $D4 ; |XX X X  | $FA51
       .byte $02 ; |      X | $FA52
       .byte $D6 ; |XX X XX | $FA53
       .byte $00 ; |        | $FA54
       .byte $80 ; |X       | $FA55
       .byte $00 ; |        | $FA56
       .byte $00 ; |        | $FA57
       .byte $00 ; |        | $FA58
       .byte $00 ; |        | $FA59
       .byte $00 ; |        | $FA5A
       .byte $00 ; |        | $FA5B
       .byte $00 ; |        | $FA5C
       .byte $18 ; |   XX   | $FA5D
       .byte $3C ; |  XXXX  | $FA5E
       .byte $18 ; |   XX   | $FA5F
       .byte $00 ; |        | $FA60
       .byte $80 ; |X       | $FA61
       .byte $00 ; |        | $FA62
       .byte $00 ; |        | $FA63
       .byte $00 ; |        | $FA64
       .byte $00 ; |        | $FA65
       .byte $00 ; |        | $FA66
       .byte $00 ; |        | $FA67
       .byte $00 ; |        | $FA68
       .byte $00 ; |        | $FA69
       .byte $00 ; |        | $FA6A
       .byte $00 ; |        | $FA6B
       .byte $00 ; |        | $FA6C
       .byte $24 ; |  X  X  | $FA6D
       .byte $5A ; | X XX X | $FA6E
       .byte $24 ; |  X  X  | $FA6F
       .byte $00 ; |        | $FA70
       .byte $80 ; |X       | $FA71
       .byte $00 ; |        | $FA72
       .byte $00 ; |        | $FA73
       .byte $00 ; |        | $FA74
       .byte $00 ; |        | $FA75
       .byte $00 ; |        | $FA76
       .byte $00 ; |        | $FA77
       .byte $00 ; |        | $FA78
       .byte $00 ; |        | $FA79
       .byte $00 ; |        | $FA7A
       .byte $00 ; |        | $FA7B
       .byte $00 ; |        | $FA7C
       .byte $24 ; |  X  X  | $FA7D
       .byte $5A ; | X XX X | $FA7E
       .byte $24 ; |  X  X  | $FA7F
       .byte $00 ; |        | $FA80
       .byte $80 ; |X       | $FA81
       .byte $00 ; |        | $FA82
       .byte $00 ; |        | $FA83
       .byte $00 ; |        | $FA84
       .byte $00 ; |        | $FA85
       .byte $00 ; |        | $FA86
       .byte $00 ; |        | $FA87
       .byte $00 ; |        | $FA88
       .byte $00 ; |        | $FA89
       .byte $00 ; |        | $FA8A
       .byte $00 ; |        | $FA8B
       .byte $00 ; |        | $FA8C
       .byte $B7 ; |X XX XXX| $FA8D
       .byte $AD ; |X X XX X| $FA8E
       .byte $BB ; |X XXX XX| $FA8F
       .byte $00 ; |        | $FA90
       .byte $80 ; |X       | $FA91
       .byte $00 ; |        | $FA92
       .byte $00 ; |        | $FA93
       .byte $00 ; |        | $FA94
       .byte $00 ; |        | $FA95
       .byte $00 ; |        | $FA96
       .byte $00 ; |        | $FA97
       .byte $00 ; |        | $FA98
       .byte $00 ; |        | $FA99
       .byte $00 ; |        | $FA9A
       .byte $00 ; |        | $FA9B
       .byte $00 ; |        | $FA9C
       .byte $B7 ; |X XX XXX| $FA9D
       .byte $AD ; |X X XX X| $FA9E
       .byte $BB ; |X XXX XX| $FA9F
       .byte $00 ; |        | $FAA0
       .byte $80 ; |X       | $FAA1
       .byte $00 ; |        | $FAA2
       .byte $00 ; |        | $FAA3
       .byte $00 ; |        | $FAA4
       .byte $00 ; |        | $FAA5
       .byte $00 ; |        | $FAA6
       .byte $00 ; |        | $FAA7
       .byte $00 ; |        | $FAA8
       .byte $00 ; |        | $FAA9
       .byte $00 ; |        | $FAAA
       .byte $00 ; |        | $FAAB
       .byte $00 ; |        | $FAAC
       .byte $B7 ; |X XX XXX| $FAAD
       .byte $AD ; |X X XX X| $FAAE
       .byte $BB ; |X XXX XX| $FAAF
       .byte $00 ; |        | $FAB0
       .byte $80 ; |X       | $FAB1
       .byte $00 ; |        | $FAB2
       .byte $00 ; |        | $FAB3
       .byte $00 ; |        | $FAB4
       .byte $00 ; |        | $FAB5
       .byte $00 ; |        | $FAB6
       .byte $00 ; |        | $FAB7
       .byte $00 ; |        | $FAB8
       .byte $00 ; |        | $FAB9
       .byte $00 ; |        | $FABA
       .byte $00 ; |        | $FABB

       .byte $FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

Start:
    SEI
    CLD
    LDA    #$00
    TAX
ClearRam
    STA    VSYNC,X
    INX
    BNE    ClearRam
    DEX
    TXS

    STA    $FFE0
    STA    $FFE9
    STA    $FFF2
    JSR    $D112
    LDA    $AA
    ORA    #$01
    STA    $AA
    LDA    #$00
    STA    $DC
    STA    $DD
    LDA    #$02
    STA    $C2
    STA    $B3
    JMP    $D000

LFC2D:
       STA    $FFE4
       STA    $FFED
       STA    $FFF6
       JMP    $F000

LFC39:
       STA    $FFE0
       STA    $FFE9
       STA    $FFF2
       RTS

LFC43: LDA    #$00
       STA    PF0
       STA    PF1
       STA    PF2
       STA    COLUP0
       STA    COLUP1
       STA    VDELP0
       STA    VDELP1
       STA    GRP0
       STA    GRP1
       STA    NUSIZ0
       STA    NUSIZ1
       STA    REFP0
       STA    REFP1
       STA    CTRLPF
       STA    WSYNC
       RTS

LFC64:
       LDA    $86
       AND    #$F7
       STA    $86
       LDA    $89
       AND    #$FD
       STA    $89
       LDA    #$FF
       STA    $CC
       LDA    $80
       AND    #$0F
       BEQ    LFC7D
       DEC    $80
       RTS

LFC7D: LDA    $AA
       ORA    #$01
       STA    $AA
       LDA    #$02
       STA    $C2
       RTS

LFC88:
       LDA    $80
       STA    $EF
       LDA    $83
       STA    $F0
       LDA    $AA
       STA    $F1
       LDA    $B3
       AND    #$0F
       STA    $C4
       LDX    #$41
       LDA    #$00
LFC9E: STA    $80,X
       DEX
       BPL    LFC9E
       LDX    #$04
LFCA5: STA    $D2,X
       STA    $D7,X
       DEX
       BPL    LFCA5
       STX    $D0
       STA    $C7
       LDX    $C4
       STX    $B3
       STA    $C4
       LDA    #$5A
       STA    $EB
       LDA    $EF
       AND    #$0F
       STA    $80
       LDA    $F0
       AND    #$0F
       STA    $83
       LDA    $F1
       AND    #$0F
       STA    $AA
       LDA    #$2B
       STA    $C3
       LDA    #$4A
       STA    $CD
       LDA    #$18
       STA    $CC
       LDA    $86
       ORA    #$08
       STA    $86
       JSR    $DA85
       RTS

LFCE2:
       SED
       CLC
       ADC    $E6
       STA    $E6
       TYA
       ADC    $E7
       STA    $E7
       BCC    LFCF5
       LDA    $E8
       ADC    #$00
       STA    $E8
LFCF5: CLD
       RTS

LFCF7: .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$8D
       .byte $FE,$60,$FD,$00,$00,$20,$FD,$1C,$FE,$00,$00,$00,$00,$00,$00,$00
       .byte $00,$00,$00,$77,$FD,$00,$00,$00,$00,$3F,$01,$01,$01,$01,$01,$01
       .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$02,$02,$02,$02,$02,$02
       .byte $02,$03,$03,$03,$03,$03,$03,$04,$04,$04,$05,$05,$06,$06,$07,$07
       .byte $07,$08,$08,$09,$0A,$0B,$0C,$0D,$0E,$0C,$0D,$0E,$0F,$0F,$0F,$0F
       .byte $0F,$0F,$0F,$0F,$0F,$02,$00,$0A,$02,$16,$01,$01,$01,$01,$01,$01
       .byte $02,$02,$02,$03,$03,$04,$04,$05,$06,$07,$07,$07,$02,$00,$0A,$02
       .byte $A4,$01,$10,$01,$10,$01,$10,$02,$11,$02,$11,$02,$11,$03,$12,$03
       .byte $12,$03,$12,$04,$13,$04,$13,$04,$13,$05,$14,$05,$14,$05,$14,$06
       .byte $15,$06,$15,$06,$15,$07,$16,$07,$16,$07,$16,$08,$17,$08,$17,$08
       .byte $17,$09,$18,$09,$18,$09,$18,$0A,$19,$0A,$19,$0A,$19,$0A,$1A,$0A
       .byte $1A,$0A,$1B,$0A,$1B,$0A,$1C,$0A,$1C,$0A,$1D,$0A,$1D,$0A,$1E,$0A
       .byte $1E,$0A,$1F,$0A,$1F,$0A,$1F,$0A,$1F,$0A,$1F,$0A,$1F,$0A,$1F,$0A
       .byte $1F,$0A,$1F,$0A,$1F,$0A,$1F,$0A,$1F,$0A,$1F,$0A,$1F,$0A,$1F,$0A
       .byte $1F,$0A,$1F,$0A,$1F,$0A,$1F,$0A,$1F,$0A,$1F,$0A,$1F,$0A,$1F,$0A
       .byte $1F,$0A,$1F,$0A,$1F,$0A,$1F,$0A,$1F,$0A,$1F,$0A,$1F,$0A,$1F,$09
       .byte $1F,$08,$1F,$07,$1F,$06,$1F,$05,$1F,$04,$1F,$03,$1F,$02,$1F,$01
       .byte $1F,$08,$00,$1F,$03,$31,$01,$02,$03,$04,$05,$05,$05,$05,$05,$05
       .byte $05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05
       .byte $05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$04
       .byte $03,$02,$01,$0F,$00,$02,$02,$3E,$01,$01,$01,$01,$01,$01,$01,$01
       .byte $01,$01,$01,$01,$01,$01,$01,$01,$02,$02,$02,$02,$02,$02,$02,$03
       .byte $03,$03,$03,$03,$03,$04,$04,$04,$05,$05,$06,$06,$07,$07,$07,$08
       .byte $08,$09,$0A,$0B,$0C,$0D,$0E,$0C,$0D,$0E,$0F,$0F,$0F,$0F,$07,$07
       .byte $07,$07,$02,$00,$0A,$02,$11,$1F,$1F,$1F,$05,$05,$05,$05,$05,$05
       .byte $04,$03,$02,$01,$02,$08,$00,$01,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
       .byte $FF,$FF,$FF
    .word Start
    .word Start
    .word $FF00