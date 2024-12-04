; Rough disassembly of Ghostbusters
; By Omegamatrix
;
; 2 button support added for Sega Genesis controllers
; Button C:
; press to goto map screen
; press and hold to bait Marshmallow Man
;
;
; Ghost1.cfg contents:
;
;      ORG D000
;      CODE D000 D009
;      GFX D00A D00B
;      CODE D00C D14E
;      GFX D14F D212
;      CODE D213 D2E5
;      GFX D2E6 D305
;      CODE D306 D437
;      GFX D438 D46D
;      CODE D46E DA6B
;      GFX DA6C DAC4
;      CODE DAC5 DBA9
;      GFX DBAA DBCB
;      CODE DBCC DC66
;      GFX DC67 DFAC
;      CODE DFAD DFFB
;      GFX DFFC DFFF
;
; Ghost2.cfg contents:
;
;      ORG F000
;      CODE F000 FBA4
;      GFX FBA5 FBAA
;      CODE FBAB FBB3
;      GFX FBB4 FBC1
;      CODE FBC2 FBE8
;      GFX FBE9 FBED
;      CODE FBEE FBFA
;      GFX FBFB FBFE
;      CODE FBFF FC2A
;      GFX FC2B FC3E
;      CODE FC3F FCAE
;      GFX FCAF FD71
;      CODE FD72 FD9C
;      GFX FD9D FDA0
;      CODE FDA1 FDB3
;      GFX FDB4 FEAD
;      CODE FEAE FF8B
;      GFX FF8C FFEB
;      CODE FFEC FFFB
;      GFX FFFC FFFF

      processor 6502

VSYNC   =  $00
VBLANK  =  $01
WSYNC   =  $02
NUSIZ0  =  $04
NUSIZ1  =  $05
COLUP0  =  $06
COLUP1  =  $07
COLUPF  =  $08
COLUBK  =  $09
CTRLPF  =  $0A
REFP0   =  $0B
REFP1   =  $0C
PF0     =  $0D
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
RESP1   =  $11
RESM0   =  $12
RESM1   =  $13
AUDC0   =  $15
AUDC1   =  $16
AUDF0   =  $17
AUDF1   =  $18
AUDV0   =  $19
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
ENAM1   =  $1E
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMM0    =  $22
HMM1    =  $23
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C

; Read TIA Baseline = $00
CXPPMM  =  $07
INPT1   =  $09  ; for genesis controller
INPT4   =  $0C

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

BANK_0       = $FFF8
BANK_1       = $FFF9


LF194   =  $F194  ; clc, bcc...

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      RIOT RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RIOT_RAM
       ORG $80

ram_80             ds 1  ; x21
ram_81             ds 1  ; x12
ram_82             ds 4  ; x8
ram_86             ds 9  ; x3
ram_8F             ds 1  ; x2
ram_90             ds 1  ; x1
ram_91             ds 1  ; x3
ram_92             ds 1  ; x2
ram_93             ds 1  ; x22
ram_94             ds 1  ; x6
ram_95             ds 1  ; x8
ram_96             ds 1  ; x18
ram_97             ds 1  ; x8
ram_98             ds 1  ; x10
ram_99             ds 1  ; x4
ram_9A             ds 1  ; x2
ram_9B             ds 1  ; x5
ram_9C             ds 1  ; x1
ram_9D             ds 1  ; x5
ram_9E             ds 1  ; x4
ram_9F             ds 1  ; x12
ram_A0             ds 1  ; x11
ram_A1             ds 1  ; x7
ram_A2             ds 1  ; x7
ram_A3             ds 1  ; x13
ram_A4             ds 1  ; x15
ram_A5             ds 1  ; x6
ram_A6             ds 1  ; x12
ram_A7             ds 1  ; x20
ram_A8             ds 1  ; x8
ram_A9             ds 1  ; x20
ram_AA             ds 1  ; x11
ram_AB             ds 1  ; x14
ram_AC             ds 1  ; x14
ram_AD             ds 1  ; x4
ram_AE             ds 1  ; x24
ram_AF             ds 1  ; x16
ram_B0             ds 1  ; x2
ram_B1             ds 1  ; x5
ram_B2             ds 3  ; x1
ram_B5             ds 1  ; x4
ram_B6             ds 1  ; x7
ram_B7             ds 1  ; x12
ram_B8             ds 1  ; x1
ram_B9             ds 1  ; x1
ram_BA             ds 1  ; x3
ram_BB             ds 1  ; x9
ram_BC             ds 1  ; x10
ram_BD             ds 1  ; x15
ram_BE             ds 1  ; x5
ram_BF             ds 1  ; x3
ram_C0             ds 1  ; x15
ram_C1             ds 1  ; x7
ram_C2             ds 1  ; x2
ram_C3             ds 1  ; x2
ram_C4             ds 1  ; x9
ram_C5             ds 1  ; x1
ram_C6             ds 1  ; x4
ram_C7             ds 1  ; x3
ram_C8             ds 1  ; x7
ram_C9             ds 1  ; x9
ram_CA             ds 1  ; x13
ram_CB             ds 1  ; x5
ram_CC             ds 1  ; x4
ram_CD             ds 1  ; x5
ram_CE             ds 1  ; x7
ram_CF             ds 1  ; x3
ram_D0             ds 1  ; x5
ram_D1             ds 1  ; x4
ram_D2             ds 1  ; x7
ram_D3             ds 1  ; x8
ram_D4             ds 1  ; x38
ram_D5             ds 1  ; x22
ram_D6             ds 4  ; x15
ram_DA             ds 1  ; x2
ram_DB             ds 1  ; x9
ram_DC             ds 1  ; x14
ram_DD             ds 1  ; x15
ram_DE             ds 1  ; x11
ram_DF             ds 1  ; x3
ram_E0             ds 1  ; x16
ram_E1             ds 1  ; x2
ram_E2             ds 1  ; x3
ram_E3             ds 1  ; x4
ram_E4             ds 1  ; x4
ram_E5             ds 1  ; x4
ram_E6             ds 5  ; x7
ram_EB             ds 1  ; x90
ram_EC             ds 1  ; x49
ram_ED             ds 1  ; x24
ram_EE             ds 1  ; x24
ram_EF             ds 1  ; x8
ram_F0             ds 1  ; x4
ram_F1             ds 1  ; x3
ram_F2             ds 1  ; x5
ram_F3             ds 4  ; x1
ram_F7             ds 2  ; x1
ram_F9             ds 1  ; x1
ram_FA             ds 1  ; x1
ram_FB             ds 1  ; x1
ram_FC             ds 1  ; x1
ram_FD             ds 3  ; x1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG CODE
       ORG $0000
      RORG $D000

START_0:
    sei                          ; 2
    bit    BANK_1                ; 4
    ldx    #$FF                  ; 2
    txs                          ; 2
    jsr    $F000                 ; 6

    .byte $00 ; |        | $D00A
    .byte $00 ; |        | $D00B

LD00C:
    jsr    LDBCC                 ; 6
    lda    ram_C6                ; 3
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    and    #$02                  ; 2
    ldx    ram_D4                ; 3
    ldy    LD207,X               ; 4
    sty    ram_EB                ; 3
    ldy    LD20D,X               ; 4
    sty    ram_EC                ; 3
    ldy    #$01                  ; 2
    sty    CTRLPF                ; 3
    ldy    #$06                  ; 2
    sty    NUSIZ1                ; 3
    ldy    #$FF                  ; 2
LD02C:
    ldx    INTIM                 ; 4
    bne    LD02C                 ; 2³
    jmp.ind (ram_EB)             ; 5

LD034:  ; indirect jump
    iny                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    VBLANK                ; 3
    sty    COLUBK                ; 3
    lda    ram_D3                ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    ram_D3                ; 3
LD044:
    dex                          ; 2
    bpl    LD044                 ; 2³
    sta    RESM0                 ; 3
    sta    HMM0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sty    COLUPF                ; 3
    lda    #$0C                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sty    COLUBK                ; 3
    inx                          ; 2
    stx    NUSIZ0                ; 3
    stx    NUSIZ1                ; 3
    jsr    LDFEB                 ; 6
    lda    #$10                  ; 2
    ldx    #$02                  ; 2
    stx    HMM0                  ; 3
    sta    HMP1                  ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    ldx    #$0B                  ; 2
LD06F:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    LDCE3,X               ; 4
    sta    GRP0                  ; 3
    lda    LDCF7,X               ; 4
    sta    GRP1                  ; 3
    sty    COLUBK                ; 3
    ldy    LDCD7,X               ; 4
    dex                          ; 2
    sta    HMCLR                 ; 3
    bpl    LD06F                 ; 2³
    lda    #$16                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    COLUBK                ; 3
    sta    COLUPF                ; 3
    lda    #$7E                  ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    PF0                   ; 3
    lda    #$87                  ; 2
    sec                          ; 2
    sbc    ram_DB                ; 3
    tax                          ; 2
    lda    #$A1                  ; 2
    sbc    ram_BB                ; 3
    sta    ram_EC                ; 3
    ldy    #$46                  ; 2
    bit    ram_E0                ; 3
    bpl    LD0AD                 ; 2³
    ldy    #$1C                  ; 2
LD0AD:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    CXCLR                 ; 3
    sty    ram_86                ; 3
    lda    ram_D2                ; 3
    and    #$0F                  ; 2
    sta    ram_EB                ; 3
    lda    #$04                  ; 2
    sta    ram_EE                ; 3
    ldy    #$C4                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    bit    ram_DA                ; 3
    bpl    LD0CD                 ; 2³
    bvc    LD0CD                 ; 2³
    ldy    ram_86                ; 3
LD0CD:
    sty    ram_ED                ; 3
    lda    ram_DA                ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LDCCF-1,Y             ; 4
    sta    ram_A4                ; 3
    lda    LD46A-1,Y             ; 4
    sta    ram_A5                ; 3
    ldy    #$10                  ; 2
    lda    ram_D5                ; 3
    lsr                          ; 2
    bcc    LD0E7                 ; 2³
    ldy    #$15                  ; 2
LD0E7:
    lda    ram_BD                ; 3
    sta    REFP0                 ; 3
    lda    #$43                  ; 2
    sta    VDELP0                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    COLUP1                ; 3
    sty    NUSIZ0                ; 3
    lda    ram_D3                ; 3
    and    #$0F                  ; 2
    tay                          ; 2
LD0FC:
    dey                          ; 2
    bpl    LD0FC                 ; 2³
    lda    ram_D3                ; 3
    sta    RESP1                 ; 3
    sta    HMP1                  ; 3
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    sta    COLUPF                ; 3
    ldy    ram_EB                ; 3
    lda    ram_D2                ; 3
    sta.w  HMP0                  ; 4
LD114:
    dey                          ; 2
    bpl    LD114                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$08                  ; 2
    sta    COLUBK                ; 3
    sta    NUSIZ1                ; 3
    lda    #$C4                  ; 2
    sta    COLUPF                ; 3
    lda    #$0C                  ; 2
    sta    COLUP0                ; 3
    ldy    #$0B                  ; 2
    sty    ram_EB                ; 3
    sta    HMCLR                 ; 3
    lda    #$00                  ; 2
    sta    ram_C8                ; 3
    lda    ram_A4                ; 3
    cmp    #<LD319               ; 2
    beq    LD145                 ; 2³
    sec                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ram_C8                ; 3
    jmp.ind (ram_A4)             ; 5

LD145:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ram_C8                ; 3
    nop                          ; 2
    jmp.ind (ram_A4)             ; 5

LD14F:
    .byte $1F ; |   XXXXX| $D14F
    .byte $0F ; |    XXXX| $D150
    .byte $07 ; |     XXX| $D151
    .byte $03 ; |      XX| $D152
    .byte $01 ; |       X| $D153
    .byte $00 ; |        | $D154
    .byte $00 ; |        | $D155
LD156:
    .byte $FF ; |XXXXXXXX| $D156
    .byte $FF ; |XXXXXXXX| $D157
    .byte $FF ; |XXXXXXXX| $D158
    .byte $FF ; |XXXXXXXX| $D159
    .byte $FF ; |XXXXXXXX| $D15A
    .byte $00 ; |        | $D15B
    .byte $00 ; |        | $D15C
LD15D:
    .byte $02 ; |      X | $D15D
    .byte $28 ; |  X X   | $D15E
    .byte $38 ; |  XXX   | $D15F
    .byte $38 ; |  XXX   | $D160
    .byte $48 ; | X  X   | $D161
    .byte $48 ; | X  X   | $D162
    .byte $58 ; | X XX   | $D163
    .byte $68 ; | XX X   | $D164
    .byte $68 ; | XX X   | $D165
    .byte $78 ; | XXXX   | $D166
    .byte $78 ; | XXXX   | $D167
    .byte $78 ; | XXXX   | $D168
    .byte $88 ; |X   X   | $D169
    .byte $88 ; |X   X   | $D16A
    .byte $88 ; |X   X   | $D16B
LD16C:
    .byte $00 ; |        | $D16C
    .byte $02 ; |      X | $D16D
    .byte $0C ; |    XX  | $D16E
    .byte $18 ; |   XX   | $D16F
    .byte $1C ; |   XXX  | $D170
    .byte $3C ; |  XXXX  | $D171
    .byte $3C ; |  XXXX  | $D172
    .byte $3A ; |  XXX X | $D173
    .byte $5D ; | X XXX X| $D174
    .byte $BF ; |X XXXXXX| $D175
    .byte $FF ; |XXXXXXXX| $D176
    .byte $76 ; | XXX XX | $D177
    .byte $24 ; |  X  X  | $D178
    .byte $3C ; |  XXXX  | $D179
    .byte $24 ; |  X  X  | $D17A
    .byte $3C ; |  XXXX  | $D17B
    .byte $18 ; |   XX   | $D17C
    .byte $00 ; |        | $D17D
    .byte $03 ; |      XX| $D17E
    .byte $0E ; |    XXX | $D17F
    .byte $1E ; |   XXXX | $D180
    .byte $1C ; |   XXX  | $D181
    .byte $1C ; |   XXX  | $D182
    .byte $9D ; |X  XXX X| $D183
    .byte $FF ; |XXXXXXXX| $D184
    .byte $7E ; | XXXXXX | $D185
    .byte $3C ; |  XXXX  | $D186
    .byte $14 ; |   X X  | $D187
    .byte $1C ; |   XXX  | $D188
    .byte $04 ; |     X  | $D189
    .byte $1C ; |   XXX  | $D18A
    .byte $0C ; |    XX  | $D18B
    .byte $06 ; |     XX | $D18C
    .byte $00 ; |        | $D18D
    .byte $00 ; |        | $D18E
    .byte $00 ; |        | $D18F
    .byte $00 ; |        | $D190
    .byte $00 ; |        | $D191
    .byte $00 ; |        | $D192
    .byte $00 ; |        | $D193
    .byte $00 ; |        | $D194
    .byte $00 ; |        | $D195
    .byte $00 ; |        | $D196
    .byte $00 ; |        | $D197
    .byte $00 ; |        | $D198
    .byte $00 ; |        | $D199
    .byte $00 ; |        | $D19A
    .byte $00 ; |        | $D19B
    .byte $00 ; |        | $D19C
    .byte $00 ; |        | $D19D
    .byte $FF ; |XXXXXXXX| $D19E
    .byte $55 ; | X X X X| $D19F
    .byte $FF ; |XXXXXXXX| $D1A0
    .byte $42 ; | X    X | $D1A1
    .byte $3C ; |  XXXX  | $D1A2
    .byte $24 ; |  X  X  | $D1A3
    .byte $66 ; | XX  XX | $D1A4
    .byte $C3 ; |XX    XX| $D1A5
    .byte $00 ; |        | $D1A6
    .byte $00 ; |        | $D1A7
    .byte $00 ; |        | $D1A8
    .byte $00 ; |        | $D1A9
    .byte $00 ; |        | $D1AA
    .byte $00 ; |        | $D1AB
    .byte $00 ; |        | $D1AC
    .byte $00 ; |        | $D1AD
    .byte $00 ; |        | $D1AE
    .byte $00 ; |        | $D1AF
    .byte $00 ; |        | $D1B0
    .byte $00 ; |        | $D1B1
    .byte $00 ; |        | $D1B2
    .byte $00 ; |        | $D1B3
    .byte $00 ; |        | $D1B4
    .byte $00 ; |        | $D1B5
    .byte $00 ; |        | $D1B6
    .byte $00 ; |        | $D1B7
    .byte $00 ; |        | $D1B8
    .byte $00 ; |        | $D1B9
    .byte $00 ; |        | $D1BA
    .byte $00 ; |        | $D1BB
    .byte $00 ; |        | $D1BC
    .byte $00 ; |        | $D1BD
    .byte $00 ; |        | $D1BE
    .byte $00 ; |        | $D1BF
    .byte $00 ; |        | $D1C0
    .byte $00 ; |        | $D1C1
    .byte $00 ; |        | $D1C2
    .byte $00 ; |        | $D1C3
    .byte $00 ; |        | $D1C4
    .byte $00 ; |        | $D1C5
    .byte $00 ; |        | $D1C6
    .byte $60 ; | XX     | $D1C7
    .byte $20 ; |  X     | $D1C8
    .byte $20 ; |  X     | $D1C9
    .byte $20 ; |  X     | $D1CA
    .byte $26 ; |  X  XX | $D1CB
    .byte $24 ; |  X  X  | $D1CC
    .byte $24 ; |  X  X  | $D1CD
    .byte $26 ; |  X  XX | $D1CE
    .byte $2E ; |  X XXX | $D1CF
    .byte $3E ; |  XXXXX | $D1D0
    .byte $3E ; |  XXXXX | $D1D1
    .byte $3E ; |  XXXXX | $D1D2
    .byte $3C ; |  XXXX  | $D1D3
    .byte $3C ; |  XXXX  | $D1D4
    .byte $3C ; |  XXXX  | $D1D5
    .byte $3C ; |  XXXX  | $D1D6
    .byte $BC ; |X XXXX  | $D1D7
    .byte $BD ; |X XXXX X| $D1D8
    .byte $FD ; |XXXXXX X| $D1D9
    .byte $E7 ; |XXX  XXX| $D1DA
    .byte $5B ; | X XX XX| $D1DB
    .byte $5A ; | X XX X | $D1DC
    .byte $3E ; |  XXXXX | $D1DD
    .byte $18 ; |   XX   | $D1DE
    .byte $00 ; |        | $D1DF
    .byte $18 ; |   XX   | $D1E0
    .byte $18 ; |   XX   | $D1E1
    .byte $18 ; |   XX   | $D1E2
    .byte $18 ; |   XX   | $D1E3
    .byte $18 ; |   XX   | $D1E4
    .byte $00 ; |        | $D1E5
    .byte $18 ; |   XX   | $D1E6
    .byte $00 ; |        | $D1E7
    .byte $00 ; |        | $D1E8
    .byte $00 ; |        | $D1E9
    .byte $00 ; |        | $D1EA
    .byte $00 ; |        | $D1EB
    .byte $00 ; |        | $D1EC
    .byte $00 ; |        | $D1ED
    .byte $00 ; |        | $D1EE
    .byte $00 ; |        | $D1EF
    .byte $00 ; |        | $D1F0
    .byte $00 ; |        | $D1F1
    .byte $00 ; |        | $D1F2
    .byte $00 ; |        | $D1F3
    .byte $00 ; |        | $D1F4
    .byte $00 ; |        | $D1F5
    .byte $00 ; |        | $D1F6
    .byte $00 ; |        | $D1F7
    .byte $00 ; |        | $D1F8
    .byte $00 ; |        | $D1F9
    .byte $00 ; |        | $D1FA
    .byte $00 ; |        | $D1FB
    .byte $00 ; |        | $D1FC
    .byte $00 ; |        | $D1FD
    .byte $00 ; |        | $D1FE
    .byte $00 ; |        | $D1FF
    .byte $00 ; |        | $D200
    .byte $00 ; |        | $D201
    .byte $00 ; |        | $D202
    .byte $00 ; |        | $D203
    .byte $00 ; |        | $D204
    .byte $00 ; |        | $D205
    .byte $00 ; |        | $D206
LD207:
    .byte <LD034         ; $D207
    .byte <LD577         ; $D208
    .byte <LD6EF         ; $D209
    .byte <LDAC5         ; $D20A
    .byte <LD6EF         ; $D20B
    .byte <LD6EF         ; $D20C
LD20D:
    .byte >LD034         ; $D20D
    .byte >LD577         ; $D20E
    .byte >LD6EF         ; $D20F
    .byte >LDAC5         ; $D210
    .byte >LD6EF         ; $D211
    .byte >LD6EF         ; $D212

LD213:
    bcs    LD228                 ; 3   always branch

LD215:
    nop                          ; 2
    nop                          ; 2
    bcs    LD23F                 ; 3   always branch

LD219:
    lda    ram_EB                ; 3
    nop                          ; 2
    nop                          ; 2
    bcs    LD24F                 ; 3   always branch

LD21F:
    lda    ram_EB                ; 3
    lda    #$00                  ; 2
LD223:  ; indirect jump
    bcs    LD213                 ; 2³
    lda    LDA6C,X               ; 4
LD228:
    sta    GRP1                  ; 3
    dex                          ; 2
    lda    ram_ED                ; 3
    sta    COLUPF                ; 3
    sty    ram_EB                ; 3
    ldy    ram_EC                ; 3
    lda    #$C4                  ; 2
    sta    COLUPF                ; 3
    cpy    #$21                  ; 2
    bcs    LD215                 ; 2³
    lda    (ram_93),Y            ; 5
    sta    GRP0                  ; 3
LD23F:
    dec    ram_EC                ; 5
    ldy    ram_EB                ; 3
    cpx    #$10                  ; 2
    bcs    LD219                 ; 2³
    lda    LDA90,X               ; 4
    sta    HMM0                  ; 3
    sta.w  ENAM0                 ; 4
LD24F:
    sta    HMOVE                 ; 3
    dey                          ; 2
    bne    LD21F                 ; 2³
    jmp    LD34A                 ; 3

LD257:
    bcs    LD26E                 ; 3   always branch

LD259:
    sta    COLUPF                ; 3
    nop                          ; 2
    nop                          ; 2
    bcs    LD287                 ; 3   always branch

LD25F:
    lda    ram_EB                ; 3
    nop                          ; 2
    nop                          ; 2
    bcs    LD295                 ; 3   always branch

LD265:
    lda    ram_EB                ; 3
    lda    #$00                  ; 2
LD269:  ; indirect jump
    bcs    LD257                 ; 2³
    lda    LDA6C,X               ; 4
LD26E:
    sta    GRP1                  ; 3
    dex                          ; 2
    sty    ram_EB                ; 3
    ldy    ram_EC                ; 3
    dec    ram_EC                ; 5
    lda    ram_ED                ; 3
    sta    COLUPF                ; 3
    cpy    #$21                  ; 2
    lda    #$C4                  ; 2
    bcs    LD259                 ; 2³
    sta    COLUPF                ; 3
    lda    (ram_93),Y            ; 5
    sta    GRP0                  ; 3
LD287:
    ldy    ram_EB                ; 3
    cpx    #$10                  ; 2
    bcs    LD25F                 ; 2³
    lda    LDA90,X               ; 4
    sta    HMM0                  ; 3
    sta.w  ENAM0                 ; 4
LD295:
    sta    HMOVE                 ; 3
    dey                          ; 2
    bne    LD265                 ; 2³
    jmp    LD34A                 ; 3

LD29D:
    bcs    LD2B7                 ; 3   always branch

LD29F:
    nop                          ; 2
    nop                          ; 2
    ldy    ram_ED                ; 3
    sty.w  COLUPF                ; 4
    bcs    LD2CD                 ; 3   always branch

LD2A8:
    lda    ram_EB                ; 3
    lda    ram_EB                ; 3
    bcs    LD2DE                 ; 3   always branch

LD2AE:
    lda    ram_EB                ; 3
    lda    #$00                  ; 2
LD2B2:  ; indirect jump
    bcs    LD29D                 ; 2³
    lda    LDA6C,X               ; 4
LD2B7:
    sta    GRP1                  ; 3
    dex                          ; 2
    sty    ram_EB                ; 3
    ldy    ram_EC                ; 3
    dec    ram_EC                ; 5
    cpy    #$21                  ; 2
    bcs    LD29F                 ; 2³
    lda    (ram_93),Y            ; 5
    ldy    ram_ED                ; 3
    sty    COLUPF                ; 3
    sta.w  GRP0                  ; 4
LD2CD:
    ldy    ram_EB                ; 3
    lda    #$C4                  ; 2
    sta    COLUPF                ; 3
    cpx    #$10                  ; 2
    bcs    LD2A8                 ; 2³
    lda    LDA90,X               ; 4
    sta    HMM0                  ; 3
    sta    ENAM0                 ; 3
LD2DE:
    sta    HMOVE                 ; 3
    dey                          ; 2
    bne    LD2AE                 ; 2³
    jmp    LD34A                 ; 3

    .byte $00 ; |        | $D2E6
    .byte $02 ; |      X | $D2E7
    .byte $1A ; |   XX X | $D2E8
    .byte $1A ; |   XX X | $D2E9
    .byte $1A ; |   XX X | $D2EA
    .byte $1A ; |   XX X | $D2EB
    .byte $1A ; |   XX X | $D2EC
    .byte $1A ; |   XX X | $D2ED
    .byte $1A ; |   XX X | $D2EE
    .byte $1A ; |   XX X | $D2EF
    .byte $02 ; |      X | $D2F0
    .byte $1A ; |   XX X | $D2F1
    .byte $1A ; |   XX X | $D2F2
    .byte $1A ; |   XX X | $D2F3
    .byte $1A ; |   XX X | $D2F4
    .byte $1A ; |   XX X | $D2F5
    .byte $2A ; |  X X X | $D2F6
    .byte $2A ; |  X X X | $D2F7
    .byte $2A ; |  X X X | $D2F8
    .byte $14 ; |   X X  | $D2F9
LD2FA:
    .byte $06 ; |     XX | $D2FA
    .byte $06 ; |     XX | $D2FB
    .byte $06 ; |     XX | $D2FC
    .byte $06 ; |     XX | $D2FD
    .byte $06 ; |     XX | $D2FE
    .byte $06 ; |     XX | $D2FF
    .byte $06 ; |     XX | $D300
    .byte $06 ; |     XX | $D301
    .byte $06 ; |     XX | $D302
    .byte $04 ; |     X  | $D303
    .byte $08 ; |    X   | $D304
    .byte $0A ; |    X X | $D305

LD306:
    bcs    LD31E                 ; 3   always branch

LD308:
    nop                          ; 2
    nop                          ; 2
    bcs    LD32C                 ; 3   always branch

LD30C:
    ldy    ram_ED                ; 3
    lda    #$00                  ; 2
    sty.w  COLUPF                ; 4
    beq    LD33C                 ; 3   always branch

