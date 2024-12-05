; Disassembly of play.bin
; Disassembled By Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasfcplay.cfg play.bin
;
; play.cfg contents:
;
;      ORG F000
;      CODE F000 F178
;      GFX F179 F4FF
;      CODE F500 F63B
;      GFX F63C F64D
;      CODE F64E F6E4
;      GFX F6E5 F6FF
;      CODE F700 F7F8
;      GFX F7F9 F7FF
;      CODE F800 F8B3
;      GFX F8B4 F8E3
;      CODE F8E4 F8F1
;      GFX F8F2 FFFF

      processor 6502

VSYNC   =  $00
VBLANK  =  $01
WSYNC   =  $02
NUSIZ0  =  $04
NUSIZ1  =  $05
COLUP0  =  $06
COLUP1  =  $07
CTRLPF  =  $0A
RESP0   =  $10
RESP1   =  $11
AUDC0   =  $15
AUDF0   =  $17
AUDV0   =  $19
GRP0    =  $1B
GRP1    =  $1C
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B

;read TIA base line = $00
CXM0P   =  $00

SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      CONSTANTS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

TIME_VBLANK    =  $23

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ram80_mirror  =  $0180
ram81_mirror  =  $0181

tempOne        =  $80
loopCount      =  tempOne
tempTwo        =  $81
holdStackPtr   =  $82


frameCounter   =  $84

indirectJump   =  $87  ; $87-$88  jumps into different drawing loops for the kernel

mystique_logo  =  $90  ; $90-$9B

checksumValue  =  $B9
romAddress     =  $BA  ; $BA-$BB

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


       ORG $F000

START:
    sei
    cld
    ldx    #0
    ldy    #0
.loopInitialization:
    sty    0,X                      ; clear TIA registers
    lda    ZeroPageRamTab,X
    sta    $80,X                    ; load pointers, clear unused ram, etc...
    inx
    bpl    .loopInitialization

LF010:
 ;   jsr    RomChecksum
    NOP
    NOP
    NOP




    lda    #1                       ; reflect
    sta    CTRLPF
LF017:
    lda    #0                       ; you could use any value here, as HMCLR just needs a strobe
    sta    HMCLR                    ; clear the fine position registers
    lda    #2
    sta    WSYNC
;---------------------------------------
    sta    VBLANK                   ; enable Vblank
    inc    frameCounter
    bne    LF029                 ; 2³
    inc    $D0                   ; 5
    dec    $CF                   ; 5

LF029:
    sta    WSYNC                    ; a few buffer scanlines
    sta    WSYNC
    sta    WSYNC
;---------------------------------------
    sta    VSYNC                    ; Vsync starts
    sta    WSYNC
    sta    WSYNC
;---------------------------------------
    ldx    #$FF
    txs                             ; reset the stack pointer
    inx                             ; X=0
    sta    WSYNC                    ; three scanlines for Vsync
;---------------------------------------
    stx    VSYNC                    ; Vsync ends, and electron beam is turned on!
    stx    VBLANK                   ; The electron beam should stay off until the kernel starts...
    lda    #TIME_VBLANK
    sta    TIM64T
    lda    #5                    ; 2
    sta    $8A                   ; 3
    lda    $8B                   ; 3
    ora    $8C                   ; 3
    bne    LF061                 ; 2³
    ldx    #$FF                  ; 2
    stx    $8C                   ; 3
    ldx    $8E                   ; 3
    inx                          ; 2
    cpx    #8                    ; 2
    bne    LF05B                 ; 2³
    ldx    #0                    ; 2
LF05B:
    stx    $8E                   ; 3
    lda    #$0F                  ; 2
    sta    $8D                   ; 3
LF061:
    lda    #1                       ; test reset switch
    and    SWCHB
    bne    .noReset
    jsr    RomChecksum
    jmp    START

.noReset:
    lda    $C0                   ; 3
    bpl    LF076                 ; 2³
    lda    #0
    beq    LF09E                    ; always branch

LF076:
    lda    frameCounter
    and    #$0F                     ; every 16 frames
    bne    LF09E
    jsr    LF6DA                 ; 6
    cmp    #$70                  ; 2
    bcc    LF090                 ; 2³
    jsr    LF6DA                 ; 6
    and    #$07                  ; 2
    tax                          ; 2
    jsr    LF6DA                 ; 6
    and    #$83                  ; 2
    sta    $E4,X                 ; 4
LF090:
    ldx    $8D                   ; 3
    bne    LF09C                 ; 2³
    ldx    #0                    ; 2
    stx    $8C                   ; 3
    inc    $8B                   ; 5
    bne    LF09E                 ; 2³
LF09C:
    dec    $8D                   ; 5
LF09E:
    and    #$07                  ; 2
    sta    $81                   ; 3
    ldx    #7                    ; 2
LF0A4:
    lda    $E4,X                 ; 4
    and    #$0F                     ; every 16 frames
    and    frameCounter
    bne    LF0DC                 ; 2³
    lda    $E4,X                 ; 4
    bpl    LF0B6                 ; 2³
    dec    $EC,X                 ; 6
    beq    LF0CF                 ; 2³
    bpl    LF0BE                 ; 2³
LF0B6:
    inc    $EC,X                 ; 6
    lda    $EC,X                 ; 4
    cmp    #$6A                  ; 2
    beq    LF0CF                 ; 2³
LF0BE:
    lda    #4                    ; 2
    and    $DC,X                 ; 4
    beq    LF0D5                 ; 2³
    cpx    $81                   ; 3
    bne    LF0D5                 ; 2³
    jsr    LF6DA                 ; 6
    and    #$38                  ; 2
    bne    LF0D5                 ; 2³
LF0CF:
    lda    #$80                  ; 2
    eor    $E4,X                 ; 4
    sta    $E4,X                 ; 4
LF0D5:
    lda    $EC,X                 ; 4
    jsr    LF7D4                 ; 6
    sta    $F4,X                 ; 4
LF0DC:
    dex                          ; 2
    bpl    LF0A4                 ; 2³
    nop                             ; these NOP's seem unnecessary, as TIM64T was loaded with $23
    nop
    nop

.waitVblank:
    lda    INTIM
    bpl    .waitVblank

    lda    #$FF                  ; 2
    sta    TIM64T                ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    $8E                   ; 3
    stx    $83                   ; 3
    ldy    $8D                   ; 3
LF0F4:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bpl    LF0F4                 ; 2³
LF0F9:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    $83                   ; 3
    cpx    #8                    ; 2
    bne    LF105                 ; 2³
    ldx    #0                    ; 2
    stx    $83                   ; 3
LF105:
    ldy    $DC,X                 ; 4
    lda    $F4,X                 ; 4
    sta    $81                   ; 3
    lda    LFF70,Y               ; 4
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    LFFF0,Y               ; 4   loop count table?
    cpx    $8E                   ; 3
    bne    LF122                 ; 2³
    sec                          ; 2
    sbc    $8B                   ; 3
    bpl    LF122                 ; 2³
    ldx    #0                    ; 2
    stx    $8B                   ; 3
LF122:
    sta    $80                   ; 3   loop count?
    sta    WSYNC                 ; 3
;---------------------------------------
    nop                             ; pointless, no effect
    nop
    nop
    nop
    sta    WSYNC
    sta    WSYNC
;---------------------------------------
    jsr    LF500                 ; 6
    sta    WSYNC
    sta    WSYNC
;---------------------------------------
    nop                             ; pointless, no effect
    nop
    nop
    nop
    sta    WSYNC
;---------------------------------------
    inc    $83                   ; 5
    dec    $8A                   ; 5
    bne    LF0F9                 ; 2³+1
    jmp    LF8E4                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Yep, this routine performs a checksum to stop porn hackers.
;What is curious is the change of origins in the addressing.
;This routine seems to have originally come from Bachelor Party.

RomChecksum SUBROUTINE
    lda    #$30                     ; high nibble, begining of rom
    sta    romAddress+1
    lda    #0
    sta    checksumValue            ; clear checksum (for when reset switch is used)
    sta    romAddress               ; clear byte counter (for when reset switch is used)
.loopPageChecksum:
    ldy    #0                       ; start at begining of each page
    lda    (romAddress),Y           ; load byte from $3000, then $3001, all the way to $3FFF
    clc
    adc    checksumValue            ; create the checksum
    sta    checksumValue
    inc    romAddress               ; rom address +1, when it rolls over increment high nibble to next page
    bne    .loopPageChecksum

    sec                             ; could probably just use INC $BB here, but whatever floats your boat
    lda    #0
    adc    romAddress+1
    sta    romAddress+1
    cmp    #$40                     ; have we done the entire 4K?
    bne    .loopPageChecksum        ; - no, do next page
    lda    LF010                    ; - yes checksum is done
    cmp    checksumValue            ; does the checksum equal #$20?
    bne    LF16E                    ; - no, crash the game
    rts                             ; - yes, checksum is good, so commence program

LF16E:
    lda    #$F1                     ; this value looks like it was intended for something else
    sta    AUDC0                    ; tone = $01
    sta    AUDF0                    ; frequency = $11
    sta    AUDV0                    ; volume = $01
    jmp    ($3FFE)                  ; do a soft reset

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;775 free bytes

  REPEAT ($F480 - *)
    .byte 0
  REPEND

       ORG $F480

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ZeroPageRamTab:
;$80-$8F
    .byte $00                ; $80
    .byte $00                ; $81
    .byte $00                ; $82   clear stack pointer holder
    .byte $00                ; $83
    .byte $00                ; $84
    .byte $00                ; $85
    .byte $00                ; $86
    .byte $00                ; $87   clear low indirectJump
    .byte $00                ; $88   clear high indirectJump
    .byte $00                ; $89
    .byte $00                ; $8A
    .byte $00                ; $8B
    .byte $00                ; $8C
    .byte $00                ; $8D
    .byte $00                ; $8E
    .byte $00                ; $8F

    .word MystiqueLogoOne    ; $90-$91
    .word MystiqueLogoTwo    ; $92-$93
    .word MystiqueLogoThree  ; $94-$95
    .word MystiqueLogoFour   ; $96-$97
    .word MystiqueLogoFive   ; $98-$99
    .word MystiqueLogoSix    ; $9A-$9B
    .word LFF00              ; $9C-$9D

    .byte $8F ; |X   XXXX| $9E
    .byte $E0 ; |XXX     | $9F
    .byte $03 ; |      XX| $A0

;$A1-$A7
    .byte 0,0,0,0,0,0,0      ; clear

    .word MystiqueLogoOne    ; $A8-$A9
    .word MystiqueLogoTwo    ; $AA-$AB
    .word MystiqueLogoThree  ; $AC-$AD
    .word MystiqueLogoFour   ; $AE-$AF
    .word MystiqueLogoFive   ; $B0-$B1
    .word MystiqueLogoSix    ; $B2-$B3
    .word LFF00              ; $B4-$B5

    .byte $4F ; | X  XXXX| $B6
    .byte $E0 ; |XXX     | $B7
    .byte $29 ; |  X X  X| $B8

;$B9-$BF
    .byte $00                ; $B9   clear checksum
    .byte $00                ; $BA   clear low pointer to rom address
    .byte $00                ; $BB   clear high pointer to rom address
    .byte $00                ; $BC
    .byte $00                ; $BD
    .byte $00                ; $BE
    .byte $00                ; $BF   clear

    .byte $04 ; |     X  | $C0
    .byte $07 ; |     XXX| $C1
    .byte $44 ; | X   X  | $C2
    .byte $F7 ; |XXXX XXX| $C3
    .byte $68 ; | XX X   | $C4

;$C5-$DC
    .byte 0,0,0,0,0,0,0,0,0,0,0,0   ; clear
    .byte 0,0,0,0,0,0,0,0,0,0,0,0   ; clear

    .byte $04 ; |     X  | $DD
    .byte $01 ; |       X| $DE
    .byte $05 ; |     X X| $DF
    .byte $02 ; |      X | $E0
    .byte $06 ; |     XX | $E1
    .byte $03 ; |      XX| $E2
    .byte $07 ; |     XXX| $E3
    .byte $01 ; |       X| $E4
    .byte $01 ; |       X| $E5
    .byte $01 ; |       X| $E6
    .byte $01 ; |       X| $E7
    .byte $01 ; |       X| $E8
    .byte $01 ; |       X| $E9
    .byte $01 ; |       X| $EA
    .byte $01 ; |       X| $EB

;$EC-$FF
    .byte 0,0,0,0,0,0,0,0,0,0   ; clear
    .byte 0,0,0,0,0,0,0,0,0,0   ; clear

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;subroutine goes to LF86A for ending

LF500 SUBROUTINE
    tsx
    stx    holdStackPtr             ; preserve stack pointer
    ldx    #ENABL
    txs                             ; PHP will enable/disable ball
    clc
    adc    #2                       ; skip over the high byte to get to next address
    lda    IndirectLoPtrTab,Y       ; load indirect jump pointer
    sta    indirectJump
    lda    IndirectHiPtrTab,Y
    sta    indirectJump+1
    lda    $81                   ; 3
    ldy    #3                       ; 3 copies close
    sty    NUSIZ0
    sty    NUSIZ1
    ldy    #1                       ; delay
    sty    VDELP0
    sty    VDELP1
    sta    WSYNC
;---------------------------------------
    dec    $CB                   ; 5
    php                          ; 3
    ldx    #ENABL                ; 2
    txs                          ; 2
    clc                          ; 2
    adc    #$32                  ; 2
    bvc    LF55E                 ; 2³
    adc    #$40                  ; 2
    sta    HMP0                  ; 3
    adc    #$10                  ; 2
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    dec    $CB                   ;5  @5
    php                          ;3  @8
    ldx    #ENABL                ;2  @10
    txs                          ;2  @12
    ldx    #6                    ;2  @14
.delay34Cycles_A:
    dex                          ;2
    bpl    .delay34Cycles_A      ;2³
    nop                          ;2  @50
    nop                          ;2  @52
    dec    $CB                   ;5  @57
    php                          ;3  @60
    ldx    #ENABL                ;2  @62
    txs                          ;2  @64
LF54E:
    dey                          ; 2
    bpl    LF54E                 ; 2³
    nop                          ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ;3  @3
    nop                          ;2  @5
    jmp    LF64E                 ;3  @8

LF55E:
    clc                          ; 2
    adc    #$30                  ; 2
    bvc    LF595                 ; 2³
    adc    #$40                  ; 2
    sta    HMP0                  ; 3
    adc    #$10                  ; 2
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    dec    $CB                   ;5  @5
    php                          ;3  @8
    ldx    #ENABL                ;2  @10
    txs                          ;2  @12
    ldx    #6                    ;2  @14
.delay34Cycles_B:
    dex                          ;2
    bpl    .delay34Cycles_B      ;2³
    nop                          ;2  @50
    nop                          ;2  @52
    dec    $CB                   ;5  @57
    php                          ;3  @60
    ldx    #ENABL                ;2  @62
    txs                          ;2  @64
LF583:
    dey                          ; 2
    bpl    LF583                 ; 2³
    cmp    CXM0P                 ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ;3  @3
    cmp    CXM0P                 ;3  @6
    jmp    LF64E                 ;3  @9

LF595:
    clc                          ; 2
    adc    #$30                  ; 2
    bvc    LF5CC                 ; 2³
    adc    #$40                  ; 2
    sta    HMP0                  ; 3
    adc    #$10                  ; 2
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    dec    $CB                   ;5  @5
    php                          ;3  @8
    ldx    #ENABL                ;2  @10
    txs                          ;2  @12
    ldx    #6                    ;2  @14
.delay34Cycles_C:
    dex                          ;2
    bpl    .delay34Cycles_C      ;2³
    nop                          ;2  @50
    nop                          ;2  @52
    dec    $CB                   ;5  @57
    php                          ;3  @60
    ldx    #ENABL                ;2  @62
    txs                          ;2  @64
LF5BA:
    dey                          ; 2
    bpl    LF5BA                 ; 2³
    nop                          ; 2
    nop                          ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ;3  @3
    nop                          ;2  @5
    nop                          ;2  @7
    jmp    LF64E                 ;3  @10

