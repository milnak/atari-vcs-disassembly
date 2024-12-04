; Disassembly of sw.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasfcsw.cfg sw.bin
;
; sw.cfg contents:
;
;      ORG F000
;      CODE F000 F04B
;      GFX F04C F04C
;      CODE F04D F0F2
;      GFX F0F3 F0F3
;      CODE F0F4 F11D
;      GFX F11E F11E
;      CODE F11F F348
;      GFX F349 F349
;      CODE F34A F76E
;      GFX F76F F76F
;      CODE F770 F778
;      GFX F779 F779
;      CODE F77A F7C9
;      GFX F7CA F7CA
;      CODE F7CB F889
;      GFX F88A F88A
;      CODE F88B F8AA
;      GFX F8AB F8AB
;      CODE F8AC F8C4
;      GFX F8C5 F8C5
;      CODE F8C6 F9CD
;      GFX F9CE F9CE
;      CODE F9CF FB13
;      GFX FB14 FB14
;      CODE FB15 FB38
;      GFX FB39 FB39
;      CODE FB3A FC30
;      GFX FC31 FC31
;      CODE FC32 FC38
;      GFX FC39 FC39
;      CODE FC3A FCC7
;      GFX FCC8 FCC8
;      CODE FCC9 FCCA
;      GFX FCCB FCCB
;      CODE FCCC FCF4
;      GFX FCF5 FCF5
;      CODE FCF6 FD37
;      GFX FD38 FD38
;      CODE FD39 FE11
;      GFX FE12 FFFF

      processor 6502

VSYNC   =  $00
VBLANK  =  $01
WSYNC   =  $02
RSYNC   =  $03
NUSIZ0  =  $04
NUSIZ1  =  $05
COLUP0  =  $06
COLUP1  =  $07
COLUPF  =  $08
COLUBK  =  $09
CTRLPF  =  $0A
REFP0   =  $0B
PF0     =  $0D
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
AUDC0   =  $15
AUDF0   =  $17
AUDV0   =  $19
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
ENAM1   =  $1E
HMP0    =  $20
HMP1    =  $21
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXM0P   =  $30
CXM1P   =  $31
CXP0FB  =  $32
CXM0FB  =  $34
CXPPMM  =  $37
INPT4   =  $3C
SWCHA   =  $0280
SWACNT  =  $0281
SWCHB   =  $0282
SWBCNT  =  $0283
INTIM   =  $0284
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SWITCHES
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      CONSTANTS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

frameCounter   = $E4
largeCounter   = $E5

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $F000

LF000 SUBROUTINE
    ldx    #0                    ; 2
LF002 SUBROUTINE   ;also jumped to with no return
    sta    $F5                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sec                          ; 2
    adc    $F5                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $F6                   ; 3
    clc                          ; 2
    adc    $F5                   ; 3
    eor    #$FF                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    $F6                   ; 3
    clc                          ; 2
    adc    #$83                  ; 2
    sta    HMCLR                 ; 3
    sta    HMP0,X                ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
LF028:
    dey                          ; 2
    bpl    LF028                 ; 2³
    sta    RESP0,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

START:
    sei                          ; 2
    cld                          ; 2
    ldx    #0                    ; 2
    txa                          ; 2
.loopClear:
    sta    0,X                   ; 4
    txs                          ; 2
    inx                          ; 2
    bne    .loopClear            ; 2³

    stx    SWACNT                ; 4
    stx    SWBCNT                ; 4
    lda    SWCHB                 ; 4
    sta    $F0                   ; 3
    jsr    LF763                 ; 6
    brk                          ; 7
    .byte $80   ; $F04C

MainLoop:
    lda    #$9F                  ; 2
    sta    TIM64T                ; 4
    inc    frameCounter          ; 5
    bne    .skipLC               ; 2³
    inc    largeCounter          ; 5   when the framecounter rolls over the large counter increments
.skipLC:
    jsr    LFE03                 ; 6
    lda    $EB                   ; 3
    ora    $8D                   ; 3
    bne    LF0D0                 ; 2³
    lda    $8C                   ; 3
    beq    LF0A5                 ; 2³
    bit    CXP0FB                ; 3
    bvc    LF083                 ; 2³
    lda    $B8                   ; 3
    cmp    #2                    ; 2
    bne    LF083                 ; 2³
    jsr    LFD2D                 ; 6
    inc    $8C                   ; 5
    jsr    LFCB6                 ; 6
    lda    #$E0                  ; 2
    ldx    $B6                   ; 3
    bmi    LF07F                 ; 2³
    lda    #$20                  ; 2
LF07F:
    adc    $8A                   ; 3
    sta    $8A                   ; 3
LF083:
    lda    CXM1P                 ; 3
    bpl    LF0A5                 ; 2³
    lda    $CA                   ; 3
    bne    LF0A5                 ; 2³
    jsr    LFCB6                 ; 6
    lda    $C4                   ; 3
    adc    $8A                   ; 3
    sta    $8A                   ; 3
    lda    $C1                   ; 3
    adc    $87                   ; 3
    sta    $87                   ; 3
    lda    #$FF                  ; 2
    sta    $CA                   ; 3
    cmp    $C8                   ; 3
    bne    LF0A5                 ; 2³
    jsr    LFD25                 ; 6
LF0A5:
    lda    CXPPMM                ; 3
    bpl    LF0D0                 ; 2³
    lda    $86                   ; 3
    cmp    #$27                  ; 2
    bcs    LF0E0                 ; 2³
    lda    $8C                   ; 3
    beq    LF0E0                 ; 2³
    lda    $A7                   ; 3
    bne    LF0E0                 ; 2³
    lda    $EA                   ; 3
    and    #$08                  ; 2
    beq    LF0E0                 ; 2³
    ldx    $AE                   ; 3
    lda    $98,X                 ; 4
    clc                          ; 2
    adc    #$18                  ; 2
    sta    $98,X                 ; 4
    ldy    #2                    ; 2
    lda    $9D,X                 ; 4
    jsr    LFC1B                 ; 6
    jsr    LFCCA                 ; 6
LF0D0:
    lda    CXM0P                 ; 3
    bpl    LF0E0                 ; 2³
    lda    $BC                   ; 3
    cmp    #$27                  ; 2
    bcs    LF0E0                 ; 2³
    jsr    LFC0B                 ; 6
    jsr    LF9FC                 ; 6
LF0E0:
    bit    CXM0FB                ; 3
    bvc    LF101                 ; 2³+1
    ldx    $B8                   ; 3
    dex                          ; 2
    beq    LF0EE                 ; 2³
    dex                          ; 2
    beq    LF0F6                 ; 2³
    bne    LF101                 ; 3+1   always branch

LF0EE:
    lda    CXPPMM                ; 3
    bmi    LF101                 ; 2³+1
    brk                          ; 7
    .byte $0A   ; $F0F3

    inc    $A7                   ; 5
LF0F6:
    ldy    #6                    ; 2
    jsr    LFCCF                 ; 6
    jsr    LF9FC                 ; 6
    jsr    LFD2D                 ; 6
LF101:
    lda    CXP0FB                ; 3
    bpl    LF11F                 ; 2³
    lda    $86                   ; 3
    cmp    #$26                  ; 2
    bcc    LF11F                 ; 2³
    lda    $8D                   ; 3
    bne    LF11F                 ; 2³
    dec    $86                   ; 5
    lda    $87                   ; 3
    bmi    LF11F                 ; 2³
    sbc    #$0A                  ; 2
    sta    $87                   ; 3
    lda    $EB                   ; 3
    bne    LF11F                 ; 2³
    brk                          ; 7
    .byte $07   ; $F11E

LF11F:
    bit    CXPPMM                ; 3
    bvc    LF135                 ; 2³
    ldx    $C8                   ; 3
    inx                          ; 2
    bne    LF135                 ; 2³
    jsr    LFD25                 ; 6
    jsr    LF9FC                 ; 6
    sta    $CA                   ; 3
    ldy    #8                    ; 2
    jsr    LFCCF                 ; 6
LF135:
    lda    SWCHB                 ; 4
    sta    $F7                   ; 3
    eor    $F0                   ; 3
    sta    $F8                   ; 3
    beq    LF14F                 ; 2³
    jsr    LFCFA                 ; 6
    lda    $F8                   ; 3
    ldx    $EC                   ; 3
    and    LFE70,X               ; 4
    beq    LF14F                 ; 2³
    jsr    LFD0C                 ; 6
LF14F:
    lda    $F7                   ; 3
    and    #$02                  ; 2
    beq    LF18A                 ; 2³
    lda    $F8                   ; 3
    and    #$01                  ; 2
    beq    LF1AA                 ; 2³
    lda    $F7                   ; 3
    and    #$01                  ; 2
    beq    LF166                 ; 2³
    jsr    LF76E                 ; 6
    beq    LF1AA                 ; 2³
LF166:
    jsr    LF770                 ; 6
    sta    $EC                   ; 3
    sta    $E2                   ; 3
    sta    $E0                   ; 3
    sta    $E3                   ; 3
    sta    $E1                   ; 3
    lda    #4                    ; 2
    sta    $ED                   ; 3
    sta    $EE                   ; 3
    lda    $EA                   ; 3
    and    #$03                  ; 2
    tay                          ; 2
    lda    LFFF8,Y               ; 4
    sta    $AF                   ; 3
    sta    $B0                   ; 3
    jsr    LFBDD                 ; 6
    bne    LF1AA                 ; 3   always branch

LF18A:
    lda    $F8                   ; 3
    and    #$02                  ; 2
    bne    LF194                 ; 2³
    dec    $F4                   ; 5
    bne    LF1AA                 ; 2³
LF194:
    inc    $EA                   ; 5
    lda    $EA                   ; 3
    and    #$1F                  ; 2
    sta    $EA                   ; 3
    jsr    LF763                 ; 6
    ldx    #$1E                  ; 2
    lda    $F7                   ; 3
    lsr                          ; 2
    bcs    LF1A8                 ; 2³
    ldx    #$0A                  ; 2
LF1A8:
    stx    $F4                   ; 3
LF1AA:
    lda    $F7                   ; 3
    sta    $F0                   ; 3
    jsr    LF6E0                 ; 6
    jsr    LFD6C                 ; 6
    ldx    $EB                   ; 3
    beq    LF1CE                 ; 2³
    cpx    #4                    ; 2
    bne    LF1CC                 ; 2³
    lda    largeCounter          ; 3
    cmp    #2                    ; 2
    bcc    LF1CC                 ; 2³
    ldx    #0                    ; 2
    stx    $8D                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    bne    LF1CE                 ; 2³
LF1CC:
    lda    #$F0                  ; 2
LF1CE:
    ldx    $8D                   ; 3
    beq    LF1D4                 ; 2³
    lda    #$D0                  ; 2
LF1D4:
    ldx    #$86                  ; 2
    jsr    LFD78                 ; 6
    ldx    #$86                  ; 2
    jsr    LFDDF                 ; 6
    lda    $86                   ; 3
    cmp    #$43                  ; 2
    bcc    LF1EB                 ; 2³
    jsr    LFCA9                 ; 6
    lda    #$42                  ; 2
    sta    $86                   ; 3
LF1EB:
    cmp    #2                    ; 2
    bcs    LF1F6                 ; 2³
    lda    #2                    ; 2
    sta    $86                   ; 3
    jsr    LFCAF                 ; 6
LF1F6:
    ldx    #$89                  ; 2
    jsr    LFDDF                 ; 6
    lda    $8A                   ; 3
    clc                          ; 2
    bpl    LF201                 ; 2³
    sec                          ; 2
LF201:
    ror                          ; 2
    clc                          ; 2
    adc    #$64                  ; 2
    sec                          ; 2
    sbc    $89                   ; 3
    tay                          ; 2
    beq    LF259                 ; 2³
    bpl    LF215                 ; 2³
    cpy    #$FC                  ; 2
    bcs    LF25B                 ; 2³
    ldy    #$FC                  ; 2
    bmi    LF25B                 ; 3   always branch

