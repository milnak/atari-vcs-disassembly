; Rough Disassembly of Mission Survive, by Video Gems
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
;
;**************************************************************************************************
;                                                                                                 *
;  NOTE:                                                                                          *
;  To play this game the right difficulty switch must be set to "A" (the Expert setting).         *
;  The Z26 and Stella emulators recognize the original game and set the console switch for you.   *
;  The sample copy will not be known to these emulators as it is a new dump, and you have to      *
;  manually configure the switch or the game will appear frozen.                                  *
;                                                                                                 *
;  Mission Survive preforms a checksum to prevent hacking. This must be disabled or updated if    *
;  any changes are done to the game or it will crash.                                             *
;                                                                                                 *
;**************************************************************************************************
;
;
; Command Line: distella -pasfcMS.cfg MS.bin > MissionSurvive(re).asm
;
; MS.cfg contents:
;
;      ORG F000
;      CODE F000 F2E2
;      GFX F2E3 F2FF
;      CODE F300 F5E8
;      GFX F5E9 F5EE
;      CODE F5EF F7B7
;      GFX F7B8 F7BB
;      CODE F7BC F812
;      GFX F813 F85D
;      CODE F85E F967
;      GFX F968 F96F
;      CODE F970 FB1C
;      GFX FB1D FB22
;      CODE FB23 FBEA
;      GFX FBEB FFFF

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
HMBL    =  $24
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXM0P   =  $30
CXP1FB  =  $33
CXM1FB  =  $35
INPT4   =  $3C
SWCHA   =  $0280
SWACNT  =  $0281
SWCHB   =  $0282
SWBCNT  =  $0283
INTIM   =  $0284
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SWITCHES AND CONSTANTS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; only one on at a time!
; 0 = off, 1 = on

ORIGINAL     = 1
SAMPLE_COPY  = 0

   IF ORIGINAL
SOUND_VALUE     = $0A  ; stored in $BD or $BE
VOL_01          = $06  ; stored in AUDV1
VOL_02          = $04  ; stored in AUDV1
OFFSET_VALUE    = $9D  ; balance for checksum

   ELSE SAMPLE_COPY
SOUND_VALUE     = $0F  ; stored in $BD or $BE
VOL_01          = $08  ; stored in AUDV1
VOL_02          = $06  ; stored in AUDV1
OFFSET_VALUE    = $85  ; balance for checksum

   ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $F000

START:
    jmp    LF591                 ; 3

LF003:
    lda    INTIM                 ; 4
    bne    LF003                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    NUSIZ0                ; 3
    sta    ENABL                 ; 3
    sta    ENABL                 ; 3
    sta    ENABL                 ; 3
    lda    #$BB                  ; 2
    sta    COLUP0                ; 3
    sta    RESBL                 ; 3
    lda    #2                    ; 2
    sta    CTRLPF                ; 3
    sta    HMCLR                 ; 3
    lda    $81                   ; 3
    ora    #$1A                  ; 2
    sta    COLUPF                ; 3
    and    #$01                  ; 2
    bne    LF02C                 ; 2³
    sta    RESBL                 ; 3
LF02C:
    lda    #$D0                  ; 2
    sta    TIM64T                ; 4
    lda    #$80                  ; 2
    sta    HMBL                  ; 3
    lda    #$FC                  ; 2
    sta    $E3                   ; 3
    sta    $84                   ; 3
    ldx    #$94                  ; 2
    lda    #2                    ; 2
    sta    $E0                   ; 3
LF041:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    $82                   ; 3
    tay                          ; 2
    and    #$F0                  ; 2
    beq    LF055                 ; 2³
    lda    #0                    ; 2
    sta.w  GRP1                  ; 4
    beq    LF059                 ; 3   always branch

LF055:
    lda    ($83),Y               ; 5
    sta    GRP1                  ; 3
LF059:
    lda    #2                    ; 2
    cpx    $85                   ; 3
    beq    LF061                 ; 2³
    lda    #0                    ; 2
LF061:
    sta    ENAM0                 ; 3
    ldy    #0                    ; 2
    txa                          ; 2
    and    #$0F                  ; 2
    bne    LF06C                 ; 2³
    ldy    #2                    ; 2
LF06C:
    sty    ENABL                 ; 3
    dex                          ; 2
    cpx    #$14                  ; 2
    bne    LF076                 ; 2³
    jmp    LF2B1                 ; 3

LF076:
    ldy    $E0                   ; 3
    bmi    LF041                 ; 2³
    txa                          ; 2
    cmp.wy $EA,Y                 ; 4
    bne    LF041                 ; 2³
    lda    #7                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    $E1                   ; 3
    lda.wy $E4,Y                 ; 4
    sta    $E2                   ; 3
    lda.wy $E7,Y                 ; 4
    sta    $ED                   ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    $82                   ; 3
    tay                          ; 2
    and    #$F0                  ; 2
    beq    LF0A0                 ; 2³
    lda    #0                    ; 2
    sta.w  GRP1                  ; 4
    beq    LF0A4                 ; 3   always branch

LF0A0:
    lda    ($83),Y               ; 5
    sta    GRP1                  ; 3
LF0A4:
    lda    #0                    ; 2
    sta    ENABL                 ; 3
    cpx    $85                   ; 3
    bne    LF0AE                 ; 2³
    lda    #2                    ; 2
LF0AE:
    sta    ENAM0                 ; 3
    dex                          ; 2
    dey                          ; 2
    lda    #0                    ; 2
    cpy    #$10                  ; 2
    bcs    LF0BA                 ; 2³
    lda    ($83),Y               ; 5
LF0BA:
    dec    $E0                   ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    lda    $ED                   ; 3
    sta    HMOVE                 ; 3
    sta    HMP0                  ; 3
    dex                          ; 2
    and    #$0F                  ; 2
    tay                          ; 2
LF0CA:
    dey                          ; 2
    bpl    LF0CA                 ; 2³
    sta    RESP0                 ; 3
LF0CF:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    $82                   ; 3
    tay                          ; 2
    and    #$F0                  ; 2
    beq    LF0E3                 ; 2³
    lda    #0                    ; 2
    sta.w  GRP1                  ; 4
    beq    LF0E7                 ; 3   always branch

LF0E3:
    lda    ($83),Y               ; 5
    sta    GRP1                  ; 3
LF0E7:
    lda    #2                    ; 2
    sta    HMP0                  ; 3
    cpx    $85                   ; 3
    beq    LF0F1                 ; 2³
    lda    #0                    ; 2
LF0F1:
    sta    ENAM0                 ; 3
    ldy    $E1                   ; 3
    lda    ($E2),Y               ; 5
    sta    GRP0                  ; 3
    lda    LFC68,Y               ; 4
    sta    COLUP0                ; 3
    dex                          ; 2
    dec    $E1                   ; 5
    bpl    LF0CF                 ; 2³+1
    jmp    LF041                 ; 3

LF106:
    tay                          ; 2
    lda    $B8                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sty.w  GRP1                  ; 4
    ldx    #$12                  ; 2
    sta.w  HMBL                  ; 4
    and    #$0F                  ; 2
    tay                          ; 2
LF118:
    dey                          ; 2
    bpl    LF118                 ; 2³
    sta    RESBL                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    $82                   ; 3
    tay                          ; 2
    and    #$F0                  ; 2
    beq    LF131                 ; 2³
    lda    #0                    ; 2
    sta.w  GRP1                  ; 4
    beq    LF135                 ; 3   always branch

LF131:
    lda    ($83),Y               ; 5
    sta    GRP1                  ; 3
LF135:
    sta    RESP0                 ; 3
    stx    ENABL                 ; 3
    ldx    #$11                  ; 2
    stx.w  ENAM0                 ; 4
    lda    #1                    ; 2
    sta    NUSIZ0                ; 3
    lda    #0                    ; 2
    sta    HMP0                  ; 3
    sta    HMBL                  ; 3
    sta    VDELP0                ; 3
    dey                          ; 2
    cpy    #$10                  ; 2
    bcs    LF153                 ; 2³
    lda    ($83),Y               ; 5
    bcc    LF157                 ; 2³
LF153:
    sta    $3E                   ; 3
    nop                          ; 2
    nop                          ; 2
LF157:
    stx    VDELP1                ; 3
    sta    GRP1                  ; 3
LF15B:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    txa                          ; 2
    tay                          ; 2
    lda    ($8C),Y               ; 5
    sta    PF1                   ; 3
    lda    ($8F),Y               ; 5
    sta    GRP0                  ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    $82                   ; 3
    tay                          ; 2
    and    #$F0                  ; 2
    beq    LF179                 ; 2³
    lda    #0                    ; 2
    sta.w  GRP1                  ; 4
    beq    LF17D                 ; 3   always branch

LF179:
    lda    ($83),Y               ; 5
    sta    GRP1                  ; 3
LF17D:
    lda    #0                    ; 2
    sta    PF1                   ; 3
    sta    HMCLR                 ; 3
    dex                          ; 2
    nop                          ; 2
    nop                          ; 2
    cpx    #$0E                  ; 2
    bne    LF18C                 ; 2³
    lda    #2                    ; 2
LF18C:
    sta    ENAM1                 ; 3
    cpx    #7                    ; 2
    bne    LF15B                 ; 2³
LF192:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    txa                          ; 2
    tay                          ; 2
    lda    ($91),Y               ; 5
    sta    GRP0                  ; 3
    lda    $81                   ; 3
    and    #$08                  ; 2
    sta    REFP0                 ; 3
    sec                          ; 2
    nop                          ; 2
    lda    ($93),Y               ; 5
    sta    GRP0                  ; 3
    txa                          ; 2
    sbc    $82                   ; 3
    tay                          ; 2
    and    #$F0                  ; 2
    beq    LF1B7                 ; 2³
    lda    #0                    ; 2
    sta.w  GRP1                  ; 4
    beq    LF1BB                 ; 3   always branch

LF1B7:
    lda    ($83),Y               ; 5
    sta    GRP1                  ; 3
LF1BB:
    lda    #$0F                  ; 2
    sta    COLUP0                ; 3
    dex                          ; 2
    cpx    #4                    ; 2
    bne    LF192                 ; 2³
    ldy    #4                    ; 2
    ldx    #0                    ; 2
    stx    GRP1                  ; 3
LF1CA:
    lda    ($91),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    lda    #$30                  ; 2
    sta    CTRLPF                ; 3
    lda    $95,X                 ; 4
    sta    PF1                   ; 3
    lda    $96,X                 ; 4
    sta    PF2                   ; 3
    lda    ($93),Y               ; 5
    sta    GRP0                  ; 3
    lda    $97,X                 ; 4
    sta    PF0                   ; 3
    lda    $98,X                 ; 4
    sta    PF1                   ; 3
    lda    $99,X                 ; 4
    sta    PF2                   ; 3
    lda    #$FF                  ; 2
    sta    PF0                   ; 3
    ldx    LFCFA,Y               ; 4
    dey                          ; 2
    bpl    LF1CA                 ; 2³
    ldx    #4                    ; 2
LF1FA:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$FF                  ; 2
    sta    PF0                   ; 3
    lda    $A1                   ; 3
    sta    PF1                   ; 3
    lda    $A2                   ; 3
    sta    PF2                   ; 3
    jsr    LF279                 ; 6
    lda    $A3                   ; 3
    sta    PF0                   ; 3
    lda    $A4                   ; 3
    sta    PF1                   ; 3
    lda    $A5                   ; 3
    sta    PF2                   ; 3
    dex                          ; 2
    bne    LF1FA                 ; 2³+1
    ldy    #$42                  ; 2
    lda    #$72                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sty    COLUBK                ; 3
    sta    HMBL                  ; 3
    sta    ENABL                 ; 3
    stx    COLUPF                ; 3
    stx    PF0                   ; 3
    stx    RESBL                 ; 3
    stx    PF1                   ; 3
    stx    GRP0                  ; 3
    stx.w  GRP1                  ; 4
    stx    PF2                   ; 3
    lda    #3                    ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    stx    HMP1                  ; 3
    lda    #$F0                  ; 2
    sta    HMP0                  ; 3
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$2F                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    jsr    LF33F                 ; 6
LF25E:
    lda    INTIM                 ; 4
    bne    LF25E                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    lda    #$51                  ; 2
    sta    TIM64T                ; 4
    jsr    LF27A                 ; 6
    lda    #$28                  ; 2
    jsr    LF300                 ; 6
    jsr    LF27A                 ; 6
    sty    VDELP1                ; 3
LF279:
    rts                          ; 6

LF27A:
    ldy    #7                    ; 2
    sty    $EC                   ; 3
LF27E:
    ldy    $EC                   ; 3
    lda    ($E0),Y               ; 5
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($E2),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($E4),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($E6),Y               ; 5
    sta    $ED                   ; 3
    lda    ($E8),Y               ; 5
    tax                          ; 2
    lda    ($EA),Y               ; 5
    tay                          ; 2
    lda    $ED                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    dec    $EC                   ; 5
    bpl    LF27E                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #0                    ; 2
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    rts                          ; 6

LF2B1:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    $82                   ; 3
    tay                          ; 2
    and    #$F0                  ; 2
    beq    LF2C5                 ; 2³
    lda    #0                    ; 2
    sta.w  GRP1                  ; 4
    beq    LF2C9                 ; 3   always branch

LF2C5:
    lda    ($83),Y               ; 5
    sta    GRP1                  ; 3
LF2C9:
    lda    #0                    ; 2
    sta    REFP0                 ; 3
    sta    ENABL                 ; 3
    lda    #$44                  ; 2
    sta    COLUPF                ; 3
    lda    #$32                  ; 2
    sta    CTRLPF                ; 3
    lda    #0                    ; 2
    dey                          ; 2
    cpy    #$10                  ; 2
    bcs    LF2E0                 ; 2³
    lda    ($83),Y               ; 5