LD315:
    lda    ram_EB                ; 3
    lda    #$00                  ; 2
LD319:  ; indirect jump
    bcs    LD306                 ; 2³
    lda    LDA6C,X               ; 4
LD31E:
    sta    GRP1                  ; 3
    sty    ram_EB                ; 3
    ldy    ram_EC                ; 3
    cpy    #$21                  ; 2
    bcs    LD308                 ; 2³
    lda    (ram_93),Y            ; 5
    sta    GRP0                  ; 3
LD32C:
    dec    ram_EC                ; 5
    dex                          ; 2
    cpx    #$10                  ; 2
    bcs    LD30C                 ; 2³
    lda    LDA90,X               ; 4
    ldy    ram_ED                ; 3
    sty    COLUPF                ; 3
    sta    HMM0                  ; 3
LD33C:
    ldy    #$C4                  ; 2
    sty.w  COLUPF                ; 4
    ldy    ram_EB                ; 3
    sta    ENAM0                 ; 3
    sta    HMOVE                 ; 3
    dey                          ; 2
    bne    LD315                 ; 2³
LD34A:
    lda    ram_EE                ; 3
    beq    LD35E                 ; 2³
    sty    COLUPF                ; 3
    bcs    LD369                 ; 2³
    lda    LDA6C,X               ; 4
    sta    GRP1                  ; 3
LD357:
    dex                          ; 2
    ldy    #$07                  ; 2
    sty    ram_EB                ; 3
    bne    LD36D                 ; 3   always branch

LD35E:
    sty    COLUBK                ; 3
    sty    COLUPF                ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    jmp    LD97E                 ; 3

LD369:
    sty    GRP1                  ; 3
    bcs    LD357                 ; 3   always branch

LD36D:
    ldy    ram_EC                ; 3
    cpy    #$21                  ; 2
    bcs    LD377                 ; 2³
    lda    (ram_93),Y            ; 5
    sta    GRP0                  ; 3
LD377:
    dec    ram_EC                ; 5
    ldy    #$08                  ; 2
    lda    #$00                  ; 2
    cpx    #$10                  ; 2
    bcs    LD386                 ; 2³
    lda    LDA90,X               ; 4
    sta    HMM0                  ; 3
LD386:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sty    COLUPF                ; 3
    sta    ENAM0                 ; 3
    lda    #$00                  ; 2
    bcs    LD395                 ; 2³
    lda    LDA6C,X               ; 4
LD395:
    sta    GRP1                  ; 3
    dex                          ; 2
    dec    ram_EB                ; 5
    bpl    LD36D                 ; 2³
    dec    ram_EE                ; 5
    ldy    ram_EC                ; 3
    cpy    #$21                  ; 2
    bcs    LD3A8                 ; 2³
    lda    (ram_93),Y            ; 5
    sta    GRP0                  ; 3
LD3A8:
    dec    ram_EC                ; 5
    lda    #$C4                  ; 2
    sta    ram_ED                ; 3
    lda    #$00                  ; 2
    cpx    #$10                  ; 2
    bcs    LD3B9                 ; 2³
    lda    LDA90,X               ; 4
    sta    HMM0                  ; 3
LD3B9:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    ENAM0                 ; 3
    lda    #$00                  ; 2
    bcs    LD3C6                 ; 2³
    lda    LDA6C,X               ; 4
LD3C6:
    sta    GRP1                  ; 3
    dex                          ; 2
    ldy    ram_EE                ; 3
    lda.wy ram_CE,Y              ; 4
    sta    ram_EB                ; 3
    and    #$0F                  ; 2
    cmp    #$09                  ; 2
    bcs    LD3DB                 ; 2³
    sta    ram_EC                ; 3
    jmp    LD46E                 ; 3

LD3DB:
    ldy    ram_EC                ; 3
    cpy    #$21                  ; 2
    bcs    LD3E5                 ; 2³
    lda    (ram_93),Y            ; 5
    sta    GRP0                  ; 3
LD3E5:
    lda    #$00                  ; 2
    cpx    #$10                  ; 2
    bcs    LD3F0                 ; 2³
    lda    LDA90,X               ; 4
    sta    HMM0                  ; 3
LD3F0:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    ENAM0                 ; 3
    lda    #$00                  ; 2
    bcs    LD3FD                 ; 2³
    lda    LDA6C,X               ; 4
LD3FD:
    sta    GRP1                  ; 3
    dex                          ; 2
    dec    ram_EC                ; 5
    ldy    ram_EC                ; 3
    cpy    #$21                  ; 2
    bcs    LD40C                 ; 2³
    lda    (ram_93),Y            ; 5
    sta    GRP0                  ; 3
LD40C:
    dec    ram_EC                ; 5
    lda    #$00                  ; 2
    tay                          ; 2
    cpx    #$10                  ; 2
    bcs    LD41E                 ; 2³
    lda    LDA90,X               ; 4
    sta    HMM0                  ; 3
    tay                          ; 2
    lda    LDA6C,X               ; 4
LD41E:
    dex                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sty    ENAM0                 ; 3
    sta    GRP1                  ; 3
    ldy    ram_EC                ; 3
    cpy    #$21                  ; 2
    bcs    LD431                 ; 2³
    lda    (ram_93),Y            ; 5
    sta    GRP0                  ; 3
LD431:
    dec    ram_EC                ; 5
    ldy    ram_EE                ; 3
    jmp    LD4BB                 ; 3

    .byte $00 ; |        | $D438
    .byte $3C ; |  XXXX  | $D439
    .byte $42 ; | X    X | $D43A
    .byte $81 ; |X      X| $D43B
    .byte $99 ; |X  XX  X| $D43C
    .byte $99 ; |X  XX  X| $D43D
    .byte $81 ; |X      X| $D43E
    .byte $BD ; |X XXXX X| $D43F
    .byte $EB ; |XXX X XX| $D440
    .byte $B7 ; |X XX XXX| $D441
    .byte $5A ; | X XX X | $D442
    .byte $FC ; |XXXXXX  | $D443
    .byte $80 ; |X       | $D444
    .byte $40 ; | X      | $D445
    .byte $40 ; | X      | $D446
    .byte $20 ; |  X     | $D447
    .byte $20 ; |  X     | $D448
    .byte $10 ; |   X    | $D449
    .byte $10 ; |   X    | $D44A
    .byte $00 ; |        | $D44B
    .byte $FF ; |XXXXXXXX| $D44C
    .byte $D5 ; |XX X X X| $D44D
    .byte $BF ; |X XXXXXX| $D44E
    .byte $C3 ; |XX    XX| $D44F
    .byte $66 ; | XX  XX | $D450
    .byte $3C ; |  XXXX  | $D451
    .byte $00 ; |        | $D452
    .byte $7C ; | XXXXX  | $D453
    .byte $C6 ; |XX   XX | $D454
    .byte $FE ; |XXXXXXX | $D455
    .byte $92 ; |X  X  X | $D456
    .byte $92 ; |X  X  X | $D457
    .byte $FE ; |XXXXXXX | $D458
    .byte $C6 ; |XX   XX | $D459
    .byte $7C ; | XXXXX  | $D45A
    .byte $00 ; |        | $D45B
    .byte $0F ; |    XXXX| $D45C
    .byte $0E ; |    XXX | $D45D
    .byte $18 ; |   XX   | $D45E
    .byte $18 ; |   XX   | $D45F
    .byte $38 ; |  XXX   | $D460
    .byte $38 ; |  XXX   | $D461
    .byte $30 ; |  XX    | $D462
    .byte $70 ; | XXX    | $D463
    .byte $60 ; | XX     | $D464
    .byte $60 ; | XX     | $D465
    .byte $60 ; | XX     | $D466
    .byte $40 ; | X      | $D467
    .byte $40 ; | X      | $D468
    .byte $C0 ; |XX      | $D469
LD46A:
    .byte >LD223         ; $D46A
    .byte >LD269         ; $D46B
    .byte >LD2B2         ; $D46C
    .byte >LD319         ; $D46D

LD46E:
    lda    LDCEF,Y               ; 4
    sta    REFP0                 ; 3
    lda    #$00                  ; 2
    tay                          ; 2
    cpx    #$10                  ; 2
    bcs    LD483                 ; 2³
    lda    LDA90,X               ; 4
    sta    HMM0                  ; 3
    tay                          ; 2
    lda    LDA6C,X               ; 4
LD483:
    dex                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP1                  ; 3
    sty    ENAM0                 ; 3
    lda    ram_EB                ; 3
    ldy    ram_EC                ; 3
    cpx    #$10                  ; 2
    nop                          ; 2
LD493:
    dey                          ; 2
    bpl    LD493                 ; 2³
    sta    RESP0                 ; 3
    sta    HMP0                  ; 3
    bcs    LD4A1                 ; 2³
    ldy    LDA90,X               ; 4
    sty    HMM0                  ; 3
LD4A1:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$00                  ; 2
    bcs    LD4AE                 ; 2³
    sty    ENAM0                 ; 3
    lda    LDA6C,X               ; 4
LD4AE:
    sta    GRP1                  ; 3
    dex                          ; 2
    ldy    ram_EE                ; 3
    lda    #$90                  ; 2
    sec                          ; 2
    sbc.wy ram_B7,Y              ; 4
    sta    ram_EC                ; 3
LD4BB:
    lda.wy ram_D6,Y              ; 4
    bpl    LD4CA                 ; 2³
    cmp    #$C0                  ; 2
    and    #$0F                  ; 2
    bcc    LD4CA                 ; 2³
    ldy    ram_86                ; 3
    sty    ram_ED                ; 3
LD4CA:
    tay                          ; 2
    lda    #$00                  ; 2
    sta    HMP0                  ; 3
    cpx    #$10                  ; 2
    bcs    LD4D8                 ; 2³
    lda    LDA90,X               ; 4
    sta    HMM0                  ; 3
LD4D8:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    ENAM0                 ; 3
    lda    #$00                  ; 2
    bcs    LD4E5                 ; 2³
    lda    LDA6C,X               ; 4
LD4E5:
    sta    GRP1                  ; 3
    dex                          ; 2
    lda    LD46A-1,Y             ; 4
    sta    ram_A5                ; 3
    lda    LDCCF-1,Y             ; 4
    sta    ram_A4                ; 3
    ldy    ram_EC                ; 3
    cpy    #$21                  ; 2
    bcs    LD4FC                 ; 2³
    lda    (ram_93),Y            ; 5
    sta    GRP0                  ; 3
LD4FC:
    dec    ram_EC                ; 5
    lda    #$00                  ; 2
    cpx    #$10                  ; 2
    bcs    LD509                 ; 2³
    lda    LDA90,X               ; 4
    sta    HMM0                  ; 3
LD509:
    ldy    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sty    COLUPF                ; 3
    sta    ENAM0                 ; 3
    bcs    LD563                 ; 2³
    ldy    LDA6C,X               ; 4
LD518:
    sty    GRP1                  ; 3
    dex                          ; 2
    ldy    ram_EC                ; 3
    cpy    #$21                  ; 2
    bcs    LD565                 ; 2³
    lda    (ram_93),Y            ; 5
    sta    GRP0                  ; 3
LD525:
    dec    ram_EC                ; 5
    ldy    #$0B                  ; 2
    lda    ram_EE                ; 3
    beq    LD569                 ; 2³
    ldy    #$17                  ; 2
    nop                          ; 2
LD530:
    lda    ram_A4                ; 3
    cmp    #<LD319               ; 2
    beq    LD54C                 ; 2³
    cpx    #$10                  ; 2
    bcs    LD56B                 ; 2³
    lda    LDA90,X               ; 4
    sta    HMM0                  ; 3
    sta    ENAM0                 ; 3
LD541:
    lda    #$C4                  ; 2
    sta    HMOVE                 ; 3
    sta    COLUPF                ; 3
    lda    #$00                  ; 2
    jmp.ind (ram_A4)             ; 5

LD54C:
    cpx    #$10                  ; 2
    bcs    LD571                 ; 2³
    lda    LDA90,X               ; 4
    sta    HMM0                  ; 3
    sta    ENAM0                 ; 3
LD557:
    lda    #$C4                  ; 2
    sta    HMOVE                 ; 3
    sta.w  COLUPF                ; 4
    lda    #$00                  ; 2
    jmp.ind (ram_A4)             ; 5

LD563:
    bcs    LD518                 ; 3   always branch

LD565:
    nop                          ; 2
    nop                          ; 2
    bcs    LD525                 ; 3   always branch

LD569:
    beq    LD530                 ; 3   always branch

LD56B:
    lda    ram_EB                ; 3
    lda    ram_EB                ; 3
    bcs    LD541                 ; 3   always branch

LD571:
    lda    ram_EB                ; 3
    lda    ram_EB                ; 3
    bcs    LD557                 ; 3   always branch

LD577:  ; indirect jump
    ldx    #$07                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    VBLANK                ; 3
    stx    COLUBK                ; 3
    lda    ram_CB                ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    ram_CB                ; 3
LD588:
    dey                          ; 2
    bpl    LD588                 ; 2³
    sta    RESM0                 ; 3
    sta    HMM0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ram_CA                ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    ldx    #$01                  ; 2
    stx    VDELP0                ; 3
    lda.w  ram_CA                ; 4
LD59F:
    dey                          ; 2
    bpl    LD59F                 ; 2³
    sta    RESP1                 ; 3
    sta    RESM1                 ; 3
    sta    HMP1                  ; 3
    sta    HMM1                  ; 3
    stx    HMM0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    CXCLR                 ; 3
    lda    #$C1                  ; 2
    sec                          ; 2
    sbc    ram_A7                ; 3
    tax                          ; 2
    lda    #$0C                  ; 2
    sta    COLUPF                ; 3
    lda    #$18                  ; 2
    sta    COLUP0                ; 3
    iny                          ; 2
    sty    NUSIZ0                ; 3
    sty    HMP1                  ; 3
    lda    #$40                  ; 2
    sta    HMM1                  ; 3
    lda    #$DE                  ; 2
    sta    ram_EC                ; 3
    lda    ram_A5                ; 3
    sta    ram_EB                ; 3
    lda    ram_BD                ; 3
    sta    REFP0                 ; 3
    cpx    #$1D                  ; 2
    bcs    LD5DD                 ; 2³
    lda    ram_82,X              ; 4
    sta    GRP0                  ; 3
LD5DD:
    dex                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sty    GRP1                  ; 3
    lda    ram_DE                ; 3
    lsr                          ; 2
    bcc    LD5EA                 ; 2³
    dey                          ; 2
LD5EA:
    sty    ram_EE                ; 3
    jsr    LDFEB                 ; 6
    lda    #$40                  ; 2
    sta    HMM1                  ; 3
    ldy    #$28                  ; 2
    bne    LD5FB                 ; 3   always branch

LD5F7:
    sta    NUSIZ1                ; 3
    sta    HMCLR                 ; 3
LD5FB:
    cpx    #$1D                  ; 2
    bcs    LD603                 ; 2³+1
    lda    ram_82,X              ; 4
    sta    GRP0                  ; 3
LD603:
    dex                          ; 2
    lda    (ram_EB),Y            ; 5
    and    #$0F                  ; 2
    cpy    #$04                  ; 2
    sta    PF2                   ; 3
    lda    #$00                  ; 2
    bcs    LD613                 ; 2³
    lda    LDF98,Y               ; 4
LD613:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP1                  ; 3
    lda    LDF9C,Y               ; 4
    sta    COLUP1                ; 3
    lda    LDFA0,Y               ; 4
    dey                          ; 2
    bpl    LD5F7                 ; 2³+1
    lda    ram_A6                ; 3
    sta    ram_EB                ; 3
    lda    #$90                  ; 2
    ldy    #$1D                  ; 2
    bne    LD634                 ; 3   always branch

LD62E:
    nop                          ; 2
    bcs    LD63E                 ; 3   always branch

LD631:
    lda    #$00                  ; 2
    nop                          ; 2
LD634:
    sta    HMP1                  ; 3
    cpx    #$1D                  ; 2
    bcs    LD62E                 ; 2³
    lda    ram_82,X              ; 4
    sta    GRP0                  ; 3
LD63E:
    dex                          ; 2
    lda    (ram_EB),Y            ; 5
    and    #$0F                  ; 2
    sta    PF2                   ; 3
    lda    LDE00,Y               ; 4
    and    ram_EE                ; 3
    sta    HMM0                  ; 3
    sta    ENAM0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    LDCB1,Y               ; 4
    sta    GRP1                  ; 3
    lda    LDEC2,Y               ; 4
    sta    NUSIZ0                ; 3
    lda    #$37                  ; 2
    sta    NUSIZ1                ; 3
    sta    ENAM1                 ; 3
    dey                          ; 2
    bpl    LD631                 ; 2³
    ldy    #$49                  ; 2
    lda    ram_A2                ; 3
    sta    ram_EB                ; 3
LD66B:
    cpx    #$1D                  ; 2
    bcs    LD673                 ; 2³
    lda    ram_82,X              ; 4
    sta    GRP0                  ; 3
LD673:
    dex                          ; 2
    cpy    #$46                  ; 2
    bcc    LD687                 ; 2³
    lda    #$10                  ; 2
    sta    HMP1                  ; 3
    lda    #$F0                  ; 2
    sta    HMM1                  ; 3
    bne    LD697                 ; 3   always branch

LD682:
    sta    HMCLR                 ; 3
    jmp    LD697                 ; 3

LD687:
    cpy    #$1C                  ; 2
    bcs    LD682                 ; 2³
    cpy    #$18                  ; 2
    bcc    LD682                 ; 2³
    lda    #$F0                  ; 2
    sta    HMP1                  ; 3
    lda    #$10                  ; 2
    sta    HMM1                  ; 3
LD697:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$27                  ; 2
    cpy    #$1C                  ; 2
    bcs    LD6A3                 ; 2³
    lda    #$37                  ; 2
LD6A3:
    sta    NUSIZ1                ; 3
    lda    LDC67,Y               ; 4
    sta    GRP1                  ; 3
    lda    (ram_EB),Y            ; 5
    and    #$0F                  ; 2
    sta    PF2                   ; 3
    dey                          ; 2
    bpl    LD66B                 ; 2³
    lda    ram_A4                ; 3
    sta    ram_EB                ; 3
    ldy    #$11                  ; 2
    lda    #$70                  ; 2
    sta    HMP1                  ; 3

    .byte $2C ; BIT opcode, skip 2 bytes
LD6BE:
    sta    HMCLR                 ; 3
    cpx    #$1D                  ; 2
    bcs    LD6C8                 ; 2³
    lda    ram_82,X              ; 4
    sta    GRP0                  ; 3
LD6C8:
    lda    #$00                  ; 2
    cpy    #$0E                  ; 2
    bcc    LD6D1                 ; 2³
    lda    LDF97,Y               ; 4
LD6D1:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP1                  ; 3
    sta    ENAM1                 ; 3
    lda    LDF9B,Y               ; 4
    sta    COLUP1                ; 3
    lda    #$02                  ; 2
    sta    NUSIZ1                ; 3
    lda    (ram_EB),Y            ; 5
    and    #$0F                  ; 2
    sta    PF2                   ; 3
    dex                          ; 2
    dey                          ; 2
    bpl    LD6BE                 ; 2³
    jmp    LD972                 ; 3

LD6EF:  ; indirect jump
    ldx    #$88                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    VBLANK                ; 3
    sta    CXCLR                 ; 3
    stx    COLUBK                ; 3
    lda    #$02                  ; 2
    sta    COLUPF                ; 3
    lda    ram_CA                ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    ram_C9                ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    ram_95                ; 3
    sta    REFP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$DE                  ; 2
    sta    ram_EC                ; 3
    sta    ram_EE                ; 3
    lda    #$D8                  ; 2
    sta    COLUP1                ; 3
    lda    ram_C9                ; 3
LD71D:
    dey                          ; 2
    bpl    LD71D                 ; 2³
    sta    RESM0                 ; 3
    sta    HMM0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    #$00                  ; 2
    lda    ram_A4                ; 3
    sta    ram_EB                ; 3
    lda    (ram_93),Y            ; 5
    lda    ram_CA                ; 3
LD732:
    dex                          ; 2
    bpl    LD732                 ; 2³
    sta    RESM1                 ; 3
    sta    HMM1                  ; 3
    sty    HMM0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ram_CD                ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    ram_A5                ; 3
    sta    ram_ED                ; 3
    lda    ram_CD                ; 3
LD74A:
    dex                          ; 2
    bpl    LD74A                 ; 2³
    sta    RESP0                 ; 3
    sta    HMP0                  ; 3
    sty    HMM1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    #$01                  ; 2
    stx    ram_CE                ; 3
    stx    VDELP0                ; 3
    lda    ram_DE                ; 3
    and    #$02                  ; 2
    bne    LD765                 ; 2³
    ldx    #$05                  ; 2
LD765:
    stx    CTRLPF                ; 3
    ldy    #$D9                  ; 2
    lda    ram_96                ; 3
    cmp    #$04                  ; 2
    bcc    LD779                 ; 2³
    lda    #$80                  ; 2
    sta    ram_CE                ; 3
    ldy    #$44                  ; 2
    ldx    #$01                  ; 2
    stx    CTRLPF                ; 3
LD779:
    sty    COLUP0                ; 3
    ldx    #$56                  ; 2
    ldy    #$17                  ; 2
    lda    ram_D4                ; 3
    cmp    #$04                  ; 2
    bne    LD789                 ; 2³
    ldx    #$70                  ; 2
    ldy    #$40                  ; 2
LD789:
    sty    ram_D0                ; 3
    stx    ram_D1                ; 3
    sta    HMCLR                 ; 3
    ldy    #$0C                  ; 2
LD791:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    LD15D,Y               ; 4
    sta    COLUBK                ; 3
    lda    LDAB7,Y               ; 4
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    ldx    #$00                  ; 2
    lda    ram_96                ; 3
    cmp    #$03                  ; 2
    bne    LD7B1                 ; 2³
    bit    ram_DD                ; 3
    bmi    LD7B1                 ; 2³
    ldx    #$02                  ; 2
LD7B1:
    stx    ram_D3                ; 3
    ldx    #$04                  ; 2
    bit    ram_E0                ; 3
    bvc    LD7BB                 ; 2³
    ldx    #$14                  ; 2
LD7BB:
    stx    ram_CF                ; 3
    dey                          ; 2
    bpl    LD791                 ; 2³
    ldy    #$06                  ; 2
LD7C2:
    lda    #$80                  ; 2
    sec                          ; 2
    sbc    ram_A3                ; 3
    tax                          ; 2
    lda    LD14F,Y               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    PF1                   ; 3
    lda    LD156,Y               ; 4
    sta    PF2                   ; 3
    lda    #$08                  ; 2
    sta    COLUPF                ; 3
    sta    NUSIZ1                ; 3
    sta    NUSIZ0                ; 3
    dey                          ; 2
    bpl    LD7C2                 ; 2³
    lda    #$80                  ; 2
    sec                          ; 2
    sbc    ram_97                ; 3
    sta    ram_CA                ; 3
    ldy    #$00                  ; 2
    lda    (ram_93),Y            ; 5
    lda    ram_D4                ; 3
    cmp    #$04                  ; 2
    bne    LD7F4                 ; 2³
    ldy    #$87                  ; 2
LD7F4:
    sty    NUSIZ1                ; 3
    sty    ram_D2                ; 3
    ldy    #$7F                  ; 2
    lda    ram_CF                ; 3
    sta    COLUPF                ; 3
    lda    #$1F                  ; 2
    bne    LD81E                 ; 3   always branch

LD802:
    lda    ram_EB                ; 3
    bcs    LD813                 ; 3   always branch

LD806:
    sty    ram_C9                ; 3
    ldy    ram_CA                ; 3
    cpy    #$0D                  ; 2
    bcs    LD802                 ; 2³
    lda    LDAA0,Y               ; 4
    sta    GRP0                  ; 3
LD813:
    ldy    ram_C9                ; 3
    lda    LDD00,Y               ; 4
    nop                          ; 2
    nop                          ; 2
    sta    PF2                   ; 3
    and    #$1F                  ; 2
LD81E:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    PF1                   ; 3
    lda    #$00                  ; 2
    cpx    #$11                  ; 2
    bcs    LD82D                 ; 2³
    lda    LD16C,X               ; 4
LD82D:
    sta    GRP1                  ; 3
    dec    ram_CA                ; 5
    dex                          ; 2
    dey                          ; 2
    cpy    ram_D1                ; 3
    bne    LD806                 ; 2³
    lda    ram_D3                ; 3
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    lda    #$01                  ; 2
    sta    CTRLPF                ; 3
    sty    ram_C9                ; 3
    ldy    ram_CA                ; 3
    cpy    #$0D                  ; 2
    bcs    LD84E                 ; 2³
    lda    LDAA0,Y               ; 4
    sta    GRP0                  ; 3
LD84E:
    ldy    ram_C9                ; 3
    lda    #$1F                  ; 2
    bne    LD879                 ; 3   always branch

LD854:
    sty    ram_C9                ; 3
    bit    ram_CE                ; 3
    bpl    LD86A                 ; 2³
    ldy    ram_CA                ; 3
    cpy    #$0D                  ; 2
    bcs    LD865                 ; 2³
    lda    LDAA0,Y               ; 4
    sta    GRP0                  ; 3
LD865:
    ldy    ram_C9                ; 3
    jmp    LD872                 ; 3

LD86A:
    lda    (ram_EB),Y            ; 5
    sta    HMM0                  ; 3
    lda    (ram_ED),Y            ; 5
    sta    HMM1                  ; 3
LD872:
    lda    LDD00,Y               ; 4
    sta    PF2                   ; 3
    and    #$1F                  ; 2
LD879:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    PF1                   ; 3
    lda    #$00                  ; 2
    cpx    #$11                  ; 2
    bcs    LD888                 ; 2³
    lda    LD16C,X               ; 4
LD888:
    sta    GRP1                  ; 3
    dex                          ; 2
    dec    ram_CA                ; 5
    dey                          ; 2
    cpy    ram_D0                ; 3
    bne    LD854                 ; 2³
    lda    ram_CC                ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    ram_CB                ; 3
    and    #$0F                  ; 2
    sta    ram_EB                ; 3
    sty    ram_EC                ; 3
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ram_98                ; 3
    sta    REFP0                 ; 3
    ldy    #$00                  ; 2
    lda    #$00                  ; 2
    lda    ram_CC                ; 3
LD8B3:
    dex                          ; 2
    bpl    LD8B3                 ; 2³
    sta    RESP1                 ; 3
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ram_99                ; 3
    sta    REFP1                 ; 3
    ldx    ram_EB                ; 3
    lda    #$00                  ; 2
    lda    ram_CB                ; 3
