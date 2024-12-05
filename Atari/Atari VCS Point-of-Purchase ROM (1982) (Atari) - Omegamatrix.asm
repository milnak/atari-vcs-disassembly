; Disassembly of Atari VCS Point-of-Purchase rom
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: distella.exe -pasfcApop.cfg pos.bin > AtariPOP.asm
;
; Apop.cfg contents:
;
;      ORG F000
;      CODE F000 F3F1
;      GFX F3F2 F7FF

      processor 6502

VSYNC   =  $00
VBLANK  =  $01
WSYNC   =  $02
NUSIZ0  =  $04
NUSIZ1  =  $05
COLUP0  =  $06
COLUP1  =  $07
COLUPF  =  $08
CTRLPF  =  $0A
REFP1   =  $0C
PF0     =  $0D
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
ENAM1   =  $1E
HMP0    =  $20
HMP1    =  $21
HMM0    =  $22
HMM1    =  $23
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
SWACNT  =  $0281
SWCHB   =  $0282
SWBCNT  =  $0283
INTIM   =  $0284
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MACROS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  MAC FILL_NOMOTION
    REPEAT {1}
      .byte 0
    REPEND
  ENDM

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      USER CONSTANTS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;HMPx
LEFT_7        = $70
LEFT_6        = $60
LEFT_5        = $50
LEFT_4        = $40
LEFT_3        = $30
LEFT_2        = $20
LEFT_1        = $10
NO_MOTION     = $00
RIGHT_1       = $F0
RIGHT_2       = $E0
RIGHT_3       = $D0
RIGHT_4       = $C0
RIGHT_5       = $B0
RIGHT_6       = $A0
RIGHT_7       = $90
RIGHT_8       = $80

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

numOfLoops       = $8F
screenFlag       = $A9  ; 0 = Atari Fuji, 1 = Atari Video Computer System, 2 = Enter Game Number
largeCount       = $AA  ; counts down
smallCount       = $AB  ; counts down

gameLoad         = $AE  ; 
colorFuji        = $C4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


       ORG $F000

    jmp    START              ; 3

LF003:
    sta    WSYNC              ; 3
    sta    HMOVE              ; 3

.loopWait:
    lda    INTIM              ; 4
    bne    .loopWait          ; 2³
    lda    screenFlag         ; 3   do the Atari Fuji screen?
    bne    LF013              ; 2³  - no
    jmp    FujiScreen         ; 3   - yes

LF013:
    ldx    #0                 ; 2
    lda    #$78               ; 2   P0
    jsr    HorizPosition      ; 6
    inx                       ; 2
    lda    #$80               ; 2   P1
    jsr    HorizPosition      ; 6
    sta    WSYNC              ; 3
    sta    HMOVE              ; 3
    lda    #0                 ; 2
    sta    CTRLPF             ; 3   no reflect
    sta    VDELP0             ; 3   no delay
    sta    VDELP1             ; 3
    ldx    #$88               ; 2   color for letters
    stx    COLUP0             ; 3
    stx    COLUP1             ; 3
    stx    COLUPF             ; 3
    sta    NUSIZ0             ; 3   one regular copy
    sta    NUSIZ1             ; 3
    sta    $8E                ; 3
    lda    #3                 ; 2
    sta    $8D                ; 3
LF03E:
    lda    #5                 ; 2
    sta    numOfLoops         ; 3
    ldx    #0                 ; 2
    ldy    $8E                ; 3

.loopCalcPointers:
    sta    WSYNC              ; 3   most convoluted system to load pointers... ever
    lda    #$F6               ; 2   high nybble
    sta    $81,X              ; 4
    lda.wy $90,Y              ; 4   get the variable
    asl                       ; 2
    adc.wy $90,Y              ; 4
    asl                       ; 2   times by 6
    bcc    LF05C              ; 2³
    clc                       ; 2
    adc.wy $90,Y              ; 4   times by 7
    bne    .increasePage      ; 2³

LF05C:
    adc.wy $90,Y              ; 4   times by 7 or 8
    bcs    .increasePage      ; 2³
    cmp    #$FC               ; 2
    bne    .storeLoPointer    ; 2³
.increasePage:
    inc    $81,X              ; 6   to the $F7 page
    clc                       ; 2
    adc    #4                 ; 2
.storeLoPointer:
    sta    $80,X              ; 4
    inx                       ; 2
    inx                       ; 2   jump two ram locations for the next pointer
    iny                       ; 2
    dec    numOfLoops         ; 5
    bpl    .loopCalcPointers  ; 2³

    sta    WSYNC              ; 3
    sty    $8E                ; 3
    lda    #6                 ; 2
    sta    $8C                ; 3
    ldx    #0                 ; 2   waste
    lda    $8D                ; 3   waste
    sta    WSYNC              ; 3 
    sta    WSYNC              ; 3  
    sta    WSYNC              ; 3   
    ldx    #3                 ; 2
    
LF087:
    sta    WSYNC              ; 3   
    ldy    $8C                ; 3
    lda    ($80),Y            ; 5   
    sta    PF0                ; 3
    lda    ($82),Y            ; 5
    sta    PF1                ; 3
    lda    ($84),Y            ; 5
    sta    PF2                ; 3
    nop                       ; 2
    lda    ($86),Y            ; 5
    sta    PF0                ; 3
    lda    ($88),Y            ; 5
    sta    PF1                ; 3
    lda    ($8A),Y            ; 5
    sta    PF2                ; 3
    dex                       ; 2
    bne    LF087              ; 2³
    ldx    #3                 ; 2
    dec    $8C                ; 5
    bpl    LF087              ; 2³
    sta    WSYNC              ; 3
    lda    #0                 ; 2
    sta    PF0                ; 3
    sta    PF1                ; 3
    sta    PF2                ; 3
    sta    WSYNC              ; 3
    sta    WSYNC              ; 3
    dec    $8D                ; 5
    bmi    LF0C2              ; 2³
    jmp    LF03E              ; 3
LF0C2:
    lda    screenFlag         ; 3
    cmp    #2                 ; 2
    bne    LF0F3              ; 2³
    lda    #$F6               ; 2
    sta    $81                ; 3
    sta    $83                ; 3
    lda    $AC                ; 3
    asl                       ; 2
    asl                       ; 2
    asl                       ; 2
    sec                       ; 2
    sbc    $AC                ; 3
    sta    $80                ; 3
    lda    $AD                ; 3
    asl                       ; 2
    asl                       ; 2
    asl                       ; 2
    sec                       ; 2
    sbc    $AD                ; 3
    sta    $82                ; 3
    ldy    #6                 ; 2
LF0E4:
    sta    WSYNC              ; 3
    sta    WSYNC              ; 3
    lda    ($80),Y            ; 5
    sta    GRP0               ; 3
    lda    ($82),Y            ; 5
    sta    GRP1               ; 3
    dey                       ; 2
    bpl    LF0E4              ; 2³
LF0F3:
    sta    WSYNC              ; 3
    sta    WSYNC              ; 3
    lda    #0                 ; 2
    sta    GRP0               ; 3
    sta    GRP1               ; 3
    jmp    LF22D              ; 3

FujiScreen:
    ldx    #3                 ; 2   Hmove P0,P1,M0,M1
.loopPositionAll:
    lda    HmoveTab,X         ; 4
    jsr    HorizPosition      ; 6
    dex                       ; 2
    bpl    .loopPositionAll   ; 2³
    lda    #0                 ; 2
    sta    VDELP0             ; 3   no delay
    sta    VDELP1             ; 3
    sta    COLUPF             ; 3   black playfield
    lda    #8                 ; 2
    sta    REFP1              ; 3   reflect player 1
    lda    #3                 ; 2
    sta    CTRLPF             ; 3   reflect,score
    lda    #5                 ; 2
    sta    NUSIZ0             ; 3   double size players
    sta    NUSIZ1             ; 3
    inc    colorFuji          ; 5
    lda    colorFuji          ; 3
    bne    LF12B              ; 2³
    lda    #$10               ; 2   never do black or whites
    sta    colorFuji          ; 3
LF12B:
    ldx    #2                 ; 2
    sta    WSYNC              ; 3
