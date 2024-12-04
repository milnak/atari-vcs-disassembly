; Disassembly of gamma.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: ultrastella -pasfcGamma.cfg gamma.bin
;
; Gamma.cfg contents:
;
;      ORG F000
;      CODE F000 F5FF
;      CODE F600 F698
;      GFX F699 F6FF
;      CODE F700 F742
;      CODE F743 F762
;      GFX F763 F7FF

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
ENAM1   =  $1E
HMP0    =  $20
HMP1    =  $21
HMM1    =  $23
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
$2E     =  $2E
INPT5   =  $3D

; Read TIA Baseline = $00
CXM1P   =  $01

SWCHA   =  $0280
SWCHB   =  $0282
SWBCNT  =  $0283
INTIM   =  $0284
TIM64T  =  $0296

       ORG $F000

START:
    sei
    cld
    lda    #0
    tax
.loopClear:
    sta    0,X
    inx
    bne    .loopClear

    lda    #$10                  ; 2
    sta    SWBCNT                ; 4
    lda    #$80                  ; 2
    sta    $87                   ; 3
    lda    #1                    ; 2
    sta    $80                   ; 3
    sta    $B4                   ; 3
LF019:
    lda    #$38                  ; 2
    sta    $D4                   ; 3
    sta    $C4                   ; 3
    adc    #4                    ; 2
    sta    $C3                   ; 3
    ldx    #$17                  ; 2
LF025:
    lda    LF7BE,X               ; 4
    sta    $E2,X                 ; 4
    dex                          ; 2
    bpl    LF025                 ; 2³
    ldx    #4                    ; 2
    stx    $84                   ; 3
LF031:
    lda    LF7E1,X               ; 4
    sta    $DD,X                 ; 4
    dex                          ; 2
    bpl    LF031                 ; 2³
    ldy    #1                    ; 2
    ldx    #2                    ; 2
LF03D:
    sty    $D3,X                 ; 4
    adc    #8                    ; 2
    sta    $C3,X                 ; 4
    inx                          ; 2
    cpx    #8                    ; 2
    bne    LF03D                 ; 2³
    lda    #$10                  ; 2
    sta    $CC                   ; 3
    sta    $85                   ; 3
    lda    #0                    ; 2
    sta    $B3                   ; 3
LF052:
    lda    #2                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    sta    CTRLPF                ; 3
    lda    #0                    ; 2
    inc    $88                   ; 5
    bpl    LF06C                 ; 2³
    inc    $87                   ; 5
    sta    $88                   ; 3
LF06C:
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    sta    $DA                   ; 3
    lda    #$4F                  ; 2
    sta    TIM64T                ; 4
    ldx    #$FF                  ; 2
    txs                          ; 2
    jsr    LF1AC                 ; 6
    lda    $E0                   ; 3
    sta    COLUP1                ; 3
    sta    CXCLR                 ; 3
    sta    $2E                   ; 3
LF089:
    lda    INTIM                 ; 4
    bne    LF089                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    $FF                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    tax                          ; 2
    lda    $DC                   ; 3
    and    #$02                  ; 2
    beq    LF0A9                 ; 2³
    lda    $E1                   ; 3
    bne    LF0AB                 ; 2³
LF0A9:
    lda    $DF                   ; 3
LF0AB:
    sta    COLUP0                ; 3
    sta    COLUBK                ; 3
LF0AF:
    lda    $A9,X                 ; 4
    sta    PF1                   ; 3
    lda    $AE,X                 ; 4
    sta    PF2                   ; 3
    inx                          ; 2
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $FF                   ; 3
    clc                          ; 2
    adc    #2                    ; 2
    sta    $FF                   ; 3
    cpx    #5                    ; 2
    bne    LF0AF                 ; 2³
    lda    #0                    ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    CTRLPF                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    tay                          ; 2
    sta    $A7                   ; 3
    sta    $FE                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMCLR                 ; 3
    lda    $E1                   ; 3
    sta    COLUP1                ; 3
    lda    #$EE                  ; 2
    sta    $A8                   ; 3
    lda    #$F7                  ; 2
    sta    $FD                   ; 3
    lda    #$F6                  ; 2
    sta    $FB                   ; 3
    bne    LF13E                 ; 3+1   always branch
    
LF0EE:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    inc    $A7                   ; 5
LF0F4:
    lda    LF69E,Y               ; 4
    sta    GRP0                  ; 3
    beq    LF0FC                 ; 2³
    iny                          ; 2
LF0FC:
    lda    $FF                   ; 3
    and    #$03                  ; 2
    bne    LF11C                 ; 2³
    ldx    $A8                   ; 3
    bmi    LF11C                 ; 2³
    lda    $E2,X                 ; 4
    sta    PF0                   ; 3
    lda    $EA,X                 ; 4
    sta    PF1                   ; 3
    lda    $F2,X                 ; 4
    sta    PF2                   ; 3
    lda    LF7E6,X               ; 4
    clc                          ; 2
    adc    $DD                   ; 3
    sta    COLUPF                ; 3
    dec    $A8                   ; 5
LF11C:
    inc    $FF                   ; 5
    ldx    $FE                   ; 3
    sta    HMCLR                 ; 3
    lda    $DA                   ; 3
    beq    LF12A                 ; 2³
    lda    #$20                  ; 2
    sta    HMM1                  ; 3
LF12A:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LF69E,Y               ; 4
    sta    GRP0                  ; 3
    beq    LF134                 ; 2³
    iny                          ; 2
LF134:
    lda    LF7A7,X               ; 4
    sta    GRP1                  ; 3
    beq    LF13C                 ; 2³
    inx                          ; 2
LF13C:
    stx    $FE                   ; 3
