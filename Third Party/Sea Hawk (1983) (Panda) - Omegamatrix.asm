; Disassembly of SeaH.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: ultrastella -pasfcSeaH.cfg SeaH.bin 
;
; SeaH.cfg contents:
;
;      ORG F000
;      CODE F000 F30A
;      GFX F30B F316
;      CODE F317 FC57
;      GFX FC58 FC75
;      CODE FC76 FE02
;      GFX FE03 FFFF

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
ENAM0   =  $1D
ENAM1   =  $1E
HMP0    =  $20
HMP1    =  $21
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

       ORG $F000

START:
    sei                    ; 2
    cld                    ; 2
    ldx    #$00            ; 2
    lda    #$00            ; 2
LF006:
    sta    VSYNC,X         ; 4
    txs                    ; 2
    inx                    ; 2
    bne    LF006           ; 2
    lda    #$FF            ; 2
    sta    $F5             ; 3
    lda    #$01            ; 2
    sta    $F8             ; 3
LF014:
    jsr    LFD6C           ; 6
LF017:
    sta    WSYNC           ; 3
    lda    $A2             ; 3
    ldx    #$02            ; 2
    jsr    LFC20           ; 6
    jsr    LFC76           ; 6
    lda    $B6             ; 3
    ldx    #$03            ; 2
    jsr    LFC20           ; 6
    jsr    LFC76           ; 6
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    lda    #$03            ; 2
    sta    NUSIZ0          ; 3
    sta    NUSIZ1          ; 3
    lda    #$0F            ; 2
    sta    COLUP0          ; 3
    sta    COLUP1          ; 3
    jsr    LFC3C           ; 6
    sta    HMCLR           ; 3
LF042:
    lda    INTIM           ; 4
    bne    LF042           ; 2
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    sta    VBLANK          ; 3
    sta    CXCLR           ; 3
    sta    HMCLR           ; 3
    lda    #$07            ; 2
    sta    $C9             ; 3
    sta    VDELP0          ; 3
    sta    VDELP1          ; 3
LF059:
    ldy    $C9             ; 3
    lda    ($8A),Y         ; 5
    sta    $CA             ; 3
    lda    ($88),Y         ; 5
    tax                    ; 2
    lda    ($80),Y         ; 5
    sta    WSYNC           ; 3
    nop                    ; 2
    sta    GRP0            ; 3
    lda    ($82),Y         ; 5
    sta    GRP1            ; 3
    lda    ($84),Y         ; 5
    sta    GRP0            ; 3
    lda    ($86),Y         ; 5
    ldy    $CA             ; 3
    sta    GRP1            ; 3
    stx    GRP0            ; 3
    sty    GRP1            ; 3
    sta    GRP0            ; 3
    dec    $C9             ; 5
    bpl    LF059           ; 2
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    lda    #$00            ; 2
    sta    VDELP0          ; 3
    sta    VDELP1          ; 3
    sta    GRP0            ; 3
    sta    GRP1            ; 3
    lda    #$AC            ; 2
    sta    COLUBK          ; 3
    lda    #$07            ; 2
    sta    NUSIZ0          ; 3
    lda    #$06            ; 2
    sta    NUSIZ1          ; 3
    lda    #$0F            ; 2
    sta    COLUP0          ; 3
    sta    COLUP1          ; 3
    lda    $D9             ; 3
    sta    $C9             ; 3
    lda    $DA             ; 3
    sta    $CA             ; 3
    jsr    LFD1E           ; 6
    ldy    #$0E            ; 2
    jsr    LFC3C           ; 6
    sta    HMCLR           ; 3
LF0B3:
    lda    LFFB4,Y         ; 4
    ldx    LFFC3,Y         ; 4
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    sta    GRP0            ; 3
    stx    GRP1            ; 3
    lda    $DB             ; 3
    sta    $C9             ; 3
    lda    $DC             ; 3
    sta    $CA             ; 3
    dey                    ; 2
    sta    HMCLR           ; 3
    bpl    LF0B3           ; 2
    jsr    LFD1E           ; 6
    ldy    #$0E            ; 2
    jsr    LFC3C           ; 6
    sta    HMCLR           ; 3
LF0D8:
    lda    LFFD2,Y         ; 4
    ldx    LFFE1,Y         ; 4
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    sta    GRP0            ; 3
    stx    GRP1            ; 3
    lda    $E4             ; 3
    sta    $C9             ; 3
    lda    $AE             ; 3
    sta    $CA             ; 3
    dey                    ; 2
    bpl    LF0D8           ; 2
    jsr    LFD1E           ; 6
    ldy    $F8             ; 3
    dey                    ; 2
    lda    LF314,Y         ; 4
    sta    NUSIZ0          ; 3
    lda    #$20            ; 2
    sta    NUSIZ1          ; 3
    lda    #$47            ; 2
    sta    COLUP0          ; 3
    lda    #$00            ; 2
    sta    COLUP1          ; 3
    lda    $D7             ; 3
    and    #$08            ; 2
    sta    REFP0           ; 3
    lda    $BE             ; 3
    sta    REFP1           ; 3
    sta    HMCLR           ; 3
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    ldx    #$66            ; 2
    ldy    $CC             ; 3
    sta    HMCLR           ; 3
    beq    LF146           ; 2
LF120:
    lda    #$00            ; 2
    sta    $C9             ; 3
    sta    $CA             ; 3
    lda    #$02            ; 2
    cpx    $A6             ; 3
    bne    LF12E           ; 2
    sta    $C9             ; 3
LF12E:
    cpx    $BA             ; 3
    bne    LF134           ; 2
    sta    $CA             ; 3
LF134:
    sta    CXCLR           ; 3
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    lda    $C9             ; 3
    sta    ENAM0           ; 3
    lda    $CA             ; 3
    sta    ENAM1           ; 3
    dex                    ; 2
    dey                    ; 2
    bne    LF120           ; 2
LF146:
    ldy    $CD             ; 3
    beq    LF17F           ; 2
LF14A:
    lda    #$00            ; 2
    sta    $C9             ; 3
    sta    $CA             ; 3
    lda    #$02            ; 2
    cpx    $A6             ; 3
    bne    LF158           ; 2
    sta    $C9             ; 3
LF158:
    cpx    $BA             ; 3
    bne    LF15E           ; 2
    sta    $CA             ; 3
LF15E:
    lda    ($8C),Y         ; 5
    bit    $C8             ; 3
    bpl    LF16D           ; 2
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    sta    GRP0            ; 3
    jmp    LF173           ; 3

LF16D:
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    sta    GRP1            ; 3
LF173:
    lda    $C9             ; 3
    sta    ENAM0           ; 3
    lda    $CA             ; 3
    sta    ENAM1           ; 3
    dex                    ; 2
    dey                    ; 2
    bne    LF14A           ; 2
LF17F:
    ldy    $CE             ; 3
    beq    LF1E1           ; 2
    bmi    LF1B3           ; 2
LF185:
    lda    #$00            ; 2
    sta    $C9             ; 3
    sta    $CA             ; 3
    lda    #$02            ; 2
    cpx    $A6             ; 3
    bne    LF193           ; 2
    sta    $C9             ; 3
LF193:
    cpx    $BA             ; 3
    bne    LF199           ; 2
    sta    $CA             ; 3
LF199:
    lda    ($8E),Y         ; 5
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    sta    GRP0            ; 3
    lda    ($90),Y         ; 5
    sta    GRP1            ; 3
    lda    $C9             ; 3
    sta    ENAM0           ; 3
    lda    $CA             ; 3
    sta    ENAM1           ; 3
    dex                    ; 2
    dey                    ; 2
    bne    LF185           ; 2
    beq    LF1E1           ; 2
LF1B3:
    tya                    ; 2
    and    #$7F            ; 2
    tay                    ; 2
LF1B7:
    lda    #$00            ; 2
    sta    $C9             ; 3
    sta    $CA             ; 3
    lda    #$02            ; 2
    cpx    $A6             ; 3
    bne    LF1C5           ; 2
    sta    $C9             ; 3
LF1C5:
    cpx    $BA             ; 3
    bne    LF1CB           ; 2
    sta    $CA             ; 3
LF1CB:
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    lda    #$00            ; 2
    sta    GRP0            ; 3
    sta    GRP1            ; 3
    lda    $C9             ; 3
    sta    ENAM0           ; 3
    lda    $CA             ; 3
    sta    ENAM1           ; 3
    dex                    ; 2
    dey                    ; 2
    bne    LF1B7           ; 2
LF1E1:
    ldy    $CF             ; 3
    beq    LF211           ; 2
LF1E5:
    lda    #$00            ; 2
    sta    $C9             ; 3
    sta    $CA             ; 3
    lda    #$02            ; 2
    cpx    $A6             ; 3
    bne    LF1F3           ; 2
    sta    $C9             ; 3
LF1F3:
    cpx    $BA             ; 3
    bne    LF1F9           ; 2
    sta    $CA             ; 3
LF1F9:
    lda    ($92),Y         ; 5
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    sta    GRP0            ; 3
    lda    ($94),Y         ; 5
    sta    GRP1            ; 3
    lda    $C9             ; 3
    sta    ENAM0           ; 3
    lda    $CA             ; 3
    sta    ENAM1           ; 3
    dex                    ; 2
    dey                    ; 2
    bne    LF1E5           ; 2
LF211:
    lda    #$00            ; 2
    sta    $C9             ; 3
    sta    $CA             ; 3
    lda    #$02            ; 2
    cpx    $A6             ; 3
    bne    LF21F           ; 2
    sta    $C9             ; 3
LF21F:
    cpx    $BA             ; 3
    bne    LF225           ; 2
    sta    $CA             ; 3
LF225:
    lda    #$00            ; 2
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    sta    GRP0            ; 3
    sta    GRP1            ; 3
    lda    $C9             ; 3
    sta    ENAM0           ; 3
    lda    $CA             ; 3
    sta    ENAM1           ; 3
    dex                    ; 2
    cpx    #$0A            ; 2
    bne    LF211           ; 2
    lda    $9B             ; 3
    and    #$0F            ; 2
    tay                    ; 2
    lda    $9A             ; 3
    bmi    LF266           ; 2
    sta    NUSIZ1          ; 3
    lda    $99             ; 3
    sta    COLUP1          ; 3
    sta    WSYNC           ; 3
    nop                    ; 2
    nop                    ; 2
    lda    $D0             ; 3
    sta    ENAM0           ; 3
    lda    $9B             ; 3
    sta    HMP1            ; 3
