; Rough disassembly of Spike's Peak
; By Omegamatrix
;
;
; Sp1.cfg contents:
;
;      ORG F000
;      GFX F000 F0FF
;      CODE F100 F5AE
;      GFX F5AF F5B8
;      CODE F5B9 F9FE
;      GFX F9FF FA47
;      CODE FA48 FBD0
;      GFX FBD1 FBF8
;      CODE FBF9 FD4F
;      GFX FD50 FD9F
;      CODE FDA0 FFDE
;      GFX FFDF FFF7
;      CODE FFF8 FFF9
;      GFX FFFA FFFF
;
;
; Sp2.cfg contents:
;
;      ORG D000
;      CODE D000 D6B5
;      GFX D6B6 DFF7
;      CODE DFF8 DFF9
;      GFX DFFA DFFF

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
RESBL   =  $14
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
HMBL    =  $24
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXM0P   =  $30
CXM1P   =  $31
CXP0FB  =  $32
CXP1FB  =  $33
CXPPMM  =  $37
INPT4   =  $3C
INPT5   =  $3D
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM8T   =  $0295
TIM64T  =  $0296


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      RIOT RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RIOT_RAM
       ORG $80

ram_80             ds 1  ; x9
ram_81             ds 1  ; x5
ram_82             ds 1  ; x1
ram_83             ds 1  ; x2
ram_84             ds 1  ; x1
ram_85             ds 1  ; x1
ram_86             ds 1  ; x1
ram_87             ds 1  ; x1
ram_88             ds 1  ; x1
ram_89             ds 1  ; x1
ram_8A             ds 2  ; x2
ram_8C             ds 1  ; x14
ram_8D             ds 1  ; x16
ram_8E             ds 2  ; x2
ram_90             ds 2  ; x8
ram_92             ds 2  ; x2
ram_94             ds 2  ; x2
ram_96             ds 2  ; x2
ram_98             ds 2  ; x2
ram_9A             ds 1  ; x3
ram_9B             ds 1  ; x4
ram_9C             ds 1  ; x8
ram_9D             ds 1  ; x6
ram_9E             ds 2  ; x2
ram_A0             ds 1  ; x8
ram_A1             ds 1  ; x6
ram_A2             ds 2  ; x4
ram_A4             ds 2  ; x4
ram_A6             ds 2  ; x5
ram_A8             ds 1  ; x6
ram_A9             ds 1  ; x2
ram_AA             ds 1  ; x34
ram_AB             ds 1  ; x51
ram_AC             ds 1  ; x45
ram_AD             ds 1  ; x5
ram_AE             ds 2  ; x2
ram_B0             ds 1  ; x4
ram_B1             ds 1  ; x7
ram_B2             ds 2  ; x2
ram_B4             ds 2  ; x3
ram_B6             ds 2  ; x4
ram_B8             ds 2  ; x1
ram_BA             ds 1  ; x28
ram_BB             ds 1  ; x28
ram_BC             ds 1  ; x23
ram_BD             ds 1  ; x5
ram_BE             ds 1  ; x3
ram_BF             ds 1  ; x32
ram_C0             ds 1  ; x5
ram_C1             ds 1  ; x7
ram_C2             ds 1  ; x7
ram_C3             ds 1  ; x6
ram_C4             ds 1  ; x4
ram_C5             ds 1  ; x2
ram_C6             ds 1  ; x23
ram_C7             ds 1  ; x1
ram_C8             ds 1  ; x1
ram_C9             ds 1  ; x13
ram_CA             ds 1  ; x15
ram_CB             ds 1  ; x7
ram_CC             ds 2  ; x10
ram_CE             ds 2  ; x2
ram_D0             ds 2  ; x5
ram_D2             ds 2  ; x6
ram_D4             ds 2  ; x3
ram_D6             ds 2  ; x4
ram_D8             ds 4  ; x5
ram_DC             ds 1  ; x2
ram_DD             ds 1  ; x29
ram_DE             ds 1  ; x8
ram_DF             ds 1  ; x35
ram_E0             ds 1  ; x5
ram_E1             ds 1  ; x1
ram_E2             ds 2  ; x2
ram_E4             ds 2  ; x2
ram_E6             ds 2  ; x2
ram_E8             ds 2  ; x2
ram_EA             ds 2  ; x2
ram_EC             ds 1  ; x2
ram_ED             ds 1  ; x28
ram_EE             ds 1  ; x13
ram_EF             ds 1  ; x2
ram_F0             ds 1  ; x17
ram_F1             ds 1  ; x12
ram_F2             ds 1  ; x14
ram_F3             ds 1  ; x6
ram_F4             ds 1  ; x7
ram_F5             ds 1  ; x4
ram_F6             ds 1  ; x1
ram_F7             ds 9  ; x1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 0
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG CODE
       ORG $0000
      RORG $F000

    .byte $00 ; |        | $F000
    .byte $00 ; |        | $F001
    .byte $1C ; |   XXX  | $F002
    .byte $3E ; |  XXXXX | $F003
    .byte $36 ; |  XX XX | $F004
    .byte $63 ; | XX   XX| $F005
    .byte $63 ; | XX   XX| $F006
    .byte $63 ; | XX   XX| $F007
    .byte $63 ; | XX   XX| $F008
    .byte $63 ; | XX   XX| $F009
    .byte $63 ; | XX   XX| $F00A
    .byte $63 ; | XX   XX| $F00B
    .byte $63 ; | XX   XX| $F00C
    .byte $63 ; | XX   XX| $F00D
    .byte $36 ; |  XX XX | $F00E
    .byte $3E ; |  XXXXX | $F00F
    .byte $1C ; |   XXX  | $F010
    .byte $00 ; |        | $F011
    .byte $0C ; |    XX  | $F012
    .byte $0C ; |    XX  | $F013
    .byte $0C ; |    XX  | $F014
    .byte $0C ; |    XX  | $F015
    .byte $0C ; |    XX  | $F016
    .byte $0C ; |    XX  | $F017
    .byte $0C ; |    XX  | $F018
    .byte $0C ; |    XX  | $F019
    .byte $0C ; |    XX  | $F01A
    .byte $1C ; |   XXX  | $F01B
    .byte $1C ; |   XXX  | $F01C
    .byte $1C ; |   XXX  | $F01D
    .byte $1C ; |   XXX  | $F01E
    .byte $1C ; |   XXX  | $F01F
    .byte $0C ; |    XX  | $F020
    .byte $00 ; |        | $F021
    .byte $7F ; | XXXXXXX| $F022
    .byte $7F ; | XXXXXXX| $F023
    .byte $60 ; | XX     | $F024
    .byte $30 ; |  XX    | $F025
    .byte $18 ; |   XX   | $F026
    .byte $0C ; |    XX  | $F027
    .byte $06 ; |     XX | $F028
    .byte $03 ; |      XX| $F029
    .byte $63 ; | XX   XX| $F02A
    .byte $63 ; | XX   XX| $F02B
    .byte $63 ; | XX   XX| $F02C
    .byte $36 ; |  XX XX | $F02D
    .byte $36 ; |  XX XX | $F02E
    .byte $1C ; |   XXX  | $F02F
    .byte $1C ; |   XXX  | $F030
    .byte $00 ; |        | $F031
    .byte $1C ; |   XXX  | $F032
    .byte $1C ; |   XXX  | $F033
    .byte $36 ; |  XX XX | $F034
    .byte $63 ; | XX   XX| $F035
    .byte $63 ; | XX   XX| $F036
    .byte $03 ; |      XX| $F037
    .byte $0E ; |    XXX | $F038
    .byte $0C ; |    XX  | $F039
    .byte $0E ; |    XXX | $F03A
    .byte $03 ; |      XX| $F03B
    .byte $63 ; | XX   XX| $F03C
    .byte $63 ; | XX   XX| $F03D
    .byte $36 ; |  XX XX | $F03E
    .byte $1C ; |   XXX  | $F03F
    .byte $1C ; |   XXX  | $F040
    .byte $00 ; |        | $F041
    .byte $06 ; |     XX | $F042
    .byte $06 ; |     XX | $F043
    .byte $7F ; | XXXXXXX| $F044
    .byte $7F ; | XXXXXXX| $F045
    .byte $66 ; | XX  XX | $F046
    .byte $66 ; | XX  XX | $F047
    .byte $66 ; | XX  XX | $F048
    .byte $36 ; |  XX XX | $F049
    .byte $36 ; |  XX XX | $F04A
    .byte $36 ; |  XX XX | $F04B
    .byte $1E ; |   XXXX | $F04C
    .byte $1E ; |   XXXX | $F04D
    .byte $0E ; |    XXX | $F04E
    .byte $0E ; |    XXX | $F04F
    .byte $06 ; |     XX | $F050
    .byte $00 ; |        | $F051
    .byte $1C ; |   XXX  | $F052
    .byte $3E ; |  XXXXX | $F053
    .byte $36 ; |  XX XX | $F054
    .byte $63 ; | XX   XX| $F055
    .byte $63 ; | XX   XX| $F056
    .byte $03 ; |      XX| $F057
    .byte $03 ; |      XX| $F058
    .byte $07 ; |     XXX| $F059
    .byte $06 ; |     XX | $F05A
    .byte $7C ; | XXXXX  | $F05B
    .byte $78 ; | XXXX   | $F05C
    .byte $60 ; | XX     | $F05D
    .byte $60 ; | XX     | $F05E
    .byte $7F ; | XXXXXXX| $F05F
    .byte $7F ; | XXXXXXX| $F060
    .byte $00 ; |        | $F061
    .byte $1C ; |   XXX  | $F062
    .byte $3E ; |  XXXXX | $F063
    .byte $36 ; |  XX XX | $F064
    .byte $63 ; | XX   XX| $F065
    .byte $63 ; | XX   XX| $F066
    .byte $63 ; | XX   XX| $F067
    .byte $76 ; | XXX XX | $F068
    .byte $7E ; | XXXXXX | $F069
    .byte $60 ; | XX     | $F06A
    .byte $60 ; | XX     | $F06B
    .byte $63 ; | XX   XX| $F06C
    .byte $63 ; | XX   XX| $F06D
    .byte $36 ; |  XX XX | $F06E
    .byte $3E ; |  XXXXX | $F06F
    .byte $1C ; |   XXX  | $F070
    .byte $00 ; |        | $F071
    .byte $60 ; | XX     | $F072
    .byte $60 ; | XX     | $F073
    .byte $60 ; | XX     | $F074
    .byte $30 ; |  XX    | $F075
    .byte $30 ; |  XX    | $F076
    .byte $18 ; |   XX   | $F077
    .byte $18 ; |   XX   | $F078
    .byte $18 ; |   XX   | $F079
    .byte $0C ; |    XX  | $F07A
    .byte $0C ; |    XX  | $F07B
    .byte $06 ; |     XX | $F07C
    .byte $06 ; |     XX | $F07D
    .byte $03 ; |      XX| $F07E
    .byte $7F ; | XXXXXXX| $F07F
    .byte $7F ; | XXXXXXX| $F080
    .byte $00 ; |        | $F081
    .byte $1C ; |   XXX  | $F082
    .byte $3E ; |  XXXXX | $F083
    .byte $36 ; |  XX XX | $F084
    .byte $63 ; | XX   XX| $F085
    .byte $63 ; | XX   XX| $F086
    .byte $63 ; | XX   XX| $F087
    .byte $36 ; |  XX XX | $F088
    .byte $3E ; |  XXXXX | $F089
    .byte $3E ; |  XXXXX | $F08A
    .byte $36 ; |  XX XX | $F08B
    .byte $63 ; | XX   XX| $F08C
    .byte $63 ; | XX   XX| $F08D
    .byte $36 ; |  XX XX | $F08E
    .byte $3E ; |  XXXXX | $F08F
    .byte $1C ; |   XXX  | $F090
    .byte $00 ; |        | $F091
    .byte $1C ; |   XXX  | $F092
    .byte $3E ; |  XXXXX | $F093
    .byte $36 ; |  XX XX | $F094
    .byte $63 ; | XX   XX| $F095
    .byte $63 ; | XX   XX| $F096
    .byte $03 ; |      XX| $F097
    .byte $03 ; |      XX| $F098
    .byte $3F ; |  XXXXXX| $F099
    .byte $37 ; |  XX XXX| $F09A
    .byte $63 ; | XX   XX| $F09B
    .byte $63 ; | XX   XX| $F09C
    .byte $63 ; | XX   XX| $F09D
    .byte $36 ; |  XX XX | $F09E
    .byte $3E ; |  XXXXX | $F09F
    .byte $1C ; |   XXX  | $F0A0
    .byte $00 ; |        | $F0A1
    .byte $1C ; |   XXX  | $F0A2
    .byte $3E ; |  XXXXX | $F0A3
    .byte $36 ; |  XX XX | $F0A4
    .byte $63 ; | XX   XX| $F0A5
    .byte $63 ; | XX   XX| $F0A6
    .byte $63 ; | XX   XX| $F0A7
    .byte $63 ; | XX   XX| $F0A8
    .byte $63 ; | XX   XX| $F0A9
    .byte $63 ; | XX   XX| $F0AA
    .byte $63 ; | XX   XX| $F0AB
    .byte $63 ; | XX   XX| $F0AC
    .byte $63 ; | XX   XX| $F0AD
    .byte $36 ; |  XX XX | $F0AE
    .byte $3E ; |  XXXXX | $F0AF
    .byte $00 ; |        | $F0B0
    .byte $00 ; |        | $F0B1
    .byte $00 ; |        | $F0B2
    .byte $00 ; |        | $F0B3
    .byte $49 ; | X  X  X| $F0B4
    .byte $AB ; |X X X XX| $F0B5
    .byte $AA ; |X X X X | $F0B6
    .byte $A6 ; |X X  XX | $F0B7
    .byte $A6 ; |X X  XX | $F0B8
    .byte $A7 ; |X X  XXX| $F0B9
    .byte $4D ; | X  XX X| $F0BA
    .byte $09 ; |    X  X| $F0BB
    .byte $00 ; |        | $F0BC
    .byte $00 ; |        | $F0BD
    .byte $00 ; |        | $F0BE
    .byte $00 ; |        | $F0BF
    .byte $00 ; |        | $F0C0
    .byte $4A ; | X  X X | $F0C1
    .byte $AA ; |X X X X | $F0C2
    .byte $AA ; |X X X X | $F0C3
    .byte $AA ; |X X X X | $F0C4
    .byte $AA ; |X X X X | $F0C5
    .byte $AA ; |X X X X | $F0C6
    .byte $4C ; | X  XX  | $F0C7
    .byte $00 ; |        | $F0C8
    .byte $00 ; |        | $F0C9
    .byte $00 ; |        | $F0CA
    .byte $00 ; |        | $F0CB
    .byte $00 ; |        | $F0CC
    .byte $92 ; |X  X  X | $F0CD
    .byte $56 ; | X X XX | $F0CE
    .byte $54 ; | X X X  | $F0CF
    .byte $CC ; |XX  XX  | $F0D0
    .byte $4C ; | X  XX  | $F0D1
    .byte $4E ; | X  XXX | $F0D2
    .byte $9A ; |X  XX X | $F0D3
    .byte $12 ; |   X  X | $F0D4
    .byte $00 ; |        | $F0D5
    .byte $00 ; |        | $F0D6
    .byte $00 ; |        | $F0D7
    .byte $00 ; |        | $F0D8
    .byte $C4 ; |XX   X  | $F0D9
    .byte $2A ; |  X X X | $F0DA
    .byte $2A ; |  X X X | $F0DB
    .byte $E4 ; |XXX  X  | $F0DC
    .byte $AA ; |X X X X | $F0DD
    .byte $AA ; |X X X X | $F0DE
    .byte $44 ; | X   X  | $F0DF
    .byte $00 ; |        | $F0E0
    .byte $00 ; |        | $F0E1
    .byte $00 ; |        | $F0E2
    .byte $00 ; |        | $F0E3
    .byte $00 ; |        | $F0E4
    .byte $F0 ; |XXXX    | $F0E5
    .byte $0A ; |    X X | $F0E6
    .byte $8A ; |X   X X | $F0E7
    .byte $8A ; |X   X X | $F0E8
    .byte $8A ; |X   X X | $F0E9
    .byte $CA ; |XX  X X | $F0EA
    .byte $AA ; |X X X X | $F0EB
    .byte $A8 ; |X X X   | $F0EC
    .byte $C8 ; |XX  X   | $F0ED
    .byte $08 ; |    X   | $F0EE
    .byte $F0 ; |XXXX    | $F0EF
    .byte $00 ; |        | $F0F0
    .byte $00 ; |        | $F0F1
    .byte $00 ; |        | $F0F2
    .byte $7D ; | XXXXX X| $F0F3
    .byte $82 ; |X     X | $F0F4
    .byte $9A ; |X  XX X | $F0F5
    .byte $A2 ; |X X   X | $F0F6
    .byte $A2 ; |X X   X | $F0F7
    .byte $A2 ; |X X   X | $F0F8
    .byte $A2 ; |X X   X | $F0F9
    .byte $A2 ; |X X   X | $F0FA
    .byte $9A ; |X  XX X | $F0FB
    .byte $82 ; |X     X | $F0FC
    .byte $7D ; | XXXXX X| $F0FD
    .byte $00 ; |        | $F0FE
    .byte $00 ; |        | $F0FF

START_0:
    sei                          ; 2
    cld                          ; 2
    ldx    #$00                  ; 2
    lda    #$00                  ; 2
LF106:
    sta    0,X                   ; 4
    txs                          ; 2
    inx                          ; 2
    bne    LF106                 ; 2³
    jmp    LF11E                 ; 3

LF10F:
    jmp    LF146                 ; 3

LF112:
    jmp    LF234                 ; 3

LF115:
    jmp    LF3EB                 ; 3

LF118:
    jmp    LF801                 ; 3

LF11B:
    jmp    LF5E6                 ; 3

LF11E:
    lda    #$DA                  ; 2
    ldx    #$D9                  ; 2
    jsr    LFBF9                 ; 6
    ldx    #$0D                  ; 2
LF127:
    lda    LFBD1,X               ; 4
    sta    ram_80,X              ; 4
    dex                          ; 2
    bpl    LF127                 ; 2³
    dec    ram_C6                ; 5
LF131:
    ldy    #$00                  ; 2
    jsr    LFC09                 ; 6
    lda    #$DB                  ; 2
    sta    ram_A1                ; 3
    lda    ram_8C                ; 3
    bmi    LF146                 ; 2³
    cmp    #$06                  ; 2
    bcc    LF146                 ; 2³
    lda    #$04                  ; 2
    sta    ram_8C                ; 3
LF146:
    lda    ram_8C                ; 3
    bpl    LF151                 ; 2³
    ldx    ram_D2                ; 3
    dex                          ; 2
    beq    LF151                 ; 2³
    stx    ram_D2                ; 3
LF151:
    lda    #$02                  ; 2
    sta    ENABL                 ; 3
    lda    ram_DF                ; 3
    lsr                          ; 2
    bcc    LF191                 ; 2³
    lda    ram_BF                ; 3
    bmi    LF171                 ; 2³
    lda    ram_AA                ; 3
    and    #$03                  ; 2
    bne    LF169                 ; 2³
    lda    SWCHA                 ; 4
    bmi    LF191                 ; 2³
LF169:
    lda    #$FE                  ; 2
    and    ram_8C                ; 3
    bmi    START_0               ; 2³
    sta    ram_8C                ; 3
LF171:
    ldx    ram_AA                ; 3
    inx                          ; 2
    stx    ram_AA                ; 3
    cpx    #$4A                  ; 2
    bcc    LF191                 ; 2³
    lda    #$01                  ; 2
    sta    CXCLR                 ; 3
    lda    ram_8D                ; 3
    cmp    #$2A                  ; 2
    bne    LF187                 ; 2³
    jmp    LF7D4                 ; 3

LF187:
    cmp    #$48                  ; 2
    bne    LF18E                 ; 2³
    jmp    LF1EE                 ; 3

LF18E:
    jmp    LF3CE                 ; 3

LF191:
    stx    WSYNC                 ; 3
;---------------------------------------
    sty    RESBL                 ; 3
    lda    #$20                  ; 2
    sta    HMBL                  ; 3
    lda    #$00                  ; 2
    sta    COLUPF                ; 3
    lda    #$98                  ; 2
    sta    COLUBK                ; 3
    jsr    LFE40                 ; 6
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    jsr    LFC14                 ; 6
    stx    HMCLR                 ; 3
    jsr    LF6E7                 ; 6
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    lda    ram_DF                ; 3
    lsr                          ; 2
    sta    COLUP1                ; 3
    lda    #$98                  ; 2
    sta    COLUP0                ; 3
    sta    COLUPF                ; 3
    lda    #$30                  ; 2
    sta    NUSIZ0                ; 3
    lda    #$FF                  ; 2
    sta    ENAM0                 ; 3
    sta    PF0                   ; 3
    stx    RESM1                 ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    ldy    #$30                  ; 2
    stx    RESM0                 ; 3
    stx    RESBL                 ; 3
    ldx    #$9A                  ; 2
    lda    #$00                  ; 2
    sta    ram_F4                ; 3
    stx    HMCLR                 ; 3
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    lda    #$F0                  ; 2
    sta    HMM1                  ; 3
    lda    #$D0                  ; 2
    jmp    LF5B9                 ; 3

LF1EE:
    lda    #$DF                  ; 2
    ldx    #$EB                  ; 2
    jsr    LFBF9                 ; 6
    lda    #$DC                  ; 2
    ldx    #$B9                  ; 2
    jsr    LFBF9                 ; 6
    lda    #$DB                  ; 2
    ldx    #$99                  ; 2
    jsr    LFBF9                 ; 6
    lda    #$00                  ; 2
    sta    ram_ED                ; 3
    sta    ram_DF                ; 3
    ldx    #$98                  ; 2
    jsr    LFBF9                 ; 6
    lda    #$02                  ; 2
    sta    ram_C2                ; 3
    sta    ram_C3                ; 3
    sta    ram_C4                ; 3
    sta    ram_BB                ; 3
    lda    #$10                  ; 2
    sta    ram_AB                ; 3
    sta    ram_9D                ; 3
    lda    #$00                  ; 2
    sta    ram_DD                ; 3
    sta    ram_CC                ; 3
    sta    ram_AC                ; 3
    sta    ram_BC                ; 3
    lda    #$20                  ; 2
    sta    ram_AA                ; 3
    sta    ram_9C                ; 3
    sta    ram_BA                ; 3
    lda    #$01                  ; 2
    sta    CXCLR                 ; 3
LF234:
    lda    ram_AB                ; 3
    cmp    #$D0                  ; 2
    bcc    LF255                 ; 2³
    ldx    ram_ED                ; 3
    beq    LF248                 ; 2³
    adc    ram_ED                ; 3
    sta    ram_AB                ; 3
    lda    #$00                  ; 2
    sta    ram_ED                ; 3
    beq    LF25C                 ; 3   always branch

LF248:
    ldx    #$48                  ; 2
    stx    ram_8D                ; 3
    jsr    LFB9F                 ; 6
    lda    ram_BF                ; 3
    bmi    LF259                 ; 2³
    bpl    LF2B4                 ; 3   always branch

LF255:
    cmp    #$90                  ; 2
    bcc    LF25C                 ; 2³
LF259:
    jmp    LF7D4                 ; 3

LF25C:
    jsr    LFF10                 ; 6
    jsr    LFE4D                 ; 6
    jsr    LFE6E                 ; 6
    lda    ram_C1                ; 3
    asl                          ; 2
    bpl    LF29D                 ; 2³
    lda    SWCHB                 ; 4
    eor    #$C0                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    cmp    ram_BB                ; 3
    bcs    LF29D                 ; 2³
    lda    ram_BA                ; 3
    ldx    ram_AA                ; 3
    cpx    #$2E                  ; 2
    beq    LF295                 ; 2³
    cpx    #$56                  ; 2
    beq    LF295                 ; 2³
    cpx    #$7E                  ; 2
    beq    LF295                 ; 2³
    cpx    #$06                  ; 2
    beq    LF295                 ; 2³
    sta    ram_AA                ; 3
    ldy    #$F0                  ; 2
    lda    ram_BE                ; 3
    bpl    LF293                 ; 2³
    ldy    #$FF                  ; 2
LF293:
    sty    ram_AC                ; 3
LF295:
    stx    ram_DD                ; 3
    jsr    LFEDE                 ; 6
    jmp    LF318                 ; 3

LF29D:
    lda    CXPPMM                ; 3
    bpl    LF2B7                 ; 2³
    lda    #$00                  ; 2
    sta    ram_ED                ; 3
    lda    ram_DF                ; 3
    and    #$0F                  ; 2
    beq    LF2B7                 ; 2³
    lsr                          ; 2
    bcs    LF2B4                 ; 2³
    lda    #$08                  ; 2
    eor    ram_AC                ; 3
    sta    ram_AC                ; 3
LF2B4:
    jmp    LF35B                 ; 3

LF2B7:
    lda    CXM1P                 ; 3
    bmi    LF2C1                 ; 2³
    lda    #$0A                  ; 2
    sta    ram_AD                ; 3
    bne    LF2E6                 ; 3   always branch

LF2C1:
    dec    ram_AD                ; 5
    bmi    LF2E6                 ; 2³
    ldx    ram_C6                ; 3
    bne    LF2D8                 ; 2³
    dex                          ; 2
    stx    ram_C6                ; 3
    ldx    #$F0                  ; 2
    stx    ram_CA                ; 3
    ldx    #$15                  ; 2
    stx    ram_CB                ; 3
    ldx    #$C8                  ; 2
    stx    ram_C9                ; 3
LF2D8:
    lda    #$00                  ; 2
    ldx    CXP0FB                ; 3
    bmi    LF2E0                 ; 2³
    lda    #$FF                  ; 2
LF2E0:
    sta    ram_DD                ; 3
    dec    ram_AB                ; 5
    bne    LF31A                 ; 2³+1
LF2E6:
    lda    ram_ED                ; 3
    bne    LF306                 ; 2³+1
    lda    CXP0FB                ; 3
    bpl    LF327                 ; 2³+1
    lda    ram_AB                ; 3
    adc    #$34                  ; 2
LF2F2:
    sbc    #$3A                  ; 2
    bcs    LF2F2                 ; 2³
    cmp    #$D8                  ; 2
    bcs    LF32F                 ; 2³+1
    lda    #$01                  ; 2
    sta    ram_DD                ; 3
    lda    INPT4                 ; 3
    bpl    LF306                 ; 2³
    lda    #$03                  ; 2
    bne    LF339                 ; 3   always branch

LF306:
    jsr    LFEDE                 ; 6
    lda    ram_DF                ; 3
    lsr                          ; 2
    bcc    LF31A                 ; 2³
    lda    ram_ED                ; 3
    beq    LF31A                 ; 2³
    jsr    LFF52                 ; 6
    jmp    LF31A                 ; 3

LF318:
    dec    ram_AB                ; 5
LF31A:
    lda    #$0C                  ; 2
    sta    ram_F2                ; 3
    jmp    LF344                 ; 3

LF321:
    jsr    LFE06                 ; 6
    jmp    LF34E                 ; 3

LF327:
    lda    ram_DD                ; 3
    bne    LF318                 ; 2³
    lda    #$07                  ; 2
    bne    LF335                 ; 3   always branch

LF32F:
    lda    #$00                  ; 2
    sta    ram_DD                ; 3
    lda    #$03                  ; 2
LF335:
    ldx    INPT4                 ; 3
    bpl    LF321                 ; 2³
LF339:
    and    ram_DF                ; 3
    bne    LF35B                 ; 2³
    lda    #$0C                  ; 2
    sta    ram_F2                ; 3
    jsr    LFF5A                 ; 6
LF344:
    clc                          ; 2
    lda    ram_AB                ; 3
    adc    ram_ED                ; 3
    ldx    #$A8                  ; 2
    jsr    LFCA0                 ; 6
LF34E:
    lda    ram_DD                ; 3
    beq    LF358                 ; 2³
    jsr    LFC14                 ; 6
    jmp    LF35B                 ; 3

LF358:
    jsr    LFC0F                 ; 6
LF35B:
    jsr    LFC3A                 ; 6
    jsr    LFC4D                 ; 6
    lda    ram_BB                ; 3
    ldx    #$B8                  ; 2
    ldy    #$48                  ; 2
    jsr    LFC9E                 ; 6
    jsr    LFF17                 ; 6
    lda    #$01                  ; 2
    sta    CXCLR                 ; 3
    lda    ram_BF                ; 3
    bmi    LF395                 ; 2³
    lda    ram_BA                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    adc    #$18                  ; 2
    sta    ram_BF                ; 3
    lda    ram_AB                ; 3
    tay                          ; 2
    sbc    ram_CC                ; 3
    cmp    #$2C                  ; 2
    bne    LF395                 ; 2³
    sty    ram_CC                ; 3
    lda    #$02                  ; 2
    sta    ram_CA                ; 3
    ldx    #$FF                  ; 2
    stx    ram_C6                ; 3
    ldx    #$50                  ; 2
    stx    ram_C9                ; 3
LF395:
    jsr    LF6E7                 ; 6
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    lda    ram_DF                ; 3
    lsr                          ; 2
    lsr                          ; 2
    eor    ram_AB                ; 3
    ora    #$0E                  ; 2
    sta    COLUBK                ; 3
    lda    ram_BC                ; 3
    lsr                          ; 2
    and    #$16                  ; 2
    eor    #$A6                  ; 2
    sta    COLUPF                ; 3
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMCLR                 ; 3
    lda    #$20                  ; 2
    sta    NUSIZ0                ; 3
    lda    #$76                  ; 2
    sta    COLUP1                ; 3
    ldx    #$00                  ; 2
    ldy    #$1D                  ; 2
    lda    ram_C2                ; 3
    sta    ENAM0                 ; 3
    lda    #$CC                  ; 2
    sta    ram_F4                ; 3
    lda    #$D1                  ; 2
    stx    RESM0                 ; 3
    jmp    LF5B9                 ; 3

