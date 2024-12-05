; Disassembly of Space Raid (aka Galatic, aka Challenge of Nexar) King Tripod Enterprise Co
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: distella -pasfcSRkt.cfg SRkt.bin > SpaceRaid(re).asm
;
; SRkt.cfg contents:
;
;      ORG F000
;      CODE F000 FA77
;      GFX FA78 FFFF

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
RESM0   =  $12
AUDC0   =  $15
AUDC1   =  $16
AUDF0   =  $17
AUDF1   =  $18
AUDV0   =  $19
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
HMP0    =  $20
HMP1    =  $21
HMM0    =  $22
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXM0P   =  $30
CXPPMM  =  $37
INPT4   =  $3C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM1T   =  $0294
TIM8T   =  $0295
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SWITCHES
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; only one on at a time!
; 0 = off, 1 = on

SUNTEK       = 0
KING_TRIPOD  = 1



  IF SUNTEK
UNK_01       = 6
UNK_02       = 6

  ELSE KING_TRIPOD
UNK_01       = 5
UNK_02       = 7

  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $F000

START:
    sei                          ; 2
    cld                          ; 2
    lda    #$FF                  ; 2
    sta    TIM1T                 ; 4
    sta    WSYNC                 ; 3
    ldy    INTIM                 ; 4
    lda    #0                    ; 2
    tax                          ; 2
LF00F:
    sta    0,X                   ; 4
    inx                          ; 2
    bne    LF00F                 ; 2³

    dex                          ; 2
    stx    $F5                   ; 3
    stx    $B5                   ; 3
    sty    $E4                   ; 3
    lda    SWCHB                 ; 4
    and    #$08                  ; 2
    sta    $FE                   ; 3
    lda    #$99                  ; 2
    sta    $BE                   ; 3
    dex                          ; 2
    stx    $A1                   ; 3
    stx    $81                   ; 3
    lda    #1                    ; 2
    sta    CTRLPF                ; 3
    sta    $C2                   ; 3
    sta    $CE                   ; 3
    sta    $CF                   ; 3
    sta    $B2                   ; 3
    lda    #$81                  ; 2
    sta    $FD                   ; 3
LF03B:
    ldx    #$2A                  ; 2
    lda    #2                    ; 2
    sta    WSYNC                 ; 3
    sta    VBLANK                ; 3
    sta    VSYNC                 ; 3
    stx    TIM8T                 ; 4
    ldx    #$4B                  ; 2
LF04A:
    lda    INTIM                 ; 4
    bne    LF04A                 ; 2³
    sta    WSYNC                 ; 3
    sta    VSYNC                 ; 3
    stx    TIM64T                ; 4
    lda    SWCHB                 ; 4
    and    #$08                  ; 2
    cmp    $FE                   ; 3
    beq    LF072                 ; 2³
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    sta    $B0                   ; 3
    lda    $E5                   ; 3
    ora    #$01                  ; 2
    sta    $CC                   ; 3
    inc    $E5                   ; 5
    jmp    LF5B8                 ; 3
LF072:
    lda    #0                    ; 2
    sta    $CC                   ; 3
    lda    $FD                   ; 3
    bmi    LF0AB                 ; 2³
    lda    $C7                   ; 3
    cmp    #$D0                  ; 2
    beq    LF084                 ; 2³
    lda    $FD                   ; 3
    beq    LF088                 ; 2³
LF084:
    lda    INPT4                 ; 3
    bpl    LF091                 ; 2³
LF088:
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcc    LF091                 ; 2³
    jmp    LF11C                 ; 3
LF091:
    lda    #$FF                  ; 2
    sta    $B5                   ; 3
    inc    $E5                   ; 5
    lda    #0                    ; 2
    sta    $FD                   ; 3
    sta    $AE                   ; 3
    sta    $AF                   ; 3
    sta    CXCLR                 ; 3
    lda    #$99                  ; 2
    sta    $BE                   ; 3
    lda    #4                    ; 2
    sta    $BC                   ; 3
    bne    LF0BA                 ; 2³
LF0AB:
    lsr                          ; 2
    bcs    LF0B6                 ; 2³
    lda    $AE                   ; 3
    bne    LF0B6                 ; 2³
    lda    #7                    ; 2
    sta    $AE                   ; 3
LF0B6:
    lda    #8                    ; 2
    sta    $FD                   ; 3
LF0BA:
    lda    #0                    ; 2
    sta    AUDV1                 ; 3
    sta    AUDV0                 ; 3
    sta    $F1                   ; 3
    sta    $F2                   ; 3
    sta    $F3                   ; 3
    sta    $B9                   ; 3
    sta    $B0                   ; 3
    sta    $C5                   ; 3
    sta    $92                   ; 3
    sta    $C7                   ; 3
    sta    $D4                   ; 3
    sta    $D5                   ; 3
    sta    $E2                   ; 3
    sta    $E3                   ; 3
    lda    #3                    ; 2
    sta    $C4                   ; 3
    sta    $C8                   ; 3
    lda    SWCHB                 ; 4
    asl                          ; 2
    asl                          ; 2
    bcc    LF0E9                 ; 2³
    lda    #UNK_01               ; 2   Suntek = 6, King Tripod = 5
    sta    $C8                   ; 3
LF0E9:
    lda    #$FB                  ; 2
    sta    $F9                   ; 3
    sta    $FA                   ; 3
    lda    #$40                  ; 2
    sta    $B3                   ; 3
    lda    #$45                  ; 2
    sta    $B8                   ; 3
    lda    #$21                  ; 2
    sta    $BD                   ; 3
    lda    #1                    ; 2
    sta    $FF                   ; 3
    sta    $8F                   ; 3
    lda    #$2F                  ; 2
    sta    $F8                   ; 3
    lda    $B2                   ; 3
    cmp    #2                    ; 2
    bne    LF119                 ; 2³
    lda    #5                    ; 2
    sta    $FF                   ; 3
    sta    $8F                   ; 3
    lda    #UNK_02               ; 2   Suntek = 6, King Tripod = 7
    sta    $C4                   ; 3
    lda    #$50                  ; 2
    sta    $B3                   ; 3
LF119:
    jmp    LF42C                 ; 3
LF11C:
    lda    SWCHB                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    bcc    LF12D                 ; 2³
    lda    $FD                   ; 3
    beq    LF154                 ; 2³
    lda    #4                    ; 2
    sta    $FD                   ; 3
    bne    LF154                 ; 2³
LF12D:
    lda    $FD                   ; 3
    bne    LF137                 ; 2³
    lda    #$80                  ; 2
    sta    $FD                   ; 3
    bmi    LF154                 ; 2³
LF137:
    cmp    #4                    ; 2
    bne    LF141                 ; 2³
    lda    #$80                  ; 2
    sta    $FD                   ; 3
    bmi    LF148                 ; 2³
LF141:
    clc                          ; 2
    adc    #2                    ; 2
    sta    $FD                   ; 3
    bpl    LF154                 ; 2³
LF148:
    inc    $B2                   ; 5
    lda    $B2                   ; 3
    cmp    #4                    ; 2
    bne    LF154                 ; 2³
    lda    #1                    ; 2
    sta    $B2                   ; 3
LF154:
    lda    $D6                   ; 3
    beq    LF15B                 ; 2³
    jmp    LF1C5                 ; 3
LF15B:
    lda    $C8                   ; 3
    ora    $FD                   ; 3
    bne    LF164                 ; 2³
    jmp    LF30C                 ; 3
LF164:
    lda    $FD                   ; 3
    beq    LF16F                 ; 2³
    lda    $D8                   ; 3
    ora    $E4                   ; 3
    jmp    LF172                 ; 3
LF16F:
    lda    SWCHA                 ; 4
LF172:
    cmp    #$FF                  ; 2
    bne    LF181                 ; 2³
    inc    $BA                   ; 5
    bne    LF17E                 ; 2³
    lda    #$FE                  ; 2
    sta    $BA                   ; 3
LF17E:
    jmp    LF1C5                 ; 3
LF181:
    ldy    #0                    ; 2
    sty    $BA                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    eor    #$0F                  ; 2
    sta    $C6                   ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    LFCFA,X               ; 4
    clc                          ; 2
    adc    $BD                   ; 3
    sta    $BD                   ; 3
    lda    $C6                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LFDFA,X               ; 4
    clc                          ; 2
    adc    $B8                   ; 3
    sta    $B8                   ; 3
    bpl    LF1AB                 ; 2³
    lda    #$80                  ; 2
    sta    $B8                   ; 3
LF1AB:
    cmp    #9                    ; 2
    bcs    LF1B3                 ; 2³
    lda    #9                    ; 2
    sta    $B8                   ; 3
LF1B3:
    lda    $BD                   ; 3
    cmp    #$B5                  ; 2
    bcc    LF1BD                 ; 2³
    lda    #$B4                  ; 2
    sta    $BD                   ; 3
LF1BD:
    cmp    #$21                  ; 2
    bcs    LF1C5                 ; 2³
    lda    #$21                  ; 2
    sta    $BD                   ; 3
LF1C5:
    lda    CXM0P                 ; 3
    bmi    LF1CC                 ; 2³
    jmp    LF251                 ; 3
LF1CC:
    ldx    #1                    ; 2
    lda    $C1                   ; 3
    cmp    #$6A                  ; 2
    bcc    LF1D5                 ; 2³
    dex                          ; 2
LF1D5:
    lda    #0                    ; 2
    sta    $C5                   ; 3
    sta    AUDV1                 ; 3
    lda    $F9,X                 ; 4
    cmp    #$FD                  ; 2
    beq    LF251                 ; 2³+1
    cmp    #$FC                  ; 2
    bne    LF214                 ; 2³+1
    lda    #$20                  ; 2
    sta    $A2                   ; 3
    sed                          ; 2
    lda    $C4                   ; 3
    sec                          ; 2
    sbc    #1                    ; 2
    sta    $C4                   ; 3
    cld                          ; 2
    bcs    LF1F8                 ; 2³
    lda    #0                    ; 2
    sta    $C4                   ; 3
LF1F8:
    sed                          ; 2
    lda    $BE                   ; 3
    clc                          ; 2
    adc    #5                    ; 2
    sta    $BE                   ; 3
    cld                          ; 2
    bcc    LF207                 ; 2³
    lda    #$99                  ; 2
    sta    $BE                   ; 3
LF207:
    lda    $8F                   ; 3
    sed                          ; 2
    clc                          ; 2
    adc    $8F                   ; 3
    adc    $F2                   ; 3
    sta    $F2                   ; 3
    jmp    LF22A                 ; 3
LF214:
    ldy    $E8,X                 ; 4
    sed                          ; 2
    lda    $F1                   ; 3
    clc                          ; 2
    adc    LFF58,Y               ; 4
    sta    $F1                   ; 3
    lda    $F2                   ; 3
    adc    LFFB8,Y               ; 4
    sta    $F2                   ; 3
    lda    #$0F                  ; 2
    sta    $A2                   ; 3
LF22A:
    ror    $C6                   ; 5
    lda    $C6                   ; 3
    rol                          ; 2
    lda    $F3                   ; 3
    adc    #0                    ; 2
    sta    $F3                   ; 3
    cld                          ; 2
    lda    $C6                   ; 3
    bpl    LF247                 ; 2³
    sed                          ; 2
    lda    $C8                   ; 3
    clc                          ; 2
    adc    #1                    ; 2
    sta    $C8                   ; 3
    cld                          ; 2
    lda    #$40                  ; 2
    sta    $CD                   ; 3
LF247:
    lda    $D8,X                 ; 4
    sta    $D4,X                 ; 4
    lda    #$FD                  ; 2
    sta    $F9,X                 ; 4
    inc    $92                   ; 5
LF251:
    lda    $D6                   ; 3
    bne    LF287                 ; 2³
    ldx    #0                    ; 2
    lda    $B7                   ; 3
    bmi    LF260                 ; 2³
    lda    $B6                   ; 3
    bpl    LF287                 ; 2³
    inx                          ; 2
LF260:
    lda    $D8,X                 ; 4
    ora    $9E,X                 ; 4
    cmp    #$20                  ; 2
    bcs    LF287                 ; 2³
    lda    #$30                  ; 2
    sta    $D6                   ; 3
    lda    $D8,X                 ; 4
    sta    $D4,X                 ; 4
    lda    #$FD                  ; 2
    sta    $F9,X                 ; 4
    lda    #$20                  ; 2
    sta    $D7                   ; 3
    sed                          ; 2
    lda    $C8                   ; 3
    sec                          ; 2
    sbc    #1                    ; 2
    sta    $C8                   ; 3
    cld                          ; 2
    bcs    LF287                 ; 2³
    lda    #0                    ; 2
    sta    $C8                   ; 3
LF287:
    sta    CXCLR                 ; 3
    lda    $B5                   ; 3
    bne    LF2D3                 ; 2³
    lda    $D8                   ; 3
    cmp    $D9                   ; 3
    bcs    LF295                 ; 2³
    lda    $D9                   ; 3
LF295:
    sta    $C6                   ; 3
    lda    $F9                   ; 3
    cmp    #$FC                  ; 2
    bne    LF2A2                 ; 2³
    lda    $D8                   ; 3
    jmp    LF2C0                 ; 3
