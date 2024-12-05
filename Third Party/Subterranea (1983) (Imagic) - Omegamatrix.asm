; Disassembly of Subterranea
; by Omegamatrix
; Using DiStella v3.0
;
; Command Line: distella -pasfcsub1.cfg sub1.bin > sub1.asm
;
; sub1.cfg contents:
;
;      ORG 1000
;      CODE 1000 1002
;      GFX 1003 1005
;      CODE 1006 100B
;      GFX 100C 1017
;      CODE 1018 1337
;      GFX 1338 133E
;      CODE 133F 1703
;      GFX 1704 1707
;      CODE 1708 1859
;      GFX 185A 18D5
;      CODE 18D6 18F8
;      GFX 18F9 1BF3
;      CODE 1BF4 1BFB
;      GFX 1BFC 1CD2
;      CODE 1CD3 1CFD
;      GFX 1CFE 1FDC
;      CODE 1FDD 1FF6
;      GFX 1FF7 1FFF
;
;
; Command Line: distella -pasfcsub2.cfg sub2.bin > sub2.asm
;
; sub2.cfg contents:
;
;      ORG 3000
;      GFX 3000 3002
;      CODE 3003 3317
;      GFX 3318 332C
;      CODE 332D 38CE
;      GFX 38CF 38D1
;      CODE 38D2 3956
;      GFX 3957 3976
;      CODE 3977 3C73
;      GFX 3C74 3C7B
;      CODE 3C7C 3D56
;      GFX 3D57 3D5E
;      CODE 3D5F 3D80
;      GFX 3D81 3D97
;      CODE 3D98 3E7D
;      GFX 3E7E 3FFF

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
AUDF0   =  $17
AUDV0   =  $19
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMBL    =  $24
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXM0P   =  $30
CXPPMM  =  $37
INPT4   =  $3C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIMINT  =  $0285
TIM8T   =  $0295
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      CONSTANTS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

TIME_VBLANK        = $2B
TIME_OVERSCAN      = $21

BANK_0             = $1FF8
BANK_1             = $1FF9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

frameCounter       = $CC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      FIRST BANK
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $1000

START:
    sta    BANK_1                   ; bankswitch, goto L372C

    .byte $07 ; |     XXX| $1003   garbage?
    .byte $05 ; |     X X| $1004
    .byte $83 ; |X     XX| $1005

L1006:
    sta    BANK_1                   ; bankswitch

;from bank 1
    jmp    L1018                 ; 3

    .byte $00 ; |        | $100C    free bytes
    .byte $FF ; |XXXXXXXX| $100D
    .byte $FF ; |XXXXXXXX| $100E
    .byte $FF ; |XXXXXXXX| $100F
    .byte $FF ; |XXXXXXXX| $1010
    .byte $FF ; |XXXXXXXX| $1011
    .byte $FF ; |XXXXXXXX| $1012
    .byte $FF ; |XXXXXXXX| $1013
    .byte $FF ; |XXXXXXXX| $1014
    .byte $FF ; |XXXXXXXX| $1015
    .byte $FF ; |XXXXXXXX| $1016
    .byte $FF ; |XXXXXXXX| $1017

L1018:
    lda    frameCounter
    and    #$03                     ; every 4 frames
    bne    L1031                 ; 2³
    ldx    $C9                   ; 3
    cpx    #4                    ; 2
    bne    L102A                 ; 2³
    lda    $E3                   ; 3
    cmp    #$C0                  ; 2
    bcs    L1031                 ; 2³
L102A:
    txa                          ; 2
    clc                          ; 2
    adc    L1FC9,X               ; 4
    sta    $C9                   ; 3
L1031:
    lda    $E3                   ; 3
    and    #$01                  ; 2
    tax                          ; 2
    lda    L1BF2,X               ; 4
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    bit    $E6                   ; 3
    bpl    L105D                 ; 2³
    ldy    #$FF                  ; 2
    ldx    $92                   ; 3
L1045:
    lda    $8A,X                 ; 4
    cmp    #$A2                  ; 2
    bcc    L104F                 ; 2³
    cmp    #$F9                  ; 2
    bcc    L1052                 ; 2³
L104F:
    iny                          ; 2
    stx    $96                   ; 3
L1052:
    dex                          ; 2
    bpl    L1045                 ; 2³
    tya                          ; 2
    clc                          ; 2
    adc    $96                   ; 3
    sta    $97                   ; 3
    dec    $96                   ; 5
L105D:
    ldx    #3                    ; 2
    stx    NUSIZ0                ; 3
    inx                          ; 2
    stx    NUSIZ1                ; 3
    lda    $E3                   ; 3
    lsr                          ; 2
    bcc    L106A                 ; 2³
    inx                          ; 2
L106A:
    lda    $D0,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    Digit_Logo_Tab,Y      ; 4
    pha                          ; 3
    lda    $D0,X                 ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    lda    Digit_Logo_Tab,Y      ; 4
    pha                          ; 3
    dex                          ; 2
    dex                          ; 2
    bpl    L106A                 ; 2³
    ldx    #$FE                  ; 2
L1084:
    inx                          ; 2
    inx                          ; 2
    pla                          ; 4
    sta    $EA,X                 ; 4
    cpx    #$0A                  ; 2
    bne    L1084                 ; 2³
    ldy    #$AC                  ; 2
    ldx    #8                    ; 2
L1091:
    lda    $EA,X                 ; 4
    cmp    #$5A                  ; 2
    bne    L109D                 ; 2³
    sty    $EA,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bne    L1091                 ; 2³
L109D:
    lda    $F4                   ; 3
    cmp    #$5A                  ; 2
    bne    L10A5                 ; 2³
    sty    $F4                   ; 3
L10A5:
    lda    #$19                  ; 2
    ldx    #$0C                  ; 2
L10A9:
    dex                          ; 2
    dex                          ; 2
    sta    $EB,X                 ; 4
    bne    L10A9                 ; 2³
    lda    #$FF                  ; 2
    pha                          ; 3
L10B2:
    txa                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    #$01                  ; 2
    pha                          ; 3
    inx                          ; 2
    cpx    #9                    ; 2
    bne    L10B2                 ; 2³
    lda    #0                    ; 2
    ldy    #$49                  ; 2

.waitVblank:
    bit    TIMINT                ; 4
    bpl    .waitVblank           ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta.w  VBLANK                ; 4   Vblank ends...

L10CC:
    lda    ($F4),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($F2),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($EC),Y               ; 5
    tax                          ; 2
    lda    ($F0),Y               ; 5
    sta    GRP1                  ; 3
    sty.w  NUSIZ1                ; 4
    lda    ($EE),Y               ; 5
    sta    $E7                   ; 3
    lda    ($EA),Y               ; 5
    tay                          ; 2
    lda    $E7                   ; 3
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    sty    GRP0                  ; 3
    ldx    #4                    ; 2
    stx    NUSIZ1                ; 3
    pla                          ; 4
    tay                          ; 2
    bpl    L10CC                 ; 2³
    ldx    #0                    ; 2
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    lda    #$18                  ; 2
    sta    $FA                   ; 3
    lda    #$1B                  ; 2
    sta    $FC                   ; 3
    lda    $C6                   ; 3
    sta    REFP0                 ; 3
    lda    $C8                   ; 3
    jsr    L1396                 ; 6
    ldx    $C9                   ; 3
    lda    L1ED8,X               ; 4
    sta    $F9                   ; 3
    ldx    $E8                   ; 3
    stx    NUSIZ0                ; 3
    ldx    #$35                  ; 2
    stx    CTRLPF                ; 3
    lda    $E3                   ; 3
    and    #$01                  ; 2
    tax                          ; 2
    lda    L1CD1,X               ; 4
    sta    COLUP0                ; 3
    ldy    $D6                   ; 3
    lda    L193A,Y               ; 4
    sta    $F8                   ; 3
    lda    $C7                   ; 3
    ldx    #2                    ; 2
    jsr    L1396                 ; 6
    lda    $D8                   ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    iny                          ; 2
    lda    L1BE8,Y               ; 4
    ldy    $DA                   ; 3
    cpy    #$0C                  ; 2
    bne    L1144                 ; 2³
    lda    frameCounter
L1144:
    sta    $FF                   ; 3
    ldx    #$1D                  ; 2
    txs                          ; 2
    sta    HMCLR                 ; 3
    bit    $E6                   ; 3
    bpl    L1152                 ; 2³
    jmp    L13F5                 ; 3
L1152:
    lda    #0                    ; 2
    sta    ENABL                 ; 3
    sta    $89                   ; 3
    sta    NUSIZ1                ; 3
    lda    $D6                   ; 3
    beq    L1160                 ; 2³
    lda    $F8                   ; 3
L1160:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    CXCLR                 ; 3
    sta    COLUPF                ; 3
    lda    $8F                   ; 3
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
L116D:
    dey                          ; 2
    bpl    L116D                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$1F                  ; 2
    sta    $FE                   ; 3
    lda    $87                   ; 3
    sta    $FD                   ; 3
    ldx    $E9                   ; 3
L1180:
    txa                          ; 2
    sec                          ; 2
    sbc    $96                   ; 3
    bmi    L11A9                 ; 2³
    tay                          ; 2
    lda    CavernRoof_PF0,Y      ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    lda    CavernRoof_PF1,Y      ; 4
    sta    PF1                   ; 3
    lda    $D6                   ; 3
    beq    L119B                 ; 2³
    lda    #0                    ; 2
    beq    L119E                    ;  always branch

L119B:
    lda    CavernRoofColorTab,Y  ; 4
L119E:
    sta    COLUBK                ; 3
    lda    CavernRoof_PF2,Y      ; 4
    sta    PF2                   ; 3
    dex                          ; 2
    jmp    L1180                 ; 3
L11A9:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $BE                   ; 3
    sta    COLUBK                ; 3
    ldy    #0                    ; 2
    sty    COLUPF                ; 3
    dey                          ; 2
    sty    ENABL                 ; 3
    bit    $92                   ; 3
    bpl    L11BD                 ; 2³
    jmp    L1272                 ; 3
L11BD:
    lda    $C2                   ; 3
    sec                          ; 2
    sbc    $93                   ; 3
    sta    $C2                   ; 3
    lda    $CB                   ; 3
    sec                          ; 2
    sbc    $93                   ; 3
    sta    $CB                   ; 3
L11CB:
    txa                          ; 2
    sec                          ; 2
    sbc    $C2                   ; 3
    tay                          ; 2
    cpy    #$0B                  ; 2
    lda    #0                    ; 2
    bcs    L11D8                 ; 2³
    lda    ($F9),Y               ; 5
L11D8:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    cpx    $CB                   ; 3
    php                          ; 3
    cpx    #9                    ; 2
    bcs    L11F4                 ; 2³
    txa                          ; 2
    tay                          ; 2
    lda    ($FD),Y               ; 5
    and    ($97),Y               ; 5
    sta    GRP1                  ; 3
    lda    $FF                   ; 3
    and    #$F0                  ; 2
    ora    L1F43,Y               ; 4
    sta    COLUP1                ; 3
L11F4:
    pla                          ; 4
    dex                          ; 2
    bne    L11CB                 ; 2³
    lda    $C2                   ; 3
    clc                          ; 2
    adc    $93                   ; 3
    sta    $C2                   ; 3
    lda    $CB                   ; 3
    clc                          ; 2
    adc    $93                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    $CB                   ; 3
    ldx    $93                   ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    $C2                   ; 3
    cmp    #$0B                  ; 2
    bcs    L126D                 ; 2³
    tay                          ; 2
    lda    ($F9),Y               ; 5
    sta    GRP0                  ; 3
L1217:
    lda    #0                    ; 2
    sta    GRP1                  ; 3
    sta    COLUP1                ; 3
    sta    ENAM0                 ; 3
    sta.w  RESP1                 ; 4
    sta    HMCLR                 ; 3
    lda    #$D7                  ; 2
    clc                          ; 2
    adc    $8C                   ; 3
    sta    $FD                   ; 3
    lda    #$C0                  ; 2
    sta    HMP1                  ; 3
    dex                          ; 2
    lda    #7                    ; 2
    sta    NUSIZ1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    $C2                   ; 3
    cmp    #$0B                  ; 2
    bcs    L1245                 ; 2³
    tay                          ; 2
    lda    ($F9),Y               ; 5
    sta    GRP0                  ; 3
L1245:
    dex                          ; 2
L1246:
    txa                          ; 2
    sec                          ; 2
    sbc    $C2                   ; 3
    tay                          ; 2
    lda    $F8                   ; 3
    cpx    $88                   ; 3
    bcs    L1253                 ; 2³
    lda    #0                    ; 2
L1253:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    cpy    #$0B                  ; 2
    bcs    L125F                 ; 2³
    lda    ($F9),Y               ; 5
    sta    GRP0                  ; 3
L125F:
    txa                          ; 2
    and    #$01                  ; 2
    tay                          ; 2
    lda    ($FD),Y               ; 5
    sta    GRP1                  ; 3
    dex                          ; 2
    bne    L1246                 ; 2³
    jmp    L1389                 ; 3

L126D:
    nop                          ; 2
    nop                          ; 2
    sec                          ; 2
    bcs    L1217                    ;  always branch

L1272:
    lda    #$1A                  ; 2
    sta    $ED                   ; 3
    sta    $EF                   ; 3
    sta    $F1                   ; 3
    sta    $F3                   ; 3
    lda    $83                   ; 3
    sta    $EC                   ; 3
    ora    #$40                  ; 2
    sta    $EE                   ; 3
    lda    $84                   ; 3
    ora    #$80                  ; 2
    sta    $F0                   ; 3
    ora    #$C0                  ; 2
    sta    $F2                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$1C                  ; 2
    sta    $FE                   ; 3
    sta    $FC                   ; 3
    lda    $80                   ; 3
    sta    $FD                   ; 3
    lda    $8E                   ; 3
    sta    $FB                   ; 3
    lda    $C2                   ; 3
    sec                          ; 2
    sbc    $93                   ; 3
    sec                          ; 2
    sbc    #$15                  ; 2
    sta    $C2                   ; 3
    lda    $CB                   ; 3
    sec                          ; 2
    sbc    $93                   ; 3
    sec                          ; 2
    sbc    #$15                  ; 2
    sta    $CB                   ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    #$17                  ; 2
    tax                          ; 2
    lda    #0                    ; 2
    sta    $E7                   ; 3
L12BB:
    txa                          ; 2
    sec                          ; 2
    sbc    $8B                   ; 3
    cmp    #8                    ; 2
    bcs    L12CC                 ; 2³
    tay                          ; 2
    lda    ($FD),Y               ; 5
    sta    $E7                   ; 3
    lda    ($FB),Y               ; 5
    sta    COLUP1                ; 3
L12CC:
    txa                          ; 2
    sec                          ; 2
    sbc    $C2                   ; 3
    cmp    #$0B                  ; 2
    tay                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    bcs    L12DB                 ; 2³
    lda    ($F9),Y               ; 5
    sta    GRP0                  ; 3
L12DB:
    cpx    $CB                   ; 3
    php                          ; 3
    lda    $E7                   ; 3
    sta    GRP1                  ; 3
    pla                          ; 4
    dex                          ; 2
    bne    L12BB                 ; 2³
    sta    HMCLR                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    GRP1                  ; 3
    lda    $A3                   ; 3
    sta    HMP0                  ; 3
    and    #$0F                  ; 2
    sta    $E7                   ; 3
    tay                          ; 2
L12F5:
    dey                          ; 2
    bpl    L12F5                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx.w  REFP0                 ; 4
    lda    $A4                   ; 3
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    #$AC                  ; 2
L1308:
    dey                          ; 2
    bpl    L1308                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    TIM8T                 ; 4
    lda    $AB                   ; 3
    sta    NUSIZ0                ; 3
    lda    $AC                   ; 3
    sta    NUSIZ1                ; 3
    lda    $A3                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2   $00 - $0F
    lda    DelayLoPtrsTab,X       ; 4
    sta    $F4                   ; 3
    lda    #$13                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    $F5                   ; 3
    ldy    $E7                   ; 3
    iny                          ; 2
    iny                          ; 2
L1332:
    dey                          ; 2
    bpl    L1332                 ; 2³
    jmp.ind ($00F4)              ; 5   jump into the "DelayCycles" table below.



;This table's function is to waste a variable amount of cycles
;before entering the drawing loop for the "HEXUPLEX".

DelayCycles:
    .byte $A9        ; +8 cycles    lda #$A9, lda #$A9, lda $EAA5
    .byte $A9        ; +7 cycles    lda #$A9, lda #$AD, lda $EA
    .byte $A9        ; +6 cycles    lda #$A9, lda $EAA5
    .byte $A9        ; +5 cycles    lda #$AD, lda $EA
    .byte $AD        ; +4 cycles    lda $EAA5
    .byte $A5        ; +3 cycles    lda $EA
    .byte $EA        ; +2 cycles    nop



    ldy    #$0F                  ; 2
L1341:
    ldx    #3                    ; 2
L1343:
    dex                          ; 2
    bpl    L1343                 ; 2³
    lda    $FF                   ; 3
    clc                          ; 2
    adc    L1DF0,Y               ; 4
    sta.w  COLUP0                ; 4
    sta    COLUP1                ; 3
    lda    ($F2),Y               ; 5
    sta    GRP0                  ; 3   drawing the "HEXUPLEX"
    lda    ($F0),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($EE),Y               ; 5
    tax                          ; 2
    lda    ($EC),Y               ; 5
    stx    GRP0                  ; 3
    sta    GRP1                  ; 3
    dey                          ; 2
    bpl    L1341                 ; 2³

L1365:
    lda    INTIM                 ; 4
    bne    L1365                 ; 2³
    lda    $F8                   ; 3
    sta    COLUBK                ; 3
    lda    $C2                   ; 3
    clc                          ; 2
    adc    $93                   ; 3
    clc                          ; 2
    adc    #$15                  ; 2
    sta    $C2                   ; 3
    lda    $CB                   ; 3
    clc                          ; 2
    adc    $93                   ; 3
    clc                          ; 2
    adc    #$15                  ; 2
    sta    $CB                   ; 3
    ldx    $93                   ; 3
L1384:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    L1384                 ; 2³
L1389:
    lda    CXM0P                 ; 3
    asl                          ; 2
    ror    $89                   ; 5
    lda    CXPPMM                ; 3
    asl                          ; 2
    ror    $89                   ; 5
    jmp    L1591                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L1396 SUBROUTINE
    sta    HMCLR                 ; 3
L1398 SUBROUTINE
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMP0,X                ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    iny                          ; 2
L13A0:
    dey                          ; 2
    bpl    L13A0                 ; 2³
    sta    RESP0,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L13AA SUBROUTINE
    lda    #0                    ; 2
    ldx    #$0E                  ; 2
L13AE:
    sta    $CF,X                 ; 4
    dex                          ; 2
    bpl    L13AE                 ; 2³
    dex                          ; 2
    stx    $E3                   ; 3
    ldx    #$0E                  ; 2
    stx    $C9                   ; 3
    ldx    #$50                  ; 2
    stx    $D4                   ; 3
    lda    $E4                   ; 3
    and    #$02                  ; 2
    beq    L13C6                 ; 2³
    stx    $D5                   ; 3
L13C6:
    lsr    $E6                   ; 5
    sec                          ; 2
    rol    $E6                   ; 5
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L13CC:   ;indirect jump
    asl                          ; 2
    cpx    #1                    ; 2
    beq    L13D3                 ; 2³
    asl                          ; 2
    asl                          ; 2
L13D3:
    eor    #$1F                  ; 2
    pha                          ; 3
    lda    $DC,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    cpx    #1                    ; 2
    beq    L13E5                 ; 2³
    ldy    #4                    ; 2
    sty    AUDC0,X               ; 4
L13E5:
    jmp    L170E                 ; 3

L13E8:   ;indirect jump
    asl                          ; 2
L13E9:   ;indirect jump
    asl                          ; 2
    asl                          ; 2
    eor    #$1F                  ; 2
    pha                          ; 3
    lda    $DC,X                 ; 4
    asl                          ; 2
    asl                          ; 2
    jmp    L170E                 ; 3

L13F5:
    lda    #$FF                  ; 2
    sta    $94                   ; 3
    lda    $BE                   ; 3
    bit    $E6                   ; 3
    bvc    L1401                 ; 2³+1
    lda    $F8                   ; 3
L1401:
    sta    $EA                   ; 3
    ldx    $E9                   ; 3
L1405:
    inc    $96                   ; 5
    dex                          ; 2
    sta    CXCLR                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    cpx    $CB                   ; 3
    php                          ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    #$52                  ; 2
    tay                          ; 2
    cmp    #$0B                  ; 2
    bcs    L141C                 ; 2³
    lda    ($F9),Y               ; 5
    sta    GRP0                  ; 3
L141C:
    pla                          ; 4
    ldy    $96                   ; 3
    lda.wy $A3,Y                 ; 4
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    sta    $F6                   ; 3
    lda.wy $8A,Y                 ; 4
    sta    $E7                   ; 3
    dex                          ; 2
    txa                          ; 2
    sec                          ; 2
    sbc    #$52                  ; 2
    tay                          ; 2
    cmp    #$0B                  ; 2
    lda    #0                    ; 2
    bcs    L143B                 ; 2³
    lda    ($F9),Y               ; 5
L143B:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    cpx    $CB                   ; 3
    php                          ; 3
    ldy    $F6                   ; 3
    cpy    #6                    ; 2
    bcs    L1459                 ; 2³
L1448:
    dey                          ; 2
    bpl    L1448                 ; 2³
    sta    RESP1                 ; 3
    pla                          ; 4
    dex                          ; 2
    txa                          ; 2
    sec                          ; 2
    sbc    #$52                  ; 2
    tay                          ; 2
    cpx    $CB                   ; 3
    jmp    L146F                 ; 3
L1459:
    lda    $E7                   ; 3
    pla                          ; 4
    lda    $F6                   ; 3
    sec                          ; 2
    sbc    #6                    ; 2
    tay                          ; 2
L1462:
    dey                          ; 2
    bpl    L1462                 ; 2³
    dex                          ; 2
    txa                          ; 2
    sec                          ; 2
    sbc    #$52                  ; 2
    tay                          ; 2
    cpx    $CB                   ; 3
    sta    RESP1                 ; 3
L146F:
    sta    WSYNC                 ; 3
;---------------------------------------
    php                          ; 3
    cpy    #$0B                  ; 2
    bcs    L147A                 ; 2³
    lda    ($F9),Y               ; 5
    sta    GRP0                  ; 3
L147A:
    ldy    $96                   ; 3
    beq    L149E                 ; 2³
    cpy    $92                   ; 3
    beq    L149E                 ; 2³
    lda    $E5                   ; 3
    cpy    $9A                   ; 3
    bne    L148C                 ; 2³
    lda    $E2                   ; 3
    and    #$F8                  ; 2
L148C:
    sta    $FB                   ; 3
    lda    $BE                   ; 3
    sta    $F7                   ; 3
    lda.wy $82,Y                 ; 4
    and    #$03                  ; 2
    ora    #$1C                  ; 2
    sta    $FE                   ; 3
    jmp    L14C3                 ; 3
L149E:
    lda.wy $82,Y                 ; 4
    bpl    L14A8                 ; 2³
    lda    $93                   ; 3
    jmp    L14AA                 ; 3
L14A8:
    lda    #$0A                  ; 2
L14AA:
    sta    COLUP1                ; 3
    lda.wy $82,Y                 ; 4
    and    #$03                  ; 2
    ora    #$1C                  ; 2
    sta    $FE                   ; 3
    lda    $D6                   ; 3
    cpy    #1                    ; 2
    adc    #0                    ; 2
    and    #$1F                  ; 2
    tay                          ; 2
    lda    L193A,Y               ; 4
    sta    $F7                   ; 3
L14C3:
    dex                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    pla                          ; 4
    cpx    $CB                   ; 3
    php                          ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    #$52                  ; 2
    tay                          ; 2
    cmp    #$0B                  ; 2
    bcs    L14D9                 ; 2³
    lda    ($F9),Y               ; 5
    sta    GRP0                  ; 3
L14D9:
    ldy    $96                   ; 3
    lda.wy $82,Y                 ; 4
    asl                          ; 2
    and    #$F8                  ; 2
    sta    $FD                   ; 3
    pla                          ; 4
    dex                          ; 2
    ldy    $EA                   ; 3
    lda    $96                   ; 3
    beq    L14ED                 ; 2³
    ldy    $BE                   ; 3
L14ED:
    txa                          ; 2
    cpx    $CB                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    COLUBK                ; 3
    php                          ; 3
    sec                          ; 2
    sbc    #$52                  ; 2
    tay                          ; 2
    cmp    #$0B                  ; 2
    bcs    L1501                 ; 2³+1
    lda    ($F9),Y               ; 5
    sta    GRP0                  ; 3
L1501:
    pla                          ; 4
    ldy    $96                   ; 3
    lda.wy $AB,Y                 ; 4
    sta    NUSIZ1                ; 3
    lda.wy $B3,Y                 ; 4
    bmi    L1510                 ; 2³
    ldy    #8                    ; 2
L1510:
    sty    REFP1                 ; 3
    sec                          ; 2
L1513:
    dex                          ; 2
    beq    L1543                 ; 2³
    txa                          ; 2
    sbc    $E7                   ; 3
    tay                          ; 2
    cpy    #8                    ; 2
    bcs    L1589                 ; 2³
    cpx    $CB                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    php                          ; 3
    lda    ($FD),Y               ; 5
    sta    GRP1                  ; 3
    lda    $F7                   ; 3
    bne    L1545                 ; 2³
    lda    ($FB),Y               ; 5
    sta    COLUP1                ; 3
L152F:
    txa                          ; 2
    sec                          ; 2
    sbc    #$52                  ; 2
    tay                          ; 2
    cmp    #$0B                  ; 2
    bcs    L153C                 ; 2³
    lda    ($F9),Y               ; 5
    sta    GRP0                  ; 3
L153C:
    pla                          ; 4
    cpx    $E7                   ; 3
    bne    L1513                 ; 2³
    beq    L155C                    ;  always branch

L1543:
    beq    L1591                    ;  always branch

L1545:
    and    TunnelStripingTab,Y   ; 4
    sta    COLUBK                ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    #$52                  ; 2
    tay                          ; 2
    cmp    #$0B                  ; 2
    bcs    L1557                 ; 2³
    lda    ($F9),Y               ; 5
    sta    GRP0                  ; 3
L1557:
    pla                          ; 4
    cpx    $E7                   ; 3
    bne    L1513                 ; 2³
L155C:
    lda    #0                    ; 2
    ldy    $96                   ; 3
    bit    CXPPMM                ; 3
    bpl    L1566                 ; 2³
    sty    $94                   ; 3
L1566:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    sta    COLUBK                ; 3
    dex                          ; 2
    beq    L1599                 ; 2³
    cpx    $CB                   ; 3
    php                          ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    #$52                  ; 2
    tay                          ; 2
    cmp    #$0B                  ; 2
    bcs    L157F                 ; 2³
    lda    ($F9),Y               ; 5
    sta    GRP0                  ; 3
L157F:
    pla                          ; 4
    ldy    $96                   ; 3
    cpy    $97                   ; 3
    bcs    L1513                 ; 2³
    jmp    L1405                 ; 3

L1589:
    sta    WSYNC                 ; 3
;---------------------------------------
    cpx    $CB                   ; 3
    php                          ; 3
    jmp    L152F                 ; 3

L1591:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    GRP1                  ; 3
    sta    COLUBK                ; 3