LF215:
    cpy    #5                    ; 2
    bcc    LF21B                 ; 2³
    ldy    #4                    ; 2
LF21B:
    inc    $89                   ; 5
    inc    $C3                   ; 5
    inc    $B5                   ; 5
    dec    $E6                   ; 5
    ldx    $E6                   ; 3
    inx                          ; 2
    bne    LF230                 ; 2³
    dec    $E7                   ; 5
    lda    $E7                   ; 3
    and    #$07                  ; 2
    sta    $E7                   ; 3
LF230:
    lda    $E6                   ; 3
    and    #$01                  ; 2
    bne    LF256                 ; 2³
    ldx    #$D7                  ; 2
    lda    $E6                   ; 3
    and    #$07                  ; 2
    bne    LF240                 ; 2³
    ldx    #$CB                  ; 2
LF240:
    clc                          ; 2
    rol    0,X                   ; 6
    ror    1,X                   ; 6
    rol    2,X                   ; 6
    bcc    LF24F                 ; 2³
    lda    0,X                   ; 4
    ora    #$10                  ; 2
    sta    0,X                   ; 4
LF24F:
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    #$E0                  ; 2
    bne    LF240                 ; 2³
LF256:
    dey                          ; 2
    bne    LF21B                 ; 2³
LF259:
    beq    LF2A2                 ; 3   always branch

LF25B:
    dec    $89                   ; 5
    dec    $C3                   ; 5
    dec    $B5                   ; 5
    inc    $E6                   ; 5
    bne    LF26D                 ; 2³
    inc    $E7                   ; 5
    lda    $E7                   ; 3
    and    #$07                  ; 2
    sta    $E7                   ; 3
LF26D:
    lda    $E6                   ; 3
    and    #$01                  ; 2
    beq    LF29F                 ; 2³
    ldx    #$D7                  ; 2
    lda    $E6                   ; 3
    and    #$07                  ; 2
    cmp    #1                    ; 2
    bne    LF27F                 ; 2³
    ldx    #$CB                  ; 2
LF27F:
    clc                          ; 2
    ror    2,X                   ; 6
    rol    1,X                   ; 6
    ror    0,X                   ; 6
    lda    0,X                   ; 4
    and    #$08                  ; 2
    beq    LF298                 ; 2³
    lda    2,X                   ; 4
    ora    #$80                  ; 2
    sta    2,X                   ; 4
    lda    0,X                   ; 4
    and    #$F0                  ; 2
    sta    0,X                   ; 4
LF298:
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    cpx    #$E0                  ; 2
    bne    LF27F                 ; 2³
LF29F:
    iny                          ; 2
    bne    LF25B                 ; 2³
LF2A2:
    lda    $89                   ; 3
    jsr    LF000                 ; 6
    ldy    $8A                   ; 3
    dey                          ; 2
    bpl    LF2AD                 ; 2³
    dex                          ; 2
LF2AD:
    stx    REFP0                 ; 3
LF2AF:
    lda    INTIM                 ; 4
    bmi    LF2AF                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$42                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    lda    #$96                  ; 2
    sta    TIM64T                ; 4
    ldy    #0                    ; 2
    lda    ($E8),Y               ; 5
    ldx    $EB                   ; 3
    cpx    #4                    ; 2
    bcc    LF2E5                 ; 2³
    ldx    largeCounter          ; 3
    bne    LF2E5                 ; 2³
    ldx    frameCounter          ; 3
    bmi    LF2E5                 ; 2³
    txa                          ; 2
    asl                          ; 2
LF2E5:
    sta    COLUPF                ; 3
    lda    $EB                   ; 3
    bne    LF352                 ; 2³+1
    ldx    $8D                   ; 3
    beq    LF2F9                 ; 2³
    inx                          ; 2
    stx    $8D                   ; 3
    cpx    #$40                  ; 2
    bne    LF2F9                 ; 2³
    jsr    LF774                 ; 6
LF2F9:
    ldx    $A7                   ; 3
    beq    LF307                 ; 2³+1
    inx                          ; 2
    stx    $A7                   ; 3
    cpx    #$40                  ; 2
    bne    LF307                 ; 2³
    jsr    LFC42                 ; 6
LF307:
    ldx    #4                    ; 2
LF309:
    lda    $9D,X                 ; 4
    beq    LF34C                 ; 2³
    cpx    $AE                   ; 3
    bne    LF315                 ; 2³
    lda    $A7                   ; 3
    bne    LF34C                 ; 2³
LF315:
    cpx    #4                    ; 2
    beq    LF329                 ; 2³
    lda    $8F,X                 ; 4
    sec                          ; 2
    sbc    $8E,X                 ; 4
    tay                          ; 2
    lda    $94,X                 ; 4
    sbc    $93,X                 ; 4
    bne    LF329                 ; 2³
    cpy    #$C5                  ; 2
    bcc    LF34C                 ; 2³
LF329:
    dec    $A2,X                 ; 6
    bne    LF34C                 ; 2³
    inc    $8E,X                 ; 6
    bne    LF333                 ; 2³
    inc    $93,X                 ; 6
LF333:
    jsr    LFC83                 ; 6
    adc    #3                    ; 2
    sta    $A2,X                 ; 4
    cpx    $AE                   ; 3
    bne    LF34C                 ; 2³
    dec    $AA                   ; 5
    bpl    LF34C                 ; 2³
    lda    #3                    ; 2
    sta    $AA                   ; 3
    stx    $F5                   ; 3
    brk                          ; 7
    .byte $01   ; $F349

    ldx    $F5                   ; 3
LF34C:
    dex                          ; 2
    bpl    LF309                 ; 2³
    jsr    LF7A2                 ; 6
LF352:
    ldx    #4                    ; 2
LF354:
    lda    $9D,X                 ; 4
    beq    LF3B0                 ; 2³
    lda    $8E,X                 ; 4
    sec                          ; 2
    sbc    $E6                   ; 3
    sta    $AD                   ; 3
    sta    $F5                   ; 3
    lda    $93,X                 ; 4
    sbc    $E7                   ; 3
    beq    LF394                 ; 2³
    tay                          ; 2
    iny                          ; 2
    bne    LF3B0                 ; 2³
    lda    $AD                   ; 3
    bpl    LF3B0                 ; 2³
    clc                          ; 2
    adc    #$20                  ; 2
    bmi    LF3B0                 ; 2³
    eor    #$1F                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LFFB0,Y               ; 4
    sta    $A9                   ; 3
    lda    LFFC0,Y               ; 4
    sta    $AB                   ; 3
    lda    $AD                   ; 3
    clc                          ; 2
    adc    #$A0                  ; 2
    sta    $F5                   ; 3
    bne    LF3C1                 ; 2³
LF38C:
    lda    #$FF                  ; 2
    sta    $A9                   ; 3
    sta    $AB                   ; 3
    bne    LF3C1                 ; 3   always branch

LF394:
    lda    $AD                   ; 3
    bpl    LF38C                 ; 2³
    cmp    #$A0                  ; 2
    bcs    LF3B0                 ; 2³
    and    #$7F                  ; 2
    eor    #$1F                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LFFB8,Y               ; 4
    sta    $A9                   ; 3
    lda    LFFC8,Y               ; 4
    sta    $AB                   ; 3
    jmp    LF3C1                 ; 3
LF3B0:
    dex                          ; 2
    bpl    LF354                 ; 2³
    inx                          ; 2
    stx    $A9                   ; 3
    stx    $AB                   ; 3
    lda    $A7                   ; 3
    beq    LF3CA                 ; 2³
    jsr    LFC42                 ; 6
    bne    LF3CA                 ; 3   always branch

LF3C1:
    stx    $AE                   ; 3
    lda    $F5                   ; 3
    ldx    #1                    ; 2
    jsr    LF002                 ; 6
LF3CA:
    lda    INTIM                 ; 4
    bmi    LF3CA                 ; 2³
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    lda    #$9F                  ; 2
    sta    TIM64T                ; 4
    jsr    LF7CC                 ; 6
    jsr    LFA8B                 ; 6
    jsr    LF9AC                 ; 6
    jsr    LFA01                 ; 6
    ldx    #1                    ; 2
LF3E8:
    lda    $82,X                 ; 4
    sta    AUDV0,X               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDC0,X               ; 4
    lda    $84,X                 ; 4
    sta    AUDF0,X               ; 4
    dex                          ; 2
    bpl    LF3E8                 ; 2³
LF3F9:
    lda    INTIM                 ; 4
    bmi    LF3F9                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    $F7                   ; 3
    ldy    #1                    ; 2
    lda    ($E8),Y               ; 5
    sta    COLUBK                ; 3
    lda    frameCounter          ; 3
    asl                          ; 2
    ldx    $A7                   ; 3
    bne    LF41C                 ; 2³
    ldx    $AE                   ; 3
    lda    $98,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    #6                    ; 2
    tay                          ; 2
    lda    ($E8),Y               ; 5
LF41C:
    sta    COLUP1                ; 3
    lda    frameCounter          ; 3
    ldx    $8C                   ; 3
    beq    LF42C                 ; 2³
    ldy    #4                    ; 2
    dex                          ; 2
    beq    LF42A                 ; 2³
    iny                          ; 2
LF42A:
    lda    ($E8),Y               ; 5
LF42C:
    sta    COLUP0                ; 3
    ldy    #3                    ; 2
    lda    ($E8),Y               ; 5
    sta    $F6                   ; 3
    ldx    $B8                   ; 3
    cpx    #2                    ; 2
    bcs    LF43C                 ; 2³
    lda    frameCounter          ; 3
LF43C:
    sta    $F5                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$30                  ; 2
    sta    NUSIZ0                ; 3
    lda    #$37                  ; 2
    sta    NUSIZ1                ; 3
    lda    #$20                  ; 2
    sta    CTRLPF                ; 3
    lda    $A8                   ; 3
    lsr                          ; 2
    tay                          ; 2
    lda    LFE5A,Y               ; 4
    sta    $FA                   ; 3
    lda    $8D                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$46                  ; 2
    sta    $FC                   ; 3
    lda    #$FE                  ; 2
    sta    $FB                   ; 3
    sta    $FD                   ; 3
    sta    CXCLR                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
LF46B:
    jsr    LF6AD                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $F7                   ; 3
    sec                          ; 2
    sbc    #8                    ; 2
    bne    LF46B                 ; 2³
    sta    $F8                   ; 3
LF479:
    jsr    LF6AD                 ; 6
    ldy    $F8                   ; 3
    lda.wy $CB,Y                 ; 4
    iny                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    lda.wy $CB,Y                 ; 4
    sta    PF1                   ; 3
    iny                          ; 2
    lda.wy $CB,Y                 ; 4
    sta    PF2                   ; 3
    iny                          ; 2
    sty    $F8                   ; 3
    jsr    LF6AD                 ; 6
    lda    $F7                   ; 3
    sec                          ; 2
    sbc    #$10                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    bne    LF479                 ; 2³
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    #$14                  ; 2
    sta    CTRLPF                ; 3
    lda    $F5                   ; 3
    sta    COLUPF                ; 3
LF4AE:
    jsr    LF6AD                 ; 6
    lda    $F7                   ; 3
    sec                          ; 2
    sbc    #$1A                  ; 2
    tay                          ; 2
    and    #$F0                  ; 2
    beq    LF4BF                 ; 2³
    lda    #0                    ; 2
    beq    LF4C3                 ; 3   always branch

LF4BF:
    lda    ($FA),Y               ; 5
    and    $A9                   ; 3
