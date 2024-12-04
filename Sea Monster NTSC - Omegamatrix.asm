; Disassembly of smntsc.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasfcSMntsc.cfg smntsc.bin
;
; SMntsc.cfg contents:
;
;      ORG F000
;      CODE F000 F956
;      DATA F957 F9FF
;      GFX FA00 FBD4
;      DATA FBD5 FFFB
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

; Read TIA Baseline = $00
CXM0P   =  $00
CXM1P   =  $01
CXP0FB  =  $02
INPT4   =  $0C
INPT5   =  $0D

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

       ORG $F000

START:
    cld                          ; 2
    ldx    #0                    ; 2
    lda    #0                    ; 2
LF005:
    sta    0,X                   ; 4
    txs                          ; 2
    inx                          ; 2
    bne    LF005                 ; 2³

    lda    #$10                  ; 2
    sta    $96                   ; 3
LF00F:
    lda    #$50                  ; 2
    sta    $83                   ; 3
    lda    #$98                  ; 2
    sta    $84                   ; 3
    sta    $85                   ; 3
    sta    $86                   ; 3
    lda    #0                    ; 2
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    ENABL                 ; 3
    ldx    #5                    ; 2
LF025:
    sta    AUDC0,X               ; 4
    dex                          ; 2
    bpl    LF025                 ; 2³
    ldx    #2                    ; 2
LF02C:
    sta    $B8,X                 ; 4
    sta    $E5,X                 ; 4
    sta    $E8,X                 ; 4
    dex                          ; 2
    bpl    LF02C                 ; 2³
    lda    #$FF                  ; 2
    sta    $BE                   ; 3
    lda    #$2D                  ; 2
    sta    $BF                   ; 3
    lda    #$CA                  ; 2
    sta    $C0                   ; 3
    lda    #$3B                  ; 2
    sta    $C1                   ; 3
    lda    #$90                  ; 2
    sta    $8F                   ; 3
    lda    #$80                  ; 2
    sta    $90                   ; 3
    lda    #$70                  ; 2
    sta    $8E                   ; 3
    lda    #$B0                  ; 2
    sta    $C4                   ; 3
    sta    $C5                   ; 3
    lda    #2                    ; 2
    sta    $D9                   ; 3
    sta    $DA                   ; 3
    ldy    $E0                   ; 3
    iny                          ; 2
    iny                          ; 2
    sty    $DB                   ; 3
    lda    #3                    ; 2
    sta    $DC                   ; 3
    lda    #5                    ; 2
    sta    $DD                   ; 3
    lda    #7                    ; 2
    sta    $DE                   ; 3
    lda    #0                    ; 2
    sta    $E4                   ; 3
    sta    $EC                   ; 3
    ldx    #5                    ; 2
    lda    #0                    ; 2
LF079:
    sta    AUDC0,X               ; 4
    dex                          ; 2
    bpl    LF079                 ; 2³
    lda    #$F0                  ; 2
    sta    $9C                   ; 3
LF082:
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$0E                  ; 2
    and    $BE                   ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #0                    ; 2
    sta    HMP0                  ; 3
    lda    #$18                  ; 2
    sta    HMP1                  ; 3
    ldy    #5                    ; 2
    lda    #$10                  ; 2
    sta    WSYNC                 ; 3
LF09E:
    dey                          ; 2
    bpl    LF09E                 ; 2³
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
LF0A5:
    lda    INTIM                 ; 4
    bne    LF0A5                 ; 2³
    sta    WSYNC                 ; 3
    sta    VBLANK                ; 3
    sta    CXCLR                 ; 3
    sta    HMCLR                 ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    ldx    #2                    ; 2
LF0B8:
    sta    WSYNC                 ; 3
    dex                          ; 2
    bpl    LF0B8                 ; 2³
    lda    #7                    ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    lda    #7                    ; 2
    sta    $80                   ; 3
LF0C7:
    ldy    $80                   ; 3
    lda    ($AE),Y               ; 5
    sta    $81                   ; 3
    lda    ($AC),Y               ; 5
    tax                          ; 2
    sta    WSYNC                 ; 3
    nop                          ; 2
    lda    ($A4),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($A6),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($A8),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($AA),Y               ; 5
    ldy    $81                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    $80                   ; 5
    bpl    LF0C7                 ; 2³
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    ENABL                 ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    lda    #0                    ; 2
    sta    NUSIZ1                ; 3
    ldy    #1                    ; 2
    lda    $98                   ; 3
    bne    LF10D                 ; 2³
    ldy    #5                    ; 2
LF10D:
    sty    NUSIZ0                ; 3
    lda    #$5C                  ; 2
    and    $BE                   ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$70                  ; 2
    ldx    #0                    ; 2
    jsr    LF812                 ; 6
    lda    #$20                  ; 2
    ldx    #1                    ; 2
    jsr    LF812                 ; 6
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
    sta    HMCLR                 ; 3
    ldy    #7                    ; 2
LF12F:
    sta    WSYNC                 ; 3
    lda    ($B6),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($96),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($96),Y               ; 5
    lda    ($96),Y               ; 5
    lda    ($96),Y               ; 5
    lda    ($96),Y               ; 5
    lda    ($96),Y               ; 5
    lda    ($96),Y               ; 5
    lda    $C6                   ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    ($98),Y               ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    bpl    LF12F                 ; 2³
    ldx    #5                    ; 2
LF154:
    nop                          ; 2
    dex                          ; 2
    bpl    LF154                 ; 2³
    iny                          ; 2
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    lda    #5                    ; 2
    sta    NUSIZ0                ; 3
    lda    #0                    ; 2
    sta    NUSIZ1                ; 3
    lda    #$10                  ; 2
    sta    CTRLPF                ; 3
    lda    $83                   ; 3
    ldx    #0                    ; 2
    jsr    LF812                 ; 6
    lda    $88                   ; 3
    clc                          ; 2
    adc    #2                    ; 2
    ldx    #2                    ; 2
    jsr    LF812                 ; 6
    lda    $88                   ; 3
    ldx    #1                    ; 2
    jsr    LF812                 ; 6
    lda    $89                   ; 3
    ldx    #3                    ; 2
    jsr    LF812                 ; 6
    lda    $8A                   ; 3
    ldx    #4                    ; 2
    jsr    LF812                 ; 6
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    ldx    #3                    ; 2
LF199:
    lda    LFB58,X               ; 4
    and.w  $BE                   ; 4
    sta    COLUP0,X              ; 4
    dex                          ; 2
    bpl    LF199                 ; 2³
    ldy    LFB58                 ; 4
    lda    $9A                   ; 3
    cmp    #$E2                  ; 2
    bcc    LF1B0                 ; 2³
    ldy    LFB5A                 ; 4
LF1B0:
    tya                          ; 2
    and    $BE                   ; 3
    sta    COLUP1                ; 3
    ldy    #3                    ; 2
LF1B7:
    sta    HMCLR                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    ($B2),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($9A),Y               ; 5
    sta    GRP1                  ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    dey                          ; 2
    bpl    LF1B7                 ; 2³
    lda    #0                    ; 2
    sta    GRP1                  ; 3
    sta    HMCLR                 ; 3
    ldy    #7                    ; 2
    sty    $82                   ; 3
    clc                          ; 2
    lda    #$87                  ; 2
    adc    $E0                   ; 3
    adc    $D9                   ; 3
    sta    $81                   ; 3
    ldx    #2                    ; 2
LF1E3:
    ldy    #0                    ; 2
    lda    $8B,X                 ; 4
    cmp    $81                   ; 3
    bcs    LF1F1                 ; 2³
    cmp    #$81                  ; 2
    bcc    LF1F1                 ; 2³
    ldy    #2                    ; 2
LF1F1:
    sty    ENAM0,X               ; 4
    dex                          ; 2
    bpl    LF1E3                 ; 2³
LF1F6:
    ldy    $82                   ; 3
    lda    LFB5C,Y               ; 4
    and    $BE                   ; 3
    sta    WSYNC                 ; 3
    sta    COLUBK                ; 3
    lda    ($B4),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($9E),Y               ; 5
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    dec    $82                   ; 5
    bpl    LF1F6                 ; 2³+1
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    ENABL                 ; 3
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda.w  $EF                   ; 4
    ldx    #0                    ; 2
    stx    NUSIZ0                ; 3
    jsr    LF812                 ; 6
    lda    #$3E                  ; 2
    and    $BE                   ; 3
    sta    COLUPF                ; 3
    lda    #$3E                  ; 2
    and    $BE                   ; 3
    sta    COLUP1                ; 3
    lda    #$80                  ; 2
    sta    $BD                   ; 3
    lda    #0                    ; 2
    sta    $BC                   ; 3
LF23F:
    lda    $BC                   ; 3
    tax                          ; 2
    lda    $8E,X                 ; 4
    sta    $B0                   ; 3
    lda    $84,X                 ; 4
    sta    $87                   ; 3
    txa                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$17                  ; 2
    tay                          ; 2
    sty    $82                   ; 3
    lda    #0                    ; 2
    sta    GRP1                  ; 3
    lda.wx $BF,X                 ; 4
    and    $BE                   ; 3
    sta    COLUP1                ; 3
    lda    #0                    ; 2
    sta    NUSIZ0                ; 3
    ldx    #2                    ; 2
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta    HMCLR                 ; 3
LF274:
    lda    $BD                   ; 3
    and    #$FC                  ; 2
    ldy    #2                    ; 2
    cmp    $8B,X                 ; 4
    beq    LF280                 ; 2³
    ldy    #0                    ; 2