L1599:
    ldx    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    GRP1                  ; 3
    stx    ENAM0                 ; 3
    stx    REFP0                 ; 3
    stx    REFP1                 ; 3
    stx    COLUBK                ; 3
    dex                          ; 2
    txs                          ; 2   point stack to $FF
    bit    $E6                   ; 3
    bpl    L15B4                 ; 2³
    lda    $BB                   ; 3
    clc                          ; 2
    adc    $95                   ; 3
    bpl    L15BA                 ; 2³
L15B4:
    lda    $9A                   ; 3
    sec                          ; 2
    sbc    $BB                   ; 3
    nop                          ; 2
L15BA:
    ldx    $E7                   ; 3
    sta    RESP0                 ; 3
    pha                          ; 3
    tax                          ; 2
    sta    RESP1                 ; 3
    sta    HMCLR                 ; 3
    lda    #$80                  ; 2
    sta    HMP1                  ; 3
    lda    #$17                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    L1BA0,X               ; 4
    ldx    #2                    ; 2
    jsr    L1398                 ; 6
    stx    ENAM0                 ; 3
    pla                          ; 4
    lsr                          ; 2
    tax                          ; 2
    lda    L1F54,X               ; 4
    sta    GRP0                  ; 3
    lda    #$3A                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    L1F4C,X               ; 4
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    ENAM0                 ; 3
    sta    COLUP1                ; 3
    lda    #$33                  ; 2
    sta    CTRLPF                ; 3
    lda    $D8                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    L1BE8,X               ; 4
    and    #$F0                  ; 2
    ora    #$0A                  ; 2
    sta    COLUP0                ; 3
    lda    L1CC8,X               ; 4
    ldy    L1860,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    sty    PF2                   ; 3
    sta    HMCLR                 ; 3
    lda    #$60                  ; 2
    sta    HMP0                  ; 3
    lda    #$70                  ; 2
    sta    HMP1                  ; 3
    sta.w  RESBL                 ; 4
    ldy    #6                    ; 2
L1626:
    dey                          ; 2
    bne    L1626                 ; 2³
    sta.w  RESP0                 ; 4
    sta    RESP1                 ; 3
    lda    #$50                  ; 2
    sta    HMBL                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #TIME_OVERSCAN        ; 2
    sta    TIM64T                ; 4
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    lda    $DF                   ; 3
    and    #$30                  ; 2
    bne    L164D                 ; 2³
    sty    $DA                   ; 3
    sty    $DB                   ; 3
L164D:
    lda    $D8                   ; 3
    and    #$07                  ; 2
    sta    $F6                   ; 3
    ldx    #1                    ; 2
L1655:
    lda    $DA,X                 ; 4
    asl                          ; 2
    tay                          ; 2
    lda    L1EEF+1,Y             ; 4
    pha                          ; 3
    lda    L1EEF,Y               ; 4
    pha                          ; 3
    lda    $DA,X                 ; 4
    tay                          ; 2
    lda    L1BCF,Y               ; 4
    sta    AUDC0,X               ; 4
    lda    $DC,X                 ; 4
    rts                          ; 6

L166C:   ;indirect jump
    cmp    #9                    ; 2
    bcc    L1676                 ; 2³
    lda    #$1F                  ; 2
    pha                          ; 3
    lsr                          ; 2
    bpl    L167C                    ;  always branch
L1676:
    asl                          ; 2
    eor    #$FF                  ; 2
    pha                          ; 3
    eor    #$FF                  ; 2
L167C:
    jmp    L170E                 ; 3

L167F:   ;indirect jump
    lda    frameCounter
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    eor    $E2                   ; 3
    and    #$18                  ; 2
    eor    $E2                   ; 3
    pha                          ; 3
    lda    frameCounter
    jmp    L170E                 ; 3

L1690:   ;indirect jump
    ldy    $F6                   ; 3
    eor    L1EE7,Y               ; 4
    pha                          ; 3
    lda    #$0F                  ; 2
    bpl    L170E                 ; 3+1   always branch

L169A:   ;indirect jump
    asl                          ; 2
    asl                          ; 2
L169C:   ;indirect jump
    asl                          ; 2
    pha                          ; 3
    lda    #$0F                  ; 2
    bpl    L170E                 ; 3+1   always branch

L16A2:   ;indirect jump
    asl                          ; 2
    eor    #$1F                  ; 2
    and    #$1E                  ; 2
    pha                          ; 3
    lda    $DC,X                 ; 4
    lsr                          ; 2
    bpl    L170E                 ; 3+1   always branch

L16AD:   ;indirect jump
    eor    #$FF                  ; 2
    pha                          ; 3
    lda    $DC,X                 ; 4
    clc                          ; 2
    adc    #5                    ; 2
    lsr                          ; 2
    bpl    L170E                 ; 3+1   always branch

L16B8:   ;indirect jump
    asl                          ; 2
    eor    #$1F                  ; 2
    and    #$1E                  ; 2
    pha                          ; 3
    lda    $DC,X                 ; 4
    lsr                          ; 2
    bpl    L170E                 ; 3+1   always branch

L16C3:   ;indirect jump
    asl                          ; 2
    asl                          ; 2
    eor    #$1F                  ; 2
    pha                          ; 3
    lda    $DC,X                 ; 4
    lsr                          ; 2
    bpl    L170E                 ; 3+1   always branch

L16CD:   ;indirect jump
    cmp    #$20                  ; 2
    bcc    L16D7                 ; 2³
    asl                          ; 2
    asl                          ; 2
    pha                          ; 3
    lsr                          ; 2
    bpl    L170E                 ; 3+1   always branch
L16D7:
    cmp    #$1A                  ; 2
    bne    L16E3                 ; 2³
    ldy    #$12                  ; 2
    sty    $DB                   ; 3
    ldy    #$1F                  ; 2
    sty    $DD                   ; 3
L16E3:   ;indirect jump also
    lda    #0                    ; 2
    pha                          ; 3
    bpl    L170E                 ; 3+1   always branch

L16E8   ;indirect jump
    asl                          ; 2
    ldy    $BB                   ; 3
    eor    L1513,Y               ; 4
    pha                          ; 3
    lda    #$0F                  ; 2
    bpl    L170E                 ; 3+1   always branch

L16F3:   ;indirect jump
    lda    #$14                  ; 2
    pha                          ; 3
    lda    #6                    ; 2
    bpl    L170E                 ; 3+1   always branch

L16FA:   ;indirect jump
    eor    #$FF                  ; 2
    pha                          ; 3
    ldy    $81                   ; 3
    lda    VolumeTab,Y           ; 4
    bpl    L170E                 ; 3    always branch

VolumeTab:
    .byte $0F ; |    XXXX| $1704
    .byte $09 ; |    X  X| $1705
    .byte $06 ; |     XX | $1706
    .byte $09 ; |    X  X| $1707

L1708:   ;indirect jump
    lsr                          ; 2
    pha                          ; 3
    asl                          ; 2
    asl                          ; 2
    ora    #$08                  ; 2
L170E:
    sta    AUDV0,X               ; 4
    pla                          ; 4
    sta    AUDF0,X               ; 4
    dex                          ; 2
    bmi    L1719                 ; 2³
    jmp    L1655                 ; 3
L1719:
    dec    $DC                   ; 5
    bne    L1725                 ; 2³
    lda    #0                    ; 2
    sta    $DA                   ; 3
    lda    #1                    ; 2
    sta    $DC                   ; 3
L1725:
    dec    $DD                   ; 5
    bne    L175C                 ; 2³
    bit    $E6                   ; 3
    bmi    L1742                 ; 2³
    lda    $80                   ; 3
    cmp    #$20                  ; 2
    bcc    L1754                 ; 2³
    lda    #$17                  ; 2
    sta    $DB                   ; 3
    lda    $BB                   ; 3
    lsr                          ; 2
    tay                          ; 2
    lda    L1BC2,Y               ; 4
    sta    $DD                   ; 3
    bpl    L175C                 ; 2³   always branch?
L1742:
    lda    $9A                   ; 3
    beq    L1754                 ; 2³
    cmp    #7                    ; 2
    bcs    L1754                 ; 2³
    lda    #$18                  ; 2
    sta    $DB                   ; 3
    lda    #2                    ; 2
    sta    $DD                   ; 3
    bpl    L175C                    ;  always branch

L1754:
    lda    #0                    ; 2
    sta    $DB                   ; 3
    lda    #1                    ; 2
    sta    $DD                   ; 3
L175C:
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcc    L1788                 ; 2³
    lsr                          ; 2
    bcc    L1769                 ; 2³
    ldx    #3                    ; 2
    bpl    L1784                    ;  always branch

L1769:
    dec    $DE                   ; 5
    bne    L178C                 ; 2³
    bit    $DF                   ; 3
    bpl    L177B                 ; 2³
    ldx    $E4                   ; 3
    inx                          ; 2
    txa                          ; 2
    and    #$03                  ; 2
    sta    $E4                   ; 3
    bpl    L177E                    ;  always branch

L177B:
    jsr    L13AA                 ; 6
L177E:
    lda    #$80                  ; 2
    sta    $DF                   ; 3
    ldx    #$1E                  ; 2
L1784:
    stx    $DE                   ; 3
    bpl    L178C                    ;  always branch

L1788:
    lda    #$40                  ; 2
    sta    $DF                   ; 3
L178C:
    lda    #$10                  ; 2
    bit    $DF                   ; 3
    beq    L1795                 ; 2³
    jmp    L1821                 ; 3
L1795:
    bmi    L17CB                 ; 2³
    bvs    L180E                 ; 2³+1
    lda    $DF                   ; 3
    bne    L17DD                 ; 2³
    lda    $E1                   ; 3
    bne    L17C7                 ; 2³
    ldy    $E0                   ; 3
    lda    L18F9,Y               ; 4
    bne    L17B6                 ; 2³
    sta    $E0                   ; 3
    bit    $E6                   ; 3
    bpl    L1807                 ; 2³+1
    sta    $D8                   ; 3
    lda    #$81                  ; 2
    sta    $E6                   ; 3
    bne    L1807                    ; always branch  (4 cycles, crosses page boundary)

L17B6:
    and    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $E1                   ; 3
    lda    L18F9,Y               ; 4
    and    #$F8                  ; 2
    sta    $E3                   ; 3
    inc    $E0                   ; 5
L17C7:
    dec    $E1                   ; 5
    bpl    L1807                 ; 2³+1   always branch?
L17CB:
    lda    $E4                   ; 3
    and    #$01                  ; 2
    tax                          ; 2
    inx                          ; 2
    stx    $D2                   ; 3
    lda    $E4                   ; 3
    lsr                          ; 2
    clc                          ; 2
    adc    #$A1                  ; 2
    sta    $D0                   ; 3
    bne    L1807                 ; 2³+1   always branch?

L17DD:
    lda    $DA                   ; 3
    bne    L1840                 ; 2³+1
    lda    $9A                   ; 3
    sta    $BB                   ; 3
    lda    $E3                   ; 3
    ora    #$FE                  ; 2
    sta    $E3                   ; 3
    lda    $E4                   ; 3
    and    #$02                  ; 2
    beq    L1807                 ; 2³+1
    lda    frameCounter          ; 3
    and    #$7F                  ; 2
    bne    L1807                 ; 2³+1
    lda    $E3                   ; 3
    eor    #$01                  ; 2
    sta    $E3                   ; 3
    lda    $D8                   ; 3
    ldx    #3                    ; 2
L1801:
    lsr                          ; 2
    ror    $D8                   ; 5
    dex                          ; 2
    bpl    L1801                 ; 2³
L1807:
    lda    INPT4                    ; test firebutton left joystick
    bmi    L1840                    ; - not pressed
    jmp    L1788                    ; - pressed

L180E:
    lda    SWCHB                    ; test the reset switch
    lsr
    bcc    L1840                    ; - pressed
    lda    INPT4                    ; - not pressed, check firebutton left joystick
    bpl    L1840                    ; branch if firebutton pressed
    jsr    L13AA                 ; 6
    lda    #$10                  ; 2
    sta    $DF                   ; 3
    bne    L1840                    ;  always branch

L1821:
    lda    $E3                   ; 3
    and    #$01                  ; 2
    tax                          ; 2
    lda    SWCHA                 ; 4
    cpx    #0                    ; 2
    beq    L1831                 ; 2³
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
L1831:
    and    #$F0                  ; 2
    ldy    INPT4,X               ; 4
    bpl    L1839                 ; 2³
    ora    #$08                  ; 2
L1839:
    tay                          ; 2
    txa                          ; 2
    beq    L183E                 ; 2³
    iny                          ; 2
L183E:
    sty    $E3                   ; 3
L1840:
    inc    frameCounter
    lda    frameCounter
    and    #$07                  ; 2
    sta    $CD                   ; 3
    lda    $E2                   ; 3
    asl                          ; 2
    eor    $E2                   ; 3
    asl                          ; 2
    eor    $E2                   ; 3
    asl                          ; 2
    asl                          ; 2
    eor    $E2                   ; 3
    asl                          ; 2
    rol    $E2                   ; 5
    jmp    L1CD3                 ; 3

    .byte $00 ; |        | $185A
    .byte $00 ; |        | $185B
    .byte $00 ; |        | $185C
    .byte $00 ; |        | $185D
    .byte $00 ; |        | $185E
    .byte $00 ; |        | $185F
L1860:
    .byte $00 ; |        | $1860   PF2
    .byte $00 ; |        | $1861
    .byte $00 ; |        | $1862
    .byte $00 ; |        | $1863
    .byte $00 ; |        | $1864
    .byte $02 ; |      X | $1865
    .byte $0A ; |    X X | $1866
    .byte $2A ; |  X X X | $1867
    .byte $AA ; |X X X X | $1868
    .byte $00 ; |        | $1869
    .byte $49 ; | X  X  X| $186A
    .byte $00 ; |        | $186B
    .byte $00 ; |        | $186C
    .byte $81 ; |X      X| $186D
    .byte $00 ; |        | $186E
    .byte $02 ; |      X | $186F
    .byte $40 ; | X      | $1870
    .byte $08 ; |    X   | $1871
    .byte $00 ; |        | $1872
    .byte $00 ; |        | $1873
    .byte $49 ; | X  X  X| $1874
    .byte $20 ; |  X     | $1875
    .byte $0A ; |    X X | $1876
    .byte $81 ; |X      X| $1877
    .byte $20 ; |  X     | $1878
    .byte $0A ; |    X X | $1879
    .byte $40 ; | X      | $187A
    .byte $08 ; |    X   | $187B
    .byte $0A ; |    X X | $187C
    .byte $A0 ; |X X     | $187D
    .byte $00 ; |        | $187E
    .byte $54 ; | X X X  | $187F
    .byte $AA ; |X X X X | $1880
    .byte $54 ; | X X X  | $1881
    .byte $AA ; |X X X X | $1882
    .byte $54 ; | X X X  | $1883
    .byte $00 ; |        | $1884
    .byte $00 ; |        | $1885
    .byte $AA ; |X X X X | $1886
    .byte $55 ; | X X X X| $1887
    .byte $01 ; |       X| $1888

    .byte $00 ; |        | $1889
    .byte $1E ; |   XXXX | $188A
    .byte $04 ; |     X  | $188B
    .byte $0C ; |    XX  | $188C
    .byte $3C ; |  XXXX  | $188D
    .byte $FE ; |XXXXXXX | $188E
    .byte $26 ; |  X  XX | $188F
    .byte $1C ; |   XXX  | $1890
    .byte $0C ; |    XX  | $1891
    .byte $04 ; |     X  | $1892
    .byte $0E ; |    XXX | $1893

    .byte $00 ; |        | $1894
    .byte $1E ; |   XXXX | $1895
    .byte $04 ; |     X  | $1896
    .byte $0C ; |    XX  | $1897
    .byte $3D ; |  XXXX X| $1898
    .byte $FF ; |XXXXXXXX| $1899
    .byte $27 ; |  X  XXX| $189A
    .byte $1D ; |   XXX X| $189B
    .byte $0C ; |    XX  | $189C
    .byte $04 ; |     X  | $189D
    .byte $0E ; |    XXX | $189E

    .byte $00 ; |        | $189F
    .byte $1E ; |   XXXX | $18A0
    .byte $0C ; |    XX  | $18A1
    .byte $3F ; |  XXXXXX| $18A2
    .byte $41 ; | X     X| $18A3
    .byte $81 ; |X      X| $18A4
    .byte $C0 ; |XX      | $18A5
    .byte $4F ; | X  XXXX| $18A6
    .byte $3C ; |  XXXX  | $18A7
    .byte $04 ; |     X  | $18A8
    .byte $0E ; |    XXX | $18A9

    .byte $00 ; |        | $18AA
    .byte $7B ; | XXXX XX| $18AB
    .byte $55 ; | X X X X| $18AC
    .byte $83 ; |X     XX| $18AD
    .byte $40 ; | X      | $18AE
    .byte $81 ; |X      X| $18AF
    .byte $00 ; |        | $18B0
    .byte $81 ; |X      X| $18B1
    .byte $42 ; | X    X | $18B2
    .byte $5B ; | X XX XX| $18B3
    .byte $6E ; | XX XXX | $18B4

    .byte $00 ; |        | $18B5
    .byte $F2 ; |XXXX  X | $18B6
    .byte $00 ; |        | $18B7
    .byte $00 ; |        | $18B8
    .byte $24 ; |  X  X  | $18B9
    .byte $10 ; |   X    | $18BA
    .byte $28 ; |  X X   | $18BB
    .byte $01 ; |       X| $18BC
    .byte $00 ; |        | $18BD
    .byte $08 ; |    X   | $18BE
    .byte $61 ; | XX    X| $18BF

    .byte $00 ; |        | $18C0
    .byte $15 ; |   X X X| $18C1
    .byte $02 ; |      X | $18C2
    .byte $04 ; |     X  | $18C3
    .byte $28 ; |  X X   | $18C4
    .byte $55 ; | X X X X| $18C5
    .byte $22 ; |  X   X | $18C6
    .byte $14 ; |   X X  | $18C7
    .byte $08 ; |    X   | $18C8
    .byte $04 ; |     X  | $18C9
    .byte $0A ; |    X X | $18CA

    .byte $00 ; |        | $18CB
    .byte $0A ; |    X X | $18CC
    .byte $04 ; |     X  | $18CD
    .byte $08 ; |    X   | $18CE
    .byte $14 ; |   X X  | $18CF
    .byte $AA ; |X X X X | $18D0
    .byte $05 ; |     X X| $18D1
    .byte $08 ; |    X   | $18D2
    .byte $04 ; |     X  | $18D3
    .byte $02 ; |      X | $18D4
    .byte $05 ; |     X X| $18D5

L18D6:   ;indirect jump
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    eor    $DC,X                 ; 4
    pha                          ; 3
    eor    $DC,X                 ; 4
    lsr                          ; 2
    eor    #$FF                  ; 2
    jmp    L170E                 ; 3

L18E5:   ;indirect jump
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ldy    $F6                   ; 3
    eor    L1F21,Y               ; 4
    pha                          ; 3
    lda    $DC,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    eor    #$0F                  ; 2
    jmp    L170E                 ; 3

L18F9:
    .byte $5E ; | X XXXX | $18F9
    .byte $B5 ; |X XX X X| $18FA
    .byte $73 ; | XXX  XX| $18FB
    .byte $BD ; |X XXXX X| $18FC
    .byte $75 ; | XXX X X| $18FD
    .byte $B6 ; |X XX XX | $18FE
    .byte $55 ; | X X X X| $18FF
    .byte $94 ; |X  X X  | $1900
    .byte $54 ; | X X X  | $1901
    .byte $AB ; |X X X XX| $1902
    .byte $9B ; |X  XX XX| $1903
    .byte $55 ; | X X X X| $1904
    .byte $63 ; | XX   XX| $1905
    .byte $95 ; |X  X X X| $1906
    .byte $57 ; | X X XXX| $1907
    .byte $97 ; |X  X XXX| $1908
    .byte $57 ; | X X XXX| $1909
    .byte $A7 ; |X X  XXX| $190A
    .byte $5D ; | X XXX X| $190B
    .byte $E5 ; |XXX  X X| $190C
    .byte $97 ; |X  X XXX| $190D
    .byte $A4 ; |X X  X  | $190E
    .byte $57 ; | X X XXX| $190F
    .byte $6D ; | XX XX X| $1910
    .byte $94 ; |X  X X  | $1911

TunnelStripingTab:
;this table is AND'd with the tunnel
;border colors to stripe the borders.
    .byte $00 ; |        | $1912   end of tunnel border
    .byte $00 ; |        | $1913   end of tunnel border
    .byte $F6 ; |XXXX XX | $1914
    .byte $F4 ; |XXXX X  | $1915
    .byte $F2 ; |XXXX  X | $1916
    .byte $F2 ; |XXXX  X | $1917
    .byte $F4 ; |XXXX X  | $1918
    .byte $F6 ; |XXXX XX | $1919

Digit_Logo_Tab:
    .byte  <L195B-1      ; $191A   zero
    .byte  <L195B        ; $191B   one
    .byte  <L195B+1      ; $191C   two
    .byte  <L195B+2      ; $191D   three
    .byte  <L195B+3      ; $191E   four
    .byte  <L195B+4      ; $191F   five
    .byte  <L195B+5      ; $1920   six
    .byte  <L195B+6      ; $1921   seven
    .byte  <L19AB-1      ; $1922   eight
    .byte  <L19AB        ; $1923   nine
    .byte  <L19AB+1      ; $1924   blank digit
    .byte  <L19AB+6      ; $1925   Imagic
    .byte  <L19AB+5      ; $1926   Imagic
    .byte  <L19AB+4      ; $1927   Imagic
    .byte  <L19AB+3      ; $1928   Imagic
    .byte  <L19AB+2      ; $1929   Copyright

DelayLoPtrsTab:
    .byte  <DelayCycles+3   ; by 5 cycles
    .byte  <DelayCycles+3      ; 5 cycles
    .byte  <DelayCycles+3      ; 5 cycles
    .byte  <DelayCycles+4      ; 4 cycles
    .byte  <DelayCycles+4      ; 4 cycles
    .byte  <DelayCycles+4      ; 4 cycles
    .byte  <DelayCycles+5      ; 3 cycles
    .byte  <DelayCycles+5      ; 3 cycles
    .byte  <DelayCycles        ; 8 cycles
    .byte  <DelayCycles        ; 8 cycles
    .byte  <DelayCycles+1      ; 7 cycles
    .byte  <DelayCycles+1      ; 7 cycles
    .byte  <DelayCycles+1      ; 7 cycles
    .byte  <DelayCycles+2      ; 6 cycles
    .byte  <DelayCycles+2      ; 6 cycles
    .byte  <DelayCycles+2      ; 6 cycles

L193A:
    .byte $12 ; |   X  X | $193A
    .byte $5F ; | X XXXXX| $193B
    .byte $7F ; | XXXXXXX| $193C
    .byte $C2 ; |XX    X | $193D
    .byte $1F ; |   XXXXX| $193E
    .byte $AF ; |X X XXXX| $193F
    .byte $72 ; | XXX  X | $1940
    .byte $2F ; |  X XXXX| $1941
    .byte $7F ; | XXXXXXX| $1942
    .byte $4F ; | X  XXXX| $1943
    .byte $32 ; |  XX  X | $1944
    .byte $AF ; |X X XXXX| $1945
    .byte $4F ; | X  XXXX| $1946
    .byte $5F ; | X XXXXX| $1947
    .byte $62 ; | XX   X | $1948
    .byte $7F ; | XXXXXXX| $1949
    .byte $AF ; |X X XXXX| $194A
    .byte $1F ; |   XXXXX| $194B
    .byte $0F ; |    XXXX| $194C
    .byte $F2 ; |XXXX  X | $194D
    .byte $3F ; |  XXXXXX| $194E
    .byte $8F ; |X   XXXX| $194F
    .byte $FF ; |XXXXXXXX| $1950
    .byte $BF ; |X XXXXXX| $1951
    .byte $52 ; | X X  X | $1952
    .byte $CF ; |XX  XXXX| $1953
    .byte $EF ; |XXX XXXX| $1954
    .byte $AF ; |X X XXXX| $1955
    .byte $DF ; |XX XXXXX| $1956
    .byte $B2 ; |X XX  X | $1957
    .byte $5F ; | X XXXXX| $1958
    .byte $7F ; | XXXXXXX| $1959
    .byte $0F ; |    XXXX| $195A


         ;  0   1   2   3   4   5   6   7        zero      one     two     three     four     five     six     seven
L195B:
    .byte  $38,$7E,$FE,$38,$1E,$78,$78,$78  ; |  XXX   | XXXXXX |XXXXXXX |  XXX   |   XXXX | XXXX   | XXXX   | XXXX   |
    .byte  $7C,$3C,$C6,$6C,$0C,$CC,$CC,$30  ; | XXXXX  |  XXXX  |XX   XX | XX XX  |    XX  |XX  XX  |XX  XX  |  XX    |
    .byte  $EE,$18,$72,$C6,$0C,$C6,$86,$30  ; |XXX XXX |   XX   | XXX  X |XX   XX |    XX  |XX   XX |X    XX |  XX    |
    .byte  $C6,$18,$38,$C6,$FE,$66,$86,$30  ; |XX   XX |   XX   |  XXX   |XX   XX |XXXXXXX | XX  XX |X    XX |  XX    |
    .byte  $82,$18,$1C,$66,$CC,$06,$CC,$18  ; |X     X |   XX   |   XXX  | XX  XX |XX  XX  |     XX |XX  XX  |   XX   |
    .byte  $82,$18,$0E,$0E,$6C,$0E,$F8,$0C  ; |X     X |   XX   |    XXX |    XXX | XX XX  |    XXX |XXXXX   |    XX  |
    .byte  $82,$18,$66,$3C,$64,$FC,$60,$06  ; |X     X |   XX   | XX  XX |  XXXX  | XX  X  |XXXXXX  | XX     |     XX |
    .byte  $C6,$38,$46,$18,$30,$C0,$60,$C6  ; |XX   XX |  XXX   | X   XX |   XX   |  XX    |XX      | XX     |XX   XX |
    .byte  $6C,$18,$6E,$4C,$B0,$C0,$32,$C6  ; | XX XX  |   XX   | XX XXX | X  XX  |X XX    |XX      |  XX  X |XX   XX |
    .byte  $38,$08,$3C,$7E,$E0,$F8,$1E,$7E  ; |  XXX   |    X   |  XXXX  | XXXXXX |XXX     |XXXXX   |   XXXX | XXXXXX |


         ;  8   9       copyright Imagic        eight     nine    blank                 copyright Imagic
