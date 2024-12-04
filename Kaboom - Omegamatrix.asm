; Disassembly of kab.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasfckab.cfg kab.bin 
;
; kab.cfg contents:
;
;      ORG F000
;      CODE F000 F651
;      GFX F652 F7FF

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
RESP0   =  $10
RESP1   =  $11
AUDC0   =  $15
AUDF0   =  $17
AUDV0   =  $19
GRP0    =  $1B
GRP1    =  $1C
HMP0    =  $20
HMP1    =  $21
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C

; Read TIA Baseline = $00
CXPPMM  =  $07
INPT0   =  $08

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

       ORG $F000

START:
    sei                          ; 2
    cld                          ; 2
    ldx    #0                    ; 2
    txa                          ; 2
LF005:
    sta    VSYNC,X               ; 4
    txs                          ; 2
    inx                          ; 2
    bne    LF005                 ; 2³
    jmp    LF3C1                 ; 3
LF00E:
    ldx    #$12                  ; 2
LF010:
    lda    LF672,X               ; 4
    ldy    $AE                   ; 3
    cpy    #$20                  ; 2
    bcc    LF023                 ; 2³
    ldy    $AC                   ; 3
    bne    LF025                 ; 2³
    cpx    #4                    ; 2
    bcc    LF025                 ; 2³
    lda    $82                   ; 3
LF023:
    eor    $AE                   ; 3
LF025:
    eor    $83                   ; 3
    and    $84                   ; 3
    sta    $85,X                 ; 4
    dex                          ; 2
    bpl    LF010                 ; 2³
    sta    COLUBK                ; 3
    ldx    $A0                   ; 3
    lda    $87,X                 ; 4
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
LF038:
    lda    INTIM                 ; 4
    bne    LF038                 ; 2³
    sta    WSYNC                 ; 3
    sta    VBLANK                ; 3
    sta    COLUPF                ; 3
    lda    #$35                  ; 2
    sta    CTRLPF                ; 3
    sta    PF0                   ; 3
    ldy    #3                    ; 2
    sty    NUSIZ0                ; 3
    sty    NUSIZ1                ; 3
    ldy    #7                    ; 2
    sty    VDELP0                ; 3
    sty    VDELP1                ; 3
LF055:
    sty    $87                   ; 3
    lda    ($FE),Y               ; 5
    sta    $88                   ; 3
    sta    WSYNC                 ; 3
    lda    ($F4),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($F6),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($F8),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($FC),Y               ; 5
    tax                          ; 2
    lda    ($FA),Y               ; 5
    ldy    $88                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    ldy    $87                   ; 3
    dey                          ; 2
    bpl    LF055                 ; 2³
    iny                          ; 2
    lda    $BB                   ; 3
    sta    $FA                   ; 3
    lda    $B2                   ; 3
    sta    WSYNC                 ; 3
    sty    VDELP0                ; 3
    sty    VDELP1                ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    REFP0                 ; 3
    sta    HMP0                  ; 3
    and    #$07                  ; 2
    tax                          ; 2
LF095:
    dex                          ; 2
    bpl    LF095                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
    sty    NUSIZ1                ; 3
    sty    $F9                   ; 3
    sty    NUSIZ0                ; 3
    lda    $99                   ; 3
    sta    HMP1                  ; 3
    and    #$07                  ; 2
    tax                          ; 2
    lda    $B1                   ; 3
LF0AB:
    dex                          ; 2
    bpl    LF0AB                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    ldx    #$1F                  ; 2
    ora    #$20                  ; 2
    tay                          ; 2
    lda    $A3                   ; 3
    cmp    #1                    ; 2
    ror    $88                   ; 5
    bmi    LF0C9                 ; 2³
    lda    $AE                   ; 3
    bne    LF0EF                 ; 2³
    lda    $A1                   ; 3
    beq    LF0EF                 ; 2³
LF0C9:
    lda    LF652,X               ; 4
    eor    $83                   ; 3
    and    $84                   ; 3
    sta    WSYNC                 ; 3
    sta    COLUP1                ; 3
    lda    LF6D3,X               ; 4
    cpx    #$16                  ; 2
    bne    LF0DD                 ; 2³
    lda    #$6C                  ; 2
LF0DD:
    bcs    LF0E7                 ; 2³
    lda    #$6C                  ; 2
    bit    $88                   ; 3
    bmi    LF0E7                 ; 2³
    lda    #$54                  ; 2
LF0E7:
    sta    GRP1                  ; 3
    dey                          ; 2
    dex                          ; 2
    cpx    #$15                  ; 2
    bcs    LF0C9                 ; 2³
LF0EF:
    lda    LF652,X               ; 4
    eor    $83                   ; 3
    and    $84                   ; 3
    cpx    #3                    ; 2
    bne    LF103                 ; 2³+1
    lda    $86                   ; 3
    sta    WSYNC                 ; 3
    sta    COLUBK                ; 3
    jmp    LF10C                 ; 3
LF103:
    sta    WSYNC                 ; 3
    sta    COLUP1                ; 3
    lda    LF6D3,X               ; 4
    sta    GRP1                  ; 3
LF10C:
    lda.wy $88,Y                 ; 4
    sta    COLUP0                ; 3
    lda    $F9                   ; 3
    sta    GRP0                  ; 3
    dey                          ; 2
    cpy    #$10                  ; 2
    bcs    LF11E                 ; 2³
    lda    ($FA),Y               ; 5
    sta    $F9                   ; 3
LF11E:
    dex                          ; 2
    bpl    LF0EF                 ; 2³+1
    lda    SWCHB                 ; 4
    ldx    $A0                   ; 3
    bne    LF129                 ; 2³
    asl                          ; 2
LF129:
    asl                          ; 2
    lda    #0                    ; 2
    sta    $F6                   ; 3
    bcs    LF132                 ; 2³
    lda    #5                    ; 2
LF132:
    sta    WSYNC                 ; 3
    sta    NUSIZ1                ; 3
    lda.wy $88,Y                 ; 4
    sta    COLUP0                ; 3
    lda    $F9                   ; 3
    sta    GRP0                  ; 3
    lda    #0                    ; 2
    sta    GRP1                  ; 3
    sta    CXCLR                 ; 3
    bcc    LF149                 ; 2³
    lda    #$0A                  ; 2
LF149:
    clc                          ; 2
    adc    #$6C                  ; 2
    sta    $F5                   ; 3
    adc    #6                    ; 2
    sta    $F7                   ; 3
    lda    #$55                  ; 2
    sta    $87                   ; 3
    dey                          ; 2
    bmi    LF17A                 ; 2³
