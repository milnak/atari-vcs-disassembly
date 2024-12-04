; Rough disassembly of Jr. Pac-Man
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
;
; Jr1.cfg contents:
;
;      ORG 9000
;      DATA 9000 90FF
;      CODE 9100 9229
;      GFX 922A 9237
;      CODE 9238 9254
;      GFX 9255 92A7
;      CODE 92A8 94F5
;      GFX 94F6 952F
;      CODE 9530 9543
;      GFX 9544 9588
;      CODE 9589 95FD
;      GFX 95FE 960D
;      CODE 960E 96CA
;      GFX 96CB 96D6
;      CODE 96D7 98DC
;      GFX 98DD 98E1
;      CODE 98E2 993B
;      GFX 993C 9940
;      CODE 9941 9A3C
;      GFX 9A3D 9A77
;      CODE 9A78 9AEF
;      GFX 9AF0 9AF3
;      CODE 9AF4 9B87
;      GFX 9B88 9B8B
;      CODE 9B8C 9CA5
;      GFX 9CA6 9CEB
;      CODE 9CEC 9DC5
;      GFX 9DC6 9DD4
;      CODE 9DD5 9E55
;      GFX 9E56 9E71
;      CODE 9E72 9F55
;      GFX 9F56 9FE0
;      CODE 9FE1 9FE3
;      GFX 9FE4 9FE6
;      CODE 9FE7 9FEC
;      GFX 9FED 9FEF
;      CODE 9FF0 9FF2
;      GFX 9FF3 9FFF
;
; Jr2.cfg contents:
;
;      ORG B000
;      DATA B000 B0FF
;      GFX B100 B577
;      CODE B578 B5DD
;      GFX B5DE B5FF
;      CODE B600 B83B
;      GFX B83C B856
;      CODE B857 BA79
;      GFX BA7A BA90
;      CODE BA91 BD3B
;      GFX BD3C BDFF
;      CODE BE00 BEC0
;      GFX BEC1 BEFF
;      CODE BF00 BF83
;      GFX BF84 BFD9
;      CODE BFDA BFDC
;      GFX BFDD BFDD
;      CODE BFDE BFE5
;      GFX BFE6 BFEF
;      CODE BFF0 BFF5
;      GFX BFF6 BFFF
;
; Jr3.cfg contents:
;
;      ORG D000
;      DATA D000 D0FF
;      CODE D100 D564
;      GFX D565 D61A
;      CODE D61B D670
;      GFX D671 D6E6
;      CODE D6E7 D74A
;      GFX D74B D7F0
;      CODE D7F1 D824
;      GFX D825 D83B
;      CODE D83C D856
;      GFX D857 D857
;      CODE D858 D8F6
;      GFX D8F7 D9FF
;      CODE DA00 DA45
;      GFX DA46 DA78
;      CODE DA79 DA90
;      GFX DA91 DA92
;      CODE DA93 DAF6
;      GFX DAF7 DCF6
;      CODE DCF7 DD01
;      GFX DD02 DE04
;      CODE DE05 DE12
;      GFX DE13 DEED
;      CODE DEEE DF7C
;      GFX DF7D DFEF
;      CODE DFF0 DFF5
;      GFX DFF6 DFFF
;
;
; Jr4.cfg contents:
;
;      ORG F000
;      DATA F000 F0FF
;      CODE F100 F105
;      GFX F106 F15F
;      CODE F160 F1AC
;      GFX F1AD F1B3
;      CODE F1B4 F356
;      GFX F357 F366
;      CODE F367 F554
;      GFX F555 F56D
;      CODE F56E F57A
;      GFX F57B F581
;      CODE F582 F5E0
;      GFX F5E1 F5F6
;      CODE F5F7 F771
;      GFX F772 F77D
;      CODE F77E F8D2
;      GFX F8D3 F8DE
;      CODE F8DF F909
;      GFX F90A F95E
;      CODE F95F FA9B
;      GFX FA9C FCF9
;      CODE FCFA FD3B
;      GFX FD3C FFDC
;      CODE FFDD FFF5
;      GFX FFF6 FFFF

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
RESBL   =  $14
AUDC0   =  $15
AUDC1   =  $16
AUDF0   =  $17
AUDF1   =  $18
AUDV0   =  $19
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMBL    =  $24
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
INPT4   =  $3C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

NUSIZ0_mirror =  $0104
PF2_mirror    =  $010F
RESP1_mirror  =  $0111
HMP0_mirror   =  $0120
HMP1_mirror   =  $0121
VDELP1_mirror =  $0126

ram_B3_mirror =  $01B3
ram_B8_mirror =  $01B8

BANK_0        =  $FFF6
BANK_1        =  $FFF7
BANK_2        =  $FFF8
BANK_3        =  $FFF9

READ          =  $0080

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        SEG.U SuperchipRam
        ORG $F000

SC_00              ds 17 ;
SC_11              ds 1  ;
SC_12              ds 7  ;
SC_19              ds 1  ;
SC_1A              ds 9  ;
SC_23              ds 1  ;
SC_24              ds 7  ;
SC_2B              ds 1  ;
SC_2C              ds 10 ;
SC_36              ds 17 ;
SC_47              ds 1  ;
SC_48              ds 17 ;
SC_59              ds 1  ;
SC_5A              ds 18 ;
SC_6C              ds 18 ;
SC_7E              ds 1  ;
SC_7F              ds 1  ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MACROS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  MAC FILLED_SPACE
    REPEAT {1}
      .byte $FF
    REPEND
  ENDM

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 0
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG CODE

       ORG $1000
      RORG $9000

    FILLED_SPACE 256             ; superchip ram space

START_BANK_0:
    sta    BANK_3                ; 4

L9103:
    ldx    #$33                  ; 2
    stx    TIM64T                ; 4
    lda    #0                    ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    ldx    #$CF                  ; 2
    txs                          ; 2
    lda    $FC                   ; 3
    bne    L912E                 ; 2³
    ldx    SC_7F|READ            ; 4
    bmi    L912E                 ; 2³
    inx                          ; 2
    stx    SC_7F                 ; 4
    bpl    L912E                 ; 2³
    lda    $F8                   ; 3
    ora    #$C0                  ; 2
    sta    $F8                   ; 3
    lda    #0                    ; 2
    sta    $F5                   ; 3
L912E:
    lda    $E3                   ; 3
    cmp    #$E0                  ; 2
    bcs    L9144                 ; 2³
    and    #$08                  ; 2
    beq    L9144                 ; 2³
    lda    $DC                   ; 3
    and    #$01                  ; 2
    bne    L9142                 ; 2³
    dec    $E9                   ; 5
    bcc    L9144                 ; 3   always branch

L9142:
    dec    $EF                   ; 5
L9144:
    lda    $F7                   ; 3
    beq    L9195                 ; 2³
    ldx    #9                    ; 2
    asl    $F7                   ; 5
    bcc    L915A                 ; 2³
    ldy    $F6                   ; 3
    lda    L9FCB,Y               ; 4
    sec                          ; 2
    sbc    #$12                  ; 2
    tay                          ; 2
    jsr    L9F43                 ; 6
L915A:
    asl    $F7                   ; 5
    bcc    L916A                 ; 2³
    ldy    $F6                   ; 3
    lda    L9FC4,Y               ; 4
    sec                          ; 2
    sbc    #$12                  ; 2
    tay                          ; 2
    jsr    L9F43                 ; 6
L916A:
    ldy    #1                    ; 2
    lda    $D0                   ; 3
    cmp    #$28                  ; 2
    bcc    L9174                 ; 2³
    ldy    #$10                  ; 2
L9174:
    ldx    #$10                  ; 2
    asl    $F7                   ; 5
    asl    $F7                   ; 5
    bcc    L917F                 ; 2³
    jsr    L9F43                 ; 6
L917F:
    ldx    #2                    ; 2
    asl    $F7                   ; 5
    bcc    L9195                 ; 2³
    lda    #$40                  ; 2
    ora    SC_24|READ,Y          ; 4
    sta    SC_24,Y               ; 5
    lda    SC_5A|READ,Y          ; 4
    ora    #$40                  ; 2
    sta    SC_5A,Y               ; 5
L9195:
    lda    $F3                   ; 3
    bne    L91D4                 ; 2³
    jsr    L9B8C                 ; 6
    lda    $FC                   ; 3
    and    #$0F                  ; 2
    ora    $D2                   ; 3
    bne    L91D1                 ; 2³
    ldy    $D3                   ; 3
    bpl    L91B2                 ; 2³
    lda    $D7                   ; 3
    and    #$E3                  ; 2
    ora    #$04                  ; 2
    sta    $D7                   ; 3
    bne    L91D1                 ; 3   always branch

L91B2:
    iny                          ; 2
    sty    $D3                   ; 3
    cpy    #$16                  ; 2
    beq    L91BD                 ; 2³
    cpy    #$4B                  ; 2
    bne    L91D1                 ; 2³
L91BD:
    ldy    #3                    ; 2
L91BF:
    lda.wy $DD,Y                 ; 4
    and    #$C0                  ; 2
    bne    L91CE                 ; 2³
    lda.wy $D7,Y                 ; 4
    ora    #$20                  ; 2
    sta.wy $D7,Y                 ; 5
L91CE:
    dey                          ; 2
    bpl    L91BF                 ; 2³
L91D1:
    jmp    L91E6                 ; 3

L91D4:
    ldx    $D5                   ; 3
    beq    L91E4                 ; 2³
    dec    $D5                   ; 5
    cmp    #4                    ; 2
    bne    L91E1                 ; 2³
    jsr    L9CEC                 ; 6
L91E1:
    jmp    L921B                 ; 3

L91E4:
    stx    $F3                   ; 3
L91E6:
    lda    $FC                   ; 3
    lsr                          ; 2
    bcc    L91F1                 ; 2³
    ldy    $D1                   ; 3
    bmi    L91F1                 ; 2³
    dec    $D1                   ; 5
L91F1:
    jsr    L9DD5                 ; 6
    lda    $FC                   ; 3
    and    #$0F                  ; 2
    sta    $BD                   ; 3
    ldy    #0                    ; 2
    jsr    L9238                 ; 6
    lda    $F3                   ; 3
    bne    L921B                 ; 2³
    lda    INTIM                 ; 4
    cmp    #$11                  ; 2
    bcs    L920E                 ; 2³
    nop                          ; 2
    jmp    L921B                 ; 3

L920E:
    lda    $FC                   ; 3
    and    #$0F                  ; 2
    ora    #$10                  ; 2
    sta    $BD                   ; 3
    ldy    #1                    ; 2
    jsr    L9238                 ; 6
L921B:
    nop                          ; 2
L921C:
    ldx    INTIM                 ; 4
    bmi    L9226                 ; 2³
    bne    L921C                 ; 2³
    jmp    L9FE1                 ; 3

L9226:
    nop                          ; 2
    jmp    L9FE1                 ; 3

L922A:
    .byte $A0 ; |X X     | $922A
    .byte $6E ; | XX XXX | $922B
    .byte $4F ; | X  XXXX| $922C
    .byte $3C ; |  XXXX  | $922D
    .byte $27 ; |  X  XXX| $922E
    .byte $17 ; |   X XXX| $922F
    .byte $0F ; |    XXXX| $9230
L9231:
    .byte $05 ; |     X X| $9231
    .byte $04 ; |     X  | $9232
    .byte $00 ; |        | $9233
    .byte $01 ; |       X| $9234
    .byte $02 ; |      X | $9235
    .byte $03 ; |      XX| $9236
    .byte $FF ; |XXXXXXXX| $9237

L9238:
    sty    $F0                   ; 3
    ldx    L9231,Y               ; 4
L923D:
    lda    INTIM                 ; 4
    cmp    #$11                  ; 2
    bcs    L9248                 ; 2³
    nop                          ; 2
    jmp    L9AF4                 ; 3

L9248:
    cpx    #4                    ; 2
    bne    L92A8                 ; 2³
    lda    $D5                   ; 3
    beq    L92A8                 ; 2³
    dec    $D5                   ; 5
    jmp    L9AE3                 ; 3

L9255:
    .byte $00 ; |        | $9255
    .byte $80 ; |X       | $9256
    .byte $80 ; |X       | $9257
    .byte $80 ; |X       | $9258
    .byte $C1 ; |XX     X| $9259
    .byte $80 ; |X       | $925A
    .byte $80 ; |X       | $925B
    .byte $80 ; |X       | $925C
    .byte $01 ; |       X| $925D
    .byte $80 ; |X       | $925E
    .byte $80 ; |X       | $925F
    .byte $80 ; |X       | $9260
    .byte $C3 ; |XX    XX| $9261
    .byte $80 ; |X       | $9262
    .byte $80 ; |X       | $9263
    .byte $80 ; |X       | $9264
    .byte $02 ; |      X | $9265
    .byte $80 ; |X       | $9266
    .byte $80 ; |X       | $9267
    .byte $80 ; |X       | $9268
    .byte $C5 ; |XX   X X| $9269
    .byte $80 ; |X       | $926A
    .byte $80 ; |X       | $926B
    .byte $80 ; |X       | $926C
    .byte $03 ; |      XX| $926D
    .byte $80 ; |X       | $926E
    .byte $80 ; |X       | $926F
    .byte $80 ; |X       | $9270
    .byte $C7 ; |XX   XXX| $9271
    .byte $80 ; |X       | $9272
    .byte $80 ; |X       | $9273
    .byte $80 ; |X       | $9274
    .byte $04 ; |     X  | $9275
    .byte $80 ; |X       | $9276
    .byte $80 ; |X       | $9277
    .byte $80 ; |X       | $9278
    .byte $80 ; |X       | $9279
    .byte $05 ; |     X X| $927A
    .byte $80 ; |X       | $927B
    .byte $80 ; |X       | $927C
    .byte $80 ; |X       | $927D
    .byte $80 ; |X       | $927E
    .byte $06 ; |     XX | $927F
    .byte $80 ; |X       | $9280
    .byte $80 ; |X       | $9281
    .byte $80 ; |X       | $9282
    .byte $CB ; |XX  X XX| $9283
    .byte $80 ; |X       | $9284
    .byte $80 ; |X       | $9285
    .byte $80 ; |X       | $9286
    .byte $07 ; |     XXX| $9287
    .byte $80 ; |X       | $9288
    .byte $80 ; |X       | $9289
    .byte $80 ; |X       | $928A
    .byte $CD ; |XX  XX X| $928B
    .byte $80 ; |X       | $928C
    .byte $80 ; |X       | $928D
    .byte $80 ; |X       | $928E
    .byte $08 ; |    X   | $928F
    .byte $80 ; |X       | $9290
    .byte $80 ; |X       | $9291
    .byte $80 ; |X       | $9292
    .byte $CF ; |XX  XXXX| $9293
    .byte $80 ; |X       | $9294
    .byte $80 ; |X       | $9295
    .byte $80 ; |X       | $9296
    .byte $09 ; |    X  X| $9297
    .byte $80 ; |X       | $9298
    .byte $80 ; |X       | $9299
    .byte $80 ; |X       | $929A
    .byte $D1 ; |XX X   X| $929B
    .byte $80 ; |X       | $929C
    .byte $80 ; |X       | $929D
    .byte $80 ; |X       | $929E
    .byte $0A ; |    X X | $929F
    .byte $80 ; |X       | $92A0
    .byte $80 ; |X       | $92A1
    .byte $80 ; |X       | $92A2
    .byte $D3 ; |XX X  XX| $92A3
    .byte $80 ; |X       | $92A4
    .byte $80 ; |X       | $92A5
    .byte $80 ; |X       | $92A6
    .byte $0B ; |    X XX| $92A7

L92A8:
    lda    $E4,X                 ; 4
    lsr                          ; 2
    bcs    L92C9                 ; 2³
    tay                          ; 2
    lda    L9255,Y               ; 4
    bmi    L92C9                 ; 2³
    sta    $BE                   ; 3
    lda    $D7,X                 ; 4
    rol                          ; 2
    lda    $EA,X                 ; 4
    ror                          ; 2
    bcs    L92C9                 ; 2³
    lsr                          ; 2
    bcs    L92C9                 ; 2³
    tay                          ; 2
    lda    L9F5A,Y               ; 4
    bmi    L92C9                 ; 2³
    jmp    L9FE7                 ; 3

L92C9:
    lda    $D7,X                 ; 4
    and    #$03                  ; 2
    tay                          ; 2
    lda    L9F56,Y               ; 4
    sta    $C1                   ; 3
    lda    L9CE6,X               ; 4
    eor    #$FF                  ; 2
    and    $F5                   ; 3
    sta    $F5                   ; 3
    cpx    #4                    ; 2
    beq    L92E3                 ; 2³
    jmp    L9A2D                 ; 3

L92E3:
    lda    $E8                   ; 3
    lsr                          ; 2
    bcs    L9323                 ; 2³+1
    tay                          ; 2
    lda    L9255,Y               ; 4
    bmi    L9323                 ; 2³+1
    lda    $DB                   ; 3
    and    #$03                  ; 2
    bne    L92FD                 ; 2³
    lda    $EE                   ; 3
    sec                          ; 2
    sbc    #6                    ; 2
    bcc    L9309                 ; 2³+1
    bcs    L9304                 ; 3+1   always branch

L92FD:
    lda    $EE                   ; 3
    clc                          ; 2
    adc    #6                    ; 2
    bcs    L9309                 ; 2³
L9304:
    pha                          ; 3
    lda    $DB                   ; 3
    rol                          ; 2
    pla                          ; 4
L9309:
    ror                          ; 2
    bcs    L9320                 ; 2³
    lsr                          ; 2
    bcs    L9320                 ; 2³
    tay                          ; 2
    lda    L9F5A,Y               ; 4
    bmi    L9320                 ; 2³
    sta    $B2                   ; 3
    lda    $E8                   ; 3
    lsr                          ; 2
    jsr    L9530                 ; 6
    jmp    L934C                 ; 3

L9320:
    jmp    L93B8                 ; 3

L9323:
    lda    $DB                   ; 3
    rol                          ; 2
    lda    $EE                   ; 3
    ror                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    L9F5A,Y               ; 4
    sta    $B2                   ; 3
    lda    $DB                   ; 3
    and    #$02                  ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    $E8                   ; 3
    cmp    #5                    ; 2
    bcc    L93AC                 ; 2³
    cmp    #$92                  ; 2
    bcs    L93AC                 ; 2³
    clc                          ; 2
    adc    L952E,X               ; 4
    lsr                          ; 2
    bcs    L93AC                 ; 2³
    jsr    L9530                 ; 6
    bcs    L93AC                 ; 2³
L934C:
    lda    #$F0                  ; 2
    sta    $B3                   ; 3
    lda    L9550,X               ; 4
    clc                          ; 2
    adc    $B2                   ; 3
    sta    $B2                   ; 3
    ldy    #$80                  ; 2
    lda    ($B2),Y               ; 5
    and    L9563,X               ; 4
    beq    L93AC                 ; 2³
    lda    #3                    ; 2
    sta    $D5                   ; 3
    lda    #0                    ; 2
    sta    $BD                   ; 3
    ldy    #$B6                  ; 2
    lda    ($B2),Y               ; 5
    and    L9563,X               ; 4
    beq    L9386                 ; 2³
    lda    ($B2),Y               ; 5
    and    L9576,X               ; 4
    ldy    #$36                  ; 2
    sta    ($B2),Y               ; 6
    jsr    L946E                 ; 6
    lda    #6                    ; 2
    sta    $D5                   ; 3
    lda    #1                    ; 2
    sta    $BD                   ; 3
L9386:
    ldy    #$80                  ; 2
    lda    ($B2),Y               ; 5
    and    L9576,X               ; 4
    ldy    #0                    ; 2
    sta    ($B2),Y               ; 6
L9391:
    asl    $E1                   ; 5
    sec                          ; 2
    ror    $E1                   ; 5
    inc    $F4                   ; 5
    bne    L93A0                 ; 2³
    lda    $FF                   ; 3
    ora    #$08                  ; 2
    sta    $FF                   ; 3
L93A0:
    lda    $BD                   ; 3
    jsr    L9E07                 ; 6
    jsr    L94D3                 ; 6
    lda    #$20                  ; 2
    sta    $D1                   ; 3
L93AC:
    ldx    #4                    ; 2
    lda    $F8                   ; 3
    beq    L93B5                 ; 2³
    jmp    L9A2D                 ; 3

L93B5:
    jmp    L959D                 ; 3

L93B8:
    lda    $E8                   ; 3
    cmp    #$30                  ; 2
    bcc    L93C2                 ; 2³
    cmp    #$74                  ; 2
    bcc    L93AC                 ; 2³
L93C2:
    lda    $DB                   ; 3
    and    #$03                  ; 2
    bne    L93D1                 ; 2³
    lda    $EE                   ; 3
    clc                          ; 2
    adc    #4                    ; 2
    bcs    L93DD                 ; 2³
    bcc    L93D8                 ; 3   always branch

L93D1:
    lda    $EE                   ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    bcs    L93DD                 ; 2³
L93D8:
    pha                          ; 3
    lda    $DB                   ; 3
    rol                          ; 2
    pla                          ; 4
L93DD:
    ror                          ; 2
    bcs    L93AC                 ; 2³
    lsr                          ; 2
    bcs    L93AC                 ; 2³
    tax                          ; 2
    ldy    L9F5A,X               ; 4
    bmi    L93AC                 ; 2³
    lda    $E8                   ; 3
    lsr                          ; 2
    tax                          ; 2
    lda    L9255,X               ; 4
    tax                          ; 2
    lda    L9517,X               ; 4
    bmi    L93AC                 ; 2³
    tax                          ; 2
    lda    SC_6C|READ,Y          ; 4
    and    L9522,X               ; 4
    beq    L93AC                 ; 2³
    lda    #3                    ; 2
    sta    $D5                   ; 3
    lda    #0                    ; 2
    sta    $BD                   ; 3
    lda    SC_6C|READ,Y          ; 4
    and    L9528,X               ; 4
    sta    SC_6C,Y               ; 5
    txa                          ; 2
    cpx    #3                    ; 2
    bcs    L9440                 ; 2³
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $BE                   ; 3
    lda    SC_00|READ,Y          ; 4
    and    #$07                  ; 2
    clc                          ; 2
    adc    $BE                   ; 3
    sty    $BE                   ; 3
    tay                          ; 2
    lda    L94FD,Y               ; 4
    bmi    L942D                 ; 2³
L942A:
    jmp    L9391                 ; 3

L942D:
    ldy    $BE                   ; 3
    and    #$0F                  ; 2
    sta    $BE                   ; 3
    lda    SC_00|READ,Y          ; 4
    and    #$F0                  ; 2
    ora    $BE                   ; 3
    sta    SC_00,Y               ; 5
    jmp    L9465                 ; 3

L9440:
    lda    L9512,X               ; 4
    sta    $BE                   ; 3
    lda    SC_36|READ,Y          ; 4
    and    #$07                  ; 2
    clc                          ; 2
    adc    $BE                   ; 3
    sty    $BE                   ; 3
    tay                          ; 2
    lda    L94FD,Y               ; 4
    bpl    L942A                 ; 2³
    ldy    $BE                   ; 3
    and    #$0F                  ; 2
    sta    $BE                   ; 3
    lda    SC_36|READ,Y          ; 4
    and    #$F0                  ; 2
    ora    $BE                   ; 3
    sta    SC_36,Y               ; 5
L9465:
    lda    #6                    ; 2
    sta    $D5                   ; 3
    inc    $BD                   ; 5
    jmp    L9391                 ; 3

L946E:
    cpx    #2                    ; 2
    beq    L947C                 ; 2³
    cpx    #$10                  ; 2
    beq    L947C                 ; 2³
    cpx    #9                    ; 2
    bne    L94D2                 ; 2³
    beq    L948E                 ; 3   always branch

L947C:
    lda    $B2                   ; 3
    cmp    #$25                  ; 2
    beq    L948E                 ; 2³
    cmp    #$13                  ; 2
    beq    L948E                 ; 2³
    cmp    #$34                  ; 2
    beq    L948E                 ; 2³
    cmp    #$22                  ; 2
    bne    L94D2                 ; 2³
L948E:
    sty    $B6                   ; 3
    lda    #$6A                  ; 2
    sta    $F2                   ; 3
    ldy    $F6                   ; 3
    bit    $FF                   ; 3
    bpl    L949C                 ; 2³
    ldy    #6                    ; 2
L949C:
    lda    L922A,Y               ; 4
    sta    $D2                   ; 3
    lda    $F5                   ; 3
    and    #$FC                  ; 2
    sta    $F5                   ; 3
    ldy    #3                    ; 2
L94A9:
    lda.wy $DD,Y                 ; 4
    bmi    L94C7                 ; 2³
    lda.wy $D7,Y                 ; 4
    and    #$E3                  ; 2
    ora    #$54                  ; 2
    sta.wy $D7,Y                 ; 5
    lda.wy $DD,Y                 ; 4
    and    #$40                  ; 2
    bne    L94C7                 ; 2³
    lda.wy $D7,Y                 ; 4
    ora    #$20                  ; 2
    sta.wy $D7,Y                 ; 5
L94C7:
    dey                          ; 2
    bpl    L94A9                 ; 2³
    ldy    $B6                   ; 3
    lda    $DB                   ; 3
    and    #$E3                  ; 2
    sta    $DB                   ; 3
L94D2:
    rts                          ; 6

L94D3:
    lda    $FF                   ; 3
    and    #$08                  ; 2
    beq    L94D2                 ; 2³
    ldx    $F6                   ; 3
    lda    $F4                   ; 3
    cmp    L94F6,X               ; 4
    bne    L94D2                 ; 2³
L94E2:
    lda    #6                    ; 2
    sta    $F3                   ; 3
    lda    #$9F                  ; 2
    sta    $D5                   ; 3
    lda    #$FF                  ; 2
    sta    $F1                   ; 3
    sta    $F2                   ; 3
    ldx    #$CF                  ; 2
    txs                          ; 2
    jmp    L921B                 ; 3

L94F6:
    .byte $52 ; | X X  X | $94F6
    .byte $42 ; | X    X | $94F7
    .byte $42 ; | X    X | $94F8
    .byte $4E ; | X  XXX | $94F9
    .byte $68 ; | XX X   | $94FA
    .byte $50 ; | X X    | $94FB
    .byte $52 ; | X X  X | $94FC
L94FD:
    .byte $02 ; |      X | $94FD
    .byte $03 ; |      XX| $94FE
    .byte $80 ; |X       | $94FF
    .byte $81 ; |X      X| $9500
    .byte $06 ; |     XX | $9501
    .byte $07 ; |     XXX| $9502
    .byte $84 ; |X    X  | $9503
    .byte $85 ; |X    X X| $9504
    .byte $04 ; |     X  | $9505
    .byte $05 ; |     X X| $9506
    .byte $06 ; |     XX | $9507
    .byte $07 ; |     XXX| $9508
    .byte $80 ; |X       | $9509
    .byte $81 ; |X      X| $950A
    .byte $82 ; |X     X | $950B
    .byte $83 ; |X     XX| $950C
    .byte $01 ; |       X| $950D
    .byte $80 ; |X       | $950E
    .byte $03 ; |      XX| $950F
    .byte $82 ; |X     X | $9510
    .byte $05 ; |     X X| $9511
L9512:
    .byte $84 ; |X    X  | $9512
    .byte $07 ; |     XXX| $9513
    .byte $86 ; |X    XX | $9514
    .byte $10 ; |   X    | $9515
    .byte $08 ; |    X   | $9516
L9517:
    .byte $00 ; |        | $9517
    .byte $01 ; |       X| $9518
    .byte $02 ; |      X | $9519
    .byte $80 ; |X       | $951A
    .byte $80 ; |X       | $951B
    .byte $80 ; |X       | $951C
    .byte $80 ; |X       | $951D
    .byte $80 ; |X       | $951E
    .byte $03 ; |      XX| $951F
    .byte $04 ; |     X  | $9520
    .byte $05 ; |     X X| $9521
L9522:
    .byte $20 ; |  X     | $9522
    .byte $40 ; | X      | $9523
    .byte $04 ; |     X  | $9524
    .byte $01 ; |       X| $9525
    .byte $10 ; |   X    | $9526
    .byte $08 ; |    X   | $9527
L9528:
    .byte $DF ; |XX XXXXX| $9528
    .byte $BF ; |X XXXXXX| $9529
    .byte $FB ; |XXXXX XX| $952A
    .byte $FE ; |XXXXXXX | $952B
    .byte $EF ; |XXX XXXX| $952C
    .byte $F7 ; |XXXX XXX| $952D
L952E:
    .byte $03 ; |      XX| $952E
    .byte $FB ; |XXXXX XX| $952F

L9530:
    clc                          ; 2
    tax                          ; 2
    lda    L9255,X               ; 4
    bmi    L953D                 ; 2³
    tax                          ; 2
    lda    L9544,X               ; 4
    tax                          ; 2
    rts                          ; 6

L953D:
    and    #$1F                  ; 2
    tax                          ; 2
    bne    L9543                 ; 2³
    sec                          ; 2
L9543:
    rts                          ; 6

L9544:
    .byte $00 ; |        | $9544
    .byte $02 ; |      X | $9545
    .byte $04 ; |     X  | $9546
    .byte $06 ; |     XX | $9547
    .byte $08 ; |    X   | $9548
    .byte $09 ; |    X  X| $9549
    .byte $0A ; |    X X | $954A
    .byte $0C ; |    XX  | $954B
    .byte $0E ; |    XXX | $954C
    .byte $10 ; |   X    | $954D
    .byte $12 ; |   X  X | $954E
    .byte $14 ; |   X X  | $954F
L9550:
    .byte $00 ; |        | $9550
    .byte $00 ; |        | $9551
    .byte $24 ; |  X  X  | $9552
    .byte $24 ; |  X  X  | $9553
    .byte $24 ; |  X  X  | $9554
    .byte $24 ; |  X  X  | $9555
    .byte $24 ; |  X  X  | $9556
    .byte $24 ; |  X  X  | $9557
    .byte $24 ; |  X  X  | $9558
    .byte $12 ; |   X  X | $9559
    .byte $12 ; |   X  X | $955A
    .byte $12 ; |   X  X | $955B
    .byte $12 ; |   X  X | $955C
    .byte $12 ; |   X  X | $955D
    .byte $12 ; |   X  X | $955E
    .byte $12 ; |   X  X | $955F
    .byte $12 ; |   X  X | $9560
    .byte $00 ; |        | $9561
    .byte $00 ; |        | $9562
L9563:
    .byte $20 ; |  X     | $9563
    .byte $80 ; |X       | $9564
    .byte $40 ; | X      | $9565
    .byte $10 ; |   X    | $9566
    .byte $04 ; |     X  | $9567
    .byte $01 ; |       X| $9568
    .byte $02 ; |      X | $9569
    .byte $08 ; |    X   | $956A
    .byte $20 ; |  X     | $956B
    .byte $80 ; |X       | $956C
    .byte $20 ; |  X     | $956D
    .byte $08 ; |    X   | $956E
    .byte $02 ; |      X | $956F
    .byte $01 ; |       X| $9570
    .byte $04 ; |     X  | $9571
    .byte $10 ; |   X    | $9572
    .byte $40 ; | X      | $9573
    .byte $40 ; | X      | $9574
    .byte $10 ; |   X    | $9575
L9576:
    .byte $DF ; |XX XXXXX| $9576
    .byte $7F ; | XXXXXXX| $9577
    .byte $BF ; |X XXXXXX| $9578
    .byte $EF ; |XXX XXXX| $9579
    .byte $FB ; |XXXXX XX| $957A
    .byte $FE ; |XXXXXXX | $957B
    .byte $FD ; |XXXXXX X| $957C
    .byte $F7 ; |XXXX XXX| $957D
    .byte $DF ; |XX XXXXX| $957E
    .byte $7F ; | XXXXXXX| $957F
    .byte $DF ; |XX XXXXX| $9580
    .byte $F7 ; |XXXX XXX| $9581
    .byte $FD ; |XXXXXX X| $9582
    .byte $FE ; |XXXXXXX | $9583
    .byte $FB ; |XXXXX XX| $9584
    .byte $EF ; |XXX XXXX| $9585
    .byte $BF ; |X XXXXXX| $9586
    .byte $BF ; |X XXXXXX| $9587
    .byte $EF ; |XXX XXXX| $9588

L9589:
    sta    $C1                   ; 3
    bit    $F8                   ; 3
    bmi    L9593                 ; 2³
    cpx    #4                    ; 2
    beq    L959D                 ; 2³
L9593:
    lda    L9CE6,X               ; 4
    bit    $F5                   ; 3
    beq    L959D                 ; 2³
    jmp    L9A2D                 ; 3

L959D:
    lda    L9CE6,X               ; 4
    ora    $F5                   ; 3
    sta    $F5                   ; 3
    cpx    #4                    ; 2
    bcc    L95AB                 ; 2³
    jmp    L96B1                 ; 3

L95AB:
    lda    $D7,X                 ; 4
    and    #$20                  ; 2
    beq    L95BC                 ; 2³
L95B1:
    lda    $D7,X                 ; 4
    eor    #$02                  ; 2
    and    #$DF                  ; 2
    sta    $D7,X                 ; 4
    jmp    L9A2D                 ; 3

L95BC:
    lda    $DD,X                 ; 4
    asl                          ; 2
    bcs    L960E                 ; 2³+1
    asl                          ; 2
    bcs    L95D8                 ; 2³
    lda    SC_7E|READ            ; 4
    and    L9CE6,X               ; 4
    beq    L95CF                 ; 2³
    jmp    L989D                 ; 3

L95CF:
    lda    $D7,X                 ; 4
    and    #$40                  ; 2
    bne    L95DB                 ; 2³
    jmp    L96B1                 ; 3

L95D8:
    jmp    L965D                 ; 3

L95DB:
    jsr    L95EE                 ; 6
    lda    L95FE,Y               ; 4
    sta    $C3                   ; 3
    jsr    L95EE                 ; 6
    lda    L9606,Y               ; 4
    sta    $C2                   ; 3
    jmp    L9941                 ; 3

L95EE:
    lda    $FC                   ; 3
    adc    $FD                   ; 3
    adc    $FE                   ; 3
    ldy    $FD                   ; 3
    sty    $FE                   ; 3
    sta    $FD                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    rts                          ; 6

L95FE:
    .byte $00 ; |        | $95FE
    .byte $08 ; |    X   | $95FF
    .byte $0C ; |    XX  | $9600
    .byte $10 ; |   X    | $9601
    .byte $14 ; |   X X  | $9602
    .byte $18 ; |   XX   | $9603
    .byte $1C ; |   XXX  | $9604
    .byte $24 ; |  X  X  | $9605
L9606:
    .byte $00 ; |        | $9606
    .byte $05 ; |     X X| $9607
    .byte $14 ; |   X X  | $9608
    .byte $1E ; |   XXXX | $9609
    .byte $28 ; |  X X   | $960A
    .byte $32 ; |  XX  X | $960B
    .byte $3C ; |  XXXX  | $960C
    .byte $55 ; | X X X X| $960D

L960E:
    lda    $E4,X                 ; 4
    cmp    #$4A                  ; 2
    bne    L9652                 ; 2³
    lda    $EA,X                 ; 4
    cmp    #$8C                  ; 2
    beq    L9645                 ; 2³
    cmp    #$A0                  ; 2
    bne    L9652                 ; 2³
    lda    $DD,X                 ; 4
    and    #$7F                  ; 2
    ora    #$40                  ; 2
    sta    $DD,X                 ; 4
    lda    $D7,X                 ; 4
    and    #$A0                  ; 2
    ora    #$13                  ; 2
    sta    $D7,X                 ; 4
    lda    $DD                   ; 3
    ora    $DE                   ; 3
    ora    $DF                   ; 3
    ora    $E0                   ; 3
    and    #$80                  ; 2
    bne    L965D                 ; 2³
    lda    $D2                   ; 3
    beq    L965D                 ; 2³
    lda    #$6A                  ; 2
    sta    $F2                   ; 3
    jmp    L965D                 ; 3

L9645:
    lda    $D7,X                 ; 4
    and    #$FC                  ; 2
    ora    #$02                  ; 2
    sta    $D7,X                 ; 4
    inc    $EA,X                 ; 6
    jmp    L9AE3                 ; 3

L9652:
    lda    #$14                  ; 2
    sta    $C3                   ; 3
    lda    #$23                  ; 2
    sta    $C2                   ; 3
    jmp    L9941                 ; 3

L965D:
    lda    $EA,X                 ; 4
    cmp    #$8C                  ; 2
    bne    L966C                 ; 2³
    lda    $DD,X                 ; 4
    and    #$BF                  ; 2
    sta    $DD,X                 ; 4
    jmp    L96B1                 ; 3

L966C:
    lda    $E4,X                 ; 4
    cmp    #$4A                  ; 2
    bne    L9682                 ; 2³
    lda    $D1                   ; 3
    bmi    L9685                 ; 2³
    lda    $F4                   ; 3
    sec                          ; 2
    sbc    $D4                   ; 3
    cmp    #5                    ; 2
    bcs    L9685                 ; 2³
    jmp    L9A2D                 ; 3

L9682:
    jmp    L95B1                 ; 3

L9685:
    txa                          ; 2
    tay                          ; 2
    lda    #0                    ; 2
L9689:
    dey                          ; 2
    bmi    L9692                 ; 2³
    ora.wy $DD,Y                 ; 4
    jmp    L9689                 ; 3

L9692:
    and    #$40                  ; 2
    beq    L9699                 ; 2³
    jmp    L9A2D                 ; 3

L9699:
    lda    #$20                  ; 2
    sta    $D1                   ; 3
    lda    $F4                   ; 3
    sta    $D4                   ; 3
    lda    $EA,X                 ; 4
    sec                          ; 2
    sbc    #1                    ; 2
    sta    $EA,X                 ; 4
    lda    $D7,X                 ; 4
    and    #$FC                  ; 2
    sta    $D7,X                 ; 4
    jmp    L9AE3                 ; 3

L96B1:
    cpx    #4                    ; 2
    bpl    L96BE                 ; 2³
    lda    $D3                   ; 3
    cmp    #$1A                  ; 2
    bcs    L96BE                 ; 2³
    jmp    L95DB                 ; 3

L96BE:
    lda    L96CB,X               ; 4
    sta    $B4                   ; 3
    lda    L96D1,X               ; 4
    sta    $B5                   ; 3
    jmp.ind ($00B4)              ; 5

L96CB:
    .byte <L989D         ; $96CB
    .byte <L98AF         ; $96CC
    .byte <L98E2         ; $96CD
    .byte <L9867         ; $96CE
    .byte <L97AC         ; $96CF
    .byte <L96D7         ; $96D0
L96D1:
    .byte >L989D         ; $96D1
    .byte >L98AF         ; $96D2
    .byte >L98E2         ; $96D3
    .byte >L9867         ; $96D4
    .byte >L97AC         ; $96D5
    .byte >L96D7         ; $96D6

L96D7:  ; indirect jump
    bit    $E3                   ; 3
    bmi    L96DE                 ; 2³
    jmp    L9AE3                 ; 3

L96DE:
    lda    $E3                   ; 3
    and    #$60                  ; 2
    beq    L96EB                 ; 2³
    cmp    #$20                  ; 2
    beq    L971A                 ; 2³+1
    jmp    L973F                 ; 3

L96EB:
    lda    $E3                   ; 3
    and    #$03                  ; 2
    tay                          ; 2
    lda    $E9                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    sec                          ; 2
    sbc    L9DCD,Y               ; 4
    bpl    L96FE                 ; 2³
    eor    #$FF                  ; 2
    adc    #1                    ; 2
L96FE:
    cmp    #8                    ; 2
    bcs    L9757                 ; 2³
    lda    $DC                   ; 3
    rol                          ; 2
    lda    $EF                   ; 3
    ror                          ; 2
    lsr                          ; 2
    sec                          ; 2
    sbc    L9DD1,Y               ; 4
    bpl    L9713                 ; 2³
    eor    #$FF                  ; 2
    adc    #1                    ; 2
L9713:
    cmp    #8                    ; 2
    bcs    L9757                 ; 2³
    jmp    L9762                 ; 3

L971A:
    jsr    L977E                 ; 6
    bcs    L9757                 ; 2³
    lda    $E3                   ; 3
    and    #$60                  ; 2
    beq    L9762                 ; 2³
    lda    $E2                   ; 3
    and    #$40                  ; 2
    bne    L9750                 ; 2³
L972B:
    lda    $E3                   ; 3
    and    #$9C                  ; 2
    ora    #$40                  ; 2
    sta    $E3                   ; 3
    lda    $FD                   ; 3
    and    #$03                  ; 2
    tay                          ; 2
    ora    $E3                   ; 3
    sta    $E3                   ; 3
    jmp    L9941                 ; 3

L973F:
    lda    $E9                   ; 3
    cmp    #$4A                  ; 2
    beq    L974A                 ; 2³
    jsr    L977E                 ; 6
    bcs    L9757                 ; 2³
L974A:
    lda    $E2                   ; 3
    and    #$40                  ; 2
    beq    L972B                 ; 2³
L9750:
    lda    #$E0                  ; 2
    sta    $E3                   ; 3
    jmp    L9AE3                 ; 3

L9757:
    lda    $E3                   ; 3
    and    #$03                  ; 2
    tay                          ; 2
    jsr    L9796                 ; 6
    jmp    L9941                 ; 3

L9762:
    lda    $FD                   ; 3
    and    #$03                  ; 2
    clc                          ; 2
    adc    $E3                   ; 3
    and    #$03                  ; 2
    sta    $B4                   ; 3
    tay                          ; 2
    lda    $E3                   ; 3
    and    #$9C                  ; 2
    ora    $B4                   ; 3
    ora    #$20                  ; 2
    sta    $E3                   ; 3
    jsr    L9796                 ; 6
    jmp    L9941                 ; 3

L977E:
    lda    $E9                   ; 3
    cmp    #$10                  ; 2
    beq    L9788                 ; 2³
    cmp    #$84                  ; 2
    bne    L9794                 ; 2³
L9788:
    lda    $EF                   ; 3
    cmp    #$14                  ; 2
    beq    L9792                 ; 2³
    cmp    #$40                  ; 2
    bne    L9794                 ; 2³
L9792:
    clc                          ; 2
    rts                          ; 6

L9794:
    sec                          ; 2
    rts                          ; 6

L9796:
    lda    $FD                   ; 3
    and    #$1F                  ; 2
    cmp    #4                    ; 2
    bcs    L97A1                 ; 2³
    and    #$03                  ; 2
    tay                          ; 2
L97A1:
    lda    L9DCD,Y               ; 4
    sta    $C3                   ; 3
    lda    L9DD1,Y               ; 4
    sta    $C2                   ; 3
    rts                          ; 6

L97AC:  ; indirect jump
    ldy    $F8                   ; 3
    beq    L980C                 ; 2³+1
    lda    $FE                   ; 3
    and    #$07                  ; 2
    bne    L97B9                 ; 2³
    jmp    L95DB                 ; 3

L97B9:
    lda    $D2                   ; 3
    bne    L97FA                 ; 2³
    lda    $DB                   ; 3
    rol                          ; 2
    lda    $EE                   ; 3
    ror                          ; 2
    lsr                          ; 2
    sta    $C4                   ; 3
    lda    $E8                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    sta    $C5                   ; 3
    lda    $D8                   ; 3
    rol                          ; 2
    lda    $EB                   ; 3
    ror                          ; 2
    lsr                          ; 2
    sec                          ; 2
    sbc    $C4                   ; 3
    sta    $C2                   ; 3
    lda    $E5                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    sec                          ; 2
    sbc    $C5                   ; 3
    sta    $C3                   ; 3
    lda    $C4                   ; 3
    sec                          ; 2
    sbc    $C2                   ; 3
    bpl    L97EA                 ; 2³
    lda    #0                    ; 2
L97EA:
    sta    $C2                   ; 3
    lda    $C5                   ; 3
    sec                          ; 2
    sbc    $C3                   ; 3
    bpl    L97F5                 ; 2³
    lda    #0                    ; 2
L97F5:
    sta    $C3                   ; 3
    jmp    L9941                 ; 3

L97FA:
    lda    $E5                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    sta    $C3                   ; 3
    lda    $D8                   ; 3
    rol                          ; 2
    lda    $EB                   ; 3
    ror                          ; 2
    lsr                          ; 2
    sta    $C2                   ; 3
    jmp    L9941                 ; 3

L980C:
    lda    SWCHA                 ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    L9FB0,Y               ; 4   player direction tab
    bmi    L9864                 ; 2³  branch if invalid, goto L9A7F
    tay                          ; 2   0-3
    lda    #0                    ; 2
    sta    SC_7F                 ; 4
    lda    L9FC0,Y               ; 4
    bit    $C1                   ; 3
    beq    L9864                 ; 2³  exit
    sty    $BE                   ; 3
    lda    $D7,X                 ; 4   X=4, $DB
    sta    $BF                   ; 3
    and    #$FC                  ; 2
    ora    $BE                   ; 3
    sta    $D7,X                 ; 4   X=4, $DB
    eor    $BF                   ; 3
    and    #$01                  ; 2
    beq    L9864                 ; 2³  exit
    lda    $DB                   ; 3
    and    #$03                  ; 2
    lsr                          ; 2
    bcc    L9846                 ; 2³
    lsr                          ; 2
    bcc    L9858                 ; 2³
    bcs    L9851                 ; 3   always branch

L9846:
    lsr                          ; 2
    bcc    L985E                 ; 2³
    inc    $EA,X                 ; 6
    inc    $EA,X                 ; 6
    inc    $EA,X                 ; 6
    bne    L9864                 ; 2³
L9851:
    dec    $E4,X                 ; 6
    dec    $E4,X                 ; 6
    jmp    L9864                 ; 3

L9858:
    inc    $E4,X                 ; 6
    inc    $E4,X                 ; 6
    bne    L9864                 ; 2³
L985E:
    dec    $EA,X                 ; 6
    dec    $EA,X                 ; 6
    dec    $EA,X                 ; 6
L9864:
    jmp    L9A2D                 ; 3

L9867:  ; indirect jump
    lda    $E8                   ; 3
    sec                          ; 2
    sbc    $E4,X                 ; 4
    bcs    L9872                 ; 2³
    eor    #$FF                  ; 2
    adc    #1                    ; 2
L9872:
    cmp    #$27                  ; 2
    bcs    L989D                 ; 2³
    lda    $D7,X                 ; 4
    rol                          ; 2
    lda    $EA,X                 ; 4
    ror                          ; 2
    lsr                          ; 2
    sta    $BE                   ; 3
    lda    $DB                   ; 3
    rol                          ; 2
    lda    $EE                   ; 3
    ror                          ; 2
    lsr                          ; 2
    sec                          ; 2
    sbc    $BE                   ; 3
    bcs    L988F                 ; 2³
    eor    #$FF                  ; 2
    adc    #1                    ; 2
L988F:
    cmp    #$0C                  ; 2
    bcs    L989D                 ; 2³
    lda    #0                    ; 2
    sta    $C3                   ; 3
    lda    #$28                  ; 2
    sta    $C2                   ; 3
    bne    L98AC                 ; 3   always branch

L989D:  ; indirect jump also
    lda    $E8                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    sta    $C3                   ; 3
    lda    $DB                   ; 3
    rol                          ; 2
    lda    $EE                   ; 3
    ror                          ; 2
    lsr                          ; 2
    sta    $C2                   ; 3
L98AC:
    jmp    L9941                 ; 3

L98AF:  ; indirect jump
    lda    $E8                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    sta    $C3                   ; 3
    lda    $DB                   ; 3
    rol                          ; 2
    lda    $EE                   ; 3
    ror                          ; 2
    lsr                          ; 2
    sta    $C2                   ; 3
    lda    $DB                   ; 3
    and    #$03                  ; 2
    tay                          ; 2
    lda    $C2                   ; 3
    clc                          ; 2
    adc    L98DD,Y               ; 4
    bpl    L98CD                 ; 2³
    lda    #0                    ; 2
L98CD:
    sta    $C2                   ; 3
    lda    $C3                   ; 3
    clc                          ; 2
    adc    L98DE,Y               ; 4
    bpl    L98D9                 ; 2³
    lda    #0                    ; 2
L98D9:
    sta    $C3                   ; 3
    bpl    L98AC                 ; 3   always branch

L98DD:
    .byte $FC ; |XXXXXX  | $98DD
L98DE:
    .byte $00 ; |        | $98DE
    .byte $04 ; |     X  | $98DF
    .byte $00 ; |        | $98E0
    .byte $FC ; |XXXXXX  | $98E1

L98E2:  ; indirect jump
    lda    $DB                   ; 3
    rol                          ; 2
    lda    $EE                   ; 3
    ror                          ; 2
    lsr                          ; 2
    sta    $C4                   ; 3
    lda    $E8                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    sta    $C5                   ; 3
    lda    $DB                   ; 3
    and    #$03                  ; 2
    tay                          ; 2
    lda    $C4                   ; 3
    clc                          ; 2
    adc    L98DD,Y               ; 4
    bpl    L9900                 ; 2³+1
    lda    #0                    ; 2
L9900:
    sta    $C4                   ; 3
    lda    $C5                   ; 3
    clc                          ; 2
    adc    L993D,Y               ; 4
    bpl    L990C                 ; 2³
    lda    #0                    ; 2
L990C:
    sta    $C5                   ; 3
    lda    $D7                   ; 3
    rol                          ; 2
    lda    $EA                   ; 3
    ror                          ; 2
    lsr                          ; 2
    sec                          ; 2
    sbc    $C4                   ; 3
    sta    $C2                   ; 3
    lda    $E4                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    sec                          ; 2
    sbc    $C5                   ; 3
    sta    $C3                   ; 3
    lda    $C4                   ; 3
    sec                          ; 2
    sbc    $C2                   ; 3
    bpl    L992C                 ; 2³
    lda    #0                    ; 2
L992C:
    sta    $C2                   ; 3
    lda    $C5                   ; 3
    sec                          ; 2
    sbc    $C3                   ; 3
    bpl    L9937                 ; 2³
    lda    #0                    ; 2
L9937:
    sta    $C3                   ; 3
    jmp    L9941                 ; 3

    .byte $FE ; |XXXXXXX | $993C
L993D:
    .byte $00 ; |        | $993D
    .byte $02 ; |      X | $993E
    .byte $00 ; |        | $993F
    .byte $FE ; |XXXXXXX | $9940

L9941:
    stx    $BE                   ; 3
    lda    #0                    ; 2
    sta    $C8                   ; 3
    lda    $D7,X                 ; 4
    rol                          ; 2
    lda    $EA,X                 ; 4
    ror                          ; 2
    lsr                          ; 2
    sta    $BF                   ; 3
    lda    $E4,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    sta    $C0                   ; 3
    lda    $D7,X                 ; 4
    and    #$03                  ; 2
    tax                          ; 2
    ldy    L9A44,X               ; 4
    lda    L9FC0,Y               ; 4
    eor    #$FF                  ; 2
    and    $C1                   ; 3
    sta    $C1                   ; 3
    lda    $C2                   ; 3
    sec                          ; 2
    sbc    $BF                   ; 3
    sta    $C6                   ; 3
    bne    L9974                 ; 2³
    ldy    #$80                  ; 2
    sty    $C8                   ; 3
L9974:
    and    #$80                  ; 2
    pha                          ; 3
    lda    $C3                   ; 3
    sec                          ; 2
    sbc    $C0                   ; 3
    sta    $C7                   ; 3
    bne    L9984                 ; 2³
    ldy    #$40                  ; 2
    sty    $C8                   ; 3
L9984:
    and    #$80                  ; 2
    clc                          ; 2
    rol                          ; 2
    pla                          ; 4
    rol                          ; 2
    rol                          ; 2
    tay                          ; 2
    ldx    L9A3D,Y               ; 4
    stx    $C4                   ; 3
    bit    $C8                   ; 3
    bmi    L9999                 ; 2³
    bvs    L99BC                 ; 2³
    bvc    L99DF                 ; 3   always branch

L9999:
    ldx    $C4                   ; 3
    lda    L9A48,X               ; 4
    tax                          ; 2
    lda    $C1                   ; 3
    clc                          ; 2
    adc    L9A55,X               ; 4
    cmp    #$20                  ; 2
    php                          ; 3
    bcc    L99AC                 ; 2³
    sbc    #$20                  ; 2
L99AC:
    tax                          ; 2
    lda    L9A59,X               ; 4
    plp                          ; 4
    bcc    L99B7                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
L99B7:
    and    #$03                  ; 2
    jmp    L9A21                 ; 3

L99BC:
    ldx    $C4                   ; 3
    lda    L9A52,X               ; 4
    tax                          ; 2
    lda    $C1                   ; 3
    clc                          ; 2
    adc    L9A55,X               ; 4
    cmp    #$20                  ; 2
    php                          ; 3
    bcc    L99CF                 ; 2³
    sbc    #$20                  ; 2
L99CF:
    tax                          ; 2
    lda    L9A59,X               ; 4
    plp                          ; 4
    bcc    L99DA                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
L99DA:
    and    #$03                  ; 2
    jmp    L9A21                 ; 3

L99DF:
    lda    $C7                   ; 3
    bpl    L99EA                 ; 2³
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #1                    ; 2
    sta    $C7                   ; 3
L99EA:
    lda    $C6                   ; 3
    bpl    L99F3                 ; 2³
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #1                    ; 2
L99F3:
    cmp    $C7                   ; 3
    bpl    L9A30                 ; 2³+1
    ldx    $C4                   ; 3
    lda    L9A4C,X               ; 4
    tay                          ; 2
    lda    L9A48,X               ; 4
    tax                          ; 2
L9A01:
    lda    $C1                   ; 3
    clc                          ; 2
    adc    L9A55,X               ; 4
    cmp    #$20                  ; 2
    php                          ; 3
    bcc    L9A0E                 ; 2³
    sbc    #$20                  ; 2
L9A0E:
    tax                          ; 2
    lda    L9A59,X               ; 4
    plp                          ; 4
    bcc    L9A19                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
L9A19:
    cpy    #1                    ; 2
    beq    L9A1F                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
L9A1F:
    and    #$03                  ; 2
L9A21:
    ldx    $BE                   ; 3
    sta    $BE                   ; 3
    lda    $D7,X                 ; 4
    and    #$FC                  ; 2
    ora    $BE                   ; 3
    sta    $D7,X                 ; 4
L9A2D:
    jmp    L9A78                 ; 3

L9A30:
    ldx    $C4                   ; 3
    lda    L9A4E,X               ; 4
    tay                          ; 2
    lda    L9A52,X               ; 4
    tax                          ; 2
    jmp    L9A01                 ; 3

L9A3D:
    .byte $00 ; |        | $9A3D
    .byte $01 ; |       X| $9A3E
    .byte $02 ; |      X | $9A3F
    .byte $03 ; |      XX| $9A40
    .byte $03 ; |      XX| $9A41
    .byte $00 ; |        | $9A42
    .byte $01 ; |       X| $9A43
L9A44:
    .byte $02 ; |      X | $9A44
    .byte $03 ; |      XX| $9A45
    .byte $00 ; |        | $9A46
    .byte $01 ; |       X| $9A47
L9A48:
    .byte $01 ; |       X| $9A48
    .byte $01 ; |       X| $9A49
    .byte $03 ; |      XX| $9A4A
    .byte $03 ; |      XX| $9A4B
L9A4C:
    .byte $00 ; |        | $9A4C
    .byte $01 ; |       X| $9A4D
L9A4E:
    .byte $01 ; |       X| $9A4E
    .byte $00 ; |        | $9A4F
    .byte $00 ; |        | $9A50
    .byte $01 ; |       X| $9A51
L9A52:
    .byte $02 ; |      X | $9A52
    .byte $00 ; |        | $9A53
    .byte $02 ; |      X | $9A54
L9A55:
    .byte $00 ; |        | $9A55
    .byte $10 ; |   X    | $9A56
    .byte $20 ; |  X     | $9A57
    .byte $30 ; |  XX    | $9A58
L9A59:
    .byte $00 ; |        | $9A59
    .byte $00 ; |        | $9A5A
    .byte $55 ; | X X X X| $9A5B
    .byte $50 ; | X X    | $9A5C
    .byte $AA ; |X X X X | $9A5D
    .byte $A0 ; |X X     | $9A5E
    .byte $A5 ; |X X  X X| $9A5F
    .byte $A0 ; |X X     | $9A60
    .byte $FF ; |XXXXXXXX| $9A61
    .byte $F0 ; |XXXX    | $9A62
    .byte $D7 ; |XX X XXX| $9A63
    .byte $D0 ; |XX X    | $9A64
    .byte $AF ; |X X XXXX| $9A65
    .byte $A0 ; |X X     | $9A66
    .byte $A7 ; |X X  XXX| $9A67
    .byte $00 ; |        | $9A68
    .byte $00 ; |        | $9A69
    .byte $00 ; |        | $9A6A
    .byte $55 ; | X X X X| $9A6B
    .byte $05 ; |     X X| $9A6C
    .byte $AA ; |X X X X | $9A6D
    .byte $28 ; |  X X   | $9A6E
    .byte $A5 ; |X X  X X| $9A6F
    .byte $25 ; |  X  X X| $9A70
    .byte $FF ; |XXXXXXXX| $9A71
    .byte $F0 ; |XXXX    | $9A72
    .byte $F5 ; |XXXX X X| $9A73
    .byte $F5 ; |XXXX X X| $9A74
    .byte $FA ; |XXXXX X | $9A75
    .byte $F8 ; |XXXXX   | $9A76
    .byte $F5 ; |XXXX X X| $9A77

L9A78:
    cpx    #5                    ; 2
    bne    L9A7F                 ; 2³
    jmp    L9B05                 ; 3

L9A7F:
    lda    $D7,X                 ; 4
    and    #$03                  ; 2
    tay                          ; 2
    lda    L9FC0,Y               ; 4
    bit    $C1                   ; 3
    beq    L9AE3                 ; 2³
    lda    L9AF0,Y               ; 4   low
    sta    $B4                   ; 3
    lda    #$9A                  ; 2   high
    sta    $B5                   ; 3
    lda    $D7,X                 ; 4
    and    #$1C                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    L9CE6,Y               ; 4
    ldy    $BD                   ; 3
    jmp.ind ($00B4)              ; 5

L9AA3:  ; indirect jump
    and    L9CC6,Y               ; 4
    beq    L9AE3                 ; 2³
    dec    $E4,X                 ; 6
    jmp    L9AE3                 ; 3

L9AAD:  ; indirect jump
    and    L9CC6,Y               ; 4
    beq    L9AE3                 ; 2³
    inc    $E4,X                 ; 6
    jmp    L9AE3                 ; 3

L9AB7:  ; indirect jump
    and    L9CA6,Y               ; 4
    beq    L9AE3                 ; 2³
    lda    $EA,X                 ; 4
    clc                          ; 2
    adc    #1                    ; 2
    sta    $EA,X                 ; 4
    bcc    L9AE3                 ; 2³
    asl    $D7,X                 ; 6
    sec                          ; 2
    ror    $D7,X                 ; 6
    jmp    L9AE3                 ; 3

L9ACD:  ; indirect jump
    and    L9CA6,Y               ; 4
    beq    L9AE3                 ; 2³
    lda    $EA,X                 ; 4
    sec                          ; 2
    sbc    #1                    ; 2
    sta    $EA,X                 ; 4
    bcs    L9AE3                 ; 2³
    asl    $D7,X                 ; 6
    clc                          ; 2
    ror    $D7,X                 ; 6
    jmp    L9AE3                 ; 3

L9AE3:
    ldy    $F0                   ; 3
    iny                          ; 2
    sty    $F0                   ; 3
    ldx    L9231,Y               ; 4
    bmi    L9AF4                 ; 2³
    jmp    L923D                 ; 3

L9AF0:
    .byte <L9ACD         ; $9AF0
    .byte <L9AAD         ; $9AF1
    .byte <L9AB7         ; $9AF2
    .byte <L9AA3         ; $9AF3

L9AF4:
    lda    $DB                   ; 3
    lsr                          ; 2
    bcs    L9B02                 ; 2³+1
    lsr                          ; 2
    bcs    L9B00                 ; 2³+1
    inc    $D6                   ; 5
    bne    L9B02                 ; 2³
L9B00:
    dec    $D6                   ; 5
L9B02:
    jmp    L9CEC                 ; 3

L9B05:
    lda    $E3                   ; 3
    bpl    L9B0D                 ; 2³
    cmp    #$E0                  ; 2
    bcc    L9B10                 ; 2³
L9B0D:
    jmp    L9B85                 ; 3

L9B10:
    lda    $DC                   ; 3
    and    #$03                  ; 2
    tay                          ; 2
    lda    L9FC0,Y               ; 4
    bit    $C1                   ; 3
    bne    L9B1F                 ; 2³
    jmp    L9B85                 ; 3

L9B1F:
    lda    L9B88,Y               ; 4   low
    sta    $B4                   ; 3
    lda    #$9B                  ; 2   high
    sta    $B5                   ; 3
    lda    #1                    ; 2
    ldy    $BD                   ; 3
    jmp.ind ($00B4)              ; 5

L9B2F:  ; indirect jump
    and    L9CC6,Y               ; 4
    beq    L9B85                 ; 2³
    dec    $E9                   ; 5
    jmp    L9B40                 ; 3

L9B39:  ; indirect jump
    and    L9CC6,Y               ; 4
    beq    L9B85                 ; 2³
    inc    $E9                   ; 5
L9B40:
    lda    #8                    ; 2
    eor    $E3                   ; 3
    sta    $E3                   ; 3
    and    #$08                  ; 2
    bne    L9B80                 ; 2³
    ldy    $F1                   ; 3
    iny                          ; 2
    bne    L9B80                 ; 2³
    sty    $F1                   ; 3
    beq    L9B80                 ; 2³
L9B53:  ; indirect jump
    and    L9CA6,Y               ; 4
    beq    L9B85                 ; 2³
    lda    $EF                   ; 3
    clc                          ; 2
    adc    #2                    ; 2
    sta    $EF                   ; 3
    bcc    L9B7D                 ; 2³
    lda    #$80                  ; 2
    ora    $DC                   ; 3
    sta    $DC                   ; 3
    bne    L9B7D                 ; 3   always branch

L9B69:  ; indirect jump
    and    L9CA6,Y               ; 4
    beq    L9B85                 ; 2³
    lda    $EF                   ; 3
    sec                          ; 2
    sbc    #2                    ; 2
    sta    $EF                   ; 3
    bcs    L9B7D                 ; 2³
    lda    $DC                   ; 3
    and    #$7F                  ; 2
    sta    $DC                   ; 3
L9B7D:
    jmp    L9B40                 ; 3

L9B80:
    jsr    L9E72                 ; 6
    ldx    #5                    ; 2
L9B85:
    jmp    L9AE3                 ; 3

L9B88:
    .byte <L9B69         ; $9B88
    .byte <L9B39         ; $9B89
    .byte <L9B53         ; $9B8A
    .byte <L9B2F         ; $9B8B

L9B8C:
    lda    $E3                   ; 3
    bmi    L9B93                 ; 2³
    jmp    L9C58                 ; 3

L9B93:
    cmp    #$E0                  ; 2
    bcs    L9B9A                 ; 2³
L9B97:
    jmp    L9CA0                 ; 3

L9B9A:
    lda    $E3                   ; 3
    cmp    #$E0                  ; 2
    bne    L9C06                 ; 2³+1
    lda    $E1                   ; 3
    and    #$40                  ; 2
    bne    L9B97                 ; 2³
    lda    #$49                  ; 2
    sta    $F2                   ; 3
    inc    $E3                   ; 5
    inc    $F4                   ; 5
    bne    L9BB6                 ; 2³
    lda    $FF                   ; 3
    ora    #$08                  ; 2
    sta    $FF                   ; 3
L9BB6:
    lda    $FF                   ; 3
    and    #$08                  ; 2
    beq    L9BC8                 ; 2³
    ldx    $F6                   ; 3
    lda    $F4                   ; 3
    cmp    L94F6,X               ; 4
    bne    L9BC8                 ; 2³
    jmp    L94E2                 ; 3

L9BC8:
    ldx    #2                    ; 2
    lda    #$24                  ; 2
    sta    $B2                   ; 3
    lda    $E9                   ; 3
    cmp    #$4A                  ; 2
    beq    L9C09                 ; 2³+1
    bcc    L9BDC                 ; 2³
    ldx    #$10                  ; 2
    lda    #$12                  ; 2
    sta    $B2                   ; 3
L9BDC:
    ldy    #1                    ; 2
    lda    $EF                   ; 3
    cmp    #$14                  ; 2
    beq    L9BE6                 ; 2³
    ldy    #$10                  ; 2
L9BE6:
    tya                          ; 2
    clc                          ; 2
    adc    $B2                   ; 3
    sta    $B2                   ; 3
L9BEC:
    lda    #$F0                  ; 2
    sta    $B3                   ; 3
    ldy    #$80                  ; 2
    lda    ($B2),Y               ; 5
    and    L9576,X               ; 4
    ldy    #0                    ; 2
    sta    ($B2),Y               ; 6
    ldy    #$B6                  ; 2
    lda    ($B2),Y               ; 5
    and    L9576,X               ; 4
    ldy    #$36                  ; 2
    sta    ($B2),Y               ; 6
L9C06:
    jmp    L9C21                 ; 3

L9C09:
    ldx    $F6                   ; 3
    ldy    L9FC4,X               ; 4
    lda    $DC                   ; 3
    rol                          ; 2
    lda    $EF                   ; 3
    lsr                          ; 2
    cmp    #$5A                  ; 2
    bcc    L9C1B                 ; 2³
    ldy    L9FCB,X               ; 4
L9C1B:
    ldx    #9                    ; 2
    sty    $B2                   ; 3
    bne    L9BEC                 ; 3+1   always branch

L9C21:
    lda    $F2                   ; 3
    cmp    #$49                  ; 2
    bcc    L9C2B                 ; 2³
    cmp    #$57                  ; 2
    bcc    L9C2F                 ; 2³
L9C2B:
    lda    #$49                  ; 2
    sta    $F2                   ; 3
L9C2F:
    lda    $FC                   ; 3
    pha                          ; 3
    and    #$04                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    adc    #$1A                  ; 2
    sta    $B4                   ; 3
    lda    $E2                   ; 3
    and    #$C0                  ; 2
    ora    $B4                   ; 3
    sta    $E2                   ; 3
    pla                          ; 4
    and    #$03                  ; 2
    bne    L9C55                 ; 2³
    inc    $E3                   ; 5
    bne    L9C55                 ; 2³
    lda    #0                    ; 2
    ldy    $D2                   ; 3
    beq    L9C53                 ; 2³
    lda    #9                    ; 2
L9C53:
    sta    $F2                   ; 3
L9C55:
    jmp    L9CA0                 ; 3

L9C58:
    bit    $E1                   ; 3
    bpl    L9CA5                 ; 2³
    clc                          ; 2
    lda    $FF                   ; 3
    and    #$08                  ; 2
    beq    L9C64                 ; 2³
    sec                          ; 2
L9C64:
    lda    $F4                   ; 3
    ror                          ; 2
    bcs    L9CA0                 ; 2³
    cmp    #$23                  ; 2
    beq    L9C79                 ; 2³
    cmp    #$46                  ; 2
    beq    L9C79                 ; 2³
    cmp    #$69                  ; 2
    beq    L9C79                 ; 2³
    cmp    #$8C                  ; 2
    bne    L9CA0                 ; 2³
L9C79:
    lda    #$50                  ; 2
    sta    $E9                   ; 3
    lda    #$8C                  ; 2
    sta    $EF                   ; 3
    lda    $FC                   ; 3
    and    #$03                  ; 2
    ora    #$1D                  ; 2
    sta    $DC                   ; 3
    lda    $F6                   ; 3
    bit    $FF                   ; 3
    bpl    L9C91                 ; 2³
    lda    #6                    ; 2
L9C91:
    clc                          ; 2
    adc    #$0C                  ; 2
    sta    $E2                   ; 3
    lda    $FC                   ; 3
    and    #$0C                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    ora    #$80                  ; 2
    sta    $E3                   ; 3
L9CA0:
    asl    $E1                   ; 5
    clc                          ; 2
    ror    $E1                   ; 5
L9CA5:
    rts                          ; 6

L9CA6:
    .byte $FB ; |XXXXX XX| $9CA6
    .byte $FC ; |XXXXXX  | $9CA7
    .byte $F8 ; |XXXXX   | $9CA8
    .byte $FC ; |XXXXXX  | $9CA9
    .byte $FC ; |XXXXXX  | $9CAA
    .byte $F9 ; |XXXXX  X| $9CAB
    .byte $FC ; |XXXXXX  | $9CAC
    .byte $FC ; |XXXXXX  | $9CAD
    .byte $F8 ; |XXXXX   | $9CAE
    .byte $FC ; |XXXXXX  | $9CAF
    .byte $FD ; |XXXXXX X| $9CB0
    .byte $F8 ; |XXXXX   | $9CB1
    .byte $FC ; |XXXXXX  | $9CB2
    .byte $FC ; |XXXXXX  | $9CB3
    .byte $F8 ; |XXXXX   | $9CB4
    .byte $FC ; |XXXXXX  | $9CB5
    .byte $00 ; |        | $9CB6
    .byte $00 ; |        | $9CB7
    .byte $00 ; |        | $9CB8
    .byte $80 ; |X       | $9CB9
    .byte $00 ; |        | $9CBA
    .byte $40 ; | X      | $9CBB
    .byte $00 ; |        | $9CBC
    .byte $A0 ; |X X     | $9CBD
    .byte $00 ; |        | $9CBE
    .byte $00 ; |        | $9CBF
    .byte $40 ; | X      | $9CC0
    .byte $80 ; |X       | $9CC1
    .byte $00 ; |        | $9CC2
    .byte $00 ; |        | $9CC3
    .byte $00 ; |        | $9CC4
    .byte $B0 ; |X XX    | $9CC5
L9CC6:
    .byte $BF ; |X XXXXXX| $9CC6
    .byte $F8 ; |XXXXX   | $9CC7
    .byte $FC ; |XXXXXX  | $9CC8
    .byte $F8 ; |XXXXX   | $9CC9
    .byte $FC ; |XXXXXX  | $9CCA
    .byte $F1 ; |XXXX   X| $9CCB
    .byte $FC ; |XXXXXX  | $9CCC
    .byte $C8 ; |XX  X   | $9CCD
    .byte $FC ; |XXXXXX  | $9CCE
    .byte $F8 ; |XXXXX   | $9CCF
    .byte $FD ; |XXXXXX X| $9CD0
    .byte $F0 ; |XXXX    | $9CD1
    .byte $FC ; |XXXXXX  | $9CD2
    .byte $F8 ; |XXXXX   | $9CD3
    .byte $FC ; |XXXXXX  | $9CD4
    .byte $C8 ; |XX  X   | $9CD5
    .byte $00 ; |        | $9CD6
    .byte $00 ; |        | $9CD7
    .byte $00 ; |        | $9CD8
    .byte $00 ; |        | $9CD9
    .byte $00 ; |        | $9CDA
    .byte $00 ; |        | $9CDB
    .byte $00 ; |        | $9CDC
    .byte $00 ; |        | $9CDD
    .byte $00 ; |        | $9CDE
    .byte $00 ; |        | $9CDF
    .byte $00 ; |        | $9CE0
    .byte $00 ; |        | $9CE1
    .byte $00 ; |        | $9CE2
    .byte $00 ; |        | $9CE3
    .byte $00 ; |        | $9CE4
    .byte $00 ; |        | $9CE5
L9CE6:
    .byte $80 ; |X       | $9CE6
    .byte $40 ; | X      | $9CE7
    .byte $20 ; |  X     | $9CE8
    .byte $10 ; |   X    | $9CE9
    .byte $08 ; |    X   | $9CEA
    .byte $04 ; |     X  | $9CEB

L9CEC:
    ldy    #0                    ; 2
    lda    $FF                   ; 3
    and    #$30                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
L9CF7:
    jsr    L9D1C                 ; 6
    inx                          ; 2
    cpx    #4                    ; 2
    bne    L9CF7                 ; 2³
    tya                          ; 2
    bne    L9D08                 ; 2³
    lda    #3                    ; 2
    sta    $A1                   ; 3
    bne    L9D0F                 ; 3   always branch

L9D08:
    dec    $A1                   ; 5
    bpl    L9D0F                 ; 2³
    jmp    L9DA4                 ; 3

L9D0F:
    lda    $E3                   ; 3
    bpl    L9D1B                 ; 2³
    cmp    #$E0                  ; 2
    bcs    L9D1B                 ; 2³
    inx                          ; 2
    jsr    L9D1C                 ; 6
L9D1B:
    rts                          ; 6

L9D1C:
    lda    $E4,X                 ; 4
    sec                          ; 2
    sbc    $E8                   ; 3
    bcs    L9D27                 ; 2³
    eor    #$FF                  ; 2
    adc    #1                    ; 2
L9D27:
    cmp    #4                    ; 2
    bcs    L9D1B                 ; 2³
    lda    $EA,X                 ; 4
    sec                          ; 2
    sbc    $EE                   ; 3
    bcs    L9D36                 ; 2³
    eor    #$FF                  ; 2
    adc    #1                    ; 2
L9D36:
    cmp    #7                    ; 2
    bcs    L9D1B                 ; 2³
    lda    $D7,X                 ; 4
    eor    $DB                   ; 3
    and    #$80                  ; 2
    bne    L9D1B                 ; 2³
    cpx    #5                    ; 2
    beq    L9DB3                 ; 2³
    lda    $DD,X                 ; 4
    and    #$80                  ; 2
    bne    L9D1B                 ; 2³
    lda    $D7,X                 ; 4
    and    #$40                  ; 2
    bne    L9D54                 ; 2³
    iny                          ; 2
    rts                          ; 6

L9D54:
    lda    $DD,X                 ; 4
    ora    #$80                  ; 2
    sta    $DD,X                 ; 4
    lda    $D7,X                 ; 4
    and    #$A3                  ; 2
    sta    $D7,X                 ; 4
    lda    $F5                   ; 3
    and    #$03                  ; 2
    tay                          ; 2
    lda    L9DA0,Y               ; 4
    stx    $B5                   ; 3
    jsr    L9E07                 ; 6
    ldx    $B5                   ; 3
    lda    #$57                  ; 2
    sta    $F2                   ; 3
    lda    #$20                  ; 2
    sta    $D5                   ; 3
    lda    #4                    ; 2
    sta    $F3                   ; 3
    lda    $F5                   ; 3
    and    #$03                  ; 2
    clc                          ; 2
    adc    #1                    ; 2
    sta    $B2                   ; 3
    lda    $FF                   ; 3
    and    #$30                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    adc    $B2                   ; 3
    cmp    #4                    ; 2
    bcs    L9D96                 ; 2³
    inc    $F5                   ; 5
    bne    L9D9A                 ; 2³
L9D96:
    lda    #1                    ; 2
    sta    $D2                   ; 3
L9D9A:
    ldx    #$CF                  ; 2
    txs                          ; 2
    jmp    L921B                 ; 3

L9DA0:
    ora    COLUP0                ; 3
    ora    #$0B                  ; 2
L9DA4:
    lda    #5                    ; 2
    sta    $F3                   ; 3
    lda    #$20                  ; 2
    sta    $D5                   ; 3
    lda    #$FF                  ; 2
    sta    $F1                   ; 3
    sta    $F2                   ; 3
    rts                          ; 6

L9DB3:
    lda    #0                    ; 2
    sta    $E3                   ; 3
    ldx    $F6                   ; 3
    bit    $FF                   ; 3
    bpl    L9DBF                 ; 2³
    ldx    #6                    ; 2
L9DBF:
    lda    L9DC6,X               ; 4
    jsr    L9E07                 ; 6
    rts                          ; 6

L9DC6:
    .byte $03 ; |      XX| $9DC6
    .byte $04 ; |     X  | $9DC7
    .byte $07 ; |     XXX| $9DC8
    .byte $08 ; |    X   | $9DC9
    .byte $0A ; |    X X | $9DCA
    .byte $0C ; |    XX  | $9DCB
    .byte $0D ; |    XX X| $9DCC
L9DCD:
    .byte $04 ; |     X  | $9DCD
    .byte $04 ; |     X  | $9DCE
    .byte $21 ; |  X    X| $9DCF
    .byte $21 ; |  X    X| $9DD0
L9DD1:
    .byte $05 ; |     X X| $9DD1
    .byte $50 ; | X X    | $9DD2
    .byte $05 ; |     X X| $9DD3
    .byte $50 ; | X X    | $9DD4

L9DD5:
    ldy    $D2                   ; 3
    beq    L9E06                 ; 2³+1
    lda    $FC                   ; 3
    lsr                          ; 2
    bcc    L9E06                 ; 2³+1
    dey                          ; 2
    beq    L9DE5                 ; 2³
    sty    $D2                   ; 3
    bne    L9E06                 ; 3+1   always branch

L9DE5:
    sty    $D2                   ; 3
    sty    $F2                   ; 3
    ldy    #3                    ; 2
L9DEB:
    lda.wy $DD,Y                 ; 4
    asl                          ; 2
    bcs    L9DFB                 ; 2³
    lda.wy $D7,Y                 ; 4
    and    #$A3                  ; 2
    ora    #$10                  ; 2
    sta.wy $D7,Y                 ; 5
L9DFB:
    dey                          ; 2
    bpl    L9DEB                 ; 2³
    lda    $DB                   ; 3
    and    #$E3                  ; 2
    ora    #$08                  ; 2
    sta    $DB                   ; 3
L9E06:
    rts                          ; 6

L9E07:
    bit    $F8                   ; 3
    bmi    L9E55                 ; 2³
    tax                          ; 2
    sed                          ; 2
    cmp    #3                    ; 2
    clc                          ; 2
    bpl    L9E1D                 ; 2³
    lda    $F9                   ; 3
    adc    L9E56,X               ; 4
    sta    $F9                   ; 3
    lda    #0                    ; 2
    beq    L9E20                 ; 3   always branch

L9E1D:
    lda    L9E56,X               ; 4
L9E20:
    adc    $FA                   ; 3
    sta    $FA                   ; 3
    lda    $FB                   ; 3
    adc    #0                    ; 2
    sta    $FB                   ; 3
    cld                          ; 2
    lda    $FB                   ; 3
    and    #$0F                  ; 2
    beq    L9E47                 ; 2³
    lda    $FA                   ; 3
    cmp    #$50                  ; 2
    bcc    L9E47                 ; 2³
    lda    #4                    ; 2
    bit    $FF                   ; 3
    bne    L9E47                 ; 2³
    inc    $FF                   ; 5
    ora    $FF                   ; 3
    sta    $FF                   ; 3
    lda    #$34                  ; 2
    bne    L9E53                 ; 3   always branch

L9E47:
    lda    L9E64,X               ; 4
    ldx    $F1                   ; 3
    inx                          ; 2
    beq    L9E53                 ; 2³
    cmp    $F1                   ; 3
    bcc    L9E55                 ; 2³
L9E53:
    sta    $F1                   ; 3
L9E55:
    rts                          ; 6

L9E56:
    .byte $10 ; |   X    | $9E56
    .byte $50 ; | X X    | $9E57
    .byte $50 ; | X X    | $9E58
    .byte $01 ; |       X| $9E59
    .byte $02 ; |      X | $9E5A
    .byte $02 ; |      X | $9E5B
    .byte $04 ; |     X  | $9E5C
    .byte $05 ; |     X X| $9E5D
    .byte $07 ; |     XXX| $9E5E
    .byte $08 ; |    X   | $9E5F
    .byte $10 ; |   X    | $9E60
    .byte $16 ; |   X XX | $9E61
    .byte $20 ; |  X     | $9E62
    .byte $50 ; | X X    | $9E63
L9E64:
    .byte $04 ; |     X  | $9E64
    .byte $08 ; |    X   | $9E65
    .byte $08 ; |    X   | $9E66
    .byte $0E ; |    XXX | $9E67
    .byte $0E ; |    XXX | $9E68
    .byte $1F ; |   XXXXX| $9E69
    .byte $1F ; |   XXXXX| $9E6A
    .byte $0E ; |    XXX | $9E6B
    .byte $0E ; |    XXX | $9E6C
    .byte $1F ; |   XXXXX| $9E6D
    .byte $0E ; |    XXX | $9E6E
    .byte $1F ; |   XXXXX| $9E6F
    .byte $0E ; |    XXX | $9E70
    .byte $0E ; |    XXX | $9E71

L9E72:
    lda    $E2                   ; 3
    and    #$BF                  ; 2
    sta    $E2                   ; 3
    lda    $E9                   ; 3
    lsr                          ; 2
    bcs    L9EBC                 ; 2³
    jsr    L9530                 ; 6
    bcs    L9EBC                 ; 2³
    lda    $DC                   ; 3
    rol                          ; 2
    lda    $EF                   ; 3
    ror                          ; 2
    bcs    L9EBC                 ; 2³
    lsr                          ; 2
    bcs    L9EBC                 ; 2³
    tay                          ; 2
    lda    L9F5A,Y               ; 4
    bmi    L9EBC                 ; 2³
    sta    $B2                   ; 3
    lda    #$F0                  ; 2
    sta    $B3                   ; 3
    lda    L9550,X               ; 4
    clc                          ; 2
    adc    $B2                   ; 3
    sta    $B2                   ; 3
    ldy    #$80                  ; 2
    lda    ($B2),Y               ; 5
    and    L9563,X               ; 4
    beq    L9EBC                 ; 2³
    ldy    #$B6                  ; 2
    lda    ($B2),Y               ; 5
    ora    L9563,X               ; 4
    ldy    #$36                  ; 2
    sta    ($B2),Y               ; 6
    lda    $E2                   ; 3
    ora    #$40                  ; 2
    sta    $E2                   ; 3
    rts                          ; 6

L9EBC:
    lda    $EF                   ; 3
    clc                          ; 2
    adc    #$0A                  ; 2
    bcs    L9EC8                 ; 2³
    pha                          ; 3
    lda    $DC                   ; 3
    rol                          ; 2
    pla                          ; 4
L9EC8:
    ror                          ; 2
    bcs    L9F42                 ; 2³+1
    lsr                          ; 2
    bcs    L9F42                 ; 2³+1
    tay                          ; 2
    lda    L9F5A,Y               ; 4
    bmi    L9F42                 ; 2³+1
    tay                          ; 2
    clc                          ; 2
    lda    $E9                   ; 3
    adc    #1                    ; 2
    and    #$FC                  ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    L9255,X               ; 4
    bmi    L9F42                 ; 2³+1
    tax                          ; 2
    lda    L9517,X               ; 4
    bmi    L9F42                 ; 2³+1
    tax                          ; 2
    lda    SC_6C|READ,Y          ; 4
    and    L9522,X               ; 4
    beq    L9F42                 ; 2³+1
    txa                          ; 2
    cpx    #3                    ; 2
    bcs    L9F1D                 ; 2³+1
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $BE                   ; 3
    lda    SC_00|READ,Y          ; 4
    and    #$07                  ; 2
    clc                          ; 2
    adc    $BE                   ; 3
    sty    $BE                   ; 3
    tay                          ; 2
    lda    L94FD,Y               ; 4
    bmi    L9F42                 ; 2³
    ldy    $BE                   ; 3
    and    #$0F                  ; 2
    sta    $BE                   ; 3
    lda    SC_00|READ,Y          ; 4
    and    #$F0                  ; 2
    ora    $BE                   ; 3
    sta    SC_00,Y               ; 5
    rts                          ; 6

L9F1D:
    lda    L9512,X               ; 4
    sta    $BE                   ; 3
    lda    SC_36|READ,Y          ; 4
    and    #$07                  ; 2
    clc                          ; 2
    adc    $BE                   ; 3
    sty    $BE                   ; 3
    tay                          ; 2
    lda    L94FD,Y               ; 4
    bmi    L9F42                 ; 2³
    ldy    $BE                   ; 3
    and    #$0F                  ; 2
    sta    $BE                   ; 3
    lda    SC_36|READ,Y          ; 4
    and    #$F0                  ; 2
    ora    $BE                   ; 3
    sta    SC_36,Y               ; 5
L9F42:
    rts                          ; 6

L9F43:
    lda    L9563,X               ; 4
    ora    SC_12|READ,Y          ; 4
    sta    SC_12,Y               ; 5
    lda    SC_48|READ,Y          ; 4
    ora    L9563,X               ; 4
    sta    SC_48,Y               ; 5
    rts                          ; 6

L9F56:
    .byte $05 ; |     X X| $9F56
    .byte $0A ; |    X X | $9F57
    .byte $05 ; |     X X| $9F58
    .byte $0A ; |    X X | $9F59
L9F5A:
    .byte $00 ; |        | $9F5A
    .byte $80 ; |X       | $9F5B
    .byte $80 ; |X       | $9F5C
    .byte $80 ; |X       | $9F5D
    .byte $80 ; |X       | $9F5E
    .byte $01 ; |       X| $9F5F
    .byte $80 ; |X       | $9F60
    .byte $80 ; |X       | $9F61
    .byte $80 ; |X       | $9F62
    .byte $80 ; |X       | $9F63
    .byte $02 ; |      X | $9F64
    .byte $80 ; |X       | $9F65
    .byte $80 ; |X       | $9F66
    .byte $80 ; |X       | $9F67
    .byte $80 ; |X       | $9F68
    .byte $03 ; |      XX| $9F69
    .byte $80 ; |X       | $9F6A
    .byte $80 ; |X       | $9F6B
    .byte $80 ; |X       | $9F6C
    .byte $80 ; |X       | $9F6D
    .byte $04 ; |     X  | $9F6E
    .byte $80 ; |X       | $9F6F
    .byte $80 ; |X       | $9F70
    .byte $80 ; |X       | $9F71
    .byte $80 ; |X       | $9F72
    .byte $05 ; |     X X| $9F73
    .byte $80 ; |X       | $9F74
    .byte $80 ; |X       | $9F75
    .byte $80 ; |X       | $9F76
    .byte $80 ; |X       | $9F77
    .byte $06 ; |     XX | $9F78
    .byte $80 ; |X       | $9F79
    .byte $80 ; |X       | $9F7A
    .byte $80 ; |X       | $9F7B
    .byte $80 ; |X       | $9F7C
    .byte $07 ; |     XXX| $9F7D
    .byte $80 ; |X       | $9F7E
    .byte $80 ; |X       | $9F7F
    .byte $80 ; |X       | $9F80
    .byte $80 ; |X       | $9F81
    .byte $08 ; |    X   | $9F82
    .byte $80 ; |X       | $9F83
    .byte $80 ; |X       | $9F84
    .byte $80 ; |X       | $9F85
    .byte $80 ; |X       | $9F86
    .byte $09 ; |    X  X| $9F87
    .byte $80 ; |X       | $9F88
    .byte $80 ; |X       | $9F89
    .byte $80 ; |X       | $9F8A
    .byte $80 ; |X       | $9F8B
    .byte $0A ; |    X X | $9F8C
    .byte $80 ; |X       | $9F8D
    .byte $80 ; |X       | $9F8E
    .byte $80 ; |X       | $9F8F
    .byte $80 ; |X       | $9F90
    .byte $0B ; |    X XX| $9F91
    .byte $80 ; |X       | $9F92
    .byte $80 ; |X       | $9F93
    .byte $80 ; |X       | $9F94
    .byte $80 ; |X       | $9F95
    .byte $0C ; |    XX  | $9F96
    .byte $80 ; |X       | $9F97
    .byte $80 ; |X       | $9F98
    .byte $80 ; |X       | $9F99
    .byte $80 ; |X       | $9F9A
    .byte $0D ; |    XX X| $9F9B
    .byte $80 ; |X       | $9F9C
    .byte $80 ; |X       | $9F9D
    .byte $80 ; |X       | $9F9E
    .byte $80 ; |X       | $9F9F
    .byte $0E ; |    XXX | $9FA0
    .byte $80 ; |X       | $9FA1
    .byte $80 ; |X       | $9FA2
    .byte $80 ; |X       | $9FA3
    .byte $80 ; |X       | $9FA4
    .byte $0F ; |    XXXX| $9FA5
    .byte $80 ; |X       | $9FA6
    .byte $80 ; |X       | $9FA7
    .byte $80 ; |X       | $9FA8
    .byte $80 ; |X       | $9FA9
    .byte $10 ; |   X    | $9FAA
    .byte $80 ; |X       | $9FAB
    .byte $80 ; |X       | $9FAC
    .byte $80 ; |X       | $9FAD
    .byte $80 ; |X       | $9FAE
    .byte $11 ; |   X   X| $9FAF
    
;mathematically possible combinations
;  0000xxxx   Y = $00   right,left,down,up
;  0001xxxx   Y = $01   right,left,down
;  0010xxxx   Y = $02   right,left,up
;  0011xxxx   Y = $03   right,left
;  0100xxxx   Y = $04   right,down,up
;  0101xxxx   Y = $05   right,down
;  0110xxxx   Y = $06   right,up
;  0111xxxx   Y = $07   right
;  1000xxxx   Y = $08   left,down,up
;  1001xxxx   Y = $09   left,down
;  1010xxxx   Y = $0A   left,up
;  1011xxxx   Y = $0B   left
;  1100xxxx   Y = $0C   up,down
;  1101xxxx   Y = $0D   down
;  1110xxxx   Y = $0E   up
;  1111xxxx   Y = $0F   none
    
L9FB0:
    .byte $80 ; |X       | $9FB0   invalid           direction table
    .byte $80 ; |X       | $9FB1   invalid
    .byte $80 ; |X       | $9FB2   invalid
    .byte $80 ; |X       | $9FB3   invalid
    .byte $80 ; |X       | $9FB4   invalid
    .byte $01 ; |       X| $9FB5
    .byte $00 ; |        | $9FB6
    .byte $01 ; |       X| $9FB7
    .byte $80 ; |X       | $9FB8   invalid
    .byte $02 ; |      X | $9FB9
    .byte $03 ; |      XX| $9FBA
    .byte $03 ; |      XX| $9FBB
    .byte $80 ; |X       | $9FBC   invalid
    .byte $02 ; |      X | $9FBD
    .byte $00 ; |        | $9FBE
    .byte $80 ; |X       | $9FBF   invalid
L9FC0:
    .byte $01 ; |       X| $9FC0
    .byte $02 ; |      X | $9FC1
    .byte $04 ; |     X  | $9FC2
    .byte $08 ; |    X   | $9FC3
L9FC4:
    .byte $17 ; |   X XXX| $9FC4
    .byte $16 ; |   X XX | $9FC5
    .byte $17 ; |   X XXX| $9FC6
    .byte $17 ; |   X XXX| $9FC7
    .byte $17 ; |   X XXX| $9FC8
    .byte $17 ; |   X XXX| $9FC9
    .byte $18 ; |   XX   | $9FCA
L9FCB:
    .byte $1D ; |   XXX X| $9FCB
    .byte $1D ; |   XXX X| $9FCC
    .byte $1D ; |   XXX X| $9FCD
    .byte $1E ; |   XXXX | $9FCE
    .byte $1D ; |   XXX X| $9FCF
    .byte $1C ; |   XXX  | $9FD0
    .byte $1C ; |   XXX  | $9FD1
    .byte $FF ; |XXXXXXXX| $9FD2
    .byte $FF ; |XXXXXXXX| $9FD3
    .byte $FF ; |XXXXXXXX| $9FD4
    .byte $FF ; |XXXXXXXX| $9FD5
    .byte $FF ; |XXXXXXXX| $9FD6
    .byte $FF ; |XXXXXXXX| $9FD7
    .byte $FF ; |XXXXXXXX| $9FD8
    .byte $FF ; |XXXXXXXX| $9FD9
    .byte $FF ; |XXXXXXXX| $9FDA
    .byte $FF ; |XXXXXXXX| $9FDB
    .byte $FF ; |XXXXXXXX| $9FDC
    .byte $FF ; |XXXXXXXX| $9FDD
    .byte $FF ; |XXXXXXXX| $9FDE
    .byte $FF ; |XXXXXXXX| $9FDF
    .byte $FF ; |XXXXXXXX| $9FE0

L9FE1:
    sta    BANK_3                ; 4

    .byte $FF ; |XXXXXXXX| $9FE4
    .byte $FF ; |XXXXXXXX| $9FE5
    .byte $FF ; |XXXXXXXX| $9FE6

L9FE7:
    sta    BANK_3                ; 4

L9FEA:
    jmp    L9589                 ; 3

    .byte $FF ; |XXXXXXXX| $9FED
    .byte $FF ; |XXXXXXXX| $9FEE
    .byte $FF ; |XXXXXXXX| $9FEF

L9FF0:
    jmp    L9103                 ; 3

    .byte $FF ; |XXXXXXXX| $9FF3
    .byte $FF ; |XXXXXXXX| $9FF4
    .byte $FF ; |XXXXXXXX| $9FF5

    .byte $FF ; |XXXXXXXX| $9FF6
    .byte $FF ; |XXXXXXXX| $9FF7
    .byte $FF ; |XXXXXXXX| $9FF8
    .byte $00 ; |        | $9FF9

    .byte $FF ; |XXXXXXXX| $9FFA
    .byte $FF ; |XXXXXXXX| $9FFB

       ORG $1FFC
      RORG $9FFC

    .word START_BANK_0
    .word START_BANK_0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 1
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $2000
      RORG $B000

    FILLED_SPACE 256             ; superchip ram space

LB100:
    .byte $00 ; |        | $B100
    .byte $00 ; |        | $B101
    .byte $00 ; |        | $B102
    .byte $00 ; |        | $B103
    .byte $00 ; |        | $B104
    .byte $00 ; |        | $B105
    .byte $00 ; |        | $B106
    .byte $00 ; |        | $B107
    .byte $00 ; |        | $B108
    .byte $00 ; |        | $B109
    .byte $00 ; |        | $B10A
    .byte $00 ; |        | $B10B
    .byte $00 ; |        | $B10C
    .byte $00 ; |        | $B10D
    .byte $00 ; |        | $B10E
    .byte $00 ; |        | $B10F
    .byte $00 ; |        | $B110
    .byte $00 ; |        | $B111
    .byte $00 ; |        | $B112
    .byte $00 ; |        | $B113
    .byte $00 ; |        | $B114
    .byte $00 ; |        | $B115
    .byte $00 ; |        | $B116
    .byte $00 ; |        | $B117
    .byte $00 ; |        | $B118
    .byte $00 ; |        | $B119
    .byte $44 ; | X   X  | $B11A
    .byte $EE ; |XXX XXX | $B11B
    .byte $EE ; |XXX XXX | $B11C
    .byte $AA ; |X X X X | $B11D
    .byte $AA ; |X X X X | $B11E
    .byte $EE ; |XXX XXX | $B11F
    .byte $44 ; | X   X  | $B120
    .byte $00 ; |        | $B121
    .byte $00 ; |        | $B122
    .byte $00 ; |        | $B123
    .byte $00 ; |        | $B124
    .byte $00 ; |        | $B125
    .byte $00 ; |        | $B126
    .byte $00 ; |        | $B127
    .byte $00 ; |        | $B128
    .byte $00 ; |        | $B129
    .byte $00 ; |        | $B12A
    .byte $00 ; |        | $B12B
    .byte $00 ; |        | $B12C
    .byte $00 ; |        | $B12D
    .byte $00 ; |        | $B12E
    .byte $00 ; |        | $B12F
    .byte $00 ; |        | $B130
    .byte $5E ; | X XXXX | $B131
    .byte $B3 ; |X XX  XX| $B132
    .byte $A1 ; |X X    X| $B133
    .byte $AD ; |X X XX X| $B134
    .byte $69 ; | XX X  X| $B135
    .byte $29 ; |  X X  X| $B136
    .byte $1B ; |   XX XX| $B137
    .byte $2E ; |  X XXX | $B138
    .byte $74 ; | XXX X  | $B139
    .byte $04 ; |     X  | $B13A
    .byte $0E ; |    XXX | $B13B
    .byte $3B ; |  XXX XX| $B13C
    .byte $00 ; |        | $B13D
    .byte $00 ; |        | $B13E
    .byte $00 ; |        | $B13F
    .byte $00 ; |        | $B140
    .byte $00 ; |        | $B141
    .byte $00 ; |        | $B142
    .byte $00 ; |        | $B143
    .byte $00 ; |        | $B144
    .byte $00 ; |        | $B145
    .byte $00 ; |        | $B146
    .byte $00 ; |        | $B147
    .byte $00 ; |        | $B148
    .byte $00 ; |        | $B149
    .byte $00 ; |        | $B14A
    .byte $7C ; | XXXXX  | $B14B
    .byte $7C ; | XXXXX  | $B14C
    .byte $56 ; | X X XX | $B14D
    .byte $55 ; | X X X X| $B14E
    .byte $55 ; | X X X X| $B14F
    .byte $F5 ; |XXXX X X| $B150
    .byte $D5 ; |XX X X X| $B151
    .byte $75 ; | XXX X X| $B152
    .byte $F7 ; |XXXX XXX| $B153
    .byte $FC ; |XXXXXX  | $B154
    .byte $7C ; | XXXXX  | $B155
    .byte $78 ; | XXXX   | $B156
    .byte $00 ; |        | $B157
    .byte $00 ; |        | $B158
    .byte $00 ; |        | $B159
    .byte $00 ; |        | $B15A
    .byte $00 ; |        | $B15B
    .byte $00 ; |        | $B15C
    .byte $00 ; |        | $B15D
    .byte $00 ; |        | $B15E
    .byte $00 ; |        | $B15F
    .byte $00 ; |        | $B160
    .byte $00 ; |        | $B161
    .byte $00 ; |        | $B162
    .byte $00 ; |        | $B163
    .byte $00 ; |        | $B164
    .byte $C0 ; |XX      | $B165
    .byte $A4 ; |X X  X  | $B166
    .byte $9A ; |X  XX X | $B167
    .byte $C2 ; |XX    X | $B168
    .byte $E3 ; |XXX   XX| $B169
    .byte $F0 ; |XXXX    | $B16A
    .byte $F8 ; |XXXXX   | $B16B
    .byte $FC ; |XXXXXX  | $B16C
    .byte $FC ; |XXXXXX  | $B16D
    .byte $78 ; | XXXX   | $B16E
    .byte $30 ; |  XX    | $B16F
    .byte $10 ; |   X    | $B170
    .byte $00 ; |        | $B171
    .byte $00 ; |        | $B172
    .byte $00 ; |        | $B173
    .byte $00 ; |        | $B174
    .byte $00 ; |        | $B175
    .byte $00 ; |        | $B176
    .byte $00 ; |        | $B177
    .byte $00 ; |        | $B178
    .byte $00 ; |        | $B179
    .byte $00 ; |        | $B17A
    .byte $00 ; |        | $B17B
    .byte $00 ; |        | $B17C
    .byte $00 ; |        | $B17D
    .byte $00 ; |        | $B17E
    .byte $36 ; |  XX XX | $B17F
    .byte $DB ; |XX XX XX| $B180
    .byte $7E ; | XXXXXX | $B181
    .byte $FE ; |XXXXXXX | $B182
    .byte $FF ; |XXXXXXXX| $B183
    .byte $FE ; |XXXXXXX | $B184
    .byte $FE ; |XXXXXXX | $B185
    .byte $E6 ; |XXX  XX | $B186
    .byte $A6 ; |X X  XX | $B187
    .byte $AF ; |X X XXXX| $B188
    .byte $A6 ; |X X  XX | $B189
    .byte $F0 ; |XXXX    | $B18A
    .byte $00 ; |        | $B18B
    .byte $00 ; |        | $B18C
    .byte $00 ; |        | $B18D
    .byte $00 ; |        | $B18E
    .byte $00 ; |        | $B18F
    .byte $00 ; |        | $B190
    .byte $00 ; |        | $B191
    .byte $00 ; |        | $B192
    .byte $00 ; |        | $B193
    .byte $00 ; |        | $B194
    .byte $00 ; |        | $B195
    .byte $00 ; |        | $B196
    .byte $00 ; |        | $B197
    .byte $00 ; |        | $B198
    .byte $42 ; | X    X | $B199
    .byte $A0 ; |X X     | $B19A
    .byte $92 ; |X  X  X | $B19B
    .byte $8C ; |X   XX  | $B19C
    .byte $80 ; |X       | $B19D
    .byte $40 ; | X      | $B19E
    .byte $70 ; | XXX    | $B19F
    .byte $F8 ; |XXXXX   | $B1A0
    .byte $F8 ; |XXXXX   | $B1A1
    .byte $F8 ; |XXXXX   | $B1A2
    .byte $F8 ; |XXXXX   | $B1A3
    .byte $70 ; | XXX    | $B1A4
    .byte $00 ; |        | $B1A5
    .byte $00 ; |        | $B1A6
    .byte $00 ; |        | $B1A7
    .byte $00 ; |        | $B1A8
    .byte $00 ; |        | $B1A9
    .byte $00 ; |        | $B1AA
    .byte $00 ; |        | $B1AB
    .byte $00 ; |        | $B1AC
    .byte $00 ; |        | $B1AD
    .byte $00 ; |        | $B1AE
    .byte $00 ; |        | $B1AF
    .byte $00 ; |        | $B1B0
    .byte $00 ; |        | $B1B1
    .byte $00 ; |        | $B1B2
    .byte $CC ; |XX  XX  | $B1B3
    .byte $B3 ; |X XX  XX| $B1B4
    .byte $AA ; |X X X X | $B1B5
    .byte $BA ; |X XXX X | $B1B6
    .byte $FE ; |XXXXXXX | $B1B7
    .byte $FE ; |XXXXXXX | $B1B8
    .byte $FE ; |XXXXXXX | $B1B9
    .byte $CE ; |XX  XXX | $B1BA
    .byte $87 ; |X    XXX| $B1BB
    .byte $C7 ; |XX   XXX| $B1BC
    .byte $27 ; |  X  XXX| $B1BD
    .byte $25 ; |  X  X X| $B1BE
    .byte $00 ; |        | $B1BF
    .byte $00 ; |        | $B1C0
    .byte $00 ; |        | $B1C1
    .byte $00 ; |        | $B1C2
    .byte $00 ; |        | $B1C3
    .byte $00 ; |        | $B1C4
    .byte $00 ; |        | $B1C5
    .byte $00 ; |        | $B1C6
    .byte $00 ; |        | $B1C7
    .byte $00 ; |        | $B1C8
    .byte $00 ; |        | $B1C9
    .byte $00 ; |        | $B1CA
    .byte $00 ; |        | $B1CB
    .byte $00 ; |        | $B1CC
    .byte $7C ; | XXXXX  | $B1CD
    .byte $EE ; |XXX XXX | $B1CE
    .byte $AB ; |X X X XX| $B1CF
    .byte $AB ; |X X X XX| $B1D0
    .byte $AB ; |X X X XX| $B1D1
    .byte $AB ; |X X X XX| $B1D2
    .byte $BB ; |X XXX XX| $B1D3
    .byte $FF ; |XXXXXXXX| $B1D4
    .byte $D7 ; |XX X XXX| $B1D5
    .byte $BB ; |X XXX XX| $B1D6
    .byte $7C ; | XXXXX  | $B1D7
    .byte $81 ; |X      X| $B1D8
    .byte $00 ; |        | $B1D9
    .byte $00 ; |        | $B1DA
    .byte $00 ; |        | $B1DB
    .byte $00 ; |        | $B1DC
    .byte $00 ; |        | $B1DD
    .byte $00 ; |        | $B1DE
    .byte $00 ; |        | $B1DF
    .byte $00 ; |        | $B1E0
    .byte $00 ; |        | $B1E1
    .byte $00 ; |        | $B1E2
    .byte $00 ; |        | $B1E3
    .byte $00 ; |        | $B1E4
    .byte $00 ; |        | $B1E5
    .byte $00 ; |        | $B1E6
    .byte $00 ; |        | $B1E7
    .byte $00 ; |        | $B1E8
    .byte $00 ; |        | $B1E9
    .byte $44 ; | X   X  | $B1EA
    .byte $EE ; |XXX XXX | $B1EB
    .byte $AA ; |X X X X | $B1EC
    .byte $AA ; |X X X X | $B1ED
    .byte $EE ; |XXX XXX | $B1EE
    .byte $EE ; |XXX XXX | $B1EF
    .byte $44 ; | X   X  | $B1F0
    .byte $00 ; |        | $B1F1
    .byte $00 ; |        | $B1F2
    .byte $00 ; |        | $B1F3
    .byte $00 ; |        | $B1F4
    .byte $00 ; |        | $B1F5
    .byte $00 ; |        | $B1F6
    .byte $00 ; |        | $B1F7
    .byte $00 ; |        | $B1F8
    .byte $00 ; |        | $B1F9
    .byte $00 ; |        | $B1FA
    .byte $00 ; |        | $B1FB
    .byte $00 ; |        | $B1FC
    .byte $00 ; |        | $B1FD
    .byte $00 ; |        | $B1FE
    .byte $00 ; |        | $B1FF
    .byte $00 ; |        | $B200
    .byte $00 ; |        | $B201
    .byte $00 ; |        | $B202
    .byte $00 ; |        | $B203
    .byte $00 ; |        | $B204
    .byte $00 ; |        | $B205
    .byte $00 ; |        | $B206
    .byte $00 ; |        | $B207
    .byte $00 ; |        | $B208
    .byte $00 ; |        | $B209
    .byte $00 ; |        | $B20A
    .byte $00 ; |        | $B20B
    .byte $00 ; |        | $B20C
    .byte $00 ; |        | $B20D
    .byte $00 ; |        | $B20E
    .byte $00 ; |        | $B20F
    .byte $00 ; |        | $B210
    .byte $00 ; |        | $B211
    .byte $00 ; |        | $B212
    .byte $00 ; |        | $B213
    .byte $00 ; |        | $B214
    .byte $00 ; |        | $B215
    .byte $00 ; |        | $B216
    .byte $28 ; |  X X   | $B217
    .byte $5A ; | X XX X | $B218
    .byte $4F ; | X  XXXX| $B219
    .byte $3E ; |  XXXXX | $B21A
    .byte $27 ; |  X  XXX| $B21B
    .byte $7A ; | XXXX X | $B21C
    .byte $5E ; | X XXXX | $B21D
    .byte $69 ; | XX X  X| $B21E
    .byte $2E ; |  X XXX | $B21F
    .byte $1C ; |   XXX  | $B220
    .byte $00 ; |        | $B221
    .byte $00 ; |        | $B222
    .byte $00 ; |        | $B223
    .byte $00 ; |        | $B224
    .byte $00 ; |        | $B225
    .byte $00 ; |        | $B226
    .byte $00 ; |        | $B227
    .byte $00 ; |        | $B228
    .byte $00 ; |        | $B229
    .byte $00 ; |        | $B22A
    .byte $00 ; |        | $B22B
    .byte $00 ; |        | $B22C
    .byte $00 ; |        | $B22D
    .byte $00 ; |        | $B22E
    .byte $00 ; |        | $B22F
    .byte $10 ; |   X    | $B230
    .byte $10 ; |   X    | $B231
    .byte $10 ; |   X    | $B232
    .byte $92 ; |X  X  X | $B233
    .byte $44 ; | X   X  | $B234
    .byte $00 ; |        | $B235
    .byte $83 ; |X     XX| $B236
    .byte $7C ; | XXXXX  | $B237
    .byte $7C ; | XXXXX  | $B238
    .byte $38 ; |  XXX   | $B239
    .byte $10 ; |   X    | $B23A
    .byte $10 ; |   X    | $B23B
    .byte $EE ; |XXX XXX | $B23C
    .byte $44 ; | X   X  | $B23D
    .byte $00 ; |        | $B23E
    .byte $00 ; |        | $B23F
    .byte $00 ; |        | $B240
    .byte $00 ; |        | $B241
    .byte $00 ; |        | $B242
    .byte $00 ; |        | $B243
    .byte $00 ; |        | $B244
    .byte $00 ; |        | $B245
    .byte $00 ; |        | $B246
    .byte $00 ; |        | $B247
    .byte $00 ; |        | $B248
    .byte $00 ; |        | $B249
    .byte $00 ; |        | $B24A
    .byte $00 ; |        | $B24B
    .byte $00 ; |        | $B24C
    .byte $00 ; |        | $B24D
    .byte $04 ; |     X  | $B24E
    .byte $0C ; |    XX  | $B24F
    .byte $1C ; |   XXX  | $B250
    .byte $39 ; |  XXX  X| $B251
    .byte $7B ; | XXXX XX| $B252
    .byte $0F ; |    XXXX| $B253
    .byte $08 ; |    X   | $B254
    .byte $18 ; |   XX   | $B255
    .byte $38 ; |  XXX   | $B256
    .byte $00 ; |        | $B257
    .byte $00 ; |        | $B258
    .byte $00 ; |        | $B259
    .byte $00 ; |        | $B25A
    .byte $00 ; |        | $B25B
    .byte $00 ; |        | $B25C
    .byte $00 ; |        | $B25D
    .byte $00 ; |        | $B25E
    .byte $00 ; |        | $B25F
    .byte $00 ; |        | $B260
    .byte $00 ; |        | $B261
    .byte $00 ; |        | $B262
    .byte $00 ; |        | $B263
    .byte $34 ; |  XX X  | $B264
    .byte $7D ; | XXXXX X| $B265
    .byte $6F ; | XX XXXX| $B266
    .byte $42 ; | X    X | $B267
    .byte $C2 ; |XX    X | $B268
    .byte $81 ; |X      X| $B269
    .byte $49 ; | X  X  X| $B26A
    .byte $C3 ; |XX    XX| $B26B
    .byte $A3 ; |X X   XX| $B26C
    .byte $67 ; | XX  XXX| $B26D
    .byte $36 ; |  XX XX | $B26E
    .byte $6D ; | XX XX X| $B26F
    .byte $1A ; |   XX X | $B270
    .byte $00 ; |        | $B271
    .byte $00 ; |        | $B272
    .byte $00 ; |        | $B273
    .byte $00 ; |        | $B274
    .byte $00 ; |        | $B275
    .byte $00 ; |        | $B276
    .byte $00 ; |        | $B277
    .byte $00 ; |        | $B278
    .byte $00 ; |        | $B279
    .byte $00 ; |        | $B27A
    .byte $00 ; |        | $B27B
    .byte $00 ; |        | $B27C
    .byte $00 ; |        | $B27D
    .byte $3E ; |  XXXXX | $B27E
    .byte $3E ; |  XXXXX | $B27F
    .byte $1C ; |   XXX  | $B280
    .byte $08 ; |    X   | $B281
    .byte $08 ; |    X   | $B282
    .byte $77 ; | XXX XXX| $B283
    .byte $22 ; |  X   X | $B284
    .byte $00 ; |        | $B285
    .byte $00 ; |        | $B286
    .byte $00 ; |        | $B287
    .byte $00 ; |        | $B288
    .byte $00 ; |        | $B289
    .byte $00 ; |        | $B28A
    .byte $00 ; |        | $B28B
    .byte $00 ; |        | $B28C
    .byte $00 ; |        | $B28D
    .byte $00 ; |        | $B28E
    .byte $00 ; |        | $B28F
    .byte $00 ; |        | $B290
    .byte $00 ; |        | $B291
    .byte $00 ; |        | $B292
    .byte $00 ; |        | $B293
    .byte $00 ; |        | $B294
    .byte $00 ; |        | $B295
    .byte $00 ; |        | $B296
    .byte $00 ; |        | $B297
    .byte $1C ; |   XXX  | $B298
    .byte $38 ; |  XXX   | $B299
    .byte $30 ; |  XX    | $B29A
    .byte $30 ; |  XX    | $B29B
    .byte $38 ; |  XXX   | $B29C
    .byte $5C ; | X XXX  | $B29D
    .byte $6A ; | XX X X | $B29E
    .byte $36 ; |  XX XX | $B29F
    .byte $B8 ; |X XXX   | $B2A0
    .byte $FC ; |XXXXXX  | $B2A1
    .byte $E0 ; |XXX     | $B2A2
    .byte $30 ; |  XX    | $B2A3
    .byte $38 ; |  XXX   | $B2A4
    .byte $00 ; |        | $B2A5
    .byte $00 ; |        | $B2A6
    .byte $00 ; |        | $B2A7
    .byte $00 ; |        | $B2A8
    .byte $00 ; |        | $B2A9
    .byte $00 ; |        | $B2AA
    .byte $00 ; |        | $B2AB
    .byte $00 ; |        | $B2AC
    .byte $00 ; |        | $B2AD
    .byte $00 ; |        | $B2AE
    .byte $00 ; |        | $B2AF
    .byte $00 ; |        | $B2B0
    .byte $00 ; |        | $B2B1
    .byte $1C ; |   XXX  | $B2B2
    .byte $38 ; |  XXX   | $B2B3
    .byte $30 ; |  XX    | $B2B4
    .byte $30 ; |  XX    | $B2B5
    .byte $58 ; | X XX   | $B2B6
    .byte $64 ; | XX  X  | $B2B7
    .byte $34 ; |  XX X  | $B2B8
    .byte $B8 ; |X XXX   | $B2B9
    .byte $FC ; |XXXXXX  | $B2BA
    .byte $E0 ; |XXX     | $B2BB
    .byte $30 ; |  XX    | $B2BC
    .byte $38 ; |  XXX   | $B2BD
    .byte $00 ; |        | $B2BE
    .byte $00 ; |        | $B2BF
    .byte $00 ; |        | $B2C0
    .byte $00 ; |        | $B2C1
    .byte $00 ; |        | $B2C2
    .byte $00 ; |        | $B2C3
    .byte $00 ; |        | $B2C4
    .byte $00 ; |        | $B2C5
    .byte $00 ; |        | $B2C6
    .byte $00 ; |        | $B2C7
    .byte $00 ; |        | $B2C8
    .byte $00 ; |        | $B2C9
    .byte $00 ; |        | $B2CA
    .byte $00 ; |        | $B2CB
    .byte $1C ; |   XXX  | $B2CC
    .byte $3E ; |  XXXXX | $B2CD
    .byte $3F ; |  XXXXXX| $B2CE
    .byte $7F ; | XXXXXXX| $B2CF
    .byte $7F ; | XXXXXXX| $B2D0
    .byte $3F ; |  XXXXXX| $B2D1
    .byte $5B ; | X XX XX| $B2D2
    .byte $6B ; | XX X XX| $B2D3
    .byte $37 ; |  XX XXX| $B2D4
    .byte $3A ; |  XXX X | $B2D5
    .byte $3C ; |  XXXX  | $B2D6
    .byte $20 ; |  X     | $B2D7
    .byte $00 ; |        | $B2D8
    .byte $00 ; |        | $B2D9
    .byte $00 ; |        | $B2DA
    .byte $00 ; |        | $B2DB
    .byte $00 ; |        | $B2DC
    .byte $00 ; |        | $B2DD
    .byte $00 ; |        | $B2DE
    .byte $00 ; |        | $B2DF
    .byte $00 ; |        | $B2E0
    .byte $00 ; |        | $B2E1
    .byte $00 ; |        | $B2E2
    .byte $00 ; |        | $B2E3
    .byte $00 ; |        | $B2E4
    .byte $00 ; |        | $B2E5
    .byte $1E ; |   XXXX | $B2E6
    .byte $3E ; |  XXXXX | $B2E7
    .byte $3E ; |  XXXXX | $B2E8
    .byte $7C ; | XXXXX  | $B2E9
    .byte $70 ; | XXX    | $B2EA
    .byte $3C ; |  XXXX  | $B2EB
    .byte $5A ; | X XX X | $B2EC
    .byte $6B ; | XX X XX| $B2ED
    .byte $37 ; |  XX XXX| $B2EE
    .byte $3A ; |  XXX X | $B2EF
    .byte $7C ; | XXXXX  | $B2F0
    .byte $20 ; |  X     | $B2F1
    .byte $10 ; |   X    | $B2F2
    .byte $00 ; |        | $B2F3
    .byte $00 ; |        | $B2F4
    .byte $00 ; |        | $B2F5
    .byte $00 ; |        | $B2F6
    .byte $00 ; |        | $B2F7
    .byte $00 ; |        | $B2F8
    .byte $00 ; |        | $B2F9
    .byte $00 ; |        | $B2FA
    .byte $00 ; |        | $B2FB
    .byte $00 ; |        | $B2FC
    .byte $00 ; |        | $B2FD
    .byte $00 ; |        | $B2FE
    .byte $00 ; |        | $B2FF
    .byte $00 ; |        | $B300
    .byte $00 ; |        | $B301
    .byte $00 ; |        | $B302
    .byte $00 ; |        | $B303
    .byte $00 ; |        | $B304
    .byte $00 ; |        | $B305
    .byte $00 ; |        | $B306
    .byte $00 ; |        | $B307
    .byte $00 ; |        | $B308
    .byte $00 ; |        | $B309
    .byte $00 ; |        | $B30A
    .byte $00 ; |        | $B30B
    .byte $00 ; |        | $B30C
    .byte $00 ; |        | $B30D
    .byte $00 ; |        | $B30E
    .byte $00 ; |        | $B30F
    .byte $00 ; |        | $B310
    .byte $00 ; |        | $B311
    .byte $00 ; |        | $B312
    .byte $00 ; |        | $B313
    .byte $00 ; |        | $B314
    .byte $00 ; |        | $B315
    .byte $1E ; |   XXXX | $B316
    .byte $3C ; |  XXXX  | $B317
    .byte $38 ; |  XXX   | $B318
    .byte $70 ; | XXX    | $B319
    .byte $70 ; | XXX    | $B31A
    .byte $38 ; |  XXX   | $B31B
    .byte $5C ; | X XXX  | $B31C
    .byte $6A ; | XX X X | $B31D
    .byte $37 ; |  XX XXX| $B31E
    .byte $BA ; |X XXX X | $B31F
    .byte $FC ; |XXXXXX  | $B320
    .byte $20 ; |  X     | $B321
    .byte $10 ; |   X    | $B322
    .byte $18 ; |   XX   | $B323
    .byte $00 ; |        | $B324
    .byte $00 ; |        | $B325
    .byte $00 ; |        | $B326
    .byte $00 ; |        | $B327
    .byte $00 ; |        | $B328
    .byte $00 ; |        | $B329
    .byte $00 ; |        | $B32A
    .byte $00 ; |        | $B32B
    .byte $00 ; |        | $B32C
    .byte $00 ; |        | $B32D
    .byte $00 ; |        | $B32E
    .byte $00 ; |        | $B32F
    .byte $38 ; |  XXX   | $B330
    .byte $7C ; | XXXXX  | $B331
    .byte $FC ; |XXXXXX  | $B332
    .byte $FE ; |XXXXXXX | $B333
    .byte $FE ; |XXXXXXX | $B334
    .byte $FC ; |XXXXXX  | $B335
    .byte $DA ; |XX XX X | $B336
    .byte $D6 ; |XX X XX | $B337
    .byte $EC ; |XXX XX  | $B338
    .byte $5C ; | X XXX  | $B339
    .byte $3C ; |  XXXX  | $B33A
    .byte $04 ; |     X  | $B33B
    .byte $00 ; |        | $B33C
    .byte $00 ; |        | $B33D
    .byte $00 ; |        | $B33E
    .byte $00 ; |        | $B33F
    .byte $00 ; |        | $B340
    .byte $00 ; |        | $B341
    .byte $00 ; |        | $B342
    .byte $00 ; |        | $B343
    .byte $00 ; |        | $B344
    .byte $00 ; |        | $B345
    .byte $00 ; |        | $B346
    .byte $00 ; |        | $B347
    .byte $00 ; |        | $B348
    .byte $00 ; |        | $B349
    .byte $78 ; | XXXX   | $B34A
    .byte $FC ; |XXXXXX  | $B34B
    .byte $7C ; | XXXXX  | $B34C
    .byte $3E ; |  XXXXX | $B34D
    .byte $0E ; |    XXX | $B34E
    .byte $3C ; |  XXXX  | $B34F
    .byte $5A ; | X XX X | $B350
    .byte $D6 ; |XX X XX | $B351
    .byte $EC ; |XXX XX  | $B352
    .byte $5C ; | X XXX  | $B353
    .byte $3E ; |  XXXXX | $B354
    .byte $04 ; |     X  | $B355
    .byte $08 ; |    X   | $B356
    .byte $00 ; |        | $B357
    .byte $00 ; |        | $B358
    .byte $00 ; |        | $B359
    .byte $00 ; |        | $B35A
    .byte $00 ; |        | $B35B
    .byte $00 ; |        | $B35C
    .byte $00 ; |        | $B35D
    .byte $00 ; |        | $B35E
    .byte $00 ; |        | $B35F
    .byte $00 ; |        | $B360
    .byte $00 ; |        | $B361
    .byte $00 ; |        | $B362
    .byte $00 ; |        | $B363
    .byte $78 ; | XXXX   | $B364
    .byte $3C ; |  XXXX  | $B365
    .byte $1C ; |   XXX  | $B366
    .byte $0E ; |    XXX | $B367
    .byte $0E ; |    XXX | $B368
    .byte $1C ; |   XXX  | $B369
    .byte $3A ; |  XXX X | $B36A
    .byte $56 ; | X X XX | $B36B
    .byte $EC ; |XXX XX  | $B36C
    .byte $5D ; | X XXX X| $B36D
    .byte $3F ; |  XXXXXX| $B36E
    .byte $04 ; |     X  | $B36F
    .byte $08 ; |    X   | $B370
    .byte $18 ; |   XX   | $B371
    .byte $00 ; |        | $B372
    .byte $00 ; |        | $B373
    .byte $00 ; |        | $B374
    .byte $00 ; |        | $B375
    .byte $00 ; |        | $B376
    .byte $00 ; |        | $B377
    .byte $00 ; |        | $B378
    .byte $00 ; |        | $B379
    .byte $00 ; |        | $B37A
    .byte $00 ; |        | $B37B
    .byte $00 ; |        | $B37C
    .byte $00 ; |        | $B37D
    .byte $38 ; |  XXX   | $B37E
    .byte $7C ; | XXXXX  | $B37F
    .byte $7E ; | XXXXXX | $B380
    .byte $FE ; |XXXXXXX | $B381
    .byte $FA ; |XXXXX X | $B382
    .byte $FC ; |XXXXXX  | $B383
    .byte $FA ; |XXXXX X | $B384
    .byte $F6 ; |XXXX XX | $B385
    .byte $6C ; | XX XX  | $B386
    .byte $1D ; |   XXX X| $B387
    .byte $3F ; |  XXXXXX| $B388
    .byte $04 ; |     X  | $B389
    .byte $08 ; |    X   | $B38A
    .byte $18 ; |   XX   | $B38B
    .byte $00 ; |        | $B38C
    .byte $00 ; |        | $B38D
    .byte $00 ; |        | $B38E
    .byte $00 ; |        | $B38F
    .byte $00 ; |        | $B390
    .byte $00 ; |        | $B391
    .byte $00 ; |        | $B392
    .byte $00 ; |        | $B393
    .byte $00 ; |        | $B394
    .byte $00 ; |        | $B395
    .byte $00 ; |        | $B396
    .byte $00 ; |        | $B397
    .byte $00 ; |        | $B398
    .byte $44 ; | X   X  | $B399
    .byte $C4 ; |XX   X  | $B39A
    .byte $CE ; |XX  XXX | $B39B
    .byte $EA ; |XXX X X | $B39C
    .byte $EC ; |XXX XX  | $B39D
    .byte $FA ; |XXXXX X | $B39E
    .byte $F6 ; |XXXX XX | $B39F
    .byte $6C ; | XX XX  | $B3A0
    .byte $1C ; |   XXX  | $B3A1
    .byte $3E ; |  XXXXX | $B3A2
    .byte $04 ; |     X  | $B3A3
    .byte $08 ; |    X   | $B3A4
    .byte $00 ; |        | $B3A5
    .byte $00 ; |        | $B3A6
    .byte $00 ; |        | $B3A7
    .byte $00 ; |        | $B3A8
    .byte $00 ; |        | $B3A9
    .byte $00 ; |        | $B3AA
    .byte $00 ; |        | $B3AB
    .byte $00 ; |        | $B3AC
    .byte $00 ; |        | $B3AD
    .byte $00 ; |        | $B3AE
    .byte $00 ; |        | $B3AF
    .byte $00 ; |        | $B3B0
    .byte $00 ; |        | $B3B1
    .byte $00 ; |        | $B3B2
    .byte $00 ; |        | $B3B3
    .byte $82 ; |X     X | $B3B4
    .byte $86 ; |X    XX | $B3B5
    .byte $C2 ; |XX    X | $B3B6
    .byte $EC ; |XXX XX  | $B3B7
    .byte $FA ; |XXXXX X | $B3B8
    .byte $F6 ; |XXXX XX | $B3B9
    .byte $6C ; | XX XX  | $B3BA
    .byte $1C ; |   XXX  | $B3BB
    .byte $3C ; |  XXXX  | $B3BC
    .byte $04 ; |     X  | $B3BD
    .byte $00 ; |        | $B3BE
    .byte $00 ; |        | $B3BF
    .byte $00 ; |        | $B3C0
    .byte $00 ; |        | $B3C1
    .byte $00 ; |        | $B3C2
    .byte $00 ; |        | $B3C3
    .byte $00 ; |        | $B3C4
    .byte $00 ; |        | $B3C5
    .byte $00 ; |        | $B3C6
    .byte $00 ; |        | $B3C7
    .byte $00 ; |        | $B3C8
    .byte $00 ; |        | $B3C9
    .byte $00 ; |        | $B3CA
    .byte $00 ; |        | $B3CB
    .byte $18 ; |   XX   | $B3CC
    .byte $08 ; |    X   | $B3CD
    .byte $04 ; |     X  | $B3CE
    .byte $3F ; |  XXXXXX| $B3CF
    .byte $1D ; |   XXX X| $B3D0
    .byte $6C ; | XX XX  | $B3D1
    .byte $F6 ; |XXXX XX | $B3D2
    .byte $FA ; |XXXXX X | $B3D3
    .byte $FC ; |XXXXXX  | $B3D4
    .byte $FA ; |XXXXX X | $B3D5
    .byte $FE ; |XXXXXXX | $B3D6
    .byte $7E ; | XXXXXX | $B3D7
    .byte $7C ; | XXXXX  | $B3D8
    .byte $38 ; |  XXX   | $B3D9
    .byte $00 ; |        | $B3DA
    .byte $00 ; |        | $B3DB
    .byte $00 ; |        | $B3DC
    .byte $00 ; |        | $B3DD
    .byte $00 ; |        | $B3DE
    .byte $00 ; |        | $B3DF
    .byte $00 ; |        | $B3E0
    .byte $00 ; |        | $B3E1
    .byte $00 ; |        | $B3E2
    .byte $00 ; |        | $B3E3
    .byte $00 ; |        | $B3E4
    .byte $00 ; |        | $B3E5
    .byte $00 ; |        | $B3E6
    .byte $08 ; |    X   | $B3E7
    .byte $04 ; |     X  | $B3E8
    .byte $3E ; |  XXXXX | $B3E9
    .byte $1C ; |   XXX  | $B3EA
    .byte $6C ; | XX XX  | $B3EB
    .byte $F6 ; |XXXX XX | $B3EC
    .byte $FA ; |XXXXX X | $B3ED
    .byte $EC ; |XXX XX  | $B3EE
    .byte $EA ; |XXX X X | $B3EF
    .byte $CE ; |XX  XXX | $B3F0
    .byte $C4 ; |XX   X  | $B3F1
    .byte $44 ; | X   X  | $B3F2
    .byte $00 ; |        | $B3F3
    .byte $00 ; |        | $B3F4
    .byte $00 ; |        | $B3F5
    .byte $00 ; |        | $B3F6
    .byte $00 ; |        | $B3F7
    .byte $00 ; |        | $B3F8
    .byte $00 ; |        | $B3F9
    .byte $00 ; |        | $B3FA
    .byte $00 ; |        | $B3FB
    .byte $00 ; |        | $B3FC
    .byte $00 ; |        | $B3FD
    .byte $00 ; |        | $B3FE
    .byte $00 ; |        | $B3FF
    .byte $00 ; |        | $B400
    .byte $00 ; |        | $B401
    .byte $00 ; |        | $B402
    .byte $00 ; |        | $B403
    .byte $00 ; |        | $B404
    .byte $00 ; |        | $B405
    .byte $00 ; |        | $B406
    .byte $00 ; |        | $B407
    .byte $00 ; |        | $B408
    .byte $00 ; |        | $B409
    .byte $00 ; |        | $B40A
    .byte $00 ; |        | $B40B
    .byte $00 ; |        | $B40C
    .byte $00 ; |        | $B40D
    .byte $00 ; |        | $B40E
    .byte $00 ; |        | $B40F
    .byte $00 ; |        | $B410
    .byte $00 ; |        | $B411
    .byte $00 ; |        | $B412
    .byte $00 ; |        | $B413
    .byte $00 ; |        | $B414
    .byte $00 ; |        | $B415
    .byte $00 ; |        | $B416
    .byte $00 ; |        | $B417
    .byte $04 ; |     X  | $B418
    .byte $3C ; |  XXXX  | $B419
    .byte $1C ; |   XXX  | $B41A
    .byte $6C ; | XX XX  | $B41B
    .byte $F6 ; |XXXX XX | $B41C
    .byte $FA ; |XXXXX X | $B41D
    .byte $EC ; |XXX XX  | $B41E
    .byte $C2 ; |XX    X | $B41F
    .byte $86 ; |X    XX | $B420
    .byte $82 ; |X     X | $B421
    .byte $00 ; |        | $B422
    .byte $00 ; |        | $B423
    .byte $00 ; |        | $B424
    .byte $00 ; |        | $B425
    .byte $00 ; |        | $B426
    .byte $00 ; |        | $B427
    .byte $00 ; |        | $B428
    .byte $00 ; |        | $B429
    .byte $00 ; |        | $B42A
    .byte $00 ; |        | $B42B
    .byte $00 ; |        | $B42C
    .byte $00 ; |        | $B42D
    .byte $00 ; |        | $B42E
    .byte $00 ; |        | $B42F
    .byte $00 ; |        | $B430
    .byte $88 ; |X   X   | $B431
    .byte $DD ; |XX XXX X| $B432
    .byte $FF ; |XXXXXXXX| $B433
    .byte $FF ; |XXXXXXXX| $B434
    .byte $FF ; |XXXXXXXX| $B435
    .byte $FF ; |XXXXXXXX| $B436
    .byte $93 ; |X  X  XX| $B437
    .byte $DB ; |XX XX XX| $B438
    .byte $93 ; |X  X  XX| $B439
    .byte $FF ; |XXXXXXXX| $B43A
    .byte $7E ; | XXXXXX | $B43B
    .byte $3C ; |  XXXX  | $B43C
    .byte $00 ; |        | $B43D
    .byte $00 ; |        | $B43E
    .byte $00 ; |        | $B43F
    .byte $00 ; |        | $B440
    .byte $00 ; |        | $B441
    .byte $00 ; |        | $B442
    .byte $00 ; |        | $B443
    .byte $00 ; |        | $B444
    .byte $00 ; |        | $B445
    .byte $00 ; |        | $B446
    .byte $00 ; |        | $B447
    .byte $00 ; |        | $B448
    .byte $00 ; |        | $B449
    .byte $00 ; |        | $B44A
    .byte $11 ; |   X   X| $B44B
    .byte $BB ; |X XXX XX| $B44C
    .byte $FF ; |XXXXXXXX| $B44D
    .byte $FF ; |XXXXXXXX| $B44E
    .byte $FF ; |XXXXXXXX| $B44F
    .byte $FF ; |XXXXXXXX| $B450
    .byte $93 ; |X  X  XX| $B451
    .byte $DB ; |XX XX XX| $B452
    .byte $93 ; |X  X  XX| $B453
    .byte $FF ; |XXXXXXXX| $B454
    .byte $7E ; | XXXXXX | $B455
    .byte $3C ; |  XXXX  | $B456
    .byte $00 ; |        | $B457
    .byte $00 ; |        | $B458
    .byte $00 ; |        | $B459
    .byte $00 ; |        | $B45A
    .byte $00 ; |        | $B45B
    .byte $00 ; |        | $B45C
    .byte $00 ; |        | $B45D
    .byte $00 ; |        | $B45E
    .byte $00 ; |        | $B45F
    .byte $00 ; |        | $B460
    .byte $00 ; |        | $B461
    .byte $00 ; |        | $B462
    .byte $00 ; |        | $B463
    .byte $00 ; |        | $B464
    .byte $11 ; |   X   X| $B465
    .byte $BB ; |X XXX XX| $B466
    .byte $FF ; |XXXXXXXX| $B467
    .byte $FF ; |XXXXXXXX| $B468
    .byte $FF ; |XXXXXXXX| $B469
    .byte $FF ; |XXXXXXXX| $B46A
    .byte $C9 ; |XX  X  X| $B46B
    .byte $DB ; |XX XX XX| $B46C
    .byte $C9 ; |XX  X  X| $B46D
    .byte $FF ; |XXXXXXXX| $B46E
    .byte $7E ; | XXXXXX | $B46F
    .byte $3C ; |  XXXX  | $B470
    .byte $00 ; |        | $B471
    .byte $00 ; |        | $B472
    .byte $00 ; |        | $B473
    .byte $00 ; |        | $B474
    .byte $00 ; |        | $B475
    .byte $00 ; |        | $B476
    .byte $00 ; |        | $B477
    .byte $00 ; |        | $B478
    .byte $00 ; |        | $B479
    .byte $00 ; |        | $B47A
    .byte $00 ; |        | $B47B
    .byte $00 ; |        | $B47C
    .byte $00 ; |        | $B47D
    .byte $00 ; |        | $B47E
    .byte $88 ; |X   X   | $B47F
    .byte $DD ; |XX XXX X| $B480
    .byte $FF ; |XXXXXXXX| $B481
    .byte $FF ; |XXXXXXXX| $B482
    .byte $FF ; |XXXXXXXX| $B483
    .byte $FF ; |XXXXXXXX| $B484
    .byte $C9 ; |XX  X  X| $B485
    .byte $DB ; |XX XX XX| $B486
    .byte $C9 ; |XX  X  X| $B487
    .byte $FF ; |XXXXXXXX| $B488
    .byte $7E ; | XXXXXX | $B489
    .byte $3C ; |  XXXX  | $B48A
    .byte $00 ; |        | $B48B
    .byte $00 ; |        | $B48C
    .byte $00 ; |        | $B48D
    .byte $00 ; |        | $B48E
    .byte $00 ; |        | $B48F
    .byte $00 ; |        | $B490
    .byte $00 ; |        | $B491
    .byte $00 ; |        | $B492
    .byte $00 ; |        | $B493
    .byte $00 ; |        | $B494
    .byte $00 ; |        | $B495
    .byte $00 ; |        | $B496
    .byte $00 ; |        | $B497
    .byte $00 ; |        | $B498
    .byte $88 ; |X   X   | $B499
    .byte $DD ; |XX XXX X| $B49A
    .byte $FF ; |XXXXXXXX| $B49B
    .byte $FF ; |XXXXXXXX| $B49C
    .byte $FF ; |XXXXXXXX| $B49D
    .byte $FF ; |XXXXXXXX| $B49E
    .byte $99 ; |X  XX  X| $B49F
    .byte $99 ; |X  XX  X| $B4A0
    .byte $BD ; |X XXXX X| $B4A1
    .byte $DB ; |XX XX XX| $B4A2
    .byte $7E ; | XXXXXX | $B4A3
    .byte $3C ; |  XXXX  | $B4A4
    .byte $00 ; |        | $B4A5
    .byte $00 ; |        | $B4A6
    .byte $00 ; |        | $B4A7
    .byte $00 ; |        | $B4A8
    .byte $00 ; |        | $B4A9
    .byte $00 ; |        | $B4AA
    .byte $00 ; |        | $B4AB
    .byte $00 ; |        | $B4AC
    .byte $00 ; |        | $B4AD
    .byte $00 ; |        | $B4AE
    .byte $00 ; |        | $B4AF
    .byte $00 ; |        | $B4B0
    .byte $00 ; |        | $B4B1
    .byte $00 ; |        | $B4B2
    .byte $11 ; |   X   X| $B4B3
    .byte $BB ; |X XXX XX| $B4B4
    .byte $FF ; |XXXXXXXX| $B4B5
    .byte $FF ; |XXXXXXXX| $B4B6
    .byte $FF ; |XXXXXXXX| $B4B7
    .byte $FF ; |XXXXXXXX| $B4B8
    .byte $99 ; |X  XX  X| $B4B9
    .byte $99 ; |X  XX  X| $B4BA
    .byte $BD ; |X XXXX X| $B4BB
    .byte $DB ; |XX XX XX| $B4BC
    .byte $7E ; | XXXXXX | $B4BD
    .byte $3C ; |  XXXX  | $B4BE
    .byte $00 ; |        | $B4BF
    .byte $00 ; |        | $B4C0
    .byte $00 ; |        | $B4C1
    .byte $00 ; |        | $B4C2
    .byte $00 ; |        | $B4C3
    .byte $00 ; |        | $B4C4
    .byte $00 ; |        | $B4C5
    .byte $00 ; |        | $B4C6
    .byte $00 ; |        | $B4C7
    .byte $00 ; |        | $B4C8
    .byte $00 ; |        | $B4C9
    .byte $00 ; |        | $B4CA
    .byte $00 ; |        | $B4CB
    .byte $00 ; |        | $B4CC
    .byte $11 ; |   X   X| $B4CD
    .byte $BB ; |X XXX XX| $B4CE
    .byte $FF ; |XXXXXXXX| $B4CF
    .byte $FF ; |XXXXXXXX| $B4D0
    .byte $FF ; |XXXXXXXX| $B4D1
    .byte $DB ; |XX XX XX| $B4D2
    .byte $BD ; |X XXXX X| $B4D3
    .byte $99 ; |X  XX  X| $B4D4
    .byte $99 ; |X  XX  X| $B4D5
    .byte $FF ; |XXXXXXXX| $B4D6
    .byte $7E ; | XXXXXX | $B4D7
    .byte $3C ; |  XXXX  | $B4D8
    .byte $00 ; |        | $B4D9
    .byte $00 ; |        | $B4DA
    .byte $00 ; |        | $B4DB
    .byte $00 ; |        | $B4DC
    .byte $00 ; |        | $B4DD
    .byte $00 ; |        | $B4DE
    .byte $00 ; |        | $B4DF
    .byte $00 ; |        | $B4E0
    .byte $00 ; |        | $B4E1
    .byte $00 ; |        | $B4E2
    .byte $00 ; |        | $B4E3
    .byte $00 ; |        | $B4E4
    .byte $00 ; |        | $B4E5
    .byte $00 ; |        | $B4E6
    .byte $88 ; |X   X   | $B4E7
    .byte $DD ; |XX XXX X| $B4E8
    .byte $FF ; |XXXXXXXX| $B4E9
    .byte $FF ; |XXXXXXXX| $B4EA
    .byte $FF ; |XXXXXXXX| $B4EB
    .byte $DB ; |XX XX XX| $B4EC
    .byte $BD ; |X XXXX X| $B4ED
    .byte $99 ; |X  XX  X| $B4EE
    .byte $99 ; |X  XX  X| $B4EF
    .byte $FF ; |XXXXXXXX| $B4F0
    .byte $7E ; | XXXXXX | $B4F1
    .byte $3C ; |  XXXX  | $B4F2
    .byte $00 ; |        | $B4F3
    .byte $00 ; |        | $B4F4
    .byte $00 ; |        | $B4F5
    .byte $00 ; |        | $B4F6
    .byte $00 ; |        | $B4F7
    .byte $00 ; |        | $B4F8
    .byte $00 ; |        | $B4F9
    .byte $00 ; |        | $B4FA
    .byte $00 ; |        | $B4FB
    .byte $00 ; |        | $B4FC
    .byte $00 ; |        | $B4FD
    .byte $00 ; |        | $B4FE
    .byte $00 ; |        | $B4FF
    .byte $00 ; |        | $B500
    .byte $00 ; |        | $B501
    .byte $00 ; |        | $B502
    .byte $00 ; |        | $B503
    .byte $00 ; |        | $B504
    .byte $00 ; |        | $B505
    .byte $00 ; |        | $B506
    .byte $00 ; |        | $B507
    .byte $00 ; |        | $B508
    .byte $00 ; |        | $B509
    .byte $00 ; |        | $B50A
    .byte $00 ; |        | $B50B
    .byte $00 ; |        | $B50C
    .byte $00 ; |        | $B50D
    .byte $00 ; |        | $B50E
    .byte $00 ; |        | $B50F
    .byte $00 ; |        | $B510
    .byte $00 ; |        | $B511
    .byte $00 ; |        | $B512
    .byte $00 ; |        | $B513
    .byte $00 ; |        | $B514
    .byte $00 ; |        | $B515
    .byte $00 ; |        | $B516
    .byte $88 ; |X   X   | $B517
    .byte $DD ; |XX XXX X| $B518
    .byte $FF ; |XXXXXXXX| $B519
    .byte $FF ; |XXXXXXXX| $B51A
    .byte $A5 ; |X X  X X| $B51B
    .byte $DB ; |XX XX XX| $B51C
    .byte $FF ; |XXXXXXXX| $B51D
    .byte $FF ; |XXXXXXXX| $B51E
    .byte $99 ; |X  XX  X| $B51F
    .byte $FF ; |XXXXXXXX| $B520
    .byte $7E ; | XXXXXX | $B521
    .byte $3C ; |  XXXX  | $B522
    .byte $00 ; |        | $B523
    .byte $00 ; |        | $B524
    .byte $00 ; |        | $B525
    .byte $00 ; |        | $B526
    .byte $00 ; |        | $B527
    .byte $00 ; |        | $B528
    .byte $00 ; |        | $B529
    .byte $00 ; |        | $B52A
    .byte $00 ; |        | $B52B
    .byte $00 ; |        | $B52C
    .byte $00 ; |        | $B52D
    .byte $00 ; |        | $B52E
    .byte $00 ; |        | $B52F
    .byte $11 ; |   X   X| $B530
    .byte $BB ; |X XXX XX| $B531
    .byte $FF ; |XXXXXXXX| $B532
    .byte $FF ; |XXXXXXXX| $B533
    .byte $A5 ; |X X  X X| $B534
    .byte $DB ; |XX XX XX| $B535
    .byte $FF ; |XXXXXXXX| $B536
    .byte $FF ; |XXXXXXXX| $B537
    .byte $99 ; |X  XX  X| $B538
    .byte $FF ; |XXXXXXXX| $B539
    .byte $7E ; | XXXXXX | $B53A
    .byte $3C ; |  XXXX  | $B53B
    .byte $00 ; |        | $B53C
    .byte $00 ; |        | $B53D
    .byte $00 ; |        | $B53E
    .byte $00 ; |        | $B53F
    .byte $00 ; |        | $B540
    .byte $00 ; |        | $B541
    .byte $00 ; |        | $B542
    .byte $00 ; |        | $B543
    .byte $00 ; |        | $B544
    .byte $00 ; |        | $B545
    .byte $00 ; |        | $B546
    .byte $00 ; |        | $B547
    .byte $00 ; |        | $B548
    .byte $18 ; |   XX   | $B549
    .byte $30 ; |  XX    | $B54A
    .byte $50 ; | X X    | $B54B
    .byte $68 ; | XX X   | $B54C
    .byte $34 ; |  XX X  | $B54D
    .byte $B8 ; |X XXX   | $B54E
    .byte $FC ; |XXXXXX  | $B54F
    .byte $E0 ; |XXX     | $B550
    .byte $30 ; |  XX    | $B551
    .byte $38 ; |  XXX   | $B552
    .byte $00 ; |        | $B553
    .byte $00 ; |        | $B554
    .byte $00 ; |        | $B555
    .byte $00 ; |        | $B556
    .byte $00 ; |        | $B557
    .byte $00 ; |        | $B558
    .byte $00 ; |        | $B559
    .byte $00 ; |        | $B55A
    .byte $00 ; |        | $B55B
    .byte $00 ; |        | $B55C
    .byte $00 ; |        | $B55D
    .byte $00 ; |        | $B55E
    .byte $00 ; |        | $B55F
    .byte $00 ; |        | $B560
    .byte $00 ; |        | $B561
    .byte $04 ; |     X  | $B562
    .byte $0C ; |    XX  | $B563
    .byte $1C ; |   XXX  | $B564
    .byte $39 ; |  XXX  X| $B565
    .byte $7B ; | XXXX XX| $B566
    .byte $0F ; |    XXXX| $B567
    .byte $08 ; |    X   | $B568
    .byte $18 ; |   XX   | $B569
    .byte $38 ; |  XXX   | $B56A
    .byte $00 ; |        | $B56B
    .byte $00 ; |        | $B56C
    .byte $00 ; |        | $B56D
    .byte $00 ; |        | $B56E
    .byte $00 ; |        | $B56F
    .byte $00 ; |        | $B570
    .byte $00 ; |        | $B571
    .byte $00 ; |        | $B572
    .byte $00 ; |        | $B573
    .byte $00 ; |        | $B574
    .byte $00 ; |        | $B575
    .byte $00 ; |        | $B576
    .byte $00 ; |        | $B577

LB578:  ; indirect jump
    lda    ($A2),Y               ; 5
    jmp    LB8C2                 ; 3

LB57D:  ; indirect jump
    lda    ($A2),Y               ; 5
    jmp    LB904                 ; 3

LB582:  ; indirect jump
    lda    ($A2),Y               ; 5
    jmp    LB930                 ; 3

LB587:  ; indirect jump
    nop                          ; 2
    nop                          ; 2
    jmp    LB964                 ; 3

LB58C:  ; indirect jump
    lda    ($A2),Y               ; 5
    jmp    LB996                 ; 3

LB591:  ; indirect jump
    lda    ($A2),Y               ; 5
    jmp    LB9C3                 ; 3

LB596:  ; indirect jump
    lda    ($A2),Y               ; 5
    jmp    LBA3E                 ; 3

LB59B:  ; indirect jump
    sta    $CC                   ; 3
    jmp    LBA72                 ; 3

LB5A0:  ; indirect jump
    lda    ($A2),Y               ; 5
    nop                          ; 2
    jmp    LB610                 ; 3

LB5A6:  ; indirect jump
    lda    ($A2),Y               ; 5
    sta    $CC                   ; 3
    jmp    LB645                 ; 3

LB5AD:  ; indirect jump
    lda    ($A2),Y               ; 5
    jmp    LB66F                 ; 3

LB5B2:  ; indirect jump
    lda    ($A2),Y               ; 5
    jmp    LB6CF                 ; 3

LB5B7:  ; indirect jump
    nop                          ; 2
    nop                          ; 2
    jmp    LB705                 ; 3

LB5BC:  ; indirect jump
    jmp    LB732                 ; 3

LB5BF:  ; indirect jump
    nop                          ; 2
    jmp    LB763                 ; 3

LB5C3:  ; indirect jump
    lda    ($A2),Y               ; 5
    jmp    LB794                 ; 3

LB5C8:  ; indirect jump
    lda    ($A2),Y               ; 5
    jmp    LB80F                 ; 3

LB5CD:  ; indirect jump
    lda    ($A2),Y               ; 5
    jmp    LB833                 ; 3

LB5D2:  ; indirect jump
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    jmp    LB864                 ; 3

LB5D9:  ; indirect jump
    lda    ($A2),Y               ; 5
    jmp    LB896                 ; 3

    .byte $98 ; |X  XX   | $B5DE
    .byte $95 ; |X  X X X| $B5DF
    .byte $93 ; |X  X  XX| $B5E0
    .byte $92 ; |X  X  X | $B5E1
    .byte $8E ; |X   XXX | $B5E2
    .byte $98 ; |X  XX   | $B5E3
    .byte $93 ; |X  X  XX| $B5E4
    .byte $92 ; |X  X  X | $B5E5
    .byte $8E ; |X   XXX | $B5E6
    .byte $98 ; |X  XX   | $B5E7
    .byte $8E ; |X   XXX | $B5E8
    .byte $92 ; |X  X  X | $B5E9
    .byte $98 ; |X  XX   | $B5EA
    .byte $8E ; |X   XXX | $B5EB
    .byte $8F ; |X   XXXX| $B5EC
    .byte $90 ; |X  X    | $B5ED
    .byte $8D ; |X   XX X| $B5EE
    .byte $98 ; |X  XX   | $B5EF
    .byte $8D ; |X   XX X| $B5F0
    .byte $93 ; |X  X  XX| $B5F1
    .byte $8D ; |X   XX X| $B5F2
    .byte $98 ; |X  XX   | $B5F3
    .byte $93 ; |X  X  XX| $B5F4
    .byte $92 ; |X  X  X | $B5F5
    .byte $8E ; |X   XXX | $B5F6
    .byte $98 ; |X  XX   | $B5F7
    .byte $8E ; |X   XXX | $B5F8
    .byte $93 ; |X  X  XX| $B5F9
    .byte $89 ; |X   X  X| $B5FA
    .byte $93 ; |X  X  XX| $B5FB
    .byte $89 ; |X   X  X| $B5FC
    .byte $8E ; |X   XXX | $B5FD
    .byte $93 ; |X  X  XX| $B5FE
    .byte $9D ; |X  XXX X| $B5FF

LB600:
    lda    SC_00|READ,X          ; 4
    and    #$07                  ; 2
    tay                          ; 2
    lda    LB83C,Y               ; 4
    tax                          ; 2
    and    #$20                  ; 2
    ora    $B2                   ; 3
    sta    $B9                   ; 3
LB610:
    ldy    #2                    ; 2
    lda    ($A2),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    txa                          ; 2
    and    #$44                  ; 2
    ora    $B3                   ; 3
    sta    $BA                   ; 3
    tsx                          ; 2
    lda    SC_36|READ,X          ; 4
    and    #$07                  ; 2
    tay                          ; 2
    lda    LB83C,Y               ; 4
    and    #$20                  ; 2
    ora    $B2                   ; 3
    sta    $BC                   ; 3
    lda    LB83C,Y               ; 4
    and    #$44                  ; 2
    ora    $B3                   ; 3
    sta    $BB                   ; 3
    lda    SC_6C|READ,X          ; 4
    sta    $A0                   ; 3
    and    #$20                  ; 2
    ora    $B2                   ; 3
    sta    $B5                   ; 3
LB645:
    ldy    #1                    ; 2
    lda    ($A2),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    ldx    $B0                   ; 3
    lda    $A0                   ; 3
    and    #$44                  ; 2
    ora    $B3                   ; 3
    sta    $B6                   ; 3
    dey                          ; 2
    dec    $9F                   ; 5
    bmi    LB684                 ; 2³
    lda    #$0A                  ; 2
    cmp    $A4                   ; 3
    bcc    LB666                 ; 2³
    sta    $A4                   ; 3
LB666:
    sec                          ; 2
    lda    $95,X                 ; 4
    sta    $AD                   ; 3
    lda    ($A2),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
LB66F:
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    ldy    #4                    ; 2
    lda    #$BE                  ; 2
    sta    $AE                   ; 3
    lda    $A4                   ; 3
    sbc    #5                    ; 2
    sta    $A4                   ; 3
    jmp    LB6A9                 ; 3

LB684:
    lda    $97,X                 ; 4
    sta    HMP1                  ; 3
    and    #$07                  ; 2
    ora    #$B0                  ; 2
    sta    $A5                   ; 3
    dec    $B0                   ; 5
    lda    $99,X                 ; 4
    sta    COLUP1                ; 3
    lda    ($A2),Y               ; 5
    ldy    #4                    ; 2
    sta    GRP0                  ; 3
    sty    $9F                   ; 3
    lda    $9B,X                 ; 4
    sta    $A4                   ; 3
    jmp.ind ($00AD)              ; 5

LB6A3:  ; indirect jump
    lda    ($A2),Y               ; 5
LB6A5:  ; indirect jump
    lda    ($A2),Y               ; 5
LB6A7:  ; indirect jump
    sta    RESP1                 ; 3
LB6A9:
    lda    $A2                   ; 3
    sbc    #5                    ; 2
    sta    $A2                   ; 3
    lda    ($A2),Y               ; 5
    jmp    LB6CD                 ; 3

LB6B4:  ; indirect jump
    lda    ($A2),Y               ; 5
LB6B6:  ; indirect jump
    lda    ($A2),Y               ; 5
LB6B8:  ; indirect jump
    lda    ($A2),Y               ; 5
LB6BA:  ; indirect jump
    lda    ($A2),Y               ; 5
LB6BC:  ; indirect jump
    lda    ($A2),Y               ; 5
LB6BE:  ; indirect jump
    lda    ($A2),Y               ; 5
LB6C0:  ; indirect jump
    lda    ($A2),Y               ; 5
LB6C2:  ; indirect jump
    lda    $A2                   ; 3
    sbc    #5                    ; 2
    sta    $A2                   ; 3
    lda    ($A2),Y               ; 5
    nop                          ; 2
    sta    RESP1                 ; 3
LB6CD:
    sta    WSYNC                 ; 3
;---------------------------------------
LB6CF:
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    $C6                   ; 3
    sta    PF0                   ; 3
    lda    $C7                   ; 3
    sta    PF1                   ; 3
    lda    $C8                   ; 3
    sta    PF2                   ; 3
    ldx    $AF                   ; 3
    lda    $91,X                 ; 4
    ldx    $CA                   ; 3
    ldy    $C9                   ; 3
    sty    PF2                   ; 3
    stx    PF1                   ; 3
    ldy    $CB                   ; 3
    sty    PF0                   ; 3
    dec    $94                   ; 5
    bmi    LB6FD                 ; 2³
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    jmp    LB703                 ; 3

LB6FD:
    sta    $94                   ; 3
    lda    #$0A                  ; 2
    sta    $A2                   ; 3
LB703:
    ldy    #3                    ; 2
LB705:
    lda    ($A2),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    $C0                   ; 3
    sta    PF0                   ; 3
    lda    $C1                   ; 3
    sta    PF1                   ; 3
    lda    $C2                   ; 3
    sta    PF2                   ; 3
    lda    $C4                   ; 3
    sta    PF1                   ; 3
    sta    HMCLR                 ; 3
    lda    $C3                   ; 3
    sta    PF2                   ; 3
    lda    $C5                   ; 3
    sta    PF0                   ; 3
    lda    $A0                   ; 3
    asl                          ; 2
    asl                          ; 2
    tax                          ; 2
    and    #$20                  ; 2
    ora    $B2                   ; 3
    sta    $B8                   ; 3
LB732:
    ldy    #2                    ; 2
    lda    ($A2),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    $C0                   ; 3
    sta    PF0                   ; 3
    lda    $C1                   ; 3
    sta    PF1                   ; 3
    lda    $C2                   ; 3
    sta    PF2                   ; 3
    lda    $C5                   ; 3
    sta    PF0                   ; 3
    txa                          ; 2
    ldy    $C4                   ; 3
    ldx    $C3                   ; 3
    stx    PF2                   ; 3
    sty    PF1                   ; 3
    and    #$44                  ; 2
    ora    $B3                   ; 3
    sta    $B7                   ; 3
    ldy    #1                    ; 2
    lda    ($A2),Y               ; 5
    dec    $94                   ; 5
    bmi    LB7B7                 ; 2³
LB763:
    ldx    #$0A                  ; 2
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    $C6                   ; 3
    sta    PF0                   ; 3
    lda    $C7                   ; 3
    sta    PF1                   ; 3
    lda    $C8                   ; 3
    sta    PF2                   ; 3
    lda    $CB                   ; 3
    sta    PF0                   ; 3
    lda    $CA                   ; 3
    sta    PF1                   ; 3
    ldy    #0                    ; 2
    lda    $C9                   ; 3
    sta    PF2                   ; 3
    cpx    $A2                   ; 3
    bcc    LB78B                 ; 2³
    stx    $A2                   ; 3
LB78B:
    sec                          ; 2
    lda    #$BA                  ; 2
    sta    $AC                   ; 3
    lda    ($A2),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
LB794:
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    $BD                   ; 3
    sta    PF0                   ; 3
    lda    $BE                   ; 3
    sta    PF1                   ; 3
    lda    $BF                   ; 3
    sta    PF2                   ; 3
    ldy    #4                    ; 2
    ldx    $AF                   ; 3
    lda    $80,X                 ; 4
    sta    $AB                   ; 3
    lda    $A2                   ; 3
    sbc    #5                    ; 2
    sta    $A2                   ; 3
    jmp    LB805                 ; 3

LB7B7:
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    $C6                   ; 3
    sta    PF0                   ; 3
    lda    $C7                   ; 3
    sta    PF1                   ; 3
    lda    $C8                   ; 3
    sta    PF2                   ; 3
    ldx    $AF                   ; 3
    lda    $CB                   ; 3
    sta    PF0                   ; 3
    lda    $CA                   ; 3
    sta    PF1                   ; 3
    lda    $C9                   ; 3
    sta    PF2                   ; 3
    lda    $84,X                 ; 4
    sta    HMP0                  ; 3
    and    #$07                  ; 2
    ora    #$B0                  ; 2
    sta    $A3                   ; 3
    ldy    #0                    ; 2
    lda    ($A4),Y               ; 5
    sec                          ; 2
    dec    $AF                   ; 5
    sta    GRP1                  ; 3
    lda    $BD                   ; 3
    sta    PF0                   ; 3
    lda    $BE                   ; 3
    sta    PF1                   ; 3
    jmp.ind ($00AB)              ; 5

LB7F5:
    lda    $BF                   ; 3
    sta    PF2                   ; 3
    lda    $8C,X                 ; 4
LB7FB:
    sta    $A2                   ; 3
    lda    $88,X                 ; 4
    sta    COLUP0                ; 3
LB801:
    ldy    #4                    ; 2
    sty    $94                   ; 3
LB805:
    lda    $A4                   ; 3
    sbc    #5                    ; 2
LB809:
    sta    $A4                   ; 3
    lda    ($A2),Y               ; 5
LB80D:
    sta    WSYNC                 ; 3
;---------------------------------------
LB80F:
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    dec    $9F                   ; 5
    bpl    LB825                 ; 2³
    ldx    $B0                   ; 3
    lda    $9E,X                 ; 4
    sta    $9F                   ; 3
    lda    #$0A                  ; 2
    sta    $A4                   ; 3
LB825:
    ldy    #3                    ; 2
    lda    ($A2),Y               ; 5
    dec    $A7                   ; 5
    bpl    LB830                 ; 2³
    jmp    LBBF7                 ; 3

LB830:
    tsx                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
LB833:
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    sta    BANK_2                ; 4   bankswitch, goto LD83C

LB83C:
    .byte $00 ; |        | $B83C
    .byte $04 ; |     X  | $B83D
    .byte $20 ; |  X     | $B83E
    .byte $24 ; |  X  X  | $B83F
    .byte $40 ; | X      | $B840
    .byte $44 ; | X   X  | $B841
    .byte $60 ; | XX     | $B842
    .byte $64 ; | XX  X  | $B843
    .byte $94 ; |X  X X  | $B844
    .byte $92 ; |X  X  X | $B845
    .byte $90 ; |X  X    | $B846
    .byte $8F ; |X   XXXX| $B847
    .byte $8C ; |X   XX  | $B848
    .byte $92 ; |X  X  X | $B849
    .byte $8F ; |X   XXXX| $B84A
    .byte $97 ; |X  X XXX| $B84B
    .byte $92 ; |X  X  X | $B84C
    .byte $9F ; |X  XXXXX| $B84D
    .byte $8F ; |X   XXXX| $B84E
    .byte $34 ; |  XX X  | $B84F
    .byte $20 ; |  X     | $B850
    .byte $34 ; |  XX X  | $B851
    .byte $20 ; |  X     | $B852
    .byte $0F ; |    XXXX| $B853
    .byte $10 ; |   X    | $B854
    .byte $8F ; |X   XXXX| $B855
    .byte $3F ; |  XXXXXX| $B856

;coming from bank 2
LB857:
    ora    $BD                   ; 3
    sta    $C0                   ; 3
    lda    SC_36|READ,X          ; 4
    and    #$A0                  ; 2
    ora    $BD                   ; 3
    sta    $C6                   ; 3
LB864:
    ldy    #2                    ; 2
    lda    ($A2),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    SC_00|READ,X          ; 4
    asl                          ; 2
    and    #$A0                  ; 2
    ora    $BD                   ; 3
    sta    $C5                   ; 3
    lda    SC_36|READ,X          ; 4
    asl                          ; 2
    and    #$A0                  ; 2
    ora    $BD                   ; 3
    sta    $CB                   ; 3
    lda    SC_24|READ,X          ; 4
    and    #$55                  ; 2
    ora    $BE                   ; 3
    sta    $C1                   ; 3
    lda    SC_5A|READ,X          ; 4
    and    #$55                  ; 2
    ora    $BE                   ; 3
    sta    $C7                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
LB896:
    ldy    #1                    ; 2
    lda    ($A2),Y               ; 5
    sec                          ; 2
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    SC_12|READ,X          ; 4
    and    #$55                  ; 2
    ora    $BE                   ; 3
    sta    $C4                   ; 3
    dey                          ; 2
    inx                          ; 2
    txs                          ; 2
    ldx    $B0                   ; 3
    sta    HMCLR                 ; 3
    dec    $9F                   ; 5
    bmi    LB8E7                 ; 2³
    lda    #$0A                  ; 2
    cmp    $A4                   ; 3
    bcc    LB8BD                 ; 2³
    sta    $A4                   ; 3
LB8BD:
    sec                          ; 2
    lda    ($A2),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
LB8C2:
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    $B2                   ; 3
    sta    PF0                   ; 3
    lda    $B3                   ; 3
    sta    PF1                   ; 3
    lda    $B4                   ; 3
    sta    PF2                   ; 3
    lda    $95,X                 ; 4
    sta    $AD                   ; 3
    lda    #$B6                  ; 2
    sta    $AE                   ; 3
    ldy    #4                    ; 2
    lda    $A4                   ; 3
    sbc    #5                    ; 2
    sta    $A4                   ; 3
    jmp    LBEB6                 ; 3

LB8E7:
    lda    $97,X                 ; 4
    sta    HMP1                  ; 3
    and    #$07                  ; 2
    ora    #$B0                  ; 2
    sta    $A5                   ; 3
    lda    ($A2),Y               ; 5
    dec    $B0                   ; 5
    sta    GRP0                  ; 3
    lda    $B2                   ; 3
    sta    PF0                   ; 3
    lda    $B3                   ; 3
    sta    PF1                   ; 3
    jmp.ind ($00AD)              ; 5

LB902:
    sta    WSYNC                 ; 3
;---------------------------------------
LB904:
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    $B9                   ; 3
    sta    PF0                   ; 3
    lda    $BA                   ; 3
    sta    PF1                   ; 3
    lda    $BC                   ; 3
    sta    PF0                   ; 3
    lda    $BB                   ; 3
    sta    PF1                   ; 3
    dec    $94                   ; 5
    bpl    LB92A                 ; 2³
    ldx    $AF                   ; 3
    lda    $91,X                 ; 4
    sta    $94                   ; 3
    lda    #$0A                  ; 2
    sta    $A2                   ; 3
LB92A:
    ldy    #3                    ; 2
    lda    ($A2),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
LB930:
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    $B5                   ; 3
    sta    PF0                   ; 3
    lda    $B6                   ; 3
    sta    PF1                   ; 3
    ldy    #2                    ; 2
    tsx                          ; 2
    lda    $B8                   ; 3
    sta    PF0                   ; 3
    lda    $B7                   ; 3
    sta    PF1                   ; 3
    lda    SC_47|READ,X          ; 4
    and    #$55                  ; 2
    ora    $BE                   ; 3
    sta    $CA                   ; 3
    lda    SC_23|READ,X          ; 4
    and    #$AA                  ; 2
    ora    $BF                   ; 3
    sta    $C2                   ; 3
    lda    SC_59|READ,X          ; 4
    and    #$AA                  ; 2
    ora    $BF                   ; 3
    sta    $C8                   ; 3
LB964:
    lda    ($A2),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    $B5                   ; 3
    sta    PF0                   ; 3
    lda    $B6                   ; 3
    sta    PF1                   ; 3
    lda    $B8                   ; 3
    sta    PF0                   ; 3
    lda    $B7                   ; 3
    sta    PF1                   ; 3
    lda    SC_11|READ,X          ; 4
    and    #$AA                  ; 2
    ora    $BF                   ; 3
    sta    $C3                   ; 3
    lda    SC_47|READ,X          ; 4
    and    #$AA                  ; 2
    ora    $BF                   ; 3
    sta    $C9                   ; 3
    ldy    #1                    ; 2
    lda    ($A2),Y               ; 5
    sta    HMCLR                 ; 3
    ldx    $B9                   ; 3
LB996:
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    stx    PF0                   ; 3
    lda    $BA                   ; 3
    sta    PF1                   ; 3
    ldx    $AF                   ; 3
    ldy    #0                    ; 2
    lda    $BC                   ; 3
    sta    PF0                   ; 3
    dec    $94                   ; 5
    bmi    LB9E0                 ; 2³
    lda    $BB                   ; 3
    sta    PF1                   ; 3
    lda    #$0A                  ; 2
    cmp    $A2                   ; 3
    bcc    LB9BA                 ; 2³
    sta    $A2                   ; 3
LB9BA:
    sec                          ; 2
    lda    $80,X                 ; 4
    sta    $AB                   ; 3
    lda    ($A2),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
LB9C3:
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    $B2                   ; 3
    sta    PF0                   ; 3
    lda    $B3                   ; 3
    sta    PF1                   ; 3
    lda    #$BF                  ; 2
    sta    $AC                   ; 3
    ldy    #4                    ; 2
    lda    $A2                   ; 3
    sbc    #5                    ; 2
    sta    $A2                   ; 3
    jmp    LBA15                 ; 3

LB9E0:
    lda    $BB                   ; 3
    sta    PF1                   ; 3
    lda    $84,X                 ; 4
    sta    HMP0                  ; 3
    and    #$07                  ; 2
    ora    #$B0                  ; 2
    sta    $A3                   ; 3
    lda    $88,X                 ; 4
    sta    COLUP0                ; 3
    lda    ($A4),Y               ; 5
    dec    $AF                   ; 5
    sta    GRP1                  ; 3
    lda    $B2                   ; 3
    sta    PF0                   ; 3
    lda    $B3                   ; 3
    sta    PF1                   ; 3
    jmp.ind ($00AB)              ; 5

LBA03:  ; indirect jump
    lda    ($A2),Y               ; 5
LBA05:  ; indirect jump
    lda    ($A2),Y               ; 5
LBA07:  ; indirect jump
    lda    ($A2),Y               ; 5
LBA09:  ; indirect jump
    lda    ($A2),Y               ; 5
LBA0B:  ; indirect jump
    sta    RESP0                 ; 3
    ldy    #4                    ; 2
    sty    $94                   ; 3
    lda    $8C,X                 ; 4
    sta    $A2                   ; 3
LBA15:
    lda    $A4                   ; 3
    sbc    #5                    ; 2
    sta    $A4                   ; 3
    lda    ($A2),Y               ; 5
    jmp    LBA3C                 ; 3

LBA20:  ; indirect jump
    lda    ($A2),Y               ; 5
LBA22:  ; indirect jump
    lda    ($A2),Y               ; 5
LBA24:  ; indirect jump
    lda    ($A2),Y               ; 5
LBA26:  ; indirect jump
    lda    ($A2),Y               ; 5
LBA28:  ; indirect jump
    lda    ($A2),Y               ; 5
LBA2A:  ; indirect jump
    ldy    #4                    ; 2
    sty    $94                   ; 3
    lda    $8C,X                 ; 4
    sta    $A2                   ; 3
    lda    $A4                   ; 3
    sbc    #5                    ; 2
    sta    $A4                   ; 3
    lda    ($A2),Y               ; 5
    sta    RESP0                 ; 3
LBA3C:
    sta    WSYNC                 ; 3
;---------------------------------------
LBA3E:
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    $BD                   ; 3
    sta    PF0                   ; 3
    lda    $BE                   ; 3
    sta    PF1                   ; 3
    lda    $BF                   ; 3
    sta    PF2                   ; 3
    ldx    $B0                   ; 3
    dec    $9F                   ; 5
    bmi    LBA5F                 ; 2³
    lda    ($A2),Y               ; 5
    lda    ($A2),Y               ; 5
    jmp    LBA67                 ; 3

LBA5F:
    lda    $9E,X                 ; 4
    sta    $9F                   ; 3
    lda    #$0A                  ; 2
    sta    $A4                   ; 3
LBA67:
    dec    $A7                   ; 5
    bmi    LBAA9                 ; 2³
    sta    HMCLR                 ; 3
    tsx                          ; 2
    ldy    #3                    ; 2
    lda    ($A2),Y               ; 5
LBA72:
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    BANK_2                ; 4

    rts                          ; 6

    .byte $20 ; |  X     | $BA7A
    .byte $12 ; |   X  X | $BA7B
    .byte $13 ; |   X  XX| $BA7C
    .byte $12 ; |   X  X | $BA7D
    .byte $2F ; |  X XXXX| $BA7E
    .byte $0D ; |    XX X| $BA7F
    .byte $8F ; |X   XXXX| $BA80
    .byte $17 ; |   X XXX| $BA81
    .byte $18 ; |   XX   | $BA82
    .byte $17 ; |   X XXX| $BA83
    .byte $32 ; |  XX  X | $BA84
    .byte $13 ; |   X  XX| $BA85
    .byte $92 ; |X  X  X | $BA86
    .byte $0F ; |    XXXX| $BA87
    .byte $11 ; |   X   X| $BA88
    .byte $14 ; |   X X  | $BA89
    .byte $38 ; |  XXX   | $BA8A
    .byte $1B ; |   XX XX| $BA8B
    .byte $98 ; |X  XX   | $BA8C
    .byte $57 ; | X X XXX| $BA8D
    .byte $40 ; | X      | $BA8E
    .byte $FF ; |XXXXXXXX| $BA8F
    .byte $FF ; |XXXXXXXX| $BA90

    jmp    LB600                 ; 3

LBA94:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    ENABL                 ; 3
    sta    COLUBK                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    jmp    LBFF0                 ; 3

LBAA9:
    dec    $A6                   ; 5
    bmi    LBA94                 ; 2³
LBAAD:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    lda    ($A2),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    #$BB                  ; 2
    sta    $AE                   ; 3
    sta    HMCLR                 ; 3
    dec    $A6                   ; 5
    bmi    LBAE5                 ; 2³
    cpy    #2                    ; 2
    bne    LBAAD                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    lda    ($A2),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    dec    $9F                   ; 5
    bmi    LBB05                 ; 2³+1
    lda    #$0A                  ; 2
    cmp    $A4                   ; 3
    bcc    LBADE                 ; 2³
    sta    $A4                   ; 3
LBADE:
    sec                          ; 2
    lda    ($A2),Y               ; 5
    dec    $A6                   ; 5
    bpl    LBAE8                 ; 2³
LBAE5:
    jmp    LBA94                 ; 3

LBAE8:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    ldy    #4                    ; 2
    lda    $A4                   ; 3
    sbc    #5                    ; 2
    sta    $A4                   ; 3
    lda    $A2                   ; 3
    sbc    #5                    ; 2
    sta    $A2                   ; 3
    dec    $A6                   ; 5
    bmi    LBAE5                 ; 2³+1
    jmp    LBB35                 ; 3

LBB05:
    lda    $9B,X                 ; 4
    sta    $A4                   ; 3
    lda    $99,X                 ; 4
    sta    COLUP1                ; 3
    lda    $97,X                 ; 4
    sta    HMP1                  ; 3
    and    #$07                  ; 2
    ora    #$B0                  ; 2
    sta    $A5                   ; 3
    dec    $A6                   ; 5
    bmi    LBAE5                 ; 2³+1
    lda    ($A2),Y               ; 5
    ldy    #4                    ; 2
    dec    $A6                   ; 5
    sta    GRP0                  ; 3
    bmi    LBAE5                 ; 2³+1
    lda    $A2                   ; 3
    sbc    #5                    ; 2
    sta    $A2                   ; 3
    nop                          ; 2
    jmp.ind ($00AD)              ; 5

LBB2F:  ; indirect jump
    lda    ($A2),Y               ; 5
LBB31:  ; indirect jump
    lda    ($A2),Y               ; 5
LBB33:  ; indirect jump
    sta    RESP1                 ; 3
LBB35:
    lda    ($A2),Y               ; 5
    tax                          ; 2
    lda    ($A4),Y               ; 5
    jmp    LBB54                 ; 3

LBB3D:  ; indirect jump
    lda    ($A2),Y               ; 5
LBB3F:  ; indirect jump
    lda    ($A2),Y               ; 5
LBB41:  ; indirect jump
    lda    ($A2),Y               ; 5
LBB43:  ; indirect jump
    lda    ($A2),Y               ; 5
LBB45:  ; indirect jump
    lda    ($A2),Y               ; 5
LBB47:  ; indirect jump
    lda    ($A2),Y               ; 5
LBB49:  ; indirect jump
    lda    ($A2),Y               ; 5
LBB4B:  ; indirect jump
    lda    ($A2),Y               ; 5
    nop                          ; 2
    tax                          ; 2
    lda    ($A4),Y               ; 5
    sta    RESP1_mirror          ; 4
LBB54:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    stx    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    $C6                   ; 3
    sta    PF0                   ; 3
    lda    $C7                   ; 3
    sta    PF1                   ; 3
    lda    $C8                   ; 3
    sta    PF2                   ; 3
    lda    $CB                   ; 3
    sta    PF0                   ; 3
    lda    $CA                   ; 3
    sta    PF1                   ; 3
    dey                          ; 2
    lda    $C9                   ; 3
    sta    PF2_mirror            ; 4
    dec    $94                   ; 5
    bpl    LBB7E                 ; 2³
    lda    #$0A                  ; 2
    sta    $A2                   ; 3
LBB7E:
    dec    $A6                   ; 5
    bmi    LBBF4                 ; 2³
    lda    ($A2),Y               ; 5
LBB84:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    $C0                   ; 3
    sta    PF0                   ; 3
    lda    $C1                   ; 3
    sta    PF1                   ; 3
    lda    $C2                   ; 3
    sta    PF2                   ; 3
    lda    $C5                   ; 3
    sta    PF0                   ; 3
    lda    $C4                   ; 3
    sta    PF1                   ; 3
    lda    $C3                   ; 3
    sta    PF2_mirror            ; 4
    dey                          ; 2
    lda    ($A2),Y               ; 5
    dec    $A6                   ; 5
    bmi    LBBF4                 ; 2³
    cpy    #1                    ; 2
    bne    LBB84                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    $C6                   ; 3
    sta    PF0                   ; 3
    lda    $C7                   ; 3
    sta    PF1                   ; 3
    lda    $C8                   ; 3
    sta    PF2                   ; 3
    lda    $CB                   ; 3
    sta    PF0                   ; 3
    lda    $CA                   ; 3
    sta    PF1                   ; 3
    lda    $C9                   ; 3
    sta    PF2_mirror            ; 4
    ldx    #$0A                  ; 2
    cpx    $A2                   ; 3
    bcc    LBBD9                 ; 2³
    stx    $A2                   ; 3
LBBD9:
    dec    $A6                   ; 5
    bmi    LBBF4                 ; 2³
    dey                          ; 2
    lda    ($A2),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    $BD                   ; 3
    sta    PF0                   ; 3
    lda    $BE                   ; 3
    sta    PF1                   ; 3
    lda    $BF                   ; 3
    sta    PF2                   ; 3
LBBF4:
    jmp    LBA94                 ; 3

LBBF7:
    dec    $A6                   ; 5
    bmi    LBC20                 ; 2³+1
LBBFB:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    #$BC                  ; 2
    sta    $AE                   ; 3
    sta    HMCLR                 ; 3
    dey                          ; 2
    lda    ($A2),Y               ; 5
    dec    $A6                   ; 5
    bmi    LBC20                 ; 2³
    cpy    #1                    ; 2
    bne    LBBFB                 ; 2³+1
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    dec    $A6                   ; 5
    bpl    LBC23                 ; 2³
LBC20:
    jmp    LBA94                 ; 3

LBC23:
    dey                          ; 2
    ldx    $B0                   ; 3
    dec    $9F                   ; 5
    bmi    LBC54                 ; 2³
    lda    #$0A                  ; 2
    cmp    $A4                   ; 3
    bcc    LBC32                 ; 2³
    sta    $A4                   ; 3
LBC32:
    sec                          ; 2
    lda    ($A2),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    $B2                   ; 3
    sta    PF0                   ; 3
    lda    $B3                   ; 3
    sta    PF1                   ; 3
    lda    $B4                   ; 3
    sta    PF2                   ; 3
    ldy    #4                    ; 2
    lda    $A4                   ; 3
    sbc    #5                    ; 2
    sta    $A4                   ; 3
    jmp    LBC87                 ; 3

LBC54:
    lda    $97,X                 ; 4
    sta    HMP1_mirror           ; 4
    and    #$07                  ; 2
    ora    #$B0                  ; 2
    sta    $A5                   ; 3
    lda    $99,X                 ; 4
    sta    COLUP1                ; 3
    lda    $9B,X                 ; 4
    sta    $A4                   ; 3
    lda    ($A2),Y               ; 5
    tax                          ; 2
    ldy    #4                    ; 2
    lda    $B4                   ; 3
    sta    PF2                   ; 3
    stx    GRP0                  ; 3
    lda    $B2                   ; 3
    sta    PF0                   ; 3
    lda    $B3                   ; 3
    sta    PF1                   ; 3
    jmp.ind ($00AD)              ; 5

LBC7D:  ; indirect jump
    lda    ($A2),Y               ; 5
LBC7F:  ; indirect jump
    lda    ($A2),Y               ; 5
LBC81:  ; indirect jump
    lda    ($A2),Y               ; 5
LBC83:  ; indirect jump
    lda    ($A2),Y               ; 5
LBC85:  ; indirect jump
    sta    RESP1                 ; 3
LBC87:
    dec    $A6                   ; 5
    bpl    LBC8E                 ; 2³
    jmp    LBA94                 ; 3

LBC8E:
    lda    $A2                   ; 3
    sbc    #5                    ; 2
    sta    $A2                   ; 3
    lda    ($A2),Y               ; 5
    jmp    LBCB6                 ; 3

    lda    ($A2),Y               ; 5
    lda    ($A2),Y               ; 5
    lda    ($A2),Y               ; 5
    lda    ($A2),Y               ; 5
    lda    ($A2),Y               ; 5
LBCA3:  ; indirect jump
    lda    $A2                   ; 3
    sbc    #5                    ; 2
    sta    $A2                   ; 3
    nop                          ; 2
    nop                          ; 2
    lda    ($A2),Y               ; 5
    dec    $A6                   ; 5
    bpl    LBCB4                 ; 2³
    jmp    LBA94                 ; 3

LBCB4:
    sta    RESP1                 ; 3
LBCB6:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    $B9                   ; 3
    sta    PF0                   ; 3
    lda    $BA                   ; 3
    sta    PF1                   ; 3
    lda    $BC                   ; 3
    sta    PF0                   ; 3
    lda    $BB                   ; 3
    sta    PF1                   ; 3
    dec    $94                   ; 5
    bpl    LBCD8                 ; 2³
    lda    #$0A                  ; 2
    sta    $A2                   ; 3
LBCD8:
    dec    $A6                   ; 5
    bmi    LBD39                 ; 2³+1
    dey                          ; 2
    lda    ($A2),Y               ; 5
LBCDF:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    $B5                   ; 3
    sta    PF0                   ; 3
    lda    $B6                   ; 3
    sta    PF1                   ; 3
    dey                          ; 2
    lda    ($A2),Y               ; 5
    ldx    $B8                   ; 3
    stx    PF0                   ; 3
    ldx    $B7                   ; 3
    stx    PF1                   ; 3
    dec    $A6                   ; 5
    bmi    LBD39                 ; 2³+1
    cpy    #1                    ; 2
    bne    LBCDF                 ; 2³+1
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ($A4),Y               ; 5
    sta    GRP1                  ; 3
    lda    $B9                   ; 3
    sta    PF0                   ; 3
    lda    $BA                   ; 3
    sta    PF1                   ; 3
    dey                          ; 2
    lda    #$0A                  ; 2
    cmp    $A2                   ; 3
    bcc    LBD1B                 ; 2³
    sta    $A2                   ; 3
LBD1B:
    lda    $BB                   ; 3
    sta    PF1                   ; 3
    lda    $BC                   ; 3
    sta    PF0                   ; 3
    lda    ($A4),Y               ; 5
    dec    $A6                   ; 5
    bmi    LBD39                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    lda    ($A2),Y               ; 5
    sta    GRP0                  ; 3
    lda    $B2                   ; 3
    sta    PF0                   ; 3
    lda    $B3                   ; 3
    sta    PF1                   ; 3
LBD39:
    jmp    LBA94                 ; 3

    .byte $37 ; |  XX XXX| $BD3C
    .byte $74 ; | XXX X  | $BD3D
    .byte $32 ; |  XX  X | $BD3E
    .byte $71 ; | XXX   X| $BD3F
    .byte $2D ; |  X XX X| $BD40
    .byte $77 ; | XXX XXX| $BD41
    .byte $2D ; |  X XX X| $BD42
    .byte $71 ; | XXX   X| $BD43
    .byte $2D ; |  X XX X| $BD44
    .byte $77 ; | XXX XXX| $BD45
    .byte $2D ; |  X XX X| $BD46
    .byte $6F ; | XX XXXX| $BD47
    .byte $2B ; |  X X XX| $BD48
    .byte $77 ; | XXX XXX| $BD49
    .byte $2B ; |  X X XX| $BD4A
    .byte $6F ; | XX XXXX| $BD4B
    .byte $2B ; |  X X XX| $BD4C
    .byte $77 ; | XXX XXX| $BD4D
    .byte $2B ; |  X X XX| $BD4E
    .byte $6F ; | XX XXXX| $BD4F
    .byte $2B ; |  X X XX| $BD50
    .byte $77 ; | XXX XXX| $BD51
    .byte $2B ; |  X X XX| $BD52
    .byte $CF ; |XX  XXXX| $BD53
    .byte $2B ; |  X X XX| $BD54
    .byte $77 ; | XXX XXX| $BD55
    .byte $2F ; |  X XXXX| $BD56
    .byte $71 ; | XXX   X| $BD57
    .byte $2D ; |  X XX X| $BD58
    .byte $77 ; | XXX XXX| $BD59
    .byte $2D ; |  X XX X| $BD5A
    .byte $72 ; | XXX  X | $BD5B
    .byte $37 ; |  XX XXX| $BD5C
    .byte $74 ; | XXX X  | $BD5D
    .byte $32 ; |  XX  X | $BD5E
    .byte $71 ; | XXX   X| $BD5F
    .byte $2D ; |  X XX X| $BD60
    .byte $77 ; | XXX XXX| $BD61
    .byte $2D ; |  X XX X| $BD62
    .byte $71 ; | XXX   X| $BD63
    .byte $2D ; |  X XX X| $BD64
    .byte $77 ; | XXX XXX| $BD65
    .byte $2D ; |  X XX X| $BD66
    .byte $72 ; | XXX  X | $BD67
    .byte $2E ; |  X XXX | $BD68
    .byte $78 ; | XXXX   | $BD69
    .byte $2E ; |  X XXX | $BD6A
    .byte $D2 ; |XX X  X | $BD6B
    .byte $32 ; |  XX  X | $BD6C
    .byte $70 ; | XXX    | $BD6D
    .byte $2E ; |  X XXX | $BD6E
    .byte $6D ; | XX XX X| $BD6F
    .byte $6D ; | XX XX X| $BD70
    .byte $8D ; |X   XX X| $BD71
    .byte $2D ; |  X XX X| $BD72
    .byte $72 ; | XXX  X | $BD73
    .byte $72 ; | XXX  X | $BD74
    .byte $92 ; |X  X  X | $BD75
    .byte $32 ; |  XX  X | $BD76
    .byte $6D ; | XX XX X| $BD77
    .byte $32 ; |  XX  X | $BD78
    .byte $77 ; | XXX XXX| $BD79
    .byte $32 ; |  XX  X | $BD7A
    .byte $6D ; | XX XX X| $BD7B
    .byte $60 ; | XX     | $BD7C
    .byte $20 ; |  X     | $BD7D
    .byte $15 ; |   X X X| $BD7E
    .byte $16 ; |   X XX | $BD7F
    .byte $15 ; |   X X X| $BD80
    .byte $14 ; |   X X  | $BD81
    .byte $12 ; |   X  X | $BD82
    .byte $14 ; |   X X  | $BD83
    .byte $15 ; |   X X X| $BD84
    .byte $18 ; |   XX   | $BD85
    .byte $15 ; |   X X X| $BD86
    .byte $16 ; |   X XX | $BD87
    .byte $15 ; |   X X X| $BD88
    .byte $3B ; |  XXX XX| $BD89
    .byte $1D ; |   XXX X| $BD8A
    .byte $1B ; |   XX XX| $BD8B
    .byte $18 ; |   XX   | $BD8C
    .byte $15 ; |   X X X| $BD8D
    .byte $16 ; |   X XX | $BD8E
    .byte $15 ; |   X X X| $BD8F
    .byte $14 ; |   X X  | $BD90
    .byte $12 ; |   X  X | $BD91
    .byte $0D ; |    XX X| $BD92
    .byte $0E ; |    XXX | $BD93
    .byte $10 ; |   X    | $BD94
    .byte $12 ; |   X  X | $BD95
    .byte $14 ; |   X X  | $BD96
    .byte $18 ; |   XX   | $BD97
    .byte $7D ; | XXXXX X| $BD98
    .byte $1D ; |   XXX X| $BD99
    .byte $12 ; |   X  X | $BD9A
    .byte $14 ; |   X X  | $BD9B
    .byte $18 ; |   XX   | $BD9C
    .byte $3D ; |  XXXX X| $BD9D
    .byte $1B ; |   XX XX| $BD9E
    .byte $18 ; |   XX   | $BD9F
    .byte $17 ; |   X XXX| $BDA0
    .byte $15 ; |   X X X| $BDA1
    .byte $14 ; |   X X  | $BDA2
    .byte $13 ; |   X  XX| $BDA3
    .byte $B2 ; |X XX  X | $BDA4
    .byte $8D ; |X   XX X| $BDA5
    .byte $0E ; |    XXX | $BDA6
    .byte $12 ; |   X  X | $BDA7
    .byte $15 ; |   X X X| $BDA8
    .byte $1B ; |   XX XX| $BDA9
    .byte $1D ; |   XXX X| $BDAA
    .byte $17 ; |   X XXX| $BDAB
    .byte $13 ; |   X  XX| $BDAC
    .byte $12 ; |   X  X | $BDAD
    .byte $75 ; | XXX X X| $BDAE
    .byte $35 ; |  XX X X| $BDAF
    .byte $FF ; |XXXXXXXX| $BDB0
    .byte $60 ; | XX     | $BDB1
    .byte $60 ; | XX     | $BDB2
    .byte $CB ; |XX  X XX| $BDB3
    .byte $94 ; |X  X X  | $BDB4
    .byte $34 ; |  XX X  | $BDB5
    .byte $35 ; |  XX X X| $BDB6
    .byte $34 ; |  XX X  | $BDB7
    .byte $7A ; | XXXX X | $BDB8
    .byte $3A ; |  XXX X | $BDB9
    .byte $71 ; | XXX   X| $BDBA
    .byte $31 ; |  XX   X| $BDBB
    .byte $73 ; | XXX  XX| $BDBC
    .byte $34 ; |  XX X  | $BDBD
    .byte $77 ; | XXX XXX| $BDBE
    .byte $34 ; |  XX X  | $BDBF
    .byte $73 ; | XXX  XX| $BDC0
    .byte $73 ; | XXX  XX| $BDC1
    .byte $33 ; |  XX  XX| $BDC2
    .byte $20 ; |  X     | $BDC3
    .byte $2F ; |  X XXXX| $BDC4
    .byte $30 ; |  XX    | $BDC5
    .byte $2F ; |  X XXXX| $BDC6
    .byte $33 ; |  XX  XX| $BDC7
    .byte $34 ; |  XX X  | $BDC8
    .byte $33 ; |  XX  XX| $BDC9
    .byte $77 ; | XXX XXX| $BDCA
    .byte $37 ; |  XX XXX| $BDCB
    .byte $71 ; | XXX   X| $BDCC
    .byte $31 ; |  XX   X| $BDCD
    .byte $74 ; | XXX X  | $BDCE
    .byte $35 ; |  XX X X| $BDCF
    .byte $74 ; | XXX X  | $BDD0
    .byte $33 ; |  XX  XX| $BDD1
    .byte $71 ; | XXX   X| $BDD2
    .byte $33 ; |  XX  XX| $BDD3
    .byte $74 ; | XXX X  | $BDD4
    .byte $37 ; |  XX XXX| $BDD5
    .byte $CB ; |XX  X XX| $BDD6
    .byte $94 ; |X  X X  | $BDD7
    .byte $34 ; |  XX X  | $BDD8
    .byte $35 ; |  XX X X| $BDD9
    .byte $34 ; |  XX X  | $BDDA
    .byte $71 ; | XXX   X| $BDDB
    .byte $31 ; |  XX   X| $BDDC
    .byte $74 ; | XXX X  | $BDDD
    .byte $34 ; |  XX X  | $BDDE
    .byte $D2 ; |XX X  X | $BDDF
    .byte $92 ; |X  X  X | $BDE0
    .byte $32 ; |  XX  X | $BDE1
    .byte $34 ; |  XX X  | $BDE2
    .byte $32 ; |  XX  X | $BDE3
    .byte $6F ; | XX XXXX| $BDE4
    .byte $6F ; | XX XXXX| $BDE5
    .byte $20 ; |  X     | $BDE6
    .byte $8F ; |X   XXXX| $BDE7
    .byte $31 ; |  XX   X| $BDE8
    .byte $32 ; |  XX  X | $BDE9
    .byte $34 ; |  XX X  | $BDEA
    .byte $2D ; |  X XX X| $BDEB
    .byte $20 ; |  X     | $BDEC
    .byte $34 ; |  XX X  | $BDED
    .byte $35 ; |  XX X X| $BDEE
    .byte $38 ; |  XXX   | $BDEF
    .byte $3B ; |  XXX XX| $BDF0
    .byte $32 ; |  XX  X | $BDF1
    .byte $20 ; |  X     | $BDF2
    .byte $31 ; |  XX   X| $BDF3
    .byte $74 ; | XXX X  | $BDF4
    .byte $74 ; | XXX X  | $BDF5
    .byte $74 ; | XXX X  | $BDF6
    .byte $60 ; | XX     | $BDF7
    .byte $FF ; |XXXXXXXX| $BDF8
    .byte $FF ; |XXXXXXXX| $BDF9
    .byte $FF ; |XXXXXXXX| $BDFA
    .byte $FF ; |XXXXXXXX| $BDFB
    .byte $FF ; |XXXXXXXX| $BDFC
    .byte $FF ; |XXXXXXXX| $BDFD
    .byte $FF ; |XXXXXXXX| $BDFE
    .byte $FF ; |XXXXXXXX| $BDFF

LBE00:  ; indirect jump
    lda    $B4                   ; 3
    sta    PF2                   ; 3
    ldy    #4                    ; 2
    sty    $9F                   ; 3
    lda    $99,X                 ; 4
    sta    COLUP1                ; 3
    lda    $9B,X                 ; 4
    sta    $A4                   ; 3
    lda    $A2                   ; 3
    sbc    #5                    ; 2
    sta    $A2                   ; 3
    lda    ($A2),Y               ; 5
    lda    ($A2),Y               ; 5
    lda    ($A2),Y               ; 5
    nop                          ; 2
    sta    RESP1                 ; 3
    jmp    LB904                 ; 3

LBE22:  ; indirect jump
    lda    ($A2),Y               ; 5
LBE24:  ; indirect jump
    lda    $B4                   ; 3
    sta    PF2                   ; 3
    ldy    #4                    ; 2
    sty    $9F                   ; 3
    lda    $99,X                 ; 4
    sta    COLUP1                ; 3
    lda    $9B,X                 ; 4
    sta    $A4                   ; 3
    lda    $A2                   ; 3
    sbc    #5                    ; 2
    sta    $A2                   ; 3
    lda    ($A2),Y               ; 5
    nop                          ; 2
    sta    RESP1                 ; 3
    jmp    LB902                 ; 3

LBE42:  ; indirect jump
    lda    ($A2),Y               ; 5
LBE44:  ; indirect jump
    lda    $B4                   ; 3
    sta    PF2                   ; 3
    ldy    #4                    ; 2
    sty    $9F                   ; 3
    lda    $99,X                 ; 4
    sta    COLUP1                ; 3
    lda    $9B,X                 ; 4
    sta    $A4                   ; 3
    lda    $A2                   ; 3
    nop                          ; 2
    sta    RESP1                 ; 3
    sbc    #5                    ; 2
    sta    $A2                   ; 3
    lda    ($A2),Y               ; 5
    jmp    LB902                 ; 3

LBE62:  ; indirect jump
    lda    ($A2),Y               ; 5
LBE64:  ; indirect jump
    lda    $B4                   ; 3
    sta    PF2                   ; 3
    ldy    #4                    ; 2
    sty    $9F                   ; 3
    lda    $99,X                 ; 4
    sta    COLUP1                ; 3
    nop                          ; 2
    sta    RESP1                 ; 3
    lda    $9B,X                 ; 4
    sta    $A4                   ; 3
    lda    $A2                   ; 3
    sbc    #5                    ; 2
    sta    $A2                   ; 3
    lda    ($A2),Y               ; 5
    jmp    LB902                 ; 3

LBE82:  ; indirect jump
    lda    ($A2),Y               ; 5
LBE84:  ; indirect jump
    lda    $B4                   ; 3
    sta    PF2                   ; 3
    ldy    #4                    ; 2
    nop                          ; 2
    sta    RESP1                 ; 3
    sty    $9F                   ; 3
    lda    $99,X                 ; 4
    sta    COLUP1                ; 3
    lda    $9B,X                 ; 4
    sta    $A4                   ; 3
    lda    $A2                   ; 3
    sbc    #5                    ; 2
    sta    $A2                   ; 3
    lda    ($A2),Y               ; 5
    jmp    LB902                 ; 3

LBEA2:  ; indirect jump
    lda    ($A2),Y               ; 5
LBEA4:  ; indirect jump
    sta    RESP1                 ; 3
    lda    $B4                   ; 3
    sta    PF2                   ; 3
    ldy    #4                    ; 2
    sty    $9F                   ; 3
    lda    $99,X                 ; 4
    sta    COLUP1                ; 3
    lda    $9B,X                 ; 4
    sta    $A4                   ; 3
LBEB6:
    lda    $A2                   ; 3
    sbc    #5                    ; 2
    sta    $A2                   ; 3
    lda    ($A2),Y               ; 5
    jmp    LB902                 ; 3

    .byte $92 ; |X  X  X | $BEC1
    .byte $8F ; |X   XXXX| $BEC2
    .byte $98 ; |X  XX   | $BEC3
    .byte $8F ; |X   XXXX| $BEC4
    .byte $92 ; |X  X  X | $BEC5
    .byte $8F ; |X   XXXX| $BEC6
    .byte $98 ; |X  XX   | $BEC7
    .byte $8F ; |X   XXXX| $BEC8
    .byte $90 ; |X  X    | $BEC9
    .byte $8D ; |X   XX X| $BECA
    .byte $98 ; |X  XX   | $BECB
    .byte $8D ; |X   XX X| $BECC
    .byte $92 ; |X  X  X | $BECD
    .byte $8F ; |X   XXXX| $BECE
    .byte $98 ; |X  XX   | $BECF
    .byte $8F ; |X   XXXX| $BED0
    .byte $90 ; |X  X    | $BED1
    .byte $8D ; |X   XX X| $BED2
    .byte $98 ; |X  XX   | $BED3
    .byte $8D ; |X   XX X| $BED4
    .byte $93 ; |X  X  XX| $BED5
    .byte $8D ; |X   XX X| $BED6
    .byte $98 ; |X  XX   | $BED7
    .byte $8D ; |X   XX X| $BED8
    .byte $92 ; |X  X  X | $BED9
    .byte $8F ; |X   XXXX| $BEDA
    .byte $9B ; |X  XX XX| $BEDB
    .byte $8F ; |X   XXXX| $BEDC
    .byte $93 ; |X  X  XX| $BEDD
    .byte $98 ; |X  XX   | $BEDE
    .byte $96 ; |X  X XX | $BEDF
    .byte $93 ; |X  X  XX| $BEE0
    .byte $92 ; |X  X  X | $BEE1
    .byte $8F ; |X   XXXX| $BEE2
    .byte $98 ; |X  XX   | $BEE3
    .byte $8F ; |X   XXXX| $BEE4
    .byte $92 ; |X  X  X | $BEE5
    .byte $8F ; |X   XXXX| $BEE6
    .byte $98 ; |X  XX   | $BEE7
    .byte $8F ; |X   XXXX| $BEE8
    .byte $97 ; |X  X XXX| $BEE9
    .byte $8F ; |X   XXXX| $BEEA
    .byte $9F ; |X  XXXXX| $BEEB
    .byte $8F ; |X   XXXX| $BEEC
    .byte $97 ; |X  X XXX| $BEED
    .byte $8F ; |X   XXXX| $BEEE
    .byte $9F ; |X  XXXXX| $BEEF
    .byte $8F ; |X   XXXX| $BEF0
    .byte $8F ; |X   XXXX| $BEF1
    .byte $8F ; |X   XXXX| $BEF2
    .byte $94 ; |X  X X  | $BEF3
    .byte $8F ; |X   XXXX| $BEF4
    .byte $98 ; |X  XX   | $BEF5
    .byte $94 ; |X  X X  | $BEF6
    .byte $9F ; |X  XXXXX| $BEF7
    .byte $98 ; |X  XX   | $BEF8
    .byte $34 ; |  XX X  | $BEF9
    .byte $20 ; |  X     | $BEFA
    .byte $00 ; |        | $BEFB
    .byte $34 ; |  XX X  | $BEFC
    .byte $20 ; |  X     | $BEFD
    .byte $6F ; | XX XXXX| $BEFE
    .byte $2F ; |  X XXXX| $BEFF

LBF00:  ; indirect jump
    lda    ($A2),Y               ; 5
LBF02:  ; indirect jump
    sta    RESP0                 ; 3
    jmp    LB7F5                 ; 3

LBF07:  ; indirect jump
    lda    ($A2),Y               ; 5
LBF09:  ; indirect jump
    lda    $BF                   ; 3
    sta    PF2                   ; 3
    lda    $8C,X                 ; 4
    sta    RESP0                 ; 3
    jmp    LB7FB                 ; 3

LBF14:  ; indirect jump
    lda    ($A2),Y               ; 5
LBF16:  ; indirect jump
    lda    $BF                   ; 3
    sta    PF2                   ; 3
    lda    $8C,X                 ; 4
    sta    $A2                   ; 3
    lda    $88,X                 ; 4
    sta    COLUP0                ; 3
    sta    RESP0                 ; 3
    jmp    LB801                 ; 3

LBF27:  ; indirect jump
    lda    ($A2),Y               ; 5
LBF29:  ; indirect jump
    lda    $BF                   ; 3
    sta    PF2                   ; 3
    lda    $8C,X                 ; 4
    sta    $A2                   ; 3
    lda    $88,X                 ; 4
    sta    COLUP0                ; 3
    ldy    #4                    ; 2
    sty    $94                   ; 3
    lda    $A4                   ; 3
    sbc    #5                    ; 2
    sta    RESP0                 ; 3
    jmp    LB809                 ; 3

LBF42:  ; indirect jump
    lda    ($A2),Y               ; 5
LBF44:  ; indirect jump
    lda    $BF                   ; 3
    sta    PF2                   ; 3
    lda    $8C,X                 ; 4
    sta    $A2                   ; 3
    lda    $88,X                 ; 4
    sta    COLUP0                ; 3
    ldy    #4                    ; 2
    sty    $94                   ; 3
    lda    $A4                   ; 3
    sbc    #5                    ; 2
    sta    $A4                   ; 3
    nop                          ; 2
    lda    ($A2),Y               ; 5
    sta    RESP0                 ; 3
    jmp    LB80D                 ; 3

LBF62:  ; indirect jump
    lda    $BF                   ; 3
    sta    PF2                   ; 3
    lda    $8C,X                 ; 4
    sta    $A2                   ; 3
    lda    $88,X                 ; 4
    sta    COLUP0                ; 3
    ldy    #4                    ; 2
    sty    $94                   ; 3
    lda    $A4                   ; 3
    sbc    #5                    ; 2
    sta    $A4                   ; 3
    nop                          ; 2
    lda    ($A2),Y               ; 5
    lda    ($A2),Y               ; 5
    lda    ($A2),Y               ; 5
    sta    RESP0                 ; 3
    jmp    LB80F                 ; 3

    .byte $0D ; |    XX X| $BF84
    .byte $0E ; |    XXX | $BF85
    .byte $8D ; |X   XX X| $BF86
    .byte $0D ; |    XX X| $BF87
    .byte $0E ; |    XXX | $BF88
    .byte $8D ; |X   XX X| $BF89
    .byte $0D ; |    XX X| $BF8A
    .byte $0E ; |    XXX | $BF8B
    .byte $0D ; |    XX X| $BF8C
    .byte $B2 ; |X XX  X | $BF8D
    .byte $32 ; |  XX  X | $BF8E
    .byte $11 ; |   X   X| $BF8F
    .byte $12 ; |   X  X | $BF90
    .byte $91 ; |X  X   X| $BF91
    .byte $0D ; |    XX X| $BF92
    .byte $0E ; |    XXX | $BF93
    .byte $8D ; |X   XX X| $BF94
    .byte $72 ; | XXX  X | $BF95
    .byte $32 ; |  XX  X | $BF96
    .byte $37 ; |  XX XXX| $BF97
    .byte $14 ; |   X X  | $BF98
    .byte $15 ; |   X X X| $BF99
    .byte $94 ; |X  X X  | $BF9A
    .byte $18 ; |   XX   | $BF9B
    .byte $19 ; |   XX  X| $BF9C
    .byte $98 ; |X  XX   | $BF9D
    .byte $11 ; |   X   X| $BF9E
    .byte $12 ; |   X  X | $BF9F
    .byte $11 ; |   X   X| $BFA0
    .byte $5D ; | X XXX X| $BFA1
    .byte $34 ; |  XX X  | $BFA2
    .byte $17 ; |   X XXX| $BFA3
    .byte $18 ; |   XX   | $BFA4
    .byte $97 ; |X  X XXX| $BFA5
    .byte $13 ; |   X  XX| $BFA6
    .byte $14 ; |   X X  | $BFA7
    .byte $93 ; |X  X  XX| $BFA8
    .byte $72 ; | XXX  X | $BFA9
    .byte $92 ; |X  X  X | $BFAA
    .byte $32 ; |  XX  X | $BFAB
    .byte $0D ; |    XX X| $BFAC
    .byte $0E ; |    XXX | $BFAD
    .byte $8D ; |X   XX X| $BFAE
    .byte $0D ; |    XX X| $BFAF
    .byte $0E ; |    XXX | $BFB0
    .byte $8D ; |X   XX X| $BFB1
    .byte $0D ; |    XX X| $BFB2
    .byte $0E ; |    XXX | $BFB3
    .byte $0D ; |    XX X| $BFB4
    .byte $52 ; | X X  X | $BFB5
    .byte $2F ; |  X XXXX| $BFB6
    .byte $11 ; |   X   X| $BFB7
    .byte $12 ; |   X  X | $BFB8
    .byte $91 ; |X  X   X| $BFB9
    .byte $17 ; |   X XXX| $BFBA
    .byte $18 ; |   XX   | $BFBB
    .byte $97 ; |X  X XXX| $BFBC
    .byte $71 ; | XXX   X| $BFBD
    .byte $31 ; |  XX   X| $BFBE
    .byte $30 ; |  XX    | $BFBF
    .byte $0F ; |    XXXX| $BFC0
    .byte $10 ; |   X    | $BFC1
    .byte $8F ; |X   XXXX| $BFC2
    .byte $12 ; |   X  X | $BFC3
    .byte $13 ; |   X  XX| $BFC4
    .byte $92 ; |X  X  X | $BFC5
    .byte $0F ; |    XXXX| $BFC6
    .byte $10 ; |   X    | $BFC7
    .byte $8F ; |X   XXXX| $BFC8
    .byte $0B ; |    X XX| $BFC9
    .byte $0C ; |    XX  | $BFCA
    .byte $8B ; |X   X XX| $BFCB
    .byte $1F ; |   XXXXX| $BFCC
    .byte $0A ; |    X X | $BFCD
    .byte $9F ; |X  XXXXX| $BFCE
    .byte $3F ; |  XXXXXX| $BFCF
    .byte $12 ; |   X  X | $BFD0
    .byte $34 ; |  XX X  | $BFD1
    .byte $77 ; | XXX XXX| $BFD2
    .byte $37 ; |  XX XXX| $BFD3
    .byte $FF ; |XXXXXXXX| $BFD4
    .byte $FF ; |XXXXXXXX| $BFD5
    .byte $FF ; |XXXXXXXX| $BFD6
    .byte $FF ; |XXXXXXXX| $BFD7
    .byte $FF ; |XXXXXXXX| $BFD8
    .byte $FF ; |XXXXXXXX| $BFD9

LBFDA:
    sta    BANK_3                ; 4

    .byte $FF ; |XXXXXXXX| $BFDD

START_BANK_1:
    sta    BANK_3                ; 4

LBFE1:
    lda    ($A9),Y               ; 5
    jmp    LBFDA                 ; 3

    .byte $FF ; |XXXXXXXX| $BFE6
    .byte $FF ; |XXXXXXXX| $BFE7
    .byte $FF ; |XXXXXXXX| $BFE8
    .byte $FF ; |XXXXXXXX| $BFE9
    .byte $FF ; |XXXXXXXX| $BFEA
    .byte $FF ; |XXXXXXXX| $BFEB
    .byte $FF ; |XXXXXXXX| $BFEC
    .byte $FF ; |XXXXXXXX| $BFED
    .byte $FF ; |XXXXXXXX| $BFEE
    .byte $FF ; |XXXXXXXX| $BFEF

LBFF0:
    sta    BANK_3                ; 4

LBFF3:
    jmp.ind ($00CC)              ; 5

    .byte $FF ; |XXXXXXXX| $BFF6
    .byte $FF ; |XXXXXXXX| $BFF7
    .byte $FF ; |XXXXXXXX| $BFF8
    .byte $00 ; |        | $BFF9

    .byte $FF ; |XXXXXXXX| $BFFA
    .byte $FF ; |XXXXXXXX| $BFFB

       ORG $2FFC
      RORG $BFFC

    .word START_BANK_1
    .word LB100

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 2
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $3000
      RORG $D000

    FILLED_SPACE 256             ; superchip ram space

START_BANK_2:
    sta    BANK_3                ; 4

LD103:
    sta    $B3                   ; 3
    lda    $DD,X                 ; 4
    and    #$C0                  ; 2
    ora    $B3                   ; 3
    sta    $DD,X                 ; 4
    ldx    $F6                   ; 3
    lda    LD565,X               ; 4
    sta    $A9                   ; 3
    lda    LDAF7,X               ; 4
    sta    $AA                   ; 3
    ldy    LDA46,X               ; 4
    lda    $F3                   ; 3
    cmp    #6                    ; 2
    bne    LD131                 ; 2³
    lda    $D5                   ; 3
    cmp    #$70                  ; 2
    bcs    LD131                 ; 2³
    lda    $D5                   ; 3
    and    #$10                  ; 2
    beq    LD131                 ; 2³
    ldy    LDA4D,X               ; 4
LD131:
    sty    COLUPF                ; 3
    lda    #3                    ; 2
    sta    $AF                   ; 3
    lsr                          ; 2
    sta    $B0                   ; 3
    lda    #$B1                  ; 2
    sta    $A5                   ; 3
    sta    $A3                   ; 3
    lda    #$0A                  ; 2
    sta    $A4                   ; 3
    sta    $A2                   ; 3
    lda    #$78                  ; 2
    sta    $90                   ; 3
    lsr                          ; 2
    sta    $9E                   ; 3
    sta    $93                   ; 3
    lda    #$64                  ; 2
    sta    $91                   ; 3
    lda    #$50                  ; 2
    sta    $9D                   ; 3
    sta    $92                   ; 3
    lsr                          ; 2
    sta    $9F                   ; 3
    sta    $94                   ; 3
    ldy    $D0                   ; 3
    lda    LD900,Y               ; 4
    lsr                          ; 2
    bcs    LD16C                 ; 2³
    tax                          ; 2
    lda    LDB00,Y               ; 4
    bcc    LD172                 ; 3   always branch

LD16C:
    tax                          ; 2
    lda    LDB00,Y               ; 4
    adc    #9                    ; 2
LD172:
    tay                          ; 2
    stx    $AB                   ; 3
    sty    $AC                   ; 3
    txa                          ; 2
    asl                          ; 2
    asl                          ; 2
    tax                          ; 2
    adc    LD594,Y               ; 4
    sta    $B4                   ; 3
    txa                          ; 2
    adc    LD5B8,Y               ; 4
    sta    $B5                   ; 3
    lda    LD607,Y               ; 4
    sta    $B7                   ; 3
    ldx    #4                    ; 2
    lda    $BF                   ; 3
    bmi    LD192                 ; 2³
    inx                          ; 2
LD192:
    stx    $B2                   ; 3
    lda    $DD,X                 ; 4
    and    #$3F                  ; 2
    tay                          ; 2
    lda    LDA54,Y               ; 4
    sta    $9A                   ; 3
    lda    LDDE9,Y               ; 4
    sta    $9C                   ; 3
    lda    LDCDB,Y               ; 4
    sta    $98                   ; 3
    jsr    LD641                 ; 6
    adc    $9C                   ; 3
    sta    $9C                   ; 3
    txa                          ; 2
    asl                          ; 2
    sec                          ; 2
    sbc    #1                    ; 2
    sec                          ; 2
    sbc    $B5                   ; 3
    sta    $9F                   ; 3
    ldy    $B2                   ; 3
    lda.wy $E4,Y                 ; 4
    tay                          ; 2
    lda    LD74B,Y               ; 4
    and    #$F0                  ; 2
    ora    $98                   ; 3
    sta    $98                   ; 3
    lda    LD74B,Y               ; 4
    and    #$0F                  ; 2
    sta    $B8                   ; 3
    tay                          ; 2
    txa                          ; 2
    ldx    $9F                   ; 3
    ror                          ; 2
    bcs    LD1E3                 ; 2³
    lda    LD699,Y               ; 4
    cpx    $B7                   ; 3
    bcc    LD1ED                 ; 2³
    lda    LD6C5,Y               ; 4
    jmp    LD1ED                 ; 3

LD1E3:
    lda    LD6AF,Y               ; 4
    cpx    $B7                   ; 3
    bcc    LD1ED                 ; 2³
    lda    LD6D0,Y               ; 4
LD1ED:
    sta    $96                   ; 3
    ldx    #4                    ; 2
    lda    $BF                   ; 3
    bpl    LD1FC                 ; 2³
    lda    $BE                   ; 3
    bmi    LD25B                 ; 2³+1
    inx                          ; 2
    bpl    LD200                 ; 2³+1
LD1FC:
    lda    $BD                   ; 3
    bmi    LD25B                 ; 2³
LD200:
    stx    $B2                   ; 3
    lda    $DD,X                 ; 4
    and    #$3F                  ; 2
    tay                          ; 2
    lda    LDA54,Y               ; 4
    sta    $99                   ; 3
    lda    LDDE9,Y               ; 4
    sta    $9B                   ; 3
    lda    LDCDB,Y               ; 4
    sta    $97                   ; 3
    jsr    LD641                 ; 6
    adc    $9B                   ; 3
    sta    $9B                   ; 3
    txa                          ; 2
    asl                          ; 2
    sec                          ; 2
    sbc    #1                    ; 2
    sec                          ; 2
    sbc    $B5                   ; 3
    sta    $9E                   ; 3
    ldy    $B2                   ; 3
    lda.wy $E4,Y                 ; 4
    tay                          ; 2
    lda    LD74B,Y               ; 4
    and    #$F0                  ; 2
    ora    $97                   ; 3
    sta    $97                   ; 3
    lda    LD74B,Y               ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    txa                          ; 2
    ldx    $9E                   ; 3
    ror                          ; 2
    bcs    LD24F                 ; 2³
    lda    LD699,Y               ; 4
    cpx    $B7                   ; 3
    bcc    LD259                 ; 2³
    lda    LD6C5,Y               ; 4
    jmp    LD259                 ; 3

LD24F:
    lda    LD6AF,Y               ; 4
    cpx    $B7                   ; 3
    bcc    LD259                 ; 2³
    lda    LD6D0,Y               ; 4
LD259:
    sta    $95                   ; 3
LD25B:
    ldy    $B6                   ; 3
    bne    LD266                 ; 2³
    lda    $C1                   ; 3
    bpl    LD266                 ; 2³
    jmp    LD3A8                 ; 3

LD266:
    ldx    $C6,Y                 ; 4
    jsr    LD61B                 ; 6
    sta    $8B                   ; 3
    lda    LDDDD,Y               ; 4
    sta    $8F                   ; 3
    lda    LD6DB,Y               ; 4
    sta    $87                   ; 3
    jsr    LD64D                 ; 6
    adc    $8F                   ; 3
    sta    $8F                   ; 3
    txa                          ; 2
    asl                          ; 2
    clc                          ; 2
    adc    #1                    ; 2
    sec                          ; 2
    sbc    $B4                   ; 3
    sta    $94                   ; 3
    ldy    $B6                   ; 3
    lda.wy $C6,Y                 ; 4
    tay                          ; 2
    lda.wy $E4,Y                 ; 4
    tay                          ; 2
    lda    LD74B,Y               ; 4
    and    #$F0                  ; 2
    ora    $87                   ; 3
    sta    $87                   ; 3
    lda    LD74B,Y               ; 4
    and    #$0F                  ; 2
    sta    $B3                   ; 3
    tay                          ; 2
    txa                          ; 2
    ror                          ; 2
    bcs    LD2AD                 ; 2³
    lda    LD6A4,Y               ; 4
    jmp    LD2B0                 ; 3

LD2AD:
    lda    LD6BA,Y               ; 4
LD2B0:
    sta    $83                   ; 3
    dec    $B6                   ; 5
    ldy    $B6                   ; 3
    bpl    LD2BB                 ; 2³
    jmp    LD3A8                 ; 3

LD2BB:
    ldx    $C6,Y                 ; 4
    jsr    LD61B                 ; 6
    sta    $8A                   ; 3
    lda    LDDDD,Y               ; 4
    sta    $8E                   ; 3
    lda    LD6DB,Y               ; 4
    sta    $86                   ; 3
    jsr    LD64D                 ; 6
    adc    $8E                   ; 3
    sta    $8E                   ; 3
    txa                          ; 2
    asl                          ; 2
    clc                          ; 2
    adc    #1                    ; 2
    sec                          ; 2
    sbc    $B4                   ; 3
    sta    $93                   ; 3
    ldy    $B6                   ; 3
    lda.wy $C6,Y                 ; 4
    tay                          ; 2
    lda.wy $E4,Y                 ; 4
    tay                          ; 2
    lda    LD74B,Y               ; 4
    and    #$F0                  ; 2
    ora    $86                   ; 3
    sta    $86                   ; 3
    lda    LD74B,Y               ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    txa                          ; 2
    ror                          ; 2
    bcs    LD300                 ; 2³+1
    lda    LD6A4,Y               ; 4
    jmp    LD303                 ; 3

LD300:
    lda    LD6BA,Y               ; 4
LD303:
    sta    $82                   ; 3
    dec    $B6                   ; 5
    ldy    $B6                   ; 3
    bpl    LD30E                 ; 2³
    jmp    LD3A8                 ; 3

LD30E:
    ldx    $C6,Y                 ; 4
    jsr    LD61B                 ; 6
    sta    $89                   ; 3
    lda    LDDDD,Y               ; 4
    sta    $8D                   ; 3
    lda    LD6DB,Y               ; 4
    sta    $85                   ; 3
    jsr    LD64D                 ; 6
    adc    $8D                   ; 3
    sta    $8D                   ; 3
    txa                          ; 2
    asl                          ; 2
    clc                          ; 2
    adc    #1                    ; 2
    sec                          ; 2
    sbc    $B4                   ; 3
    sta    $92                   ; 3
    ldy    $B6                   ; 3
    lda.wy $C6,Y                 ; 4
    tay                          ; 2
    lda.wy $E4,Y                 ; 4
    tay                          ; 2
    lda    LD74B,Y               ; 4
    and    #$F0                  ; 2
    ora    $85                   ; 3
    sta    $85                   ; 3
    lda    LD74B,Y               ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    txa                          ; 2
    ror                          ; 2
    bcs    LD353                 ; 2³
    lda    LD6A4,Y               ; 4
    jmp    LD356                 ; 3

LD353:
    lda    LD6BA,Y               ; 4
LD356:
    sta    $81                   ; 3
    dec    $B6                   ; 5
    ldy    $B6                   ; 3
    bmi    LD3A8                 ; 2³
    ldx    $C6,Y                 ; 4
    jsr    LD61B                 ; 6
    sta    $88                   ; 3
    lda    LDDDD,Y               ; 4
    sta    $8C                   ; 3
    lda    LD6DB,Y               ; 4
    sta    $84                   ; 3
    jsr    LD64D                 ; 6
    adc    $8C                   ; 3
    sta    $8C                   ; 3
    txa                          ; 2
    asl                          ; 2
    clc                          ; 2
    adc    #1                    ; 2
    sec                          ; 2
    sbc    $B4                   ; 3
    sta    $91                   ; 3
    ldy    $B6                   ; 3
    lda.wy $C6,Y                 ; 4
    tay                          ; 2
    lda.wy $E4,Y                 ; 4
    tay                          ; 2
    lda    LD74B,Y               ; 4
    and    #$F0                  ; 2
    ora    $84                   ; 3
    sta    $84                   ; 3
    lda    LD74B,Y               ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    txa                          ; 2
    ror                          ; 2
    bcs    LD3A3                 ; 2³
    lda    LD6A4,Y               ; 4
    jmp    LD3A6                 ; 3

LD3A3:
    lda    LD6BA,Y               ; 4
LD3A6:
    sta    $80                   ; 3
LD3A8:
    sta    HMCLR                 ; 3
    ldy    $AC                   ; 3
    lda    $91                   ; 3
    sec                          ; 2
    sbc    #6                    ; 2
    sbc    $92                   ; 3
    sta    $91                   ; 3
    lda    $92                   ; 3
    sec                          ; 2
    sbc    #6                    ; 2
    sbc    $93                   ; 3
    sta    $92                   ; 3
    lda    $93                   ; 3
    sec                          ; 2
    sbc    #6                    ; 2
    sec                          ; 2
    sbc    $94                   ; 3
    sta    $93                   ; 3
    lda    $94                   ; 3
    bmi    LD3DD                 ; 2³
    bne    LD413                 ; 2³+1
    lda    LD5CC,Y               ; 4
    bmi    LD413                 ; 2³+1
    clc                          ; 2
    adc    $8F                   ; 3
    sta    $A2                   ; 3
    lda    #5                    ; 2
    jmp    LD3F2                 ; 3

LD3DD:
    eor    #$FF                  ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    $8F                   ; 3
    sec                          ; 2
    sbc    LD5A8,Y               ; 4
    sec                          ; 2
    sbc    LD5F0,X               ; 4
    sta    $A2                   ; 3
    lda    $94                   ; 3
    clc                          ; 2
    adc    #5                    ; 2
LD3F2:
    sta    $94                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    $87                   ; 3
    sta    HMP0                  ; 3
    ldx    ram_B3_mirror         ; 4
LD400:
    dex                          ; 2
    bpl    LD400                 ; 2³
    sta    RESP0                 ; 3
    lda    $8B                   ; 3
    sta    COLUP0                ; 3
    dec    $AF                   ; 5
    lda    $87                   ; 3
    and    #$0F                  ; 2
    ora    #$B0                  ; 2
    sta    $A3                   ; 3
LD413:
    ldy    $AC                   ; 3
    lda    $9E                   ; 3
    sec                          ; 2
    sbc    #6                    ; 2
    sbc    $9F                   ; 3
    sta    $9E                   ; 3
    lda    $9F                   ; 3
    bmi    LD433                 ; 2³
    bne    LD469                 ; 2³
    lda    LD5DC,Y               ; 4
    bmi    LD469                 ; 2³
    clc                          ; 2
    adc    $9C                   ; 3
    sta    $A4                   ; 3
    lda    #5                    ; 2
    jmp    LD448                 ; 3

LD433:
    eor    #$FF                  ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    $9C                   ; 3
    sec                          ; 2
    sbc    LD5F3,Y               ; 4
    sec                          ; 2
    sbc    LDA74,X               ; 4
    sta    $A4                   ; 3
    lda    $9F                   ; 3
    clc                          ; 2
    adc    #5                    ; 2
LD448:
    sta    $9F                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    $98                   ; 3
    sta    HMP1                  ; 3
    ldx    ram_B8_mirror         ; 4
LD456:
    dex                          ; 2
    bpl    LD456                 ; 2³
    sta    RESP1                 ; 3
    lda    $9A                   ; 3
    sta    COLUP1                ; 3
    dec    $B0                   ; 5
    lda    $98                   ; 3
    and    #$0F                  ; 2
    ora    #$B0                  ; 2
    sta    $A5                   ; 3
LD469:
    lda    #0                    ; 2
    sta    $F7                   ; 3
    lda    INTIM                 ; 4
    cmp    #$0D                  ; 2
    bcs    LD477                 ; 2³
    nop                          ; 2
    bcc    LD47D                 ; 3   always branch

LD477:
    lda    $FC                   ; 3
    and    #$08                  ; 2
    bne    LD480                 ; 2³
LD47D:
    jmp    LD4EF                 ; 3

LD480:
    ldy    #1                    ; 2
    lda    $D0                   ; 3
    cmp    #$28                  ; 2
    bcc    LD48A                 ; 2³
    ldy    #$10                  ; 2
LD48A:
    ldx    #2                    ; 2
    lda    SC_24|READ,Y          ; 4
    and    #$40                  ; 2
    beq    LD4A3                 ; 2³
    sta    $F7                   ; 3
    eor    SC_24|READ,Y          ; 4
    sta    SC_24,Y               ; 5
    lda    SC_5A|READ,Y          ; 4
    and    #$BF                  ; 2
    sta    SC_5A,Y               ; 5
LD4A3:
    lsr    $F7                   ; 5
    ldx    #$BF                  ; 2
    lda    SC_12|READ,Y          ; 4
    and    #$40                  ; 2
    beq    LD4B5                 ; 2³
    ora    $F7                   ; 3
    sta    $F7                   ; 3
    jsr    LD4E0                 ; 6
LD4B5:
    lsr    $F7                   ; 5
    ldx    #$7F                  ; 2
    ldy    $F6                   ; 3
    lda    LD7E3,Y               ; 4
LD4BE:
    sec                          ; 2
    sbc    #$12                  ; 2
    tay                          ; 2
    lda    SC_12|READ,Y          ; 4
    and    #$80                  ; 2
    php                          ; 3
    ora    $F7                   ; 3
    sta    $F7                   ; 3
    plp                          ; 4
    beq    LD4D2                 ; 2³
    jsr    LD4E0                 ; 6
LD4D2:
    cpy    #8                    ; 2
    bcs    LD4EF                 ; 2³
    lsr    $F7                   ; 5
    ldy    $F6                   ; 3
    lda    LD7EA,Y               ; 4
    jmp    LD4BE                 ; 3

LD4E0:
    txa                          ; 2
    and    SC_12|READ,Y          ; 4
    sta    SC_12,Y               ; 5
    txa                          ; 2
    and    SC_48|READ,Y          ; 4
    sta    SC_48,Y               ; 5
    rts                          ; 6

LD4EF:
    ldx    $AB                   ; 3
    ldy    $AC                   ; 3
    stx    $A0                   ; 3
    txa                          ; 2
    asl                          ; 2
    sta    $B1                   ; 3
    adc    $B1                   ; 3
    adc    $B1                   ; 3
    sta    $B1                   ; 3
    lda    LD56C,Y               ; 4
    sta    $A6                   ; 3
    lda    LD580,Y               ; 4
    sta    $A7                   ; 3
    ldx    $A0                   ; 3
    cpy    #8                    ; 2
    bcs    LD519                 ; 2³
    jsr    LD6E7                 ; 6
    jsr    LDEEE                 ; 6
    inx                          ; 2
    jmp    LD547                 ; 3

LD519:
    lda    $B1                   ; 3
    clc                          ; 2
    adc    #3                    ; 2
    sta    $B1                   ; 3
    cpy    #$12                  ; 2
    bcc    LD540                 ; 2³
    tay                          ; 2
    lda    ($A9),Y               ; 5
    sta    PF0                   ; 3
    iny                          ; 2
    lda    ($A9),Y               ; 5
    sta    PF1                   ; 3
    iny                          ; 2
    lda    ($A9),Y               ; 5
    sta    PF2                   ; 3
    iny                          ; 2
    sty    $B1                   ; 3
    inx                          ; 2
    jsr    LD6E7                 ; 6
    jsr    LDEEE                 ; 6
    jmp    LD547                 ; 3

LD540:
    jsr    LDEEE                 ; 6
    inx                          ; 2
    jsr    LD6E7                 ; 6
LD547:
    txs                          ; 2
    ldy    $AC                   ; 3
    sty    $CC                   ; 3
    lda    LD685,Y               ; 4   high
    sta    $CF                   ; 3
    lda    LD671,Y               ; 4   low
    sta    $CE                   ; 3
    ldx    $AF                   ; 3
    lda    $80,X                 ; 4
    sta    $AB                   ; 3
    ldx    $B0                   ; 3
    lda    $95,X                 ; 4
    sta    $AD                   ; 3
    jmp.ind ($00CE)              ; 5

LD565:
    .byte $00 ; |        | $D565
    .byte $6C ; | XX XX  | $D566
    .byte $02 ; |      X | $D567
    .byte $6E ; | XX XXX | $D568
    .byte $13 ; |   X  XX| $D569
    .byte $7F ; | XXXXXXX| $D56A
    .byte $7E ; | XXXXXX | $D56B
LD56C:
    .byte $09 ; |    X  X| $D56C
    .byte $00 ; |        | $D56D
    .byte $01 ; |       X| $D56E
    .byte $02 ; |      X | $D56F
    .byte $03 ; |      XX| $D570
    .byte $04 ; |     X  | $D571
    .byte $05 ; |     X X| $D572
    .byte $06 ; |     XX | $D573
    .byte $07 ; |     XXX| $D574
    .byte $08 ; |    X   | $D575
    .byte $09 ; |    X  X| $D576
    .byte $00 ; |        | $D577
    .byte $01 ; |       X| $D578
    .byte $02 ; |      X | $D579
    .byte $03 ; |      XX| $D57A
    .byte $04 ; |     X  | $D57B
    .byte $05 ; |     X X| $D57C
    .byte $06 ; |     XX | $D57D
    .byte $07 ; |     XXX| $D57E
    .byte $08 ; |    X   | $D57F
LD580:
    .byte $0D ; |    XX X| $D580
    .byte $0E ; |    XXX | $D581
    .byte $0E ; |    XXX | $D582
    .byte $0E ; |    XXX | $D583
    .byte $0E ; |    XXX | $D584
    .byte $0E ; |    XXX | $D585
    .byte $0E ; |    XXX | $D586
    .byte $0D ; |    XX X| $D587
    .byte $0D ; |    XX X| $D588
    .byte $0D ; |    XX X| $D589
    .byte $0D ; |    XX X| $D58A
    .byte $0E ; |    XXX | $D58B
    .byte $0E ; |    XXX | $D58C
    .byte $0E ; |    XXX | $D58D
    .byte $0E ; |    XXX | $D58E
    .byte $0E ; |    XXX | $D58F
    .byte $0E ; |    XXX | $D590
    .byte $0D ; |    XX X| $D591
    .byte $0D ; |    XX X| $D592
    .byte $0D ; |    XX X| $D593
LD594:
    .byte $00 ; |        | $D594
    .byte $00 ; |        | $D595
    .byte $01 ; |       X| $D596
    .byte $01 ; |       X| $D597
    .byte $01 ; |       X| $D598
    .byte $02 ; |      X | $D599
    .byte $02 ; |      X | $D59A
    .byte $02 ; |      X | $D59B
    .byte $02 ; |      X | $D59C
    .byte $02 ; |      X | $D59D
    .byte $02 ; |      X | $D59E
    .byte $02 ; |      X | $D59F
    .byte $03 ; |      XX| $D5A0
    .byte $03 ; |      XX| $D5A1
    .byte $04 ; |     X  | $D5A2
    .byte $04 ; |     X  | $D5A3
    .byte $04 ; |     X  | $D5A4
    .byte $04 ; |     X  | $D5A5
    .byte $04 ; |     X  | $D5A6
    .byte $04 ; |     X  | $D5A7
LD5A8:
    .byte $00 ; |        | $D5A8
    .byte $05 ; |     X X| $D5A9
    .byte $05 ; |     X X| $D5AA
    .byte $05 ; |     X X| $D5AB
    .byte $05 ; |     X X| $D5AC
    .byte $FB ; |XXXXX XX| $D5AD
    .byte $00 ; |        | $D5AE
    .byte $00 ; |        | $D5AF
    .byte $00 ; |        | $D5B0
    .byte $00 ; |        | $D5B1
    .byte $00 ; |        | $D5B2
    .byte $05 ; |     X X| $D5B3
    .byte $05 ; |     X X| $D5B4
    .byte $05 ; |     X X| $D5B5
    .byte $FB ; |XXXXX XX| $D5B6
    .byte $FB ; |XXXXX XX| $D5B7
LD5B8:
    .byte $00 ; |        | $D5B8
    .byte $00 ; |        | $D5B9
    .byte $00 ; |        | $D5BA
    .byte $00 ; |        | $D5BB
    .byte $00 ; |        | $D5BC
    .byte $00 ; |        | $D5BD
    .byte $00 ; |        | $D5BE
    .byte $01 ; |       X| $D5BF
    .byte $01 ; |       X| $D5C0
    .byte $01 ; |       X| $D5C1
    .byte $02 ; |      X | $D5C2
    .byte $02 ; |      X | $D5C3
    .byte $02 ; |      X | $D5C4
    .byte $02 ; |      X | $D5C5
    .byte $02 ; |      X | $D5C6
    .byte $02 ; |      X | $D5C7
    .byte $02 ; |      X | $D5C8
    .byte $03 ; |      XX| $D5C9
    .byte $03 ; |      XX| $D5CA
    .byte $03 ; |      XX| $D5CB
LD5CC:
    .byte $FF ; |XXXXXXXX| $D5CC
    .byte $FF ; |XXXXXXXX| $D5CD
    .byte $FF ; |XXXXXXXX| $D5CE
    .byte $FF ; |XXXXXXXX| $D5CF
    .byte $FF ; |XXXXXXXX| $D5D0
    .byte $05 ; |     X X| $D5D1
    .byte $FF ; |XXXXXXXX| $D5D2
    .byte $FF ; |XXXXXXXX| $D5D3
    .byte $FF ; |XXXXXXXX| $D5D4
    .byte $FF ; |XXXXXXXX| $D5D5
    .byte $FF ; |XXXXXXXX| $D5D6
    .byte $FF ; |XXXXXXXX| $D5D7
    .byte $FF ; |XXXXXXXX| $D5D8
    .byte $FF ; |XXXXXXXX| $D5D9
    .byte $05 ; |     X X| $D5DA
    .byte $05 ; |     X X| $D5DB
LD5DC:
    .byte $FF ; |XXXXXXXX| $D5DC
    .byte $FF ; |XXXXXXXX| $D5DD
    .byte $FF ; |XXXXXXXX| $D5DE
    .byte $FF ; |XXXXXXXX| $D5DF
    .byte $FF ; |XXXXXXXX| $D5E0
    .byte $FF ; |XXXXXXXX| $D5E1
    .byte $FF ; |XXXXXXXX| $D5E2
    .byte $FF ; |XXXXXXXX| $D5E3
    .byte $FF ; |XXXXXXXX| $D5E4
    .byte $05 ; |     X X| $D5E5
    .byte $FF ; |XXXXXXXX| $D5E6
    .byte $FF ; |XXXXXXXX| $D5E7
    .byte $FF ; |XXXXXXXX| $D5E8
    .byte $FF ; |XXXXXXXX| $D5E9
    .byte $FF ; |XXXXXXXX| $D5EA
    .byte $FF ; |XXXXXXXX| $D5EB
    .byte $FF ; |XXXXXXXX| $D5EC
    .byte $FF ; |XXXXXXXX| $D5ED
    .byte $FF ; |XXXXXXXX| $D5EE
    .byte $05 ; |     X X| $D5EF
LD5F0:
    .byte $00 ; |        | $D5F0
    .byte $0A ; |    X X | $D5F1
    .byte $14 ; |   X X  | $D5F2
LD5F3:
    .byte $00 ; |        | $D5F3
    .byte $05 ; |     X X| $D5F4
    .byte $05 ; |     X X| $D5F5
    .byte $05 ; |     X X| $D5F6
    .byte $05 ; |     X X| $D5F7
    .byte $05 ; |     X X| $D5F8
    .byte $0A ; |    X X | $D5F9
    .byte $0A ; |    X X | $D5FA
    .byte $0A ; |    X X | $D5FB
    .byte $0A ; |    X X | $D5FC
    .byte $00 ; |        | $D5FD
    .byte $05 ; |     X X| $D5FE
    .byte $05 ; |     X X| $D5FF
    .byte $05 ; |     X X| $D600
    .byte $05 ; |     X X| $D601
    .byte $05 ; |     X X| $D602
    .byte $0A ; |    X X | $D603
    .byte $0A ; |    X X | $D604
    .byte $0A ; |    X X | $D605
    .byte $0A ; |    X X | $D606
LD607:
    .byte $1B ; |   XX XX| $D607
    .byte $1F ; |   XXXXX| $D608
    .byte $1F ; |   XXXXX| $D609
    .byte $1F ; |   XXXXX| $D60A
    .byte $1D ; |   XXX X| $D60B
    .byte $1D ; |   XXX X| $D60C
    .byte $1D ; |   XXX X| $D60D
    .byte $1C ; |   XXX  | $D60E
    .byte $1C ; |   XXX  | $D60F
    .byte $1C ; |   XXX  | $D610
    .byte $1B ; |   XX XX| $D611
    .byte $1F ; |   XXXXX| $D612
    .byte $1F ; |   XXXXX| $D613
    .byte $1F ; |   XXXXX| $D614
    .byte $1F ; |   XXXXX| $D615
    .byte $1D ; |   XXX X| $D616
    .byte $1D ; |   XXX X| $D617
    .byte $1C ; |   XXX  | $D618
    .byte $1C ; |   XXX  | $D619
    .byte $1C ; |   XXX  | $D61A

LD61B:
    lda    $DD,X                 ; 4
    php                          ; 3
    and    #$3F                  ; 2
    tay                          ; 2
    plp                          ; 4
    bmi    LD63E                 ; 2³
    lda    $D7,X                 ; 4
    and    #$40                  ; 2
    beq    LD63A                 ; 2³
    lda    $D2                   ; 3
    cmp    #$50                  ; 2
    bcs    LD637                 ; 2³
    and    #$08                  ; 2
    bne    LD637                 ; 2³
    lda    #$8E                  ; 2
    rts                          ; 6

LD637:
    lda    #$84                  ; 2
    rts                          ; 6

LD63A:
    lda    LDA70,X               ; 4
    rts                          ; 6

LD63E:
    lda    #$AE                  ; 2
    rts                          ; 6

LD641:
    lda    $EA,X                 ; 4
    clc                          ; 2
    adc    #5                    ; 2
    tay                          ; 2
    bcc    LD64F                 ; 2³
    lda    #$80                  ; 2
    bmi    LD651                 ; 3   always branch

LD64D:
    ldy    $EA,X                 ; 4
LD64F:
    lda    $D7,X                 ; 4
LD651:
    pha                          ; 3
    lda    LD900,Y               ; 4
    sta    $A0                   ; 3
    pla                          ; 4
    bpl    LD66B                 ; 2³
    lda    LDB00,Y               ; 4
    tay                          ; 2
    lda    LD906,Y               ; 4
    clc                          ; 2
    adc    $A0                   ; 3
    adc    #$19                  ; 2
    tax                          ; 2
    lda    LDBF6,Y               ; 4
    rts                          ; 6

LD66B:
    ldx    $A0                   ; 3
    lda    LDB00,Y               ; 4
    rts                          ; 6

LD671:
    .byte <LDCF7         ; $D671
    .byte <LD858         ; $D672
    .byte <LD869         ; $D673
    .byte <LD87A         ; $D674
    .byte <LD88C         ; $D675
    .byte <LD89F         ; $D676
    .byte <LD8AC         ; $D677
    .byte <LD8B9         ; $D678
    .byte <LD8D3         ; $D679
    .byte <LDA93         ; $D67A
    .byte <LDAB2         ; $D67B
    .byte <LDAC3         ; $D67C
    .byte <LDAD6         ; $D67D
    .byte <LDA00         ; $D67E
    .byte <LDA14         ; $D67F
    .byte <LDA1F         ; $D680
    .byte <LDF70         ; $D681
    .byte <LDA2C         ; $D682
    .byte <LDE05         ; $D683
    .byte <LDAE9         ; $D684
LD685:
    .byte >LDCF7         ; $D685
    .byte >LD858         ; $D686
    .byte >LD869         ; $D687
    .byte >LD87A         ; $D688
    .byte >LD88C         ; $D689
    .byte >LD89F         ; $D68A
    .byte >LD8AC         ; $D68B
    .byte >LD8B9         ; $D68C
    .byte >LD8D3         ; $D68D
    .byte >LDA93         ; $D68E
    .byte >LDAB2         ; $D68F
    .byte >LDAC3         ; $D690
    .byte >LDAD6         ; $D691
    .byte >LDA00         ; $D692
    .byte >LDA14         ; $D693
    .byte >LDA1F         ; $D694
    .byte >LDF70         ; $D695
    .byte >LDA2C         ; $D696
    .byte >LDE05         ; $D697
    .byte >LDAE9         ; $D698
LD699:
    .byte <LBEA4         ; $D699
    .byte <LBEA2         ; $D69A
    .byte <LBE84         ; $D69B
    .byte <LBE82         ; $D69C
    .byte <LBE64         ; $D69D
    .byte <LBE62         ; $D69E
    .byte <LBE44         ; $D69F
    .byte <LBE42         ; $D6A0
    .byte <LBE24         ; $D6A1
    .byte <LBE22         ; $D6A2
    .byte <LBE00         ; $D6A3
LD6A4:
    .byte <LBA0B         ; $D6A4
    .byte <LBA09         ; $D6A5
    .byte <LBA07         ; $D6A6
    .byte <LBA05         ; $D6A7
    .byte <LBA03         ; $D6A8
    .byte <LBA2A         ; $D6A9
    .byte <LBA28         ; $D6AA
    .byte <LBA26         ; $D6AB
    .byte <LBA24         ; $D6AC
    .byte <LBA22         ; $D6AD
    .byte <LBA20         ; $D6AE
LD6AF:
    .byte <LB6A7         ; $D6AF
    .byte <LB6A5         ; $D6B0
    .byte <LB6A3         ; $D6B1
    .byte <LB6C2         ; $D6B2
    .byte <LB6C0         ; $D6B3
    .byte <LB6BE         ; $D6B4
    .byte <LB6BC         ; $D6B5
    .byte <LB6BA         ; $D6B6
    .byte <LB6B8         ; $D6B7
    .byte <LB6B6         ; $D6B8
    .byte <LB6B4         ; $D6B9
LD6BA:
    .byte <LBF02         ; $D6BA
    .byte <LBF00         ; $D6BB
    .byte <LBF09         ; $D6BC
    .byte <LBF07         ; $D6BD
    .byte <LBF16         ; $D6BE
    .byte <LBF14         ; $D6BF
    .byte <LBF29         ; $D6C0
    .byte <LBF27         ; $D6C1
    .byte <LBF44         ; $D6C2
    .byte <LBF42         ; $D6C3
    .byte <LBF62         ; $D6C4
LD6C5:
    .byte <LBC85         ; $D6C5
    .byte <LBC83         ; $D6C6
    .byte <LBC81         ; $D6C7
    .byte <LBC7F         ; $D6C8
    .byte <LBC7D         ; $D6C9
    .byte $A3 ; |X X   XX| $D6CA
    .byte $A1 ; |X X    X| $D6CB
    .byte $9F ; |X  XXXXX| $D6CC
    .byte $9D ; |X  XXX X| $D6CD
    .byte $9B ; |X  XX XX| $D6CE
    .byte $99 ; |X  XX  X| $D6CF
LD6D0:
    .byte <LBB33         ; $D6D0
    .byte <LBB31         ; $D6D1
    .byte <LBB2F         ; $D6D2
    .byte <LBB4B         ; $D6D3
    .byte <LBB49         ; $D6D4
    .byte <LBB47         ; $D6D5
    .byte <LBB45         ; $D6D6
    .byte <LBB43         ; $D6D7
    .byte <LBB41         ; $D6D8
    .byte <LBB3F         ; $D6D9
    .byte <LBB3D         ; $D6DA
LD6DB:
    .byte $04 ; |     X  | $D6DB
    .byte $04 ; |     X  | $D6DC
    .byte $04 ; |     X  | $D6DD
    .byte $04 ; |     X  | $D6DE
    .byte $04 ; |     X  | $D6DF
    .byte $04 ; |     X  | $D6E0
    .byte $04 ; |     X  | $D6E1
    .byte $04 ; |     X  | $D6E2
    .byte $01 ; |       X| $D6E3
    .byte $01 ; |       X| $D6E4
    .byte $05 ; |     X X| $D6E5
    .byte $05 ; |     X X| $D6E6

LD6E7:
    ldy    $B1                   ; 3
    lda    ($A9),Y               ; 5
    sta    $B2                   ; 3
    iny                          ; 2
    lda    ($A9),Y               ; 5
    sta    $B3                   ; 3
    iny                          ; 2
    lda    ($A9),Y               ; 5
    sta    $B4                   ; 3
    iny                          ; 2
    sty    $B1                   ; 3
    lda    SC_00|READ,X          ; 4
    and    #$07                  ; 2
    tay                          ; 2
    lda    LD8F7,Y               ; 4
    tay                          ; 2
    and    #$20                  ; 2
    ora    $B2                   ; 3
    sta    $B9                   ; 3
    tya                          ; 2
    and    #$44                  ; 2
    ora    $B3                   ; 3
    sta    $BA                   ; 3
    lda    SC_36|READ,X          ; 4
    and    #$07                  ; 2
    tay                          ; 2
    lda    LD8F7,Y               ; 4
    tay                          ; 2
    and    #$20                  ; 2
    ora    $B2                   ; 3
    sta    $BC                   ; 3
    tya                          ; 2
    and    #$44                  ; 2
    ora    $B3                   ; 3
    sta    $BB                   ; 3
    lda    SC_6C|READ,X          ; 4
    tay                          ; 2
    and    #$20                  ; 2
    ora    $B2                   ; 3
    sta    $B5                   ; 3
    tya                          ; 2
    and    #$44                  ; 2
    ora    $B3                   ; 3
    sta    $B6                   ; 3
    tya                          ; 2
    asl                          ; 2
    asl                          ; 2
    tay                          ; 2
    and    #$20                  ; 2
    ora    $B2                   ; 3
    sta    $B8                   ; 3
    tya                          ; 2
    and    #$44                  ; 2
    ora    $B3                   ; 3
    sta    $B7                   ; 3
    rts                          ; 6

LD74B:
    .byte $40 ; | X      | $D74B
    .byte $30 ; |  XX    | $D74C
    .byte $20 ; |  X     | $D74D
    .byte $10 ; |   X    | $D74E
    .byte $00 ; |        | $D74F
    .byte $F0 ; |XXXX    | $D750
    .byte $E0 ; |XXX     | $D751
    .byte $D0 ; |XX X    | $D752
    .byte $C0 ; |XX      | $D753
    .byte $B0 ; |X XX    | $D754
    .byte $A0 ; |X X     | $D755
    .byte $90 ; |X  X    | $D756
    .byte $80 ; |X       | $D757
    .byte $61 ; | XX    X| $D758
    .byte $51 ; | X X   X| $D759
    .byte $41 ; | X     X| $D75A
    .byte $31 ; |  XX   X| $D75B
    .byte $21 ; |  X    X| $D75C
    .byte $11 ; |   X   X| $D75D
    .byte $01 ; |       X| $D75E
    .byte $F1 ; |XXXX   X| $D75F
    .byte $E1 ; |XXX    X| $D760
    .byte $D1 ; |XX X   X| $D761
    .byte $C1 ; |XX     X| $D762
    .byte $B1 ; |X XX   X| $D763
    .byte $A1 ; |X X    X| $D764
    .byte $91 ; |X  X   X| $D765
    .byte $81 ; |X      X| $D766
    .byte $62 ; | XX   X | $D767
    .byte $52 ; | X X  X | $D768
    .byte $42 ; | X    X | $D769
    .byte $32 ; |  XX  X | $D76A
    .byte $22 ; |  X   X | $D76B
    .byte $12 ; |   X  X | $D76C
    .byte $02 ; |      X | $D76D
    .byte $F2 ; |XXXX  X | $D76E
    .byte $E2 ; |XXX   X | $D76F
    .byte $D2 ; |XX X  X | $D770
    .byte $C2 ; |XX    X | $D771
    .byte $B2 ; |X XX  X | $D772
    .byte $A2 ; |X X   X | $D773
    .byte $92 ; |X  X  X | $D774
    .byte $82 ; |X     X | $D775
    .byte $63 ; | XX   XX| $D776
    .byte $53 ; | X X  XX| $D777
    .byte $43 ; | X    XX| $D778
    .byte $33 ; |  XX  XX| $D779
    .byte $23 ; |  X   XX| $D77A
    .byte $13 ; |   X  XX| $D77B
    .byte $03 ; |      XX| $D77C
    .byte $F3 ; |XXXX  XX| $D77D
    .byte $E3 ; |XXX   XX| $D77E
    .byte $D3 ; |XX X  XX| $D77F
    .byte $C3 ; |XX    XX| $D780
    .byte $B3 ; |X XX  XX| $D781
    .byte $A3 ; |X X   XX| $D782
    .byte $93 ; |X  X  XX| $D783
    .byte $83 ; |X     XX| $D784
    .byte $64 ; | XX  X  | $D785
    .byte $54 ; | X X X  | $D786
    .byte $44 ; | X   X  | $D787
    .byte $34 ; |  XX X  | $D788
    .byte $24 ; |  X  X  | $D789
    .byte $14 ; |   X X  | $D78A
    .byte $04 ; |     X  | $D78B
    .byte $F4 ; |XXXX X  | $D78C
    .byte $E4 ; |XXX  X  | $D78D
    .byte $D4 ; |XX X X  | $D78E
    .byte $C4 ; |XX   X  | $D78F
    .byte $B4 ; |X XX X  | $D790
    .byte $A4 ; |X X  X  | $D791
    .byte $94 ; |X  X X  | $D792
    .byte $84 ; |X    X  | $D793
    .byte $65 ; | XX  X X| $D794
    .byte $55 ; | X X X X| $D795
    .byte $45 ; | X   X X| $D796
    .byte $35 ; |  XX X X| $D797
    .byte $25 ; |  X  X X| $D798
    .byte $15 ; |   X X X| $D799
    .byte $05 ; |     X X| $D79A
    .byte $F5 ; |XXXX X X| $D79B
    .byte $E5 ; |XXX  X X| $D79C
    .byte $D5 ; |XX X X X| $D79D
    .byte $C5 ; |XX   X X| $D79E
    .byte $B5 ; |X XX X X| $D79F
    .byte $A5 ; |X X  X X| $D7A0
    .byte $95 ; |X  X X X| $D7A1
    .byte $85 ; |X    X X| $D7A2
    .byte $66 ; | XX  XX | $D7A3
    .byte $56 ; | X X XX | $D7A4
    .byte $46 ; | X   XX | $D7A5
    .byte $36 ; |  XX XX | $D7A6
    .byte $26 ; |  X  XX | $D7A7
    .byte $16 ; |   X XX | $D7A8
    .byte $06 ; |     XX | $D7A9
    .byte $F6 ; |XXXX XX | $D7AA
    .byte $E6 ; |XXX  XX | $D7AB
    .byte $D6 ; |XX X XX | $D7AC
    .byte $C6 ; |XX   XX | $D7AD
    .byte $B6 ; |X XX XX | $D7AE
    .byte $A6 ; |X X  XX | $D7AF
    .byte $96 ; |X  X XX | $D7B0
    .byte $86 ; |X    XX | $D7B1
    .byte $67 ; | XX  XXX| $D7B2
    .byte $57 ; | X X XXX| $D7B3
    .byte $47 ; | X   XXX| $D7B4
    .byte $37 ; |  XX XXX| $D7B5
    .byte $27 ; |  X  XXX| $D7B6
    .byte $17 ; |   X XXX| $D7B7
    .byte $07 ; |     XXX| $D7B8
    .byte $F7 ; |XXXX XXX| $D7B9
    .byte $E7 ; |XXX  XXX| $D7BA
    .byte $D7 ; |XX X XXX| $D7BB
    .byte $C7 ; |XX   XXX| $D7BC
    .byte $B7 ; |X XX XXX| $D7BD
    .byte $A7 ; |X X  XXX| $D7BE
    .byte $97 ; |X  X XXX| $D7BF
    .byte $87 ; |X    XXX| $D7C0
    .byte $68 ; | XX X   | $D7C1
    .byte $58 ; | X XX   | $D7C2
    .byte $48 ; | X  X   | $D7C3
    .byte $38 ; |  XXX   | $D7C4
    .byte $28 ; |  X X   | $D7C5
    .byte $18 ; |   XX   | $D7C6
    .byte $08 ; |    X   | $D7C7
    .byte $F8 ; |XXXXX   | $D7C8
    .byte $E8 ; |XXX X   | $D7C9
    .byte $D8 ; |XX XX   | $D7CA
    .byte $C8 ; |XX  X   | $D7CB
    .byte $B8 ; |X XXX   | $D7CC
    .byte $A8 ; |X X X   | $D7CD
    .byte $98 ; |X  XX   | $D7CE
    .byte $88 ; |X   X   | $D7CF
    .byte $69 ; | XX X  X| $D7D0
    .byte $59 ; | X XX  X| $D7D1
    .byte $49 ; | X  X  X| $D7D2
    .byte $39 ; |  XXX  X| $D7D3
    .byte $29 ; |  X X  X| $D7D4
    .byte $19 ; |   XX  X| $D7D5
    .byte $09 ; |    X  X| $D7D6
    .byte $F9 ; |XXXXX  X| $D7D7
    .byte $E9 ; |XXX X  X| $D7D8
    .byte $D9 ; |XX XX  X| $D7D9
    .byte $C9 ; |XX  X  X| $D7DA
    .byte $B9 ; |X XXX  X| $D7DB
    .byte $A9 ; |X X X  X| $D7DC
    .byte $99 ; |X  XX  X| $D7DD
    .byte $89 ; |X   X  X| $D7DE
    .byte $6A ; | XX X X | $D7DF
    .byte $5A ; | X XX X | $D7E0
    .byte $4A ; | X  X X | $D7E1
    .byte $3A ; |  XXX X | $D7E2
LD7E3:
    .byte $17 ; |   X XXX| $D7E3
    .byte $16 ; |   X XX | $D7E4
    .byte $17 ; |   X XXX| $D7E5
    .byte $17 ; |   X XXX| $D7E6
    .byte $17 ; |   X XXX| $D7E7
    .byte $17 ; |   X XXX| $D7E8
    .byte $18 ; |   XX   | $D7E9
LD7EA:
    .byte $1D ; |   XXX X| $D7EA
    .byte $1D ; |   XXX X| $D7EB
    .byte $1D ; |   XXX X| $D7EC
    .byte $1E ; |   XXXX | $D7ED
    .byte $1D ; |   XXX X| $D7EE
    .byte $1C ; |   XXX  | $D7EF
    .byte $1C ; |   XXX  | $D7F0

LD7F1:
    nop                          ; 2
LD7F2:
    lda    INTIM                 ; 4
    bmi    LD7FC                 ; 2³
    bne    LD7F2                 ; 2³
    jmp    LD7FD                 ; 3

LD7FC:
    nop                          ; 2
LD7FD:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sty    $CF                   ; 3
    ldy    $CC                   ; 3
    lda    #$B5                  ; 2
    sta    $CD                   ; 3
    lda    LD825,Y               ; 4
    sta    $CC                   ; 3
    ldy    $CF                   ; 3
    lda    #2                    ; 2
    sta    ENABL                 ; 3
    sec                          ; 2
    lda    ($A2),Y               ; 5
    lda    ($A2),Y               ; 5
    lda    ($A2),Y               ; 5
    lda    #0                    ; 2
    sta    HMCLR                 ; 3
    nop                          ; 2
    sta    VBLANK                ; 3
    jmp    LDFF0                 ; 3

LD825:
    .byte <LB578         ; $D825
    .byte <LB57D         ; $D826
    .byte <LB582         ; $D827
    .byte <LB587         ; $D828
    .byte <LB58C         ; $D829
    .byte <LB591         ; $D82A
    .byte <LB596         ; $D82B
    .byte <LB59B         ; $D82C
    .byte <LB5A0         ; $D82D
    .byte <LB5A6         ; $D82E
    .byte <LB5AD         ; $D82F
    .byte <LB5B2         ; $D830
    .byte <LB5B7         ; $D831
    .byte <LB5BC         ; $D832
    .byte <LB5BF         ; $D833
    .byte <LB5C3         ; $D834
    .byte <LB5C8         ; $D835
    .byte <LB5CD         ; $D836
    .byte <LB5D2         ; $D837
    .byte <LB5D9         ; $D838

    .byte $FF ; |XXXXXXXX| $D839   space filler
    .byte $FF ; |XXXXXXXX| $D83A
    .byte $FF ; |XXXXXXXX| $D83B

;coming from bank 1
LD83C:
    ldy    $B1                   ; 3
    lda    ($A9),Y               ; 5
    sta    $BD                   ; 3
    iny                          ; 2
    lda    ($A9),Y               ; 5
    sta    $BE                   ; 3
    iny                          ; 2
    lda    ($A9),Y               ; 5
    sta    $BF                   ; 3
    iny                          ; 2
    sty    $B1                   ; 3
    lda    SC_00|READ,X          ; 4
    and    #$A0                  ; 2
    sta    BANK_1                ; 4   bankswitch, goto LB857

    .byte $FF ; |XXXXXXXX| $D857   space filler

LD858:  ; indirect jump
    lda    #$BA                  ; 2
    sta    $AC                   ; 3
    lda    #$B6                  ; 2
    sta    $AE                   ; 3
    lda    $B4                   ; 3
    sta    PF2                   ; 3
    ldy    #4                    ; 2
    jmp    LD7F1                 ; 3

LD869:  ; indirect jump
    lda    #$BA                  ; 2
    sta    $AC                   ; 3
    lda    #$B6                  ; 2
    sta    $AE                   ; 3
    lda    $B4                   ; 3
    sta    PF2                   ; 3
    ldy    #3                    ; 2
    jmp    LD7F1                 ; 3

LD87A:  ; indirect jump
    lda    #$BA                  ; 2
    sta    $AC                   ; 3
    lda    #$B6                  ; 2
    sta    $AE                   ; 3
    lda    $B4                   ; 3
    sta    PF2                   ; 3
    tsx                          ; 2
    ldy    #2                    ; 2
    jmp    LD7F1                 ; 3

LD88C:  ; indirect jump
    lda    #$BA                  ; 2
    sta    $AC                   ; 3
    lda    #$B6                  ; 2
    sta    $AE                   ; 3
    lda    $B4                   ; 3
    sta    PF2                   ; 3
    ldx    $B9                   ; 3
    ldy    #1                    ; 2
    jmp    LD7F1                 ; 3

LD89F:  ; indirect jump
    lda    #$B6                  ; 2
    sta    $AE                   ; 3
    lda    $B4                   ; 3
    sta    PF2                   ; 3
    ldy    #0                    ; 2
    jmp    LD7F1                 ; 3

LD8AC:  ; indirect jump
    lda    #$BF                  ; 2
    sta    $AC                   ; 3
    lda    #$B6                  ; 2
    sta    $AE                   ; 3
    ldy    #4                    ; 2
    jmp    LD7F1                 ; 3

LD8B9:  ; indirect jump
    lda    #$BF                  ; 2
    sta    $AC                   ; 3
    lda    #$B6                  ; 2
    sta    $AE                   ; 3
    lda    $BD                   ; 3
    sta    PF0                   ; 3
    lda    $BE                   ; 3
    sta    PF1                   ; 3
    lda    $BF                   ; 3
    sta    PF2                   ; 3
    tsx                          ; 2
    ldy    #3                    ; 2
    jmp    LD7F1                 ; 3

LD8D3:  ; indirect jump
    lda    #$BF                  ; 2
    sta    $AC                   ; 3
    lda    #$B6                  ; 2
    sta    $AE                   ; 3
    lda    $BD                   ; 3
    sta    PF0                   ; 3
    lda    $BE                   ; 3
    sta    PF1                   ; 3
    lda    $BF                   ; 3
    sta    PF2                   ; 3
    tsx                          ; 2
    lda    SC_00|READ,X          ; 4
    and    #$07                  ; 2
    tay                          ; 2
    lda    LD8F7,Y               ; 4
    tax                          ; 2
    ldy    #2                    ; 2
    jmp    LD7F1                 ; 3

LD8F7:
    .byte $00 ; |        | $D8F7
    .byte $04 ; |     X  | $D8F8
    .byte $20 ; |  X     | $D8F9
    .byte $24 ; |  X  X  | $D8FA
    .byte $40 ; | X      | $D8FB
    .byte $44 ; | X   X  | $D8FC
    .byte $60 ; | XX     | $D8FD
    .byte $64 ; | XX  X  | $D8FE
    .byte $FF ; |XXXXXXXX| $D8FF
LD900:
    .byte $00 ; |        | $D900
    .byte $00 ; |        | $D901
    .byte $00 ; |        | $D902
    .byte $00 ; |        | $D903
    .byte $00 ; |        | $D904
    .byte $00 ; |        | $D905
LD906:
    .byte $00 ; |        | $D906
    .byte $00 ; |        | $D907
    .byte $00 ; |        | $D908
    .byte $00 ; |        | $D909
    .byte $01 ; |       X| $D90A
    .byte $01 ; |       X| $D90B
    .byte $01 ; |       X| $D90C
    .byte $01 ; |       X| $D90D
    .byte $01 ; |       X| $D90E
    .byte $01 ; |       X| $D90F
    .byte $01 ; |       X| $D910
    .byte $01 ; |       X| $D911
    .byte $01 ; |       X| $D912
    .byte $01 ; |       X| $D913
    .byte $02 ; |      X | $D914
    .byte $02 ; |      X | $D915
    .byte $02 ; |      X | $D916
    .byte $02 ; |      X | $D917
    .byte $02 ; |      X | $D918
    .byte $02 ; |      X | $D919
    .byte $02 ; |      X | $D91A
    .byte $02 ; |      X | $D91B
    .byte $02 ; |      X | $D91C
    .byte $02 ; |      X | $D91D
    .byte $03 ; |      XX| $D91E
    .byte $03 ; |      XX| $D91F
    .byte $03 ; |      XX| $D920
    .byte $03 ; |      XX| $D921
    .byte $03 ; |      XX| $D922
    .byte $03 ; |      XX| $D923
    .byte $03 ; |      XX| $D924
    .byte $03 ; |      XX| $D925
    .byte $03 ; |      XX| $D926
    .byte $03 ; |      XX| $D927
    .byte $04 ; |     X  | $D928
    .byte $04 ; |     X  | $D929
    .byte $04 ; |     X  | $D92A
    .byte $04 ; |     X  | $D92B
    .byte $04 ; |     X  | $D92C
    .byte $04 ; |     X  | $D92D
    .byte $04 ; |     X  | $D92E
    .byte $04 ; |     X  | $D92F
    .byte $04 ; |     X  | $D930
    .byte $04 ; |     X  | $D931
    .byte $05 ; |     X X| $D932
    .byte $05 ; |     X X| $D933
    .byte $05 ; |     X X| $D934
    .byte $05 ; |     X X| $D935
    .byte $05 ; |     X X| $D936
    .byte $05 ; |     X X| $D937
    .byte $05 ; |     X X| $D938
    .byte $05 ; |     X X| $D939
    .byte $05 ; |     X X| $D93A
    .byte $05 ; |     X X| $D93B
    .byte $06 ; |     XX | $D93C
    .byte $06 ; |     XX | $D93D
    .byte $06 ; |     XX | $D93E
    .byte $06 ; |     XX | $D93F
    .byte $06 ; |     XX | $D940
    .byte $06 ; |     XX | $D941
    .byte $06 ; |     XX | $D942
    .byte $06 ; |     XX | $D943
    .byte $06 ; |     XX | $D944
    .byte $06 ; |     XX | $D945
    .byte $07 ; |     XXX| $D946
    .byte $07 ; |     XXX| $D947
    .byte $07 ; |     XXX| $D948
    .byte $07 ; |     XXX| $D949
    .byte $07 ; |     XXX| $D94A
    .byte $07 ; |     XXX| $D94B
    .byte $07 ; |     XXX| $D94C
    .byte $07 ; |     XXX| $D94D
    .byte $07 ; |     XXX| $D94E
    .byte $07 ; |     XXX| $D94F
    .byte $08 ; |    X   | $D950
    .byte $08 ; |    X   | $D951
    .byte $08 ; |    X   | $D952
    .byte $08 ; |    X   | $D953
    .byte $08 ; |    X   | $D954
    .byte $08 ; |    X   | $D955
    .byte $08 ; |    X   | $D956
    .byte $08 ; |    X   | $D957
    .byte $08 ; |    X   | $D958
    .byte $08 ; |    X   | $D959
    .byte $09 ; |    X  X| $D95A
    .byte $09 ; |    X  X| $D95B
    .byte $09 ; |    X  X| $D95C
    .byte $09 ; |    X  X| $D95D
    .byte $09 ; |    X  X| $D95E
    .byte $09 ; |    X  X| $D95F
    .byte $09 ; |    X  X| $D960
    .byte $09 ; |    X  X| $D961
    .byte $09 ; |    X  X| $D962
    .byte $09 ; |    X  X| $D963
    .byte $0A ; |    X X | $D964
    .byte $0A ; |    X X | $D965
    .byte $0A ; |    X X | $D966
    .byte $0A ; |    X X | $D967
    .byte $0A ; |    X X | $D968
    .byte $0A ; |    X X | $D969
    .byte $0A ; |    X X | $D96A
    .byte $0A ; |    X X | $D96B
    .byte $0A ; |    X X | $D96C
    .byte $0A ; |    X X | $D96D
    .byte $0B ; |    X XX| $D96E
    .byte $0B ; |    X XX| $D96F
    .byte $0B ; |    X XX| $D970
    .byte $0B ; |    X XX| $D971
    .byte $0B ; |    X XX| $D972
    .byte $0B ; |    X XX| $D973
    .byte $0B ; |    X XX| $D974
    .byte $0B ; |    X XX| $D975
    .byte $0B ; |    X XX| $D976
    .byte $0B ; |    X XX| $D977
    .byte $0C ; |    XX  | $D978
    .byte $0C ; |    XX  | $D979
    .byte $0C ; |    XX  | $D97A
    .byte $0C ; |    XX  | $D97B
    .byte $0C ; |    XX  | $D97C
    .byte $0C ; |    XX  | $D97D
    .byte $0C ; |    XX  | $D97E
    .byte $0C ; |    XX  | $D97F
    .byte $0C ; |    XX  | $D980
    .byte $0C ; |    XX  | $D981
    .byte $0D ; |    XX X| $D982
    .byte $0D ; |    XX X| $D983
    .byte $0D ; |    XX X| $D984
    .byte $0D ; |    XX X| $D985
    .byte $0D ; |    XX X| $D986
    .byte $0D ; |    XX X| $D987
    .byte $0D ; |    XX X| $D988
    .byte $0D ; |    XX X| $D989
    .byte $0D ; |    XX X| $D98A
    .byte $0D ; |    XX X| $D98B
    .byte $0E ; |    XXX | $D98C
    .byte $0E ; |    XXX | $D98D
    .byte $0E ; |    XXX | $D98E
    .byte $0E ; |    XXX | $D98F
    .byte $0E ; |    XXX | $D990
    .byte $0E ; |    XXX | $D991
    .byte $0E ; |    XXX | $D992
    .byte $0E ; |    XXX | $D993
    .byte $0E ; |    XXX | $D994
    .byte $0E ; |    XXX | $D995
    .byte $0F ; |    XXXX| $D996
    .byte $0F ; |    XXXX| $D997
    .byte $0F ; |    XXXX| $D998
    .byte $0F ; |    XXXX| $D999
    .byte $0F ; |    XXXX| $D99A
    .byte $0F ; |    XXXX| $D99B
    .byte $0F ; |    XXXX| $D99C
    .byte $0F ; |    XXXX| $D99D
    .byte $0F ; |    XXXX| $D99E
    .byte $0F ; |    XXXX| $D99F
    .byte $10 ; |   X    | $D9A0
    .byte $10 ; |   X    | $D9A1
    .byte $10 ; |   X    | $D9A2
    .byte $10 ; |   X    | $D9A3
    .byte $10 ; |   X    | $D9A4
    .byte $10 ; |   X    | $D9A5
    .byte $10 ; |   X    | $D9A6
    .byte $10 ; |   X    | $D9A7
    .byte $10 ; |   X    | $D9A8
    .byte $10 ; |   X    | $D9A9
    .byte $11 ; |   X   X| $D9AA
    .byte $11 ; |   X   X| $D9AB
    .byte $11 ; |   X   X| $D9AC
    .byte $11 ; |   X   X| $D9AD
    .byte $11 ; |   X   X| $D9AE
    .byte $11 ; |   X   X| $D9AF
    .byte $11 ; |   X   X| $D9B0
    .byte $11 ; |   X   X| $D9B1
    .byte $11 ; |   X   X| $D9B2
    .byte $11 ; |   X   X| $D9B3
    .byte $12 ; |   X  X | $D9B4
    .byte $12 ; |   X  X | $D9B5
    .byte $12 ; |   X  X | $D9B6
    .byte $12 ; |   X  X | $D9B7
    .byte $12 ; |   X  X | $D9B8
    .byte $12 ; |   X  X | $D9B9
    .byte $12 ; |   X  X | $D9BA
    .byte $12 ; |   X  X | $D9BB
    .byte $12 ; |   X  X | $D9BC
    .byte $12 ; |   X  X | $D9BD
    .byte $13 ; |   X  XX| $D9BE
    .byte $13 ; |   X  XX| $D9BF
    .byte $13 ; |   X  XX| $D9C0
    .byte $13 ; |   X  XX| $D9C1
    .byte $13 ; |   X  XX| $D9C2
    .byte $13 ; |   X  XX| $D9C3
    .byte $13 ; |   X  XX| $D9C4
    .byte $13 ; |   X  XX| $D9C5
    .byte $13 ; |   X  XX| $D9C6
    .byte $13 ; |   X  XX| $D9C7
    .byte $14 ; |   X X  | $D9C8
    .byte $14 ; |   X X  | $D9C9
    .byte $14 ; |   X X  | $D9CA
    .byte $14 ; |   X X  | $D9CB
    .byte $14 ; |   X X  | $D9CC
    .byte $14 ; |   X X  | $D9CD
    .byte $14 ; |   X X  | $D9CE
    .byte $14 ; |   X X  | $D9CF
    .byte $14 ; |   X X  | $D9D0
    .byte $14 ; |   X X  | $D9D1
    .byte $15 ; |   X X X| $D9D2
    .byte $15 ; |   X X X| $D9D3
    .byte $15 ; |   X X X| $D9D4
    .byte $15 ; |   X X X| $D9D5
    .byte $15 ; |   X X X| $D9D6
    .byte $15 ; |   X X X| $D9D7
    .byte $15 ; |   X X X| $D9D8
    .byte $15 ; |   X X X| $D9D9
    .byte $15 ; |   X X X| $D9DA
    .byte $15 ; |   X X X| $D9DB
    .byte $16 ; |   X XX | $D9DC
    .byte $16 ; |   X XX | $D9DD
    .byte $16 ; |   X XX | $D9DE
    .byte $16 ; |   X XX | $D9DF
    .byte $16 ; |   X XX | $D9E0
    .byte $16 ; |   X XX | $D9E1
    .byte $16 ; |   X XX | $D9E2
    .byte $16 ; |   X XX | $D9E3
    .byte $16 ; |   X XX | $D9E4
    .byte $16 ; |   X XX | $D9E5
    .byte $17 ; |   X XXX| $D9E6
    .byte $17 ; |   X XXX| $D9E7
    .byte $17 ; |   X XXX| $D9E8
    .byte $17 ; |   X XXX| $D9E9
    .byte $17 ; |   X XXX| $D9EA
    .byte $17 ; |   X XXX| $D9EB
    .byte $17 ; |   X XXX| $D9EC
    .byte $17 ; |   X XXX| $D9ED
    .byte $17 ; |   X XXX| $D9EE
    .byte $17 ; |   X XXX| $D9EF
    .byte $18 ; |   XX   | $D9F0
    .byte $18 ; |   XX   | $D9F1
    .byte $18 ; |   XX   | $D9F2
    .byte $18 ; |   XX   | $D9F3
    .byte $18 ; |   XX   | $D9F4
    .byte $18 ; |   XX   | $D9F5
    .byte $18 ; |   XX   | $D9F6
    .byte $18 ; |   XX   | $D9F7
    .byte $18 ; |   XX   | $D9F8
    .byte $18 ; |   XX   | $D9F9
    .byte $19 ; |   XX  X| $D9FA
    .byte $19 ; |   XX  X| $D9FB
    .byte $19 ; |   XX  X| $D9FC
    .byte $19 ; |   XX  X| $D9FD
    .byte $19 ; |   XX  X| $D9FE
    .byte $19 ; |   XX  X| $D9FF

LDA00:  ; indirect jump
    lda    #$BF                  ; 2
    sta    $AC                   ; 3
    lda    #$BE                  ; 2
    sta    $AE                   ; 3
    tsx                          ; 2
    lda    SC_6C|READ,X          ; 4
    asl                          ; 2
    asl                          ; 2
    tax                          ; 2
    ldy    #2                    ; 2
    jmp    LD7F1                 ; 3

LDA14:  ; indirect jump
    lda    #$BE                  ; 2
    sta    $AE                   ; 3
    ldx    #$0A                  ; 2
    ldy    #1                    ; 2
    jmp    LD7F1                 ; 3

LDA1F:  ; indirect jump
    lda    #$BA                  ; 2
    sta    $AC                   ; 3
    lda    #$BE                  ; 2
    sta    $AE                   ; 3
    ldy    #0                    ; 2
    jmp    LD7F1                 ; 3

LDA2C:  ; indirect jump
    lda    #$BA                  ; 2
    sta    $AC                   ; 3
    lda    #$BE                  ; 2
    sta    $AE                   ; 3
    lda    $BD                   ; 3
    sta    PF0                   ; 3
    lda    $BE                   ; 3
    sta    PF1                   ; 3
    lda    $BF                   ; 3
    sta    PF2                   ; 3
    tsx                          ; 2
    ldy    #3                    ; 2
    jmp    LD7F1                 ; 3

LDA46:
    .byte $F2 ; |XXXX  X | $DA46
    .byte $74 ; | XXX X  | $DA47
    .byte $54 ; | X X X  | $DA48
    .byte $14 ; |   X X  | $DA49
    .byte $44 ; | X   X  | $DA4A
    .byte $36 ; |  XX XX | $DA4B
    .byte $C2 ; |XX    X | $DA4C
LDA4D:
    .byte $F6 ; |XXXX XX | $DA4D
    .byte $78 ; | XXXX   | $DA4E
    .byte $58 ; | X XX   | $DA4F
    .byte $18 ; |   XX   | $DA50
    .byte $48 ; | X  X   | $DA51
    .byte $3A ; |  XXX X | $DA52
    .byte $C6 ; |XX   XX | $DA53
LDA54:
    .byte $1C ; |   XXX  | $DA54
    .byte $1C ; |   XXX  | $DA55
    .byte $1C ; |   XXX  | $DA56
    .byte $1C ; |   XXX  | $DA57
    .byte $1C ; |   XXX  | $DA58
    .byte $1C ; |   XXX  | $DA59
    .byte $1C ; |   XXX  | $DA5A
    .byte $1C ; |   XXX  | $DA5B
    .byte $1C ; |   XXX  | $DA5C
    .byte $1C ; |   XXX  | $DA5D
    .byte $1C ; |   XXX  | $DA5E
    .byte $1C ; |   XXX  | $DA5F
    .byte $16 ; |   X XX | $DA60
    .byte $C8 ; |XX  X   | $DA61
    .byte $26 ; |  X  XX | $DA62
    .byte $44 ; | X   X  | $DA63
    .byte $08 ; |    X   | $DA64
    .byte $DA ; |XX XX X | $DA65
    .byte $28 ; |  X X   | $DA66
    .byte $1C ; |   XXX  | $DA67
    .byte $1C ; |   XXX  | $DA68
    .byte $1C ; |   XXX  | $DA69
    .byte $1C ; |   XXX  | $DA6A
    .byte $1C ; |   XXX  | $DA6B
    .byte $1C ; |   XXX  | $DA6C
    .byte $1C ; |   XXX  | $DA6D
    .byte $30 ; |  XX    | $DA6E
    .byte $26 ; |  X  XX | $DA6F
LDA70:
    .byte $44 ; | X   X  | $DA70
    .byte $66 ; | XX  XX | $DA71
    .byte $C8 ; |XX  X   | $DA72
    .byte $28 ; |  X X   | $DA73
LDA74:
    .byte $FB ; |XXXXX XX| $DA74
    .byte $05 ; |     X X| $DA75
    .byte $0F ; |    XXXX| $DA76
    .byte $19 ; |   XX  X| $DA77
    .byte $FF ; |XXXXXXXX| $DA78

    sta    GRP1                  ; 3
    ldy    $B1                   ; 3
    lda    ($A9),Y               ; 5
    sta    $B2                   ; 3
    iny                          ; 2
    lda    ($A9),Y               ; 5
    sta    $B3                   ; 3
    iny                          ; 2
    lda    ($A9),Y               ; 5
    sta    $B4                   ; 3
    iny                          ; 2
    sty    $B1                   ; 3
    sta    BANK_1                ; 4

    .byte $FF ; |XXXXXXXX| $DA91
    .byte $FF ; |XXXXXXXX| $DA92

LDA93:  ; indirect jump
    lda    #$BF                  ; 2
    sta    $AC                   ; 3
    lda    #$B6                  ; 2
    sta    $AE                   ; 3
    lda    $BD                   ; 3
    sta    PF0                   ; 3
    lda    $BE                   ; 3
    sta    PF1                   ; 3
    lda    $BF                   ; 3
    sta    PF2                   ; 3
    tsx                          ; 2
    lda    SC_6C|READ,X          ; 4
    sta    $A0                   ; 3
    ldy    #1                    ; 2
    jmp    LD7F1                 ; 3

LDAB2:  ; indirect jump
    lda    #$BF                  ; 2
    sta    $AC                   ; 3
    tsx                          ; 2
    lda    SC_6C|READ,X          ; 4
    sta    $A0                   ; 3
    ldx    $B0                   ; 3
    ldy    #0                    ; 2
    jmp    LD7F1                 ; 3

LDAC3:  ; indirect jump
    lda    #$BF                  ; 2
    sta    $AC                   ; 3
    lda    #$BE                  ; 2
    sta    $AE                   ; 3
    tsx                          ; 2
    lda    SC_6C|READ,X          ; 4
    sta    $A0                   ; 3
    ldy    #4                    ; 2
    jmp    LD7F1                 ; 3

LDAD6:  ; indirect jump
    lda    #$BF                  ; 2
    sta    $AC                   ; 3
    lda    #$BE                  ; 2
    sta    $AE                   ; 3
    tsx                          ; 2
    lda    SC_6C|READ,X          ; 4
    sta    $A0                   ; 3
    ldy    #3                    ; 2
    jmp    LD7F1                 ; 3

LDAE9:  ; indirect jump
    lda    #$BA                  ; 2
    sta    $AC                   ; 3
    lda    #$BE                  ; 2
    sta    $AE                   ; 3
    tsx                          ; 2
    ldy    #1                    ; 2
    jmp    LD7F1                 ; 3

LDAF7:
    .byte $DC ; |XX XXX  | $DAF7
    .byte $DC ; |XX XXX  | $DAF8
    .byte $DD ; |XX XXX X| $DAF9
    .byte $DD ; |XX XXX X| $DAFA
    .byte $DE ; |XX XXXX | $DAFB
    .byte $DE ; |XX XXXX | $DAFC
    .byte $DF ; |XX XXXXX| $DAFD
    .byte $FF ; |XXXXXXXX| $DAFE
    .byte $FF ; |XXXXXXXX| $DAFF
LDB00:
    .byte $00 ; |        | $DB00
    .byte $01 ; |       X| $DB01
    .byte $02 ; |      X | $DB02
    .byte $03 ; |      XX| $DB03
    .byte $04 ; |     X  | $DB04
    .byte $05 ; |     X X| $DB05
    .byte $06 ; |     XX | $DB06
    .byte $07 ; |     XXX| $DB07
    .byte $08 ; |    X   | $DB08
    .byte $09 ; |    X  X| $DB09
    .byte $00 ; |        | $DB0A
    .byte $01 ; |       X| $DB0B
    .byte $02 ; |      X | $DB0C
    .byte $03 ; |      XX| $DB0D
    .byte $04 ; |     X  | $DB0E
    .byte $05 ; |     X X| $DB0F
    .byte $06 ; |     XX | $DB10
    .byte $07 ; |     XXX| $DB11
    .byte $08 ; |    X   | $DB12
    .byte $09 ; |    X  X| $DB13
    .byte $00 ; |        | $DB14
    .byte $01 ; |       X| $DB15
    .byte $02 ; |      X | $DB16
    .byte $03 ; |      XX| $DB17
    .byte $04 ; |     X  | $DB18
    .byte $05 ; |     X X| $DB19
    .byte $06 ; |     XX | $DB1A
    .byte $07 ; |     XXX| $DB1B
    .byte $08 ; |    X   | $DB1C
    .byte $09 ; |    X  X| $DB1D
    .byte $00 ; |        | $DB1E
    .byte $01 ; |       X| $DB1F
    .byte $02 ; |      X | $DB20
    .byte $03 ; |      XX| $DB21
    .byte $04 ; |     X  | $DB22
    .byte $05 ; |     X X| $DB23
    .byte $06 ; |     XX | $DB24
    .byte $07 ; |     XXX| $DB25
    .byte $08 ; |    X   | $DB26
    .byte $09 ; |    X  X| $DB27
    .byte $00 ; |        | $DB28
    .byte $01 ; |       X| $DB29
    .byte $02 ; |      X | $DB2A
    .byte $03 ; |      XX| $DB2B
    .byte $04 ; |     X  | $DB2C
    .byte $05 ; |     X X| $DB2D
    .byte $06 ; |     XX | $DB2E
    .byte $07 ; |     XXX| $DB2F
    .byte $08 ; |    X   | $DB30
    .byte $09 ; |    X  X| $DB31
    .byte $00 ; |        | $DB32
    .byte $01 ; |       X| $DB33
    .byte $02 ; |      X | $DB34
    .byte $03 ; |      XX| $DB35
    .byte $04 ; |     X  | $DB36
    .byte $05 ; |     X X| $DB37
    .byte $06 ; |     XX | $DB38
    .byte $07 ; |     XXX| $DB39
    .byte $08 ; |    X   | $DB3A
    .byte $09 ; |    X  X| $DB3B
    .byte $00 ; |        | $DB3C
    .byte $01 ; |       X| $DB3D
    .byte $02 ; |      X | $DB3E
    .byte $03 ; |      XX| $DB3F
    .byte $04 ; |     X  | $DB40
    .byte $05 ; |     X X| $DB41
    .byte $06 ; |     XX | $DB42
    .byte $07 ; |     XXX| $DB43
    .byte $08 ; |    X   | $DB44
    .byte $09 ; |    X  X| $DB45
    .byte $00 ; |        | $DB46
    .byte $01 ; |       X| $DB47
    .byte $02 ; |      X | $DB48
    .byte $03 ; |      XX| $DB49
    .byte $04 ; |     X  | $DB4A
    .byte $05 ; |     X X| $DB4B
    .byte $06 ; |     XX | $DB4C
    .byte $07 ; |     XXX| $DB4D
    .byte $08 ; |    X   | $DB4E
    .byte $09 ; |    X  X| $DB4F
    .byte $00 ; |        | $DB50
    .byte $01 ; |       X| $DB51
    .byte $02 ; |      X | $DB52
    .byte $03 ; |      XX| $DB53
    .byte $04 ; |     X  | $DB54
    .byte $05 ; |     X X| $DB55
    .byte $06 ; |     XX | $DB56
    .byte $07 ; |     XXX| $DB57
    .byte $08 ; |    X   | $DB58
    .byte $09 ; |    X  X| $DB59
    .byte $00 ; |        | $DB5A
    .byte $01 ; |       X| $DB5B
    .byte $02 ; |      X | $DB5C
    .byte $03 ; |      XX| $DB5D
    .byte $04 ; |     X  | $DB5E
    .byte $05 ; |     X X| $DB5F
    .byte $06 ; |     XX | $DB60
    .byte $07 ; |     XXX| $DB61
    .byte $08 ; |    X   | $DB62
    .byte $09 ; |    X  X| $DB63
    .byte $00 ; |        | $DB64
    .byte $01 ; |       X| $DB65
    .byte $02 ; |      X | $DB66
    .byte $03 ; |      XX| $DB67
    .byte $04 ; |     X  | $DB68
    .byte $05 ; |     X X| $DB69
    .byte $06 ; |     XX | $DB6A
    .byte $07 ; |     XXX| $DB6B
    .byte $08 ; |    X   | $DB6C
    .byte $09 ; |    X  X| $DB6D
    .byte $00 ; |        | $DB6E
    .byte $01 ; |       X| $DB6F
    .byte $02 ; |      X | $DB70
    .byte $03 ; |      XX| $DB71
    .byte $04 ; |     X  | $DB72
    .byte $05 ; |     X X| $DB73
    .byte $06 ; |     XX | $DB74
    .byte $07 ; |     XXX| $DB75
    .byte $08 ; |    X   | $DB76
    .byte $09 ; |    X  X| $DB77
    .byte $00 ; |        | $DB78
    .byte $01 ; |       X| $DB79
    .byte $02 ; |      X | $DB7A
    .byte $03 ; |      XX| $DB7B
    .byte $04 ; |     X  | $DB7C
    .byte $05 ; |     X X| $DB7D
    .byte $06 ; |     XX | $DB7E
    .byte $07 ; |     XXX| $DB7F
    .byte $08 ; |    X   | $DB80
    .byte $09 ; |    X  X| $DB81
    .byte $00 ; |        | $DB82
    .byte $01 ; |       X| $DB83
    .byte $02 ; |      X | $DB84
    .byte $03 ; |      XX| $DB85
    .byte $04 ; |     X  | $DB86
    .byte $05 ; |     X X| $DB87
    .byte $06 ; |     XX | $DB88
    .byte $07 ; |     XXX| $DB89
    .byte $08 ; |    X   | $DB8A
    .byte $09 ; |    X  X| $DB8B
    .byte $00 ; |        | $DB8C
    .byte $01 ; |       X| $DB8D
    .byte $02 ; |      X | $DB8E
    .byte $03 ; |      XX| $DB8F
    .byte $04 ; |     X  | $DB90
    .byte $05 ; |     X X| $DB91
    .byte $06 ; |     XX | $DB92
    .byte $07 ; |     XXX| $DB93
    .byte $08 ; |    X   | $DB94
    .byte $09 ; |    X  X| $DB95
    .byte $00 ; |        | $DB96
    .byte $01 ; |       X| $DB97
    .byte $02 ; |      X | $DB98
    .byte $03 ; |      XX| $DB99
    .byte $04 ; |     X  | $DB9A
    .byte $05 ; |     X X| $DB9B
    .byte $06 ; |     XX | $DB9C
    .byte $07 ; |     XXX| $DB9D
    .byte $08 ; |    X   | $DB9E
    .byte $09 ; |    X  X| $DB9F
    .byte $00 ; |        | $DBA0
    .byte $01 ; |       X| $DBA1
    .byte $02 ; |      X | $DBA2
    .byte $03 ; |      XX| $DBA3
    .byte $04 ; |     X  | $DBA4
    .byte $05 ; |     X X| $DBA5
    .byte $06 ; |     XX | $DBA6
    .byte $07 ; |     XXX| $DBA7
    .byte $08 ; |    X   | $DBA8
    .byte $09 ; |    X  X| $DBA9
    .byte $00 ; |        | $DBAA
    .byte $01 ; |       X| $DBAB
    .byte $02 ; |      X | $DBAC
    .byte $03 ; |      XX| $DBAD
    .byte $04 ; |     X  | $DBAE
    .byte $05 ; |     X X| $DBAF
    .byte $06 ; |     XX | $DBB0
    .byte $07 ; |     XXX| $DBB1
    .byte $08 ; |    X   | $DBB2
    .byte $09 ; |    X  X| $DBB3
    .byte $00 ; |        | $DBB4
    .byte $01 ; |       X| $DBB5
    .byte $02 ; |      X | $DBB6
    .byte $03 ; |      XX| $DBB7
    .byte $04 ; |     X  | $DBB8
    .byte $05 ; |     X X| $DBB9
    .byte $06 ; |     XX | $DBBA
    .byte $07 ; |     XXX| $DBBB
    .byte $08 ; |    X   | $DBBC
    .byte $09 ; |    X  X| $DBBD
    .byte $00 ; |        | $DBBE
    .byte $01 ; |       X| $DBBF
    .byte $02 ; |      X | $DBC0
    .byte $03 ; |      XX| $DBC1
    .byte $04 ; |     X  | $DBC2
    .byte $05 ; |     X X| $DBC3
    .byte $06 ; |     XX | $DBC4
    .byte $07 ; |     XXX| $DBC5
    .byte $08 ; |    X   | $DBC6
    .byte $09 ; |    X  X| $DBC7
    .byte $00 ; |        | $DBC8
    .byte $01 ; |       X| $DBC9
    .byte $02 ; |      X | $DBCA
    .byte $03 ; |      XX| $DBCB
    .byte $04 ; |     X  | $DBCC
    .byte $05 ; |     X X| $DBCD
    .byte $06 ; |     XX | $DBCE
    .byte $07 ; |     XXX| $DBCF
    .byte $08 ; |    X   | $DBD0
    .byte $09 ; |    X  X| $DBD1
    .byte $00 ; |        | $DBD2
    .byte $01 ; |       X| $DBD3
    .byte $02 ; |      X | $DBD4
    .byte $03 ; |      XX| $DBD5
    .byte $04 ; |     X  | $DBD6
    .byte $05 ; |     X X| $DBD7
    .byte $06 ; |     XX | $DBD8
    .byte $07 ; |     XXX| $DBD9
    .byte $08 ; |    X   | $DBDA
    .byte $09 ; |    X  X| $DBDB
    .byte $00 ; |        | $DBDC
    .byte $01 ; |       X| $DBDD
    .byte $02 ; |      X | $DBDE
    .byte $03 ; |      XX| $DBDF
    .byte $04 ; |     X  | $DBE0
    .byte $05 ; |     X X| $DBE1
    .byte $06 ; |     XX | $DBE2
    .byte $07 ; |     XXX| $DBE3
    .byte $08 ; |    X   | $DBE4
    .byte $09 ; |    X  X| $DBE5
    .byte $00 ; |        | $DBE6
    .byte $01 ; |       X| $DBE7
    .byte $02 ; |      X | $DBE8
    .byte $03 ; |      XX| $DBE9
    .byte $04 ; |     X  | $DBEA
    .byte $05 ; |     X X| $DBEB
    .byte $06 ; |     XX | $DBEC
    .byte $07 ; |     XXX| $DBED
    .byte $08 ; |    X   | $DBEE
    .byte $09 ; |    X  X| $DBEF
    .byte $00 ; |        | $DBF0
    .byte $01 ; |       X| $DBF1
    .byte $02 ; |      X | $DBF2
    .byte $03 ; |      XX| $DBF3
    .byte $04 ; |     X  | $DBF4
    .byte $05 ; |     X X| $DBF5
LDBF6:
    .byte $06 ; |     XX | $DBF6
    .byte $07 ; |     XXX| $DBF7
    .byte $08 ; |    X   | $DBF8
    .byte $09 ; |    X  X| $DBF9
    .byte $00 ; |        | $DBFA
    .byte $01 ; |       X| $DBFB
    .byte $02 ; |      X | $DBFC
    .byte $03 ; |      XX| $DBFD
    .byte $04 ; |     X  | $DBFE
    .byte $05 ; |     X X| $DBFF
    .byte $F0 ; |XXXX    | $DC00
    .byte $FF ; |XXXXXXXX| $DC01
    .byte $FF ; |XXXXXXXX| $DC02
    .byte $F0 ; |XXXX    | $DC03
    .byte $00 ; |        | $DC04
    .byte $80 ; |X       | $DC05
    .byte $F0 ; |XXXX    | $DC06
    .byte $11 ; |   X   X| $DC07
    .byte $8F ; |X   XXXX| $DC08
    .byte $00 ; |        | $DC09
    .byte $10 ; |   X    | $DC0A
    .byte $88 ; |X   X   | $DC0B
    .byte $80 ; |X       | $DC0C
    .byte $F1 ; |XXXX   X| $DC0D
    .byte $88 ; |X   X   | $DC0E
    .byte $80 ; |X       | $DC0F
    .byte $01 ; |       X| $DC10
    .byte $00 ; |        | $DC11
    .byte $80 ; |X       | $DC12
    .byte $1F ; |   XXXXX| $DC13
    .byte $F8 ; |XXXXX   | $DC14
    .byte $00 ; |        | $DC15
    .byte $00 ; |        | $DC16
    .byte $00 ; |        | $DC17
    .byte $F0 ; |XXXX    | $DC18
    .byte $11 ; |   X   X| $DC19
    .byte $FF ; |XXXXXXXX| $DC1A
    .byte $00 ; |        | $DC1B
    .byte $10 ; |   X    | $DC1C
    .byte $00 ; |        | $DC1D
    .byte $80 ; |X       | $DC1E
    .byte $11 ; |   X   X| $DC1F
    .byte $78 ; | XXXX   | $DC20
    .byte $80 ; |X       | $DC21
    .byte $01 ; |       X| $DC22
    .byte $08 ; |    X   | $DC23
    .byte $80 ; |X       | $DC24
    .byte $F1 ; |XXXX   X| $DC25
    .byte $88 ; |X   X   | $DC26
    .byte $80 ; |X       | $DC27
    .byte $00 ; |        | $DC28
    .byte $80 ; |X       | $DC29
    .byte $80 ; |X       | $DC2A
    .byte $11 ; |   X   X| $DC2B
    .byte $F8 ; |XXXXX   | $DC2C
    .byte $00 ; |        | $DC2D
    .byte $11 ; |   X   X| $DC2E
    .byte $00 ; |        | $DC2F
    .byte $F0 ; |XXXX    | $DC30
    .byte $11 ; |   X   X| $DC31
    .byte $F8 ; |XXXXX   | $DC32
    .byte $00 ; |        | $DC33
    .byte $10 ; |   X    | $DC34
    .byte $08 ; |    X   | $DC35
    .byte $80 ; |X       | $DC36
    .byte $F1 ; |XXXX   X| $DC37
    .byte $F8 ; |XXXXX   | $DC38
    .byte $00 ; |        | $DC39
    .byte $01 ; |       X| $DC3A
    .byte $00 ; |        | $DC3B
    .byte $80 ; |X       | $DC3C
    .byte $F1 ; |XXXX   X| $DC3D
    .byte $F8 ; |XXXXX   | $DC3E
    .byte $00 ; |        | $DC3F
    .byte $11 ; |   X   X| $DC40
    .byte $80 ; |X       | $DC41
    .byte $F0 ; |XXXX    | $DC42
    .byte $11 ; |   X   X| $DC43
    .byte $88 ; |X   X   | $DC44
    .byte $00 ; |        | $DC45
    .byte $00 ; |        | $DC46
    .byte $08 ; |    X   | $DC47
    .byte $80 ; |X       | $DC48
    .byte $11 ; |   X   X| $DC49
    .byte $8F ; |X   XXXX| $DC4A
    .byte $80 ; |X       | $DC4B
    .byte $10 ; |   X    | $DC4C
    .byte $80 ; |X       | $DC4D
    .byte $80 ; |X       | $DC4E
    .byte $11 ; |   X   X| $DC4F
    .byte $8F ; |X   XXXX| $DC50
    .byte $00 ; |        | $DC51
    .byte $10 ; |   X    | $DC52
    .byte $88 ; |X   X   | $DC53
    .byte $80 ; |X       | $DC54
    .byte $F1 ; |XXXX   X| $DC55
    .byte $88 ; |X   X   | $DC56
    .byte $00 ; |        | $DC57
    .byte $01 ; |       X| $DC58
    .byte $00 ; |        | $DC59
    .byte $80 ; |X       | $DC5A
    .byte $1F ; |   XXXXX| $DC5B
    .byte $F8 ; |XXXXX   | $DC5C
    .byte $80 ; |X       | $DC5D
    .byte $00 ; |        | $DC5E
    .byte $00 ; |        | $DC5F
    .byte $80 ; |X       | $DC60
    .byte $11 ; |   X   X| $DC61
    .byte $F8 ; |XXXXX   | $DC62
    .byte $00 ; |        | $DC63
    .byte $11 ; |   X   X| $DC64
    .byte $80 ; |X       | $DC65
    .byte $F0 ; |XXXX    | $DC66
    .byte $11 ; |   X   X| $DC67
    .byte $88 ; |X   X   | $DC68
    .byte $F0 ; |XXXX    | $DC69
    .byte $00 ; |        | $DC6A
    .byte $08 ; |    X   | $DC6B
    .byte $F0 ; |XXXX    | $DC6C
    .byte $FF ; |XXXXXXXX| $DC6D
    .byte $FF ; |XXXXXXXX| $DC6E
    .byte $F0 ; |XXXX    | $DC6F
    .byte $00 ; |        | $DC70
    .byte $80 ; |X       | $DC71
    .byte $F0 ; |XXXX    | $DC72
    .byte $11 ; |   X   X| $DC73
    .byte $8F ; |X   XXXX| $DC74
    .byte $00 ; |        | $DC75
    .byte $11 ; |   X   X| $DC76
    .byte $00 ; |        | $DC77
    .byte $80 ; |X       | $DC78
    .byte $11 ; |   X   X| $DC79
    .byte $78 ; | XXXX   | $DC7A
    .byte $80 ; |X       | $DC7B
    .byte $10 ; |   X    | $DC7C
    .byte $78 ; | XXXX   | $DC7D
    .byte $80 ; |X       | $DC7E
    .byte $1F ; |   XXXXX| $DC7F
    .byte $78 ; | XXXX   | $DC80
    .byte $00 ; |        | $DC81
    .byte $00 ; |        | $DC82
    .byte $78 ; | XXXX   | $DC83
    .byte $80 ; |X       | $DC84
    .byte $F1 ; |XXXX   X| $DC85
    .byte $78 ; | XXXX   | $DC86
    .byte $00 ; |        | $DC87
    .byte $11 ; |   X   X| $DC88
    .byte $00 ; |        | $DC89
    .byte $80 ; |X       | $DC8A
    .byte $11 ; |   X   X| $DC8B
    .byte $F8 ; |XXXXX   | $DC8C
    .byte $80 ; |X       | $DC8D
    .byte $11 ; |   X   X| $DC8E
    .byte $80 ; |X       | $DC8F
    .byte $80 ; |X       | $DC90
    .byte $11 ; |   X   X| $DC91
    .byte $8F ; |X   XXXX| $DC92
    .byte $00 ; |        | $DC93
    .byte $10 ; |   X    | $DC94
    .byte $00 ; |        | $DC95
    .byte $80 ; |X       | $DC96
    .byte $11 ; |   X   X| $DC97
    .byte $F8 ; |XXXXX   | $DC98
    .byte $80 ; |X       | $DC99
    .byte $01 ; |       X| $DC9A
    .byte $00 ; |        | $DC9B
    .byte $80 ; |X       | $DC9C
    .byte $FF ; |XXXXXXXX| $DC9D
    .byte $F8 ; |XXXXX   | $DC9E
    .byte $80 ; |X       | $DC9F
    .byte $01 ; |       X| $DCA0
    .byte $08 ; |    X   | $DCA1
    .byte $80 ; |X       | $DCA2
    .byte $11 ; |   X   X| $DCA3
    .byte $F8 ; |XXXXX   | $DCA4
    .byte $00 ; |        | $DCA5
    .byte $10 ; |   X    | $DCA6
    .byte $00 ; |        | $DCA7
    .byte $80 ; |X       | $DCA8
    .byte $11 ; |   X   X| $DCA9
    .byte $F8 ; |XXXXX   | $DCAA
    .byte $80 ; |X       | $DCAB
    .byte $11 ; |   X   X| $DCAC
    .byte $00 ; |        | $DCAD
    .byte $80 ; |X       | $DCAE
    .byte $11 ; |   X   X| $DCAF
    .byte $8F ; |X   XXXX| $DCB0
    .byte $00 ; |        | $DCB1
    .byte $11 ; |   X   X| $DCB2
    .byte $00 ; |        | $DCB3
    .byte $80 ; |X       | $DCB4
    .byte $F1 ; |XXXX   X| $DCB5
    .byte $F8 ; |XXXXX   | $DCB6
    .byte $00 ; |        | $DCB7
    .byte $01 ; |       X| $DCB8
    .byte $00 ; |        | $DCB9
    .byte $80 ; |X       | $DCBA
    .byte $1F ; |   XXXXX| $DCBB
    .byte $88 ; |X   X   | $DCBC
    .byte $80 ; |X       | $DCBD
    .byte $10 ; |   X    | $DCBE
    .byte $08 ; |    X   | $DCBF
    .byte $80 ; |X       | $DCC0
    .byte $11 ; |   X   X| $DCC1
    .byte $8F ; |X   XXXX| $DCC2
    .byte $80 ; |X       | $DCC3
    .byte $01 ; |       X| $DCC4
    .byte $80 ; |X       | $DCC5
    .byte $80 ; |X       | $DCC6
    .byte $1F ; |   XXXXX| $DCC7
    .byte $88 ; |X   X   | $DCC8
    .byte $00 ; |        | $DCC9
    .byte $10 ; |   X    | $DCCA
    .byte $08 ; |    X   | $DCCB
    .byte $80 ; |X       | $DCCC
    .byte $F1 ; |XXXX   X| $DCCD
    .byte $8F ; |X   XXXX| $DCCE
    .byte $00 ; |        | $DCCF
    .byte $01 ; |       X| $DCD0
    .byte $80 ; |X       | $DCD1
    .byte $F0 ; |XXXX    | $DCD2
    .byte $1F ; |   XXXXX| $DCD3
    .byte $88 ; |X   X   | $DCD4
    .byte $F0 ; |XXXX    | $DCD5
    .byte $00 ; |        | $DCD6
    .byte $08 ; |    X   | $DCD7
    .byte $F0 ; |XXXX    | $DCD8
    .byte $FF ; |XXXXXXXX| $DCD9
    .byte $FF ; |XXXXXXXX| $DCDA
LDCDB:
    .byte $03 ; |      XX| $DCDB
    .byte $03 ; |      XX| $DCDC
    .byte $04 ; |     X  | $DCDD
    .byte $02 ; |      X | $DCDE
    .byte $02 ; |      X | $DCDF
    .byte $03 ; |      XX| $DCE0
    .byte $03 ; |      XX| $DCE1
    .byte $03 ; |      XX| $DCE2
    .byte $03 ; |      XX| $DCE3
    .byte $03 ; |      XX| $DCE4
    .byte $03 ; |      XX| $DCE5
    .byte $03 ; |      XX| $DCE6
    .byte $01 ; |       X| $DCE7
    .byte $01 ; |       X| $DCE8
    .byte $01 ; |       X| $DCE9
    .byte $01 ; |       X| $DCEA
    .byte $01 ; |       X| $DCEB
    .byte $01 ; |       X| $DCEC
    .byte $01 ; |       X| $DCED
    .byte $02 ; |      X | $DCEE
    .byte $05 ; |     X X| $DCEF
    .byte $02 ; |      X | $DCF0
    .byte $02 ; |      X | $DCF1
    .byte $05 ; |     X X| $DCF2
    .byte $02 ; |      X | $DCF3
    .byte $02 ; |      X | $DCF4
    .byte $02 ; |      X | $DCF5
    .byte $02 ; |      X | $DCF6

LDCF7:  ; indirect jump
    lda    #$BA                  ; 2
    sta    $AC                   ; 3
    ldx    $B0                   ; 3
    ldy    #0                    ; 2
    jmp    LD7F1                 ; 3

    .byte $F0 ; |XXXX    | $DD02
    .byte $FF ; |XXXXXXXX| $DD03
    .byte $FF ; |XXXXXXXX| $DD04
    .byte $F0 ; |XXXX    | $DD05
    .byte $01 ; |       X| $DD06
    .byte $80 ; |X       | $DD07
    .byte $F0 ; |XXXX    | $DD08
    .byte $11 ; |   X   X| $DD09
    .byte $88 ; |X   X   | $DD0A
    .byte $00 ; |        | $DD0B
    .byte $10 ; |   X    | $DD0C
    .byte $08 ; |    X   | $DD0D
    .byte $80 ; |X       | $DD0E
    .byte $F1 ; |XXXX   X| $DD0F
    .byte $78 ; | XXXX   | $DD10
    .byte $00 ; |        | $DD11
    .byte $01 ; |       X| $DD12
    .byte $00 ; |        | $DD13
    .byte $80 ; |X       | $DD14
    .byte $1F ; |   XXXXX| $DD15
    .byte $8F ; |X   XXXX| $DD16
    .byte $80 ; |X       | $DD17
    .byte $00 ; |        | $DD18
    .byte $08 ; |    X   | $DD19
    .byte $80 ; |X       | $DD1A
    .byte $FF ; |XXXXXXXX| $DD1B
    .byte $88 ; |X   X   | $DD1C
    .byte $00 ; |        | $DD1D
    .byte $10 ; |   X    | $DD1E
    .byte $80 ; |X       | $DD1F
    .byte $F0 ; |XXXX    | $DD20
    .byte $11 ; |   X   X| $DD21
    .byte $F8 ; |XXXXX   | $DD22
    .byte $00 ; |        | $DD23
    .byte $01 ; |       X| $DD24
    .byte $00 ; |        | $DD25
    .byte $80 ; |X       | $DD26
    .byte $F1 ; |XXXX   X| $DD27
    .byte $7F ; | XXXXXXX| $DD28
    .byte $00 ; |        | $DD29
    .byte $10 ; |   X    | $DD2A
    .byte $08 ; |    X   | $DD2B
    .byte $F0 ; |XXXX    | $DD2C
    .byte $11 ; |   X   X| $DD2D
    .byte $88 ; |X   X   | $DD2E
    .byte $F0 ; |XXXX    | $DD2F
    .byte $01 ; |       X| $DD30
    .byte $00 ; |        | $DD31
    .byte $F0 ; |XXXX    | $DD32
    .byte $1F ; |   XXXXX| $DD33
    .byte $F8 ; |XXXXX   | $DD34
    .byte $00 ; |        | $DD35
    .byte $00 ; |        | $DD36
    .byte $08 ; |    X   | $DD37
    .byte $80 ; |X       | $DD38
    .byte $F1 ; |XXXX   X| $DD39
    .byte $F8 ; |XXXXX   | $DD3A
    .byte $00 ; |        | $DD3B
    .byte $01 ; |       X| $DD3C
    .byte $00 ; |        | $DD3D
    .byte $F0 ; |XXXX    | $DD3E
    .byte $1F ; |   XXXXX| $DD3F
    .byte $8F ; |X   XXXX| $DD40
    .byte $F0 ; |XXXX    | $DD41
    .byte $10 ; |   X    | $DD42
    .byte $80 ; |X       | $DD43
    .byte $F0 ; |XXXX    | $DD44
    .byte $11 ; |   X   X| $DD45
    .byte $88 ; |X   X   | $DD46
    .byte $00 ; |        | $DD47
    .byte $00 ; |        | $DD48
    .byte $08 ; |    X   | $DD49
    .byte $80 ; |X       | $DD4A
    .byte $F1 ; |XXXX   X| $DD4B
    .byte $7F ; | XXXXXXX| $DD4C
    .byte $00 ; |        | $DD4D
    .byte $10 ; |   X    | $DD4E
    .byte $08 ; |    X   | $DD4F
    .byte $F0 ; |XXXX    | $DD50
    .byte $1F ; |   XXXXX| $DD51
    .byte $88 ; |X   X   | $DD52
    .byte $00 ; |        | $DD53
    .byte $10 ; |   X    | $DD54
    .byte $80 ; |X       | $DD55
    .byte $80 ; |X       | $DD56
    .byte $11 ; |   X   X| $DD57
    .byte $F8 ; |XXXXX   | $DD58
    .byte $80 ; |X       | $DD59
    .byte $01 ; |       X| $DD5A
    .byte $80 ; |X       | $DD5B
    .byte $80 ; |X       | $DD5C
    .byte $FF ; |XXXXXXXX| $DD5D
    .byte $8F ; |X   XXXX| $DD5E
    .byte $00 ; |        | $DD5F
    .byte $00 ; |        | $DD60
    .byte $08 ; |    X   | $DD61
    .byte $80 ; |X       | $DD62
    .byte $F1 ; |XXXX   X| $DD63
    .byte $88 ; |X   X   | $DD64
    .byte $80 ; |X       | $DD65
    .byte $01 ; |       X| $DD66
    .byte $80 ; |X       | $DD67
    .byte $80 ; |X       | $DD68
    .byte $11 ; |   X   X| $DD69
    .byte $F8 ; |XXXXX   | $DD6A
    .byte $00 ; |        | $DD6B
    .byte $10 ; |   X    | $DD6C
    .byte $00 ; |        | $DD6D
    .byte $F0 ; |XXXX    | $DD6E
    .byte $FF ; |XXXXXXXX| $DD6F
    .byte $FF ; |XXXXXXXX| $DD70
    .byte $00 ; |        | $DD71
    .byte $00 ; |        | $DD72
    .byte $80 ; |X       | $DD73
    .byte $80 ; |X       | $DD74
    .byte $11 ; |   X   X| $DD75
    .byte $88 ; |X   X   | $DD76
    .byte $80 ; |X       | $DD77
    .byte $11 ; |   X   X| $DD78
    .byte $88 ; |X   X   | $DD79
    .byte $80 ; |X       | $DD7A
    .byte $11 ; |   X   X| $DD7B
    .byte $88 ; |X   X   | $DD7C
    .byte $00 ; |        | $DD7D
    .byte $00 ; |        | $DD7E
    .byte $00 ; |        | $DD7F
    .byte $F0 ; |XXXX    | $DD80
    .byte $F1 ; |XXXX   X| $DD81
    .byte $78 ; | XXXX   | $DD82
    .byte $00 ; |        | $DD83
    .byte $01 ; |       X| $DD84
    .byte $08 ; |    X   | $DD85
    .byte $80 ; |X       | $DD86
    .byte $FF ; |XXXXXXXX| $DD87
    .byte $88 ; |X   X   | $DD88
    .byte $00 ; |        | $DD89
    .byte $00 ; |        | $DD8A
    .byte $88 ; |X   X   | $DD8B
    .byte $80 ; |X       | $DD8C
    .byte $FF ; |XXXXXXXX| $DD8D
    .byte $8F ; |X   XXXX| $DD8E
    .byte $80 ; |X       | $DD8F
    .byte $00 ; |        | $DD90
    .byte $00 ; |        | $DD91
    .byte $80 ; |X       | $DD92
    .byte $1F ; |   XXXXX| $DD93
    .byte $F8 ; |XXXXX   | $DD94
    .byte $00 ; |        | $DD95
    .byte $10 ; |   X    | $DD96
    .byte $00 ; |        | $DD97
    .byte $F0 ; |XXXX    | $DD98
    .byte $11 ; |   X   X| $DD99
    .byte $8F ; |X   XXXX| $DD9A
    .byte $00 ; |        | $DD9B
    .byte $01 ; |       X| $DD9C
    .byte $00 ; |        | $DD9D
    .byte $80 ; |X       | $DD9E
    .byte $11 ; |   X   X| $DD9F
    .byte $F8 ; |XXXXX   | $DDA0
    .byte $80 ; |X       | $DDA1
    .byte $11 ; |   X   X| $DDA2
    .byte $08 ; |    X   | $DDA3
    .byte $80 ; |X       | $DDA4
    .byte $11 ; |   X   X| $DDA5
    .byte $F8 ; |XXXXX   | $DDA6
    .byte $80 ; |X       | $DDA7
    .byte $10 ; |   X    | $DDA8
    .byte $80 ; |X       | $DDA9
    .byte $80 ; |X       | $DDAA
    .byte $1F ; |   XXXXX| $DDAB
    .byte $88 ; |X   X   | $DDAC
    .byte $00 ; |        | $DDAD
    .byte $01 ; |       X| $DDAE
    .byte $08 ; |    X   | $DDAF
    .byte $80 ; |X       | $DDB0
    .byte $F1 ; |XXXX   X| $DDB1
    .byte $88 ; |X   X   | $DDB2
    .byte $00 ; |        | $DDB3
    .byte $10 ; |   X    | $DDB4
    .byte $80 ; |X       | $DDB5
    .byte $F0 ; |XXXX    | $DDB6
    .byte $11 ; |   X   X| $DDB7
    .byte $88 ; |X   X   | $DDB8
    .byte $00 ; |        | $DDB9
    .byte $01 ; |       X| $DDBA
    .byte $08 ; |    X   | $DDBB
    .byte $80 ; |X       | $DDBC
    .byte $11 ; |   X   X| $DDBD
    .byte $78 ; | XXXX   | $DDBE
    .byte $80 ; |X       | $DDBF
    .byte $11 ; |   X   X| $DDC0
    .byte $00 ; |        | $DDC1
    .byte $80 ; |X       | $DDC2
    .byte $11 ; |   X   X| $DDC3
    .byte $8F ; |X   XXXX| $DDC4
    .byte $00 ; |        | $DDC5
    .byte $10 ; |   X    | $DDC6
    .byte $88 ; |X   X   | $DDC7
    .byte $80 ; |X       | $DDC8
    .byte $FF ; |XXXXXXXX| $DDC9
    .byte $88 ; |X   X   | $DDCA
    .byte $00 ; |        | $DDCB
    .byte $01 ; |       X| $DDCC
    .byte $00 ; |        | $DDCD
    .byte $80 ; |X       | $DDCE
    .byte $11 ; |   X   X| $DDCF
    .byte $88 ; |X   X   | $DDD0
    .byte $80 ; |X       | $DDD1
    .byte $11 ; |   X   X| $DDD2
    .byte $88 ; |X   X   | $DDD3
    .byte $80 ; |X       | $DDD4
    .byte $11 ; |   X   X| $DDD5
    .byte $88 ; |X   X   | $DDD6
    .byte $00 ; |        | $DDD7
    .byte $00 ; |        | $DDD8
    .byte $80 ; |X       | $DDD9
    .byte $F0 ; |XXXX    | $DDDA
    .byte $FF ; |XXXXXXXX| $DDDB
    .byte $FF ; |XXXXXXXX| $DDDC
LDDDD:
    .byte $A1 ; |X X    X| $DDDD
    .byte $BB ; |X XXX XX| $DDDE
    .byte $6D ; | XX XX X| $DDDF
    .byte $87 ; |X    XXX| $DDE0
    .byte $D5 ; |XX X X X| $DDE1
    .byte $EF ; |XXX XXXX| $DDE2
    .byte $39 ; |  XXX  X| $DDE3
    .byte $53 ; | X X  XX| $DDE4
    .byte $1F ; |   XXXXX| $DDE5
    .byte $EF ; |XXX XXXX| $DDE6
    .byte $1F ; |   XXXXX| $DDE7
    .byte $38 ; |  XXX   | $DDE8
LDDE9:
    .byte $D5 ; |XX X X X| $DDE9
    .byte $EF ; |XXX XXXX| $DDEA
    .byte $1F ; |   XXXXX| $DDEB
    .byte $D5 ; |XX X X X| $DDEC
    .byte $EF ; |XXX XXXX| $DDED
    .byte $1F ; |   XXXXX| $DDEE
    .byte $87 ; |X    XXX| $DDEF
    .byte $A1 ; |X X    X| $DDF0
    .byte $BB ; |X XXX XX| $DDF1
    .byte $39 ; |  XXX  X| $DDF2
    .byte $53 ; | X X  XX| $DDF3
    .byte $6D ; | XX XX X| $DDF4
    .byte $39 ; |  XXX  X| $DDF5
    .byte $6D ; | XX XX X| $DDF6
    .byte $D5 ; |XX X X X| $DDF7
    .byte $A1 ; |X X    X| $DDF8
    .byte $87 ; |X    XXX| $DDF9
    .byte $BB ; |X XXX XX| $DDFA
    .byte $53 ; | X X  XX| $DDFB
    .byte $87 ; |X    XXX| $DDFC
    .byte $6A ; | XX X X | $DDFD
    .byte $53 ; | X X  XX| $DDFE
    .byte $39 ; |  XXX  X| $DDFF
    .byte $51 ; | X X   X| $DE00
    .byte $BB ; |X XXX XX| $DE01
    .byte $A1 ; |X X    X| $DE02
    .byte $1F ; |   XXXXX| $DE03
    .byte $6D ; | XX XX X| $DE04

LDE05:  ; indirect jump
    lda    #$BA                  ; 2
    sta    $AC                   ; 3
    lda    #$BE                  ; 2
    sta    $AE                   ; 3
    tsx                          ; 2
    ldy    #2                    ; 2
    jmp    LD7F1                 ; 3

    .byte $F0 ; |XXXX    | $DE13
    .byte $FF ; |XXXXXXXX| $DE14
    .byte $FF ; |XXXXXXXX| $DE15
    .byte $00 ; |        | $DE16
    .byte $01 ; |       X| $DE17
    .byte $00 ; |        | $DE18
    .byte $80 ; |X       | $DE19
    .byte $F1 ; |XXXX   X| $DE1A
    .byte $78 ; | XXXX   | $DE1B
    .byte $00 ; |        | $DE1C
    .byte $00 ; |        | $DE1D
    .byte $00 ; |        | $DE1E
    .byte $80 ; |X       | $DE1F
    .byte $1F ; |   XXXXX| $DE20
    .byte $F8 ; |XXXXX   | $DE21
    .byte $00 ; |        | $DE22
    .byte $00 ; |        | $DE23
    .byte $00 ; |        | $DE24
    .byte $80 ; |X       | $DE25
    .byte $F1 ; |XXXX   X| $DE26
    .byte $8F ; |X   XXXX| $DE27
    .byte $00 ; |        | $DE28
    .byte $00 ; |        | $DE29
    .byte $00 ; |        | $DE2A
    .byte $80 ; |X       | $DE2B
    .byte $F1 ; |XXXX   X| $DE2C
    .byte $8F ; |X   XXXX| $DE2D
    .byte $00 ; |        | $DE2E
    .byte $00 ; |        | $DE2F
    .byte $00 ; |        | $DE30
    .byte $80 ; |X       | $DE31
    .byte $F1 ; |XXXX   X| $DE32
    .byte $F8 ; |XXXXX   | $DE33
    .byte $00 ; |        | $DE34
    .byte $01 ; |       X| $DE35
    .byte $00 ; |        | $DE36
    .byte $80 ; |X       | $DE37
    .byte $1F ; |   XXXXX| $DE38
    .byte $78 ; | XXXX   | $DE39
    .byte $80 ; |X       | $DE3A
    .byte $00 ; |        | $DE3B
    .byte $00 ; |        | $DE3C
    .byte $80 ; |X       | $DE3D
    .byte $1F ; |   XXXXX| $DE3E
    .byte $F8 ; |XXXXX   | $DE3F
    .byte $00 ; |        | $DE40
    .byte $01 ; |       X| $DE41
    .byte $00 ; |        | $DE42
    .byte $F0 ; |XXXX    | $DE43
    .byte $F1 ; |XXXX   X| $DE44
    .byte $F8 ; |XXXXX   | $DE45
    .byte $00 ; |        | $DE46
    .byte $01 ; |       X| $DE47
    .byte $08 ; |    X   | $DE48
    .byte $80 ; |X       | $DE49
    .byte $1F ; |   XXXXX| $DE4A
    .byte $F8 ; |XXXXX   | $DE4B
    .byte $80 ; |X       | $DE4C
    .byte $00 ; |        | $DE4D
    .byte $00 ; |        | $DE4E
    .byte $80 ; |X       | $DE4F
    .byte $11 ; |   X   X| $DE50
    .byte $88 ; |X   X   | $DE51
    .byte $00 ; |        | $DE52
    .byte $11 ; |   X   X| $DE53
    .byte $80 ; |X       | $DE54
    .byte $80 ; |X       | $DE55
    .byte $11 ; |   X   X| $DE56
    .byte $88 ; |X   X   | $DE57
    .byte $80 ; |X       | $DE58
    .byte $00 ; |        | $DE59
    .byte $08 ; |    X   | $DE5A
    .byte $80 ; |X       | $DE5B
    .byte $1F ; |   XXXXX| $DE5C
    .byte $88 ; |X   X   | $DE5D
    .byte $00 ; |        | $DE5E
    .byte $00 ; |        | $DE5F
    .byte $00 ; |        | $DE60
    .byte $F0 ; |XXXX    | $DE61
    .byte $1F ; |   XXXXX| $DE62
    .byte $F8 ; |XXXXX   | $DE63
    .byte $00 ; |        | $DE64
    .byte $00 ; |        | $DE65
    .byte $00 ; |        | $DE66
    .byte $80 ; |X       | $DE67
    .byte $F1 ; |XXXX   X| $DE68
    .byte $8F ; |X   XXXX| $DE69
    .byte $80 ; |X       | $DE6A
    .byte $00 ; |        | $DE6B
    .byte $00 ; |        | $DE6C
    .byte $80 ; |X       | $DE6D
    .byte $1F ; |   XXXXX| $DE6E
    .byte $88 ; |X   X   | $DE6F
    .byte $00 ; |        | $DE70
    .byte $00 ; |        | $DE71
    .byte $88 ; |X   X   | $DE72
    .byte $F0 ; |XXXX    | $DE73
    .byte $1F ; |   XXXXX| $DE74
    .byte $88 ; |X   X   | $DE75
    .byte $00 ; |        | $DE76
    .byte $00 ; |        | $DE77
    .byte $00 ; |        | $DE78
    .byte $80 ; |X       | $DE79
    .byte $F1 ; |XXXX   X| $DE7A
    .byte $8F ; |X   XXXX| $DE7B
    .byte $00 ; |        | $DE7C
    .byte $00 ; |        | $DE7D
    .byte $80 ; |X       | $DE7E
    .byte $F0 ; |XXXX    | $DE7F
    .byte $FF ; |XXXXXXXX| $DE80
    .byte $FF ; |XXXXXXXX| $DE81
    .byte $00 ; |        | $DE82
    .byte $01 ; |       X| $DE83
    .byte $00 ; |        | $DE84
    .byte $80 ; |X       | $DE85
    .byte $11 ; |   X   X| $DE86
    .byte $88 ; |X   X   | $DE87
    .byte $80 ; |X       | $DE88
    .byte $10 ; |   X    | $DE89
    .byte $88 ; |X   X   | $DE8A
    .byte $80 ; |X       | $DE8B
    .byte $1F ; |   XXXXX| $DE8C
    .byte $8F ; |X   XXXX| $DE8D
    .byte $00 ; |        | $DE8E
    .byte $01 ; |       X| $DE8F
    .byte $00 ; |        | $DE90
    .byte $80 ; |X       | $DE91
    .byte $11 ; |   X   X| $DE92
    .byte $88 ; |X   X   | $DE93
    .byte $80 ; |X       | $DE94
    .byte $10 ; |   X    | $DE95
    .byte $08 ; |    X   | $DE96
    .byte $80 ; |X       | $DE97
    .byte $1F ; |   XXXXX| $DE98
    .byte $8F ; |X   XXXX| $DE99
    .byte $00 ; |        | $DE9A
    .byte $01 ; |       X| $DE9B
    .byte $80 ; |X       | $DE9C
    .byte $80 ; |X       | $DE9D
    .byte $F1 ; |XXXX   X| $DE9E
    .byte $F8 ; |XXXXX   | $DE9F
    .byte $80 ; |X       | $DEA0
    .byte $00 ; |        | $DEA1
    .byte $08 ; |    X   | $DEA2
    .byte $80 ; |X       | $DEA3
    .byte $11 ; |   X   X| $DEA4
    .byte $88 ; |X   X   | $DEA5
    .byte $00 ; |        | $DEA6
    .byte $11 ; |   X   X| $DEA7
    .byte $80 ; |X       | $DEA8
    .byte $80 ; |X       | $DEA9
    .byte $F1 ; |XXXX   X| $DEAA
    .byte $8F ; |X   XXXX| $DEAB
    .byte $00 ; |        | $DEAC
    .byte $01 ; |       X| $DEAD
    .byte $00 ; |        | $DEAE
    .byte $F0 ; |XXXX    | $DEAF
    .byte $11 ; |   X   X| $DEB0
    .byte $F8 ; |XXXXX   | $DEB1
    .byte $00 ; |        | $DEB2
    .byte $10 ; |   X    | $DEB3
    .byte $08 ; |    X   | $DEB4
    .byte $80 ; |X       | $DEB5
    .byte $1F ; |   XXXXX| $DEB6
    .byte $F8 ; |XXXXX   | $DEB7
    .byte $80 ; |X       | $DEB8
    .byte $00 ; |        | $DEB9
    .byte $00 ; |        | $DEBA
    .byte $80 ; |X       | $DEBB
    .byte $1F ; |   XXXXX| $DEBC
    .byte $F8 ; |XXXXX   | $DEBD
    .byte $00 ; |        | $DEBE
    .byte $00 ; |        | $DEBF
    .byte $08 ; |    X   | $DEC0
    .byte $80 ; |X       | $DEC1
    .byte $1F ; |   XXXXX| $DEC2
    .byte $88 ; |X   X   | $DEC3
    .byte $80 ; |X       | $DEC4
    .byte $01 ; |       X| $DEC5
    .byte $80 ; |X       | $DEC6
    .byte $80 ; |X       | $DEC7
    .byte $F1 ; |XXXX   X| $DEC8
    .byte $8F ; |X   XXXX| $DEC9
    .byte $80 ; |X       | $DECA
    .byte $01 ; |       X| $DECB
    .byte $80 ; |X       | $DECC
    .byte $80 ; |X       | $DECD
    .byte $1F ; |   XXXXX| $DECE
    .byte $88 ; |X   X   | $DECF
    .byte $00 ; |        | $DED0
    .byte $00 ; |        | $DED1
    .byte $08 ; |    X   | $DED2
    .byte $F0 ; |XXXX    | $DED3
    .byte $F1 ; |XXXX   X| $DED4
    .byte $F8 ; |XXXXX   | $DED5
    .byte $00 ; |        | $DED6
    .byte $01 ; |       X| $DED7
    .byte $80 ; |X       | $DED8
    .byte $80 ; |X       | $DED9
    .byte $F1 ; |XXXX   X| $DEDA
    .byte $88 ; |X   X   | $DEDB
    .byte $00 ; |        | $DEDC
    .byte $10 ; |   X    | $DEDD
    .byte $08 ; |    X   | $DEDE
    .byte $F0 ; |XXXX    | $DEDF
    .byte $1F ; |   XXXXX| $DEE0
    .byte $F8 ; |XXXXX   | $DEE1
    .byte $00 ; |        | $DEE2
    .byte $10 ; |   X    | $DEE3
    .byte $80 ; |X       | $DEE4
    .byte $80 ; |X       | $DEE5
    .byte $F1 ; |XXXX   X| $DEE6
    .byte $8F ; |X   XXXX| $DEE7
    .byte $00 ; |        | $DEE8
    .byte $00 ; |        | $DEE9
    .byte $00 ; |        | $DEEA
    .byte $F0 ; |XXXX    | $DEEB
    .byte $FF ; |XXXXXXXX| $DEEC
    .byte $FF ; |XXXXXXXX| $DEED

LDEEE:
    ldy    $B1                   ; 3
    lda    ($A9),Y               ; 5
    sta    $BD                   ; 3
    iny                          ; 2
    lda    ($A9),Y               ; 5
    sta    $BE                   ; 3
    iny                          ; 2
    lda    ($A9),Y               ; 5
    sta    $BF                   ; 3
    iny                          ; 2
    sty    $B1                   ; 3
    lda    SC_00|READ,X          ; 4
    and    #$A0                  ; 2
    ora    $BD                   ; 3
    sta    $C0                   ; 3
    lda    SC_36|READ,X          ; 4
    and    #$A0                  ; 2
    ora    $BD                   ; 3
    sta    $C6                   ; 3
    lda    SC_00|READ,X          ; 4
    asl                          ; 2
    and    #$A0                  ; 2
    ora    $BD                   ; 3
    sta    $C5                   ; 3
    lda    SC_36|READ,X          ; 4
    asl                          ; 2
    and    #$A0                  ; 2
    ora    $BD                   ; 3
    sta    $CB                   ; 3
    lda    SC_24|READ,X          ; 4
    and    #$55                  ; 2
    ora    $BE                   ; 3
    sta    $C1                   ; 3
    lda    SC_5A|READ,X          ; 4
    and    #$55                  ; 2
    ora    $BE                   ; 3
    sta    $C7                   ; 3
    lda    SC_12|READ,X          ; 4
    and    #$55                  ; 2
    ora    $BE                   ; 3
    sta    $C4                   ; 3
    lda    SC_48|READ,X          ; 4
    and    #$55                  ; 2
    ora    $BE                   ; 3
    sta    $CA                   ; 3
    lda    SC_24|READ,X          ; 4
    and    #$AA                  ; 2
    ora    $BF                   ; 3
    sta    $C2                   ; 3
    lda    SC_5A|READ,X          ; 4
    and    #$AA                  ; 2
    ora    $BF                   ; 3
    sta    $C8                   ; 3
    lda    SC_12|READ,X          ; 4
    and    #$AA                  ; 2
    ora    $BF                   ; 3
    sta    $C3                   ; 3
    lda    SC_48|READ,X          ; 4
    and    #$AA                  ; 2
    ora    $BF                   ; 3
    sta    $C9                   ; 3
    rts                          ; 6

LDF70:  ; indirect jump
    lda    #$BA                  ; 2
    sta    $AC                   ; 3
    lda    #$BE                  ; 2
    sta    $AE                   ; 3
    ldy    #4                    ; 2
    jmp    LD7F1                 ; 3

    .byte $FF ; |XXXXXXXX| $DF7D
    .byte $F0 ; |XXXX    | $DF7E
    .byte $FF ; |XXXXXXXX| $DF7F
    .byte $FF ; |XXXXXXXX| $DF80
    .byte $00 ; |        | $DF81
    .byte $00 ; |        | $DF82
    .byte $08 ; |    X   | $DF83
    .byte $80 ; |X       | $DF84
    .byte $FF ; |XXXXXXXX| $DF85
    .byte $88 ; |X   X   | $DF86
    .byte $80 ; |X       | $DF87
    .byte $01 ; |       X| $DF88
    .byte $80 ; |X       | $DF89
    .byte $80 ; |X       | $DF8A
    .byte $11 ; |   X   X| $DF8B
    .byte $88 ; |X   X   | $DF8C
    .byte $80 ; |X       | $DF8D
    .byte $00 ; |        | $DF8E
    .byte $08 ; |    X   | $DF8F
    .byte $80 ; |X       | $DF90
    .byte $F1 ; |XXXX   X| $DF91
    .byte $F8 ; |XXXXX   | $DF92
    .byte $00 ; |        | $DF93
    .byte $00 ; |        | $DF94
    .byte $00 ; |        | $DF95
    .byte $F0 ; |XXXX    | $DF96
    .byte $FF ; |XXXXXXXX| $DF97
    .byte $F8 ; |XXXXX   | $DF98
    .byte $00 ; |        | $DF99
    .byte $00 ; |        | $DF9A
    .byte $00 ; |        | $DF9B
    .byte $80 ; |X       | $DF9C
    .byte $F1 ; |XXXX   X| $DF9D
    .byte $8F ; |X   XXXX| $DF9E
    .byte $00 ; |        | $DF9F
    .byte $00 ; |        | $DFA0
    .byte $80 ; |X       | $DFA1
    .byte $80 ; |X       | $DFA2
    .byte $1F ; |   XXXXX| $DFA3
    .byte $8F ; |X   XXXX| $DFA4
    .byte $80 ; |X       | $DFA5
    .byte $10 ; |   X    | $DFA6
    .byte $08 ; |    X   | $DFA7
    .byte $80 ; |X       | $DFA8
    .byte $11 ; |   X   X| $DFA9
    .byte $88 ; |X   X   | $DFAA
    .byte $80 ; |X       | $DFAB
    .byte $01 ; |       X| $DFAC
    .byte $00 ; |        | $DFAD
    .byte $80 ; |X       | $DFAE
    .byte $F1 ; |XXXX   X| $DFAF
    .byte $F8 ; |XXXXX   | $DFB0
    .byte $00 ; |        | $DFB1
    .byte $00 ; |        | $DFB2
    .byte $08 ; |    X   | $DFB3
    .byte $80 ; |X       | $DFB4
    .byte $F1 ; |XXXX   X| $DFB5
    .byte $F8 ; |XXXXX   | $DFB6
    .byte $80 ; |X       | $DFB7
    .byte $01 ; |       X| $DFB8
    .byte $00 ; |        | $DFB9
    .byte $80 ; |X       | $DFBA
    .byte $11 ; |   X   X| $DFBB
    .byte $88 ; |X   X   | $DFBC
    .byte $80 ; |X       | $DFBD
    .byte $10 ; |   X    | $DFBE
    .byte $08 ; |    X   | $DFBF
    .byte $80 ; |X       | $DFC0
    .byte $1F ; |   XXXXX| $DFC1
    .byte $8F ; |X   XXXX| $DFC2
    .byte $00 ; |        | $DFC3
    .byte $00 ; |        | $DFC4
    .byte $80 ; |X       | $DFC5
    .byte $F0 ; |XXXX    | $DFC6
    .byte $1F ; |   XXXXX| $DFC7
    .byte $8F ; |X   XXXX| $DFC8
    .byte $00 ; |        | $DFC9
    .byte $01 ; |       X| $DFCA
    .byte $80 ; |X       | $DFCB
    .byte $80 ; |X       | $DFCC
    .byte $F1 ; |XXXX   X| $DFCD
    .byte $88 ; |X   X   | $DFCE
    .byte $00 ; |        | $DFCF
    .byte $00 ; |        | $DFD0
    .byte $00 ; |        | $DFD1
    .byte $F0 ; |XXXX    | $DFD2
    .byte $FF ; |XXXXXXXX| $DFD3
    .byte $F8 ; |XXXXX   | $DFD4
    .byte $00 ; |        | $DFD5
    .byte $00 ; |        | $DFD6
    .byte $00 ; |        | $DFD7
    .byte $80 ; |X       | $DFD8
    .byte $F1 ; |XXXX   X| $DFD9
    .byte $F8 ; |XXXXX   | $DFDA
    .byte $80 ; |X       | $DFDB
    .byte $00 ; |        | $DFDC
    .byte $08 ; |    X   | $DFDD
    .byte $80 ; |X       | $DFDE
    .byte $11 ; |   X   X| $DFDF
    .byte $88 ; |X   X   | $DFE0
    .byte $80 ; |X       | $DFE1
    .byte $01 ; |       X| $DFE2
    .byte $88 ; |X   X   | $DFE3
    .byte $80 ; |X       | $DFE4
    .byte $FF ; |XXXXXXXX| $DFE5
    .byte $88 ; |X   X   | $DFE6
    .byte $00 ; |        | $DFE7
    .byte $00 ; |        | $DFE8
    .byte $00 ; |        | $DFE9
    .byte $F0 ; |XXXX    | $DFEA
    .byte $FF ; |XXXXXXXX| $DFEB
    .byte $FF ; |XXXXXXXX| $DFEC
    .byte $FF ; |XXXXXXXX| $DFED
    .byte $FF ; |XXXXXXXX| $DFEE
    .byte $FF ; |XXXXXXXX| $DFEF

LDFF0:
    sta    BANK_1                ; 4

LDFF3:
    jmp    LD103                 ; 3

    .byte $FF ; |XXXXXXXX| $DFF6
    .byte $FF ; |XXXXXXXX| $DFF7
    .byte $FF ; |XXXXXXXX| $DFF8
    .byte $00 ; |        | $DFF9

    .byte $FF ; |XXXXXXXX| $DFFA
    .byte $FF ; |XXXXXXXX| $DFFB

       ORG $3FFC
      RORG $DFFC

    .word START_BANK_2
    .word START_BANK_2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 3
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $4000
      RORG $F000

    FILLED_SPACE 256             ; superchip ram space

LF100:
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2

START_BANK_3:
    jmp    LF367                 ; 3

LF106:
    .byte $1E ; |   XXXX | $F106
    .byte $3C ; |  XXXX  | $F107
    .byte $38 ; |  XXX   | $F108
    .byte $1C ; |   XXX  | $F109
    .byte $2A ; |  X X X | $F10A
    .byte $37 ; |  XX XXX| $F10B
    .byte $BA ; |X XXX X | $F10C
    .byte $FC ; |XXXXXX  | $F10D
    .byte $20 ; |  X     | $F10E
    .byte $30 ; |  XX    | $F10F
    .byte $4E ; | X  XXX | $F110
    .byte $AB ; |X X X XX| $F111
    .byte $F1 ; |XXXX   X| $F112
    .byte $B5 ; |X XX X X| $F113
    .byte $71 ; | XXX   X| $F114
    .byte $2B ; |  X X XX| $F115
    .byte $76 ; | XXX XX | $F116
    .byte $04 ; |     X  | $F117
    .byte $0E ; |    XXX | $F118
    .byte $3B ; |  XXX XX| $F119
    .byte $C0 ; |XX      | $F11A
    .byte $A4 ; |X X  X  | $F11B
    .byte $9A ; |X  XX X | $F11C
    .byte $C2 ; |XX    X | $F11D
    .byte $E6 ; |XXX  XX | $F11E
    .byte $F0 ; |XXXX    | $F11F
    .byte $F8 ; |XXXXX   | $F120
    .byte $78 ; | XXXX   | $F121
    .byte $30 ; |  XX    | $F122
    .byte $10 ; |   X    | $F123
    .byte $7C ; | XXXXX  | $F124
    .byte $EE ; |XXX XXX | $F125
    .byte $AB ; |X X X XX| $F126
    .byte $AB ; |X X X XX| $F127
    .byte $BB ; |X XXX XX| $F128
    .byte $FF ; |XXXXXXXX| $F129
    .byte $EF ; |XXX XXXX| $F12A
    .byte $DB ; |XX XX XX| $F12B
    .byte $3C ; |  XXXX  | $F12C
    .byte $41 ; | X     X| $F12D
    .byte $42 ; | X    X | $F12E
    .byte $A0 ; |X X     | $F12F
    .byte $92 ; |X  X  X | $F130
    .byte $8C ; |X   XX  | $F131
    .byte $C0 ; |XX      | $F132
    .byte $70 ; | XXX    | $F133
    .byte $F8 ; |XXXXX   | $F134
    .byte $F8 ; |XXXXX   | $F135
    .byte $F8 ; |XXXXX   | $F136
    .byte $70 ; | XXX    | $F137
    .byte $36 ; |  XX XX | $F138
    .byte $DB ; |XX XX XX| $F139
    .byte $7E ; | XXXXXX | $F13A
    .byte $FE ; |XXXXXXX | $F13B
    .byte $FF ; |XXXXXXXX| $F13C
    .byte $FE ; |XXXXXXX | $F13D
    .byte $A6 ; |X X  XX | $F13E
    .byte $AF ; |X X XXXX| $F13F
    .byte $A6 ; |X X  XX | $F140
    .byte $F0 ; |XXXX    | $F141
    .byte $AC ; |X X XX  | $F142
    .byte $4B ; | X  X XX| $F143
    .byte $DA ; |XX XX X | $F144
    .byte $FE ; |XXXXXXX | $F145
    .byte $FE ; |XXXXXXX | $F146
    .byte $7E ; | XXXXXX | $F147
    .byte $47 ; | X   XXX| $F148
    .byte $67 ; | XX  XXX| $F149
    .byte $A7 ; |X X  XXX| $F14A
    .byte $45 ; | X   X X| $F14B
    .byte $7C ; | XXXXX  | $F14C
    .byte $7C ; | XXXXX  | $F14D
    .byte $56 ; | X X XX | $F14E
    .byte $55 ; | X X X X| $F14F
    .byte $55 ; | X X X X| $F150
    .byte $F5 ; |XXXX X X| $F151
    .byte $D7 ; |XX X XXX| $F152
    .byte $FC ; |XXXXXX  | $F153
    .byte $7C ; | XXXXX  | $F154
    .byte $78 ; | XXXX   | $F155
    .byte $3C ; |  XXXX  | $F156
    .byte $7E ; | XXXXXX | $F157
    .byte $E7 ; |XXX  XXX| $F158
    .byte $E7 ; |XXX  XXX| $F159
    .byte $FF ; |XXXXXXXX| $F15A
    .byte $DB ; |XX XX XX| $F15B
    .byte $5A ; | X XX X | $F15C
    .byte $FF ; |XXXXXXXX| $F15D
    .byte $99 ; |X  XX  X| $F15E
    .byte $66 ; | XX  XX | $F15F

LF160:
    sta    HMCLR                 ; 3
    lda    #$FF                  ; 2
    sta    $C0                   ; 3
    sta    $C2                   ; 3
    sta    $C4                   ; 3
    sta    $C6                   ; 3
    sta    $C8                   ; 3
    bit    $F8                   ; 3
    bvc    LF1B4                 ; 2³
    sta    $BE                   ; 3
    ldx    #0                    ; 2
    txs                          ; 2
    stx    GRP0                  ; 3
    sty    WSYNC                 ; 3
;---------------------------------------
    ldx    #1                    ; 2
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    nop                          ; 2
    stx    VDELP0                ; 3
    stx    VDELP1                ; 3
    nop                          ; 2
    lda    #$F0                  ; 2
    sta    HMP0_mirror           ; 4
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    #$28                  ; 2
    nop                          ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    ldx    SC_7F|READ            ; 4
    bpl    LF1A0                 ; 2³
    lda    $FC                   ; 3
    lsr                          ; 2
LF1A0:
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$88                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jmp    LF2C8                 ; 3

LF1AD:
    .byte $00 ; |        | $F1AD
    .byte $03 ; |      XX| $F1AE
    .byte $01 ; |       X| $F1AF
LF1B0:
    .byte $00 ; |        | $F1B0
    .byte $00 ; |        | $F1B1
    .byte $01 ; |       X| $F1B2
    .byte $03 ; |      XX| $F1B3

LF1B4:
    lda    $FF                   ; 3
    and    #$03                  ; 2
    tay                          ; 2
    lda    LF1B0,Y               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    NUSIZ0_mirror         ; 4
    lda    LFD69,Y               ; 4
    sta    COLUP0                ; 3
    lda    $FF                   ; 3
    and    #$30                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    RESP0                 ; 3
    lsr                          ; 2
    tay                          ; 2
    lda    LF1AD,Y               ; 4
    sta    NUSIZ1                ; 3
    lda    #$F1                  ; 2
    sta    $BE                   ; 3
    ldx    $F6                   ; 3
    cpy    #0                    ; 2
    beq    LF1E5                 ; 2³
    ldx    #7                    ; 2
    nop                          ; 2
    bne    LF1EF                 ; 3   always branch

LF1E5:
    bit    $FF                   ; 3
    bpl    LF1ED                 ; 2³
    ldx    #6                    ; 2
    bne    LF1EF                 ; 3   always branch

LF1ED:
    nop                          ; 2
    nop                          ; 2
LF1EF:
    ldy    #9                    ; 2
    sta    RESP1                 ; 3
    lda    LF357,X               ; 4
    sta    $BD                   ; 3
    lda    LF35F,X               ; 4
    sta    COLUP1                ; 3
    bne    LF201                 ; 3+1   always branch

LF1FF:
    sta    WSYNC                 ; 3
;---------------------------------------
LF201:
    lda    LF106,Y               ; 4
    sta    GRP0                  ; 3
    lda    ($BD),Y               ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    cpy    #5                    ; 2
    bne    LF1FF                 ; 2³+1
    lda    #$50                  ; 2
    sta    $B2                   ; 3
    ldx    #$0A                  ; 2
LF215:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LF106,Y               ; 4
    sta    GRP0                  ; 3
    lda    ($BD),Y               ; 5
    sta    GRP1                  ; 3
    sty    $B3                   ; 3
    tya                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda.wy $F9,Y                 ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    bne    LF234                 ; 2³
    ora    $B2                   ; 3
    sta    $BD,X                 ; 4
    jmp    LF23A                 ; 3

LF234:
    sta    $BD,X                 ; 4
    lda    #0                    ; 2
    sta    $B2                   ; 3
LF23A:
    dex                          ; 2
    dex                          ; 2
    ldy    $B3                   ; 3
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LF106,Y               ; 4
    sta    GRP0                  ; 3
    lda    ($BD),Y               ; 5
    sta    GRP1                  ; 3
    sty    $B3                   ; 3
    tya                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda.wy $F9,Y                 ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    bne    LF260                 ; 2³
    ora    $B2                   ; 3
    sta    $BD,X                 ; 4
    jmp    LF266                 ; 3

LF260:
    sta    $BD,X                 ; 4
    lda    #0                    ; 2
    sta    $B2                   ; 3
LF266:
    dex                          ; 2
    dex                          ; 2
    ldy    $B3                   ; 3
    dey                          ; 2
    bpl    LF215                 ; 2³
    ldx    #0                    ; 2
    stx    $BD                   ; 3
    stx    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    GRP1                  ; 3
    stx    GRP0                  ; 3
    stx    $BD                   ; 3
    lda    #$F0                  ; 2
    sta    HMP0                  ; 3
    stx    HMP1                  ; 3
    inx                          ; 2
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    ldy    #7                    ; 2
    stx    VDELP0                ; 3
    stx    VDELP1_mirror         ; 4
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sty    $B4                   ; 3
    lda    #$FF                  ; 2
    sta    $BE                   ; 3
    ldy    $B4                   ; 3
    ldx    #$80                  ; 2
    txs                          ; 2
    lda    #$28                  ; 2
    ldx    SC_7F|READ            ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    bpl    LF2AC                 ; 2³
    lda    $FC                   ; 3
    lsr                          ; 2
LF2AC:
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    jmp    LF31B                 ; 3

LF2B3:
    lda    #$50                  ; 2
    sta    $B2                   ; 3
    lda    #0                    ; 2
    sta    $BD                   ; 3
    ldx    #$80                  ; 2
    txs                          ; 2
    bit    $FF                   ; 3
    bvc    LF2E1                 ; 2³
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$58                  ; 2
LF2C8:
    sta    $C7                   ; 3
    clc                          ; 2
    adc    #8                    ; 2
    sta    $C5                   ; 3
    adc    #8                    ; 2
    sta    $C3                   ; 3
    adc    #8                    ; 2
    sta    $C1                   ; 3
    adc    #8                    ; 2
    sta    $BF                   ; 3
    adc    #8                    ; 2
    sta    $BD                   ; 3
    bne    LF31B                 ; 2³+1
LF2E1:
    ldy    #2                    ; 2
    ldx    #$0A                  ; 2
LF2E5:
    lda.wy $F9,Y                 ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    bne    LF2F4                 ; 2³
    ora    $B2                   ; 3
    sta    $BD,X                 ; 4
    jmp    LF2FA                 ; 3

LF2F4:
    sta    $BD,X                 ; 4
    lda    #0                    ; 2
    sta    $B2                   ; 3
LF2FA:
    dex                          ; 2
    dex                          ; 2
    tya                          ; 2
    beq    LF31B                 ; 2³+1
    lda.wy $F9,Y                 ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    bne    LF310                 ; 2³
    ora    $B2                   ; 3
    sta    $BD,X                 ; 4
    jmp    LF316                 ; 3

LF310:
    sta    $BD,X                 ; 4
    lda    #0                    ; 2
    sta    $B2                   ; 3
LF316:
    dex                          ; 2
    dex                          ; 2
    dey                          ; 2
    bpl    LF2E5                 ; 2³+1
LF31B:
    ldy    #7                    ; 2
    sty    $B4                   ; 3
LF31F:
    lda    ($C7),Y               ; 5
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($C5),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($C3),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($C1),Y               ; 5
    sta    $B3                   ; 3
    lda    ($BF),Y               ; 5
    tax                          ; 2
    lda    ($BD),Y               ; 5
    tay                          ; 2
    lda    $B3                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    $B4                   ; 5
    ldy    $B4                   ; 3
    bpl    LF31F                 ; 2³
    iny                          ; 2
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    tsx                          ; 2
    bmi    LF354                 ; 2³
    jmp    LF2B3                 ; 3

LF354:
    jmp    LFFED                 ; 3

LF357:
    .byte $10 ; |   X    | $F357
    .byte $1A ; |   XX X | $F358
    .byte $24 ; |  X  X  | $F359
    .byte $2E ; |  X XXX | $F35A
    .byte $38 ; |  XXX   | $F35B
    .byte $42 ; | X    X | $F35C
    .byte $4C ; | X  XX  | $F35D
    .byte $56 ; | X X XX | $F35E
LF35F:
    .byte $16 ; |   X XX | $F35F
    .byte $C8 ; |XX  X   | $F360
    .byte $26 ; |  X  XX | $F361
    .byte $44 ; | X   X  | $F362
    .byte $08 ; |    X   | $F363
    .byte $DA ; |XX XX X | $F364
    .byte $28 ; |  X X   | $F365
    .byte $34 ; |  XX X  | $F366

LF367:
    sei                          ; 2
    cld                          ; 2
    ldy    #$C0                  ; 2
    lda    #$40                  ; 2
    sta    $FF                   ; 3
    lda    #0                    ; 2
    sta    $A8                   ; 3
LF373:
    lda    #0                    ; 2
    sta    VSYNC                 ; 3
    ldx    #$FB                  ; 2
LF379:
    cpx    #$A5                  ; 2
    beq    LF37F                 ; 2³
    sta    3,X                   ; 4
LF37F:
    dex                          ; 2
    bne    LF379                 ; 2³
    ldx    #$FE                  ; 2
LF384:
    sta    SC_00,X               ; 5
    dex                          ; 2
    bne    LF384                 ; 2³
    lda    $A8                   ; 3
    sta    $F6                   ; 3
    sty    $F8                   ; 3
    ldx    #$CF                  ; 2
    txs                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    RESBL                 ; 3
    lda    #$40                  ; 2
    sta    HMBL                  ; 3
    lda    #$21                  ; 2
    sta    CTRLPF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMCLR                 ; 3
    lda    INTIM                 ; 4
    sta    $FC                   ; 3
LF3AC:
    ldx    #$11                  ; 2
LF3AE:
    lda    #$FF                  ; 2
    sta    SC_12,X               ; 5
    sta    SC_24,X               ; 5
    sta    SC_6C,X               ; 5
    and    #$F0                  ; 2
    sta    SC_00,X               ; 5
    lda    #0                    ; 2
    sta    SC_36,X               ; 5
    sta    SC_5A,X               ; 5
    sta    SC_48,X               ; 5
    dex                          ; 2
    bpl    LF3AE                 ; 2³
    ldx    #$11                  ; 2
LF3CE:
    lda    SC_24|READ,X          ; 4
    and    #$7F                  ; 2
    sta    SC_24,X               ; 5
    lda    SC_12|READ,X          ; 4
    and    #$7F                  ; 2
    sta    SC_12,X               ; 5
    dex                          ; 2
    bpl    LF3CE                 ; 2³
    ldy    $F6                   ; 3
    lda    LF5E9,Y               ; 4
    jsr    LF56E                 ; 6
    lda    LF5F0,Y               ; 4
    jsr    LF56E                 ; 6
    lda    SC_2C|READ            ; 4
    and    #$DF                  ; 2
    sta    SC_2C                 ; 4
    lda    SC_1A|READ            ; 4
    and    #$DF                  ; 2
    sta    SC_1A                 ; 4
    lda    SC_2B|READ            ; 4
    and    #$D7                  ; 2
    sta    SC_2B                 ; 4
    lda    SC_19|READ            ; 4
    and    #$D7                  ; 2
    sta    SC_19                 ; 4
    lda    #0                    ; 2
    sta    $F5                   ; 3
    sta    $F4                   ; 3
    lda    $FF                   ; 3
    and    #$F7                  ; 2
    sta    $FF                   ; 3
LF41B:
    ldx    #$73                  ; 2
    lda    #0                    ; 2
LF41F:
    cpx    #$28                  ; 2
    beq    LF425                 ; 2³
    sta    $80,X                 ; 4
LF425:
    dex                          ; 2
    bpl    LF41F                 ; 2³
    sec                          ; 2
    ror    $B6                   ; 5
    jsr    LF599                 ; 6
    ldx    #$11                  ; 2
LF430:
    lda    SC_36|READ,X          ; 4
    and    #$F8                  ; 2
    pha                          ; 3
    eor    SC_00|READ,X          ; 4
    sta    SC_00,X               ; 5
    lda    SC_36|READ,X          ; 4
    and    #$07                  ; 2
    sta    SC_36,X               ; 5
    pla                          ; 4
    jsr    LF582                 ; 6
    lda    SC_5A|READ,X          ; 4
    pha                          ; 3
    eor    SC_24|READ,X          ; 4
    sta    SC_24,X               ; 5
    lda    #0                    ; 2
    sta    SC_5A,X               ; 5
    pla                          ; 4
    jsr    LF582                 ; 6
    lda    SC_48|READ,X          ; 4
    pha                          ; 3
    eor    SC_12|READ,X          ; 4
    sta    SC_12,X               ; 5
    lda    #0                    ; 2
    sta    SC_48,X               ; 5
    pla                          ; 4
    jsr    LF582                 ; 6
    lda    SC_00|READ,X          ; 4
    and    #$07                  ; 2
    pha                          ; 3
    tay                          ; 2
    lda    SC_6C|READ,X          ; 4
    eor    LF55E,Y               ; 4
    sta    SC_6C,X               ; 5
    lda    SC_00|READ,X          ; 4
    and    #$F8                  ; 2
    sta    SC_00,X               ; 5
    pla                          ; 4
    jsr    LF582                 ; 6
    lda    SC_36|READ,X          ; 4
    and    #$07                  ; 2
    pha                          ; 3
    tay                          ; 2
    lda    SC_6C|READ,X          ; 4
    eor    LF566,Y               ; 4
    sta    SC_6C,X               ; 5
    lda    SC_36|READ,X          ; 4
    and    #$F8                  ; 2
    sta    SC_36,X               ; 5
    pla                          ; 4
    jsr    LF582                 ; 6
    dex                          ; 2
    bpl    LF430                 ; 2³
    ldy    $F6                   ; 3
    lda    LF57B,Y               ; 4
    cmp    $F4                   ; 3
    bne    LF4BB                 ; 2³
    lda    $FF                   ; 3
    and    #$08                  ; 2
    beq    LF4BB                 ; 2³
    jmp    LF73A                 ; 3

LF4BB:
    lda    #0                    ; 2
    sta    $B6                   ; 3
    jsr    LF599                 ; 6
    ldx    #3                    ; 2
LF4C4:
    lda    #$50                  ; 2
    sta    $E4,X                 ; 4
    lda    #$A0                  ; 2
    sta    $EA,X                 ; 4
    lda    #$40                  ; 2
    sta    $DD,X                 ; 4
    lda    #$13                  ; 2
    sta    $D7,X                 ; 4
    dex                          ; 2
    bne    LF4C4                 ; 2³
    lda    #$50                  ; 2
    sta    $E4                   ; 3
    lda    #$8C                  ; 2
    sta    $EA                   ; 3
    lda    #$13                  ; 2
    sta    $D7                   ; 3
    lda    #$50                  ; 2
    sta    $D0                   ; 3
    lda    #$4A                  ; 2
    sta    $E8                   ; 3
    lda    #$B4                  ; 2
    ldy    $F6                   ; 3
    cpy    #3                    ; 2
    bne    LF4F5                 ; 2³
    lda    #$C8                  ; 2
LF4F5:
    sta    $EE                   ; 3
    lda    #$0B                  ; 2
    sta    $DB                   ; 3
    lda    #$10                  ; 2
    sta    $D1                   ; 3
    dec    $F1                   ; 5
    dec    $F2                   ; 5
    lda    $FF                   ; 3
    bpl    LF50B                 ; 2³
    iny                          ; 2
    iny                          ; 2
    bne    LF511                 ; 2³
LF50B:
    ldx    #0                    ; 2
    cpy    $A8                   ; 3
    beq    LF516                 ; 2³
LF511:
    ldx    LF555,Y               ; 4
    bmi    LF52A                 ; 2³
LF516:
    lda    $FF                   ; 3
    and    #$08                  ; 2
    ora    $F4                   ; 3
    bne    LF52A                 ; 2³
    bit    $F8                   ; 3
    bmi    LF52A                 ; 2³
    sta    $F0                   ; 3
    stx    $EF                   ; 3
    lda    #1                    ; 2
    bpl    LF52C                 ; 3   always branch

LF52A:
    lda    #2                    ; 2
LF52C:
    ldx    #$20                  ; 2
    sta    $F3                   ; 3
    stx    $D5                   ; 3
    ldy    #$10                  ; 2
LF534:
    lda    #2                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    sta    VBLANK                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    ldx    #$81                  ; 2
LF548:
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LF548                 ; 2³
    dey                          ; 2
    bne    LF534                 ; 2³
    jmp    LF5F7                 ; 3

LF555:
    .byte $00 ; |        | $F555
    .byte $01 ; |       X| $F556
    .byte $FF ; |XXXXXXXX| $F557
    .byte $02 ; |      X | $F558
    .byte $FF ; |XXXXXXXX| $F559
    .byte $03 ; |      XX| $F55A
    .byte $FF ; |XXXXXXXX| $F55B
    .byte $03 ; |      XX| $F55C
    .byte $FF ; |XXXXXXXX| $F55D
LF55E:
    .byte $00 ; |        | $F55E
    .byte $04 ; |     X  | $F55F
    .byte $20 ; |  X     | $F560
    .byte $24 ; |  X  X  | $F561
    .byte $40 ; | X      | $F562
    .byte $44 ; | X   X  | $F563
    .byte $60 ; | XX     | $F564
    .byte $64 ; | XX  X  | $F565
LF566:
    .byte $00 ; |        | $F566
    .byte $01 ; |       X| $F567
    .byte $08 ; |    X   | $F568
    .byte $09 ; |    X  X| $F569
    .byte $10 ; |   X    | $F56A
    .byte $11 ; |   X   X| $F56B
    .byte $18 ; |   XX   | $F56C
    .byte $19 ; |   XX  X| $F56D

LF56E:
    sec                          ; 2
    sbc    #$12                  ; 2
    tax                          ; 2
    lda    SC_12|READ,X          ; 4
    ora    #$80                  ; 2
    sta    SC_12,X               ; 5
    rts                          ; 6

LF57B:
    .byte $52 ; | X X  X | $F57B
    .byte $42 ; | X    X | $F57C
    .byte $42 ; | X    X | $F57D
    .byte $4E ; | X  XXX | $F57E
    .byte $68 ; | XX X   | $F57F
    .byte $50 ; | X X    | $F580
    .byte $52 ; | X X  X | $F581

LF582:
    ldy    #8                    ; 2
LF584:
    lsr                          ; 2
    bcc    LF595                 ; 2³
    inc    $F4                   ; 5
    bne    LF595                 ; 2³
    sta    $B2                   ; 3
    lda    $FF                   ; 3
    ora    #$08                  ; 2
    sta    $FF                   ; 3
    lda    $B2                   ; 3
LF595:
    dey                          ; 2
    bne    LF584                 ; 2³
    rts                          ; 6

LF599:
    lda    #$F0                  ; 2
    sta    $B3                   ; 3
    ldy    #3                    ; 2
LF59F:
    lda    LF5E5,Y               ; 4
    sta    $B2                   ; 3
    ldx    LF5E1,Y               ; 4
    sty    $B5                   ; 3
    jsr    LF5C0                 ; 6
    dey                          ; 2
    bpl    LF59F                 ; 2³
    ldx    #9                    ; 2
    ldy    $F6                   ; 3
    lda    LF5E9,Y               ; 4
    sta    $B2                   ; 3
    jsr    LF5C0                 ; 6
    lda    LF5F0,Y               ; 4
    sta    $B2                   ; 3
LF5C0:
    sty    $B5                   ; 3
    ldy    #$80                  ; 2
    lda    LFFC0,X               ; 4
    and    ($B2),Y               ; 5
    beq    LF5D7                 ; 2³
    ldy    #$B6                  ; 2
    bit    $B6                   ; 3
    bmi    LF5DA                 ; 2³
    ora    ($B2),Y               ; 5
LF5D3:
    ldy    #$36                  ; 2
    sta    ($B2),Y               ; 6
LF5D7:
    ldy    $B5                   ; 3
    rts                          ; 6

LF5DA:
    eor    #$FF                  ; 2
    and    ($B2),Y               ; 5
    jmp    LF5D3                 ; 3

LF5E1:
    .byte $02 ; |      X | $F5E1
    .byte $10 ; |   X    | $F5E2
    .byte $02 ; |      X | $F5E3
    .byte $10 ; |   X    | $F5E4
LF5E5:
    .byte $25 ; |  X  X X| $F5E5
    .byte $13 ; |   X  XX| $F5E6
    .byte $34 ; |  XX X  | $F5E7
    .byte $22 ; |  X   X | $F5E8
LF5E9:
    .byte $17 ; |   X XXX| $F5E9
    .byte $16 ; |   X XX | $F5EA
    .byte $17 ; |   X XXX| $F5EB
    .byte $17 ; |   X XXX| $F5EC
    .byte $17 ; |   X XXX| $F5ED
    .byte $17 ; |   X XXX| $F5EE
    .byte $18 ; |   XX   | $F5EF
LF5F0:
    .byte $1D ; |   XXX X| $F5F0
    .byte $1D ; |   XXX X| $F5F1
    .byte $1D ; |   XXX X| $F5F2
    .byte $1E ; |   XXXX | $F5F3
    .byte $1D ; |   XXX X| $F5F4
    .byte $1C ; |   XXX  | $F5F5
    .byte $1C ; |   XXX  | $F5F6

LF5F7:
    lda    #2                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    sta    VBLANK                ; 3
    inc    $FC                   ; 5
    lda    $FC                   ; 3
    adc    $FD                   ; 3
    adc    $FE                   ; 3
    ldy    $FD                   ; 3
    sty    $FE                   ; 3
    sta    $FD                   ; 3
    lda    #$3B                  ; 2
    sta    TIM64T                ; 4
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcc    LF64E                 ; 2³
    lsr                          ; 2
    bcc    LF624                 ; 2³
    lda    $F8                   ; 3
    and    #$E0                  ; 2
    sta    $F8                   ; 3
    jmp    LF65B                 ; 3

LF624:
    lda    $F8                   ; 3
    and    #$1F                  ; 2
    beq    LF62F                 ; 2³
    dec    $F8                   ; 5
    jmp    LF65B                 ; 3

LF62F:
    lda    $FF                   ; 3
    and    #$3C                  ; 2
    sec                          ; 2
    sbc    #$10                  ; 2
    and    #$3C                  ; 2
    sta    $FF                   ; 3
    and    #$30                  ; 2
    bne    LF64A                 ; 2³
    inc    $A8                   ; 5
    lda    $A8                   ; 3
    cmp    #7                    ; 2
    bne    LF64A                 ; 2³
    lda    #0                    ; 2
    sta    $A8                   ; 3
LF64A:
    ldy    #$9F                  ; 2
    bne    LF658                 ; 3   always branch

LF64E:
    lda    $FF                   ; 3
    and    #$30                  ; 2
    ora    #$02                  ; 2
    sta    $FF                   ; 3
    ldy    #0                    ; 2
LF658:
    jmp    LF373                 ; 3

LF65B:
    bit    $F8                   ; 3
    bmi    LF661                 ; 2³
    bvc    LF665                 ; 2³
LF661:
    bit    INPT4                 ; 3
    bpl    LF64E                 ; 2³
LF665:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $E3                   ; 3
    cmp    #$E0                  ; 2
    bcs    LF67E                 ; 2³
    and    #$08                  ; 2
    beq    LF67E                 ; 2³
    lda    $DC                   ; 3
    and    #$01                  ; 2
    bne    LF67C                 ; 2³
    inc    $E9                   ; 5
    jmp    LF67E                 ; 3

LF67C:
    inc    $EF                   ; 5
LF67E:
    lda    $F3                   ; 3
    cmp    #3                    ; 2
    bne    LF698                 ; 2³
    lda    $D5                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    tay                          ; 2
    lda    $E1                   ; 3
    and    #$C0                  ; 2
    ora    LFFB8,Y               ; 4
    sta    $E1                   ; 3
    jmp    LF6AE                 ; 3

LF698:
    lda    $DB                   ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    $FC                   ; 3
    and    #$06                  ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    $E1                   ; 3
    and    #$C0                  ; 2
    clc                          ; 2
    adc    LF8D7,X               ; 4
    adc    LF8D3,Y               ; 4
LF6AE:
    sta    $E1                   ; 3
    ldy    $D6                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    bmi    LF6DD                 ; 2³
    beq    LF705                 ; 2³+1
    lda    $EE                   ; 3
    sec                          ; 2
    sbc    $D0                   ; 3
    tax                          ; 2
    lda    $DB                   ; 3
    php                          ; 3
    rol                          ; 2
    rol                          ; 2
    and    #$01                  ; 2
    plp                          ; 4
    sbc    #0                    ; 2
    bne    LF705                 ; 2³+1
    txa                          ; 2
    cmp    #$3C                  ; 2
    bcs    LF705                 ; 2³+1
    ldx    $D0                   ; 3
    beq    LF705                 ; 2³+1
    dex                          ; 2
    beq    LF703                 ; 2³+1
    dey                          ; 2
    beq    LF703                 ; 2³+1
    dex                          ; 2
    jmp    LF703                 ; 3

LF6DD:
    lda    $EE                   ; 3
    sec                          ; 2
    sbc    $D0                   ; 3
    tax                          ; 2
    lda    $DB                   ; 3
    php                          ; 3
    rol                          ; 2
    rol                          ; 2
    and    #$01                  ; 2
    plp                          ; 4
    sbc    #0                    ; 2
    bne    LF6F4                 ; 2³
    txa                          ; 2
    cmp    #$4C                  ; 2
    bcc    LF705                 ; 2³+1
LF6F4:
    ldx    $D0                   ; 3
    cpx    #$DC                  ; 2
    beq    LF705                 ; 2³+1
    inx                          ; 2
    dey                          ; 2
    beq    LF703                 ; 2³+1
    cpx    #$DC                  ; 2
    beq    LF703                 ; 2³
    inx                          ; 2
LF703:
    stx    $D0                   ; 3
LF705:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    VSYNC                 ; 3
    sta    $D6                   ; 3
    ldx    $F3                   ; 3
    beq    LF782                 ; 2³
    lda    $D5                   ; 3
    bne    LF782                 ; 2³
    lda    LF772-1,X             ; 4
    sta    $B4                   ; 3
    lda    LF778-1,X             ; 4
    sta    $B5                   ; 3
    jmp.ind ($00B4)              ; 5

LF722:  ; indirect jump
    ldx    #3                    ; 2
    stx    $F3                   ; 3
    lda    #$3F                  ; 2
    sta    $D5                   ; 3
    lda    #$10                  ; 2
    sta    $F2                   ; 3
    lda    #0                    ; 2
    sta    $E3                   ; 3
    beq    LF782                 ; 3   always branch

LF734:  ; indirect jump
    lda    #0                    ; 2
    sta    $F2                   ; 3
    beq    LF782                 ; 3   always branch

LF73A:  ; indirect jump also
    inc    $F6                   ; 5
    lda    $F6                   ; 3
    cmp    #7                    ; 2
    bne    LF74B                 ; 2³
    lda    #3                    ; 2
    sta    $F6                   ; 3
    asl    $FF                   ; 5
    sec                          ; 2
    ror    $FF                   ; 5
LF74B:
    lda    #0                    ; 2
    sta    $E3                   ; 3
    beq    LF76F                 ; 3   always branch

LF751:  ; indirect jump
    bit    $F8                   ; 3
    bmi    LF760                 ; 2³
    lda    $FF                   ; 3
    and    #$03                  ; 2
    beq    LF760                 ; 2³
    dec    $FF                   ; 5
    jmp    LF41B                 ; 3

LF760:
    ldy    #$C0                  ; 2
    sty    $F8                   ; 3
    ldx    $F6                   ; 3
    inx                          ; 2
    cpx    #7                    ; 2
    bcc    LF76D                 ; 2³
    ldx    #0                    ; 2
LF76D:
    stx    $F6                   ; 3
LF76F:
    jmp    LF3AC                 ; 3

LF772:
    .byte <LF77E         ; $F772
    .byte <LF734         ; $F773
    .byte <LF751         ; $F774
    .byte <LF77E         ; $F775
    .byte <LF722         ; $F776
    .byte <LF73A         ; $F777
LF778:
    .byte >LF77E         ; $F778
    .byte >LF734         ; $F779
    .byte >LF751         ; $F77A
    .byte >LF77E         ; $F77B
    .byte >LF722         ; $F77C
    .byte >LF73A         ; $F77D

LF77E:  ; indirect jump
    lda    #0                    ; 2
    sta    $F3                   ; 3
LF782:
    jsr    LFA2C                 ; 6
    lda    SC_7E|READ            ; 4
    sta    $B4                   ; 3
    lda    #0                    ; 2
    sta    SC_7E                 ; 4
    sta    $B6                   ; 3
    lda    $F3                   ; 3
    cmp    #3                    ; 2
    beq    LF7A1                 ; 2³
    cmp    #6                    ; 2
    bne    LF7AD                 ; 2³
    lda    $D5                   ; 3
    cmp    #$70                  ; 2
    bcs    LF7AD                 ; 2³
LF7A1:
    ldx    #$FF                  ; 2
    stx    $C1                   ; 3
    stx    $C2                   ; 3
    inx                          ; 2
    stx    $E3                   ; 3
    jmp    LF85B                 ; 3

LF7AD:
    lda    $FF                   ; 3
    and    #$30                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $C1                   ; 3
    ldx    #3                    ; 2
LF7B9:
    cpx    $C1                   ; 3
    bcc    LF7CB                 ; 2³
    lda    $D7,X                 ; 4
    rol                          ; 2
    lda    $EA,X                 ; 4
    ror                          ; 2
    lsr                          ; 2
    sta    $BD,X                 ; 4
    jsr    LF8DF                 ; 6
    bcc    LF7EB                 ; 2³
LF7CB:
    lda    #$FF                  ; 2
    sta    $BD,X                 ; 4
    lda    LF8DB,X               ; 4
    ora    SC_7E|READ            ; 4
    sta    SC_7E                 ; 4
    lda    LF8DB,X               ; 4
    bit    $B4                   ; 3
    bne    LF7EB                 ; 2³
    lda    $DD,X                 ; 4
    and    #$C0                  ; 2
    bne    LF7EB                 ; 2³
    lda    $D7,X                 ; 4
    ora    #$20                  ; 2
    sta    $D7,X                 ; 4
LF7EB:
    dex                          ; 2
    bpl    LF7B9                 ; 2³
    lda    $FC                   ; 3
    and    #$03                  ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $B3                   ; 3
    lda    $FD                   ; 3
    and    #$03                  ; 2
    ora    $B3                   ; 3
    asl                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda    LF90A,Y               ; 4
    and    #$03                  ; 2
    tax                          ; 2
    lda    $BD,X                 ; 4
    sta    $C1                   ; 3
    stx    $C6                   ; 3
    lda    #$FF                  ; 2
    sta    $C2                   ; 3
    iny                          ; 2
    ldx    LF90A,Y               ; 4
    sty    $B2                   ; 3
LF815:
    ldy    #0                    ; 2
LF817:
    lda    $BD,X                 ; 4
    bmi    LF852                 ; 2³
    lda.wy $C1,Y                 ; 4
    bmi    LF830                 ; 2³
    sec                          ; 2
    sbc    $BD,X                 ; 4
    bcs    LF829                 ; 2³
    eor    #$FF                  ; 2
    adc    #1                    ; 2
LF829:
    cmp    #9                    ; 2
    bcc    LF852                 ; 2³
    iny                          ; 2
    bne    LF817                 ; 2³
LF830:
    sta.wy $C2,Y                 ; 5
    tya                          ; 2
    sty    $B6                   ; 3
    beq    LF84B                 ; 2³
LF838:
    lda.wy $C0,Y                 ; 4
    cmp    $BD,X                 ; 4
    bcs    LF84B                 ; 2³
    sta.wy $C1,Y                 ; 5
    lda.wy $C5,Y                 ; 4
    sta.wy $C6,Y                 ; 5
    dey                          ; 2
    bne    LF838                 ; 2³
LF84B:
    lda    $BD,X                 ; 4
    sta.wy $C1,Y                 ; 5
    stx    $C6,Y                 ; 4
LF852:
    inc    $B2                   ; 5
    ldy    $B2                   ; 3
    ldx    LF90A,Y               ; 4
    bpl    LF815                 ; 2³
LF85B:
    ldx    #$FF                  ; 2
    stx    $BF                   ; 3
    inx                          ; 2
LF860:
    lda    $DB,X                 ; 4
    rol                          ; 2
    lda    $EE,X                 ; 4
    ror                          ; 2
    lsr                          ; 2
    sta    $BD,X                 ; 4
    inx                          ; 2
    cpx    #1                    ; 2
    beq    LF860                 ; 2³
    lda    $E1                   ; 3
    and    #$BF                  ; 2
    sta    $E1                   ; 3
    ldx    #5                    ; 2
    jsr    LF8DF                 ; 6
    bcc    LF885                 ; 2³
    lda    #$FF                  ; 2
    sta    $BE                   ; 3
    lda    $E1                   ; 3
    ora    #$40                  ; 2
    sta    $E1                   ; 3
LF885:
    bit    $E3                   ; 3
    bmi    LF88D                 ; 2³
    lda    #$FF                  ; 2
    sta    $BE                   ; 3
LF88D:
    lda    $BD                   ; 3
    sec                          ; 2
    sbc    $BE                   ; 3
    bcs    LF898                 ; 2³
    eor    #$FF                  ; 2
    adc    #1                    ; 2
LF898:
    cmp    #9                    ; 2
    bcs    LF8A5                 ; 2³
    lda    $FC                   ; 3
    and    #$01                  ; 2
    tax                          ; 2
    lda    #$FF                  ; 2
    sta    $BD,X                 ; 4
LF8A5:
    lda    $BE                   ; 3
    cmp    $BD                   ; 3
    ror    $BF                   ; 5
    lda    $FC                   ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    $FC                   ; 3
    and    #$04                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $B2                   ; 3
    lda    $DD,X                 ; 4
    bmi    LF8C8                 ; 2³
    lda    $D7,X                 ; 4
    asl                          ; 2
    bmi    LF8CC                 ; 2³
    lda    $D7,X                 ; 4
    and    #$03                  ; 2
    asl                          ; 2
    bcc    LF8CE                 ; 2³
LF8C8:
    lda    #8                    ; 2
    bne    LF8CE                 ; 3   always branch

LF8CC:
    lda    #$0A                  ; 2
LF8CE:
    ora    $B2                   ; 3
    jmp    LFFF0                 ; 3

LF8D3:
    .byte $00 ; |        | $F8D3
    .byte $01 ; |       X| $F8D4
    .byte $02 ; |      X | $F8D5
    .byte $01 ; |       X| $F8D6
LF8D7:
    .byte $00 ; |        | $F8D7
    .byte $03 ; |      XX| $F8D8
    .byte $06 ; |     XX | $F8D9
    .byte $09 ; |    X  X| $F8DA
LF8DB:
    .byte $80 ; |X       | $F8DB
    .byte $40 ; | X      | $F8DC
    .byte $20 ; |  X     | $F8DD
    .byte $10 ; |   X    | $F8DE

LF8DF:
    lda    $D7,X                 ; 4
    rol                          ; 2
    rol                          ; 2
    and    #$01                  ; 2
    sta    $B3                   ; 3
    lda    $D0                   ; 3
    sec                          ; 2
    sbc    $EA,X                 ; 4
    sta    $B2                   ; 3
    lda    #0                    ; 2
    sbc    $B3                   ; 3
    sta    $B3                   ; 3
    bpl    LF902                 ; 2³+1
    cmp    #$FF                  ; 2
    bne    LF908                 ; 2³+1
    lda    $B2                   ; 3
    cmp    #$75                  ; 2
    bcc    LF908                 ; 2³
    clc                          ; 2
LF901:
    rts                          ; 6

LF902:
    lda    $B2                   ; 3
    cmp    #$13                  ; 2
    bcc    LF901                 ; 2³
LF908:
    sec                          ; 2
    rts                          ; 6

LF90A:
    .byte $80 ; |X       | $F90A
    .byte $01 ; |       X| $F90B
    .byte $03 ; |      XX| $F90C
    .byte $02 ; |      X | $F90D
    .byte $80 ; |X       | $F90E
    .byte $02 ; |      X | $F90F
    .byte $03 ; |      XX| $F910
    .byte $01 ; |       X| $F911
    .byte $80 ; |X       | $F912
    .byte $03 ; |      XX| $F913
    .byte $01 ; |       X| $F914
    .byte $02 ; |      X | $F915
    .byte $80 ; |X       | $F916
    .byte $03 ; |      XX| $F917
    .byte $02 ; |      X | $F918
    .byte $01 ; |       X| $F919
    .byte $81 ; |X      X| $F91A
    .byte $02 ; |      X | $F91B
    .byte $03 ; |      XX| $F91C
    .byte $00 ; |        | $F91D
    .byte $81 ; |X      X| $F91E
    .byte $02 ; |      X | $F91F
    .byte $00 ; |        | $F920
    .byte $03 ; |      XX| $F921
    .byte $81 ; |X      X| $F922
    .byte $03 ; |      XX| $F923
    .byte $00 ; |        | $F924
    .byte $02 ; |      X | $F925
    .byte $81 ; |X      X| $F926
    .byte $00 ; |        | $F927
    .byte $03 ; |      XX| $F928
    .byte $02 ; |      X | $F929
    .byte $82 ; |X     X | $F92A
    .byte $01 ; |       X| $F92B
    .byte $00 ; |        | $F92C
    .byte $03 ; |      XX| $F92D
    .byte $82 ; |X     X | $F92E
    .byte $03 ; |      XX| $F92F
    .byte $00 ; |        | $F930
    .byte $01 ; |       X| $F931
    .byte $82 ; |X     X | $F932
    .byte $00 ; |        | $F933
    .byte $01 ; |       X| $F934
    .byte $03 ; |      XX| $F935
    .byte $82 ; |X     X | $F936
    .byte $00 ; |        | $F937
    .byte $03 ; |      XX| $F938
    .byte $01 ; |       X| $F939
    .byte $83 ; |X     XX| $F93A
    .byte $00 ; |        | $F93B
    .byte $02 ; |      X | $F93C
    .byte $01 ; |       X| $F93D
    .byte $83 ; |X     XX| $F93E
    .byte $01 ; |       X| $F93F
    .byte $02 ; |      X | $F940
    .byte $00 ; |        | $F941
    .byte $83 ; |X     XX| $F942
    .byte $01 ; |       X| $F943
    .byte $00 ; |        | $F944
    .byte $02 ; |      X | $F945
    .byte $83 ; |X     XX| $F946
    .byte $02 ; |      X | $F947
    .byte $00 ; |        | $F948
    .byte $01 ; |       X| $F949
    .byte $80 ; |X       | $F94A
LF94B:
    .byte $79 ; | XXXX  X| $F94B
    .byte $7C ; | XXXXX  | $F94C
    .byte $B1 ; |X XX   X| $F94D
    .byte $84 ; |X    X  | $F94E
LF94F:
    .byte $BA ; |X XXX X | $F94F
    .byte $BD ; |X XXXX X| $F950
    .byte $BD ; |X XXXX X| $F951
    .byte $BF ; |X XXXXXX| $F952
LF953:
    .byte $44 ; | X   X  | $F953
    .byte $DE ; |XX XXXX | $F954
    .byte $3C ; |  XXXX  | $F955
    .byte $C1 ; |XX     X| $F956
LF957:
    .byte $B8 ; |X XXX   | $F957
    .byte $B5 ; |X XX X X| $F958
    .byte $BD ; |X XXXX X| $F959
    .byte $BE ; |X XXXXX | $F95A
LF95B:
    .byte $06 ; |     XX | $F95B
    .byte $06 ; |     XX | $F95C
    .byte $03 ; |      XX| $F95D
    .byte $05 ; |     X X| $F95E

LF95F:
    lda    #8                    ; 2
    sta    AUDV0                 ; 3
LF963:
    lda    #$0D                  ; 2
    bpl    LF9C1                 ; 3   always branch

LF967:
    lda    #4                    ; 2
    sta    AUDC0                 ; 3
    lsr                          ; 2
    bpl    LF9C6                 ; 3   always branch

LF96E:
    ldx    $EF                   ; 3
    lda    LF94F,X               ; 4
    sta    $D5                   ; 3
    sta    $AA                   ; 3
    lda    LF94B,X               ; 4
    sta    $A9                   ; 3
    dec    $F0                   ; 5
    bpl    LF9FB                 ; 2³
    dec    $F4                   ; 5
    bpl    LF9C3                 ; 2³
    bit    $E9                   ; 3
    bpl    LF992                 ; 2³
    lda    #0                    ; 2
    sta    $E9                   ; 3
    sta    AUDV0                 ; 3
    sta    $F4                   ; 3
    bpl    LF9C3                 ; 3   always branch

LF992:
    inc    $F1                   ; 5
    ldy    $F1                   ; 3
    jsr    LFFDE                 ; 6
    cmp    #$FF                  ; 2
    beq    LFA02                 ; 2³+1
    sta    $E9                   ; 3
    sta    AUDF0                 ; 3
    and    #$60                  ; 2
    asl                          ; 2
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    sta    $F4                   ; 3
    lda    $E9                   ; 3
    cmp    #$CB                  ; 2
    beq    LF95F                 ; 2³
    cmp    #$9F                  ; 2
    beq    LF967                 ; 2³
    cmp    #$0A                  ; 2
    beq    LF963                 ; 2³
    and    #$1F                  ; 2
    beq    LF9BD                 ; 2³
    lda    #8                    ; 2
LF9BD:
    sta    AUDV0                 ; 3
    lda    #4                    ; 2
LF9C1:
    sta    AUDC0                 ; 3
LF9C3:
    lda    LF95B,X               ; 4
LF9C6:
    sta    $F0                   ; 3
    lda    LF957,X               ; 4
    sta    $AA                   ; 3
    lda    LF953,X               ; 4
    sta    $A9                   ; 3
    dec    $F5                   ; 5
    bpl    LF9FB                 ; 2³
    bit    $D4                   ; 3
    bmi    LFA22                 ; 2³+1
    inc    $F2                   ; 5
    ldy    $F2                   ; 3
    jsr    LFFDE                 ; 6
    sta    $D4                   ; 3
    sta    AUDF1                 ; 3
    and    #$60                  ; 2
    asl                          ; 2
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    sta    $F5                   ; 3
    lda    $D4                   ; 3
    and    #$1F                  ; 2
    beq    LF9F5                 ; 2³
    lda    #6                    ; 2
LF9F5:
    sta    AUDV1                 ; 3
    lda    #$0D                  ; 2
    sta    AUDC1                 ; 3
LF9FB:
    txa                          ; 2
    beq    LFA21                 ; 2³+1
    lda    INPT4                 ; 3
    bmi    LFA21                 ; 2³
LFA02:
    ldx    #0                    ; 2
    stx    AUDV0                 ; 3
    stx    AUDV1                 ; 3
    stx    $D5                   ; 3
    stx    $D4                   ; 3
    stx    $F4                   ; 3
    stx    $F5                   ; 3
    stx    $F0                   ; 3
    stx    $F2                   ; 3
    dex                          ; 2
    stx    $F1                   ; 3
    lda    $F8                   ; 3
    bpl    LFA21                 ; 2³
    ora    #$40                  ; 2
    sta    $F8                   ; 3
    stx    $F2                   ; 3
LFA21:
    rts                          ; 6

LFA22:
    lda    #0                    ; 2
    sta    $D4                   ; 3
    sta    $F5                   ; 3
    sta    AUDV1                 ; 3
    beq    LF9FB                 ; 3+1   always branch

LFA2C:
    ldx    $F3                   ; 3
    dex                          ; 2
    bne    LFA34                 ; 2³
    jmp    LF96E                 ; 3

LFA34:
    lda    $F8                   ; 3
    bpl    LFA40                 ; 2³
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    beq    LFA6E                 ; 3   always branch

LFA40:
    ldx    $F1                   ; 3
    cpx    #$FF                  ; 2
    beq    LFA61                 ; 2³
    lda    LFBCA,X               ; 4
    bmi    LFA5D                 ; 2³
    sta    AUDF0                 ; 3
    lda    LFA9C,X               ; 4
    sta    AUDC0                 ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDV0                 ; 3
    inx                          ; 2
    stx    $F1                   ; 3
    bne    LFA64                 ; 2³
LFA5D:
    ldx    #$FF                  ; 2
    stx    $F1                   ; 3
LFA61:
    inx                          ; 2
    stx    AUDV0                 ; 3
LFA64:
    lda    $F3                   ; 3
    cmp    #4                    ; 2
    bne    LFA6F                 ; 2³
    lda    #0                    ; 2
    sta    AUDV1                 ; 3
LFA6E:
    rts                          ; 6

LFA6F:
    ldx    $F2                   ; 3
    cpx    #$FF                  ; 2
    beq    LFA98                 ; 2³
LFA75:
    lda    LFC2F,X               ; 4
    bmi    LFA8B                 ; 2³
    sta    AUDF1                 ; 3
    lda    LFB00,X               ; 4
    sta    AUDC1                 ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDV1                 ; 3
    inx                          ; 2
    stx    $F2                   ; 3
    rts                          ; 6

LFA8B:
    cmp    #$FF                  ; 2
    beq    LFA94                 ; 2³
    and    #$7F                  ; 2
    tax                          ; 2
    bpl    LFA75                 ; 3   always branch

LFA94:
    ldx    #$FF                  ; 2
    stx    $F2                   ; 3
LFA98:
    inx                          ; 2
    stx    AUDV1                 ; 3
    rts                          ; 6

LFA9C:
    .byte $F2 ; |XXXX  X | $FA9C
    .byte $F2 ; |XXXX  X | $FA9D
    .byte $F2 ; |XXXX  X | $FA9E
    .byte $FF ; |XXXXXXXX| $FA9F
    .byte $9D ; |X  XXX X| $FAA0
    .byte $9D ; |X  XXX X| $FAA1
    .byte $9D ; |X  XXX X| $FAA2
    .byte $FF ; |XXXXXXXX| $FAA3
    .byte $9D ; |X  XXX X| $FAA4
    .byte $9D ; |X  XXX X| $FAA5
    .byte $9D ; |X  XXX X| $FAA6
    .byte $9D ; |X  XXX X| $FAA7
    .byte $9D ; |X  XXX X| $FAA8
    .byte $FF ; |XXXXXXXX| $FAA9
    .byte $A4 ; |X X  X  | $FAAA
    .byte $A4 ; |X X  X  | $FAAB
    .byte $A4 ; |X X  X  | $FAAC
    .byte $A4 ; |X X  X  | $FAAD
    .byte $A4 ; |X X  X  | $FAAE
    .byte $A4 ; |X X  X  | $FAAF
    .byte $AD ; |X X XX X| $FAB0
    .byte $AD ; |X X XX X| $FAB1
    .byte $AD ; |X X XX X| $FAB2
    .byte $AD ; |X X XX X| $FAB3
    .byte $AD ; |X X XX X| $FAB4
    .byte $A4 ; |X X  X  | $FAB5
    .byte $A4 ; |X X  X  | $FAB6
    .byte $A4 ; |X X  X  | $FAB7
    .byte $A4 ; |X X  X  | $FAB8
    .byte $A4 ; |X X  X  | $FAB9
    .byte $FF ; |XXXXXXXX| $FABA
    .byte $AD ; |X X XX X| $FABB
    .byte $AD ; |X X XX X| $FABC
    .byte $AD ; |X X XX X| $FABD
    .byte $AD ; |X X XX X| $FABE
    .byte $AD ; |X X XX X| $FABF
    .byte $AD ; |X X XX X| $FAC0
    .byte $0D ; |    XX X| $FAC1
    .byte $AD ; |X X XX X| $FAC2
    .byte $AD ; |X X XX X| $FAC3
    .byte $AD ; |X X XX X| $FAC4
    .byte $AD ; |X X XX X| $FAC5
    .byte $AD ; |X X XX X| $FAC6
    .byte $AD ; |X X XX X| $FAC7
    .byte $0D ; |    XX X| $FAC8
    .byte $AD ; |X X XX X| $FAC9
    .byte $AD ; |X X XX X| $FACA
    .byte $AD ; |X X XX X| $FACB
    .byte $AD ; |X X XX X| $FACC
    .byte $AD ; |X X XX X| $FACD
    .byte $A4 ; |X X  X  | $FACE
    .byte $FF ; |XXXXXXXX| $FACF
    .byte $F4 ; |XXXX X  | $FAD0
    .byte $F4 ; |XXXX X  | $FAD1
    .byte $F4 ; |XXXX X  | $FAD2
    .byte $F4 ; |XXXX X  | $FAD3
    .byte $F4 ; |XXXX X  | $FAD4
    .byte $F4 ; |XXXX X  | $FAD5
    .byte $04 ; |     X  | $FAD6
    .byte $04 ; |     X  | $FAD7
    .byte $04 ; |     X  | $FAD8
    .byte $04 ; |     X  | $FAD9
    .byte $04 ; |     X  | $FADA
    .byte $04 ; |     X  | $FADB
    .byte $F4 ; |XXXX X  | $FADC
    .byte $F4 ; |XXXX X  | $FADD
    .byte $F4 ; |XXXX X  | $FADE
    .byte $F4 ; |XXXX X  | $FADF
    .byte $F4 ; |XXXX X  | $FAE0
    .byte $F4 ; |XXXX X  | $FAE1
    .byte $04 ; |     X  | $FAE2
    .byte $04 ; |     X  | $FAE3
    .byte $04 ; |     X  | $FAE4
    .byte $04 ; |     X  | $FAE5
    .byte $04 ; |     X  | $FAE6
    .byte $04 ; |     X  | $FAE7
    .byte $F4 ; |XXXX X  | $FAE8
    .byte $F4 ; |XXXX X  | $FAE9
    .byte $F4 ; |XXXX X  | $FAEA
    .byte $F4 ; |XXXX X  | $FAEB
    .byte $F4 ; |XXXX X  | $FAEC
    .byte $F4 ; |XXXX X  | $FAED
    .byte $04 ; |     X  | $FAEE
    .byte $04 ; |     X  | $FAEF
    .byte $04 ; |     X  | $FAF0
    .byte $04 ; |     X  | $FAF1
    .byte $04 ; |     X  | $FAF2
    .byte $04 ; |     X  | $FAF3
    .byte $F4 ; |XXXX X  | $FAF4
    .byte $F4 ; |XXXX X  | $FAF5
    .byte $F4 ; |XXXX X  | $FAF6
    .byte $F4 ; |XXXX X  | $FAF7
    .byte $F4 ; |XXXX X  | $FAF8
    .byte $F4 ; |XXXX X  | $FAF9
    .byte $04 ; |     X  | $FAFA
    .byte $04 ; |     X  | $FAFB
    .byte $04 ; |     X  | $FAFC
    .byte $04 ; |     X  | $FAFD
    .byte $04 ; |     X  | $FAFE
    .byte $04 ; |     X  | $FAFF
LFB00:
    .byte $3D ; |  XXXX X| $FB00
    .byte $34 ; |  XX X  | $FB01
    .byte $3D ; |  XXXX X| $FB02
    .byte $34 ; |  XX X  | $FB03
    .byte $3D ; |  XXXX X| $FB04
    .byte $34 ; |  XX X  | $FB05
    .byte $3D ; |  XXXX X| $FB06
    .byte $34 ; |  XX X  | $FB07
    .byte $80 ; |X       | $FB08
    .byte $34 ; |  XX X  | $FB09
    .byte $34 ; |  XX X  | $FB0A
    .byte $34 ; |  XX X  | $FB0B
    .byte $34 ; |  XX X  | $FB0C
    .byte $34 ; |  XX X  | $FB0D
    .byte $30 ; |  XX    | $FB0E
    .byte $89 ; |X   X  X| $FB0F
    .byte $94 ; |X  X X  | $FB10
    .byte $94 ; |X  X X  | $FB11
    .byte $94 ; |X  X X  | $FB12
    .byte $94 ; |X  X X  | $FB13
    .byte $94 ; |X  X X  | $FB14
    .byte $94 ; |X  X X  | $FB15
    .byte $94 ; |X  X X  | $FB16
    .byte $94 ; |X  X X  | $FB17
    .byte $94 ; |X  X X  | $FB18
    .byte $94 ; |X  X X  | $FB19
    .byte $9D ; |X  XXX X| $FB1A
    .byte $9D ; |X  XXX X| $FB1B
    .byte $9D ; |X  XXX X| $FB1C
    .byte $90 ; |X  X    | $FB1D
    .byte $94 ; |X  X X  | $FB1E
    .byte $94 ; |X  X X  | $FB1F
    .byte $94 ; |X  X X  | $FB20
    .byte $94 ; |X  X X  | $FB21
    .byte $94 ; |X  X X  | $FB22
    .byte $94 ; |X  X X  | $FB23
    .byte $94 ; |X  X X  | $FB24
    .byte $9D ; |X  XXX X| $FB25
    .byte $9D ; |X  XXX X| $FB26
    .byte $9D ; |X  XXX X| $FB27
    .byte $9D ; |X  XXX X| $FB28
    .byte $00 ; |        | $FB29
    .byte $94 ; |X  X X  | $FB2A
    .byte $94 ; |X  X X  | $FB2B
    .byte $94 ; |X  X X  | $FB2C
    .byte $94 ; |X  X X  | $FB2D
    .byte $94 ; |X  X X  | $FB2E
    .byte $94 ; |X  X X  | $FB2F
    .byte $9D ; |X  XXX X| $FB30
    .byte $9D ; |X  XXX X| $FB31
    .byte $9D ; |X  XXX X| $FB32
    .byte $00 ; |        | $FB33
    .byte $94 ; |X  X X  | $FB34
    .byte $94 ; |X  X X  | $FB35
    .byte $94 ; |X  X X  | $FB36
    .byte $94 ; |X  X X  | $FB37
    .byte $94 ; |X  X X  | $FB38
    .byte $94 ; |X  X X  | $FB39
    .byte $94 ; |X  X X  | $FB3A
    .byte $9D ; |X  XXX X| $FB3B
    .byte $9D ; |X  XXX X| $FB3C
    .byte $9D ; |X  XXX X| $FB3D
    .byte $9D ; |X  XXX X| $FB3E
    .byte $04 ; |     X  | $FB3F
    .byte $94 ; |X  X X  | $FB40
    .byte $94 ; |X  X X  | $FB41
    .byte $94 ; |X  X X  | $FB42
    .byte $9D ; |X  XXX X| $FB43
    .byte $9D ; |X  XXX X| $FB44
    .byte $9D ; |X  XXX X| $FB45
    .byte $9D ; |X  XXX X| $FB46
    .byte $0D ; |    XX X| $FB47
    .byte $FF ; |XXXXXXXX| $FB48
    .byte $A1 ; |X X    X| $FB49
    .byte $A1 ; |X X    X| $FB4A
    .byte $A1 ; |X X    X| $FB4B
    .byte $A1 ; |X X    X| $FB4C
    .byte $A1 ; |X X    X| $FB4D
    .byte $A1 ; |X X    X| $FB4E
    .byte $A1 ; |X X    X| $FB4F
    .byte $A1 ; |X X    X| $FB50
    .byte $A1 ; |X X    X| $FB51
    .byte $A1 ; |X X    X| $FB52
    .byte $A1 ; |X X    X| $FB53
    .byte $01 ; |       X| $FB54
    .byte $FF ; |XXXXXXXX| $FB55
    .byte $FF ; |XXXXXXXX| $FB56
    .byte $4D ; | X  XX X| $FB57
    .byte $44 ; | X   X  | $FB58
    .byte $44 ; | X   X  | $FB59
    .byte $44 ; | X   X  | $FB5A
    .byte $4D ; | X  XX X| $FB5B
    .byte $44 ; | X   X  | $FB5C
    .byte $4D ; | X  XX X| $FB5D
    .byte $44 ; | X   X  | $FB5E
    .byte $44 ; | X   X  | $FB5F
    .byte $44 ; | X   X  | $FB60
    .byte $4D ; | X  XX X| $FB61
    .byte $44 ; | X   X  | $FB62
    .byte $4D ; | X  XX X| $FB63
    .byte $44 ; | X   X  | $FB64
    .byte $44 ; | X   X  | $FB65
    .byte $44 ; | X   X  | $FB66
    .byte $4D ; | X  XX X| $FB67
    .byte $44 ; | X   X  | $FB68
    .byte $D7 ; |XX X XXX| $FB69
    .byte $9D ; |X  XXX X| $FB6A
    .byte $9D ; |X  XXX X| $FB6B
    .byte $9D ; |X  XXX X| $FB6C
    .byte $9D ; |X  XXX X| $FB6D
    .byte $9D ; |X  XXX X| $FB6E
    .byte $0D ; |    XX X| $FB6F
    .byte $9D ; |X  XXX X| $FB70
    .byte $9D ; |X  XXX X| $FB71
    .byte $9D ; |X  XXX X| $FB72
    .byte $9D ; |X  XXX X| $FB73
    .byte $9D ; |X  XXX X| $FB74
    .byte $0D ; |    XX X| $FB75
    .byte $9D ; |X  XXX X| $FB76
    .byte $9D ; |X  XXX X| $FB77
    .byte $9D ; |X  XXX X| $FB78
    .byte $9D ; |X  XXX X| $FB79
    .byte $9D ; |X  XXX X| $FB7A
    .byte $0D ; |    XX X| $FB7B
    .byte $9D ; |X  XXX X| $FB7C
    .byte $9D ; |X  XXX X| $FB7D
    .byte $9D ; |X  XXX X| $FB7E
    .byte $9D ; |X  XXX X| $FB7F
    .byte $9D ; |X  XXX X| $FB80
    .byte $0D ; |    XX X| $FB81
    .byte $9D ; |X  XXX X| $FB82
    .byte $9D ; |X  XXX X| $FB83
    .byte $9D ; |X  XXX X| $FB84
    .byte $9D ; |X  XXX X| $FB85
    .byte $9D ; |X  XXX X| $FB86
    .byte $0D ; |    XX X| $FB87
    .byte $9D ; |X  XXX X| $FB88
    .byte $9D ; |X  XXX X| $FB89
    .byte $9D ; |X  XXX X| $FB8A
    .byte $9D ; |X  XXX X| $FB8B
    .byte $9D ; |X  XXX X| $FB8C
    .byte $0D ; |    XX X| $FB8D
    .byte $9D ; |X  XXX X| $FB8E
    .byte $9D ; |X  XXX X| $FB8F
    .byte $9D ; |X  XXX X| $FB90
    .byte $9D ; |X  XXX X| $FB91
    .byte $9D ; |X  XXX X| $FB92
    .byte $0D ; |    XX X| $FB93
    .byte $9D ; |X  XXX X| $FB94
    .byte $9D ; |X  XXX X| $FB95
    .byte $9D ; |X  XXX X| $FB96
    .byte $9D ; |X  XXX X| $FB97
    .byte $9D ; |X  XXX X| $FB98
    .byte $0D ; |    XX X| $FB99
    .byte $9D ; |X  XXX X| $FB9A
    .byte $9D ; |X  XXX X| $FB9B
    .byte $9D ; |X  XXX X| $FB9C
    .byte $9D ; |X  XXX X| $FB9D
    .byte $9D ; |X  XXX X| $FB9E
    .byte $0D ; |    XX X| $FB9F
    .byte $94 ; |X  X X  | $FBA0
    .byte $94 ; |X  X X  | $FBA1
    .byte $94 ; |X  X X  | $FBA2
    .byte $94 ; |X  X X  | $FBA3
    .byte $94 ; |X  X X  | $FBA4
    .byte $04 ; |     X  | $FBA5
    .byte $94 ; |X  X X  | $FBA6
    .byte $94 ; |X  X X  | $FBA7
    .byte $94 ; |X  X X  | $FBA8
    .byte $94 ; |X  X X  | $FBA9
    .byte $94 ; |X  X X  | $FBAA
    .byte $0D ; |    XX X| $FBAB
    .byte $94 ; |X  X X  | $FBAC
    .byte $94 ; |X  X X  | $FBAD
    .byte $94 ; |X  X X  | $FBAE
    .byte $94 ; |X  X X  | $FBAF
    .byte $94 ; |X  X X  | $FBB0
    .byte $04 ; |     X  | $FBB1
    .byte $94 ; |X  X X  | $FBB2
    .byte $94 ; |X  X X  | $FBB3
    .byte $94 ; |X  X X  | $FBB4
    .byte $94 ; |X  X X  | $FBB5
    .byte $94 ; |X  X X  | $FBB6
    .byte $0D ; |    XX X| $FBB7
    .byte $94 ; |X  X X  | $FBB8
    .byte $94 ; |X  X X  | $FBB9
    .byte $94 ; |X  X X  | $FBBA
    .byte $94 ; |X  X X  | $FBBB
    .byte $94 ; |X  X X  | $FBBC
    .byte $04 ; |     X  | $FBBD
    .byte $94 ; |X  X X  | $FBBE
    .byte $94 ; |X  X X  | $FBBF
    .byte $94 ; |X  X X  | $FBC0
    .byte $94 ; |X  X X  | $FBC1
    .byte $94 ; |X  X X  | $FBC2
    .byte $0D ; |    XX X| $FBC3
    .byte $94 ; |X  X X  | $FBC4
    .byte $94 ; |X  X X  | $FBC5
    .byte $94 ; |X  X X  | $FBC6
    .byte $94 ; |X  X X  | $FBC7
    .byte $94 ; |X  X X  | $FBC8
    .byte $04 ; |     X  | $FBC9
LFBCA:
    .byte $0A ; |    X X | $FBCA
    .byte $0A ; |    X X | $FBCB
    .byte $0A ; |    X X | $FBCC
    .byte $FF ; |XXXXXXXX| $FBCD
    .byte $13 ; |   X  XX| $FBCE
    .byte $0E ; |    XXX | $FBCF
    .byte $0A ; |    X X | $FBD0
    .byte $FF ; |XXXXXXXX| $FBD1
    .byte $13 ; |   X  XX| $FBD2
    .byte $1F ; |   XXXXX| $FBD3
    .byte $13 ; |   X  XX| $FBD4
    .byte $11 ; |   X   X| $FBD5
    .byte $0C ; |    XX  | $FBD6
    .byte $FF ; |XXXXXXXX| $FBD7
    .byte $0F ; |    XXXX| $FBD8
    .byte $11 ; |   X   X| $FBD9
    .byte $13 ; |   X  XX| $FBDA
    .byte $16 ; |   X XX | $FBDB
    .byte $19 ; |   XX  X| $FBDC
    .byte $1F ; |   XXXXX| $FBDD
    .byte $0B ; |    X XX| $FBDE
    .byte $0D ; |    XX X| $FBDF
    .byte $10 ; |   X    | $FBE0
    .byte $0D ; |    XX X| $FBE1
    .byte $0B ; |    X XX| $FBE2
    .byte $1F ; |   XXXXX| $FBE3
    .byte $19 ; |   XX  X| $FBE4
    .byte $16 ; |   X XX | $FBE5
    .byte $13 ; |   X  XX| $FBE6
    .byte $11 ; |   X   X| $FBE7
    .byte $FF ; |XXXXXXXX| $FBE8
    .byte $18 ; |   XX   | $FBE9
    .byte $1F ; |   XXXXX| $FBEA
    .byte $18 ; |   XX   | $FBEB
    .byte $10 ; |   X    | $FBEC
    .byte $0E ; |    XXX | $FBED
    .byte $16 ; |   X XX | $FBEE
    .byte $00 ; |        | $FBEF
    .byte $13 ; |   X  XX| $FBF0
    .byte $10 ; |   X    | $FBF1
    .byte $0E ; |    XXX | $FBF2
    .byte $0D ; |    XX X| $FBF3
    .byte $0C ; |    XX  | $FBF4
    .byte $0B ; |    X XX| $FBF5
    .byte $00 ; |        | $FBF6
    .byte $10 ; |   X    | $FBF7
    .byte $0E ; |    XXX | $FBF8
    .byte $0D ; |    XX X| $FBF9
    .byte $0A ; |    X X | $FBFA
    .byte $09 ; |    X  X| $FBFB
    .byte $16 ; |   X XX | $FBFC
    .byte $FF ; |XXXXXXXX| $FBFD
    .byte $07 ; |     XXX| $FBFE
    .byte $07 ; |     XXX| $FBFF
    .byte $07 ; |     XXX| $FC00
    .byte $07 ; |     XXX| $FC01
    .byte $07 ; |     XXX| $FC02
    .byte $07 ; |     XXX| $FC03
    .byte $07 ; |     XXX| $FC04
    .byte $07 ; |     XXX| $FC05
    .byte $07 ; |     XXX| $FC06
    .byte $07 ; |     XXX| $FC07
    .byte $07 ; |     XXX| $FC08
    .byte $07 ; |     XXX| $FC09
    .byte $07 ; |     XXX| $FC0A
    .byte $07 ; |     XXX| $FC0B
    .byte $07 ; |     XXX| $FC0C
    .byte $07 ; |     XXX| $FC0D
    .byte $07 ; |     XXX| $FC0E
    .byte $07 ; |     XXX| $FC0F
    .byte $07 ; |     XXX| $FC10
    .byte $07 ; |     XXX| $FC11
    .byte $07 ; |     XXX| $FC12
    .byte $07 ; |     XXX| $FC13
    .byte $07 ; |     XXX| $FC14
    .byte $07 ; |     XXX| $FC15
    .byte $07 ; |     XXX| $FC16
    .byte $07 ; |     XXX| $FC17
    .byte $07 ; |     XXX| $FC18
    .byte $07 ; |     XXX| $FC19
    .byte $07 ; |     XXX| $FC1A
    .byte $07 ; |     XXX| $FC1B
    .byte $07 ; |     XXX| $FC1C
    .byte $07 ; |     XXX| $FC1D
    .byte $07 ; |     XXX| $FC1E
    .byte $07 ; |     XXX| $FC1F
    .byte $07 ; |     XXX| $FC20
    .byte $07 ; |     XXX| $FC21
    .byte $07 ; |     XXX| $FC22
    .byte $07 ; |     XXX| $FC23
    .byte $07 ; |     XXX| $FC24
    .byte $07 ; |     XXX| $FC25
    .byte $07 ; |     XXX| $FC26
    .byte $07 ; |     XXX| $FC27
    .byte $07 ; |     XXX| $FC28
    .byte $07 ; |     XXX| $FC29
    .byte $07 ; |     XXX| $FC2A
    .byte $07 ; |     XXX| $FC2B
    .byte $07 ; |     XXX| $FC2C
    .byte $07 ; |     XXX| $FC2D
    .byte $FF ; |XXXXXXXX| $FC2E
LFC2F:
    .byte $1A ; |   XX X | $FC2F
    .byte $16 ; |   X XX | $FC30
    .byte $16 ; |   X XX | $FC31
    .byte $14 ; |   X X  | $FC32
    .byte $13 ; |   X  XX| $FC33
    .byte $12 ; |   X  X | $FC34
    .byte $11 ; |   X   X| $FC35
    .byte $10 ; |   X    | $FC36
    .byte $80 ; |X       | $FC37
    .byte $0D ; |    XX X| $FC38
    .byte $0C ; |    XX  | $FC39
    .byte $0B ; |    X XX| $FC3A
    .byte $0A ; |    X X | $FC3B
    .byte $09 ; |    X  X| $FC3C
    .byte $00 ; |        | $FC3D
    .byte $89 ; |X   X  X| $FC3E
    .byte $0B ; |    X XX| $FC3F
    .byte $0C ; |    XX  | $FC40
    .byte $0E ; |    XXX | $FC41
    .byte $10 ; |   X    | $FC42
    .byte $10 ; |   X    | $FC43
    .byte $12 ; |   X  X | $FC44
    .byte $13 ; |   X  XX| $FC45
    .byte $17 ; |   X XXX| $FC46
    .byte $1B ; |   XX XX| $FC47
    .byte $1F ; |   XXXXX| $FC48
    .byte $0D ; |    XX X| $FC49
    .byte $12 ; |   X  X | $FC4A
    .byte $1B ; |   XX XX| $FC4B
    .byte $00 ; |        | $FC4C
    .byte $0E ; |    XXX | $FC4D
    .byte $10 ; |   X    | $FC4E
    .byte $12 ; |   X  X | $FC4F
    .byte $14 ; |   X X  | $FC50
    .byte $16 ; |   X XX | $FC51
    .byte $18 ; |   XX   | $FC52
    .byte $1D ; |   XXX X| $FC53
    .byte $0C ; |    XX  | $FC54
    .byte $0D ; |    XX X| $FC55
    .byte $12 ; |   X  X | $FC56
    .byte $1B ; |   XX XX| $FC57
    .byte $00 ; |        | $FC58
    .byte $10 ; |   X    | $FC59
    .byte $12 ; |   X  X | $FC5A
    .byte $14 ; |   X X  | $FC5B
    .byte $17 ; |   X XXX| $FC5C
    .byte $1B ; |   XX XX| $FC5D
    .byte $1F ; |   XXXXX| $FC5E
    .byte $0D ; |    XX X| $FC5F
    .byte $12 ; |   X  X | $FC60
    .byte $1B ; |   XX XX| $FC61
    .byte $00 ; |        | $FC62
    .byte $13 ; |   X  XX| $FC63
    .byte $13 ; |   X  XX| $FC64
    .byte $16 ; |   X XX | $FC65
    .byte $18 ; |   XX   | $FC66
    .byte $1B ; |   XX XX| $FC67
    .byte $1F ; |   XXXXX| $FC68
    .byte $1F ; |   XXXXX| $FC69
    .byte $0B ; |    X XX| $FC6A
    .byte $0D ; |    XX X| $FC6B
    .byte $12 ; |   X  X | $FC6C
    .byte $1B ; |   XX XX| $FC6D
    .byte $00 ; |        | $FC6E
    .byte $17 ; |   X XXX| $FC6F
    .byte $1B ; |   XX XX| $FC70
    .byte $1F ; |   XXXXX| $FC71
    .byte $0D ; |    XX X| $FC72
    .byte $12 ; |   X  X | $FC73
    .byte $15 ; |   X X X| $FC74
    .byte $1B ; |   XX XX| $FC75
    .byte $00 ; |        | $FC76
    .byte $FF ; |XXXXXXXX| $FC77
    .byte $0F ; |    XXXX| $FC78
    .byte $11 ; |   X   X| $FC79
    .byte $13 ; |   X  XX| $FC7A
    .byte $16 ; |   X XX | $FC7B
    .byte $19 ; |   XX  X| $FC7C
    .byte $1F ; |   XXXXX| $FC7D
    .byte $19 ; |   XX  X| $FC7E
    .byte $16 ; |   X XX | $FC7F
    .byte $13 ; |   X  XX| $FC80
    .byte $11 ; |   X   X| $FC81
    .byte $0F ; |    XXXX| $FC82
    .byte $00 ; |        | $FC83
    .byte $FF ; |XXXXXXXX| $FC84
    .byte $FF ; |XXXXXXXX| $FC85
    .byte $0C ; |    XX  | $FC86
    .byte $12 ; |   X  X | $FC87
    .byte $0A ; |    X X | $FC88
    .byte $1B ; |   XX XX| $FC89
    .byte $12 ; |   X  X | $FC8A
    .byte $0D ; |    XX X| $FC8B
    .byte $0D ; |    XX X| $FC8C
    .byte $13 ; |   X  XX| $FC8D
    .byte $0B ; |    X XX| $FC8E
    .byte $1C ; |   XXX  | $FC8F
    .byte $13 ; |   X  XX| $FC90
    .byte $0E ; |    XXX | $FC91
    .byte $0E ; |    XXX | $FC92
    .byte $14 ; |   X X  | $FC93
    .byte $0C ; |    XX  | $FC94
    .byte $1D ; |   XXX X| $FC95
    .byte $14 ; |   X X  | $FC96
    .byte $0F ; |    XXXX| $FC97
    .byte $D7 ; |XX X XXX| $FC98
    .byte $1F ; |   XXXXX| $FC99
    .byte $1A ; |   XX X | $FC9A
    .byte $17 ; |   X XXX| $FC9B
    .byte $16 ; |   X XX | $FC9C
    .byte $0D ; |    XX X| $FC9D
    .byte $00 ; |        | $FC9E
    .byte $1D ; |   XXX X| $FC9F
    .byte $1A ; |   XX X | $FCA0
    .byte $17 ; |   X XXX| $FCA1
    .byte $16 ; |   X XX | $FCA2
    .byte $0D ; |    XX X| $FCA3
    .byte $00 ; |        | $FCA4
    .byte $1A ; |   XX X | $FCA5
    .byte $17 ; |   X XXX| $FCA6
    .byte $15 ; |   X X X| $FCA7
    .byte $0D ; |    XX X| $FCA8
    .byte $0C ; |    XX  | $FCA9
    .byte $00 ; |        | $FCAA
    .byte $16 ; |   X XX | $FCAB
    .byte $0F ; |    XXXX| $FCAC
    .byte $0E ; |    XXX | $FCAD
    .byte $0D ; |    XX X| $FCAE
    .byte $0C ; |    XX  | $FCAF
    .byte $00 ; |        | $FCB0
    .byte $13 ; |   X  XX| $FCB1
    .byte $0E ; |    XXX | $FCB2
    .byte $0D ; |    XX X| $FCB3
    .byte $0C ; |    XX  | $FCB4
    .byte $0B ; |    X XX| $FCB5
    .byte $00 ; |        | $FCB6
    .byte $10 ; |   X    | $FCB7
    .byte $0D ; |    XX X| $FCB8
    .byte $0C ; |    XX  | $FCB9
    .byte $0B ; |    X XX| $FCBA
    .byte $0A ; |    X X | $FCBB
    .byte $00 ; |        | $FCBC
    .byte $0E ; |    XXX | $FCBD
    .byte $0C ; |    XX  | $FCBE
    .byte $0B ; |    X XX| $FCBF
    .byte $0A ; |    X X | $FCC0
    .byte $09 ; |    X  X| $FCC1
    .byte $00 ; |        | $FCC2
    .byte $0C ; |    XX  | $FCC3
    .byte $0B ; |    X XX| $FCC4
    .byte $0A ; |    X X | $FCC5
    .byte $09 ; |    X  X| $FCC6
    .byte $08 ; |    X   | $FCC7
    .byte $00 ; |        | $FCC8
    .byte $0B ; |    X XX| $FCC9
    .byte $0A ; |    X X | $FCCA
    .byte $09 ; |    X  X| $FCCB
    .byte $08 ; |    X   | $FCCC
    .byte $07 ; |     XXX| $FCCD
    .byte $00 ; |        | $FCCE
    .byte $1D ; |   XXX X| $FCCF
    .byte $1B ; |   XX XX| $FCD0
    .byte $19 ; |   XX  X| $FCD1
    .byte $17 ; |   X XXX| $FCD2
    .byte $16 ; |   X XX | $FCD3
    .byte $00 ; |        | $FCD4
    .byte $1A ; |   XX X | $FCD5
    .byte $18 ; |   XX   | $FCD6
    .byte $16 ; |   X XX | $FCD7
    .byte $14 ; |   X X  | $FCD8
    .byte $13 ; |   X  XX| $FCD9
    .byte $00 ; |        | $FCDA
    .byte $19 ; |   XX  X| $FCDB
    .byte $16 ; |   X XX | $FCDC
    .byte $14 ; |   X X  | $FCDD
    .byte $12 ; |   X  X | $FCDE
    .byte $10 ; |   X    | $FCDF
    .byte $00 ; |        | $FCE0
    .byte $17 ; |   X XXX| $FCE1
    .byte $15 ; |   X X X| $FCE2
    .byte $12 ; |   X  X | $FCE3
    .byte $10 ; |   X    | $FCE4
    .byte $0F ; |    XXXX| $FCE5
    .byte $00 ; |        | $FCE6
    .byte $15 ; |   X X X| $FCE7
    .byte $12 ; |   X  X | $FCE8
    .byte $10 ; |   X    | $FCE9
    .byte $0F ; |    XXXX| $FCEA
    .byte $0E ; |    XXX | $FCEB
    .byte $00 ; |        | $FCEC
    .byte $13 ; |   X  XX| $FCED
    .byte $10 ; |   X    | $FCEE
    .byte $0F ; |    XXXX| $FCEF
    .byte $0E ; |    XXX | $FCF0
    .byte $0D ; |    XX X| $FCF1
    .byte $00 ; |        | $FCF2
    .byte $10 ; |   X    | $FCF3
    .byte $0F ; |    XXXX| $FCF4
    .byte $0E ; |    XXX | $FCF5
    .byte $0D ; |    XX X| $FCF6
    .byte $0C ; |    XX  | $FCF7
    .byte $00 ; |        | $FCF8
    .byte $89 ; |X   X  X| $FCF9

LFCFA:
    sta    $C0                   ; 3
    lda    $BE                   ; 3
    cmp    #6                    ; 2
    php                          ; 3
    bcc    LFD09                 ; 2³
    tay                          ; 2
    lda    LFD46,Y               ; 4
    sta    $BE                   ; 3
LFD09:
    ldy    $F6                   ; 3
    lda    LFD62,Y               ; 4
    sta    $BF                   ; 3
    lda    LFFD3,Y               ; 4
    ldy    $C0                   ; 3
    sta    $C0                   ; 3
    lda    $BE                   ; 3
    lsr                          ; 2
    php                          ; 3
    clc                          ; 2
    adc    LFD50,Y               ; 4
    tay                          ; 2
    lda    ($BF),Y               ; 5
    plp                          ; 4
    bcs    LFD2E                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    plp                          ; 4
    bcs    LFD35                 ; 2³
    bcc    LFD39                 ; 3   always branch

LFD2E:
    and    #$0F                  ; 2
    plp                          ; 4
    bcs    LFD35                 ; 2³
    bcc    LFD39                 ; 3   always branch

LFD35:
    tay                          ; 2
    lda    LFD3C,Y               ; 4
LFD39:
    jmp    LFFE7                 ; 3

LFD3C:
    .byte $00 ; |        | $FD3C
    .byte $01 ; |       X| $FD3D
    .byte $08 ; |    X   | $FD3E
    .byte $09 ; |    X  X| $FD3F
    .byte $04 ; |     X  | $FD40
    .byte $05 ; |     X X| $FD41
    .byte $0C ; |    XX  | $FD42
    .byte $0D ; |    XX X| $FD43
    .byte $02 ; |      X | $FD44
    .byte $03 ; |      XX| $FD45
LFD46:
    .byte $0A ; |    X X | $FD46
    .byte $0B ; |    X XX| $FD47
    .byte $06 ; |     XX | $FD48
    .byte $07 ; |     XXX| $FD49
    .byte $0E ; |    XXX | $FD4A
    .byte $0F ; |    XXXX| $FD4B
    .byte $04 ; |     X  | $FD4C
    .byte $03 ; |      XX| $FD4D
    .byte $02 ; |      X | $FD4E
    .byte $01 ; |       X| $FD4F
LFD50:
    .byte $00 ; |        | $FD50
    .byte $03 ; |      XX| $FD51
    .byte $06 ; |     XX | $FD52
    .byte $09 ; |    X  X| $FD53
    .byte $0C ; |    XX  | $FD54
    .byte $0F ; |    XXXX| $FD55
    .byte $12 ; |   X  X | $FD56
    .byte $15 ; |   X X X| $FD57
    .byte $18 ; |   XX   | $FD58
    .byte $1B ; |   XX XX| $FD59
    .byte $1E ; |   XXXX | $FD5A
    .byte $21 ; |  X    X| $FD5B
    .byte $24 ; |  X  X  | $FD5C
    .byte $27 ; |  X  XXX| $FD5D
    .byte $2A ; |  X X X | $FD5E
    .byte $2D ; |  X XX X| $FD5F
    .byte $30 ; |  XX    | $FD60
    .byte $33 ; |  XX  XX| $FD61
LFD62:
    .byte $80 ; |X       | $FD62
    .byte $B6 ; |X XX XX | $FD63
    .byte $EC ; |XXX XX  | $FD64
    .byte $22 ; |  X   X | $FD65
    .byte $58 ; | X XX   | $FD66
    .byte $8E ; |X   XXX | $FD67
    .byte $C4 ; |XX   X  | $FD68
LFD69:
    .byte $00 ; |        | $FD69
    .byte $18 ; |   XX   | $FD6A
    .byte $18 ; |   XX   | $FD6B
    .byte $18 ; |   XX   | $FD6C
    .byte $DF ; |XX XXXXX| $FD6D
    .byte $7F ; | XXXXXXX| $FD6E
    .byte $BF ; |X XXXXXX| $FD6F
    .byte $EF ; |XXX XXXX| $FD70
    .byte $FB ; |XXXXX XX| $FD71
    .byte $FE ; |XXXXXXX | $FD72
    .byte $FD ; |XXXXXX X| $FD73
    .byte $F7 ; |XXXX XXX| $FD74
    .byte $DF ; |XX XXXXX| $FD75
    .byte $7F ; | XXXXXXX| $FD76
    .byte $DF ; |XX XXXXX| $FD77
    .byte $F7 ; |XXXX XXX| $FD78
    .byte $FD ; |XXXXXX X| $FD79
    .byte $FE ; |XXXXXXX | $FD7A
    .byte $FB ; |XXXXX XX| $FD7B
    .byte $EF ; |XXX XXXX| $FD7C
    .byte $BF ; |X XXXXXX| $FD7D
    .byte $BF ; |X XXXXXX| $FD7E
    .byte $EF ; |XXX XXXX| $FD7F
    .byte $06 ; |     XX | $FD80
    .byte $EA ; |XXX X X | $FD81
    .byte $C0 ; |XX      | $FD82
    .byte $69 ; | XX X  X| $FD83
    .byte $7C ; | XXXXX  | $FD84
    .byte $50 ; | X X    | $FD85
    .byte $56 ; | X X XX | $FD86
    .byte $97 ; |X  X XXX| $FD87
    .byte $BA ; |X XXX X | $FD88
    .byte $3F ; |  XXXXXX| $FD89
    .byte $EB ; |XXX X XX| $FD8A
    .byte $AA ; |X X X X | $FD8B
    .byte $6D ; | XX XX X| $FD8C
    .byte $7E ; | XXXXXX | $FD8D
    .byte $AE ; |X X XXX | $FD8E
    .byte $53 ; | X X  XX| $FD8F
    .byte $D5 ; |XX X X X| $FD90
    .byte $6B ; | XX X XX| $FD91
    .byte $56 ; | X X XX | $FD92
    .byte $FF ; |XXXXXXXX| $FD93
    .byte $90 ; |X  X    | $FD94
    .byte $3D ; |  XXXX X| $FD95
    .byte $57 ; | X X XXX| $FD96
    .byte $AA ; |X X X X | $FD97
    .byte $69 ; | XX X  X| $FD98
    .byte $7D ; | XXXXX X| $FD99
    .byte $2A ; |  X X X | $FD9A
    .byte $7A ; | XXXX X | $FD9B
    .byte $D7 ; |XX X XXX| $FD9C
    .byte $AA ; |X X X X | $FD9D
    .byte $3C ; |  XXXX  | $FD9E
    .byte $57 ; | X X XXX| $FD9F
    .byte $C0 ; |XX      | $FDA0
    .byte $6F ; | XX XXXX| $FDA1
    .byte $F9 ; |XXXXX  X| $FDA2
    .byte $7A ; | XXXX X | $FDA3
    .byte $55 ; | X X X X| $FDA4
    .byte $7A ; | XXXX X | $FDA5
    .byte $D0 ; |XX X    | $FDA6
    .byte $79 ; | XXXX  X| $FDA7
    .byte $7C ; | XXXXX  | $FDA8
    .byte $50 ; | X X    | $FDA9
    .byte $7E ; | XXXXXX | $FDAA
    .byte $97 ; |X  X XXX| $FDAB
    .byte $BA ; |X XXX X | $FDAC
    .byte $57 ; | X X XXX| $FDAD
    .byte $EF ; |XXX XXXX| $FDAE
    .byte $AA ; |X X X X | $FDAF
    .byte $3D ; |  XXXX X| $FDB0
    .byte $57 ; | X X XXX| $FDB1
    .byte $C0 ; |XX      | $FDB2
    .byte $03 ; |      XX| $FDB3
    .byte $B9 ; |X XXX  X| $FDB4
    .byte $3A ; |  XXX X | $FDB5
    .byte $06 ; |     XX | $FDB6
    .byte $EA ; |XXX X X | $FDB7
    .byte $C0 ; |XX      | $FDB8
    .byte $6D ; | XX XX X| $FDB9
    .byte $56 ; | X X XX | $FDBA
    .byte $BE ; |X XXXXX | $FDBB
    .byte $55 ; | X X X X| $FDBC
    .byte $3D ; |  XXXX X| $FDBD
    .byte $05 ; |     X X| $FDBE
    .byte $7B ; | XXXX XX| $FDBF
    .byte $ED ; |XXX XX X| $FDC0
    .byte $05 ; |     X X| $FDC1
    .byte $7C ; | XXXXX  | $FDC2
    .byte $57 ; | X X XXX| $FDC3
    .byte $AB ; |X X X XX| $FDC4
    .byte $55 ; | X X X X| $FDC5
    .byte $53 ; | X X  XX| $FDC6
    .byte $C0 ; |XX      | $FDC7
    .byte $7D ; | XXXXX X| $FDC8
    .byte $7E ; | XXXXXX | $FDC9
    .byte $BA ; |X XXX X | $FDCA
    .byte $53 ; | X X  XX| $FDCB
    .byte $97 ; |X  X XXX| $FDCC
    .byte $AA ; |X X X X | $FDCD
    .byte $56 ; | X X XX | $FDCE
    .byte $C5 ; |XX   X X| $FDCF
    .byte $2A ; |  X X X | $FDD0
    .byte $7D ; | XXXXX X| $FDD1
    .byte $7F ; | XXXXXXX| $FDD2
    .byte $AA ; |X X X X | $FDD3
    .byte $55 ; | X X X X| $FDD4
    .byte $53 ; | X X  XX| $FDD5
    .byte $EA ; |XXX X X | $FDD6
    .byte $79 ; | XXXX  X| $FDD7
    .byte $56 ; | X X XX | $FDD8
    .byte $BA ; |X XXX X | $FDD9
    .byte $7E ; | XXXXXX | $FDDA
    .byte $97 ; |X  X XXX| $FDDB
    .byte $EA ; |XXX X X | $FDDC
    .byte $55 ; | X X X X| $FDDD
    .byte $69 ; | XX X  X| $FDDE
    .byte $7A ; | XXXX X | $FDDF
    .byte $57 ; | X X XXX| $FDE0
    .byte $96 ; |X  X XX | $FDE1
    .byte $D0 ; |XX X    | $FDE2
    .byte $79 ; | XXXX  X| $FDE3
    .byte $69 ; | XX X  X| $FDE4
    .byte $7A ; | XXXX X | $FDE5
    .byte $3E ; |  XXXXX | $FDE6
    .byte $96 ; |X  X XX | $FDE7
    .byte $D0 ; |XX X    | $FDE8
    .byte $03 ; |      XX| $FDE9
    .byte $A9 ; |X X X  X| $FDEA
    .byte $3A ; |  XXX X | $FDEB
    .byte $06 ; |     XX | $FDEC
    .byte $C6 ; |XX   XX | $FDED
    .byte $C0 ; |XX      | $FDEE
    .byte $69 ; | XX X  X| $FDEF
    .byte $7D ; | XXXXX X| $FDF0
    .byte $3E ; |  XXXXX | $FDF1
    .byte $7E ; | XXXXXX | $FDF2
    .byte $93 ; |X  X  XX| $FDF3
    .byte $EB ; |XXX X XX| $FDF4
    .byte $53 ; | X X  XX| $FDF5
    .byte $AC ; |X X XX  | $FDF6
    .byte $7A ; | XXXX X | $FDF7
    .byte $3C ; |  XXXX  | $FDF8
    .byte $6F ; | XX XXXX| $FDF9
    .byte $90 ; |X  X    | $FDFA
    .byte $6B ; | XX X XX| $FDFB
    .byte $D3 ; |XX X  XX| $FDFC
    .byte $AE ; |X X XXX | $FDFD
    .byte $3C ; |  XXXX  | $FDFE
    .byte $7C ; | XXXXX  | $FDFF
    .byte $6B ; | XX X XX| $FE00
    .byte $07 ; |     XXX| $FE01
    .byte $97 ; |X  X XXX| $FE02
    .byte $BA ; |X XXX X | $FE03
    .byte $6B ; | XX X XX| $FE04
    .byte $ED ; |XXX XX X| $FE05
    .byte $2A ; |  X X X | $FE06
    .byte $3E ; |  XXXXX | $FE07
    .byte $93 ; |X  X  XX| $FE08
    .byte $EA ; |XXX X X | $FE09
    .byte $05 ; |     X X| $FE0A
    .byte $6E ; | XX XXX | $FE0B
    .byte $D0 ; |XX X    | $FE0C
    .byte $6B ; | XX X XX| $FE0D
    .byte $F9 ; |XXXXX  X| $FE0E
    .byte $3E ; |  XXXXX | $FE0F
    .byte $3C ; |  XXXX  | $FE10
    .byte $3C ; |  XXXX  | $FE11
    .byte $6B ; | XX X XX| $FE12
    .byte $6D ; | XX XX X| $FE13
    .byte $6F ; | XX XXXX| $FE14
    .byte $90 ; |X  X    | $FE15
    .byte $53 ; | X X  XX| $FE16
    .byte $93 ; |X  X  XX| $FE17
    .byte $C0 ; |XX      | $FE18
    .byte $7A ; | XXXX X | $FE19
    .byte $EC ; |XXX XX  | $FE1A
    .byte $7A ; | XXXX X | $FE1B
    .byte $56 ; | X X XX | $FE1C
    .byte $D7 ; |XX X XXX| $FE1D
    .byte $90 ; |X  X    | $FE1E
    .byte $39 ; |  XXX  X| $FE1F
    .byte $3B ; |  XXX XX| $FE20
    .byte $AA ; |X X X X | $FE21
    .byte $6E ; | XX XXX | $FE22
    .byte $EE ; |XXX XXX | $FE23
    .byte $C0 ; |XX      | $FE24
    .byte $55 ; | X X X X| $FE25
    .byte $55 ; | X X X X| $FE26
    .byte $50 ; | X X    | $FE27
    .byte $3B ; |  XXX XX| $FE28
    .byte $FF ; |XXXXXXXX| $FE29
    .byte $BE ; |X XXXXX | $FE2A
    .byte $6A ; | XX X X | $FE2B
    .byte $95 ; |X  X X X| $FE2C
    .byte $6B ; | XX X XX| $FE2D
    .byte $7A ; | XXXX X | $FE2E
    .byte $A9 ; |X X X  X| $FE2F
    .byte $50 ; | X X    | $FE30
    .byte $56 ; | X X XX | $FE31
    .byte $AE ; |X X XXX | $FE32
    .byte $BA ; |X XXX X | $FE33
    .byte $3D ; |  XXXX X| $FE34
    .byte $6B ; | XX X XX| $FE35
    .byte $EA ; |XXX X X | $FE36
    .byte $6F ; | XX XXXX| $FE37
    .byte $D6 ; |XX X XX | $FE38
    .byte $BA ; |X XXX X | $FE39
    .byte $55 ; | X X X X| $FE3A
    .byte $55 ; | X X X X| $FE3B
    .byte $2A ; |  X X X | $FE3C
    .byte $55 ; | X X X X| $FE3D
    .byte $3F ; |  XXXXXX| $FE3E
    .byte $C0 ; |XX      | $FE3F
    .byte $7B ; | XXXX XX| $FE40
    .byte $C5 ; |XX   X X| $FE41
    .byte $7A ; | XXXX X | $FE42
    .byte $3C ; |  XXXX  | $FE43
    .byte $7F ; | XXXXXXX| $FE44
    .byte $D0 ; |XX X    | $FE45
    .byte $6F ; | XX XXXX| $FE46
    .byte $D5 ; |XX X X X| $FE47
    .byte $3E ; |  XXXXX | $FE48
    .byte $55 ; | X X X X| $FE49
    .byte $53 ; | X X  XX| $FE4A
    .byte $EB ; |XXX X XX| $FE4B
    .byte $79 ; | XXXX  X| $FE4C
    .byte $3C ; |  XXXX  | $FE4D
    .byte $50 ; | X X    | $FE4E
    .byte $7E ; | XXXXXX | $FE4F
    .byte $C7 ; |XX   XXX| $FE50
    .byte $FA ; |XXXXX X | $FE51
    .byte $55 ; | X X X X| $FE52
    .byte $55 ; | X X X X| $FE53
    .byte $50 ; | X X    | $FE54
    .byte $3B ; |  XXX XX| $FE55
    .byte $BB ; |X XXX XX| $FE56
    .byte $90 ; |X  X    | $FE57
    .byte $6A ; | XX X X | $FE58
    .byte $C6 ; |XX   XX | $FE59
    .byte $AE ; |X X XXX | $FE5A
    .byte $7E ; | XXXXXX | $FE5B
    .byte $BF ; |X XXXXXX| $FE5C
    .byte $AB ; |X X X XX| $FE5D
    .byte $7B ; | XXXX XX| $FE5E
    .byte $EB ; |XXX X XX| $FE5F
    .byte $EA ; |XXX X X | $FE60
    .byte $7A ; | XXXX X | $FE61
    .byte $FA ; |XXXXX X | $FE62
    .byte $FA ; |XXXXX X | $FE63
    .byte $7A ; | XXXX X | $FE64
    .byte $FE ; |XXXXXXX | $FE65
    .byte $BA ; |X XXX X | $FE66
    .byte $7E ; | XXXXXX | $FE67
    .byte $97 ; |X  X XXX| $FE68
    .byte $AE ; |X X XXX | $FE69
    .byte $57 ; | X X XXX| $FE6A
    .byte $AF ; |X X XXXX| $FE6B
    .byte $AB ; |X X X XX| $FE6C
    .byte $3B ; |  XXX XX| $FE6D
    .byte $C7 ; |XX   XXX| $FE6E
    .byte $AA ; |X X X X | $FE6F
    .byte $6E ; | XX XXX | $FE70
    .byte $95 ; |X  X X X| $FE71
    .byte $2A ; |  X X X | $FE72
    .byte $57 ; | X X XXX| $FE73
    .byte $EF ; |XXX XXXX| $FE74
    .byte $EA ; |XXX X X | $FE75
    .byte $7D ; | XXXXX X| $FE76
    .byte $57 ; | X X XXX| $FE77
    .byte $D0 ; |XX X    | $FE78
    .byte $57 ; | X X XXX| $FE79
    .byte $BD ; |X XXXX X| $FE7A
    .byte $7A ; | XXXX X | $FE7B
    .byte $3F ; |  XXXXXX| $FE7C
    .byte $AF ; |X X XXXX| $FE7D
    .byte $BA ; |X XXX X | $FE7E
    .byte $6B ; | XX X XX| $FE7F
    .byte $EB ; |XXX X XX| $FE80
    .byte $EA ; |XXX X X | $FE81
    .byte $56 ; | X X XX | $FE82
    .byte $BE ; |X XXXXX | $FE83
    .byte $FA ; |XXXXX X | $FE84
    .byte $3F ; |  XXXXXX| $FE85
    .byte $AD ; |X X XX X| $FE86
    .byte $50 ; | X X    | $FE87
    .byte $6B ; | XX X XX| $FE88
    .byte $EB ; |XXX X XX| $FE89
    .byte $FA ; |XXXXX X | $FE8A
    .byte $3A ; |  XXX X | $FE8B
    .byte $BA ; |X XXX X | $FE8C
    .byte $90 ; |X  X    | $FE8D
    .byte $6E ; | XX XXX | $FE8E
    .byte $C6 ; |XX   XX | $FE8F
    .byte $EA ; |XXX X X | $FE90
    .byte $55 ; | X X X X| $FE91
    .byte $39 ; |  XXX  X| $FE92
    .byte $50 ; | X X    | $FE93
    .byte $7F ; | XXXXXXX| $FE94
    .byte $C6 ; |XX   XX | $FE95
    .byte $FA ; |XXXXX X | $FE96
    .byte $55 ; | X X X X| $FE97
    .byte $39 ; |  XXX  X| $FE98
    .byte $7A ; | XXXX X | $FE99
    .byte $7B ; | XXXX XX| $FE9A
    .byte $C6 ; |XX   XX | $FE9B
    .byte $90 ; |X  X    | $FE9C
    .byte $56 ; | X X XX | $FE9D
    .byte $FD ; |XXXXXX X| $FE9E
    .byte $6A ; | XX X X | $FE9F
    .byte $79 ; | XXXX  X| $FEA0
    .byte $53 ; | X X  XX| $FEA1
    .byte $D0 ; |XX X    | $FEA2
    .byte $3E ; |  XXXXX | $FEA3
    .byte $D6 ; |XX X XX | $FEA4
    .byte $BA ; |X XXX X | $FEA5
    .byte $6D ; | XX XX X| $FEA6
    .byte $3D ; |  XXXX X| $FEA7
    .byte $2A ; |  X X X | $FEA8
    .byte $57 ; | X X XXX| $FEA9
    .byte $AF ; |X X XXXX| $FEAA
    .byte $AA ; |X X X X | $FEAB
    .byte $7F ; | XXXXXXX| $FEAC
    .byte $AD ; |X X XX X| $FEAD
    .byte $6A ; | XX X X | $FEAE
    .byte $53 ; | X X  XX| $FEAF
    .byte $C3 ; |XX    XX| $FEB0
    .byte $D0 ; |XX X    | $FEB1
    .byte $56 ; | X X XX | $FEB2
    .byte $96 ; |X  X XX | $FEB3
    .byte $D0 ; |XX X    | $FEB4
    .byte $3B ; |  XXX XX| $FEB5
    .byte $ED ; |XXX XX X| $FEB6
    .byte $3A ; |  XXX X | $FEB7
    .byte $6A ; | XX X X | $FEB8
    .byte $D7 ; |XX X XXX| $FEB9
    .byte $C0 ; |XX      | $FEBA
    .byte $3C ; |  XXXX  | $FEBB
    .byte $3D ; |  XXXX X| $FEBC
    .byte $3A ; |  XXX X | $FEBD
    .byte $69 ; | XX X  X| $FEBE
    .byte $6B ; | XX X XX| $FEBF
    .byte $C0 ; |XX      | $FEC0
    .byte $3A ; |  XXX X | $FEC1
    .byte $BA ; |X XXX X | $FEC2
    .byte $BA ; |X XXX X | $FEC3
    .byte $6A ; | XX X X | $FEC4
    .byte $AC ; |X X XX  | $FEC5
    .byte $6A ; | XX X X | $FEC6
    .byte $56 ; | X X XX | $FEC7
    .byte $C7 ; |XX   XXX| $FEC8
    .byte $D0 ; |XX X    | $FEC9
    .byte $53 ; | X X  XX| $FECA
    .byte $FD ; |XXXXXX X| $FECB
    .byte $3A ; |  XXX X | $FECC
    .byte $3A ; |  XXX X | $FECD
    .byte $BF ; |X XXXXXX| $FECE
    .byte $AA ; |X X X X | $FECF
    .byte $6A ; | XX X X | $FED0
    .byte $EB ; |XXX X XX| $FED1
    .byte $EA ; |XXX X X | $FED2
    .byte $7E ; | XXXXXX | $FED3
    .byte $BA ; |X XXX X | $FED4
    .byte $D0 ; |XX X    | $FED5
    .byte $55 ; | X X X X| $FED6
    .byte $6C ; | XX XX  | $FED7
    .byte $7A ; | XXXX X | $FED8
    .byte $53 ; | X X  XX| $FED9
    .byte $D7 ; |XX X XXX| $FEDA
    .byte $BA ; |X XXX X | $FEDB
    .byte $7A ; | XXXX X | $FEDC
    .byte $FD ; |XXXXXX X| $FEDD
    .byte $2A ; |  X X X | $FEDE
    .byte $56 ; | X X XX | $FEDF
    .byte $D7 ; |XX X XXX| $FEE0
    .byte $EA ; |XXX X X | $FEE1
    .byte $55 ; | X X X X| $FEE2
    .byte $39 ; |  XXX  X| $FEE3
    .byte $7A ; | XXXX X | $FEE4
    .byte $3F ; |  XXXXXX| $FEE5
    .byte $AA ; |X X X X | $FEE6
    .byte $D0 ; |XX X    | $FEE7
    .byte $6B ; | XX X XX| $FEE8
    .byte $C6 ; |XX   XX | $FEE9
    .byte $D0 ; |XX X    | $FEEA
    .byte $3A ; |  XXX X | $FEEB
    .byte $BF ; |X XXXXXX| $FEEC
    .byte $BA ; |X XXX X | $FEED
    .byte $6A ; | XX X X | $FEEE
    .byte $EF ; |XXX XXXX| $FEEF
    .byte $AA ; |X X X X | $FEF0
    .byte $56 ; | X X XX | $FEF1
    .byte $FD ; |XXXXXX X| $FEF2
    .byte $6A ; | XX X X | $FEF3
    .byte $53 ; | X X  XX| $FEF4
    .byte $95 ; |X  X X X| $FEF5
    .byte $50 ; | X X    | $FEF6
    .byte $3A ; |  XXX X | $FEF7
    .byte $AB ; |X X X XX| $FEF8
    .byte $BA ; |X XXX X | $FEF9
    .byte $FF ; |XXXXXXXX| $FEFA
    .byte $FF ; |XXXXXXXX| $FEFB
    .byte $FF ; |XXXXXXXX| $FEFC
    .byte $FF ; |XXXXXXXX| $FEFD
    .byte $FF ; |XXXXXXXX| $FEFE
    .byte $FF ; |XXXXXXXX| $FEFF


    .byte $38 ; |  XXX   | $FF00
    .byte $6C ; | XX XX  | $FF01
    .byte $C6 ; |XX   XX | $FF02
    .byte $C6 ; |XX   XX | $FF03
    .byte $C6 ; |XX   XX | $FF04
    .byte $6C ; | XX XX  | $FF05
    .byte $38 ; |  XXX   | $FF06
    .byte $00 ; |        | $FF07
    .byte $7E ; | XXXXXX | $FF08
    .byte $18 ; |   XX   | $FF09
    .byte $18 ; |   XX   | $FF0A
    .byte $18 ; |   XX   | $FF0B
    .byte $18 ; |   XX   | $FF0C
    .byte $38 ; |  XXX   | $FF0D
    .byte $18 ; |   XX   | $FF0E
    .byte $00 ; |        | $FF0F
    .byte $FE ; |XXXXXXX | $FF10
    .byte $C0 ; |XX      | $FF11
    .byte $E0 ; |XXX     | $FF12
    .byte $3C ; |  XXXX  | $FF13
    .byte $06 ; |     XX | $FF14
    .byte $C6 ; |XX   XX | $FF15
    .byte $7C ; | XXXXX  | $FF16
    .byte $00 ; |        | $FF17
    .byte $FC ; |XXXXXX  | $FF18
    .byte $06 ; |     XX | $FF19
    .byte $06 ; |     XX | $FF1A
    .byte $7C ; | XXXXX  | $FF1B
    .byte $06 ; |     XX | $FF1C
    .byte $06 ; |     XX | $FF1D
    .byte $FC ; |XXXXXX  | $FF1E
    .byte $00 ; |        | $FF1F
    .byte $0C ; |    XX  | $FF20
    .byte $0C ; |    XX  | $FF21
    .byte $0C ; |    XX  | $FF22
    .byte $FE ; |XXXXXXX | $FF23
    .byte $CC ; |XX  XX  | $FF24
    .byte $CC ; |XX  XX  | $FF25
    .byte $CC ; |XX  XX  | $FF26
    .byte $00 ; |        | $FF27
    .byte $FC ; |XXXXXX  | $FF28
    .byte $06 ; |     XX | $FF29
    .byte $06 ; |     XX | $FF2A
    .byte $FC ; |XXXXXX  | $FF2B
    .byte $C0 ; |XX      | $FF2C
    .byte $C0 ; |XX      | $FF2D
    .byte $FC ; |XXXXXX  | $FF2E
    .byte $00 ; |        | $FF2F
    .byte $7C ; | XXXXX  | $FF30
    .byte $C6 ; |XX   XX | $FF31
    .byte $C6 ; |XX   XX | $FF32
    .byte $FC ; |XXXXXX  | $FF33
    .byte $C0 ; |XX      | $FF34
    .byte $C0 ; |XX      | $FF35
    .byte $7C ; | XXXXX  | $FF36
    .byte $00 ; |        | $FF37
    .byte $30 ; |  XX    | $FF38
    .byte $30 ; |  XX    | $FF39
    .byte $18 ; |   XX   | $FF3A
    .byte $18 ; |   XX   | $FF3B
    .byte $0C ; |    XX  | $FF3C
    .byte $06 ; |     XX | $FF3D
    .byte $FE ; |XXXXXXX | $FF3E
    .byte $00 ; |        | $FF3F
    .byte $7C ; | XXXXX  | $FF40
    .byte $C6 ; |XX   XX | $FF41
    .byte $C6 ; |XX   XX | $FF42
    .byte $7C ; | XXXXX  | $FF43
    .byte $C6 ; |XX   XX | $FF44
    .byte $C6 ; |XX   XX | $FF45
    .byte $7C ; | XXXXX  | $FF46
    .byte $00 ; |        | $FF47
    .byte $7C ; | XXXXX  | $FF48
    .byte $06 ; |     XX | $FF49
    .byte $06 ; |     XX | $FF4A
    .byte $7E ; | XXXXXX | $FF4B
    .byte $C6 ; |XX   XX | $FF4C
    .byte $C6 ; |XX   XX | $FF4D
    .byte $7C ; | XXXXX  | $FF4E
    .byte $00 ; |        | $FF4F
    .byte $00 ; |        | $FF50
    .byte $00 ; |        | $FF51
    .byte $00 ; |        | $FF52
    .byte $00 ; |        | $FF53
    .byte $00 ; |        | $FF54
    .byte $00 ; |        | $FF55
    .byte $00 ; |        | $FF56
    .byte $00 ; |        | $FF57
    .byte $7C ; | XXXXX  | $FF58
    .byte $C6 ; |XX   XX | $FF59
    .byte $BA ; |X XXX X | $FF5A
    .byte $B2 ; |X XX  X | $FF5B
    .byte $BA ; |X XXX X | $FF5C
    .byte $C6 ; |XX   XX | $FF5D
    .byte $7C ; | XXXXX  | $FF5E
    .byte $00 ; |        | $FF5F
    .byte $1D ; |   XXX X| $FF60
    .byte $08 ; |    X   | $FF61
    .byte $08 ; |    X   | $FF62
    .byte $09 ; |    X  X| $FF63
    .byte $09 ; |    X  X| $FF64
    .byte $19 ; |   XX  X| $FF65
    .byte $09 ; |    X  X| $FF66
    .byte $00 ; |        | $FF67
    .byte $88 ; |X   X   | $FF68
    .byte $54 ; | X X X  | $FF69
    .byte $54 ; | X X X  | $FF6A
    .byte $C9 ; |XX  X  X| $FF6B
    .byte $55 ; | X X X X| $FF6C
    .byte $55 ; | X X X X| $FF6D
    .byte $89 ; |X   X  X| $FF6E
    .byte $00 ; |        | $FF6F
    .byte $42 ; | X    X | $FF70
    .byte $42 ; | X    X | $FF71
    .byte $42 ; | X    X | $FF72
    .byte $C3 ; |XX    XX| $FF73
    .byte $42 ; | X    X | $FF74
    .byte $42 ; | X    X | $FF75
    .byte $41 ; | X     X| $FF76
    .byte $00 ; |        | $FF77
    .byte $9B ; |X  XX XX| $FF78
    .byte $96 ; |X  X XX | $FF79
    .byte $93 ; |X  X  XX| $FF7A
    .byte $90 ; |X  X    | $FF7B
    .byte $BB ; |X XXX XX| $FF7C
    .byte $90 ; |X  X    | $FF7D
    .byte $10 ; |   X    | $FF7E
    .byte $00 ; |        | $FF7F
    .byte $E3 ; |XXX   XX| $FF80
    .byte $A2 ; |X X   X | $FF81
    .byte $A2 ; |X X   X | $FF82
    .byte $A2 ; |X X   X | $FF83
    .byte $3A ; |  XXX X | $FF84
    .byte $00 ; |        | $FF85
    .byte $02 ; |      X | $FF86
    .byte $00 ; |        | $FF87
    .byte $67 ; | XX  XXX| $FF88
    .byte $F7 ; |XXXX XXX| $FF89
    .byte $F7 ; |XXXX XXX| $FF8A
    .byte $B7 ; |X XX XXX| $FF8B
    .byte $37 ; |  XX XXX| $FF8C
    .byte $36 ; |  XX XX | $FF8D
    .byte $37 ; |  XX XXX| $FF8E
    .byte $37 ; |  XX XXX| $FF8F
    .byte $D6 ; |XX X XX | $FF90
    .byte $86 ; |X    XX | $FF91
    .byte $07 ; |     XXX| $FF92
    .byte $87 ; |X    XXX| $FF93
    .byte $C6 ; |XX   XX | $FF94
    .byte $C7 ; |XX   XXX| $FF95
    .byte $C7 ; |XX   XXX| $FF96
    .byte $80 ; |X       | $FF97
    .byte $3E ; |  XXXXX | $FF98
    .byte $3E ; |  XXXXX | $FF99
    .byte $94 ; |X  X X  | $FF9A
    .byte $DC ; |XX XXX  | $FF9B
    .byte $DC ; |XX XXX  | $FF9C
    .byte $C9 ; |XX  X  X| $FF9D
    .byte $88 ; |X   X   | $FF9E
    .byte $00 ; |        | $FF9F
    .byte $71 ; | XXX   X| $FFA0
    .byte $F9 ; |XXXXX  X| $FFA1
    .byte $F1 ; |XXXX   X| $FFA2
    .byte $E5 ; |XXX  X X| $FFA3
    .byte $D1 ; |XX X   X| $FFA4
    .byte $79 ; | XXXX  X| $FFA5
    .byte $B1 ; |X XX   X| $FFA6
    .byte $40 ; | X      | $FFA7
    .byte $F7 ; |XXXX XXX| $FFA8
    .byte $F7 ; |XXXX XXX| $FFA9
    .byte $F2 ; |XXXX  X | $FFAA
    .byte $F3 ; |XXXX  XX| $FFAB
    .byte $F3 ; |XXXX  XX| $FFAC
    .byte $B1 ; |X XX   X| $FFAD
    .byte $11 ; |   X   X| $FFAE
    .byte $00 ; |        | $FFAF
    .byte $DF ; |XX XXXXX| $FFB0
    .byte $DF ; |XX XXXXX| $FFB1
    .byte $9F ; |X  XXXXX| $FFB2
    .byte $9F ; |X  XXXXX| $FFB3
    .byte $1F ; |   XXXXX| $FFB4
    .byte $1B ; |   XX XX| $FFB5
    .byte $13 ; |   X  XX| $FFB6
    .byte $00 ; |        | $FFB7
LFFB8:
    .byte $13 ; |   X  XX| $FFB8
    .byte $13 ; |   X  XX| $FFB9
    .byte $14 ; |   X X  | $FFBA
    .byte $15 ; |   X X X| $FFBB
    .byte $16 ; |   X XX | $FFBC
    .byte $17 ; |   X XXX| $FFBD
    .byte $18 ; |   XX   | $FFBE
    .byte $19 ; |   XX  X| $FFBF
LFFC0:
    .byte $20 ; |  X     | $FFC0
    .byte $80 ; |X       | $FFC1
    .byte $40 ; | X      | $FFC2
    .byte $10 ; |   X    | $FFC3
    .byte $04 ; |     X  | $FFC4
    .byte $01 ; |       X| $FFC5
    .byte $02 ; |      X | $FFC6
    .byte $08 ; |    X   | $FFC7
    .byte $20 ; |  X     | $FFC8
    .byte $80 ; |X       | $FFC9
    .byte $20 ; |  X     | $FFCA
    .byte $08 ; |    X   | $FFCB
    .byte $02 ; |      X | $FFCC
    .byte $01 ; |       X| $FFCD
    .byte $04 ; |     X  | $FFCE
    .byte $10 ; |   X    | $FFCF
    .byte $40 ; | X      | $FFD0
    .byte $40 ; | X      | $FFD1
    .byte $10 ; |   X    | $FFD2
LFFD3:
    .byte $FD ; |XXXXXX X| $FFD3
    .byte $FD ; |XXXXXX X| $FFD4
    .byte $FD ; |XXXXXX X| $FFD5
    .byte $FE ; |XXXXXXX | $FFD6
    .byte $FE ; |XXXXXXX | $FFD7
    .byte $FE ; |XXXXXXX | $FFD8
    .byte $FE ; |XXXXXXX | $FFD9
    .byte $FF ; |XXXXXXXX| $FFDA
    .byte $FF ; |XXXXXXXX| $FFDB
    .byte $FF ; |XXXXXXXX| $FFDC

LFFDD:
    rts                          ; 6

LFFDE:
    sta    BANK_1                ; 4

LFFE1:
    jmp    LF100                 ; 3

LFFE4:
    jmp    LF5F7                 ; 3

LFFE7:
    sta    BANK_0                ; 4

LFFEA:
    jmp    LFCFA                 ; 3

LFFED:
    sta    BANK_0                ; 4

LFFF0:
    sta    BANK_2                ; 4

LFFF3:
    jmp    LF160                 ; 3

    .byte $FF ; |XXXXXXXX| $FFF6
    .byte $FF ; |XXXXXXXX| $FFF7
    .byte $FF ; |XXXXXXXX| $FFF8
    .byte $00 ; |        | $FFF9

    .byte $FF ; |XXXXXXXX| $FFFA
    .byte $FF ; |XXXXXXXX| $FFFB

       ORG $4FFC
      RORG $FFFC

    .word START_BANK_3
    .word START_BANK_3