L19AB:
    .byte  $38,$70,$00,$00,$00,$00,$00,$00  ; |  XXX   | XXX    |        |        |        |        |        |        |
    .byte  $6C,$58,$00,$3E,$1D,$15,$33,$98  ; | XX XX  | X XX   |        |  XXXXX |   XXX X|   X X X|  XX  XX|X  XX   |
    .byte  $C6,$0C,$00,$41,$09,$55,$49,$24  ; |XX   XX |    XX  |        | X     X|    X  X| X X X X| X  X  X|  X  X  |
    .byte  $C6,$04,$00,$5D,$09,$55,$49,$20  ; |XX   XX |     X  |        | X XXX X|    X  X| X X X X| X  X  X|  X     |
    .byte  $C6,$06,$00,$51,$09,$55,$59,$20  ; |XX   XX |     XX |        | X X   X|    X  X| X X X X| X XX  X|  X     |
    .byte  $6C,$7E,$00,$51,$09,$57,$41,$20  ; | XX XX  | XXXXXX |        | X X   X|    X  X| X X XXX| X     X|  X     |
    .byte  $38,$E6,$00,$5D,$09,$55,$41,$20  ; |  XXX   |XXX  XX |        | X XXX X|    X  X| X X X X| X     X|  X     |
    .byte  $6C,$C6,$00,$41,$09,$55,$41,$20  ; | XX XX  |XX   XX |        | X     X|    X  X| X X X X| X     X|  X     |
    .byte  $6C,$6E,$00,$3E,$09,$55,$49,$24  ; | XX XX  | XX XXX |        |  XXXXX |    X  X| X X X X| X  X  X|  X  X  |
    .byte  $38,$3C,$00,$00,$1C,$A2,$33,$98  ; |  XXX   |  XXXX  |        |        |   XXX  |X X   X |  XX  XX|X  XX   |


    .byte $00 ; |        | $19FB
    .byte $00 ; |        | $19FC
    .byte $00 ; |        | $19FD
    .byte $00 ; |        | $19FE
    .byte $00 ; |        | $19FF

    .byte $00 ; |        | $1A00
    .byte $02 ; |      X | $1A01
    .byte $8E ; |X   XXX | $1A02
    .byte $DC ; |XX XXX  | $1A03
    .byte $78 ; | XXXX   | $1A04
    .byte $30 ; |  XX    | $1A05
    .byte $1A ; |   XX X | $1A06
    .byte $0C ; |    XX  | $1A07
    .byte $04 ; |     X  | $1A08
    .byte $00 ; |        | $1A09
    .byte $00 ; |        | $1A0A
    .byte $00 ; |        | $1A0B
    .byte $00 ; |        | $1A0C
    .byte $00 ; |        | $1A0D
    .byte $00 ; |        | $1A0E
    .byte $00 ; |        | $1A0F

    .byte $00 ; |        | $1A10
    .byte $20 ; |  X     | $1A11
    .byte $60 ; | XX     | $1A12
    .byte $60 ; | XX     | $1A13
    .byte $E0 ; |XXX     | $1A14
    .byte $D0 ; |XX X    | $1A15
    .byte $F0 ; |XXXX    | $1A16
    .byte $60 ; | XX     | $1A17
    .byte $20 ; |  X     | $1A18
    .byte $00 ; |        | $1A19
    .byte $00 ; |        | $1A1A
    .byte $00 ; |        | $1A1B
    .byte $00 ; |        | $1A1C
    .byte $00 ; |        | $1A1D
    .byte $00 ; |        | $1A1E
    .byte $00 ; |        | $1A1F

    .byte $00 ; |        | $1A20
    .byte $00 ; |        | $1A21
    .byte $00 ; |        | $1A22
    .byte $80 ; |X       | $1A23
    .byte $80 ; |X       | $1A24
    .byte $A0 ; |X X     | $1A25
    .byte $E0 ; |XXX     | $1A26
    .byte $C0 ; |XX      | $1A27
    .byte $40 ; | X      | $1A28
    .byte $00 ; |        | $1A29
    .byte $00 ; |        | $1A2A
    .byte $00 ; |        | $1A2B
    .byte $00 ; |        | $1A2C
    .byte $00 ; |        | $1A2D
    .byte $00 ; |        | $1A2E
    .byte $00 ; |        | $1A2F

    .byte $00 ; |        | $1A30
    .byte $00 ; |        | $1A31
    .byte $00 ; |        | $1A32
    .byte $00 ; |        | $1A33
    .byte $00 ; |        | $1A34
    .byte $00 ; |        | $1A35
    .byte $00 ; |        | $1A36
    .byte $00 ; |        | $1A37
    .byte $00 ; |        | $1A38
    .byte $00 ; |        | $1A39
    .byte $00 ; |        | $1A3A
    .byte $00 ; |        | $1A3B
    .byte $00 ; |        | $1A3C
    .byte $00 ; |        | $1A3D
    .byte $00 ; |        | $1A3E
    .byte $00 ; |        | $1A3F

    .byte $00 ; |        | $1A40
    .byte $71 ; | XXX   X| $1A41
    .byte $C7 ; |XX   XXX| $1A42
    .byte $EE ; |XXX XXX | $1A43
    .byte $FC ; |XXXXXX  | $1A44
    .byte $F0 ; |XXXX    | $1A45
    .byte $C0 ; |XX      | $1A46
    .byte $A0 ; |X X     | $1A47
    .byte $30 ; |  XX    | $1A48
    .byte $F0 ; |XXXX    | $1A49
    .byte $B8 ; |X XXX   | $1A4A
    .byte $C8 ; |XX  X   | $1A4B
    .byte $88 ; |X   X   | $1A4C
    .byte $00 ; |        | $1A4D
    .byte $00 ; |        | $1A4E
    .byte $00 ; |        | $1A4F

    .byte $00 ; |        | $1A50
    .byte $66 ; | XX  XX | $1A51
    .byte $EF ; |XXX XXXX| $1A52
    .byte $FF ; |XXXXXXXX| $1A53
    .byte $FD ; |XXXXXX X| $1A54
    .byte $F9 ; |XXXXX  X| $1A55
    .byte $C8 ; |XX  X   | $1A56
    .byte $A0 ; |X X     | $1A57
    .byte $30 ; |  XX    | $1A58
    .byte $F0 ; |XXXX    | $1A59
    .byte $B8 ; |X XXX   | $1A5A
    .byte $C8 ; |XX  X   | $1A5B
    .byte $88 ; |X   X   | $1A5C
    .byte $00 ; |        | $1A5D
    .byte $00 ; |        | $1A5E
    .byte $00 ; |        | $1A5F

    .byte $00 ; |        | $1A60
    .byte $69 ; | XX X  X| $1A61
    .byte $CD ; |XX  XX X| $1A62
    .byte $FD ; |XXXXXX X| $1A63
    .byte $F7 ; |XXXX XXX| $1A64
    .byte $F7 ; |XXXX XXX| $1A65
    .byte $D3 ; |XX X  XX| $1A66
    .byte $A0 ; |X X     | $1A67
    .byte $30 ; |  XX    | $1A68
    .byte $F0 ; |XXXX    | $1A69
    .byte $B8 ; |X XXX   | $1A6A
    .byte $C8 ; |XX  X   | $1A6B
    .byte $88 ; |X   X   | $1A6C
    .byte $00 ; |        | $1A6D
    .byte $00 ; |        | $1A6E
    .byte $00 ; |        | $1A6F

    .byte $00 ; |        | $1A70
    .byte $68 ; | XX X   | $1A71
    .byte $EC ; |XXX XX  | $1A72
    .byte $EC ; |XXX XX  | $1A73
    .byte $FC ; |XXXXXX  | $1A74
    .byte $FD ; |XXXXXX X| $1A75
    .byte $FF ; |XXXXXXXX| $1A76
    .byte $C6 ; |XX   XX | $1A77
    .byte $82 ; |X     X | $1A78
    .byte $E0 ; |XXX     | $1A79
    .byte $F0 ; |XXXX    | $1A7A
    .byte $38 ; |  XXX   | $1A7B
    .byte $08 ; |    X   | $1A7C
    .byte $38 ; |  XXX   | $1A7D
    .byte $18 ; |   XX   | $1A7E
    .byte $30 ; |  XX    | $1A7F

    .byte $00 ; |        | $1A80
    .byte $8E ; |X   XXX | $1A81
    .byte $E3 ; |XXX   XX| $1A82
    .byte $77 ; | XXX XXX| $1A83
    .byte $3F ; |  XXXXXX| $1A84
    .byte $0F ; |    XXXX| $1A85
    .byte $03 ; |      XX| $1A86
    .byte $05 ; |     X X| $1A87
    .byte $0C ; |    XX  | $1A88
    .byte $0F ; |    XXXX| $1A89
    .byte $1D ; |   XXX X| $1A8A
    .byte $13 ; |   X  XX| $1A8B
    .byte $11 ; |   X   X| $1A8C
    .byte $00 ; |        | $1A8D
    .byte $00 ; |        | $1A8E
    .byte $00 ; |        | $1A8F

    .byte $00 ; |        | $1A90
    .byte $66 ; | XX  XX | $1A91
    .byte $F7 ; |XXXX XXX| $1A92
    .byte $FF ; |XXXXXXXX| $1A93
    .byte $BF ; |X XXXXXX| $1A94
    .byte $9F ; |X  XXXXX| $1A95
    .byte $13 ; |   X  XX| $1A96
    .byte $05 ; |     X X| $1A97
    .byte $0C ; |    XX  | $1A98
    .byte $0F ; |    XXXX| $1A99
    .byte $1D ; |   XXX X| $1A9A
    .byte $13 ; |   X  XX| $1A9B
    .byte $11 ; |   X   X| $1A9C
    .byte $00 ; |        | $1A9D
    .byte $00 ; |        | $1A9E
    .byte $00 ; |        | $1A9F

    .byte $00 ; |        | $1AA0
    .byte $96 ; |X  X XX | $1AA1
    .byte $B3 ; |X XX  XX| $1AA2
    .byte $BF ; |X XXXXXX| $1AA3
    .byte $EF ; |XXX XXXX| $1AA4
    .byte $EF ; |XXX XXXX| $1AA5
    .byte $CB ; |XX  X XX| $1AA6
    .byte $05 ; |     X X| $1AA7
    .byte $0C ; |    XX  | $1AA8
    .byte $0F ; |    XXXX| $1AA9
    .byte $1D ; |   XXX X| $1AAA
    .byte $13 ; |   X  XX| $1AAB
    .byte $11 ; |   X   X| $1AAC
    .byte $00 ; |        | $1AAD
    .byte $00 ; |        | $1AAE
    .byte $00 ; |        | $1AAF

    .byte $00 ; |        | $1AB0
    .byte $16 ; |   X XX | $1AB1
    .byte $37 ; |  XX XXX| $1AB2
    .byte $37 ; |  XX XXX| $1AB3
    .byte $3F ; |  XXXXXX| $1AB4
    .byte $BF ; |X XXXXXX| $1AB5
    .byte $FF ; |XXXXXXXX| $1AB6
    .byte $63 ; | XX   XX| $1AB7
    .byte $41 ; | X     X| $1AB8
    .byte $07 ; |     XXX| $1AB9
    .byte $0F ; |    XXXX| $1ABA
    .byte $1C ; |   XXX  | $1ABB
    .byte $10 ; |   X    | $1ABC
    .byte $1C ; |   XXX  | $1ABD
    .byte $18 ; |   XX   | $1ABE
    .byte $0C ; |    XX  | $1ABF

    .byte $00 ; |        | $1AC0
    .byte $40 ; | X      | $1AC1
    .byte $71 ; | XXX   X| $1AC2
    .byte $3B ; |  XXX XX| $1AC3
    .byte $1E ; |   XXXX | $1AC4
    .byte $0C ; |    XX  | $1AC5
    .byte $58 ; | X XX   | $1AC6
    .byte $30 ; |  XX    | $1AC7
    .byte $20 ; |  X     | $1AC8
    .byte $00 ; |        | $1AC9
    .byte $00 ; |        | $1ACA
    .byte $00 ; |        | $1ACB
    .byte $00 ; |        | $1ACC
    .byte $00 ; |        | $1ACD
    .byte $00 ; |        | $1ACE
    .byte $00 ; |        | $1ACF

    .byte $00 ; |        | $1AD0
    .byte $04 ; |     X  | $1AD1
    .byte $06 ; |     XX | $1AD2
    .byte $06 ; |     XX | $1AD3
    .byte $07 ; |     XXX| $1AD4
    .byte $0B ; |    X XX| $1AD5
    .byte $0F ; |    XXXX| $1AD6
    .byte $06 ; |     XX | $1AD7
    .byte $04 ; |     X  | $1AD8
    .byte $00 ; |        | $1AD9
    .byte $00 ; |        | $1ADA
    .byte $00 ; |        | $1ADB
    .byte $00 ; |        | $1ADC
    .byte $00 ; |        | $1ADD
    .byte $00 ; |        | $1ADE
    .byte $00 ; |        | $1ADF

    .byte $00 ; |        | $1AE0
    .byte $00 ; |        | $1AE1
    .byte $00 ; |        | $1AE2
    .byte $01 ; |       X| $1AE3
    .byte $01 ; |       X| $1AE4
    .byte $05 ; |     X X| $1AE5
    .byte $07 ; |     XXX| $1AE6
    .byte $03 ; |      XX| $1AE7
    .byte $02 ; |      X | $1AE8
    .byte $00 ; |        | $1AE9
    .byte $00 ; |        | $1AEA
    .byte $00 ; |        | $1AEB
    .byte $00 ; |        | $1AEC
    .byte $00 ; |        | $1AED
    .byte $00 ; |        | $1AEE
    .byte $00 ; |        | $1AEF

    .byte $00 ; |        | $1AF0
    .byte $00 ; |        | $1AF1
    .byte $00 ; |        | $1AF2
    .byte $00 ; |        | $1AF3
    .byte $00 ; |        | $1AF4
    .byte $00 ; |        | $1AF5
    .byte $00 ; |        | $1AF6
    .byte $00 ; |        | $1AF7
    .byte $00 ; |        | $1AF8
    .byte $00 ; |        | $1AF9
    .byte $00 ; |        | $1AFA
    .byte $00 ; |        | $1AFB
    .byte $00 ; |        | $1AFC
    .byte $00 ; |        | $1AFD
    .byte $00 ; |        | $1AFE
    .byte $00 ; |        | $1AFF

    .byte $1E ; |   XXXX | $1B00
    .byte $1E ; |   XXXX | $1B01
    .byte $1E ; |   XXXX | $1B02
    .byte $EA ; |XXX X X | $1B03
    .byte $EA ; |XXX X X | $1B04
    .byte $EA ; |XXX X X | $1B05
    .byte $48 ; | X  X   | $1B06
    .byte $48 ; | X  X   | $1B07
    .byte $AA ; |X X X X | $1B08
    .byte $AA ; |X X X X | $1B09
    .byte $0C ; |    XX  | $1B0A
    .byte $0E ; |    XXX | $1B0B
    .byte $0E ; |    XXX | $1B0C
    .byte $0C ; |    XX  | $1B0D
    .byte $AA ; |X X X X | $1B0E
    .byte $AA ; |X X X X | $1B0F
    .byte $86 ; |X    XX | $1B10
    .byte $86 ; |X    XX | $1B11
    .byte $1A ; |   XX X | $1B12
    .byte $1A ; |   XX X | $1B13
    .byte $1A ; |   XX X | $1B14
    .byte $86 ; |X    XX | $1B15
    .byte $86 ; |X    XX | $1B16
    .byte $86 ; |X    XX | $1B17
    .byte $2C ; |  X XX  | $1B18
    .byte $2C ; |  X XX  | $1B19
    .byte $48 ; | X  X   | $1B1A
    .byte $FE ; |XXXXXXX | $1B1B
    .byte $FE ; |XXXXXXX | $1B1C
    .byte $48 ; | X  X   | $1B1D
    .byte $2C ; |  X XX  | $1B1E
    .byte $2C ; |  X XX  | $1B1F
    .byte $72 ; | XXX  X | $1B20
    .byte $72 ; | XXX  X | $1B21
    .byte $76 ; | XXX XX | $1B22
    .byte $76 ; | XXX XX | $1B23
    .byte $88 ; |X   X   | $1B24
    .byte $A6 ; |X X  XX | $1B25
    .byte $A6 ; |X X  XX | $1B26
    .byte $A6 ; |X X  XX | $1B27
    .byte $E8 ; |XXX X   | $1B28
    .byte $E8 ; |XXX X   | $1B29
    .byte $EA ; |XXX X X | $1B2A
    .byte $14 ; |   X X  | $1B2B
    .byte $14 ; |   X X  | $1B2C
    .byte $E8 ; |XXX X   | $1B2D
    .byte $E8 ; |XXX X   | $1B2E
    .byte $E8 ; |XXX X   | $1B2F
    .byte $0E ; |    XXX | $1B30
    .byte $0E ; |    XXX | $1B31
    .byte $D8 ; |XX XX   | $1B32
    .byte $D8 ; |XX XX   | $1B33
    .byte $D8 ; |XX XX   | $1B34
    .byte $1A ; |   XX X | $1B35
    .byte $0E ; |    XXX | $1B36
    .byte $0E ; |    XXX | $1B37
    .byte $E8 ; |XXX X   | $1B38
    .byte $E8 ; |XXX X   | $1B39
    .byte $E8 ; |XXX X   | $1B3A
    .byte $E8 ; |XXX X   | $1B3B
    .byte $E8 ; |XXX X   | $1B3C
    .byte $0A ; |    X X | $1B3D
    .byte $0A ; |    X X | $1B3E
    .byte $38 ; |  XXX   | $1B3F
    .byte $46 ; | X   XX | $1B40
    .byte $48 ; | X  X   | $1B41
    .byte $4A ; | X  X X | $1B42
    .byte $88 ; |X   X   | $1B43
    .byte $88 ; |X   X   | $1B44
    .byte $4A ; | X  X X | $1B45
    .byte $48 ; | X  X   | $1B46
    .byte $46 ; | X   XX | $1B47
    .byte $1C ; |   XXX  | $1B48
    .byte $1C ; |   XXX  | $1B49
    .byte $3A ; |  XXX X | $1B4A
    .byte $28 ; |  X X   | $1B4B
    .byte $28 ; |  X X   | $1B4C
    .byte $28 ; |  X X   | $1B4D
    .byte $3A ; |  XXX X | $1B4E
    .byte $36 ; |  XX XX | $1B4F
    .byte $94 ; |X  X X  | $1B50
    .byte $06 ; |     XX | $1B51
    .byte $0A ; |    X X | $1B52
    .byte $0E ; |    XXX | $1B53
    .byte $0E ; |    XXX | $1B54
    .byte $0A ; |    X X | $1B55
    .byte $06 ; |     XX | $1B56
    .byte $94 ; |X  X X  | $1B57
    .byte $1E ; |   XXXX | $1B58
    .byte $1E ; |   XXXX | $1B59
    .byte $26 ; |  X  XX | $1B5A
    .byte $34 ; |  XX X  | $1B5B
    .byte $26 ; |  X  XX | $1B5C
    .byte $0A ; |    X X | $1B5D
    .byte $1A ; |   XX X | $1B5E
    .byte $1A ; |   XX X | $1B5F
    .byte $3A ; |  XXX X | $1B60
    .byte $3A ; |  XXX X | $1B61
    .byte $3A ; |  XXX X | $1B62
    .byte $D7 ; |XX X XXX| $1B63
    .byte $D7 ; |XX X XXX| $1B64
    .byte $3A ; |  XXX X | $1B65
    .byte $3A ; |  XXX X | $1B66
    .byte $3A ; |  XXX X | $1B67
    .byte $E8 ; |XXX X   | $1B68
    .byte $E8 ; |XXX X   | $1B69
    .byte $48 ; | X  X   | $1B6A
    .byte $1E ; |   XXXX | $1B6B
    .byte $1E ; |   XXXX | $1B6C
    .byte $48 ; | X  X   | $1B6D
    .byte $E8 ; |XXX X   | $1B6E
    .byte $E8 ; |XXX X   | $1B6F
    .byte $46 ; | X   XX | $1B70
    .byte $68 ; | XX X   | $1B71
    .byte $56 ; | X X XX | $1B72
    .byte $54 ; | X X X  | $1B73
    .byte $F8 ; |XXXXX   | $1B74
    .byte $56 ; | X X XX | $1B75
    .byte $68 ; | XX X   | $1B76
    .byte $46 ; | X   XX | $1B77
    .byte $1C ; |   XXX  | $1B78
    .byte $1A ; |   XX X | $1B79
    .byte $28 ; |  X X   | $1B7A
    .byte $26 ; |  X  XX | $1B7B
    .byte $28 ; |  X X   | $1B7C
    .byte $18 ; |   XX   | $1B7D
    .byte $1A ; |   XX X | $1B7E
    .byte $1C ; |   XXX  | $1B7F
    .byte $48 ; | X  X   | $1B80
    .byte $48 ; | X  X   | $1B81
    .byte $58 ; | X XX   | $1B82
    .byte $5C ; | X XXX  | $1B83
    .byte $58 ; | X XX   | $1B84
    .byte $48 ; | X  X   | $1B85
    .byte $48 ; | X  X   | $1B86
    .byte $48 ; | X  X   | $1B87
    .byte $6A ; | XX X X | $1B88
    .byte $6A ; | XX X X | $1B89
    .byte $3A ; |  XXX X | $1B8A
    .byte $3A ; |  XXX X | $1B8B
    .byte $2C ; |  X XX  | $1B8C
    .byte $2C ; |  X XX  | $1B8D
    .byte $6A ; | XX X X | $1B8E
    .byte $6A ; | XX X X | $1B8F
    .byte $1A ; |   XX X | $1B90
    .byte $1A ; |   XX X | $1B91
    .byte $2A ; |  X X X | $1B92
    .byte $2C ; |  X XX  | $1B93
    .byte $2C ; |  X XX  | $1B94
    .byte $FE ; |XXXXXXX | $1B95
    .byte $FE ; |XXXXXXX | $1B96
    .byte $E8 ; |XXX X   | $1B97
    .byte $58 ; | X XX   | $1B98
    .byte $88 ; |X   X   | $1B99
    .byte $78 ; | XXXX   | $1B9A
    .byte $56 ; | X X XX | $1B9B
    .byte $56 ; | X X XX | $1B9C
    .byte $78 ; | XXXX   | $1B9D
    .byte $88 ; |X   X   | $1B9E
    .byte $58 ; | X XX   | $1B9F
L1BA0:
    .byte $50 ; | X X    | $1BA0
    .byte $44 ; | X   X  | $1BA1
    .byte $24 ; |  X  X  | $1BA2
    .byte $04 ; |     X  | $1BA3
    .byte $E4 ; |XXX  X  | $1BA4
    .byte $C4 ; |XX   X  | $1BA5
    .byte $A4 ; |X X  X  | $1BA6
    .byte $84 ; |X    X  | $1BA7
    .byte $55 ; | X X X X| $1BA8
    .byte $35 ; |  XX X X| $1BA9
    .byte $15 ; |   X X X| $1BAA
    .byte $F5 ; |XXXX X X| $1BAB
    .byte $D5 ; |XX X X X| $1BAC
    .byte $B5 ; |X XX X X| $1BAD
    .byte $95 ; |X  X X X| $1BAE
    .byte $66 ; | XX  XX | $1BAF
    .byte $46 ; | X   XX | $1BB0
    .byte $26 ; |  X  XX | $1BB1
    .byte $06 ; |     XX | $1BB2
    .byte $E6 ; |XXX  XX | $1BB3
    .byte $C6 ; |XX   XX | $1BB4
    .byte $A6 ; |X X  XX | $1BB5
    .byte $86 ; |X    XX | $1BB6
    .byte $57 ; | X X XXX| $1BB7
    .byte $37 ; |  XX XXX| $1BB8
    .byte $17 ; |   X XXX| $1BB9
    .byte $F7 ; |XXXX XXX| $1BBA
    .byte $D7 ; |XX X XXX| $1BBB
    .byte $B7 ; |X XX XXX| $1BBC
    .byte $97 ; |X  X XXX| $1BBD
    .byte $68 ; | XX X   | $1BBE
    .byte $48 ; | X  X   | $1BBF
    .byte $28 ; |  X X   | $1BC0
    .byte $08 ; |    X   | $1BC1
L1BC2:
    .byte $2A ; |  X X X | $1BC2
    .byte $26 ; |  X  XX | $1BC3
    .byte $24 ; |  X  X  | $1BC4
    .byte $20 ; |  X     | $1BC5
    .byte $1E ; |   XXXX | $1BC6
    .byte $1A ; |   XX X | $1BC7
    .byte $18 ; |   XX   | $1BC8
    .byte $14 ; |   X X  | $1BC9
    .byte $12 ; |   X  X | $1BCA
    .byte $0E ; |    XXX | $1BCB
    .byte $0C ; |    XX  | $1BCC
    .byte $0A ; |    X X | $1BCD
    .byte $08 ; |    X   | $1BCE
L1BCF:
    .byte $04 ; |     X  | $1BCF
    .byte $01 ; |       X| $1BD0
    .byte $03 ; |      XX| $1BD1
    .byte $08 ; |    X   | $1BD2
    .byte $04 ; |     X  | $1BD3
    .byte $0C ; |    XX  | $1BD4
    .byte $04 ; |     X  | $1BD5
    .byte $0C ; |    XX  | $1BD6
    .byte $08 ; |    X   | $1BD7
    .byte $04 ; |     X  | $1BD8
    .byte $09 ; |    X  X| $1BD9
    .byte $0F ; |    XXXX| $1BDA
    .byte $0C ; |    XX  | $1BDB
    .byte $04 ; |     X  | $1BDC
    .byte $01 ; |       X| $1BDD
    .byte $04 ; |     X  | $1BDE
    .byte $0C ; |    XX  | $1BDF
    .byte $02 ; |      X | $1BE0
    .byte $04 ; |     X  | $1BE1
    .byte $0C ; |    XX  | $1BE2
    .byte $0C ; |    XX  | $1BE3
    .byte $06 ; |     XX | $1BE4
    .byte $04 ; |     X  | $1BE5
    .byte $04 ; |     X  | $1BE6
    .byte $04 ; |     X  | $1BE7
L1BE8:
    .byte $00 ; |        | $1BE8
    .byte $C8 ; |XX  X   | $1BE9
    .byte $68 ; | XX X   | $1BEA
    .byte $08 ; |    X   | $1BEB
    .byte $49 ; | X  X  X| $1BEC
    .byte $1C ; |   XXX  | $1BED
    .byte $57 ; | X X XXX| $1BEE
    .byte $37 ; |  XX XXX| $1BEF
    .byte $29 ; |  X X  X| $1BF0
    .byte $E8 ; |XXX X   | $1BF1
L1BF2:
    .byte $DA ; |XX XX X | $1BF2
    .byte $36 ; |  XX XX | $1BF3