LF159:
    cpy    #$10                  ; 2
    bcc    LF164                 ; 2³
    sta    WSYNC                 ; 3
    dec    $87                   ; 5
    dey                          ; 2
    bne    LF159                 ; 2³
LF164:
    lda    ($FA),Y               ; 5
    sta    WSYNC                 ; 3
    sta    GRP0                  ; 3
    lda.wy $88,Y                 ; 4
    sta    COLUP0                ; 3
    dec    $87                   ; 5
    lda    INPT0,X               ; 4
    bmi    LF177                 ; 2³
    dec    $F7                   ; 5
LF177:
    dey                          ; 2
    bpl    LF164                 ; 2³
LF17A:
    sta    WSYNC                 ; 3
    inc    $F6                   ; 5
    ldy    $F6                   ; 3
    lda.wy $B2,Y                 ; 4
    sta    HMP0                  ; 3
    sta    REFP0                 ; 3
    and    #$07                  ; 2
    tay                          ; 2
LF18A:
    dey                          ; 2
    bpl    LF18A                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
    ldy    $F6                   ; 3
    lda.wy $BB,Y                 ; 4
    sta    $FA                   ; 3
    nop                          ; 2
    lda    $98                   ; 3
    sta    HMP1                  ; 3
    and    #$07                  ; 2
    tay                          ; 2
LF1A0:
    dey                          ; 2
    bpl    LF1A0                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    ldy    #$0F                  ; 2
    lda    ($FA),Y               ; 5
    sta    GRP0                  ; 3
    lda.wy $88,Y                 ; 4
    sta    COLUP0                ; 3
    lda    INPT0,X               ; 4
    bmi    LF1BA                 ; 2³
    dec    $F7                   ; 5
LF1BA:
    dey                          ; 2
    sta    HMCLR                 ; 3
LF1BD:
    lda    $F6                   ; 3
    cmp    $AC                   ; 3
    bne    LF1C8                 ; 2³
    lda    $82                   ; 3
    sta.wy $88,Y                 ; 5
LF1C8:
    lda    ($FA),Y               ; 5
    sta    WSYNC                 ; 3
    sta    GRP0                  ; 3
    lda.wy $88,Y                 ; 4
    sta    COLUP0                ; 3
LF1D3:
    dec    $87                   ; 5
    beq    LF209                 ; 2³+1
    lda    INPT0,X               ; 4
    bmi    LF1DD                 ; 2³
    dec    $F7                   ; 5
LF1DD:
    dey                          ; 2
    bpl    LF1BD                 ; 2³
    inc    $F6                   ; 5
    ldy    $F6                   ; 3
    lda.wy $BB,Y                 ; 4
    sta    WSYNC                 ; 3
    nop                          ; 2
    sta    $FA                   ; 3
    sty    $F8                   ; 3
    lda.wy $B2,Y                 ; 4
    sta    HMP0                  ; 3
    sta    REFP0                 ; 3
    and    #$07                  ; 2
    tay                          ; 2
LF1F8:
    dey                          ; 2
    bpl    LF1F8                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    ldy    #$10                  ; 2
    dec    $87                   ; 5
    beq    LF210                 ; 2³
    bne    LF1D3                 ; 2³+1
LF209:
    ldx    #$30                  ; 2
    dey                          ; 2
    bmi    LF254                 ; 2³
    bpl    LF21F                 ; 2³
LF210:
    dey                          ; 2
    ldx    #$2F                  ; 2
LF213:
    stx    $88                   ; 3
    ldx    $A0                   ; 3
    lda    INPT0,X               ; 4
    bmi    LF21D                 ; 2³
    dec    $F7                   ; 5
LF21D:
    ldx    $88                   ; 3
LF21F:
    lda    $F6                   ; 3
    cmp    $AC                   ; 3
    bne    LF236                 ; 2³
    lda    LF684,X               ; 4
    and    $84                   ; 3
    sta    WSYNC                 ; 3
    sta    COLUP1                ; 3
    lda.w  $82                   ; 4
    sta    COLUP0                ; 3
    jmp    LF246                 ; 3
LF236:
    lda    LF684,X               ; 4
    eor    $83                   ; 3
    and    $84                   ; 3
    sta    WSYNC                 ; 3
    sta    COLUP1                ; 3
    lda.wy $88,Y                 ; 4
    sta    COLUP0                ; 3
LF246:
    lda    $C3,X                 ; 4
    sta    GRP1                  ; 3
    lda    ($FA),Y               ; 5
    sta    GRP0                  ; 3
    dex                          ; 2
    beq    LF29A                 ; 2³
    dey                          ; 2
LF252:
    bpl    LF213                 ; 2³
LF254:
    inc    $F6                   ; 5
    ldy    $F6                   ; 3
    bit    CXPPMM                ; 3
    bmi    LF25E                 ; 2³
    sty    $F8                   ; 3
LF25E:
    lda.wy $BB,Y                 ; 4
    sta    $FA                   ; 3
    lda.wy $B2,Y                 ; 4
    sta    HMP0                  ; 3
    sta    REFP0                 ; 3
    and    #$07                  ; 2
    sta    WSYNC                 ; 3
    tay                          ; 2
    lda    LF684,X               ; 4
    eor    $83                   ; 3
    and    $84                   ; 3
    sta    COLUP1                ; 3
    lda    $C3,X                 ; 4
    sta    GRP1                  ; 3
LF27C:
    dey                          ; 2
    bpl    LF27C                 ; 2³
    sta    RESP0                 ; 3
    lda    LF683,X               ; 4
    eor    $83                   ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    dex                          ; 2
    beq    LF29C                 ; 2³
    and    $84                   ; 3
    sta    COLUP1                ; 3
    lda    $C3,X                 ; 4
    sta    GRP1                  ; 3
    ldy    #$0F                  ; 2
    dex                          ; 2
    bne    LF252                 ; 2³
LF29A:
    sta    WSYNC                 ; 3
LF29C:
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    lda    $83                   ; 3
    and    $84                   ; 3
    sta    WSYNC                 ; 3
    sta.w  COLUBK                ; 4
    eor    #$88                  ; 2
    and    $84                   ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    stx    HMCLR                 ; 3
    stx    REFP0                 ; 3
    stx    REFP1                 ; 3
    lda    #$11                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    HMP1                  ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    ldx    #7                    ; 2
