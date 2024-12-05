; Jungle Hunt (Vine fixes)
; by Omegamatrix
; Using DiStella v3.0
;
;
;  NOTES:
;  - In this bug fixed version of Jungle Hunt the colors for the Hunter no longer bleeds onto the
;  vines. The color glitch was happening because the vines are drawn by the missiles, and the missiles
;  share the same color as the players. Simply replacing Missile 0 with the Ball fixed most of the problem,
;  and just a few new spots needed to be added to updated the color for the ball.
;  - A few of the Hunter's graphics were altered slightly to stop more color bleeding (i.e. the Hunters hands
;  and toes occasionally turning white on the tips).
;  - The bankswitching instructions were changed from LDA to STA, this rom *might* now possibly be compatible on a
;  modified FB2 console. A normal Jungle Hunt cartridge fails on the FB2 sometime on the scene with the dancing natives.
;
;
;
; Command Line: distella -pasfcjh1.cfg jh.1
;
; jh1.cfg contents:
;
;      ORG D000
;      CODE D000 D002
;      GFX D003 D051
;      CODE D052 DB5E
;      GFX DB5F DB95
;      CODE DB96 DC04
;      GFX DC05 DFEB
;      CODE DFEC DFF7
;      GFX DFF8 DFFF
;
;
; Command Line: newdistella -pasfcjh2.cfg jh.2
;
; jh2.cfg contents:
;
;      ORG F000
;      GFX F000 F002
;      CODE F003 FE55
;      GFX FE56 FFEB
;      CODE FFEC FFF7
;      GFX FFF8 FFFF

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
;RESM0   =  $12
RESM1   =  $13
RESBL   =  $14   ; vine fix
AUDC0   =  $15
AUDF0   =  $17
AUDV0   =  $19
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
;ENAM0   =  $1D
ENAM1   =  $1E
ENABL   =  $1F   ; vine fix
HMP0    =  $20
HMP1    =  $21
;HMM0    =  $22
HMM1    =  $23   ; vine fix
HMBL    =  $24
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
;CXM0P   =  $30
CXM1P   =  $31
CXP0FB  =  $32   ; vine fix
INPT4   =  $3C

RESP0_mirror  =  $0110
GRP0_mirror   =  $011B
HMP0_mirror   =  $0120
HMOVE_mirror  =  $012A
HMCLR_mirror  =  $012B

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      FIRST BANK
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $1000
      RORG $D000

START:
;    sta    LFFF9                 ; 4
    LDA    LFFF9                 ;     avoid bus contention

    .byte $48 ; | X  X   | $D003
    .byte $48 ; | X  X   | $D004
    .byte $48 ; | X  X   | $D005
    .byte $48 ; | X  X   | $D006
    .byte $48 ; | X  X   | $D007
    .byte $48 ; | X  X   | $D008
    .byte $0E ; |    XXX | $D009
    .byte $0E ; |    XXX | $D00A
    .byte $0E ; |    XXX | $D00B
    .byte $0E ; |    XXX | $D00C
    .byte $48 ; | X  X   | $D00D
    .byte $48 ; | X  X   | $D00E
    .byte $0E ; |    XXX | $D00F
    .byte $0E ; |    XXX | $D010
    .byte $48 ; | X  X   | $D011
    .byte $48 ; | X  X   | $D012
    .byte $48 ; | X  X   | $D013
    .byte $48 ; | X  X   | $D014
    .byte $48 ; | X  X   | $D015
    .byte $48 ; | X  X   | $D016
    .byte $48 ; | X  X   | $D017
    .byte $0E ; |    XXX | $D018
    .byte $0E ; |    XXX | $D019
    .byte $0E ; |    XXX | $D01A
    .byte $0E ; |    XXX | $D01B
    .byte $0E ; |    XXX | $D01C
    .byte $0E ; |    XXX | $D01D
    .byte $0E ; |    XXX | $D01E
    .byte $0E ; |    XXX | $D01F
    .byte $48 ; | X  X   | $D020
    .byte $48 ; | X  X   | $D021
    .byte $48 ; | X  X   | $D022
    .byte $0E ; |    XXX | $D023
    .byte $0E ; |    XXX | $D024
    .byte $00 ; |        | $D025
    .byte $60 ; | XX     | $D026
    .byte $26 ; |  X  XX | $D027
    .byte $24 ; |  X  X  | $D028
    .byte $24 ; |  X  X  | $D029
    .byte $7E ; | XXXXXX | $D02A
    .byte $7E ; | XXXXXX | $D02B
    .byte $3C ; |  XXXX  | $D02C
    .byte $18 ; |   XX   | $D02D
    .byte $58 ; | X XX   | $D02E
    .byte $58 ; | X XX   | $D02F
    .byte $5A ; | X XX X | $D030
    .byte $3D ; |  XXXX X| $D031
    .byte $18 ; |   XX   | $D032
    .byte $98 ; |X  XX   | $D033
    .byte $B8 ; |X XXX   | $D034
    .byte $7C ; | XXXXX  | $D035
    .byte $38 ; |  XXX   | $D036
    .byte $00 ; |        | $D037
    .byte $00 ; |        | $D038
    .byte $00 ; |        | $D039
    .byte $00 ; |        | $D03A
    .byte $00 ; |        | $D03B
    .byte $0C ; |    XX  | $D03C
    .byte $28 ; |  X X   | $D03D
    .byte $2C ; |  X XX  | $D03E
    .byte $E6 ; |XXX  XX | $D03F
    .byte $82 ; |X     X | $D040
    .byte $62 ; | XX   X | $D041
    .byte $3F ; |  XXXXXX| $D042
    .byte $1E ; |   XXXX | $D043
    .byte $0E ; |    XXX | $D044
    .byte $4E ; | X  XXX | $D045
    .byte $4E ; | X  XXX | $D046
    .byte $56 ; | X X XX | $D047
    .byte $6A ; | XX X X | $D048
    .byte $4E ; | X  XXX | $D049
    .byte $7E ; | XXXXXX | $D04A
    .byte $4A ; | X  X X | $D04B
    .byte $5F ; | X XXXXX| $D04C
    .byte $55 ; | X X X X| $D04D
    .byte $55 ; | X X X X| $D04E
    .byte $4E ; | X  XXX | $D04F
    .byte $E0 ; |XXX     | $D050
    .byte $40 ; | X      | $D051

LD052:
    lda.wy $AB,Y                 ; 4
    sec                          ; 2
    sbc    $9F                   ; 3
    cmp    #$FD                  ; 2
    bcs    LD063                 ; 2³
    cmp    #4                    ; 2
    bcc    LD063                 ; 2³
Waste14Cycles SUBROUTINE
    lda    #0                    ; 2
    rts                          ; 6

LD063:
    lda    #1                    ; 2
    rts                          ; 6

LD066:
    lda    $89                   ; 3
    cmp    #1                    ; 2
    bne    LD0DF                 ; 2³
    lda    $E8                   ; 3
    beq    LD0DF                 ; 2³
    dey                          ; 2
    bmi    LD07C                 ; 2³
    jsr    LD052                 ; 6
    beq    LD07C                 ; 2³
    lda    #$10                  ; 2
    sta    $F9                   ; 3
LD07C:
    iny                          ; 2
    cpy    $E8                   ; 3
    bcs    LD089                 ; 2³
    iny                          ; 2
    jsr    LD052                 ; 6
    beq    LD089                 ; 2³
    inc    $F9                   ; 5
LD089:
    ldy    $94                   ; 3
    lda    $F9                   ; 3
    beq    LD0DF                 ; 2³
    cmp    #$10                  ; 2
    beq    LD0A1                 ; 2³
    cmp    #$11                  ; 2
    beq    LD0A9                 ; 2³
    lda    $80                   ; 3
    lsr                          ; 2
    bcs    LD09E                 ; 2³
    inx                          ; 2
    iny                          ; 2
LD09E:
    iny                          ; 2
    bpl    LD0C3                 ; 2³
LD0A1:
    lda    $80                   ; 3
    lsr                          ; 2
    bcc    LD09E                 ; 2³
    dex                          ; 2
    bpl    LD0C3                 ; 2³
LD0A9:
    lda    $80                   ; 3
    lsr                          ; 2
    bcs    LD09E                 ; 2³
    dex                          ; 2
    dec    $E9                   ; 5
    lda    $94                   ; 3
    cmp    #1                    ; 2
    bne    LD0C3                 ; 2³
    lda    $AE                   ; 3
    sta    $AD                   ; 3
    lda    $B2                   ; 3
    sta    $B1                   ; 3
    lda    $B6                   ; 3
    sta    $B5                   ; 3
LD0C3:
    cpx    $E8                   ; 3
    bcs    LD0DD                 ; 2³
    lda.wy $AB,Y                 ; 4
    sta    $AB,X                 ; 4
    lda.wy $AF,Y                 ; 4
    sta    $AF,X                 ; 4
    lda.wy $B3,Y                 ; 4
    sta    $B3,X                 ; 4
    inx                          ; 2
    iny                          ; 2
    bne    LD0C3                 ; 2³
LD0DA:
    jmp    LD1CC                 ; 3
LD0DD:
    dec    $E9                   ; 5
LD0DF:
    lda    $89                   ; 3
    cmp    #2                    ; 2
    bcc    LD0DA                 ; 2³
    beq    LD0EB                 ; 2³
    lda    $CA                   ; 3
    beq    LD0DA                 ; 2³
LD0EB:
    lda    $EA                   ; 3
    cmp    #6                    ; 2
    bne    LD101                 ; 2³+1
    lda    #0                    ; 2
    sta    $C5                   ; 3
    lda    $80                   ; 3
    and    #$0F                  ; 2
    bne    LD101                 ; 2³+1
    lda    $C3                   ; 3
    eor    #$08                  ; 2
    sta    $C3                   ; 3
LD101:
    bit    $C0                   ; 3
    bmi    LD0DA                 ; 2³+1
    lda    $B7                   ; 3
    sbc    $DD                   ; 3
    cmp    #$FC                  ; 2
    bcs    LD111                 ; 2³
    cmp    #3                    ; 2
    bcs    LD16D                 ; 2³
LD111:
    lda    $89                   ; 3
    lsr                          ; 2
    bcc    LD11C                 ; 2³
    ldy    #$EC                  ; 2
    lda    #$16                  ; 2
    bne    LD12A                 ; 2³
LD11C:
    bit    $BF                   ; 3
    bvs    LD126                 ; 2³
    lda    #6                    ; 2
    ldy    #$F1                  ; 2
    bne    LD12A                 ; 2³
LD126:
    lda    #8                    ; 2
    ldy    #$EE                  ; 2
LD12A:
    sta    $8E                   ; 3
    lda    $EA                   ; 3
    bne    LD132                 ; 2³
    ldy    #$F9                  ; 2
LD132:
    sty    $8C                   ; 3
    lda    $BA                   ; 3
    sec                          ; 2
    sbc    $B8                   ; 3
    bcc    LD141                 ; 2³
    cmp    $8E                   ; 3
    bcs    LD15E                 ; 2³
    bcc    LD152                 ; 2³
LD141:
    cmp    $8C                   ; 3
    bcs    LD152                 ; 2³
    lda    $89                   ; 3
    lsr                          ; 2
    bcs    LD14E                 ; 2³
    bit    $C4                   ; 3
    bmi    LD152                 ; 2³
LD14E:
    lda    #2                    ; 2
    bne    LD16B                 ; 2³
LD152:
    bit    $98                   ; 3
    bmi    LD158                 ; 2³
    dec    $88                   ; 5
LD158:
    lda    #$60                  ; 2
    sta    $F2                   ; 3
    bne    LD1C6                 ; 2³
LD15E:
    lda    $89                   ; 3
    lsr                          ; 2
    bcs    LD152                 ; 2³
    ldx    #0                    ; 2
    bit    $C4                   ; 3
    bpl    LD16A                 ; 2³
    inx                          ; 2
LD16A:
    txa                          ; 2
LD16B:
    sta    $C2                   ; 3
LD16D:
    lda    $B7                   ; 3
    sec                          ; 2
    sbc    $DD                   ; 3
    ldy    $89                   ; 3
    cpy    #2                    ; 2
    beq    LD192                 ; 2³
    bit    $BD                   ; 3
    bpl    LD1CC                 ; 2³
    ldx    $C6                   ; 3
    bpl    LD189                 ; 2³
    tay                          ; 2
    bmi    LD1CC                 ; 2³
    cmp    #8                    ; 2
    bcc    LD1CC                 ; 2³
    bcs    LD199                 ; 2³
LD189:
    tay                          ; 2
    bpl    LD1CC                 ; 2³
    cmp    #$F8                  ; 2
    bcs    LD1CC                 ; 2³
    bcc    LD199                 ; 2³
LD192:
    tay                          ; 2
    bmi    LD1CC                 ; 2³
    cmp    #8                    ; 2
    bcc    LD1CC                 ; 2³
LD199:
    ldy    $C2                   ; 3
    bmi    LD1CC                 ; 2³
    beq    LD1A9                 ; 2³
    lda    #0                    ; 2
    ldx    #2                    ; 2
    dey                          ; 2
    bne    LD1AC                 ; 2³
    dex                          ; 2
    bne    LD1AC                 ; 2³
LD1A9:
    tax                          ; 2
    lda    #$50                  ; 2
LD1AC:
    sed                          ; 2
    clc                          ; 2
    adc    $83                   ; 3
    sta    $83                   ; 3
    txa                          ; 2
    adc    $84                   ; 3
    sta    $84                   ; 3
    bcc    LD1BF                 ; 2³
    lda    $85                   ; 3
    bne    LD1BF                 ; 2³
    inc    $88                   ; 5
LD1BF:
    lda    #0                    ; 2
    adc    $85                   ; 3
    sta    $85                   ; 3
    cld                          ; 2
LD1C6:
    lda    #$80                  ; 2
    sta    $C0                   ; 3
    sta    $C2                   ; 3
LD1CC:
    lda    #$A2                  ; 2
    sta    COLUBK                ; 3
    ldx    #$FF                  ; 2
    stx    PF0                   ; 3
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    inx                          ; 2
    stx    REFP0                 ; 3
    stx    REFP1                 ; 3
    ldx    $89                   ; 3
    lda    LDB92,X               ; 4
    sta    COLUPF                ; 3
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    WSYNC                 ; 3
    lda    #$35                  ; 2
    sec                          ; 2
LD1F3:
    sbc    #$0F                  ; 2
    bcs    LD1F3                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0_mirror           ; 4
    adc    #$0F                  ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    HMP1                  ; 3
    bit    $98                   ; 3
    bvc    LD210                 ; 2³
    lda    #$DE                  ; 2
    bne    LD212                 ; 2³
LD210:
    lda    #$DF                  ; 2
LD212:
    ldx    #$0A                  ; 2
LD214:
    sta    $8D,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LD214                 ; 2³
    cmp    #$DE                  ; 2
    bne    LD22E                 ; 2³
    ldx    #$0A                  ; 2
    ldy    #5                    ; 2
LD222:
    lda    LDDF7,Y               ; 4
    sta    $8C,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    dey                          ; 2
    bpl    LD222                 ; 2³
    bmi    LD282                 ; 2³
LD22E:
    ldy    #$50                  ; 2
    sec                          ; 2
    lda    $85                   ; 3
    and    #$F0                  ; 2
    bne    LD23B                 ; 2³
    sty    $96                   ; 3
    beq    LD23E                 ; 2³
LD23B:
    lsr                          ; 2
    sta    $96                   ; 3
LD23E:
    lda    $85                   ; 3
    and    #$0F                  ; 2
    bcc    LD24A                 ; 2³
    bne    LD24A                 ; 2³
    sty    $94                   ; 3
    beq    LD24F                 ; 2³
LD24A:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $94                   ; 3
LD24F:
    lda    $84                   ; 3
    and    #$F0                  ; 2
    bcc    LD25B                 ; 2³
    bne    LD25B                 ; 2³
    sty    $92                   ; 3
    beq    LD25E                 ; 2³
LD25B:
    lsr                          ; 2
    sta    $92                   ; 3
LD25E:
    lda    $84                   ; 3
    and    #$0F                  ; 2
    bcc    LD26A                 ; 2³
    bne    LD26A                 ; 2³
    sty    $90                   ; 3
    beq    LD26F                 ; 2³
LD26A:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $90                   ; 3
LD26F:
    lda    $83                   ; 3
    and    #$F0                  ; 2
    bcc    LD27B                 ; 2³
    bne    LD27B                 ; 2³
    sty    $8E                   ; 3
    beq    LD27E                 ; 2³
LD27B:
    lsr                          ; 2
    sta    $8E                   ; 3
LD27E:
    lda    #0                    ; 2
    sta    $8C                   ; 3
LD282:
    lda    INTIM                 ; 4
    bne    LD282                 ; 2³
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    #0                    ; 2
    sta    VBLANK                ; 3
    sta    CTRLPF                ; 3
    lda    #$4A                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    $89                   ; 3
    sta    HMCLR                 ; 3
    bne    LD2EA                 ; 2³
    lda    $E4                   ; 3
    cmp    #$11                  ; 2
    bcs    LD2A9                 ; 2³
    sbc    #4                    ; 2
    bcs    LD2A9                 ; 2³
    adc    #$A5                  ; 2
LD2A9:
    sec                          ; 2
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
LD2AE:
    sbc    #$0F                  ; 2
    bcs    LD2AE                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
;    sta    HMM0                  ; 3
;    sta    RESM0                 ; 3
    STA    HMBL                  ; 3   fix
    STA    RESBL                 ; 3   fix
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    $E5                   ; 3
    cmp    #$11                  ; 2
    bcs    LD2CC                 ; 2³
    sbc    #4                    ; 2
    bcs    LD2CC                 ; 2³
    adc    #$A5                  ; 2
LD2CC:
    pha                          ; 3
    pla                          ; 4
    nop                          ; 2
    sec                          ; 2
    sta    HMCLR                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
LD2D6:
    sbc    #$0F                  ; 2
    bcs    LD2D6                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMM1                  ; 3
    sta    RESM1                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    bcs    LD2FC                 ; 2³
LD2EA:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE_mirror          ; 4
    nop                          ; 2
LD2FC:
    bit    $98                   ; 3
    bvc    LD30E                 ; 2³
    ldy    #$16                  ; 2
    sty    $FB                   ; 3
    lda    #$28                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    HMCLR                 ; 3
    bne    LD325                 ; 2³
LD30E:
    ldy    #6                    ; 2
    sty    $FB                   ; 3
    ldx    #8                    ; 2
    nop                          ; 2
    sta    HMCLR                 ; 3
LD317:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    dex                          ; 2
    bpl    LD317                 ; 2³
    pha                          ; 3
    pla                          ; 4
;    pha                          ; 3
;    pla                          ; 4
;    pha                          ; 3
;    pla                          ; 4  save one byte
    JSR    Waste14Cycles

    nop                          ; 2
LD325:
    sta    HMCLR                 ; 3
;    pha                          ; 3
;    pla                          ; 4
;    pha                          ; 3
;    pla                          ; 4
;    pha                          ; 3
;    pla                          ; 4
;    pha                          ; 3
;    pla                          ; 4   saves 2 bytes
    JSR    Waste14Cycles
    JSR    Waste14Cycles

    sta    HMCLR                 ; 3   strobe
LD331:
    ldy    $FB                   ; 3
    lda    ($96),Y               ; 5
    sta    GRP0_mirror           ; 4
    sta    HMOVE                 ; 3
    lda    ($94),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($92),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($90),Y               ; 5
    sta    $FA                   ; 3
    lda    ($8E),Y               ; 5
    tax                          ; 2
    lda    ($8C),Y               ; 5
    tay                          ; 2
    lda    $FA                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    $FB                   ; 5
    bpl    LD331                 ; 2³
    ldx    #0                    ; 2
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    stx    GRP0                  ; 3
    bvc    LD37E                 ; 2³
    ldy    #0                    ; 2
    sty    VDELP0                ; 3
    sty    VDELP1                ; 3
    iny                          ; 2
    sty    NUSIZ0                ; 3
    sty    NUSIZ1                ; 3
    lda    #$DF                  ; 2
    sta    $8D                   ; 3
    sta    $8F                   ; 3
    ldy    #0                    ; 2
    jmp    LD415                 ; 3
LD37E:
    ldy    LDB91                 ; 4
    sec                          ; 2
    lda    $87                   ; 3
    and    #$F0                  ; 2
    bne    LD38C                 ; 2³
    sty    $92                   ; 3
    beq    LD396                 ; 2³
LD38C:
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LDB87,X               ; 4
    sta    $92                   ; 3
LD396:
    lda    $87                   ; 3
    and    #$0F                  ; 2
    bcc    LD3A2                 ; 2³
    bne    LD3A2                 ; 2³
    sty    $90                   ; 3
    beq    LD3A9                 ; 2³
LD3A2:
    tax                          ; 2
    clc                          ; 2
    lda    LDB87,X               ; 4
    sta    $90                   ; 3
LD3A9:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    $86                   ; 3
    and    #$F0                  ; 2
    bcc    LD3B9                 ; 2³
    bne    LD3B9                 ; 2³
    sty    $8E                   ; 3
    beq    LD3C3                 ; 2³
LD3B9:
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LDB87,X               ; 4
    sta    $8E                   ; 3
LD3C3:
    lda    LDB87                 ; 4
    sta    $8C                   ; 3
    lda    #$90                  ; 2
    sta    HMP0                  ; 3
    lda    #$A0                  ; 2
    sta    HMP1                  ; 3
    ldx    #$0B                  ; 2
    ldy    #0                    ; 2
    sty    VDELP0                ; 3
    sty    VDELP1                ; 3
    sty    NUSIZ0                ; 3
    sty    NUSIZ1                ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    ldy    #4                    ; 2
LD3E2:
    dex                          ; 2
    bne    LD3E2                 ; 2³
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
LD3E9:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    #$FA                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    ($92),Y               ; 5
    and    #$F0                  ; 2
    sta    $94                   ; 3
    lda    ($90),Y               ; 5
    and    #$0F                  ; 2
    ora    $94                   ; 3
    sta    GRP0                  ; 3
    lda    ($8E),Y               ; 5
    and    #$F0                  ; 2
    sta    $94                   ; 3
    lda    ($8C),Y               ; 5
    and    #$0F                  ; 2
    ora    $94                   ; 3
    sta    GRP1                  ; 3
    sta    HMCLR                 ; 3
    dey                          ; 2
    bpl    LD3E9                 ; 2³+1
    iny                          ; 2
LD415:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    iny                          ; 2
    sty    NUSIZ0                ; 3
    sty    NUSIZ1                ; 3
    lda    #$4A                  ; 2
    sta    COLUP0                ; 3
    bit    $98                   ; 3
    sta    RESP0                 ; 3
    bvc    LD433                 ; 2³
    ldx    $89                   ; 3
    lda    LDB92,X               ; 4
    sta    COLUP0                ; 3
LD433:
    ldx    $88                   ; 3
    bpl    LD439                 ; 2³
    ldx    #$0A                  ; 2
LD439:
    lda    LDB87,X               ; 4
    sta    $8C                   ; 3
    ldy    #5                    ; 2
LD440:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    LDFE6,Y               ; 4
    sta    GRP0                  ; 3
    sta    HMCLR                 ; 3
    lda    ($8C),Y               ; 5
    and    #$F0                  ; 2
    pha                          ; 3
    pla                          ; 4
    nop                          ; 2
    sta    GRP0                  ; 3
    dey                          ; 2
    bpl    LD440                 ; 2³
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    iny                          ; 2
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    lda    $89                   ; 3
    beq    LD473                 ; 2³
    cmp    #1                    ; 2
    bne    LD48D                 ; 2³
    ldy    #0                    ; 2
    sty    PF0                   ; 3
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    jmp    LD741                 ; 3
LD473:
    ldx    $E0                   ; 3
    lda    #$DF                  ; 2
    sta    $8D                   ; 3
    sta    $8F                   ; 3
    lda    LDF9F,X               ; 4
    sta    $8C                   ; 3
    ldx    $E1                   ; 3
    lda    LDF9F,X               ; 4
    sta    $8E                   ; 3
    lda    #$DE                  ; 2
    sta    $91                   ; 3
    sta    $95                   ; 3
LD48D:
    lda    $DE                   ; 3
    cmp    #$11                  ; 2
    bcs    LD499                 ; 2³
    sbc    #4                    ; 2
    bcs    LD499                 ; 2³
    adc    #$A5                  ; 2