LF13E:
    ldx    $A7                   ; 3
    lda    $8B,X                 ; 4
    beq    LF14F                 ; 2³
    cmp    $FF                   ; 3
    bpl    LF1A5                 ; 2³
    lda    $99,X                 ; 4
    sta    $FA                   ; 3
    jmp.ind ($00FA)              ; 5

LF14F:
    lda    #$4A                  ; 2
    cmp    $FF                   ; 3
    bne    LF1A5                 ; 2³
    lda    $DD                   ; 3
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #1                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    $E1                   ; 3
    sta    COLUP0                ; 3
    ldx    #0                    ; 2
    stx    ENAM1                 ; 3
    ldy    #8                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
LF16D:
    dey                          ; 2
    bne    LF16D                 ; 2³
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
LF174:
    ldy    #4                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
LF178:
    dey                          ; 2
    bne    LF178                 ; 2³
    lda    LF78B,X               ; 4
    sta    GRP0                  ; 3
    lda    LF792,X               ; 4
    sta    GRP1                  ; 3
    lda    LF799,X               ; 4
    ldy    LF7A0,X               ; 4
    nop                          ; 2
    sta    GRP0                  ; 3
    sty    GRP1                  ; 3
    inx                          ; 2
    cpx    #7                    ; 2
    bne    LF174                 ; 2³
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    ldx    #$14                  ; 2
LF19D:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LF19D                 ; 2³
    jmp    LF052                 ; 3

LF1A5:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jmp    LF0F4                 ; 3

LF1AC:
    lda    $88                   ; 3
    and    #$01                  ; 2
    beq    LF1B5                 ; 2³
    jmp    LF4CD                 ; 3

LF1B5:
    lda    SWCHB                 ; 4
    ror                          ; 2
    bcs    LF1D2                 ; 2³
    lda    $CA                   ; 3
    bne    LF1F7                 ; 2³
    lda    #1                    ; 2
    sta    $87                   ; 3
    sta    $CA                   ; 3
    lda    #0                    ; 2
    sta    $81                   ; 3
    sta    $B4                   ; 3
    lda    $80                   ; 3
    sta    $86                   ; 3
    jmp    LF019                 ; 3

LF1D2:
    ldx    #0                    ; 2
    stx    $CA                   ; 3
    ror                          ; 2
    bcs    LF1F7                 ; 2³
    lda    $88                   ; 3
    and    #$3E                  ; 2
    cmp    #$3E                  ; 2
    bne    LF1F7                 ; 2³
    lda    #$80                  ; 2
    sta    $87                   ; 3
    lda    #0                    ; 2
    sta    $B3                   ; 3
    inc    $80                   ; 5
    lda    $80                   ; 3
    cmp    #5                    ; 2
    bne    LF1F5                 ; 2³
    lda    #1                    ; 2
    sta    $80                   ; 3
LF1F5:
    sta    $B4                   ; 3
LF1F7:
    lda    $87                   ; 3
    and    #$80                  ; 2
    beq    LF20C                 ; 2³+1
    lda    #$80                  ; 2
    sta    $87                   ; 3
    lda    $88                   ; 3
    bne    LF20C                 ; 2³
    ldx    #4                    ; 2
LF207:
    inc    $DD,X                 ; 6
    dex                          ; 2
    bpl    LF207                 ; 2³
LF20C:
    lda    $D4                   ; 3
    cmp    #2                    ; 2
    beq    LF21A                 ; 2³
    and    #$01                  ; 2
    tax                          ; 2
    lda    LF7F3,X               ; 4
    sta    $D4                   ; 3
LF21A:
    lda    SWCHA                 ; 4
    and    #$0F                  ; 2
    ror                          ; 2
    bcs    LF22A                 ; 2³
    ldx    $CC                   ; 3
    cpx    $85                   ; 3
    bmi    LF22A                 ; 2³
    dec    $CC                   ; 5
LF22A:
    ror                          ; 2
    bcs    LF235                 ; 2³
    ldx    $CC                   ; 3
    cpx    #$28                  ; 2
    bpl    LF235                 ; 2³
    inc    $CC                   ; 5
LF235:
    ror                          ; 2
    bcs    LF23C                 ; 2³
    ldx    #$7F                  ; 2
    stx    $83                   ; 3
LF23C:
    ror                          ; 2
    bcs    LF243                 ; 2³
    ldx    #$80                  ; 2
    stx    $83                   ; 3
LF243:
    lda    #0                    ; 2
    ldx    #$0E                  ; 2
LF247:
    sta    $8B,X                 ; 4
    dex                          ; 2
    bne    LF247                 ; 2³
    ldx    #0                    ; 2
    stx    $A7                   ; 3
    ldy    #0                    ; 2
    sty    $A8                   ; 3
    lda    $D4                   ; 3
    cmp    #2                    ; 2
    bne    LF25D                 ; 2³
    iny                          ; 2
    bne    LF29A                 ; 3   always branch
    
LF25D:
    lda    $DC                   ; 3
    beq    LF267                 ; 2³
    lda    #4                    ; 2
    sta    $CB                   ; 3
    bne    LF275                 ; 3   always branch
    
LF267:
    lda    INPT5                 ; 3
    bmi    LF284                 ; 2³
    lda    $82                   ; 3
    bne    LF275                 ; 2³
    lda    #1                    ; 2
    sta    $82                   ; 3
    stx    $CB                   ; 3
LF275:
    lda    $CB                   ; 3
    cmp    #4                    ; 2
    beq    LF289                 ; 2³
    inc    $CB                   ; 5
    ldy    $CB                   ; 3
    lda    LF699,Y               ; 4
    bne    LF28B                 ; 2³   always branch?
    
LF284:
    stx    $82                   ; 3
    jmp    LF275                 ; 3

