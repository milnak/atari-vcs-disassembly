; Rough Disassembly of Omega Race
; by Omegamatrix
;
; now uses Genesis controllers
; - button B, thrust
; - button C, fire
;
;  Newer versions of the Stella Emulator will autodetect this as FA bankswitching.
;  By default (in Stella) you can share 1 joystick for 2 players. To use two Genesis
;  joysticks specifically, set the RIGHT player difficulty switch to the B (Amateur or Novice)
;  position. Likewise on real hardware:
;
;  RIGHT player difficutly switch
;    - pushed to "A" (Pro or Expert), two joysticks are needed for a 2 player game (one in each port)
;    - pushed to "B" (Amateur or Novice), one joystick is used for a 2 player game (use the left port)
;
;
;
; Omega1.cfg contents:
;
;      ORG B000
;      DATA B000 B1FF
;      CODE B200 B589
;      GFX B58A B619
;      CODE B61A B821
;      GFX B822 B8AA
;      CODE B8AB B9C0
;      GFX B9C1 BA00
;      CODE BA01 BCCA
;      GFX BCCB BCDC
;      CODE BCDD BF31
;      GFX BF32 BFE6
;      CODE BFE7 BFF6
;      GFX BFF7 BFFF
;
; Omega2.cfg contents:
;
;      ORG D000
;      DATA D100 D1FF
;      CODE D200 D4C8
;      GFX D4C9 DEC4
;      CODE DEC5 DF64
;      GFX DF65 DFE6
;      CODE DFE7 DFF6
;      GFX DFF7 DFFF
;
; Omega3.cfg contents:
;
;      ORG F000
;      DATA F100 F1FF
;      CODE F200 F9A5
;      GFX F9A6 FA97
;      CODE FA98 FAED
;      GFX FAEE FAF3
;      CODE FAF4 FC31
;      GFX FC32 FCA3
;      CODE FCA4 FD6F
;      GFX FD70 FDAF
;      CODE FDB0 FF96
;      GFX FF97 FFE6
;      CODE FFE7 FFF6
;      GFX FFF7 FFFF

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
RESM0   =  $12
RESM1   =  $13
RESBL   =  $14
AUDC0   =  $15
AUDF0   =  $17
AUDV0   =  $19
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
ENAM1   =  $1E
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMM0    =  $22
HMM1    =  $23
HMBL    =  $24
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A

INPT0   =  $38
INPT1   =  $39
INPT2   =  $3A
INPT3   =  $3B
INPT4   =  $3C
INPT5   =  $3D
SWCHA   =  $0280
SWCHB   =  $0282
TIMINT  =  $0285

; Read TIA Baseline = $00
CXM0P   =  $00
CXM1P   =  $01

LB99B   =   $B99B

;$029D  what are these?
;$029E

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 0
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $1000
      RORG $B000


LB000:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF
LB045:
    .byte $FF
LB046:
    .byte $FF
LB047:
    .byte $FF
LB048:
    .byte $FF
LB049:
    .byte $FF
LB04A:
    .byte $FF,$FF,$FF,$FF,$FF,$FF
LB050:
    .byte $FF
LB051:
    .byte $FF
LB052:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF
LB059:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LB061:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LB069:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LB071:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF
LB078:
    .byte $FF
LB079:
    .byte $FF
LB07A:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF
LB081:
    .byte $FF
LB082:
    .byte $FF
LB083:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LB08B:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LB094:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LB09D:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LB0A6:
    .byte $FF,$FF,$FF,$FF,$FF,$FF
LB0AC:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LB0B5:
    .byte $FF
LB0B6:
    .byte $FF
LB0B7:
    .byte $FF
LB0B8:
    .byte $FF
LB0B9:
    .byte $FF
LB0BA:
    .byte $FF
LB0BB:
    .byte $FF
LB0BC:
    .byte $FF
LB0BD:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
LB145:
    .byte $FF
LB146:
    .byte $FF
LB147:
    .byte $FF
LB148:
    .byte $7F
LB149:
    .byte $FF
LB14A:
    .byte $FF,$FF,$7F,$FF,$FF,$FF
LB150:
    .byte $7F
LB151:
    .byte $FF
LB152:
    .byte $FF,$FF,$7F,$FF,$FF,$FF,$7F
LB159:
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
LB161:
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
LB169:
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
LB171:
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF
LB178:
    .byte $7F
LB179:
    .byte $FF
LB17A:
    .byte $FF,$FF,$7F,$FF,$FF,$FF,$FF
LB181:
    .byte $FF
LB182:
    .byte $FF
LB183:
    .byte $FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF
LB18B:
    .byte $FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF
LB194:
    .byte $7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
LB19D:
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF
LB1A6:
    .byte $FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
LB1B5:
    .byte $FF
LB1B6:
    .byte $FF
LB1B7:
    .byte $FF
LB1B8:
    .byte $7F
LB1B9:
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF

       ORG $1200
      RORG $B200

    lda    #1                    ; 2
    sta    $FFFA                 ; 4

    lda    $ED                   ; 3
    beq    LB210                 ; 2³
    lda    #5                    ; 2
    jsr    LBD2C                 ; 6
    dec    $ED                   ; 5
LB210:
    lda    $C2                   ; 3
    and    #$09                  ; 2
    bne    LB218                 ; 2³
    lda    $C2                   ; 3
LB218:
    beq    LB229                 ; 2³
    lsr                          ; 2
    bcc    LB22C                 ; 2³
    lda    #$18                  ; 2
    sta    $C5                   ; 3
    lda    #1                    ; 2
    sta    $C4                   ; 3
    lda    #8                    ; 2
    sta    $C2                   ; 3
LB229:
    jmp    LB2C4                 ; 3
LB22C:
    lsr                          ; 2
    bcc    LB23A                 ; 2³
    lda    #$44                  ; 2
    sta    $C5                   ; 3
    lda    #4                    ; 2
    sta    $C2                   ; 3
    jmp    LB2C4                 ; 3
LB23A:
    lsr                          ; 2
    bcc    LB258                 ; 2³
    lda    $B9                   ; 3
    bne    LB229                 ; 2³
    lda    $C5                   ; 3
    beq    LB24A                 ; 2³
    dec    $C5                   ; 5
    jmp    LB2C4                 ; 3
LB24A:
    lda    #$80                  ; 2
    sta    $C2                   ; 3
    ldy    $F148                 ; 4
    iny                          ; 2
    sty    $F048                 ; 4
    jmp    LB2C4                 ; 3
LB258:
    lda    $B9                   ; 3
    bne    LB229                 ; 2³
    lda    $C5                   ; 3
    beq    LB270                 ; 2³
    dec    $C5                   ; 5
    inc    $C4                   ; 5
    lda    $C4                   ; 3
    and    #$0F                  ; 2
    bne    LB229                 ; 2³
    lda    #1                    ; 2
    sta    $C4                   ; 3
    bne    LB2C4                 ; 2³
LB270:
    sta    $C4                   ; 3
    ldy    $F147                 ; 4
    dey                          ; 2
    sty    $F047                 ; 4
    lda    #0                    ; 2
    sta    $A8                   ; 3
    lda    $E4                   ; 3
    beq    LB29E                 ; 2³
    lda    $E1                   ; 3
    eor    #$80                  ; 2
    sta    $E1                   ; 3
    lda    #$FF                  ; 2
    sta    $A8                   ; 3
    ldy    #3                    ; 2
LB28D:
    lda    $F145,Y               ; 4
    ldx    $E2,Y                 ; 4
    sta.wy $E2,Y                 ; 5
    txa                          ; 2
    sta    $F045,Y               ; 5
    dey                          ; 2
    bpl    LB28D                 ; 2³
    bmi    LB2AD                 ; 2³
LB29E:
    ldy    $F147                 ; 4
    bne    LB2AD                 ; 2³
    sta    $C2                   ; 3
    sta    $D5                   ; 3
    dey                          ; 2
    sty    $DD                   ; 3
LB2AA:
    jmp    LB2F4                 ; 3
LB2AD:
    lda    #$80                  ; 2
    sta    $C2                   ; 3
    lda    $C3                   ; 3
    bne    LB2AA                 ; 2³
    lda    $A8                   ; 3
    bne    LB2C2                 ; 2³
    ldy    $F148                 ; 4
    iny                          ; 2
    sty    $F048                 ; 4
    bne    LB2C4                 ; 2³
LB2C2:
    inc    $E5                   ; 5
LB2C4:
    ldy    $BB                   ; 3
LB2C6:
    lda    $F151,Y               ; 4
    bmi    LB2CF                 ; 2³
    and    #$0F                  ; 2
    beq    LB2D2                 ; 2³
LB2CF:
    dey                          ; 2
    bne    LB2C6                 ; 2³
LB2D2:
    sty    $BA                   ; 3
    jsr    LBA01                 ; 6
    jsr    LBAD7                 ; 6
    lda    $F1B5                 ; 4
    and    #$40                  ; 2
    bne    LB2F4                 ; 2³
    jsr    LB307                 ; 6
    jsr    LB61A                 ; 6
    jsr    LB696                 ; 6
    lda    $F1B5                 ; 4
    and    #$40                  ; 2
    bne    LB2F4                 ; 2³
    jsr    LB8E5                 ; 6
LB2F4:
    lda    $F1B5                 ; 4
    and    #$BF                  ; 2
    sta    $F0B5                 ; 4
    lda    #$98                  ; 2
    sta    $AE                   ; 3
    lda    #$FA                  ; 2
    sta    $AF                   ; 3
    jmp    LBFEF                 ; 3
LB307:
    lda    $C2                   ; 3
    beq    LB30C                 ; 2³
    rts                          ; 6

LB30C:
    lda    $B8                   ; 3
    and    #$0F                  ; 2
    cmp    #8                    ; 2
    bcc    LB316                 ; 2³
    sbc    #8                    ; 2
LB316:
    tay                          ; 2
    ldx    #$FF                  ; 2
LB319:
    inx                          ; 2
    sty    $A9                   ; 3
    lda    $F151,X               ; 4
    and    #$0F                  ; 2
    cmp    $A9                   ; 3
    bne    LB319                 ; 2³
    stx    $A8                   ; 3
    lda    $F151,X               ; 4
    and    #$70                  ; 2
    sta    $AB                   ; 3
    beq    LB333                 ; 2³
    jmp    LB409                 ; 3
LB333:
    lda    $C8                   ; 3
    and    #$01                  ; 2
    beq    LB33A                 ; 2³
LB339:
    rts                          ; 6

LB33A:
    lda    $C6                   ; 3
    beq    LB364                 ; 2³
    dec    $C6                   ; 5
    bne    LB339                 ; 2³
    ldy    #0                    ; 2
LB344:
    lda    $F151,Y               ; 4
    and    #$70                  ; 2
    cmp    #$10                  ; 2
    beq    LB355                 ; 2³
    iny                          ; 2
    cpy    $BB                   ; 3
    bcc    LB344                 ; 2³
    beq    LB344                 ; 2³
    rts                          ; 6

LB355:
    lda    $F151,Y               ; 4
    and    #$8F                  ; 2
    ora    #$50                  ; 2
    sta    $F051,Y               ; 5
    lda    #$12                  ; 2
    sta    $C9                   ; 3
    rts                          ; 6

LB364:
    lda    $C7                   ; 3
    beq    LB339                 ; 2³
    dec    $C7                   ; 5
    bne    LB339                 ; 2³
    ldy    #0                    ; 2
    lda    $C3                   ; 3
    cmp    #1                    ; 2
    bne    LB384                 ; 2³
LB374:
    lda    $F151,Y               ; 4
    and    #$70                  ; 2
    cmp    #$20                  ; 2
    beq    LB39C                 ; 2³
    cmp    #$50                  ; 2
    beq    LB39C                 ; 2³
    iny                          ; 2
    bne    LB374                 ; 2³
LB384:
    lda    $F151,Y               ; 4
    and    #$70                  ; 2
    cmp    #$50                  ; 2
    beq    LB39C                 ; 2³
    cmp    #$10                  ; 2
    bne    LB393                 ; 2³
    sty    $AE                   ; 3
LB393:
    iny                          ; 2
    cpy    $BB                   ; 3
    bcc    LB384                 ; 2³
    beq    LB384                 ; 2³
    ldy    $AE                   ; 3
LB39C:
    lda    $F151,Y               ; 4
    and    #$8F                  ; 2
    ora    #$30                  ; 2
    sta    $F051,Y               ; 5
    lda    #$23                  ; 2
    sta    $C9                   ; 3
    lda    $F148                 ; 4
    cmp    #5                    ; 2
    bcc    LB3B3                 ; 2³
    lda    #4                    ; 2
LB3B3:
    asl                          ; 2
    tax                          ; 2
    dex                          ; 2
    dex                          ; 2
    lda    $F149,Y               ; 4
    cmp    #$50                  ; 2
    bcs    LB3CC                 ; 2³
    lda    LB5DA,X               ; 4
    sta    $F0BD                 ; 4
    lda    LB5DB,X               ; 4
    sta    $F0BC                 ; 4
    bne    LB3D8                 ; 2³
LB3CC:
    lda    LB5E2,X               ; 4
    sta    $F0BD                 ; 4
    lda    LB5E3,X               ; 4
    sta    $F0BC                 ; 4
LB3D8:
    lda    $F151,Y               ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    lda    $F161,Y               ; 4
    cmp    #$50                  ; 2
    bcs    LB3F3                 ; 2³
    lda    LB5F2,X               ; 4
    sta    $F0BB                 ; 4
    lda    LB5F3,X               ; 4
    sta    $F0BA                 ; 4
    bne    LB3FF                 ; 2³
LB3F3:
    lda    LB5EA,X               ; 4
    sta    $F0BB                 ; 4
    lda    LB5EB,X               ; 4
    sta    $F0BA                 ; 4
LB3FF:
    lda    #1                    ; 2
    ora    $C8                   ; 3
    sta    $C8                   ; 3
    rts                          ; 6

LB406:
    jmp    LB589                 ; 3
LB409:
    lda    $F151,X               ; 4
    bmi    LB406                 ; 2³
    lda    $AB                   ; 3
    cmp    #$30                  ; 2
    bcc    LB41F                 ; 2³
    cmp    #$50                  ; 2
    beq    LB41F                 ; 2³
    cmp    #$30                  ; 2
    bne    LB406                 ; 2³
    jmp    LB52D                 ; 3
LB41F:
    lda    $F159,Y               ; 4
    and    #$03                  ; 2
    sta    $AA                   ; 3
    bne    LB436                 ; 2³
    lda    $F161,Y               ; 4
    cmp    LB5FA,Y               ; 4
    bcc    LB466                 ; 2³
    lda    #1                    ; 2
    sta    $AA                   ; 3
    bne    LB466                 ; 2³
LB436:
    cmp    #1                    ; 2
    bne    LB448                 ; 2³
    lda    LB602,Y               ; 4
    cmp    $F149,X               ; 4
    bcc    LB466                 ; 2³
    lda    #2                    ; 2
    sta    $AA                   ; 3
    bne    LB466                 ; 2³
LB448:
    cmp    #2                    ; 2
    bne    LB45A                 ; 2³
    lda    LB60A,Y               ; 4
    cmp    $F161,Y               ; 4
    bcc    LB466                 ; 2³
    lda    #3                    ; 2
    sta    $AA                   ; 3
    bne    LB466                 ; 2³
LB45A:
    lda    $F149,X               ; 4
    cmp    LB612,Y               ; 4
    bcc    LB466                 ; 2³
    lda    #0                    ; 2
    sta    $AA                   ; 3
LB466:
    lda    $F159,Y               ; 4
    and    #$FC                  ; 2
    ora    $AA                   ; 3
    sta    $F059,Y               ; 5
    ldx    $AA                   ; 3
    lda    $AB                   ; 3
    clc                          ; 2
    cmp    #$20                  ; 2
    beq    LB481                 ; 2³
    lda    $F148                 ; 4
    cmp    #1                    ; 2
    bne    LB4AC                 ; 2³
    rts                          ; 6

LB481:
    lda    $F148                 ; 4
    cmp    #5                    ; 2
    bcc    LB48A                 ; 2³
    lda    #4                    ; 2
LB48A:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    stx    $AC                   ; 3
    adc    $AC                   ; 3
    tax                          ; 2
    lda    LB58A,X               ; 4
    sta    $F0B8                 ; 4
    lda    LB58E,X               ; 4
    sta    $F0B9                 ; 4
    lda    LB592,X               ; 4
    sta    $F0B6                 ; 4
    lda    LB596,X               ; 4
    sta    $F0B7                 ; 4
    rts                          ; 6

LB4AC:
    clc                          ; 2
    lda    LB58A,X               ; 4
    adc    $F169,Y               ; 4
    sta    $F069,Y               ; 5
    lda    LB58E,X               ; 4
    adc    $F161,Y               ; 4
    sta    $F061,Y               ; 5
    clc                          ; 2
    lda    LB592,X               ; 4
    adc    $F171,Y               ; 4
    sta    $F071,Y               ; 5
    lda    LB596,X               ; 4
    ldx    $A8                   ; 3
    adc    $F149,X               ; 4
    sta    $F049,X               ; 5
LB4D4:
    stx    $AE                   ; 3
    sty    $AF                   ; 3
LB4D8:
    ldy    $AE                   ; 3
    cpy    $BB                   ; 3
    bcs    LB502                 ; 2³+1
    lda    $F14A,Y               ; 4
    cmp    $F149,Y               ; 4
    bcs    LB502                 ; 2³+1
    ldx    $F149,Y               ; 4
    sta    $F049,Y               ; 5
    txa                          ; 2
    sta    $F04A,Y               ; 5
    lda    $F151,Y               ; 4
    ldx    $F152,Y               ; 4
    sta    $F052,Y               ; 5
    txa                          ; 2
    sta    $F051,Y               ; 5
    iny                          ; 2
    sty    $AE                   ; 3
    bne    LB4D8                 ; 2³+1
LB502:
    ldx    $AF                   ; 3
    ldy    $AE                   ; 3
    beq    LB52C                 ; 2³
    lda    $F149,Y               ; 4
    cmp    $F148,Y               ; 4
    bcs    LB52C                 ; 2³
    ldx    $F148,Y               ; 4
    sta    $F048,Y               ; 5
    txa                          ; 2
    sta    $F049,Y               ; 5
    lda    $F151,Y               ; 4
    ldx    $F150,Y               ; 4
    sta    $F050,Y               ; 5
    txa                          ; 2
    sta    $F051,Y               ; 5
    dey                          ; 2
    sty    $AE                   ; 3
    bne    LB502                 ; 2³
LB52C:
    rts                          ; 6

LB52D:
    ldy    $BB                   ; 3
    cpy    #7                    ; 2
    bcs    LB52C                 ; 2³
    lda    $D9                   ; 3
    beq    LB53A                 ; 2³
    dec    $D9                   ; 5
    rts                          ; 6

LB53A:
    iny                          ; 2
    sty    $BB                   ; 3
    sty    $AA                   ; 3
    lda    #8                    ; 2
    sta    $D9                   ; 3
    lda    $F149,X               ; 4
    sta    $F049,Y               ; 5
    sta    $AB                   ; 3
    lda    $F151,Y               ; 4
    and    #$0F                  ; 2
    ora    #$40                  ; 2
    sta    $F051,Y               ; 5
    sta    $AC                   ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    ldx    $A9                   ; 3
    lda    $F161,X               ; 4
    sta    $F061,Y               ; 5
    ldy    $A8                   ; 3
LB564:
    iny                          ; 2
    cpy    $BB                   ; 3
    bcs    LB57F                 ; 2³
    lda    $AB                   ; 3
    ldx    $F149,Y               ; 4
    sta    $F049,Y               ; 5
    stx    $AB                   ; 3
    lda    $AC                   ; 3
    ldx    $F151,Y               ; 4
    sta    $F051,Y               ; 5
    stx    $AC                   ; 3
    bcc    LB564                 ; 2³
LB57F:
    lda    $AB                   ; 3
    sta    $F049,Y               ; 5
    lda    $AC                   ; 3
    sta    $F051,Y               ; 5
LB589:
    rts                          ; 6

LB58A:
    .byte $80 ; |X       | $B58A
    .byte $00 ; |        | $B58B
    .byte $80 ; |X       | $B58C
    .byte $00 ; |        | $B58D
LB58E:
    .byte $01 ; |       X| $B58E
    .byte $00 ; |        | $B58F
    .byte $FE ; |XXXXXXX | $B590
    .byte $00 ; |        | $B591
LB592:
    .byte $00 ; |        | $B592
    .byte $C0 ; |XX      | $B593
    .byte $00 ; |        | $B594
    .byte $40 ; | X      | $B595
LB596:
    .byte $00 ; |        | $B596
    .byte $FD ; |XXXXXX X| $B597
    .byte $00 ; |        | $B598
    .byte $02 ; |      X | $B599
    .byte $30 ; |  XX    | $B59A
    .byte $00 ; |        | $B59B
    .byte $D0 ; |XX X    | $B59C
    .byte $00 ; |        | $B59D
    .byte $00 ; |        | $B59E
    .byte $00 ; |        | $B59F
    .byte $FF ; |XXXXXXXX| $B5A0
    .byte $00 ; |        | $B5A1
    .byte $00 ; |        | $B5A2
    .byte $A0 ; |X X     | $B5A3
    .byte $00 ; |        | $B5A4
    .byte $48 ; | X  X   | $B5A5
    .byte $00 ; |        | $B5A6
    .byte $FF ; |XXXXXXXX| $B5A7
    .byte $00 ; |        | $B5A8
    .byte $00 ; |        | $B5A9
    .byte $60 ; | XX     | $B5AA
    .byte $00 ; |        | $B5AB
    .byte $A0 ; |X X     | $B5AC
    .byte $00 ; |        | $B5AD
    .byte $00 ; |        | $B5AE
    .byte $00 ; |        | $B5AF
    .byte $FF ; |XXXXXXXX| $B5B0
    .byte $00 ; |        | $B5B1
    .byte $00 ; |        | $B5B2
    .byte $70 ; | XXX    | $B5B3
    .byte $00 ; |        | $B5B4
    .byte $90 ; |X  X    | $B5B5
    .byte $00 ; |        | $B5B6
    .byte $FF ; |XXXXXXXX| $B5B7
    .byte $00 ; |        | $B5B8
    .byte $00 ; |        | $B5B9
    .byte $80 ; |X       | $B5BA
    .byte $00 ; |        | $B5BB
    .byte $80 ; |X       | $B5BC
    .byte $00 ; |        | $B5BD
    .byte $00 ; |        | $B5BE
    .byte $00 ; |        | $B5BF
    .byte $FF ; |XXXXXXXX| $B5C0
    .byte $00 ; |        | $B5C1
    .byte $00 ; |        | $B5C2
    .byte $40 ; | X      | $B5C3
    .byte $00 ; |        | $B5C4
    .byte $C0 ; |XX      | $B5C5
    .byte $00 ; |        | $B5C6
    .byte $FF ; |XXXXXXXX| $B5C7
    .byte $00 ; |        | $B5C8
    .byte $00 ; |        | $B5C9
    .byte $A0 ; |X X     | $B5CA
    .byte $00 ; |        | $B5CB
    .byte $60 ; | XX     | $B5CC
    .byte $00 ; |        | $B5CD
    .byte $00 ; |        | $B5CE
    .byte $00 ; |        | $B5CF
    .byte $FF ; |XXXXXXXX| $B5D0
    .byte $00 ; |        | $B5D1
    .byte $00 ; |        | $B5D2
    .byte $10 ; |   X    | $B5D3
    .byte $00 ; |        | $B5D4
    .byte $F0 ; |XXXX    | $B5D5
    .byte $00 ; |        | $B5D6
    .byte $FF ; |XXXXXXXX| $B5D7
    .byte $00 ; |        | $B5D8
    .byte $00 ; |        | $B5D9
LB5DA:
    .byte $00 ; |        | $B5DA
LB5DB:
    .byte $88 ; |X   X   | $B5DB
    .byte $00 ; |        | $B5DC
    .byte $B5 ; |X XX X X| $B5DD
    .byte $00 ; |        | $B5DE
    .byte $E2 ; |XXX   X | $B5DF
    .byte $01 ; |       X| $B5E0
    .byte $0F ; |    XXXX| $B5E1
LB5E2:
    .byte $FF ; |XXXXXXXX| $B5E2
LB5E3:
    .byte $78 ; | XXXX   | $B5E3
    .byte $FF ; |XXXXXXXX| $B5E4
    .byte $4B ; | X  X XX| $B5E5
    .byte $FF ; |XXXXXXXX| $B5E6
    .byte $1E ; |   XXXX | $B5E7
    .byte $FE ; |XXXXXXX | $B5E8
    .byte $F1 ; |XXXX   X| $B5E9
LB5EA:
    .byte $00 ; |        | $B5EA
LB5EB:
    .byte $CC ; |XX  XX  | $B5EB
    .byte $01 ; |       X| $B5EC
    .byte $0F ; |    XXXX| $B5ED
    .byte $01 ; |       X| $B5EE
    .byte $53 ; | X X  XX| $B5EF
    .byte $01 ; |       X| $B5F0
    .byte $96 ; |X  X XX | $B5F1
LB5F2:
    .byte $FF ; |XXXXXXXX| $B5F2
LB5F3:
    .byte $34 ; |  XX X  | $B5F3
    .byte $FE ; |XXXXXXX | $B5F4
    .byte $F1 ; |XXXX   X| $B5F5
    .byte $FE ; |XXXXXXX | $B5F6
    .byte $AD ; |X X XX X| $B5F7
    .byte $FE ; |XXXXXXX | $B5F8
    .byte $6A ; | XX X X | $B5F9
LB5FA:
    .byte $00 ; |        | $B5FA
    .byte $8A ; |X   X X | $B5FB
    .byte $84 ; |X    X  | $B5FC
    .byte $8C ; |X   XX  | $B5FD
    .byte $80 ; |X       | $B5FE
    .byte $78 ; | XXXX   | $B5FF
    .byte $7C ; | XXXXX  | $B600
    .byte $88 ; |X   X   | $B601
LB602:
    .byte $00 ; |        | $B602
    .byte $2C ; |  X XX  | $B603
    .byte $11 ; |   X   X| $B604
    .byte $1A ; |   XX X | $B605
    .byte $0E ; |    XXX | $B606
    .byte $20 ; |  X     | $B607
    .byte $14 ; |   X X  | $B608
    .byte $26 ; |  X  XX | $B609
LB60A:
    .byte $00 ; |        | $B60A
    .byte $18 ; |   XX   | $B60B
    .byte $1C ; |   XXX  | $B60C
    .byte $10 ; |   X    | $B60D
    .byte $12 ; |   X  X | $B60E
    .byte $20 ; |  X     | $B60F
    .byte $24 ; |  X  X  | $B610
    .byte $14 ; |   X X  | $B611
LB612:
    .byte $00 ; |        | $B612
    .byte $8A ; |X   X X | $B613
    .byte $72 ; | XXX  X | $B614
    .byte $84 ; |X    X  | $B615
    .byte $78 ; | XXXX   | $B616
    .byte $7E ; | XXXXXX | $B617
    .byte $8A ; |X   X X | $B618
    .byte $6C ; | XX XX  | $B619

LB61A:
    lda    $C2                   ; 3
    and    #$09                  ; 2
    bne    LB636                 ; 2³
    lda    $E1                   ; 3
    bpl    LB628                 ; 2³
    lda    #1                    ; 2
    bne    LB62A                 ; 2³
LB628:
    lda    #$10                  ; 2
LB62A:
    and    $EE                   ; 3
    bne    LB637                 ; 2³
    lda    $F1B5                 ; 4
    and    #$7F                  ; 2
    sta    $F0B5                 ; 4
LB636:
    rts                          ; 6

LB637:
    lda    $F1B5                 ; 4
    bmi    LB636                 ; 2³
    and    #$0F                  ; 2
    cmp    #9                    ; 2
    bcs    LB636                 ; 2³
    tay                          ; 2
LB643:
    lda    $F182,Y               ; 4
    bpl    LB64E                 ; 2³
    iny                          ; 2
    cpy    #9                    ; 2
    bcc    LB643                 ; 2³
    rts                          ; 6

LB64E:
    lda    #$34                  ; 2
    sta    $CA                   ; 3
    lda    #$40                  ; 2
    ora    $F182,Y               ; 4
    sta    $A8                   ; 3
    and    #$0F                  ; 2
    sta    $AC                   ; 3
    ldx    $F1B5                 ; 4
    inx                          ; 2
    stx    $F0B5                 ; 4
    ldx    $BA                   ; 3
    lda    $F149,X               ; 4
    clc                          ; 2
    adc    #2                    ; 2
    sta    $A9                   ; 3
    sty    $AD                   ; 3
    jsr    LB8AB                 ; 6
    lda    $F161                 ; 4
    clc                          ; 2
    adc    #4                    ; 2
    sta    $F094,X               ; 5
    lda    $F159                 ; 4
    and    #$0F                  ; 2
    sta    $AE                   ; 3
    lda    $F18B,X               ; 4
    and    #$F0                  ; 2
    ora    $AE                   ; 3
    sta    $F08B,X               ; 5
    lda    $F1B5                 ; 4
    ora    #$80                  ; 2
    sta    $F0B5                 ; 4
    rts                          ; 6

LB696:
    lda    $C2                   ; 3
    and    #$09                  ; 2
    bne    LB6A4                 ; 2³
    lda    $C3                   ; 3
    beq    LB6A4                 ; 2³
    lda    $B9                   ; 3
    beq    LB6A5                 ; 2³
LB6A4:
    rts                          ; 6

LB6A5:
    dec    $C1                   ; 5
    bpl    LB6A4                 ; 2³
    lda    $D6                   ; 3
    cmp    #3                    ; 2
    bcs    LB6A4                 ; 2³
    lda    $F1B5                 ; 4
    and    #$0F                  ; 2
    cmp    #9                    ; 2
    bcs    LB6A4                 ; 2³
    tay                          ; 2
    lda    $F148                 ; 4
    cmp    #$10                  ; 2
    bcc    LB6C2                 ; 2³
    lda    #$0F                  ; 2
LB6C2:
    tax                          ; 2
    lda    LB822,X               ; 4
    sta    $C1                   ; 3
LB6C8:
    lda    $F182,Y               ; 4
    bmi    LB6D4                 ; 2³
    iny                          ; 2
    cpy    #9                    ; 2
    bcc    LB6C8                 ; 2³
    bcs    LB6A4                 ; 2³
LB6D4:
    ora    #$40                  ; 2
    sta    $A8                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    stx    $AC                   ; 3
    sty    $AD                   ; 3
    lda    $F1B5                 ; 4
    clc                          ; 2
    adc    #1                    ; 2
    sta    $F0B5                 ; 4
    lda    #$FF                  ; 2
    sta    $AA                   ; 3
    sta    $AB                   ; 3
    sta    $AE                   ; 3
    ldy    #0                    ; 2
LB6F2:
    lda    $F151,Y               ; 4
    bmi    LB71A                 ; 2³+1
    and    #$0F                  ; 2
    tax                          ; 2
    lda    $F151,Y               ; 4
    and    #$70                  ; 2
    cmp    #$30                  ; 2
    bne    LB707                 ; 2³
    sty    $AA                   ; 3
    bpl    LB715                 ; 2³
LB707:
    cmp    #$20                  ; 2
    bne    LB70F                 ; 2³
    sty    $AE                   ; 3
    bpl    LB715                 ; 2³
LB70F:
    cmp    #$50                  ; 2
    bne    LB715                 ; 2³
    sty    $AB                   ; 3
LB715:
    iny                          ; 2
    cpy    #8                    ; 2
    bcc    LB6F2                 ; 2³+1
LB71A:
    lda    $AE                   ; 3
    bpl    LB727                 ; 2³
    lda    $AA                   ; 3
    bpl    LB727                 ; 2³
    lda    $AB                   ; 3
    bpl    LB727                 ; 2³
    rts                          ; 6

LB727:
    lda    $B8                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    LB833,X               ; 4
    bne    LB73E                 ; 2³
LB731:
    ldy    $AA                   ; 3
    bmi    LB740                 ; 2³
    lda    $F151,Y               ; 4
    and    #$0F                  ; 2
    sta    $AB                   ; 3
    bpl    LB75C                 ; 2³
LB73E:
    bmi    LB74F                 ; 2³
LB740:
    ldy    $AB                   ; 3
    bmi    LB74F                 ; 2³
    sty    $AA                   ; 3
    lda    $F151,Y               ; 4
    and    #$0F                  ; 2
    sta    $AB                   ; 3
    bpl    LB75C                 ; 2³
LB74F:
    ldy    $AE                   ; 3
    bmi    LB731                 ; 2³
    sty    $AA                   ; 3
    lda    $F151,Y               ; 4
    and    #$0F                  ; 2
    sta    $AB                   ; 3
LB75C:
    ldy    $AA                   ; 3
    lda    $F149,Y               ; 4
    clc                          ; 2
    adc    #3                    ; 2
    sta    $A9                   ; 3
    jsr    LB8AB                 ; 6
    sty    $AD                   ; 3
    lda    #0                    ; 2
    sta    $A8                   ; 3
    ldx    $AB                   ; 3
    ldy    $AC                   ; 3
    lda    $F161,X               ; 4
    clc                          ; 2
    adc    #4                    ; 2
    sta    $F094,Y               ; 5
    sec                          ; 2
    lda    $F161                 ; 4
    sbc    $F161,X               ; 4
    sta    $AE                   ; 3
    bpl    LB791                 ; 2³
    lda    #$FF                  ; 2
    eor    $AE                   ; 3
    sta    $AE                   ; 3
    lda    #8                    ; 2
    sta    $A8                   ; 3
LB791:
    ldx    $AA                   ; 3
    ldy    $BA                   ; 3
    sec                          ; 2
    lda    $F149,Y               ; 4
    sbc    $F149,X               ; 4
    sta    $AF                   ; 3
    bpl    LB7AD                 ; 2³
    lda    #$FF                  ; 2
    eor    $AF                   ; 3
    sta    $AF                   ; 3
    lda    #4                    ; 2
    clc                          ; 2
    adc    $A8                   ; 3
    sta    $A8                   ; 3
LB7AD:
    lda    $AE                   ; 3
    ora    $AF                   ; 3
    and    #$F0                  ; 2
    beq    LB7CB                 ; 2³
    lda    $AF                   ; 3
    and    #$E0                  ; 2
    clc                          ; 2
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    sta    $AF                   ; 3
    lda    $AE                   ; 3
    and    #$E0                  ; 2
    clc                          ; 2
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    bcc    LB7D7                 ; 2³
LB7CB:
    lda    $AF                   ; 3
    and    #$0E                  ; 2
    lsr                          ; 2
    sta    $AF                   ; 3
    lda    $AE                   ; 3
    and    #$0E                  ; 2
    lsr                          ; 2
LB7D7:
    tax                          ; 2
    lda    LB843,X               ; 4
    clc                          ; 2
    adc    $AF                   ; 3
    tax                          ; 2
    lda    LB84A,X               ; 4
    adc    $A8                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    LB87B,X               ; 4
    sta    $AE                   ; 3
    and    #$03                  ; 2
    bne    LB7FC                 ; 2³
    lda    $A8                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    ora    $AE                   ; 3
    tax                          ; 2
    lda    LB88B,X               ; 4
    sta    $AE                   ; 3
LB7FC:
    ldy    $AC                   ; 3
    lda    $F18B,Y               ; 4
    and    #$F0                  ; 2
    ora    $AE                   ; 3
    sta    $F08B,Y               ; 5
    ldx    $F148                 ; 4
    cpx    #$10                  ; 2
    bcc    LB811                 ; 2³
    ldx    #$0F                  ; 2
LB811:
    lda    LB99B,Y               ; 4
    sta    $F0AC,Y               ; 5
    lda    #$40                  ; 2
    ora    $F1B5                 ; 4
    sta    $F0B5                 ; 4
    inc    $D6                   ; 5
    rts                          ; 6

LB822:
    .byte $00 ; |        | $B822
    .byte $20 ; |  X     | $B823
    .byte $10 ; |   X    | $B824
    .byte $0C ; |    XX  | $B825
    .byte $0A ; |    X X | $B826
    .byte $08 ; |    X   | $B827
    .byte $06 ; |     XX | $B828
    .byte $04 ; |     X  | $B829
    .byte $02 ; |      X | $B82A
    .byte $01 ; |       X| $B82B
    .byte $01 ; |       X| $B82C
    .byte $01 ; |       X| $B82D
    .byte $01 ; |       X| $B82E
    .byte $01 ; |       X| $B82F
    .byte $01 ; |       X| $B830
    .byte $01 ; |       X| $B831
    .byte $01 ; |       X| $B832
