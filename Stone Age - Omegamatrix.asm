; Rough disassembly of Stone Age
; By Omegamatrix
;
;      ORG F000
;      CODE F000 F2D5
;      GFX F2D6 F2D9
;      CODE F2DA F36F
;      GFX F370 F513
;      CODE F514 FB07
;      GFX FB08 FB0F
;      CODE FB10 FBE9
;      GFX FBEA FBF6
;      CODE FBF7 FCE3
;      GFX FCE4 FD1F
;      CODE FD20 FE55
;      GFX FE56 FFFF

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
AUDC0   =  $15
AUDC1   =  $16
AUDF0   =  $17
AUDF1   =  $18
AUDV0   =  $19
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
HMP0    =  $20
HMP1    =  $21
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXPPMM  =  $37
INPT4   =  $3C
INPT5   =  $3D
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      RIOT RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RIOT_RAM
       ORG $80

ram_80             ds 1  ; x6
ram_81             ds 1  ; x21
ram_82             ds 1  ; x3
ram_83             ds 1  ; x5
ram_84             ds 1  ; x10
ram_85             ds 1  ; x2
ram_86             ds 1  ; x15
ram_87             ds 1  ; x14
ram_88             ds 1  ; x7
ram_89             ds 1  ; x2
ram_8A             ds 1  ; x2
ram_8B             ds 1  ; x1
ram_8C             ds 1  ; x2
ram_8D             ds 1  ; x1
ram_8E             ds 1  ; x2
ram_8F             ds 1  ; x1
ram_90             ds 1  ; x2
ram_91             ds 1  ; x1
ram_92             ds 1  ; x38
ram_93             ds 15 ; x3
ram_A2             ds 1  ; x3
ram_A3             ds 1  ; x3
ram_A4             ds 1  ; x3
ram_A5             ds 1  ; x3
ram_A6             ds 1  ; x3
ram_A7             ds 1  ; x3
ram_A8             ds 1  ; x8
ram_A9             ds 1  ; x4
ram_AA             ds 1  ; x15
ram_AB             ds 1  ; x14
ram_AC             ds 1  ; x5
ram_AD             ds 1  ; x26
ram_AE             ds 1  ; x20
ram_AF             ds 1  ; x14
ram_B0             ds 1  ; x5
ram_B1             ds 1  ; x2
ram_B2             ds 1  ; x31
ram_B3             ds 1  ; x26
ram_B4             ds 1  ; x14
ram_B5             ds 4  ; x3
ram_B9             ds 1  ; x6
ram_BA             ds 1  ; x1
ram_BB             ds 1  ; x1
ram_BC             ds 1  ; x1
ram_BD             ds 1  ; x8
ram_BE             ds 1  ; x1
ram_BF             ds 1  ; x1
ram_C0             ds 1  ; x1
ram_C1             ds 1  ; x8
ram_C2             ds 4  ; x16
ram_C6             ds 1  ; x10
ram_C7             ds 1  ; x18
ram_C8             ds 1  ; x7
ram_C9             ds 2  ; x7
ram_CB             ds 2  ; x6
ram_CD             ds 2  ; x5
ram_CF             ds 1  ; x16
ram_D0             ds 1  ; x6
ram_D1             ds 1  ; x6
ram_D2             ds 1  ; x3
ram_D3             ds 1  ; x2
ram_D4             ds 1  ; x5
ram_D5             ds 1  ; x3
ram_D6             ds 1  ; x4
ram_D7             ds 1  ; x2
ram_D8             ds 1  ; x14
ram_D9             ds 1  ; x1
ram_DA             ds 1  ; x1
ram_DB             ds 1  ; x1
ram_DC             ds 1  ; x3
ram_DD             ds 1  ; x4
ram_DE             ds 1  ; x7
ram_DF             ds 1  ; x4
ram_E0             ds 1  ; x2
ram_E1             ds 1  ; x2
ram_E2             ds 1  ; x2
ram_E3             ds 1  ; x2
ram_E4             ds 1  ; x2
ram_E5             ds 1  ; x2
ram_E6             ds 26 ; x5

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG CODE
       ORG $F000

START:
    ldx    #$FF                  ; 2
    txs                          ; 2
    cld                          ; 2
    ldx    #$00                  ; 2
    lda    #$00                  ; 2
LF008:
    sta    VSYNC,X               ; 4
    dex                          ; 2
    bne    LF008                 ; 2³
    jsr    LFBF7                 ; 6
    lda    #$04                  ; 2
    sta    AUDC0                 ; 3
    lda    #$12                  ; 2
    sta    AUDF0                 ; 3
    lda    #$F4                  ; 2
    sta    ram_8B                ; 3
    sta    ram_8D                ; 3
    sta    ram_8F                ; 3
    sta    ram_91                ; 3
    lda    #$FF                  ; 2
    sta    ram_D1                ; 3
    sta    ram_DE                ; 3
LF028:
    jsr    LF2DA                 ; 6
    jsr    LFDE1                 ; 6
    jsr    LFC5C                 ; 6
    jsr    LFB5E                 ; 6
    jsr    LF5A1                 ; 6
    jsr    LF5BE                 ; 6
    jsr    LF724                 ; 6
    jsr    LFD20                 ; 6
    jsr    LF7DA                 ; 6
    jsr    LF920                 ; 6
    jsr    LFA93                 ; 6
    jsr    LFB26                 ; 6
    jsr    LF052                 ; 6
    jmp    LF028                 ; 3

LF052:
    lda    #$00                  ; 2
    sta    ram_83                ; 3
    lda    #$03                  ; 2
    sta    NUSIZ0                ; 3
    lda    #$01                  ; 2
    sta    NUSIZ1                ; 3
LF05E:
    lda    INTIM                 ; 4
    bne    LF05E                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    ldx    #$08                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
LF06B:
    dex                          ; 2
    bne    LF06B                 ; 2³
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    lda    #$10                  ; 2
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$62                  ; 2
    ldy    ram_CF                ; 3
    beq    LF082                 ; 2³
    lda    #$B4                  ; 2
LF082:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    lda    #$2A                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldy    #$00                  ; 2
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
LF092:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_8A),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_8C),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_8E),Y            ; 5
    tax                          ; 2
    lda    (ram_90),Y            ; 5
    sta    ram_AD                ; 3
    sty    ram_AE                ; 3
    lda    LF494,Y               ; 4
    ldy    ram_AD                ; 3
    nop                          ; 2
    nop                          ; 2
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    ldy    ram_AE                ; 3
    iny                          ; 2
    cpy    #$08                  ; 2
    bne    LF092                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    lda    #$05                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    ldx    #$FE                  ; 2
    stx    ram_A9                ; 3
    lda    ram_B0                ; 3
    sta    REFP0                 ; 3
    ldx    ram_AF                ; 3
    dex                          ; 2
    lda    LF48A,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    tax                          ; 2
    sta    HMCLR                 ; 3
    sta    HMP0                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
LF0E5:
    dex                          ; 2
    bne    LF0E5                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    HMP0                  ; 3
    sta    HMP0                  ; 3
    ldx    ram_C1                ; 3
    lda    ram_B5,X              ; 4
    sta    REFP1                 ; 3
    lda    ram_B9,X              ; 4
    sta    ram_88                ; 3
    ldx    ram_B1                ; 3
    dex                          ; 2
    lda    LF48A,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    tax                          ; 2
    sta    HMCLR                 ; 3
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
LF110:
    dex                          ; 2
    bne    LF110                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    HMP1                  ; 3
    ldy    ram_DC                ; 3
    sty    COLUPF                ; 3
    ldx    ram_C1                ; 3
    lda    ram_BD,X              ; 4
    sta    COLUP1                ; 3
    ldx    #$00                  ; 2
LF12B:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    stx    GRP0                  ; 3
    sta    PF2                   ; 3
    sta    ram_A8                ; 3
    inc    ram_A9                ; 5
    inc    ram_A9                ; 5
    ldx    ram_A9                ; 3
    lda    ram_92,X              ; 4
    and    #$03                  ; 2
    tay                          ; 2
    lda    LF458,Y               ; 4
    sta    ram_A4                ; 3
    lda    LF469,Y               ; 4
    sta    ram_E2                ; 3
    lda    ram_92,X              ; 4
    and    #$0C                  ; 2
    tay                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    GRP1                  ; 3
    lda    LF458,Y               ; 4
    sta    ram_A3                ; 3
    lda    LF469,Y               ; 4
    sta    ram_E1                ; 3
    lda    ram_92,X              ; 4
    and    #$10                  ; 2
    tay                          ; 2
    lda    LF458,Y               ; 4
    sta    ram_A2                ; 3
    lda    LF469,Y               ; 4
    sta    ram_E0                ; 3
    lda    ram_93,X              ; 4
    and    #$03                  ; 2
    tay                          ; 2
    lda    LF458,Y               ; 4
    sta    ram_A7                ; 3
    lda    LF469,Y               ; 4
    sta    ram_E5                ; 3
    lda    ram_93,X              ; 4
    and    #$0C                  ; 2
    tay                          ; 2
    lda    LF458,Y               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    ram_A6                ; 3
    lda    LF469,Y               ; 4
    sta    ram_E4                ; 3
    lda    ram_93,X              ; 4
    and    #$10                  ; 2
    tay                          ; 2
    lda    LF458,Y               ; 4
    sta    ram_A5                ; 3
    lda    LF469,Y               ; 4
    sta    ram_E3                ; 3
    ldx    #$00                  ; 2
    inc    ram_83                ; 5
    lda    ram_83                ; 3
    cmp    #$09                  ; 2
    bne    LF1AE                 ; 2³
    jmp    LF234                 ; 3

LF1AE:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_A2                ; 3
    sta    PF0                   ; 3
    lda    ram_A3                ; 3
    sta    PF1                   ; 3
    lda    ram_A4                ; 3
    sta    PF2                   ; 3
    stx    GRP1                  ; 3
    ldy    ram_A8                ; 3
    lda    ram_A5                ; 3
    sta    PF0                   ; 3
    lda    (ram_86),Y            ; 5
    tax                          ; 2
    lda    ram_A6                ; 3
    sta    PF1                   ; 3
    lda    (ram_AA),Y            ; 5
    ldy    ram_A7                ; 3
    sty    PF2                   ; 3
    ldy    ram_83                ; 3
    cpy    ram_84                ; 3
    beq    LF1D9                 ; 2³
    ldx    #$00                  ; 2
LF1D9:
    tay                          ; 2
    lda    ram_E0                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    lda    ram_E1                ; 3
    sta    PF1                   ; 3
    lda    ram_E2                ; 3
    sta    PF2                   ; 3
    stx    GRP0                  ; 3
    sty    COLUP0                ; 3
    lda    ram_E3                ; 3
    sta    PF0                   ; 3
    ldy    ram_A8                ; 3
    inc    ram_A8                ; 5
    lda    ram_E4                ; 3
    sta    PF1                   ; 3
    lda    (ram_88),Y            ; 5
    tax                          ; 2
    lda    ram_E5                ; 3
    sta    PF2                   ; 3
    lda    ram_83                ; 3
    cmp    ram_85                ; 3
    beq    LF207                 ; 2³
    ldx    #$00                  ; 2
LF207:
    lda    ram_A8                ; 3
    cmp    #$08                  ; 2
    bne    LF1AE                 ; 2³+1
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_A2                ; 3
    sta    PF0                   ; 3
    lda    ram_A3                ; 3
    sta    PF1                   ; 3
    lda    ram_A4                ; 3
    sta    PF2                   ; 3
    stx    GRP1                  ; 3
    ldx    #$00                  ; 2
    lda    ram_A5                ; 3
    sta    PF0                   ; 3
    ldy    ram_A8                ; 3
    lda    ram_A6                ; 3
    sta    PF1                   ; 3
    ldy    ram_A8                ; 3
    ldy    ram_A8                ; 3
    lda    ram_A7                ; 3
    sta    PF2                   ; 3
    jmp    LF12B                 ; 3

LF234:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$36                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$00                  ; 2
    sta    HMP0                  ; 3
    sta    HMP1                  ; 3
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    ldx    #$08                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
LF24A:
    dex                          ; 2
    bne    LF24A                 ; 2³
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    lda    #$10                  ; 2
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$03                  ; 2
    sta    NUSIZ0                ; 3
    lda    #$01                  ; 2
    sta    NUSIZ1                ; 3
    ldy    #$00                  ; 2
    lda    #$3A                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    lda    ram_AD                ; 3
    nop                          ; 2
LF26C:
    lda    LF4EC,Y               ; 4
    sta    GRP0                  ; 3
    lda    LF4F4,Y               ; 4
    sta    GRP1                  ; 3
    lda    LF4FC,Y               ; 4
    sta    ram_AD                ; 3
    ldx    LF504,Y               ; 4
    lda    LF50C,Y               ; 4
    sty    ram_AE                ; 3
    ldy    ram_AD                ; 3
    sty    GRP0                  ; 3
    stx    GRP1                  ; 3
    sta    GRP0                  ; 3
    inc    ram_AE                ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    ram_AE                ; 3
    cpy    #$08                  ; 2
    bne    LF26C                 ; 2³
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    COLUBK                ; 3
    sta    HMP0                  ; 3
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$01                  ; 2
    sta    CTRLPF                ; 3
    ldy    #$05                  ; 2