LF289:
    lda    $CC                   ; 3
LF28B:
    sta    $8B,X                 ; 4
    ldy    #0                    ; 2
    lda    #<LF60D               ; 2
    sta    $99                   ; 3
    lda    $C3                   ; 3
    jsr    LF743                 ; 6
    inx                          ; 2
    iny                          ; 2
LF29A:
    lda    #<LF65F               ; 2
    sta    $99,X                 ; 4
    lda    $CC                   ; 3
    sta    $8B,X                 ; 4
    inx                          ; 2
    lda    $D4                   ; 3
    cmp    #2                    ; 2
    beq    LF2B8                 ; 2³
    lda    $CC                   ; 3
    cmp    $8B                   ; 3
    beq    LF2B8                 ; 2³
    adc    #6                    ; 2
    sta    $8B,X                 ; 4
    lda    #<LF670               ; 2
    sta    $99,X                 ; 4
    inx                          ; 2
LF2B8:
    iny                          ; 2
    sty    $8A                   ; 3
    lda    $C5                   ; 3
    cmp    #$40                  ; 2
    bpl    LF2C7                 ; 2³
    lda    $CD                   ; 3
    cmp    #$13                  ; 2
    bpl    LF2FE                 ; 2³
LF2C7:
    lda    #$40                  ; 2
    and    $88                   ; 3
    bne    LF2D3                 ; 2³
    lda    #0                    ; 2
    sta    $D2                   ; 3
    beq    LF32D                 ; 3+1   always branch
    
LF2D3:
    lda    #4                    ; 2
    sta    $D2                   ; 3
    lda    $DB                   ; 3
    cmp    #6                    ; 2
    bne    LF2E1                 ; 2³
    lda    #2                    ; 2
    sta    $DB                   ; 3
LF2E1:
    inc    $DB                   ; 5
    ldy    $DB                   ; 3
    lda.wy $D3,Y                 ; 4
    cmp    #$10                  ; 2
    beq    LF32D                 ; 2³+1
    cmp    #1                    ; 2
    beq    LF32D                 ; 2³+1
    lda.wy $C3,Y                 ; 4
    and    #$7F                  ; 2
    adc    #4                    ; 2
    sta    $C5                   ; 3
    lda.wy $CB,Y                 ; 4
    sta    $CD                   ; 3
LF2FE:
    lda    $CD                   ; 3
    sec                          ; 2
    sbc    $86                   ; 3
    sta    $CD                   ; 3
    sta    $8B,X                 ; 4
    lda    $83                   ; 3
    beq    LF318                 ; 2³
    bmi    LF314                 ; 2³
    inc    $C5                   ; 5
    inc    $C5                   ; 5
    jmp    LF318                 ; 3

LF314:
    dec    $C5                   ; 5
    dec    $C5                   ; 5
LF318:
    clc                          ; 2
    lda    $C5                   ; 3
    adc    $86                   ; 3
    sta    $C5                   ; 3
    ldy    $8A                   ; 3
    jsr    LF743                 ; 6
    lda    #1                    ; 2
    sta    $D5                   ; 3
    lda    #<LF614               ; 2
    sta    $99,X                 ; 4
    inx                          ; 2
LF32D:
    ldy    $8A                   ; 3
    iny                          ; 2
    stx    $A7                   ; 3
    sty    $A8                   ; 3
    ldy    #0                    ; 2
    sty    $8A                   ; 3
LF338:
    ldy    $8A                   ; 3
    lda.wy $D6,Y                 ; 4
    cmp    #1                    ; 2
    bne    LF352                 ; 2³
    lda.wy $C6,Y                 ; 4
    cmp    #$48                  ; 2
    bmi    LF352                 ; 2³
    lda    $83                   ; 3
    bmi    LF364                 ; 2³
    lda    LF7DC,Y               ; 4
LF34F:
    sta.wy $D6,Y                 ; 5
LF352:
    lda    $83                   ; 3
    beq    LF370                 ; 2³
    bpl    LF3AA                 ; 2³
    lda.wy $C6,Y                 ; 4
    sec                          ; 2
    sbc    #2                    ; 2
    sta.wy $C6,Y                 ; 5
    jmp    LF370                 ; 3

LF364:
    lda    #1                    ; 2
    bne    LF34F                 ; 3   always branch
    
LF368:
    lda    #$48                  ; 2
    bne    LF3C1                 ; 3   always branch
    
LF36C:
    lda    #1                    ; 2
    bne    LF3C1                 ; 3   always branch
    
LF370:
    lda    $B4                   ; 3
    and    #$03                  ; 2
    cmp    $8A                   ; 3
    bne    LF386                 ; 2³
    lda    $B3                   ; 3
    and    #$01                  ; 2
    bne    LF382                 ; 2³
    lda    #2                    ; 2
    bne    LF388                 ; 3   always branch
    
LF382:
    lda    #3                    ; 2
    bne    LF388                 ; 3   always branch
    
LF386:
    lda    #1                    ; 2
LF388:
    sta    $89                   ; 3
    lda    $B4                   ; 3
    and    #$01                  ; 2
    beq    LF396                 ; 2³
    lda    $89                   ; 3
    eor    #$FF                  ; 2
    sta    $89                   ; 3
LF396:
    ldy    $86                   ; 3
    lda    LF7EE,Y               ; 4
    ldy    $8A                   ; 3
    and    $88                   ; 3
    bne    LF3B6                 ; 2³
    lda.wy $C6,Y                 ; 4
    clc                          ; 2
    adc    $89                   ; 3
    jmp    LF3B9                 ; 3