L1BF4:   ;indirect jump
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    pha                          ; 3
    asl                          ; 2
    jmp    L170E                 ; 3

    .byte $00 ; |        | $1BFC
    .byte $00 ; |        | $1BFD
    .byte $00 ; |        | $1BFE
    .byte $00 ; |        | $1BFF

    .byte $00 ; |        | $1C00
    .byte $00 ; |        | $1C01
    .byte $00 ; |        | $1C02
    .byte $00 ; |        | $1C03
    .byte $00 ; |        | $1C04
    .byte $00 ; |        | $1C05
    .byte $00 ; |        | $1C06
    .byte $00 ; |        | $1C07

    .byte $00 ; |        | $1C08
    .byte $52 ; | X X  X | $1C09
    .byte $00 ; |        | $1C0A
    .byte $81 ; |X      X| $1C0B
    .byte $00 ; |        | $1C0C
    .byte $81 ; |X      X| $1C0D
    .byte $00 ; |        | $1C0E
    .byte $4A ; | X  X X | $1C0F

    .byte $00 ; |        | $1C10
    .byte $00 ; |        | $1C11
    .byte $24 ; |  X  X  | $1C12
    .byte $5A ; | X XX X | $1C13
    .byte $24 ; |  X  X  | $1C14
    .byte $5A ; | X XX X | $1C15
    .byte $24 ; |  X  X  | $1C16
    .byte $00 ; |        | $1C17

    .byte $00 ; |        | $1C18
    .byte $00 ; |        | $1C19
    .byte $00 ; |        | $1C1A
    .byte $28 ; |  X X   | $1C1B
    .byte $14 ; |   X X  | $1C1C
    .byte $28 ; |  X X   | $1C1D
    .byte $00 ; |        | $1C1E
    .byte $00 ; |        | $1C1F

    .byte $00 ; |        | $1C20
    .byte $00 ; |        | $1C21
    .byte $FF ; |XXXXXXXX| $1C22
    .byte $FF ; |XXXXXXXX| $1C23
    .byte $FF ; |XXXXXXXX| $1C24
    .byte $FF ; |XXXXXXXX| $1C25
    .byte $FF ; |XXXXXXXX| $1C26
    .byte $FF ; |XXXXXXXX| $1C27

    .byte $F8 ; |XXXXX   | $1C28
    .byte $58 ; | X XX   | $1C29
    .byte $AE ; |X X XXX | $1C2A
    .byte $FF ; |XXXXXXXX| $1C2B
    .byte $9F ; |X  XXXXX| $1C2C
    .byte $DF ; |XX XXXXX| $1C2D
    .byte $7F ; | XXXXXXX| $1C2E
    .byte $3E ; |  XXXXX | $1C2F
    .byte $A5 ; |X X  X X| $1C30
    .byte $E7 ; |XXX  XXX| $1C31
    .byte $A5 ; |X X  X X| $1C32
    .byte $3C ; |  XXXX  | $1C33
    .byte $24 ; |  X  X  | $1C34
    .byte $7E ; | XXXXXX | $1C35
    .byte $DB ; |XX XX XX| $1C36
    .byte $7E ; | XXXXXX | $1C37
    .byte $9E ; |X  XXXX | $1C38
    .byte $B2 ; |X XX  X | $1C39
    .byte $EF ; |XXX XXXX| $1C3A
    .byte $C2 ; |XX    X | $1C3B
    .byte $0F ; |    XXXX| $1C3C
    .byte $02 ; |      X | $1C3D
    .byte $0E ; |    XXX | $1C3E
    .byte $0F ; |    XXXX| $1C3F

    .byte $3C ; |  XXXX  | $1C40
    .byte $E6 ; |XXX  XX | $1C41
    .byte $83 ; |X     XX| $1C42
    .byte $FD ; |XXXXXX X| $1C43
    .byte $D7 ; |XX X XXX| $1C44
    .byte $7E ; | XXXXXX | $1C45
    .byte $3C ; |  XXXX  | $1C46
    .byte $18 ; |   XX   | $1C47

    .byte $00 ; |        | $1C48
    .byte $24 ; |  X  X  | $1C49
    .byte $5A ; | X XX X | $1C4A
    .byte $BD ; |X XXXX X| $1C4B
    .byte $DB ; |XX XX XX| $1C4C
    .byte $BD ; |X XXXX X| $1C4D
    .byte $5A ; | X XX X | $1C4E
    .byte $24 ; |  X  X  | $1C4F

    .byte $00 ; |        | $1C50
    .byte $42 ; | X    X | $1C51
    .byte $42 ; | X    X | $1C52
    .byte $7E ; | XXXXXX | $1C53
    .byte $DB ; |XX XX XX| $1C54
    .byte $7E ; | XXXXXX | $1C55
    .byte $42 ; | X    X | $1C56
    .byte $42 ; | X    X | $1C57

    .byte $00 ; |        | $1C58
    .byte $81 ; |X      X| $1C59
    .byte $42 ; | X    X | $1C5A
    .byte $24 ; |  X  X  | $1C5B
    .byte $5A ; | X XX X | $1C5C
    .byte $24 ; |  X  X  | $1C5D
    .byte $42 ; | X    X | $1C5E
    .byte $81 ; |X      X| $1C5F

    .byte $00 ; |        | $1C60
    .byte $00 ; |        | $1C61
    .byte $00 ; |        | $1C62
    .byte $10 ; |   X    | $1C63
    .byte $28 ; |  X X   | $1C64
    .byte $6C ; | XX XX  | $1C65
    .byte $C6 ; |XX   XX | $1C66
    .byte $82 ; |X     X | $1C67

    .byte $00 ; |        | $1C68
    .byte $00 ; |        | $1C69
    .byte $82 ; |X     X | $1C6A
    .byte $82 ; |X     X | $1C6B
    .byte $D6 ; |XX X XX | $1C6C
    .byte $6C ; | XX XX  | $1C6D
    .byte $00 ; |        | $1C6E
    .byte $00 ; |        | $1C6F

    .byte $00 ; |        | $1C70
    .byte $00 ; |        | $1C71
    .byte $44 ; | X   X  | $1C72
    .byte $82 ; |X     X | $1C73
    .byte $82 ; |X     X | $1C74
    .byte $C6 ; |XX   XX | $1C75
    .byte $7C ; | XXXXX  | $1C76
    .byte $10 ; |   X    | $1C77

    .byte $00 ; |        | $1C78
    .byte $81 ; |X      X| $1C79
    .byte $5A ; | X XX X | $1C7A
    .byte $24 ; |  X  X  | $1C7B
    .byte $5A ; | X XX X | $1C7C
    .byte $24 ; |  X  X  | $1C7D
    .byte $5A ; | X XX X | $1C7E
    .byte $81 ; |X      X| $1C7F

    .byte $00 ; |        | $1C80
    .byte $00 ; |        | $1C81
    .byte $5A ; | X XX X | $1C82
    .byte $3C ; |  XXXX  | $1C83
    .byte $7E ; | XXXXXX | $1C84
    .byte $3C ; |  XXXX  | $1C85
    .byte $5A ; | X XX X | $1C86
    .byte $00 ; |        | $1C87

    .byte $00 ; |        | $1C88
    .byte $00 ; |        | $1C89
    .byte $3C ; |  XXXX  | $1C8A
    .byte $5A ; | X XX X | $1C8B
    .byte $66 ; | XX  XX | $1C8C
    .byte $5A ; | X XX X | $1C8D
    .byte $3C ; |  XXXX  | $1C8E
    .byte $00 ; |        | $1C8F

    .byte $00 ; |        | $1C90
    .byte $00 ; |        | $1C91
    .byte $24 ; |  X  X  | $1C92
    .byte $3C ; |  XXXX  | $1C93
    .byte $18 ; |   XX   | $1C94
    .byte $FF ; |XXXXXXXX| $1C95
    .byte $99 ; |X  XX  X| $1C96
    .byte $BD ; |X XXXX X| $1C97

    .byte $00 ; |        | $1C98
    .byte $00 ; |        | $1C99
    .byte $3C ; |  XXXX  | $1C9A
    .byte $99 ; |X  XX  X| $1C9B
    .byte $7E ; | XXXXXX | $1C9C
    .byte $18 ; |   XX   | $1C9D
    .byte $3C ; |  XXXX  | $1C9E
    .byte $00 ; |        | $1C9F

    .byte $00 ; |        | $1CA0
    .byte $A5 ; |X X  X X| $1CA1
    .byte $99 ; |X  XX  X| $1CA2
    .byte $DB ; |XX XX XX| $1CA3
    .byte $7E ; | XXXXXX | $1CA4
    .byte $3C ; |  XXXX  | $1CA5
    .byte $18 ; |   XX   | $1CA6
    .byte $00 ; |        | $1CA7

    .byte $3C ; |  XXXX  | $1CA8
    .byte $3C ; |  XXXX  | $1CA9
    .byte $38 ; |  XXX   | $1CAA
    .byte $36 ; |  XX XX | $1CAB
    .byte $38 ; |  XXX   | $1CAC
    .byte $36 ; |  XX XX | $1CAD
    .byte $38 ; |  XXX   | $1CAE
    .byte $3C ; |  XXXX  | $1CAF
    .byte $3A ; |  XXX X | $1CB0
    .byte $3A ; |  XXX X | $1CB1
    .byte $8C ; |X   XX  | $1CB2
    .byte $2C ; |  X XX  | $1CB3
    .byte $BC ; |X XXXX  | $1CB4
    .byte $3A ; |  XXX X | $1CB5
    .byte $9C ; |X  XXX  | $1CB6
    .byte $6C ; | XX XX  | $1CB7
    .byte $CD ; |XX  XX X| $1CB8
    .byte $CD ; |XX  XX X| $1CB9
    .byte $CA ; |XX  X X | $1CBA
    .byte $E8 ; |XXX X   | $1CBB
    .byte $E8 ; |XXX X   | $1CBC
    .byte $E8 ; |XXX X   | $1CBD
    .byte $CA ; |XX  X X | $1CBE
    .byte $CD ; |XX  XX X| $1CBF
    .byte $3C ; |  XXXX  | $1CC0
    .byte $3C ; |  XXXX  | $1CC1
    .byte $3C ; |  XXXX  | $1CC2
    .byte $EA ; |XXX X X | $1CC3
    .byte $FA ; |XXXXX X | $1CC4
    .byte $FA ; |XXXXX X | $1CC5
    .byte $F8 ; |XXXXX   | $1CC6
    .byte $E8 ; |XXX X   | $1CC7
L1CC8:
    .byte $00 ; |        | $1CC8   PF1
    .byte $40 ; | X      | $1CC9
    .byte $50 ; | X X    | $1CCA
    .byte $54 ; | X X X  | $1CCB
    .byte $55 ; | X X X X| $1CCC
    .byte $55 ; | X X X X| $1CCD
    .byte $55 ; | X X X X| $1CCE
    .byte $55 ; | X X X X| $1CCF
    .byte $55 ; | X X X X| $1CD0
L1CD1:
    .byte $DE ; |XX XXXX | $1CD1
    .byte $3A ; |  XXX X | $1CD2

L1CD3:
    bit    $E6                   ; 3
    bpl    L1CFB                 ; 2³
    lda    frameCounter
    and    #$18                  ; 2
    bne    L1CFB                 ; 2³
    bit    $98                   ; 3
    bmi    L1CFB                 ; 2³
    ldx    $CD                   ; 3
    beq    L1CFB                 ; 2³
    cpx    $92                   ; 3
    bcs    L1CFB                 ; 2³
    ldy    $B3,X                 ; 4
    bpl    L1CF4                 ; 2³
    dey                          ; 2
    cpy    #$E4                  ; 2
    bcs    L1CF9                 ; 2³
    bcc    L1CFB                    ;  always branch

L1CF4:
    iny                          ; 2
    cpy    #$1C                  ; 2
    bcs    L1CFB                 ; 2³
L1CF9:
    sty    $B3,X                 ; 4
L1CFB:
    jmp    L1006                 ; 3

    .byte $00 ; |        | $1CFE
    .byte $00 ; |        | $1CFF

    .byte $40 ; | X      | $1D00
    .byte $20 ; |  X     | $1D01
    .byte $90 ; |X  X    | $1D02
    .byte $FC ; |XXXXXX  | $1D03
    .byte $5E ; | X XXXX | $1D04
    .byte $77 ; | XXX XXX| $1D05
    .byte $03 ; |      XX| $1D06
    .byte $01 ; |       X| $1D07

    .byte $00 ; |        | $1D08
    .byte $40 ; | X      | $1D09
    .byte $20 ; |  X     | $1D0A
    .byte $9E ; |X  XXXX | $1D0B
    .byte $F3 ; |XXXX  XX| $1D0C
    .byte $50 ; | X X    | $1D0D
    .byte $78 ; | XXXX   | $1D0E
    .byte $00 ; |        | $1D0F

    .byte $00 ; |        | $1D10
    .byte $00 ; |        | $1D11
    .byte $0F ; |    XXXX| $1D12
    .byte $FE ; |XXXXXXX | $1D13
    .byte $FC ; |XXXXXX  | $1D14
    .byte $50 ; | X X    | $1D15
    .byte $78 ; | XXXX   | $1D16
    .byte $00 ; |        | $1D17

    .byte $03 ; |      XX| $1D18
    .byte $03 ; |      XX| $1D19
    .byte $E6 ; |XXX  XX | $1D1A
    .byte $3C ; |  XXXX  | $1D1B
    .byte $78 ; | XXXX   | $1D1C
    .byte $D0 ; |XX X    | $1D1D
    .byte $70 ; | XXX    | $1D1E
    .byte $20 ; |  X     | $1D1F

    .byte $00 ; |        | $1D20
    .byte $00 ; |        | $1D21
    .byte $E0 ; |XXX     | $1D22
    .byte $7F ; | XXXXXXX| $1D23
    .byte $DF ; |XX XXXXX| $1D24
    .byte $70 ; | XXX    | $1D25
    .byte $20 ; |  X     | $1D26
    .byte $00 ; |        | $1D27

    .byte $E0 ; |XXX     | $1D28
    .byte $20 ; |  X     | $1D29
    .byte $78 ; | XXXX   | $1D2A
    .byte $DC ; |XX XXX  | $1D2B
    .byte $76 ; | XXX XX | $1D2C
    .byte $22 ; |  X   X | $1D2D
    .byte $03 ; |      XX| $1D2E
    .byte $01 ; |       X| $1D2F

    .byte $3E ; |  XXXXX | $1D30
    .byte $63 ; | XX   XX| $1D31
    .byte $41 ; | X     X| $1D32
    .byte $48 ; | X  X   | $1D33
    .byte $41 ; | X     X| $1D34
    .byte $63 ; | XX   XX| $1D35
    .byte $3E ; |  XXXXX | $1D36
    .byte $00 ; |        | $1D37

    .byte $00 ; |        | $1D38
    .byte $7C ; | XXXXX  | $1D39
    .byte $C7 ; |XX   XXX| $1D3A
    .byte $90 ; |X  X    | $1D3B
    .byte $C7 ; |XX   XXX| $1D3C
    .byte $7C ; | XXXXX  | $1D3D
    .byte $00 ; |        | $1D3E
    .byte $00 ; |        | $1D3F

    .byte $70 ; | XXX    | $1D40
    .byte $90 ; |X  X    | $1D41
    .byte $9E ; |X  XXXX | $1D42
    .byte $A0 ; |X X     | $1D43
    .byte $9E ; |X  XXXX | $1D44
    .byte $90 ; |X  X    | $1D45
    .byte $70 ; | XXX    | $1D46
    .byte $00 ; |        | $1D47

    .byte $20 ; |  X     | $1D48
    .byte $70 ; | XXX    | $1D49
    .byte $F0 ; |XXXX    | $1D4A
    .byte $F8 ; |XXXXX   | $1D4B
    .byte $B8 ; |X XXX   | $1D4C
    .byte $F0 ; |XXXX    | $1D4D
    .byte $70 ; | XXX    | $1D4E
    .byte $20 ; |  X     | $1D4F

    .byte $00 ; |        | $1D50
    .byte $70 ; | XXX    | $1D51
    .byte $78 ; | XXXX   | $1D52
    .byte $FE ; |XXXXXXX | $1D53
    .byte $DE ; |XX XXXX | $1D54
    .byte $78 ; | XXXX   | $1D55
    .byte $70 ; | XXX    | $1D56
    .byte $00 ; |        | $1D57

    .byte $00 ; |        | $1D58
    .byte $20 ; |  X     | $1D59
    .byte $70 ; | XXX    | $1D5A
    .byte $FF ; |XXXXXXXX| $1D5B
    .byte $FF ; |XXXXXXXX| $1D5C
    .byte $70 ; | XXX    | $1D5D
    .byte $20 ; |  X     | $1D5E
    .byte $00 ; |        | $1D5F

    .byte $10 ; |   X    | $1D60
    .byte $38 ; |  XXX   | $1D61
    .byte $FC ; |XXXXXX  | $1D62
    .byte $8C ; |X   XX  | $1D63
    .byte $86 ; |X    XX | $1D64
    .byte $23 ; |  X   XX| $1D65
    .byte $C2 ; |XX    X | $1D66
    .byte $7E ; | XXXXXX | $1D67

    .byte $0C ; |    XX  | $1D68
    .byte $1E ; |   XXXX | $1D69
    .byte $7F ; | XXXXXXX| $1D6A
    .byte $87 ; |X    XXX| $1D6B
    .byte $23 ; |  X   XX| $1D6C
    .byte $06 ; |     XX | $1D6D
    .byte $E6 ; |XXX  XX | $1D6E
    .byte $3C ; |  XXXX  | $1D6F

    .byte $1C ; |   XXX  | $1D70
    .byte $3E ; |  XXXXX | $1D71
    .byte $7F ; | XXXXXXX| $1D72
    .byte $FF ; |XXXXXXXX| $1D73
    .byte $9F ; |X  XXXXX| $1D74
    .byte $A1 ; |X X    X| $1D75
    .byte $C3 ; |XX    XX| $1D76
    .byte $3E ; |  XXXXX | $1D77

    .byte $10 ; |   X    | $1D78
    .byte $56 ; | X X XX | $1D79
    .byte $5C ; | X XXX  | $1D7A
    .byte $F7 ; |XXXX XXX| $1D7B
    .byte $FF ; |XXXXXXXX| $1D7C
    .byte $54 ; | X X X  | $1D7D
    .byte $56 ; | X X XX | $1D7E
    .byte $10 ; |   X    | $1D7F

    .byte $0C ; |    XX  | $1D80
    .byte $1B ; |   XX XX| $1D81
    .byte $6E ; | XX XXX | $1D82
    .byte $FF ; |XXXXXXXX| $1D83
    .byte $EF ; |XXX XXXX| $1D84
    .byte $7E ; | XXXXXX | $1D85
    .byte $2B ; |  X X XX| $1D86

    .byte $0C ; |    XX  | $1D87
    .byte $37 ; |  XX XXX| $1D88
    .byte $24 ; |  X  X  | $1D89
    .byte $2F ; |  X XXXX| $1D8A
    .byte $7E ; | XXXXXX | $1D8B
    .byte $76 ; | XXX XX | $1D8C
    .byte $3F ; |  XXXXXX| $1D8D
    .byte $24 ; |  X  X  | $1D8E
    .byte $37 ; |  XX XXX| $1D8F

    .byte $08 ; |    X   | $1D90
    .byte $0C ; |    XX  | $1D91
    .byte $EE ; |XXX XXX | $1D92
    .byte $BF ; |X XXXXXX| $1D93
    .byte $E8 ; |XXX X   | $1D94
    .byte $3C ; |  XXXX  | $1D95
    .byte $00 ; |        | $1D96
    .byte $00 ; |        | $1D97

    .byte $00 ; |        | $1D98
    .byte $E0 ; |XXX     | $1D99
    .byte $2E ; |  X XXX | $1D9A
    .byte $BF ; |X XXXXXX| $1D9B
    .byte $E8 ; |XXX X   | $1D9C
    .byte $3C ; |  XXXX  | $1D9D
    .byte $00 ; |        | $1D9E
    .byte $00 ; |        | $1D9F

    .byte $E0 ; |XXX     | $1DA0
    .byte $20 ; |  X     | $1DA1
    .byte $BE ; |X XXXXX | $1DA2
    .byte $EF ; |XXX XXXX| $1DA3
    .byte $3F ; |  XXXXXX| $1DA4
    .byte $0E ; |    XXX | $1DA5
    .byte $0C ; |    XX  | $1DA6
    .byte $08 ; |    X   | $1DA7

    .byte $00 ; |        | $1DA8
    .byte $00 ; |        | $1DA9
    .byte $7C ; | XXXXX  | $1DAA
    .byte $FF ; |XXXXXXXX| $1DAB
    .byte $CE ; |XX  XXX | $1DAC
    .byte $EC ; |XXX XX  | $1DAD
    .byte $68 ; | XX X   | $1DAE
    .byte $E8 ; |XXX X   | $1DAF

    .byte $00 ; |        | $1DB0
    .byte $00 ; |        | $1DB1
    .byte $3E ; |  XXXXX | $1DB2
    .byte $FF ; |XXXXXXXX| $1DB3
    .byte $DE ; |XX XXXX | $1DB4
    .byte $60 ; | XX     | $1DB5
    .byte $E0 ; |XXX     | $1DB6
    .byte $40 ; | X      | $1DB7

    .byte $20 ; |  X     | $1DB8
    .byte $30 ; |  XX    | $1DB9
    .byte $38 ; |  XXX   | $1DBA
    .byte $FE ; |XXXXXXX | $1DBB
    .byte $C1 ; |XX     X| $1DBC
    .byte $60 ; | XX     | $1DBD
    .byte $E0 ; |XXX     | $1DBE
    .byte $40 ; | X      | $1DBF

    .byte $3C ; |  XXXX  | $1DC0
    .byte $66 ; | XX  XX | $1DC1
    .byte $C3 ; |XX    XX| $1DC2
    .byte $80 ; |X       | $1DC3
    .byte $01 ; |       X| $1DC4
    .byte $C3 ; |XX    XX| $1DC5
    .byte $66 ; | XX  XX | $1DC6
    .byte $3C ; |  XXXX  | $1DC7

    .byte $00 ; |        | $1DC8
    .byte $3C ; |  XXXX  | $1DC9
    .byte $66 ; | XX  XX | $1DCA
    .byte $C3 ; |XX    XX| $1DCB
    .byte $C3 ; |XX    XX| $1DCC
    .byte $66 ; | XX  XX | $1DCD
    .byte $3C ; |  XXXX  | $1DCE
    .byte $00 ; |        | $1DCF

    .byte $00 ; |        | $1DD0
    .byte $00 ; |        | $1DD1
    .byte $00 ; |        | $1DD2
    .byte $54 ; | X X X  | $1DD3
    .byte $2A ; |  X X X | $1DD4
    .byte $00 ; |        | $1DD5
    .byte $00 ; |        | $1DD6
    .byte $00 ; |        | $1DD7

    .byte $1F ; |   XXXXX| $1DD8
    .byte $01 ; |       X| $1DD9
    .byte $07 ; |     XXX| $1DDA
    .byte $4C ; | X  XX  | $1DDB
    .byte $F8 ; |XXXXX   | $1DDC
    .byte $AC ; |X X XX  | $1DDD
    .byte $66 ; | XX  XX | $1DDE
    .byte $03 ; |      XX| $1DDF

    .byte $3C ; |  XXXX  | $1DE0
    .byte $06 ; |     XX | $1DE1
    .byte $06 ; |     XX | $1DE2
    .byte $0F ; |    XXXX| $1DE3
    .byte $FE ; |XXXXXXX | $1DE4
    .byte $60 ; | XX     | $1DE5
    .byte $A0 ; |X X     | $1DE6
    .byte $60 ; | XX     | $1DE7

    .byte $71 ; | XXX   X| $1DE8
    .byte $1B ; |   XX XX| $1DE9
    .byte $0F ; |    XXXX| $1DEA
    .byte $DE ; |XX XXXX | $1DEB
    .byte $78 ; | XXXX   | $1DEC
    .byte $60 ; | XX     | $1DED
    .byte $A0 ; |X X     | $1DEE
    .byte $60 ; | XX     | $1DEF