;-------------------------------------
    sta    HMOVE              ; 3
    sta    WSYNC              ; 3
    stx    ENAM0              ; 3   enamble
    stx    ENAM1              ; 3
    ldx    #0                 ; 2
    stx    HMP0               ; 3   no motion
    stx    HMP1               ; 3
    stx    HMM0               ; 3
    stx    HMM1               ; 3
    ldx    FujiTopSides       ; 4   top line only, sides of Fuji
    sta    COLUP0             ; 3
    sta    COLUP1             ; 3
    stx    GRP0               ; 3   draw the top line now
    stx    GRP1               ; 3
    ldx    #$80               ; 2   middle of Atari Fuji
    stx    PF2                ; 3
    ldx    #$3D               ; 2   height of Fuji
.loopDrawFuji:
    sta    WSYNC              ; 3
;-------------------------------------
    sta    HMOVE              ; 3
    sta    COLUP0             ; 3
    sta    COLUPF             ; 3
    sta    COLUP1             ; 3
    ldy    FujiSides,X        ; 4
    sty    GRP0               ; 3
    sty    GRP1               ; 3
    ldy    FujiHMP0_Tab,X     ; 4   left side
    sty    HMP0               ; 3
    ldy    FujiHMM0_Tab,X     ; 4
    sty    HMM0               ; 3
    ldy    FujiHMP1_Tab,X     ; 4   right side
    sty    HMP1               ; 3
    ldy    FujiHMM1_Tab,X     ; 4
    sty    HMM1               ; 3
    adc    #2                 ; 2   increment colors
    bcc    .useColorsOnly     ; 2³  - have we rolled over $FF yet?
    adc    #$0F               ; 2   then add this to skip the black & white colors
.useColorsOnly:
    dex                       ; 2
    bpl    .loopDrawFuji      ; 2³

    lda    #0                 ; 2
    sta    ENAM0              ; 3   disable
    sta    ENAM1              ; 3
    sta    PF2                ; 3   clear
    sta    GRP0               ; 3   clear
    sta    GRP1               ; 3
    sta    REFP1              ; 3   no reflect
    lda    #0                 ; 2
    sta    VDELP0             ; 3   no delay
    sta    NUSIZ0             ; 3   one regular sized copy
    tax                       ; 2
    lda    #$A0               ; 2
    jsr    HorizPosition      ; 6   do for HMP0
    sta    WSYNC              ; 3
;-------------------------------------
    sta    HMOVE              ; 3

    lda    #$8D               ; 2   color registered symbol
    sta    COLUP0             ; 3
    ldx    #9                 ; 2   height of registered symbol
.loopDrawSymbol:
    sta    WSYNC              ; 3
;-------------------------------------
    lda    RegisteredSymbol,X ; 4
    sta    GRP0               ; 3
    dex                       ; 2
    bpl    .loopDrawSymbol    ; 2³

    lda    #1                 ; 2
    sta    VDELP0             ; 3   delay
    sta    VDELP1             ; 3
    tax                       ; 2
    lda    #$70               ; 2
    jsr    HorizPosition      ; 6   for P1
    dex                       ; 2
    lda    #$68               ; 2
    jsr    HorizPosition      ; 6   for P0
    sta    WSYNC              ; 3
;-------------------------------------
    sta    HMOVE              ; 3

    lda    #$8D               ; 2   color Atari logo
    sta    COLUP1             ; 3
    lda    #3                 ; 2
    sta    NUSIZ0             ; 3   three close copies
    sta    NUSIZ1             ; 3
    ldx    #$10               ; @18    height of Atari logo

.loopDrawLogo:
    lda    LogoOne,X          ; 4
    sta    GRP0               ; 3
    sta    WSYNC              ; 3
;-------------------------------------
    lda    LogoTwo,X          ; 4
    sta    GRP1               ; 3
    lda    LogoThree,X        ; 4
    sta    GRP0               ; 3
    lda    LogoFour,X         ; 4
    sta    $C0                ; 3
    lda    LogoFive,X         ; 4
    ldy    LogoSix,X          ; 4
    txs                       ; 2
    nop                       ; 2
    nop                       ; 2
    cmp    $C0                ; 3
    ldx    $C0                ; 3
    stx    GRP1               ; 3
    sta    GRP0               ; 3
    sty    GRP1               ; 3
    sta    GRP0               ; 3
    tsx                       ; 2
    dex                       ; 2
    bpl    .loopDrawLogo      ; 2³

    ldx    #$FF               ; 2
    txs                       ; 2
    jmp    LF22D              ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

HorizPosition SUBROUTINE
    sec                       ; 2
    sbc    #$2F               ; 2
    ldy    #2                 ; 2
.loopDivide15:
    iny                       ; 2
    sbc    #$0F               ; 2
    bcs    .loopDivide15      ; 2³
    eor    #$FF               ; 2   toggle
    sbc    #6                 ; 2
    jsr    SwapNybbles        ; 6
    sty    WSYNC              ; 3
.loopDivide5:
    dey                       ; 2
    bpl    .loopDivide5       ; 2³
    sta    RESP0,X            ; 4
    sta    HMP0,X             ; 4
    rts                       ; 6

SwapNybbles SUBROUTINE
    asl                       ; 2
    adc    #0                 ; 2
    asl                       ; 2
    adc    #0                 ; 2
    asl                       ; 2
    adc    #0                 ; 2
    asl                       ; 2
    adc    #0                 ; 2
    rts                       ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF22D:
    ldx    screenFlag         ; 3    0 = Fuji, 1 = CompSys, 2 = GameNum
    lda    OverscanTab,X      ; 4
    sta    WSYNC              ; 3
    sta    TIM64T             ; 4
    ldx    #$FF               ; 2

.loopWaitOverscan:
    lda    INTIM              ; 4
    bne    .loopWaitOverscan  ; 2³

    stx    VBLANK             ; 3   start Vblank, enable latches, dump ports
    sta    WSYNC              ; 3
    sta    WSYNC              ; 3
    sta    WSYNC              ; 3
    stx    VSYNC              ; 3   Vsync starts
    sta    WSYNC              ; 3
    sta    WSYNC              ; 3
    sta    WSYNC              ; 3   3 scanlines
    sta    VSYNC              ; 3   Vsync ends
    sta    HMCLR              ; 3
    sta    VBLANK             ; 3   stop Vblank

    lda    #$30               ; 2
    sta    TIM64T             ; 4
    jsr    LF3B2              ; 6
    bne    LF275              ; 2³
    lda    screenFlag         ; 3
    cmp    #2                 ; 2
    beq    LF26A              ; 2³
    jsr    LF29F              ; 6
    jmp    LF003              ; 3
LF26A:
    jsr    LF2DA              ; 6
    bmi    LF272              ; 2³
    jmp    LF003              ; 3
LF272:
    jmp    LF2C1              ; 3
LF275:
    lda    screenFlag         ; 3
    bne    LF284              ; 2³
    jsr    LF3CE              ; 6
    lda    #$0A               ; 2   for large count
    jsr    LF3AB              ; 6
    jmp    LF003              ; 3
    
LF284:
    cmp    #1                 ; 2
    bne    LF293              ; 2³
    jsr    LF3E0              ; 6
    lda    #$1E               ; 2
    jsr    LF3AB              ; 6
    jmp    LF003              ; 3
LF293:
    lda    #0                 ; 2
    sta    screenFlag         ; 3
    lda    #$14               ; 2
    jsr    LF3AB              ; 6
    jmp    LF003              ; 3
LF29F:
    lda    SWCHB              ; 4
    eor    #$FF               ; 2
    and    #$34               ; 2
    beq    LF2B0              ; 2³
    jsr    LF3E0              ; 6
    lda    #$1E               ; 2
    jsr    LF3AB              ; 6
LF2B0:
    rts                       ; 6
    
LF2B1:
;unused code
    .byte $8D,$00,$08    ; sta    $0800     ; 4   LF2B1 is not called, maybe an indirect jump to LF2B1
    .byte $AD,$FD,$FF    ; lda    $FFFD     ; 4
    .byte $29,$10        ; and    #$10      ; 2
    .byte $A8            ; tay              ; 2
    .byte $A9,$00        ; lda    #0        ; 2
    .byte $8D,$00,$08    ; sta    $0800     ; 4
    .byte $98            ; tya              ; 2
    .byte $60            ; rts              ; 6
    