LF5CC:
    clc                          ; 2
    adc    #$30                  ; 2
    bvc    LF605                 ; 2³+1
    adc    #$40                  ; 2
    sta    HMP0                  ; 3
    adc    #$10                  ; 2
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    dec    $CB                   ;5  @5
    php                          ;3  @8
    ldx    #ENABL                ;2  @10
    txs                          ;2  @12
    ldx    #6                    ;2  @14
.delay34Cycles_D:
    dex                          ;2
    bpl    .delay34Cycles_D      ;2³
    nop                          ;2  @50
    nop                          ;2  @52
    dec    $CB                   ;5  @57
    php                          ;3  @60
    ldx    #ENABL                ;2  @62
    txs                          ;2  @64
LF5F1:
    dey                          ; 2
    bpl    LF5F1                 ; 2³
    nop                          ; 2
    cmp    CXM0P                 ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ;3  @3
    nop                          ;2  @5
    cmp    CXM0P                 ;3  @8
    jmp    LF64E                 ;3  @11

LF605:
    clc                          ; 2
    adc    #$30                  ; 2
    adc    #$40                  ; 2
    sta    HMP0                  ; 3
    adc    #$10                  ; 2
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    dec    $CB                   ;5  @5
    php                          ;3  @8
    ldx    #ENABL                ;2  @10
    txs                          ;2  @12
    ldx    #6                    ;2  @14
.delay34Cycles_E:
    dex                          ;2
    bpl    .delay34Cycles_E      ;2³
    nop                          ;2  @50
    nop                          ;2  @52
    dec    $CB                   ;5  @57
    php                          ;3  @60
    ldx    #ENABL                ;2  @62
    txs                          ;2  @64
LF628:
    dey                          ; 2
    bpl    LF628                 ; 2³
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ;3  @3
    nop                          ;2  @5
    nop                          ;2  @7
    nop                          ;2  @9
    jmp    LF64E                 ;3  @12

IndirectLoPtrTab:
    .byte <SixtyNineLoop         ; $F63C
    .byte <HuggingKissingLoop    ; $F63D
    .byte <DoggyStyleLoop        ; $F63E
    .byte <GirlOnTopLoop         ; $F63F
    .byte <PlayLogoA_Loop        ; $F640
    .byte <PlayLogoB_Loop        ; $F641
    .byte <PlayLogoC_Loop        ; $F642
    .byte <PlayLogoD_Loop        ; $F643
    .byte <DrawMystique          ; $F644
IndirectHiPtrTab:
    .byte >SixtyNineLoop         ; $F645
    .byte >HuggingKissingLoop    ; $F646
    .byte >DoggyStyleLoop        ; $F647
    .byte >GirlOnTopLoop         ; $F648
    .byte >PlayLogoA_Loop        ; $F649
    .byte >PlayLogoB_Loop        ; $F64A
    .byte >PlayLogoC_Loop        ; $F64B
    .byte >PlayLogoD_Loop        ; $F64C
    .byte >DrawMystique          ; $F64D

LF64E:
    dec    $CB                   ;5  @13..17
    php                          ;3  @16..20
    ldx    #ENABL                ;2  @18..22
    txs                          ;2  @20..24
    ldx    #6                    ;2  @22..26
.delay34Cycles_F:
    dex                          ;2
    bpl    .delay34Cycles_F      ;2³
    nop                          ; 2
    nop                          ; 2
    dec    $CB                   ; 5
    php                          ; 3
    ldx    #ENABL                ; 2
    txs                          ; 2
    clc                          ; 2
    adc    #3                    ; 2
    tax                          ; 2
    nop                          ; 2
    nop                          ; 2
LF667:
    dex                          ; 2
    bpl    LF667                 ; 2³
    ldy    ram80_mirror          ; 4
    jmp.ind (indirectJump)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;indirect jump

SixtyNineLoop:
    sty    loopCount             ;3  @3
    lda    SixtyNine6,Y          ;4  @7
    sta    $81                   ;3  @10
    ldx    SixtyNine5,Y          ;4  @14
    lda    SixtyNine1,Y          ;4  @18
    sta    GRP0                  ;3  @21
    lda    SixtyNine2,Y          ;4  @25
    sta    GRP1                  ;3  @28
    lda    SixtyNine3,Y          ;4  @32
    sta    GRP0                  ;3  @35
    lda    SixtyNine4,Y          ;4  @39
    ldy    $81                   ;3  @42
    sta    GRP1                  ;3  @45
    stx    GRP0                  ;3  @48
    sty    GRP1                  ;3  @51
    sta    GRP0                  ;3  @54
    ldx    #ENABL                ;2  @56
    txs                          ;2  @58
    dec    $CB                   ;5  @63
    php                          ;3  @66
    nop                          ;2  @68
    ldy    loopCount             ;3  @71
    dey                          ;2  @73
    bpl    SixtyNineLoop         ;2³ @75/76
;---------------------------------------
    jmp    LF86A                 ;3  @2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;indirect jump

HuggingKissingLoop:
    sty    loopCount             ;3  @3
    lda    HuggingKissing6,Y     ;4  @7
    sta    $81                   ;3  @10
    ldx    HuggingKissing5,Y     ;4  @14
    lda    HuggingKissing1,Y     ;4  @18
    sta    GRP0                  ;3  @21
    lda    HuggingKissing2,Y     ;4  @25
    sta    GRP1                  ;3  @28
    lda    HuggingKissing3,Y     ;4  @32
    sta    GRP0                  ;3  @35
    lda    HuggingKissing4,Y     ;4  @39
    ldy    $81                   ;3  @42
    sta    GRP1                  ;3  @45
    stx    GRP0                  ;3  @48
    sty    GRP1                  ;3  @51
    sta    GRP0                  ;3  @54
    ldx    #ENABL                ;2  @56
    txs                          ;2  @58
    dec    $CB                   ;5  @63
    php                          ;3  @66
    nop                          ;2  @68
    ldy    loopCount             ;3  @71
    dey                          ;2  @73
    bpl    HuggingKissingLoop    ;2³ @75/76
;---------------------------------------
    jmp    LF86A                 ;3  @2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF6DA SUBROUTINE
    lda    frameCounter
    eor    $D0                   ; 3
    adc    $D1                   ; 3
    adc    #$0D                  ; 2
    sta    $D1                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;free bytes
    .byte $00 ; |        | $F6E5
    .byte $00 ; |        | $F6E6
    .byte $00 ; |        | $F6E7
    .byte $00 ; |        | $F6E8
    .byte $00 ; |        | $F6E9
    .byte $00 ; |        | $F6EA
    .byte $00 ; |        | $F6EB
    .byte $00 ; |        | $F6EC
    .byte $00 ; |        | $F6ED
    .byte $00 ; |        | $F6EE
    .byte $00 ; |        | $F6EF
    .byte $00 ; |        | $F6F0
    .byte $00 ; |        | $F6F1
    .byte $00 ; |        | $F6F2
    .byte $00 ; |        | $F6F3
    .byte $00 ; |        | $F6F4
    .byte $00 ; |        | $F6F5
    .byte $00 ; |        | $F6F6
    .byte $00 ; |        | $F6F7
    .byte $00 ; |        | $F6F8
    .byte $00 ; |        | $F6F9
    .byte $00 ; |        | $F6FA
    .byte $00 ; |        | $F6FB
    .byte $00 ; |        | $F6FC
    .byte $00 ; |        | $F6FD
    .byte $00 ; |        | $F6FE
    .byte $00 ; |        | $F6FF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;indirect jump

DoggyStyleLoop:
    sty    loopCount             ;3  @3
    lda    DoggyStyle6,Y         ;4  @7
    sta    $81                   ;3  @10
    ldx    DoggyStyle5,Y         ;4  @14
    lda    DoggyStyle1,Y         ;4  @18
    sta    GRP0                  ;3  @21
    lda    DoggyStyle2,Y         ;4  @25
    sta    GRP1                  ;3  @28
    lda    DoggyStyle3,Y         ;4  @32
    sta    GRP0                  ;3  @35
    lda    DoggyStyle4,Y         ;4  @39
    ldy    $81                   ;3  @42
    sta    GRP1                  ;3  @45
    stx    GRP0                  ;3  @48
    sty    GRP1                  ;3  @51
    sta    GRP0                  ;3  @54
    ldx    #ENABL                ;2  @56
    txs                          ;2  @58
    dec    $CB                   ;5  @63
    php                          ;3  @66
    nop                          ;2  @68
    ldy    loopCount             ;3  @71
    dey                          ;2  @73
    bpl    DoggyStyleLoop        ;2³ @75/76
;---------------------------------------
    jmp    LF86A                 ;3  @2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;indirect jump

GirlOnTopLoop:
    sty    loopCount             ;3  @3
    lda    GirlOnTop6,Y          ;4  @7
    sta    $81                   ;3  @10
    ldx    GirlOnTop5,Y          ;4  @14
    lda    GirlOnTop1,Y          ;4  @18
    sta    GRP0                  ;3  @21
    lda    GirlOnTop2,Y          ;4  @25
    sta    GRP1                  ;3  @28
    lda    GirlOnTop3,Y          ;4  @32
    sta    GRP0                  ;3  @35
    lda    GirlOnTop4,Y          ;4  @39
    ldy    $81                   ;3  @42
    sta    GRP1                  ;3  @45
    stx    GRP0                  ;3  @48
    sty    GRP1                  ;3  @51
    sta    GRP0                  ;3  @54
    ldx    #ENABL                ;2  @56
    txs                          ;2  @58
    dec    $CB                   ;5  @63
    php                          ;3  @66
    nop                          ;2  @68
    ldy    loopCount             ;3  @71
    dey                          ;2  @73
    bpl    GirlOnTopLoop         ;2³ @75/76
;---------------------------------------
    jmp    LF86A                 ;3  @2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;indirect jump

PlayLogoA_Loop:
    sty    loopCount             ;3  @3
    lda    PlayLogoA_6,Y         ;4  @7
    sta    $81                   ;3  @10
    ldx    PlayLogoA_5,Y         ;4  @14
    lda    PlayLogoA_1,Y         ;4  @18
    sta    GRP0                  ;3  @21
    lda    PlayLogoA_2,Y         ;4  @25
    sta    GRP1                  ;3  @28
    lda    PlayLogoA_3,Y         ;4  @32
    sta    GRP0                  ;3  @35
    lda    PlayLogoA_4,Y         ;4  @39
    ldy    $81                   ;3  @42
    sta    GRP1                  ;3  @45
    stx    GRP0                  ;3  @48
    sty    GRP1                  ;3  @51
    sta    GRP0                  ;3  @54
    ldx    #ENABL                ;2  @56
    txs                          ;2  @58
    dec    $CB                   ;5  @63
    php                          ;3  @66
    nop                          ;2  @68
    ldy    loopCount             ;3  @71
    dey                          ;2  @73
    bpl    PlayLogoA_Loop        ;2³ @75/76
;---------------------------------------
    jmp    LF86A                 ;3  @2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;indirect jump

PlayLogoB_Loop:
    sty    loopCount             ;3  @3
    lda    PlayLogoB_6,Y         ;4  @7
    sta    $81                   ;3  @10
    ldx    PlayLogoB_5,Y         ;4  @14
    lda    PlayLogoB_1,Y         ;4  @18
    sta    GRP0                  ;3  @21
    lda    PlayLogoB_2,Y         ;4  @25
    sta    GRP1                  ;3  @28
    lda    PlayLogoB_3,Y         ;4  @32
    sta    GRP0                  ;3  @35
    lda    PlayLogoB_4,Y         ;4  @39
    ldy    $81                   ;3  @42
    sta    GRP1                  ;3  @45
    stx    GRP0                  ;3  @48
    sty    GRP1                  ;3  @51
    sta    GRP0                  ;3  @54
    ldx    #ENABL                ;2  @56
    txs                          ;2  @58
    dec    $CB                   ;5  @63
    php                          ;3  @66
    nop                          ;2  @68
    ldy    loopCount             ;3  @71
    dey                          ;2  @73
    bpl    PlayLogoB_Loop        ;2³ @75/76
;---------------------------------------
    jmp    LF86A                 ;3  @2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF7D4 SUBROUTINE
    ldy    #$FF                  ; 2
    clc                          ; 2
    adc    #$2D                  ; 2
    sec                          ; 2
LF7DA:
    iny                          ; 2
    sbc    #$0F                  ; 2
    bcs    LF7DA                 ; 2³
    sty    tempOne               ; 3   loop count?
    eor    #$FF                  ; 2
    adc    #9                    ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    tempOne               ; 3   loop count?
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;looks like unused code...

    sta    HMP0,X                ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
LF7F3:
    dey                          ; 2
    bpl    LF7F3                 ; 2³
    sta    RESP0,X               ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;free bytes until $F8 page

    .byte $00 ; |        | $F7F9
    .byte $00 ; |        | $F7FA
    .byte $00 ; |        | $F7FB
    .byte $00 ; |        | $F7FC
    .byte $00 ; |        | $F7FD
    .byte $00 ; |        | $F7FE
    .byte $00 ; |        | $F7FF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;indirect jump

PlayLogoC_Loop:
    sty    loopCount             ;3  @3
    lda    PlayLogoC_6,Y         ;4  @7
    sta    $81                   ;3  @10
    ldx    PlayLogoC_5,Y         ;4  @14
    lda    PlayLogoC_1,Y         ;4  @18
    sta    GRP0                  ;3  @21
    lda    PlayLogoC_2,Y         ;4  @25
    sta    GRP1                  ;3  @28
    lda    PlayLogoC_3,Y         ;4  @32
    sta    GRP0                  ;3  @35
    lda    PlayLogoC_4,Y         ;4  @39
    ldy    $81                   ;3  @42
    sta    GRP1                  ;3  @45
    stx    GRP0                  ;3  @48
    sty    GRP1                  ;3  @51
    sta    GRP0                  ;3  @54
    ldx    #ENABL                ;2  @56
    txs                          ;2  @58
    dec    $CB                   ;5  @63
    php                          ;3  @66
    nop                          ;2  @68
    ldy    loopCount             ;3  @71
    dey                          ;2  @73
    bpl    PlayLogoC_Loop        ;2³ @75/76
;---------------------------------------
    jmp    LF86A                 ;3  @2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;indirect jump

PlayLogoD_Loop:
    sty    loopCount             ;3  @3
    lda    PlayLogoD_6,Y         ;4  @7
    sta    $81                   ;3  @10
    ldx    PlayLogoD_5,Y         ;4  @14
    lda    PlayLogoD_1,Y         ;4  @18
    sta    GRP0                  ;3  @21
    lda    PlayLogoD_2,Y         ;4  @25
    sta    GRP1                  ;3  @28
    lda    PlayLogoD_3,Y         ;4  @32
    sta    GRP0                  ;3  @35
    lda    PlayLogoD_4,Y         ;4  @39
    ldy    $81                   ;3  @42
    sta    GRP1                  ;3  @45
    stx    GRP0                  ;3  @48
    sty    GRP1                  ;3  @51
    sta    GRP0                  ;3  @54
    ldx    #ENABL                ;2  @56
    txs                          ;2  @58
    dec    $CB                   ;5  @63
    php                          ;3  @66
    nop                          ;2  @68
    ldy    loopCount             ;3  @71
    dey                          ;2  @73
    bpl    PlayLogoD_Loop        ;2³ @75/76
;---------------------------------------
    jmp    LF86A                 ;3  @2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;end of LF500 SUBROUTINE

LF86A:
    lda    #0                    ;2  @4
    sta    GRP0                  ;3  @7
    sta    GRP1                  ;3  @10
    sta    GRP0                  ;3  @13
    sta    GRP1                  ;3  @16
    sta    VDELP0                ;3  @19
    sta    VDELP1                ;3  @22
    ldx    holdStackPtr          ;3  @25
    txs                          ;2  @27
    sta    WSYNC                 ;3  @30