LF3CE:
    ldy    #$00                  ; 2
    sty    ram_CC                ; 3
    sty    ram_DD                ; 3
    sty    ram_ED                ; 3
    sty    ram_AC                ; 3
    lda    ram_DF                ; 3
    asl                          ; 2
    sta    ram_DF                ; 3
    sta    ram_DE                ; 3
    lda    #$09                  ; 2
    sta    ram_AB                ; 3
    lda    #$1C                  ; 2
    sta    ram_AA                ; 3
    lda    #$30                  ; 2
    sta    CTRLPF                ; 3
LF3EB:
    lda    #$4E                  ; 2
    sta    COLUBK                ; 3
    lda    ram_AB                ; 3
    cmp    #$88                  ; 2
    bcc    LF408                 ; 2³+1
    lda    ram_BF                ; 3
    bmi    LF405                 ; 2³+1
    lda    #$01                  ; 2
    sta    ram_CA                ; 3
    lda    #$FF                  ; 2
    sta    ram_C6                ; 3
    lda    #$50                  ; 2
    sta    ram_C9                ; 3
LF405:
    jmp    LF1EE                 ; 3

LF408:
    lda    ram_BF                ; 3
    beq    LF440                 ; 2³
    bmi    LF45D                 ; 2³
    lda    ram_90                ; 3
    bne    LF444                 ; 2³
    lda    ram_A1                ; 3
    cmp    #$DA                  ; 2
    beq    LF459                 ; 2³
    lda    ram_ED                ; 3
    bne    LF421                 ; 2³
    lda    CXM0P                 ; 3
    asl                          ; 2
    bmi    LF440                 ; 2³
LF421:
    lda    CXPPMM                ; 3
    bpl    LF45D                 ; 2³
    lda    ram_B1                ; 3
    cmp    #$D9                  ; 2
    beq    LF440                 ; 2³
    lda    ram_BB                ; 3
    sec                          ; 2
    adc    #$02                  ; 2
    sbc    ram_AB                ; 3
    bpl    LF436                 ; 2³
    eor    #$FF                  ; 2
LF436:
    cmp    #$02                  ; 2
    bcs    LF45D                 ; 2³
    lda    ram_ED                ; 3
    cmp    #$05                  ; 2
    bcs    LF45D                 ; 2³
LF440:
    lda    #$FF                  ; 2
    sta    ram_90                ; 3
LF444:
    lda    ram_DF                ; 3
    and    #$07                  ; 2
    bne    LF450                 ; 2³
    lda    #$FF                  ; 2
    eor    ram_AC                ; 3
    sta    ram_AC                ; 3
LF450:
    ldx    #$58                  ; 2
    stx    ram_8D                ; 3
    jsr    LFB9F                 ; 6
    bne    LF4B3                 ; 2³
LF459:
    lda    CXM1P                 ; 3
    bmi    LF440                 ; 2³
LF45D:
    jsr    LFEDE                 ; 6
    lda    ram_DF                ; 3
    lsr                          ; 2
    bcs    LF47E                 ; 2³
    and    #$03                  ; 2
    bne    LF46E                 ; 2³
    lda    SWCHB                 ; 4
    bmi    LF47E                 ; 2³
LF46E:
    lda    ram_ED                ; 3
    bne    LF478                 ; 2³
    lda    ram_A1                ; 3
    cmp    #$DA                  ; 2
    beq    LF47E                 ; 2³
LF478:
    jsr    LFC14                 ; 6
    jsr    LF529                 ; 6
LF47E:
    lda    ram_AB                ; 3
    clc                          ; 2
    adc    ram_ED                ; 3
    ldx    #$A8                  ; 2
    jsr    LFC9A                 ; 6
    jsr    LFC3A                 ; 6
    jsr    LFCD8                 ; 6
    lda    ram_BB                ; 3
    ldx    #$B8                  ; 2
    jsr    LFC9A                 ; 6
    lda    ram_B1                ; 3
    cmp    #$DD                  ; 2
    bne    LF4AF                 ; 2³
    lda    ram_A1                ; 3
    cmp    #$DA                  ; 2
    bne    LF4AF                 ; 2³
    lda    CXP1FB                ; 3
    bpl    LF4AF                 ; 2³
    lda    #$00                  ; 2
    sta    ram_A8                ; 3
    sta    ram_A2                ; 3
    sta    ram_A4                ; 3
    sta    ram_A6                ; 3
LF4AF:
    lda    #$01                  ; 2
    sta    CXCLR                 ; 3
LF4B3:
    lda    ram_DC                ; 3
    jsr    LFE32                 ; 6
    stx    RESM1                 ; 3
    lda    #$48                  ; 2
    jsr    LFE32                 ; 6
    stx    RESBL                 ; 3
    stx    RESM0                 ; 3
    lda    ram_DF                ; 3
    lsr                          ; 2
    ldx    #$F0                  ; 2
    bcc    LF4CC                 ; 2³
    ldx    #$10                  ; 2
LF4CC:
    stx    HMM1                  ; 3
    lda    #$80                  ; 2
    sta    HMBL                  ; 3
    jsr    LFC2D                 ; 6
    ldx    ram_BF                ; 3
    beq    LF507                 ; 2³+1
    bmi    LF507                 ; 2³+1
    lda    ram_DF                ; 3
    and    #$07                  ; 2
    bne    LF4F0                 ; 2³
    lda    ram_A1                ; 3
    cmp    #$DA                  ; 2
    beq    LF4ED                 ; 2³
    cpx    #$30                  ; 2
    bcs    LF4F0                 ; 2³
    inx                          ; 2
    inx                          ; 2
LF4ED:
    dex                          ; 2
    stx    ram_BF                ; 3
LF4F0:
    lda    ram_AB                ; 3
    tay                          ; 2
    sbc    ram_CC                ; 3
    cmp    #$27                  ; 2
    bne    LF507                 ; 2³+1
    sty    ram_CC                ; 3
    lda    #$01                  ; 2
    sta    ram_CA                ; 3
    ldx    #$FF                  ; 2
    stx    ram_C6                ; 3
    ldx    #$50                  ; 2
    stx    ram_C9                ; 3
LF507:
    jsr    LF6E7                 ; 6
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    lda    #$30                  ; 2
    sta    NUSIZ0                ; 3
    ldy    #$2C                  ; 2
    lda    ram_B1                ; 3
    cmp    #$D9                  ; 2
    beq    LF51C                 ; 2³
    ldy    #$0E                  ; 2
LF51C:
    sty    COLUP1                ; 3
    ldy    #$10                  ; 2
    lda    #$A6                  ; 2
    sta    ram_F4                ; 3
    lda    #$D0                  ; 2
    jmp    LF5B9                 ; 3

LF529:
    lda    ram_AA                ; 3
    and    #$03                  ; 2
    bne    LF56B                 ; 2³
    lda    ram_ED                ; 3
    bne    LF560                 ; 2³
    lda    ram_BF                ; 3
    bmi    LF591                 ; 2³
    lda    ram_AB                ; 3
    cmp    #$08                  ; 2
    bcc    LF591                 ; 2³
    lda    SWCHA                 ; 4
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    bcc    LF586                 ; 2³
    bpl    LF591                 ; 2³
    lsr                          ; 2
    bcc    LF55B                 ; 2³
    lsr                          ; 2
    bcs    LF585                 ; 2³
    lda    ram_AC                ; 3
    lsr                          ; 2
    bcc    LF560                 ; 2³
LF552:
    lda    #$FF                  ; 2
    eor    ram_AC                ; 3
    sta    ram_AC                ; 3
    jmp    LF560                 ; 3

LF55B:
    lda    ram_AC                ; 3
    lsr                          ; 2
    bcc    LF552                 ; 2³
LF560:
    ldy    ram_AB                ; 3
    lda    ram_AC                ; 3
    bmi    LF568                 ; 2³
    iny                          ; 2
    iny                          ; 2
LF568:
    dey                          ; 2
    sty    ram_AB                ; 3
LF56B:
    ldy    ram_AA                ; 3
    lda    ram_AC                ; 3
    lsr                          ; 2
    bcs    LF574                 ; 2³
    iny                          ; 2
    iny                          ; 2
LF574:
    dey                          ; 2
    sty    ram_AA                ; 3
    cpy    #$99                  ; 2
    bcs    LF57F                 ; 2³
    cpy    #$03                  ; 2
    bcs    LF585                 ; 2³
LF57F:
    lda    #$0F                  ; 2
    eor    ram_AC                ; 3
    sta    ram_AC                ; 3
LF585:
    rts                          ; 6

LF586:
    ldy    #$0A                  ; 2
    lda    ram_AC                ; 3
    bmi    LF599                 ; 2³
LF58C:
    eor    #$FF                  ; 2
    sta    ram_AC                ; 3
    rts                          ; 6

LF591:
    ldy    #$0B                  ; 2
    lda    ram_AC                ; 3
    bpl    LF599                 ; 2³
    bmi    LF58C                 ; 3   always branch

LF599:
    lda    CXP0FB                ; 3
    bpl    LF560                 ; 2³
    lda    ram_AB                ; 3
LF59F:
    dey                          ; 2
    dey                          ; 2
    cmp    LF5AF,Y               ; 4
    beq    LF5AA                 ; 2³
    bcc    LF59F                 ; 2³
    bcs    LF560                 ; 3   always branch

LF5AA:
    lda    #$DA                  ; 2
    jmp    LFC28                 ; 3

LF5AF:
    .byte $00 ; |        | $F5AF
    .byte $00 ; |        | $F5B0
    .byte $0A ; |    X X | $F5B1
    .byte $1D ; |   XXX X| $F5B2
    .byte $2C ; |  X XX  | $F5B3
    .byte $3F ; |  XXXXXX| $F5B4
    .byte $56 ; | X X XX | $F5B5
    .byte $69 ; | XX X  X| $F5B6
    .byte $78 ; | XXXX   | $F5B7
    .byte $8B ; |X   X XX| $F5B8

LF5B9:
    sta    ram_F5                ; 3
    lda    #$AD                  ; 2
    sta    ram_F0                ; 3
    lda    #$F9                  ; 2
    sta    ram_F1                ; 3
    lda    #$FF                  ; 2
    sta    ram_F2                ; 3
    lda    #$4C                  ; 2
    sta    ram_F3                ; 3
    jmp.w  ram_F0                ; 3

LF5CE:
    lda    #$02                  ; 2
    sta    ram_AA                ; 3
    sta    ram_AB                ; 3
    sta    ram_AC                ; 3
    sta    ram_BC                ; 3
    lda    #$53                  ; 2
    sta    CXCLR                 ; 3
    sta    ram_BA                ; 3
    lda    #$00                  ; 2
    sta    ram_8D                ; 3
    sta    ram_90                ; 3
    inc    ram_B1                ; 5
LF5E6:
    lda    ram_C6                ; 3
    bne    LF5F8                 ; 2³
    lda    #$08                  ; 2
    sta    AUDV0                 ; 3
    lda    #$08                  ; 2
    sta    AUDC0                 ; 3
    lda    ram_DF                ; 3
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDF0                 ; 3
LF5F8:
    lda    ram_90                ; 3
    bmi    LF60D                 ; 2³+1
    lda    CXPPMM                ; 3
    bmi    LF603                 ; 2³
    jmp    LF688                 ; 3

LF603:
    sta    ram_90                ; 3
    lda    ram_BF                ; 3
    bmi    LF60D                 ; 2³
    lda    #$10                  ; 2
    sta    ram_CA                ; 3
LF60D:
    jsr    LFBB4                 ; 6
    ldx    ram_C6                ; 3
    inx                          ; 2
    bne    LF617                 ; 2³
    stx    ram_C9                ; 3
LF617:
    lda    ram_BF                ; 3
    bmi    LF669                 ; 2³
    ldx    ram_B1                ; 3
    beq    LF623                 ; 2³
    dec    ram_B1                ; 5
    bmi    LF62D                 ; 2³
LF623:
    lda    ram_AB                ; 3
    beq    LF62F                 ; 2³
    lda    #$7F                  ; 2
    sta    ram_A0                ; 3
    dec    ram_AB                ; 5
LF62D:
    bne    LF68F                 ; 2³
LF62F:
    ldx    ram_A0                ; 3
    beq    LF646                 ; 2³
    dec    ram_A0                ; 5
    stx    ram_EE                ; 3
    lda    #$D6                  ; 2
    sta    ram_A8                ; 3
    lda    #$DF                  ; 2
    sta    ram_A9                ; 3
    lda    #$80                  ; 2
    sta    ram_D8                ; 3
    jmp    LF6D1                 ; 3

LF646:
    lda    ram_AA                ; 3
    cmp    #$94                  ; 2
    bne    LF650                 ; 2³
    lda    #$FF                  ; 2
    sta    ram_AC                ; 3
LF650:
    lda    ram_AC                ; 3
    bpl    LF6B4                 ; 2³
    ldx    ram_AA                ; 3
    cpx    #$51                  ; 2
    bcc    LF65F                 ; 2³
    dex                          ; 2
    stx    ram_AA                ; 3
    bne    LF6B6                 ; 2³
LF65F:
    lda    ram_8C                ; 3
    bmi    LF669                 ; 2³
    lda    #$1E                  ; 2
    sta    ram_8D                ; 3
    bne    LF6B6                 ; 3   always branch

LF669:
    lda    ram_8C                ; 3
    bpl    LF671                 ; 2³
    lda    #$10                  ; 2
    sta    ram_EE                ; 3
LF671:
    lda    ram_DF                ; 3
    and    #$0F                  ; 2
    bne    LF681                 ; 2³
    inc    ram_8D                ; 5
    inc    ram_8D                ; 5
    bne    LF681                 ; 2³
    lda    ram_8C                ; 3
    bpl    LF685                 ; 2³
LF681:
    lda    INPT4                 ; 3
    bmi    LF6B6                 ; 2³
LF685:
    jmp    START_0               ; 3

LF688:
    lda    ram_BF                ; 3
    bne    LF691                 ; 2³
    jsr    LFB9F                 ; 6
LF68F:
    bne    LF6B6                 ; 2³
LF691:
    lda    ram_DF                ; 3
    and    #$0F                  ; 2
    bne    LF699                 ; 2³
    dec    ram_BF                ; 5
LF699:
    and    #$03                  ; 2
    bne    LF6B6                 ; 2³
    lda    ram_AA                ; 3
    and    #$03                  ; 2
    bne    LF6AE                 ; 2³
    lda    ram_BF                ; 3
    bmi    LF6AE                 ; 2³
    beq    LF6B6                 ; 2³
    lda    SWCHA                 ; 4
    bmi    LF6B6                 ; 2³
LF6AE:
    lda    CXP0FB                ; 3
    bpl    LF6B4                 ; 2³
    inc    ram_AB                ; 5
LF6B4:
    inc    ram_AA                ; 5
LF6B6:
    jsr    LFC14                 ; 6
    lda    #$20                  ; 2
    sta    ram_F0                ; 3
    ldy    #$09                  ; 2
    sty    ram_F2                ; 3
    lda    ram_AB                ; 3
    ldx    #$A8                  ; 2
    ldy    #$03                  ; 2
    jsr    LFCA6                 ; 6
    jsr    LFC3A                 ; 6
    lda    #$00                  ; 2
    sta    CXCLR                 ; 3
LF6D1:
    jsr    LF6E7                 ; 6
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMCLR                 ; 3
    ldy    #$40                  ; 2
    lda    #$6A                  ; 2
    sta    ram_F4                ; 3
    lda    #$D4                  ; 2
    jmp    LF5B9                 ; 3

LF6E7:
    lda    ram_BF                ; 3
    ldy    #$BF                  ; 2
    ldx    #$07                  ; 2
    and    #$3F                  ; 2
LF6EF:
    dex                          ; 2
    beq    LF708                 ; 2³+1
    sty    ram_F1,X              ; 4
    sec                          ; 2
    sbc    #$08                  ; 2
    bcs    LF6EF                 ; 2³
    tay                          ; 2
    lda    #$FF                  ; 2
LF6FC:
    lsr                          ; 2
    iny                          ; 2
    bne    LF6FC                 ; 2³+1
    and    #$BF                  ; 2
    sta    ram_F1,X              ; 4
    lda    #$FF                  ; 2
    bne    LF6EF                 ; 3+1   always branch

LF708:
    lda    INTIM                 ; 4
    bne    LF708                 ; 2³
    lda    ram_8D                ; 3
    adc    #$48                  ; 2
    ldx    ram_BF                ; 3
    bpl    LF717                 ; 2³
    eor    #$80                  ; 2
LF717:
    tay                          ; 2
    stx    WSYNC                 ; 3
;---------------------------------------
    lda    #$03                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    nop                          ; 2
    sty    COLUP0                ; 3
    sty    COLUP1                ; 3
    ldy    #$10                  ; 2
    jsr    LF7D3                 ; 6
    jsr    LF7D3                 ; 6
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sty    HMP1                  ; 3
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
LF73B:
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMCLR                 ; 3
    sty    ram_F1                ; 3
    lda    (ram_80),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_82),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_84),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_86),Y            ; 5
    tax                          ; 2
    lda    (ram_8A),Y            ; 5
    sta    ram_F0                ; 3
    lda    (ram_88),Y            ; 5
    ldy    ram_F0                ; 3
    stx    GRP1                  ; 3
    sta    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    ldy    ram_F1                ; 3
    dey                          ; 2
    bne    LF73B                 ; 2³
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    ldy    #$03                  ; 2
    sty    ram_F1                ; 3
LF76F:
    stx    WSYNC                 ; 3
;---------------------------------------
    lda    ram_F5                ; 3
    ora    ram_DF                ; 3
    eor    ram_F1                ; 3
    ora    #$02                  ; 2
    adc    ram_BF                ; 3
    rol                          ; 2
    rol                          ; 2
    ora    #$18                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    ram_F2                ; 3
    sta    GRP0                  ; 3
    lda    ram_F3                ; 3
    sta    GRP1                  ; 3
    lda    ram_F4                ; 3
    sta    GRP0                  ; 3
    ldx    ram_F5                ; 3
    lda    ram_F6                ; 3
    ldy    ram_F7                ; 3
    stx    GRP1                  ; 3
    sta    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    ram_F1                ; 5
    bne    LF76F                 ; 2³
    ldy    #$00                  ; 2
    sty    VDELP0                ; 3
    sty    VDELP1                ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    NUSIZ0                ; 3
    sty    NUSIZ1                ; 3
    lda    ram_AC                ; 3
    sta    REFP0                 ; 3
    lda    ram_BC                ; 3
    sta    REFP1                 ; 3
    lda    #$06                  ; 2
    sta    TIM64T                ; 4
    lda    ram_AA                ; 3
    jsr    LFE32                 ; 6
    stx    RESP0                 ; 3
    sta    HMP0                  ; 3
    lda    ram_BA                ; 3
    jsr    LFE32                 ; 6
    stx    RESP1                 ; 3
    sta    HMP1                  ; 3
LF7CE:
    lda    INTIM                 ; 4
    bne    LF7CE                 ; 2³
LF7D3:
    rts                          ; 6

LF7D4:
    lda    #$9A                  ; 2
    sta    COLUBK                ; 3
    lda    #$A8                  ; 2
    sta    COLUPF                ; 3
    lda    #$14                  ; 2
    sta    ram_AA                ; 3
    sta    ram_CC                ; 3
    sta    ram_AB                ; 3
    sta    ram_DD                ; 3
    sta    ram_BA                ; 3
    lda    #$70                  ; 2
    sta    ram_BB                ; 3
    sta    ram_BC                ; 3
    lda    #$21                  ; 2
    sta    ram_C3                ; 3
    sta    ram_9C                ; 3
    sta    ram_9D                ; 3
    sta    ram_BD                ; 3
    lda    #$DE                  ; 2
    ldx    #$B9                  ; 2
    stx    ram_C2                ; 3
    jsr    LFBF9                 ; 6
LF801:
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    RESBL                 ; 3
    lda    #$22                  ; 2
    sta    HMBL                  ; 3
    sta    ENABL                 ; 3
    lda    #$31                  ; 2
    sta    CTRLPF                ; 3
    lda    #$00                  ; 2
    sta    COLUPF                ; 3
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    lda    ram_BF                ; 3
    beq    LF82D                 ; 2³
    ldy    ram_BD                ; 3
    bpl    LF83A                 ; 2³
    lda    ram_DF                ; 3
    sta    ram_AC                ; 3
    sta    ram_BC                ; 3
    and    #$07                  ; 2
    bne    LF82D                 ; 2³
    lda    ram_AA                ; 3
    sta    ram_BA                ; 3
LF82D:
    ldx    #$2A                  ; 2
    stx    ram_8D                ; 3
    jsr    LFB9F                 ; 6
    lda    ram_BF                ; 3
    bmi    LF840                 ; 2³
    bpl    LF892                 ; 3   always branch

LF83A:
    ldy    ram_AB                ; 3
    cpy    #$90                  ; 2
    bcc    LF843                 ; 2³
LF840:
    jmp    LF5CE                 ; 3

LF843:
    lda    ram_ED                ; 3
    bne    LF873                 ; 2³
    lda    CXM1P                 ; 3
    bpl    LF861                 ; 2³
    ldx    ram_BF                ; 3
    bmi    LF861                 ; 2³
    sta    ram_ED                ; 3
    lda    ram_AB                ; 3
    cmp    #$02                  ; 2
    bcc    LF873                 ; 2³
    lda    #$F0                  ; 2
    sta    ram_CA                ; 3
    lda    #$25                  ; 2
    sta    ram_CB                ; 3
    bne    LF873                 ; 3   always branch

LF861:
    lda    #$0F                  ; 2
    ldx    ram_BF                ; 3
    cpx    #$0C                  ; 2
    bcc    LF86A                 ; 2³
    lsr                          ; 2
LF86A:
    ldx    ram_DD                ; 3
    beq    LF86F                 ; 2³
    lsr                          ; 2
LF86F:
    and    ram_DF                ; 3
    bne    LF892                 ; 2³
LF873:
    lda    #$0C                  ; 2
    sta    ram_F2                ; 3
    jsr    LF93A                 ; 6
    jsr    LFC0F                 ; 6
    lda    ram_DD                ; 3
    beq    LF888                 ; 2³
    lda    ram_ED                ; 3
    bne    LF888                 ; 2³
    jsr    LFC14                 ; 6
LF888:
    lda    ram_AB                ; 3
    ldx    #$A8                  ; 2
    jsr    LFCA0                 ; 6
    jsr    LFC3A                 ; 6
LF892:
    stx    HMCLR                 ; 3
    lda    ram_DF                ; 3
    lsr                          ; 2
    bcs    LF89C                 ; 2³
    jsr    LFA5B                 ; 6
LF89C:
    jsr    LFB35                 ; 6
    jsr    LFF17                 ; 6
    lda    #$FF                  ; 2
    ldx    CXP0FB                ; 3
    bpl    LF8B4                 ; 2³
    sta    ram_C6                ; 3
    lda    #$05                  ; 2
    sta    ram_CA                ; 3
    lda    #$00                  ; 2
    sta    ram_C9                ; 3
    lda    ram_AB                ; 3
LF8B4:
    ldx    #$02                  ; 2
LF8B6:
    sbc    #$60                  ; 2
    ldy    ram_C1,X              ; 4
    beq    LF8C4                 ; 2³
    iny                          ; 2
    iny                          ; 2
    bcs    LF8C2                 ; 2³
    ldy    #$00                  ; 2
LF8C2:
    sty    ram_C1,X              ; 4
LF8C4:
    dex                          ; 2
    bne    LF8B6                 ; 2³
    ldx    ram_BF                ; 3
    bmi    LF90E                 ; 2³+1
    beq    LF8E7                 ; 2³
    lda    CXP0FB                ; 3
    bpl    LF8D3                 ; 2³
    ldx    #$2F                  ; 2
LF8D3:
    lda    ram_DF                ; 3
    cmp    ram_AB                ; 3
    bcs    LF8E7                 ; 2³
    lda    SWCHB                 ; 4
    eor    #$FF                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    ora    #$0F                  ; 2
    and    ram_DF                ; 3
    bne    LF8E7                 ; 2³
    dex                          ; 2
LF8E7:
    stx    ram_BF                ; 3
    ldy    ram_AB                ; 3
    cpy    ram_CC                ; 3
    bcc    LF90E                 ; 2³+1
    cpy    #$21                  ; 2
    beq    LF8FF                 ; 2³
    cpy    #$5B                  ; 2
    beq    LF8FF                 ; 2³
    cpy    #$76                  ; 2
    beq    LF8FF                 ; 2³
    cpy    #$8C                  ; 2
    bne    LF90E                 ; 2³+1
LF8FF:
    iny                          ; 2
    sty    ram_CC                ; 3
    lda    #$02                  ; 2
    sta    ram_CA                ; 3
    ldx    #$FF                  ; 2
    stx    ram_C6                ; 3
    ldx    #$50                  ; 2
    stx    ram_C9                ; 3
LF90E:
    lda    #$01                  ; 2
    sta    CXCLR                 ; 3
    jsr    LF6E7                 ; 6
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    ldy    #$1D                  ; 2
    ldx    #$11                  ; 2
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMCLR                 ; 3
    lda    #$9C                  ; 2
    sta    COLUBK                ; 3
    lda    #$0E                  ; 2
    sta    COLUP1                ; 3
    lda    #$30                  ; 2
    sta    NUSIZ1                ; 3
    lda    #$17                  ; 2
    sta    ram_F4                ; 3
    stx    RESBL                 ; 3
    stx    CTRLPF                ; 3
    lda    #$D3                  ; 2
    jmp    LF5B9                 ; 3

LF93A:
    ldy    ram_AA                ; 3
    lda    ram_ED                ; 3
    beq    LF964                 ; 2³
    lda    ram_DD                ; 3
    beq    LF990                 ; 2³
    ldx    ram_C6                ; 3
    bne    LF954                 ; 2³
    lda    #$06                  ; 2
    sta    AUDV1                 ; 3
    lda    #$0C                  ; 2
    sta    AUDC1                 ; 3
    lda    ram_DF                ; 3
    sta    AUDF1                 ; 3
LF954:
    lda    ram_AB                ; 3
    cmp    #$88                  ; 2
    bcs    LF976                 ; 2³
    cmp    #$64                  ; 2
    bcs    LF983                 ; 2³
    cmp    #$30                  ; 2
    bcs    LF976                 ; 2³
    bcc    LF983                 ; 3   always branch

LF964:
    tya                          ; 2
    and    #$03                  ; 2
    bne    LF9AB                 ; 2³
    lda    INPT4                 ; 3
    bpl    LF9E0                 ; 2³
    lda    ram_BF                ; 3
    bmi    LF99F                 ; 2³
    lda    SWCHA                 ; 4
    bmi    LF980                 ; 2³
LF976:
    ldx    #$00                  ; 2
    stx    ram_AC                ; 3
    cpy    #$90                  ; 2
    bcc    LF9AB                 ; 2³
    bcs    LF990                 ; 3   always branch

LF980:
    asl                          ; 2
    bmi    LF98D                 ; 2³
LF983:
    ldx    #$FF                  ; 2
    stx    ram_AC                ; 3
    cpy    #$0E                  ; 2
    bcs    LF9AB                 ; 2³
    bcc    LF990                 ; 3   always branch

LF98D:
    asl                          ; 2
    bmi    LF99C                 ; 2³
LF990:
    dec    ram_AB                ; 5
    bne    LF9A1                 ; 2³
    inc    ram_AB                ; 5
    ldx    #$00                  ; 2
    stx    ram_ED                ; 3
    beq    LF99F                 ; 3   always branch

LF99C:
    asl                          ; 2
    bmi    LF9E0                 ; 2³
LF99F:
    inc    ram_AB                ; 5
LF9A1:
    ldx    #$00                  ; 2
    stx    ram_DD                ; 3
    ldx    #$48                  ; 2
    stx    ram_F2                ; 3
    bne    LF9B4                 ; 3   always branch

LF9AB:
    lda    ram_AC                ; 3
    bmi    LF9B1                 ; 2³
    iny                          ; 2
    iny                          ; 2
LF9B1:
    dey                          ; 2
    sty    ram_AA                ; 3
LF9B4:
    lda    ram_AA                ; 3
    ldx    ram_AB                ; 3
    jsr    LF9E1                 ; 6
    ldx    ram_DD                ; 3
    beq    LF9C1                 ; 2³
    sta    ram_AB                ; 3
LF9C1:
    ldy    #$00                  ; 2
    sec                          ; 2
    sbc    ram_AB                ; 3
    and    #$FC                  ; 2
    bne    LF9D1                 ; 2³
    ldy    #$0C                  ; 2
    sty    ram_F2                ; 3
    sty    ram_DD                ; 3
    rts                          ; 6

LF9D1:
    sty    ram_DD                ; 3
    lda    ram_AA                ; 3
    eor    ram_AB                ; 3
    lsr                          ; 2
    bcc    LF9E0                 ; 2³
    lda    #$08                  ; 2
    eor    ram_AC                ; 3
    sta    ram_AC                ; 3
LF9E0:
    rts                          ; 6

LF9E1:
    lsr                          ; 2
    lsr                          ; 2
    ldy    #$57                  ; 2
    cpx    #$88                  ; 2
    bcs    LF9F3                 ; 2³
    cpx    #$64                  ; 2
    bcs    LF9F5                 ; 2³
    ldy    #$00                  ; 2
    cpx    #$30                  ; 2
    bcc    LF9F5                 ; 2³
LF9F3:
    adc    #$23                  ; 2