LF2A9:
    lda    #$B4                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUPF                ; 3
    ldx    ram_D3                ; 3
    lda    LF2D6,X               ; 4
    sta    PF1                   ; 3
    ldx    ram_D2                ; 3
    lda    LF2D6,X               ; 4
    ldx    #$62                  ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    stx    COLUPF                ; 3
    sta    PF1                   ; 3
    dey                          ; 2
    bne    LF2A9                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    COLUPF                ; 3
    sta    PF1                   ; 3
    sta    CTRLPF                ; 3
    rts                          ; 6

LF2D6:
    .byte $00 ; |        | $F2D6
    .byte $80 ; |X       | $F2D7
    .byte $A0 ; |X X     | $F2D8
    .byte $A8 ; |X X X   | $F2D9

LF2DA:
    inc    ram_81                ; 5
    lda    ram_81                ; 3
    and    #$3F                  ; 2
    bne    LF2E4                 ; 2³
    inc    ram_82                ; 5
LF2E4:
    lda    #$02                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    lda    ram_81                ; 3
    bne    LF2F6                 ; 2³
    ldx    ram_C1                ; 3
    lda    ram_D8,X              ; 4
    ora    #$0F                  ; 2
    sta    ram_D8,X              ; 4
LF2F6:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_81                ; 3
    and    #$07                  ; 2
    bne    LF315                 ; 2³+1
    lda    ram_E6                ; 3
    bne    LF315                 ; 2³
    ldx    ram_AC                ; 3
    lda    LF370,X               ; 4
    sta    AUDF0                 ; 3
    inc    ram_AC                ; 5
    lda    ram_AC                ; 3
    cmp    #$38                  ; 2
    bne    LF315                 ; 2³
    lda    #$00                  ; 2
    sta    ram_AC                ; 3
LF315:
    lda    #$02                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    lda    ram_CF                ; 3
    bne    LF32D                 ; 2³
    lda    SWCHA                 ; 4
    and    #$0F                  ; 2
    sta    ram_D4                ; 3
    lda    INPT5                 ; 3
    sta    ram_D5                ; 3
    jmp    LF33A                 ; 3

LF32D:
    lda    SWCHA                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_D4                ; 3
    lda    INPT4                 ; 3
    sta    ram_D5                ; 3
LF33A:
    lda    ram_C1                ; 3
    sta    ram_AD                ; 3
    ldy    #$03                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
LF342:
    inc    ram_C1                ; 5
    lda    #$03                  ; 2
    and    ram_C1                ; 3
    tax                          ; 2
    lda    ram_BD,X              ; 4
    bne    LF352                 ; 2³
    dey                          ; 2
    bne    LF342                 ; 2³
    ldx    ram_AD                ; 3
LF352:
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    ram_C1                ; 3
    lda    ram_C2,X              ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_85                ; 3
    lda    #$0F                  ; 2
    and    ram_C2,X              ; 4
    sta    ram_B1                ; 3
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    lda    #$20                  ; 2
    sta    TIM64T                ; 4
    rts                          ; 6

LF370:
    .byte $1F ; |   XXXXX| $F370
    .byte $1F ; |   XXXXX| $F371
    .byte $15 ; |   X X X| $F372
    .byte $15 ; |   X X X| $F373
    .byte $1F ; |   XXXXX| $F374
    .byte $1F ; |   XXXXX| $F375
    .byte $15 ; |   X X X| $F376
    .byte $15 ; |   X X X| $F377
    .byte $1C ; |   XXX  | $F378
    .byte $1C ; |   XXX  | $F379
    .byte $15 ; |   X X X| $F37A
    .byte $15 ; |   X X X| $F37B
    .byte $1C ; |   XXX  | $F37C
    .byte $1C ; |   XXX  | $F37D
    .byte $15 ; |   X X X| $F37E
    .byte $15 ; |   X X X| $F37F
    .byte $1F ; |   XXXXX| $F380
    .byte $1F ; |   XXXXX| $F381
    .byte $15 ; |   X X X| $F382
    .byte $15 ; |   X X X| $F383
    .byte $1F ; |   XXXXX| $F384
    .byte $1F ; |   XXXXX| $F385
    .byte $15 ; |   X X X| $F386
    .byte $15 ; |   X X X| $F387
    .byte $1C ; |   XXX  | $F388
    .byte $1C ; |   XXX  | $F389
    .byte $15 ; |   X X X| $F38A
    .byte $15 ; |   X X X| $F38B
    .byte $1C ; |   XXX  | $F38C
    .byte $1C ; |   XXX  | $F38D
    .byte $15 ; |   X X X| $F38E
    .byte $15 ; |   X X X| $F38F
    .byte $1F ; |   XXXXX| $F390
    .byte $1F ; |   XXXXX| $F391
    .byte $15 ; |   X X X| $F392
    .byte $15 ; |   X X X| $F393
    .byte $1C ; |   XXX  | $F394
    .byte $1C ; |   XXX  | $F395
    .byte $15 ; |   X X X| $F396
    .byte $15 ; |   X X X| $F397
    .byte $1F ; |   XXXXX| $F398
    .byte $1F ; |   XXXXX| $F399
    .byte $1C ; |   XXX  | $F39A
    .byte $1C ; |   XXX  | $F39B
    .byte $19 ; |   XX  X| $F39C
    .byte $19 ; |   XX  X| $F39D
    .byte $1C ; |   XXX  | $F39E
    .byte $1C ; |   XXX  | $F39F
    .byte $1F ; |   XXXXX| $F3A0
    .byte $1C ; |   XXX  | $F3A1
    .byte $19 ; |   XX  X| $F3A2
    .byte $1C ; |   XXX  | $F3A3
    .byte $19 ; |   XX  X| $F3A4
    .byte $19 ; |   XX  X| $F3A5
    .byte $1C ; |   XXX  | $F3A6
    .byte $1F ; |   XXXXX| $F3A7
    .byte $3C ; |  XXXX  | $F3A8
    .byte $14 ; |   X X  | $F3A9
    .byte $34 ; |  XX X  | $F3AA
    .byte $1C ; |   XXX  | $F3AB
    .byte $38 ; |  XXX   | $F3AC
    .byte $5C ; | X XXX  | $F3AD
    .byte $16 ; |   X XX | $F3AE
    .byte $32 ; |  XX  X | $F3AF
    .byte $3C ; |  XXXX  | $F3B0
    .byte $3C ; |  XXXX  | $F3B1
    .byte $3C ; |  XXXX  | $F3B2
    .byte $2C ; |  X XX  | $F3B3
    .byte $5A ; | X XX X | $F3B4
    .byte $3C ; |  XXXX  | $F3B5
    .byte $16 ; |   X XX | $F3B6
    .byte $30 ; |  XX    | $F3B7
    .byte $3C ; |  XXXX  | $F3B8
    .byte $3C ; |  XXXX  | $F3B9
    .byte $3C ; |  XXXX  | $F3BA
    .byte $18 ; |   XX   | $F3BB
    .byte $7E ; | XXXXXX | $F3BC
    .byte $3C ; |  XXXX  | $F3BD
    .byte $16 ; |   X XX | $F3BE
    .byte $30 ; |  XX    | $F3BF
    .byte $3C ; |  XXXX  | $F3C0
    .byte $14 ; |   X X  | $F3C1
    .byte $34 ; |  XX X  | $F3C2
    .byte $5C ; | X XXX  | $F3C3
    .byte $38 ; |  XXX   | $F3C4
    .byte $1C ; |   XXX  | $F3C5
    .byte $16 ; |   X XX | $F3C6
    .byte $30 ; |  XX    | $F3C7
    .byte $3C ; |  XXXX  | $F3C8
    .byte $3C ; |  XXXX  | $F3C9
    .byte $3C ; |  XXXX  | $F3CA
    .byte $2C ; |  X XX  | $F3CB
    .byte $7E ; | XXXXXX | $F3CC
    .byte $3C ; |  XXXX  | $F3CD
    .byte $68 ; | XX X   | $F3CE
    .byte $0C ; |    XX  | $F3CF
    .byte $3C ; |  XXXX  | $F3D0
    .byte $3C ; |  XXXX  | $F3D1
    .byte $3C ; |  XXXX  | $F3D2
    .byte $5A ; | X XX X | $F3D3
    .byte $3C ; |  XXXX  | $F3D4
    .byte $3C ; |  XXXX  | $F3D5
    .byte $68 ; | XX X   | $F3D6
    .byte $0C ; |    XX  | $F3D7
    .byte $3C ; |  XXXX  | $F3D8
    .byte $14 ; |   X X  | $F3D9
    .byte $34 ; |  XX X  | $F3DA
    .byte $58 ; | X XX   | $F3DB
    .byte $7C ; | XXXXX  | $F3DC
    .byte $1E ; |   XXXX | $F3DD
    .byte $04 ; |     X  | $F3DE
    .byte $0C ; |    XX  | $F3DF
    .byte $3C ; |  XXXX  | $F3E0
    .byte $3C ; |  XXXX  | $F3E1
    .byte $2C ; |  X XX  | $F3E2
    .byte $5A ; | X XX X | $F3E3
    .byte $3C ; |  XXXX  | $F3E4
    .byte $18 ; |   XX   | $F3E5
    .byte $3C ; |  XXXX  | $F3E6
    .byte $00 ; |        | $F3E7
    .byte $00 ; |        | $F3E8
    .byte $3C ; |  XXXX  | $F3E9
    .byte $3C ; |  XXXX  | $F3EA
    .byte $3C ; |  XXXX  | $F3EB
    .byte $5A ; | X XX X | $F3EC
    .byte $3C ; |  XXXX  | $F3ED
    .byte $18 ; |   XX   | $F3EE
    .byte $3C ; |  XXXX  | $F3EF
    .byte $1C ; |   XXX  | $F3F0
    .byte $36 ; |  XX XX | $F3F1
    .byte $26 ; |  X  XX | $F3F2
    .byte $1C ; |   XXX  | $F3F3
    .byte $7C ; | XXXXX  | $F3F4
    .byte $3C ; |  XXXX  | $F3F5
    .byte $16 ; |   X XX | $F3F6
    .byte $32 ; |  XX  X | $F3F7
    .byte $1C ; |   XXX  | $F3F8
    .byte $2A ; |  X X X | $F3F9
    .byte $2A ; |  X X X | $F3FA
    .byte $1C ; |   XXX  | $F3FB
    .byte $08 ; |    X   | $F3FC
    .byte $3E ; |  XXXXX | $F3FD
    .byte $1C ; |   XXX  | $F3FE
    .byte $32 ; |  XX  X | $F3FF
    .byte $1C ; |   XXX  | $F400
    .byte $36 ; |  XX XX | $F401
    .byte $26 ; |  X  XX | $F402
    .byte $1C ; |   XXX  | $F403
    .byte $3E ; |  XXXXX | $F404
    .byte $7E ; | XXXXXX | $F405
    .byte $14 ; |   X X  | $F406
    .byte $34 ; |  XX X  | $F407
    .byte $1C ; |   XXX  | $F408
    .byte $2A ; |  X X X | $F409
    .byte $2A ; |  X X X | $F40A
    .byte $1C ; |   XXX  | $F40B
    .byte $08 ; |    X   | $F40C
    .byte $3E ; |  XXXXX | $F40D
    .byte $1C ; |   XXX  | $F40E
    .byte $26 ; |  X  XX | $F40F
    .byte $62 ; | XX   X | $F410
    .byte $68 ; | XX X   | $F411
    .byte $68 ; | XX X   | $F412
    .byte $68 ; | XX X   | $F413
    .byte $68 ; | XX X   | $F414
    .byte $36 ; |  XX XX | $F415
    .byte $68 ; | XX X   | $F416
    .byte $68 ; | XX X   | $F417
    .byte $62 ; | XX   X | $F418
    .byte $62 ; | XX   X | $F419
    .byte $62 ; | XX   X | $F41A
    .byte $62 ; | XX   X | $F41B
    .byte $68 ; | XX X   | $F41C
    .byte $36 ; |  XX XX | $F41D
    .byte $68 ; | XX X   | $F41E
    .byte $68 ; | XX X   | $F41F
    .byte $62 ; | XX   X | $F420
    .byte $68 ; | XX X   | $F421
    .byte $68 ; | XX X   | $F422
    .byte $68 ; | XX X   | $F423
    .byte $68 ; | XX X   | $F424
    .byte $36 ; |  XX XX | $F425
    .byte $68 ; | XX X   | $F426
    .byte $68 ; | XX X   | $F427
    .byte $62 ; | XX   X | $F428
    .byte $68 ; | XX X   | $F429
    .byte $68 ; | XX X   | $F42A
    .byte $68 ; | XX X   | $F42B
    .byte $68 ; | XX X   | $F42C
    .byte $36 ; |  XX XX | $F42D
    .byte $68 ; | XX X   | $F42E
    .byte $68 ; | XX X   | $F42F
    .byte $62 ; | XX   X | $F430
    .byte $62 ; | XX   X | $F431
    .byte $62 ; | XX   X | $F432
    .byte $62 ; | XX   X | $F433
    .byte $68 ; | XX X   | $F434
    .byte $36 ; |  XX XX | $F435
    .byte $68 ; | XX X   | $F436
    .byte $68 ; | XX X   | $F437
    .byte $62 ; | XX   X | $F438
    .byte $68 ; | XX X   | $F439
    .byte $68 ; | XX X   | $F43A
    .byte $68 ; | XX X   | $F43B
    .byte $68 ; | XX X   | $F43C
    .byte $36 ; |  XX XX | $F43D
    .byte $68 ; | XX X   | $F43E
    .byte $68 ; | XX X   | $F43F
    .byte $62 ; | XX   X | $F440
    .byte $68 ; | XX X   | $F441
    .byte $68 ; | XX X   | $F442
    .byte $68 ; | XX X   | $F443
    .byte $68 ; | XX X   | $F444
    .byte $36 ; |  XX XX | $F445
    .byte $68 ; | XX X   | $F446
    .byte $68 ; | XX X   | $F447
    .byte $62 ; | XX   X | $F448
    .byte $62 ; | XX   X | $F449
    .byte $62 ; | XX   X | $F44A
    .byte $68 ; | XX X   | $F44B
    .byte $36 ; |  XX XX | $F44C
    .byte $68 ; | XX X   | $F44D
    .byte $68 ; | XX X   | $F44E
    .byte $00 ; |        | $F44F
    .byte $00 ; |        | $F450
    .byte $62 ; | XX   X | $F451
    .byte $68 ; | XX X   | $F452
    .byte $68 ; | XX X   | $F453
    .byte $68 ; | XX X   | $F454
    .byte $36 ; |  XX XX | $F455
    .byte $68 ; | XX X   | $F456
    .byte $68 ; | XX X   | $F457