L1DF0:
    .byte $38 ; |  XXX   | $1DF0
    .byte $10 ; |   X    | $1DF1
    .byte $1C ; |   XXX  | $1DF2
    .byte $1C ; |   XXX  | $1DF3
    .byte $1C ; |   XXX  | $1DF4
    .byte $0C ; |    XX  | $1DF5
    .byte $0C ; |    XX  | $1DF6
    .byte $0C ; |    XX  | $1DF7
    .byte $0C ; |    XX  | $1DF8
    .byte $FE ; |XXXXXXX | $1DF9
    .byte $FE ; |XXXXXXX | $1DFA
    .byte $FE ; |XXXXXXX | $1DFB
    .byte $FE ; |XXXXXXX | $1DFC
    .byte $FE ; |XXXXXXX | $1DFD
    .byte $FE ; |XXXXXXX | $1DFE
    .byte $FE ; |XXXXXXX | $1DFF

    .byte $18 ; |   XX   | $1E00
    .byte $3C ; |  XXXX  | $1E01
    .byte $7E ; | XXXXXX | $1E02
    .byte $F3 ; |XXXX  XX| $1E03
    .byte $CF ; |XX  XXXX| $1E04
    .byte $7E ; | XXXXXX | $1E05
    .byte $3C ; |  XXXX  | $1E06
    .byte $18 ; |   XX   | $1E07

    .byte $18 ; |   XX   | $1E08
    .byte $18 ; |   XX   | $1E09
    .byte $3C ; |  XXXX  | $1E0A
    .byte $76 ; | XXX XX | $1E0B
    .byte $6E ; | XX XXX | $1E0C
    .byte $3C ; |  XXXX  | $1E0D
    .byte $18 ; |   XX   | $1E0E
    .byte $18 ; |   XX   | $1E0F

    .byte $10 ; |   X    | $1E10
    .byte $10 ; |   X    | $1E11
    .byte $10 ; |   X    | $1E12
    .byte $10 ; |   X    | $1E13
    .byte $08 ; |    X   | $1E14
    .byte $08 ; |    X   | $1E15
    .byte $08 ; |    X   | $1E16
    .byte $08 ; |    X   | $1E17

    .byte $00 ; |        | $1E18
    .byte $00 ; |        | $1E19
    .byte $D8 ; |XX XX   | $1E1A
    .byte $BE ; |X XXXXX | $1E1B
    .byte $78 ; | XXXX   | $1E1C
    .byte $0C ; |    XX  | $1E1D
    .byte $06 ; |     XX | $1E1E
    .byte $03 ; |      XX| $1E1F

    .byte $00 ; |        | $1E20
    .byte $00 ; |        | $1E21
    .byte $18 ; |   XX   | $1E22
    .byte $FF ; |XXXXXXXX| $1E23
    .byte $BC ; |X XXXX  | $1E24
    .byte $60 ; | XX     | $1E25
    .byte $00 ; |        | $1E26
    .byte $00 ; |        | $1E27

    .byte $E0 ; |XXX     | $1E28
    .byte $78 ; | XXXX   | $1E29
    .byte $3C ; |  XXXX  | $1E2A
    .byte $1E ; |   XXXX | $1E2B
    .byte $FF ; |XXXXXXXX| $1E2C
    .byte $A0 ; |X X     | $1E2D
    .byte $60 ; | XX     | $1E2E
    .byte $00 ; |        | $1E2F

    .byte $00 ; |        | $1E30
    .byte $18 ; |   XX   | $1E31
    .byte $66 ; | XX  XX | $1E32
    .byte $FF ; |XXXXXXXX| $1E33
    .byte $FF ; |XXXXXXXX| $1E34
    .byte $66 ; | XX  XX | $1E35
    .byte $18 ; |   XX   | $1E36
    .byte $00 ; |        | $1E37

    .byte $18 ; |   XX   | $1E38
    .byte $3C ; |  XXXX  | $1E39
    .byte $66 ; | XX  XX | $1E3A
    .byte $FF ; |XXXXXXXX| $1E3B
    .byte $FF ; |XXXXXXXX| $1E3C
    .byte $66 ; | XX  XX | $1E3D
    .byte $3C ; |  XXXX  | $1E3E
    .byte $18 ; |   XX   | $1E3F

    .byte $18 ; |   XX   | $1E40
    .byte $3C ; |  XXXX  | $1E41
    .byte $66 ; | XX  XX | $1E42
    .byte $7E ; | XXXXXX | $1E43
    .byte $7E ; | XXXXXX | $1E44
    .byte $66 ; | XX  XX | $1E45
    .byte $3C ; |  XXXX  | $1E46
    .byte $18 ; |   XX   | $1E47

    .byte $38 ; |  XXX   | $1E48
    .byte $7E ; | XXXXXX | $1E49
    .byte $AA ; |X X X X | $1E4A
    .byte $03 ; |      XX| $1E4B
    .byte $0B ; |    X XX| $1E4C
    .byte $AE ; |X X XXX | $1E4D
    .byte $7C ; | XXXXX  | $1E4E
    .byte $38 ; |  XXX   | $1E4F

    .byte $00 ; |        | $1E50
    .byte $7C ; | XXXXX  | $1E51
    .byte $FF ; |XXXXXXXX| $1E52
    .byte $AB ; |X X X XX| $1E53
    .byte $AF ; |X X XXXX| $1E54
    .byte $7F ; | XXXXXXX| $1E55
    .byte $38 ; |  XXX   | $1E56
    .byte $00 ; |        | $1E57

    .byte $01 ; |       X| $1E58
    .byte $03 ; |      XX| $1E59
    .byte $3F ; |  XXXXXX| $1E5A
    .byte $7E ; | XXXXXX | $1E5B
    .byte $7E ; | XXXXXX | $1E5C
    .byte $3F ; |  XXXXXX| $1E5D
    .byte $01 ; |       X| $1E5E
    .byte $01 ; |       X| $1E5F

    .byte $00 ; |        | $1E60
    .byte $3C ; |  XXXX  | $1E61
    .byte $7E ; | XXXXXX | $1E62
    .byte $D7 ; |XX X XXX| $1E63
    .byte $AB ; |X X X XX| $1E64
    .byte $7E ; | XXXXXX | $1E65
    .byte $38 ; |  XXX   | $1E66
    .byte $00 ; |        | $1E67

    .byte $3C ; |  XXXX  | $1E68
    .byte $46 ; | X   XX | $1E69
    .byte $93 ; |X  X  XX| $1E6A
    .byte $39 ; |  XXX  X| $1E6B
    .byte $39 ; |  XXX  X| $1E6C
    .byte $13 ; |   X  XX| $1E6D
    .byte $C6 ; |XX   XX | $1E6E
    .byte $7C ; | XXXXX  | $1E6F

    .byte $46 ; | X   XX | $1E70
    .byte $93 ; |X  X  XX| $1E71
    .byte $B8 ; |X XXX   | $1E72
    .byte $4C ; | X  XX  | $1E73
    .byte $4D ; | X  XX X| $1E74
    .byte $38 ; |  XXX   | $1E75
    .byte $93 ; |X  X  XX| $1E76
    .byte $46 ; | X   XX | $1E77

    .byte $00 ; |        | $1E78
    .byte $F0 ; |XXXX    | $1E79
    .byte $39 ; |  XXX  X| $1E7A
    .byte $FE ; |XXXXXXX | $1E7B
    .byte $DE ; |XX XXXX | $1E7C
    .byte $79 ; | XXXX  X| $1E7D
    .byte $38 ; |  XXX   | $1E7E
    .byte $0C ; |    XX  | $1E7F

    .byte $E0 ; |XXX     | $1E80
    .byte $30 ; |  XX    | $1E81
    .byte $38 ; |  XXX   | $1E82
    .byte $DF ; |XX XXXXX| $1E83
    .byte $F8 ; |XXXXX   | $1E84
    .byte $78 ; | XXXX   | $1E85
    .byte $0C ; |    XX  | $1E86
    .byte $00 ; |        | $1E87

    .byte $00 ; |        | $1E88
    .byte $C1 ; |XX     X| $1E89
    .byte $E3 ; |XXX   XX| $1E8A
    .byte $FE ; |XXXXXXX | $1E8B
    .byte $BE ; |X XXXXX | $1E8C
    .byte $E3 ; |XXX   XX| $1E8D
    .byte $71 ; | XXX   X| $1E8E
    .byte $38 ; |  XXX   | $1E8F

    .byte $00 ; |        | $1E90
    .byte $20 ; |  X     | $1E91
    .byte $00 ; |        | $1E92
    .byte $20 ; |  X     | $1E93
    .byte $70 ; | XXX    | $1E94
    .byte $FA ; |XXXXX X | $1E95
    .byte $70 ; | XXX    | $1E96
    .byte $20 ; |  X     | $1E97

    .byte $08 ; |    X   | $1E98
    .byte $00 ; |        | $1E99
    .byte $1C ; |   XXX  | $1E9A
    .byte $BD ; |X XXXX X| $1E9B
    .byte $1C ; |   XXX  | $1E9C
    .byte $08 ; |    X   | $1E9D
    .byte $00 ; |        | $1E9E
    .byte $08 ; |    X   | $1E9F

    .byte $04 ; |     X  | $1EA0
    .byte $0E ; |    XXX | $1EA1
    .byte $5F ; | X XXXXX| $1EA2
    .byte $0E ; |    XXX | $1EA3
    .byte $04 ; |     X  | $1EA4
    .byte $00 ; |        | $1EA5
    .byte $04 ; |     X  | $1EA6
    .byte $00 ; |        | $1EA7

    .byte $1C ; |   XXX  | $1EA8
    .byte $38 ; |  XXX   | $1EA9
    .byte $70 ; | XXX    | $1EAA
    .byte $10 ; |   X    | $1EAB
    .byte $18 ; |   XX   | $1EAC
    .byte $0C ; |    XX  | $1EAD
    .byte $06 ; |     XX | $1EAE
    .byte $03 ; |      XX| $1EAF

    .byte $00 ; |        | $1EB0
    .byte $1C ; |   XXX  | $1EB1
    .byte $38 ; |  XXX   | $1EB2
    .byte $7E ; | XXXXXX | $1EB3
    .byte $07 ; |     XXX| $1EB4
    .byte $A0 ; |X X     | $1EB5
    .byte $00 ; |        | $1EB6
    .byte $00 ; |        | $1EB7

    .byte $1D ; |   XXX X| $1EB8
    .byte $33 ; |  XX  XX| $1EB9
    .byte $7E ; | XXXXXX | $1EBA
    .byte $00 ; |        | $1EBB
    .byte $A0 ; |X X     | $1EBC
    .byte $00 ; |        | $1EBD
    .byte $00 ; |        | $1EBE
    .byte $00 ; |        | $1EBF

    .byte $08 ; |    X   | $1EC0
    .byte $0C ; |    XX  | $1EC1
    .byte $0E ; |    XXX | $1EC2
    .byte $0E ; |    XXX | $1EC3
    .byte $7F ; | XXXXXXX| $1EC4
    .byte $70 ; | XXX    | $1EC5
    .byte $30 ; |  XX    | $1EC6
    .byte $10 ; |   X    | $1EC7

    .byte $00 ; |        | $1EC8
    .byte $00 ; |        | $1EC9
    .byte $00 ; |        | $1ECA
    .byte $0C ; |    XX  | $1ECB
    .byte $7F ; | XXXXXXX| $1ECC
    .byte $30 ; |  XX    | $1ECD
    .byte $00 ; |        | $1ECE
    .byte $00 ; |        | $1ECF

    .byte $00 ; |        | $1ED0
    .byte $20 ; |  X     | $1ED1
    .byte $30 ; |  XX    | $1ED2
    .byte $38 ; |  XXX   | $1ED3
    .byte $7E ; | XXXXXX | $1ED4
    .byte $0E ; |    XXX | $1ED5
    .byte $06 ; |     XX | $1ED6
    .byte $02 ; |      X | $1ED7

L1ED8:
    .byte $5A ; | X XX X | $1ED8
    .byte $69 ; | XX X  X| $1ED9
    .byte $73 ; | XXX  XX| $1EDA
    .byte $7E ; | XXXXXX | $1EDB
    .byte $89 ; |X   X  X| $1EDC
    .byte $94 ; |X  X X  | $1EDD
    .byte $9F ; |X  XXXXX| $1EDE
    .byte $9F ; |X  XXXXX| $1EDF
    .byte $AA ; |X X X X | $1EE0
    .byte $AA ; |X X X X | $1EE1
    .byte $B5 ; |X XX X X| $1EE2
    .byte $B5 ; |X XX X X| $1EE3
    .byte $C0 ; |XX      | $1EE4
    .byte $CB ; |XX  X XX| $1EE5
    .byte $5A ; | X XX X | $1EE6
L1EE7:
    .byte $05 ; |     X X| $1EE7
    .byte $03 ; |      XX| $1EE8
    .byte $09 ; |    X  X| $1EE9
    .byte $0E ; |    XXX | $1EEA
    .byte $13 ; |   X  XX| $1EEB
    .byte $07 ; |     XXX| $1EEC
    .byte $0A ; |    X X | $1EED
    .byte $08 ; |    X   | $1EEE

L1EEF:
    .word  L16E3-1       ; $1EEF
    .word  L16A2-1       ; $1EF1
    .word  L16AD-1       ; $1EF3
    .word  L166C-1       ; $1EF5
    .word  L16B8-1       ; $1EF7
    .word  L169C-1       ; $1EF9
    .word  L166C-1       ; $1EFB
    .word  L16E8-1       ; $1EFD
    .word  L16F3-1       ; $1EFF
    .word  L16CD-1       ; $1F01
    .word  L16FA-1       ; $1F03
    .word  L1708-1       ; $1F05
    .word  L13CC-1       ; $1F07
    .word  L13E9-1       ; $1F09
    .word  L18D6-1       ; $1F0B
    .word  L1FE5-1       ; $1F0D
    .word  L169A-1       ; $1F0F
    .word  L1BF4-1       ; $1F11
    .word  L13E8-1       ; $1F13
    .word  L16C3-1       ; $1F15
    .word  L18E5-1       ; $1F17
    .word  L1708-1       ; $1F19
    .word  L1FDD-1       ; $1F1B
    .word  L1690-1       ; $1F1D
    .word  L167F-1       ; $1F1F

L1F21:
    .byte $08 ; |    X   | $1F21
    .byte $09 ; |    X  X| $1F22
    .byte $0B ; |    X XX| $1F23
    .byte $0D ; |    XX X| $1F24
    .byte $10 ; |   X    | $1F25
    .byte $12 ; |   X  X | $1F26
    .byte $14 ; |   X X  | $1F27
    .byte $00 ; |        | $1F28

    .byte $89 ; |X   X  X| $1F29
    .byte $89 ; |X   X  X| $1F2A
    .byte $AA ; |X X X X | $1F2B
    .byte $AC ; |X X XX  | $1F2C
    .byte $AA ; |X X X X | $1F2D
    .byte $D9 ; |XX XX  X| $1F2E
    .byte $08 ; |    X   | $1F2F
    .byte $00 ; |        | $1F30

    .byte $00 ; |        | $1F31
    .byte $44 ; | X   X  | $1F32
    .byte $92 ; |X  X  X | $1F33
    .byte $38 ; |  XXX   | $1F34
    .byte $7C ; | XXXXX  | $1F35
    .byte $7C ; | XXXXX  | $1F36
    .byte $38 ; |  XXX   | $1F37
    .byte $92 ; |X  X  X | $1F38
    .byte $44 ; | X   X  | $1F39

    .byte $00 ; |        | $1F3A
    .byte $10 ; |   X    | $1F3B
    .byte $38 ; |  XXX   | $1F3C
    .byte $7C ; | XXXXX  | $1F3D
    .byte $FE ; |XXXXXXX | $1F3E
    .byte $FE ; |XXXXXXX | $1F3F
    .byte $7C ; | XXXXX  | $1F40
    .byte $38 ; |  XXX   | $1F41
    .byte $10 ; |   X    | $1F42
L1F43:
    .byte $00 ; |        | $1F43
    .byte $04 ; |     X  | $1F44
    .byte $06 ; |     XX | $1F45
    .byte $08 ; |    X   | $1F46
    .byte $0A ; |    X X | $1F47
    .byte $0A ; |    X X | $1F48
    .byte $08 ; |    X   | $1F49
    .byte $06 ; |     XX | $1F4A
    .byte $04 ; |     X  | $1F4B
L1F4C:
    .byte $00 ; |        | $1F4C
    .byte $00 ; |        | $1F4D
    .byte $00 ; |        | $1F4E
    .byte $00 ; |        | $1F4F
    .byte $00 ; |        | $1F50
    .byte $00 ; |        | $1F51
    .byte $00 ; |        | $1F52
    .byte $00 ; |        | $1F53
L1F54:
    .byte $00 ; |        | $1F54
    .byte $80 ; |X       | $1F55
    .byte $C0 ; |XX      | $1F56
    .byte $E0 ; |XXX     | $1F57
    .byte $F0 ; |XXXX    | $1F58
    .byte $F8 ; |XXXXX   | $1F59
    .byte $FC ; |XXXXXX  | $1F5A
    .byte $FE ; |XXXXXXX | $1F5B
    .byte $FF ; |XXXXXXXX| $1F5C
    .byte $FF ; |XXXXXXXX| $1F5D
    .byte $FF ; |XXXXXXXX| $1F5E
    .byte $FF ; |XXXXXXXX| $1F5F
    .byte $FF ; |XXXXXXXX| $1F60
    .byte $FF ; |XXXXXXXX| $1F61
    .byte $FF ; |XXXXXXXX| $1F62
    .byte $FF ; |XXXXXXXX| $1F63
    .byte $FF ; |XXXXXXXX| $1F64
CavernRoof_PF0:
    .byte $00 ; |        | $1F65
    .byte $00 ; |        | $1F66
    .byte $00 ; |        | $1F67
    .byte $00 ; |        | $1F68
    .byte $00 ; |        | $1F69
    .byte $00 ; |        | $1F6A
    .byte $10 ; |   X    | $1F6B
    .byte $10 ; |   X    | $1F6C
    .byte $10 ; |   X    | $1F6D
    .byte $30 ; |  XX    | $1F6E
    .byte $30 ; |  XX    | $1F6F
    .byte $30 ; |  XX    | $1F70
    .byte $70 ; | XXX    | $1F71
    .byte $70 ; | XXX    | $1F72
    .byte $70 ; | XXX    | $1F73
    .byte $50 ; | X X    | $1F74
    .byte $50 ; | X X    | $1F75
    .byte $30 ; |  XX    | $1F76
    .byte $10 ; |   X    | $1F77
    .byte $10 ; |   X    | $1F78
    .byte $30 ; |  XX    | $1F79
    .byte $B0 ; |X XX    | $1F7A
    .byte $30 ; |  XX    | $1F7B
    .byte $B0 ; |X XX    | $1F7C
    .byte $B0 ; |X XX    | $1F7D
CavernRoof_PF1:
    .byte $00 ; |        | $1F7E
    .byte $00 ; |        | $1F7F
    .byte $00 ; |        | $1F80
    .byte $00 ; |        | $1F81
    .byte $00 ; |        | $1F82
    .byte $04 ; |     X  | $1F83
    .byte $04 ; |     X  | $1F84
    .byte $0E ; |    XXX | $1F85
    .byte $1E ; |   XXXX | $1F86
    .byte $0E ; |    XXX | $1F87
    .byte $0C ; |    XX  | $1F88
    .byte $1C ; |   XXX  | $1F89
    .byte $3C ; |  XXXX  | $1F8A
    .byte $18 ; |   XX   | $1F8B
    .byte $3D ; |  XXXX X| $1F8C
    .byte $78 ; | XXXX   | $1F8D
    .byte $38 ; |  XXX   | $1F8E
    .byte $79 ; | XXXX  X| $1F8F
    .byte $F9 ; |XXXXX  X| $1F90
    .byte $79 ; | XXXX  X| $1F91
    .byte $F9 ; |XXXXX  X| $1F92
    .byte $FD ; |XXXXXX X| $1F93
    .byte $F9 ; |XXXXX  X| $1F94
    .byte $FD ; |XXXXXX X| $1F95
    .byte $FF ; |XXXXXXXX| $1F96
CavernRoof_PF2:
    .byte $00 ; |        | $1F97
    .byte $40 ; | X      | $1F98
    .byte $00 ; |        | $1F99
    .byte $60 ; | XX     | $1F9A
    .byte $00 ; |        | $1F9B
    .byte $20 ; |  X     | $1F9C
    .byte $00 ; |        | $1F9D
    .byte $00 ; |        | $1F9E
    .byte $00 ; |        | $1F9F
    .byte $0C ; |    XX  | $1FA0
    .byte $04 ; |     X  | $1FA1
    .byte $0E ; |    XXX | $1FA2
    .byte $1E ; |   XXXX | $1FA3
    .byte $0F ; |    XXXX| $1FA4
    .byte $1F ; |   XXXXX| $1FA5
    .byte $3F ; |  XXXXXX| $1FA6
    .byte $1F ; |   XXXXX| $1FA7
    .byte $3F ; |  XXXXXX| $1FA8
    .byte $7F ; | XXXXXXX| $1FA9
    .byte $3F ; |  XXXXXX| $1FAA
    .byte $7F ; | XXXXXXX| $1FAB
    .byte $FF ; |XXXXXXXX| $1FAC
    .byte $7F ; | XXXXXXX| $1FAD
    .byte $FF ; |XXXXXXXX| $1FAE
    .byte $FF ; |XXXXXXXX| $1FAF

CavernRoofColorTab:
    .byte $72 ; | XXX  X | $1FB0
    .byte $72 ; | XXX  X | $1FB1
    .byte $72 ; | XXX  X | $1FB2
    .byte $74 ; | XXX X  | $1FB3
    .byte $74 ; | XXX X  | $1FB4
    .byte $72 ; | XXX  X | $1FB5
    .byte $74 ; | XXX X  | $1FB6
    .byte $76 ; | XXX XX | $1FB7
    .byte $74 ; | XXX X  | $1FB8
    .byte $76 ; | XXX XX | $1FB9
    .byte $74 ; | XXX X  | $1FBA
    .byte $76 ; | XXX XX | $1FBB
    .byte $76 ; | XXX XX | $1FBC
    .byte $78 ; | XXXX   | $1FBD
    .byte $78 ; | XXXX   | $1FBE
    .byte $76 ; | XXX XX | $1FBF
    .byte $78 ; | XXXX   | $1FC0
    .byte $7A ; | XXXX X | $1FC1
    .byte $78 ; | XXXX   | $1FC2
    .byte $7A ; | XXXX X | $1FC3
    .byte $7C ; | XXXXX  | $1FC4
    .byte $7A ; | XXXX X | $1FC5
    .byte $7C ; | XXXXX  | $1FC6
    .byte $7A ; | XXXX X | $1FC7
    .byte $7C ; | XXXXX  | $1FC8

L1FC9:
    .byte $00 ; |        | $1FC9
    .byte $FF ; |XXXXXXXX| $1FCA
    .byte $FF ; |XXXXXXXX| $1FCB
    .byte $FF ; |XXXXXXXX| $1FCC
    .byte $01 ; |       X| $1FCD
    .byte $FF ; |XXXXXXXX| $1FCE
    .byte $FE ; |XXXXXXX | $1FCF
    .byte $FF ; |XXXXXXXX| $1FD0
    .byte $FF ; |XXXXXXXX| $1FD1
    .byte $FF ; |XXXXXXXX| $1FD2
    .byte $FF ; |XXXXXXXX| $1FD3
    .byte $FF ; |XXXXXXXX| $1FD4
    .byte $01 ; |       X| $1FD5
    .byte $FF ; |XXXXXXXX| $1FD6
    .byte $00 ; |        | $1FD7
    .byte $00 ; |        | $1FD8
    .byte $10 ; |   X    | $1FD9
    .byte $38 ; |  XXX   | $1FDA
    .byte $7C ; | XXXXX  | $1FDB
    .byte $3E ; |  XXXXX | $1FDC

L1FDD:   ;indirect jump
    lda    #$04                  ; 2
    pha                          ; 3
    lda    $DC,X                 ; 4
    jmp    L170E                 ; 3

L1FE5:   ;indirect jump
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    eor    #$1F                  ; 2
    pha                          ; 3
    lda    $CD                   ; 3
    lsr                          ; 2
    bcs    L1FF4                 ; 2
    lda    $DC,X                 ; 4
    ora    #$08                  ; 2
L1FF4:
    jmp    L170E                 ; 3

    .byte $00 ; |        | $1FF7

       ORG $1FF8

    .byte $00 ; |        | $1FF8
    .byte $00 ; |        | $1FF9

    .word START,START,START

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       RORG $3000

    .byte $4D ; | X  XX X| $3000   garbage?
    .byte $44 ; | X   X  | $3001
    .byte $4B ; | X  X XX| $3002

;from bank 0
    jmp    L372C                 ; 3
L3006:
    sta    BANK_0                ; 4   bankswitch, goto L1018

;from bank 0
    lda    $DF                   ; 3
    and    #$EF                  ; 2
    bne    L3079                 ; 2³
    lda    $E3                   ; 3
    and    #$01                  ; 2
    tay                          ; 2
    eor    #$01                  ; 2
    tax                          ; 2
    lda    $C9                   ; 3
    beq    L3026                 ; 2³
    cmp    #$0E                  ; 2
    beq    L3073                 ; 2³
    cmp    #$0C                  ; 2
    bcc    L3079                 ; 2³
    jmp    L30A7                 ; 3
L3026:
    lda    $D4,X                 ; 4
    and    #$F0                  ; 2
    beq    L307C                 ; 2³
    lda    $E3                   ; 3
    eor    #$01                  ; 2
    sta    $E3                   ; 3
    lda    $D6                   ; 3
    ldx    $D7                   ; 3
    stx    $D6                   ; 3
    sta    $D7                   ; 3
    lda    $D8                   ; 3
    ldx    #3                    ; 2
L303E:
    lsr                          ; 2
    ror    $D8                   ; 5
    dex                          ; 2
    bpl    L303E                 ; 2³
    ldx    #5                    ; 2
    lda    $D9                   ; 3
    bpl    L304B                 ; 2³
    inx                          ; 2
L304B:
    and    #$7F                  ; 2
    sta    $E7                   ; 3
    lda    $BB                   ; 3
    bit    $E6                   ; 3
    bpl    L305A                 ; 2³
    lda    $BB                   ; 3
    clc                          ; 2
    adc    $95                   ; 3
L305A:
    eor    $E6                   ; 3
    and    #$7F                  ; 2
    eor    $E6                   ; 3
    sta    $D9                   ; 3
    stx    $E6                   ; 3
    lda    $E7                   ; 3
    sta    $BB                   ; 3
    ldy    #$10                  ; 2
    jsr    L3D5F                 ; 6
    lda    #$0E                  ; 2
    sta    $C9                   ; 3
    bpl    L30E9                    ;  always branch

L3073:
    lda    $DB                   ; 3
    cmp    #$10                  ; 2
    bne    L307C                 ; 2³
L3079:
    jmp    L30E9                 ; 3
L307C:
    lda.wy $D4,Y                 ; 4
    and    #$F0                  ; 2
    bne    L309D                 ; 2³
    lda    #$20                  ; 2
    sta    $DF                   ; 3
    lda    $E6                   ; 3
    bpl    L3093                 ; 2³
    ora    #$01                  ; 2
    sta    $E6                   ; 3
    lda    #$1D                  ; 2
    sta    $D6                   ; 3
L3093:
    ldy    #$0C                  ; 2
    jsr    L3D74                 ; 6
    jsr    L3D68                 ; 6
    bne    L3079                    ;  always branch

L309D:
    bit    $E6                   ; 3
    bpl    L30D0                 ; 2³
    lda    $95                   ; 3
    bne    L30E9                 ; 2³
    beq    L30D3                    ;  always branch

L30A7:
    lda    $98                   ; 3
    lsr                          ; 2
    bcs    L30C8                 ; 2³
    ldx    $D6                   ; 3
    lda    L3EBE,X               ; 4
    and    #$07                  ; 2
    tax                          ; 2
    lda    $8A,X                 ; 4
    adc    #$10                  ; 2
    cmp    $C2                   ; 3
    bcc    L30C8                 ; 2³
    ldy    #$99                  ; 2
    lda    #$95                  ; 2
    jsr    L3D98                 ; 6
    jsr    L3CEA                 ; 6
    bmi    L30E9                    ;  always branch

L30C8:
    lda    #4                    ; 2
    sta    $C9                   ; 3
    sta    $DC                   ; 3
    bpl    L30E9                    ;  always branch

L30D0:
    jsr    L3D0A                 ; 6
L30D3:
    lda    #$0B                  ; 2
    sta    $C9                   ; 3
    lda    $DF                   ; 3
    beq    L30E9                 ; 2³
    lda.wy $D4,Y                 ; 4
    sec                          ; 2
    sbc    #$10                  ; 2
    sta.wy $D4,Y                 ; 5
    ldy    #$0B                  ; 2
    jsr    L3D70                 ; 6
L30E9:
    lda    $E6                   ; 3
    lsr                          ; 2
    bcc    L3146                 ; 2³+1
    ldx    #0                    ; 2
    and    #$02                  ; 2
    bne    L30F6                 ; 2³
    stx    $BB                   ; 3
L30F6:
    stx    $E6                   ; 3
    stx    $BD                   ; 3
    ldy    #$0D                  ; 2
L30FC:
    stx    $80,Y                 ; 4
    dey                          ; 2
    bpl    L30FC                 ; 2³
    stx    $CE                   ; 3
    lda    $D6                   ; 3
    bne    L3109                 ; 2³
    ldx    #$70                  ; 2
L3109:
    stx    $BE                   ; 3
    lda    #$87                  ; 2
    sta    $9B                   ; 3
    ldy    $D6                   ; 3
    ldx    L3F1E,Y               ; 4
    lda    L3FAE,X               ; 4
    sta    $8E                   ; 3
    ldy    L3E96,X               ; 4
    lda    $E4                   ; 3
    lsr                          ; 2
    bcc    L3123                 ; 2³
    ldy    #$11                  ; 2
L3123:
    sty    $9A                   ; 3
    lda    $DF                   ; 3
    cmp    #$20                  ; 2
    bne    L312D                 ; 2³
    sty    $BB                   ; 3
L312D:
    jsr    L3D0A                 ; 6
    lda    #$80                  ; 2
    sta    $92                   ; 3
    lda    #$96                  ; 2
    sta    $E9                   ; 3
    lda    #$0F                  ; 2
    sta    $93                   ; 3
    lda    #$7E                  ; 2
    sta    $96                   ; 3
    lda    #8                    ; 2
    sta    $C6                   ; 3
    bpl    L316E                    ;  always branch

L3146:
    lsr                          ; 2
    bcc    L316E                 ; 2³
    lda    #$5E                  ; 2
    jsr    L3DDE                 ; 6
    lda    #$30                  ; 2
    sta    $C0                   ; 3
    ldx    #0                    ; 2
    stx    $C5                   ; 3
    stx    $80                   ; 3
    stx    $BD                   ; 3
    stx    $BE                   ; 3
    dex                          ; 2
    stx    $94                   ; 3
    lda    #$25                  ; 2
    sta    $9B                   ; 3
    lda    #$A8                  ; 2
    sta    $E9                   ; 3
    lda    #$80                  ; 2
    sta    $BF                   ; 3
    jmp    L3725                 ; 3
L316E:
    jsr    L3D13                 ; 6
    beq    L3176                 ; 2³
    jmp    L332D                 ; 3
L3176:
    bit    $E3                   ; 3
    bmi    L318D                 ; 2³
    lda    $CF                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    tax                          ; 2
    lda    L3E86,X               ; 4
    sta    $E7                   ; 3
    lda    #8                    ; 2
    sta    $C6                   ; 3
    bpl    L31B3                    ;  always branch

L318D:
    bvc    L31A2                 ; 2³
    ldy    #0                    ; 2
    lda    $CF                   ; 3
    beq    L319D                 ; 2³
    bmi    L319B                 ; 2³
    ldy    #$FE                  ; 2
    bmi    L319D                    ;  always branch

L319B:
    ldy    #2                    ; 2
L319D:
    sty    $E7                   ; 3
    jmp    L31B8                 ; 3