LF257:
    dey                    ; 2
    bpl    LF257           ; 2
    sta    RESP1           ; 3
    lda    #$00            ; 2
    sta    REFP0           ; 3
    sta    REFP1           ; 3
    dex                    ; 2
    jmp    LF287           ; 3

LF266:
    sta    NUSIZ1          ; 3
    lda    $98             ; 3
    sta    COLUP1          ; 3
    sta    WSYNC           ; 3
    nop                    ; 2
    nop                    ; 2
    lda    $D0             ; 3
    sta    ENAM0           ; 3
    lda    $9B             ; 3
    sta    HMP1            ; 3
    jsr    LFC3A           ; 6
    lda    #$00            ; 2
    sta    REFP0           ; 3
    sta    REFP1           ; 3
    dex                    ; 2
LF282:
    dey                    ; 2
    bpl    LF282           ; 2
    sta    RESP1           ; 3
LF287:
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    ldy    #$09            ; 2
    lda    ($96),Y         ; 5
    sta    GRP1            ; 3
    lda    #$00            ; 2
    sta    ENAM0           ; 3
    lda    #$02            ; 2
    cpx    $A6             ; 3
    bne    LF29D           ; 2
    sta    ENAM0           ; 3
LF29D:
    dex                    ; 2
    dey                    ; 2
    sta    HMCLR           ; 3
LF2A1:
    lda    #$00            ; 2
    sta    $C9             ; 3
    cpx    $A6             ; 3
    bne    LF2AB           ; 2
    sta    $C9             ; 3
LF2AB:
    lda    ($96),Y         ; 5
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    sta    GRP1            ; 3
    lda    $C9             ; 3
    sta    ENAM0           ; 3
    lda    LF30B,Y         ; 4
    sta    COLUBK          ; 3
    dex                    ; 2
    dey                    ; 2
    cpy    #$05            ; 2
    bne    LF2A1           ; 2
    lda    $99             ; 3
    sta    COLUP1          ; 3
LF2C6:
    lda    #$00            ; 2
    sta    $C9             ; 3
    lda    #$02            ; 2
    cpx    $A6             ; 3
    bne    LF2D2           ; 2
    sta    $C9             ; 3
LF2D2:
    lda    ($96),Y         ; 5
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    sta    GRP1            ; 3
    lda    $C9             ; 3
    sta    ENAM0           ; 3
    lda    LF30B,Y         ; 4
    sta    COLUBK          ; 3
    dex                    ; 2
    dey                    ; 2
    cpy    #$01            ; 2
    bne    LF2C6           ; 2
LF2E9:
    lda    ($96),Y         ; 5
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    sta    GRP1            ; 3
    bit    $D1             ; 3
    bpl    LF317           ; 2
    lda    LFED4,Y         ; 4
    sta    PF0             ; 3
    lda    LFED8,Y         ; 4
    sta    PF1             ; 3
    lda    LFEDC,Y         ; 4
    sta    PF2             ; 3
    lda    #$00            ; 2
    sta    ENAM0           ; 3
    jmp    LF32A           ; 3

LF30B:
    .byte $1C ; |   XXX  | $F30B
    .byte $1C ; |   XXX  | $F30C
    .byte $A7 ; |X X  XXX| $F30D
    .byte $1C ; |   XXX  | $F30E
    .byte $3C ; |  XXXX  | $F30F
    .byte $5C ; | X XXX  | $F310
    .byte $6C ; | XX XX  | $F311
    .byte $7C ; | XXXXX  | $F312
    .byte $8C ; |X   XX  | $F313
LF314:
    .byte $30 ; |  XX    | $F314
    .byte $20 ; |  X     | $F315
    .byte $10 ; |   X    | $F316
LF317:
    lda    LFED6,Y         ; 4
    sta    PF0             ; 3
    lda    LFEDA,Y         ; 4
    sta    PF1             ; 3
    lda    LFEDE,Y         ; 4
    sta    PF2             ; 3
    lda    #$00            ; 2
    sta    ENAM0           ; 3
LF32A:
    dex                    ; 2
    dey                    ; 2
    bpl    LF2E9           ; 2
    ldy    #$12            ; 2
LF330:
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    lda    #$00            ; 2
    sta    ENAM1           ; 3
    sta    GRP1            ; 3
    sta    PF0             ; 3
    sta    PF1             ; 3
    sta    PF2             ; 3
    dey                    ; 2
    bpl    LF330           ; 2
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    ldx    #$03            ; 2
    stx    NUSIZ0          ; 3
    stx    NUSIZ1          ; 3
    lda    #$00            ; 2
    sta    COLUBK          ; 3
    lda    #$0F            ; 2
    sta    COLUP0          ; 3
    sta    COLUP1          ; 3
    sta    RESP0           ; 3
    sta    RESP1           ; 3
    lda    #$10            ; 2
    sta    HMP1            ; 3
    ldx    #$01            ; 2
    lda    $F8             ; 3
    asl                    ; 2
    asl                    ; 2
    asl                    ; 2
    asl                    ; 2
    sta    $C9             ; 3
    lda    $D2             ; 3
    sta    $CA             ; 3
LF36D:
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    txa                    ; 2
    asl                    ; 2
    asl                    ; 2
    tay                    ; 2
    lda    $C9,X           ; 4
    and    #$F0            ; 2
    lsr                    ; 2
    sta.wy $0084,Y         ; 5
    lda    $C9,X           ; 4
    and    #$0F            ; 2
    asl                    ; 2
    asl                    ; 2
    asl                    ; 2
    sta.wy $0086,Y         ; 5
    dex                    ; 2
    sta    HMCLR           ; 3
    bpl    LF36D           ; 2
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    lda    #$07            ; 2
    sta    $C9             ; 3
    sta    VDELP0          ; 3
    sta    VDELP1          ; 3
    lda    #$50            ; 2
    sta    $80             ; 3
    lda    #$EC            ; 2
    sta    $82             ; 3
LF3A0:
    ldy    $C9             ; 3
    lda    ($8A),Y         ; 5
    sta    $CA             ; 3
    lda    ($88),Y         ; 5
    tax                    ; 2
    lda    ($84),Y         ; 5
    sta    WSYNC           ; 3
    nop                    ; 2
    sta    GRP0            ; 3
    lda    LFFEC,Y         ; 4
    sta    GRP1            ; 3
    lda    ($82),Y         ; 5
    sta    GRP0            ; 3
    lda    ($80),Y         ; 5
    ldy    $CA             ; 3
    sta    GRP1            ; 3
    stx    GRP0            ; 3
    sty    GRP1            ; 3
    sta    GRP0            ; 3
    dec    $C9             ; 5
    bpl    LF3A0           ; 2
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    lda    #$00            ; 2
    sta    VDELP0          ; 3
    sta    VDELP1          ; 3
    sta    GRP1            ; 3
    sta    GRP0            ; 3
    lda    #$78            ; 2
    sta    $8A             ; 3
    lda    #$80            ; 2
    sta    $88             ; 3
    lda    #$88            ; 2
    sta    $86             ; 3
    lda    #$90            ; 2
    sta    $84             ; 3
    lda    #$98            ; 2
    sta    $82             ; 3
    lda    #$A0            ; 2
    sta    $80             ; 3
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    lda    #$07            ; 2
    sta    $C9             ; 3
    sta    VDELP0          ; 3
    sta    VDELP1          ; 3
    lda    #$00            ; 2
    sta    COLUP0          ; 3
    sta    COLUP1          ; 3
LF401:
    ldy    $C9             ; 3
    lda    ($8A),Y         ; 5
    sta    $CA             ; 3
    lda    ($88),Y         ; 5
    tax                    ; 2
    lda    ($80),Y         ; 5
    sta    WSYNC           ; 3
    nop                    ; 2
    sta    GRP0            ; 3
    lda    ($82),Y         ; 5
    sta    GRP1            ; 3
    lda    ($84),Y         ; 5
    sta    GRP0            ; 3
    lda    ($86),Y         ; 5
    ldy    $CA             ; 3
    sta    GRP1            ; 3
    stx    GRP0            ; 3
    sty    GRP1            ; 3
    sta    GRP0            ; 3
    dec    $C9             ; 5
    bpl    LF401           ; 2
    lda    #$1A            ; 2
    sta    TIM64T          ; 4
    ldx    #$02            ; 2
LF430:
    txa                    ; 2
    asl                    ; 2
    asl                    ; 2
    tay                    ; 2
    lda    $C2,X           ; 4
    and    #$F0            ; 2
    lsr                    ; 2
    sta.wy $0080,Y         ; 5
    lda    $C2,X           ; 4
    and    #$0F            ; 2
    asl                    ; 2
    asl                    ; 2
    asl                    ; 2
    sta.wy $0082,Y         ; 5
    dex                    ; 2
    bpl    LF430           ; 2
    inx                    ; 2
LF44A:
    lda    $80,X           ; 4
    cmp    #$00            ; 2
    bne    LF45A           ; 2
    lda    #$EC            ; 2
    sta    $80,X           ; 4
    inx                    ; 2
    inx                    ; 2
    cpx    #$09            ; 2
    bcc    LF44A           ; 2
LF45A:
    nop                    ; 2
    bit    $D5             ; 3
    bvs    LF477           ; 2
    bpl    LF4AE           ; 2
    lda    #$08            ; 2
    sta    AUDC0           ; 3
    lda    $D5             ; 3
    and    #$3F            ; 2
    lsr                    ; 2
    lsr                    ; 2
    eor    #$1F            ; 2
    sta    AUDF0           ; 3
    lsr                    ; 2
    eor    #$0F            ; 2
    sta    AUDV0           ; 3
    jmp    LF4DF           ; 3

LF477:
    lda    $D5             ; 3
    and    #$3F            ; 2
    beq    LF4A5           ; 2
    dec    $D5             ; 5
    lda    #$0F            ; 2
    sta    AUDV0           ; 3
    lda    $F6             ; 3
    bne    LF497           ; 2
    jsr    LFC3F           ; 6
    and    #$03            ; 2
    nop                    ; 2
    nop                    ; 2
    sta    AUDF0           ; 3
    lda    #$04            ; 2
    sta    AUDC0           ; 3
    jmp    LF4DF           ; 3

LF497:
    jsr    LFC3F           ; 6
    and    #$0F            ; 2
    sta    AUDF0           ; 3
    lda    #$04            ; 2
    sta    AUDC0           ; 3
    jmp    LF4DF           ; 3

LF4A5:
    lda    #$00            ; 2
    sta    $D5             ; 3
    sta    $DD             ; 3
    jmp    LF4DF           ; 3