LF458:
    .byte $00 ; |        | $F458
    .byte $E0 ; |XXX     | $F459
    .byte $0E ; |    XXX | $F45A
    .byte $EE ; |XXX XXX | $F45B
    .byte $07 ; |     XXX| $F45C
    .byte $00 ; |        | $F45D
    .byte $00 ; |        | $F45E
    .byte $00 ; |        | $F45F
    .byte $70 ; | XXX    | $F460
    .byte $00 ; |        | $F461
    .byte $00 ; |        | $F462
    .byte $00 ; |        | $F463
    .byte $77 ; | XXX XXX| $F464
    .byte $00 ; |        | $F465
    .byte $00 ; |        | $F466
    .byte $00 ; |        | $F467
    .byte $E0 ; |XXX     | $F468
LF469:
    .byte $00 ; |        | $F469
    .byte $A0 ; |X X     | $F46A
    .byte $0A ; |    X X | $F46B
    .byte $AA ; |X X X X | $F46C
    .byte $05 ; |     X X| $F46D
    .byte $00 ; |        | $F46E
    .byte $00 ; |        | $F46F
    .byte $00 ; |        | $F470
    .byte $50 ; | X X    | $F471
    .byte $00 ; |        | $F472
    .byte $00 ; |        | $F473
    .byte $00 ; |        | $F474
    .byte $55 ; | X X X X| $F475
    .byte $00 ; |        | $F476
    .byte $00 ; |        | $F477
    .byte $00 ; |        | $F478
    .byte $A0 ; |X X     | $F479
    .byte $02 ; |      X | $F47A
    .byte $10 ; |   X    | $F47B
    .byte $1A ; |   XX X | $F47C
    .byte $1E ; |   XXXX | $F47D
    .byte $02 ; |      X | $F47E
    .byte $00 ; |        | $F47F
    .byte $0E ; |    XXX | $F480
    .byte $1A ; |   XX X | $F481
    .byte $00 ; |        | $F482
    .byte $0A ; |    X X | $F483
    .byte $1A ; |   XX X | $F484
    .byte $0A ; |    X X | $F485
    .byte $0B ; |    X XX| $F486
    .byte $0B ; |    X XX| $F487
    .byte $02 ; |      X | $F488
    .byte $08 ; |    X   | $F489
LF48A:
    .byte $21 ; |  X    X| $F48A
    .byte $73 ; | XXX  XX| $F48B
    .byte $64 ; | XX  X  | $F48C
    .byte $55 ; | X X X X| $F48D
    .byte $36 ; |  XX XX | $F48E
    .byte $37 ; |  XX XXX| $F48F
    .byte $28 ; |  X X   | $F490
    .byte $19 ; |   XX  X| $F491
    .byte $0A ; |    X X | $F492
    .byte $0B ; |    X XX| $F493
LF494:
    .byte $3C ; |  XXXX  | $F494
    .byte $62 ; | XX   X | $F495
    .byte $66 ; | XX  XX | $F496
    .byte $6A ; | XX X X | $F497
    .byte $72 ; | XXX  X | $F498
    .byte $62 ; | XX   X | $F499
    .byte $3C ; |  XXXX  | $F49A
    .byte $00 ; |        | $F49B
    .byte $38 ; |  XXX   | $F49C
    .byte $18 ; |   XX   | $F49D
    .byte $18 ; |   XX   | $F49E
    .byte $18 ; |   XX   | $F49F
    .byte $18 ; |   XX   | $F4A0
    .byte $18 ; |   XX   | $F4A1
    .byte $3C ; |  XXXX  | $F4A2
    .byte $00 ; |        | $F4A3
    .byte $3C ; |  XXXX  | $F4A4
    .byte $62 ; | XX   X | $F4A5
    .byte $02 ; |      X | $F4A6
    .byte $06 ; |     XX | $F4A7
    .byte $18 ; |   XX   | $F4A8
    .byte $60 ; | XX     | $F4A9
    .byte $7E ; | XXXXXX | $F4AA
    .byte $00 ; |        | $F4AB
    .byte $3C ; |  XXXX  | $F4AC
    .byte $62 ; | XX   X | $F4AD
    .byte $02 ; |      X | $F4AE
    .byte $04 ; |     X  | $F4AF
    .byte $02 ; |      X | $F4B0
    .byte $62 ; | XX   X | $F4B1
    .byte $3C ; |  XXXX  | $F4B2
    .byte $00 ; |        | $F4B3
    .byte $0C ; |    XX  | $F4B4
    .byte $1C ; |   XXX  | $F4B5
    .byte $34 ; |  XX X  | $F4B6
    .byte $64 ; | XX  X  | $F4B7
    .byte $7E ; | XXXXXX | $F4B8
    .byte $04 ; |     X  | $F4B9
    .byte $04 ; |     X  | $F4BA
    .byte $00 ; |        | $F4BB
    .byte $7E ; | XXXXXX | $F4BC
    .byte $60 ; | XX     | $F4BD
    .byte $7C ; | XXXXX  | $F4BE
    .byte $02 ; |      X | $F4BF
    .byte $02 ; |      X | $F4C0
    .byte $62 ; | XX   X | $F4C1
    .byte $3C ; |  XXXX  | $F4C2
    .byte $00 ; |        | $F4C3
    .byte $1E ; |   XXXX | $F4C4
    .byte $30 ; |  XX    | $F4C5
    .byte $60 ; | XX     | $F4C6
    .byte $7C ; | XXXXX  | $F4C7
    .byte $62 ; | XX   X | $F4C8
    .byte $62 ; | XX   X | $F4C9
    .byte $3C ; |  XXXX  | $F4CA
    .byte $00 ; |        | $F4CB
    .byte $7E ; | XXXXXX | $F4CC
    .byte $06 ; |     XX | $F4CD
    .byte $0C ; |    XX  | $F4CE
    .byte $18 ; |   XX   | $F4CF
    .byte $30 ; |  XX    | $F4D0
    .byte $30 ; |  XX    | $F4D1
    .byte $30 ; |  XX    | $F4D2
    .byte $00 ; |        | $F4D3
    .byte $3C ; |  XXXX  | $F4D4
    .byte $62 ; | XX   X | $F4D5
    .byte $62 ; | XX   X | $F4D6
    .byte $3C ; |  XXXX  | $F4D7
    .byte $62 ; | XX   X | $F4D8
    .byte $62 ; | XX   X | $F4D9
    .byte $3C ; |  XXXX  | $F4DA
    .byte $00 ; |        | $F4DB
    .byte $3C ; |  XXXX  | $F4DC
    .byte $62 ; | XX   X | $F4DD
    .byte $62 ; | XX   X | $F4DE
    .byte $3E ; |  XXXXX | $F4DF
    .byte $02 ; |      X | $F4E0
    .byte $04 ; |     X  | $F4E1
    .byte $78 ; | XXXX   | $F4E2
    .byte $00 ; |        | $F4E3
    .byte $00 ; |        | $F4E4
    .byte $00 ; |        | $F4E5
    .byte $00 ; |        | $F4E6
    .byte $00 ; |        | $F4E7
    .byte $00 ; |        | $F4E8
    .byte $00 ; |        | $F4E9
    .byte $00 ; |        | $F4EA
    .byte $00 ; |        | $F4EB
LF4EC:
    .byte $07 ; |     XXX| $F4EC
    .byte $0F ; |    XXXX| $F4ED
    .byte $4C ; | X  XX  | $F4EE
    .byte $AC ; |X X XX  | $F4EF
    .byte $4C ; | X  XX  | $F4F0
    .byte $0F ; |    XXXX| $F4F1
    .byte $07 ; |     XXX| $F4F2
    .byte $00 ; |        | $F4F3
LF4F4:
    .byte $C7 ; |XX   XXX| $F4F4
    .byte $EF ; |XXX XXXX| $F4F5
    .byte $EC ; |XXX XX  | $F4F6
    .byte $0C ; |    XX  | $F4F7
    .byte $EC ; |XXX XX  | $F4F8
    .byte $EF ; |XXX XXXX| $F4F9
    .byte $C7 ; |XX   XXX| $F4FA
    .byte $00 ; |        | $F4FB
LF4FC:
    .byte $C7 ; |XX   XXX| $F4FC
    .byte $EF ; |XXX XXXX| $F4FD
    .byte $EC ; |XXX XX  | $F4FE
    .byte $0F ; |    XXXX| $F4FF
    .byte $EC ; |XXX XX  | $F500
    .byte $EF ; |XXX XXXX| $F501
    .byte $C7 ; |XX   XXX| $F502
    .byte $00 ; |        | $F503
LF504:
    .byte $C0 ; |XX      | $F504
    .byte $E0 ; |XXX     | $F505
    .byte $E4 ; |XXX  X  | $F506
    .byte $EA ; |XXX X X | $F507
    .byte $04 ; |     X  | $F508
    .byte $E0 ; |XXX     | $F509
    .byte $C0 ; |XX      | $F50A
    .byte $00 ; |        | $F50B
LF50C:
    .byte $00 ; |        | $F50C
    .byte $00 ; |        | $F50D
    .byte $00 ; |        | $F50E
    .byte $00 ; |        | $F50F
    .byte $00 ; |        | $F510
    .byte $00 ; |        | $F511
    .byte $00 ; |        | $F512
    .byte $00 ; |        | $F513

LF514:
    ldx    ram_C6                ; 3
    lda    ram_C2,X              ; 4
    sec                          ; 2
    sbc    #$10                  ; 2
    sta    ram_C2,X              ; 4
    lda    #$F8                  ; 2
    sta    ram_B9,X              ; 4
    lda    ram_D8,X              ; 4
    and    #$0D                  ; 2
    ora    #$10                  ; 2
    sta    ram_D8,X              ; 4
    rts                          ; 6

LF52A:
    ldx    ram_C6                ; 3
    lda    ram_C2,X              ; 4
    clc                          ; 2
    adc    #$10                  ; 2
    sta    ram_C2,X              ; 4
    lda    #$F8                  ; 2
    sta    ram_B9,X              ; 4
    lda    ram_D8,X              ; 4
    and    #$0E                  ; 2
    ora    #$20                  ; 2
    sta    ram_D8,X              ; 4
    rts                          ; 6

LF540:
    ldx    ram_C6                ; 3
    lda    ram_C2,X              ; 4
    sec                          ; 2
    sbc    #$01                  ; 2
    sta    ram_C2,X              ; 4
    lda    #$00                  ; 2
    sta    ram_B5,X              ; 4
    lda    #$F0                  ; 2
    sta    ram_B9,X              ; 4
    lda    ram_D8,X              ; 4
    and    #$07                  ; 2
    ora    #$40                  ; 2
    sta    ram_D8,X              ; 4
    rts                          ; 6

LF55A:
    ldx    ram_C6                ; 3
    lda    ram_C2,X              ; 4
    clc                          ; 2
    adc    #$01                  ; 2
    sta    ram_C2,X              ; 4
    lda    #$08                  ; 2
    sta    ram_B5,X              ; 4
    lda    #$F0                  ; 2
    sta    ram_B9,X              ; 4
    lda    ram_D8,X              ; 4
    and    #$0B                  ; 2
    ora    #$80                  ; 2
    sta    ram_D8,X              ; 4
    rts                          ; 6

LF574:
    lda    ram_B2                ; 3
    asl                          ; 2
    tax                          ; 2
    dex                          ; 2
    dex                          ; 2
    lda    ram_B3                ; 3
    cmp    #$06                  ; 2
    bcc    LF584                 ; 2³
    inx                          ; 2
    sec                          ; 2
    sbc    #$05                  ; 2
LF584:
    clc                          ; 2
    adc    #$03                  ; 2
    stx    ram_B2                ; 3
    sta    ram_B3                ; 3
    rts                          ; 6

LF58C:
    lda    ram_84                ; 3
    asl                          ; 2
    tax                          ; 2
    dex                          ; 2
    dex                          ; 2
    lda    ram_AF                ; 3
    cmp    #$06                  ; 2
    bcc    LF59C                 ; 2³
    inx                          ; 2
    sec                          ; 2
    sbc    #$05                  ; 2
LF59C:
    clc                          ; 2
    adc    #$03                  ; 2
    tay                          ; 2
    rts                          ; 6