LF2A2:
    lda    $FA                   ; 3
    cmp    #$FC                  ; 2
    bne    LF2AD                 ; 2³
    lda    $D9                   ; 3
    jmp    LF2C0                 ; 3
LF2AD:
    lda    $C6                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    eor    #$FF                  ; 2
    sta    AUDV0                 ; 3
    sta    AUDF0                 ; 3
    lda    #8                    ; 2
    sta    AUDC0                 ; 3
    jmp    LF2D3                 ; 3
LF2C0:
    lda    $C6                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    LFFE8,X               ; 4
    sta    AUDF0                 ; 3
    lda    #$0D                  ; 2
    sta    AUDC0                 ; 3
    sta    AUDV0                 ; 3
    jmp    LF2D3                 ; 3
LF2D3:
    lda    $D6                   ; 3
    beq    LF30C                 ; 2³+1
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDV0                 ; 3
    lda    $D7                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDC0                 ; 3
    lda    #$4F                  ; 2
    sta    $F8                   ; 3
    lda    #$1F                  ; 2
    sta    AUDF0                 ; 3
    lda    $D6                   ; 3
    and    #$03                  ; 2
    cmp    #3                    ; 2
    bne    LF2FE                 ; 2³
    lda    $D7                   ; 3
    clc                          ; 2
    adc    #$20                  ; 2
    sta    $D7                   ; 3
    bpl    LF2FE                 ; 2³
    lda    #$20                  ; 2
    sta    $D7                   ; 3
LF2FE:
    dec    $D6                   ; 5
    bne    LF30C                 ; 2³
    lda    #0                    ; 2
    sta    $D7                   ; 3
    sta    AUDV0                 ; 3
    lda    #$2F                  ; 2
    sta    $F8                   ; 3
LF30C:
    lda    $C8                   ; 3
    ora    $FD                   ; 3
    ora    $D6                   ; 3
    bne    LF338                 ; 2³
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    lda    $C7                   ; 3
    bne    LF31E                 ; 2³
    inc    $C7                   ; 5
LF31E:
    lda    $C7                   ; 3
    cmp    #$D0                  ; 2
    beq    LF338                 ; 2³
    sta    AUDF0                 ; 3
    ora    #$08                  ; 2
    sta    AUDF1                 ; 3
    sta    AUDV1                 ; 3
    sta    AUDV0                 ; 3
    lda    #8                    ; 2
    sta    AUDC0                 ; 3
    lda    #$0D                  ; 2
    sta    AUDC1                 ; 3
    inc    $C7                   ; 5
LF338:
    lda    $A2                   ; 3
    beq    LF353                 ; 2³
    dec    $A2                   ; 5
    lda    $A2                   ; 3
    cmp    #$10                  ; 2
    bcc    LF348                 ; 2³
    ora    #$08                  ; 2
    bne    LF349                 ; 2³
LF348:
    lsr                          ; 2
LF349:
    sta    AUDV0                 ; 3
    lda    #$10                  ; 2
    sta    AUDF0                 ; 3
    lda    #8                    ; 2
    sta    AUDC0                 ; 3
LF353:
    lda    $B5                   ; 3
    beq    LF37A                 ; 2³
    bpl    LF36C                 ; 2³
    and    #$7F                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LFFE8,X               ; 4
    sta    AUDF0                 ; 3
    lda    #7                    ; 2
    sta    AUDC0                 ; 3
    lda    #$0D                  ; 2
    sta    AUDV0                 ; 3
LF36C:
    dec    $B5                   ; 5
    bmi    LF37A                 ; 2³
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    lda    $B5                   ; 3
    bne    LF37A                 ; 2³
    sta    $BC                   ; 3
LF37A:
    lda    $D6                   ; 3
    bne    LF3D2                 ; 2³
    lda    $FD                   ; 3
    beq    LF387                 ; 2³
    lda    $E5                   ; 3
    jmp    LF389                 ; 3
LF387:
    lda    INPT4                 ; 3
LF389:
    bmi    LF3D2                 ; 2³
    lda    $C5                   ; 3
    ora    $C7                   ; 3
    bne    LF3D2                 ; 2³
    lda    $E5                   ; 3
    lsr                          ; 2
    lda    $E4                   ; 3
    ror                          ; 2
    eor    $E5                   ; 3
    ldx    $E4                   ; 3
    sta    $E4                   ; 3
    stx    $E5                   ; 3
    lda    $B8                   ; 3
    sta    $C0                   ; 3
    sec                          ; 2
    sbc    #9                    ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LFEB0,X               ; 4
    sta    $CB                   ; 3
    lda    $BD                   ; 3
    sta    $C1                   ; 3
    sec                          ; 2
    sbc    #$20                  ; 2
    ldx    #0                    ; 2
LF3B7:
    cmp    #6                    ; 2
    bcc    LF3C1                 ; 2³
    sec                          ; 2
    sbc    #6                    ; 2
    inx                          ; 2
    bne    LF3B7                 ; 2³
LF3C1:
    lda    LFECF,X               ; 4
    sta    $CA                   ; 3
    lda    #$80                  ; 2
    sta    $C5                   ; 3
    inc    $C0                   ; 5
    lda    #0                    ; 2
    sta    $EA                   ; 3
    sta    $C9                   ; 3
LF3D2:
    lda    $B1                   ; 3
    clc                          ; 2
    adc    $B3                   ; 3
    sta    $B1                   ; 3
    bcc    LF3DD                 ; 2³
    inc    $B9                   ; 5
LF3DD:
    lda    $B9                   ; 3
    and    #$03                  ; 2
    ora    $BC                   ; 3
    tax                          ; 2
    lda    LFEE8,X               ; 4
    sta    $B0                   ; 3
    lda    $C5                   ; 3
    beq    LF42C                 ; 2³+1
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDF1                 ; 3
    sta    AUDV1                 ; 3
    lda    #8                    ; 2
    sta    AUDC1                 ; 3
    ldy    #5                    ; 2
LF3FB:
    lda    $CB                   ; 3
    and    #$7F                  ; 2
    clc                          ; 2
    adc    $EA                   ; 3
    sta    $EA                   ; 3
    bcc    LF410                 ; 2³
    lda    $CB                   ; 3
    bmi    LF40E                 ; 2³
    inc    $C0                   ; 5
    bne    LF410                 ; 2³
LF40E:
    dec    $C0                   ; 5
LF410:
    lda    $CA                   ; 3
    and    #$7F                  ; 2
    clc                          ; 2
    adc    $C9                   ; 3
    sta    $C9                   ; 3
    bcc    LF425                 ; 2³
    lda    $CA                   ; 3
    bmi    LF423                 ; 2³
    inc    $C1                   ; 5
    bne    LF425                 ; 2³
LF423:
    dec    $C1                   ; 5
LF425:
    dec    $C5                   ; 5
    beq    LF42C                 ; 2³
    dey                          ; 2
    bpl    LF3FB                 ; 2³+1
LF42C:
    lda    $CD                   ; 3
    beq    LF440                 ; 2³
    lda    #$0D                  ; 2
    sta    AUDC1                 ; 3
    sta    AUDF1                 ; 3
    sta    AUDV1                 ; 3
    dec    $CD                   ; 5
    bne    LF440                 ; 2³
    lda    #0                    ; 2
    sta    AUDV1                 ; 3
LF440:
    ldx    #1                    ; 2
    lda    $B8                   ; 3
LF444:
    cmp    #$0F                  ; 2
    bcc    LF44E                 ; 2³
    sec                          ; 2
    sbc    #$0F                  ; 2
    inx                          ; 2
    bne    LF444                 ; 2³
LF44E:
    stx    $BB                   ; 3
    tax                          ; 2
    lda    LFBF0,X               ; 4
    ora    $BB                   ; 3
    sta    $BB                   ; 3
    ldx    #$0B                  ; 2
    lda    #0                    ; 2
LF45C:
    sta    $82,X                 ; 4
    sta    $A2,X                 ; 4
    sta    $92,X                 ; 4
    dex                          ; 2
    bne    LF45C                 ; 2³
    lda    $BD                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    $BD                   ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFEF0,Y               ; 4
    ora    $D7                   ; 3
    sta    $82,X                 ; 4
    inx                          ; 2
    eor    #$10                  ; 2
    sta    $82,X                 ; 4
    lda    $C5                   ; 3
    beq    LF4B5                 ; 2³
    ldx    #1                    ; 2
    lda    $C0                   ; 3
LF485:
    cmp    #$0F                  ; 2
    bcc    LF48F                 ; 2³
    sec                          ; 2
    sbc    #$0F                  ; 2
    inx                          ; 2
    bne    LF485                 ; 2³
LF48F:
    stx    $C2                   ; 3
    tax                          ; 2
    lda    LFBF0,X               ; 4
    ora    $C2                   ; 3
    sta    $C2                   ; 3
    lda    $C1                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    $C1                   ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFEF0,Y               ; 4
    ora    #$80                  ; 2
    sta    $A2,X                 ; 4
    inx                          ; 2
    cpx    #$0C                  ; 2
    beq    LF4B5                 ; 2³
    eor    #$10                  ; 2
    sta    $A2,X                 ; 4
LF4B5:
    lda    $B5                   ; 3
    beq    LF4BC                 ; 2³
    jmp    LF538                 ; 3
LF4BC:
    ldx    #1                    ; 2
LF4BE:
    lda    $E2,X                 ; 4
    beq    LF535                 ; 2³+1
    ldy    #1                    ; 2
    lda    $D2,X                 ; 4
LF4C6:
    cmp    #$0F                  ; 2
    bcc    LF4D0                 ; 2³
    sec                          ; 2
    sbc    #$0F                  ; 2
    iny                          ; 2
    bne    LF4C6                 ; 2³
LF4D0:
    sty    $CE,X                 ; 4
    tay                          ; 2
    lda    LFBF0,Y               ; 4
    ora    $CE,X                 ; 4
    sta    $CE,X                 ; 4
    lda    #0                    ; 2
    lda    $D0,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $8E                   ; 3
    lda    $D0,X                 ; 4
    and    #$0F                  ; 2
    cpx    #0                    ; 2
    sta    $C6                   ; 3
    beq    LF4F6                 ; 2³
    lda    #$1F                  ; 2
    sec                          ; 2
    sbc    $C6                   ; 3
    jmp    LF4FA                 ; 3
LF4F6:
    tay                          ; 2
    lda    LFEF0,Y               ; 4
LF4FA:
    sta    $C6                   ; 3
    lda    $D8,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    $9E,X                 ; 4
    bpl    LF511                 ; 2³
    lda    #$9F                  ; 2
    sec                          ; 2
    sbc    $D8,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
LF511:
    lda    LFDF0,Y               ; 4
    sta    $FB,X                 ; 4
    lda    LFCF0,Y               ; 4
    ora    $C6                   ; 3
    stx    $C6                   ; 3
    ldx    $8E                   ; 3
    sta    $92,X                 ; 4
    ldy    $C6                   ; 3
    beq    LF52A                 ; 2³
    dex                          ; 2
    beq    LF538                 ; 2³
    bpl    LF52B                 ; 2³
LF52A:
    inx                          ; 2
LF52B:
    eor    #$10                  ; 2
    cpx    #$0C                  ; 2
    beq    LF533                 ; 2³
    sta    $92,X                 ; 4
LF533:
    ldx    $C6                   ; 3
LF535:
    dex                          ; 2
    bpl    LF4BE                 ; 2³+1
LF538:
    lda    $C4                   ; 3
    beq    LF56C                 ; 2³
    lda    $B5                   ; 3
    bne    LF56C                 ; 2³
    lda    $82                   ; 3
    clc                          ; 2
    adc    #8                    ; 2
    sta    $82                   ; 3
    bcc    LF56C                 ; 2³
    sed                          ; 2
    lda    $BE                   ; 3
    sec                          ; 2
    sbc    #1                    ; 2
    cld                          ; 2
    sta    $BE                   ; 3
    bcs    LF56C                 ; 2³
    lda    SWCHB                 ; 4
    bpl    LF568                 ; 2³
    sed                          ; 2
    lda    $C8                   ; 3
    sec                          ; 2
    sbc    #1                    ; 2
    sta    $C8                   ; 3
    cld                          ; 2
    lda    #$20                  ; 2
    sta    $D6                   ; 3
    bcs    LF56C                 ; 2³
LF568:
    lda    #0                    ; 2
    sta    $C8                   ; 3
LF56C:
    lda    #$80                  ; 2
    sta    PF0                   ; 3
    lda    $D4                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    eor    $F6                   ; 3
    sta    $F6                   ; 3
    lda    $D5                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    eor    $F7                   ; 3
    sta    $F7                   ; 3
    lda    $D8                   ; 3
    ora    $D9                   ; 3
    ora    $C4                   ; 3
    bne    LF5B8                 ; 2³
    lda    $B3                   ; 3
    clc                          ; 2
    adc    #4                    ; 2
    sta    $B3                   ; 3
    lda    $8F                   ; 3
    sed                          ; 2
    clc                          ; 2
    adc    #3                    ; 2
    sta    $C4                   ; 3
    lda    #$99                  ; 2
    sta    $BE                   ; 3
    lda    #$FF                  ; 2
    sta    $B5                   ; 3
    lda    #4                    ; 2
    sta    $BC                   ; 3
    lda    #0                    ; 2
    sta    $AE                   ; 3
    sta    $AF                   ; 3
    sta    $92                   ; 3
    sed                          ; 2
    lda    $8F                   ; 3
    clc                          ; 2
    adc    #1                    ; 2
    sta    $8F                   ; 3
    cld                          ; 2
    inc    $FF                   ; 5