LF4C3:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    lda    $F7                   ; 3
    cmp    #$26                  ; 2
    bne    LF4AE                 ; 2³
    jsr    LF6AD                 ; 6
    sta    HMCLR                 ; 3
    lda    #$C0                  ; 2
    sta    HMP1                  ; 3
    ldx    #$35                  ; 2
    ldy    $AA                   ; 3
    lda    LFE5E,Y               ; 4
    sta    $FA                   ; 3
    ldy    #0                    ; 2
    lda    ($FA),Y               ; 5
    and    $AB                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    stx    NUSIZ1                ; 3
    sta    GRP1                  ; 3
    ldy    #2                    ; 2
    lda    ($E8),Y               ; 5
    sta    COLUBK                ; 3
LF4F3:
    jsr    LF6AD                 ; 6
    lda    $F7                   ; 3
    sec                          ; 2
    sbc    #$26                  ; 2
    tay                          ; 2
    and    #$F0                  ; 2
    beq    LF504                 ; 2³
    lda    #0                    ; 2
    beq    LF508                 ; 3   always branch

LF504:
    lda    ($FA),Y               ; 5
    and    $AB                   ; 3
LF508:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    lda    $F7                   ; 3
    sec                          ; 2
    sbc    #$3E                  ; 2
    bne    LF4F3                 ; 2³+1
    sta    $F8                   ; 3
    lda    $F6                   ; 3
    sta    COLUPF                ; 3
LF519:
    jsr    LF6AD                 ; 6
    ldy    $F8                   ; 3
    lda.wy $D7,Y                 ; 4
    iny                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    lda.wy $D7,Y                 ; 4
    sta    PF1                   ; 3
    iny                          ; 2
    lda.wy $D7,Y                 ; 4
    sta    PF2                   ; 3
    iny                          ; 2
    sty    $F8                   ; 3
    jsr    LF6AD                 ; 6
    lda    $F7                   ; 3
    cmp    #$44                  ; 2
    bne    LF519                 ; 2³
    ldy    #3                    ; 2
    lda    ($E8),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    ldx    #$FF                  ; 2
    stx    PF0                   ; 3
    inx                          ; 2
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    stx    GRP0                  ; 3
    stx    ENAM1                 ; 3
    stx    REFP0                 ; 3
    lda    #5                    ; 2
    sta    CTRLPF                ; 3
    sta    NUSIZ1                ; 3
    ldy    #$0D                  ; 2
    lda    ($E8),Y               ; 5
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$10                  ; 2
    sta    NUSIZ0                ; 3
    lda    $E6                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $F5                   ; 3
    lda    $E7                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    $F5                   ; 3
    adc    #$10                  ; 2
    inx                          ; 2
    jsr    LF002                 ; 6
    ldx    $F1                   ; 3
    dex                          ; 2
    bpl    LF583                 ; 2³
    ldx    #4                    ; 2
LF583:
    stx    $F1                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $8E,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $F5                   ; 3
    lda    $93,X                 ; 4
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    $F5                   ; 3
    adc    #$11                  ; 2
    ldx    #2                    ; 2
    jsr    LF002                 ; 6
    ldy    #$0C                  ; 2
    lda    ($E8),Y               ; 5
    sta    COLUBK                ; 3
    ldx    #$0D                  ; 2
LF5A6:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    RadarCursor,X         ; 4
    sta    ENAM0                 ; 3
    and    #$F8                  ; 2
    sta    GRP1                  ; 3
    dex                          ; 2
    bpl    LF5A6                 ; 2³
    ldy    #3                    ; 2
    lda    ($E8),Y               ; 5
    sta    COLUBK                ; 3
    ldx    $EC                   ; 3
    ldy    $EB                   ; 3
    dey                          ; 2
    bne    LF5C3                 ; 2³
    ldx    #2                    ; 2
LF5C3:
    lda    LFFE3,X               ; 4
    sta    $F9                   ; 3
    lda    LFFE0,X               ; 4
    sta    $F5                   ; 3
    jsr    LF000                 ; 6
    lda    $F5                   ; 3
    clc                          ; 2
    adc    #8                    ; 2
    inx                          ; 2
    jsr    LF002                 ; 6
    ldy    #$0E                  ; 2
    lda    ($E8),Y               ; 5
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    stx    NUSIZ0                ; 3
    stx    NUSIZ1                ; 3
    stx    CTRLPF                ; 3
    lda    #$50                  ; 2
    sta    $F5                   ; 3
    sta    $F6                   ; 3
    sta    $F7                   ; 3
    sta    $F8                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    $EB                   ; 3
    dex                          ; 2
    beq    LF62D                 ; 2³+1
    dex                          ; 2
    dex                          ; 2
    beq    LF65C                 ; 2³+1
    ldx    $EC                   ; 3
    ldy    #0                    ; 2
LF600:
    lda    $E0,X                 ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta.wy $F6,Y                 ; 5
    lda    $E0,X                 ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    sta.wy $F5,Y                 ; 5
    inx                          ; 2
    inx                          ; 2
    iny                          ; 2
    iny                          ; 2
    cpy    #4                    ; 2
    bcc    LF600                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #0                    ; 2
LF61E:
    lda    $F5,X                 ; 4
    bne    LF66E                 ; 2³
    lda    #$50                  ; 2
    sta    $F5,X                 ; 4
    inx                          ; 2
    cpx    #3                    ; 2
    bmi    LF61E                 ; 2³
    bpl    LF66E                 ; 3   always branch

LF62D:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #0                    ; 2
    ldx    $EA                   ; 3
    inx                          ; 2
    txa                          ; 2
    ldx    #$58                  ; 2
    cmp    #$11                  ; 2
    bcc    LF63D                 ; 2³
    ldx    #$60                  ; 2
LF63D:
    stx    $F5                   ; 3
LF63F:
    cmp    #$0A                  ; 2
    bcc    LF649                 ; 2³
    iny                          ; 2
    sec                          ; 2
    sbc    #$0A                  ; 2
    bpl    LF63F                 ; 2³
LF649:
    sta    WSYNC                 ; 3
;---------------------------------------
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $F8                   ; 3
    tya                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    bne    LF658                 ; 2³
    lda    #$50                  ; 2
LF658:
    sta    $F7                   ; 3
    bne    LF66E                 ; 3   always branch

LF65C:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    $EC                   ; 3
    ldy    $ED,X                 ; 4
LF662:
    dey                          ; 2
    bmi    LF66C                 ; 2³
    lda    #$68                  ; 2
    sta.wy $F5,Y                 ; 5
    bne    LF662                 ; 3   always branch

LF66C:
    sta    WSYNC                 ; 3
;---------------------------------------
LF66E:
    ldx    #7                    ; 2   use the stack pointer as the counter,
    txs                          ; 2   exit after going 8 times through loop
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    $F9                   ; 3
LF675:
    dey                          ; 2
    bpl    LF675                 ; 2³
LF678:
    ldy    $F5                   ; 3
    lda    LFF00,Y               ; 4
    sta    GRP0                  ; 3
    ldy    $F6                   ; 3
    lda    LFF00,Y               ; 4
    sta    GRP1                  ; 3
    ldy    $F7                   ; 3
    lda    LFF00,Y               ; 4
    tax                          ; 2
    ldy    $F8                   ; 3
    lda    LFF00,Y               ; 4
    stx    GRP0                  ; 3
    sta    GRP1                  ; 3
    inc    $F5                   ; 5
    inc    $F6                   ; 5
    inc    $F7                   ; 5
    inc    $F8                   ; 5
    inc    $F9                   ; 5
    tsx                          ; 2
    dex                          ; 2
    txs                          ; 2   stack is restored to $FF afer final loop
    bpl    LF678                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    PF1                   ; 3   #$FF
    stx    PF2                   ; 3   #$FF
    jmp    MainLoop              ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;when the AT-AT laser hits the SnowSpeeder,
;a black damage cloud is displayed on screen

LF6AD SUBROUTINE
    inc    $F7                   ; 5
    ldx    #$1F                  ; 2
    txs                          ; 2   align stack pointer to use PHP on the 3 ENAxx registers
    lda    $F7                   ; 3
    sec                          ; 2
    sbc    $86                   ; 3
    tay                          ; 2
    and    #$FC                  ; 2
    beq    LF6C0                 ; 2³
    ldx    #0                    ; 2
    beq    LF6C3                 ; 3   always branch

LF6C0:
    lda    ($FC),Y               ; 5
    tax                          ; 2
LF6C3:
    lda    $B2                   ; 3
    sec                          ; 2
    sbc    $F7                   ; 3
    and    #$FE                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
;draw the black damage cloud
    php                          ; 3   enable ball with Zero Flag
    stx    GRP0                  ; 3
    lda    $C0                   ; 3
    sec                          ; 2
    sbc    $F7                   ; 3
    and    $C8                   ; 3
    php                          ; 3   enable missile 1 with Zero Flag
    lda    $BC                   ; 3
    eor    $F7                   ; 3
    php                          ; 3   enable missile 2 with Zero Flag
    ldx    #$FD                  ; 2
    txs                          ; 2   return stack pointer
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF6E0 SUBROUTINE
    ldx    $EB                   ; 3
    beq    LF762                 ; 2³+1
    dex                          ; 2
    beq    LF74A                 ; 2³+1
    dex                          ; 2
    beq    LF70B                 ; 2³+1
    dex                          ; 2
    beq    LF733                 ; 2³+1
    lda    frameCounter          ; 3
    ora    #$80                  ; 2
    tax                          ; 2
    inx                          ; 2
    bne    LF74A                 ; 2³+1
    lda    $EA                   ; 3
    cmp    #$10                  ; 2
    bcc    LF74A                 ; 2³+1
    lda    $EC                   ; 3
    eor    #$01                  ; 2
    sta    $EC                   ; 3
    tax                          ; 2
    lda    $ED,X                 ; 4
    bmi    LF74A                 ; 2³
    jsr    LFBDD                 ; 6
    bne    LF76E                 ; 3   always branch

LF70B:
    lda    frameCounter          ; 3
    cmp    #$3C                  ; 2
    bcc    LF762                 ; 2³
    dec    $F4                   ; 5
    bpl    LF76E                 ; 2³
    inc    $F4                   ; 5
    ldx    $EC                   ; 3
    dec    $ED,X                 ; 6
    bmi    LF778                 ; 2³
    lda    $EA                   ; 3
    cmp    #$10                  ; 2
    bcc    LF76E                 ; 2³
    lda    $EC                   ; 3
    eor    #$01                  ; 2
    tax                          ; 2
    lda    $ED,X                 ; 4
    bmi    LF72E                 ; 2³
    stx    $EC                   ; 3
LF72E:
    jsr    LFBDD                 ; 6
    bne    LF76E                 ; 3   always branch

LF733:
    lda    largeCounter          ; 3
    bne    LF73D                 ; 2³
    lda    frameCounter          ; 3
    cmp    #$1E                  ; 2
    bcc    LF74A                 ; 2³
LF73D:
    jsr    LFD6C                 ; 6
    and    #$F0                  ; 2
    cmp    #$F0                  ; 2
    bne    LF76A                 ; 2³
    lda    INPT4,X               ; 4
    bpl    LF76A                 ; 2³
LF74A:
    lda    $F3                   ; 3
    bne    LF756                 ; 2³
    lda    largeCounter          ; 3
    cmp    #$1E                  ; 2
    bcc    LF762                 ; 2³
    sta    $F3                   ; 3
LF756:
    lda    frameCounter          ; 3
    bne    LF762                 ; 2³
    ldx    $E8                   ; 3
    inx                          ; 2
    txa                          ; 2
    and    #$7F                  ; 2
    sta    $E8                   ; 3
LF762:
    rts                          ; 6

LF763 SUBROUTINE
    jsr    LFBDD                 ; 6
    lda    #1                    ; 2
    bne    LF784                 ; 3   always branch

LF76A:
    lda    #0                    ; 2
    beq    LF784                 ; 3   always branch

LF76E SUBROUTINE   ; mostly branched to
    brk                          ; 7
    .byte $0D   ; $F76F

LF770 SUBROUTINE
    lda    #3                    ; 2
    bne    LF784                 ; 3   always branch

LF774 SUBROUTINE
    lda    #2                    ; 2
    bne    LF78E                 ; 3   always branch