LD499:
    sec                          ; 2
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
LD49E:
    sbc    #$0F                  ; 2
    bcs    LD49E                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0                  ; 3
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    ldy    $EA                   ; 3
    lda    $89                   ; 3
    bne    LD4CC                 ; 2³
    lda    LDCFD,Y               ; 4
    sta    $94                   ; 3
    sbc    $F5                   ; 3
    adc    #$55                  ; 2
    sta    $90                   ; 3
    lda    #$E4                  ; 2
    sta    $96                   ; 3
    sec                          ; 2
    sbc    $F5                   ; 3
    adc    #$55                  ; 2
    sta    $92                   ; 3
LD4CC:
    lda    $DF                   ; 3
    cmp    #$11                  ; 2
    bcs    LD4D8                 ; 2³
    sbc    #4                    ; 2
    bcs    LD4D8                 ; 2³
    adc    #$A5                  ; 2
LD4D8:
    sec                          ; 2
    sta    HMCLR                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
LD4DF:
    sbc    #$0F                  ; 2
    bcs    LD4DF                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP1                  ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    #6                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$28                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldy    #$7C                  ; 2
    lda    #4                    ; 2
    sta    CTRLPF                ; 3
    sta    HMCLR                 ; 3
    sty    $FB                   ; 3
    ldx    #$9E                  ; 2
    txs                          ; 2
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    $89                   ; 3
    bne    LD518                 ; 2³
    lda    #$DC                  ; 2
    sta    $97                   ; 3
    sta    $93                   ; 3
LD518:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    ldy    #$0F                  ; 2
    pla                          ; 4
LD51F:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    PF0                   ; 3
    lda    LDB77,Y               ; 4
    sta    GRP0                  ; 3
    lda    LDB63,Y               ; 4
    sta    GRP1                  ; 3
    pla                          ; 4
    sta    PF1                   ; 3
    pla                          ; 4
    sta    PF2                   ; 3
    pla                          ; 4
    sta    PF0                   ; 3
    pla                          ; 4
    sta    PF1                   ; 3
    pla                          ; 4
    sta    PF2                   ; 3
    tya                          ; 2
    and    #$03                  ; 2
    bne    LD55F                 ; 2³
    tsx                          ; 2
    pla                          ; 4
    dey                          ; 2
    bpl    LD51F                 ; 2³
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    iny                          ; 2
    sty    PF0                   ; 3
    lda    LDB76                 ; 4
    sta    GRP0                  ; 3
    lda    LDB62                 ; 4
    sta    GRP1                  ; 3
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    bne    LD564                 ; 3   always branch
LD55F:
    txs                          ; 2
    pla                          ; 4
    dey                          ; 2
    bpl    LD51F                 ; 2³

LD564:
;    lda    #$E4                  ; 2
    LDA    #$28                  ; 2   fix color of new vine

    sta    COLUPF                ; 3
    sty    CTRLPF                ; 3
    ldy    #2                    ; 2
LD56C:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    LDB73,Y               ; 4
    sta    GRP0                  ; 3
    lda    LDB5F,Y               ; 4
    sta    GRP1                  ; 3
    dey                          ; 2
    bpl    LD56C                 ; 2³
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    iny                          ; 2
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    lda    $89                   ; 3
    beq    LD58D                 ; 2³
    jmp    LDA10                 ; 3
LD58D:
    ldx    #2                    ; 2
    sty    NUSIZ0                ; 3
;    stx    ENAM0                 ; 3
    STX    ENABL                 ; 3   fix
    sty    NUSIZ1                ; 3
    stx    ENAM1                 ; 3
    lda    $DD                   ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sec                          ; 2
LD59E:
    sbc    #$0F                  ; 2
    bcs    LD59E                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0                  ; 3
    sta    RESP0_mirror          ; 4
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    ldx    #$FF                  ; 2
    txs                          ; 2
    pha                          ; 3
    pla                          ; 4
    pha                          ; 3
    pla                          ; 4
    sta    HMCLR                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    ldy    #$1D                  ; 2
    lda    ($8C),Y               ; 5
    beq    LD5CA                 ; 2³
    lda    $E2                   ; 3

LD5CA:
;    sta    HMM0                  ; 3
    STA    HMBL                  ; 3   fix
    lda    ($8E),Y               ; 5
    beq    LD5D2                 ; 2³
    lda    $E3                   ; 3
LD5D2:
    sta    HMM1                  ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    ldy    #$3A                  ; 2
LD5DA:
    lda    #0                    ; 2
    cpy    $F7                   ; 3
    bcs    LD5E2                 ; 2³
;    sta    ENAM0                 ; 3
    STA    ENABL                 ; 3   fix
LD5E2:
    cpy    $F8                   ; 3
    bcs    LD5E8                 ; 2³
    sta    ENAM1                 ; 3
LD5E8:
    dec    $FB                   ; 5
    sta    HMCLR                 ; 3
    ldx    $FB                   ; 3
    cpx    $F5                   ; 3
    beq    LD651                 ; 2³+1
    dey                          ; 2
    bmi    LD618                 ; 2³+1
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sty    $F9                   ; 3
    tya                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    ($8C),Y               ; 5
    beq    LD604                 ; 2³
    lda    $E2                   ; 3
LD604:
;    sta    HMM0
    STA    HMBL                  ; 3   fix
    lda    ($8E),Y               ; 5
    beq    LD60C                 ; 2³
    lda    $E3                   ; 3
LD60C:
    sta    HMM1                  ; 3
    ldy    $F9                   ; 3
    dec    $FB                   ; 5
    ldx    $FB                   ; 3
    cpx    $F5                   ; 3
    beq    LD622                 ; 2³
LD618:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    dey                          ; 2
    bpl    LD5DA                 ; 2³+1
;    jmp    LD69D                 ; 3
    bmi    LD69D                 ; 3   always branch, save a byte

LD622:
    ldx    #$14                  ; 2
LD624:
    dey                          ; 2
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    bmi    LD684                 ; 2³
    lda    ($90),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($92),Y               ; 5
    sta    COLUP0                ; 3
    lda    #0                    ; 2
    cpy    $F7                   ; 3
    bcs    LD63B                 ; 2³
;    sta    ENAM0                 ; 3
    STA    ENABL                 ; 3   fix
LD63B:
    cpy    $F8                   ; 3
    bcs    LD641                 ; 2³
    sta    ENAM1                 ; 3
LD641:
    dec    $FB                   ; 5
    dex                          ; 2
    sta    HMCLR                 ; 3
    bmi    LD618                 ; 2³
    dey                          ; 2
    bpl    LD656                 ; 2³
LD64B:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    bmi    LD684                 ; 2³
LD651:
    ldx    #$14                  ; 2
    dey                          ; 2
    bmi    LD64B                 ; 2³
LD656:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    ($90),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($92),Y               ; 5
    sta    COLUP0                ; 3
    sty    $F9                   ; 3
    tya                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    ($8C),Y               ; 5
    beq    LD66D                 ; 2³
    lda    $E2                   ; 3
LD66D:
;    sta    HMM0                  ; 3
    STA    HMBL                  ; 3   fix
    lda    ($8E),Y               ; 5
    beq    LD675                 ; 2³
    lda    $E3                   ; 3
LD675:
    sta    HMM1                  ; 3
    ldy    $F9                   ; 3
    dec    $FB                   ; 5
    dex                          ; 2
    bpl    LD624                 ; 2³
    bmi    LD618                 ; 2³
LD680:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
LD684:
    txa                          ; 2
    tay                          ; 2
LD686:
    lda    ($94),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($96),Y               ; 5
    sta    COLUP0                ; 3
    dec    $FB                   ; 5
    lda    $FB                   ; 3
    cmp    #$1C                  ; 2
    beq    LD6B3                 ; 2³
    dey                          ; 2
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    bpl    LD686                 ; 2³
LD69D:
    dec    $FB                   ; 5
    lda    $FB                   ; 3
    cmp    #$1C                  ; 2
    beq    LD6B3                 ; 2³
    cmp    $F5                   ; 3
    bne    LD6AD                 ; 2³
    ldx    #$14                  ; 2
    bne    LD680                 ; 2³
LD6AD:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    bne    LD69D                 ; 2³
LD6B3:
    LDX    #$E4                  ;     fix playfield color after drawing vines
    STX    COLUPF

    ldx    #$B6                  ; 2
    txs                          ; 2
    ldy    #4                    ; 2
    sty    $FA                   ; 3
    dey                          ; 2
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
LD6C3:
    pla                          ; 4
    sta    PF0                   ; 3
    pla                          ; 4
    sta    PF1                   ; 3
    pla                          ; 4
    sta    PF2                   ; 3
    pla                          ; 4
    sta    PF0                   ; 3
    pla                          ; 4
    sta    PF1                   ; 3
    pla                          ; 4
    sta    PF2                   ; 3
    dec    $FA                   ; 5
    bne    LD6E7                 ; 2³
    dey                          ; 2
    beq    LD6EA                 ; 2³
    tsx                          ; 2
    lda    #4                    ; 2
    sta    $FA                   ; 3
LD6E1:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    bne    LD6C3                 ; 2³
LD6E7:
    txs                          ; 2
    bne    LD6E1                 ; 2³
LD6EA:
    tsx                          ; 2
    cpx    #$DA                  ; 2
    beq    LD70B                 ; 2³+1
    ldx    #$C8                  ; 2
    txs                          ; 2
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sty    PF0                   ; 3
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    lda    #$E4                  ; 2
    sta    COLUBK                ; 3
    lda    #$F2                  ; 2
    sta    COLUPF                ; 3
    ldy    #4                    ; 2
    sty    $FA                   ; 3
    dey                          ; 2
    bne    LD6E1                 ; 2³+1
LD70B:
    ldx    #$FF                  ; 2
    txs                          ; 2
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    #$F2                  ; 2
    sta    COLUBK                ; 3
    ldy    #3                    ; 2
LD718:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    dey                          ; 2
    bne    LD718                 ; 2³
    sty    COLUBK                ; 3
    sty    PF0                   ; 3
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    lda    #$23                  ; 2
    sta    TIM64T                ; 4
    inc    $80                   ; 5
    lda    $80                   ; 3
    adc    $81                   ; 3
    adc    $82                   ; 3
    ldy    $81                   ; 3
    sta    $81                   ; 3
    sty    $82                   ; 3
    jmp    LDFF2                 ; 3
LD741:
    sty    NUSIZ1                ; 3
    iny                          ; 2
    sty    NUSIZ0                ; 3
    lda    #$DC                  ; 2
    sta    $8D                   ; 3
    sta    $8F                   ; 3
    ldy    #$9F                  ; 2
    lda    #$23                  ; 2
    sta    $96                   ; 3
LD752:
    cpy    #$88                  ; 2
    beq    LD75D                 ; 2³
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    dey                          ; 2
    bne    LD752                 ; 2³
LD75D:
    lda    #$50                  ; 2
    sta    HMP0                  ; 3
    lda    #$60                  ; 2
    sta    HMP1                  ; 3
    ldx    #$0D                  ; 2
    lda    #$0A                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    dex                          ; 2
LD772:
    dex                          ; 2
    bne    LD772                 ; 2³
    sta    RESP0_mirror          ; 4
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE_mirror          ; 4
    ldx    #4                    ; 2
    nop                          ; 2
LD782:
    nop                          ; 2
    lda    LDF94,X               ; 4
    sta    GRP0                  ; 3
    lda    LDF8A,X               ; 4
    sta    GRP1                  ; 3
    lda    LDF80,X               ; 4
    sta    HMCLR_mirror          ; 4
    pha                          ; 3
    pla                          ; 4
    pha                          ; 3
    pla                          ; 4
    pha                          ; 3
    pla                          ; 4
    pha                          ; 3
    pla                          ; 4
    pha                          ; 3
    pla                          ; 4
    nop                          ; 2
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    dex                          ; 2
    bpl    LD782                 ; 2³
    lda    #$44                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    sta    NUSIZ0                ; 3
    ldy    #3                    ; 2
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    #$F0                  ; 2
    sta    HMP0                  ; 3
    sta    HMP1                  ; 3
LD7BF:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    #0                    ; 2
    sta    PF2                   ; 3
    ldx    $E3                   ; 3
    lda    LDDEC,Y               ; 4
    and    LDED4,X               ; 4
    sta    GRP0                  ; 3
    lda    LDCF9,Y               ; 4
    and    LDED0,X               ; 4
    sta    GRP1                  ; 3
    sta    HMCLR                 ; 3
    pha                          ; 3
    pla                          ; 4
    lda    #$7C                  ; 2
    sta    PF2                   ; 3
    dey                          ; 2
    bpl    LD7BF                 ; 2³
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    iny                          ; 2
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    PF2                   ; 3
    sty    NUSIZ0                ; 3
    iny                          ; 2
    sty    VDELP0                ; 3
    ldy    #$7C                  ; 2
    lda    #$A0                  ; 2
    sta    COLUPF                ; 3
    ldx    #$D1                  ; 2
    txs                          ; 2
    ldx    #3                    ; 2
LD7FF:
    cpy    #$74                  ; 2
    beq    LD80A                 ; 2³
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    dey                          ; 2
    bne    LD7FF                 ; 2³+1
LD80A:
    pla                          ; 4
    sta    PF0                   ; 3
    pla                          ; 4
    sta    PF1                   ; 3
    pla                          ; 4
    sta    PF2                   ; 3
    stx    $FA                   ; 3
    lda    $E9                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    $AB,X                 ; 4
    cmp    #$25                  ; 2
    bne    LD823                 ; 2³
    jmp    LD8B7                 ; 3
LD823:
    cmp    #$24                  ; 2
    beq    LD848                 ; 2³
    ldx    $FA                   ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    dex                          ; 2
    bpl    LD80A                 ; 2³
    inx                          ; 2
    stx    PF0                   ; 3
    stx    PF1                   ; 3
    lda    #$44                  ; 2
    sta    COLUPF                ; 3
    lda    #$A0                  ; 2
    sta    COLUBK                ; 3
    stx    PF2                   ; 3
    dex                          ; 2
    txs                          ; 2
    jmp    LD96C                 ; 3
LD848:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    inc    $96                   ; 5
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    pla                          ; 4
    sta    PF0                   ; 3
    pla                          ; 4
    sta    PF1                   ; 3
    pla                          ; 4
    sta    PF2                   ; 3
    ldy    $B3,X                 ; 4
    lda    LDDA2,Y               ; 4
    sta    $8C                   ; 3
    lda    LDDB2,Y               ; 4
    sta    $8E                   ; 3
    lda    LDEE0,Y               ; 4
    sta    COLUP0                ; 3
    lda    LDEF0,Y               ; 4
    sta    COLUP1                ; 3
    ldy    #9                    ; 2
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    pla                          ; 4
    sta    PF0                   ; 3
    pla                          ; 4
    sta    PF1                   ; 3
    pla                          ; 4
    sta    PF2                   ; 3
    lda    $AF,X                 ; 4
    dex                          ; 2
    stx    $FA                   ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
LD88D:
    sbc    #$0F                  ; 2
    bcs    LD88D                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0                  ; 3
    adc    #$0F                  ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    pla                          ; 4
    sta    PF0                   ; 3
    pla                          ; 4
    sta    PF1                   ; 3
    pla                          ; 4
    sta    PF2                   ; 3
    sta    HMCLR                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    jmp    LD939                 ; 3
LD8B7:
    ldy    $B3,X                 ; 4
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    LDDA2,Y               ; 4
    sta    $8C                   ; 3
    lda    LDDB2,Y               ; 4
    sta    $8E                   ; 3
    lda    LDEE0,Y               ; 4
    sta    COLUP0                ; 3
    lda    LDEF0,Y               ; 4
    sta    COLUP1                ; 3
    ldy    #9                    ; 2
    inc    $96                   ; 5
    inc    $96                   ; 5
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    pla                          ; 4
    sta    PF0                   ; 3
    pla                          ; 4
    sta    PF1                   ; 3
    pla                          ; 4
    sta    PF2                   ; 3
    lda    $AF,X                 ; 4
    dex                          ; 2
    stx    $FA                   ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
LD8ED:
    sbc    #$0F                  ; 2
    bcs    LD8ED                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0                  ; 3
    adc    #$0F                  ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    pla                          ; 4
    sta    PF0                   ; 3
    pla                          ; 4
    sta    PF1                   ; 3
    pla                          ; 4
    sta    PF2                   ; 3
    sta    HMCLR                 ; 3
LD910:
    lda    ($8C),Y               ; 5
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    ($8E),Y               ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    cpy    #6                    ; 2
    beq    LD939                 ; 2³
    lda    ($8C),Y               ; 5
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    ($8E),Y               ; 5
    sta    GRP1                  ; 3
    pla                          ; 4
    sta    PF0                   ; 3
    pla                          ; 4
    sta    PF1                   ; 3
    pla                          ; 4
    sta    PF2                   ; 3
    dey                          ; 2
    bne    LD910                 ; 2³
LD939:
    lda    ($8C),Y               ; 5
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    ($8E),Y               ; 5
    sta    GRP1                  ; 3
    lda    #$A0                  ; 2
    sta    COLUBK                ; 3
    lda    #0                    ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    #$44                  ; 2
    sta    COLUPF                ; 3
    bne    LD9C8                 ; 2³
LD957:
    dec    $96                   ; 5
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    ldy    $96                   ; 3
    cpy    #$0B                  ; 2
    bcs    LD973                 ; 2³
    ldx    #$B6                  ; 2
    txs                          ; 2
    bne    LD9E6                 ; 2³
LD96C:
    lda    $E9                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    sta    HMCLR                 ; 3
LD973:
    lda    #0                    ; 2
    cpx    #0                    ; 2
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    GRP1                  ; 3
    bmi    LD957                 ; 2³
    lda    $AB,X                 ; 4
    cmp    $96                   ; 3
    bne    LD957                 ; 2³
    ldy    $B3,X                 ; 4
    lda    LDDA2,Y               ; 4
    sta    $8C                   ; 3
    lda    LDDB2,Y               ; 4
    sta    $8E                   ; 3
    lda    LDEE0,Y               ; 4
    sta    COLUP0                ; 3
    lda    LDEF0,Y               ; 4
    sta    COLUP1                ; 3
    ldy    #9                    ; 2
    lda    ($8C),Y               ; 5
    sta    GRP0                  ; 3
    lda    $AF,X                 ; 4
    dex                          ; 2
    stx    $FA                   ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
LD9AC:
    sbc    #$0F                  ; 2
    bcs    LD9AC                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0                  ; 3
    adc    #$0F                  ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    HMP1                  ; 3
LD9C0:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    ($8E),Y               ; 5
    sta    GRP1                  ; 3
LD9C8:
    dey                          ; 2
    bmi    LD9D4                 ; 2³
    lda    ($8C),Y               ; 5
    sta    GRP0                  ; 3
    tsx                          ; 2
    sta    HMCLR                 ; 3
    bne    LD9C0                 ; 2³
LD9D4:
    lda    $96                   ; 3
    sec                          ; 2
    sbc    #4                    ; 2
    sta    $96                   ; 3
    sty    HMCLR                 ; 3
    ldx    $FA                   ; 3
    cmp    #$0B                  ; 2
    bcs    LD973                 ; 2³
    ldx    #$B6                  ; 2
    txs                          ; 2
LD9E6:
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    GRP1                  ; 3
    dec    $96                   ; 5
    beq    LDA08                 ; 2³+1
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    pla                          ; 4
    sta    PF0                   ; 3
    pla                          ; 4
    sta    PF1                   ; 3
    pla                          ; 4
    sta    PF2                   ; 3
    jmp    LD9E6                 ; 3
LDA08:
    ldx    #$FF                  ; 2
    txs                          ; 2
    ldy    #1                    ; 2
    jmp    LD718                 ; 3
LDA10:
    sty    NUSIZ0                ; 3
    sty    NUSIZ1                ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    VDELP0                ; 3
    sty    VDELP1                ; 3
    sec                          ; 2
    lda    $DD                   ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
LDA23:
    sbc    #$0F                  ; 2
    bcs    LDA23                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0                  ; 3
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    ldx    $EA                   ; 3
    lda    LDEC9,X               ; 4
    sbc    $B9                   ; 3
    sta    $8E                   ; 3
    lda    #$DD                  ; 2
    sbc    #0                    ; 2
    sta    $8F                   ; 3
    lda    LDFDF,X               ; 4
    sbc    $B9                   ; 3
    sta    $96                   ; 3
    lda    #$D0                  ; 2
    sbc    #0                    ; 2
    sta    $97                   ; 3
    sta    HMCLR                 ; 3
    lda    $89                   ; 3
    lsr                          ; 2
    bcc    LDA65                 ; 2³
    ldy    $CA                   ; 3
    lda    LDEDD,Y               ; 4
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    ldy    #$D0                  ; 2
    bne    LDA77                 ; 2³
LDA65:
    bit    $BF                   ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    bvs    LDA73                 ; 2³
    lda    #$8B                  ; 2
    ldy    #$DD                  ; 2
    bne    LDA77                 ; 2³
LDA73:
    lda    #$95                  ; 2
    ldy    #$DD                  ; 2
LDA77:
    sec                          ; 2
    sbc    $BB                   ; 3
    sta    $8C                   ; 3
    tya                          ; 2
    sbc    #0                    ; 2
    sta    $8D                   ; 3
    lda    $C3                   ; 3
    sta    REFP0                 ; 3
    lda    $89                   ; 3
    lsr                          ; 2
    bcc    LDA8E                 ; 2³
    lda    $C4                   ; 3
    sta    REFP1                 ; 3
LDA8E:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    $B7                   ; 3
    cmp    #$11                  ; 2
    bcs    LDA9E                 ; 2³
    sbc    #4                    ; 2
    bcs    LDA9E                 ; 2³
    adc    #$A5                  ; 2
LDA9E:
    sec                          ; 2
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
LDAA3:
    sbc    #$0F                  ; 2
    bcs    LDAA3                 ; 2³
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP1                  ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    #1                    ; 2
    sta    VDELP1                ; 3
    lda    $89                   ; 3
    lsr                          ; 2
    bcc    LDAC7                 ; 2³
    ldy    $CA                   ; 3
    lda    LDDFD,Y               ; 4
    ldx    #$DD                  ; 2
    bne    LDACB                 ; 2³
LDAC7:
    lda    #$C2                  ; 2
    ldx    #$DD                  ; 2
LDACB:
    sec                          ; 2
    sbc    $BB                   ; 3
    sta    $94                   ; 3
    txa                          ; 2
    sbc    #0                    ; 2
    sta    $95                   ; 3
    sta    HMCLR                 ; 3
    ldy    #$79                  ; 2
    lda    #0                    ; 2
LDADB:
    sta    $F9                   ; 3
    lda    #0                    ; 2
    bit    $F9                   ; 3
    bpl    LDAE5                 ; 2³
    lda    ($8C),Y               ; 5
LDAE5:
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    #0                    ; 2
    bvc    LDAF1                 ; 2³
    lda    ($8E),Y               ; 5
LDAF1:
    sta    GRP0                  ; 3
    lda    ($94),Y               ; 5
    sta    COLUP1                ; 3
    lda    ($96),Y               ; 5
    sta    COLUP0                ; 3
    dey                          ; 2
    cpy    $BE                   ; 3
    beq    LDB45                 ; 2³
    lda    $F9                   ; 3
    bvs    LDB0C                 ; 2³
    cpy    $B8                   ; 3
    bne    LDB12                 ; 2³
    ora    #$40                  ; 2
    bne    LDB12                 ; 2³
LDB0C:
    cpy    $B9                   ; 3
    bne    LDB12                 ; 2³
    and    #$BF                  ; 2
LDB12:
    sta    $F9                   ; 3
    lda    #0                    ; 2
    bit    $F9                   ; 3
    bpl    LDB1C                 ; 2³
    lda    ($8C),Y               ; 5
LDB1C:
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    #0                    ; 2
    bvc    LDB28                 ; 2³
    lda    ($8E),Y               ; 5
LDB28:
    sta    GRP0                  ; 3
    lda    ($96),Y               ; 5
    sta    COLUP0                ; 3
    dey                          ; 2
    cpy    $BE                   ; 3
    beq    LDB45                 ; 2³
    lda    $F9                   ; 3
    cpy    $BA                   ; 3
    bne    LDB3D                 ; 2³
    ora    #$80                  ; 2
    bmi    LDADB                 ; 2³+1
LDB3D:
    cpy    $BB                   ; 3
    bne    LDADB                 ; 2³+1
    and    #$7F                  ; 2
    bpl    LDADB                 ; 2³+1
LDB45:
    lda    #$E4                  ; 2
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    COLUBK                ; 3
    ldx    #0                    ; 2
    stx    GRP1                  ; 3
    stx    GRP0                  ; 3
    stx    VDELP1                ; 3
LDB55:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    dey                          ; 2
    bne    LDB55                 ; 2³
    jmp    LDA08                 ; 3