LF2C1:
    ldx    #$0E               ; 2
LF2C3:
    lda    CodeInRamTab,X     ; 4
    sta    gameLoad,X         ; 4
    dex                       ; 2
    bpl    LF2C3              ; 2³
    jmp    LF350              ; 3
    
CodeInRamTab:
    .byte $09,$80        ; ora    #$80      ; 2   starting with a jump to $AE
    .byte $8d,$00,$08    ; sta    $0800     ; 4
    .byte $85,$02        ; sta    WSYNC     ; 3
    .byte $85,$02        ; sta    WSYNC     ; 3
    .byte $6C,$FC,$FF    ; jmp    ($FFFC)   ; 5
    
LF2DA:
    lda    SWCHB              ; 4
    eor    #$20               ; 2
    tay                       ; 2
    lda    $C1                ; 3
    sty    $C1                ; 3
    tay                       ; 2
    and    $C1                ; 3
    ora    $C2                ; 3
    sta    $C2                ; 3
    tya                       ; 2
    ora    $C1                ; 3
    and    $C2                ; 3
    tay                       ; 2
    eor    $C2                ; 3
    and    $C2                ; 3
    sty    $C2                ; 3
    cmp    #0                 ; 2
    bne    LF2FC              ; 2³
    rts                       ; 6

LF2FC:
    pha                       ; 3
    lda    #$1E               ; 2
    jsr    LF3AB              ; 6
    pla                       ; 4
    lsr                       ; 2
    lsr                       ; 2
    lsr                       ; 2
    bcc    LF30D              ; 2³
    inc    $AC                ; 5
    jmp    LF31C              ; 3
LF30D:
    lsr                       ; 2
    lsr                       ; 2
    bcc    LF316              ; 2³
    inc    $AD                ; 5
    jmp    LF31C              ; 3
LF316:
    lsr                       ; 2
    bcc    LF31C              ; 2³
    jmp    LF360              ; 3
LF31C:
    lda    $AD                ; 3
    cmp    #$0A               ; 2
    bne    LF326              ; 2³
    lda    #0                 ; 2
    sta    $AD                ; 3
LF326:
    lda    $AC                ; 3
    cmp    $C6                ; 3
    bne    LF330              ; 2³
    lda    #0                 ; 2
    sta    $AC                ; 3
LF330:
    ldx    $C6                ; 3
    dex                       ; 2
    cpx    $AC                ; 3
    bne    LF341              ; 2³
    lda    $AD                ; 3
    cmp    $C5                ; 3
    bcc    LF341              ; 2³
    lda    #0                 ; 2
    sta    $AD                ; 3
LF341:
    lda    $AC                ; 3
    bne    LF34D              ; 2³
    lda    $AD                ; 3
    bne    LF34D              ; 2³
    lda    #1                 ; 2
    sta    $AD                ; 3
LF34D:
    lda    #0                 ; 2
    rts                       ; 6

LF350:
    lda    $AC                ; 3
    asl                       ; 2
    asl                       ; 2
    asl                       ; 2
    clc                       ; 2
    adc    $AC                ; 3
    adc    $AC                ; 3
    adc    $AD                ; 3
    jsr.w  gameLoad           ; 6  jumping to ram location $AE as if it were rom space, $AE has code to trigger the bankswitch
    rts                       ; 6  but, do you ever return here?

LF360:
    lda    #$FF               ; 2
    rts                       ; 6


START:
    sei                       ; 2
    cld                       ; 2
    ldx    #$FF               ; 2
    txs                       ; 2
    inx                       ; 2
    txa                       ; 2
.loopClear:
    sta    $80,X              ; 4
    inx                       ; 2
    bne    .loopClear         ; 2³

    lda    #1                 ; 2
    sta    $AD                ; 3
    ldy    #$FF               ; 2
    lda    #0                 ; 2
    sta    $AC                ; 3
    sta    screenFlag         ; 3
    sta    SWACNT             ; 4   all inputs
    sta    SWBCNT             ; 4   hard wired as input already?
    jsr    LF38C              ; 6
    lda    #$14               ; 2
    jsr    LF3AB              ; 6
    jmp    LF003              ; 3
    
;-------------------------------------
    
LF38C SUBROUTINE
    lda    $0800              ; 4   game number ??
    and    #$0F               ; 2
    sta    $C0                ; 3
    lda    #$2F               ; 2
    sec                       ; 2
    sbc    $C0                ; 3
    ldx    #0                 ; 2
LF39A:
    sec                       ; 2
    sbc    #$0A               ; 2
    bmi    LF3A3              ; 2³
    inx                       ; 2
    jmp    LF39A              ; 3
    
LF3A3:
    clc                       ; 2
    adc    #$0B               ; 2
    sta    $C5                ; 3
    inx                       ; 2
    stx    $C6                ; 3

LF3AB SUBROUTINE
    sta    largeCount         ; 3
    lda    #$3C               ; 2
    sta    smallCount         ; 3
    rts                       ; 6

;-------------------------------------

LF3B2 SUBROUTINE
    dec    smallCount         ; 5
    bne    LF3C1              ; 2³
    dec    largeCount         ; 5
    bne    LF3BD              ; 2³
    lda    #$FF               ; 2
    rts                       ; 6

LF3BD:
    lda    #$3C               ; 2
    sta    smallCount         ; 3
LF3C1:
    lda    #0                 ; 2
    rts                       ; 6

;-------------------------------------

RamClear SUBROUTINE
    ldx    #$18               ; 2
    lda    #0                 ; 2
.loopRamClear:
    sta    $90,X              ; 4
    dex                       ; 2
    bpl    .loopRamClear      ; 2³
    rts                       ; 6
    
;-------------------------------------

LF3CE:
    jsr    RamClear           ; 6
    lda    #1                 ; 2   Atari Video Computer System screen
    sta    screenFlag         ; 3
    ldx    #$18               ; 2
.loopVariables1:
    lda    LF731,X            ; 4
    sta    $90,X              ; 4   $90 - $A8
    dex                       ; 2
    bpl    .loopVariables1    ; 2³
    rts                       ; 6

LF3E0:
    jsr    RamClear           ; 6
    lda    #2                 ; 2   Enter Game Number screen
    sta    screenFlag         ; 3
    ldx    #$18               ; 2
.loopVariables2:
    lda    LF749,X            ; 4
    sta    $90,X              ; 4
    dex                       ; 2
    bpl    .loopVariables2    ; 2³
    rts                       ; 6

    .byte $00 ; |        | $F3F2
    .byte $00 ; |        | $F3F3
    .byte $00 ; |        | $F3F4
    .byte $00 ; |        | $F3F5
    .byte $00 ; |        | $F3F6
    .byte $00 ; |        | $F3F7
    .byte $00 ; |        | $F3F8
    .byte $00 ; |        | $F3F9
    .byte $00 ; |        | $F3FA
    .byte $00 ; |        | $F3FB
    .byte $00 ; |        | $F3FC
    .byte $00 ; |        | $F3FD
    .byte $00 ; |        | $F3FE
    .byte $00 ; |        | $F3FF

    .byte $02 ; |      X | $F400
    .byte $BB ; |X XXX XX| $F401
    .byte $5A ; | X XX X | $F402
    .byte $30 ; |  XX    | $F403
    .byte $5F ; | X XXXXX| $F404
    .byte $EE ; |XXX XXX | $F405
    .byte $3D ; |  XXXX X| $F406
    .byte $A8 ; |X X X   | $F407
    .byte $00 ; |        | $F408
    .byte $00 ; |        | $F409
    .byte $00 ; |        | $F40A
    .byte $00 ; |        | $F40B
    .byte $00 ; |        | $F40C
    .byte $00 ; |        | $F40D
    .byte $00 ; |        | $F40E
    .byte $00 ; |        | $F40F
    .byte $00 ; |        | $F410
    .byte $00 ; |        | $F411
    .byte $00 ; |        | $F412
    .byte $00 ; |        | $F413
    .byte $00 ; |        | $F414
    .byte $00 ; |        | $F415
    .byte $00 ; |        | $F416
    .byte $00 ; |        | $F417
    .byte $00 ; |        | $F418
    .byte $00 ; |        | $F419
    .byte $00 ; |        | $F41A
    .byte $00 ; |        | $F41B
    .byte $00 ; |        | $F41C
    .byte $00 ; |        | $F41D
    .byte $00 ; |        | $F41E
    .byte $00 ; |        | $F41F
    .byte $00 ; |        | $F420
    .byte $00 ; |        | $F421
    .byte $00 ; |        | $F422
    .byte $00 ; |        | $F423
    .byte $00 ; |        | $F424
    .byte $00 ; |        | $F425
    .byte $00 ; |        | $F426
    .byte $00 ; |        | $F427
    .byte $00 ; |        | $F428
    .byte $00 ; |        | $F429
    .byte $00 ; |        | $F42A
    .byte $00 ; |        | $F42B
    .byte $00 ; |        | $F42C
    .byte $00 ; |        | $F42D
    .byte $00 ; |        | $F42E
    .byte $00 ; |        | $F42F
    .byte $00 ; |        | $F430
    .byte $00 ; |        | $F431
    .byte $00 ; |        | $F432
    .byte $00 ; |        | $F433
    .byte $00 ; |        | $F434
    .byte $00 ; |        | $F435
    .byte $00 ; |        | $F436
    .byte $00 ; |        | $F437
    .byte $00 ; |        | $F438
    .byte $00 ; |        | $F439
    .byte $00 ; |        | $F43A
    .byte $00 ; |        | $F43B
    .byte $00 ; |        | $F43C
    .byte $00 ; |        | $F43D
    .byte $00 ; |        | $F43E
    .byte $00 ; |        | $F43F