LF4AE:
    lda    $DD             ; 3
    beq    LF4DB           ; 2
    dec    $DD             ; 5
    bit    $D7             ; 3
    bvs    LF4C9           ; 2
    ldy    #$0C            ; 2
    sty    AUDC0           ; 3
    lsr                    ; 2
    lsr                    ; 2
    eor    #$1F            ; 2
    sta    AUDF0           ; 3
    lda    #$0F            ; 2
    sta    AUDV0           ; 3
    jmp    LF4DF           ; 3

LF4C9:
    ldy    #$08            ; 2
    sty    AUDC0           ; 3
    lsr                    ; 2
    lsr                    ; 2
    eor    #$1F            ; 2
    sta    AUDF0           ; 3
    lsr                    ; 2
    eor    #$0F            ; 2
    sta    AUDV0           ; 3
    jmp    LF4DF           ; 3

LF4DB:
    lda    #$00            ; 2
    sta    AUDV0           ; 3
LF4DF:
    lda    #$03            ; 2
    sta    AUDV1           ; 3
    lda    #$08            ; 2
    sta    AUDC1           ; 3
    lda    #$07            ; 2
    sta    AUDF1           ; 3
LF4EB:
    lda    INTIM           ; 4
    bne    LF4EB           ; 2
    ldy    #$82            ; 2
    sty    WSYNC           ; 3
    sty    VBLANK          ; 3
    sty    VSYNC           ; 3
    sty    WSYNC           ; 3
    sty    WSYNC           ; 3
    sty    WSYNC           ; 3
    sta    VSYNC           ; 3
    lda    #$2C            ; 2
    sta    TIM64T          ; 4
    lda    SWCHB           ; 4
    sta    $C9             ; 3
    lsr                    ; 2
    bcs    LF518           ; 2
LF50D:
    lda    #$08            ; 2
    sta    $D2             ; 3
    lda    #$00            ; 2
    sta    $F5             ; 3
    jmp    LF014           ; 3

LF518:
    dec    $F7             ; 5
    bpl    LF536           ; 2
    lda    #$17            ; 2
    sta    $F7             ; 3
    lda    $C9             ; 3
    lsr                    ; 2
    lsr                    ; 2
    bcs    LF536           ; 2
    lda    $F8             ; 3
    cmp    #$03            ; 2
    bne    LF532           ; 2
    lda    #$01            ; 2
    sta    $F8             ; 3
    bne    LF50D           ; 2
LF532:
    inc    $F8             ; 5
    bne    LF50D           ; 2
LF536:
    nop                    ; 2
    lda    $F2             ; 3
    bne    LF549           ; 2
    lda    VSYNC           ; 3
    asl                    ; 2
    bcs    LF54F           ; 2
    bit    $D5             ; 3
    bmi    LF549           ; 2
    lda    COLUP1          ; 3
    asl                    ; 2
    bcs    LF555           ; 2
LF549:
    jsr    LF5AD           ; 6
    jmp    LF5BE           ; 3

LF54F:
    lda    $A6             ; 3
    cmp    #$0B            ; 2
    bcc    LF58F           ; 2
LF555:
    ldx    $DF             ; 3
    lda    $EA,X           ; 4
    bne    LF549           ; 2
    lda    #$3F            ; 2
    sta    $D6             ; 3
    lda    #$1F            ; 2
    sta    $EA,X           ; 4
    lda    #$00            ; 2
    sta    $A2             ; 3
    lda    #$9F            ; 2
    sta    $A6             ; 3
    lda    $F5             ; 3
    bne    LF584           ; 2
    dec    $F0             ; 5
    bpl    LF584           ; 2
    lda    #$09            ; 2
    sta    $F0             ; 3
    lda    $D2             ; 3
    cmp    #$20            ; 2
    beq    LF584           ; 2
    sec                    ; 2
    clc                    ; 2
    adc    #$01            ; 2
    sta    $D2             ; 3
    cld                    ; 2
LF584:
    lda    #$00            ; 2
    jsr    LFC8E           ; 6
    jsr    LF5AD           ; 6
    jmp    LF5BE           ; 3

LF58F:
    lda    $ED             ; 3
    bne    LF549           ; 2
    lda    #$5F            ; 2
    sta    $96             ; 3
    lda    #$3F            ; 2
    sta    $ED             ; 3
    lda    #$04            ; 2
    ldy    $99             ; 3
    beq    LF5A7           ; 2
    jsr    LFCCA           ; 6
    jmp    LF5BE           ; 3

LF5A7:
    jsr    LFC8E           ; 6
    jmp    LF5BE           ; 3

LF5AD:
    lda    $ED             ; 3
    beq    LF5BD           ; 2
    dec    $ED             ; 5
    bne    LF5BD           ; 2
    lda    #$D0            ; 2
    sta    $9D             ; 3
    lda    #$AA            ; 2
    sta    $96             ; 3
LF5BD:
    rts                    ; 6

LF5BE:
    lda    $F2             ; 3
    beq    LF5C5           ; 2
    jmp    LF5FD           ; 3

LF5C5:
    lda    VBLANK          ; 3
    asl                    ; 2
    bcs    LF5F5           ; 2
    lda    COLUP1          ; 3
    asl                    ; 2
    bcc    LF5FD           ; 2
LF5CF:
    bit    $D5             ; 3
    bmi    LF5FD           ; 2
    lda    #$BF            ; 2
    sta    $D5             ; 3
    lda    #$5F            ; 2
    sta    $9F             ; 3
    lda    #$F4            ; 2
    sta    $E6             ; 3
    lda    $A0             ; 3
    clc                    ; 2
    adc    #$08            ; 2
    sta    $E7             ; 3
    lda    $A1             ; 3
    sta    $E8             ; 3
    lda    #$FF            ; 2
    sta    $F2             ; 3
    lda    #$00            ; 2
    sta    $DD             ; 3
    jmp    LF83A           ; 3

LF5F5:
    ldx    $DF             ; 3
    lda    #$00            ; 2
    sta    $B7,X           ; 4
    beq    LF5CF           ; 2
LF5FD:
    bit    $D5             ; 3
    bmi    LF604           ; 2
    jmp    LF6B8           ; 3

LF604:
    bvc    LF609           ; 2
    jmp    LF83A           ; 3

LF609:
    lda    SWCHA           ; 4
    sta    $C9             ; 3
    asl                    ; 2
    bcc    LF618           ; 2
    asl                    ; 2
    bcc    LF61C           ; 2
    lda    #$00            ; 2
    beq    LF61E           ; 2
LF618:
    lda    #$FF            ; 2
    bne    LF61E           ; 2
LF61C:
    lda    #$01            ; 2
LF61E:
    sta    $D8             ; 3
    lda    $D5             ; 3
    and    #$3F            ; 2
    beq    LF661           ; 2
    dec    $D5             ; 5
    lda    $D5             ; 3
    and    #$3F            ; 2
    beq    LF655           ; 2
    lda    $A0             ; 3
    clc                    ; 2
    adc    $D8             ; 3
    cmp    #$9F            ; 2
    bcs    LF647           ; 2
    sta    $A0             ; 3
    lda    $A1             ; 3
    sec                    ; 2
    sbc    #$01            ; 2
    cmp    #$14            ; 2
    bcc    LF647           ; 2
    sta    $A1             ; 3
    jmp    LF661           ; 3

LF647:
    lda    #$11            ; 2
    sta    $A0             ; 3
    lda    #$64            ; 2
    sta    $A1             ; 3
    lda    #$C0            ; 2
    and    $D5             ; 3
    sta    $D5             ; 3
LF655:
    lda    #$EC            ; 2
    sta    $9F             ; 3
    lda    $D7             ; 3
    and    #$F7            ; 2
    ora    #$01            ; 2
    sta    $D7             ; 3
LF661:
    dec    $E9             ; 5
    bpl    LF6B0           ; 2
    lda    #$03            ; 2
    sta    $E9             ; 3
    lda    $E8             ; 3
    sec                    ; 2
    sbc    #$01            ; 2
    cmp    #$14            ; 2
    bcs    LF6B3           ; 2
    lda    #$EC            ; 2
    sta    $E6             ; 3
    lda    #$11            ; 2
    sta    $A0             ; 3
    lda    #$64            ; 2
    sta    $A1             ; 3
    lda    $E7             ; 3
    clc                    ; 2
    adc    #$04            ; 2
    cmp    $9C             ; 3
    bcc    LF69C           ; 2
    lda    $9C             ; 3
    clc                    ; 2
    adc    #$05            ; 2
    cmp    $E7             ; 3
    bcc    LF69C           ; 2
    lda    $99             ; 3
    cmp    #$00            ; 2
    beq    LF69C           ; 2
    lda    #$00            ; 2
    sta    $F6             ; 3
    beq    LF6AC           ; 2
LF69C:
    lda    #$FF            ; 2
    sta    $F6             ; 3
    ldy    $D2             ; 3
    beq    LF6AC           ; 2
    dec    $D2             ; 5
    bne    LF6AC           ; 2
    ldy    #$FF            ; 2
    sty    $F5             ; 3
LF6AC:
    lda    #$FF            ; 2
    sta    $D5             ; 3
LF6B0:
    jmp    LF83A           ; 3

LF6B3:
    sta    $E8             ; 3
    jmp    LF83A           ; 3

LF6B8:
    lda    $D2             ; 3
    bne    LF6DA           ; 2
    lda    #$00            ; 2
    sta    $F2             ; 3
    dec    $F3             ; 5
    bpl    LF6D3           ; 2
    lda    #$2F            ; 2
    sta    $F3             ; 3
    jsr    LFC3F           ; 6
    and    #$C0            ; 2
    beq    LF6D3           ; 2
    lda    $D3             ; 3
    sta    $F4             ; 3
LF6D3:
    lda    $F4             ; 3
    sta    $C9             ; 3
    jmp    LF6F3           ; 3

LF6DA:
    lda    $F2             ; 3
    beq    LF6EE           ; 2
    lda    REFP1           ; 3
    asl                    ; 2
    nop                    ; 2
    lda    #$00            ; 2
    sta    $F2             ; 3
    beq    LF6EE           ; 2
    lda    #$FF            ; 2
    sta    $C9             ; 3
    bne    LF6F3           ; 2
LF6EE:
    lda    SWCHA           ; 4
    sta    $C9             ; 3
LF6F3:
    lda    #$08            ; 2
    bit    $D7             ; 3
    bne    LF73D           ; 2
    lda    $C9             ; 3
    asl                    ; 2
    asl                    ; 2
    bcc    LF734           ; 2
    lda    #$01            ; 2
    bit    $D7             ; 3
    beq    LF71D           ; 2
    lda    $A0             ; 3
    cmp    #$10            ; 2
    bne    LF715           ; 2
    lda    #$FE            ; 2
    and    $D7             ; 3
    sta    $D7             ; 3