LF5B8:
    inc    $C3                   ; 5
    lda    $C3                   ; 3
    sta    $B4                   ; 3
    lda    #$53                  ; 2
    eor    $CC                   ; 3
    sta    COLUPF                ; 3
    lda    $F6                   ; 3
    eor    $CC                   ; 3
    sta    $F6                   ; 3
    lda    $F7                   ; 3
    eor    $CC                   ; 3
    sta    $F7                   ; 3
    lda    $A2                   ; 3
    sta    COLUBK                ; 3
    lda    $C8                   ; 3
    bne    LF5E8                 ; 2³
    lda    $BE                   ; 3
    and    #$F0                  ; 2
    ora    #$03                  ; 2
    eor    $CC                   ; 3
    eor    $C7                   ; 3
    nop                          ; 2
    nop                          ; 2
    ora    #$0F                  ; 2
    sta    $F8                   ; 3
LF5E8:
    lda    $B5                   ; 3
    ora    $FD                   ; 3
    beq    LF61B                 ; 2³+1
    lda    #$FF                  ; 2
    sta    $EC                   ; 3
    sta    $EE                   ; 3
    lda    $FD                   ; 3
    beq    LF601                 ; 2³+1
    lda    #$50                  ; 2
    sta    $EB                   ; 3
    sta    $ED                   ; 3
    jmp    LF652                 ; 3
LF601:
    lda    $8F                   ; 3
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $EB                   ; 3
    lda    $8F                   ; 3
    and    #$F0                  ; 2
    lsr                          ; 2
    bne    LF613                 ; 2³
    lda    #$50                  ; 2
LF613:
    clc                          ; 2
    adc    #$60                  ; 2
    sta    $ED                   ; 3
    jmp    LF652                 ; 3
LF61B:
    ldy    #5                    ; 2
    ldx    #0                    ; 2
LF61F:
    lda    $F1,X                 ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta.wy $EB,Y                 ; 5
    dey                          ; 2
    lda    $F1,X                 ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    sta.wy $EB,Y                 ; 5
    inx                          ; 2
    dey                          ; 2
    bpl    LF61F                 ; 2³
    ldy    #$50                  ; 2
    ldx    #0                    ; 2
LF63A:
    lda    $EB,X                 ; 4
    bne    LF645                 ; 2³
    sty    $EB,X                 ; 4
    inx                          ; 2
    cpx    #4                    ; 2
    bne    LF63A                 ; 2³
LF645:
    ldx    #4                    ; 2
LF647:
    lda    $EB,X                 ; 4
    clc                          ; 2
    adc    #$60                  ; 2
    sta    $EB,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LF647                 ; 2³
LF652:
    ldx    #$E6                  ; 2
LF654:
    lda    INTIM                 ; 4
    bne    LF654                 ; 2³
    sta    WSYNC                 ; 3
    sta    VBLANK                ; 3
    stx    TIM64T                ; 4
    sta    NUSIZ1                ; 3
    lda    #$30                  ; 2
    sta    HMP1                  ; 3
    ldx    #7                    ; 2
    lda    #$0B                  ; 2
    sta    $BF                   ; 3
    lda    #1                    ; 2
    sta    NUSIZ0                ; 3
    lda    $F8                   ; 3
    eor    $CC                   ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    lda    #$20                  ; 2
    sta    HMP0                  ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcc    LF6C0                 ; 2³
    lda    $FD                   ; 3
    ora    $B5                   ; 3
    bne    LF6C0                 ; 2³
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
LF694:
    stx    $F4                   ; 3
    ldy    $EF                   ; 3
    lda    ($F4),Y               ; 5
    ldy    $F0                   ; 3
    ora    ($F4),Y               ; 5
    sta    WSYNC                 ; 3
    sta    $C6                   ; 3
    ldy    $EB                   ; 3
    lda    ($F4),Y               ; 5
    ldy    $EC                   ; 3
    ora    ($F4),Y               ; 5
    sta    GRP0                  ; 3
    ldy    $ED                   ; 3
    lda    ($F4),Y               ; 5
    ldy    $EE                   ; 3
    ora    ($F4),Y               ; 5
    sta    GRP1                  ; 3
    lda.w  $C6                   ; 4
    sta    GRP0                  ; 3
    dex                          ; 2
    bpl    LF694                 ; 2³
    bmi    LF72A                 ; 2³+1
LF6C0:
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    txa                          ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    lda    $AF                   ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    sta    $AF                   ; 3
    lda    $AE                   ; 3
    ldx    $B5                   ; 3
    sta    WSYNC                 ; 3
    beq    LF6E8                 ; 2³
    bcc    LF6E8                 ; 2³
    inc    $AE                   ; 5
    lda    $AE                   ; 3
    cmp    #8                    ; 2
    bcc    LF6E8                 ; 2³
    lda    #7                    ; 2
    sta    $AE                   ; 3
LF6E8:
    sta    WSYNC                 ; 3
    sta    $EF                   ; 3
LF6EC:
    ldy    $EF                   ; 3
    lda    ($EB),Y               ; 5
    sta    WSYNC                 ; 3
    ora    ($ED),Y               ; 5
    sta    $C6                   ; 3
    ldx    LFFE0,Y               ; 4
    lda    LFFC0,Y               ; 4
    sta    GRP0                  ; 3
    lda    LFFC8,Y               ; 4
    sta.w  GRP1                  ; 4
    lda    LFFD0,Y               ; 4
    sta.w  GRP0                  ; 4
    lda    LFFD8,Y               ; 4
    ldy.w  $C6                   ; 4
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    $EF                   ; 5
    bpl    LF6EC                 ; 2³+1
    lda    #7                    ; 2
    sec                          ; 2
    sbc    $AE                   ; 3
    tay                          ; 2
LF722:
    dey                          ; 2
    bmi    LF72A                 ; 2³
    sta    WSYNC                 ; 3
    jmp    LF722                 ; 3
LF72A:
    lda    $FB                   ; 3
    sta    NUSIZ1                ; 3
    lda    #0                    ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    lda    #$10                  ; 2
    sta    NUSIZ0                ; 3
    sta    WSYNC                 ; 3
    lda    $BB                   ; 3
    sta    HMP0                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    $F8                   ; 3
    eor    $CC                   ; 3
    sta    COLUP0                ; 3
LF747:
    dex                          ; 2
    bne    LF747                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
    lda    $CE                   ; 3
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    $F6                   ; 3
    sta    COLUP1                ; 3
    bit    $FF                   ; 3
LF75B:
    dex                          ; 2
    bne    LF75B                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
    lda    $C2                   ; 3
    sta    HMM0                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    nop                          ; 2
    lda    $F9                   ; 3
    sta    $91                   ; 3
    nop                          ; 2
LF76F:
    dex                          ; 2
    bne    LF76F                 ; 2³
    sta    RESM0                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    #1                    ; 2
    sta    $C6                   ; 3
    sta    WSYNC                 ; 3
    sta    HMCLR                 ; 3
    ldx    $B0                   ; 3
    lda    #0                    ; 2
    nop                          ; 2
    sta    PF1                   ; 3
    lda    #0                    ; 2
    nop                          ; 2
    sta    PF2                   ; 3
    ldx    #6                    ; 2
LF78E:
    ldy    $BF                   ; 3
    lda.wy $82,Y                 ; 4
    sta    $80                   ; 3
    lda.wy $92,Y                 ; 4
    sta    $90                   ; 3
    lda.wy $A2,Y                 ; 4
    sta    $A0                   ; 3
    dec    $BF                   ; 5
    dex                          ; 2
    beq    LF7F9                 ; 2³
    ldy    #$0F                  ; 2
    jmp    LF7D3                 ; 3
LF7A9:
    ldx    $C6                   ; 3
    beq    LF7B2                 ; 2³
    inc    $B0                   ; 5
    jmp    LF7B5                 ; 3
LF7B2:
    dec    $B0                   ; 5
    nop                          ; 2
LF7B5:
    lda    $B4                   ; 3
    sta    COLUPF                ; 3
    ldx    $B0                   ; 3
    lda    #0                    ; 2
    nop                          ; 2
    sta    PF2                   ; 3
    lda    #0                    ; 2
    nop                          ; 2
    ldx    #5                    ; 2
    sta    PF1                   ; 3
    sta    WSYNC                 ; 3
    lda    $B4                   ; 3
    clc                          ; 2
    adc    #5                    ; 2
    sta    $B4                   ; 3
    jmp    LF7DB                 ; 3
LF7D3:
    sta    WSYNC                 ; 3
LF7D5:
    lda    #0                    ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
LF7DB:
    lda    ($80),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($90),Y               ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    bmi    LF78E                 ; 2³
    dex                          ; 2
    beq    LF7A9                 ; 2³
    lda    ($A0),Y               ; 5
    sta    ENAM0                 ; 3
    stx    $F0                   ; 3
    ldx    $C6                   ; 3
    lda    CXPPMM                ; 3
    sta    $B6,X                 ; 4
    ldx    $F0                   ; 3
    bpl    LF7D3                 ; 2³
LF7F9:
    dec    $C6                   ; 5
    bmi    LF822                 ; 2³+1
    lda    $FA                   ; 3
    sta    $91                   ; 3
    lda    $CF                   ; 3
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    $F7                   ; 3
    bit    $FF                   ; 3
    ldx    #5                    ; 2
LF80E:
    dey                          ; 2
    bne    LF80E                 ; 2³
    sta    RESP1                 ; 3
    sta    COLUP1                ; 3
    ldy    #$0F                  ; 2
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    $FC                   ; 3
    sta    NUSIZ1                ; 3
    jmp    LF7D5                 ; 3
LF822:
    lda    #$50                  ; 2
    eor    $CC                   ; 3
    sta    COLUPF                ; 3
    ldx    $C8                   ; 3
    bne    LF832                 ; 2³
    lda    $BE                   ; 3
    and    #$F0                  ; 2
    eor    $CC                   ; 3
LF832:
    sta    WSYNC                 ; 3
    eor    #$03                  ; 2
    eor    $C7                   ; 3
    nop                          ; 2
    nop                          ; 2
    lda    #$FF                  ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    #0                    ; 2
    sta    GRP1                  ; 3
    lda    #4                    ; 2
    sta    NUSIZ0                ; 3
    lda    $BE                   ; 3
    sta    $C6                   ; 3
    sta    RESP0                 ; 3
    lda    #5                    ; 2
    sta.w  NUSIZ1                ; 4
    sta    RESP1                 ; 3
    lda    $FD                   ; 3
    beq    LF85D                 ; 2³
    lda    $B2                   ; 3
    sta    $C6                   ; 3
LF85D:
    ldx    #5                    ; 2
LF85F:
    lda    $C3,X                 ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $EB,X                 ; 4
    lda    $C3,X                 ; 4
    dex                          ; 2
    and    #$F0                  ; 2
    lsr                          ; 2
    adc    #$60                  ; 2
    sta    $EB,X                 ; 4
    dex                          ; 2
    bpl    LF85F                 ; 2³
    ldx    #7                    ; 2
    stx    $F4                   ; 3
    sta    WSYNC                 ; 3
    lda    $C8                   ; 3
    beq    LF88D                 ; 2³
    lda    #$4F                  ; 2
    eor    $CC                   ; 3
    sta    COLUP1                ; 3
    lda    #$5F                  ; 2
    eor    $CC                   ; 3
    eor    $CD                   ; 3
    sta    COLUP0                ; 3
LF88D:
    ldy    $F0                   ; 3
    sta    WSYNC                 ; 3
    lda    ($F4),Y               ; 5
    ldy    $EF                   ; 3
    ora    ($F4),Y               ; 5
    sta    GRP0                  ; 3
    ldy    $EE                   ; 3
    lda    ($F4),Y               ; 5
    ldy    $ED                   ; 3
    ora    ($F4),Y               ; 5
    sta    GRP1                  ; 3
    ldy    $EC                   ; 3
    lda    ($F4),Y               ; 5
    ldy    $EB                   ; 3
    ora    ($F4),Y               ; 5
    sta    GRP0                  ; 3
    dex                          ; 2
    stx    $F4                   ; 3
    bpl    LF88D                 ; 2³
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    ldx    #$35                  ; 2
LF8BC:
    lda    INTIM                 ; 4
    bne    LF8BC                 ; 2³
    stx    TIM64T                ; 4
    lda    $B5                   ; 3
    ora    $CC                   ; 3
    beq    LF8CD                 ; 2³
    jmp    LFA70                 ; 3
LF8CD:
    ldx    #1                    ; 2
LF8CF:
    lda    $E2,X                 ; 4
    beq    LF8D6                 ; 2³
    jmp    LF9BE                 ; 3
LF8D6:
    lda    $C4                   ; 3
    bne    LF8DD                 ; 2³
    jmp    LFA6A                 ; 3
LF8DD:
    lda    $D6                   ; 3
    beq    LF8E4                 ; 2³
    jmp    LFA6A                 ; 3
LF8E4:
    lda    $BC                   ; 3
    beq    LF8EB                 ; 2³
    jmp    LFA6A                 ; 3