LB833:
    .byte $00 ; |        | $B833
    .byte $00 ; |        | $B834
    .byte $00 ; |        | $B835
    .byte $80 ; |X       | $B836
    .byte $00 ; |        | $B837
    .byte $00 ; |        | $B838
    .byte $00 ; |        | $B839
    .byte $80 ; |X       | $B83A
    .byte $00 ; |        | $B83B
    .byte $00 ; |        | $B83C
    .byte $00 ; |        | $B83D
    .byte $80 ; |X       | $B83E
    .byte $00 ; |        | $B83F
    .byte $00 ; |        | $B840
    .byte $00 ; |        | $B841
    .byte $01 ; |       X| $B842
LB843:
    .byte $00 ; |        | $B843
    .byte $07 ; |     XXX| $B844
    .byte $0E ; |    XXX | $B845
    .byte $15 ; |   X X X| $B846
    .byte $1C ; |   XXX  | $B847
    .byte $23 ; |  X   XX| $B848
    .byte $2A ; |  X X X | $B849
LB84A:
    .byte $02 ; |      X | $B84A
    .byte $00 ; |        | $B84B
    .byte $00 ; |        | $B84C
    .byte $00 ; |        | $B84D
    .byte $00 ; |        | $B84E
    .byte $00 ; |        | $B84F
    .byte $00 ; |        | $B850
    .byte $04 ; |     X  | $B851
    .byte $02 ; |      X | $B852
    .byte $01 ; |       X| $B853
    .byte $01 ; |       X| $B854
    .byte $01 ; |       X| $B855
    .byte $01 ; |       X| $B856
    .byte $01 ; |       X| $B857
    .byte $04 ; |     X  | $B858
    .byte $03 ; |      XX| $B859
    .byte $02 ; |      X | $B85A
    .byte $01 ; |       X| $B85B
    .byte $01 ; |       X| $B85C
    .byte $01 ; |       X| $B85D
    .byte $01 ; |       X| $B85E
    .byte $04 ; |     X  | $B85F
    .byte $03 ; |      XX| $B860
    .byte $03 ; |      XX| $B861
    .byte $02 ; |      X | $B862
    .byte $02 ; |      X | $B863
    .byte $02 ; |      X | $B864
    .byte $01 ; |       X| $B865
    .byte $04 ; |     X  | $B866
    .byte $03 ; |      XX| $B867
    .byte $03 ; |      XX| $B868
    .byte $02 ; |      X | $B869
    .byte $02 ; |      X | $B86A
    .byte $02 ; |      X | $B86B
    .byte $02 ; |      X | $B86C
    .byte $04 ; |     X  | $B86D
    .byte $03 ; |      XX| $B86E
    .byte $03 ; |      XX| $B86F
    .byte $03 ; |      XX| $B870
    .byte $02 ; |      X | $B871
    .byte $02 ; |      X | $B872
    .byte $02 ; |      X | $B873
    .byte $04 ; |     X  | $B874
    .byte $03 ; |      XX| $B875
    .byte $03 ; |      XX| $B876
    .byte $03 ; |      XX| $B877
    .byte $02 ; |      X | $B878
    .byte $02 ; |      X | $B879
    .byte $02 ; |      X | $B87A
LB87B:
    .byte $04 ; |     X  | $B87B
    .byte $07 ; |     XXX| $B87C
    .byte $06 ; |     XX | $B87D
    .byte $05 ; |     X X| $B87E
    .byte $08 ; |    X   | $B87F
    .byte $01 ; |       X| $B880
    .byte $02 ; |      X | $B881
    .byte $03 ; |      XX| $B882
    .byte $0C ; |    XX  | $B883
    .byte $09 ; |    X  X| $B884
    .byte $0A ; |    X X | $B885
    .byte $0B ; |    X XX| $B886
    .byte $00 ; |        | $B887
    .byte $0F ; |    XXXX| $B888
    .byte $0E ; |    XXX | $B889
    .byte $0D ; |    XX X| $B88A
LB88B:
    .byte $FF ; |XXXXXXXX| $B88B
    .byte $04 ; |     X  | $B88C
    .byte $0C ; |    XX  | $B88D
    .byte $00 ; |        | $B88E
    .byte $08 ; |    X   | $B88F
    .byte $FF ; |XXXXXXXX| $B890
    .byte $0C ; |    XX  | $B891
    .byte $0C ; |    XX  | $B892
    .byte $04 ; |     X  | $B893
    .byte $00 ; |        | $B894
    .byte $FF ; |XXXXXXXX| $B895
    .byte $0C ; |    XX  | $B896
    .byte $04 ; |     X  | $B897
    .byte $04 ; |     X  | $B898
    .byte $08 ; |    X   | $B899
    .byte $0C ; |    XX  | $B89A
    .byte $1E ; |   XXXX | $B89B
    .byte $20 ; |  X     | $B89C
    .byte $23 ; |  X   XX| $B89D
    .byte $26 ; |  X  XX | $B89E
    .byte $29 ; |  X X  X| $B89F
    .byte $2C ; |  X XX  | $B8A0
    .byte $2F ; |  X XXXX| $B8A1
    .byte $32 ; |  XX  X | $B8A2
    .byte $35 ; |  XX X X| $B8A3
    .byte $38 ; |  XXX   | $B8A4
    .byte $3B ; |  XXX XX| $B8A5
    .byte $3E ; |  XXXXX | $B8A6
    .byte $41 ; | X     X| $B8A7
    .byte $44 ; | X   X  | $B8A8
    .byte $47 ; | X   XXX| $B8A9
    .byte $4A ; | X  X X | $B8AA

LB8AB:
    lda    $F1B5                 ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    dey                          ; 2
    beq    LB8C3                 ; 2³
LB8B4:
    dey                          ; 2
    lda    $A9                   ; 3
    cmp    $F179,Y               ; 4
    bcs    LB8C2                 ; 2³
    cpy    #0                    ; 2
    bne    LB8B4                 ; 2³
    beq    LB8C3                 ; 2³
LB8C2:
    iny                          ; 2
LB8C3:
    sty    $AE                   ; 3
LB8C5:
    ldx    $F179,Y               ; 4
    lda    $A9                   ; 3
    sta    $F079,Y               ; 5
    stx    $A9                   ; 3
    ldx    $F182,Y               ; 4
    lda    $A8                   ; 3
    sta    $F082,Y               ; 5
    stx    $A8                   ; 3
    iny                          ; 2
    cpy    $AD                   ; 3
    bcc    LB8C5                 ; 2³
    beq    LB8C5                 ; 2³
    ldx    $AC                   ; 3
    ldy    $AE                   ; 3
    rts                          ; 6

LB8E5:
    ldy    #0                    ; 2
LB8E7:
    lda    $F182,Y               ; 4
    and    #$40                  ; 2
    bne    LB8EF                 ; 2³
    rts                          ; 6

LB8EF:
    lda    $F182,Y               ; 4
    and    #$0F                  ; 2
    sta    $AC                   ; 3
    sty    $AD                   ; 3
    tax                          ; 2
    lda    $F18B,X               ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    clc                          ; 2
    lda    LB9C1,Y               ; 4
    adc    $F19D,X               ; 4
    sta    $F09D,X               ; 5
    lda    LB9D1,Y               ; 4
    adc    $F194,X               ; 4
    sta    $F094,X               ; 5
    sec                          ; 2
    sbc    #6                    ; 2
    cmp    #$98                  ; 2
    bcs    LB944                 ; 2³
    lda    LB9E1,Y               ; 4
    adc    $F1A6,X               ; 4
    sta    $F0A6,X               ; 5
    lda    LB9F1,Y               ; 4
    ldy    $AD                   ; 3
    adc    $F179,Y               ; 4
    sta    $F079,Y               ; 5
    cmp    #$9E                  ; 2
    bcs    LB944                 ; 2³
    cmp    #$64                  ; 2
    bcs    LB95A                 ; 2³
    cmp    #$3B                  ; 2
    bcc    LB95A                 ; 2³
    lda    $F194,X               ; 4
    cmp    #$72                  ; 2
    bcs    LB95A                 ; 2³
    cmp    #$31                  ; 2
    bcc    LB95A                 ; 2³
LB944:
    ldy    $AD                   ; 3
    lda    $F182,Y               ; 4
    bpl    LB94D                 ; 2³
    dec    $D6                   ; 5
LB94D:
    jsr    LBCDD                 ; 6
    ldx    $F1B5                 ; 4
    dex                          ; 2
    stx    $F0B5                 ; 4
    jmp    LB9B9                 ; 3
LB95A:
    ldy    $AD                   ; 3
    ldx    $AC                   ; 3
LB95E:
    lda    $F1B5                 ; 4
    and    #$0F                  ; 2
    sec                          ; 2
    sbc    #1                    ; 2
    cmp    $AD                   ; 3
    bcs    LB98E                 ; 2³
    lda    $F17A,Y               ; 4
    cmp    $F179,Y               ; 4
    bcs    LB98E                 ; 2³
    ldx    $F179,Y               ; 4
    sta    $F079,Y               ; 5
    txa                          ; 2
    sta    $F07A,Y               ; 5
    lda    $F182,Y               ; 4
    ldx    $F183,Y               ; 4
    sta    $F083,Y               ; 5
    txa                          ; 2
    sta    $F082,Y               ; 5
    iny                          ; 2
    sty    $AD                   ; 3
    bne    LB95E                 ; 2³
LB98E:
    ldx    $AC                   ; 3
    ldy    $AD                   ; 3
    beq    LB9B8                 ; 2³
    lda    $F179,Y               ; 4
    cmp    $F178,Y               ; 4
    bcs    LB9B8                 ; 2³
    ldx    $F178,Y               ; 4
    sta    $F078,Y               ; 5
    txa                          ; 2
    sta    $F079,Y               ; 5
    lda    $F182,Y               ; 4
    ldx    $F181,Y               ; 4
    sta    $F081,Y               ; 5
    txa                          ; 2
    sta    $F082,Y               ; 5
    dey                          ; 2
    sty    $AD                   ; 3
    bne    LB98E                 ; 2³
LB9B8:
    iny                          ; 2
LB9B9:
    cpy    #9                    ; 2
    bcs    LB9C0                 ; 2³
    jmp    LB8E7                 ; 3
LB9C0:
    rts                          ; 6

LB9C1:
    .byte $00 ; |        | $B9C1
    .byte $DB ; |XX XX XX| $B9C2
    .byte $98 ; |X  XX   | $B9C3
    .byte $13 ; |   X  XX| $B9C4
    .byte $40 ; | X      | $B9C5
    .byte $13 ; |   X  XX| $B9C6
    .byte $98 ; |X  XX   | $B9C7
    .byte $DB ; |XX XX XX| $B9C8
    .byte $00 ; |        | $B9C9
    .byte $25 ; |  X  X X| $B9CA
    .byte $68 ; | XX X   | $B9CB
    .byte $ED ; |XXX XX X| $B9CC
    .byte $C0 ; |XX      | $B9CD
    .byte $ED ; |XXX XX X| $B9CE
    .byte $68 ; | XX X   | $B9CF
    .byte $25 ; |  X  X X| $B9D0
LB9D1:
    .byte $00 ; |        | $B9D1
    .byte $00 ; |        | $B9D2
    .byte $01 ; |       X| $B9D3
    .byte $02 ; |      X | $B9D4
    .byte $02 ; |      X | $B9D5
    .byte $02 ; |      X | $B9D6
    .byte $01 ; |       X| $B9D7
    .byte $00 ; |        | $B9D8
    .byte $00 ; |        | $B9D9
    .byte $FF ; |XXXXXXXX| $B9DA
    .byte $FE ; |XXXXXXX | $B9DB
    .byte $FD ; |XXXXXX X| $B9DC
    .byte $FD ; |XXXXXX X| $B9DD
    .byte $FD ; |XXXXXX X| $B9DE
    .byte $FE ; |XXXXXXX | $B9DF
    .byte $FF ; |XXXXXXXX| $B9E0
LB9E1:
    .byte $62 ; | XX   X | $B9E1
    .byte $E2 ; |XXX   X | $B9E2
    .byte $9C ; |X  XXX  | $B9E3
    .byte $B6 ; |X XX XX | $B9E4
    .byte $00 ; |        | $B9E5
    .byte $4A ; | X  X X | $B9E6
    .byte $64 ; | XX  X  | $B9E7
    .byte $1E ; |   XXXX | $B9E8
    .byte $60 ; | XX     | $B9E9
    .byte $1E ; |   XXXX | $B9EA
    .byte $64 ; | XX  X  | $B9EB
    .byte $4A ; | X  X X | $B9EC
    .byte $00 ; |        | $B9ED
    .byte $B6 ; |X XX XX | $B9EE
    .byte $9C ; |X  XXX  | $B9EF
    .byte $E2 ; |XXX   X | $B9F0
LB9F1:
    .byte $FC ; |XXXXXX  | $B9F1
    .byte $FD ; |XXXXXX X| $B9F2
    .byte $FD ; |XXXXXX X| $B9F3
    .byte $FE ; |XXXXXXX | $B9F4
    .byte $00 ; |        | $B9F5
    .byte $01 ; |       X| $B9F6
    .byte $02 ; |      X | $B9F7
    .byte $03 ; |      XX| $B9F8
    .byte $03 ; |      XX| $B9F9
    .byte $03 ; |      XX| $B9FA
    .byte $02 ; |      X | $B9FB
    .byte $01 ; |       X| $B9FC
    .byte $00 ; |        | $B9FD
    .byte $FE ; |XXXXXXX | $B9FE
    .byte $FD ; |XXXXXX X| $B9FF
    .byte $FD ; |XXXXXX X| $BA00

LBA01:
    lda    $C2                   ; 3
    and    #$09                  ; 2
    bne    LBA69                 ; 2³
    ldy    $BA                   ; 3
    sty    $AD                   ; 3
    cpy    $BB                   ; 3
    beq    LBA3C                 ; 2³
    ldx    $AD                   ; 3
    inx                          ; 2
LBA12:
    sec                          ; 2
    lda    $F149,X               ; 4
    sbc    $F149,Y               ; 4
    cmp    #5                    ; 2
    bcs    LBA3C                 ; 2³
    stx    $AB                   ; 3
    lda    $F151,X               ; 4
    and    #$0F                  ; 2
    tax                          ; 2
    lda    $F161                 ; 4
    adc    #7                    ; 2
    sec                          ; 2
    sbc    $F161,X               ; 4
    cmp    #$0B                  ; 2
    bcc    LBA6A                 ; 2³
    inc    $AB                   ; 5
    ldx    $AB                   ; 3
    inx                          ; 2
    cpx    $BB                   ; 3
    dex                          ; 2
    bcc    LBA12                 ; 2³
LBA3C:
    cpy    #0                    ; 2
    beq    LBA69                 ; 2³
    ldx    $AD                   ; 3
    dex                          ; 2
LBA43:
    sec                          ; 2
    lda    $F149,Y               ; 4
    sbc    $F149,X               ; 4
    cmp    #5                    ; 2
    bcs    LBA69                 ; 2³
    stx    $AB                   ; 3
    lda    $F151,X               ; 4
    and    #$0F                  ; 2
    tax                          ; 2
    lda    $F161                 ; 4
    adc    #7                    ; 2
    sec                          ; 2
    sbc    $F161,X               ; 4
    cmp    #$0B                  ; 2
    bcc    LBA6A                 ; 2³
    dec    $AB                   ; 5
    ldx    $AB                   ; 3
    bpl    LBA43                 ; 2³
LBA69:
    rts                          ; 6

LBA6A:
    stx    $AA                   ; 3
    dec    $BB                   ; 5
    lda    #1                    ; 2
    sta    $F1                   ; 3
    lda    #$4B                  ; 2
    sta    $CA                   ; 3
    lda    $C2                   ; 3
    and    #$FC                  ; 2
    ora    #$01                  ; 2
    sta    $C2                   ; 3
    ldx    $AB                   ; 3
    lda    $F151,X               ; 4
    and    #$70                  ; 2
    cmp    #$10                  ; 2
    bne    LBA93                 ; 2³
    dec    $C3                   ; 5
    lda    #$10                  ; 2
    jsr    LBD2C                 ; 6
    jmp    LBAB4                 ; 3
LBA93:
    cmp    #$20                  ; 2
    bne    LBAA1                 ; 2³
    dec    $C3                   ; 5
    lda    #$15                  ; 2
    jsr    LBD2C                 ; 6
    jmp    LBAB4                 ; 3
LBAA1:
    cmp    #$30                  ; 2
    bne    LBAAF                 ; 2³
    dec    $C3                   ; 5
    lda    #$25                  ; 2
    jsr    LBD2C                 ; 6
    jmp    LBAB4                 ; 3
LBAAF:
    lda    #5                    ; 2
    jsr    LBD2C                 ; 6
LBAB4:
    jsr    LBD08                 ; 6
    dec    $BB                   ; 5
    ldy    $AB                   ; 3
    lda    $F151,Y               ; 4
    and    #$70                  ; 2
    beq    LBAC3                 ; 2³
    dey                          ; 2
LBAC3:
    sty    $AB                   ; 3
    lda    $C3                   ; 3
    bne    LBAD4                 ; 2³
    lda    $F148                 ; 4
    and    #$03                  ; 2
    bne    LBAD4                 ; 2³
    lda    #$0A                  ; 2
    sta    $ED                   ; 3
LBAD4:
    jmp    LBD08                 ; 3
LBAD7:
    ldx    $BB                   ; 3
    bmi    LBAE4                 ; 2³
    lda    $F1B5                 ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    dey                          ; 2
    bpl    LBAE5                 ; 2³
LBAE4:
    rts                          ; 6

LBAE5:
    sty    $A8                   ; 3
    ldy    #0                    ; 2
    sta    $AE                   ; 3
    dey                          ; 2
    sty    $A9                   ; 3
    iny                          ; 2
    sty    $AD                   ; 3
LBAF1:
    lda    $F182,Y               ; 4
    and    #$0F                  ; 2
    sta    $AC                   ; 3
    lda    $F182,Y               ; 4
    bpl    LBB46                 ; 2³+1
    lda    $C2                   ; 3
    and    #$09                  ; 2
    bne    LBB25                 ; 2³
    ldx    $BA                   ; 3
    lda    $F179,Y               ; 4
    cmp    $F149,X               ; 4
    bcc    LBB25                 ; 2³
    sbc    $F149,X               ; 4
    cmp    #6                    ; 2
    bcs    LBB25                 ; 2³
    ldy    $AC                   ; 3
    lda    $F194,Y               ; 4
    cmp    $F161                 ; 4
    bcc    LBB25                 ; 2³
    sbc    $F161                 ; 4
    cmp    #7                    ; 2
    bcc    LBB28                 ; 2³
LBB25:
    jmp    LBB91                 ; 3
LBB28:
    dec    $D6                   ; 5
    lda    #1                    ; 2
    sta    $F1                   ; 3
    lda    #$4B                  ; 2
    sta    $CA                   ; 3
    lda    $C2                   ; 3
    and    #$FC                  ; 2
    ora    #$01                  ; 2
    sta    $C2                   ; 3
    lda    $BA                   ; 3
    sta    $AB                   ; 3
    jsr    LBD08                 ; 6
    dec    $BB                   ; 5
    jmp    LBC9C                 ; 3
LBB46:
    ldx    $A9                   ; 3
    inx                          ; 2
    stx    $AB                   ; 3
LBB4B:
    lda    $F151,X               ; 4
    and    #$70                  ; 2
    beq    LBB86                 ; 2³
    lda    $F179,Y               ; 4
    cmp    $F149,X               ; 4
    bcc    LBB91                 ; 2³
    sbc    $F149,X               ; 4
    cmp    #6                    ; 2
    bcs    LBB86                 ; 2³
    lda    $AE                   ; 3
    bne    LBB6D                 ; 2³
    lda    #$FF                  ; 2
    sta    $AE                   ; 3
    stx    $A9                   ; 3
    dec    $A9                   ; 5
LBB6D:
    lda    $F151,X               ; 4
    and    #$07                  ; 2
    tax                          ; 2
    sta    $AA                   ; 3
    ldy    $AC                   ; 3
    lda    $F194,Y               ; 4
    cmp    $F161,X               ; 4
    bcc    LBB86                 ; 2³
    sbc    $F161,X               ; 4
    cmp    #8                    ; 2
    bcc    LBBA2                 ; 2³
LBB86:
    ldx    $AB                   ; 3
    cpx    $BB                   ; 3
    bcs    LBB91                 ; 2³
    inx                          ; 2
    stx    $AB                   ; 3
    bne    LBB4B                 ; 2³
LBB91:
    ldy    $AD                   ; 3
    cpy    $A8                   ; 3
    bcs    LBBA1                 ; 2³
    iny                          ; 2
    sty    $AD                   ; 3
    lda    #0                    ; 2
    sta    $AE                   ; 3
    jmp    LBAF1                 ; 3
LBBA1:
    rts                          ; 6

LBBA2:
    dec    $BB                   ; 5
    ldx    $AB                   ; 3
    lda    $F151,X               ; 4
    and    #$70                  ; 2
    cmp    #$10                  ; 2
    bne    LBBBD                 ; 2³
    dec    $C3                   ; 5
    lda    #$46                  ; 2
    sta    $CA                   ; 3
    lda    #$10                  ; 2
    jsr    LBD2C                 ; 6
    jmp    LBC4A                 ; 3
LBBBD:
    cmp    #$20                  ; 2
    bne    LBBDD                 ; 2³
    dec    $C3                   ; 5
    lda    #0                    ; 2
    sta    $F0B6                 ; 4
    sta    $F0B7                 ; 4
    sta    $F0B8                 ; 4
    sta    $F0B9                 ; 4
    lda    #$54                  ; 2
    sta    $CA                   ; 3
    lda    #$15                  ; 2
    jsr    LBD2C                 ; 6
    jmp    LBC4A                 ; 3
LBBDD:
    cmp    #$30                  ; 2
    bne    LBC1A                 ; 2³+1
    dec    $C3                   ; 5
    lda    #0                    ; 2
    sta    $F0BA                 ; 4
    sta    $F0BB                 ; 4
    sta    $F0BC                 ; 4
    sta    $F0BD                 ; 4
    lda    #$56                  ; 2
    sta    $CA                   ; 3
    lda    #$25                  ; 2
    jsr    LBD2C                 ; 6
    lda    #1                    ; 2
    sta    $C9                   ; 3
    lda    #1                    ; 2
    sta    $C6                   ; 3
    lda    $F148                 ; 4
    cmp    #9                    ; 2
    bcc    LBC0B                 ; 2³
    lda    #8                    ; 2
LBC0B:
    tax                          ; 2
    lda    LBCCB,X               ; 4
    sta    $C7                   ; 3
    lda    $C8                   ; 3
    and    #$FE                  ; 2
    sta    $C8                   ; 3
    jmp    LBC4A                 ; 3
LBC1A:
    cmp    #$40                  ; 2
    bne    LBC2A                 ; 2³
    lda    #$62                  ; 2
    sta    $CA                   ; 3
    lda    #5                    ; 2
    jsr    LBD2C                 ; 6
    jmp    LBC4A                 ; 3
LBC2A:
    lda    $F148                 ; 4
    cmp    #9                    ; 2
    bcc    LBC33                 ; 2³
    lda    #8                    ; 2
LBC33:
    tax                          ; 2
    lda    LBCD4,X               ; 4
    adc    $C7                   ; 3
    sta    $C7                   ; 3
    lda    #$55                  ; 2
    sta    $CA                   ; 3
    dec    $C3                   ; 5
    lda    #$15                  ; 2
    jsr    LBD2C                 ; 6
    lda    #1                    ; 2
    sta    $C6                   ; 3
LBC4A:
    lda    $C3                   ; 3
    bne    LBC5A                 ; 2³
    lda    $C2                   ; 3
    bne    LBC5A                 ; 2³
    ora    #$02                  ; 2
    sta    $C2                   ; 3
    lda    #$70                  ; 2
    sta    $C9                   ; 3
LBC5A:
    jsr    LBD08                 ; 6
    lda    $CA                   ; 3
    cmp    #$56                  ; 2
    bne    LBC6F                 ; 2³
    lda    #$54                  ; 2
    sta    $CA                   ; 3
    bne    LBC9C                 ; 2³
    lda    $C3                   ; 3
    beq    LBC9C                 ; 2³
    lda    $CA                   ; 3
LBC6F:
    cmp    #$54                  ; 2
    beq    LBC80                 ; 2³
    cmp    #$55                  ; 2
    bne    LBC9C                 ; 2³
    lda    $C8                   ; 3
    and    #$FE                  ; 2
    sta    $C8                   ; 3
    jmp    LBC9C                 ; 3
LBC80:
    ldy    #0                    ; 2
LBC82:
    lda    $F151,Y               ; 4
    and    #$70                  ; 2
    cmp    #$10                  ; 2
    beq    LBC92                 ; 2³
    cpy    $BB                   ; 3
    bcs    LBC9C                 ; 2³
    iny                          ; 2
    bne    LBC82                 ; 2³
LBC92:
    lda    $F151,Y               ; 4
    and    #$8F                  ; 2
    ora    #$20                  ; 2
    sta    $F051,Y               ; 5
LBC9C:
    ldx    $CA                   ; 3
    cpx    #$55                  ; 2
    bne    LBCA5                 ; 2³
    dex                          ; 2
    stx    $CA                   ; 3
LBCA5:
    jsr    LBCDD                 ; 6
    lda    $F1B5                 ; 4
    sec                          ; 2
    sbc    #1                    ; 2
    ora    #$40                  ; 2
    sta    $F0B5                 ; 4
    lda    $C3                   ; 3
    bne    LBCCA                 ; 2³
    lda    $F148                 ; 4
    and    #$03                  ; 2
    bne    LBCCA                 ; 2³
    lda    #$0A                  ; 2
    sta    $ED                   ; 3
    lda    $F1                   ; 3
    bne    LBCCA                 ; 2³
    lda    #$6B                  ; 2
    sta    $CA                   ; 3
LBCCA:
    rts                          ; 6

LBCCB:
    .byte $00 ; |        | $BCCB
    .byte $01 ; |       X| $BCCC
    .byte $43 ; | X    XX| $BCCD
    .byte $25 ; |  X  X X| $BCCE
    .byte $0F ; |    XXXX| $BCCF
    .byte $0C ; |    XX  | $BCD0
    .byte $09 ; |    X  X| $BCD1
    .byte $06 ; |     XX | $BCD2
    .byte $03 ; |      XX| $BCD3
LBCD4:
    .byte $00 ; |        | $BCD4
    .byte $0A ; |    X X | $BCD5
    .byte $0A ; |    X X | $BCD6
    .byte $08 ; |    X   | $BCD7
    .byte $06 ; |     XX | $BCD8
    .byte $04 ; |     X  | $BCD9
    .byte $02 ; |      X | $BCDA
    .byte $02 ; |      X | $BCDB
    .byte $02 ; |      X | $BCDC

LBCDD:
    ldy    $AD                   ; 3
    lda    $F182,Y               ; 4
    and    #$BF                  ; 2
    sta    $A8                   ; 3
LBCE6:
    cpy    #8                    ; 2
    bcs    LBD00                 ; 2³+1
    lda    $F183,Y               ; 4
    and    #$40                  ; 2
    beq    LBD00                 ; 2³+1
    lda    $F183,Y               ; 4
    sta    $F082,Y               ; 5
    lda    $F17A,Y               ; 4
    sta    $F079,Y               ; 5
    iny                          ; 2
    bne    LBCE6                 ; 2³
LBD00:
    lda    $A8                   ; 3
    sta    $F082,Y               ; 5
    ldy    $AD                   ; 3
    rts                          ; 6

LBD08:
    ldy    $AB                   ; 3
    lda    $F151,Y               ; 4
    ora    #$80                  ; 2
    sta    $A8                   ; 3
LBD11:
    cpy    #7                    ; 2
    bcs    LBD26                 ; 2³
    lda    $F152,Y               ; 4
    bmi    LBD26                 ; 2³
    sta    $F051,Y               ; 5
    lda    $F14A,Y               ; 4
    sta    $F049,Y               ; 5
    iny                          ; 2
    bne    LBD11                 ; 2³
LBD26:
    lda    $A8                   ; 3
    sta    $F051,Y               ; 5
    rts                          ; 6

LBD2C:
    sed                          ; 2
    clc                          ; 2
    adc    $F145                 ; 4
    sta    $F045                 ; 4
    bcc    LBD5A                 ; 2³
    lda    #0                    ; 2
    adc    $F146                 ; 4
    sta    $F046                 ; 4
    cld                          ; 2
    cmp    #3                    ; 2
    beq    LBD4B                 ; 2³
    cmp    #8                    ; 2
    beq    LBD4B                 ; 2³
    cmp    #$15                  ; 2
    bne    LBD5A                 ; 2³
LBD4B:
    lda    $F1                   ; 3
    bne    LBD53                 ; 2³
    lda    #$6B                  ; 2
    sta    $DA                   ; 3
LBD53:
    ldx    $F147                 ; 4
    inx                          ; 2
    stx    $F047                 ; 4
LBD5A:
    cld                          ; 2
    rts                          ; 6

LBD5C:
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    beq    LBD8E                 ; 2³
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcc    LBD5C                 ; 2³
    lsr                          ; 2
    bcc    LBD5C                 ; 2³
    lda    $F147                 ; 4
    beq    LBD5C                 ; 2³
    lda    $F1                   ; 3
    bne    LBD7B                 ; 2³
    ldx    #0                    ; 2
    jsr    LBE1D                 ; 6
LBD7B:
    lda    $F1                   ; 3
    beq    LBD89                 ; 2³
    lda    $CA                   ; 3
    cmp    #$4B                  ; 2
    beq    LBD89                 ; 2³
    lda    #0                    ; 2
    sta    $CA                   ; 3
LBD89:
    ldx    #1                    ; 2
    jsr    LBE1D                 ; 6
LBD8E:
    lda    $C2                   ; 3
    and    #$89                  ; 2
    bne    LBD99                 ; 2³
    lda    $F147                 ; 4
    bne    LBD9C                 ; 2³
LBD99:
    jmp    LBE0D                 ; 3
LBD9C:
    lda    #$FF                  ; 2
    sta    $A8                   ; 3
    sta    $A9                   ; 3
    ldx    #0                    ; 2
LBDA4:
    lda    $F151,X               ; 4
    and    #$70                  ; 2
    cmp    #$20                  ; 2
    bne    LBDB2                 ; 2³
    stx    $A8                   ; 3
    jmp    LBDB8                 ; 3
LBDB2:
    cmp    #$30                  ; 2
    bne    LBDB8                 ; 2³
    stx    $A9                   ; 3
LBDB8:
    cpx    $01BB                 ; 4
    beq    LBDC0                 ; 2³
    inx                          ; 2
    bne    LBDA4                 ; 2³
LBDC0:
    lda    $A8                   ; 3
    bmi    LBDF4                 ; 2³
    tax                          ; 2
    lda    $F151,X               ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    clc                          ; 2
    lda    $F1B8                 ; 4
    adc    $F169,Y               ; 4
    sta    $F069,Y               ; 5
    lda    $F1B9                 ; 4
    adc    $F161,Y               ; 4
    sta    $F061,Y               ; 5
    clc                          ; 2
    lda    $F1B6                 ; 4
    adc    $F171,Y               ; 4
    sta    $F071,Y               ; 5
    lda    $F1B7                 ; 4
    adc    $F149,X               ; 4
    sta    $F049,X               ; 5
    jsr    LB4D4                 ; 6
LBDF4:
    lda    $A9                   ; 3
    bmi    LBE0D                 ; 2³+1
    tax                          ; 2
    sta    $AC                   ; 3
    lda    $F151,X               ; 4
    and    #$0F                  ; 2
    sta    $AD                   ; 3
    lda    #$F8                  ; 2
    sta    $AE                   ; 3
    lda    #$FE                  ; 2
    sta    $AF                   ; 3
    jmp    LBFEF                 ; 3
LBE0D:
    lda    TIMINT                ; 4
    bpl    LBE0D                 ; 2³
    lda    #$50                  ; 2
    sta    $AE                   ; 3
    lda    #$F2                  ; 2
    sta    $AF                   ; 3
    jmp    LBFEF                 ; 3
LBE1D:
    beq    LBE2F                 ; 2³
    ldy    $CB,X                 ; 4
    cpy    #$6B                  ; 2
    beq    LBE55                 ; 2³
    lda    $DA                   ; 3
    beq    LBE2F                 ; 2³
    sta    $C9,X                 ; 4
    lda    #0                    ; 2
    sta    $DA                   ; 3
LBE2F:
    lda    $C9,X                 ; 4
    bne    LBE76                 ; 2³
    ldy    $CB,X                 ; 4
    bne    LBE3A                 ; 2³
    jmp    LBED5                 ; 3
LBE3A:
    lda    $E1                   ; 3
    bpl    LBE42                 ; 2³
    lda    #2                    ; 2
    bne    LBE44                 ; 2³
LBE42:
    lda    #$20                  ; 2
LBE44:
    and    $EE                   ; 3
    bne    LBE55                 ; 2³
    lda    $CB,X                 ; 4
    cmp    #$59                  ; 2
    bne    LBE51                 ; 2³
LBE4E:
    jmp    LBF00                 ; 3
LBE51:
    cmp    #$5D                  ; 2
    beq    LBE4E                 ; 2³
LBE55:
    lda    $CD,X                 ; 4
    beq    LBE5C                 ; 2³
    dec    $CD,X                 ; 6
    rts                          ; 6

LBE5C:
    lda    LBF32,Y               ; 4
    jsr    LBF2C                 ; 6
    sta    $CD,X                 ; 4
    beq    LBE68                 ; 2³
    inc    $CD,X                 ; 6
LBE68:
    dec    $CF,X                 ; 6
    beq    LBE6F                 ; 2³
    jmp    LBF07                 ; 3
LBE6F:
    lda    $CB,X                 ; 4
    clc                          ; 2
    adc    #4                    ; 2
    bne    LBEA5                 ; 2³
LBE76:
    tay                          ; 2
    cmp    #$5D                  ; 2
    bne    LBE8C                 ; 2³
    lda    $F147                 ; 4
    beq    LBE86                 ; 2³
    lda    $C2                   ; 3
    and    #$09                  ; 2
    beq    LBE8C                 ; 2³
LBE86:
    lda    #0                    ; 2
    sta    $CA                   ; 3
    beq    LBF00                 ; 2³+1
LBE8C:
    tya                          ; 2
    cmp    #$4B                  ; 2
    bne    LBE9B                 ; 2³
    lda    #0                    ; 2
    sta    $D5                   ; 3
    sta    $C9                   ; 3
    sta    $CB                   ; 3
    sta    AUDV0                 ; 3
LBE9B:
    txa                          ; 2
    bne    LBEA0                 ; 2³
    sty    $D5                   ; 3
LBEA0:
    tya                          ; 2
    ldy    #0                    ; 2
    sty    $C9,X                 ; 4
LBEA5:
    sta    $CB,X                 ; 4
    tay                          ; 2
    lda    LBF31,Y               ; 4
    beq    LBED5                 ; 2³
    sta    $CF,X                 ; 4
    lda    LBF32,Y               ; 4
    and    #$1F                  ; 2
    sta    AUDC0,X               ; 4
    lda    LBF32,Y               ; 4
    jsr    LBF2C                 ; 6
    sta    $CD,X                 ; 4
    beq    LBEC2                 ; 2³
    inc    $CD,X                 ; 6
LBEC2:
    lda    LBF34,Y               ; 4
    and    #$1F                  ; 2
    sta    AUDF0,X               ; 4
    sta    $D1,X                 ; 4
    lda    LBF33,Y               ; 4
    and    #$0F                  ; 2
    sta    AUDV0,X               ; 4
    sta    $D3,X                 ; 4
    rts                          ; 6

LBED5:
    txa                          ; 2
    bne    LBEED                 ; 2³
    lda    $D5                   ; 3
    cmp    #$24                  ; 2
    bcc    LBEEA                 ; 2³
    inc    $D8                   ; 5
    ldy    $D8                   ; 3
    cpy    #3                    ; 2
    bcc    LBEEA                 ; 2³
    stx    $D5                   ; 3
    lda    #$81                  ; 2
LBEEA:
    sta    $C9                   ; 3
    rts                          ; 6

LBEED:
    lda    $E1                   ; 3
    bpl    LBEF5                 ; 2³
    lda    #2                    ; 2
    bne    LBEF7                 ; 2³
LBEF5:
    lda    #$20                  ; 2
LBEF7:
    and    $EE                   ; 3
    beq    LBF00                 ; 2³+1
    lda    #$5D                  ; 2
    sta    $CA                   ; 3
    rts                          ; 6

LBF00:
    lda    #0                    ; 2
    sta    AUDV0,X               ; 4
    sta    $CB,X                 ; 4
    rts                          ; 6