LDB5F:
    .byte $08 ; |    X   | $DB5F
    .byte $18 ; |   XX   | $DB60
    .byte $90 ; |X  X    | $DB61
LDB62:
    .byte $B1 ; |X XX   X| $DB62
LDB63:
    .byte $E3 ; |XXX   XX| $DB63
    .byte $26 ; |  X  XX | $DB64
    .byte $3C ; |  XXXX  | $DB65
    .byte $18 ; |   XX   | $DB66
    .byte $14 ; |   X X  | $DB67
    .byte $91 ; |X  X   X| $DB68
    .byte $91 ; |X  X   X| $DB69
    .byte $D3 ; |XX X  XX| $DB6A
    .byte $72 ; | XXX  X | $DB6B
    .byte $36 ; |  XX XX | $DB6C
    .byte $3C ; |  XXXX  | $DB6D
    .byte $0C ; |    XX  | $DB6E
    .byte $0A ; |    X X | $DB6F
    .byte $08 ; |    X   | $DB70
    .byte $18 ; |   XX   | $DB71
    .byte $38 ; |  XXX   | $DB72
LDB73:
    .byte $04 ; |     X  | $DB73
    .byte $04 ; |     X  | $DB74
    .byte $04 ; |     X  | $DB75
LDB76:
    .byte $84 ; |X    X  | $DB76
LDB77:
    .byte $C4 ; |XX   X  | $DB77
    .byte $64 ; | XX  X  | $DB78
    .byte $2C ; |  X XX  | $DB79
    .byte $A8 ; |X X X   | $DB7A
    .byte $68 ; | XX X   | $DB7B
    .byte $39 ; |  XXX  X| $DB7C
    .byte $31 ; |  XX   X| $DB7D
    .byte $19 ; |   XX  X| $DB7E
    .byte $0B ; |    X XX| $DB7F
    .byte $0A ; |    X X | $DB80
    .byte $0A ; |    X X | $DB81
    .byte $0E ; |    XXX | $DB82
    .byte $0E ; |    XXX | $DB83
    .byte $04 ; |     X  | $DB84
    .byte $04 ; |     X  | $DB85
    .byte $04 ; |     X  | $DB86
LDB87:
    .byte $57 ; | X X XXX| $DB87
    .byte $5D ; | X XXX X| $DB88
    .byte $63 ; | XX   XX| $DB89
    .byte $69 ; | XX X  X| $DB8A
    .byte $6F ; | XX XXXX| $DB8B
    .byte $75 ; | XXX X X| $DB8C
    .byte $7B ; | XXXX XX| $DB8D
    .byte $85 ; |X    X X| $DB8E
    .byte $8F ; |X   XXXX| $DB8F
    .byte $99 ; |X  XX  X| $DB90
LDB91:
    .byte $4F ; | X  XXXX| $DB91
LDB92:
    .byte $C4 ; |XX   X  | $DB92
    .byte $A2 ; |X X   X | $DB93
    .byte $C4 ; |XX   X  | $DB94
    .byte $C4 ; |XX   X  | $DB95

LDB96:
    lda    LDF9F,Y               ; 4
    sta    $8E                   ; 3
    stx    $FA                   ; 3
    ldx    #0                    ; 2
    ldy    #$1D                  ; 2
LDBA1:
    lda    ($8E),Y               ; 5
    beq    LDBA6                 ; 2³
    inx                          ; 2
LDBA6:
    dey                          ; 2
    cpy    $8C                   ; 3
    beq    LDBAF                 ; 2³
    cpy    $FA                   ; 3
    bne    LDBA1                 ; 2³
LDBAF:
    stx    $8D                   ; 3
    ldx    $FB                   ; 3
    bit    $98                   ; 3
    bmi    LDBD9                 ; 2³
    lda    $E0,X                 ; 4
    bne    LDBD9                 ; 2³
    lda    $EC,X                 ; 4
    bne    LDBD9                 ; 2³
    inc    $F3                   ; 5
    lda    $F3                   ; 3
    cmp    #$20                  ; 2
    bne    LDBD9                 ; 2³
    lda    #$C0                  ; 2
    sta    $E7                   ; 3
    lda    #2                    ; 2
    sta    $EA                   ; 3
    lda    #9                    ; 2
    sta    $E8                   ; 3
    lda    #7                    ; 2
    sta    $F0                   ; 3
    bpl    LDC02                 ; 2³+1
LDBD9:
    lda    $E2,X                 ; 4
    bmi    LDBE4                 ; 2³
    lda    #0                    ; 2
    sec                          ; 2
    sbc    $8D                   ; 3
    sta    $8D                   ; 3
LDBE4:
    clc                          ; 2
    lda    $DD                   ; 3
    adc    $8D                   ; 3
    sta    $DD                   ; 3
    lda    $E6                   ; 3
    cmp    #$71                  ; 2
    bcs    LDC02                 ; 2³+1
    ldy    $E0,X                 ; 4
    lda    LDDF0,Y               ; 4
    ldy    $E6                   ; 3
    cpy    #$58                  ; 2
    bcc    LDBFD                 ; 2³
    lsr                          ; 2
LDBFD:
    clc                          ; 2
    adc    $E6                   ; 3
    sta    $F5                   ; 3
LDC02:
    jmp    LDFEC                 ; 3

    .byte $20 ; |  X     | $DC05
    .byte $20 ; |  X     | $DC06
    .byte $00 ; |        | $DC07
    .byte $60 ; | XX     | $DC08
    .byte $10 ; |   X    | $DC09
    .byte $08 ; |    X   | $DC0A
    .byte $0F ; |    XXXX| $DC0B
    .byte $7F ; | XXXXXXX| $DC0C
    .byte $7F ; | XXXXXXX| $DC0D
    .byte $08 ; |    X   | $DC0E
    .byte $08 ; |    X   | $DC0F
    .byte $38 ; |  XXX   | $DC10
    .byte $00 ; |        | $DC11
    .byte $00 ; |        | $DC12
    .byte $01 ; |       X| $DC13
    .byte $00 ; |        | $DC14
    .byte $F2 ; |XXXX  X | $DC15
    .byte $E9 ; |XXX X  X| $DC16
    .byte $80 ; |X       | $DC17
    .byte $00 ; |        | $DC18
    .byte $00 ; |        | $DC19
    .byte $00 ; |        | $DC1A
    .byte $04 ; |     X  | $DC1B
    .byte $02 ; |      X | $DC1C
    .byte $02 ; |      X | $DC1D
    .byte $04 ; |     X  | $DC1E
    .byte $6F ; | XX XXXX| $DC1F
    .byte $7F ; | XXXXXXX| $DC20
    .byte $7F ; | XXXXXXX| $DC21
    .byte $10 ; |   X    | $DC22
    .byte $E0 ; |XXX     | $DC23
    .byte $00 ; |        | $DC24
    .byte $02 ; |      X | $DC25
    .byte $06 ; |     XX | $DC26
    .byte $0C ; |    XX  | $DC27
    .byte $38 ; |  XXX   | $DC28
    .byte $F0 ; |XXXX    | $DC29
    .byte $C0 ; |XX      | $DC2A
    .byte $98 ; |X  XX   | $DC2B
    .byte $0C ; |    XX  | $DC2C
    .byte $04 ; |     X  | $DC2D
    .byte $06 ; |     XX | $DC2E
    .byte $00 ; |        | $DC2F
    .byte $00 ; |        | $DC30
    .byte $03 ; |      XX| $DC31
    .byte $04 ; |     X  | $DC32
    .byte $6F ; | XX XXXX| $DC33
    .byte $7F ; | XXXXXXX| $DC34
    .byte $7F ; | XXXXXXX| $DC35
    .byte $A0 ; |X X     | $DC36
    .byte $40 ; | X      | $DC37
    .byte $00 ; |        | $DC38
    .byte $00 ; |        | $DC39
    .byte $00 ; |        | $DC3A
    .byte $00 ; |        | $DC3B
    .byte $F4 ; |XXXX X  | $DC3C
    .byte $F1 ; |XXXX   X| $DC3D
    .byte $80 ; |X       | $DC3E
    .byte $00 ; |        | $DC3F
    .byte $00 ; |        | $DC40
    .byte $00 ; |        | $DC41
    .byte $00 ; |        | $DC42
    .byte $0F ; |    XXXX| $DC43
    .byte $7B ; | XXXX XX| $DC44
    .byte $7D ; | XXXXX X| $DC45
    .byte $62 ; | XX   X | $DC46
    .byte $0C ; |    XX  | $DC47
    .byte $00 ; |        | $DC48
    .byte $02 ; |      X | $DC49
    .byte $06 ; |     XX | $DC4A
    .byte $0C ; |    XX  | $DC4B
    .byte $38 ; |  XXX   | $DC4C
    .byte $C0 ; |XX      | $DC4D
    .byte $F0 ; |XXXX    | $DC4E
    .byte $B8 ; |X XXX   | $DC4F
    .byte $0C ; |    XX  | $DC50
    .byte $04 ; |     X  | $DC51
    .byte $06 ; |     XX | $DC52
    .byte $00 ; |        | $DC53
    .byte $06 ; |     XX | $DC54
    .byte $02 ; |      X | $DC55
    .byte $04 ; |     X  | $DC56
    .byte $37 ; |  XX XXX| $DC57
    .byte $3F ; |  XXXXXX| $DC58
    .byte $3F ; |  XXXXXX| $DC59
    .byte $07 ; |     XXX| $DC5A
    .byte $78 ; | XXXX   | $DC5B
    .byte $00 ; |        | $DC5C
    .byte $10 ; |   X    | $DC5D
    .byte $38 ; |  XXX   | $DC5E
    .byte $6E ; | XX XXX | $DC5F
    .byte $C4 ; |XX   X  | $DC60
    .byte $C0 ; |XX      | $DC61
    .byte $F8 ; |XXXXX   | $DC62
    .byte $FC ; |XXXXXX  | $DC63
    .byte $07 ; |     XXX| $DC64
    .byte $02 ; |      X | $DC65
    .byte $00 ; |        | $DC66
    .byte $E0 ; |XXX     | $DC67
    .byte $10 ; |   X    | $DC68
    .byte $7F ; | XXXXXXX| $DC69
    .byte $7F ; | XXXXXXX| $DC6A
    .byte $6F ; | XX XXXX| $DC6B
    .byte $08 ; |    X   | $DC6C
    .byte $70 ; | XXX    | $DC6D
    .byte $00 ; |        | $DC6E
    .byte $00 ; |        | $DC6F
    .byte $00 ; |        | $DC70
    .byte $04 ; |     X  | $DC71
    .byte $8E ; |X   XXX | $DC72
    .byte $F8 ; |XXXXX   | $DC73
    .byte $F0 ; |XXXX    | $DC74
    .byte $C0 ; |XX      | $DC75
    .byte $6C ; | XX XX  | $DC76
    .byte $38 ; |  XXX   | $DC77
    .byte $10 ; |   X    | $DC78
    .byte $00 ; |        | $DC79
    .byte $3C ; |  XXXX  | $DC7A
    .byte $04 ; |     X  | $DC7B
    .byte $3F ; |  XXXXXX| $DC7C
    .byte $3F ; |  XXXXXX| $DC7D
    .byte $37 ; |  XX XXX| $DC7E
    .byte $04 ; |     X  | $DC7F
    .byte $04 ; |     X  | $DC80
    .byte $08 ; |    X   | $DC81
    .byte $10 ; |   X    | $DC82
    .byte $00 ; |        | $DC83
    .byte $04 ; |     X  | $DC84
    .byte $1E ; |   XXXX | $DC85
    .byte $F8 ; |XXXXX   | $DC86
    .byte $E0 ; |XXX     | $DC87
    .byte $CC ; |XX  XX  | $DC88
    .byte $68 ; | XX X   | $DC89
    .byte $38 ; |  XXX   | $DC8A
    .byte $10 ; |   X    | $DC8B
    .byte $00 ; |        | $DC8C
    .byte $00 ; |        | $DC8D
    .byte $80 ; |X       | $DC8E
    .byte $68 ; | XX X   | $DC8F
    .byte $3F ; |  XXXXXX| $DC90
    .byte $1F ; |   XXXXX| $DC91
    .byte $07 ; |     XXX| $DC92
    .byte $00 ; |        | $DC93
    .byte $00 ; |        | $DC94
    .byte $00 ; |        | $DC95
    .byte $08 ; |    X   | $DC96
    .byte $1F ; |   XXXXX| $DC97
    .byte $7F ; | XXXXXXX| $DC98
    .byte $EF ; |XXX XXXX| $DC99
    .byte $00 ; |        | $DC9A
    .byte $00 ; |        | $DC9B
    .byte $00 ; |        | $DC9C
    .byte $08 ; |    X   | $DC9D
    .byte $0F ; |    XXXX| $DC9E
    .byte $3F ; |  XXXXXX| $DC9F
    .byte $7F ; | XXXXXXX| $DCA0
    .byte $40 ; | X      | $DCA1
    .byte $80 ; |X       | $DCA2
    .byte $00 ; |        | $DCA3
    .byte $02 ; |      X | $DCA4
    .byte $04 ; |     X  | $DCA5
    .byte $48 ; | X  X   | $DCA6
    .byte $F0 ; |XXXX    | $DCA7
    .byte $F8 ; |XXXXX   | $DCA8
    .byte $EC ; |XXX XX  | $DCA9
    .byte $12 ; |   X  X | $DCAA
    .byte $01 ; |       X| $DCAB
    .byte $00 ; |        | $DCAC
    .byte $00 ; |        | $DCAD
    .byte $00 ; |        | $DCAE
    .byte $40 ; | X      | $DCAF
    .byte $FF ; |XXXXXXXX| $DCB0
    .byte $FF ; |XXXXXXXX| $DCB1
    .byte $E8 ; |XXX X   | $DCB2
    .byte $10 ; |   X    | $DCB3
    .byte $00 ; |        | $DCB4
    .byte $00 ; |        | $DCB5
    .byte $00 ; |        | $DCB6
    .byte $47 ; | X   XXX| $DCB7
    .byte $F8 ; |XXXXX   | $DCB8
    .byte $F8 ; |XXXXX   | $DCB9
    .byte $EC ; |XXX XX  | $DCBA
    .byte $13 ; |   X  XX| $DCBB
    .byte $00 ; |        | $DCBC
    .byte $00 ; |        | $DCBD
    .byte $00 ; |        | $DCBE
    .byte $8E ; |X   XXX | $DCBF
    .byte $51 ; | X X   X| $DCC0
    .byte $51 ; | X X   X| $DCC1
    .byte $51 ; | X X   X| $DCC2
    .byte $51 ; | X X   X| $DCC3
    .byte $51 ; | X X   X| $DCC4
    .byte $8E ; |X   XXX | $DCC5
    .byte $00 ; |        | $DCC6
    .byte $00 ; |        | $DCC7
    .byte $00 ; |        | $DCC8
    .byte $73 ; | XXX  XX| $DCC9
    .byte $24 ; |  X  X  | $DCCA
    .byte $24 ; |  X  X  | $DCCB
    .byte $24 ; |  X  X  | $DCCC
    .byte $24 ; |  X  X  | $DCCD
    .byte $64 ; | XX  X  | $DCCE
    .byte $23 ; |  X   XX| $DCCF
    .byte $00 ; |        | $DCD0
    .byte $00 ; |        | $DCD1
    .byte $00 ; |        | $DCD2
    .byte $F3 ; |XXXX  XX| $DCD3
    .byte $84 ; |X    X  | $DCD4
    .byte $44 ; | X   X  | $DCD5
    .byte $34 ; |  XX X  | $DCD6
    .byte $14 ; |   X X  | $DCD7
    .byte $94 ; |X  X X  | $DCD8
    .byte $63 ; | XX   XX| $DCD9
    .byte $00 ; |        | $DCDA
    .byte $00 ; |        | $DCDB
    .byte $00 ; |        | $DCDC
    .byte $63 ; | XX   XX| $DCDD
    .byte $94 ; |X  X X  | $DCDE
    .byte $14 ; |   X X  | $DCDF
    .byte $24 ; |  X  X  | $DCE0
    .byte $14 ; |   X X  | $DCE1
    .byte $94 ; |X  X X  | $DCE2
    .byte $63 ; | XX   XX| $DCE3
    .byte $1A ; |   XX X | $DCE4
    .byte $48 ; | X  X   | $DCE5
    .byte $48 ; | X  X   | $DCE6
    .byte $48 ; | X  X   | $DCE7
    .byte $48 ; | X  X   | $DCE8
    .byte $48 ; | X  X   | $DCE9
    .byte $48 ; | X  X   | $DCEA
    .byte $0E ; |    XXX | $DCEB
    .byte $0E ; |    XXX | $DCEC
    .byte $0E ; |    XXX | $DCED
    .byte $0E ; |    XXX | $DCEE
    .byte $0E ; |    XXX | $DCEF
    .byte $0E ; |    XXX | $DCF0
    .byte $0E ; |    XXX | $DCF1
    .byte $0E ; |    XXX | $DCF2
    .byte $48 ; | X  X   | $DCF3
    .byte $48 ; | X  X   | $DCF4
    .byte $48 ; | X  X   | $DCF5
    .byte $48 ; | X  X   | $DCF6
    .byte $0E ; |    XXX | $DCF7
    .byte $0E ; |    XXX | $DCF8
LDCF9:
    .byte $B6 ; |X XX XX | $DCF9
    .byte $FF ; |XXXXXXXX| $DCFA
    .byte $FF ; |XXXXXXXX| $DCFB
    .byte $B6 ; |X XX XX | $DCFC
LDCFD:
    .byte $8A ; |X   X X | $DCFD
    .byte $9F ; |X  XXXXX| $DCFE
    .byte $B4 ; |X XX X  | $DCFF
    .byte $00 ; |        | $DD00
    .byte $C3 ; |XX    XX| $DD01
    .byte $41 ; | X     X| $DD02
    .byte $43 ; | X    XX| $DD03
    .byte $66 ; | XX  XX | $DD04
    .byte $34 ; |  XX X  | $DD05
    .byte $1E ; |   XXXX | $DD06
    .byte $0F ; |    XXXX| $DD07
    .byte $70 ; | XXX    | $DD08
    .byte $1E ; |   XXXX | $DD09
    .byte $7E ; | XXXXXX | $DD0A
    .byte $78 ; | XXXX   | $DD0B
    .byte $30 ; |  XX    | $DD0C
    .byte $F8 ; |XXXXX   | $DD0D
    .byte $70 ; | XXX    | $DD0E
    .byte $00 ; |        | $DD0F
    .byte $00 ; |        | $DD10
    .byte $00 ; |        | $DD11
    .byte $01 ; |       X| $DD12
    .byte $C1 ; |XX     X| $DD13
    .byte $43 ; | X    XX| $DD14
    .byte $46 ; | X   XX | $DD15
    .byte $44 ; | X   X  | $DD16
    .byte $7C ; | XXXXX  | $DD17
    .byte $3C ; |  XXXX  | $DD18
    .byte $00 ; |        | $DD19
    .byte $0E ; |    XXX | $DD1A
    .byte $0E ; |    XXX | $DD1B
    .byte $3E ; |  XXXXX | $DD1C
    .byte $7E ; | XXXXXX | $DD1D
    .byte $4E ; | X  XXX | $DD1E
    .byte $58 ; | X XX   | $DD1F
    .byte $1c;$5C ; | X XXX  | $DD20   fix color (a little) so it looks more like a hand
    .byte $0C ; |    XX  | $DD21
    .byte $3E ; |  XXXXX | $DD22
    .byte $1C ; |   XXX  | $DD23
    .byte $00 ; |        | $DD24
    .byte $00 ; |        | $DD25
    .byte $00 ; |        | $DD26
    .byte $01 ; |       X| $DD27
    .byte $63 ; | XX   XX| $DD28
    .byte $26 ; |  X  XX | $DD29
    .byte $24 ; |  X  X  | $DD2A
    .byte $24 ; |  X  X  | $DD2B
    .byte $3C ; |  XXXX  | $DD2C
    .byte $1C ; |   XXX  | $DD2D
    .byte $0C ; |    XX  | $DD2E
    .byte $00 ; |        | $DD2F
    .byte $2D ; |  X XX X| $DD30
    .byte $7D ; | XXXXX X| $DD31
    .byte $5F ; | X XXXXX| $DD32
    .byte $4E ; | X  XXX | $DD33
    .byte $0C ; |    XX  | $DD34
    .byte $18 ; |   XX   | $DD35
    .byte $1C ; |   XXX  | $DD36
    .byte $0C ; |    XX  | $DD37
    .byte $3E ; |  XXXXX | $DD38
    .byte $1C ; |   XXX  | $DD39
    .byte $00 ; |        | $DD3A
    .byte $00 ; |        | $DD3B
    .byte $00 ; |        | $DD3C
    .byte $18 ; |   XX   | $DD3D
    .byte $0A ; |    X X | $DD3E
    .byte $0C ; |    XX  | $DD3F
    .byte $38 ; |  XXX   | $DD40
    .byte $28 ; |  X X   | $DD41
    .byte $38 ; |  XXX   | $DD42
    .byte $1C ; |   XXX  | $DD43
    .byte $0C ; |    XX  | $DD44
    .byte $00 ; |        | $DD45
    .byte $1E ; |   XXXX | $DD46
    .byte $7E ; | XXXXXX | $DD47
    .byte $4E ; | X  XXX | $DD48
    .byte $0E ; |    XXX | $DD49
    .byte $0C ; |    XX  | $DD4A
    .byte $18 ; |   XX   | $DD4B
    .byte $1C ; |   XXX  | $DD4C
    .byte $0C ; |    XX  | $DD4D
    .byte $3E ; |  XXXXX | $DD4E
    .byte $1C ; |   XXX  | $DD4F
    .byte $00 ; |        | $DD50
    .byte $00 ; |        | $DD51
    .byte $00 ; |        | $DD52
    .byte $03 ; |      XX| $DD53
    .byte $01 ; |       X| $DD54
    .byte $03 ; |      XX| $DD55
    .byte $C6 ; |XX   XX | $DD56
    .byte $44 ; | X   X  | $DD57
    .byte $44 ; | X   X  | $DD58
    .byte $44 ; | X   X  | $DD59
    .byte $7C ; | XXXXX  | $DD5A
    .byte $7C ; | XXXXX  | $DD5B
    .byte $00 ; |        | $DD5C
    .byte $0D ; |    XX X| $DD5D
    .byte $0D ; |    XX X| $DD5E
    .byte $7D ; | XXXXX X| $DD5F
    .byte $7F ; | XXXXXXX| $DD60
    .byte $4F ; | X  XXXX| $DD61
    .byte $58 ; | X XX   | $DD62
    .byte $5C ; | X XXX  | $DD63
    .byte $0C ; |    XX  | $DD64
    .byte $3E ; |  XXXXX | $DD65
    .byte $1C ; |   XXX  | $DD66
    .byte $00 ; |        | $DD67
    .byte $00 ; |        | $DD68
    .byte $00 ; |        | $DD69
    .byte $00 ; |        | $DD6A
    .byte $C0 ; |XX      | $DD6B
    .byte $41 ; | X     X| $DD6C
    .byte $47 ; | X   XXX| $DD6D
    .byte $47 ; | X   XXX| $DD6E
    .byte $64 ; | XX  X  | $DD6F
    .byte $3C ; |  XXXX  | $DD70
    .byte $1C ; |   XXX  | $DD71
    .byte $00 ; |        | $DD72
    .byte $0D ; |    XX X| $DD73
    .byte $1D ; |   XXX X| $DD74
    .byte $3F ; |  XXXXXX| $DD75
    .byte $6E ; | XX XXX | $DD76
    .byte $4C ; | X  XX  | $DD77
    .byte $18 ; |   XX   | $DD78
    .byte $1C ; |   XXX  | $DD79
    .byte $0C ; |    XX  | $DD7A
    .byte $3E ; |  XXXXX | $DD7B
    .byte $1C ; |   XXX  | $DD7C
    .byte $00 ; |        | $DD7D
    .byte $00 ; |        | $DD7E
    .byte $00 ; |        | $DD7F
    .byte $66 ; | XX  XX | $DD80
    .byte $3C ; |  XXXX  | $DD81
    .byte $81 ; |X      X| $DD82
    .byte $FF ; |XXXXXXXX| $DD83
    .byte $18 ; |   XX   | $DD84
    .byte $18 ; |   XX   | $DD85
    .byte $3C ; |  XXXX  | $DD86
    .byte $18 ; |   XX   | $DD87
    .byte $02 ; |      X | $DD88
    .byte $40 ; | X      | $DD89
    .byte $10 ; |   X    | $DD8A
    .byte $00 ; |        | $DD8B
    .byte $18 ; |   XX   | $DD8C
    .byte $3C ; |  XXXX  | $DD8D
    .byte $3C ; |  XXXX  | $DD8E
    .byte $3C ; |  XXXX  | $DD8F
    .byte $3C ; |  XXXX  | $DD90
    .byte $3C ; |  XXXX  | $DD91
    .byte $18 ; |   XX   | $DD92
    .byte $00 ; |        | $DD93
    .byte $00 ; |        | $DD94
    .byte $00 ; |        | $DD95
    .byte $00 ; |        | $DD96
    .byte $18 ; |   XX   | $DD97
    .byte $3C ; |  XXXX  | $DD98
    .byte $3C ; |  XXXX  | $DD99
    .byte $7E ; | XXXXXX | $DD9A
    .byte $7E ; | XXXXXX | $DD9B
    .byte $7E ; | XXXXXX | $DD9C
    .byte $7E ; | XXXXXX | $DD9D
    .byte $7E ; | XXXXXX | $DD9E
    .byte $3C ; |  XXXX  | $DD9F
    .byte $3C ; |  XXXX  | $DDA0
    .byte $18 ; |   XX   | $DDA1