LF8EB:
    lda    LFDFE,X               ; 4
    sta    $D0,X                 ; 4
    lda    #$45                  ; 2
    sta    $D2,X                 ; 4
    lda    #1                    ; 2
    sta    $E2,X                 ; 4
    lda    #$9F                  ; 2
    sta    $D8,X                 ; 4
    lda    #$FB                  ; 2
    sta    $F9,X                 ; 4
    lda    $92                   ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    cmp    $E4                   ; 3
    bcc    LF90D                 ; 2³
    lda    #$FC                  ; 2
    sta    $F9,X                 ; 4
LF90D:
    lda    #0                    ; 2
    sta    $9E,X                 ; 4
    lda    $E5                   ; 3
    lsr                          ; 2
    lda    $E4                   ; 3
    ror                          ; 2
    eor    $E5                   ; 3
    ldy    $E4                   ; 3
    sta    $E4                   ; 3
    sty    $E5                   ; 3
    lda    $FF                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    ldy    $F9,X                 ; 4
    cpy    #$FC                  ; 2
    beq    LF936                 ; 2³
    lda    $E5                   ; 3
    and    #$07                  ; 2
    cmp    $FF                   ; 3
    bcc    LF934                 ; 2³
    lsr                          ; 2
LF934:
    ora    #$01                  ; 2
LF936:
    sta    $E8,X                 ; 4
    cpy    #$FC                  ; 2
    bne    LF953                 ; 2³
    lda    $E4                   ; 3
    and    #$01                  ; 2
    tay                          ; 2
    lda    $E4                   ; 3
    bmi    LF94C                 ; 2³
    lda    LFA7A,Y               ; 4
    sta    $8E                   ; 3
    bne    LF981                 ; 2³
LF94C:
    lda    LFA7C,Y               ; 4
    sta    $C6                   ; 3
    bne    LF981                 ; 2³
LF953:
    lda    $B2                   ; 3
    cmp    #3                    ; 2
    beq    LF979                 ; 2³
    lda    $BA                   ; 3
    cmp    #$F0                  ; 2
    bcs    LF979                 ; 2³
    lda    $FF                   ; 3
    asl                          ; 2
    asl                          ; 2
    cmp    $E4                   ; 3
    bcs    LF979                 ; 2³
    lda    $E4                   ; 3
    and    #$7F                  ; 2
    ora    #$09                  ; 2
    sta    $C6                   ; 3
    lda    $E4                   ; 3
    lsr                          ; 2
    ora    #$20                  ; 2
    sta    $8E                   ; 3
    jmp    LF981                 ; 3
LF979:
    lda    $B8                   ; 3
    sta    $C6                   ; 3
    lda    $BD                   ; 3
    sta    $8E                   ; 3
LF981:
    lda    $C6                   ; 3
    sec                          ; 2
    sbc    #9                    ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LFEB0,Y               ; 4
    eor    #$80                  ; 2
    sta    $DC,X                 ; 4
    lda    $8E                   ; 3
    sec                          ; 2
    sbc    #$20                  ; 2
    ldy    #0                    ; 2
LF997:
    cmp    #6                    ; 2
    bcc    LF9A1                 ; 2³
    sec                          ; 2
    sbc    #6                    ; 2
    iny                          ; 2
    bne    LF997                 ; 2³
LF9A1:
    lda    LFECF,Y               ; 4
    ora    LFA78,X               ; 4
    and    LFCFE,X               ; 4
    sta    $DA,X                 ; 4
    lda    $E5                   ; 3
    ora    #$0F                  ; 2
    sta    $F6,X                 ; 4
    lda    $FD                   ; 3
    beq    LF9BE                 ; 2³
    lda    $E4                   ; 3
    and    #$07                  ; 2
    ora    #$03                  ; 2
    sta    $E8,X                 ; 4
LF9BE:
    lda    $F9,X                 ; 4
    cmp    #$FB                  ; 2
    bne    LFA13                 ; 2³+1
    lda    $D8,X                 ; 4
    ora    $9E,X                 ; 4
    cmp    #$7F                  ; 2
    bcs    LF9EF                 ; 2³
    lda    $E4                   ; 3
    cmp    #$FE                  ; 2
    bcc    LF9EF                 ; 2³
    lda    $9E,X                 ; 4
    cmp    #1                    ; 2
    beq    LFA13                 ; 2³+1
    eor    #$80                  ; 2
    sta    $9E,X                 ; 4
    lda    $DC,X                 ; 4
    eor    #$80                  ; 2
    sta    $DC,X                 ; 4
    lda    $DA,X                 ; 4
    eor    #$80                  ; 2
    sta    $DA,X                 ; 4
    lda    #$A0                  ; 2
    sec                          ; 2
    sbc    $D8,X                 ; 4
    sta    $D8,X                 ; 4
LF9EF:
    lda    $9E,X                 ; 4
    bne    LFA13                 ; 2³+1
    lda    $E5                   ; 3
    cmp    #$F0                  ; 2
    bcc    LFA13                 ; 2³+1
    lda    $D8,X                 ; 4
    cmp    #$2E                  ; 2
    bcc    LFA13                 ; 2³+1
    cmp    #$33                  ; 2
    bcs    LFA13                 ; 2³
    lda    $DC,X                 ; 4
    eor    #$80                  ; 2
    sta    $DC,X                 ; 4
    lda    $DA,X                 ; 4
    eor    #$80                  ; 2
    sta    $DA,X                 ; 4
    lda    #1                    ; 2
    sta    $9E,X                 ; 4
LFA13:
    lda    #0                    ; 2
    sec                          ; 2
    sbc    $D8,X                 ; 4
    clc                          ; 2
    adc    $E6,X                 ; 4
    sta    $E6,X                 ; 4
    bcc    LFA6A                 ; 2³
    ldy    $E8,X                 ; 4
LFA21:
    lda    $DC,X                 ; 4
    and    #$7F                  ; 2
    clc                          ; 2
    adc    $DE,X                 ; 4
    sta    $DE,X                 ; 4
    bcc    LFA46                 ; 2³
    lda    $DC,X                 ; 4
    bmi    LFA3E                 ; 2³
    inc    $D2,X                 ; 6
    lda    $D2,X                 ; 4
    cmp    #$7C                  ; 2
    bcc    LFA46                 ; 2³
    lda    #$7B                  ; 2
    sta    $D2,X                 ; 4
    bne    LFA46                 ; 2³
LFA3E:
    dec    $D2,X                 ; 6
    bpl    LFA46                 ; 2³
    lda    #0                    ; 2
    sta    $D2,X                 ; 4
LFA46:
    lda    $DA,X                 ; 4
    and    #$7F                  ; 2
    clc                          ; 2
    adc    $E0,X                 ; 4
    sta    $E0,X                 ; 4
    bcc    LFA5B                 ; 2³
    lda    $DA,X                 ; 4
    bmi    LFA59                 ; 2³
    inc    $D0,X                 ; 6
    bne    LFA5B                 ; 2³
LFA59:
    dec    $D0,X                 ; 6
LFA5B:
    dec    $D8,X                 ; 6
    bne    LFA67                 ; 2³
    lda    #0                    ; 2
    sta    $D4,X                 ; 4
    sta    $E2,X                 ; 4
    beq    LFA6A                 ; 2³
LFA67:
    dey                          ; 2
    bpl    LFA21                 ; 2³
LFA6A:
    dex                          ; 2
    bmi    LFA70                 ; 2³
    jmp    LF8CF                 ; 3
LFA70:
    lda    INTIM                 ; 4
    bne    LFA70                 ; 2³
    jmp    LF03B                 ; 3
LFA78:
    .byte $00 ; |        | $FA78
    .byte $80 ; |X       | $FA79
LFA7A:
    .byte $B4 ; |X XX X  | $FA7A
    .byte $20 ; |  X     | $FA7B