LBF07:
    lda    LBF33,Y               ; 4
    jsr    LBF2D                 ; 6
    sec                          ; 2
    sbc    #8                    ; 2
    clc                          ; 2
    adc    $D3,X                 ; 4
    and    #$0F                  ; 2
    sta    $D3,X                 ; 4
    sta    AUDV0,X               ; 4
    lda    LBF34,Y               ; 4
    jsr    LBF2C                 ; 6
    sec                          ; 2
    sbc    #4                    ; 2
    clc                          ; 2
    adc    $D1,X                 ; 4
    and    #$1F                  ; 2
    sta    $D1,X                 ; 4
    sta    AUDF0,X               ; 4
    rts                          ; 6

LBF2C:
    lsr                          ; 2
LBF2D:
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
LBF31:
    rts                          ; 6

LBF32:
    .byte $07 ; |     XXX| $BF32
LBF33:
    .byte $41 ; | X     X| $BF33
LBF34:
    .byte $76 ; | XXX XX | $BF34
    .byte $9B ; |X  XX XX| $BF35
    .byte $07 ; |     XXX| $BF36
    .byte $41 ; | X     X| $BF37
    .byte $76 ; | XXX XX | $BF38
    .byte $96 ; |X  X XX | $BF39
    .byte $07 ; |     XXX| $BF3A
    .byte $41 ; | X     X| $BF3B
    .byte $76 ; | XXX XX | $BF3C
    .byte $95 ; |X  X X X| $BF3D
    .byte $07 ; |     XXX| $BF3E
    .byte $41 ; | X     X| $BF3F
    .byte $76 ; | XXX XX | $BF40
    .byte $96 ; |X  X XX | $BF41
    .byte $00 ; |        | $BF42
    .byte $04 ; |     X  | $BF43
    .byte $41 ; | X     X| $BF44
    .byte $76 ; | XXX XX | $BF45
    .byte $9B ; |X  XX XX| $BF46
    .byte $04 ; |     X  | $BF47
    .byte $41 ; | X     X| $BF48
    .byte $76 ; | XXX XX | $BF49
    .byte $96 ; |X  X XX | $BF4A
    .byte $04 ; |     X  | $BF4B
    .byte $41 ; | X     X| $BF4C
    .byte $76 ; | XXX XX | $BF4D
    .byte $95 ; |X  X X X| $BF4E
    .byte $04 ; |     X  | $BF4F
    .byte $41 ; | X     X| $BF50
    .byte $76 ; | XXX XX | $BF51
    .byte $96 ; |X  X XX | $BF52
    .byte $00 ; |        | $BF53
    .byte $02 ; |      X | $BF54
    .byte $21 ; |  X    X| $BF55
    .byte $76 ; | XXX XX | $BF56
    .byte $9B ; |X  XX XX| $BF57
    .byte $02 ; |      X | $BF58
    .byte $21 ; |  X    X| $BF59
    .byte $76 ; | XXX XX | $BF5A
    .byte $96 ; |X  X XX | $BF5B
    .byte $02 ; |      X | $BF5C
    .byte $21 ; |  X    X| $BF5D
    .byte $76 ; | XXX XX | $BF5E
    .byte $95 ; |X  X X X| $BF5F
    .byte $02 ; |      X | $BF60
    .byte $21 ; |  X    X| $BF61
    .byte $76 ; | XXX XX | $BF62
    .byte $96 ; |X  X XX | $BF63
    .byte $00 ; |        | $BF64
    .byte $03 ; |      XX| $BF65
    .byte $04 ; |     X  | $BF66
    .byte $D8 ; |XX XX   | $BF67
    .byte $8D ; |X   XX X| $BF68
    .byte $07 ; |     XXX| $BF69
    .byte $04 ; |     X  | $BF6A
    .byte $7F ; | XXXXXXX| $BF6B
    .byte $ED ; |XXX XX X| $BF6C
    .byte $00 ; |        | $BF6D
    .byte $03 ; |      XX| $BF6E
    .byte $0C ; |    XX  | $BF6F
    .byte $A8 ; |X X X   | $BF70
    .byte $97 ; |X  X XXX| $BF71
    .byte $07 ; |     XXX| $BF72
    .byte $0C ; |    XX  | $BF73
    .byte $6F ; | XX XXXX| $BF74
    .byte $57 ; | X X XXX| $BF75
    .byte $00 ; |        | $BF76
    .byte $0F ; |    XXXX| $BF77
    .byte $8F ; |X   XXXX| $BF78
    .byte $7F ; | XXXXXXX| $BF79
    .byte $94 ; |X  X X  | $BF7A
    .byte $00 ; |        | $BF7B
    .byte $07 ; |     XXX| $BF7C
    .byte $6F ; | XX XXXX| $BF7D
    .byte $4F ; | X  XXXX| $BF7E
    .byte $E3 ; |XXX   XX| $BF7F
    .byte $0F ; |    XXXX| $BF80
    .byte $EF ; |XXX XXXX| $BF81
    .byte $7F ; | XXXXXXX| $BF82
    .byte $9F ; |X  XXXXX| $BF83
    .byte $00 ; |        | $BF84
    .byte $07 ; |     XXX| $BF85
    .byte $6F ; | XX XXXX| $BF86
    .byte $BF ; |X XXXXXX| $BF87
    .byte $68 ; | XX X   | $BF88
    .byte $00 ; |        | $BF89
    .byte $06 ; |     XX | $BF8A
    .byte $28 ; |  X X   | $BF8B
    .byte $7F ; | XXXXXXX| $BF8C
    .byte $5F ; | X XXXXX| $BF8D
    .byte $FE ; |XXXXXXX | $BF8E
    .byte $E8 ; |XXX X   | $BF8F
    .byte $87 ; |X    XXX| $BF90
    .byte $93 ; |X  X  XX| $BF91
    .byte $00 ; |        | $BF92
    .byte $02 ; |      X | $BF93
    .byte $28 ; |  X X   | $BF94
    .byte $A4 ; |X X  X  | $BF95
    .byte $8C ; |X   XX  | $BF96
    .byte $06 ; |     XX | $BF97
    .byte $28 ; |  X X   | $BF98
    .byte $99 ; |X  XX  X| $BF99
    .byte $4C ; | X  XX  | $BF9A
    .byte $00 ; |        | $BF9B
    .byte $18 ; |   XX   | $BF9C
    .byte $24 ; |  X  X  | $BF9D
    .byte $4D ; | X  XX X| $BF9E
    .byte $8F ; |X   XXXX| $BF9F
    .byte $00 ; |        | $BFA0
    .byte $02 ; |      X | $BFA1
    .byte $8C ; |X   XX  | $BFA2
    .byte $8E ; |X   XXX | $BFA3
    .byte $74 ; | XXX X  | $BFA4
    .byte $02 ; |      X | $BFA5
    .byte $8C ; |X   XX  | $BFA6
    .byte $8E ; |X   XXX | $BFA7
    .byte $74 ; | XXX X  | $BFA8
    .byte $04 ; |     X  | $BFA9
    .byte $8C ; |X   XX  | $BFAA
    .byte $7D ; | XXXXX X| $BFAB
    .byte $91 ; |X  X   X| $BFAC
    .byte $08 ; |    X   | $BFAD
    .byte $8C ; |X   XX  | $BFAE
    .byte $7C ; | XXXXX  | $BFAF
    .byte $9A ; |X  XX X | $BFB0
    .byte $00 ; |        | $BFB1
    .byte $02 ; |      X | $BFB2
    .byte $8C ; |X   XX  | $BFB3
    .byte $8E ; |X   XXX | $BFB4
    .byte $74 ; | XXX X  | $BFB5
    .byte $02 ; |      X | $BFB6
    .byte $8C ; |X   XX  | $BFB7
    .byte $8E ; |X   XXX | $BFB8
    .byte $74 ; | XXX X  | $BFB9
    .byte $0C ; |    XX  | $BFBA
    .byte $FC ; |XXXXXX  | $BFBB
    .byte $7D ; | XXXXX X| $BFBC
    .byte $97 ; |X  X XXX| $BFBD
    .byte $00 ; |        | $BFBE
    .byte $02 ; |      X | $BFBF
    .byte $C7 ; |XX   XXX| $BFC0
    .byte $90 ; |X  X    | $BFC1
    .byte $F7 ; |XXXX XXX| $BFC2
    .byte $BB ; |X XXX XX| $BFC3
    .byte $87 ; |X    XXX| $BFC4
    .byte $80 ; |X       | $BFC5
    .byte $FF ; |XXXXXXXX| $BFC6
    .byte $BA ; |X XXX X | $BFC7
    .byte $12 ; |   X  X | $BFC8
    .byte $28 ; |  X X   | $BFC9
    .byte $33 ; |  XX  XX| $BFCA
    .byte $BF ; |X XXXXXX| $BFCB
    .byte $D2 ; |XX X  X | $BFCC
    .byte $08 ; |    X   | $BFCD
    .byte $53 ; | X X  XX| $BFCE
    .byte $B2 ; |X XX  X | $BFCF
    .byte $50 ; | X X    | $BFD0
    .byte $AC ; |X X XX  | $BFD1
    .byte $DE ; |XX XXXX | $BFD2
    .byte $3F ; |  XXXXXX| $BFD3
    .byte $81 ; |X      X| $BFD4
    .byte $A6 ; |X X  XX | $BFD5
    .byte $B7 ; |X XX XXX| $BFD6
    .byte $FF ; |XXXXXXXX| $BFD7
    .byte $A2 ; |X X   X | $BFD8
    .byte $B8 ; |X XXX   | $BFD9
    .byte $E3 ; |XXX   XX| $BFDA
    .byte $BF ; |X XXXXXX| $BFDB
    .byte $A2 ; |X X   X | $BFDC
    .byte $BE ; |X XXXXX | $BFDD
    .byte $DB ; |XX XX XX| $BFDE
    .byte $BF ; |X XXXXXX| $BFDF
    .byte $F2 ; |XXXX  X | $BFE0
    .byte $BD ; |X XXXX X| $BFE1
    .byte $E7 ; |XXX  XXX| $BFE2
    .byte $BD ; |X XXXX X| $BFE3
    .byte $F6 ; |XXXX XX | $BFE4
    .byte $3C ; |  XXXX  | $BFE5
    .byte $5F ; | X XXXXX| $BFE6

    lda    #1                    ; 2
    sta    LBFF9                 ; 4
    jmp.ind ($00AE)              ; 5
LBFEF:
    lda    #1                    ; 2
    sta    LBFFA                 ; 4
    jmp.ind ($00AE)              ; 5

    .byte $00 ; |        | $BFF7
    .byte $FF ; |XXXXXXXX| $BFF8
LBFF9:
    .byte $FF ; |XXXXXXXX| $BFF9
LBFFA:
    .byte $FF ; |XXXXXXXX| $BFFA
    .byte $F2 ; |XXXX  X | $BFFB

       ORG $1FFC
      RORG $BFFC

    .word START
    .word START



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 1
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $2000
      RORG $D000


LD000:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF
LD007:
    .byte $FF,$FF,$FF,$FF
LD00B:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LD014:
    .byte $FF,$FF,$FF,$FF
LD018:
    .byte $FF,$FF,$FF,$FF
LD01C:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LD025:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$7F
    .byte $FF,$FF
LD107:
    .byte $FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF
    .byte $FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
LD125:
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
LD131:
    .byte $FF
LD132:
    .byte $FF
LD133:
    .byte $FF
LD134:
    .byte $7F
LD135:
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
LD145:
    .byte $FF,$FF
LD147:
    .byte $FF
LD148:
    .byte $7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF
    .byte $7F
LD159:
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF

       ORG $2200
      RORG $D200

    lda    #1                    ; 2
    sta    $FFFA                 ; 4

    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LD53F,Y               ; 4
    sta    PF2                   ; 3
    lda    $F131,X               ; 4
    sta    HMP0                  ; 3
    and    #$0F                  ; 2
LD213:
    sbc    #1                    ; 2
    bne    LD213                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LD540,Y               ; 4
    sta    PF2                   ; 3
    lda    $F132,X               ; 4
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
LD227:
    sbc    #1                    ; 2
    bne    LD227                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LD541,Y               ; 4
    sta    PF2                   ; 3
    lda    $F133,X               ; 4
    sta    HMM0                  ; 3
    and    #$0F                  ; 2
LD23B:
    sbc    #1                    ; 2
    bne    LD23B                 ; 2³
    sta    RESM0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LD542,Y               ; 4
    sta    PF2                   ; 3
    lda    $F134,X               ; 4
    sta    HMM1                  ; 3
    and    #$0F                  ; 2
LD24F:
    sbc    #1                    ; 2
    bne    LD24F                 ; 2³
    sta    RESM1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LD543,Y               ; 4
    sta    PF2                   ; 3
    lda    $F135,X               ; 4
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
LD263:
    sbc    #1                    ; 2
    bne    LD263                 ; 2³
    sta    RESBL                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    LD544,Y               ; 4
    sta    PF2                   ; 3
    clc                          ; 2
    lda    #$0A                  ; 2
    adc    $F107                 ; 4
    sta    $F007                 ; 4
    adc    #2                    ; 2
    sta    $F00B                 ; 4
    adc    #2                    ; 2
    sta    $F014                 ; 4
    adc    #2                    ; 2
    sta    $F018                 ; 4
    adc    #2                    ; 2
    sta    $F01C                 ; 4
    lda    $F125                 ; 4
    adc    #1                    ; 2
    sta    $F025                 ; 4
    tya                          ; 2
    adc    #6                    ; 2
    tay                          ; 2
    txa                          ; 2
    adc    #5                    ; 2
    tax                          ; 2
    nop                          ; 2
    rts                          ; 6

    lda    $E1                   ; 3
    bmi    LD2AB                 ; 2³
    jsr    LD3C6                 ; 6
    jmp    LD2B1                 ; 3
LD2AB:
    jsr    LD41F                 ; 6
    jmp    LD2B1                 ; 3
LD2B1:
    nop                          ; 2
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    tax                          ; 2
    tay                          ; 2
    lda    #$10                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$11                  ; 2
    sta    CTRLPF                ; 3
    lda    $DF                   ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    cmp    ($80),Y               ; 5
    sec                          ; 2
    lda    $F131,X               ; 4
    sta    HMP0                  ; 3
    and    #$0F                  ; 2
LD2DC:
    sbc    #1                    ; 2
    bne    LD2DC                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    cmp    ($80),Y               ; 5
    sec                          ; 2
    lda    $F132,X               ; 4
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
LD2EE:
    sbc    #1                    ; 2
    bne    LD2EE                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    cmp    ($80),Y               ; 5
    sec                          ; 2
    lda    $F133,X               ; 4
    sta    HMM0                  ; 3
    and    #$0F                  ; 2
LD300:
    sbc    #1                    ; 2
    bne    LD300                 ; 2³
    sta    RESM0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    cmp    ($80),Y               ; 5
    sec                          ; 2
    lda    $F134,X               ; 4
    sta    HMM1                  ; 3
    and    #$0F                  ; 2
LD312:
    sbc    #1                    ; 2
    bne    LD312                 ; 2³
    sta    RESM1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    cmp    ($80),Y               ; 5
    sec                          ; 2
    lda    $F135,X               ; 4
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
LD324:
    sbc    #1                    ; 2
    bne    LD324                 ; 2³
    sta    RESBL                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    $F159                 ; 4
    and    #$0F                  ; 2
    cmp    #9                    ; 2
    bcc    LD33D                 ; 2³
    lda    #8                    ; 2
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
LD33D:
    lda    #0                    ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    $C4                   ; 3
    beq    LD34B                 ; 2³
    ora    #$30                  ; 2
LD34B:
    sta    COLUBK                ; 3
    ldx    #5                    ; 2
    rts                          ; 6

    lda    #0                    ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    ENABL                 ; 3
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $E1                   ; 3
    bmi    LD372                 ; 2³
    jsr    LD41F                 ; 6
    jmp    LD375                 ; 3
LD372:
    jsr    LD3C6                 ; 6
LD375:
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    lda    TIMINT                ; 4
    lda    #$A9                  ; 2
    sta    $029D                 ; 4
    lda    #$64                  ; 2
    sta    $AE                   ; 3
    lda    #$BD                  ; 2
    sta    $AF                   ; 3
    jmp    LDFE7                 ; 3
LD396:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUP0                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    COLUPF                ; 3
    lda    #$90                  ; 2
    sta    HMP0                  ; 3
    lda    #$A0                  ; 2
    sta    HMP1                  ; 3
    nop                          ; 2
    inc    $A8                   ; 5
    dec    $A8                   ; 5
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    ldx    #8                    ; 2
LD3BD:
    dex                          ; 2
    bne    LD3BD                 ; 2³
    inx                          ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    rts                          ; 6

LD3C6:
    ldx    #6                    ; 2
    ldy    #$FF                  ; 2
LD3CA:
    txa                          ; 2
    and    #$02                  ; 2
    beq    LD3D7                 ; 2³
    iny                          ; 2
    lda    $F145,Y               ; 4
    and    #$0F                  ; 2
    bpl    LD3DE                 ; 2³
LD3D7:
    lda    $F145,Y               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
LD3DE:
    asl                          ; 2
    cpy    #1                    ; 2
    tay                          ; 2
    lda    LD4E5,Y               ; 4
    sta    $A8,X                 ; 4
    lda    LD4E6,Y               ; 4
    sta    $A9,X                 ; 4
    ldy    #0                    ; 2
    bcc    LD3F1                 ; 2³
    iny                          ; 2
LD3F1:
    dex                          ; 2
    dex                          ; 2
    bpl    LD3CA                 ; 2³
    lda    $DE                   ; 3
    jsr    LD396                 ; 6
    ldy    #6                    ; 2
LD3FC:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($A8),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($AA),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($AC),Y               ; 5
    sta    GRP0                  ; 3
    lda    LD4F9,Y               ; 4
    tax                          ; 2
    lda    ($AE),Y               ; 5
    lda    ($AE),Y               ; 5
    nop                          ; 2
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    sta    GRP0                  ; 3
    dey                          ; 2
    bpl    LD3FC                 ; 2³+1
    rts                          ; 6

LD41F:
    lda    $E0                   ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    nop                          ; 2
    nop                          ; 2
    lda    #$B0                  ; 2
    sta    HMP0                  ; 3
    lda    #$C0                  ; 2
    sta    HMP1                  ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    $F147                 ; 4
    beq    LD449                 ; 2³
    dex                          ; 2
LD449:
    cpx    #5                    ; 2
    bcc    LD44F                 ; 2³
    ldx    #4                    ; 2
LD44F:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LD4E0,X               ; 4
    sta    $A8                   ; 3
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    lda    #1                    ; 2
    sta    NUSIZ1                ; 3
    lda    $F148                 ; 4
    sec                          ; 2
LD462:
    sbc    #$64                  ; 2
    bcs    LD462                 ; 2³
    adc    #$64                  ; 2
    ldx    #$FF                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sec                          ; 2
LD46D:
    sbc    #$0A                  ; 2
    inx                          ; 2
    bcs    LD46D                 ; 2³
    adc    #$0A                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    asl                          ; 2
    tay                          ; 2
    txa                          ; 2
    asl                          ; 2
    tax                          ; 2
    bne    LD47F                 ; 2³
    stx    NUSIZ1                ; 3
LD47F:
    lda    LD4E5,X               ; 4
    sta    $AA                   ; 3
    lda    LD4E6,X               ; 4
    sta    $AB                   ; 3
    lda    LD4E5,Y               ; 4
    sta    $AC                   ; 3
    lda    LD4E6,Y               ; 4
    sta    $AD                   ; 3
    ldy    #6                    ; 2
    sty    $AE                   ; 3
    lda    ($AC),Y               ; 5
    sta    $AF                   ; 3
LD49B:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($E7),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($E9),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($EB),Y               ; 5
    tax                          ; 2
    lda    ($AA),Y               ; 5
    ldy    $AF                   ; 3
    stx    GRP0                  ; 3
    sta    GRP1                  ; 3
    sty    GRP0                  ; 3
    lda    $A8                   ; 3
    sta    PF1                   ; 3
    dec    $AE                   ; 5
    ldy    $AE                   ; 3
    lda    ($AC),Y               ; 5
    sta    $AF                   ; 3
    lda    #0                    ; 2
    cpy    #$FF                  ; 2
    sta    PF1                   ; 3
    bne    LD49B                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    rts                          ; 6

    .byte $8A ; |X   X X | $D4C9
    .byte $92 ; |X  X  X | $D4CA
    .byte $A2 ; |X X   X | $D4CB
    .byte $F3 ; |XXXX  XX| $D4CC
    .byte $8A ; |X   X X | $D4CD
    .byte $8A ; |X   X X | $D4CE
    .byte $F1 ; |XXXX   X| $D4CF
    .byte $27 ; |  X  XXX| $D4D0
    .byte $28 ; |  X X   | $D4D1
    .byte $28 ; |  X X   | $D4D2
    .byte $E8 ; |XXX X   | $D4D3
    .byte $28 ; |  X X   | $D4D4
    .byte $28 ; |  X X   | $D4D5
    .byte $C7 ; |XX   XXX| $D4D6
    .byte $22 ; |  X   X | $D4D7
    .byte $A4 ; |X X  X  | $D4D8
    .byte $28 ; |  X X   | $D4D9
    .byte $30 ; |  XX    | $D4DA
    .byte $28 ; |  X X   | $D4DB
    .byte $A4 ; |X X  X  | $D4DC
    .byte $22 ; |  X   X | $D4DD
    .byte $00 ; |        | $D4DE
    .byte $00 ; |        | $D4DF
LD4E0:
    .byte $00 ; |        | $D4E0
    .byte $01 ; |       X| $D4E1
    .byte $05 ; |     X X| $D4E2
    .byte $15 ; |   X X X| $D4E3
    .byte $55 ; | X X X X| $D4E4
LD4E5:
    .byte $F9 ; |XXXXX  X| $D4E5
LD4E6:
    .byte $D4 ; |XX X X  | $D4E6
    .byte $00 ; |        | $D4E7
    .byte $D5 ; |XX X X X| $D4E8
    .byte $07 ; |     XXX| $D4E9
    .byte $D5 ; |XX X X X| $D4EA
    .byte $0E ; |    XXX | $D4EB
    .byte $D5 ; |XX X X X| $D4EC
    .byte $15 ; |   X X X| $D4ED
    .byte $D5 ; |XX X X X| $D4EE
    .byte $1C ; |   XXX  | $D4EF
    .byte $D5 ; |XX X X X| $D4F0
    .byte $23 ; |  X   XX| $D4F1
    .byte $D5 ; |XX X X X| $D4F2
    .byte $2A ; |  X X X | $D4F3
    .byte $D5 ; |XX X X X| $D4F4
    .byte $31 ; |  XX   X| $D4F5
    .byte $D5 ; |XX X X X| $D4F6
    .byte $38 ; |  XXX   | $D4F7
    .byte $D5 ; |XX X X X| $D4F8
LD4F9:
    .byte $3E ; |  XXXXX | $D4F9
    .byte $63 ; | XX   XX| $D4FA
    .byte $63 ; | XX   XX| $D4FB
    .byte $63 ; | XX   XX| $D4FC
    .byte $63 ; | XX   XX| $D4FD
    .byte $63 ; | XX   XX| $D4FE
    .byte $3E ; |  XXXXX | $D4FF
    .byte $7E ; | XXXXXX | $D500
    .byte $18 ; |   XX   | $D501
    .byte $18 ; |   XX   | $D502
    .byte $18 ; |   XX   | $D503
    .byte $18 ; |   XX   | $D504
    .byte $38 ; |  XXX   | $D505
    .byte $18 ; |   XX   | $D506
    .byte $7F ; | XXXXXXX| $D507
    .byte $70 ; | XXX    | $D508
    .byte $3C ; |  XXXX  | $D509
    .byte $1E ; |   XXXX | $D50A
    .byte $07 ; |     XXX| $D50B
    .byte $63 ; | XX   XX| $D50C
    .byte $3E ; |  XXXXX | $D50D
    .byte $3E ; |  XXXXX | $D50E
    .byte $63 ; | XX   XX| $D50F
    .byte $03 ; |      XX| $D510
    .byte $1E ; |   XXXX | $D511
    .byte $0C ; |    XX  | $D512
    .byte $06 ; |     XX | $D513
    .byte $3F ; |  XXXXXX| $D514
    .byte $06 ; |     XX | $D515
    .byte $06 ; |     XX | $D516
    .byte $7E ; | XXXXXX | $D517
    .byte $66 ; | XX  XX | $D518
    .byte $36 ; |  XX XX | $D519
    .byte $1E ; |   XXXX | $D51A
    .byte $0E ; |    XXX | $D51B
    .byte $3E ; |  XXXXX | $D51C
    .byte $63 ; | XX   XX| $D51D
    .byte $03 ; |      XX| $D51E
    .byte $03 ; |      XX| $D51F
    .byte $7E ; | XXXXXX | $D520
    .byte $60 ; | XX     | $D521
    .byte $7F ; | XXXXXXX| $D522
    .byte $3E ; |  XXXXX | $D523
    .byte $63 ; | XX   XX| $D524
    .byte $63 ; | XX   XX| $D525
    .byte $7E ; | XXXXXX | $D526
    .byte $60 ; | XX     | $D527
    .byte $30 ; |  XX    | $D528
    .byte $1E ; |   XXXX | $D529
    .byte $18 ; |   XX   | $D52A
    .byte $18 ; |   XX   | $D52B
    .byte $18 ; |   XX   | $D52C
    .byte $0C ; |    XX  | $D52D
    .byte $06 ; |     XX | $D52E
    .byte $63 ; | XX   XX| $D52F
    .byte $7E ; | XXXXXX | $D530
    .byte $3E ; |  XXXXX | $D531
    .byte $63 ; | XX   XX| $D532
    .byte $63 ; | XX   XX| $D533
    .byte $3E ; |  XXXXX | $D534
    .byte $63 ; | XX   XX| $D535
    .byte $63 ; | XX   XX| $D536
    .byte $3E ; |  XXXXX | $D537
    .byte $3C ; |  XXXX  | $D538
    .byte $06 ; |     XX | $D539
    .byte $03 ; |      XX| $D53A
    .byte $3F ; |  XXXXXX| $D53B
    .byte $63 ; | XX   XX| $D53C
    .byte $63 ; | XX   XX| $D53D
    .byte $3E ; |  XXXXX | $D53E
LD53F:
    .byte $00 ; |        | $D53F
LD540:
    .byte $00 ; |        | $D540
LD541:
    .byte $00 ; |        | $D541
LD542:
    .byte $00 ; |        | $D542
LD543:
    .byte $00 ; |        | $D543