L31A2:
    lda    $CF                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    tax                          ; 2
    lda    L3E7E,X               ; 4
    sta    $E7                   ; 3
    lda    #0                    ; 2
    sta    $C6                   ; 3
L31B3:
    ldy    #8                    ; 2
    jsr    L3D7C                 ; 6
L31B8:
    lda    $E7                   ; 3
    jsr    L3D47                 ; 6
    adc    $CF                   ; 3
    sta    $CF                   ; 3
    lda    $E3                   ; 3
    asl                          ; 2
    asl                          ; 2
    sta    $E7                   ; 3
    bit    $E6                   ; 3
    bpl    L31CE                 ; 2³
    jmp    L3263                 ; 3
L31CE:
    bit    $BD                   ; 3
    bmi    L3220                 ; 2³+1
    bit    $E7                   ; 3
    bmi    L3211                 ; 2³+1
    bit    $92                   ; 3
    bpl    L31E5                 ; 2³
    lda    $93                   ; 3
    clc                          ; 2
    adc    #$16                  ; 2
    cmp    $C2                   ; 3
    bcs    L31EE                 ; 2³
    bcc    L31EC                    ;  always branch

L31E5:
    ldx    $C2                   ; 3
    inx                          ; 2
    cpx    $93                   ; 3
    bcc    L31F1                 ; 2³
L31EC:
    dec    $C2                   ; 5
L31EE:
    jmp    L3260                 ; 3
L31F1:
    lda    $8C                   ; 3
    cmp    #4                    ; 2
    bne    L31EE                 ; 2³
    lda    $C1                   ; 3
    sbc    #$79                  ; 2
    cmp    #3                    ; 2
    bcs    L31EE                 ; 2³
    lda    #$7A                  ; 2
    sta    $C1                   ; 3
    ldy    #$0F                  ; 2
    jsr    L3D70                 ; 6
    lda    #$80                  ; 2
    sta    $BD                   ; 3
    asl                          ; 2
    sta    $CF                   ; 3
    bpl    L3260                    ;  always branch

L3211:
    bit    $E7                   ; 3
    bvs    L31EE                 ; 2³+1
    ldx    $C2                   ; 3
    inx                          ; 2
    cpx    #$80                  ; 2
    bcs    L31EE                 ; 2³+1
    stx    $C2                   ; 3
    bne    L3260                 ; 2³

L3220:
    lda    #0                    ; 2
    sta    $CF                   ; 3
    lda    $E9                   ; 3
    cmp    #3                    ; 2
    bcc    L3242                 ; 2³
    dec    $E9                   ; 5
    dec    $E9                   ; 5
    inc    $93                   ; 5
    inc    $93                   ; 5
    lda    $C2                   ; 3
    cmp    #$52                  ; 2
    beq    L3260                 ; 2³
    bcc    L323E                 ; 2³
    dec    $C2                   ; 5
    bne    L3260                    ;  always branch

L323E:
    inc    $C2                   ; 5
    bne    L3260                    ;  always branch

L3242:
    lda    #0                    ; 2
    sta    $BE                   ; 3
    lda    $88                   ; 3
    cmp    #$5F                  ; 2
    bcs    L3252                 ; 2³
    inc    $88                   ; 5
    inc    $88                   ; 5
    bne    L3260                    ;  always branch

L3252:
    lda    frameCounter
    and    #$03                  ; 2
    bne    L3260                 ; 2³
    dec    $8C                   ; 5
    bne    L3260                 ; 2³
    lda    #2                    ; 2
    sta    $E6                   ; 3
L3260:
    jmp    L332D                 ; 3

L3263:
    ldy    #0                    ; 2
    lda    $97                   ; 3
    cmp    $92                   ; 3
    bcs    L326E                 ; 2³
L326B:
    jmp    L32E5                 ; 3
L326E:
    ldx    $92                   ; 3
    lda    $8A,X                 ; 4
    clc                          ; 2
    adc    #7                    ; 2
    cmp    $C2                   ; 3
    bcc    L326B                 ; 2³
    bne    L3280                 ; 2³
    dey                          ; 2
    bit    $E7                   ; 3
    bmi    L32F4                 ; 2³
L3280:
    bit    $98                   ; 3
    bvc    L328D                 ; 2³
    lda    #$84                  ; 2
    sec                          ; 2
    sbc    $9B,X                 ; 4
    cmp    #4                    ; 2
    bcc    L3290                 ; 2³
L328D:
    jmp    L3304                 ; 3
L3290:
    lda    #0                    ; 2
    sta    $CF                   ; 3
    sta    $C4                   ; 3
    bit    $E7                   ; 3
    bmi    L32DD                 ; 2³
    ldx    #7                    ; 2
L329C:
    inc    $8A,X                 ; 6
    dex                          ; 2
    bpl    L329C                 ; 2³
    ldx    $92                   ; 3
    lda    $8A,X                 ; 4
    cmp    #$5E                  ; 2
    bne    L32E2                 ; 2³
    ldy    #$13                  ; 2
    jsr    L3D5F                 ; 6
    lda    $D6                   ; 3
    tax                          ; 2
    inx                          ; 2
    txa                          ; 2
    and    #$1F                  ; 2
    sta    $D6                   ; 3
    dex                          ; 2
    lda    L3F3E,X               ; 4
    bpl    L32C3                 ; 2³
    lda    #$81                  ; 2
    sta    $E6                   ; 3
    bne    L32E2                    ;  always branch

L32C3:
    ldx    $92                   ; 3
    lda    $9B,X                 ; 4
    sta    $9B                   ; 3
    lda    $81                   ; 3
    sta    $80                   ; 3
    lda    $8A,X                 ; 4
    jsr    L3DDE                 ; 6
    lda    #$8C                  ; 2
    sta    $82                   ; 3
    lda    #$18                  ; 2
    sta    $AB                   ; 3
    jmp    L3725                 ; 3

L32DD:
    bvs    L32E2                 ; 2³
    jsr    L3CE8                 ; 6
L32E2:
    jmp    L36A4                 ; 3

L32E5:
    bit    $E7                   ; 3
    bmi    L32F4                 ; 2³
    inc    $CA                   ; 5
    ldx    #7                    ; 2
L32ED:
    inc    $8A,X                 ; 6
    dex                          ; 2
    bpl    L32ED                 ; 2³
    bmi    L3301                 ; 3+1   always branch

L32F4:
    lda    $8A                   ; 3
    cmp    #$5B                  ; 2
    beq    L3307                 ; 2³+1
    bit    $E7                   ; 3
    bvs    L3304                 ; 2³+1
    jsr    L3CE8                 ; 6
L3301:
    jmp    L3559                 ; 3
L3304:
    tya                          ; 2
    beq    L3301                 ; 2³
L3307:
    bit    $98                   ; 3
    bvs    L3301                 ; 2³
    ldy    #$99                  ; 2
    tya                          ; 2
    jsr    L3D98                 ; 6
    ldy    #$15                  ; 2
    jsr    L3D70                 ; 6
    bne    L3301                    ;  always branch

L3318:
    .byte $7F ; | XXXXXXX| $3318
    .byte $3F ; |  XXXXXX| $3319
    .byte $1F ; |   XXXXX| $331A
    .byte $0F ; |    XXXX| $331B
    .byte $0F ; |    XXXX| $331C
    .byte $0F ; |    XXXX| $331D
    .byte $0F ; |    XXXX| $331E
    .byte $0F ; |    XXXX| $331F
L3320:
    .byte $06 ; |     XX | $3320
    .byte $08 ; |    X   | $3321
    .byte $0A ; |    X X | $3322
    .byte $0C ; |    XX  | $3323
    .byte $0E ; |    XXX | $3324
    .byte $10 ; |   X    | $3325
    .byte $12 ; |   X  X | $3326
    .byte $13 ; |   X  XX| $3327
    .byte $14 ; |   X X  | $3328
    .byte $15 ; |   X X X| $3329
    .byte $16 ; |   X XX | $332A
    .byte $17 ; |   X XXX| $332B
    .byte $18 ; |   XX   | $332C

L332D:
    bit    $E6                   ; 3
    bmi    L3301                 ; 2³
    lda    $CF                   ; 3
    jsr    L3D47                 ; 6
    adc    $C1                   ; 3
    cmp    #$36                  ; 2
    bcs    L3340                 ; 2³
    lda    #$36                  ; 2
    bne    L3346                    ;  always branch

L3340:
    cmp    #$BE                  ; 2
    bcc    L334A                 ; 2³
    lda    #$BE                  ; 2
L3346:
    ldx    #0                    ; 2
    stx    $CF                   ; 3
L334A:
    sta    $C1                   ; 3
    lda    $92                   ; 3
    bmi    L33C6                 ; 2³
    lda    $99                   ; 3
    beq    L3360                 ; 2³
    lda    #$10                  ; 2
    sta    $98                   ; 3
    lda    $E2                   ; 3
    sta    $97                   ; 3
    dec    $99                   ; 5
    bpl    L33B3                 ; 2³
L3360:
    lda    #$0C                  ; 2
    sta    $97                   ; 3
    ldx    #$4C                  ; 2
    cpx    $87                   ; 3
    beq    L33C3                 ; 2³
    ldy    #$31                  ; 2
    lda    frameCounter
    and    #$02                  ; 2
    beq    L3374                 ; 2³
    ldy    #$3A                  ; 2
L3374:
    sty    $87                   ; 3
    lda    $DF                   ; 3
    beq    L3388                 ; 2³
    bit    $89                   ; 3
    bmi    L3388                 ; 2³
    bvc    L33B3                 ; 2³
    inc    $CE                   ; 5
    lda    #0                    ; 2
    sta    $C4                   ; 3
    bpl    L33B3                    ;  always branch

L3388:
    lda    $CD                   ; 3
    bne    L33B3                 ; 2³
    ldy    #$15                  ; 2
    jsr    L3D5F                 ; 6
    inc    $8C                   ; 5
    lda    $8C                   ; 3
    cmp    #4                    ; 2
    bne    L33B3                 ; 2³
    stx    $87                   ; 3
    lda    $D8                   ; 3
    and    #$0F                  ; 2
    cmp    #8                    ; 2
    bcs    L33A5                 ; 2³
    inc    $D8                   ; 5
L33A5:
    ldy    #$10                  ; 2
    lda    #0                    ; 2
    jsr    L3D9C                 ; 6
    ldy    #$0D                  ; 2
    jsr    L3D5F                 ; 6
    bne    L33C3                    ;  always branch

L33B3:
    lda    $D8                   ; 3
    cmp    #2                    ; 2
    bne    L33C3                 ; 2³
    lda    $CE                   ; 3
    cmp    #$21                  ; 2
    bne    L33C3                 ; 2³
    lda    #$28                  ; 2
    sta    $87                   ; 3
L33C3:
    jmp    L3725                 ; 3

L33C6:
    lda    $80                   ; 3
    beq    L33D4                 ; 2³
    cmp    #$20                  ; 2
    bcs    L33D1                 ; 2³
    jmp    L34FA                 ; 3
L33D1:
    jmp    L345E                 ; 3
L33D4:
    jsr    L3D13                 ; 6
    beq    L33DC                 ; 2³
    jmp    L34BE                 ; 3
L33DC:
    lda    $BB                   ; 3
    cmp    $9A                   ; 3
    bcc    L3426                 ; 2³+1
    lda    $8D                   ; 3
    bmi    L33EA                 ; 2³
    cmp    #$20                  ; 2
    bcs    L33EC                 ; 2³
L33EA:
    inc    $8D                   ; 5
L33EC:
    jsr    L3D47                 ; 6
    adc    $9B                   ; 3
    cmp    #$E6                  ; 2
    bcs    L33F8                 ; 2³
    jmp    L353F                 ; 3
L33F8:
    ldx    #0                    ; 2
    stx    $92                   ; 3
    lda    $93                   ; 3
    adc    #2                    ; 2
    sta    $93                   ; 3
    lda    $E9                   ; 3
    sbc    #2                    ; 2
    sta    $E9                   ; 3
    lda    $96                   ; 3
    sbc    #3                    ; 2
    sta    $96                   ; 3
    lda    $E2                   ; 3
    and    #$1F                  ; 2
    adc    #$67                  ; 2
    sta    $8A                   ; 3
    lda    #$31                  ; 2
    sta    $87                   ; 3
    lda    #$80                  ; 2
    sta    $99                   ; 3
    ldy    #$14                  ; 2
    jsr    L3D5F                 ; 6
    jmp    L3725                 ; 3

L3426:
    inc    $86                   ; 5
    lda    #$20                  ; 2
    cmp    $83                   ; 3
    bne    L345B                 ; 2³
    cmp    $84                   ; 3
    bne    L345B                 ; 2³
    lda    #$12                  ; 2
    sta    $85                   ; 3
    ldy    #7                    ; 2
    jsr    L3D68                 ; 6
    ldy    $D6                   ; 3
    ldx    L3F1E,Y               ; 4
    lda    L3FA6,X               ; 4
    sta    $80                   ; 3
    lda    $9B                   ; 3
    sec                          ; 2
    sbc    #4                    ; 2
    sta    $8A                   ; 3
    lda    #$F8                  ; 2
    sta    $8B                   ; 3
L3450:
    lda    $C1                   ; 3
    sta    $94                   ; 3
    lda    $C2                   ; 3
    sec                          ; 2
    sbc    #$24                  ; 2
    sta    $95                   ; 3
L345B:
    jmp    L34BE                 ; 3

L345E:
    lda    $85                   ; 3
    cmp    #8                    ; 2
    bcc    L3477                 ; 2³
    lda    $9B                   ; 3
    sbc    #4                    ; 2
    sta    $8A                   ; 3
    inc    $8B                   ; 5
    lda    #8                    ; 2
    sta    $82                   ; 3
    lda    $8D                   ; 3
    sta    $81                   ; 3
    jmp    L3530                 ; 3
L3477:
    lda    frameCounter
    ldy    $D6                   ; 3
    ldx    L3F1E,Y               ; 4
    and    L3318,X               ; 4
    beq    L3450                 ; 2³
    lda    $BB                   ; 3
    lsr                          ; 2
    tax                          ; 2
    lda    L3320,X               ; 4
    sta    $E7                   ; 3
    eor    #$FF                  ; 2
    tay                          ; 2
    iny                          ; 2
    sty    $F7                   ; 3
    ldy    #1                    ; 2
L3494:
    lda.wy $8A,Y                 ; 4
    cmp.wy $94,Y                 ; 4
    bcc    L34AA                 ; 2³
    ldx    $81,Y                 ; 4
    dex                          ; 2
    bpl    L34A5                 ; 2³
    cpx    $F7                   ; 3
    bcc    L34BB                 ; 2³
L34A5:
    stx    $81,Y                 ; 4
    jmp    L34BB                 ; 3
L34AA:
    lda    $E2                   ; 3
    and    #$0F                  ; 2
    beq    L34BB                 ; 2³
    ldx    $81,Y                 ; 4
    inx                          ; 2
    bmi    L34B9                 ; 2³
    cpx    $E7                   ; 3
    bcs    L34BB                 ; 2³
L34B9:
    stx    $81,Y                 ; 4
L34BB:
    dey                          ; 2
    bpl    L3494                 ; 2³

L34BE:
    ldx    #1                    ; 2
L34C0:
    lda    $81,X                 ; 4
    jsr    L3D47                 ; 6
    adc    $8A,X                 ; 4
    sta    $8A,X                 ; 4
    dex                          ; 2
    bpl    L34C0                 ; 2³
    ldx    $8A                   ; 3
    cpx    #$37                  ; 2
    bcs    L34D6                 ; 2³
    ldx    #$37                  ; 2
    bne    L34DC                    ;  always branch

L34D6:
    cpx    #$C7                  ; 2
    bcc    L34E2                 ; 2³
    ldx    #$C7                  ; 2
L34DC:
    lda    $81                   ; 3
    eor    #$FF                  ; 2
    sta    $81                   ; 3
L34E2:
    stx    $8A                   ; 3
    ldx    $8B                   ; 3
    cpx    #$5F                  ; 2
    bcc    L34FA                 ; 2³
    lda    $82                   ; 3
    eor    #$FF                  ; 2
    sta    $82                   ; 3
    lda    #$5F                  ; 2
    cpx    #$D8                  ; 2
    bcc    L34F8                 ; 2³
    lda    #0                    ; 2
L34F8:
    sta    $8B                   ; 3
L34FA:
    lda    $E2                   ; 3
    asl                          ; 2
    and    #$F0                  ; 2
    bne    L3505                 ; 2³
    bcc    L352E                 ; 2³
    bcs    L351A                    ;  always branch

L3505:
    lda    $C1                   ; 3
    cmp    #$87                  ; 2
    bcc    L351F                 ; 2³
    lda    $9B                   ; 3
    cmp    #$97                  ; 2
    bcs    L3513                 ; 2³
    inc    $8D                   ; 5
L3513:
    clc                          ; 2
    adc    #$18                  ; 2
    cmp    $C1                   ; 3
    bcc    L3530                 ; 2³
L351A:
    dec    $8D                   ; 5
    jmp    L3530                 ; 3
L351F:
    lda    $9B                   ; 3
    cmp    #$77                  ; 2
    bcc    L3527                 ; 2³
    dec    $8D                   ; 5
L3527:
    sec                          ; 2
    sbc    #$18                  ; 2
    cmp    $C1                   ; 3
    bcs    L3530                 ; 2³
L352E:
    inc    $8D                   ; 5
L3530:
    lda    $8D                   ; 3
    jsr    L3D47                 ; 6
    adc    $9B                   ; 3
    cmp    #$C0                  ; 2
    bcc    L353F                 ; 2³
    lda    #$C0                  ; 2
    bne    L3545                    ;  always branch

L353F:
    cmp    #$46                  ; 2
    bcs    L3549                 ; 2³
    lda    #$46                  ; 2
L3545:
    ldx    #0                    ; 2
    stx    $8D                   ; 3
L3549:
    sta    $9B                   ; 3
    clc                          ; 2
    adc    #8                    ; 2
    sta    $9C                   ; 3
    lda    #$20                  ; 2
    sta    $AB                   ; 3
    sta    $AC                   ; 3
    jmp    L3725                 ; 3

L3559:
    ldy    $D6                   ; 3
    lda    L3F3E,Y               ; 4
    and    #$20                  ; 2
    beq    L359F                 ; 2³
    lda    $C9                   ; 3
    beq    L359F                 ; 2³
    bit    $98                   ; 3
    bmi    L359F                 ; 2³
    ldx    $CD                   ; 3
    beq    L359F                 ; 2³
    cpx    $92                   ; 3
    bcs    L359F                 ; 2³
    cpx    $9A                   ; 3
    beq    L359F                 ; 2³
    lda    $82,X                 ; 4
    beq    L359F                 ; 2³
    lda    $9B,X                 ; 4
    cmp    #$37                  ; 2
    bcs    L3586                 ; 2³
    lda    $B3,X                 ; 4
    bmi    L358E                 ; 2³
    bpl    L359F                    ;  always branch

L3586:
    cmp    #$C6                  ; 2
    bcc    L359F                 ; 2³
    lda    $B3,X                 ; 4
    bmi    L359F                 ; 2³
L358E:
    ldy    $E2                   ; 3
    cpy    #$C0                  ; 2
    bcs    L359F                 ; 2³
    eor    #$FF                  ; 2
    tay                          ; 2
    iny                          ; 2
    sty    $B3,X                 ; 4
    ldy    #$16                  ; 2
    jsr    L3D70                 ; 6
L359F:
    lda    #$7A                  ; 2
    sta    $C1                   ; 3
    lda    #$52                  ; 2
    sta    $C2                   ; 3
    lda    $CF                   ; 3
    eor    #$FF                  ; 2
    tax                          ; 2
    inx                          ; 2
    stx    $F7                   ; 3
    ldx    $92                   ; 3
L35B1:
    lda    #0                    ; 2
    bpl    L35B7                    ;  always branch

L35B5:
    lda    $B3,X                 ; 4
L35B7:
    ldy    $C9                   ; 3
    bne    L35BC                 ; 2³
    asl                          ; 2
L35BC:
    clc                          ; 2
    adc    $F7                   ; 3
    jsr    L3D47                 ; 6
    adc    $9B,X                 ; 4
    sta    $9B,X                 ; 4
    cmp    #8                    ; 2
    bcc    L35F5                 ; 2³
    cmp    #$F8                  ; 2
    bcs    L35D1                 ; 2³
    jmp    L3684                 ; 3
L35D1:
    ldy    #0                    ; 2
    txa                          ; 2
    beq    L35DE                 ; 2³
    iny                          ; 2
    cpx    $92                   ; 3
    beq    L35DE                 ; 2³
    jmp    L366C                 ; 3
L35DE:
    lda.wy $80,Y                 ; 4
    clc                          ; 2
    adc    #1                    ; 2
    and    #$03                  ; 2
    sta.wy $80,Y                 ; 5
    tay                          ; 2
    lda    L3E8E,Y               ; 4
    sta    $AB,X                 ; 4
    lda    #$12                  ; 2
    sta    $9B,X                 ; 4
    bne    L3614                 ; 3+1   always branch

L35F5:
    ldy    #0                    ; 2
    txa                          ; 2
    beq    L35FF                 ; 2³
    iny                          ; 2
    cpx    $92                   ; 3
    bne    L366C                 ; 2³+1
L35FF:
    lda.wy $80,Y                 ; 4
    sec                          ; 2
    sbc    #1                    ; 2
    and    #$03                  ; 2
    sta.wy $80,Y                 ; 5
    tay                          ; 2
    lda    L3E8E,Y               ; 4
    sta    $AB,X                 ; 4
    lda    #$F4                  ; 2
    sta    $9B,X                 ; 4
L3614:
    bit    $98                   ; 3
    bpl    L365D                 ; 2³
    cpx    $92                   ; 3
    bne    L365D                 ; 2³
    lda    $81                   ; 3
    beq    L3631                 ; 2³
    lda    #$80                  ; 2
    sta    $98                   ; 3
    asl                          ; 2
    ldy    #1                    ; 2
L3627:
    sta.wy $82,Y                 ; 5
    iny                          ; 2
    cpy    $92                   ; 3
    bne    L3627                 ; 2³
    beq    L365D                    ;  always branch

L3631:
    lda    #$90                  ; 2
    sta    $82,X                 ; 4
    lda    #$18                  ; 2
    sta    $AB,X                 ; 4
    lda    #$C0                  ; 2
    sta    $98                   ; 3
    ldy    $D6                   ; 3
    lda    L3EBE,Y               ; 4
    and    #$07                  ; 2
    beq    L3684                 ; 2³
    tay                          ; 2
L3647:
    lda    #0                    ; 2
    sta.wy $B3,Y                 ; 5
    lda    #8                    ; 2
    sta.wy $AB,Y                 ; 5
    lda    #1                    ; 2
    sta.wy $82,Y                 ; 5
    iny                          ; 2
    cpy    $92                   ; 3
    bne    L3647                 ; 2³
    beq    L3684                    ;  always branch

L365D:
    ldy    $D6                   ; 3
    lda    L3F1E,Y               ; 4
    lsr                          ; 2
    tay                          ; 2
    lda    L3E92,Y               ; 4
    sta    $82,X                 ; 4
    jmp    L3684                 ; 3

L366C:
    lda    $82,X                 ; 4
    beq    L3684                 ; 2³
    bit    $98                   ; 3
    bmi    L3684                 ; 2³
    lda    #0                    ; 2
    sta    $82,X                 ; 4
    dec    $95                   ; 5
    inc    $BB                   ; 5
    cpx    $9A                   ; 3
    bne    L3684                 ; 2³
    lda    #$0F                  ; 2
    sta    $9A                   ; 3
L3684:
    dex                          ; 2
    bne    L368A                 ; 2³
    jmp    L35B1                 ; 3
L368A:
    bmi    L368F                 ; 2³
    jmp    L35B5                 ; 3
L368F:
    bit    $98                   ; 3
    bpl    L36A4                 ; 2³
    ldx    $92                   ; 3
    lda    $9B,X                 ; 4
    clc                          ; 2
    adc    #$0C                  ; 2
    ldy    #1                    ; 2
L369C:
    sta.wy $9B,Y                 ; 5
    iny                          ; 2
    cpy    $92                   ; 3
    bne    L369C                 ; 2³
L36A4:
    lda    $99                   ; 3
    beq    L3725                 ; 2³+1
    and    #$07                  ; 2
    tax                          ; 2
    ldy    $D6                   ; 3
    lda    L3F3E,Y               ; 4
    and    #$10                  ; 2
    beq    L36BB                 ; 2³
    lda    frameCounter
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    bpl    L36BE                    ;  always branch

L36BB:
    lda    L3F3E,Y               ; 4
L36BE:
    and    #$03                  ; 2
    tay                          ; 2
    lda    $82,X                 ; 4
    bne    L36C6                 ; 2³
    iny                          ; 2
L36C6:
    sty    $F7                   ; 3
    lda    $99                   ; 3
    bmi    L36F2                 ; 2³
    tax                          ; 2
    cpx    $9A                   ; 3
    bne    L36D4                 ; 2³
    dex                          ; 2
    bpl    L36E8                 ; 2³
L36D4:
    lda    $8A,X                 ; 4
    clc                          ; 2
    adc    $F7                   ; 3
    sta    $E7                   ; 3
    dex                          ; 2
    lda    $8A,X                 ; 4
    sec                          ; 2
    sbc    $E7                   ; 3
    cmp    #$0F                  ; 2
    bcc    L36E8                 ; 2³
    inx                          ; 2
    bpl    L3711                 ; 2³+1
L36E8:
    txa                          ; 2
    bne    L36ED                 ; 2³
    ldx    #$81                  ; 2
L36ED:
    stx    $99                   ; 3
    jmp    L3725                 ; 3
L36F2:
    and    #$07                  ; 2
    tax                          ; 2
    cpx    $9A                   ; 3
    bne    L36FC                 ; 2³
    inx                          ; 2
    bpl    L3718                 ; 3+1   always branch

L36FC:
    lda    $8A,X                 ; 4
    sec                          ; 2
    sbc    $F7                   ; 3
    sta    $E7                   ; 3
    inx                          ; 2
    lda    #$F0                  ; 2
    cmp    $8A,X                 ; 4
    lda    $E7                   ; 3
    sbc    $8A,X                 ; 4
    cmp    #$0F                  ; 2
    bcc    L3718                 ; 2³
    dex                          ; 2
L3711:
    lda    $E7                   ; 3
    sta    $8A,X                 ; 4
    jmp    L3725                 ; 3
L3718:
    cpx    $92                   ; 3
    bne    L371F                 ; 2³
    dex                          ; 2
    bpl    L3723                 ; 2³
L371F:
    txa                          ; 2
    ora    #$80                  ; 2
    tax                          ; 2
L3723:
    stx    $99                   ; 3
L3725:
    bit    TIMINT                ; 4
    bpl    L3725                 ; 2³
    bmi    L374E                    ;  always branch

L372C:
    sei                          ; 2
    cld                          ; 2
    lda    #0                    ; 2
    tax                          ; 2
.loopClear:
    sta    0,X                   ; 4
    txs                          ; 2
    inx                          ; 2
    bne    .loopClear            ; 2³

    stx    $89                   ; 3   #0
    inx                          ; 2
    stx    $E6                   ; 3   #1
    lda    #$FE                  ; 2
    sta    $E3                   ; 3
    sta    $E2                   ; 3
    lda    #$CB                  ; 2
    sta    $D0                   ; 3
    lda    #$ED                  ; 2
    sta    $D2                   ; 3
    lda    #$AF                  ; 2
    sta    $D4                   ; 3