LF5A1:
    lda    ram_81                ; 3
    and    #$07                  ; 2
    cmp    #$01                  ; 2
    beq    LF5AA                 ; 2³
    rts                          ; 6

LF5AA:
    lda    #$4B                  ; 2
    sec                          ; 2
    sbc    ram_82                ; 3
    bne    LF5B4                 ; 2³
    jmp    LFC65                 ; 3

LF5B4:
    cmp    #$0F                  ; 2
    beq    LF5B9                 ; 2³
    rts                          ; 6

LF5B9:
    lda    #$78                  ; 2
    sta    ram_DC                ; 3
    rts                          ; 6

LF5BE:
    lda    ram_C7                ; 3
    bpl    LF5C3                 ; 2³
    rts                          ; 6

LF5C3:
    lda    ram_DF                ; 3
    bpl    LF5CD                 ; 2³
    lda    ram_81                ; 3
    and    #$0F                  ; 2
    sta    ram_DF                ; 3
LF5CD:
    eor    ram_81                ; 3
    and    #$0F                  ; 2
    beq    LF5D4                 ; 2³
    rts                          ; 6

LF5D4:
    lda    ram_E6                ; 3
    beq    LF5DD                 ; 2³
    lda    #$00                  ; 2
    sta    ram_E6                ; 3
    rts                          ; 6

LF5DD:
    lda    ram_D4                ; 3
    cmp    #$0F                  ; 2
    bne    LF5E8                 ; 2³
    lda    #$80                  ; 2
    sta    ram_DF                ; 3
    rts                          ; 6

LF5E8:
    lda    #$01                  ; 2
    sta    ram_E6                ; 3
    dec    ram_81                ; 5
    jsr    LF58C                 ; 6
    lda    ram_D4                ; 3
    cmp    #$0E                  ; 2
    bne    LF639                 ; 2³+1
    cpx    #$02                  ; 2
    bcs    LF5FE                 ; 2³
    jmp    LFBDE                 ; 3

LF5FE:
    dex                          ; 2
    dex                          ; 2
    lda    ram_92,X              ; 4
LF602:
    asl                          ; 2
    dey                          ; 2
    bne    LF602                 ; 2³
    bcc    LF60B                 ; 2³
    jmp    LFBDE                 ; 3

LF60B:
    dec    ram_84                ; 5
    lda    ram_84                ; 3
    and    #$01                  ; 2
    beq    LF626                 ; 2³
    lda    #$B0                  ; 2
    sta    ram_86                ; 3
    lda    #$F3                  ; 2
    sta    ram_87                ; 3
    lda    #$18                  ; 2
    sta    ram_AA                ; 3
    lda    #$F4                  ; 2
    sta    ram_AB                ; 3
    jmp    LFBDE                 ; 3

LF626:
    lda    #$C8                  ; 2
    sta    ram_86                ; 3
    lda    #$F3                  ; 2
    sta    ram_87                ; 3
    lda    #$30                  ; 2
    sta    ram_AA                ; 3
    lda    #$F4                  ; 2
    sta    ram_AB                ; 3
    jmp    LFBDE                 ; 3

LF639:
    cmp    #$0D                  ; 2
    bne    LF67F                 ; 2³
    cpx    #$0E                  ; 2
    bcc    LF644                 ; 2³
    jmp    LFBDE                 ; 3

LF644:
    inx                          ; 2
    inx                          ; 2
    lda    ram_92,X              ; 4
LF648:
    asl                          ; 2
    dey                          ; 2
    bne    LF648                 ; 2³
    bcc    LF651                 ; 2³
    jmp    LFBDE                 ; 3

LF651:
    inc    ram_84                ; 5
    lda    ram_84                ; 3
    and    #$01                  ; 2
    beq    LF66C                 ; 2³
    lda    #$B8                  ; 2
    sta    ram_86                ; 3
    lda    #$F3                  ; 2
    sta    ram_87                ; 3
    lda    #$20                  ; 2
    sta    ram_AA                ; 3
    lda    #$F4                  ; 2
    sta    ram_AB                ; 3
    jmp    LFBDE                 ; 3

LF66C:
    lda    #$D0                  ; 2
    sta    ram_86                ; 3
    lda    #$F3                  ; 2
    sta    ram_87                ; 3
    lda    #$38                  ; 2
    sta    ram_AA                ; 3
    lda    #$F4                  ; 2
    sta    ram_AB                ; 3
    jmp    LFBDE                 ; 3

LF67F:
    cmp    #$0B                  ; 2
    bne    LF6D1                 ; 2³
    cpy    #$05                  ; 2
    bcs    LF693                 ; 2³
    txa                          ; 2
    and    #$01                  ; 2
    bne    LF68F                 ; 2³
    jmp    LFBDE                 ; 3

LF68F:
    dex                          ; 2
    lda    #$09                  ; 2
    tay                          ; 2
LF693:
    dey                          ; 2
    lda    ram_92,X              ; 4
LF696:
    asl                          ; 2
    dey                          ; 2
    bne    LF696                 ; 2³
    bcc    LF69F                 ; 2³
    jmp    LFBDE                 ; 3

LF69F:
    dec    ram_AF                ; 5
    lda    #$00                  ; 2
    sta    ram_B0                ; 3
    lda    ram_AF                ; 3
    and    #$01                  ; 2
    bne    LF6BE                 ; 2³
    lda    #$A8                  ; 2
    sta    ram_86                ; 3
    lda    #$F3                  ; 2
    sta    ram_87                ; 3
    lda    #$10                  ; 2
    sta    ram_AA                ; 3
    lda    #$F4                  ; 2
    sta    ram_AB                ; 3
    jmp    LFBDE                 ; 3

LF6BE:
    lda    #$C0                  ; 2
    sta    ram_86                ; 3
    lda    #$F3                  ; 2
    sta    ram_87                ; 3
    lda    #$28                  ; 2
    sta    ram_AA                ; 3
    lda    #$F4                  ; 2
    sta    ram_AB                ; 3
    jmp    LFBDE                 ; 3

LF6D1:
    cmp    #$07                  ; 2
    beq    LF6D6                 ; 2³
    rts                          ; 6

LF6D6:
    cpy    #$08                  ; 2
    bcc    LF6E6                 ; 2³
    txa                          ; 2
    and    #$01                  ; 2
    beq    LF6E2                 ; 2³
    jmp    LFBDE                 ; 3

LF6E2:
    inx                          ; 2
    lda    #$03                  ; 2
    tay                          ; 2
LF6E6:
    iny                          ; 2
    lda    ram_92,X              ; 4
LF6E9:
    asl                          ; 2
    dey                          ; 2
    bne    LF6E9                 ; 2³
    bcc    LF6F2                 ; 2³
    jmp    LFBDE                 ; 3

LF6F2:
    inc    ram_AF                ; 5
    lda    #$08                  ; 2
    sta    ram_B0                ; 3
    lda    ram_AF                ; 3
    and    #$01                  ; 2
    bne    LF711                 ; 2³+1
    lda    #$A8                  ; 2
    sta    ram_86                ; 3
    lda    #$F3                  ; 2
    sta    ram_87                ; 3
    lda    #$10                  ; 2
    sta    ram_AA                ; 3
    lda    #$F4                  ; 2
    sta    ram_AB                ; 3
    jmp    LFBDE                 ; 3

LF711:
    lda    #$C0                  ; 2
    sta    ram_86                ; 3
    lda    #$F3                  ; 2
    sta    ram_87                ; 3
    lda    #$28                  ; 2
    sta    ram_AA                ; 3
    lda    #$F4                  ; 2
    sta    ram_AB                ; 3
    jmp    LFBDE                 ; 3

LF724:
    lda    ram_C7                ; 3
    bpl    LF729                 ; 2³
    rts                          ; 6

LF729:
    lda    ram_81                ; 3
    ldx    ram_CF                ; 3
    and    ram_D6,X              ; 4
    cmp    #$01                  ; 2
    beq    LF734                 ; 2³
    rts                          ; 6

LF734:
    ldy    #$04                  ; 2
LF736:
    inc    ram_C6                ; 5
    lda    ram_C6                ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    ram_BD,X              ; 4
    bne    LF744                 ; 2³
    dey                          ; 2
    bne    LF736                 ; 2³
LF744:
    stx    ram_C6                ; 3
    jsr    LF7C9                 ; 6
    jsr    LF574                 ; 6
    lda    #$F0                  ; 2
    sta    ram_B4                ; 3
    ldx    ram_B2                ; 3
    ldy    ram_B3                ; 3
    cpx    #$02                  ; 2
    bcs    LF75A                 ; 2³
    bcc    LF76A                 ; 3   always branch

LF75A:
    dex                          ; 2
    dex                          ; 2
    lda    ram_92,X              ; 4
LF75E:
    asl                          ; 2
    dey                          ; 2
    bne    LF75E                 ; 2³
    bcs    LF76A                 ; 2³
    lda    #$F1                  ; 2
    ora    ram_B4                ; 3
    sta    ram_B4                ; 3
LF76A:
    ldx    ram_B2                ; 3
    ldy    ram_B3                ; 3
    cpx    #$0E                  ; 2
    bcc    LF774                 ; 2³
    bcs    LF784                 ; 3   always branch

LF774:
    inx                          ; 2
    inx                          ; 2
    lda    ram_92,X              ; 4
LF778:
    asl                          ; 2
    dey                          ; 2
    bne    LF778                 ; 2³
    bcs    LF784                 ; 2³
    lda    #$F2                  ; 2
    ora    ram_B4                ; 3
    sta    ram_B4                ; 3
LF784:
    ldx    ram_B2                ; 3
    ldy    ram_B3                ; 3
    cpy    #$05                  ; 2
    bcs    LF797                 ; 2³
    txa                          ; 2
    and    #$01                  ; 2
    bne    LF793                 ; 2³
    beq    LF7A6                 ; 3   always branch

LF793:
    dex                          ; 2
    lda    #$09                  ; 2
    tay                          ; 2
LF797:
    dey                          ; 2
    lda    ram_92,X              ; 4
LF79A:
    asl                          ; 2
    dey                          ; 2
    bne    LF79A                 ; 2³
    bcs    LF7A6                 ; 2³
    lda    #$F4                  ; 2
    ora    ram_B4                ; 3
    sta    ram_B4                ; 3
LF7A6:
    ldx    ram_B2                ; 3
    ldy    ram_B3                ; 3
    cpy    #$08                  ; 2
    bcc    LF7B9                 ; 2³
    txa                          ; 2
    and    #$01                  ; 2
    beq    LF7B5                 ; 2³
    bne    LF7C8                 ; 3   always branch

LF7B5:
    inx                          ; 2
    lda    #$03                  ; 2
    tay                          ; 2
LF7B9:
    iny                          ; 2
    lda    ram_92,X              ; 4
LF7BC:
    asl                          ; 2
    dey                          ; 2
    bne    LF7BC                 ; 2³
    bcs    LF7C8                 ; 2³
    lda    #$F8                  ; 2
    ora    ram_B4                ; 3
    sta    ram_B4                ; 3
LF7C8:
    rts                          ; 6

LF7C9:
    ldx    ram_C6                ; 3
    lda    ram_C2,X              ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_B2                ; 3
    lda    #$0F                  ; 2
    and    ram_C2,X              ; 4
    sta    ram_B3                ; 3
    rts                          ; 6

LF7DA:
    lda    ram_81                ; 3
    and    #$0F                  ; 2
    cmp    #$06                  ; 2
    beq    LF7E3                 ; 2³
    rts                          ; 6

LF7E3:
    lda    ram_C7                ; 3
    bpl    LF7E8                 ; 2³
    rts                          ; 6

LF7E8:
    lda    #$01                  ; 2
    sta    ram_C8                ; 3
    lda    ram_D5                ; 3
    bpl    LF7F5                 ; 2³
    lda    #$00                  ; 2
    sta    AUDV1                 ; 3
    rts                          ; 6

LF7F5:
    lda    ram_D4                ; 3
    ora    #$F0                  ; 2
    cmp    #$FF                  ; 2
    bne    LF802                 ; 2³+1
    lda    #$00                  ; 2
    sta    AUDV1                 ; 3
    rts                          ; 6

LF802:
    ldy    #$00                  ; 2
    sty    AUDV1                 ; 3
    sty    ram_DD                ; 3
    and    #$7F                  ; 2
    sta    ram_C7                ; 3
    cmp    #$7E                  ; 2
    bne    LF813                 ; 2³
    jmp    LF824                 ; 3

LF813:
    cmp    #$7D                  ; 2
    bne    LF81A                 ; 2³
    jmp    LF860                 ; 3

LF81A:
    cmp    #$7B                  ; 2
    bne    LF821                 ; 2³
    jmp    LF8DE                 ; 3

LF821:
    jmp    LF89C                 ; 3

LF824:
    lda    ram_84                ; 3
    cmp    #$01                  ; 2
    bne    LF82B                 ; 2³
    rts                          ; 6

LF82B:
    jsr    LF58C                 ; 6
    dex                          ; 2
    dex                          ; 2
    stx    ram_B2                ; 3
    sty    ram_B3                ; 3
    lda    ram_92,X              ; 4
LF836:
    asl                          ; 2
    dey                          ; 2
    bne    LF836                 ; 2³
    bcs    LF83D                 ; 2³
    rts                          ; 6