LD544:
    .byte $00 ; |        | $D544
    .byte $00 ; |        | $D545
    .byte $00 ; |        | $D546
    .byte $00 ; |        | $D547
    .byte $00 ; |        | $D548
    .byte $00 ; |        | $D549
    .byte $00 ; |        | $D54A
    .byte $00 ; |        | $D54B
    .byte $00 ; |        | $D54C
    .byte $00 ; |        | $D54D
    .byte $00 ; |        | $D54E
    .byte $00 ; |        | $D54F
    .byte $00 ; |        | $D550
    .byte $00 ; |        | $D551
    .byte $00 ; |        | $D552
    .byte $00 ; |        | $D553
    .byte $00 ; |        | $D554
    .byte $00 ; |        | $D555
    .byte $00 ; |        | $D556
    .byte $00 ; |        | $D557
    .byte $00 ; |        | $D558
    .byte $00 ; |        | $D559
    .byte $00 ; |        | $D55A
    .byte $00 ; |        | $D55B
    .byte $00 ; |        | $D55C
    .byte $00 ; |        | $D55D
    .byte $00 ; |        | $D55E
    .byte $00 ; |        | $D55F
    .byte $00 ; |        | $D560
    .byte $00 ; |        | $D561
    .byte $00 ; |        | $D562
    .byte $00 ; |        | $D563
    .byte $00 ; |        | $D564
    .byte $00 ; |        | $D565
    .byte $00 ; |        | $D566
    .byte $00 ; |        | $D567
    .byte $00 ; |        | $D568
    .byte $00 ; |        | $D569
    .byte $00 ; |        | $D56A
    .byte $00 ; |        | $D56B
    .byte $00 ; |        | $D56C
    .byte $00 ; |        | $D56D
    .byte $00 ; |        | $D56E
    .byte $00 ; |        | $D56F
    .byte $00 ; |        | $D570
    .byte $00 ; |        | $D571
    .byte $00 ; |        | $D572
    .byte $00 ; |        | $D573
    .byte $00 ; |        | $D574
    .byte $00 ; |        | $D575
    .byte $00 ; |        | $D576
    .byte $00 ; |        | $D577
    .byte $00 ; |        | $D578
    .byte $00 ; |        | $D579
    .byte $00 ; |        | $D57A
    .byte $FF ; |XXXXXXXX| $D57B
    .byte $FF ; |XXXXXXXX| $D57C
    .byte $FF ; |XXXXXXXX| $D57D
    .byte $01 ; |       X| $D57E
    .byte $01 ; |       X| $D57F
    .byte $01 ; |       X| $D580
    .byte $01 ; |       X| $D581
    .byte $01 ; |       X| $D582
    .byte $01 ; |       X| $D583
    .byte $01 ; |       X| $D584
    .byte $01 ; |       X| $D585
    .byte $01 ; |       X| $D586
    .byte $01 ; |       X| $D587
    .byte $01 ; |       X| $D588
    .byte $01 ; |       X| $D589
    .byte $01 ; |       X| $D58A
    .byte $01 ; |       X| $D58B
    .byte $01 ; |       X| $D58C
    .byte $01 ; |       X| $D58D
    .byte $01 ; |       X| $D58E
    .byte $01 ; |       X| $D58F
    .byte $01 ; |       X| $D590
    .byte $01 ; |       X| $D591
    .byte $01 ; |       X| $D592
    .byte $01 ; |       X| $D593
    .byte $01 ; |       X| $D594
    .byte $01 ; |       X| $D595
    .byte $01 ; |       X| $D596
    .byte $01 ; |       X| $D597
    .byte $01 ; |       X| $D598
    .byte $01 ; |       X| $D599
    .byte $01 ; |       X| $D59A
    .byte $01 ; |       X| $D59B
    .byte $01 ; |       X| $D59C
    .byte $01 ; |       X| $D59D
    .byte $01 ; |       X| $D59E
    .byte $01 ; |       X| $D59F
    .byte $FF ; |XXXXXXXX| $D5A0
    .byte $FF ; |XXXXXXXX| $D5A1
    .byte $FF ; |XXXXXXXX| $D5A2
    .byte $00 ; |        | $D5A3
    .byte $00 ; |        | $D5A4
    .byte $00 ; |        | $D5A5
    .byte $00 ; |        | $D5A6
    .byte $00 ; |        | $D5A7
    .byte $00 ; |        | $D5A8
    .byte $00 ; |        | $D5A9
    .byte $00 ; |        | $D5AA
    .byte $00 ; |        | $D5AB
    .byte $00 ; |        | $D5AC
    .byte $00 ; |        | $D5AD
    .byte $00 ; |        | $D5AE
    .byte $00 ; |        | $D5AF
    .byte $00 ; |        | $D5B0
    .byte $00 ; |        | $D5B1
    .byte $00 ; |        | $D5B2
    .byte $00 ; |        | $D5B3
    .byte $00 ; |        | $D5B4
    .byte $00 ; |        | $D5B5
    .byte $00 ; |        | $D5B6
    .byte $00 ; |        | $D5B7
    .byte $00 ; |        | $D5B8
    .byte $00 ; |        | $D5B9
    .byte $00 ; |        | $D5BA
    .byte $00 ; |        | $D5BB
    .byte $00 ; |        | $D5BC
    .byte $00 ; |        | $D5BD
    .byte $00 ; |        | $D5BE
    .byte $00 ; |        | $D5BF
    .byte $00 ; |        | $D5C0
    .byte $00 ; |        | $D5C1
    .byte $00 ; |        | $D5C2
    .byte $00 ; |        | $D5C3
    .byte $00 ; |        | $D5C4
    .byte $00 ; |        | $D5C5
    .byte $00 ; |        | $D5C6
    .byte $00 ; |        | $D5C7
    .byte $00 ; |        | $D5C8
    .byte $00 ; |        | $D5C9
    .byte $00 ; |        | $D5CA
    .byte $00 ; |        | $D5CB
    .byte $00 ; |        | $D5CC
    .byte $00 ; |        | $D5CD
    .byte $00 ; |        | $D5CE
    .byte $00 ; |        | $D5CF
    .byte $00 ; |        | $D5D0
    .byte $00 ; |        | $D5D1
    .byte $00 ; |        | $D5D2
    .byte $00 ; |        | $D5D3
    .byte $00 ; |        | $D5D4
    .byte $00 ; |        | $D5D5
    .byte $00 ; |        | $D5D6
    .byte $00 ; |        | $D5D7
    .byte $00 ; |        | $D5D8
    .byte $00 ; |        | $D5D9
    .byte $00 ; |        | $D5DA
    .byte $00 ; |        | $D5DB
    .byte $00 ; |        | $D5DC
    .byte $00 ; |        | $D5DD
    .byte $00 ; |        | $D5DE
    .byte $00 ; |        | $D5DF
    .byte $00 ; |        | $D5E0
    .byte $00 ; |        | $D5E1
    .byte $00 ; |        | $D5E2
    .byte $00 ; |        | $D5E3
    .byte $00 ; |        | $D5E4
    .byte $00 ; |        | $D5E5
    .byte $00 ; |        | $D5E6
    .byte $00 ; |        | $D5E7
    .byte $00 ; |        | $D5E8
    .byte $00 ; |        | $D5E9
    .byte $00 ; |        | $D5EA
    .byte $00 ; |        | $D5EB
    .byte $00 ; |        | $D5EC
    .byte $00 ; |        | $D5ED
    .byte $00 ; |        | $D5EE
    .byte $00 ; |        | $D5EF
    .byte $00 ; |        | $D5F0
    .byte $00 ; |        | $D5F1
    .byte $00 ; |        | $D5F2
    .byte $00 ; |        | $D5F3
    .byte $00 ; |        | $D5F4
    .byte $00 ; |        | $D5F5
    .byte $00 ; |        | $D5F6
    .byte $00 ; |        | $D5F7
    .byte $00 ; |        | $D5F8
    .byte $00 ; |        | $D5F9
    .byte $00 ; |        | $D5FA
    .byte $00 ; |        | $D5FB
    .byte $00 ; |        | $D5FC
    .byte $00 ; |        | $D5FD
    .byte $00 ; |        | $D5FE
    .byte $00 ; |        | $D5FF
    .byte $00 ; |        | $D600
    .byte $00 ; |        | $D601
    .byte $00 ; |        | $D602
    .byte $00 ; |        | $D603
    .byte $00 ; |        | $D604
    .byte $00 ; |        | $D605
    .byte $00 ; |        | $D606
    .byte $00 ; |        | $D607
    .byte $00 ; |        | $D608
    .byte $00 ; |        | $D609
    .byte $00 ; |        | $D60A
    .byte $00 ; |        | $D60B
    .byte $00 ; |        | $D60C
    .byte $00 ; |        | $D60D
    .byte $00 ; |        | $D60E
    .byte $00 ; |        | $D60F
    .byte $00 ; |        | $D610
    .byte $00 ; |        | $D611
    .byte $00 ; |        | $D612
    .byte $00 ; |        | $D613
    .byte $00 ; |        | $D614
    .byte $00 ; |        | $D615
    .byte $00 ; |        | $D616
    .byte $00 ; |        | $D617
    .byte $00 ; |        | $D618
    .byte $00 ; |        | $D619
    .byte $00 ; |        | $D61A
    .byte $00 ; |        | $D61B
    .byte $00 ; |        | $D61C
    .byte $00 ; |        | $D61D
    .byte $00 ; |        | $D61E
    .byte $00 ; |        | $D61F
    .byte $00 ; |        | $D620
    .byte $00 ; |        | $D621
    .byte $00 ; |        | $D622
    .byte $00 ; |        | $D623
    .byte $00 ; |        | $D624
    .byte $00 ; |        | $D625
    .byte $00 ; |        | $D626
    .byte $00 ; |        | $D627
    .byte $00 ; |        | $D628
    .byte $00 ; |        | $D629
    .byte $00 ; |        | $D62A
    .byte $00 ; |        | $D62B
    .byte $00 ; |        | $D62C
    .byte $00 ; |        | $D62D
    .byte $00 ; |        | $D62E
    .byte $00 ; |        | $D62F
    .byte $00 ; |        | $D630
    .byte $00 ; |        | $D631
    .byte $00 ; |        | $D632
    .byte $00 ; |        | $D633
    .byte $00 ; |        | $D634
    .byte $00 ; |        | $D635
    .byte $00 ; |        | $D636
    .byte $00 ; |        | $D637
    .byte $00 ; |        | $D638
    .byte $00 ; |        | $D639
    .byte $00 ; |        | $D63A
    .byte $00 ; |        | $D63B
    .byte $00 ; |        | $D63C
    .byte $00 ; |        | $D63D
    .byte $00 ; |        | $D63E
    .byte $00 ; |        | $D63F
    .byte $00 ; |        | $D640
    .byte $00 ; |        | $D641
    .byte $00 ; |        | $D642
    .byte $08 ; |    X   | $D643
    .byte $08 ; |    X   | $D644
    .byte $14 ; |   X X  | $D645
    .byte $14 ; |   X X  | $D646
    .byte $22 ; |  X   X | $D647
    .byte $00 ; |        | $D648
    .byte $00 ; |        | $D649
    .byte $00 ; |        | $D64A
    .byte $00 ; |        | $D64B
    .byte $00 ; |        | $D64C
    .byte $00 ; |        | $D64D
    .byte $00 ; |        | $D64E
    .byte $00 ; |        | $D64F
    .byte $00 ; |        | $D650
    .byte $00 ; |        | $D651
    .byte $00 ; |        | $D652
    .byte $00 ; |        | $D653
    .byte $00 ; |        | $D654
    .byte $00 ; |        | $D655
    .byte $00 ; |        | $D656
    .byte $00 ; |        | $D657
    .byte $00 ; |        | $D658
    .byte $00 ; |        | $D659
    .byte $00 ; |        | $D65A
    .byte $00 ; |        | $D65B
    .byte $00 ; |        | $D65C
    .byte $00 ; |        | $D65D
    .byte $00 ; |        | $D65E
    .byte $00 ; |        | $D65F
    .byte $00 ; |        | $D660
    .byte $00 ; |        | $D661
    .byte $00 ; |        | $D662
    .byte $00 ; |        | $D663
    .byte $00 ; |        | $D664
    .byte $00 ; |        | $D665
    .byte $00 ; |        | $D666
    .byte $00 ; |        | $D667
    .byte $00 ; |        | $D668
    .byte $00 ; |        | $D669
    .byte $00 ; |        | $D66A
    .byte $00 ; |        | $D66B
    .byte $00 ; |        | $D66C
    .byte $00 ; |        | $D66D
    .byte $00 ; |        | $D66E
    .byte $00 ; |        | $D66F
    .byte $00 ; |        | $D670
    .byte $00 ; |        | $D671
    .byte $00 ; |        | $D672
    .byte $00 ; |        | $D673
    .byte $00 ; |        | $D674
    .byte $00 ; |        | $D675
    .byte $00 ; |        | $D676
    .byte $00 ; |        | $D677
    .byte $00 ; |        | $D678
    .byte $00 ; |        | $D679
    .byte $00 ; |        | $D67A
    .byte $00 ; |        | $D67B
    .byte $00 ; |        | $D67C
    .byte $00 ; |        | $D67D
    .byte $00 ; |        | $D67E
    .byte $00 ; |        | $D67F
    .byte $00 ; |        | $D680
    .byte $00 ; |        | $D681
    .byte $00 ; |        | $D682
    .byte $00 ; |        | $D683
    .byte $00 ; |        | $D684
    .byte $00 ; |        | $D685
    .byte $00 ; |        | $D686
    .byte $00 ; |        | $D687
    .byte $00 ; |        | $D688
    .byte $00 ; |        | $D689
    .byte $00 ; |        | $D68A
    .byte $00 ; |        | $D68B
    .byte $00 ; |        | $D68C
    .byte $00 ; |        | $D68D
    .byte $00 ; |        | $D68E
    .byte $00 ; |        | $D68F
    .byte $00 ; |        | $D690
    .byte $00 ; |        | $D691
    .byte $00 ; |        | $D692
    .byte $00 ; |        | $D693
    .byte $00 ; |        | $D694
    .byte $00 ; |        | $D695
    .byte $00 ; |        | $D696
    .byte $00 ; |        | $D697
    .byte $00 ; |        | $D698
    .byte $00 ; |        | $D699
    .byte $00 ; |        | $D69A
    .byte $00 ; |        | $D69B
    .byte $00 ; |        | $D69C
    .byte $00 ; |        | $D69D
    .byte $00 ; |        | $D69E
    .byte $00 ; |        | $D69F
    .byte $00 ; |        | $D6A0
    .byte $00 ; |        | $D6A1
    .byte $00 ; |        | $D6A2
    .byte $00 ; |        | $D6A3
    .byte $00 ; |        | $D6A4
    .byte $00 ; |        | $D6A5
    .byte $00 ; |        | $D6A6
    .byte $00 ; |        | $D6A7
    .byte $00 ; |        | $D6A8
    .byte $00 ; |        | $D6A9
    .byte $00 ; |        | $D6AA
    .byte $00 ; |        | $D6AB
    .byte $00 ; |        | $D6AC
    .byte $00 ; |        | $D6AD
    .byte $00 ; |        | $D6AE
    .byte $00 ; |        | $D6AF
    .byte $00 ; |        | $D6B0
    .byte $00 ; |        | $D6B1
    .byte $00 ; |        | $D6B2
    .byte $00 ; |        | $D6B3
    .byte $00 ; |        | $D6B4
    .byte $00 ; |        | $D6B5
    .byte $00 ; |        | $D6B6
    .byte $00 ; |        | $D6B7
    .byte $00 ; |        | $D6B8
    .byte $00 ; |        | $D6B9
    .byte $00 ; |        | $D6BA
    .byte $00 ; |        | $D6BB
    .byte $00 ; |        | $D6BC
    .byte $00 ; |        | $D6BD
    .byte $00 ; |        | $D6BE
    .byte $00 ; |        | $D6BF
    .byte $00 ; |        | $D6C0
    .byte $00 ; |        | $D6C1
    .byte $00 ; |        | $D6C2
    .byte $00 ; |        | $D6C3
    .byte $00 ; |        | $D6C4
    .byte $00 ; |        | $D6C5
    .byte $00 ; |        | $D6C6
    .byte $00 ; |        | $D6C7
    .byte $00 ; |        | $D6C8
    .byte $00 ; |        | $D6C9
    .byte $00 ; |        | $D6CA
    .byte $00 ; |        | $D6CB
    .byte $00 ; |        | $D6CC
    .byte $00 ; |        | $D6CD
    .byte $00 ; |        | $D6CE
    .byte $00 ; |        | $D6CF
    .byte $00 ; |        | $D6D0
    .byte $00 ; |        | $D6D1
    .byte $00 ; |        | $D6D2
    .byte $00 ; |        | $D6D3
    .byte $00 ; |        | $D6D4
    .byte $00 ; |        | $D6D5
    .byte $00 ; |        | $D6D6
    .byte $00 ; |        | $D6D7
    .byte $00 ; |        | $D6D8
    .byte $00 ; |        | $D6D9
    .byte $00 ; |        | $D6DA
    .byte $00 ; |        | $D6DB
    .byte $00 ; |        | $D6DC
    .byte $00 ; |        | $D6DD
    .byte $00 ; |        | $D6DE
    .byte $00 ; |        | $D6DF
    .byte $00 ; |        | $D6E0
    .byte $00 ; |        | $D6E1
    .byte $00 ; |        | $D6E2
    .byte $00 ; |        | $D6E3
    .byte $00 ; |        | $D6E4
    .byte $00 ; |        | $D6E5
    .byte $00 ; |        | $D6E6
    .byte $00 ; |        | $D6E7
    .byte $00 ; |        | $D6E8
    .byte $04 ; |     X  | $D6E9
    .byte $0C ; |    XX  | $D6EA
    .byte $14 ; |   X X  | $D6EB
    .byte $14 ; |   X X  | $D6EC
    .byte $24 ; |  X  X  | $D6ED
    .byte $04 ; |     X  | $D6EE
    .byte $00 ; |        | $D6EF
    .byte $00 ; |        | $D6F0
    .byte $00 ; |        | $D6F1
    .byte $00 ; |        | $D6F2
    .byte $00 ; |        | $D6F3
    .byte $00 ; |        | $D6F4
    .byte $00 ; |        | $D6F5
    .byte $00 ; |        | $D6F6
    .byte $00 ; |        | $D6F7
    .byte $00 ; |        | $D6F8
    .byte $00 ; |        | $D6F9
    .byte $00 ; |        | $D6FA
    .byte $00 ; |        | $D6FB
    .byte $00 ; |        | $D6FC
    .byte $00 ; |        | $D6FD
    .byte $00 ; |        | $D6FE
    .byte $00 ; |        | $D6FF
    .byte $00 ; |        | $D700
    .byte $00 ; |        | $D701
    .byte $00 ; |        | $D702
    .byte $00 ; |        | $D703
    .byte $00 ; |        | $D704
    .byte $00 ; |        | $D705
    .byte $00 ; |        | $D706
    .byte $00 ; |        | $D707
    .byte $00 ; |        | $D708
    .byte $00 ; |        | $D709
    .byte $00 ; |        | $D70A
    .byte $00 ; |        | $D70B
    .byte $00 ; |        | $D70C
    .byte $00 ; |        | $D70D
    .byte $00 ; |        | $D70E
    .byte $00 ; |        | $D70F
    .byte $00 ; |        | $D710
    .byte $00 ; |        | $D711
    .byte $00 ; |        | $D712
    .byte $00 ; |        | $D713
    .byte $00 ; |        | $D714
    .byte $00 ; |        | $D715
    .byte $00 ; |        | $D716
    .byte $00 ; |        | $D717
    .byte $00 ; |        | $D718
    .byte $00 ; |        | $D719
    .byte $00 ; |        | $D71A
    .byte $00 ; |        | $D71B
    .byte $00 ; |        | $D71C
    .byte $00 ; |        | $D71D
    .byte $00 ; |        | $D71E
    .byte $00 ; |        | $D71F
    .byte $00 ; |        | $D720
    .byte $00 ; |        | $D721
    .byte $00 ; |        | $D722
    .byte $00 ; |        | $D723
    .byte $00 ; |        | $D724
    .byte $00 ; |        | $D725
    .byte $00 ; |        | $D726
    .byte $00 ; |        | $D727
    .byte $00 ; |        | $D728
    .byte $00 ; |        | $D729
    .byte $00 ; |        | $D72A
    .byte $00 ; |        | $D72B
    .byte $00 ; |        | $D72C
    .byte $00 ; |        | $D72D
    .byte $00 ; |        | $D72E
    .byte $00 ; |        | $D72F
    .byte $00 ; |        | $D730
    .byte $00 ; |        | $D731
    .byte $00 ; |        | $D732
    .byte $00 ; |        | $D733
    .byte $00 ; |        | $D734
    .byte $00 ; |        | $D735
    .byte $00 ; |        | $D736
    .byte $00 ; |        | $D737
    .byte $00 ; |        | $D738
    .byte $00 ; |        | $D739
    .byte $00 ; |        | $D73A
    .byte $00 ; |        | $D73B
    .byte $00 ; |        | $D73C
    .byte $00 ; |        | $D73D
    .byte $00 ; |        | $D73E
    .byte $00 ; |        | $D73F
    .byte $00 ; |        | $D740
    .byte $00 ; |        | $D741
    .byte $00 ; |        | $D742
    .byte $00 ; |        | $D743
    .byte $00 ; |        | $D744
    .byte $00 ; |        | $D745
    .byte $00 ; |        | $D746
    .byte $00 ; |        | $D747
    .byte $00 ; |        | $D748
    .byte $00 ; |        | $D749
    .byte $00 ; |        | $D74A
    .byte $00 ; |        | $D74B
    .byte $00 ; |        | $D74C
    .byte $00 ; |        | $D74D
    .byte $00 ; |        | $D74E
    .byte $00 ; |        | $D74F
    .byte $00 ; |        | $D750
    .byte $00 ; |        | $D751
    .byte $00 ; |        | $D752
    .byte $00 ; |        | $D753
    .byte $00 ; |        | $D754
    .byte $00 ; |        | $D755
    .byte $00 ; |        | $D756
    .byte $00 ; |        | $D757
    .byte $00 ; |        | $D758
    .byte $00 ; |        | $D759
    .byte $00 ; |        | $D75A
    .byte $00 ; |        | $D75B
    .byte $00 ; |        | $D75C
    .byte $00 ; |        | $D75D
    .byte $00 ; |        | $D75E
    .byte $00 ; |        | $D75F
    .byte $00 ; |        | $D760
    .byte $00 ; |        | $D761
    .byte $00 ; |        | $D762
    .byte $00 ; |        | $D763
    .byte $00 ; |        | $D764
    .byte $00 ; |        | $D765
    .byte $00 ; |        | $D766
    .byte $00 ; |        | $D767
    .byte $00 ; |        | $D768
    .byte $00 ; |        | $D769
    .byte $00 ; |        | $D76A
    .byte $00 ; |        | $D76B
    .byte $00 ; |        | $D76C
    .byte $00 ; |        | $D76D
    .byte $00 ; |        | $D76E
    .byte $00 ; |        | $D76F
    .byte $00 ; |        | $D770
    .byte $00 ; |        | $D771
    .byte $00 ; |        | $D772
    .byte $00 ; |        | $D773
    .byte $00 ; |        | $D774
    .byte $00 ; |        | $D775
    .byte $00 ; |        | $D776
    .byte $00 ; |        | $D777
    .byte $00 ; |        | $D778
    .byte $00 ; |        | $D779
    .byte $00 ; |        | $D77A
    .byte $00 ; |        | $D77B
    .byte $00 ; |        | $D77C
    .byte $00 ; |        | $D77D
    .byte $00 ; |        | $D77E
    .byte $00 ; |        | $D77F
    .byte $00 ; |        | $D780
    .byte $00 ; |        | $D781
    .byte $00 ; |        | $D782
    .byte $00 ; |        | $D783
    .byte $00 ; |        | $D784
    .byte $00 ; |        | $D785
    .byte $00 ; |        | $D786
    .byte $00 ; |        | $D787
    .byte $00 ; |        | $D788
    .byte $00 ; |        | $D789
    .byte $00 ; |        | $D78A
    .byte $00 ; |        | $D78B
    .byte $00 ; |        | $D78C
    .byte $00 ; |        | $D78D
    .byte $00 ; |        | $D78E
    .byte $02 ; |      X | $D78F
    .byte $0C ; |    XX  | $D790
    .byte $34 ; |  XX X  | $D791
    .byte $08 ; |    X   | $D792
    .byte $08 ; |    X   | $D793
    .byte $00 ; |        | $D794
    .byte $00 ; |        | $D795
    .byte $00 ; |        | $D796
    .byte $00 ; |        | $D797
    .byte $00 ; |        | $D798
    .byte $00 ; |        | $D799
    .byte $00 ; |        | $D79A
    .byte $00 ; |        | $D79B
    .byte $00 ; |        | $D79C
    .byte $00 ; |        | $D79D
    .byte $00 ; |        | $D79E
    .byte $00 ; |        | $D79F
    .byte $00 ; |        | $D7A0
    .byte $00 ; |        | $D7A1
    .byte $00 ; |        | $D7A2
    .byte $00 ; |        | $D7A3
    .byte $00 ; |        | $D7A4
    .byte $00 ; |        | $D7A5
    .byte $00 ; |        | $D7A6
    .byte $00 ; |        | $D7A7
    .byte $00 ; |        | $D7A8
    .byte $00 ; |        | $D7A9
    .byte $00 ; |        | $D7AA
    .byte $00 ; |        | $D7AB
    .byte $00 ; |        | $D7AC
    .byte $00 ; |        | $D7AD
    .byte $00 ; |        | $D7AE
    .byte $00 ; |        | $D7AF
    .byte $00 ; |        | $D7B0
    .byte $00 ; |        | $D7B1
    .byte $00 ; |        | $D7B2
    .byte $00 ; |        | $D7B3
    .byte $00 ; |        | $D7B4
    .byte $00 ; |        | $D7B5
    .byte $00 ; |        | $D7B6
    .byte $00 ; |        | $D7B7
    .byte $00 ; |        | $D7B8
    .byte $00 ; |        | $D7B9
    .byte $00 ; |        | $D7BA
    .byte $00 ; |        | $D7BB
    .byte $00 ; |        | $D7BC
    .byte $00 ; |        | $D7BD
    .byte $00 ; |        | $D7BE
    .byte $00 ; |        | $D7BF
    .byte $00 ; |        | $D7C0
    .byte $00 ; |        | $D7C1
    .byte $00 ; |        | $D7C2
    .byte $00 ; |        | $D7C3
    .byte $00 ; |        | $D7C4
    .byte $00 ; |        | $D7C5
    .byte $00 ; |        | $D7C6
    .byte $00 ; |        | $D7C7
    .byte $00 ; |        | $D7C8
    .byte $00 ; |        | $D7C9
    .byte $00 ; |        | $D7CA
    .byte $00 ; |        | $D7CB
    .byte $00 ; |        | $D7CC
    .byte $00 ; |        | $D7CD
    .byte $00 ; |        | $D7CE
    .byte $00 ; |        | $D7CF
    .byte $00 ; |        | $D7D0
    .byte $00 ; |        | $D7D1
    .byte $00 ; |        | $D7D2
    .byte $00 ; |        | $D7D3
    .byte $00 ; |        | $D7D4
    .byte $00 ; |        | $D7D5
    .byte $00 ; |        | $D7D6
    .byte $00 ; |        | $D7D7
    .byte $00 ; |        | $D7D8
    .byte $00 ; |        | $D7D9
    .byte $00 ; |        | $D7DA
    .byte $00 ; |        | $D7DB
    .byte $00 ; |        | $D7DC
    .byte $00 ; |        | $D7DD
    .byte $00 ; |        | $D7DE
    .byte $00 ; |        | $D7DF
    .byte $00 ; |        | $D7E0
    .byte $00 ; |        | $D7E1
    .byte $00 ; |        | $D7E2
    .byte $00 ; |        | $D7E3
    .byte $00 ; |        | $D7E4
    .byte $00 ; |        | $D7E5
    .byte $00 ; |        | $D7E6
    .byte $00 ; |        | $D7E7
    .byte $00 ; |        | $D7E8
    .byte $00 ; |        | $D7E9
    .byte $00 ; |        | $D7EA
    .byte $00 ; |        | $D7EB
    .byte $00 ; |        | $D7EC
    .byte $00 ; |        | $D7ED
    .byte $00 ; |        | $D7EE
    .byte $00 ; |        | $D7EF
    .byte $00 ; |        | $D7F0
    .byte $00 ; |        | $D7F1
    .byte $00 ; |        | $D7F2
    .byte $00 ; |        | $D7F3
    .byte $00 ; |        | $D7F4
    .byte $00 ; |        | $D7F5
    .byte $00 ; |        | $D7F6
    .byte $00 ; |        | $D7F7
    .byte $00 ; |        | $D7F8
    .byte $00 ; |        | $D7F9
    .byte $00 ; |        | $D7FA
    .byte $00 ; |        | $D7FB
    .byte $00 ; |        | $D7FC
    .byte $00 ; |        | $D7FD
    .byte $00 ; |        | $D7FE
    .byte $00 ; |        | $D7FF
    .byte $00 ; |        | $D800
    .byte $00 ; |        | $D801
    .byte $00 ; |        | $D802
    .byte $00 ; |        | $D803
    .byte $00 ; |        | $D804
    .byte $00 ; |        | $D805
    .byte $00 ; |        | $D806
    .byte $00 ; |        | $D807
    .byte $00 ; |        | $D808
    .byte $00 ; |        | $D809
    .byte $00 ; |        | $D80A
    .byte $00 ; |        | $D80B
    .byte $00 ; |        | $D80C
    .byte $00 ; |        | $D80D
    .byte $00 ; |        | $D80E
    .byte $00 ; |        | $D80F
    .byte $00 ; |        | $D810
    .byte $00 ; |        | $D811
    .byte $00 ; |        | $D812
    .byte $00 ; |        | $D813
    .byte $00 ; |        | $D814
    .byte $00 ; |        | $D815
    .byte $00 ; |        | $D816
    .byte $00 ; |        | $D817
    .byte $00 ; |        | $D818
    .byte $00 ; |        | $D819
    .byte $00 ; |        | $D81A
    .byte $00 ; |        | $D81B
    .byte $00 ; |        | $D81C
    .byte $00 ; |        | $D81D
    .byte $00 ; |        | $D81E
    .byte $00 ; |        | $D81F
    .byte $00 ; |        | $D820
    .byte $00 ; |        | $D821
    .byte $00 ; |        | $D822
    .byte $00 ; |        | $D823
    .byte $00 ; |        | $D824
    .byte $00 ; |        | $D825
    .byte $00 ; |        | $D826
    .byte $00 ; |        | $D827
    .byte $00 ; |        | $D828
    .byte $00 ; |        | $D829
    .byte $00 ; |        | $D82A
    .byte $00 ; |        | $D82B
    .byte $00 ; |        | $D82C
    .byte $00 ; |        | $D82D
    .byte $00 ; |        | $D82E
    .byte $00 ; |        | $D82F
    .byte $00 ; |        | $D830
    .byte $00 ; |        | $D831
    .byte $00 ; |        | $D832
    .byte $00 ; |        | $D833
    .byte $00 ; |        | $D834
    .byte $02 ; |      X | $D835
    .byte $3C ; |  XXXX  | $D836
    .byte $04 ; |     X  | $D837
    .byte $08 ; |    X   | $D838
    .byte $08 ; |    X   | $D839
    .byte $00 ; |        | $D83A
    .byte $00 ; |        | $D83B
    .byte $00 ; |        | $D83C
    .byte $00 ; |        | $D83D
    .byte $00 ; |        | $D83E
    .byte $00 ; |        | $D83F
    .byte $00 ; |        | $D840
    .byte $00 ; |        | $D841
    .byte $00 ; |        | $D842
    .byte $00 ; |        | $D843
    .byte $00 ; |        | $D844
    .byte $00 ; |        | $D845
    .byte $00 ; |        | $D846
    .byte $00 ; |        | $D847
    .byte $00 ; |        | $D848
    .byte $00 ; |        | $D849
    .byte $00 ; |        | $D84A
    .byte $00 ; |        | $D84B
    .byte $00 ; |        | $D84C
    .byte $00 ; |        | $D84D
    .byte $00 ; |        | $D84E
    .byte $00 ; |        | $D84F
    .byte $00 ; |        | $D850
    .byte $00 ; |        | $D851
    .byte $00 ; |        | $D852
    .byte $00 ; |        | $D853
    .byte $00 ; |        | $D854
    .byte $00 ; |        | $D855
    .byte $00 ; |        | $D856
    .byte $00 ; |        | $D857
    .byte $00 ; |        | $D858
    .byte $00 ; |        | $D859
    .byte $00 ; |        | $D85A
    .byte $00 ; |        | $D85B
    .byte $00 ; |        | $D85C
    .byte $00 ; |        | $D85D
    .byte $00 ; |        | $D85E
    .byte $00 ; |        | $D85F
    .byte $00 ; |        | $D860
    .byte $00 ; |        | $D861
    .byte $00 ; |        | $D862
    .byte $00 ; |        | $D863
    .byte $00 ; |        | $D864
    .byte $00 ; |        | $D865
    .byte $00 ; |        | $D866
    .byte $00 ; |        | $D867
    .byte $00 ; |        | $D868
    .byte $00 ; |        | $D869
    .byte $00 ; |        | $D86A
    .byte $00 ; |        | $D86B
    .byte $00 ; |        | $D86C
    .byte $00 ; |        | $D86D
    .byte $00 ; |        | $D86E
    .byte $00 ; |        | $D86F
    .byte $00 ; |        | $D870
    .byte $00 ; |        | $D871
    .byte $00 ; |        | $D872
    .byte $00 ; |        | $D873
    .byte $00 ; |        | $D874
    .byte $00 ; |        | $D875
    .byte $00 ; |        | $D876
    .byte $00 ; |        | $D877
    .byte $00 ; |        | $D878
    .byte $00 ; |        | $D879
    .byte $00 ; |        | $D87A
    .byte $00 ; |        | $D87B
    .byte $00 ; |        | $D87C
    .byte $00 ; |        | $D87D
    .byte $00 ; |        | $D87E
    .byte $00 ; |        | $D87F
    .byte $00 ; |        | $D880
    .byte $00 ; |        | $D881
    .byte $00 ; |        | $D882
    .byte $00 ; |        | $D883
    .byte $00 ; |        | $D884
    .byte $00 ; |        | $D885
    .byte $00 ; |        | $D886
    .byte $00 ; |        | $D887
    .byte $00 ; |        | $D888
    .byte $00 ; |        | $D889
    .byte $00 ; |        | $D88A
    .byte $00 ; |        | $D88B
    .byte $00 ; |        | $D88C
    .byte $00 ; |        | $D88D
    .byte $00 ; |        | $D88E
    .byte $00 ; |        | $D88F
    .byte $00 ; |        | $D890
    .byte $00 ; |        | $D891
    .byte $00 ; |        | $D892
    .byte $00 ; |        | $D893
    .byte $00 ; |        | $D894
    .byte $00 ; |        | $D895
    .byte $00 ; |        | $D896
    .byte $00 ; |        | $D897
    .byte $00 ; |        | $D898
    .byte $00 ; |        | $D899
    .byte $00 ; |        | $D89A
    .byte $00 ; |        | $D89B
    .byte $00 ; |        | $D89C
    .byte $00 ; |        | $D89D
    .byte $00 ; |        | $D89E
    .byte $00 ; |        | $D89F
    .byte $00 ; |        | $D8A0
    .byte $00 ; |        | $D8A1
    .byte $00 ; |        | $D8A2
    .byte $00 ; |        | $D8A3
    .byte $00 ; |        | $D8A4
    .byte $00 ; |        | $D8A5
    .byte $00 ; |        | $D8A6
    .byte $00 ; |        | $D8A7
    .byte $00 ; |        | $D8A8
    .byte $00 ; |        | $D8A9
    .byte $00 ; |        | $D8AA
    .byte $00 ; |        | $D8AB
    .byte $00 ; |        | $D8AC
    .byte $00 ; |        | $D8AD
    .byte $00 ; |        | $D8AE
    .byte $00 ; |        | $D8AF
    .byte $00 ; |        | $D8B0
    .byte $00 ; |        | $D8B1
    .byte $00 ; |        | $D8B2
    .byte $00 ; |        | $D8B3
    .byte $00 ; |        | $D8B4
    .byte $00 ; |        | $D8B5
    .byte $00 ; |        | $D8B6
    .byte $00 ; |        | $D8B7
    .byte $00 ; |        | $D8B8
    .byte $00 ; |        | $D8B9
    .byte $00 ; |        | $D8BA
    .byte $00 ; |        | $D8BB
    .byte $00 ; |        | $D8BC
    .byte $00 ; |        | $D8BD
    .byte $00 ; |        | $D8BE
    .byte $00 ; |        | $D8BF
    .byte $00 ; |        | $D8C0
    .byte $00 ; |        | $D8C1
    .byte $00 ; |        | $D8C2
    .byte $00 ; |        | $D8C3
    .byte $00 ; |        | $D8C4
    .byte $00 ; |        | $D8C5
    .byte $00 ; |        | $D8C6
    .byte $00 ; |        | $D8C7
    .byte $00 ; |        | $D8C8
    .byte $00 ; |        | $D8C9
    .byte $00 ; |        | $D8CA
    .byte $00 ; |        | $D8CB
    .byte $00 ; |        | $D8CC
    .byte $00 ; |        | $D8CD
    .byte $00 ; |        | $D8CE
    .byte $00 ; |        | $D8CF
    .byte $00 ; |        | $D8D0
    .byte $00 ; |        | $D8D1
    .byte $00 ; |        | $D8D2
    .byte $00 ; |        | $D8D3
    .byte $00 ; |        | $D8D4
    .byte $00 ; |        | $D8D5
    .byte $00 ; |        | $D8D6
    .byte $00 ; |        | $D8D7
    .byte $00 ; |        | $D8D8
    .byte $00 ; |        | $D8D9
    .byte $00 ; |        | $D8DA
    .byte $20 ; |  X     | $D8DB
    .byte $18 ; |   XX   | $D8DC
    .byte $06 ; |     XX | $D8DD
    .byte $18 ; |   XX   | $D8DE
    .byte $20 ; |  X     | $D8DF
    .byte $00 ; |        | $D8E0
    .byte $00 ; |        | $D8E1
    .byte $00 ; |        | $D8E2
    .byte $00 ; |        | $D8E3
    .byte $00 ; |        | $D8E4
    .byte $00 ; |        | $D8E5
    .byte $00 ; |        | $D8E6
    .byte $00 ; |        | $D8E7
    .byte $00 ; |        | $D8E8
    .byte $00 ; |        | $D8E9
    .byte $00 ; |        | $D8EA
    .byte $00 ; |        | $D8EB
    .byte $00 ; |        | $D8EC
    .byte $00 ; |        | $D8ED
    .byte $00 ; |        | $D8EE
    .byte $00 ; |        | $D8EF
    .byte $00 ; |        | $D8F0
    .byte $00 ; |        | $D8F1
    .byte $00 ; |        | $D8F2
    .byte $00 ; |        | $D8F3
    .byte $00 ; |        | $D8F4
    .byte $00 ; |        | $D8F5
    .byte $00 ; |        | $D8F6
    .byte $00 ; |        | $D8F7
    .byte $00 ; |        | $D8F8
    .byte $00 ; |        | $D8F9
    .byte $00 ; |        | $D8FA
    .byte $00 ; |        | $D8FB
    .byte $00 ; |        | $D8FC
    .byte $00 ; |        | $D8FD
    .byte $00 ; |        | $D8FE
    .byte $00 ; |        | $D8FF
    .byte $00 ; |        | $D900
    .byte $00 ; |        | $D901
    .byte $00 ; |        | $D902
    .byte $00 ; |        | $D903
    .byte $00 ; |        | $D904
    .byte $00 ; |        | $D905
    .byte $00 ; |        | $D906
    .byte $00 ; |        | $D907
    .byte $00 ; |        | $D908
    .byte $00 ; |        | $D909
    .byte $00 ; |        | $D90A
    .byte $00 ; |        | $D90B
    .byte $00 ; |        | $D90C
    .byte $00 ; |        | $D90D
    .byte $00 ; |        | $D90E
    .byte $00 ; |        | $D90F
    .byte $00 ; |        | $D910
    .byte $00 ; |        | $D911
    .byte $00 ; |        | $D912
    .byte $00 ; |        | $D913
    .byte $00 ; |        | $D914
    .byte $00 ; |        | $D915
    .byte $00 ; |        | $D916
    .byte $00 ; |        | $D917
    .byte $00 ; |        | $D918
    .byte $00 ; |        | $D919
    .byte $00 ; |        | $D91A
    .byte $00 ; |        | $D91B
    .byte $00 ; |        | $D91C
    .byte $00 ; |        | $D91D
    .byte $00 ; |        | $D91E
    .byte $00 ; |        | $D91F
    .byte $00 ; |        | $D920
    .byte $00 ; |        | $D921
    .byte $00 ; |        | $D922
    .byte $00 ; |        | $D923
    .byte $00 ; |        | $D924
    .byte $00 ; |        | $D925
    .byte $00 ; |        | $D926
    .byte $00 ; |        | $D927
    .byte $00 ; |        | $D928
    .byte $00 ; |        | $D929
    .byte $00 ; |        | $D92A
    .byte $00 ; |        | $D92B
    .byte $00 ; |        | $D92C
    .byte $00 ; |        | $D92D
    .byte $00 ; |        | $D92E
    .byte $00 ; |        | $D92F
    .byte $00 ; |        | $D930
    .byte $00 ; |        | $D931
    .byte $00 ; |        | $D932
    .byte $00 ; |        | $D933
    .byte $00 ; |        | $D934
    .byte $00 ; |        | $D935
    .byte $00 ; |        | $D936
    .byte $00 ; |        | $D937
    .byte $00 ; |        | $D938
    .byte $00 ; |        | $D939
    .byte $00 ; |        | $D93A
    .byte $00 ; |        | $D93B
    .byte $00 ; |        | $D93C
    .byte $00 ; |        | $D93D
    .byte $00 ; |        | $D93E
    .byte $00 ; |        | $D93F
    .byte $00 ; |        | $D940
    .byte $00 ; |        | $D941
    .byte $00 ; |        | $D942
    .byte $00 ; |        | $D943
    .byte $00 ; |        | $D944
    .byte $00 ; |        | $D945
    .byte $00 ; |        | $D946
    .byte $00 ; |        | $D947
    .byte $00 ; |        | $D948
    .byte $00 ; |        | $D949
    .byte $00 ; |        | $D94A
    .byte $00 ; |        | $D94B
    .byte $00 ; |        | $D94C
    .byte $00 ; |        | $D94D
    .byte $00 ; |        | $D94E
    .byte $00 ; |        | $D94F
    .byte $00 ; |        | $D950
    .byte $00 ; |        | $D951
    .byte $00 ; |        | $D952
    .byte $00 ; |        | $D953
    .byte $00 ; |        | $D954
    .byte $00 ; |        | $D955
    .byte $00 ; |        | $D956
    .byte $00 ; |        | $D957
    .byte $00 ; |        | $D958
    .byte $00 ; |        | $D959
    .byte $00 ; |        | $D95A
    .byte $00 ; |        | $D95B
    .byte $00 ; |        | $D95C
    .byte $00 ; |        | $D95D
    .byte $00 ; |        | $D95E
    .byte $00 ; |        | $D95F
    .byte $00 ; |        | $D960
    .byte $00 ; |        | $D961
    .byte $00 ; |        | $D962
    .byte $00 ; |        | $D963
    .byte $00 ; |        | $D964
    .byte $00 ; |        | $D965
    .byte $00 ; |        | $D966
    .byte $00 ; |        | $D967
    .byte $00 ; |        | $D968
    .byte $00 ; |        | $D969
    .byte $00 ; |        | $D96A
    .byte $00 ; |        | $D96B
    .byte $00 ; |        | $D96C
    .byte $00 ; |        | $D96D
    .byte $00 ; |        | $D96E
    .byte $00 ; |        | $D96F
    .byte $00 ; |        | $D970
    .byte $00 ; |        | $D971
    .byte $00 ; |        | $D972
    .byte $00 ; |        | $D973
    .byte $00 ; |        | $D974
    .byte $00 ; |        | $D975
    .byte $00 ; |        | $D976
    .byte $00 ; |        | $D977
    .byte $00 ; |        | $D978
    .byte $00 ; |        | $D979
    .byte $00 ; |        | $D97A
    .byte $00 ; |        | $D97B
    .byte $00 ; |        | $D97C
    .byte $00 ; |        | $D97D
    .byte $00 ; |        | $D97E
    .byte $00 ; |        | $D97F
    .byte $00 ; |        | $D980
    .byte $08 ; |    X   | $D981
    .byte $08 ; |    X   | $D982
    .byte $04 ; |     X  | $D983
    .byte $3E ; |  XXXXX | $D984
    .byte $02 ; |      X | $D985
    .byte $00 ; |        | $D986
    .byte $00 ; |        | $D987
    .byte $00 ; |        | $D988
    .byte $00 ; |        | $D989
    .byte $00 ; |        | $D98A
    .byte $00 ; |        | $D98B
    .byte $00 ; |        | $D98C
    .byte $00 ; |        | $D98D
    .byte $00 ; |        | $D98E
    .byte $00 ; |        | $D98F
    .byte $00 ; |        | $D990
    .byte $00 ; |        | $D991
    .byte $00 ; |        | $D992
    .byte $00 ; |        | $D993
    .byte $00 ; |        | $D994
    .byte $00 ; |        | $D995
    .byte $00 ; |        | $D996
    .byte $00 ; |        | $D997
    .byte $00 ; |        | $D998
    .byte $00 ; |        | $D999
    .byte $00 ; |        | $D99A
    .byte $00 ; |        | $D99B
    .byte $00 ; |        | $D99C
    .byte $00 ; |        | $D99D
    .byte $00 ; |        | $D99E
    .byte $00 ; |        | $D99F
    .byte $00 ; |        | $D9A0
    .byte $00 ; |        | $D9A1
    .byte $00 ; |        | $D9A2
    .byte $00 ; |        | $D9A3
    .byte $00 ; |        | $D9A4
    .byte $00 ; |        | $D9A5
    .byte $00 ; |        | $D9A6
    .byte $00 ; |        | $D9A7
    .byte $00 ; |        | $D9A8
    .byte $00 ; |        | $D9A9
    .byte $00 ; |        | $D9AA
    .byte $00 ; |        | $D9AB
    .byte $00 ; |        | $D9AC
    .byte $00 ; |        | $D9AD
    .byte $00 ; |        | $D9AE
    .byte $00 ; |        | $D9AF
    .byte $00 ; |        | $D9B0
    .byte $00 ; |        | $D9B1
    .byte $00 ; |        | $D9B2
    .byte $00 ; |        | $D9B3
    .byte $00 ; |        | $D9B4
    .byte $00 ; |        | $D9B5
    .byte $00 ; |        | $D9B6
    .byte $00 ; |        | $D9B7
    .byte $00 ; |        | $D9B8
    .byte $00 ; |        | $D9B9
    .byte $00 ; |        | $D9BA
    .byte $00 ; |        | $D9BB
    .byte $00 ; |        | $D9BC
    .byte $00 ; |        | $D9BD
    .byte $00 ; |        | $D9BE
    .byte $00 ; |        | $D9BF
    .byte $00 ; |        | $D9C0
    .byte $00 ; |        | $D9C1
    .byte $00 ; |        | $D9C2
    .byte $00 ; |        | $D9C3
    .byte $00 ; |        | $D9C4
    .byte $00 ; |        | $D9C5
    .byte $00 ; |        | $D9C6
    .byte $00 ; |        | $D9C7
    .byte $00 ; |        | $D9C8
    .byte $00 ; |        | $D9C9
    .byte $00 ; |        | $D9CA
    .byte $00 ; |        | $D9CB
    .byte $00 ; |        | $D9CC
    .byte $00 ; |        | $D9CD
    .byte $00 ; |        | $D9CE
    .byte $00 ; |        | $D9CF
    .byte $00 ; |        | $D9D0
    .byte $00 ; |        | $D9D1
    .byte $00 ; |        | $D9D2
    .byte $00 ; |        | $D9D3
    .byte $00 ; |        | $D9D4
    .byte $00 ; |        | $D9D5
    .byte $00 ; |        | $D9D6
    .byte $00 ; |        | $D9D7
    .byte $00 ; |        | $D9D8
    .byte $00 ; |        | $D9D9
    .byte $00 ; |        | $D9DA
    .byte $00 ; |        | $D9DB
    .byte $00 ; |        | $D9DC
    .byte $00 ; |        | $D9DD
    .byte $00 ; |        | $D9DE
    .byte $00 ; |        | $D9DF
    .byte $00 ; |        | $D9E0
    .byte $00 ; |        | $D9E1
    .byte $00 ; |        | $D9E2
    .byte $00 ; |        | $D9E3
    .byte $00 ; |        | $D9E4
    .byte $00 ; |        | $D9E5
    .byte $00 ; |        | $D9E6
    .byte $00 ; |        | $D9E7
    .byte $00 ; |        | $D9E8
    .byte $00 ; |        | $D9E9
    .byte $00 ; |        | $D9EA
    .byte $00 ; |        | $D9EB
    .byte $00 ; |        | $D9EC
    .byte $00 ; |        | $D9ED
    .byte $00 ; |        | $D9EE
    .byte $00 ; |        | $D9EF
    .byte $00 ; |        | $D9F0
    .byte $00 ; |        | $D9F1
    .byte $00 ; |        | $D9F2
    .byte $00 ; |        | $D9F3
    .byte $00 ; |        | $D9F4
    .byte $00 ; |        | $D9F5
    .byte $00 ; |        | $D9F6
    .byte $00 ; |        | $D9F7
    .byte $00 ; |        | $D9F8
    .byte $00 ; |        | $D9F9
    .byte $00 ; |        | $D9FA
    .byte $00 ; |        | $D9FB
    .byte $00 ; |        | $D9FC
    .byte $00 ; |        | $D9FD
    .byte $00 ; |        | $D9FE
    .byte $00 ; |        | $D9FF
    .byte $00 ; |        | $DA00
    .byte $00 ; |        | $DA01
    .byte $00 ; |        | $DA02
    .byte $00 ; |        | $DA03
    .byte $00 ; |        | $DA04
    .byte $00 ; |        | $DA05
    .byte $00 ; |        | $DA06
    .byte $00 ; |        | $DA07
    .byte $00 ; |        | $DA08
    .byte $00 ; |        | $DA09
    .byte $00 ; |        | $DA0A
    .byte $00 ; |        | $DA0B
    .byte $00 ; |        | $DA0C
    .byte $00 ; |        | $DA0D
    .byte $00 ; |        | $DA0E
    .byte $00 ; |        | $DA0F
    .byte $00 ; |        | $DA10
    .byte $00 ; |        | $DA11
    .byte $00 ; |        | $DA12
    .byte $00 ; |        | $DA13
    .byte $00 ; |        | $DA14
    .byte $00 ; |        | $DA15
    .byte $00 ; |        | $DA16
    .byte $00 ; |        | $DA17
    .byte $00 ; |        | $DA18
    .byte $00 ; |        | $DA19
    .byte $00 ; |        | $DA1A
    .byte $00 ; |        | $DA1B
    .byte $00 ; |        | $DA1C
    .byte $00 ; |        | $DA1D
    .byte $00 ; |        | $DA1E
    .byte $00 ; |        | $DA1F
    .byte $00 ; |        | $DA20
    .byte $00 ; |        | $DA21
    .byte $00 ; |        | $DA22
    .byte $00 ; |        | $DA23
    .byte $00 ; |        | $DA24
    .byte $00 ; |        | $DA25
    .byte $00 ; |        | $DA26
    .byte $08 ; |    X   | $DA27
    .byte $08 ; |    X   | $DA28
    .byte $34 ; |  XX X  | $DA29
    .byte $0C ; |    XX  | $DA2A
    .byte $02 ; |      X | $DA2B