LF280:
    sty    ENAM0,X               ; 4
    sta    WSYNC                 ; 3
    dec    $BD                   ; 5
    lda    $BD                   ; 3
    and    #$F8                  ; 2
    cmp    $F0                   ; 3
    bne    LF297                 ; 2³
    lda    $BD                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    ($9C),Y               ; 5
    bne    LF299                 ; 2³
LF297:
    lda    #0                    ; 2
LF299:
    sta    GRP0                  ; 3
    dex                          ; 2
    bpl    LF2A0                 ; 2³
    ldx    #2                    ; 2
LF2A0:
    dec    $82                   ; 5
    bpl    LF274                 ; 2³
    ldx    $BC                   ; 3
    lda.wx $C8,X                 ; 4
    sta    NUSIZ1                ; 3
    lda    $87                   ; 3
    ldx    #1                    ; 2
    jsr    LF812                 ; 6
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    ldy    #7                    ; 2
    sty    $82                   ; 3
    ldx    #2                    ; 2
LF2BC:
    sta    WSYNC                 ; 3
    lda    $BD                   ; 3
    and    #$FC                  ; 2
    ldy    #2                    ; 2
    cmp.wx $8B,X                 ; 4
    beq    LF2CB                 ; 2³
    ldy    #0                    ; 2
LF2CB:
    sty    ENAM0,X               ; 4
    ldy    $82                   ; 3
    lda    ($B0),Y               ; 5
    sta    GRP1                  ; 3
    dec    $BD                   ; 5
    dex                          ; 2
    bpl    LF2DA                 ; 2³
    ldx    #2                    ; 2
LF2DA:
    sta    HMCLR                 ; 3
    dec    $82                   ; 5
    bpl    LF2BC                 ; 2³
    lda    $BC                   ; 3
    cmp    #2                    ; 2
    beq    LF2EB                 ; 2³
    inc    $BC                   ; 5
    jmp    LF23F                 ; 3
LF2EB:
    lda    #0                    ; 2
    ldx    #4                    ; 2
LF2EF:
    sta    GRP0,X                ; 4
    dex                          ; 2
    bpl    LF2EF                 ; 2³
    ldx    #3                    ; 2
LF2F6:
    sta    WSYNC                 ; 3
    dex                          ; 2
    bpl    LF2F6                 ; 2³
    lda    #$F9                  ; 2
    and    $BE                   ; 3
    sta    COLUPF                ; 3
    ldy    #7                    ; 2
LF303:
    sta    WSYNC                 ; 3
    ldx    #2                    ; 2
LF307:
    lda    $91,X                 ; 4
    sta    $94                   ; 3
    lda    ($94),Y               ; 5
    sta    PF0,X                 ; 4
    dex                          ; 2
    bpl    LF307                 ; 2³
    dey                          ; 2
    bpl    LF303                 ; 2³
    sta.w  WSYNC                 ; 4
    lda    #0                    ; 2
    sta    HMP0                  ; 3
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    RESBL                 ; 3
    ldx    #0                    ; 2
    stx    PF0                   ; 3
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    stx    COLUPF                ; 3
    inx                          ; 2
    stx    NUSIZ0                ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    stx    NUSIZ1                ; 3
    lda    #$30                  ; 2
    sta    HMCLR                 ; 3
    sta    HMBL                  ; 3
    lsr                          ; 2
    sta    HMP1                  ; 3
    lda    #$3D                  ; 2
    sta    COLUP1                ; 3
    sta    COLUP0                ; 3
    ldx    #8                    ; 2
LF348:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    LFB64,X               ; 4
    sta    GRP0                  ; 3
    lda    LFB6D,X               ; 4
    sta    GRP1                  ; 3
    nop                          ; 2
    lda    LFB7F,X               ; 4
    tay                          ; 2
    lda    LFB76,X               ; 4
    sta    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    HMCLR                 ; 3
    dex                          ; 2
    bpl    LF348                 ; 2³
    lda    #$18                  ; 2
    sta    TIM64T                ; 4
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcs    LF38A                 ; 2³
    lda    #6                    ; 2
    sta    $E1                   ; 3
    sta    $E2                   ; 3
    sta    $E3                   ; 3
    jsr    LF94C                 ; 6
    lda    #$A0                  ; 2
    sta    $98                   ; 3
LF381:
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcc    LF381                 ; 2³
    jmp    LF00F                 ; 3
LF38A:
    lsr                          ; 2
    bcs    LF3BF                 ; 2³
    inc    $EB                   ; 5
    lda    $EB                   ; 3
    cmp    #6                    ; 2
    bcc    LF399                 ; 2³
    lda    #0                    ; 2
    sta    $EB                   ; 3
LF399:
    lda    $EB                   ; 3
    lsr                          ; 2
    sta    $E0                   ; 3
    lda    $EB                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$10                  ; 2
    sta    $96                   ; 3
    lda    #0                    ; 2
    sta    $98                   ; 3
    sta    $E1                   ; 3
    sta    $E2                   ; 3
    sta    $E3                   ; 3
    sta    $B4                   ; 3
    sta    $B2                   ; 3
LF3B5:
    lda    SWCHB                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    bcc    LF3B5                 ; 2³
    jmp    LF00F                 ; 3
LF3BF:
    ldy    #$FF                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    bcs    LF3C7                 ; 2³
    ldy    #$0F                  ; 2
LF3C7:
    sty    $BE                   ; 3
    inc    $C6                   ; 5
    lda    $B4                   ; 3
    bne    LF3EA                 ; 2³
    lda    $EC                   ; 3
    cmp    #4                    ; 2
    bne    LF3D8                 ; 2³
    jsr    LF8FA                 ; 6
LF3D8:
    lda    $EC                   ; 3
    beq    LF3E7                 ; 2³
    dec    $EC                   ; 5
    lda    $EB                   ; 3
    lsr                          ; 2
    bcc    LF3E7                 ; 2³
    lda    $EC                   ; 3
    bne    LF3EA                 ; 2³
LF3E7:
    jsr    LF866                 ; 6
LF3EA:
    ldx    #$20                  ; 2
    lda    #$FA                  ; 2
LF3EE:
    sta    $95,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LF3EE                 ; 2³
    lda    $E4                   ; 3
    ldy    $98                   ; 3
    bne    LF3FE                 ; 2³
    lda    $EB                   ; 3
    and    #$01                  ; 2
LF3FE:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$10                  ; 2
    sta    $B6                   ; 3
    lda    #$FB                  ; 2
    sta    $97                   ; 3
    sta    $B7                   ; 3
    lda    $C6                   ; 3
    and    #$07                  ; 2
    bne    LF429                 ; 2³
    lda    $8F                   ; 3
    eor    #$08                  ; 2
    sta    $8F                   ; 3
    lda    $8E                   ; 3
    eor    #$08                  ; 2
    sta    $8E                   ; 3
    lda    $90                   ; 3
    eor    #$08                  ; 2
    sta    $90                   ; 3
    lda    $B2                   ; 3
    eor    #$04                  ; 2
    sta    $B2                   ; 3
LF429:
    lda    $C6                   ; 3
    and    #$0F                  ; 2
    bne    LF435                 ; 2³
    lda    $B4                   ; 3
    eor    #$08                  ; 2
    sta    $B4                   ; 3
LF435:
    lda    $CB                   ; 3
    bne    LF451                 ; 2³
    lda    #9                    ; 2
    sta    $CB                   ; 3
    clc                          ; 2
    lda    $CC                   ; 3
    adc    #8                    ; 2
    cmp    #$20                  ; 2
    bcs    LF44B                 ; 2³
    sta    $CC                   ; 3
    jmp    LF453                 ; 3
LF44B:
    lda    #0                    ; 2
    sta    $CC                   ; 3
    beq    LF453                 ; 2³
LF451:
    dec    $CB                   ; 5
LF453:
    lda    $CC                   ; 3
    and    #$F8                  ; 2
    clc                          ; 2
    adc    #$C0                  ; 2
    sta    $9E                   ; 3
    sta    $A0                   ; 3
    sta    $A2                   ; 3
    lda    #$B8                  ; 2
    sta    $91                   ; 3
    sta    $92                   ; 3
    sta    $93                   ; 3
    ldx    #2                    ; 2
    ldy    #8                    ; 2
LF46C:
    lda    $B8,X                 ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    adc    #8                    ; 2
    sta.wy $A4,Y                 ; 5
    lda    $B8,X                 ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #8                    ; 2
    sta.wy $A6,Y                 ; 5
    lda    #$FB                  ; 2
    sta.wy $A5,Y                 ; 5
    sta.wy $A7,Y                 ; 5
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    dex                          ; 2
    bpl    LF46C                 ; 2³
    ldx    #0                    ; 2
LF493:
    lda.wx $A4,X                 ; 4
    eor    #$08                  ; 2
    bne    LF4A3                 ; 2³
    sta.wx $A4,X                 ; 5
    inx                          ; 2
    inx                          ; 2
    cpx    #$0A                  ; 2
    bcc    LF493                 ; 2³
LF4A3:
    lda    #5                    ; 2
    sta    $C8                   ; 3
    sta    $CA                   ; 3
    lda    $CE                   ; 3
    beq    LF4CB                 ; 2³
    dec    $CF                   ; 5
    bne    LF4EA                 ; 2³
    lda    #$0C                  ; 2
    sta    $CF                   ; 3
    sec                          ; 2
    lda    $CE                   ; 3
    sbc    #8                    ; 2
    sta    $CE                   ; 3
    sec                          ; 2
    cmp    #8                    ; 2
    bcs    LF4EA                 ; 2³
    lda    #$20                  ; 2
    sta    $EC                   ; 3
    lda    #0                    ; 2
    sta    $CE                   ; 3
    bne    LF4F4                 ; 2³
