; Rough disassembly of Shooting Arcade
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
;
; Shoot1.cfg contents:
;
;      ORG 9000
;      DATA 9000 90FF
;      CODE 9100 9622
;      GFX 9623 96FF
;      CODE 9700 997A
;      GFX 997B 9FD7
;      CODE 9FD8 9FF5
;      GFX 9FF6 9FFF
;
; Shoot2.cfg contents:
;
;      ORG B000
;      DATA B000 B0FF
;      CODE B100 BAA6
;      GFX BAA7 BFD7
;      CODE BFD8 BFF5
;      GFX BFF6 BFFF
;
; Shoot3.cfg contents:
;
;      ORG D000
;      DATA D000 D0FF
;      CODE D100 DA24
;      GFX DA25 DFD7
;      CODE DFD8 DFF5
;      GFX DFF6 DFFF
;
; Shoot4.cfg contents:
;
;      ORG F000
;      DATA F000 F0FF
;      CODE F100 F74C
;      GFX F74D F848
;      CODE F849 FB21
;      GFX FB22 FFD7
;      CODE FFD8 FFF5
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
REFP0   =  $0B
REFP1   =  $0C
PF0     =  $0D
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
RESP1   =  $11
AUDC0   =  $15
AUDF0   =  $17
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
INPT4   =  $3C
SWCHA   =  $0280
SWACNT  =  $0281
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

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

SC_00              ds 1  ; $F000 - $F005
SC_01              ds 1
SC_02              ds 1
SC_03              ds 1
SC_04              ds 1
SC_05              ds 1
SC_06              ds 1  ; $F006 - $F00B
SC_07              ds 1
SC_08              ds 1
SC_09              ds 1
SC_0A              ds 1
SC_0B              ds 1
SC_0C              ds 1  ; $F00C - $F011
SC_0D              ds 1
SC_0E              ds 1
SC_0F              ds 1
SC_10              ds 1
SC_11              ds 1
SC_12              ds 1  ; $F012 - $F017?
SC_13              ds 1
SC_14              ds 1
SC_15              ds 1
SC_16              ds 1
SC_17              ds 105


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

  MAC EMPTY_SPACE
    REPEAT {1}
      .byte 0
    REPEND
  ENDM

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 0
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


       SEG CODE

       ORG $2000
      RORG $9000

    FILLED_SPACE 256                ; $9000 - $90FF super chip ram

L9100:
    lda    #$FD                  ; 2
    sta    COLUPF                ; 3
    sei                          ; 2
    cld                          ; 2
    lda    #0                    ; 2
    tax                          ; 2
L9109:
    sta    0,X                   ; 4
    inx                          ; 2
    bne    L9109                 ; 2³
    dex                          ; 2
    txs                          ; 2
    stx    $98                   ; 3
    stx    $9A                   ; 3
    inx                          ; 2
    stx    SWACNT                ; 4
    inx                          ; 2
    stx    $97                   ; 3
    inx                          ; 2
    stx    $96                   ; 3
    lda    #$9F                  ; 2   high nibble, for bankswitching section
    sta    $83                   ; 3
L9122:
    jsr    L97F2                 ; 6
    lda    #<LF849               ; 2
    sta    $80                   ; 3
    lda    #>LF849               ; 2
    sta    $81                   ; 3
    jmp    L9FDE                 ; 3   bankswitch, goto LF849

L9130:
    lda    #0                    ; 2
    sta    $B5                   ; 3
    sta    $B6                   ; 3
    sta    $B7                   ; 3
L9138:
    sta    $C1                   ; 3
    sta    $C2                   ; 3
    sta    $C3                   ; 3
    ldy    $96                   ; 3
    cpy    #$29                  ; 2
    bcc    L9148                 ; 2³
    ldy    #$23                  ; 2
    sty    $96                   ; 3
L9148:
    lda    L998D,Y               ; 4
    tax                          ; 2
    and    #$0F                  ; 2
    tay                          ; 2
    txa                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $B3                   ; 3
    sty    $B4                   ; 3
    lda    #$49                  ; 2
    sta    $B8                   ; 3
    lda    L99BB,Y               ; 4
    sta    $B9                   ; 3
    ldy    $B3                   ; 3
    lda    L99C5,Y               ; 4
    sta    $C5                   ; 3
    ldx    #$FF                  ; 2
    txs                          ; 2
    jsr    L97F2                 ; 6
    lda    $C2                   ; 3
    bne    L9176                 ; 2³
    lda    #$0B                  ; 2
    sta    $9A                   ; 3
L9176:
    ldy    $B3                   ; 3
    lda    L997B,Y               ; 4   select bank
    sta    $82                   ; 3
    lda    L9987,Y               ; 4   low nibble
    sta    $80                   ; 3
    lda    L9981,Y               ; 4   high nibble
    sta    $81                   ; 3
    jmp.ind ($0082)              ; 5   bankswitch, goto bank 1,2, or 3

L918A:  ; indirect jump (also), coming from bank 1 or 2
    lda    #2                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    sta    VBLANK                ; 3
    jsr    L9615                 ; 6
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    VSYNC                 ; 3
    lda    #$2B                  ; 2
    sta    TIM64T                ; 4
    lda    $92                   ; 3
    beq    L91AB                 ; 2³
    jmp    L91D3                 ; 3

L91AB:
    jsr    L9803                 ; 6
    lda    #0                    ; 2
    sta    COLUBK                ; 3
    bit    $C1                   ; 3
    bmi    L91BB                 ; 2³
    bvs    L91BE                 ; 2³
    jmp    L91C9                 ; 3

L91BB:
    jmp    L972E                 ; 3

L91BE:
    dec    $C1                   ; 5
    lda    $C1                   ; 3
    and    #$01                  ; 2
    bne    L91C9                 ; 2³
    jmp    L9588                 ; 3

L91C9:
    bit    $C2                   ; 3
    bpl    L91D0                 ; 2³
    jmp    L92E3                 ; 3

L91D0:
    jmp    L9238                 ; 3

L91D3:
    cmp    #1                    ; 2
    bne    L91E1                 ; 2³
    sta    $93                   ; 3
    sta    $94                   ; 3
    ldx    #0                    ; 2
    stx    AUDV0                 ; 3
    stx    AUDV1                 ; 3
L91E1:
    cmp    #$11                  ; 2
    bcc    L91E8                 ; 2³
    jmp    L91F6                 ; 3

L91E8:
    jsr    L9608                 ; 6
    bne    L91F3                 ; 2³
    inc    $92                   ; 5
    lda    #$3B                  ; 2
    sta    $93                   ; 3
L91F3:
    jmp    L92AB                 ; 3

L91F6:
    jsr    L9491                 ; 6
    tya                          ; 2
    bne    L920E                 ; 2³+1
    lda    $92                   ; 3
    beq    L9212                 ; 2³
    lda    SWCHA                 ; 4
    and    #$10                  ; 2
    tax                          ; 2
    beq    L921A                 ; 2³
    eor    $90                   ; 3
    beq    L921A                 ; 2³
    stx    $90                   ; 3
L920E:
    lda    #1                    ; 2
    sta    $92                   ; 3
L9212:
    lda    INTIM                 ; 4
    bne    L9212                 ; 2³
    jmp    L918A                 ; 3

L921A:
    stx    $90                   ; 3
L921C:
    lda    INTIM                 ; 4
    bne    L921C                 ; 2³
    lda    #$E4                  ; 2
    sta    TIM64T                ; 4
L9226:
    lda    INTIM                 ; 4
    bne    L9226                 ; 2³
    lda    #$23                  ; 2
    sta    TIM64T                ; 4
L9230:
    lda    INTIM                 ; 4
    bne    L9230                 ; 2³
    jmp    L918A                 ; 3

L9238:
    bvc    L925C                 ; 2³
    lda    $93                   ; 3
    and    #$02                  ; 2
    bne    L924D                 ; 2³
    ldx    #$0B                  ; 2
L9242:
    lda    L9A08,X               ; 4
    sta    $84,X                 ; 4
    dex                          ; 2
    bpl    L9242                 ; 2³
    jmp    L92DB                 ; 3

L924D:
    lda    $93                   ; 3
    and    #$01                  ; 2
    bne    L92AB                 ; 2³
    lda    $C2                   ; 3
    and    #$20                  ; 2
    beq    L9260                 ; 2³
    jmp    L92AB                 ; 3

L925C:
    lda    $C2                   ; 3
    bne    L92AB                 ; 2³
L9260:
    lda    #$9B                  ; 2
    sta    $85                   ; 3
    sta    $87                   ; 3
    sta    $8D                   ; 3
    sta    $8F                   ; 3
    lda    #$9A                  ; 2
    sta    $89                   ; 3
    sta    $8B                   ; 3
    lda    $C4                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    NumberGfxLoPtrTab,X   ; 4
    sta    $84                   ; 3
    lda    $C4                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    NumberGfxLoPtrTab,X   ; 4
    sta    $86                   ; 3
    ldx    $B4                   ; 3
    lda    L99F4,X               ; 4
    sta    $88                   ; 3
    lda    L99FE,X               ; 4
    sta    $8A                   ; 3
    lda    $C5                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    NumberGfxLoPtrTab,X   ; 4
    sta    $8C                   ; 3
    lda    $C5                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    NumberGfxLoPtrTab,X   ; 4
    sta    $8E                   ; 3
    jmp    L92DB                 ; 3

L92AB:
    ldx    #0                    ; 2
    ldy    #2                    ; 2
L92AF:
    stx    $E3                   ; 3
    lda    #$9B                  ; 2   high nibble for number gfx, $9B page
    sta    $85,X                 ; 4
    sta    $87,X                 ; 4
    lda.wy $B5,Y                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    NumberGfxLoPtrTab,X   ; 4
    ldx    $E3                   ; 3
    sta    $84,X                 ; 4
    lda.wy $B5,Y                 ; 4
    and    #$0F                  ; 2
    tax                          ; 2
    lda    NumberGfxLoPtrTab,X   ; 4
    ldx    $E3                   ; 3
    sta    $86,X                 ; 4
    txa                          ; 2
    clc                          ; 2
    adc    #4                    ; 2
    tax                          ; 2
    dey                          ; 2
    bpl    L92AF                 ; 2³
L92DB:
    jsr    L95DD                 ; 6
    ldy    #0                    ; 2
    jmp    L97E6                 ; 3

L92E3:
    ldx    #0                    ; 2
    ldy    #$2C                  ; 2
L92E7:
    lda    #8                    ; 2
    sta    $E3                   ; 3
L92EB:
    lda    L9B00,Y               ; 4
    cpx    $97                   ; 3
    bne    L92F4                 ; 2³
    eor    #$FF                  ; 2
L92F4:
    sta    SC_00,Y               ; 5
    dey                          ; 2
    bmi    L9302                 ; 2³+1
    dec    $E3                   ; 5
    bpl    L92EB                 ; 2³
    inx                          ; 2
    jmp    L92E7                 ; 3

L9302:
    jsr    L9608                 ; 6
    lda    $DF                   ; 3
    beq    L9316                 ; 2³
    ldx    #$0B                  ; 2
L930B:
    lda    L9A39,X               ; 4   load pointers for "High Score"
    sta    $84,X                 ; 4
    dex                          ; 2
    bpl    L930B                 ; 2³
    jmp    L9346                 ; 3

L9316:
    ldx    #0                    ; 2
    ldy    #2                    ; 2
L931A:
    stx    $E3                   ; 3
    lda    #$9B                  ; 2   high nibble for number gfx, $9B page
    sta    $85,X                 ; 4
    sta    $87,X                 ; 4
    lda.wy $E6,Y                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    NumberGfxLoPtrTab,X   ; 4
    ldx    $E3                   ; 3
    sta    $84,X                 ; 4
    lda.wy $E6,Y                 ; 4
    and    #$0F                  ; 2
    tax                          ; 2
    lda    NumberGfxLoPtrTab,X   ; 4
    ldx    $E3                   ; 3
    sta    $86,X                 ; 4
    txa                          ; 2
    clc                          ; 2
    adc    #4                    ; 2
    tax                          ; 2
    dey                          ; 2
    bpl    L931A                 ; 2³
L9346:
    jsr    L95DD                 ; 6
    ldy    #0                    ; 2
    jmp    L97E6                 ; 3

L934E:  ; indirect jump, coming from bank 1 or 2
    ldx    #4                    ; 2
L9350:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    L9350                 ; 2³
    lda    #6                    ; 2
L9357:
    sta    $E3                   ; 3
L9359:
    ldy    $E3                   ; 3
    lda    ($84),Y               ; 5
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($86),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($88),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($8A),Y               ; 5
    sta    $E4                   ; 3
    lda    ($8C),Y               ; 5
    tax                          ; 2
    lda    ($8E),Y               ; 5
    tay                          ; 2
    lda    $E4                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    dec    $E3                   ; 5
    bpl    L9359                 ; 2³
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    jmp    L97E6                 ; 3

L9398:  ; indirect jump, coming from bank 1 or 2
    lda    $C2                   ; 3
    bne    L93B2                 ; 2³
    lda    $C5                   ; 3
    bne    L93B2                 ; 2³
    lda    #$10                  ; 2
    sta    $C2                   ; 3
    jsr    L97F2                 ; 6
    lda    #$21                  ; 2
    sta    $9A                   ; 3
    lda    #$80                  ; 2
    sta    $B9                   ; 3
    jmp    L97E6                 ; 3

L93B2:
    lda    $92                   ; 3
    bne    L93B9                 ; 2³
    jsr    L9872                 ; 6
L93B9:
    jsr    L9491                 ; 6
    lda    $92                   ; 3
    beq    L93C3                 ; 2³
    jmp    L97E6                 ; 3

L93C3:
    tya                          ; 2
    beq    L93F1                 ; 2³
    dey                          ; 2
    beq    L93E9                 ; 2³
    lda    $C2                   ; 3
    and    #$20                  ; 2
    beq    L93D9                 ; 2³
    ldy    $97                   ; 3
    lda    L99B6,Y               ; 4
    sta    $96                   ; 3
    jmp    L93E1                 ; 3

L93D9:
    lda    $B3                   ; 3
    beq    L93DF                 ; 2³
    lda    #$10                  ; 2
L93DF:
    sta    $C4                   ; 3
L93E1:
    lda    INTIM                 ; 4
    bne    L93E1                 ; 2³
    jmp    L9130                 ; 3

L93E9:
    lda    INTIM                 ; 4
    bne    L93E9                 ; 2³
    jmp    L9122                 ; 3

L93F1:
    lda    $C2                   ; 3
    beq    L9456                 ; 2³+1
    lda    #$20                  ; 2
    bit    $C2                   ; 3
    bne    L942A                 ; 2³+1
    bvs    L9465                 ; 2³+1
    ldy    $B8                   ; 3
    cpy    #3                    ; 2
    beq    L9406                 ; 2³
    jmp    L9521                 ; 3

L9406:
    lda    $9B                   ; 3
    eor    $9C                   ; 3
    beq    L940F                 ; 2³
    jmp    L97E6                 ; 3

L940F:
    dec    $B9                   ; 5
    beq    L9416                 ; 2³
    jmp    L97E6                 ; 3

L9416:
    inc    $96                   ; 5
    lda    $96                   ; 3
    cmp    #2                    ; 2
    bne    L9422                 ; 2³
    lda    #0                    ; 2
    sta    $96                   ; 3
L9422:
    lda    INTIM                 ; 4
    bne    L9422                 ; 2³
    jmp    L9138                 ; 3

L942A:
    jsr    L9608                 ; 6
    beq    L93E9                 ; 2³+1
    jsr    L94FF                 ; 6
    cmp    #$80                  ; 2
    beq    L93E9                 ; 2³+1
    lda    $94                   ; 3
    cmp    #$0F                  ; 2
    bne    L9462                 ; 2³
    lda    $98                   ; 3
    and    #$7F                  ; 2
    adc    #$0E                  ; 2
    sta    $D3                   ; 3
    lda    $98                   ; 3
    lsr                          ; 2
    adc    #$1E                  ; 2
    sta    $D6                   ; 3
    lda    #$62                  ; 2
    sta    $C1                   ; 3
    lda    #$0C                  ; 2
    sta    $9A                   ; 3
    jmp    L97E6                 ; 3

L9456:
    jsr    L94CF                 ; 6
    lda    $C1                   ; 3
    ora    $C2                   ; 3
    bne    L9462                 ; 2³
    jsr    L94FF                 ; 6
L9462:
    jmp    L97E6                 ; 3

L9465:
    lda    $93                   ; 3
    bne    L9474                 ; 2³
    lda    #$1D                  ; 2
    sta    $93                   ; 3
    lda    #$B4                  ; 2
    sta    $94                   ; 3
    jmp    L97E6                 ; 3

L9474:
    jsr    L9608                 ; 6
    bne    L9483                 ; 2³
    ldy    $97                   ; 3
    lda    L99B6,Y               ; 4
    sta    $96                   ; 3
    jmp    L93E9                 ; 3

L9483:
    cmp    #$1C                  ; 2
    bcs    L9462                 ; 2³
    jsr    L94FF                 ; 6
    cmp    #$80                  ; 2
    bne    L9462                 ; 2³
    jmp    L93D9                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L9491 SUBROUTINE
    ldy    #0                    ; 2
    lda    SWCHB                 ; 4
    eor    #$FF                  ; 2
    and    #$0B                  ; 2
    tax                          ; 2
    and    #$08                  ; 2
    beq    L94B8                 ; 2³
    and    $91                   ; 3
    bne    L94B8                 ; 2³
    lda    $C2                   ; 3
    bne    L94CC                 ; 2³
    lda    $92                   ; 3
    beq    L94AD                 ; 2³
    lda    #1                    ; 2
L94AD:
    eor    #$01                  ; 2
    sta    $92                   ; 3
    lda    #$B4                  ; 2
    sta    $94                   ; 3
    jmp    L94CC                 ; 3

L94B8:
    txa                          ; 2
    and    #$03                  ; 2
    beq    L94CC                 ; 2³
    and    #$02                  ; 2
    bne    L94C5                 ; 2³
    dey                          ; 2
    jmp    L94CC                 ; 3

L94C5:
    iny                          ; 2
    sty    $97                   ; 3
    lda    #$1E                  ; 2
    sta    $95                   ; 3
L94CC:
    stx    $91                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L94CF SUBROUTINE
    dec    $B9                   ; 5
    bne    L94EC                 ; 2³
    ldy    $B4                   ; 3
    lda    L99BB,Y               ; 4
    sta    $B9                   ; 3
    dec    $B8                   ; 5
    lda    $B8                   ; 3
    cmp    #3                    ; 2
    beq    L94ED                 ; 2³
    and    #$04                  ; 2
    beq    L94EC                 ; 2³
    lda    $B8                   ; 3
    and    #$7C                  ; 2
    sta    $B8                   ; 3
L94EC:
    rts                          ; 6

L94ED:
    lda    #$40                  ; 2
    sta    $C2                   ; 3
    jsr    L97F2                 ; 6
    lda    #$22                  ; 2
    sta    $9A                   ; 3
    lda    #0                    ; 2
    sta    $93                   ; 3
    sta    $C1                   ; 3
    rts                          ; 6

L94FF SUBROUTINE
    lda    $C2                   ; 3
    bne    L950A                 ; 2³
    lda    $C4                   ; 3
    bne    L950A                 ; 2³
    jmp    L94ED                 ; 3

L950A:
    lda    SWCHA                 ; 4
    and    #$10                  ; 2
    tax                          ; 2
    beq    L951E                 ; 2³
    eor    $90                   ; 3
    beq    L951E                 ; 2³
    lda    #$0C                  ; 2
    sta    $9A                   ; 3
    lda    #$80                  ; 2
    sta    $C1                   ; 3
L951E:
    stx    $90                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L9521:
    dec    $B9                   ; 5
    bne    L9585                 ; 2³
    lda    #3                    ; 2
    cpy    #4                    ; 2
    bne    L952D                 ; 2³
    lda    #$3C                  ; 2
L952D:
    sta    $B9                   ; 3
    dey                          ; 2
    tya                          ; 2
    and    #$04                  ; 2
    beq    L9539                 ; 2³
    tya                          ; 2
    and    #$7C                  ; 2
    tay                          ; 2
L9539:
    sty    $B8                   ; 3
    ldy    $B4                   ; 3
    lda    L99D5,Y               ; 4
    sta    $E3                   ; 3
    lda    L99CB,Y               ; 4
    sta    $E4                   ; 3
    lda    #0                    ; 2
    sta    $E5                   ; 3
    sed                          ; 2
    clc                          ; 2
    ldx    #0                    ; 2
    bcc    L9555                 ; 3   always branch

L9551:
    adc    $B4,X                 ; 4
    sta    $B4,X                 ; 4
L9555:
    lda    #0                    ; 2
    adc    $E3,X                 ; 4
    inx                          ; 2
    cpx    #3                    ; 2
    bcc    L9551                 ; 2³
    clc                          ; 2
    adc    $B7                   ; 3
    bcc    L9569                 ; 2³
    lda    #$99                  ; 2
    sta    $B5                   ; 3
    sta    $B6                   ; 3
L9569:
    sta    $B7                   ; 3
    ldx    #2                    ; 2
L956D:
    lda    $E6,X                 ; 4
    cmp    $B5,X                 ; 4
    bcc    L957B                 ; 2³
    bne    L9584                 ; 2³
    dex                          ; 2
    bpl    L956D                 ; 2³
    jmp    L9584                 ; 3

L957B:
    ldx    #2                    ; 2
L957D:
    lda    $B5,X                 ; 4
    sta    $E6,X                 ; 4
    dex                          ; 2
    bpl    L957D                 ; 2³
L9584:
    cld                          ; 2
L9585:
    jmp    L97E6                 ; 3

L9588:
    lda    #0                    ; 2
    sta    $C1                   ; 3
    sta    NUSIZ0                ; 3
    sta    REFP0                 ; 3
    lda    #$0E                  ; 2
    sta    COLUP0                ; 3
    lda    $D3                   ; 3
    clc                          ; 2
    adc    #$30                  ; 2
    ldx    #0                    ; 2
    jsr    L9700                 ; 6
L959E:
    lda    INTIM                 ; 4
    bne    L959E                 ; 2³
    lda    #$E4                  ; 2
    sta    TIM64T                ; 4
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    #0                    ; 2
    ldx    #0                    ; 2
L95B6:
    inx                          ; 2
    cpx    $D6                   ; 3
    beq    L95C0                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    jmp    L95B6                 ; 3

L95C0:
    lda    L99DF,Y               ; 4
    sta    GRP0                  ; 3
    iny                          ; 2
    cpy    #$0B                  ; 2
    beq    L95D4                 ; 2³
    inx                          ; 2
    cpx    #$BE                  ; 2
    beq    L95D4                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    jmp    L95C0                 ; 3

L95D4:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    jmp    L97E4                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L95DD SUBROUTINE
    ldx    #0                    ; 2
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    stx    REFP0                 ; 3
    stx    REFP1                 ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    stx    HMP1                  ; 3
    lda    #$F0                  ; 2
    sta    HMP0                  ; 3
    lda    #$1A                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L9608 SUBROUTINE
    dec    $94                   ; 5
    bne    L9612                 ; 2³
    lda    #$3C                  ; 2
    sta    $94                   ; 3
    dec    $93                   ; 5
L9612:
    lda    $93                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L9615 SUBROUTINE
    lda    $99                   ; 3
    asl                          ; 2
    eor    $99                   ; 3
    asl                          ; 2
    asl                          ; 2
    rol    $98                   ; 5
    rol    $99                   ; 5
    rol    $98                   ; 5
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


  EMPTY_SPACE 221        ; $9623 - $96FF free bytes


       ORG $2700
      RORG $9700

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L9700 SUBROUTINE
    jmp    L9705                 ; 3

    lda    $B1,X                 ; 4
L9705:
    tay                          ; 2
    and    #$0F                  ; 2
    sta    $E3                   ; 3
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    clc                          ; 2
    adc    $E3                   ; 3
    cmp    #$0F                  ; 2
    bcs    L971B                 ; 2³
    nop                          ; 2
    jmp    L971E                 ; 3

L971B:
    sbc    #$0F                  ; 2
    iny                          ; 2
L971E:
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0,X                ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
L9728:
    dey                          ; 2
    bpl    L9728                 ; 2³
    sta    RESP0,X               ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L972E:
    lda    #$62                  ; 2
    sta    $C1                   ; 3
    lda    #$0E                  ; 2
    sta    COLUBK                ; 3
    sed                          ; 2
    sec                          ; 2
    lda    $C4                   ; 3
    sbc    #1                    ; 2
    sta    $C4                   ; 3
    cld                          ; 2
L973F:
    lda    INTIM                 ; 4
    bne    L973F                 ; 2³
    lda    #$E4                  ; 2
    sta    TIM64T                ; 4
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    sta    $D3                   ; 3
    sta    $D6                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #0                    ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
L975C:
    inx                          ; 2
    cpx    #$B9                  ; 2
    beq    L9796                 ; 2³
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    bit    INPT4                 ; 3
    bpl    L97C5                 ; 2³
    bit    INPT4                 ; 3
    bpl    L97C1                 ; 2³
    bit    INPT4                 ; 3
    bpl    L97BD                 ; 2³
    bit    INPT4                 ; 3
    bpl    L97B9                 ; 2³
    bit    INPT4                 ; 3
    bpl    L97B5                 ; 2³
    bit    INPT4                 ; 3
    bpl    L97B1                 ; 2³
    bit    INPT4                 ; 3
    bpl    L97AD                 ; 2³
    bit    INPT4                 ; 3
    bpl    L97A9                 ; 2³
    bit    INPT4                 ; 3
    bpl    L97A5                 ; 2³
    bit    INPT4                 ; 3
    bpl    L97A1                 ; 2³
    bit    INPT4                 ; 3
    bpl    L979D                 ; 2³
    jmp    L975C                 ; 3

L9796:
    lda    #0                    ; 2
    sta    $C1                   ; 3
    jmp    L97E4                 ; 3

L979D:
    lda    #$9B                  ; 2
    bne    L97C9                 ; 3   always branch

L97A1:
    lda    #$8C                  ; 2
    bne    L97C9                 ; 3   always branch

L97A5:
    lda    #$7D                  ; 2
    bne    L97C9                 ; 3   always branch

L97A9:
    lda    #$6E                  ; 2
    bne    L97C9                 ; 3   always branch

L97AD:
    lda    #$5F                  ; 2
    bne    L97C9                 ; 3   always branch

L97B1:
    lda    #$50                  ; 2
    bne    L97C9                 ; 3   always branch

L97B5:
    lda    #$41                  ; 2
    bne    L97C9                 ; 3   always branch

L97B9:
    lda    #$32                  ; 2
    bne    L97C9                 ; 3   always branch

L97BD:
    lda    #$23                  ; 2
    bne    L97C9                 ; 3   always branch

L97C1:
    lda    #$14                  ; 2
    bne    L97C9                 ; 3   always branch

L97C5:
    lda    #5                    ; 2
    bit    INPT4                 ; 3
L97C9:
    sta    $D3                   ; 3
    stx    $D6                   ; 3
    ldy    #4                    ; 2
L97CF:
    ldx    #9                    ; 2
L97D1:
    dex                          ; 2
    bpl    L97D1                 ; 2³
    nop                          ; 2
    bit    INPT4                 ; 3
    bit    INPT4                 ; 3
    bmi    L97E4                 ; 2³
    sec                          ; 2
    sbc    #3                    ; 2
    sta    $D3                   ; 3
    nop                          ; 2
    dey                          ; 2
    bpl    L97CF                 ; 2³
L97E4:
    ldy    #1                    ; 2
L97E6:
    pla                          ; 4   get low nibble
    clc                          ; 2
    adc    #1                    ; 2   adjust PC address from RTS to JMP
    sta    $80                   ; 3
    pla                          ; 4   get high nibble
    sta    $81                   ; 3
    jmp.ind ($0082)              ; 5   goto bankswitching section at $9Fxx, then jump indirectly

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L97F2 SUBROUTINE
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    lda    #$FF                  ; 2
    sta    $9B                   ; 3
    sta    $9C                   ; 3
    sta    $AD                   ; 3
    sta    $AE                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L9803 SUBROUTINE
    ldy    $9A                   ; 3
    bmi    L9840                 ; 2³
    ldx    #0                    ; 2
    cpy    $9B                   ; 3
    beq    L9841                 ; 2³
    inx                          ; 2
    lda    $9C                   ; 3
    bmi    L9841                 ; 2³
    cpy    $9C                   ; 3
    beq    L9841                 ; 2³
    dex                          ; 2
    lda    $9B                   ; 3
    bmi    L9841                 ; 2³
    tay                          ; 2
    lda    L9BE8,Y               ; 4
    and    #$F0                  ; 2
    sta    $E3                   ; 3
    ldy    $9C                   ; 3
    lda    L9BE8,Y               ; 4
    and    #$F0                  ; 2
    cmp    $E3                   ; 3
    bcs    L9831                 ; 2³
    inx                          ; 2
    sta    $E3                   ; 3
L9831:
    ldy    $9A                   ; 3
    lda    L9BE8,Y               ; 4
    and    #$F0                  ; 2
    cmp    $E3                   ; 3
    bcs    L9841                 ; 2³
    lda    #$FF                  ; 2
    sta    $9A                   ; 3
L9840:
    rts                          ; 6

L9841:
    sty    $9B,X                 ; 4
    lda    #$FF                  ; 2
    sta    $9A                   ; 3
    sta    $AD,X                 ; 4
L9849 SUBROUTINE
    txa                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda    L9B76,Y               ; 4   high nibble
    sta    $9E,X                 ; 4
    lda    L9B50,Y               ; 4   low nibble
    sta    $9D,X                 ; 4
    lda    L9BC2,Y               ; 4   high nibble
    sta    $A4,X                 ; 4
    lda    L9B9C,Y               ; 4   low nibble
    sta    $A3,X                 ; 4
    txa                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    #0                    ; 2
    sta    $A1,X                 ; 4
    sta    $A9,X                 ; 4
    lda    #1                    ; 2
    sta    $AB,X                 ; 4
    lda    #$80                  ; 2
    sta    $A7,X                 ; 4
    rts                          ; 6

L9872 SUBROUTINE
    ldx    #0                    ; 2
    ldy    $9B                   ; 3
    bmi    L9886                 ; 2³
    dec    $A9                   ; 5
    bpl    L9886                 ; 2³
    lda    L9BE8,Y               ; 4
    and    #$0F                  ; 2
    sta    $A9                   ; 3
    jsr    L9898                 ; 6
L9886:
    ldy    $9C                   ; 3
    bmi    L988E                 ; 2³
    dec    $AA                   ; 5
    bmi    L988F                 ; 2³
L988E:
    rts                          ; 6

L988F:
    lda    L9BE8,Y               ; 4
    and    #$0F                  ; 2
    sta    $AA                   ; 3
    ldx    #1                    ; 2
L9898 SUBROUTINE
    lda    $A7,X                 ; 4
    bmi    L98A1                 ; 2³
    dec    $AB,X                 ; 6
    beq    L9908                 ; 2³+1
    rts                          ; 6

L98A1:
    jsr    L9934                 ; 6
    cmp    #$FF                  ; 2
    bne    L98BF                 ; 2³
    ldy    $AD,X                 ; 4
    bpl    L98B3                 ; 2³
    sty    $9B,X                 ; 4
    lda    #0                    ; 2
    sta    AUDV0,X               ; 4
    rts                          ; 6

L98B3:
    jsr    L9849                 ; 6
    lda    $AF,X                 ; 4
    sta    $A1,X                 ; 4
    lda    #$FF                  ; 2
    sta    $AD,X                 ; 4
    rts                          ; 6

L98BF:
    tay                          ; 2
    and    #$E0                  ; 2
    cmp    #$E0                  ; 2
    bne    L98F7                 ; 2³
    tya                          ; 2
    and    #$1F                  ; 2
    cmp    #$10                  ; 2
    bcs    L98D2                 ; 2³
    sta    AUDC0,X               ; 4
    jmp    L98A1                 ; 3

L98D2:
    and    #$0F                  ; 2
    beq    L98DF                 ; 2³
    sta    $AB,X                 ; 4
    lda    #0                    ; 2
    sta    AUDV0,X               ; 4
    sta    $A7,X                 ; 4
    rts                          ; 6

L98DF:
    jsr    L9934                 ; 6
    bmi    L98F0                 ; 2³
    tay                          ; 2
    lda    $A1,X                 ; 4
    sta    $AF,X                 ; 4
    lda    $9B,X                 ; 4
    sta    $AD,X                 ; 4
    jmp    L9849                 ; 3

L98F0:
    and    #$7F                  ; 2
    sta    $9A                   ; 3
    jmp    L98A1                 ; 3

L98F7:
    sty    AUDF0,X               ; 4
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    beq    L9919                 ; 2³
    tay                          ; 2
    dey                          ; 2
    jsr    L9941                 ; 6
    sta    $A7,X                 ; 4
L9908:
    tay                          ; 2
    inc    $A7,X                 ; 6
    lda    L9E00,Y               ; 4
    beq    L98A1                 ; 2³+1
    sta    AUDV0,X               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $AB,X                 ; 4
    rts                          ; 6

L9919:
    lda    $AB,X                 ; 4
    beq    L9933                 ; 2³
    dec    $AB,X                 ; 6
    bne    L9933                 ; 2³
    lda    $A7,X                 ; 4
    inc    $A7,X                 ; 6
    and    #$7F                  ; 2
    tay                          ; 2
    jsr    L9941                 ; 6
    sta    AUDV0,X               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $AB,X                 ; 4
L9933:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L9934 SUBROUTINE
    ldy    $A1,X                 ; 4
    inc    $A1,X                 ; 6
    txa                          ; 2
    beq    L993E                 ; 2³
    lda    ($9F),Y               ; 5
    rts                          ; 6

L993E:
    lda    ($9D),Y               ; 5
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L9941 SUBROUTINE
    txa                          ; 2
    beq    L9947                 ; 2³
    lda    ($A5),Y               ; 5
    rts                          ; 6

L9947:
    lda    ($A3),Y               ; 5
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    lda    $9A                   ; 3
    bmi    L9954                 ; 2³
    jsr    L9803                 ; 6
    jmp    L97E6                 ; 3

L9954:
    jsr    L97F2                 ; 6
    jmp    L97E6                 ; 3

    jsr    L9872                 ; 6
    jmp    L97E6                 ; 3

    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    $DF                   ; 3
    lda    L9E51,Y               ; 4
    tay                          ; 2
    ldx    #$0B                  ; 2
L996A:
    lda    L9E53,Y               ; 4
    sta    $84,X                 ; 4
    dey                          ; 2
    dex                          ; 2
    bpl    L996A                 ; 2³
    jsr    L95DD                 ; 6
    lda    #$0A                  ; 2
    jmp    L9357                 ; 3

L997B:  ; indirect jump table
    .byte <L9FEA         ; $997B   goto bank 1, LBxxx
    .byte <L9FEA         ; $997C
    .byte <L9FE4         ; $997D   goto bank 2, LDxxx
    .byte <L9FE4         ; $997E
    .byte <L9FDE         ; $997F   goto bank 3, LFxxx
    .byte <L9FDE         ; $9980
L9981:  ; indirect jump table
    .byte >LB100         ; $9981   high nibbles (other banks)
    .byte >LB3C4         ; $9982
    .byte >LD100         ; $9983
    .byte >LD58F         ; $9984
    .byte >LF100         ; $9985
    .byte >LF3C9         ; $9986
L9987:  ; indirect jump table
    .byte <LB100         ; $9987   low nibbles (other banks)
    .byte <LB3C4         ; $9988
    .byte <LD100         ; $9989
    .byte <LD58F         ; $998A
    .byte <LF100         ; $998B
    .byte <LF3C9         ; $998C
L998D:
    .byte $00 ; |        | $998D
    .byte $10 ; |   X    | $998E
    .byte $01 ; |       X| $998F
    .byte $11 ; |   X   X| $9990
    .byte $02 ; |      X | $9991
    .byte $12 ; |   X  X | $9992
    .byte $22 ; |  X   X | $9993
    .byte $03 ; |      XX| $9994
    .byte $13 ; |   X  XX| $9995
    .byte $23 ; |  X   XX| $9996
    .byte $33 ; |  XX  XX| $9997
    .byte $04 ; |     X  | $9998
    .byte $14 ; |   X X  | $9999
    .byte $24 ; |  X  X  | $999A
    .byte $34 ; |  XX X  | $999B
    .byte $44 ; | X   X  | $999C
    .byte $05 ; |     X X| $999D
    .byte $15 ; |   X X X| $999E
    .byte $25 ; |  X  X X| $999F
    .byte $35 ; |  XX X X| $99A0
    .byte $45 ; | X   X X| $99A1
    .byte $55 ; | X X X X| $99A2
    .byte $16 ; |   X XX | $99A3
    .byte $26 ; |  X  XX | $99A4
    .byte $36 ; |  XX XX | $99A5
    .byte $46 ; | X   XX | $99A6
    .byte $56 ; | X X XX | $99A7
    .byte $17 ; |   X XXX| $99A8
    .byte $27 ; |  X  XXX| $99A9
    .byte $47 ; | X   XXX| $99AA
    .byte $57 ; | X X XXX| $99AB
    .byte $18 ; |   XX   | $99AC
    .byte $38 ; |  XXX   | $99AD
    .byte $48 ; | X  X   | $99AE
    .byte $58 ; | X XX   | $99AF
    .byte $09 ; |    X  X| $99B0
    .byte $29 ; |  X X  X| $99B1
    .byte $19 ; |   XX  X| $99B2
    .byte $39 ; |  XXX  X| $99B3
    .byte $49 ; | X  X  X| $99B4
    .byte $59 ; | X XX  X| $99B5
L99B6:
    .byte $00 ; |        | $99B6
    .byte $02 ; |      X | $99B7
    .byte $04 ; |     X  | $99B8
    .byte $07 ; |     XXX| $99B9
    .byte $0B ; |    X XX| $99BA
L99BB:
    .byte $5A ; | X XX X | $99BB
    .byte $36 ; |  XX XX | $99BC
    .byte $36 ; |  XX XX | $99BD
    .byte $2D ; |  X XX X| $99BE
    .byte $2D ; |  X XX X| $99BF
    .byte $27 ; |  X  XXX| $99C0
    .byte $27 ; |  X  XXX| $99C1
    .byte $21 ; |  X    X| $99C2
    .byte $21 ; |  X    X| $99C3
    .byte $1E ; |   XXXX | $99C4
L99C5:
    .byte $25 ; |  X  X X| $99C5
    .byte $36 ; |  XX XX | $99C6
    .byte $25 ; |  X  X X| $99C7
    .byte $15 ; |   X X X| $99C8
    .byte $10 ; |   X    | $99C9
    .byte $20 ; |  X     | $99CA
L99CB:
    .byte $00 ; |        | $99CB
    .byte $00 ; |        | $99CC
    .byte $00 ; |        | $99CD
    .byte $00 ; |        | $99CE
    .byte $00 ; |        | $99CF
    .byte $01 ; |       X| $99D0
    .byte $01 ; |       X| $99D1
    .byte $02 ; |      X | $99D2
    .byte $05 ; |     X X| $99D3
    .byte $07 ; |     XXX| $99D4