LF9F5:
    tax                          ; 2
    lda    LF9FF,X               ; 4
    sty    ram_F0                ; 3
    clc                          ; 2
    adc    ram_F0                ; 3
    rts                          ; 6

LF9FF:
    .byte $00 ; |        | $F9FF
    .byte $00 ; |        | $FA00
    .byte $00 ; |        | $FA01
    .byte $10 ; |   X    | $FA02
    .byte $11 ; |   X   X| $FA03
    .byte $11 ; |   X   X| $FA04
    .byte $12 ; |   X  X | $FA05
    .byte $12 ; |   X  X | $FA06
    .byte $13 ; |   X  XX| $FA07
    .byte $13 ; |   X  XX| $FA08
    .byte $14 ; |   X X  | $FA09
    .byte $14 ; |   X X  | $FA0A
    .byte $15 ; |   X X X| $FA0B
    .byte $15 ; |   X X X| $FA0C
    .byte $16 ; |   X XX | $FA0D
    .byte $17 ; |   X XXX| $FA0E
    .byte $18 ; |   XX   | $FA0F
    .byte $19 ; |   XX  X| $FA10
    .byte $1A ; |   XX X | $FA11
    .byte $1B ; |   XX XX| $FA12
    .byte $1C ; |   XXX  | $FA13
    .byte $1D ; |   XXX X| $FA14
    .byte $1E ; |   XXXX | $FA15
    .byte $1E ; |   XXXX | $FA16
    .byte $1F ; |   XXXXX| $FA17
    .byte $20 ; |  X     | $FA18
    .byte $20 ; |  X     | $FA19
    .byte $21 ; |  X    X| $FA1A
    .byte $21 ; |  X    X| $FA1B
    .byte $22 ; |  X   X | $FA1C
    .byte $22 ; |  X   X | $FA1D
    .byte $23 ; |  X   XX| $FA1E
    .byte $23 ; |  X   XX| $FA1F
    .byte $24 ; |  X  X  | $FA20
    .byte $24 ; |  X  X  | $FA21
    .byte $25 ; |  X  X X| $FA22
    .byte $25 ; |  X  X X| $FA23
    .byte $5E ; | X XXXX | $FA24
    .byte $5C ; | X XXX  | $FA25
    .byte $5A ; | X XX X | $FA26
    .byte $58 ; | X XX   | $FA27
    .byte $56 ; | X X XX | $FA28
    .byte $54 ; | X X X  | $FA29
    .byte $52 ; | X X  X | $FA2A
    .byte $50 ; | X X    | $FA2B
    .byte $4E ; | X  XXX | $FA2C
    .byte $4C ; | X  XX  | $FA2D
    .byte $4A ; | X  X X | $FA2E
    .byte $48 ; | X  X   | $FA2F
    .byte $47 ; | X   XXX| $FA30
    .byte $46 ; | X   XX | $FA31
    .byte $45 ; | X   X X| $FA32
    .byte $44 ; | X   X  | $FA33
    .byte $43 ; | X    XX| $FA34
    .byte $42 ; | X    X | $FA35
    .byte $41 ; | X     X| $FA36
    .byte $40 ; | X      | $FA37
    .byte $3F ; |  XXXXXX| $FA38
    .byte $3E ; |  XXXXX | $FA39
    .byte $3D ; |  XXXX X| $FA3A
    .byte $3B ; |  XXX XX| $FA3B
    .byte $3A ; |  XXX X | $FA3C
    .byte $39 ; |  XXX  X| $FA3D
    .byte $38 ; |  XXX   | $FA3E
    .byte $37 ; |  XX XXX| $FA3F
    .byte $36 ; |  XX XX | $FA40
    .byte $35 ; |  XX X X| $FA41
    .byte $34 ; |  XX X  | $FA42
    .byte $33 ; |  XX  XX| $FA43
    .byte $32 ; |  XX  X | $FA44
    .byte $31 ; |  XX   X| $FA45
    .byte $30 ; |  XX    | $FA46
    .byte $27 ; |  X  XXX| $FA47

LFA48:
    lda    #$3B                  ; 2
    eor    ram_BB                ; 3
    sta    ram_BB                ; 3
    ldy    #$0E                  ; 2
    sty    ram_AD                ; 3
    lda    ram_9A                ; 3
    lsr                          ; 2
    bcc    LFA59                 ; 2³
    ldy    #$90                  ; 2
LFA59:
    sty    ram_BA                ; 3
LFA5B:
    lda    #$FF                  ; 2
    sta    ram_F3                ; 3
    ldx    ram_BB                ; 3
    lda    ram_AD                ; 3
    bmi    LFA77                 ; 2³
    lda    ram_9B                ; 3
    beq    LFA8D                 ; 2³
    lda    CXM0P                 ; 3
    bpl    LFA8D                 ; 2³
    sta    ram_AD                ; 3
    lda    #$02                  ; 2
    sta    ram_CA                ; 3
    lda    #$FF                  ; 2
    sta    ram_BC                ; 3
LFA77:
    lda    #$0A                  ; 2
    sta    AUDV1                 ; 3
    sta    AUDC1                 ; 3
    lda    ram_DF                ; 3
    sta    AUDF1                 ; 3
    lda    ram_BC                ; 3
    bpl    LFA48                 ; 2³
    lda    ram_BB                ; 3
    lsr                          ; 2
    bcc    LFAEE                 ; 2³
    jmp    LFB22                 ; 3

LFA8D:
    ldy    ram_BA                ; 3
    cpy    #$0E                  ; 2
    beq    LFAEE                 ; 2³
    cpy    #$90                  ; 2
    bne    LFA9A                 ; 2³
    jmp    LFB1E                 ; 3

LFA9A:
    lda    ram_AB                ; 3
    sbc    ram_BB                ; 3
    adc    #$04                  ; 2
    cmp    #$08                  ; 2
    bcs    LFAAA                 ; 2³
    lda    CXPPMM                ; 3
    ora    ram_BD                ; 3
    sta    ram_BD                ; 3
LFAAA:
    lda    ram_BC                ; 3
    ora    #$F0                  ; 2
    sta    ram_BC                ; 3
    lsr                          ; 2
    bcs    LFAB5                 ; 2³
    iny                          ; 2
    iny                          ; 2
LFAB5:
    dey                          ; 2
    sty    ram_BA                ; 3
    lda    ram_DF                ; 3
    and    #$20                  ; 2
    ora    ram_C6                ; 3
    bne    LFAC8                 ; 2³
    lda    #$AA                  ; 2
    sta    ram_C9                ; 3
    lda    #$FF                  ; 2
    sta    ram_C6                ; 3
LFAC8:
    lda    ram_BA                ; 3
    ldx    ram_BB                ; 3
    jsr    LF9E1                 ; 6
    sta    ram_BB                ; 3
LFAD1:
    lda    ram_BA                ; 3
    lsr                          ; 2
    lsr                          ; 2
    ldy    #$4E                  ; 2
    bcc    LFADB                 ; 2³
    ldy    #$8A                  ; 2
LFADB:
    lda    ram_BB                ; 3
    clc                          ; 2
    adc    #$1D                  ; 2
    ldx    #$B8                  ; 2
    jsr    LFC9E                 ; 6
    lda    ram_F3                ; 3
    bne    LFAED                 ; 2³
    sta    ram_B0                ; 3
    sta    ram_B6                ; 3
LFAED:
    rts                          ; 6

LFAEE:
    lda    #$F0                  ; 2
    and    ram_BC                ; 3
    bmi    LFB01                 ; 2³+1
    inx                          ; 2
    cpx    #$10                  ; 2
    beq    LFAFD                 ; 2³
    cpx    #$67                  ; 2
    bne    LFB10                 ; 2³+1
LFAFD:
    inc    ram_BA                ; 5
    bne    LFB10                 ; 2³
LFB01:
    dex                          ; 2
    bne    LFB16                 ; 2³
    ldx    #$3B                  ; 2
LFB06:
    and    #$0F                  ; 2
    ldy    ram_DF                ; 3
    bpl    LFB10                 ; 2³
    ldy    #$90                  ; 2
    sty    ram_BA                ; 3
LFB10:
    sta    ram_BC                ; 3
    stx    ram_BB                ; 3
    bne    LFAD1                 ; 2³+1
LFB16:
    cpx    #$3A                  ; 2
    bne    LFB10                 ; 2³
    ldx    #$00                  ; 2
    beq    LFB06                 ; 3   always branch

LFB1E:
    lda    #$00                  ; 2
    sta    ram_F3                ; 3
LFB22:
    lda    #$0F                  ; 2
    ora    ram_BC                ; 3
    bmi    LFB01                 ; 2³
    inx                          ; 2
    cpx    #$25                  ; 2
    beq    LFB31                 ; 2³
    cpx    #$7C                  ; 2
    bne    LFB10                 ; 2³
LFB31:
    dec    ram_BA                ; 5
    bne    LFB10                 ; 2³
LFB35:
    ldx    ram_9B                ; 3
    beq    LFB54                 ; 2³
    dec    ram_9B                ; 5
    ldx    ram_9C                ; 3
    lda    ram_9A                ; 3
    lsr                          ; 2
    bcs    LFB4A                 ; 2³
    cpx    #$95                  ; 2
    bcs    LFB50                 ; 2³
    inx                          ; 2
    inx                          ; 2
    bne    LFB50                 ; 2³
LFB4A:
    cpx    #$10                  ; 2
    bcc    LFB50                 ; 2³
    dex                          ; 2
    dex                          ; 2
LFB50:
    stx    ram_9C                ; 3
    bne    LFB8C                 ; 2³
LFB54:
    lda    CXM0P                 ; 3
    asl                          ; 2
    bpl    LFB8C                 ; 2³
    lda    INPT4                 ; 3
    bmi    LFB73                 ; 2³
    lda    ram_DD                ; 3
    beq    LFB73                 ; 2³
    ldx    SWCHA                 ; 4
    inx                          ; 2
    beq    LFB6B                 ; 2³
    lsr    ram_ED                ; 5
    bpl    LFB73                 ; 3   always branch

LFB6B:
    lda    ram_BD                ; 3
    bmi    LFB73                 ; 2³
    lda    #$0C                  ; 2
    sta    ram_9B                ; 3
LFB73:
    lda    ram_AC                ; 3
    sta    ram_9A                ; 3
    lsr                          ; 2
    lda    #$06                  ; 2
    bcc    LFB7E                 ; 2³
    lda    #$01                  ; 2
LFB7E:
    adc    ram_AA                ; 3
    sta    ram_9C                ; 3
    lda    ram_AB                ; 3
    ldx    INPT4                 ; 3
    bpl    LFB8A                 ; 2³
    adc    #$04                  ; 2
LFB8A:
    sta    ram_9D                ; 3
LFB8C:
    ldy    #$4E                  ; 2
    ldx    #$98                  ; 2
    lda    ram_9D                ; 3
    jsr    LFC9E                 ; 6
    lda    ram_9C                ; 3
    jsr    LFE32                 ; 6
    stx    RESM0                 ; 3
    sta    HMM0                  ; 3
LFB9E:
    rts                          ; 6

LFB9F:
    lda    #$00                  ; 2
    sta    ram_CA                ; 3
    sta    ram_CB                ; 3
    lda    ram_8C                ; 3
    lsr                          ; 2
    bcs    LFBB4                 ; 2³
    lda    #$FF                  ; 2
    sta    ram_C6                ; 3
    lda    #$78                  ; 2
    sta    ram_C9                ; 3
    dec    ram_8C                ; 5
LFBB4:
    inc    ram_EE                ; 5
    bne    LFB9E                 ; 2³
    lda    #$01                  ; 2
    sta    CXCLR                 ; 3
    lda    ram_BF                ; 3
    bmi    LFB9E                 ; 2³
    lda    #$00                  ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    sta    ram_DD                ; 3
    sta    ram_90                ; 3
    sta    ram_ED                ; 3
    pla                          ; 4
    pla                          ; 4
    jmp    LF131                 ; 3

LFBD1:
    .byte $EF ; |XXX XXXX| $FBD1
    .byte $F0 ; |XXXX    | $FBD2
    .byte $E1 ; |XXX    X| $FBD3
    .byte $F0 ; |XXXX    | $FBD4
    .byte $D4 ; |XX X X  | $FBD5
    .byte $F0 ; |XXXX    | $FBD6
    .byte $C8 ; |XX  X   | $FBD7
    .byte $F0 ; |XXXX    | $FBD8
    .byte $BC ; |X XXXX  | $FBD9
    .byte $F0 ; |XXXX    | $FBDA
    .byte $AF ; |X X XXXX| $FBDB
    .byte $F0 ; |XXXX    | $FBDC
    .byte $05 ; |     X X| $FBDD
    .byte $68 ; | XX X   | $FBDE
LFBDF:
    .byte $D2 ; |XX X  X | $FBDF
    .byte $C5 ; |XX   X X| $FBE0
    .byte $B1 ; |X XX   X| $FBE1
    .byte $BF ; |X XXXXXX| $FBE2
    .byte $BA ; |X XXX X | $FBE3
    .byte $AA ; |X X X X | $FBE4
    .byte $A1 ; |X X    X| $FBE5
    .byte $A0 ; |X X     | $FBE6
    .byte $D0 ; |XX X    | $FBE7
    .byte $0A ; |    X X | $FBE8
    .byte $AC ; |X X XX  | $FBE9
    .byte $BC ; |X XXXX  | $FBEA
    .byte $00 ; |        | $FBEB
LFBEC:
    .byte $1D ; |   XXX X| $FBEC
    .byte $FF ; |XXXXXXXX| $FBED
    .byte $F0 ; |XXXX    | $FBEE
    .byte $2F ; |  X XXXX| $FBEF
    .byte $70 ; | XXX    | $FBF0
    .byte $28 ; |  X X   | $FBF1
    .byte $DB ; |XX XX XX| $FBF2
    .byte $27 ; |  X  XXX| $FBF3
    .byte $A7 ; |X X  XXX| $FBF4
    .byte $31 ; |  XX   X| $FBF5
    .byte $00 ; |        | $FBF6
    .byte $00 ; |        | $FBF7
    .byte $00 ; |        | $FBF8

LFBF9:
    ldy    #$06                  ; 2
LFBFB:
    sta    VSYNC,X               ; 4
    dex                          ; 2
    dex                          ; 2
    dey                          ; 2
    bne    LFBFB                 ; 2³+1
    rts                          ; 6

LFC03:
    lda    LFBEC,Y               ; 4
    sta    0,X                   ; 4
    iny                          ; 2
LFC09:
    ldx    LFBDF,Y               ; 4
    bne    LFC03                 ; 2³
    rts                          ; 6

LFC0F:
    lda    #$DF                  ; 2
    jmp    LFC28                 ; 3

LFC14:
    lda    ram_AA                ; 3
    ldx    #$DB                  ; 2
    ror                          ; 2
    ror                          ; 2
    bcc    LFC27                 ; 2³
    ldx    #$DC                  ; 2
    rol                          ; 2
    rol                          ; 2
    eor    ram_AC                ; 3
    lsr                          ; 2
    bcc    LFC27                 ; 2³
    ldx    #$DE                  ; 2
LFC27:
    txa                          ; 2
LFC28:
    ldx    #$A9                  ; 2
    jmp    LFBF9                 ; 3

LFC2D:
    lda    #$DD                  ; 2
    sta    ram_E1                ; 3
    lda    ram_DF                ; 3
    and    #$07                  ; 2
    ora    #$C0                  ; 2
    sta    ram_E0                ; 3
    rts                          ; 6

LFC3A:
    ldx    #$0C                  ; 2
LFC3C:
    lda    ram_9C,X              ; 4
    cmp    #$45                  ; 2
    bcc    LFC44                 ; 2³
    sbc    #$3C                  ; 2
LFC44:
    ora    #$80                  ; 2
    sta    ram_CC,X              ; 4
    dex                          ; 2
    dex                          ; 2
    bne    LFC3C                 ; 2³
    rts                          ; 6

LFC4D:
    ldy    ram_BA                ; 3
    tya                          ; 2
    ldx    #$00                  ; 2
    cmp    #$04                  ; 2
    bcc    LFC5B                 ; 2³
    dex                          ; 2
    cmp    #$96                  ; 2
    bcc    LFC63                 ; 2³
LFC5B:
    stx    ram_BE                ; 3
    lda    ram_DF                ; 3
    lsr                          ; 2
    bcc    LFC63                 ; 2³
    iny                          ; 2
LFC63:
    lda    ram_BE                ; 3
    bmi    LFC6B                 ; 2³
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
LFC6B:
    dey                          ; 2
    dey                          ; 2
    sty    ram_BA                ; 3
    ldy    ram_BB                ; 3
    ldx    ram_BC                ; 3
    beq    LFC82                 ; 2³
    cpx    #$30                  ; 2
    bcc    LFC7B                 ; 2³
    iny                          ; 2
    iny                          ; 2
LFC7B:
    dex                          ; 2
    dey                          ; 2
    stx    ram_BC                ; 3
    sty    ram_BB                ; 3
    rts                          ; 6

LFC82:
    dey                          ; 2
    sty    ram_BB                ; 3
    cpy    #$20                  ; 2
    bcc    LFC99                 ; 2³
    lda    ram_C1                ; 3
    bpl    LFC99                 ; 2³
    lda    #$40                  ; 2
    sta    ram_BC                ; 3
    lda    #$FF                  ; 2
    sta    ram_C6                ; 3
    lda    #$9B                  ; 2
    sta    ram_C9                ; 3
LFC99:
    rts                          ; 6

LFC9A:
    ldy    #$27                  ; 2
    bne    LFCA2                 ; 3   always branch

LFC9E:
    sty    ram_F2                ; 3
LFCA0:
    ldy    #$1D                  ; 2
LFCA2:
    sty    ram_F0                ; 3
    ldy    #$06                  ; 2
LFCA6:
    sec                          ; 2
    sty    ram_F1                ; 3
    ldy    #$00                  ; 2
LFCAB:
    sbc    ram_F0                ; 3
    bcc    LFCB8                 ; 2³
    sty    0,X                   ; 4
LFCB1:
    dex                          ; 2
    dex                          ; 2
    dec    ram_F1                ; 5
    bne    LFCAB                 ; 2³
    rts                          ; 6

LFCB8:
    eor    #$FF                  ; 2
    adc    #$01                  ; 2
    cmp    #$1E                  ; 2
    php                          ; 3
    clc                          ; 2
    adc    ram_F2                ; 3
    sty    ram_F2                ; 3
    sta    0,X                   ; 4
    plp                          ; 4
    bcs    LFCD4                 ; 2³
    dex                          ; 2
    dex                          ; 2
    dec    ram_F1                ; 5
    bne    LFCD0                 ; 2³
    rts                          ; 6

LFCD0:
    adc    ram_F0                ; 3
    sta    0,X                   ; 4
LFCD4:
    lda    #$FF                  ; 2
    bne    LFCB1                 ; 3   always branch

LFCD8:
    lda    ram_DD                ; 3
    beq    LFCEE                 ; 2³
    bmi    LFCE6                 ; 2³
    ldx    #$DD                  ; 2
    jsr    LFECE                 ; 6
    jmp    LFE98                 ; 3

LFCE6:
    ldx    #$D9                  ; 2
    jsr    LFECE                 ; 6
    jmp    LFDA0                 ; 3

LFCEE:
    ldx    ram_DE                ; 3
    inx                          ; 2
    txa                          ; 2
    and    #$0F                  ; 2
    tax                          ; 2
    stx    ram_DE                ; 3
    lda    LFD50,X               ; 4
    sta    ram_BA                ; 3
    lda    LFD60,X               ; 4
    sta    ram_BB                ; 3
    ldy    LFD90,X               ; 4
    cpy    #$C0                  ; 2
    bne    LFD13                 ; 2³
    lda    ram_DF                ; 3
    eor    #$03                  ; 2
    lsr                          ; 2
    and    #$01                  ; 2
    adc    ram_DE                ; 3
    sta    ram_DE                ; 3
LFD13:
    lda    ram_DF                ; 3
    bpl    LFD2F                 ; 2³
    lda    ram_AB                ; 3
    cmp    #$30                  ; 2
    bcs    LFD23                 ; 2³
    cpx    #$07                  ; 2
    bne    LFD2F                 ; 2³
    beq    LFD27                 ; 3   always branch

LFD23:
    cpx    #$0F                  ; 2
    bne    LFD2F                 ; 2³
LFD27:
    txa                          ; 2
    sec                          ; 2
    sbc    #$07                  ; 2
    sta    ram_DE                ; 3
    ldy    #$2B                  ; 2
LFD2F:
    sty    ram_DD                ; 3
    lda    LFD70,X               ; 4
    sta    ram_BC                ; 3
    lda    LFD80,X               ; 4
    sta    ram_C1                ; 3
    lsr                          ; 2
    sta    ram_C2                ; 3
    lsr                          ; 2
    sta    ram_C3                ; 3
    lsr                          ; 2
    sta    ram_C4                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lda    #$40                  ; 2
    bcc    LFD4D                 ; 2³
    lda    #$70                  ; 2
LFD4D:
    sta    ram_DC                ; 3
    rts                          ; 6

LFD50:
    .byte $40 ; | X      | $FD50
    .byte $00 ; |        | $FD51
    .byte $00 ; |        | $FD52
    .byte $00 ; |        | $FD53
    .byte $70 ; | XXX    | $FD54
    .byte $10 ; |   X    | $FD55
    .byte $70 ; | XXX    | $FD56
    .byte $40 ; | X      | $FD57
    .byte $70 ; | XXX    | $FD58
    .byte $00 ; |        | $FD59
    .byte $00 ; |        | $FD5A
    .byte $00 ; |        | $FD5B
    .byte $40 ; | X      | $FD5C
    .byte $40 ; | X      | $FD5D
    .byte $40 ; | X      | $FD5E
    .byte $70 ; | XXX    | $FD5F
LFD60:
    .byte $8B ; |X   X XX| $FD60
    .byte $A8 ; |X X X   | $FD61
    .byte $FF ; |XXXXXXXX| $FD62
    .byte $98 ; |X  XX   | $FD63
    .byte $1B ; |   XX XX| $FD64
    .byte $48 ; | X  X   | $FD65
    .byte $67 ; | XX  XXX| $FD66
    .byte $3D ; |  XXXX X| $FD67
    .byte $1B ; |   XX XX| $FD68
    .byte $A8 ; |X X X   | $FD69
    .byte $E8 ; |XXX X   | $FD6A
    .byte $98 ; |X  XX   | $FD6B
    .byte $8B ; |X   X XX| $FD6C
    .byte $5B ; | X XX XX| $FD6D
    .byte $3D ; |  XXXX X| $FD6E
    .byte $67 ; | XX  XXX| $FD6F
LFD70:
    .byte $F0 ; |XXXX    | $FD70
    .byte $F0 ; |XXXX    | $FD71
    .byte $F0 ; |XXXX    | $FD72
    .byte $F0 ; |XXXX    | $FD73
    .byte $00 ; |        | $FD74
    .byte $F0 ; |XXXX    | $FD75
    .byte $FF ; |XXXXXXXX| $FD76
    .byte $0F ; |    XXXX| $FD77
    .byte $00 ; |        | $FD78
    .byte $F0 ; |XXXX    | $FD79
    .byte $F0 ; |XXXX    | $FD7A
    .byte $F0 ; |XXXX    | $FD7B
    .byte $F0 ; |XXXX    | $FD7C
    .byte $00 ; |        | $FD7D
    .byte $0F ; |    XXXX| $FD7E
    .byte $FF ; |XXXXXXXX| $FD7F
LFD80:
    .byte $30 ; |  XX    | $FD80
    .byte $B4 ; |X XX X  | $FD81
    .byte $34 ; |  XX X  | $FD82
    .byte $34 ; |  XX X  | $FD83
    .byte $24 ; |  X  X  | $FD84
    .byte $24 ; |  X  X  | $FD85
    .byte $08 ; |    X   | $FD86
    .byte $30 ; |  XX    | $FD87
    .byte $02 ; |      X | $FD88
    .byte $8A ; |X   X X | $FD89
    .byte $0A ; |    X X | $FD8A
    .byte $0A ; |    X X | $FD8B
    .byte $08 ; |    X   | $FD8C
    .byte $08 ; |    X   | $FD8D
    .byte $24 ; |  X  X  | $FD8E
    .byte $02 ; |      X | $FD8F
LFD90:
    .byte $21 ; |  X    X| $FD90
    .byte $C0 ; |XX      | $FD91
    .byte $FF ; |XXXXXXXX| $FD92
    .byte $FF ; |XXXXXXXX| $FD93
    .byte $2D ; |  X XX X| $FD94
    .byte $0C ; |    XX  | $FD95
    .byte $4C ; | X  XX  | $FD96
    .byte $4C ; | X  XX  | $FD97
    .byte $21 ; |  X    X| $FD98
    .byte $C0 ; |XX      | $FD99
    .byte $FF ; |XXXXXXXX| $FD9A
    .byte $FF ; |XXXXXXXX| $FD9B
    .byte $2D ; |  X XX X| $FD9C
    .byte $0C ; |    XX  | $FD9D
    .byte $4C ; | X  XX  | $FD9E
    .byte $4C ; | X  XX  | $FD9F

LFDA0:
    ldx    ram_DD                ; 3
    inx                          ; 2
    beq    LFDB1                 ; 2³
    lda    SWCHB                 ; 4
    asl                          ; 2
    bpl    LFDAE                 ; 2³
    inx                          ; 2
    beq    LFDB1                 ; 2³
LFDAE:
    stx    ram_DD                ; 3
    rts                          ; 6

LFDB1:
    lda    ram_BA                ; 3
    bne    LFDC3                 ; 2³
    lda    ram_AA                ; 3
    cmp    #$58                  ; 2
    bcs    LFDC3                 ; 2³
    lda    #$98                  ; 2
    sta    ram_BA                ; 3
    lda    #$FF                  ; 2
    sta    ram_BC                ; 3
LFDC3:
    inc    ram_BB                ; 5
    ldy    ram_BA                ; 3
    lda    ram_BC                ; 3
    lsr                          ; 2
    bcs    LFDE9                 ; 2³
    iny                          ; 2
    lda    ram_AA                ; 3
    sbc    ram_BA                ; 3
    bcc    LFDE2                 ; 2³
    jsr    LFE42                 ; 6
    bcc    LFDE2                 ; 2³
    sbc    ram_F0                ; 3
    bcc    LFDDF                 ; 2³
    dey                          ; 2
    dec    ram_BB                ; 5
LFDDF:
    iny                          ; 2
    dec    ram_BB                ; 5
LFDE2:
    cpy    #$9C                  ; 2
    bcs    LFE03                 ; 2³+1
LFDE6:
    sty    ram_BA                ; 3
    rts                          ; 6

LFDE9:
    dey                          ; 2
    lda    ram_BA                ; 3
    sbc    ram_AA                ; 3
    bcc    LFDFF                 ; 2³
    jsr    LFE42                 ; 6
    bcc    LFDFF                 ; 2³
    sbc    ram_F0                ; 3
    bcc    LFDFC                 ; 2³
    iny                          ; 2
    dec    ram_BB                ; 5
LFDFC:
    dey                          ; 2
    dec    ram_BB                ; 5
LFDFF:
    cpy    #$04                  ; 2
    bcs    LFDE6                 ; 2³+1
LFE03:
    inc    ram_DD                ; 5
    rts                          ; 6

LFE06:
    lda    ram_EE                ; 3
    bne    LFE31                 ; 2³
    lda    #$C0                  ; 2
    sta    ram_EE                ; 3
    ldx    #$98                  ; 2
    lda    ram_AB                ; 3
    sbc    #$04                  ; 2
    bcc    LFE31                 ; 2³
    sta    ram_9D                ; 3
    ldy    #$4E                  ; 2
    jsr    LFC9E                 ; 6
    lda    ram_AC                ; 3
    lsr                          ; 2
    lda    #$07                  ; 2
    bcc    LFE26                 ; 2³
    lda    #$FF                  ; 2
LFE26:
    adc    ram_AA                ; 3
    sta    ram_9C                ; 3
    jsr    LFE32                 ; 6
    stx    RESBL                 ; 3
    sta    HMBL                  ; 3
LFE31:
    rts                          ; 6

LFE32:
    sec                          ; 2
    eor    #$FF                  ; 2
    stx    WSYNC                 ; 3
;---------------------------------------
LFE37:
    adc    #$0F                  ; 2
    bcc    LFE37                 ; 2³
    adc    #$08                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
LFE40:
    asl                          ; 2
    rts                          ; 6

LFE42:
    dec    ram_BB                ; 5
    sta    ram_F0                ; 3
    lda    ram_BB                ; 3
    sbc    #$1B                  ; 2
    sbc    ram_AB                ; 3
    rts                          ; 6

LFE4D:
    lda    CXP0FB                ; 3
    asl                          ; 2
    bpl    LFE6D                 ; 2³
    lda    ram_DD                ; 3
    beq    LFE6D                 ; 2³
    lda    ram_9D                ; 3
    sbc    ram_AB                ; 3
    bcc    LFE6D                 ; 2³
    clc                          ; 2
    lda    ram_ED                ; 3
    adc    ram_AB                ; 3
    sta    ram_AB                ; 3
    lda    #$00                  ; 2
    sta    ram_DD                ; 3
    sta    ram_ED                ; 3
    lda    #$F0                  ; 2
    sta    ram_EE                ; 3
LFE6D:
    rts                          ; 6

LFE6E:
    lda    CXM0P                 ; 3
    asl                          ; 2
    bpl    LFE97                 ; 2³
    lda    ram_BF                ; 3
    bmi    LFE97                 ; 2³
    ldx    #$02                  ; 2
    lda    ram_AB                ; 3
    cmp    #$22                  ; 2
    bcc    LFE97                 ; 2³
    sbc    #$40                  ; 2
    bcc    LFE89                 ; 2³
    dex                          ; 2
    sbc    #$3A                  ; 2
    bcc    LFE89                 ; 2³
    dex                          ; 2