LF2E0:
    jmp    LF106                 ; 3

    .byte $00 ; |        | $F2E3
    .byte $00 ; |        | $F2E4
    .byte $00 ; |        | $F2E5
    .byte $00 ; |        | $F2E6
    .byte $00 ; |        | $F2E7
    .byte $00 ; |        | $F2E8
    .byte $00 ; |        | $F2E9
    .byte $00 ; |        | $F2EA
    .byte $00 ; |        | $F2EB
    .byte $00 ; |        | $F2EC
    .byte $00 ; |        | $F2ED
    .byte $00 ; |        | $F2EE
    .byte $00 ; |        | $F2EF
    .byte $00 ; |        | $F2F0
    .byte $00 ; |        | $F2F1
    .byte $00 ; |        | $F2F2
    .byte $00 ; |        | $F2F3
    .byte $00 ; |        | $F2F4
    .byte $00 ; |        | $F2F5
    .byte $00 ; |        | $F2F6
    .byte $00 ; |        | $F2F7
    .byte $00 ; |        | $F2F8
    .byte $00 ; |        | $F2F9
    .byte $00 ; |        | $F2FA
    .byte $00 ; |        | $F2FB
    .byte $00 ; |        | $F2FC
    .byte $00 ; |        | $F2FD
    .byte $00 ; |        | $F2FE
    .byte $00 ; |        | $F2FF

LF300:
    lda    #$58                  ; 2
    bit    $C2                   ; 3
    bmi    LF333                 ; 2³
    lda    $A9                   ; 3
    cmp    #$AA                  ; 2
    bne    LF331                 ; 2³
    bit    $81                   ; 3
    bvs    LF331                 ; 2³
    lda    $C6                   ; 3
    bpl    LF326                 ; 2³
    ldx    #7                    ; 2
LF316:
    lda    $C9,X                 ; 4
    sta    $E0,X                 ; 4
    dex                          ; 2
    bpl    LF316                 ; 2³
LF31D:
    lda    #$B8                  ; 2
    sta    $E8                   ; 3
    lda    #$C0                  ; 2
    sta    $EA                   ; 3
    rts                          ; 6

LF326:
    ldx    #7                    ; 2
LF328:
    lda    $E0,X                 ; 4
    sta    $C9,X                 ; 4
    dex                          ; 2
    bpl    LF328                 ; 2³
    bmi    LF31D                 ; 3   always branch

LF331:
    lda    #$28                  ; 2
LF333:
    ldx    #$0A                  ; 2
    sec                          ; 2
LF336:
    sta    $E0,X                 ; 4
    sbc    #8                    ; 2
    dex                          ; 2
    dex                          ; 2
    bpl    LF336                 ; 2³
    rts                          ; 6

LF33F:
    lda    #0                    ; 2
    sta    $ED                   ; 3
    sta    $EE                   ; 3
LF345:
    lda    $EE                   ; 3
    lsr                          ; 2
    tay                          ; 2
    lda.wy $A7,Y                 ; 4
    ldx    #1                    ; 2
    bcs    LF358                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    cpy    #2                    ; 2
    beq    LF360                 ; 2³
LF358:
    and    #$0F                  ; 2
    bne    LF362                 ; 2³
    ldx    $ED                   ; 3
    bne    LF362                 ; 2³
LF360:
    lda    #$0A                  ; 2
LF362:
    stx    $ED                   ; 3
    tax                          ; 2
    lda    $EE                   ; 3
    asl                          ; 2
    tay                          ; 2
    lda    LFFC8,X               ; 4
    sta.wy $E0,Y                 ; 5
    inc    $EE                   ; 5
    cpy    #4                    ; 2
    bcc    LF345                 ; 2³
    lda    #1                    ; 2
    sta    $ED                   ; 3
    cpy    #$0A                  ; 2
    bne    LF345                 ; 2³
    lda    #$FF                  ; 2
    ldx    #$0A                  ; 2
LF381:
    sta    $E1,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LF381                 ; 2³
    rts                          ; 6

LF388:
    ldy    #$FF                  ; 2
    sec                          ; 2
LF38B:
    iny                          ; 2
    sbc    #$0F                  ; 2
    bcs    LF38B                 ; 2³
    sty    $F2                   ; 3
    eor    #$FF                  ; 2
    adc    #9                    ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    $F2                   ; 3
    rts                          ; 6

LF39D:
    lda    $B3,X                 ; 4
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    cmp    #$F0                  ; 2
    bcs    LF3AB                 ; 2³
    adc    $B3,X                 ; 4
    sta    $B3,X                 ; 4
LF3AB:
    rts                          ; 6

LF3AC:
    sed                          ; 2
    clc                          ; 2
    adc    $A8                   ; 3
    sta    $A8                   ; 3
    lda    #0                    ; 2
    adc    $A7                   ; 3
    sta    $A7                   ; 3
    cld                          ; 2
    rts                          ; 6

LF3BA:
    bit    $A9                   ; 3
    bpl    LF3C6                 ; 2³
    lda    #$80                  ; 2
    sta    $B1                   ; 3
    lda    #0                    ; 2
    sta    $BC                   ; 3
LF3C6:
    lda    SWCHB                 ; 4
    and    #$02                  ; 2
    beq    LF3D1                 ; 2³
    sta    $BB                   ; 3
    bne    LF3F4                 ; 3   always branch

LF3D1:
    dec    $BB                   ; 5
    bne    LF3E1                 ; 2³
    inc    $BA                   ; 5
    lda    $BA                   ; 3
    and    #$07                  ; 2
    sta    $BA                   ; 3
    lda    #$1F                  ; 2
    sta    $BB                   ; 3
LF3E1:
    ldx    $BA                   ; 3
    inx                          ; 2
    stx    $A9                   ; 3
    lda    #0                    ; 2
    sta    $AF                   ; 3
    sta    $BC                   ; 3
    lda    #$58                  ; 2
    sta    $83                   ; 3
    lda    #$80                  ; 2
    sta    $B1                   ; 3
LF3F4:
    lsr    SWCHB                 ; 6
    bcc    LF400                 ; 2³+1
    lda    $B1                   ; 3
    bne    LF42C                 ; 2³+1
    jmp    LF4F3                 ; 3

LF400:
    jmp    LF551                 ; 3

LF403:
    lda    $BC                   ; 3
    inc    $BC                   ; 5
    cmp    #0                    ; 2
    bne    LF442                 ; 2³
    lda    #$80                  ; 2
    sta    $B1                   ; 3
    lda    #0                    ; 2
    sta    $AF                   ; 3
    lda    #$58                  ; 2
    sta    $83                   ; 3
    dec    $A9                   ; 5
    bpl    LF423                 ; 2³
    lda    #$AA                  ; 2
    sta    $A9                   ; 3
    sta    $C6                   ; 3
    bne    LF43C                 ; 3   always branch

LF423:
    jmp    LF56A                 ; 3

LF426:
    bit    INPT4                 ; 3
    bmi    LF43C                 ; 2³
    bpl    LF400                 ; 3   always branch

LF42C:
    bit    $B1                   ; 3
    bvs    LF403                 ; 2³
    bmi    LF426                 ; 2³
    bit    $BC                   ; 3
    bmi    LF442                 ; 2³
    jsr    LF85E                 ; 6
    jsr    LF9E9                 ; 6
LF43C:
    jsr    LFA90                 ; 6
    jsr    LFA4A                 ; 6
LF442:
    lda    INTIM                 ; 4
    bne    LF442                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #2                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    sta    VBLANK                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    sta    VBLANK                ; 3
    lda    #$4F                  ; 2
    sta    TIM64T                ; 4
    inc    $81                   ; 5
    lda    SWCHB                 ; 4
    and    #$80                  ; 2
    beq    LF478                 ; 2³
    bit    $BC                   ; 3
    bmi    LF478                 ; 2³
    jsr    LF707                 ; 6
    jsr    LF6C4                 ; 6
    jsr    LF7BC                 ; 6
LF478:
    jsr    LFB23                 ; 6
    lda    #2                    ; 2
    sta    $EE                   ; 3
    jsr    LF79E                 ; 6
    sty    $93                   ; 3
    lda    #$20                  ; 2
    sta    $EE                   ; 3
    jsr    LF79E                 ; 6
    sty    $91                   ; 3
    lda    $AB                   ; 3
    jsr    LF388                 ; 6
    sta    $EE                   ; 3
    lda    $AC                   ; 3
    jsr    LF388                 ; 6
    sta    $EF                   ; 3
    lda    $AA                   ; 3
    jsr    LF388                 ; 6
    sta    $F0                   ; 3
    lda    $8E                   ; 3
    jsr    LF388                 ; 6
    sta    $B8                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    $3E                   ; 3
    ldx    #2                    ; 2
LF4AF:
    lda    $EE,X                 ; 4
    sta    HMP1,X                ; 4
    and    #$0F                  ; 2
    tay                          ; 2
LF4B6:
    dey                          ; 2
    bpl    LF4B6                 ; 2³
    sta    RESP1,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    LF4AF                 ; 2³
    jsr    LF609                 ; 6
    lda    $C6                   ; 3
    beq    LF4E3                 ; 2³
    ldx    #$FF                  ; 2
    lda    $A7                   ; 3
    cmp    $C8                   ; 3
    bcc    LF4E1                 ; 2³
    bne    LF4D7                 ; 2³
    lda    $A8                   ; 3
    cmp    $C7                   ; 3
    bcc    LF4E1                 ; 2³
LF4D7:
    lda    $A7                   ; 3
    sta    $C8                   ; 3
    lda    $A8                   ; 3
    sta    $C7                   ; 3
    ldx    #1                    ; 2
LF4E1:
    stx    $C6                   ; 3
LF4E3:
    sta    CXCLR                 ; 3
    lda    #$B0                  ; 2
    sta    COLUBK                ; 3
    lda    #$20                  ; 2
    sta    NUSIZ1                ; 3
    jsr    LF003                 ; 6
    jmp    LF3BA                 ; 3

LF4F3:
    jsr    LF5EF                 ; 6
    lda    $C4                   ; 3
    beq    LF50B                 ; 2³+1
    lda    $BC                   ; 3
    cmp    #$B0                  ; 2
    bcc    LF50B                 ; 2³
    lda    $B9                   ; 3
    lsr                          ; 2
    clc                          ; 2
    adc    #1                    ; 2
    jsr    LF3AC                 ; 6
    dec    $C4                   ; 5
LF50B:
    lda    $BC                   ; 3
    inc    $BC                   ; 5
    cmp    #0                    ; 2
    bne    LF54E                 ; 2³
    sta    $C4                   ; 3
    lda    #7                    ; 2
    bit    SWCHB                 ; 4
    bvc    LF51E                 ; 2³
    lda    #$0F                  ; 2
LF51E:
    sta    $B2                   ; 3
    lda    $C6                   ; 3
    bne    LF528                 ; 2³
    lda    #1                    ; 2
    sta    $C6                   ; 3
LF528:
    ldx    #2                    ; 2
    stx    $C5                   ; 3
LF52C:
    lda    #$F8                  ; 2
    and    $86,X                 ; 4
    sta    $86,X                 ; 4
    dex                          ; 2
    bpl    LF52C                 ; 2³
LF535:
    jsr    LF570                 ; 6
    ldx    #$80                  ; 2
    lda    $A7                   ; 3
    and    #$F0                  ; 2
    cmp    #$60                  ; 2
    bcc    LF544                 ; 2³
    ldx    #$50                  ; 2
LF544:
    stx    $C3                   ; 3
    lda    #$58                  ; 2
    sta    $83                   ; 3
    lda    #1                    ; 2
    sta    $B1                   ; 3
LF54E:
    jmp    LF442                 ; 3

LF551:
    lda    $BA                   ; 3
    sta    $B9                   ; 3
    lda    #0                    ; 2
    sta    $A7                   ; 3
    sta    $A8                   ; 3
    sta    $BC                   ; 3
    sta    $BE                   ; 3   clear
    sta    $BD                   ; 3   clear
    sta    $C4                   ; 3
    lda    #3                    ; 2
    sta    $A9                   ; 3
    jmp    LF4F3                 ; 3

LF56A:
    jsr    LF5EF                 ; 6
    jmp    LF535                 ; 3

LF570:
    ldx    $B9                   ; 3
    ldy    LFD1F,X               ; 4
    ldx    #4                    ; 2
LF577:
    lda    LFD27,Y               ; 4
    sta    $B3,X                 ; 4
    dey                          ; 2
    dex                          ; 2
    bpl    LF577                 ; 2³
LF580:
    lda    #$A0                  ; 2
    sta    $82                   ; 3
    sta    $85                   ; 3
    lda    #$95                  ; 2
    sta    $8E                   ; 3
    lda    #0                    ; 2
    sta    $AA                   ; 3
    sta    $AF                   ; 3
    rts                          ; 6

LF591:
    sei                          ; 2
    cld                          ; 2
    ldx    #$FF                  ; 2
    txs                          ; 2
    inx                          ; 2
    lda    #0                    ; 2
LF599:
    sta    0,X                   ; 4
    inx                          ; 2
    bne    LF599                 ; 2³

    sta    SWACNT                ; 4
    sta    SWBCNT                ; 4
    jsr    LFBC0                 ; 6   do checksum

    lda    #$1F                  ; 2
    sta    COLUP1                ; 3
    lda    #$0F                  ; 2
    sta    COLUPF                ; 3
    lda    #$FC                  ; 2
    sta    $90                   ; 3
    lda    #$78                  ; 2
    sta    $8F                   ; 3
    lda    #$FC                  ; 2
    sta    $8D                   ; 3
    lda    #$68                  ; 2
    sta    $8C                   ; 3
    lda    #$58                  ; 2
    sta    $83                   ; 3
    lda    #$FC                  ; 2
    sta    $92                   ; 3
    sta    $94                   ; 3
    jsr    LF5EF                 ; 6
    jsr    LF570                 ; 6
    lda    #1                    ; 2
    sta    $A9                   ; 3
    lda    #$80                  ; 2
    sta    $B1                   ; 3
    ldx    #2                    ; 2