LF3AA:
    lda.wy $C6,Y                 ; 4
    clc                          ; 2
    adc    #2                    ; 2
    sta.wy $C6,Y                 ; 5
    jmp    LF370                 ; 3

LF3B6:
    lda.wy $C6,Y                 ; 4
LF3B9:
    cmp    #$4B                  ; 2
    bpl    LF36C                 ; 2³
    cmp    #1                    ; 2
    bmi    LF368                 ; 2³
LF3C1:
    sta.wy $C6,Y                 ; 5
    ldy    $A8                   ; 3
    jsr    LF743                 ; 6
    ldy    $8A                   ; 3
    lda    LF7D6,Y               ; 4
    sta.wy $CE,Y                 ; 5
    sta    $8B,X                 ; 4
    lda.wy $D6,Y                 ; 4
    beq    LF3E6                 ; 2³
    cmp    #$13                  ; 2
    beq    LF3E2                 ; 2³
    cmp    #$1C                  ; 2
    beq    LF3E6                 ; 2³
    bne    LF3F4                 ; 3   always branch
    
LF3E2:
    lda    #$1C                  ; 2
    bne    LF3E8                 ; 3   always branch
    
LF3E6:
    lda    #$13                  ; 2
LF3E8:
    sta.wy $D6,Y                 ; 5
    lda    $DC                   ; 3
    bne    LF3F4                 ; 2³
    lda    #$10                  ; 2
    sta.wy $D6,Y                 ; 5
LF3F4:
    lda    LF7B3,Y               ; 4
    sta    $99,X                 ; 4
    inx                          ; 2
    iny                          ; 2
    inc    $A8                   ; 5
    inc    $8A                   ; 5
    lda    $8A                   ; 3
    cmp    #4                    ; 2
    beq    LF408                 ; 2³
    jmp    LF338                 ; 3

LF408:
    stx    $A7                   ; 3
    lda    $84                   ; 3
    bne    LF438                 ; 2³
    lda    $DC                   ; 3
    bne    LF438                 ; 2³
    ldy    #3                    ; 2
    lda    #1                    ; 2
LF416:
    sta.wy $D3,Y                 ; 5
    iny                          ; 2
    cpy    #7                    ; 2
    bne    LF416                 ; 2³
    lda    #4                    ; 2
    sta    $84                   ; 3
    inc    $81                   ; 5
    ldy    $80                   ; 3
    lda    $81                   ; 3
    and    #$0F                  ; 2
    cmp    #8                    ; 2
    beq    LF434                 ; 2³
    and    #$04                  ; 2
    bne    LF435                 ; 2³
    beq    LF436                 ; 3   always branch
    
LF434:
    iny                          ; 2
LF435:
    iny                          ; 2
LF436:
    sty    $86                   ; 3
LF438:
    ldy    #1                    ; 2
    lda.wy $C3,Y                 ; 4
    jsr    LF743                 ; 6
    lda    $CD                   ; 3
    sec                          ; 2
    sbc    $CC                   ; 3
    bmi    LF464                 ; 2³
    cmp    #4                    ; 2
    bpl    LF464                 ; 2³
    lda    $C5                   ; 3
    sec                          ; 2
    sbc    $C4                   ; 3
    bmi    LF464                 ; 2³
    cmp    #8                    ; 2
    bpl    LF464                 ; 2³
    lda    $D4                   ; 3
    cmp    #2                    ; 2
    beq    LF464                 ; 2³
    lda    #$1F                  ; 2
    sta    $DC                   ; 3
    lda    #$4E                  ; 2
    sta    $E0                   ; 3
LF464:
    lda    $E0                   ; 3
    cmp    #$4E                  ; 2
    bne    LF488                 ; 2³
    lda    $DC                   ; 3
    bne    LF488                 ; 2³
    lda    #$2C                  ; 2
    sta    $E0                   ; 3
    lda    $85                   ; 3
    adc    #4                    ; 2
    sta    $85                   ; 3
    lda    $CC                   ; 3
    adc    #4                    ; 2
    cmp    #$28                  ; 2
    bmi    LF486                 ; 2³
    lda    #2                    ; 2
    sta    $D4                   ; 3
    lda    #$28                  ; 2
LF486:
    sta    $CC                   ; 3
LF488:
    ldx    $A7                   ; 3
    ldy    #0                    ; 2
LF48C:
    lda    LF7B7,Y               ; 4
    beq    LF49C                 ; 2³
    sta    $8B,X                 ; 4
    lda    LF7BB,Y               ; 4
    sta    $99,X                 ; 4
    inx                          ; 2
    iny                          ; 2
    bne    LF48C                 ; 2³
LF49C:
    ldy    #0                    ; 2
    sty    $A7                   ; 3
LF4A0:
    lda.wy $8C,Y                 ; 4
    beq    LF4C8                 ; 2³
    cmp.wy $8B,Y                 ; 4
    bpl    LF4C1                 ; 2³
    beq    LF4C1                 ; 2³
    tax                          ; 2
    lda.wy $8B,Y                 ; 4
    sta.wy $8C,Y                 ; 5
    stx    $8B,Y                 ; 4
    ldx    $9A,Y                 ; 4
    lda.wy $99,Y                 ; 4
    sta.wy $9A,Y                 ; 5
    stx    $99,Y                 ; 4
    inc    $A7                   ; 5
LF4C1:
    cpy    #9                    ; 2
    beq    LF4C8                 ; 2³
    iny                          ; 2
    bne    LF4A0                 ; 3   always branch
    
LF4C8:
    lda    $A7                   ; 3
    bne    LF49C                 ; 2³
    rts                          ; 6