LD8C8:
    dex                          ; 2
    bpl    LD8C8                 ; 2³
    ldx    #$0C                  ; 2
    sta    RESP0                 ; 3
    sta    HMP0                  ; 3
    sty    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sty    ENAM0                 ; 3
    sty    ENAM1                 ; 3
    stx    COLUP1                ; 3
    rol    ram_95                ; 5
    lda    CXPPMM                ; 3
    asl                          ; 2
    ror    ram_95                ; 5
    ldy    ram_EC                ; 3
    dey                          ; 2
    dey                          ; 2
    sta    HMCLR                 ; 3
LD8EA:
    ldx    #$02                  ; 2
    cpy    #$15                  ; 2
    bcs    LD91C                 ; 2³+1
    ldx    LDEE7,Y               ; 4
    lda    (ram_A7),Y            ; 5
    sta    GRP0                  ; 3
LD8F7:
    lda    ram_D2                ; 3
    asl                          ; 2
    lda    LDD00,Y               ; 4
    sta    PF2                   ; 3
    and    #$1F                  ; 2
    sta    PF1                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    (ram_A9),Y            ; 5
    sta    GRP1                  ; 3
    stx    COLUBK                ; 3
    lda    (ram_9F),Y            ; 5
    sta    COLUP0                ; 3
    bcs    LD917                 ; 2³
    lda    (ram_A1),Y            ; 5
    sta    COLUP1                ; 3
LD917:
    dey                          ; 2
    bpl    LD8EA                 ; 2³+1
    bmi    LD922                 ; 3   always branch

LD91C:
    lda    ram_EB                ; 3
    lda    ram_EB                ; 3
    bcs    LD8F7                 ; 3+1   always branch

LD922:
    iny                          ; 2
    sty    REFP1                 ; 3
    ldy    #$0C                  ; 2
    lda    ram_96                ; 3
    cmp    #$02                  ; 2
    bcs    LD940                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$06                  ; 2
    sta    COLUBK                ; 3
    lda    (ram_9B),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_9D),Y            ; 5
    sta    COLUP1                ; 3
    dey                          ; 2
    bne    LD958                 ; 2³
LD940:
    lda    ram_CD                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    #$06                  ; 2
    sta    COLUBK                ; 3
    dey                          ; 2
    inx                          ; 2
    lda    ram_CD                ; 3
LD951:
    dex                          ; 2
    bne    LD951                 ; 2³
    sta    RESP1                 ; 3
    sta    HMP1                  ; 3
LD958:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    LD2FA,Y               ; 4
    sta    COLUBK                ; 3
    lda    (ram_9B),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_9D),Y            ; 5
    sta    COLUP1                ; 3
    sta    HMCLR                 ; 3
    stx    ENAM0                 ; 3
    stx    ENAM1                 ; 3
    dey                          ; 2
    bpl    LD958                 ; 2³
LD972:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    #$00                  ; 2
    sty    COLUBK                ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
LD97E:
    sty    PF0                   ; 3
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    sty    REFP0                 ; 3
    sty    REFP1                 ; 3
    iny                          ; 2
    sty    VDELP1                ; 3
    sty    CTRLPF                ; 3
    ldx    #$80                  ; 2
    ldy    ram_D4                ; 3
    cpy    #$03                  ; 2
    bne    LD997                 ; 2³
    ldx    #$88                  ; 2
LD997:
    stx    ram_ED                ; 3
    ldx    #$DF                  ; 2
    stx    ram_EE                ; 3
    lda    #$84                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    COLUBK                ; 3
    stx    ram_CB                ; 3
    stx    ram_CD                ; 3
    stx    ram_CF                ; 3
    lda    ram_F9                ; 3
    sta    ram_CA                ; 3
    lda    ram_FA                ; 3
    sta    ram_CC                ; 3
    lda    ram_FB                ; 3
    sta    ram_CE                ; 3
    cpy    #$03                  ; 2
    bne    LD9CC                 ; 2³
    lda    ram_BC                ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$BF                  ; 2
    sta    ram_D0                ; 3
    clc                          ; 2
    adc    #$08                  ; 2
    ldx    #$DD                  ; 2
    bne    LD9DC                 ; 3   always branch

LD9CC:
    ldy    #$90                  ; 2
    lda    ram_C0                ; 3
    cmp    #$0A                  ; 2
    bne    LD9D6                 ; 2³
    sty    ram_ED                ; 3
LD9D6:
    lda    ram_FC                ; 3
    sta    ram_D0                ; 3
    lda    ram_FD                ; 3
LD9DC:
    sta    ram_D2                ; 3
    stx    ram_D1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    stx    ram_D3                ; 3
    lda    #$0C                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldx    #$F3                  ; 2
    stx    NUSIZ0                ; 3
    stx.w  NUSIZ1                ; 4
    lda    #$40                  ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    stx    HMP0                  ; 3
    jsr    LDFAD                 ; 6
    ldx    #$06                  ; 2
    ldy    #$04                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
LDA06:
    lda.wy ram_F2,Y              ; 4
    sta    ram_CA,X              ; 4
    dex                          ; 2
    dex                          ; 2
    dey                          ; 2
    bne    LDA06                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sty    COLUBK                ; 3
    ldx    #$90                  ; 2
    lda    ram_C0                ; 3
    cmp    #$0A                  ; 2
    beq    LDA28                 ; 2³
    ldx    ram_F2                ; 3
    lda    ram_C0                ; 3
    and    #$F0                  ; 2
    bne    LDA28                 ; 2³
    ldx    #$88                  ; 2
LDA28:
    stx    ram_ED                ; 3
    lda    #$DF                  ; 2
    sta    ram_D1                ; 3
    sta    ram_D3                ; 3
    lda    #$84                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ram_F7                ; 3
    sta.w  ram_D2                ; 4
    jsr    LDFEB                 ; 6
    jsr    LDFEB                 ; 6
    jsr    LDFAD                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$1E                  ; 2
    ldx    #$82                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    TIM64T                ; 4
    stx    VBLANK                ; 3
    ldx    #$00                  ; 2
    stx    VDELP0                ; 3
    stx    VDELP1                ; 3
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    stx    GRP0                  ; 3
    stx    PF1                   ; 3
    stx    ENABL                 ; 3
    jmp    LDFF2                 ; 3

LDA6C:
    .byte $00 ; |        | $DA6C
    .byte $38 ; |  XXX   | $DA6D
    .byte $7C ; | XXXXX  | $DA6E
    .byte $E6 ; |XXX  XX | $DA6F
    .byte $F6 ; |XXXX XX | $DA70
    .byte $FC ; |XXXXXX  | $DA71
    .byte $BE ; |X XXXXX | $DA72
    .byte $9E ; |X  XXXX | $DA73
    .byte $CE ; |XX  XXX | $DA74
    .byte $E6 ; |XXX  XX | $DA75
    .byte $F6 ; |XXXX XX | $DA76
    .byte $7C ; | XXXXX  | $DA77
    .byte $38 ; |  XXX   | $DA78
    .byte $00 ; |        | $DA79
    .byte $00 ; |        | $DA7A
    .byte $00 ; |        | $DA7B
    .byte $00 ; |        | $DA7C
    .byte $1F ; |   XXXXX| $DA7D
    .byte $39 ; |  XXX  X| $DA7E
    .byte $30 ; |  XX    | $DA7F
    .byte $70 ; | XXX    | $DA80
    .byte $78 ; | XXXX   | $DA81
    .byte $74 ; | XXX X  | $DA82
    .byte $64 ; | XX  X  | $DA83
    .byte $30 ; |  XX    | $DA84
    .byte $30 ; |  XX    | $DA85
    .byte $30 ; |  XX    | $DA86
    .byte $00 ; |        | $DA87
    .byte $00 ; |        | $DA88
    .byte $00 ; |        | $DA89
    .byte $00 ; |        | $DA8A
    .byte $00 ; |        | $DA8B
    .byte $00 ; |        | $DA8C
    .byte $00 ; |        | $DA8D
    .byte $00 ; |        | $DA8E
    .byte $00 ; |        | $DA8F
LDA90:
    .byte $00 ; |        | $DA90
    .byte $00 ; |        | $DA91
    .byte $00 ; |        | $DA92
    .byte $12 ; |   X  X | $DA93
    .byte $12 ; |   X  X | $DA94
    .byte $12 ; |   X  X | $DA95
    .byte $A2 ; |X X   X | $DA96
    .byte $12 ; |   X  X | $DA97
    .byte $12 ; |   X  X | $DA98
    .byte $12 ; |   X  X | $DA99
    .byte $02 ; |      X | $DA9A
    .byte $02 ; |      X | $DA9B
    .byte $02 ; |      X | $DA9C
    .byte $12 ; |   X  X | $DA9D
    .byte $C2 ; |XX    X | $DA9E
    .byte $00 ; |        | $DA9F
LDAA0:
    .byte $18 ; |   XX   | $DAA0
    .byte $3C ; |  XXXX  | $DAA1
    .byte $66 ; | XX  XX | $DAA2
    .byte $42 ; | X    X | $DAA3
    .byte $C3 ; |XX    XX| $DAA4
    .byte $A1 ; |X X    X| $DAA5
    .byte $B1 ; |X XX   X| $DAA6
    .byte $99 ; |X  XX  X| $DAA7
    .byte $8D ; |X   XX X| $DAA8
    .byte $C7 ; |XX   XXX| $DAA9
    .byte $42 ; | X    X | $DAAA
    .byte $66 ; | XX  XX | $DAAB
    .byte $3C ; |  XXXX  | $DAAC
    .byte $1A ; |   XX X | $DAAD
    .byte $1A ; |   XX X | $DAAE
    .byte $02 ; |      X | $DAAF
    .byte $1A ; |   XX X | $DAB0
    .byte $1A ; |   XX X | $DAB1
    .byte $1A ; |   XX X | $DAB2
    .byte $1A ; |   XX X | $DAB3
    .byte $2A ; |  X X X | $DAB4
    .byte $2A ; |  X X X | $DAB5
    .byte $14 ; |   X X  | $DAB6
LDAB7:
    .byte $00 ; |        | $DAB7
    .byte $7B ; | XXXX XX| $DAB8
    .byte $7B ; | XXXX XX| $DAB9
    .byte $69 ; | XX X  X| $DABA
    .byte $69 ; | XX X  X| $DABB
    .byte $69 ; | XX X  X| $DABC
    .byte $60 ; | XX     | $DABD
    .byte $60 ; | XX     | $DABE
    .byte $00 ; |        | $DABF
    .byte $00 ; |        | $DAC0
    .byte $00 ; |        | $DAC1
    .byte $00 ; |        | $DAC2
    .byte $00 ; |        | $DAC3
    .byte $00 ; |        | $DAC4

LDAC5:  ; indirect jump
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    VBLANK                ; 3
    ldx    #$06                  ; 2
    stx    COLUBK                ; 3
    stx    COLUPF                ; 3
    lda    #$DF                  ; 2
    sta    ram_90                ; 3
    ldy    #$04                  ; 2
    sty    ram_EE                ; 3
    lda    #$A0                  ; 2
    sec                          ; 2
    sbc    ram_91                ; 3
    tax                          ; 2
    lda    #$70                  ; 2
    sta    RESP1                 ; 3
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$D4                  ; 2
    sta    ram_94                ; 3
    bne    LDB21                 ; 3+1   always branch

LDAEF:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jmp    LD972                 ; 3

LDAF6:
    lda    #$00                  ; 2
    cpy    ram_92                ; 3
    bcs    LDB06                 ; 2³+1
    lda    (ram_8F),Y            ; 5
    sta    GRP1                  ; 3
    lda    #$8A                  ; 2
    sta    COLUP1                ; 3
    lda    (ram_93),Y            ; 5
LDB06:
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$00                  ; 2
    cpx    #$08                  ; 2
    bcs    LDB15                 ; 2³
    lda    LDBB6,X               ; 4
LDB15:
    sta    GRP1                  ; 3
    lda    ram_EC                ; 3
    sta    COLUP1                ; 3
    dex                          ; 2
    dey                          ; 2
    dec    ram_EB                ; 5
    bpl    LDAF6                 ; 2³+1
LDB21:
    dec    ram_EE                ; 5
    bmi    LDAEF                 ; 2³+1
    ldy    ram_EE                ; 3
    lda    LDEFC,Y               ; 4
    sta    ram_93                ; 3
    stx    ram_EC                ; 3
    sta    HMCLR                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    LDCD3,Y               ; 4
    sta    ram_92                ; 3
    ldx    #$00                  ; 2
    lda    ram_DE                ; 3
    cpy    #$01                  ; 2
    and    LDBAA,Y               ; 4
    sta    ram_ED                ; 3
    beq    LDB49                 ; 2³
    bcc    LDB49                 ; 2³
    dex                          ; 2
LDB49:
    ldy    #$90                  ; 2
    lda    #$00                  ; 2
    bcs    LDB57                 ; 2³
    lda    ram_ED                ; 3
    beq    LDB57                 ; 2³
    lsr                          ; 2
    tay                          ; 2
    lda    #$04                  ; 2
LDB57:
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$FF                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sty    ram_8F                ; 3
    sta    VDELP0                ; 3
    sta    PF2                   ; 3
    lda    #$1F                  ; 2
    sta    PF1                   ; 3
    cpx    #$01                  ; 2
    ldx    ram_EC                ; 3
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
    bcc    LDB7A                 ; 2³
    jsr    LDFEB                 ; 6
    jsr    LDFEB                 ; 6
LDB7A:
    sta    RESP0                 ; 3
    lda    #$40                  ; 2
    sta    HMP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$00                  ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    COLUPF                ; 3
    lda    ram_80                ; 3
    and    #$10                  ; 2
    beq    LDB94                 ; 2³
    lda    #$0A                  ; 2
LDB94:
    sta    ram_EC                ; 3
    ldy    #$25                  ; 2
    sty    ram_EB                ; 3
    ldy    ram_EE                ; 3
    lda    LDBB2,Y               ; 4
    sta    COLUP0                ; 3
    lda    LDBAE,Y               ; 4
    tay                          ; 2
    sta    HMCLR                 ; 3
    jmp    LDAF6                 ; 3

LDBAA:
    .byte $F0 ; |XXXX    | $DBAA
    .byte $01 ; |       X| $DBAB
    .byte $08 ; |    X   | $DBAC
    .byte $02 ; |      X | $DBAD
LDBAE:
    .byte $16 ; |   X XX | $DBAE
    .byte $1A ; |   XX X | $DBAF
    .byte $1C ; |   XXX  | $DBB0
    .byte $16 ; |   X XX | $DBB1
LDBB2:
    .byte $DA ; |XX XX X | $DBB2
    .byte $1C ; |   XXX  | $DBB3
    .byte $0C ; |    XX  | $DBB4
    .byte $8A ; |X   X X | $DBB5
LDBB6:
    .byte $00 ; |        | $DBB6
    .byte $18 ; |   XX   | $DBB7
    .byte $30 ; |  XX    | $DBB8
    .byte $60 ; | XX     | $DBB9
    .byte $FF ; |XXXXXXXX| $DBBA
    .byte $60 ; | XX     | $DBBB
    .byte $30 ; |  XX    | $DBBC
    .byte $18 ; |   XX   | $DBBD
    .byte $00 ; |        | $DBBE
    .byte $18 ; |   XX   | $DBBF
    .byte $00 ; |        | $DBC0
    .byte $18 ; |   XX   | $DBC1
    .byte $18 ; |   XX   | $DBC2
    .byte $3C ; |  XXXX  | $DBC3
    .byte $FF ; |XXXXXXXX| $DBC4
    .byte $FF ; |XXXXXXXX| $DBC5
    .byte $BD ; |X XXXX X| $DBC6
    .byte $BD ; |X XXXX X| $DBC7
    .byte $BD ; |X XXXX X| $DBC8
    .byte $3C ; |  XXXX  | $DBC9
    .byte $66 ; | XX  XX | $DBCA
    .byte $66 ; | XX  XX | $DBCB

LDBCC:
    ldx    #$0B                  ; 2
LDBCE:
    lda    ram_AB,X              ; 4
    ldy    #$FD                  ; 2
    sec                          ; 2
LDBD3:
    iny                          ; 2
    sbc    #$0F                  ; 2
    bcs    LDBD3                 ; 2³
    sty    ram_C8,X              ; 4
    eor    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$90                  ; 2
    and    #$F0                  ; 2
    ora    ram_C8,X              ; 4
    sta    ram_C8,X              ; 4
    dex                          ; 2
    bpl    LDBCE                 ; 2³
    ldx    #$04                  ; 2
LDBED:
    lda    ram_B7,X              ; 4
    cmp    #$02                  ; 2
    bcs    LDBF7                 ; 2³
    lda    #$09                  ; 2
    sta    ram_CE,X              ; 4
LDBF7:
    dex                          ; 2
    bpl    LDBED                 ; 2³
    inc    ram_80                ; 5
    bne    LDC11                 ; 2³+1
    inc    ram_C7                ; 5
    lda    ram_C7                ; 3
    and    #$C7                  ; 2
    sta    ram_C7                ; 3
    and    #$07                  ; 2
    bne    LDC11                 ; 2³
    inc    ram_C6                ; 5
    bne    LDC11                 ; 2³
    sec                          ; 2
    ror    ram_C6                ; 5
LDC11:
    lda    ram_81                ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    eor    ram_81                ; 3
    asl                          ; 2
    rol    ram_81                ; 5
    lda    ram_80                ; 3
    and    #$10                  ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_EB                ; 3
    ldx    #$04                  ; 2
LDC25:
    lda    ram_D6,X              ; 4
    bpl    LDC2F                 ; 2³
    and    #$BF                  ; 2
    ora    ram_EB                ; 3
    sta    ram_D6,X              ; 4
LDC2F:
    dex                          ; 2
    bpl    LDC25                 ; 2³
    ldx    #$05                  ; 2
LDC34:
    txa                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda    ram_C0,X              ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    sta.wy ram_F2,Y              ; 5
    lda    ram_C0,X              ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta.wy ram_F3,Y              ; 5
    dex                          ; 2
    bpl    LDC34                 ; 2³
    inx                          ; 2
    ldy    #$90                  ; 2
LDC4F:
    lda    ram_F2,X              ; 4
    beq    LDC5B                 ; 2³
    cpx    #$06                  ; 2
    bcs    LDC66                 ; 2³
    ldx    #$06                  ; 2
    bne    LDC4F                 ; 3   always branch

LDC5B:
    cpx    #$05                  ; 2
    beq    LDC61                 ; 2³
    sty    ram_F2,X              ; 4
LDC61:
    inx                          ; 2
    cpx    #$0B                  ; 2
    bcc    LDC4F                 ; 2³
LDC66:
    rts                          ; 6

LDC67:
    .byte $87 ; |X    XXX| $DC67
    .byte $FF ; |XXXXXXXX| $DC68
    .byte $FF ; |XXXXXXXX| $DC69
    .byte $FF ; |XXXXXXXX| $DC6A
    .byte $03 ; |      XX| $DC6B
    .byte $03 ; |      XX| $DC6C
    .byte $03 ; |      XX| $DC6D
    .byte $87 ; |X    XXX| $DC6E
    .byte $87 ; |X    XXX| $DC6F
    .byte $FF ; |XXXXXXXX| $DC70
    .byte $7B ; | XXXX XX| $DC71
    .byte $7B ; | XXXX XX| $DC72
    .byte $7B ; | XXXX XX| $DC73
    .byte $7B ; | XXXX XX| $DC74
    .byte $7B ; | XXXX XX| $DC75
    .byte $7B ; | XXXX XX| $DC76
    .byte $7B ; | XXXX XX| $DC77
    .byte $7B ; | XXXX XX| $DC78
    .byte $7B ; | XXXX XX| $DC79
    .byte $7B ; | XXXX XX| $DC7A
    .byte $7B ; | XXXX XX| $DC7B
    .byte $7B ; | XXXX XX| $DC7C
    .byte $7B ; | XXXX XX| $DC7D
    .byte $7B ; | XXXX XX| $DC7E
    .byte $FF ; |XXXXXXXX| $DC7F
    .byte $FF ; |XXXXXXXX| $DC80
    .byte $FF ; |XXXXXXXX| $DC81
    .byte $FF ; |XXXXXXXX| $DC82
    .byte $3D ; |  XXXX X| $DC83
    .byte $3D ; |  XXXX X| $DC84
    .byte $3D ; |  XXXX X| $DC85
    .byte $3D ; |  XXXX X| $DC86
    .byte $3D ; |  XXXX X| $DC87
    .byte $3D ; |  XXXX X| $DC88
    .byte $3D ; |  XXXX X| $DC89
    .byte $3D ; |  XXXX X| $DC8A
    .byte $3D ; |  XXXX X| $DC8B
    .byte $3D ; |  XXXX X| $DC8C
    .byte $3D ; |  XXXX X| $DC8D
    .byte $3D ; |  XXXX X| $DC8E
    .byte $3D ; |  XXXX X| $DC8F
    .byte $3D ; |  XXXX X| $DC90
    .byte $3D ; |  XXXX X| $DC91
    .byte $3D ; |  XXXX X| $DC92
    .byte $FF ; |XXXXXXXX| $DC93
    .byte $3D ; |  XXXX X| $DC94
    .byte $3D ; |  XXXX X| $DC95
    .byte $3D ; |  XXXX X| $DC96
    .byte $3D ; |  XXXX X| $DC97
    .byte $3D ; |  XXXX X| $DC98
    .byte $3D ; |  XXXX X| $DC99
    .byte $3D ; |  XXXX X| $DC9A
    .byte $3D ; |  XXXX X| $DC9B
    .byte $3D ; |  XXXX X| $DC9C
    .byte $3D ; |  XXXX X| $DC9D
    .byte $FF ; |XXXXXXXX| $DC9E
    .byte $3D ; |  XXXX X| $DC9F
    .byte $3D ; |  XXXX X| $DCA0
    .byte $3D ; |  XXXX X| $DCA1
    .byte $3D ; |  XXXX X| $DCA2
    .byte $3D ; |  XXXX X| $DCA3
    .byte $3D ; |  XXXX X| $DCA4
    .byte $3D ; |  XXXX X| $DCA5
    .byte $FF ; |XXXXXXXX| $DCA6
    .byte $FF ; |XXXXXXXX| $DCA7
    .byte $FF ; |XXXXXXXX| $DCA8
    .byte $FF ; |XXXXXXXX| $DCA9
    .byte $FF ; |XXXXXXXX| $DCAA
    .byte $FF ; |XXXXXXXX| $DCAB
    .byte $01 ; |       X| $DCAC
    .byte $01 ; |       X| $DCAD
    .byte $01 ; |       X| $DCAE
    .byte $01 ; |       X| $DCAF
    .byte $01 ; |       X| $DCB0
LDCB1:
    .byte $87 ; |X    XXX| $DCB1
    .byte $FF ; |XXXXXXXX| $DCB2
    .byte $FF ; |XXXXXXXX| $DCB3
    .byte $FF ; |XXXXXXXX| $DCB4
    .byte $FF ; |XXXXXXXX| $DCB5
    .byte $FF ; |XXXXXXXX| $DCB6
    .byte $FF ; |XXXXXXXX| $DCB7
    .byte $FF ; |XXXXXXXX| $DCB8
    .byte $FF ; |XXXXXXXX| $DCB9
    .byte $FF ; |XXXXXXXX| $DCBA
    .byte $FF ; |XXXXXXXX| $DCBB
    .byte $FF ; |XXXXXXXX| $DCBC
    .byte $FF ; |XXXXXXXX| $DCBD
    .byte $FF ; |XXXXXXXX| $DCBE
    .byte $FF ; |XXXXXXXX| $DCBF
    .byte $FF ; |XXXXXXXX| $DCC0
    .byte $FF ; |XXXXXXXX| $DCC1
    .byte $FF ; |XXXXXXXX| $DCC2
    .byte $FF ; |XXXXXXXX| $DCC3
    .byte $FF ; |XXXXXXXX| $DCC4
    .byte $FF ; |XXXXXXXX| $DCC5
    .byte $FF ; |XXXXXXXX| $DCC6
    .byte $FF ; |XXXXXXXX| $DCC7
    .byte $FF ; |XXXXXXXX| $DCC8
    .byte $FF ; |XXXXXXXX| $DCC9
    .byte $FF ; |XXXXXXXX| $DCCA
    .byte $FF ; |XXXXXXXX| $DCCB
    .byte $FF ; |XXXXXXXX| $DCCC
    .byte $7B ; | XXXX XX| $DCCD
    .byte $33 ; |  XX  XX| $DCCE
LDCCF:
    .byte <LD223         ; $DCCF
    .byte <LD269         ; $DCD0
    .byte <LD2B2         ; $DCD1
    .byte <LD319         ; $DCD2
LDCD3:
    .byte $07 ; |     XXX| $DCD3
    .byte $0F ; |    XXXX| $DCD4
    .byte $13 ; |   X  XX| $DCD5
    .byte $09 ; |    X  X| $DCD6
LDCD7:
    .byte $14 ; |   X X  | $DCD7
    .byte $14 ; |   X X  | $DCD8
    .byte $14 ; |   X X  | $DCD9
    .byte $12 ; |   X  X | $DCDA
    .byte $10 ; |   X    | $DCDB
    .byte $08 ; |    X   | $DCDC
    .byte $06 ; |     XX | $DCDD
    .byte $04 ; |     X  | $DCDE
    .byte $04 ; |     X  | $DCDF
    .byte $02 ; |      X | $DCE0
    .byte $00 ; |        | $DCE1
    .byte $00 ; |        | $DCE2
LDCE3:
    .byte $00 ; |        | $DCE3
    .byte $F7 ; |XXXX XXX| $DCE4
    .byte $45 ; | X   X X| $DCE5
    .byte $25 ; |  X  X X| $DCE6
    .byte $15 ; |   X X X| $DCE7
    .byte $F5 ; |XXXX X X| $DCE8
    .byte $00 ; |        | $DCE9
    .byte $00 ; |        | $DCEA
    .byte $00 ; |        | $DCEB
    .byte $00 ; |        | $DCEC
    .byte $00 ; |        | $DCED
    .byte $00 ; |        | $DCEE
LDCEF:
    .byte $FF ; |XXXXXXXX| $DCEF
    .byte $55 ; | X X X X| $DCF0
    .byte $FF ; |XXXXXXXX| $DCF1
    .byte $42 ; | X    X | $DCF2
    .byte $3C ; |  XXXX  | $DCF3
    .byte $3C ; |  XXXX  | $DCF4
    .byte $00 ; |        | $DCF5
    .byte $00 ; |        | $DCF6
LDCF7:
    .byte $00 ; |        | $DCF7
    .byte $77 ; | XXX XXX| $DCF8
    .byte $54 ; | X X X  | $DCF9
    .byte $54 ; | X X X  | $DCFA
    .byte $54 ; | X X X  | $DCFB
    .byte $54 ; | X X X  | $DCFC
    .byte $00 ; |        | $DCFD
    .byte $00 ; |        | $DCFE
    .byte $00 ; |        | $DCFF