LFA7C:
    .byte $09 ; |    X  X| $FA7C
    .byte $80 ; |X       | $FA7D
    .byte $09 ; |    X  X| $FA7E
    .byte $80 ; |X       | $FA7F
    .byte $80 ; |X       | $FA80
    .byte $C0 ; |XX      | $FA81
    .byte $E0 ; |XXX     | $FA82
    .byte $F0 ; |XXXX    | $FA83
    .byte $F8 ; |XXXXX   | $FA84
    .byte $FC ; |XXXXXX  | $FA85
    .byte $FE ; |XXXXXXX | $FA86
    .byte $FE ; |XXXXXXX | $FA87
    .byte $FF ; |XXXXXXXX| $FA88
    .byte $FF ; |XXXXXXXX| $FA89
    .byte $00 ; |        | $FA8A
    .byte $00 ; |        | $FA8B
    .byte $00 ; |        | $FA8C
    .byte $00 ; |        | $FA8D
    .byte $00 ; |        | $FA8E
    .byte $00 ; |        | $FA8F
    .byte $A5 ; |X X  X X| $FA90
    .byte $ED ; |XXX XX X| $FA91
    .byte $38 ; |  XXX   | $FA92
    .byte $E9 ; |XXX X  X| $FA93
    .byte $60 ; | XX     | $FA94
    .byte $4A ; | X  X X | $FA95
    .byte $4A ; | X  X X | $FA96
    .byte $4A ; | X  X X | $FA97
    .byte $AA ; |X X X X | $FA98
    .byte $BD ; |X XXXX X| $FA99
    .byte $80 ; |X       | $FA9A
    .byte $FA ; |XXXXX X | $FA9B
    .byte $85 ; |X    X X| $FA9C
    .byte $ED ; |XXX XX X| $FA9D
    .byte $A2 ; |X X   X | $FA9E
    .byte $07 ; |     XXX| $FA9F
    .byte $86 ; |X    XX | $FAA0
    .byte $F4 ; |XXXX X  | $FAA1
    .byte $4C ; | X  XX  | $FAA2
    .byte $79 ; | XXXX  X| $FAA3
    .byte $F8 ; |XXXXX   | $FAA4
    .byte $00 ; |        | $FAA5
    .byte $00 ; |        | $FAA6
    .byte $00 ; |        | $FAA7
    .byte $00 ; |        | $FAA8
    .byte $00 ; |        | $FAA9
    .byte $00 ; |        | $FAAA
    .byte $00 ; |        | $FAAB
    .byte $00 ; |        | $FAAC
    .byte $00 ; |        | $FAAD
    .byte $00 ; |        | $FAAE
    .byte $00 ; |        | $FAAF
    .byte $8A ; |X   X X | $FAB0
    .byte $C9 ; |XX  X  X| $FAB1
    .byte $02 ; |      X | $FAB2
    .byte $90 ; |X  X    | $FAB3
    .byte $0B ; |    X XX| $FAB4
    .byte $C9 ; |XX  X  X| $FAB5
    .byte $06 ; |     XX | $FAB6
    .byte $B0 ; |X XX    | $FAB7
    .byte $07 ; |     XXX| $FAB8
    .byte $A5 ; |X X  X X| $FAB9
    .byte $ED ; |XXX XX X| $FABA
    .byte $85 ; |X    X X| $FABB
    .byte $1C ; |   XXX  | $FABC
    .byte $4C ; | X  XX  | $FABD
    .byte $A3 ; |X X   XX| $FABE
    .byte $F8 ; |XXXXX   | $FABF
    .byte $A9 ; |X X X  X| $FAC0
    .byte $00 ; |        | $FAC1
    .byte $85 ; |X    X X| $FAC2
    .byte $1C ; |   XXX  | $FAC3
    .byte $4C ; | X  XX  | $FAC4
    .byte $A3 ; |X X   XX| $FAC5
    .byte $F8 ; |XXXXX   | $FAC6
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
    .byte $00 ; |        | $FAE0
    .byte $00 ; |        | $FAE1
    .byte $00 ; |        | $FAE2
    .byte $00 ; |        | $FAE3
    .byte $00 ; |        | $FAE4
    .byte $00 ; |        | $FAE5
    .byte $00 ; |        | $FAE6
    .byte $00 ; |        | $FAE7
    .byte $00 ; |        | $FAE8
    .byte $00 ; |        | $FAE9
    .byte $00 ; |        | $FAEA
    .byte $00 ; |        | $FAEB
    .byte $00 ; |        | $FAEC
    .byte $00 ; |        | $FAED
    .byte $00 ; |        | $FAEE
    .byte $00 ; |        | $FAEF
    .byte $00 ; |        | $FAF0
    .byte $00 ; |        | $FAF1
    .byte $00 ; |        | $FAF2
    .byte $00 ; |        | $FAF3
    .byte $00 ; |        | $FAF4
    .byte $00 ; |        | $FAF5
    .byte $00 ; |        | $FAF6
    .byte $00 ; |        | $FAF7
    .byte $00 ; |        | $FAF8
    .byte $00 ; |        | $FAF9
    .byte $00 ; |        | $FAFA
    .byte $00 ; |        | $FAFB
    .byte $00 ; |        | $FAFC
    .byte $00 ; |        | $FAFD
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
    .byte $00 ; |        | $FB08
    .byte $00 ; |        | $FB09
    .byte $00 ; |        | $FB0A
    .byte $00 ; |        | $FB0B
    .byte $00 ; |        | $FB0C
    .byte $00 ; |        | $FB0D
    .byte $00 ; |        | $FB0E
    .byte $00 ; |        | $FB0F
    .byte $00 ; |        | $FB10
    .byte $00 ; |        | $FB11
    .byte $18 ; |   XX   | $FB12
    .byte $18 ; |   XX   | $FB13
    .byte $3C ; |  XXXX  | $FB14
    .byte $3C ; |  XXXX  | $FB15
    .byte $7E ; | XXXXXX | $FB16
    .byte $FF ; |XXXXXXXX| $FB17
    .byte $D5 ; |XX X X X| $FB18
    .byte $7E ; | XXXXXX | $FB19
    .byte $3C ; |  XXXX  | $FB1A
    .byte $18 ; |   XX   | $FB1B
    .byte $00 ; |        | $FB1C
    .byte $00 ; |        | $FB1D
    .byte $00 ; |        | $FB1E
    .byte $00 ; |        | $FB1F
    .byte $00 ; |        | $FB20
    .byte $00 ; |        | $FB21
    .byte $00 ; |        | $FB22
    .byte $00 ; |        | $FB23
    .byte $00 ; |        | $FB24
    .byte $00 ; |        | $FB25
    .byte $00 ; |        | $FB26
    .byte $00 ; |        | $FB27
    .byte $00 ; |        | $FB28
    .byte $00 ; |        | $FB29
    .byte $00 ; |        | $FB2A
    .byte $00 ; |        | $FB2B
    .byte $00 ; |        | $FB2C
    .byte $00 ; |        | $FB2D
    .byte $00 ; |        | $FB2E
    .byte $00 ; |        | $FB2F
    .byte $00 ; |        | $FB30
    .byte $00 ; |        | $FB31
    .byte $00 ; |        | $FB32
    .byte $10 ; |   X    | $FB33
    .byte $38 ; |  XXX   | $FB34
    .byte $38 ; |  XXX   | $FB35
    .byte $7C ; | XXXXX  | $FB36
    .byte $D6 ; |XX X XX | $FB37
    .byte $7C ; | XXXXX  | $FB38
    .byte $38 ; |  XXX   | $FB39
    .byte $10 ; |   X    | $FB3A
    .byte $00 ; |        | $FB3B
    .byte $00 ; |        | $FB3C
    .byte $00 ; |        | $FB3D
    .byte $00 ; |        | $FB3E
    .byte $00 ; |        | $FB3F
    .byte $00 ; |        | $FB40
    .byte $00 ; |        | $FB41
    .byte $00 ; |        | $FB42
    .byte $00 ; |        | $FB43
    .byte $00 ; |        | $FB44
    .byte $00 ; |        | $FB45
    .byte $00 ; |        | $FB46
    .byte $00 ; |        | $FB47
    .byte $00 ; |        | $FB48
    .byte $00 ; |        | $FB49
    .byte $00 ; |        | $FB4A
    .byte $00 ; |        | $FB4B
    .byte $00 ; |        | $FB4C
    .byte $00 ; |        | $FB4D
    .byte $00 ; |        | $FB4E
    .byte $00 ; |        | $FB4F
    .byte $00 ; |        | $FB50
    .byte $00 ; |        | $FB51
    .byte $00 ; |        | $FB52
    .byte $00 ; |        | $FB53
    .byte $10 ; |   X    | $FB54
    .byte $38 ; |  XXX   | $FB55
    .byte $38 ; |  XXX   | $FB56
    .byte $6C ; | XX XX  | $FB57
    .byte $7C ; | XXXXX  | $FB58
    .byte $38 ; |  XXX   | $FB59
    .byte $10 ; |   X    | $FB5A
    .byte $00 ; |        | $FB5B
    .byte $00 ; |        | $FB5C
    .byte $00 ; |        | $FB5D
    .byte $00 ; |        | $FB5E
    .byte $00 ; |        | $FB5F
    .byte $00 ; |        | $FB60
    .byte $00 ; |        | $FB61
    .byte $00 ; |        | $FB62
    .byte $00 ; |        | $FB63
    .byte $00 ; |        | $FB64
    .byte $00 ; |        | $FB65
    .byte $00 ; |        | $FB66
    .byte $00 ; |        | $FB67
    .byte $00 ; |        | $FB68
    .byte $00 ; |        | $FB69
    .byte $00 ; |        | $FB6A
    .byte $00 ; |        | $FB6B
    .byte $00 ; |        | $FB6C
    .byte $00 ; |        | $FB6D
    .byte $00 ; |        | $FB6E
    .byte $00 ; |        | $FB6F
    .byte $00 ; |        | $FB70
    .byte $00 ; |        | $FB71
    .byte $00 ; |        | $FB72
    .byte $00 ; |        | $FB73
    .byte $00 ; |        | $FB74
    .byte $06 ; |     XX | $FB75
    .byte $3E ; |  XXXXX | $FB76
    .byte $74 ; | XXX X  | $FB77
    .byte $7C ; | XXXXX  | $FB78
    .byte $5C ; | X XXX  | $FB79
    .byte $F8 ; |XXXXX   | $FB7A
    .byte $C0 ; |XX      | $FB7B
    .byte $00 ; |        | $FB7C
    .byte $00 ; |        | $FB7D
    .byte $00 ; |        | $FB7E
    .byte $00 ; |        | $FB7F
    .byte $00 ; |        | $FB80
    .byte $00 ; |        | $FB81
    .byte $00 ; |        | $FB82
    .byte $00 ; |        | $FB83
    .byte $00 ; |        | $FB84
    .byte $00 ; |        | $FB85
    .byte $00 ; |        | $FB86
    .byte $00 ; |        | $FB87
    .byte $00 ; |        | $FB88
    .byte $00 ; |        | $FB89
    .byte $00 ; |        | $FB8A
    .byte $00 ; |        | $FB8B
    .byte $00 ; |        | $FB8C
    .byte $00 ; |        | $FB8D
    .byte $00 ; |        | $FB8E
    .byte $00 ; |        | $FB8F
    .byte $00 ; |        | $FB90
    .byte $00 ; |        | $FB91
    .byte $00 ; |        | $FB92
    .byte $00 ; |        | $FB93
    .byte $00 ; |        | $FB94
    .byte $10 ; |   X    | $FB95
    .byte $38 ; |  XXX   | $FB96
    .byte $FE ; |XXXXXXX | $FB97
    .byte $D6 ; |XX X XX | $FB98
    .byte $38 ; |  XXX   | $FB99
    .byte $10 ; |   X    | $FB9A
    .byte $00 ; |        | $FB9B
    .byte $00 ; |        | $FB9C
    .byte $00 ; |        | $FB9D
    .byte $00 ; |        | $FB9E
    .byte $00 ; |        | $FB9F
    .byte $00 ; |        | $FBA0
    .byte $00 ; |        | $FBA1
    .byte $00 ; |        | $FBA2
    .byte $00 ; |        | $FBA3
    .byte $00 ; |        | $FBA4
    .byte $00 ; |        | $FBA5
    .byte $00 ; |        | $FBA6
    .byte $00 ; |        | $FBA7
    .byte $00 ; |        | $FBA8
    .byte $00 ; |        | $FBA9
    .byte $00 ; |        | $FBAA
    .byte $00 ; |        | $FBAB
    .byte $00 ; |        | $FBAC
    .byte $00 ; |        | $FBAD
    .byte $00 ; |        | $FBAE
    .byte $00 ; |        | $FBAF
    .byte $00 ; |        | $FBB0
    .byte $00 ; |        | $FBB1
    .byte $00 ; |        | $FBB2
    .byte $00 ; |        | $FBB3
    .byte $00 ; |        | $FBB4
    .byte $00 ; |        | $FBB5
    .byte $30 ; |  XX    | $FBB6
    .byte $38 ; |  XXX   | $FBB7
    .byte $1C ; |   XXX  | $FBB8
    .byte $0C ; |    XX  | $FBB9
    .byte $00 ; |        | $FBBA
    .byte $00 ; |        | $FBBB
    .byte $00 ; |        | $FBBC
    .byte $00 ; |        | $FBBD
    .byte $00 ; |        | $FBBE
    .byte $00 ; |        | $FBBF
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
    .byte $10 ; |   X    | $FBD7
    .byte $38 ; |  XXX   | $FBD8
    .byte $10 ; |   X    | $FBD9
    .byte $00 ; |        | $FBDA
    .byte $00 ; |        | $FBDB
    .byte $00 ; |        | $FBDC
    .byte $00 ; |        | $FBDD
    .byte $00 ; |        | $FBDE
    .byte $00 ; |        | $FBDF
    .byte $00 ; |        | $FBE0
    .byte $00 ; |        | $FBE1
    .byte $00 ; |        | $FBE2
    .byte $00 ; |        | $FBE3
    .byte $00 ; |        | $FBE4
    .byte $00 ; |        | $FBE5
    .byte $00 ; |        | $FBE6
    .byte $00 ; |        | $FBE7
    .byte $00 ; |        | $FBE8
    .byte $00 ; |        | $FBE9
    .byte $00 ; |        | $FBEA
    .byte $00 ; |        | $FBEB
    .byte $00 ; |        | $FBEC
    .byte $00 ; |        | $FBED
    .byte $00 ; |        | $FBEE
    .byte $00 ; |        | $FBEF