LF4CB:
    lda    $C4                   ; 3
    cmp    #$80                  ; 2
    bcc    LF4D6                 ; 2³
    lda    CXM1P                 ; 3
    asl                          ; 2
    bcs    LF4E2                 ; 2³
LF4D6:
    lda    $C5                   ; 3
    cmp    #$80                  ; 2
    bcc    LF4F4                 ; 2³
    lda    CXP0FB                ; 3
    asl                          ; 2
    asl                          ; 2
    bcc    LF4F4                 ; 2³
LF4E2:
    lda    #$0C                  ; 2
    sta    $CF                   ; 3
    lda    #$38                  ; 2
    sta    $CE                   ; 3
LF4EA:
    lda.w  $CE                   ; 4
    lsr                          ; 2
    sta    $B2                   ; 3
    lda    $CE                   ; 3
    sta    $B4                   ; 3
LF4F4:
    lda    $D3                   ; 3
    beq    LF511                 ; 2³+1
    dec    $D0                   ; 5
    bne    LF52D                 ; 2³+1
    lda    #8                    ; 2
    sta    $D0                   ; 3
    sec                          ; 2
    lda    $D3                   ; 3
    sbc    #8                    ; 2
    sta    $D3                   ; 3
    cmp    #$40                  ; 2
    bcs    LF52D                 ; 2³
    lda    #0                    ; 2
    sta    $D3                   ; 3
    beq    LF52D                 ; 2³
LF511:
    lda    $C3                   ; 3
    cmp    #$48                  ; 2
    bcc    LF531                 ; 2³
    lda    CXM0P                 ; 3
    asl                          ; 2
    bcc    LF531                 ; 2³
    lda    #0                    ; 2
    sta    $C3                   ; 3
    lda    #8                    ; 2
    sta    $D0                   ; 3
    lda    #$58                  ; 2
    sta    $D3                   ; 3
    lda    #$10                  ; 2
    jsr    LF886                 ; 6
LF52D:
    lda    $D3                   ; 3
    sta    $8E                   ; 3
LF531:
    lda    $D5                   ; 3
    beq    LF54E                 ; 2³
    dec    $D2                   ; 5
    bne    LF56C                 ; 2³
    lda    #8                    ; 2
    sta    $D2                   ; 3
    sec                          ; 2
    lda    $D5                   ; 3
    sbc    #8                    ; 2
    sta    $D5                   ; 3
    cmp    #$50                  ; 2
    bcs    LF56C                 ; 2³
    lda    #0                    ; 2
    sta    $D5                   ; 3
    beq    LF56C                 ; 2³
LF54E:
    lda    $C3                   ; 3
    beq    LF570                 ; 2³
    cmp    #$28                  ; 2
    bcs    LF570                 ; 2³
    lda    CXM0P                 ; 3
    asl                          ; 2
    bcc    LF570                 ; 2³
    lda    #0                    ; 2
    sta    $C3                   ; 3
    lda    #8                    ; 2
    sta    $D2                   ; 3
    lda    #$68                  ; 2
    sta    $D5                   ; 3
    lda    #$30                  ; 2
    jsr    LF886                 ; 6
LF56C:
    lda    $D5                   ; 3
    sta    $90                   ; 3
LF570:
    lda    $D1                   ; 3
    beq    LF576                 ; 2³
    dec    $D1                   ; 5
LF576:
    lda    $C3                   ; 3
    cmp    #$28                  ; 2
    bcc    LF5D9                 ; 2³
    lda    CXM0P                 ; 3
    asl                          ; 2
    bcc    LF5D9                 ; 2³
    lda    #0                    ; 2
    sta    $C3                   ; 3
    lda    #$10                  ; 2
    sta    $D1                   ; 3
    lda    #$50                  ; 2
    jsr    LF886                 ; 6
    lda    $85                   ; 3
    adc    #8                    ; 2
    sta    $80                   ; 3
    lda.w  $88                   ; 4
    cmp    $80                   ; 3
    bcc    LF5CE                 ; 2³
    lda    $85                   ; 3
    adc    #$18                  ; 2
    sta    $80                   ; 3
    lda    $C9                   ; 3
    cmp    #3                    ; 2
    beq    LF5AF                 ; 2³
    cmp    #6                    ; 2
    beq    LF5BB                 ; 2³
    lda    #0                    ; 2
    beq    LF5D7                 ; 2³
LF5AF:
    lda    #2                    ; 2
    ldy    $88                   ; 3
    cpy    $80                   ; 3
    bcc    LF5D7                 ; 2³
    lda    #1                    ; 2
    bne    LF5D7                 ; 2³
LF5BB:
    lda.w  $85                   ; 4
    adc    #$28                  ; 2
    sta    $80                   ; 3
    lda    #4                    ; 2
    ldy    $88                   ; 3
    cpy    $80                   ; 3
    bcc    LF5D7                 ; 2³
    lda    #2                    ; 2
    bne    LF5D7                 ; 2³
LF5CE:
    ldy    $85                   ; 3
    lda    $C9                   ; 3
    jsr    LF83C                 ; 6
    sty    $85                   ; 3
LF5D7:
    sta    $C9                   ; 3
LF5D9:
    lda    $C3                   ; 3
    cmp    #4                    ; 2
    bcc    LF611                 ; 2³+1
    ldy    #$E0                  ; 2
    cmp    #$91                  ; 2
    bcs    LF5F9                 ; 2³
    ldy    #0                    ; 2
    cmp    #$8C                  ; 2
    bcs    LF5F9                 ; 2³
    ldy    #$E4                  ; 2
    cmp    #$88                  ; 2
    bcs    LF5F9                 ; 2³
    ldy    #$E8                  ; 2
    cmp    #$84                  ; 2
    bcs    LF5F9                 ; 2³
    ldy    #0                    ; 2
LF5F9:
    sty    $9A                   ; 3
    lda.w  $C6                   ; 4
    and    #$01                  ; 2
    bne    LF609                 ; 2³
    lda    $C3                   ; 3
    sec                          ; 2
    sbc    $DB                   ; 3
    sta    $C3                   ; 3
LF609:
    lda    $C3                   ; 3
    cmp    #$80                  ; 2
    bcs    LF63A                 ; 2³
    bcc    LF61A                 ; 2³
LF611:
    lda    #0                    ; 2
    sta    $9A                   ; 3
    lda.w  $CE                   ; 4
    bne    LF63A                 ; 2³
LF61A:
    lda    $B4                   ; 3
    and    #$F7                  ; 2
    beq    LF63A                 ; 2³
    lda    INPT4                 ; 3
    ldy    $E4                   ; 3
    beq    LF628                 ; 2³
    lda    INPT5                 ; 3
LF628:
    asl                          ; 2
    bcs    LF63A                 ; 2³
    lda    #$92                  ; 2
    sta    $C3                   ; 3
    lda    #$E0                  ; 2
    sta    $C2                   ; 3
    sec                          ; 2
    lda    $83                   ; 3
    sbc    #4                    ; 2
    sta    $88                   ; 3
LF63A:
    lda    $C6                   ; 3
    and    #$03                  ; 2
    bne    LF660                 ; 2³
    lda    $C4                   ; 3
    cmp    #$A8                  ; 2
    bcc    LF657                 ; 2³
    lda    $8E                   ; 3
    and    #$F7                  ; 2
    beq    LF660                 ; 2³
    clc                          ; 2
    lda    $84                   ; 3
    adc    #2                    ; 2
    sta    $89                   ; 3
    lda    #$5F                  ; 2
    sta    $C4                   ; 3
LF657:
    clc                          ; 2
    lda    $C4                   ; 3
    adc    $D9                   ; 3
    adc    $E0                   ; 3
    sta    $C4                   ; 3
LF660:
    lda    $C6                   ; 3
    and    #$01                  ; 2
    bne    LF686                 ; 2³
    lda    $C5                   ; 3
    cmp    #$A8                  ; 2
    bcc    LF67D                 ; 2³
    lda    $90                   ; 3
    and    #$F7                  ; 2
    beq    LF686                 ; 2³
    clc                          ; 2
    lda    $86                   ; 3
    adc    #4                    ; 2
    sta    $8A                   ; 3
    lda    #7                    ; 2
    sta    $C5                   ; 3
LF67D:
    clc                          ; 2
    lda    $C5                   ; 3
    adc    $DA                   ; 3
    adc    $E0                   ; 3
    sta    $C5                   ; 3
LF686:
    ldx    #2                    ; 2
LF688:
    lda    $C3,X                 ; 4
    and    #$FC                  ; 2
    sta    $8B,X                 ; 4
    dex                          ; 2
    bpl    LF688                 ; 2³
    lda    $98                   ; 3
    bne    LF698                 ; 2³
    jmp    LF746                 ; 3
LF698:
    lda    #8                    ; 2
    sta    AUDC0                 ; 3
    lda    #7                    ; 2
    ldy    $C3                   ; 3
    beq    LF6AA                 ; 2³
    cpy    #$88                  ; 2
    bcs    LF6AE                 ; 2³
    cpy    #$50                  ; 2
    bcs    LF6B4                 ; 2³
LF6AA:
    lda    #0                    ; 2
    beq    LF6B4                 ; 2³