LF5D9:
    lda    LF5E9,X               ; 4
    sta    $86,X                 ; 4
    lda    LF5EC,X               ; 4
    sta    $89,X                 ; 4
    dex                          ; 2
    bpl    LF5D9                 ; 2³
    jmp    LF3BA                 ; 3

LF5E9:
    .byte $20 ; |  X     | $F5E9
    .byte $18 ; |   XX   | $F5EA
    .byte $10 ; |   X    | $F5EB
LF5EC:
    .byte $50 ; | X X    | $F5EC
    .byte $30 ; |  XX    | $F5ED
    .byte $10 ; |   X    | $F5EE

LF5EF:
    lda    #5                    ; 2
    sta    $C2                   ; 3
    lda    #0                    ; 2
    ldx    #$0B                  ; 2
LF5F7:
    sta    $95,X                 ; 4
    dex                          ; 2
    bpl    LF5F7                 ; 2³
    sta    $A6                   ; 3
    stx    $A1                   ; 3
    stx    $A2                   ; 3
    stx    $A3                   ; 3
    stx    $A4                   ; 3
    stx    $A5                   ; 3
    rts                          ; 6

LF609:
    ldy    $B9                   ; 3
    lda    LFC00,Y               ; 4
    sta    $F3                   ; 3
    lda    $80                   ; 3
    sta    $ED                   ; 3
    lda    $86                   ; 3
    and    #$38                  ; 2
    clc                          ; 2
    adc    #3                    ; 2
    tax                          ; 2
    lda    $81                   ; 3
    and    #$01                  ; 2
    beq    LF62C                 ; 2³
    txa                          ; 2
    adc    #3                    ; 2
    tax                          ; 2
    lda    $ED                   ; 3
    eor    #$FF                  ; 2
    sta    $ED                   ; 3
LF62C:
    ldy    #2                    ; 2
LF62E:
    lda    LFCB8,X               ; 4
    sta.wy $EE,Y                 ; 5
    dex                          ; 2
    dey                          ; 2
    bpl    LF62E                 ; 2³
    ldy    #2                    ; 2
LF63A:
    sty    $F1                   ; 3
    lda.wy $EE,Y                 ; 4
    bmi    LF679                 ; 2³
    tax                          ; 2
    lda    $89,X                 ; 4
    jsr    LF388                 ; 6
    ldy    $F1                   ; 3
    sta.wy $E7,Y                 ; 5
    lda    $86,X                 ; 4
    and    #$38                  ; 2
    tay                          ; 2
    lda    LFCB8,Y               ; 4
    sec                          ; 2
    sbc    $ED                   ; 3
    ldy    $F1                   ; 3
    sta.wy $EA,Y                 ; 5
    lda    $86,X                 ; 4
    and    #$07                  ; 2
    tay                          ; 2
    lda    $F3                   ; 3
    cpy    #0                    ; 2
    beq    LF66F                 ; 2³
    lda    #$A0                  ; 2
    cpy    #2                    ; 2
    bcc    LF66F                 ; 2³
    lda    #$48                  ; 2
LF66F:
    ldy    $F1                   ; 3
    sta.wy $E4,Y                 ; 5
    dey                          ; 2
    bpl    LF63A                 ; 2³
    bmi    LF67E                 ; 3   always branch

LF679:
    lda    #0                    ; 2
    sta.wy $EA,Y                 ; 5
LF67E:
    bit    $AF                   ; 3
    bpl    LF693                 ; 2³
    bit    $BC                   ; 3
    bvs    LF68C                 ; 2³
    lda    $81                   ; 3
    and    #$02                  ; 2
    bne    LF693                 ; 2³
LF68C:
    ldx    #$98                  ; 2
    ldy    #$98                  ; 2
    jmp    LF6AE                 ; 3

LF693:
    ldx    #$68                  ; 2
    ldy    #$78                  ; 2
    lda    $81                   ; 3
    and    #$08                  ; 2
    bne    LF69F                 ; 2³
    inx                          ; 2
    iny                          ; 2
LF69F:
    bit    $AD                   ; 3
    bpl    LF6AE                 ; 2³
    lda    $81                   ; 3
    and    #$02                  ; 2
    bne    LF6AE                 ; 2³
    tya                          ; 2
    clc                          ; 2
    adc    #$10                  ; 2
    tay                          ; 2
LF6AE:
    stx    $8C                   ; 3
    sty    $8F                   ; 3
    ldx    #$86                  ; 2
    bit    $B0                   ; 3
    bpl    LF6BA                 ; 2³
    ldx    #$8F                  ; 2
LF6BA:
    stx    COLUP1                ; 3
    lda    $81                   ; 3
    and    #$04                  ; 2
    asl                          ; 2
    sta    REFP0                 ; 3
    rts                          ; 6

LF6C4:
    ldx    #2                    ; 2
    jsr    LF39D                 ; 6
    bcc    LF702                 ; 2³+1
    ldx    $80                   ; 3
    inx                          ; 2
    inx                          ; 2
    cpx    #$0D                  ; 2
    bcc    LF6E2                 ; 2³
    ldx    #2                    ; 2
LF6D5:
    lda    $86,X                 ; 4
    clc                          ; 2
    adc    #8                    ; 2
    and    #$BF                  ; 2
    sta    $86,X                 ; 4
    dex                          ; 2
    bpl    LF6D5                 ; 2³
    inx                          ; 2
LF6E2:
    stx    $80                   ; 3
    ldx    #2                    ; 2
LF6E6:
    lda    $86,X                 ; 4
    bmi    LF703                 ; 2³+1
    lda    #2                    ; 2
LF6EC:
    clc                          ; 2
    adc    $89,X                 ; 4
    sta    $89,X                 ; 4
    cmp    #$80                  ; 2
    bcs    LF6F9                 ; 2³
    cmp    #$10                  ; 2
    bcs    LF6FF                 ; 2³
LF6F9:
    lda    $86,X                 ; 4
    eor    #$80                  ; 2
    sta    $86,X                 ; 4
LF6FF:
    dex                          ; 2
    bpl    LF6E6                 ; 2³+1
LF702:
    rts                          ; 6

LF703:
    lda    #$FE                  ; 2
    bne    LF6EC                 ; 3+1   always branch

LF707:
    ldx    #3                    ; 2
    jsr    LF39D                 ; 6
    bcc    LF763                 ; 2³
    bit    $AD                   ; 3
    bpl    LF717                 ; 2³
    lda    #4                    ; 2
    jmp    LF727                 ; 3

LF717:
    lda    #2                    ; 2
    bit    $B1                   ; 3
    bmi    LF727                 ; 2³
    bit    SWCHA                 ; 4
    bvs    LF727                 ; 2³
    jsr    LF779                 ; 6
    lda    #1                    ; 2
LF727:
    clc                          ; 2
    adc    $AE                   ; 3
    sta    $AE                   ; 3
    bmi    LF763                 ; 2³
    lda    #$F9                  ; 2
    sta    $AE                   ; 3
    lda    $8E                   ; 3
    sec                          ; 2
    sbc    #4                    ; 2
    cmp    #$20                  ; 2
    bcs    LF73D                 ; 2³
    lda    #$95                  ; 2
LF73D:
    sta    $8E                   ; 3
    lda    $9A                   ; 3
    beq    LF764                 ; 2³
LF743:
    ldx    #$0C                  ; 2
    sec                          ; 2
    bcs    LF74A                 ; 3   always branch

LF748:
    asl    $9A,X                 ; 6
LF74A:
    ror    $99,X                 ; 6
    rol    $98,X                 ; 6
    ror    $97,X                 ; 6
    sec                          ; 2
    lda    #8                    ; 2
    and    $97,X                 ; 4
    bne    LF758                 ; 2³
    clc                          ; 2
LF758:
    ror    $96,X                 ; 6
    rol    $95,X                 ; 6
    txa                          ; 2
    sec                          ; 2
    sbc    #6                    ; 2
    tax                          ; 2
    bpl    LF748                 ; 2³
LF763:
    rts                          ; 6

LF764:
    ldx    $A6                   ; 3
    lda    LFCFF,X               ; 4
    sta    $9A                   ; 3
    lda    LFD0F,X               ; 4
    sta    $A0                   ; 3
    inx                          ; 2
    txa                          ; 2
    and    #$0F                  ; 2
    sta    $A6                   ; 3
    jmp    LF743                 ; 3

LF779:
    ldx    #1                    ; 2
    lda    $85                   ; 3
    cmp    #$18                  ; 2
    bcs    LF782                 ; 2³
    dex                          ; 2
LF782:
    cpx    #0                    ; 2
    bne    LF78D                 ; 2³
    lda    $83                   ; 3
    cmp    #$48                  ; 2
    bne    LF78D                 ; 2³
    rts                          ; 6

LF78D:
    lda    $AB,X                 ; 4
    clc                          ; 2
    adc    #1                    ; 2
    cmp    #$82                  ; 2
    bcc    LF798                 ; 2³
    lda    $AB,X                 ; 4
LF798:
    sta    $AB,X                 ; 4
    dex                          ; 2
    bpl    LF782                 ; 2³
    rts                          ; 6

LF79E:
    ldy    #$A8                  ; 2
    bit    $AD                   ; 3
    bmi    LF7B7                 ; 2³
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
    lda    $95                   ; 3
    and    $EE                   ; 3
    bne    LF7B7                 ; 2³
    iny                          ; 2
    iny                          ; 2
    lda    $9B                   ; 3
    and    $EE                   ; 3
    bne    LF7B7                 ; 2³
    iny                          ; 2
    iny                          ; 2
LF7B7:
    rts                          ; 6

LF7B8:
    .byte $02 ; |      X | $F7B8
    .byte $02 ; |      X | $F7B9
    .byte $02 ; |      X | $F7BA
    .byte $03 ; |      XX| $F7BB

LF7BC:
    lda    $81                   ; 3
    and    #$7F                  ; 2
    bne    LF7C4                 ; 2³
    dec    $C3                   ; 5
LF7C4:
    ldx    #1                    ; 2
    jsr    LF39D                 ; 6
    bcc    LF7EB                 ; 2³
    lda    $B0                   ; 3
    and    #$7F                  ; 2
    bne    LF7EB                 ; 2³
    lda    $B9                   ; 3
    lsr                          ; 2
    tax                          ; 2
    lda    $82                   ; 3
    cmp    #$A0                  ; 2
    beq    LF7EB                 ; 2³
    sec                          ; 2
    sbc    LF7B8,X               ; 4
    sta    $82                   ; 3
    and    #$F8                  ; 2
    cmp    #$F0                  ; 2
    bne    LF7EB                 ; 2³
    lda    #$A0                  ; 2
    sta    $82                   ; 3
LF7EB:
    ldx    #0                    ; 2
    jsr    LF39D                 ; 6
    bcc    LF812                 ; 2³+1
    lda    $85                   ; 3
    cmp    #$A0                  ; 2
    beq    LF803                 ; 2³+1
    clc                          ; 2
    adc    #4                    ; 2
    cmp    #$92                  ; 2
    bcc    LF801                 ; 2³+1
    lda    #$A0                  ; 2
LF801:
    sta    $85                   ; 3
LF803:
    lda    $AA                   ; 3
    beq    LF812                 ; 2³
    clc                          ; 2
    adc    #4                    ; 2
    cmp    $C3                   ; 3
    bcc    LF810                 ; 2³
    lda    #0                    ; 2
LF810:
    sta    $AA                   ; 3
LF812:
    rts                          ; 6

LF813:
    .byte $00 ; |        | $F813
    .byte $A0 ; |X X     | $F814
    .byte $90 ; |X  X    | $F815
    .byte $80 ; |X       | $F816
    .byte $30 ; |  XX    | $F817
    .byte $28 ; |  X X   | $F818
    .byte $24 ; |  X  X  | $F819
LF81A:
    .byte $3F ; |  XXXXXX| $F81A
    .byte $CF ; |XX  XXXX| $F81B
    .byte $F3 ; |XXXX  XX| $F81C
    .byte $FC ; |XXXXXX  | $F81D
    .byte $FC ; |XXXXXX  | $F81E
    .byte $F3 ; |XXXX  XX| $F81F
    .byte $CF ; |XX  XXXX| $F820
    .byte $3F ; |  XXXXXX| $F821
    .byte $CF ; |XX  XXXX| $F822
    .byte $3F ; |  XXXXXX| $F823
    .byte $3F ; |  XXXXXX| $F824
    .byte $CF ; |XX  XXXX| $F825
    .byte $F3 ; |XXXX  XX| $F826
    .byte $FC ; |XXXXXX  | $F827
    .byte $FC ; |XXXXXX  | $F828
    .byte $F3 ; |XXXX  XX| $F829
    .byte $CF ; |XX  XXXX| $F82A
    .byte $3F ; |  XXXXXX| $F82B
LF82C:
    .byte $00 ; |        | $F82C
    .byte $00 ; |        | $F82D
    .byte $00 ; |        | $F82E
    .byte $00 ; |        | $F82F
    .byte $01 ; |       X| $F830
    .byte $01 ; |       X| $F831
    .byte $01 ; |       X| $F832
    .byte $01 ; |       X| $F833
    .byte $02 ; |      X | $F834
    .byte $02 ; |      X | $F835
    .byte $03 ; |      XX| $F836
    .byte $03 ; |      XX| $F837
    .byte $03 ; |      XX| $F838
    .byte $03 ; |      XX| $F839
    .byte $04 ; |     X  | $F83A
    .byte $04 ; |     X  | $F83B
    .byte $04 ; |     X  | $F83C
    .byte $04 ; |     X  | $F83D