FujiSides:
    .byte $03 ; |      XX|  62 - $F440   bottom of Fuji
    .byte $07 ; |     XXX|  61 - $F441
    .byte $0F ; |    XXXX|  60 - $F442
    .byte $1F ; |   XXXXX|  59 - $F443
    .byte $3F ; |  XXXXXX|  58 - $F444
    .byte $3F ; |  XXXXXX|  57 - $F445
    .byte $7F ; | XXXXXXX|  56 - $F446
    .byte $7F ; | XXXXXXX|  55 - $F447
    .byte $7F ; | XXXXXXX|  54 - $F448
    .byte $3F ; |  XXXXXX|  53 - $F449
    .byte $3F ; |  XXXXXX|  52 - $F44A
    .byte $1F ; |   XXXXX|  51 - $F44B
    .byte $1F ; |   XXXXX|  50 - $F44C
    .byte $1F ; |   XXXXX|  49 - $F44D
    .byte $1F ; |   XXXXX|  48 - $F44E
    .byte $0F ; |    XXXX|  47 - $F44F
    .byte $0F ; |    XXXX|  46 - $F450
    .byte $0F ; |    XXXX|  45 - $F451
    .byte $0F ; |    XXXX|  44 - $F452
    .byte $0F ; |    XXXX|  43 - $F453
    .byte $07 ; |     XXX|  42 - $F454
    .byte $07 ; |     XXX|  41 - $F455
    .byte $07 ; |     XXX|  40 - $F456
    .byte $07 ; |     XXX|  39 - $F457
    .byte $07 ; |     XXX|  38 - $F458
    .byte $07 ; |     XXX|  37 - $F459
    .byte $07 ; |     XXX|  36 - $F45A
    .byte $07 ; |     XXX|  35 - $F45B
    .byte $03 ; |      XX|  34 - $F45C
    .byte $03 ; |      XX|  33 - $F45D
    .byte $03 ; |      XX|  32 - $F45E
    .byte $03 ; |      XX|  31 - $F45F
    .byte $03 ; |      XX|  30 - $F460
    .byte $03 ; |      XX|  29 - $F461
    .byte $03 ; |      XX|  28 - $F462
    .byte $03 ; |      XX|  27 - $F463
    .byte $03 ; |      XX|  26 - $F464
    .byte $03 ; |      XX|  25 - $F465
    .byte $03 ; |      XX|  24 - $F466
    .byte $03 ; |      XX|  23 - $F467
    .byte $03 ; |      XX|  22 - $F468
    .byte $03 ; |      XX|  21 - $F469
    .byte $03 ; |      XX|  20 - $F46A
    .byte $03 ; |      XX|  19 - $F46B
    .byte $03 ; |      XX|  18 - $F46C
    .byte $03 ; |      XX|  17 - $F46D
    .byte $03 ; |      XX|  16 - $F46E
    .byte $03 ; |      XX|  15 - $F46F
    .byte $03 ; |      XX|  14 - $F470
    .byte $03 ; |      XX|  13 - $F471
    .byte $03 ; |      XX|  12 - $F472
    .byte $03 ; |      XX|  11 - $F473
    .byte $03 ; |      XX|  10 - $F474
    .byte $03 ; |      XX|   9 - $F475
    .byte $03 ; |      XX|   8 - $F476
    .byte $03 ; |      XX|   7 - $F477
    .byte $03 ; |      XX|   6 - $F478
    .byte $03 ; |      XX|   5 - $F479
    .byte $03 ; |      XX|   4 - $F47A
    .byte $03 ; |      XX|   3 - $F47B
    .byte $03 ; |      XX|   2 - $F47C
FujiTopSides:
    .byte $03 ; |      XX|   1 - $F47D   very top line of the sides for the Fuji symbol

FujiHMP0_Tab:
    .byte  NO_MOTION      ; 62 - $F47E   bottom of Fuji
    .byte  LEFT_2         ; 61 - $F47F
    .byte  LEFT_2         ; 60 - $F480
    .byte  LEFT_2         ; 59 - $F481
    .byte  LEFT_2         ; 58 - $F482
    .byte  NO_MOTION      ; 57 - $F483
    .byte  LEFT_2         ; 56 - $F484
    .byte  NO_MOTION      ; 55 - $F485
    .byte  LEFT_1         ; 54 - $F486
    .byte  LEFT_1         ; 53 - $F487
    .byte  LEFT_2         ; 52 - $F488
    .byte  NO_MOTION      ; 51 - $F489
    .byte  LEFT_1         ; 50 - $F48A
    .byte  LEFT_1         ; 49 - $F48B
    .byte  LEFT_1         ; 48 - $F48C
    .byte  RIGHT_1        ; 47 - $F48D
    .byte  LEFT_1         ; 46 - $F48E
    .byte  LEFT_1         ; 45 - $F48F
    .byte  LEFT_1         ; 44 - $F490
    .byte  NO_MOTION      ; 43 - $F491
    .byte  RIGHT_1        ; 42 - $F492
    .byte  NO_MOTION      ; 41 - $F493
    .byte  LEFT_1         ; 40 - $F494
    .byte  NO_MOTION      ; 39 - $F495
    .byte  NO_MOTION      ; 38 - $F496
    .byte  LEFT_1         ; 37 - $F497
    .byte  NO_MOTION      ; 36 - $F498
    .byte  NO_MOTION      ; 35 - $F499
    .byte  RIGHT_1        ; 34 - $F49A
    .byte  NO_MOTION      ; 33 - $F49B
    .byte  NO_MOTION      ; 32 - $F49C
    .byte  LEFT_1         ; 31 - $F49D

     FILL_NOMOTION 30     ; 1-30   $F49E - $F4BB

    .byte $00 ; |        | $F4BC  free byte

FujiHMM0_Tab:
    .byte  NO_MOTION      ; 62 - $F4BD   bottom of Fuji
    .byte  LEFT_3         ; 61 - $F4BE
    .byte  LEFT_2         ; 60 - $F4BF
    .byte  LEFT_2         ; 59 - $F4C0
    .byte  LEFT_1         ; 58 - $F4C1
    .byte  LEFT_1         ; 57 - $F4C2
    .byte  LEFT_1         ; 56 - $F4C3
    .byte  LEFT_1         ; 55 - $F4C4
    .byte  LEFT_1         ; 54 - $F4C5
    .byte  LEFT_1         ; 53 - $F4C6
    .byte  LEFT_1         ; 52 - $F4C7
    .byte  LEFT_1         ; 51 - $F4C8
    .byte  LEFT_1         ; 50 - $F4C9
    .byte  NO_MOTION      ; 49 - $F4CA
    .byte  LEFT_1         ; 48 - $F4CB
    .byte  NO_MOTION      ; 47 - $F4CC
    .byte  LEFT_1         ; 46 - $F4CD
    .byte  NO_MOTION      ; 45 - $F4CE
    .byte  LEFT_1         ; 44 - $F4CF
    .byte  NO_MOTION      ; 43 - $F4D0
    .byte  NO_MOTION      ; 42 - $F4D1
    .byte  NO_MOTION      ; 41 - $F4D2
    .byte  LEFT_1         ; 40 - $F4D3

     FILL_NOMOTION 39     ; 1-39   $F4D4 - $F4FA

    .byte $00 ; |        | $F4FB   free bytes until $F5 page
    .byte $00 ; |        | $F4FC
    .byte $00 ; |        | $F4FD
    .byte $00 ; |        | $F4FE
    .byte $00 ; |        | $F4FF