LDD00:
    .byte $00 ; |        | $DD00
    .byte $00 ; |        | $DD01
    .byte $00 ; |        | $DD02
    .byte $00 ; |        | $DD03
    .byte $FF ; |XXXXXXXX| $DD04
    .byte $FF ; |XXXXXXXX| $DD05
    .byte $FF ; |XXXXXXXX| $DD06
    .byte $FF ; |XXXXXXXX| $DD07
    .byte $FF ; |XXXXXXXX| $DD08
    .byte $FF ; |XXXXXXXX| $DD09
    .byte $FF ; |XXXXXXXX| $DD0A
    .byte $FF ; |XXXXXXXX| $DD0B
    .byte $FF ; |XXXXXXXX| $DD0C
    .byte $FF ; |XXXXXXXX| $DD0D
    .byte $FF ; |XXXXXXXX| $DD0E
    .byte $FF ; |XXXXXXXX| $DD0F
    .byte $FF ; |XXXXXXXX| $DD10
    .byte $FF ; |XXXXXXXX| $DD11
    .byte $FF ; |XXXXXXXX| $DD12
    .byte $FF ; |XXXXXXXX| $DD13
    .byte $FF ; |XXXXXXXX| $DD14
    .byte $FF ; |XXXXXXXX| $DD15
    .byte $FF ; |XXXXXXXX| $DD16
    .byte $FF ; |XXXXXXXX| $DD17
    .byte $FF ; |XXXXXXXX| $DD18
    .byte $99 ; |X  XX  X| $DD19
    .byte $99 ; |X  XX  X| $DD1A
    .byte $FF ; |XXXXXXXX| $DD1B
    .byte $99 ; |X  XX  X| $DD1C
    .byte $99 ; |X  XX  X| $DD1D
    .byte $FF ; |XXXXXXXX| $DD1E
    .byte $FF ; |XXXXXXXX| $DD1F
    .byte $FF ; |XXXXXXXX| $DD20
    .byte $FF ; |XXXXXXXX| $DD21
    .byte $FF ; |XXXXXXXX| $DD22
    .byte $FF ; |XXXXXXXX| $DD23
    .byte $FF ; |XXXXXXXX| $DD24
    .byte $FF ; |XXXXXXXX| $DD25
    .byte $99 ; |X  XX  X| $DD26
    .byte $99 ; |X  XX  X| $DD27
    .byte $99 ; |X  XX  X| $DD28
    .byte $99 ; |X  XX  X| $DD29
    .byte $99 ; |X  XX  X| $DD2A
    .byte $99 ; |X  XX  X| $DD2B
    .byte $99 ; |X  XX  X| $DD2C
    .byte $FF ; |XXXXXXXX| $DD2D
    .byte $99 ; |X  XX  X| $DD2E
    .byte $99 ; |X  XX  X| $DD2F
    .byte $99 ; |X  XX  X| $DD30
    .byte $99 ; |X  XX  X| $DD31
    .byte $99 ; |X  XX  X| $DD32
    .byte $99 ; |X  XX  X| $DD33
    .byte $99 ; |X  XX  X| $DD34
    .byte $FF ; |XXXXXXXX| $DD35
    .byte $FF ; |XXXXXXXX| $DD36
    .byte $FF ; |XXXXXXXX| $DD37
    .byte $FF ; |XXXXXXXX| $DD38
    .byte $FF ; |XXXXXXXX| $DD39
    .byte $FF ; |XXXXXXXX| $DD3A
    .byte $FF ; |XXXXXXXX| $DD3B
    .byte $FF ; |XXXXXXXX| $DD3C
    .byte $99 ; |X  XX  X| $DD3D
    .byte $99 ; |X  XX  X| $DD3E
    .byte $99 ; |X  XX  X| $DD3F
    .byte $99 ; |X  XX  X| $DD40
    .byte $99 ; |X  XX  X| $DD41
    .byte $99 ; |X  XX  X| $DD42
    .byte $99 ; |X  XX  X| $DD43
    .byte $FF ; |XXXXXXXX| $DD44
    .byte $99 ; |X  XX  X| $DD45
    .byte $99 ; |X  XX  X| $DD46
    .byte $99 ; |X  XX  X| $DD47
    .byte $99 ; |X  XX  X| $DD48
    .byte $99 ; |X  XX  X| $DD49
    .byte $99 ; |X  XX  X| $DD4A
    .byte $99 ; |X  XX  X| $DD4B
    .byte $99 ; |X  XX  X| $DD4C
    .byte $FF ; |XXXXXXXX| $DD4D
    .byte $FF ; |XXXXXXXX| $DD4E
    .byte $FF ; |XXXXXXXX| $DD4F
    .byte $FF ; |XXXXXXXX| $DD50
    .byte $FF ; |XXXXXXXX| $DD51
    .byte $FF ; |XXXXXXXX| $DD52
    .byte $FF ; |XXXXXXXX| $DD53
    .byte $FF ; |XXXXXXXX| $DD54
    .byte $FF ; |XXXXXXXX| $DD55
    .byte $FF ; |XXXXXXXX| $DD56
    .byte $FF ; |XXXXXXXX| $DD57
    .byte $99 ; |X  XX  X| $DD58
    .byte $99 ; |X  XX  X| $DD59
    .byte $99 ; |X  XX  X| $DD5A
    .byte $99 ; |X  XX  X| $DD5B
    .byte $99 ; |X  XX  X| $DD5C
    .byte $99 ; |X  XX  X| $DD5D
    .byte $99 ; |X  XX  X| $DD5E
    .byte $99 ; |X  XX  X| $DD5F
    .byte $FF ; |XXXXXXXX| $DD60
    .byte $99 ; |X  XX  X| $DD61
    .byte $99 ; |X  XX  X| $DD62
    .byte $99 ; |X  XX  X| $DD63
    .byte $99 ; |X  XX  X| $DD64
    .byte $99 ; |X  XX  X| $DD65
    .byte $99 ; |X  XX  X| $DD66
    .byte $99 ; |X  XX  X| $DD67
    .byte $99 ; |X  XX  X| $DD68
    .byte $FF ; |XXXXXXXX| $DD69
    .byte $FF ; |XXXXXXXX| $DD6A
    .byte $FF ; |XXXXXXXX| $DD6B
    .byte $FF ; |XXXXXXXX| $DD6C
    .byte $FF ; |XXXXXXXX| $DD6D
    .byte $FF ; |XXXXXXXX| $DD6E
    .byte $FF ; |XXXXXXXX| $DD6F
    .byte $FF ; |XXXXXXXX| $DD70
    .byte $FF ; |XXXXXXXX| $DD71
    .byte $FF ; |XXXXXXXX| $DD72
    .byte $FF ; |XXXXXXXX| $DD73
    .byte $FF ; |XXXXXXXX| $DD74
    .byte $FF ; |XXXXXXXX| $DD75
    .byte $FF ; |XXXXXXXX| $DD76
    .byte $FF ; |XXXXXXXX| $DD77
    .byte $FF ; |XXXXXXXX| $DD78
    .byte $FF ; |XXXXXXXX| $DD79
    .byte $EF ; |XXX XXXX| $DD7A
    .byte $D7 ; |XX X XXX| $DD7B
    .byte $BB ; |X XXX XX| $DD7C
    .byte $7C ; | XXXXX  | $DD7D
    .byte $FF ; |XXXXXXXX| $DD7E
    .byte $FF ; |XXXXXXXX| $DD7F
    .byte $00 ; |        | $DD80
    .byte $18 ; |   XX   | $DD81
    .byte $10 ; |   X    | $DD82
    .byte $10 ; |   X    | $DD83
    .byte $10 ; |   X    | $DD84
    .byte $10 ; |   X    | $DD85
    .byte $10 ; |   X    | $DD86
    .byte $10 ; |   X    | $DD87
    .byte $10 ; |   X    | $DD88
    .byte $18 ; |   XX   | $DD89
    .byte $18 ; |   XX   | $DD8A
    .byte $1C ; |   XXX  | $DD8B
    .byte $7C ; | XXXXX  | $DD8C
    .byte $7A ; | XXXX X | $DD8D
    .byte $7A ; | XXXX X | $DD8E
    .byte $6A ; | XX X X | $DD8F
    .byte $70 ; | XXX    | $DD90
    .byte $18 ; |   XX   | $DD91
    .byte $18 ; |   XX   | $DD92
    .byte $18 ; |   XX   | $DD93
    .byte $00 ; |        | $DD94
    .byte $00 ; |        | $DD95
    .byte $2C ; |  X XX  | $DD96
    .byte $28 ; |  X X   | $DD97
    .byte $28 ; |  X X   | $DD98
    .byte $38 ; |  XXX   | $DD99
    .byte $18 ; |   XX   | $DD9A
    .byte $18 ; |   XX   | $DD9B
    .byte $10 ; |   X    | $DD9C
    .byte $10 ; |   X    | $DD9D
    .byte $18 ; |   XX   | $DD9E
    .byte $18 ; |   XX   | $DD9F
    .byte $1C ; |   XXX  | $DDA0
    .byte $7C ; | XXXXX  | $DDA1
    .byte $7A ; | XXXX X | $DDA2
    .byte $7A ; | XXXX X | $DDA3
    .byte $6A ; | XX X X | $DDA4
    .byte $70 ; | XXX    | $DDA5
    .byte $18 ; |   XX   | $DDA6
    .byte $18 ; |   XX   | $DDA7
    .byte $18 ; |   XX   | $DDA8
    .byte $00 ; |        | $DDA9
    .byte $00 ; |        | $DDAA
    .byte $4C ; | X  XX  | $DDAB
    .byte $28 ; |  X X   | $DDAC
    .byte $28 ; |  X X   | $DDAD
    .byte $28 ; |  X X   | $DDAE
    .byte $38 ; |  XXX   | $DDAF
    .byte $18 ; |   XX   | $DDB0
    .byte $10 ; |   X    | $DDB1
    .byte $10 ; |   X    | $DDB2
    .byte $18 ; |   XX   | $DDB3
    .byte $18 ; |   XX   | $DDB4
    .byte $1C ; |   XXX  | $DDB5
    .byte $7C ; | XXXXX  | $DDB6
    .byte $7A ; | XXXX X | $DDB7
    .byte $7A ; | XXXX X | $DDB8
    .byte $6A ; | XX X X | $DDB9
    .byte $70 ; | XXX    | $DDBA
    .byte $18 ; |   XX   | $DDBB
    .byte $18 ; |   XX   | $DDBC
    .byte $18 ; |   XX   | $DDBD
    .byte $00 ; |        | $DDBE
    .byte $00 ; |        | $DDBF
    .byte $55 ; | X X X X| $DDC0
    .byte $55 ; | X X X X| $DDC1
    .byte $55 ; | X X X X| $DDC2
    .byte $5D ; | X XXX X| $DDC3
    .byte $55 ; | X X X X| $DDC4
    .byte $00 ; |        | $DDC5
    .byte $00 ; |        | $DDC6
    .byte $00 ; |        | $DDC7
    .byte $5B ; | X XX XX| $DDC8
    .byte $5A ; | X XX X | $DDC9
    .byte $D3 ; |XX X  XX| $DDCA
    .byte $52 ; | X X  X | $DDCB
    .byte $DB ; |XX XX XX| $DDCC
    .byte $00 ; |        | $DDCD
    .byte $00 ; |        | $DDCE
    .byte $00 ; |        | $DDCF
    .byte $3A ; |  XXX X | $DDD0
    .byte $2A ; |  X X X | $DDD1
    .byte $3B ; |  XXX XX| $DDD2
    .byte $2A ; |  X X X | $DDD3
    .byte $33 ; |  XX  XX| $DDD4
    .byte $00 ; |        | $DDD5
    .byte $00 ; |        | $DDD6
    .byte $00 ; |        | $DDD7
    .byte $A4 ; |X X  X  | $DDD8
    .byte $A4 ; |X X  X  | $DDD9
    .byte $A4 ; |X X  X  | $DDDA
    .byte $A4 ; |X X  X  | $DDDB
    .byte $AE ; |X X XXX | $DDDC
    .byte $00 ; |        | $DDDD
    .byte $00 ; |        | $DDDE
    .byte $00 ; |        | $DDDF
    .byte $09 ; |    X  X| $DDE0
    .byte $1D ; |   XXX X| $DDE1
    .byte $15 ; |   X X X| $DDE2
    .byte $15 ; |   X X X| $DDE3
    .byte $15 ; |   X X X| $DDE4
    .byte $00 ; |        | $DDE5
    .byte $00 ; |        | $DDE6
    .byte $00 ; |        | $DDE7
    .byte $5C ; | X XXX  | $DDE8
    .byte $50 ; | X X    | $DDE9
    .byte $D0 ; |XX X    | $DDEA
    .byte $50 ; | X X    | $DDEB
    .byte $DC ; |XX XXX  | $DDEC
    .byte $00 ; |        | $DDED
    .byte $00 ; |        | $DDEE
    .byte $00 ; |        | $DDEF
    .byte $25 ; |  X  X X| $DDF0
    .byte $26 ; |  X  XX | $DDF1
    .byte $27 ; |  X  XXX| $DDF2
    .byte $25 ; |  X  X X| $DDF3
    .byte $77 ; | XXX XXX| $DDF4
    .byte $00 ; |        | $DDF5
    .byte $00 ; |        | $DDF6
    .byte $00 ; |        | $DDF7
    .byte $54 ; | X X X  | $DDF8
    .byte $54 ; | X X X  | $DDF9
    .byte $77 ; | XXX XXX| $DDFA
    .byte $55 ; | X X X X| $DDFB
    .byte $77 ; | XXX XXX| $DDFC
    .byte $00 ; |        | $DDFD
    .byte $00 ; |        | $DDFE
    .byte $00 ; |        | $DDFF
LDE00:
    .byte $00 ; |        | $DE00
    .byte $00 ; |        | $DE01
    .byte $00 ; |        | $DE02
    .byte $00 ; |        | $DE03
    .byte $F2 ; |XXXX  X | $DE04
    .byte $02 ; |      X | $DE05
    .byte $02 ; |      X | $DE06
    .byte $D2 ; |XX X  X | $DE07
    .byte $02 ; |      X | $DE08
    .byte $F2 ; |XXXX  X | $DE09
    .byte $F2 ; |XXXX  X | $DE0A
    .byte $02 ; |      X | $DE0B
    .byte $F2 ; |XXXX  X | $DE0C
    .byte $F2 ; |XXXX  X | $DE0D
    .byte $02 ; |      X | $DE0E
    .byte $22 ; |  X   X | $DE0F
    .byte $02 ; |      X | $DE10
    .byte $02 ; |      X | $DE11
    .byte $E2 ; |XXX   X | $DE12
    .byte $02 ; |      X | $DE13
    .byte $02 ; |      X | $DE14
    .byte $00 ; |        | $DE15
    .byte $00 ; |        | $DE16
    .byte $00 ; |        | $DE17
    .byte $00 ; |        | $DE18
    .byte $00 ; |        | $DE19
    .byte $00 ; |        | $DE1A
    .byte $00 ; |        | $DE1B
    .byte $00 ; |        | $DE1C
    .byte $00 ; |        | $DE1D
    .byte $00 ; |        | $DE1E
    .byte $10 ; |   X    | $DE1F
    .byte $00 ; |        | $DE20
    .byte $00 ; |        | $DE21
    .byte $10 ; |   X    | $DE22
    .byte $00 ; |        | $DE23
    .byte $00 ; |        | $DE24
    .byte $10 ; |   X    | $DE25
    .byte $00 ; |        | $DE26
    .byte $00 ; |        | $DE27
    .byte $10 ; |   X    | $DE28
    .byte $00 ; |        | $DE29
    .byte $10 ; |   X    | $DE2A
    .byte $00 ; |        | $DE2B
    .byte $00 ; |        | $DE2C
    .byte $10 ; |   X    | $DE2D
    .byte $00 ; |        | $DE2E
    .byte $00 ; |        | $DE2F
    .byte $00 ; |        | $DE30
    .byte $00 ; |        | $DE31
    .byte $10 ; |   X    | $DE32
    .byte $00 ; |        | $DE33
    .byte $00 ; |        | $DE34
    .byte $10 ; |   X    | $DE35
    .byte $00 ; |        | $DE36
    .byte $00 ; |        | $DE37
    .byte $00 ; |        | $DE38
    .byte $10 ; |   X    | $DE39
    .byte $00 ; |        | $DE3A
    .byte $10 ; |   X    | $DE3B
    .byte $00 ; |        | $DE3C
    .byte $00 ; |        | $DE3D
    .byte $00 ; |        | $DE3E
    .byte $00 ; |        | $DE3F
    .byte $10 ; |   X    | $DE40
    .byte $00 ; |        | $DE41
    .byte $00 ; |        | $DE42
    .byte $00 ; |        | $DE43
    .byte $00 ; |        | $DE44
    .byte $10 ; |   X    | $DE45
    .byte $00 ; |        | $DE46
    .byte $10 ; |   X    | $DE47
    .byte $00 ; |        | $DE48
    .byte $00 ; |        | $DE49
    .byte $00 ; |        | $DE4A
    .byte $00 ; |        | $DE4B
    .byte $10 ; |   X    | $DE4C
    .byte $00 ; |        | $DE4D
    .byte $00 ; |        | $DE4E
    .byte $00 ; |        | $DE4F
    .byte $00 ; |        | $DE50
    .byte $10 ; |   X    | $DE51
    .byte $00 ; |        | $DE52
    .byte $10 ; |   X    | $DE53
    .byte $00 ; |        | $DE54
    .byte $10 ; |   X    | $DE55
    .byte $00 ; |        | $DE56
    .byte $00 ; |        | $DE57
    .byte $00 ; |        | $DE58
    .byte $00 ; |        | $DE59
    .byte $00 ; |        | $DE5A
    .byte $00 ; |        | $DE5B
    .byte $10 ; |   X    | $DE5C
    .byte $00 ; |        | $DE5D
    .byte $00 ; |        | $DE5E
    .byte $10 ; |   X    | $DE5F
    .byte $00 ; |        | $DE60
    .byte $10 ; |   X    | $DE61
    .byte $00 ; |        | $DE62
    .byte $10 ; |   X    | $DE63
    .byte $00 ; |        | $DE64
    .byte $10 ; |   X    | $DE65
    .byte $00 ; |        | $DE66
    .byte $10 ; |   X    | $DE67
    .byte $00 ; |        | $DE68
    .byte $10 ; |   X    | $DE69
    .byte $00 ; |        | $DE6A
    .byte $00 ; |        | $DE6B
    .byte $00 ; |        | $DE6C
    .byte $00 ; |        | $DE6D
    .byte $00 ; |        | $DE6E
    .byte $00 ; |        | $DE6F
    .byte $00 ; |        | $DE70
    .byte $02 ; |      X | $DE71
    .byte $02 ; |      X | $DE72
    .byte $F2 ; |XXXX  X | $DE73
    .byte $02 ; |      X | $DE74
    .byte $02 ; |      X | $DE75
    .byte $F2 ; |XXXX  X | $DE76
    .byte $02 ; |      X | $DE77
    .byte $02 ; |      X | $DE78
    .byte $F2 ; |XXXX  X | $DE79
    .byte $02 ; |      X | $DE7A
    .byte $F2 ; |XXXX  X | $DE7B
    .byte $02 ; |      X | $DE7C
    .byte $02 ; |      X | $DE7D
    .byte $F2 ; |XXXX  X | $DE7E
    .byte $02 ; |      X | $DE7F
    .byte $02 ; |      X | $DE80
    .byte $02 ; |      X | $DE81
    .byte $02 ; |      X | $DE82
    .byte $F2 ; |XXXX  X | $DE83
    .byte $02 ; |      X | $DE84
    .byte $02 ; |      X | $DE85
    .byte $F2 ; |XXXX  X | $DE86
    .byte $02 ; |      X | $DE87
    .byte $02 ; |      X | $DE88
    .byte $02 ; |      X | $DE89
    .byte $F2 ; |XXXX  X | $DE8A
    .byte $02 ; |      X | $DE8B
    .byte $F2 ; |XXXX  X | $DE8C
    .byte $02 ; |      X | $DE8D
    .byte $02 ; |      X | $DE8E
    .byte $02 ; |      X | $DE8F
    .byte $02 ; |      X | $DE90
    .byte $F2 ; |XXXX  X | $DE91
    .byte $02 ; |      X | $DE92
    .byte $02 ; |      X | $DE93
    .byte $02 ; |      X | $DE94
    .byte $00 ; |        | $DE95
    .byte $F0 ; |XXXX    | $DE96
    .byte $00 ; |        | $DE97
    .byte $F0 ; |XXXX    | $DE98
    .byte $00 ; |        | $DE99
    .byte $00 ; |        | $DE9A
    .byte $00 ; |        | $DE9B
    .byte $00 ; |        | $DE9C
    .byte $F0 ; |XXXX    | $DE9D
    .byte $00 ; |        | $DE9E
    .byte $00 ; |        | $DE9F
    .byte $00 ; |        | $DEA0
    .byte $00 ; |        | $DEA1
    .byte $F0 ; |XXXX    | $DEA2
    .byte $00 ; |        | $DEA3
    .byte $F0 ; |XXXX    | $DEA4
    .byte $00 ; |        | $DEA5
    .byte $F0 ; |XXXX    | $DEA6
    .byte $00 ; |        | $DEA7
    .byte $00 ; |        | $DEA8
    .byte $00 ; |        | $DEA9
    .byte $00 ; |        | $DEAA
    .byte $00 ; |        | $DEAB
    .byte $00 ; |        | $DEAC
    .byte $F0 ; |XXXX    | $DEAD
    .byte $00 ; |        | $DEAE
    .byte $00 ; |        | $DEAF
    .byte $F0 ; |XXXX    | $DEB0
    .byte $00 ; |        | $DEB1
    .byte $F0 ; |XXXX    | $DEB2
    .byte $00 ; |        | $DEB3
    .byte $F0 ; |XXXX    | $DEB4
    .byte $00 ; |        | $DEB5
    .byte $F0 ; |XXXX    | $DEB6
    .byte $00 ; |        | $DEB7
    .byte $F0 ; |XXXX    | $DEB8
    .byte $00 ; |        | $DEB9
    .byte $F0 ; |XXXX    | $DEBA
    .byte $00 ; |        | $DEBB
    .byte $00 ; |        | $DEBC
    .byte $00 ; |        | $DEBD
    .byte $00 ; |        | $DEBE
    .byte $00 ; |        | $DEBF
    .byte $00 ; |        | $DEC0
    .byte $00 ; |        | $DEC1
LDEC2:
    .byte $00 ; |        | $DEC2
    .byte $00 ; |        | $DEC3
    .byte $00 ; |        | $DEC4
    .byte $00 ; |        | $DEC5
    .byte $20 ; |  X     | $DEC6
    .byte $20 ; |  X     | $DEC7
    .byte $20 ; |  X     | $DEC8
    .byte $10 ; |   X    | $DEC9
    .byte $20 ; |  X     | $DECA
    .byte $20 ; |  X     | $DECB
    .byte $20 ; |  X     | $DECC
    .byte $20 ; |  X     | $DECD
    .byte $20 ; |  X     | $DECE
    .byte $20 ; |  X     | $DECF
    .byte $20 ; |  X     | $DED0
    .byte $20 ; |  X     | $DED1
    .byte $10 ; |   X    | $DED2
    .byte $00 ; |        | $DED3
    .byte $00 ; |        | $DED4
    .byte $10 ; |   X    | $DED5
    .byte $10 ; |   X    | $DED6
    .byte $00 ; |        | $DED7
    .byte $00 ; |        | $DED8
    .byte $00 ; |        | $DED9
    .byte $00 ; |        | $DEDA
    .byte $00 ; |        | $DEDB
    .byte $00 ; |        | $DEDC
    .byte $00 ; |        | $DEDD
    .byte $00 ; |        | $DEDE
    .byte $00 ; |        | $DEDF
    .byte $0C ; |    XX  | $DEE0
    .byte $02 ; |      X | $DEE1
    .byte $02 ; |      X | $DEE2
    .byte $02 ; |      X | $DEE3
    .byte $02 ; |      X | $DEE4
    .byte $02 ; |      X | $DEE5
    .byte $02 ; |      X | $DEE6
LDEE7:
    .byte $08 ; |    X   | $DEE7
    .byte $08 ; |    X   | $DEE8
    .byte $08 ; |    X   | $DEE9
    .byte $08 ; |    X   | $DEEA
    .byte $08 ; |    X   | $DEEB
    .byte $08 ; |    X   | $DEEC
    .byte $08 ; |    X   | $DEED
    .byte $08 ; |    X   | $DEEE
    .byte $08 ; |    X   | $DEEF
    .byte $08 ; |    X   | $DEF0
    .byte $02 ; |      X | $DEF1
    .byte $D8 ; |XX XX   | $DEF2
    .byte $D8 ; |XX XX   | $DEF3
    .byte $D8 ; |XX XX   | $DEF4
    .byte $D6 ; |XX X XX | $DEF5
    .byte $D6 ; |XX X XX | $DEF6
    .byte $D4 ; |XX X X  | $DEF7
    .byte $D4 ; |XX X X  | $DEF8
    .byte $D4 ; |XX X X  | $DEF9
    .byte $D2 ; |XX X  X | $DEFA
    .byte $00 ; |        | $DEFB