LF83E:
    .byte $04 ; |     X  | $F83E
    .byte $04 ; |     X  | $F83F
    .byte $04 ; |     X  | $F840
    .byte $05 ; |     X X| $F841
    .byte $05 ; |     X X| $F842
    .byte $06 ; |     XX | $F843
    .byte $06 ; |     XX | $F844
    .byte $06 ; |     XX | $F845
LF846:
    .byte $09 ; |    X  X| $F846
    .byte $09 ; |    X  X| $F847
    .byte $09 ; |    X  X| $F848
    .byte $10 ; |   X    | $F849
    .byte $10 ; |   X    | $F84A
    .byte $10 ; |   X    | $F84B
    .byte $11 ; |   X   X| $F84C
    .byte $11 ; |   X   X| $F84D
LF84E:
    .byte $10 ; |   X    | $F84E
    .byte $10 ; |   X    | $F84F
    .byte $10 ; |   X    | $F850
    .byte $11 ; |   X   X| $F851
    .byte $11 ; |   X   X| $F852
    .byte $11 ; |   X   X| $F853
    .byte $12 ; |   X  X | $F854
    .byte $12 ; |   X  X | $F855
LF856:
    .byte $FF ; |XXXXXXXX| $F856
    .byte $FF ; |XXXXXXXX| $F857
    .byte $FF ; |XXXXXXXX| $F858
    .byte $FE ; |XXXXXXX | $F859
    .byte $FE ; |XXXXXXX | $F85A
    .byte $FE ; |XXXXXXX | $F85B
    .byte $FE ; |XXXXXXX | $F85C
    .byte $FE ; |XXXXXXX | $F85D

LF85E:
    ldx    #0                    ; 2
    bit    CXP1FB                ; 3
    bmi    LF878                 ; 2³
    inx                          ; 2
    lda    $8E                   ; 3
    cmp    #$30                  ; 2
    bcc    LF878                 ; 2³
    inx                          ; 2
    lda    $A1                   ; 3
    and    #$02                  ; 2
    bne    LF876                 ; 2³
    bit    $AD                   ; 3
    bpl    LF878                 ; 2³
LF876:
    ldx    #$FF                  ; 2
LF878:
    inx                          ; 2
    lda    LF813,X               ; 4
    sta    $AF                   ; 3
    lda    $83                   ; 3
    cmp    #$58                  ; 2
    bne    LF8D5                 ; 2³
    ldx    #3                    ; 2
    lda    $82                   ; 3
    cmp    #$12                  ; 2
    bcs    LF89A                 ; 2³
    lda    $AB                   ; 3
    adc    #4                    ; 2
    sbc    $8E                   ; 3
    bpl    LF896                 ; 2³
    eor    #$FF                  ; 2
LF896:
    cmp    #8                    ; 2
    bcc    LF8C7                 ; 2³
LF89A:
    inx                          ; 2
    lda    #$15                  ; 2
    bit    $B0                   ; 3
    bmi    LF8A3                 ; 2³
    lda    #$10                  ; 2
LF8A3:
    sta    $ED                   ; 3
    bit    CXM0P                 ; 3
    bmi    LF8CB                 ; 2³
    inx                          ; 2
    lda    $82                   ; 3
    cmp    #$10                  ; 2
    bcs    LF8C5                 ; 2³
    cmp    #5                    ; 2
    bcc    LF8C5                 ; 2³
    lda    $AB                   ; 3
    adc    #4                    ; 2
    sbc    $AA                   ; 3
    bpl    LF8BE                 ; 2³
    eor    #$FF                  ; 2
LF8BE:
    ldy    $B9                   ; 3
    cmp    LF83E,Y               ; 4
    bcc    LF8CB                 ; 2³
LF8C5:
    ldx    #$FF                  ; 2
LF8C7:
    lda    #0                    ; 2
    sta    $ED                   ; 3
LF8CB:
    lda    $ED                   ; 3
    inx                          ; 2
    lda    LF813,X               ; 4
    ora    $AF                   ; 3
    sta    $AF                   ; 3
LF8D5:
    bit    CXM1FB                ; 3
    bvc    LF8EB                 ; 2³
    lda    $AA                   ; 3
    beq    LF8EB                 ; 2³
    lda    #5                    ; 2
    inc    $C4                   ; 5
    bne    LF8E5                 ; 2³
    dec    $C4                   ; 5
LF8E5:
    lda    #$14                  ; 2
    ora    $AF                   ; 3
    sta    $AF                   ; 3
LF8EB:
    ldy    $B9                   ; 3
    lda    LF968,Y               ; 4
    sta    $ED                   ; 3
    ldy    #2                    ; 2
LF8F4:
    lda    $AC                   ; 3
    ldx    $B9                   ; 3
    sbc.wy $89,Y                 ; 4
    bmi    LF904                 ; 2³+1
    cmp    LF846,X               ; 4
    bcs    LF970                 ; 2³
    bcc    LF909                 ; 3   always branch

LF904:
    cmp    LF856,X               ; 4
    bcc    LF970                 ; 2³
LF909:
    lda.wy $86,Y                 ; 4
    and    #$07                  ; 2
    bne    LF970                 ; 2³
    lda.wy $86,Y                 ; 4
    and    #$38                  ; 2
    tax                          ; 2
    lda    LFCB8,X               ; 4
    cpx    #$20                  ; 2
    bcs    LF963                 ; 2³
    sbc    $80                   ; 3
LF91F:
    sbc    $85                   ; 3
    bmi    LF92C                 ; 2³
    ldx    $B9                   ; 3
    cmp    LF84E,X               ; 4
    bcs    LF970                 ; 2³
    bcc    LF930                 ; 3   always branch

LF92C:
    cmp    #$FE                  ; 2
    bcc    LF970                 ; 2³
LF930:
    lda    #7                    ; 2
    ora.wy $86,Y                 ; 4
    sta.wy $86,Y                 ; 5
    lda    $ED                   ; 3
    jsr    LF3AC                 ; 6
    lda    $B2                   ; 3
    cmp    #2                    ; 2
    bcs    LF95B                 ; 2³
    ldx    #2                    ; 2
LF945:
    lda    $86,X                 ; 4
    and    #$07                  ; 2
    beq    LF95B                 ; 2³
    dex                          ; 2
    bpl    LF945                 ; 2³
    lda    $C5                   ; 3
    beq    LF95B                 ; 2³
    ldx    $A9                   ; 3
    inx                          ; 2
    cpx    #$0A                  ; 2
    beq    LF95B                 ; 2³
    stx    $A9                   ; 3
LF95B:
    lda    #$48                  ; 2
    ora    $AF                   ; 3
    sta    $AF                   ; 3
    bne    LF973                 ; 3   always branch

LF963:
    adc    $80                   ; 3
    jmp    LF91F                 ; 3

LF968:
    .byte $10 ; |   X    | $F968
    .byte $10 ; |   X    | $F969
    .byte $15 ; |   X X X| $F96A
    .byte $20 ; |  X     | $F96B
    .byte $25 ; |  X  X X| $F96C
    .byte $30 ; |  XX    | $F96D
    .byte $35 ; |  XX X X| $F96E
    .byte $40 ; | X      | $F96F

LF970:
    dey                          ; 2
    bpl    LF8F4                 ; 2³+1
LF973:
    bit    $B0                   ; 3
    bpl    LF9A0                 ; 2³
    lda    $82                   ; 3
    and    #$F0                  ; 2
    cmp    #$F0                  ; 2
    bne    LF9A0                 ; 2³
    ldy    #SOUND_VALUE          ; 2
    sty    $BE                   ; 3
    lda    $AB                   ; 3
    sbc    #5                    ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LF81A,Y               ; 4
    ldx    LF82C,Y               ; 4
    tay                          ; 2
    and    $95,X                 ; 4
    sta    $95,X                 ; 4
    tya                          ; 2
    and    $9B,X                 ; 4
    sta    $9B,X                 ; 4
    tya                          ; 2
    and    $A1,X                 ; 4
    sta    $A1,X                 ; 4
LF9A0:
    lda    $AF                   ; 3
    beq    LF9C7                 ; 2³
    bmi    LF9C8                 ; 2³
    ldy    #SOUND_VALUE          ; 2
    sty    $BE                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    bcc    LF9B3                 ; 2³
    ldy    #$3F                  ; 2
    sty    $B0                   ; 3
LF9B3:
    asl                          ; 2
    bcc    LF9BA                 ; 2³
    ldy    #$95                  ; 2
    sty    $8E                   ; 3
LF9BA:
    asl                          ; 2
    bcc    LF9C1                 ; 2³
    ldy    #$A0                  ; 2
    sty    $85                   ; 3
LF9C1:
    bpl    LF9C7                 ; 2³
    ldy    #0                    ; 2
    sty    $AA                   ; 3
LF9C7:
    rts                          ; 6

LF9C8:
    bit    $B1                   ; 3
    bmi    LF9C7                 ; 2³
    lda    $AF                   ; 3
    and    #$20                  ; 2
    beq    LF9D6                 ; 2³
    lda    #$48                  ; 2
    sta    $83                   ; 3
LF9D6:
    lda    #0                    ; 2
    sta    $C4                   ; 3
    sta    $C5                   ; 3
    lda    #$40                  ; 2
    sta    $B1                   ; 3
    ldy    #$3F                  ; 2
    sty    $BE                   ; 3
    lda    #$80                  ; 2
    sta    $BC                   ; 3
    rts                          ; 6

LF9E9:
    ldy    $C0                   ; 3
    lda    SWCHA                 ; 4
    and    #$90                  ; 2
    ldx    $AA                   ; 3
    bne    LFA04                 ; 2³+1
    cmp    #$80                  ; 2
    bcs    LFA04                 ; 2³+1
    cpy    #$80                  ; 2
    bcc    LFA04                 ; 2³+1
    ldx    #$26                  ; 2
    stx    $AA                   ; 3
    ldx    #SOUND_VALUE          ; 2
    stx    $BD                   ; 3
LFA04:
    ldx    $85                   ; 3
    cpx    #$A0                  ; 2
    bne    LFA1F                 ; 2³
    and    #$10                  ; 2
    bne    LFA1F                 ; 2³
    tya                          ; 2
    and    #$10                  ; 2
    beq    LFA1F                 ; 2³
    lda    #$22                  ; 2
    sta    $AC                   ; 3
    lda    #$14                  ; 2
    sta    $85                   ; 3
    lda    #SOUND_VALUE          ; 2
    sta    $BD                   ; 3
LFA1F:
    lda    SWCHA                 ; 4
    and    #$90                  ; 2
    sta    $C0                   ; 3
    ldy    $AD                   ; 3
    bmi    LFA38                 ; 2³
    bit    INPT4                 ; 3
    bpl    LFA32                 ; 2³
    ldy    #0                    ; 2
    beq    LFA46                 ; 3   always branch

LFA32:
    cpy    #0                    ; 2
    bne    LFA46                 ; 2³
    ldy    #$80                  ; 2
LFA38:
    cpy    #$9F                  ; 2
    bcc    LFA47                 ; 2³
    lda    $A1                   ; 3
    and    #$03                  ; 2
    eor    #$03                  ; 2
    bne    LFA46                 ; 2³
    ldy    #$40                  ; 2
LFA46:
    dey                          ; 2
LFA47:
    iny                          ; 2
    sty    $AD                   ; 3
LFA4A:
    ldx    #0                    ; 2
LFA4C:
    lda    $82                   ; 3
    cmp    #$A0                  ; 2
    bne    LFA86                 ; 2³
    lda    $86,X                 ; 4
    and    #$07                  ; 2
    bne    LFA86                 ; 2³
    lda    $86,X                 ; 4
    and    #$38                  ; 2
    tay                          ; 2
    lda    LFCB8,Y               ; 4
    cpy    #$20                  ; 2
    bcs    LFA8C                 ; 2³
    sbc    $80                   ; 3
LFA66:
    sbc    #$15                  ; 2
    sta    $82                   ; 3
    lda    $89,X                 ; 4
    sta    $AB                   ; 3
    ldx    #4                    ; 2
    jsr    LF39D                 ; 6
    ldx    #0                    ; 2
    bcc    LFA79                 ; 2³
    ldx    #$80                  ; 2
LFA79:
    stx    $B0                   ; 3
    ldx    #0                    ; 2
    stx    $BF                   ; 3
    cmp    #$0F                  ; 2
    bcs    LFA85                 ; 2³
    inc    $B7                   ; 5
LFA85:
    rts                          ; 6

LFA86:
    inx                          ; 2
    cpx    #3                    ; 2
    bne    LFA4C                 ; 2³
    rts                          ; 6

LFA8C:
    adc    $80                   ; 3
    bcc    LFA66                 ; 2³
LFA90:
    lda    #7                    ; 2
    and    $81                   ; 3
    bne    LFAA7                 ; 2³
    ldx    #2                    ; 2
LFA98:
    lda    $86,X                 ; 4
    and    #$07                  ; 2
    cmp    #2                    ; 2
    bcc    LFAA4                 ; 2³
    beq    LFAC7                 ; 2³
LFAA2:
    dec    $86,X                 ; 6
LFAA4:
    dex                          ; 2
    bpl    LFA98                 ; 2³
LFAA7:
    lda    $B0                   ; 3
    and    #$7F                  ; 2
    beq    LFABD                 ; 2³
    dec    $B0                   ; 5
    cmp    #1                    ; 2
    beq    LFABE                 ; 2³
    lda    #$80                  ; 2
    eor    $B0                   ; 3
    sta    $B0                   ; 3
    lda    #$48                  ; 2
    sta    $83                   ; 3