;---------------------------------------
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;indirect jump

DrawMystique:
    lda    #$1F                  ; 2
    sta    ram80_mirror          ; 4
    ldy    #$0B                  ; 2
LF885:
    dey                          ; 2
    bpl    LF885                 ; 2³
LF888:
    ldy    loopCount             ; 3
    lda    (mystique_logo+10),Y  ; 5
    sta    ram81_mirror          ; 4
    lda    (mystique_logo+8),Y   ; 5
    tax                          ; 2
    lda    (mystique_logo),Y     ; 5
    sta    GRP0                  ; 3
    lda    (mystique_logo+2),Y   ; 5
    sta    GRP1                  ; 3
    lda    (mystique_logo+4),Y   ; 5
    sta    GRP0                  ; 3
    lda    (mystique_logo+6),Y   ; 5
    ldy    $81                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    cmp    CXM0P                 ; 3
    nop                          ; 2
    dec    loopCount             ; 5
    bpl    LF888                 ; 2³
    jmp    LF86A                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;free bytes
    .byte $00 ; |        | $F8B4
    .byte $00 ; |        | $F8B5
    .byte $00 ; |        | $F8B6
    .byte $00 ; |        | $F8B7
    .byte $00 ; |        | $F8B8
    .byte $00 ; |        | $F8B9
    .byte $00 ; |        | $F8BA
    .byte $00 ; |        | $F8BB
    .byte $00 ; |        | $F8BC
    .byte $00 ; |        | $F8BD
    .byte $00 ; |        | $F8BE
    .byte $00 ; |        | $F8BF
    .byte $00 ; |        | $F8C0
    .byte $00 ; |        | $F8C1
    .byte $00 ; |        | $F8C2
    .byte $00 ; |        | $F8C3
    .byte $00 ; |        | $F8C4
    .byte $00 ; |        | $F8C5
    .byte $00 ; |        | $F8C6
    .byte $00 ; |        | $F8C7
    .byte $00 ; |        | $F8C8
    .byte $00 ; |        | $F8C9
    .byte $00 ; |        | $F8CA
    .byte $00 ; |        | $F8CB
    .byte $00 ; |        | $F8CC
    .byte $00 ; |        | $F8CD
    .byte $00 ; |        | $F8CE
    .byte $00 ; |        | $F8CF
    .byte $00 ; |        | $F8D0
    .byte $00 ; |        | $F8D1
    .byte $00 ; |        | $F8D2
    .byte $00 ; |        | $F8D3
    .byte $00 ; |        | $F8D4
    .byte $00 ; |        | $F8D5
    .byte $00 ; |        | $F8D6
    .byte $00 ; |        | $F8D7
    .byte $00 ; |        | $F8D8
    .byte $00 ; |        | $F8D9
    .byte $00 ; |        | $F8DA
    .byte $00 ; |        | $F8DB
    .byte $00 ; |        | $F8DC
    .byte $00 ; |        | $F8DD
    .byte $00 ; |        | $F8DE
    .byte $00 ; |        | $F8DF
    .byte $00 ; |        | $F8E0
    .byte $00 ; |        | $F8E1
    .byte $00 ; |        | $F8E2
    .byte $00 ; |        | $F8E3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF8E4:
    lda    #0                    ; 2
    sta    ENABL                 ; 3
LF8E8:
    lda    INTIM                 ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    bne    LF8E8                 ; 2³
    jmp    LF017                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;free bytes
    .byte $00 ; |        | $F8F2
    .byte $00 ; |        | $F8F3
    .byte $00 ; |        | $F8F4
    .byte $00 ; |        | $F8F5
    .byte $00 ; |        | $F8F6
    .byte $00 ; |        | $F8F7
    .byte $00 ; |        | $F8F8
    .byte $00 ; |        | $F8F9
    .byte $00 ; |        | $F8FA
    .byte $00 ; |        | $F8FB
    .byte $00 ; |        | $F8FC
    .byte $00 ; |        | $F8FD
    .byte $00 ; |        | $F8FE
    .byte $00 ; |        | $F8FF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SixtyNine1:
    .byte $F8 ; |XXXXX   | $F900
    .byte $F8 ; |XXXXX   | $F901
    .byte $78 ; | XXXX   | $F902
    .byte $38 ; |  XXX   | $F903
    .byte $38 ; |  XXX   | $F904
    .byte $1C ; |   XXX  | $F905
    .byte $1C ; |   XXX  | $F906
    .byte $0E ; |    XXX | $F907
    .byte $0E ; |    XXX | $F908
    .byte $0F ; |    XXXX| $F909
    .byte $07 ; |     XXX| $F90A
    .byte $07 ; |     XXX| $F90B
    .byte $07 ; |     XXX| $F90C
    .byte $03 ; |      XX| $F90D
    .byte $03 ; |      XX| $F90E
    .byte $01 ; |       X| $F90F
    .byte $01 ; |       X| $F910
    .byte $01 ; |       X| $F911
    .byte $00 ; |        | $F912
    .byte $00 ; |        | $F913
    .byte $00 ; |        | $F914
    .byte $00 ; |        | $F915
    .byte $00 ; |        | $F916
    .byte $00 ; |        | $F917
    .byte $00 ; |        | $F918
    .byte $00 ; |        | $F919
    .byte $00 ; |        | $F91A
    .byte $00 ; |        | $F91B
    .byte $00 ; |        | $F91C
    .byte $00 ; |        | $F91D
    .byte $00 ; |        | $F91E
    .byte $00 ; |        | $F91F
HuggingKissing1:
    .byte $80 ; |X       | $F920
    .byte $80 ; |X       | $F921
    .byte $C0 ; |XX      | $F922
    .byte $E3 ; |XXX   XX| $F923
    .byte $FF ; |XXXXXXXX| $F924
    .byte $FF ; |XXXXXXXX| $F925
    .byte $7F ; | XXXXXXX| $F926
    .byte $3F ; |  XXXXXX| $F927
    .byte $33 ; |  XX  XX| $F928
    .byte $03 ; |      XX| $F929
    .byte $07 ; |     XXX| $F92A
    .byte $0F ; |    XXXX| $F92B
    .byte $0F ; |    XXXX| $F92C
    .byte $0E ; |    XXX | $F92D
    .byte $1C ; |   XXX  | $F92E
    .byte $18 ; |   XX   | $F92F
    .byte $10 ; |   X    | $F930
    .byte $00 ; |        | $F931
    .byte $00 ; |        | $F932
    .byte $00 ; |        | $F933
    .byte $00 ; |        | $F934
    .byte $00 ; |        | $F935
    .byte $00 ; |        | $F936
    .byte $00 ; |        | $F937
    .byte $00 ; |        | $F938
    .byte $00 ; |        | $F939
    .byte $00 ; |        | $F93A
    .byte $00 ; |        | $F93B
    .byte $00 ; |        | $F93C
    .byte $00 ; |        | $F93D
    .byte $00 ; |        | $F93E
    .byte $00 ; |        | $F93F
DoggyStyle1:
    .byte $F8 ; |XXXXX   | $F940
    .byte $7C ; | XXXXX  | $F941
    .byte $1E ; |   XXXX | $F942
    .byte $0F ; |    XXXX| $F943
    .byte $07 ; |     XXX| $F944
    .byte $03 ; |      XX| $F945
    .byte $01 ; |       X| $F946
    .byte $01 ; |       X| $F947
    .byte $00 ; |        | $F948
    .byte $00 ; |        | $F949
    .byte $03 ; |      XX| $F94A
    .byte $03 ; |      XX| $F94B
    .byte $03 ; |      XX| $F94C
    .byte $1F ; |   XXXXX| $F94D
    .byte $1E ; |   XXXX | $F94E
    .byte $3E ; |  XXXXX | $F94F
    .byte $7F ; | XXXXXXX| $F950
    .byte $7F ; | XXXXXXX| $F951
    .byte $FF ; |XXXXXXXX| $F952
    .byte $FF ; |XXXXXXXX| $F953
    .byte $FF ; |XXXXXXXX| $F954
    .byte $FF ; |XXXXXXXX| $F955
    .byte $FF ; |XXXXXXXX| $F956
    .byte $7F ; | XXXXXXX| $F957
    .byte $7F ; | XXXXXXX| $F958
    .byte $3E ; |  XXXXX | $F959
    .byte $1C ; |   XXX  | $F95A
    .byte $00 ; |        | $F95B
    .byte $00 ; |        | $F95C
    .byte $00 ; |        | $F95D
    .byte $00 ; |        | $F95E
    .byte $00 ; |        | $F95F
GirlOnTop1:
    .byte $F0 ; |XXXX    | $F960
    .byte $F8 ; |XXXXX   | $F961
    .byte $78 ; | XXXX   | $F962
    .byte $38 ; |  XXX   | $F963
    .byte $38 ; |  XXX   | $F964
    .byte $1C ; |   XXX  | $F965
    .byte $1D ; |   XXX X| $F966
    .byte $0F ; |    XXXX| $F967
    .byte $0E ; |    XXX | $F968
    .byte $0F ; |    XXXX| $F969
    .byte $07 ; |     XXX| $F96A
    .byte $07 ; |     XXX| $F96B
    .byte $07 ; |     XXX| $F96C
    .byte $0F ; |    XXXX| $F96D
    .byte $0B ; |    X XX| $F96E
    .byte $0F ; |    XXXX| $F96F
    .byte $1E ; |   XXXX | $F970
    .byte $1F ; |   XXXXX| $F971
    .byte $1E ; |   XXXX | $F972
    .byte $1C ; |   XXX  | $F973
    .byte $1C ; |   XXX  | $F974
    .byte $18 ; |   XX   | $F975
    .byte $38 ; |  XXX   | $F976
    .byte $38 ; |  XXX   | $F977
    .byte $30 ; |  XX    | $F978
    .byte $30 ; |  XX    | $F979
    .byte $70 ; | XXX    | $F97A
    .byte $70 ; | XXX    | $F97B
    .byte $F0 ; |XXXX    | $F97C
    .byte $E0 ; |XXX     | $F97D
    .byte $C0 ; |XX      | $F97E
    .byte $80 ; |X       | $F97F
PlayLogoA_1:
    .byte $00 ; |        | $F980
    .byte $00 ; |        | $F981
    .byte $00 ; |        | $F982
    .byte $00 ; |        | $F983
    .byte $00 ; |        | $F984
    .byte $00 ; |        | $F985
    .byte $00 ; |        | $F986
    .byte $00 ; |        | $F987
    .byte $00 ; |        | $F988
    .byte $00 ; |        | $F989
    .byte $00 ; |        | $F98A
    .byte $00 ; |        | $F98B
    .byte $00 ; |        | $F98C
    .byte $00 ; |        | $F98D
    .byte $00 ; |        | $F98E
    .byte $00 ; |        | $F98F
PlayLogoB_1:
    .byte $00 ; |        | $F990
    .byte $00 ; |        | $F991
    .byte $00 ; |        | $F992
    .byte $00 ; |        | $F993
    .byte $00 ; |        | $F994
    .byte $00 ; |        | $F995
    .byte $00 ; |        | $F996
    .byte $00 ; |        | $F997
    .byte $00 ; |        | $F998
    .byte $00 ; |        | $F999
    .byte $00 ; |        | $F99A
    .byte $00 ; |        | $F99B
    .byte $00 ; |        | $F99C
    .byte $00 ; |        | $F99D
    .byte $00 ; |        | $F99E
    .byte $00 ; |        | $F99F
PlayLogoC_1:
    .byte $00 ; |        | $F9A0
    .byte $00 ; |        | $F9A1
    .byte $00 ; |        | $F9A2
    .byte $00 ; |        | $F9A3
    .byte $00 ; |        | $F9A4
    .byte $00 ; |        | $F9A5
    .byte $00 ; |        | $F9A6
    .byte $00 ; |        | $F9A7
    .byte $00 ; |        | $F9A8
    .byte $00 ; |        | $F9A9
    .byte $00 ; |        | $F9AA
    .byte $00 ; |        | $F9AB
    .byte $00 ; |        | $F9AC
    .byte $00 ; |        | $F9AD
    .byte $00 ; |        | $F9AE
    .byte $00 ; |        | $F9AF
PlayLogoD_1:
    .byte $00 ; |        | $F9B0
    .byte $00 ; |        | $F9B1
    .byte $00 ; |        | $F9B2
    .byte $00 ; |        | $F9B3
    .byte $00 ; |        | $F9B4
    .byte $00 ; |        | $F9B5
    .byte $00 ; |        | $F9B6
    .byte $00 ; |        | $F9B7
    .byte $00 ; |        | $F9B8
    .byte $00 ; |        | $F9B9
    .byte $00 ; |        | $F9BA
    .byte $00 ; |        | $F9BB
    .byte $00 ; |        | $F9BC
    .byte $00 ; |        | $F9BD
    .byte $00 ; |        | $F9BE
    .byte $00 ; |        | $F9BF

;possibly free bytes
    .byte $00 ; |        | $F9C0
    .byte $00 ; |        | $F9C1
    .byte $00 ; |        | $F9C2
    .byte $00 ; |        | $F9C3
    .byte $00 ; |        | $F9C4
    .byte $00 ; |        | $F9C5
    .byte $00 ; |        | $F9C6
    .byte $00 ; |        | $F9C7
    .byte $00 ; |        | $F9C8
    .byte $00 ; |        | $F9C9
    .byte $00 ; |        | $F9CA
    .byte $00 ; |        | $F9CB
    .byte $00 ; |        | $F9CC
    .byte $00 ; |        | $F9CD
    .byte $00 ; |        | $F9CE
    .byte $00 ; |        | $F9CF
    .byte $00 ; |        | $F9D0
    .byte $00 ; |        | $F9D1
    .byte $00 ; |        | $F9D2
    .byte $00 ; |        | $F9D3
    .byte $00 ; |        | $F9D4
    .byte $00 ; |        | $F9D5
    .byte $00 ; |        | $F9D6
    .byte $00 ; |        | $F9D7
    .byte $00 ; |        | $F9D8
    .byte $00 ; |        | $F9D9
    .byte $00 ; |        | $F9DA
    .byte $00 ; |        | $F9DB
    .byte $00 ; |        | $F9DC
    .byte $00 ; |        | $F9DD
    .byte $00 ; |        | $F9DE
    .byte $00 ; |        | $F9DF
MystiqueLogoOne:
    .byte $00 ; |        | $F9E0
    .byte $7F ; | XXXXXXX| $F9E1
    .byte $7F ; | XXXXXXX| $F9E2
    .byte $70 ; | XXX    | $F9E3
    .byte $7F ; | XXXXXXX| $F9E4
    .byte $7F ; | XXXXXXX| $F9E5
    .byte $7F ; | XXXXXXX| $F9E6
    .byte $7F ; | XXXXXXX| $F9E7
    .byte $7F ; | XXXXXXX| $F9E8
    .byte $6F ; | XX XXXX| $F9E9
    .byte $6F ; | XX XXXX| $F9EA
    .byte $6F ; | XX XXXX| $F9EB
    .byte $6F ; | XX XXXX| $F9EC
    .byte $6F ; | XX XXXX| $F9ED
    .byte $6D ; | XX XX X| $F9EE
    .byte $6D ; | XX XX X| $F9EF
    .byte $6D ; | XX XX X| $F9F0
    .byte $6A ; | XX X X | $F9F1
    .byte $6A ; | XX X X | $F9F2
    .byte $67 ; | XX  XXX| $F9F3
    .byte $7F ; | XXXXXXX| $F9F4
    .byte $7F ; | XXXXXXX| $F9F5
    .byte $7F ; | XXXXXXX| $F9F6
    .byte $7F ; | XXXXXXX| $F9F7
    .byte $7F ; | XXXXXXX| $F9F8
    .byte $7F ; | XXXXXXX| $F9F9
    .byte $7F ; | XXXXXXX| $F9FA
    .byte $7F ; | XXXXXXX| $F9FB
    .byte $7F ; | XXXXXXX| $F9FC
    .byte $7F ; | XXXXXXX| $F9FD
    .byte $7F ; | XXXXXXX| $F9FE
    .byte $00 ; |        | $F9FF