LF778:
    brk                          ; 7
    .byte $0F   ; $F779

    lda    #$FF                  ; 2
    ldx    $EC                   ; 3
    sta    $ED,X                 ; 4
    lda    #4                    ; 2
    bne    LF78E                 ; 3   always branch

LF784:
    sta    $EB                   ; 3
    jsr    LFBCB                 ; 6
    jsr    LFC8A                 ; 6
    beq    LF790                 ; 3   always branch

LF78E:
    sta    $EB                   ; 3
LF790:
    jsr    LF9F8                 ; 6
    jsr    LFA6F                 ; 6
    jsr    LFCFA                 ; 6
    lda    #0                    ; 2
    sta    frameCounter          ; 3
    sta    largeCounter          ; 3
    sta    $F3                   ; 3
    rts                          ; 6

LF7A2 SUBROUTINE
    ldx    #4                    ; 2
    lda    $9D,X                 ; 4
    beq    LF7CB                 ; 2³
    lda    $93,X                 ; 4
    cmp    #7                    ; 2
    bne    LF7CB                 ; 2³
    lda    $8E,X                 ; 4
    tax                          ; 2
    cpx    #$E0                  ; 2
    bcs    LF778                 ; 2³
    lda    #$3F                  ; 2
    cpx    #$A0                  ; 2
    bcc    LF7C5                 ; 2³
    lda    frameCounter          ; 3
    and    #$07                  ; 2
    bne    LF7C3                 ; 2³
    sta    COLUPF                ; 3
LF7C3:
    lda    #$1F                  ; 2
LF7C5:
    and    frameCounter          ; 3
    bne    LF7CB                 ; 2³
    brk                          ; 7
    .byte $05   ; $F7CA

LF7CB:
    rts                          ; 6

LF7CC SUBROUTINE
    lda    frameCounter          ; 3
    and    #$03                  ; 2
    tax                          ; 2
    bne    LF7D6                 ; 2³
    jmp    LF8CB                 ; 3
LF7D6:
    lda    $EB                   ; 3
    beq    LF7DB                 ; 2³
    rts                          ; 6

LF7DB:
    dex                          ; 2
    beq    LF811                 ; 2³+1
    dex                          ; 2
    beq    LF836                 ; 2³+1
    ldx    #$FF                  ; 2
    stx    $F5                   ; 3
    inx                          ; 2
LF7E6:
    lda    $9D,X                 ; 4
    bne    LF7EC                 ; 2³
    stx    $F5                   ; 3
LF7EC:
    ldy    $93,X                 ; 4
    dey                          ; 2
    beq    LF835                 ; 2³+1
    inx                          ; 2
    cpx    #5                    ; 2
    bcc    LF7E6                 ; 2³
    ldx    $F5                   ; 3
    cpx    #$FF                  ; 2
    beq    LF835                 ; 2³+1
    ldy    #0                    ; 2
    sty    $98,X                 ; 4
    sty    $8E,X                 ; 4
    iny                          ; 2
    sty    $A2,X                 ; 4
    sty    $93,X                 ; 4
    ldy    $EC                   ; 3
    lda.wy $AF,Y                 ; 4
    sta    $9D,X                 ; 4
    jmp    LFC6A                 ; 3

LF811:
    dec    $AC                   ; 5
    bne    LF835                 ; 2³
    ldx    $AE                   ; 3
    jsr    LFC83                 ; 6
    adc    #2                    ; 2
    sta    $AC                   ; 3
    ldx    #0                    ; 2
    lda    $86                   ; 3
LF822:
    cmp    LFFF0,X               ; 4
    bcc    LF82A                 ; 2³
    inx                          ; 2
    bne    LF822                 ; 2³
LF82A:
    cpx    $A8                   ; 3
    beq    LF835                 ; 2³
    bcs    LF833                 ; 2³
    dec    $A8                   ; 5
    rts                          ; 6

LF833:
    inc    $A8                   ; 5
LF835:
    rts                          ; 6

LF836:
    lda    $A9                   ; 3
    beq    LF88B                 ; 2³
    lda    $A7                   ; 3
    ora    $C6                   ; 3
    bne    LF88B                 ; 2³
    dec    $C9                   ; 5
    bne    LF88B                 ; 2³
    sta    $C2                   ; 3
    sta    $C5                   ; 3
    sta    $CA                   ; 3
    lda    #2                    ; 2
    sta    $C6                   ; 3
    ldy    $A8                   ; 3
    jsr    LFE03                 ; 6
    and    #$03                  ; 2
    clc                          ; 2
    adc    LFE62,Y               ; 4
    sta    $C1                   ; 3
    bpl    LF862                 ; 2³
    adc    #$28                  ; 2
    jmp    LF868                 ; 3
LF862:
    sta    $C4                   ; 3
    lda    #$28                  ; 2
    sbc    $C4                   ; 3
LF868:
    sta    $C4                   ; 3
    lda    $AD                   ; 3
    clc                          ; 2
    adc    #$20                  ; 2
    sta    $C3                   ; 3
    cmp    $89                   ; 3
    bcc    LF87B                 ; 2³
    lda    $C4                   ; 3
    eor    #$FF                  ; 2
    sta    $C4                   ; 3
LF87B:
    lda    $A8                   ; 3
    lsr                          ; 2
    clc                          ; 2
    adc    #$1E                  ; 2
    ldx    $F2                   ; 3
    bpl    LF887                 ; 2³
    adc    #1                    ; 2
LF887:
    sta    $C0                   ; 3
    brk                          ; 7
    .byte $06   ; $F88A

LF88B:
    lda    $8D                   ; 3
    bne    LF8CA                 ; 2³
    lda    frameCounter          ; 3
    and    #$FC                  ; 2
    bne    LF8AC                 ; 2³
    lda    largeCounter          ; 3
    and    #$1F                  ; 2
    cmp    #$10                  ; 2
    beq    LF8A2                 ; 2³
    cmp    #$15                  ; 2
    beq    LF8C6                 ; 2³
    rts                          ; 6

LF8A2:
    lda    #0                    ; 2
    sta    $8C                   ; 3
    lda    #2                    ; 2
    sta    $EF                   ; 3
    brk                          ; 7
    .byte $80   ; $F8AB

LF8AC:
    and    #$3C                  ; 2
    cmp    #$10                  ; 2
    bne    LF8CA                 ; 2³
    lda    $8C                   ; 3
    cmp    #2                    ; 2
    bcc    LF8CA                 ; 2³
    lda    $EF                   ; 3
    beq    LF8CA                 ; 2³
    lda    $86                   ; 3
    cmp    #$42                  ; 2
    bne    LF8CA                 ; 2³
    dec    $EF                   ; 5
    brk                          ; 7
    .byte $0C   ; $F8C5

LF8C6:
    lda    #1                    ; 2
    sta    $8C                   ; 3
LF8CA:
    rts                          ; 6

LF8CB:
    ldx    #1                    ; 2
LF8CD:
    ldy    $80,X                 ; 4
    beq    LF946                 ; 2³+1
    bpl    LF8D9                 ; 2³
    lda    frameCounter          ; 3
    and    #$07                  ; 2
    beq    LF946                 ; 2³+1
LF8D9:
    lda    $84,X                 ; 4
    and    #$1F                  ; 2
    sta    $F5                   ; 3
    lda    $84,X                 ; 4
    sec                          ; 2
    sbc    #$20                  ; 2
    and    #$E0                  ; 2
    sta    $F6                   ; 3
    bne    LF936                 ; 2³+1
    ldy    $80,X                 ; 4
    bmi    LF94A                 ; 2³+1
    lda    LFF80,Y               ; 4
    and    #$E0                  ; 2
    sta    $F6                   ; 3
    lda    LFF90,Y               ; 4
    and    #$0F                  ; 2
    sta    $F8                   ; 3
    lda    LFF90,Y               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    $82,X                 ; 4
    and    #$0F                  ; 2
    cmp    $F8                   ; 3
    beq    LF93E                 ; 2³
    sta    $F7                   ; 3
    lda    $82,X                 ; 4
    and    #$F0                  ; 2
    ora    $F7                   ; 3
    sta    $82,X                 ; 4
    lda    LFFA0,Y               ; 4
    and    #$1F                  ; 2
    sta    $F8                   ; 3
    lda    LFFA0,Y               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    cmp    #4                    ; 2
    bcc    LF92B                 ; 2³
    ora    #$F8                  ; 2
LF92B:
    clc                          ; 2
    adc    $F5                   ; 3
    and    #$1F                  ; 2
    cmp    $F8                   ; 3
    beq    LF93E                 ; 2³
    sta    $F5                   ; 3
LF936:
    lda    $F5                   ; 3
    ora    $F6                   ; 3
    sta    $84,X                 ; 4
    bne    LF946                 ; 2³
LF93E:
    lda    #0                    ; 2
    sta    $80,X                 ; 4
    sta    $82,X                 ; 4
    sta    $84,X                 ; 4
LF946:
    dex                          ; 2
    bpl    LF8CD                 ; 2³+1
    rts                          ; 6

LF94A:
    lda    $EB                   ; 3
    cmp    #4                    ; 2
    bcs    LF93E                 ; 2³
    inc    $80,X                 ; 6
    lda    $80,X                 ; 4
    and    #$1F                  ; 2
    tay                          ; 2
    cmp    #$12                  ; 2
    bne    LF96D                 ; 2³
    ldy    $8C                   ; 3
    bne    LF93E                 ; 2³
    lda    $80,X                 ; 4
    clc                          ; 2
    adc    #$0E                  ; 2
    cmp    #$E0                  ; 2
    beq    LF93E                 ; 2³
    sta    $80,X                 ; 4
    and    #$1F                  ; 2
    tay                          ; 2
LF96D:
    jsr    LF99B                 ; 6
    bne    LF946                 ; 2³   probably always branch

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;jumped to using break,
;each BRK has a byte underneath it
;which is used to look up tables

LF972:   ;break
    plp                          ; 4   increase stack pointer
    tsx                          ; 2
    inx                          ; 2
    dec    0,X                   ; 6   fix the return address to use RTS
    lda    ($00,X)               ; 6   load the byte that followed BRK
    tay                          ; 2   use it later for indexing
    ldx    #0                    ; 2
    lda    $80                   ; 3
    cmp    $81                   ; 3
    bcc    LF983                 ; 2³
    inx                          ; 2
LF983:
    tya                          ; 2
    bmi    LF997                 ; 2³
    cmp    $80,X                 ; 4
    bcc    LF996                 ; 2³
    sty    $80,X                 ; 4
    lda    LFF70,Y               ; 4
    sta    $82,X                 ; 4
    lda    LFF80,Y               ; 4
    sta    $84,X                 ; 4
LF996:
    rts                          ; 6

LF997:
    sta    $80,X                 ; 4
    ldy    #0                    ; 2
LF99B SUBROUTINE
    lda    LFEEE,Y               ; 4
    sta    $84,X                 ; 4
    lda    LFEDC,Y               ; 4
    ldy    $8C                   ; 3
    bne    LF9A9                 ; 2³
    and    #$F7                  ; 2
LF9A9:
    sta    $82,X                 ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF9AC SUBROUTINE
    lda    $EB                   ; 3
    ora    $8D                   ; 3
    bne    LF9FC                 ; 2³
    lda    $BF                   ; 3
    beq    LF9B8                 ; 2³
    dec    $BF                   ; 5
LF9B8:
    ldy    $BC                   ; 3
    iny                          ; 2
    bne    LF9DE                 ; 2³
    ldx    $EC                   ; 3
    lda    INPT4,X               ; 4
    bpl    LF9C6                 ; 2³
    sty    $BF                   ; 3
    rts                          ; 6