LDA2C:
    .byte $00 ; |        | $DA2C
    .byte $00 ; |        | $DA2D
    .byte $00 ; |        | $DA2E
    .byte $00 ; |        | $DA2F
    .byte $00 ; |        | $DA30
    .byte $00 ; |        | $DA31
    .byte $00 ; |        | $DA32
    .byte $00 ; |        | $DA33
    .byte $00 ; |        | $DA34
    .byte $00 ; |        | $DA35
    .byte $00 ; |        | $DA36
    .byte $00 ; |        | $DA37
    .byte $00 ; |        | $DA38
    .byte $00 ; |        | $DA39
    .byte $00 ; |        | $DA3A
    .byte $00 ; |        | $DA3B
    .byte $00 ; |        | $DA3C
    .byte $00 ; |        | $DA3D
    .byte $00 ; |        | $DA3E
    .byte $00 ; |        | $DA3F
    .byte $00 ; |        | $DA40
    .byte $00 ; |        | $DA41
    .byte $00 ; |        | $DA42
    .byte $00 ; |        | $DA43
    .byte $00 ; |        | $DA44
    .byte $00 ; |        | $DA45
    .byte $00 ; |        | $DA46
    .byte $00 ; |        | $DA47
    .byte $00 ; |        | $DA48
    .byte $00 ; |        | $DA49
    .byte $00 ; |        | $DA4A
    .byte $00 ; |        | $DA4B
    .byte $00 ; |        | $DA4C
    .byte $00 ; |        | $DA4D
    .byte $00 ; |        | $DA4E
    .byte $00 ; |        | $DA4F
    .byte $00 ; |        | $DA50
    .byte $00 ; |        | $DA51
    .byte $00 ; |        | $DA52
    .byte $00 ; |        | $DA53
    .byte $00 ; |        | $DA54
    .byte $00 ; |        | $DA55
    .byte $00 ; |        | $DA56
    .byte $00 ; |        | $DA57
    .byte $00 ; |        | $DA58
    .byte $00 ; |        | $DA59
    .byte $00 ; |        | $DA5A
    .byte $00 ; |        | $DA5B
    .byte $00 ; |        | $DA5C
    .byte $00 ; |        | $DA5D
    .byte $00 ; |        | $DA5E
    .byte $00 ; |        | $DA5F
    .byte $00 ; |        | $DA60
    .byte $00 ; |        | $DA61
    .byte $00 ; |        | $DA62
    .byte $00 ; |        | $DA63
    .byte $00 ; |        | $DA64
    .byte $00 ; |        | $DA65
    .byte $00 ; |        | $DA66
    .byte $00 ; |        | $DA67
    .byte $00 ; |        | $DA68
    .byte $00 ; |        | $DA69
    .byte $00 ; |        | $DA6A
    .byte $00 ; |        | $DA6B
    .byte $00 ; |        | $DA6C
    .byte $00 ; |        | $DA6D
    .byte $00 ; |        | $DA6E
    .byte $00 ; |        | $DA6F
    .byte $00 ; |        | $DA70
    .byte $00 ; |        | $DA71
    .byte $00 ; |        | $DA72
    .byte $00 ; |        | $DA73
    .byte $00 ; |        | $DA74
    .byte $00 ; |        | $DA75
    .byte $00 ; |        | $DA76
    .byte $00 ; |        | $DA77
    .byte $00 ; |        | $DA78
    .byte $00 ; |        | $DA79
    .byte $00 ; |        | $DA7A
    .byte $00 ; |        | $DA7B
    .byte $00 ; |        | $DA7C
    .byte $00 ; |        | $DA7D
    .byte $00 ; |        | $DA7E
    .byte $00 ; |        | $DA7F
    .byte $00 ; |        | $DA80
    .byte $00 ; |        | $DA81
    .byte $00 ; |        | $DA82
    .byte $00 ; |        | $DA83
    .byte $00 ; |        | $DA84
    .byte $00 ; |        | $DA85
    .byte $00 ; |        | $DA86
    .byte $00 ; |        | $DA87
    .byte $00 ; |        | $DA88
    .byte $00 ; |        | $DA89
    .byte $00 ; |        | $DA8A
    .byte $00 ; |        | $DA8B
    .byte $00 ; |        | $DA8C
    .byte $00 ; |        | $DA8D
    .byte $00 ; |        | $DA8E
    .byte $00 ; |        | $DA8F
    .byte $00 ; |        | $DA90
    .byte $00 ; |        | $DA91
    .byte $00 ; |        | $DA92
    .byte $00 ; |        | $DA93
    .byte $00 ; |        | $DA94
    .byte $00 ; |        | $DA95
    .byte $00 ; |        | $DA96
    .byte $00 ; |        | $DA97
    .byte $00 ; |        | $DA98
    .byte $00 ; |        | $DA99
    .byte $00 ; |        | $DA9A
    .byte $00 ; |        | $DA9B
    .byte $00 ; |        | $DA9C
    .byte $00 ; |        | $DA9D
    .byte $00 ; |        | $DA9E
    .byte $00 ; |        | $DA9F
    .byte $00 ; |        | $DAA0
    .byte $00 ; |        | $DAA1
    .byte $00 ; |        | $DAA2
    .byte $00 ; |        | $DAA3
    .byte $00 ; |        | $DAA4
    .byte $00 ; |        | $DAA5
    .byte $00 ; |        | $DAA6
    .byte $00 ; |        | $DAA7
    .byte $00 ; |        | $DAA8
    .byte $00 ; |        | $DAA9
    .byte $00 ; |        | $DAAA
    .byte $00 ; |        | $DAAB
    .byte $00 ; |        | $DAAC
    .byte $00 ; |        | $DAAD
    .byte $00 ; |        | $DAAE
    .byte $00 ; |        | $DAAF
    .byte $00 ; |        | $DAB0
    .byte $00 ; |        | $DAB1
    .byte $00 ; |        | $DAB2
    .byte $00 ; |        | $DAB3
    .byte $00 ; |        | $DAB4
    .byte $00 ; |        | $DAB5
    .byte $00 ; |        | $DAB6
    .byte $00 ; |        | $DAB7
    .byte $00 ; |        | $DAB8
    .byte $00 ; |        | $DAB9
    .byte $00 ; |        | $DABA
    .byte $00 ; |        | $DABB
    .byte $00 ; |        | $DABC
    .byte $00 ; |        | $DABD
    .byte $00 ; |        | $DABE
    .byte $00 ; |        | $DABF
    .byte $00 ; |        | $DAC0
    .byte $00 ; |        | $DAC1
    .byte $00 ; |        | $DAC2
    .byte $00 ; |        | $DAC3
    .byte $00 ; |        | $DAC4
    .byte $00 ; |        | $DAC5
    .byte $00 ; |        | $DAC6
    .byte $00 ; |        | $DAC7
    .byte $00 ; |        | $DAC8
    .byte $00 ; |        | $DAC9
    .byte $00 ; |        | $DACA
    .byte $00 ; |        | $DACB
    .byte $04 ; |     X  | $DACC
    .byte $24 ; |  X  X  | $DACD
    .byte $14 ; |   X X  | $DACE
    .byte $0C ; |    XX  | $DACF
    .byte $04 ; |     X  | $DAD0
    .byte $00 ; |        | $DAD1
    .byte $00 ; |        | $DAD2
    .byte $00 ; |        | $DAD3
    .byte $00 ; |        | $DAD4
    .byte $00 ; |        | $DAD5
    .byte $00 ; |        | $DAD6
    .byte $00 ; |        | $DAD7
    .byte $00 ; |        | $DAD8
    .byte $00 ; |        | $DAD9
    .byte $00 ; |        | $DADA
    .byte $00 ; |        | $DADB
    .byte $00 ; |        | $DADC
    .byte $00 ; |        | $DADD
    .byte $00 ; |        | $DADE
    .byte $00 ; |        | $DADF
    .byte $00 ; |        | $DAE0
    .byte $00 ; |        | $DAE1
    .byte $00 ; |        | $DAE2
    .byte $00 ; |        | $DAE3
    .byte $00 ; |        | $DAE4
    .byte $00 ; |        | $DAE5
    .byte $00 ; |        | $DAE6
    .byte $00 ; |        | $DAE7
    .byte $00 ; |        | $DAE8
    .byte $00 ; |        | $DAE9
    .byte $00 ; |        | $DAEA
    .byte $00 ; |        | $DAEB
    .byte $00 ; |        | $DAEC
    .byte $00 ; |        | $DAED
    .byte $00 ; |        | $DAEE
    .byte $00 ; |        | $DAEF
    .byte $00 ; |        | $DAF0
    .byte $00 ; |        | $DAF1
    .byte $00 ; |        | $DAF2
    .byte $00 ; |        | $DAF3
    .byte $00 ; |        | $DAF4
    .byte $00 ; |        | $DAF5
    .byte $00 ; |        | $DAF6
    .byte $00 ; |        | $DAF7
    .byte $00 ; |        | $DAF8
    .byte $00 ; |        | $DAF9
    .byte $00 ; |        | $DAFA
    .byte $00 ; |        | $DAFB
    .byte $00 ; |        | $DAFC
    .byte $00 ; |        | $DAFD
    .byte $00 ; |        | $DAFE
    .byte $00 ; |        | $DAFF
    .byte $00 ; |        | $DB00
    .byte $00 ; |        | $DB01
    .byte $00 ; |        | $DB02
    .byte $00 ; |        | $DB03
    .byte $00 ; |        | $DB04
    .byte $00 ; |        | $DB05
    .byte $00 ; |        | $DB06
    .byte $00 ; |        | $DB07
    .byte $00 ; |        | $DB08
    .byte $00 ; |        | $DB09
    .byte $00 ; |        | $DB0A
    .byte $00 ; |        | $DB0B
    .byte $00 ; |        | $DB0C
    .byte $00 ; |        | $DB0D
    .byte $00 ; |        | $DB0E
    .byte $00 ; |        | $DB0F
    .byte $00 ; |        | $DB10
    .byte $00 ; |        | $DB11
    .byte $00 ; |        | $DB12
    .byte $00 ; |        | $DB13
    .byte $00 ; |        | $DB14
    .byte $00 ; |        | $DB15
    .byte $00 ; |        | $DB16
    .byte $00 ; |        | $DB17
    .byte $00 ; |        | $DB18
    .byte $00 ; |        | $DB19
    .byte $00 ; |        | $DB1A
    .byte $00 ; |        | $DB1B
    .byte $00 ; |        | $DB1C
    .byte $00 ; |        | $DB1D
    .byte $00 ; |        | $DB1E
    .byte $00 ; |        | $DB1F
    .byte $00 ; |        | $DB20
    .byte $00 ; |        | $DB21
    .byte $00 ; |        | $DB22
    .byte $00 ; |        | $DB23
    .byte $00 ; |        | $DB24
    .byte $00 ; |        | $DB25
    .byte $00 ; |        | $DB26
    .byte $00 ; |        | $DB27
    .byte $00 ; |        | $DB28
    .byte $00 ; |        | $DB29
    .byte $00 ; |        | $DB2A
    .byte $00 ; |        | $DB2B
    .byte $00 ; |        | $DB2C
    .byte $00 ; |        | $DB2D
    .byte $00 ; |        | $DB2E
    .byte $00 ; |        | $DB2F
    .byte $00 ; |        | $DB30
    .byte $00 ; |        | $DB31
    .byte $00 ; |        | $DB32
    .byte $00 ; |        | $DB33
    .byte $00 ; |        | $DB34
    .byte $00 ; |        | $DB35
    .byte $00 ; |        | $DB36
    .byte $00 ; |        | $DB37
    .byte $00 ; |        | $DB38
    .byte $00 ; |        | $DB39
    .byte $00 ; |        | $DB3A
    .byte $00 ; |        | $DB3B
    .byte $00 ; |        | $DB3C
    .byte $00 ; |        | $DB3D
    .byte $00 ; |        | $DB3E
    .byte $00 ; |        | $DB3F
    .byte $00 ; |        | $DB40
    .byte $00 ; |        | $DB41
    .byte $00 ; |        | $DB42
    .byte $00 ; |        | $DB43
    .byte $00 ; |        | $DB44
    .byte $00 ; |        | $DB45
    .byte $00 ; |        | $DB46
    .byte $00 ; |        | $DB47
    .byte $00 ; |        | $DB48
    .byte $00 ; |        | $DB49
    .byte $00 ; |        | $DB4A
    .byte $00 ; |        | $DB4B
    .byte $00 ; |        | $DB4C
    .byte $00 ; |        | $DB4D
    .byte $00 ; |        | $DB4E
    .byte $00 ; |        | $DB4F
    .byte $00 ; |        | $DB50
    .byte $00 ; |        | $DB51
    .byte $00 ; |        | $DB52
    .byte $00 ; |        | $DB53
    .byte $00 ; |        | $DB54
    .byte $00 ; |        | $DB55
    .byte $00 ; |        | $DB56
    .byte $00 ; |        | $DB57
    .byte $00 ; |        | $DB58
    .byte $00 ; |        | $DB59
    .byte $00 ; |        | $DB5A
    .byte $00 ; |        | $DB5B
    .byte $00 ; |        | $DB5C
    .byte $00 ; |        | $DB5D
    .byte $00 ; |        | $DB5E
    .byte $00 ; |        | $DB5F
    .byte $00 ; |        | $DB60
    .byte $00 ; |        | $DB61
    .byte $00 ; |        | $DB62
    .byte $00 ; |        | $DB63
    .byte $00 ; |        | $DB64
    .byte $00 ; |        | $DB65
    .byte $00 ; |        | $DB66
    .byte $00 ; |        | $DB67
    .byte $00 ; |        | $DB68
    .byte $00 ; |        | $DB69
    .byte $00 ; |        | $DB6A
    .byte $00 ; |        | $DB6B
    .byte $00 ; |        | $DB6C
    .byte $00 ; |        | $DB6D
    .byte $00 ; |        | $DB6E
    .byte $00 ; |        | $DB6F
    .byte $00 ; |        | $DB70
    .byte $00 ; |        | $DB71
    .byte $22 ; |  X   X | $DB72
    .byte $14 ; |   X X  | $DB73
    .byte $14 ; |   X X  | $DB74
    .byte $08 ; |    X   | $DB75
    .byte $08 ; |    X   | $DB76
    .byte $00 ; |        | $DB77
    .byte $00 ; |        | $DB78
    .byte $00 ; |        | $DB79
    .byte $00 ; |        | $DB7A
    .byte $00 ; |        | $DB7B
    .byte $00 ; |        | $DB7C
    .byte $00 ; |        | $DB7D
    .byte $00 ; |        | $DB7E
    .byte $00 ; |        | $DB7F
    .byte $00 ; |        | $DB80
    .byte $00 ; |        | $DB81
    .byte $00 ; |        | $DB82
    .byte $00 ; |        | $DB83
    .byte $00 ; |        | $DB84
    .byte $00 ; |        | $DB85
    .byte $00 ; |        | $DB86
    .byte $00 ; |        | $DB87
    .byte $00 ; |        | $DB88
    .byte $00 ; |        | $DB89
    .byte $00 ; |        | $DB8A
    .byte $00 ; |        | $DB8B
    .byte $00 ; |        | $DB8C
    .byte $00 ; |        | $DB8D
    .byte $00 ; |        | $DB8E
    .byte $00 ; |        | $DB8F
    .byte $00 ; |        | $DB90
    .byte $00 ; |        | $DB91
    .byte $00 ; |        | $DB92
    .byte $00 ; |        | $DB93
    .byte $00 ; |        | $DB94
    .byte $00 ; |        | $DB95
    .byte $00 ; |        | $DB96
    .byte $00 ; |        | $DB97
    .byte $00 ; |        | $DB98
    .byte $00 ; |        | $DB99
    .byte $00 ; |        | $DB9A
    .byte $00 ; |        | $DB9B
    .byte $00 ; |        | $DB9C
    .byte $00 ; |        | $DB9D
    .byte $00 ; |        | $DB9E
    .byte $00 ; |        | $DB9F
    .byte $00 ; |        | $DBA0
    .byte $00 ; |        | $DBA1
    .byte $00 ; |        | $DBA2
    .byte $00 ; |        | $DBA3
    .byte $00 ; |        | $DBA4
    .byte $00 ; |        | $DBA5
    .byte $00 ; |        | $DBA6
    .byte $00 ; |        | $DBA7
    .byte $00 ; |        | $DBA8
    .byte $00 ; |        | $DBA9
    .byte $00 ; |        | $DBAA
    .byte $00 ; |        | $DBAB
    .byte $00 ; |        | $DBAC
    .byte $00 ; |        | $DBAD
    .byte $00 ; |        | $DBAE
    .byte $00 ; |        | $DBAF
    .byte $00 ; |        | $DBB0
    .byte $00 ; |        | $DBB1
    .byte $00 ; |        | $DBB2
    .byte $00 ; |        | $DBB3
    .byte $00 ; |        | $DBB4
    .byte $00 ; |        | $DBB5
    .byte $00 ; |        | $DBB6
    .byte $00 ; |        | $DBB7
    .byte $00 ; |        | $DBB8
    .byte $00 ; |        | $DBB9
    .byte $00 ; |        | $DBBA
    .byte $00 ; |        | $DBBB
    .byte $00 ; |        | $DBBC
    .byte $00 ; |        | $DBBD
    .byte $00 ; |        | $DBBE
    .byte $00 ; |        | $DBBF
    .byte $00 ; |        | $DBC0
    .byte $00 ; |        | $DBC1
    .byte $00 ; |        | $DBC2
    .byte $00 ; |        | $DBC3
    .byte $00 ; |        | $DBC4
    .byte $00 ; |        | $DBC5
    .byte $00 ; |        | $DBC6
    .byte $00 ; |        | $DBC7
    .byte $00 ; |        | $DBC8
    .byte $00 ; |        | $DBC9
    .byte $00 ; |        | $DBCA
    .byte $00 ; |        | $DBCB
    .byte $00 ; |        | $DBCC
    .byte $00 ; |        | $DBCD
    .byte $00 ; |        | $DBCE
    .byte $00 ; |        | $DBCF
    .byte $00 ; |        | $DBD0
    .byte $00 ; |        | $DBD1
    .byte $00 ; |        | $DBD2
    .byte $00 ; |        | $DBD3
    .byte $00 ; |        | $DBD4
    .byte $00 ; |        | $DBD5
    .byte $00 ; |        | $DBD6
    .byte $00 ; |        | $DBD7
    .byte $00 ; |        | $DBD8
    .byte $00 ; |        | $DBD9
    .byte $00 ; |        | $DBDA
    .byte $00 ; |        | $DBDB
    .byte $00 ; |        | $DBDC
    .byte $00 ; |        | $DBDD
    .byte $00 ; |        | $DBDE
    .byte $00 ; |        | $DBDF
    .byte $00 ; |        | $DBE0
    .byte $00 ; |        | $DBE1
    .byte $00 ; |        | $DBE2
    .byte $00 ; |        | $DBE3
    .byte $00 ; |        | $DBE4
    .byte $00 ; |        | $DBE5
    .byte $00 ; |        | $DBE6
    .byte $00 ; |        | $DBE7
    .byte $00 ; |        | $DBE8
    .byte $00 ; |        | $DBE9
    .byte $00 ; |        | $DBEA
    .byte $00 ; |        | $DBEB
    .byte $00 ; |        | $DBEC
    .byte $00 ; |        | $DBED
    .byte $00 ; |        | $DBEE
    .byte $00 ; |        | $DBEF
    .byte $00 ; |        | $DBF0
    .byte $00 ; |        | $DBF1
    .byte $00 ; |        | $DBF2
    .byte $00 ; |        | $DBF3
    .byte $00 ; |        | $DBF4
    .byte $00 ; |        | $DBF5
    .byte $00 ; |        | $DBF6
    .byte $00 ; |        | $DBF7
    .byte $00 ; |        | $DBF8
    .byte $00 ; |        | $DBF9
    .byte $00 ; |        | $DBFA
    .byte $00 ; |        | $DBFB
    .byte $00 ; |        | $DBFC
    .byte $00 ; |        | $DBFD
    .byte $00 ; |        | $DBFE
    .byte $00 ; |        | $DBFF
    .byte $00 ; |        | $DC00
    .byte $00 ; |        | $DC01
    .byte $00 ; |        | $DC02
    .byte $00 ; |        | $DC03
    .byte $00 ; |        | $DC04
    .byte $00 ; |        | $DC05
    .byte $00 ; |        | $DC06
    .byte $00 ; |        | $DC07
    .byte $00 ; |        | $DC08
    .byte $00 ; |        | $DC09
    .byte $00 ; |        | $DC0A
    .byte $00 ; |        | $DC0B
    .byte $00 ; |        | $DC0C
    .byte $00 ; |        | $DC0D
    .byte $00 ; |        | $DC0E
    .byte $00 ; |        | $DC0F
    .byte $00 ; |        | $DC10
    .byte $00 ; |        | $DC11
    .byte $00 ; |        | $DC12
    .byte $00 ; |        | $DC13
    .byte $00 ; |        | $DC14
    .byte $00 ; |        | $DC15
    .byte $00 ; |        | $DC16
    .byte $00 ; |        | $DC17
    .byte $18 ; |   XX   | $DC18
    .byte $24 ; |  X  X  | $DC19
    .byte $42 ; | X    X | $DC1A
    .byte $42 ; | X    X | $DC1B
    .byte $24 ; |  X  X  | $DC1C
    .byte $18 ; |   XX   | $DC1D
    .byte $00 ; |        | $DC1E
    .byte $00 ; |        | $DC1F
    .byte $00 ; |        | $DC20
    .byte $00 ; |        | $DC21
    .byte $00 ; |        | $DC22
    .byte $00 ; |        | $DC23
    .byte $00 ; |        | $DC24
    .byte $00 ; |        | $DC25
    .byte $00 ; |        | $DC26
    .byte $00 ; |        | $DC27
    .byte $00 ; |        | $DC28
    .byte $00 ; |        | $DC29
    .byte $00 ; |        | $DC2A
    .byte $00 ; |        | $DC2B
    .byte $00 ; |        | $DC2C
    .byte $00 ; |        | $DC2D
    .byte $00 ; |        | $DC2E
    .byte $00 ; |        | $DC2F
    .byte $00 ; |        | $DC30
    .byte $00 ; |        | $DC31
    .byte $00 ; |        | $DC32
    .byte $00 ; |        | $DC33
    .byte $00 ; |        | $DC34
    .byte $00 ; |        | $DC35
    .byte $00 ; |        | $DC36
    .byte $00 ; |        | $DC37
    .byte $00 ; |        | $DC38
    .byte $00 ; |        | $DC39
    .byte $00 ; |        | $DC3A
    .byte $00 ; |        | $DC3B
    .byte $00 ; |        | $DC3C
    .byte $00 ; |        | $DC3D
    .byte $00 ; |        | $DC3E
    .byte $00 ; |        | $DC3F
    .byte $00 ; |        | $DC40
    .byte $00 ; |        | $DC41
    .byte $00 ; |        | $DC42
    .byte $00 ; |        | $DC43
    .byte $00 ; |        | $DC44
    .byte $00 ; |        | $DC45
    .byte $00 ; |        | $DC46
    .byte $00 ; |        | $DC47
    .byte $00 ; |        | $DC48
    .byte $00 ; |        | $DC49
    .byte $00 ; |        | $DC4A
    .byte $00 ; |        | $DC4B
    .byte $00 ; |        | $DC4C
    .byte $00 ; |        | $DC4D
    .byte $00 ; |        | $DC4E
    .byte $00 ; |        | $DC4F
    .byte $00 ; |        | $DC50
    .byte $00 ; |        | $DC51
    .byte $00 ; |        | $DC52
    .byte $00 ; |        | $DC53
    .byte $00 ; |        | $DC54
    .byte $00 ; |        | $DC55
    .byte $00 ; |        | $DC56
    .byte $00 ; |        | $DC57
    .byte $00 ; |        | $DC58
    .byte $00 ; |        | $DC59
    .byte $00 ; |        | $DC5A
    .byte $00 ; |        | $DC5B
    .byte $00 ; |        | $DC5C
    .byte $00 ; |        | $DC5D
    .byte $00 ; |        | $DC5E
    .byte $00 ; |        | $DC5F
    .byte $00 ; |        | $DC60
    .byte $00 ; |        | $DC61
    .byte $00 ; |        | $DC62
    .byte $00 ; |        | $DC63
    .byte $00 ; |        | $DC64
    .byte $00 ; |        | $DC65
    .byte $00 ; |        | $DC66
    .byte $00 ; |        | $DC67
    .byte $00 ; |        | $DC68
    .byte $00 ; |        | $DC69
    .byte $00 ; |        | $DC6A
    .byte $00 ; |        | $DC6B
    .byte $00 ; |        | $DC6C
    .byte $00 ; |        | $DC6D
    .byte $00 ; |        | $DC6E
    .byte $00 ; |        | $DC6F
    .byte $00 ; |        | $DC70
    .byte $00 ; |        | $DC71
    .byte $00 ; |        | $DC72
    .byte $00 ; |        | $DC73
    .byte $00 ; |        | $DC74
    .byte $00 ; |        | $DC75
    .byte $00 ; |        | $DC76
    .byte $00 ; |        | $DC77
    .byte $00 ; |        | $DC78
    .byte $00 ; |        | $DC79
    .byte $00 ; |        | $DC7A
    .byte $00 ; |        | $DC7B
    .byte $00 ; |        | $DC7C
    .byte $00 ; |        | $DC7D
    .byte $00 ; |        | $DC7E
    .byte $00 ; |        | $DC7F
    .byte $00 ; |        | $DC80
    .byte $00 ; |        | $DC81
    .byte $00 ; |        | $DC82
    .byte $00 ; |        | $DC83
    .byte $00 ; |        | $DC84
    .byte $00 ; |        | $DC85
    .byte $00 ; |        | $DC86
    .byte $00 ; |        | $DC87
    .byte $00 ; |        | $DC88
    .byte $00 ; |        | $DC89
    .byte $00 ; |        | $DC8A
    .byte $00 ; |        | $DC8B
    .byte $00 ; |        | $DC8C
    .byte $00 ; |        | $DC8D
    .byte $00 ; |        | $DC8E
    .byte $00 ; |        | $DC8F
    .byte $00 ; |        | $DC90
    .byte $00 ; |        | $DC91
    .byte $00 ; |        | $DC92
    .byte $00 ; |        | $DC93
    .byte $00 ; |        | $DC94
    .byte $00 ; |        | $DC95
    .byte $00 ; |        | $DC96
    .byte $00 ; |        | $DC97
    .byte $00 ; |        | $DC98
    .byte $00 ; |        | $DC99
    .byte $00 ; |        | $DC9A
    .byte $00 ; |        | $DC9B
    .byte $00 ; |        | $DC9C
    .byte $00 ; |        | $DC9D
    .byte $00 ; |        | $DC9E
    .byte $00 ; |        | $DC9F
    .byte $00 ; |        | $DCA0
    .byte $00 ; |        | $DCA1
    .byte $00 ; |        | $DCA2
    .byte $00 ; |        | $DCA3
    .byte $00 ; |        | $DCA4
    .byte $00 ; |        | $DCA5
    .byte $00 ; |        | $DCA6
    .byte $00 ; |        | $DCA7
    .byte $00 ; |        | $DCA8
    .byte $00 ; |        | $DCA9
    .byte $00 ; |        | $DCAA
    .byte $00 ; |        | $DCAB
    .byte $00 ; |        | $DCAC
    .byte $00 ; |        | $DCAD
    .byte $00 ; |        | $DCAE
    .byte $00 ; |        | $DCAF
    .byte $00 ; |        | $DCB0
    .byte $00 ; |        | $DCB1
    .byte $00 ; |        | $DCB2
    .byte $00 ; |        | $DCB3
    .byte $00 ; |        | $DCB4
    .byte $00 ; |        | $DCB5
    .byte $00 ; |        | $DCB6
    .byte $00 ; |        | $DCB7
    .byte $00 ; |        | $DCB8
    .byte $00 ; |        | $DCB9
    .byte $00 ; |        | $DCBA
    .byte $00 ; |        | $DCBB
    .byte $00 ; |        | $DCBC
    .byte $00 ; |        | $DCBD
    .byte $18 ; |   XX   | $DCBE
    .byte $24 ; |  X  X  | $DCBF
    .byte $5A ; | X XX X | $DCC0
    .byte $5A ; | X XX X | $DCC1
    .byte $24 ; |  X  X  | $DCC2
    .byte $18 ; |   XX   | $DCC3
    .byte $00 ; |        | $DCC4
    .byte $00 ; |        | $DCC5
    .byte $00 ; |        | $DCC6
    .byte $00 ; |        | $DCC7
    .byte $00 ; |        | $DCC8
    .byte $00 ; |        | $DCC9
    .byte $00 ; |        | $DCCA
    .byte $00 ; |        | $DCCB
    .byte $00 ; |        | $DCCC
    .byte $00 ; |        | $DCCD
    .byte $00 ; |        | $DCCE
    .byte $00 ; |        | $DCCF
    .byte $00 ; |        | $DCD0
    .byte $00 ; |        | $DCD1
    .byte $00 ; |        | $DCD2
    .byte $00 ; |        | $DCD3
    .byte $00 ; |        | $DCD4
    .byte $00 ; |        | $DCD5
    .byte $00 ; |        | $DCD6
    .byte $00 ; |        | $DCD7
    .byte $00 ; |        | $DCD8
    .byte $00 ; |        | $DCD9
    .byte $00 ; |        | $DCDA
    .byte $00 ; |        | $DCDB
    .byte $00 ; |        | $DCDC
    .byte $00 ; |        | $DCDD
    .byte $00 ; |        | $DCDE
    .byte $00 ; |        | $DCDF
    .byte $00 ; |        | $DCE0
    .byte $00 ; |        | $DCE1
    .byte $00 ; |        | $DCE2
    .byte $00 ; |        | $DCE3
    .byte $00 ; |        | $DCE4
    .byte $00 ; |        | $DCE5
    .byte $00 ; |        | $DCE6
    .byte $00 ; |        | $DCE7
    .byte $00 ; |        | $DCE8
    .byte $00 ; |        | $DCE9
    .byte $00 ; |        | $DCEA
    .byte $00 ; |        | $DCEB
    .byte $00 ; |        | $DCEC
    .byte $00 ; |        | $DCED
    .byte $00 ; |        | $DCEE
    .byte $00 ; |        | $DCEF
    .byte $00 ; |        | $DCF0
    .byte $00 ; |        | $DCF1
    .byte $00 ; |        | $DCF2
    .byte $00 ; |        | $DCF3
    .byte $00 ; |        | $DCF4
    .byte $00 ; |        | $DCF5
    .byte $00 ; |        | $DCF6
    .byte $00 ; |        | $DCF7
    .byte $00 ; |        | $DCF8
    .byte $00 ; |        | $DCF9
    .byte $00 ; |        | $DCFA
    .byte $00 ; |        | $DCFB
    .byte $00 ; |        | $DCFC
    .byte $00 ; |        | $DCFD
    .byte $00 ; |        | $DCFE
    .byte $00 ; |        | $DCFF
    .byte $00 ; |        | $DD00
    .byte $00 ; |        | $DD01
    .byte $00 ; |        | $DD02
    .byte $00 ; |        | $DD03
    .byte $00 ; |        | $DD04
    .byte $00 ; |        | $DD05
    .byte $00 ; |        | $DD06
    .byte $00 ; |        | $DD07
    .byte $00 ; |        | $DD08
    .byte $00 ; |        | $DD09
    .byte $00 ; |        | $DD0A
    .byte $00 ; |        | $DD0B
    .byte $00 ; |        | $DD0C
    .byte $00 ; |        | $DD0D
    .byte $00 ; |        | $DD0E
    .byte $00 ; |        | $DD0F
    .byte $00 ; |        | $DD10
    .byte $00 ; |        | $DD11
    .byte $00 ; |        | $DD12
    .byte $00 ; |        | $DD13
    .byte $00 ; |        | $DD14
    .byte $00 ; |        | $DD15
    .byte $00 ; |        | $DD16
    .byte $00 ; |        | $DD17
    .byte $00 ; |        | $DD18
    .byte $00 ; |        | $DD19
    .byte $00 ; |        | $DD1A
    .byte $00 ; |        | $DD1B
    .byte $00 ; |        | $DD1C
    .byte $00 ; |        | $DD1D
    .byte $00 ; |        | $DD1E
    .byte $00 ; |        | $DD1F
    .byte $00 ; |        | $DD20
    .byte $00 ; |        | $DD21
    .byte $00 ; |        | $DD22
    .byte $00 ; |        | $DD23
    .byte $00 ; |        | $DD24
    .byte $00 ; |        | $DD25
    .byte $00 ; |        | $DD26
    .byte $00 ; |        | $DD27
    .byte $00 ; |        | $DD28
    .byte $00 ; |        | $DD29
    .byte $00 ; |        | $DD2A
    .byte $00 ; |        | $DD2B
    .byte $00 ; |        | $DD2C
    .byte $00 ; |        | $DD2D
    .byte $00 ; |        | $DD2E
    .byte $00 ; |        | $DD2F
    .byte $00 ; |        | $DD30
    .byte $00 ; |        | $DD31
    .byte $00 ; |        | $DD32
    .byte $00 ; |        | $DD33
    .byte $00 ; |        | $DD34
    .byte $00 ; |        | $DD35
    .byte $00 ; |        | $DD36
    .byte $00 ; |        | $DD37
    .byte $00 ; |        | $DD38
    .byte $00 ; |        | $DD39
    .byte $00 ; |        | $DD3A
    .byte $00 ; |        | $DD3B
    .byte $00 ; |        | $DD3C
    .byte $00 ; |        | $DD3D
    .byte $00 ; |        | $DD3E
    .byte $00 ; |        | $DD3F
    .byte $00 ; |        | $DD40
    .byte $00 ; |        | $DD41
    .byte $00 ; |        | $DD42
    .byte $00 ; |        | $DD43
    .byte $00 ; |        | $DD44
    .byte $00 ; |        | $DD45
    .byte $00 ; |        | $DD46
    .byte $00 ; |        | $DD47
    .byte $00 ; |        | $DD48
    .byte $00 ; |        | $DD49
    .byte $00 ; |        | $DD4A
    .byte $00 ; |        | $DD4B
    .byte $00 ; |        | $DD4C
    .byte $00 ; |        | $DD4D
    .byte $00 ; |        | $DD4E
    .byte $00 ; |        | $DD4F
    .byte $00 ; |        | $DD50
    .byte $00 ; |        | $DD51
    .byte $00 ; |        | $DD52
    .byte $00 ; |        | $DD53
    .byte $00 ; |        | $DD54
    .byte $00 ; |        | $DD55
    .byte $00 ; |        | $DD56
    .byte $00 ; |        | $DD57
    .byte $00 ; |        | $DD58
    .byte $00 ; |        | $DD59
    .byte $00 ; |        | $DD5A
    .byte $00 ; |        | $DD5B
    .byte $00 ; |        | $DD5C
    .byte $00 ; |        | $DD5D
    .byte $00 ; |        | $DD5E
    .byte $00 ; |        | $DD5F
    .byte $00 ; |        | $DD60
    .byte $00 ; |        | $DD61
    .byte $00 ; |        | $DD62
    .byte $00 ; |        | $DD63
    .byte $24 ; |  X  X  | $DD64
    .byte $18 ; |   XX   | $DD65
    .byte $18 ; |   XX   | $DD66
    .byte $24 ; |  X  X  | $DD67
    .byte $00 ; |        | $DD68
    .byte $00 ; |        | $DD69
    .byte $00 ; |        | $DD6A
    .byte $00 ; |        | $DD6B
    .byte $00 ; |        | $DD6C
    .byte $00 ; |        | $DD6D
    .byte $00 ; |        | $DD6E
    .byte $00 ; |        | $DD6F
    .byte $00 ; |        | $DD70
    .byte $00 ; |        | $DD71
    .byte $00 ; |        | $DD72
    .byte $00 ; |        | $DD73
    .byte $00 ; |        | $DD74
    .byte $00 ; |        | $DD75
    .byte $00 ; |        | $DD76
    .byte $00 ; |        | $DD77
    .byte $00 ; |        | $DD78
    .byte $00 ; |        | $DD79
    .byte $00 ; |        | $DD7A
    .byte $00 ; |        | $DD7B
    .byte $00 ; |        | $DD7C
    .byte $00 ; |        | $DD7D
    .byte $00 ; |        | $DD7E
    .byte $00 ; |        | $DD7F
    .byte $00 ; |        | $DD80
    .byte $00 ; |        | $DD81
    .byte $00 ; |        | $DD82
    .byte $00 ; |        | $DD83
    .byte $00 ; |        | $DD84
    .byte $00 ; |        | $DD85
    .byte $00 ; |        | $DD86
    .byte $00 ; |        | $DD87
    .byte $00 ; |        | $DD88
    .byte $00 ; |        | $DD89
    .byte $00 ; |        | $DD8A
    .byte $00 ; |        | $DD8B
    .byte $00 ; |        | $DD8C
    .byte $00 ; |        | $DD8D
    .byte $00 ; |        | $DD8E
    .byte $00 ; |        | $DD8F
    .byte $00 ; |        | $DD90
    .byte $00 ; |        | $DD91
    .byte $00 ; |        | $DD92
    .byte $00 ; |        | $DD93
    .byte $00 ; |        | $DD94
    .byte $00 ; |        | $DD95
    .byte $00 ; |        | $DD96
    .byte $00 ; |        | $DD97
    .byte $00 ; |        | $DD98
    .byte $00 ; |        | $DD99
    .byte $00 ; |        | $DD9A
    .byte $00 ; |        | $DD9B
    .byte $00 ; |        | $DD9C
    .byte $00 ; |        | $DD9D
    .byte $00 ; |        | $DD9E
    .byte $00 ; |        | $DD9F
    .byte $00 ; |        | $DDA0
    .byte $00 ; |        | $DDA1
    .byte $00 ; |        | $DDA2
    .byte $00 ; |        | $DDA3
    .byte $00 ; |        | $DDA4
    .byte $00 ; |        | $DDA5
    .byte $00 ; |        | $DDA6
    .byte $00 ; |        | $DDA7
    .byte $00 ; |        | $DDA8
    .byte $00 ; |        | $DDA9
    .byte $00 ; |        | $DDAA
    .byte $00 ; |        | $DDAB
    .byte $00 ; |        | $DDAC
    .byte $00 ; |        | $DDAD
    .byte $00 ; |        | $DDAE
    .byte $00 ; |        | $DDAF
    .byte $00 ; |        | $DDB0
    .byte $00 ; |        | $DDB1
    .byte $00 ; |        | $DDB2
    .byte $00 ; |        | $DDB3
    .byte $00 ; |        | $DDB4
    .byte $00 ; |        | $DDB5
    .byte $00 ; |        | $DDB6
    .byte $00 ; |        | $DDB7
    .byte $00 ; |        | $DDB8
    .byte $00 ; |        | $DDB9
    .byte $00 ; |        | $DDBA
    .byte $00 ; |        | $DDBB
    .byte $00 ; |        | $DDBC
    .byte $00 ; |        | $DDBD
    .byte $00 ; |        | $DDBE
    .byte $00 ; |        | $DDBF
    .byte $00 ; |        | $DDC0
    .byte $00 ; |        | $DDC1
    .byte $00 ; |        | $DDC2
    .byte $00 ; |        | $DDC3
    .byte $00 ; |        | $DDC4
    .byte $00 ; |        | $DDC5
    .byte $00 ; |        | $DDC6
    .byte $00 ; |        | $DDC7
    .byte $00 ; |        | $DDC8
    .byte $00 ; |        | $DDC9
    .byte $00 ; |        | $DDCA
    .byte $00 ; |        | $DDCB
    .byte $00 ; |        | $DDCC
    .byte $00 ; |        | $DDCD
    .byte $00 ; |        | $DDCE
    .byte $00 ; |        | $DDCF
    .byte $00 ; |        | $DDD0
    .byte $00 ; |        | $DDD1
    .byte $00 ; |        | $DDD2
    .byte $00 ; |        | $DDD3
    .byte $00 ; |        | $DDD4
    .byte $00 ; |        | $DDD5
    .byte $00 ; |        | $DDD6
    .byte $00 ; |        | $DDD7
    .byte $00 ; |        | $DDD8
    .byte $00 ; |        | $DDD9
    .byte $00 ; |        | $DDDA
    .byte $00 ; |        | $DDDB
    .byte $00 ; |        | $DDDC
    .byte $00 ; |        | $DDDD
    .byte $00 ; |        | $DDDE
    .byte $00 ; |        | $DDDF
    .byte $00 ; |        | $DDE0
    .byte $00 ; |        | $DDE1
    .byte $00 ; |        | $DDE2
    .byte $00 ; |        | $DDE3
    .byte $00 ; |        | $DDE4
    .byte $00 ; |        | $DDE5
    .byte $00 ; |        | $DDE6
    .byte $00 ; |        | $DDE7
    .byte $00 ; |        | $DDE8
    .byte $00 ; |        | $DDE9
    .byte $00 ; |        | $DDEA
    .byte $00 ; |        | $DDEB
    .byte $00 ; |        | $DDEC
    .byte $00 ; |        | $DDED
    .byte $00 ; |        | $DDEE
    .byte $00 ; |        | $DDEF
    .byte $00 ; |        | $DDF0
    .byte $00 ; |        | $DDF1
    .byte $00 ; |        | $DDF2
    .byte $00 ; |        | $DDF3
    .byte $00 ; |        | $DDF4
    .byte $00 ; |        | $DDF5
    .byte $00 ; |        | $DDF6
    .byte $00 ; |        | $DDF7
    .byte $00 ; |        | $DDF8
    .byte $00 ; |        | $DDF9
    .byte $00 ; |        | $DDFA
    .byte $00 ; |        | $DDFB
    .byte $00 ; |        | $DDFC
    .byte $00 ; |        | $DDFD
    .byte $00 ; |        | $DDFE
    .byte $00 ; |        | $DDFF
    .byte $00 ; |        | $DE00
    .byte $00 ; |        | $DE01
    .byte $00 ; |        | $DE02
    .byte $00 ; |        | $DE03
    .byte $00 ; |        | $DE04
    .byte $00 ; |        | $DE05
    .byte $00 ; |        | $DE06
    .byte $00 ; |        | $DE07
    .byte $00 ; |        | $DE08
    .byte $00 ; |        | $DE09
    .byte $18 ; |   XX   | $DE0A
    .byte $24 ; |  X  X  | $DE0B
    .byte $7E ; | XXXXXX | $DE0C
    .byte $24 ; |  X  X  | $DE0D
    .byte $18 ; |   XX   | $DE0E
    .byte $00 ; |        | $DE0F
    .byte $00 ; |        | $DE10
    .byte $00 ; |        | $DE11
    .byte $00 ; |        | $DE12
    .byte $00 ; |        | $DE13
    .byte $00 ; |        | $DE14
    .byte $00 ; |        | $DE15
    .byte $00 ; |        | $DE16
    .byte $00 ; |        | $DE17
    .byte $00 ; |        | $DE18
    .byte $00 ; |        | $DE19
    .byte $00 ; |        | $DE1A
    .byte $00 ; |        | $DE1B
    .byte $00 ; |        | $DE1C
    .byte $00 ; |        | $DE1D
    .byte $00 ; |        | $DE1E
    .byte $00 ; |        | $DE1F
    .byte $00 ; |        | $DE20
    .byte $00 ; |        | $DE21
    .byte $00 ; |        | $DE22
    .byte $00 ; |        | $DE23
    .byte $00 ; |        | $DE24
    .byte $00 ; |        | $DE25
    .byte $00 ; |        | $DE26
    .byte $00 ; |        | $DE27
    .byte $00 ; |        | $DE28
    .byte $00 ; |        | $DE29
    .byte $00 ; |        | $DE2A
    .byte $00 ; |        | $DE2B
    .byte $00 ; |        | $DE2C
    .byte $00 ; |        | $DE2D
    .byte $00 ; |        | $DE2E
    .byte $00 ; |        | $DE2F
    .byte $00 ; |        | $DE30
    .byte $00 ; |        | $DE31
    .byte $00 ; |        | $DE32
    .byte $00 ; |        | $DE33
    .byte $00 ; |        | $DE34
    .byte $00 ; |        | $DE35
    .byte $00 ; |        | $DE36
    .byte $00 ; |        | $DE37
    .byte $00 ; |        | $DE38
    .byte $00 ; |        | $DE39
    .byte $00 ; |        | $DE3A
    .byte $00 ; |        | $DE3B
    .byte $00 ; |        | $DE3C
    .byte $00 ; |        | $DE3D
    .byte $00 ; |        | $DE3E
    .byte $00 ; |        | $DE3F
    .byte $00 ; |        | $DE40
    .byte $00 ; |        | $DE41
    .byte $00 ; |        | $DE42
    .byte $00 ; |        | $DE43
    .byte $00 ; |        | $DE44
    .byte $00 ; |        | $DE45
    .byte $00 ; |        | $DE46
    .byte $00 ; |        | $DE47
    .byte $00 ; |        | $DE48
    .byte $00 ; |        | $DE49
    .byte $00 ; |        | $DE4A
    .byte $00 ; |        | $DE4B
    .byte $00 ; |        | $DE4C
    .byte $00 ; |        | $DE4D
    .byte $00 ; |        | $DE4E
    .byte $00 ; |        | $DE4F
    .byte $00 ; |        | $DE50
    .byte $00 ; |        | $DE51
    .byte $00 ; |        | $DE52
    .byte $00 ; |        | $DE53
    .byte $00 ; |        | $DE54
    .byte $00 ; |        | $DE55
    .byte $00 ; |        | $DE56
    .byte $00 ; |        | $DE57
    .byte $00 ; |        | $DE58
    .byte $00 ; |        | $DE59
    .byte $00 ; |        | $DE5A
    .byte $00 ; |        | $DE5B
    .byte $00 ; |        | $DE5C
    .byte $00 ; |        | $DE5D
    .byte $00 ; |        | $DE5E
    .byte $00 ; |        | $DE5F
    .byte $00 ; |        | $DE60
    .byte $00 ; |        | $DE61
    .byte $00 ; |        | $DE62
    .byte $00 ; |        | $DE63
    .byte $00 ; |        | $DE64
    .byte $00 ; |        | $DE65
    .byte $00 ; |        | $DE66
    .byte $00 ; |        | $DE67
    .byte $00 ; |        | $DE68
    .byte $00 ; |        | $DE69
    .byte $00 ; |        | $DE6A
    .byte $00 ; |        | $DE6B
    .byte $00 ; |        | $DE6C
    .byte $00 ; |        | $DE6D
    .byte $00 ; |        | $DE6E
    .byte $00 ; |        | $DE6F
    .byte $00 ; |        | $DE70
    .byte $00 ; |        | $DE71
    .byte $00 ; |        | $DE72
    .byte $00 ; |        | $DE73
    .byte $00 ; |        | $DE74
    .byte $00 ; |        | $DE75
    .byte $00 ; |        | $DE76
    .byte $00 ; |        | $DE77
    .byte $00 ; |        | $DE78
    .byte $00 ; |        | $DE79
    .byte $00 ; |        | $DE7A
    .byte $00 ; |        | $DE7B
    .byte $00 ; |        | $DE7C
    .byte $00 ; |        | $DE7D
    .byte $00 ; |        | $DE7E
    .byte $00 ; |        | $DE7F
    .byte $00 ; |        | $DE80
    .byte $00 ; |        | $DE81
    .byte $00 ; |        | $DE82
    .byte $00 ; |        | $DE83
    .byte $00 ; |        | $DE84
    .byte $00 ; |        | $DE85
    .byte $00 ; |        | $DE86
    .byte $00 ; |        | $DE87
    .byte $00 ; |        | $DE88
    .byte $00 ; |        | $DE89
    .byte $00 ; |        | $DE8A
    .byte $00 ; |        | $DE8B
    .byte $00 ; |        | $DE8C
    .byte $00 ; |        | $DE8D
    .byte $00 ; |        | $DE8E
    .byte $00 ; |        | $DE8F
    .byte $00 ; |        | $DE90
    .byte $00 ; |        | $DE91
    .byte $00 ; |        | $DE92
    .byte $00 ; |        | $DE93
    .byte $00 ; |        | $DE94
    .byte $00 ; |        | $DE95
    .byte $00 ; |        | $DE96
    .byte $00 ; |        | $DE97
    .byte $00 ; |        | $DE98
    .byte $00 ; |        | $DE99
    .byte $00 ; |        | $DE9A
    .byte $00 ; |        | $DE9B
    .byte $00 ; |        | $DE9C
    .byte $00 ; |        | $DE9D
    .byte $00 ; |        | $DE9E
    .byte $00 ; |        | $DE9F
    .byte $00 ; |        | $DEA0
    .byte $00 ; |        | $DEA1
    .byte $00 ; |        | $DEA2
    .byte $00 ; |        | $DEA3
    .byte $00 ; |        | $DEA4
    .byte $00 ; |        | $DEA5
    .byte $00 ; |        | $DEA6
    .byte $00 ; |        | $DEA7
    .byte $00 ; |        | $DEA8
    .byte $00 ; |        | $DEA9
    .byte $00 ; |        | $DEAA
    .byte $00 ; |        | $DEAB
    .byte $00 ; |        | $DEAC
    .byte $00 ; |        | $DEAD
    .byte $00 ; |        | $DEAE
    .byte $00 ; |        | $DEAF
    .byte $72 ; | XXX  X | $DEB0
    .byte $8A ; |X   X X | $DEB1
    .byte $BA ; |X XXX X | $DEB2
    .byte $83 ; |X     XX| $DEB3
    .byte $82 ; |X     X | $DEB4
    .byte $8A ; |X   X X | $DEB5
    .byte $71 ; | XXX   X| $DEB6
    .byte $28 ; |  X X   | $DEB7
    .byte $28 ; |  X X   | $DEB8
    .byte $28 ; |  X X   | $DEB9
    .byte $E8 ; |XXX X   | $DEBA
    .byte $2A ; |  X X X | $DEBB
    .byte $2D ; |  X XX X| $DEBC
    .byte $C8 ; |XX  X   | $DEBD
    .byte $BE ; |X XXXXX | $DEBE
    .byte $A0 ; |X X     | $DEBF
    .byte $A0 ; |X X     | $DEC0
    .byte $BC ; |X XXXX  | $DEC1
    .byte $A0 ; |X X     | $DEC2
    .byte $A0 ; |X X     | $DEC3
    .byte $BE ; |X XXXXX | $DEC4

    lda    #$58                  ; 2
    sta    $AA                   ; 3
    lda    #1                    ; 2
    sta    $AB                   ; 3