LDEFC:
    .byte $4B ; | X  X XX| $DEFC
    .byte $5B ; | X XX XX| $DEFD
    .byte $38 ; |  XXX   | $DEFE
    .byte $52 ; | X X  X | $DEFF


    .byte $3C ; |  XXXX  | $DF00
    .byte $66 ; | XX  XX | $DF01
    .byte $66 ; | XX  XX | $DF02
    .byte $66 ; | XX  XX | $DF03
    .byte $66 ; | XX  XX | $DF04
    .byte $66 ; | XX  XX | $DF05
    .byte $3C ; |  XXXX  | $DF06
    .byte $00 ; |        | $DF07
    .byte $3C ; |  XXXX  | $DF08
    .byte $18 ; |   XX   | $DF09
    .byte $18 ; |   XX   | $DF0A
    .byte $18 ; |   XX   | $DF0B
    .byte $18 ; |   XX   | $DF0C
    .byte $38 ; |  XXX   | $DF0D
    .byte $18 ; |   XX   | $DF0E
    .byte $00 ; |        | $DF0F
    .byte $7E ; | XXXXXX | $DF10
    .byte $60 ; | XX     | $DF11
    .byte $60 ; | XX     | $DF12
    .byte $3C ; |  XXXX  | $DF13
    .byte $06 ; |     XX | $DF14
    .byte $46 ; | X   XX | $DF15
    .byte $3C ; |  XXXX  | $DF16
    .byte $00 ; |        | $DF17
    .byte $3C ; |  XXXX  | $DF18
    .byte $46 ; | X   XX | $DF19
    .byte $06 ; |     XX | $DF1A
    .byte $0C ; |    XX  | $DF1B
    .byte $06 ; |     XX | $DF1C
    .byte $46 ; | X   XX | $DF1D
    .byte $3C ; |  XXXX  | $DF1E
    .byte $00 ; |        | $DF1F
    .byte $0C ; |    XX  | $DF20
    .byte $0C ; |    XX  | $DF21
    .byte $7E ; | XXXXXX | $DF22
    .byte $4C ; | X  XX  | $DF23
    .byte $2C ; |  X XX  | $DF24
    .byte $1C ; |   XXX  | $DF25
    .byte $0C ; |    XX  | $DF26
    .byte $00 ; |        | $DF27
    .byte $7C ; | XXXXX  | $DF28
    .byte $46 ; | X   XX | $DF29
    .byte $06 ; |     XX | $DF2A
    .byte $7C ; | XXXXX  | $DF2B
    .byte $60 ; | XX     | $DF2C
    .byte $60 ; | XX     | $DF2D
    .byte $7E ; | XXXXXX | $DF2E
    .byte $00 ; |        | $DF2F
    .byte $3C ; |  XXXX  | $DF30
    .byte $66 ; | XX  XX | $DF31
    .byte $66 ; | XX  XX | $DF32
    .byte $7C ; | XXXXX  | $DF33
    .byte $60 ; | XX     | $DF34
    .byte $62 ; | XX   X | $DF35
    .byte $3C ; |  XXXX  | $DF36
    .byte $00 ; |        | $DF37
    .byte $18 ; |   XX   | $DF38
    .byte $18 ; |   XX   | $DF39
    .byte $18 ; |   XX   | $DF3A
    .byte $0C ; |    XX  | $DF3B
    .byte $06 ; |     XX | $DF3C
    .byte $42 ; | X    X | $DF3D
    .byte $7E ; | XXXXXX | $DF3E
    .byte $00 ; |        | $DF3F
    .byte $3C ; |  XXXX  | $DF40
    .byte $66 ; | XX  XX | $DF41
    .byte $66 ; | XX  XX | $DF42
    .byte $3C ; |  XXXX  | $DF43
    .byte $66 ; | XX  XX | $DF44
    .byte $66 ; | XX  XX | $DF45
    .byte $3C ; |  XXXX  | $DF46
    .byte $00 ; |        | $DF47
    .byte $3C ; |  XXXX  | $DF48
    .byte $46 ; | X   XX | $DF49
    .byte $06 ; |     XX | $DF4A
    .byte $3E ; |  XXXXX | $DF4B
    .byte $66 ; | XX  XX | $DF4C
    .byte $66 ; | XX  XX | $DF4D
    .byte $3C ; |  XXXX  | $DF4E
    .byte $00 ; |        | $DF4F
    .byte $93 ; |X  X  XX| $DF50
    .byte $94 ; |X  X X  | $DF51
    .byte $94 ; |X  X X  | $DF52
    .byte $F4 ; |XXXX X  | $DF53
    .byte $94 ; |X  X X  | $DF54
    .byte $94 ; |X  X X  | $DF55
    .byte $63 ; | XX   XX| $DF56
    .byte $00 ; |        | $DF57
    .byte $12 ; |   X  X | $DF58
    .byte $92 ; |X  X  X | $DF59
    .byte $12 ; |   X  X | $DF5A
    .byte $12 ; |   X  X | $DF5B
    .byte $12 ; |   X  X | $DF5C
    .byte $92 ; |X  X  X | $DF5D
    .byte $3A ; |  XXX X | $DF5E
    .byte $00 ; |        | $DF5F
    .byte $64 ; | XX  X  | $DF60
    .byte $95 ; |X  X X X| $DF61
    .byte $94 ; |X  X X  | $DF62
    .byte $94 ; |X  X X  | $DF63
    .byte $95 ; |X  X X X| $DF64
    .byte $95 ; |X  X X X| $DF65
    .byte $94 ; |X  X X  | $DF66
    .byte $00 ; |        | $DF67
    .byte $C9 ; |XX  X  X| $DF68
    .byte $2A ; |  X X X | $DF69
    .byte $2A ; |  X X X | $DF6A
    .byte $CA ; |XX  X X | $DF6B
    .byte $0A ; |    X X | $DF6C
    .byte $2A ; |  X X X | $DF6D
    .byte $C9 ; |XX  X  X| $DF6E
    .byte $00 ; |        | $DF6F
    .byte $91 ; |X  X   X| $DF70
    .byte $51 ; | X X   X| $DF71
    .byte $53 ; | X X  XX| $DF72
    .byte $57 ; | X X XXX| $DF73
    .byte $5D ; | X XXX X| $DF74
    .byte $59 ; | X XX  X| $DF75
    .byte $91 ; |X  X   X| $DF76
    .byte $00 ; |        | $DF77
    .byte $3C ; |  XXXX  | $DF78
    .byte $42 ; | X    X | $DF79
    .byte $5A ; | X XX X | $DF7A
    .byte $52 ; | X X  X | $DF7B
    .byte $5A ; | X XX X | $DF7C
    .byte $42 ; | X    X | $DF7D
    .byte $3C ; |  XXXX  | $DF7E
    .byte $00 ; |        | $DF7F
    .byte $8A ; |X   X X | $DF80
    .byte $8A ; |X   X X | $DF81
    .byte $8A ; |X   X X | $DF82
    .byte $EC ; |XXX XX  | $DF83
    .byte $AC ; |X X XX  | $DF84
    .byte $AA ; |X X X X | $DF85
    .byte $EA ; |XXX X X | $DF86
    .byte $00 ; |        | $DF87
    .byte $28 ; |  X X   | $DF88
    .byte $7C ; | XXXXX  | $DF89
    .byte $2C ; |  X XX  | $DF8A
    .byte $7C ; | XXXXX  | $DF8B
    .byte $68 ; | XX X   | $DF8C
    .byte $7C ; | XXXXX  | $DF8D
    .byte $28 ; |  X X   | $DF8E
    .byte $00 ; |        | $DF8F
    .byte $00 ; |        | $DF90
    .byte $00 ; |        | $DF91
    .byte $00 ; |        | $DF92
    .byte $00 ; |        | $DF93
    .byte $00 ; |        | $DF94
    .byte $00 ; |        | $DF95
    .byte $00 ; |        | $DF96
LDF97:
    .byte $00 ; |        | $DF97
LDF98:
    .byte $FF ; |XXXXXXXX| $DF98
    .byte $7E ; | XXXXXX | $DF99
    .byte $3C ; |  XXXX  | $DF9A
LDF9B:
    .byte $18 ; |   XX   | $DF9B
LDF9C:
    .byte $08 ; |    X   | $DF9C
    .byte $06 ; |     XX | $DF9D
    .byte $0C ; |    XX  | $DF9E
    .byte $0C ; |    XX  | $DF9F
LDFA0:
    .byte $03 ; |      XX| $DFA0
    .byte $03 ; |      XX| $DFA1
    .byte $03 ; |      XX| $DFA2
    .byte $02 ; |      X | $DFA3
    .byte $00 ; |        | $DFA4
    .byte $18 ; |   XX   | $DFA5
    .byte $18 ; |   XX   | $DFA6
    .byte $BD ; |X XXXX X| $DFA7
    .byte $FF ; |XXXXXXXX| $DFA8
    .byte $4A ; | X  X X | $DFA9
    .byte $44 ; | X   X  | $DFAA
    .byte $48 ; | X  X   | $DFAB
    .byte $4A ; | X  X X | $DFAC

LDFAD:
    ldy    #$06                  ; 2
    sty    ram_EC                ; 3
    lda    ram_EB                ; 3
    clc                          ; 2
    bcc    LDFB8                 ; 3   always branch

LDFB6:
    sta    HMCLR                 ; 3
LDFB8:
    ldy    ram_EC                ; 3
    lda    (ram_D2),Y            ; 5
    sta    ram_EB                ; 3
    lda    (ram_D0),Y            ; 5
    tax                          ; 2
    lda    (ram_ED),Y            ; 5
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    lda    (ram_CA),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_CC),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_CE),Y            ; 5
    ldy    ram_EB                ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    ram_EC                ; 5
    bpl    LDFB6                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
LDFEB:
    rts                          ; 6

       ORG $0FEC
      RORG $DFEC

LDFEC:
    ldx    #$FF                  ; 2
    txs                          ; 2
    jmp    LD00C                 ; 3

LDFF2:
    bit    BANK_1                ; 4
    jsr    LFFF2                 ; 6

    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2

    .word START_0
    .word START_0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 1
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $1000
      RORG $F000

START_1:
    sei                          ; 2
    sta    BANK_1                ; 4
    cld                          ; 2
    ldx    #$FF                  ; 2
    stx    ram_EF                ; 3
    inx                          ; 2
LF00A:
    lda    #$00                  ; 2
LF00C:
    sta    0,X                   ; 4
    inx                          ; 2
    cpx    #$EF                  ; 2
    bcc    LF00C                 ; 2³
    sta    ram_BC                ; 3
    sta    ram_96                ; 3
    lda    #$50                  ; 2
    sta    ram_AB                ; 3
    ldx    #$FF                  ; 2
    txs                          ; 2
    bit    ram_EF                ; 3
    bmi    LF035                 ; 2³
    lda    #$03                  ; 2
    sta    ram_D4                ; 3
    sta    ram_DC                ; 3
;    lda    SWCHB                 ; 4
;    and    #$40                  ; 2
;    sta    ram_BA                ; 3
    lda    #$88                  ; 2
    sta    ram_91                ; 3
    bne    LF04F                 ; 3   always branch
    
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP

LF035:
    jsr    LFC21                 ; 6
    sta    ram_D6                ; 3
    jsr    LFBEE                 ; 6
LF03D:
    ldx    #$03                  ; 2
LF03F:
    lda    LFBFB,X               ; 4
    sta    ram_EB,X              ; 4
    dex                          ; 2
    bpl    LF03F                 ; 2³
    ldy    #$0C                  ; 2
    jsr    LFBFF                 ; 6
    jsr    LFBAB                 ; 6
LF04F:
    ldx    ram_81                ; 3
    beq    LF058                 ; 2³
    lda    #$00                  ; 2
    jmp    LFB69                 ; 3

LF058:
    inc    ram_81                ; 5
    ldx    #$05                  ; 2
LF05C:
    lda    LFBA5,X               ; 4
    sta    ram_C0,X              ; 4
    dex                          ; 2
    bpl    LF05C                 ; 2³
    jmp    LF3F2                 ; 3

LF067:
    bit    ram_E0                ; 3
    bmi    LF0D8                 ; 2³
    lda    ram_C4                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_EC                ; 3
    tax                          ; 2
    lda    LFBE9,X               ; 4
    sta    ram_EB                ; 3
    ldx    #$04                  ; 2
    ldy    #$00                  ; 2
LF07E:
    lda    ram_D6,X              ; 4
    bpl    LF083                 ; 2³
    iny                          ; 2
LF083:
    lda    ram_80                ; 3
    and    ram_EB                ; 3
    bne    LF098                 ; 2³
    cmp    ram_E6,X              ; 4
    beq    LF094                 ; 2³
    dec    ram_E6,X              ; 6
    bpl    LF098                 ; 2³
    dey                          ; 2
    sta    ram_E6,X              ; 4
LF094:
    lda    #$01                  ; 2
    sta    ram_D6,X              ; 4
LF098:
    dex                          ; 2
    bpl    LF07E                 ; 2³
    ldx    ram_EC                ; 3
    inx                          ; 2
    stx    ram_EB                ; 3
    cpy    ram_EB                ; 3
    bcs    LF0D8                 ; 2³
    lda    ram_81                ; 3
    and    #$07                  ; 2
    cmp    #$05                  ; 2
    bcc    LF0AE                 ; 2³
    sbc    #$04                  ; 2
LF0AE:
    tax                          ; 2
    lda    ram_D6,X              ; 4
    bmi    LF0D8                 ; 2³
    lda    ram_80                ; 3
    and    #$03                  ; 2
    tay                          ; 2
    iny                          ; 2
    sty    ram_EB                ; 3
    cpx    #$04                  ; 2
    bne    LF0C3                 ; 2³
    cpy    #$03                  ; 2
    beq    LF0D8                 ; 2³
LF0C3:
    txa                          ; 2
    bne    LF0CA                 ; 2³
    cpy    #$02                  ; 2
    beq    LF0D8                 ; 2³
LF0CA:
    lda    ram_D6,X              ; 4
    and    #$F8                  ; 2
    ora    ram_EB                ; 3
    ora    #$80                  ; 2
    sta    ram_D6,X              ; 4
    lda    #$70                  ; 2
    sta    ram_E6,X              ; 4
LF0D8:
    ldx    ram_D4                ; 3
    bne    LF0F2                 ; 2³
    bit    ram_D5                ; 3
    bvs    LF0F2                 ; 2³
    bit    ram_EF                ; 3
    bmi    LF0F2                 ; 2³
    lda    CXPPMM                ; 3
    bpl    LF0F2                 ; 2³
    bit    ram_BD                ; 3
    bmi    LF0F2                 ; 2³
    lda    #$80                  ; 2
    ora    ram_BD                ; 3
    sta    ram_BD                ; 3
LF0F2:
    lda    ram_D4                ; 3
    beq    LF0F9                 ; 2³
LF0F6:
    jmp    LF1F9                 ; 3

LF0F9:
    bit    ram_D5                ; 3
    bpl    LF0F6                 ; 2³
    bvs    LF135                 ; 2³+1
    lda    ram_BD                ; 3
    bmi    LF0F6                 ; 2³+1
    lda    ram_81                ; 3
    cmp    ram_C4                ; 3
    beq    LF111                 ; 2³
    lda    ram_C4                ; 3
    and    #$F0                  ; 2
    cmp    #$80                  ; 2
    bcc    LF0F6                 ; 2³+1
LF111:
    ror    ram_D5                ; 5
    lda    ram_81                ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    LFD19,X               ; 4
    sta    ram_9D                ; 3
    lda    ram_80                ; 3
    and    #$03                  ; 2
    cmp    #$03                  ; 2
    bcc    LF126                 ; 2³
    lsr                          ; 2
LF126:
    tax                          ; 2
    lda    LFD1D,X               ; 4
    sta    ram_9E                ; 3
    jsr    LFBC2                 ; 6
    and    #$BF                  ; 2
    ora    ram_EB                ; 3
    sta    ram_DC                ; 3
LF135:
    lda    ram_D5                ; 3
    lsr                          ; 2
    bcs    LF1A7                 ; 2³
    lda    ram_D5                ; 3
    and    #$20                  ; 2
    bne    LF15C                 ; 2³
    ldx    #$04                  ; 2
LF142:
    lda    ram_B7,X              ; 4
    cmp    #$02                  ; 2
    bcc    LF14B                 ; 2³
    jmp    LF1F9                 ; 3

LF14B:
    dex                          ; 2
    bpl    LF142                 ; 2³
    lda    #$A0                  ; 2
    sta    ram_BB                ; 3
    lda    #$76                  ; 2
    sta    ram_B5                ; 3
    lda    #$20                  ; 2
    ora    ram_D5                ; 3
    sta    ram_D5                ; 3
LF15C:
    jsr    LFBC2                 ; 6
    and    #$40                  ; 2
    cmp    ram_EB                ; 3
    beq    LF170                 ; 2³
    lda    ram_DE                ; 3
    and    #$08                  ; 2
    beq    LF170                 ; 2³
    asl                          ; 2
    ora    ram_D5                ; 3
    sta    ram_D5                ; 3
LF170:
    lda    ram_BB                ; 3
    cmp    ram_9E                ; 3
    beq    LF17D                 ; 2³
    bcs    LF17B                 ; 2³
    inc    ram_BB                ; 5

    .byte $2C ; BIT opcode, skip 2 bytes
LF17B:
    dec    ram_BB                ; 5
LF17D:
    lda    ram_B5                ; 3
    cmp    ram_9D                ; 3
    beq    LF18D                 ; 2³
    bcs    LF189                 ; 2³
    inc    ram_B5                ; 5
    bne    LF194                 ; 2³
LF189:
    dec    ram_B5                ; 5
    bne    LF194                 ; 2³
LF18D:
    lda    ram_BB                ; 3
    cmp    ram_9E                ; 3
    bne    LF194                 ; 2³
    lda    #$18                  ; 2    clc, bcc... infinite loop
    bcc    LF1F9                 ; 2³
    lda    #$01                  ; 2
    ora    ram_BD                ; 3
    sta    ram_BD                ; 3
    ora    ram_D5                ; 3
    sta    ram_D5                ; 3
    lda    #$D1                  ; 2
    sta    ram_94                ; 3
    bne    LF1C2                 ; 3   always branch

LF1A7:
    lda    ram_D5                ; 3
    and    #$10                  ; 2
    beq    LF1BC                 ; 2³
    inc    ram_BB                ; 5
    lda    ram_BB                ; 3
    cmp    #$A0                  ; 2
    bne    LF1BC                 ; 2³
    lda    #$20                  ; 2
    jsr    LFD85                 ; 6
    bmi    LF1F2                 ; 3   always branch

LF1BC:
    lda    ram_80                ; 3
    and    #$07                  ; 2
    bne    LF1F9                 ; 2³
LF1C2:
    lda    ram_BD                ; 3
    eor    #$08                  ; 2
    sta    ram_BD                ; 3
    lda    #$C6                  ; 2
    sta    ram_93                ; 3
    lda    ram_D5                ; 3
    and    #$10                  ; 2
    bne    LF1F9                 ; 2³
    dec    ram_BB                ; 5
    lda    ram_9E                ; 3
    sec                          ; 2
    sbc    #$0E                  ; 2
    cmp    ram_BB                ; 3
    bne    LF1F9                 ; 2³
    lda    #$40                  ; 2
    jsr    LFD72                 ; 6
    lda    #$00                  ; 2
    bcs    LF1EA                 ; 2³
    sta    ram_C1                ; 3
    beq    LF1F0                 ; 3   always branch

LF1EA:
    lda    ram_EC                ; 3
    sta    ram_C1                ; 3
    lda    ram_EB                ; 3
LF1F0:
    sta    ram_C0                ; 3
LF1F2:
    lda    #$00                  ; 2
    sta    ram_D5                ; 3
    jsr    LFDA1                 ; 6
LF1F9:
    lda    #$00                  ; 2
    sta    ram_EE                ; 3
    ldx    ram_D4                ; 3
    dex                          ; 2
    beq    LF205                 ; 2³
    jmp    LF2B8                 ; 3

LF205:
    ldy    ram_AA                ; 3
    ldx    LFD4E,Y               ; 4
LF20A:
    inc    ram_A5                ; 5
    inc    ram_A6                ; 5
    inc    ram_A2                ; 5
    inc    ram_A4                ; 5
    lda    ram_A6                ; 3
    cmp    #$72                  ; 2
    bne    LF21C                 ; 2³
    lda    #$28                  ; 2
    sta    ram_A2                ; 3
LF21C:
    lda    ram_A2                ; 3
    cmp    #$4D                  ; 2
    bne    LF22E                 ; 2³
    lda    #$48                  ; 2
    sta    ram_A5                ; 3
    lda    #$2A                  ; 2
    sta    ram_A6                ; 3
    lda    #$3B                  ; 2
    sta    ram_A4                ; 3
LF22E:
    dex                          ; 2
    bne    LF20A                 ; 2³
    lda    ram_80                ; 3
    and    #$07                  ; 2
    bne    LF258                 ; 2³
    ldx    ram_AA                ; 3
    cpx    #$0C                  ; 2
    beq    LF258                 ; 2³
    inc    ram_AA                ; 5
    ldx    ram_AA                ; 3
    cpx    #$1E                  ; 2
    bne    LF258                 ; 2³
    sta    ram_AA                ; 3
    sta    ram_9F                ; 3
    sta    ram_A0                ; 3
    lda    #$02                  ; 2
    sta    ram_D4                ; 3
    sta    ram_96                ; 3
    jsr    LFEAE                 ; 6
    bcs    LF258                 ; 2³
    stx    ram_DD                ; 3
LF258:
    lda    ram_AA                ; 3
    cmp    #$0C                  ; 2
    bcc    LF279                 ; 2³
    bne    LF276                 ; 2³
    inc    ram_9F                ; 5
    lda    ram_9F                ; 3
    cmp    #$0A                  ; 2
    bne    LF279                 ; 2³
    lda    #$00                  ; 2
    sta    ram_9F                ; 3
    lda    ram_A0                ; 3
    beq    LF274                 ; 2³
    dec    ram_A0                ; 5
    bne    LF279                 ; 2³
LF274:
    inc    ram_AA                ; 5
LF276:
    sec                          ; 2
    ror    ram_EE                ; 5
LF279:
    lda    ram_A7                ; 3
    cmp    #$C2                  ; 2
    bne    LF29F                 ; 2³
    lda    ram_AA                ; 3
    cmp    #$0C                  ; 2
    bne    LF2B8                 ; 2³
    lda    ram_BD                ; 3
    bpl    LF2B8                 ; 2³
    lda    ram_A0                ; 3
    cmp    ram_BC                ; 3
    beq    LF293                 ; 2³
    and    #$3F                  ; 2
    bne    LF2B8                 ; 2³
LF293:
    lda    ram_81                ; 3
    cmp    #$9E                  ; 2
    bcs    LF29F                 ; 2³
    cmp    #$27                  ; 2
    bcc    LF29F                 ; 2³
    sta    ram_AC                ; 3
LF29F:
    lda    ram_A7                ; 3
    cmp    #$62                  ; 2
    bne    LF2A9                 ; 2³
    bit    ram_A9                ; 3
    bmi    LF2B8                 ; 2³
LF2A9:
    dec    ram_A7                ; 5
    dec    ram_A7                ; 5
    ldx    ram_A7                ; 3
    beq    LF2B4                 ; 2³
    inx                          ; 2
    bne    LF2B8                 ; 2³
LF2B4:
    lda    #$C2                  ; 2
    sta    ram_A7                ; 3
LF2B8:
    ldy    ram_D4                ; 3
    cpy    #$03                  ; 2
    beq    LF2FC                 ; 2³
    ldx    #$00                  ; 2
    lda    ram_96                ; 3
    cmp    #$04                  ; 2
    beq    LF2CA                 ; 2³
    cmp    #$05                  ; 2
    bne    LF2DF                 ; 2³
LF2CA:
    lda    ram_97                ; 3
    sbc    #$19                  ; 2
    bcc    LF2FC                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$14                  ; 2
    sta    AUDF0                 ; 3
    lsr                          ; 2
    clc                          ; 2
    adc    #$06                  ; 2
    bcc    LF2F5                 ; 3   always branch

LF2DF:
    bit    ram_A9                ; 3
    bpl    LF2FC                 ; 2³
    dey                          ; 2
    bne    LF2FC                 ; 2³
    lda    ram_A8                ; 3
    asl                          ; 2
    asl                          ; 2
    bne    LF2EE                 ; 2³
    lda    #$02                  ; 2
LF2EE:
    sta    AUDF0                 ; 3
    lda    #$0F                  ; 2
    sec                          ; 2
    sbc    ram_A8                ; 3
LF2F5:
    sta    AUDV0                 ; 3
    inx                          ; 2
    lda    #$08                  ; 2
    sta    AUDC0                 ; 3
LF2FC:
    ldy    ram_E2                ; 3
    beq    LF376                 ; 2³
    dec    ram_E3                ; 5
    bpl    LF309                 ; 2³
    lda    #$07                  ; 2
    sta    ram_E3                ; 3
    iny                          ; 2
LF309:
    lda    ram_E4                ; 3
    cmp    #$7B                  ; 2
    bcc    LF31D                 ; 2³
    bne    LF315                 ; 2³
    cpy    #$11                  ; 2
    bcc    LF319                 ; 2³
LF315:
    cpy    #$51                  ; 2
    bcc    LF323                 ; 2³
LF319:
    ldy    #$11                  ; 2
    bne    LF323                 ; 3   always branch

LF31D:
    cpy    #$11                  ; 2
    bcc    LF323                 ; 2³
    ldy    #$01                  ; 2
LF323:
    sty    ram_E2                ; 3
    txa                          ; 2
    bne    LF33B                 ; 2³
    lda    LFDC4,Y               ; 4
    beq    LF339                 ; 2³
    tax                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$0C                  ; 2
    sta    AUDC0                 ; 3
    stx    AUDF0                 ; 3
    lda    ram_E3                ; 3
LF339:
    sta    AUDV0                 ; 3
LF33B:
    ldy    ram_E4                ; 3
    dec    ram_E5                ; 5
    bpl    LF356                 ; 2³
    iny                          ; 2
    cpy    #$95                  ; 2
    bcc    LF348                 ; 2³
    ldy    #$01                  ; 2
LF348:
    lda    LFE15,Y               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LFDBE,X               ; 4
    sta    ram_E5                ; 3
LF356:
    sty    ram_E4                ; 3
    lda    LFE15,Y               ; 4
    and    #$1F                  ; 2
    beq    LF374                 ; 2³
    tax                          ; 2
    lda    LFDB4,X               ; 4
    sta    AUDF1                 ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$0C                  ; 2
    sta    AUDC1                 ; 3
    lda    #$0F                  ; 2
    ldx    ram_E5                ; 3
    bne    LF374                 ; 2³
    lda    #$08                  ; 2
LF374:
    sta    AUDV1                 ; 3
LF376:
    ldy    INTIM                 ; 4
    bne    LF376                 ; 2³
    lda    #$82                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    ldx    ram_C9                ; 3
    lda    ram_D4                ; 3
LF385:
    cmp    #$02                  ; 2
    bcc    LF38C                 ; 2³
    ldx    ram_C8                ; 3
    iny                          ; 2
LF38C:
    stx    HMP0,Y                ; 4
    sty    WSYNC                 ; 3
;---------------------------------------
    and    #$FF                  ; 2
    beq    LF3A3                 ; 2³
    txa                          ; 2
    and    #$0F                  ; 2
    tax                          ; 2
    lda    #$00                  ; 2
    bcs    LF39E                 ; 2³
    nop                          ; 2
    nop                          ; 2
LF39E:
    dex                          ; 2
    bpl    LF39E                 ; 2³
    stx    RESP0,Y               ; 4
LF3A3:
    sty    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sty    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    lda    #$32                  ; 2
    sta    HMCLR                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    TIM64T                ; 4
    ldy    SWCHA                 ; 4
    iny                          ; 2
    beq    LF3BE                 ; 2³
    ldy    #$00                  ; 2
    sty    ram_C6                ; 3