L99D5:
    .byte $10 ; |   X    | $99D5
    .byte $10 ; |   X    | $99D6
    .byte $25 ; |  X  X X| $99D7
    .byte $50 ; | X X    | $99D8
    .byte $75 ; | XXX X X| $99D9
    .byte $00 ; |        | $99DA
    .byte $50 ; | X X    | $99DB
    .byte $50 ; | X X    | $99DC
    .byte $00 ; |        | $99DD
    .byte $50 ; | X X    | $99DE
L99DF:
    .byte $00 ; |        | $99DF
    .byte $10 ; |   X    | $99E0
    .byte $10 ; |   X    | $99E1
    .byte $10 ; |   X    | $99E2
    .byte $38 ; |  XXX   | $99E3
    .byte $FE ; |XXXXXXX | $99E4
    .byte $38 ; |  XXX   | $99E5
    .byte $10 ; |   X    | $99E6
    .byte $10 ; |   X    | $99E7
    .byte $10 ; |   X    | $99E8
    .byte $00 ; |        | $99E9

NumberGfxLoPtrTab:
    .byte <Zero          ; $99EA
    .byte <One           ; $99EB
    .byte <Two           ; $99EC
    .byte <Three         ; $99ED
    .byte <Four          ; $99EE
    .byte <Five          ; $99EF
    .byte <Six           ; $99F0
    .byte <Seven         ; $99F1
    .byte <Eight         ; $99F2
    .byte <Nine          ; $99F3
L99F4:
    .byte <ZeroLeft      ; $99F4
    .byte <OneLeft       ; $99F5
    .byte <TwoLeft       ; $99F6
    .byte <ThreeLeft     ; $99F7
    .byte <FourLeft      ; $99F8
    .byte <FiveLeft      ; $99F9
    .byte <SixLeft       ; $99FA
    .byte <SevenLeft     ; $99FB
    .byte <EightLeft     ; $99FC
    .byte <NineLeft      ; $99FD
L99FE:
    .byte <ZeroRight     ; $99FE
    .byte <OneRight      ; $99FF
    .byte <TwoRight      ; $9A00
    .byte <ThreeRight    ; $9A01
    .byte <FourRight     ; $9A02
    .byte <FiveRight     ; $9A03
    .byte <SixRight      ; $9A04
    .byte <SevenRight    ; $9A05
    .byte <EightRight    ; $9A06
    .byte <NineRight     ; $9A07

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;        XXX  XX  X   X XXXX     XX  X   X XXXX XXX
;       X    X  X XX XX X       X  X X   X X    X  X
;       X XX XXXX X X X XXX     X  X X   X XXX  XXX
;       X  X X  X X   X X       X  X  X X  X    X X
;        XX  X  X X   X XXXX     XX    X   XXXX X  X
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L9A08:
    .byte <GameOverOne   ; $9A08
    .byte >GameOverOne   ; $9A09
    .byte <GameOverTwo   ; $9A0A
    .byte >GameOverTwo   ; $9A0B
    .byte <GameOverThree ; $9A0C
    .byte >GameOverThree ; $9A0D
    .byte <GameOverFour  ; $9A0E
    .byte >GameOverFour  ; $9A0F
    .byte <GameOverFive  ; $9A10
    .byte >GameOverFive  ; $9A11
    .byte <GameOverSix   ; $9A12
    .byte >GameOverSix   ; $9A13
GameOverOne:
    .byte $00 ; |        | $9A14
    .byte $19 ; |   XX  X| $9A15
    .byte $25 ; |  X  X X| $9A16
    .byte $2D ; |  X XX X| $9A17
    .byte $21 ; |  X    X| $9A18
    .byte $1C ; |   XXX  | $9A19
GameOverTwo:
    .byte $00 ; |        | $9A1A   shared
    .byte $28 ; |  X X   | $9A1B
    .byte $28 ; |  X X   | $9A1C
    .byte $EA ; |XXX X X | $9A1D
    .byte $2D ; |  X XX X| $9A1E
    .byte $C8 ; |XX  X   | $9A1F
GameOverThree:
    .byte $00 ; |        | $9A20   shared
    .byte $BC ; |X XXXX  | $9A21
    .byte $A0 ; |X X     | $9A22
    .byte $B8 ; |X XXX   | $9A23
    .byte $A0 ; |X X     | $9A24
    .byte $BC ; |X XXXX  | $9A25
GameOverFour:
    .byte $00 ; |        | $9A26   shared
    .byte $18 ; |   XX   | $9A27
    .byte $24 ; |  X  X  | $9A28
    .byte $25 ; |  X  X X| $9A29
    .byte $25 ; |  X  X X| $9A2A
    .byte $19 ; |   XX  X| $9A2B
GameOverFive:
    .byte $00 ; |        | $9A2C   shared
    .byte $47 ; | X   XXX| $9A2D
    .byte $A4 ; |X X  X  | $9A2E
    .byte $17 ; |   X XXX| $9A2F
    .byte $14 ; |   X X  | $9A30
    .byte $17 ; |   X XXX| $9A31
GameOverSix:
    .byte $00 ; |        | $9A32   shared
    .byte $A4 ; |X X  X  | $9A33
    .byte $28 ; |  X X   | $9A34
    .byte $38 ; |  XXX   | $9A35
    .byte $24 ; |  X  X  | $9A36
    .byte $B8 ; |X XXX   | $9A37
    .byte $00 ; |        | $9A38

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      X  X XXX  XX  X  X     XX   XX   XX  XXX  XXXX
;      X  X  X  X  X X  X    X  X X  X X  X X  X X
;      X  X  X  X    X  X    X    X    X  X X  X X
;      XXXX  X  X  X XXXX     XX  X    X  X XXX  XXX
;      X  X  X  X  X X  X       X X    X  X X  X X
;      X  X  X  X  X X  X    X  X X  X X  X X  X X
;      X  X XXX  XXX X  X     XX   XX   XX  X  X XXXX
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L9A39:
    .byte <HighScoreOne  ; $9A39
    .byte >HighScoreOne  ; $9A3A
    .byte <HighScoreTwo  ; $9A3B
    .byte >HighScoreTwo  ; $9A3C
    .byte <HighScoreThree; $9A3D
    .byte >HighScoreThree; $9A3E
    .byte <HighScoreFour ; $9A3F
    .byte >HighScoreFour ; $9A40
    .byte <HighScoreFive ; $9A41
    .byte >HighScoreFive ; $9A42
    .byte <HighScoreSix  ; $9A43
    .byte >HighScoreSix  ; $9A44
HighScoreOne:
    .byte $4B ; | X  X XX| $9A45
    .byte $49 ; | X  X  X| $9A46
    .byte $49 ; | X  X  X| $9A47
    .byte $79 ; | XXXX  X| $9A48
    .byte $49 ; | X  X  X| $9A49
    .byte $49 ; | X  X  X| $9A4A
    .byte $4B ; | X  X XX| $9A4B
HighScoreTwo:
    .byte $9D ; |X  XXX X| $9A4C
    .byte $25 ; |  X  X X| $9A4D
    .byte $25 ; |  X  X X| $9A4E
    .byte $25 ; |  X  X X| $9A4F
    .byte $21 ; |  X    X| $9A50
    .byte $25 ; |  X  X X| $9A51
    .byte $99 ; |X  XX  X| $9A52
HighScoreThree:
    .byte $20 ; |  X     | $9A53
    .byte $21 ; |  X    X| $9A54
    .byte $20 ; |  X     | $9A55
    .byte $E0 ; |XXX     | $9A56
    .byte $21 ; |  X    X| $9A57
    .byte $21 ; |  X    X| $9A58
    .byte $20 ; |  X     | $9A59
HighScoreFour:
    .byte $C6 ; |XX   XX | $9A5A
    .byte $29 ; |  X X  X| $9A5B
    .byte $28 ; |  X X   | $9A5C
    .byte $C8 ; |XX  X   | $9A5D
    .byte $08 ; |    X   | $9A5E
    .byte $29 ; |  X X  X| $9A5F
    .byte $C6 ; |XX   XX | $9A60
HighScoreFive:
    .byte $32 ; |  XX  X | $9A61
    .byte $4A ; | X  X X | $9A62
    .byte $4A ; | X  X X | $9A63
    .byte $4B ; | X  X XX| $9A64
    .byte $4A ; | X  X X | $9A65
    .byte $4A ; | X  X X | $9A66
    .byte $33 ; |  XX  XX| $9A67
HighScoreSix:
    .byte $5E ; | X XXXX | $9A68
    .byte $50 ; | X X    | $9A69
    .byte $50 ; | X X    | $9A6A
    .byte $9C ; |X  XXX  | $9A6B
    .byte $50 ; | X X    | $9A6C
    .byte $50 ; | X X    | $9A6D
    .byte $9E ; |X  XXXX | $9A6E

ZeroLeft:
    .byte $03 ; |      XX| $9A6F           XXXX
    .byte $06 ; |     XX | $9A70          XX  XX
    .byte $26 ; |  X  XX | $9A71       X  XX  XX  X
    .byte $76 ; | XXX XX | $9A72      XXX XX  XX XXX
    .byte $26 ; |  X  XX | $9A73       X  XX  XX  X
    .byte $06 ; |     XX | $9A74          XX  XX
    .byte $03 ; |      XX| $9A75           XXXX
ZeroRight:
    .byte $C0 ; |XX      | $9A76
    .byte $60 ; | XX     | $9A77
    .byte $64 ; | XX  X  | $9A78
    .byte $6E ; | XX XXX | $9A79
    .byte $64 ; | XX  X  | $9A7A
    .byte $60 ; | XX     | $9A7B
    .byte $C0 ; |XX      | $9A7C
OneLeft:
    .byte $07 ; |     XXX| $9A7D           XXX
    .byte $01 ; |       X| $9A7E          XXXX
    .byte $21 ; |  X    X| $9A7F       X    XX    X
    .byte $71 ; | XXX   X| $9A80      XXX   XX   XXX
    .byte $21 ; |  X    X| $9A81       X    XX    X
    .byte $07 ; |     XXX| $9A82            XX
    .byte $03 ; |      XX| $9A83          XXXXXX
OneRight:
    .byte $E0 ; |XXX     | $9A84
    .byte $80 ; |X       | $9A85
    .byte $84 ; |X    X  | $9A86
    .byte $8E ; |X   XXX | $9A87
    .byte $84 ; |X    X  | $9A88
    .byte $80 ; |X       | $9A89
    .byte $80 ; |X       | $9A8A
TwoLeft:
    .byte $07 ; |     XXX| $9A8B          XXXXX
    .byte $06 ; |     XX | $9A8C          X   XX
    .byte $26 ; |  X  XX | $9A8D       X      XX  X
    .byte $73 ; | XXX  XX| $9A8E      XXX  XXXX  XXX
    .byte $20 ; |  X     | $9A8F       X  XX      X
    .byte $04 ; |     X  | $9A90          XX
    .byte $07 ; |     XXX| $9A91          XXXXXX
TwoRight:
    .byte $E0 ; |XXX     | $9A92
    .byte $00 ; |        | $9A93
    .byte $04 ; |     X  | $9A94
    .byte $CE ; |XX  XXX | $9A95
    .byte $64 ; | XX  X  | $9A96
    .byte $60 ; | XX     | $9A97
    .byte $C0 ; |XX      | $9A98
ThreeLeft:
    .byte $03 ; |      XX| $9A99           XXXX
    .byte $04 ; |     X  | $9A9A          X   XX
    .byte $20 ; |  X     | $9A9B       X      XX  X
    .byte $70 ; | XXX    | $9A9C      XXX    XX  XXX
    .byte $20 ; |  X     | $9A9D       X      XX  X
    .byte $04 ; |     X  | $9A9E          X   XX
    .byte $03 ; |      XX| $9A9F           XXXX
ThreeRight:
    .byte $C0 ; |XX      | $9AA0
    .byte $60 ; | XX     | $9AA1
    .byte $64 ; | XX  X  | $9AA2
    .byte $CE ; |XX  XXX | $9AA3
    .byte $64 ; | XX  X  | $9AA4
    .byte $60 ; | XX     | $9AA5
    .byte $C0 ; |XX      | $9AA6
FourLeft:
    .byte $00 ; |        | $9AA7             XX
    .byte $00 ; |        | $9AA8            XXX
    .byte $27 ; |  X  XXX| $9AA9       X   X XX   X
    .byte $74 ; | XXX X  | $9AAA      XXX X  XX  XXX
    .byte $22 ; |  X   X | $9AAB       X  XXXXXX  X
    .byte $01 ; |       X| $9AAC             XX
    .byte $00 ; |        | $9AAD             XX
FourRight:
    .byte $C0 ; |XX      | $9AAE
    .byte $C0 ; |XX      | $9AAF
    .byte $E4 ; |XXX  X  | $9AB0
    .byte $CE ; |XX  XXX | $9AB1
    .byte $C4 ; |XX   X  | $9AB2
    .byte $C0 ; |XX      | $9AB3
    .byte $C0 ; |XX      | $9AB4
FiveLeft:
    .byte $07 ; |     XXX| $9AB5          XXXXXX
    .byte $04 ; |     X  | $9AB6          XX
    .byte $20 ; |  X     | $9AB7       X  XX      X
    .byte $77 ; | XXX XXX| $9AB8      XXX XXXXX  XXX
    .byte $26 ; |  X  XX | $9AB9       X      XX  X
    .byte $06 ; |     XX | $9ABA          X   XX
    .byte $07 ; |     XXX| $9ABB          XXXXX
FiveRight:
    .byte $C0 ; |XX      | $9ABC
    .byte $60 ; | XX     | $9ABD
    .byte $64 ; | XX  X  | $9ABE
    .byte $CE ; |XX  XXX | $9ABF
    .byte $04 ; |     X  | $9AC0
    .byte $00 ; |        | $9AC1
    .byte $E0 ; |XXX     | $9AC2
SixLeft:
    .byte $03 ; |      XX| $9AC3           XXXX
    .byte $06 ; |     XX | $9AC4          XX   X
    .byte $26 ; |  X  XX | $9AC5       X  XX      X
    .byte $77 ; | XXX XXX| $9AC6      XXX XXXXX  XXX
    .byte $26 ; |  X  XX | $9AC7       X  XX  XX  X
    .byte $06 ; |     XX | $9AC8          XX  XX
    .byte $03 ; |      XX| $9AC9           XXXX
SixRight:
    .byte $C0 ; |XX      | $9ACA
    .byte $60 ; | XX     | $9ACB
    .byte $64 ; | XX  X  | $9ACC
    .byte $CE ; |XX  XXX | $9ACD
    .byte $04 ; |     X  | $9ACE
    .byte $20 ; |  X     | $9ACF
    .byte $C0 ; |XX      | $9AD0
SevenLeft:
    .byte $01 ; |       X| $9AD1          XXXXXX
    .byte $01 ; |       X| $9AD2          XX   X
    .byte $20 ; |  X     | $9AD3       X       X  X
    .byte $70 ; | XXX    | $9AD4      XXX     X  XXX
    .byte $20 ; |  X     | $9AD5       X     X    X
    .byte $06 ; |     XX | $9AD6            XX
    .byte $07 ; |     XXX| $9AD7            XX
SevenRight:
    .byte $80 ; |X       | $9AD8
    .byte $80 ; |X       | $9AD9
    .byte $84 ; |X    X  | $9ADA
    .byte $4E ; | X  XXX | $9ADB
    .byte $24 ; |  X  X  | $9ADC
    .byte $20 ; |  X     | $9ADD
    .byte $E0 ; |XXX     | $9ADE
EightLeft:
    .byte $03 ; |      XX| $9ADF           XXXX
    .byte $06 ; |     XX | $9AE0          XX  XX
    .byte $26 ; |  X  XX | $9AE1       X  XX  XX  X
    .byte $73 ; | XXX  XX| $9AE2      XXX  XXXX  XXX
    .byte $26 ; |  X  XX | $9AE3       X  XX  XX  X
    .byte $06 ; |     XX | $9AE4          XX  XX
    .byte $03 ; |      XX| $9AE5           XXXX
EightRight:
    .byte $C0 ; |XX      | $9AE6
    .byte $60 ; | XX     | $9AE7
    .byte $64 ; | XX  X  | $9AE8
    .byte $CE ; |XX  XXX | $9AE9
    .byte $64 ; | XX  X  | $9AEA
    .byte $60 ; | XX     | $9AEB
    .byte $C0 ; |XX      | $9AEC
NineLeft:
    .byte $03 ; |      XX| $9AED           XXXX
    .byte $04 ; |     X  | $9AEE          XX  XX
    .byte $20 ; |  X     | $9AEF       X  XX  XX  X
    .byte $73 ; | XXX  XX| $9AF0      XXX  XXXXX XXX
    .byte $26 ; |  X  XX | $9AF1       X      XX  X
    .byte $06 ; |     XX | $9AF2          X   XX
    .byte $03 ; |      XX| $9AF3           XXXX
NineRight:
    .byte $C0 ; |XX      | $9AF4
    .byte $60 ; | XX     | $9AF5
    .byte $64 ; | XX  X  | $9AF6
    .byte $EE ; |XXX XXX | $9AF7
    .byte $64 ; | XX  X  | $9AF8
    .byte $60 ; | XX     | $9AF9
    .byte $C0 ; |XX      | $9AFA

    .byte $00 ; |        | $9AFB   free bytes
    .byte $00 ; |        | $9AFC
    .byte $00 ; |        | $9AFD
    .byte $00 ; |        | $9AFE
    .byte $00 ; |        | $9AFF

L9B00:
    .byte $00 ; |        | $9B00
Four:
    .byte $0C ; |    XX  | $9B01
    .byte $0C ; |    XX  | $9B02
    .byte $7E ; | XXXXXX | $9B03
    .byte $4C ; | X  XX  | $9B04
    .byte $2C ; |  X XX  | $9B05
    .byte $1C ; |   XXX  | $9B06
    .byte $0C ; |    XX  | $9B07
    .byte $00 ; |        | $9B08
    .byte $00 ; |        | $9B09
Three:
    .byte $3C ; |  XXXX  | $9B0A
    .byte $46 ; | X   XX | $9B0B
    .byte $06 ; |     XX | $9B0C
    .byte $0C ; |    XX  | $9B0D
    .byte $06 ; |     XX | $9B0E
    .byte $46 ; | X   XX | $9B0F
    .byte $3C ; |  XXXX  | $9B10
    .byte $00 ; |        | $9B11
    .byte $00 ; |        | $9B12
Two:
    .byte $7E ; | XXXXXX | $9B13
    .byte $60 ; | XX     | $9B14
    .byte $60 ; | XX     | $9B15
    .byte $3C ; |  XXXX  | $9B16
    .byte $06 ; |     XX | $9B17
    .byte $46 ; | X   XX | $9B18
    .byte $7C ; | XXXXX  | $9B19
    .byte $00 ; |        | $9B1A
    .byte $00 ; |        | $9B1B
One:
    .byte $7E ; | XXXXXX | $9B1C
    .byte $18 ; |   XX   | $9B1D
    .byte $18 ; |   XX   | $9B1E
    .byte $18 ; |   XX   | $9B1F
    .byte $18 ; |   XX   | $9B20
    .byte $78 ; | XXXX   | $9B21
    .byte $38 ; |  XXX   | $9B22
    .byte $00 ; |        | $9B23
    .byte $00 ; |        | $9B24
Zero:
    .byte $3C ; |  XXXX  | $9B25
    .byte $66 ; | XX  XX | $9B26
    .byte $66 ; | XX  XX | $9B27
    .byte $66 ; | XX  XX | $9B28
    .byte $66 ; | XX  XX | $9B29
    .byte $66 ; | XX  XX | $9B2A
    .byte $3C ; |  XXXX  | $9B2B
    .byte $00 ; |        | $9B2C
Five:
    .byte $7C ; | XXXXX  | $9B2D
    .byte $46 ; | X   XX | $9B2E
    .byte $06 ; |     XX | $9B2F
    .byte $7C ; | XXXXX  | $9B30
    .byte $60 ; | XX     | $9B31
    .byte $60 ; | XX     | $9B32
    .byte $7E ; | XXXXXX | $9B33
Six:
    .byte $3C ; |  XXXX  | $9B34
    .byte $66 ; | XX  XX | $9B35
    .byte $66 ; | XX  XX | $9B36
    .byte $7C ; | XXXXX  | $9B37
    .byte $60 ; | XX     | $9B38
    .byte $62 ; | XX   X | $9B39
    .byte $3C ; |  XXXX  | $9B3A
Seven:
    .byte $18 ; |   XX   | $9B3B
    .byte $18 ; |   XX   | $9B3C
    .byte $08 ; |    X   | $9B3D
    .byte $04 ; |     X  | $9B3E
    .byte $02 ; |      X | $9B3F
    .byte $62 ; | XX   X | $9B40
    .byte $7E ; | XXXXXX | $9B41
Eight:
    .byte $3C ; |  XXXX  | $9B42
    .byte $66 ; | XX  XX | $9B43
    .byte $66 ; | XX  XX | $9B44
    .byte $3C ; |  XXXX  | $9B45
    .byte $66 ; | XX  XX | $9B46
    .byte $66 ; | XX  XX | $9B47
    .byte $3C ; |  XXXX  | $9B48
Nine:
    .byte $3C ; |  XXXX  | $9B49
    .byte $46 ; | X   XX | $9B4A
    .byte $06 ; |     XX | $9B4B
    .byte $3E ; |  XXXXX | $9B4C
    .byte $66 ; | XX  XX | $9B4D
    .byte $66 ; | XX  XX | $9B4E
    .byte $3C ; |  XXXX  | $9B4F
L9B50:
    .byte <L9C26         ; $9B50   low
    .byte <L9C4A         ; $9B51
    .byte <L9C77         ; $9B52
    .byte <L9CA1         ; $9B53
    .byte <L9CD4         ; $9B54
    .byte <L9C4A         ; $9B55
    .byte <L9C77         ; $9B56
    .byte <L9CA1         ; $9B57
    .byte <L9C4A         ; $9B58
    .byte <L9C77         ; $9B59
    .byte <L9CA1         ; $9B5A
    .byte <L9CE3         ; $9B5B
    .byte <L9CEB         ; $9B5C
    .byte <L9CFD         ; $9B5D
    .byte <L9D0B         ; $9B5E
    .byte <L9D0F         ; $9B5F
    .byte <L9D12         ; $9B60
    .byte <L9D15         ; $9B61
    .byte <L9D18         ; $9B62
    .byte <L9D1B         ; $9B63
    .byte <L9D1E         ; $9B64
    .byte <L9D21         ; $9B65
    .byte <L9D24         ; $9B66
    .byte <L9D37         ; $9B67
    .byte <L9D40         ; $9B68
    .byte <L9D4C         ; $9B69
    .byte <L9D24         ; $9B6A
    .byte <L9D4C         ; $9B6B
    .byte <L9D54         ; $9B6C
    .byte <L9D5C         ; $9B6D
    .byte <L9D61         ; $9B6E
    .byte <L9D37         ; $9B6F
    .byte <L9D66         ; $9B70
    .byte <L9D72         ; $9B71
    .byte <L9D94         ; $9B72
    .byte <L9DA7         ; $9B73
    .byte <L9CD9         ; $9B74
    .byte <L9CDE         ; $9B75
L9B76:
    .byte >L9C26         ; $9B76   high
    .byte >L9C4A         ; $9B77
    .byte >L9C77         ; $9B78
    .byte >L9CA1         ; $9B79
    .byte >L9CD4         ; $9B7A
    .byte >L9C4A         ; $9B7B
    .byte >L9C77         ; $9B7C
    .byte >L9CA1         ; $9B7D
    .byte >L9C4A         ; $9B7E
    .byte >L9C77         ; $9B7F
    .byte >L9CA1         ; $9B80
    .byte >L9CE3         ; $9B81
    .byte >L9CEB         ; $9B82
    .byte >L9CFD         ; $9B83
    .byte >L9D0B         ; $9B84
    .byte >L9D0F         ; $9B85
    .byte >L9D12         ; $9B86
    .byte >L9D15         ; $9B87
    .byte >L9D18         ; $9B88
    .byte >L9D1B         ; $9B89
    .byte >L9D1E         ; $9B8A
    .byte >L9D21         ; $9B8B
    .byte >L9D24         ; $9B8C
    .byte >L9D37         ; $9B8D
    .byte >L9D40         ; $9B8E
    .byte >L9D4C         ; $9B8F
    .byte >L9D24         ; $9B90
    .byte >L9D4C         ; $9B91
    .byte >L9D54         ; $9B92
    .byte >L9D5C         ; $9B93
    .byte >L9D61         ; $9B94
    .byte >L9D37         ; $9B95
    .byte >L9D66         ; $9B96
    .byte >L9D72         ; $9B97
    .byte >L9D94         ; $9B98
    .byte >L9DA7         ; $9B99
    .byte >L9CD9         ; $9B9A
    .byte >L9CDE         ; $9B9B
L9B9C:
    .byte <L9C0E         ; $9B9C   low
    .byte <L9C1A         ; $9B9D
    .byte <L9C1A         ; $9B9E
    .byte <L9C1A         ; $9B9F
    .byte <L9C0E         ; $9BA0
    .byte <L9C14         ; $9BA1
    .byte <L9C14         ; $9BA2
    .byte <L9C14         ; $9BA3
    .byte <L9C20         ; $9BA4
    .byte <L9C20         ; $9BA5
    .byte <L9C20         ; $9BA6
    .byte <L9C0E         ; $9BA7
    .byte <L9CF8         ; $9BA8
    .byte <L9D05         ; $9BA9
    .byte <L9D0E         ; $9BAA
    .byte <L9D0E         ; $9BAB
    .byte <L9D0E         ; $9BAC
    .byte <L9D0E         ; $9BAD
    .byte <L9D0E         ; $9BAE
    .byte <L9D0E         ; $9BAF
    .byte <L9D0E         ; $9BB0
    .byte <L9D0E         ; $9BB1
    .byte <L9D2D         ; $9BB2
    .byte <L9D2D         ; $9BB3
    .byte <L9D2D         ; $9BB4
    .byte <L9D51         ; $9BB5
    .byte <L9D2D         ; $9BB6
    .byte <L9D51         ; $9BB7
    .byte <L9C0E         ; $9BB8
    .byte <L9D2D         ; $9BB9
    .byte <L9D2D         ; $9BBA
    .byte <L9D2D         ; $9BBB
    .byte <L9D2D         ; $9BBC
    .byte <L9C0E         ; $9BBD
    .byte <L9C0E         ; $9BBE
    .byte <L9D05         ; $9BBF
    .byte <L9C0E         ; $9BC0
    .byte <L9C0E         ; $9BC1
L9BC2:
    .byte >L9C0E         ; $9BC2   high
    .byte >L9C1A         ; $9BC3
    .byte >L9C1A         ; $9BC4
    .byte >L9C1A         ; $9BC5
    .byte >L9C0E         ; $9BC6
    .byte >L9C14         ; $9BC7
    .byte >L9C14         ; $9BC8
    .byte >L9C14         ; $9BC9
    .byte >L9C20         ; $9BCA
    .byte >L9C20         ; $9BCB
    .byte >L9C20         ; $9BCC
    .byte >L9C0E         ; $9BCD
    .byte >L9CF8         ; $9BCE
    .byte >L9D05         ; $9BCF
    .byte >L9D0E         ; $9BD0
    .byte >L9D0E         ; $9BD1
    .byte >L9D0E         ; $9BD2
    .byte >L9D0E         ; $9BD3
    .byte >L9D0E         ; $9BD4
    .byte >L9D0E         ; $9BD5
    .byte >L9D0E         ; $9BD6
    .byte >L9D0E         ; $9BD7
    .byte >L9D2D         ; $9BD8
    .byte >L9D2D         ; $9BD9
    .byte >L9D2D         ; $9BDA
    .byte >L9D51         ; $9BDB
    .byte >L9D2D         ; $9BDC
    .byte >L9D51         ; $9BDD
    .byte >L9C0E         ; $9BDE
    .byte >L9D2D         ; $9BDF
    .byte >L9D2D         ; $9BE0
    .byte >L9D2D         ; $9BE1
    .byte >L9D2D         ; $9BE2
    .byte >L9C0E         ; $9BE3
    .byte >L9C0E         ; $9BE4
    .byte >L9D05         ; $9BE5
    .byte >L9C0E         ; $9BE6
    .byte >L9C0E         ; $9BE7
L9BE8:
    .byte $13 ; |   X  XX| $9BE8
    .byte $13 ; |   X  XX| $9BE9
    .byte $13 ; |   X  XX| $9BEA
    .byte $13 ; |   X  XX| $9BEB
    .byte $23 ; |  X   XX| $9BEC
    .byte $33 ; |  XX  XX| $9BED
    .byte $33 ; |  XX  XX| $9BEE
    .byte $33 ; |  XX  XX| $9BEF
    .byte $13 ; |   X  XX| $9BF0
    .byte $13 ; |   X  XX| $9BF1
    .byte $13 ; |   X  XX| $9BF2
    .byte $53 ; | X X  XX| $9BF3
    .byte $21 ; |  X    X| $9BF4
    .byte $22 ; |  X   X | $9BF5
    .byte $2A ; |  X X X | $9BF6
    .byte $2A ; |  X X X | $9BF7
    .byte $2A ; |  X X X | $9BF8
    .byte $2A ; |  X X X | $9BF9
    .byte $2A ; |  X X X | $9BFA
    .byte $2A ; |  X X X | $9BFB
    .byte $2A ; |  X X X | $9BFC
    .byte $2A ; |  X X X | $9BFD
    .byte $21 ; |  X    X| $9BFE
    .byte $21 ; |  X    X| $9BFF
    .byte $20 ; |  X     | $9C00
    .byte $24 ; |  X  X  | $9C01
    .byte $22 ; |  X   X | $9C02
    .byte $22 ; |  X   X | $9C03
    .byte $30 ; |  XX    | $9C04
    .byte $30 ; |  XX    | $9C05
    .byte $51 ; | X X   X| $9C06
    .byte $22 ; |  X   X | $9C07
    .byte $22 ; |  X   X | $9C08
    .byte $31 ; |  XX   X| $9C09
    .byte $47 ; | X   XXX| $9C0A
    .byte $22 ; |  X   X | $9C0B
    .byte $23 ; |  X   XX| $9C0C
    .byte $23 ; |  X   XX| $9C0D
L9C0E:
    .byte $01 ; |       X| $9C0E
    .byte $04 ; |     X  | $9C0F
    .byte $08 ; |    X   | $9C10
    .byte $0C ; |    XX  | $9C11
    .byte $0F ; |    XXXX| $9C12
    .byte $12 ; |   X  X | $9C13
L9C14:
    .byte $15 ; |   X X X| $9C14
    .byte $18 ; |   XX   | $9C15
    .byte $1C ; |   XXX  | $9C16
    .byte $20 ; |  X     | $9C17
    .byte $23 ; |  X   XX| $9C18
    .byte $26 ; |  X  XX | $9C19
L9C1A:
    .byte $29 ; |  X X  X| $9C1A
    .byte $2C ; |  X XX  | $9C1B
    .byte $30 ; |  XX    | $9C1C
    .byte $34 ; |  XX X  | $9C1D
    .byte $37 ; |  XX XXX| $9C1E
    .byte $3A ; |  XXX X | $9C1F
L9C20:
    .byte $3D ; |  XXXX X| $9C20
    .byte $40 ; | X      | $9C21
    .byte $44 ; | X   X  | $9C22
    .byte $48 ; | X  X   | $9C23
    .byte $4B ; | X  X XX| $9C24
    .byte $4E ; | X  XXX | $9C25
L9C26:
    .byte $EC ; |XXX XX  | $9C26
    .byte $4C ; | X  XX  | $9C27
    .byte $E4 ; |XXX  X  | $9C28
    .byte $5D ; | X XXX X| $9C29
    .byte $5D ; | X XXX X| $9C2A
    .byte $5A ; | X XX X | $9C2B
    .byte $5A ; | X XX X | $9C2C
    .byte $97 ; |X  X XXX| $9C2D
    .byte $57 ; | X X XXX| $9C2E
    .byte $36 ; |  XX XX | $9C2F
    .byte $53 ; | X X  XX| $9C30
    .byte $56 ; | X X XX | $9C31
    .byte $57 ; | X X XXX| $9C32
    .byte $57 ; | X X XXX| $9C33
    .byte $5A ; | X XX X | $9C34
    .byte $5A ; | X XX X | $9C35
    .byte $DD ; |XX XXX X| $9C36
    .byte $5D ; | X XXX X| $9C37
    .byte $33 ; |  XX  XX| $9C38
    .byte $36 ; |  XX XX | $9C39
    .byte $57 ; | X X XXX| $9C3A
    .byte $57 ; | X X XXX| $9C3B
    .byte $57 ; | X X XXX| $9C3C
    .byte $36 ; |  XX XX | $9C3D
    .byte $37 ; |  XX XXX| $9C3E
    .byte $5A ; | X XX X | $9C3F
    .byte $5A ; | X XX X | $9C40
    .byte $5A ; | X XX X | $9C41
    .byte $53 ; | X X  XX| $9C42
    .byte $57 ; | X X XXX| $9C43
    .byte $5D ; | X XXX X| $9C44
    .byte $5A ; | X XX X | $9C45
    .byte $5A ; | X XX X | $9C46
    .byte $BD ; |X XXXX X| $9C47
    .byte $7D ; | XXXXX X| $9C48
    .byte $FF ; |XXXXXXXX| $9C49
L9C4A:
    .byte $F4 ; |XXXX X  | $9C4A
    .byte $E4 ; |XXX  X  | $9C4B
    .byte $E4 ; |XXX  X  | $9C4C
    .byte $6E ; | XX XXX | $9C4D
    .byte $6C ; | XX XX  | $9C4E
    .byte $4E ; | X  XXX | $9C4F
    .byte $4E ; | X  XXX | $9C50
    .byte $53 ; | X X  XX| $9C51
    .byte $53 ; | X X  XX| $9C52
    .byte $2E ; |  X XXX | $9C53
    .byte $2C ; |  X XX  | $9C54
    .byte $2B ; |  X X XX| $9C55
    .byte $2E ; |  X XXX | $9C56
    .byte $33 ; |  XX  XX| $9C57
    .byte $31 ; |  XX   X| $9C58
    .byte $2F ; |  X XXXX| $9C59
    .byte $33 ; |  XX  XX| $9C5A
    .byte $D7 ; |XX X XXX| $9C5B
    .byte $77 ; | XXX XXX| $9C5C
    .byte $F2 ; |XXXX  X | $9C5D
    .byte $33 ; |  XX  XX| $9C5E
    .byte $2E ; |  X XXX | $9C5F
    .byte $2B ; |  X X XX| $9C60
    .byte $49 ; | X  X  X| $9C61
    .byte $F4 ; |XXXX X  | $9C62
    .byte $F2 ; |XXXX  X | $9C63
    .byte $33 ; |  XX  XX| $9C64
    .byte $2E ; |  X XXX | $9C65
    .byte $2B ; |  X X XX| $9C66
    .byte $49 ; | X  X  X| $9C67
    .byte $F4 ; |XXXX X  | $9C68
    .byte $F2 ; |XXXX  X | $9C69
    .byte $33 ; |  XX  XX| $9C6A
    .byte $2F ; |  X XXXX| $9C6B
    .byte $2C ; |  X XX  | $9C6C
    .byte $2A ; |  X X X | $9C6D
    .byte $2C ; |  X XX  | $9C6E
    .byte $2F ; |  X XXXX| $9C6F
    .byte $2C ; |  X XX  | $9C70
    .byte $2E ; |  X XXX | $9C71
    .byte $3D ; |  XXXX X| $9C72
    .byte $37 ; |  XX XXX| $9C73
    .byte $33 ; |  XX  XX| $9C74
    .byte $6E ; | XX XXX | $9C75
    .byte $FF ; |XXXXXXXX| $9C76
L9C77:
    .byte $F4 ; |XXXX X  | $9C77
    .byte $E4 ; |XXX  X  | $9C78
    .byte $6E ; | XX XXX | $9C79
    .byte $6C ; | XX XX  | $9C7A
    .byte $4E ; | X  XXX | $9C7B
    .byte $4E ; | X  XXX | $9C7C
    .byte $53 ; | X X  XX| $9C7D
    .byte $53 ; | X X  XX| $9C7E
    .byte $2E ; |  X XXX | $9C7F
    .byte $33 ; |  XX  XX| $9C80
    .byte $2E ; |  X XXX | $9C81
    .byte $2B ; |  X X XX| $9C82
    .byte $2A ; |  X X X | $9C83
    .byte $2C ; |  X XX  | $9C84
    .byte $2F ; |  X XXXX| $9C85
    .byte $33 ; |  XX  XX| $9C86
    .byte $D7 ; |XX X XXX| $9C87
    .byte $77 ; | XXX XXX| $9C88
    .byte $33 ; |  XX  XX| $9C89
    .byte $33 ; |  XX  XX| $9C8A
    .byte $33 ; |  XX  XX| $9C8B
    .byte $33 ; |  XX  XX| $9C8C
    .byte $6E ; | XX XXX | $9C8D
    .byte $33 ; |  XX  XX| $9C8E
    .byte $33 ; |  XX  XX| $9C8F
    .byte $33 ; |  XX  XX| $9C90
    .byte $33 ; |  XX  XX| $9C91
    .byte $6C ; | XX XX  | $9C92
    .byte $33 ; |  XX  XX| $9C93
    .byte $33 ; |  XX  XX| $9C94
    .byte $2E ; |  X XXX | $9C95
    .byte $2B ; |  X X XX| $9C96
    .byte $2A ; |  X X X | $9C97
    .byte $2C ; |  X XX  | $9C98
    .byte $2F ; |  X XXXX| $9C99
    .byte $2C ; |  X XX  | $9C9A
    .byte $33 ; |  XX  XX| $9C9B
    .byte $3D ; |  XXXX X| $9C9C
    .byte $37 ; |  XX XXX| $9C9D
    .byte $33 ; |  XX  XX| $9C9E
    .byte $6E ; | XX XXX | $9C9F
    .byte $FF ; |XXXXXXXX| $9CA0