;    normal
;
;    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;    XXXXXXXXXXXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXXXXX
;    XXXXXXXXXXXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXXXXX
;    XX  XXX  XXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXXXXX
;    XX X X X XXXXXXXXXXX     XXXXXXXXXXXXXXXXXXXXX
;    XX X X X XXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXXXXX
;    XX XX XX XXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXXXXX
;    XX XX XX XXXXXXXXXXXXX XX XXXXXXXXXXXXXXXXXXXX
;    XX XX XX XX XX XX   XX XXXXXX   XX XX XXX  XXX
;    XX XXXXX XX XX XX XXXX XX XX XX XX XX XX XX XX
;    XX XXXXX XX XX XX   XX XX XX XX XX XX XX    XX
;    XX XXXXX XX XX XXXX XX XX XX XX XX XX XX XXXXX
;    XX XXXXX XX XX XXXX XX XX XX   XXX XX XX XXXXX
;    XX XXXXX XX XX XX   XX XX XXXX XXXX  XXXX  XXX
;    XXXXXXXXXXXX   XXXXXXXXXXXXXXX XXXXXXXXXXXXXXX
;    XXXXXXXXXXXXXX XXXXXXXXXXXXXXXX XXXXXXXXXXXXXX
;    XXXXXXXXXXXXX XXXXXXXXXXXXXXXXX XXXXXXXXXXXXXX
;    XXXXXXXXXXXXX XXXXXXXXXXXXXXXXXX    XXXXXXXXXX
;    XXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;    XXX    XXXXX XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;    XXXXXXX     XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;


;    inverted
;
;
;
;
;
;
;
;
;
;                          X
;                          X
;      XX   XX             X
;      X X X X           XXXXX
;      X X X X             X
;      X  X  X             X
;      X  X  X             X  X
;      X  X  X  X  X  XXX  X      XXX  X  X   XX
;      X     X  X  X  X    X  X  X  X  X  X  X  X
;      X     X  X  X  XXX  X  X  X  X  X  X  XXXX
;      X     X  X  X    X  X  X  X  X  X  X  X
;      X     X  X  X    X  X  X  XXX   X  X  X
;      X     X  X  X  XXX  X  X    X    XX    XX
;                XXX               X
;                  X                X
;                 X                 X
;                 X                  XXXX
;                X
;       XXXX     X
;           XXXXX
;

SixtyNine2:
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
    .byte $80 ; |X       | $FA0A
    .byte $C0 ; |XX      | $FA0B
    .byte $C0 ; |XX      | $FA0C
    .byte $E0 ; |XXX     | $FA0D
    .byte $E1 ; |XXX    X| $FA0E
    .byte $F1 ; |XXXX   X| $FA0F
    .byte $F1 ; |XXXX   X| $FA10
    .byte $F3 ; |XXXX  XX| $FA11
    .byte $FB ; |XXXXX XX| $FA12
    .byte $FF ; |XXXXXXXX| $FA13
    .byte $FF ; |XXXXXXXX| $FA14
    .byte $7F ; | XXXXXXX| $FA15
    .byte $7F ; | XXXXXXX| $FA16
    .byte $7F ; | XXXXXXX| $FA17
    .byte $3F ; |  XXXXXX| $FA18
    .byte $3F ; |  XXXXXX| $FA19
    .byte $3F ; |  XXXXXX| $FA1A
    .byte $1F ; |   XXXXX| $FA1B
    .byte $1F ; |   XXXXX| $FA1C
    .byte $0F ; |    XXXX| $FA1D
    .byte $06 ; |     XX | $FA1E
    .byte $00 ; |        | $FA1F
HuggingKissing2:
    .byte $06 ; |     XX | $FA20
    .byte $1F ; |   XXXXX| $FA21
    .byte $FF ; |XXXXXXXX| $FA22
    .byte $FF ; |XXXXXXXX| $FA23
    .byte $FF ; |XXXXXXXX| $FA24
    .byte $FF ; |XXXXXXXX| $FA25
    .byte $E3 ; |XXX   XX| $FA26
    .byte $01 ; |       X| $FA27
    .byte $00 ; |        | $FA28
    .byte $80 ; |X       | $FA29
    .byte $E0 ; |XXX     | $FA2A
    .byte $FE ; |XXXXXXX | $FA2B
    .byte $FF ; |XXXXXXXX| $FA2C
    .byte $7F ; | XXXXXXX| $FA2D
    .byte $3F ; |  XXXXXX| $FA2E
    .byte $1F ; |   XXXXX| $FA2F
    .byte $0F ; |    XXXX| $FA30
    .byte $03 ; |      XX| $FA31
    .byte $00 ; |        | $FA32
    .byte $00 ; |        | $FA33
    .byte $00 ; |        | $FA34
    .byte $00 ; |        | $FA35
    .byte $00 ; |        | $FA36
    .byte $00 ; |        | $FA37
    .byte $00 ; |        | $FA38
    .byte $00 ; |        | $FA39
    .byte $00 ; |        | $FA3A
    .byte $00 ; |        | $FA3B
    .byte $00 ; |        | $FA3C
    .byte $00 ; |        | $FA3D
    .byte $00 ; |        | $FA3E
    .byte $00 ; |        | $FA3F
DoggyStyle2:
    .byte $00 ; |        | $FA40
    .byte $00 ; |        | $FA41
    .byte $00 ; |        | $FA42
    .byte $00 ; |        | $FA43
    .byte $80 ; |X       | $FA44
    .byte $C0 ; |XX      | $FA45
    .byte $E1 ; |XXX    X| $FA46
    .byte $E7 ; |XXX  XXX| $FA47
    .byte $F7 ; |XXXX XXX| $FA48
    .byte $FB ; |XXXXX XX| $FA49
    .byte $7D ; | XXXXX X| $FA4A
    .byte $BE ; |X XXXXX | $FA4B
    .byte $DF ; |XX XXXXX| $FA4C
    .byte $F7 ; |XXXX XXX| $FA4D
    .byte $FB ; |XXXXX XX| $FA4E
    .byte $FD ; |XXXXXX X| $FA4F
    .byte $7E ; | XXXXXX | $FA50
    .byte $DF ; |XX XXXXX| $FA51
    .byte $F7 ; |XXXX XXX| $FA52
    .byte $FB ; |XXXXX XX| $FA53
    .byte $FD ; |XXXXXX X| $FA54
    .byte $FE ; |XXXXXXX | $FA55
    .byte $9F ; |X  XXXXX| $FA56
    .byte $3F ; |  XXXXXX| $FA57
    .byte $3F ; |  XXXXXX| $FA58
    .byte $3F ; |  XXXXXX| $FA59
    .byte $3F ; |  XXXXXX| $FA5A
    .byte $3F ; |  XXXXXX| $FA5B
    .byte $1F ; |   XXXXX| $FA5C
    .byte $1F ; |   XXXXX| $FA5D
    .byte $0F ; |    XXXX| $FA5E
    .byte $07 ; |     XXX| $FA5F
GirlOnTop2:
    .byte $0C ; |    XX  | $FA60
    .byte $3E ; |  XXXXX | $FA61
    .byte $3F ; |  XXXXXX| $FA62
    .byte $7F ; | XXXXXXX| $FA63
    .byte $FF ; |XXXXXXXX| $FA64
    .byte $FF ; |XXXXXXXX| $FA65
    .byte $FF ; |XXXXXXXX| $FA66
    .byte $FF ; |XXXXXXXX| $FA67
    .byte $F7 ; |XXXX XXX| $FA68
    .byte $E7 ; |XXX  XXX| $FA69
    .byte $A3 ; |X X   XX| $FA6A
    .byte $C2 ; |XX    X | $FA6B
    .byte $C3 ; |XX    XX| $FA6C
    .byte $E1 ; |XXX    X| $FA6D
    .byte $E1 ; |XXX    X| $FA6E
    .byte $F1 ; |XXXX   X| $FA6F
    .byte $F3 ; |XXXX  XX| $FA70
    .byte $F3 ; |XXXX  XX| $FA71
    .byte $FB ; |XXXXX XX| $FA72
    .byte $FF ; |XXXXXXXX| $FA73
    .byte $FF ; |XXXXXXXX| $FA74
    .byte $7F ; | XXXXXXX| $FA75
    .byte $7F ; | XXXXXXX| $FA76
    .byte $7F ; | XXXXXXX| $FA77
    .byte $3F ; |  XXXXXX| $FA78
    .byte $3F ; |  XXXXXX| $FA79
    .byte $3F ; |  XXXXXX| $FA7A
    .byte $1F ; |   XXXXX| $FA7B
    .byte $1F ; |   XXXXX| $FA7C
    .byte $0F ; |    XXXX| $FA7D
    .byte $06 ; |     XX | $FA7E
    .byte $00 ; |        | $FA7F
PlayLogoA_2:
    .byte $82 ; |X     X | $FA80
    .byte $82 ; |X     X | $FA81
    .byte $82 ; |X     X | $FA82
    .byte $82 ; |X     X | $FA83
    .byte $82 ; |X     X | $FA84
    .byte $82 ; |X     X | $FA85
    .byte $F2 ; |XXXX  X | $FA86
    .byte $F2 ; |XXXX  X | $FA87
    .byte $9A ; |X  XX X | $FA88
    .byte $9A ; |X  XX X | $FA89
    .byte $9A ; |X  XX X | $FA8A
    .byte $9A ; |X  XX X | $FA8B
    .byte $F2 ; |XXXX  X | $FA8C
    .byte $F2 ; |XXXX  X | $FA8D
    .byte $00 ; |        | $FA8E
    .byte $00 ; |        | $FA8F
PlayLogoB_2:
    .byte $82 ; |X     X | $FA90
    .byte $82 ; |X     X | $FA91
    .byte $82 ; |X     X | $FA92
    .byte $82 ; |X     X | $FA93
    .byte $82 ; |X     X | $FA94
    .byte $82 ; |X     X | $FA95
    .byte $F2 ; |XXXX  X | $FA96
    .byte $F2 ; |XXXX  X | $FA97
    .byte $9A ; |X  XX X | $FA98
    .byte $9A ; |X  XX X | $FA99
    .byte $9A ; |X  XX X | $FA9A
    .byte $9A ; |X  XX X | $FA9B
    .byte $F2 ; |XXXX  X | $FA9C
    .byte $F2 ; |XXXX  X | $FA9D
    .byte $00 ; |        | $FA9E
    .byte $00 ; |        | $FA9F
PlayLogoC_2:
    .byte $82 ; |X     X | $FAA0
    .byte $82 ; |X     X | $FAA1
    .byte $82 ; |X     X | $FAA2
    .byte $82 ; |X     X | $FAA3
    .byte $82 ; |X     X | $FAA4
    .byte $82 ; |X     X | $FAA5
    .byte $F2 ; |XXXX  X | $FAA6
    .byte $F2 ; |XXXX  X | $FAA7
    .byte $9A ; |X  XX X | $FAA8
    .byte $9A ; |X  XX X | $FAA9
    .byte $9A ; |X  XX X | $FAAA
    .byte $9A ; |X  XX X | $FAAB
    .byte $F2 ; |XXXX  X | $FAAC
    .byte $F2 ; |XXXX  X | $FAAD
    .byte $00 ; |        | $FAAE
    .byte $00 ; |        | $FAAF
PlayLogoD_2:
    .byte $82 ; |X     X | $FAB0
    .byte $82 ; |X     X | $FAB1
    .byte $82 ; |X     X | $FAB2
    .byte $82 ; |X     X | $FAB3
    .byte $82 ; |X     X | $FAB4
    .byte $82 ; |X     X | $FAB5
    .byte $F2 ; |XXXX  X | $FAB6
    .byte $F2 ; |XXXX  X | $FAB7
    .byte $9A ; |X  XX X | $FAB8
    .byte $9A ; |X  XX X | $FAB9
    .byte $9A ; |X  XX X | $FABA
    .byte $9A ; |X  XX X | $FABB
    .byte $F2 ; |XXXX  X | $FABC
    .byte $F2 ; |XXXX  X | $FABD
    .byte $00 ; |        | $FABE
    .byte $00 ; |        | $FABF

;possibly free bytes
    .byte $00 ; |        | $FAC0
    .byte $00 ; |        | $FAC1
    .byte $00 ; |        | $FAC2
    .byte $00 ; |        | $FAC3
    .byte $00 ; |        | $FAC4
    .byte $00 ; |        | $FAC5
    .byte $00 ; |        | $FAC6
    .byte $00 ; |        | $FAC7
    .byte $00 ; |        | $FAC8
    .byte $00 ; |        | $FAC9
    .byte $00 ; |        | $FACA
    .byte $00 ; |        | $FACB
    .byte $00 ; |        | $FACC
    .byte $00 ; |        | $FACD
    .byte $00 ; |        | $FACE
    .byte $00 ; |        | $FACF
    .byte $00 ; |        | $FAD0
    .byte $00 ; |        | $FAD1
    .byte $00 ; |        | $FAD2
    .byte $00 ; |        | $FAD3
    .byte $00 ; |        | $FAD4
    .byte $00 ; |        | $FAD5
    .byte $00 ; |        | $FAD6
    .byte $00 ; |        | $FAD7
    .byte $00 ; |        | $FAD8
    .byte $00 ; |        | $FAD9
    .byte $00 ; |        | $FADA
    .byte $00 ; |        | $FADB
    .byte $00 ; |        | $FADC
    .byte $00 ; |        | $FADD
    .byte $00 ; |        | $FADE
    .byte $00 ; |        | $FADF
MystiqueLogoTwo:
    .byte $00 ; |        | $FAE0
    .byte $FF ; |XXXXXXXX| $FAE1
    .byte $07 ; |     XXX| $FAE2
    .byte $FB ; |XXXXX XX| $FAE3
    .byte $FB ; |XXXXX XX| $FAE4
    .byte $FD ; |XXXXXX X| $FAE5
    .byte $FD ; |XXXXXX X| $FAE6
    .byte $FE ; |XXXXXXX | $FAE7
    .byte $F8 ; |XXXXX   | $FAE8
    .byte $B6 ; |X XX XX | $FAE9
    .byte $B6 ; |X XX XX | $FAEA
    .byte $B6 ; |X XX XX | $FAEB
    .byte $B6 ; |X XX XX | $FAEC
    .byte $B6 ; |X XX XX | $FAED
    .byte $B6 ; |X XX XX | $FAEE
    .byte $BF ; |X XXXXXX| $FAEF
    .byte $BF ; |X XXXXXX| $FAF0
    .byte $BF ; |X XXXXXX| $FAF1
    .byte $BF ; |X XXXXXX| $FAF2
    .byte $3F ; |  XXXXXX| $FAF3
    .byte $FF ; |XXXXXXXX| $FAF4
    .byte $FF ; |XXXXXXXX| $FAF5
    .byte $FF ; |XXXXXXXX| $FAF6
    .byte $FF ; |XXXXXXXX| $FAF7
    .byte $FF ; |XXXXXXXX| $FAF8
    .byte $FF ; |XXXXXXXX| $FAF9
    .byte $FF ; |XXXXXXXX| $FAFA
    .byte $FF ; |XXXXXXXX| $FAFB
    .byte $FF ; |XXXXXXXX| $FAFC
    .byte $FF ; |XXXXXXXX| $FAFD
    .byte $FF ; |XXXXXXXX| $FAFE
    .byte $00 ; |        | $FAFF