LFBF0:
    .byte $70 ; | XXX    | $FBF0
    .byte $60 ; | XX     | $FBF1
    .byte $50 ; | X X    | $FBF2
    .byte $40 ; | X      | $FBF3
    .byte $30 ; |  XX    | $FBF4
    .byte $20 ; |  X     | $FBF5
    .byte $10 ; |   X    | $FBF6
    .byte $00 ; |        | $FBF7
    .byte $F0 ; |XXXX    | $FBF8
    .byte $E0 ; |XXX     | $FBF9
    .byte $D0 ; |XX X    | $FBFA
    .byte $C0 ; |XX      | $FBFB
    .byte $B0 ; |X XX    | $FBFC
    .byte $A0 ; |X X     | $FBFD
    .byte $90 ; |X  X    | $FBFE
    .byte $00 ; |        | $FBFF
    .byte $00 ; |        | $FC00
    .byte $00 ; |        | $FC01
    .byte $00 ; |        | $FC02
    .byte $00 ; |        | $FC03
    .byte $00 ; |        | $FC04
    .byte $00 ; |        | $FC05
    .byte $00 ; |        | $FC06
    .byte $00 ; |        | $FC07
    .byte $00 ; |        | $FC08
    .byte $00 ; |        | $FC09
    .byte $00 ; |        | $FC0A
    .byte $00 ; |        | $FC0B
    .byte $00 ; |        | $FC0C
    .byte $00 ; |        | $FC0D
    .byte $00 ; |        | $FC0E
    .byte $00 ; |        | $FC0F
    .byte $00 ; |        | $FC10

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  IF SUNTEK

    .byte $FF ; |XXXXXXXX| $FC11
    .byte $01 ; |       X| $FC12
    .byte $01 ; |       X| $FC13
    .byte $FF ; |XXXXXXXX| $FC14
    .byte $80 ; |X       | $FC15
    .byte $FF ; |XXXXXXXX| $FC16
    .byte $01 ; |       X| $FC17
    .byte $FF ; |XXXXXXXX| $FC18
    .byte $80 ; |X       | $FC19
    .byte $FF ; |XXXXXXXX| $FC1A
    .byte $01 ; |       X| $FC1B
    .byte $FF ; |XXXXXXXX| $FC1C
    .byte $80 ; |X       | $FC1D
    .byte $FF ; |XXXXXXXX| $FC1E
    .byte $00 ; |        | $FC1F
    .byte $00 ; |        | $FC20
    .byte $00 ; |        | $FC21
    .byte $00 ; |        | $FC22
    .byte $00 ; |        | $FC23
    .byte $00 ; |        | $FC24
    .byte $00 ; |        | $FC25
    .byte $00 ; |        | $FC26
    .byte $00 ; |        | $FC27
    .byte $00 ; |        | $FC28
    .byte $00 ; |        | $FC29
    .byte $00 ; |        | $FC2A
    .byte $00 ; |        | $FC2B
    .byte $00 ; |        | $FC2C
    .byte $00 ; |        | $FC2D
    .byte $00 ; |        | $FC2E
    .byte $00 ; |        | $FC2F
    .byte $00 ; |        | $FC30
    .byte $FE ; |XXXXXXX | $FC31
    .byte $80 ; |X       | $FC32
    .byte $FE ; |XXXXXXX | $FC33
    .byte $02 ; |      X | $FC34
    .byte $FE ; |XXXXXXX | $FC35
    .byte $80 ; |X       | $FC36
    .byte $FE ; |XXXXXXX | $FC37
    .byte $02 ; |      X | $FC38
    .byte $FE ; |XXXXXXX | $FC39
    .byte $80 ; |X       | $FC3A
    .byte $FE ; |XXXXXXX | $FC3B
    .byte $02 ; |      X | $FC3C
    .byte $FE ; |XXXXXXX | $FC3D
    .byte $00 ; |        | $FC3E
    .byte $00 ; |        | $FC3F
    .byte $00 ; |        | $FC40
    .byte $00 ; |        | $FC41
    .byte $00 ; |        | $FC42
    .byte $00 ; |        | $FC43
    .byte $00 ; |        | $FC44
    .byte $00 ; |        | $FC45
    .byte $00 ; |        | $FC46
    .byte $00 ; |        | $FC47
    .byte $00 ; |        | $FC48
    .byte $00 ; |        | $FC49
    .byte $00 ; |        | $FC4A
    .byte $00 ; |        | $FC4B
    .byte $00 ; |        | $FC4C
    .byte $00 ; |        | $FC4D
    .byte $00 ; |        | $FC4E
    .byte $00 ; |        | $FC4F
    .byte $00 ; |        | $FC50
    .byte $00 ; |        | $FC51
    .byte $7E ; | XXXXXX | $FC52
    .byte $40 ; | X      | $FC53
    .byte $7E ; | XXXXXX | $FC54
    .byte $02 ; |      X | $FC55
    .byte $7E ; | XXXXXX | $FC56
    .byte $40 ; | X      | $FC57
    .byte $7E ; | XXXXXX | $FC58
    .byte $02 ; |      X | $FC59
    .byte $7E ; | XXXXXX | $FC5A
    .byte $40 ; | X      | $FC5B
    .byte $7E ; | XXXXXX | $FC5C
    .byte $00 ; |        | $FC5D
    .byte $00 ; |        | $FC5E
    .byte $00 ; |        | $FC5F
    .byte $00 ; |        | $FC60
    .byte $00 ; |        | $FC61
    .byte $00 ; |        | $FC62
    .byte $00 ; |        | $FC63
    .byte $00 ; |        | $FC64
    .byte $00 ; |        | $FC65
    .byte $00 ; |        | $FC66
    .byte $00 ; |        | $FC67
    .byte $00 ; |        | $FC68
    .byte $00 ; |        | $FC69
    .byte $00 ; |        | $FC6A
    .byte $00 ; |        | $FC6B
    .byte $00 ; |        | $FC6C
    .byte $00 ; |        | $FC6D
    .byte $00 ; |        | $FC6E
    .byte $00 ; |        | $FC6F
    .byte $00 ; |        | $FC70
    .byte $00 ; |        | $FC71
    .byte $00 ; |        | $FC72
    .byte $01 ; |       X| $FC73
    .byte $FF ; |XXXXXXXX| $FC74
    .byte $80 ; |X       | $FC75
    .byte $FF ; |XXXXXXXX| $FC76
    .byte $01 ; |       X| $FC77
    .byte $FF ; |XXXXXXXX| $FC78
    .byte $80 ; |X       | $FC79
    .byte $FF ; |XXXXXXXX| $FC7A
    .byte $01 ; |       X| $FC7B
    .byte $FF ; |XXXXXXXX| $FC7C
    .byte $00 ; |        | $FC7D
    .byte $00 ; |        | $FC7E
    .byte $00 ; |        | $FC7F
    .byte $00 ; |        | $FC80
    .byte $00 ; |        | $FC81
    .byte $00 ; |        | $FC82
    .byte $00 ; |        | $FC83
    .byte $00 ; |        | $FC84
    .byte $00 ; |        | $FC85
    .byte $00 ; |        | $FC86
    .byte $00 ; |        | $FC87
    .byte $00 ; |        | $FC88
    .byte $00 ; |        | $FC89
    .byte $00 ; |        | $FC8A
    .byte $00 ; |        | $FC8B
    .byte $00 ; |        | $FC8C
    .byte $00 ; |        | $FC8D
    .byte $00 ; |        | $FC8E
    .byte $00 ; |        | $FC8F
    .byte $00 ; |        | $FC90
    .byte $00 ; |        | $FC91
    .byte $00 ; |        | $FC92
    .byte $00 ; |        | $FC93
    .byte $02 ; |      X | $FC94
    .byte $FE ; |XXXXXXX | $FC95
    .byte $80 ; |X       | $FC96
    .byte $FE ; |XXXXXXX | $FC97
    .byte $02 ; |      X | $FC98
    .byte $FE ; |XXXXXXX | $FC99
    .byte $80 ; |X       | $FC9A
    .byte $FE ; |XXXXXXX | $FC9B
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
    .byte $00 ; |        | $FCB0
    .byte $00 ; |        | $FCB1
    .byte $00 ; |        | $FCB2
    .byte $00 ; |        | $FCB3
    .byte $00 ; |        | $FCB4
    .byte $7E ; | XXXXXX | $FCB5
    .byte $02 ; |      X | $FCB6
    .byte $7E ; | XXXXXX | $FCB7
    .byte $40 ; | X      | $FCB8
    .byte $7E ; | XXXXXX | $FCB9
    .byte $02 ; |      X | $FCBA
    .byte $7E ; | XXXXXX | $FCBB
    .byte $00 ; |        | $FCBC
    .byte $00 ; |        | $FCBD
    .byte $00 ; |        | $FCBE
    .byte $00 ; |        | $FCBF
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
    .byte $20 ; |  X     | $FCD6
    .byte $3C ; |  XXXX  | $FCD7
    .byte $20 ; |  X     | $FCD8
    .byte $3C ; |  XXXX  | $FCD9

  ELSE KING_TRIPOD
    .byte $10 ; |   X    | $FC11
    .byte $12 ; |   X  X | $FC12
    .byte $B6 ; |X XX XX | $FC13
    .byte $A4 ; |X X  X  | $FC14
    .byte $FC ; |XXXXXX  | $FC15
    .byte $7C ; | XXXXX  | $FC16
    .byte $25 ; |  X  X X| $FC17
    .byte $3D ; |  XXXX X| $FC18
    .byte $7F ; | XXXXXXX| $FC19
    .byte $E6 ; |XXX  XX | $FC1A
    .byte $24 ; |  X  X  | $FC1B
    .byte $2C ; |  X XX  | $FC1C
    .byte $47 ; | X   XXX| $FC1D
    .byte $00 ; |        | $FC1E
    .byte $00 ; |        | $FC1F
    .byte $00 ; |        | $FC20
    .byte $00 ; |        | $FC21
    .byte $00 ; |        | $FC22
    .byte $00 ; |        | $FC23
    .byte $00 ; |        | $FC24
    .byte $00 ; |        | $FC25
    .byte $00 ; |        | $FC26
    .byte $00 ; |        | $FC27
    .byte $00 ; |        | $FC28
    .byte $00 ; |        | $FC29
    .byte $00 ; |        | $FC2A
    .byte $00 ; |        | $FC2B
    .byte $00 ; |        | $FC2C
    .byte $00 ; |        | $FC2D
    .byte $00 ; |        | $FC2E
    .byte $00 ; |        | $FC2F
    .byte $00 ; |        | $FC30
    .byte $10 ; |   X    | $FC31
    .byte $3C ; |  XXXX  | $FC32
    .byte $3C ; |  XXXX  | $FC33
    .byte $3C ; |  XXXX  | $FC34
    .byte $7C ; | XXXXX  | $FC35
    .byte $64 ; | XX  X  | $FC36
    .byte $66 ; | XX  XX | $FC37
    .byte $66 ; | XX  XX | $FC38
    .byte $66 ; | XX  XX | $FC39
    .byte $7E ; | XXXXXX | $FC3A
    .byte $3C ; |  XXXX  | $FC3B
    .byte $3C ; |  XXXX  | $FC3C
    .byte $38 ; |  XXX   | $FC3D
    .byte $00 ; |        | $FC3E
    .byte $00 ; |        | $FC3F
    .byte $00 ; |        | $FC40
    .byte $00 ; |        | $FC41
    .byte $00 ; |        | $FC42
    .byte $00 ; |        | $FC43
    .byte $00 ; |        | $FC44
    .byte $00 ; |        | $FC45
    .byte $00 ; |        | $FC46
    .byte $00 ; |        | $FC47
    .byte $00 ; |        | $FC48
    .byte $00 ; |        | $FC49
    .byte $00 ; |        | $FC4A
    .byte $00 ; |        | $FC4B
    .byte $00 ; |        | $FC4C
    .byte $00 ; |        | $FC4D
    .byte $00 ; |        | $FC4E
    .byte $00 ; |        | $FC4F
    .byte $00 ; |        | $FC50
    .byte $00 ; |        | $FC51
    .byte $6C ; | XX XX  | $FC52
    .byte $24 ; |  X  X  | $FC53
    .byte $24 ; |  X  X  | $FC54
    .byte $1E ; |   XXXX | $FC55
    .byte $58 ; | X XX   | $FC56
    .byte $78 ; | XXXX   | $FC57
    .byte $7C ; | XXXXX  | $FC58
    .byte $14 ; |   X X  | $FC59
    .byte $14 ; |   X X  | $FC5A
    .byte $66 ; | XX  XX | $FC5B
    .byte $00 ; |        | $FC5C
    .byte $00 ; |        | $FC5D
    .byte $00 ; |        | $FC5E
    .byte $00 ; |        | $FC5F
    .byte $00 ; |        | $FC60
    .byte $00 ; |        | $FC61
    .byte $00 ; |        | $FC62
    .byte $00 ; |        | $FC63
    .byte $00 ; |        | $FC64
    .byte $00 ; |        | $FC65
    .byte $00 ; |        | $FC66
    .byte $00 ; |        | $FC67
    .byte $00 ; |        | $FC68
    .byte $00 ; |        | $FC69
    .byte $00 ; |        | $FC6A
    .byte $00 ; |        | $FC6B
    .byte $00 ; |        | $FC6C
    .byte $00 ; |        | $FC6D
    .byte $00 ; |        | $FC6E
    .byte $00 ; |        | $FC6F
    .byte $00 ; |        | $FC70
    .byte $00 ; |        | $FC71
    .byte $00 ; |        | $FC72
    .byte $18 ; |   XX   | $FC73
    .byte $7E ; | XXXXXX | $FC74
    .byte $7E ; | XXXXXX | $FC75
    .byte $E7 ; |XXX  XXX| $FC76
    .byte $E7 ; |XXX  XXX| $FC77
    .byte $7E ; | XXXXXX | $FC78
    .byte $7E ; | XXXXXX | $FC79
    .byte $18 ; |   XX   | $FC7A
    .byte $00 ; |        | $FC7B
    .byte $00 ; |        | $FC7C
    .byte $00 ; |        | $FC7D
    .byte $00 ; |        | $FC7E
    .byte $00 ; |        | $FC7F
    .byte $00 ; |        | $FC80
    .byte $00 ; |        | $FC81
    .byte $00 ; |        | $FC82
    .byte $00 ; |        | $FC83
    .byte $00 ; |        | $FC84
    .byte $00 ; |        | $FC85
    .byte $00 ; |        | $FC86
    .byte $00 ; |        | $FC87
    .byte $00 ; |        | $FC88
    .byte $00 ; |        | $FC89
    .byte $00 ; |        | $FC8A
    .byte $00 ; |        | $FC8B
    .byte $00 ; |        | $FC8C
    .byte $00 ; |        | $FC8D
    .byte $00 ; |        | $FC8E
    .byte $00 ; |        | $FC8F
    .byte $00 ; |        | $FC90
    .byte $00 ; |        | $FC91
    .byte $00 ; |        | $FC92
    .byte $00 ; |        | $FC93
    .byte $4A ; | X  X X | $FC94
    .byte $54 ; | X X X  | $FC95
    .byte $3C ; |  XXXX  | $FC96
    .byte $18 ; |   XX   | $FC97
    .byte $14 ; |   X X  | $FC98
    .byte $62 ; | XX   X | $FC99
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
    .byte $00 ; |        | $FCB0
    .byte $00 ; |        | $FCB1
    .byte $00 ; |        | $FCB2
    .byte $00 ; |        | $FCB3
    .byte $00 ; |        | $FCB4
    .byte $10 ; |   X    | $FCB5
    .byte $38 ; |  XXX   | $FCB6
    .byte $6C ; | XX XX  | $FCB7
    .byte $38 ; |  XXX   | $FCB8
    .byte $10 ; |   X    | $FCB9
    .byte $00 ; |        | $FCBA
    .byte $00 ; |        | $FCBB
    .byte $00 ; |        | $FCBC
    .byte $00 ; |        | $FCBD
    .byte $00 ; |        | $FCBE
    .byte $00 ; |        | $FCBF
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
    .byte $28 ; |  X X   | $FCD6
    .byte $10 ; |   X    | $FCD7
    .byte $28 ; |  X X   | $FCD8
    .byte $00 ; |        | $FCD9
  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $00 ; |        | $FCDA
    .byte $00 ; |        | $FCDB
    .byte $00 ; |        | $FCDC
    .byte $00 ; |        | $FCDD
    .byte $00 ; |        | $FCDE
    .byte $00 ; |        | $FCDF
    .byte $00 ; |        | $FCE0
    .byte $00 ; |        | $FCE1
    .byte $00 ; |        | $FCE2
    .byte $00 ; |        | $FCE3
    .byte $00 ; |        | $FCE4
    .byte $00 ; |        | $FCE5
    .byte $00 ; |        | $FCE6
    .byte $00 ; |        | $FCE7
    .byte $00 ; |        | $FCE8
    .byte $00 ; |        | $FCE9
    .byte $00 ; |        | $FCEA
    .byte $00 ; |        | $FCEB
    .byte $00 ; |        | $FCEC
    .byte $00 ; |        | $FCED
    .byte $00 ; |        | $FCEE
    .byte $00 ; |        | $FCEF