LFE89:
    lda    #$00                  ; 2
    sta    ram_C2,X              ; 4
    sta    ram_C9                ; 3
    lda    #$03                  ; 2
    sta    ram_CA                ; 3
    lda    #$FF                  ; 2
    sta    ram_C6                ; 3
LFE97:
    rts                          ; 6

LFE98:
    lda    ram_BA                ; 3
    and    #$03                  ; 2
    bne    LFEB4                 ; 2³
    dec    ram_DD                ; 5
    ldy    ram_BB                ; 3
    lda    ram_BC                ; 3
    bmi    LFEA8                 ; 2³
    iny                          ; 2
    iny                          ; 2
LFEA8:
    dey                          ; 2
    sty    ram_BB                ; 3
    dey                          ; 2
    cpy    #$8F                  ; 2
    bcc    LFEB4                 ; 2³
    eor    #$FF                  ; 2
    sta    ram_BC                ; 3
LFEB4:
    lda    ram_BC                ; 3
    ldy    ram_BA                ; 3
    lsr                          ; 2
    bcs    LFEBD                 ; 2³
    iny                          ; 2
    iny                          ; 2
LFEBD:
    dey                          ; 2
    rol                          ; 2
    sty    ram_BA                ; 3
    cpy    #$99                  ; 2
    bcs    LFEC9                 ; 2³
    cpy    #$03                  ; 2
    bcs    LFECD                 ; 2³
LFEC9:
    eor    #$0F                  ; 2
    sta    ram_BC                ; 3
LFECD:
    rts                          ; 6

LFECE:
    lda    ram_BA                ; 3
    and    #$08                  ; 2
    bne    LFED8                 ; 2³
    lda    #$44                  ; 2
    sta    ram_F2                ; 3
LFED8:
    txa                          ; 2
    ldx    #$B9                  ; 2
    jmp    LFBF9                 ; 3

LFEDE:
    lda    ram_EE                ; 3
    bne    LFF09                 ; 2³+1
    lda    ram_BF                ; 3
    bmi    LFEEA                 ; 2³
    lda    INPT4                 ; 3
    bmi    LFEF3                 ; 2³
LFEEA:
    ldy    ram_ED                ; 3
    iny                          ; 2
    sty    ram_ED                ; 3
    cpy    #$17                  ; 2
    bcc    LFF16                 ; 2³+1
LFEF3:
    lda    ram_ED                ; 3
    sta    ram_EE                ; 3
    lda    SWCHB                 ; 4
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    and    #$03                  ; 2
    tax                          ; 2
    lda    #$00                  ; 2
LFF02:
    adc    ram_EE                ; 3
    dex                          ; 2
    bpl    LFF02                 ; 2³
    sta    ram_EE                ; 3
LFF09:
    ldy    ram_ED                ; 3
    beq    LFF10                 ; 2³
    dec    ram_ED                ; 5
    rts                          ; 6

LFF10:
    ldy    ram_EE                ; 3
    beq    LFF16                 ; 2³
    dec    ram_EE                ; 5
LFF16:
    rts                          ; 6

LFF17:
    ldx    ram_DE                ; 3
    cpx    #$90                  ; 2
    bne    LFF2F                 ; 2³
    ldy    ram_C6                ; 3
    bne    LFF2F                 ; 2³
    lda    #$05                  ; 2
    sta    AUDV0                 ; 3
    lda    #$03                  ; 2
    sta    AUDC0                 ; 3
    lda    ram_DF                ; 3
    and    #$0F                  ; 2
    sta    AUDF0                 ; 3
LFF2F:
    dex                          ; 2
    bne    LFF3E                 ; 2³
    ldx    #$93                  ; 2
    lda    ram_DF                ; 3
    and    #$3F                  ; 2
    adc    ram_AA                ; 3
    sbc    #$18                  ; 2
    sta    ram_EC                ; 3
LFF3E:
    stx    ram_DE                ; 3
    txa                          ; 2
    ldx    #$EA                  ; 2
    ldy    #$80                  ; 2
    jsr    LFC9E                 ; 6
    lda    ram_EC                ; 3
    jsr    LFE32                 ; 6
    stx    RESM1                 ; 3
    sta    HMM1                  ; 3
    rts                          ; 6

LFF52:
    lda    ram_AC                ; 3
    and    #$08                  ; 2
    bne    LFF9A                 ; 2³
    beq    LFFA3                 ; 3   always branch

LFF5A:
    lda    ram_AA                ; 3
    and    #$03                  ; 2
    beq    LFF6F                 ; 2³
    lsr                          ; 2
    bcc    LFFA7                 ; 2³
    lda    ram_DD                ; 3
    bne    LFFA7                 ; 2³
    lda    #$08                  ; 2
    eor    ram_AC                ; 3
    sta    ram_AC                ; 3
    bcs    LFFA7                 ; 3   always branch

LFF6F:
    lda    ram_AB                ; 3
    and    #$03                  ; 2
    bne    LFFBC                 ; 2³
    lda    ram_BF                ; 3
    bmi    LFF8F                 ; 2³
    lda    SWCHA                 ; 4
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    bcs    LFF8D                 ; 2³
    lda    ram_AB                ; 3
    beq    LFFBB                 ; 2³
    lda    #$F0                  ; 2
    ora    ram_AC                ; 3
    sta    ram_AC                ; 3
    bne    LFFC5                 ; 3   always branch

LFF8D:
    bmi    LFF97                 ; 2³
LFF8F:
    lda    #$0F                  ; 2
    and    ram_AC                ; 3
    sta    ram_AC                ; 3
    bpl    LFFC5                 ; 3   always branch

LFF97:
    lsr                          ; 2
    bcs    LFFA0                 ; 2³
LFF9A:
    lda    #$FF                  ; 2
    sta    ram_AC                ; 3
    bne    LFFA7                 ; 3   always branch

LFFA0:
    lsr                          ; 2
    bcs    LFFBB                 ; 2³
LFFA3:
    lda    #$F0                  ; 2
    sta    ram_AC                ; 3
LFFA7:
    ldy    ram_AA                ; 3
    lda    ram_AC                ; 3
    lsr                          ; 2
    bcs    LFFB0                 ; 2³
    iny                          ; 2
    iny                          ; 2
LFFB0:
    dey                          ; 2
    sty    ram_AA                ; 3
    cpy    #$9A                  ; 2
    bcs    LFF9A                 ; 2³
    cpy    #$06                  ; 2
    bcc    LFFA3                 ; 2³
LFFBB:
    rts                          ; 6

LFFBC:
    lsr                          ; 2
    bcc    LFFC5                 ; 2³
    lda    #$0F                  ; 2
    eor    ram_AC                ; 3
    sta    ram_AC                ; 3
LFFC5:
    ldy    ram_AB                ; 3
    lda    ram_AC                ; 3
    bpl    LFFD3                 ; 2³
    lda    ram_DD                ; 3
    beq    LFFD1                 ; 2³
    dey                          ; 2
    dey                          ; 2
LFFD1:
    dey                          ; 2
    dey                          ; 2
LFFD3:
    iny                          ; 2
    sty    ram_AB                ; 3
    lda    #$48                  ; 2
    sta    ram_F2                ; 3
    lda    #$00                  ; 2
    sta    ram_DD                ; 3
    rts                          ; 6

    .byte $45 ; | X   X X| $FFDF
    .byte $51 ; | X X   X| $FFE0
    .byte $81 ; |X      X| $FFE1
    .byte $42 ; | X    X | $FFE2
    .byte $41 ; | X     X| $FFE3
    .byte $53 ; | X X  XX| $FFE4
    .byte $45 ; | X   X X| $FFE5
    .byte $2B ; |  X X XX| $FFE6
    .byte $24 ; |  X  X  | $FFE7
    .byte $32 ; |  XX  X | $FFE8
    .byte $39 ; |  XXX  X| $FFE9
    .byte $35 ; |  XX X X| $FFEA
    .byte $99 ; |X  XX  X| $FFEB
    .byte $00 ; |        | $FFEC
    .byte $19 ; |   XX  X| $FFED
    .byte $CC ; |XX  XX  | $FFEE
    .byte $06 ; |     XX | $FFEF
    .byte $54 ; | X X X  | $FFF0
    .byte $ED ; |XXX XX X| $FFF1
    .byte $60 ; | XX     | $FFF2
    .byte $A4 ; |X X  X  | $FFF3
    .byte $EE ; |XXX XXX | $FFF4
    .byte $F0 ; |XXXX    | $FFF5
    .byte $02 ; |      X | $FFF6
    .byte $C6 ; |XX   XX | $FFF7

       ORG $0FF8
      RORG $FFF8

    nop                          ; 2
    nop                          ; 2

    .word START_0
    .word START_0
    .word START_0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK_1
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $1000
      RORG $D000

    lda    ram_8D                ; 3
    sta    ram_F0                ; 3
LD004:
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    lda    LD6B6,Y               ; 4
    sta    COLUBK                ; 3
    lda    LD830,Y               ; 4
    sta    PF2                   ; 3
    lda    LD9AF,Y               ; 4
    jsr    LD08A                 ; 6
    bne    LD004                 ; 2³
    ldy    #$20                  ; 2
    ldx    #$9C                  ; 2
LD01E:
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    lda    LD7DF,Y               ; 4
    sta    COLUBK                ; 3
    lda    LDBE0,Y               ; 4
    sta    PF1                   ; 3
    lda    LD9DF,Y               ; 4
    jsr    LD08A                 ; 6
    bne    LD01E                 ; 2³
    ldy    #$10                  ; 2
LD036:
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    lda    LD820,Y               ; 4
    sta    PF0                   ; 3
    lda    LD9EF,Y               ; 4
    jsr    LD08A                 ; 6
    bne    LD036                 ; 2³
    ldx    #$2A                  ; 2
    ldy    #$30                  ; 2
LD04B:
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    lda    #$18                  ; 2
    sta    COLUPF                ; 3
    lda    LD800,Y               ; 4
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMBL                  ; 3
    cpy    ram_D2                ; 3
    bne    LD062                 ; 2³
    stx    COLUBK                ; 3
LD062:
    jmp    LD4FF                 ; 3

LD065:
    sty    ENAM0                 ; 3
    ldy    #$20                  ; 2
LD069:
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    lda    (ram_A0),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_D0),Y            ; 5
    sta    COLUP0                ; 3
    lda    LD800,Y               ; 4
    sta    HMBL                  ; 3
    dey                          ; 2
    bne    LD069                 ; 2³
    ldy    #$08                  ; 2
    jsr    LD690                 ; 6
    jsr    LD521                 ; 6
    lda    #<LF10F               ; 2
    jmp    LD1B3                 ; 3

LD08A:
    sta    HMBL                  ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMM0                  ; 3
    dec    ram_F0                ; 5
    bne    LD098                 ; 2³
    lda    #$02                  ; 2
LD098:
    sta    ENAM1                 ; 3
    cpy    #$18                  ; 2
    bne    LD0A2                 ; 2³
    stx    COLUP0                ; 3
    stx    COLUPF                ; 3
LD0A2:
    dey                          ; 2
    rts                          ; 6

    lda    ram_C0                ; 3
LD0A6:
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMCLR                 ; 3
    lda    (ram_A0),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_D0),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_B0),Y            ; 5
    sta    GRP1                  ; 3
    tya                          ; 2
    asl                          ; 2
    ora    #$0E                  ; 2
    sta    COLUBK                ; 3
    dey                          ; 2
    cpy    #$01                  ; 2
    bne    LD0A6                 ; 2³
    stx    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_A0),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_D0),Y            ; 5
    sta    COLUP0                ; 3
    ldy    #$27                  ; 2
    ldx    #$D6                  ; 2
    nop                          ; 2
LD0D0:
    stx    COLUBK                ; 3
    lda    (ram_E0),Y            ; 5
    sta    ENABL                 ; 3
    asl                          ; 2
    sta    ENAM0                 ; 3
    tya                          ; 2
    lsr                          ; 2
    bcc    LD0DD                 ; 2³
LD0DD:
    lda    #$00                  ; 2
    sta    PF2                   ; 3
    lda    LDAD8,Y               ; 4
    sta    COLUPF                ; 3
    and    ram_C1                ; 3
    sta    ENAM1                 ; 3
    lda    (ram_A2),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_D2),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_B2),Y            ; 5
    sta    GRP1                  ; 3
    lda    #$18                  ; 2
    sta    COLUBK                ; 3
    dey                          ; 2
    sta    PF2                   ; 3
    bne    LD0D0                 ; 2³
    sty    ram_C0                ; 3
    sty    PF2                   ; 3
    stx    COLUBK                ; 3
    ldy    #$27                  ; 2
LD107:
    tya                          ; 2
    lsr                          ; 2
    bcc    LD10B                 ; 2³
LD10B:
    lda    LDAD8,Y               ; 4
    sta    COLUPF                ; 3
    nop                          ; 2
    and    ram_C2                ; 3
    sta    ENAM1                 ; 3
    lda    (ram_A4),Y            ; 5
    sta    GRP0                  ; 3
    ldx    #$18                  ; 2
    stx    PF1                   ; 3
    lda    (ram_B4),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_D4),Y            ; 5
    sta    COLUP0                ; 3
    lda    #$00                  ; 2
    sta    ENAM0                 ; 3
    stx    COLUBK                ; 3
    sta    PF1                   ; 3
    lda    #$D4                  ; 2
    stx    ram_C0                ; 3
    sta    COLUBK                ; 3
    dey                          ; 2
    bne    LD107                 ; 2³
    ldy    #$27                  ; 2
    ldx    #$C6                  ; 2
    stx    ram_C0                ; 3
    nop                          ; 2
    nop                          ; 2
    jmp    LD14E                 ; 3

LD141:
    stx    COLUBK                ; 3
    lda    (ram_E0),Y            ; 5
    sta    ENAM0                 ; 3
    asl                          ; 2
    sta    ENABL                 ; 3
    tya                          ; 2
    lsr                          ; 2
    bcc    LD14E                 ; 2³
LD14E:
    lda    #$00                  ; 2
    sta    PF2                   ; 3
    lda    LDAD8,Y               ; 4
    sta    COLUPF                ; 3
    and    ram_C3                ; 3
    sta    ENAM1                 ; 3
    lda    (ram_A6),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_D6),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_B6),Y            ; 5
    sta    GRP1                  ; 3
    lda    #$18                  ; 2
    sta    COLUBK                ; 3
    dey                          ; 2
    sta    PF2                   ; 3
    bne    LD141                 ; 2³
    sty    ENABL                 ; 3
    sty    PF2                   ; 3
    ldy    #$27                  ; 2
    stx    COLUBK                ; 3
LD178:
    tya                          ; 2
    lsr                          ; 2
    bcc    LD17C                 ; 2³
LD17C:
    lda    LDAD8,Y               ; 4
    sta    COLUPF                ; 3
    nop                          ; 2
    and    ram_C4                ; 3
    sta    ENAM1                 ; 3
    lda    (ram_A8),Y            ; 5
    sta    GRP0                  ; 3
    ldx    #$18                  ; 2
    stx    PF1                   ; 3
    lda    (ram_B8),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_D8),Y            ; 5
    sta    COLUP0                ; 3
    lda    #$00                  ; 2
    sta    ENAM0                 ; 3
    stx    COLUBK                ; 3
    sta    PF1                   ; 3
    lda    #$C4                  ; 2
    stx    ram_C0                ; 3
    sta    COLUBK                ; 3
    dey                          ; 2
    bne    LD178                 ; 2³
    stx    COLUBK                ; 3
    ldy    #$0E                  ; 2
    jsr    LD68A                 ; 6
    jsr    LD521                 ; 6
    lda    #<LF115               ; 2
LD1B3:
    sta    ram_F4                ; 3
    lda    #$F1                  ; 2
    sta    ram_F5                ; 3
    lda    #$AD                  ; 2
    sta    ram_F0                ; 3
    lda    #$F8                  ; 2
    sta    ram_F1                ; 3
    lda    #$FF                  ; 2
    sta    ram_F2                ; 3
    lda    #$4C                  ; 2
    sta    ram_F3                ; 3
    jmp.w  ram_F0                ; 3

;in ram...
;    lda   BANK_0
;    jmp   LF1xx  ; xx = $00,$0F,$12,$15,$18,$1B
;
;START_0
;LF10F
;LF112
;LF115
;LF118
;LF11B

LD1CC:
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    stx    PF2                   ; 3
    lda    (ram_9E),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_CE),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_AE),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_E0),Y            ; 5
    sta    HMM1                  ; 3
    sta    ENAM1                 ; 3
    lda    (ram_8E),Y            ; 5
    sta    ENABL                 ; 3
    and    #$30                  ; 2
    sta    CTRLPF                ; 3
    cpy    #$19                  ; 2
    bcs    LD1F7                 ; 2³
    lda    LDBC0,Y               ; 4
    sta    PF2                   ; 3
    stx    ENAM0                 ; 3
LD1F7:
    dey                          ; 2
    bne    LD1CC                 ; 2³
    ldx    ram_C3                ; 3
    ldy    #$1D                  ; 2
    stx    HMOVE                 ; 3
    bne    LD215                 ; 3   always branch

LD202:
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    lda    (ram_90),Y            ; 5
    sta    ENABL                 ; 3
    and    #$30                  ; 2
    sta    CTRLPF                ; 3
    lda    LDBA8,Y               ; 4
    sta    PF1                   ; 3
    sta    PF2                   ; 3
LD215:
    lda    (ram_A0),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_D0),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_B0),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_E2),Y            ; 5
    sta    HMM1                  ; 3
    sta    ENAM1                 ; 3
    cpy    #$07                  ; 2
    bcs    LD22D                 ; 2³
    stx    ENAM0                 ; 3
LD22D:
    dey                          ; 2
    bne    LD202                 ; 2³
    sty    ENAM0                 ; 3
    stx    HMOVE                 ; 3
    ldy    #$1D                  ; 2
    bne    LD241                 ; 3   always branch

LD238:
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    lda    LDBC0,Y               ; 4
    sta    PF0                   ; 3
LD241:
    lda    (ram_A2),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_D2),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_B2),Y            ; 5
    sta    GRP1                  ; 3
    stx    PF0                   ; 3
    lda    (ram_E4),Y            ; 5
    sta    HMM1                  ; 3
    sta    ENAM1                 ; 3
    lda    (ram_92),Y            ; 5
    stx    RESM0                 ; 3
    sta    ENABL                 ; 3
    and    #$30                  ; 2
    sta    CTRLPF                ; 3
    ldx    ram_C4                ; 3
    dey                          ; 2
    bne    LD238                 ; 2³
    ldy    #$1D                  ; 2
LD266:
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    lda    LDBA8,Y               ; 4
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    (ram_A4),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_D4),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_B4),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_E6),Y            ; 5
    sta    HMM1                  ; 3
    sta    ENAM1                 ; 3
    lda    (ram_94),Y            ; 5
    sta    ENABL                 ; 3
    and    #$30                  ; 2
    sta    CTRLPF                ; 3
    cpy    #$07                  ; 2
    bcs    LD291                 ; 2³
    stx    ENAM0                 ; 3
LD291:
    dey                          ; 2
    bne    LD266                 ; 2³
    sty    ENAM0                 ; 3
    stx    HMOVE                 ; 3
    ldy    #$1D                  ; 2
    bne    LD2A4                 ; 3   always branch

LD29C:
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    ldx    #$00                  ; 2
    stx    PF2                   ; 3
LD2A4:
    lda    (ram_A6),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_D6),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_B6),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_E8),Y            ; 5
    sta    HMM1                  ; 3
    sta    ENAM1                 ; 3
    lda    LDBC0,Y               ; 4
    sta    PF2                   ; 3
    lda    (ram_96),Y            ; 5
    sta    ENABL                 ; 3
    and    #$30                  ; 2
    sta    CTRLPF                ; 3
    dey                          ; 2
    bne    LD29C                 ; 2³
    sty    ENAM1                 ; 3
    sty    GRP1                  ; 3
    sty    HMOVE                 ; 3
    ldy    #$1D                  ; 2
    lda    CXP1FB                ; 3
    asl                          ; 2
    lda    CXPPMM                ; 3
    ror                          ; 2
    sta    ram_C1                ; 3
    lda    #$04                  ; 2
    sta    NUSIZ1                ; 3
    bne    LD2EC                 ; 3   always branch

LD2DC:
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    lda    LDEDE,Y               ; 4
    sta    GRP1                  ; 3
    lda    LDBA8,Y               ; 4
    sta    PF1                   ; 3
    sta    PF2                   ; 3
LD2EC:
    lda    (ram_A8),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_D8),Y            ; 5
    nop                          ; 2
    stx    RESP1                 ; 3
    sta    COLUP0                ; 3
    lda    (ram_98),Y            ; 5
    sta    ENABL                 ; 3
    and    #$30                  ; 2
    sta    CTRLPF                ; 3
    lda    #$CA                  ; 2
    sta    COLUP1                ; 3
    lda    #$12                  ; 2
    sta    COLUPF                ; 3
    dey                          ; 2
    bne    LD2DC                 ; 2³+1
    ldy    #$0A                  ; 2
    jsr    LD68A                 ; 6
    jsr    LD521                 ; 6
    lda    #<LF112               ; 2
    jmp    LD1B3                 ; 3

LD317:
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    sty    PF0                   ; 3
    sty    COLUPF                ; 3
    lda    LDCE2,Y               ; 4
    sta    HMBL                  ; 3
    lda    (ram_9E),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_CE),Y            ; 5
    sta    COLUP0                ; 3
    lda    LDDC8,Y               ; 4
    sta    HMM1                  ; 3
    lda    (ram_E0),Y            ; 5
    sta    ENAM1                 ; 3
    lda    (ram_8E),Y            ; 5
    sta    ENAM0                 ; 3
    lda    LDDA0,Y               ; 4
    and    ram_C2                ; 3
    sta    PF0                   ; 3
    dey                          ; 2
    sta    COLUPF                ; 3
    bne    LD317                 ; 2³
    ldx    ram_DF                ; 3
    stx    HMOVE                 ; 3
    stx    COLUPF                ; 3
    ldy    #$9A                  ; 2
    sty    COLUBK                ; 3
    ldy    #$1D                  ; 2
    bne    LD362                 ; 3   always branch

LD353:
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    lda    LDCC5,Y               ; 4
    sta    HMBL                  ; 3
    sta    CTRLPF                ; 3
    lda    (ram_D0),Y            ; 5
    sta    COLUP0                ; 3
LD362:
    lda    (ram_A0),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_AE),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_E2),Y            ; 5
    sta    ENAM1                 ; 3
    lda    LDDE0,Y               ; 4
    sta    HMM1                  ; 3
    lda    (ram_90),Y            ; 5
    sta    ENAM0                 ; 3
    and    #$30                  ; 2
    sta    NUSIZ0                ; 3
    dey                          ; 2
    bne    LD353                 ; 2³
    ldy    #$1D                  ; 2
    lda    #$98                  ; 2
    stx    HMOVE                 ; 3
    sta    COLUBK                ; 3
    bne    LD393                 ; 3   always branch

LD388:
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    lda    LDCA8,Y               ; 4
    sta    HMBL                  ; 3
    sta    CTRLPF                ; 3
LD393:
    lda    (ram_A2),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_D2),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_B0),Y            ; 5
    sta    GRP1                  ; 3
    lda    LDDD8,Y               ; 4
    sta    HMM1                  ; 3
    lda    (ram_E4),Y            ; 5
    sta    ENAM1                 ; 3
    lda    (ram_92),Y            ; 5
    sta    ENAM0                 ; 3
    and    #$30                  ; 2
    sta    NUSIZ0                ; 3
    dey                          ; 2
    bne    LD388                 ; 2³
    sty    GRP1                  ; 3
    stx    HMOVE                 ; 3
    lda    #$AC                  ; 2
    sta    COLUBK                ; 3
    ldy    #$1D                  ; 2
    bne    LD3C7                 ; 3   always branch

LD3BF:
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    sty    PF0                   ; 3
    sty    COLUPF                ; 3
LD3C7:
    lda    LDCE2,Y               ; 4
    sta    HMBL                  ; 3
    lda    (ram_A4),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_D4),Y            ; 5
    sta    COLUP0                ; 3
    lda    LDDD0,Y               ; 4
    sta    HMM1                  ; 3
    lda    (ram_E6),Y            ; 5
    sta    ENAM1                 ; 3
    lda    (ram_94),Y            ; 5
    sta    ENAM0                 ; 3
    lda    LDDA0,Y               ; 4
    and    ram_C3                ; 3
    sta    PF0                   ; 3
    dey                          ; 2
    sta    COLUPF                ; 3
    bne    LD3BF                 ; 2³
    stx    COLUPF                ; 3
    stx    HMOVE                 ; 3
    lda    #$AA                  ; 2
    sta    COLUBK                ; 3
    ldy    #$1D                  ; 2
    bne    LD404                 ; 3+1   always branch

LD3F9:
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    lda    LDCC5,Y               ; 4
    sta    HMBL                  ; 3
    sta    CTRLPF                ; 3
LD404:
    lda    (ram_A6),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_D6),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_B4),Y            ; 5
    sta    GRP1                  ; 3
    lda    LDDCC,Y               ; 4
    sta    HMM1                  ; 3
    lda    (ram_E8),Y            ; 5
    sta    ENAM1                 ; 3
    lda    (ram_96),Y            ; 5
    sta    ENAM0                 ; 3
    and    #$30                  ; 2
    sta    NUSIZ0                ; 3
    dey                          ; 2
    bne    LD3F9                 ; 2³+1
    ldy    #$1D                  ; 2
    lda    #$A8                  ; 2
    stx    HMOVE                 ; 3
    sta    COLUBK                ; 3
    bne    LD439                 ; 3   always branch

LD42E:
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    lda    LDCA8,Y               ; 4
    sta    HMBL                  ; 3
    sta    CTRLPF                ; 3
LD439:
    lda    (ram_A8),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_D8),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_B6),Y            ; 5
    sta    GRP1                  ; 3
    lda    LDDDC,Y               ; 4
    sta    HMM1                  ; 3
    lda    (ram_EA),Y            ; 5
    sta    ENAM1                 ; 3
    lda    (ram_98),Y            ; 5
    sta    ENAM0                 ; 3
    and    #$30                  ; 2
    sta    NUSIZ0                ; 3
    dey                          ; 2
    bne    LD42E                 ; 2³
    ldy    #$0A                  ; 2
    jsr    LD690                 ; 6
    lda    #$0E                  ; 2
    sta    COLUBK                ; 3
    jsr    LD521                 ; 6
    lda    #<LF118               ; 2
    jmp    LD1B3                 ; 3

LD46A:
    stx    WSYNC                 ; 3
;---------------------------------------
    lda    ram_8D                ; 3
    adc    #$B8                  ; 2
    cpy    #$20                  ; 2
    bcs    LD476                 ; 2³
    adc    #$02                  ; 2
LD476:
    sta    COLUBK                ; 3
    lda    #$01                  ; 2
    ldx    ram_AC                ; 3
    bpl    LD480                 ; 2³
    lda    #$05                  ; 2
LD480:
    sta    CTRLPF                ; 3
    dey                          ; 2
    bne    LD46A                 ; 2³
    lda    ram_8D                ; 3
    adc    #$BC                  ; 2
    sta    COLUBK                ; 3
    ldy    #$20                  ; 2
LD48D:
    stx    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_A6),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_D6),Y            ; 5
    sta    COLUP0                ; 3
    lda    #$4C                  ; 2
    cmp    ram_AA                ; 3
    bcs    LD4A9                 ; 2³
    lda    LD8C0,Y               ; 4
    sta    GRP1                  ; 3
    lda    LD8E0,Y               ; 4
    adc    ram_8D                ; 3
    sta    COLUP1                ; 3
LD4A9:
    dey                          ; 2
    bne    LD48D                 ; 2³
    lda    ram_8D                ; 3
    adc    #$BE                  ; 2
    sta    COLUBK                ; 3
    adc    #$4E                  ; 2
    sta    COLUPF                ; 3
    ldy    #$20                  ; 2
    jmp    LD4C7                 ; 3

LD4BB:
    stx    WSYNC                 ; 3
;---------------------------------------
    lda    LD860,Y               ; 4
    sta    PF0                   ; 3
    lda    LD880,Y               ; 4
    sta    PF1                   ; 3
LD4C7:
    lda    LD8A0,Y               ; 4
    sta    PF2                   ; 3
    lda    (ram_A8),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_D8),Y            ; 5
    adc    ram_8D                ; 3
    sta    COLUP0                ; 3
    lda    ram_A9                ; 3
    cmp    #$DF                  ; 2
    bne    LD4E0                 ; 2³
    lda    #$05                  ; 2
    sta    NUSIZ0                ; 3
LD4E0:
    dey                          ; 2
    bne    LD4BB                 ; 2³
    sty    GRP0                  ; 3
    ldy    #$2A                  ; 2
LD4E7:
    stx    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bne    LD4E7                 ; 2³
    ldy    #$0F                  ; 2
    jsr    LD68A                 ; 6
    lda    ram_8D                ; 3
    adc    #$B6                  ; 2
    sta    COLUBK                ; 3
    jsr    LD521                 ; 6
    lda    #<LF11B               ; 2
    jmp    LD1B3                 ; 3

LD4FF:
    bcc    LD50E                 ; 2³
    lda    ram_8C                ; 3
    lsr                          ; 2
    beq    LD518                 ; 2³
    ora    #$01                  ; 2
    and    #$03                  ; 2
    sta    NUSIZ1                ; 3
    bne    LD518                 ; 3   always branch

LD50E:
    lda    LD8C0,Y               ; 4
    sta    GRP1                  ; 3
    lda    LD8E0,Y               ; 4
    sta    COLUP1                ; 3