FujiHMP1_Tab:
    .byte  NO_MOTION      ; 62 - $F500   bottom of Fuji
    .byte  RIGHT_2        ; 61 - $F501
    .byte  RIGHT_2        ; 60 - $F502
    .byte  RIGHT_2        ; 59 - $F503
    .byte  RIGHT_2        ; 58 - $F504
    .byte  NO_MOTION      ; 57 - $F505
    .byte  RIGHT_2        ; 56 - $F506
    .byte  NO_MOTION      ; 55 - $F507
    .byte  RIGHT_1        ; 54 - $F508
    .byte  RIGHT_1        ; 53 - $F509
    .byte  RIGHT_2        ; 52 - $F50A
    .byte  NO_MOTION      ; 51 - $F50B
    .byte  RIGHT_1        ; 50 - $F50C
    .byte  RIGHT_1        ; 49 - $F50D
    .byte  RIGHT_1        ; 48 - $F50E
    .byte  LEFT_1         ; 47 - $F50F
    .byte  RIGHT_1        ; 46 - $F510
    .byte  RIGHT_1        ; 45 - $F511
    .byte  RIGHT_1        ; 44 - $F512
    .byte  NO_MOTION      ; 43 - $F513
    .byte  LEFT_1         ; 42 - $F514
    .byte  NO_MOTION      ; 41 - $F515
    .byte  RIGHT_1        ; 40 - $F516
    .byte  NO_MOTION      ; 39 - $F517
    .byte  NO_MOTION      ; 38 - $F518
    .byte  RIGHT_1        ; 37 - $F519
    .byte  NO_MOTION      ; 36 - $F51A
    .byte  NO_MOTION      ; 35 - $F51B
    .byte  LEFT_1         ; 34 - $F51C
    .byte  NO_MOTION      ; 33 - $F51D
    .byte  NO_MOTION      ; 32 - $F51E
    .byte  RIGHT_1        ; 31 - $F51F

     FILL_NOMOTION 30     ; 1-30   $F520 - $F53D

    .byte $00 ; |        | $F53E  free byte

FujiHMM1_Tab:
    .byte  NO_MOTION      ; 62 - $F53F   bottom of Fuji
    .byte  RIGHT_3        ; 61 - $F540
    .byte  RIGHT_2        ; 60 - $F541
    .byte  RIGHT_2        ; 59 - $F542
    .byte  RIGHT_1        ; 58 - $F543
    .byte  RIGHT_1        ; 57 - $F544
    .byte  RIGHT_1        ; 56 - $F545
    .byte  RIGHT_1        ; 55 - $F546
    .byte  RIGHT_1        ; 54 - $F547
    .byte  RIGHT_1        ; 53 - $F548
    .byte  RIGHT_1        ; 52 - $F549
    .byte  RIGHT_1        ; 51 - $F54A
    .byte  RIGHT_1        ; 50 - $F54B
    .byte  NO_MOTION      ; 49 - $F54C
    .byte  RIGHT_1        ; 48 - $F54D
    .byte  NO_MOTION      ; 47 - $F54E
    .byte  RIGHT_1        ; 46 - $F54F
    .byte  NO_MOTION      ; 45 - $F550
    .byte  RIGHT_1        ; 44 - $F551
    .byte  NO_MOTION      ; 43 - $F552
    .byte  NO_MOTION      ; 42 - $F553
    .byte  NO_MOTION      ; 41 - $F554
    .byte  RIGHT_1        ; 40 - $F555

     FILL_NOMOTION 39     ; 1-39   $F556 - $F57C

    .byte $00 ; |        | $F57D  free byte


HmoveTab:
    .byte  $69 ; $F57E   Hmove P0
    .byte  $85 ; $F57F   Hmove P1
    .byte  $7A ; $F580   Hmove M0
    .byte  $87 ; $F581   Hmove M1
OverscanTab:
    .byte  $6D ; $F582   Fuji screen
    .byte  $5D ; $F583   Computer System screen
    .byte  $4A ; $F584   Game Number screen


  REPEAT ($F600 - *) ; free bytes until start of $F6 page
    .byte 0
  REPEND


       ORG $F600

Zero:
    .byte $7C ; | XXXXX  | $F600
    .byte $C6 ; |XX   XX | $F601
    .byte $E6 ; |XXX  XX | $F602
    .byte $D6 ; |XX X XX | $F603
    .byte $CE ; |XX  XXX | $F604
    .byte $C6 ; |XX   XX | $F605
    .byte $7C ; | XXXXX  | $F606
One:
    .byte $FC ; |XXXXXX  | $F607
    .byte $30 ; |  XX    | $F608
    .byte $30 ; |  XX    | $F609
    .byte $30 ; |  XX    | $F60A
    .byte $30 ; |  XX    | $F60B
    .byte $70 ; | XXX    | $F60C
    .byte $30 ; |  XX    | $F60D
Two:
    .byte $FE ; |XXXXXXX | $F60E
    .byte $E0 ; |XXX     | $F60F
    .byte $78 ; | XXXX   | $F610
    .byte $3C ; |  XXXX  | $F611
    .byte $0E ; |    XXX | $F612
    .byte $C6 ; |XX   XX | $F613
    .byte $7C ; | XXXXX  | $F614
Three:
    .byte $7C ; | XXXXX  | $F615
    .byte $C6 ; |XX   XX | $F616
    .byte $06 ; |     XX | $F617
    .byte $3C ; |  XXXX  | $F618
    .byte $18 ; |   XX   | $F619
    .byte $0C ; |    XX  | $F61A
    .byte $7E ; | XXXXXX | $F61B
Four:
    .byte $0C ; |    XX  | $F61C
    .byte $0C ; |    XX  | $F61D
    .byte $FE ; |XXXXXXX | $F61E
    .byte $CC ; |XX  XX  | $F61F
    .byte $6C ; | XX XX  | $F620
    .byte $3C ; |  XXXX  | $F621
    .byte $1C ; |   XXX  | $F622
Five:
    .byte $7C ; | XXXXX  | $F623
    .byte $C6 ; |XX   XX | $F624
    .byte $06 ; |     XX | $F625
    .byte $06 ; |     XX | $F626
    .byte $FC ; |XXXXXX  | $F627
    .byte $C0 ; |XX      | $F628
    .byte $FC ; |XXXXXX  | $F629
Six:
    .byte $7C ; | XXXXX  | $F62A
    .byte $C6 ; |XX   XX | $F62B
    .byte $C6 ; |XX   XX | $F62C
    .byte $FC ; |XXXXXX  | $F62D
    .byte $C0 ; |XX      | $F62E
    .byte $60 ; | XX     | $F62F
    .byte $3C ; |  XXXX  | $F630
Seven:
    .byte $30 ; |  XX    | $F631
    .byte $30 ; |  XX    | $F632
    .byte $30 ; |  XX    | $F633
    .byte $18 ; |   XX   | $F634
    .byte $0C ; |    XX  | $F635
    .byte $C6 ; |XX   XX | $F636
    .byte $FE ; |XXXXXXX | $F637
Eight:
    .byte $7C ; | XXXXX  | $F638
    .byte $C6 ; |XX   XX | $F639
    .byte $C6 ; |XX   XX | $F63A
    .byte $7C ; | XXXXX  | $F63B
    .byte $C6 ; |XX   XX | $F63C
    .byte $C6 ; |XX   XX | $F63D
    .byte $7C ; | XXXXX  | $F63E