LF9C6:
    lda    $BF                   ; 3
    bne    LFA00                 ; 2³+1
    jsr    LF9F8                 ; 6
    brk                          ; 7
    .byte $03   ; $F9CE

    ldx    $86                   ; 3
    inx                          ; 2
    stx    $BC                   ; 3
    lda    $8A                   ; 3
    sta    $BE                   ; 3
    ldx    $89                   ; 3
    inx                          ; 2
    txa                          ; 2
    bne    LF9F1                 ; 2³
LF9DE:
    lda    #$F8                  ; 2
    ldx    $BE                   ; 3
    beq    LF9E8                 ; 2³
    bmi    LF9E8                 ; 2³
    lda    #8                    ; 2
LF9E8:
    clc                          ; 2
    adc    $BD                   ; 3
    beq    LF9FC                 ; 2³
    cmp    #$9A                  ; 2
    bcs    LF9FC                 ; 2³
LF9F1:
    sta    $BD                   ; 3
    ldx    #2                    ; 2
    jmp    LF002                 ; 3

LF9F8:
    lda    #$14                  ; 2
    sta    $BF                   ; 3
LF9FC:
    lda    #$FF                  ; 2
    sta    $BC                   ; 3
LFA00:
    rts                          ; 6

LFA01:
    ldx    $C6                   ; 3
    bne    LFA06                 ; 2³
    rts                          ; 6

LFA06:
    lda    $C0                   ; 3
    and    #$7F                  ; 2
    sta    $C0                   ; 3
    cpx    #3                    ; 2
    beq    LFA39                 ; 2³
    lda    $86                   ; 3
    sec                          ; 2
    sbc    $C0                   ; 3
    bpl    LFA19                 ; 2³
    eor    #$FF                  ; 2
LFA19:
    sta    $F5                   ; 3
    lda    $89                   ; 3
    clc                          ; 2
    sbc    $C3                   ; 3
    bpl    LFA24                 ; 2³
    eor    #$FF                  ; 2
LFA24:
    clc                          ; 2
    adc    $F5                   ; 3
    sta    $F5                   ; 3
    cmp    #8                    ; 2
    bcs    LFA42                 ; 2³
    jsr    LFE03                 ; 6
    and    #$07                  ; 2
    cmp    $F5                   ; 3
    bcc    LFA42                 ; 2³
    jsr    LFD25                 ; 6
LFA39:
    ldx    #$C0                  ; 2
    jsr    LFD3A                 ; 6
    beq    LFA6F                 ; 2³
    bne    LFA4C                 ; 3   always branch

LFA42:
    ldx    #$C0                  ; 2
    jsr    LFDDF                 ; 6
    ldx    #$C3                  ; 2
    jsr    LFDDF                 ; 6
LFA4C:
    lda    $C0                   ; 3
    cmp    #1                    ; 2
    bcc    LFA6F                 ; 2³
    cmp    #$44                  ; 2
    bcs    LFA6F                 ; 2³
    lda    $C3                   ; 3
    beq    LFA6F                 ; 2³
    cmp    #$C0                  ; 2
    bcs    LFA6F                 ; 2³
    cmp    #$9A                  ; 2
    bcc    LFA68                 ; 2³
    lda    $C0                   ; 3
    ora    #$80                  ; 2
    sta    $C0                   ; 3
LFA68:
    lda    $C3                   ; 3
    ldx    #3                    ; 2
    jmp    LF002                 ; 3

LFA6F SUBROUTINE
    ldx    $AE                   ; 3
    jsr    LFC83                 ; 6
    asl                          ; 2
    sta    $F5                   ; 3
    jsr    LFE03                 ; 6
    and    #$07                  ; 2
    sec                          ; 2
    adc    $F5                   ; 3
    sta    $C9                   ; 3
    ldx    #0                    ; 2
    stx    $C6                   ; 3
    dex                          ; 2
    stx    $C0                   ; 3
    stx    $C8                   ; 3
    rts                          ; 6

LFA8B SUBROUTINE
    lda    $EB                   ; 3
    beq    LFA92                 ; 2³
    jmp    LFB18                 ; 3
LFA92:
    lda    $B2                   ; 3
    and    #$7F                  ; 2
    sta    $B2                   ; 3
    ldy    $AE                   ; 3
    ldx    $B8                   ; 3
    beq    LFAB1                 ; 2³
    dex                          ; 2
    beq    LFAD4                 ; 2³
    dex                          ; 2
    bne    LFAA7                 ; 2³
    jmp    LFB2E                 ; 3
LFAA7:
    ldx    #$B2                  ; 2
    jsr    LFD3A                 ; 6
    beq    LFB18                 ; 2³+1
    jmp    LFB99                 ; 3
LFAB1:
    lda    $A7                   ; 3
    bne    LFB18                 ; 2³+1
    lda    $A9                   ; 3
    beq    LFB1B                 ; 2³+1
    lda    frameCounter          ; 3
    and    #$03                  ; 2
    bne    LFB1B                 ; 2³+1
    dec    $B9                   ; 5
    bne    LFB1B                 ; 2³+1
    inc    $B8                   ; 5
LFAC5:
    sty    $BB                   ; 3
    lda    $98,X                 ; 4
    adc    #$28                  ; 2
    sta    $B9                   ; 3
    jsr    LFE03                 ; 6
    and    #$07                  ; 2
    sta    $BA                   ; 3
LFAD4:
    cpy    $BB                   ; 3
    beq    LFADE                 ; 2³
    lda    $F2                   ; 3
    bpl    LFAC5                 ; 2³
    bmi    LFB18                 ; 3+1   always branch

LFADE:
    lda    $A9                   ; 3
    bne    LFAE5                 ; 2³
    jmp    LFBBF                 ; 3
LFAE5:
    lda    $A7                   ; 3
    bne    LFB18                 ; 2³+1
    lda    frameCounter          ; 3
    and    #$03                  ; 2
    bne    LFB1C                 ; 2³+1
    dec    $B9                   ; 5
    bne    LFB1C                 ; 2³+1
    lda    $EA                   ; 3
    and    #$04                  ; 2
    beq    LFB18                 ; 2³+1
    jsr    LFE03                 ; 6
    ldx    $EC                   ; 3
    lda    $AF,X                 ; 4
    asl                          ; 2
    adc    #$46                  ; 2
    cmp    $F2                   ; 3
    bcs    LFB18                 ; 2³
    inc    $B8                   ; 5
    ldx    $EC                   ; 3
    lda    $AF,X                 ; 4
    eor    #$3F                  ; 2
    adc    #$1E                  ; 2
    sta    $B9                   ; 3
    brk                          ; 7
    .byte $0B   ; $FB14

    jmp    LFB99                 ; 3
LFB18:
    jmp    LFBCB                 ; 3
LFB1B:
    rts                          ; 6

LFB1C:
    ldy    $BA                   ; 3
    lda    LFFD0,Y               ; 4
    sta    $B2                   ; 3
    lda    LFFD8,Y               ; 4
    clc                          ; 2
    adc    $AD                   ; 3
    sta    $B5                   ; 3
    jmp    LFB99                 ; 3
LFB2E:
    lda    frameCounter          ; 3
    and    #$07                  ; 2
    bne    LFB4E                 ; 2³
    dec    $B9                   ; 5
    beq    LFB18                 ; 2³
    brk                          ; 7
    .byte $02   ; $FB39

    jsr    LFE03                 ; 6
    bpl    LFB43                 ; 2³
    inc    $B2                   ; 5
    inc    $B2                   ; 5
LFB43:
    dec    $B2                   ; 5
    asl                          ; 2
    bpl    LFB4C                 ; 2³
    inc    $B5                   ; 5
    inc    $B5                   ; 5
LFB4C:
    dec    $B5                   ; 5
LFB4E:
    jsr    LFE03                 ; 6
    ldx    $EC                   ; 3
    lda    $AF,X                 ; 4
    asl                          ; 2
    adc    #$28                  ; 2
    cmp    $F2                   ; 3
    bcs    LFB77                 ; 2³
    lda    #$E0                  ; 2
    ldx    $B2                   ; 3
    cpx    $86                   ; 3
    bcs    LFB66                 ; 2³
    lda    #$D0                  ; 2
LFB66:
    ldx    $B5                   ; 3
    cpx    $89                   ; 3
    bcs    LFB70                 ; 2³
    and    #$70                  ; 2
    bne    LFB72                 ; 2³
LFB70:
    and    #$B0                  ; 2
LFB72:
    ldx    #$B2                  ; 2
    jsr    LFD78                 ; 6
LFB77:
    ldx    $B5                   ; 3
    txa                          ; 2
    clc                          ; 2
    adc    #$20                  ; 2
    cmp    #$B6                  ; 2
    bcc    LFB85                 ; 2³
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
LFB85:
    cmp    #$34                  ; 2
    bcs    LFB8D                 ; 2³
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
LFB8D:
    stx    $B5                   ; 3
    ldx    #$B2                  ; 2
    jsr    LFDDF                 ; 6
    ldx    #$B5                  ; 2
    jsr    LFDDF                 ; 6
LFB99:
    ldx    #0                    ; 2
    lda    #$12                  ; 2
    cmp    $B2                   ; 3
    bcc    LFBA5                 ; 2³
    sta    $B2                   ; 3
    stx    $B3                   ; 3
LFBA5:
    lda    #$3B                  ; 2
    cmp    $B2                   ; 3
    bcs    LFBAF                 ; 2³
    sta    $B2                   ; 3
    stx    $B3                   ; 3
LFBAF:
    lda    $B5                   ; 3
    beq    LFBBF                 ; 2³
    cmp    #$E0                  ; 2
    bcs    LFBBF                 ; 2³
    cmp    #$C0                  ; 2
    bcs    LFBCB                 ; 2³
    cmp    #$9F                  ; 2
    bcc    LFBC6                 ; 2³
LFBBF:
    lda    $B2                   ; 3
    ora    #$80                  ; 2
    sta    $B2                   ; 3
    rts                          ; 6

LFBC6:
    ldx    #4                    ; 2
    jmp    LF002                 ; 3

LFBCB SUBROUTINE
    ldx    #0                    ; 2
    stx    $B8                   ; 3
    dex                          ; 2
    stx    $B2                   ; 3
    ldx    $AE                   ; 3
    lda    $98,X                 ; 4
    eor    #$3F                  ; 2
    adc    #$28                  ; 2
    sta    $B9                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFBDD SUBROUTINE
    ldx    #0                    ; 2
    stx    $B1                   ; 3
    stx    $A7                   ; 3
    stx    $F4                   ; 3
    inx                          ; 2
    stx    $AC                   ; 3
    inx                          ; 2
    stx    $B1                   ; 3
    ldy    #4                    ; 2
    sty    $AE                   ; 3
LFBEF:
    ldx    #0                    ; 2
    stx    $8E,Y                 ; 4
    stx    $98,Y                 ; 4
    inx                          ; 2
    stx    $A2,Y                 ; 4
    tya                          ; 2
    tax                          ; 2
    inx                          ; 2
    stx    $93,Y                 ; 4
    ldx    $EC                   ; 3
    lda    $AF,X                 ; 4
    sta.wy $9D,Y                 ; 5
    jsr    LFC6A                 ; 6
    dey                          ; 2
    bpl    LFBEF                 ; 2³+1
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFC0B SUBROUTINE
    ldy    #0                    ; 2
    ldx    $AE                   ; 3
    inc    $98,X                 ; 6
    lda    $98,X                 ; 4
    and    #$07                  ; 2
    bne    LFC2D                 ; 2³
    lda    $9D,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
LFC1B SUBROUTINE
    lsr                          ; 2
    clc                          ; 2
    adc    $9D,X                 ; 4
    sta    $9D,X                 ; 4
    cmp    #$10                  ; 2
    bcs    LFC27                 ; 2³
    inc    $9D,X                 ; 6
LFC27:
    lda    $98,X                 ; 4
    cmp    #$30                  ; 2
    bcs    LFC33                 ; 2³
LFC2D:
    jsr    LFCCF                 ; 6
    brk                          ; 7
    .byte $04   ; $FC31

    rts                          ; 6