LD518:
    dey                          ; 2
    beq    LD51E                 ; 2³
    jmp    LD04B                 ; 3

LD51E:
    jmp    LD065                 ; 3

LD521:
    lda    #$02                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    sta    VSYNC                 ; 3
    lda    #$22                  ; 2
    sta    TIM8T                 ; 4
    lda    INPT4                 ; 3
    and    INPT5                 ; 3
    ora    #$7F                  ; 2
    and    SWCHA                 ; 4
    eor    #$FF                  ; 2
    beq    LD546                 ; 2³
    lda    ram_BF                ; 3
    bpl    LD542                 ; 2³
    jmp    START_1               ; 3

LD542:
    lda    #$FF                  ; 2
    sta    ram_C5                ; 3
LD546:
    inc    ram_DF                ; 5
    bne    LD554                 ; 2³
    lsr    ram_C5                ; 5
    bne    LD554                 ; 2³
    lda    #$FF                  ; 2
    sta    CXCLR                 ; 3
    sta    ram_BF                ; 3
LD554:
    lda    ram_C6                ; 3
    bne    LD57E                 ; 2³
    ldy    #$50                  ; 2
    lda    ram_BF                ; 3
    cmp    #$10                  ; 2
    bcc    LD587                 ; 2³
    ldy    #$5A                  ; 2
    lda    ram_A1                ; 3
    cmp    #$DE                  ; 2
    beq    LD587                 ; 2³
    lda    ram_DF                ; 3
    and    #$20                  ; 2
    bne    LD5CD                 ; 2³
    ldy    #$64                  ; 2
    lda    ram_B1                ; 3
    cmp    #$D9                  ; 2
    beq    LD587                 ; 2³
    ldy    #$AA                  ; 2
    cmp    #$DD                  ; 2
    beq    LD587                 ; 2³
    bne    LD5CD                 ; 3   always branch

LD57E:
    bmi    LD585                 ; 2³
    sec                          ; 2
    sbc    #$08                  ; 2
    bcs    LD5BA                 ; 2³
LD585:
    ldy    ram_C9                ; 3
LD587:
    lda    LD700,Y               ; 4
    sta    ram_C6                ; 3
    iny                          ; 2
    lda    LD700,Y               ; 4
    tax                          ; 2
    and    #$0F                  ; 2
    sta    ram_C7                ; 3
    txa                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_C8                ; 3
    iny                          ; 2
    lda    LD700,Y               ; 4
    sta    AUDC0                 ; 3
    iny                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDC1                 ; 3
    lda    LD700,Y               ; 4
    sta    AUDF0                 ; 3
    iny                          ; 2
    lda    LD700,Y               ; 4
    sta    AUDF1                 ; 3
    iny                          ; 2
    sty    ram_C9                ; 3
    jmp    LD5CD                 ; 3

LD5BA:
    sta    ram_C6                ; 3
    ldx    #$02                  ; 2
LD5BE:
    ldy    ram_C6,X              ; 4
    beq    LD5C6                 ; 2³
    lsr                          ; 2
    bcc    LD5C6                 ; 2³
    dey                          ; 2
LD5C6:
    sty    AUDF1,X               ; 4
    sty    ram_C6,X              ; 4
    dex                          ; 2
    bne    LD5BE                 ; 2³
LD5CD:
    lda    INTIM                 ; 4
    bne    LD5CD                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    lda    #$0C                  ; 2
    sta    TIM64T                ; 4
    lda    ram_8C                ; 3
    cmp    #$05                  ; 2
    bne    LD5E5                 ; 2³
    lda    ram_C6                ; 3
    bne    LD63D                 ; 2³+1
LD5E5:
    lda    ram_80                ; 3
    cmp    #$92                  ; 2
    bcc    LD5F5                 ; 2³
LD5EB:
    lda    #$00                  ; 2
    ldx    #$0A                  ; 2
LD5EF:
    sta    ram_80,X              ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LD5EF                 ; 2³
LD5F5:
    lda    ram_BF                ; 3
    bpl    LD5FF                 ; 2³
    lda    #$00                  ; 2
    sta    ram_CA                ; 3
    sta    ram_CB                ; 3
LD5FF:
    lda    #$00                  ; 2
    sta    ram_81                ; 3
    sta    ram_83                ; 3
    lda    ram_CB                ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_89                ; 3
    lda    ram_CB                ; 3
    and    #$F0                  ; 2
    sta    ram_87                ; 3
    lda    ram_CA                ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_85                ; 3
    lda    ram_CA                ; 3
    ldx    #$00                  ; 2
    stx    ram_CA                ; 3
    stx    ram_CB                ; 3
    ldx    #$08                  ; 2
    ldy    #$F0                  ; 2
    cmp    #$F0                  ; 2
    bcc    LD63F                 ; 2³
LD62B:
    lda    ram_80,X              ; 4
    sed                          ; 2
    sbc    ram_81,X              ; 4
    cld                          ; 2
    and    #$F0                  ; 2
    sta    ram_80,X              ; 4
    sty    ram_81,X              ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LD62B                 ; 2³
    bcc    LD5EB                 ; 2³+1
LD63D:
    bne    LD665                 ; 3   always branch

LD63F:
    and    #$F0                  ; 2
    sta    ram_83                ; 3
LD643:
    lda    ram_81,X              ; 4
    ora    #$09                  ; 2
    sed                          ; 2
    adc    ram_80,X              ; 4
    cld                          ; 2
    and    #$F0                  ; 2
    sta    ram_80,X              ; 4
    sty    ram_81,X              ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LD643                 ; 2³
    lda    ram_80                ; 3
    cmp    ram_EF                ; 3
    beq    LD665                 ; 2³
    bcc    LD665                 ; 2³
    sta    ram_EF                ; 3
    ldx    ram_8C                ; 3
    inx                          ; 2
    inx                          ; 2
    stx    ram_8C                ; 3
LD665:
    lda    INTIM                 ; 4
    bne    LD665                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    sta    VBLANK                ; 3
    lda    #$28                  ; 2
    sta    TIM64T                ; 4
    lda    ram_8A                ; 3
    cmp    #$AF                  ; 2
    beq    LD681                 ; 2³
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcc    START_1               ; 2³
LD681:
    rts                          ; 6

START_1:
    lda    #<START_0             ; 2
    jmp    LD1B3                 ; 3

LD687:
    txa                          ; 2
    bne    LD690                 ; 2³
LD68A:
    stx    WSYNC                 ; 3
;---------------------------------------
    ldx    #$00                  ; 2
    beq    LD696                 ; 3   always branch

LD690:
    ldx    #$02                  ; 2
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
LD696:
    lda    #$02                  ; 2
    sta    VBLANK                ; 3
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    ENABL                 ; 3
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    sta    HMCLR                 ; 3
    dey                          ; 2
    bne    LD687                 ; 2³
    rts                          ; 6

LD6B6:
    .byte $A8 ; |X X X   | $D6B6
    .byte $AA ; |X X X X | $D6B7
    .byte $0A ; |    X X | $D6B8
    .byte $AA ; |X X X X | $D6B9
    .byte $AC ; |X X XX  | $D6BA
    .byte $0A ; |    X X | $D6BB
    .byte $0C ; |    XX  | $D6BC
    .byte $9C ; |X  XXX  | $D6BD
    .byte $AC ; |X X XX  | $D6BE
    .byte $0C ; |    XX  | $D6BF
    .byte $0E ; |    XXX | $D6C0
    .byte $AE ; |X X XXX | $D6C1
    .byte $9E ; |X  XXXX | $D6C2
    .byte $0E ; |    XXX | $D6C3
    .byte $0E ; |    XXX | $D6C4
    .byte $9E ; |X  XXXX | $D6C5
    .byte $8E ; |X   XXX | $D6C6
    .byte $0E ; |    XXX | $D6C7
    .byte $0E ; |    XXX | $D6C8
    .byte $0E ; |    XXX | $D6C9
    .byte $8E ; |X   XXX | $D6CA
    .byte $0E ; |    XXX | $D6CB
    .byte $0E ; |    XXX | $D6CC
    .byte $0E ; |    XXX | $D6CD
    .byte $0E ; |    XXX | $D6CE
    .byte $0E ; |    XXX | $D6CF
    .byte $0E ; |    XXX | $D6D0
    .byte $0E ; |    XXX | $D6D1
    .byte $0E ; |    XXX | $D6D2
    .byte $0E ; |    XXX | $D6D3
    .byte $0E ; |    XXX | $D6D4
    .byte $0E ; |    XXX | $D6D5
    .byte $0E ; |    XXX | $D6D6
    .byte $0E ; |    XXX | $D6D7
    .byte $0E ; |    XXX | $D6D8
    .byte $0E ; |    XXX | $D6D9
    .byte $0E ; |    XXX | $D6DA
    .byte $0E ; |    XXX | $D6DB
    .byte $0E ; |    XXX | $D6DC
    .byte $0E ; |    XXX | $D6DD
    .byte $0E ; |    XXX | $D6DE
    .byte $0E ; |    XXX | $D6DF
    .byte $0E ; |    XXX | $D6E0
    .byte $0E ; |    XXX | $D6E1
    .byte $0E ; |    XXX | $D6E2
    .byte $0E ; |    XXX | $D6E3
    .byte $0E ; |    XXX | $D6E4
    .byte $0E ; |    XXX | $D6E5
    .byte $0E ; |    XXX | $D6E6
    .byte $0E ; |    XXX | $D6E7
    .byte $0E ; |    XXX | $D6E8
    .byte $0E ; |    XXX | $D6E9
    .byte $0E ; |    XXX | $D6EA
    .byte $0E ; |    XXX | $D6EB
    .byte $0E ; |    XXX | $D6EC
    .byte $0E ; |    XXX | $D6ED
    .byte $0E ; |    XXX | $D6EE
    .byte $0E ; |    XXX | $D6EF
    .byte $0E ; |    XXX | $D6F0
    .byte $0E ; |    XXX | $D6F1
    .byte $0E ; |    XXX | $D6F2
    .byte $0E ; |    XXX | $D6F3
    .byte $0E ; |    XXX | $D6F4
    .byte $E0 ; |XXX     | $D6F5
    .byte $10 ; |   X    | $D6F6
    .byte $F0 ; |XXXX    | $D6F7
    .byte $04 ; |     X  | $D6F8
    .byte $E0 ; |XXX     | $D6F9
    .byte $67 ; | XX  XXX| $D6FA
    .byte $D0 ; |XX X    | $D6FB
    .byte $13 ; |   X  XX| $D6FC
    .byte $E6 ; |XXX  XX | $D6FD
    .byte $BA ; |X XXX X | $D6FE
    .byte $D0 ; |XX X    | $D6FF
LD700:
    .byte $33 ; |  XX  XX| $D700
    .byte $6A ; | XX X X | $D701
    .byte $C4 ; |XX   X  | $D702
    .byte $1C ; |   XXX  | $D703
    .byte $12 ; |   X  X | $D704
    .byte $33 ; |  XX  XX| $D705
    .byte $6A ; | XX X X | $D706
    .byte $C4 ; |XX   X  | $D707
    .byte $1A ; |   XX X | $D708
    .byte $11 ; |   X   X| $D709
    .byte $63 ; | XX   XX| $D70A
    .byte $6A ; | XX X X | $D70B
    .byte $C4 ; |XX   X  | $D70C
    .byte $17 ; |   X XXX| $D70D
    .byte $0F ; |    XXXX| $D70E
    .byte $63 ; | XX   XX| $D70F
    .byte $6A ; | XX X X | $D710
    .byte $C4 ; |XX   X  | $D711
    .byte $1C ; |   XXX  | $D712
    .byte $12 ; |   X  X | $D713
    .byte $63 ; | XX   XX| $D714
    .byte $6A ; | XX X X | $D715
    .byte $CC ; |XX  XX  | $D716
    .byte $0B ; |    X XX| $D717
    .byte $17 ; |   X XXX| $D718
    .byte $63 ; | XX   XX| $D719
    .byte $6A ; | XX X X | $D71A
    .byte $C4 ; |XX   X  | $D71B
    .byte $14 ; |   X X  | $D71C
    .byte $0D ; |    XX X| $D71D
    .byte $63 ; | XX   XX| $D71E
    .byte $6A ; | XX X X | $D71F
    .byte $C4 ; |XX   X  | $D720
    .byte $17 ; |   X XXX| $D721
    .byte $0F ; |    XXXX| $D722
    .byte $63 ; | XX   XX| $D723
    .byte $6A ; | XX X X | $D724
    .byte $C4 ; |XX   X  | $D725
    .byte $17 ; |   X XXX| $D726
    .byte $0F ; |    XXXX| $D727
    .byte $63 ; | XX   XX| $D728
    .byte $00 ; |        | $D729
    .byte $00 ; |        | $D72A
    .byte $00 ; |        | $D72B
    .byte $00 ; |        | $D72C
    .byte $33 ; |  XX  XX| $D72D
    .byte $6A ; | XX X X | $D72E
    .byte $C4 ; |XX   X  | $D72F
    .byte $1F ; |   XXXXX| $D730
    .byte $14 ; |   X X  | $D731
    .byte $33 ; |  XX  XX| $D732
    .byte $6A ; | XX X X | $D733
    .byte $C4 ; |XX   X  | $D734
    .byte $1C ; |   XXX  | $D735
    .byte $13 ; |   X  XX| $D736
    .byte $63 ; | XX   XX| $D737
    .byte $6A ; | XX X X | $D738
    .byte $C4 ; |XX   X  | $D739
    .byte $1A ; |   XX X | $D73A
    .byte $11 ; |   X   X| $D73B
    .byte $63 ; | XX   XX| $D73C
    .byte $6A ; | XX X X | $D73D
    .byte $C4 ; |XX   X  | $D73E
    .byte $17 ; |   X XXX| $D73F
    .byte $0F ; |    XXXX| $D740
    .byte $63 ; | XX   XX| $D741
    .byte $6A ; | XX X X | $D742
    .byte $C4 ; |XX   X  | $D743
    .byte $14 ; |   X X  | $D744
    .byte $0D ; |    XX X| $D745
    .byte $63 ; | XX   XX| $D746
    .byte $3A ; |  XXX X | $D747
    .byte $C4 ; |XX   X  | $D748
    .byte $12 ; |   X  X | $D749
    .byte $18 ; |   XX   | $D74A
    .byte $63 ; | XX   XX| $D74B
    .byte $6A ; | XX X X | $D74C
    .byte $C4 ; |XX   X  | $D74D
    .byte $11 ; |   X   X| $D74E
    .byte $0B ; |    X XX| $D74F
    .byte $63 ; | XX   XX| $D750
    .byte $8C ; |X   XX  | $D751
    .byte $C4 ; |XX   X  | $D752
    .byte $11 ; |   X   X| $D753
    .byte $0B ; |    X XX| $D754
    .byte $00 ; |        | $D755
    .byte $00 ; |        | $D756
    .byte $00 ; |        | $D757
    .byte $00 ; |        | $D758
    .byte $00 ; |        | $D759
    .byte $14 ; |   X X  | $D75A
    .byte $88 ; |X   X   | $D75B
    .byte $6E ; | XX XXX | $D75C
    .byte $1C ; |   XXX  | $D75D
    .byte $1F ; |   XXXXX| $D75E
    .byte $00 ; |        | $D75F
    .byte $00 ; |        | $D760
    .byte $00 ; |        | $D761
    .byte $00 ; |        | $D762
    .byte $00 ; |        | $D763
    .byte $14 ; |   X X  | $D764
    .byte $48 ; | X  X   | $D765
    .byte $34 ; |  XX X  | $D766
    .byte $03 ; |      XX| $D767
    .byte $03 ; |      XX| $D768
    .byte $24 ; |  X  X  | $D769
    .byte $48 ; | X  X   | $D76A
    .byte $34 ; |  XX X  | $D76B
    .byte $00 ; |        | $D76C
    .byte $00 ; |        | $D76D
    .byte $7F ; | XXXXXXX| $D76E
    .byte $00 ; |        | $D76F
    .byte $00 ; |        | $D770
    .byte $00 ; |        | $D771
    .byte $00 ; |        | $D772
    .byte $00 ; |        | $D773
    .byte $00 ; |        | $D774
    .byte $00 ; |        | $D775
    .byte $00 ; |        | $D776
    .byte $00 ; |        | $D777
    .byte $32 ; |  XX  X | $D778
    .byte $78 ; | XXXX   | $D779
    .byte $41 ; | X     X| $D77A
    .byte $17 ; |   X XXX| $D77B
    .byte $17 ; |   X XXX| $D77C
    .byte $32 ; |  XX  X | $D77D
    .byte $78 ; | XXXX   | $D77E
    .byte $41 ; | X     X| $D77F
    .byte $11 ; |   X   X| $D780
    .byte $11 ; |   X   X| $D781
    .byte $62 ; | XX   X | $D782
    .byte $78 ; | XXXX   | $D783
    .byte $41 ; | X     X| $D784
    .byte $1C ; |   XXX  | $D785
    .byte $1C ; |   XXX  | $D786
    .byte $32 ; |  XX  X | $D787
    .byte $78 ; | XXXX   | $D788
    .byte $41 ; | X     X| $D789
    .byte $17 ; |   X XXX| $D78A
    .byte $17 ; |   X XXX| $D78B
    .byte $32 ; |  XX  X | $D78C
    .byte $78 ; | XXXX   | $D78D
    .byte $41 ; | X     X| $D78E
    .byte $14 ; |   X X  | $D78F
    .byte $14 ; |   X X  | $D790
    .byte $62 ; | XX   X | $D791
    .byte $78 ; | XXXX   | $D792
    .byte $41 ; | X     X| $D793
    .byte $1F ; |   XXXXX| $D794
    .byte $1F ; |   XXXXX| $D795
    .byte $32 ; |  XX  X | $D796
    .byte $78 ; | XXXX   | $D797
    .byte $41 ; | X     X| $D798
    .byte $1A ; |   XX X | $D799
    .byte $1A ; |   XX X | $D79A
    .byte $32 ; |  XX  X | $D79B
    .byte $78 ; | XXXX   | $D79C
    .byte $41 ; | X     X| $D79D
    .byte $17 ; |   X XXX| $D79E
    .byte $17 ; |   X XXX| $D79F
    .byte $62 ; | XX   X | $D7A0
    .byte $78 ; | XXXX   | $D7A1
    .byte $CC ; |XX  XX  | $D7A2
    .byte $0B ; |    X XX| $D7A3
    .byte $0B ; |    X XX| $D7A4
    .byte $00 ; |        | $D7A5
    .byte $00 ; |        | $D7A6
    .byte $00 ; |        | $D7A7
    .byte $00 ; |        | $D7A8
    .byte $00 ; |        | $D7A9
    .byte $23 ; |  X   XX| $D7AA
    .byte $88 ; |X   X   | $D7AB
    .byte $67 ; | XX  XXX| $D7AC
    .byte $1C ; |   XXX  | $D7AD
    .byte $1F ; |   XXXXX| $D7AE
    .byte $FF ; |XXXXXXXX| $D7AF
    .byte $00 ; |        | $D7B0
    .byte $00 ; |        | $D7B1
    .byte $00 ; |        | $D7B2
    .byte $00 ; |        | $D7B3
    .byte $FF ; |XXXXXXXX| $D7B4
    .byte $00 ; |        | $D7B5
    .byte $00 ; |        | $D7B6
    .byte $00 ; |        | $D7B7
    .byte $00 ; |        | $D7B8
    .byte $2F ; |  X XXXX| $D7B9
    .byte $88 ; |X   X   | $D7BA
    .byte $67 ; | XX  XXX| $D7BB
    .byte $1A ; |   XX X | $D7BC
    .byte $1C ; |   XXX  | $D7BD
    .byte $FF ; |XXXXXXXX| $D7BE
    .byte $00 ; |        | $D7BF
    .byte $00 ; |        | $D7C0
    .byte $00 ; |        | $D7C1
    .byte $00 ; |        | $D7C2
    .byte $00 ; |        | $D7C3
    .byte $00 ; |        | $D7C4
    .byte $00 ; |        | $D7C5
    .byte $00 ; |        | $D7C6
    .byte $00 ; |        | $D7C7
    .byte $0F ; |    XXXX| $D7C8
    .byte $6A ; | XX X X | $D7C9
    .byte $74 ; | XXX X  | $D7CA
    .byte $05 ; |     X X| $D7CB
    .byte $05 ; |     X X| $D7CC
    .byte $0F ; |    XXXX| $D7CD
    .byte $6A ; | XX X X | $D7CE
    .byte $74 ; | XXX X  | $D7CF
    .byte $06 ; |     XX | $D7D0
    .byte $06 ; |     XX | $D7D1
    .byte $0F ; |    XXXX| $D7D2
    .byte $6A ; | XX X X | $D7D3
    .byte $74 ; | XXX X  | $D7D4
    .byte $07 ; |     XXX| $D7D5
    .byte $07 ; |     XXX| $D7D6
    .byte $0F ; |    XXXX| $D7D7
    .byte $6A ; | XX X X | $D7D8
    .byte $74 ; | XXX X  | $D7D9
    .byte $08 ; |    X   | $D7DA
    .byte $08 ; |    X   | $D7DB
    .byte $00 ; |        | $D7DC
    .byte $00 ; |        | $D7DD
    .byte $00 ; |        | $D7DE
LD7DF:
    .byte $00 ; |        | $D7DF
    .byte $D6 ; |XX X XX | $D7E0
    .byte $D8 ; |XX XX   | $D7E1
    .byte $D8 ; |XX XX   | $D7E2
    .byte $C8 ; |XX  X   | $D7E3
    .byte $C8 ; |XX  X   | $D7E4
    .byte $CA ; |XX  X X | $D7E5
    .byte $CA ; |XX  X X | $D7E6
    .byte $0A ; |    X X | $D7E7
    .byte $0A ; |    X X | $D7E8
    .byte $D8 ; |XX XX   | $D7E9
    .byte $D8 ; |XX XX   | $D7EA
    .byte $E8 ; |XXX X   | $D7EB
    .byte $0A ; |    X X | $D7EC
    .byte $0A ; |    X X | $D7ED
    .byte $0A ; |    X X | $D7EE
    .byte $0A ; |    X X | $D7EF
    .byte $DC ; |XX XXX  | $D7F0
    .byte $DC ; |XX XXX  | $D7F1
    .byte $0C ; |    XX  | $D7F2
    .byte $0C ; |    XX  | $D7F3
    .byte $0A ; |    X X | $D7F4
    .byte $0A ; |    X X | $D7F5
    .byte $0C ; |    XX  | $D7F6
    .byte $0C ; |    XX  | $D7F7
    .byte $0A ; |    X X | $D7F8
    .byte $0A ; |    X X | $D7F9
    .byte $0A ; |    X X | $D7FA
    .byte $0A ; |    X X | $D7FB
    .byte $0A ; |    X X | $D7FC
    .byte $0A ; |    X X | $D7FD
    .byte $0A ; |    X X | $D7FE
    .byte $0A ; |    X X | $D7FF
LD800:
    .byte $F1 ; |XXXX   X| $D800
    .byte $4E ; | X  XXX | $D801
    .byte $4D ; | X  XX X| $D802
    .byte $4C ; | X  XX  | $D803
    .byte $4B ; | X  X XX| $D804
    .byte $4A ; | X  X X | $D805
    .byte $49 ; | X  X  X| $D806
    .byte $48 ; | X  X   | $D807
    .byte $38 ; |  XXX   | $D808
    .byte $38 ; |  XXX   | $D809
    .byte $38 ; |  XXX   | $D80A
    .byte $38 ; |  XXX   | $D80B
    .byte $38 ; |  XXX   | $D80C
    .byte $38 ; |  XXX   | $D80D
    .byte $38 ; |  XXX   | $D80E
    .byte $39 ; |  XXX  X| $D80F
    .byte $3A ; |  XXX X | $D810
    .byte $3B ; |  XXX XX| $D811
    .byte $3C ; |  XXXX  | $D812
    .byte $3D ; |  XXXX X| $D813
    .byte $3E ; |  XXXXX | $D814
    .byte $3F ; |  XXXXXX| $D815
    .byte $30 ; |  XX    | $D816
    .byte $31 ; |  XX   X| $D817
    .byte $32 ; |  XX  X | $D818
    .byte $33 ; |  XX  XX| $D819
    .byte $34 ; |  XX X  | $D81A
    .byte $25 ; |  X  X X| $D81B
    .byte $26 ; |  X  XX | $D81C
    .byte $17 ; |   X XXX| $D81D
    .byte $17 ; |   X XXX| $D81E
    .byte $07 ; |     XXX| $D81F
LD820:
    .byte $F2 ; |XXXX  X | $D820
    .byte $04 ; |     X  | $D821
    .byte $14 ; |   X X  | $D822
    .byte $14 ; |   X X  | $D823
    .byte $14 ; |   X X  | $D824
    .byte $32 ; |  XX  X | $D825
    .byte $32 ; |  XX  X | $D826
    .byte $34 ; |  XX X  | $D827
    .byte $36 ; |  XX XX | $D828
    .byte $76 ; | XXX XX | $D829
    .byte $77 ; | XXX XXX| $D82A
    .byte $77 ; | XXX XXX| $D82B
    .byte $F7 ; |XXXX XXX| $D82C
    .byte $F7 ; |XXXX XXX| $D82D
    .byte $F7 ; |XXXX XXX| $D82E
    .byte $F7 ; |XXXX XXX| $D82F
LD830:
    .byte $F7 ; |XXXX XXX| $D830
    .byte $00 ; |        | $D831
    .byte $01 ; |       X| $D832
    .byte $01 ; |       X| $D833
    .byte $03 ; |      XX| $D834
    .byte $03 ; |      XX| $D835
    .byte $03 ; |      XX| $D836
    .byte $03 ; |      XX| $D837
    .byte $07 ; |     XXX| $D838
    .byte $07 ; |     XXX| $D839
    .byte $07 ; |     XXX| $D83A
    .byte $07 ; |     XXX| $D83B
    .byte $07 ; |     XXX| $D83C
    .byte $07 ; |     XXX| $D83D
    .byte $07 ; |     XXX| $D83E
    .byte $07 ; |     XXX| $D83F
    .byte $0F ; |    XXXX| $D840
    .byte $0F ; |    XXXX| $D841
    .byte $0F ; |    XXXX| $D842
    .byte $0F ; |    XXXX| $D843
    .byte $0F ; |    XXXX| $D844
    .byte $0F ; |    XXXX| $D845
    .byte $0F ; |    XXXX| $D846
    .byte $0F ; |    XXXX| $D847
    .byte $1F ; |   XXXXX| $D848
    .byte $1F ; |   XXXXX| $D849
    .byte $1F ; |   XXXXX| $D84A
    .byte $1F ; |   XXXXX| $D84B
    .byte $1F ; |   XXXXX| $D84C
    .byte $1F ; |   XXXXX| $D84D
    .byte $1F ; |   XXXXX| $D84E
    .byte $1F ; |   XXXXX| $D84F
    .byte $3F ; |  XXXXXX| $D850
    .byte $3F ; |  XXXXXX| $D851
    .byte $3F ; |  XXXXXX| $D852
    .byte $3F ; |  XXXXXX| $D853
    .byte $3F ; |  XXXXXX| $D854
    .byte $3F ; |  XXXXXX| $D855
    .byte $3F ; |  XXXXXX| $D856
    .byte $7F ; | XXXXXXX| $D857
    .byte $7F ; | XXXXXXX| $D858
    .byte $7F ; | XXXXXXX| $D859
    .byte $7F ; | XXXXXXX| $D85A
    .byte $7F ; | XXXXXXX| $D85B
    .byte $FF ; |XXXXXXXX| $D85C
    .byte $FF ; |XXXXXXXX| $D85D
    .byte $FF ; |XXXXXXXX| $D85E
    .byte $FF ; |XXXXXXXX| $D85F
LD860:
    .byte $FF ; |XXXXXXXX| $D860
    .byte $F0 ; |XXXX    | $D861
    .byte $F0 ; |XXXX    | $D862
    .byte $F0 ; |XXXX    | $D863
    .byte $F0 ; |XXXX    | $D864
    .byte $E0 ; |XXX     | $D865
    .byte $C0 ; |XX      | $D866
    .byte $C0 ; |XX      | $D867
    .byte $80 ; |X       | $D868
    .byte $80 ; |X       | $D869
    .byte $00 ; |        | $D86A
    .byte $00 ; |        | $D86B
    .byte $00 ; |        | $D86C
    .byte $00 ; |        | $D86D
    .byte $00 ; |        | $D86E
    .byte $00 ; |        | $D86F
    .byte $00 ; |        | $D870
    .byte $00 ; |        | $D871
    .byte $00 ; |        | $D872
    .byte $04 ; |     X  | $D873
    .byte $04 ; |     X  | $D874
    .byte $02 ; |      X | $D875
    .byte $02 ; |      X | $D876
    .byte $04 ; |     X  | $D877
    .byte $06 ; |     XX | $D878
    .byte $07 ; |     XXX| $D879
    .byte $07 ; |     XXX| $D87A
    .byte $07 ; |     XXX| $D87B
    .byte $07 ; |     XXX| $D87C
    .byte $07 ; |     XXX| $D87D
    .byte $07 ; |     XXX| $D87E
    .byte $07 ; |     XXX| $D87F