LF6AE:
    ldy    #$0C                  ; 2
    sty    AUDC0                 ; 3
    lda    #$0B                  ; 2
LF6B4:
    sta    AUDV0                 ; 3
    lda    $C3                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDF0                 ; 3
    lda    #0                    ; 2
    sta    AUDV1                 ; 3
    ldy    $C4                   ; 3
    beq    LF6D8                 ; 2³
    cpy    #$70                  ; 2
    bcs    LF6D8                 ; 2³
    lda    #5                    ; 2
    sta    AUDV1                 ; 3
    lda    $C4                   ; 3
    eor    #$0F                  ; 2
    sta    AUDF1                 ; 3
    lda    #4                    ; 2
    sta    AUDC1                 ; 3
LF6D8:
    ldy    $C5                   ; 3
    beq    LF6EC                 ; 2³
    cpy    #$20                  ; 2
    bcs    LF6EC                 ; 2³
    lda    #5                    ; 2
    sta    AUDV1                 ; 3
    lda    $C5                   ; 3
    sta    AUDF1                 ; 3
    lda    #$0C                  ; 2
    sta    AUDC1                 ; 3
LF6EC:
    lda    $CE                   ; 3
    beq    LF6FF                 ; 2³
    lda    #8                    ; 2
    sta    AUDC0                 ; 3
    lda    $CE                   ; 3
    ora    $CF                   ; 3
    lsr                          ; 2
    sta    AUDV0                 ; 3
    eor    #$FF                  ; 2
    sta    AUDF0                 ; 3
LF6FF:
    lda    $D3                   ; 3
    beq    LF713                 ; 2³
    lda    #8                    ; 2
    sta    AUDC1                 ; 3
    lda    $D3                   ; 3
    ora    $D0                   ; 3
    asl                          ; 2
    asl                          ; 2
    sta    AUDV1                 ; 3
    eor    #$1F                  ; 2
    sta    AUDF1                 ; 3
LF713:
    lda    $D5                   ; 3
    beq    LF726                 ; 2³
    lda    #8                    ; 2
    sta    AUDC1                 ; 3
    lda    $D5                   ; 3
    ora    $D2                   ; 3
    lsr                          ; 2
    sta    AUDV1                 ; 3
    eor    #$0F                  ; 2
    sta    AUDF1                 ; 3
LF726:
    lda    $D1                   ; 3
    beq    LF734                 ; 2³
    sta    AUDV1                 ; 3
    lda    #4                    ; 2
    sta    AUDC1                 ; 3
    lda    $D1                   ; 3
    sta    AUDF1                 ; 3
LF734:
    lda    $ED                   ; 3
    beq    LF746                 ; 2³
    dec    $ED                   ; 5
    lda    $ED                   ; 3
    sta    AUDF1                 ; 3
    lda    #4                    ; 2
    sta    AUDC1                 ; 3
    lda    #$0C                  ; 2
    sta    AUDV1                 ; 3
LF746:
    lda    INTIM                 ; 4
    bne    LF746                 ; 2³
    lda    #$82                  ; 2
    sta    WSYNC                 ; 3
    sta    VBLANK                ; 3
    sta    VSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    lda    #0                    ; 2
    sta    VSYNC                 ; 3
    lda    #$21                  ; 2
    sta    TIM64T                ; 4
    lda    SWCHA                 ; 4
    ldy    $E4                   ; 3
    beq    LF76D                 ; 2³
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
LF76D:
    ldy    $83                   ; 3
    asl                          ; 2
    bcs    LF77A                 ; 2³
    cpy    #$90                  ; 2
    bcs    LF782                 ; 2³
    iny                          ; 2
    jmp    LF782                 ; 3
LF77A:
    asl                          ; 2
    bcs    LF782                 ; 2³
    cpy    #8                    ; 2
    bcc    LF782                 ; 2³
    dey                          ; 2
LF782:
    sty    $83                   ; 3
    lda    $D6                   ; 3
    beq    LF78D                 ; 2³
    dec    $D6                   ; 5
    jmp    LF7A5                 ; 3
LF78D:
    lda    $DC                   ; 3
    sta    $D6                   ; 3
    sta    $82                   ; 3
    lda    $84                   ; 3
    sec                          ; 2
    sbc    $82                   ; 3
    tay                          ; 2
    cpy    #4                    ; 2
    bcs    LF7A3                 ; 2³
    lda    #$70                  ; 2
    sta    $8E                   ; 3
    ldy    #$A0                  ; 2
LF7A3:
    sty    $84                   ; 3
LF7A5:
    lda    $D7                   ; 3
    beq    LF7AE                 ; 2³
    dec    $D7                   ; 5
    jmp    LF7C7                 ; 3
LF7AE:
    lda    $DD                   ; 3
    sta    $D7                   ; 3
    sta    $82                   ; 3
    lda    $85                   ; 3
    sec                          ; 2
    sbc    $82                   ; 3
    tay                          ; 2
    cpy    #4                    ; 2
    bcs    LF7C5                 ; 2³
    lda    $C9                   ; 3
    jsr    LF83C                 ; 6
    sta    $C9                   ; 3
LF7C5:
    sty    $85                   ; 3
LF7C7:
    lda    $D8                   ; 3
    beq    LF7D0                 ; 2³
    dec    $D8                   ; 5
    jmp    LF7E8                 ; 3
LF7D0:
    lda    $DE                   ; 3
    sta    $D8                   ; 3
    sta    $82                   ; 3
    sec                          ; 2
    lda    $86                   ; 3
    sbc    $82                   ; 3
    tay                          ; 2
    cpy    #4                    ; 2
    bcs    LF7E6                 ; 2³
    lda    #$80                  ; 2
    sta    $90                   ; 3
    ldy    #$A0                  ; 2
LF7E6:
    sty    $86                   ; 3
LF7E8:
    lda    $C6                   ; 3
    and    #$0F                  ; 2
    bne    LF80F                 ; 2³+1
    lda    $C6                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFB9D,Y               ; 4
    sta    $F0                   ; 3
    lda    $84                   ; 3
    eor.w  $85                   ; 4
    eor.w  $86                   ; 4
    and    #$7F                  ; 2
    sta    $EF                   ; 3
    lda.w  $9C                   ; 4
    eor    #$08                  ; 2
    sta    $9C                   ; 3
LF80F:
    jmp    LF082                 ; 3
LF812:
    clc                          ; 2
    adc    #$2E                  ; 2
    tay                          ; 2
    and    #$0F                  ; 2
    sta.w  $82                   ; 4
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    clc                          ; 2
    adc.w  $82                   ; 4
    cmp    #$0F                  ; 2
    bcc    LF82C                 ; 2³
    sbc    #$0F                  ; 2
    iny                          ; 2
LF82C:
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0,X                ; 4
    sta    WSYNC                 ; 3
LF836:
    dey                          ; 2
    bpl    LF836                 ; 2³
    sta    RESP0,X               ; 4
    rts                          ; 6

LF83C:
    ldx    #6                    ; 2
LF83E:
    cmp    LFB88,X               ; 4
    beq    LF84C                 ; 2³
    dex                          ; 2
    bpl    LF83E                 ; 2³
    ldy    #$98                  ; 2
    lda    #0                    ; 2
    beq    LF865                 ; 2³
LF84C:
    clc                          ; 2
    tya                          ; 2
    adc    LFB8F,X               ; 4
    tay                          ; 2
    lda    LFB96,X               ; 4
    cmp    #$FF                  ; 2
    bne    LF865                 ; 2³
    lda    $83                   ; 3
    adc    $86                   ; 3
    and    #$07                  ; 2
    cmp    #7                    ; 2
    bne    LF865                 ; 2³
    lda    #0                    ; 2
LF865:
    rts                          ; 6

LF866:
    lda    $E1                   ; 3
    beq    LF885                 ; 2³
    lda    SWCHA                 ; 4
    ldy    $E4                   ; 3
    bne    LF875                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
LF875:
    lsr                          ; 2
    bcs    LF885                 ; 2³
    lda    #$A0                  ; 2
    sta    $B4                   ; 3
    lda    #$B0                  ; 2
    sta    $B2                   ; 3
    dec    $E1                   ; 5
    jsr    LF94C                 ; 6
LF885:
    rts                          ; 6

LF886:
    tay                          ; 2
    lda    $B9                   ; 3
    and    #$F0                  ; 2
    sta    $82                   ; 3
    tya                          ; 2
    clc                          ; 2
    ldx    #2                    ; 2
    sed                          ; 2
LF892:
    adc.wx $B8,X                 ; 4
    sta    $B8,X                 ; 4
    lda    #0                    ; 2
    dex                          ; 2
    bpl    LF892                 ; 2³
    lda    $B8                   ; 3
    bne    LF8A6                 ; 2³
    lda    $B9                   ; 3
    cmp    #$50                  ; 2
    bcc    LF8A8                 ; 2³
LF8A6:
    lda    #$50                  ; 2
LF8A8:
    and    #$F0                  ; 2
    clc                          ; 2
    ldx    #2                    ; 2
LF8AD:
    adc.wx $B8,X                 ; 4
    sta    $B8,X                 ; 4
    lda    #0                    ; 2
    dex                          ; 2
    bpl    LF8AD                 ; 2³
    cld                          ; 2
    lda    $B9                   ; 3
    and    #$F0                  ; 2
    cmp    $82                   ; 3
    beq    LF8CF                 ; 2³
    lda    #$2F                  ; 2
    sta    $ED                   ; 3
    lda    $E1                   ; 3
    cmp    #9                    ; 2
    bcs    LF8CF                 ; 2³
    inc    $E1                   ; 5
    jsr    LF94C                 ; 6