LFC33:
    ldy    #4                    ; 2
    jsr    LFCCF                 ; 6
    brk                          ; 7
    .byte $0A   ; $FC39

    inc    $A7                   ; 5
    ldx    $B8                   ; 3
    dex                          ; 2
    beq    LFBCB                 ; 2³+1   branches outside of subroutine
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFC42 SUBROUTINE
    ldx    $AE                   ; 3
    beq    LFC5D                 ; 2³
LFC46:
    lda    $8D,X                 ; 4
    sta    $8E,X                 ; 4
    lda    $92,X                 ; 4
    sta    $93,X                 ; 4
    lda    $97,X                 ; 4
    sta    $98,X                 ; 4
    lda    $A1,X                 ; 4
    sta    $A2,X                 ; 4
    lda    $9C,X                 ; 4
    sta    $9D,X                 ; 4
    dex                          ; 2
    bne    LFC46                 ; 2³
LFC5D:
    stx    $9D                   ; 3
    stx    $A7                   ; 3
    lda    #8                    ; 2
    sta    $93                   ; 3
    lda    #$32                  ; 2
    sta    $8E                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;also JMP'd to from LF80E

LFC6A SUBROUTINE
    dec    $B1                   ; 5
    bne    LFC82                 ; 2³
    ldx    $EC                   ; 3
    lda    $AF,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $F5                   ; 3
    lda    $AF,X                 ; 4
    sec                          ; 2
    sbc    $F5                   ; 3
    sta    $AF,X                 ; 4
    lda    #2                    ; 2
    sta    $B1                   ; 3
LFC82:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFC83 SUBROUTINE
    lda    $9D,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    clc                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFC8A SUBROUTINE
    lda    #$3A                  ; 2
    sta    $86                   ; 3
    lda    #$64                  ; 2
    sta    $89                   ; 3
    sta    $E6                   ; 3
    lda    #7                    ; 2
    sta    $E7                   ; 3
    jsr    LFD0C                 ; 6
    ldx    #0                    ; 2
    stx    $8D                   ; 3
    inx                          ; 2
    stx    $8C                   ; 3
    inx                          ; 2
    stx    $EF                   ; 3
    inx                          ; 2
    inx                          ; 2
    stx    $AE                   ; 3
LFCA9 SUBROUTINE
    ldx    #0                    ; 2
    stx    $8A                   ; 3
    stx    $8B                   ; 3
LFCAF SUBROUTINE
    ldx    #0                    ; 2
    stx    $87                   ; 3
    stx    $88                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFCB6 SUBROUTINE
    inc    $8C                   ; 5
    ldx    $8C                   ; 3
    dex                          ; 2
    dex                          ; 2
    beq    LFCC9                 ; 2³
    dex                          ; 2
    jsr    LFE03                 ; 6
    cmp    LFE6A,X               ; 4
    bcs    LFCCA                 ; 2³
    brk                          ; 7
    .byte $07   ; $FCC8

LFCC9:
    rts                          ; 6


LFCCA SUBROUTINE
    brk                          ; 7
    .byte $09   ; $FCCB

    inc    $8D                   ; 5
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFCCF SUBROUTINE
    ldx    $EC                   ; 3
    lda    $E0,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $F5                   ; 3
    sed                          ; 2
    clc                          ; 2
    lda    $E2,X                 ; 4
    adc    LFFE7,Y               ; 4
    sta    $E2,X                 ; 4
    lda    $E0,X                 ; 4
    adc    LFFE6,Y               ; 4
    sta    $E0,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    cmp    $F5                   ; 3
    beq    LFCF8                 ; 2³
    lsr                          ; 2
    bcs    LFCF8                 ; 2³
    brk                          ; 7
    .byte $0E   ; $FCF5

    inc    $F4                   ; 5
LFCF8:
    cld                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFCFA SUBROUTINE
    lda    #$FE                  ; 2
    sta    $E9                   ; 3
    ldx    #$28                  ; 2
    lda    SWCHB                 ; 4
    and    #$08                  ; 2
    beq    LFD09                 ; 2³
    ldx    #$37                  ; 2
LFD09:
    stx    $E8                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD0C SUBROUTINE
    ldx    #$14                  ; 2
LFD0E:
    lda    LFE13,X               ; 4
    sta    $CB,X                 ; 4
    dex                          ; 2
    bpl    LFD0E                 ; 2³
    lda    SWCHB                 ; 4
    ldx    $EC                   ; 3
    and    LFE70,X               ; 4
    beq    LFD24                 ; 2³
    lda    #$1F                  ; 2
    sta    $DF                   ; 3
LFD24:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD25 SUBROUTINE
    ldx    #$C0                  ; 2
    lda    #$FC                  ; 2
    sta    8,X                   ; 4
    bne    LFD2F                 ; 3   always branch

LFD2D SUBROUTINE
    ldx    #$B2                  ; 2
LFD2F:
    lda    #3                    ; 2
    sta    6,X                   ; 4
    lda    #0                    ; 2
    sta    7,X                   ; 4
    brk                          ; 7
    .byte $08   ; $FD38

    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD3A SUBROUTINE
    lda    7,X                   ; 4
    beq    LFD51                 ; 2³
    and    #$03                  ; 2
    tay                          ; 2
    lda    0,X                   ; 4
    sec                          ; 2
    sbc    LFE72,Y               ; 4
    sta    0,X                   ; 4
    lda    3,X                   ; 4
    sec                          ; 2
    sbc    LFE76,Y               ; 4
    sta    3,X                   ; 4
LFD51:
    inc    7,X                   ; 6
    lda    7,X                   ; 4
    cmp    #$20                  ; 2
    beq    LFD6B                 ; 2³
    and    #$03                  ; 2
    tay                          ; 2
    lda    0,X                   ; 4
    adc    LFE72,Y               ; 4
    sta    0,X                   ; 4
    lda    3,X                   ; 4
    clc                          ; 2
    adc    LFE76,Y               ; 4
    sta    3,X                   ; 4
LFD6B:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD6C SUBROUTINE
    lda    SWCHA                 ; 4
    ldx    $EC                   ; 3
    beq    LFD77                 ; 2³
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
LFD77:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFD78 SUBROUTINE
    tay                          ; 2
    lda    0,X                   ; 4
    cmp    #$42                  ; 2
    bcs    LFD98                 ; 2³
    tya                          ; 2
    asl                          ; 2
    bcc    LFD90                 ; 2³
    asl                          ; 2
    bcs    LFD98                 ; 2³
    dec    4,X                   ; 6
    bmi    LFD98                 ; 2³
    dec    4,X                   ; 6
    dec    4,X                   ; 6
    bvc    LFD98                 ; 2³
LFD90:
    inc    4,X                   ; 6
    bpl    LFD98                 ; 2³
    inc    4,X                   ; 6
    inc    4,X                   ; 6
LFD98:
    tya                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    bcc    LFDB0                 ; 2³
    asl                          ; 2
    bcc    LFDAC                 ; 2³
    lda    frameCounter          ; 3
    lsr                          ; 2
    bcc    LFDB2                 ; 2³
    lda    1,X                   ; 4
    beq    LFDB2                 ; 2³
    bmi    LFDB0                 ; 2³
LFDAC:
    dec    1,X                   ; 6
    dec    1,X                   ; 6
LFDB0:
    inc    1,X                   ; 6
LFDB2:
    lda    1,X                   ; 4
    cmp    #$F4                  ; 2
    bcs    LFDC8                 ; 2³
    cmp    #$0C                  ; 2
    bcc    LFDC8                 ; 2³
    cmp    #$80                  ; 2
    bcc    LFDC4                 ; 2³
    lda    #$F4                  ; 2
    bne    LFDC6                 ; 3   always branch

LFDC4:
    lda    #$0C                  ; 2
LFDC6:
    sta    1,X                   ; 4
LFDC8:
    lda    4,X                   ; 4
    cmp    #$C0                  ; 2
    bcs    LFDDE                 ; 2³
    cmp    #$40                  ; 2
    bcc    LFDDE                 ; 2³
    cmp    #$80                  ; 2
    bcc    LFDDA                 ; 2³
    lda    #$C0                  ; 2
    bne    LFDDC                 ; 3   always branch

LFDDA:
    lda    #$40                  ; 2
LFDDC:
    sta    4,X                   ; 4
LFDDE:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFDDF SUBROUTINE
    lda    1,X                   ; 4
    clc                          ; 2
    adc    2,X                   ; 4
    cmp    #8                    ; 2
    bcc    LFE00                 ; 2³+1
    cmp    #$F8                  ; 2
    bcs    LFE00                 ; 2³+1
    cmp    #$80                  ; 2
    bcs    LFDF9                 ; 2³
LFDF0:
    inc    0,X                   ; 6
    sec                          ; 2
    sbc    #$10                  ; 2
    bpl    LFDF0                 ; 2³
    bmi    LFE00                 ; 3+1   always branch

LFDF9:
    dec    0,X                   ; 6
    clc                          ; 2
    adc    #$10                  ; 2
    bmi    LFDF9                 ; 2³
LFE00:
    sta    2,X                   ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFE03 SUBROUTINE
    lda    $F2                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    clc                          ; 2   low nybble in high nybble, carry clear
    adc    $F2                   ; 3
    clc                          ; 2
    adc    #1                    ; 2
    sta    $F2                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $DD ; |XX XXX X| $FE12
LFE13:
    .byte $F0 ; |XXXX    | $FE13
    .byte $FF ; |XXXXXXXX| $FE14
    .byte $C7 ; |XX   XXX| $FE15
    .byte $D0 ; |XX X    | $FE16
    .byte $FE ; |XXXXXXX | $FE17
    .byte $02 ; |      X | $FE18
    .byte $80 ; |X       | $FE19
    .byte $F8 ; |XXXXX   | $FE1A
    .byte $00 ; |        | $FE1B
    .byte $00 ; |        | $FE1C
    .byte $E0 ; |XXX     | $FE1D
    .byte $00 ; |        | $FE1E
    .byte $00 ; |        | $FE1F
    .byte $03 ; |      XX| $FE20
    .byte $01 ; |       X| $FE21
    .byte $00 ; |        | $FE22
    .byte $EF ; |XXX XXXX| $FE23
    .byte $03 ; |      XX| $FE24
    .byte $C0 ; |XX      | $FE25
    .byte $FF ; |XXXXXXXX| $FE26
    .byte $07 ; |     XXX| $FE27
    .byte $0C ; |    XX  | $FE28
    .byte $0E ; |    XXX | $FE29
    .byte $0C ; |    XX  | $FE2A
    .byte $00 ; |        | $FE2B
    .byte $00 ; |        | $FE2C
    .byte $08 ; |    X   | $FE2D
    .byte $00 ; |        | $FE2E
    .byte $02 ; |      X | $FE2F
    .byte $04 ; |     X  | $FE30
    .byte $06 ; |     XX | $FE31
    .byte $08 ; |    X   | $FE32
    .byte $0A ; |    X X | $FE33
    .byte $0E ; |    XXX | $FE34
    .byte $00 ; |        | $FE35
    .byte $0E ; |    XXX | $FE36
    .byte $4E ; | X  XXX | $FE37
    .byte $8E ; |X   XXX | $FE38
    .byte $8C ; |X   XX  | $FE39
    .byte $60 ; | XX     | $FE3A
    .byte $54 ; | X X X  | $FE3B
    .byte $3A ; |  XXX X | $FE3C
    .byte $02 ; |      X | $FE3D
    .byte $A6 ; |X X  XX | $FE3E
    .byte $66 ; | XX  XX | $FE3F
    .byte $56 ; | X X XX | $FE40
    .byte $36 ; |  XX XX | $FE41
    .byte $2A ; |  X X X | $FE42
    .byte $3E ; |  XXXXX | $FE43
    .byte $00 ; |        | $FE44
    .byte $1E ; |   XXXX | $FE45