LD880:
    .byte $00 ; |        | $D880
    .byte $FF ; |XXXXXXXX| $D881
    .byte $FD ; |XXXXXX X| $D882
    .byte $FF ; |XXXXXXXX| $D883
    .byte $DF ; |XX XXXXX| $D884
    .byte $FF ; |XXXXXXXX| $D885
    .byte $FF ; |XXXXXXXX| $D886
    .byte $F7 ; |XXXX XXX| $D887
    .byte $FF ; |XXXXXXXX| $D888
    .byte $7F ; | XXXXXXX| $D889
    .byte $7F ; | XXXXXXX| $D88A
    .byte $3E ; |  XXXXX | $D88B
    .byte $3F ; |  XXXXXX| $D88C
    .byte $1F ; |   XXXXX| $D88D
    .byte $0F ; |    XXXX| $D88E
    .byte $0F ; |    XXXX| $D88F
    .byte $07 ; |     XXX| $D890
    .byte $07 ; |     XXX| $D891
    .byte $03 ; |      XX| $D892
    .byte $01 ; |       X| $D893
    .byte $01 ; |       X| $D894
    .byte $00 ; |        | $D895
    .byte $00 ; |        | $D896
    .byte $00 ; |        | $D897
    .byte $00 ; |        | $D898
    .byte $00 ; |        | $D899
    .byte $00 ; |        | $D89A
    .byte $00 ; |        | $D89B
    .byte $00 ; |        | $D89C
    .byte $00 ; |        | $D89D
    .byte $00 ; |        | $D89E
    .byte $00 ; |        | $D89F
LD8A0:
    .byte $00 ; |        | $D8A0
    .byte $FF ; |XXXXXXXX| $D8A1
    .byte $FF ; |XXXXXXXX| $D8A2
    .byte $FF ; |XXXXXXXX| $D8A3
    .byte $FF ; |XXXXXXXX| $D8A4
    .byte $FF ; |XXXXXXXX| $D8A5
    .byte $FF ; |XXXXXXXX| $D8A6
    .byte $FF ; |XXXXXXXX| $D8A7
    .byte $FD ; |XXXXXX X| $D8A8
    .byte $BF ; |X XXXXXX| $D8A9
    .byte $FF ; |XXXXXXXX| $D8AA
    .byte $FF ; |XXXXXXXX| $D8AB
    .byte $FF ; |XXXXXXXX| $D8AC
    .byte $FF ; |XXXXXXXX| $D8AD
    .byte $FF ; |XXXXXXXX| $D8AE
    .byte $FF ; |XXXXXXXX| $D8AF
    .byte $FF ; |XXXXXXXX| $D8B0
    .byte $FF ; |XXXXXXXX| $D8B1
    .byte $FF ; |XXXXXXXX| $D8B2
    .byte $FF ; |XXXXXXXX| $D8B3
    .byte $FF ; |XXXXXXXX| $D8B4
    .byte $FF ; |XXXXXXXX| $D8B5
    .byte $FE ; |XXXXXXX | $D8B6
    .byte $FC ; |XXXXXX  | $D8B7
    .byte $FC ; |XXXXXX  | $D8B8
    .byte $F8 ; |XXXXX   | $D8B9
    .byte $F0 ; |XXXX    | $D8BA
    .byte $F0 ; |XXXX    | $D8BB
    .byte $E0 ; |XXX     | $D8BC
    .byte $E0 ; |XXX     | $D8BD
    .byte $C0 ; |XX      | $D8BE
    .byte $C0 ; |XX      | $D8BF
LD8C0:
    .byte $80 ; |X       | $D8C0
    .byte $00 ; |        | $D8C1
    .byte $80 ; |X       | $D8C2
    .byte $80 ; |X       | $D8C3
    .byte $80 ; |X       | $D8C4
    .byte $80 ; |X       | $D8C5
    .byte $80 ; |X       | $D8C6
    .byte $80 ; |X       | $D8C7
    .byte $80 ; |X       | $D8C8
    .byte $80 ; |X       | $D8C9
    .byte $80 ; |X       | $D8CA
    .byte $FF ; |XXXXXXXX| $D8CB
    .byte $FF ; |XXXXXXXX| $D8CC
    .byte $FF ; |XXXXXXXX| $D8CD
    .byte $DD ; |XX XXX X| $D8CE
    .byte $DD ; |XX XXX X| $D8CF
    .byte $EB ; |XXX X XX| $D8D0
    .byte $EB ; |XXX X XX| $D8D1
    .byte $F7 ; |XXXX XXX| $D8D2
    .byte $EB ; |XXX X XX| $D8D3
    .byte $EB ; |XXX X XX| $D8D4
    .byte $DD ; |XX XXX X| $D8D5
    .byte $DD ; |XX XXX X| $D8D6
    .byte $FF ; |XXXXXXXX| $D8D7
    .byte $FF ; |XXXXXXXX| $D8D8
    .byte $FF ; |XXXXXXXX| $D8D9
    .byte $80 ; |X       | $D8DA
    .byte $80 ; |X       | $D8DB
    .byte $FC ; |XXXXXX  | $D8DC
    .byte $F8 ; |XXXXX   | $D8DD
    .byte $F0 ; |XXXX    | $D8DE
    .byte $E0 ; |XXX     | $D8DF
LD8E0:
    .byte $80 ; |X       | $D8E0
    .byte $D2 ; |XX X  X | $D8E1
    .byte $D2 ; |XX X  X | $D8E2
    .byte $D2 ; |XX X  X | $D8E3
    .byte $D2 ; |XX X  X | $D8E4
    .byte $D2 ; |XX X  X | $D8E5
    .byte $D2 ; |XX X  X | $D8E6
    .byte $D2 ; |XX X  X | $D8E7
    .byte $D2 ; |XX X  X | $D8E8
    .byte $D2 ; |XX X  X | $D8E9
    .byte $D2 ; |XX X  X | $D8EA
    .byte $36 ; |  XX XX | $D8EB
    .byte $36 ; |  XX XX | $D8EC
    .byte $C6 ; |XX   XX | $D8ED
    .byte $C6 ; |XX   XX | $D8EE
    .byte $C6 ; |XX   XX | $D8EF
    .byte $C6 ; |XX   XX | $D8F0
    .byte $C6 ; |XX   XX | $D8F1
    .byte $C6 ; |XX   XX | $D8F2
    .byte $C6 ; |XX   XX | $D8F3
    .byte $C6 ; |XX   XX | $D8F4
    .byte $C6 ; |XX   XX | $D8F5
    .byte $C6 ; |XX   XX | $D8F6
    .byte $C6 ; |XX   XX | $D8F7
    .byte $36 ; |  XX XX | $D8F8
    .byte $36 ; |  XX XX | $D8F9
    .byte $D2 ; |XX X  X | $D8FA
    .byte $D2 ; |XX X  X | $D8FB
    .byte $18 ; |   XX   | $D8FC
    .byte $18 ; |   XX   | $D8FD
    .byte $18 ; |   XX   | $D8FE
    .byte $18 ; |   XX   | $D8FF
    .byte $00 ; |        | $D900
    .byte $00 ; |        | $D901
    .byte $00 ; |        | $D902
    .byte $00 ; |        | $D903
    .byte $00 ; |        | $D904
    .byte $00 ; |        | $D905
    .byte $00 ; |        | $D906
    .byte $00 ; |        | $D907
    .byte $00 ; |        | $D908
    .byte $00 ; |        | $D909
    .byte $00 ; |        | $D90A
    .byte $00 ; |        | $D90B
    .byte $00 ; |        | $D90C
    .byte $00 ; |        | $D90D
    .byte $00 ; |        | $D90E
    .byte $00 ; |        | $D90F
    .byte $00 ; |        | $D910
    .byte $00 ; |        | $D911
    .byte $00 ; |        | $D912
    .byte $00 ; |        | $D913
    .byte $00 ; |        | $D914
    .byte $00 ; |        | $D915
    .byte $00 ; |        | $D916
    .byte $00 ; |        | $D917
    .byte $00 ; |        | $D918
    .byte $00 ; |        | $D919
    .byte $00 ; |        | $D91A
    .byte $00 ; |        | $D91B
    .byte $00 ; |        | $D91C
    .byte $00 ; |        | $D91D
    .byte $00 ; |        | $D91E
    .byte $00 ; |        | $D91F
    .byte $00 ; |        | $D920
    .byte $00 ; |        | $D921
    .byte $00 ; |        | $D922
    .byte $00 ; |        | $D923
    .byte $00 ; |        | $D924
    .byte $00 ; |        | $D925
    .byte $00 ; |        | $D926
    .byte $00 ; |        | $D927
    .byte $84 ; |X    X  | $D928
    .byte $44 ; | X   X  | $D929
    .byte $CE ; |XX  XXX | $D92A
    .byte $4A ; | X  X X | $D92B
    .byte $F8 ; |XXXXX   | $D92C
    .byte $78 ; | XXXX   | $D92D
    .byte $3D ; |  XXXX X| $D92E
    .byte $3F ; |  XXXXXX| $D92F
    .byte $17 ; |   X XXX| $D930
    .byte $3A ; |  XXX X | $D931
    .byte $1E ; |   XXXX | $D932
    .byte $7C ; | XXXXX  | $D933
    .byte $16 ; |   X XX | $D934
    .byte $76 ; | XXX XX | $D935
    .byte $13 ; |   X  XX| $D936
    .byte $F7 ; |XXXX XXX| $D937
    .byte $11 ; |   X   X| $D938
    .byte $77 ; | XXX XXX| $D939
    .byte $21 ; |  X    X| $D93A
    .byte $EF ; |XXX XXXX| $D93B
    .byte $23 ; |  X   XX| $D93C
    .byte $FE ; |XXXXXXX | $D93D
    .byte $66 ; | XX  XX | $D93E
    .byte $DC ; |XX XXX  | $D93F
    .byte $00 ; |        | $D940
    .byte $00 ; |        | $D941
    .byte $00 ; |        | $D942
    .byte $00 ; |        | $D943
    .byte $00 ; |        | $D944
    .byte $00 ; |        | $D945
    .byte $00 ; |        | $D946
    .byte $00 ; |        | $D947
    .byte $00 ; |        | $D948
    .byte $00 ; |        | $D949
    .byte $00 ; |        | $D94A
    .byte $00 ; |        | $D94B
    .byte $00 ; |        | $D94C
    .byte $00 ; |        | $D94D
    .byte $00 ; |        | $D94E
    .byte $00 ; |        | $D94F
    .byte $00 ; |        | $D950
    .byte $00 ; |        | $D951
    .byte $00 ; |        | $D952
    .byte $00 ; |        | $D953
    .byte $00 ; |        | $D954
    .byte $00 ; |        | $D955
    .byte $00 ; |        | $D956
    .byte $00 ; |        | $D957
    .byte $00 ; |        | $D958
    .byte $00 ; |        | $D959
    .byte $00 ; |        | $D95A
    .byte $00 ; |        | $D95B
    .byte $00 ; |        | $D95C
    .byte $00 ; |        | $D95D
    .byte $00 ; |        | $D95E
    .byte $00 ; |        | $D95F
    .byte $00 ; |        | $D960
    .byte $00 ; |        | $D961
    .byte $00 ; |        | $D962
    .byte $00 ; |        | $D963
    .byte $00 ; |        | $D964
    .byte $00 ; |        | $D965
    .byte $00 ; |        | $D966
    .byte $00 ; |        | $D967
    .byte $00 ; |        | $D968
    .byte $00 ; |        | $D969
    .byte $00 ; |        | $D96A
    .byte $00 ; |        | $D96B
    .byte $08 ; |    X   | $D96C
    .byte $0A ; |    X X | $D96D
    .byte $86 ; |X    XX | $D96E
    .byte $48 ; | X  X   | $D96F
    .byte $C8 ; |XX  X   | $D970
    .byte $7D ; | XXXXX X| $D971
    .byte $FF ; |XXXXXXXX| $D972
    .byte $3E ; |  XXXXX | $D973
    .byte $7A ; | XXXX X | $D974
    .byte $9E ; |X  XXXX | $D975
    .byte $7F ; | XXXXXXX| $D976
    .byte $BB ; |X XXX XX| $D977
    .byte $FB ; |XXXXX XX| $D978
    .byte $77 ; | XXX XXX| $D979
    .byte $6E ; | XX XXX | $D97A
    .byte $00 ; |        | $D97B
    .byte $00 ; |        | $D97C
    .byte $00 ; |        | $D97D
    .byte $00 ; |        | $D97E
    .byte $00 ; |        | $D97F
    .byte $00 ; |        | $D980
    .byte $00 ; |        | $D981
    .byte $00 ; |        | $D982
    .byte $00 ; |        | $D983
    .byte $00 ; |        | $D984
    .byte $00 ; |        | $D985
    .byte $00 ; |        | $D986
    .byte $00 ; |        | $D987
    .byte $00 ; |        | $D988
    .byte $00 ; |        | $D989
    .byte $00 ; |        | $D98A
    .byte $00 ; |        | $D98B
    .byte $00 ; |        | $D98C
    .byte $00 ; |        | $D98D
    .byte $00 ; |        | $D98E
    .byte $00 ; |        | $D98F
    .byte $00 ; |        | $D990
    .byte $00 ; |        | $D991
    .byte $00 ; |        | $D992
    .byte $00 ; |        | $D993
    .byte $00 ; |        | $D994
    .byte $00 ; |        | $D995
    .byte $00 ; |        | $D996
    .byte $00 ; |        | $D997
    .byte $00 ; |        | $D998
    .byte $00 ; |        | $D999
    .byte $00 ; |        | $D99A
    .byte $00 ; |        | $D99B
    .byte $00 ; |        | $D99C
    .byte $00 ; |        | $D99D
    .byte $00 ; |        | $D99E
    .byte $00 ; |        | $D99F
    .byte $00 ; |        | $D9A0
    .byte $00 ; |        | $D9A1
    .byte $00 ; |        | $D9A2
    .byte $00 ; |        | $D9A3
    .byte $00 ; |        | $D9A4
    .byte $00 ; |        | $D9A5
    .byte $00 ; |        | $D9A6
    .byte $00 ; |        | $D9A7
    .byte $00 ; |        | $D9A8
    .byte $00 ; |        | $D9A9
    .byte $00 ; |        | $D9AA
    .byte $00 ; |        | $D9AB
    .byte $00 ; |        | $D9AC
    .byte $00 ; |        | $D9AD
    .byte $00 ; |        | $D9AE
LD9AF:
    .byte $00 ; |        | $D9AF
    .byte $F0 ; |XXXX    | $D9B0
    .byte $F1 ; |XXXX   X| $D9B1
    .byte $F1 ; |XXXX   X| $D9B2
    .byte $F1 ; |XXXX   X| $D9B3
    .byte $F0 ; |XXXX    | $D9B4
    .byte $F1 ; |XXXX   X| $D9B5
    .byte $F2 ; |XXXX  X | $D9B6
    .byte $01 ; |       X| $D9B7
    .byte $F1 ; |XXXX   X| $D9B8
    .byte $F1 ; |XXXX   X| $D9B9
    .byte $F1 ; |XXXX   X| $D9BA
    .byte $F0 ; |XXXX    | $D9BB
    .byte $F1 ; |XXXX   X| $D9BC
    .byte $00 ; |        | $D9BD
    .byte $F0 ; |XXXX    | $D9BE
    .byte $01 ; |       X| $D9BF
    .byte $F1 ; |XXXX   X| $D9C0
    .byte $00 ; |        | $D9C1
    .byte $F1 ; |XXXX   X| $D9C2
    .byte $00 ; |        | $D9C3
    .byte $F0 ; |XXXX    | $D9C4
    .byte $01 ; |       X| $D9C5
    .byte $F0 ; |XXXX    | $D9C6
    .byte $F0 ; |XXXX    | $D9C7
    .byte $01 ; |       X| $D9C8
    .byte $F0 ; |XXXX    | $D9C9
    .byte $01 ; |       X| $D9CA
    .byte $F1 ; |XXXX   X| $D9CB
    .byte $00 ; |        | $D9CC
    .byte $F1 ; |XXXX   X| $D9CD
    .byte $00 ; |        | $D9CE
    .byte $F1 ; |XXXX   X| $D9CF
    .byte $00 ; |        | $D9D0
    .byte $F1 ; |XXXX   X| $D9D1
    .byte $00 ; |        | $D9D2
    .byte $F1 ; |XXXX   X| $D9D3
    .byte $01 ; |       X| $D9D4
    .byte $F0 ; |XXXX    | $D9D5
    .byte $01 ; |       X| $D9D6
    .byte $F0 ; |XXXX    | $D9D7
    .byte $01 ; |       X| $D9D8
    .byte $F0 ; |XXXX    | $D9D9
    .byte $F1 ; |XXXX   X| $D9DA
    .byte $01 ; |       X| $D9DB
    .byte $00 ; |        | $D9DC
    .byte $01 ; |       X| $D9DD
    .byte $01 ; |       X| $D9DE
LD9DF:
    .byte $20 ; |  X     | $D9DF
    .byte $F1 ; |XXXX   X| $D9E0
    .byte $E0 ; |XXX     | $D9E1
    .byte $F1 ; |XXXX   X| $D9E2
    .byte $E1 ; |XXX    X| $D9E3
    .byte $E1 ; |XXX    X| $D9E4
    .byte $F2 ; |XXXX  X | $D9E5
    .byte $E1 ; |XXX    X| $D9E6
    .byte $F1 ; |XXXX   X| $D9E7
    .byte $E2 ; |XXX   X | $D9E8
    .byte $F1 ; |XXXX   X| $D9E9
    .byte $F1 ; |XXXX   X| $D9EA
    .byte $01 ; |       X| $D9EB
    .byte $F2 ; |XXXX  X | $D9EC
    .byte $F1 ; |XXXX   X| $D9ED
    .byte $F1 ; |XXXX   X| $D9EE
LD9EF:
    .byte $01 ; |       X| $D9EF
    .byte $F0 ; |XXXX    | $D9F0
    .byte $00 ; |        | $D9F1
    .byte $F1 ; |XXXX   X| $D9F2
    .byte $01 ; |       X| $D9F3
    .byte $F0 ; |XXXX    | $D9F4
    .byte $F1 ; |XXXX   X| $D9F5
    .byte $F1 ; |XXXX   X| $D9F6
    .byte $01 ; |       X| $D9F7
    .byte $F2 ; |XXXX  X | $D9F8
    .byte $F1 ; |XXXX   X| $D9F9
    .byte $F2 ; |XXXX  X | $D9FA
    .byte $F1 ; |XXXX   X| $D9FB
    .byte $F1 ; |XXXX   X| $D9FC
    .byte $F0 ; |XXXX    | $D9FD
    .byte $F1 ; |XXXX   X| $D9FE
    .byte $F1 ; |XXXX   X| $D9FF
    .byte $78 ; | XXXX   | $DA00
    .byte $00 ; |        | $DA01
    .byte $00 ; |        | $DA02
    .byte $00 ; |        | $DA03
    .byte $00 ; |        | $DA04
    .byte $00 ; |        | $DA05
    .byte $00 ; |        | $DA06
    .byte $00 ; |        | $DA07
    .byte $00 ; |        | $DA08
    .byte $00 ; |        | $DA09
    .byte $00 ; |        | $DA0A
    .byte $00 ; |        | $DA0B
    .byte $00 ; |        | $DA0C
    .byte $00 ; |        | $DA0D
    .byte $00 ; |        | $DA0E
    .byte $00 ; |        | $DA0F
    .byte $00 ; |        | $DA10
    .byte $00 ; |        | $DA11
    .byte $00 ; |        | $DA12
    .byte $00 ; |        | $DA13
    .byte $00 ; |        | $DA14
    .byte $00 ; |        | $DA15
    .byte $00 ; |        | $DA16
    .byte $00 ; |        | $DA17
    .byte $00 ; |        | $DA18
    .byte $00 ; |        | $DA19
    .byte $00 ; |        | $DA1A
    .byte $00 ; |        | $DA1B
    .byte $00 ; |        | $DA1C
    .byte $00 ; |        | $DA1D
    .byte $00 ; |        | $DA1E
    .byte $00 ; |        | $DA1F
    .byte $00 ; |        | $DA20
    .byte $00 ; |        | $DA21
    .byte $00 ; |        | $DA22
    .byte $00 ; |        | $DA23
    .byte $00 ; |        | $DA24
    .byte $00 ; |        | $DA25
    .byte $00 ; |        | $DA26
    .byte $00 ; |        | $DA27
    .byte $00 ; |        | $DA28
    .byte $00 ; |        | $DA29
    .byte $00 ; |        | $DA2A
    .byte $42 ; | X    X | $DA2B
    .byte $7E ; | XXXXXX | $DA2C
    .byte $E7 ; |XXX  XXX| $DA2D
    .byte $A5 ; |X X  X X| $DA2E
    .byte $18 ; |   XX   | $DA2F
    .byte $30 ; |  XX    | $DA30
    .byte $38 ; |  XXX   | $DA31
    .byte $70 ; | XXX    | $DA32
    .byte $38 ; |  XXX   | $DA33
    .byte $7F ; | XXXXXXX| $DA34
    .byte $78 ; | XXXX   | $DA35
    .byte $78 ; | XXXX   | $DA36
    .byte $00 ; |        | $DA37
    .byte $00 ; |        | $DA38
    .byte $00 ; |        | $DA39
    .byte $00 ; |        | $DA3A
    .byte $00 ; |        | $DA3B
    .byte $00 ; |        | $DA3C
    .byte $00 ; |        | $DA3D
    .byte $00 ; |        | $DA3E
    .byte $00 ; |        | $DA3F
    .byte $00 ; |        | $DA40
    .byte $00 ; |        | $DA41
    .byte $00 ; |        | $DA42
    .byte $00 ; |        | $DA43
    .byte $00 ; |        | $DA44
    .byte $00 ; |        | $DA45
    .byte $00 ; |        | $DA46
    .byte $00 ; |        | $DA47
    .byte $00 ; |        | $DA48
    .byte $00 ; |        | $DA49
    .byte $00 ; |        | $DA4A
    .byte $00 ; |        | $DA4B
    .byte $00 ; |        | $DA4C
    .byte $00 ; |        | $DA4D
    .byte $00 ; |        | $DA4E
    .byte $00 ; |        | $DA4F
    .byte $00 ; |        | $DA50
    .byte $00 ; |        | $DA51
    .byte $00 ; |        | $DA52
    .byte $00 ; |        | $DA53
    .byte $00 ; |        | $DA54
    .byte $00 ; |        | $DA55
    .byte $00 ; |        | $DA56
    .byte $00 ; |        | $DA57
    .byte $00 ; |        | $DA58
    .byte $00 ; |        | $DA59
    .byte $00 ; |        | $DA5A
    .byte $00 ; |        | $DA5B
    .byte $00 ; |        | $DA5C
    .byte $00 ; |        | $DA5D
    .byte $00 ; |        | $DA5E
    .byte $00 ; |        | $DA5F
    .byte $00 ; |        | $DA60
    .byte $00 ; |        | $DA61
    .byte $00 ; |        | $DA62
    .byte $00 ; |        | $DA63
    .byte $00 ; |        | $DA64
    .byte $00 ; |        | $DA65
    .byte $00 ; |        | $DA66
    .byte $00 ; |        | $DA67
    .byte $00 ; |        | $DA68
    .byte $00 ; |        | $DA69
    .byte $00 ; |        | $DA6A
    .byte $00 ; |        | $DA6B
    .byte $00 ; |        | $DA6C
    .byte $00 ; |        | $DA6D
    .byte $00 ; |        | $DA6E
    .byte $00 ; |        | $DA6F
    .byte $00 ; |        | $DA70
    .byte $00 ; |        | $DA71
    .byte $00 ; |        | $DA72
    .byte $00 ; |        | $DA73
    .byte $00 ; |        | $DA74
    .byte $00 ; |        | $DA75
    .byte $00 ; |        | $DA76
    .byte $00 ; |        | $DA77
    .byte $00 ; |        | $DA78
    .byte $00 ; |        | $DA79
    .byte $00 ; |        | $DA7A
    .byte $00 ; |        | $DA7B
    .byte $00 ; |        | $DA7C
    .byte $00 ; |        | $DA7D
    .byte $00 ; |        | $DA7E
    .byte $00 ; |        | $DA7F
    .byte $00 ; |        | $DA80
    .byte $28 ; |  X X   | $DA81
    .byte $28 ; |  X X   | $DA82
    .byte $28 ; |  X X   | $DA83
    .byte $28 ; |  X X   | $DA84
    .byte $28 ; |  X X   | $DA85
    .byte $28 ; |  X X   | $DA86
    .byte $28 ; |  X X   | $DA87
    .byte $28 ; |  X X   | $DA88
    .byte $28 ; |  X X   | $DA89
    .byte $28 ; |  X X   | $DA8A
    .byte $28 ; |  X X   | $DA8B
    .byte $28 ; |  X X   | $DA8C
    .byte $28 ; |  X X   | $DA8D
    .byte $28 ; |  X X   | $DA8E
    .byte $28 ; |  X X   | $DA8F
    .byte $28 ; |  X X   | $DA90
    .byte $28 ; |  X X   | $DA91
    .byte $28 ; |  X X   | $DA92
    .byte $28 ; |  X X   | $DA93
    .byte $28 ; |  X X   | $DA94
    .byte $28 ; |  X X   | $DA95
    .byte $28 ; |  X X   | $DA96
    .byte $28 ; |  X X   | $DA97
    .byte $28 ; |  X X   | $DA98
    .byte $28 ; |  X X   | $DA99
    .byte $28 ; |  X X   | $DA9A
    .byte $28 ; |  X X   | $DA9B
    .byte $28 ; |  X X   | $DA9C
    .byte $28 ; |  X X   | $DA9D
    .byte $28 ; |  X X   | $DA9E
    .byte $28 ; |  X X   | $DA9F
    .byte $28 ; |  X X   | $DAA0
    .byte $28 ; |  X X   | $DAA1
    .byte $28 ; |  X X   | $DAA2
    .byte $28 ; |  X X   | $DAA3
    .byte $28 ; |  X X   | $DAA4
    .byte $28 ; |  X X   | $DAA5
    .byte $28 ; |  X X   | $DAA6
    .byte $28 ; |  X X   | $DAA7
    .byte $28 ; |  X X   | $DAA8
    .byte $24 ; |  X  X  | $DAA9
    .byte $22 ; |  X   X | $DAAA
    .byte $22 ; |  X   X | $DAAB
    .byte $22 ; |  X   X | $DAAC
    .byte $22 ; |  X   X | $DAAD
    .byte $24 ; |  X  X  | $DAAE
    .byte $24 ; |  X  X  | $DAAF
    .byte $24 ; |  X  X  | $DAB0
    .byte $24 ; |  X  X  | $DAB1
    .byte $24 ; |  X  X  | $DAB2
    .byte $60 ; | XX     | $DAB3
    .byte $44 ; | X   X  | $DAB4
    .byte $40 ; | X      | $DAB5
    .byte $44 ; | X   X  | $DAB6
    .byte $42 ; | X    X | $DAB7
    .byte $44 ; | X   X  | $DAB8
    .byte $46 ; | X   XX | $DAB9
    .byte $20 ; |  X     | $DABA
    .byte $20 ; |  X     | $DABB
    .byte $20 ; |  X     | $DABC
    .byte $3C ; |  XXXX  | $DABD
    .byte $3A ; |  XXX X | $DABE
    .byte $38 ; |  XXX   | $DABF
    .byte $36 ; |  XX XX | $DAC0
    .byte $34 ; |  XX X  | $DAC1
    .byte $D2 ; |XX X  X | $DAC2
    .byte $D4 ; |XX X X  | $DAC3
    .byte $D4 ; |XX X X  | $DAC4
    .byte $D2 ; |XX X  X | $DAC5
    .byte $C6 ; |XX   XX | $DAC6
    .byte $C6 ; |XX   XX | $DAC7
    .byte $C6 ; |XX   XX | $DAC8
    .byte $C6 ; |XX   XX | $DAC9
    .byte $C6 ; |XX   XX | $DACA
    .byte $C6 ; |XX   XX | $DACB
    .byte $C6 ; |XX   XX | $DACC
    .byte $C6 ; |XX   XX | $DACD
    .byte $C6 ; |XX   XX | $DACE
    .byte $C6 ; |XX   XX | $DACF
    .byte $C6 ; |XX   XX | $DAD0
    .byte $C6 ; |XX   XX | $DAD1
    .byte $C6 ; |XX   XX | $DAD2
    .byte $C6 ; |XX   XX | $DAD3
    .byte $C6 ; |XX   XX | $DAD4
    .byte $C6 ; |XX   XX | $DAD5
    .byte $C6 ; |XX   XX | $DAD6
    .byte $C6 ; |XX   XX | $DAD7