Nine:
    .byte $78 ; | XXXX   | $F63F
    .byte $0C ; |    XX  | $F640
    .byte $06 ; |     XX | $F641
    .byte $7E ; | XXXXXX | $F642
    .byte $C6 ; |XX   XX | $F643
    .byte $C6 ; |XX   XX | $F644
    .byte $7C ; | XXXXX  | $F645
Blank_Digit:
    .byte $00 ; |        | $F646
    .byte $00 ; |        | $F647
    .byte $00 ; |        | $F648
    .byte $00 ; |        | $F649
    .byte $00 ; |        | $F64A
    .byte $00 ; |        | $F64B
    .byte $00 ; |        | $F64C

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;       XX  XXX  XX  XXXX X
;      XXXX  X  XXXX X  X X
;      X  X  X  X  X X  X X
;      X  X  X  X  X XXXX X
;      XXXX  X  XXXX X X  X
;      X  X  X  X  X X  X X
;      X  X  X  X  X X  X X
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;load blank digit for PF0

    .byte $02 ; |      X | $F64D  PF1
    .byte $02 ; |      X | $F64E
    .byte $03 ; |      XX| $F64F
    .byte $02 ; |      X | $F650
    .byte $02 ; |      X | $F651
    .byte $03 ; |      XX| $F652
    .byte $01 ; |       X| $F653

    .byte $92 ; |X  X  X | $F654  PF2 reflects
    .byte $92 ; |X  X  X | $F655
    .byte $93 ; |X  X  XX| $F656
    .byte $92 ; |X  X  X | $F657
    .byte $92 ; |X  X  X | $F658
    .byte $93 ; |X  X  XX| $F659
    .byte $39 ; |  XXX  X| $F65A

    .byte $40 ; | X      | $F65B  PF0 reflects, only uses high byte
    .byte $40 ; | X      | $F65C
    .byte $70 ; | XXX    | $F65D
    .byte $40 ; | X      | $F65E
    .byte $40 ; | X      | $F65F
    .byte $70 ; | XXX    | $F660
    .byte $30 ; |  XX    | $F661

    .byte $94 ; |X  X X  | $F662  PF1
    .byte $94 ; |X  X X  | $F663
    .byte $A4 ; |X X  X  | $F664
    .byte $F4 ; |XXXX X  | $F665
    .byte $94 ; |X  X X  | $F666
    .byte $94 ; |X  X X  | $F667
    .byte $F4 ; |XXXX X  | $F668

;load blank digit for PF2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      X  X X XXX  XXXX XXXX
;      X  X X X  X X    X  X
;      X  X X X  X X    X  X
;      X  X X X  X XXX  X  X
;      X  X X X  X X    X  X
;      XXXX X X  X X    X  X
;       XX  X XXX  XXXX XXXX
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;load blank digit for PF0

    .byte $03 ; |      XX| $F669  PF1
    .byte $07 ; |     XXX| $F66A
    .byte $04 ; |     X  | $F66B
    .byte $04 ; |     X  | $F66C
    .byte $04 ; |     X  | $F66D
    .byte $04 ; |     X  | $F66E
    .byte $04 ; |     X  | $F66F

    .byte $74 ; | XXX X  | $F670  PF2 reflects
    .byte $95 ; |X  X X X| $F671
    .byte $95 ; |X  X X X| $F672
    .byte $95 ; |X  X X X| $F673
    .byte $95 ; |X  X X X| $F674
    .byte $95 ; |X  X X X| $F675
    .byte $75 ; | XXX X X| $F676

    .byte $E0 ; |XXX     | $F677  PF0 reflects, only uses high byte
    .byte $20 ; |  X     | $F678
    .byte $20 ; |  X     | $F679
    .byte $E0 ; |XXX     | $F67A
    .byte $20 ; |  X     | $F67B
    .byte $20 ; |  X     | $F67C
    .byte $E0 ; |XXX     | $F67D

    .byte $BC ; |X XXXX  | $F67E  PF1
    .byte $24 ; |  X  X  | $F67F
    .byte $24 ; |  X  X  | $F680
    .byte $24 ; |  X  X  | $F681
    .byte $24 ; |  X  X  | $F682
    .byte $24 ; |  X  X  | $F683
    .byte $BC ; |X XXXX  | $F684

;load blank digit for PF2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      XXXX XXXX X   X XXX X  X XXX XXXX XXXX
;      X    X  X XX XX X X X  X  X  X    X  X
;      X    X  X X X X X X X  X  X  X    X  X
;      X    X  X X   X XXX X  X  X  XXX  XXXX
;      X    X  X X   X X   X  X  X  X    X X
;      X    X  X X   X X   X  X  X  X    X  X
;      XXXX XXXX X   X X   XXXX  X  XXXX X  X
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $E0 ; |XXX     | $F685  PF0 reflects, only uses high byte
    .byte $20 ; |  X     | $F686
    .byte $20 ; |  X     | $F687
    .byte $20 ; |  X     | $F688
    .byte $20 ; |  X     | $F689
    .byte $20 ; |  X     | $F68A
    .byte $E0 ; |XXX     | $F68B

    .byte $BD ; |X XXXX X| $F68C  PF1
    .byte $25 ; |  X  X X| $F68D
    .byte $25 ; |  X  X X| $F68E
    .byte $25 ; |  X  X X| $F68F
    .byte $25 ; |  X  X X| $F690
    .byte $25 ; |  X  X X| $F691
    .byte $BD ; |X XXXX X| $F692

    .byte $28 ; |  X X   | $F693  PF2 reflects
    .byte $28 ; |  X X   | $F694
    .byte $28 ; |  X X   | $F695
    .byte $E8 ; |XXX X   | $F696
    .byte $AA ; |X X X X | $F697
    .byte $AD ; |X X XX X| $F698
    .byte $E8 ; |XXX X   | $F699

    .byte $E0 ; |XXX     | $F69A  PF0 reflects, only uses high byte
    .byte $20 ; |  X     | $F69B
    .byte $20 ; |  X     | $F69C
    .byte $20 ; |  X     | $F69D
    .byte $20 ; |  X     | $F69E
    .byte $20 ; |  X     | $F69F
    .byte $20 ; |  X     | $F6A0

    .byte $93 ; |X  X  XX| $F6A1  PF1
    .byte $92 ; |X  X  X | $F6A2
    .byte $92 ; |X  X  X | $F6A3
    .byte $93 ; |X  X  XX| $F6A4
    .byte $92 ; |X  X  X | $F6A5
    .byte $92 ; |X  X  X | $F6A6
    .byte $BB ; |X XXX XX| $F6A7

    .byte $4B ; | X  X XX| $F6A8  PF2 reflects
    .byte $48 ; | X  X   | $F6A9
    .byte $28 ; |  X X   | $F6AA
    .byte $79 ; | XXXX  X| $F6AB
    .byte $48 ; | X  X   | $F6AC
    .byte $48 ; | X  X   | $F6AD
    .byte $7B ; | XXXX XX| $F6AE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      XXXX X X XXXX XXX XXXX X   X
;      X    X X X     X  X    XX XX
;      X    X X X     X  X    X X X
;      XXXX  X  XXXX  X  XXX  X   X
;         X  X     X  X  X    X   X
;         X  X     X  X  X    X   X
;      XXXX  X  XXXX  X  XXXX X   X
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;load blank digit for PF0

    .byte $3C ; |  XXXX  | $F6AF  PF1
    .byte $04 ; |     X  | $F6B0
    .byte $04 ; |     X  | $F6B1
    .byte $3C ; |  XXXX  | $F6B2
    .byte $21 ; |  X    X| $F6B3
    .byte $21 ; |  X    X| $F6B4
    .byte $3D ; |  XXXX X| $F6B5

    .byte $79 ; | XXXX  X| $F6B6  PF2 reflects
    .byte $41 ; | X     X| $F6B7
    .byte $41 ; | X     X| $F6B8
    .byte $79 ; | XXXX  X| $F6B9
    .byte $0A ; |    X X | $F6BA
    .byte $0A ; |    X X | $F6BB
    .byte $7A ; | XXXX X | $F6BC

    .byte $20 ; |  X     | $F6BD  PF0 reflects, only uses high byte
    .byte $20 ; |  X     | $F6BE
    .byte $20 ; |  X     | $F6BF
    .byte $20 ; |  X     | $F6C0
    .byte $20 ; |  X     | $F6C1
    .byte $20 ; |  X     | $F6C2
    .byte $70 ; | XXX    | $F6C3

    .byte $F4 ; |XXXX X  | $F6C4  PF1
    .byte $84 ; |X    X  | $F6C5
    .byte $84 ; |X    X  | $F6C6
    .byte $E4 ; |XXX  X  | $F6C7
    .byte $85 ; |X    X X| $F6C8
    .byte $86 ; |X    XX | $F6C9
    .byte $F4 ; |XXXX X  | $F6CA

    .byte $02 ; |      X | $F6CB  PF2 reflects
    .byte $02 ; |      X | $F6CC
    .byte $02 ; |      X | $F6CD
    .byte $02 ; |      X | $F6CE
    .byte $02 ; |      X | $F6CF
    .byte $03 ; |      XX| $F6D0
    .byte $02 ; |      X | $F6D1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      XXXX X  X XXX XXXX XXXX