LF4CD:
    lda    CXM1P                 ; 3
    and    #$80                  ; 2
    beq    LF500                 ; 2³+1
    ldx    $CB                   ; 3
    lda    $D5,X                 ; 4
    cmp    #$2D                  ; 2
    bne    LF500                 ; 2³+1
    lda    #$1F                  ; 2
    sta    $DC                   ; 3
    sta    $82                   ; 3
    dec    $84                   ; 5
    lda    $84                   ; 3
    adc    #1                    ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    $84                   ; 3
    sed                          ; 2
    clc                          ; 2
    adc    $B4                   ; 3
    sta    $B4                   ; 3
    lda    $B3                   ; 3
    adc    #0                    ; 2
    sta    $B3                   ; 3
    cld                          ; 2
    lda    #0                    ; 2
    sta    $CB                   ; 3
    sta    $D5,X                 ; 4
LF500:
    lda    $87                   ; 3
    and    #$80                  ; 2
    beq    LF50E                 ; 2³
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    beq    LF548                 ; 3   always branch
    
LF50E:
    lda    $DC                   ; 3
    beq    LF526                 ; 2³
    dec    $DC                   ; 5
    cmp    #$0F                  ; 2
    bmi    LF526                 ; 2³
    lda    $DC                   ; 3
    sta    AUDV0                 ; 3
    lda    #$0F                  ; 2
    sta    AUDC0                 ; 3
    lda    #$14                  ; 2
    sta    AUDF0                 ; 3
    bne    LF548                 ; 3   always branch
    
LF526:
    lda    INPT5                 ; 3
    bpl    LF530                 ; 2³
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    beq    LF53A                 ; 3   always branch
    
LF530:
    lda    #8                    ; 2
    sta    AUDV0                 ; 3
    sta    $87                   ; 3
    sta    AUDC0                 ; 3
    sta    AUDF0                 ; 3
LF53A:
    lda    $D2                   ; 3
    sta    AUDV1                 ; 3
    lda    $CD                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDF1                 ; 3
    lda    #3                    ; 2
    sta    AUDC1                 ; 3
LF548:
    lda    $83                   ; 3
    bne    LF54E                 ; 2³
    beq    LF58A                 ; 3   always branch
    
LF54E:
    bpl    LF56B                 ; 2³
    ldx    #0                    ; 2
    stx    $83                   ; 3
LF554:
    lda    $E2,X                 ; 4
    and    #$10                  ; 2
    beq    LF55D                 ; 2³
    sec                          ; 2
    bne    LF55E                 ; 3   always branch
    
LF55D:
    clc                          ; 2
LF55E:
    ror    $F2,X                 ; 6
    rol    $EA,X                 ; 6
    ror    $E2,X                 ; 6
    inx                          ; 2
    cpx    #8                    ; 2
    bne    LF554                 ; 2³
    beq    LF58A                 ; 3   always branch
    
LF56B:
    ldx    #0                    ; 2
    stx    $83                   ; 3
LF56F:
    lda    $F2,X                 ; 4
    rol                          ; 2
    bcc    LF57A                 ; 2³
    lda    #8                    ; 2
    ora    $E2,X                 ; 4
    bcs    LF57E                 ; 3   always branch
    
LF57A:
    lda    $E2,X                 ; 4
    and    #$F0                  ; 2
LF57E:
    rol                          ; 2
    sta    $E2,X                 ; 4
    ror    $EA,X                 ; 6
    rol    $F2,X                 ; 6
    inx                          ; 2
    cpx    #8                    ; 2
    bne    LF56F                 ; 2³
LF58A:
    ldy    #0                    ; 2
    sty    $A7                   ; 3
LF58E:
    ldx    #0                    ; 2
    stx    $A8                   ; 3
LF592:
    lda    $B4                   ; 3
    cpx    #2                    ; 2
    bmi    LF5A1                 ; 2³
    bne    LF5A7                 ; 2³
LF59A:
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    jmp    LF5A7                 ; 3

LF5A1:
    lda    $B3                   ; 3
    cpx    #1                    ; 2
    bne    LF59A                 ; 2³
LF5A7:
    and    #$0F                  ; 2
    tax                          ; 2
    cpy    #4                    ; 2
    beq    LF5BB                 ; 2³
    lda    LF763,X               ; 4
    cpy    #0                    ; 2
LF5B3:
    beq    LF5BE                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    dey                          ; 2
    jmp    LF5B3                 ; 3

LF5BB:
    lda    LF773,X               ; 4
LF5BE:
    and    #$03                  ; 2
    ldx    $A8                   ; 3
    cpx    #2                    ; 2
    bmi    LF5C9                 ; 2³
    clc                          ; 2
    adc    #4                    ; 2
LF5C9:
    tay                          ; 2
    lda    LF783,Y               ; 4
    sta    $FA,X                 ; 4
    inc    $A8                   ; 5
    ldx    $A8                   ; 3
    ldy    $A7                   ; 3
    cpx    #4                    ; 2
    bne    LF592                 ; 2³
    lda    $FA                   ; 3
    and    #$F0                  ; 2
    sta    $FA                   ; 3
    lda    $FB                   ; 3
    and    #$0F                  ; 2
    ora    $FA                   ; 3
    sta.wy $A9,Y                 ; 5
    lda    $FC                   ; 3
    and    #$0F                  ; 2
    sta    $FC                   ; 3
    lda    $FD                   ; 3
    and    #$F0                  ; 2
    ora    $FC                   ; 3
    sta.wy $AE,Y                 ; 5
    inc    $A7                   ; 5
    ldy    $A7                   ; 3
    cpy    #5                    ; 2
    bne    LF58E                 ; 2³
    rts                          ; 6

LF600:  ; indirect jump
    lda    $DE                   ; 3
    sta    COLUBK                ; 3
    jmp    LF0EE                 ; 3