LF3BE:
    lda    SWCHB                 ; 4
    and    #$03                  ; 2
    cmp    #$03                  ; 2
    beq    LF3F0                 ; 2³
    bit    ram_F1                ; 3
    bmi    LF3F2                 ; 2³
    lda    #$00                  ; 2
    sta    ram_EF                ; 3
    ldx    #$C3                  ; 2
    stx    ram_F1                ; 3
    lda    #$00                  ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    ldy    ram_D4                ; 3
    cpy    #$04                  ; 2
    bcs    LF3ED                 ; 2³
    sta    ram_C0                ; 3
    sta    ram_C2                ; 3
    sta    ram_BF                ; 3
    lda    #$50                  ; 2
    sta    ram_C1                ; 3
    lda    #$01                  ; 2
    sta    ram_BE                ; 3
LF3ED:
    jmp    LF00A                 ; 3

LF3F0:
    sty    ram_F1                ; 3
LF3F2:
    lda    ram_D4                ; 3
    cmp    #$02                  ; 2
    beq    LF401                 ; 2³+1
    jmp    LF668                 ; 3

LF3FB:
    jmp    LF4FF                 ; 3

LF3FE:
    jmp    LF4AF                 ; 3

LF401:
    lda    ram_DD                ; 3
    bmi    LF3FE                 ; 2³+1
    cmp    #$21                  ; 2
    bcs    LF3FB                 ; 2³+1
    ldy    #$00                  ; 2
    ldx    ram_A6                ; 3
    lda    ram_AB                ; 3
    clc                          ; 2
    adc    LFD6A,X               ; 4
    sta    ram_AB                ; 3
    lda    ram_A3                ; 3
    clc                          ; 2
    adc    LFD49,X               ; 4
    cmp    #$68                  ; 2
    bcc    LF423                 ; 2³
    lda    #$66                  ; 2
    ldy    #$04                  ; 2
LF423:
    cmp    #$3B                  ; 2
    bcs    LF42B                 ; 2³
    lda    #$3D                  ; 2
    ldy    #$04                  ; 2
LF42B:
    sta    ram_A3                ; 3
    lda    ram_AB                ; 3
    cmp    #$9B                  ; 2
    bcc    LF437                 ; 2³
    lda    #$99                  ; 2
    ldy    #$04                  ; 2
LF437:
    cmp    #$3B                  ; 2
    bcs    LF43F                 ; 2³
    lda    #$3D                  ; 2
    ldy    #$04                  ; 2
LF43F:
    sta    ram_AB                ; 3
    tya                          ; 2
    clc                          ; 2
    adc    ram_A6                ; 3
    and    #$07                  ; 2
    sta    ram_A6                ; 3
    lda    ram_80                ; 3
    and    #$03                  ; 2
    bne    LF461                 ; 2³
    sec                          ; 2
    rol                          ; 2
    and    ram_81                ; 3
    adc    ram_A6                ; 3
    and    #$07                  ; 2
    sta    ram_A6                ; 3
    rol    ram_95                ; 5
    lda    ram_81                ; 3
    sta    ram_95                ; 3
    ror    ram_95                ; 5
LF461:
    lda    ram_96                ; 3
    cmp    #$03                  ; 2
    bne    LF4AC                 ; 2³
    lda    ram_A3                ; 3
    cmp    #$57                  ; 2
    bcs    LF4AC                 ; 2³
    sbc    #$3A                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #$07                  ; 2
    sta    ram_EB                ; 3
    lda    ram_AB                ; 3
    adc    #$03                  ; 2
    sta    ram_EC                ; 3
    ldx    #$02                  ; 2
LF480:
    dex                          ; 2
    bmi    LF4AC                 ; 2³
    lda    ram_AC,X              ; 4
    clc                          ; 2
    adc    #$08                  ; 2
    ldy    ram_98,X              ; 4
    beq    LF492                 ; 2³
    clc                          ; 2
    adc    ram_EB                ; 3
    jmp    LF495                 ; 3

LF492:
    sec                          ; 2
    sbc    ram_EB                ; 3
LF495:
    sec                          ; 2
    sbc    ram_EC                ; 3
    php                          ; 3
    bcs    LF49F                 ; 2³
    eor    #$FF                  ; 2
    adc    #$01                  ; 2
LF49F:
    cmp    #$03                  ; 2
    pla                          ; 4
    bcs    LF480                 ; 2³
    and    #$01                  ; 2
    beq    LF4AA                 ; 2³
    lda    #$04                  ; 2
LF4AA:
    sta    ram_A6                ; 3
LF4AC:
    jmp    LF4FF                 ; 3

LF4AF:
    bit    ram_E0                ; 3
    bmi    LF4BC                 ; 2³
    ldx    ram_F0                ; 3
    ldy    #$00                  ; 2
    sty    ram_E6,X              ; 4
    iny                          ; 2
    sty    ram_D6,X              ; 4
LF4BC:
    lda    ram_A3                ; 3
    cmp    #$70                  ; 2
    bcs    LF4C4                 ; 2³
    inc    ram_A3                ; 5
LF4C4:
    lda    ram_AB                ; 3
    cmp    #$20                  ; 2
    bcs    LF4FA                 ; 2³
    lda    ram_9B                ; 3
    cmp    #$EC                  ; 2
    bne    LF4DF                 ; 2³
    lda    ram_A3                ; 3
    cmp    #$60                  ; 2
    beq    LF4EC                 ; 2³
    lda    ram_80                ; 3
    and    #$01                  ; 2
    tax                          ; 2
    sec                          ; 2
    jmp    LFA54                 ; 3

LF4DF:
    ldx    #$00                  ; 2
    lda    #$03                  ; 2
    jsr    LFC41                 ; 6
    lda    ram_D4                ; 3
    cmp    #$04                  ; 2
    bcs    LF4FC                 ; 2³
LF4EC:
    bit    ram_E0                ; 3
    bvc    LF4F6                 ; 2³
    lda    #$03                  ; 2
    sta    ram_D6                ; 3
    sta    ram_E0                ; 3
LF4F6:
    lda    #$00                  ; 2
    sta    ram_D4                ; 3
LF4FA:
    dec    ram_AB                ; 5
LF4FC:
    jmp    LFA69                 ; 3

LF4FF:
    ldx    #$01                  ; 2
    ldy    ram_96                ; 3
    cpy    #$02                  ; 2
    beq    LF50A                 ; 2³
    bcs    LF52B                 ; 2³
    dex                          ; 2
LF50A:
    lda    ram_DD                ; 3
    cmp    #$50                  ; 2
    lda    ram_AE,X              ; 4
    bcs    LF51A                 ; 2³
    cmp    LFD31,X               ; 4
    bcc    LF523                 ; 2³
    jmp    LF9A1                 ; 3

LF51A:
    lda    ram_AE                ; 3
    cmp    #$A3                  ; 2
    bcs    LF4EC                 ; 2³+1
    jmp    LFA11                 ; 3

LF523:
    lda    ram_DD                ; 3
    cmp    #$22                  ; 2
    bcc    LF52B                 ; 2³
    inc    ram_DD                ; 5
LF52B:
    ldy    ram_96                ; 3
    cpy    #$01                  ; 2
    bne    LF545                 ; 2³
    lda    ram_A9                ; 3
    cmp    #$A8                  ; 2
    beq    LF545                 ; 2³
    inc    ram_A9                ; 5
    inc    ram_A1                ; 5
    lda    ram_A9                ; 3
    cmp    #$9F                  ; 2
    bcc    LF545                 ; 2³
    inc    ram_9B                ; 5
    inc    ram_9D                ; 5
LF545:
    cpy    #$04                  ; 2
    bcs    LF54C                 ; 2³
    jsr    LFBCD                 ; 6
LF54C:
    lda    ram_98                ; 3
    cmp    ram_99                ; 3
    beq    LF59D                 ; 2³
    ldy    ram_96                ; 3
    cpy    #$03                  ; 2
    bne    LF59D                 ; 2³
    ldy    #$01                  ; 2
    ldx    #$00                  ; 2
    lda    ram_98                ; 3
    bne    LF562                 ; 2³
    dey                          ; 2
    inx                          ; 2
LF562:
    lda    ram_AE,X              ; 4
    dex                          ; 2
    beq    LF56A                 ; 2³
    clc                          ; 2
    adc    #$11                  ; 2
LF56A:
    sec                          ; 2
    sbc.wy ram_AE,Y              ; 4
    bcc    LF59D                 ; 2³
    cmp    #$36                  ; 2
    bcs    LF59D                 ; 2³
    cmp    #$0D                  ; 2
    bcc    LF59D                 ; 2³
    inc    ram_DD                ; 5
    bpl    LF597                 ; 2³
    lda    #$7C                  ; 2
    sta    ram_A7                ; 3
    sta    ram_A9                ; 3
    lda    #$DA                  ; 2
    sta    ram_A8                ; 3
    sta    ram_AA                ; 3
    lda    #$AC                  ; 2
    sta    ram_9F                ; 3
    sta    ram_A1                ; 3
    lda    #$DA                  ; 2
    sta    ram_A0                ; 3
    sta    ram_A2                ; 3
    jsr    LFC17                 ; 6
LF597:
    jmp    LFA69                 ; 3

LF59A:
    jmp    LF655                 ; 3

LF59D:
    ldx    ram_96                ; 3
    cpx    #$04                  ; 2
    bcc    LF59A                 ; 2³
    lda    ram_95                ; 3
    rol                          ; 2
    rol                          ; 2
    and    #$01                  ; 2
    and    ram_80                ; 3
    bne    LF597                 ; 2³
    ldy    ram_97                ; 3
    cpx    #$05                  ; 2
    beq    LF5BF                 ; 2³
    iny                          ; 2
    iny                          ; 2
    sty    ram_97                ; 3
    cpy    #$65                  ; 2
    bne    LF600                 ; 2³+1
    inc    ram_96                ; 5
    bne    LF600                 ; 2³+1
LF5BF:
    tya                          ; 2
    beq    LF5D6                 ; 2³
    dey                          ; 2
    dey                          ; 2
    sty    ram_97                ; 3
    cpy    #$19                  ; 2
    bcs    LF600                 ; 2³+1
    ldx    #$00                  ; 2
    stx    ram_97                ; 3
    lda    ram_A3                ; 3
    cmp    #$26                  ; 2
    bcs    LF5D6                 ; 2³
    stx    ram_A3                ; 3
LF5D6:
    lda    ram_A3                ; 3
    bne    LF615                 ; 2³+1
    lda    #$EC                  ; 2
    sta    ram_9B                ; 3
    lda    #$DC                  ; 2
    sta    ram_9C                ; 3
    ldx    ram_F0                ; 3
    lda    ram_E6,X              ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    adc    #$01                  ; 2
    jsr    LFD85                 ; 6
    dec    ram_DF                ; 5
    bne    LF5F6                 ; 2³
    jsr    LFC17                 ; 6
LF5F6:
    lda    #$1F                  ; 2
    sta    ram_AB                ; 3
LF5FA:
    sec                          ; 2
    ror    ram_DD                ; 5
LF5FD:
    jmp    LFA69                 ; 3

LF600:
    bit    ram_95                ; 3
    bpl    LF5FD                 ; 2³+1
    lda    ram_B0                ; 3
    clc                          ; 2
    adc    #$09                  ; 2
    sta    ram_AB                ; 3
    lda    ram_97                ; 3
    sta    ram_A3                ; 3
    lda    #$22                  ; 2
    sta    ram_DD                ; 3
    bne    LF5FD                 ; 3+1   always branch

LF615:
    lda    #$22                  ; 2
    sta    ram_DD                ; 3
    lda    ram_AB                ; 3
    cmp    ram_AF                ; 3
    beq    LF626                 ; 2³
    bcs    LF624                 ; 2³
    inc    ram_AB                ; 5

    .byte $2C ; BIT opcode, skip 2 bytes
LF624:
    dec    ram_AB                ; 5
LF626:
    lda    ram_A3                ; 3
    cmp    #$19                  ; 2
    bcs    LF650                 ; 2³
    lda    ram_AB                ; 3
    cmp    ram_AF                ; 3
    bne    LF5FD                 ; 2³+1
    lda    #$7C                  ; 2
    sta    ram_A9                ; 3
    lda    #$DA                  ; 2
    sta    ram_AA                ; 3
    lda    #$AC                  ; 2
    sta    ram_A1                ; 3
    lda    #$DA                  ; 2
    sta    ram_A2                ; 3
    dec    ram_E0                ; 5
    lda    ram_E0                ; 3
    cmp    #$02                  ; 2
    bcs    LF64D                 ; 2³
    jsr    LFC17                 ; 6
LF64D:
    jmp    LF5FA                 ; 3

LF650:
    dec    ram_A3                ; 5
LF652:
    jmp    LFA69                 ; 3

LF655:
    ldx    ram_F0                ; 3
    lda    ram_D6,X              ; 4
    bpl    LF668                 ; 2³
    lda    ram_E6,X              ; 4
    bne    LF668                 ; 2³
    lda    ram_96                ; 3
    cmp    #$04                  ; 2
    bcs    LF668                 ; 2³
    sec                          ; 2
    ror    ram_DD                ; 5
LF668:
    bit    ram_D5                ; 3
    bvs    LF652                 ; 2³
    ldx    ram_D4                ; 3
    cpx    #$04                  ; 2
    bcs    LF675                 ; 2³
    jmp    LF721                 ; 3

LF675:
    lda    ram_94                ; 3
    bne    LF686                 ; 2³
    lda    #$05                  ; 2
    sta    ram_D4                ; 3
    jsr    LFBCD                 ; 6
    lda    #$03                  ; 2
    sta    ram_96                ; 3
    sta    ram_DD                ; 3
LF686:
    lda    ram_93                ; 3
    beq    LF6C1                 ; 2³
    lda    ram_80                ; 3
    lsr                          ; 2
    bcs    LF652                 ; 2³
    dec    ram_93                ; 5
    bne    LF652                 ; 2³
    lda    ram_A6                ; 3
    beq    LF69B                 ; 2³
    lda    ram_94                ; 3
    bne    LF6A3                 ; 2³
LF69B:
    lda    #$FF                  ; 2
    sta    ram_EF                ; 3
    inc    ram_93                ; 5
    bne    LF652                 ; 2³
LF6A3:
    lda    #$A3                  ; 2
    sta    ram_AE                ; 3
    lda    #$E6                  ; 2
    sta    ram_9F                ; 3
    lda    #$D2                  ; 2
    sta    ram_A0                ; 3
    lda    #$80                  ; 2
    sta    ram_A7                ; 3
    lda    #$DD                  ; 2
    sta    ram_A8                ; 3
    lda    #$00                  ; 2
    sta    ram_80                ; 3
    lda    #$30                  ; 2
    sta    ram_AF                ; 3
    bne    LF6DC                 ; 3   always branch

LF6C1:
    lda    CXPPMM                ; 3
    bpl    LF6DC                 ; 2³
    lda    #$7C                  ; 2
    sta    ram_A7                ; 3
    lda    #$AC                  ; 2
    sta    ram_9F                ; 3
    lda    #$DA                  ; 2
    sta    ram_A0                ; 3
    sta    ram_A8                ; 3
    lda    #$30                  ; 2
    sta    ram_93                ; 3
    dec    ram_A6                ; 5
    jmp    LFA69                 ; 3

LF6DC:
    lda    ram_80                ; 3
    and    #$40                  ; 2
    bne    LF6E5                 ; 2³
    inc    ram_AF                ; 5

    .byte $2C ; BIT opcode, skip 2 bytes
LF6E5:
    dec    ram_AF                ; 5
    lda    ram_99                ; 3
    ora    #$08                  ; 2
    ldy    ram_AF                ; 3
    cpy    #$4F                  ; 2
    bcs    LF6F3                 ; 2³
    and    #$F7                  ; 2
LF6F3:
    sta    ram_99                ; 3
    lda    ram_80                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$03                  ; 2
    tax                          ; 2
    lda    ram_80                ; 3
    and    #$3F                  ; 2
    bne    LF707                 ; 2³
    ldy    #$C6                  ; 2
    sty    ram_A9                ; 3
LF707:
    cmp    #$1F                  ; 2
    bcc    LF70F                 ; 2³
    txa                          ; 2
    eor    #$03                  ; 2
    tax                          ; 2
LF70F:
    lda    ram_80                ; 3
    and    LFD20,X               ; 4
    bne    LF721                 ; 2³
    lda    ram_80                ; 3
    and    #$20                  ; 2
    beq    LF71F                 ; 2³
    inc    ram_A9                ; 5

    .byte $2C ; BIT opcode, skip 2 bytes
LF71F:
    dec    ram_A9                ; 5
LF721:
    ldx    ram_D4                ; 3
    cpx    #$01                  ; 2
    bne    LF730                 ; 2³
    lda    ram_A9                ; 3
    bmi    LF76E                 ; 2³
    beq    LF730                 ; 2³
    jmp    LF83D                 ; 3

LF730:
    lda    INPT4                 ; 3
    ora    ram_EF                ; 3
    bmi    LF771                 ; 2³
    bit    ram_DC                ; 3
    bmi    LF76B                 ; 2³
    lda    ram_DC                ; 3
    ora    #$80                  ; 2
    sta    ram_DC                ; 3
    txa                          ; 2
    bne    LF774                 ; 2³
    lda    SWCHA                 ; 4
    and    #$20                  ; 2
    sta    ram_EB                ; 3
    lda    ram_DC                ; 3
    and    #$DF                  ; 2
    ora    ram_EB                ; 3
    sta    ram_DC                ; 3
    jsr    LFEAE                 ; 6
    bcs    LF76B                 ; 2³
    stx    ram_DD                ; 3
    ldx    #$02                  ; 2
    lda    ram_A0                ; 3
    beq    LF769                 ; 2³
    sec                          ; 2
    sbc    #$01                  ; 2
    sta    ram_BC                ; 3
    lda    #$00                  ; 2
    sta    ram_9F                ; 3
    dex                          ; 2
LF769:
    stx    ram_D4                ; 3
LF76B:
    jmp    LF8BD                 ; 3

LF76E:
    jmp    LF874                 ; 3

LF771:
    jmp    LF8B7                 ; 3

LF774:
    cpx    #$01                  ; 2
    bne    LF77B                 ; 2³
    jmp    LF823                 ; 3

LF77B:
    cpx    #$02                  ; 2
    beq    LF7BA                 ; 2³
    cpx    #$04                  ; 2
    bcs    LF76B                 ; 2³
    ldx    ram_BC                ; 3
    cpx    #$03                  ; 2
    lda    LFD9D,X               ; 4
    sta    ram_EB                ; 3
    and    ram_DE                ; 3
    bcs    LF7AC                 ; 2³
    bne    LF76B                 ; 2³
    lda    ram_DE                ; 3
LF794:
    ora    ram_EB                ; 3
    sta    ram_EE                ; 3
    lda    LFD45,X               ; 4
    jsr    LFD72                 ; 6
    bcc    LF76B                 ; 2³
    sta    ram_C0                ; 3
    lda    ram_EC                ; 3
    sta    ram_C1                ; 3
    lda    ram_EE                ; 3
    sta    ram_DE                ; 3
    bcs    LF76B                 ; 3   always branch

LF7AC:
    cmp    #$90                  ; 2
    bcs    LF76B                 ; 2³
    adc    #$10                  ; 2
    sta    ram_EB                ; 3
    lda    #$0F                  ; 2
    and    ram_DE                ; 3
    bpl    LF794                 ; 3   always branch

LF7BA:
    lda    ram_96                ; 3
    bne    LF7CA                 ; 2³
    lda    ram_DD                ; 3
    cmp    #$22                  ; 2
    bcs    LF76B                 ; 2³
    inc    ram_A9                ; 5
    inc    ram_A1                ; 5
    bne    LF811                 ; 2³+1
LF7CA:
    cmp    #$01                  ; 2
    bne    LF7F0                 ; 2³
    lda    ram_A9                ; 3
    cmp    #$A8                  ; 2
    bne    LF76B                 ; 2³
    lda    ram_AF                ; 3
    sbc    #$09                  ; 2
    sta    ram_B0                ; 3
    lda    #$DD                  ; 2
    sta    ram_AA                ; 3
    lda    #$80                  ; 2
    sta    ram_A9                ; 3
    lda    #$D2                  ; 2
    sta    ram_A2                ; 3
    lda    #$E6                  ; 2
    sta    ram_A1                ; 3
    lda    #$B3                  ; 2
    sta    ram_AF                ; 3
    bne    LF811                 ; 3+1   always branch

LF7F0:
    cmp    #$02                  ; 2
    bne    LF816                 ; 2³+1
    ldx    #$01                  ; 2
LF7F6:
    lda    ram_AE,X              ; 4
    ldy    ram_98,X              ; 4
    bne    LF804                 ; 2³+1
    clc                          ; 2
    adc    LFD35,X               ; 4
    ldy    #$06                  ; 2
    bne    LF80A                 ; 3   always branch

LF804:
    sec                          ; 2
    sbc    LFD33,X               ; 4
    ldy    #$5A                  ; 2
LF80A:
    sta    ram_AC,X              ; 4
    sty    ram_A4,X              ; 4
    dex                          ; 2
    bpl    LF7F6                 ; 2³+1
LF811:
    inc    ram_96                ; 5
LF813:
    jmp    LF8BD                 ; 3

LF816:
    cmp    #$03                  ; 2
    bne    LF813                 ; 2³
    lda    #$19                  ; 2
    sta    ram_97                ; 3
    inc    ram_96                ; 5
    jmp    LFA69                 ; 3

LF823:
    lda    ram_A7                ; 3
    cmp    #$05                  ; 2
    bcc    LF861                 ; 2³
    lda    ram_AE                ; 3
    adc    #$10                  ; 2
    sec                          ; 2
    sbc    ram_AC                ; 3
    bcc    LF861                 ; 2³
    cmp    #$23                  ; 2
    bcs    LF813                 ; 2³
    lda    ram_DE                ; 3
    lsr                          ; 2
    bcc    LF861                 ; 2³
    inc    ram_A9                ; 5
LF83D:
    lda    ram_AE                ; 3
    clc                          ; 2
    adc    #$07                  ; 2
    sta    ram_ED                ; 3
    sec                          ; 2
    sbc    ram_AC                ; 3
    bcc    LF851                 ; 2³
    inc    ram_AC                ; 5
    inc    ram_AC                ; 5
    cmp    #$05                  ; 2
    bcs    LF855                 ; 2³
LF851:
    dec    ram_AC                ; 5
    dec    ram_AC                ; 5
LF855:
    lda    ram_A7                ; 3
    cmp    #$62                  ; 2
    bcs    LF86B                 ; 2³
    adc    #$04                  ; 2
    sta    ram_A7                ; 3
    cmp    #$60                  ; 2
LF861:
    bcc    LF8BD                 ; 2³
    lda    ram_ED                ; 3
    sbc    ram_AC                ; 3
    bcc    LF8BD                 ; 2³
    cmp    #$05                  ; 2
LF86B:
    bcs    LF8BD                 ; 2³
    lda    #$62                  ; 2
    sta    ram_A7                ; 3
    sec                          ; 2
    ror    ram_A9                ; 5
LF874:
    lda    ram_80                ; 3
    and    #$04                  ; 2
    asl                          ; 2
    ora    #$80                  ; 2
    sta    ram_BD                ; 3
    lda    ram_80                ; 3
    and    #$07                  ; 2
    bne    LF8BD                 ; 2³
    ldx    #$1B                  ; 2
LF885:
    sta    ram_82,X              ; 4
    dex                          ; 2
    bpl    LF885                 ; 2³
    ldy    ram_A8                ; 3
    lda    #$FF                  ; 2
    sta    ram_EC                ; 3
    lda    LFD3B,Y               ; 4
    sta    ram_EB                ; 3
    lda    LFD40,Y               ; 4
    tay                          ; 2
    ldx    #$1C                  ; 2
LF89B:
    lda    (ram_EB),Y            ; 5
    sta    ram_82,X              ; 4
    dex                          ; 2
    dey                          ; 2
    bpl    LF89B                 ; 2³
    dec    ram_A8                ; 5
    bpl    LF8BD                 ; 2³
    iny                          ; 2
    sty    ram_A9                ; 3
    lda    #$C2                  ; 2
    sta    ram_A7                ; 3
    jsr    LFDA5                 ; 6
    lda    #$03                  ; 2
    sta    ram_A8                ; 3
    bne    LF8BD                 ; 3   always branch

LF8B7:
    lda    ram_DC                ; 3
    and    #$7F                  ; 2
    sta    ram_DC                ; 3
LF8BD:
    lda    SWCHA                 ; 4
    bit    ram_EF                ; 3
    bpl    LF8C6                 ; 2³
    lda    #$FF                  ; 2
LF8C6:
    sta    ram_EB                ; 3
    bit    ram_EE                ; 3
    bpl    LF8CF                 ; 2³
    jmp    LFA2E                 ; 3

LF8CF:
    and    #$10                  ; 2
    bne    LF91B                 ; 2³+1
    lda    ram_D4                ; 3
    bne    LF8E6                 ; 2³
    lda    ram_DB                ; 3
    cmp    #$6F                  ; 2
    beq    LF91B                 ; 2³+1
    jsr    LFF53                 ; 6
    bcs    LF91B                 ; 2³+1
    inc    ram_DB                ; 5
    bne    LF91B                 ; 2³+1
LF8E6:
    cmp    #$03                  ; 2
    bne    LF91B                 ; 2³+1
    lda    ram_BC                ; 3
    beq    LF91B                 ; 2³+1
    lda    #$FE                  ; 2
    sta    ram_EC                ; 3
LF8F2:
    inc    ram_A7                ; 5
    lda    ram_A7                ; 3
    cmp    #$0C                  ; 2
    bcc    LF908                 ; 2³+1
    lda    ram_BC                ; 3
    adc    ram_EC                ; 3
    sta    ram_BC                ; 3
    tax                          ; 2
    lda    LFEAA,X               ; 4
    sta    ram_91                ; 3
    bne    LF95D                 ; 2³
LF908:
    jmp    LFA71                 ; 3

LF90B:
    cmp    #$03                  ; 2
    bne    LF930                 ; 2³
    lda    ram_BC                ; 3
    cmp    #$03                  ; 2
    bcs    LF930                 ; 2³
    lda    #$00                  ; 2
    sta    ram_EC                ; 3
    beq    LF8F2                 ; 3+1   always branch

LF91B:
    lda    ram_EB                ; 3
    and    #$20                  ; 2
    bne    LF930                 ; 2³
    lda    ram_D4                ; 3
    bne    LF90B                 ; 2³
    lda    ram_DB                ; 3
    beq    LF930                 ; 2³
    jsr    LFF53                 ; 6
    bcs    LF930                 ; 2³
    dec    ram_DB                ; 5