L9CA1:
    .byte $F4 ; |XXXX X  | $9CA1
    .byte $EC ; |XXX XX  | $9CA2
    .byte $73 ; | XXX  XX| $9CA3
    .byte $71 ; | XXX   X| $9CA4
    .byte $E4 ; |XXX  X  | $9CA5
    .byte $5D ; | X XXX X| $9CA6
    .byte $5D ; | X XXX X| $9CA7
    .byte $EC ; |XXX XX  | $9CA8
    .byte $4C ; | X  XX  | $9CA9
    .byte $4C ; | X  XX  | $9CAA
    .byte $E4 ; |XXX  X  | $9CAB
    .byte $3D ; |  XXXX X| $9CAC
    .byte $EC ; |XXX XX  | $9CAD
    .byte $2C ; |  X XX  | $9CAE
    .byte $E4 ; |XXX  X  | $9CAF
    .byte $3D ; |  XXXX X| $9CB0
    .byte $37 ; |  XX XXX| $9CB1
    .byte $36 ; |  XX XX | $9CB2
    .byte $3A ; |  XXX X | $9CB3
    .byte $3F ; |  XXXXXX| $9CB4
    .byte $EC ; |XXX XX  | $9CB5
    .byte $2C ; |  X XX  | $9CB6
    .byte $CF ; |XX  XXXX| $9CB7
    .byte $6F ; | XX XXXX| $9CB8
    .byte $33 ; |  XX  XX| $9CB9
    .byte $34 ; |  XX X  | $9CBA
    .byte $33 ; |  XX  XX| $9CBB
    .byte $34 ; |  XX X  | $9CBC
    .byte $73 ; | XXX  XX| $9CBD
    .byte $2C ; |  X XX  | $9CBE
    .byte $2D ; |  X XX X| $9CBF
    .byte $2C ; |  X XX  | $9CC0
    .byte $2D ; |  X XX X| $9CC1
    .byte $6C ; | XX XX  | $9CC2
    .byte $F2 ; |XXXX  X | $9CC3
    .byte $2C ; |  X XX  | $9CC4
    .byte $E4 ; |XXX  X  | $9CC5
    .byte $3D ; |  XXXX X| $9CC6
    .byte $37 ; |  XX XXX| $9CC7
    .byte $3A ; |  XXX X | $9CC8
    .byte $3D ; |  XXXX X| $9CC9
    .byte $3F ; |  XXXXXX| $9CCA
    .byte $3A ; |  XXX X | $9CCB
    .byte $3D ; |  XXXX X| $9CCC
    .byte $EC ; |XXX XX  | $9CCD
    .byte $33 ; |  XX  XX| $9CCE
    .byte $2F ; |  X XXXX| $9CCF
    .byte $2C ; |  X XX  | $9CD0
    .byte $E4 ; |XXX  X  | $9CD1
    .byte $7D ; | XXXXX X| $9CD2
    .byte $FF ; |XXXXXXXX| $9CD3
L9CD4:
    .byte $F0 ; |XXXX    | $9CD4
    .byte $81 ; |X      X| $9CD5
    .byte $F0 ; |XXXX    | $9CD6
    .byte $00 ; |        | $9CD7
    .byte $FF ; |XXXXXXXX| $9CD8
L9CD9:
    .byte $F0 ; |XXXX    | $9CD9
    .byte $82 ; |X     X | $9CDA
    .byte $F0 ; |XXXX    | $9CDB
    .byte $00 ; |        | $9CDC
    .byte $FF ; |XXXXXXXX| $9CDD
L9CDE:
    .byte $F0 ; |XXXX    | $9CDE
    .byte $83 ; |X     XX| $9CDF
    .byte $F0 ; |XXXX    | $9CE0
    .byte $00 ; |        | $9CE1
    .byte $FF ; |XXXXXXXX| $9CE2
L9CE3:
    .byte $F0 ; |XXXX    | $9CE3
    .byte $08 ; |    X   | $9CE4
    .byte $F0 ; |XXXX    | $9CE5
    .byte $0A ; |    X X | $9CE6
    .byte $F0 ; |XXXX    | $9CE7
    .byte $09 ; |    X  X| $9CE8
    .byte $F0 ; |XXXX    | $9CE9
    .byte $0B ; |    X XX| $9CEA
L9CEB:
    .byte $E8 ; |XXX X   | $9CEB
    .byte $12 ; |   X  X | $9CEC
    .byte $14 ; |   X X  | $9CED
    .byte $16 ; |   X XX | $9CEE
    .byte $18 ; |   XX   | $9CEF
    .byte $1C ; |   XXX  | $9CF0
    .byte $1B ; |   XX XX| $9CF1
    .byte $1A ; |   XX X | $9CF2
    .byte $1C ; |   XXX  | $9CF3
    .byte $1B ; |   XX XX| $9CF4
    .byte $1A ; |   XX X | $9CF5
    .byte $1C ; |   XXX  | $9CF6
    .byte $FF ; |XXXXXXXX| $9CF7
L9CF8:
    .byte $18 ; |   XX   | $9CF8
    .byte $27 ; |  X  XXX| $9CF9
    .byte $26 ; |  X  XX | $9CFA
    .byte $34 ; |  XX X  | $9CFB
    .byte $32 ; |  XX  X | $9CFC
L9CFD:
    .byte $EF ; |XXX XXXX| $9CFD
    .byte $03 ; |      XX| $9CFE
    .byte $06 ; |     XX | $9CFF
    .byte $03 ; |      XX| $9D00
    .byte $06 ; |     XX | $9D01
    .byte $03 ; |      XX| $9D02
    .byte $06 ; |     XX | $9D03
    .byte $FF ; |XXXXXXXX| $9D04
L9D05:
    .byte $1A ; |   XX X | $9D05
    .byte $19 ; |   XX  X| $9D06
    .byte $18 ; |   XX   | $9D07
    .byte $17 ; |   X XXX| $9D08
    .byte $16 ; |   X XX | $9D09
    .byte $13 ; |   X  XX| $9D0A
L9D0B:
    .byte $EC ; |XXX XX  | $9D0B
    .byte $13 ; |   X  XX| $9D0C
    .byte $FF ; |XXXXXXXX| $9D0D
L9D0E:
    .byte $0F ; |    XXXX| $9D0E
L9D0F:
    .byte $EC ; |XXX XX  | $9D0F
    .byte $11 ; |   X   X| $9D10
    .byte $FF ; |XXXXXXXX| $9D11
L9D12:
    .byte $EC ; |XXX XX  | $9D12
    .byte $0F ; |    XXXX| $9D13
    .byte $FF ; |XXXXXXXX| $9D14
L9D15:
    .byte $EC ; |XXX XX  | $9D15
    .byte $0E ; |    XXX | $9D16
    .byte $FF ; |XXXXXXXX| $9D17
L9D18:
    .byte $EC ; |XXX XX  | $9D18
    .byte $0C ; |    XX  | $9D19
    .byte $FF ; |XXXXXXXX| $9D1A
L9D1B:
    .byte $EC ; |XXX XX  | $9D1B
    .byte $0B ; |    X XX| $9D1C
    .byte $FF ; |XXXXXXXX| $9D1D
L9D1E:
    .byte $E4 ; |XXX  X  | $9D1E
    .byte $1F ; |   XXXXX| $9D1F
    .byte $FF ; |XXXXXXXX| $9D20
L9D21:
    .byte $E4 ; |XXX  X  | $9D21
    .byte $1D ; |   XXX X| $9D22
    .byte $FF ; |XXXXXXXX| $9D23
L9D24:
    .byte $E4 ; |XXX  X  | $9D24
    .byte $07 ; |     XXX| $9D25
    .byte $08 ; |    X   | $9D26
    .byte $09 ; |    X  X| $9D27
    .byte $0A ; |    X X | $9D28
    .byte $0B ; |    X XX| $9D29
    .byte $0C ; |    XX  | $9D2A
    .byte $0E ; |    XXX | $9D2B
    .byte $FF ; |XXXXXXXX| $9D2C
L9D2D:
    .byte $1F ; |   XXXXX| $9D2D
    .byte $1E ; |   XXXX | $9D2E
    .byte $1D ; |   XXX X| $9D2F
    .byte $1C ; |   XXX  | $9D30
    .byte $1B ; |   XX XX| $9D31
    .byte $1A ; |   XX X | $9D32
    .byte $19 ; |   XX  X| $9D33
    .byte $18 ; |   XX   | $9D34
    .byte $17 ; |   X XXX| $9D35
    .byte $16 ; |   X XX | $9D36
L9D37:
    .byte $E4 ; |XXX  X  | $9D37
    .byte $0E ; |    XXX | $9D38
    .byte $0C ; |    XX  | $9D39
    .byte $0B ; |    X XX| $9D3A
    .byte $0A ; |    X X | $9D3B
    .byte $09 ; |    X  X| $9D3C
    .byte $08 ; |    X   | $9D3D
    .byte $07 ; |     XXX| $9D3E
    .byte $FF ; |XXXXXXXX| $9D3F
L9D40:
    .byte $E4 ; |XXX  X  | $9D40
    .byte $05 ; |     X X| $9D41
    .byte $04 ; |     X  | $9D42
    .byte $04 ; |     X  | $9D43
    .byte $04 ; |     X  | $9D44
    .byte $04 ; |     X  | $9D45
    .byte $04 ; |     X  | $9D46
    .byte $04 ; |     X  | $9D47
    .byte $04 ; |     X  | $9D48
    .byte $04 ; |     X  | $9D49
    .byte $04 ; |     X  | $9D4A
    .byte $FF ; |XXXXXXXX| $9D4B
L9D4C:
    .byte $E7 ; |XXX  XXX| $9D4C
    .byte $0F ; |    XXXX| $9D4D
    .byte $1F ; |   XXXXX| $9D4E
    .byte $07 ; |     XXX| $9D4F
    .byte $FF ; |XXXXXXXX| $9D50
L9D51:
    .byte $1F ; |   XXXXX| $9D51
    .byte $18 ; |   XX   | $9D52
    .byte $04 ; |     X  | $9D53
L9D54:
    .byte $E4 ; |XXX  X  | $9D54
    .byte $57 ; | X X XXX| $9D55
    .byte $5D ; | X XXX X| $9D56
    .byte $5A ; | X XX X | $9D57
    .byte $5A ; | X XX X | $9D58
    .byte $BD ; |X XXXX X| $9D59
    .byte $7D ; | XXXXX X| $9D5A
    .byte $FF ; |XXXXXXXX| $9D5B
L9D5C:
    .byte $F0 ; |XXXX    | $9D5C
    .byte $17 ; |   X XXX| $9D5D
    .byte $F0 ; |XXXX    | $9D5E
    .byte $17 ; |   X XXX| $9D5F
    .byte $FF ; |XXXXXXXX| $9D60
L9D61:
    .byte $F0 ; |XXXX    | $9D61
    .byte $16 ; |   X XX | $9D62
    .byte $F0 ; |XXXX    | $9D63
    .byte $A2 ; |X X   X | $9D64
    .byte $FF ; |XXXXXXXX| $9D65
L9D66:
    .byte $E4 ; |XXX  X  | $9D66
    .byte $05 ; |     X X| $9D67
    .byte $04 ; |     X  | $9D68
    .byte $05 ; |     X X| $9D69
    .byte $04 ; |     X  | $9D6A
    .byte $05 ; |     X X| $9D6B
    .byte $04 ; |     X  | $9D6C
    .byte $05 ; |     X X| $9D6D
    .byte $04 ; |     X  | $9D6E
    .byte $05 ; |     X X| $9D6F
    .byte $04 ; |     X  | $9D70
    .byte $FF ; |XXXXXXXX| $9D71
L9D72:
    .byte $E4 ; |XXX  X  | $9D72
    .byte $4E ; | X  XXX | $9D73
    .byte $F4 ; |XXXX X  | $9D74
    .byte $53 ; | X X  XX| $9D75
    .byte $F4 ; |XXXX X  | $9D76
    .byte $4E ; | X  XXX | $9D77
    .byte $4E ; | X  XXX | $9D78
    .byte $53 ; | X X  XX| $9D79
    .byte $F4 ; |XXXX X  | $9D7A
    .byte $56 ; | X X XX | $9D7B
    .byte $53 ; | X X  XX| $9D7C
    .byte $31 ; |  XX   X| $9D7D
    .byte $33 ; |  XX  XX| $9D7E
    .byte $56 ; | X X XX | $9D7F
    .byte $B3 ; |X XX  XX| $9D80
    .byte $73 ; | XXX  XX| $9D81
    .byte $F4 ; |XXXX X  | $9D82
    .byte $4E ; | X  XXX | $9D83
    .byte $F4 ; |XXXX X  | $9D84
    .byte $53 ; | X X  XX| $9D85
    .byte $F4 ; |XXXX X  | $9D86
    .byte $4E ; | X  XXX | $9D87
    .byte $4E ; | X  XXX | $9D88
    .byte $53 ; | X X  XX| $9D89
    .byte $F4 ; |XXXX X  | $9D8A
    .byte $56 ; | X X XX | $9D8B
    .byte $53 ; | X X  XX| $9D8C
    .byte $36 ; |  XX XX | $9D8D
    .byte $37 ; |  XX XXX| $9D8E
    .byte $5A ; | X XX X | $9D8F
    .byte $7D ; | XXXXX X| $9D90
    .byte $4E ; | X  XXX | $9D91
    .byte $F4 ; |XXXX X  | $9D92
    .byte $FF ; |XXXXXXXX| $9D93
L9D94:
    .byte $EC ; |XXX XX  | $9D94
    .byte $4C ; | X  XX  | $9D95
    .byte $E4 ; |XXX  X  | $9D96
    .byte $5D ; | X XXX X| $9D97
    .byte $5D ; | X XXX X| $9D98
    .byte $5A ; | X XX X | $9D99
    .byte $5A ; | X XX X | $9D9A
    .byte $97 ; |X  X XXX| $9D9B
    .byte $57 ; | X X XXX| $9D9C
    .byte $36 ; |  XX XX | $9D9D
    .byte $53 ; | X X  XX| $9D9E
    .byte $56 ; | X X XX | $9D9F
    .byte $57 ; | X X XXX| $9DA0
    .byte $57 ; | X X XXX| $9DA1
    .byte $5A ; | X XX X | $9DA2
    .byte $5A ; | X XX X | $9DA3
    .byte $BD ; |X XXXX X| $9DA4
    .byte $7D ; | XXXXX X| $9DA5
    .byte $FF ; |XXXXXXXX| $9DA6
L9DA7:
    .byte $E7 ; |XXX  XXX| $9DA7
    .byte $06 ; |     XX | $9DA8
    .byte $03 ; |      XX| $9DA9
    .byte $06 ; |     XX | $9DAA
    .byte $03 ; |      XX| $9DAB
    .byte $06 ; |     XX | $9DAC
    .byte $03 ; |      XX| $9DAD
    .byte $FF ; |XXXXXXXX| $9DAE
    .byte $00 ; |        | $9DAF
    .byte $00 ; |        | $9DB0
    .byte $00 ; |        | $9DB1
    .byte $00 ; |        | $9DB2
    .byte $00 ; |        | $9DB3
    .byte $00 ; |        | $9DB4
    .byte $00 ; |        | $9DB5
    .byte $00 ; |        | $9DB6
    .byte $00 ; |        | $9DB7
    .byte $00 ; |        | $9DB8
    .byte $00 ; |        | $9DB9
    .byte $00 ; |        | $9DBA
    .byte $00 ; |        | $9DBB
    .byte $00 ; |        | $9DBC
    .byte $00 ; |        | $9DBD
    .byte $00 ; |        | $9DBE
    .byte $00 ; |        | $9DBF
    .byte $00 ; |        | $9DC0
    .byte $00 ; |        | $9DC1
    .byte $00 ; |        | $9DC2
    .byte $00 ; |        | $9DC3
    .byte $00 ; |        | $9DC4
    .byte $00 ; |        | $9DC5
    .byte $00 ; |        | $9DC6
    .byte $00 ; |        | $9DC7
    .byte $00 ; |        | $9DC8
    .byte $00 ; |        | $9DC9
    .byte $00 ; |        | $9DCA
    .byte $00 ; |        | $9DCB
    .byte $00 ; |        | $9DCC
    .byte $00 ; |        | $9DCD
    .byte $00 ; |        | $9DCE
    .byte $00 ; |        | $9DCF
    .byte $00 ; |        | $9DD0
    .byte $00 ; |        | $9DD1
    .byte $00 ; |        | $9DD2
    .byte $00 ; |        | $9DD3
    .byte $00 ; |        | $9DD4
    .byte $00 ; |        | $9DD5
    .byte $00 ; |        | $9DD6
    .byte $00 ; |        | $9DD7
    .byte $00 ; |        | $9DD8
    .byte $00 ; |        | $9DD9
    .byte $00 ; |        | $9DDA
    .byte $00 ; |        | $9DDB
    .byte $00 ; |        | $9DDC
    .byte $00 ; |        | $9DDD
    .byte $00 ; |        | $9DDE
    .byte $00 ; |        | $9DDF
    .byte $00 ; |        | $9DE0
    .byte $00 ; |        | $9DE1
    .byte $00 ; |        | $9DE2
    .byte $00 ; |        | $9DE3
    .byte $00 ; |        | $9DE4
    .byte $00 ; |        | $9DE5
    .byte $00 ; |        | $9DE6
    .byte $00 ; |        | $9DE7
    .byte $00 ; |        | $9DE8
    .byte $00 ; |        | $9DE9
    .byte $00 ; |        | $9DEA
    .byte $00 ; |        | $9DEB
    .byte $00 ; |        | $9DEC
    .byte $00 ; |        | $9DED
    .byte $00 ; |        | $9DEE
    .byte $00 ; |        | $9DEF
    .byte $00 ; |        | $9DF0
    .byte $00 ; |        | $9DF1
    .byte $00 ; |        | $9DF2
    .byte $00 ; |        | $9DF3
    .byte $00 ; |        | $9DF4
    .byte $00 ; |        | $9DF5
    .byte $00 ; |        | $9DF6
    .byte $00 ; |        | $9DF7
    .byte $00 ; |        | $9DF8
    .byte $00 ; |        | $9DF9
    .byte $00 ; |        | $9DFA
    .byte $00 ; |        | $9DFB
    .byte $00 ; |        | $9DFC
    .byte $00 ; |        | $9DFD
    .byte $00 ; |        | $9DFE
    .byte $00 ; |        | $9DFF
L9E00:
    .byte $00 ; |        | $9E00   Audio
    .byte $1F ; |   XXXXX| $9E01
    .byte $10 ; |   X    | $9E02
    .byte $00 ; |        | $9E03
    .byte $1F ; |   XXXXX| $9E04
    .byte $2C ; |  X XX  | $9E05
    .byte $10 ; |   X    | $9E06
    .byte $00 ; |        | $9E07
    .byte $1F ; |   XXXXX| $9E08
    .byte $6C ; | XX XX  | $9E09
    .byte $10 ; |   X    | $9E0A
    .byte $00 ; |        | $9E0B
    .byte $18 ; |   XX   | $9E0C
    .byte $1F ; |   XXXXX| $9E0D
    .byte $00 ; |        | $9E0E
    .byte $18 ; |   XX   | $9E0F
    .byte $3F ; |  XXXXXX| $9E10
    .byte $00 ; |        | $9E11
    .byte $18 ; |   XX   | $9E12
    .byte $7F ; | XXXXXXX| $9E13
    .byte $00 ; |        | $9E14
    .byte $18 ; |   XX   | $9E15
    .byte $10 ; |   X    | $9E16
    .byte $00 ; |        | $9E17
    .byte $18 ; |   XX   | $9E18
    .byte $25 ; |  X  X X| $9E19
    .byte $10 ; |   X    | $9E1A
    .byte $00 ; |        | $9E1B
    .byte $18 ; |   XX   | $9E1C
    .byte $65 ; | XX  X X| $9E1D
    .byte $10 ; |   X    | $9E1E
    .byte $00 ; |        | $9E1F
    .byte $15 ; |   X X X| $9E20
    .byte $18 ; |   XX   | $9E21
    .byte $00 ; |        | $9E22
    .byte $15 ; |   X X X| $9E23
    .byte $38 ; |  XXX   | $9E24
    .byte $00 ; |        | $9E25
    .byte $15 ; |   X X X| $9E26
    .byte $78 ; | XXXX   | $9E27
    .byte $00 ; |        | $9E28
    .byte $16 ; |   X XX | $9E29
    .byte $10 ; |   X    | $9E2A
    .byte $00 ; |        | $9E2B
    .byte $16 ; |   X XX | $9E2C
    .byte $23 ; |  X   XX| $9E2D
    .byte $10 ; |   X    | $9E2E
    .byte $00 ; |        | $9E2F
    .byte $16 ; |   X XX | $9E30
    .byte $63 ; | XX   XX| $9E31
    .byte $10 ; |   X    | $9E32
    .byte $00 ; |        | $9E33
    .byte $13 ; |   X  XX| $9E34
    .byte $16 ; |   X XX | $9E35
    .byte $00 ; |        | $9E36
    .byte $13 ; |   X  XX| $9E37
    .byte $36 ; |  XX XX | $9E38
    .byte $00 ; |        | $9E39
    .byte $13 ; |   X  XX| $9E3A
    .byte $76 ; | XXX XX | $9E3B
    .byte $00 ; |        | $9E3C
    .byte $13 ; |   X  XX| $9E3D
    .byte $10 ; |   X    | $9E3E
    .byte $00 ; |        | $9E3F
    .byte $13 ; |   X  XX| $9E40
    .byte $21 ; |  X    X| $9E41
    .byte $10 ; |   X    | $9E42
    .byte $00 ; |        | $9E43
    .byte $13 ; |   X  XX| $9E44
    .byte $61 ; | XX    X| $9E45
    .byte $10 ; |   X    | $9E46
    .byte $00 ; |        | $9E47
    .byte $11 ; |   X   X| $9E48
    .byte $13 ; |   X  XX| $9E49
    .byte $00 ; |        | $9E4A
    .byte $11 ; |   X   X| $9E4B
    .byte $33 ; |  XX  XX| $9E4C
    .byte $00 ; |        | $9E4D
    .byte $11 ; |   X   X| $9E4E
    .byte $73 ; | XXX  XX| $9E4F
    .byte $00 ; |        | $9E50

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; (c)ATARI 1989
;
;      XXXX   XX  XXX  XX  XXX  XXX   X  XX   XX   XX
;     XX  XX X  X  X  X  X X  X  X   XX X  X X  X X  X
;     XX XXX XXXX  X  XXXX XXX   X    X  XXX  XX   XXX
;     XX  XX X  X  X  X  X X  X  X    X    X X  X    X
;      XXXX  X  X  X  X  X X  X XXX  XXX XX   XX   XX
;
; (c)Axlon 1989
;
;      XXXX   XX       X              X  XX   XX   XX
;     XX  XX X  X      X  XX   XX    XX X  X X  X X  X
;     XX XXX XXXX X  X X X  X X  X    X  XXX  XX   XXX
;     XX  XX X  X  XX  X X  X X  X    X    X X  X    X
;      XXXX  X  X X  X X  XX  X  X   XXX XX   XX   XX
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L9E51:
    .byte $17            ; $9E51   load "Axlon" logo pointers
    .byte $0B            ; $9E52   load "Atari" logo pointers

L9E53:
    .byte <Copyright     ; $9E53
    .byte >Copyright     ; $9E54
    .byte <AtariOne      ; $9E55
    .byte >AtariOne      ; $9E56
    .byte <AtariTwo      ; $9E57
    .byte >AtariTwo      ; $9E58
    .byte <AtariThree    ; $9E59
    .byte >AtariThree    ; $9E5A
    .byte <YearOne       ; $9E5B
    .byte >YearOne       ; $9E5C
    .byte <YearTwo       ; $9E5D
    .byte >YearTwo       ; $9E5E

    .byte <Copyright     ; $9E5F
    .byte >Copyright     ; $9E60
    .byte <AxlonOne      ; $9E61
    .byte >AxlonOne      ; $9E62
    .byte <AxlonTwo      ; $9E63
    .byte >AxlonTwo      ; $9E64
    .byte <AxlonThree    ; $9E65
    .byte >AxlonThree    ; $9E66
    .byte <YearOne       ; $9E67
    .byte >YearOne       ; $9E68
    .byte <YearTwo       ; $9E69
    .byte >YearTwo       ; $9E6A

Copyright:
    .byte $00 ; |        | $9E6B
    .byte $00 ; |        | $9E6C
    .byte $00 ; |        | $9E6D
    .byte $79 ; | XXXX  X| $9E6E
    .byte $CD ; |XX  XX X| $9E6F
    .byte $DD ; |XX XXX X| $9E70
    .byte $CD ; |XX  XX X| $9E71
    .byte $78 ; | XXXX   | $9E72
AtariOne:
    .byte $00 ; |        | $9E73   shared
    .byte $00 ; |        | $9E74   shared
    .byte $00 ; |        | $9E75   shared
    .byte $24 ; |  X  X  | $9E76
    .byte $24 ; |  X  X  | $9E77
    .byte $E4 ; |XXX  X  | $9E78
    .byte $24 ; |  X  X  | $9E79
    .byte $CE ; |XX  XXX | $9E7A
AtariTwo:
    .byte $00 ; |        | $9E7B   shared
    .byte $00 ; |        | $9E7C   shared
    .byte $00 ; |        | $9E7D   shared
    .byte $94 ; |X  X X  | $9E7E
    .byte $94 ; |X  X X  | $9E7F
    .byte $F7 ; |XXXX XXX| $9E80
    .byte $94 ; |X  X X  | $9E81
    .byte $67 ; | XX  XXX| $9E82
AtariThree:
    .byte $00 ; |        | $9E83   shared
    .byte $00 ; |        | $9E84   shared
    .byte $00 ; |        | $9E85   shared
    .byte $B9 ; |X XXX  X| $9E86
    .byte $90 ; |X  X    | $9E87
    .byte $10 ; |   X    | $9E88
    .byte $91 ; |X  X   X| $9E89
    .byte $38 ; |  XXX   | $9E8A
YearOne:
    .byte $00 ; |        | $9E8B   shared
    .byte $00 ; |        | $9E8C   shared
    .byte $00 ; |        | $9E8D   shared
    .byte $D8 ; |XX XX   | $9E8E
    .byte $85 ; |X    X X| $9E8F
    .byte $9C ; |X  XXX  | $9E90
    .byte $A5 ; |X X  X X| $9E91
    .byte $98 ; |X  XX   | $9E92
YearTwo:
    .byte $00 ; |        | $9E93   shared
    .byte $00 ; |        | $9E94   shared
    .byte $00 ; |        | $9E95   shared
    .byte $C6 ; |XX   XX | $9E96
    .byte $21 ; |  X    X| $9E97
    .byte $C7 ; |XX   XXX| $9E98
    .byte $29 ; |  X X  X| $9E99
    .byte $C6 ; |XX   XX | $9E9A
    .byte $00 ; |        | $9E9B
    .byte $00 ; |        | $9E9C
    .byte $00 ; |        | $9E9D
AxlonOne:
    .byte $00 ; |        | $9E9E   shared
    .byte $00 ; |        | $9E9F   shared
    .byte $00 ; |        | $9EA0   shared
    .byte $29 ; |  X X  X| $9EA1
    .byte $26 ; |  X  XX | $9EA2
    .byte $E9 ; |XXX X  X| $9EA3
    .byte $20 ; |  X     | $9EA4
    .byte $C0 ; |XX      | $9EA5
AxlonTwo:
    .byte $00 ; |        | $9EA6   shared
    .byte $00 ; |        | $9EA7   shared
    .byte $00 ; |        | $9EA8   shared
    .byte $4C ; | X  XX  | $9EA9
    .byte $52 ; | X X  X | $9EAA
    .byte $52 ; | X X  X | $9EAB
    .byte $4C ; | X  XX  | $9EAC
    .byte $40 ; | X      | $9EAD
AxlonThree:
    .byte $00 ; |        | $9EAE   shared
    .byte $00 ; |        | $9EAF   shared
    .byte $00 ; |        | $9EB0   shared
    .byte $91 ; |X  X   X| $9EB1
    .byte $90 ; |X  X    | $9EB2
    .byte $90 ; |X  X    | $9EB3
    .byte $61 ; | XX    X| $9EB4
    .byte $00 ; |        | $9EB5
    .byte $00 ; |        | $9EB6
    .byte $00 ; |        | $9EB7
    .byte $00 ; |        | $9EB8


  EMPTY_SPACE 287        ; $9EB9 - $9FD7 free bytes


       ORG $2FD8
      RORG $9FD8

START_BANK_0:
    lda    BANK_0                ; 4
    jmp    L9100                 ; 3

L9FDE:  ; indirect jump (also)
    lda    BANK_3                ; 4
    jmp.ind ($0080)              ; 5

L9FE4:  ; indirect jump
    lda    BANK_2                ; 4
    jmp.ind ($0080)              ; 5

L9FEA:  ; indirect jump
    lda    BANK_1                ; 4
    jmp.ind ($0080)              ; 5

    lda    BANK_0                ; 4
    jmp.ind ($0080)              ; 5

    .byte $00 ; |        | $9FF6
    .byte $00 ; |        | $9FF7
    .byte $00 ; |        | $9FF8
    .byte $00 ; |        | $9FF9

       ORG $2FFA
      RORG $9FFA

    .word START_BANK_0
    .word START_BANK_0
    .word START_BANK_0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 1
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


       ORG $3000
      RORG $B000

    FILLED_SPACE 256                ; $B000 - $B0FF super chip ram

LB100:  ; indirect jump, coming from bank 0
    lda    #1                    ; 2
    sta    CTRLPF                ; 3
    sta    $DF                   ; 3
    lda    #0                    ; 2
    sta    $D2                   ; 3
    sed                          ; 2
    clc                          ; 2
    ldy    $B4                   ; 3
    lda    LBBB5,Y               ; 4
    adc    $C4                   ; 3
    bcc    LB117                 ; 2³
    lda    #$99                  ; 2
LB117:
    sta    $C4                   ; 3
    cld                          ; 2
    bne    LB11E                 ; 2³
    inc    $C4                   ; 5
LB11E:
    lda    #0                    ; 2
    sta    $DC                   ; 3
LB122:
    lda    #<L918A               ; 2
    sta    $80                   ; 3
    lda    #>L918A               ; 2
    sta    $81                   ; 3
    jsr    LBFF0                 ; 6   bankswitch, goto L918A
    tya                          ; 2
    beq    LB133                 ; 2³
    jmp    LB21C                 ; 3

LB133:
    lda    #0                    ; 2
    sta    $C6                   ; 3
LB137:
    lda    INTIM                 ; 4
    bne    LB137                 ; 2³
    lda    #$E4                  ; 2
    sta    TIM64T                ; 4
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    lda    #<L934E               ; 2
    sta    $80                   ; 3
    lda    #>L934E               ; 2
    sta    $81                   ; 3
    jsr    LBFF0                 ; 6   bankswitch, goto L934E
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #0                    ; 2
    lda    $C3                   ; 3
    bne    LB163                 ; 2³
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jmp    LB172                 ; 3

LB163:
    jsr    LBA7C                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #5                    ; 2
    sta    NUSIZ0                ; 3
    lda    $D0                   ; 3
    sta    COLUP0                ; 3
LB172:
    ldy    #$19                  ; 2
    lda    $C3                   ; 3
    beq    LB17E                 ; 2³
    cpx    $D7                   ; 3
    bne    LB17E                 ; 2³
    ldy    $E2                   ; 3
LB17E:
    sty    $D9                   ; 3
    lda    $DF                   ; 3
    beq    LB186                 ; 2³
    lda    $BA,X                 ; 4
LB186:
    sta    $E3                   ; 3
    lda    LBB0C,X               ; 4
    tay                          ; 2
    ldx    #6                    ; 2
LB18E:
    lsr    $E3                   ; 5
    bcs    LB197                 ; 2³
    lda    #0                    ; 2
    jmp    LB19A                 ; 3

LB197:
    lda    LBB00,Y               ; 4
LB19A:
    sta    $C8,X                 ; 4
    iny                          ; 2
    dex                          ; 2
    bpl    LB18E                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    lda    #$80                  ; 2
    sta    PF0                   ; 3
    lda    #$EF                  ; 2
    sta    PF1                   ; 3
    lda    #$DE                  ; 2
    sta    PF2                   ; 3
    lda    $C3                   ; 3
    beq    LB1C2                 ; 2³
    ldy    $D7                   ; 3
    cpy    $C6                   ; 3
    bne    LB1C2                 ; 2³
    ldx    $D4                   ; 3
    lda    #0                    ; 2
    sta    $C8,X                 ; 4
LB1C2:
    ldx    #0                    ; 2
    ldy    #$15                  ; 2
LB1C6:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    cpy    $D9                   ; 3
    bcc    LB1D7                 ; 2³
    cpy    $DA                   ; 3
    bcs    LB1DA                 ; 2³
    lda    #$FF                  ; 2
    jmp    LB1DC                 ; 3

LB1D7:
    sta    $E3                   ; 3
    nop                          ; 2
LB1DA:
    nop                          ; 2
    nop                          ; 2
LB1DC:
    sta    GRP0                  ; 3
    lda    $C8                   ; 3
    sta    COLUPF                ; 3
    lda    $C9,X                 ; 4
    sta    COLUPF                ; 3
    lda    $CA,X                 ; 4
    sta    COLUPF                ; 3
    lda    $CB                   ; 3
    sta    COLUPF                ; 3
    lda    $CC,X                 ; 4
    sta    COLUPF                ; 3
    lda    $CD,X                 ; 4
    sta    COLUPF                ; 3
    lda    $CE                   ; 3
    sta    COLUPF                ; 3
    dey                          ; 2
    bpl    LB1C6                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    PF0                   ; 3
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    stx    GRP0                  ; 3
    inc    $C6                   ; 5
    ldx    $C6                   ; 3
    cpx    #6                    ; 2
    beq    LB212                 ; 2³
    jmp    LB172                 ; 3

LB212:
    ldx    #7                    ; 2
LB214:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LB214                 ; 2³
    jsr    LB9C2                 ; 6
LB21C:
    sta    WSYNC                 ; 3
;---------------------------------------
LB21E:
    lda    INTIM                 ; 4
    bne    LB21E                 ; 2³
    lda    #$23                  ; 2
    sta    TIM64T                ; 4
    lda    #2                    ; 2
    sta    VBLANK                ; 3
    ldy    $DC                   ; 3
    bmi    LB233                 ; 2³
    jsr    LB28F                 ; 6
LB233:
    lda    #<L9398               ; 2
    sta    $80                   ; 3
    lda    #>L9398               ; 2
    sta    $81                   ; 3
    jsr    LBFF0                 ; 6   bankswitch, goto L9398
    lda    $C2                   ; 3
    bne    LB246                 ; 2³
    lda    $92                   ; 3
    beq    LB24E                 ; 2³
LB246:
    lda    #1                    ; 2
    sta    $DF                   ; 3
    lda    $C2                   ; 3
    beq    LB287                 ; 2³
LB24E:
    lda    $C1                   ; 3
    and    #$20                  ; 2
    beq    LB25A                 ; 2³
    jsr    LB2E3                 ; 6
    jmp    LB287                 ; 3

LB25A:
    lda    $C1                   ; 3
    and    #$10                  ; 2
    beq    LB263                 ; 2³
    jsr    LB340                 ; 6
LB263:
    ldy    $C3                   ; 3
    beq    LB287                 ; 2³
    dec    $C3                   ; 5
    bne    LB275                 ; 2³
    lda    $B4                   ; 3
    cmp    #4                    ; 2
    bcc    LB275                 ; 2³
    lda    #0                    ; 2
    sta    $DF                   ; 3
LB275:
    lda    LBB73,Y               ; 4
    sta    $E2                   ; 3
    lda    LBB7C,Y               ; 4
    sta    $DA                   ; 3
    cpy    #4                    ; 2
    bne    LB287                 ; 2³
    lda    $D1                   ; 3
    sta    $D0                   ; 3
LB287:
    lda    INTIM                 ; 4
    bne    LB287                 ; 2³
    jmp    LB122                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LB28F SUBROUTINE
    bne    LB29A                 ; 2³
    lda    #$7F                  ; 2
    ldx    #5                    ; 2
LB295:
    sta    $BA,X                 ; 4
    dex                          ; 2
    bpl    LB295                 ; 2³
LB29A:
    cpy    #$11                  ; 2
    bcc    LB2AB                 ; 2³
    ldx    #5                    ; 2
LB2A0:
    lda    $BA,X                 ; 4
    sta    SC_00,X               ; 5
    dex                          ; 2
    bpl    LB2A0                 ; 2³
    stx    $DC                   ; 3
    rts                          ; 6

LB2AB:
    lda    $98                   ; 3
    ldx    #0                    ; 2
LB2AF:
    cmp    #6                    ; 2
    bcc    LB2B9                 ; 2³
    inx                          ; 2
    sbc    #6                    ; 2
    jmp    LB2AF                 ; 3

LB2B9:
    cpx    #$2A                  ; 2
    bcs    LB2E2                 ; 2³
    txa                          ; 2
    ldy    #0                    ; 2
LB2C0:
    cmp    #7                    ; 2
    bcc    LB2CA                 ; 2³
    iny                          ; 2
    sbc    #7                    ; 2
    jmp    LB2C0                 ; 3

LB2CA:
    tax                          ; 2
    lda    #$80                  ; 2
LB2CD:
    lsr                          ; 2
    dex                          ; 2
    bpl    LB2CD                 ; 2³
    sta    $E3                   ; 3
    and.wy $BA,Y                 ; 4
    beq    LB2E2                 ; 2³
    inc    $DC                   ; 5
    lda    $E3                   ; 3
    eor.wy $BA,Y                 ; 4
    sta.wy $BA,Y                 ; 5
LB2E2:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LB2E3 SUBROUTINE
    clc                          ; 2
    lda    $D6                   ; 3
    adc    #5                    ; 2
    cmp    #$AC                  ; 2
    bcs    LB339                 ; 2³+1
    cmp    #$14                  ; 2
    bcc    LB339                 ; 2³+1
    ldx    #0                    ; 2
    sbc    #$14                  ; 2
LB2F4:
    cmp    #$1A                  ; 2
    bcc    LB2FE                 ; 2³
    inx                          ; 2
    sbc    #$1A                  ; 2
    jmp    LB2F4                 ; 3

LB2FE:
    cmp    #$16                  ; 2
    bcs    LB339                 ; 2³
    stx    $D7                   ; 3
    lda    $D3                   ; 3
    adc    #3                    ; 2
    cmp    #$94                  ; 2
    bcs    LB339                 ; 2³
    cmp    #$0C                  ; 2
    bcc    LB339                 ; 2³
    ldx    #0                    ; 2
    sbc    #$0C                  ; 2
LB314:
    cmp    #$14                  ; 2
    bcc    LB31E                 ; 2³
    inx                          ; 2
    sbc    #$14                  ; 2
    jmp    LB314                 ; 3

LB31E:
    cmp    #$10                  ; 2
    bcs    LB339                 ; 2³
    stx    $D4                   ; 3
    txa                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $B1                   ; 3
    asl                          ; 2
    asl                          ; 2
    clc                          ; 2
    adc    $B1                   ; 3
    adc    #$3B                  ; 2
    sta    $B1                   ; 3
    lda    #$30                  ; 2
    eor    $C1                   ; 3
    sta    $C1                   ; 3
    rts                          ; 6

LB339:
    lda    $C1                   ; 3
    and    #$4F                  ; 2
    sta    $C1                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LB340 SUBROUTINE
    ldx    $D4                   ; 3
    ldy    $D7                   ; 3
    lda    #$80                  ; 2
LB346:
    lsr                          ; 2
    dex                          ; 2
    bpl    LB346                 ; 2³
    sta    $E3                   ; 3
    and.wy $BA,Y                 ; 4
    bne    LB36B                 ; 2³
    ldx    $B4                   ; 3
    beq    LB3BD                 ; 2³
    sed                          ; 2
    clc                          ; 2
    lda    #1                    ; 2
    adc    $C5                   ; 3
    sta    $C5                   ; 3
    cld                          ; 2
    lda    #$23                  ; 2
    sta    $9A                   ; 3
    ldx    #0                    ; 2
    stx    $D0                   ; 3
    ldx    #1                    ; 2
    jmp    LB37E                 ; 3