LF83D:
    lda    #$E0                  ; 2
    sta    ram_86                ; 3
    lda    #$F3                  ; 2
    sta    ram_87                ; 3
    lda    #$48                  ; 2
    sta    ram_AA                ; 3
    lda    #$F4                  ; 2
    sta    ram_AB                ; 3
    lda    ram_C7                ; 3
    ora    #$80                  ; 2
    sta    ram_C7                ; 3
    lda    #$03                  ; 2
    sta    AUDC1                 ; 3
    lda    #$07                  ; 2
    sta    AUDF1                 ; 3
    lda    #$0D                  ; 2
    sta    AUDV1                 ; 3
    rts                          ; 6

LF860:
    lda    ram_84                ; 3
    cmp    #$08                  ; 2
    bne    LF867                 ; 2³
    rts                          ; 6

LF867:
    jsr    LF58C                 ; 6
    inx                          ; 2
    inx                          ; 2
    stx    ram_B2                ; 3
    sty    ram_B3                ; 3
    lda    ram_92,X              ; 4
LF872:
    asl                          ; 2
    dey                          ; 2
    bne    LF872                 ; 2³
    bcs    LF879                 ; 2³
    rts                          ; 6

LF879:
    lda    #$E8                  ; 2
    sta    ram_86                ; 3
    lda    #$F3                  ; 2
    sta    ram_87                ; 3
    lda    #$50                  ; 2
    sta    ram_AA                ; 3
    lda    #$F4                  ; 2
    sta    ram_AB                ; 3
    lda    ram_C7                ; 3
    ora    #$80                  ; 2
    sta    ram_C7                ; 3
    lda    #$03                  ; 2
    sta    AUDC1                 ; 3
    lda    #$07                  ; 2
    sta    AUDF1                 ; 3
    lda    #$0D                  ; 2
    sta    AUDV1                 ; 3
    rts                          ; 6

LF89C:
    lda    ram_AF                ; 3
    cmp    #$0A                  ; 2
    bne    LF8A3                 ; 2³
    rts                          ; 6

LF8A3:
    inc    ram_AF                ; 5
    jsr    LF58C                 ; 6
    dec    ram_AF                ; 5
    stx    ram_B2                ; 3
    sty    ram_B3                ; 3
    lda    ram_92,X              ; 4
LF8B0:
    asl                          ; 2
    dey                          ; 2
    bne    LF8B0                 ; 2³
    bcs    LF8B7                 ; 2³
    rts                          ; 6

LF8B7:
    lda    #$D8                  ; 2
    sta    ram_86                ; 3
    lda    #$F3                  ; 2
    sta    ram_87                ; 3
    lda    #$40                  ; 2
    sta    ram_AA                ; 3
    lda    #$F4                  ; 2
    sta    ram_AB                ; 3
    lda    #$08                  ; 2
    sta    ram_B0                ; 3
    lda    ram_C7                ; 3
    ora    #$80                  ; 2
    sta    ram_C7                ; 3
    lda    #$03                  ; 2
    sta    AUDC1                 ; 3
    lda    #$07                  ; 2
    sta    AUDF1                 ; 3
    lda    #$0D                  ; 2
    sta    AUDV1                 ; 3
    rts                          ; 6

LF8DE:
    lda    ram_AF                ; 3
    cmp    #$01                  ; 2
    bne    LF8E5                 ; 2³
    rts                          ; 6

LF8E5:
    dec    ram_AF                ; 5
    jsr    LF58C                 ; 6
    inc    ram_AF                ; 5
    stx    ram_B2                ; 3
    sty    ram_B3                ; 3
    lda    ram_92,X              ; 4
LF8F2:
    asl                          ; 2
    dey                          ; 2
    bne    LF8F2                 ; 2³
    bcs    LF8F9                 ; 2³
    rts                          ; 6

LF8F9:
    lda    #$D8                  ; 2
    sta    ram_86                ; 3
    lda    #$F3                  ; 2
    sta    ram_87                ; 3
    lda    #$40                  ; 2
    sta    ram_AA                ; 3
    lda    #$F4                  ; 2
    sta    ram_AB                ; 3
    lda    #$00                  ; 2
    sta    ram_B0                ; 3
    lda    ram_C7                ; 3
    ora    #$80                  ; 2
    sta    ram_C7                ; 3
    lda    #$03                  ; 2
    sta    AUDC1                 ; 3
    lda    #$07                  ; 2
    sta    AUDF1                 ; 3
    lda    #$0D                  ; 2
    sta    AUDV1                 ; 3
    rts                          ; 6

LF920:
    lda    ram_81                ; 3
    and    #$07                  ; 2
    cmp    #$06                  ; 2
    beq    LF929                 ; 2³
    rts                          ; 6

LF929:
    lda    ram_C7                ; 3
    bmi    LF92E                 ; 2³
    rts                          ; 6

LF92E:
    ldy    #$07                  ; 2
    sty    AUDF1                 ; 3
    cmp    #$FE                  ; 2
    bne    LF939                 ; 2³
    jmp    LF94A                 ; 3

LF939:
    cmp    #$FD                  ; 2
    bne    LF940                 ; 2³
    jmp    LF984                 ; 3

LF940:
    cmp    #$FB                  ; 2
    bne    LF947                 ; 2³
    jmp    LF9BE                 ; 3

LF947:
    jmp    LFA0F                 ; 3

LF94A:
    ldx    ram_B2                ; 3
    ldy    ram_B3                ; 3
    cpx    #$02                  ; 2
    bcs    LF955                 ; 2³
    jmp    LFA60                 ; 3

LF955:
    dex                          ; 2
    dex                          ; 2
    lda    ram_92,X              ; 4
LF959:
    asl                          ; 2
    dey                          ; 2
    bne    LF959                 ; 2³
    bcc    LF962                 ; 2³
    jmp    LFA60                 ; 3

LF962:
    ldx    ram_B2                ; 3
    ldy    ram_B3                ; 3
    lda    #$80                  ; 2
    dey                          ; 2
LF969:
    lsr                          ; 2
    dey                          ; 2
    bne    LF969                 ; 2³
    sta    ram_AD                ; 3
    eor    #$FF                  ; 2
    and    ram_92,X              ; 4
    sta    ram_92,X              ; 4
    dex                          ; 2
    dex                          ; 2
    stx    ram_B2                ; 3
    lda    ram_AD                ; 3
    ora    ram_92,X              ; 4
    sta    ram_92,X              ; 4
    lda    #$00                  ; 2
    sta    ram_C8                ; 3
    rts                          ; 6

LF984:
    ldx    ram_B2                ; 3
    ldy    ram_B3                ; 3
    cpx    #$0E                  ; 2
    bcc    LF98F                 ; 2³
    jmp    LFA60                 ; 3

LF98F:
    inx                          ; 2
    inx                          ; 2
    lda    ram_92,X              ; 4
LF993:
    asl                          ; 2
    dey                          ; 2
    bne    LF993                 ; 2³
    bcc    LF99C                 ; 2³
    jmp    LFA60                 ; 3

LF99C:
    ldx    ram_B2                ; 3
    ldy    ram_B3                ; 3
    lda    #$80                  ; 2
    dey                          ; 2
LF9A3:
    lsr                          ; 2
    dey                          ; 2
    bne    LF9A3                 ; 2³
    sta    ram_AD                ; 3
    eor    #$FF                  ; 2
    and    ram_92,X              ; 4
    sta    ram_92,X              ; 4
    inx                          ; 2
    inx                          ; 2
    stx    ram_B2                ; 3
    lda    ram_AD                ; 3
    ora    ram_92,X              ; 4
    sta    ram_92,X              ; 4
    lda    #$00                  ; 2
    sta    ram_C8                ; 3
    rts                          ; 6

LF9BE:
    ldx    ram_B2                ; 3
    ldy    ram_B3                ; 3
    cpy    #$04                  ; 2
    bne    LF9D2                 ; 2³
    lda    ram_B2                ; 3
    and    #$01                  ; 2
    bne    LF9CF                 ; 2³
    jmp    LFA60                 ; 3

LF9CF:
    dex                          ; 2
    ldy    #$09                  ; 2
LF9D2:
    dey                          ; 2
    lda    ram_92,X              ; 4
LF9D5:
    asl                          ; 2
    dey                          ; 2
    bne    LF9D5                 ; 2³
    bcc    LF9DE                 ; 2³
    jmp    LFA60                 ; 3

LF9DE:
    ldx    ram_B2                ; 3
    ldy    ram_B3                ; 3
    lda    #$80                  ; 2
    dey                          ; 2
LF9E5:
    lsr                          ; 2
    dey                          ; 2
    bne    LF9E5                 ; 2³
    eor    #$FF                  ; 2
    and    ram_92,X              ; 4
    sta    ram_92,X              ; 4
    ldy    ram_B3                ; 3
    ldx    ram_B2                ; 3
    cpy    #$04                  ; 2
    bne    LF9FC                 ; 2³
    dex                          ; 2
    stx    ram_B2                ; 3
    ldy    #$09                  ; 2
LF9FC:
    dey                          ; 2
    sty    ram_B3                ; 3
    lda    #$80                  ; 2
    dey                          ; 2
LFA02:
    lsr                          ; 2
    dey                          ; 2
    bne    LFA02                 ; 2³
    ora    ram_92,X              ; 4
    sta    ram_92,X              ; 4
    lda    #$00                  ; 2
    sta    ram_C8                ; 3
    rts                          ; 6

LFA0F:
    ldx    ram_B2                ; 3
    ldy    ram_B3                ; 3
    cpy    #$08                  ; 2
    bne    LFA23                 ; 2³
    lda    ram_B2                ; 3
    and    #$01                  ; 2
    beq    LFA20                 ; 2³
    jmp    LFA60                 ; 3

LFA20:
    inx                          ; 2
    ldy    #$03                  ; 2
LFA23:
    iny                          ; 2
    lda    ram_92,X              ; 4
LFA26:
    asl                          ; 2
    dey                          ; 2
    bne    LFA26                 ; 2³
    bcc    LFA2F                 ; 2³
    jmp    LFA60                 ; 3

LFA2F:
    ldx    ram_B2                ; 3
    ldy    ram_B3                ; 3
    lda    #$80                  ; 2
    dey                          ; 2
LFA36:
    lsr                          ; 2
    dey                          ; 2
    bne    LFA36                 ; 2³
    eor    #$FF                  ; 2
    and    ram_92,X              ; 4
    sta    ram_92,X              ; 4
    ldy    ram_B3                ; 3
    ldx    ram_B2                ; 3
    cpy    #$08                  ; 2
    bne    LFA4D                 ; 2³
    inx                          ; 2
    stx    ram_B2                ; 3
    ldy    #$03                  ; 2
LFA4D:
    iny                          ; 2
    sty    ram_B3                ; 3
    lda    #$80                  ; 2
    dey                          ; 2
LFA53:
    lsr                          ; 2
    dey                          ; 2
    bne    LFA53                 ; 2³
    ora    ram_92,X              ; 4
    sta    ram_92,X              ; 4
    lda    #$00                  ; 2
    sta    ram_C8                ; 3
    rts                          ; 6

LFA60:
    lda    ram_C8                ; 3
    beq    LFA8A                 ; 2³
    lda    ram_81                ; 3
    and    #$1F                  ; 2
    cmp    #$06                  ; 2
    bne    LFA8A                 ; 2³
    ldx    ram_B2                ; 3
    ldy    ram_B3                ; 3
    lda    #$80                  ; 2
    dey                          ; 2
LFA73:
    lsr                          ; 2
    dey                          ; 2
    bne    LFA73                 ; 2³
    eor    #$FF                  ; 2
    and    ram_92,X              ; 4
    sta    ram_92,X              ; 4
    jsr    LFB10                 ; 6
    lda    #$05                  ; 2
    sta    AUDF1                 ; 3
    lda    #$0B                  ; 2
    sta    AUDV1                 ; 3
    bne    LFA8E                 ; 3   always branch

LFA8A:
    lda    #$00                  ; 2
    sta    AUDV1                 ; 3
LFA8E:
    lda    #$00                  ; 2
    sta    ram_C7                ; 3
    rts                          ; 6

LFA93:
    lda    ram_81                ; 3
    and    #$07                  ; 2
    cmp    #$07                  ; 2
    beq    LFA9C                 ; 2³
    rts                          ; 6

LFA9C:
    lda    ram_C7                ; 3
    bmi    LFAA1                 ; 2³
    rts                          ; 6

LFAA1:
    ldx    #$03                  ; 2
LFAA3:
    lda    ram_BD,X              ; 4
    beq    LFAE2                 ; 2³
    lda    ram_C2,X              ; 4
    and    #$0F                  ; 2
    sta    ram_AD                ; 3
    lda    ram_B2                ; 3
    lsr                          ; 2
    bcs    LFAB6                 ; 2³
    lda    #$00                  ; 2
    beq    LFAB8                 ; 3   always branch

LFAB6:
    lda    #$05                  ; 2
LFAB8:
    clc                          ; 2
    adc    ram_B3                ; 3
    sec                          ; 2
    sbc    #$03                  ; 2
    cmp    ram_AD                ; 3
    bne    LFAE2                 ; 2³
    lda    ram_C2,X              ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_AD                ; 3
    dec    ram_AD                ; 5
    lda    ram_B2                ; 3
    lsr                          ; 2
    cmp    ram_AD                ; 3
    bne    LFAE2                 ; 2³
    lda    #$00                  ; 2
    sta    ram_BD,X              ; 4
    lda    #$01                  ; 2
    sta    ram_C2,X              ; 4
    lda    #$01                  ; 2
    sta    AUDF1                 ; 3
    jsr    LFAE6                 ; 6