LF2C5:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    LF6B5,X               ; 4
    sta    GRP0                  ; 3
    lda    LF6BD,X               ; 4
    sta    GRP1                  ; 3
    jsr    LF651                 ; 6
    lda    LF6CD,X               ; 4
    tay                          ; 2
    lda    LF6C5,X               ; 4
    sta    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    HMCLR                 ; 3
    dex                          ; 2
    bpl    LF2C5                 ; 2³
    lda    #$21                  ; 2
    sta    TIM64T                ; 4
    ldx    SWCHA                 ; 4
    inx                          ; 2
    beq    LF2F3                 ; 2³
    sty    $9E                   ; 3
LF2F3:
    sec                          ; 2
    lda    $F7                   ; 3
    sbc    #5                    ; 2
    bpl    LF2FB                 ; 2³
    tya                          ; 2
LF2FB:
    sec                          ; 2
    sbc    $9D                   ; 3
    clc                          ; 2
    bpl    LF302                 ; 2³
    sec                          ; 2
LF302:
    ror                          ; 2
    cmp    #2                    ; 2
    bcc    LF30D                 ; 2³
    cmp    #$FE                  ; 2
    bcs    LF30D                 ; 2³
    sty    $9E                   ; 3
LF30D:
    clc                          ; 2
    adc    $9D                   ; 3
    cmp    $F5                   ; 3
    bcc    LF316                 ; 2³
    lda    $F5                   ; 3
LF316:
    sta    $9D                   ; 3
    jsr    LF63D                 ; 6
    sta    $98                   ; 3
    ldx    #$0F                  ; 2
LF31F:
    lda    LF7EC,X               ; 4
    sta    $C4,X                 ; 4
    sta    $D4,X                 ; 4
    sta    $E4,X                 ; 4
    ldy    $A1                   ; 3
    beq    LF334                 ; 2³
    dey                          ; 2
    beq    LF336                 ; 2³
    dey                          ; 2
    beq    LF338                 ; 2³
    bne    LF33A                 ; 2³
LF334:
    sty    $E4,X                 ; 4
LF336:
    sty    $D4,X                 ; 4
LF338:
    sty    $C4,X                 ; 4
LF33A:
    dex                          ; 2
    bpl    LF31F                 ; 2³
    ldy    $9C                   ; 3
    ldx    LF7E8,Y               ; 4
    lda    $AF                   ; 3
    asl                          ; 2
    and    #$18                  ; 2
    tay                          ; 2
    lda    #7                    ; 2
    sta    $F9                   ; 3
LF34C:
    lda    LF708,Y               ; 4
    sta    $CC,X                 ; 4
    iny                          ; 2
    inx                          ; 2
    dec    $F9                   ; 5
    bpl    LF34C                 ; 2³
LF357:
    lda    INTIM                 ; 4
    bne    LF357                 ; 2³
    ldy    #$82                  ; 2
    sty    WSYNC                 ; 3
    sty    VBLANK                ; 3
    sty    VSYNC                 ; 3
    sty    WSYNC                 ; 3
    sty    WSYNC                 ; 3
    sty    WSYNC                 ; 3
    sta    VSYNC                 ; 3
    inc    $81                   ; 5
    bne    LF377                 ; 2³
    inc    $9E                   ; 5
    bne    LF377                 ; 2³
    sec                          ; 2
    ror    $9E                   ; 5
LF377:
    ldy    #$FF                  ; 2
    lda    SWCHB                 ; 4
    and    #$08                  ; 2
    bne    LF382                 ; 2³
    ldy    #$0F                  ; 2
LF382:
    tya                          ; 2
    ldy    #0                    ; 2
    bit    $9E                   ; 3
    bpl    LF38D                 ; 2³
    and    #$F7                  ; 2
    ldy    $9E                   ; 3
LF38D:
    sty    $83                   ; 3
    asl    $83                   ; 5
    sta    $84                   ; 3
    lda    #$30                  ; 2
    sta    WSYNC                 ; 3
    sta    TIM64T                ; 4
    ldy    #0                    ; 2
    sty    $88                   ; 3
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcs    LF3B4                 ; 2³
    jsr    LF624                 ; 6
    stx    $AD                   ; 3
    asl    $80                   ; 5
    sec                          ; 2
    ror    $80                   ; 5
    lda    #3                    ; 2
    sta    $A1                   ; 3
    sta    $A6                   ; 3
LF3B4:
    lsr                          ; 2
    bcs    LF3D0                 ; 2³
    lda    $9F                   ; 3
    beq    LF3BF                 ; 2³
    dec    $9F                   ; 5
    bpl    LF3D2                 ; 2³
LF3BF:
    inc    $80                   ; 5
LF3C1:
    jsr    LF624                 ; 6
    lda    $80                   ; 3
    and    #$01                  ; 2
    sta    $80                   ; 3
    tay                          ; 2
    iny                          ; 2
    sty    $A5                   ; 3
    ldy    #$1E                  ; 2
LF3D0:
    sty    $9F                   ; 3
LF3D2:
    bit    $80                   ; 3
    bpl    LF3FA                 ; 2³
    lda    $A1                   ; 3
    bne    LF3E2                 ; 2³
    lda    $81                   ; 3
    and    #$7F                  ; 2
    bne    LF3FA                 ; 2³
    beq    LF42A                 ; 2³+1
LF3E2:
    lda    $AE                   ; 3
    beq    LF459                 ; 2³+1
    cmp    #$20                  ; 2
    bcc    LF41C                 ; 2³+1
    beq    LF3FD                 ; 2³
LF3EC:
    lda    $AE                   ; 3
    and    #$0C                  ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$B8                  ; 2
    ldx    $AC                   ; 3
    sta    $BB,X                 ; 4
    dec    $AE                   ; 5
LF3FA:
    jmp    LF59E                 ; 3
LF3FD:
    ldx    $AC                   ; 3
    lda    #0                    ; 2
    sta    $BB,X                 ; 4
LF403:
    lda    #$2B                  ; 2
    sta    $AE                   ; 3
    ldx    #8                    ; 2
    lda    $AB                   ; 3
    beq    LF40F                 ; 2³
    dec    $AB                   ; 5
LF40F:
    stx    $AC                   ; 3
    lda    $BB,X                 ; 4
    bne    LF3EC                 ; 2³+1
    dex                          ; 2
    bpl    LF40F                 ; 2³
    lda    #$20                  ; 2
    sta    $AE                   ; 3
LF41C:
    dec    $AE                   ; 5
    bne    LF3FA                 ; 2³+1
    lda    $B0                   ; 3
    bne    LF426                 ; 2³
    dec    $A1                   ; 5