LF711:
    lda    #$FF            ; 2
    bne    LF719           ; 2
LF715:
    dec    $A0             ; 5
LF717:
    lda    #$FE            ; 2
LF719:
    sta    $D8             ; 3
    bne    LF780           ; 2
LF71D:
    lda    $C9             ; 3
    asl                    ; 2
    bcc    LF72A           ; 2
    lda    #$10            ; 2
    cmp    $A0             ; 3
    bne    LF715           ; 2
    beq    LF711           ; 2
LF72A:
    lda    #$30            ; 2
    cmp    $A0             ; 3
    beq    LF717           ; 2
    inc    $A0             ; 5
    bne    LF711           ; 2
LF734:
    lda    #$09            ; 2
    ora    $D7             ; 3
    sta    $D7             ; 3
    jmp    LF780           ; 3

LF73D:
    lda    $C9             ; 3
    asl                    ; 2
    bcc    LF778           ; 2
    lda    #$01            ; 2
    bit    $D7             ; 3
    beq    LF760           ; 2
    lda    $A0             ; 3
    cmp    #$90            ; 2
    bne    LF758           ; 2
    lda    #$FE            ; 2
    and    $D7             ; 3
    sta    $D7             ; 3
LF754:
    lda    #$01            ; 2
    bne    LF75C           ; 2
LF758:
    inc    $A0             ; 5
LF75A:
    lda    #$02            ; 2
LF75C:
    sta    $D8             ; 3
    bne    LF780           ; 2
LF760:
    lda    $C9             ; 3
    asl                    ; 2
    asl                    ; 2
    bcc    LF76E           ; 2
    lda    #$90            ; 2
    cmp    $A0             ; 3
    bne    LF758           ; 2
    beq    LF754           ; 2
LF76E:
    lda    #$70            ; 2
    cmp    $A0             ; 3
    beq    LF75A           ; 2
    dec    $A0             ; 5
    bne    LF754           ; 2
LF778:
    lda    #$F7            ; 2
    and    $D7             ; 3
    ora    #$01            ; 2
    sta    $D7             ; 3
LF780:
    lda    $C9             ; 3
    asl                    ; 2
    asl                    ; 2
    asl                    ; 2
    bcs    LF797           ; 2
    lda    $A1             ; 3
    cmp    #$16            ; 2
    bcc    LF7A8           ; 2
    lda    $F5             ; 3
    bne    LF793           ; 2
    dec    $A1             ; 5
LF793:
    dec    $A1             ; 5
    bne    LF7A8           ; 2
LF797:
    asl                    ; 2
    bcs    LF7A8           ; 2
    lda    $A1             ; 3
    cmp    #$63            ; 2
    bcs    LF7A8           ; 2
    lda    $F5             ; 3
    bne    LF7A6           ; 2
    inc    $A1             ; 5
LF7A6:
    inc    $A1             ; 5
LF7A8:
    lda    $F2             ; 3
    beq    LF7B4           ; 2
    lda    #$EC            ; 2
    sta    $E6             ; 3
    sta    $9F             ; 3
    bne    LF7BC           ; 2
LF7B4:
    lda    #$57            ; 2
    sta    $E6             ; 3
    lda    #$4F            ; 2
    sta    $9F             ; 3
LF7BC:
    lda    $A0             ; 3
    sta    $E4             ; 3
    sta    $E7             ; 3
    lda    $A1             ; 3
    sta    $E5             ; 3
    sta    $E8             ; 3
    lda    $D2             ; 3
    beq    LF7D5           ; 2
    lda    $F2             ; 3
    bne    LF83A           ; 2
    lda    REFP1           ; 3
    asl                    ; 2
    bcs    LF839           ; 2
LF7D5:
    lda    $A2             ; 3
    bne    LF839           ; 2
    lda    #$08            ; 2
    and    $D7             ; 3
    beq    LF7F7           ; 2
    lda    #$80            ; 2
    ora    $D7             ; 3
    sta    $D7             ; 3
    lda    $C9             ; 3
    asl                    ; 2
    asl                    ; 2
    bcs    LF818           ; 2
    lda    #$40            ; 2
    ora    $D7             ; 3
    sta    $D7             ; 3
    lda    $A0             ; 3
    sta    $A2             ; 3
    bne    LF80F           ; 2
LF7F7:
    lda    #$7F            ; 2
    and    $D7             ; 3
    sta    $D7             ; 3
    lda    $C9             ; 3
    asl                    ; 2
    bcs    LF818           ; 2
    lda    #$40            ; 2
    ora    $D7             ; 3
    sta    $D7             ; 3
    lda    $A0             ; 3
    clc                    ; 2
    adc    #$08            ; 2
    sta    $A2             ; 3
LF80F:
    lda    $A1             ; 3
    sec                    ; 2
    sbc    #$04            ; 2
    sta    $A6             ; 3
    bne    LF832           ; 2
LF818:
    lda    $A1             ; 3
    cmp    #$5F            ; 2
    bcs    LF839           ; 2
    lda    #$BF            ; 2
    and    $D7             ; 3
    sta    $D7             ; 3
    lda    $A0             ; 3
    clc                    ; 2
    adc    #$03            ; 2
    sta    $A2             ; 3
    lda    $A1             ; 3
    sec                    ; 2
    sbc    #$06            ; 2
    sta    $A6             ; 3
LF832:
    lda    #$7F            ; 2
    sta    $DD             ; 3
    jmp    LF88F           ; 3

LF839:
    nop                    ; 2
LF83A:
    ldx    #$03            ; 2
LF83C:
    lda    $D9,X           ; 4
    clc                    ; 2
    adc    $D8             ; 3
    bcs    LF851           ; 2
    cmp    #$A5            ; 2
    bcc    LF84B           ; 2
    lda    #$9F            ; 2
    bne    LF851           ; 2
LF84B:
    cmp    #$A0            ; 2
    bcc    LF851           ; 2
    lda    #$00            ; 2
LF851:
    sta    $D9,X           ; 4
    dex                    ; 2
    bpl    LF83C           ; 2
    lda    $A2             ; 3
    beq    LF88F           ; 2
    bit    $D7             ; 3
    bvs    LF86C           ; 2
    dec    $A6             ; 5
    bit    $D7             ; 3
    bpl    LF868           ; 2
    lda    #$FF            ; 2
    bne    LF874           ; 2
LF868:
    lda    #$01            ; 2
    bne    LF874           ; 2
LF86C:
    bpl    LF872           ; 2
    lda    #$FC            ; 2
    bne    LF874           ; 2
LF872:
    lda    #$04            ; 2
LF874:
    clc                    ; 2
    adc    $A2             ; 3
    sta    $A2             ; 3
    cmp    #$9F            ; 2
    bcs    LF887           ; 2
    cmp    #$05            ; 2
    bcc    LF887           ; 2
    lda    $A6             ; 3
    cmp    #$01            ; 2
    bcs    LF88F           ; 2
LF887:
    lda    #$00            ; 2
    sta    $A2             ; 3
    lda    #$9F            ; 2
    sta    $A6             ; 3
LF88F:
    nop                    ; 2
    dec    $E0             ; 5
    bpl    LF8C4           ; 2
    lda    #$0F            ; 2
    sta    $E0             ; 3
    ldx    #$02            ; 2
LF89A:
    jsr    LFC3F           ; 6
    sta    $C9             ; 3
    bit    $C9             ; 3
    bpl    LF8AA           ; 2
    lda    #$02            ; 2
    ora    $A7,X           ; 4
    jmp    LF8AE           ; 3

LF8AA:
    lda    #$FD            ; 2
    and    $A7,X           ; 4
LF8AE:
    sta    $A7,X           ; 4
    bit    $C9             ; 3
    bvs    LF8BB           ; 2
    lda    #$01            ; 2
    ora    $A7,X           ; 4
    jmp    LF8BF           ; 3

LF8BB:
    lda    #$FE            ; 2
    and    $A7,X           ; 4
LF8BF:
    sta    $A7,X           ; 4
    dex                    ; 2
    bpl    LF89A           ; 2
LF8C4:
    dec    $F1             ; 5
    bpl    LF940           ; 2
    lda    #$01            ; 2
    sta    $F1             ; 3
    ldx    #$02            ; 2
LF8CE:
    lda    $EA,X           ; 4
    beq    LF8D5           ; 2
    jmp    LF920           ; 3

LF8D5:
    lda    $A7,X           ; 4
    and    #$02            ; 2
    bne    LF8E3           ; 2
    lda    $AF,X           ; 4
    sec                    ; 2
    sbc    #$01            ; 2
    jmp    LF8E8           ; 3

LF8E3:
    lda    $AF,X           ; 4
    clc                    ; 2
    adc    #$01            ; 2
LF8E8:
    clc                    ; 2
    adc    $D8             ; 3
    sta    $AF,X           ; 4
    cmp    $A0             ; 3
    bcs    LF8F7           ; 2
    lda    #$08            ; 2
    ora    $A7,X           ; 4
    bne    LF8FB           ; 2
LF8F7:
    lda    #$F7            ; 2
    and    $A7,X           ; 4
LF8FB:
    sta    $A7,X           ; 4
    lda    $A7,X           ; 4
    and    #$01            ; 2
    bne    LF90B           ; 2
    lda    $B3,X           ; 4
    sec                    ; 2
    sbc    #$01            ; 2
    jmp    LF910           ; 3

LF90B:
    lda    $B3,X           ; 4
    clc                    ; 2
    adc    #$01            ; 2
LF910:
    cmp    #$14            ; 2
    bcc    LF91A           ; 2
    cmp    #$64            ; 2
    bcs    LF91A           ; 2
    sta    $B3,X           ; 4
LF91A:
    dex                    ; 2
    bpl    LF8CE           ; 2
    jmp    LF940           ; 3

LF920:
    lda    $AF,X           ; 4
    clc                    ; 2
    adc    $D8             ; 3
    sta    $AF,X           ; 4
    lda    $B3,X           ; 4
    sec                    ; 2
    sbc    #$01            ; 2
    sta    $B3,X           ; 4
    cmp    #$14            ; 2
    bcs    LF91A           ; 2
    lda    #$D0            ; 2
    sta    $AF,X           ; 4
    lda    #$3C            ; 2
    sta    $B3,X           ; 4
    lda    #$00            ; 2
    sta    $EA,X           ; 4
    beq    LF91A           ; 2
LF940:
    lda    $9D             ; 3
    clc                    ; 2
    adc    $D8             ; 3
    sta    $9D             ; 3
    cmp    #$D0            ; 2
    beq    LF94F           ; 2
    cmp    #$D1            ; 2
    bne    LF95D           ; 2