LDDA2:
    .byte $07 ; |     XXX| $DDA2
    .byte $1B ; |   XX XX| $DDA3
    .byte $2F ; |  X XXXX| $DDA4
    .byte $3F ; |  XXXXXX| $DDA5
    .byte $53 ; | X X  XX| $DDA6
    .byte $67 ; | XX  XXX| $DDA7
    .byte $7A ; | XXXX X | $DDA8
    .byte $8C ; |X   XX  | $DDA9
    .byte $93 ; |X  X  XX| $DDAA
    .byte $9A ; |X  XX X | $DDAB
    .byte $8C ; |X   XX  | $DDAC
    .byte $93 ; |X  X  XX| $DDAD
    .byte $9A ; |X  XX X | $DDAE
    .byte $C6 ; |XX   XX | $DDAF
    .byte $D0 ; |XX X    | $DDB0
    .byte $DA ; |XX XX X | $DDB1
LDDB2:
    .byte $11 ; |   X   X| $DDB2
    .byte $25 ; |  X  X X| $DDB3
    .byte $38 ; |  XXX   | $DDB4
    .byte $49 ; | X  X  X| $DDB5
    .byte $5D ; | X XXX X| $DDB6
    .byte $70 ; | XXX    | $DDB7
    .byte $84 ; |X    X  | $DDB8
    .byte $AC ; |X X XX  | $DDB9
    .byte $AC ; |X X XX  | $DDBA
    .byte $AC ; |X X XX  | $DDBB
    .byte $B4 ; |X XX X  | $DDBC
    .byte $AC ; |X X XX  | $DDBD
    .byte $A3 ; |X X   XX| $DDBE
    .byte $BC ; |X XXXX  | $DDBF
    .byte $BC ; |X XXXX  | $DDC0
    .byte $BC ; |X XXXX  | $DDC1
    .byte $F8 ; |XXXXX   | $DDC2
    .byte $F8 ; |XXXXX   | $DDC3
    .byte $F8 ; |XXXXX   | $DDC4
    .byte $F8 ; |XXXXX   | $DDC5
    .byte $F8 ; |XXXXX   | $DDC6
    .byte $F8 ; |XXXXX   | $DDC7
    .byte $F8 ; |XXXXX   | $DDC8
    .byte $F8 ; |XXXXX   | $DDC9
    .byte $F8 ; |XXXXX   | $DDCA
    .byte $F8 ; |XXXXX   | $DDCB
    .byte $F8 ; |XXXXX   | $DDCC
    .byte $F8 ; |XXXXX   | $DDCD
    .byte $F8 ; |XXXXX   | $DDCE
    .byte $F8 ; |XXXXX   | $DDCF
    .byte $F8 ; |XXXXX   | $DDD0
    .byte $F8 ; |XXXXX   | $DDD1
    .byte $F8 ; |XXXXX   | $DDD2
    .byte $F8 ; |XXXXX   | $DDD3
    .byte $F8 ; |XXXXX   | $DDD4
    .byte $F8 ; |XXXXX   | $DDD5
    .byte $4A ; | X  X X | $DDD6
    .byte $F8 ; |XXXXX   | $DDD7
    .byte $4A ; | X  X X | $DDD8
    .byte $F8 ; |XXXXX   | $DDD9
    .byte $88 ; |X   X   | $DDDA
    .byte $F8 ; |XXXXX   | $DDDB
    .byte $88 ; |X   X   | $DDDC
    .byte $46 ; | X   XX | $DDDD
    .byte $D8 ; |XX XX   | $DDDE
    .byte $F8 ; |XXXXX   | $DDDF
    .byte $D8 ; |XX XX   | $DDE0
    .byte $F8 ; |XXXXX   | $DDE1
    .byte $4A ; | X  X X | $DDE2
    .byte $F8 ; |XXXXX   | $DDE3
    .byte $1A ; |   XX X | $DDE4
    .byte $F8 ; |XXXXX   | $DDE5
    .byte $1A ; |   XX X | $DDE6
    .byte $0A ; |    X X | $DDE7
    .byte $1A ; |   XX X | $DDE8
    .byte $0A ; |    X X | $DDE9
    .byte $0A ; |    X X | $DDEA
    .byte $0A ; |    X X | $DDEB
LDDEC:
    .byte $6D ; | XX XX X| $DDEC
    .byte $FF ; |XXXXXXXX| $DDED
    .byte $FF ; |XXXXXXXX| $DDEE
    .byte $6D ; | XX XX X| $DDEF
LDDF0:
    .byte $00 ; |        | $DDF0
    .byte $00 ; |        | $DDF1
    .byte $00 ; |        | $DDF2
    .byte $02 ; |      X | $DDF3
    .byte $04 ; |     X  | $DDF4
    .byte $08 ; |    X   | $DDF5
    .byte $0A ; |    X X | $DDF6
LDDF7:
    .byte $73 ; | XXX  XX| $DDF7
    .byte $5C ; | X XXX  | $DDF8
    .byte $45 ; | X   X X| $DDF9
    .byte $2E ; |  X XXX | $DDFA
    .byte $17 ; |   X XXX| $DDFB
    .byte $00 ; |        | $DDFC
LDDFD:
    .byte $D4 ; |XX X X  | $DDFD
    .byte $D5 ; |XX X X X| $DDFE
    .byte $D5 ; |XX X X X| $DDFF
    .byte $07 ; |     XXX| $DE00
    .byte $18 ; |   XX   | $DE01
    .byte $13 ; |   X  XX| $DE02
    .byte $14 ; |   X X  | $DE03
    .byte $15 ; |   X X X| $DE04
    .byte $14 ; |   X X  | $DE05
    .byte $13 ; |   X  XX| $DE06
    .byte $18 ; |   XX   | $DE07
    .byte $07 ; |     XXX| $DE08
    .byte $70 ; | XXX    | $DE09
    .byte $4E ; | X  XXX | $DE0A
    .byte $42 ; | X    X | $DE0B
    .byte $73 ; | XXX  XX| $DE0C
    .byte $19 ; |   XX  X| $DE0D
    .byte $09 ; |    X  X| $DE0E
    .byte $05 ; |     X X| $DE0F
    .byte $05 ; |     X X| $DE10
    .byte $05 ; |     X X| $DE11
    .byte $05 ; |     X X| $DE12
    .byte $7D ; | XXXXX X| $DE13
    .byte $40 ; | X      | $DE14
    .byte $40 ; | X      | $DE15
    .byte $7F ; | XXXXXXX| $DE16
    .byte $80 ; |X       | $DE17
    .byte $7F ; | XXXXXXX| $DE18
    .byte $2B ; |  X X XX| $DE19
    .byte $AB ; |X X X XX| $DE1A
    .byte $A3 ; |X X   XX| $DE1B
    .byte $AB ; |X X X XX| $DE1C
    .byte $36 ; |  XX XX | $DE1D
    .byte $7F ; | XXXXXXX| $DE1E
    .byte $80 ; |X       | $DE1F
    .byte $1F ; |   XXXXX| $DE20
    .byte $00 ; |        | $DE21
    .byte $35 ; |  XX X X| $DE22
    .byte $55 ; | X X X X| $DE23
    .byte $55 ; | X X X X| $DE24
    .byte $55 ; | X X X X| $DE25
    .byte $55 ; | X X X X| $DE26
    .byte $06 ; |     XX | $DE27
    .byte $70 ; | XXX    | $DE28
    .byte $1C ; |   XXX  | $DE29
    .byte $C6 ; |XX   XX | $DE2A
    .byte $43 ; | X    XX| $DE2B
    .byte $40 ; | X      | $DE2C
    .byte $C0 ; |XX      | $DE2D
    .byte $00 ; |        | $DE2E
    .byte $FF ; |XXXXXXXX| $DE2F
    .byte $6A ; | XX X X | $DE30
    .byte $6A ; | XX X X | $DE31
    .byte $62 ; | XX   X | $DE32
    .byte $6A ; | XX X X | $DE33
    .byte $36 ; |  XX XX | $DE34
    .byte $FF ; |XXXXXXXX| $DE35
    .byte $00 ; |        | $DE36
    .byte $F7 ; |XXXX XXX| $DE37
    .byte $10 ; |   X    | $DE38
    .byte $74 ; | XXX X  | $DE39
    .byte $55 ; | X X X X| $DE3A
    .byte $55 ; | X X X X| $DE3B
    .byte $55 ; | X X X X| $DE3C
    .byte $54 ; | X X X  | $DE3D
    .byte $54 ; | X X X  | $DE3E
    .byte $25 ; |  X  X X| $DE3F
    .byte $0F ; |    XXXX| $DE40
    .byte $3C ; |  XXXX  | $DE41
    .byte $E5 ; |XXX  X X| $DE42
    .byte $15 ; |   X X X| $DE43
    .byte $0A ; |    X X | $DE44
    .byte $00 ; |        | $DE45
    .byte $FF ; |XXXXXXXX| $DE46
    .byte $AE ; |X X XXX | $DE47
    .byte $AE ; |X X XXX | $DE48
    .byte $6E ; | XX XXX | $DE49
    .byte $AE ; |X X XXX | $DE4A
    .byte $2E ; |  X XXX | $DE4B
    .byte $FF ; |XXXXXXXX| $DE4C
    .byte $00 ; |        | $DE4D
    .byte $FF ; |XXXXXXXX| $DE4E
    .byte $00 ; |        | $DE4F
    .byte $CA ; |XX  X X | $DE50
    .byte $0A ; |    X X | $DE51
    .byte $CA ; |XX  X X | $DE52
    .byte $4A ; | X  X X | $DE53
    .byte $8A ; |X   X X | $DE54
    .byte $0A ; |    X X | $DE55
    .byte $CC ; |XX  XX  | $DE56
    .byte $68 ; | XX X   | $DE57
    .byte $39 ; |  XXX  X| $DE58
    .byte $0F ; |    XXXX| $DE59
    .byte $08 ; |    X   | $DE5A
    .byte $08 ; |    X   | $DE5B
    .byte $00 ; |        | $DE5C
    .byte $FF ; |XXXXXXXX| $DE5D
    .byte $88 ; |X   X   | $DE5E
    .byte $EA ; |XXX X X | $DE5F
    .byte $88 ; |X   X   | $DE60
    .byte $AA ; |X X X X | $DE61
    .byte $88 ; |X   X   | $DE62
    .byte $FF ; |XXXXXXXX| $DE63
    .byte $00 ; |        | $DE64
    .byte $FE ; |XXXXXXX | $DE65
    .byte $00 ; |        | $DE66
    .byte $6A ; | XX X X | $DE67
    .byte $AA ; |X X X X | $DE68
    .byte $AA ; |X X X X | $DE69
    .byte $AA ; |X X X X | $DE6A
    .byte $AC ; |X X XX  | $DE6B
    .byte $80 ; |X       | $DE6C
    .byte $1E ; |   XXXX | $DE6D
    .byte $70 ; | XXX    | $DE6E
    .byte $C7 ; |XX   XXX| $DE6F
    .byte $04 ; |     X  | $DE70
    .byte $04 ; |     X  | $DE71
    .byte $07 ; |     XXX| $DE72
    .byte $00 ; |        | $DE73
    .byte $F8 ; |XXXXX   | $DE74
    .byte $88 ; |X   X   | $DE75
    .byte $E8 ; |XXX X   | $DE76
    .byte $C8 ; |XX  X   | $DE77
    .byte $E8 ; |XXX X   | $DE78
    .byte $88 ; |X   X   | $DE79
    .byte $F8 ; |XXXXX   | $DE7A
    .byte $00 ; |        | $DE7B
    .byte $0E ; |    XXX | $DE7C
    .byte $72 ; | XXX  X | $DE7D
    .byte $42 ; | X    X | $DE7E
    .byte $CE ; |XX  XXX | $DE7F
    .byte $98 ; |X  XX   | $DE80
    .byte $90 ; |X  X    | $DE81
    .byte $A0 ; |X X     | $DE82
    .byte $A0 ; |X X     | $DE83
    .byte $A0 ; |X X     | $DE84
    .byte $A0 ; |X X     | $DE85
    .byte $BE ; |X XXXXX | $DE86
    .byte $02 ; |      X | $DE87
    .byte $02 ; |      X | $DE88
    .byte $FE ; |XXXXXXX | $DE89
    .byte $00 ; |        | $DE8A
    .byte $00 ; |        | $DE8B
    .byte $00 ; |        | $DE8C
    .byte $00 ; |        | $DE8D
    .byte $E0;$00 ; |        | $DE8E   fix color bleeding by lowering legs
    .byte $FC;$E0 ; |XXX     | $DE8F
    .byte $8E;$FC ; |XXXXXX  | $DE90
    .byte $0E;$8E ; |X   XXX | $DE91
    .byte $0E ; |    XXX | $DE92
    .byte $0E ; |    XXX | $DE93
    .byte $00 ; |        | $DE94
    .byte $0E ; |    XXX | $DE95
    .byte $0E ; |    XXX | $DE96
    .byte $1E ; |   XXXX | $DE97
    .byte $3E ; |  XXXXX | $DE98
    .byte $66 ; | XX  XX | $DE99
    .byte $CC ; |XX  XX  | $DE9A
    .byte $8E ; |X   XXX | $DE9B
    .byte $06 ; |     XX | $DE9C
    .byte $1F ; |   XXXXX| $DE9D
    .byte $0E ; |    XXX | $DE9E
    .byte $00 ; |        | $DE9F
    .byte $C0 ; |XX      | $DEA0
    .byte $40 ; | X      | $DEA1
    .byte $40 ; | X      | $DEA2
    .byte $40 ; | X      | $DEA3
    .byte $40 ; | X      | $DEA4
    .byte $70 ; | XXX    | $DEA5
    .byte $7C ; | XXXXX  | $DEA6
    .byte $1E ; |   XXXX | $DEA7
    .byte $0E ; |    XXX | $DEA8
    .byte $00 ; |        | $DEA9
    .byte $0E ; |    XXX | $DEAA
    .byte $0E ; |    XXX | $DEAB
    .byte $1E ; |   XXXX | $DEAC
    .byte $3E ; |  XXXXX | $DEAD
    .byte $66 ; | XX  XX | $DEAE
    .byte $4C ; | X  XX  | $DEAF
    .byte $4E ; | X  XXX | $DEB0
    .byte $46 ; | X   XX | $DEB1
    .byte $1F;$5F ; | X XXXXX| $DEB2   fix color bleeding by shortening arms
    .byte $0E ; |    XXX | $DEB3
    .byte $00 ; |        | $DEB4
    .byte $00 ; |        | $DEB5
    .byte $0D ; |    XX X| $DEB6
    .byte $1F ; |   XXXXX| $DEB7
    .byte $1B ; |   XX XX| $DEB8
    .byte $19 ; |   XX  X| $DEB9
    .byte $18 ; |   XX   | $DEBA
    .byte $18 ; |   XX   | $DEBB
    .byte $1C ; |   XXX  | $DEBC
    .byte $1C ; |   XXX  | $DEBD
    .byte $00 ; |        | $DEBE
    .byte $1C ; |   XXX  | $DEBF
    .byte $1C ; |   XXX  | $DEC0
    .byte $3C ; |  XXXX  | $DEC1
    .byte $7C ; | XXXXX  | $DEC2
    .byte $48 ; | X  X   | $DEC3
    .byte $58 ; | X XX   | $DEC4
    .byte $5C ; | X XXX  | $DEC5
    .byte $4C ; | X  XX  | $DEC6
    .byte $3E ; |  XXXXX | $DEC7
    .byte $1C ; |   XXX  | $DEC8
LDEC9:
    .byte $00 ; |        | $DEC9
    .byte $0F ; |    XXXX| $DECA
    .byte $26 ; |  X  XX | $DECB
    .byte $3C ; |  XXXX  | $DECC
    .byte $52 ; | X X  X | $DECD
    .byte $68 ; | XX X   | $DECE
    .byte $7F ; | XXXXXXX| $DECF
LDED0:
    .byte $00 ; |        | $DED0
    .byte $00 ; |        | $DED1
    .byte $00 ; |        | $DED2
    .byte $00 ; |        | $DED3
LDED4:
    .byte $00 ; |        | $DED4
    .byte $C0 ; |XX      | $DED5
    .byte $F0 ; |XXXX    | $DED6
    .byte $FC ; |XXXXXX  | $DED7
    .byte $FF ; |XXXXXXXX| $DED8
    .byte $FF ; |XXXXXXXX| $DED9
    .byte $FF ; |XXXXXXXX| $DEDA
    .byte $FF ; |XXXXXXXX| $DEDB
    .byte $FF ; |XXXXXXXX| $DEDC
LDEDD:
    .byte $25 ; |  X  X X| $DEDD
    .byte $3B ; |  XXX XX| $DEDE
    .byte $3B ; |  XXX XX| $DEDF
LDEE0:
    .byte $4A ; | X  X X | $DEE0
    .byte $4A ; | X  X X | $DEE1
    .byte $4A ; | X  X X | $DEE2
    .byte $4A ; | X  X X | $DEE3
    .byte $4A ; | X  X X | $DEE4
    .byte $4A ; | X  X X | $DEE5
    .byte $4A ; | X  X X | $DEE6
    .byte $F8 ; |XXXXX   | $DEE7
    .byte $F8 ; |XXXXX   | $DEE8
    .byte $F8 ; |XXXXX   | $DEE9
    .byte $F8 ; |XXXXX   | $DEEA
    .byte $F8 ; |XXXXX   | $DEEB
    .byte $F8 ; |XXXXX   | $DEEC
    .byte $FE ; |XXXXXXX | $DEED
    .byte $FE ; |XXXXXXX | $DEEE
    .byte $FE ; |XXXXXXX | $DEEF
LDEF0:
    .byte $0E ; |    XXX | $DEF0
    .byte $0E ; |    XXX | $DEF1
    .byte $0E ; |    XXX | $DEF2
    .byte $0E ; |    XXX | $DEF3
    .byte $0E ; |    XXX | $DEF4
    .byte $0E ; |    XXX | $DEF5
    .byte $0E ; |    XXX | $DEF6
    .byte $F8 ; |XXXXX   | $DEF7
    .byte $F8 ; |XXXXX   | $DEF8
    .byte $F8 ; |XXXXX   | $DEF9
    .byte $F8 ; |XXXXX   | $DEFA
    .byte $F8 ; |XXXXX   | $DEFB
    .byte $F8 ; |XXXXX   | $DEFC
    .byte $FE ; |XXXXXXX | $DEFD
    .byte $FE ; |XXXXXXX | $DEFE
    .byte $FE ; |XXXXXXX | $DEFF
    .byte $38 ; |  XXX   | $DF00
    .byte $6C ; | XX XX  | $DF01
    .byte $C6 ; |XX   XX | $DF02
    .byte $C6 ; |XX   XX | $DF03
    .byte $C6 ; |XX   XX | $DF04
    .byte $6C ; | XX XX  | $DF05
    .byte $38 ; |  XXX   | $DF06
    .byte $00 ; |        | $DF07
    .byte $7E ; | XXXXXX | $DF08
    .byte $18 ; |   XX   | $DF09
    .byte $18 ; |   XX   | $DF0A
    .byte $18 ; |   XX   | $DF0B
    .byte $18 ; |   XX   | $DF0C
    .byte $38 ; |  XXX   | $DF0D
    .byte $18 ; |   XX   | $DF0E
    .byte $00 ; |        | $DF0F
    .byte $FE ; |XXXXXXX | $DF10
    .byte $C0 ; |XX      | $DF11
    .byte $E0 ; |XXX     | $DF12
    .byte $3C ; |  XXXX  | $DF13
    .byte $06 ; |     XX | $DF14
    .byte $C6 ; |XX   XX | $DF15
    .byte $7C ; | XXXXX  | $DF16
    .byte $00 ; |        | $DF17
    .byte $FC ; |XXXXXX  | $DF18
    .byte $06 ; |     XX | $DF19
    .byte $06 ; |     XX | $DF1A
    .byte $7C ; | XXXXX  | $DF1B
    .byte $06 ; |     XX | $DF1C
    .byte $06 ; |     XX | $DF1D
    .byte $FC ; |XXXXXX  | $DF1E
    .byte $00 ; |        | $DF1F
    .byte $0C ; |    XX  | $DF20
    .byte $0C ; |    XX  | $DF21
    .byte $0C ; |    XX  | $DF22
    .byte $FE ; |XXXXXXX | $DF23
    .byte $CC ; |XX  XX  | $DF24
    .byte $CC ; |XX  XX  | $DF25
    .byte $CC ; |XX  XX  | $DF26
    .byte $00 ; |        | $DF27
    .byte $FC ; |XXXXXX  | $DF28
    .byte $06 ; |     XX | $DF29
    .byte $06 ; |     XX | $DF2A
    .byte $FC ; |XXXXXX  | $DF2B
    .byte $C0 ; |XX      | $DF2C
    .byte $C0 ; |XX      | $DF2D
    .byte $FC ; |XXXXXX  | $DF2E
    .byte $00 ; |        | $DF2F
    .byte $7C ; | XXXXX  | $DF30
    .byte $C6 ; |XX   XX | $DF31
    .byte $C6 ; |XX   XX | $DF32
    .byte $FC ; |XXXXXX  | $DF33
    .byte $C0 ; |XX      | $DF34
    .byte $C0 ; |XX      | $DF35
    .byte $7C ; | XXXXX  | $DF36
    .byte $00 ; |        | $DF37
    .byte $30 ; |  XX    | $DF38
    .byte $30 ; |  XX    | $DF39
    .byte $18 ; |   XX   | $DF3A
    .byte $18 ; |   XX   | $DF3B
    .byte $0C ; |    XX  | $DF3C
    .byte $06 ; |     XX | $DF3D
    .byte $FE ; |XXXXXXX | $DF3E
    .byte $00 ; |        | $DF3F
    .byte $7C ; | XXXXX  | $DF40
    .byte $C6 ; |XX   XX | $DF41
    .byte $C6 ; |XX   XX | $DF42
    .byte $7C ; | XXXXX  | $DF43
    .byte $C6 ; |XX   XX | $DF44
    .byte $C6 ; |XX   XX | $DF45
    .byte $7C ; | XXXXX  | $DF46
    .byte $00 ; |        | $DF47
    .byte $7C ; | XXXXX  | $DF48
    .byte $06 ; |     XX | $DF49
    .byte $06 ; |     XX | $DF4A
    .byte $7E ; | XXXXXX | $DF4B
    .byte $C6 ; |XX   XX | $DF4C
    .byte $C6 ; |XX   XX | $DF4D
    .byte $7C ; | XXXXX  | $DF4E
    .byte $00 ; |        | $DF4F
    .byte $00 ; |        | $DF50
    .byte $00 ; |        | $DF51
    .byte $00 ; |        | $DF52
    .byte $00 ; |        | $DF53
    .byte $00 ; |        | $DF54
    .byte $00 ; |        | $DF55
    .byte $00 ; |        | $DF56
    .byte $77 ; | XXX XXX| $DF57
    .byte $55 ; | X X X X| $DF58
    .byte $55 ; | X X X X| $DF59
    .byte $55 ; | X X X X| $DF5A
    .byte $77 ; | XXX XXX| $DF5B
    .byte $00 ; |        | $DF5C
    .byte $77 ; | XXX XXX| $DF5D
    .byte $22 ; |  X   X | $DF5E
    .byte $22 ; |  X   X | $DF5F
    .byte $66 ; | XX  XX | $DF60
    .byte $22 ; |  X   X | $DF61
    .byte $00 ; |        | $DF62
    .byte $77 ; | XXX XXX| $DF63
    .byte $44 ; | X   X  | $DF64
    .byte $33 ; |  XX  XX| $DF65
    .byte $11 ; |   X   X| $DF66
    .byte $77 ; | XXX XXX| $DF67
    .byte $00 ; |        | $DF68
    .byte $77 ; | XXX XXX| $DF69
    .byte $11 ; |   X   X| $DF6A
    .byte $33 ; |  XX  XX| $DF6B
    .byte $11 ; |   X   X| $DF6C
    .byte $77 ; | XXX XXX| $DF6D
    .byte $00 ; |        | $DF6E
    .byte $11 ; |   X   X| $DF6F
    .byte $11 ; |   X   X| $DF70
    .byte $77 ; | XXX XXX| $DF71
    .byte $55 ; | X X X X| $DF72
    .byte $55 ; | X X X X| $DF73
    .byte $00 ; |        | $DF74
    .byte $77 ; | XXX XXX| $DF75
    .byte $11 ; |   X   X| $DF76
    .byte $66 ; | XX  XX | $DF77
    .byte $44 ; | X   X  | $DF78
    .byte $77 ; | XXX XXX| $DF79
    .byte $00 ; |        | $DF7A
    .byte $77 ; | XXX XXX| $DF7B
    .byte $55 ; | X X X X| $DF7C
    .byte $77 ; | XXX XXX| $DF7D
    .byte $44 ; | X   X  | $DF7E
    .byte $77 ; | XXX XXX| $DF7F