LF930:
    ldx    ram_D4                ; 3
    cpx    #$02                  ; 2
    bcs    LF966                 ; 2³
    bit    ram_EB                ; 3
    bpl    LF960                 ; 2³
    bvs    LF95D                 ; 2³
    lda    ram_AD                ; 3
    cmp    #$20                  ; 2
    beq    LF94C                 ; 2³
    dec    ram_AD                ; 5
    dec    ram_AE                ; 5
    lda    ram_A9                ; 3
    beq    LF94C                 ; 2³
    dec    ram_AC                ; 5
LF94C:
    lda    ram_D4                ; 3
    bne    LF95D                 ; 2³
    lda    ram_B6                ; 3
    cmp    #$23                  ; 2
    beq    LF95D                 ; 2³
    jsr    LFF23                 ; 6
    bcs    LF95D                 ; 2³
    dec    ram_B6                ; 5
LF95D:
    jmp    LFA69                 ; 3

LF960:
    jmp    LFA2E                 ; 3

LF963:
    jmp    LFA5D                 ; 3

LF966:
    ldx    #$00                  ; 2
    ldy    ram_96                ; 3
    cpy    #$02                  ; 2
    bcc    LF96F                 ; 2³
    inx                          ; 2
LF96F:
    lda    ram_AE,X              ; 4
    bit    ram_EB                ; 3
    bpl    LF9BE                 ; 2³
    bvs    LF963                 ; 2³
    cpy    #$03                  ; 2
    beq    LF9C1                 ; 2³
    sta    ram_EB                ; 3
    lda    ram_D4                ; 3
    cmp    #$04                  ; 2
    bne    LF99A                 ; 2³
    lda    ram_EB                ; 3
LF985:
    cmp    #$21                  ; 2
    bcs    LF9A1                 ; 2³
    lda    #$A3                  ; 2
    sta    ram_AE                ; 3
    lda    #$FF                  ; 2
    dec    ram_94                ; 5
    beq    LF995                 ; 2³
    lda    #$30                  ; 2
LF995:
    sta    ram_93                ; 3
    jmp    LF963                 ; 3

LF99A:
    lda    ram_EB                ; 3
    cmp    LFD2D,X               ; 4
    bcc    LF963                 ; 2³
LF9A1:
    dec    ram_AE,X              ; 6
    lda    ram_98,X              ; 4
    and    #$08                  ; 2
    bne    LF9B6                 ; 2³
    lda    #$08                  ; 2
    sta    ram_98,X              ; 4
    tya                          ; 2
    bne    LF9BB                 ; 2³
    lda    ram_AF                ; 3
    sbc    #$0E                  ; 2
    sta    ram_AF                ; 3
LF9B6:
    tya                          ; 2
    bne    LF9BB                 ; 2³
    dec    ram_AF                ; 5
LF9BB:
    jmp    LFA51                 ; 3

LF9BE:
    jmp    LFA08                 ; 3

LF9C1:
    ldx    #$00                  ; 2
    ldy    #$01                  ; 2
    lda    ram_AE                ; 3
    cmp    ram_AF                ; 3
    bcs    LF9CD                 ; 2³
    inx                          ; 2
    dey                          ; 2
LF9CD:
    lda    ram_AE,X              ; 4
    cpx    #$01                  ; 2
    beq    LF9D6                 ; 2³
    clc                          ; 2
    adc    #$11                  ; 2
LF9D6:
    sec                          ; 2
    sbc.wy ram_AE,Y              ; 4
    cmp    #$11                  ; 2
    bcc    LF9E2                 ; 2³
    dec    ram_AE,X              ; 6
    dec    ram_AC,X              ; 6
LF9E2:
    jmp    LFA5D                 ; 3

LF9E5:
    ldx    #$00                  ; 2
    ldy    #$01                  ; 2
    lda    ram_AF                ; 3
    cmp    ram_AE                ; 3
    bcs    LF9F1                 ; 2³
    dey                          ; 2
    inx                          ; 2
LF9F1:
    lda.wy ram_AE,Y              ; 4
    cpy    #$01                  ; 2
    beq    LF9FB                 ; 2³
    clc                          ; 2
    adc    #$11                  ; 2
LF9FB:
    sec                          ; 2
    sbc    ram_AE,X              ; 4
    cmp    #$11                  ; 2
    bcc    LFA06                 ; 2³
    inc    ram_AE,X              ; 6
    inc    ram_AC,X              ; 6
LFA06:
    bne    LFA5D                 ; 2³
LFA08:
    cpy    #$03                  ; 2
    beq    LF9E5                 ; 2³+1
    cmp    LFD2F,X               ; 4
    bcs    LFA5D                 ; 2³
LFA11:
    inc    ram_AE,X              ; 6
    lda    ram_98,X              ; 4
    and    #$08                  ; 2
    beq    LFA27                 ; 2³
    lda    #$00                  ; 2
    sta    ram_98,X              ; 4
    cpy    #$00                  ; 2
    bne    LFA51                 ; 2³
    lda    ram_AF                ; 3
    adc    #$0D                  ; 2
    sta    ram_AF                ; 3
LFA27:
    tya                          ; 2
    bne    LFA51                 ; 2³
    inc    ram_AF                ; 5
    bne    LFA51                 ; 2³
LFA2E:
    lda    ram_AD                ; 3
    cmp    #$87                  ; 2
    beq    LFA3E                 ; 2³
    inc    ram_AD                ; 5
    inc    ram_AE                ; 5
    lda    ram_A9                ; 3
    beq    LFA3E                 ; 2³
    inc    ram_AC                ; 5
LFA3E:
    lda    ram_D4                ; 3
    bne    LFA69                 ; 2³
    lda    ram_B6                ; 3
    cmp    #$A3                  ; 2
    beq    LFA69                 ; 2³
    jsr    LFF23                 ; 6
    bcs    LFA69                 ; 2³
    inc    ram_B6                ; 5
    bne    LFA69                 ; 2³
LFA51:
    lda    ram_AE,X              ; 4
    lsr                          ; 2
LFA54:
    ldy    ram_9A                ; 3
    bcc    LFA69                 ; 2³
    iny                          ; 2
    cpy    #$03                  ; 2
    bcc    LFA5F                 ; 2³
LFA5D:
    ldy    #$00                  ; 2
LFA5F:
    sty    ram_9A                ; 3
    txa                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda    LFF8C,Y               ; 4
    sta    ram_A7,X              ; 4
LFA69:
    lda    ram_D4                ; 3
    cmp    #$03                  ; 2
    bne    LFA71                 ; 2³
    sta    ram_A7                ; 3
LFA71:
    lda    ram_D4                ; 3
    cmp    #$03                  ; 2
    bne    LFA7E                 ; 2³
    ldx    ram_BC                ; 3
    lda    LFD45,X               ; 4
    sta    ram_C3                ; 3
LFA7E:
    lda    ram_D4                ; 3
    cmp    #$03                  ; 2
    bcs    LFA93                 ; 2³
    lda    ram_C4                ; 3
    adc    #$06                  ; 2
    clc                          ; 2
    adc    ram_E1                ; 3
    sta    ram_E1                ; 3
    bcs    LFA96                 ; 2³
    bit    ram_D5                ; 3
    bvs    LFA9B                 ; 2³
LFA93:
    jmp    LFB12                 ; 3

LFA96:
    lda    #$01                  ; 2
    jsr    LFC3F                 ; 6
LFA9B:
    ldy    ram_D4                ; 3
    bne    LFB12                 ; 2³+1
    bit    ram_BD                ; 3
    bmi    LFB12                 ; 2³+1
    lda    ram_D5                ; 3
    and    #$20                  ; 2
    bne    LFB12                 ; 2³+1
    bit    ram_D5                ; 3
    bvs    LFAC2                 ; 2³
    lda    ram_B7                ; 3
    bne    LFAC2                 ; 2³
    lda    #$77                  ; 2
    sta    ram_B7                ; 3
    lda    ram_81                ; 3
    asl                          ; 2
    and    #$1F                  ; 2
    bcc    LFABE                 ; 2³
    adc    #$54                  ; 2
LFABE:
    adc    #$20                  ; 2
    sta    ram_B1                ; 3
LFAC2:
    ldx    #$04                  ; 2
LFAC4:
    lda    ram_B7,X              ; 4
    cmp    #$02                  ; 2
    bcc    LFB0A                 ; 2³+1
    and    LFBB4,X               ; 4
    bne    LFADD                 ; 2³
    lda    ram_B1,X              ; 4
    cmp    #$7B                  ; 2
    beq    LFADD                 ; 2³
    bcc    LFADB                 ; 2³
    dec    ram_B1,X              ; 6
    bne    LFADD                 ; 2³
LFADB:
    inc    ram_B1,X              ; 6
LFADD:
    inc    ram_B7,X              ; 6
    lda    ram_B7,X              ; 4
    cmp    LFBB9,X               ; 4
    bcc    LFB00                 ; 2³+1
    lda    #$01                  ; 2
    sta    ram_B7,X              ; 4
    lda    LFBBE,X               ; 4
    cpx    #$04                  ; 2
    bne    LFAF4                 ; 2³
    iny                          ; 2
    bne    LFB00                 ; 2³+1
LFAF4:
    sta    ram_B8,X              ; 4
    lda    ram_B1,X              ; 4
    cpx    #$03                  ; 2
    bne    LFAFE                 ; 2³
    adc    #$08                  ; 2
LFAFE:
    sta    ram_B2,X              ; 4
LFB00:
    lda    ram_B9                ; 3
    cmp    #$64                  ; 2
    bne    LFB0A                 ; 2³
    lda    #$00                  ; 2
    sta    ram_B7                ; 3
LFB0A:
    dex                          ; 2
    bpl    LFAC4                 ; 2³+1
    tya                          ; 2
    inx                          ; 2
    jsr    LFC41                 ; 6
LFB12:
    ldx    #$00                  ; 2
    stx    ram_EE                ; 3
    lda    ram_DC                ; 3
    and    #$0F                  ; 2
    cmp    ram_D4                ; 3
    beq    LFB74                 ; 2³
    lda    ram_DC                ; 3
    and    #$F0                  ; 2
    ora    ram_D4                ; 3
    sta    ram_DC                ; 3
    lda    ram_D4                ; 3
    beq    LFB69                 ; 2³
    tax                          ; 2
    lda    LFC2B-1,X             ; 4
    sta    ram_EB                ; 3
    lda    LFC35-1,X             ; 4
    sta    ram_ED                ; 3
    lda    LFC30-1,X             ; 4
    sta    ram_EC                ; 3
    ldy    LFC3A-1,X             ; 4
    jsr    LFBFF                 ; 6
    cpx    #$02                  ; 2
    bne    LFB5E                 ; 2³
    bit    ram_E0                ; 3
    bvc    LFB74                 ; 2³
    lda    #$50                  ; 2
    sta    ram_AE                ; 3
    sta    ram_AF                ; 3
    sta    ram_DD                ; 3
    lda    #$A8                  ; 2
    sta    ram_A9                ; 3
    lda    ram_DE                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_DF                ; 3
    bne    LFB74                 ; 2³
LFB5E:
    cpx    #$05                  ; 2
    bne    LFB74                 ; 2³
    lda    #$20                  ; 2
    jsr    LFD85                 ; 6
    bmi    LFB74                 ; 3   always branch
    
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP


LFB69:
    sta    ram_9F                ; 3
    sta    ram_A0                ; 3
    sta    ram_A1                ; 3
    sta    ram_BD                ; 3
    jsr    LFBAB                 ; 6
LFB74:
    ldy    ram_D4                ; 3
    cpy    #$03                  ; 2
    bne    LFBA2                 ; 2³
;    lda    SWCHB                 ; 4
;    and    #$40                  ; 2
;    cmp    ram_BA                ; 3
;    beq    LFBA2                 ; 2³
;    sta    ram_BA                ; 3

    LDA    INPT1
    BMI    LFBA2


    lda    ram_DE                ; 3
    and    #$F0                  ; 2
    beq    LFBA2                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_DF                ; 3
    sty    ram_E0                ; 3
    ldx    #$00                  ; 2
    stx    ram_D4                ; 3
    stx    ram_C3                ; 3
    jsr    LFBEE                 ; 6
    jsr    LFDA1                 ; 6
    jmp    LF03D                 ; 3

LFBA2:
    jmp    LFFEC                 ; 3

LFBA5:
    .byte $0A ; |    X X | $FBA5
    .byte $BC ; |X XXXX  | $FBA6
    .byte $DE ; |XX XXXX | $FBA7
    .byte $0F ; |    XXXX| $FBA8
    .byte $19 ; |   XX  X| $FBA9
    .byte $85 ; |X    X X| $FBAA

LFBAB:
    lda    #$7D                  ; 2
    sta    $93                   ; 3
    lda    #$D1                  ; 2
    sta    $94                   ; 3
    rts                          ; 6

LFBB4:
    .byte $07 ; |     XXX| $FBB4
    .byte $03 ; |      XX| $FBB5
    .byte $03 ; |      XX| $FBB6
    .byte $01 ; |       X| $FBB7
    .byte $00 ; |        | $FBB8
LFBB9:
    .byte $82 ; |X     X | $FBB9
    .byte $82 ; |X     X | $FBBA
    .byte $82 ; |X     X | $FBBB
    .byte $82 ; |X     X | $FBBC
    .byte $A1 ; |X X    X| $FBBD
LFBBE:
    .byte $5D ; | X XXX X| $FBBE
    .byte $5D ; | X XXX X| $FBBF
    .byte $5D ; | X XXX X| $FBC0
    .byte $7C ; | XXXXX  | $FBC1

LFBC2:
;    lda    SWCHB                 ; 4
;    and    #$80                  ; 2
;    lsr                          ; 2
    LDA    INPT1
    AND    #$80
    LSR
    NOP
    
    sta    ram_EB                ; 3
    lda    ram_DC                ; 3
    rts                          ; 6

LFBCD:
    ldx    #$01                  ; 2
LFBCF:
    ldy    #$00                  ; 2
    lda    ram_98,X              ; 4
    beq    LFBD6                 ; 2³
    iny                          ; 2
LFBD6:
    lda    ram_A4,X              ; 4
    sec                          ; 2
    sbc    #$02                  ; 2
    cmp    LFD37,Y               ; 4
    bcs    LFBE3                 ; 2³
    lda    LFD39,Y               ; 4
LFBE3:
    sta    ram_A4,X              ; 4
    dex                          ; 2
    bpl    LFBCF                 ; 2³
    rts                          ; 6

LFBE9:
    .byte $3F ; |  XXXXXX| $FBE9
    .byte $1F ; |   XXXXX| $FBEA
    .byte $0F ; |    XXXX| $FBEB
    .byte $07 ; |     XXX| $FBEC
    .byte $07 ; |     XXX| $FBED

LFBEE:
    lda    #$01                  ; 2
    sta    ram_E2                ; 3
    sta    ram_E4                ; 3
    lda    #$07                  ; 2
    sta    ram_E3                ; 3
    sta    ram_E5                ; 3
    rts                          ; 6

LFBFB:
    .byte $BC ; |X XXXX  | $FBFB
    .byte $FC ; |XXXXXX  | $FBFC
    .byte $B1 ; |X XX   X| $FBFD
    .byte $00 ; |        | $FBFE

LFBFF:
    lda    (ram_EB),Y            ; 5
    sta    (ram_ED),Y            ; 6
    dey                          ; 2
    bpl    LFBFF                 ; 2³+1
    ldy    ram_D4                ; 3
    dey                          ; 2
    bne    LFC16                 ; 2³
    ldy    #$1C                  ; 2
LFC0D:
    lda    LFF8F,Y               ; 4
    sta.wy ram_82,Y              ; 5
    dey                          ; 2
    bpl    LFC0D                 ; 2³
LFC16:
    rts                          ; 6

LFC17:
    lda    ram_E0                ; 3
    ora    #$80                  ; 2
    sta    ram_E0                ; 3
    lda    #$82                  ; 2
    sta    ram_D6                ; 3
LFC21:
    ldx    #$04                  ; 2
    lda    #$01                  ; 2
LFC25:
    sta    ram_D6,X              ; 4
    dex                          ; 2
    bne    LFC25                 ; 2³
    rts                          ; 6

LFC2B:
    .byte $AF ; |X X XXXX| $FC2B
    .byte $C5 ; |XX   X X| $FC2C
    .byte $00 ; |        | $FC2D
    .byte $E0 ; |XXX     | $FC2E
    .byte $FE ; |XXXXXXX | $FC2F
LFC30:
    .byte $FC ; |XXXXXX  | $FC30
    .byte $FC ; |XXXXXX  | $FC31
    .byte $00 ; |        | $FC32
    .byte $FC ; |XXXXXX  | $FC33
    .byte $FC ; |XXXXXX  | $FC34
LFC35:
    .byte $A2 ; |X X   X | $FC35
    .byte $96 ; |X  X XX | $FC36
    .byte $00 ; |        | $FC37
    .byte $93 ; |X  X  XX| $FC38
    .byte $96 ; |X  X XX | $FC39
LFC3A:
    .byte $0C ; |    XX  | $FC3A
    .byte $1A ; |   XX X | $FC3B
    .byte $00 ; |        | $FC3C
    .byte $1D ; |   XXX X| $FC3D
    .byte $1A ; |   XX X | $FC3E

LFC3F:
    ldx    #$01                  ; 2
LFC41:
    ldy    ram_C0                ; 3
    cpy    #$0A                  ; 2
    beq    LFCAE                 ; 2³
    sed                          ; 2
    clc                          ; 2
    ldy    ram_C4                ; 3
LFC4B:
    adc    ram_C4,X              ; 4
    sta    ram_C4,X              ; 4
    lda    #$00                  ; 2
    dex                          ; 2
    bpl    LFC4B                 ; 2³
    cld                          ; 2
    bcc    LFC97                 ; 2³
    lda    ram_C0                ; 3
    cmp    ram_BE                ; 3
    bcc    LFC87                 ; 2³
    sta    ram_BE                ; 3
    bne    LFC67                 ; 2³
    lda    ram_C1                ; 3
    cmp    ram_BF                ; 3
    bcc    LFC87                 ; 2³
LFC67:
    lda    ram_C1                ; 3
    sta    ram_BF                ; 3
    sed                          ; 2
    lda    ram_BE                ; 3
    clc                          ; 2
    adc    #$01                  ; 2
    sta    ram_BE                ; 3
    cld                          ; 2
    lda    #$00                  ; 2
    sta    ram_80                ; 3
    sta    ram_E0                ; 3
    sta    ram_D5                ; 3
    lda    #$99                  ; 2
    sta    ram_C4                ; 3
    sta    ram_C5                ; 3
    lda    #$04                  ; 2
    sta    ram_D4                ; 3
    rts                          ; 6

LFC87:
    stx    ram_EF                ; 3
    inx                          ; 2
    stx    ram_BD                ; 3
    stx    ram_D4                ; 3
    jsr    LFBEE                 ; 6
    lda    #$09                  ; 2
    sta    ram_E0                ; 3
    bne    LFCAE                 ; 3   always branch

LFC97:
    lda    ram_C4                ; 3
    cmp    #$50                  ; 2
    bcc    LFCAE                 ; 2³
    and    #$F0                  ; 2
    sta    ram_EB                ; 3
    tya                          ; 2
    and    #$F0                  ; 2
    cmp    ram_EB                ; 3
    beq    LFCAE                 ; 2³
    lda    #$80                  ; 2
    ora    ram_D5                ; 3
    sta    ram_D5                ; 3
LFCAE:
    rts                          ; 6

    .byte $4D ; | X  XX X| $FCAF
    .byte $00 ; |        | $FCB0
    .byte $3B ; |  XXX XX| $FCB1
    .byte $48 ; | X  X   | $FCB2
    .byte $2A ; |  X X X | $FCB3
    .byte $C2 ; |XX    X | $FCB4
    .byte $04 ; |     X  | $FCB5
    .byte $00 ; |        | $FCB6
    .byte $00 ; |        | $FCB7
    .byte $70 ; | XXX    | $FCB8
    .byte $55 ; | X X X X| $FCB9
    .byte $87 ; |X    XXX| $FCBA
    .byte $97 ; |X  X XXX| $FCBB
    .byte $30 ; |  XX    | $FCBC
    .byte $90 ; |X  X    | $FCBD
    .byte $4B ; | X  X XX| $FCBE
    .byte $40 ; | X      | $FCBF
    .byte $1F ; |   XXXXX| $FCC0
    .byte $52 ; | X X  X | $FCC1
    .byte $00 ; |        | $FCC2
    .byte $00 ; |        | $FCC3
    .byte $00 ; |        | $FCC4
    .byte $00 ; |        | $FCC5
    .byte $00 ; |        | $FCC6
    .byte $08 ; |    X   | $FCC7
    .byte $00 ; |        | $FCC8
    .byte $00 ; |        | $FCC9
    .byte $91 ; |X  X   X| $FCCA
    .byte $D1 ; |XX X   X| $FCCB
    .byte $D2 ; |XX X  X | $FCCC
    .byte $DE ; |XX XXXX | $FCCD
    .byte $E6 ; |XXX  XX | $FCCE
    .byte $D2 ; |XX X  X | $FCCF
    .byte $D4 ; |XX X X  | $FCD0
    .byte $DE ; |XX XXXX | $FCD1
    .byte $80 ; |X       | $FCD2
    .byte $13 ; |   X  XX| $FCD3
    .byte $13 ; |   X  XX| $FCD4
    .byte $07 ; |     XXX| $FCD5
    .byte $80 ; |X       | $FCD6
    .byte $DD ; |XX XXX X| $FCD7
    .byte $93 ; |X  X  XX| $FCD8
    .byte $D1 ; |XX X   X| $FCD9
    .byte $70 ; | XXX    | $FCDA
    .byte $56 ; | X X XX | $FCDB
    .byte $6A ; | XX X X | $FCDC
    .byte $A3 ; |X X   XX| $FCDD
    .byte $A5 ; |X X  X X| $FCDE
    .byte $60 ; | XX     | $FCDF
    .byte $00 ; |        | $FCE0
    .byte $02 ; |      X | $FCE1
    .byte $00 ; |        | $FCE2
    .byte $01 ; |       X| $FCE3
    .byte $00 ; |        | $FCE4
    .byte $08 ; |    X   | $FCE5
    .byte $00 ; |        | $FCE6
    .byte $02 ; |      X | $FCE7
    .byte $BE ; |X XXXXX | $FCE8
    .byte $DB ; |XX XX XX| $FCE9
    .byte $E7 ; |XXX  XXX| $FCEA
    .byte $D1 ; |XX X   X| $FCEB
    .byte $E6 ; |XXX  XX | $FCEC
    .byte $D2 ; |XX X  X | $FCED
    .byte $00 ; |        | $FCEE
    .byte $00 ; |        | $FCEF
    .byte $80 ; |X       | $FCF0
    .byte $00 ; |        | $FCF1
    .byte $00 ; |        | $FCF2
    .byte $02 ; |      X | $FCF3
    .byte $80 ; |X       | $FCF4
    .byte $DD ; |XX XXX X| $FCF5
    .byte $C6 ; |XX   XX | $FCF6
    .byte $D1 ; |XX X   X| $FCF7
    .byte $30 ; |  XX    | $FCF8
    .byte $30 ; |  XX    | $FCF9
    .byte $30 ; |  XX    | $FCFA
    .byte $A3 ; |X X   XX| $FCFB
    .byte $30 ; |  XX    | $FCFC
    .byte $30 ; |  XX    | $FCFD
    .byte $00 ; |        | $FCFE
    .byte $00 ; |        | $FCFF
    .byte $00 ; |        | $FD00
    .byte $08 ; |    X   | $FD01
    .byte $00 ; |        | $FD02
    .byte $91 ; |X  X   X| $FD03
    .byte $D1 ; |XX X   X| $FD04
    .byte $E7 ; |XXX  XXX| $FD05
    .byte $D1 ; |XX X   X| $FD06
    .byte $E6 ; |XXX  XX | $FD07
    .byte $D2 ; |XX X  X | $FD08
    .byte $E6 ; |XXX  XX | $FD09
    .byte $D2 ; |XX X  X | $FD0A
    .byte $80 ; |X       | $FD0B
    .byte $13 ; |   X  XX| $FD0C
    .byte $67 ; | XX  XXX| $FD0D
    .byte $02 ; |      X | $FD0E
    .byte $80 ; |X       | $FD0F
    .byte $DD ; |XX XXX X| $FD10
    .byte $80 ; |X       | $FD11
    .byte $DD ; |XX XXX X| $FD12
    .byte $30 ; |  XX    | $FD13
    .byte $6D ; | XX XX X| $FD14
    .byte $60 ; | XX     | $FD15
    .byte $52 ; | X X  X | $FD16
    .byte $7C ; | XXXXX  | $FD17
    .byte $30 ; |  XX    | $FD18
LFD19:
    .byte $36 ; |  XX XX | $FD19
    .byte $56 ; | X X XX | $FD1A
    .byte $76 ; | XXX XX | $FD1B
    .byte $96 ; |X  X XX | $FD1C
LFD1D:
    .byte $37 ; |  XX XXX| $FD1D
    .byte $5C ; | X XXX  | $FD1E
    .byte $81 ; |X      X| $FD1F
LFD20:
    .byte $00 ; |        | $FD20
    .byte $01 ; |       X| $FD21
    .byte $01 ; |       X| $FD22
    .byte $03 ; |      XX| $FD23
LFD24:
    .byte $25 ; |  X  X X| $FD24
    .byte $45 ; | X   X X| $FD25
    .byte $65 ; | XX  X X| $FD26
    .byte $85 ; |X    X X| $FD27
    .byte $A5 ; |X X  X X| $FD28
LFD29:
    .byte $02 ; |      X | $FD29
    .byte $27 ; |  X  XXX| $FD2A
    .byte $4C ; | X  XX  | $FD2B
    .byte $71 ; | XXX   X| $FD2C
LFD2D:
    .byte $3A ; |  XXX X | $FD2D
    .byte $43 ; | X    XX| $FD2E
LFD2F:
    .byte $89 ; |X   X  X| $FD2F
    .byte $92 ; |X  X  X | $FD30
LFD31:
    .byte $8A ; |X   X X | $FD31
    .byte $93 ; |X  X  XX| $FD32
LFD33:
    .byte $13 ; |   X  XX| $FD33
    .byte $1C ; |   XXX  | $FD34
LFD35:
    .byte $1B ; |   XX XX| $FD35
    .byte $12 ; |   X  X | $FD36
LFD37:
    .byte $04 ; |     X  | $FD37
    .byte $58 ; | X XX   | $FD38
LFD39:
    .byte $13 ; |   X  XX| $FD39
    .byte $67 ; | XX  XXX| $FD3A
LFD3B:
    .byte $8F ; |X   XXXX| $FD3B
    .byte $AC ; |X X XX  | $FD3C
    .byte $B8 ; |X XXX   | $FD3D
    .byte $CF ; |XX  XXXX| $FD3E
    .byte $8F ; |X   XXXX| $FD3F