LFAE2:
    dex                          ; 2
    bpl    LFAA3                 ; 2³
    rts                          ; 6

LFAE6:
    sed                          ; 2
    clc                          ; 2
    ldy    ram_CF                ; 3
    lda.wy ram_C9,Y              ; 4
    ldy    ram_DD                ; 3
    adc    LFB08,Y               ; 4
    ldy    ram_CF                ; 3
    sta.wy ram_C9,Y              ; 5
    lda.wy ram_CB,Y              ; 4
    ldy    ram_DD                ; 3
    adc    LFB0C,Y               ; 4
    ldy    ram_CF                ; 3
    sta.wy ram_CB,Y              ; 5
    cld                          ; 2
    inc    ram_DD                ; 5
    rts                          ; 6

LFB08:
    .byte $10 ; |   X    | $FB08
    .byte $40 ; | X      | $FB09
    .byte $60 ; | XX     | $FB0A
    .byte $40 ; | X      | $FB0B
LFB0C:
    .byte $00 ; |        | $FB0C
    .byte $00 ; |        | $FB0D
    .byte $01 ; |       X| $FB0E
    .byte $06 ; |     XX | $FB0F

LFB10:
    sed                          ; 2
    clc                          ; 2
    ldy    ram_CF                ; 3
    lda.wy ram_C9,Y              ; 4
    adc    #$01                  ; 2
    sta.wy ram_C9,Y              ; 5
    lda.wy ram_CB,Y              ; 4
    adc    #$00                  ; 2
    sta.wy ram_CB,Y              ; 5
    cld                          ; 2
    rts                          ; 6

LFB26:
    lda    ram_81                ; 3
    and    #$07                  ; 2
    cmp    #$07                  ; 2
    beq    LFB2F                 ; 2³
    rts                          ; 6

LFB2F:
    ldy    ram_CF                ; 3
    lda.wy ram_C9,Y              ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$94                  ; 2
    sta    ram_90                ; 3
    lda.wy ram_C9,Y              ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    adc    #$94                  ; 2
    sta    ram_8E                ; 3
    lda.wy ram_CB,Y              ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$94                  ; 2
    sta    ram_8C                ; 3
    lda.wy ram_CB,Y              ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    adc    #$94                  ; 2
    sta    ram_8A                ; 3
    rts                          ; 6

LFB5E:
    lda    ram_D0                ; 3
    bne    LFB9B                 ; 2³
    lda    ram_81                ; 3
    and    #$07                  ; 2
    cmp    #$07                  ; 2
    beq    LFB6B                 ; 2³
    rts                          ; 6

LFB6B:
    lda    ram_C7                ; 3
    bpl    LFB70                 ; 2³
    rts                          ; 6

LFB70:
    ldy    #$00                  ; 2
    ldx    #$03                  ; 2
LFB74:
    lda    ram_BD,X              ; 4
    bne    LFB79                 ; 2³
    iny                          ; 2
LFB79:
    dex                          ; 2
    bpl    LFB74                 ; 2³
    cpy    #$04                  ; 2
    beq    LFB81                 ; 2³
    rts                          ; 6

LFB81:
    lda    #$0D                  ; 2
    sta    ram_D0                ; 3
    ldx    ram_CF                ; 3
    inc    ram_CD,X              ; 6
    lda    ram_CD,X              ; 4
    and    #$0F                  ; 2
    sta    ram_CD,X              ; 4
    jsr    LFBF7                 ; 6
    lda    #$00                  ; 2
    sta    AUDV0                 ; 3
    sta    ram_81                ; 3
    jmp    LFBDE                 ; 3

LFB9B:
    lda    ram_81                ; 3
    and    #$07                  ; 2
    bne    LFBDE                 ; 2³
    dec    ram_D0                ; 5
    ldx    ram_D0                ; 3
    lda    LFBEA,X               ; 4
    sta    AUDF1                 ; 3
    lda    #$04                  ; 2
    sta    AUDC1                 ; 3
    lda    #$0F                  ; 2
    sta    AUDV1                 ; 3
    dex                          ; 2
    bpl    LFBDE                 ; 2³
    lda    #$00                  ; 2
    sta    ram_D0                ; 3
    sta    ram_AC                ; 3
    sta    ram_82                ; 3
    sta    ram_C6                ; 3
    sta    ram_C1                ; 3
    sta    ram_B4                ; 3
    sta    ram_C7                ; 3
    sta    ram_C8                ; 3
    sta    AUDV1                 ; 3
    lda    #$0F                  ; 2
    sta    AUDV0                 ; 3
    lda    #$1F                  ; 2
    sta    ram_D8                ; 3
    lda    #$2F                  ; 2
    sta    ram_D9                ; 3
    lda    #$4F                  ; 2
    sta    ram_DA                ; 3
    lda    #$8F                  ; 2
    sta    ram_DB                ; 3
    rts                          ; 6

LFBDE:
    pla                          ; 4
    pla                          ; 4
    lda    #$F0                  ; 2
    pha                          ; 3
    lda    #$49                  ; 2
    sec                          ; 2
    sbc    #$01                  ; 2
    pha                          ; 3
    rts                          ; 6

LFBEA:
    .byte $00 ; |        | $FBEA
    .byte $00 ; |        | $FBEB
    .byte $17 ; |   X XXX| $FBEC
    .byte $17 ; |   X XXX| $FBED
    .byte $17 ; |   X XXX| $FBEE
    .byte $17 ; |   X XXX| $FBEF
    .byte $13 ; |   X  XX| $FBF0
    .byte $15 ; |   X X X| $FBF1
    .byte $15 ; |   X X X| $FBF2
    .byte $13 ; |   X  XX| $FBF3
    .byte $15 ; |   X X X| $FBF4
    .byte $15 ; |   X X X| $FBF5
    .byte $13 ; |   X  XX| $FBF6

LFBF7:
    ldy    ram_CF                ; 3
    lda.wy ram_CD,Y              ; 4
    asl                          ; 2
    tax                          ; 2
    lda    LFE70,X               ; 4
    sta    ram_88                ; 3
    lda    LFE71,X               ; 4
    sta    ram_89                ; 3
    ldy    #$00                  ; 2
LFC0A:
    lda    (ram_88),Y            ; 5
    sta.wy ram_92,Y              ; 5
    iny                          ; 2
    cpy    #$10                  ; 2
    bne    LFC0A                 ; 2³
    ldx    #$00                  ; 2
LFC16:
    lda    (ram_88),Y            ; 5
    sta    ram_C2,X              ; 4
    inx                          ; 2
    iny                          ; 2
    cpy    #$14                  ; 2
    bne    LFC16                 ; 2³
    lda    (ram_88),Y            ; 5
    sta    ram_84                ; 3
    iny                          ; 2
    lda    (ram_88),Y            ; 5
    sta    ram_AF                ; 3
    lda    #$B8                  ; 2
    sta    ram_86                ; 3
    lda    #$F3                  ; 2
    sta    ram_87                ; 3
    lda    #$20                  ; 2
    sta    ram_AA                ; 3
    lda    #$F4                  ; 2
    sta    ram_AB                ; 3
    lda    #$F3                  ; 2
    sta    ram_89                ; 3
    lda    #$F0                  ; 2
    sta    ram_B9                ; 3
    sta    ram_BA                ; 3
    sta    ram_BB                ; 3
    sta    ram_BC                ; 3
    lda    #$2A                  ; 2
    sta    ram_DC                ; 3
    lda    #$46                  ; 2
    sta    ram_BD                ; 3
    lda    #$86                  ; 2
    sta    ram_BE                ; 3
    lda    #$7A                  ; 2
    sta    ram_BF                ; 3
    lda    #$36                  ; 2
    sta    ram_C0                ; 3
    rts                          ; 6

LFC5C:
    lda    ram_D1                ; 3
    bne    LFC7C                 ; 2³
    lda    CXPPMM                ; 3
    bmi    LFC65                 ; 2³
    rts                          ; 6

LFC65:
    lda    #$04                  ; 2
    sta    ram_D1                ; 3
    lda    #$00                  ; 2
    sta    ram_81                ; 3
    lda    #$06                  ; 2
    sta    AUDC1                 ; 3
    lda    #$03                  ; 2
    sta    AUDF1                 ; 3
    lda    #$0D                  ; 2
    sta    AUDV1                 ; 3
    jmp    LFBDE                 ; 3

LFC7C:
    cmp    #$FF                  ; 2
    bne    LFC8D                 ; 2³
    lda    ram_81                ; 3
    bne    LFC8A                 ; 2³
    lda    ram_CF                ; 3
    eor    ram_80                ; 3
    sta    ram_CF                ; 3
LFC8A:
    jmp    LFBDE                 ; 3

LFC8D:
    ldx    #$03                  ; 2
    lda    ram_81                ; 3
    and    #$0F                  ; 2
    beq    LFC98                 ; 2³
    jmp    LFBDE                 ; 3

LFC98:
    sta    ram_BD,X              ; 4
    dex                          ; 2
    bpl    LFC98                 ; 2³
    sta    CXCLR                 ; 3
    sta    AUDV0                 ; 3
    lda    ram_D1                ; 3
    asl                          ; 2
    tax                          ; 2
    lda    LFD16,X               ; 4
    sta    ram_86                ; 3
    lda    LFD17,X               ; 4
    sta    ram_87                ; 3
    lda    #$04                  ; 2
    sta    ram_AA                ; 3
    lda    #$FD                  ; 2
    sta    ram_AB                ; 3
    lda    LFD0C,X               ; 4
    sta    AUDF1                 ; 3
    dec    ram_D1                ; 5
    beq    LFCC3                 ; 2³
    jmp    LFBDE                 ; 3

LFCC3:
    lda    #$00                  ; 2
    sta    AUDV1                 ; 3
    ldx    ram_CF                ; 3
    dec    ram_D2,X              ; 6
    bne    LFCD8                 ; 2³
    cpx    ram_80                ; 3
    bne    LFCD8                 ; 2³
    lda    #$FF                  ; 2
    sta    ram_D1                ; 3
    jmp    LFBDE                 ; 3

LFCD8:
    lda    ram_80                ; 3
    eor    ram_CF                ; 3
    sta    ram_CF                ; 3
    tax                          ; 2
    dec    ram_CD,X              ; 6
    jmp    LFB81                 ; 3

    .byte $00 ; |        | $FCE4
    .byte $00 ; |        | $FCE5
    .byte $00 ; |        | $FCE6
    .byte $00 ; |        | $FCE7
    .byte $00 ; |        | $FCE8
    .byte $00 ; |        | $FCE9
    .byte $00 ; |        | $FCEA
    .byte $00 ; |        | $FCEB
    .byte $00 ; |        | $FCEC
    .byte $52 ; | X X  X | $FCED
    .byte $00 ; |        | $FCEE
    .byte $02 ; |      X | $FCEF
    .byte $40 ; | X      | $FCF0
    .byte $00 ; |        | $FCF1
    .byte $4A ; | X  X X | $FCF2
    .byte $00 ; |        | $FCF3
    .byte $00 ; |        | $FCF4
    .byte $00 ; |        | $FCF5
    .byte $24 ; |  X  X  | $FCF6
    .byte $00 ; |        | $FCF7
    .byte $00 ; |        | $FCF8
    .byte $24 ; |  X  X  | $FCF9
    .byte $00 ; |        | $FCFA
    .byte $00 ; |        | $FCFB
    .byte $00 ; |        | $FCFC
    .byte $00 ; |        | $FCFD
    .byte $00 ; |        | $FCFE
    .byte $18 ; |   XX   | $FCFF
    .byte $18 ; |   XX   | $FD00
    .byte $00 ; |        | $FD01
    .byte $00 ; |        | $FD02
    .byte $00 ; |        | $FD03
    .byte $68 ; | XX X   | $FD04
    .byte $68 ; | XX X   | $FD05
    .byte $68 ; | XX X   | $FD06
    .byte $68 ; | XX X   | $FD07
    .byte $68 ; | XX X   | $FD08
    .byte $68 ; | XX X   | $FD09
    .byte $68 ; | XX X   | $FD0A
    .byte $68 ; | XX X   | $FD0B
LFD0C:
    .byte $00 ; |        | $FD0C
    .byte $00 ; |        | $FD0D
    .byte $00 ; |        | $FD0E
    .byte $00 ; |        | $FD0F
    .byte $09 ; |    X  X| $FD10
    .byte $09 ; |    X  X| $FD11
    .byte $07 ; |     XXX| $FD12
    .byte $07 ; |     XXX| $FD13
    .byte $05 ; |     X X| $FD14
    .byte $05 ; |     X X| $FD15
LFD16:
    .byte $E4 ; |XXX  X  | $FD16
LFD17:
    .byte $FC ; |XXXXXX  | $FD17
    .byte $E4 ; |XXX  X  | $FD18
    .byte $FC ; |XXXXXX  | $FD19
    .byte $EC ; |XXX XX  | $FD1A
    .byte $FC ; |XXXXXX  | $FD1B
    .byte $F4 ; |XXXX X  | $FD1C
    .byte $FC ; |XXXXXX  | $FD1D
    .byte $FC ; |XXXXXX  | $FD1E
    .byte $FC ; |XXXXXX  | $FD1F