LFCF0:
    .byte $00 ; |        | $FCF0
    .byte $20 ; |  X     | $FCF1
    .byte $40 ; | X      | $FCF2
    .byte $60 ; | XX     | $FCF3
    .byte $60 ; | XX     | $FCF4
    .byte $80 ; |X       | $FCF5
    .byte $80 ; |X       | $FCF6
    .byte $A0 ; |X X     | $FCF7
    .byte $A0 ; |X X     | $FCF8
    .byte $C0 ; |XX      | $FCF9
LFCFA:
    .byte $00 ; |        | $FCFA
    .byte $03 ; |      XX| $FCFB
    .byte $FD ; |XXXXXX X| $FCFC
    .byte $00 ; |        | $FCFD
LFCFE:
    .byte $7F ; | XXXXXXX| $FCFE
    .byte $FF ; |XXXXXXXX| $FCFF
    .byte $00 ; |        | $FD00
    .byte $00 ; |        | $FD01
    .byte $00 ; |        | $FD02
    .byte $00 ; |        | $FD03
    .byte $00 ; |        | $FD04
    .byte $00 ; |        | $FD05
    .byte $00 ; |        | $FD06
    .byte $00 ; |        | $FD07
    .byte $00 ; |        | $FD08
    .byte $00 ; |        | $FD09
    .byte $00 ; |        | $FD0A
    .byte $00 ; |        | $FD0B
    .byte $00 ; |        | $FD0C
    .byte $00 ; |        | $FD0D
    .byte $00 ; |        | $FD0E
    .byte $00 ; |        | $FD0F
    .byte $00 ; |        | $FD10
    .byte $28 ; |  X X   | $FD11
    .byte $7C ; | XXXXX  | $FD12
    .byte $5E ; | X XXXX | $FD13
    .byte $A6 ; |X X  XX | $FD14
    .byte $78 ; | XXXX   | $FD15
    .byte $DC ; |XX XXX  | $FD16
    .byte $8E ; |X   XXX | $FD17
    .byte $CA ; |XX  X X | $FD18
    .byte $5C ; | X XXX  | $FD19
    .byte $64 ; | XX  X  | $FD1A
    .byte $26 ; |  X  XX | $FD1B
    .byte $00 ; |        | $FD1C
    .byte $00 ; |        | $FD1D
    .byte $00 ; |        | $FD1E
    .byte $00 ; |        | $FD1F
    .byte $00 ; |        | $FD20
    .byte $00 ; |        | $FD21
    .byte $00 ; |        | $FD22
    .byte $00 ; |        | $FD23
    .byte $00 ; |        | $FD24
    .byte $00 ; |        | $FD25
    .byte $00 ; |        | $FD26
    .byte $00 ; |        | $FD27
    .byte $00 ; |        | $FD28
    .byte $00 ; |        | $FD29
    .byte $00 ; |        | $FD2A
    .byte $00 ; |        | $FD2B
    .byte $00 ; |        | $FD2C
    .byte $00 ; |        | $FD2D
    .byte $00 ; |        | $FD2E
    .byte $00 ; |        | $FD2F
    .byte $00 ; |        | $FD30
    .byte $00 ; |        | $FD31
    .byte $00 ; |        | $FD32
    .byte $00 ; |        | $FD33
    .byte $68 ; | XX X   | $FD34
    .byte $50 ; | X X    | $FD35
    .byte $98 ; |X  XX   | $FD36
    .byte $59 ; | X XX  X| $FD37
    .byte $10 ; |   X    | $FD38
    .byte $41 ; | X     X| $FD39
    .byte $C3 ; |XX    XX| $FD3A
    .byte $00 ; |        | $FD3B
    .byte $00 ; |        | $FD3C
    .byte $00 ; |        | $FD3D
    .byte $00 ; |        | $FD3E
    .byte $00 ; |        | $FD3F
    .byte $00 ; |        | $FD40
    .byte $00 ; |        | $FD41
    .byte $00 ; |        | $FD42
    .byte $00 ; |        | $FD43
    .byte $00 ; |        | $FD44
    .byte $00 ; |        | $FD45
    .byte $00 ; |        | $FD46
    .byte $00 ; |        | $FD47
    .byte $00 ; |        | $FD48
    .byte $00 ; |        | $FD49
    .byte $00 ; |        | $FD4A
    .byte $00 ; |        | $FD4B
    .byte $00 ; |        | $FD4C
    .byte $00 ; |        | $FD4D
    .byte $00 ; |        | $FD4E
    .byte $00 ; |        | $FD4F
    .byte $00 ; |        | $FD50
    .byte $00 ; |        | $FD51
    .byte $00 ; |        | $FD52
    .byte $00 ; |        | $FD53
    .byte $60 ; | XX     | $FD54
    .byte $A8 ; |X X X   | $FD55
    .byte $48 ; | X  X   | $FD56
    .byte $20 ; |  X     | $FD57
    .byte $A4 ; |X X  X  | $FD58
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
    .byte $9C ; |X  XXX  | $FD75
    .byte $A8 ; |X X X   | $FD76
    .byte $84 ; |X    X  | $FD77
    .byte $5A ; | X XX X | $FD78
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
    .byte $34 ; |  XX X  | $FD96
    .byte $52 ; | X X  X | $FD97
    .byte $48 ; | X  X   | $FD98
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
    .byte $28 ; |  X X   | $FDB6
    .byte $54 ; | X X X  | $FDB7
    .byte $2A ; |  X X X | $FDB8
    .byte $32 ; |  XX  X | $FDB9
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
    .byte $10 ; |   X    | $FDD6
    .byte $48 ; | X  X   | $FDD7
    .byte $20 ; |  X     | $FDD8
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
LFDF0:
    .byte $07 ; |     XXX| $FDF0
    .byte $05 ; |     X X| $FDF1
    .byte $05 ; |     X X| $FDF2
    .byte $00 ; |        | $FDF3
    .byte $00 ; |        | $FDF4
    .byte $00 ; |        | $FDF5
    .byte $00 ; |        | $FDF6
    .byte $00 ; |        | $FDF7
    .byte $00 ; |        | $FDF8
    .byte $00 ; |        | $FDF9
LFDFA:
    .byte $00 ; |        | $FDFA
    .byte $FE ; |XXXXXXX | $FDFB
    .byte $02 ; |      X | $FDFC
    .byte $00 ; |        | $FDFD
LFDFE:
    .byte $70 ; | XXX    | $FDFE
    .byte $6F ; | XX XXXX| $FDFF
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
    .byte $C6 ; |XX   XX | $FE11
    .byte $82 ; |X     X | $FE12
    .byte $82 ; |X     X | $FE13
    .byte $10 ; |   X    | $FE14
    .byte $10 ; |   X    | $FE15
    .byte $28 ; |  X X   | $FE16
    .byte $10 ; |   X    | $FE17
    .byte $10 ; |   X    | $FE18
    .byte $82 ; |X     X | $FE19
    .byte $82 ; |X     X | $FE1A
    .byte $C6 ; |XX   XX | $FE1B
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
    .byte $92 ; |X  X  X | $FE31
    .byte $00 ; |        | $FE32
    .byte $48 ; | X  X   | $FE33
    .byte $00 ; |        | $FE34
    .byte $52 ; | X X  X | $FE35
    .byte $00 ; |        | $FE36
    .byte $24 ; |  X  X  | $FE37
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
    .byte $28 ; |  X X   | $FE52
    .byte $52 ; | X X  X | $FE53
    .byte $81 ; |X      X| $FE54
    .byte $81 ; |X      X| $FE55
    .byte $81 ; |X      X| $FE56
    .byte $52 ; | X X  X | $FE57
    .byte $81 ; |X      X| $FE58
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
    .byte $18 ; |   XX   | $FE73
    .byte $54 ; | X X X  | $FE74
    .byte $4A ; | X  X X | $FE75
    .byte $18 ; |   XX   | $FE76
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
    .byte $FF ; |XXXXXXXX| $FE94
    .byte $FF ; |XXXXXXXX| $FE95
    .byte $FF ; |XXXXXXXX| $FE96
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
LFEB0:
    .byte $64 ; | XX  X  | $FEB0
    .byte $60 ; | XX     | $FEB1
    .byte $58 ; | X XX   | $FEB2
    .byte $50 ; | X X    | $FEB3
    .byte $48 ; | X  X   | $FEB4
    .byte $40 ; | X      | $FEB5
    .byte $3C ; |  XXXX  | $FEB6
    .byte $34 ; |  XX X  | $FEB7
    .byte $2C ; |  X XX  | $FEB8
    .byte $24 ; |  X  X  | $FEB9
    .byte $1C ; |   XXX  | $FEBA
    .byte $18 ; |   XX   | $FEBB
    .byte $14 ; |   X X  | $FEBC
    .byte $10 ; |   X    | $FEBD
    .byte $0C ; |    XX  | $FEBE
    .byte $00 ; |        | $FEBF
    .byte $8C ; |X   XX  | $FEC0
    .byte $90 ; |X  X    | $FEC1
    .byte $94 ; |X  X X  | $FEC2
    .byte $98 ; |X  XX   | $FEC3
    .byte $9C ; |X  XXX  | $FEC4
    .byte $A4 ; |X X  X  | $FEC5
    .byte $AC ; |X X XX  | $FEC6
    .byte $B4 ; |X XX X  | $FEC7
    .byte $BC ; |X XXXX  | $FEC8
    .byte $C0 ; |XX      | $FEC9
    .byte $C8 ; |XX  X   | $FECA
    .byte $D0 ; |XX X    | $FECB
    .byte $D8 ; |XX XX   | $FECC
    .byte $E0 ; |XXX     | $FECD
    .byte $E4 ; |XXX  X  | $FECE
LFECF:
    .byte $78 ; | XXXX   | $FECF
    .byte $70 ; | XXX    | $FED0
    .byte $6B ; | XX X XX| $FED1
    .byte $61 ; | XX    X| $FED2
    .byte $57 ; | X X XXX| $FED3
    .byte $4D ; | X  XX X| $FED4
    .byte $3C ; |  XXXX  | $FED5
    .byte $34 ; |  XX X  | $FED6
    .byte $28 ; |  X X   | $FED7
    .byte $14 ; |   X X  | $FED8
    .byte $10 ; |   X    | $FED9
    .byte $08 ; |    X   | $FEDA
    .byte $00 ; |        | $FEDB
    .byte $88 ; |X   X   | $FEDC
    .byte $90 ; |X  X    | $FEDD
    .byte $94 ; |X  X X  | $FEDE
    .byte $A8 ; |X X X   | $FEDF
    .byte $B4 ; |X XX X  | $FEE0
    .byte $BC ; |X XXXX  | $FEE1
    .byte $CD ; |XX  XX X| $FEE2
    .byte $D7 ; |XX X XXX| $FEE3
    .byte $E1 ; |XXX    X| $FEE4
    .byte $EB ; |XXX X XX| $FEE5
    .byte $F0 ; |XXXX    | $FEE6
    .byte $F8 ; |XXXXX   | $FEE7
LFEE8:
    .byte $00 ; |        | $FEE8
    .byte $10 ; |   X    | $FEE9
    .byte $20 ; |  X     | $FEEA
    .byte $30 ; |  XX    | $FEEB
    .byte $30 ; |  XX    | $FEEC
    .byte $20 ; |  X     | $FEED
    .byte $10 ; |   X    | $FEEE
    .byte $00 ; |        | $FEEF