LF94F:
    lda    #$01            ; 2
    and    $D3             ; 3
    bne    LF959           ; 2
    lda    #$47            ; 2
    bne    LF95B           ; 2
LF959:
    lda    #$00            ; 2
LF95B:
    sta    $99             ; 3
LF95D:
    nop                    ; 2
    ldx    #$02            ; 2
LF960:
    lda    $B7,X           ; 4
    beq    LF96A           ; 2
    dex                    ; 2
    bpl    LF960           ; 2
    jmp    LFA07           ; 3

LF96A:
    ldy    $E1             ; 3
    cpy    #$03            ; 2
    bcs    LF9EF           ; 2
    cpy    $D4             ; 3
    bcs    LF979           ; 2
    lda.wy $00AF,Y         ; 4
    cmp    #$9F            ; 2
LF979:
    bcs    LF9F9           ; 2
    lda.wy $00AB,Y         ; 4
    cmp    #$5F            ; 2
    beq    LF9F9           ; 2
LF982:
    jsr    LFC3F           ; 6
    and    #$01            ; 2
    beq    LF9F9           ; 2
    cpy    #$03            ; 2
    bcs    LF9BD           ; 2
    lda    #$BF            ; 2
    and    $A7,X           ; 4
    sta    $A7,X           ; 4
    lda    #$08            ; 2
    and.wy $00A7,Y         ; 4
    bne    LF9A6           ; 2
    lda    #$7F            ; 2
    and    $A7,X           ; 4
    sta    $A7,X           ; 4
    lda.wy $00AF,Y         ; 4
    jmp    LF9B2           ; 3

LF9A6:
    lda    #$80            ; 2
    ora    $A7,X           ; 4
    sta    $A7,X           ; 4
    lda.wy $00AF,Y         ; 4
    clc                    ; 2
    adc    #$08            ; 2
LF9B2:
    sta    $B7,X           ; 4
    lda.wy $00B3,Y         ; 4
    sec                    ; 2
    sbc    #$04            ; 2
    jmp    LF9DE           ; 3

LF9BD:
    lda    #$40            ; 2
    ora    $A7,X           ; 4
    sta    $A7,X           ; 4
    lda    $9D             ; 3
    cmp    $A0             ; 3
    bcs    LF9CF           ; 2
    lda    #$20            ; 2
    ora    $A7,X           ; 4
    bne    LF9D3           ; 2
LF9CF:
    lda    #$DF            ; 2
    and    $A7,X           ; 4
LF9D3:
    sta    $A7,X           ; 4
    lda    $9D             ; 3
    clc                    ; 2
    adc    #$03            ; 2
    sta    $B7,X           ; 4
    lda    #$08            ; 2
LF9DE:
    sta    $BB,X           ; 4
    lda    #$3F            ; 2
    sta    $E2             ; 3
    dex                    ; 2
    bpl    LF9F9           ; 2
    dey                    ; 2
    bmi    LFA01           ; 2
    sty    $E1             ; 3
    jmp    LFA07           ; 3

LF9EF:
    lda    $9D             ; 3
    cmp    #$9F            ; 2
    bcs    LF9F9           ; 2
    lda    $99             ; 3
    beq    LF982           ; 2
LF9F9:
    dey                    ; 2
    bmi    LFA01           ; 2
    sty    $E1             ; 3
    jmp    LF960           ; 3

LFA01:
    lda    #$03            ; 2
    sta    $E1             ; 3
    bne    LFA07           ; 2
LFA07:
    nop                    ; 2
    ldx    #$02            ; 2
LFA0A:
    lda    $B7,X           ; 4
    bne    LFA14           ; 2
LFA0E:
    dex                    ; 2
    bpl    LFA0A           ; 2
    jmp    LFA56           ; 3

LFA14:
    lda    $A7,X           ; 4
    sta    $C9             ; 3
    lda    #$20            ; 2
    bit    $C9             ; 3
    bvs    LFA39           ; 2
    bpl    LFA28           ; 2
    lda    $B7,X           ; 4
    clc                    ; 2
    adc    #$02            ; 2
    jmp    LFA2D           ; 3

LFA28:
    lda    $B7,X           ; 4
    sec                    ; 2
    sbc    #$02            ; 2
LFA2D:
    sta    $B7,X           ; 4
    cmp    #$9F            ; 2
    bcc    LFA0E           ; 2
    lda    #$00            ; 2
    sta    $B7,X           ; 4
    beq    LFA0E           ; 2
LFA39:
    beq    LFA3F           ; 2
    inc    $B7,X           ; 6
    bne    LFA41           ; 2
LFA3F:
    dec    $B7,X           ; 6
LFA41:
    inc    $BB,X           ; 6
    lda    $B7,X           ; 4
    cmp    #$9F            ; 2
    bcs    LFA4F           ; 2
    lda    $BB,X           ; 4
    cmp    #$65            ; 2
    bcc    LFA53           ; 2
LFA4F:
    lda    #$00            ; 2
    sta    $B7,X           ; 4
LFA53:
    jmp    LFA0E           ; 3

LFA56:
    nop                    ; 2
    ldx    $DF             ; 3
    dex                    ; 2
    bpl    LFA5F           ; 2
    ldx    $D4             ; 3
    dex                    ; 2
LFA5F:
    stx    $DF             ; 3
    lda    $AF,X           ; 4
    cmp    #$9F            ; 2
    bcs    LFA74           ; 2
    sta    $AE             ; 3
    lda    $B3,X           ; 4
    sta    $B2             ; 3
    lda    $AB,X           ; 4
    sta    $AA             ; 3
    jmp    LFA78           ; 3

LFA74:
    lda    #$EC            ; 2
    sta    $AA             ; 3
LFA78:
    lda    $A7,X           ; 4
    and    #$08            ; 2
    sta    $BE             ; 3
    lda    $B7,X           ; 4
    sta    $B6             ; 3
    lda    $BB,X           ; 4
    sta    $BA             ; 3
    ldx    $9D             ; 3
    cpx    #$A0            ; 2
    bcc    LFA8E           ; 2
    ldx    #$00            ; 2
LFA8E:
    stx    $9C             ; 3
    lda    $DE             ; 3
    eor    #$40            ; 2
    and    #$F0            ; 2
    sta    $C9             ; 3
    lda    $DE             ; 3
    and    #$0F            ; 2
    sec                    ; 2
    sbc    #$01            ; 2
    bne    LFAE3           ; 2
    bit    $D5             ; 3
    bpl    LFAA9           ; 2
    lda    #$01            ; 2
    bne    LFAAB           ; 2
LFAA9:
    lda    #$03            ; 2
LFAAB:
    ora    $C9             ; 3
    eor    #$80            ; 2
    sta    $DE             ; 3
    lda    $D1             ; 3
    eor    #$80            ; 2
    sta    $D1             ; 3
    bit    $DE             ; 3
    bpl    LFACC           ; 2
    lda    $E6             ; 3
    sta    $E3             ; 3
    lda    $E7             ; 3
    sta    $E4             ; 3
    lda    $E8             ; 3
    sta    $E5             ; 3
    lda    #$67            ; 2
    jmp    LFADA           ; 3

LFACC:
    lda    $9F             ; 3
    sta    $E3             ; 3
    lda    $A0             ; 3
    sta    $E4             ; 3
    lda    $A1             ; 3
    sta    $E5             ; 3
    lda    #$6F            ; 2
LFADA:
    sta    $AB             ; 3
    sta    $AC             ; 3
    sta    $AD             ; 3
    jmp    LFAE7           ; 3

LFAE3:
    ora    $C9             ; 3
    sta    $DE             ; 3
LFAE7:
    ldx    #$02            ; 2
LFAE9:
    lda    $EA,X           ; 4
    beq    LFAF1           ; 2
    lda    #$5F            ; 2
    sta    $AB,X           ; 4
LFAF1:
    dex                    ; 2
    bpl    LFAE9           ; 2
    lda    $E5             ; 3
    cmp    $B2             ; 3
    beq    LFB1E           ; 2
    bcc    LFB0D           ; 2
    lda    #$80            ; 2
    ora    $C8             ; 3
    sta    $C8             ; 3
    lda    $E5             ; 3
    sta    $C9             ; 3
    lda    $B2             ; 3
    sta    $CA             ; 3
    jmp    LFB3A           ; 3

LFB0D:
    lda    #$7F            ; 2
    and    $C8             ; 3
    sta    $C8             ; 3
    lda    $E5             ; 3
    sta    $CA             ; 3
    lda    $B2             ; 3
    sta    $C9             ; 3
    jmp    LFB3A           ; 3

LFB1E:
    lda    #$00            ; 2
    sta    $CD             ; 3
    sta    $CF             ; 3
    lda    #$08            ; 2
    sta    $CE             ; 3
    lda    #$66            ; 2
    sec                    ; 2
    sbc    $E5             ; 3
    sta    $CC             ; 3
    lda    $E3             ; 3
    sta    $8E             ; 3
    lda    $AA             ; 3
    sta    $90             ; 3
    jmp    LFBC4           ; 3

LFB3A:
    lda    $C9             ; 3
    sec                    ; 2
    sbc    $CA             ; 3
    sta    $CB             ; 3
    cmp    #$08            ; 2
    beq    LFB50           ; 2
    bcc    LFB5D           ; 2
    sbc    #$08            ; 2
    ora    #$80            ; 2
    sta    $CE             ; 3
    jmp    LFB54           ; 3

LFB50:
    lda    #$00            ; 2
    sta    $CE             ; 3
LFB54:
    lda    #$08            ; 2
    sta    $CD             ; 3
    sta    $CF             ; 3
    jmp    LFB68           ; 3

LFB5D:
    sta    $CD             ; 3
    sta    $CF             ; 3
    lda    #$08            ; 2
    sec                    ; 2
    sbc    $CB             ; 3
    sta    $CE             ; 3
LFB68:
    lda    #$66            ; 2
    sec                    ; 2
    sbc    $C9             ; 3
    sta    $CC             ; 3
    bit    $C8             ; 3
    bpl    LFB9D           ; 2
    lda    #$EB            ; 2
    sta    $92             ; 3
    lda    $CB             ; 3
    cmp    #$08            ; 2
    bcc    LFB88           ; 2
    lda    $E3             ; 3
    sta    $8C             ; 3
    lda    $AA             ; 3
    sta    $94             ; 3
    jmp    LFBC4           ; 3