LDF80:
    .byte $00 ; |        | $DF80
    .byte $70 ; | XXX    | $DF81
    .byte $50 ; | X X    | $DF82
    .byte $40 ; | X      | $DF83
    .byte $70 ; | XXX    | $DF84
    .byte $44 ; | X   X  | $DF85
    .byte $66 ; | XX  XX | $DF86
    .byte $33 ; |  XX  XX| $DF87
    .byte $11 ; |   X   X| $DF88
    .byte $77 ; | XXX XXX| $DF89
LDF8A:
    .byte $00 ; |        | $DF8A
    .byte $29 ; |  X X  X| $DF8B
    .byte $AB ; |X X X XX| $DF8C
    .byte $AD ; |X X XX X| $DF8D
    .byte $A9 ; |X X X  X| $DF8E
    .byte $77 ; | XXX XXX| $DF8F
    .byte $55 ; | X X X X| $DF90
    .byte $77 ; | XXX XXX| $DF91
    .byte $55 ; | X X X X| $DF92
    .byte $77 ; | XXX XXX| $DF93
LDF94:
    .byte $00 ; |        | $DF94
    .byte $C9 ; |XX  X  X| $DF95
    .byte $AA ; |X X X X | $DF96
    .byte $AA ; |X X X X | $DF97
    .byte $CA ; |XX  X X | $DF98
    .byte $77 ; | XXX XXX| $DF99
    .byte $11 ; |   X   X| $DF9A
    .byte $77 ; | XXX XXX| $DF9B
    .byte $55 ; | X X X X| $DF9C
    .byte $77 ; | XXX XXX| $DF9D
    .byte $00 ; |        | $DF9E
LDF9F:
    .byte $C1 ; |XX     X| $DF9F
    .byte $BB ; |X XXX XX| $DFA0
    .byte $B6 ; |X XX XX | $DFA1
    .byte $B0 ; |X XX    | $DFA2
    .byte $AA ; |X X X X | $DFA3
    .byte $A6 ; |X X  XX | $DFA4
    .byte $A0 ; |X X     | $DFA5
    .byte $01 ; |       X| $DFA6
    .byte $01 ; |       X| $DFA7
    .byte $01 ; |       X| $DFA8
    .byte $01 ; |       X| $DFA9
    .byte $01 ; |       X| $DFAA
    .byte $01 ; |       X| $DFAB
    .byte $01 ; |       X| $DFAC
    .byte $01 ; |       X| $DFAD
    .byte $01 ; |       X| $DFAE
    .byte $00 ; |        | $DFAF
    .byte $01 ; |       X| $DFB0
    .byte $00 ; |        | $DFB1
    .byte $01 ; |       X| $DFB2
    .byte $01 ; |       X| $DFB3
    .byte $00 ; |        | $DFB4
    .byte $01 ; |       X| $DFB5
    .byte $00 ; |        | $DFB6
    .byte $01 ; |       X| $DFB7
    .byte $00 ; |        | $DFB8
    .byte $00 ; |        | $DFB9
    .byte $01 ; |       X| $DFBA
    .byte $00 ; |        | $DFBB
    .byte $00 ; |        | $DFBC
    .byte $01 ; |       X| $DFBD
    .byte $00 ; |        | $DFBE
    .byte $00 ; |        | $DFBF
    .byte $01 ; |       X| $DFC0
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
    .byte $00 ; |        | $DFDC
    .byte $00 ; |        | $DFDD
    .byte $00 ; |        | $DFDE
LDFDF:
    .byte $02 ; |      X | $DFDF
    .byte $10 ; |   X    | $DFE0
    .byte $11 ; |   X   X| $DFE1
    .byte $11 ; |   X   X| $DFE2
    .byte $10 ; |   X    | $DFE3
    .byte $10 ; |   X    | $DFE4
    .byte $08 ; |    X   | $DFE5
LDFE6:
    .byte $0A ; |    X X | $DFE6
    .byte $04 ; |     X  | $DFE7
    .byte $04 ; |     X  | $DFE8
    .byte $0E ; |    XXX | $DFE9
    .byte $15 ; |   X X X| $DFEA
    .byte $04 ; |     X  | $DFEB

LDFEC:
;    sta    LFFF9                 ; 4
    LDA    LFFF9                 ;    avoid bus contention

    jmp    LDB96                 ; 3
LDFF2:
;    sta    LFFF9                 ; 4
    LDA    LFFF9                 ;    avoid bus contention

    jmp    LD066                 ; 3

    .byte $00 ; |        | $DFF8
LDFF9:
    .byte $10 ; |   X    | $DFF9
    .byte $00 ; |        | $DFFA
    .byte $00 ; |        | $DFFB

       ORG $1FFC
      RORG $DFFC

    .word START
    .byte $CA,$D6


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SECOND BANK
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        ORG $2000
       RORG $F000

LF000:
    .byte $80 ; |X       | $F000
    .byte $40 ; | X      | $F001
    .byte $30 ; |  XX    | $F002

START_2nd:
    sei                          ; 2
    cld                          ; 2
    ldx    #$FF                  ; 2
    txs                          ; 2
    lda    #0                    ; 2
LF00A:
    sta    WSYNC,X               ; 4
    dex                          ; 2
    bne    LF00A                 ; 2³
    jsr    LFD9A                 ; 6
LF012:
    ldx    $9E                   ; 3
    bmi    LF02E                 ; 2³
    ldy    $99                   ; 3
    iny                          ; 2
    beq    LF023                 ; 2³
    lda    $9B                   ; 3
    beq    LF02E                 ; 2³
    cmp    #4                    ; 2
    beq    LF02E                 ; 2³
LF023:
    stx    $9B                   ; 3
    lda    #0                    ; 2
    sta    $9A                   ; 3
    lda    LFF73,X               ; 4
    sta    $99                   ; 3
LF02E:
    lda    $98                   ; 3
    bmi    LF086                 ; 2³
    ldy    $99                   ; 3
    bpl    LF03D                 ; 2³
    iny                          ; 2
    sty    AUDV0                 ; 3
    sty    AUDV1                 ; 3
    bpl    LF086                 ; 2³
LF03D:
    dec    $9A                   ; 5
    bpl    LF086                 ; 2³
    ldx    $9B                   ; 3
    lda    LFF86,X               ; 4
    sta    $9A                   ; 3
    lda    LFF90,X               ; 4
    sta    AUDC0                 ; 3
    cpx    #8                    ; 2
    bcs    LF076                 ; 2³
    lda    LFF7C,X               ; 4
    sta    AUDV0                 ; 3
LF056:
    dec    $99                   ; 5
    ldy    $99                   ; 3
    bpl    LF063                 ; 2³
    sty    $9B                   ; 3
    iny                          ; 2
    sty    AUDV0                 ; 3
    bpl    LF086                 ; 2³
LF063:
    lda    LFF9A,X               ; 4
    sta    $96                   ; 3
    lda    #$FF                  ; 2
    sta    $97                   ; 3
    lda    ($96),Y               ; 5
    sta    AUDF0                 ; 3
    bne    LF086                 ; 2³
    sta    AUDV0                 ; 3
    beq    LF086                 ; 2³
LF076:
    dec    $9C                   ; 5
    lda    $9C                   ; 3
    sta    AUDV0                 ; 3
    cpx    #9                    ; 2
    bne    LF056                 ; 2³
    dec    $99                   ; 5
    lda    #$1B                  ; 2
    sta    AUDF0                 ; 3
LF086:
    ldx    #$FF                  ; 2
    lda    $98                   ; 3
    bmi    LF08F                 ; 2³
    ldx    SWCHA                 ; 4
LF08F:
    stx    $9D                   ; 3
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcc    LF0B7                 ; 2³
    lsr                          ; 2
    bcs    LF0BA                 ; 2³
    jsr    LFD9A                 ; 6
    lda    $80                   ; 3
    and    #$7F                  ; 2
    sta    $80                   ; 3
    and    #$1F                  ; 2
    bne    LF0BA                 ; 2³
    lda    $98                   ; 3
    eor    #$01                  ; 2
    sta    $98                   ; 3
    ldx    #1                    ; 2
    lsr                          ; 2
    bcc    LF0B3                 ; 2³
    inx                          ; 2
LF0B3:
    stx    $88                   ; 3
    bne    LF0BA                 ; 2³
LF0B7:
    jsr    LFD86                 ; 6
LF0BA:
    bit    $98                   ; 3
    bpl    LF0DF                 ; 2³
    bit    INPT4                 ; 3
    bpl    LF0B7                 ; 2³
    ldx    $80                   ; 3
    inx                          ; 2
    bne    LF0D3                 ; 2³
    lda    #$80                  ; 2
    sta    $8A                   ; 3
    ldx    $89                   ; 3
    inx                          ; 2
    txa                          ; 2
    and    #$03                  ; 2
    sta    $89                   ; 3
LF0D3:
    lda    $98                   ; 3
    and    #$BF                  ; 2
    bit    $80                   ; 3
    bpl    LF0DD                 ; 2³
    ora    #$40                  ; 2
LF0DD:
    sta    $98                   ; 3
LF0DF:
    ldx    #$FF                  ; 2
    stx    $9E                   ; 3
    ldx    $89                   ; 3
    lda    $80                   ; 3
    cpx    #3                    ; 2
    bne    LF0F3                 ; 2³
    bit    $CB                   ; 3
    bmi    LF120                 ; 2³+1
    and    #$1F                  ; 2
    bpl    LF0F5                 ; 2³
LF0F3:
    and    #$3F                  ; 2
LF0F5:
    bne    LF120                 ; 2³+1
    jsr    LFBD6                 ; 6
    lda    $86                   ; 3
    bne    LF105                 ; 2³+1
    lda    $87                   ; 3
    bne    LF105                 ; 2³
    jsr    LFD9A                 ; 6
LF105:
    ldx    $89                   ; 3
    dex                          ; 2
    bne    LF120                 ; 2³
    lda    $8B                   ; 3
    bne    LF112                 ; 2³
    bit    $80                   ; 3
    bvs    LF120                 ; 2³
LF112:
    dec    $E3                   ; 5
    bne    LF120                 ; 2³
    dec    $88                   ; 5
    ldx    #1                    ; 2
    stx    $EA                   ; 3
    lda    #6                    ; 2
    sta    $EB                   ; 3
LF120:
    lda    $89                   ; 3
    bne    LF170                 ; 2³
    ldx    #1                    ; 2
LF126:
    inc    $EC,X                 ; 6
    lda    $EC,X                 ; 4
    cmp    $DB,X                 ; 4
    bcc    LF166                 ; 2³
    lda    #0                    ; 2
    sta    $EC,X                 ; 4
    ldy    $E0,X                 ; 4
    bmi    LF13A                 ; 2³
    cpy    #7                    ; 2
    bmi    LF13C                 ; 2³
LF13A:
    ldy    #1                    ; 2
LF13C:
    lda    $EE                   ; 3
    and    LFFFA,X               ; 4
    pha                          ; 3
    lda    $E2,X                 ; 4
    stx    $FA                   ; 3
    tax                          ; 2
    pla                          ; 4
    jsr    LFDBC                 ; 6
    stx    $FB                   ; 3
    ldx    $FA                   ; 3
    sty    $E0,X                 ; 4
    ldy    $FB                   ; 3
    sty    $E2,X                 ; 4
    tay                          ; 2
    beq    LF15F                 ; 2³
    lda    $EE                   ; 3
    ora    LFFFA,X               ; 4
    bne    LF164                 ; 2³
LF15F:
    lda    $EE                   ; 3
    and    LFED6,X               ; 4
LF164:
    sta    $EE                   ; 3
LF166:
    dex                          ; 2
    bpl    LF126                 ; 2³
    lda    $F1                   ; 3
    beq    LF1C0                 ; 2³
    jmp    LF674                 ; 3
LF170:
    cmp    #1                    ; 2
    bne    LF177                 ; 2³
    jmp    LF4DB                 ; 3
LF177:
    cmp    #3                    ; 2
    bne    LF17E                 ; 2³
    jmp    LF3A4                 ; 3
LF17E:
    bit    $C4                   ; 3
    bmi    LF1B5                 ; 2³
    lda    $F2                   ; 3
    bne    LF1B5                 ; 2³
    ldx    $DD                   ; 3
    lda    $80                   ; 3
    ldy    $8B                   ; 3
    beq    LF198                 ; 2³
    cpx    #$60                  ; 2
    bcs    LF198                 ; 2³
    and    #$03                  ; 2
    beq    LF1B5                 ; 2³
    bne    LF1A2                 ; 2³
LF198:
    lsr                          ; 2
    bcs    LF1B5                 ; 2³
    cpx    #$78                  ; 2
    bcc    LF1A2                 ; 2³
    lsr                          ; 2
    bcs    LF1B5                 ; 2³
LF1A2:
    jsr    LFE3A                 ; 6
    cpx    #$FE                  ; 2
    bne    LF1B2                 ; 2³
    lda    #$1F                  ; 2
    ldx    #$12                  ; 2
    ldy    #0                    ; 2
    sty    $F9                   ; 3
    brk                          ; 7
LF1B2:
    jsr    LFE44                 ; 6
LF1B5:
    lda    $F2                   ; 3
    bne    LF21F                 ; 2³+1
    lda    $88                   ; 3
    bpl    LF1C3                 ; 2³
    jsr    LFD9A                 ; 6
LF1C0:
    jmp    LF6F6                 ; 3
LF1C3:
    bit    $BD                   ; 3
    bpl    LF1CA                 ; 2³
    jmp    LF250                 ; 3
LF1CA:
    lda    $80                   ; 3
    and    #$01                  ; 2
    bne    LF209                 ; 2³+1
    sta    $C4                   ; 3
    lda    $B9                   ; 3
    adc    #$16                  ; 2
    sta    $B8                   ; 3
    lda    $9D                   ; 3
    ldx    $DD                   ; 3
    asl                          ; 2
    bcc    LF1FB                 ; 2³
    asl                          ; 2
    bcc    LF202                 ; 2³+1
    asl                          ; 2
    bcs    LF1F5                 ; 2³
    lda    $B9                   ; 3
    adc    #$0E                  ; 2
    sta    $B8                   ; 3
    lda    #0                    ; 2
    sta    $EA                   ; 3
    lda    #$80                  ; 2
    sta    $C4                   ; 3
    bmi    LF209                 ; 2³+1
LF1F5:
    lda    $80                   ; 3
    and    #$07                  ; 2
    bne    LF209                 ; 2³+1
LF1FB:
    inx                          ; 2
    cpx    #$98                  ; 2
    bcs    LF209                 ; 2³
    bcc    LF207                 ; 2³
LF202:
    dex                          ; 2
    cpx    #$50                  ; 2
    bcc    LF209                 ; 2³
LF207:
    stx    $DD                   ; 3
LF209:
    bit    $BD                   ; 3
    bmi    LF25C                 ; 2³
    bit    $C4                   ; 3
    bmi    LF25C                 ; 2³
    lda    $BD                   ; 3
    bit    INPT4                 ; 3
    bpl    LF21D                 ; 2³
    and    #$FD                  ; 2
    sta    $BD                   ; 3
    bpl    LF25C                 ; 2³
LF21D:
    and    #$02                  ; 2
LF21F:
    bne    LF25C                 ; 2³
    ldx    #2                    ; 2
    stx    $BD                   ; 3
    inx                          ; 2
    stx    $9E                   ; 3
    lda    $9D                   ; 3
    asl                          ; 2
    asl                          ; 2
    bcc    LF244                 ; 2³
LF22E:
    asl                          ; 2
    asl                          ; 2
    lda    $B8                   ; 3
    bcc    LF240                 ; 2³
    adc    #$0E                  ; 2
LF236:
    sta    $BC                   ; 3
    lda    $BD                   ; 3
    ora    #$C0                  ; 2
    sta    $BD                   ; 3
    bmi    LF25C                 ; 2³
LF240:
    adc    #$14                  ; 2
    bne    LF236                 ; 2³
LF244:
    ldy    #3                    ; 2
    sty    $BD                   ; 3
    bcc    LF22E                 ; 2³
LF24A:
    jsr    LFCA9                 ; 6
    jmp    LF25C                 ; 3
LF250:
    bvs    LF24A                 ; 2³
    lda    $BE                   ; 3
    clc                          ; 2
    adc    #$16                  ; 2
    sta    $BC                   ; 3
    jsr    LFC42                 ; 6
LF25C:
    lda    $8B                   ; 3
    bne    LF266                 ; 2³
    lda    $80                   ; 3
    and    #$03                  ; 2
    beq    LF2AD                 ; 2³
LF266:
    ldx    $B7                   ; 3
    lda    $DD                   ; 3
    cmp    #$60                  ; 2
    bcs    LF274                 ; 2³
    lda    $80                   ; 3
    lsr                          ; 2
    bcs    LF274                 ; 2³
    inx                          ; 2
LF274:
    inx                          ; 2
    cpx    #$A2                  ; 2
    bcc    LF2AB                 ; 2³
    lda    $F2                   ; 3
    bne    LF2AD                 ; 2³
    inc    $C6                   ; 5
    lda    $C6                   ; 3
    cmp    #$11                  ; 2
    bne    LF295                 ; 2³
    lda    #0                    ; 2
    ldx    #5                    ; 2
    jsr    LFDEA                 ; 6
    inc    $89                   ; 5
    lda    #$80                  ; 2
    sta    $8A                   ; 3
    jmp    LF365                 ; 3
LF295:
    ldx    #0                    ; 2
    stx    $C0                   ; 3
    lda    $81                   ; 3
    and    #$03                  ; 2
    bne    LF2A5                 ; 2³
    lda    $BF                   ; 3
    ora    #$40                  ; 2
    bne    LF2A9                 ; 2³
LF2A5:
    lda    $BF                   ; 3
    and    #$BF                  ; 2
LF2A9:
    sta    $BF                   ; 3
LF2AB:
    stx    $B7                   ; 3
LF2AD:
    lda    $80                   ; 3
    lsr                          ; 2
    bcs    LF2FC                 ; 2³
    lsr                          ; 2
    bcs    LF2FC                 ; 2³
    bit    $BF                   ; 3
    bpl    LF306                 ; 2³+1
    ldx    $8B                   ; 3
    beq    LF2CA                 ; 2³
    cpx    #3                    ; 2
    bcs    LF2C3                 ; 2³
    bvc    LF2CA                 ; 2³
LF2C3:
    lsr                          ; 2
    bcs    LF2CA                 ; 2³
    lda    #4                    ; 2
    bne    LF2CC                 ; 2³
LF2CA:
    lda    #2                    ; 2
LF2CC:
    jsr    LFD77                 ; 6
    lda    $BA                   ; 3
    sec                          ; 2
    bit    $BF                   ; 3
    bvc    LF2EA                 ; 2³
    sbc    $BE                   ; 3
    ldx    $8B                   ; 3
    beq    LF2E4                 ; 2³
    bit    $82                   ; 3
    bvc    LF2E4                 ; 2³
    cmp    #$1A                  ; 2
    bvs    LF2E6                 ; 2³
LF2E4:
    cmp    #$20                  ; 2
LF2E6:
    bcc    LF327                 ; 2³+1
    bcs    LF2FE                 ; 2³
LF2EA:
    sbc    $BE                   ; 3
    ldx    $8B                   ; 3
    bne    LF2F4                 ; 2³
    cmp    #$10                  ; 2
    bcs    LF2FE                 ; 2³
LF2F4:
    cmp    #$14                  ; 2
    bcs    LF2FE                 ; 2³
    lda    $81                   ; 3
    and    #$E0                  ; 2
LF2FC:
    bne    LF327                 ; 2³+1
LF2FE:
    lda    $BF                   ; 3
    and    #$7F                  ; 2
    sta    $BF                   ; 3
    bpl    LF327                 ; 2³
LF306:
    ldx    $8B                   ; 3
    beq    LF31A                 ; 2³
    cpx    #3                    ; 2
    bcs    LF310                 ; 2³
    bvc    LF31A                 ; 2³
LF310:
    lda    $80                   ; 3
    and    #$07                  ; 2
    bne    LF31A                 ; 2³
    lda    #$FC                  ; 2
    bne    LF31C                 ; 2³
LF31A:
    lda    #$FE                  ; 2
LF31C:
    jsr    LFD77                 ; 6
    lda    $BB                   ; 3
    bpl    LF327                 ; 2³
    lda    #0                    ; 2
    sta    $BB                   ; 3
LF327:
    lda    $BE                   ; 3
    cmp    $BB                   ; 3
    bcc    LF358                 ; 2³
    tax                          ; 2
    lsr                          ; 2
    bcs    LF332                 ; 2³
    inx                          ; 2
LF332:
    stx    $BB                   ; 3
    lda    $BF                   ; 3
    ora    #$80                  ; 2
    sta    $BF                   ; 3
    ldx    $C5                   ; 3
    bne    LF358                 ; 2³
    ldx    #4                    ; 2
    bit    $BF                   ; 3
    bvc    LF346                 ; 2³
    inx                          ; 2
    inx                          ; 2
LF346:
    stx    $C5                   ; 3
    ldy    $99                   ; 3
    bpl    LF358                 ; 2³
    bit    $9E                   ; 3
    bpl    LF358                 ; 2³
    ldx    #9                    ; 2
    stx    $9E                   ; 3
    lda    #$0D                  ; 2
    sta    $9C                   ; 3
LF358:
    bit    $BF                   ; 3
    lda    $BB                   ; 3
    clc                          ; 2
    bvc    LF363                 ; 2³
    adc    #$0C                  ; 2
    bne    LF365                 ; 2³
LF363:
    adc    #$0A                  ; 2
LF365:
    sta    $BA                   ; 3
    lda    $F2                   ; 3
    beq    LF37A                 ; 2³
    lda    #6                    ; 2
    sta    $EA                   ; 3
    lda    #0                    ; 2
    sta    $BD                   ; 3
    sta    $C4                   ; 3
    jsr    LFBE6                 ; 6
    bne    LF388                 ; 2³
LF37A:
    bit    $C4                   ; 3
    bmi    LF388                 ; 2³
    lda    $B9                   ; 3
    clc                          ; 2
    adc    #$16                  ; 2
    sta    $B8                   ; 3
    jsr    LFBF6                 ; 6
LF388:
    lda    $F2                   ; 3
    beq    LF38E                 ; 2³
    dec    $F2                   ; 5
LF38E:
    lda    $80                   ; 3
    lsr                          ; 2
    bcc    LF3A1                 ; 2³
    ldx    $C5                   ; 3
    beq    LF399                 ; 2³
    dec    $C5                   ; 5
LF399:
    lda    LFEC4,X               ; 4
    clc                          ; 2
    adc    $BE                   ; 3
    sta    $BE                   ; 3
LF3A1:
    jmp    LF6F6                 ; 3
LF3A4:
    lda    $CA                   ; 3
    beq    LF3B1                 ; 2³
    ldy    $99                   ; 3
    iny                          ; 2
    bne    LF3B1                 ; 2³
    ldx    #1                    ; 2
    stx    $9E                   ; 3
LF3B1:
    lda    $F2                   ; 3
    beq    LF3B8                 ; 2³
    jmp    LF43B                 ; 3
LF3B8:
    lda    $88                   ; 3
    bpl    LF3C1                 ; 2³
    jsr    LFD9A                 ; 6
    bne    LF3A1                 ; 2³