LB36B:
    sed                          ; 2
    sec                          ; 2
    lda    $C5                   ; 3
    sbc    #1                    ; 2
    sta    $C5                   ; 3
    cld                          ; 2
    lda    #$0D                  ; 2
    sta    $9A                   ; 3
    ldx    #0                    ; 2
    stx    $D1                   ; 3
    ldx    #0                    ; 2
LB37E:
    lda    $E3                   ; 3
    eor.wy $BA,Y                 ; 4
    sta.wy $BA,Y                 ; 5
    lda    LBB0C,Y               ; 4
    clc                          ; 2
    adc    #6                    ; 2
    sec                          ; 2
    sbc    $D4                   ; 3
    tay                          ; 2
    lda    LBB00,Y               ; 4
    sta    $D0,X                 ; 4
    lda    #9                    ; 2
    sta    $C3                   ; 3
    lda    #1                    ; 2
    sta    $DF                   ; 3
    ldy    $D7                   ; 3
    lda    SC_00|READ,Y          ; 4
    and    $E3                   ; 3
    beq    LB3BD                 ; 2³
    eor    SC_00|READ,Y          ; 4
    sta    SC_00,Y               ; 5
    sed                          ; 2
    clc                          ; 2
    lda    #3                    ; 2
    adc    $C4                   ; 3
    bcc    LB3B6                 ; 2³
    lda    #$99                  ; 2
LB3B6:
    sta    $C4                   ; 3
    ldy    $B4                   ; 3
    jsr    LBA05                 ; 6
LB3BD:
    lda    $C1                   ; 3
    and    #$4F                  ; 2
    sta    $C1                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LB3C4:  ; indirect jump, coming from bank 0
    lda    #$18                  ; 2
    sta    $D2                   ; 3
    lda    #5                    ; 2
    sta    CTRLPF                ; 3
    sed                          ; 2
    clc                          ; 2
    ldy    $B4                   ; 3
    lda    LBBBF,Y               ; 4
    adc    $C4                   ; 3
    bcc    LB3D9                 ; 2³
    lda    #$99                  ; 2
LB3D9:
    sta    $C4                   ; 3
    cld                          ; 2
    lda    #$3F                  ; 2
    ldx    #5                    ; 2
LB3E0:
    sta    $BA,X                 ; 4
    dex                          ; 2
    bpl    LB3E0                 ; 2³
    stx    $C0                   ; 3
    lda    #1                    ; 2
    sta    $DB                   ; 3
    lda    #4                    ; 2
    sta    $DF                   ; 3
    lda    #$27                  ; 2
    sta    $E0                   ; 3
    lda    #$18                  ; 2
    sta    $E1                   ; 3
    lda    #$C2                  ; 2
    sta    $D0                   ; 3
    lda    #$32                  ; 2
    sta    $D1                   ; 3
LB3FF:
    lda    #<L918A               ; 2
    sta    $80                   ; 3
    lda    #>L918A               ; 2
    sta    $81                   ; 3
    jsr    LBFF0                 ; 6   bankswitch, goto L918A
    tya                          ; 2
    beq    LB410                 ; 2³
    jmp    LB5E6                 ; 3

LB410:
    lda    $92                   ; 3
    bne    LB417                 ; 2³
    jsr    LB62D                 ; 6
LB417:
    lda    INTIM                 ; 4
    bne    LB417                 ; 2³
    lda    #$E4                  ; 2
    sta    TIM64T                ; 4
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    lda    #<L934E               ; 2
    sta    $80                   ; 3
    lda    #>L934E               ; 2
    sta    $81                   ; 3
    jsr    LBFF0                 ; 6   bankswitch, goto L934E
;2nd demo screen
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $D2                   ; 3
    sta    COLUBK                ; 3
    lda    #$20                  ; 2
    sta    COLUPF                ; 3
    lda    #$FF                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    #$BB                  ; 2
    sta    $85                   ; 3
    sta    $87                   ; 3
    ldx    #5                    ; 2
LB44E:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LB44E                 ; 2³
    lda    #$B0                  ; 2
    sta    PF0                   ; 3
    ldx    #4                    ; 2
LB459:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LB459                 ; 2³
    lda    #$55                  ; 2
    sta    PF1                   ; 3
    lda    #$AA                  ; 2
    sta    PF2                   ; 3
    ldx    #4                    ; 2
LB468:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LB468                 ; 2³
    lda    #$F0                  ; 2
    sta    PF0                   ; 3
    lda    #0                    ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    ldx    #2                    ; 2
LB479:
    lda    $BA,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LBB5C,Y               ; 4
    sta    $C8,X                 ; 4
    lda    $BA,X                 ; 4
    and    #$07                  ; 2
    tay                          ; 2
    lda    LBB5C,Y               ; 4
    sta    $CB,X                 ; 4
    dex                          ; 2
    bpl    LB479                 ; 2³
    lda    #6                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #0                    ; 2
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    lda    #2                    ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldx    #0                    ; 2
    lda    #$54                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    LBA79                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$70                  ; 2
    sta    PF0                   ; 3
    ldx    #1                    ; 2
    lda    #$64                  ; 2
    jsr    LBA79                 ; 6
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    #$0A                  ; 2
LB4C1:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #3                    ; 2
LB4C5:
    dex                          ; 2
    bpl    LB4C5                 ; 2³
    lda    $C8                   ; 3
    ldx    $CB                   ; 3
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    lda    $C9                   ; 3
    ldx    $CC                   ; 3
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    lda    $CA                   ; 3
    ldx    $CD                   ; 3
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    dey                          ; 2
    bne    LB4C1                 ; 2³
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #$FF                  ; 2
    sta    PF1                   ; 3   @74
;---------------------------------------
    sta    PF2                   ; 3   @1
    lda    #$1E                  ; 2
    sta    $D9                   ; 3
    lda    #$0F                  ; 2
    sta    $CE                   ; 3
    lda    #$F4                  ; 2
    sta    COLUP0                ; 3
    lda    #4                    ; 2
    sta    COLUP1                ; 3
    ldx    #0                    ; 2
    ldy    #$0A                  ; 2
    jsr    LB769                 ; 6
    lda    $D0                   ; 3
    sta    COLUP0                ; 3
    lda    $D1                   ; 3
    sta    COLUP1                ; 3
    ldx    #2                    ; 2
    ldy    #$16                  ; 2
    jsr    LB769                 ; 6
    lda    #$0A                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #8                    ; 2
    sta    $D9                   ; 3
    ldx    #4                    ; 2
    ldy    #$14                  ; 2
    jsr    LB769                 ; 6
    ldx    #7                    ; 2
    lda    $C0                   ; 3
LB52A:
    asl                          ; 2
    bcs    LB532                 ; 2³
    ldy    #0                    ; 2
    jmp    LB535                 ; 3

LB532:
    ldy    LBB8C,X               ; 4
LB535:
    sty    $C8,X                 ; 4
    dex                          ; 2
    bpl    LB52A                 ; 2³
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    #$73                  ; 2
    sta    $E4                   ; 3
    ldx    #3                    ; 2
    jmp    LB54E                 ; 3

LB547:
    sec                          ; 2
    lda    $E4                   ; 3
    sbc    #$10                  ; 2
    sta    $E4                   ; 3
LB54E:
    jsr    LBA79                 ; 6
    dex                          ; 2
    bpl    LB547                 ; 2³
    lda    #$34                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    $D2                   ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$FF                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #2                    ; 2
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    #$0F                  ; 2
LB574:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    $E3                   ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    $C8                   ; 3
    ldx    $C9                   ; 3
    sta    COLUP0                ; 3
    stx    COLUP1                ; 3
    lda    $CA                   ; 3
    ldx    $CB                   ; 3
    sta    COLUP0                ; 3
    stx    COLUP1                ; 3
    lda    $CC                   ; 3
    ldx    $CD                   ; 3
    sta    COLUP0                ; 3
    stx    COLUP1                ; 3
    lda    $CE                   ; 3
    sta    COLUP0                ; 3
    ldx    $CF                   ; 3
    stx    COLUP1                ; 3
    dey                          ; 2
    bpl    LB574                 ; 2³
    lda    #0                    ; 2
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #$F0                  ; 2
    sta    PF0                   ; 3
    ldx    #5                    ; 2
LB5B1:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LB5B1                 ; 2³
    lda    #$B0                  ; 2
    sta    PF0                   ; 3
    lda    #$FF                  ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    ldx    #6                    ; 2
LB5C2:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LB5C2                 ; 2³
    ldx    #0                    ; 2
    lda    #$20                  ; 2
    sta    $D2                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    PF0                   ; 3
    sta    COLUBK                ; 3
    jsr    LB9C2                 ; 6
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$18                  ; 2
    sta    $D2                   ; 3
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    COLUBK                ; 3
LB5E6:
    sta    WSYNC                 ; 3
;---------------------------------------
LB5E8:
    lda    INTIM                 ; 4
    bne    LB5E8                 ; 2³
    lda    #$23                  ; 2
    sta    TIM64T                ; 4
    lda    #2                    ; 2
    sta    VBLANK                ; 3
    lda    #<L9398               ; 2
    sta    $80                   ; 3
    lda    #>L9398               ; 2
    sta    $81                   ; 3
    jsr    LBFF0                 ; 6   bankswitch, goto L9398
    lda    $92                   ; 3
    bne    LB625                 ; 2³
    lda    $C1                   ; 3
    bne    LB612                 ; 2³
    lda    $C0                   ; 3
    bne    LB625                 ; 2³
    dec    $C0                   ; 5
    jmp    LB625                 ; 3

LB612:
    and    #$20                  ; 2
    beq    LB61C                 ; 2³
    jsr    LB7E8                 ; 6
    jmp    LB625                 ; 3

LB61C:
    lda    $C1                   ; 3
    and    #$10                  ; 2
    beq    LB625                 ; 2³
    jsr    LB958                 ; 6
LB625:
    lda    INTIM                 ; 4
    bne    LB625                 ; 2³
    jmp    LB3FF                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LB62D SUBROUTINE
    ldy    $B4                   ; 3
    beq    LB65F                 ; 2³
    dec    $DB                   ; 5
    bpl    LB65F                 ; 2³
    lda    LBB93,Y               ; 4
    sta    $DB                   ; 3
    lda    $DF                   ; 3
    clc                          ; 2
    adc    #1                    ; 2
    and    #$0F                  ; 2
    sta    $DF                   ; 3
    lda    $E0                   ; 3
    adc    #1                    ; 2
    and    #$3F                  ; 2
    sta    $E0                   ; 3
    cmp    #$20                  ; 2
    bne    LB657                 ; 2³
    ldx    $D0                   ; 3
    lda    $D1                   ; 3
    sta    $D0                   ; 3
    stx    $D1                   ; 3
LB657:
    dec    $E1                   ; 5
    bpl    LB65F                 ; 2³
    lda    #$5F                  ; 2
    sta    $E1                   ; 3
LB65F:
    ldx    #0                    ; 2
    ldy    #0                    ; 2
    lda    $DF                   ; 3
    cmp    #8                    ; 2
    bcc    LB670                 ; 2³
    eor    #$0F                  ; 2
    ldy    #8                    ; 2
    jmp    LB672                 ; 3

LB670:
    ldx    #8                    ; 2
LB672:
    sta    $DC                   ; 3
    stx    SC_0C                 ; 4
    sty    SC_0D                 ; 4
    ldx    #$12                  ; 2
    lda    $BD                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    beq    LB686                 ; 2³
    ldx    #<Duck                ; 2
LB686:
    stx    SC_00                 ; 4
    lda    LBB64,Y               ; 4
    sta    SC_06                 ; 4
    clc                          ; 2
    lda    LBB6C,Y               ; 4
    adc    #$50                  ; 2
    adc    $DC                   ; 3
    sta    SC_12                 ; 4
    ldx    #$12                  ; 2
    lda    $BD                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    beq    LB6A5                 ; 2³
    ldx    #<Duck                ; 2
LB6A5:
    stx    SC_01                 ; 4
    lda    LBB64,Y               ; 4
    sta    SC_07                 ; 4
    clc                          ; 2
    lda    LBB6C,Y               ; 4
    adc    #$67                  ; 2
    sec                          ; 2
    sbc    $DC                   ; 3
    sta    SC_13                 ; 4
    ldx    #0                    ; 2
    ldy    #0                    ; 2
    lda    $E0                   ; 3
    cmp    #$20                  ; 2
    bcc    LB6CB                 ; 2³
    eor    #$3F                  ; 2
    ldx    #8                    ; 2
    jmp    LB6CD                 ; 3

LB6CB:
    ldy    #8                    ; 2
LB6CD:
    sta    $DD                   ; 3
    stx    SC_0E                 ; 4
    sty    SC_0F                 ; 4
    ldx    #$12                  ; 2
    lda    $BE                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    beq    LB6E1                 ; 2³
    ldx    #<Godzilla            ; 2
LB6E1:
    stx    SC_02                 ; 4
    lda    LBB64,Y               ; 4
    sta    SC_08                 ; 4
    clc                          ; 2
    lda    LBB6C,Y               ; 4
    adc    #$3C                  ; 2
    adc    $DD                   ; 3
    sta    SC_14                 ; 4
    ldx    #$12                  ; 2
    lda    $BE                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    beq    LB700                 ; 2³+1
    ldx    #<Godzilla            ; 2
LB700:
    stx    SC_03                 ; 4
    lda    LBB64,Y               ; 4
    sta    SC_09                 ; 4
    clc                          ; 2
    lda    LBB6C,Y               ; 4
    adc    #$7B                  ; 2
    sec                          ; 2
    sbc    $DD                   ; 3
    sta    SC_15                 ; 4
    lda    #0                    ; 2
    sta    SC_10                 ; 4
    sta    SC_11                 ; 4
    lda    $E1                   ; 3
    cmp    #$30                  ; 2
    bcc    LB727                 ; 2³
    lda    #$5F                  ; 2
    sbc    $E1                   ; 3
LB727:
    sta    $DE                   ; 3
    ldx    #$12                  ; 2
    lda    $BF                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    beq    LB735                 ; 2³
    ldx    #<MilkBottle          ; 2
LB735:
    stx    SC_04                 ; 4
    lda    LBB64,Y               ; 4
    sta    SC_0A                 ; 4
    clc                          ; 2
    lda    LBB6C,Y               ; 4
    adc    #$3C                  ; 2
    adc    $DE                   ; 3
    sta    SC_16                 ; 4
    ldx    #$12                  ; 2
    lda    $BF                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    beq    LB754                 ; 2³
    ldx    #<MilkBottle          ; 2
LB754:
    stx    SC_05                 ; 4
    lda    LBB64,Y               ; 4
    sta    SC_0B                 ; 4
    clc                          ; 2
    lda    LBB6C,Y               ; 4
    adc    #$4C                  ; 2
    adc    $DE                   ; 3
    sta    SC_17                 ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LB769 SUBROUTINE
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    $C6                   ; 3
    stx    $E4                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    SC_00|READ,X          ; 4
    sta    $84                   ; 3
    lda    SC_06|READ,X          ; 4
    sta    NUSIZ0                ; 3
    lda    SC_0C|READ,X          ; 4
    sta    REFP0                 ; 3
    lda    SC_12|READ,X          ; 4
    ldx    #0                    ; 2
    jsr    LBA79                 ; 6
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    $E4                   ; 3
    inx                          ; 2
    lda    SC_00|READ,X          ; 4
    sta    $86                   ; 3
    lda    SC_06|READ,X          ; 4
    sta    NUSIZ1                ; 3
    lda    SC_0C|READ,X          ; 4
    sta    REFP1                 ; 3
    lda    SC_12|READ,X          ; 4
    sta    $E4                   ; 3
    ldx    #1                    ; 2
    jsr    LBA79                 ; 6
    lda    $E4                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    cmp    #$B4                  ; 2
    bcs    LB7B8                 ; 2³
    sta    WSYNC                 ; 3
LB7B8:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    #0                    ; 2
LB7BE:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($84),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($86),Y               ; 5
    sta    GRP1                  ; 3
    cpy    $D9                   ; 3
    bne    LB7D2                 ; 2³
    lda    $CE                   ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
LB7D2:
    iny                          ; 2
    cpy    $C6                   ; 3
    bne    LB7BE                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #$FF                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LB7E8 SUBROUTINE
    clc                          ; 2
    lda    $D3                   ; 3
    adc    #3                    ; 2
    sta    $E3                   ; 3
    lda    $D6                   ; 3
    adc    #5                    ; 2
    cmp    #$2D                  ; 2
    bcc    LB82C                 ; 2³+1
    cmp    #$44                  ; 2
    bcc    LB833                 ; 2³+1
    cmp    #$67                  ; 2
    bcc    LB83A                 ; 2³+1
    cmp    #$88                  ; 2
    bcc    LB841                 ; 2³
    cmp    #$97                  ; 2
    bcc    LB848                 ; 2³
    cmp    #$A6                  ; 2
    bcs    LB848                 ; 2³
    lda    #6                    ; 2
    sta    $D7                   ; 3
    lda    $E3                   ; 3
    cmp    #$8B                  ; 2
    bcs    LB848                 ; 2³
    cmp    #$13                  ; 2
    bcc    LB848                 ; 2³
    sbc    #$13                  ; 2
    tax                          ; 2
    and    #$0F                  ; 2
    cmp    #8                    ; 2
    bcs    LB848                 ; 2³
    txa                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $D4                   ; 3
    jmp    LB94A                 ; 3

LB82C:
    cmp    #$24                  ; 2
    bcc    LB848                 ; 2³
    jmp    LB84B                 ; 3

LB833:
    cmp    #$3A                  ; 2
    bcc    LB848                 ; 2³
    jmp    LB884                 ; 3

LB83A:
    cmp    #$51                  ; 2
    bcc    LB848                 ; 2³
    jmp    LB8BF                 ; 3

LB841:
    cmp    #$74                  ; 2
    bcc    LB848                 ; 2³
    jmp    LB922                 ; 3

LB848:
    jmp    LB951                 ; 3

LB84B:
    lda    $E3                   ; 3
    cmp    #$7C                  ; 2
    bcs    LB881                 ; 2³
    cmp    #$24                  ; 2
    bcc    LB881                 ; 2³
    sbc    #$24                  ; 2
    tax                          ; 2
    and    #$0F                  ; 2
    cmp    #9                    ; 2
    bcs    LB881                 ; 2³
    tay                          ; 2
    txa                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lsr                          ; 2
    sta    $D7                   ; 3
    txa                          ; 2
    and    #$01                  ; 2
    eor    #$01                  ; 2
    beq    LB871                 ; 2³
    lda    #3                    ; 2
LB871:
    tax                          ; 2
    cpy    #6                    ; 2
    bcs    LB87C                 ; 2³
    inx                          ; 2
    cpy    #3                    ; 2
    bcs    LB87C                 ; 2³
    inx                          ; 2
LB87C:
    stx    $D4                   ; 3
    jmp    LB94A                 ; 3

LB881:
    jmp    LB951                 ; 3

LB884:
    lda    #3                    ; 2
    sta    $D7                   ; 3
    lda    $E3                   ; 3
    cmp    #$80                  ; 2
    bcs    LB8BC                 ; 2³
    cmp    #$20                  ; 2
    bcc    LB8BC                 ; 2³
    sbc    #$20                  ; 2
    tay                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LBB86,X               ; 4
    sta    $D4                   ; 3
    txa                          ; 2
    and    #$01                  ; 2
    tax                          ; 2
    tya                          ; 2
    and    #$0F                  ; 2
    cpx    #0                    ; 2
    beq    LB8B3                 ; 2³
    clc                          ; 2
    adc    $DC                   ; 3
    sec                          ; 2
    sbc    #7                    ; 2
    jmp    LB8B5                 ; 3

LB8B3:
    sbc    $DC                   ; 3
LB8B5:
    cmp    #8                    ; 2
    bcs    LB8BC                 ; 2³
    jmp    LB94A                 ; 3

LB8BC:
    jmp    LB951                 ; 3

LB8BF:
    lda    #4                    ; 2
    sta    $D7                   ; 3
    lda    $E3                   ; 3
    cmp    #$94                  ; 2
    bcs    LB91F                 ; 2³+1
    cmp    #$0C                  ; 2
    bcc    LB91F                 ; 2³+1
    sbc    #$0C                  ; 2
    sta    $E3                   ; 3
    cmp    $DD                   ; 3
    bcc    LB91F                 ; 2³+1
    ldy    #0                    ; 2
    sbc    $DD                   ; 3
    cmp    #$48                  ; 2
    bcs    LB8F0                 ; 2³
    tax                          ; 2
    and    #$1F                  ; 2
    cmp    #8                    ; 2
    bcs    LB8F0                 ; 2³
    txa                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LBB86,X               ; 4
    sta    $D4                   ; 3
    iny                          ; 2
LB8F0:
    clc                          ; 2
    lda    $E3                   ; 3
    adc    $DD                   ; 3
    cmp    #$3F                  ; 2
    bcc    LB917                 ; 2³+1
    sbc    #$3F                  ; 2
    cmp    #$48                  ; 2
    bcs    LB917                 ; 2³+1
    tax                          ; 2
    and    #$1F                  ; 2
    cmp    #8                    ; 2
    bcs    LB917                 ; 2³
    txa                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LBB87,X               ; 4
    sta    $D5                   ; 3
    tya                          ; 2
    ora    #$02                  ; 2
    jmp    LB91A                 ; 3

LB917:
    tya                          ; 2
    beq    LB91F                 ; 2³
LB91A:
    sta    $E2                   ; 3
    jmp    LB94A                 ; 3

LB91F:
    jmp    LB951                 ; 3

LB922:
    lda    #5                    ; 2
    sta    $D7                   ; 3
    lda    $E3                   ; 3
    cmp    #$0C                  ; 2
    bcc    LB951                 ; 2³
    sbc    #$0C                  ; 2
    cmp    $DE                   ; 3
    bcc    LB951                 ; 2³
    sbc    $DE                   ; 3
    cmp    #$58                  ; 2
    bcs    LB951                 ; 2³
    tax                          ; 2
    and    #$0F                  ; 2
    cmp    #8                    ; 2
    bcs    LB951                 ; 2³
    txa                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LBB86,X               ; 4
    sta    $D4                   ; 3
LB94A:
    lda    #$30                  ; 2
    eor    $C1                   ; 3
    sta    $C1                   ; 3
    rts                          ; 6

LB951:
    lda    $C1                   ; 3
    and    #$4F                  ; 2
    sta    $C1                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LB958 SUBROUTINE
    ldy    $D7                   ; 3
    cpy    #4                    ; 2
    bne    LB96D                 ; 2³
    lda    $E2                   ; 3
    and    #$01                  ; 2
    bne    LB96D                 ; 2³
LB964:
    ldx    $D5                   ; 3
    lda    #0                    ; 2
    sta    $E2                   ; 3
    jmp    LB971                 ; 3

LB96D:
    ldx    $D4                   ; 3
    lda    #0                    ; 2
LB971:
    sec                          ; 2
LB972:
    rol                          ; 2
    dex                          ; 2
    bpl    LB972                 ; 2³
    and.wy $BA,Y                 ; 4
    beq    LB9AF                 ; 2³
    eor.wy $BA,Y                 ; 4
    sta.wy $BA,Y                 ; 5
    tya                          ; 2
    ldy    $B4                   ; 3
    cmp    #6                    ; 2
    beq    LB98E                 ; 2³
    iny                          ; 2
    cmp    #3                    ; 2
    bcs    LB98E                 ; 2³
    iny                          ; 2
LB98E:
    jsr    LBA05                 ; 6
    lda    $D7                   ; 3
    cmp    #6                    ; 2
    bcc    LB99E                 ; 2³
    lda    $D4                   ; 3
    adc    #$0D                  ; 2
    jmp    LB9AD                 ; 3

LB99E:
    ldy    #$18                  ; 2
    cmp    #3                    ; 2
    bcc    LB9AC                 ; 2³
    dey                          ; 2
    lda    $C5                   ; 3
    and    #$01                  ; 2
    beq    LB9AC                 ; 2³
    dey                          ; 2
LB9AC:
    tya                          ; 2
LB9AD:
    sta    $9A                   ; 3
LB9AF:
    ldy    $D7                   ; 3
    cpy    #4                    ; 2
    bne    LB9BB                 ; 2³
    lda    $E2                   ; 3
    and    #$02                  ; 2
    bne    LB964                 ; 2³
LB9BB:
    lda    $C1                   ; 3
    and    #$4F                  ; 2
    sta    $C1                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LB9C2 SUBROUTINE
    lda    $D2                   ; 3
    sta    COLUPF                ; 3
    lda    #$FF                  ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    $B8                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    $B8                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    LBBC9,Y               ; 4
    pha                          ; 3
    ora    #$01                  ; 2
    pha                          ; 3
    pha                          ; 3
    lda    #$16                  ; 2
    ldy    $D2                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    $E3                   ; 3
LB9E7:
    sta    COLUPF                ; 3
    ldx    $E3                   ; 3
LB9EB:
    dex                          ; 2
    bpl    LB9EB                 ; 2³
    plp                          ; 4
    bmi    LB9F3                 ; 2³
    bvs    LB9F8                 ; 2³
LB9F3:
    beq    LB9F8                 ; 2³
    jmp    LB9F8                 ; 3

LB9F8:
    sty    COLUPF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    bcs    LB9E7                 ; 2³
    lda    #0                    ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LBA05 SUBROUTINE
    lda    $C2                   ; 3
    bne    LBA77                 ; 2³
    lda    LBBA9,Y               ; 4
    sta    $E3                   ; 3
    lda    LBB9D,Y               ; 4
    sta    $E4                   ; 3
    lda    #0                    ; 2
    sta    $E5                   ; 3
    sed                          ; 2
    clc                          ; 2
    ldx    #0                    ; 2
    bcc    LBA21                 ; 2³
LBA1D:
    adc    $B4,X                 ; 4
    sta    $B4,X                 ; 4
LBA21:
    lda    #0                    ; 2
    adc    $E3,X                 ; 4
    inx                          ; 2
    cpx    #3                    ; 2
    bcc    LBA1D                 ; 2³
    clc                          ; 2
    adc    $B7                   ; 3
    bcc    LBA35                 ; 2³
    lda    #$99                  ; 2
    sta    $B5                   ; 3
    sta    $B6                   ; 3
LBA35:
    sta    $B7                   ; 3
    lda    $B3                   ; 3
    beq    LBA5E                 ; 2³
    lda    $D7                   ; 3
    cmp    #6                    ; 2
    bne    LBA57                 ; 2³
    lda    #6                    ; 2
    ldy    $B4                   ; 3
    cpy    #6                    ; 2
    bcs    LBA4B                 ; 2³
    lda    #3                    ; 2
LBA4B:
    clc                          ; 2
    adc    $C4                   ; 3
    bcc    LBA52                 ; 2³
    lda    #$99                  ; 2
LBA52:
    sta    $C4                   ; 3
    jmp    LBA5E                 ; 3

LBA57:
    sec                          ; 2
    lda    $C5                   ; 3
    sbc    #1                    ; 2
    sta    $C5                   ; 3
LBA5E:
    ldx    #2                    ; 2
LBA60:
    lda    $E6,X                 ; 4
    cmp    $B5,X                 ; 4
    bcc    LBA6E                 ; 2³
    bne    LBA77                 ; 2³
    dex                          ; 2
    bpl    LBA60                 ; 2³
    jmp    LBA77                 ; 3

LBA6E:
    ldx    #2                    ; 2
LBA70:
    lda    $B5,X                 ; 4
    sta    $E6,X                 ; 4
    dex                          ; 2
    bpl    LBA70                 ; 2³
LBA77:
    cld                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LBA79 SUBROUTINE
    jmp    LBA7E                 ; 3

LBA7C SUBROUTINE
    lda    $B1,X                 ; 4
LBA7E:
    tay                          ; 2
    and    #$0F                  ; 2
    sta    $E3                   ; 3
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    clc                          ; 2
    adc    $E3                   ; 3
    cmp    #$0F                  ; 2
    bcs    LBA94                 ; 2³
    nop                          ; 2
    jmp    LBA97                 ; 3

LBA94:
    sbc    #$0F                  ; 2
    iny                          ; 2
LBA97:
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0,X                ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
LBAA1:
    dey                          ; 2
    bpl    LBAA1                 ; 2³
    sta    RESP0,X               ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


  EMPTY_SPACE 89         ; $BAA7 - $BAFF free bytes


       ORG $3B00
      RORG $BB00

LBB00:
    .byte $66 ; | XX  XX | $BB00
    .byte $36 ; |  XX XX | $BB01
    .byte $16 ; |   X XX | $BB02
    .byte $96 ; |X  X XX | $BB03
    .byte $26 ; |  X  XX | $BB04
    .byte $B6 ; |X XX XX | $BB05
    .byte $46 ; | X   XX | $BB06
    .byte $66 ; | XX  XX | $BB07
    .byte $36 ; |  XX XX | $BB08
    .byte $16 ; |   X XX | $BB09
    .byte $96 ; |X  X XX | $BB0A
    .byte $26 ; |  X  XX | $BB0B
LBB0C:
    .byte $00 ; |        | $BB0C
    .byte $02 ; |      X | $BB0D
    .byte $01 ; |       X| $BB0E
    .byte $03 ; |      XX| $BB0F
    .byte $05 ; |     X X| $BB10
    .byte $04 ; |     X  | $BB11
    .byte $00 ; |        | $BB12
    .byte $00 ; |        | $BB13
    .byte $00 ; |        | $BB14
    .byte $00 ; |        | $BB15
    .byte $00 ; |        | $BB16
    .byte $00 ; |        | $BB17
    .byte $00 ; |        | $BB18
    .byte $00 ; |        | $BB19
    .byte $00 ; |        | $BB1A
    .byte $00 ; |        | $BB1B
    .byte $00 ; |        | $BB1C
    .byte $00 ; |        | $BB1D
    .byte $00 ; |        | $BB1E
    .byte $00 ; |        | $BB1F
    .byte $00 ; |        | $BB20
    .byte $00 ; |        | $BB21
    .byte $00 ; |        | $BB22
    .byte $00 ; |        | $BB23
    .byte $00 ; |        | $BB24
    .byte $00 ; |        | $BB25
    .byte $00 ; |        | $BB26
    .byte $00 ; |        | $BB27
Duck:
    .byte $60 ; | XX     | $BB28
    .byte $60 ; | XX     | $BB29
    .byte $67 ; | XX  XXX| $BB2A
    .byte $EE ; |XXX XXX | $BB2B
    .byte $3E ; |  XXXXX | $BB2C
    .byte $3E ; |  XXXXX | $BB2D
    .byte $3F ; |  XXXXXX| $BB2E
    .byte $3E ; |  XXXXX | $BB2F
    .byte $3E ; |  XXXXX | $BB30
    .byte $1C ; |   XXX  | $BB31
Godzilla:
    .byte $0F ; |    XXXX| $BB32
    .byte $0B ; |    X XX| $BB33
    .byte $0F ; |    XXXX| $BB34
    .byte $0C ; |    XX  | $BB35
    .byte $0F ; |    XXXX| $BB36
    .byte $1C ; |   XXX  | $BB37
    .byte $1C ; |   XXX  | $BB38
    .byte $1C ; |   XXX  | $BB39
    .byte $1E ; |   XXXX | $BB3A
    .byte $3F ; |  XXXXXX| $BB3B
    .byte $3D ; |  XXXX X| $BB3C
    .byte $3C ; |  XXXX  | $BB3D
    .byte $3C ; |  XXXX  | $BB3E
    .byte $3E ; |  XXXXX | $BB3F
    .byte $7F ; | XXXXXXX| $BB40
    .byte $7F ; | XXXXXXX| $BB41
    .byte $7F ; | XXXXXXX| $BB42
    .byte $7E ; | XXXXXX | $BB43
    .byte $EE ; |XXX XXX | $BB44
    .byte $DE ; |XX XXXX | $BB45
    .byte $D7 ; |XX X XXX| $BB46
    .byte $BF ; |X XXXXXX| $BB47
MilkBottle:
    .byte $3C ; |  XXXX  | $BB48
    .byte $18 ; |   XX   | $BB49
    .byte $18 ; |   XX   | $BB4A
    .byte $18 ; |   XX   | $BB4B
    .byte $18 ; |   XX   | $BB4C
    .byte $3C ; |  XXXX  | $BB4D
    .byte $7E ; | XXXXXX | $BB4E
    .byte $7E ; | XXXXXX | $BB4F
    .byte $7E ; | XXXXXX | $BB50
    .byte $7E ; | XXXXXX | $BB51
    .byte $7E ; | XXXXXX | $BB52
    .byte $7E ; | XXXXXX | $BB53
    .byte $7E ; | XXXXXX | $BB54
    .byte $7E ; | XXXXXX | $BB55
    .byte $7E ; | XXXXXX | $BB56
    .byte $7E ; | XXXXXX | $BB57
    .byte $7E ; | XXXXXX | $BB58
    .byte $7E ; | XXXXXX | $BB59
    .byte $7E ; | XXXXXX | $BB5A
    .byte $3C ; |  XXXX  | $BB5B
LBB5C:
    .byte $00 ; |        | $BB5C   sticks? from top of 2nd demo screen, above the ducks
    .byte $01 ; |       X| $BB5D
    .byte $08 ; |    X   | $BB5E
    .byte $09 ; |    X  X| $BB5F
    .byte $40 ; | X      | $BB60
    .byte $41 ; | X     X| $BB61
    .byte $48 ; | X  X   | $BB62
    .byte $49 ; | X  X  X| $BB63
LBB64:
    .byte $00 ; |        | $BB64
    .byte $00 ; |        | $BB65
    .byte $00 ; |        | $BB66
    .byte $02 ; |      X | $BB67
    .byte $00 ; |        | $BB68
    .byte $04 ; |     X  | $BB69
    .byte $02 ; |      X | $BB6A
    .byte $06 ; |     XX | $BB6B
LBB6C:
    .byte $00 ; |        | $BB6C
    .byte $40 ; | X      | $BB6D
    .byte $20 ; |  X     | $BB6E
    .byte $20 ; |  X     | $BB6F
    .byte $00 ; |        | $BB70
    .byte $00 ; |        | $BB71
    .byte $00 ; |        | $BB72
LBB73:
    .byte $00 ; |        | $BB73
    .byte $01 ; |       X| $BB74
    .byte $03 ; |      XX| $BB75
    .byte $06 ; |     XX | $BB76
    .byte $0A ; |    X X | $BB77
    .byte $0B ; |    X XX| $BB78
    .byte $0A ; |    X X | $BB79
    .byte $06 ; |     XX | $BB7A
    .byte $03 ; |      XX| $BB7B
LBB7C:
    .byte $01 ; |       X| $BB7C
    .byte $15 ; |   X X X| $BB7D
    .byte $13 ; |   X  XX| $BB7E
    .byte $10 ; |   X    | $BB7F
    .byte $0C ; |    XX  | $BB80
    .byte $0B ; |    X XX| $BB81
    .byte $0C ; |    XX  | $BB82
    .byte $10 ; |   X    | $BB83
    .byte $13 ; |   X  XX| $BB84
    .byte $15 ; |   X X X| $BB85
LBB86:
    .byte $05 ; |     X X| $BB86
LBB87:
    .byte $02 ; |      X | $BB87
    .byte $04 ; |     X  | $BB88
    .byte $01 ; |       X| $BB89
    .byte $03 ; |      XX| $BB8A
    .byte $00 ; |        | $BB8B
LBB8C:
    .byte $34 ; |  XX X  | $BB8C
    .byte $44 ; | X   X  | $BB8D
    .byte $54 ; | X X X  | $BB8E
    .byte $64 ; | XX  X  | $BB8F
    .byte $84 ; |X    X  | $BB90
    .byte $A4 ; |X X  X  | $BB91
    .byte $C4 ; |XX   X  | $BB92
LBB93:
    .byte $F4 ; |XXXX X  | $BB93
    .byte $08 ; |    X   | $BB94
    .byte $06 ; |     XX | $BB95
    .byte $04 ; |     X  | $BB96
    .byte $02 ; |      X | $BB97
    .byte $01 ; |       X| $BB98
    .byte $01 ; |       X| $BB99
    .byte $01 ; |       X| $BB9A
    .byte $01 ; |       X| $BB9B
    .byte $01 ; |       X| $BB9C
LBB9D:
    .byte $00 ; |        | $BB9D
    .byte $00 ; |        | $BB9E
    .byte $00 ; |        | $BB9F
    .byte $00 ; |        | $BBA0
    .byte $00 ; |        | $BBA1
    .byte $01 ; |       X| $BBA2
    .byte $01 ; |       X| $BBA3
    .byte $02 ; |      X | $BBA4
    .byte $05 ; |     X X| $BBA5
    .byte $07 ; |     XXX| $BBA6
    .byte $10 ; |   X    | $BBA7
    .byte $15 ; |   X X X| $BBA8
LBBA9:
    .byte $10 ; |   X    | $BBA9
    .byte $10 ; |   X    | $BBAA
    .byte $25 ; |  X  X X| $BBAB
    .byte $50 ; | X X    | $BBAC
    .byte $75 ; | XXX X X| $BBAD
    .byte $00 ; |        | $BBAE
    .byte $50 ; | X X    | $BBAF
    .byte $50 ; | X X    | $BBB0
    .byte $00 ; |        | $BBB1
    .byte $50 ; | X X    | $BBB2
    .byte $00 ; |        | $BBB3
    .byte $00 ; |        | $BBB4
LBBB5:
    .byte $40 ; | X      | $BBB5
    .byte $10 ; |   X    | $BBB6
    .byte $05 ; |     X X| $BBB7
    .byte $02 ; |      X | $BBB8
    .byte $01 ; |       X| $BBB9
    .byte $00 ; |        | $BBBA
    .byte $00 ; |        | $BBBB
    .byte $00 ; |        | $BBBC
    .byte $00 ; |        | $BBBD
    .byte $00 ; |        | $BBBE
LBBBF:
    .byte $36 ; |  XX XX | $BBBF
    .byte $36 ; |  XX XX | $BBC0
    .byte $36 ; |  XX XX | $BBC1
    .byte $36 ; |  XX XX | $BBC2
    .byte $36 ; |  XX XX | $BBC3
    .byte $36 ; |  XX XX | $BBC4
    .byte $36 ; |  XX XX | $BBC5
    .byte $36 ; |  XX XX | $BBC6
    .byte $36 ; |  XX XX | $BBC7
    .byte $36 ; |  XX XX | $BBC8