L374E:
    ldx    #3                    ; 2
    stx    VBLANK                ; 3
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    VSYNC                 ; 3   Vsync starts

.loopVsync:
    stx    WSYNC                 ; 3   three scanlines for Vsync
;---------------------------------------
    dex                          ; 2
    bne    .loopVsync            ; 2³

    stx    VSYNC                 ; 3   Vsync ends
    lda    #TIME_VBLANK          ; 2
    sta    TIM64T                ; 4
    bit    $E6                   ; 3
    bpl    L37C7                 ; 2³
    jsr    L3D13                 ; 6
    bne    L37C7                 ; 2³
    ldy    $D6                   ; 3
    lda    L3EBE,Y               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $E7                   ; 3
    ldy    $95                   ; 3
    cpy    $E7                   ; 3
    bcs    L37C7                 ; 2³
    lda    $BB                   ; 3
    bne    L37CA                 ; 2³
    tya                          ; 2
    bne    L37C7                 ; 2³
    bit    $98                   ; 3
    bmi    L37C7                 ; 2³
    lda    #$80                  ; 2
    sta    $98                   ; 3
    ldx    $92                   ; 3
    lda    $8A,X                 ; 4
L378F:
    dex                          ; 2
    clc                          ; 2
    adc    #$11                  ; 2
    sta    $8A,X                 ; 4
    cpx    #1                    ; 2
    bne    L378F                 ; 2³
    ldy    #0                    ; 2
    ldx    $D6                   ; 3
    lda    L3F3E,X               ; 4
    and    #$08                  ; 2
    beq    L37A5                 ; 2³
    iny                          ; 2
L37A5:
    sty    $99                   ; 3
    ldy    #$12                  ; 2
    jsr    L3D5F                 ; 6
    bit    $BC                   ; 3
    bmi    L37C7                 ; 2³
    lda    $E3                   ; 3
    and    #$01                  ; 2
    tay                          ; 2
    lda.wy $D4,Y                 ; 4
    clc                          ; 2
    adc    #$10                  ; 2
    cmp    #$7F                  ; 2
    bcs    L37C7                 ; 2³
    sta.wy $D4,Y                 ; 5
    ldy    #9                    ; 2
    jsr    L3D5F                 ; 6
L37C7:
    jmp    L3846                 ; 3

L37CA:
    ldy    $D6                   ; 3
    lda    L3F3E,Y               ; 4
    bmi    L37D7                 ; 2³
    lda    frameCounter
    and    #$0F                  ; 2
    bne    L3846                 ; 2³+1
L37D7:
    lda    $E2                   ; 3
    and    #$07                  ; 2
    tax                          ; 2
    beq    L3846                 ; 2³+1
    cpx    $92                   ; 3
    bcs    L3846                 ; 2³+1
    lda    $82,X                 ; 4
    bne    L3846                 ; 2³+1
    lda    $C5                   ; 3
    and    #$07                  ; 2
    sta    $E7                   ; 3
    cpx    $E7                   ; 3
    beq    L3846                 ; 2³+1
    ldy    $D6                   ; 3
    cpy    #3                    ; 2
    bcc    L3807                 ; 2³+1
    lda    L3F3E,Y               ; 4
    bmi    L3807                 ; 2³+1
    lda    $BB                   ; 3
    cmp    #8                    ; 2
    bne    L3807                 ; 2³
    lda    $9A                   ; 3
    bne    L3807                 ; 2³
    stx    $9A                   ; 3
L3807:
    inc    $95                   ; 5
    dec    $BB                   ; 5
    lda    $E2                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    sta    $E7                   ; 3
    ldy    $D6                   ; 3
    lda    L3EFE,Y               ; 4
    and    #$0F                  ; 2
    adc    $E7                   ; 3
    sta    $E7                   ; 3
    lda    $CF                   ; 3
    bmi    L382A                 ; 2³
    bne    L3832                 ; 2³
    lda    $E2                   ; 3
    asl                          ; 2
    bcs    L3832                 ; 2³
L382A:
    lda    #$0A                  ; 2
    sta    $9B,X                 ; 4
    lda    $E7                   ; 3
    bpl    L383D                 ; 2³
L3832:
    lda    #$F4                  ; 2
    sta    $9B,X                 ; 4
    lda    $E7                   ; 3
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #1                    ; 2
L383D:
    sta    $B3,X                 ; 4
    lda    L3F5E,Y               ; 4
    and    #$7F                  ; 2
    sta    $82,X                 ; 4
L3846:
    lda    $C1                   ; 3
    jsr    L3D1C                 ; 6
    sta    $C8                   ; 3
    ldx    $92                   ; 3
    bit    $E6                   ; 3
    bmi    L385C                 ; 2³
    lda    $8A                   ; 3
    jsr    L3D1C                 ; 6
    sta    $8F                   ; 3
    ldx    #1                    ; 2
L385C:
    lda    $AB,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    $9B,X                 ; 4
    cmp    L3FCA,Y               ; 4
    bcc    L3871                 ; 2³
    sbc    L3FE7,Y               ; 4
    sta    $F6                   ; 3
    jmp    L38A0                 ; 3

L3871:
    cmp    L3FCF,Y               ; 4
    bcc    L3880                 ; 2³
    sbc    L3FEC,Y               ; 4
    sta    $F6                   ; 3
    lda    L3FF1,Y               ; 4
    bpl    L38A2                    ;  always branch

L3880:
    cmp    L3FD4,Y               ; 4
    bcc    L388F                 ; 2³
    sbc    L3FDA,Y               ; 4
    sta    $F6                   ; 3
    lda    L3FE0,Y               ; 4
    bpl    L38A2                    ;  always branch

L388F:
    cmp    L3FD7,Y               ; 4
    bcc    L389E                 ; 2³
    sbc    L3FDD,Y               ; 4
    sta    $F6                   ; 3
    lda    L3FE3,Y               ; 4
    bpl    L38A2                    ;  always branch

L389E:
    sta    $F6                   ; 3
L38A0:
    lda    #0                    ; 2
L38A2:
    eor    $AB,X                 ; 4
    and    #$07                  ; 2
    eor    $AB,X                 ; 4
    sta    $AB,X                 ; 4
    lda    $F6                   ; 3
    jsr    L3D1C                 ; 6
    sta    $A3,X                 ; 4
    dex                          ; 2
    bpl    L385C                 ; 2³
    lda    #$0A                  ; 2
    sta    $F7                   ; 3
    bit    $E6                   ; 3
    bmi    L38C3                 ; 2³
    lda    #7                    ; 2
    sta    $F7                   ; 3
L38C0:
    jmp    L3A5F                 ; 3
L38C3:
    lda    frameCounter
    lsr                          ; 2
    bcs    L38C0                 ; 2³
    bit    $98                   ; 3
    bmi    L38D2                 ; 2³
    jmp    L3977                 ; 3

L38CF:
    .byte $07 ; |     XXX| $38CF
    .byte $0F ; |    XXXX| $38D0
    .byte $1F ; |   XXXXX| $38D1

L38D2:
    lda    $D6                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    and    #$18                  ; 2
    sta    $E7                   ; 3
    lda    $BC                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$03                  ; 2
    tax                          ; 2
    lda    L38CF,X               ; 4
    sta    $F6                   ; 3
    lda    frameCounter
    lsr                          ; 2
    lsr                          ; 2
L38EC:
    lsr                          ; 2
    dex                          ; 2
    bpl    L38EC                 ; 2³
    and    #$07                  ; 2
    ora    $E7                   ; 3
    tax                          ; 2
    lda    L3957,X               ; 4
    tax                          ; 2
    cpx    $92                   ; 3
    bcs    L392B                 ; 2³+1
    ldy    $D6                   ; 3
    lda    L3EBE,Y               ; 4
    and    #$07                  ; 2
    beq    L392B                 ; 2³
    sta    $F7                   ; 3
    cpx    $F7                   ; 3
    bcc    L392B                 ; 2³
    lda    $8A,X                 ; 4
    clc                          ; 2
    adc    #4                    ; 2
    sta    $CA                   ; 3
    lda    frameCounter
    and    #$02                  ; 2
    bne    L3921                 ; 2³
    lda    $9B,X                 ; 4
    sec                          ; 2
    sbc    #$0B                  ; 2
    jmp    L3926                 ; 3
L3921:
    lda    $9B,X                 ; 4
    sec                          ; 2
    sbc    #$13                  ; 2
L3926:
    sta    $C0                   ; 3
    jmp    L3931                 ; 3
L392B:
    lda    #$30                  ; 2
    sta    $C0                   ; 3
    bne    L3952                    ;  always branch

L3931:
    lda    frameCounter
    and    $F6                   ; 3
    bne    L3942                 ; 2³
    ldy    #$0A                  ; 2
    jsr    L3D70                 ; 6
    ldy    #$99                  ; 2
    tya                          ; 2
    jsr    L3D98                 ; 6
L3942:
    bit    $98                   ; 3
    bvc    L392B                 ; 2³
    ldx    $92                   ; 3
    lda    $9B,X                 ; 4
    cmp    #$D7                  ; 2
    bcs    L392B                 ; 2³
    cmp    #$2F                  ; 2
    bcc    L392B                 ; 2³
L3952:
    lda    #$35                  ; 2
    jmp    L3A49                 ; 3

L3957:
    .byte $02 ; |      X | $3957
    .byte $03 ; |      XX| $3958
    .byte $04 ; |     X  | $3959
    .byte $05 ; |     X X| $395A
    .byte $06 ; |     XX | $395B
    .byte $03 ; |      XX| $395C
    .byte $05 ; |     X X| $395D
    .byte $04 ; |     X  | $395E
    .byte $02 ; |      X | $395F
    .byte $03 ; |      XX| $3960
    .byte $07 ; |     XXX| $3961
    .byte $04 ; |     X  | $3962
    .byte $02 ; |      X | $3963
    .byte $05 ; |     X X| $3964
    .byte $02 ; |      X | $3965
    .byte $06 ; |     XX | $3966
    .byte $02 ; |      X | $3967
    .byte $04 ; |     X  | $3968
    .byte $03 ; |      XX| $3969
    .byte $05 ; |     X X| $396A
    .byte $06 ; |     XX | $396B
    .byte $02 ; |      X | $396C
    .byte $04 ; |     X  | $396D
    .byte $03 ; |      XX| $396E
    .byte $03 ; |      XX| $396F
    .byte $02 ; |      X | $3970
    .byte $04 ; |     X  | $3971
    .byte $05 ; |     X X| $3972
    .byte $03 ; |      XX| $3973
    .byte $02 ; |      X | $3974
    .byte $04 ; |     X  | $3975
    .byte $06 ; |     XX | $3976

L3977:
    jsr    L3D13                 ; 6
    beq    L397F                 ; 2³
L397C:
    jmp    L3A0E                 ; 3
L397F:
    lda    frameCounter
    lsr                          ; 2
    and    #$07                  ; 2
    beq    L397C                 ; 2³
    cmp    $92                   ; 3
    bcs    L397C                 ; 2³
    tax                          ; 2
    cpx    $9A                   ; 3
    beq    L39B3                 ; 2³
    lda    $82,X                 ; 4
    and    #$03                  ; 2
    beq    L39B3                 ; 2³
    lda    $8A,X                 ; 4
    cmp    #$4A                  ; 2
    bcc    L39B3                 ; 2³
    cmp    #$5F                  ; 2
    bcs    L39B3                 ; 2³
    lda    $B3,X                 ; 4
    bmi    L39A9                 ; 2³
    lda    $9B,X                 ; 4
    cmp    $C1                   ; 3
    bcc    L39B6                 ; 2³
L39A9:
    lda    $B3,X                 ; 4
    bpl    L39B3                 ; 2³
    lda    $9B,X                 ; 4
    cmp    $C1                   ; 3
    bcs    L39D6                 ; 2³
L39B3:
    jmp    L3A0E                 ; 3
L39B6:
    ldy    #5                    ; 2
    jsr    L3D70                 ; 6
    lda    $9B,X                 ; 4
    cmp    #$37                  ; 2
    bcc    L397C                 ; 2³
    bit    $C5                   ; 3
    bmi    L397C                 ; 2³
    lda    $9B,X                 ; 4
    clc                          ; 2
    adc    #8                    ; 2
    sta    $C0                   ; 3
    lda    $B3,X                 ; 4
    clc                          ; 2
    adc    #$30                  ; 2
    sta    $C3                   ; 3
    jmp    L39F3                 ; 3
L39D6:
    ldy    #5                    ; 2
    jsr    L3D70                 ; 6
    lda    $9B,X                 ; 4
    cmp    #$C7                  ; 2
    bcs    L397C                 ; 2³
    bit    $C5                   ; 3
    bmi    L397C                 ; 2³
    lda    $9B,X                 ; 4
    sec                          ; 2
    sbc    #4                    ; 2
    sta    $C0                   ; 3
    lda    $B3,X                 ; 4
    sec                          ; 2
    sbc    #$30                  ; 2
    sta    $C3                   ; 3
L39F3:
    ldy    $D6                   ; 3
    lda    L3F3E,Y               ; 4
    asl                          ; 2
    bmi    L3A3F                 ; 2³+1
    ldy    #4                    ; 2
    jsr    L3D70                 ; 6
    lda    $8A,X                 ; 4
    clc                          ; 2
    adc    #4                    ; 2
    sta    $CA                   ; 3
    txa                          ; 2
    ora    #$80                  ; 2
    sta    $C5                   ; 3
    bmi    L3A47                    ;  always branch

L3A0E:
    bit    $C5                   ; 3
    bpl    L3A47                 ; 2³
    ldy    $D6                   ; 3
    lda    L3F3E,Y               ; 4
    and    #$04                  ; 2
    beq    L3A27                 ; 2³
    lda    $C5                   ; 3
    and    #$07                  ; 2
    tax                          ; 2
    lda    $8A,X                 ; 4
    clc                          ; 2
    adc    #4                    ; 2
    sta    $CA                   ; 3
L3A27:
    lda    $CF                   ; 3
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #1                    ; 2
    adc    $C3                   ; 3
    jsr    L3D47                 ; 6
    adc    $C0                   ; 3
    sta    $C0                   ; 3
    cmp    #$2F                  ; 2
    bcc    L3A3F                 ; 2³
    cmp    #$CF                  ; 2
    bcc    L3A47                 ; 2³
L3A3F:
    lda    #0                    ; 2
    sta    $C5                   ; 3
    lda    #$30                  ; 2
    sta    $C0                   ; 3
L3A47:
    lda    #$25                  ; 2
L3A49:
    sta    $E8                   ; 3
    lda    $CA                   ; 3
    sta    $CB                   ; 3
    lda    $C0                   ; 3
    cmp    #$30                  ; 2
    bcs    L3A57                 ; 2³
    lda    #$30                  ; 2
L3A57:
    jsr    L3D1C                 ; 6
    sta    $C7                   ; 3
    jmp    L3AD8                 ; 3
L3A5F:
    jsr    L3D13                 ; 6
    beq    L3A6B                 ; 2³
    lda    #$30                  ; 2
    sta    $BF                   ; 3
    jmp    L3AC2                 ; 3
L3A6B:
    bit    $C4                   ; 3
    bmi    L3A93                 ; 2³
    lda    $C1                   ; 3
    clc                          ; 2
    adc    #6                    ; 2
    sta    $BF                   ; 3
    bit    $BD                   ; 3
    bmi    L3AC6                 ; 2³
    lda    $E3                   ; 3
    sta    $F6                   ; 3
    and    #$08                  ; 2
    bne    L3AC6                 ; 2³
    lda    #$80                  ; 2
    ldx    $C6                   ; 3
    beq    L3A8A                 ; 2³
    lda    #$C0                  ; 2
L3A8A:
    sta    $C4                   ; 3
    ldy    #1                    ; 2
    jsr    L3D74                 ; 6
    bne    L3AC6                    ;  always branch

L3A93:
    bvs    L3A9D                 ; 2³
    lda    $BF                   ; 3
    sec                          ; 2
    sbc    $F7                   ; 3
    jmp    L3AA2                 ; 3
L3A9D:
    lda    $BF                   ; 3
    clc                          ; 2
    adc    $F7                   ; 3
L3AA2:
    sta    $BF                   ; 3
    bit    $E6                   ; 3
    bmi    L3AB1                 ; 2³
    lda    $CF                   ; 3
    jsr    L3D47                 ; 6
    adc    $BF                   ; 3
    sta    $BF                   ; 3
L3AB1:
    lda    $BF                   ; 3
    cmp    #$CF                  ; 2
    bcs    L3ABB                 ; 2³
    cmp    #$31                  ; 2
    bcs    L3AC6                 ; 2³
L3ABB:
    lda    $C1                   ; 3
    clc                          ; 2
    adc    #6                    ; 2
    sta    $BF                   ; 3
L3AC2:
    lda    #0                    ; 2
    sta    $C4                   ; 3
L3AC6:
    lda    $C2                   ; 3
    clc                          ; 2
    adc    #5                    ; 2
    sta    $CB                   ; 3
    lda    $BF                   ; 3
    jsr    L3D1C                 ; 6
    sta    $C7                   ; 3
    lda    #$35                  ; 2
    sta    $E8                   ; 3
L3AD8:
    bit    $E6                   ; 3
    bmi    L3B1C                 ; 2³+1
    lda    $80                   ; 3
    cmp    #$20                  ; 2
    bcc    L3AFB                 ; 2³
    bit    $89                   ; 3
    bpl    L3AFE                 ; 2³
    jsr    L3CF2                 ; 6
L3AE9:
    lda    #$18                  ; 2
    sta    $80                   ; 3
    ldy    #3                    ; 2
    jsr    L3D68                 ; 6
    lda    #0                    ; 2
    sta    $C4                   ; 3
    ldy    #1                    ; 2
    jsr    L3D9C                 ; 6
L3AFB:
    jmp    L3BFA                 ; 3
L3AFE:
    bit    $C4                   ; 3
    bpl    L3AFB                 ; 2³+1
    lda    $BF                   ; 3
    clc                          ; 2
    adc    #9                    ; 2
    sbc    $8A                   ; 3
    cmp    #$10                  ; 2
    bcs    L3AFB                 ; 2³+1
    lda    $C2                   ; 3
    sbc    $93                   ; 3
    sbc    #$0E                  ; 2
    sec                          ; 2
    sbc    $8B                   ; 3
    cmp    #8                    ; 2
    bcc    L3AE9                 ; 2³+1
    bcs    L3AFB                 ; 3+1   always branch

L3B1C:
    ldx    $94                   ; 3
    bne    L3B32                 ; 2³
    lda    $82                   ; 3
    bmi    L3B47                 ; 2³
    jsr    L3CF2                 ; 6
    ldx    #7                    ; 2
L3B29:
    inc    $8A,X                 ; 6
    inc    $8A,X                 ; 6
    dex                          ; 2
    bpl    L3B29                 ; 2³
    bmi    L3B9E                    ;  always branch

L3B32:
    bmi    L3B47                 ; 2³
    lda    $82,X                 ; 4
    and    #$03                  ; 2
    beq    L3B47                 ; 2³
    bit    $98                   ; 3
    bvc    L3B41                 ; 2³
    jmp    L3BBF                 ; 3
L3B41:
    jsr    L3CF2                 ; 6
    jmp    L3B75                 ; 3
L3B47:
    lda    $C4                   ; 3
    bpl    L3B9E                 ; 2³
    bit    $98                   ; 3
    bmi    L3B9E                 ; 2³
    ldx    #7                    ; 2
L3B51:
    lda    #$57                  ; 2
    sec                          ; 2
    sbc    $8A,X                 ; 4
    cmp    #8                    ; 2
    bcs    L3B6B                 ; 2³
    lda    $BF                   ; 3
    adc    #9                    ; 2
    sec                          ; 2
    sbc    $9B,X                 ; 4
    cmp    #$12                  ; 2
    bcs    L3B6B                 ; 2³
    lda    $82,X                 ; 4
    and    #$03                  ; 2
    bne    L3B70                 ; 2³
L3B6B:
    dex                          ; 2
    bpl    L3B51                 ; 2³
    bmi    L3B9E                    ;  always branch

L3B70:
    ldy    #3                    ; 2
    jsr    L3D5F                 ; 6
L3B75:
    lda    #$0C                  ; 2
    sta    $82,X                 ; 4
    lda    #0                    ; 2
    sta    $B3,X                 ; 4
    tay                          ; 2
    sta    $C4                   ; 3
    cpx    $9A                   ; 3
    bne    L3B8F                 ; 2³
    ldy    #6                    ; 2
    jsr    L3D5F                 ; 6
    lda    #$0F                  ; 2
    sta    $9A                   ; 3
    ldy    #$10                  ; 2
L3B8F:
    lda    $D6                   ; 3
    lsr                          ; 2
    tax                          ; 2
    lda    $98                   ; 3
    lsr                          ; 2
    bcs    L3B9E                 ; 2³
    lda    L3FBA,X               ; 4
    jsr    L3D9C                 ; 6
L3B9E:
    lda    $CA                   ; 3
    sec                          ; 2
    sbc    #1                    ; 2
    cmp    $C2                   ; 3
    bcc    L3BFA                 ; 2³
    sbc    #$0A                  ; 2
    cmp    $C2                   ; 3
    bcs    L3BFA                 ; 2³
    lda    $C0                   ; 3
    adc    #4                    ; 2
    cmp    $C1                   ; 3
    bcc    L3BFA                 ; 2³
    sbc    #$14                  ; 2
    cmp    $C1                   ; 3
    bcs    L3BFA                 ; 2³
    bit    $98                   ; 3
    bvc    L3BF7                 ; 2³
L3BBF:
    jsr    L3D13                 ; 6
    bne    L3BFA                 ; 2³
    ldy    #$0E                  ; 2
    jsr    L3D74                 ; 6
    lda    #$0D                  ; 2
    sta    $C9                   ; 3
    lda    #0                    ; 2
    sta    $CF                   ; 3
    dec    $BC                   ; 5
    lda    $BC                   ; 3
    and    #$07                  ; 2
    bne    L3BFA                 ; 2³
    lda    $8A                   ; 3
    jsr    L3E15                 ; 6
    lda    #1                    ; 2
    sta    $98                   ; 3
    lda    #$93                  ; 2
    sta    $BC                   ; 3
    ldx    $92                   ; 3
    lda    #$8C                  ; 2
    sta    $82,X                 ; 4
    ldy    #$11                  ; 2
    jsr    L3D5F                 ; 6
    lda    #$18                  ; 2
    sta    $AB,X                 ; 4
    bne    L3BFA                    ;  always branch

L3BF7:
    jsr    L3CF2                 ; 6
L3BFA:
    bit    $E6                   ; 3
    bmi    L3C7C                 ; 2³+1
    lda    $85                   ; 3
    beq    L3C10                 ; 2³
    lda    #$30                  ; 2
    sta    $83                   ; 3
    sta    $84                   ; 3
    lda    #$40                  ; 2
    sta    $86                   ; 3
    dec    $85                   ; 5
    bpl    L3C44                 ; 2³
L3C10:
    bit    $86                   ; 3
    bpl    L3C20                 ; 2³
    lda    $91                   ; 3
    and    #$30                  ; 2
    cmp    #$20                  ; 2
    bne    L3C20                 ; 2³
    lda    #$20                  ; 2
    sta    $91                   ; 3
L3C20:
    inc    $90                   ; 5
    inc    $91                   ; 5
    lda    $8D                   ; 3
    beq    L3C31                 ; 2³
    bpl    L3C2F                 ; 2³
    inc    $91                   ; 5
    jmp    L3C31                 ; 3
L3C2F:
    inc    $90                   ; 5
L3C31:
    ldx    #1                    ; 2
L3C33:
    lda    $90,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$03                  ; 2
    tay                          ; 2
    lda    L3C78,Y               ; 4
    sta    $83,X                 ; 4
    dex                          ; 2
    bpl    L3C33                 ; 2³

L3C44:
    lda    $CD                   ; 3
    bne    L3C71                 ; 2³
    lda    $80                   ; 3
    beq    L3C71                 ; 2³
    cmp    #$20                  ; 2
    bcs    L3C5B                 ; 2³
    sec                          ; 2
    sbc    #8                    ; 2
    sta    $80                   ; 3
    bne    L3C71                 ; 2³
    inc    $BB                   ; 5
    bpl    L3C71                 ; 2³
L3C5B:
    ldy    $D6                   ; 3
    ldx    L3F1E,Y               ; 4
    lda    frameCounter
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$03                  ; 2
    tay                          ; 2
    lda    L3FA6,X               ; 4
    clc                          ; 2
    adc    L3C74,Y               ; 4
    sta    $80                   ; 3
L3C71:
    jmp    L3CE5                 ; 3

L3C74:
    .byte $00 ; |        | $3C74
    .byte $08 ; |    X   | $3C75
    .byte $10 ; |   X    | $3C76
    .byte $08 ; |    X   | $3C77
L3C78:
    .byte $00 ; |        | $3C78
    .byte $10 ; |   X    | $3C79
    .byte $20 ; |  X     | $3C7A
    .byte $10 ; |   X    | $3C7B

L3C7C:
    lda    $93                   ; 3
    beq    L1C89                 ; 2³
    lda    $E2                   ; 3
    and    #$F7                  ; 2
    ora    #$01                  ; 2
    sta    $93                   ; 3
L1C89:
    ldx    $CD                   ; 3
    lda    $82,X                 ; 4
    and    #$7F                  ; 2
    beq    L3CE5                 ; 2³
    and    #$03                  ; 2
    bne    L3CA9                 ; 2³
    lda    $82,X                 ; 4
    and    #$7F                  ; 2
    cmp    #$10                  ; 2
    bcs    L3CE5                 ; 2³
    lda    $82,X                 ; 4
    sec                          ; 2
    sbc    #4                    ; 2
    sta    $82,X                 ; 4
    bne    L3CE5                 ; 2³
    dec    $95                   ; 5
    bpl    L3CE5                 ; 2³
L3CA9:
    txa                          ; 2
    beq    L3CE5                 ; 2³
    cpx    $92                   ; 3
    beq    L3CE5                 ; 2³
    lda    frameCounter
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    stx    $E7                   ; 3
    clc                          ; 2
    adc    $E7                   ; 3
    and    #$03                  ; 2
    tay                          ; 2
    cpx    $9A                   ; 3
    bne    L3CC5                 ; 2³
    lda    #$62                  ; 2
    bne    L3CDF                    ;  always branch

L3CC5:
    lda    $D6                   ; 3
    bit    $98                   ; 3
    bpl    L3CD9                 ; 2³
    and    #$03                  ; 2
    tax                          ; 2
    lda    L3FA2,X               ; 4
    sta    $E5                   ; 3
    lda    L3F9E,X               ; 4
    jmp    L3CDD                 ; 3
L3CD9:
    tax                          ; 2
    lda    L3F5E,X               ; 4
L3CDD:
    ldx    $E7                   ; 3
L3CDF:
    clc                          ; 2
    adc    L3FB6,Y               ; 4
    sta    $82,X                 ; 4
L3CE5:
    jmp    L3006                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3CE8 SUBROUTINE
    dec    $CA                   ; 5
L3CEA SUBROUTINE
    ldx    #7                    ; 2
L3CEC:
    dec    $8A,X                 ; 6
    dex                          ; 2
    bpl    L3CEC                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3CF2 SUBROUTINE
    jsr    L3D13                 ; 6
    bne    L3D09                 ; 2³+1
    lda    #3                    ; 2
    sta    $C9                   ; 3
    lda    #0                    ; 2
    sta    $CF                   ; 3
    ldy    #2                    ; 2
    jsr    L3D5F                 ; 6
    rol    $BC                   ; 5
    sec                          ; 2
    ror    $BC                   ; 5