LFB88:
    lda    $E3             ; 3
    sta    $8E             ; 3
    clc                    ; 2
    adc    $CE             ; 3
    sta    $8C             ; 3
    lda    $AA             ; 3
    sta    $94             ; 3
    clc                    ; 2
    adc    $CF             ; 3
    sta    $90             ; 3
    jmp    LFBC4           ; 3

LFB9D:
    lda    #$EB            ; 2
    sta    $94             ; 3
    lda    $CB             ; 3
    cmp    #$08            ; 2
    bcc    LFBB2           ; 2
    lda    $AA             ; 3
    sta    $8C             ; 3
    lda    $E3             ; 3
    sta    $92             ; 3
    jmp    LFBC4           ; 3

LFBB2:
    lda    $AA             ; 3
    sta    $90             ; 3
    clc                    ; 2
    adc    $CE             ; 3
    sta    $8C             ; 3
    lda    $E3             ; 3
    sta    $92             ; 3
    clc                    ; 2
    adc    $CF             ; 3
    sta    $8E             ; 3
LFBC4:
    nop                    ; 2
    ldx    #$01            ; 2
    lda    $9C             ; 3
    jsr    LFC20           ; 6   here
    sta    $C9             ; 3
    dey                    ; 2
    dey                    ; 2
    dey                    ; 2
    asl    $9A             ; 5
    cpy    #$06            ; 2
    ror    $9A             ; 5
    tya                    ; 2
    cmp    #$06            ; 2
    bcc    LFBDF           ; 2
    sec                    ; 2
    sbc    #$06            ; 2
LFBDF:
    ora    $C9             ; 3
    sta    $9B             ; 3
    sed                    ; 2
    ldx    #$01            ; 2
    lda    #$FE            ; 2
    sta    $CA             ; 3
LFBEA:
    lda    LFEA6,X         ; 4
    sta    $C9             ; 3
    ldy    #$02            ; 2
LFBF1:
    lda.wy $00C2,Y         ; 4
    sbc    ($C9),Y         ; 5
    dey                    ; 2
    bpl    LFBF1           ; 2
    bcs    LFC04           ; 2
    dex                    ; 2
    bpl    LFBEA           ; 2
    lda    #$01            ; 2
    sta    $D4             ; 3
    bne    LFC09           ; 2
LFC04:
    lda    LFEA8,X         ; 4
    sta    $D4             ; 3
LFC09:
    cld                    ; 2
    nop                    ; 2
    lda    $F5             ; 3
    beq    LFC1D           ; 2
    lda    $C2             ; 3
    cmp    #$05            ; 2
    bcc    LFC1D           ; 2
    lda    #$00            ; 2
    sta    $C4             ; 3
    sta    $C3             ; 3
    sta    $C2             ; 3
LFC1D:
    jmp    LF017           ; 3

LFC20:
    clc                    ; 2
    adc    #$2E            ; 2
    tay                    ; 2
    and    #$0F            ; 2
    sta    $C9             ; 3
    tya                    ; 2
    lsr                    ; 2
    lsr                    ; 2
    lsr                    ; 2
    lsr                    ; 2
    tay                    ; 2
    clc                    ; 2
    adc    $C9             ; 3
    cmp    #$0F            ; 2
    bcc    LFC38           ; 2
    sbc    #$0F            ; 2
    iny                    ; 2
LFC38:
    eor    #$07            ; 2
LFC3A:
    asl                    ; 2
    asl                    ; 2
LFC3C:
    asl                    ; 2
    asl                    ; 2
    rts                    ; 6

LFC3F:
    lda    $D3             ; 3
    and    #$40            ; 2
    lsr                    ; 2
    sta    $CA             ; 3
    lda    $D3             ; 3
    and    #$20            ; 2
    eor    $CA             ; 3
    bne    LFC51           ; 2
    clc                    ; 2
    bcc    LFC52           ; 2
LFC51:
    sec                    ; 2
LFC52:
    lda    $D3             ; 3
    rol                    ; 2
    sta    $D3             ; 3
    rts                    ; 6

    .byte $18 ; |   XX   | $FC58
    .byte $69 ; | XX X  X| $FC59
    .byte $2E ; |  X XXX | $FC5A
    .byte $A8 ; |X X X   | $FC5B
    .byte $29 ; |  X X  X| $FC5C
    .byte $0F ; |    XXXX| $FC5D
    .byte $85 ; |X    X X| $FC5E
    .byte $C9 ; |XX  X  X| $FC5F
    .byte $98 ; |X  XX   | $FC60
    .byte $4A ; | X  X X | $FC61
    .byte $4A ; | X  X X | $FC62
    .byte $4A ; | X  X X | $FC63
    .byte $4A ; | X  X X | $FC64
    .byte $A8 ; |X X X   | $FC65
    .byte $18 ; |   XX   | $FC66
    .byte $65 ; | XX  X X| $FC67
    .byte $C9 ; |XX  X  X| $FC68
    .byte $C9 ; |XX  X  X| $FC69
    .byte $0F ; |    XXXX| $FC6A
    .byte $90 ; |X  X    | $FC6B
    .byte $03 ; |      XX| $FC6C
    .byte $E9 ; |XXX X  X| $FC6D
    .byte $0F ; |    XXXX| $FC6E
    .byte $C8 ; |XX  X   | $FC6F
    .byte $49 ; | X  X  X| $FC70
    .byte $07 ; |     XXX| $FC71
    .byte $0A ; |    X X | $FC72
    .byte $0A ; |    X X | $FC73
    .byte $0A ; |    X X | $FC74
    .byte $0A ; |    X X | $FC75
LFC76:
    sta    HMP0,X          ; 4
    sta    WSYNC           ; 3
LFC7A:
    dey                    ; 2
    bpl    LFC7A           ; 2
    sta    RESP0,X         ; 4
    rts                    ; 6

    stx    $C9             ; 3
    lsr    $C9             ; 5
    ldy    $C9             ; 3
    rts                    ; 6

    stx    $C9             ; 3
    asl    $C9             ; 5
    ldy    $C9             ; 3
    rts                    ; 6

LFC8E:
    clc                    ; 2
    adc    $D4             ; 3
    tax                    ; 2
    lda    $F5             ; 3
    beq    LFC97           ; 2
    rts                    ; 6

LFC97:
    lda    LFEC2,X         ; 4
    sta    $EE             ; 3
    sed                    ; 2
    ldy    #$02            ; 2
    lda    #$00            ; 2
    sta    $C9             ; 3
LFCA3:
    lda    ($EE),Y         ; 5
    asl    $C9             ; 5
    asl    $C9             ; 5
    asl    $C9             ; 5
    asl    $C9             ; 5
    asl    $C9             ; 5
    asl    $C9             ; 5
    asl    $C9             ; 5
    adc.wy $00C2,Y         ; 4
    sta.wy $00C2,Y         ; 5
    rol    $C9             ; 5
    lda    ($EE),Y         ; 5
    adc.wy $00C5,Y         ; 4
    sta.wy $00C5,Y         ; 5
    rol    $C9             ; 5
    dey                    ; 2
    bpl    LFCA3           ; 2
    cld                    ; 2
    rts                    ; 6

LFCCA:
    clc                    ; 2
    adc    $D4             ; 3
    tay                    ; 2
    lda    $F5             ; 3
    beq    LFCD3           ; 2
    rts                    ; 6

LFCD3:
    lda    LFEC2,Y         ; 4
    sta    $EE             ; 3
    sed                    ; 2
    ldy    #$02            ; 2
    lda    #$03            ; 2
    sta    $C9             ; 3
LFCDF:
    lda.wy $00C2,Y         ; 4
    asl    $C9             ; 5
    asl    $C9             ; 5
    asl    $C9             ; 5
    asl    $C9             ; 5
    asl    $C9             ; 5
    asl    $C9             ; 5
    asl    $C9             ; 5
    sbc    ($EE),Y         ; 5
    sta.wy $00C2,Y         ; 5
    rol    $C9             ; 5
    lda.wy $00C5,Y         ; 4
    sbc    ($EE),Y         ; 5
    sta.wy $00C5,Y         ; 5
    rol    $C9             ; 5
    dey                    ; 2
    bpl    LFCDF           ; 2
    lda    #$02            ; 2
    and    $C9             ; 3
    bne    LFD10           ; 2
    sta    $C2             ; 3
    sta    $C3             ; 3
    sta    $C4             ; 3
LFD10:
    lda    #$01            ; 2
    and    $C9             ; 3
    bne    LFD1C           ; 2
    sta    $C5             ; 3
    sta    $C6             ; 3
    sta    $C7             ; 3
LFD1C:
    cld                    ; 2
    rts                    ; 6

LFD1E:
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    lda    $C9             ; 3
    jsr    LFC20           ; 6
    dey                    ; 2
    dey                    ; 2
    sta    WSYNC           ; 3
    nop                    ; 2
LFD2C:
    dey                    ; 2
    bpl    LFD2C           ; 2
    sta    HMP0            ; 3
    sta    HMP0            ; 3
    sta    HMP0            ; 3
    sta    RESP0           ; 3
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    lda    $CA             ; 3
    jsr    LFC20           ; 6
    sta    HMCLR           ; 3
    dey                    ; 2
    dey                    ; 2
    sta    WSYNC           ; 3
LFD46:
    dey                    ; 2
    bpl    LFD46           ; 2
    nop                    ; 2
    sta    HMP1            ; 3
    sta    HMP1            ; 3
    sta    HMP1            ; 3
    sta    RESP1           ; 3
    sta    WSYNC           ; 3
    sta    HMOVE           ; 3
    rts                    ; 6

LFD57:
    lda    #$FF            ; 2
    sta    $F2             ; 3
    lda    $D7             ; 3
    and    #$F7            ; 2
    ora    #$01            ; 2
    sta    $D7             ; 3
    lda    #$11            ; 2
    sta    $A0             ; 3
    lda    #$64            ; 2
    sta    $A1             ; 3
    rts                    ; 6

LFD6C:
    ldx    #$16            ; 2
    lda    #$FF            ; 2