LBBC9:
    .byte $44 ; | X   X  | $BBC9
    .byte $86 ; |X    XX | $BBCA
    .byte $06 ; |     XX | $BBCB
    .byte $84 ; |X    X  | $BBCC
    .byte $04 ; |     X  | $BBCD
    .byte $00 ; |        | $BBCE
    .byte $00 ; |        | $BBCF
    .byte $00 ; |        | $BBD0
    .byte $00 ; |        | $BBD1
    .byte $00 ; |        | $BBD2
    .byte $00 ; |        | $BBD3
    .byte $00 ; |        | $BBD4
    .byte $00 ; |        | $BBD5
    .byte $00 ; |        | $BBD6
    .byte $00 ; |        | $BBD7
    .byte $00 ; |        | $BBD8
    .byte $00 ; |        | $BBD9
    .byte $00 ; |        | $BBDA
    .byte $00 ; |        | $BBDB
    .byte $00 ; |        | $BBDC
    .byte $00 ; |        | $BBDD
    .byte $00 ; |        | $BBDE
    .byte $00 ; |        | $BBDF
    .byte $00 ; |        | $BBE0
    .byte $00 ; |        | $BBE1
    .byte $00 ; |        | $BBE2
    .byte $00 ; |        | $BBE3
    .byte $00 ; |        | $BBE4
    .byte $00 ; |        | $BBE5
    .byte $00 ; |        | $BBE6
    .byte $00 ; |        | $BBE7
    .byte $00 ; |        | $BBE8
    .byte $00 ; |        | $BBE9
    .byte $00 ; |        | $BBEA
    .byte $00 ; |        | $BBEB
    .byte $00 ; |        | $BBEC
    .byte $00 ; |        | $BBED
    .byte $00 ; |        | $BBEE
    .byte $00 ; |        | $BBEF
    .byte $00 ; |        | $BBF0
    .byte $00 ; |        | $BBF1
    .byte $00 ; |        | $BBF2
    .byte $00 ; |        | $BBF3
    .byte $00 ; |        | $BBF4
    .byte $00 ; |        | $BBF5
    .byte $00 ; |        | $BBF6
    .byte $00 ; |        | $BBF7
    .byte $00 ; |        | $BBF8
    .byte $00 ; |        | $BBF9
    .byte $00 ; |        | $BBFA
    .byte $00 ; |        | $BBFB
    .byte $00 ; |        | $BBFC
    .byte $00 ; |        | $BBFD
    .byte $00 ; |        | $BBFE
    .byte $00 ; |        | $BBFF


  FILLED_SPACE 768       ; $BC00 - $BEFF   free bytes
  EMPTY_SPACE 216        ; $BF00 - $BFD7   free bytes


       ORG $3FD8
      RORG $BFD8

START_BANK_1:
    lda    BANK_0                ; 4
    jmp    $9100                 ; 3

    lda    BANK_3                ; 4
    jmp.ind ($0080)              ; 5

    lda    BANK_2                ; 4
    jmp.ind ($0080)              ; 5

    lda    BANK_1                ; 4
    jmp.ind ($0080)              ; 5

LBFF0 SUBROUTINE
    lda    BANK_0                ; 4
    jmp.ind ($0080)              ; 5

    .byte $00 ; |        | $BFF6
    .byte $00 ; |        | $BFF7
    .byte $00 ; |        | $BFF8
    .byte $00 ; |        | $BFF9

       ORG $3FFA
      RORG $BFFA

    .word START_BANK_1
    .word START_BANK_1
    .word START_BANK_1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 2
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


       ORG $4000
      RORG $D000

    FILLED_SPACE 256                ; $D000 - $D0FF super chip ram

LD100:  ; indirect jump, coming from bank 0
    lda    #$76                  ; 2
    sta    $D2                   ; 3
    lda    #5                    ; 2
    sta    CTRLPF                ; 3
    sed                          ; 2
    clc                          ; 2
    ldy    $B4                   ; 3
    lda    LDA76,Y               ; 4
    adc    $C4                   ; 3
    bcc    LD115                 ; 2³
    lda    #$99                  ; 2
LD115:
    sta    $C4                   ; 3
    cld                          ; 2
    lda    #$FF                  ; 2
    sta    $BA                   ; 3
    sta    $BB                   ; 3
    sta    $BC                   ; 3
    lda    #0                    ; 2
    sta    $BD                   ; 3
    sta    $DB                   ; 3
    sta    $DC                   ; 3
    sta    $DD                   ; 3
    lda    #1                    ; 2
    sta    $DE                   ; 3
    lda    #0                    ; 2
    sta    $D1                   ; 3
    lda    #$0E                  ; 2
    sta    $D0                   ; 3
    lda    #5                    ; 2
    sta    $C7                   ; 3
    lda    #$0F                  ; 2
    sta    $DF                   ; 3
    lda    #3                    ; 2
    sta    $E0                   ; 3
LD142:
    lda    #<L918A               ; 2
    sta    $80                   ; 3
    lda    #>L918A               ; 2
    sta    $81                   ; 3
    jsr    LDFF0                 ; 6   bankswitch, goto L918A
    tya                          ; 2
    beq    LD153                 ; 2³
    jmp    LD2D1                 ; 3

LD153:
    lda    $92                   ; 3
    bne    LD15A                 ; 2³
    jsr    LD323                 ; 6
LD15A:
    lda    INTIM                 ; 4
    bne    LD15A                 ; 2³
    lda    #$E4                  ; 2
    sta    TIM64T                ; 4
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    lda    #<L934E               ; 2
    sta    $80                   ; 3
    lda    #>L934E               ; 2
    sta    $81                   ; 3
    jsr    LDFF0                 ; 6   bankswitch, goto L934E
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $D2                   ; 3
    sta    COLUBK                ; 3
    lda    #$20                  ; 2
    sta    COLUPF                ; 3
    lda    #$FF                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    #$DB                  ; 2
    sta    $85                   ; 3
    sta    $89                   ; 3
    sta    $8D                   ; 3
    sta    $87                   ; 3
    sta    $8B                   ; 3
    sta    $8F                   ; 3
    ldy    $DD                   ; 3
    lda    LDA4A,Y               ; 4
    sta    COLUBK                ; 3
    ldx    #5                    ; 2
LD1A0:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LD1A0                 ; 2³
    lda    #$B0                  ; 2
    sta    PF0                   ; 3
    ldx    #4                    ; 2
LD1AB:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LD1AB                 ; 2³
    lda    #$55                  ; 2
    sta    PF1                   ; 3
    lda    #$AA                  ; 2
    sta    PF2                   ; 3
    ldx    #0                    ; 2
    jsr    LD427                 ; 6
    ldx    #2                    ; 2
LD1BF:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LD1BF                 ; 2³
    lda    #$F0                  ; 2
    sta    PF0                   ; 3
    lda    #0                    ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    NUSIZ1                ; 3
    lda    $8E                   ; 3
    sta    $E2                   ; 3
    lda    $CD                   ; 3
    sta    $8E                   ; 3
    lda    $BA                   ; 3
    and    #$80                  ; 2
    bne    LD1E0                 ; 2³
    sta    $8E                   ; 3
LD1E0:
    lda    $DC                   ; 3
    asl                          ; 2
    adc    #$2D                  ; 2
    ldx    #1                    ; 2
    jsr    LD960                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #0                    ; 2
    jsr    LD963                 ; 6
    lda    $DC                   ; 3
    eor    #$0F                  ; 2
    clc                          ; 2
    adc    #9                    ; 2
    tay                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$70                  ; 2
    sta    PF0                   ; 3
    ldx    #5                    ; 2
LD203:
    lda    ($8E),Y               ; 5
    sta    GRP1                  ; 3
    iny                          ; 2
    dex                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    bne    LD203                 ; 2³
    stx    HMP0                  ; 3
    ldx    $DC                   ; 3
LD211:
    lda    ($8E),Y               ; 5
    sta    GRP1                  ; 3
    iny                          ; 2
    dex                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    bpl    LD211                 ; 2³
    lda    #0                    ; 2
    sta    GRP1                  ; 3
    lda    $E2                   ; 3
    sta    $8E                   ; 3
    ldx    #1                    ; 2
    jsr    LD963                 ; 6
    lda    #6                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    jsr    LD470                 ; 6
    ldx    #1                    ; 2
    jsr    LD427                 ; 6
    lda    $BD                   ; 3
    and    #$02                  ; 2
    beq    LD241                 ; 2³
    lda    $C8                   ; 3
    sec                          ; 2
    sbc    $DC                   ; 3
LD241:
    sta    $E2                   ; 3
    ldx    #1                    ; 2
    jsr    LD963                 ; 6
    ldx    #0                    ; 2
    jsr    LD963                 ; 6
    jsr    LD470                 ; 6
    ldx    #2                    ; 2
    jsr    LD427                 ; 6
    ldx    #1                    ; 2
    jsr    LD963                 ; 6
    ldx    #0                    ; 2
    jsr    LD963                 ; 6
    jsr    LD470                 ; 6
    lda    #0                    ; 2
    sta    NUSIZ0                ; 3
    lda    $E2                   ; 3
    sta    $84                   ; 3
    lda    $DC                   ; 3
    cmp    #8                    ; 2
    bcc    LD272                 ; 2³
    lda    #7                    ; 2
LD272:
    asl                          ; 2
    adc    #$AD                  ; 2
    ldx    #0                    ; 2
    jsr    LD960                 ; 6
    lda    $DC                   ; 3
    eor    #$0F                  ; 2
    tax                          ; 2
    ldy    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
LD285:
    lda    ($84),Y               ; 5
    sta    GRP0                  ; 3
    iny                          ; 2
    dex                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    bpl    LD285                 ; 2³
    lda    #$F0                  ; 2
    sta    PF0                   ; 3
    ldx    #4                    ; 2
LD295:
    lda    ($84),Y               ; 5
    sta    GRP0                  ; 3
    iny                          ; 2
    dex                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    bne    LD295                 ; 2³
    stx    GRP0                  ; 3
    lda    #$B0                  ; 2
    sta    PF0                   ; 3
    lda    #$FF                  ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    ldx    #6                    ; 2
LD2AD:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LD2AD                 ; 2³
    ldx    #0                    ; 2
    lda    #$20                  ; 2
    sta    $D2                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    PF0                   ; 3
    sta    COLUBK                ; 3
    jsr    LD98E                 ; 6
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$76                  ; 2
    sta    COLUBK                ; 3
    sta    $D2                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    COLUBK                ; 3
LD2D1:
    sta    WSYNC                 ; 3
;---------------------------------------
LD2D3:
    lda    INTIM                 ; 4
    bne    LD2D3                 ; 2³
    lda    #$23                  ; 2
    sta    TIM64T                ; 4
    lda    #2                    ; 2
    sta    VBLANK                ; 3
    lda    #<L9398               ; 2
    sta    $80                   ; 3
    lda    #>L9398               ; 2
    sta    $81                   ; 3
    jsr    LDFF0                 ; 6   bankswitch, goto L9398
    lda    $92                   ; 3
    bne    LD31B                 ; 2³+1
    lda    $BA                   ; 3
    ora    $BB                   ; 3
    ora    $BC                   ; 3
    bne    LD306                 ; 2³+1
    lda    $DC                   ; 3
    cmp    #5                    ; 2
    bcc    LD306                 ; 2³+1
    lda    #5                    ; 2
    sta    $DC                   ; 3
    lda    #0                    ; 2
    sta    $DB                   ; 3
LD306:
    lda    $C1                   ; 3
    and    #$20                  ; 2
    beq    LD312                 ; 2³
    jsr    LD4A4                 ; 6
    jmp    LD31B                 ; 3

LD312:
    lda    $C1                   ; 3
    and    #$10                  ; 2
    beq    LD31B                 ; 2³
    jsr    LD569                 ; 6
LD31B:
    lda    INTIM                 ; 4
    bne    LD31B                 ; 2³
    jmp    LD142                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD323 SUBROUTINE
    dec    $DE                   ; 5
    bne    LD337                 ; 2³
    ldy    $DD                   ; 3
    iny                          ; 2
    cpy    #$0E                  ; 2
    bne    LD330                 ; 2³
    ldy    #0                    ; 2
LD330:
    sty    $DD                   ; 3
    lda    LDA58,Y               ; 4
    sta    $DE                   ; 3
LD337:
    dec    $DB                   ; 5
    bpl    LD393                 ; 2³
    ldy    $B4                   ; 3
    lda    LDA36,Y               ; 4
    sta    $DB                   ; 3
    lda    $DF                   ; 3
    clc                          ; 2
    adc    #1                    ; 2
    and    #$0F                  ; 2
    sta    $DF                   ; 3
    lda    $E0                   ; 3
    adc    #1                    ; 2
    and    #$0F                  ; 2
    sta    $E0                   ; 3
    dec    $DC                   ; 5
    bpl    LD393                 ; 2³
    lda    #$0F                  ; 2
    sta    $DC                   ; 3
    ldx    $D0                   ; 3
    ldy    $D1                   ; 3
    stx    $D1                   ; 3
    sty    $D0                   ; 3
    ldx    $DF                   ; 3
    ldy    $E0                   ; 3
    stx    $E0                   ; 3
    sty    $DF                   ; 3
    lda    #4                    ; 2
    bit    $BA                   ; 3
    bmi    LD379                 ; 2³
    lda    $C7                   ; 3
    beq    LD379                 ; 2³
    dec    $C7                   ; 5
    lda    #4                    ; 2
LD379:
    ora    $BD                   ; 3
    lsr                          ; 2
    sta    $BD                   ; 3
    and    #$01                  ; 2
    ora    $BC                   ; 3
    asl                          ; 2
    sta    $BC                   ; 3
    and    #$80                  ; 2
    ora    $BB                   ; 3
    lsr                          ; 2
    sta    $BB                   ; 3
    and    #$01                  ; 2
    ora    $BA                   ; 3
    asl                          ; 2
    sta    $BA                   ; 3
LD393:
    lda    #0                    ; 2
    sta    $E4                   ; 3
    lda    $DC                   ; 3
    eor    #$0F                  ; 2
    asl                          ; 2
    sta    $E3                   ; 3
    cmp    #$10                  ; 2
    bcc    LD3AA                 ; 2³
    sbc    #$10                  ; 2
    sta    $E4                   ; 3
    lda    #$10                  ; 2
    sta    $E3                   ; 3
LD3AA:
    ldx    $DF                   ; 3
    lda    LDA25,X               ; 4
    sta    $C8                   ; 3
    lda    LDA26,X               ; 4
    sec                          ; 2
    sbc    $E4                   ; 3
    sta    $CA                   ; 3
    lda    LDA27,X               ; 4
    sec                          ; 2
    sbc    $E4                   ; 3
    sta    $CC                   ; 3
    ldx    $E0                   ; 3
    lda    LDA25,X               ; 4
    sec                          ; 2
    sbc    $E3                   ; 3
    sta    $C9                   ; 3
    lda    LDA26,X               ; 4
    sec                          ; 2
    sbc    $E3                   ; 3
    sta    $CB                   ; 3
    lda    LDA27,X               ; 4
    sec                          ; 2
    sbc    #$10                  ; 2
    sta    $CD                   ; 3
    lda    $BA                   ; 3
    sta    $E3                   ; 3
    ldx    #0                    ; 2
LD3E1:
    asl    $E3                   ; 5
    bmi    LD3EA                 ; 2³
    lda    #0                    ; 2
    jmp    LD3EC                 ; 3

LD3EA:
    lda    $C8,X                 ; 4
LD3EC:
    sta    SC_00,X               ; 5
    inx                          ; 2
    cpx    #6                    ; 2
    bne    LD3E1                 ; 2³
    lda    $BB                   ; 3
    sta    $E3                   ; 3
    ldy    #5                    ; 2
LD3FA:
    asl    $E3                   ; 5
    bmi    LD403                 ; 2³+1
    lda    #0                    ; 2
    jmp    LD406                 ; 3

LD403:
    lda.wy $C8,Y                 ; 4
LD406:
    sta    SC_00,X               ; 5
    inx                          ; 2
    dey                          ; 2
    bpl    LD3FA                 ; 2³+1
    lda    $BC                   ; 3
    sta    $E3                   ; 3
    ldx    #0                    ; 2
LD413:
    asl    $E3                   ; 5
    bmi    LD41C                 ; 2³
    lda    #0                    ; 2
    jmp    LD41E                 ; 3

LD41C:
    lda    $C8,X                 ; 4
LD41E:
    sta    SC_0C,X               ; 5
    inx                          ; 2
    cpx    #6                    ; 2
    bne    LD413                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD427 SUBROUTINE
    lda    $DC                   ; 3
    cpx    #1                    ; 2
    beq    LD43A                 ; 2³
    ldy    $D0                   ; 3
    sty    COLUP1                ; 3
    ldy    $D1                   ; 3
    sty    COLUP0                ; 3
    ldy    #0                    ; 2
    jmp    LD446                 ; 3

LD43A:
    eor    #$0F                  ; 2
    ldy    $D0                   ; 3
    sty    COLUP0                ; 3
    ldy    $D1                   ; 3
    sty    COLUP1                ; 3
    ldy    #8                    ; 2
LD446:
    sty    REFP0                 ; 3
    sty    REFP1                 ; 3
    clc                          ; 2
    adc    #$4C                  ; 2
    sta    $B1                   ; 3
    adc    #$10                  ; 2
    sta    $B2                   ; 3
    lda    #$11                  ; 2
    cpx    #1                    ; 2
    bcc    LD45E                 ; 2³
    beq    LD460                 ; 2³
    jmp    LD462                 ; 3

LD45E:
    lda    #$0C                  ; 2
LD460:
    sbc    #6                    ; 2
LD462:
    tay                          ; 2
    ldx    #$0A                  ; 2
LD465:
    lda    SC_00|READ,Y          ; 4
    sta    $84,X                 ; 4
    dey                          ; 2
    dex                          ; 2
    dex                          ; 2
    bpl    LD465                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD470 SUBROUTINE
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    #0                    ; 2
LD476:
    lda    ($84),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta    GRP0                  ; 3
    lda    ($86),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($8E),Y               ; 5
    sta    $E3                   ; 3
    lda    ($8C),Y               ; 5
    tax                          ; 2
    lda    ($88),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($8A),Y               ; 5
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    lda    $E3                   ; 3
    sta    GRP1                  ; 3
    iny                          ; 2
    cpy    #$1E                  ; 2
    bne    LD476                 ; 2³
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD4A4 SUBROUTINE
    lda    $D6                   ; 3
    sec                          ; 2
    sbc    #8                    ; 2
    cmp    #$9E                  ; 2
    bcs    LD4DD                 ; 2³
    cmp    #$13                  ; 2
    bcc    LD4DD                 ; 2³
    sbc    $DC                   ; 3
    cmp    #$87                  ; 2
    bcs    LD4E0                 ; 2³
    cmp    #$1C                  ; 2
    bcs    LD502                 ; 2³+1
    cmp    #$19                  ; 2
    bcs    LD4DD                 ; 2³
    lda    $DC                   ; 3
    cmp    #6                    ; 2
    bcc    LD4DD                 ; 2³
    asl                          ; 2
    adc    #1                    ; 2
    cmp    $D3                   ; 3
    bcc    LD4DD                 ; 2³
    sbc    #8                    ; 2
    cmp    $D3                   ; 3
    bcs    LD4DD                 ; 2³
    ldx    #7                    ; 2
    stx    $D4                   ; 3
    ldy    #0                    ; 2
    sty    $D7                   ; 3
    jmp    LD557                 ; 3

LD4DD:
    jmp    LD562                 ; 3

LD4E0:
    cmp    #$8A                  ; 2
    bcc    LD562                 ; 2³+1
    lda    $DC                   ; 3
    cmp    #5                    ; 2
    bcs    LD562                 ; 2³+1
    asl                          ; 2
    adc    #$81                  ; 2
    cmp    $D3                   ; 3
    bcc    LD562                 ; 2³+1
    sbc    #8                    ; 2
    cmp    $D3                   ; 3
    bcs    LD562                 ; 2³+1
    ldx    #1                    ; 2
    stx    $D4                   ; 3
    ldy    #3                    ; 2
    sty    $D7                   ; 3
    jmp    LD557                 ; 3

LD502:
    sbc    #$1C                  ; 2
    ldy    #0                    ; 2
LD506:
    cmp    #$25                  ; 2
    bcc    LD510                 ; 2³
    iny                          ; 2
    sbc    #$25                  ; 2
    jmp    LD506                 ; 3

LD510:
    cmp    #$1F                  ; 2
    bcs    LD562                 ; 2³
    sta    $E3                   ; 3
    lda    $D3                   ; 3
    adc    #3                    ; 2
    cpy    #1                    ; 2
    beq    LD524                 ; 2³
    sec                          ; 2
    sbc    $DC                   ; 3
    jmp    LD528                 ; 3

LD524:
    sbc    #$10                  ; 2
    adc    $DC                   ; 3
LD528:
    cmp    #$7C                  ; 2
    bcs    LD562                 ; 2³
    cmp    #$1C                  ; 2
    bcc    LD562                 ; 2³
    sbc    #$0C                  ; 2
    tax                          ; 2
    and    #$0F                  ; 2
    cmp    #8                    ; 2
    bcs    LD562                 ; 2³
    txa                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    eor    #$07                  ; 2
    tax                          ; 2
    sty    $D7                   ; 3
    stx    $D4                   ; 3
    cpy    #1                    ; 2
    beq    LD54B                 ; 2³
    eor    #$07                  ; 2
LD54B:
    tax                          ; 2
    lda    $C7,X                 ; 4
    clc                          ; 2
    adc    $E3                   ; 3
    tay                          ; 2
    lda    LDB00,Y               ; 4
    beq    LD562                 ; 2³
LD557:
    ldx    $D4                   ; 3
    ldy    $D7                   ; 3
    lda    #$30                  ; 2
    eor    $C1                   ; 3
    sta    $C1                   ; 3
    rts                          ; 6

LD562:
    lda    $C1                   ; 3
    and    #$4F                  ; 2
    sta    $C1                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD569 SUBROUTINE
    ldx    $D4                   ; 3
    ldy    $D7                   ; 3
    sec                          ; 2
    lda    #0                    ; 2
LD570:
    rol                          ; 2
    dex                          ; 2
    bpl    LD570                 ; 2³
    and.wy $BA,Y                 ; 4
    beq    LD588                 ; 2³
    eor.wy $BA,Y                 ; 4
    sta.wy $BA,Y                 ; 5
    lda    #$19                  ; 2
    sta    $9A                   ; 3
    ldy    $B4                   ; 3
    jsr    LD9D1                 ; 6
LD588:
    lda    $C1                   ; 3
    and    #$4F                  ; 2
    sta    $C1                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD58F:  ; indirect jump, coming from bank 0
    lda    #$76                  ; 2
    sta    $D2                   ; 3
    lda    #5                    ; 2
    sta    CTRLPF                ; 3
    sed                          ; 2
    clc                          ; 2
    ldy    $B4                   ; 3
    lda    LDA7D,Y               ; 4
    adc    $C4                   ; 3
    bcc    LD5A4                 ; 2³
    lda    #$99                  ; 2
LD5A4:
    sta    $C4                   ; 3
    cld                          ; 2
    lda    #0                    ; 2
    sta    $E2                   ; 3
    sta    $DB                   ; 3
    sta    $D7                   ; 3
LD5AF:
    lda    #<L918A               ; 2
    sta    $80                   ; 3
    lda    #>L918A               ; 2
    sta    $81                   ; 3
    jsr    LDFF0                 ; 6   bankswitch, goto L918A
    tya                          ; 2
    beq    LD5C0                 ; 2³
    jmp    LD70E                 ; 3

LD5C0:
    lda    $92                   ; 3
    bne    LD5C7                 ; 2³
    jsr    LD792                 ; 6
LD5C7:
    lda    INTIM                 ; 4
    bne    LD5C7                 ; 2³
    lda    #$E4                  ; 2
    sta    TIM64T                ; 4
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    lda    #<L934E               ; 2
    sta    $80                   ; 3
    lda    #>L934E               ; 2
    sta    $81                   ; 3
    jsr    LDFF0                 ; 6   bankswitch, goto L934E
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $D2                   ; 3
    sta    COLUBK                ; 3
    lda    #$20                  ; 2
    sta    COLUPF                ; 3
    lda    #$FF                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    ldx    #0                    ; 2
    jsr    LD963                 ; 6
    lda    $B1                   ; 3
    cmp    #$A5                  ; 2
    bcs    LD603                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
LD603:
    ldx    #1                    ; 2
    jsr    LD963                 ; 6
    lda    $B2                   ; 3
    cmp    #$A5                  ; 2
    bcs    LD610                 ; 2³
    sta    WSYNC                 ; 3
LD610:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$B0                  ; 2
    sta    PF0                   ; 3
    lda    $C8                   ; 3
    sta    COLUP1                ; 3
    ldy    #$1A                  ; 2
    cmp    #0                    ; 2
    beq    LD624                 ; 2³
    ldy    #0                    ; 2
LD624:
    sty    COLUP0                ; 3
    lda    $C9                   ; 3
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    lda    #$DB                  ; 2
    sta    $85                   ; 3
    sta    $89                   ; 3
    sta    $8D                   ; 3
    sta    $87                   ; 3
    sta    $8B                   ; 3
    sta    $8F                   ; 3
    lda    $BA                   ; 3
    sta    $84                   ; 3
    lda    $BB                   ; 3
    sta    $88                   ; 3
    lda    $BC                   ; 3
    sta    $8C                   ; 3
    lda    $BD                   ; 3
    sta    $86                   ; 3
    lda    $BE                   ; 3
    sta    $8A                   ; 3
    lda    $BF                   ; 3
    sta    $8E                   ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #0                    ; 2
    lda    ($84),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($86),Y               ; 5
    sta    GRP1                  ; 3
    lda    #$55                  ; 2
    sta    PF1                   ; 3
    lda    #$AA                  ; 2
    sta    PF2                   ; 3
    iny                          ; 2
    lda    ($84),Y               ; 5
    ldx    #$18                  ; 2
LD66F:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ($86),Y               ; 5
    sta    GRP1                  ; 3
    cpx    #$1B                  ; 2
    bne    LD685                 ; 2³
    lda    #$F0                  ; 2
    sta    PF0                   ; 3
    lda    #0                    ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
LD685:
    iny                          ; 2
    lda    ($84),Y               ; 5
    inx                          ; 2
    cpx    #$20                  ; 2
    bne    LD66F                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    ($86),Y               ; 5
    sta    GRP1                  ; 3
    lda    #$70                  ; 2
    sta    PF0                   ; 3
    inx                          ; 2
    ldy    #0                    ; 2
LD69C:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($88),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($8A),Y               ; 5
    sta    GRP1                  ; 3
    cpx    $D9                   ; 3
    bcc    LD6AF                 ; 2³
    cpx    $DA                   ; 3
    bcs    LD6AF                 ; 2³
    iny                          ; 2
LD6AF:
    inx                          ; 2
    cpx    #$A7                  ; 2
    bne    LD69C                 ; 2³
    ldy    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($8C),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($8E),Y               ; 5
    sta    GRP1                  ; 3
    lda    #$F0                  ; 2
    sta    PF0                   ; 3
    inx                          ; 2
    iny                          ; 2
LD6C6:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($8C),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($8E),Y               ; 5
    sta    GRP1                  ; 3
    iny                          ; 2
    inx                          ; 2
    cpx    #$AC                  ; 2
    bne    LD6C6                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #$B0                  ; 2
    sta    PF0                   ; 3
    lda    #$FF                  ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    ldx    #6                    ; 2
LD6EA:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LD6EA                 ; 2³
    ldx    #0                    ; 2
    lda    #$20                  ; 2
    sta    $D2                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    PF0                   ; 3
    sta    COLUBK                ; 3
    jsr    LD98E                 ; 6
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$76                  ; 2
    sta    COLUBK                ; 3
    sta    $D2                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    COLUBK                ; 3
LD70E:
    sta    WSYNC                 ; 3
;---------------------------------------
LD710:
    lda    INTIM                 ; 4
    bne    LD710                 ; 2³
    lda    #$23                  ; 2
    sta    TIM64T                ; 4
    lda    #2                    ; 2
    sta    VBLANK                ; 3
    lda    #<L9398               ; 2
    sta    $80                   ; 3
    lda    #>L9398               ; 2
    sta    $81                   ; 3
    jsr    LDFF0                 ; 6   bankswitch, goto L9398
    lda    $92                   ; 3
    bne    LD752                 ; 2³
    lda    $C1                   ; 3
    and    #$20                  ; 2
    beq    LD736                 ; 2³
    jsr    LD888                 ; 6
LD736:
    lda    $C1                   ; 3
    and    #$10                  ; 2
    beq    LD73F                 ; 2³
    jsr    LD8B6                 ; 6
LD73F:
    ldy    $C3                   ; 3
    beq    LD752                 ; 2³
    dec    $C3                   ; 5
    beq    LD74E                 ; 2³
    lda    #1                    ; 2
    sta    $DB                   ; 3
    jmp    LD752                 ; 3

LD74E:
    lda    #0                    ; 2
    sta    $D7                   ; 3
LD752:
    lda    INTIM                 ; 4
    bne    LD752                 ; 2³
    jmp    LD5AF                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD75A SUBROUTINE
    lda    #0                    ; 2
    sta    $DF                   ; 3
    sta    $C3                   ; 3
    lda    $98                   ; 3
    lsr                          ; 2
    sta    $E3                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    #4                    ; 2
    adc    $E3                   ; 3
    sta    $D4                   ; 3
    lda    $98                   ; 3
    and    #$01                  ; 2
    bne    LD777                 ; 2³
    lda    #$FF                  ; 2
LD777:
    sta    $E0                   ; 3
    lda    #$AD                  ; 2
    sta    $D7                   ; 3
    lda    #$FF                  ; 2
    sta    $E1                   ; 3
    ldy    $E2                   ; 3
    lda    LDA40,Y               ; 4
    sta    $C8                   ; 3
    iny                          ; 2
    cpy    #$0A                  ; 2
    bcc    LD78F                 ; 2³
    ldy    #0                    ; 2
LD78F:
    sty    $E2                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD792 SUBROUTINE
    dec    $DB                   ; 5
    bpl    LD7A2                 ; 2³
    lda    #3                    ; 2
    sta    $DB                   ; 3
    inc    $DF                   ; 5
    lda    $DF                   ; 3
    and    #$0F                  ; 2
    sta    $DF                   ; 3
LD7A2:
    lda    $D7                   ; 3
    cmp    #$10                  ; 2
    bcs    LD7B6                 ; 2³
    lda    $C3                   ; 3
    bne    LD7B6                 ; 2³
    lda    $C2                   ; 3
    and    #$10                  ; 2
    beq    LD7B3                 ; 2³
    rts                          ; 6

LD7B3:
    jsr    LD75A                 ; 6
LD7B6:
    lda    $D4                   ; 3
    cmp    #$0B                  ; 2
    bcs    LD7C5                 ; 2³
    lda    #1                    ; 2
    sta    $E0                   ; 3
    lda    #$0B                  ; 2
    jmp    LD7CF                 ; 3

LD7C5:
    cmp    #$8B                  ; 2
    bcc    LD7CF                 ; 2³
    lda    #$FF                  ; 2
    sta    $E0                   ; 3
    lda    #$8B                  ; 2
LD7CF:
    clc                          ; 2
    adc    $E0                   ; 3
    ldy    $B4                   ; 3
    cpy    #5                    ; 2
    bcc    LD7DB                 ; 2³
    clc                          ; 2
    adc    $E0                   ; 3
LD7DB:
    sta    $D4                   ; 3
    lda    $E0                   ; 3
    bmi    LD7E6                 ; 2³
    lda    #8                    ; 2
    jmp    LD7E8                 ; 3

LD7E6:
    lda    #0                    ; 2
LD7E8:
    sta    $C9                   ; 3
    lda    $D7                   ; 3
    cmp    #$9E                  ; 2
    bcc    LD7F8                 ; 2³
    ldx    $C3                   ; 3
    bne    LD801                 ; 2³+1
    ldx    #$FF                  ; 2
    stx    $E1                   ; 3
LD7F8:
    ldy    $B4                   ; 3
    cpy    #7                    ; 2
    bcc    LD801                 ; 2³+1
    clc                          ; 2
    adc    $E1                   ; 3
LD801:
    clc                          ; 2
    adc    $E1                   ; 3
    sta    $D7                   ; 3
    lda    #0                    ; 2
    ldx    #5                    ; 2
LD80A:
    sta    $BA,X                 ; 4
    dex                          ; 2
    bpl    LD80A                 ; 2³
    sta    $DA                   ; 3
    sta    $D9                   ; 3
    clc                          ; 2
    lda    $D4                   ; 3
    adc    #$30                  ; 2
    sta    $B1                   ; 3
    sta    $B2                   ; 3
    lda    #$AC                  ; 2
    sec                          ; 2
    sbc    $D7                   ; 3
    sta    $E3                   ; 3
    ldy    $DF                   ; 3
    lda    LDA25,Y               ; 4
    clc                          ; 2
    sbc    $D7                   ; 3
    sta    $E4                   ; 3
    lda    $D7                   ; 3
    cmp    #$21                  ; 2
    bcs    LD85B                 ; 2³
    lda    #$17                  ; 2
    adc    $E3                   ; 3
    sta    $BA                   ; 3
    clc                          ; 2
    lda    #$17                  ; 2
    adc    $E4                   ; 3
    sta    $BD                   ; 3
    lda    $D7                   ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    cmp    #$21                  ; 2
    bcc    LD85A                 ; 2³
    sta    $DA                   ; 3
    lda    #$20                  ; 2
    sta    $D9                   ; 3
    adc    $E3                   ; 3
    sta    $BB                   ; 3
    lda    #$21                  ; 2
    clc                          ; 2
    adc    $E4                   ; 3
    sta    $BE                   ; 3
LD85A:
    rts                          ; 6

LD85B:
    cmp    #$A7                  ; 2
    bcs    LD887                 ; 2³
    sbc    #0                    ; 2
    sta    $D9                   ; 3
    adc    #$0F                  ; 2
    sta    $DA                   ; 3
    lda    #$AC                  ; 2
    sta    $BB                   ; 3
    ldy    $DF                   ; 3
    lda    LDA25,Y               ; 4
    sbc    #0                    ; 2
    sta    $BE                   ; 3
    lda    $DA                   ; 3
    cmp    #$A7                  ; 2
    bcc    LD887                 ; 2³
    lda    #$A7                  ; 2
    adc    $E3                   ; 3
    sta    $BC                   ; 3
    lda    #$A8                  ; 2
    clc                          ; 2
    adc    $E4                   ; 3
    sta    $BF                   ; 3
LD887:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD888 SUBROUTINE
    lda    $C3                   ; 3
    bne    LD8AF                 ; 2³
    lda    $D3                   ; 3
    cmp    #9                    ; 2
    bcc    LD8AF                 ; 2³
    cmp    #$91                  ; 2
    bcs    LD8AF                 ; 2³
    adc    #3                    ; 2
    sta    $D5                   ; 3
    lda    $D6                   ; 3
    cmp    #$12                  ; 2
    bcc    LD8AF                 ; 2³
    cmp    #$A6                  ; 2
    bcs    LD8AF                 ; 2³
    adc    #5                    ; 2
    sta    $D8                   ; 3
    lda    $C1                   ; 3
    eor    #$30                  ; 2
    sta    $C1                   ; 3
    rts                          ; 6

LD8AF:
    lda    $C1                   ; 3
    and    #$4F                  ; 2
    sta    $C1                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD8B6 SUBROUTINE
    lda    $C1                   ; 3
    and    #$4F                  ; 2
    sta    $C1                   ; 3
    sec                          ; 2
    lda    $D4                   ; 3
    sbc    #$0C                  ; 2
    sta    $E3                   ; 3
    bcc    LD8C9                 ; 2³
    cmp    $D5                   ; 3
    bcs    LD904                 ; 2³+1
LD8C9:
    lda    $D4                   ; 3
    adc    #$14                  ; 2
    cmp    $D5                   ; 3
    bcc    LD904                 ; 2³+1
    lda    $D5                   ; 3
    sbc    $E3                   ; 3
    sta    $E3                   ; 3
    lda    $D7                   ; 3
    sbc    #$0E                  ; 2
    sta    $E4                   ; 3
    cmp    $D8                   ; 3
    bcs    LD904                 ; 2³+1
    lda    $D7                   ; 3
    adc    #$22                  ; 2
    cmp    $D8                   ; 3
    bcc    LD904                 ; 2³+1
    lda    $D8                   ; 3
    sbc    $E4                   ; 3
    sta    $E4                   ; 3
    cmp    #$12                  ; 2
    bcc    LD905                 ; 2³+1
    cmp    #$1E                  ; 2
    bcs    LD905                 ; 2³+1
    lda    $E3                   ; 3
    cmp    #$14                  ; 2
    bcs    LD905                 ; 2³+1
    cmp    #$0C                  ; 2
    bcc    LD905                 ; 2³
    jmp    LD93C                 ; 3

LD904:
    rts                          ; 6

LD905:
    lda    $E3                   ; 3
    cmp    #$0C                  ; 2
    bcc    LD914                 ; 2³
    cmp    #$14                  ; 2
    bcs    LD920                 ; 2³
    lda    #$FF                  ; 2
    jmp    LD916                 ; 3

LD914:
    lda    #1                    ; 2
LD916:
    cmp    $E0                   ; 3
    beq    LD920                 ; 2³
    sta    $E0                   ; 3
    lda    #$1B                  ; 2
    sta    $9A                   ; 3
LD920:
    lda    $E4                   ; 3
    cmp    #$12                  ; 2
    bcc    LD92F                 ; 2³
    cmp    #$1E                  ; 2
    bcs    LD93B                 ; 2³
    lda    #$FF                  ; 2
    jmp    LD931                 ; 3

LD92F:
    lda    #1                    ; 2
LD931:
    cmp    $E1                   ; 3
    beq    LD93B                 ; 2³
    sta    $E1                   ; 3
    lda    #$1B                  ; 2
    sta    $9A                   ; 3
LD93B:
    rts                          ; 6

LD93C:
    lda    #$B7                  ; 2
    sec                          ; 2
    sbc    $D7                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    sta    $C3                   ; 3
    lda    #$1A                  ; 2
    sta    $9A                   ; 3
    lda    #$0E                  ; 2
    sta    $C8                   ; 3
    lda    #$12                  ; 2
    sta    $DF                   ; 3
    lda    #0                    ; 2
    sta    $E0                   ; 3
    lda    #4                    ; 2
    sta    $E1                   ; 3
    ldy    $B4                   ; 3
    iny                          ; 2
    jsr    LD9D1                 ; 6
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD960 SUBROUTINE
    jmp    LD965                 ; 3

LD963 SUBROUTINE
    lda    $B1,X                 ; 4
LD965:
    tay                          ; 2
    and    #$0F                  ; 2
    sta    $E3                   ; 3
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    clc                          ; 2
    adc    $E3                   ; 3
    cmp    #$0F                  ; 2
    bcs    LD97B                 ; 2³
    nop                          ; 2
    jmp    LD97E                 ; 3

LD97B:
    sbc    #$0F                  ; 2
    iny                          ; 2
LD97E:
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0,X                ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
LD988:
    dey                          ; 2
    bpl    LD988                 ; 2³
    sta    RESP0,X               ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD98E SUBROUTINE
    lda    $D2                   ; 3
    sta    COLUPF                ; 3
    lda    #$FF                  ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    $B8                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    $B8                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    LDA87,Y               ; 4
    pha                          ; 3
    ora    #$01                  ; 2
    pha                          ; 3
    pha                          ; 3
    lda    #$16                  ; 2
    ldy    $D2                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    $E3                   ; 3
LD9B3:
    sta    COLUPF                ; 3
    ldx    $E3                   ; 3
LD9B7:
    dex                          ; 2
    bpl    LD9B7                 ; 2³
    plp                          ; 4
    bmi    LD9BF                 ; 2³
    bvs    LD9C4                 ; 2³
LD9BF:
    beq    LD9C4                 ; 2³
    jmp    LD9C4                 ; 3