LF8CF:
    lda    $B9                   ; 3
    cmp    $DF                   ; 3
    beq    LF8F9                 ; 2³
    sta    $DF                   ; 3
    adc    $BA                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    tay                          ; 2
    lda    LFBAD,Y               ; 4
    sta    $DC                   ; 3
    lda    LFBB5,Y               ; 4
    sta    $DD                   ; 3
    lda    LFBBD,Y               ; 4
    sta    $DE                   ; 3
    lda    LFBC5,Y               ; 4
    sta    $D9                   ; 3
    lda    LFBCD,Y               ; 4
    sta    $DA                   ; 3
LF8F9:
    rts                          ; 6

LF8FA:
    lda    $EB                   ; 3
    and    #$01                  ; 2
    beq    LF94B                 ; 2³
    lda    $E4                   ; 3
    beq    LF924                 ; 2³
    ldx    #2                    ; 2
LF906:
    lda    $B8,X                 ; 4
    sta    $E5,X                 ; 4
    dex                          ; 2
    bpl    LF906                 ; 2³
    lda    $E1                   ; 3
    sta    $E2                   ; 3
    lda    $E3                   ; 3
    sta    $E1                   ; 3
    ldx    #2                    ; 2
LF917:
    lda    $E8,X                 ; 4
    sta    $B8,X                 ; 4
    dex                          ; 2
    bpl    LF917                 ; 2³
    lda    #0                    ; 2
    sta    $E4                   ; 3
    beq    LF942                 ; 2³
LF924:
    ldx    #2                    ; 2
LF926:
    lda    $B8,X                 ; 4
    sta    $E8,X                 ; 4
    dex                          ; 2
    bpl    LF926                 ; 2³
    lda    $E1                   ; 3
    sta    $E3                   ; 3
    lda    $E2                   ; 3
    sta    $E1                   ; 3
    ldx    #2                    ; 2
LF937:
    lda    $E5,X                 ; 4
    sta    $B8,X                 ; 4
    dex                          ; 2
    bpl    LF937                 ; 2³
    lda    #1                    ; 2
    sta    $E4                   ; 3
LF942:
    lda    $E1                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #8                    ; 2
    sta    $96                   ; 3
LF94B:
    rts                          ; 6

LF94C:
    lda.w  $E1                   ; 4
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #8                    ; 2
    sta    $96                   ; 3
    rts                          ; 6
    
    REPEAT ($FA00 - *)
      .byte 0
    REPEND