LFABD:
    rts                          ; 6

LFABE:
    lda    #$58                  ; 2
    sta    $83                   ; 3
    lda    #$A0                  ; 2
    sta    $82                   ; 3
    rts                          ; 6

LFAC7:
    dec    $B2                   ; 5
    lda    $B2                   ; 3
    bmi    LFADA                 ; 2³
    cmp    #2                    ; 2
    bcc    LFAA2                 ; 2³
    lda    #$F8                  ; 2
    and    $86,X                 ; 4
    sta    $86,X                 ; 4
    jmp    LFAA4                 ; 3

LFADA:
    lda    #$80                  ; 2
    sta    $BC                   ; 3
    lda    #0                    ; 2
    sta    $B1                   ; 3
    dec    $86,X                 ; 6
    ldy    $B9                   ; 3
    iny                          ; 2
    cpy    #8                    ; 2
    bcs    LFAED                 ; 2³
    sty    $B9                   ; 3
LFAED:
    jsr    LF580                 ; 6
    rts                          ; 6

LFAF1:
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    bit    $C2                   ; 3
    bmi    LFB1C                 ; 2³+1
    lda    SWCHA                 ; 4
    eor    #$FF                  ; 2
    beq    LFB05                 ; 2³
    sta    $C1                   ; 3
    rts                          ; 6

LFB05:
    lda    $C1                   ; 3
    bne    LFB0F                 ; 2³
    rts                          ; 6

LFB0A:
    lda    #5                    ; 2
    sta    $C2                   ; 3
    rts                          ; 6

LFB0F:
    ldx    #0                    ; 2
    stx    $C1                   ; 3
    ldx    $C2                   ; 3
    cmp    LFB1D,X               ; 4
    bne    LFB0A                 ; 2³
    dec    $C2                   ; 5
LFB1C:
    rts                          ; 6

LFB1D:
    .byte $40 ; | X      | $FB1D
    .byte $20 ; |  X     | $FB1E
    .byte $40 ; | X      | $FB1F
    .byte $10 ; |   X    | $FB20
    .byte $20 ; |  X     | $FB21
    .byte $10 ; |   X    | $FB22

LFB23:
    lda    SWCHB                 ; 4
    and    #$80                  ; 2
    beq    LFAF1                 ; 2³+1
    bit    $B1                   ; 3
    bmi    LFAF1                 ; 2³+1
    lda    #5                    ; 2
    sta    $C2                   ; 3
    lda    $B1                   ; 3
    bne    LFB42                 ; 2³
    lda    $BC                   ; 3
    eor    #$FF                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    ldx    #8                    ; 2
    bne    LFB58                 ; 3   always branch

LFB42:
    lda    $BD                   ; 3   is volume at zero?
    beq    LFB56                 ; 2³  - yes, branch
    lda    $81                   ; 3   - no, load the frame counter
;decrement volume every 2nd frame
    and    #$01                  ; 2   check if the frame is odd/even,
    bne    .skipVolumeDecrease   ; 2³  and branch if the frame is even
    dec    $BD                   ; 5   volume is decremented on odd frames until it's at zero
.skipVolumeDecrease:
    lda    $BD                   ; 3   load volume for AUDV0 (volume channel 0)
    ldy    #$11                  ; 2   1.76KHz frequency for AUDF0 (frequency channel 0)
    ldx    #8                    ; 2   9 bit poly (white noise) for AUDC0 (tone channel 0)
    bne    LFB58                 ; 3   always branch

LFB56:
    lda    #0                    ; 2
LFB58:
    sta    AUDV0                 ; 3
    sty    AUDF0                 ; 3
    stx    AUDC0                 ; 3
    bit    $B1                   ; 3
    bvc    LFB73                 ; 2³
    lda    $BE                   ; 3   is $BE at zero?
    beq    LFBB7                 ; 2³  - yes, branch
    dec    $BE                   ; 5   - no, so decrement and load
    lda    $BE                   ; 3
    eor    #$3F                  ; 2   toggle the 6 lowest bits
    tay                          ; 2   stored in AUDF1
    lda    #VOL_01               ; 2   stored in AUDV1
    ldx    #3                    ; 2
    bne    LFBB9                 ; 3   always branch

LFB73:
    lda    $BE                   ; 3   is $BE at zero?
    beq    LFB90                 ; 2³  - yes, branch
;calculate tone
    lda    $81                   ; 3   - no, load the frame counter
    lsr                          ; 2   is the frame odd or even?
    bcc    LFB7E                 ; 2³  - even, branch
    dec    $BE                   ; 5   - odd, decrement $BE