LDAD8:
    .byte $98 ; |X  XX   | $DAD8
    .byte $28 ; |  X X   | $DAD9
    .byte $28 ; |  X X   | $DADA
    .byte $28 ; |  X X   | $DADB
    .byte $28 ; |  X X   | $DADC
    .byte $28 ; |  X X   | $DADD
    .byte $28 ; |  X X   | $DADE
    .byte $28 ; |  X X   | $DADF
    .byte $28 ; |  X X   | $DAE0
    .byte $28 ; |  X X   | $DAE1
    .byte $28 ; |  X X   | $DAE2
    .byte $28 ; |  X X   | $DAE3
    .byte $28 ; |  X X   | $DAE4
    .byte $28 ; |  X X   | $DAE5
    .byte $28 ; |  X X   | $DAE6
    .byte $28 ; |  X X   | $DAE7
    .byte $28 ; |  X X   | $DAE8
    .byte $28 ; |  X X   | $DAE9
    .byte $28 ; |  X X   | $DAEA
    .byte $28 ; |  X X   | $DAEB
    .byte $28 ; |  X X   | $DAEC
    .byte $28 ; |  X X   | $DAED
    .byte $28 ; |  X X   | $DAEE
    .byte $28 ; |  X X   | $DAEF
    .byte $18 ; |   XX   | $DAF0
    .byte $18 ; |   XX   | $DAF1
    .byte $18 ; |   XX   | $DAF2
    .byte $04 ; |     X  | $DAF3
    .byte $04 ; |     X  | $DAF4
    .byte $04 ; |     X  | $DAF5
    .byte $04 ; |     X  | $DAF6
    .byte $04 ; |     X  | $DAF7
    .byte $06 ; |     XX | $DAF8
    .byte $06 ; |     XX | $DAF9
    .byte $06 ; |     XX | $DAFA
    .byte $06 ; |     XX | $DAFB
    .byte $04 ; |     X  | $DAFC
    .byte $04 ; |     X  | $DAFD
    .byte $04 ; |     X  | $DAFE
    .byte $04 ; |     X  | $DAFF
    .byte $D2 ; |XX X  X | $DB00
    .byte $00 ; |        | $DB01
    .byte $00 ; |        | $DB02
    .byte $00 ; |        | $DB03
    .byte $00 ; |        | $DB04
    .byte $00 ; |        | $DB05
    .byte $00 ; |        | $DB06
    .byte $00 ; |        | $DB07
    .byte $00 ; |        | $DB08
    .byte $00 ; |        | $DB09
    .byte $00 ; |        | $DB0A
    .byte $00 ; |        | $DB0B
    .byte $00 ; |        | $DB0C
    .byte $00 ; |        | $DB0D
    .byte $00 ; |        | $DB0E
    .byte $00 ; |        | $DB0F
    .byte $00 ; |        | $DB10
    .byte $00 ; |        | $DB11
    .byte $00 ; |        | $DB12
    .byte $00 ; |        | $DB13
    .byte $00 ; |        | $DB14
    .byte $00 ; |        | $DB15
    .byte $00 ; |        | $DB16
    .byte $00 ; |        | $DB17
    .byte $00 ; |        | $DB18
    .byte $00 ; |        | $DB19
    .byte $00 ; |        | $DB1A
    .byte $00 ; |        | $DB1B
    .byte $00 ; |        | $DB1C
    .byte $00 ; |        | $DB1D
    .byte $00 ; |        | $DB1E
    .byte $00 ; |        | $DB1F
    .byte $00 ; |        | $DB20
    .byte $00 ; |        | $DB21
    .byte $00 ; |        | $DB22
    .byte $00 ; |        | $DB23
    .byte $00 ; |        | $DB24
    .byte $00 ; |        | $DB25
    .byte $00 ; |        | $DB26
    .byte $00 ; |        | $DB27
    .byte $00 ; |        | $DB28
    .byte $26 ; |  X  XX | $DB29
    .byte $67 ; | XX  XXX| $DB2A
    .byte $C1 ; |XX     X| $DB2B
    .byte $84 ; |X    X  | $DB2C
    .byte $26 ; |  X  XX | $DB2D
    .byte $76 ; | XXX XX | $DB2E
    .byte $36 ; |  XX XX | $DB2F
    .byte $1E ; |   XXXX | $DB30
    .byte $1C ; |   XXX  | $DB31
    .byte $1C ; |   XXX  | $DB32
    .byte $38 ; |  XXX   | $DB33
    .byte $38 ; |  XXX   | $DB34
    .byte $38 ; |  XXX   | $DB35
    .byte $38 ; |  XXX   | $DB36
    .byte $A2 ; |X X   X | $DB37
    .byte $D8 ; |XX XX   | $DB38
    .byte $D8 ; |XX XX   | $DB39
    .byte $F8 ; |XXXXX   | $DB3A
    .byte $60 ; | XX     | $DB3B
    .byte $0C ; |    XX  | $DB3C
    .byte $18 ; |   XX   | $DB3D
    .byte $1C ; |   XXX  | $DB3E
    .byte $38 ; |  XXX   | $DB3F
    .byte $1C ; |   XXX  | $DB40
    .byte $3F ; |  XXXXXX| $DB41
    .byte $1C ; |   XXX  | $DB42
    .byte $1C ; |   XXX  | $DB43
    .byte $00 ; |        | $DB44
    .byte $00 ; |        | $DB45
    .byte $00 ; |        | $DB46
    .byte $00 ; |        | $DB47
    .byte $00 ; |        | $DB48
    .byte $00 ; |        | $DB49
    .byte $00 ; |        | $DB4A
    .byte $00 ; |        | $DB4B
    .byte $00 ; |        | $DB4C
    .byte $00 ; |        | $DB4D
    .byte $00 ; |        | $DB4E
    .byte $00 ; |        | $DB4F
    .byte $00 ; |        | $DB50
    .byte $00 ; |        | $DB51
    .byte $00 ; |        | $DB52
    .byte $00 ; |        | $DB53
    .byte $00 ; |        | $DB54
    .byte $00 ; |        | $DB55
    .byte $00 ; |        | $DB56
    .byte $00 ; |        | $DB57
    .byte $00 ; |        | $DB58
    .byte $00 ; |        | $DB59
    .byte $00 ; |        | $DB5A
    .byte $00 ; |        | $DB5B
    .byte $00 ; |        | $DB5C
    .byte $00 ; |        | $DB5D
    .byte $00 ; |        | $DB5E
    .byte $00 ; |        | $DB5F
    .byte $00 ; |        | $DB60
    .byte $00 ; |        | $DB61
    .byte $00 ; |        | $DB62
    .byte $00 ; |        | $DB63
    .byte $00 ; |        | $DB64
    .byte $00 ; |        | $DB65
    .byte $00 ; |        | $DB66
    .byte $00 ; |        | $DB67
    .byte $00 ; |        | $DB68
    .byte $00 ; |        | $DB69
    .byte $00 ; |        | $DB6A
    .byte $00 ; |        | $DB6B
    .byte $02 ; |      X | $DB6C
    .byte $02 ; |      X | $DB6D
    .byte $02 ; |      X | $DB6E
    .byte $02 ; |      X | $DB6F
    .byte $02 ; |      X | $DB70
    .byte $02 ; |      X | $DB71
    .byte $02 ; |      X | $DB72
    .byte $02 ; |      X | $DB73
    .byte $02 ; |      X | $DB74
    .byte $02 ; |      X | $DB75
    .byte $02 ; |      X | $DB76
    .byte $02 ; |      X | $DB77
    .byte $02 ; |      X | $DB78
    .byte $02 ; |      X | $DB79
    .byte $02 ; |      X | $DB7A
    .byte $02 ; |      X | $DB7B
    .byte $02 ; |      X | $DB7C
    .byte $02 ; |      X | $DB7D
    .byte $02 ; |      X | $DB7E
    .byte $02 ; |      X | $DB7F
    .byte $02 ; |      X | $DB80
    .byte $02 ; |      X | $DB81
    .byte $02 ; |      X | $DB82
    .byte $02 ; |      X | $DB83
    .byte $02 ; |      X | $DB84
    .byte $12 ; |   X  X | $DB85
    .byte $12 ; |   X  X | $DB86
    .byte $12 ; |   X  X | $DB87
    .byte $00 ; |        | $DB88
    .byte $00 ; |        | $DB89
    .byte $00 ; |        | $DB8A
    .byte $00 ; |        | $DB8B
    .byte $00 ; |        | $DB8C
    .byte $00 ; |        | $DB8D
    .byte $00 ; |        | $DB8E
    .byte $00 ; |        | $DB8F
    .byte $00 ; |        | $DB90
    .byte $00 ; |        | $DB91
    .byte $00 ; |        | $DB92
    .byte $00 ; |        | $DB93
    .byte $00 ; |        | $DB94
    .byte $00 ; |        | $DB95
    .byte $00 ; |        | $DB96
    .byte $00 ; |        | $DB97
    .byte $00 ; |        | $DB98
    .byte $00 ; |        | $DB99
    .byte $00 ; |        | $DB9A
    .byte $00 ; |        | $DB9B
    .byte $00 ; |        | $DB9C
    .byte $00 ; |        | $DB9D
    .byte $00 ; |        | $DB9E
    .byte $00 ; |        | $DB9F
    .byte $00 ; |        | $DBA0
    .byte $00 ; |        | $DBA1
    .byte $00 ; |        | $DBA2
    .byte $00 ; |        | $DBA3
    .byte $00 ; |        | $DBA4
    .byte $00 ; |        | $DBA5
    .byte $00 ; |        | $DBA6
    .byte $00 ; |        | $DBA7
LDBA8:
    .byte $00 ; |        | $DBA8
    .byte $00 ; |        | $DBA9
    .byte $02 ; |      X | $DBAA
    .byte $06 ; |     XX | $DBAB
    .byte $0A ; |    X X | $DBAC
    .byte $16 ; |   X XX | $DBAD
    .byte $3E ; |  XXXXX | $DBAE
    .byte $5A ; | X XX X | $DBAF
    .byte $FC ; |XXXXXX  | $DBB0
    .byte $DE ; |XX XXXX | $DBB1
    .byte $BC ; |X XXXX  | $DBB2
    .byte $FE ; |XXXXXXX | $DBB3
    .byte $7C ; | XXXXX  | $DBB4
    .byte $F8 ; |XXXXX   | $DBB5
    .byte $70 ; | XXX    | $DBB6
    .byte $E0 ; |XXX     | $DBB7
    .byte $E0 ; |XXX     | $DBB8
    .byte $C0 ; |XX      | $DBB9
    .byte $80 ; |X       | $DBBA
    .byte $00 ; |        | $DBBB
    .byte $00 ; |        | $DBBC
    .byte $00 ; |        | $DBBD
    .byte $00 ; |        | $DBBE
    .byte $00 ; |        | $DBBF
LDBC0:
    .byte $00 ; |        | $DBC0
    .byte $00 ; |        | $DBC1
    .byte $00 ; |        | $DBC2
    .byte $00 ; |        | $DBC3
    .byte $00 ; |        | $DBC4
    .byte $00 ; |        | $DBC5
    .byte $00 ; |        | $DBC6
    .byte $00 ; |        | $DBC7
    .byte $00 ; |        | $DBC8
    .byte $A0 ; |X X     | $DBC9
    .byte $40 ; | X      | $DBCA
    .byte $A0 ; |X X     | $DBCB
    .byte $40 ; | X      | $DBCC
    .byte $00 ; |        | $DBCD
    .byte $A0 ; |X X     | $DBCE
    .byte $40 ; | X      | $DBCF
    .byte $A0 ; |X X     | $DBD0
    .byte $40 ; | X      | $DBD1
    .byte $A0 ; |X X     | $DBD2
    .byte $00 ; |        | $DBD3
    .byte $40 ; | X      | $DBD4
    .byte $A0 ; |X X     | $DBD5
    .byte $40 ; | X      | $DBD6
    .byte $A0 ; |X X     | $DBD7
    .byte $40 ; | X      | $DBD8
    .byte $00 ; |        | $DBD9
    .byte $A0 ; |X X     | $DBDA
    .byte $40 ; | X      | $DBDB
    .byte $A0 ; |X X     | $DBDC
    .byte $40 ; | X      | $DBDD
    .byte $A0 ; |X X     | $DBDE
    .byte $00 ; |        | $DBDF
LDBE0:
    .byte $FF ; |XXXXXXXX| $DBE0
    .byte $00 ; |        | $DBE1
    .byte $80 ; |X       | $DBE2
    .byte $80 ; |X       | $DBE3
    .byte $80 ; |X       | $DBE4
    .byte $C0 ; |XX      | $DBE5
    .byte $C0 ; |XX      | $DBE6
    .byte $C0 ; |XX      | $DBE7
    .byte $E0 ; |XXX     | $DBE8
    .byte $E0 ; |XXX     | $DBE9
    .byte $E0 ; |XXX     | $DBEA
    .byte $E0 ; |XXX     | $DBEB
    .byte $F0 ; |XXXX    | $DBEC
    .byte $F0 ; |XXXX    | $DBED
    .byte $F0 ; |XXXX    | $DBEE
    .byte $F0 ; |XXXX    | $DBEF
    .byte $F8 ; |XXXXX   | $DBF0
    .byte $F8 ; |XXXXX   | $DBF1
    .byte $F8 ; |XXXXX   | $DBF2
    .byte $F8 ; |XXXXX   | $DBF3
    .byte $F8 ; |XXXXX   | $DBF4
    .byte $FC ; |XXXXXX  | $DBF5
    .byte $FC ; |XXXXXX  | $DBF6
    .byte $FC ; |XXXXXX  | $DBF7
    .byte $FC ; |XXXXXX  | $DBF8
    .byte $FC ; |XXXXXX  | $DBF9
    .byte $FC ; |XXXXXX  | $DBFA
    .byte $FE ; |XXXXXXX | $DBFB
    .byte $FE ; |XXXXXXX | $DBFC
    .byte $FE ; |XXXXXXX | $DBFD
    .byte $FF ; |XXXXXXXX| $DBFE
    .byte $FF ; |XXXXXXXX| $DBFF
    .byte $FF ; |XXXXXXXX| $DC00
    .byte $00 ; |        | $DC01
    .byte $00 ; |        | $DC02
    .byte $00 ; |        | $DC03
    .byte $00 ; |        | $DC04
    .byte $00 ; |        | $DC05
    .byte $00 ; |        | $DC06
    .byte $00 ; |        | $DC07
    .byte $00 ; |        | $DC08
    .byte $00 ; |        | $DC09
    .byte $00 ; |        | $DC0A
    .byte $00 ; |        | $DC0B
    .byte $00 ; |        | $DC0C
    .byte $00 ; |        | $DC0D
    .byte $00 ; |        | $DC0E
    .byte $00 ; |        | $DC0F
    .byte $00 ; |        | $DC10
    .byte $00 ; |        | $DC11
    .byte $00 ; |        | $DC12
    .byte $00 ; |        | $DC13
    .byte $00 ; |        | $DC14
    .byte $00 ; |        | $DC15
    .byte $00 ; |        | $DC16
    .byte $00 ; |        | $DC17
    .byte $00 ; |        | $DC18
    .byte $00 ; |        | $DC19
    .byte $00 ; |        | $DC1A
    .byte $00 ; |        | $DC1B
    .byte $00 ; |        | $DC1C
    .byte $00 ; |        | $DC1D
    .byte $00 ; |        | $DC1E
    .byte $00 ; |        | $DC1F
    .byte $00 ; |        | $DC20
    .byte $00 ; |        | $DC21
    .byte $00 ; |        | $DC22
    .byte $00 ; |        | $DC23
    .byte $00 ; |        | $DC24
    .byte $00 ; |        | $DC25
    .byte $00 ; |        | $DC26
    .byte $00 ; |        | $DC27
    .byte $00 ; |        | $DC28
    .byte $0E ; |    XXX | $DC29
    .byte $0E ; |    XXX | $DC2A
    .byte $8C ; |X   XX  | $DC2B
    .byte $C0 ; |XX      | $DC2C
    .byte $D0 ; |XX X    | $DC2D
    .byte $D8 ; |XX XX   | $DC2E
    .byte $1C ; |   XXX  | $DC2F
    .byte $0C ; |    XX  | $DC30
    .byte $0C ; |    XX  | $DC31
    .byte $0C ; |    XX  | $DC32
    .byte $1C ; |   XXX  | $DC33
    .byte $1C ; |   XXX  | $DC34
    .byte $18 ; |   XX   | $DC35
    .byte $22 ; |  X   X | $DC36
    .byte $28 ; |  X X   | $DC37
    .byte $D8 ; |XX XX   | $DC38
    .byte $D8 ; |XX XX   | $DC39
    .byte $F8 ; |XXXXX   | $DC3A
    .byte $F0 ; |XXXX    | $DC3B
    .byte $A0 ; |X X     | $DC3C
    .byte $0C ; |    XX  | $DC3D
    .byte $18 ; |   XX   | $DC3E
    .byte $1C ; |   XXX  | $DC3F
    .byte $38 ; |  XXX   | $DC40
    .byte $1C ; |   XXX  | $DC41
    .byte $3F ; |  XXXXXX| $DC42
    .byte $1C ; |   XXX  | $DC43
    .byte $1C ; |   XXX  | $DC44
    .byte $00 ; |        | $DC45
    .byte $00 ; |        | $DC46
    .byte $00 ; |        | $DC47
    .byte $00 ; |        | $DC48
    .byte $00 ; |        | $DC49
    .byte $00 ; |        | $DC4A
    .byte $00 ; |        | $DC4B
    .byte $00 ; |        | $DC4C
    .byte $00 ; |        | $DC4D
    .byte $00 ; |        | $DC4E
    .byte $00 ; |        | $DC4F
    .byte $00 ; |        | $DC50
    .byte $00 ; |        | $DC51
    .byte $00 ; |        | $DC52
    .byte $00 ; |        | $DC53
    .byte $00 ; |        | $DC54
    .byte $00 ; |        | $DC55
    .byte $00 ; |        | $DC56
    .byte $00 ; |        | $DC57
    .byte $00 ; |        | $DC58
    .byte $00 ; |        | $DC59
    .byte $00 ; |        | $DC5A
    .byte $00 ; |        | $DC5B
    .byte $00 ; |        | $DC5C
    .byte $00 ; |        | $DC5D
    .byte $00 ; |        | $DC5E
    .byte $00 ; |        | $DC5F
    .byte $00 ; |        | $DC60
    .byte $00 ; |        | $DC61
    .byte $00 ; |        | $DC62
    .byte $00 ; |        | $DC63
    .byte $00 ; |        | $DC64
    .byte $00 ; |        | $DC65
    .byte $00 ; |        | $DC66
    .byte $00 ; |        | $DC67
    .byte $00 ; |        | $DC68
    .byte $00 ; |        | $DC69
    .byte $00 ; |        | $DC6A
    .byte $00 ; |        | $DC6B
    .byte $18 ; |   XX   | $DC6C
    .byte $3C ; |  XXXX  | $DC6D
    .byte $3E ; |  XXXXX | $DC6E
    .byte $7E ; | XXXXXX | $DC6F
    .byte $FE ; |XXXXXXX | $DC70
    .byte $FF ; |XXXXXXXX| $DC71
    .byte $7F ; | XXXXXXX| $DC72
    .byte $FF ; |XXXXXXXX| $DC73
    .byte $FB ; |XXXXX XX| $DC74
    .byte $DD ; |XX XXX X| $DC75
    .byte $FF ; |XXXXXXXX| $DC76
    .byte $7E ; | XXXXXX | $DC77
    .byte $FE ; |XXXXXXX | $DC78
    .byte $7E ; | XXXXXX | $DC79
    .byte $3E ; |  XXXXX | $DC7A
    .byte $3C ; |  XXXX  | $DC7B
    .byte $1C ; |   XXX  | $DC7C
    .byte $18 ; |   XX   | $DC7D
    .byte $00 ; |        | $DC7E
    .byte $00 ; |        | $DC7F
    .byte $00 ; |        | $DC80
    .byte $00 ; |        | $DC81
    .byte $00 ; |        | $DC82
    .byte $00 ; |        | $DC83
    .byte $00 ; |        | $DC84
    .byte $00 ; |        | $DC85
    .byte $00 ; |        | $DC86
    .byte $00 ; |        | $DC87
    .byte $00 ; |        | $DC88
    .byte $00 ; |        | $DC89
    .byte $00 ; |        | $DC8A
    .byte $00 ; |        | $DC8B
    .byte $00 ; |        | $DC8C
    .byte $00 ; |        | $DC8D
    .byte $00 ; |        | $DC8E
    .byte $00 ; |        | $DC8F
    .byte $00 ; |        | $DC90
    .byte $00 ; |        | $DC91
    .byte $00 ; |        | $DC92
    .byte $00 ; |        | $DC93
    .byte $00 ; |        | $DC94
    .byte $00 ; |        | $DC95
    .byte $00 ; |        | $DC96
    .byte $00 ; |        | $DC97
    .byte $00 ; |        | $DC98
    .byte $00 ; |        | $DC99
    .byte $00 ; |        | $DC9A
    .byte $00 ; |        | $DC9B
    .byte $00 ; |        | $DC9C
    .byte $00 ; |        | $DC9D
    .byte $00 ; |        | $DC9E
    .byte $00 ; |        | $DC9F
    .byte $00 ; |        | $DCA0
    .byte $00 ; |        | $DCA1
    .byte $00 ; |        | $DCA2
    .byte $00 ; |        | $DCA3
    .byte $00 ; |        | $DCA4
    .byte $00 ; |        | $DCA5
    .byte $00 ; |        | $DCA6
    .byte $00 ; |        | $DCA7
LDCA8:
    .byte $CA ; |XX  X X | $DCA8
    .byte $01 ; |       X| $DCA9
    .byte $00 ; |        | $DCAA
    .byte $E0 ; |XXX     | $DCAB
    .byte $00 ; |        | $DCAC
    .byte $00 ; |        | $DCAD
    .byte $E0 ; |XXX     | $DCAE
    .byte $00 ; |        | $DCAF
    .byte $00 ; |        | $DCB0
    .byte $E0 ; |XXX     | $DCB1
    .byte $00 ; |        | $DCB2
    .byte $00 ; |        | $DCB3
    .byte $E0 ; |XXX     | $DCB4
    .byte $00 ; |        | $DCB5
    .byte $00 ; |        | $DCB6
    .byte $00 ; |        | $DCB7
    .byte $70 ; | XXX    | $DCB8
    .byte $70 ; | XXX    | $DCB9
    .byte $70 ; | XXX    | $DCBA
    .byte $70 ; | XXX    | $DCBB
    .byte $70 ; | XXX    | $DCBC
    .byte $70 ; | XXX    | $DCBD
    .byte $70 ; | XXX    | $DCBE
    .byte $40 ; | X      | $DCBF
    .byte $40 ; | X      | $DCC0
    .byte $40 ; | X      | $DCC1
    .byte $40 ; | X      | $DCC2
    .byte $40 ; | X      | $DCC3
    .byte $40 ; | X      | $DCC4
LDCC5:
    .byte $40 ; | X      | $DCC5
    .byte $70 ; | XXX    | $DCC6
    .byte $70 ; | XXX    | $DCC7
    .byte $70 ; | XXX    | $DCC8
    .byte $70 ; | XXX    | $DCC9
    .byte $70 ; | XXX    | $DCCA
    .byte $70 ; | XXX    | $DCCB
    .byte $70 ; | XXX    | $DCCC
    .byte $10 ; |   X    | $DCCD
    .byte $10 ; |   X    | $DCCE
    .byte $10 ; |   X    | $DCCF
    .byte $10 ; |   X    | $DCD0
    .byte $10 ; |   X    | $DCD1
    .byte $10 ; |   X    | $DCD2
    .byte $10 ; |   X    | $DCD3
    .byte $10 ; |   X    | $DCD4
    .byte $C0 ; |XX      | $DCD5
    .byte $C0 ; |XX      | $DCD6
    .byte $00 ; |        | $DCD7
    .byte $C0 ; |XX      | $DCD8
    .byte $C0 ; |XX      | $DCD9
    .byte $C0 ; |XX      | $DCDA
    .byte $C0 ; |XX      | $DCDB
    .byte $C0 ; |XX      | $DCDC
    .byte $C0 ; |XX      | $DCDD
    .byte $C0 ; |XX      | $DCDE
    .byte $C0 ; |XX      | $DCDF
    .byte $C0 ; |XX      | $DCE0
    .byte $C0 ; |XX      | $DCE1
LDCE2:
    .byte $C0 ; |XX      | $DCE2
    .byte $C0 ; |XX      | $DCE3
    .byte $C0 ; |XX      | $DCE4
    .byte $C0 ; |XX      | $DCE5
    .byte $C0 ; |XX      | $DCE6
    .byte $C0 ; |XX      | $DCE7
    .byte $C0 ; |XX      | $DCE8
    .byte $C0 ; |XX      | $DCE9
    .byte $C0 ; |XX      | $DCEA
    .byte $C0 ; |XX      | $DCEB
    .byte $C0 ; |XX      | $DCEC
    .byte $C0 ; |XX      | $DCED
    .byte $C0 ; |XX      | $DCEE
    .byte $C0 ; |XX      | $DCEF
    .byte $E0 ; |XXX     | $DCF0
    .byte $E0 ; |XXX     | $DCF1
    .byte $E0 ; |XXX     | $DCF2
    .byte $E0 ; |XXX     | $DCF3
    .byte $E0 ; |XXX     | $DCF4
    .byte $E0 ; |XXX     | $DCF5
    .byte $E0 ; |XXX     | $DCF6
    .byte $E0 ; |XXX     | $DCF7
    .byte $E0 ; |XXX     | $DCF8
    .byte $E0 ; |XXX     | $DCF9
    .byte $E0 ; |XXX     | $DCFA
    .byte $E0 ; |XXX     | $DCFB
    .byte $E0 ; |XXX     | $DCFC
    .byte $E0 ; |XXX     | $DCFD
    .byte $E0 ; |XXX     | $DCFE
    .byte $E0 ; |XXX     | $DCFF
    .byte $00 ; |        | $DD00
    .byte $00 ; |        | $DD01
    .byte $00 ; |        | $DD02
    .byte $00 ; |        | $DD03
    .byte $00 ; |        | $DD04
    .byte $00 ; |        | $DD05
    .byte $00 ; |        | $DD06
    .byte $00 ; |        | $DD07
    .byte $00 ; |        | $DD08
    .byte $00 ; |        | $DD09
    .byte $00 ; |        | $DD0A
    .byte $00 ; |        | $DD0B
    .byte $00 ; |        | $DD0C
    .byte $00 ; |        | $DD0D
    .byte $00 ; |        | $DD0E
    .byte $00 ; |        | $DD0F
    .byte $00 ; |        | $DD10
    .byte $00 ; |        | $DD11
    .byte $00 ; |        | $DD12
    .byte $00 ; |        | $DD13
    .byte $00 ; |        | $DD14
    .byte $00 ; |        | $DD15
    .byte $00 ; |        | $DD16
    .byte $00 ; |        | $DD17
    .byte $00 ; |        | $DD18
    .byte $00 ; |        | $DD19
    .byte $00 ; |        | $DD1A
    .byte $00 ; |        | $DD1B
    .byte $00 ; |        | $DD1C
    .byte $00 ; |        | $DD1D
    .byte $00 ; |        | $DD1E
    .byte $00 ; |        | $DD1F
    .byte $00 ; |        | $DD20
    .byte $00 ; |        | $DD21
    .byte $00 ; |        | $DD22
    .byte $00 ; |        | $DD23
    .byte $00 ; |        | $DD24
    .byte $00 ; |        | $DD25
    .byte $00 ; |        | $DD26
    .byte $00 ; |        | $DD27
    .byte $00 ; |        | $DD28
    .byte $0C ; |    XX  | $DD29
    .byte $6E ; | XX XXX | $DD2A
    .byte $EE ; |XXX XXX | $DD2B
    .byte $EE ; |XXX XXX | $DD2C
    .byte $EE ; |XXX XXX | $DD2D
    .byte $C6 ; |XX   XX | $DD2E
    .byte $EE ; |XXX XXX | $DD2F
    .byte $FF ; |XXXXXXXX| $DD30
    .byte $FF ; |XXXXXXXX| $DD31
    .byte $FF ; |XXXXXXXX| $DD32
    .byte $F8 ; |XXXXX   | $DD33
    .byte $FF ; |XXXXXXXX| $DD34
    .byte $FF ; |XXXXXXXX| $DD35
    .byte $FF ; |XXXXXXXX| $DD36
    .byte $FA ; |XXXXX X | $DD37
    .byte $7F ; | XXXXXXX| $DD38
    .byte $3F ; |  XXXXXX| $DD39
    .byte $0F ; |    XXXX| $DD3A
    .byte $09 ; |    X  X| $DD3B
    .byte $00 ; |        | $DD3C
    .byte $00 ; |        | $DD3D
    .byte $00 ; |        | $DD3E
    .byte $00 ; |        | $DD3F
    .byte $00 ; |        | $DD40
    .byte $00 ; |        | $DD41
    .byte $00 ; |        | $DD42
    .byte $00 ; |        | $DD43
    .byte $00 ; |        | $DD44
    .byte $00 ; |        | $DD45
    .byte $00 ; |        | $DD46
    .byte $00 ; |        | $DD47
    .byte $00 ; |        | $DD48
    .byte $00 ; |        | $DD49
    .byte $00 ; |        | $DD4A
    .byte $00 ; |        | $DD4B
    .byte $00 ; |        | $DD4C
    .byte $00 ; |        | $DD4D
    .byte $00 ; |        | $DD4E
    .byte $00 ; |        | $DD4F
    .byte $00 ; |        | $DD50
    .byte $00 ; |        | $DD51
    .byte $00 ; |        | $DD52
    .byte $00 ; |        | $DD53
    .byte $00 ; |        | $DD54
    .byte $00 ; |        | $DD55
    .byte $00 ; |        | $DD56
    .byte $00 ; |        | $DD57
    .byte $00 ; |        | $DD58
    .byte $00 ; |        | $DD59
    .byte $00 ; |        | $DD5A
    .byte $00 ; |        | $DD5B
    .byte $00 ; |        | $DD5C
    .byte $00 ; |        | $DD5D
    .byte $00 ; |        | $DD5E
    .byte $00 ; |        | $DD5F
    .byte $00 ; |        | $DD60
    .byte $00 ; |        | $DD61
    .byte $00 ; |        | $DD62
    .byte $00 ; |        | $DD63
    .byte $00 ; |        | $DD64
    .byte $00 ; |        | $DD65
    .byte $00 ; |        | $DD66
    .byte $00 ; |        | $DD67
    .byte $00 ; |        | $DD68
    .byte $00 ; |        | $DD69
    .byte $00 ; |        | $DD6A
    .byte $00 ; |        | $DD6B
    .byte $00 ; |        | $DD6C
    .byte $00 ; |        | $DD6D
    .byte $C3 ; |XX    XX| $DD6E
    .byte $E7 ; |XXX  XXX| $DD6F
    .byte $E7 ; |XXX  XXX| $DD70
    .byte $E7 ; |XXX  XXX| $DD71
    .byte $EE ; |XXX XXX | $DD72
    .byte $FE ; |XXXXXXX | $DD73
    .byte $7F ; | XXXXXXX| $DD74
    .byte $7F ; | XXXXXXX| $DD75
    .byte $F8 ; |XXXXX   | $DD76
    .byte $F8 ; |XXXXX   | $DD77
    .byte $F8 ; |XXXXX   | $DD78
    .byte $FF ; |XXXXXXXX| $DD79
    .byte $FF ; |XXXXXXXX| $DD7A
    .byte $FA ; |XXXXX X | $DD7B
    .byte $7F ; | XXXXXXX| $DD7C
    .byte $3F ; |  XXXXXX| $DD7D
    .byte $0F ; |    XXXX| $DD7E
    .byte $09 ; |    X  X| $DD7F
    .byte $00 ; |        | $DD80
    .byte $00 ; |        | $DD81
    .byte $00 ; |        | $DD82
    .byte $00 ; |        | $DD83
    .byte $00 ; |        | $DD84
    .byte $00 ; |        | $DD85
    .byte $00 ; |        | $DD86
    .byte $00 ; |        | $DD87
    .byte $00 ; |        | $DD88
    .byte $00 ; |        | $DD89
    .byte $00 ; |        | $DD8A
    .byte $00 ; |        | $DD8B
    .byte $00 ; |        | $DD8C
    .byte $00 ; |        | $DD8D
    .byte $00 ; |        | $DD8E
    .byte $00 ; |        | $DD8F
    .byte $00 ; |        | $DD90
    .byte $00 ; |        | $DD91
    .byte $00 ; |        | $DD92
    .byte $00 ; |        | $DD93
    .byte $00 ; |        | $DD94
    .byte $00 ; |        | $DD95
    .byte $00 ; |        | $DD96
    .byte $00 ; |        | $DD97
    .byte $00 ; |        | $DD98
    .byte $00 ; |        | $DD99
    .byte $00 ; |        | $DD9A
    .byte $00 ; |        | $DD9B
    .byte $00 ; |        | $DD9C
    .byte $00 ; |        | $DD9D
    .byte $00 ; |        | $DD9E
    .byte $00 ; |        | $DD9F