LFD20:
    lda    ram_81                ; 3
    ldx    ram_CF                ; 3
    and    ram_D6,X              ; 4
    cmp    #$02                  ; 2
    beq    LFD2B                 ; 2³
    rts                          ; 6

LFD2B:
    lda    ram_C7                ; 3
    bpl    LFD30                 ; 2³
    rts                          ; 6

LFD30:
    jsr    LF7C9                 ; 6
    ldx    ram_C6                ; 3
    lda    ram_B4                ; 3
    and    ram_D8,X              ; 4
    sta    ram_AD                ; 3
    lda    ram_D8,X              ; 4
    eor    #$0F                  ; 2
    and    ram_B4                ; 3
    eor    #$0F                  ; 2
    sta    ram_D8,X              ; 4
    lda    #$F0                  ; 2
    sta    ram_AE                ; 3
    lda    ram_B2                ; 3
    cmp    ram_84                ; 3
    beq    LFD5F                 ; 2³
    bcs    LFD59                 ; 2³
    lda    #$02                  ; 2
    ora    ram_AE                ; 3
    sta    ram_AE                ; 3
    bne    LFD5F                 ; 2³
LFD59:
    lda    #$01                  ; 2
    ora    ram_AE                ; 3
    sta    ram_AE                ; 3
LFD5F:
    lda    ram_B3                ; 3
    cmp    ram_AF                ; 3
    beq    LFD75                 ; 2³
    bcs    LFD6F                 ; 2³
    lda    #$08                  ; 2
    ora    ram_AE                ; 3
    sta    ram_AE                ; 3
    bne    LFD75                 ; 2³
LFD6F:
    lda    #$04                  ; 2
    ora    ram_AE                ; 3
    sta    ram_AE                ; 3
LFD75:
    lda    ram_AE                ; 3
    and    ram_AD                ; 3
    and    #$0F                  ; 2
    beq    LFD82                 ; 2³
    sta    ram_AD                ; 3
    jmp    LFDCA                 ; 3

LFD82:
    lda    ram_AD                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_AE                ; 3
    and    ram_AD                ; 3
    beq    LFD93                 ; 2³
    sta    ram_AD                ; 3
    jmp    LFDCA                 ; 3

LFD93:
    lda    ram_AE                ; 3
    and    ram_B4                ; 3
    bne    LFDB3                 ; 2³
    lda    ram_AE                ; 3
    cmp    #$01                  ; 2
    bne    LFDA2                 ; 2³
    asl                          ; 2
    bne    LFDB1                 ; 2³
LFDA2:
    cmp    #$02                  ; 2
    bne    LFDA9                 ; 2³
    lsr                          ; 2
    bne    LFDB1                 ; 2³
LFDA9:
    cmp    #$04                  ; 2
    bne    LFDB0                 ; 2³
    asl                          ; 2
    bne    LFDB1                 ; 2³
LFDB0:
    lsr                          ; 2
LFDB1:
    sta    ram_AE                ; 3
LFDB3:
    lda    ram_AD                ; 3
    and    #$0F                  ; 2
    beq    LFDBE                 ; 2³
    sta    ram_AD                ; 3
    jmp    LFDCA                 ; 3

LFDBE:
    lda    ram_AE                ; 3
    and    ram_B4                ; 3
    beq    LFDC9                 ; 2³
    sta    ram_AD                ; 3
    jmp    LFDCA                 ; 3

LFDC9:
    rts                          ; 6

LFDCA:
    lda    ram_AD                ; 3
    lsr                          ; 2
    bcc    LFDD2                 ; 2³
    jmp    LF514                 ; 3

LFDD2:
    lsr                          ; 2
    bcc    LFDD8                 ; 2³
    jmp    LF52A                 ; 3

LFDD8:
    lsr                          ; 2
    bcc    LFDDE                 ; 2³
    jmp    LF540                 ; 3

LFDDE:
    jmp    LF55A                 ; 3

LFDE1:
    ldx    #$07                  ; 2
    lda    #$0F                  ; 2
    sta    ram_D6                ; 3
    sta    ram_D7                ; 3
    lda    SWCHB                 ; 4
    bmi    LFDF0                 ; 2³
    stx    ram_D6                ; 3
LFDF0:
    and    #$40                  ; 2
    bne    LFDF6                 ; 2³
    stx    ram_D7                ; 3
LFDF6:
    lda    SWCHB                 ; 4
    and    #$02                  ; 2
    eor    ram_DE                ; 3
    and    #$02                  ; 2
    beq    LFE12                 ; 2³
    eor    ram_DE                ; 3
    sta    ram_DE                ; 3
    and    #$02                  ; 2
    bne    LFE12                 ; 2³
    lda    ram_80                ; 3
    eor    #$01                  ; 2
    sta    ram_80                ; 3
    jmp    LFE29                 ; 3

LFE12:
    lda    SWCHB                 ; 4
    and    #$01                  ; 2
    eor    ram_DE                ; 3
    and    #$01                  ; 2
    beq    LFE28                 ; 2³
    eor    ram_DE                ; 3
    sta    ram_DE                ; 3
    and    #$01                  ; 2
    bne    LFE28                 ; 2³
    jmp    LFE29                 ; 3

LFE28:
    rts                          ; 6

LFE29:
    lda    #$00                  ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    sta    CXCLR                 ; 3
    sta    ram_E6                ; 3
    ldx    #$00                  ; 2
LFE35:
    sta    ram_C9,X              ; 4
    inx                          ; 2
    cpx    #$09                  ; 2
    bne    LFE35                 ; 2³
    lda    #$80                  ; 2
    sta    ram_DF                ; 3
    lda    #$03                  ; 2
    sta    ram_D2                ; 3
    ldy    ram_80                ; 3
    bne    LFE4A                 ; 2³
    lda    #$00                  ; 2
LFE4A:
    sta    ram_D3                ; 3
    jsr    LFBF7                 ; 6
    lda    #$0D                  ; 2
    sta    ram_D0                ; 3
    jmp    LFBDE                 ; 3

    .byte $00 ; |        | $FE56
    .byte $00 ; |        | $FE57
    .byte $00 ; |        | $FE58
    .byte $00 ; |        | $FE59
    .byte $00 ; |        | $FE5A
    .byte $00 ; |        | $FE5B
    .byte $00 ; |        | $FE5C
    .byte $00 ; |        | $FE5D
    .byte $00 ; |        | $FE5E
    .byte $00 ; |        | $FE5F
    .byte $00 ; |        | $FE60
    .byte $00 ; |        | $FE61
    .byte $00 ; |        | $FE62
    .byte $00 ; |        | $FE63
    .byte $00 ; |        | $FE64
    .byte $00 ; |        | $FE65
    .byte $00 ; |        | $FE66
    .byte $00 ; |        | $FE67
    .byte $00 ; |        | $FE68
    .byte $00 ; |        | $FE69
    .byte $00 ; |        | $FE6A
    .byte $00 ; |        | $FE6B
    .byte $00 ; |        | $FE6C
    .byte $00 ; |        | $FE6D
    .byte $00 ; |        | $FE6E
    .byte $00 ; |        | $FE6F
LFE70:
    .byte $90 ; |X  X    | $FE70