LF426:
    lda    $A6                   ; 3
    beq    LF442                 ; 2³
LF42A:
    lda    $80                   ; 3
    lsr                          ; 2
    bcc    LF442                 ; 2³
    ldx    #4                    ; 2
LF431:
    ldy    $A1,X                 ; 4
    lda    $A6,X                 ; 4
    sta    $A1,X                 ; 4
    sty    $A6,X                 ; 4
    dex                          ; 2
    bpl    LF431                 ; 2³
    lda    $A0                   ; 3
    eor    #$01                  ; 2
    sta    $A0                   ; 3
LF442:
    ldx    $A2                   ; 3
    txa                          ; 2
    beq    LF451                 ; 2³
    dex                          ; 2
    stx    $A2                   ; 3
    lda    LF6F3,X               ; 4
    lsr                          ; 2
    clc                          ; 2
    adc    #1                    ; 2
LF451:
    sta    $AB                   ; 3
    ldx    #$FF                  ; 2
    stx    $AD                   ; 3
    bne    LF3FA                 ; 2³+1
LF459:
    bit    $AD                   ; 3
    bpl    LF471                 ; 2³
    lda    SWCHA                 ; 4
    ldx    $A0                   ; 3
    beq    LF465                 ; 2³
    asl                          ; 2
LF465:
    asl                          ; 2
    lda    #0                    ; 2
    bcs    LF46C                 ; 2³
    sta    $AD                   ; 3
LF46C:
    sta    $B1                   ; 3
    jmp    LF596                 ; 3
LF471:
    lda    $81                   ; 3
    and    #$0F                  ; 2
    bne    LF482                 ; 2³
    jsr    LF62E                 ; 6
    bcs    LF482                 ; 2³
    lda    $9B                   ; 3
    eor    #$FF                  ; 2
    sta    $9B                   ; 3
LF482:
    bit    $AD                   ; 3
    bvs    LF4B6                 ; 2³
    lda    $B1                   ; 3
    cmp    #$11                  ; 2
    bcs    LF4B6                 ; 2³
    cmp    #2                    ; 2
    bcc    LF4B6                 ; 2³
    lda    $A2                   ; 3
    bit    $9B                   ; 3
    bpl    LF499                 ; 2³
    eor    #$FF                  ; 2
    clc                          ; 2
LF499:
    adc    $9A                   ; 3
    cmp    #$F0                  ; 2
    bcc    LF4A5                 ; 2³
    ldx    #0                    ; 2
    lda    #5                    ; 2
    bne    LF4AD                 ; 2³
LF4A5:
    cmp    #$76                  ; 2
    bcc    LF4AF                 ; 2³
    ldx    #$FF                  ; 2
    lda    #$76                  ; 2
LF4AD:
    stx    $9B                   ; 3
LF4AF:
    sta    $9A                   ; 3
    jsr    LF63D                 ; 6
    sta    $99                   ; 3
LF4B6:
    bit    CXPPMM                ; 3
    bpl    LF512                 ; 2³+1
    ldx    $F8                   ; 3
    lda    #0                    ; 2
    sta    $BB,X                 ; 4
    ldy    #2                    ; 2
    cpx    #6                    ; 2
    bcc    LF4CA                 ; 2³
    beq    LF4C9                 ; 2³
    dey                          ; 2
LF4C9:
    dey                          ; 2
LF4CA:
    ldx    $A1                   ; 3
    cpx    #2                    ; 2
    beq    LF4D4                 ; 2³
    bcs    LF4D8                 ; 2³
    ldy    #2                    ; 2
LF4D4:
    tya                          ; 2
    bne    LF4D8                 ; 2³
    iny                          ; 2
LF4D8:
    sty    $9C                   ; 3
    lda    #$10                  ; 2
    sta    $AF                   ; 3
    sed                          ; 2
    clc                          ; 2
    lda    $A2                   ; 3
    adc    #1                    ; 2
    ldx    #2                    ; 2
    ldy    $A4                   ; 3
LF4E8:
    adc    $A3,X                 ; 4
    sta    $A3,X                 ; 4
    lda    #0                    ; 2
    dex                          ; 2
    bpl    LF4E8                 ; 2³
    cld                          ; 2
    bcc    LF4FE                 ; 2³
    sta    $A1                   ; 3
    lda    #$99                  ; 2
    sta    $A3                   ; 3
    sta    $A4                   ; 3
    sta    $A5                   ; 3
LF4FE:
    tya                          ; 2
    eor    $A4                   ; 3
    and    #$F0                  ; 2
    beq    LF512                 ; 2³
    ldx    $A1                   ; 3
    inx                          ; 2
    cpx    #4                    ; 2
    bcs    LF50E                 ; 2³
    stx    $A1                   ; 3
LF50E:
    lda    #$3F                  ; 2
    sta    $B0                   ; 3
LF512:
    ldx    $F6                   ; 3
    lda    $BB,X                 ; 4
    beq    LF528                 ; 2³
    ldx    #8                    ; 2
LF51A:
    lda    $BB,X                 ; 4
    beq    LF522                 ; 2³
    lda    #$78                  ; 2
    sta    $BB,X                 ; 4
LF522:
    dex                          ; 2
    bpl    LF51A                 ; 2³
    jmp    LF403                 ; 3
LF528:
    ldx    #8                    ; 2
LF52A:
    lda    $BB,X                 ; 4
    beq    LF53F                 ; 2³
    dec    $88                   ; 5
    jsr    LF62E                 ; 6
    eor    $81                   ; 3
    and    #$03                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$78                  ; 2
    sta    $BB,X                 ; 4
LF53F:
    dex                          ; 2
    bpl    LF52A                 ; 2³
    lda    $A2                   ; 3
    lsr                          ; 2
    clc                          ; 2
    adc    #1                    ; 2
    adc    $B1                   ; 3
    sta    $B1                   ; 3
    sec                          ; 2
    sbc    #$12                  ; 2
    bcc    LF59E                 ; 2³
    sta    $B1                   ; 3
    ldx    #7                    ; 2
LF555:
    lda    $B2,X                 ; 4
    sta    $B3,X                 ; 4
    lda    $BB,X                 ; 4
    sta    $BC,X                 ; 4
    dex                          ; 2
    bpl    LF555                 ; 2³
    lda    #0                    ; 2
    sta    $BB                   ; 3
    ldx    $A2                   ; 3
    bit    $AD                   ; 3
    bvc    LF579                 ; 2³
    lda    $88                   ; 3
    ora    $AF                   ; 3
    bne    LF59E                 ; 2³
    asl    $AD                   ; 5
    cpx    #7                    ; 2
    bcs    LF579                 ; 2³
    inx                          ; 2
    stx    $A2                   ; 3