LFD70:
    sta    $81,X           ; 4
    dex                    ; 2
    dex                    ; 2
    bpl    LFD70           ; 2
    lda    #$0F            ; 2
    sta    COLUPF          ; 3
    lda    #$AA            ; 2
    sta    $96             ; 3
    lda    #$37            ; 2
    sta    $98             ; 3
    lda    #$02            ; 2
    sta    $99             ; 3
    lda    #$20            ; 2
    sta    $9A             ; 3
    lda    #$60            ; 2
    sta    $9C             ; 3
    lda    #$4F            ; 2
    sta    $9F             ; 3
    lda    #$11            ; 2
    sta    $A0             ; 3
    lda    #$64            ; 2
    sta    $A1             ; 3
    lda    #$67            ; 2
    sta    $AA             ; 3
    lda    #$00            ; 2
    sta    $AE             ; 3
    lda    #$32            ; 2
    sta    $B2             ; 3
    lda    #$60            ; 2
    sta    $B6             ; 3
    lda    #$2F            ; 2
    sta    $BA             ; 3
    lda    #$5C            ; 2
    sta    $D3             ; 3
    lda    #$08            ; 2
    sta    $D9             ; 3
    lda    #$40            ; 2
    sta    $DA             ; 3
    lda    #$60            ; 2
    sta    $DB             ; 3
    lda    #$28            ; 2
    sta    $DC             ; 3
    lda    #$03            ; 2
    sta    $DE             ; 3
    lda    #$D0            ; 2
    sta    $AF             ; 3
    lda    #$D0            ; 2
    sta    $B0             ; 3
    lda    #$D0            ; 2
    sta    $B1             ; 3
    lda    #$3C            ; 2
    sta    $B3             ; 3
    lda    #$28            ; 2
    sta    $B4             ; 3
    lda    #$1E            ; 2
    sta    $B5             ; 3
    lda    #$40            ; 2
    sta    $9D             ; 3
    lda    #$01            ; 2
    sta    $D4             ; 3
    lda    #$FE            ; 2
    sta    $EF             ; 3
    lda    #$13            ; 2
    sta    $F0             ; 3
    lda    #$00            ; 2
    sta    $D5             ; 3
    lda    #$EC            ; 2
    sta    $E6             ; 3
    jsr    LFD57           ; 6
    ldx    #$05            ; 2
    lda    #$00            ; 2
LFDFD:
    sta    $C2,X           ; 4
    dex                    ; 2
    bpl    LFDFD           ; 2
    rts                    ; 6

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
    .byte $18 ; |   XX   | $FE2D
    .byte $3C ; |  XXXX  | $FE2E
    .byte $DB ; |XX XX XX| $FE2F
    .byte $DB ; |XX XX XX| $FE30
    .byte $DB ; |XX XX XX| $FE31
    .byte $3C ; |  XXXX  | $FE32
    .byte $18 ; |   XX   | $FE33
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
    .byte $21 ; |  X    X| $FE61
    .byte $4A ; | X  X X | $FE62
    .byte $00 ; |        | $FE63
    .byte $A5 ; |X X  X X| $FE64
    .byte $00 ; |        | $FE65
    .byte $62 ; | XX   X | $FE66
    .byte $10 ; |   X    | $FE67
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
    .byte $10 ; |   X    | $FE97
    .byte $28 ; |  X X   | $FE98
    .byte $10 ; |   X    | $FE99
    .byte $00 ; |        | $FE9A
    .byte $00 ; |        | $FE9B
    .byte $00 ; |        | $FE9C
    .byte $00 ; |        | $FE9D
    .byte $00 ; |        | $FE9E
    .byte $00 ; |        | $FE9F
    .byte $01 ; |       X| $FEA0
    .byte $00 ; |        | $FEA1
    .byte $00 ; |        | $FEA2
    .byte $03 ; |      XX| $FEA3
    .byte $00 ; |        | $FEA4
    .byte $00 ; |        | $FEA5
LFEA6:
    .byte $A0 ; |X X     | $FEA6
    .byte $A3 ; |X X   XX| $FEA7
LFEA8:
    .byte $02 ; |      X | $FEA8
    .byte $03 ; |      XX| $FEA9
    .byte $B6 ; |X XX XX | $FEAA
    .byte $AE ; |X X XXX | $FEAB
    .byte $B2 ; |X XX  X | $FEAC
    .byte $B3 ; |X XX  XX| $FEAD
    .byte $AE ; |X X XXX | $FEAE
    .byte $CF ; |XX  XXXX| $FEAF
    .byte $00 ; |        | $FEB0
    .byte $01 ; |       X| $FEB1
    .byte $00 ; |        | $FEB2
    .byte $00 ; |        | $FEB3
    .byte $02 ; |      X | $FEB4
    .byte $00 ; |        | $FEB5
    .byte $00 ; |        | $FEB6
    .byte $03 ; |      XX| $FEB7
    .byte $00 ; |        | $FEB8
    .byte $00 ; |        | $FEB9
    .byte $05 ; |     X X| $FEBA
    .byte $00 ; |        | $FEBB
    .byte $00 ; |        | $FEBC
    .byte $10 ; |   X    | $FEBD
    .byte $00 ; |        | $FEBE
    .byte $00 ; |        | $FEBF
    .byte $15 ; |   X X X| $FEC0
    .byte $00 ; |        | $FEC1
LFEC2:
    .byte $00 ; |        | $FEC2
    .byte $B0 ; |X XX    | $FEC3
    .byte $B3 ; |X XX  XX| $FEC4
    .byte $B6 ; |X XX XX | $FEC5
    .byte $00 ; |        | $FEC6
    .byte $B9 ; |X XXX  X| $FEC7
    .byte $BC ; |X XXXX  | $FEC8
    .byte $BF ; |X XXXXXX| $FEC9
    .byte $B1 ; |X XX   X| $FECA
    .byte $B5 ; |X XX X X| $FECB
    .byte $A0 ; |X X     | $FECC
    .byte $A0 ; |X X     | $FECD
    .byte $A0 ; |X X     | $FECE
    .byte $A0 ; |X X     | $FECF
    .byte $A0 ; |X X     | $FED0
    .byte $A0 ; |X X     | $FED1
    .byte $A0 ; |X X     | $FED2
    .byte $A0 ; |X X     | $FED3
LFED4:
    .byte $50 ; | X X    | $FED4
    .byte $A0 ; |X X     | $FED5
LFED6:
    .byte $A0 ; |X X     | $FED6
    .byte $50 ; | X X    | $FED7
LFED8:
    .byte $94 ; |X  X X  | $FED8
    .byte $6B ; | XX X XX| $FED9
LFEDA:
    .byte $6B ; | XX X XX| $FEDA
    .byte $94 ; |X  X X  | $FEDB
LFEDC:
    .byte $B5 ; |X XX X X| $FEDC
    .byte $4A ; | X  X X | $FEDD