SixtyNine3:
    .byte $01 ; |       X| $FB00
    .byte $07 ; |     XXX| $FB01
    .byte $07 ; |     XXX| $FB02
    .byte $0F ; |    XXXX| $FB03
    .byte $1F ; |   XXXXX| $FB04
    .byte $1F ; |   XXXXX| $FB05
    .byte $3F ; |  XXXXXX| $FB06
    .byte $3F ; |  XXXXXX| $FB07
    .byte $3F ; |  XXXXXX| $FB08
    .byte $7F ; | XXXXXXX| $FB09
    .byte $7E ; | XXXXXX | $FB0A
    .byte $FD ; |XXXXXX X| $FB0B
    .byte $FB ; |XXXXX XX| $FB0C
    .byte $F7 ; |XXXX XXX| $FB0D
    .byte $F7 ; |XXXX XXX| $FB0E
    .byte $EF ; |XXX XXXX| $FB0F
    .byte $FF ; |XXXXXXXX| $FB10
    .byte $FD ; |XXXXXX X| $FB11
    .byte $FB ; |XXXXX XX| $FB12
    .byte $FB ; |XXXXX XX| $FB13
    .byte $FD ; |XXXXXX X| $FB14
    .byte $FF ; |XXXXXXXX| $FB15
    .byte $FF ; |XXXXXXXX| $FB16
    .byte $FF ; |XXXXXXXX| $FB17
    .byte $FF ; |XXXXXXXX| $FB18
    .byte $FF ; |XXXXXXXX| $FB19
    .byte $BF ; |X XXXXXX| $FB1A
    .byte $BF ; |X XXXXXX| $FB1B
    .byte $1F ; |   XXXXX| $FB1C
    .byte $0F ; |    XXXX| $FB1D
    .byte $07 ; |     XXX| $FB1E
    .byte $00 ; |        | $FB1F
HuggingKissing3:
    .byte $00 ; |        | $FB20
    .byte $81 ; |X      X| $FB21
    .byte $E3 ; |XXX   XX| $FB22
    .byte $FB ; |XXXXX XX| $FB23
    .byte $FF ; |XXXXXXXX| $FB24
    .byte $F7 ; |XXXX XXX| $FB25
    .byte $EF ; |XXX XXXX| $FB26
    .byte $FF ; |XXXXXXXX| $FB27
    .byte $3F ; |  XXXXXX| $FB28
    .byte $3F ; |  XXXXXX| $FB29
    .byte $3F ; |  XXXXXX| $FB2A
    .byte $7F ; | XXXXXXX| $FB2B
    .byte $FF ; |XXXXXXXX| $FB2C
    .byte $FF ; |XXXXXXXX| $FB2D
    .byte $FF ; |XXXXXXXX| $FB2E
    .byte $FE ; |XXXXXXX | $FB2F
    .byte $FE ; |XXXXXXX | $FB30
    .byte $FC ; |XXXXXX  | $FB31
    .byte $F8 ; |XXXXX   | $FB32
    .byte $30 ; |  XX    | $FB33
    .byte $00 ; |        | $FB34
    .byte $00 ; |        | $FB35
    .byte $00 ; |        | $FB36
    .byte $00 ; |        | $FB37
    .byte $00 ; |        | $FB38
    .byte $00 ; |        | $FB39
    .byte $00 ; |        | $FB3A
    .byte $00 ; |        | $FB3B
    .byte $00 ; |        | $FB3C
    .byte $00 ; |        | $FB3D
    .byte $00 ; |        | $FB3E
    .byte $00 ; |        | $FB3F
DoggyStyle3:
    .byte $01 ; |       X| $FB40
    .byte $03 ; |      XX| $FB41
    .byte $07 ; |     XXX| $FB42
    .byte $07 ; |     XXX| $FB43
    .byte $07 ; |     XXX| $FB44
    .byte $07 ; |     XXX| $FB45
    .byte $07 ; |     XXX| $FB46
    .byte $83 ; |X     XX| $FB47
    .byte $C3 ; |XX    XX| $FB48
    .byte $E1 ; |XXX    X| $FB49
    .byte $E1 ; |XXX    X| $FB4A
    .byte $F0 ; |XXXX    | $FB4B
    .byte $70 ; | XXX    | $FB4C
    .byte $F9 ; |XXXXX  X| $FB4D
    .byte $FF ; |XXXXXXXX| $FB4E
    .byte $FF ; |XXXXXXXX| $FB4F
    .byte $FF ; |XXXXXXXX| $FB50
    .byte $BF ; |X XXXXXX| $FB51
    .byte $DF ; |XX XXXXX| $FB52
    .byte $EF ; |XXX XXXX| $FB53
    .byte $F7 ; |XXXX XXX| $FB54
    .byte $FF ; |XXXXXXXX| $FB55
    .byte $FF ; |XXXXXXXX| $FB56
    .byte $FF ; |XXXXXXXX| $FB57
    .byte $FF ; |XXXXXXXX| $FB58
    .byte $FF ; |XXXXXXXX| $FB59
    .byte $FF ; |XXXXXXXX| $FB5A
    .byte $FF ; |XXXXXXXX| $FB5B
    .byte $EF ; |XXX XXXX| $FB5C
    .byte $E7 ; |XXX  XXX| $FB5D
    .byte $C0 ; |XX      | $FB5E
    .byte $80 ; |X       | $FB5F
GirlOnTop3:
    .byte $0F ; |    XXXX| $FB60
    .byte $07 ; |     XXX| $FB61
    .byte $05 ; |     X X| $FB62
    .byte $8F ; |X   XXXX| $FB63
    .byte $9F ; |X  XXXXX| $FB64
    .byte $DF ; |XX XXXXX| $FB65
    .byte $FF ; |XXXXXXXX| $FB66
    .byte $BF ; |X XXXXXX| $FB67
    .byte $FF ; |XXXXXXXX| $FB68
    .byte $7F ; | XXXXXXX| $FB69
    .byte $FF ; |XXXXXXXX| $FB6A
    .byte $FF ; |XXXXXXXX| $FB6B
    .byte $FE ; |XXXXXXX | $FB6C
    .byte $FF ; |XXXXXXXX| $FB6D
    .byte $FF ; |XXXXXXXX| $FB6E
    .byte $FF ; |XXXXXXXX| $FB6F
    .byte $FB ; |XXXXX XX| $FB70
    .byte $FF ; |XXXXXXXX| $FB71
    .byte $F7 ; |XXXX XXX| $FB72
    .byte $FF ; |XXXXXXXX| $FB73
    .byte $EF ; |XXX XXXX| $FB74
    .byte $FF ; |XXXXXXXX| $FB75
    .byte $FF ; |XXXXXXXX| $FB76
    .byte $DF ; |XX XXXXX| $FB77
    .byte $FF ; |XXXXXXXX| $FB78
    .byte $DF ; |XX XXXXX| $FB79
    .byte $9F ; |X  XXXXX| $FB7A
    .byte $9F ; |X  XXXXX| $FB7B
    .byte $0F ; |    XXXX| $FB7C
    .byte $0F ; |    XXXX| $FB7D
    .byte $07 ; |     XXX| $FB7E
    .byte $03 ; |      XX| $FB7F
PlayLogoA_3:
    .byte $6E ; | XX XXX | $FB80
    .byte $6E ; | XX XXX | $FB81
    .byte $A2 ; |X X   X | $FB82
    .byte $A2 ; |X X   X | $FB83
    .byte $AE ; |X X XXX | $FB84
    .byte $AE ; |X X XXX | $FB85
    .byte $6A ; | XX X X | $FB86
    .byte $6A ; | XX X X | $FB87
    .byte $0A ; |    X X | $FB88
    .byte $0A ; |    X X | $FB89
    .byte $00 ; |        | $FB8A
    .byte $00 ; |        | $FB8B
    .byte $00 ; |        | $FB8C
    .byte $00 ; |        | $FB8D
    .byte $00 ; |        | $FB8E
    .byte $00 ; |        | $FB8F
PlayLogoB_3:
    .byte $6E ; | XX XXX | $FB90
    .byte $6E ; | XX XXX | $FB91
    .byte $A2 ; |X X   X | $FB92
    .byte $A2 ; |X X   X | $FB93
    .byte $AE ; |X X XXX | $FB94
    .byte $AE ; |X X XXX | $FB95
    .byte $6A ; | XX X X | $FB96
    .byte $6A ; | XX X X | $FB97
    .byte $0A ; |    X X | $FB98
    .byte $0A ; |    X X | $FB99
    .byte $00 ; |        | $FB9A
    .byte $00 ; |        | $FB9B
    .byte $00 ; |        | $FB9C
    .byte $00 ; |        | $FB9D
    .byte $00 ; |        | $FB9E
    .byte $00 ; |        | $FB9F
PlayLogoC_3:
    .byte $6E ; | XX XXX | $FBA0
    .byte $6E ; | XX XXX | $FBA1
    .byte $A2 ; |X X   X | $FBA2
    .byte $A2 ; |X X   X | $FBA3
    .byte $AE ; |X X XXX | $FBA4
    .byte $AE ; |X X XXX | $FBA5
    .byte $6A ; | XX X X | $FBA6
    .byte $6A ; | XX X X | $FBA7
    .byte $0A ; |    X X | $FBA8
    .byte $0A ; |    X X | $FBA9
    .byte $00 ; |        | $FBAA
    .byte $00 ; |        | $FBAB
    .byte $00 ; |        | $FBAC
    .byte $00 ; |        | $FBAD
    .byte $00 ; |        | $FBAE
    .byte $00 ; |        | $FBAF
PlayLogoD_3:
    .byte $6E ; | XX XXX | $FBB0
    .byte $6E ; | XX XXX | $FBB1
    .byte $A2 ; |X X   X | $FBB2
    .byte $A2 ; |X X   X | $FBB3
    .byte $AE ; |X X XXX | $FBB4
    .byte $AE ; |X X XXX | $FBB5
    .byte $6A ; | XX X X | $FBB6
    .byte $6A ; | XX X X | $FBB7
    .byte $0A ; |    X X | $FBB8
    .byte $0A ; |    X X | $FBB9
    .byte $00 ; |        | $FBBA
    .byte $00 ; |        | $FBBB
    .byte $00 ; |        | $FBBC
    .byte $00 ; |        | $FBBD
    .byte $00 ; |        | $FBBE
    .byte $00 ; |        | $FBBF

;possibly free bytes
    .byte $00 ; |        | $FBC0
    .byte $00 ; |        | $FBC1
    .byte $00 ; |        | $FBC2
    .byte $00 ; |        | $FBC3
    .byte $00 ; |        | $FBC4
    .byte $00 ; |        | $FBC5
    .byte $00 ; |        | $FBC6
    .byte $00 ; |        | $FBC7
    .byte $00 ; |        | $FBC8
    .byte $00 ; |        | $FBC9
    .byte $00 ; |        | $FBCA
    .byte $00 ; |        | $FBCB
    .byte $00 ; |        | $FBCC
    .byte $00 ; |        | $FBCD
    .byte $00 ; |        | $FBCE
    .byte $00 ; |        | $FBCF
    .byte $00 ; |        | $FBD0
    .byte $00 ; |        | $FBD1
    .byte $00 ; |        | $FBD2
    .byte $00 ; |        | $FBD3
    .byte $00 ; |        | $FBD4
    .byte $00 ; |        | $FBD5
    .byte $00 ; |        | $FBD6
    .byte $00 ; |        | $FBD7
    .byte $00 ; |        | $FBD8
    .byte $00 ; |        | $FBD9
    .byte $00 ; |        | $FBDA
    .byte $00 ; |        | $FBDB
    .byte $00 ; |        | $FBDC
    .byte $00 ; |        | $FBDD
    .byte $00 ; |        | $FBDE
    .byte $00 ; |        | $FBDF
MystiqueLogoThree:
    .byte $00 ; |        | $FBE0
    .byte $FF ; |XXXXXXXX| $FBE1
    .byte $FF ; |XXXXXXXX| $FBE2
    .byte $FF ; |XXXXXXXX| $FBE3
    .byte $FF ; |XXXXXXXX| $FBE4
    .byte $FF ; |XXXXXXXX| $FBE5
    .byte $FF ; |XXXXXXXX| $FBE6
    .byte $FF ; |XXXXXXXX| $FBE7
    .byte $FF ; |XXXXXXXX| $FBE8
    .byte $C6 ; |XX   XX | $FBE9
    .byte $F6 ; |XXXX XX | $FBEA
    .byte $F6 ; |XXXX XX | $FBEB
    .byte $C6 ; |XX   XX | $FBEC
    .byte $DE ; |XX XXXX | $FBED
    .byte $C6 ; |XX   XX | $FBEE
    .byte $FE ; |XXXXXXX | $FBEF
    .byte $FE ; |XXXXXXX | $FBF0
    .byte $FE ; |XXXXXXX | $FBF1
    .byte $F8 ; |XXXXX   | $FBF2
    .byte $FE ; |XXXXXXX | $FBF3
    .byte $FE ; |XXXXXXX | $FBF4
    .byte $FE ; |XXXXXXX | $FBF5
    .byte $FF ; |XXXXXXXX| $FBF6
    .byte $FF ; |XXXXXXXX| $FBF7
    .byte $FF ; |XXXXXXXX| $FBF8
    .byte $FF ; |XXXXXXXX| $FBF9
    .byte $FF ; |XXXXXXXX| $FBFA
    .byte $FF ; |XXXXXXXX| $FBFB
    .byte $FF ; |XXXXXXXX| $FBFC
    .byte $FF ; |XXXXXXXX| $FBFD
    .byte $FF ; |XXXXXXXX| $FBFE
    .byte $00 ; |        | $FBFF
SixtyNine4:
    .byte $EF ; |XXX XXXX| $FC00
    .byte $DF ; |XX XXXXX| $FC01
    .byte $DF ; |XX XXXXX| $FC02
    .byte $FF ; |XXXXXXXX| $FC03
    .byte $DF ; |XX XXXXX| $FC04
    .byte $FF ; |XXXXXXXX| $FC05
    .byte $DF ; |XX XXXXX| $FC06
    .byte $FF ; |XXXXXXXX| $FC07
    .byte $EF ; |XXX XXXX| $FC08
    .byte $FF ; |XXXXXXXX| $FC09
    .byte $77 ; | XXX XXX| $FC0A
    .byte $FF ; |XXXXXXXX| $FC0B
    .byte $A7 ; |X X  XXX| $FC0C
    .byte $E3 ; |XXX   XX| $FC0D
    .byte $D1 ; |XX X   X| $FC0E
    .byte $F9 ; |XXXXX  X| $FC0F
    .byte $EF ; |XXX XXXX| $FC10
    .byte $FF ; |XXXXXXXX| $FC11
    .byte $F7 ; |XXXX XXX| $FC12
    .byte $FF ; |XXXXXXXX| $FC13
    .byte $FF ; |XXXXXXXX| $FC14
    .byte $FF ; |XXXXXXXX| $FC15
    .byte $FF ; |XXXXXXXX| $FC16
    .byte $FF ; |XXXXXXXX| $FC17
    .byte $FF ; |XXXXXXXX| $FC18
    .byte $FF ; |XXXXXXXX| $FC19
    .byte $C7 ; |XX   XXX| $FC1A
    .byte $E9 ; |XXX X  X| $FC1B
    .byte $FD ; |XXXXXX X| $FC1C
    .byte $FE ; |XXXXXXX | $FC1D
    .byte $FF ; |XXXXXXXX| $FC1E
    .byte $EF ; |XXX XXXX| $FC1F
HuggingKissing4:
    .byte $F0 ; |XXXX    | $FC20
    .byte $F8 ; |XXXXX   | $FC21
    .byte $F8 ; |XXXXX   | $FC22
    .byte $FE ; |XXXXXXX | $FC23
    .byte $FF ; |XXXXXXXX| $FC24
    .byte $FF ; |XXXXXXXX| $FC25
    .byte $FF ; |XXXXXXXX| $FC26
    .byte $FF ; |XXXXXXXX| $FC27
    .byte $FF ; |XXXXXXXX| $FC28
    .byte $F3 ; |XXXX  XX| $FC29
    .byte $BC ; |X XXXX  | $FC2A
    .byte $FF ; |XXXXXXXX| $FC2B
    .byte $7F ; | XXXXXXX| $FC2C
    .byte $FF ; |XXXXXXXX| $FC2D
    .byte $FF ; |XXXXXXXX| $FC2E
    .byte $FF ; |XXXXXXXX| $FC2F
    .byte $7F ; | XXXXXXX| $FC30
    .byte $1F ; |   XXXXX| $FC31
    .byte $07 ; |     XXX| $FC32
    .byte $03 ; |      XX| $FC33
    .byte $01 ; |       X| $FC34
    .byte $00 ; |        | $FC35
    .byte $00 ; |        | $FC36
    .byte $00 ; |        | $FC37
    .byte $00 ; |        | $FC38
    .byte $00 ; |        | $FC39
    .byte $00 ; |        | $FC3A
    .byte $00 ; |        | $FC3B
    .byte $00 ; |        | $FC3C
    .byte $00 ; |        | $FC3D
    .byte $00 ; |        | $FC3E
    .byte $00 ; |        | $FC3F