LF579:
    txa                          ; 2
    lsr                          ; 2
    bcs    LF581                 ; 2³
    lda    $BC                   ; 3
    bne    LF59E                 ; 2³
LF581:
    inc    $AB                   ; 5
    lda    $AB                   ; 3
    cmp    LF6F3,X               ; 4
    bcc    LF592                 ; 2³
    lda    #0                    ; 2
    sta    $AB                   ; 3
    lda    #$7F                  ; 2
    sta    $AD                   ; 3
LF592:
    lda    $82                   ; 3
    and    #$08                  ; 2
LF596:
    ora    $99                   ; 3
    sta    $B2                   ; 3
    lda    #$78                  ; 2
    sta    $BB                   ; 3
LF59E:
    jsr    LF62E                 ; 6
    and    #$03                  ; 2
    tax                          ; 2
    ldy    #0                    ; 2
    lda    $88                   ; 3
    beq    LF5B2                 ; 2³
    txa                          ; 2
    lsr                          ; 2
    adc    #1                    ; 2
    sta    AUDV0                 ; 3
    ldy    #8                    ; 2
LF5B2:
    lda    $AF                   ; 3
    beq    LF5C5                 ; 2³
    ldy    #8                    ; 2
    dec    $AF                   ; 5
    cmp    #$0F                  ; 2
    bcc    LF5C2                 ; 2³
    ldy    #$0C                  ; 2
    sbc    $A2                   ; 3
LF5C2:
    tax                          ; 2
    sty    AUDV0                 ; 3
LF5C5:
    lda    $AE                   ; 3
    beq    LF5D8                 ; 2³
    ldy    #8                    ; 2
    ldx    #8                    ; 2
    adc    $AC                   ; 3
    cmp    #$20                  ; 2
    bcs    LF5D6                 ; 2³
    lsr                          ; 2
    ldx    #$1F                  ; 2
LF5D6:
    sta    AUDV0                 ; 3
LF5D8:
    lda    $B0                   ; 3
    beq    LF5E8                 ; 2³
    dec    $B0                   ; 5
    tax                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    bcc    LF5E4                 ; 2³
    tax                          ; 2
LF5E4:
    ldy    #$0C                  ; 2
    sty    AUDV0                 ; 3
LF5E8:
    stx    AUDF0                 ; 3
    sty    AUDC0                 ; 3
    ldy    #2                    ; 2
LF5EE:
    tya                          ; 2
    asl                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda.wy $A3,Y                 ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    adc    #$28                  ; 2
    sta    $F4,X                 ; 4
    lda.wy $A3,Y                 ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$28                  ; 2
    sta    $F6,X                 ; 4
    lda    #$F7                  ; 2
    sta    $F5,X                 ; 4
    sta    $F7,X                 ; 4
    dey                          ; 2
    bpl    LF5EE                 ; 2³+1
    ldx    #0                    ; 2
LF613:
    lda    $F4,X                 ; 4
    eor    #$28                  ; 2
    bne    LF621                 ; 2³
    sta    $F4,X                 ; 4
    inx                          ; 2
    inx                          ; 2
    cpx    #$0A                  ; 2
    bcc    LF613                 ; 2³
LF621:
    jmp    LF00E                 ; 3
LF624:
    lda    #0                    ; 2
    ldx    #$25                  ; 2
LF628:
    sta    $9E,X                 ; 4
    dex                          ; 2
    bpl    LF628                 ; 2³
    rts                          ; 6

LF62E:
    lsr    $82                   ; 5
    rol                          ; 2
    eor    $82                   ; 3
    lsr                          ; 2
    lda    $82                   ; 3
    bcs    LF63C                 ; 2³
    ora    #$40                  ; 2
    sta    $82                   ; 3
LF63C:
    rts                          ; 6

LF63D:
    ldy    #$FF                  ; 2
    sec                          ; 2
LF640:
    iny                          ; 2
    sbc    #$0F                  ; 2
    bcs    LF640                 ; 2³
    sty    $F9                   ; 3
    eor    #$FF                  ; 2
    adc    #9                    ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    $F9                   ; 3
LF651:
    rts                          ; 6

LF652:
    .byte $02 ; |      X | $F652
    .byte $02 ; |      X | $F653
    .byte $3A ; |  XXX X | $F654
    .byte $3A ; |  XXX X | $F655
    .byte $3A ; |  XXX X | $F656
    .byte $0C ; |    XX  | $F657
    .byte $02 ; |      X | $F658
    .byte $0C ; |    XX  | $F659
    .byte $02 ; |      X | $F65A
    .byte $0C ; |    XX  | $F65B
    .byte $02 ; |      X | $F65C
    .byte $0C ; |    XX  | $F65D
    .byte $02 ; |      X | $F65E
    .byte $0C ; |    XX  | $F65F
    .byte $02 ; |      X | $F660
    .byte $0C ; |    XX  | $F661
    .byte $02 ; |      X | $F662
    .byte $0C ; |    XX  | $F663
    .byte $02 ; |      X | $F664
    .byte $38 ; |  XXX   | $F665
    .byte $3A ; |  XXX X | $F666
    .byte $3A ; |  XXX X | $F667
    .byte $3A ; |  XXX X | $F668
    .byte $3A ; |  XXX X | $F669
    .byte $3A ; |  XXX X | $F66A
    .byte $38 ; |  XXX   | $F66B
    .byte $02 ; |      X | $F66C
    .byte $02 ; |      X | $F66D
    .byte $02 ; |      X | $F66E
    .byte $14 ; |   X X  | $F66F
    .byte $12 ; |   X  X | $F670
    .byte $10 ; |   X    | $F671
LF672:
    .byte $06 ; |     XX | $F672
    .byte $D4 ; |XX X X  | $F673
    .byte $1A ; |   XX X | $F674
    .byte $42 ; | X    X | $F675
    .byte $00 ; |        | $F676
    .byte $02 ; |      X | $F677
    .byte $04 ; |     X  | $F678
    .byte $06 ; |     XX | $F679
    .byte $06 ; |     XX | $F67A
    .byte $04 ; |     X  | $F67B
    .byte $02 ; |      X | $F67C
    .byte $00 ; |        | $F67D
    .byte $08 ; |    X   | $F67E
    .byte $08 ; |    X   | $F67F
    .byte $08 ; |    X   | $F680
    .byte $08 ; |    X   | $F681
    .byte $4E ; | X  XXX | $F682