;LF957:
;    .byte $20,$AA,$F9,$20,$AA,$F9,$B5,$B1,$85,$B0,$B5,$B6,$18,$69,$0B,$85
;    .byte $D8,$B5,$BB,$29,$20,$F0,$05,$A0,$00,$20,$8B,$FC,$A5,$BB,$29,$20
;    .byte $F0,$07,$A0,$01,$A2,$00,$20,$8B,$FC,$A9,$FF,$85,$D3,$A9,$2B,$85
;    .byte $D2,$A2,$05,$A5,$EF,$30,$04,$A9,$36,$85,$D2,$B4,$F0,$B1,$D2,$45
;    .byte $82,$25,$EF,$95,$F0,$CA,$10,$F3,$A5,$F3,$85,$07,$A5,$F2,$85,$06
;    .byte $4C,$7F,$F0,$B5,$BB,$29,$08,$F0,$22,$B5,$B6,$C9,$1E,$D0,$1C,$B5
;    .byte $B1,$C9,$58,$D0,$04,$A0,$01,$D0,$25,$C9,$4C,$D0,$0E,$A5,$9A,$30
;    .byte $1C,$B5,$BB,$29,$F7,$95,$BB,$A0,$00,$F0,$13,$B5,$BB,$29,$20,$D0
;    .byte $0C,$20,$AD,$FB,$20,$26,$FA,$B5,$BB,$29,$20,$F0,$0A,$60,$B5,$BB
;    .byte $29,$3F,$19,$63,$FE,$95,$BB,$B5,$C0,$0A,$0A,$0A,$0A,$18,$75,$C0
;    .byte $95,$C0,$90,$E9,$A0,$00,$B5,$BB,$29

    .byte $00 ; |        | $FA00
    .byte $00 ; |        | $FA01
    .byte $00 ; |        | $FA02
    .byte $00 ; |        | $FA03
    .byte $00 ; |        | $FA04
    .byte $00 ; |        | $FA05
    .byte $00 ; |        | $FA06
    .byte $00 ; |        | $FA07
    .byte $00 ; |        | $FA08
    .byte $00 ; |        | $FA09
    .byte $00 ; |        | $FA0A
    .byte $00 ; |        | $FA0B
    .byte $00 ; |        | $FA0C
    .byte $00 ; |        | $FA0D
    .byte $00 ; |        | $FA0E
    .byte $00 ; |        | $FA0F
    .byte $00 ; |        | $FA10
    .byte $00 ; |        | $FA11
    .byte $00 ; |        | $FA12
    .byte $08 ; |    X   | $FA13
    .byte $14 ; |   X X  | $FA14
    .byte $08 ; |    X   | $FA15
    .byte $00 ; |        | $FA16
    .byte $00 ; |        | $FA17
    .byte $10 ; |   X    | $FA18
    .byte $44 ; | X   X  | $FA19
    .byte $00 ; |        | $FA1A
    .byte $82 ; |X     X | $FA1B
    .byte $00 ; |        | $FA1C
    .byte $44 ; | X   X  | $FA1D
    .byte $10 ; |   X    | $FA1E
    .byte $00 ; |        | $FA1F
    .byte $00 ; |        | $FA20
    .byte $00 ; |        | $FA21
    .byte $00 ; |        | $FA22
    .byte $08 ; |    X   | $FA23
    .byte $14 ; |   X X  | $FA24
    .byte $08 ; |    X   | $FA25
    .byte $00 ; |        | $FA26
    .byte $00 ; |        | $FA27
    .byte $10 ; |   X    | $FA28
    .byte $44 ; | X   X  | $FA29
    .byte $00 ; |        | $FA2A
    .byte $82 ; |X     X | $FA2B
    .byte $00 ; |        | $FA2C
    .byte $44 ; | X   X  | $FA2D
    .byte $10 ; |   X    | $FA2E
    .byte $00 ; |        | $FA2F
    .byte $5A ; | X XX X | $FA30
    .byte $A5 ; |X X  X X| $FA31
    .byte $5A ; | X XX X | $FA32
    .byte $BD ; |X XXXX X| $FA33
    .byte $BD ; |X XXXX X| $FA34
    .byte $5A ; | X XX X | $FA35
    .byte $A5 ; |X X  X X| $FA36
    .byte $5A ; | X XX X | $FA37
    .byte $81 ; |X      X| $FA38
    .byte $5A ; | X XX X | $FA39
    .byte $24 ; |  X  X  | $FA3A
    .byte $42 ; | X    X | $FA3B
    .byte $42 ; | X    X | $FA3C
    .byte $24 ; |  X  X  | $FA3D
    .byte $5A ; | X XX X | $FA3E
    .byte $81 ; |X      X| $FA3F
    .byte $08 ; |    X   | $FA40
    .byte $40 ; | X      | $FA41
    .byte $10 ; |   X    | $FA42
    .byte $00 ; |        | $FA43
    .byte $00 ; |        | $FA44
    .byte $00 ; |        | $FA45
    .byte $00 ; |        | $FA46
    .byte $00 ; |        | $FA47
    .byte $40 ; | X      | $FA48
    .byte $14 ; |   X X  | $FA49
    .byte $00 ; |        | $FA4A
    .byte $40 ; | X      | $FA4B
    .byte $0A ; |    X X | $FA4C
    .byte $10 ; |   X    | $FA4D
    .byte $00 ; |        | $FA4E
    .byte $00 ; |        | $FA4F
    .byte $00 ; |        | $FA50
    .byte $00 ; |        | $FA51
    .byte $04 ; |     X  | $FA52
    .byte $40 ; | X      | $FA53
    .byte $40 ; | X      | $FA54
    .byte $14 ; |   X X  | $FA55
    .byte $4A ; | X  X X | $FA56
    .byte $10 ; |   X    | $FA57
    .byte $10 ; |   X    | $FA58
    .byte $54 ; | X X X  | $FA59
    .byte $28 ; |  X X   | $FA5A
    .byte $C6 ; |XX   XX | $FA5B
    .byte $28 ; |  X X   | $FA5C
    .byte $54 ; | X X X  | $FA5D
    .byte $10 ; |   X    | $FA5E
    .byte $00 ; |        | $FA5F
    .byte $00 ; |        | $FA60
    .byte $10 ; |   X    | $FA61
    .byte $28 ; |  X X   | $FA62
    .byte $44 ; | X   X  | $FA63
    .byte $10 ; |   X    | $FA64
    .byte $00 ; |        | $FA65
    .byte $00 ; |        | $FA66
    .byte $00 ; |        | $FA67
    .byte $00 ; |        | $FA68
    .byte $00 ; |        | $FA69
    .byte $00 ; |        | $FA6A
    .byte $08 ; |    X   | $FA6B
    .byte $14 ; |   X X  | $FA6C
    .byte $08 ; |    X   | $FA6D
    .byte $00 ; |        | $FA6E
    .byte $00 ; |        | $FA6F
    .byte $00 ; |        | $FA70
    .byte $CC ; |XX  XX  | $FA71
    .byte $22 ; |  X   X | $FA72
    .byte $3C ; |  XXXX  | $FA73
    .byte $56 ; | X X XX | $FA74
    .byte $3C ; |  XXXX  | $FA75
    .byte $00 ; |        | $FA76
    .byte $00 ; |        | $FA77
    .byte $00 ; |        | $FA78
    .byte $33 ; |  XX  XX| $FA79
    .byte $44 ; | X   X  | $FA7A
    .byte $3C ; |  XXXX  | $FA7B
    .byte $6A ; | XX X X | $FA7C
    .byte $3C ; |  XXXX  | $FA7D
    .byte $00 ; |        | $FA7E
    .byte $00 ; |        | $FA7F
    .byte $30 ; |  XX    | $FA80
    .byte $28 ; |  X X   | $FA81
    .byte $98 ; |X  XX   | $FA82
    .byte $60 ; | XX     | $FA83
    .byte $60 ; | XX     | $FA84
    .byte $98 ; |X  XX   | $FA85
    .byte $28 ; |  X X   | $FA86
    .byte $20 ; |  X     | $FA87
    .byte $04 ; |     X  | $FA88
    .byte $09 ; |    X  X| $FA89
    .byte $5F ; | X XXXXX| $FA8A
    .byte $30 ; |  XX    | $FA8B
    .byte $30 ; |  XX    | $FA8C
    .byte $5F ; | X XXXXX| $FA8D
    .byte $09 ; |    X  X| $FA8E
    .byte $04 ; |     X  | $FA8F
    .byte $00 ; |        | $FA90
    .byte $40 ; | X      | $FA91
    .byte $34 ; |  XX X  | $FA92
    .byte $3E ; |  XXXXX | $FA93
    .byte $7B ; | XXXX XX| $FA94
    .byte $D2 ; |XX X  X | $FA95
    .byte $03 ; |      XX| $FA96
    .byte $00 ; |        | $FA97
    .byte $03 ; |      XX| $FA98
    .byte $0E ; |    XXX | $FA99
    .byte $7B ; | XXXX XX| $FA9A
    .byte $38 ; |  XXX   | $FA9B
    .byte $78 ; | XXXX   | $FA9C
    .byte $D0 ; |XX X    | $FA9D
    .byte $50 ; | X X    | $FA9E
    .byte $00 ; |        | $FA9F
    .byte $00 ; |        | $FAA0
    .byte $18 ; |   XX   | $FAA1
    .byte $3C ; |  XXXX  | $FAA2
    .byte $6E ; | XX XXX | $FAA3
    .byte $FE ; |XXXXXXX | $FAA4
    .byte $9F ; |X  XXXXX| $FAA5
    .byte $02 ; |      X | $FAA6
    .byte $28 ; |  X X   | $FAA7
    .byte $00 ; |        | $FAA8
    .byte $00 ; |        | $FAA9
    .byte $18 ; |   XX   | $FAAA
    .byte $3C ; |  XXXX  | $FAAB
    .byte $76 ; | XXX XX | $FAAC
    .byte $FE ; |XXXXXXX | $FAAD
    .byte $9F ; |X  XXXXX| $FAAE
    .byte $02 ; |      X | $FAAF
    .byte $20 ; |  X     | $FAB0
    .byte $10 ; |   X    | $FAB1
    .byte $04 ; |     X  | $FAB2
    .byte $00 ; |        | $FAB3
    .byte $10 ; |   X    | $FAB4
    .byte $08 ; |    X   | $FAB5
    .byte $00 ; |        | $FAB6
    .byte $02 ; |      X | $FAB7
    .byte $FF ; |XXXXXXXX| $FAB8
    .byte $DE ; |XX XXXX | $FAB9
    .byte $CF ; |XX  XXXX| $FABA
    .byte $73 ; | XXX  XX| $FABB
    .byte $D3 ; |XX X  XX| $FABC
    .byte $98 ; |X  XX   | $FABD
    .byte $1C ; |   XXX  | $FABE
    .byte $08 ; |    X   | $FABF
    .byte $00 ; |        | $FAC0
    .byte $00 ; |        | $FAC1
    .byte $00 ; |        | $FAC2
    .byte $26 ; |  X  XX | $FAC3
    .byte $FF ; |XXXXXXXX| $FAC4
    .byte $FA ; |XXXXX X | $FAC5
    .byte $70 ; | XXX    | $FAC6
    .byte $00 ; |        | $FAC7
    .byte $00 ; |        | $FAC8
    .byte $00 ; |        | $FAC9
    .byte $70 ; | XXX    | $FACA
    .byte $F8 ; |XXXXX   | $FACB
    .byte $FB ; |XXXXX XX| $FACC
    .byte $2F ; |  X XXXX| $FACD
    .byte $0E ; |    XXX | $FACE
    .byte $00 ; |        | $FACF
    .byte $00 ; |        | $FAD0
    .byte $00 ; |        | $FAD1
    .byte $60 ; | XX     | $FAD2
    .byte $FE ; |XXXXXXX | $FAD3
    .byte $FF ; |XXXXXXXX| $FAD4
    .byte $7B ; | XXXX XX| $FAD5
    .byte $31 ; |  XX   X| $FAD6
    .byte $00 ; |        | $FAD7
    .byte $06 ; |     XX | $FAD8
    .byte $1F ; |   XXXXX| $FAD9
    .byte $FF ; |XXXXXXXX| $FADA
    .byte $FE ; |XXXXXXX | $FADB
    .byte $7C ; | XXXXX  | $FADC
    .byte $78 ; | XXXX   | $FADD
    .byte $38 ; |  XXX   | $FADE
    .byte $00 ; |        | $FADF
    .byte $81 ; |X      X| $FAE0
    .byte $82 ; |X     X | $FAE1
    .byte $44 ; | X   X  | $FAE2
    .byte $38 ; |  XXX   | $FAE3
    .byte $A8 ; |X X X   | $FAE4
    .byte $20 ; |  X     | $FAE5
    .byte $50 ; | X X    | $FAE6
    .byte $00 ; |        | $FAE7
    .byte $40 ; | X      | $FAE8
    .byte $90 ; |X  X    | $FAE9
    .byte $00 ; |        | $FAEA
    .byte $00 ; |        | $FAEB
    .byte $00 ; |        | $FAEC
    .byte $00 ; |        | $FAED
    .byte $00 ; |        | $FAEE
    .byte $00 ; |        | $FAEF
    .byte $00 ; |        | $FAF0
    .byte $10 ; |   X    | $FAF1
    .byte $28 ; |  X X   | $FAF2
    .byte $44 ; | X   X  | $FAF3
    .byte $28 ; |  X X   | $FAF4
    .byte $10 ; |   X    | $FAF5
    .byte $00 ; |        | $FAF6
    .byte $00 ; |        | $FAF7
    .byte $00 ; |        | $FAF8
    .byte $00 ; |        | $FAF9
    .byte $24 ; |  X  X  | $FAFA
    .byte $42 ; | X    X | $FAFB
    .byte $42 ; | X    X | $FAFC
    .byte $24 ; |  X  X  | $FAFD
    .byte $00 ; |        | $FAFE
    .byte $00 ; |        | $FAFF
    .byte $00 ; |        | $FB00
    .byte $00 ; |        | $FB01
    .byte $00 ; |        | $FB02
    .byte $00 ; |        | $FB03
    .byte $00 ; |        | $FB04
    .byte $00 ; |        | $FB05
    .byte $00 ; |        | $FB06
    .byte $00 ; |        | $FB07
    .byte $3C ; |  XXXX  | $FB08
    .byte $66 ; | XX  XX | $FB09
    .byte $66 ; | XX  XX | $FB0A
    .byte $66 ; | XX  XX | $FB0B
    .byte $66 ; | XX  XX | $FB0C
    .byte $66 ; | XX  XX | $FB0D
    .byte $66 ; | XX  XX | $FB0E
    .byte $3C ; |  XXXX  | $FB0F
    .byte $3C ; |  XXXX  | $FB10
    .byte $18 ; |   XX   | $FB11
    .byte $18 ; |   XX   | $FB12
    .byte $18 ; |   XX   | $FB13
    .byte $18 ; |   XX   | $FB14
    .byte $18 ; |   XX   | $FB15
    .byte $38 ; |  XXX   | $FB16
    .byte $18 ; |   XX   | $FB17
    .byte $7E ; | XXXXXX | $FB18
    .byte $60 ; | XX     | $FB19
    .byte $60 ; | XX     | $FB1A
    .byte $3C ; |  XXXX  | $FB1B
    .byte $06 ; |     XX | $FB1C
    .byte $06 ; |     XX | $FB1D
    .byte $46 ; | X   XX | $FB1E
    .byte $3C ; |  XXXX  | $FB1F
    .byte $3C ; |  XXXX  | $FB20
    .byte $46 ; | X   XX | $FB21
    .byte $06 ; |     XX | $FB22
    .byte $0C ; |    XX  | $FB23
    .byte $0C ; |    XX  | $FB24
    .byte $06 ; |     XX | $FB25
    .byte $46 ; | X   XX | $FB26
    .byte $3C ; |  XXXX  | $FB27
    .byte $0C ; |    XX  | $FB28
    .byte $0C ; |    XX  | $FB29
    .byte $0C ; |    XX  | $FB2A
    .byte $7E ; | XXXXXX | $FB2B
    .byte $4C ; | X  XX  | $FB2C
    .byte $2C ; |  X XX  | $FB2D
    .byte $1C ; |   XXX  | $FB2E
    .byte $0C ; |    XX  | $FB2F
    .byte $7C ; | XXXXX  | $FB30
    .byte $46 ; | X   XX | $FB31
    .byte $06 ; |     XX | $FB32
    .byte $06 ; |     XX | $FB33
    .byte $7C ; | XXXXX  | $FB34
    .byte $60 ; | XX     | $FB35
    .byte $60 ; | XX     | $FB36
    .byte $7E ; | XXXXXX | $FB37
    .byte $3C ; |  XXXX  | $FB38
    .byte $66 ; | XX  XX | $FB39
    .byte $66 ; | XX  XX | $FB3A
    .byte $66 ; | XX  XX | $FB3B
    .byte $7C ; | XXXXX  | $FB3C
    .byte $60 ; | XX     | $FB3D
    .byte $62 ; | XX   X | $FB3E
    .byte $3C ; |  XXXX  | $FB3F
    .byte $18 ; |   XX   | $FB40
    .byte $18 ; |   XX   | $FB41
    .byte $18 ; |   XX   | $FB42
    .byte $18 ; |   XX   | $FB43
    .byte $0C ; |    XX  | $FB44
    .byte $06 ; |     XX | $FB45
    .byte $42 ; | X    X | $FB46
    .byte $7E ; | XXXXXX | $FB47
    .byte $3C ; |  XXXX  | $FB48
    .byte $66 ; | XX  XX | $FB49
    .byte $66 ; | XX  XX | $FB4A
    .byte $3C ; |  XXXX  | $FB4B
    .byte $3C ; |  XXXX  | $FB4C
    .byte $66 ; | XX  XX | $FB4D
    .byte $66 ; | XX  XX | $FB4E
    .byte $3C ; |  XXXX  | $FB4F
    .byte $3C ; |  XXXX  | $FB50
    .byte $46 ; | X   XX | $FB51
    .byte $06 ; |     XX | $FB52
    .byte $3E ; |  XXXXX | $FB53
    .byte $66 ; | XX  XX | $FB54
    .byte $66 ; | XX  XX | $FB55
    .byte $66 ; | XX  XX | $FB56
    .byte $3C ; |  XXXX  | $FB57