;      X    XX X  X  X    X  X
;      X    X XX  X  X    X  X
;      XXX  X  X  X  XXX  XXXX
;      X    X  X  X  X    X X
;      X    X  X  X  X    X  X
;      XXXX X  X  X  XXXX X  X
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;load blank digit for PF0

    .byte $0F ; |    XXXX| $F6D2  PF1
    .byte $08 ; |    X   | $F6D3
    .byte $08 ; |    X   | $F6D4
    .byte $0E ; |    XXX | $F6D5
    .byte $08 ; |    X   | $F6D6
    .byte $08 ; |    X   | $F6D7
    .byte $0F ; |    XXXX| $F6D8

    .byte $92 ; |X  X  X | $F6D9  PF2 reflects
    .byte $92 ; |X  X  X | $F6DA
    .byte $92 ; |X  X  X | $F6DB
    .byte $92 ; |X  X  X | $F6DC
    .byte $9A ; |X  XX X | $F6DD
    .byte $96 ; |X  X XX | $F6DE
    .byte $D2 ; |XX X  X | $F6DF

    .byte $C0 ; |XX      | $F6E0  PF0 reflects, only uses high byte
    .byte $40 ; | X      | $F6E1
    .byte $40 ; | X      | $F6E2
    .byte $C0 ; |XX      | $F6E3
    .byte $40 ; | X      | $F6E4
    .byte $40 ; | X      | $F6E5
    .byte $D0 ; |XX X    | $F6E6

    .byte $D2 ; |XX X  X | $F6E7  PF1
    .byte $12 ; |   X  X | $F6E8
    .byte $14 ; |   X X  | $F6E9
    .byte $9E ; |X  XXXX | $F6EA
    .byte $12 ; |   X  X | $F6EB
    .byte $12 ; |   X  X | $F6EC
    .byte $DE ; |XX XXXX | $F6ED

;load blank digit for PF2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      XXXX  XX  X   X XXXX
;      X    XXXX XX XX X
;      X    X  X X X X X
;      X XX X  X X   X XXX
;      X  X XXXX X   X X
;      X  X X  X X   X X
;      XXXX X  X X   X XXXX
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;load blank digit for PF0

    .byte $03 ; |      XX| $F6EE  PF1
    .byte $02 ; |      X | $F6EF
    .byte $02 ; |      X | $F6F0
    .byte $02 ; |      X | $F6F1
    .byte $02 ; |      X | $F6F2
    .byte $02 ; |      X | $F6F3
    .byte $03 ; |      XX| $F6F4

    .byte $4B ; | X  X XX| $F6F5  PF2 reflects
    .byte $4A ; | X  X X | $F6F6
    .byte $7A ; | XXXX X | $F6F7
    .byte $4B ; | X  X XX| $F6F8
    .byte $48 ; | X  X   | $F6F9
    .byte $78 ; | XXXX   | $F6FA
    .byte $33 ; |  XX  XX| $F6FB

    .byte $00 ; |        | $F6FC  free bytes to $F7 page
    .byte $00 ; |        | $F6FD
    .byte $00 ; |        | $F6FE
    .byte $00 ; |        | $F6FF

    .byte $10 ; |   X    | $F700  PF0 reflects, only uses high byte
    .byte $10 ; |   X    | $F701
    .byte $10 ; |   X    | $F702
    .byte $10 ; |   X    | $F703
    .byte $50 ; | X X    | $F704
    .byte $B0 ; |X XX    | $F705
    .byte $10 ; |   X    | $F706

    .byte $BC ; |X XXXX  | $F707  PF1
    .byte $A0 ; |X X     | $F708
    .byte $A0 ; |X X     | $F709
    .byte $B8 ; |X XXX   | $F70A
    .byte $A0 ; |X X     | $F70B
    .byte $A0 ; |X X     | $F70C
    .byte $BC ; |X XXXX  | $F70D

;load blank digit for PF2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      X  X X  X X   X XXX  XXXX XXXX
;      XX X X  X XX XX X  X X    X  X
;      X XX X  X X X X X  X X    X  X
;      X  X X  X X   X XXX  XXX  XXXX
;      X  X X  X X   X X  X X    X X
;      X  X X  X X   X X  X X    X  X
;      X  X XXXX X   X XXX  XXXX X  X
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;load blank digit for PF0

    .byte $4B ; | X  X XX| $F70E  PF1
    .byte $4A ; | X  X X | $F70F
    .byte $4A ; | X  X X | $F710
    .byte $4A ; | X  X X | $F711
    .byte $5A ; | X XX X | $F712
    .byte $6A ; | XX X X | $F713
    .byte $4A ; | X  X X | $F714

    .byte $8B ; |X   X XX| $F715  PF2 reflects
    .byte $8A ; |X   X X | $F716
    .byte $8A ; |X   X X | $F717
    .byte $8A ; |X   X X | $F718
    .byte $AA ; |X X X X | $F719
    .byte $DA ; |XX XX X | $F71A
    .byte $8A ; |X   X X | $F71B

    .byte $E0 ; |XXX     | $F71C  PF0 reflects, only uses high byte
    .byte $20 ; |  X     | $F71D
    .byte $20 ; |  X     | $F71E
    .byte $E0 ; |XXX     | $F71F
    .byte $20 ; |  X     | $F720
    .byte $20 ; |  X     | $F721
    .byte $E0 ; |XXX     | $F722

    .byte $3D ; |  XXXX X| $F723  PF1
    .byte $A1 ; |X X    X| $F724
    .byte $A1 ; |X X    X| $F725
    .byte $39 ; |  XXX  X| $F726
    .byte $A1 ; |X X    X| $F727
    .byte $A1 ; |X X    X| $F728
    .byte $3D ; |  XXXX X| $F729

    .byte $04 ; |     X  | $F72A  PF2 reflects
    .byte $04 ; |     X  | $F72B
    .byte $02 ; |      X | $F72C
    .byte $07 ; |     XXX| $F72D
    .byte $04 ; |     X  | $F72E
    .byte $04 ; |     X  | $F72F
    .byte $07 ; |     XXX| $F730

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


LF731:
;Atari Video Computer System screen
    .byte $0A ; |    X X | $F731
    .byte $0B ; |    X XX| $F732
    .byte $0C ; |    XX  | $F733
    .byte $0D ; |    XX X| $F734
    .byte $0E ; |    XXX | $F735
    .byte $0A ; |    X X | $F736
    .byte $0A ; |    X X | $F737
    .byte $0F ; |    XXXX| $F738
    .byte $10 ; |   X    | $F739
    .byte $11 ; |   X   X| $F73A
    .byte $12 ; |   X  X | $F73B
    .byte $0A ; |    X X | $F73C
    .byte $13 ; |   X  XX| $F73D
    .byte $14 ; |   X X  | $F73E
    .byte $15 ; |   X X X| $F73F
    .byte $16 ; |   X XX | $F740
    .byte $17 ; |   X XXX| $F741
    .byte $18 ; |   XX   | $F742
    .byte $0A ; |    X X | $F743
    .byte $19 ; |   XX  X| $F744
    .byte $1A ; |   XX X | $F745
    .byte $1B ; |   XX XX| $F746
    .byte $1C ; |   XXX  | $F747
    .byte $1D ; |   XXX X| $F748
    