L3D09:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3D0A SUBROUTINE
    lda    #$79                  ; 2
    sta    $C2                   ; 3
    lda    #$7A                  ; 2
    sta    $C1                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3D13 SUBROUTINE
    lda    $C9                   ; 3
    cmp    #5                    ; 2
    bcs    L3D1B                 ; 2³
    cmp    #4                    ; 2
L3D1B:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3D1C SUBROUTINE
    sec                          ; 2
    sbc    #$2E                  ; 2
    beq    L3D25                 ; 2³
    cmp    #$A1                  ; 2
    bcc    L3D27                 ; 2³
L3D25:
    lda    #1                    ; 2
L3D27:
    pha                          ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $E7                   ; 3
    tay                          ; 2
    pla                          ; 4
    and    #$0F                  ; 2
    clc                          ; 2
    adc    $E7                   ; 3
    cmp    #$0F                  ; 2
    bcc    L3D3C                 ; 2³
    sbc    #$0F                  ; 2
    iny                          ; 2
L3D3C:
    sty    $E7                   ; 3
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    $E7                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3D47 SUBROUTINE
    ldy    $CD                   ; 3
    clc                          ; 2
    adc    L3D57,Y               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    eor    #$10                  ; 2
    sec                          ; 2
    sbc    #$10                  ; 2
    clc                          ; 2
    rts                          ; 6

L3D57:
    .byte $05 ; |     X X| $3D57
    .byte $02 ; |      X | $3D58
    .byte $07 ; |     XXX| $3D59
    .byte $04 ; |     X  | $3D5A
    .byte $01 ; |       X| $3D5B
    .byte $06 ; |     XX | $3D5C
    .byte $03 ; |      XX| $3D5D
    .byte $00 ; |        | $3D5E

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3D5F SUBROUTINE
    lda    #0                    ; 2
    sta    $DA                   ; 3
    lda    L3D81,Y               ; 4
    sta    $DC                   ; 3
L3D68 SUBROUTINE
    sty    $DB                   ; 3
    lda    L3D81,Y               ; 4
    sta    $DD                   ; 3
    rts                          ; 6

L3D70 SUBROUTINE
    lda    $DA                   ; 3
    bne    L3D68                 ; 2³

L3D74 SUBROUTINE
    sty    $DA                   ; 3
    lda    L3D81,Y               ; 4
    sta    $DC                   ; 3
    rts                          ; 6

L3D7C SUBROUTINE
    lda    $DB                   ; 3
    beq    L3D68                 ; 2³
    rts                          ; 6

L3D81:
    .byte $02 ; |      X | $3D81
    .byte $1F ; |   XXXXX| $3D82
    .byte $1F ; |   XXXXX| $3D83
    .byte $0E ; |    XXX | $3D84
    .byte $1F ; |   XXXXX| $3D85
    .byte $07 ; |     XXX| $3D86
    .byte $0E ; |    XXX | $3D87
    .byte $0F ; |    XXXX| $3D88
    .byte $04 ; |     X  | $3D89
    .byte $3F ; |  XXXXXX| $3D8A
    .byte $02 ; |      X | $3D8B
    .byte $1F ; |   XXXXX| $3D8C
    .byte $FF ; |XXXXXXXX| $3D8D
    .byte $1F ; |   XXXXX| $3D8E
    .byte $FF ; |XXXXXXXX| $3D8F
    .byte $7F ; | XXXXXXX| $3D90
    .byte $2F ; |  X XXXX| $3D91
    .byte $3F ; |  XXXXXX| $3D92
    .byte $1F ; |   XXXXX| $3D93
    .byte $1F ; |   XXXXX| $3D94
    .byte $7F ; | XXXXXXX| $3D95
    .byte $0F ; |    XXXX| $3D96
    .byte $0F ; |    XXXX| $3D97

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3D98 SUBROUTINE
    ldx    #9                    ; 2
    bne    L3D9E                    ;  always branch

L3D9C SUBROUTINE
    ldx    #0                    ; 2
L3D9E:
    stx    $F8                   ; 3
    sta    $E7                   ; 3
    lda    $DF                   ; 3
    and    #$10                  ; 2
    beq    L3DDD                 ; 2³
    lda    $E3                   ; 3
    and    #$01                  ; 2
    tax                          ; 2
    sed                          ; 2
    lda    $D0,X                 ; 4
    clc                          ; 2
    adc    $E7                   ; 3
    sta    $D0,X                 ; 4
    tya                          ; 2
    adc    $D2,X                 ; 4
    sta    $D2,X                 ; 4
    lda    $D4,X                 ; 4
    and    #$0F                  ; 2
    adc    $F8                   ; 3
    pha                          ; 3
    eor    $D4,X                 ; 4
    and    #$0F                  ; 2
    eor    $D4,X                 ; 4
    sta    $D4,X                 ; 4
    cld                          ; 2
    pla                          ; 4
    ldy    $F8                   ; 3
    beq    L3DDD                 ; 2³
    and    #$F0                  ; 2
    bne    L3DDD                 ; 2³
    sta    $D0,X                 ; 4
    sta    $D2,X                 ; 4
    lda    $D4,X                 ; 4
    and    #$F0                  ; 2
    sta    $D4,X                 ; 4
L3DDD:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3DDE SUBROUTINE
    jsr    L3E15                 ; 6
    ldx    $92                   ; 3
    ldy    #2                    ; 2
    sty    $81                   ; 3
    lda    L3E8E,Y               ; 4
    sta    $AB,X                 ; 4
    lda    #$B1                  ; 2
    sta    $9B,X                 ; 4
    ldx    #$0B                  ; 2
    lda    $E6                   ; 3
    and    #$04                  ; 2
    beq    L3DFA                 ; 2³
    ldx    #$8B                  ; 2
L3DFA:
    stx    $BC                   ; 3
    lda    #0                    ; 2
    sta    $82                   ; 3
    sta    $98                   ; 3
    sta    $9A                   ; 3
    lda    #$C0                  ; 2
    ldx    $D6                   ; 3
    beq    L3E12                 ; 2³
    dex                          ; 2
    ldy    L3F3E,X               ; 4
    bmi    L3E12                 ; 2³
    lda    #$80                  ; 2
L3E12:
    sta    $E6                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L3E15 SUBROUTINE
    ldy    $D6                   ; 3
    ldx    #0                    ; 2
L3E19:
    sta    $8A,X                 ; 4
    sec                          ; 2
    sbc    L3E9E,Y               ; 4
    inx                          ; 2
    cpx    #8                    ; 2
    bne    L3E19                 ; 2³
    ldx    L3EDE,Y               ; 4
    lda    $E4                   ; 3
    lsr                          ; 2
    bcc    L3E2E                 ; 2³
    ldx    #$11                  ; 2
L3E2E:
    lda    $E6                   ; 3
    and    #$04                  ; 2
    bne    L3E36                 ; 2³
    stx    $BB                   ; 3
L3E36:
    lda    #0                    ; 2
    sta    $95                   ; 3
    ldx    #7                    ; 2
L3E3C:
    sta    $82,X                 ; 4
    sta    $AB,X                 ; 4
    dex                          ; 2
    bne    L3E3C                 ; 2³
    stx    $C5                   ; 3
    lda    L3F3E,Y               ; 4
    and    #$13                  ; 2
    beq    L3E4D                 ; 2³
    inx                          ; 2
L3E4D:
    stx    $99                   ; 3
    lda    L3EFE,Y               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    stx    $92                   ; 3
    lda    L3F7E,Y               ; 4
    sta    $E5                   ; 3
    lda    #$30                  ; 2
    sta    $C0                   ; 3
    lda    L3F3E,Y               ; 4
    and    #$80                  ; 2
    sta    $93                   ; 3
    lda    L3F1E,Y               ; 4
    lsr                          ; 2
    tay                          ; 2
    lda    L3E92,Y               ; 4
    sta    $82,X                 ; 4
    lda    $D6                   ; 3
    ror                          ; 2
    ror                          ; 2
    sta    $B3                   ; 3
    eor    #$80                  ; 2
    sta    $B3,X                 ; 4
    rts                          ; 6

L3E7E:
    .byte $FA ; |XXXXX X | $3E7E
    .byte $FA ; |XXXXX X | $3E7F
    .byte $FA ; |XXXXX X | $3E80
    .byte $FA ; |XXXXX X | $3E81
    .byte $00 ; |        | $3E82
    .byte $FE ; |XXXXXXX | $3E83
    .byte $FD ; |XXXXXX X| $3E84
    .byte $FC ; |XXXXXX  | $3E85
L3E86:
    .byte $04 ; |     X  | $3E86
    .byte $03 ; |      XX| $3E87
    .byte $02 ; |      X | $3E88
    .byte $00 ; |        | $3E89
    .byte $06 ; |     XX | $3E8A
    .byte $06 ; |     XX | $3E8B
    .byte $06 ; |     XX | $3E8C
    .byte $06 ; |     XX | $3E8D
L3E8E:
    .byte $00 ; |        | $3E8E
    .byte $10 ; |   X    | $3E8F
    .byte $20 ; |  X     | $3E90
    .byte $08 ; |    X   | $3E91
L3E92:
    .byte $14 ; |   X X  | $3E92
    .byte $18 ; |   XX   | $3E93
    .byte $1C ; |   XXX  | $3E94
    .byte $20 ; |  X     | $3E95
L3E96:
    .byte $05 ; |     X X| $3E96
    .byte $0A ; |    X X | $3E97
    .byte $0F ; |    XXXX| $3E98
    .byte $14 ; |   X X  | $3E99
    .byte $14 ; |   X X  | $3E9A
    .byte $19 ; |   XX  X| $3E9B
    .byte $19 ; |   XX  X| $3E9C
    .byte $19 ; |   XX  X| $3E9D
L3E9E:
    .byte $14 ; |   X X  | $3E9E
    .byte $1E ; |   XXXX | $3E9F
    .byte $32 ; |  XX  X | $3EA0
    .byte $12 ; |   X  X | $3EA1
    .byte $11 ; |   X   X| $3EA2
    .byte $32 ; |  XX  X | $3EA3
    .byte $1E ; |   XXXX | $3EA4
    .byte $11 ; |   X   X| $3EA5
    .byte $14 ; |   X X  | $3EA6
    .byte $28 ; |  X X   | $3EA7
    .byte $11 ; |   X   X| $3EA8
    .byte $14 ; |   X X  | $3EA9
    .byte $1E ; |   XXXX | $3EAA
    .byte $28 ; |  X X   | $3EAB
    .byte $19 ; |   XX  X| $3EAC
    .byte $11 ; |   X   X| $3EAD
    .byte $13 ; |   X  XX| $3EAE
    .byte $1E ; |   XXXX | $3EAF
    .byte $1E ; |   XXXX | $3EB0
    .byte $19 ; |   XX  X| $3EB1
    .byte $14 ; |   X X  | $3EB2
    .byte $12 ; |   X  X | $3EB3
    .byte $11 ; |   X   X| $3EB4
    .byte $1E ; |   XXXX | $3EB5
    .byte $14 ; |   X X  | $3EB6
    .byte $11 ; |   X   X| $3EB7
    .byte $11 ; |   X   X| $3EB8
    .byte $11 ; |   X   X| $3EB9
    .byte $1C ; |   XXX  | $3EBA
    .byte $11 ; |   X   X| $3EBB
    .byte $11 ; |   X   X| $3EBC
    .byte $32 ; |  XX  X | $3EBD
L3EBE:
    .byte $36 ; |  XX XX | $3EBE
    .byte $32 ; |  XX  X | $3EBF
    .byte $10 ; |   X    | $3EC0
    .byte $42 ; | X    X | $3EC1
    .byte $52 ; | X X  X | $3EC2
    .byte $10 ; |   X    | $3EC3
    .byte $33 ; |  XX  XX| $3EC4
    .byte $53 ; | X X  XX| $3EC5
    .byte $62 ; | XX   X | $3EC6
    .byte $20 ; |  X     | $3EC7
    .byte $62 ; | XX   X | $3EC8
    .byte $53 ; | X X  XX| $3EC9
    .byte $32 ; |  XX  X | $3ECA
    .byte $20 ; |  X     | $3ECB
    .byte $32 ; |  XX  X | $3ECC
    .byte $62 ; | XX   X | $3ECD
    .byte $62 ; | XX   X | $3ECE
    .byte $32 ; |  XX  X | $3ECF
    .byte $30 ; |  XX    | $3ED0
    .byte $32 ; |  XX  X | $3ED1
    .byte $42 ; | X    X | $3ED2
    .byte $52 ; | X X  X | $3ED3
    .byte $62 ; | XX   X | $3ED4
    .byte $30 ; |  XX    | $3ED5
    .byte $42 ; | X    X | $3ED6
    .byte $52 ; | X X  X | $3ED7
    .byte $62 ; | XX   X | $3ED8
    .byte $62 ; | XX   X | $3ED9
    .byte $30 ; |  XX    | $3EDA
    .byte $64 ; | XX  X  | $3EDB
    .byte $52 ; | X X  X | $3EDC
    .byte $10 ; |   X    | $3EDD
L3EDE:
    .byte $08 ; |    X   | $3EDE
    .byte $08 ; |    X   | $3EDF
    .byte $05 ; |     X X| $3EE0
    .byte $0C ; |    XX  | $3EE1
    .byte $0C ; |    XX  | $3EE2
    .byte $04 ; |     X  | $3EE3
    .byte $0E ; |    XXX | $3EE4
    .byte $0E ; |    XXX | $3EE5
    .byte $0E ; |    XXX | $3EE6
    .byte $0A ; |    X X | $3EE7
    .byte $10 ; |   X    | $3EE8
    .byte $10 ; |   X    | $3EE9
    .byte $10 ; |   X    | $3EEA
    .byte $0C ; |    XX  | $3EEB
    .byte $14 ; |   X X  | $3EEC
    .byte $14 ; |   X X  | $3EED
    .byte $14 ; |   X X  | $3EEE
    .byte $14 ; |   X X  | $3EEF
    .byte $0A ; |    X X | $3EF0
    .byte $19 ; |   XX  X| $3EF1
    .byte $19 ; |   XX  X| $3EF2
    .byte $19 ; |   XX  X| $3EF3
    .byte $21 ; |  X    X| $3EF4
    .byte $0A ; |    X X | $3EF5
    .byte $21 ; |  X    X| $3EF6
    .byte $21 ; |  X    X| $3EF7
    .byte $21 ; |  X    X| $3EF8
    .byte $21 ; |  X    X| $3EF9
    .byte $0F ; |    XXXX| $3EFA
    .byte $21 ; |  X    X| $3EFB
    .byte $21 ; |  X    X| $3EFC
    .byte $14 ; |   X X  | $3EFD
L3EFE:
    .byte $75 ; | XXX X X| $3EFE
    .byte $46 ; | X   XX | $3EFF
    .byte $27 ; |  X  XXX| $3F00
    .byte $66 ; | XX  XX | $3F01
    .byte $67 ; | XX  XXX| $3F02
    .byte $26 ; |  X  XX | $3F03
    .byte $47 ; | X   XXX| $3F04
    .byte $68 ; | XX X   | $3F05
    .byte $77 ; | XXX XXX| $3F06
    .byte $36 ; |  XX XX | $3F07
    .byte $79 ; | XXXX  X| $3F08
    .byte $78 ; | XXXX   | $3F09
    .byte $49 ; | X  X  X| $3F0A
    .byte $37 ; |  XX XXX| $3F0B
    .byte $49 ; | X  X  X| $3F0C
    .byte $7B ; | XXXX XX| $3F0D
    .byte $7B ; | XXXX XX| $3F0E
    .byte $48 ; | X  X   | $3F0F
    .byte $44 ; | X   X  | $3F10
    .byte $48 ; | X  X   | $3F11
    .byte $59 ; | X XX  X| $3F12
    .byte $69 ; | XX X  X| $3F13
    .byte $7A ; | XXXX X | $3F14
    .byte $48 ; | X  X   | $3F15
    .byte $59 ; | X XX  X| $3F16
    .byte $6A ; | XX X X | $3F17
    .byte $79 ; | XXXX  X| $3F18
    .byte $7A ; | XXXX X | $3F19
    .byte $49 ; | X  X  X| $3F1A
    .byte $79 ; | XXXX  X| $3F1B
    .byte $6B ; | XX X XX| $3F1C
    .byte $29 ; |  X X  X| $3F1D
L3F1E:
    .byte $00 ; |        | $3F1E
    .byte $00 ; |        | $3F1F
    .byte $00 ; |        | $3F20
    .byte $01 ; |       X| $3F21
    .byte $01 ; |       X| $3F22
    .byte $01 ; |       X| $3F23
    .byte $02 ; |      X | $3F24
    .byte $02 ; |      X | $3F25
    .byte $02 ; |      X | $3F26
    .byte $02 ; |      X | $3F27
    .byte $03 ; |      XX| $3F28
    .byte $03 ; |      XX| $3F29
    .byte $03 ; |      XX| $3F2A
    .byte $03 ; |      XX| $3F2B
    .byte $04 ; |     X  | $3F2C
    .byte $04 ; |     X  | $3F2D
    .byte $04 ; |     X  | $3F2E
    .byte $04 ; |     X  | $3F2F
    .byte $04 ; |     X  | $3F30
    .byte $05 ; |     X X| $3F31
    .byte $05 ; |     X X| $3F32
    .byte $05 ; |     X X| $3F33
    .byte $05 ; |     X X| $3F34
    .byte $05 ; |     X X| $3F35
    .byte $06 ; |     XX | $3F36
    .byte $06 ; |     XX | $3F37
    .byte $06 ; |     XX | $3F38
    .byte $06 ; |     XX | $3F39
    .byte $06 ; |     XX | $3F3A
    .byte $07 ; |     XXX| $3F3B
    .byte $07 ; |     XXX| $3F3C
    .byte $07 ; |     XXX| $3F3D
L3F3E:
    .byte $40 ; | X      | $3F3E
    .byte $41 ; | X     X| $3F3F
    .byte $C1 ; |XX     X| $3F40
    .byte $00 ; |        | $3F41
    .byte $60 ; | XX     | $3F42
    .byte $81 ; |X      X| $3F43
    .byte $50 ; | X X    | $3F44
    .byte $20 ; |  X     | $3F45
    .byte $06 ; |     XX | $3F46
    .byte $F0 ; |XXXX    | $3F47
    .byte $60 ; | XX     | $3F48
    .byte $05 ; |     X X| $3F49
    .byte $02 ; |      X | $3F4A
    .byte $B0 ; |X XX    | $3F4B
    .byte $0E ; |    XXX | $3F4C
    .byte $40 ; | X      | $3F4D
    .byte $25 ; |  X  X X| $3F4E
    .byte $0B ; |    X XX| $3F4F
    .byte $A7 ; |X X  XXX| $3F50
    .byte $29 ; |  X X  X| $3F51
    .byte $3C ; |  XXXX  | $3F52
    .byte $22 ; |  X   X | $3F53
    .byte $00 ; |        | $3F54
    .byte $83 ; |X     XX| $3F55
    .byte $09 ; |    X  X| $3F56
    .byte $00 ; |        | $3F57
    .byte $34 ; |  XX X  | $3F58
    .byte $00 ; |        | $3F59
    .byte $80 ; |X       | $3F5A
    .byte $14 ; |   X X  | $3F5B
    .byte $27 ; |  X  XXX| $3F5C
    .byte $80 ; |X       | $3F5D
L3F5E:
    .byte $49 ; | X  X  X| $3F5E
    .byte $26 ; |  X  XX | $3F5F
    .byte $19 ; |   XX  X| $3F60
    .byte $56 ; | X X XX | $3F61
    .byte $32 ; |  XX  X | $3F62
    .byte $19 ; |   XX  X| $3F63
    .byte $6D ; | XX XX X| $3F64
    .byte $3D ; |  XXXX X| $3F65
    .byte $0E ; |    XXX | $3F66
    .byte $19 ; |   XX  X| $3F67
    .byte $02 ; |      X | $3F68
    .byte $31 ; |  XX   X| $3F69
    .byte $01 ; |       X| $3F6A
    .byte $19 ; |   XX  X| $3F6B
    .byte $61 ; | XX    X| $3F6C
    .byte $25 ; |  X  X X| $3F6D
    .byte $55 ; | X X X X| $3F6E
    .byte $0D ; |    XX X| $3F6F
    .byte $19 ; |   XX  X| $3F70
    .byte $3E ; |  XXXXX | $3F71
    .byte $32 ; |  XX  X | $3F72
    .byte $01 ; |       X| $3F73
    .byte $26 ; |  X  XX | $3F74
    .byte $19 ; |   XX  X| $3F75
    .byte $56 ; | X X XX | $3F76
    .byte $02 ; |      X | $3F77
    .byte $0D ; |    XX X| $3F78
    .byte $25 ; |  X  X X| $3F79
    .byte $19 ; |   XX  X| $3F7A
    .byte $61 ; | XX    X| $3F7B
    .byte $3D ; |  XXXX X| $3F7C
    .byte $19 ; |   XX  X| $3F7D
L3F7E:
    .byte $30 ; |  XX    | $3F7E
    .byte $68 ; | XX X   | $3F7F
    .byte $10 ; |   X    | $3F80
    .byte $88 ; |X   X   | $3F81
    .byte $70 ; | XXX    | $3F82
    .byte $18 ; |   XX   | $3F83
    .byte $48 ; | X  X   | $3F84
    .byte $28 ; |  X X   | $3F85
    .byte $58 ; | X XX   | $3F86
    .byte $70 ; | XXX    | $3F87
    .byte $50 ; | X X    | $3F88
    .byte $20 ; |  X     | $3F89
    .byte $00 ; |        | $3F8A
    .byte $50 ; | X X    | $3F8B
    .byte $40 ; | X      | $3F8C
    .byte $18 ; |   XX   | $3F8D
    .byte $38 ; |  XXX   | $3F8E
    .byte $08 ; |    X   | $3F8F
    .byte $38 ; |  XXX   | $3F90
    .byte $78 ; | XXXX   | $3F91
    .byte $18 ; |   XX   | $3F92
    .byte $28 ; |  X X   | $3F93
    .byte $58 ; | X XX   | $3F94
    .byte $30 ; |  XX    | $3F95
    .byte $68 ; | XX X   | $3F96
    .byte $40 ; | X      | $3F97
    .byte $78 ; | XXXX   | $3F98
    .byte $00 ; |        | $3F99
    .byte $20 ; |  X     | $3F9A
    .byte $58 ; | X XX   | $3F9B
    .byte $30 ; |  XX    | $3F9C
    .byte $68 ; | XX X   | $3F9D
L3F9E:
    .byte $1A ; |   XX X | $3F9E
    .byte $4A ; | X  X X | $3F9F
    .byte $1A ; |   XX X | $3FA0
    .byte $4A ; | X  X X | $3FA1
L3FA2:
    .byte $60 ; | XX     | $3FA2
    .byte $80 ; |X       | $3FA3
    .byte $90 ; |X  X    | $3FA4
    .byte $98 ; |X  XX   | $3FA5
L3FA6:
    .byte $48 ; | X  X   | $3FA6
    .byte $78 ; | XXXX   | $3FA7
    .byte $90 ; |X  X    | $3FA8
    .byte $60 ; | XX     | $3FA9
    .byte $48 ; | X  X   | $3FAA
    .byte $78 ; | XXXX   | $3FAB
    .byte $90 ; |X  X    | $3FAC
    .byte $60 ; | XX     | $3FAD
L3FAE:
    .byte $A8 ; |X X X   | $3FAE
    .byte $B8 ; |X XXX   | $3FAF
    .byte $C0 ; |XX      | $3FB0
    .byte $B0 ; |X XX    | $3FB1
    .byte $60 ; | XX     | $3FB2
    .byte $90 ; |X  X    | $3FB3
    .byte $78 ; | XXXX   | $3FB4
    .byte $48 ; | X  X   | $3FB5
L3FB6:
    .byte $00 ; |        | $3FB6
    .byte $04 ; |     X  | $3FB7
    .byte $08 ; |    X   | $3FB8
    .byte $04 ; |     X  | $3FB9
L3FBA:
    .byte $25 ; |  X  X X| $3FBA
    .byte $30 ; |  XX    | $3FBB
    .byte $35 ; |  XX X X| $3FBC
    .byte $40 ; | X      | $3FBD
    .byte $45 ; | X   X X| $3FBE
    .byte $50 ; | X X    | $3FBF
    .byte $55 ; | X X X X| $3FC0
    .byte $60 ; | XX     | $3FC1
    .byte $65 ; | XX  X X| $3FC2
    .byte $70 ; | XXX    | $3FC3
    .byte $75 ; | XXX X X| $3FC4
    .byte $80 ; |X       | $3FC5
    .byte $85 ; |X    X X| $3FC6
    .byte $90 ; |X  X    | $3FC7
    .byte $95 ; |X  X X X| $3FC8
    .byte $99 ; |X  XX  X| $3FC9
L3FCA:
    .byte $00 ; |        | $3FCA
    .byte $CF ; |XX  XXXX| $3FCB
    .byte $DF ; |XX XXXXX| $3FCC
    .byte $CF ; |XX  XXXX| $3FCD
    .byte $CF ; |XX  XXXX| $3FCE
L3FCF:
    .byte $00 ; |        | $3FCF
    .byte $50 ; | X X    | $3FD0
    .byte $CF ; |XX  XXXX| $3FD1
    .byte $38 ; |  XXX   | $3FD2
    .byte $40 ; | X      | $3FD3
L3FD4:
    .byte $00 ; |        | $3FD4
    .byte $00 ; |        | $3FD5
    .byte $50 ; | X X    | $3FD6
L3FD7:
    .byte $00 ; |        | $3FD7
    .byte $00 ; |        | $3FD8
    .byte $40 ; | X      | $3FD9
L3FDA:
    .byte $00 ; |        | $3FDA
    .byte $00 ; |        | $3FDB
    .byte $20 ; |  X     | $3FDC
L3FDD:
    .byte $00 ; |        | $3FDD
    .byte $00 ; |        | $3FDE
    .byte $10 ; |   X    | $3FDF
L3FE0:
    .byte $00 ; |        | $3FE0
    .byte $00 ; |        | $3FE1
    .byte $03 ; |      XX| $3FE2
L3FE3:
    .byte $00 ; |        | $3FE3
    .byte $00 ; |        | $3FE4
    .byte $01 ; |       X| $3FE5
    .byte $00 ; |        | $3FE6
L3FE7:
    .byte $00 ; |        | $3FE7
    .byte $20 ; |  X     | $3FE8
    .byte $20 ; |  X     | $3FE9
    .byte $08 ; |    X   | $3FEA
    .byte $10 ; |   X    | $3FEB
L3FEC:
    .byte $00 ; |        | $3FEC
    .byte $20 ; |  X     | $3FED
    .byte $20 ; |  X     | $3FEE
    .byte $09 ; |    X  X| $3FEF
    .byte $10 ; |   X    | $3FF0
L3FF1:
    .byte $00 ; |        | $3FF1
    .byte $02 ; |      X | $3FF2
    .byte $01 ; |       X| $3FF3
    .byte $05 ; |     X X| $3FF4
    .byte $01 ; |       X| $3FF5
    .byte $00 ; |        | $3FF6
    .byte $00 ; |        | $3FF7
    .byte $00 ; |        | $3FF8
    .byte $00 ; |        | $3FF9

    .word START,START,L372C