LFB58:
    .byte $1D ; |   XXX X| $FB58
    .byte $3D ; |  XXXX X| $FB59
LFB5A:
    .byte $8B ; |X   X XX| $FB5A
    .byte $00 ; |        | $FB5B
LFB5C:
    .byte $A3 ; |X X   XX| $FB5C
    .byte $A3 ; |X X   XX| $FB5D
    .byte $A3 ; |X X   XX| $FB5E
    .byte $A3 ; |X X   XX| $FB5F
    .byte $00 ; |        | $FB60
    .byte $00 ; |        | $FB61
    .byte $00 ; |        | $FB62
    .byte $00 ; |        | $FB63
LFB64:
    .byte $00 ; |        | $FB64
    .byte $38 ; |  XXX   | $FB65
    .byte $38 ; |  XXX   | $FB66
    .byte $3E ; |  XXXXX | $FB67
    .byte $3E ; |  XXXXX | $FB68
    .byte $3A ; |  XXX X | $FB69
    .byte $7A ; | XXXX X | $FB6A
    .byte $7E ; | XXXXXX | $FB6B
    .byte $7E ; | XXXXXX | $FB6C
LFB6D:
    .byte $00 ; |        | $FB6D
    .byte $FB ; |XXXXX XX| $FB6E
    .byte $FB ; |XXXXX XX| $FB6F
    .byte $FB ; |XXXXX XX| $FB70
    .byte $E9 ; |XXX X  X| $FB71
    .byte $E8 ; |XXX X   | $FB72
    .byte $E8 ; |XXX X   | $FB73
    .byte $EB ; |XXX X XX| $FB74
    .byte $EB ; |XXX X XX| $FB75
LFB76:
    .byte $00 ; |        | $FB76
    .byte $EF ; |XXX XXXX| $FB77
    .byte $EF ; |XXX XXXX| $FB78
    .byte $EF ; |XXX XXXX| $FB79
    .byte $04 ; |     X  | $FB7A
    .byte $82 ; |X     X | $FB7B
    .byte $41 ; | X     X| $FB7C
    .byte $EF ; |XXX XXXX| $FB7D
    .byte $EF ; |XXX XXXX| $FB7E
LFB7F:
    .byte $00 ; |        | $FB7F
    .byte $8C ; |X   XX  | $FB80
    .byte $8C ; |X   XX  | $FB81
    .byte $BC ; |X XXXX  | $FB82
    .byte $3E ; |  XXXXX | $FB83
    .byte $3A ; |  XXX X | $FB84
    .byte $3A ; |  XXX X | $FB85
    .byte $BA ; |X XXX X | $FB86
    .byte $BA ; |X XXX X | $FB87
LFB88:
    .byte $00 ; |        | $FB88
    .byte $01 ; |       X| $FB89
    .byte $02 ; |      X | $FB8A
    .byte $03 ; |      XX| $FB8B
    .byte $04 ; |     X  | $FB8C
    .byte $05 ; |     X X| $FB8D
    .byte $06 ; |     XX | $FB8E
LFB8F:
    .byte $9E ; |X  XXXX | $FB8F
    .byte $0F ; |    XXXX| $FB90
    .byte $1F ; |   XXXXX| $FB91
    .byte $0F ; |    XXXX| $FB92
    .byte $3F ; |  XXXXXX| $FB93
    .byte $9E ; |X  XXXX | $FB94
    .byte $1F ; |   XXXXX| $FB95
LFB96:
    .byte $FF ; |XXXXXXXX| $FB96
    .byte $00 ; |        | $FB97
    .byte $00 ; |        | $FB98
    .byte $01 ; |       X| $FB99
    .byte $00 ; |        | $FB9A
    .byte $FF ; |XXXXXXXX| $FB9B
    .byte $02 ; |      X | $FB9C
LFB9D:
    .byte $50 ; | X X    | $FB9D
    .byte $18 ; |   XX   | $FB9E
    .byte $10 ; |   X    | $FB9F
    .byte $20 ; |  X     | $FBA0
    .byte $48 ; | X  X   | $FBA1
    .byte $30 ; |  XX    | $FBA2
    .byte $20 ; |  X     | $FBA3
    .byte $40 ; | X      | $FBA4
    .byte $18 ; |   XX   | $FBA5
    .byte $20 ; |  X     | $FBA6
    .byte $40 ; | X      | $FBA7
    .byte $28 ; |  X X   | $FBA8
    .byte $38 ; |  XXX   | $FBA9
    .byte $18 ; |   XX   | $FBAA
    .byte $48 ; | X  X   | $FBAB
    .byte $18 ; |   XX   | $FBAC
LFBAD:
    .byte $05 ; |     X X| $FBAD
    .byte $02 ; |      X | $FBAE
    .byte $07 ; |     XXX| $FBAF
    .byte $04 ; |     X  | $FBB0
    .byte $08 ; |    X   | $FBB1
    .byte $03 ; |      XX| $FBB2
    .byte $01 ; |       X| $FBB3
    .byte $06 ; |     XX | $FBB4
LFBB5:
    .byte $03 ; |      XX| $FBB5
    .byte $08 ; |    X   | $FBB6
    .byte $01 ; |       X| $FBB7
    .byte $07 ; |     XXX| $FBB8
    .byte $05 ; |     X X| $FBB9
    .byte $06 ; |     XX | $FBBA
    .byte $08 ; |    X   | $FBBB
    .byte $02 ; |      X | $FBBC
LFBBD:
    .byte $01 ; |       X| $FBBD
    .byte $03 ; |      XX| $FBBE
    .byte $05 ; |     X X| $FBBF
    .byte $02 ; |      X | $FBC0
    .byte $08 ; |    X   | $FBC1
    .byte $04 ; |     X  | $FBC2
    .byte $06 ; |     XX | $FBC3
    .byte $07 ; |     XXX| $FBC4
LFBC5:
    .byte $01 ; |       X| $FBC5
    .byte $03 ; |      XX| $FBC6
    .byte $04 ; |     X  | $FBC7
    .byte $02 ; |      X | $FBC8
    .byte $05 ; |     X X| $FBC9
    .byte $03 ; |      XX| $FBCA
    .byte $02 ; |      X | $FBCB
    .byte $04 ; |     X  | $FBCC
LFBCD:
    .byte $05 ; |     X X| $FBCD
    .byte $04 ; |     X  | $FBCE
    .byte $05 ; |     X X| $FBCF
    .byte $07 ; |     XXX| $FBD0
    .byte $06 ; |     XX | $FBD1
    .byte $04 ; |     X  | $FBD2
    .byte $03 ; |      XX| $FBD3
    .byte $06 ; |     XX | $FBD4
    
  REPEAT ($FFFC - *)
    .byte 0
  REPEND
    
    