LF749:
;Enter Game Number screen
    .byte $0A ; |    X X | $F749   shared
    .byte $1E ; |   XXXX | $F74A
    .byte $1F ; |   XXXXX| $F74B
    .byte $20 ; |  X     | $F74C
    .byte $21 ; |  X    X| $F74D
    .byte $0A ; |    X X | $F74E
    .byte $0A ; |    X X | $F74F
    .byte $22 ; |  X   X | $F750
    .byte $23 ; |  X   XX| $F751
    .byte $24 ; |  X  X  | $F752
    .byte $25 ; |  X  X X| $F753
    .byte $0A ; |    X X | $F754
    .byte $0A ; |    X X | $F755
    .byte $26 ; |  X  XX | $F756
    .byte $27 ; |  X  XXX| $F757
    .byte $28 ; |  X X   | $F758
    .byte $29 ; |  X X  X| $F759
    .byte $2A ; |  X X X | $F75A
    .byte $0A ; |    X X | $F75B
    .byte $0A ; |    X X | $F75C
    .byte $0A ; |    X X | $F75D
    .byte $0A ; |    X X | $F75E
    .byte $0A ; |    X X | $F75F
    .byte $0A ; |    X X | $F760


RegisteredSymbol:
    .byte $00 ; |        | $F761
    .byte $7E ; | XXXXXX | $F762
    .byte $81 ; |X      X| $F763
    .byte $A5 ; |X X  X X| $F764
    .byte $A9 ; |X X X  X| $F765
    .byte $BD ; |X XXXX X| $F766
    .byte $A5 ; |X X  X X| $F767
    .byte $BD ; |X XXXX X| $F768
    .byte $81 ; |X      X| $F769
    .byte $7E ; | XXXXXX | $F76A

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;           XXX   XXXXXXXXXX   XXX      XXXXXXX      XX
;           XXX   XXXXXXXXXX   XXX      XXXXXXXXX    XX
;          XXXXX      XX      XXXXX     XX    XXXX   XX
;          XXXXX      XX      XXXXX     XX      XX   XX
;         XXX XXX     XX     XXX XXX    XX      XX   XX
;         XX   XX     XX     XX   XX    XX      XX   XX
;         XX   XX     XX     XX   XX    XX     XXX   XX
;        XXX   XXX    XX    XXX   XXX   XX   XXXX    XX
;        XX     XX    XX    XX     XX   XX XXXX      XX
;        XX     XX    XX    XX     XX   XX XXX       XX
;       XXXXXXXXXXX   XX   XXXXXXXXXXX  XX  XXX      XX
;       XXXXXXXXXXX   XX   XXXXXXXXXXX  XX   XXX     XX
;       XX       XX   XX   XX       XX  XX    XXX    XX
;      XXX       XXX  XX  XXX       XXX XX     XXX   XX
;      XX         XX  XX  XX         XX XX      XXX  XX
;      XX         XX  XX  XX         XX XX       XX  XX
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LogoOne:
    .byte $00 ; |        | $F76B
    .byte $C0 ; |XX      | $F76C
    .byte $C0 ; |XX      | $F76D
    .byte $E0 ; |XXX     | $F76E
    .byte $60 ; | XX     | $F76F
    .byte $7F ; | XXXXXXX| $F770
    .byte $7F ; | XXXXXXX| $F771
    .byte $30 ; |  XX    | $F772
    .byte $30 ; |  XX    | $F773
    .byte $38 ; |  XXX   | $F774
    .byte $18 ; |   XX   | $F775
    .byte $18 ; |   XX   | $F776
    .byte $1D ; |   XXX X| $F777
    .byte $0F ; |    XXXX| $F778
    .byte $0F ; |    XXXX| $F779
    .byte $07 ; |     XXX| $F77A
    .byte $07 ; |     XXX| $F77B
LogoTwo:
    .byte $00 ; |        | $F77C
    .byte $19 ; |   XX  X| $F77D
    .byte $19 ; |   XX  X| $F77E
    .byte $39 ; |  XXX  X| $F77F
    .byte $31 ; |  XX   X| $F780
    .byte $F1 ; |XXXX   X| $F781
    .byte $F1 ; |XXXX   X| $F782
    .byte $61 ; | XX    X| $F783
    .byte $61 ; | XX    X| $F784
    .byte $E1 ; |XXX    X| $F785
    .byte $C1 ; |XX     X| $F786
    .byte $C1 ; |XX     X| $F787
    .byte $C1 ; |XX     X| $F788
    .byte $81 ; |X      X| $F789
    .byte $81 ; |X      X| $F78A
    .byte $1F ; |   XXXXX| $F78B
    .byte $1F ; |   XXXXX| $F78C
LogoThree:
    .byte $00 ; |        | $F78D
    .byte $98 ; |X  XX   | $F78E
    .byte $98 ; |X  XX   | $F78F
    .byte $9C ; |X  XXX  | $F790
    .byte $8C ; |X   XX  | $F791
    .byte $8F ; |X   XXXX| $F792
    .byte $8F ; |X   XXXX| $F793
    .byte $86 ; |X    XX | $F794
    .byte $86 ; |X    XX | $F795
    .byte $87 ; |X    XXX| $F796
    .byte $83 ; |X     XX| $F797
    .byte $83 ; |X     XX| $F798
    .byte $83 ; |X     XX| $F799
    .byte $81 ; |X      X| $F79A
    .byte $81 ; |X      X| $F79B
    .byte $F8 ; |XXXXX   | $F79C
    .byte $F8 ; |XXXXX   | $F79D
LogoFour:
    .byte $00 ; |        | $F79E
    .byte $03 ; |      XX| $F79F
    .byte $03 ; |      XX| $F7A0
    .byte $07 ; |     XXX| $F7A1
    .byte $06 ; |     XX | $F7A2
    .byte $FE ; |XXXXXXX | $F7A3
    .byte $FE ; |XXXXXXX | $F7A4
    .byte $0C ; |    XX  | $F7A5
    .byte $0C ; |    XX  | $F7A6
    .byte $1C ; |   XXX  | $F7A7
    .byte $18 ; |   XX   | $F7A8
    .byte $18 ; |   XX   | $F7A9
    .byte $B8 ; |X XXX   | $F7AA
    .byte $F0 ; |XXXX    | $F7AB
    .byte $F0 ; |XXXX    | $F7AC
    .byte $E0 ; |XXX     | $F7AD
    .byte $E0 ; |XXX     | $F7AE
LogoFive:
    .byte $00 ; |        | $F7AF
    .byte $60 ; | XX     | $F7B0
    .byte $60 ; | XX     | $F7B1
    .byte $60 ; | XX     | $F7B2
    .byte $61 ; | XX    X| $F7B3
    .byte $63 ; | XX   XX| $F7B4
    .byte $67 ; | XX  XXX| $F7B5
    .byte $6E ; | XX XXX | $F7B6
    .byte $6F ; | XX XXXX| $F7B7
    .byte $63 ; | XX   XX| $F7B8
    .byte $60 ; | XX     | $F7B9
    .byte $60 ; | XX     | $F7BA
    .byte $60 ; | XX     | $F7BB
    .byte $60 ; | XX     | $F7BC
    .byte $61 ; | XX    X| $F7BD
    .byte $7F ; | XXXXXXX| $F7BE
    .byte $7F ; | XXXXXXX| $F7BF
LogoSix:
    .byte $00 ; |        | $F7C0
    .byte $33 ; |  XX  XX| $F7C1
    .byte $73 ; | XXX  XX| $F7C2
    .byte $E3 ; |XXX   XX| $F7C3
    .byte $C3 ; |XX    XX| $F7C4
    .byte $83 ; |X     XX| $F7C5
    .byte $03 ; |      XX| $F7C6
    .byte $03 ; |      XX| $F7C7
    .byte $03 ; |      XX| $F7C8
    .byte $C3 ; |XX    XX| $F7C9
    .byte $E3 ; |XXX   XX| $F7CA
    .byte $63 ; | XX   XX| $F7CB
    .byte $63 ; | XX   XX| $F7CC
    .byte $63 ; | XX   XX| $F7CD
    .byte $E3 ; |XXX   XX| $F7CE
    .byte $C3 ; |XX    XX| $F7CF
    .byte $03 ; |      XX| $F7D0


  REPEAT ($F7FA - *) ; free bytes
    .byte 0
  REPEND

       ORG $F7FA

    .word START,START,START