LF607:  ; indirect jump
    lda    #7                    ; 2
    sta    $A8                   ; 3
    bne    LF611                 ; 3   always branch

LF60D:  ; indirect jump
    lda    #0                    ; 2
    sta    ENAM1                 ; 3
LF611:
    jmp    LF0EE                 ; 3

LF614:  ; indirect jump
    lda    $88                   ; 3
    and    #$01                  ; 2
    beq    LF611                 ; 2³
    lda    $D5                   ; 3
    sta    $FE                   ; 3
    jmp    LF0EE                 ; 3

    ldx    #0                    ; 2
LF623:
    lda    $B5,X                 ; 4
    sta    HMP0                  ; 3
    lda    $BC,X                 ; 4
    sta    $FC                   ; 3
    ldx    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    jmp.ind ($00FC)              ; 5

LF632:  ; indirect jump
    lda    $88                   ; 3
    and    #$01                  ; 2
    beq    LF63C                 ; 2³
    ldx    #2                    ; 2
    bne    LF64C                 ; 3   always branch
    
LF63C:
    ldx    #0                    ; 2
    lda    $B5,X                 ; 4
    sta    HMM1                  ; 3
    lda    #$27                  ; 2
    sta    NUSIZ1                ; 3
    lda    $BC,X                 ; 4
    ldx    #3                    ; 2
    bne    LF658                 ; 3   always branch
    
LF64C:
    lda    $B5,X                 ; 4
    sta    HMP1                  ; 3
    lda    #0                    ; 2
    sta    NUSIZ1                ; 3
    lda    $BC,X                 ; 4
    ldx    #1                    ; 2
LF658:
    sta    $FC                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jmp.ind ($00FC)              ; 5

LF65F:  ; indirect jump
    ldy    $D4                   ; 3
    lda    $E0                   ; 3
    sta    COLUP0                ; 3
    ldx    #1                    ; 2
    stx    $DA                   ; 3
    lda    #5                    ; 2
    sta    NUSIZ0                ; 3
    jmp    LF623                 ; 3

LF670:  ; indirect jump
    lda    $88                   ; 3
    and    #$01                  ; 2
    bne    LF611                 ; 2³
    lda    #2                    ; 2
    sta    ENAM1                 ; 3
    bne    LF611                 ; 3   always branch

LF67C:  ; indirect jump
    ldy    $D6                   ; 3
    ldx    #3                    ; 2
    bne    LF692                 ; 3   always branch

LF682:  ; indirect jump
    ldy    $D7                   ; 3
    ldx    #4                    ; 2
    bne    LF692                 ; 3   always branch

LF688:  ; indirect jump
    ldy    $D8                   ; 3
    ldx    #5                    ; 2
    bne    LF692                 ; 3   always branch

LF68E:  ; indirect jump
    ldy    $D9                   ; 3
    ldx    #6                    ; 2
LF692:
    lda    $DD                   ; 3
    sta    COLUP0                ; 3
    jmp    LF623                 ; 3

LF699:
    .byte $2E ; |  X XXX | $F699
    .byte $35 ; |  XX X X| $F69A
    .byte $3B ; |  XXX XX| $F69B
    .byte $42 ; | X    X | $F69C
    .byte $45 ; | X   X X| $F69D