LF3C1:
    bit    $CB                   ; 3
    bpl    LF3EF                 ; 2³
    ldy    $99                   ; 3
    iny                          ; 2
    bne    LF3CE                 ; 2³
    ldx    #7                    ; 2
    stx    $9E                   ; 3
LF3CE:
    lda    $80                   ; 3
    lsr                          ; 2
    bcs    LF3EF                 ; 2³
    jsr    LFBD6                 ; 6
    lda    #$30                  ; 2
    ldx    #0                    ; 2
    jsr    LFDEA                 ; 6
    lda    $86                   ; 3
    bne    LF3EF                 ; 2³
    lda    $87                   ; 3
    bne    LF3EF                 ; 2³
    sta    $89                   ; 3
    inc    $8B                   ; 5
    lda    #$80                  ; 2
    sta    $8A                   ; 3
    bmi    LF3A1                 ; 2³
LF3EF:
    bit    $BD                   ; 3
    bpl    LF3F6                 ; 2³
    jmp    LF4CC                 ; 3
LF3F6:
    ldx    $DD                   ; 3
    lda    #0                    ; 2
    sta    $C0                   ; 3
    bit    $CB                   ; 3
    bmi    LF43B                 ; 2³
    bit    $C7                   ; 3
    bmi    LF437                 ; 2³
    lda    $80                   ; 3
    lsr                          ; 2
    bcs    LF431                 ; 2³
    lda    #0                    ; 2
    sta    $C5                   ; 3
    bit    $9D                   ; 3
    bpl    LF422                 ; 2³
    bvs    LF431                 ; 2³
    lda    #$80                  ; 2
    sta    $C5                   ; 3
    lda    #0                    ; 2
    sta    $C3                   ; 3
    dex                          ; 2
    cpx    #$20                  ; 2
    bcs    LF42F                 ; 2³
    bcc    LF431                 ; 2³
LF422:
    lda    #$80                  ; 2
    sta    $C5                   ; 3
    lda    #8                    ; 2
    sta    $C3                   ; 3
    inx                          ; 2
    cpx    #$98                  ; 2
    bcs    LF431                 ; 2³
LF42F:
    stx    $DD                   ; 3
LF431:
    lda    $BD                   ; 3
    bit    INPT4                 ; 3
    bpl    LF48F                 ; 2³
LF437:
    and    #$FD                  ; 2
    sta    $BD                   ; 3
LF43B:
    lda    $F2                   ; 3
    beq    LF44C                 ; 2³
    lda    #6                    ; 2
    sta    $EA                   ; 3
    lda    #0                    ; 2
    sta    $BD                   ; 3
    jsr    LFBE6                 ; 6
    bne    LF46D                 ; 2³
LF44C:
    lda    $EA                   ; 3
    cmp    #6                    ; 2
    bne    LF45C                 ; 2³
    lda    #$97                  ; 2
    sta    $DD                   ; 3
    lda    $B9                   ; 3
    adc    #$15                  ; 2
    sta    $B8                   ; 3
LF45C:
    bit    $BD                   ; 3
    bmi    LF46A                 ; 2³
    bit    $C5                   ; 3
    bmi    LF46A                 ; 2³
    ldx    #2                    ; 2
    stx    $EA                   ; 3
    bne    LF46D                 ; 2³
LF46A:
    jsr    LFBF6                 ; 6
LF46D:
    lda    $80                   ; 3
    ldx    $CA                   ; 3
    and    LFE56,X               ; 4
    bne    LF486                 ; 2³
    lda    $C4                   ; 3
    eor    #$08                  ; 2
    sta    $C4                   ; 3
    bit    $CB                   ; 3
    bpl    LF486                 ; 2³
    lda    $C3                   ; 3
    eor    #$08                  ; 2
    sta    $C3                   ; 3
LF486:
    lda    $F2                   ; 3
    beq    LF48C                 ; 2³
    dec    $F2                   ; 5
LF48C:
    jmp    LF6F6                 ; 3
LF48F:
    and    #$02                  ; 2
    bne    LF43B                 ; 2³
    lda    $BD                   ; 3
    ora    #$02                  ; 2
    sta    $BD                   ; 3
    ldx    #3                    ; 2
    stx    $9E                   ; 3
    lda    $9D                   ; 3
    asl                          ; 2
    bcc    LF4B8                 ; 2³
    asl                          ; 2
    bcc    LF4B3                 ; 2³
LF4A5:
    lda    $B8                   ; 3
    adc    #$20                  ; 2
    sta    $BC                   ; 3
    lda    $BD                   ; 3
    ora    #$C0                  ; 2
    sta    $BD                   ; 3
    bmi    LF43B                 ; 2³
LF4B3:
    tay                          ; 2
    lda    #$FF                  ; 2
    bmi    LF4BB                 ; 2³
LF4B8:
    tay                          ; 2
    lda    #1                    ; 2
LF4BB:
    sta    $C6                   ; 3
    lda    $BD                   ; 3
    ora    #$01                  ; 2
    sta    $BD                   ; 3
    tya                          ; 2
    bcc    LF4A5                 ; 2³
LF4C6:
    jsr    LFCA9                 ; 6
    jmp    LF43B                 ; 3
LF4CC:
    bvs    LF4C6                 ; 2³
    lda    $BE                   ; 3
    clc                          ; 2
    adc    #$16                  ; 2
    sta    $BC                   ; 3
    jsr    LFC42                 ; 6
    jmp    LF43B                 ; 3
LF4DB:
    lda    $9F                   ; 3
    cmp    #$25                  ; 2
    bne    LF4F5                 ; 2³
    lda    #8                    ; 2
    sta    $E3                   ; 3
    lda    $EA                   ; 3
    lsr                          ; 2
    bcs    LF4FE                 ; 2³
    ldy    $99                   ; 3
    iny                          ; 2
    bne    LF4FE                 ; 2³
    ldx    #5                    ; 2
    stx    $9E                   ; 3
    bpl    LF4FE                 ; 2³
LF4F5:
    ldy    $99                   ; 3
    iny                          ; 2
    bne    LF4FE                 ; 2³
    ldx    #6                    ; 2
    stx    $9E                   ; 3
LF4FE:
    lda    $E3                   ; 3
    cmp    #4                    ; 2
    bcs    LF516                 ; 2³
    ldx    $EA                   ; 3
    dex                          ; 2
    beq    LF516                 ; 2³
    ldy    $99                   ; 3
    iny                          ; 2
    bne    LF516                 ; 2³
    ldx    #8                    ; 2
    stx    $9E                   ; 3
    lda    #$10                  ; 2
    sta    $9C                   ; 3
LF516:
    lda    $80                   ; 3
    and    #$07                  ; 2
    bne    LF52E                 ; 2³
    ldy    #2                    ; 2
    lda    #$80                  ; 2
    sta    $F9                   ; 3
    lda    #$52                  ; 2
    ldx    #9                    ; 2
    brk                          ; 7
    ldy    #0                    ; 2
    lda    #$37                  ; 2
    ldx    #$18                  ; 2
    brk                          ; 7
LF52E:
    dec    $DE                   ; 5
    beq    LF534                 ; 2³
    bpl    LF539                 ; 2³
LF534:
    lda    $EA                   ; 3
    lsr                          ; 2
    bcc    LF53C                 ; 2³
LF539:
    jmp    LF5A3                 ; 3
LF53C:
    lda    #3                    ; 2
    sta    $DE                   ; 3
    bit    $9D                   ; 3
    bpl    LF54B                 ; 2³
    bvc    LF554                 ; 2³
    lda    $80                   ; 3
    lsr                          ; 2
    bcs    LF55D                 ; 2³
LF54B:
    ldx    $A3                   ; 3
    inx                          ; 2
    cpx    #$87                  ; 2
    bcs    LF55D                 ; 2³
    bcc    LF55B                 ; 2³
LF554:
    ldx    $A3                   ; 3
    dex                          ; 2
    cpx    #$53                  ; 2
    bcc    LF55D                 ; 2³
LF55B:
    stx    $A3                   ; 3
LF55D:
    lda    $9D                   ; 3
    ldx    $9F                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    bcc    LF570                 ; 2³
    asl                          ; 2
    bcs    LF577                 ; 2³
    cpx    #$25                  ; 2
    bcs    LF577                 ; 2³
    inx                          ; 2
    bcc    LF575                 ; 2³
LF570:
    cpx    #$0F                  ; 2
    bcc    LF577                 ; 2³
    dex                          ; 2
LF575:
    stx    $9F                   ; 3
LF577:
    lda    $EB                   ; 3
    bne    LF599                 ; 2³
    bit    INPT4                 ; 3
    bpl    LF587                 ; 2³
    lda    $EA                   ; 3
    and    #$BF                  ; 2
    sta    $EA                   ; 3
    bvc    LF5A3                 ; 2³
LF587:
    bit    $EA                   ; 3
    bvs    LF5A3                 ; 2³
    lda    #$0E                  ; 2
    sta    $EB                   ; 3
    lda    $EA                   ; 3
    ora    #$C0                  ; 2
    sta    $EA                   ; 3
    ldx    #4                    ; 2
    stx    $9E                   ; 3
LF599:
    dec    $EB                   ; 5
    bne    LF5A3                 ; 2³
    lda    $EA                   ; 3
    and    #$7F                  ; 2
    sta    $EA                   ; 3
LF5A3:
    lda    $E8                   ; 3
    cmp    #3                    ; 2
    bcc    LF5AC                 ; 2³
LF5A9:
    jmp    LF626                 ; 3
LF5AC:
    dec    $E4                   ; 5
    bpl    LF5A9                 ; 2³
    jsr    LFCE1                 ; 6
    lda    LF000,X               ; 4
    sta    $E4                   ; 3
    lda    $F0                   ; 3
    cmp    #$0E                  ; 2
    bcc    LF5D0                 ; 2³
    lda    $E8                   ; 3
    bne    LF5A9                 ; 2³
    ldx    #5                    ; 2
    jsr    LFDEA                 ; 6
    inc    $89                   ; 5
    lda    #$80                  ; 2
    sta    $8A                   ; 3
    jmp    LF6F6                 ; 3
LF5D0:
    lda    $EA                   ; 3
    lsr                          ; 2
    bcs    LF626                 ; 2³+1
    lda    $EC                   ; 3
    bne    LF626                 ; 2³+1
    lda    $F0                   ; 3
    and    #$07                  ; 2
    cmp    #4                    ; 2
    bne    LF5F0                 ; 2³
    lda    $E8                   ; 3
    bne    LF626                 ; 2³+1
    lda    #3                    ; 2
    sta    $90                   ; 3
    lsr                          ; 2
    sta    $EC                   ; 3
    lda    #$19                  ; 2
    bne    LF616                 ; 2³+1
LF5F0:
    lda    $81                   ; 3
    and    #$03                  ; 2
    cmp    #3                    ; 2
    bne    LF5FA                 ; 2³
LF5F8:
    lda    #0                    ; 2
LF5FA:
    tax                          ; 2
LF5FB:
    stx    $90                   ; 3
    lda    $ED,X                 ; 4
    beq    LF608                 ; 2³
    inx                          ; 2
    cpx    #3                    ; 2
    bne    LF5FB                 ; 2³+1
    beq    LF5F8                 ; 2³+1
LF608:
    lda    #1                    ; 2
    sta    $ED,X                 ; 4
    ldx    $E8                   ; 3
    lda    $90                   ; 3
    sta    $E5,X                 ; 4
    tax                          ; 2
    lda    LFEA2,X               ; 4
LF616:
    inc    $E8                   ; 5
    inc    $F0                   ; 5
    ldx    $E8                   ; 3
    sta    $9F,X                 ; 4
    lda    #0                    ; 2
    sta    $A3,X                 ; 4
    lda    $90                   ; 3
    sta    $A7,X                 ; 4
LF626:
    lda    $EA                   ; 3
    lsr                          ; 2
    bcs    LF671                 ; 2³
    lda    $E8                   ; 3
    beq    LF671                 ; 2³
    dec    $E2                   ; 5
    bpl    LF671                 ; 2³
    jsr    LFCE1                 ; 6
    lda    LFE61,X               ; 4
    sta    $E2                   ; 3
    lda    $EC                   ; 3
    beq    LF644                 ; 2³
    lda    LFE63,X               ; 4
    sta    $E2                   ; 3
LF644:
    ldx    $E8                   ; 3
LF646:
    lda    $A7,X                 ; 4
    cmp    #$0D                  ; 2
    bcs    LF66C                 ; 2³
    lda    $F1,X                 ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFE83,Y               ; 4
    adc    $9F,X                 ; 4
    ldy    $A7,X                 ; 4
    cmp    LFEA9,Y               ; 4
    bcs    LF667                 ; 2³
    cmp    LFEA5,Y               ; 4
    bcs    LF66A                 ; 2³
    lda    LFEA5,Y               ; 4
    bne    LF66A                 ; 2³
LF667:
    lda    LFEA9,Y               ; 4
LF66A:
    sta    $9F,X                 ; 4
LF66C:
    inc    $F1,X                 ; 6
    dex                          ; 2
    bne    LF646                 ; 2³
LF671:
    jmp    LF6F6                 ; 3
LF674:
    dec    $F1                   ; 5
    lda    $E9                   ; 3
    bne    LF692                 ; 2³
    lda    $F1                   ; 3
    beq    LF686                 ; 2³
    cmp    #$51                  ; 2
    bcs    LF692                 ; 2³
    bit    INPT4                 ; 3
    bmi    LF671                 ; 2³
LF686:
    inc    $89                   ; 5
    lda    #$80                  ; 2
    sta    $8A                   ; 3
    ldx    #0                    ; 2
    stx    $F0                   ; 3
    beq    LF671                 ; 2³
LF692:
    jsr    LFE44                 ; 6
    ldx    #1                    ; 2
LF697:
    lda    $E4,X                 ; 4
    cmp    #$90                  ; 2
    bne    LF6B7                 ; 2³
    lda    $81                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    LFE7B,Y               ; 4
    sta    $E0,X                 ; 4
    beq    LF6AD                 ; 2³
    bit    $82                   ; 3
    bpl    LF6B1                 ; 2³
LF6AD:
    lda    #$F0                  ; 2
    bne    LF6B3                 ; 2³
LF6B1:
    lda    #$10                  ; 2
LF6B3:
    sta    $E2,X                 ; 4
    bne    LF6BF                 ; 2³
LF6B7:
    cmp    #$9F                  ; 2
    bcc    LF6BF                 ; 2³
    sbc    #$A0                  ; 2
    sta    $E4,X                 ; 4
LF6BF:
    inc    $E4,X                 ; 6
    dex                          ; 2
    bpl    LF697                 ; 2³
    lda    $DD                   ; 3
    cmp    #$9F                  ; 2
    bcc    LF6CE                 ; 2³
    sbc    #$A0                  ; 2
    sta    $DD                   ; 3
LF6CE:
    inc    $DD                   ; 5
    jsr    LFE3A                 ; 6
    cpx    #$FE                  ; 2
    bne    LF6F6                 ; 2³
    lda    #$1F                  ; 2
    ldx    #$12                  ; 2
    ldy    #0                    ; 2
    sty    $F9                   ; 3
    brk                          ; 7
    lda    #$49                  ; 2
    ldx    #$0C                  ; 2
    ldy    #0                    ; 2
    brk                          ; 7
    lda    $F1                   ; 3
    and    #$03                  ; 2
    bne    LF6F6                 ; 2³
    lda    #$37                  ; 2
    ldx    #$0C                  ; 2
    ldy    #0                    ; 2
    sty    $F9                   ; 3
    brk                          ; 7
LF6F6:
    lda    INTIM                 ; 4
    bne    LF6F6                 ; 2³
    lda    #2                    ; 2
    sta    VSYNC                 ; 3
    sta    VBLANK                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    lda    #0                    ; 2
    sta    VSYNC                 ; 3
    lda    #$2D                  ; 2
    sta    TIM64T                ; 4
    bit    $8A                   ; 3
    bmi    LF717                 ; 2³
    jmp    LF792                 ; 3
LF717:
    lda    $89                   ; 3
    cmp    #1                    ; 2
    beq    LF740                 ; 2³
    cmp    #3                    ; 2
    beq    LF773                 ; 2³
    ldx    #$4A                  ; 2
LF723:
    lda    LFED8,X               ; 4
    sta    $9F,X                 ; 4
    dex                          ; 2
    bpl    LF723                 ; 2³
    lda    #0                    ; 2
    ldx    #$0A                  ; 2
LF72F:
    sta    $EA,X                 ; 4
    dex                          ; 2
    bpl    LF72F                 ; 2³
    lda    $89                   ; 3
    bne    LF75F                 ; 2³
    sta    $86                   ; 3
    lda    #$50                  ; 2
    sta    $87                   ; 3
    bne    LF781                 ; 2³
LF740:
    ldx    #$30                  ; 2
LF742:
    lda    LFF23,X               ; 4
    sta    $B7,X                 ; 4
    dex                          ; 2
    bpl    LF742                 ; 2³
    lda    #0                    ; 2
    ldx    #7                    ; 2
LF74E:
    sta    $E8,X                 ; 4
    dex                          ; 2
    bpl    LF74E                 ; 2³
    sta    $A7                   ; 3
    lda    #$25                  ; 2
    sta    $9F                   ; 3
    lda    #$86                  ; 2
    sta    $A3                   ; 3
    bne    LF781                 ; 2³
LF75F:
    ldx    #$0F                  ; 2
LF761:
    lda    LFF54,X               ; 4
    sta    $B7,X                 ; 4
    dex                          ; 2
    bpl    LF761                 ; 2³
    lda    #$97                  ; 2
    sta    $DD                   ; 3
    lda    #1                    ; 2
    sta    $EA                   ; 3
    bpl    LF781                 ; 2³
LF773:
    ldx    #$14                  ; 2
LF775:
    lda    LFE66,X               ; 4
    sta    $B7,X                 ; 4
    dex                          ; 2
    bpl    LF775                 ; 2³
    lda    #0                    ; 2
    sta    $F2                   ; 3
LF781:
    stx    $99                   ; 3
    inx                          ; 2
    stx    $8A                   ; 3
    lda    $89                   ; 3
    cmp    #1                    ; 2
    bne    LF790                 ; 2³
    lda    $F0                   ; 3
    bne    LF792                 ; 2³
LF790:
    stx    $9E                   ; 3
LF792:
    lda    $89                   ; 3
    beq    LF7A7                 ; 2³
    cmp    #1                    ; 2
    beq    LF7A4                 ; 2³
    cmp    #2                    ; 2
    beq    LF7A1                 ; 2³
    jmp    LF928                 ; 3
LF7A1:
    jmp    LFFF2                 ; 3
LF7A4:
    jmp    LFA0F                 ; 3
LF7A7:
    bit    $E7                   ; 3
    bmi    LF7AE                 ; 2³
    jmp    LF895                 ; 3
LF7AE:
    lda    $F2                   ; 3
    beq    LF7CC                 ; 2³
    dec    $F2                   ; 5
    bne    LF7C9                 ; 2³
    dec    $88                   ; 5
    bmi    LF80D                 ; 2³+1
    lda    #$5D                  ; 2
    sta    $E6                   ; 3
    sta    $F5                   ; 3
    lda    #0                    ; 2
    sta    $E7                   ; 3
    sta    $F3                   ; 3
    jsr    LFBC9                 ; 6
LF7C9:
    jmp    LF8E3                 ; 3
LF7CC:
    lda    $E6                   ; 3
    cmp    #$12                  ; 2
    bcs    LF7D6                 ; 2³
    lda    #$28                  ; 2
    sta    $F2                   ; 3
LF7D6:
    lda    $F3                   ; 3
    cmp    #$20                  ; 2
    bcs    LF7E6                 ; 2³
    ldx    $DD                   ; 3
    dex                          ; 2
    dex                          ; 2
    bpl    LF7E4                 ; 2³
    ldx    #0                    ; 2
LF7E4:
    stx    $DD                   ; 3
LF7E6:
    lda    $E6                   ; 3
    clc                          ; 2
    adc    $F4                   ; 3
    sta    $E6                   ; 3
    sta    $F5                   ; 3
    dec    $EF                   ; 5
    bpl    LF80D                 ; 2³+1
    ldy    #4                    ; 2
    lda    $8B                   ; 3
    cmp    #2                    ; 2
    bcc    LF7FC                 ; 2³
    iny                          ; 2
LF7FC:
    sty    $EF                   ; 3
    ldx    $F0                   ; 3
    inx                          ; 2
    cpx    #8                    ; 2
    bcc    LF806                 ; 2³
    dex                          ; 2
LF806:
    stx    $F0                   ; 3
    lda    LFECB,X               ; 4
    sta    $F4                   ; 3
LF80D:
    lda    $88                   ; 3
    bpl    LF814                 ; 2³
    jsr    LFD9A                 ; 6

LF814:
;    bit    CXM0P                 ; 3
    BIT    CXP0FB                ; 3   fix

    bvc    LF831                 ; 2³
    lda    $8A                   ; 3
    lsr                          ; 2
    bcc    LF82F                 ; 2³
    lda    $E6                   ; 3
    cmp    #$44                  ; 2
    bcc    LF82F                 ; 2³
    dec    $E9                   ; 5
    lda    $8A                   ; 3
    and    #$FE                  ; 2
    sta    $8A                   ; 3
    ldx    #1                    ; 2
    bne    LF84E                 ; 2³
LF82F:
    bcc    LF892                 ; 2³
LF831:
    bit    CXM1P                 ; 3
    bpl    LF892                 ; 2³
    lda    $8A                   ; 3
    lsr                          ; 2
    bcs    LF892                 ; 2³
    lda    $E6                   ; 3
    cmp    #$44                  ; 2
    bcc    LF892                 ; 2³
    dec    $E9                   ; 5
    lda    $8A                   ; 3
    ora    #$01                  ; 2
    sta    $8A                   ; 3
    lda    $E9                   ; 3
    beq    LF866                 ; 2³
    ldx    #0                    ; 2
LF84E:
    lda    $81                   ; 3
    and    #$07                  ; 2
    cmp    #6                    ; 2
    bcc    LF858                 ; 2³
    lda    #4                    ; 2
LF858:
    adc    #3                    ; 2
    sta    $DB,X                 ; 4
    ldy    LFF89,X               ; 4
    cmp.wy $DB,Y                 ; 4
    bne    LF866                 ; 2³
    inc    $DB,X                 ; 6
LF866:
    lda    $E9                   ; 3
    bne    LF86F                 ; 2³
    ldx    #5                    ; 2
    jsr    LFDEA                 ; 6
LF86F:
    lda    #0                    ; 2
    sta    $F4                   ; 3
    sta    $EF                   ; 3
    sta    $F3                   ; 3
    sta    $EA                   ; 3
    ldx    #1                    ; 2
    jsr    LFDEA                 ; 6
    lda    $E7                   ; 3
    and    #$7F                  ; 2
    sta    $E7                   ; 3
    jsr    LFE05                 ; 6
    lda    $F1                   ; 3
    clc                          ; 2
    adc    #$50                  ; 2
    sta    $F1                   ; 3
    ldx    #2                    ; 2
    stx    $9E                   ; 3
LF892:
    jmp    LF90B                 ; 3
LF895:
    lda    $E9                   ; 3
    beq    LF8E3                 ; 2³
    bit    $98                   ; 3
    bmi    LF8E3                 ; 2³
    bit    INPT4                 ; 3
    bpl    LF8A9                 ; 2³
    lda    $E7                   ; 3
    and    #$BF                  ; 2
    sta    $E7                   ; 3
    bpl    LF8E3                 ; 2³
LF8A9:
    bit    $E7                   ; 3
    bvs    LF8E3                 ; 2³
    lda    #$C0                  ; 2
    sta    $E7                   ; 3
    lda    #2                    ; 2
    sta    $EA                   ; 3
    ldy    #3                    ; 2
    sty    $9E                   ; 3
    lda    $F5                   ; 3
    sta    $E6                   ; 3
LF8BD:
    cmp    LFED2,Y               ; 4
    bcs    LF8C5                 ; 2³
    dey                          ; 2
    bne    LF8BD                 ; 2³
LF8C5:
    jsr    LFCE1                 ; 6
    cpx    #0                    ; 2
    beq    LF8D6                 ; 2³
LF8CC:
    iny                          ; 2
    lda    $8B                   ; 3
    cmp    #2                    ; 2
    beq    LF8D6                 ; 2³
    dex                          ; 2
    bne    LF8CC                 ; 2³
LF8D6:
    sty    $F0                   ; 3
    lda    LFECB,Y               ; 4
    sta    $F4                   ; 3
    lda    #5                    ; 2
    sta    $EF                   ; 3
    bpl    LF892                 ; 2³