LD9C4:
    sty    COLUPF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    bcs    LD9B3                 ; 2³
    lda    #0                    ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD9D1 SUBROUTINE
    lda    $C2                   ; 3
    bne    LDA23                 ; 2³+1
    lda    LDA6D,Y               ; 4
    sta    $E3                   ; 3
    lda    LDA64,Y               ; 4
    sta    $E4                   ; 3
    lda    #0                    ; 2
    sta    $E5                   ; 3
    sed                          ; 2
    clc                          ; 2
    ldx    #0                    ; 2
    bcc    LD9ED                 ; 3   always branch

LD9E9:
    adc    $B4,X                 ; 4
    sta    $B4,X                 ; 4
LD9ED:
    lda    #0                    ; 2
    adc    $E3,X                 ; 4
    inx                          ; 2
    cpx    #3                    ; 2
    bcc    LD9E9                 ; 2³
    clc                          ; 2
    adc    $B7                   ; 3
    bcc    LDA01                 ; 2³+1
    lda    #$99                  ; 2
    sta    $B5                   ; 3
    sta    $B6                   ; 3
LDA01:
    sta    $B7                   ; 3
    sec                          ; 2
    lda    $C5                   ; 3
    sbc    #1                    ; 2
    sta    $C5                   ; 3
    ldx    #2                    ; 2
LDA0C:
    lda    $E6,X                 ; 4
    cmp    $B5,X                 ; 4
    bcc    LDA1A                 ; 2³
    bne    LDA23                 ; 2³
    dex                          ; 2
    bpl    LDA0C                 ; 2³
    jmp    LDA23                 ; 3

LDA1A:
    ldx    #2                    ; 2
LDA1C:
    lda    $B5,X                 ; 4
    sta    $E6,X                 ; 4
    dex                          ; 2
    bpl    LDA1C                 ; 2³
LDA23:
    cld                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LDA25:
    .byte <DuckOne       ; $DA25
LDA26:
    .byte <DuckTwo       ; $DA26
LDA27:
    .byte <DuckThree     ; $DA27   flying duck pointers
    .byte <DuckFour      ; $DA28
    .byte <DuckFive      ; $DA29
    .byte <DuckFour      ; $DA2A
    .byte <DuckThree     ; $DA2B
    .byte <DuckTwo       ; $DA2C
    .byte <DuckOne       ; $DA2D
    .byte <DuckTwo       ; $DA2E
    .byte <DuckThree     ; $DA2F
    .byte <DuckFour      ; $DA30
    .byte <DuckFive      ; $DA31
    .byte <DuckFour      ; $DA32
    .byte <DuckThree     ; $DA33
    .byte <DuckTwo       ; $DA34
    .byte <DuckOne       ; $DA35
LDA36:
    .byte <DuckTwo       ; $DA36
    .byte $C3 ; |XX    XX| $DA37
    .byte $08 ; |    X   | $DA38
    .byte $04 ; |     X  | $DA39
    .byte $02 ; |      X | $DA3A
    .byte $01 ; |       X| $DA3B
    .byte $01 ; |       X| $DA3C
    .byte $01 ; |       X| $DA3D
    .byte $00 ; |        | $DA3E
    .byte $00 ; |        | $DA3F
LDA40:
    .byte $0E ; |    XXX | $DA40
    .byte $1C ; |   XXX  | $DA41
    .byte $2A ; |  X X X | $DA42
    .byte $3C ; |  XXXX  | $DA43
    .byte $4A ; | X  X X | $DA44
    .byte $00 ; |        | $DA45
    .byte $7E ; | XXXXXX | $DA46
    .byte $BA ; |X XXX X | $DA47
    .byte $EC ; |XXX XX  | $DA48
    .byte $FA ; |XXXXX X | $DA49
LDA4A:
    .byte $00 ; |        | $DA4A
    .byte $22 ; |  X   X | $DA4B
    .byte $18 ; |   XX   | $DA4C
    .byte $0E ; |    XXX | $DA4D
    .byte $5E ; | X XXXX | $DA4E
    .byte $5C ; | X XXX  | $DA4F
    .byte $6C ; | XX XX  | $DA50
    .byte $6A ; | XX X X | $DA51
    .byte $88 ; |X   X   | $DA52
    .byte $76 ; | XXX XX | $DA53
    .byte $74 ; | XXX X  | $DA54
    .byte $64 ; | XX  X  | $DA55
    .byte $62 ; | XX   X | $DA56
    .byte $60 ; | XX     | $DA57
LDA58:
    .byte $87 ; |X    XXX| $DA58
    .byte $0F ; |    XXXX| $DA59
    .byte $0F ; |    XXXX| $DA5A
    .byte $5A ; | X XX X | $DA5B
    .byte $2D ; |  X XX X| $DA5C
    .byte $2D ; |  X XX X| $DA5D
    .byte $2D ; |  X XX X| $DA5E
    .byte $2D ; |  X XX X| $DA5F
    .byte $2D ; |  X XX X| $DA60
    .byte $B4 ; |X XX X  | $DA61
    .byte $16 ; |   X XX | $DA62
    .byte $16 ; |   X XX | $DA63
LDA64:
    .byte $2D ; |  X XX X| $DA64
    .byte $2D ; |  X XX X| $DA65
    .byte $00 ; |        | $DA66
    .byte $01 ; |       X| $DA67
    .byte $01 ; |       X| $DA68
    .byte $02 ; |      X | $DA69
    .byte $05 ; |     X X| $DA6A
    .byte $07 ; |     XXX| $DA6B
    .byte $10 ; |   X    | $DA6C
LDA6D:
    .byte $15 ; |   X X X| $DA6D
    .byte $30 ; |  XX    | $DA6E
    .byte $75 ; | XXX X X| $DA6F
    .byte $00 ; |        | $DA70
    .byte $50 ; | X X    | $DA71
    .byte $50 ; | X X    | $DA72
    .byte $00 ; |        | $DA73
    .byte $50 ; | X X    | $DA74
    .byte $00 ; |        | $DA75
LDA76:
    .byte $00 ; |        | $DA76
    .byte $00 ; |        | $DA77
    .byte $25 ; |  X  X X| $DA78
    .byte $25 ; |  X  X X| $DA79
    .byte $25 ; |  X  X X| $DA7A
    .byte $25 ; |  X  X X| $DA7B
    .byte $25 ; |  X  X X| $DA7C
LDA7D:
    .byte $25 ; |  X  X X| $DA7D
    .byte $25 ; |  X  X X| $DA7E
    .byte $25 ; |  X  X X| $DA7F
    .byte $15 ; |   X X X| $DA80
    .byte $15 ; |   X X X| $DA81
    .byte $15 ; |   X X X| $DA82
    .byte $15 ; |   X X X| $DA83
    .byte $15 ; |   X X X| $DA84
    .byte $15 ; |   X X X| $DA85
    .byte $15 ; |   X X X| $DA86
LDA87:
    .byte $44 ; | X   X  | $DA87
    .byte $86 ; |X    XX | $DA88
    .byte $06 ; |     XX | $DA89
    .byte $84 ; |X    X  | $DA8A
    .byte $04 ; |     X  | $DA8B
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
    .byte $00 ; |        | $DACC
    .byte $00 ; |        | $DACD
    .byte $00 ; |        | $DACE
    .byte $00 ; |        | $DACF
    .byte $00 ; |        | $DAD0
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
LDB00:
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
DuckOne:
    .byte $00 ; |        | $DB1E
    .byte $00 ; |        | $DB1F
    .byte $00 ; |        | $DB20
    .byte $00 ; |        | $DB21
    .byte $60 ; | XX     | $DB22   flying duck animation
    .byte $60 ; | XX     | $DB23
    .byte $60 ; | XX     | $DB24
    .byte $EC ; |XXX XX  | $DB25
    .byte $3E ; |  XXXXX | $DB26
    .byte $3F ; |  XXXXXX| $DB27
    .byte $3E ; |  XXXXX | $DB28
    .byte $1C ; |   XXX  | $DB29
    .byte $0E ; |    XXX | $DB2A
    .byte $0F ; |    XXXX| $DB2B
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
DuckTwo:
    .byte $00 ; |        | $DB3C
    .byte $00 ; |        | $DB3D
    .byte $00 ; |        | $DB3E
    .byte $00 ; |        | $DB3F
    .byte $60 ; | XX     | $DB40
    .byte $60 ; | XX     | $DB41
    .byte $67 ; | XX  XXX| $DB42
    .byte $EE ; |XXX XXX | $DB43
    .byte $3E ; |  XXXXX | $DB44
    .byte $3E ; |  XXXXX | $DB45
    .byte $3F ; |  XXXXXX| $DB46
    .byte $3E ; |  XXXXX | $DB47
    .byte $3E ; |  XXXXX | $DB48
    .byte $1C ; |   XXX  | $DB49
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
DuckThree:
    .byte $00 ; |        | $DB5A
    .byte $00 ; |        | $DB5B
    .byte $00 ; |        | $DB5C
    .byte $00 ; |        | $DB5D
    .byte $67 ; | XX  XXX| $DB5E
    .byte $67 ; | XX  XXX| $DB5F
    .byte $6E ; | XX XXX | $DB60
    .byte $EE ; |XXX XXX | $DB61
    .byte $3C ; |  XXXX  | $DB62
    .byte $3E ; |  XXXXX | $DB63
    .byte $3F ; |  XXXXXX| $DB64
    .byte $3E ; |  XXXXX | $DB65
    .byte $1E ; |   XXXX | $DB66
    .byte $0C ; |    XX  | $DB67
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
    .byte $00 ; |        | $DB72
    .byte $00 ; |        | $DB73
    .byte $00 ; |        | $DB74
    .byte $00 ; |        | $DB75
    .byte $00 ; |        | $DB76
    .byte $00 ; |        | $DB77
DuckFour:
    .byte $00 ; |        | $DB78
    .byte $00 ; |        | $DB79
    .byte $03 ; |      XX| $DB7A
    .byte $03 ; |      XX| $DB7B
    .byte $66 ; | XX  XX | $DB7C
    .byte $67 ; | XX  XXX| $DB7D
    .byte $6F ; | XX XXXX| $DB7E
    .byte $FC ; |XXXXXX  | $DB7F
    .byte $3E ; |  XXXXX | $DB80
    .byte $3E ; |  XXXXX | $DB81
    .byte $1E ; |   XXXX | $DB82
    .byte $1F ; |   XXXXX| $DB83
    .byte $0E ; |    XXX | $DB84
    .byte $04 ; |     X  | $DB85
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
DuckFive:
    .byte $03 ; |      XX| $DB96
    .byte $06 ; |     XX | $DB97
    .byte $07 ; |     XXX| $DB98
    .byte $0C ; |    XX  | $DB99
    .byte $6E ; | XX XXX | $DB9A
    .byte $6C ; | XX XX  | $DB9B
    .byte $78 ; | XXXX   | $DB9C
    .byte $FC ; |XXXXXX  | $DB9D
    .byte $3E ; |  XXXXX | $DB9E
    .byte $1E ; |   XXXX | $DB9F
    .byte $1F ; |   XXXXX| $DBA0
    .byte $0E ; |    XXX | $DBA1
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

    .byte $C0 ; |XX      | $DBB4
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
    
    .byte $C3 ; |XX    XX| $DBC3
    .byte $5A ; | X XX X | $DBC4
    .byte $3C ; |  XXXX  | $DBC5
    .byte $5A ; | X XX X | $DBC6
    .byte $3C ; |  XXXX  | $DBC7
    .byte $24 ; |  X  X  | $DBC8
    .byte $5A ; | X XX X | $DBC9
    .byte $C3 ; |XX    XX| $DBCA
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


  FILLED_SPACE 768       ; $DC00 - $DEFF   free bytes
  EMPTY_SPACE 216        ; $DF00 - $DFD7   free bytes


       ORG $4FD8
      RORG $DFD8

START_BANK_2:
    lda    BANK_0                ; 4
    jmp    $9100                 ; 3

    lda    BANK_3                ; 4
    jmp.ind ($0080)              ; 5

    lda    BANK_2                ; 4
    jmp.ind ($0080)              ; 5

    lda    BANK_1                ; 4
    jmp.ind ($0080)              ; 5

LDFF0 SUBROUTINE
    lda    BANK_0                ; 4
    jmp.ind ($0080)              ; 5

    .byte $00 ; |        | $DFF6
    .byte $00 ; |        | $DFF7
    .byte $00 ; |        | $DFF8
    .byte $00 ; |        | $DFF9

       ORG $4FFA
      RORG $DFFA

    .word START_BANK_2
    .word START_BANK_2
    .word START_BANK_2


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 3
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


       ORG $5000
      RORG $F000

    FILLED_SPACE 256                ; $F000 - $F0FF super chip ram

LF100:  ; indirect jump, coming from bank 0
    lda    #$48                  ; 2
    sta    $D2                   ; 3
    lda    #5                    ; 2
    sta    CTRLPF                ; 3
    sed                          ; 2
    clc                          ; 2
    ldy    $B4                   ; 3
    lda    LF835,Y               ; 4
    adc    $C4                   ; 3
    bcc    LF115                 ; 2³
    lda    #$99                  ; 2
LF115:
    sta    $C4                   ; 3
    cld                          ; 2
    lda    #0                    ; 2
    sta    $E2                   ; 3
    sta    $DF                   ; 3
    sta    $DB                   ; 3
    jsr    LF27E                 ; 6
LF123:
    lda    #$8A                  ; 2
    sta    $80                   ; 3
    lda    #$91                  ; 2
    sta    $81                   ; 3
    jsr    LFFF0                 ; 6
    tya                          ; 2
    beq    LF134                 ; 2³
    jmp    LF227                 ; 3

LF134:
    lda    $92                   ; 3
    bne    LF13B                 ; 2³
    jsr    LF2C6                 ; 6
LF13B:
    lda    INTIM                 ; 4
    bne    LF13B                 ; 2³
    lda    #$E4                  ; 2
    sta    TIM64T                ; 4
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    lda    #$4E                  ; 2
    sta    $80                   ; 3
    lda    #$93                  ; 2
    sta    $81                   ; 3
    jsr    LFFF0                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $D2                   ; 3
    sta    COLUBK                ; 3
    lda    #$20                  ; 2
    sta    COLUPF                ; 3
    lda    #$FF                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    ldx    #0                    ; 2
    jsr    LF67D                 ; 6
    lda    $B1                   ; 3
    cmp    #$A5                  ; 2
    bcs    LF177                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
LF177:
    ldx    #1                    ; 2
    jsr    LF67D                 ; 6
    lda    $B2                   ; 3
    cmp    #$A5                  ; 2
    bcs    LF184                 ; 2³
    sta    WSYNC                 ; 3
LF184:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$B0                  ; 2
    sta    PF0                   ; 3
    lda    $C8                   ; 3
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    lda    #$F8                  ; 2
    sta    $85                   ; 3
    sta    $87                   ; 3
    lda    #9                    ; 2
    sta    $84                   ; 3
    lda    #$1A                  ; 2
    sta    $86                   ; 3
    lda    $D0                   ; 3
    sta    COLUP0                ; 3
    lda    #$1A                  ; 2
    sta    COLUP1                ; 3
    ldx    #4                    ; 2
LF1AA:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LF1AA                 ; 2³
    lda    #$55                  ; 2
    sta    PF1                   ; 3
    lda    #$AA                  ; 2
    sta    PF2                   ; 3
    ldx    #4                    ; 2
LF1B9:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LF1B9                 ; 2³
    lda    #$F0                  ; 2
    sta    PF0                   ; 3
    ldy    #0                    ; 2
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    ldx    #$1C                  ; 2
LF1CA:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    lda    ($84),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($86),Y               ; 5
    sta    GRP1                  ; 3
    cpx    $D9                   ; 3
    bcc    LF1DF                 ; 2³
    cpx    $DA                   ; 3
    bcs    LF1DF                 ; 2³
    iny                          ; 2
LF1DF:
    inx                          ; 2
    lda    #$F0                  ; 2
    cpx    #$20                  ; 2
    bcc    LF1EB                 ; 2³
    cpx    #$A7                  ; 2
    bcs    LF1EB                 ; 2³
    lsr                          ; 2
LF1EB:
    cpx    #$AC                  ; 2
    bne    LF1CA                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #$B0                  ; 2
    sta    PF0                   ; 3
    lda    #$FF                  ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    ldx    #6                    ; 2
LF203:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LF203                 ; 2³
    ldx    #0                    ; 2
    lda    #$20                  ; 2
    sta    $D2                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    PF0                   ; 3
    sta    COLUBK                ; 3
    jsr    LF6A8                 ; 6
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$48                  ; 2
    sta    COLUBK                ; 3
    sta    $D2                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    COLUBK                ; 3
LF227:
    sta    WSYNC                 ; 3
;---------------------------------------
LF229:
    lda    INTIM                 ; 4
    bne    LF229                 ; 2³
    lda    #$23                  ; 2
    sta    TIM64T                ; 4
    lda    #2                    ; 2
    sta    VBLANK                ; 3
    lda    #$98                  ; 2
    sta    $80                   ; 3
    lda    #$93                  ; 2
    sta    $81                   ; 3
    jsr    LFFF0                 ; 6
    lda    $92                   ; 3
    bne    LF276                 ; 2³
    lda    $C1                   ; 3
    and    #$20                  ; 2
    beq    LF24F                 ; 2³
    jsr    LF35A                 ; 6
LF24F:
    lda    $C1                   ; 3
    and    #$10                  ; 2
    beq    LF258                 ; 2³
    jsr    LF380                 ; 6
LF258:
    ldy    $C3                   ; 3
    beq    LF276                 ; 2³
    dec    $C3                   ; 5
    bne    LF268                 ; 2³
    lda    $C2                   ; 3
    and    #$10                  ; 2
    beq    LF26F                 ; 2³
    sta    $C3                   ; 3
LF268:
    lda    #1                    ; 2
    sta    $DB                   ; 3
    jmp    LF276                 ; 3

LF26F:
    jsr    LF27E                 ; 6
    lda    #$0F                  ; 2
    sta    $DB                   ; 3
LF276:
    lda    INTIM                 ; 4
    bne    LF276                 ; 2³
    jmp    LF123                 ; 3

LF27E:
    lda    $98                   ; 3
    lsr                          ; 2
    clc                          ; 2
    adc    #$0B                  ; 2
    sta    $D4                   ; 3
    jsr    LF73F                 ; 6
    lda    $98                   ; 3
    lsr                          ; 2
    tax                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $E3                   ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    $E3                   ; 3
    clc                          ; 2
    adc    #$21                  ; 2
    sta    $D7                   ; 3
    lda    $E2                   ; 3
    bne    LF2C5                 ; 2³
    lda    $D4                   ; 3
    sta    $D5                   ; 3
    lda    $D7                   ; 3
    sta    $D8                   ; 3
    lda    $98                   ; 3
    ldx    #1                    ; 2
    ldy    #1                    ; 2
    and    #$01                  ; 2
    beq    LF2B5                 ; 2³
    ldx    #$FF                  ; 2
LF2B5:
    lda    $98                   ; 3
    and    #$02                  ; 2
    beq    LF2BD                 ; 2³
    ldy    #$FF                  ; 2
LF2BD:
    stx    $E0                   ; 3
    sty    $E1                   ; 3
    lda    #$30                  ; 2
    sta    $D0                   ; 3
LF2C5:
    rts                          ; 6

LF2C6:
    dec    $DB                   ; 5
    bpl    LF2E8                 ; 2³
    lda    $E2                   ; 3
    eor    #$01                  ; 2
    sta    $E2                   ; 3
    beq    LF2E1                 ; 2³
    lda    $C2                   ; 3
    and    #$40                  ; 2
    bne    LF2E1                 ; 2³
    lda    #$1D                  ; 2
    sta    $9A                   ; 3
    lda    #$2D                  ; 2
    jmp    LF2E6                 ; 3

LF2E1:
    ldy    $B4                   ; 3
    lda    LF7F7,Y               ; 4
LF2E6:
    sta    $DB                   ; 3
LF2E8:
    lda    $D5                   ; 3
    cmp    #$0B                  ; 2
    bcs    LF2F7                 ; 2³
    lda    #1                    ; 2
    sta    $E0                   ; 3
    lda    #$0B                  ; 2
    jmp    LF301                 ; 3

LF2F7:
    cmp    #$8B                  ; 2
    bcc    LF301                 ; 2³+1
    lda    #$FF                  ; 2
    sta    $E0                   ; 3
    lda    #$8B                  ; 2
LF301:
    clc                          ; 2
    adc    $E0                   ; 3
    sta    $D5                   ; 3
    lda    $D8                   ; 3
    cmp    #$1D                  ; 2
    bcs    LF315                 ; 2³
    lda    #1                    ; 2
    sta    $E1                   ; 3
    lda    #$1C                  ; 2
    jmp    LF323                 ; 3

LF315:
    cmp    #$9B                  ; 2
    bcc    LF323                 ; 2³
    ldx    $C3                   ; 3
    bne    LF323                 ; 2³
    lda    #$FF                  ; 2
    sta    $E1                   ; 3
    lda    #$9B                  ; 2
LF323:
    clc                          ; 2
    adc    $E1                   ; 3
    sta    $D8                   ; 3
    lda    $E2                   ; 3
    bne    LF345                 ; 2³
    lda    $D5                   ; 3
    sta    $D4                   ; 3
    lda    $D8                   ; 3
    sta    $D7                   ; 3
    dec    $DF                   ; 5
    bpl    LF348                 ; 2³
    lda    #8                    ; 2
    sta    $DF                   ; 3
    lda    $C8                   ; 3
    eor    #$08                  ; 2
    sta    $C8                   ; 3
    jmp    LF348                 ; 3

LF345:
    jsr    LF27E                 ; 6
LF348:
    lda    $D4                   ; 3
    clc                          ; 2
    adc    #$30                  ; 2
    sta    $B1                   ; 3
    sta    $B2                   ; 3
    lda    $D7                   ; 3
    sta    $D9                   ; 3
    adc    #$10                  ; 2
    sta    $DA                   ; 3
    rts                          ; 6

LF35A:
    lda    $C3                   ; 3
    bne    LF379                 ; 2³
    lda    $D3                   ; 3
    cmp    #9                    ; 2
    bcc    LF379                 ; 2³
    cmp    #$91                  ; 2
    bcs    LF379                 ; 2³
    lda    $D6                   ; 3
    cmp    #$17                  ; 2
    bcc    LF379                 ; 2³
    cmp    #$A6                  ; 2
    bcs    LF379                 ; 2³
    lda    $C1                   ; 3
    eor    #$30                  ; 2
    sta    $C1                   ; 3
    rts                          ; 6

LF379:
    lda    $C1                   ; 3
    and    #$4F                  ; 2
    sta    $C1                   ; 3
    rts                          ; 6

LF380:
    lda    $C1                   ; 3
    and    #$4F                  ; 2
    sta    $C1                   ; 3
    lda    $D3                   ; 3
    clc                          ; 2
    adc    #3                    ; 2
    cmp    $D5                   ; 3
    bcc    LF3A1                 ; 2³
    sbc    #8                    ; 2
    cmp    $D5                   ; 3
    bcs    LF3A1                 ; 2³
    lda    $D6                   ; 3
    cmp    $D8                   ; 3
    bcc    LF3A1                 ; 2³
    sbc    #$0C                  ; 2
    cmp    $D8                   ; 3
    bcc    LF3A2                 ; 2³
LF3A1:
    rts                          ; 6

LF3A2:
    lda    #$B7                  ; 2
    sec                          ; 2
    sbc    $D8                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    sta    $C3                   ; 3
    lda    #0                    ; 2
    sta    $E0                   ; 3
    lda    #4                    ; 2
    sta    $E1                   ; 3
    lda    $D2                   ; 3
    sta    $D0                   ; 3
    lda    #$1C                  ; 2
    sta    $9A                   ; 3
    lda    $B4                   ; 3
    clc                          ; 2
    adc    $E2                   ; 3
    tay                          ; 2
    jsr    LF6EB                 ; 6
    lda    #0                    ; 2
    sta    $E2                   ; 3
    rts                          ; 6

LF3C9:  ; indirect jump, coming from bank 0
    lda    #$B8                  ; 2
    sta    $D2                   ; 3
    lda    #5                    ; 2
    sta    CTRLPF                ; 3
    sed                          ; 2
    clc                          ; 2
    ldy    $B4                   ; 3
    lda    LF83A,Y               ; 4
    adc    $C4                   ; 3
    bcc    LF3DE                 ; 2³
    lda    #$99                  ; 2
LF3DE:
    sta    $C4                   ; 3
    cld                          ; 2
    lda    #0                    ; 2
    sta    $DB                   ; 3
    sta    $D8                   ; 3
    lda    $CC                   ; 3
    and    #$08                  ; 2
    sta    $CC                   ; 3
    lda    #1                    ; 2
    sta    $DF                   ; 3
    sta    $E0                   ; 3
    sta    $E1                   ; 3
    lda    #$0C                  ; 2
    sta    $D4                   ; 3
    lda    #$21                  ; 2
    sta    $D9                   ; 3
    lda    #2                    ; 2
    sta    $C6                   ; 3
LF401:
    lda    #$8A                  ; 2
    sta    $80                   ; 3
    lda    #$91                  ; 2
    sta    $81                   ; 3
    jsr    LFFF0                 ; 6
    tya                          ; 2
    beq    LF412                 ; 2³
    jmp    LF533                 ; 3

LF412:
    lda    $92                   ; 3
    bne    LF419                 ; 2³
    jsr    LF579                 ; 6
LF419:
    lda    INTIM                 ; 4
    bne    LF419                 ; 2³
    lda    #$E4                  ; 2
    sta    TIM64T                ; 4
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    lda    #$4E                  ; 2
    sta    $80                   ; 3
    lda    #$93                  ; 2
    sta    $81                   ; 3
    jsr    LFFF0                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $D2                   ; 3
    sta    COLUBK                ; 3
    lda    #$20                  ; 2
    sta    COLUPF                ; 3
    lda    #$FF                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    ldx    #0                    ; 2
    jsr    LF67D                 ; 6
    lda    $B1                   ; 3
    cmp    #$A5                  ; 2
    bcs    LF455                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
LF455:
    ldx    #1                    ; 2
    jsr    LF67D                 ; 6
    lda    $B2                   ; 3
    cmp    #$A5                  ; 2
    bcs    LF462                 ; 2³
    sta    WSYNC                 ; 3
LF462:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$B0                  ; 2
    sta    PF0                   ; 3
    lda    $C8                   ; 3
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    lda    #$F7                  ; 2
    sta    $85                   ; 3
    sta    $89                   ; 3
    sta    $87                   ; 3
    sta    $8B                   ; 3
    lda    $C9                   ; 3
    sta    $84                   ; 3
    lda    $CA                   ; 3
    sta    $86                   ; 3
    lda    $CB                   ; 3
    sta    $88                   ; 3
    lda    #$0E                  ; 2
    sta    COLUP0                ; 3
    lda    #$30                  ; 2
    sta    COLUP1                ; 3
    ldx    #4                    ; 2
LF490:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LF490                 ; 2³
    lda    #$55                  ; 2
    sta    PF1                   ; 3
    lda    #$AA                  ; 2
    sta    PF2                   ; 3
    ldx    #4                    ; 2
LF49F:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LF49F                 ; 2³
    lda    #$F0                  ; 2
    sta    PF0                   ; 3
    lda    #0                    ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    ldx    #5                    ; 2
LF4B0:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LF4B0                 ; 2³
    lda    #$70                  ; 2
    sta    PF0                   ; 3
    ldy    #0                    ; 2
    ldx    #$21                  ; 2
LF4BD:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($84),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($86),Y               ; 5
    sta    GRP1                  ; 3
    cpx    $D9                   ; 3
    bcc    LF4CC                 ; 2³
    iny                          ; 2
LF4CC:
    inx                          ; 2
    cpy    #$1B                  ; 2
    bcc    LF4BD                 ; 2³
    lda    #$1C                  ; 2
    sta    COLUP0                ; 3
    lda    #2                    ; 2
    sta    COLUP1                ; 3
    lda    $CC                   ; 3
    sta    REFP0                 ; 3
    ldy    #0                    ; 2
    lda    #$70                  ; 2
    inx                          ; 2
LF4E2:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    lda    ($88),Y               ; 5
    sta    GRP0                  ; 3
    cpx    #$9F                  ; 2
    bcc    LF4EF                 ; 2³
    iny                          ; 2
LF4EF:
    inx                          ; 2
    lda    #$F0                  ; 2
    cpx    #$A7                  ; 2
    bcs    LF4F7                 ; 2³
    lsr                          ; 2
LF4F7:
    cpx    #$AC                  ; 2
    bne    LF4E2                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #$B0                  ; 2
    sta    PF0                   ; 3
    lda    #$FF                  ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    ldx    #6                    ; 2
LF50F:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LF50F                 ; 2³
    ldx    #0                    ; 2
    lda    #$20                  ; 2
    sta    $D2                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    PF0                   ; 3
    sta    COLUBK                ; 3
    jsr    LF6A8                 ; 6
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$B8                  ; 2
    sta    COLUBK                ; 3
    sta    $D2                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    COLUBK                ; 3
LF533:
    sta    WSYNC                 ; 3
;---------------------------------------
LF535:
    lda    INTIM                 ; 4
    bne    LF535                 ; 2³
    lda    #$23                  ; 2
    sta    TIM64T                ; 4
    lda    #2                    ; 2
    sta    VBLANK                ; 3
    lda    #$98                  ; 2
    sta    $80                   ; 3
    lda    #$93                  ; 2
    sta    $81                   ; 3
    jsr    LFFF0                 ; 6
    lda    $92                   ; 3
    bne    LF571                 ; 2³
    lda    $C1                   ; 3
    and    #$20                  ; 2
    beq    LF55B                 ; 2³
    jsr    LF5DA                 ; 6
LF55B:
    lda    $C1                   ; 3
    and    #$10                  ; 2
    beq    LF564                 ; 2³
    jsr    LF61D                 ; 6
LF564:
    ldy    $C3                   ; 3
    beq    LF571                 ; 2³
    lda    $D9                   ; 3
    clc                          ; 2
    adc    $E1                   ; 3
    sta    $D9                   ; 3
    dec    $C3                   ; 5
LF571:
    lda    INTIM                 ; 4
    bne    LF571                 ; 2³
    jmp    LF401                 ; 3

LF579:
    dec    $DB                   ; 5
    bpl    LF589                 ; 2³
    lda    #3                    ; 2
    sta    $DB                   ; 3
    inc    $DF                   ; 5
    lda    $DF                   ; 3
    and    #$03                  ; 2
    sta    $DF                   ; 3
LF589:
    lda    $CC                   ; 3
    eor    #$08                  ; 2
    sta    $CC                   ; 3
    lda    $D4                   ; 3
    clc                          ; 2
    adc    $E0                   ; 3
    sta    $D4                   ; 3
    cmp    #4                    ; 2
    bcc    LF59E                 ; 2³
    cmp    #$94                  ; 2
    bcc    LF5BD                 ; 2³
LF59E:
    lda    $C2                   ; 3
    and    #$30                  ; 2
    beq    LF5A7                 ; 2³
    jmp    LF659                 ; 3

LF5A7:
    ldy    $C6                   ; 3
    beq    LF5B0                 ; 2³
    dec    $C6                   ; 5
    jmp    LF659                 ; 3

LF5B0:
    sta    $E0                   ; 3
    lda    $C2                   ; 3
    bne    LF5BD                 ; 2³
    jsr    LF666                 ; 6
    lda    #$22                  ; 2
    sta    $9A                   ; 3
LF5BD:
    lda    $D4                   ; 3
    adc    #$30                  ; 2
    sta    $B1                   ; 3
    sta    $B2                   ; 3
    lda    $E0                   ; 3
    sta    $C8                   ; 3
    ldy    $DF                   ; 3
    lda    LF801,Y               ; 4
    sta    $C9                   ; 3
    lda    LF805,Y               ; 4
    sta    $CA                   ; 3
    lda    #<Unicycle            ; 2   wheel
    sta    $CB                   ; 3
    rts                          ; 6

LF5DA:
    lda    $D3                   ; 3
    clc                          ; 2
    adc    #3                    ; 2
    cmp    #$0C                  ; 2
    bcc    LF616                 ; 2³+1
    cmp    #$94                  ; 2
    bcs    LF616                 ; 2³+1
    cmp    $D4                   ; 3
    bcc    LF616                 ; 2³+1
    sbc    #8                    ; 2
    cmp    $D4                   ; 3
    bcs    LF616                 ; 2³+1
    lda    $D6                   ; 3
    clc                          ; 2
    adc    #5                    ; 2
    cmp    $D9                   ; 3
    bcc    LF616                 ; 2³+1
    cmp    #$AB                  ; 2
    bcs    LF616                 ; 2³+1
    ldy    #2                    ; 2
    cmp    #$A0                  ; 2
    bcs    LF60D                 ; 2³
    dey                          ; 2
    sec                          ; 2
    sbc    #$18                  ; 2
    cmp    $D9                   ; 3
    bcs    LF60D                 ; 2³
    dey                          ; 2
LF60D:
    sty    $D7                   ; 3
    lda    $C1                   ; 3
    eor    #$30                  ; 2
    sta    $C1                   ; 3
    rts                          ; 6

LF616:
    lda    $C1                   ; 3
    and    #$4F                  ; 2
    sta    $C1                   ; 3
    rts                          ; 6

LF61D:
    lda    $C1                   ; 3
    and    #$4F                  ; 2
    sta    $C1                   ; 3
    lda    $D7                   ; 3
    beq    LF63A                 ; 2³
    cmp    #1                    ; 2
    bne    LF659                 ; 2³
    lda    #$1F                  ; 2
    sta    $9A                   ; 3
    lda    #5                    ; 2
    sta    $C3                   ; 3
    ldy    $B4                   ; 3
    iny                          ; 2
    jsr    LF6EB                 ; 6
    rts                          ; 6

LF63A:
    lda    #$20                  ; 2
    bit    $C2                   ; 3
    bne    LF647                 ; 2³
    jsr    LF666                 ; 6
    lda    #$1E                  ; 2
    sta    $9A                   ; 3
LF647:
    lda    #$87                  ; 2
    sec                          ; 2
    sbc    $D9                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    sta    $C3                   ; 3
    lda    #4                    ; 2
    sta    $E1                   ; 3
    asl    $E0                   ; 5
    asl    $E0                   ; 5
    rts                          ; 6

LF659:
    lda    $E0                   ; 3
    eor    #$FF                  ; 2
    ora    #$01                  ; 2
    sta    $E0                   ; 3
    lda    #$20                  ; 2
    sta    $9A                   ; 3
    rts                          ; 6

LF666:
    lda    #$40                  ; 2
    sta    $C2                   ; 3
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    sta    $93                   ; 3
    lda    #$FF                  ; 2
    sta    $9B                   ; 3
    sta    $9C                   ; 3
    sta    $AD                   ; 3
    sta    $AE                   ; 3
    rts                          ; 6

LF67D:
    lda    $B1,X                 ; 4
    tay                          ; 2
    and    #$0F                  ; 2
    sta    $E3                   ; 3
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    clc                          ; 2
    adc    $E3                   ; 3
    cmp    #$0F                  ; 2
    bcs    LF695                 ; 2³
    nop                          ; 2
    jmp    LF698                 ; 3

LF695:
    sbc    #$0F                  ; 2
    iny                          ; 2
LF698:
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0,X                ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
LF6A2:
    dey                          ; 2
    bpl    LF6A2                 ; 2³
    sta    RESP0,X               ; 4
    rts                          ; 6

LF6A8:
    lda    $D2                   ; 3
    sta    COLUPF                ; 3
    lda    #$FF                  ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    $B8                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    $B8                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    LF844,Y               ; 4
    pha                          ; 3
    ora    #$01                  ; 2
    pha                          ; 3
    pha                          ; 3
    lda    #$16                  ; 2
    ldy    $D2                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    $E3                   ; 3
LF6CD:
    sta    COLUPF                ; 3
    ldx    $E3                   ; 3
LF6D1:
    dex                          ; 2
    bpl    LF6D1                 ; 2³
    plp                          ; 4
    bmi    LF6D9                 ; 2³
    bvs    LF6DE                 ; 2³
LF6D9:
    beq    LF6DE                 ; 2³
    jmp    LF6DE                 ; 3

LF6DE:
    sty    COLUPF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    bcs    LF6CD                 ; 2³
    lda    #0                    ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    rts                          ; 6

LF6EB:
    lda    $C2                   ; 3
    bne    LF73D                 ; 2³+1
    lda    LF82E,Y               ; 4
    sta    $E3                   ; 3
    lda    LF827,Y               ; 4
    sta    $E4                   ; 3
    lda    #0                    ; 2
    sta    $E5                   ; 3
    sed                          ; 2
    clc                          ; 2
    ldx    #0                    ; 2
    bcc    LF707                 ; 2³
LF703:
    adc    $B4,X                 ; 4
    sta    $B4,X                 ; 4
LF707:
    lda    #0                    ; 2
    adc    $E3,X                 ; 4
    inx                          ; 2
    cpx    #3                    ; 2
    bcc    LF703                 ; 2³
    clc                          ; 2
    adc    $B7                   ; 3
    bcc    LF71B                 ; 2³
    lda    #$99                  ; 2
    sta    $B5                   ; 3
    sta    $B6                   ; 3
LF71B:
    sta    $B7                   ; 3
    sec                          ; 2
    lda    $C5                   ; 3
    sbc    #1                    ; 2
    sta    $C5                   ; 3
    ldx    #2                    ; 2
LF726:
    lda    $E6,X                 ; 4
    cmp    $B5,X                 ; 4
    bcc    LF734                 ; 2³
    bne    LF73D                 ; 2³
    dex                          ; 2
    bpl    LF726                 ; 2³
    jmp    LF73D                 ; 3

LF734:
    ldx    #2                    ; 2
LF736:
    lda    $B5,X                 ; 4
    sta    $E6,X                 ; 4
    dex                          ; 2
    bpl    LF736                 ; 2³
LF73D:
    cld                          ; 2
    rts                          ; 6

LF73F:
    lda    $99                   ; 3
    asl                          ; 2
    eor    $99                   ; 3
    asl                          ; 2
    asl                          ; 2
    rol    $98                   ; 5
    rol    $99                   ; 5
    rol    $98                   ; 5
    rts                          ; 6

ClownOne:
    .byte $00 ; |        | $F74D
    .byte $60 ; | XX     | $F74E
    .byte $70 ; | XXX    | $F74F
    .byte $30 ; |  XX    | $F750
    .byte $38 ; |  XXX   | $F751
    .byte $38 ; |  XXX   | $F752
    .byte $10 ; |   X    | $F753
    .byte $10 ; |   X    | $F754
    .byte $00 ; |        | $F755
    .byte $30 ; |  XX    | $F756
    .byte $10 ; |   X    | $F757
    .byte $00 ; |        | $F758
    .byte $00 ; |        | $F759
    .byte $3C ; |  XXXX  | $F75A
    .byte $B8 ; |X XXX   | $F75B
    .byte $78 ; | XXXX   | $F75C
    .byte $7C ; | XXXXX  | $F75D
    .byte $7E ; | XXXXXX | $F75E
    .byte $7F ; | XXXXXXX| $F75F
    .byte $37 ; |  XX XXX| $F760
    .byte $33 ; |  XX  XX| $F761
    .byte $33 ; |  XX  XX| $F762
    .byte $33 ; |  XX  XX| $F763
    .byte $30 ; |  XX    | $F764
    .byte $30 ; |  XX    | $F765
    .byte $00 ; |        | $F766
    .byte $00 ; |        | $F767