LFEDE:
    .byte $4A ; | X  X X | $FEDE
    .byte $B5 ; |X XX X X| $FEDF
    .byte $00 ; |        | $FEE0
    .byte $FD ; |XXXXXX X| $FEE1
    .byte $84 ; |X    X  | $FEE2
    .byte $B4 ; |X XX X  | $FEE3
    .byte $A5 ; |X X  X X| $FEE4
    .byte $B5 ; |X XX X X| $FEE5
    .byte $85 ; |X    X X| $FEE6
    .byte $FD ; |XXXXXX X| $FEE7
    .byte $00 ; |        | $FEE8
    .byte $BE ; |X XXXXX | $FEE9
    .byte $AA ; |X X X X | $FEEA
    .byte $AA ; |X X X X | $FEEB
    .byte $BB ; |X XXX XX| $FEEC
    .byte $00 ; |        | $FEED
    .byte $00 ; |        | $FEEE
    .byte $FF ; |XXXXXXXX| $FEEF
    .byte $00 ; |        | $FEF0
    .byte $D7 ; |XX X XXX| $FEF1
    .byte $95 ; |X  X X X| $FEF2
    .byte $95 ; |X  X X X| $FEF3
    .byte $DF ; |XX XXXXX| $FEF4
    .byte $10 ; |   X    | $FEF5
    .byte $10 ; |   X    | $FEF6
    .byte $D0 ; |XX X    | $FEF7
    .byte $00 ; |        | $FEF8
    .byte $76 ; | XXX XX | $FEF9
    .byte $54 ; | X X X  | $FEFA
    .byte $76 ; | XXX XX | $FEFB
    .byte $52 ; | X X  X | $FEFC
    .byte $76 ; | XXX XX | $FEFD
    .byte $01 ; |       X| $FEFE
    .byte $01 ; |       X| $FEFF
    .byte $3C ; |  XXXX  | $FF00
    .byte $66 ; | XX  XX | $FF01
    .byte $66 ; | XX  XX | $FF02
    .byte $66 ; | XX  XX | $FF03
    .byte $66 ; | XX  XX | $FF04
    .byte $66 ; | XX  XX | $FF05
    .byte $66 ; | XX  XX | $FF06
    .byte $3C ; |  XXXX  | $FF07
    .byte $3C ; |  XXXX  | $FF08
    .byte $18 ; |   XX   | $FF09
    .byte $18 ; |   XX   | $FF0A
    .byte $18 ; |   XX   | $FF0B
    .byte $18 ; |   XX   | $FF0C
    .byte $18 ; |   XX   | $FF0D
    .byte $38 ; |  XXX   | $FF0E
    .byte $18 ; |   XX   | $FF0F
    .byte $7E ; | XXXXXX | $FF10
    .byte $60 ; | XX     | $FF11
    .byte $60 ; | XX     | $FF12
    .byte $3C ; |  XXXX  | $FF13
    .byte $06 ; |     XX | $FF14
    .byte $06 ; |     XX | $FF15
    .byte $46 ; | X   XX | $FF16
    .byte $3C ; |  XXXX  | $FF17
    .byte $3C ; |  XXXX  | $FF18
    .byte $46 ; | X   XX | $FF19
    .byte $06 ; |     XX | $FF1A
    .byte $0C ; |    XX  | $FF1B
    .byte $0C ; |    XX  | $FF1C
    .byte $06 ; |     XX | $FF1D
    .byte $46 ; | X   XX | $FF1E
    .byte $3C ; |  XXXX  | $FF1F
    .byte $0C ; |    XX  | $FF20
    .byte $0C ; |    XX  | $FF21
    .byte $0C ; |    XX  | $FF22
    .byte $7E ; | XXXXXX | $FF23
    .byte $4C ; | X  XX  | $FF24
    .byte $2C ; |  X XX  | $FF25
    .byte $1C ; |   XXX  | $FF26
    .byte $0C ; |    XX  | $FF27
    .byte $7C ; | XXXXX  | $FF28
    .byte $46 ; | X   XX | $FF29
    .byte $06 ; |     XX | $FF2A
    .byte $06 ; |     XX | $FF2B
    .byte $7C ; | XXXXX  | $FF2C
    .byte $60 ; | XX     | $FF2D
    .byte $60 ; | XX     | $FF2E
    .byte $7E ; | XXXXXX | $FF2F
    .byte $3C ; |  XXXX  | $FF30
    .byte $66 ; | XX  XX | $FF31
    .byte $66 ; | XX  XX | $FF32
    .byte $66 ; | XX  XX | $FF33
    .byte $7C ; | XXXXX  | $FF34
    .byte $60 ; | XX     | $FF35
    .byte $62 ; | XX   X | $FF36
    .byte $3C ; |  XXXX  | $FF37
    .byte $18 ; |   XX   | $FF38
    .byte $18 ; |   XX   | $FF39
    .byte $18 ; |   XX   | $FF3A
    .byte $18 ; |   XX   | $FF3B
    .byte $0C ; |    XX  | $FF3C
    .byte $06 ; |     XX | $FF3D
    .byte $42 ; | X    X | $FF3E
    .byte $7E ; | XXXXXX | $FF3F
    .byte $3C ; |  XXXX  | $FF40
    .byte $66 ; | XX  XX | $FF41
    .byte $66 ; | XX  XX | $FF42
    .byte $3C ; |  XXXX  | $FF43
    .byte $3C ; |  XXXX  | $FF44
    .byte $66 ; | XX  XX | $FF45
    .byte $66 ; | XX  XX | $FF46
    .byte $3C ; |  XXXX  | $FF47
    .byte $3C ; |  XXXX  | $FF48
    .byte $46 ; | X   XX | $FF49
    .byte $06 ; |     XX | $FF4A
    .byte $3E ; |  XXXXX | $FF4B
    .byte $66 ; | XX  XX | $FF4C
    .byte $66 ; | XX  XX | $FF4D
    .byte $66 ; | XX  XX | $FF4E
    .byte $3C ; |  XXXX  | $FF4F
    .byte $00 ; |        | $FF50
    .byte $00 ; |        | $FF51
    .byte $3E ; |  XXXXX | $FF52
    .byte $E3 ; |XXX   XX| $FF53
    .byte $7F ; | XXXXXXX| $FF54
    .byte $66 ; | XX  XX | $FF55
    .byte $C0 ; |XX      | $FF56
    .byte $80 ; |X       | $FF57
    .byte $00 ; |        | $FF58
    .byte $00 ; |        | $FF59
    .byte $3E ; |  XXXXX | $FF5A
    .byte $03 ; |      XX| $FF5B
    .byte $7F ; | XXXXXXX| $FF5C
    .byte $66 ; | XX  XX | $FF5D
    .byte $C0 ; |XX      | $FF5E
    .byte $80 ; |X       | $FF5F
    .byte $C0 ; |XX      | $FF60
    .byte $80 ; |X       | $FF61
    .byte $48 ; | X  X   | $FF62
    .byte $00 ; |        | $FF63
    .byte $40 ; | X      | $FF64
    .byte $19 ; |   XX  X| $FF65
    .byte $49 ; | X  X  X| $FF66
    .byte $00 ; |        | $FF67
    .byte $70 ; | XXX    | $FF68
    .byte $20 ; |  X     | $FF69
    .byte $7E ; | XXXXXX | $FF6A
    .byte $FB ; |XXXXX XX| $FF6B
    .byte $70 ; | XXX    | $FF6C
    .byte $20 ; |  X     | $FF6D
    .byte $E0 ; |XXX     | $FF6E
    .byte $38 ; |  XXX   | $FF6F
    .byte $70 ; | XXX    | $FF70
    .byte $20 ; |  X     | $FF71
    .byte $7E ; | XXXXXX | $FF72
    .byte $FB ; |XXXXX XX| $FF73
    .byte $70 ; | XXX    | $FF74
    .byte $20 ; |  X     | $FF75
    .byte $38 ; |  XXX   | $FF76
    .byte $E0 ; |XXX     | $FF77
    .byte $00 ; |        | $FF78
    .byte $ED ; |XXX XX X| $FF79
    .byte $A8 ; |X X X   | $FF7A
    .byte $EC ; |XXX XX  | $FF7B
    .byte $A4 ; |X X  X  | $FF7C
    .byte $EC ; |XXX XX  | $FF7D
    .byte $00 ; |        | $FF7E
    .byte $00 ; |        | $FF7F
    .byte $00 ; |        | $FF80
    .byte $2E ; |  X XXX | $FF81
    .byte $22 ; |  X   X | $FF82
    .byte $2E ; |  X XXX | $FF83
    .byte $2A ; |  X X X | $FF84
    .byte $2E ; |  X XXX | $FF85
    .byte $00 ; |        | $FF86
    .byte $00 ; |        | $FF87
    .byte $00 ; |        | $FF88
    .byte $5C ; | X XXX  | $FF89
    .byte $54 ; | X X X  | $FF8A
    .byte $54 ; | X X X  | $FF8B
    .byte $DC ; |XX XXX  | $FF8C
    .byte $00 ; |        | $FF8D
    .byte $00 ; |        | $FF8E
    .byte $00 ; |        | $FF8F
    .byte $00 ; |        | $FF90
    .byte $5D ; | X XXX X| $FF91
    .byte $51 ; | X X   X| $FF92
    .byte $51 ; | X X   X| $FF93
    .byte $DD ; |XX XXX X| $FF94
    .byte $01 ; |       X| $FF95
    .byte $01 ; |       X| $FF96
    .byte $FD ; |XXXXXX X| $FF97
    .byte $00 ; |        | $FF98
    .byte $BD ; |X XXXX X| $FF99
    .byte $A9 ; |X X X  X| $FF9A
    .byte $A9 ; |X X X  X| $FF9B
    .byte $BB ; |X XXX XX| $FF9C
    .byte $00 ; |        | $FF9D
    .byte $00 ; |        | $FF9E
    .byte $FF ; |XXXXXXXX| $FF9F
    .byte $00 ; |        | $FFA0
    .byte $FD ; |XXXXXX X| $FFA1
    .byte $84 ; |X    X  | $FFA2
    .byte $B4 ; |X XX X  | $FFA3
    .byte $A5 ; |X X  X X| $FFA4
    .byte $B5 ; |X XX X X| $FFA5
    .byte $85 ; |X    X X| $FFA6
    .byte $FD ; |XXXXXX X| $FFA7
    .byte $00 ; |        | $FFA8
    .byte $2A ; |  X X X | $FFA9
    .byte $3E ; |  XXXXX | $FFAA
    .byte $3E ; |  XXXXX | $FFAB
    .byte $7F ; | XXXXXXX| $FFAC
    .byte $7F ; | XXXXXXX| $FFAD
    .byte $FC ; |XXXXXX  | $FFAE
    .byte $FC ; |XXXXXX  | $FFAF
    .byte $1C ; |   XXX  | $FFB0
    .byte $18 ; |   XX   | $FFB1
    .byte $08 ; |    X   | $FFB2
    .byte $08 ; |    X   | $FFB3
LFFB4:
    .byte $00 ; |        | $FFB4
    .byte $10 ; |   X    | $FFB5
    .byte $30 ; |  XX    | $FFB6
    .byte $38 ; |  XXX   | $FFB7
    .byte $78 ; | XXXX   | $FFB8
    .byte $78 ; | XXXX   | $FFB9
    .byte $FC ; |XXXXXX  | $FFBA
    .byte $FC ; |XXXXXX  | $FFBB
    .byte $FC ; |XXXXXX  | $FFBC
    .byte $FC ; |XXXXXX  | $FFBD
    .byte $78 ; | XXXX   | $FFBE
    .byte $38 ; |  XXX   | $FFBF
    .byte $10 ; |   X    | $FFC0
    .byte $00 ; |        | $FFC1
    .byte $00 ; |        | $FFC2
LFFC3:
    .byte $00 ; |        | $FFC3
    .byte $00 ; |        | $FFC4
    .byte $00 ; |        | $FFC5
    .byte $3E ; |  XXXXX | $FFC6
    .byte $7E ; | XXXXXX | $FFC7
    .byte $7F ; | XXXXXXX| $FFC8
    .byte $7F ; | XXXXXXX| $FFC9
    .byte $1F ; |   XXXXX| $FFCA
    .byte $0C ; |    XX  | $FFCB
    .byte $00 ; |        | $FFCC
    .byte $00 ; |        | $FFCD
    .byte $00 ; |        | $FFCE
    .byte $00 ; |        | $FFCF
    .byte $00 ; |        | $FFD0
    .byte $00 ; |        | $FFD1
LFFD2:
    .byte $00 ; |        | $FFD2
    .byte $18 ; |   XX   | $FFD3
    .byte $3C ; |  XXXX  | $FFD4
    .byte $3E ; |  XXXXX | $FFD5
    .byte $7F ; | XXXXXXX| $FFD6
    .byte $FF ; |XXXXXXXX| $FFD7
    .byte $FF ; |XXXXXXXX| $FFD8
    .byte $FE ; |XXXXXXX | $FFD9
    .byte $FE ; |XXXXXXX | $FFDA
    .byte $7C ; | XXXXX  | $FFDB
    .byte $7C ; | XXXXX  | $FFDC
    .byte $38 ; |  XXX   | $FFDD
    .byte $38 ; |  XXX   | $FFDE
    .byte $10 ; |   X    | $FFDF
    .byte $10 ; |   X    | $FFE0
LFFE1:
    .byte $00 ; |        | $FFE1
    .byte $00 ; |        | $FFE2
    .byte $00 ; |        | $FFE3
    .byte $38 ; |  XXX   | $FFE4
    .byte $7E ; | XXXXXX | $FFE5
    .byte $FF ; |XXXXXXXX| $FFE6
    .byte $FF ; |XXXXXXXX| $FFE7
    .byte $FE ; |XXXXXXX | $FFE8
    .byte $7C ; | XXXXX  | $FFE9
    .byte $38 ; |  XXX   | $FFEA
    .byte $18 ; |   XX   | $FFEB
LFFEC:
    .byte $00 ; |        | $FFEC
    .byte $00 ; |        | $FFED
    .byte $00 ; |        | $FFEE
    .byte $00 ; |        | $FFEF
    .byte $00 ; |        | $FFF0
    .byte $00 ; |        | $FFF1
    .byte $00 ; |        | $FFF2
    .byte $00 ; |        | $FFF3
    .byte $00 ; |        | $FFF4
    .byte $10 ; |   X    | $FFF5
    .byte $10 ; |   X    | $FFF6
    .byte $10 ; |   X    | $FFF7
    .byte $54 ; | X X X  | $FFF8
    .byte $44 ; | X   X  | $FFF9
    .byte $6C ; | XX XX  | $FFFA
    .byte $38 ; |  XXX   | $FFFB
    .byte $00 ; |        | $FFFC
    .byte $F0 ; |XXXX    | $FFFD
    .byte $00 ; |        | $FFFE
    .byte $00 ; |        | $FFFF