LFEF0:
    .byte $10 ; |   X    | $FEF0
    .byte $0F ; |    XXXX| $FEF1
    .byte $0E ; |    XXX | $FEF2
    .byte $0D ; |    XX X| $FEF3
    .byte $0C ; |    XX  | $FEF4
    .byte $0B ; |    X XX| $FEF5
    .byte $0A ; |    X X | $FEF6
    .byte $09 ; |    X  X| $FEF7
    .byte $08 ; |    X   | $FEF8
    .byte $07 ; |     XXX| $FEF9
    .byte $06 ; |     XX | $FEFA
    .byte $05 ; |     X X| $FEFB
    .byte $04 ; |     X  | $FEFC
    .byte $03 ; |      XX| $FEFD
    .byte $02 ; |      X | $FEFE
    .byte $01 ; |       X| $FEFF
    .byte $00 ; |        | $FF00
    .byte $07 ; |     XXX| $FF01
    .byte $05 ; |     X X| $FF02
    .byte $05 ; |     X X| $FF03
    .byte $05 ; |     X X| $FF04
    .byte $05 ; |     X X| $FF05
    .byte $05 ; |     X X| $FF06
    .byte $07 ; |     XXX| $FF07
    .byte $00 ; |        | $FF08
    .byte $02 ; |      X | $FF09
    .byte $02 ; |      X | $FF0A
    .byte $02 ; |      X | $FF0B
    .byte $02 ; |      X | $FF0C
    .byte $02 ; |      X | $FF0D
    .byte $02 ; |      X | $FF0E
    .byte $02 ; |      X | $FF0F
    .byte $00 ; |        | $FF10
    .byte $07 ; |     XXX| $FF11
    .byte $04 ; |     X  | $FF12
    .byte $04 ; |     X  | $FF13
    .byte $07 ; |     XXX| $FF14
    .byte $01 ; |       X| $FF15
    .byte $01 ; |       X| $FF16
    .byte $07 ; |     XXX| $FF17
    .byte $00 ; |        | $FF18
    .byte $07 ; |     XXX| $FF19
    .byte $01 ; |       X| $FF1A
    .byte $01 ; |       X| $FF1B
    .byte $07 ; |     XXX| $FF1C
    .byte $01 ; |       X| $FF1D
    .byte $01 ; |       X| $FF1E
    .byte $07 ; |     XXX| $FF1F
    .byte $00 ; |        | $FF20
    .byte $01 ; |       X| $FF21
    .byte $01 ; |       X| $FF22
    .byte $01 ; |       X| $FF23
    .byte $07 ; |     XXX| $FF24
    .byte $05 ; |     X X| $FF25
    .byte $05 ; |     X X| $FF26
    .byte $05 ; |     X X| $FF27
    .byte $00 ; |        | $FF28
    .byte $07 ; |     XXX| $FF29
    .byte $01 ; |       X| $FF2A
    .byte $01 ; |       X| $FF2B
    .byte $07 ; |     XXX| $FF2C
    .byte $04 ; |     X  | $FF2D
    .byte $04 ; |     X  | $FF2E
    .byte $07 ; |     XXX| $FF2F
    .byte $00 ; |        | $FF30
    .byte $07 ; |     XXX| $FF31
    .byte $05 ; |     X X| $FF32
    .byte $05 ; |     X X| $FF33
    .byte $07 ; |     XXX| $FF34
    .byte $04 ; |     X  | $FF35
    .byte $04 ; |     X  | $FF36
    .byte $07 ; |     XXX| $FF37
    .byte $00 ; |        | $FF38
    .byte $01 ; |       X| $FF39
    .byte $01 ; |       X| $FF3A
    .byte $01 ; |       X| $FF3B
    .byte $01 ; |       X| $FF3C
    .byte $01 ; |       X| $FF3D
    .byte $01 ; |       X| $FF3E
    .byte $07 ; |     XXX| $FF3F
    .byte $00 ; |        | $FF40
    .byte $07 ; |     XXX| $FF41
    .byte $05 ; |     X X| $FF42
    .byte $05 ; |     X X| $FF43
    .byte $07 ; |     XXX| $FF44
    .byte $05 ; |     X X| $FF45
    .byte $05 ; |     X X| $FF46
    .byte $07 ; |     XXX| $FF47
    .byte $00 ; |        | $FF48
    .byte $07 ; |     XXX| $FF49
    .byte $01 ; |       X| $FF4A
    .byte $01 ; |       X| $FF4B
    .byte $07 ; |     XXX| $FF4C
    .byte $05 ; |     X X| $FF4D
    .byte $05 ; |     X X| $FF4E
    .byte $07 ; |     XXX| $FF4F
    .byte $00 ; |        | $FF50
    .byte $00 ; |        | $FF51
    .byte $00 ; |        | $FF52
    .byte $00 ; |        | $FF53
    .byte $00 ; |        | $FF54
    .byte $00 ; |        | $FF55
    .byte $00 ; |        | $FF56
    .byte $00 ; |        | $FF57
LFF58:
    .byte $25 ; |  X  X X| $FF58
    .byte $50 ; | X X    | $FF59
    .byte $00 ; |        | $FF5A
    .byte $00 ; |        | $FF5B
    .byte $00 ; |        | $FF5C
    .byte $00 ; |        | $FF5D
    .byte $00 ; |        | $FF5E
    .byte $00 ; |        | $FF5F
    .byte $00 ; |        | $FF60
    .byte $70 ; | XXX    | $FF61
    .byte $50 ; | X X    | $FF62
    .byte $50 ; | X X    | $FF63
    .byte $50 ; | X X    | $FF64
    .byte $50 ; | X X    | $FF65
    .byte $50 ; | X X    | $FF66
    .byte $70 ; | XXX    | $FF67
    .byte $00 ; |        | $FF68
    .byte $20 ; |  X     | $FF69
    .byte $20 ; |  X     | $FF6A
    .byte $20 ; |  X     | $FF6B
    .byte $20 ; |  X     | $FF6C
    .byte $20 ; |  X     | $FF6D
    .byte $20 ; |  X     | $FF6E
    .byte $20 ; |  X     | $FF6F
    .byte $00 ; |        | $FF70
    .byte $70 ; | XXX    | $FF71
    .byte $40 ; | X      | $FF72
    .byte $40 ; | X      | $FF73
    .byte $70 ; | XXX    | $FF74
    .byte $10 ; |   X    | $FF75
    .byte $10 ; |   X    | $FF76
    .byte $70 ; | XXX    | $FF77
    .byte $00 ; |        | $FF78
    .byte $70 ; | XXX    | $FF79
    .byte $10 ; |   X    | $FF7A
    .byte $10 ; |   X    | $FF7B
    .byte $70 ; | XXX    | $FF7C
    .byte $10 ; |   X    | $FF7D
    .byte $10 ; |   X    | $FF7E
    .byte $70 ; | XXX    | $FF7F
    .byte $00 ; |        | $FF80
    .byte $10 ; |   X    | $FF81
    .byte $10 ; |   X    | $FF82
    .byte $10 ; |   X    | $FF83
    .byte $70 ; | XXX    | $FF84
    .byte $50 ; | X X    | $FF85
    .byte $50 ; | X X    | $FF86
    .byte $50 ; | X X    | $FF87
    .byte $00 ; |        | $FF88
    .byte $70 ; | XXX    | $FF89
    .byte $10 ; |   X    | $FF8A
    .byte $10 ; |   X    | $FF8B
    .byte $70 ; | XXX    | $FF8C
    .byte $40 ; | X      | $FF8D
    .byte $40 ; | X      | $FF8E
    .byte $70 ; | XXX    | $FF8F
    .byte $00 ; |        | $FF90
    .byte $70 ; | XXX    | $FF91
    .byte $50 ; | X X    | $FF92
    .byte $50 ; | X X    | $FF93
    .byte $70 ; | XXX    | $FF94
    .byte $40 ; | X      | $FF95
    .byte $40 ; | X      | $FF96
    .byte $70 ; | XXX    | $FF97
    .byte $00 ; |        | $FF98
    .byte $10 ; |   X    | $FF99
    .byte $10 ; |   X    | $FF9A
    .byte $10 ; |   X    | $FF9B
    .byte $10 ; |   X    | $FF9C
    .byte $10 ; |   X    | $FF9D
    .byte $10 ; |   X    | $FF9E
    .byte $70 ; | XXX    | $FF9F
    .byte $00 ; |        | $FFA0
    .byte $70 ; | XXX    | $FFA1
    .byte $50 ; | X X    | $FFA2
    .byte $50 ; | X X    | $FFA3
    .byte $70 ; | XXX    | $FFA4
    .byte $50 ; | X X    | $FFA5
    .byte $50 ; | X X    | $FFA6
    .byte $70 ; | XXX    | $FFA7
    .byte $00 ; |        | $FFA8
    .byte $70 ; | XXX    | $FFA9
    .byte $10 ; |   X    | $FFAA
    .byte $10 ; |   X    | $FFAB
    .byte $70 ; | XXX    | $FFAC
    .byte $50 ; | X X    | $FFAD
    .byte $50 ; | X X    | $FFAE
    .byte $70 ; | XXX    | $FFAF
    .byte $00 ; |        | $FFB0
    .byte $00 ; |        | $FFB1
    .byte $00 ; |        | $FFB2
    .byte $00 ; |        | $FFB3
    .byte $00 ; |        | $FFB4
    .byte $00 ; |        | $FFB5
    .byte $00 ; |        | $FFB6
    .byte $00 ; |        | $FFB7
LFFB8:
    .byte $00 ; |        | $FFB8
    .byte $00 ; |        | $FFB9
    .byte $01 ; |       X| $FFBA
    .byte $02 ; |      X | $FFBB
    .byte $04 ; |     X  | $FFBC
    .byte $08 ; |    X   | $FFBD
    .byte $12 ; |   X  X | $FFBE
    .byte $20 ; |  X     | $FFBF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  IF SUNTEK

LFFC0:
    .byte $00 ; |        | $FFC0
    .byte $72 ; | XXX  X | $FFC1
    .byte $8A ; |X   X X | $FFC2
    .byte $BB ; |X XXX XX| $FFC3
    .byte $82 ; |X     X | $FFC4
    .byte $82 ; |X     X | $FFC5
    .byte $8A ; |X   X X | $FFC6
    .byte $71 ; | XXX   X| $FFC7
LFFC8:
    .byte $00 ; |        | $FFC8
    .byte $2F ; |  X XXXX| $FFC9
    .byte $28 ; |  X X   | $FFCA
    .byte $E8 ; |XXX X   | $FFCB
    .byte $28 ; |  X X   | $FFCC
    .byte $28 ; |  X X   | $FFCD
    .byte $28 ; |  X X   | $FFCE
    .byte $C8 ; |XX  X   | $FFCF
LFFD0:
    .byte $00 ; |        | $FFD0
    .byte $44 ; | X   X  | $FFD1
    .byte $44 ; | X   X  | $FFD2
    .byte $7C ; | XXXXX  | $FFD3
    .byte $44 ; | X   X  | $FFD4
    .byte $44 ; | X   X  | $FFD5
    .byte $44 ; | X   X  | $FFD6
    .byte $39 ; |  XXX  X| $FFD7
LFFD8:
    .byte $00 ; |        | $FFD8
    .byte $47 ; | X   XXX| $FFD9
    .byte $42 ; | X    X | $FFDA
    .byte $42 ; | X    X | $FFDB
    .byte $42 ; | X    X | $FFDC
    .byte $42 ; | X    X | $FFDD
    .byte $42 ; | X    X | $FFDE
    .byte $F7 ; |XXXX XXX| $FFDF
LFFE0:
    .byte $00 ; |        | $FFE0
    .byte $38 ; |  XXX   | $FFE1
    .byte $44 ; | X   X  | $FFE2
    .byte $40 ; | X      | $FFE3
    .byte $40 ; | X      | $FFE4
    .byte $40 ; | X      | $FFE5
    .byte $44 ; | X   X  | $FFE6
    .byte $38 ; |  XXX   | $FFE7

  ELSE KING_TRIPOD

LFFC0:
    .byte $00 ; |        | $FFC0
    .byte $F9 ; |XXXXX  X| $FFC1
    .byte $09 ; |    X  X| $FFC2
    .byte $09 ; |    X  X| $FFC3
    .byte $F9 ; |XXXXX  X| $FFC4
    .byte $81 ; |X      X| $FFC5
    .byte $81 ; |X      X| $FFC6
    .byte $F9 ; |XXXXX  X| $FFC7
LFFC8:
    .byte $00 ; |        | $FFC8
    .byte $F2 ; |XXXX  X | $FFC9
    .byte $12 ; |   X  X | $FFCA
    .byte $12 ; |   X  X | $FFCB
    .byte $12 ; |   X  X | $FFCC
    .byte $13 ; |   X  XX| $FFCD
    .byte $13 ; |   X  XX| $FFCE
    .byte $12 ; |   X  X | $FFCF
LFFD0:
    .byte $00 ; |        | $FFD0
    .byte $21 ; |  X    X| $FFD1
    .byte $61 ; | XX    X| $FFD2
    .byte $E1 ; |XXX    X| $FFD3
    .byte $A1 ; |X X    X| $FFD4
    .byte $21 ; |  X    X| $FFD5
    .byte $21 ; |  X    X| $FFD6
    .byte $27 ; |  X  XXX| $FFD7
LFFD8:
    .byte $00 ; |        | $FFD8
    .byte $0F ; |    XXXX| $FFD9
    .byte $08 ; |    X   | $FFDA
    .byte $08 ; |    X   | $FFDB
    .byte $0F ; |    XXXX| $FFDC
    .byte $08 ; |    X   | $FFDD
    .byte $08 ; |    X   | $FFDE
    .byte $CF ; |XX  XXXX| $FFDF
LFFE0:
    .byte $00 ; |        | $FFE0
    .byte $91 ; |X  X   X| $FFE1
    .byte $12 ; |   X  X | $FFE2
    .byte $14 ; |   X X  | $FFE3
    .byte $18 ; |   XX   | $FFE4
    .byte $14 ; |   X X  | $FFE5
    .byte $12 ; |   X  X | $FFE6
    .byte $91 ; |X  X   X| $FFE7

  ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFFE8:
    .byte $09 ; |    X  X| $FFE8
    .byte $09 ; |    X  X| $FFE9
    .byte $09 ; |    X  X| $FFEA
    .byte $0B ; |    X XX| $FFEB
    .byte $0D ; |    XX X| $FFEC
    .byte $09 ; |    X  X| $FFED
    .byte $09 ; |    X  X| $FFEE
    .byte $0D ; |    XX X| $FFEF
    .byte $0D ; |    XX X| $FFF0
    .byte $0C ; |    XX  | $FFF1
    .byte $0B ; |    X XX| $FFF2
    .byte $0C ; |    XX  | $FFF3
    .byte $0D ; |    XX X| $FFF4
    .byte $0C ; |    XX  | $FFF5
    .byte $0C ; |    XX  | $FFF6
    .byte $10 ; |   X    | $FFF7
    .byte $00 ; |        | $FFF8
    .byte $00 ; |        | $FFF9
    .byte $00 ; |        | $FFFA
    .byte $00 ; |        | $FFFB

       ORG $FFFC

    .word START,START