LFB7E:
    and    #$03                  ; 2   keep the lowest 2 bits of the frame counter
    ora    #$08                  ; 2
    tax                          ; 2   X register = 0000 10xx  (lower case x's are bits 1 and 0 from the frame counter)
;calculate frequency
    lda    #$10                  ; 2
    sec                          ; 2
    sbc    $BE                   ; 3
    ora    #$10                  ; 2
    tay                          ; 2   stored in AUDF1
    lda    $BE                   ; 3   stored in AUDV1
    jmp    LFBB9                 ; 3

LFB90:
    lda    $82                   ; 3
    cmp    #$A0                  ; 2
    beq    LFBB7                 ; 2³
    lda    $83                   ; 3
    cmp    #$58                  ; 2
    bne    LFBB7                 ; 2³
    lda    $81                   ; 3
    lsr                          ; 2
    php                          ; 3
    inc    $BF                   ; 5
    bpl    LFBA8                 ; 2³
    lda    #0                    ; 2
    sta    $BF                   ; 3
LFBA8:
    lda    $BF                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    plp                          ; 4
    adc    #$0F                  ; 2
    tay                          ; 2
    lda    #VOL_02               ; 2
    ldx    #4                    ; 2
    bne    LFBB9                 ; 3   always branch

LFBB7:
    lda    #0                    ; 2
LFBB9:
    sta    AUDV1                 ; 3
    sty    AUDF1                 ; 3
    stx    AUDC1                 ; 3
    rts                          ; 6

;this routine performs a checksum, so that
;no one can hack the game with a hex editor
LFBC0:
    lda    #$30                  ; 2
    sta    $E3                   ; 3
LFBC4:
    ldy    #0                    ; 2
    lda    ($E2),Y               ; 5
    clc                          ; 2
    adc    $E0                   ; 3
    sta    $E0                   ; 3
    inc    $E2                   ; 5
    bne    LFBC4                 ; 2³
    inc    $E3                   ; 5
    lda    $E3                   ; 3
    cmp    #$40                  ; 2
    bne    LFBC4                 ; 2³
    lda    LFBEB                 ; 4   zero
    cmp    $E0                   ; 3
    bne    LFBE1                 ; 2³  branch if checksum failed
    rts                          ; 6

;crash the game
LFBE1:
    lda    #9                    ; 2
    sta    AUDC0                 ; 3
    sta    AUDF0                 ; 3
    sta    AUDV0                 ; 3
    bne    LFBE1                 ; 3   always branch, endless loop...

LFBEB:
    .byte $00 ; |        | $FBEB
    .byte OFFSET_VALUE   ; $FBEC   seems to be used only for the checksum to correctly balance
    .byte $00 ; |        | $FBED
    .byte $00 ; |        | $FBEE
    .byte $00 ; |        | $FBEF
    .byte $00 ; |        | $FBF0
    .byte $00 ; |        | $FBF1
    .byte $00 ; |        | $FBF2
    .byte $00 ; |        | $FBF3
    .byte $00 ; |        | $FBF4
    .byte $00 ; |        | $FBF5
    .byte $00 ; |        | $FBF6
    .byte $00 ; |        | $FBF7
    .byte $00 ; |        | $FBF8
    .byte $00 ; |        | $FBF9
    .byte $00 ; |        | $FBFA
    .byte $00 ; |        | $FBFB
    .byte $00 ; |        | $FBFC
    .byte $00 ; |        | $FBFD
    .byte $00 ; |        | $FBFE
    .byte $00 ; |        | $FBFF
LFC00:
    .byte $08 ; |    X   | $FC00
    .byte $10 ; |   X    | $FC01
    .byte $18 ; |   XX   | $FC02
    .byte $20 ; |  X     | $FC03
    .byte $28 ; |  X X   | $FC04
    .byte $30 ; |  XX    | $FC05
    .byte $38 ; |  XXX   | $FC06
    .byte $40 ; | X      | $FC07
    .byte $00 ; |        | $FC08
    .byte $18 ; |   XX   | $FC09
    .byte $3C ; |  XXXX  | $FC0A
    .byte $7E ; | XXXXXX | $FC0B
    .byte $C9 ; |XX  X  X| $FC0C
    .byte $C9 ; |XX  X  X| $FC0D
    .byte $FF ; |XXXXXXXX| $FC0E
    .byte $7E ; | XXXXXX | $FC0F
    .byte $00 ; |        | $FC10
    .byte $3C ; |  XXXX  | $FC11
    .byte $52 ; | X X  X | $FC12
    .byte $93 ; |X  X  XX| $FC13
    .byte $FF ; |XXXXXXXX| $FC14
    .byte $18 ; |   XX   | $FC15
    .byte $1F ; |   XXXXX| $FC16
    .byte $F8 ; |XXXXX   | $FC17
    .byte $00 ; |        | $FC18
    .byte $7E ; | XXXXXX | $FC19
    .byte $A9 ; |X X X  X| $FC1A
    .byte $A9 ; |X X X  X| $FC1B
    .byte $7E ; | XXXXXX | $FC1C
    .byte $18 ; |   XX   | $FC1D
    .byte $66 ; | XX  XX | $FC1E
    .byte $66 ; | XX  XX | $FC1F
    .byte $00 ; |        | $FC20
    .byte $4A ; | X  X X | $FC21
    .byte $4A ; | X  X X | $FC22
    .byte $7E ; | XXXXXX | $FC23
    .byte $ED ; |XXX XX X| $FC24
    .byte $91 ; |X  X   X| $FC25
    .byte $6E ; | XX XXX | $FC26
    .byte $3C ; |  XXXX  | $FC27
    .byte $00 ; |        | $FC28
    .byte $99 ; |X  XX  X| $FC29
    .byte $A5 ; |X X  X X| $FC2A
    .byte $EB ; |XXX X XX| $FC2B
    .byte $95 ; |X  X X X| $FC2C
    .byte $7E ; | XXXXXX | $FC2D
    .byte $66 ; | XX  XX | $FC2E
    .byte $18 ; |   XX   | $FC2F
    .byte $00 ; |        | $FC30
    .byte $24 ; |  X  X  | $FC31
    .byte $7E ; | XXXXXX | $FC32
    .byte $DB ; |XX XX XX| $FC33
    .byte $97 ; |X  X XXX| $FC34
    .byte $DB ; |XX XX XX| $FC35
    .byte $7E ; | XXXXXX | $FC36
    .byte $24 ; |  X  X  | $FC37
    .byte $00 ; |        | $FC38
    .byte $7E ; | XXXXXX | $FC39
    .byte $D5 ; |XX X X X| $FC3A
    .byte $D5 ; |XX X X X| $FC3B
    .byte $7E ; | XXXXXX | $FC3C
    .byte $38 ; |  XXX   | $FC3D
    .byte $28 ; |  X X   | $FC3E
    .byte $44 ; | X   X  | $FC3F
    .byte $00 ; |        | $FC40
    .byte $81 ; |X      X| $FC41
    .byte $42 ; | X    X | $FC42
    .byte $3C ; |  XXXX  | $FC43
    .byte $42 ; | X    X | $FC44
    .byte $81 ; |X      X| $FC45
    .byte $FF ; |XXXXXXXX| $FC46
    .byte $3C ; |  XXXX  | $FC47
    .byte $00 ; |        | $FC48
    .byte $84 ; |X    X  | $FC49
    .byte $20 ; |  X     | $FC4A
    .byte $02 ; |      X | $FC4B
    .byte $08 ; |    X   | $FC4C
    .byte $40 ; | X      | $FC4D
    .byte $04 ; |     X  | $FC4E
    .byte $21 ; |  X    X| $FC4F
    .byte $40 ; | X      | $FC50
    .byte $21 ; |  X    X| $FC51
    .byte $08 ; |    X   | $FC52
    .byte $40 ; | X      | $FC53
    .byte $21 ; |  X    X| $FC54
    .byte $44 ; | X   X  | $FC55
    .byte $22 ; |  X   X | $FC56
    .byte $21 ; |  X    X| $FC57
    .byte $08 ; |    X   | $FC58
    .byte $08 ; |    X   | $FC59
    .byte $1C ; |   XXX  | $FC5A
    .byte $1C ; |   XXX  | $FC5B
    .byte $1C ; |   XXX  | $FC5C
    .byte $1C ; |   XXX  | $FC5D
    .byte $1C ; |   XXX  | $FC5E
    .byte $08 ; |    X   | $FC5F
    .byte $08 ; |    X   | $FC60
    .byte $14 ; |   X X  | $FC61
    .byte $14 ; |   X X  | $FC62
    .byte $00 ; |        | $FC63
    .byte $00 ; |        | $FC64
    .byte $00 ; |        | $FC65
    .byte $00 ; |        | $FC66
    .byte $00 ; |        | $FC67
LFC68:
    .byte $BB ; |X XXX XX| $FC68
    .byte $2A ; |  X X X | $FC69
    .byte $3F ; |  XXXXXX| $FC6A
    .byte $4C ; | X  XX  | $FC6B
    .byte $6A ; | XX X X | $FC6C
    .byte $8A ; |X   X X | $FC6D
    .byte $9A ; |X  XX X | $FC6E
    .byte $AA ; |X X X X | $FC6F
    .byte $00 ; |        | $FC70
    .byte $3C ; |  XXXX  | $FC71
    .byte $3F ; |  XXXXXX| $FC72
    .byte $34 ; |  XX X  | $FC73
    .byte $3C ; |  XXXX  | $FC74
    .byte $34 ; |  XX X  | $FC75
    .byte $3C ; |  XXXX  | $FC76
    .byte $38 ; |  XXX   | $FC77
    .byte $70 ; | XXX    | $FC78
    .byte $E0 ; |XXX     | $FC79
    .byte $00 ; |        | $FC7A
    .byte $00 ; |        | $FC7B
    .byte $00 ; |        | $FC7C
    .byte $00 ; |        | $FC7D
    .byte $00 ; |        | $FC7E
    .byte $00 ; |        | $FC7F
    .byte $00 ; |        | $FC80
    .byte $1F ; |   XXXXX| $FC81
    .byte $00 ; |        | $FC82
    .byte $1F ; |   XXXXX| $FC83
    .byte $1E ; |   XXXX | $FC84
    .byte $1C ; |   XXX  | $FC85
    .byte $10 ; |   X    | $FC86
    .byte $78 ; | XXXX   | $FC87
    .byte $40 ; | X      | $FC88
    .byte $40 ; | X      | $FC89
    .byte $00 ; |        | $FC8A
    .byte $00 ; |        | $FC8B
    .byte $00 ; |        | $FC8C
    .byte $00 ; |        | $FC8D
    .byte $00 ; |        | $FC8E
    .byte $00 ; |        | $FC8F
    .byte $00 ; |        | $FC90
    .byte $3F ; |  XXXXXX| $FC91
    .byte $7F ; | XXXXXXX| $FC92
    .byte $FF ; |XXXXXXXX| $FC93
    .byte $7E ; | XXXXXX | $FC94
    .byte $3C ; |  XXXX  | $FC95
    .byte $10 ; |   X    | $FC96
    .byte $78 ; | XXXX   | $FC97
    .byte $40 ; | X      | $FC98
    .byte $40 ; | X      | $FC99
    .byte $00 ; |        | $FC9A
    .byte $00 ; |        | $FC9B
    .byte $00 ; |        | $FC9C
    .byte $00 ; |        | $FC9D
    .byte $00 ; |        | $FC9E
    .byte $00 ; |        | $FC9F
    .byte $00 ; |        | $FCA0
    .byte $00 ; |        | $FCA1
    .byte $00 ; |        | $FCA2
    .byte $00 ; |        | $FCA3
    .byte $00 ; |        | $FCA4
    .byte $00 ; |        | $FCA5
    .byte $00 ; |        | $FCA6
    .byte $00 ; |        | $FCA7
    .byte $00 ; |        | $FCA8
    .byte $00 ; |        | $FCA9
    .byte $00 ; |        | $FCAA
    .byte $00 ; |        | $FCAB
    .byte $00 ; |        | $FCAC
    .byte $00 ; |        | $FCAD
    .byte $00 ; |        | $FCAE
    .byte $00 ; |        | $FCAF
    .byte $10 ; |   X    | $FCB0
    .byte $04 ; |     X  | $FCB1
    .byte $50 ; | X X    | $FCB2
    .byte $3A ; |  XXX X | $FCB3
    .byte $50 ; | X X    | $FCB4
    .byte $14 ; |   X X  | $FCB5
    .byte $28 ; |  X X   | $FCB6
    .byte $00 ; |        | $FCB7
LFCB8:
    .byte $90 ; |X  X    | $FCB8
    .byte $FF ; |XXXXXXXX| $FCB9
    .byte $FF ; |XXXXXXXX| $FCBA
    .byte $00 ; |        | $FCBB
    .byte $FF ; |XXXXXXXX| $FCBC
    .byte $02 ; |      X | $FCBD
    .byte $01 ; |       X| $FCBE
    .byte $00 ; |        | $FCBF
    .byte $84 ; |X    X  | $FCC0
    .byte $FF ; |XXXXXXXX| $FCC1
    .byte $00 ; |        | $FCC2
    .byte $01 ; |       X| $FCC3
    .byte $FF ; |XXXXXXXX| $FCC4
    .byte $FF ; |XXXXXXXX| $FCC5
    .byte $02 ; |      X | $FCC6
    .byte $00 ; |        | $FCC7
    .byte $78 ; | XXXX   | $FCC8
    .byte $00 ; |        | $FCC9
    .byte $01 ; |       X| $FCCA
    .byte $02 ; |      X | $FCCB
    .byte $FF ; |XXXXXXXX| $FCCC
    .byte $FF ; |XXXXXXXX| $FCCD
    .byte $FF ; |XXXXXXXX| $FCCE
    .byte $00 ; |        | $FCCF
    .byte $6C ; | XX XX  | $FCD0
    .byte $00 ; |        | $FCD1
    .byte $01 ; |       X| $FCD2
    .byte $02 ; |      X | $FCD3
    .byte $FF ; |XXXXXXXX| $FCD4
    .byte $FF ; |XXXXXXXX| $FCD5
    .byte $FF ; |XXXXXXXX| $FCD6
    .byte $00 ; |        | $FCD7
    .byte $60 ; | XX     | $FCD8
    .byte $FF ; |XXXXXXXX| $FCD9
    .byte $01 ; |       X| $FCDA
    .byte $02 ; |      X | $FCDB
    .byte $FF ; |XXXXXXXX| $FCDC
    .byte $FF ; |XXXXXXXX| $FCDD
    .byte $00 ; |        | $FCDE
    .byte $00 ; |        | $FCDF
    .byte $6C ; | XX XX  | $FCE0
    .byte $FF ; |XXXXXXXX| $FCE1
    .byte $FF ; |XXXXXXXX| $FCE2
    .byte $02 ; |      X | $FCE3
    .byte $FF ; |XXXXXXXX| $FCE4
    .byte $01 ; |       X| $FCE5
    .byte $00 ; |        | $FCE6
    .byte $00 ; |        | $FCE7
    .byte $78 ; | XXXX   | $FCE8
    .byte $FF ; |XXXXXXXX| $FCE9
    .byte $FF ; |XXXXXXXX| $FCEA
    .byte $FF ; |XXXXXXXX| $FCEB
    .byte $02 ; |      X | $FCEC
    .byte $01 ; |       X| $FCED
    .byte $00 ; |        | $FCEE
    .byte $00 ; |        | $FCEF
    .byte $84 ; |X    X  | $FCF0
    .byte $FF ; |XXXXXXXX| $FCF1
    .byte $FF ; |XXXXXXXX| $FCF2
    .byte $FF ; |XXXXXXXX| $FCF3
    .byte $02 ; |      X | $FCF4
    .byte $01 ; |       X| $FCF5
    .byte $00 ; |        | $FCF6
    .byte $00 ; |        | $FCF7
    .byte $48 ; | X  X   | $FCF8
    .byte $A0 ; |X X     | $FCF9
LFCFA:
    .byte $0C ; |    XX  | $FCFA
    .byte $0C ; |    XX  | $FCFB
    .byte $06 ; |     XX | $FCFC
    .byte $06 ; |     XX | $FCFD
    .byte $00 ; |        | $FCFE
LFCFF:
    .byte $00 ; |        | $FCFF
    .byte $00 ; |        | $FD00
    .byte $00 ; |        | $FD01
    .byte $F0 ; |XXXX    | $FD02
    .byte $00 ; |        | $FD03
    .byte $30 ; |  XX    | $FD04
    .byte $00 ; |        | $FD05
    .byte $C0 ; |XX      | $FD06
    .byte $00 ; |        | $FD07
    .byte $FF ; |XXXXXXXX| $FD08
    .byte $00 ; |        | $FD09
    .byte $00 ; |        | $FD0A
    .byte $0C ; |    XX  | $FD0B
    .byte $0C ; |    XX  | $FD0C
    .byte $00 ; |        | $FD0D
    .byte $00 ; |        | $FD0E
LFD0F:
    .byte $FF ; |XXXXXXXX| $FD0F
    .byte $FF ; |XXXXXXXX| $FD10
    .byte $FF ; |XXXXXXXX| $FD11
    .byte $FF ; |XXXXXXXX| $FD12
    .byte $03 ; |      XX| $FD13
    .byte $FF ; |XXXXXXXX| $FD14
    .byte $C3 ; |XX    XX| $FD15
    .byte $F0 ; |XXXX    | $FD16
    .byte $FF ; |XXXXXXXX| $FD17
    .byte $FF ; |XXXXXXXX| $FD18
    .byte $FF ; |XXXXXXXX| $FD19
    .byte $C0 ; |XX      | $FD1A
    .byte $FF ; |XXXXXXXX| $FD1B
    .byte $3F ; |  XXXXXX| $FD1C
    .byte $FF ; |XXXXXXXX| $FD1D
    .byte $0F ; |    XXXX| $FD1E
LFD1F:
    .byte $04 ; |     X  | $FD1F
    .byte $09 ; |    X  X| $FD20
    .byte $0E ; |    XXX | $FD21
    .byte $13 ; |   X  XX| $FD22
    .byte $18 ; |   XX   | $FD23
    .byte $1D ; |   XXX X| $FD24
    .byte $22 ; |  X   X | $FD25
    .byte $27 ; |  X  XXX| $FD26
LFD27:
    .byte $08 ; |    X   | $FD27
    .byte $09 ; |    X  X| $FD28
    .byte $04 ; |     X  | $FD29
    .byte $08 ; |    X   | $FD2A
    .byte $08 ; |    X   | $FD2B
    .byte $09 ; |    X  X| $FD2C
    .byte $0A ; |    X X | $FD2D
    .byte $06 ; |     XX | $FD2E
    .byte $09 ; |    X  X| $FD2F
    .byte $09 ; |    X  X| $FD30
    .byte $0A ; |    X X | $FD31
    .byte $0B ; |    X XX| $FD32
    .byte $08 ; |    X   | $FD33
    .byte $0A ; |    X X | $FD34
    .byte $0A ; |    X X | $FD35
    .byte $0B ; |    X XX| $FD36
    .byte $0C ; |    XX  | $FD37
    .byte $08 ; |    X   | $FD38
    .byte $0B ; |    X XX| $FD39
    .byte $0B ; |    X XX| $FD3A
    .byte $0C ; |    XX  | $FD3B
    .byte $0D ; |    XX X| $FD3C
    .byte $08 ; |    X   | $FD3D
    .byte $0C ; |    XX  | $FD3E
    .byte $0C ; |    XX  | $FD3F
    .byte $0D ; |    XX X| $FD40
    .byte $0E ; |    XXX | $FD41
    .byte $09 ; |    X  X| $FD42
    .byte $0D ; |    XX X| $FD43
    .byte $0D ; |    XX X| $FD44
    .byte $0E ; |    XXX | $FD45
    .byte $0E ; |    XXX | $FD46
    .byte $0C ; |    XX  | $FD47
    .byte $0E ; |    XXX | $FD48
    .byte $0E ; |    XXX | $FD49
    .byte $0F ; |    XXXX| $FD4A
    .byte $0F ; |    XXXX| $FD4B
    .byte $0F ; |    XXXX| $FD4C
    .byte $0F ; |    XXXX| $FD4D
    .byte $0F ; |    XXXX| $FD4E
    .byte $00 ; |        | $FD4F
    .byte $00 ; |        | $FD50
    .byte $00 ; |        | $FD51
    .byte $00 ; |        | $FD52
    .byte $00 ; |        | $FD53
    .byte $00 ; |        | $FD54
    .byte $00 ; |        | $FD55
    .byte $00 ; |        | $FD56
    .byte $00 ; |        | $FD57
    .byte $00 ; |        | $FD58
    .byte $00 ; |        | $FD59
    .byte $00 ; |        | $FD5A
    .byte $00 ; |        | $FD5B
    .byte $00 ; |        | $FD5C
    .byte $00 ; |        | $FD5D
    .byte $00 ; |        | $FD5E
    .byte $00 ; |        | $FD5F
    .byte $00 ; |        | $FD60
    .byte $00 ; |        | $FD61
    .byte $00 ; |        | $FD62
    .byte $00 ; |        | $FD63
    .byte $00 ; |        | $FD64
    .byte $00 ; |        | $FD65
    .byte $00 ; |        | $FD66
    .byte $00 ; |        | $FD67
    .byte $00 ; |        | $FD68
    .byte $00 ; |        | $FD69
    .byte $00 ; |        | $FD6A
    .byte $00 ; |        | $FD6B
    .byte $00 ; |        | $FD6C
    .byte $00 ; |        | $FD6D
    .byte $00 ; |        | $FD6E
    .byte $00 ; |        | $FD6F
    .byte $00 ; |        | $FD70
    .byte $00 ; |        | $FD71
    .byte $00 ; |        | $FD72
    .byte $00 ; |        | $FD73
    .byte $00 ; |        | $FD74
    .byte $00 ; |        | $FD75
    .byte $00 ; |        | $FD76
    .byte $00 ; |        | $FD77
    .byte $00 ; |        | $FD78
    .byte $00 ; |        | $FD79
    .byte $00 ; |        | $FD7A
    .byte $00 ; |        | $FD7B
    .byte $00 ; |        | $FD7C
    .byte $00 ; |        | $FD7D
    .byte $00 ; |        | $FD7E
    .byte $00 ; |        | $FD7F
    .byte $00 ; |        | $FD80
    .byte $00 ; |        | $FD81
    .byte $00 ; |        | $FD82
    .byte $00 ; |        | $FD83
    .byte $00 ; |        | $FD84
    .byte $00 ; |        | $FD85
    .byte $00 ; |        | $FD86
    .byte $00 ; |        | $FD87
    .byte $00 ; |        | $FD88
    .byte $00 ; |        | $FD89
    .byte $00 ; |        | $FD8A
    .byte $00 ; |        | $FD8B
    .byte $00 ; |        | $FD8C
    .byte $00 ; |        | $FD8D
    .byte $00 ; |        | $FD8E
    .byte $00 ; |        | $FD8F
    .byte $00 ; |        | $FD90
    .byte $00 ; |        | $FD91
    .byte $00 ; |        | $FD92
    .byte $00 ; |        | $FD93
    .byte $00 ; |        | $FD94
    .byte $00 ; |        | $FD95
    .byte $00 ; |        | $FD96
    .byte $00 ; |        | $FD97
    .byte $00 ; |        | $FD98
    .byte $00 ; |        | $FD99
    .byte $00 ; |        | $FD9A
    .byte $00 ; |        | $FD9B
    .byte $00 ; |        | $FD9C
    .byte $00 ; |        | $FD9D
    .byte $00 ; |        | $FD9E
    .byte $00 ; |        | $FD9F
    .byte $00 ; |        | $FDA0
    .byte $00 ; |        | $FDA1
    .byte $00 ; |        | $FDA2
    .byte $00 ; |        | $FDA3
    .byte $00 ; |        | $FDA4
    .byte $00 ; |        | $FDA5
    .byte $00 ; |        | $FDA6
    .byte $00 ; |        | $FDA7
    .byte $00 ; |        | $FDA8
    .byte $00 ; |        | $FDA9
    .byte $00 ; |        | $FDAA
    .byte $00 ; |        | $FDAB
    .byte $00 ; |        | $FDAC
    .byte $00 ; |        | $FDAD
    .byte $00 ; |        | $FDAE
    .byte $00 ; |        | $FDAF
    .byte $00 ; |        | $FDB0
    .byte $00 ; |        | $FDB1
    .byte $00 ; |        | $FDB2
    .byte $00 ; |        | $FDB3
    .byte $00 ; |        | $FDB4
    .byte $00 ; |        | $FDB5
    .byte $00 ; |        | $FDB6
    .byte $00 ; |        | $FDB7
    .byte $00 ; |        | $FDB8
    .byte $00 ; |        | $FDB9
    .byte $00 ; |        | $FDBA
    .byte $00 ; |        | $FDBB
    .byte $00 ; |        | $FDBC
    .byte $00 ; |        | $FDBD
    .byte $00 ; |        | $FDBE
    .byte $00 ; |        | $FDBF
    .byte $00 ; |        | $FDC0
    .byte $00 ; |        | $FDC1
    .byte $00 ; |        | $FDC2
    .byte $00 ; |        | $FDC3
    .byte $00 ; |        | $FDC4
    .byte $00 ; |        | $FDC5
    .byte $00 ; |        | $FDC6
    .byte $00 ; |        | $FDC7
    .byte $00 ; |        | $FDC8
    .byte $00 ; |        | $FDC9
    .byte $00 ; |        | $FDCA
    .byte $00 ; |        | $FDCB
    .byte $00 ; |        | $FDCC
    .byte $00 ; |        | $FDCD
    .byte $00 ; |        | $FDCE
    .byte $00 ; |        | $FDCF
    .byte $00 ; |        | $FDD0
    .byte $00 ; |        | $FDD1
    .byte $00 ; |        | $FDD2
    .byte $00 ; |        | $FDD3
    .byte $00 ; |        | $FDD4
    .byte $00 ; |        | $FDD5
    .byte $00 ; |        | $FDD6
    .byte $00 ; |        | $FDD7
    .byte $00 ; |        | $FDD8
    .byte $00 ; |        | $FDD9
    .byte $00 ; |        | $FDDA
    .byte $00 ; |        | $FDDB
    .byte $00 ; |        | $FDDC
    .byte $00 ; |        | $FDDD
    .byte $00 ; |        | $FDDE
    .byte $00 ; |        | $FDDF
    .byte $00 ; |        | $FDE0
    .byte $00 ; |        | $FDE1
    .byte $00 ; |        | $FDE2
    .byte $00 ; |        | $FDE3
    .byte $00 ; |        | $FDE4
    .byte $00 ; |        | $FDE5
    .byte $00 ; |        | $FDE6
    .byte $00 ; |        | $FDE7
    .byte $00 ; |        | $FDE8
    .byte $00 ; |        | $FDE9
    .byte $00 ; |        | $FDEA
    .byte $00 ; |        | $FDEB
    .byte $00 ; |        | $FDEC
    .byte $00 ; |        | $FDED
    .byte $00 ; |        | $FDEE
    .byte $00 ; |        | $FDEF
    .byte $00 ; |        | $FDF0
    .byte $00 ; |        | $FDF1
    .byte $00 ; |        | $FDF2
    .byte $00 ; |        | $FDF3
    .byte $00 ; |        | $FDF4
    .byte $00 ; |        | $FDF5
    .byte $00 ; |        | $FDF6
    .byte $00 ; |        | $FDF7
    .byte $00 ; |        | $FDF8
    .byte $00 ; |        | $FDF9
    .byte $00 ; |        | $FDFA
    .byte $00 ; |        | $FDFB
    .byte $00 ; |        | $FDFC
    .byte $00 ; |        | $FDFD
    .byte $00 ; |        | $FDFE
    .byte $00 ; |        | $FDFF
    .byte $00 ; |        | $FE00
    .byte $00 ; |        | $FE01
    .byte $00 ; |        | $FE02
    .byte $00 ; |        | $FE03
    .byte $00 ; |        | $FE04
    .byte $00 ; |        | $FE05
    .byte $00 ; |        | $FE06
    .byte $00 ; |        | $FE07
    .byte $00 ; |        | $FE08
    .byte $00 ; |        | $FE09
    .byte $00 ; |        | $FE0A
    .byte $00 ; |        | $FE0B
    .byte $00 ; |        | $FE0C
    .byte $00 ; |        | $FE0D
    .byte $00 ; |        | $FE0E
    .byte $00 ; |        | $FE0F
    .byte $00 ; |        | $FE10
    .byte $00 ; |        | $FE11
    .byte $00 ; |        | $FE12
    .byte $00 ; |        | $FE13
    .byte $00 ; |        | $FE14
    .byte $00 ; |        | $FE15
    .byte $00 ; |        | $FE16
    .byte $00 ; |        | $FE17
    .byte $00 ; |        | $FE18
    .byte $00 ; |        | $FE19
    .byte $00 ; |        | $FE1A
    .byte $00 ; |        | $FE1B
    .byte $00 ; |        | $FE1C
    .byte $00 ; |        | $FE1D
    .byte $00 ; |        | $FE1E
    .byte $00 ; |        | $FE1F
    .byte $00 ; |        | $FE20
    .byte $00 ; |        | $FE21
    .byte $00 ; |        | $FE22
    .byte $00 ; |        | $FE23
    .byte $00 ; |        | $FE24
    .byte $00 ; |        | $FE25
    .byte $00 ; |        | $FE26
    .byte $00 ; |        | $FE27
    .byte $00 ; |        | $FE28
    .byte $00 ; |        | $FE29
    .byte $00 ; |        | $FE2A
    .byte $00 ; |        | $FE2B
    .byte $00 ; |        | $FE2C
    .byte $00 ; |        | $FE2D
    .byte $00 ; |        | $FE2E
    .byte $00 ; |        | $FE2F
    .byte $00 ; |        | $FE30
    .byte $00 ; |        | $FE31
    .byte $00 ; |        | $FE32
    .byte $00 ; |        | $FE33
    .byte $00 ; |        | $FE34
    .byte $00 ; |        | $FE35
    .byte $00 ; |        | $FE36
    .byte $00 ; |        | $FE37
    .byte $00 ; |        | $FE38
    .byte $00 ; |        | $FE39
    .byte $00 ; |        | $FE3A
    .byte $00 ; |        | $FE3B
    .byte $00 ; |        | $FE3C
    .byte $00 ; |        | $FE3D
    .byte $00 ; |        | $FE3E
    .byte $00 ; |        | $FE3F
    .byte $00 ; |        | $FE40
    .byte $00 ; |        | $FE41
    .byte $00 ; |        | $FE42
    .byte $00 ; |        | $FE43
    .byte $00 ; |        | $FE44
    .byte $00 ; |        | $FE45
    .byte $00 ; |        | $FE46
    .byte $00 ; |        | $FE47
    .byte $00 ; |        | $FE48
    .byte $00 ; |        | $FE49
    .byte $00 ; |        | $FE4A
    .byte $00 ; |        | $FE4B
    .byte $00 ; |        | $FE4C
    .byte $00 ; |        | $FE4D
    .byte $00 ; |        | $FE4E
    .byte $00 ; |        | $FE4F
    .byte $00 ; |        | $FE50
    .byte $00 ; |        | $FE51
    .byte $00 ; |        | $FE52
    .byte $00 ; |        | $FE53
    .byte $00 ; |        | $FE54
    .byte $00 ; |        | $FE55
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
    .byte $00 ; |        | $FE70
    .byte $00 ; |        | $FE71
    .byte $00 ; |        | $FE72
    .byte $00 ; |        | $FE73
    .byte $00 ; |        | $FE74
    .byte $00 ; |        | $FE75
    .byte $00 ; |        | $FE76
    .byte $00 ; |        | $FE77
    .byte $00 ; |        | $FE78
    .byte $00 ; |        | $FE79
    .byte $00 ; |        | $FE7A
    .byte $00 ; |        | $FE7B
    .byte $00 ; |        | $FE7C
    .byte $00 ; |        | $FE7D
    .byte $00 ; |        | $FE7E
    .byte $00 ; |        | $FE7F
    .byte $00 ; |        | $FE80
    .byte $00 ; |        | $FE81
    .byte $00 ; |        | $FE82
    .byte $00 ; |        | $FE83
    .byte $00 ; |        | $FE84
    .byte $00 ; |        | $FE85
    .byte $00 ; |        | $FE86
    .byte $00 ; |        | $FE87
    .byte $00 ; |        | $FE88
    .byte $00 ; |        | $FE89
    .byte $00 ; |        | $FE8A
    .byte $00 ; |        | $FE8B
    .byte $00 ; |        | $FE8C
    .byte $00 ; |        | $FE8D
    .byte $00 ; |        | $FE8E
    .byte $00 ; |        | $FE8F
    .byte $00 ; |        | $FE90
    .byte $00 ; |        | $FE91
    .byte $00 ; |        | $FE92
    .byte $00 ; |        | $FE93
    .byte $00 ; |        | $FE94
    .byte $00 ; |        | $FE95
    .byte $00 ; |        | $FE96
    .byte $00 ; |        | $FE97
    .byte $00 ; |        | $FE98
    .byte $00 ; |        | $FE99
    .byte $00 ; |        | $FE9A
    .byte $00 ; |        | $FE9B
    .byte $00 ; |        | $FE9C
    .byte $00 ; |        | $FE9D
    .byte $00 ; |        | $FE9E
    .byte $00 ; |        | $FE9F
    .byte $00 ; |        | $FEA0
    .byte $00 ; |        | $FEA1
    .byte $00 ; |        | $FEA2
    .byte $00 ; |        | $FEA3
    .byte $00 ; |        | $FEA4
    .byte $00 ; |        | $FEA5
    .byte $00 ; |        | $FEA6
    .byte $00 ; |        | $FEA7
    .byte $00 ; |        | $FEA8
    .byte $00 ; |        | $FEA9
    .byte $00 ; |        | $FEAA
    .byte $00 ; |        | $FEAB
    .byte $00 ; |        | $FEAC
    .byte $00 ; |        | $FEAD
    .byte $00 ; |        | $FEAE
    .byte $00 ; |        | $FEAF
    .byte $00 ; |        | $FEB0
    .byte $00 ; |        | $FEB1
    .byte $00 ; |        | $FEB2
    .byte $00 ; |        | $FEB3
    .byte $00 ; |        | $FEB4
    .byte $00 ; |        | $FEB5
    .byte $00 ; |        | $FEB6
    .byte $00 ; |        | $FEB7
    .byte $00 ; |        | $FEB8
    .byte $00 ; |        | $FEB9
    .byte $00 ; |        | $FEBA
    .byte $00 ; |        | $FEBB
    .byte $00 ; |        | $FEBC
    .byte $00 ; |        | $FEBD
    .byte $00 ; |        | $FEBE
    .byte $00 ; |        | $FEBF
    .byte $00 ; |        | $FEC0
    .byte $00 ; |        | $FEC1
    .byte $00 ; |        | $FEC2
    .byte $00 ; |        | $FEC3
    .byte $00 ; |        | $FEC4
    .byte $00 ; |        | $FEC5
    .byte $00 ; |        | $FEC6
    .byte $00 ; |        | $FEC7
    .byte $00 ; |        | $FEC8
    .byte $00 ; |        | $FEC9
    .byte $00 ; |        | $FECA
    .byte $00 ; |        | $FECB
    .byte $00 ; |        | $FECC
    .byte $00 ; |        | $FECD
    .byte $00 ; |        | $FECE
    .byte $00 ; |        | $FECF
    .byte $00 ; |        | $FED0
    .byte $00 ; |        | $FED1
    .byte $00 ; |        | $FED2
    .byte $00 ; |        | $FED3
    .byte $00 ; |        | $FED4
    .byte $00 ; |        | $FED5
    .byte $00 ; |        | $FED6
    .byte $00 ; |        | $FED7
    .byte $00 ; |        | $FED8
    .byte $00 ; |        | $FED9
    .byte $00 ; |        | $FEDA
    .byte $00 ; |        | $FEDB
    .byte $00 ; |        | $FEDC
    .byte $00 ; |        | $FEDD
    .byte $00 ; |        | $FEDE
    .byte $00 ; |        | $FEDF
    .byte $00 ; |        | $FEE0
    .byte $00 ; |        | $FEE1
    .byte $00 ; |        | $FEE2
    .byte $00 ; |        | $FEE3
    .byte $00 ; |        | $FEE4
    .byte $00 ; |        | $FEE5
    .byte $00 ; |        | $FEE6
    .byte $00 ; |        | $FEE7
    .byte $00 ; |        | $FEE8
    .byte $00 ; |        | $FEE9
    .byte $00 ; |        | $FEEA
    .byte $00 ; |        | $FEEB
    .byte $00 ; |        | $FEEC
    .byte $00 ; |        | $FEED
    .byte $00 ; |        | $FEEE
    .byte $00 ; |        | $FEEF
    .byte $00 ; |        | $FEF0
    .byte $00 ; |        | $FEF1
    .byte $00 ; |        | $FEF2
    .byte $00 ; |        | $FEF3
    .byte $00 ; |        | $FEF4
    .byte $00 ; |        | $FEF5
    .byte $00 ; |        | $FEF6
    .byte $00 ; |        | $FEF7
    .byte $00 ; |        | $FEF8
    .byte $00 ; |        | $FEF9
    .byte $00 ; |        | $FEFA
    .byte $00 ; |        | $FEFB
    .byte $00 ; |        | $FEFC
    .byte $00 ; |        | $FEFD
    .byte $00 ; |        | $FEFE
    .byte $00 ; |        | $FEFF
    .byte $78 ; | XXXX   | $FF00
    .byte $84 ; |X    X  | $FF01
    .byte $B4 ; |X XX X  | $FF02
    .byte $A4 ; |X X  X  | $FF03
    .byte $B4 ; |X XX X  | $FF04
    .byte $84 ; |X    X  | $FF05
    .byte $78 ; | XXXX   | $FF06
    .byte $00 ; |        | $FF07
    .byte $22 ; |  X   X | $FF08
    .byte $22 ; |  X   X | $FF09
    .byte $52 ; | X X  X | $FF0A
    .byte $52 ; | X X  X | $FF0B
    .byte $52 ; | X X  X | $FF0C
    .byte $88 ; |X   X   | $FF0D
    .byte $8A ; |X   X X | $FF0E
    .byte $00 ; |        | $FF0F
    .byte $6E ; | XX XXX | $FF10
    .byte $A8 ; |X X X   | $FF11
    .byte $AE ; |X X XXX | $FF12
    .byte $AA ; |X X X X | $FF13
    .byte $6E ; | XX XXX | $FF14
    .byte $20 ; |  X     | $FF15
    .byte $20 ; |  X     | $FF16
    .byte $00 ; |        | $FF17
    .byte $43 ; | X    XX| $FF18
    .byte $A4 ; |X X  X  | $FF19
    .byte $A4 ; |X X  X  | $FF1A
    .byte $A5 ; |X X  X X| $FF1B
    .byte $44 ; | X   X  | $FF1C
    .byte $04 ; |     X  | $FF1D
    .byte $03 ; |      XX| $FF1E
    .byte $00 ; |        | $FF1F
    .byte $3A ; |  XXX X | $FF20
    .byte $A2 ; |X X   X | $FF21
    .byte $BA ; |X XXX X | $FF22
    .byte $AA ; |X X X X | $FF23
    .byte $3B ; |  XXX XX| $FF24
    .byte $80 ; |X       | $FF25
    .byte $00 ; |        | $FF26
    .byte $00 ; |        | $FF27
    .byte $AE ; |X X XXX | $FF28
    .byte $A2 ; |X X   X | $FF29
    .byte $AE ; |X X XXX | $FF2A
    .byte $A8 ; |X X X   | $FF2B
    .byte $EE ; |XXX XXX | $FF2C
    .byte $00 ; |        | $FF2D
    .byte $00 ; |        | $FF2E
    .byte $00 ; |        | $FF2F
    .byte $8A ; |X   X X | $FF30
    .byte $88 ; |X   X   | $FF31
    .byte $88 ; |X   X   | $FF32
    .byte $F8 ; |XXXXX   | $FF33
    .byte $88 ; |X   X   | $FF34
    .byte $88 ; |X   X   | $FF35
    .byte $88 ; |X   X   | $FF36
    .byte $00 ; |        | $FF37
    .byte $84 ; |X    X  | $FF38
    .byte $80 ; |X       | $FF39
    .byte $80 ; |X       | $FF3A
    .byte $F1 ; |XXXX   X| $FF3B
    .byte $80 ; |X       | $FF3C
    .byte $80 ; |X       | $FF3D
    .byte $F8 ; |XXXXX   | $FF3E
    .byte $00 ; |        | $FF3F
    .byte $10 ; |   X    | $FF40
    .byte $10 ; |   X    | $FF41
    .byte $10 ; |   X    | $FF42
    .byte $9E ; |X  XXXX | $FF43
    .byte $11 ; |   X   X| $FF44
    .byte $11 ; |   X   X| $FF45
    .byte $1E ; |   XXXX | $FF46
    .byte $00 ; |        | $FF47
    .byte $94 ; |X  X X  | $FF48
    .byte $2A ; |  X X X | $FF49
    .byte $2A ; |  X X X | $FF4A
    .byte $22 ; |  X   X | $FF4B
    .byte $22 ; |  X   X | $FF4C
    .byte $22 ; |  X   X | $FF4D
    .byte $22 ; |  X   X | $FF4E
    .byte $00 ; |        | $FF4F
    .byte $9E ; |X  XXXX | $FF50
    .byte $21 ; |  X    X| $FF51
    .byte $2D ; |  X XX X| $FF52
    .byte $29 ; |  X X  X| $FF53
    .byte $2D ; |  X XX X| $FF54
    .byte $21 ; |  X    X| $FF55
    .byte $1E ; |   XXXX | $FF56
    .byte $00 ; |        | $FF57
    .byte $22 ; |  X   X | $FF58
    .byte $55 ; | X X X X| $FF59
    .byte $51 ; | X X   X| $FF5A
    .byte $21 ; |  X    X| $FF5B
    .byte $52 ; | X X  X | $FF5C
    .byte $51 ; | X X   X| $FF5D
    .byte $27 ; |  X  XXX| $FF5E
    .byte $00 ; |        | $FF5F
    .byte $00 ; |        | $FF60
    .byte $00 ; |        | $FF61
    .byte $00 ; |        | $FF62
    .byte $00 ; |        | $FF63
    .byte $00 ; |        | $FF64
    .byte $00 ; |        | $FF65
    .byte $00 ; |        | $FF66
    .byte $00 ; |        | $FF67
    .byte $3C ; |  XXXX  | $FF68
    .byte $66 ; | XX  XX | $FF69
    .byte $66 ; | XX  XX | $FF6A
    .byte $66 ; | XX  XX | $FF6B
    .byte $66 ; | XX  XX | $FF6C
    .byte $66 ; | XX  XX | $FF6D
    .byte $3C ; |  XXXX  | $FF6E
    .byte $00 ; |        | $FF6F
    .byte $7E ; | XXXXXX | $FF70
    .byte $18 ; |   XX   | $FF71
    .byte $18 ; |   XX   | $FF72
    .byte $18 ; |   XX   | $FF73
    .byte $18 ; |   XX   | $FF74
    .byte $18 ; |   XX   | $FF75
    .byte $78 ; | XXXX   | $FF76
    .byte $38 ; |  XXX   | $FF77
    .byte $7E ; | XXXXXX | $FF78
    .byte $60 ; | XX     | $FF79
    .byte $60 ; | XX     | $FF7A
    .byte $3C ; |  XXXX  | $FF7B
    .byte $06 ; |     XX | $FF7C
    .byte $46 ; | X   XX | $FF7D
    .byte $7C ; | XXXXX  | $FF7E
    .byte $00 ; |        | $FF7F
    .byte $3C ; |  XXXX  | $FF80
    .byte $46 ; | X   XX | $FF81
    .byte $06 ; |     XX | $FF82
    .byte $0C ; |    XX  | $FF83
    .byte $06 ; |     XX | $FF84
    .byte $46 ; | X   XX | $FF85
    .byte $3C ; |  XXXX  | $FF86
    .byte $00 ; |        | $FF87
    .byte $0C ; |    XX  | $FF88
    .byte $0C ; |    XX  | $FF89
    .byte $7E ; | XXXXXX | $FF8A
    .byte $4C ; | X  XX  | $FF8B
    .byte $2C ; |  X XX  | $FF8C
    .byte $1C ; |   XXX  | $FF8D
    .byte $0C ; |    XX  | $FF8E
    .byte $00 ; |        | $FF8F
    .byte $7C ; | XXXXX  | $FF90
    .byte $46 ; | X   XX | $FF91
    .byte $06 ; |     XX | $FF92
    .byte $7C ; | XXXXX  | $FF93
    .byte $60 ; | XX     | $FF94
    .byte $60 ; | XX     | $FF95
    .byte $7E ; | XXXXXX | $FF96
    .byte $00 ; |        | $FF97
    .byte $3C ; |  XXXX  | $FF98
    .byte $66 ; | XX  XX | $FF99
    .byte $66 ; | XX  XX | $FF9A
    .byte $7C ; | XXXXX  | $FF9B
    .byte $60 ; | XX     | $FF9C
    .byte $62 ; | XX   X | $FF9D
    .byte $3C ; |  XXXX  | $FF9E
    .byte $00 ; |        | $FF9F
    .byte $18 ; |   XX   | $FFA0
    .byte $18 ; |   XX   | $FFA1
    .byte $08 ; |    X   | $FFA2
    .byte $04 ; |     X  | $FFA3
    .byte $02 ; |      X | $FFA4
    .byte $62 ; | XX   X | $FFA5
    .byte $7E ; | XXXXXX | $FFA6
    .byte $00 ; |        | $FFA7
    .byte $3C ; |  XXXX  | $FFA8
    .byte $66 ; | XX  XX | $FFA9
    .byte $66 ; | XX  XX | $FFAA
    .byte $3C ; |  XXXX  | $FFAB
    .byte $66 ; | XX  XX | $FFAC
    .byte $66 ; | XX  XX | $FFAD
    .byte $3C ; |  XXXX  | $FFAE
    .byte $00 ; |        | $FFAF
    .byte $3C ; |  XXXX  | $FFB0
    .byte $46 ; | X   XX | $FFB1
    .byte $06 ; |     XX | $FFB2
    .byte $3E ; |  XXXXX | $FFB3
    .byte $66 ; | XX  XX | $FFB4
    .byte $66 ; | XX  XX | $FFB5
    .byte $3C ; |  XXXX  | $FFB6
    .byte $00 ; |        | $FFB7
    .byte $01 ; |       X| $FFB8
    .byte $01 ; |       X| $FFB9
    .byte $01 ; |       X| $FFBA
    .byte $01 ; |       X| $FFBB
    .byte $01 ; |       X| $FFBC
    .byte $01 ; |       X| $FFBD
    .byte $01 ; |       X| $FFBE
    .byte $00 ; |        | $FFBF
    .byte $26 ; |  X  XX | $FFC0
    .byte $29 ; |  X X  X| $FFC1
    .byte $21 ; |  X    X| $FFC2
    .byte $E6 ; |XXX  XX | $FFC3
    .byte $28 ; |  X X   | $FFC4
    .byte $29 ; |  X X  X| $FFC5
    .byte $26 ; |  X  XX | $FFC6
    .byte $00 ; |        | $FFC7
LFFC8:
    .byte $68 ; | XX X   | $FFC8
    .byte $70 ; | XXX    | $FFC9
    .byte $78 ; | XXXX   | $FFCA
    .byte $80 ; |X       | $FFCB
    .byte $88 ; |X   X   | $FFCC
    .byte $90 ; |X  X    | $FFCD
    .byte $98 ; |X  XX   | $FFCE
    .byte $A0 ; |X X     | $FFCF
    .byte $A8 ; |X X X   | $FFD0
    .byte $B0 ; |X XX    | $FFD1
    .byte $60 ; | XX     | $FFD2
    .byte $00 ; |        | $FFD3
    .byte $00 ; |        | $FFD4
    .byte $00 ; |        | $FFD5
    .byte $00 ; |        | $FFD6
    .byte $00 ; |        | $FFD7
    .byte $00 ; |        | $FFD8
    .byte $00 ; |        | $FFD9
    .byte $00 ; |        | $FFDA
    .byte $00 ; |        | $FFDB
    .byte $00 ; |        | $FFDC
    .byte $00 ; |        | $FFDD
    .byte $00 ; |        | $FFDE
    .byte $00 ; |        | $FFDF
    .byte $00 ; |        | $FFE0
    .byte $00 ; |        | $FFE1
    .byte $00 ; |        | $FFE2
    .byte $00 ; |        | $FFE3
    .byte $00 ; |        | $FFE4
    .byte $00 ; |        | $FFE5
    .byte $00 ; |        | $FFE6
    .byte $00 ; |        | $FFE7
    .byte $00 ; |        | $FFE8
    .byte $00 ; |        | $FFE9
    .byte $00 ; |        | $FFEA
    .byte $00 ; |        | $FFEB
    .byte $00 ; |        | $FFEC
    .byte $00 ; |        | $FFED
    .byte $00 ; |        | $FFEE
    .byte $00 ; |        | $FFEF
    .byte $00 ; |        | $FFF0
    .byte $00 ; |        | $FFF1
    .byte $00 ; |        | $FFF2
    .byte $00 ; |        | $FFF3
    .byte $00 ; |        | $FFF4
    .byte $00 ; |        | $FFF5
    .byte $00 ; |        | $FFF6
    .byte $00 ; |        | $FFF7
    .byte $00 ; |        | $FFF8
    .byte $00 ; |        | $FFF9
    .byte $00 ; |        | $FFFA
    .byte $00 ; |        | $FFFB

       ORG $FFFC

    .word START,START