ClownTwo:
    .byte $00 ; |        | $F768
    .byte $60 ; | XX     | $F769
    .byte $70 ; | XXX    | $F76A
    .byte $30 ; |  XX    | $F76B
    .byte $38 ; |  XXX   | $F76C
    .byte $38 ; |  XXX   | $F76D
    .byte $10 ; |   X    | $F76E
    .byte $10 ; |   X    | $F76F
    .byte $00 ; |        | $F770
    .byte $00 ; |        | $F771
    .byte $18 ; |   XX   | $F772
    .byte $08 ; |    X   | $F773
    .byte $00 ; |        | $F774
    .byte $80 ; |X       | $F775
    .byte $7C ; | XXXXX  | $F776
    .byte $7C ; | XXXXX  | $F777
    .byte $7E ; | XXXXXX | $F778
    .byte $7E ; | XXXXXX | $F779
    .byte $3E ; |  XXXXX | $F77A
    .byte $7E ; | XXXXXX | $F77B
    .byte $76 ; | XXX XX | $F77C
    .byte $66 ; | XX  XX | $F77D
    .byte $66 ; | XX  XX | $F77E
    .byte $66 ; | XX  XX | $F77F
    .byte $00 ; |        | $F780
    .byte $00 ; |        | $F781
    .byte $00 ; |        | $F782
ClownThree:
    .byte $00 ; |        | $F783
    .byte $20 ; |  X     | $F784
    .byte $70 ; | XXX    | $F785
    .byte $30 ; |  XX    | $F786
    .byte $38 ; |  XXX   | $F787
    .byte $38 ; |  XXX   | $F788
    .byte $10 ; |   X    | $F789
    .byte $10 ; |   X    | $F78A
    .byte $00 ; |        | $F78B
    .byte $30 ; |  XX    | $F78C
    .byte $10 ; |   X    | $F78D
    .byte $00 ; |        | $F78E
    .byte $80 ; |X       | $F78F
    .byte $7C ; | XXXXX  | $F790
    .byte $7C ; | XXXXX  | $F791
    .byte $7C ; | XXXXX  | $F792
    .byte $7C ; | XXXXX  | $F793
    .byte $6C ; | XX XX  | $F794
    .byte $EC ; |XXX XX  | $F795
    .byte $CC ; |XX  XX  | $F796
    .byte $CC ; |XX  XX  | $F797
    .byte $CC ; |XX  XX  | $F798
    .byte $CC ; |XX  XX  | $F799
    .byte $0C ; |    XX  | $F79A
    .byte $0C ; |    XX  | $F79B
    .byte $00 ; |        | $F79C
Unicycle:
    .byte $00 ; |        | $F79D   wheel
    .byte $24 ; |  X  X  | $F79E
    .byte $64 ; | XX  X  | $F79F
    .byte $26 ; |  X  XX | $F7A0
    .byte $E6 ; |XXX  XX | $F7A1
    .byte $67 ; | XX  XXX| $F7A2
    .byte $C2 ; |XX    X | $F7A3
    .byte $77 ; | XXX XXX| $F7A4
    .byte $FE ; |XXXXXXX | $F7A5
    .byte $3E ; |  XXXXX | $F7A6
    .byte $7C ; | XXXXX  | $F7A7
    .byte $1C ; |   XXX  | $F7A8
    .byte $10 ; |   X    | $F7A9
ClownFour:
    .byte $00 ; |        | $F7AA
    .byte $60 ; | XX     | $F7AB
    .byte $70 ; | XXX    | $F7AC
    .byte $30 ; |  XX    | $F7AD
    .byte $38 ; |  XXX   | $F7AE
    .byte $3C ; |  XXXX  | $F7AF
    .byte $10 ; |   X    | $F7B0
    .byte $30 ; |  XX    | $F7B1
    .byte $78 ; | XXXX   | $F7B2
    .byte $7C ; | XXXXX  | $F7B3
    .byte $7C ; | XXXXX  | $F7B4
    .byte $7C ; | XXXXX  | $F7B5
    .byte $7C ; | XXXXX  | $F7B6
    .byte $3C ; |  XXXX  | $F7B7
    .byte $B8 ; |X XXX   | $F7B8
    .byte $78 ; | XXXX   | $F7B9
    .byte $7C ; | XXXXX  | $F7BA
    .byte $7E ; | XXXXXX | $F7BB
    .byte $7F ; | XXXXXXX| $F7BC
    .byte $37 ; |  XX XXX| $F7BD
    .byte $33 ; |  XX  XX| $F7BE
    .byte $33 ; |  XX  XX| $F7BF
    .byte $33 ; |  XX  XX| $F7C0
    .byte $37 ; |  XX XXX| $F7C1
    .byte $38 ; |  XXX   | $F7C2
    .byte $30 ; |  XX    | $F7C3
    .byte $08 ; |    X   | $F7C4
ClownFive:
    .byte $00 ; |        | $F7C5
    .byte $60 ; | XX     | $F7C6
    .byte $70 ; | XXX    | $F7C7
    .byte $30 ; |  XX    | $F7C8
    .byte $38 ; |  XXX   | $F7C9
    .byte $38 ; |  XXX   | $F7CA
    .byte $10 ; |   X    | $F7CB
    .byte $30 ; |  XX    | $F7CC
    .byte $78 ; | XXXX   | $F7CD
    .byte $7C ; | XXXXX  | $F7CE
    .byte $7C ; | XXXXX  | $F7CF
    .byte $7C ; | XXXXX  | $F7D0
    .byte $3C ; |  XXXX  | $F7D1
    .byte $BC ; |X XXXX  | $F7D2
    .byte $7C ; | XXXXX  | $F7D3
    .byte $7C ; | XXXXX  | $F7D4
    .byte $7E ; | XXXXXX | $F7D5
    .byte $7E ; | XXXXXX | $F7D6
    .byte $3E ; |  XXXXX | $F7D7
    .byte $7E ; | XXXXXX | $F7D8
    .byte $76 ; | XXX XX | $F7D9
    .byte $66 ; | XX  XX | $F7DA
    .byte $66 ; | XX  XX | $F7DB
    .byte $66 ; | XX  XX | $F7DC
    .byte $7E ; | XXXXXX | $F7DD
    .byte $08 ; |    X   | $F7DE
    .byte $10 ; |   X    | $F7DF
ClownSix:
    .byte $00 ; |        | $F7E0
    .byte $20 ; |  X     | $F7E1
    .byte $70 ; | XXX    | $F7E2
    .byte $30 ; |  XX    | $F7E3
    .byte $38 ; |  XXX   | $F7E4
    .byte $38 ; |  XXX   | $F7E5
    .byte $10 ; |   X    | $F7E6
    .byte $30 ; |  XX    | $F7E7
    .byte $78 ; | XXXX   | $F7E8
    .byte $7C ; | XXXXX  | $F7E9
    .byte $7C ; | XXXXX  | $F7EA
    .byte $7C ; | XXXXX  | $F7EB
    .byte $BC ; |X XXXX  | $F7EC
    .byte $7C ; | XXXXX  | $F7ED
    .byte $7C ; | XXXXX  | $F7EE
    .byte $7C ; | XXXXX  | $F7EF
    .byte $7C ; | XXXXX  | $F7F0
    .byte $6C ; | XX XX  | $F7F1
    .byte $EC ; |XXX XX  | $F7F2
    .byte $CC ; |XX  XX  | $F7F3
    .byte $CC ; |XX  XX  | $F7F4
    .byte $CC ; |XX  XX  | $F7F5
    .byte $CC ; |XX  XX  | $F7F6
LF7F7:
    .byte $EC ; |XXX XX  | $F7F7
    .byte $1C ; |   XXX  | $F7F8
    .byte $0C ; |    XX  | $F7F9
    .byte $08 ; |    X   | $F7FA
    .byte $3C ; |  XXXX  | $F7FB
    .byte $32 ; |  XX  X | $F7FC
    .byte $2D ; |  X XX X| $F7FD
    .byte $2D ; |  X XX X| $F7FE
    .byte $1E ; |   XXXX | $F7FF
    .byte $1E ; |   XXXX | $F800
LF801:
    .byte <ClownOne      ; $F801
    .byte <ClownTwo      ; $F802
    .byte <ClownThree    ; $F803
    .byte <ClownTwo      ; $F804
LF805:
    .byte <ClownFour     ; $F805
    .byte <ClownFive     ; $F806
    .byte <ClownSix      ; $F807
    .byte <ClownFive     ; $F808

    .byte $00 ; |        | $F809
    .byte $00 ; |        | $F80A
    .byte $00 ; |        | $F80B
    .byte $00 ; |        | $F80C
    .byte $18 ; |   XX   | $F80D
    .byte $3C ; |  XXXX  | $F80E
    .byte $7E ; | XXXXXX | $F80F
    .byte $99 ; |X  XX  X| $F810
    .byte $DD ; |XX XXX X| $F811
    .byte $99 ; |X  XX  X| $F812
    .byte $E7 ; |XXX  XXX| $F813
    .byte $7E ; | XXXXXX | $F814
    .byte $2A ; |  X X X | $F815
    .byte $55 ; | X X X X| $F816
    .byte $3E ; |  XXXXX | $F817
    .byte $1C ; |   XXX  | $F818
    .byte $00 ; |        | $F819
    .byte $00 ; |        | $F81A
    .byte $C3 ; |XX    XX| $F81B
    .byte $42 ; | X    X | $F81C
    .byte $66 ; | XX  XX | $F81D
    .byte $24 ; |  X  X  | $F81E
    .byte $3C ; |  XXXX  | $F81F
    .byte $7E ; | XXXXXX | $F820
    .byte $FF ; |XXXXXXXX| $F821
    .byte $FF ; |XXXXXXXX| $F822
    .byte $FF ; |XXXXXXXX| $F823
    .byte $E7 ; |XXX  XXX| $F824
    .byte $7E ; | XXXXXX | $F825
    .byte $3C ; |  XXXX  | $F826
LF827:
    .byte $3C ; |  XXXX  | $F827
    .byte $3E ; |  XXXXX | $F828
    .byte $1C ; |   XXX  | $F829
    .byte $00 ; |        | $F82A
    .byte $05 ; |     X X| $F82B
    .byte $07 ; |     XXX| $F82C
    .byte $10 ; |   X    | $F82D
LF82E:
    .byte $15 ; |   X X X| $F82E
    .byte $30 ; |  XX    | $F82F
    .byte $50 ; | X X    | $F830
    .byte $75 ; | XXX X X| $F831
    .byte $00 ; |        | $F832
    .byte $50 ; | X X    | $F833
    .byte $00 ; |        | $F834
LF835:
    .byte $00 ; |        | $F835
    .byte $00 ; |        | $F836
    .byte $00 ; |        | $F837
    .byte $00 ; |        | $F838
    .byte $10 ; |   X    | $F839
LF83A:
    .byte $10 ; |   X    | $F83A
    .byte $10 ; |   X    | $F83B
    .byte $10 ; |   X    | $F83C
    .byte $10 ; |   X    | $F83D
    .byte $10 ; |   X    | $F83E
    .byte $25 ; |  X  X X| $F83F
    .byte $25 ; |  X  X X| $F840
    .byte $25 ; |  X  X X| $F841
    .byte $25 ; |  X  X X| $F842
    .byte $25 ; |  X  X X| $F843
LF844:
    .byte $44 ; | X   X  | $F844
    .byte $86 ; |X    XX | $F845
    .byte $06 ; |     XX | $F846
    .byte $84 ; |X    X  | $F847
    .byte $04 ; |     X  | $F848

LF849:  ; indirect jump, coming from bank 0
    ldx    #$FF                  ; 2
    txs                          ; 2
    lda    #$DE                  ; 2
    sta    $82                   ; 3
    lda    $C2                   ; 3
    and    #$47                  ; 2
    ora    #$80                  ; 2
    sta    $C2                   ; 3
    and    #$03                  ; 2
    tay                          ; 2
    lda    LFB22,Y               ; 4
    sta    $9A                   ; 3
    lda    #$0A                  ; 2
    sta    $93                   ; 3
    inx                          ; 2
    stx    $C8                   ; 3
    stx    $C9                   ; 3
    stx    $CA                   ; 3
    stx    $CB                   ; 3
    stx    CTRLPF                ; 3
    stx    $92                   ; 3
    stx    $C1                   ; 3
    stx    $DB                   ; 3
    stx    $DF                   ; 3
    stx    $DC                   ; 3
    stx    $E0                   ; 3
    inx                          ; 2
    stx    $94                   ; 3
    stx    $E1                   ; 3
    lda    #0                    ; 2
    sta    $D2                   ; 3
LF884:
    lda    #$8A                  ; 2
    sta    $80                   ; 3
    lda    #$91                  ; 2
    sta    $81                   ; 3
    jsr    LFFF0                 ; 6
    tya                          ; 2
    beq    LF895                 ; 2³
    jmp    LF9A7                 ; 3

LF895:
    dec    $DB                   ; 5
    bpl    LF8A3                 ; 2³
    lda    #$59                  ; 2
    sta    $DB                   ; 3
    lda    $DF                   ; 3
    eor    #$01                  ; 2
    sta    $DF                   ; 3
LF8A3:
    dec    $DC                   ; 5
    bpl    LF8B7                 ; 2³
    lda    #$0F                  ; 2
    sta    $DC                   ; 3
    inc    $E0                   ; 5
    lda    $E0                   ; 3
    cmp    #6                    ; 2
    bne    LF8B7                 ; 2³
    lda    #0                    ; 2
    sta    $E0                   ; 3
LF8B7:
    dec    $CA                   ; 5
    bpl    LF8C6                 ; 2³
    lda    #4                    ; 2
    sta    $CA                   ; 3
    lda    $C9                   ; 3
    clc                          ; 2
    adc    #1                    ; 2
    sta    $C9                   ; 3
LF8C6:
    dec    $CB                   ; 5
    bpl    LF8E4                 ; 2³
    lda    #$2C                  ; 2
    sta    $CB                   ; 3
    ldx    #$0E                  ; 2
    lda    $E1                   ; 3
    eor    #$01                  ; 2
    sta    $E1                   ; 3
    beq    LF8DD                 ; 2³
    lda    #$72                  ; 2
    jmp    LF8E0                 ; 3

LF8DD:
    txa                          ; 2
    ldx    #$32                  ; 2
LF8E0:
    sta    $D0                   ; 3
    stx    $D1                   ; 3
LF8E4:
    lda    $D2                   ; 3
    sta    COLUBK                ; 3
LF8E8:
    lda    INTIM                 ; 4
    bne    LF8E8                 ; 2³
    lda    #$E4                  ; 2
    sta    TIM64T                ; 4
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    lda    #$4E                  ; 2
    sta    $80                   ; 3
    lda    #$93                  ; 2
    sta    $81                   ; 3
    jsr    LFFF0                 ; 6
    ldx    #7                    ; 2
LF905:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LF905                 ; 2³
    lda    #0                    ; 2
    sta    $E2                   ; 3
    lda    #1                    ; 2
    sta    $DA                   ; 3
LF912:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    $DA                   ; 3
    lda.wy $D0,Y                 ; 4
    sta    COLUPF                ; 3
    sta    COLUP0                ; 3
    lda    LFB33,Y               ; 4
    sta    $D9                   ; 3
    lda    LFB31,Y               ; 4
    sta    $B1                   ; 3
    ldx    #0                    ; 2
    jsr    LF67D                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    $E2                   ; 3
    ldy    LFB35,X               ; 4
LF935:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    PF0                   ; 3
    lda    LFB46,X               ; 4
    sta    PF1                   ; 3
    lda    LFB56,X               ; 4
    sta    PF2                   ; 3
    cpx    $D9                   ; 3
    bne    LF951                 ; 2³
    lda    LFB95,Y               ; 4
    sta    GRP0                  ; 3
    jmp    LF957                 ; 3

LF951:
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    nop                          ; 2
    nop                          ; 2
LF957:
    lda    LFB66,X               ; 4
    sta    PF0                   ; 3
    lda    LFB76,X               ; 4
    sta    PF1                   ; 3
    lda    LFB86,X               ; 4
    sta    PF2                   ; 3
    dey                          ; 2
    bne    LF935                 ; 2³
    inx                          ; 2
    ldy    LFB35,X               ; 4
    bne    LF935                 ; 2³
    lda    #0                    ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    dec    $DA                   ; 5
    bmi    LF99C                 ; 2³
    inx                          ; 2
    stx    $E2                   ; 3
    ldy    $E0                   ; 3
    lda    LFB9C,Y               ; 4
    tay                          ; 2
    ldx    #7                    ; 2
LF986:
    lda    LFBA2,Y               ; 4
    sta    $84,X                 ; 4
    dey                          ; 2
    dex                          ; 2
    bpl    LF986                 ; 2³
    jsr    LFA85                 ; 6
    jsr    LFAAC                 ; 6
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jmp    LF912                 ; 3

LF99C:
    lda    #$60                  ; 2
    sta    $80                   ; 3
    lda    #$99                  ; 2
    sta    $81                   ; 3
    jsr    LFFF0                 ; 6
LF9A7:
    sta    WSYNC                 ; 3
;---------------------------------------
LF9A9:
    lda    INTIM                 ; 4
    bne    LF9A9                 ; 2³
    lda    #$23                  ; 2
    sta    TIM64T                ; 4
    lda    #2                    ; 2
    sta    VBLANK                ; 3
    lda    #$5A                  ; 2
    sta    $80                   ; 3
    lda    #$99                  ; 2
    sta    $81                   ; 3
    jsr    LFFF0                 ; 6
    lda    SWCHB                 ; 4
    eor    #$FF                  ; 2
    and    #$0B                  ; 2
    tax                          ; 2
    and    #$03                  ; 2
    beq    LFA0B                 ; 2³+1
    and    #$02                  ; 2
    bne    LF9EF                 ; 2³
LF9D2:
    stx    $91                   ; 3
    ldy    $97                   ; 3
    lda    LFB2C,Y               ; 4
    sta    $96                   ; 3
    lda    #0                    ; 2
    sta    $C4                   ; 3
LF9DF:
    lda    INTIM                 ; 4
    bne    LF9DF                 ; 2³
    lda    #$30                  ; 2
    sta    $80                   ; 3
    lda    #$91                  ; 2
    sta    $81                   ; 3
    jmp    LFFF0                 ; 3

LF9EF:
    and    $91                   ; 3
    beq    LF9F7                 ; 2³
    dec    $95                   ; 5
    bpl    LFA0B                 ; 2³+1
LF9F7:
    inc    $97                   ; 5
    lda    $97                   ; 3
    cmp    #5                    ; 2
    bcc    LFA03                 ; 2³+1
    lda    #0                    ; 2
    sta    $97                   ; 3
LFA03:
    lda    #$1E                  ; 2
    sta    $95                   ; 3
    lda    #$0A                  ; 2
    sta    $93                   ; 3
LFA0B:
    stx    $91                   ; 3
    lda    $C1                   ; 3
    bne    LFA2E                 ; 2³
    lda    SWCHA                 ; 4
    and    #$10                  ; 2
    tax                          ; 2
    beq    LFA29                 ; 2³
    eor    $90                   ; 3
    beq    LFA29                 ; 2³
    lda    #$0A                  ; 2
    sta    $93                   ; 3
    lda    #$0C                  ; 2
    sta    $9A                   ; 3
    lda    #$80                  ; 2
    sta    $C1                   ; 3
LFA29:
    stx    $90                   ; 3
    jmp    LFA44                 ; 3

LFA2E:
    and    #$20                  ; 2
    beq    LFA38                 ; 2³
    jsr    LFAE1                 ; 6
    jmp    LFA44                 ; 3

LFA38:
    lda    $C1                   ; 3
    and    #$10                  ; 2
    beq    LFA44                 ; 2³
    lda    $D4                   ; 3
    bmi    LF9D2                 ; 2³+1
    sta    $97                   ; 3
LFA44:
    lda    $93                   ; 3
    bne    LFA7D                 ; 2³
    lda    $C2                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    cpx    #6                    ; 2
    bcc    LFA53                 ; 2³
    ldx    #0                    ; 2
LFA53:
    stx    $B3                   ; 3
    lda    LFB26,X               ; 4
    sta    $9A                   ; 3
    inx                          ; 2
    stx    $B4                   ; 3
    lda    $C2                   ; 3
    and    #$40                  ; 2
    ora    #$20                  ; 2
    ora    $B4                   ; 3
    sta    $C2                   ; 3
    inc    $B4                   ; 5
    lda    #$0A                  ; 2
    sta    $93                   ; 3
LFA6D:
    lda    INTIM                 ; 4
    bne    LFA6D                 ; 2³
    lda    #$68                  ; 2
    sta    $80                   ; 3
    lda    #$91                  ; 2
    sta    $81                   ; 3
    jmp    LFFF0                 ; 3

LFA7D:
    lda    INTIM                 ; 4
    bne    LFA7D                 ; 2³
    jmp    LF884                 ; 3

LFA85:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    lda    #1                    ; 2
    sta    NUSIZ1                ; 3
    lda    #$E0                  ; 2
    sta    HMP0                  ; 3
    sta    HMP1                  ; 3
    ldx    #0                    ; 2
    stx    REFP0                 ; 3
    stx    REFP1                 ; 3
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    nop                          ; 2
    nop                          ; 2
    sta    RESP0                 ; 3
    nop                          ; 2
    nop                          ; 2
    sta    RESP1,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    rts                          ; 6

LFAAC:
    lda    #$1A                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldy    #$2C                  ; 2
LFAB4:
    sta    WSYNC                 ; 3
;---------------------------------------
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    SC_00|READ,Y          ; 4
    sta    GRP0                  ; 3
    lda    ($86),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($8A),Y               ; 5
    tax                          ; 2
    lda    ($88),Y               ; 5
    sta    $E3                   ; 3
    lda    ($84),Y               ; 5
    sta    GRP0                  ; 3
    lda    $E3                   ; 3
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    dey                          ; 2
    bpl    LFAB4                 ; 2³
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    rts                          ; 6

LFAE1:
    lda    $D6                   ; 3
    cmp    #$46                  ; 2
    bcc    LFB1B                 ; 2³+1
    cmp    #$73                  ; 2
    bcs    LFB1B                 ; 2³+1
    sec                          ; 2
    sbc    #$46                  ; 2
    sta    $D7                   ; 3
    lda    $D3                   ; 3
    cmp    #$33                  ; 2
    bcc    LFB1B                 ; 2³+1
    cmp    #$63                  ; 2
    bcs    LFB1B                 ; 2³+1
    cmp    #$43                  ; 2
    bcs    LFB10                 ; 2³+1
    cmp    #$3B                  ; 2
    bcs    LFB1B                 ; 2³
    lda    $D7                   ; 3
    ldx    #0                    ; 2
LFB06:
    cmp    #9                    ; 2
    bcc    LFB12                 ; 2³
    sbc    #9                    ; 2
    inx                          ; 2
    jmp    LFB06                 ; 3

LFB10:
    ldx    #$FF                  ; 2
LFB12:
    stx    $D4                   ; 3
    lda    #$30                  ; 2
    eor    $C1                   ; 3
    sta    $C1                   ; 3
    rts                          ; 6

LFB1B:
    lda    $C1                   ; 3
    and    #$4F                  ; 2
    sta    $C1                   ; 3
    rts                          ; 6

LFB22:
    .byte $04 ; |     X  | $FB22
    .byte $24 ; |  X  X  | $FB23
    .byte $25 ; |  X  X X| $FB24
    .byte $24 ; |  X  X  | $FB25
LFB26:
    .byte $05 ; |     X X| $FB26
    .byte $06 ; |     XX | $FB27
    .byte $07 ; |     XXX| $FB28
    .byte $05 ; |     X X| $FB29
    .byte $06 ; |     XX | $FB2A
    .byte $07 ; |     XXX| $FB2B
LFB2C:
    .byte $00 ; |        | $FB2C
    .byte $02 ; |      X | $FB2D
    .byte $04 ; |     X  | $FB2E
    .byte $07 ; |     XXX| $FB2F
    .byte $0B ; |    X XX| $FB30
LFB31:
    .byte $64 ; | XX  X  | $FB31
    .byte $9D ; |X  XXX X| $FB32
LFB33:
    .byte $0B ; |    X XX| $FB33
    .byte $03 ; |      XX| $FB34
LFB35:
    .byte $06 ; |     XX | $FB35
    .byte $04 ; |     X  | $FB36
    .byte $04 ; |     X  | $FB37
    .byte $06 ; |     XX | $FB38
    .byte $0C ; |    XX  | $FB39
    .byte $06 ; |     XX | $FB3A
    .byte $04 ; |     X  | $FB3B
    .byte $06 ; |     XX | $FB3C
    .byte $00 ; |        | $FB3D
    .byte $06 ; |     XX | $FB3E
    .byte $02 ; |      X | $FB3F
    .byte $06 ; |     XX | $FB40
    .byte $05 ; |     X X| $FB41
    .byte $05 ; |     X X| $FB42
    .byte $03 ; |      XX| $FB43
    .byte $06 ; |     XX | $FB44
    .byte $00 ; |        | $FB45

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      XXXX X           X
;      X    X          XXX
;      X    X           X  X        X
;      XXXX XXX XXX XXX X    X X XXX
;        XX X X X X X X X  X X X X X
;      XXXX X X XXX XXX XX X X X XXX
;                                  X
;                                XXX
;
;         XXX                X
;         X X                X
;         X X  X  XXX XXX  XXX XXX
;        XXXXX X  X   X X  X X X X
;        XX XX X  X   X X  X X XXX
;        XX XX X  X   X X  X X X
;        XX XX X  XXX XXXX XXX XXX
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFB46:
    .byte $7A ; | XXXX X | $FB46   PF1
    .byte $42 ; | X    X | $FB47
    .byte $42 ; | X    X | $FB48
    .byte $7B ; | XXXX XX| $FB49
    .byte $1A ; |   XX X | $FB4A
    .byte $7A ; | XXXX X | $FB4B
    .byte $00 ; |        | $FB4C
    .byte $00 ; |        | $FB4D
    .byte $00 ; |        | $FB4E
    .byte $0E ; |    XXX | $FB4F
    .byte $0A ; |    X X | $FB50
    .byte $0A ; |    X X | $FB51
    .byte $1F ; |   XXXXX| $FB52
    .byte $1B ; |   XX XX| $FB53
    .byte $1B ; |   XX XX| $FB54
    .byte $1B ; |   XX XX| $FB55
LFB56:
    .byte $00 ; |        | $FB56   PF2  (reversed)
    .byte $00 ; |        | $FB57
    .byte $00 ; |        | $FB58
    .byte $DD ; |XX XXX X| $FB59
    .byte $55 ; | X X X X| $FB5A
    .byte $DD ; |XX XXX X| $FB5B
    .byte $00 ; |        | $FB5C
    .byte $00 ; |        | $FB5D
    .byte $00 ; |        | $FB5E
    .byte $00 ; |        | $FB5F
    .byte $00 ; |        | $FB60
    .byte $72 ; | XXX  X | $FB61
    .byte $12 ; |   X  X | $FB62
    .byte $12 ; |   X  X | $FB63
    .byte $12 ; |   X  X | $FB64
    .byte $72 ; | XXX  X | $FB65
LFB66:
    .byte $40 ; | X      | $FB66   PF0  (reversed)
    .byte $E0 ; |XXX     | $FB67
    .byte $40 ; | X      | $FB68
    .byte $50 ; | X X    | $FB69
    .byte $50 ; | X X    | $FB6A
    .byte $D0 ; |XX X    | $FB6B
    .byte $00 ; |        | $FB6C
    .byte $00 ; |        | $FB6D
    .byte $00 ; |        | $FB6E
    .byte $00 ; |        | $FB6F
    .byte $00 ; |        | $FB70
    .byte $70 ; | XXX    | $FB71
    .byte $50 ; | X X    | $FB72
    .byte $50 ; | X X    | $FB73
    .byte $50 ; | X X    | $FB74
    .byte $F0 ; |XXXX    | $FB75
LFB76:
    .byte $00 ; |        | $FB76   PF1
    .byte $00 ; |        | $FB77
    .byte $40 ; | X      | $FB78
    .byte $15 ; |   X X X| $FB79
    .byte $55 ; | X X X X| $FB7A
    .byte $55 ; | X X X X| $FB7B
    .byte $00 ; |        | $FB7C
    .byte $01 ; |       X| $FB7D
    .byte $00 ; |        | $FB7E
    .byte $10 ; |   X    | $FB7F
    .byte $10 ; |   X    | $FB80
    .byte $77 ; | XXX XXX| $FB81
    .byte $55 ; | X X X X| $FB82
    .byte $57 ; | X X XXX| $FB83
    .byte $54 ; | X X X  | $FB84
    .byte $77 ; | XXX XXX| $FB85
LFB86:
    .byte $00 ; |        | $FB86   PF2  (reversed)
    .byte $00 ; |        | $FB87
    .byte $04 ; |     X  | $FB88
    .byte $03 ; |      XX| $FB89
    .byte $02 ; |      X | $FB8A
    .byte $03 ; |      XX| $FB8B
    .byte $02 ; |      X | $FB8C
    .byte $03 ; |      XX| $FB8D
    .byte $00 ; |        | $FB8E
    .byte $00 ; |        | $FB8F
    .byte $00 ; |        | $FB90
    .byte $00 ; |        | $FB91
    .byte $00 ; |        | $FB92
    .byte $00 ; |        | $FB93
    .byte $00 ; |        | $FB94
LFB95:
    .byte $00 ; |        | $FB95   shared
    .byte $FF ; |XXXXXXXX| $FB96
    .byte $7F ; | XXXXXXX| $FB97   drawed with GRP0,
    .byte $3F ; |  XXXXXX| $FB98   this makes up part of the "n" in shooting and "r" in arcade
    .byte $1F ; |   XXXXX| $FB99
    .byte $0F ; |    XXXX| $FB9A
    .byte $07 ; |     XXX| $FB9B



;             frame 1                          frame 2                          frame 3                          frame 4                          frame 5                          frame 6
;                                                                                                                                            (same as frame 3)                (same as frame 2)
;
;  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;  X X X X X X X X X X X X X X X X  X X X X X X X X X X X X X X X X  X X X X X X X X X X X X X X X X  X X X X X X X X X X X X X X X X  X X X X X X X X X X X X X X X X  X X X X X X X X X X X X X X X X
;  X X X X X X X X X X X X X X X X  X X X X X X X X X X X X X X X X  X X X X X X X X X X X X X X X X  X X X X X X X X X X X X X X X X  X X X X X X X X X X X X X X X X  X X X X X X X X X X X X X X X X
;  XXX                         XXX  XXX                         XXX  XXX                         XXX  XXX                         XXX  XXX                         XXX  XXX                         XXX
;  XXX                         XXX  XXX                         XXX  XXX                         XXX  XXX                         XXX  XXX                         XXX  XXX                         XXX
;  XX   X   X   X   X   X   X   XX  XX   X   X   X   X   X   X   XX  XX   X   X   X   X   X   X   XX  XX   X   X   X   X   X   X   XX  XX   X   X   X   X   X   X   XX  XX   X   X   X   X   X   X   XX
;  XX  XX   XX XX   XX XX   XX  XX  XX  XX   XX XX   XX XX   XX  XX  XX   XX XX   XX XX   XX XX   XX  XX   XX XX   XX XX   XX XX   XX  XX   XX XX   XX XX   XX XX   XX  XX  XX   XX XX   XX XX   XX  XX
;  XX   XX XX   XX XX   XX XX   XX  XX   XX XX   XX XX   XX XX   XX  XX  XX   XX XX   XX XX   XX  XX  XX  XX   XX XX   XX XX   XX  XX  XX  XX   XX XX   XX XX   XX  XX  XX   XX XX   XX XX   XX XX   XX
;  XX   XX XX   XX XX   XX XX   XX  XX   XX XX   XX XX   XX XX   XX  XX  XX   XX XX   XX XX   XX  XX  XX  XX   XX XX   XX XX   XX  XX  XX  XX   XX XX   XX XX   XX  XX  XX   XX XX   XX XX   XX XX   XX
;  XX                           XX  XX                           XX  XX                           XX  XX                           XX  XX                           XX  XX                           XX
;  XX XXXXXXXXXXXXXXXXXXXXXXXXX XX  XX XXXXXXXXXXXXXXXXXXXXXXXXX XX  XX XXXXXXXXXXXXXXXXXXXXXXXXX XX  XX XXXXXXXXXXXXXXXXXXXXXXXXX XX  XX XXXXXXXXXXXXXXXXXXXXXXXXX XX  XX XXXXXXXXXXXXXXXXXXXXXXXXX XX
;  XX                           XX  XX                           XX  XX                           XX  XX                           XX  XX                           XX  XX                           XX
;  XX                           XX  XX                           XX  XX                           XX  XX                           XX  XX                           XX  XX                           XX
;  XX   X   X   X   X   X       XX  XX    X   X   X   X   X      XX  XX     X   X   X   X   X     XX  XX      X   X   X   X   X    XX  XX     X   X   X   X   X     XX  XX    X   X   X   X   X      XX
;  XX   X   X   X   X   X       XX  XX    X   X   X   X   X      XX  XX     X   X   X   X   X     XX  XX      X   X   X   X   X    XX  XX     X   X   X   X   X     XX  XX    X   X   X   X   X      XX
;  XX   X   X   X   X   X       XX  XX    X   X   X   X   X      XX  XX     X   X   X   X   X     XX  XX      X   X   X   X   X    XX  XX     X   X   X   X   X     XX  XX    X   X   X   X   X      XX
;  XX  XXX XXX XXX XXX XXX      XX  XX   XXX XXX XXX XXX XXX     XX  XX    XXX XXX XXX XXX XXX    XX  XX     XXX XXX XXX XXX XXX   XX  XX    XXX XXX XXX XXX XXX    XX  XX   XXX XXX XXX XXX XXX     XX
;  XX  XXX XXX XXX XXX XXX      XX  XX   XXX XXX XXX XXX XXX     XX  XX    XXX XXX XXX XXX XXX    XX  XX     XXX XXX XXX XXX XXX   XX  XX    XXX XXX XXX XXX XXX    XX  XX   XXX XXX XXX XXX XXX     XX
;  XX  XXX XXX XXX XXX XXX      XX  XX   XXX XXX XXX XXX XXX     XX  XX    XXX XXX XXX XXX XXX    XX  XX     XXX XXX XXX XXX XXX   XX  XX    XXX XXX XXX XXX XXX    XX  XX   XXX XXX XXX XXX XXX     XX
;  XX  XXX XXX XXX XXX XXX      XX  XX   XXX XXX XXX XXX XXX     XX  XX    XXX XXX XXX XXX XXX    XX  XX     XXX XXX XXX XXX XXX   XX  XX    XXX XXX XXX XXX XXX    XX  XX   XXX XXX XXX XXX XXX     XX
;  XX  XXX XXX XXX XXX XXX      XX  XX   XXX XXX XXX XXX XXX     XX  XX    XXX XXX XXX XXX XXX    XX  XX     XXX XXX XXX XXX XXX   XX  XX    XXX XXX XXX XXX XXX    XX  XX   XXX XXX XXX XXX XXX     XX
;  XX  XXX XXX XXX XXX XXX      XX  XX   XXX XXX XXX XXX XXX     XX  XX    XXX XXX XXX XXX XXX    XX  XX     XXX XXX XXX XXX XXX   XX  XX    XXX XXX XXX XXX XXX    XX  XX   XXX XXX XXX XXX XXX     XX
;  XX  XXX XXX XXX XXX XXX      XX  XX   XXX XXX XXX XXX XXX     XX  XX    XXX XXX XXX XXX XXX    XX  XX     XXX XXX XXX XXX XXX   XX  XX    XXX XXX XXX XXX XXX    XX  XX   XXX XXX XXX XXX XXX     XX
;  XX                           XX  XX                           XX  XX                           XX  XX                           XX  XX                           XX  XX                           XX
;  XX XXXXXXXXXXXXXXXXXXXXXXXXX XX  XX XXXXXXXXXXXXXXXXXXXXXXXXX XX  XX XXXXXXXXXXXXXXXXXXXXXXXXX XX  XX XXXXXXXXXXXXXXXXXXXXXXXXX XX  XX XXXXXXXXXXXXXXXXXXXXXXXXX XX  XX XXXXXXXXXXXXXXXXXXXXXXXXX XX
;  XX                           XX  XX                           XX  XX                           XX  XX                           XX  XX                           XX  XX                           XX
;  XX                           XX  XX                           XX  XX                           XX  XX                           XX  XX                           XX  XX                           XX
;  XX   XXXX XXX  XX  XXX  XXX  XX  XX   XXXX XXX  XX  XXX  XXX  XX  XX   XXXX XXX  XX  XXX  XXX  XX  XX   XXXX XXX  XX  XXX  XXX  XX  XX   XXXX XXX  XX  XXX  XXX  XX  XX   XXXX XXX  XX  XXX  XXX  XX
;  XX   X     X  X  X X  X  X   XX  XX   X     X  X  X X  X  X   XX  XX   X     X  X  X X  X  X   XX  XX   X     X  X  X X  X  X   XX  XX   X     X  X  X X  X  X   XX  XX   X     X  X  X X  X  X   XX
;  XX   XXXX  X  XXXX XXX   X   XX  XX   XXXX  X  XXXX XXX   X   XX  XX   XXXX  X  XXXX XXX   X   XX  XX   XXXX  X  XXXX XXX   X   XX  XX   XXXX  X  XXXX XXX   X   XX  XX   XXXX  X  XXXX XXX   X   XX
;  XX      X  X  X  X X  X  X   XX  XX      X  X  X  X X  X  X   XX  XX      X  X  X  X X  X  X   XX  XX      X  X  X  X X  X  X   XX  XX      X  X  X  X X  X  X   XX  XX      X  X  X  X X  X  X   XX
;  XX   XXXX  X  X  X X  X  X   XX  XX   XXXX  X  X  X X  X  X   XX  XX   XXXX  X  X  X X  X  X   XX  XX   XXXX  X  X  X X  X  X   XX  XX   XXXX  X  X  X X  X  X   XX  XX   XXXX  X  X  X X  X  X   XX
;  XX                           XX  XX                           XX  XX                           XX  XX                           XX  XX                           XX  XX                           XX
;  XXX                         XXX  XXX                         XXX  XXX                         XXX  XXX                         XXX  XXX                         XXX  XXX                         XXX
;  XXX                         XXX  XXX                         XXX  XXX                         XXX  XXX                         XXX  XXX                         XXX  XXX                         XXX
;  X XXXXXXXXXXXXXXXXXXXXXXXXXXX X  X XXXXXXXXXXXXXXXXXXXXXXXXXXX X  X XXXXXXXXXXXXXXXXXXXXXXXXXXX X  X XXXXXXXXXXXXXXXXXXXXXXXXXXX X  X XXXXXXXXXXXXXXXXXXXXXXXXXXX X  X XXXXXXXXXXXXXXXXXXXXXXXXXXX X
;  X XXXXXXXXXXXXXXXXXXXXXXXXXXX X  X XXXXXXXXXXXXXXXXXXXXXXXXXXX X  X XXXXXXXXXXXXXXXXXXXXXXXXXXX X  X XXXXXXXXXXXXXXXXXXXXXXXXXXX X  X XXXXXXXXXXXXXXXXXXXXXXXXXXX X  X XXXXXXXXXXXXXXXXXXXXXXXXXXX X
;  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;
;          ducks outward,                   ducks outward,                   ducks inward,                    ducks inward,                    ducks outward,                   ducks outward,
;         bottles far left                 bottles mid-left                 bottles middle                    bottles right                    bottles middle                  bottles mid-left