LF683:
    .byte $4E ; | X  XXX | $F683
LF684:
    .byte $4E ; | X  XXX | $F684
    .byte $12 ; |   X  X | $F685
    .byte $12 ; |   X  X | $F686
    .byte $14 ; |   X X  | $F687
    .byte $14 ; |   X X  | $F688
    .byte $16 ; |   X XX | $F689
    .byte $16 ; |   X XX | $F68A
    .byte $88 ; |X   X   | $F68B
    .byte $16 ; |   X XX | $F68C
    .byte $88 ; |X   X   | $F68D
    .byte $88 ; |X   X   | $F68E
    .byte $88 ; |X   X   | $F68F
    .byte $88 ; |X   X   | $F690
    .byte $88 ; |X   X   | $F691
    .byte $88 ; |X   X   | $F692
    .byte $88 ; |X   X   | $F693
    .byte $88 ; |X   X   | $F694
    .byte $12 ; |   X  X | $F695
    .byte $12 ; |   X  X | $F696
    .byte $14 ; |   X X  | $F697
    .byte $14 ; |   X X  | $F698
    .byte $16 ; |   X XX | $F699
    .byte $16 ; |   X XX | $F69A
    .byte $88 ; |X   X   | $F69B
    .byte $16 ; |   X XX | $F69C
    .byte $88 ; |X   X   | $F69D
    .byte $88 ; |X   X   | $F69E
    .byte $88 ; |X   X   | $F69F
    .byte $88 ; |X   X   | $F6A0
    .byte $88 ; |X   X   | $F6A1
    .byte $88 ; |X   X   | $F6A2
    .byte $88 ; |X   X   | $F6A3
    .byte $88 ; |X   X   | $F6A4
    .byte $12 ; |   X  X | $F6A5
    .byte $12 ; |   X  X | $F6A6
    .byte $14 ; |   X X  | $F6A7
    .byte $14 ; |   X X  | $F6A8
    .byte $16 ; |   X XX | $F6A9
    .byte $16 ; |   X XX | $F6AA
    .byte $88 ; |X   X   | $F6AB
    .byte $16 ; |   X XX | $F6AC
    .byte $88 ; |X   X   | $F6AD
    .byte $88 ; |X   X   | $F6AE
    .byte $88 ; |X   X   | $F6AF
    .byte $88 ; |X   X   | $F6B0
    .byte $88 ; |X   X   | $F6B1
    .byte $88 ; |X   X   | $F6B2
    .byte $88 ; |X   X   | $F6B3
    .byte $88 ; |X   X   | $F6B4
LF6B5:
    .byte $00 ; |        | $F6B5
    .byte $AD ; |X X XX X| $F6B6
    .byte $A9 ; |X X X  X| $F6B7
    .byte $E9 ; |XXX X  X| $F6B8
    .byte $A9 ; |X X X  X| $F6B9
    .byte $ED ; |XXX XX X| $F6BA
    .byte $41 ; | X     X| $F6BB
    .byte $0F ; |    XXXX| $F6BC
LF6BD:
    .byte $00 ; |        | $F6BD
    .byte $50 ; | X X    | $F6BE
    .byte $58 ; | X XX   | $F6BF
    .byte $5C ; | X XXX  | $F6C0
    .byte $56 ; | X X XX | $F6C1
    .byte $53 ; | X X  XX| $F6C2
    .byte $11 ; |   X   X| $F6C3
    .byte $F0 ; |XXXX    | $F6C4
LF6C5:
    .byte $00 ; |        | $F6C5
    .byte $BA ; |X XXX X | $F6C6
    .byte $8A ; |X   X X | $F6C7
    .byte $BA ; |X XXX X | $F6C8
    .byte $A2 ; |X X   X | $F6C9
    .byte $3A ; |  XXX X | $F6CA
    .byte $80 ; |X       | $F6CB
    .byte $FE ; |XXXXXXX | $F6CC
LF6CD:
    .byte $00 ; |        | $F6CD
    .byte $E9 ; |XXX X  X| $F6CE
    .byte $AB ; |X X X XX| $F6CF
    .byte $AF ; |X X XXXX| $F6D0
    .byte $AD ; |X X XX X| $F6D1
    .byte $E9 ; |XXX X  X| $F6D2
LF6D3:
    .byte $00 ; |        | $F6D3
    .byte $00 ; |        | $F6D4
    .byte $44 ; | X   X  | $F6D5
    .byte $82 ; |X     X | $F6D6
    .byte $82 ; |X     X | $F6D7
    .byte $BA ; |X XXX X | $F6D8
    .byte $D6 ; |XX X XX | $F6D9
    .byte $BA ; |X XXX X | $F6DA
    .byte $D6 ; |XX X XX | $F6DB
    .byte $BA ; |X XXX X | $F6DC
    .byte $D6 ; |XX X XX | $F6DD
    .byte $BA ; |X XXX X | $F6DE
    .byte $FE ; |XXXXXXX | $F6DF
    .byte $FE ; |XXXXXXX | $F6E0
    .byte $FE ; |XXXXXXX | $F6E1
    .byte $FE ; |XXXXXXX | $F6E2
    .byte $FE ; |XXXXXXX | $F6E3
    .byte $7C ; | XXXXX  | $F6E4
    .byte $38 ; |  XXX   | $F6E5
    .byte $38 ; |  XXX   | $F6E6
    .byte $38 ; |  XXX   | $F6E7
    .byte $6C ; | XX XX  | $F6E8
    .byte $54 ; | X X X  | $F6E9
    .byte $7C ; | XXXXX  | $F6EA
    .byte $6C ; | XX XX  | $F6EB
    .byte $EE ; |XXX XXX | $F6EC
    .byte $FE ; |XXXXXXX | $F6ED
    .byte $D6 ; |XX X XX | $F6EE
    .byte $7C ; | XXXXX  | $F6EF
    .byte $7C ; | XXXXX  | $F6F0
    .byte $7C ; | XXXXX  | $F6F1
    .byte $38 ; |  XXX   | $F6F2