SnowSpeeder:
    .byte $3C ; |  XXXX  | $FE46
    .byte $FF ; |XXXXXXXX| $FE47
    .byte $70 ; | XXX    | $FE48
    .byte $00 ; |        | $FE49

;SnowSpeeder blows up
DestructOne:
    .byte $18 ; |   XX   | $FE4A
    .byte $5A ; | X XX X | $FE4B
    .byte $30 ; |  XX    | $FE4C
    .byte $00 ; |        | $FE4D
DestructTwo:
    .byte $24 ; |  X  X  | $FE4E
    .byte $A5 ; |X X  X X| $FE4F
    .byte $48 ; | X  X   | $FE50
    .byte $00 ; |        | $FE51
DestructThree:
    .byte $22 ; |  X   X | $FE52
    .byte $40 ; | X      | $FE53
    .byte $08 ; |    X   | $FE54
    .byte $00 ; |        | $FE55
DestructFour:
    .byte $00 ; |        | $FE56
    .byte $00 ; |        | $FE57
    .byte $00 ; |        | $FE58
    .byte $00 ; |        | $FE59

LFE5A:
    .byte <AT_AT_TopOne  ; $FE5A
    .byte <AT_AT_TopTwo  ; $FE5B
    .byte <AT_AT_TopThree; $FE5C
    .byte <AT_AT_TopFour ; $FE5D
LFE5E:
    .byte <AT_AT_BottomOne  ; $FE5E
    .byte <AT_AT_BottomOne  ; $FE5F
    .byte <AT_AT_BottomOne  ; $FE60
    .byte <AT_AT_BottomTwo  ; $FE61

LFE62:
    .byte $F4 ; |XXXX X  | $FE62   ADC
    .byte $F7 ; |XXXX XXX| $FE63
    .byte $FA ; |XXXXX X | $FE64
    .byte $FD ; |XXXXXX X| $FE65
    .byte $00 ; |        | $FE66
    .byte $03 ; |      XX| $FE67
    .byte $06 ; |     XX | $FE68
    .byte $09 ; |    X  X| $FE69
LFE6A:
    .byte $C8 ; |XX  X   | $FE6A   CMP
    .byte $96 ; |X  X XX | $FE6B
    .byte $64 ; | XX  X  | $FE6C
    .byte $32 ; |  XX  X | $FE6D
    .byte $00 ; |        | $FE6E
    .byte $00 ; |        | $FE6F
LFE70:
    .byte $40 ; | X      | $FE70   AND
    .byte $80 ; |X       | $FE71
LFE72:
    .byte $00 ; |        | $FE72   SBC, ADC
    .byte $00 ; |        | $FE73
    .byte $FE ; |XXXXXXX | $FE74
    .byte $02 ; |      X | $FE75
LFE76:
    .byte $FC ; |XXXXXX  | $FE76   ADC, SBC
    .byte $04 ; |     X  | $FE77
    .byte $00 ; |        | $FE78
    .byte $00 ; |        | $FE79

AT_AT_TopOne:
    .byte $30 ; |  XX    | $FE7A
    .byte $30 ; |  XX    | $FE7B
    .byte $7A ; | XXXX X | $FE7C
    .byte $FF ; |XXXXXXXX| $FE7D
    .byte $FF ; |XXXXXXXX| $FE7E
    .byte $FF ; |XXXXXXXX| $FE7F
    .byte $FA ; |XXXXX X | $FE80
    .byte $F8 ; |XXXXX   | $FE81
    .byte $F8 ; |XXXXX   | $FE82
    .byte $F8 ; |XXXXX   | $FE83
    .byte $68 ; | XX X   | $FE84
    .byte $48 ; | X  X   | $FE85
    .byte $48 ; | X  X   | $FE86
AT_AT_TopTwo:
    .byte $30 ; |  XX    | $FE87
    .byte $30 ; |  XX    | $FE88
    .byte $78 ; | XXXX   | $FE89
    .byte $FA ; |XXXXX X | $FE8A
    .byte $FF ; |XXXXXXXX| $FE8B
    .byte $FF ; |XXXXXXXX| $FE8C
    .byte $FF ; |XXXXXXXX| $FE8D
    .byte $FA ; |XXXXX X | $FE8E
    .byte $F8 ; |XXXXX   | $FE8F
    .byte $F8 ; |XXXXX   | $FE90
    .byte $68 ; | XX X   | $FE91
    .byte $48 ; | X  X   | $FE92
    .byte $48 ; | X  X   | $FE93
AT_AT_TopThree:
    .byte $30 ; |  XX    | $FE94
    .byte $30 ; |  XX    | $FE95
    .byte $78 ; | XXXX   | $FE96
    .byte $F8 ; |XXXXX   | $FE97
    .byte $FA ; |XXXXX X | $FE98
    .byte $FF ; |XXXXXXXX| $FE99
    .byte $FF ; |XXXXXXXX| $FE9A
    .byte $FF ; |XXXXXXXX| $FE9B
    .byte $FA ; |XXXXX X | $FE9C
    .byte $F8 ; |XXXXX   | $FE9D
    .byte $68 ; | XX X   | $FE9E
    .byte $48 ; | X  X   | $FE9F
    .byte $48 ; | X  X   | $FEA0
AT_AT_TopFour:
    .byte $30 ; |  XX    | $FEA1
    .byte $30 ; |  XX    | $FEA2
    .byte $78 ; | XXXX   | $FEA3
    .byte $F8 ; |XXXXX   | $FEA4
    .byte $F8 ; |XXXXX   | $FEA5
    .byte $FA ; |XXXXX X | $FEA6
    .byte $FF ; |XXXXXXXX| $FEA7
    .byte $FF ; |XXXXXXXX| $FEA8
    .byte $FF ; |XXXXXXXX| $FEA9
    .byte $FA ; |XXXXX X | $FEAA
    .byte $68 ; | XX X   | $FEAB
    .byte $48 ; | X  X   | $FEAC
    .byte $48 ; | X  X   | $FEAD

AT_AT_BottomOne:
    .byte $77 ; | XXX XXX| $FEAE
    .byte $77 ; | XXX XXX| $FEAF
    .byte $77 ; | XXX XXX| $FEB0
    .byte $55 ; | X X X X| $FEB1
    .byte $DD ; |XX XXX X| $FEB2
    .byte $DD ; |XX XXX X| $FEB3
    .byte $BB ; |X XXX XX| $FEB4
    .byte $BB ; |X XXX XX| $FEB5
    .byte $AA ; |X X X X | $FEB6
    .byte $AA ; |X X X X | $FEB7
    .byte $AA ; |X X X X | $FEB8
    .byte $AA ; |X X X X | $FEB9
    .byte $AA ; |X X X X | $FEBA
    .byte $BA ; |X XXX X | $FEBB
    .byte $FF ; |XXXXXXXX| $FEBC
    .byte $00 ; |        | $FEBD
AT_AT_BottomTwo:
    .byte $C6 ; |XX   XX | $FEBE
    .byte $C6 ; |XX   XX | $FEBF
    .byte $C6 ; |XX   XX | $FEC0
    .byte $C6 ; |XX   XX | $FEC1
    .byte $C6 ; |XX   XX | $FEC2
    .byte $C6 ; |XX   XX | $FEC3
    .byte $E7 ; |XXX  XXX| $FEC4
    .byte $E7 ; |XXX  XXX| $FEC5
    .byte $A5 ; |X X  X X| $FEC6
    .byte $A5 ; |X X  X X| $FEC7
    .byte $A5 ; |X X  X X| $FEC8
    .byte $A5 ; |X X  X X| $FEC9
    .byte $A5 ; |X X  X X| $FECA
    .byte $E7 ; |XXX  XXX| $FECB
    .byte $F7 ; |XXXX XXX| $FECC
    .byte $00 ; |        | $FECD
RadarCursor:
    .byte $00 ; |        | $FECE   enable missile
    .byte $00 ; |        | $FECF
    .byte $00 ; |        | $FED0
    .byte $F8 ; |XXXXX   | $FED1
    .byte $88 ; |X   X   | $FED2
    .byte $00 ; |        | $FED3
    .byte $02 ; |      X | $FED4
    .byte $02 ; |      X | $FED5
    .byte $00 ; |        | $FED6
    .byte $00 ; |        | $FED7
    .byte $88 ; |X   X   | $FED8
    .byte $F8 ; |XXXXX   | $FED9
    .byte $00 ; |        | $FEDA
    .byte $00 ; |        | $FEDB
LFEDC:
    .byte $C0 ; |XX      | $FEDC
    .byte $CC ; |XX  XX  | $FEDD
    .byte $CC ; |XX  XX  | $FEDE
    .byte $CC ; |XX  XX  | $FEDF
    .byte $CC ; |XX  XX  | $FEE0
    .byte $CC ; |XX  XX  | $FEE1
    .byte $CC ; |XX  XX  | $FEE2
    .byte $4C ; | X  XX  | $FEE3
    .byte $CC ; |XX  XX  | $FEE4
    .byte $CC ; |XX  XX  | $FEE5
    .byte $CC ; |XX  XX  | $FEE6
    .byte $CC ; |XX  XX  | $FEE7
    .byte $4C ; | X  XX  | $FEE8
    .byte $CC ; |XX  XX  | $FEE9
    .byte $CC ; |XX  XX  | $FEEA
    .byte $CC ; |XX  XX  | $FEEB
    .byte $CC ; |XX  XX  | $FEEC
    .byte $CC ; |XX  XX  | $FEED
LFEEE:
    .byte $60 ; | XX     | $FEEE
    .byte $7B ; | XXXX XX| $FEEF
    .byte $D4 ; |XX X X  | $FEF0
    .byte $6D ; | XX XX X| $FEF1
    .byte $2F ; |  X XXXX| $FEF2
    .byte $30 ; |  XX    | $FEF3
    .byte $32 ; |  XX  X | $FEF4
    .byte $DF ; |XX XXXXX| $FEF5
    .byte $6D ; | XX XX X| $FEF6
    .byte $2F ; |  X XXXX| $FEF7
    .byte $30 ; |  XX    | $FEF8
    .byte $32 ; |  XX  X | $FEF9
    .byte $DF ; |XX XXXXX| $FEFA
    .byte $6D ; | XX XX X| $FEFB
    .byte $2F ; |  X XXXX| $FEFC
    .byte $30 ; |  XX    | $FEFD
    .byte $2F ; |  X XXXX| $FEFE
    .byte $D2 ; |XX X  X | $FEFF
LFF00:
Zero:
    .byte $1C ; |   XXX  | $FF00
    .byte $22 ; |  X   X | $FF01
    .byte $63 ; | XX   XX| $FF02
    .byte $63 ; | XX   XX| $FF03
    .byte $63 ; | XX   XX| $FF04
    .byte $22 ; |  X   X | $FF05
    .byte $1C ; |   XXX  | $FF06
    .byte $00 ; |        | $FF07
One:
    .byte $04 ; |     X  | $FF08
    .byte $0C ; |    XX  | $FF09
    .byte $1C ; |   XXX  | $FF0A
    .byte $0C ; |    XX  | $FF0B
    .byte $0C ; |    XX  | $FF0C
    .byte $0C ; |    XX  | $FF0D
    .byte $7F ; | XXXXXXX| $FF0E
    .byte $00 ; |        | $FF0F
Two:
    .byte $3E ; |  XXXXX | $FF10
    .byte $03 ; |      XX| $FF11
    .byte $03 ; |      XX| $FF12
    .byte $3E ; |  XXXXX | $FF13
    .byte $60 ; | XX     | $FF14
    .byte $60 ; | XX     | $FF15
    .byte $7F ; | XXXXXXX| $FF16
    .byte $00 ; |        | $FF17
Three:
    .byte $7E ; | XXXXXX | $FF18
    .byte $03 ; |      XX| $FF19
    .byte $03 ; |      XX| $FF1A
    .byte $3E ; |  XXXXX | $FF1B
    .byte $03 ; |      XX| $FF1C
    .byte $03 ; |      XX| $FF1D
    .byte $7E ; | XXXXXX | $FF1E
    .byte $00 ; |        | $FF1F