DoggyStyle4:
    .byte $EF ; |XXX XXXX| $FC40
    .byte $CF ; |XX  XXXX| $FC41
    .byte $DF ; |XX XXXXX| $FC42
    .byte $DF ; |XX XXXXX| $FC43
    .byte $DF ; |XX XXXXX| $FC44
    .byte $DF ; |XX XXXXX| $FC45
    .byte $DF ; |XX XXXXX| $FC46
    .byte $DF ; |XX XXXXX| $FC47
    .byte $EF ; |XXX XXXX| $FC48
    .byte $EF ; |XXX XXXX| $FC49
    .byte $EF ; |XXX XXXX| $FC4A
    .byte $F7 ; |XXXX XXX| $FC4B
    .byte $F7 ; |XXXX XXX| $FC4C
    .byte $F3 ; |XXXX  XX| $FC4D
    .byte $FB ; |XXXXX XX| $FC4E
    .byte $FD ; |XXXXXX X| $FC4F
    .byte $FD ; |XXXXXX X| $FC50
    .byte $FE ; |XXXXXXX | $FC51
    .byte $FF ; |XXXXXXXX| $FC52
    .byte $E3 ; |XXX   XX| $FC53
    .byte $F8 ; |XXXXX   | $FC54
    .byte $FF ; |XXXXXXXX| $FC55
    .byte $FF ; |XXXXXXXX| $FC56
    .byte $FF ; |XXXXXXXX| $FC57
    .byte $FF ; |XXXXXXXX| $FC58
    .byte $FF ; |XXXXXXXX| $FC59
    .byte $FF ; |XXXXXXXX| $FC5A
    .byte $FF ; |XXXXXXXX| $FC5B
    .byte $FF ; |XXXXXXXX| $FC5C
    .byte $FF ; |XXXXXXXX| $FC5D
    .byte $FF ; |XXXXXXXX| $FC5E
    .byte $00 ; |        | $FC5F
GirlOnTop4:
    .byte $00 ; |        | $FC60
    .byte $E0 ; |XXX     | $FC61
    .byte $FF ; |XXXXXXXX| $FC62
    .byte $3F ; |  XXXXXX| $FC63
    .byte $F3 ; |XXXX  XX| $FC64
    .byte $FF ; |XXXXXXXX| $FC65
    .byte $FF ; |XXXXXXXX| $FC66
    .byte $FF ; |XXXXXXXX| $FC67
    .byte $FF ; |XXXXXXXX| $FC68
    .byte $FF ; |XXXXXXXX| $FC69
    .byte $E3 ; |XXX   XX| $FC6A
    .byte $00 ; |        | $FC6B
    .byte $00 ; |        | $FC6C
    .byte $00 ; |        | $FC6D
    .byte $00 ; |        | $FC6E
    .byte $80 ; |X       | $FC6F
    .byte $C0 ; |XX      | $FC70
    .byte $C0 ; |XX      | $FC71
    .byte $E1 ; |XXX    X| $FC72
    .byte $F9 ; |XXXXX  X| $FC73
    .byte $FF ; |XXXXXXXX| $FC74
    .byte $FF ; |XXXXXXXX| $FC75
    .byte $FF ; |XXXXXXXX| $FC76
    .byte $FF ; |XXXXXXXX| $FC77
    .byte $FF ; |XXXXXXXX| $FC78
    .byte $FF ; |XXXXXXXX| $FC79
    .byte $FF ; |XXXXXXXX| $FC7A
    .byte $FF ; |XXXXXXXX| $FC7B
    .byte $FC ; |XXXXXX  | $FC7C
    .byte $F0 ; |XXXX    | $FC7D
    .byte $E0 ; |XXX     | $FC7E
    .byte $80 ; |X       | $FC7F
PlayLogoA_4:
    .byte $94 ; |X  X X  | $FC80
    .byte $94 ; |X  X X  | $FC81
    .byte $94 ; |X  X X  | $FC82
    .byte $94 ; |X  X X  | $FC83
    .byte $F6 ; |XXXX XX | $FC84
    .byte $F6 ; |XXXX XX | $FC85
    .byte $95 ; |X  X X X| $FC86
    .byte $95 ; |X  X X X| $FC87
    .byte $90 ; |X  X    | $FC88
    .byte $90 ; |X  X    | $FC89
    .byte $F0 ; |XXXX    | $FC8A
    .byte $F0 ; |XXXX    | $FC8B
    .byte $60 ; | XX     | $FC8C
    .byte $60 ; | XX     | $FC8D
    .byte $00 ; |        | $FC8E
    .byte $00 ; |        | $FC8F
PlayLogoB_4:
    .byte $94 ; |X  X X  | $FC90
    .byte $94 ; |X  X X  | $FC91
    .byte $94 ; |X  X X  | $FC92
    .byte $94 ; |X  X X  | $FC93
    .byte $F6 ; |XXXX XX | $FC94
    .byte $F6 ; |XXXX XX | $FC95
    .byte $95 ; |X  X X X| $FC96
    .byte $95 ; |X  X X X| $FC97
    .byte $90 ; |X  X    | $FC98
    .byte $90 ; |X  X    | $FC99
    .byte $F0 ; |XXXX    | $FC9A
    .byte $F0 ; |XXXX    | $FC9B
    .byte $60 ; | XX     | $FC9C
    .byte $60 ; | XX     | $FC9D
    .byte $00 ; |        | $FC9E
    .byte $00 ; |        | $FC9F
PlayLogoC_4:
    .byte $94 ; |X  X X  | $FCA0
    .byte $94 ; |X  X X  | $FCA1
    .byte $94 ; |X  X X  | $FCA2
    .byte $94 ; |X  X X  | $FCA3
    .byte $F6 ; |XXXX XX | $FCA4
    .byte $F6 ; |XXXX XX | $FCA5
    .byte $95 ; |X  X X X| $FCA6
    .byte $95 ; |X  X X X| $FCA7
    .byte $90 ; |X  X    | $FCA8
    .byte $90 ; |X  X    | $FCA9
    .byte $F0 ; |XXXX    | $FCAA
    .byte $F0 ; |XXXX    | $FCAB
    .byte $60 ; | XX     | $FCAC
    .byte $60 ; | XX     | $FCAD
    .byte $00 ; |        | $FCAE
    .byte $00 ; |        | $FCAF
PlayLogoD_4:
    .byte $94 ; |X  X X  | $FCB0
    .byte $94 ; |X  X X  | $FCB1
    .byte $94 ; |X  X X  | $FCB2
    .byte $94 ; |X  X X  | $FCB3
    .byte $F6 ; |XXXX XX | $FCB4
    .byte $F6 ; |XXXX XX | $FCB5
    .byte $95 ; |X  X X X| $FCB6
    .byte $95 ; |X  X X X| $FCB7
    .byte $90 ; |X  X    | $FCB8
    .byte $90 ; |X  X    | $FCB9
    .byte $F0 ; |XXXX    | $FCBA
    .byte $F0 ; |XXXX    | $FCBB
    .byte $60 ; | XX     | $FCBC
    .byte $60 ; | XX     | $FCBD
    .byte $00 ; |        | $FCBE
    .byte $00 ; |        | $FCBF

;possibly free bytes
    .byte $00 ; |        | $FCC0
    .byte $00 ; |        | $FCC1
    .byte $00 ; |        | $FCC2
    .byte $00 ; |        | $FCC3
    .byte $00 ; |        | $FCC4
    .byte $00 ; |        | $FCC5
    .byte $00 ; |        | $FCC6
    .byte $00 ; |        | $FCC7
    .byte $00 ; |        | $FCC8
    .byte $00 ; |        | $FCC9
    .byte $00 ; |        | $FCCA
    .byte $00 ; |        | $FCCB
    .byte $00 ; |        | $FCCC
    .byte $00 ; |        | $FCCD
    .byte $00 ; |        | $FCCE
    .byte $00 ; |        | $FCCF
    .byte $00 ; |        | $FCD0
    .byte $00 ; |        | $FCD1
    .byte $00 ; |        | $FCD2
    .byte $00 ; |        | $FCD3
    .byte $00 ; |        | $FCD4
    .byte $00 ; |        | $FCD5
    .byte $00 ; |        | $FCD6
    .byte $00 ; |        | $FCD7
    .byte $00 ; |        | $FCD8
    .byte $00 ; |        | $FCD9
    .byte $00 ; |        | $FCDA
    .byte $00 ; |        | $FCDB
    .byte $00 ; |        | $FCDC
    .byte $00 ; |        | $FCDD
    .byte $00 ; |        | $FCDE
    .byte $00 ; |        | $FCDF
MystiqueLogoFour:
    .byte $00 ; |        | $FCE0
    .byte $FF ; |XXXXXXXX| $FCE1
    .byte $FF ; |XXXXXXXX| $FCE2
    .byte $FF ; |XXXXXXXX| $FCE3
    .byte $FF ; |XXXXXXXX| $FCE4
    .byte $FF ; |XXXXXXXX| $FCE5
    .byte $FF ; |XXXXXXXX| $FCE6
    .byte $FF ; |XXXXXXXX| $FCE7
    .byte $FE ; |XXXXXXX | $FCE8
    .byte $DE ; |XX XXXX | $FCE9
    .byte $D8 ; |XX XX   | $FCEA
    .byte $DB ; |XX XX XX| $FCEB
    .byte $DB ; |XX XX XX| $FCEC
    .byte $DB ; |XX XX XX| $FCED
    .byte $FC ; |XXXXXX  | $FCEE
    .byte $DF ; |XX XXXXX| $FCEF
    .byte $FF ; |XXXXXXXX| $FCF0
    .byte $FF ; |XXXXXXXX| $FCF1
    .byte $3F ; |  XXXXXX| $FCF2
    .byte $FF ; |XXXXXXXX| $FCF3
    .byte $FF ; |XXXXXXXX| $FCF4
    .byte $FF ; |XXXXXXXX| $FCF5
    .byte $FF ; |XXXXXXXX| $FCF6
    .byte $FF ; |XXXXXXXX| $FCF7
    .byte $FF ; |XXXXXXXX| $FCF8
    .byte $FF ; |XXXXXXXX| $FCF9
    .byte $FF ; |XXXXXXXX| $FCFA
    .byte $FF ; |XXXXXXXX| $FCFB
    .byte $FF ; |XXXXXXXX| $FCFC
    .byte $FF ; |XXXXXXXX| $FCFD
    .byte $FF ; |XXXXXXXX| $FCFE
    .byte $00 ; |        | $FCFF
SixtyNine5:
    .byte $80 ; |X       | $FD00
    .byte $FC ; |XXXXXX  | $FD01
    .byte $FF ; |XXXXXXXX| $FD02
    .byte $FF ; |XXXXXXXX| $FD03
    .byte $FF ; |XXXXXXXX| $FD04
    .byte $FF ; |XXXXXXXX| $FD05
    .byte $BF ; |X XXXXXX| $FD06
    .byte $EA ; |XXX X X | $FD07
    .byte $FF ; |XXXXXXXX| $FD08
    .byte $EF ; |XXX XXXX| $FD09
    .byte $F7 ; |XXXX XXX| $FD0A
    .byte $FF ; |XXXXXXXX| $FD0B
    .byte $FB ; |XXXXX XX| $FD0C
    .byte $FD ; |XXXXXX X| $FD0D
    .byte $FE ; |XXXXXXX | $FD0E
    .byte $FF ; |XXXXXXXX| $FD0F
    .byte $FF ; |XXXXXXXX| $FD10
    .byte $7F ; | XXXXXXX| $FD11
    .byte $FF ; |XXXXXXXX| $FD12
    .byte $BF ; |X XXXXXX| $FD13
    .byte $9F ; |X  XXXXX| $FD14
    .byte $FF ; |XXXXXXXX| $FD15
    .byte $FF ; |XXXXXXXX| $FD16
    .byte $FF ; |XXXXXXXX| $FD17
    .byte $FF ; |XXXXXXXX| $FD18
    .byte $FF ; |XXXXXXXX| $FD19
    .byte $FF ; |XXXXXXXX| $FD1A
    .byte $FF ; |XXXXXXXX| $FD1B
    .byte $FF ; |XXXXXXXX| $FD1C
    .byte $FF ; |XXXXXXXX| $FD1D
    .byte $7F ; | XXXXXXX| $FD1E
    .byte $1F ; |   XXXXX| $FD1F
HuggingKissing5:
    .byte $00 ; |        | $FD20
    .byte $00 ; |        | $FD21
    .byte $00 ; |        | $FD22
    .byte $01 ; |       X| $FD23
    .byte $83 ; |X     XX| $FD24
    .byte $C7 ; |XX   XXX| $FD25
    .byte $FB ; |XXXXX XX| $FD26
    .byte $F7 ; |XXXX XXX| $FD27
    .byte $EF ; |XXX XXXX| $FD28
    .byte $FF ; |XXXXXXXX| $FD29
    .byte $DE ; |XX XXXX | $FD2A
    .byte $FF ; |XXXXXXXX| $FD2B
    .byte $BD ; |X XXXX X| $FD2C
    .byte $FF ; |XXXXXXXX| $FD2D
    .byte $7B ; | XXXX XX| $FD2E
    .byte $FF ; |XXXXXXXX| $FD2F
    .byte $F7 ; |XXXX XXX| $FD30
    .byte $FF ; |XXXXXXXX| $FD31
    .byte $EF ; |XXX XXXX| $FD32
    .byte $FF ; |XXXXXXXX| $FD33
    .byte $DF ; |XX XXXXX| $FD34
    .byte $7F ; | XXXXXXX| $FD35
    .byte $7D ; | XXXXX X| $FD36
    .byte $FF ; |XXXXXXXX| $FD37
    .byte $FB ; |XXXXX XX| $FD38
    .byte $FF ; |XXXXXXXX| $FD39
    .byte $F7 ; |XXXX XXX| $FD3A
    .byte $E7 ; |XXX  XXX| $FD3B
    .byte $47 ; | X   XXX| $FD3C
    .byte $03 ; |      XX| $FD3D
    .byte $03 ; |      XX| $FD3E
    .byte $01 ; |       X| $FD3F
DoggyStyle5:
    .byte $00 ; |        | $FD40
    .byte $FF ; |XXXXXXXX| $FD41
    .byte $FF ; |XXXXXXXX| $FD42
    .byte $FF ; |XXXXXXXX| $FD43
    .byte $FF ; |XXXXXXXX| $FD44
    .byte $FF ; |XXXXXXXX| $FD45
    .byte $9F ; |X  XXXXX| $FD46
    .byte $80 ; |X       | $FD47
    .byte $E0 ; |XXX     | $FD48
    .byte $E0 ; |XXX     | $FD49
    .byte $F0 ; |XXXX    | $FD4A
    .byte $F8 ; |XXXXX   | $FD4B
    .byte $F8 ; |XXXXX   | $FD4C
    .byte $FC ; |XXXXXX  | $FD4D
    .byte $FE ; |XXXXXXX | $FD4E
    .byte $FF ; |XXXXXXXX| $FD4F
    .byte $FF ; |XXXXXXXX| $FD50
    .byte $FF ; |XXXXXXXX| $FD51
    .byte $7F ; | XXXXXXX| $FD52
    .byte $BF ; |X XXXXXX| $FD53
    .byte $7F ; | XXXXXXX| $FD54
    .byte $FF ; |XXXXXXXX| $FD55
    .byte $FF ; |XXXXXXXX| $FD56
    .byte $FF ; |XXXXXXXX| $FD57
    .byte $FF ; |XXXXXXXX| $FD58
    .byte $FF ; |XXXXXXXX| $FD59
    .byte $FF ; |XXXXXXXX| $FD5A
    .byte $FF ; |XXXXXXXX| $FD5B
    .byte $FF ; |XXXXXXXX| $FD5C
    .byte $FF ; |XXXXXXXX| $FD5D
    .byte $FF ; |XXXXXXXX| $FD5E
    .byte $FF ; |XXXXXXXX| $FD5F