LFE71:
    .byte $FE ; |XXXXXXX | $FE71
    .byte $BC ; |X XXXX  | $FE72
    .byte $FE ; |XXXXXXX | $FE73
    .byte $A6 ; |X X  XX | $FE74
    .byte $FE ; |XXXXXXX | $FE75
    .byte $FE ; |XXXXXXX | $FE76
    .byte $FE ; |XXXXXXX | $FE77
    .byte $DA ; |XX XX X | $FE78
    .byte $FF ; |XXXXXXXX| $FE79
    .byte $2A ; |  X X X | $FE7A
    .byte $FF ; |XXXXXXXX| $FE7B
    .byte $C4 ; |XX   X  | $FE7C
    .byte $FF ; |XXXXXXXX| $FE7D
    .byte $14 ; |   X X  | $FE7E
    .byte $FF ; |XXXXXXXX| $FE7F
    .byte $98 ; |X  XX   | $FE80
    .byte $FF ; |XXXXXXXX| $FE81
    .byte $E8 ; |XXX X   | $FE82
    .byte $FE ; |XXXXXXX | $FE83
    .byte $82 ; |X     X | $FE84
    .byte $FF ; |XXXXXXXX| $FE85
    .byte $40 ; | X      | $FE86
    .byte $FF ; |XXXXXXXX| $FE87
    .byte $AE ; |X X XXX | $FE88
    .byte $FF ; |XXXXXXXX| $FE89
    .byte $D2 ; |XX X  X | $FE8A
    .byte $FE ; |XXXXXXX | $FE8B
    .byte $56 ; | X X XX | $FE8C
    .byte $FF ; |XXXXXXXX| $FE8D
    .byte $6C ; | XX XX  | $FE8E
    .byte $FF ; |XXXXXXXX| $FE8F
    .byte $02 ; |      X | $FE90
    .byte $10 ; |   X    | $FE91
    .byte $1A ; |   XX X | $FE92
    .byte $1E ; |   XXXX | $FE93
    .byte $02 ; |      X | $FE94
    .byte $00 ; |        | $FE95
    .byte $0E ; |    XXX | $FE96
    .byte $1A ; |   XX X | $FE97
    .byte $00 ; |        | $FE98
    .byte $0A ; |    X X | $FE99
    .byte $1A ; |   XX X | $FE9A
    .byte $0A ; |    X X | $FE9B
    .byte $0B ; |    X XX| $FE9C
    .byte $0B ; |    X XX| $FE9D
    .byte $02 ; |      X | $FE9E
    .byte $08 ; |    X   | $FE9F
    .byte $11 ; |   X   X| $FEA0
    .byte $1A ; |   XX X | $FEA1
    .byte $81 ; |X      X| $FEA2
    .byte $8A ; |X   X X | $FEA3
    .byte $04 ; |     X  | $FEA4
    .byte $05 ; |     X X| $FEA5
    .byte $01 ; |       X| $FEA6
    .byte $02 ; |      X | $FEA7
    .byte $0B ; |    X XX| $FEA8
    .byte $0E ; |    XXX | $FEA9
    .byte $09 ; |    X  X| $FEAA
    .byte $00 ; |        | $FEAB
    .byte $0D ; |    XX X| $FEAC
    .byte $16 ; |   X XX | $FEAD
    .byte $00 ; |        | $FEAE
    .byte $04 ; |     X  | $FEAF
    .byte $0E ; |    XXX | $FEB0
    .byte $04 ; |     X  | $FEB1
    .byte $18 ; |   XX   | $FEB2
    .byte $1C ; |   XXX  | $FEB3
    .byte $00 ; |        | $FEB4
    .byte $00 ; |        | $FEB5
    .byte $13 ; |   X  XX| $FEB6
    .byte $3A ; |  XXX X | $FEB7
    .byte $51 ; | X X   X| $FEB8
    .byte $88 ; |X   X   | $FEB9
    .byte $05 ; |     X X| $FEBA
    .byte $05 ; |     X X| $FEBB
    .byte $00 ; |        | $FEBC
    .byte $00 ; |        | $FEBD
    .byte $0B ; |    X XX| $FEBE
    .byte $1E ; |   XXXX | $FEBF
    .byte $08 ; |    X   | $FEC0
    .byte $08 ; |    X   | $FEC1
    .byte $0A ; |    X X | $FEC2
    .byte $0A ; |    X X | $FEC3
    .byte $0A ; |    X X | $FEC4
    .byte $0A ; |    X X | $FEC5
    .byte $02 ; |      X | $FEC6
    .byte $02 ; |      X | $FEC7
    .byte $0F ; |    XXXX| $FEC8
    .byte $1A ; |   XX X | $FEC9
    .byte $00 ; |        | $FECA
    .byte $00 ; |        | $FECB
    .byte $11 ; |   X   X| $FECC
    .byte $1A ; |   XX X | $FECD
    .byte $81 ; |X      X| $FECE
    .byte $8A ; |X   X X | $FECF
    .byte $04 ; |     X  | $FED0
    .byte $05 ; |     X X| $FED1
    .byte $00 ; |        | $FED2
    .byte $00 ; |        | $FED3
    .byte $0E ; |    XXX | $FED4
    .byte $0E ; |    XXX | $FED5
    .byte $08 ; |    X   | $FED6
    .byte $02 ; |      X | $FED7
    .byte $01 ; |       X| $FED8
    .byte $10 ; |   X    | $FED9
    .byte $01 ; |       X| $FEDA
    .byte $10 ; |   X    | $FEDB
    .byte $08 ; |    X   | $FEDC
    .byte $02 ; |      X | $FEDD
    .byte $0E ; |    XXX | $FEDE
    .byte $0E ; |    XXX | $FEDF
    .byte $00 ; |        | $FEE0
    .byte $00 ; |        | $FEE1
    .byte $18 ; |   XX   | $FEE2
    .byte $31 ; |  XX   X| $FEE3
    .byte $6A ; | XX X X | $FEE4
    .byte $83 ; |X     XX| $FEE5
    .byte $04 ; |     X  | $FEE6
    .byte $07 ; |     XXX| $FEE7
    .byte $00 ; |        | $FEE8
    .byte $00 ; |        | $FEE9
    .byte $0E ; |    XXX | $FEEA
    .byte $02 ; |      X | $FEEB
    .byte $04 ; |     X  | $FEEC
    .byte $00 ; |        | $FEED
    .byte $04 ; |     X  | $FEEE
    .byte $00 ; |        | $FEEF
    .byte $00 ; |        | $FEF0
    .byte $04 ; |     X  | $FEF1
    .byte $00 ; |        | $FEF2
    .byte $04 ; |     X  | $FEF3
    .byte $08 ; |    X   | $FEF4
    .byte $0E ; |    XXX | $FEF5
    .byte $00 ; |        | $FEF6
    .byte $00 ; |        | $FEF7
    .byte $15 ; |   X X X| $FEF8
    .byte $4A ; | X  X X | $FEF9
    .byte $51 ; | X X   X| $FEFA
    .byte $86 ; |X    XX | $FEFB
    .byte $05 ; |     X X| $FEFC
    .byte $07 ; |     XXX| $FEFD
    .byte $00 ; |        | $FEFE
    .byte $00 ; |        | $FEFF
    .byte $0B ; |    X XX| $FF00
    .byte $1E ; |   XXXX | $FF01
    .byte $0A ; |    X X | $FF02
    .byte $02 ; |      X | $FF03
    .byte $0A ; |    X X | $FF04
    .byte $0A ; |    X X | $FF05
    .byte $0B ; |    X XX| $FF06
    .byte $1A ; |   XX X | $FF07
    .byte $08 ; |    X   | $FF08
    .byte $02 ; |      X | $FF09
    .byte $0F ; |    XXXX| $FF0A
    .byte $1E ; |   XXXX | $FF0B
    .byte $00 ; |        | $FF0C
    .byte $00 ; |        | $FF0D
    .byte $35 ; |  XX X X| $FF0E
    .byte $63 ; | XX   XX| $FF0F
    .byte $81 ; |X      X| $FF10
    .byte $8A ; |X   X X | $FF11
    .byte $01 ; |       X| $FF12
    .byte $01 ; |       X| $FF13
    .byte $00 ; |        | $FF14
    .byte $00 ; |        | $FF15
    .byte $0F ; |    XXXX| $FF16
    .byte $1E ; |   XXXX | $FF17
    .byte $08 ; |    X   | $FF18
    .byte $02 ; |      X | $FF19
    .byte $08 ; |    X   | $FF1A
    .byte $02 ; |      X | $FF1B
    .byte $08 ; |    X   | $FF1C
    .byte $02 ; |      X | $FF1D
    .byte $08 ; |    X   | $FF1E
    .byte $02 ; |      X | $FF1F
    .byte $0F ; |    XXXX| $FF20
    .byte $1E ; |   XXXX | $FF21
    .byte $00 ; |        | $FF22
    .byte $00 ; |        | $FF23
    .byte $33 ; |  XX  XX| $FF24
    .byte $3A ; |  XXX X | $FF25
    .byte $61 ; | XX    X| $FF26
    .byte $68 ; | XX X   | $FF27
    .byte $04 ; |     X  | $FF28
    .byte $06 ; |     XX | $FF29
    .byte $00 ; |        | $FF2A
    .byte $00 ; |        | $FF2B
    .byte $0A ; |    X X | $FF2C
    .byte $14 ; |   X X  | $FF2D
    .byte $0A ; |    X X | $FF2E
    .byte $14 ; |   X X  | $FF2F
    .byte $05 ; |     X X| $FF30
    .byte $0A ; |    X X | $FF31
    .byte $05 ; |     X X| $FF32
    .byte $0A ; |    X X | $FF33
    .byte $0A ; |    X X | $FF34
    .byte $14 ; |   X X  | $FF35
    .byte $0A ; |    X X | $FF36
    .byte $14 ; |   X X  | $FF37
    .byte $00 ; |        | $FF38
    .byte $00 ; |        | $FF39
    .byte $11 ; |   X   X| $FF3A
    .byte $1A ; |   XX X | $FF3B
    .byte $81 ; |X      X| $FF3C
    .byte $8A ; |X   X X | $FF3D
    .byte $08 ; |    X   | $FF3E
    .byte $05 ; |     X X| $FF3F
    .byte $02 ; |      X | $FF40
    .byte $04 ; |     X  | $FF41
    .byte $08 ; |    X   | $FF42
    .byte $11 ; |   X   X| $FF43
    .byte $02 ; |      X | $FF44
    .byte $04 ; |     X  | $FF45
    .byte $08 ; |    X   | $FF46
    .byte $11 ; |   X   X| $FF47
    .byte $02 ; |      X | $FF48
    .byte $04 ; |     X  | $FF49
    .byte $08 ; |    X   | $FF4A
    .byte $11 ; |   X   X| $FF4B
    .byte $02 ; |      X | $FF4C
    .byte $04 ; |     X  | $FF4D
    .byte $08 ; |    X   | $FF4E
    .byte $11 ; |   X   X| $FF4F
    .byte $11 ; |   X   X| $FF50
    .byte $17 ; |   X XXX| $FF51
    .byte $45 ; | X   X X| $FF52
    .byte $59 ; | X XX  X| $FF53
    .byte $07 ; |     XXX| $FF54
    .byte $01 ; |       X| $FF55
    .byte $00 ; |        | $FF56
    .byte $00 ; |        | $FF57
    .byte $0F ; |    XXXX| $FF58
    .byte $1E ; |   XXXX | $FF59
    .byte $00 ; |        | $FF5A
    .byte $00 ; |        | $FF5B
    .byte $0A ; |    X X | $FF5C
    .byte $0A ; |    X X | $FF5D
    .byte $0A ; |    X X | $FF5E
    .byte $0A ; |    X X | $FF5F
    .byte $00 ; |        | $FF60
    .byte $00 ; |        | $FF61
    .byte $0F ; |    XXXX| $FF62
    .byte $1E ; |   XXXX | $FF63
    .byte $00 ; |        | $FF64
    .byte $00 ; |        | $FF65
    .byte $31 ; |  XX   X| $FF66
    .byte $3A ; |  XXX X | $FF67
    .byte $61 ; | XX    X| $FF68
    .byte $6A ; | XX X X | $FF69
    .byte $04 ; |     X  | $FF6A
    .byte $06 ; |     XX | $FF6B
    .byte $10 ; |   X    | $FF6C
    .byte $00 ; |        | $FF6D
    .byte $04 ; |     X  | $FF6E
    .byte $12 ; |   X  X | $FF6F
    .byte $09 ; |    X  X| $FF70
    .byte $04 ; |     X  | $FF71
    .byte $00 ; |        | $FF72
    .byte $00 ; |        | $FF73
    .byte $04 ; |     X  | $FF74
    .byte $12 ; |   X  X | $FF75
    .byte $09 ; |    X  X| $FF76
    .byte $04 ; |     X  | $FF77
    .byte $02 ; |      X | $FF78
    .byte $08 ; |    X   | $FF79
    .byte $10 ; |   X    | $FF7A
    .byte $01 ; |       X| $FF7B
    .byte $17 ; |   X XXX| $FF7C
    .byte $41 ; | X     X| $FF7D
    .byte $4A ; | X  X X | $FF7E
    .byte $86 ; |X    XX | $FF7F
    .byte $04 ; |     X  | $FF80
    .byte $04 ; |     X  | $FF81
    .byte $07 ; |     XXX| $FF82
    .byte $10 ; |   X    | $FF83
    .byte $0F ; |    XXXX| $FF84
    .byte $17 ; |   X XXX| $FF85
    .byte $0C ; |    XX  | $FF86
    .byte $07 ; |     XXX| $FF87
    .byte $01 ; |       X| $FF88
    .byte $10 ; |   X    | $FF89
    .byte $17 ; |   X XXX| $FF8A
    .byte $16 ; |   X XX | $FF8B
    .byte $16 ; |   X XX | $FF8C
    .byte $06 ; |     XX | $FF8D
    .byte $10 ; |   X    | $FF8E
    .byte $16 ; |   X XX | $FF8F
    .byte $1F ; |   XXXXX| $FF90
    .byte $10 ; |   X    | $FF91
    .byte $41 ; | X     X| $FF92
    .byte $47 ; | X   XXX| $FF93
    .byte $72 ; | XXX  X | $FF94
    .byte $8A ; |X   X X | $FF95
    .byte $01 ; |       X| $FF96
    .byte $0A ; |    X X | $FF97
    .byte $00 ; |        | $FF98
    .byte $02 ; |      X | $FF99
    .byte $0F ; |    XXXX| $FF9A
    .byte $1E ; |   XXXX | $FF9B
    .byte $08 ; |    X   | $FF9C
    .byte $10 ; |   X    | $FF9D
    .byte $0A ; |    X X | $FF9E
    .byte $14 ; |   X X  | $FF9F
    .byte $0A ; |    X X | $FFA0
    .byte $14 ; |   X X  | $FFA1
    .byte $02 ; |      X | $FFA2
    .byte $04 ; |     X  | $FFA3
    .byte $0F ; |    XXXX| $FFA4
    .byte $1C ; |   XXX  | $FFA5
    .byte $08 ; |    X   | $FFA6
    .byte $04 ; |     X  | $FFA7
    .byte $12 ; |   X  X | $FFA8
    .byte $61 ; | XX    X| $FFA9
    .byte $65 ; | XX  X X| $FFAA
    .byte $79 ; | XXXX  X| $FFAB
    .byte $03 ; |      XX| $FFAC
    .byte $0A ; |    X X | $FFAD
    .byte $00 ; |        | $FFAE
    .byte $00 ; |        | $FFAF
    .byte $0D ; |    XX X| $FFB0
    .byte $16 ; |   X XX | $FFB1
    .byte $0D ; |    XX X| $FFB2
    .byte $16 ; |   X XX | $FFB3
    .byte $0D ; |    XX X| $FFB4
    .byte $10 ; |   X    | $FFB5
    .byte $01 ; |       X| $FFB6
    .byte $16 ; |   X XX | $FFB7
    .byte $0D ; |    XX X| $FFB8
    .byte $16 ; |   X XX | $FFB9
    .byte $0D ; |    XX X| $FFBA
    .byte $16 ; |   X XX | $FFBB
    .byte $00 ; |        | $FFBC
    .byte $00 ; |        | $FFBD
    .byte $11 ; |   X   X| $FFBE
    .byte $4A ; | X  X X | $FFBF
    .byte $54 ; | X X X  | $FFC0
    .byte $89 ; |X   X  X| $FFC1
    .byte $05 ; |     X X| $FFC2
    .byte $01 ; |       X| $FFC3
    .byte $00 ; |        | $FFC4
    .byte $14 ; |   X X  | $FFC5
    .byte $0E ; |    XXX | $FFC6
    .byte $14 ; |   X X  | $FFC7
    .byte $00 ; |        | $FFC8
    .byte $00 ; |        | $FFC9
    .byte $0C ; |    XX  | $FFCA
    .byte $1C ; |   XXX  | $FFCB
    .byte $00 ; |        | $FFCC
    .byte $11 ; |   X   X| $FFCD
    .byte $0F ; |    XXXX| $FFCE
    .byte $10 ; |   X    | $FFCF
    .byte $00 ; |        | $FFD0
    .byte $14 ; |   X X  | $FFD1
    .byte $04 ; |     X  | $FFD2
    .byte $14 ; |   X X  | $FFD3
    .byte $11 ; |   X   X| $FFD4
    .byte $1A ; |   XX X | $FFD5
    .byte $81 ; |X      X| $FFD6
    .byte $8A ; |X   X X | $FFD7
    .byte $05 ; |     X X| $FFD8
    .byte $05 ; |     X X| $FFD9
    .byte $00 ; |        | $FFDA
    .byte $00 ; |        | $FFDB
    .byte $0B ; |    X XX| $FFDC
    .byte $1B ; |   XX XX| $FFDD
    .byte $08 ; |    X   | $FFDE
    .byte $08 ; |    X   | $FFDF
    .byte $08 ; |    X   | $FFE0
    .byte $08 ; |    X   | $FFE1
    .byte $0A ; |    X X | $FFE2
    .byte $1A ; |   XX X | $FFE3
    .byte $02 ; |      X | $FFE4
    .byte $02 ; |      X | $FFE5
    .byte $1B ; |   XX XX| $FFE6
    .byte $12 ; |   X  X | $FFE7
    .byte $00 ; |        | $FFE8
    .byte $02 ; |      X | $FFE9
    .byte $11 ; |   X   X| $FFEA
    .byte $39 ; |  XXX  X| $FFEB
    .byte $63 ; | XX   XX| $FFEC
    .byte $87 ; |X    XXX| $FFED
    .byte $05 ; |     X X| $FFEE
    .byte $05 ; |     X X| $FFEF
    .byte $C8 ; |XX  X   | $FFF0
    .byte $0A ; |    X X | $FFF1
    .byte $F0 ; |XXXX    | $FFF2
    .byte $02 ; |      X | $FFF3
    .byte $68 ; | XX X   | $FFF4
    .byte $08 ; |    X   | $FFF5
    .byte $90 ; |X  X    | $FFF6
    .byte $F0 ; |XXXX    | $FFF7
    .byte $28 ; |  X X   | $FFF8
    .byte $F0 ; |XXXX    | $FFF9
    .byte $20 ; |  X     | $FFFA
    .byte $B9 ; |X XXX  X| $FFFB
    .byte $00 ; |        | $FFFC
    .byte $F0 ; |XXXX    | $FFFD
    .byte $D0 ; |XX X    | $FFFE
    .byte $D6 ; |XX X XX | $FFFF