LDECD:
    lda    $AA                   ; 3
    sec                          ; 2
    sbc    #1                    ; 2
    sta    $AA                   ; 3
    bcs    LDEE5                 ; 2³
    dec    $AB                   ; 5
    bne    LDEE5                 ; 2³
    lda    #$2E                  ; 2
    sta    $AE                   ; 3
    lda    #$F2                  ; 2
    sta    $AF                   ; 3
    jmp    LDFEF                 ; 3
LDEE5:
    lda    #$02 ;82                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    sta    VBLANK                ; 3
    lda    TIMINT                ; 4
    lda    #$2A                  ; 2
    sta    $029D                 ; 4
    jsr    LDF5F                 ; 6
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    lda    TIMINT                ; 4
    lda    #$36                  ; 2
    jsr    LDF5C                 ; 6
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    jsr    LDF57                 ; 6
    lda    #$FF                  ; 2
    jsr    LD396                 ; 6
    lda    #$DF                  ; 2
    sta    $81                   ; 3
    sta    $83                   ; 3
    sta    $85                   ; 3
    sta    $87                   ; 3
    lda    #$A7                  ; 2
    sta    $80                   ; 3
    lda    #$65                  ; 2
    sta    $82                   ; 3
    lda    #$7C                  ; 2
    sta    $84                   ; 3
    lda    #$93                  ; 2
    sta    $86                   ; 3
    ldy    #$16                  ; 2
LDF30:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($80),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($82),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($84),Y               ; 5
    sta    GRP0                  ; 3
    lda    LDA2C,Y               ; 4
    tax                          ; 2
    asl    $AC,X                 ; 6
    lda    ($86),Y               ; 5
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    sta    GRP0                  ; 3
    dey                          ; 2
    bpl    LDF30                 ; 2³
    jsr    LDF57                 ; 6
    jmp    LDECD                 ; 3
LDF57:
    lda    TIMINT                ; 4
    lda    #$6E                  ; 2
LDF5C:
    sta    $029E                 ; 4
LDF5F:
    lda    TIMINT                ; 4
    bpl    LDF5F                 ; 2³
    rts                          ; 6

    .byte $89 ; |X   X  X| $DF65
    .byte $8A ; |X   X X | $DF66
    .byte $99 ; |X  XX  X| $DF67
    .byte $AA ; |X X X X | $DF68
    .byte $99 ; |X  XX  X| $DF69
    .byte $00 ; |        | $DF6A
    .byte $89 ; |X   X  X| $DF6B
    .byte $8A ; |X   X X | $DF6C
    .byte $99 ; |X  XX  X| $DF6D
    .byte $AA ; |X X X X | $DF6E
    .byte $99 ; |X  XX  X| $DF6F
    .byte $00 ; |        | $DF70
    .byte $E4 ; |XXX  X  | $DF71
    .byte $96 ; |X  X XX | $DF72
    .byte $95 ; |X  X X X| $DF73
    .byte $94 ; |X  X X  | $DF74
    .byte $E4 ; |XXX  X  | $DF75
    .byte $00 ; |        | $DF76
    .byte $5D ; | X XXX X| $DF77
    .byte $D1 ; |XX X   X| $DF78
    .byte $51 ; | X X   X| $DF79
    .byte $91 ; |X  X   X| $DF7A
    .byte $11 ; |   X   X| $DF7B
    .byte $30 ; |  XX    | $DF7C
    .byte $88 ; |X   X   | $DF7D
    .byte $10 ; |   X    | $DF7E
    .byte $88 ; |X   X   | $DF7F
    .byte $31 ; |  XX   X| $DF80
    .byte $00 ; |        | $DF81
    .byte $20 ; |  X     | $DF82
    .byte $A0 ; |X X     | $DF83
    .byte $20 ; |  X     | $DF84
    .byte $A0 ; |X X     | $DF85
    .byte $20 ; |  X     | $DF86
    .byte $00 ; |        | $DF87
    .byte $51 ; | X X   X| $DF88
    .byte $DF ; |XX XXXXX| $DF89
    .byte $51 ; | X X   X| $DF8A
    .byte $4A ; | X  X X | $DF8B
    .byte $44 ; | X   X  | $DF8C
    .byte $00 ; |        | $DF8D
    .byte $C8 ; |XX  X   | $DF8E
    .byte $08 ; |    X   | $DF8F
    .byte $08 ; |    X   | $DF90
    .byte $14 ; |   X X  | $DF91
    .byte $22 ; |  X   X | $DF92
    .byte $00 ; |        | $DF93
    .byte $00 ; |        | $DF94
    .byte $00 ; |        | $DF95
    .byte $00 ; |        | $DF96
    .byte $00 ; |        | $DF97
    .byte $80 ; |X       | $DF98
    .byte $80 ; |X       | $DF99
    .byte $00 ; |        | $DF9A
    .byte $00 ; |        | $DF9B
    .byte $00 ; |        | $DF9C
    .byte $00 ; |        | $DF9D
    .byte $00 ; |        | $DF9E
    .byte $20 ; |  X     | $DF9F
    .byte $20 ; |  X     | $DFA0
    .byte $20 ; |  X     | $DFA1
    .byte $50 ; | X X    | $DFA2
    .byte $88 ; |X   X   | $DFA3
    .byte $00 ; |        | $DFA4
    .byte $00 ; |        | $DFA5
    .byte $00 ; |        | $DFA6
    .byte $00 ; |        | $DFA7
    .byte $00 ; |        | $DFA8
    .byte $00 ; |        | $DFA9
    .byte $7C ; | XXXXX  | $DFAA
    .byte $82 ; |X     X | $DFAB
    .byte $9A ; |X  XX X | $DFAC
    .byte $A2 ; |X X   X | $DFAD
    .byte $A2 ; |X X   X | $DFAE
    .byte $9A ; |X  XX X | $DFAF
    .byte $82 ; |X     X | $DFB0
    .byte $7C ; | XXXXX  | $DFB1
    .byte $00 ; |        | $DFB2
    .byte $8A ; |X   X X | $DFB3
    .byte $8A ; |X   X X | $DFB4
    .byte $AA ; |X X X X | $DFB5
    .byte $DA ; |XX XX X | $DFB6
    .byte $8A ; |X   X X | $DFB7
    .byte $00 ; |        | $DFB8
    .byte $E4 ; |XXX  X  | $DFB9
    .byte $97 ; |X  X XXX| $DFBA
    .byte $E4 ; |XXX  X  | $DFBB
    .byte $92 ; |X  X  X | $DFBC
    .byte $E1 ; |XXX    X| $DFBD
    .byte $E9 ; |XXX X  X| $DFBE
    .byte $2A ; |  X X X | $DFBF
    .byte $01 ; |       X| $DFC0
    .byte $1A ; |   XX X | $DFC1
    .byte $EE ; |XXX XXX | $DFC2
    .byte $9E ; |X  XXXX | $DFC3
    .byte $42 ; | X    X | $DFC4
    .byte $16 ; |   X XX | $DFC5
    .byte $CF ; |XX  XXXX| $DFC6
    .byte $9F ; |X  XXXXX| $DFC7
    .byte $40 ; | X      | $DFC8
    .byte $83 ; |X     XX| $DFC9
    .byte $C7 ; |XX   XXX| $DFCA
    .byte $63 ; | XX   XX| $DFCB
    .byte $40 ; | X      | $DFCC
    .byte $82 ; |X     X | $DFCD
    .byte $C5 ; |XX   X X| $DFCE
    .byte $4F ; | X  XXXX| $DFCF
    .byte $04 ; |     X  | $DFD0
    .byte $00 ; |        | $DFD1
    .byte $DD ; |XX XXX X| $DFD2
    .byte $FF ; |XXXXXXXX| $DFD3
    .byte $00 ; |        | $DFD4
    .byte $38 ; |  XXX   | $DFD5
    .byte $DF ; |XX XXXXX| $DFD6
    .byte $DF ; |XX XXXXX| $DFD7
    .byte $C4 ; |XX   X  | $DFD8
    .byte $04 ; |     X  | $DFD9
    .byte $E3 ; |XXX   XX| $DFDA
    .byte $57 ; | X X XXX| $DFDB
    .byte $C0 ; |XX      | $DFDC
    .byte $07 ; |     XXX| $DFDD
    .byte $DF ; |XX XXXXX| $DFDE
    .byte $AF ; |X X XXXX| $DFDF
    .byte $BF ; |X XXXXXX| $DFE0
    .byte $8B ; |X   X XX| $DFE1
    .byte $E7 ; |XXX  XXX| $DFE2
    .byte $DB ; |XX XX XX| $DFE3
    .byte $CF ; |XX  XXXX| $DFE4
    .byte $C6 ; |XX   XX | $DFE5
    .byte $61 ; | XX    X| $DFE6

LDFE7:
    lda    #1                    ; 2
    sta    LDFF8                 ; 4
    jmp.ind ($00AE)              ; 5
LDFEF:
    lda    #1                    ; 2
    sta    LDFFA                 ; 4
    jmp.ind ($00AE)              ; 5

    .byte $00 ; |        | $DFF7
LDFF8:
    .byte $FF ; |XXXXXXXX| $DFF8
    .byte $FF ; |XXXXXXXX| $DFF9
LDFFA:
    .byte $FF ; |XXXXXXXX| $DFFA
    .byte $F2 ; |XXXX  X | $DFFB

       ORG $2FFC
      RORG $DFFC

    .word START
    .word START

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 2
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $3000
      RORG $F000


;    REPEAT ($F200-*)
;      .byte $FF
;    REPEND


LF000:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF
LF007:
    .byte $FF,$FF,$FF,$FF
LF00B:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LF014:
    .byte $FF,$FF,$FF,$FF
LF018:
    .byte $FF,$FF,$FF,$FF
LF01C:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LF025:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LF02D:
    .byte $FF,$FF,$FF,$FF
LF031:
    .byte $FF
LF032:
    .byte $FF
LF033:
    .byte $FF
LF034:
    .byte $FF
LF035:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LF045:
    .byte $FF
LF046:
    .byte $FF
LF047:
    .byte $FF
LF048:
    .byte $FF
LF049:
    .byte $FF
LF04A:
    .byte $FF,$FF,$FF,$FF,$FF,$FF
LF050:
    .byte $FF
LF051:
    .byte $FF
LF052:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF
LF059:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LF061:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LF069:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LF071:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LF079:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LF082:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF
LF094:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LF09D:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LF0A6:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
LF0B5:
    .byte $FF
LF0B6:
    .byte $FF,$FF,$FF,$FF
LF0BA:
    .byte $FF
LF0BB:
    .byte $FF
LF0BC:
    .byte $FF
LF0BD:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
LF12D:
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
LF145:
    .byte $FF,$FF
LF147:
    .byte $FF
LF148:
    .byte $7F
LF149:
    .byte $FF
LF14A:
    .byte $FF,$FF,$7F,$FF,$FF,$FF
LF150:
    .byte $7F
LF151:
    .byte $FF
LF152:
    .byte $FF,$FF,$7F,$FF,$FF,$FF,$7F
LF159:
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
LF161:
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
LF169:
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
LF171:
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
LF179:
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$FF,$FF
LF182:
    .byte $FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF
    .byte $FF,$FF
LF194:
    .byte $7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF
    .byte $7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF
    .byte $7F
LF1B5:
    .byte $FF,$FF,$FF,$7F,$FF
LF1BA:
    .byte $FF
LF1BB:
    .byte $FF
LF1BC:
    .byte $7F
LF1BD:
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F,$FF,$FF,$FF,$7F
    .byte $FF,$FF,$FF

       ORG $3200
      RORG $F200

START:
    lda    #1                    ; 2
    sta    LFFFA                 ; 4
LF205:
    cld                          ; 2
    sei                          ; 2
    ldx    #0                    ; 2
    txa                          ; 2
LF20A:
    sta    0,X                   ; 4
    inx                          ; 2
    bne    LF20A                 ; 2³
LF20F:
    sta    LF000,X               ; 5
    inx                          ; 2
    bne    LF20F                 ; 2³
LF215:
    lda    LF2AC,X               ; 4
    sta    LF000,X               ; 5
    inx                          ; 2
    cpx    #$2D                  ; 2
    bne    LF215                 ; 2³
    ldx    #$FF                  ; 2
    txs                          ; 2
    lda    #$C5                  ; 2
    sta    $AE                   ; 3
    lda    #$DE                  ; 2
    sta    $AF                   ; 3
    jmp    LFFEF                 ; 3
    lda    #$D4                  ; 2
    sta    $E8                   ; 3
    sta    $EA                   ; 3
    sta    $EC                   ; 3
    lda    #$C9                  ; 2
    sta    $E7                   ; 3
    lda    #$D0                  ; 2
    sta    $E9                   ; 3
    lda    #$D7                  ; 2
    sta    $EB                   ; 3
    lda    #1                    ; 2
    sta    CTRLPF                ; 3
    jsr    LFAF4                 ; 6
    lda    #0                    ; 2
    sta    LF047                 ; 4
    dec    $DD                   ; 5
LF250:
    lda    SWCHA                 ; 4   get directions
;    and    #$CC                  ; 2   make it so down & up are pressed
;    ldy    INPT0                 ; 3
;    bpl    LF25B                 ; 2³
;    ora    #$10                  ; 2
    AND    #$DD
    LDY    INPT1
    BMI    LF25B
    AND    #$EF

LF25B:
;    ldy    INPT1                 ; 3
;    bmi    LF263                 ; 2³  skip checking thrust
    NOP
    NOP
    NOP
    NOP

    ldy    INPT4                 ; 3
    bmi    LF265                 ; 2³
LF263:
    ora    #$20                  ; 2
LF265:
    ldy    SWCHB                 ; 4
    bmi    LF278                 ; 2³  branch if NOT sharing the left joystick,
    and    #$F0                  ; 2   otherwise use 2 joysticks. Stella defaults to
    sta    $EE                   ; 3   sharing same Joy stick
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    ora    $EE                   ; 3
    sta    $EE                   ; 3   holds directions, both nibbles are duplicates
    bne    LF288                 ; 3   always branch

LF278:
;    ldy    INPT2                 ; 3
;    bpl    LF27E                 ; 2³
;    ora    #$01                  ; 2
    LDY    INPT3
    BMI    LF27E
    AND    #$FE

LF27E:
;    ldy    INPT3                 ; 3
;    bmi    LF286                 ; 2³

    NOP
    NOP
    NOP
    NOP

    ldy    INPT5                 ; 3
    bmi    LF288                 ; 2³
LF286:
    ora    #$02                  ; 2
LF288:
    sta    $EE                   ; 3

    lda    #$02 ;82                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    sta    VBLANK                ; 3
    lda    TIMINT                ; 4
    lda    #$2A                  ; 2
    sta    $029D                 ; 4
LF29A:
    lda    TIMINT                ; 4
    bpl    LF29A                 ; 2³
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    lda    #$36                  ; 2
    sta    $029E                 ; 4
    bne    LF2D9                 ; 2³
LF2AC:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    PF0                   ; 3
    lda    ($80),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($82),Y               ; 5
    sta    GRP1                  ; 3
    lda    $D53F,Y               ; 4
    sta    PF2                   ; 3
    lda    ($84),Y               ; 5
    sta    ENAM0                 ; 3
    lda    ($86),Y               ; 5
    sta    ENAM1                 ; 3
    lda    ($88),Y               ; 5
    sta    ENABL                 ; 3
    iny                          ; 2
    cpy    #$9F                  ; 2
    beq    LF2D8                 ; 2³
    cpy    LF12D                 ; 4
    bne    LF2AC                 ; 2³
    jmp    $D205                 ; 3
LF2D8:
    rts                          ; 6

LF2D9:
    clc                          ; 2
    lda    $B8                   ; 3
    adc    #$80                  ; 2
    and    #$8F                  ; 2
    sta    $B8                   ; 3
    bmi    LF2F2                 ; 2³
    inc    $B8                   ; 5
    inc    $B9                   ; 5
    lda    $B9                   ; 3
    cmp    #3                    ; 2
    bne    LF2F2                 ; 2³
    lda    #0                    ; 2
    sta    $B9                   ; 3
LF2F2:
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcc    LF363                 ; 2³+1
    lsr                          ; 2
    bcs    LF337                 ; 2³+1
    lda    #2                    ; 2
    and    $E1                   ; 3
    bne    LF323                 ; 2³
    lda    $E1                   ; 3
    ora    #$02                  ; 2
    eor    #$01                  ; 2
    sta    $E1                   ; 3
    lda    #$40                  ; 2
    sta    $E6                   ; 3
    lda    #$DE                  ; 2
    sta    $E8                   ; 3
    sta    $EA                   ; 3
    sta    $EC                   ; 3
    lda    #$B0                  ; 2
    sta    $E7                   ; 3
    lda    #$B7                  ; 2
    sta    $E9                   ; 3
    lda    #$BE                  ; 2
    sta    $EB                   ; 3
    bne    LF363                 ; 2³
LF323:
    dec    $E6                   ; 5
    bne    LF363                 ; 2³
    lda    #$40                  ; 2
    sta    $E6                   ; 3
    lda    $E1                   ; 3
    eor    #$01                  ; 2
    sta    $E1                   ; 3
    lda    #$FF                  ; 2
    sta    $DD                   ; 3
    bne    LF363                 ; 2³
LF337:
    lda    $E1                   ; 3
    and    #$02                  ; 2
    beq    LF346                 ; 2³
    lda    #1                    ; 2
    sta    LF048                 ; 4
    lda    #$FF                  ; 2
    sta    $DD                   ; 3
LF346:
    lda    $E1                   ; 3
    and    #$FD                  ; 2
    sta    $E1                   ; 3
    lda    #$D4                  ; 2
    sta    $E8                   ; 3
    sta    $EA                   ; 3
    sta    $EC                   ; 3
    lda    #$C9                  ; 2
    sta    $E7                   ; 3
    lda    #$D0                  ; 2
    sta    $E9                   ; 3
    lda    #$D7                  ; 2
    sta    $EB                   ; 3
    jmp    LF37F                 ; 3