GirlOnTop5:
    .byte $07 ; |     XXX| $FD60
    .byte $3F ; |  XXXXXX| $FD61
    .byte $CF ; |XX  XXXX| $FD62
    .byte $FC ; |XXXXXX  | $FD63
    .byte $FF ; |XXXXXXXX| $FD64
    .byte $3F ; |  XXXXXX| $FD65
    .byte $E7 ; |XXX  XXX| $FD66
    .byte $FF ; |XXXXXXXX| $FD67
    .byte $FF ; |XXXXXXXX| $FD68
    .byte $FE ; |XXXXXXX | $FD69
    .byte $FF ; |XXXXXXXX| $FD6A
    .byte $3F ; |  XXXXXX| $FD6B
    .byte $03 ; |      XX| $FD6C
    .byte $03 ; |      XX| $FD6D
    .byte $23 ; |  X   XX| $FD6E
    .byte $73 ; | XXX  XX| $FD6F
    .byte $FB ; |XXXXX XX| $FD70
    .byte $FF ; |XXXXXXXX| $FD71
    .byte $FF ; |XXXXXXXX| $FD72
    .byte $FF ; |XXXXXXXX| $FD73
    .byte $FF ; |XXXXXXXX| $FD74
    .byte $FF ; |XXXXXXXX| $FD75
    .byte $FF ; |XXXXXXXX| $FD76
    .byte $FF ; |XXXXXXXX| $FD77
    .byte $FF ; |XXXXXXXX| $FD78
    .byte $FF ; |XXXXXXXX| $FD79
    .byte $FF ; |XXXXXXXX| $FD7A
    .byte $FF ; |XXXXXXXX| $FD7B
    .byte $3F ; |  XXXXXX| $FD7C
    .byte $0F ; |    XXXX| $FD7D
    .byte $00 ; |        | $FD7E
    .byte $00 ; |        | $FD7F
PlayLogoA_5:
    .byte $23 ; |  X   XX| $FD80
    .byte $23 ; |  X   XX| $FD81
    .byte $55 ; | X X X X| $FD82
    .byte $55 ; | X X X X| $FD83
    .byte $55 ; | X X X X| $FD84
    .byte $55 ; | X X X X| $FD85
    .byte $25 ; |  X  X X| $FD86
    .byte $25 ; |  X  X X| $FD87
    .byte $00 ; |        | $FD88
    .byte $00 ; |        | $FD89
    .byte $00 ; |        | $FD8A
    .byte $00 ; |        | $FD8B
    .byte $00 ; |        | $FD8C
    .byte $00 ; |        | $FD8D
    .byte $00 ; |        | $FD8E
    .byte $00 ; |        | $FD8F
PlayLogoB_5:
    .byte $23 ; |  X   XX| $FD90
    .byte $23 ; |  X   XX| $FD91
    .byte $55 ; | X X X X| $FD92
    .byte $55 ; | X X X X| $FD93
    .byte $55 ; | X X X X| $FD94
    .byte $55 ; | X X X X| $FD95
    .byte $25 ; |  X  X X| $FD96
    .byte $25 ; |  X  X X| $FD97
    .byte $00 ; |        | $FD98
    .byte $00 ; |        | $FD99
    .byte $00 ; |        | $FD9A
    .byte $00 ; |        | $FD9B
    .byte $00 ; |        | $FD9C
    .byte $00 ; |        | $FD9D
    .byte $00 ; |        | $FD9E
    .byte $00 ; |        | $FD9F
PlayLogoC_5:
    .byte $23 ; |  X   XX| $FDA0
    .byte $23 ; |  X   XX| $FDA1
    .byte $55 ; | X X X X| $FDA2
    .byte $55 ; | X X X X| $FDA3
    .byte $55 ; | X X X X| $FDA4
    .byte $55 ; | X X X X| $FDA5
    .byte $25 ; |  X  X X| $FDA6
    .byte $25 ; |  X  X X| $FDA7
    .byte $00 ; |        | $FDA8
    .byte $00 ; |        | $FDA9
    .byte $00 ; |        | $FDAA
    .byte $00 ; |        | $FDAB
    .byte $00 ; |        | $FDAC
    .byte $00 ; |        | $FDAD
    .byte $00 ; |        | $FDAE
    .byte $00 ; |        | $FDAF
PlayLogoD_5:
    .byte $23 ; |  X   XX| $FDB0
    .byte $23 ; |  X   XX| $FDB1
    .byte $55 ; | X X X X| $FDB2
    .byte $55 ; | X X X X| $FDB3
    .byte $55 ; | X X X X| $FDB4
    .byte $55 ; | X X X X| $FDB5
    .byte $25 ; |  X  X X| $FDB6
    .byte $25 ; |  X  X X| $FDB7
    .byte $00 ; |        | $FDB8
    .byte $00 ; |        | $FDB9
    .byte $00 ; |        | $FDBA
    .byte $00 ; |        | $FDBB
    .byte $00 ; |        | $FDBC
    .byte $00 ; |        | $FDBD
    .byte $00 ; |        | $FDBE
    .byte $00 ; |        | $FDBF

;possibly free bytes
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
MystiqueLogoFive:
    .byte $00 ; |        | $FDE0
    .byte $FF ; |XXXXXXXX| $FDE1
    .byte $FF ; |XXXXXXXX| $FDE2
    .byte $FF ; |XXXXXXXX| $FDE3
    .byte $FF ; |XXXXXXXX| $FDE4
    .byte $87 ; |X    XXX| $FDE5
    .byte $7F ; | XXXXXXX| $FDE6
    .byte $7F ; | XXXXXXX| $FDE7
    .byte $FF ; |XXXXXXXX| $FDE8
    .byte $F3 ; |XXXX  XX| $FDE9
    .byte $ED ; |XXX XX X| $FDEA
    .byte $6D ; | XX XX X| $FDEB
    .byte $6D ; | XX XX X| $FDEC
    .byte $6D ; | XX XX X| $FDED
    .byte $6D ; | XX XX X| $FDEE
    .byte $FF ; |XXXXXXXX| $FDEF
    .byte $FF ; |XXXXXXXX| $FDF0
    .byte $FF ; |XXXXXXXX| $FDF1
    .byte $FF ; |XXXXXXXX| $FDF2
    .byte $FF ; |XXXXXXXX| $FDF3
    .byte $FF ; |XXXXXXXX| $FDF4
    .byte $FF ; |XXXXXXXX| $FDF5
    .byte $FF ; |XXXXXXXX| $FDF6
    .byte $FF ; |XXXXXXXX| $FDF7
    .byte $FF ; |XXXXXXXX| $FDF8
    .byte $FF ; |XXXXXXXX| $FDF9
    .byte $FF ; |XXXXXXXX| $FDFA
    .byte $FF ; |XXXXXXXX| $FDFB
    .byte $FF ; |XXXXXXXX| $FDFC
    .byte $FF ; |XXXXXXXX| $FDFD
    .byte $FF ; |XXXXXXXX| $FDFE
    .byte $00 ; |        | $FDFF
SixtyNine6:
    .byte $03 ; |      XX| $FE00
    .byte $0F ; |    XXXX| $FE01
    .byte $FE ; |XXXXXXX | $FE02
    .byte $FE ; |XXXXXXX | $FE03
    .byte $FC ; |XXXXXX  | $FE04
    .byte $FC ; |XXXXXX  | $FE05
    .byte $4C ; | X  XX  | $FE06
    .byte $E0 ; |XXX     | $FE07
    .byte $E0 ; |XXX     | $FE08
    .byte $E0 ; |XXX     | $FE09
    .byte $E0 ; |XXX     | $FE0A
    .byte $C0 ; |XX      | $FE0B
    .byte $C0 ; |XX      | $FE0C
    .byte $C0 ; |XX      | $FE0D
    .byte $80 ; |X       | $FE0E
    .byte $00 ; |        | $FE0F
    .byte $00 ; |        | $FE10
    .byte $80 ; |X       | $FE11
    .byte $80 ; |X       | $FE12
    .byte $C0 ; |XX      | $FE13
    .byte $C0 ; |XX      | $FE14
    .byte $E0 ; |XXX     | $FE15
    .byte $E0 ; |XXX     | $FE16
    .byte $F0 ; |XXXX    | $FE17
    .byte $F0 ; |XXXX    | $FE18
    .byte $F0 ; |XXXX    | $FE19
    .byte $F0 ; |XXXX    | $FE1A
    .byte $E0 ; |XXX     | $FE1B
    .byte $E0 ; |XXX     | $FE1C
    .byte $C0 ; |XX      | $FE1D
    .byte $C0 ; |XX      | $FE1E
    .byte $80 ; |X       | $FE1F
HuggingKissing6:
    .byte $00 ; |        | $FE20
    .byte $00 ; |        | $FE21
    .byte $80 ; |X       | $FE22
    .byte $C0 ; |XX      | $FE23
    .byte $C0 ; |XX      | $FE24
    .byte $C0 ; |XX      | $FE25
    .byte $F4 ; |XXXX X  | $FE26
    .byte $FC ; |XXXXXX  | $FE27
    .byte $7E ; | XXXXXX | $FE28
    .byte $FF ; |XXXXXXXX| $FE29
    .byte $FF ; |XXXXXXXX| $FE2A
    .byte $FF ; |XXXXXXXX| $FE2B
    .byte $EF ; |XXX XXXX| $FE2C
    .byte $FF ; |XXXXXXXX| $FE2D
    .byte $DF ; |XX XXXXX| $FE2E
    .byte $FE ; |XXXXXXX | $FE2F
    .byte $BE ; |X XXXXX | $FE30
    .byte $FE ; |XXXXXXX | $FE31
    .byte $74 ; | XXX X  | $FE32
    .byte $F0 ; |XXXX    | $FE33
    .byte $F0 ; |XXXX    | $FE34
    .byte $F8 ; |XXXXX   | $FE35
    .byte $F8 ; |XXXXX   | $FE36
    .byte $FC ; |XXXXXX  | $FE37
    .byte $FC ; |XXXXXX  | $FE38
    .byte $FC ; |XXXXXX  | $FE39
    .byte $FC ; |XXXXXX  | $FE3A
    .byte $F8 ; |XXXXX   | $FE3B
    .byte $F8 ; |XXXXX   | $FE3C
    .byte $F0 ; |XXXX    | $FE3D
    .byte $E0 ; |XXX     | $FE3E
    .byte $E0 ; |XXX     | $FE3F
DoggyStyle6:
    .byte $01 ; |       X| $FE40
    .byte $07 ; |     XXX| $FE41
    .byte $FE ; |XXXXXXX | $FE42
    .byte $FE ; |XXXXXXX | $FE43
    .byte $FC ; |XXXXXX  | $FE44
    .byte $FC ; |XXXXXX  | $FE45
    .byte $CC ; |XX  XX  | $FE46
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
    .byte $80 ; |X       | $FE51
    .byte $80 ; |X       | $FE52
    .byte $C0 ; |XX      | $FE53
    .byte $C0 ; |XX      | $FE54
    .byte $E0 ; |XXX     | $FE55
    .byte $E0 ; |XXX     | $FE56
    .byte $E0 ; |XXX     | $FE57
    .byte $E0 ; |XXX     | $FE58
    .byte $E0 ; |XXX     | $FE59
    .byte $E0 ; |XXX     | $FE5A
    .byte $E0 ; |XXX     | $FE5B
    .byte $E0 ; |XXX     | $FE5C
    .byte $C0 ; |XX      | $FE5D
    .byte $C0 ; |XX      | $FE5E
    .byte $00 ; |        | $FE5F
GirlOnTop6:
    .byte $8F ; |X   XXXX| $FE60
    .byte $FF ; |XXXXXXXX| $FE61
    .byte $EE ; |XXX XXX | $FE62
    .byte $FE ; |XXXXXXX | $FE63
    .byte $FC ; |XXXXXX  | $FE64
    .byte $B4 ; |X XX X  | $FE65
    .byte $FE ; |XXXXXXX | $FE66
    .byte $7E ; | XXXXXX | $FE67
    .byte $EF ; |XXX XXXX| $FE68
    .byte $FF ; |XXXXXXXX| $FE69
    .byte $DF ; |XX XXXXX| $FE6A
    .byte $FF ; |XXXXXXXX| $FE6B
    .byte $FF ; |XXXXXXXX| $FE6C
    .byte $FE ; |XXXXXXX | $FE6D
    .byte $DC ; |XX XXX  | $FE6E
    .byte $C0 ; |XX      | $FE6F
    .byte $C0 ; |XX      | $FE70
    .byte $C0 ; |XX      | $FE71
    .byte $C0 ; |XX      | $FE72
    .byte $E0 ; |XXX     | $FE73
    .byte $F8 ; |XXXXX   | $FE74
    .byte $FC ; |XXXXXX  | $FE75
    .byte $FE ; |XXXXXXX | $FE76
    .byte $FF ; |XXXXXXXX| $FE77
    .byte $FF ; |XXXXXXXX| $FE78
    .byte $FF ; |XXXXXXXX| $FE79
    .byte $FF ; |XXXXXXXX| $FE7A
    .byte $FF ; |XXXXXXXX| $FE7B
    .byte $FE ; |XXXXXXX | $FE7C
    .byte $FE ; |XXXXXXX | $FE7D
    .byte $FC ; |XXXXXX  | $FE7E
    .byte $70 ; | XXX    | $FE7F
PlayLogoA_6:
    .byte $53 ; | X X  XX| $FE80
    .byte $53 ; | X X  XX| $FE81
    .byte $55 ; | X X X X| $FE82
    .byte $55 ; | X X X X| $FE83
    .byte $55 ; | X X X X| $FE84
    .byte $55 ; | X X X X| $FE85
    .byte $63 ; | XX   XX| $FE86
    .byte $63 ; | XX   XX| $FE87
    .byte $01 ; |       X| $FE88
    .byte $01 ; |       X| $FE89
    .byte $01 ; |       X| $FE8A
    .byte $01 ; |       X| $FE8B
    .byte $01 ; |       X| $FE8C
    .byte $01 ; |       X| $FE8D
    .byte $00 ; |        | $FE8E
    .byte $00 ; |        | $FE8F
PlayLogoB_6:
    .byte $53 ; | X X  XX| $FE90
    .byte $53 ; | X X  XX| $FE91
    .byte $55 ; | X X X X| $FE92
    .byte $55 ; | X X X X| $FE93
    .byte $55 ; | X X X X| $FE94
    .byte $55 ; | X X X X| $FE95
    .byte $63 ; | XX   XX| $FE96
    .byte $63 ; | XX   XX| $FE97
    .byte $01 ; |       X| $FE98
    .byte $01 ; |       X| $FE99
    .byte $01 ; |       X| $FE9A
    .byte $01 ; |       X| $FE9B
    .byte $01 ; |       X| $FE9C
    .byte $01 ; |       X| $FE9D
    .byte $00 ; |        | $FE9E
    .byte $00 ; |        | $FE9F