LFB9C:
    .byte $07 ; |     XXX| $FB9C   frame 1
    .byte $0F ; |    XXXX| $FB9D   frame 2
    .byte $17 ; |   X XXX| $FB9E   frame 3
    .byte $1F ; |   XXXXX| $FB9F   frame 4
    .byte $27 ; |  X  XXX| $FBA0   frame 5
    .byte $2F ; |  X XXXX| $FBA1   frame 6

LFBA2:
;frame 1 - ducks face outward, bottles start far left
    .byte <DuckBottleOne      ; $FBA2
    .byte >DuckBottleOne      ; $FBA3
    .byte <DuckBottleTwo      ; $FBA4
    .byte >DuckBottleTwo      ; $FBA5
    .byte <DuckBottleThree    ; $FBA6
    .byte >DuckBottleThree    ; $FBA7
    .byte <DuckBottleFour     ; $FBA8
    .byte >DuckBottleFour     ; $FBA9

;frame 2 - ducks face outward, bottles start mid-left
    .byte <DuckBottleFive     ; $FBAA
    .byte >DuckBottleFive     ; $FBAB
    .byte <DuckBottleSix      ; $FBAC
    .byte >DuckBottleSix      ; $FBAD
    .byte <DuckBottleSeven    ; $FBAE
    .byte >DuckBottleSeven    ; $FBAF
    .byte <DuckBottleFour     ; $FBB0
    .byte >DuckBottleFour     ; $FBB1

;frame 3 - ducks face inward, bottles start mid-right
    .byte <DuckBottleEight    ; $FBB2
    .byte >DuckBottleEight    ; $FBB3
    .byte <DuckBottleNine     ; $FBB4
    .byte >DuckBottleNine     ; $FBB5
    .byte <DuckBottleTen      ; $FBB6
    .byte >DuckBottleTen      ; $FBB7
    .byte <DuckBottleEleven   ; $FBB8
    .byte >DuckBottleEleven   ; $FBB9

;frame 4 - ducks face inward, bottles start far right
    .byte <DuckBottleTwelve   ; $FBBA
    .byte >DuckBottleTwelve   ; $FBBB
    .byte <DuckBottleThirteen ; $FBBC
    .byte >DuckBottleThirteen ; $FBBD
    .byte <DuckBottleFourteen ; $FBBE
    .byte >DuckBottleFourteen ; $FBBF
    .byte <DuckBottleFifteen  ; $FBC0
    .byte >DuckBottleFifteen  ; $FBC1

;frame 5 (same as frame 3) - ducks face inward, bottles start mid-right
    .byte <DuckBottleEight    ; $FBC2
    .byte >DuckBottleEight    ; $FBC3
    .byte <DuckBottleNine     ; $FBC4
    .byte >DuckBottleNine     ; $FBC5
    .byte <DuckBottleTen      ; $FBC6
    .byte >DuckBottleTen      ; $FBC7
    .byte <DuckBottleEleven   ; $FBC8
    .byte >DuckBottleEleven   ; $FBC9

;frame 6 (same as frame 2) - ducks face outward, bottles start mid-left
    .byte <DuckBottleFive     ; $FBCA
    .byte >DuckBottleFive     ; $FBCB
    .byte <DuckBottleSix      ; $FBCC
    .byte >DuckBottleSix      ; $FBCD
    .byte <DuckBottleSeven    ; $FBCE
    .byte >DuckBottleSeven    ; $FBCF
    .byte <DuckBottleFour     ; $FBD0
    .byte >DuckBottleFour     ; $FBD1

DuckBottleOne:
    .byte $00 ; |        | $FBD2
    .byte $00 ; |        | $FBD3
    .byte $00 ; |        | $FBD4
    .byte $FF ; |XXXXXXXX| $FBD5
    .byte $FF ; |XXXXXXXX| $FBD6
    .byte $BF ; |X XXXXXX| $FBD7
    .byte $BF ; |X XXXXXX| $FBD8
    .byte $E0 ; |XXX     | $FBD9
    .byte $E0 ; |XXX     | $FBDA
    .byte $C0 ; |XX      | $FBDB
    .byte $C7 ; |XX   XXX| $FBDC
    .byte $C0 ; |XX      | $FBDD
    .byte $C7 ; |XX   XXX| $FBDE
    .byte $C4 ; |XX   X  | $FBDF
    .byte $C7 ; |XX   XXX| $FBE0
    .byte $C0 ; |XX      | $FBE1
    .byte $C0 ; |XX      | $FBE2
    .byte $DF ; |XX XXXXX| $FBE3
    .byte $C0 ; |XX      | $FBE4
    .byte $CE ; |XX  XXX | $FBE5
    .byte $CE ; |XX  XXX | $FBE6
    .byte $CE ; |XX  XXX | $FBE7
    .byte $CE ; |XX  XXX | $FBE8
    .byte $CE ; |XX  XXX | $FBE9
    .byte $CE ; |XX  XXX | $FBEA
    .byte $CE ; |XX  XXX | $FBEB
    .byte $C4 ; |XX   X  | $FBEC
    .byte $C4 ; |XX   X  | $FBED
    .byte $C4 ; |XX   X  | $FBEE
    .byte $C0 ; |XX      | $FBEF
    .byte $C0 ; |XX      | $FBF0
    .byte $DF ; |XX XXXXX| $FBF1
    .byte $C0 ; |XX      | $FBF2
    .byte $C6 ; |XX   XX | $FBF3
    .byte $C6 ; |XX   XX | $FBF4
    .byte $CC ; |XX  XX  | $FBF5
    .byte $C4 ; |XX   X  | $FBF6
    .byte $E0 ; |XXX     | $FBF7
    .byte $E0 ; |XXX     | $FBF8
    .byte $AA ; |X X X X | $FBF9
    .byte $AA ; |X X X X | $FBFA
    .byte $FF ; |XXXXXXXX| $FBFB
    .byte $FF ; |XXXXXXXX| $FBFC
    .byte $00 ; |        | $FBFD
    .byte $00 ; |        | $FBFE
    .byte $00 ; |        | $FBFF
DuckBottleTwo:
    .byte $00 ; |        | $FC00
    .byte $00 ; |        | $FC01
    .byte $00 ; |        | $FC02
    .byte $FF ; |XXXXXXXX| $FC03
    .byte $FF ; |XXXXXXXX| $FC04
    .byte $FF ; |XXXXXXXX| $FC05
    .byte $FF ; |XXXXXXXX| $FC06
    .byte $00 ; |        | $FC07
    .byte $00 ; |        | $FC08
    .byte $00 ; |        | $FC09
    .byte $92 ; |X  X  X | $FC0A
    .byte $92 ; |X  X  X | $FC0B
    .byte $93 ; |X  X  XX| $FC0C
    .byte $12 ; |   X  X | $FC0D
    .byte $B9 ; |X XXX  X| $FC0E
    .byte $00 ; |        | $FC0F
    .byte $00 ; |        | $FC10
    .byte $FF ; |XXXXXXXX| $FC11
    .byte $00 ; |        | $FC12
    .byte $EE ; |XXX XXX | $FC13
    .byte $EE ; |XXX XXX | $FC14
    .byte $EE ; |XXX XXX | $FC15
    .byte $EE ; |XXX XXX | $FC16
    .byte $EE ; |XXX XXX | $FC17
    .byte $EE ; |XXX XXX | $FC18
    .byte $EE ; |XXX XXX | $FC19
    .byte $44 ; | X   X  | $FC1A
    .byte $44 ; | X   X  | $FC1B
    .byte $44 ; | X   X  | $FC1C
    .byte $00 ; |        | $FC1D
    .byte $00 ; |        | $FC1E
    .byte $FF ; |XXXXXXXX| $FC1F
    .byte $00 ; |        | $FC20
    .byte $C6 ; |XX   XX | $FC21
    .byte $C6 ; |XX   XX | $FC22
    .byte $6C ; | XX XX  | $FC23
    .byte $44 ; | X   X  | $FC24
    .byte $00 ; |        | $FC25
    .byte $00 ; |        | $FC26
    .byte $AA ; |X X X X | $FC27
    .byte $AA ; |X X X X | $FC28
    .byte $FF ; |XXXXXXXX| $FC29
    .byte $FF ; |XXXXXXXX| $FC2A
DuckBottleThree:
    .byte $00 ; |        | $FC2B   shared
    .byte $00 ; |        | $FC2C   shared
    .byte $00 ; |        | $FC2D   shared
    .byte $FF ; |XXXXXXXX| $FC2E
    .byte $FF ; |XXXXXXXX| $FC2F
    .byte $FF ; |XXXXXXXX| $FC30
    .byte $FF ; |XXXXXXXX| $FC31
    .byte $00 ; |        | $FC32
    .byte $00 ; |        | $FC33
    .byte $00 ; |        | $FC34
    .byte $52 ; | X X  X | $FC35
    .byte $52 ; | X X  X | $FC36
    .byte $DC ; |XX XXX  | $FC37
    .byte $52 ; | X X  X | $FC38
    .byte $9C ; |X  XXX  | $FC39
    .byte $00 ; |        | $FC3A
    .byte $00 ; |        | $FC3B
    .byte $FF ; |XXXXXXXX| $FC3C
    .byte $00 ; |        | $FC3D
    .byte $EE ; |XXX XXX | $FC3E
    .byte $EE ; |XXX XXX | $FC3F
    .byte $EE ; |XXX XXX | $FC40
    .byte $EE ; |XXX XXX | $FC41
    .byte $EE ; |XXX XXX | $FC42
    .byte $EE ; |XXX XXX | $FC43
    .byte $EE ; |XXX XXX | $FC44
    .byte $44 ; | X   X  | $FC45
    .byte $44 ; | X   X  | $FC46
    .byte $44 ; | X   X  | $FC47
    .byte $00 ; |        | $FC48
    .byte $00 ; |        | $FC49
    .byte $FF ; |XXXXXXXX| $FC4A
    .byte $00 ; |        | $FC4B
    .byte $C6 ; |XX   XX | $FC4C
    .byte $C6 ; |XX   XX | $FC4D
    .byte $6C ; | XX XX  | $FC4E
    .byte $44 ; | X   X  | $FC4F
    .byte $00 ; |        | $FC50
    .byte $00 ; |        | $FC51
    .byte $AA ; |X X X X | $FC52
    .byte $AA ; |X X X X | $FC53
    .byte $FF ; |XXXXXXXX| $FC54
    .byte $FF ; |XXXXXXXX| $FC55
DuckBottleFour:
    .byte $00 ; |        | $FC56   shared
    .byte $00 ; |        | $FC57   shared
    .byte $00 ; |        | $FC58   shared
    .byte $FE ; |XXXXXXX | $FC59
    .byte $FE ; |XXXXXXX | $FC5A
    .byte $FA ; |XXXXX X | $FC5B
    .byte $FA ; |XXXXX X | $FC5C
    .byte $0E ; |    XXX | $FC5D
    .byte $0E ; |    XXX | $FC5E
    .byte $06 ; |     XX | $FC5F
    .byte $46 ; | X   XX | $FC60
    .byte $46 ; | X   XX | $FC61
    .byte $46 ; | X   XX | $FC62
    .byte $46 ; | X   XX | $FC63
    .byte $E6 ; |XXX  XX | $FC64
    .byte $06 ; |     XX | $FC65
    .byte $06 ; |     XX | $FC66
    .byte $F6 ; |XXXX XX | $FC67
    .byte $06 ; |     XX | $FC68
    .byte $06 ; |     XX | $FC69
    .byte $06 ; |     XX | $FC6A
    .byte $06 ; |     XX | $FC6B
    .byte $06 ; |     XX | $FC6C
    .byte $06 ; |     XX | $FC6D
    .byte $06 ; |     XX | $FC6E
    .byte $06 ; |     XX | $FC6F
    .byte $06 ; |     XX | $FC70
    .byte $06 ; |     XX | $FC71
    .byte $06 ; |     XX | $FC72
    .byte $06 ; |     XX | $FC73
    .byte $06 ; |     XX | $FC74
    .byte $F6 ; |XXXX XX | $FC75
    .byte $06 ; |     XX | $FC76
    .byte $C6 ; |XX   XX | $FC77
    .byte $C6 ; |XX   XX | $FC78
    .byte $66 ; | XX  XX | $FC79
    .byte $46 ; | X   XX | $FC7A
    .byte $0E ; |    XXX | $FC7B
    .byte $0E ; |    XXX | $FC7C
    .byte $AA ; |X X X X | $FC7D
    .byte $AA ; |X X X X | $FC7E
    .byte $FE ; |XXXXXXX | $FC7F
    .byte $FE ; |XXXXXXX | $FC80
DuckBottleFive:
    .byte $00 ; |        | $FC81   shared
    .byte $00 ; |        | $FC82   shared
    .byte $00 ; |        | $FC83   shared
    .byte $FF ; |XXXXXXXX| $FC84
    .byte $FF ; |XXXXXXXX| $FC85
    .byte $BF ; |X XXXXXX| $FC86
    .byte $BF ; |X XXXXXX| $FC87
    .byte $E0 ; |XXX     | $FC88
    .byte $E0 ; |XXX     | $FC89
    .byte $C0 ; |XX      | $FC8A
    .byte $C7 ; |XX   XXX| $FC8B
    .byte $C0 ; |XX      | $FC8C
    .byte $C7 ; |XX   XXX| $FC8D
    .byte $C4 ; |XX   X  | $FC8E
    .byte $C7 ; |XX   XXX| $FC8F
    .byte $C0 ; |XX      | $FC90
    .byte $C0 ; |XX      | $FC91
    .byte $DF ; |XX XXXXX| $FC92
    .byte $C0 ; |XX      | $FC93
    .byte $C7 ; |XX   XXX| $FC94
    .byte $C7 ; |XX   XXX| $FC95
    .byte $C7 ; |XX   XXX| $FC96
    .byte $C7 ; |XX   XXX| $FC97
    .byte $C7 ; |XX   XXX| $FC98
    .byte $C7 ; |XX   XXX| $FC99
    .byte $C7 ; |XX   XXX| $FC9A
    .byte $C2 ; |XX    X | $FC9B
    .byte $C2 ; |XX    X | $FC9C
    .byte $C2 ; |XX    X | $FC9D
    .byte $C0 ; |XX      | $FC9E
    .byte $C0 ; |XX      | $FC9F
    .byte $DF ; |XX XXXXX| $FCA0
    .byte $C0 ; |XX      | $FCA1
    .byte $C6 ; |XX   XX | $FCA2
    .byte $C6 ; |XX   XX | $FCA3
    .byte $CC ; |XX  XX  | $FCA4
    .byte $C4 ; |XX   X  | $FCA5
    .byte $E0 ; |XXX     | $FCA6
    .byte $E0 ; |XXX     | $FCA7
    .byte $AA ; |X X X X | $FCA8
    .byte $AA ; |X X X X | $FCA9
    .byte $FF ; |XXXXXXXX| $FCAA
    .byte $FF ; |XXXXXXXX| $FCAB
DuckBottleSix:
    .byte $00 ; |        | $FCAC   shared
    .byte $00 ; |        | $FCAD   shared
    .byte $00 ; |        | $FCAE   shared
    .byte $FF ; |XXXXXXXX| $FCAF
    .byte $FF ; |XXXXXXXX| $FCB0
    .byte $FF ; |XXXXXXXX| $FCB1
    .byte $FF ; |XXXXXXXX| $FCB2
    .byte $00 ; |        | $FCB3
    .byte $00 ; |        | $FCB4
    .byte $00 ; |        | $FCB5
    .byte $92 ; |X  X  X | $FCB6
    .byte $92 ; |X  X  X | $FCB7
    .byte $93 ; |X  X  XX| $FCB8
    .byte $12 ; |   X  X | $FCB9
    .byte $B9 ; |X XXX  X| $FCBA
    .byte $00 ; |        | $FCBB
    .byte $00 ; |        | $FCBC
    .byte $FF ; |XXXXXXXX| $FCBD
    .byte $00 ; |        | $FCBE
    .byte $77 ; | XXX XXX| $FCBF
    .byte $77 ; | XXX XXX| $FCC0
    .byte $77 ; | XXX XXX| $FCC1
    .byte $77 ; | XXX XXX| $FCC2
    .byte $77 ; | XXX XXX| $FCC3
    .byte $77 ; | XXX XXX| $FCC4
    .byte $77 ; | XXX XXX| $FCC5
    .byte $22 ; |  X   X | $FCC6
    .byte $22 ; |  X   X | $FCC7
    .byte $22 ; |  X   X | $FCC8
    .byte $00 ; |        | $FCC9
    .byte $00 ; |        | $FCCA
    .byte $FF ; |XXXXXXXX| $FCCB
    .byte $00 ; |        | $FCCC
    .byte $C6 ; |XX   XX | $FCCD
    .byte $C6 ; |XX   XX | $FCCE
    .byte $6C ; | XX XX  | $FCCF
    .byte $44 ; | X   X  | $FCD0
    .byte $00 ; |        | $FCD1
    .byte $00 ; |        | $FCD2
    .byte $AA ; |X X X X | $FCD3
    .byte $AA ; |X X X X | $FCD4
    .byte $FF ; |XXXXXXXX| $FCD5
    .byte $FF ; |XXXXXXXX| $FCD6
    .byte $00 ; |        | $FCD7
    .byte $00 ; |        | $FCD8
    .byte $00 ; |        | $FCD9


  EMPTY_SPACE 38         ; $FCDA - $FCFF   free bytes


DuckBottleSeven:
    .byte $00 ; |        | $FD00
    .byte $00 ; |        | $FD01
    .byte $00 ; |        | $FD02
    .byte $FF ; |XXXXXXXX| $FD03
    .byte $FF ; |XXXXXXXX| $FD04
    .byte $FF ; |XXXXXXXX| $FD05
    .byte $FF ; |XXXXXXXX| $FD06
    .byte $00 ; |        | $FD07
    .byte $00 ; |        | $FD08
    .byte $00 ; |        | $FD09
    .byte $52 ; | X X  X | $FD0A
    .byte $52 ; | X X  X | $FD0B
    .byte $DC ; |XX XXX  | $FD0C
    .byte $52 ; | X X  X | $FD0D
    .byte $9C ; |X  XXX  | $FD0E
    .byte $00 ; |        | $FD0F
    .byte $00 ; |        | $FD10
    .byte $FF ; |XXXXXXXX| $FD11
    .byte $00 ; |        | $FD12
    .byte $77 ; | XXX XXX| $FD13
    .byte $77 ; | XXX XXX| $FD14
    .byte $77 ; | XXX XXX| $FD15
    .byte $77 ; | XXX XXX| $FD16
    .byte $77 ; | XXX XXX| $FD17
    .byte $77 ; | XXX XXX| $FD18
    .byte $77 ; | XXX XXX| $FD19
    .byte $22 ; |  X   X | $FD1A
    .byte $22 ; |  X   X | $FD1B
    .byte $22 ; |  X   X | $FD1C
    .byte $00 ; |        | $FD1D
    .byte $00 ; |        | $FD1E
    .byte $FF ; |XXXXXXXX| $FD1F
    .byte $00 ; |        | $FD20
    .byte $C6 ; |XX   XX | $FD21
    .byte $C6 ; |XX   XX | $FD22
    .byte $6C ; | XX XX  | $FD23
    .byte $44 ; | X   X  | $FD24
    .byte $00 ; |        | $FD25
    .byte $00 ; |        | $FD26
    .byte $AA ; |X X X X | $FD27
    .byte $AA ; |X X X X | $FD28
    .byte $FF ; |XXXXXXXX| $FD29
    .byte $FF ; |XXXXXXXX| $FD2A
DuckBottleEight:
    .byte $00 ; |        | $FD2B   shared
    .byte $00 ; |        | $FD2C   shared
    .byte $00 ; |        | $FD2D   shared
    .byte $FF ; |XXXXXXXX| $FD2E
    .byte $FF ; |XXXXXXXX| $FD2F
    .byte $BF ; |X XXXXXX| $FD30
    .byte $BF ; |X XXXXXX| $FD31
    .byte $E0 ; |XXX     | $FD32
    .byte $E0 ; |XXX     | $FD33
    .byte $C0 ; |XX      | $FD34
    .byte $C7 ; |XX   XXX| $FD35
    .byte $C0 ; |XX      | $FD36
    .byte $C7 ; |XX   XXX| $FD37
    .byte $C4 ; |XX   X  | $FD38
    .byte $C7 ; |XX   XXX| $FD39
    .byte $C0 ; |XX      | $FD3A
    .byte $C0 ; |XX      | $FD3B
    .byte $DF ; |XX XXXXX| $FD3C
    .byte $C0 ; |XX      | $FD3D
    .byte $C3 ; |XX    XX| $FD3E
    .byte $C3 ; |XX    XX| $FD3F
    .byte $C3 ; |XX    XX| $FD40
    .byte $C3 ; |XX    XX| $FD41
    .byte $C3 ; |XX    XX| $FD42
    .byte $C3 ; |XX    XX| $FD43
    .byte $C3 ; |XX    XX| $FD44
    .byte $C1 ; |XX     X| $FD45
    .byte $C1 ; |XX     X| $FD46
    .byte $C1 ; |XX     X| $FD47
    .byte $C0 ; |XX      | $FD48
    .byte $C0 ; |XX      | $FD49
    .byte $DF ; |XX XXXXX| $FD4A
    .byte $C0 ; |XX      | $FD4B
    .byte $CC ; |XX  XX  | $FD4C
    .byte $CC ; |XX  XX  | $FD4D
    .byte $C6 ; |XX   XX | $FD4E
    .byte $C4 ; |XX   X  | $FD4F
    .byte $E0 ; |XXX     | $FD50
    .byte $E0 ; |XXX     | $FD51
    .byte $AA ; |X X X X | $FD52
    .byte $AA ; |X X X X | $FD53
    .byte $FF ; |XXXXXXXX| $FD54
    .byte $FF ; |XXXXXXXX| $FD55
DuckBottleNine:
    .byte $00 ; |        | $FD56   shared
    .byte $00 ; |        | $FD57   shared
    .byte $00 ; |        | $FD58   shared
    .byte $FF ; |XXXXXXXX| $FD59
    .byte $FF ; |XXXXXXXX| $FD5A
    .byte $FF ; |XXXXXXXX| $FD5B
    .byte $FF ; |XXXXXXXX| $FD5C
    .byte $00 ; |        | $FD5D
    .byte $00 ; |        | $FD5E
    .byte $00 ; |        | $FD5F
    .byte $92 ; |X  X  X | $FD60
    .byte $92 ; |X  X  X | $FD61
    .byte $93 ; |X  X  XX| $FD62
    .byte $12 ; |   X  X | $FD63
    .byte $B9 ; |X XXX  X| $FD64
    .byte $00 ; |        | $FD65
    .byte $00 ; |        | $FD66
    .byte $FF ; |XXXXXXXX| $FD67
    .byte $00 ; |        | $FD68
    .byte $BB ; |X XXX XX| $FD69
    .byte $BB ; |X XXX XX| $FD6A
    .byte $BB ; |X XXX XX| $FD6B
    .byte $BB ; |X XXX XX| $FD6C
    .byte $BB ; |X XXX XX| $FD6D
    .byte $BB ; |X XXX XX| $FD6E
    .byte $BB ; |X XXX XX| $FD6F
    .byte $11 ; |   X   X| $FD70
    .byte $11 ; |   X   X| $FD71
    .byte $11 ; |   X   X| $FD72
    .byte $00 ; |        | $FD73
    .byte $00 ; |        | $FD74
    .byte $FF ; |XXXXXXXX| $FD75
    .byte $00 ; |        | $FD76
    .byte $6C ; | XX XX  | $FD77
    .byte $6C ; | XX XX  | $FD78
    .byte $C6 ; |XX   XX | $FD79
    .byte $44 ; | X   X  | $FD7A
    .byte $00 ; |        | $FD7B
    .byte $00 ; |        | $FD7C
    .byte $AA ; |X X X X | $FD7D
    .byte $AA ; |X X X X | $FD7E
    .byte $FF ; |XXXXXXXX| $FD7F
    .byte $FF ; |XXXXXXXX| $FD80
DuckBottleTen:
    .byte $00 ; |        | $FD81   shared
    .byte $00 ; |        | $FD82   shared
    .byte $00 ; |        | $FD83   shared
    .byte $FF ; |XXXXXXXX| $FD84
    .byte $FF ; |XXXXXXXX| $FD85
    .byte $FF ; |XXXXXXXX| $FD86
    .byte $FF ; |XXXXXXXX| $FD87
    .byte $00 ; |        | $FD88
    .byte $00 ; |        | $FD89
    .byte $00 ; |        | $FD8A
    .byte $52 ; | X X  X | $FD8B
    .byte $52 ; | X X  X | $FD8C
    .byte $DC ; |XX XXX  | $FD8D
    .byte $52 ; | X X  X | $FD8E
    .byte $9C ; |X  XXX  | $FD8F
    .byte $00 ; |        | $FD90
    .byte $00 ; |        | $FD91
    .byte $FF ; |XXXXXXXX| $FD92
    .byte $00 ; |        | $FD93
    .byte $BB ; |X XXX XX| $FD94
    .byte $BB ; |X XXX XX| $FD95
    .byte $BB ; |X XXX XX| $FD96
    .byte $BB ; |X XXX XX| $FD97
    .byte $BB ; |X XXX XX| $FD98
    .byte $BB ; |X XXX XX| $FD99
    .byte $BB ; |X XXX XX| $FD9A
    .byte $11 ; |   X   X| $FD9B
    .byte $11 ; |   X   X| $FD9C
    .byte $11 ; |   X   X| $FD9D
    .byte $00 ; |        | $FD9E
    .byte $00 ; |        | $FD9F
    .byte $FF ; |XXXXXXXX| $FDA0
    .byte $00 ; |        | $FDA1
    .byte $6C ; | XX XX  | $FDA2
    .byte $6C ; | XX XX  | $FDA3
    .byte $C6 ; |XX   XX | $FDA4
    .byte $44 ; | X   X  | $FDA5
    .byte $00 ; |        | $FDA6
    .byte $00 ; |        | $FDA7
    .byte $AA ; |X X X X | $FDA8
    .byte $AA ; |X X X X | $FDA9
    .byte $FF ; |XXXXXXXX| $FDAA
    .byte $FF ; |XXXXXXXX| $FDAB
DuckBottleEleven:
    .byte $00 ; |        | $FDAC   shared
    .byte $00 ; |        | $FDAD   shared
    .byte $00 ; |        | $FDAE   shared
    .byte $FE ; |XXXXXXX | $FDAF
    .byte $FE ; |XXXXXXX | $FDB0
    .byte $FA ; |XXXXX X | $FDB1
    .byte $FA ; |XXXXX X | $FDB2
    .byte $0E ; |    XXX | $FDB3
    .byte $0E ; |    XXX | $FDB4
    .byte $06 ; |     XX | $FDB5
    .byte $46 ; | X   XX | $FDB6
    .byte $46 ; | X   XX | $FDB7
    .byte $46 ; | X   XX | $FDB8
    .byte $46 ; | X   XX | $FDB9
    .byte $E6 ; |XXX  XX | $FDBA
    .byte $06 ; |     XX | $FDBB
    .byte $06 ; |     XX | $FDBC
    .byte $F6 ; |XXXX XX | $FDBD
    .byte $06 ; |     XX | $FDBE
    .byte $86 ; |X    XX | $FDBF
    .byte $86 ; |X    XX | $FDC0
    .byte $86 ; |X    XX | $FDC1
    .byte $86 ; |X    XX | $FDC2
    .byte $86 ; |X    XX | $FDC3
    .byte $86 ; |X    XX | $FDC4
    .byte $86 ; |X    XX | $FDC5
    .byte $06 ; |     XX | $FDC6
    .byte $06 ; |     XX | $FDC7
    .byte $06 ; |     XX | $FDC8
    .byte $06 ; |     XX | $FDC9
    .byte $06 ; |     XX | $FDCA
    .byte $F6 ; |XXXX XX | $FDCB
    .byte $06 ; |     XX | $FDCC
    .byte $66 ; | XX  XX | $FDCD
    .byte $66 ; | XX  XX | $FDCE
    .byte $C6 ; |XX   XX | $FDCF
    .byte $46 ; | X   XX | $FDD0
    .byte $0E ; |    XXX | $FDD1
    .byte $0E ; |    XXX | $FDD2
    .byte $AA ; |X X X X | $FDD3
    .byte $AA ; |X X X X | $FDD4
    .byte $FE ; |XXXXXXX | $FDD5
    .byte $FE ; |XXXXXXX | $FDD6
    .byte $00 ; |        | $FDD7
    .byte $00 ; |        | $FDD8
    .byte $00 ; |        | $FDD9


  EMPTY_SPACE 38         ; $FDDA - $FDFF   free bytes


DuckBottleTwelve:
    .byte $00 ; |        | $FE00
    .byte $00 ; |        | $FE01
    .byte $00 ; |        | $FE02
    .byte $FF ; |XXXXXXXX| $FE03
    .byte $FF ; |XXXXXXXX| $FE04
    .byte $BF ; |X XXXXXX| $FE05
    .byte $BF ; |X XXXXXX| $FE06
    .byte $E0 ; |XXX     | $FE07
    .byte $E0 ; |XXX     | $FE08
    .byte $C0 ; |XX      | $FE09
    .byte $C7 ; |XX   XXX| $FE0A
    .byte $C0 ; |XX      | $FE0B
    .byte $C7 ; |XX   XXX| $FE0C
    .byte $C4 ; |XX   X  | $FE0D
    .byte $C7 ; |XX   XXX| $FE0E
    .byte $C0 ; |XX      | $FE0F
    .byte $C0 ; |XX      | $FE10
    .byte $DF ; |XX XXXXX| $FE11
    .byte $C0 ; |XX      | $FE12
    .byte $C1 ; |XX     X| $FE13
    .byte $C1 ; |XX     X| $FE14
    .byte $C1 ; |XX     X| $FE15
    .byte $C1 ; |XX     X| $FE16
    .byte $C1 ; |XX     X| $FE17
    .byte $C1 ; |XX     X| $FE18
    .byte $C1 ; |XX     X| $FE19
    .byte $C0 ; |XX      | $FE1A
    .byte $C0 ; |XX      | $FE1B
    .byte $C0 ; |XX      | $FE1C
    .byte $C0 ; |XX      | $FE1D
    .byte $C0 ; |XX      | $FE1E
    .byte $DF ; |XX XXXXX| $FE1F
    .byte $C0 ; |XX      | $FE20
    .byte $CC ; |XX  XX  | $FE21
    .byte $CC ; |XX  XX  | $FE22
    .byte $C6 ; |XX   XX | $FE23
    .byte $C4 ; |XX   X  | $FE24
    .byte $E0 ; |XXX     | $FE25
    .byte $E0 ; |XXX     | $FE26
    .byte $AA ; |X X X X | $FE27
    .byte $AA ; |X X X X | $FE28
    .byte $FF ; |XXXXXXXX| $FE29
    .byte $FF ; |XXXXXXXX| $FE2A
DuckBottleThirteen:
    .byte $00 ; |        | $FE2B   shared
    .byte $00 ; |        | $FE2C   shared
    .byte $00 ; |        | $FE2D   shared
    .byte $FF ; |XXXXXXXX| $FE2E
    .byte $FF ; |XXXXXXXX| $FE2F
    .byte $FF ; |XXXXXXXX| $FE30
    .byte $FF ; |XXXXXXXX| $FE31
    .byte $00 ; |        | $FE32
    .byte $00 ; |        | $FE33
    .byte $00 ; |        | $FE34
    .byte $92 ; |X  X  X | $FE35
    .byte $92 ; |X  X  X | $FE36
    .byte $93 ; |X  X  XX| $FE37
    .byte $12 ; |   X  X | $FE38
    .byte $B9 ; |X XXX  X| $FE39
    .byte $00 ; |        | $FE3A
    .byte $00 ; |        | $FE3B
    .byte $FF ; |XXXXXXXX| $FE3C
    .byte $00 ; |        | $FE3D
    .byte $DD ; |XX XXX X| $FE3E
    .byte $DD ; |XX XXX X| $FE3F
    .byte $DD ; |XX XXX X| $FE40
    .byte $DD ; |XX XXX X| $FE41
    .byte $DD ; |XX XXX X| $FE42
    .byte $DD ; |XX XXX X| $FE43
    .byte $DD ; |XX XXX X| $FE44
    .byte $88 ; |X   X   | $FE45
    .byte $88 ; |X   X   | $FE46
    .byte $88 ; |X   X   | $FE47
    .byte $00 ; |        | $FE48
    .byte $00 ; |        | $FE49
    .byte $FF ; |XXXXXXXX| $FE4A
    .byte $00 ; |        | $FE4B
    .byte $6C ; | XX XX  | $FE4C
    .byte $6C ; | XX XX  | $FE4D
    .byte $C6 ; |XX   XX | $FE4E
    .byte $44 ; | X   X  | $FE4F
    .byte $00 ; |        | $FE50
    .byte $00 ; |        | $FE51
    .byte $AA ; |X X X X | $FE52
    .byte $AA ; |X X X X | $FE53
    .byte $FF ; |XXXXXXXX| $FE54
    .byte $FF ; |XXXXXXXX| $FE55
DuckBottleFourteen:
    .byte $00 ; |        | $FE56   shared
    .byte $00 ; |        | $FE57   shared
    .byte $00 ; |        | $FE58   shared
    .byte $FF ; |XXXXXXXX| $FE59
    .byte $FF ; |XXXXXXXX| $FE5A
    .byte $FF ; |XXXXXXXX| $FE5B
    .byte $FF ; |XXXXXXXX| $FE5C
    .byte $00 ; |        | $FE5D
    .byte $00 ; |        | $FE5E
    .byte $00 ; |        | $FE5F
    .byte $52 ; | X X  X | $FE60
    .byte $52 ; | X X  X | $FE61
    .byte $DC ; |XX XXX  | $FE62
    .byte $52 ; | X X  X | $FE63
    .byte $9C ; |X  XXX  | $FE64
    .byte $00 ; |        | $FE65
    .byte $00 ; |        | $FE66
    .byte $FF ; |XXXXXXXX| $FE67
    .byte $00 ; |        | $FE68
    .byte $DD ; |XX XXX X| $FE69
    .byte $DD ; |XX XXX X| $FE6A
    .byte $DD ; |XX XXX X| $FE6B
    .byte $DD ; |XX XXX X| $FE6C
    .byte $DD ; |XX XXX X| $FE6D
    .byte $DD ; |XX XXX X| $FE6E
    .byte $DD ; |XX XXX X| $FE6F
    .byte $88 ; |X   X   | $FE70
    .byte $88 ; |X   X   | $FE71
    .byte $88 ; |X   X   | $FE72
    .byte $00 ; |        | $FE73
    .byte $00 ; |        | $FE74
    .byte $FF ; |XXXXXXXX| $FE75
    .byte $00 ; |        | $FE76
    .byte $6C ; | XX XX  | $FE77
    .byte $6C ; | XX XX  | $FE78
    .byte $C6 ; |XX   XX | $FE79
    .byte $44 ; | X   X  | $FE7A
    .byte $00 ; |        | $FE7B
    .byte $00 ; |        | $FE7C
    .byte $AA ; |X X X X | $FE7D
    .byte $AA ; |X X X X | $FE7E
    .byte $FF ; |XXXXXXXX| $FE7F
    .byte $FF ; |XXXXXXXX| $FE80
DuckBottleFifteen:
    .byte $00 ; |        | $FE81   shared
    .byte $00 ; |        | $FE82   shared
    .byte $00 ; |        | $FE83   shared
    .byte $FE ; |XXXXXXX | $FE84
    .byte $FE ; |XXXXXXX | $FE85
    .byte $FA ; |XXXXX X | $FE86
    .byte $FA ; |XXXXX X | $FE87
    .byte $0E ; |    XXX | $FE88
    .byte $0E ; |    XXX | $FE89
    .byte $06 ; |     XX | $FE8A
    .byte $46 ; | X   XX | $FE8B
    .byte $46 ; | X   XX | $FE8C
    .byte $46 ; | X   XX | $FE8D
    .byte $46 ; | X   XX | $FE8E
    .byte $E6 ; |XXX  XX | $FE8F
    .byte $06 ; |     XX | $FE90
    .byte $06 ; |     XX | $FE91
    .byte $F6 ; |XXXX XX | $FE92
    .byte $06 ; |     XX | $FE93
    .byte $C6 ; |XX   XX | $FE94
    .byte $C6 ; |XX   XX | $FE95
    .byte $C6 ; |XX   XX | $FE96
    .byte $C6 ; |XX   XX | $FE97
    .byte $C6 ; |XX   XX | $FE98
    .byte $C6 ; |XX   XX | $FE99
    .byte $C6 ; |XX   XX | $FE9A
    .byte $86 ; |X    XX | $FE9B
    .byte $86 ; |X    XX | $FE9C
    .byte $86 ; |X    XX | $FE9D
    .byte $06 ; |     XX | $FE9E
    .byte $06 ; |     XX | $FE9F
    .byte $F6 ; |XXXX XX | $FEA0
    .byte $06 ; |     XX | $FEA1
    .byte $66 ; | XX  XX | $FEA2
    .byte $66 ; | XX  XX | $FEA3
    .byte $C6 ; |XX   XX | $FEA4
    .byte $46 ; | X   XX | $FEA5
    .byte $0E ; |    XXX | $FEA6
    .byte $0E ; |    XXX | $FEA7
    .byte $AA ; |X X X X | $FEA8
    .byte $AA ; |X X X X | $FEA9
    .byte $FE ; |XXXXXXX | $FEAA
    .byte $FE ; |XXXXXXX | $FEAB
    .byte $00 ; |        | $FEAC
    .byte $00 ; |        | $FEAD
    .byte $00 ; |        | $FEAE


  EMPTY_SPACE 297        ; $FEAF - $FFD7   free bytes


START_BANK_3:
    lda    BANK_0                ; 4
    jmp    $9100                 ; 3

    lda    BANK_3                ; 4
    jmp.ind ($0080)              ; 5

    lda    BANK_2                ; 4
    jmp.ind ($0080)              ; 5

    lda    BANK_1                ; 4
    jmp.ind ($0080)              ; 5

LFFF0:
    lda    BANK_0                ; 4
    jmp.ind ($0080)              ; 5

    .byte $00 ; |        | $FFF6
    .byte $00 ; |        | $FFF7
    .byte $00 ; |        | $FFF8
    .byte $00 ; |        | $FFF9

       ORG $5FFA
      RORG $FFFA

    .word START_BANK_3
    .word START_BANK_3
    .word START_BANK_3