;LFBD5:
;    .byte $FF,$0A,$66,$C9,$05,$C9,$26,$C9,$85,$EE,$60,$A5,$CB,$0A,$45,$CB
;    .byte $0A,$0A,$26,$CB,$A5,$CB,$29,$07,$A8,$B9,$6A,$FE,$25,$CB,$60,$A9
;    .byte $09,$85,$AF,$A9,$0A,$85,$9B,$A9,$03,$85,$98,$A5,$84,$38,$E9,$02
;    .byte $29,$06,$18,$69,$04,$85,$99,$A2,$0F,$A9,$FF,$95,$88,$CA,$10,$FB
;    .byte $A9,$7F,$85,$8E,$A9,$FE,$85,$8A,$A9,$3C,$85,$9A,$A5,$E7,$09,$80
;    .byte $85,$E7,$A9,$3C,$85,$E4,$A2,$04,$A9,$4C,$95,$B1,$A0,$1E,$94,$B6
;    .byte $A0,$00,$94,$BB,$CA,$10,$F3,$A9,$3C,$85,$B6,$A9,$80,$85,$BB,$60
;    .byte $86,$E1,$A2,$00,$A5,$E6,$10,$01,$E8,$F8,$18,$B5,$CC,$79,$06,$FF
;    .byte $95,$CC,$B5,$CE,$79,$0C,$FF,$95,$CE,$B5,$D0,$69,$00,$95,$D0,$D8
;    .byte $A6,$E1,$60,$8A,$F0,$02,$A9,$40,$99,$D2,$00,$BD,$1B,$FF,$99,$D3
;    .byte $00,$BD,$EC,$FE,$99,$D4,$00,$60,$A9,$00,$A2,$05,$95,$CC,$CA,$10
;    .byte $FB,$85,$98,$85,$AC,$60,$B5,$BB,$29,$10,$D0,$18,$D6,$B6,$D0,$67
;    .byte $B5,$BB,$30,$04,$A9,$00,$F0,$02,$A9,$5B,$95,$B6,$B5,$BB,$09,$10
;    .byte $95,$BB,$D0,$53,$B5,$BB,$2A,$B0,$52,$10,$37,$F6,$B6,$B5,$B6,$C9
;    .byte $0B,$D0,$12,$A9,$00,$95,$B6,$A9,$0B,$99,$D8,$00,$B5,$BB,$29,$0F
;    .byte $09,$80,$95,$BB,$60,$C9,$06,$10,$13,$99,$DB,$00,$AA,$18,$BD,$0D
;    .byte $FF,$BE,$19,$FF,$75,$DD,$95,$DD,$A9,$08,$D0,$02,$B5,$B6,$99,$D8
;    .byte $00,$60,$F6,$B6,$A9,$5B,$D5,$B6,$D0,$F2,$B5,$BB,$29,$0F,$09,$60
;    .byte $95,$BB,$B9,$25,$FF,$95,$B6,$A9,$70,$D0,$E3,$30,$16,$D6,$B6,$A9
;    .byte $51,$D5,$B6,$D0,$D7,$A9,$46,$95,$B6,$B5,$BB,$29,$0F,$09,$C0,$95
;    .byte $BB,$D0,$E4,$D6,$B6,$10,$96,$B5,$BB,$29,$0F,$09,$A0,$95,$BB,$D0
;    .byte $D1,$B5,$BB,$29,$0F,$09,$30,$95,$BB,$A9,$51,$D0,$0A,$B5,$BB,$29
;    .byte $0F,$09,$F0,$95,$BB,$A9,$0B,$95,$B6,$60,$08,$0A,$28,$2A,$88,$8A
;    .byte $A8,$AA,$00,$40,$10,$50,$04,$44,$14,$54,$01,$41,$11,$51,$05,$45
;    .byte $15,$55,$00,$80,$20,$A0,$01,$05,$11,$15,$41,$45,$51,$55,$80,$A0
;    .byte $88,$A8,$82,$A2,$8A,$AA,$00,$02,$08,$0A,$20,$22,$28,$2A,$80,$82
;    .byte $88,$8A,$A0,$A2,$A8,$AA,$08,$88,$28,$A8,$09,$89,$29,$A9,$80,$81
;    .byte $84,$85,$90,$91,$94,$95,$AA,$FF,$FF,$FF,$99,$DD,$7E,$3C,$55,$FF
;    .byte $FF,$FF,$99,$BB,$7E,$3C,$AA,$FF,$FF,$FF,$BB,$99,$7E,$3C,$55,$FF
;    .byte $FF,$FF,$DD,$99,$7E,$3C,$8B,$93,$9B,$A3,$38,$7C,$FE,$FE,$FE,$6C
;    .byte $38,$7C,$FE,$E0,$FE,$6C,$38,$7E,$E0,$C0,$E0,$6C,$38,$AF,$B5,$BB
;    .byte $B5,$00,$00,$00,$00,$E7,$A5,$E7,$00,$3C,$7E,$C3,$C3,$E7,$66,$24
;    .byte $18,$3C,$7E,$E7,$E7,$C3,$C3,$3C,$7E,$E7,$C3,$00,$00,$00,$FF,$7E
;    .byte $00,$00,$00,$00,$00,$14,$08,$14,$00,$00,$22,$14,$00,$14,$22,$00
;    .byte $41,$00,$41,$00,$22,$F3,$EE,$E8,$E8,$E3,$E3,$DC,$DC,$D5,$D5,$CE
;    .byte $CE,$CE,$AF,$AF,$AF,$10,$10,$08,$00,$08,$C9,$39,$C9,$CF,$80,$20
;    .byte $01,$00,$45,$00,$29,$00,$0D,$60,$11,$00,$15,$20,$00,$80,$60,$19
;    .byte $00,$1D,$03,$00,$67,$00,$80,$20,$0B,$00,$00,$6F,$00,$13,$20,$17
;    .byte $40,$1B,$00,$3F,$00,$80,$80,$40,$01,$00,$25,$00,$49,$00,$80,$60
;    .byte $0D,$00,$11,$40,$15,$00,$79,$00,$1D,$00,$00,$03,$60,$07,$00,$4B
;    .byte $00,$0F,$00,$73,$00,$80,$40,$17,$20,$1B,$00,$5F,$00,$80,$10,$50
;    .byte $90,$D0,$40,$00,$C0,$80,$40,$20,$10,$08,$04,$02,$01,$02,$03,$05
;    .byte $07,$08,$0A,$0C,$08,$0C,$03,$07,$0B,$0F,$02,$06,$0A,$0E,$01,$05
;    .byte $09,$0D,$00,$04,$79,$85,$B5,$A5,$B5,$85,$79,$17,$15,$15,$77,$55
;    .byte $55,$77,$41,$41,$41,$41,$41,$41,$40,$49,$49,$49,$C9,$49,$49,$BE
;    .byte $55,$55,$55,$D9,$55,$55,$99,$3C,$66,$66,$66,$66,$66,$3C,$66,$66
;    .byte $7C,$60,$62,$3C,$66,$66,$3C,$66,$66,$3C,$46,$06,$3E,$66,$66,$3C
;    .byte $46,$06,$0C,$06,$46,$3C,$0C,$0C,$7E,$4C,$2C,$1C,$0C,$18,$18,$08
;    .byte $04,$02,$62,$7E,$60,$60,$3C,$06,$46,$7C,$46,$06,$7C,$60,$60,$7E
;    .byte $18,$18,$18,$18,$78,$38,$00,$00,$00,$00,$00,$00,$00,$01,$05,$15
;    .byte $55,$AC,$E4,$D8,$C4,$CB,$DE,$B2,$D2,$B8,$BE,$EB,$A5,$9E,$97,$90
;    .byte $89,$20,$40,$80,$60,$01,$05,$00,$00,$00,$01,$00,$00,$01,$06,$05
;    .byte $04,$03,$02,$01,$00,$02,$00,$00,$80,$A0,$A8,$AA,$AA,$AA,$AA,$AA
;    .byte $10,$40,$08,$0A,$0C,$0E,$FC,$EC,$DC,$CC,$7A,$5A,$FB,$84,$F7,$44
;    .byte $C4,$0E,$0E,$0E,$0E,$09,$04,$0F,$00,$07,$04,$0A,$90,$F0,$B9,$E9
;    .byte $FF,$25,$E8,$D0,$0A,$B9,$6E,$FE,$85,$E8,$B9,$ED,$FF,$85,$E9,$60
;    .byte $A5,$E8,$4A,$90,$0D,$A9,$04,$85,$D3,$A5,$E9,$29,$1F,$A8,$49,$0F
;    .byte $B0,$1B,$4A,$90,$04,$A9,$0D,$D0,$11,$4A,$90,$03,$4C,$6A,$FF,$4A
;    .byte $90,$1C,$A0,$09,$84,$D3,$A5,$E9,$D0,$03,$A8,$85,$D3,$D6,$E9,$D0
;    .byte $05,$A9,$00,$85,$E8,$60,$95,$19,$A5,$D3,$95,$15,$94,$17,$60,$A9
;    .byte $08,$24,$E7,$50,$0C,$A5,$E4,$85,$19,$4A,$85,$17,$A9,$04,$85,$15
;    .byte $60,$F0,$2B,$A5,$E4,$D0,$06,$A9,$F7,$25,$E7,$85,$E7,$4A,$4A,$4A
;    .byte $29,$07,$AA,$E0,$04,$10,$2C,$BD,$F1,$FF,$85,$17,$BD,$F5,$FF,$85
;    .byte $18,$A9,$04,$85,$15,$85,$16,$A9,$08,$85,$19,$85,$1A,$60,$A5,$9A
;    .byte $0A,$10,$10,$A9,$04,$85,$D3,$A5,$80,$4A,$29,$0F,$A8,$49,$0F,$4A
;    .byte $4C,$8B,$FF,$60,$07,$03,$01,$00,$09,$18,$10,$30,$08,$04,$0C,$04
;    .byte $14,$18,$14,$18,$00,$00,$00

       ORG $FFFC

    .word START,START