LF363:
    jsr    LFAF4                 ; 6
    lda    $E1                   ; 3
    and    #$02                  ; 2
    beq    LF37C                 ; 2³
    lda    $E1                   ; 3
    and    #$01                  ; 2
    tax                          ; 2
    inx                          ; 2
    stx    LF048                 ; 4
    lda    #0                    ; 2
    sta    LF047                 ; 4
    sta    $E4                   ; 3
LF37C:
    jmp    LFA98                 ; 3
LF37F:
    lda    $DD                   ; 3
    beq    LF3C2                 ; 2³
    lda    $B9                   ; 3
    bne    LF3C2                 ; 2³
    dec    $F0                   ; 5
    bne    LF3A9                 ; 2³
    lda    #$40                  ; 2
    sta    $F0                   ; 3
    lda    $E1                   ; 3
    lsr                          ; 2
    bcc    LF3A9                 ; 2³
    rol                          ; 2
    eor    #$80                  ; 2
    sta    $E1                   ; 3
    ldx    #3                    ; 2
LF39B:
    lda    LF145,X               ; 4
    ldy    $E2,X                 ; 4
    sta    $E2,X                 ; 4
    tya                          ; 2
    sta    LF045,X               ; 5
    dex                          ; 2
    bpl    LF39B                 ; 2³
LF3A9:
    dec    $DD                   ; 5
    bne    LF3C2                 ; 2³
    lda    #$FF                  ; 2
    sta    $DD                   ; 3
    lda    $E0                   ; 3
    asl                          ; 2
    adc    #$11                  ; 2
    eor    $DE                   ; 3
    sta    $DE                   ; 3
    eor    $DF                   ; 3
    sta    $DF                   ; 3
    eor    $E0                   ; 3
    sta    $E0                   ; 3
LF3C2:
    lda    LF147                 ; 4
    bne    LF3F3                 ; 2³
    lda    $EF                   ; 3
    bmi    LF3E4                 ; 2³
    jsr    LFB17                 ; 6
    lda    #$80                  ; 2
    ora    $EF                   ; 3
    sta    $EF                   ; 3
    lda    #$FF                  ; 2
    sta    $DD                   ; 3
    lda    $EF                   ; 3
    and    #$01                  ; 2
    bne    LF3F0                 ; 2³
    lda    #1                    ; 2
    sta    $EF                   ; 3
    bne    LF430                 ; 2³+1
LF3E4:
    lda    #$40                  ; 2
    bit    $EF                   ; 3
    bne    LF3F0                 ; 2³
    ora    $EF                   ; 3
    sta    $EF                   ; 3
    bne    LF430                 ; 2³+1
LF3F0:
    jmp    LFA98                 ; 3
LF3F3:
    lda    $C2                   ; 3
    bpl    LF3FD                 ; 2³
    jsr    LFB17                 ; 6
    jmp    LFA98                 ; 3
LF3FD:
    lda    $B8                   ; 3
    bmi    LF40C                 ; 2³
    lda    #5                    ; 2
    sta    $AE                   ; 3
    lda    #$B2                  ; 2
    sta    $AF                   ; 3
    jmp    LFFE7                 ; 3
LF40C:
    lda    $C2                   ; 3
    and    #$09                  ; 2
    bne    LF430                 ; 2³
    ldy    $BB                   ; 3
LF414:
    lda    LF151,Y               ; 4
    bmi    LF41D                 ; 2³
    and    #$0F                  ; 2
    beq    LF420                 ; 2³
LF41D:
    dey                          ; 2
    bne    LF414                 ; 2³
LF420:
    sty    $BA                   ; 3
    jsr    LFCA4                 ; 6
    lda    $BA                   ; 3
    sta    $AE                   ; 3
    lda    #0                    ; 2
    sta    $AF                   ; 3
    jsr    LFDB0                 ; 6
LF430:
    lda    LF1B5                 ; 4
    and    #$0F                  ; 2
    sta    $DB                   ; 3
    ldx    $BB                   ; 3
    inx                          ; 2
    stx    $DC                   ; 3
    lda    #0                    ; 2
    tay                          ; 2
    ldx    #8                    ; 2
LF441:
    sta    $AF,X                 ; 4
    dex                          ; 2
    bne    LF441                 ; 2³
    sta    $A8                   ; 3
    sta    $A9                   ; 3
    sta    $AA                   ; 3
    lda    $DC                   ; 3
    bmi    LF452                 ; 2³
    bne    LF457                 ; 2³
LF452:
    ldx    #1                    ; 2
    jmp    LF57B                 ; 3
LF457:
    lda    #1                    ; 2
    sta    $AC                   ; 3
    lda    #2                    ; 2
    sta    $B0                   ; 3
    ldy    $AC                   ; 3
    lda    LF151,Y               ; 4
    bpl    LF468                 ; 2³
    dec    $B0                   ; 5
LF468:
    ldy    $AC                   ; 3
    cpy    $DC                   ; 3
    bcc    LF471                 ; 2³
    jmp    LF518                 ; 3
LF471:
    lda    #1                    ; 2
    sta    $AD                   ; 3
    lda    LF149,Y               ; 4
    adc    #7                    ; 2
    sta    LF02D,X               ; 5
    adc    #6                    ; 2
    sta    $AF                   ; 3
    iny                          ; 2
    sty    $AC                   ; 3
LF484:
    ldy    $AC                   ; 3
    lda    $AD                   ; 3
    beq    LF4EE                 ; 2³
LF48A:
    cpy    $DC                   ; 3
    bcs    LF4B3                 ; 2³
    lda    LF151,Y               ; 4
    bmi    LF4B3                 ; 2³
    lda    $AF                   ; 3
    cmp    LF149,Y               ; 4
    bcc    LF4B3                 ; 2³
    clc                          ; 2
    lda    LF149,Y               ; 4
    adc    #7                    ; 2
    cmp    LF12D,X               ; 4
    bcc    LF4AC                 ; 2³
    sta    LF02D,X               ; 5
    adc    #6                    ; 2
    sta    $AF                   ; 3
LF4AC:
    inc    $B0,X                 ; 6
    iny                          ; 2
    sty    $AC                   ; 3
    bne    LF48A                 ; 2³
LF4B3:
    lda    #0                    ; 2
    sta    $AD                   ; 3
LF4B7:
    ldy    $A9                   ; 3
    cpy    $DB                   ; 3
    bcs    LF4EB                 ; 2³
    lda    LF182,Y               ; 4
    and    #$40                  ; 2
    beq    LF4EB                 ; 2³
    lda    $AF                   ; 3
    cmp    LF179,Y               ; 4
    bcc    LF4EB                 ; 2³
    lda    LF179,Y               ; 4
    clc                          ; 2
    adc    #1                    ; 2
    cmp    LF12D,X               ; 4
    bcc    LF4E4                 ; 2³
    clc                          ; 2
    adc    #2                    ; 2
    sta    LF02D,X               ; 5
    adc    #6                    ; 2
    sta    $AF                   ; 3
    lda    #1                    ; 2
    sta    $AD                   ; 3
LF4E4:
    iny                          ; 2
    sty    $A9                   ; 3
    inc    $B4,X                 ; 6
    bne    LF4B7                 ; 2³
LF4EB:
    jmp    LF484                 ; 3
LF4EE:
    lda    #0                    ; 2
    sta    $A8                   ; 3
    inx                          ; 2
    stx    $AA                   ; 3
    cpy    $DC                   ; 3
    bcs    LF50F                 ; 2³+1
    lda    LF151,Y               ; 4
    bmi    LF50F                 ; 2³+1
    inc    $B0,X                 ; 6
    inc    $AC                   ; 5
    ldy    $AC                   ; 3
    cpy    $DC                   ; 3
    bcs    LF512                 ; 2³
    lda    LF151,Y               ; 4
    bmi    LF50F                 ; 2³
    inc    $B0,X                 ; 6
LF50F:
    jmp    LF468                 ; 3
LF512:
    dey                          ; 2
    sty    $AC                   ; 3
    jmp    LF468                 ; 3
LF518:
    lda    #0                    ; 2
    sta    $AD                   ; 3
LF51C:
    cpx    #4                    ; 2
    bcs    LF567                 ; 2³
    ldy    $A9                   ; 3
    cpy    $DB                   ; 3
    bcs    LF567                 ; 2³
    lda    LF182,Y               ; 4
    and    #$40                  ; 2
    beq    LF567                 ; 2³
    lda    $A8                   ; 3
    cmp    #3                    ; 2
    bcs    LF541                 ; 2³
    lda    #1                    ; 2
    sta    $AD                   ; 3
    inc    $B4,X                 ; 6
    inc    $A8                   ; 5
    inc    $A9                   ; 5
    ldy    $A9                   ; 3
LF53F:
    bne    LF51C                 ; 2³
LF541:
    lda    $A8                   ; 3
    cmp    #3                    ; 2
    bne    LF54D                 ; 2³
    lda    LF179,Y               ; 4
    sta    LF02D,X               ; 5
LF54D:
    lda    LF12D,X               ; 4
    clc                          ; 2
    adc    #7                    ; 2
    cmp    LF179,Y               ; 4
    bcc    LF55E                 ; 2³
    beq    LF55E                 ; 2³
    inc    $B4,X                 ; 6
    bne    LF564                 ; 2³
LF55E:
    inc    $AA                   ; 5
    lda    #0                    ; 2
    sta    $A8                   ; 3
LF564:
    jmp    LF518                 ; 3
LF567:
    ldx    $AA                   ; 3
    lda    $AD                   ; 3
    bne    LF56E                 ; 2³
    dex                          ; 2
LF56E:
    ldx    #0                    ; 2
LF570:
    lda    $B0,X                 ; 4
    ora    $B4,X                 ; 4
    beq    LF57B                 ; 2³
    inx                          ; 2
    cpx    #4                    ; 2
    bcc    LF570                 ; 2³
LF57B:
    dex                          ; 2
    lda    #$9F                  ; 2
    sta    LF02D,X               ; 5
    lda    #0                    ; 2
    sta    $AC                   ; 3
    sta    $A9                   ; 3
    sta    $AA                   ; 3
    sta    $AB                   ; 3
    sta    $A8                   ; 3
LF58D:
    ldx    $AA                   ; 3
    cpx    #4                    ; 2
    bcs    LF5C8                 ; 2³
    lda    $B0,X                 ; 4
    asl                          ; 2
    tay                          ; 2
    lda    LFA72,Y               ; 4
    sta    $AE                   ; 3
    lda    LFA73,Y               ; 4
    sta    $AF                   ; 3
    jmp.ind ($00AE)              ; 5
LF5A4:
    ldx    $AA                   ; 3
    lda    $B4,X                 ; 4
    asl                          ; 2
    tay                          ; 2
    lda    LFA84,Y               ; 4
    sta    $AE                   ; 3
    lda    LFA85,Y               ; 4
    sta    $AF                   ; 3
    jmp.ind ($00AE)              ; 5
LF5B7:
    inc    $AA                   ; 5
    clc                          ; 2
    lda    $AB                   ; 3
    adc    #5                    ; 2
    sta    $AB                   ; 3
    lda    $A8                   ; 3
    adc    #$0A                  ; 2
    sta    $A8                   ; 3
    bne    LF58D                 ; 2³
LF5C8:
    jmp    LFA98                 ; 3
    ldy    $A8                   ; 3
    lda    #$2C                  ; 2
    sta.wy $80,Y                 ; 5
    sta.wy $82,Y                 ; 5
    lda    #$DA                  ; 2
    sta.wy $81,Y                 ; 5
    sta.wy $83,Y                 ; 5
    ldy    $AB                   ; 3
    lda    #$27                  ; 2
    sta    LF031,Y               ; 5
    sta    LF032,Y               ; 5
    jmp    LF5A4                 ; 3
    jsr    LF8D4                 ; 6
    ldy    $A8                   ; 3
    lda    #$2C                  ; 2
    sta.wy $82,Y                 ; 5
    lda    #$DA                  ; 2
    sta.wy $83,Y                 ; 5
    ldy    $AB                   ; 3
    lda    #$27                  ; 2
    sta    LF032,Y               ; 5
    jmp    LF5A4                 ; 3
    jsr    LF877                 ; 6
    jmp    LF5A4                 ; 3
    lda    $B8                   ; 3
    lsr                          ; 2
    bcs    LF616                 ; 2³
    jsr    LF877                 ; 6
    inc    $AC                   ; 5
    jmp    LF5A4                 ; 3
LF616:
    inc    $AC                   ; 5
    jsr    LF877                 ; 6
    jmp    LF5A4                 ; 3
    lda    $B8                   ; 3
    lsr                          ; 2
    bcs    LF62D                 ; 2³
    jsr    LF877                 ; 6
    inc    $AC                   ; 5
    inc    $AC                   ; 5
    jmp    LF5A4                 ; 3
LF62D:
    inc    $AC                   ; 5
    inc    $AC                   ; 5
    jsr    LF877                 ; 6
    jmp    LF5A4                 ; 3
    lda    $B9                   ; 3
    bne    LF648                 ; 2³
    jsr    LF877                 ; 6
    clc                          ; 2
    lda    $AC                   ; 3
    adc    #3                    ; 2
    sta    $AC                   ; 3
    jmp    LF5A4                 ; 3
LF648:
    cmp    #1                    ; 2
    bne    LF658                 ; 2³
    inc    $AC                   ; 5
    inc    $AC                   ; 5
    jsr    LF877                 ; 6
    inc    $AC                   ; 5
    jmp    LF5A4                 ; 3
LF658:
    lda    $AC                   ; 3
    clc                          ; 2
    adc    #3                    ; 2
    sta    $AC                   ; 3
    jsr    LF877                 ; 6
    jmp    LF5A4                 ; 3
    lda    $B9                   ; 3
    bne    LF676                 ; 2³
    jsr    LF877                 ; 6
    clc                          ; 2
    lda    $AC                   ; 3
    adc    #4                    ; 2
    sta    $AC                   ; 3
    jmp    LF5A4                 ; 3
LF676:
    cmp    #1                    ; 2
    bne    LF688                 ; 2³
    inc    $AC                   ; 5
    inc    $AC                   ; 5
    jsr    LF877                 ; 6
    inc    $AC                   ; 5
    inc    $AC                   ; 5
    jmp    LF5A4                 ; 3
LF688:
    lda    $AC                   ; 3
    clc                          ; 2
    adc    #4                    ; 2
    sta    $AC                   ; 3
    jsr    LF877                 ; 6
    jmp    LF5A4                 ; 3
    lda    $B8                   ; 3
    and    #$03                  ; 2
    bne    LF6A8                 ; 2³
    jsr    LF877                 ; 6
    clc                          ; 2
    lda    $AC                   ; 3
    adc    #5                    ; 2
    sta    $AC                   ; 3
    jmp    LF5A4                 ; 3
LF6A8:
    cmp    #1                    ; 2
    bne    LF6BD                 ; 2³
    inc    $AC                   ; 5
    inc    $AC                   ; 5
    jsr    LF877                 ; 6
    clc                          ; 2
    lda    $AC                   ; 3
    adc    #3                    ; 2
    sta    $AC                   ; 3
    jmp    LF5A4                 ; 3
LF6BD:
    cmp    #2                    ; 2
    bne    LF6D0                 ; 2³
    clc                          ; 2
    lda    $AC                   ; 3
    adc    #4                    ; 2
    sta    $AC                   ; 3
    jsr    LF877                 ; 6
    inc    $AC                   ; 5
    jmp    LF5A4                 ; 3
LF6D0:
    lda    $AC                   ; 3
    clc                          ; 2
    adc    #5                    ; 2
    sta    $AC                   ; 3
    jsr    LF877                 ; 6
    jmp    LF5A4                 ; 3
    lda    $B8                   ; 3
    and    #$03                  ; 2
    bne    LF6F0                 ; 2³
    jsr    LF877                 ; 6
    clc                          ; 2
    lda    $AC                   ; 3
    adc    #6                    ; 2
    sta    $AC                   ; 3
    jmp    LF5A4                 ; 3
LF6F0:
    cmp    #1                    ; 2
    bne    LF705                 ; 2³+1
    inc    $AC                   ; 5
    inc    $AC                   ; 5
    jsr    LF877                 ; 6
    clc                          ; 2
    lda    $AC                   ; 3
    adc    #4                    ; 2
    sta    $AC                   ; 3
    jmp    LF5A4                 ; 3
LF705:
    cmp    #2                    ; 2
    bne    LF71A                 ; 2³
    clc                          ; 2
    lda    $AC                   ; 3
    adc    #4                    ; 2
    sta    $AC                   ; 3
    jsr    LF877                 ; 6
    inc    $AC                   ; 5
    inc    $AC                   ; 5
    jmp    LF5A4                 ; 3
LF71A:
    lda    $AC                   ; 3
    clc                          ; 2
    adc    #6                    ; 2
    sta    $AC                   ; 3
    jsr    LF877                 ; 6
    jmp    LF5A4                 ; 3
    ldy    $A8                   ; 3
    lda    #$2C                  ; 2
    sta.wy $84,Y                 ; 5
    sta.wy $86,Y                 ; 5
    sta.wy $88,Y                 ; 5
    lda    #$DA                  ; 2
    sta.wy $85,Y                 ; 5
    sta.wy $87,Y                 ; 5
    sta.wy $89,Y                 ; 5
    ldy    $AB                   ; 3
    lda    #$27                  ; 2
    sta    LF033,Y               ; 5
    sta    LF034,Y               ; 5
    sta    LF035,Y               ; 5
    jmp    LF5B7                 ; 3
    jsr    LF92E                 ; 6
    ldy    $A8                   ; 3
    lda    #$2C                  ; 2
    sta.wy $86,Y                 ; 5
    sta.wy $88,Y                 ; 5
    lda    #$DA                  ; 2
    sta.wy $87,Y                 ; 5
    sta.wy $89,Y                 ; 5
    ldy    $AB                   ; 3
    lda    #$27                  ; 2
    sta    LF034,Y               ; 5
    sta    LF035,Y               ; 5
    jmp    LF5B7                 ; 3
    jsr    LF954                 ; 6
    ldy    $A8                   ; 3
    lda    #$2C                  ; 2
    sta.wy $88,Y                 ; 5
    lda    #$DA                  ; 2
    sta.wy $89,Y                 ; 5
    ldy    $AB                   ; 3
    lda    #$27                  ; 2
    sta    LF035,Y               ; 5
    jmp    LF5B7                 ; 3
    jsr    LF97D                 ; 6
    jmp    LF5B7                 ; 3
    lda    $B8                   ; 3
    lsr                          ; 2
    bcs    LF79D                 ; 2³
    jsr    LF97D                 ; 6
    inc    $A9                   ; 5
    jmp    LF5B7                 ; 3
LF79D:
    inc    $A9                   ; 5
    jsr    LF97D                 ; 6
    jmp    LF5B7                 ; 3
    lda    $B8                   ; 3
    lsr                          ; 2
    bcs    LF7B4                 ; 2³
    jsr    LF97D                 ; 6
    inc    $A9                   ; 5
    inc    $A9                   ; 5
    jmp    LF5B7                 ; 3
LF7B4:
    inc    $A9                   ; 5
    inc    $A9                   ; 5
    jsr    LF97D                 ; 6
    jmp    LF5B7                 ; 3
    lda    $B8                   ; 3
    lsr                          ; 2
    bcs    LF7D0                 ; 2³
    jsr    LF97D                 ; 6
    lda    $A9                   ; 3
    clc                          ; 2
    adc    #3                    ; 2
    sta    $A9                   ; 3
    jmp    LF5B7                 ; 3
LF7D0:
    lda    $A9                   ; 3
    clc                          ; 2
    adc    #3                    ; 2
    sta    $A9                   ; 3
    jsr    LF97D                 ; 6
    jmp    LF5B7                 ; 3
    lda    $B9                   ; 3
    bne    LF7EE                 ; 2³
    jsr    LF97D                 ; 6
    clc                          ; 2
    lda    $A9                   ; 3
    adc    #4                    ; 2
    sta    $A9                   ; 3
    jmp    LF5B7                 ; 3
LF7EE:
    cmp    #1                    ; 2
    bne    LF801                 ; 2³+1
    clc                          ; 2
    lda    $A9                   ; 3
    adc    #3                    ; 2
    sta    $A9                   ; 3
    jsr    LF97D                 ; 6
    inc    $A9                   ; 5
    jmp    LF5B7                 ; 3
LF801:
    lda    $A9                   ; 3
    clc                          ; 2
    adc    #4                    ; 2
    sta    $A9                   ; 3
    jsr    LF97D                 ; 6
    jmp    LF5B7                 ; 3
    lda    $B9                   ; 3
    bne    LF81F                 ; 2³
    jsr    LF97D                 ; 6
    clc                          ; 2
    lda    $A9                   ; 3
    adc    #5                    ; 2
    sta    $A9                   ; 3
    jmp    LF5B7                 ; 3
LF81F:
    cmp    #1                    ; 2
    bne    LF834                 ; 2³
    clc                          ; 2
    lda    $A9                   ; 3
    adc    #3                    ; 2
    sta    $A9                   ; 3
    jsr    LF97D                 ; 6
    inc    $A9                   ; 5
    inc    $A9                   ; 5
    jmp    LF5B7                 ; 3
LF834:
    lda    $A9                   ; 3
    clc                          ; 2
    adc    #5                    ; 2
    sta    $A9                   ; 3
    jsr    LF97D                 ; 6
    jmp    LF5B7                 ; 3
    lda    $B9                   ; 3
    bne    LF852                 ; 2³
    jsr    LF97D                 ; 6
    clc                          ; 2
    lda    $A9                   ; 3
    adc    #6                    ; 2
    sta    $A9                   ; 3
    jmp    LF5B7                 ; 3
LF852:
    cmp    #1                    ; 2
    bne    LF86A                 ; 2³
    clc                          ; 2
    lda    $A9                   ; 3
    adc    #3                    ; 2
    sta    $A9                   ; 3
    jsr    LF97D                 ; 6
    clc                          ; 2
    lda    $A9                   ; 3
    adc    #3                    ; 2
    sta    $A9                   ; 3
    jmp    LF5B7                 ; 3
LF86A:
    lda    $A9                   ; 3
    clc                          ; 2
    adc    #6                    ; 2
    sta    $A9                   ; 3
    jsr    LF97D                 ; 6
    jmp    LF5B7                 ; 3
LF877:
    jsr    LF8D4                 ; 6
    ldy    $AC                   ; 3
    lda    LF151,Y               ; 4
    and    #$70                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    bne    LF8A9                 ; 2³
    lda    LF151,Y               ; 4
    and    #$0F                  ; 2
    tax                          ; 2
    lda    LF159,X               ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    tax                          ; 2
    lda    LFA52,X               ; 4
    sec                          ; 2
    sbc    LF149,Y               ; 4
    ldy    $A8                   ; 3
    sta.wy $82,Y                 ; 5
    lda    LFA53,X               ; 4
    sbc    #0                    ; 2
    sta.wy $83,Y                 ; 5
    bne    LF8BE                 ; 2³
LF8A9:
    tax                          ; 2
    lda    LFA46,X               ; 4
    sec                          ; 2
    sbc    LF149,Y               ; 4
    ldy    $A8                   ; 3
    sta.wy $82,Y                 ; 5
    lda    LFA47,X               ; 4
    sbc    #0                    ; 2
    sta.wy $83,Y                 ; 5
LF8BE:
    ldy    $AC                   ; 3
    lda    LF151,Y               ; 4
    and    #$0F                  ; 2
    tax                          ; 2
    ldy    LF161,X               ; 4
    lda    LF9A6,Y               ; 4
    ldx    $AB                   ; 3
    sta    LF032,X               ; 5
    inc    $AC                   ; 5
    rts                          ; 6

LF8D4:
    ldy    $AC                   ; 3
    lda    LF151,Y               ; 4
    and    #$70                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    bne    LF903                 ; 2³+1
    lda    LF151,Y               ; 4
    and    #$0F                  ; 2
    tax                          ; 2
    lda    LF159,X               ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    tax                          ; 2
    lda    LFA52,X               ; 4
    sec                          ; 2
    sbc    LF149,Y               ; 4
    ldy    $A8                   ; 3
    sta.wy $80,Y                 ; 5
    lda    LFA53,X               ; 4
    sbc    #0                    ; 2
    sta.wy $81,Y                 ; 5
    bne    LF918                 ; 2³
LF903:
    tax                          ; 2
    lda    LFA46,X               ; 4
    sec                          ; 2
    sbc    LF149,Y               ; 4
    ldy    $A8                   ; 3
    sta.wy $80,Y                 ; 5
    lda    LFA47,X               ; 4
    sbc    #0                    ; 2
    sta.wy $81,Y                 ; 5
LF918:
    ldy    $AC                   ; 3
    lda    LF151,Y               ; 4
    and    #$0F                  ; 2
    tax                          ; 2
    ldy    LF161,X               ; 4
    lda    LF9A6,Y               ; 4
    ldx    $AB                   ; 3
    sta    LF031,X               ; 5
    inc    $AC                   ; 5
    rts                          ; 6

LF92E:
    ldy    $A9                   ; 3
    ldx    $A8                   ; 3
    sec                          ; 2
    lda    #$2B                  ; 2
    sbc    LF179,Y               ; 4
    sta    $84,X                 ; 4
    lda    #$DA                  ; 2
    sbc    #0                    ; 2
    sta    $85,X                 ; 4
    lda    LF182,Y               ; 4
    and    #$0F                  ; 2
    tax                          ; 2
    ldy    LF194,X               ; 4
    lda    LF9A6,Y               ; 4
    ldx    $AB                   ; 3
    sta    LF033,X               ; 5
    inc    $A9                   ; 5
    rts                          ; 6

LF954:
    jsr    LF92E                 ; 6
    ldy    $A9                   ; 3
    ldx    $A8                   ; 3
    sec                          ; 2
    lda    #$2B                  ; 2
    sbc    LF179,Y               ; 4
    sta    $86,X                 ; 4
    lda    #$DA                  ; 2
    sbc    #0                    ; 2
    sta    $87,X                 ; 4
    lda    LF182,Y               ; 4
    and    #$0F                  ; 2
    tax                          ; 2
    ldy    LF194,X               ; 4
    lda    LF9A6,Y               ; 4
    ldx    $AB                   ; 3
    sta    LF034,X               ; 5
    inc    $A9                   ; 5
    rts                          ; 6

LF97D:
    jsr    LF954                 ; 6
    ldy    $A9                   ; 3
    ldx    $A8                   ; 3
    sec                          ; 2
    lda    #$2B                  ; 2
    sbc    LF179,Y               ; 4
    sta    $88,X                 ; 4
    lda    #$DA                  ; 2
    sbc    #0                    ; 2
    sta    $89,X                 ; 4
    lda    LF182,Y               ; 4
    and    #$0F                  ; 2
    tax                          ; 2
    ldy    LF194,X               ; 4
    lda    LF9A6,Y               ; 4
    ldx    $AB                   ; 3
    sta    LF035,X               ; 5
    inc    $A9                   ; 5
    rts                          ; 6

LF9A6:
    .byte $71 ; | XXX   X| $F9A6
    .byte $61 ; | XX    X| $F9A7
    .byte $51 ; | X X   X| $F9A8
    .byte $41 ; | X     X| $F9A9
    .byte $31 ; |  XX   X| $F9AA
    .byte $21 ; |  X    X| $F9AB
    .byte $11 ; |   X   X| $F9AC
    .byte $01 ; |       X| $F9AD
    .byte $F1 ; |XXXX   X| $F9AE
    .byte $E1 ; |XXX    X| $F9AF
    .byte $D1 ; |XX X   X| $F9B0
    .byte $C1 ; |XX     X| $F9B1
    .byte $B1 ; |X XX   X| $F9B2
    .byte $A1 ; |X X    X| $F9B3
    .byte $91 ; |X  X   X| $F9B4
    .byte $72 ; | XXX  X | $F9B5
    .byte $62 ; | XX   X | $F9B6
    .byte $52 ; | X X  X | $F9B7
    .byte $42 ; | X    X | $F9B8
    .byte $32 ; |  XX  X | $F9B9
    .byte $22 ; |  X   X | $F9BA
    .byte $12 ; |   X  X | $F9BB
    .byte $02 ; |      X | $F9BC
    .byte $F2 ; |XXXX  X | $F9BD
    .byte $E2 ; |XXX   X | $F9BE
    .byte $D2 ; |XX X  X | $F9BF
    .byte $C2 ; |XX    X | $F9C0
    .byte $B2 ; |X XX  X | $F9C1
    .byte $A2 ; |X X   X | $F9C2
    .byte $92 ; |X  X  X | $F9C3
    .byte $73 ; | XXX  XX| $F9C4
    .byte $63 ; | XX   XX| $F9C5
    .byte $53 ; | X X  XX| $F9C6
    .byte $43 ; | X    XX| $F9C7
    .byte $33 ; |  XX  XX| $F9C8
    .byte $23 ; |  X   XX| $F9C9
    .byte $13 ; |   X  XX| $F9CA
    .byte $03 ; |      XX| $F9CB
    .byte $F3 ; |XXXX  XX| $F9CC
    .byte $E3 ; |XXX   XX| $F9CD
    .byte $D3 ; |XX X  XX| $F9CE
    .byte $C3 ; |XX    XX| $F9CF
    .byte $B3 ; |X XX  XX| $F9D0
    .byte $A3 ; |X X   XX| $F9D1
    .byte $93 ; |X  X  XX| $F9D2
    .byte $74 ; | XXX X  | $F9D3
    .byte $64 ; | XX  X  | $F9D4
    .byte $54 ; | X X X  | $F9D5
    .byte $44 ; | X   X  | $F9D6
    .byte $34 ; |  XX X  | $F9D7
    .byte $24 ; |  X  X  | $F9D8
    .byte $14 ; |   X X  | $F9D9
    .byte $04 ; |     X  | $F9DA
    .byte $F4 ; |XXXX X  | $F9DB
    .byte $E4 ; |XXX  X  | $F9DC
    .byte $D4 ; |XX X X  | $F9DD
    .byte $C4 ; |XX   X  | $F9DE
    .byte $B4 ; |X XX X  | $F9DF
    .byte $A4 ; |X X  X  | $F9E0
    .byte $94 ; |X  X X  | $F9E1
    .byte $75 ; | XXX X X| $F9E2
    .byte $65 ; | XX  X X| $F9E3
    .byte $55 ; | X X X X| $F9E4
    .byte $45 ; | X   X X| $F9E5
    .byte $35 ; |  XX X X| $F9E6
    .byte $25 ; |  X  X X| $F9E7
    .byte $15 ; |   X X X| $F9E8
    .byte $05 ; |     X X| $F9E9
    .byte $F5 ; |XXXX X X| $F9EA
    .byte $E5 ; |XXX  X X| $F9EB
    .byte $D5 ; |XX X X X| $F9EC
    .byte $C5 ; |XX   X X| $F9ED
    .byte $B5 ; |X XX X X| $F9EE
    .byte $A5 ; |X X  X X| $F9EF
    .byte $95 ; |X  X X X| $F9F0
    .byte $76 ; | XXX XX | $F9F1
    .byte $66 ; | XX  XX | $F9F2
    .byte $56 ; | X X XX | $F9F3
    .byte $46 ; | X   XX | $F9F4
    .byte $36 ; |  XX XX | $F9F5
    .byte $26 ; |  X  XX | $F9F6
    .byte $16 ; |   X XX | $F9F7
    .byte $06 ; |     XX | $F9F8
    .byte $F6 ; |XXXX XX | $F9F9
    .byte $E6 ; |XXX  XX | $F9FA
    .byte $D6 ; |XX X XX | $F9FB
    .byte $C6 ; |XX   XX | $F9FC
    .byte $B6 ; |X XX XX | $F9FD
    .byte $A6 ; |X X  XX | $F9FE
    .byte $96 ; |X  X XX | $F9FF
    .byte $77 ; | XXX XXX| $FA00
    .byte $67 ; | XX  XXX| $FA01
    .byte $57 ; | X X XXX| $FA02
    .byte $47 ; | X   XXX| $FA03
    .byte $37 ; |  XX XXX| $FA04
    .byte $27 ; |  X  XXX| $FA05
    .byte $17 ; |   X XXX| $FA06
    .byte $07 ; |     XXX| $FA07
    .byte $F7 ; |XXXX XXX| $FA08
    .byte $E7 ; |XXX  XXX| $FA09
    .byte $D7 ; |XX X XXX| $FA0A
    .byte $C7 ; |XX   XXX| $FA0B
    .byte $B7 ; |X XX XXX| $FA0C
    .byte $A7 ; |X X  XXX| $FA0D
    .byte $97 ; |X  X XXX| $FA0E
    .byte $78 ; | XXXX   | $FA0F
    .byte $68 ; | XX X   | $FA10
    .byte $58 ; | X XX   | $FA11
    .byte $48 ; | X  X   | $FA12
    .byte $38 ; |  XXX   | $FA13
    .byte $28 ; |  X X   | $FA14
    .byte $18 ; |   XX   | $FA15
    .byte $08 ; |    X   | $FA16
    .byte $F8 ; |XXXXX   | $FA17
    .byte $E8 ; |XXX X   | $FA18
    .byte $D8 ; |XX XX   | $FA19
    .byte $C8 ; |XX  X   | $FA1A
    .byte $B8 ; |X XXX   | $FA1B
    .byte $A8 ; |X X X   | $FA1C
    .byte $98 ; |X  XX   | $FA1D
    .byte $79 ; | XXXX  X| $FA1E
    .byte $69 ; | XX X  X| $FA1F
    .byte $59 ; | X XX  X| $FA20
    .byte $49 ; | X  X  X| $FA21
    .byte $39 ; |  XXX  X| $FA22
    .byte $29 ; |  X X  X| $FA23
    .byte $19 ; |   XX  X| $FA24
    .byte $09 ; |    X  X| $FA25
    .byte $F9 ; |XXXXX  X| $FA26
    .byte $E9 ; |XXX X  X| $FA27
    .byte $D9 ; |XX XX  X| $FA28
    .byte $C9 ; |XX  X  X| $FA29
    .byte $B9 ; |X XXX  X| $FA2A
    .byte $A9 ; |X X X  X| $FA2B
    .byte $99 ; |X  XX  X| $FA2C
    .byte $7A ; | XXXX X | $FA2D
    .byte $6A ; | XX X X | $FA2E
    .byte $5A ; | X XX X | $FA2F
    .byte $4A ; | X  X X | $FA30
    .byte $3A ; |  XXX X | $FA31
    .byte $2A ; |  X X X | $FA32
    .byte $1A ; |   XX X | $FA33
    .byte $0A ; |    X X | $FA34
    .byte $FA ; |XXXXX X | $FA35
    .byte $EA ; |XXX X X | $FA36
    .byte $DA ; |XX XX X | $FA37
    .byte $CA ; |XX  X X | $FA38
    .byte $BA ; |X XXX X | $FA39
    .byte $AA ; |X X X X | $FA3A
    .byte $9A ; |X  XX X | $FA3B
    .byte $7B ; | XXXX XX| $FA3C
    .byte $6B ; | XX X XX| $FA3D
    .byte $5B ; | X XX XX| $FA3E
    .byte $4B ; | X  X XX| $FA3F
    .byte $3B ; |  XXX XX| $FA40
    .byte $2B ; |  X X XX| $FA41
    .byte $1B ; |   XX XX| $FA42
    .byte $0B ; |    X XX| $FA43
    .byte $FB ; |XXXXX XX| $FA44
    .byte $EB ; |XXX X XX| $FA45
LFA46:
    .byte $43 ; | X    XX| $FA46
LFA47:
    .byte $D6 ; |XX X XX | $FA47
    .byte $18 ; |   XX   | $FA48
    .byte $DC ; |XX XXX  | $FA49
    .byte $BE ; |X XXXXX | $FA4A
    .byte $DC ; |XX XXX  | $FA4B
    .byte $64 ; | XX  X  | $FA4C
    .byte $DD ; |XX XXX X| $FA4D
    .byte $0A ; |    X X | $FA4E
    .byte $DE ; |XX XXXX | $FA4F
    .byte $BE ; |X XXXXX | $FA50
    .byte $DC ; |XX XXX  | $FA51
LFA52:
    .byte $43 ; | X    XX| $FA52