LFD40:
    .byte $1C ; |   XXX  | $FD40
    .byte $0C ; |    XX  | $FD41
    .byte $18 ; |   XX   | $FD42
    .byte $1B ; |   XX XX| $FD43
    .byte $1C ; |   XXX  | $FD44
LFD45:
    .byte $08 ; |    X   | $FD45
    .byte $04 ; |     X  | $FD46
    .byte $05 ; |     X X| $FD47
    .byte $06 ; |     XX | $FD48
LFD49:
    .byte $00 ; |        | $FD49
    .byte $FF ; |XXXXXXXX| $FD4A
    .byte $FF ; |XXXXXXXX| $FD4B
    .byte $FF ; |XXXXXXXX| $FD4C
    .byte $00 ; |        | $FD4D
LFD4E:
    .byte $01 ; |       X| $FD4E
    .byte $01 ; |       X| $FD4F
    .byte $01 ; |       X| $FD50
    .byte $02 ; |      X | $FD51
    .byte $02 ; |      X | $FD52
    .byte $02 ; |      X | $FD53
    .byte $03 ; |      XX| $FD54
    .byte $03 ; |      XX| $FD55
    .byte $04 ; |     X  | $FD56
    .byte $05 ; |     X X| $FD57
    .byte $06 ; |     XX | $FD58
    .byte $07 ; |     XXX| $FD59
    .byte $08 ; |    X   | $FD5A
    .byte $08 ; |    X   | $FD5B
    .byte $07 ; |     XXX| $FD5C
    .byte $07 ; |     XXX| $FD5D
    .byte $06 ; |     XX | $FD5E
    .byte $06 ; |     XX | $FD5F
    .byte $05 ; |     X X| $FD60
    .byte $05 ; |     X X| $FD61
    .byte $04 ; |     X  | $FD62
    .byte $04 ; |     X  | $FD63
    .byte $04 ; |     X  | $FD64
    .byte $03 ; |      XX| $FD65
    .byte $03 ; |      XX| $FD66
    .byte $03 ; |      XX| $FD67
    .byte $02 ; |      X | $FD68
    .byte $02 ; |      X | $FD69
LFD6A:
    .byte $01 ; |       X| $FD6A
    .byte $01 ; |       X| $FD6B
    .byte $00 ; |        | $FD6C
    .byte $FF ; |XXXXXXXX| $FD6D
    .byte $FF ; |XXXXXXXX| $FD6E
    .byte $FF ; |XXXXXXXX| $FD6F
    .byte $00 ; |        | $FD70
    .byte $01 ; |       X| $FD71

LFD72:
    ldx    #$01                  ; 2
    sed                          ; 2
    sec                          ; 2
    sta    ram_ED                ; 3
LFD78:
    lda    ram_C0,X              ; 4
    sbc    ram_ED                ; 3
    sta    ram_EB,X              ; 4
    dex                          ; 2
    stx    ram_ED                ; 3
    bpl    LFD78                 ; 2³
    cld                          ; 2
    rts                          ; 6

LFD85:
    clc                          ; 2
    ldx    #$01                  ; 2
    sed                          ; 2
LFD89:
    adc    ram_C0,X              ; 4
    sta    ram_C0,X              ; 4
    dex                          ; 2
    txa                          ; 2
    bpl    LFD89                 ; 2³
    bcc    LFD9B                 ; 2³
    lda    #$99                  ; 2
    sta    ram_C0                ; 3
    sta    ram_C1                ; 3
    sta    ram_C2                ; 3
LFD9B:
    cld                          ; 2
    rts                          ; 6

LFD9D:
    .byte $02 ; |      X | $FD9D
    .byte $08 ; |    X   | $FD9E
    .byte $01 ; |       X| $FD9F
    .byte $F0 ; |XXXX    | $FDA0

LFDA1:
    lda    #$7D                  ; 2
    sta    ram_93                ; 3
LFDA5:
    ldy    #$04                  ; 2
    lda    #$00                  ; 2
LFDA9:
    sta.wy ram_B7,Y              ; 5
    dey                          ; 2
    bne    LFDA9                 ; 2³
    lda    #$77                  ; 2
    sta    ram_B7                ; 3
    rts                          ; 6

LFDB4:
    .byte $00 ; |        | $FDB4
    .byte $7A ; | XXXX X | $FDB5
    .byte $73 ; | XXX  XX| $FDB6
    .byte $71 ; | XXX   X| $FDB7
    .byte $6E ; | XX XXX | $FDB8
    .byte $6B ; | XX X XX| $FDB9
    .byte $3F ; |  XXXXXX| $FDBA
    .byte $69 ; | XX X  X| $FDBB
    .byte $3B ; |  XXX XX| $FDBC
    .byte $3A ; |  XXX X | $FDBD
LFDBE:
    .byte $67 ; | XX  XXX| $FDBE
    .byte $34 ; |  XX X  | $FDBF
    .byte $36 ; |  XX XX | $FDC0
    .byte $07 ; |     XXX| $FDC1
    .byte $0F ; |    XXXX| $FDC2
    .byte $1F ; |   XXXXX| $FDC3
LFDC4:
    .byte $00 ; |        | $FDC4
    .byte $71 ; | XXX   X| $FDC5
    .byte $00 ; |        | $FDC6
    .byte $71 ; | XXX   X| $FDC7
    .byte $00 ; |        | $FDC8
    .byte $44 ; | X   X  | $FDC9
    .byte $42 ; | X    X | $FDCA
    .byte $6B ; | XX X XX| $FDCB
    .byte $00 ; |        | $FDCC
    .byte $69 ; | XX X  X| $FDCD
    .byte $00 ; |        | $FDCE
    .byte $69 ; | XX X  X| $FDCF
    .byte $00 ; |        | $FDD0
    .byte $42 ; | X    X | $FDD1
    .byte $00 ; |        | $FDD2
    .byte $42 ; | X    X | $FDD3
    .byte $00 ; |        | $FDD4
    .byte $71 ; | XXX   X| $FDD5
    .byte $00 ; |        | $FDD6
    .byte $44 ; | X   X  | $FDD7
    .byte $00 ; |        | $FDD8
    .byte $3A ; |  XXX X | $FDD9
    .byte $00 ; |        | $FDDA
    .byte $42 ; | X    X | $FDDB
    .byte $00 ; |        | $FDDC
    .byte $71 ; | XXX   X| $FDDD
    .byte $00 ; |        | $FDDE
    .byte $44 ; | X   X  | $FDDF
    .byte $00 ; |        | $FDE0
    .byte $69 ; | XX X  X| $FDE1
    .byte $00 ; |        | $FDE2
    .byte $42 ; | X    X | $FDE3
    .byte $00 ; |        | $FDE4
    .byte $73 ; | XXX  XX| $FDE5
    .byte $00 ; |        | $FDE6
    .byte $44 ; | X   X  | $FDE7
    .byte $00 ; |        | $FDE8
    .byte $69 ; | XX X  X| $FDE9
    .byte $00 ; |        | $FDEA
    .byte $42 ; | X    X | $FDEB
    .byte $00 ; |        | $FDEC
    .byte $73 ; | XXX  XX| $FDED
    .byte $44 ; | X   X  | $FDEE
    .byte $73 ; | XXX  XX| $FDEF
    .byte $42 ; | X    X | $FDF0
    .byte $73 ; | XXX  XX| $FDF1
    .byte $44 ; | X   X  | $FDF2
    .byte $73 ; | XXX  XX| $FDF3
    .byte $42 ; | X    X | $FDF4
    .byte $3F ; |  XXXXXX| $FDF5
    .byte $00 ; |        | $FDF6
    .byte $44 ; | X   X  | $FDF7
    .byte $00 ; |        | $FDF8
    .byte $3F ; |  XXXXXX| $FDF9
    .byte $00 ; |        | $FDFA
    .byte $42 ; | X    X | $FDFB
    .byte $00 ; |        | $FDFC
    .byte $3F ; |  XXXXXX| $FDFD
    .byte $00 ; |        | $FDFE
    .byte $44 ; | X   X  | $FDFF
    .byte $00 ; |        | $FE00
    .byte $7A ; | XXXX X | $FE01
    .byte $00 ; |        | $FE02
    .byte $42 ; | X    X | $FE03
    .byte $00 ; |        | $FE04
    .byte $7A ; | XXXX X | $FE05
    .byte $00 ; |        | $FE06
    .byte $44 ; | X   X  | $FE07
    .byte $00 ; |        | $FE08
    .byte $7A ; | XXXX X | $FE09
    .byte $00 ; |        | $FE0A
    .byte $42 ; | X    X | $FE0B
    .byte $00 ; |        | $FE0C
    .byte $42 ; | X    X | $FE0D
    .byte $44 ; | X   X  | $FE0E
    .byte $42 ; | X    X | $FE0F
    .byte $44 ; | X   X  | $FE10
    .byte $42 ; | X    X | $FE11
    .byte $44 ; | X   X  | $FE12
    .byte $42 ; | X    X | $FE13
    .byte $44 ; | X   X  | $FE14
LFE15:
    .byte $60 ; | XX     | $FE15
    .byte $69 ; | XX X  X| $FE16
    .byte $60 ; | XX     | $FE17
    .byte $69 ; | XX X  X| $FE18
    .byte $60 ; | XX     | $FE19
    .byte $A0 ; |X X     | $FE1A
    .byte $67 ; | XX  XXX| $FE1B
    .byte $80 ; |X       | $FE1C
    .byte $60 ; | XX     | $FE1D
    .byte $66 ; | XX  XX | $FE1E
    .byte $80 ; |X       | $FE1F
    .byte $60 ; | XX     | $FE20
    .byte $63 ; | XX   XX| $FE21
    .byte $60 ; | XX     | $FE22
    .byte $63 ; | XX   XX| $FE23
    .byte $60 ; | XX     | $FE24
    .byte $A0 ; |X X     | $FE25
    .byte $67 ; | XX  XXX| $FE26
    .byte $60 ; | XX     | $FE27
    .byte $67 ; | XX  XXX| $FE28
    .byte $60 ; | XX     | $FE29
    .byte $66 ; | XX  XX | $FE2A
    .byte $80 ; |X       | $FE2B
    .byte $60 ; | XX     | $FE2C
    .byte $60 ; | XX     | $FE2D
    .byte $60 ; | XX     | $FE2E
    .byte $69 ; | XX X  X| $FE2F
    .byte $69 ; | XX X  X| $FE30
    .byte $8B ; |X   X XX| $FE31
    .byte $89 ; |X   X  X| $FE32
    .byte $8A ; |X   X X | $FE33
    .byte $87 ; |X    XXX| $FE34
    .byte $A0 ; |X X     | $FE35
    .byte $A0 ; |X X     | $FE36
    .byte $69 ; | XX X  X| $FE37
    .byte $69 ; | XX X  X| $FE38
    .byte $69 ; | XX X  X| $FE39
    .byte $69 ; | XX X  X| $FE3A
    .byte $87 ; |X    XXX| $FE3B
    .byte $89 ; |X   X  X| $FE3C
    .byte $A0 ; |X X     | $FE3D
    .byte $60 ; | XX     | $FE3E
    .byte $60 ; | XX     | $FE3F
    .byte $69 ; | XX X  X| $FE40
    .byte $69 ; | XX X  X| $FE41
    .byte $8B ; |X   X XX| $FE42
    .byte $89 ; |X   X  X| $FE43
    .byte $8A ; |X   X X | $FE44
    .byte $87 ; |X    XXX| $FE45
    .byte $A0 ; |X X     | $FE46
    .byte $A0 ; |X X     | $FE47
    .byte $69 ; | XX X  X| $FE48
    .byte $69 ; | XX X  X| $FE49
    .byte $69 ; | XX X  X| $FE4A
    .byte $69 ; | XX X  X| $FE4B
    .byte $87 ; |X    XXX| $FE4C
    .byte $8A ; |X   X X | $FE4D
    .byte $89 ; |X   X  X| $FE4E
    .byte $63 ; | XX   XX| $FE4F
    .byte $63 ; | XX   XX| $FE50
    .byte $84 ; |X    X  | $FE51
    .byte $83 ; |X     XX| $FE52
    .byte $84 ; |X    X  | $FE53
    .byte $80 ; |X       | $FE54
    .byte $87 ; |X    XXX| $FE55
    .byte $80 ; |X       | $FE56
    .byte $86 ; |X    XX | $FE57
    .byte $63 ; | XX   XX| $FE58
    .byte $62 ; | XX   X | $FE59
    .byte $83 ; |X     XX| $FE5A
    .byte $83 ; |X     XX| $FE5B
    .byte $83 ; |X     XX| $FE5C
    .byte $80 ; |X       | $FE5D
    .byte $87 ; |X    XXX| $FE5E
    .byte $80 ; |X       | $FE5F
    .byte $86 ; |X    XX | $FE60
    .byte $80 ; |X       | $FE61
    .byte $83 ; |X     XX| $FE62
    .byte $83 ; |X     XX| $FE63
    .byte $A0 ; |X X     | $FE64
    .byte $87 ; |X    XXX| $FE65
    .byte $80 ; |X       | $FE66
    .byte $86 ; |X    XX | $FE67
    .byte $80 ; |X       | $FE68
    .byte $83 ; |X     XX| $FE69
    .byte $83 ; |X     XX| $FE6A
    .byte $A0 ; |X X     | $FE6B
    .byte $87 ; |X    XXX| $FE6C
    .byte $87 ; |X    XXX| $FE6D
    .byte $86 ; |X    XX | $FE6E
    .byte $63 ; | XX   XX| $FE6F
    .byte $63 ; | XX   XX| $FE70
    .byte $84 ; |X    X  | $FE71
    .byte $83 ; |X     XX| $FE72
    .byte $84 ; |X    X  | $FE73
    .byte $80 ; |X       | $FE74
    .byte $87 ; |X    XXX| $FE75
    .byte $80 ; |X       | $FE76
    .byte $86 ; |X    XX | $FE77
    .byte $63 ; | XX   XX| $FE78
    .byte $62 ; | XX   X | $FE79
    .byte $83 ; |X     XX| $FE7A
    .byte $83 ; |X     XX| $FE7B
    .byte $83 ; |X     XX| $FE7C
    .byte $80 ; |X       | $FE7D
    .byte $87 ; |X    XXX| $FE7E
    .byte $80 ; |X       | $FE7F
    .byte $86 ; |X    XX | $FE80
    .byte $80 ; |X       | $FE81
    .byte $83 ; |X     XX| $FE82
    .byte $83 ; |X     XX| $FE83
    .byte $A0 ; |X X     | $FE84
    .byte $8A ; |X   X X | $FE85
    .byte $80 ; |X       | $FE86
    .byte $89 ; |X   X  X| $FE87
    .byte $80 ; |X       | $FE88
    .byte $83 ; |X     XX| $FE89
    .byte $83 ; |X     XX| $FE8A
    .byte $A0 ; |X X     | $FE8B
    .byte $8A ; |X   X X | $FE8C
    .byte $8A ; |X   X X | $FE8D
    .byte $89 ; |X   X  X| $FE8E
    .byte $85 ; |X    X X| $FE8F
    .byte $AC ; |X X XX  | $FE90
    .byte $89 ; |X   X  X| $FE91
    .byte $AC ; |X X XX  | $FE92
    .byte $89 ; |X   X  X| $FE93
    .byte $AC ; |X X XX  | $FE94
    .byte $89 ; |X   X  X| $FE95
    .byte $AC ; |X X XX  | $FE96
    .byte $89 ; |X   X  X| $FE97
    .byte $8C ; |X   XX  | $FE98
    .byte $89 ; |X   X  X| $FE99
    .byte $67 ; | XX  XXX| $FE9A
    .byte $68 ; | XX X   | $FE9B
    .byte $89 ; |X   X  X| $FE9C
    .byte $AC ; |X X XX  | $FE9D
    .byte $89 ; |X   X  X| $FE9E
    .byte $AC ; |X X XX  | $FE9F
    .byte $89 ; |X   X  X| $FEA0
    .byte $AC ; |X X XX  | $FEA1
    .byte $89 ; |X   X  X| $FEA2
    .byte $AC ; |X X XX  | $FEA3
    .byte $89 ; |X   X  X| $FEA4
    .byte $8C ; |X   XX  | $FEA5
    .byte $89 ; |X   X  X| $FEA6
    .byte $67 ; | XX  XXX| $FEA7
    .byte $68 ; | XX X   | $FEA8
    .byte $89 ; |X   X  X| $FEA9
LFEAA:
    .byte $88 ; |X   X   | $FEAA
    .byte $5D ; | X XXX X| $FEAB
    .byte $34 ; |  XX X  | $FEAC
    .byte $0C ; |    XX  | $FEAD

LFEAE:
    lda    #$00                  ; 2
    sta    ram_EE                ; 3
    ldx    #$04                  ; 2
LFEB4:
    lda    LFD24,X               ; 4
    sec                          ; 2
    sbc    ram_B6                ; 3
    cmp    #$05                  ; 2
    bcs    LFEC1                 ; 2³
    sec                          ; 2
    ror    ram_EE                ; 5
LFEC1:
    cmp    #$22                  ; 2
    bcc    LFEC8                 ; 2³
    dex                          ; 2
    bpl    LFEB4                 ; 2³
LFEC8:
    stx    ram_EB                ; 3
    ldx    #$03                  ; 2
LFECC:
    lda    LFD29,X               ; 4
    sec                          ; 2
    sbc    ram_DB                ; 3
    cmp    #$25                  ; 2
    bcc    LFED9                 ; 2³
    dex                          ; 2
    bpl    LFECC                 ; 2³
LFED9:
    bit    ram_EE                ; 3
    bmi    LFEE5                 ; 2³
    inx                          ; 2
    lda    ram_DC                ; 3
    and    #$20                  ; 2
    bne    LFEE5                 ; 2³
    dex                          ; 2
LFEE5:
    ldy    ram_EB                ; 3
    bne    LFEEA                 ; 2³
    iny                          ; 2
LFEEA:
    tya                          ; 2
    ora    #$80                  ; 2
    sta    ram_EB                ; 3
    cpx    #$04                  ; 2
    bne    LFEF9                 ; 2³
    cmp    #$83                  ; 2
    bne    LFEF9                 ; 2³
LFEF7:
    sec                          ; 2
    rts                          ; 6

LFEF9:
    cpx    #$00                  ; 2
    bne    LFF07                 ; 2³+1
    cmp    #$82                  ; 2
    bne    LFF07                 ; 2³
    lda    #$C0                  ; 2
    sta    ram_E0                ; 3
    bmi    LFF0B                 ; 3   always branch

LFF07:
    bit    ram_E0                ; 3
    bmi    LFEF7                 ; 2³+1
LFF0B:
    lda    ram_D4                ; 3
    cmp    #$02                  ; 2
    beq    LFF13                 ; 2³
    stx    ram_F0                ; 3
LFF13:
    lda    ram_D6,X              ; 4
    and    #$BF                  ; 2
    ldx    #$1F                  ; 2
    eor    #$FF                  ; 2
    and    ram_EB                ; 3
    beq    LFF21                 ; 2³
    ldx    #$22                  ; 2
LFF21:
    clc                          ; 2
    rts                          ; 6

LFF23:
    ldx    #$03                  ; 2
    lda    ram_EB                ; 3
    and    #$30                  ; 2
    cmp    #$30                  ; 2
    bne    LFF45                 ; 2³
LFF2D:
    lda    LFD29,X               ; 4
    sec                          ; 2
    sbc    ram_DB                ; 3
    cmp    #$05                  ; 2
    bcc    LFF3B                 ; 2³
    dex                          ; 2
    bpl    LFF2D                 ; 2³
    rts                          ; 6

LFF3B:
    ldy    LFD29,X               ; 4
    dey                          ; 2
    dey                          ; 2
    sty    ram_DB                ; 3
    jmp    LFF70                 ; 3

LFF45:
    ldy    LFD29,X               ; 4
    dey                          ; 2
    dey                          ; 2
    cpy    ram_DB                ; 3
    beq    LFF70                 ; 2³
    dex                          ; 2
    bpl    LFF45                 ; 2³
    sec                          ; 2
    rts                          ; 6

LFF53:
    lda    ram_B6                ; 3
    tay                          ; 2
    and    #$10                  ; 2
    bne    LFF8A                 ; 2³
    tya                          ; 2
    bit    ram_EB                ; 3
    bpl    LFF84                 ; 2³
    bvc    LFF84                 ; 2³
    and    #$0F                  ; 2
    beq    LFF8A                 ; 2³
    cmp    #$06                  ; 2
    bcs    LFF8A                 ; 2³
    tya                          ; 2
    and    #$F0                  ; 2
    ora    #$03                  ; 2
    sta    ram_B6                ; 3
LFF70:
    inc    ram_9F                ; 5
    lda    ram_9F                ; 3
    and    #$03                  ; 2
    cmp    #$03                  ; 2
    bne    LFF82                 ; 2³
    lda    ram_A0                ; 3
    cmp    #$FF                  ; 2
    beq    LFF82                 ; 2³
    inc    ram_A0                ; 5
LFF82:
    clc                          ; 2
    rts                          ; 6

LFF84:
    and    #$0F                  ; 2
    cmp    #$03                  ; 2
    beq    LFF70                 ; 2³
LFF8A:
    sec                          ; 2
    rts                          ; 6

LFF8C:
    .byte $80 ; |X       | $FF8C
    .byte $95 ; |X  X X X| $FF8D
    .byte $AA ; |X X X X | $FF8E
LFF8F:
    .byte $00 ; |        | $FF8F
    .byte $03 ; |      XX| $FF90
    .byte $06 ; |     XX | $FF91
    .byte $0E ; |    XXX | $FF92
    .byte $1E ; |   XXXX | $FF93
    .byte $3C ; |  XXXX  | $FF94
    .byte $3C ; |  XXXX  | $FF95
    .byte $7C ; | XXXXX  | $FF96
    .byte $7C ; | XXXXX  | $FF97
    .byte $FE ; |XXXXXXX | $FF98
    .byte $FF ; |XXXXXXXX| $FF99
    .byte $DF ; |XX XXXXX| $FF9A
    .byte $DF ; |XX XXXXX| $FF9B
    .byte $6F ; | XX XXXX| $FF9C
    .byte $7E ; | XXXXXX | $FF9D
    .byte $3C ; |  XXXX  | $FF9E
    .byte $18 ; |   XX   | $FF9F
    .byte $3C ; |  XXXX  | $FFA0
    .byte $7E ; | XXXXXX | $FFA1
    .byte $EF ; |XXX XXXX| $FFA2
    .byte $C7 ; |XX   XXX| $FFA3
    .byte $F7 ; |XXXX XXX| $FFA4
    .byte $7E ; | XXXXXX | $FFA5
    .byte $56 ; | X X XX | $FFA6
    .byte $3C ; |  XXXX  | $FFA7
    .byte $18 ; |   XX   | $FFA8
    .byte $0C ; |    XX  | $FFA9
    .byte $0C ; |    XX  | $FFAA
    .byte $06 ; |     XX | $FFAB
    .byte $00 ; |        | $FFAC
    .byte $02 ; |      X | $FFAD
    .byte $0C ; |    XX  | $FFAE
    .byte $18 ; |   XX   | $FFAF
    .byte $18 ; |   XX   | $FFB0
    .byte $1C ; |   XXX  | $FFB1
    .byte $1C ; |   XXX  | $FFB2
    .byte $18 ; |   XX   | $FFB3
    .byte $08 ; |    X   | $FFB4
    .byte $0C ; |    XX  | $FFB5
    .byte $0C ; |    XX  | $FFB6
    .byte $04 ; |     X  | $FFB7
    .byte $02 ; |      X | $FFB8
    .byte $04 ; |     X  | $FFB9
    .byte $08 ; |    X   | $FFBA
    .byte $08 ; |    X   | $FFBB
    .byte $18 ; |   XX   | $FFBC
    .byte $18 ; |   XX   | $FFBD
    .byte $18 ; |   XX   | $FFBE
    .byte $18 ; |   XX   | $FFBF
    .byte $1C ; |   XXX  | $FFC0
    .byte $1C ; |   XXX  | $FFC1
    .byte $3E ; |  XXXXX | $FFC2
    .byte $3E ; |  XXXXX | $FFC3
    .byte $3E ; |  XXXXX | $FFC4
    .byte $1C ; |   XXX  | $FFC5
LFFC6:
    .byte $1C ; |   XXX  | $FFC6
    .byte $08 ; |    X   | $FFC7
    .byte $18 ; |   XX   | $FFC8
    .byte $14 ; |   X X  | $FFC9
    .byte $1C ; |   XXX  | $FFCA
    .byte $1C ; |   XXX  | $FFCB
    .byte $08 ; |    X   | $FFCC
    .byte $1C ; |   XXX  | $FFCD
    .byte $0C ; |    XX  | $FFCE
    .byte $04 ; |     X  | $FFCF
    .byte $02 ; |      X | $FFD0
    .byte $02 ; |      X | $FFD1
    .byte $04 ; |     X  | $FFD2
    .byte $0C ; |    XX  | $FFD3
    .byte $18 ; |   XX   | $FFD4
    .byte $38 ; |  XXX   | $FFD5
    .byte $38 ; |  XXX   | $FFD6
    .byte $7C ; | XXXXX  | $FFD7
    .byte $7C ; | XXXXX  | $FFD8
    .byte $7E ; | XXXXXX | $FFD9
    .byte $5E ; | X XXXX | $FFDA
    .byte $2E ; |  X XXX | $FFDB
    .byte $3C ; |  XXXX  | $FFDC
    .byte $18 ; |   XX   | $FFDD
    .byte $18 ; |   XX   | $FFDE
    .byte $38 ; |  XXX   | $FFDF
    .byte $3C ; |  XXXX  | $FFE0
    .byte $6E ; | XX XXX | $FFE1
    .byte $46 ; | X   XX | $FFE2
    .byte $76 ; | XXX XX | $FFE3
    .byte $3E ; |  XXXXX | $FFE4
    .byte $2A ; |  X X X | $FFE5
    .byte $1C ; |   XXX  | $FFE6
    .byte $08 ; |    X   | $FFE7
    .byte $0C ; |    XX  | $FFE8
    .byte $04 ; |     X  | $FFE9
    .byte $02 ; |      X | $FFEA
    .byte $00 ; |        | $FFEB

       ORG $1FEC
      RORG $FFEC

LFFEC:
    bit    BANK_0                ; 4
    jsr    LDFEC                 ; 6

LFFF2:
    ldx    #$FF                  ; 2
    txs                          ; 2
    jmp    LF067                 ; 3

    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2

    .word START_1

    .byte $32 ; |  XX  X | $FFFE
    .byte $60 ; | XX     | $FFFF