LF6F3:
    .byte $09 ; |    X  X| $F6F3
    .byte $14 ; |   X X  | $F6F4
    .byte $1E ; |   XXXX | $F6F5
    .byte $28 ; |  X X   | $F6F6
    .byte $32 ; |  XX  X | $F6F7
    .byte $4B ; | X  X XX| $F6F8
    .byte $64 ; | XX  X  | $F6F9
    .byte $96 ; |X  X XX | $F6FA
    .byte $FF ; |XXXXXXXX| $F6FB
    .byte $FF ; |XXXXXXXX| $F6FC
    .byte $F0 ; |XXXX    | $F6FD
    .byte $00 ; |        | $F6FE
    .byte $00 ; |        | $F6FF
    .byte $00 ; |        | $F700
    .byte $00 ; |        | $F701
    .byte $00 ; |        | $F702
    .byte $00 ; |        | $F703
    .byte $00 ; |        | $F704
    .byte $00 ; |        | $F705
    .byte $00 ; |        | $F706
    .byte $00 ; |        | $F707
LF708:
    .byte $00 ; |        | $F708
    .byte $00 ; |        | $F709
    .byte $00 ; |        | $F70A
    .byte $00 ; |        | $F70B
    .byte $00 ; |        | $F70C
    .byte $00 ; |        | $F70D
    .byte $00 ; |        | $F70E
    .byte $00 ; |        | $F70F
    .byte $92 ; |X  X  X | $F710
    .byte $00 ; |        | $F711
    .byte $38 ; |  XXX   | $F712
    .byte $10 ; |   X    | $F713
    .byte $82 ; |X     X | $F714
    .byte $28 ; |  X X   | $F715
    .byte $00 ; |        | $F716
    .byte $00 ; |        | $F717
    .byte $10 ; |   X    | $F718
    .byte $10 ; |   X    | $F719
    .byte $44 ; | X   X  | $F71A
    .byte $92 ; |X  X  X | $F71B
    .byte $10 ; |   X    | $F71C
    .byte $00 ; |        | $F71D
    .byte $44 ; | X   X  | $F71E
    .byte $00 ; |        | $F71F
    .byte $00 ; |        | $F720
    .byte $92 ; |X  X  X | $F721
    .byte $10 ; |   X    | $F722
    .byte $00 ; |        | $F723
    .byte $10 ; |   X    | $F724
    .byte $82 ; |X     X | $F725
    .byte $00 ; |        | $F726
    .byte $00 ; |        | $F727
    .byte $3C ; |  XXXX  | $F728
    .byte $66 ; | XX  XX | $F729
    .byte $66 ; | XX  XX | $F72A
    .byte $66 ; | XX  XX | $F72B
    .byte $66 ; | XX  XX | $F72C
    .byte $66 ; | XX  XX | $F72D
    .byte $66 ; | XX  XX | $F72E
    .byte $3C ; |  XXXX  | $F72F
    .byte $3C ; |  XXXX  | $F730
    .byte $18 ; |   XX   | $F731
    .byte $18 ; |   XX   | $F732
    .byte $18 ; |   XX   | $F733
    .byte $18 ; |   XX   | $F734
    .byte $18 ; |   XX   | $F735
    .byte $38 ; |  XXX   | $F736
    .byte $18 ; |   XX   | $F737
    .byte $7E ; | XXXXXX | $F738
    .byte $60 ; | XX     | $F739
    .byte $60 ; | XX     | $F73A
    .byte $3C ; |  XXXX  | $F73B
    .byte $06 ; |     XX | $F73C
    .byte $06 ; |     XX | $F73D
    .byte $46 ; | X   XX | $F73E
    .byte $3C ; |  XXXX  | $F73F
    .byte $3C ; |  XXXX  | $F740
    .byte $46 ; | X   XX | $F741
    .byte $06 ; |     XX | $F742
    .byte $0C ; |    XX  | $F743
    .byte $0C ; |    XX  | $F744
    .byte $06 ; |     XX | $F745
    .byte $46 ; | X   XX | $F746
    .byte $3C ; |  XXXX  | $F747
    .byte $0C ; |    XX  | $F748
    .byte $0C ; |    XX  | $F749
    .byte $0C ; |    XX  | $F74A
    .byte $7E ; | XXXXXX | $F74B
    .byte $4C ; | X  XX  | $F74C
    .byte $2C ; |  X XX  | $F74D
    .byte $1C ; |   XXX  | $F74E
    .byte $0C ; |    XX  | $F74F
    .byte $7C ; | XXXXX  | $F750
    .byte $46 ; | X   XX | $F751
    .byte $06 ; |     XX | $F752
    .byte $06 ; |     XX | $F753
    .byte $7C ; | XXXXX  | $F754
    .byte $60 ; | XX     | $F755
    .byte $60 ; | XX     | $F756
    .byte $7E ; | XXXXXX | $F757
    .byte $3C ; |  XXXX  | $F758
    .byte $66 ; | XX  XX | $F759
    .byte $66 ; | XX  XX | $F75A
    .byte $66 ; | XX  XX | $F75B
    .byte $7C ; | XXXXX  | $F75C
    .byte $60 ; | XX     | $F75D
    .byte $62 ; | XX   X | $F75E
    .byte $3C ; |  XXXX  | $F75F
    .byte $18 ; |   XX   | $F760
    .byte $18 ; |   XX   | $F761
    .byte $18 ; |   XX   | $F762
    .byte $18 ; |   XX   | $F763
    .byte $0C ; |    XX  | $F764
    .byte $06 ; |     XX | $F765
    .byte $42 ; | X    X | $F766
    .byte $7E ; | XXXXXX | $F767
    .byte $3C ; |  XXXX  | $F768
    .byte $66 ; | XX  XX | $F769
    .byte $66 ; | XX  XX | $F76A
    .byte $3C ; |  XXXX  | $F76B
    .byte $3C ; |  XXXX  | $F76C
    .byte $66 ; | XX  XX | $F76D
    .byte $66 ; | XX  XX | $F76E
    .byte $3C ; |  XXXX  | $F76F
    .byte $3C ; |  XXXX  | $F770
    .byte $46 ; | X   XX | $F771
    .byte $06 ; |     XX | $F772
    .byte $3E ; |  XXXXX | $F773
    .byte $66 ; | XX  XX | $F774
    .byte $66 ; | XX  XX | $F775
    .byte $66 ; | XX  XX | $F776
    .byte $3C ; |  XXXX  | $F777
    .byte $00 ; |        | $F778
    .byte $10 ; |   X    | $F779
    .byte $38 ; |  XXX   | $F77A
    .byte $38 ; |  XXX   | $F77B
    .byte $7C ; | XXXXX  | $F77C
    .byte $7C ; | XXXXX  | $F77D
    .byte $38 ; |  XXX   | $F77E
    .byte $38 ; |  XXX   | $F77F
    .byte $10 ; |   X    | $F780
    .byte $08 ; |    X   | $F781
    .byte $08 ; |    X   | $F782
    .byte $10 ; |   X    | $F783
    .byte $20 ; |  X     | $F784
    .byte $00 ; |        | $F785
    .byte $00 ; |        | $F786
    .byte $00 ; |        | $F787
    .byte $00 ; |        | $F788
    .byte $10 ; |   X    | $F789
    .byte $38 ; |  XXX   | $F78A
    .byte $38 ; |  XXX   | $F78B
    .byte $7C ; | XXXXX  | $F78C
    .byte $7C ; | XXXXX  | $F78D
    .byte $38 ; |  XXX   | $F78E
    .byte $38 ; |  XXX   | $F78F
    .byte $10 ; |   X    | $F790
    .byte $08 ; |    X   | $F791
    .byte $08 ; |    X   | $F792
    .byte $10 ; |   X    | $F793
    .byte $20 ; |  X     | $F794
    .byte $20 ; |  X     | $F795
    .byte $00 ; |        | $F796
    .byte $00 ; |        | $F797
    .byte $00 ; |        | $F798
    .byte $10 ; |   X    | $F799
    .byte $38 ; |  XXX   | $F79A
    .byte $38 ; |  XXX   | $F79B
    .byte $7C ; | XXXXX  | $F79C
    .byte $7C ; | XXXXX  | $F79D
    .byte $38 ; |  XXX   | $F79E
    .byte $38 ; |  XXX   | $F79F
    .byte $10 ; |   X    | $F7A0
    .byte $08 ; |    X   | $F7A1
    .byte $08 ; |    X   | $F7A2
    .byte $10 ; |   X    | $F7A3
    .byte $20 ; |  X     | $F7A4
    .byte $20 ; |  X     | $F7A5
    .byte $30 ; |  XX    | $F7A6
    .byte $10 ; |   X    | $F7A7
    .byte $00 ; |        | $F7A8
    .byte $10 ; |   X    | $F7A9
    .byte $38 ; |  XXX   | $F7AA
    .byte $38 ; |  XXX   | $F7AB
    .byte $7C ; | XXXXX  | $F7AC
    .byte $7C ; | XXXXX  | $F7AD
    .byte $38 ; |  XXX   | $F7AE
    .byte $38 ; |  XXX   | $F7AF
    .byte $10 ; |   X    | $F7B0
    .byte $08 ; |    X   | $F7B1
    .byte $08 ; |    X   | $F7B2
    .byte $10 ; |   X    | $F7B3
    .byte $20 ; |  X     | $F7B4
    .byte $20 ; |  X     | $F7B5
    .byte $60 ; | XX     | $F7B6
    .byte $20 ; |  X     | $F7B7
    .byte $00 ; |        | $F7B8
    .byte $14 ; |   X X  | $F7B9
    .byte $91 ; |X  X   X| $F7BA
    .byte $5A ; | X XX X | $F7BB
    .byte $7E ; | XXXXXX | $F7BC
    .byte $3C ; |  XXXX  | $F7BD
    .byte $1D ; |   XXX X| $F7BE
    .byte $B8 ; |X XXX   | $F7BF
    .byte $3C ; |  XXXX  | $F7C0
    .byte $7E ; | XXXXXX | $F7C1
    .byte $59 ; | X XX  X| $F7C2
    .byte $9C ; |X  XXX  | $F7C3
    .byte $14 ; |   X X  | $F7C4
    .byte $12 ; |   X  X | $F7C5
    .byte $A0 ; |X X     | $F7C6
    .byte $04 ; |     X  | $F7C7
    .byte $00 ; |        | $F7C8
    .byte $00 ; |        | $F7C9
    .byte $52 ; | X X  X | $F7CA
    .byte $18 ; |   XX   | $F7CB
    .byte $3C ; |  XXXX  | $F7CC
    .byte $3C ; |  XXXX  | $F7CD
    .byte $1C ; |   XXX  | $F7CE
    .byte $38 ; |  XXX   | $F7CF
    .byte $7C ; | XXXXX  | $F7D0
    .byte $7E ; | XXXXXX | $F7D1
    .byte $58 ; | X XX   | $F7D2
    .byte $1C ; |   XXX  | $F7D3
    .byte $54 ; | X X X  | $F7D4
    .byte $00 ; |        | $F7D5
    .byte $02 ; |      X | $F7D6
    .byte $00 ; |        | $F7D7
    .byte $00 ; |        | $F7D8
    .byte $00 ; |        | $F7D9
    .byte $00 ; |        | $F7DA
    .byte $00 ; |        | $F7DB
    .byte $00 ; |        | $F7DC
    .byte $18 ; |   XX   | $F7DD
    .byte $3C ; |  XXXX  | $F7DE
    .byte $3C ; |  XXXX  | $F7DF
    .byte $18 ; |   XX   | $F7E0
    .byte $3C ; |  XXXX  | $F7E1
    .byte $3C ; |  XXXX  | $F7E2
    .byte $18 ; |   XX   | $F7E3
    .byte $00 ; |        | $F7E4
    .byte $00 ; |        | $F7E5
    .byte $00 ; |        | $F7E6
    .byte $00 ; |        | $F7E7
LF7E8:
    .byte $00 ; |        | $F7E8
    .byte $10 ; |   X    | $F7E9
    .byte $20 ; |  X     | $F7EA
    .byte $30 ; |  XX    | $F7EB
LF7EC:
    .byte $FE ; |XXXXXXX | $F7EC
    .byte $AA ; |X X X X | $F7ED
    .byte $AA ; |X X X X | $F7EE
    .byte $AA ; |X X X X | $F7EF
    .byte $AA ; |X X X X | $F7F0
    .byte $AA ; |X X X X | $F7F1
    .byte $78 ; | XXXX   | $F7F2
    .byte $7C ; | XXXXX  | $F7F3
    .byte $00 ; |        | $F7F4
    .byte $00 ; |        | $F7F5
    .byte $00 ; |        | $F7F6
    .byte $00 ; |        | $F7F7
    .byte $00 ; |        | $F7F8
    .byte $00 ; |        | $F7F9
    .byte $00 ; |        | $F7FA
    .byte $00 ; |        | $F7FB
    .byte $00 ; |        | $F7FC
    .byte $F0 ; |XXXX    | $F7FD
    .byte $00 ; |        | $F7FE
    .byte $00 ; |        | $F7FF