LFA53:
    .byte $D6 ; |XX X XX | $FA53
    .byte $E9 ; |XXX X  X| $FA54
    .byte $D6 ; |XX X XX | $FA55
    .byte $8F ; |X   XXXX| $FA56
    .byte $D7 ; |XX X XXX| $FA57
    .byte $35 ; |  XX X X| $FA58
    .byte $D8 ; |XX XX   | $FA59
    .byte $DB ; |XX XX XX| $FA5A
    .byte $D8 ; |XX XX   | $FA5B
    .byte $81 ; |X      X| $FA5C
    .byte $D9 ; |XX XX  X| $FA5D
    .byte $27 ; |  X  XXX| $FA5E
    .byte $DA ; |XX XX X | $FA5F
    .byte $CC ; |XX  XX  | $FA60
    .byte $DA ; |XX XX X | $FA61
    .byte $72 ; | XXX  X | $FA62
    .byte $DB ; |XX XX XX| $FA63
    .byte $CC ; |XX  XX  | $FA64
    .byte $DA ; |XX XX X | $FA65
    .byte $27 ; |  X  XXX| $FA66
    .byte $DA ; |XX XX X | $FA67
    .byte $81 ; |X      X| $FA68
    .byte $D9 ; |XX XX  X| $FA69
    .byte $DB ; |XX XX XX| $FA6A
    .byte $D8 ; |XX XX   | $FA6B
    .byte $35 ; |  XX X X| $FA6C
    .byte $D8 ; |XX XX   | $FA6D
    .byte $8F ; |X   XXXX| $FA6E
    .byte $D7 ; |XX X XXX| $FA6F
    .byte $E9 ; |XXX X  X| $FA70
    .byte $D6 ; |XX X XX | $FA71
LFA72:
    .byte $CB ; |XX  X XX| $FA72
LFA73:
    .byte $F5 ; |XXXX X X| $FA73
    .byte $EA ; |XXX X X | $FA74
    .byte $F5 ; |XXXX X X| $FA75
    .byte $03 ; |      XX| $FA76
    .byte $F6 ; |XXXX XX | $FA77
    .byte $09 ; |    X  X| $FA78
    .byte $F6 ; |XXXX XX | $FA79
    .byte $1E ; |   XXXX | $FA7A
    .byte $F6 ; |XXXX XX | $FA7B
    .byte $37 ; |  XX XXX| $FA7C
    .byte $F6 ; |XXXX XX | $FA7D
    .byte $65 ; | XX  X X| $FA7E
    .byte $F6 ; |XXXX XX | $FA7F
    .byte $95 ; |X  X X X| $FA80
    .byte $F6 ; |XXXX XX | $FA81
    .byte $DD ; |XX XXX X| $FA82
    .byte $F6 ; |XXXX XX | $FA83
LFA84:
    .byte $27 ; |  X  XXX| $FA84
LFA85:
    .byte $F7 ; |XXXX XXX| $FA85
    .byte $4F ; | X  XXXX| $FA86
    .byte $F7 ; |XXXX XXX| $FA87
    .byte $71 ; | XXX   X| $FA88
    .byte $F7 ; |XXXX XXX| $FA89
    .byte $8A ; |X   X X | $FA8A
    .byte $F7 ; |XXXX XXX| $FA8B
    .byte $90 ; |X  X    | $FA8C
    .byte $F7 ; |XXXX XXX| $FA8D
    .byte $A5 ; |X X  X X| $FA8E
    .byte $F7 ; |XXXX XXX| $FA8F
    .byte $BE ; |X XXXXX | $FA90
    .byte $F7 ; |XXXX XXX| $FA91
    .byte $DD ; |XX XXX X| $FA92
    .byte $F7 ; |XXXX XXX| $FA93
    .byte $0E ; |    XXX | $FA94
    .byte $F8 ; |XXXXX   | $FA95
    .byte $41 ; | X     X| $FA96
    .byte $F8 ; |XXXXX   | $FA97

LFA98:
    lda    $EF                   ; 3
    ora    #$01                  ; 2
    sta    $EF                   ; 3
    lda    LFAEE                 ; 4
    sta    LF007                 ; 4
    lda    LFAEF                 ; 4
    sta    LF00B                 ; 4
    lda    LFAF0                 ; 4
    sta    LF014                 ; 4
    lda    LFAF1                 ; 4
    sta    LF018                 ; 4
    lda    LFAF2                 ; 4
    sta    LF01C                 ; 4
    lda    LFAF3                 ; 4
    sta    LF025                 ; 4
    lda    #$D3                  ; 2
    pha                          ; 3
    lda    #$4F                  ; 2
    pha                          ; 3
    ldx    #$FF                  ; 2
LFACA:
    inx                          ; 2
    lda    #$F1                  ; 2
    pha                          ; 3
    lda    #1                    ; 2
    pha                          ; 3
    lda    LF12D,X               ; 4
    cmp    #$9F                  ; 2
    bne    LFACA                 ; 2³
LFAD8:
    lda    TIMINT                ; 4
    bpl    LFAD8                 ; 2³
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    lda    #$A1                  ; 2
    sta    $AE                   ; 3
    lda    #$D2                  ; 2
    sta    $AF                   ; 3
    jmp    LFFEF                 ; 3

LFAEE:
    .byte $80 ; |X       | $FAEE
LFAEF:
    .byte $82 ; |X     X | $FAEF
LFAF0:
    .byte $84 ; |X    X  | $FAF0
LFAF1:
    .byte $86 ; |X    XX | $FAF1
LFAF2:
    .byte $88 ; |X   X   | $FAF2
LFAF3:
    .byte $2D ; |  X XX X| $FAF3

LFAF4:
    lda    #0                    ; 2
    sta    $EF                   ; 3
    lda    $E1                   ; 3
    lsr                          ; 2
    lda    #3                    ; 2
    sta    LF047                 ; 4
    bcc    LFB04                 ; 2³
    sta    $E4                   ; 3
LFB04:
    lda    #1                    ; 2
    sta    LF048                 ; 4
    sta    $E5                   ; 3
    lda    #0                    ; 2
    sta    LF045                 ; 4
    sta    LF046                 ; 4
    sta    $E2                   ; 3
    sta    $E3                   ; 3
LFB17:
    lda    #8                    ; 2
    sta    $D9                   ; 3
    ldx    LF148                 ; 4
    cpx    #5                    ; 2
    bcc    LFB24                 ; 2³
    ldx    #4                    ; 2
LFB24:
    lda    LFC37,X               ; 4
    sta    $A8                   ; 3
    lda    LFC3C,X               ; 4
    sta    $A9                   ; 3
    ldy    LFC32,X               ; 4
    sty    $BB                   ; 3
    sty    $C3                   ; 3
LFB35:
    lda    ($A8),Y               ; 5
    sta    LF049,Y               ; 5
    dey                          ; 2
    bpl    LFB35                 ; 2³
    lda    LFC41,X               ; 4
    sta    $A8                   ; 3
    lda    LFC46,X               ; 4
    sta    $A9                   ; 3
    ldy    LFC32,X               ; 4
LFB4A:
    lda    ($A8),Y               ; 5
    sta    LF061,Y               ; 5
    dey                          ; 2
    bpl    LFB4A                 ; 2³
    lda    LFC4B,X               ; 4
    sta    $A8                   ; 3
    lda    LFC50,X               ; 4
    sta    $A9                   ; 3
    ldy    LFC32,X               ; 4
LFB5F:
    lda    ($A8),Y               ; 5
    sta    LF051,Y               ; 5
    dey                          ; 2
    bpl    LFB5F                 ; 2³
    lda    LFC55,X               ; 4
    sta    $A8                   ; 3
    lda    LFC5A,X               ; 4
    sta    $A9                   ; 3
    ldy    LFC32,X               ; 4
LFB74:
    lda    ($A8),Y               ; 5
    sta    LF059,Y               ; 5
    dey                          ; 2
    bpl    LFB74                 ; 2³
    lda    LFC5F,X               ; 4
    sta    $A8                   ; 3
    lda    LFC64,X               ; 4
    sta    $A9                   ; 3
    ldy    #8                    ; 2
LFB88:
    lda    ($A8),Y               ; 5
    sta    LF082,Y               ; 5
    dey                          ; 2
    bpl    LFB88                 ; 2³
    lda    #0                    ; 2
    ldy    #7                    ; 2
LFB94:
    sta    LF069,Y               ; 5
    dey                          ; 2
    bpl    LFB94                 ; 2³
    ldy    #7                    ; 2
LFB9C:
    sta    LF071,Y               ; 5
    dey                          ; 2
    bpl    LFB9C                 ; 2³
    ldy    #8                    ; 2
LFBA4:
    sta    LF094,Y               ; 5
    dey                          ; 2
    bpl    LFBA4                 ; 2³
    ldy    #8                    ; 2
LFBAC:
    sta    LF0A6,Y               ; 5
    dey                          ; 2
    bpl    LFBAC                 ; 2³
    ldy    #8                    ; 2
LFBB4:
    sta    LF09D,Y               ; 5
    dey                          ; 2
    bpl    LFBB4                 ; 2³
    lda    #$FF                  ; 2
    ldy    #8                    ; 2
LFBBE:
    sta    LF079,Y               ; 5
    dey                          ; 2
    bpl    LFBBE                 ; 2³
    lda    #0                    ; 2
    sta    LF0B5                 ; 4
    sta    $D8                   ; 3
    sta    $C2                   ; 3
    sta    $C4                   ; 3
    sta    $BC                   ; 3
    sta    $BD                   ; 3
    sta    $BF                   ; 3
    sta    $BE                   ; 3
    sta    $D6                   ; 3
    sta    $F1                   ; 3
    ldy    #7                    ; 2
LFBDD:
    sta    LF0B6,Y               ; 5
    dey                          ; 2
    bpl    LFBDD                 ; 2³
    ldx    #7                    ; 2
LFBE5:
    sta    $C9,X                 ; 4
    dex                          ; 2
    bpl    LFBE5                 ; 2³
    sta    $BA                   ; 3
    sta    $C8                   ; 3
    lda    #1                    ; 2
    sta    $C9                   ; 3
    lda    LF148                 ; 4
    and    #$0F                  ; 2
    cmp    #9                    ; 2
    bcc    LFBFD                 ; 2³
    lda    #8                    ; 2
LFBFD:
    tax                          ; 2
    lda    LFC92,X               ; 4
    sta    $C6                   ; 3
    lda    LFC9B,X               ; 4
    sta    $C7                   ; 3
    lda    #$98                  ; 2
    sta    $DF                   ; 3
    lda    #$5A                  ; 2
    sta    $DE                   ; 3
    lda    #$BE                  ; 2
    sta    $E0                   ; 3
    lda    $E1                   ; 3
    and    #$02                  ; 2
    bne    LFC1E                 ; 2³
    lda    #0                    ; 2
    sta    $DD                   ; 3
LFC1E:
    lda    #$40                  ; 2
    sta    $F0                   ; 3
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcc    LFC2B                 ; 2³
    lsr                          ; 2
    bcs    LFC31                 ; 2³
LFC2B:
    lda    $E1                   ; 3
    and    #$7F                  ; 2
    sta    $E1                   ; 3
LFC31:
    rts                          ; 6

LFC32:
    .byte $01 ; |       X| $FC32
    .byte $07 ; |     XXX| $FC33
    .byte $07 ; |     XXX| $FC34
    .byte $07 ; |     XXX| $FC35
    .byte $07 ; |     XXX| $FC36
LFC37:
    .byte $69 ; | XX X  X| $FC37
    .byte $69 ; | XX X  X| $FC38
    .byte $69 ; | XX X  X| $FC39
    .byte $69 ; | XX X  X| $FC3A
    .byte $69 ; | XX X  X| $FC3B
LFC3C:
    .byte $FC ; |XXXXXX  | $FC3C
    .byte $FC ; |XXXXXX  | $FC3D
    .byte $FC ; |XXXXXX  | $FC3E
    .byte $FC ; |XXXXXX  | $FC3F
    .byte $FC ; |XXXXXX  | $FC40
LFC41:
    .byte $71 ; | XXX   X| $FC41
    .byte $71 ; | XXX   X| $FC42
    .byte $71 ; | XXX   X| $FC43
    .byte $71 ; | XXX   X| $FC44
    .byte $71 ; | XXX   X| $FC45
LFC46:
    .byte $FC ; |XXXXXX  | $FC46
    .byte $FC ; |XXXXXX  | $FC47
    .byte $FC ; |XXXXXX  | $FC48
    .byte $FC ; |XXXXXX  | $FC49
    .byte $FC ; |XXXXXX  | $FC4A
LFC4B:
    .byte $79 ; | XXXX  X| $FC4B
    .byte $79 ; | XXXX  X| $FC4C
    .byte $79 ; | XXXX  X| $FC4D
    .byte $79 ; | XXXX  X| $FC4E
    .byte $79 ; | XXXX  X| $FC4F
LFC50:
    .byte $FC ; |XXXXXX  | $FC50
    .byte $FC ; |XXXXXX  | $FC51
    .byte $FC ; |XXXXXX  | $FC52
    .byte $FC ; |XXXXXX  | $FC53
    .byte $FC ; |XXXXXX  | $FC54
LFC55:
    .byte $81 ; |X      X| $FC55
    .byte $81 ; |X      X| $FC56
    .byte $81 ; |X      X| $FC57
    .byte $81 ; |X      X| $FC58
    .byte $81 ; |X      X| $FC59
LFC5A:
    .byte $FC ; |XXXXXX  | $FC5A
    .byte $FC ; |XXXXXX  | $FC5B
    .byte $FC ; |XXXXXX  | $FC5C
    .byte $FC ; |XXXXXX  | $FC5D
    .byte $FC ; |XXXXXX  | $FC5E
LFC5F:
    .byte $89 ; |X   X  X| $FC5F
    .byte $89 ; |X   X  X| $FC60
    .byte $89 ; |X   X  X| $FC61
    .byte $89 ; |X   X  X| $FC62
    .byte $89 ; |X   X  X| $FC63
LFC64:
    .byte $FC ; |XXXXXX  | $FC64
    .byte $FC ; |XXXXXX  | $FC65
    .byte $FC ; |XXXXXX  | $FC66
    .byte $FC ; |XXXXXX  | $FC67
    .byte $FC ; |XXXXXX  | $FC68
    .byte $19 ; |   XX  X| $FC69
    .byte $55 ; | X X X X| $FC6A
    .byte $66 ; | XX  XX | $FC6B
    .byte $70 ; | XXX    | $FC6C
    .byte $7E ; | XXXXXX | $FC6D
    .byte $81 ; |X      X| $FC6E
    .byte $90 ; |X  X    | $FC6F
    .byte $98 ; |X  XX   | $FC70
    .byte $10 ; |   X    | $FC71
    .byte $80 ; |X       | $FC72
    .byte $60 ; | XX     | $FC73
    .byte $88 ; |X   X   | $FC74
    .byte $56 ; | X X XX | $FC75
    .byte $74 ; | XXX X  | $FC76
    .byte $49 ; | X  X  X| $FC77
    .byte $70 ; | XXX    | $FC78
    .byte $00 ; |        | $FC79
    .byte $21 ; |  X    X| $FC7A
    .byte $12 ; |   X  X | $FC7B
    .byte $13 ; |   X  XX| $FC7C
    .byte $14 ; |   X X  | $FC7D
    .byte $15 ; |   X X X| $FC7E
    .byte $16 ; |   X XX | $FC7F
    .byte $17 ; |   X XXX| $FC80
    .byte $04 ; |     X  | $FC81
    .byte $01 ; |       X| $FC82
    .byte $00 ; |        | $FC83
    .byte $01 ; |       X| $FC84
    .byte $00 ; |        | $FC85
    .byte $00 ; |        | $FC86
    .byte $00 ; |        | $FC87
    .byte $00 ; |        | $FC88
    .byte $00 ; |        | $FC89
    .byte $01 ; |       X| $FC8A
    .byte $82 ; |X     X | $FC8B
    .byte $83 ; |X     XX| $FC8C
    .byte $84 ; |X    X  | $FC8D
    .byte $85 ; |X    X X| $FC8E
    .byte $86 ; |X    XX | $FC8F
    .byte $87 ; |X    XXX| $FC90
    .byte $88 ; |X   X   | $FC91
LFC92:
    .byte $00 ; |        | $FC92
    .byte $00 ; |        | $FC93
    .byte $12 ; |   X  X | $FC94
    .byte $12 ; |   X  X | $FC95
    .byte $0F ; |    XXXX| $FC96
    .byte $0C ; |    XX  | $FC97
    .byte $09 ; |    X  X| $FC98
    .byte $06 ; |     XX | $FC99
    .byte $03 ; |      XX| $FC9A
LFC9B:
    .byte $00 ; |        | $FC9B
    .byte $4B ; | X  X XX| $FC9C
    .byte $43 ; | X    XX| $FC9D
    .byte $25 ; |  X  X X| $FC9E
    .byte $0F ; |    XXXX| $FC9F
    .byte $0C ; |    XX  | $FCA0
    .byte $09 ; |    X  X| $FCA1
    .byte $06 ; |     XX | $FCA2
    .byte $03 ; |      XX| $FCA3

LFCA4:
    lda    $E1                   ; 3
    bpl    LFCB1                 ; 2³
    lda    $EE                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    jmp    LFCB3                 ; 3
LFCB1:
    lda    $EE                   ; 3
LFCB3:
    asl                          ; 2
    bcc    LFCC6                 ; 2³
    asl                          ; 2
    bcs    LFCE4                 ; 2³
    dec    $C0                   ; 5
    bpl    LFCE4                 ; 2³
    lda    LF159                 ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    dey                          ; 2
    bcc    LFCD1                 ; 2³
LFCC6:
    dec    $C0                   ; 5
    bpl    LFCE4                 ; 2³
    lda    LF159                 ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    iny                          ; 2
LFCD1:
    tya                          ; 2
    and    #$0F                  ; 2
    sta    $A8                   ; 3
    lda    LF159                 ; 4
    and    #$F0                  ; 2
    ora    $A8                   ; 3
    sta    LF059                 ; 4
    lda    #2                    ; 2
    sta    $C0                   ; 3
LFCE4:
    lda    $E1                   ; 3
    bpl    LFCEC                 ; 2³
    lda    #2                    ; 2
    bne    LFCEE                 ; 2³
LFCEC:
    lda    #$20                  ; 2
LFCEE:
    and    $EE                   ; 3
    beq    LFD6F                 ; 2³+1
    lda    $BA                   ; 3
    sta    $AE                   ; 3
    lda    #0                    ; 2
    sta    $AF                   ; 3
    lda    LF159                 ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda    $BC                   ; 3
    adc    LFD70,X               ; 4
    sta    $A8                   ; 3
    lda    $BD                   ; 3
    adc    LFD71,X               ; 4
    sta    $A9                   ; 3
    bmi    LFD22                 ; 2³
    cmp    #2                    ; 2
    bcs    LFD6F                 ; 2³
    cmp    #1                    ; 2
    bcc    LFD30                 ; 2³
    lda    $A8                   ; 3
    cmp    #$80                  ; 2
    bcs    LFD6F                 ; 2³
    bcc    LFD30                 ; 2³
LFD22:
    cmp    #$FE                  ; 2
    bcc    LFD6F                 ; 2³
    cmp    #$FF                  ; 2
    bcs    LFD30                 ; 2³
    lda    $A8                   ; 3
    cmp    #$80                  ; 2
    bcc    LFD6F                 ; 2³
LFD30:
    lda    LFD72,X               ; 4
    clc                          ; 2
    adc    $BE                   ; 3
    sta    $AA                   ; 3
    lda    LFD73,X               ; 4
    adc    $BF                   ; 3
    sta    $AB                   ; 3
    bmi    LFD51                 ; 2³
    cmp    #2                    ; 2
    bcs    LFD6F                 ; 2³
    cmp    #1                    ; 2
    bcc    LFD5F                 ; 2³
    lda    $AA                   ; 3
    cmp    #$80                  ; 2
    bcs    LFD6F                 ; 2³
    bcc    LFD5F                 ; 2³
LFD51:
    cmp    #$FE                  ; 2
    bcc    LFD6F                 ; 2³
    cmp    #$FF                  ; 2
    bcs    LFD5F                 ; 2³
    lda    $AA                   ; 3
    cmp    #$80                  ; 2
    bcc    LFD6F                 ; 2³
LFD5F:
    lda    $AA                   ; 3
    sta    $BE                   ; 3
    lda    $AB                   ; 3
    sta    $BF                   ; 3
    lda    $A8                   ; 3
    sta    $BC                   ; 3
    lda    $A9                   ; 3
    sta    $BD                   ; 3
LFD6F:
    rts                          ; 6

LFD70:
    .byte $00 ; |        | $FD70
LFD71:
    .byte $00 ; |        | $FD71
LFD72:
    .byte $E8 ; |XXX X   | $FD72
LFD73:
    .byte $FF ; |XXXXXXXX| $FD73
    .byte $09 ; |    X  X| $FD74
    .byte $00 ; |        | $FD75
    .byte $EB ; |XXX X XX| $FD76
    .byte $FF ; |XXXXXXXX| $FD77
    .byte $11 ; |   X   X| $FD78
    .byte $00 ; |        | $FD79
    .byte $EF ; |XXX XXXX| $FD7A
    .byte $FF ; |XXXXXXXX| $FD7B
    .byte $15 ; |   X X X| $FD7C
    .byte $00 ; |        | $FD7D
    .byte $F7 ; |XXXX XXX| $FD7E
    .byte $FF ; |XXXXXXXX| $FD7F
    .byte $18 ; |   XX   | $FD80
    .byte $00 ; |        | $FD81
    .byte $00 ; |        | $FD82
    .byte $00 ; |        | $FD83
    .byte $15 ; |   X X X| $FD84
    .byte $00 ; |        | $FD85
    .byte $09 ; |    X  X| $FD86
    .byte $00 ; |        | $FD87
    .byte $11 ; |   X   X| $FD88
    .byte $00 ; |        | $FD89
    .byte $11 ; |   X   X| $FD8A
    .byte $00 ; |        | $FD8B
    .byte $09 ; |    X  X| $FD8C
    .byte $00 ; |        | $FD8D
    .byte $15 ; |   X X X| $FD8E
    .byte $00 ; |        | $FD8F
    .byte $00 ; |        | $FD90
    .byte $00 ; |        | $FD91
    .byte $18 ; |   XX   | $FD92
    .byte $00 ; |        | $FD93
    .byte $F7 ; |XXXX XXX| $FD94
    .byte $FF ; |XXXXXXXX| $FD95
    .byte $15 ; |   X X X| $FD96
    .byte $00 ; |        | $FD97
    .byte $EF ; |XXX XXXX| $FD98
    .byte $FF ; |XXXXXXXX| $FD99
    .byte $11 ; |   X   X| $FD9A
    .byte $00 ; |        | $FD9B
    .byte $EB ; |XXX X XX| $FD9C
    .byte $FF ; |XXXXXXXX| $FD9D
    .byte $09 ; |    X  X| $FD9E
    .byte $00 ; |        | $FD9F
    .byte $E8 ; |XXX X   | $FDA0
    .byte $FF ; |XXXXXXXX| $FDA1
    .byte $00 ; |        | $FDA2
    .byte $00 ; |        | $FDA3
    .byte $EB ; |XXX X XX| $FDA4
    .byte $FF ; |XXXXXXXX| $FDA5
    .byte $F7 ; |XXXX XXX| $FDA6
    .byte $FF ; |XXXXXXXX| $FDA7
    .byte $EF ; |XXX XXXX| $FDA8
    .byte $FF ; |XXXXXXXX| $FDA9
    .byte $EF ; |XXX XXXX| $FDAA
    .byte $FF ; |XXXXXXXX| $FDAB
    .byte $F7 ; |XXXX XXX| $FDAC
    .byte $FF ; |XXXXXXXX| $FDAD
    .byte $EB ; |XXX X XX| $FDAE
    .byte $FF ; |XXXXXXXX| $FDAF

LFDB0:
    ldy    $AF                   ; 3
    ldx    $AE                   ; 3
    clc                          ; 2
    lda    $BC                   ; 3
    adc    LF169,Y               ; 4
    sta    $A8                   ; 3
    lda    $BD                   ; 3
    adc    LF161,Y               ; 4
    sta    $A9                   ; 3
    clc                          ; 2
    lda    $BE                   ; 3
    adc    LF171,Y               ; 4
    sta    $AA                   ; 3
    lda    $BF                   ; 3
    adc    LF149,X               ; 4
    sta    $AB                   ; 3
    cmp    #$98                  ; 2
    bcc    LFDD9                 ; 2³
    jsr    LFE94                 ; 6
LFDD9:
    lda    $A9                   ; 3
    cmp    #$97                  ; 2
    bcs    LFDE3                 ; 2³
    cmp    #5                    ; 2
    bcs    LFDE6                 ; 2³
LFDE3:
    jsr    LFE37                 ; 6
LFDE6:
    lda    #$36                  ; 2
    cmp    $AB                   ; 3
    bcs    LFE20                 ; 2³+1
    lda    $AB                   ; 3
    cmp    #$64                  ; 2
    bcs    LFE20                 ; 2³+1
    lda    LF161,Y               ; 4
    cmp    #$70                  ; 2
    bcs    LFE03                 ; 2³+1
    lda    #$2B                  ; 2
    cmp    LF161,Y               ; 4
    bcs    LFE03                 ; 2³
    jsr    LFE94                 ; 6
LFE03:
    lda    #$2B                  ; 2
    cmp    $A9                   ; 3
    bcs    LFE20                 ; 2³
    lda    $A9                   ; 3
    cmp    #$70                  ; 2
    bcs    LFE20                 ; 2³
    lda    #$36                  ; 2
    cmp    LF149,X               ; 4
    bcs    LFE20                 ; 2³
    lda    LF149,X               ; 4
    cmp    #$64                  ; 2
    bcs    LFE20                 ; 2³
    jsr    LFE37                 ; 6
LFE20:
    lda    $A8                   ; 3
    sta    LF069,Y               ; 5
    lda    $A9                   ; 3
    sta    LF061,Y               ; 5
    lda    $AA                   ; 3
    sta    LF071,Y               ; 5
    lda    $AB                   ; 3
    sta    LF049,X               ; 5
    jmp    LFF40                 ; 3
LFE37:
    lda    #$3D                  ; 2
    sta    $CA                   ; 3
    tsx                          ; 2
    dex                          ; 2
    dex                          ; 2
    ldy    $AF                   ; 3
    lda    $D7                   ; 3
    bne    LFE8C                 ; 2³
    lda    $BC                   ; 3
    sta    0,X                   ; 4
    lda    $BD                   ; 3
    sta    1,X                   ; 4
    clc                          ; 2
    bpl    LFE50                 ; 2³
    sec                          ; 2
LFE50:
    ror                          ; 2
    sta    1,X                   ; 4
    ror    0,X                   ; 6
LFE55:
    sec                          ; 2
    lda    CXM0P,X               ; 4
    sbc    $BC                   ; 3
    sta    $BC                   ; 3
    lda    CXM1P,X               ; 4
    sbc    $BD                   ; 3
    sta    $BD                   ; 3
    bpl    LFE6F                 ; 2³
    sec                          ; 2
    lda    LF161,Y               ; 4
    sbc    #1                    ; 2
    sta    LF061,Y               ; 5
    bne    LFE78                 ; 2³
LFE6F:
    clc                          ; 2
    lda    LF161,Y               ; 4
    adc    #1                    ; 2
    sta    LF061,Y               ; 5
LFE78:
    clc                          ; 2
    lda    $BC                   ; 3
    adc    LF169,Y               ; 4
    sta    $A8                   ; 3
    lda    $BD                   ; 3
    adc    LF161,Y               ; 4
    sta    $A9                   ; 3
    ldx    $AE                   ; 3
    ldy    $AF                   ; 3
    rts                          ; 6

LFE8C:
    lda    #0                    ; 2
    sta    0,X                   ; 4
    sta    1,X                   ; 4
    beq    LFE55                 ; 2³
LFE94:
    lda    #$3D                  ; 2
    sta    $CA                   ; 3
    tsx                          ; 2
    dex                          ; 2
    dex                          ; 2
    ldy    $AF                   ; 3
    lda    $D7                   ; 3
    bne    LFEF0                 ; 2³
    lda    $BE                   ; 3
    sta    0,X                   ; 4
    lda    $BF                   ; 3
    sta    1,X                   ; 4
    clc                          ; 2
    bpl    LFEAD                 ; 2³
    sec                          ; 2
LFEAD:
    ror                          ; 2
    sta    1,X                   ; 4
    ror    0,X                   ; 6
LFEB2:
    sec                          ; 2
    lda    CXM0P,X               ; 4
    sbc    $BE                   ; 3
    sta    $BE                   ; 3
    lda    CXM1P,X               ; 4
    sbc    $BF                   ; 3
    sta    $BF                   ; 3
    bpl    LFECF                 ; 2³
    ldx    $AE                   ; 3
    sec                          ; 2
    lda    LF149,X               ; 4
    sbc    #1                    ; 2
    sta    LF049,X               ; 5
    jmp    LFEDA                 ; 3
LFECF:
    ldx    $AE                   ; 3
    clc                          ; 2
    lda    LF149,X               ; 4
    adc    #1                    ; 2
    sta    LF049,X               ; 5
LFEDA:
    clc                          ; 2
    lda    $BE                   ; 3
    adc    LF171,Y               ; 4
    sta    $AA                   ; 3
    lda    $BF                   ; 3
    ldy    $AE                   ; 3
    adc    LF149,Y               ; 4
    sta    $AB                   ; 3
    ldx    $AE                   ; 3
    ldy    $AF                   ; 3
    rts                          ; 6

LFEF0:
    lda    #0                    ; 2
    sta    0,X                   ; 4
    sta    1,X                   ; 4
    beq    LFEB2                 ; 2³
    lda    $AC                   ; 3
    sta    $AE                   ; 3
    lda    $AD                   ; 3
    sta    $AF                   ; 3
    lda    #1                    ; 2
    jsr    LFF15                 ; 6
    jsr    LFDB0                 ; 6
    lda    #0                    ; 2
    jsr    LFF15                 ; 6
LFF0D:
    lda    TIMINT                ; 4
    bpl    LFF0D                 ; 2³
    jmp    LF250                 ; 3
LFF15:
    sta    $D7                   ; 3
    lda    $BC                   ; 3
    ldx    LF1BC                 ; 4
    sta    LF0BC                 ; 4
    stx    $BC                   ; 3
    lda    $BD                   ; 3
    ldx    LF1BD                 ; 4
    sta    LF0BD                 ; 4
    stx    $BD                   ; 3
    lda    $BE                   ; 3
    ldx    LF1BA                 ; 4
    sta    LF0BA                 ; 4
    stx    $BE                   ; 3
    lda    $BF                   ; 3
    ldx    LF1BB                 ; 4
    sta    LF0BB                 ; 4
    stx    $BF                   ; 3
    rts                          ; 6

LFF40:
    ldy    $AE                   ; 3
    ldx    $AF                   ; 3
LFF44:
    cpy    $BB                   ; 3
    bcs    LFF6C                 ; 2³
    lda    LF14A,Y               ; 4
    cmp    LF149,Y               ; 4
    bcs    LFF6C                 ; 2³
    ldx    LF149,Y               ; 4
    sta    LF049,Y               ; 5
    txa                          ; 2
    sta    LF04A,Y               ; 5
    lda    LF151,Y               ; 4
    ldx    LF152,Y               ; 4
    sta    LF052,Y               ; 5
    txa                          ; 2
    sta    LF051,Y               ; 5
    iny                          ; 2
    sty    $AE                   ; 3
    bne    LFF44                 ; 2³
LFF6C:
    ldx    $AF                   ; 3
    ldy    $AE                   ; 3
    beq    LFF96                 ; 2³
    lda    LF149,Y               ; 4
    cmp    LF148,Y               ; 4
    bcs    LFF96                 ; 2³
    ldx    LF148,Y               ; 4
    sta    LF048,Y               ; 5
    txa                          ; 2
    sta    LF049,Y               ; 5
    lda    LF151,Y               ; 4
    ldx    LF150,Y               ; 4
    sta    LF050,Y               ; 5
    txa                          ; 2
    sta    LF051,Y               ; 5
    dey                          ; 2
    sty    $AE                   ; 3
    bne    LFF6C                 ; 2³
LFF96:
    rts                          ; 6

    .byte $7F ; | XXXXXXX| $FF97
    .byte $01 ; |       X| $FF98
    .byte $3C ; |  XXXX  | $FF99
    .byte $C3 ; |XX    XX| $FF9A
    .byte $3F ; |  XXXXXX| $FF9B
    .byte $26 ; |  X  XX | $FF9C
    .byte $2C ; |  X XX  | $FF9D
    .byte $F7 ; |XXXX XXX| $FF9E
    .byte $7D ; | XXXXX X| $FF9F
    .byte $1A ; |   XX X | $FFA0
    .byte $AB ; |X X X XX| $FFA1
    .byte $02 ; |      X | $FFA2
    .byte $64 ; | XX  X  | $FFA3
    .byte $40 ; | X      | $FFA4
    .byte $BD ; |X XXXX X| $FFA5
    .byte $93 ; |X  X  XX| $FFA6
    .byte $2A ; |  X X X | $FFA7
    .byte $15 ; |   X X X| $FFA8
    .byte $A6 ; |X X  XX | $FFA9
    .byte $00 ; |        | $FFAA
    .byte $2C ; |  X XX  | $FFAB
    .byte $8F ; |X   XXXX| $FFAC
    .byte $3F ; |  XXXXXX| $FFAD
    .byte $02 ; |      X | $FFAE
    .byte $6C ; | XX XX  | $FFAF
    .byte $76 ; | XXX XX | $FFB0
    .byte $2F ; |  X XXXX| $FFB1
    .byte $5E ; | X XXXX | $FFB2
    .byte $18 ; |   XX   | $FFB3
    .byte $D3 ; |XX X  XX| $FFB4
    .byte $2D ; |  X XX X| $FFB5
    .byte $71 ; | XXX   X| $FFB6
    .byte $2C ; |  X XX  | $FFB7
    .byte $C2 ; |XX    X | $FFB8
    .byte $ED ; |XXX XX X| $FFB9
    .byte $08 ; |    X   | $FFBA
    .byte $27 ; |  X  XXX| $FFBB
    .byte $F3 ; |XXXX  XX| $FFBC
    .byte $E7 ; |XXX  XXX| $FFBD
    .byte $13 ; |   X  XX| $FFBE
    .byte $07 ; |     XXX| $FFBF
    .byte $42 ; | X    X | $FFC0
    .byte $26 ; |  X  XX | $FFC1
    .byte $62 ; | XX   X | $FFC2
    .byte $FF ; |XXXXXXXX| $FFC3
    .byte $01 ; |       X| $FFC4
    .byte $38 ; |  XXX   | $FFC5
    .byte $B7 ; |X XX XXX| $FFC6
    .byte $7F ; | XXXXXXX| $FFC7
    .byte $61 ; | XX    X| $FFC8
    .byte $2E ; |  X XXX | $FFC9
    .byte $73 ; | XXX  XX| $FFCA
    .byte $F7 ; |XXXX XXX| $FFCB
    .byte $06 ; |     XX | $FFCC
    .byte $20 ; |  X     | $FFCD
    .byte $7E ; | XXXXXX | $FFCE
    .byte $A7 ; |X X  XXX| $FFCF
    .byte $02 ; |      X | $FFD0
    .byte $08 ; |    X   | $FFD1
    .byte $27 ; |  X  XXX| $FFD2
    .byte $7D ; | XXXXX X| $FFD3
    .byte $0A ; |    X X | $FFD4
    .byte $8E ; |X   XXX | $FFD5
    .byte $51 ; | X X   X| $FFD6
    .byte $BF ; |X XXXXXX| $FFD7
    .byte $AB ; |X X X XX| $FFD8
    .byte $3E ; |  XXXXX | $FFD9
    .byte $CB ; |XX  X XX| $FFDA
    .byte $7F ; | XXXXXXX| $FFDB
    .byte $42 ; | X    X | $FFDC
    .byte $2C ; |  X XX  | $FFDD
    .byte $9B ; |X  XX XX| $FFDE
    .byte $FC ; |XXXXXX  | $FFDF
    .byte $2A ; |  X X X | $FFE0
    .byte $BB ; |X XXX XX| $FFE1
    .byte $EB ; |XXX X XX| $FFE2
    .byte $7F ; | XXXXXXX| $FFE3
    .byte $B6 ; |X XX XX | $FFE4
    .byte $7F ; | XXXXXXX| $FFE5
    .byte $9A ; |X  XX X | $FFE6

LFFE7:
    lda    #1                    ; 2
    sta    LFFF8                 ; 4
    jmp.ind ($00AE)              ; 5
LFFEF:
    lda    #1                    ; 2
    sta    LFFF9                 ; 4
    jmp.ind ($00AE)              ; 5

    .byte $00 ; |        | $FFF7
LFFF8:
    .byte $FF ; |XXXXXXXX| $FFF8
LFFF9:
    .byte $FF ; |XXXXXXXX| $FFF9
LFFFA:
    .byte $FF ; |XXXXXXXX| $FFFA
    .byte $F2 ; |XXXX  X | $FFFB

       ORG $3FFC
      RORG $FFFC

    .word START
    .word START