PlayLogoC_6:
    .byte $53 ; | X X  XX| $FEA0
    .byte $53 ; | X X  XX| $FEA1
    .byte $55 ; | X X X X| $FEA2
    .byte $55 ; | X X X X| $FEA3
    .byte $55 ; | X X X X| $FEA4
    .byte $55 ; | X X X X| $FEA5
    .byte $63 ; | XX   XX| $FEA6
    .byte $63 ; | XX   XX| $FEA7
    .byte $01 ; |       X| $FEA8
    .byte $01 ; |       X| $FEA9
    .byte $01 ; |       X| $FEAA
    .byte $01 ; |       X| $FEAB
    .byte $01 ; |       X| $FEAC
    .byte $01 ; |       X| $FEAD
    .byte $00 ; |        | $FEAE
    .byte $00 ; |        | $FEAF
PlayLogoD_6:
    .byte $53 ; | X X  XX| $FEB0
    .byte $53 ; | X X  XX| $FEB1
    .byte $55 ; | X X X X| $FEB2
    .byte $55 ; | X X X X| $FEB3
    .byte $55 ; | X X X X| $FEB4
    .byte $55 ; | X X X X| $FEB5
    .byte $63 ; | XX   XX| $FEB6
    .byte $63 ; | XX   XX| $FEB7
    .byte $01 ; |       X| $FEB8
    .byte $01 ; |       X| $FEB9
    .byte $01 ; |       X| $FEBA
    .byte $01 ; |       X| $FEBB
    .byte $01 ; |       X| $FEBC
    .byte $01 ; |       X| $FEBD
    .byte $00 ; |        | $FEBE
    .byte $00 ; |        | $FEBF

;possibly free bytes
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
MystiqueLogoSix:
    .byte $00 ; |        | $FEE0
    .byte $FE ; |XXXXXXX | $FEE1
    .byte $FE ; |XXXXXXX | $FEE2
    .byte $FE ; |XXXXXXX | $FEE3
    .byte $FE ; |XXXXXXX | $FEE4
    .byte $FE ; |XXXXXXX | $FEE5
    .byte $FE ; |XXXXXXX | $FEE6
    .byte $FE ; |XXXXXXX | $FEE7
    .byte $FE ; |XXXXXXX | $FEE8
    .byte $CE ; |XX  XXX | $FEE9
    .byte $BE ; |X XXXXX | $FEEA
    .byte $BE ; |X XXXXX | $FEEB
    .byte $86 ; |X    XX | $FEEC
    .byte $B6 ; |X XX XX | $FEED
    .byte $CE ; |XX  XXX | $FEEE
    .byte $FE ; |XXXXXXX | $FEEF
    .byte $FE ; |XXXXXXX | $FEF0
    .byte $FE ; |XXXXXXX | $FEF1
    .byte $FE ; |XXXXXXX | $FEF2
    .byte $FE ; |XXXXXXX | $FEF3
    .byte $FE ; |XXXXXXX | $FEF4
    .byte $FE ; |XXXXXXX | $FEF5
    .byte $FE ; |XXXXXXX | $FEF6
    .byte $FE ; |XXXXXXX | $FEF7
    .byte $FE ; |XXXXXXX | $FEF8
    .byte $FE ; |XXXXXXX | $FEF9
    .byte $FE ; |XXXXXXX | $FEFA
    .byte $FE ; |XXXXXXX | $FEFB
    .byte $FE ; |XXXXXXX | $FEFC
    .byte $FE ; |XXXXXXX | $FEFD
    .byte $FE ; |XXXXXXX | $FEFE
    .byte $00 ; |        | $FEFF

LFF00:
    .byte $00 ; |        | $FF00
    .byte $00 ; |        | $FF01
    .byte $00 ; |        | $FF02
    .byte $00 ; |        | $FF03
    .byte $6C ; | XX XX  | $FF04
    .byte $40 ; | X      | $FF05
    .byte $FE ; |XXXXXXX | $FF06
    .byte $E0 ; |XXX     | $FF07
    .byte $F7 ; |XXXX XXX| $FF08
    .byte $F0 ; |XXXX    | $FF09
    .byte $FE ; |XXXXXXX | $FF0A
    .byte $E0 ; |XXX     | $FF0B
    .byte $FD ; |XXXXXX X| $FF0C
    .byte $E0 ; |XXX     | $FF0D
    .byte $FB ; |XXXXX XX| $FF0E
    .byte $C0 ; |XX      | $FF0F
    .byte $FF ; |XXXXXXXX| $FF10
    .byte $C0 ; |XX      | $FF11
    .byte $7F ; | XXXXXXX| $FF12
    .byte $80 ; |X       | $FF13
    .byte $3E ; |  XXXXX | $FF14
    .byte $00 ; |        | $FF15
    .byte $00 ; |        | $FF16
    .byte $00 ; |        | $FF17
    .byte $27 ; |  X  XXX| $FF18
    .byte $08 ; |    X   | $FF19
    .byte $06 ; |     XX | $FF1A
    .byte $03 ; |      XX| $FF1B
    .byte $00 ; |        | $FF1C
    .byte $00 ; |        | $FF1D
    .byte $00 ; |        | $FF1E
    .byte $00 ; |        | $FF1F
    .byte $6C ; | XX XX  | $FF20
    .byte $00 ; |        | $FF21
    .byte $FE ; |XXXXXXX | $FF22
    .byte $30 ; |  XX    | $FF23
    .byte $F6 ; |XXXX XX | $FF24
    .byte $F0 ; |XXXX    | $FF25
    .byte $FE ; |XXXXXXX | $FF26
    .byte $78 ; | XXXX   | $FF27
    .byte $FC ; |XXXXXX  | $FF28
    .byte $E0 ; |XXX     | $FF29
    .byte $F9 ; |XXXXX  X| $FF2A
    .byte $C0 ; |XX      | $FF2B
    .byte $FF ; |XXXXXXXX| $FF2C
    .byte $C0 ; |XX      | $FF2D
    .byte $7F ; | XXXXXXX| $FF2E
    .byte $80 ; |X       | $FF2F
    .byte $3E ; |  XXXXX | $FF30
    .byte $00 ; |        | $FF31
    .byte $00 ; |        | $FF32
    .byte $00 ; |        | $FF33
    .byte $3C ; |  XXXX  | $FF34
    .byte $0C ; |    XX  | $FF35
    .byte $09 ; |    X  X| $FF36
    .byte $04 ; |     X  | $FF37
    .byte $00 ; |        | $FF38
    .byte $00 ; |        | $FF39
    .byte $00 ; |        | $FF3A
    .byte $00 ; |        | $FF3B
    .byte $6C ; | XX XX  | $FF3C
    .byte $00 ; |        | $FF3D
    .byte $FE ; |XXXXXXX | $FF3E
    .byte $00 ; |        | $FF3F
    .byte $F6 ; |XXXX XX | $FF40
    .byte $00 ; |        | $FF41
    .byte $FE ; |XXXXXXX | $FF42
    .byte $00 ; |        | $FF43
    .byte $FD ; |XXXXXX X| $FF44
    .byte $10 ; |   X    | $FF45
    .byte $FB ; |XXXXX XX| $FF46
    .byte $F8 ; |XXXXX   | $FF47
    .byte $FF ; |XXXXXXXX| $FF48
    .byte $FC ; |XXXXXX  | $FF49
    .byte $7F ; | XXXXXXX| $FF4A
    .byte $F8 ; |XXXXX   | $FF4B
    .byte $3E ; |  XXXXX | $FF4C
    .byte $10 ; |   X    | $FF4D
    .byte $00 ; |        | $FF4E
    .byte $00 ; |        | $FF4F
    .byte $71 ; | XXX   X| $FF50
    .byte $0F ; |    XXXX| $FF51
    .byte $03 ; |      XX| $FF52
    .byte $01 ; |       X| $FF53
    .byte $00 ; |        | $FF54
    .byte $00 ; |        | $FF55
    .byte $00 ; |        | $FF56
    .byte $00 ; |        | $FF57
    .byte $6C ; | XX XX  | $FF58
    .byte $00 ; |        | $FF59
    .byte $FE ; |XXXXXXX | $FF5A
    .byte $00 ; |        | $FF5B
    .byte $F6 ; |XXXX XX | $FF5C
    .byte $00 ; |        | $FF5D
    .byte $FE ; |XXXXXXX | $FF5E
    .byte $00 ; |        | $FF5F
    .byte $FC ; |XXXXXX  | $FF60
    .byte $00 ; |        | $FF61
    .byte $F8 ; |XXXXX   | $FF62
    .byte $04 ; |     X  | $FF63
    .byte $FF ; |XXXXXXXX| $FF64
    .byte $FE ; |XXXXXXX | $FF65
    .byte $7F ; | XXXXXXX| $FF66
    .byte $FF ; |XXXXXXXX| $FF67
    .byte $3F ; |  XXXXXX| $FF68
    .byte $FE ; |XXXXXXX | $FF69
    .byte $00 ; |        | $FF6A
    .byte $04 ; |     X  | $FF6B
    .byte $F0 ; |XXXX    | $FF6C
    .byte $10 ; |   X    | $FF6D
    .byte $02 ; |      X | $FF6E
    .byte $00 ; |        | $FF6F
LFF70:
    .byte $CC ; |XX  XX  | $FF70
    .byte $1C ; |   XXX  | $FF71   yellow
    .byte $4C ; | X  XX  | $FF72
    .byte $6C ; | XX XX  | $FF73
    .byte $2A ; |  X X X | $FF74
    .byte $55 ; | X X X X| $FF75
    .byte $9A ; |X  XX X | $FF76
    .byte $EA ; |XXX X X | $FF77
    .byte $00 ; |        | $FF78
    .byte $00 ; |        | $FF79
    .byte $00 ; |        | $FF7A
    .byte $00 ; |        | $FF7B
    .byte $00 ; |        | $FF7C
    .byte $00 ; |        | $FF7D
    .byte $00 ; |        | $FF7E
    .byte $00 ; |        | $FF7F
    .byte $00 ; |        | $FF80
    .byte $00 ; |        | $FF81
    .byte $00 ; |        | $FF82
    .byte $00 ; |        | $FF83
    .byte $6C ; | XX XX  | $FF84
    .byte $40 ; | X      | $FF85
    .byte $0E ; |    XXX | $FF86
    .byte $E0 ; |XXX     | $FF87
    .byte $07 ; |     XXX| $FF88
    .byte $F0 ; |XXXX    | $FF89
    .byte $0E ; |    XXX | $FF8A
    .byte $E0 ; |XXX     | $FF8B
    .byte $0D ; |    XX X| $FF8C
    .byte $E0 ; |XXX     | $FF8D
    .byte $0B ; |    X XX| $FF8E
    .byte $C0 ; |XX      | $FF8F
    .byte $0F ; |    XXXX| $FF90
    .byte $C0 ; |XX      | $FF91
    .byte $0F ; |    XXXX| $FF92
    .byte $80 ; |X       | $FF93
    .byte $0E ; |    XXX | $FF94
    .byte $00 ; |        | $FF95
    .byte $00 ; |        | $FF96
    .byte $00 ; |        | $FF97
    .byte $27 ; |  X  XXX| $FF98
    .byte $08 ; |    X   | $FF99
    .byte $06 ; |     XX | $FF9A
    .byte $03 ; |      XX| $FF9B
    .byte $00 ; |        | $FF9C
    .byte $00 ; |        | $FF9D
    .byte $00 ; |        | $FF9E
    .byte $00 ; |        | $FF9F
    .byte $6C ; | XX XX  | $FFA0
    .byte $00 ; |        | $FFA1
    .byte $FE ; |XXXXXXX | $FFA2
    .byte $30 ; |  XX    | $FFA3
    .byte $F6 ; |XXXX XX | $FFA4
    .byte $F0 ; |XXXX    | $FFA5
    .byte $FE ; |XXXXXXX | $FFA6
    .byte $78 ; | XXXX   | $FFA7
    .byte $FC ; |XXXXXX  | $FFA8
    .byte $E0 ; |XXX     | $FFA9
    .byte $F9 ; |XXXXX  X| $FFAA
    .byte $C0 ; |XX      | $FFAB
    .byte $FF ; |XXXXXXXX| $FFAC
    .byte $C0 ; |XX      | $FFAD
    .byte $7F ; | XXXXXXX| $FFAE
    .byte $80 ; |X       | $FFAF
    .byte $3E ; |  XXXXX | $FFB0
    .byte $00 ; |        | $FFB1
    .byte $00 ; |        | $FFB2
    .byte $00 ; |        | $FFB3
    .byte $3C ; |  XXXX  | $FFB4
    .byte $0C ; |    XX  | $FFB5
    .byte $09 ; |    X  X| $FFB6
    .byte $04 ; |     X  | $FFB7
    .byte $00 ; |        | $FFB8
    .byte $00 ; |        | $FFB9
    .byte $00 ; |        | $FFBA
    .byte $00 ; |        | $FFBB
    .byte $6C ; | XX XX  | $FFBC
    .byte $00 ; |        | $FFBD
    .byte $FE ; |XXXXXXX | $FFBE
    .byte $00 ; |        | $FFBF
    .byte $F6 ; |XXXX XX | $FFC0
    .byte $00 ; |        | $FFC1
    .byte $FE ; |XXXXXXX | $FFC2
    .byte $00 ; |        | $FFC3
    .byte $FD ; |XXXXXX X| $FFC4
    .byte $10 ; |   X    | $FFC5
    .byte $FB ; |XXXXX XX| $FFC6
    .byte $F8 ; |XXXXX   | $FFC7
    .byte $FF ; |XXXXXXXX| $FFC8
    .byte $FC ; |XXXXXX  | $FFC9
    .byte $7F ; | XXXXXXX| $FFCA
    .byte $F8 ; |XXXXX   | $FFCB
    .byte $3E ; |  XXXXX | $FFCC
    .byte $10 ; |   X    | $FFCD
    .byte $00 ; |        | $FFCE
    .byte $00 ; |        | $FFCF
    .byte $71 ; | XXX   X| $FFD0
    .byte $0F ; |    XXXX| $FFD1
    .byte $03 ; |      XX| $FFD2
    .byte $01 ; |       X| $FFD3
    .byte $00 ; |        | $FFD4
    .byte $00 ; |        | $FFD5
    .byte $00 ; |        | $FFD6
    .byte $00 ; |        | $FFD7
    .byte $6C ; | XX XX  | $FFD8
    .byte $00 ; |        | $FFD9
    .byte $FE ; |XXXXXXX | $FFDA
    .byte $00 ; |        | $FFDB
    .byte $F6 ; |XXXX XX | $FFDC
    .byte $00 ; |        | $FFDD
    .byte $FE ; |XXXXXXX | $FFDE
    .byte $00 ; |        | $FFDF
    .byte $FC ; |XXXXXX  | $FFE0
    .byte $00 ; |        | $FFE1
    .byte $F8 ; |XXXXX   | $FFE2
    .byte $04 ; |     X  | $FFE3
    .byte $FF ; |XXXXXXXX| $FFE4
    .byte $FE ; |XXXXXXX | $FFE5
    .byte $7F ; | XXXXXXX| $FFE6
    .byte $FF ; |XXXXXXXX| $FFE7
    .byte $3F ; |  XXXXXX| $FFE8
    .byte $FE ; |XXXXXXX | $FFE9
    .byte $00 ; |        | $FFEA
    .byte $04 ; |     X  | $FFEB
    .byte $F0 ; |XXXX    | $FFEC
    .byte $10 ; |   X    | $FFED
    .byte $02 ; |      X | $FFEE
    .byte $00 ; |        | $FFEF
LFFF0:
    .byte $1F ; |   XXXXX| $FFF0
    .byte $1F ; |   XXXXX| $FFF1
    .byte $1F ; |   XXXXX| $FFF2
    .byte $1F ; |   XXXXX| $FFF3
    .byte $0F ; |    XXXX| $FFF4
    .byte $0F ; |    XXXX| $FFF5
    .byte $0F ; |    XXXX| $FFF6
    .byte $0F ; |    XXXX| $FFF7
    .byte $07 ; |     XXX| $FFF8
    .byte $00 ; |        | $FFF9

       ORG $FFFA

    .word START,START,START