LF69E:
    .byte $00 ; |        | $F69E
    .byte $00 ; |        | $F69F
    .byte $63 ; | XX   XX| $F6A0
    .byte $14 ; |   X X  | $F6A1
    .byte $3E ; |  XXXXX | $F6A2
    .byte $2A ; |  X X X | $F6A3
    .byte $3E ; |  XXXXX | $F6A4
    .byte $1C ; |   XXX  | $F6A5
    .byte $3E ; |  XXXXX | $F6A6
    .byte $73 ; | XXX  XX| $F6A7
    .byte $67 ; | XX  XXX| $F6A8
    .byte $3E ; |  XXXXX | $F6A9
    .byte $1C ; |   XXX  | $F6AA
    .byte $3E ; |  XXXXX | $F6AB
    .byte $3E ; |  XXXXX | $F6AC
    .byte $77 ; | XXX XXX| $F6AD
    .byte $00 ; |        | $F6AE
    .byte $00 ; |        | $F6AF
    .byte $00 ; |        | $F6B0
    .byte $3C ; |  XXXX  | $F6B1
    .byte $66 ; | XX  XX | $F6B2
    .byte $C3 ; |XX    XX| $F6B3
    .byte $99 ; |X  XX  X| $F6B4
    .byte $99 ; |X  XX  X| $F6B5
    .byte $C3 ; |XX    XX| $F6B6
    .byte $66 ; | XX  XX | $F6B7
    .byte $3C ; |  XXXX  | $F6B8
    .byte $00 ; |        | $F6B9
    .byte $81 ; |X      X| $F6BA
    .byte $18 ; |   XX   | $F6BB
    .byte $3C ; |  XXXX  | $F6BC
    .byte $66 ; | XX  XX | $F6BD
    .byte $66 ; | XX  XX | $F6BE
    .byte $3C ; |  XXXX  | $F6BF
    .byte $18 ; |   XX   | $F6C0
    .byte $81 ; |X      X| $F6C1
    .byte $00 ; |        | $F6C2
    .byte $11 ; |   X   X| $F6C3
    .byte $22 ; |  X   X | $F6C4
    .byte $74 ; | XXX X  | $F6C5
    .byte $78 ; | XXXX   | $F6C6
    .byte $FF ; |XXXXXXXX| $F6C7
    .byte $AB ; |X X X XX| $F6C8
    .byte $7E ; | XXXXXX | $F6C9
    .byte $00 ; |        | $F6CA
    .byte $01 ; |       X| $F6CB
    .byte $06 ; |     XX | $F6CC
    .byte $7A ; | XXXX X | $F6CD
    .byte $F4 ; |XXXX X  | $F6CE
    .byte $68 ; | XX X   | $F6CF
    .byte $7C ; | XXXXX  | $F6D0
    .byte $FF ; |XXXXXXXX| $F6D1
    .byte $AB ; |X X X XX| $F6D2
    .byte $7E ; | XXXXXX | $F6D3
    .byte $00 ; |        | $F6D4
    .byte $18 ; |   XX   | $F6D5
    .byte $3C ; |  XXXX  | $F6D6
    .byte $7E ; | XXXXXX | $F6D7
    .byte $FF ; |XXXXXXXX| $F6D8
    .byte $55 ; | X X X X| $F6D9
    .byte $55 ; | X X X X| $F6DA
    .byte $FF ; |XXXXXXXX| $F6DB
    .byte $7E ; | XXXXXX | $F6DC
    .byte $3C ; |  XXXX  | $F6DD
    .byte $18 ; |   XX   | $F6DE
    .byte $00 ; |        | $F6DF
    .byte $18 ; |   XX   | $F6E0
    .byte $3C ; |  XXXX  | $F6E1
    .byte $7E ; | XXXXXX | $F6E2
    .byte $FF ; |XXXXXXXX| $F6E3
    .byte $AA ; |X X X X | $F6E4
    .byte $AA ; |X X X X | $F6E5
    .byte $FF ; |XXXXXXXX| $F6E6
    .byte $7E ; | XXXXXX | $F6E7
    .byte $3C ; |  XXXX  | $F6E8
    .byte $18 ; |   XX   | $F6E9
    .byte $00 ; |        | $F6EA
    .byte $00 ; |        | $F6EB
    .byte $99 ; |X  XX  X| $F6EC
    .byte $99 ; |X  XX  X| $F6ED
    .byte $9B ; |X  XX XX| $F6EE
    .byte $99 ; |X  XX  X| $F6EF
    .byte $9D ; |X  XXX X| $F6F0
    .byte $BF ; |X XXXXXX| $F6F1
    .byte $DB ; |XX XX XX| $F6F2
    .byte $99 ; |X  XX  X| $F6F3
    .byte $99 ; |X  XX  X| $F6F4
    .byte $99 ; |X  XX  X| $F6F5
    .byte $99 ; |X  XX  X| $F6F6
    .byte $9D ; |X  XXX X| $F6F7
    .byte $89 ; |X   X  X| $F6F8
    .byte $D9 ; |XX XX  X| $F6F9
    .byte $91 ; |X  X   X| $F6FA
    .byte $99 ; |X  XX  X| $F6FB
    .byte $19 ; |   XX  X| $F6FC
    .byte $91 ; |X  X   X| $F6FD
    .byte $99 ; |X  XX  X| $F6FE
    .byte $99 ; |X  XX  X| $F6FF
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    lda    $88                   ; 3
    sta    RESP0,X               ; 4
    jmp    LF0EE                 ; 3
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF743 SUBROUTINE
    clc                          ; 2
    adc    #$10                  ; 2
    asl                          ; 2
    sta    $FA                   ; 3
    eor    #$FF                  ; 2
    and    #$F8                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta.wy $BC,Y                 ; 5
    lda    $FA                   ; 3
    and    #$07                  ; 2
    eor    #$FF                  ; 2
    sec                          ; 2
    adc    #0                    ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta.wy $B5,Y                 ; 5
    rts                          ; 6
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF763:
    .byte $FC ; |XXXXXX  | $F763
    .byte $55 ; | X X X X| $F764
    .byte $84 ; |X    X  | $F765
    .byte $44 ; | X   X  | $F766
    .byte $4F ; | X  XXXX| $F767
    .byte $48 ; | X  X   | $F768
    .byte $C8 ; |XX  X   | $F769
    .byte $54 ; | X X X  | $F76A
    .byte $CC ; |XX  XX  | $F76B
    .byte $4C ; | X  XX  | $F76C
    .byte $CC ; |XX  XX  | $F76D
    .byte $CA ; |XX  X X | $F76E
    .byte $A8 ; |X X X   | $F76F
    .byte $C5 ; |XX   X X| $F770
    .byte $88 ; |X   X   | $F771
    .byte $88 ; |X   X   | $F772
LF773:
    .byte $00 ; |        | $F773
    .byte $01 ; |       X| $F774
    .byte $00 ; |        | $F775
    .byte $00 ; |        | $F776
    .byte $01 ; |       X| $F777
    .byte $00 ; |        | $F778
    .byte $00 ; |        | $F779
    .byte $01 ; |       X| $F77A
    .byte $00 ; |        | $F77B
    .byte $01 ; |       X| $F77C
    .byte $03 ; |      XX| $F77D
    .byte $00 ; |        | $F77E
    .byte $00 ; |        | $F77F
    .byte $00 ; |        | $F780
    .byte $00 ; |        | $F781
    .byte $02 ; |      X | $F782
LF783:
    .byte $EE ; |XXX XXX | $F783
    .byte $22 ; |  X   X | $F784
    .byte $88 ; |X   X   | $F785
    .byte $AA ; |X X X X | $F786
    .byte $77 ; | XXX XXX| $F787
    .byte $44 ; | X   X  | $F788
    .byte $11 ; |   X   X| $F789
    .byte $55 ; | X X X X| $F78A
LF78B:
    .byte $38 ; |  XXX   | $F78B
    .byte $44 ; | X   X  | $F78C
    .byte $BA ; |X XXX X | $F78D
    .byte $A2 ; |X X   X | $F78E
    .byte $BA ; |X XXX X | $F78F
    .byte $44 ; | X   X  | $F790
    .byte $38 ; |  XXX   | $F791