Four:
    .byte $02 ; |      X | $FF20
    .byte $06 ; |     XX | $FF21
    .byte $0E ; |    XXX | $FF22
    .byte $16 ; |   X XX | $FF23
    .byte $26 ; |  X  XX | $FF24
    .byte $7F ; | XXXXXXX| $FF25
    .byte $06 ; |     XX | $FF26
    .byte $00 ; |        | $FF27
Five:
    .byte $7E ; | XXXXXX | $FF28
    .byte $60 ; | XX     | $FF29
    .byte $60 ; | XX     | $FF2A
    .byte $3E ; |  XXXXX | $FF2B
    .byte $03 ; |      XX| $FF2C
    .byte $03 ; |      XX| $FF2D
    .byte $7E ; | XXXXXX | $FF2E
    .byte $00 ; |        | $FF2F
Six:
    .byte $3E ; |  XXXXX | $FF30
    .byte $60 ; | XX     | $FF31
    .byte $60 ; | XX     | $FF32
    .byte $7E ; | XXXXXX | $FF33
    .byte $63 ; | XX   XX| $FF34
    .byte $63 ; | XX   XX| $FF35
    .byte $3E ; |  XXXXX | $FF36
    .byte $00 ; |        | $FF37
Seven:
    .byte $7F ; | XXXXXXX| $FF38
    .byte $61 ; | XX    X| $FF39
    .byte $03 ; |      XX| $FF3A
    .byte $06 ; |     XX | $FF3B
    .byte $0C ; |    XX  | $FF3C
    .byte $18 ; |   XX   | $FF3D
    .byte $30 ; |  XX    | $FF3E
    .byte $00 ; |        | $FF3F
Eight:
    .byte $3E ; |  XXXXX | $FF40
    .byte $63 ; | XX   XX| $FF41
    .byte $63 ; | XX   XX| $FF42
    .byte $3E ; |  XXXXX | $FF43
    .byte $63 ; | XX   XX| $FF44
    .byte $63 ; | XX   XX| $FF45
    .byte $3E ; |  XXXXX | $FF46
    .byte $00 ; |        | $FF47
Nine:
    .byte $3E ; |  XXXXX | $FF48
    .byte $63 ; | XX   XX| $FF49
    .byte $63 ; | XX   XX| $FF4A
    .byte $3F ; |  XXXXXX| $FF4B
    .byte $03 ; |      XX| $FF4C
    .byte $03 ; |      XX| $FF4D
    .byte $3E ; |  XXXXX | $FF4E
    .byte $00 ; |        | $FF4F
BlankDigit:
    .byte $00 ; |        | $FF50
    .byte $00 ; |        | $FF51
    .byte $00 ; |        | $FF52
    .byte $00 ; |        | $FF53
    .byte $00 ; |        | $FF54
    .byte $00 ; |        | $FF55
    .byte $00 ; |        | $FF56
    .byte $00 ; |        | $FF57
OnePlayer:
    .byte $08 ; |    X   | $FF58
    .byte $00 ; |        | $FF59
    .byte $1C ; |   XXX  | $FF5A
    .byte $1C ; |   XXX  | $FF5B
    .byte $1C ; |   XXX  | $FF5C
    .byte $08 ; |    X   | $FF5D
    .byte $08 ; |    X   | $FF5E
    .byte $00 ; |        | $FF5F
TwoPlayer:
    .byte $22 ; |  X   X | $FF60
    .byte $00 ; |        | $FF61
    .byte $77 ; | XXX XXX| $FF62
    .byte $77 ; | XXX XXX| $FF63
    .byte $77 ; | XXX XXX| $FF64
    .byte $22 ; |  X   X | $FF65
    .byte $22 ; |  X   X | $FF66
    .byte $00 ; |        | $FF67

    .byte $00 ; |        | $FF68
    .byte $1E ; |   XXXX | $FF69
    .byte $1E ; |   XXXX | $FF6A
    .byte $7F ; | XXXXXXX| $FF6B
    .byte $7F ; | XXXXXXX| $FF6C
    .byte $0E ; |    XXX | $FF6D
    .byte $0E ; |    XXX | $FF6E
    .byte $00 ; |        | $FF6F
LFF70:
    .byte $00 ; |        | $FF70
    .byte $2A ; |  X X X | $FF71
    .byte $F8 ; |XXXXX   | $FF72
    .byte $8B ; |X   X XX| $FF73
    .byte $8B ; |X   X XX| $FF74
    .byte $F8 ; |XXXXX   | $FF75
    .byte $8C ; |X   XX  | $FF76
    .byte $8C ; |X   XX  | $FF77
    .byte $8E ; |X   XXX | $FF78
    .byte $8E ; |X   XXX | $FF79
    .byte $8F ; |X   XXXX| $FF7A
    .byte $8B ; |X   X XX| $FF7B
    .byte $6C ; | XX XX  | $FF7C
    .byte $CD ; |XX  XX X| $FF7D
    .byte $4F ; | X  XXXX| $FF7E
    .byte $8F ; |X   XXXX| $FF7F
LFF80:
    .byte $00 ; |        | $FF80
    .byte $44 ; | X   X  | $FF81
    .byte $24 ; |  X  X  | $FF82
    .byte $20 ; |  X     | $FF83
    .byte $2A ; |  X X X | $FF84
    .byte $2A ; |  X X X | $FF85
    .byte $20 ; |  X     | $FF86
    .byte $22 ; |  X   X | $FF87
    .byte $2F ; |  X XXXX| $FF88
    .byte $34 ; |  XX X  | $FF89
    .byte $58 ; | X XX   | $FF8A
    .byte $20 ; |  X     | $FF8B
    .byte $48 ; | X  X   | $FF8C
    .byte $28 ; |  X X   | $FF8D
    .byte $75 ; | XXX X X| $FF8E
    .byte $A5 ; |X X  X X| $FF8F
LFF90:
    .byte $00 ; |        | $FF90
    .byte $00 ; |        | $FF91
    .byte $00 ; |        | $FF92
    .byte $F7 ; |XXXX XXX| $FF93
    .byte $E6 ; |XXX  XX | $FF94
    .byte $1F ; |   XXXXX| $FF95
    .byte $F2 ; |XXXX  X | $FF96
    .byte $FA ; |XXXXX X | $FF97
    .byte $F8 ; |XXXXX   | $FF98
    .byte $F7 ; |XXXX XXX| $FF99
    .byte $F8 ; |XXXXX   | $FF9A
    .byte $F1 ; |XXXX   X| $FF9B
    .byte $F8 ; |XXXXX   | $FF9C
    .byte $F8 ; |XXXXX   | $FF9D
    .byte $FA ; |XXXXX X | $FF9E
    .byte $F8 ; |XXXXX   | $FF9F
LFFA0:
    .byte $00 ; |        | $FFA0
    .byte $25 ; |  X  X X| $FFA1
    .byte $28 ; |  X X   | $FFA2
    .byte $28 ; |  X X   | $FFA3
    .byte $30 ; |  XX    | $FFA4
    .byte $E4 ; |XXX  X  | $FFA5
    .byte $2F ; |  X XXXX| $FFA6
    .byte $0F ; |    XXXX| $FFA7
    .byte $38 ; |  XXX   | $FFA8
    .byte $3B ; |  XXX XX| $FFA9
    .byte $3F ; |  XXXXXX| $FFAA
    .byte $0F ; |    XXXX| $FFAB
    .byte $0F ; |    XXXX| $FFAC
    .byte $00 ; |        | $FFAD
    .byte $00 ; |        | $FFAE
    .byte $3C ; |  XXXX  | $FFAF
LFFB0:
    .byte $7F ; | XXXXXXX| $FFB0
    .byte $3F ; |  XXXXXX| $FFB1
    .byte $1F ; |   XXXXX| $FFB2
    .byte $0F ; |    XXXX| $FFB3
    .byte $07 ; |     XXX| $FFB4
    .byte $03 ; |      XX| $FFB5
    .byte $01 ; |       X| $FFB6
    .byte $00 ; |        | $FFB7
LFFB8:
    .byte $00 ; |        | $FFB8
    .byte $80 ; |X       | $FFB9
    .byte $C0 ; |XX      | $FFBA
    .byte $E0 ; |XXX     | $FFBB
    .byte $F0 ; |XXXX    | $FFBC
    .byte $F8 ; |XXXXX   | $FFBD
    .byte $FC ; |XXXXXX  | $FFBE
    .byte $FE ; |XXXXXXX | $FFBF
LFFC0:
    .byte $FF ; |XXXXXXXX| $FFC0
    .byte $3F ; |  XXXXXX| $FFC1
    .byte $0F ; |    XXXX| $FFC2
    .byte $03 ; |      XX| $FFC3
    .byte $00 ; |        | $FFC4
    .byte $00 ; |        | $FFC5
    .byte $00 ; |        | $FFC6
    .byte $00 ; |        | $FFC7
LFFC8:
    .byte $00 ; |        | $FFC8
    .byte $00 ; |        | $FFC9
    .byte $C0 ; |XX      | $FFCA
    .byte $F0 ; |XXXX    | $FFCB
    .byte $FC ; |XXXXXX  | $FFCC
    .byte $FF ; |XXXXXXXX| $FFCD
    .byte $FF ; |XXXXXXXX| $FFCE
    .byte $FF ; |XXXXXXXX| $FFCF
LFFD0:
    .byte $1E ; |   XXXX | $FFD0
    .byte $1E ; |   XXXX | $FFD1
    .byte $1E ; |   XXXX | $FFD2
    .byte $23 ; |  X   XX| $FFD3
    .byte $23 ; |  X   XX| $FFD4
    .byte $23 ; |  X   XX| $FFD5
    .byte $23 ; |  X   XX| $FFD6
    .byte $1C ; |   XXX  | $FFD7
LFFD8:
    .byte $14 ; |   X X  | $FFD8
    .byte $14 ; |   X X  | $FFD9
    .byte $14 ; |   X X  | $FFDA
    .byte $14 ; |   X X  | $FFDB
    .byte $14 ; |   X X  | $FFDC
    .byte $14 ; |   X X  | $FFDD
    .byte $14 ; |   X X  | $FFDE
    .byte $0A ; |    X X | $FFDF
LFFE0:
    .byte $28 ; |  X X   | $FFE0
    .byte $64 ; | XX  X  | $FFE1
    .byte $46 ; | X   XX | $FFE2
LFFE3:
    .byte $0E ; |    XXX | $FFE3
    .byte $12 ; |   X  X | $FFE4
    .byte $10 ; |   X    | $FFE5
LFFE6:
    .byte $00 ; |        | $FFE6
LFFE7:
    .byte $01 ; |       X| $FFE7
    .byte $00 ; |        | $FFE8
    .byte $25 ; |  X  X X| $FFE9
    .byte $00 ; |        | $FFEA
    .byte $50 ; | X X    | $FFEB
    .byte $01 ; |       X| $FFEC
    .byte $00 ; |        | $FFED
    .byte $00 ; |        | $FFEE
    .byte $10 ; |   X    | $FFEF
LFFF0:
    .byte $12 ; |   X  X | $FFF0
    .byte $17 ; |   X XXX| $FFF1
    .byte $1C ; |   XXX  | $FFF2
    .byte $21 ; |  X    X| $FFF3
    .byte $26 ; |  X  XX | $FFF4
    .byte $2B ; |  X X XX| $FFF5
    .byte $30 ; |  XX    | $FFF6
    .byte $63 ; | XX   XX| $FFF7
LFFF8:
    .byte $40 ; | X      | $FFF8
    .byte $30 ; |  XX    | $FFF9
    .byte $20 ; |  X     | $FFFA
    .byte $12 ; |   X  X | $FFFB

       ORG $FFFC

    .word START,LF972