LDDA0:
    .byte $00 ; |        | $DDA0
    .byte $00 ; |        | $DDA1
    .byte $00 ; |        | $DDA2
    .byte $00 ; |        | $DDA3
    .byte $00 ; |        | $DDA4
    .byte $00 ; |        | $DDA5
    .byte $00 ; |        | $DDA6
    .byte $00 ; |        | $DDA7
    .byte $00 ; |        | $DDA8
    .byte $00 ; |        | $DDA9
    .byte $00 ; |        | $DDAA
    .byte $00 ; |        | $DDAB
    .byte $00 ; |        | $DDAC
    .byte $00 ; |        | $DDAD
    .byte $00 ; |        | $DDAE
    .byte $00 ; |        | $DDAF
    .byte $00 ; |        | $DDB0
    .byte $00 ; |        | $DDB1
    .byte $00 ; |        | $DDB2
    .byte $AF ; |X X XXXX| $DDB3
    .byte $AF ; |X X XXXX| $DDB4
    .byte $AF ; |X X XXXX| $DDB5
    .byte $AF ; |X X XXXX| $DDB6
    .byte $5F ; | X XXXXX| $DDB7
    .byte $5F ; | X XXXXX| $DDB8
    .byte $5F ; | X XXXXX| $DDB9
    .byte $5F ; | X XXXXX| $DDBA
    .byte $00 ; |        | $DDBB
    .byte $00 ; |        | $DDBC
    .byte $00 ; |        | $DDBD
    .byte $00 ; |        | $DDBE
    .byte $00 ; |        | $DDBF
    .byte $00 ; |        | $DDC0
    .byte $00 ; |        | $DDC1
    .byte $00 ; |        | $DDC2
    .byte $00 ; |        | $DDC3
    .byte $00 ; |        | $DDC4
    .byte $00 ; |        | $DDC5
    .byte $00 ; |        | $DDC6
    .byte $00 ; |        | $DDC7
LDDC8:
    .byte $00 ; |        | $DDC8
    .byte $00 ; |        | $DDC9
    .byte $10 ; |   X    | $DDCA
    .byte $00 ; |        | $DDCB
LDDCC:
    .byte $10 ; |   X    | $DDCC
    .byte $00 ; |        | $DDCD
    .byte $10 ; |   X    | $DDCE
    .byte $10 ; |   X    | $DDCF
LDDD0:
    .byte $00 ; |        | $DDD0
    .byte $10 ; |   X    | $DDD1
    .byte $00 ; |        | $DDD2
    .byte $00 ; |        | $DDD3
    .byte $F0 ; |XXXX    | $DDD4
    .byte $00 ; |        | $DDD5
    .byte $F2 ; |XXXX  X | $DDD6
    .byte $01 ; |       X| $DDD7
LDDD8:
    .byte $F2 ; |XXXX  X | $DDD8
    .byte $F1 ; |XXXX   X| $DDD9
    .byte $F2 ; |XXXX  X | $DDDA
    .byte $01 ; |       X| $DDDB
LDDDC:
    .byte $F0 ; |XXXX    | $DDDC
    .byte $F0 ; |XXXX    | $DDDD
    .byte $02 ; |      X | $DDDE
    .byte $01 ; |       X| $DDDF
LDDE0:
    .byte $F2 ; |XXXX  X | $DDE0
    .byte $01 ; |       X| $DDE1
    .byte $F2 ; |XXXX  X | $DDE2
    .byte $01 ; |       X| $DDE3
    .byte $00 ; |        | $DDE4
    .byte $00 ; |        | $DDE5
    .byte $10 ; |   X    | $DDE6
    .byte $00 ; |        | $DDE7
    .byte $10 ; |   X    | $DDE8
    .byte $00 ; |        | $DDE9
    .byte $10 ; |   X    | $DDEA
    .byte $00 ; |        | $DDEB
    .byte $00 ; |        | $DDEC
    .byte $F0 ; |XXXX    | $DDED
    .byte $00 ; |        | $DDEE
    .byte $00 ; |        | $DDEF
    .byte $02 ; |      X | $DDF0
    .byte $12 ; |   X  X | $DDF1
    .byte $02 ; |      X | $DDF2
    .byte $12 ; |   X  X | $DDF3
    .byte $02 ; |      X | $DDF4
    .byte $12 ; |   X  X | $DDF5
    .byte $12 ; |   X  X | $DDF6
    .byte $02 ; |      X | $DDF7
    .byte $02 ; |      X | $DDF8
    .byte $F2 ; |XXXX  X | $DDF9
    .byte $F2 ; |XXXX  X | $DDFA
    .byte $02 ; |      X | $DDFB
    .byte $02 ; |      X | $DDFC
    .byte $F2 ; |XXXX  X | $DDFD
    .byte $02 ; |      X | $DDFE
    .byte $F2 ; |XXXX  X | $DDFF
    .byte $00 ; |        | $DE00
    .byte $00 ; |        | $DE01
    .byte $00 ; |        | $DE02
    .byte $00 ; |        | $DE03
    .byte $00 ; |        | $DE04
    .byte $00 ; |        | $DE05
    .byte $00 ; |        | $DE06
    .byte $00 ; |        | $DE07
    .byte $00 ; |        | $DE08
    .byte $00 ; |        | $DE09
    .byte $00 ; |        | $DE0A
    .byte $00 ; |        | $DE0B
    .byte $00 ; |        | $DE0C
    .byte $00 ; |        | $DE0D
    .byte $00 ; |        | $DE0E
    .byte $00 ; |        | $DE0F
    .byte $00 ; |        | $DE10
    .byte $00 ; |        | $DE11
    .byte $00 ; |        | $DE12
    .byte $00 ; |        | $DE13
    .byte $00 ; |        | $DE14
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
    .byte $00 ; |        | $DE1F
    .byte $00 ; |        | $DE20
    .byte $00 ; |        | $DE21
    .byte $00 ; |        | $DE22
    .byte $00 ; |        | $DE23
    .byte $00 ; |        | $DE24
    .byte $00 ; |        | $DE25
    .byte $00 ; |        | $DE26
    .byte $00 ; |        | $DE27
    .byte $00 ; |        | $DE28
    .byte $1C ; |   XXX  | $DE29
    .byte $1C ; |   XXX  | $DE2A
    .byte $38 ; |  XXX   | $DE2B
    .byte $70 ; | XXX    | $DE2C
    .byte $60 ; | XX     | $DE2D
    .byte $48 ; | X  X   | $DE2E
    .byte $18 ; |   XX   | $DE2F
    .byte $1C ; |   XXX  | $DE30
    .byte $0E ; |    XXX | $DE31
    .byte $0E ; |    XXX | $DE32
    .byte $1C ; |   XXX  | $DE33
    .byte $38 ; |  XXX   | $DE34
    .byte $38 ; |  XXX   | $DE35
    .byte $38 ; |  XXX   | $DE36
    .byte $62 ; | XX   X | $DE37
    .byte $58 ; | X XX   | $DE38
    .byte $D8 ; |XX XX   | $DE39
    .byte $F8 ; |XXXXX   | $DE3A
    .byte $F0 ; |XXXX    | $DE3B
    .byte $A0 ; |X X     | $DE3C
    .byte $0C ; |    XX  | $DE3D
    .byte $18 ; |   XX   | $DE3E
    .byte $1C ; |   XXX  | $DE3F
    .byte $38 ; |  XXX   | $DE40
    .byte $1C ; |   XXX  | $DE41
    .byte $3F ; |  XXXXXX| $DE42
    .byte $1C ; |   XXX  | $DE43
    .byte $1C ; |   XXX  | $DE44
    .byte $00 ; |        | $DE45
    .byte $00 ; |        | $DE46
    .byte $00 ; |        | $DE47
    .byte $00 ; |        | $DE48
    .byte $00 ; |        | $DE49
    .byte $00 ; |        | $DE4A
    .byte $00 ; |        | $DE4B
    .byte $00 ; |        | $DE4C
    .byte $00 ; |        | $DE4D
    .byte $00 ; |        | $DE4E
    .byte $00 ; |        | $DE4F
    .byte $00 ; |        | $DE50
    .byte $00 ; |        | $DE51
    .byte $00 ; |        | $DE52
    .byte $00 ; |        | $DE53
    .byte $00 ; |        | $DE54
    .byte $00 ; |        | $DE55
    .byte $00 ; |        | $DE56
    .byte $00 ; |        | $DE57
    .byte $00 ; |        | $DE58
    .byte $00 ; |        | $DE59
    .byte $00 ; |        | $DE5A
    .byte $00 ; |        | $DE5B
    .byte $00 ; |        | $DE5C
    .byte $00 ; |        | $DE5D
    .byte $00 ; |        | $DE5E
    .byte $00 ; |        | $DE5F
    .byte $00 ; |        | $DE60
    .byte $00 ; |        | $DE61
    .byte $00 ; |        | $DE62
    .byte $00 ; |        | $DE63
    .byte $00 ; |        | $DE64
    .byte $00 ; |        | $DE65
    .byte $00 ; |        | $DE66
    .byte $00 ; |        | $DE67
    .byte $00 ; |        | $DE68
    .byte $00 ; |        | $DE69
    .byte $00 ; |        | $DE6A
    .byte $00 ; |        | $DE6B
    .byte $EE ; |XXX XXX | $DE6C
    .byte $EE ; |XXX XXX | $DE6D
    .byte $C8 ; |XX  X   | $DE6E
    .byte $CC ; |XX  XX  | $DE6F
    .byte $E6 ; |XXX  XX | $DE70
    .byte $82 ; |X     X | $DE71
    .byte $38 ; |  XXX   | $DE72
    .byte $60 ; | XX     | $DE73
    .byte $FC ; |XXXXXX  | $DE74
    .byte $F0 ; |XXXX    | $DE75
    .byte $DC ; |XX XXX  | $DE76
    .byte $80 ; |X       | $DE77
    .byte $0E ; |    XXX | $DE78
    .byte $3F ; |  XXXXXX| $DE79
    .byte $F8 ; |XXXXX   | $DE7A
    .byte $7F ; | XXXXXXX| $DE7B
    .byte $E2 ; |XXX   X | $DE7C
    .byte $4A ; | X  X X | $DE7D
    .byte $E7 ; |XXX  XXX| $DE7E
    .byte $3E ; |  XXXXX | $DE7F
    .byte $5E ; | X XXXX | $DE80
    .byte $2B ; |  X X XX| $DE81
    .byte $00 ; |        | $DE82
    .byte $00 ; |        | $DE83
    .byte $00 ; |        | $DE84
    .byte $00 ; |        | $DE85
    .byte $00 ; |        | $DE86
    .byte $00 ; |        | $DE87
    .byte $00 ; |        | $DE88
    .byte $00 ; |        | $DE89
    .byte $00 ; |        | $DE8A
    .byte $00 ; |        | $DE8B
    .byte $00 ; |        | $DE8C
    .byte $00 ; |        | $DE8D
    .byte $00 ; |        | $DE8E
    .byte $00 ; |        | $DE8F
    .byte $00 ; |        | $DE90
    .byte $00 ; |        | $DE91
    .byte $00 ; |        | $DE92
    .byte $00 ; |        | $DE93
    .byte $00 ; |        | $DE94
    .byte $00 ; |        | $DE95
    .byte $00 ; |        | $DE96
    .byte $00 ; |        | $DE97
    .byte $00 ; |        | $DE98
    .byte $00 ; |        | $DE99
    .byte $00 ; |        | $DE9A
    .byte $00 ; |        | $DE9B
    .byte $00 ; |        | $DE9C
    .byte $00 ; |        | $DE9D
    .byte $00 ; |        | $DE9E
    .byte $00 ; |        | $DE9F
    .byte $00 ; |        | $DEA0
    .byte $00 ; |        | $DEA1
    .byte $00 ; |        | $DEA2
    .byte $00 ; |        | $DEA3
    .byte $00 ; |        | $DEA4
    .byte $00 ; |        | $DEA5
    .byte $00 ; |        | $DEA6
    .byte $00 ; |        | $DEA7
    .byte $3C ; |  XXXX  | $DEA8
    .byte $3C ; |  XXXX  | $DEA9
    .byte $38 ; |  XXX   | $DEAA
    .byte $70 ; | XXX    | $DEAB
    .byte $C0 ; |XX      | $DEAC
    .byte $8E ; |X   XXX | $DEAD
    .byte $38 ; |  XXX   | $DEAE
    .byte $7F ; | XXXXXXX| $DEAF
    .byte $78 ; | XXXX   | $DEB0
    .byte $6F ; | XX XXXX| $DEB1
    .byte $40 ; | X      | $DEB2
    .byte $06 ; |     XX | $DEB3
    .byte $AF ; |X X XXXX| $DEB4
    .byte $F0 ; |XXXX    | $DEB5
    .byte $78 ; | XXXX   | $DEB6
    .byte $FF ; |XXXXXXXX| $DEB7
    .byte $62 ; | XX   X | $DEB8
    .byte $D2 ; |XX X  X | $DEB9
    .byte $67 ; | XX  XXX| $DEBA
    .byte $3E ; |  XXXXX | $DEBB
    .byte $5E ; | X XXXX | $DEBC
    .byte $14 ; |   X X  | $DEBD
    .byte $00 ; |        | $DEBE
    .byte $00 ; |        | $DEBF
    .byte $00 ; |        | $DEC0
    .byte $00 ; |        | $DEC1
    .byte $00 ; |        | $DEC2
    .byte $00 ; |        | $DEC3
    .byte $00 ; |        | $DEC4
    .byte $00 ; |        | $DEC5
    .byte $00 ; |        | $DEC6
    .byte $00 ; |        | $DEC7
    .byte $00 ; |        | $DEC8
    .byte $00 ; |        | $DEC9
    .byte $00 ; |        | $DECA
    .byte $00 ; |        | $DECB
    .byte $00 ; |        | $DECC
    .byte $00 ; |        | $DECD
    .byte $00 ; |        | $DECE
    .byte $00 ; |        | $DECF
    .byte $00 ; |        | $DED0
    .byte $00 ; |        | $DED1
    .byte $00 ; |        | $DED2
    .byte $00 ; |        | $DED3
    .byte $00 ; |        | $DED4
    .byte $00 ; |        | $DED5
    .byte $00 ; |        | $DED6
    .byte $00 ; |        | $DED7
    .byte $00 ; |        | $DED8
    .byte $00 ; |        | $DED9
    .byte $00 ; |        | $DEDA
    .byte $00 ; |        | $DEDB
    .byte $00 ; |        | $DEDC
    .byte $00 ; |        | $DEDD
LDEDE:
    .byte $00 ; |        | $DEDE
    .byte $00 ; |        | $DEDF
    .byte $00 ; |        | $DEE0
    .byte $00 ; |        | $DEE1
    .byte $00 ; |        | $DEE2
    .byte $00 ; |        | $DEE3
    .byte $00 ; |        | $DEE4
    .byte $00 ; |        | $DEE5
    .byte $00 ; |        | $DEE6
    .byte $00 ; |        | $DEE7
    .byte $37 ; |  XX XXX| $DEE8
    .byte $10 ; |   X    | $DEE9
    .byte $10 ; |   X    | $DEEA
    .byte $11 ; |   X   X| $DEEB
    .byte $BA ; |X XXX X | $DEEC
    .byte $7C ; | XXXXX  | $DEED
    .byte $FF ; |XXXXXXXX| $DEEE
    .byte $38 ; |  XXX   | $DEEF
    .byte $54 ; | X X X  | $DEF0
    .byte $92 ; |X  X  X | $DEF1
    .byte $11 ; |   X   X| $DEF2
    .byte $10 ; |   X    | $DEF3
    .byte $10 ; |   X    | $DEF4
    .byte $00 ; |        | $DEF5
    .byte $00 ; |        | $DEF6
    .byte $00 ; |        | $DEF7
    .byte $00 ; |        | $DEF8
    .byte $00 ; |        | $DEF9
    .byte $00 ; |        | $DEFA
    .byte $00 ; |        | $DEFB
    .byte $00 ; |        | $DEFC
    .byte $00 ; |        | $DEFD
    .byte $00 ; |        | $DEFE
    .byte $00 ; |        | $DEFF
    .byte $00 ; |        | $DF00
    .byte $00 ; |        | $DF01
    .byte $00 ; |        | $DF02
    .byte $00 ; |        | $DF03
    .byte $00 ; |        | $DF04
    .byte $00 ; |        | $DF05
    .byte $00 ; |        | $DF06
    .byte $00 ; |        | $DF07
    .byte $00 ; |        | $DF08
    .byte $00 ; |        | $DF09
    .byte $00 ; |        | $DF0A
    .byte $00 ; |        | $DF0B
    .byte $00 ; |        | $DF0C
    .byte $00 ; |        | $DF0D
    .byte $00 ; |        | $DF0E
    .byte $00 ; |        | $DF0F
    .byte $00 ; |        | $DF10
    .byte $00 ; |        | $DF11
    .byte $00 ; |        | $DF12
    .byte $00 ; |        | $DF13
    .byte $00 ; |        | $DF14
    .byte $00 ; |        | $DF15
    .byte $00 ; |        | $DF16
    .byte $00 ; |        | $DF17
    .byte $00 ; |        | $DF18
    .byte $00 ; |        | $DF19
    .byte $00 ; |        | $DF1A
    .byte $00 ; |        | $DF1B
    .byte $00 ; |        | $DF1C
    .byte $00 ; |        | $DF1D
    .byte $00 ; |        | $DF1E
    .byte $00 ; |        | $DF1F
    .byte $00 ; |        | $DF20
    .byte $00 ; |        | $DF21
    .byte $00 ; |        | $DF22
    .byte $00 ; |        | $DF23
    .byte $00 ; |        | $DF24
    .byte $00 ; |        | $DF25
    .byte $00 ; |        | $DF26
    .byte $00 ; |        | $DF27
    .byte $00 ; |        | $DF28
    .byte $36 ; |  XX XX | $DF29
    .byte $76 ; | XXX XX | $DF2A
    .byte $40 ; | X      | $DF2B
    .byte $36 ; |  XX XX | $DF2C
    .byte $36 ; |  XX XX | $DF2D
    .byte $36 ; |  XX XX | $DF2E
    .byte $36 ; |  XX XX | $DF2F
    .byte $36 ; |  XX XX | $DF30
    .byte $36 ; |  XX XX | $DF31
    .byte $3E ; |  XXXXX | $DF32
    .byte $3E ; |  XXXXX | $DF33
    .byte $1E ; |   XXXX | $DF34
    .byte $1E ; |   XXXX | $DF35
    .byte $1E ; |   XXXX | $DF36
    .byte $1E ; |   XXXX | $DF37
    .byte $3F ; |  XXXXXX| $DF38
    .byte $3F ; |  XXXXXX| $DF39
    .byte $3D ; |  XXXX X| $DF3A
    .byte $89 ; |X   X  X| $DF3B
    .byte $88 ; |X   X   | $DF3C
    .byte $1C ; |   XXX  | $DF3D
    .byte $1C ; |   XXX  | $DF3E
    .byte $1C ; |   XXX  | $DF3F
    .byte $0C ; |    XX  | $DF40
    .byte $1C ; |   XXX  | $DF41
    .byte $3E ; |  XXXXX | $DF42
    .byte $1C ; |   XXX  | $DF43
    .byte $1C ; |   XXX  | $DF44
    .byte $00 ; |        | $DF45
    .byte $00 ; |        | $DF46
    .byte $00 ; |        | $DF47
    .byte $00 ; |        | $DF48
    .byte $00 ; |        | $DF49
    .byte $00 ; |        | $DF4A
    .byte $00 ; |        | $DF4B
    .byte $00 ; |        | $DF4C
    .byte $00 ; |        | $DF4D
    .byte $00 ; |        | $DF4E
    .byte $00 ; |        | $DF4F
    .byte $00 ; |        | $DF50
    .byte $00 ; |        | $DF51
    .byte $00 ; |        | $DF52
    .byte $00 ; |        | $DF53
    .byte $00 ; |        | $DF54
    .byte $00 ; |        | $DF55
    .byte $00 ; |        | $DF56
    .byte $00 ; |        | $DF57
    .byte $00 ; |        | $DF58
    .byte $00 ; |        | $DF59
    .byte $00 ; |        | $DF5A
    .byte $00 ; |        | $DF5B
    .byte $00 ; |        | $DF5C
    .byte $00 ; |        | $DF5D
    .byte $00 ; |        | $DF5E
    .byte $00 ; |        | $DF5F
    .byte $00 ; |        | $DF60
    .byte $00 ; |        | $DF61
    .byte $00 ; |        | $DF62
    .byte $00 ; |        | $DF63
    .byte $00 ; |        | $DF64
    .byte $30 ; |  XX    | $DF65
    .byte $30 ; |  XX    | $DF66
    .byte $00 ; |        | $DF67
    .byte $36 ; |  XX XX | $DF68
    .byte $37 ; |  XX XXX| $DF69
    .byte $31 ; |  XX   X| $DF6A
    .byte $36 ; |  XX XX | $DF6B
    .byte $36 ; |  XX XX | $DF6C
    .byte $36 ; |  XX XX | $DF6D
    .byte $36 ; |  XX XX | $DF6E
    .byte $3E ; |  XXXXX | $DF6F
    .byte $3E ; |  XXXXX | $DF70
    .byte $3C ; |  XXXX  | $DF71
    .byte $3C ; |  XXXX  | $DF72
    .byte $3C ; |  XXXX  | $DF73
    .byte $3C ; |  XXXX  | $DF74
    .byte $3C ; |  XXXX  | $DF75
    .byte $7E ; | XXXXXX | $DF76
    .byte $5E ; | X XXXX | $DF77
    .byte $4B ; | X  X XX| $DF78
    .byte $09 ; |    X  X| $DF79
    .byte $1D ; |   XXX X| $DF7A
    .byte $1D ; |   XXX X| $DF7B
    .byte $1C ; |   XXX  | $DF7C
    .byte $1C ; |   XXX  | $DF7D
    .byte $3E ; |  XXXXX | $DF7E
    .byte $1C ; |   XXX  | $DF7F
    .byte $1C ; |   XXX  | $DF80
    .byte $00 ; |        | $DF81
    .byte $00 ; |        | $DF82
    .byte $00 ; |        | $DF83
    .byte $00 ; |        | $DF84
    .byte $00 ; |        | $DF85
    .byte $00 ; |        | $DF86
    .byte $00 ; |        | $DF87
    .byte $00 ; |        | $DF88
    .byte $00 ; |        | $DF89
    .byte $00 ; |        | $DF8A
    .byte $00 ; |        | $DF8B
    .byte $00 ; |        | $DF8C
    .byte $00 ; |        | $DF8D
    .byte $00 ; |        | $DF8E
    .byte $00 ; |        | $DF8F
    .byte $00 ; |        | $DF90
    .byte $00 ; |        | $DF91
    .byte $00 ; |        | $DF92
    .byte $00 ; |        | $DF93
    .byte $00 ; |        | $DF94
    .byte $00 ; |        | $DF95
    .byte $00 ; |        | $DF96
    .byte $00 ; |        | $DF97
    .byte $00 ; |        | $DF98
    .byte $00 ; |        | $DF99
    .byte $00 ; |        | $DF9A
    .byte $00 ; |        | $DF9B
    .byte $00 ; |        | $DF9C
    .byte $00 ; |        | $DF9D
    .byte $00 ; |        | $DF9E
    .byte $00 ; |        | $DF9F
    .byte $00 ; |        | $DFA0
    .byte $00 ; |        | $DFA1
    .byte $02 ; |      X | $DFA2
    .byte $82 ; |X     X | $DFA3
    .byte $02 ; |      X | $DFA4
    .byte $62 ; | XX   X | $DFA5
    .byte $02 ; |      X | $DFA6
    .byte $A2 ; |X X   X | $DFA7
    .byte $02 ; |      X | $DFA8
    .byte $72 ; | XXX  X | $DFA9
    .byte $02 ; |      X | $DFAA
    .byte $F2 ; |XXXX  X | $DFAB
    .byte $02 ; |      X | $DFAC
    .byte $32 ; |  XX  X | $DFAD
    .byte $02 ; |      X | $DFAE
    .byte $32 ; |  XX  X | $DFAF
    .byte $02 ; |      X | $DFB0
    .byte $C2 ; |XX    X | $DFB1
    .byte $02 ; |      X | $DFB2
    .byte $22 ; |  X   X | $DFB3
    .byte $02 ; |      X | $DFB4
    .byte $32 ; |  XX  X | $DFB5
    .byte $02 ; |      X | $DFB6
    .byte $A2 ; |X X   X | $DFB7
    .byte $02 ; |      X | $DFB8
    .byte $32 ; |  XX  X | $DFB9
    .byte $02 ; |      X | $DFBA
    .byte $F2 ; |XXXX  X | $DFBB
    .byte $02 ; |      X | $DFBC
    .byte $00 ; |        | $DFBD
    .byte $00 ; |        | $DFBE
    .byte $00 ; |        | $DFBF
    .byte $00 ; |        | $DFC0
    .byte $00 ; |        | $DFC1
    .byte $00 ; |        | $DFC2
    .byte $00 ; |        | $DFC3
    .byte $00 ; |        | $DFC4
    .byte $00 ; |        | $DFC5
    .byte $00 ; |        | $DFC6
    .byte $00 ; |        | $DFC7
    .byte $00 ; |        | $DFC8
    .byte $00 ; |        | $DFC9
    .byte $00 ; |        | $DFCA
    .byte $00 ; |        | $DFCB
    .byte $00 ; |        | $DFCC
    .byte $00 ; |        | $DFCD
    .byte $00 ; |        | $DFCE
    .byte $00 ; |        | $DFCF
    .byte $00 ; |        | $DFD0
    .byte $00 ; |        | $DFD1
    .byte $00 ; |        | $DFD2
    .byte $00 ; |        | $DFD3
    .byte $00 ; |        | $DFD4
    .byte $00 ; |        | $DFD5
    .byte $00 ; |        | $DFD6
    .byte $00 ; |        | $DFD7
    .byte $00 ; |        | $DFD8
    .byte $00 ; |        | $DFD9
    .byte $00 ; |        | $DFDA
    .byte $00 ; |        | $DFDB
    .byte $08 ; |    X   | $DFDC
    .byte $18 ; |   XX   | $DFDD
    .byte $90 ; |X  X    | $DFDE
    .byte $FF ; |XXXXXXXX| $DFDF
    .byte $FD ; |XXXXXX X| $DFE0
    .byte $DD ; |XX XXX X| $DFE1
    .byte $C1 ; |XX     X| $DFE2
    .byte $80 ; |X       | $DFE3
    .byte $00 ; |        | $DFE4
    .byte $00 ; |        | $DFE5
    .byte $00 ; |        | $DFE6
    .byte $00 ; |        | $DFE7
    .byte $00 ; |        | $DFE8
    .byte $00 ; |        | $DFE9
    .byte $00 ; |        | $DFEA
    .byte $00 ; |        | $DFEB
    .byte $00 ; |        | $DFEC
    .byte $00 ; |        | $DFED
    .byte $00 ; |        | $DFEE
    .byte $00 ; |        | $DFEF
    .byte $00 ; |        | $DFF0
    .byte $00 ; |        | $DFF1
    .byte $00 ; |        | $DFF2
    .byte $00 ; |        | $DFF3
    .byte $00 ; |        | $DFF4
    .byte $00 ; |        | $DFF5
    .byte $00 ; |        | $DFF6
    .byte $00 ; |        | $DFF7

       ORG $1FF8
      RORG $DFF8

    nop                          ; 2
    nop                          ; 2

    .word START_1 + $2000
    .word START_1 + $2000
    .word START_1 + $2000