LF8E3:
    jsr    LFE05                 ; 6
    lda    $88                   ; 3
    bpl    LF8ED                 ; 2³
    jsr    LFD9A                 ; 6
LF8ED:
    jsr    LFBC9                 ; 6
    lda    #$B7                  ; 2
    clc                          ; 2
    adc    $F5                   ; 3
    lsr                          ; 2
    sta    $8C                   ; 3
    ldy    $E0,X                 ; 4
    stx    $FB                   ; 3
    lda    #$3B                  ; 2
    sec                          ; 2
    sbc    LFE9B,Y               ; 4
    lsr                          ; 2
    tax                          ; 2
    lda    #$DF                  ; 2
    sta    $8F                   ; 3
    jmp    LFFEC                 ; 3
LF90B:
    sta    CXCLR                 ; 3
    lda    $DD                   ; 3
    cmp    #$A0                  ; 2
    bcc    LF917                 ; 2³
    lda    #0                    ; 2
    sta    $DD                   ; 3
LF917:
    ldx    #1                    ; 2
LF919:
    ldy    $E0,X                 ; 4
    lda    #$3B                  ; 2
    sec                          ; 2
    sbc    LFE9B,Y               ; 4
    sta    $F7,X                 ; 4
    dex                          ; 2
    bpl    LF919                 ; 2³
    bmi    LF95F                 ; 2³
LF928:
    bit    $C7                   ; 3
    bpl    LF962                 ; 2³
    lda    $80                   ; 3
    lsr                          ; 2
    bcs    LF956                 ; 2³
    lsr                          ; 2
    bcs    LF947                 ; 2³
    jsr    LFE3A                 ; 6
    cpx    #$FE                  ; 2
    bne    LF944                 ; 2³
    lda    #$1F                  ; 2
    ldx    #$12                  ; 2
    ldy    #0                    ; 2
    sty    $F9                   ; 3
    brk                          ; 7
LF944:
    jsr    LFE44                 ; 6
LF947:
    ldx    $B7                   ; 3
    cpx    #$50                  ; 2
    bne    LF953                 ; 2³
    lda    #0                    ; 2
    sta    $C7                   ; 3
    beq    LF95F                 ; 2³
LF953:
    inx                          ; 2
    stx    $B7                   ; 3
LF956:
    ldx    $DD                   ; 3
    inx                          ; 2
    cpx    #$98                  ; 2
    bcs    LF95F                 ; 2³
    stx    $DD                   ; 3
LF95F:
    jmp    LFFF2                 ; 3
LF962:
    ldx    $CA                   ; 3
    beq    LF9AA                 ; 2³
    ldx    $DD                   ; 3
    cpx    #$21                  ; 2
    bcs    LF9C4                 ; 2³
    bit    $C5                   ; 3
    bpl    LF9C4                 ; 2³
    ldx    $C8                   ; 3
    bpl    LF9C4                 ; 2³
    lda    $80                   ; 3
    lsr                          ; 2
    bcs    LF95F                 ; 2³
    lsr                          ; 2
    bcs    LF98F                 ; 2³
    jsr    LFE3A                 ; 6
    cpx    #$FE                  ; 2
    bne    LF98C                 ; 2³
    lda    #$1F                  ; 2
    ldx    #$12                  ; 2
    ldy    #0                    ; 2
    sty    $F9                   ; 3
    brk                          ; 7
LF98C:
    jsr    LFE44                 ; 6
LF98F:
    ldx    $B7                   ; 3
    cpx    #$A0                  ; 2
    beq    LF99A                 ; 2³
    inx                          ; 2
    stx    $B7                   ; 3
    bne    LF95F                 ; 2³
LF99A:
    dec    $CA                   ; 5
    lda    #$80                  ; 2
    sta    $C7                   ; 3
    lda    #2                    ; 2
    sta    $B7                   ; 3
LF9A4:
    lda    #0                    ; 2
    sta    $C5                   ; 3
    beq    LF95F                 ; 2³
LF9AA:
    bit    $CB                   ; 3
    bmi    LF95F                 ; 2³
    lda    $B7                   ; 3
    sec                          ; 2
    sbc    $DD                   ; 3
    cmp    #$F7                  ; 2
    bcc    LF95F                 ; 2³
    lda    #0                    ; 2
    ldx    #5                    ; 2
    jsr    LFDEA                 ; 6
    lda    #$80                  ; 2
    sta    $CB                   ; 3
    bmi    LF9A4                 ; 2³
LF9C4:
    ldx    $C8                   ; 3
    bmi    LF9F1                 ; 2³
    lda    $80                   ; 3
    lsr                          ; 2
    bcc    LF95F                 ; 2³
    bit    $C9                   ; 3
    bpl    LF9DB                 ; 2³
    lda    #$FE                  ; 2
    adc    $B7                   ; 3
    cmp    #$30                  ; 2
    bcc    LF9E5                 ; 2³
    bcs    LF9E3                 ; 2³
LF9DB:
    lda    #0                    ; 2
    adc    $B7                   ; 3
    cmp    #$70                  ; 2
    bcs    LF9E5                 ; 2³
LF9E3:
    sta    $B7                   ; 3
LF9E5:
    lda    LFEAD,X               ; 4
    jsr    LFD77                 ; 6
    dex                          ; 2
    stx    $C8                   ; 3
LF9EE:
    jmp    LFFF2                 ; 3
LF9F1:
    lda    $81                   ; 3
    and    #$26                  ; 2
    bne    LF9EE                 ; 2³
    lda    $B7                   ; 3
    cmp    #$68                  ; 2
    bcs    LFA01                 ; 2³+1
    cmp    $DD                   ; 3
    bcc    LFA05                 ; 2³
LFA01:
    lda    #$80                  ; 2
    bne    LFA07                 ; 2³
LFA05:
    lda    #0                    ; 2
LFA07:
    sta    $C9                   ; 3
    lda    #$17                  ; 2
    sta    $C8                   ; 3
    bne    LF9EE                 ; 2³+1
LFA0F:
    dec    $F6                   ; 5
    bpl    LFA28                 ; 2³
    jsr    LFCE1                 ; 6
    lda    LFE79,X               ; 4
    sta    $F6                   ; 3
    ldx    #3                    ; 2
LFA1D:
    lda    $A7,X                 ; 4
    cmp    #$0D                  ; 2
    bcs    LFA25                 ; 2³
    inc    $A3,X                 ; 6
LFA25:
    dex                          ; 2
    bne    LFA1D                 ; 2³
LFA28:
    ldx    $E8                   ; 3
    beq    LFA49                 ; 2³
LFA2C:
    lda    $A3,X                 ; 4
    cmp    #$87                  ; 2
    bcs    LFA37                 ; 2³
    dex                          ; 2
    bpl    LFA2C                 ; 2³
    bmi    LFA49                 ; 2³
LFA37:
    lda    $EC                   ; 3
    beq    LFA43                 ; 2³
    lda    #0                    ; 2
    sta    $EC                   ; 3
    lda    #5                    ; 2
    sta    $E4                   ; 3
LFA43:
    txa                          ; 2
    tay                          ; 2
    dex                          ; 2
    jsr    LFCEA                 ; 6
LFA49:
    lda    $EA                   ; 3
    lsr                          ; 2
    bcc    LFA51                 ; 2³
    jmp    LFACC                 ; 3
LFA51:
    ldx    $E8                   ; 3
    beq    LFA67                 ; 2³
LFA55:
    lda    $9F,X                 ; 4
    sec                          ; 2
    sbc    $9F                   ; 3
    sta    $FA                   ; 3
    cmp    #$FE                  ; 2
    bcs    LFA69                 ; 2³
    cmp    #2                    ; 2
    bcc    LFA69                 ; 2³
LFA64:
    dex                          ; 2
    bne    LFA55                 ; 2³
LFA67:
    beq    LFACA                 ; 2³
LFA69:
    lda    $A3,X                 ; 4
    sec                          ; 2
    sbc    $A3                   ; 3
    sta    $93                   ; 3
    cmp    #$F3                  ; 2
    bcs    LFA78                 ; 2³
    cmp    #8                    ; 2
    bcs    LFA64                 ; 2³
LFA78:
    lda    $DE,X                 ; 4
    bpl    LFA64                 ; 2³
    lda    $F1                   ; 3
    cmp    #$0C                  ; 2
    beq    LFA94                 ; 2³
    bit    $EA                   ; 3
    bpl    LFA94                 ; 2³
    lda    $93                   ; 3
    bpl    LFA94                 ; 2³
    lda    $FA                   ; 3
    cmp    #$FF                  ; 2
    bcs    LFAA7                 ; 2³
    cmp    #4                    ; 2
    bcc    LFAA7                 ; 2³
LFA94:
    dec    $88                   ; 5
    lda    #1                    ; 2
    sta    $EA                   ; 3
    lda    $F0                   ; 3
    sec                          ; 2
    sbc    $E8                   ; 3
    sta    $F0                   ; 3
    lda    #6                    ; 2
    sta    $EB                   ; 3
    bne    LFACA                 ; 2³
LFAA7:
    lda    #$19                  ; 2
    sta    $DE,X                 ; 4
    lda    $EC                   ; 3
    beq    LFAB3                 ; 2³
    lda    #$0F                  ; 2
    bpl    LFABF                 ; 2³
LFAB3:
    lda    $F1                   ; 3
    cmp    #$0A                  ; 2
    beq    LFABD                 ; 2³
    lda    #$0D                  ; 2
    bpl    LFABF                 ; 2³
LFABD:
    lda    #$0E                  ; 2
LFABF:
    sta    $A7,X                 ; 4
    sec                          ; 2
    sbc    #$0C                  ; 2
    tax                          ; 2
    lda    #0                    ; 2
    jsr    LFDEA                 ; 6
LFACA:
    bpl    LFAFD                 ; 2³
LFACC:
    lda    $EA                   ; 3
    and    #$02                  ; 2
    bne    LFAEE                 ; 2³
    dec    $EB                   ; 5
    bne    LFAFD                 ; 2³
    lda    #6                    ; 2
    sta    $EB                   ; 3
    ldx    $9F                   ; 3
    cpx    #$25                  ; 2
    bne    LFAE9                 ; 2³
    lda    #3                    ; 2
    sta    $EA                   ; 3
    lda    #$50                  ; 2
    sta    $EB                   ; 3
    dex                          ; 2
LFAE9:
    inx                          ; 2
    stx    $9F                   ; 3
    bne    LFAFD                 ; 2³
LFAEE:
    dec    $EB                   ; 5
    bne    LFAFD                 ; 2³
    lda    $88                   ; 3
    bpl    LFAF9                 ; 2³
    jsr    LFD9A                 ; 6
LFAF9:
    lda    #$80                  ; 2
    sta    $8A                   ; 3
LFAFD:
    ldx    #2                    ; 2
LFAFF:
    ldy    $DF,X                 ; 4
    bmi    LFB07                 ; 2³
    dec    $DF,X                 ; 6
    bmi    LFB0C                 ; 2³
LFB07:
    dex                          ; 2
    bpl    LFAFF                 ; 2³+1
    bmi    LFB20                 ; 2³
LFB0C:
    stx    $FA                   ; 3
    txa                          ; 2
    tay                          ; 2
    iny                          ; 2
    jsr    LFCEA                 ; 6
    lda    $EC                   ; 3
    beq    LFB20                 ; 2³
    lda    #5                    ; 2
    sta    $E4                   ; 3
    lda    #0                    ; 2
    sta    $EC                   ; 3
LFB20:
    ldy    #0                    ; 2
LFB22:
    lda    #$30                  ; 2
    sta    $95                   ; 3
    ldx    $E8                   ; 3
LFB28:
    lda    $9F,X                 ; 4
    bmi    LFB34                 ; 2³
    cmp    $95                   ; 3
    bcs    LFB34                 ; 2³
    sta    $95                   ; 3
    stx    $FA                   ; 3
LFB34:
    dex                          ; 2
    bpl    LFB28                 ; 2³
    ldx    $FA                   ; 3
    lda    $95                   ; 3
    sta.wy $AB,Y                 ; 5
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #1                    ; 2
    sta    $9F,X                 ; 4
    lda    $A3,X                 ; 4
    sta.wy $AF,Y                 ; 5
    stx    $B3,Y                 ; 4
    iny                          ; 2
    cpy    $E8                   ; 3
    beq    LFB22                 ; 2³
    bcc    LFB22                 ; 2³
    ldx    $E8                   ; 3
LFB55:
    lda    #0                    ; 2
    sec                          ; 2
    sbc    $9F,X                 ; 4
    sta    $9F,X                 ; 4
    dex                          ; 2
    bpl    LFB55                 ; 2³
    lda    $80                   ; 3
    and    #$1F                  ; 2
    bne    LFB7C                 ; 2³
    inc    $F5                   ; 5
    lda    $F5                   ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    $81                   ; 3
    and    #$03                  ; 2
    tay                          ; 2
    lda    LFE59,X               ; 4
    cpy    #0                    ; 2
    bne    LFB7A                 ; 2³
    adc    #2                    ; 2
LFB7A:
    sta    $F1                   ; 3
LFB7C:
    ldx    $E8                   ; 3
LFB7E:
    ldy    $B3,X                 ; 4
    beq    LFB91                 ; 2³
    lda.wy $A7,Y                 ; 4
    cmp    #$0D                  ; 2
    bcs    LFB8B                 ; 2³
    lda    $F1                   ; 3
LFB8B:
    sta    $B3,X                 ; 4
    cmp    #0                    ; 2
    bne    LFBAD                 ; 2³
LFB91:
    lda    $EA                   ; 3
    bpl    LFB99                 ; 2³
    lda    #4                    ; 2
    bne    LFBAB                 ; 2³
LFB99:
    lda    $80                   ; 3
    and    #$18                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    $EA                   ; 3
    lsr                          ; 2
    tya                          ; 2
    bcc    LFBAB                 ; 2³
    lsr                          ; 2
    clc                          ; 2
    adc    #5                    ; 2
LFBAB:
    sta    $B3,X                 ; 4
LFBAD:
    dex                          ; 2
    bpl    LFB7E                 ; 2³
    inx                          ; 2
    stx    $F9                   ; 3
    ldx    $E8                   ; 3
    stx    $E9                   ; 3
    beq    LFBC6                 ; 2³
LFBB9:
    lda    $B3,X                 ; 4
    cmp    #7                    ; 2
    bcc    LFBC2                 ; 2³
    dex                          ; 2
    bpl    LFBB9                 ; 2³
LFBC2:
    stx    $94                   ; 3
    ldy    $94                   ; 3
LFBC6:
    jmp    LFFF2                 ; 3
LFBC9:
    lda    $8A                   ; 3
    and    #$01                  ; 2
    tax                          ; 2
    lda    $E4,X                 ; 4
    clc                          ; 2
    adc    #$F4                  ; 2
    sta    $DD                   ; 3
    rts                          ; 6

LFBD6:
    sed                          ; 2
    sec                          ; 2
    lda    $86                   ; 3
    sbc    #$10                  ; 2
    sta    $86                   ; 3
    lda    $87                   ; 3
    sbc    #0                    ; 2
    sta    $87                   ; 3
    cld                          ; 2
    rts                          ; 6

LFBE6:
    lda    $BE                   ; 3
    tax                          ; 2
    lsr                          ; 2
    bcc    LFBED                 ; 2³
    inx                          ; 2
LFBED:
    stx    $B9                   ; 3
    txa                          ; 2
    clc                          ; 2
    adc    #$0C                  ; 2
    sta    $B8                   ; 3
    rts                          ; 6

LFBF6:
    bit    $BD                   ; 3
    bmi    LFC3A                 ; 2³+1
    ldx    $EA                   ; 3
    cpx    #6                    ; 2
    bne    LFC0E                 ; 2³
    lda    #1                    ; 2
    sta    $EA                   ; 3
    lda    #$98                  ; 2
    sta    $DD                   ; 3
    lda    #0                    ; 2
    sta    $C1                   ; 3
    sta    $C3                   ; 3
LFC0E:
    cpx    #0                    ; 2
    bne    LFC14                 ; 2³
    inc    $EA                   ; 5
LFC14:
    lda    $80                   ; 3
    and    #$03                  ; 2
    bne    LFC41                 ; 2³
    ldx    $EA                   ; 3
    bit    $C1                   ; 3
    bpl    LFC29                 ; 2³
    inx                          ; 2
    cpx    #4                    ; 2
    bcc    LFC3F                 ; 2³
    lda    #0                    ; 2
    beq    LFC34                 ; 2³
LFC29:
    dex                          ; 2
    bmi    LFC32                 ; 2³
    beq    LFC32                 ; 2³
    cpx    #4                    ; 2
    bcc    LFC3F                 ; 2³
LFC32:
    lda    #$80                  ; 2
LFC34:
    sta    $C1                   ; 3
    ldx    #2                    ; 2
    bne    LFC3F                 ; 2³
LFC3A:
    ldx    #4                    ; 2
    bvs    LFC3F                 ; 2³
    inx                          ; 2
LFC3F:
    stx    $EA                   ; 3
LFC41:
    rts                          ; 6

LFC42:
    lda    $B8                   ; 3
    sec                          ; 2
    sbc    $BC                   ; 3
    bpl    LFC4B                 ; 2³
    lda    #0                    ; 2
LFC4B:
    tax                          ; 2
    lda    $80                   ; 3
    ldy    $89                   ; 3
    cpy    #3                    ; 2
    beq    LFC5E                 ; 2³
    lsr                          ; 2
    bcs    LFC7F                 ; 2³
    cpx    #8                    ; 2
    bcc    LFC65                 ; 2³
    lsr                          ; 2
    bcs    LFC7F                 ; 2³
LFC5E:
    cpx    #$12                  ; 2
    bcc    LFC65                 ; 2³
    lsr                          ; 2
    bcs    LFC7F                 ; 2³
LFC65:
    dec    $B8                   ; 5
    dec    $B8                   ; 5
    dec    $B9                   ; 5
    dec    $B9                   ; 5
    lda    $B8                   ; 3
    cmp    $BC                   ; 3
    beq    LFC75                 ; 2³
    bcs    LFC7F                 ; 2³
LFC75:
    lda    $BD                   ; 3
    and    #$3F                  ; 2
    sta    $BD                   ; 3
    lda    #2                    ; 2
    sta    $EA                   ; 3
LFC7F:
    lda    $BD                   ; 3
    lsr                          ; 2
    bcc    LFCA8                 ; 2³
    lda    $89                   ; 3
    cmp    #2                    ; 2
    beq    LFC9A                 ; 2³
    lda    $C6                   ; 3
    clc                          ; 2
    adc    $DD                   ; 3
    cmp    #$1E                  ; 2
    bcc    LFCA8                 ; 2³
    cmp    #$98                  ; 2
    bcs    LFCA8                 ; 2³
    sta    $DD                   ; 3
    rts                          ; 6

LFC9A:
    lda    $80                   ; 3
    lsr                          ; 2
    bcs    LFCA8                 ; 2³
    ldx    $DD                   ; 3
    dex                          ; 2
    cpx    #$4E                  ; 2
    beq    LFCA8                 ; 2³
    stx    $DD                   ; 3
LFCA8:
    rts                          ; 6

LFCA9:
    lda    $BC                   ; 3
    sec                          ; 2
    sbc    $B8                   ; 3
    bpl    LFCB2                 ; 2³
    lda    #0                    ; 2
LFCB2:
    tax                          ; 2
    lda    $80                   ; 3
    ldy    $89                   ; 3
    cpy    #3                    ; 2
    beq    LFCBE                 ; 2³
    lsr                          ; 2
    bcs    LFC7F                 ; 2³
LFCBE:
    cpx    #$0B                  ; 2
    bcs    LFCCC                 ; 2³
    lsr                          ; 2
    bcs    LFC7F                 ; 2³
    cpx    #3                    ; 2
    bcs    LFCCC                 ; 2³
    lsr                          ; 2
    bcs    LFC7F                 ; 2³
LFCCC:
    inc    $B8                   ; 5
    inc    $B8                   ; 5
    inc    $B9                   ; 5
    inc    $B9                   ; 5
    lda    $B8                   ; 3
    cmp    $BC                   ; 3
    bcc    LFC7F                 ; 2³
    lda    $BD                   ; 3
    and    #$BF                  ; 2
    sta    $BD                   ; 3
    rts                          ; 6

LFCE1:
    ldx    $8B                   ; 3
    cpx    #3                    ; 2
    bcc    LFCE9                 ; 2³
    ldx    #2                    ; 2
LFCE9:
    rts                          ; 6

LFCEA:
    stx    $FA                   ; 3
    sty    $FB                   ; 3
    lda    $EC                   ; 3
    bne    LFD17                 ; 2³+1
    lda    $E5,X                 ; 4
    tax                          ; 2
    lda    #0                    ; 2
    sta    $ED,X                 ; 4
    ldx    $FA                   ; 3
LFCFB:
    cpy    #3                    ; 2
    bcs    LFD0D                 ; 2³+1
    lda.wy $DF,Y                 ; 4
    sta    $DF,X                 ; 4
    lda.wy $E5,Y                 ; 4
    sta    $E5,X                 ; 4
    inx                          ; 2
    iny                          ; 2
    bpl    LFCFB                 ; 2³+1
LFD0D:
    lda    #$FF                  ; 2
    sta    $E1                   ; 3
    sta    $E7                   ; 3
    ldx    $FA                   ; 3
    ldy    $FB                   ; 3
LFD17:
    inx                          ; 2
    iny                          ; 2
    cpx    $E8                   ; 3
    bcs    LFD2E                 ; 2³
    lda.wy $9F,Y                 ; 4
    sta    $9F,X                 ; 4
    lda.wy $A3,Y                 ; 4
    sta    $A3,X                 ; 4
    lda.wy $A7,Y                 ; 4
    sta    $A7,X                 ; 4
    bpl    LFD17                 ; 2³
LFD2E:
    dec    $E8                   ; 5
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   BRK SUBROUTINE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD31:
    sta    $FB                   ; 3
    txa                          ; 2
    clc                          ; 2
    adc    $FB                   ; 3
    sta    $FA                   ; 3
LFD39:
    ldx    $FA                   ; 3
LFD3B:
    asl    $80,X                 ; 6
    ror    $81,X                 ; 6
    rol    $82,X                 ; 6
    bit    $F9                   ; 3
    bpl    LFD5A                 ; 2³
    bcc    LFD4D                 ; 2³
    lda    $80,X                 ; 4
    ora    #$10                  ; 2
    sta    $80,X                 ; 4
LFD4D:
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
LFD50:
    cpx    $FB                   ; 3
    bcs    LFD3B                 ; 2³
    dey                          ; 2
    bpl    LFD39                 ; 2³
    dec    $FE                   ; 5   fix address on stack,
    rti                          ; 6   and return from BRK

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD5A:
    bcc    LFD62                 ; 2³
    lda    $83,X                 ; 4
    ora    #$08                  ; 2
    sta    $83,X                 ; 4
LFD62:
    asl    $83,X                 ; 6
    ror    $84,X                 ; 6
    rol    $85,X                 ; 6
    bcc    LFD70                 ; 2³
    lda    $80,X                 ; 4
    ora    #$10                  ; 2
    sta    $80,X                 ; 4
LFD70:
    txa                          ; 2
    sec                          ; 2
    sbc    #6                    ; 2
    tax                          ; 2
    bne    LFD50                 ; 2³
LFD77:
    sta    $FA                   ; 3
    clc                          ; 2
    adc    $BA                   ; 3
    sta    $BA                   ; 3
    lda    $BB                   ; 3
    clc                          ; 2
    adc    $FA                   ; 3
    sta    $BB                   ; 3
    rts                          ; 6

LFD86:
    lda    #4                    ; 2
    sta    $88                   ; 3
    lda    $98                   ; 3
    and    #$3F                  ; 2
    sta    $98                   ; 3
    ldx    #0                    ; 2
    stx    $83                   ; 3
    stx    $84                   ; 3
    stx    $85                   ; 3
    beq    LFDA6                 ; 2³
LFD9A:
    lda    $98                   ; 3
    ora    #$80                  ; 2
    sta    $98                   ; 3
    and    #$01                  ; 2
    tax                          ; 2
    inx                          ; 2
    stx    $88                   ; 3
LFDA6:
    lda    $98                   ; 3
    and    #$01                  ; 2
    tax                          ; 2
    stx    $8B                   ; 3
    lda    #$80                  ; 2
    sta    $8A                   ; 3
    lda    #0                    ; 2
    sta    $89                   ; 3
    sta    AUDV0                 ; 3
    lda    #$0A                  ; 2
    sta    $E9                   ; 3
    rts                          ; 6