LF792:
    .byte $F7 ; |XXXX XXX| $F792
    .byte $85 ; |X    X X| $F793
    .byte $85 ; |X    X X| $F794
    .byte $85 ; |X    X X| $F795
    .byte $B7 ; |X XX XXX| $F796
    .byte $95 ; |X  X X X| $F797
    .byte $F5 ; |XXXX X X| $F798
LF799:
    .byte $22 ; |  X   X | $F799
    .byte $36 ; |  XX XX | $F79A
    .byte $36 ; |  XX XX | $F79B
    .byte $3E ; |  XXXXX | $F79C
    .byte $2A ; |  X X X | $F79D
    .byte $22 ; |  X   X | $F79E
    .byte $22 ; |  X   X | $F79F
LF7A0:
    .byte $77 ; | XXX XXX| $F7A0
    .byte $51 ; | X X   X| $F7A1
    .byte $51 ; | X X   X| $F7A2
    .byte $77 ; | XXX XXX| $F7A3
    .byte $51 ; | X X   X| $F7A4
    .byte $51 ; | X X   X| $F7A5
    .byte $77 ; | XXX XXX| $F7A6
LF7A7:
    .byte $00 ; |        | $F7A7
    .byte $01 ; |       X| $F7A8
    .byte $04 ; |     X  | $F7A9
    .byte $10 ; |   X    | $F7AA
    .byte $40 ; | X      | $F7AB
    .byte $00 ; |        | $F7AC
    .byte $00 ; |        | $F7AD
    .byte $03 ; |      XX| $F7AE
    .byte $0C ; |    XX  | $F7AF
    .byte $30 ; |  XX    | $F7B0
    .byte $C0 ; |XX      | $F7B1
    .byte $00 ; |        | $F7B2
LF7B3:
    .byte <LF67C         ; $F7B3
    .byte <LF682         ; $F7B4
    .byte <LF688         ; $F7B5
    .byte <LF68E         ; $F7B6
LF7B7:
    .byte $0C ; |    XX  | $F7B7
    .byte $11 ; |   X   X| $F7B8
    .byte $2D ; |  X XX X| $F7B9
    .byte $00 ; |        | $F7BA
LF7BB:
    .byte <LF632         ; $F7BB
    .byte <LF607         ; $F7BC
    .byte <LF600         ; $F7BD
LF7BE:
    .byte $00 ; |        | $F7BE
    .byte $F0 ; |XXXX    | $F7BF
    .byte $70 ; | XXX    | $F7C0
    .byte $30 ; |  XX    | $F7C1
    .byte $30 ; |  XX    | $F7C2
    .byte $30 ; |  XX    | $F7C3
    .byte $10 ; |   X    | $F7C4
    .byte $00 ; |        | $F7C5
    .byte $00 ; |        | $F7C6
    .byte $FF ; |XXXXXXXX| $F7C7
    .byte $3F ; |  XXXXXX| $F7C8
    .byte $3F ; |  XXXXXX| $F7C9
    .byte $1F ; |   XXXXX| $F7CA
    .byte $0F ; |    XXXX| $F7CB
    .byte $0F ; |    XXXX| $F7CC
    .byte $06 ; |     XX | $F7CD
    .byte $00 ; |        | $F7CE
    .byte $FF ; |XXXXXXXX| $F7CF
    .byte $E7 ; |XXX  XXX| $F7D0
    .byte $C7 ; |XX   XXX| $F7D1
    .byte $C3 ; |XX    XX| $F7D2
    .byte $81 ; |X      X| $F7D3
    .byte $80 ; |X       | $F7D4
    .byte $00 ; |        | $F7D5
LF7D6:
    .byte $30 ; |  XX    | $F7D6
    .byte $36 ; |  XX XX | $F7D7
    .byte $3C ; |  XXXX  | $F7D8
    .byte $43 ; | X    XX| $F7D9
    .byte $50 ; | X X    | $F7DA
    .byte $00 ; |        | $F7DB
LF7DC:
    .byte $2D ; |  X XX X| $F7DC
    .byte $2D ; |  X XX X| $F7DD
    .byte $2D ; |  X XX X| $F7DE
    .byte $2D ; |  X XX X| $F7DF
    .byte $02 ; |      X | $F7E0
LF7E1:
    .byte $00 ; |        | $F7E1
    .byte $48 ; | X  X   | $F7E2
    .byte $62 ; | XX   X | $F7E3
    .byte $2C ; |  X XX  | $F7E4
    .byte $0F ; |    XXXX| $F7E5
LF7E6:
    .byte $40 ; | X      | $F7E6
    .byte $40 ; | X      | $F7E7
    .byte $42 ; | X    X | $F7E8
    .byte $42 ; | X    X | $F7E9
    .byte $44 ; | X   X  | $F7EA
    .byte $44 ; | X   X  | $F7EB
    .byte $46 ; | X   XX | $F7EC
    .byte $46 ; | X   XX | $F7ED
LF7EE:
    .byte $43 ; | X    XX| $F7EE
    .byte $43 ; | X    XX| $F7EF
    .byte $03 ; |      XX| $F7F0
    .byte $23 ; |  X   XX| $F7F1
    .byte $21 ; |  X    X| $F7F2
LF7F3:
    .byte $37 ; |  XX XXX| $F7F3
    .byte $42 ; | X    X | $F7F4
    .byte $01 ; |       X| $F7F5
    .byte $21 ; |  X    X| $F7F6
    .byte $42 ; | X    X | $F7F7
    .byte $82 ; |X     X | $F7F8
    .byte $21 ; |  X    X| $F7F9

       ORG $F7FA

    .word START,START,START