LFDBC:
    beq    LFDD7                 ; 2³
    cpx    #$10                  ; 2
    bne    LFDCB                 ; 2³
    iny                          ; 2
    cpy    #7                    ; 2
    bmi    LFDCA                 ; 2³
    dey                          ; 2
    lda    #0                    ; 2
LFDCA:
    rts                          ; 6

LFDCB:
    dey                          ; 2
    bpl    LFDD2                 ; 2³
    ldy    #1                    ; 2
    bne    LFDD4                 ; 2³
LFDD2:
    bne    LFDD6                 ; 2³
LFDD4:
    ldx    #$10                  ; 2
LFDD6:
    rts                          ; 6

LFDD7:
    cpx    #$10                  ; 2
    bne    LFDE1                 ; 2³
    dey                          ; 2
    bne    LFDE0                 ; 2³
    ldx    #$F0                  ; 2
LFDE0:
    rts                          ; 6

LFDE1:
    iny                          ; 2
    cpy    #7                    ; 2
    bmi    LFDE9                 ; 2³
    dey                          ; 2
    lda    #$80                  ; 2
LFDE9:
    rts                          ; 6

LFDEA:
    sed                          ; 2
    clc                          ; 2
    adc    $83                   ; 3
    sta    $83                   ; 3
    txa                          ; 2
    adc    $84                   ; 3
    sta    $84                   ; 3
    bcc    LFDFD                 ; 2³
    lda    $85                   ; 3
    bne    LFDFD                 ; 2³
    inc    $88                   ; 5
LFDFD:
    lda    #0                    ; 2
    adc    $85                   ; 3
    sta    $85                   ; 3
    cld                          ; 2
    rts                          ; 6

LFE05:
    lda    $8A                   ; 3
    lsr                          ; 2
    ldx    #0                    ; 2
    bit    $EE                   ; 3
    bcc    LFE13                 ; 2³
    inx                          ; 2
    bvc    LFE2C                 ; 2³
    bvs    LFE15                 ; 2³
LFE13:
    bpl    LFE2C                 ; 2³
LFE15:
    lda    $E2,X                 ; 4
    bpl    LFE27                 ; 2³
    lda    $E0,X                 ; 4
    cmp    #4                    ; 2
    bcs    LFE36                 ; 2³
    cmp    #2                    ; 2
    bcc    LFE27                 ; 2³
LFE23:
    lda    #1                    ; 2
    bne    LFE29                 ; 2³
LFE27:
    lda    #0                    ; 2
LFE29:
    sta    $EA                   ; 3
    rts                          ; 6

LFE2C:
    lda    $E2,X                 ; 4
    bmi    LFE36                 ; 2³
    lda    $E0,X                 ; 4
    cmp    #5                    ; 2
    bcs    LFE23                 ; 2³
LFE36:
    lda    #2                    ; 2
    bne    LFE29                 ; 2³
LFE3A:
    ldx    $EB                   ; 3
    inx                          ; 2
    bmi    LFE41                 ; 2³
    dex                          ; 2
    dex                          ; 2
LFE41:
    stx    $EB                   ; 3
    rts                          ; 6

LFE44:
    ldx    #1                    ; 2
LFE46:
    lda    $DE,X                 ; 4
    cmp    #$9F                  ; 2
    bcc    LFE50                 ; 2³
    sbc    #$A0                  ; 2
    sta    $DE,X                 ; 4
LFE50:
    inc    $DE,X                 ; 6
    dex                          ; 2
    bpl    LFE46                 ; 2³
    rts                          ; 6

LFE56:
    .byte $3F ; |  XXXXXX| $FE56
    .byte $1F ; |   XXXXX| $FE57
    .byte $1F ; |   XXXXX| $FE58
LFE59:
    .byte $07 ; |     XXX| $FE59
    .byte $08 ; |    X   | $FE5A
    .byte $09 ; |    X  X| $FE5B
    .byte $08 ; |    X   | $FE5C
    .byte $20 ; |  X     | $FE5D
    .byte $10 ; |   X    | $FE5E
    .byte $08 ; |    X   | $FE5F
    .byte $04 ; |     X  | $FE60
LFE61:
    .byte $0E ; |    XXX | $FE61
    .byte $09 ; |    X  X| $FE62
LFE63:
    .byte $06 ; |     XX | $FE63
    .byte $04 ; |     X  | $FE64
    .byte $03 ; |      XX| $FE65
LFE66:
    .byte $02 ; |      X | $FE66
    .byte $4E ; | X  XXX | $FE67
    .byte $38 ; |  XXX   | $FE68
    .byte $4F ; | X  XXXX| $FE69
    .byte $39 ; |  XXX  X| $FE6A
    .byte $00 ; |        | $FE6B
    .byte $00 ; |        | $FE6C
    .byte $38 ; |  XXX   | $FE6D
    .byte $00 ; |        | $FE6E
    .byte $00 ; |        | $FE6F
    .byte $00 ; |        | $FE70
    .byte $80 ; |X       | $FE71
    .byte $00 ; |        | $FE72
    .byte $00 ; |        | $FE73
    .byte $00 ; |        | $FE74
    .byte $00 ; |        | $FE75
    .byte $80 ; |X       | $FE76
    .byte $FF ; |XXXXXXXX| $FE77
    .byte $00 ; |        | $FE78
LFE79:
    .byte $02 ; |      X | $FE79
    .byte $01 ; |       X| $FE7A
LFE7B:
    .byte $00 ; |        | $FE7B
    .byte $02 ; |      X | $FE7C
    .byte $03 ; |      XX| $FE7D
    .byte $01 ; |       X| $FE7E
    .byte $03 ; |      XX| $FE7F
    .byte $02 ; |      X | $FE80
    .byte $00 ; |        | $FE81
    .byte $01 ; |       X| $FE82
LFE83:
    .byte $02 ; |      X | $FE83
    .byte $02 ; |      X | $FE84
    .byte $02 ; |      X | $FE85
    .byte $02 ; |      X | $FE86
    .byte $02 ; |      X | $FE87
    .byte $FE ; |XXXXXXX | $FE88
    .byte $FE ; |XXXXXXX | $FE89
    .byte $FE ; |XXXXXXX | $FE8A
    .byte $FE ; |XXXXXXX | $FE8B
    .byte $FE ; |XXXXXXX | $FE8C
    .byte $FF ; |XXXXXXXX| $FE8D
    .byte $FF ; |XXXXXXXX| $FE8E
    .byte $02 ; |      X | $FE8F
    .byte $FE ; |XXXXXXX | $FE90
    .byte $FF ; |XXXXXXXX| $FE91
    .byte $03 ; |      XX| $FE92
    .byte $20 ; |  X     | $FE93
    .byte $1A ; |   XX X | $FE94
    .byte $25 ; |  X  X X| $FE95
    .byte $20 ; |  X     | $FE96
    .byte $1A ; |   XX X | $FE97
    .byte $25 ; |  X  X X| $FE98
    .byte $20 ; |  X     | $FE99
    .byte $1A ; |   XX X | $FE9A
LFE9B:
    .byte $39 ; |  XXX  X| $FE9B
    .byte $39 ; |  XXX  X| $FE9C
    .byte $39 ; |  XXX  X| $FE9D
    .byte $37 ; |  XX XXX| $FE9E
    .byte $35 ; |  XX X X| $FE9F
    .byte $31 ; |  XX   X| $FEA0
    .byte $2F ; |  X XXXX| $FEA1
LFEA2:
    .byte $23 ; |  X   XX| $FEA2
    .byte $1A ; |   XX X | $FEA3
    .byte $13 ; |   X  XX| $FEA4
LFEA5:
    .byte $21 ; |  X    X| $FEA5
    .byte $19 ; |   XX  X| $FEA6
    .byte $0E ; |    XXX | $FEA7
    .byte $0E ; |    XXX | $FEA8
LFEA9:
    .byte $25 ; |  X  X X| $FEA9
    .byte $1D ; |   XXX X| $FEAA
    .byte $15 ; |   X X X| $FEAB
    .byte $25 ; |  X  X X| $FEAC
LFEAD:
    .byte $00 ; |        | $FEAD
    .byte $FE ; |XXXXXXX | $FEAE
    .byte $00 ; |        | $FEAF
    .byte $FE ; |XXXXXXX | $FEB0
    .byte $00 ; |        | $FEB1
    .byte $FE ; |XXXXXXX | $FEB2
    .byte $00 ; |        | $FEB3
    .byte $FE ; |XXXXXXX | $FEB4
    .byte $00 ; |        | $FEB5
    .byte $00 ; |        | $FEB6
    .byte $00 ; |        | $FEB7
    .byte $00 ; |        | $FEB8
    .byte $00 ; |        | $FEB9
    .byte $00 ; |        | $FEBA
    .byte $00 ; |        | $FEBB
    .byte $00 ; |        | $FEBC
    .byte $02 ; |      X | $FEBD
    .byte $00 ; |        | $FEBE
    .byte $02 ; |      X | $FEBF
    .byte $00 ; |        | $FEC0
    .byte $02 ; |      X | $FEC1
    .byte $00 ; |        | $FEC2
    .byte $02 ; |      X | $FEC3
LFEC4:
    .byte $00 ; |        | $FEC4
    .byte $FF ; |XXXXXXXX| $FEC5
    .byte $01 ; |       X| $FEC6
    .byte $FF ; |XXXXXXXX| $FEC7
    .byte $01 ; |       X| $FEC8
    .byte $FF ; |XXXXXXXX| $FEC9
    .byte $01 ; |       X| $FECA
LFECB:
    .byte $01 ; |       X| $FECB
    .byte $01 ; |       X| $FECC
    .byte $01 ; |       X| $FECD
    .byte $00 ; |        | $FECE
    .byte $FF ; |XXXXXXXX| $FECF
    .byte $FF ; |XXXXXXXX| $FED0
    .byte $FF ; |XXXXXXXX| $FED1
LFED2:
    .byte $FF ; |XXXXXXXX| $FED2
    .byte $63 ; | XX   XX| $FED3
    .byte $6D ; | XX XX X| $FED4
    .byte $72 ; | XXX  X | $FED5
LFED6:
    .byte $7F ; | XXXXXXX| $FED6
    .byte $BF ; |X XXXXXX| $FED7
LFED8:
    .byte $60 ; | XX     | $FED8
    .byte $1E ; |   XXXX | $FED9
    .byte $F3 ; |XXXX  XX| $FEDA
    .byte $A0 ; |X X     | $FEDB
    .byte $FB ; |XXXXX XX| $FEDC
    .byte $79 ; | XXXX  X| $FEDD
    .byte $C0 ; |XX      | $FEDE
    .byte $7B ; | XXXX XX| $FEDF
    .byte $C1 ; |XX     X| $FEE0
    .byte $F0 ; |XXXX    | $FEE1
    .byte $6E ; | XX XXX | $FEE2
    .byte $1B ; |   XX XX| $FEE3
    .byte $80 ; |X       | $FEE4
    .byte $D1 ; |XX X   X| $FEE5
    .byte $80 ; |X       | $FEE6
    .byte $E0 ; |XXX     | $FEE7
    .byte $C4 ; |XX   X  | $FEE8
    .byte $0E ; |    XXX | $FEE9
    .byte $00 ; |        | $FEEA
    .byte $80 ; |X       | $FEEB
    .byte $00 ; |        | $FEEC
    .byte $40 ; | X      | $FEED
    .byte $80 ; |X       | $FEEE
    .byte $04 ; |     X  | $FEEF
    .byte $20 ; |  X     | $FEF0
    .byte $2C ; |  X XX  | $FEF1
    .byte $01 ; |       X| $FEF2
    .byte $50 ; | X X    | $FEF3
    .byte $40 ; | X      | $FEF4
    .byte $03 ; |      XX| $FEF5
    .byte $B0 ; |X XX    | $FEF6
    .byte $6A ; | XX X X | $FEF7
    .byte $4B ; | X  X XX| $FEF8
    .byte $70 ; | XXX    | $FEF9
    .byte $A1 ; |X X    X| $FEFA
    .byte $39 ; |  XXX  X| $FEFB
    .byte $E0 ; |XXX     | $FEFC
    .byte $7F ; | XXXXXXX| $FEFD
    .byte $DF ; |XX XXXXX| $FEFE
    .byte $D0 ; |XX X    | $FEFF
    .byte $F5 ; |XXXX X X| $FF00
    .byte $FE ; |XXXXXXX | $FF01
    .byte $80 ; |X       | $FF02
    .byte $08 ; |    X   | $FF03
    .byte $CC ; |XX  XX  | $FF04
    .byte $40 ; | X      | $FF05
    .byte $93 ; |X  X  XX| $FF06
    .byte $9C ; |X  XXX  | $FF07
    .byte $70 ; | XXX    | $FF08
    .byte $AC ; |X X XX  | $FF09
    .byte $7B ; | XXXX XX| $FF0A
    .byte $70 ; | XXX    | $FF0B
    .byte $D9 ; |XX XX  X| $FF0C
    .byte $45 ; | X   X X| $FF0D
    .byte $D0 ; |XX X    | $FF0E
    .byte $F5 ; |XXXX X X| $FF0F
    .byte $D1 ; |XX X   X| $FF10
    .byte $A0 ; |X X     | $FF11
    .byte $AA ; |X X X X | $FF12
    .byte $32 ; |  XX  X | $FF13
    .byte $06 ; |     XX | $FF14
    .byte $08 ; |    X   | $FF15
    .byte $79 ; | XXXX  X| $FF16
    .byte $27 ; |  X  XXX| $FF17
    .byte $57 ; | X X XXX| $FF18
    .byte $06 ; |     XX | $FF19
    .byte $06 ; |     XX | $FF1A
    .byte $10 ; |   X    | $FF1B
    .byte $10 ; |   X    | $FF1C
    .byte $7C ; | XXXXX  | $FF1D
    .byte $2D ; |  X XX X| $FF1E
    .byte $6A ; | XX X X | $FF1F
    .byte $40 ; | X      | $FF20
    .byte $09 ; |    X  X| $FF21
    .byte $0A ; |    X X | $FF22
LFF23:
    .byte $00 ; |        | $FF23
    .byte $04 ; |     X  | $FF24
    .byte $00 ; |        | $FF25
    .byte $00 ; |        | $FF26
    .byte $14 ; |   X X  | $FF27
    .byte $00 ; |        | $FF28
    .byte $40 ; | X      | $FF29
    .byte $3E ; |  XXXXX | $FF2A
    .byte $80 ; |X       | $FF2B
    .byte $60 ; | XX     | $FF2C
    .byte $7E ; | XXXXXX | $FF2D
    .byte $D9 ; |XX XX  X| $FF2E
    .byte $F0 ; |XXXX    | $FF2F
    .byte $47 ; | X   XXX| $FF30
    .byte $5D ; | X XXX X| $FF31
    .byte $90 ; |X  X    | $FF32
    .byte $EF ; |XXX XXXX| $FF33
    .byte $7B ; | XXXX XX| $FF34
    .byte $D0 ; |XX X    | $FF35
    .byte $FF ; |XXXXXXXX| $FF36
    .byte $7D ; | XXXXX X| $FF37
    .byte $F0 ; |XXXX    | $FF38
    .byte $BB ; |X XXX XX| $FF39
    .byte $FF ; |XXXXXXXX| $FF3A
    .byte $F0 ; |XXXX    | $FF3B
    .byte $96 ; |X  X XX | $FF3C
    .byte $F7 ; |XXXX XXX| $FF3D
    .byte $80 ; |X       | $FF3E
    .byte $00 ; |        | $FF3F
    .byte $00 ; |        | $FF40
    .byte $C0 ; |XX      | $FF41
    .byte $80 ; |X       | $FF42
    .byte $00 ; |        | $FF43
    .byte $E0 ; |XXX     | $FF44
    .byte $C0 ; |XX      | $FF45
    .byte $03 ; |      XX| $FF46
    .byte $F0 ; |XXXX    | $FF47
    .byte $F3 ; |XXXX  XX| $FF48
    .byte $0F ; |    XXXX| $FF49
    .byte $03 ; |      XX| $FF4A
    .byte $FF ; |XXXXXXXX| $FF4B
    .byte $FF ; |XXXXXXXX| $FF4C
    .byte $FF ; |XXXXXXXX| $FF4D
    .byte $09 ; |    X  X| $FF4E
    .byte $08 ; |    X   | $FF4F
    .byte $3C ; |  XXXX  | $FF50
    .byte $FF ; |XXXXXXXX| $FF51
    .byte $FF ; |XXXXXXXX| $FF52
    .byte $FF ; |XXXXXXXX| $FF53
LFF54:
    .byte $00 ; |        | $FF54
    .byte $4E ; | X  XXX | $FF55
    .byte $38 ; |  XXX   | $FF56
    .byte $4F ; | X  XXXX| $FF57
    .byte $45 ; | X   X X| $FF58
    .byte $00 ; |        | $FF59
    .byte $00 ; |        | $FF5A
    .byte $38 ; |  XXX   | $FF5B
    .byte $00 ; |        | $FF5C
    .byte $00 ; |        | $FF5D
    .byte $00 ; |        | $FF5E
    .byte $80 ; |X       | $FF5F
    .byte $00 ; |        | $FF60
    .byte $00 ; |        | $FF61
    .byte $00 ; |        | $FF62
    .byte $00 ; |        | $FF63
    .byte $18 ; |   XX   | $FF64
    .byte $00 ; |        | $FF65
    .byte $19 ; |   XX  X| $FF66
    .byte $00 ; |        | $FF67
    .byte $1A ; |   XX X | $FF68
    .byte $00 ; |        | $FF69
    .byte $1B ; |   XX XX| $FF6A
    .byte $00 ; |        | $FF6B
    .byte $1C ; |   XXX  | $FF6C
    .byte $00 ; |        | $FF6D
    .byte $1D ; |   XXX X| $FF6E
    .byte $00 ; |        | $FF6F
    .byte $1E ; |   XXXX | $FF70
    .byte $00 ; |        | $FF71
    .byte $1F ; |   XXXXX| $FF72
LFF73:
    .byte $18 ; |   XX   | $FF73
    .byte $10 ; |   X    | $FF74
    .byte $06 ; |     XX | $FF75
    .byte $06 ; |     XX | $FF76
    .byte $08 ; |    X   | $FF77
    .byte $0A ; |    X X | $FF78
    .byte $03 ; |      XX| $FF79
    .byte $02 ; |      X | $FF7A
    .byte $10 ; |   X    | $FF7B
LFF7C:
    .byte $08 ; |    X   | $FF7C
    .byte $07 ; |     XXX| $FF7D
    .byte $0F ; |    XXXX| $FF7E
    .byte $07 ; |     XXX| $FF7F
    .byte $0C ; |    XX  | $FF80
    .byte $03 ; |      XX| $FF81
    .byte $03 ; |      XX| $FF82
    .byte $0A ; |    X X | $FF83
    .byte $09 ; |    X  X| $FF84
    .byte $0C ; |    XX  | $FF85
LFF86:
    .byte $07 ; |     XXX| $FF86
    .byte $05 ; |     X X| $FF87
    .byte $01 ; |       X| $FF88
LFF89:
    .byte $01 ; |       X| $FF89
    .byte $00 ; |        | $FF8A
    .byte $00 ; |        | $FF8B
    .byte $06 ; |     XX | $FF8C
    .byte $02 ; |      X | $FF8D
    .byte $01 ; |       X| $FF8E
    .byte $01 ; |       X| $FF8F
LFF90:
    .byte $04 ; |     X  | $FF90
    .byte $06 ; |     XX | $FF91
    .byte $04 ; |     X  | $FF92
    .byte $04 ; |     X  | $FF93
    .byte $08 ; |    X   | $FF94
    .byte $08 ; |    X   | $FF95
    .byte $0D ; |    XX X| $FF96
    .byte $04 ; |     X  | $FF97
    .byte $04 ; |     X  | $FF98
    .byte $0F ; |    XXXX| $FF99
LFF9A:
    .byte $B0 ; |X XX    | $FF9A
    .byte $A3 ; |X X   XX| $FF9B
    .byte $D1 ; |XX X   X| $FF9C
    .byte $D7 ; |XX X XXX| $FF9D
    .byte $DF ; |XX XXXXX| $FF9E
    .byte $C7 ; |XX   XXX| $FF9F
    .byte $E7 ; |XXX  XXX| $FFA0
    .byte $DE ; |XX XXXX | $FFA1
    .byte $63 ; | XX   XX| $FFA2
    .byte $00 ; |        | $FFA3
    .byte $12 ; |   X  X | $FFA4
    .byte $00 ; |        | $FFA5
    .byte $12 ; |   X  X | $FFA6
    .byte $0D ; |    XX X| $FFA7
    .byte $0D ; |    XX X| $FFA8
    .byte $0D ; |    XX X| $FFA9
    .byte $0D ; |    XX X| $FFAA
    .byte $00 ; |        | $FFAB
    .byte $06 ; |     XX | $FFAC
    .byte $00 ; |        | $FFAD
    .byte $06 ; |     XX | $FFAE
    .byte $0D ; |    XX X| $FFAF
    .byte $0D ; |    XX X| $FFB0
    .byte $0D ; |    XX X| $FFB1
    .byte $0D ; |    XX X| $FFB2
    .byte $00 ; |        | $FFB3
    .byte $1B ; |   XX XX| $FFB4
    .byte $1B ; |   XX XX| $FFB5
    .byte $18 ; |   XX   | $FFB6
    .byte $15 ; |   X X X| $FFB7
    .byte $18 ; |   XX   | $FFB8
    .byte $15 ; |   X X X| $FFB9
    .byte $14 ; |   X X  | $FFBA
    .byte $15 ; |   X X X| $FFBB
    .byte $12 ; |   X  X | $FFBC
    .byte $00 ; |        | $FFBD
    .byte $15 ; |   X X X| $FFBE
    .byte $12 ; |   X  X | $FFBF
    .byte $10 ; |   X    | $FFC0
    .byte $0F ; |    XXXX| $FFC1
    .byte $12 ; |   X  X | $FFC2
    .byte $00 ; |        | $FFC3
    .byte $10 ; |   X    | $FFC4
    .byte $12 ; |   X  X | $FFC5
    .byte $00 ; |        | $FFC6
    .byte $00 ; |        | $FFC7
    .byte $04 ; |     X  | $FFC8
    .byte $00 ; |        | $FFC9
    .byte $00 ; |        | $FFCA
    .byte $04 ; |     X  | $FFCB
    .byte $00 ; |        | $FFCC
    .byte $0A ; |    X X | $FFCD
    .byte $00 ; |        | $FFCE
    .byte $00 ; |        | $FFCF
    .byte $0A ; |    X X | $FFD0
    .byte $09 ; |    X  X| $FFD1
    .byte $05 ; |     X X| $FFD2
    .byte $09 ; |    X  X| $FFD3
    .byte $05 ; |     X X| $FFD4
    .byte $09 ; |    X  X| $FFD5
    .byte $05 ; |     X X| $FFD6
    .byte $11 ; |   X   X| $FFD7
    .byte $0D ; |    XX X| $FFD8
    .byte $0B ; |    X XX| $FFD9
    .byte $08 ; |    X   | $FFDA
    .byte $0B ; |    X XX| $FFDB
    .byte $0D ; |    XX X| $FFDC
    .byte $13 ; |   X  XX| $FFDD
    .byte $00 ; |        | $FFDE
    .byte $08 ; |    X   | $FFDF
    .byte $07 ; |     XXX| $FFE0
    .byte $06 ; |     XX | $FFE1
    .byte $05 ; |     X X| $FFE2
    .byte $04 ; |     X  | $FFE3
    .byte $03 ; |      XX| $FFE4
    .byte $02 ; |      X | $FFE5
    .byte $01 ; |       X| $FFE6
    .byte $14 ; |   X X  | $FFE7
    .byte $00 ; |        | $FFE8
    .byte $1F ; |   XXXXX| $FFE9
    .byte $12 ; |   X  X | $FFEA
    .byte $10 ; |   X    | $FFEB

LFFEC:
;    sta    LFFF8                 ; 4
    LDA    LFFF8                 ;    avoid bus contention

    jmp    LF90B                 ; 3
LFFF2:
;    sta    LFFF8                 ; 4
    LDA    LFFF8                 ;    avoid bus contention

    jmp    LF012                 ; 3
LFFF8:
    .byte $00 ; |        | $FFF8
LFFF9:
    .byte $10 ; |   X    | $FFF9
LFFFA:
    .byte $80 ; |X       | $FFFA
    .byte $40 ; | X      | $FFFB

        ORG $2FFC
       RORG $FFFC

    .word START_2nd, LFD31