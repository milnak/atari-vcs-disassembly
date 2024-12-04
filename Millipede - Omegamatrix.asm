; Rough Disassembly of Millipede
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
;
; Mil_1.cfg contents:
;
;      ORG 9000
;      DATA 9000 90FF
;      CODE 9100 91A6
;      GFX 91A7 92FF
;      CODE 9300 9421
;      GFX 9422 94FF
;      CODE 9500 963C
;      GFX 963D 9704
;      CODE 9705 9B4B
;      GFX 9B4C 9BCB
;      CODE 9BCC 9BE7
;      GFX 9BE8 9C87
;      CODE 9C88 9DE8
;      GFX 9DE9 9FDD
;      CODE 9FDE 9FF5
;      GFX 9FF6 9FFF
;
; Mil_2.cfg contents:
;
;      ORG B000
;      DATA B000 B0FF
;      CODE B100 B2DC
;      GFX B2DD B2FC
;      CODE B2FD B373
;      GFX B374 B3FF
;      CODE B400 B6D3
;      GFX B6D4 B79D
;      CODE B79E BA09
;      GFX BA0A BAFF
;      CODE BB00 BE74
;      GFX BE75 BFE3
;      CODE BFE4 BFF5
;      GFX BFF6 BFFF
;
; Mil_3.cfg contents:
;
;      ORG D000
;      DATA D000 D0FF
;      CODE D100 D33E
;      GFX D33F D3E2
;      CODE D3E3 D522
;      GFX D523 D688
;      CODE D689 D6F4
;      GFX D6F5 D7FF
;      CODE D800 D83B
;      GFX D83C D8FF
;      CODE D900 DC22
;      GFX DC23 DC48
;      CODE DC49 DCCC
;      GFX DCCD DFDD
;      CODE DFDE DFF5
;      GFX DFF6 DFFF
;
; Mil_4.cfg contents:
;
;      ORG F000
;      DATA F000 F0FF
;      CODE F100 F2A2
;      GFX F2A3 F2B8
;      CODE F2B9 F75D
;      GFX F75E F763
;      CODE F764 F8C5
;      GFX F8C6 F8DD
;      CODE F8DE F955
;      GFX F956 F965
;      CODE F966 FD85
;      GFX FD86 FFE3
;      CODE FFE4 FFF5
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
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
RESP1   =  $11
RESM0   =  $12
RESM1   =  $13
RESBL   =  $14
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
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMM0    =  $22
HMM1    =  $23
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
;
; Atari's Superchip adds an extra 128 bytes of ram to a Atari 2600 game. The ram uses addresses from the first 256
; bytes of rom space. That means every 4k bank of the game cartridge can only use the rom space $x100 - $xFFF for
; the game program.
;
; The Superchip ram lies between $x000 and $x0FF. It is a 2 byte address, but it's the "low byte" of the address that
; we are concerned with. Bit 7 of the "low byte" controls whether the ram is being written to or read from.
;
; Low byte:
;
;    X x x x x x x x
;    | | | | | | | |
;    | -------------
;    |       |
;    |  bit 6 to bit 0, (ram location)
;    |
;    bit 7 (0 for write, 1 for read)
;
; For an example, lets choose a random super chip ram space, like $103A. The low byte is the last two digits, the "3A"
; portion. "$3A" lies between $00 and $7F, so this address is only used in writing to ram. To read from that ram we need
; to find it's counterpart address.
;
; Hex       3    A                     Hex       B    A
; Binary   0011 1010                   Binary   1011 1010
;          |                                    |
;          bit 7 is 0, (i.e. write)             bit 7 is 1, (i.e. read)
;
; We wrote to $103A, but to read from it we'll need to use $10BA.
;
; If you've never learned Hex or Binary counting, this is might still seem confusing. To keep it simple this dissasembly uses
; "SC_xx" for a writing to a superchip ram location, and "SC_xx|READ" for reading from that location.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        SEG.U SuperchipRam
        ORG $1000

SC_00              ds 1
SC_01              ds 1
SC_02              ds 3
SC_05              ds 1
SC_06              ds 1
SC_07              ds 1
SC_08              ds 11
SC_13              ds 1
SC_14              ds 1
SC_15              ds 3
SC_18              ds 1
SC_19              ds 1
SC_1A              ds 1
SC_1B              ds 2
SC_1D              ds 9
SC_26              ds 1
SC_27              ds 1
SC_28              ds 3
SC_2B              ds 1
SC_2C              ds 1
SC_2D              ds 1
SC_2E              ds 4
SC_32              ds 1
SC_33              ds 4
SC_37              ds 2
SC_39              ds 1
SC_3A              ds 1
SC_3B              ds 7
SC_42              ds 1
SC_43              ds 1
SC_44              ds 1
SC_45              ds 6
SC_4B              ds 2
SC_4D              ds 1
SC_4E              ds 1
SC_4F              ds 5
SC_54              ds 2
SC_56              ds 1
SC_57              ds 1
SC_58              ds 1
SC_59              ds 1
SC_5A              ds 6
SC_60              ds 2
SC_62              ds 8
SC_6A              ds 1
SC_6B              ds 1
SC_6C              ds 1
SC_6D              ds 1
SC_6E              ds 6
SC_74              ds 2
SC_76              ds 8
SC_7E              ds 1
SC_7F              ds 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MACROS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  MAC SC_RAM_SPACE
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

    SC_RAM_SPACE 256                ; $9000 - $90FF super chip ram

L9100:
    ldx    $DE                   ; 3
    cpx    #$16                  ; 2
    bcs    L9130                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$7F                  ; 2
    and    $9C,X                 ; 4
    tay                          ; 2
    lda    L9201,Y               ; 4
    sta.w  HMM0                  ; 4
    and    #$0F                  ; 2
    tay                          ; 2
L9116:
    dey                          ; 2
    bpl    L9116                 ; 2³
    sta    RESM0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    $9C,X                 ; 4
    and    #$7F                  ; 2
    tay                          ; 2
    lda    L9200,Y               ; 4
    sta.w  HMM1                  ; 4
    and    #$0F                  ; 2
    tay                          ; 2
L912B:
    dey                          ; 2
    bpl    L912B                 ; 2³
    sta    RESM1                 ; 3
L9130:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #1                    ; 2
    sta    CTRLPF                ; 3
    clc                          ; 2
    ldx    $C4                   ; 3
    lda    L9201,X               ; 4
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
L9141:
    dey                          ; 2
    bpl    L9141                 ; 2³
    sta    RESBL                 ; 3
    bit    $B8                   ; 3
    bvc    L9150                 ; 2³
    lda    #$40                  ; 2
    ldx    $9C                   ; 3
    sta    $94,X                 ; 4
L9150:
    lda    INTIM                 ; 4
    bmi    L9150                 ; 2³
    lda    $B4                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    VBLANK                ; 3
    sta    COLUBK                ; 3
    sta    $F6                   ; 3
    lda    #$93                  ; 2   high nibble
    sta    $EC                   ; 3
    lda    #$95                  ; 2   high nibble
    sta    $EE                   ; 3
    lda    #$97                  ; 2   high nibble
    sta    $F0                   ; 3
    lda    #$40                  ; 2
    ldx    $9C                   ; 3
    sta    $86,X                 ; 4
    txa                          ; 2
    adc    #$14                  ; 2
    tax                          ; 2
    stx    $EA                   ; 3
    lda    #6                    ; 2
    adc    $9C                   ; 3
    sta    $F5                   ; 3
    pha                          ; 3
L9180:
    pla                          ; 4
    sta    HMCLR                 ; 3
    ldy    $86,X                 ; 4
    bmi    L919D                 ; 2³
    ldx    SC_00|READ,Y          ; 4
    lda    L9200,X               ; 4
    sta    HMP0                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    L91A7,X               ; 4
    sta    $EB                   ; 3
    tya                          ; 2
    ldx    $EA                   ; 3
    jmp.ind ($00EB)              ; 5   $93xx

L919D:
    pha                          ; 3
    pla                          ; 4
    pha                          ; 3
    pla                          ; 4
    tya                          ; 2
    ldy    #0                    ; 2
    jmp    L996B                 ; 3

L91A7:  ; indirect jump table
    .byte <L9300         ; $91A7
    .byte <L931B         ; $91A8
    .byte <L9336         ; $91A9
    .byte <L9351         ; $91AA
    .byte <L936C         ; $91AB
    .byte <L9387         ; $91AC
    .byte <L93A2         ; $91AD
    .byte <L93EE         ; $91AE
    .byte <L93C4         ; $91AF

    .byte $38 ; |  XXX   | $91B0
    .byte $3E ; |  XXXXX | $91B1
    .byte $7E ; | XXXXXX | $91B2
    .byte $7E ; | XXXXXX | $91B3
    .byte $FF ; |XXXXXXXX| $91B4
    .byte $7E ; | XXXXXX | $91B5
    .byte $5C ; | X XXX  | $91B6
    .byte $50 ; | X X    | $91B7
    .byte $00 ; |        | $91B8
    .byte $00 ; |        | $91B9
    .byte $00 ; |        | $91BA
    .byte $28 ; |  X X   | $91BB
    .byte $56 ; | X X XX | $91BC
    .byte $45 ; | X   X X| $91BD
    .byte $00 ; |        | $91BE
    .byte $00 ; |        | $91BF
L91C0:
    .byte $34 ; |  XX X  | $91C0   COLUPx
    .byte $84 ; |X    X  | $91C1
    .byte $18 ; |   XX   | $91C2
    .byte $56 ; | X X XX | $91C3
    .byte $44 ; | X   X  | $91C4
    .byte $66 ; | XX  XX | $91C5
    .byte $D6 ; |XX X XX | $91C6
    .byte $98 ; |X  XX   | $91C7
    .byte $34 ; |  XX X  | $91C8
    .byte $84 ; |X    X  | $91C9
    .byte $18 ; |   XX   | $91CA
    .byte $56 ; | X X XX | $91CB
    .byte $44 ; | X   X  | $91CC
    .byte $66 ; | XX  XX | $91CD
    .byte $D6 ; |XX X XX | $91CE
    .byte $98 ; |X  XX   | $91CF
    .byte $34 ; |  XX X  | $91D0
    .byte $18 ; |   XX   | $91D1
    .byte $18 ; |   XX   | $91D2
    .byte $56 ; | X X XX | $91D3
    .byte $44 ; | X   X  | $91D4
    .byte $66 ; | XX  XX | $91D5
    .byte $D6 ; |XX X XX | $91D6
    .byte $98 ; |X  XX   | $91D7
    .byte $34 ; |  XX X  | $91D8
    .byte $98 ; |X  XX   | $91D9
    .byte $18 ; |   XX   | $91DA
    .byte $56 ; | X X XX | $91DB
    .byte $44 ; | X   X  | $91DC
    .byte $66 ; | XX  XX | $91DD
    .byte $D6 ; |XX X XX | $91DE
    .byte $98 ; |X  XX   | $91DF
    .byte $08 ; |    X   | $91E0
    .byte $08 ; |    X   | $91E1
    .byte $08 ; |    X   | $91E2
    .byte $08 ; |    X   | $91E3
    .byte $08 ; |    X   | $91E4
    .byte $08 ; |    X   | $91E5
    .byte $08 ; |    X   | $91E6
    .byte $08 ; |    X   | $91E7
    .byte $08 ; |    X   | $91E8
    .byte $08 ; |    X   | $91E9
    .byte $08 ; |    X   | $91EA
    .byte $08 ; |    X   | $91EB
    .byte $08 ; |    X   | $91EC
    .byte $08 ; |    X   | $91ED
    .byte $08 ; |    X   | $91EE
    .byte $08 ; |    X   | $91EF
    .byte $00 ; |        | $91F0
    .byte $00 ; |        | $91F1
    .byte $00 ; |        | $91F2
    .byte $00 ; |        | $91F3
    .byte $00 ; |        | $91F4
    .byte $00 ; |        | $91F5
    .byte $00 ; |        | $91F6
    .byte $00 ; |        | $91F7
    .byte $00 ; |        | $91F8
    .byte $00 ; |        | $91F9
    .byte $00 ; |        | $91FA
    .byte $00 ; |        | $91FB
    .byte $00 ; |        | $91FC
    .byte $00 ; |        | $91FD
    .byte $00 ; |        | $91FE
    .byte $00 ; |        | $91FF
L9200:
    .byte $50 ; | X X    | $9200   HMx table, sta $EF
L9201:
    .byte $40 ; | X      | $9201
    .byte $30 ; |  XX    | $9202
    .byte $20 ; |  X     | $9203
    .byte $10 ; |   X    | $9204
    .byte $00 ; |        | $9205
    .byte $F0 ; |XXXX    | $9206
    .byte $E0 ; |XXX     | $9207
    .byte $D0 ; |XX X    | $9208
    .byte $C0 ; |XX      | $9209
    .byte $B0 ; |X XX    | $920A
    .byte $A0 ; |X X     | $920B
    .byte $90 ; |X  X    | $920C
    .byte $80 ; |X       | $920D
    .byte $61 ; | XX    X| $920E
    .byte $51 ; | X X   X| $920F
    .byte $41 ; | X     X| $9210
    .byte $31 ; |  XX   X| $9211
    .byte $21 ; |  X    X| $9212
    .byte $11 ; |   X   X| $9213
    .byte $01 ; |       X| $9214
    .byte $F1 ; |XXXX   X| $9215
    .byte $E1 ; |XXX    X| $9216
    .byte $D1 ; |XX X   X| $9217
    .byte $C1 ; |XX     X| $9218
    .byte $B1 ; |X XX   X| $9219
    .byte $A1 ; |X X    X| $921A
    .byte $91 ; |X  X   X| $921B
    .byte $81 ; |X      X| $921C
    .byte $62 ; | XX   X | $921D
    .byte $52 ; | X X  X | $921E
    .byte $42 ; | X    X | $921F
    .byte $32 ; |  XX  X | $9220
    .byte $22 ; |  X   X | $9221
    .byte $12 ; |   X  X | $9222
    .byte $02 ; |      X | $9223
    .byte $F2 ; |XXXX  X | $9224
    .byte $E2 ; |XXX   X | $9225
    .byte $D2 ; |XX X  X | $9226
    .byte $C2 ; |XX    X | $9227
    .byte $B2 ; |X XX  X | $9228
    .byte $A2 ; |X X   X | $9229
    .byte $92 ; |X  X  X | $922A
    .byte $82 ; |X     X | $922B
    .byte $63 ; | XX   XX| $922C
    .byte $53 ; | X X  XX| $922D
    .byte $43 ; | X    XX| $922E
    .byte $33 ; |  XX  XX| $922F
    .byte $23 ; |  X   XX| $9230
    .byte $13 ; |   X  XX| $9231
    .byte $03 ; |      XX| $9232
    .byte $F3 ; |XXXX  XX| $9233
    .byte $E3 ; |XXX   XX| $9234
    .byte $D3 ; |XX X  XX| $9235
    .byte $C3 ; |XX    XX| $9236
    .byte $B3 ; |X XX  XX| $9237
    .byte $A3 ; |X X   XX| $9238
    .byte $93 ; |X  X  XX| $9239
    .byte $83 ; |X     XX| $923A
    .byte $64 ; | XX  X  | $923B
    .byte $54 ; | X X X  | $923C
    .byte $44 ; | X   X  | $923D
    .byte $34 ; |  XX X  | $923E
    .byte $24 ; |  X  X  | $923F
    .byte $14 ; |   X X  | $9240
    .byte $04 ; |     X  | $9241
    .byte $F4 ; |XXXX X  | $9242
    .byte $E4 ; |XXX  X  | $9243
    .byte $D4 ; |XX X X  | $9244
    .byte $C4 ; |XX   X  | $9245
    .byte $B4 ; |X XX X  | $9246
    .byte $A4 ; |X X  X  | $9247
    .byte $94 ; |X  X X  | $9248
    .byte $84 ; |X    X  | $9249
    .byte $65 ; | XX  X X| $924A
    .byte $55 ; | X X X X| $924B
    .byte $45 ; | X   X X| $924C
    .byte $35 ; |  XX X X| $924D
    .byte $25 ; |  X  X X| $924E
    .byte $15 ; |   X X X| $924F
    .byte $05 ; |     X X| $9250
    .byte $F5 ; |XXXX X X| $9251
    .byte $E5 ; |XXX  X X| $9252
    .byte $D5 ; |XX X X X| $9253
    .byte $C5 ; |XX   X X| $9254
    .byte $B5 ; |X XX X X| $9255
    .byte $A5 ; |X X  X X| $9256
    .byte $95 ; |X  X X X| $9257
    .byte $85 ; |X    X X| $9258
    .byte $66 ; | XX  XX | $9259
    .byte $56 ; | X X XX | $925A
    .byte $46 ; | X   XX | $925B
    .byte $36 ; |  XX XX | $925C
    .byte $26 ; |  X  XX | $925D
    .byte $16 ; |   X XX | $925E
    .byte $06 ; |     XX | $925F
    .byte $F6 ; |XXXX XX | $9260
    .byte $E6 ; |XXX  XX | $9261
    .byte $D6 ; |XX X XX | $9262
    .byte $C6 ; |XX   XX | $9263
    .byte $B6 ; |X XX XX | $9264
    .byte $A6 ; |X X  XX | $9265
    .byte $96 ; |X  X XX | $9266
    .byte $86 ; |X    XX | $9267
    .byte $67 ; | XX  XXX| $9268
    .byte $57 ; | X X XXX| $9269
    .byte $47 ; | X   XXX| $926A
    .byte $37 ; |  XX XXX| $926B
    .byte $27 ; |  X  XXX| $926C
    .byte $17 ; |   X XXX| $926D
    .byte $07 ; |     XXX| $926E
    .byte $F7 ; |XXXX XXX| $926F
    .byte $E7 ; |XXX  XXX| $9270
    .byte $D7 ; |XX X XXX| $9271
    .byte $C7 ; |XX   XXX| $9272
    .byte $B7 ; |X XX XXX| $9273
    .byte $A7 ; |X X  XXX| $9274
    .byte $97 ; |X  X XXX| $9275
    .byte $87 ; |X    XXX| $9276
    .byte $68 ; | XX X   | $9277
    .byte $58 ; | X XX   | $9278
    .byte $48 ; | X  X   | $9279
    .byte $38 ; |  XXX   | $927A
    .byte $28 ; |  X X   | $927B
    .byte $18 ; |   XX   | $927C
    .byte $08 ; |    X   | $927D
    .byte $F8 ; |XXXXX   | $927E
    .byte $E8 ; |XXX X   | $927F
L9280:
    .byte $00 ; |        | $9280   NUSIZx
    .byte $00 ; |        | $9281
    .byte $00 ; |        | $9282
    .byte $00 ; |        | $9283
    .byte $00 ; |        | $9284
    .byte $00 ; |        | $9285
    .byte $00 ; |        | $9286
    .byte $00 ; |        | $9287
    .byte $00 ; |        | $9288
    .byte $00 ; |        | $9289
    .byte $00 ; |        | $928A
    .byte $00 ; |        | $928B
    .byte $00 ; |        | $928C
    .byte $00 ; |        | $928D
    .byte $00 ; |        | $928E
    .byte $00 ; |        | $928F
    .byte $00 ; |        | $9290
    .byte $00 ; |        | $9291
    .byte $00 ; |        | $9292
    .byte $00 ; |        | $9293
    .byte $00 ; |        | $9294
    .byte $00 ; |        | $9295
    .byte $00 ; |        | $9296
    .byte $00 ; |        | $9297
    .byte $00 ; |        | $9298
    .byte $00 ; |        | $9299
    .byte $00 ; |        | $929A
    .byte $00 ; |        | $929B
    .byte $00 ; |        | $929C
    .byte $00 ; |        | $929D
    .byte $00 ; |        | $929E
    .byte $00 ; |        | $929F
    .byte $00 ; |        | $92A0
    .byte $00 ; |        | $92A1
    .byte $00 ; |        | $92A2
    .byte $00 ; |        | $92A3
    .byte $00 ; |        | $92A4
    .byte $00 ; |        | $92A5
    .byte $00 ; |        | $92A6
    .byte $00 ; |        | $92A7
    .byte $00 ; |        | $92A8
    .byte $00 ; |        | $92A9
    .byte $00 ; |        | $92AA
    .byte $00 ; |        | $92AB
    .byte $00 ; |        | $92AC
    .byte $00 ; |        | $92AD
    .byte $00 ; |        | $92AE
    .byte $00 ; |        | $92AF
    .byte $05 ; |     X X| $92B0
    .byte $05 ; |     X X| $92B1
    .byte $05 ; |     X X| $92B2
    .byte $05 ; |     X X| $92B3
    .byte $05 ; |     X X| $92B4
    .byte $05 ; |     X X| $92B5
    .byte $05 ; |     X X| $92B6
    .byte $05 ; |     X X| $92B7
    .byte $05 ; |     X X| $92B8
    .byte $05 ; |     X X| $92B9
    .byte $05 ; |     X X| $92BA
    .byte $05 ; |     X X| $92BB
    .byte $05 ; |     X X| $92BC
    .byte $05 ; |     X X| $92BD
    .byte $05 ; |     X X| $92BE
    .byte $05 ; |     X X| $92BF
L92C0:
    .byte $00 ; |        | $92C0   add table, used to index color table
    .byte $01 ; |       X| $92C1
    .byte $01 ; |       X| $92C2
    .byte $02 ; |      X | $92C3
    .byte $02 ; |      X | $92C4
    .byte $02 ; |      X | $92C5
    .byte $02 ; |      X | $92C6
    .byte $03 ; |      XX| $92C7
    .byte $03 ; |      XX| $92C8
    .byte $03 ; |      XX| $92C9
    .byte $04 ; |     X  | $92CA
    .byte $04 ; |     X  | $92CB
    .byte $04 ; |     X  | $92CC
    .byte $04 ; |     X  | $92CD
    .byte $05 ; |     X X| $92CE
    .byte $05 ; |     X X| $92CF
    .byte $05 ; |     X X| $92D0
    .byte $06 ; |     XX | $92D1
    .byte $06 ; |     XX | $92D2
    .byte $06 ; |     XX | $92D3
    .byte $07 ; |     XXX| $92D4
    .byte $07 ; |     XXX| $92D5
    .byte $07 ; |     XXX| $92D6
    .byte $07 ; |     XXX| $92D7
    .byte $07 ; |     XXX| $92D8
    .byte $07 ; |     XXX| $92D9
    .byte $07 ; |     XXX| $92DA
    .byte $07 ; |     XXX| $92DB
    .byte $00 ; |        | $92DC
    .byte $00 ; |        | $92DD
    .byte $00 ; |        | $92DE
    .byte $00 ; |        | $92DF
    .byte $00 ; |        | $92E0
    .byte $00 ; |        | $92E1
    .byte $02 ; |      X | $92E2
    .byte $02 ; |      X | $92E3
    .byte $20 ; |  X     | $92E4
    .byte $20 ; |  X     | $92E5
    .byte $20 ; |  X     | $92E6
    .byte $20 ; |  X     | $92E7
    .byte $20 ; |  X     | $92E8
    .byte $20 ; |  X     | $92E9
    .byte $20 ; |  X     | $92EA
    .byte $20 ; |  X     | $92EB
    .byte $20 ; |  X     | $92EC
    .byte $20 ; |  X     | $92ED
    .byte $20 ; |  X     | $92EE
    .byte $0E ; |    XXX | $92EF
    .byte $04 ; |     X  | $92F0
    .byte $04 ; |     X  | $92F1
    .byte $04 ; |     X  | $92F2
    .byte $04 ; |     X  | $92F3
    .byte $04 ; |     X  | $92F4
    .byte $04 ; |     X  | $92F5
    .byte $04 ; |     X  | $92F6
    .byte $04 ; |     X  | $92F7
    .byte $04 ; |     X  | $92F8
    .byte $04 ; |     X  | $92F9
    .byte $04 ; |     X  | $92FA
    .byte $04 ; |     X  | $92FB
    .byte $04 ; |     X  | $92FC
    .byte $04 ; |     X  | $92FD
    .byte $04 ; |     X  | $92FE
    .byte $04 ; |     X  | $92FF

L9300:  ; indirect jump
    sta    RESP0                 ; 3
    tay                          ; 2
    ldx    SC_26|READ,Y          ; 4
    stx    $F1                   ; 3
    lda    L9280,X               ; 4
    sta    NUSIZ0                ; 3
    lda    L92C0,X               ; 4
    adc    $B2                   ; 3
    tax                          ; 2
    lda    L91C0,X               ; 4
    sta    COLUP0                ; 3
    jmp    L9408                 ; 3

L931B:  ; indirect jump
    tay                          ; 2
    lda    $B2                   ; 3
    sta    RESP0                 ; 3
    ldx    SC_26|READ,Y          ; 4
    stx    $F1                   ; 3
    adc    L92C0,X               ; 4
    tay                          ; 2
    lda    L91C0,Y               ; 4
    sta    COLUP0                ; 3
    lda    L9280,X               ; 4
    sta    NUSIZ0                ; 3
    jmp    L9408                 ; 3

L9336:  ; indirect jump
    tay                          ; 2
    ldx    SC_26|READ,Y          ; 4
    lda    L9280,X               ; 4
    sta    RESP0                 ; 3
    sta    NUSIZ0                ; 3
    stx    $F1                   ; 3
    lda    $B2                   ; 3
    adc    L92C0,X               ; 4
    tay                          ; 2
    lda    L91C0,Y               ; 4
    sta    COLUP0                ; 3
    jmp    L9408                 ; 3

L9351:  ; indirect jump
    tay                          ; 2
    ldx    SC_26|READ,Y          ; 4
    lda    L92C0,X               ; 4
    adc    $B2                   ; 3
    tay                          ; 2
    sta    RESP0                 ; 3
    lda    L91C0,Y               ; 4
    sta    COLUP0                ; 3
    stx    $F1                   ; 3
    lda    L9280,X               ; 4
    sta    NUSIZ0                ; 3
    jmp    L9408                 ; 3

L936C:  ; indirect jump
    tay                          ; 2
    ldx    SC_26|READ,Y          ; 4
    stx    $F1                   ; 3
    lda    L9280,X               ; 4
    sta    NUSIZ0                ; 3
    lda    L92C0,X               ; 4
    sta    RESP0                 ; 3
    adc    $B2                   ; 3
    tax                          ; 2
    lda    L91C0,X               ; 4
    sta    COLUP0                ; 3
    jmp    L9408                 ; 3

L9387:  ; indirect jump
    tay                          ; 2
    ldx    SC_26|READ,Y          ; 4
    stx    $F1                   ; 3
    lda    L92C0,X               ; 4
    adc    $B2                   ; 3
    tay                          ; 2
    lda    L91C0,Y               ; 4
    sta    COLUP0                ; 3
    sta    RESP0                 ; 3
    lda    L9280,X               ; 4
    sta    NUSIZ0                ; 3
    jmp    L9408                 ; 3

L93A2:  ; indirect jump
    tay                          ; 2
    lda    SC_26|READ,Y          ; 4
    tay                          ; 2
    lda    $9C,X                 ; 4
    and    #$3F                  ; 2
    tax                          ; 2
    lda    L9280,Y               ; 4
    sta    NUSIZ0                ; 3
    lda    L92C0,Y               ; 4
    adc    $B2                   ; 3
    sta    RESP0                 ; 3
    sty    $F1                   ; 3
    tay                          ; 2
    lda    L91C0,Y               ; 4
    sta.w  COLUP0                ; 4
    jmp    L940F                 ; 3

L93C4:  ; indirect jump
    tay                          ; 2
    lda    SC_26|READ,Y          ; 4
    tay                          ; 2
    sty    $F1                   ; 3
    lda    L9280,Y               ; 4
    sta    NUSIZ0                ; 3
    lda    L92C0,Y               ; 4
    adc    $B2                   ; 3
    tay                          ; 2
    lda    L91C0,Y               ; 4
    sta    COLUP0                ; 3
    lda    $9C,X                 ; 4
    and    #$3F                  ; 2
    sta    RESP0                 ; 3
    tax                          ; 2
    ldy    SC_00|READ,X          ; 4
    lda    L9200,Y               ; 4
    sta.w  HMP1                  ; 4
    jmp    L9417                 ; 3

L93EE:  ; indirect jump
    tay                          ; 2
    ldx    SC_26|READ,Y          ; 4
    stx    $F1                   ; 3
    lda    L9280,X               ; 4
    sta    NUSIZ0                ; 3
    lda    L92C0,X               ; 4
    adc    $B2                   ; 3
    tax                          ; 2
    lda    L91C0,X               ; 4
    sta    COLUP0                ; 3
    sta    COLUP0                ; 3
    sta    RESP0                 ; 3
L9408:
    ldx    $EA                   ; 3
    lda    $9C,X                 ; 4
    and    #$3F                  ; 2
    tax                          ; 2
L940F:
    ldy    SC_00|READ,X          ; 4
    lda    L9200,Y               ; 4
    sta    HMP1                  ; 3
L9417:
    and    #$0F                  ; 2
    tay                          ; 2
    lda    L96AA,Y               ; 4
    sta    $ED                   ; 3
    jmp.ind ($00ED)              ; 5   $95xx

L9422:
    .byte $00 ; |        | $9422
    .byte $00 ; |        | $9423
    .byte $AA ; |X X X X | $9424
    .byte $55 ; | X X X X| $9425
    .byte $AA ; |X X X X | $9426
    .byte $55 ; | X X X X| $9427
    .byte $AA ; |X X X X | $9428
    .byte $55 ; | X X X X| $9429
    .byte $AA ; |X X X X | $942A
    .byte $55 ; | X X X X| $942B
    .byte $AA ; |X X X X | $942C
    .byte $55 ; | X X X X| $942D
    .byte $AA ; |X X X X | $942E
    .byte $55 ; | X X X X| $942F
    .byte $AA ; |X X X X | $9430
    .byte $55 ; | X X X X| $9431
    .byte $AA ; |X X X X | $9432
    .byte $55 ; | X X X X| $9433
    .byte $AA ; |X X X X | $9434
    .byte $55 ; | X X X X| $9435
    .byte $AA ; |X X X X | $9436
    .byte $55 ; | X X X X| $9437
L9438:
    .byte $00 ; |        | $9438
    .byte $00 ; |        | $9439
    .byte $55 ; | X X X X| $943A
    .byte $AA ; |X X X X | $943B
    .byte $55 ; | X X X X| $943C
    .byte $AA ; |X X X X | $943D
    .byte $55 ; | X X X X| $943E
    .byte $AA ; |X X X X | $943F
    .byte $55 ; | X X X X| $9440
    .byte $AA ; |X X X X | $9441
    .byte $55 ; | X X X X| $9442
    .byte $AA ; |X X X X | $9443
    .byte $55 ; | X X X X| $9444
    .byte $AA ; |X X X X | $9445
    .byte $55 ; | X X X X| $9446
    .byte $AA ; |X X X X | $9447
    .byte $55 ; | X X X X| $9448
    .byte $AA ; |X X X X | $9449
    .byte $55 ; | X X X X| $944A
    .byte $AA ; |X X X X | $944B
    .byte $55 ; | X X X X| $944C
    .byte $AA ; |X X X X | $944D
L944E:
    .byte $00 ; |        | $944E
    .byte $00 ; |        | $944F
    .byte $AA ; |X X X X | $9450
    .byte $55 ; | X X X X| $9451
    .byte $AA ; |X X X X | $9452
    .byte $55 ; | X X X X| $9453
    .byte $AA ; |X X X X | $9454
    .byte $55 ; | X X X X| $9455
    .byte $AA ; |X X X X | $9456
    .byte $55 ; | X X X X| $9457
    .byte $AA ; |X X X X | $9458
    .byte $55 ; | X X X X| $9459
    .byte $AA ; |X X X X | $945A
    .byte $00 ; |        | $945B
    .byte $00 ; |        | $945C
    .byte $00 ; |        | $945D
    .byte $00 ; |        | $945E
    .byte $00 ; |        | $945F
    .byte $00 ; |        | $9460
    .byte $00 ; |        | $9461
    .byte $00 ; |        | $9462
    .byte $00 ; |        | $9463
L9464:
    .byte $00 ; |        | $9464
    .byte $00 ; |        | $9465
    .byte $55 ; | X X X X| $9466
    .byte $AA ; |X X X X | $9467
    .byte $55 ; | X X X X| $9468
    .byte $AA ; |X X X X | $9469
    .byte $55 ; | X X X X| $946A
    .byte $AA ; |X X X X | $946B
    .byte $55 ; | X X X X| $946C
    .byte $AA ; |X X X X | $946D
    .byte $55 ; | X X X X| $946E
    .byte $AA ; |X X X X | $946F
    .byte $55 ; | X X X X| $9470
    .byte $00 ; |        | $9471
    .byte $00 ; |        | $9472
    .byte $00 ; |        | $9473
    .byte $00 ; |        | $9474
    .byte $00 ; |        | $9475
    .byte $00 ; |        | $9476
    .byte $00 ; |        | $9477
    .byte $00 ; |        | $9478
    .byte $00 ; |        | $9479
L947A:
    .byte $00 ; |        | $947A
    .byte $99 ; |X  XX  X| $947B
    .byte $18 ; |   XX   | $947C
    .byte $2A ; |  X X X | $947D
    .byte $A8 ; |X X X   | $947E
    .byte $15 ; |   X X X| $947F
    .byte $54 ; | X X X  | $9480
    .byte $22 ; |  X   X | $9481
    .byte $41 ; | X     X| $9482
    .byte $84 ; |X    X  | $9483
    .byte $C4 ; |XX   X  | $9484
    .byte $46 ; | X   XX | $9485
    .byte $C0 ; |XX      | $9486
    .byte $06 ; |     XX | $9487
    .byte $00 ; |        | $9488
    .byte $00 ; |        | $9489
    .byte $81 ; |X      X| $948A
    .byte $C3 ; |XX    XX| $948B
    .byte $66 ; | XX  XX | $948C
    .byte $76 ; | XXX XX | $948D
    .byte $42 ; | X    X | $948E
    .byte $42 ; | X    X | $948F
    .byte $14 ; |   X X  | $9490
    .byte $28 ; |  X X   | $9491
    .byte $34 ; |  XX X  | $9492
    .byte $2C ; |  X XX  | $9493
    .byte $28 ; |  X X   | $9494
    .byte $14 ; |   X X  | $9495
    .byte $3C ; |  XXXX  | $9496
    .byte $66 ; | XX  XX | $9497
    .byte $E7 ; |XXX  XXX| $9498
    .byte $E7 ; |XXX  XXX| $9499
    .byte $4A ; | X  X X | $949A
    .byte $11 ; |   X   X| $949B
    .byte $40 ; | X      | $949C
    .byte $44 ; | X   X  | $949D
    .byte $E0 ; |XXX     | $949E
    .byte $E0 ; |XXX     | $949F
    .byte $20 ; |  X     | $94A0
    .byte $E0 ; |XXX     | $94A1
    .byte $E0 ; |XXX     | $94A2
    .byte $20 ; |  X     | $94A3
    .byte $E0 ; |XXX     | $94A4
    .byte $20 ; |  X     | $94A5
    .byte $80 ; |X       | $94A6
    .byte $BB ; |X XXX XX| $94A7
    .byte $BB ; |X XXX XX| $94A8
    .byte $FF ; |XXXXXXXX| $94A9
    .byte $28 ; |  X X   | $94AA
    .byte $68 ; | XX X   | $94AB
    .byte $7C ; | XXXXX  | $94AC
    .byte $7C ; | XXXXX  | $94AD
    .byte $7F ; | XXXXXXX| $94AE
    .byte $77 ; | XXX XXX| $94AF
    .byte $76 ; | XXX XX | $94B0
    .byte $72 ; | XXX  X | $94B1
    .byte $00 ; |        | $94B2
    .byte $00 ; |        | $94B3
    .byte $00 ; |        | $94B4
    .byte $3C ; |  XXXX  | $94B5
    .byte $3C ; |  XXXX  | $94B6
    .byte $14 ; |   X X  | $94B7
    .byte $15 ; |   X X X| $94B8
    .byte $40 ; | X      | $94B9
L94BA:
    .byte $00 ; |        | $94BA
    .byte $00 ; |        | $94BB
    .byte $00 ; |        | $94BC
    .byte $00 ; |        | $94BD
    .byte $00 ; |        | $94BE
    .byte $00 ; |        | $94BF
    .byte $00 ; |        | $94C0
    .byte $00 ; |        | $94C1
    .byte $00 ; |        | $94C2
    .byte $00 ; |        | $94C3
    .byte $00 ; |        | $94C4
    .byte $00 ; |        | $94C5
    .byte $00 ; |        | $94C6
    .byte $00 ; |        | $94C7
    .byte $00 ; |        | $94C8
    .byte $00 ; |        | $94C9
    .byte $00 ; |        | $94CA
    .byte $00 ; |        | $94CB
    .byte $00 ; |        | $94CC
    .byte $00 ; |        | $94CD
    .byte $00 ; |        | $94CE
    .byte $00 ; |        | $94CF
    .byte $00 ; |        | $94D0
    .byte $00 ; |        | $94D1
    .byte $00 ; |        | $94D2
    .byte $00 ; |        | $94D3
    .byte $00 ; |        | $94D4
    .byte $00 ; |        | $94D5
    .byte $00 ; |        | $94D6
    .byte $00 ; |        | $94D7
    .byte $00 ; |        | $94D8
    .byte $00 ; |        | $94D9
    .byte $00 ; |        | $94DA
    .byte $00 ; |        | $94DB
    .byte $00 ; |        | $94DC
    .byte $00 ; |        | $94DD
    .byte $00 ; |        | $94DE
    .byte $00 ; |        | $94DF
    .byte $00 ; |        | $94E0
    .byte $00 ; |        | $94E1
    .byte $00 ; |        | $94E2
    .byte $00 ; |        | $94E3
    .byte $00 ; |        | $94E4
    .byte $00 ; |        | $94E5
    .byte $00 ; |        | $94E6
    .byte $00 ; |        | $94E7
    .byte $00 ; |        | $94E8
    .byte $00 ; |        | $94E9
    .byte $3C ; |  XXXX  | $94EA
    .byte $3C ; |  XXXX  | $94EB
    .byte $3E ; |  XXXXX | $94EC
    .byte $7E ; | XXXXXX | $94ED
    .byte $7E ; | XXXXXX | $94EE
    .byte $BA ; |X XXX X | $94EF
    .byte $BA ; |X XXX X | $94F0
    .byte $A8 ; |X X X   | $94F1
    .byte $00 ; |        | $94F2
    .byte $00 ; |        | $94F3
    .byte $28 ; |  X X   | $94F4
    .byte $2A ; |  X X X | $94F5
    .byte $7F ; | XXXXXXX| $94F6
    .byte $0A ; |    X X | $94F7
    .byte $8E ; |X   XXX | $94F8
    .byte $00 ; |        | $94F9
L94FA:  ; indirect jump table
    .byte <L9D8F         ; $94FA
    .byte <L9D9D         ; $94FB
    .byte <L9DAB         ; $94FC
    .byte <L9DB9         ; $94FD
    .byte <L9DC7         ; $94FE
    .byte <L9D48         ; $94FF

L9500:  ; indirect jump
    sta    RESP1                 ; 3
    ldy    SC_26|READ,X          ; 4
    sty    $F3                   ; 3
    lda    L9280,Y               ; 4
    sta    NUSIZ1                ; 3
    lda    L92C0,Y               ; 4
    adc    $B2                   ; 3
    tay                          ; 2
    lda    L91C0,Y               ; 4
    sta    COLUP1                ; 3
    nop                          ; 2
    jmp    L95FD                 ; 3

L951B:  ; indirect jump
    ldy    SC_26|READ,X          ; 4
    sta.w  RESP1                 ; 4
    sty    $F3                   ; 3
    lda    L9280,Y               ; 4
    sta    NUSIZ1                ; 3
    lda    L92C0,Y               ; 4
    adc    $B2                   ; 3
    tay                          ; 2
    lda    L91C0,Y               ; 4
    sta.w  COLUP1                ; 4
    jmp    L95FD                 ; 3

L9537:  ; indirect jump
    ldy    SC_26|READ,X          ; 4
    lda    L9280,Y               ; 4
    nop                          ; 2
    sta    RESP1                 ; 3
    sty    $F3                   ; 3
    sta    NUSIZ1                ; 3
    lda    L92C0,Y               ; 4
    adc    $B2                   ; 3
    tay                          ; 2
    lda    L91C0,Y               ; 4
    sta    COLUP1                ; 3
    jmp    L95FD                 ; 3

L9552:  ; indirect jump
    ldy    SC_26|READ,X          ; 4
    sty    $F3                   ; 3
    lda    L9280,Y               ; 4
    sta    NUSIZ1                ; 3
    sta.w  RESP1                 ; 4
    lda    L92C0,Y               ; 4
    adc    $B2                   ; 3
    tay                          ; 2
    lda    L91C0,Y               ; 4
    sta.w  COLUP1                ; 4
    jmp    L95FD                 ; 3

L956E:  ; indirect jump
    ldy    SC_26|READ,X          ; 4
    sty    $F3                   ; 3
    lda    L9280,Y               ; 4
    sta    NUSIZ1                ; 3
    lda    L92C0,Y               ; 4
    nop                          ; 2
    sta    RESP1                 ; 3
    adc    $B2                   ; 3
    tay                          ; 2
    lda    L91C0,Y               ; 4
    sta    COLUP1                ; 3
    jmp    L95FD                 ; 3

L9589:  ; indirect jump
    ldy    SC_26|READ,X          ; 4
    sty    $F3                   ; 3
    lda    L9280,Y               ; 4
    sta    NUSIZ1                ; 3
    lda    L92C0,Y               ; 4
    adc    $B2                   ; 3
    tay                          ; 2
    nop                          ; 2
    sta    RESP1                 ; 3
    lda    L91C0,Y               ; 4
    sta    COLUP1                ; 3
    jmp    L95FD                 ; 3

L95A4:  ; indirect jump
    ldy    SC_26|READ,X          ; 4
    sty    $F3                   ; 3
    lda    L9280,Y               ; 4
    sta    NUSIZ1                ; 3
    lda    L92C0,Y               ; 4
    adc    $B2                   ; 3
    tay                          ; 2
    lda    L91C0,Y               ; 4
    sta    COLUP1                ; 3
    sta    RESP1                 ; 3
    nop                          ; 2
    jmp    L95FD                 ; 3

L95BF:  ; indirect jump
    ldy    SC_26|READ,X          ; 4
    sty    $F3                   ; 3
    lda    L9280,Y               ; 4
    sta    NUSIZ1                ; 3
    lda    L92C0,Y               ; 4
    adc    $B2                   ; 3
    tay                          ; 2
    lda    L91C0,Y               ; 4
    sta    COLUP1                ; 3
    ldy    $C1                   ; 3
    lda    $F6                   ; 3
    ldx    $EA                   ; 3
    sta.w  RESP1                 ; 4
    nop                          ; 2
    sta    ENABL                 ; 3
    jmp    L9606                 ; 3

L95E3:  ; indirect jump
    ldy    SC_26|READ,X          ; 4
    sty    $F3                   ; 3
    lda    L9280,Y               ; 4
    sta    NUSIZ1                ; 3
    lda    L92C0,Y               ; 4
    adc    $B2                   ; 3
    tay                          ; 2
    lda    L91C0,Y               ; 4
    sta    COLUP1                ; 3
    ldx    $C1                   ; 3
    nop                          ; 2
    sta    RESP1                 ; 3
L95FD:
    lda    $F6                   ; 3
    ldy    $C1                   ; 3
    ldx    $EA                   ; 3
    sta.w  ENABL                 ; 4
L9606:
    bit    $F4                   ; 3
    bvc    L963A                 ; 2³
    lda    L9201,Y               ; 4
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    beq    L961C                 ; 2³
    lda    L96B2,Y               ; 4
    sta    $EF                   ; 3
    jmp.ind ($00EF)              ; 5   $97xx

L961C:
    lda    $85,X                 ; 4
    and    #$3F                  ; 2
    sta    RESBL                 ; 3
    tay                          ; 2
    lda    #$3F                  ; 2
    sta    $F4                   ; 3
    ldx    SC_00|READ,Y          ; 4
    lda    L9200,X               ; 4
    sta    $EF                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    L91A7,X               ; 4
    sta    $EB                   ; 3
    jmp    L97E6                 ; 3

L963A:
    jmp.ind ($00BD)              ; 5   $9Dxx

L963D:
    .byte $61 ; | XX    X| $963D
    .byte $02 ; |      X | $963E
    .byte $02 ; |      X | $963F
    .byte $61 ; | XX    X| $9640
    .byte $61 ; | XX    X| $9641
    .byte $61 ; | XX    X| $9642
    .byte $61 ; | XX    X| $9643
    .byte $61 ; | XX    X| $9644
    .byte $61 ; | XX    X| $9645
    .byte $61 ; | XX    X| $9646
    .byte $61 ; | XX    X| $9647
    .byte $61 ; | XX    X| $9648
    .byte $61 ; | XX    X| $9649
    .byte $61 ; | XX    X| $964A
    .byte $61 ; | XX    X| $964B
    .byte $61 ; | XX    X| $964C
    .byte $61 ; | XX    X| $964D
    .byte $61 ; | XX    X| $964E
    .byte $61 ; | XX    X| $964F
    .byte $61 ; | XX    X| $9650
    .byte $61 ; | XX    X| $9651
    .byte $61 ; | XX    X| $9652
    .byte $61 ; | XX    X| $9653
    .byte $61 ; | XX    X| $9654
    .byte $61 ; | XX    X| $9655
    .byte $61 ; | XX    X| $9656
    .byte $61 ; | XX    X| $9657
    .byte $61 ; | XX    X| $9658
    .byte $61 ; | XX    X| $9659
    .byte $61 ; | XX    X| $965A
    .byte $61 ; | XX    X| $965B
    .byte $61 ; | XX    X| $965C
    .byte $61 ; | XX    X| $965D
    .byte $61 ; | XX    X| $965E
    .byte $61 ; | XX    X| $965F
    .byte $61 ; | XX    X| $9660
    .byte $61 ; | XX    X| $9661
    .byte $61 ; | XX    X| $9662
    .byte $61 ; | XX    X| $9663
    .byte $61 ; | XX    X| $9664
    .byte $61 ; | XX    X| $9665
    .byte $61 ; | XX    X| $9666
    .byte $61 ; | XX    X| $9667
    .byte $61 ; | XX    X| $9668
    .byte $61 ; | XX    X| $9669
    .byte $61 ; | XX    X| $966A
    .byte $61 ; | XX    X| $966B
    .byte $61 ; | XX    X| $966C
    .byte $61 ; | XX    X| $966D
    .byte $61 ; | XX    X| $966E
    .byte $61 ; | XX    X| $966F
    .byte $61 ; | XX    X| $9670
    .byte $61 ; | XX    X| $9671
    .byte $61 ; | XX    X| $9672
    .byte $61 ; | XX    X| $9673
    .byte $61 ; | XX    X| $9674
    .byte $61 ; | XX    X| $9675
    .byte $61 ; | XX    X| $9676
    .byte $61 ; | XX    X| $9677
    .byte $61 ; | XX    X| $9678
    .byte $61 ; | XX    X| $9679
    .byte $61 ; | XX    X| $967A
    .byte $61 ; | XX    X| $967B
    .byte $61 ; | XX    X| $967C
    .byte $61 ; | XX    X| $967D
    .byte $61 ; | XX    X| $967E
    .byte $61 ; | XX    X| $967F
    .byte $61 ; | XX    X| $9680
    .byte $61 ; | XX    X| $9681
    .byte $61 ; | XX    X| $9682
    .byte $61 ; | XX    X| $9683
    .byte $61 ; | XX    X| $9684
    .byte $61 ; | XX    X| $9685
    .byte $61 ; | XX    X| $9686
    .byte $61 ; | XX    X| $9687
    .byte $61 ; | XX    X| $9688
    .byte $61 ; | XX    X| $9689
    .byte $61 ; | XX    X| $968A
    .byte $61 ; | XX    X| $968B
    .byte $61 ; | XX    X| $968C
    .byte $61 ; | XX    X| $968D
    .byte $61 ; | XX    X| $968E
    .byte $61 ; | XX    X| $968F
    .byte $61 ; | XX    X| $9690
    .byte $61 ; | XX    X| $9691
    .byte $61 ; | XX    X| $9692
    .byte $61 ; | XX    X| $9693
    .byte $61 ; | XX    X| $9694
    .byte $61 ; | XX    X| $9695
    .byte $61 ; | XX    X| $9696
    .byte $61 ; | XX    X| $9697
    .byte $61 ; | XX    X| $9698
    .byte $61 ; | XX    X| $9699
    .byte $61 ; | XX    X| $969A
    .byte $61 ; | XX    X| $969B
    .byte $61 ; | XX    X| $969C
    .byte $61 ; | XX    X| $969D
L969E:
    .byte $10 ; |   X    | $969E   NUSIZ0
    .byte $10 ; |   X    | $969F
    .byte $11 ; |   X   X| $96A0
    .byte $11 ; |   X   X| $96A1
    .byte $11 ; |   X   X| $96A2
    .byte $11 ; |   X   X| $96A3
L96A4:
    .byte $20 ; |  X     | $96A4   NUSIZ1
    .byte $20 ; |  X     | $96A5
    .byte $20 ; |  X     | $96A6
    .byte $20 ; |  X     | $96A7
    .byte $21 ; |  X    X| $96A8
    .byte $21 ; |  X    X| $96A9
L96AA:  ; indirect jump table
    .byte <L9500         ; $96AA
    .byte <L951B         ; $96AB
    .byte <L9537         ; $96AC
    .byte <L9552         ; $96AD
    .byte <L956E         ; $96AE
    .byte <L9589         ; $96AF
    .byte <L95A4         ; $96B0
    .byte <L95E3         ; $96B1
L96B2:  ; indirect jump table
    .byte <L95BF         ; $96B2   this one belongs to the table above?
    .byte <L9705         ; $96B3
    .byte <L9721         ; $96B4
    .byte <L973D         ; $96B5
    .byte <L975A         ; $96B6
    .byte <L9776         ; $96B7
    .byte <L9793         ; $96B8
    .byte <L97B0         ; $96B9
    .byte <L97CC         ; $96BA
L96BB:  ; indirect jump table
    .byte <L9D58         ; $96BB
    .byte <L9D64         ; $96BC
    .byte <L9D70         ; $96BD
    .byte <L9D7E         ; $96BE
    .byte <L9D8C         ; $96BF
L96C0:
    .byte $00 ; |        | $96C0
    .byte $C3 ; |XX    XX| $96C1
    .byte $00 ; |        | $96C2
    .byte $9C ; |X  XXX  | $96C3
    .byte $38 ; |  XXX   | $96C4
    .byte $1C ; |   XXX  | $96C5
    .byte $39 ; |  XXX  X| $96C6
    .byte $24 ; |  X  X  | $96C7
    .byte $22 ; |  X   X | $96C8
    .byte $C5 ; |XX   X X| $96C9
    .byte $68 ; | XX X   | $96CA
    .byte $2C ; |  X XX  | $96CB
    .byte $68 ; | XX X   | $96CC
    .byte $2C ; |  X XX  | $96CD
    .byte $18 ; |   XX   | $96CE
    .byte $81 ; |X      X| $96CF
    .byte $C3 ; |XX    XX| $96D0
    .byte $FF ; |XXXXXXXX| $96D1
    .byte $66 ; | XX  XX | $96D2
    .byte $76 ; | XXX XX | $96D3
    .byte $24 ; |  X  X  | $96D4
    .byte $24 ; |  X  X  | $96D5
    .byte $24 ; |  X  X  | $96D6
    .byte $24 ; |  X  X  | $96D7
    .byte $7E ; | XXXXXX | $96D8
    .byte $7E ; | XXXXXX | $96D9
    .byte $24 ; |  X  X  | $96DA
    .byte $24 ; |  X  X  | $96DB
    .byte $3C ; |  XXXX  | $96DC
    .byte $7E ; | XXXXXX | $96DD
    .byte $FF ; |XXXXXXXX| $96DE
    .byte $7E ; | XXXXXX | $96DF
    .byte $90 ; |X  X    | $96E0
    .byte $4A ; | X  X X | $96E1
    .byte $E0 ; |XXX     | $96E2
    .byte $EE ; |XXX XXX | $96E3
    .byte $9F ; |X  XXXXX| $96E4
    .byte $3F ; |  XXXXXX| $96E5
    .byte $3F ; |  XXXXXX| $96E6
    .byte $3F ; |  XXXXXX| $96E7
    .byte $BF ; |X XXXXXX| $96E8
    .byte $3F ; |  XXXXXX| $96E9
    .byte $BF ; |X XXXXXX| $96EA
    .byte $3F ; |  XXXXXX| $96EB
    .byte $FF ; |XXXXXXXX| $96EC
    .byte $A3 ; |X X   XX| $96ED
    .byte $AB ; |X X X XX| $96EE
    .byte $9B ; |X  XX XX| $96EF
    .byte $18 ; |   XX   | $96F0
    .byte $1A ; |   XX X | $96F1
    .byte $5E ; | X XXXX | $96F2
    .byte $7E ; | XXXXXX | $96F3
    .byte $FA ; |XXXXX X | $96F4
    .byte $AA ; |X X X X | $96F5
    .byte $2A ; |  X X X | $96F6
    .byte $28 ; |  X X   | $96F7
    .byte $00 ; |        | $96F8
    .byte $00 ; |        | $96F9
    .byte $18 ; |   XX   | $96FA
    .byte $7A ; | XXXX X | $96FB
    .byte $7E ; | XXXXXX | $96FC
    .byte $2A ; |  X X X | $96FD
    .byte $22 ; |  X   X | $96FE
    .byte $00 ; |        | $96FF
    .byte $00 ; |        | $9700
    .byte $00 ; |        | $9701
    .byte $00 ; |        | $9702
    .byte $00 ; |        | $9703
    .byte $00 ; |        | $9704

L9705:  ; indirect jump
    sta    RESBL                 ; 3
    lda    #$3F                  ; 2
    sta    $F4                   ; 3
    and    $85,X                 ; 4
    tay                          ; 2
    ldx    SC_00|READ,Y          ; 4
    lda    L9200,X               ; 4
    sta    $EF                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    L91A7,X               ; 4
    sta    $EB                   ; 3
    jmp    L97E6                 ; 3

L9721:  ; indirect jump
    lda    #$3F                  ; 2
    sta    $F4                   ; 3
    sta    RESBL                 ; 3
    and    $85,X                 ; 4
    tay                          ; 2
    ldx    SC_00|READ,Y          ; 4
    lda    L9200,X               ; 4
    sta    $EF                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    L91A7,X               ; 4
    sta    $EB                   ; 3
    jmp    L97E6                 ; 3

L973D:  ; indirect jump
    lda    #$3F                  ; 2
    sta    $F4                   ; 3
    and    $85,X                 ; 4
    sta.w  RESBL                 ; 4
    tay                          ; 2
    ldx    SC_00|READ,Y          ; 4
    lda    L9200,X               ; 4
    sta    $EF                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    L91A7,X               ; 4
    sta    $EB                   ; 3
    jmp    L97E6                 ; 3

L975A:  ; indirect jump
    lda    #$3F                  ; 2
    sta    $F4                   ; 3
    and    $85,X                 ; 4
    tay                          ; 2
    ldx    SC_00|READ,Y          ; 4
    sta    RESBL                 ; 3
    lda    L9200,X               ; 4
    sta    $EF                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    L91A7,X               ; 4
    sta    $EB                   ; 3
    jmp    L97E6                 ; 3

L9776:  ; indirect jump
    lda    #$3F                  ; 2
    sta    $F4                   ; 3
    and    $85,X                 ; 4
    tay                          ; 2
    ldx    SC_00|READ,Y          ; 4
    lda    L9200,X               ; 4
    sta.w  RESBL                 ; 4
    sta    $EF                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    L91A7,X               ; 4
    sta    $EB                   ; 3
    jmp    L97E6                 ; 3

L9793:  ; indirect jump
    lda    #$3F                  ; 2
    sta    $F4                   ; 3
    and    $85,X                 ; 4
    tay                          ; 2
    ldx    SC_00|READ,Y          ; 4
    lda    L9200,X               ; 4
    sta    $EF                   ; 3
    and    #$0F                  ; 2
    sta.w  RESBL                 ; 4
    tax                          ; 2
    lda    L91A7,X               ; 4
    sta    $EB                   ; 3
    jmp    L97E6                 ; 3

L97B0:  ; indirect jump
    lda    #$3F                  ; 2
    sta    $F4                   ; 3
    and    $85,X                 ; 4
    tay                          ; 2
    ldx    SC_00|READ,Y          ; 4
    lda    L9200,X               ; 4
    sta    $EF                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    L91A7,X               ; 4
    sta    RESBL                 ; 3
    sta    $EB                   ; 3
    jmp    L97E6                 ; 3

L97CC:  ; indirect jump
    lda    #$3F                  ; 2
    sta    $F4                   ; 3
    and    $85,X                 ; 4
    tay                          ; 2
    ldx    SC_00|READ,Y          ; 4
    lda    L9200,X               ; 4
    sta    $EF                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    L91A7,X               ; 4
    sta    $EB                   ; 3
    nop                          ; 2
    sta    RESBL                 ; 3
L97E6:
    ldy    $F1                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    L9B4C,Y               ; 4
    sta    GRP0                  ; 3
    ldy    $F3                   ; 3
    lda    L9B4C,Y               ; 4
    sta    GRP1                  ; 3
    ldx    $EA                   ; 3
    lda    SC_56|READ,X          ; 4
    and    L9422,X               ; 4
    sta    $F6                   ; 3
    lda    SC_56|READ,X          ; 4
    and    L9438,X               ; 4
    sta    $F7                   ; 3
    lda    SC_6A|READ,X          ; 4
    and    L9438,X               ; 4
    sta    $F8                   ; 3
    lda    SC_6A|READ,X          ; 4
    and    L9422,X               ; 4
    sta    $F9                   ; 3
    lda    L9B8C,Y               ; 4
    sta    GRP1                  ; 3
    ldy    $F1                   ; 3
    lda    L9B8C,Y               ; 4
    sta    GRP0                  ; 3
    lda    $DA                   ; 3
    cpx    $F5                   ; 3
    bne    L9830                 ; 2³
    sta    COLUBK                ; 3
    beq    L9833                 ; 3   always branch

L9830:
    lda    $DA                   ; 3
    nop                          ; 2
L9833:
    lda    $9C,X                 ; 4
    bpl    L983C                 ; 2³
    lda    $D8                   ; 3
    jmp    L983F                 ; 3

L983C:
    lda    $D9                   ; 3
    nop                          ; 2
L983F:
    sta    COLUPF                ; 3
    ldx    $F2                   ; 3
    bmi    L984F                 ; 2³
    dec.w  $F2                   ; 6
    lda    L963D,X               ; 4
    tax                          ; 2
    jmp    L9859                 ; 3

L984F:
    lda    $F4                   ; 3
    sta    $F2                   ; 3
    ldx    #$61                  ; 2
    stx    CTRLPF                ; 3
    stx    $F4                   ; 3
L9859:
    sta    HMCLR                 ; 3
    lda    $F7                   ; 3
    sta    PF2                   ; 3
    lda    $F6                   ; 3
    sta    PF1                   ; 3
    lda    L9C00,Y               ; 4
    stx    ENABL                 ; 3
    sta    GRP0                  ; 3
    ldy    $F3                   ; 3
    lda    L9C00,Y               ; 4
    sta    GRP1                  ; 3
    ldx    $EA                   ; 3
    lda    #$80                  ; 2
    sta    $86,X                 ; 4
    and    $9C,X                 ; 4
    sta    $9C,X                 ; 4
    nop                          ; 2
    lda.w  $F8                   ; 4
    sta    PF1                   ; 3
    lda    $F9                   ; 3
    sta    PF2                   ; 3
    lda    SC_37|READ,X          ; 4
    and    L944E,X               ; 4
    sta    $FA                   ; 3
    lda    $F7                   ; 3
    sta    PF2                   ; 3
    lda    $F6                   ; 3
    sta    PF1                   ; 3
    lda    L9C40,Y               ; 4
    sta    GRP1                  ; 3
    ldy    $F1                   ; 3
    lda    L9C40,Y               ; 4
    sta    GRP0                  ; 3
    lda    SC_37|READ,X          ; 4
    and    L9464,X               ; 4
    sta    $FB                   ; 3
    lda    SC_4B|READ,X          ; 4
    and    L9464,X               ; 4
    sta    $FC                   ; 3
    lda    SC_4B|READ,X          ; 4
    and    L944E,X               ; 4
    ldx    $F9                   ; 3
    stx    PF2                   ; 3
    ldx    $F8                   ; 3
    stx    PF1                   ; 3
    sta    $FD                   ; 3
    lda    $F7                   ; 3
    sta    PF2                   ; 3
    ldx    $F6                   ; 3
    lda    L96C0,Y               ; 4
    stx    PF1                   ; 3
    sta    GRP0                  ; 3
    ldy    $F3                   ; 3
    lda    L96C0,Y               ; 4
    sta    GRP1                  ; 3
    ldx    $F2                   ; 3
    bmi    L98E3                 ; 2³
    dec.w  $F2                   ; 6
    lda    L963D,X               ; 4
    tax                          ; 2
    jmp    L98ED                 ; 3

L98E3:
    lda    $F4                   ; 3
    sta    $F2                   ; 3
    ldx    #$61                  ; 2
    stx    CTRLPF                ; 3
    stx    $F4                   ; 3
L98ED:
    lda    L947A,Y               ; 4
    cpx    #$61                  ; 2
    ldy    $F8                   ; 3
    sty    PF1                   ; 3
    ldy    $F9                   ; 3
    sty    PF2                   ; 3
    dec    $EA                   ; 5
    ldy    $FB                   ; 3
    sty.w  PF2                   ; 4
    bcs    L9908                 ; 2³
    ldy    $D9                   ; 3
    jmp    L990B                 ; 3

L9908:
    clc                          ; 2
    ldy    $D8                   ; 3
L990B:
    sty    COLUPF                ; 3
    stx    ENABL                 ; 3
    sta    GRP1                  ; 3
    ldy    $F1                   ; 3
    lda    L947A,Y               ; 4
    sta    GRP0                  ; 3
    lda    $FA                   ; 3
    sta    PF1                   ; 3
L991C:
    ldx    $F2                   ; 3
    bmi    L992A                 ; 2³
    dec.w  $F2                   ; 6
    lda    L963D,X               ; 4
    tax                          ; 2
    jmp    L9934                 ; 3

L992A:
    lda    $F4                   ; 3
    sta    $F2                   ; 3
    ldx    #$61                  ; 2
    stx    CTRLPF                ; 3
    stx    $F4                   ; 3
L9934:
    stx    $F6                   ; 3
    lda    #0                    ; 2
    ldx    $FD                   ; 3
    stx    PF2                   ; 3
    ldx    $FC                   ; 3
    stx    PF1                   ; 3
    ldx    $EF                   ; 3
    stx    HMP0                  ; 3
    ldx    $EA                   ; 3
    sta    PF2                   ; 3
    sta    ENAM0                 ; 3
    sta    PF1                   ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    $D9                   ; 3
    sta    COLUPF                ; 3
    lda    $86,X                 ; 4
    bmi    L996B                 ; 2³
    asl                          ; 2
    bmi    L995F                 ; 2³
    lsr                          ; 2
    jmp.ind ($00EB)              ; 5   $93xx

L995F:
    cpx    #5                    ; 2
    bcs    L9966                 ; 2³
    jmp    L9FEA                 ; 3   bankswitch, goto LD100

L9966:
    sta    ENABL                 ; 3
    jmp    L9FDE                 ; 3   bankswitch, goto LD3E3

L996B:
    asl                          ; 2
    bmi    L99B9                 ; 2³
    lda    L94BA,Y               ; 4
    sta    GRP0                  ; 3
    tya                          ; 2
    cmp    #$30                  ; 2
    bcc    L9985                 ; 2³
    adc    #7                    ; 2
    cmp    #$40                  ; 2
    bcc    L9989                 ; 2³
    lda    #0                    ; 2
    sta    $F1                   ; 3
    jmp    L998E                 ; 3

L9985:
    lda    #0                    ; 2
    sec                          ; 2
    nop                          ; 2
L9989:
    nop                          ; 2
    sta    $F1                   ; 3
    bcs    L9994                 ; 2³
L998E:
    ldx    L9180,Y               ; 4
    jmp    L9997                 ; 3

L9994:
    tax                          ; 2
    nop                          ; 2
    nop                          ; 2
L9997:
    lda    #0                    ; 2
    sta    HMP0                  ; 3
    ldy    $EA                   ; 3
    lda.wy $86,Y                 ; 4
    and    #$3F                  ; 2
    clc                          ; 2
    stx    GRP0                  ; 3
    tax                          ; 2
    ldy    SC_00|READ,X          ; 4
    lda    L9200,Y               ; 4
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    L96AA,Y               ; 4
    sta    $ED                   ; 3
    jmp.ind ($00ED)              ; 5   $95xx

L99B9:
    nop                          ; 2
    lsr                          ; 2
    and    #$3F                  ; 2
    tay                          ; 2
    lda    L969E,Y               ; 4
    sta    NUSIZ0                ; 3
    lda    L96A4,Y               ; 4
    sta    NUSIZ1                ; 3
    lda    $9C,X                 ; 4
    and    #$7F                  ; 2
    tay                          ; 2
    lda    L9200,Y               ; 4
    sta    HMP0                  ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    $B2                   ; 3
    clc                          ; 2
    adc    #2                    ; 2
    and    #$07                  ; 2
    tax                          ; 2
    lda    L91C0,X               ; 4
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldx.w  $C1                   ; 4
    lda    L9201,X               ; 4
L99EF:
    dey                          ; 2
    bpl    L99EF                 ; 2³
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    ldy    #$3F                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    $F6                   ; 3
    stx    ENABL                 ; 3
    bit    $F4                   ; 3
    bvc    L9A0E                 ; 2³
    sty    $F4                   ; 3
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
L9A09:
    dey                          ; 2
    bpl    L9A09                 ; 2³
    sta    RESBL                 ; 3
L9A0E:
    ldy    #0                    ; 2
    ldx    $EA                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    cpx    $DE                   ; 3
    bne    L9A1E                 ; 2³
    ldy    #2                    ; 2
    bne    L9A20                 ; 3   always branch

L9A1E:
    nop                          ; 2
    nop                          ; 2
L9A20:
    lda    #$44                  ; 2
    sta    GRP0                  ; 3
    sty    ENAM0                 ; 3
    sta    GRP1                  ; 3
    lda    SC_56|READ,X          ; 4
    and    L9422,X               ; 4
    sta    $F6                   ; 3
    lda    SC_56|READ,X          ; 4
    and    L9438,X               ; 4
    sta    $F7                   ; 3
    lda    SC_6A|READ,X          ; 4
    and    L9438,X               ; 4
    sta    $F8                   ; 3
    lda    SC_6A|READ,X          ; 4
    and    L9422,X               ; 4
    sta    $F9                   ; 3
    sty    ENAM1                 ; 3
    lda    #$EE                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    $DA                   ; 3
    cpx    $F5                   ; 3
    bne    L9A5A                 ; 2³
    sta    COLUBK                ; 3
    beq    L9A5D                 ; 3   always branch

L9A5A:
    lda    $DA                   ; 3
    nop                          ; 2
L9A5D:
    lda    SC_37|READ,X          ; 4
    and    L944E,X               ; 4
    sta    $FA                   ; 3
    lda    $9C,X                 ; 4
    bpl    L9A6E                 ; 2³
    lda    $D8                   ; 3
    jmp    L9A71                 ; 3

L9A6E:
    lda    $D9                   ; 3
    nop                          ; 2
L9A71:
    sta    COLUPF                ; 3
    ldy    $F2                   ; 3
    bmi    L9A81                 ; 2³
    dec.w  $F2                   ; 6
    lda    L963D,Y               ; 4
    tay                          ; 2
    jmp    L9A8B                 ; 3

L9A81:
    lda    $F4                   ; 3
    sta    $F2                   ; 3
    ldy    #$61                  ; 2
    sty    CTRLPF                ; 3
    sty    $F4                   ; 3
L9A8B:
    lda    $F7                   ; 3
    sta    PF2                   ; 3
    lda    $F6                   ; 3
    sta    PF1                   ; 3
    sty    ENABL                 ; 3
    lda    #$FF                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #$80                  ; 2
    sta    $86,X                 ; 4
    and    $9C,X                 ; 4
    sta    $9C,X                 ; 4
    lda    SC_37|READ,X          ; 4
    and    L9464,X               ; 4
    sta    $FB                   ; 3
    lda    $F8                   ; 3
    sta.w  PF1                   ; 4
    lda    $F9                   ; 3
    sta    PF2                   ; 3
    lda    SC_4B|READ,X          ; 4
    and    L9464,X               ; 4
    sta    $FC                   ; 3
    lda    $F7                   ; 3
    sta    PF2                   ; 3
    lda    $F6                   ; 3
    sta    PF1                   ; 3
    lda    #$FF                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    $85,X                 ; 4
    and    #$3F                  ; 2
    tay                          ; 2
    ldx    SC_00|READ,Y          ; 4
    lda    L9200,X               ; 4
    sta    $EF                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    L91A7,X               ; 4
    sta    $EB                   ; 3
    ldx    $EA                   ; 3
    lda    $F8                   ; 3
    sta    PF1                   ; 3
    lda    $F9                   ; 3
    sta    PF2                   ; 3
    lda    SC_4B|READ,X          ; 4
    and    L944E,X               ; 4
    sta    $FD                   ; 3
    lda    $F7                   ; 3
    sta    PF2                   ; 3
    lda    $F6                   ; 3
    sta    PF1                   ; 3
    sta    HMCLR                 ; 3
    nop                          ; 2
    lda    #$EE                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    ldx    $F2                   ; 3
    bmi    L9B10                 ; 2³
    dec.w  $F2                   ; 6
    lda    L963D,X               ; 4
    tax                          ; 2
    jmp    L9B1A                 ; 3

L9B10:
    lda    $F4                   ; 3
    sta    $F2                   ; 3
    ldx    #$61                  ; 2
    stx    CTRLPF                ; 3
    stx    $F4                   ; 3
L9B1A:
    dec.w  $EA                   ; 6
    nop                          ; 2
    ldy    $F8                   ; 3
    sty    PF1                   ; 3
    ldy    $F9                   ; 3
    sty    PF2                   ; 3
    cpx    #$61                  ; 2
    bcs    L9B2F                 ; 2³
    ldy    $D9                   ; 3
    jmp    L9B32                 ; 3

L9B2F:
    ldy    $D8                   ; 3
    clc                          ; 2
L9B32:
    lda    $FB                   ; 3
    sta    PF2                   ; 3
    lda    $FA                   ; 3
    sta.w  PF1                   ; 4
    sty    COLUPF                ; 3
    stx    ENABL                 ; 3
    ldy    #0                    ; 2
    sty    ENAM1                 ; 3
    lda    #$44                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    jmp    L991C                 ; 3

L9B4C:
    .byte $00 ; |        | $9B4C
    .byte $00 ; |        | $9B4D
    .byte $C3 ; |XX    XX| $9B4E
    .byte $15 ; |   X X X| $9B4F
    .byte $54 ; | X X X  | $9B50
    .byte $2A ; |  X X X | $9B51
    .byte $A8 ; |X X X   | $9B52
    .byte $66 ; | XX  XX | $9B53
    .byte $41 ; | X     X| $9B54
    .byte $22 ; |  X   X | $9B55
    .byte $86 ; |X    XX | $9B56
    .byte $C2 ; |XX    X | $9B57
    .byte $06 ; |     XX | $9B58
    .byte $C0 ; |XX      | $9B59
    .byte $A5 ; |X X  X X| $9B5A
    .byte $24 ; |  X  X  | $9B5B
    .byte $24 ; |  X  X  | $9B5C
    .byte $00 ; |        | $9B5D
    .byte $00 ; |        | $9B5E
    .byte $18 ; |   XX   | $9B5F
    .byte $38 ; |  XXX   | $9B60
    .byte $1C ; |   XXX  | $9B61
    .byte $38 ; |  XXX   | $9B62
    .byte $1C ; |   XXX  | $9B63
    .byte $00 ; |        | $9B64
    .byte $00 ; |        | $9B65
    .byte $38 ; |  XXX   | $9B66
    .byte $1C ; |   XXX  | $9B67
    .byte $18 ; |   XX   | $9B68
    .byte $18 ; |   XX   | $9B69
    .byte $00 ; |        | $9B6A
    .byte $00 ; |        | $9B6B
    .byte $BA ; |X XXX X | $9B6C
    .byte $AA ; |X X X X | $9B6D
    .byte $40 ; | X      | $9B6E
    .byte $44 ; | X   X  | $9B6F
    .byte $E0 ; |XXX     | $9B70
    .byte $E0 ; |XXX     | $9B71
    .byte $A0 ; |X X     | $9B72
    .byte $E0 ; |XXX     | $9B73
    .byte $80 ; |X       | $9B74
    .byte $E0 ; |XXX     | $9B75
    .byte $E0 ; |XXX     | $9B76
    .byte $E0 ; |XXX     | $9B77
    .byte $80 ; |X       | $9B78
    .byte $BB ; |X XXX XX| $9B79
    .byte $BB ; |X XXX XX| $9B7A
    .byte $FF ; |XXXXXXXX| $9B7B
    .byte $10 ; |   X    | $9B7C
    .byte $00 ; |        | $9B7D
    .byte $00 ; |        | $9B7E
    .byte $08 ; |    X   | $9B7F
    .byte $2A ; |  X X X | $9B80
    .byte $28 ; |  X X   | $9B81
    .byte $08 ; |    X   | $9B82
    .byte $28 ; |  X X   | $9B83
    .byte $14 ; |   X X  | $9B84
    .byte $1E ; |   XXXX | $9B85
    .byte $7E ; | XXXXXX | $9B86
    .byte $3E ; |  XXXXX | $9B87
    .byte $FF ; |XXXXXXXX| $9B88
    .byte $BE ; |X XXXXX | $9B89
    .byte $AA ; |X X X X | $9B8A
    .byte $38 ; |  XXX   | $9B8B
L9B8C:
    .byte $00 ; |        | $9B8C
    .byte $18 ; |   XX   | $9B8D
    .byte $DB ; |XX XX XX| $9B8E
    .byte $9C ; |X  XXX  | $9B8F
    .byte $38 ; |  XXX   | $9B90
    .byte $1C ; |   XXX  | $9B91
    .byte $39 ; |  XXX  X| $9B92
    .byte $98 ; |X  XX   | $9B93
    .byte $1A ; |   XX X | $9B94
    .byte $59 ; | X XX  X| $9B95
    .byte $4C ; | X  XX  | $9B96
    .byte $64 ; | XX  X  | $9B97
    .byte $2C ; |  X XX  | $9B98
    .byte $68 ; | XX X   | $9B99
    .byte $C3 ; |XX    XX| $9B9A
    .byte $5A ; | X XX X | $9B9B
    .byte $18 ; |   XX   | $9B9C
    .byte $00 ; |        | $9B9D
    .byte $3C ; |  XXXX  | $9B9E
    .byte $3C ; |  XXXX  | $9B9F
    .byte $6C ; | XX XX  | $9BA0
    .byte $36 ; |  XX XX | $9BA1
    .byte $6C ; | XX XX  | $9BA2
    .byte $36 ; |  XX XX | $9BA3
    .byte $38 ; |  XXX   | $9BA4
    .byte $1C ; |   XXX  | $9BA5
    .byte $6C ; | XX XX  | $9BA6
    .byte $36 ; |  XX XX | $9BA7
    .byte $18 ; |   XX   | $9BA8
    .byte $18 ; |   XX   | $9BA9
    .byte $00 ; |        | $9BAA
    .byte $00 ; |        | $9BAB
    .byte $7D ; | XXXXX X| $9BAC
    .byte $5D ; | X XXX X| $9BAD
    .byte $E0 ; |XXX     | $9BAE
    .byte $EE ; |XXX XXX | $9BAF
    .byte $3F ; |  XXXXXX| $9BB0
    .byte $3F ; |  XXXXXX| $9BB1
    .byte $BF ; |X XXXXXX| $9BB2
    .byte $9F ; |X  XXXXX| $9BB3
    .byte $9F ; |X  XXXXX| $9BB4
    .byte $3F ; |  XXXXXX| $9BB5
    .byte $BF ; |X XXXXXX| $9BB6
    .byte $BF ; |X XXXXXX| $9BB7
    .byte $FF ; |XXXXXXXX| $9BB8
    .byte $8B ; |X   X XX| $9BB9
    .byte $AB ; |X X X XX| $9BBA
    .byte $91 ; |X  X   X| $9BBB
    .byte $10 ; |   X    | $9BBC
    .byte $08 ; |    X   | $9BBD
    .byte $00 ; |        | $9BBE
    .byte $34 ; |  XX X  | $9BBF
    .byte $7D ; | XXXXX X| $9BC0
    .byte $54 ; | X X X  | $9BC1
    .byte $45 ; | X   X X| $9BC2
    .byte $10 ; |   X    | $9BC3
    .byte $10 ; |   X    | $9BC4
    .byte $3A ; |  XXX X | $9BC5
    .byte $7A ; | XXXX X | $9BC6
    .byte $7E ; | XXXXXX | $9BC7
    .byte $7E ; | XXXXXX | $9BC8
    .byte $55 ; | X X X X| $9BC9
    .byte $1C ; |   XXX  | $9BCA
    .byte $54 ; | X X X  | $9BCB

L9BCC:
    lda    #<L9D13               ; 2
L9BCE:
    sta    $BD                   ; 3
L9BD0:
    lda    #$3F                  ; 2
    and    $85,X                 ; 4
    tay                          ; 2
    ldx    SC_00|READ,Y          ; 4
    lda    L9200,X               ; 4
    sta    $EF                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    L91A7,X               ; 4
    sta    $EB                   ; 3
    jmp    L97E6                 ; 3

    .byte $00 ; |        | $9BE8
    .byte $00 ; |        | $9BE9
    .byte $00 ; |        | $9BEA
    .byte $00 ; |        | $9BEB
    .byte $00 ; |        | $9BEC
    .byte $00 ; |        | $9BED
    .byte $00 ; |        | $9BEE
    .byte $00 ; |        | $9BEF
    .byte $00 ; |        | $9BF0
    .byte $00 ; |        | $9BF1
    .byte $00 ; |        | $9BF2
    .byte $00 ; |        | $9BF3
    .byte $00 ; |        | $9BF4
    .byte $00 ; |        | $9BF5
    .byte $00 ; |        | $9BF6
    .byte $00 ; |        | $9BF7
    .byte $00 ; |        | $9BF8
    .byte $00 ; |        | $9BF9
    .byte $00 ; |        | $9BFA
    .byte $00 ; |        | $9BFB
    .byte $00 ; |        | $9BFC
    .byte $00 ; |        | $9BFD
    .byte $00 ; |        | $9BFE
    .byte $00 ; |        | $9BFF
L9C00:
    .byte $00 ; |        | $9C00
    .byte $5A ; | X XX X | $9C01
    .byte $DB ; |XX XX XX| $9C02
    .byte $5E ; | X XXXX | $9C03
    .byte $7B ; | XXXX XX| $9C04
    .byte $DE ; |XX XXXX | $9C05
    .byte $7A ; | XXXX X | $9C06
    .byte $5A ; | X XX X | $9C07
    .byte $DB ; |XX XX XX| $9C08
    .byte $18 ; |   XX   | $9C09
    .byte $18 ; |   XX   | $9C0A
    .byte $30 ; |  XX    | $9C0B
    .byte $58 ; | X XX   | $9C0C
    .byte $34 ; |  XX X  | $9C0D
    .byte $99 ; |X  XX  X| $9C0E
    .byte $DB ; |XX XX XX| $9C0F
    .byte $5A ; | X XX X | $9C10
    .byte $7E ; | XXXXXX | $9C11
    .byte $7E ; | XXXXXX | $9C12
    .byte $3C ; |  XXXX  | $9C13
    .byte $7A ; | XXXX X | $9C14
    .byte $5E ; | X XXXX | $9C15
    .byte $7A ; | XXXX X | $9C16
    .byte $5E ; | X XXXX | $9C17
    .byte $6C ; | XX XX  | $9C18
    .byte $36 ; |  XX XX | $9C19
    .byte $7A ; | XXXX X | $9C1A
    .byte $5E ; | X XXXX | $9C1B
    .byte $3C ; |  XXXX  | $9C1C
    .byte $3C ; |  XXXX  | $9C1D
    .byte $18 ; |   XX   | $9C1E
    .byte $00 ; |        | $9C1F
    .byte $FE ; |XXXXXXX | $9C20
    .byte $3C ; |  XXXX  | $9C21
    .byte $F0 ; |XXXX    | $9C22
    .byte $FF ; |XXXXXXXX| $9C23
    .byte $F5 ; |XXXX X X| $9C24
    .byte $F5 ; |XXXX X X| $9C25
    .byte $B5 ; |X XX X X| $9C26
    .byte $F5 ; |XXXX X X| $9C27
    .byte $F5 ; |XXXX X X| $9C28
    .byte $35 ; |  XX X X| $9C29
    .byte $F5 ; |XXXX X X| $9C2A
    .byte $B5 ; |X XX X X| $9C2B
    .byte $D5 ; |XX X X X| $9C2C
    .byte $B8 ; |X XXX   | $9C2D
    .byte $B8 ; |X XXX   | $9C2E
    .byte $AB ; |X X X XX| $9C2F
    .byte $38 ; |  XXX   | $9C30
    .byte $1C ; |   XXX  | $9C31
    .byte $18 ; |   XX   | $9C32
    .byte $7A ; | XXXX X | $9C33
    .byte $6E ; | XX XXX | $9C34
    .byte $EA ; |XXX X X | $9C35
    .byte $E8 ; |XXX X   | $9C36
    .byte $48 ; | X  X   | $9C37
    .byte $00 ; |        | $9C38
    .byte $2C ; |  X XX  | $9C39
    .byte $3C ; |  XXXX  | $9C3A
    .byte $5E ; | X XXXX | $9C3B
    .byte $BB ; |X XXX XX| $9C3C
    .byte $EA ; |XXX X X | $9C3D
    .byte $AA ; |X X X X | $9C3E
    .byte $8E ; |X   XXX | $9C3F
L9C40:
    .byte $00 ; |        | $9C40
    .byte $DB ; |XX XX XX| $9C41
    .byte $5A ; | X XX X | $9C42
    .byte $5E ; | X XXXX | $9C43
    .byte $7B ; | XXXX XX| $9C44
    .byte $DE ; |XX XXXX | $9C45
    .byte $7A ; | XXXX X | $9C46
    .byte $99 ; |X  XX  X| $9C47
    .byte $18 ; |   XX   | $9C48
    .byte $5A ; | X XX X | $9C49
    .byte $30 ; |  XX    | $9C4A
    .byte $18 ; |   XX   | $9C4B
    .byte $34 ; |  XX X  | $9C4C
    .byte $58 ; | X XX   | $9C4D
    .byte $5A ; | X XX X | $9C4E
    .byte $DB ; |XX XX XX| $9C4F
    .byte $DB ; |XX XX XX| $9C50
    .byte $FF ; |XXXXXXXX| $9C51
    .byte $7E ; | XXXXXX | $9C52
    .byte $34 ; |  XX X  | $9C53
    .byte $7E ; | XXXXXX | $9C54
    .byte $7E ; | XXXXXX | $9C55
    .byte $7E ; | XXXXXX | $9C56
    .byte $7E ; | XXXXXX | $9C57
    .byte $7A ; | XXXX X | $9C58
    .byte $5E ; | X XXXX | $9C59
    .byte $7E ; | XXXXXX | $9C5A
    .byte $7E ; | XXXXXX | $9C5B
    .byte $3C ; |  XXXX  | $9C5C
    .byte $7E ; | XXXXXX | $9C5D
    .byte $7E ; | XXXXXX | $9C5E
    .byte $18 ; |   XX   | $9C5F
    .byte $3D ; |  XXXX X| $9C60
    .byte $1C ; |   XXX  | $9C61
    .byte $F0 ; |XXXX    | $9C62
    .byte $FF ; |XXXXXXXX| $9C63
    .byte $95 ; |X  X X X| $9C64
    .byte $35 ; |  XX X X| $9C65
    .byte $F5 ; |XXXX X X| $9C66
    .byte $35 ; |  XX X X| $9C67
    .byte $B5 ; |X XX X X| $9C68
    .byte $35 ; |  XX X X| $9C69
    .byte $B5 ; |X XX X X| $9C6A
    .byte $F5 ; |XXXX X X| $9C6B
    .byte $D5 ; |XX X X X| $9C6C
    .byte $A0 ; |X X     | $9C6D
    .byte $A8 ; |X X X   | $9C6E
    .byte $AB ; |X X X XX| $9C6F
    .byte $10 ; |   X    | $9C70
    .byte $3C ; |  XXXX  | $9C71
    .byte $3C ; |  XXXX  | $9C72
    .byte $3E ; |  XXXXX | $9C73
    .byte $F7 ; |XXXX XXX| $9C74
    .byte $5D ; | X XXX X| $9C75
    .byte $5C ; | X XXX  | $9C76
    .byte $1C ; |   XXX  | $9C77
    .byte $00 ; |        | $9C78
    .byte $14 ; |   X X  | $9C79
    .byte $34 ; |  XX X  | $9C7A
    .byte $3C ; |  XXXX  | $9C7B
    .byte $F5 ; |XXXX X X| $9C7C
    .byte $5D ; | X XXX X| $9C7D
    .byte $77 ; | XXX XXX| $9C7E
    .byte $24 ; |  X  X  | $9C7F
    .byte $00 ; |        | $9C80
    .byte $00 ; |        | $9C81
    .byte $00 ; |        | $9C82
    .byte $00 ; |        | $9C83
    .byte $00 ; |        | $9C84
    .byte $00 ; |        | $9C85
    .byte $00 ; |        | $9C86
    .byte $00 ; |        | $9C87

L9C88:
    ldy    $C5                   ; 3
    bmi    L9C99                 ; 2³
    ldy    $B9                   ; 3
    beq    L9C94                 ; 2³
    cpy    #$4B                  ; 2
    bcc    L9C99                 ; 2³
L9C94:
    lda    #<L9DCD               ; 2
    jmp    L9BCE                 ; 3

L9C99:
    lda    #<L9D10               ; 2
    jmp    L9BCE                 ; 3

L9C9E:
    lda    $BF                   ; 3
    beq    L9CAF                 ; 2³
    lda    #7                    ; 2
    sta    AUDF0                 ; 3
    lda    #7                    ; 2
    sta    AUDV0                 ; 3
L9CAA:
    lda    #<L9D10               ; 2
    jmp    L9BCE                 ; 3

L9CAF:
    sta    AUDV0                 ; 3
    sta    AUDF0                 ; 3
    beq    L9CAA                 ; 3   always branch

L9CB5:
    ldy    $B9                   ; 3
    lda    L9F01,Y               ; 4
    sta    $B9                   ; 3
    jmp    L9BCC                 ; 3

L9CBF:
    ldy    $BA                   ; 3
    lda    L9E01,Y               ; 4
    sta    $BA                   ; 3
    lda    #<L9D36               ; 2
    jmp    L9BCE                 ; 3

L9CCB:
    lda    $BB                   ; 3
    beq    L9CD6                 ; 2³
    dec    $BB                   ; 5
    lda    #<L9D25               ; 2
    jmp    L9BCE                 ; 3

L9CD6:
    lda    #<L9D13               ; 2
    jmp    L9BCE                 ; 3

L9CDB:
    sta    $B9                   ; 3
    lda    #<L9D00               ; 2
    jmp    L9BCE                 ; 3

L9CE2:
    sta    $BA                   ; 3
    lda    #<L9D25               ; 2
    jmp    L9BCE                 ; 3

L9CE9:
    lda    $BC                   ; 3
    beq    L9CFB                 ; 2³
    dec    $BC                   ; 5
    lda    #<L9DCA               ; 2
    jmp    L9BCE                 ; 3

L9CF4:
    sta    $BA                   ; 3
    lda    #<L9DCA               ; 2
    jmp    L9BCE                 ; 3

L9CFB:
    lda    #<L9D36               ; 2
    jmp    L9BCE                 ; 3

L9D00:  ; indirect jump
    lda    $B9                   ; 3
    bne    L9CCB                 ; 2³+1
    sta    AUDC0                 ; 3
    sta    AUDV0                 ; 3
    sta    AUDF0                 ; 3
    sta    $BB                   ; 3
    lda    #<L9D25               ; 2
    sta    $BD                   ; 3
L9D10:  ; indirect jump
    jmp    L9BD0                 ; 3

L9D13:  ; indirect jump
    ldy    $B9                   ; 3
    lda    L9F00,Y               ; 4
    beq    L9CDB                 ; 2³+1
    sta    $BF                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    L96BB,Y               ; 4
    jmp    L9BCE                 ; 3

L9D25:  ; indirect jump
    lda    $BA                   ; 3
    bne    L9CE9                 ; 2³+1
    sta    AUDC1                 ; 3
    sta    AUDV1                 ; 3
    sta    AUDF1                 ; 3
    sta    $BC                   ; 3
    lda    #<L9DCA               ; 2
    jmp    L9BCE                 ; 3

L9D36:  ; indirect jump
    ldy    $BA                   ; 3
    lda    L9E00,Y               ; 4
    beq    L9CE2                 ; 2³+1
    sta    $BF                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    L94FA,Y               ; 4
    jmp    L9BCE                 ; 3

L9D48:  ; indirect jump
    lda    $B3                   ; 3
    beq    L9CF4                 ; 2³+1
    lsr                          ; 2
    eor    #$FF                  ; 2
    sta    AUDF1                 ; 3
    inc    $BA                   ; 5
    lda    #<L9D25               ; 2
    jmp    L9BCE                 ; 3

L9D58:  ; indirect jump
    lda    $BF                   ; 3
    inc    $B9                   ; 5
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDC0                 ; 3
    jmp    L9BCC                 ; 3

L9D64:  ; indirect jump
    lda    $BF                   ; 3
    inc    $B9                   ; 5
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDF0                 ; 3
    jmp    L9BCC                 ; 3

L9D70:  ; indirect jump
    lda    $BF                   ; 3
    inc    $B9                   ; 5
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDV0                 ; 3
    lda    #<L9D25               ; 2
    jmp    L9BCE                 ; 3

L9D7E:  ; indirect jump
    lda    $BF                   ; 3
    inc    $B9                   ; 5
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $BB                   ; 3
    lda    #<L9D25               ; 2
    jmp    L9BCE                 ; 3

L9D8C:  ; indirect jump
    jmp    L9CB5                 ; 3

L9D8F:  ; indirect jump
    lda    $BF                   ; 3
    inc    $BA                   ; 5
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDC1                 ; 3
    lda    #<L9D36               ; 2
    jmp    L9BCE                 ; 3

L9D9D:  ; indirect jump
    lda    $BF                   ; 3
    inc    $BA                   ; 5
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDF1                 ; 3
    lda    #<L9D36               ; 2
    jmp    L9BCE                 ; 3

L9DAB:  ; indirect jump
    lda    $BF                   ; 3
    inc    $BA                   ; 5
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDV1                 ; 3
    lda    #<L9DCA               ; 2
    jmp    L9BCE                 ; 3

L9DB9:  ; indirect jump
    lda    $BF                   ; 3
    inc    $BA                   ; 5
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $BC                   ; 3
    lda    #<L9DCA               ; 2
    jmp    L9BCE                 ; 3

L9DC7:  ; indirect jump
    jmp    L9CBF                 ; 3

L9DCA:  ; indirect jump
    jmp    L9C88                 ; 3

L9DCD:  ; indirect jump
    ldy    #$FF                  ; 2
    lda    $80                   ; 3
    and    #$0F                  ; 2
    beq    L9DDA                 ; 2³
    cmp    #1                    ; 2
    bne    L9DE1                 ; 2³
    iny                          ; 2
L9DDA:
    sty    $BF                   ; 3
    lda    #<L9DE6               ; 2
    jmp    L9BCE                 ; 3

L9DE1:
    lda    #<L9D10               ; 2
    jmp    L9BCE                 ; 3

L9DE6:  ; indirect jump
    jmp    L9C9E                 ; 3

    .byte $00 ; |        | $9DE9   free bytes
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
    .byte $00 ; |        | $9E00
L9E01:
    .byte $30 ; |  XX    | $9E01   sta BA or BF
    .byte $31 ; |  XX   X| $9E02
    .byte $1A ; |   XX X | $9E03
    .byte $1B ; |   XX XX| $9E04
    .byte $02 ; |      X | $9E05
    .byte $2A ; |  X X X | $9E06
    .byte $23 ; |  X   XX| $9E07
    .byte $68 ; | XX X   | $9E08
    .byte $D9 ; |XX XX  X| $9E09
    .byte $2B ; |  X X XX| $9E0A
    .byte $B9 ; |X XXX  X| $9E0B
    .byte $5B ; | X XX XX| $9E0C
    .byte $D9 ; |XX XX  X| $9E0D
    .byte $2B ; |  X X XX| $9E0E
    .byte $B9 ; |X XXX  X| $9E0F
    .byte $BB ; |X XXX XX| $9E10
    .byte $89 ; |X   X  X| $9E11
    .byte $2B ; |  X X XX| $9E12
    .byte $69 ; | XX X  X| $9E13
    .byte $2B ; |  X X XX| $9E14
    .byte $59 ; | X XX  X| $9E15
    .byte $5B ; | X XX XX| $9E16
    .byte $69 ; | XX X  X| $9E17
    .byte $2B ; |  X X XX| $9E18
    .byte $59 ; | X XX  X| $9E19
    .byte $63 ; | XX   XX| $9E1A
    .byte $00 ; |        | $9E1B
    .byte $20 ; |  X     | $9E1C
    .byte $05 ; |     X X| $9E1D
    .byte $2A ; |  X X X | $9E1E
    .byte $13 ; |   X  XX| $9E1F
    .byte $60 ; | XX     | $9E20
    .byte $05 ; |     X X| $9E21
    .byte $1B ; |   XX XX| $9E22
    .byte $04 ; |     X  | $9E23
    .byte $1C ; |   XXX  | $9E24
    .byte $68 ; | XX X   | $9E25
    .byte $C1 ; |XX     X| $9E26
    .byte $2A ; |  X X X | $9E27
    .byte $03 ; |      XX| $9E28
    .byte $79 ; | XXXX  X| $9E29
    .byte $03 ; |      XX| $9E2A
    .byte $02 ; |      X | $9E2B
    .byte $03 ; |      XX| $9E2C
    .byte $2A ; |  X X X | $9E2D
    .byte $03 ; |      XX| $9E2E
    .byte $02 ; |      X | $9E2F
    .byte $03 ; |      XX| $9E30
    .byte $A9 ; |X X X  X| $9E31
    .byte $2A ; |  X X X | $9E32
    .byte $03 ; |      XX| $9E33
    .byte $91 ; |X  X   X| $9E34
    .byte $03 ; |      XX| $9E35
    .byte $02 ; |      X | $9E36
    .byte $03 ; |      XX| $9E37
    .byte $2A ; |  X X X | $9E38
    .byte $03 ; |      XX| $9E39
    .byte $02 ; |      X | $9E3A
    .byte $03 ; |      XX| $9E3B
    .byte $04 ; |     X  | $9E3C
    .byte $26 ; |  X  XX | $9E3D
    .byte $68 ; | XX X   | $9E3E
    .byte $F9 ; |XXXXX  X| $9E3F
    .byte $1A ; |   XX X | $9E40
    .byte $0B ; |    X XX| $9E41
    .byte $F1 ; |XXXX   X| $9E42
    .byte $0B ; |    X XX| $9E43
    .byte $E9 ; |XXX X  X| $9E44
    .byte $22 ; |  X   X | $9E45
    .byte $0B ; |    X XX| $9E46
    .byte $E1 ; |XXX    X| $9E47
    .byte $2A ; |  X X X | $9E48
    .byte $0B ; |    X XX| $9E49
    .byte $D9 ; |XX XX  X| $9E4A
    .byte $32 ; |  XX  X | $9E4B
    .byte $0B ; |    X XX| $9E4C
    .byte $D1 ; |XX X   X| $9E4D
    .byte $3A ; |  XXX X | $9E4E
    .byte $1B ; |   XX XX| $9E4F
    .byte $D9 ; |XX XX  X| $9E50
    .byte $32 ; |  XX  X | $9E51
    .byte $0B ; |    X XX| $9E52
    .byte $E1 ; |XXX    X| $9E53
    .byte $2A ; |  X X X | $9E54
    .byte $0B ; |    X XX| $9E55
    .byte $E9 ; |XXX X  X| $9E56
    .byte $22 ; |  X   X | $9E57
    .byte $0B ; |    X XX| $9E58
    .byte $F1 ; |XXXX   X| $9E59
    .byte $0B ; |    X XX| $9E5A
    .byte $04 ; |     X  | $9E5B
    .byte $3F ; |  XXXXXX| $9E5C
    .byte $68 ; | XX X   | $9E5D
    .byte $C1 ; |XX     X| $9E5E
    .byte $22 ; |  X   X | $9E5F
    .byte $02 ; |      X | $9E60
    .byte $22 ; |  X   X | $9E61
    .byte $02 ; |      X | $9E62
    .byte $04 ; |     X  | $9E63
    .byte $5E ; | X XXXX | $9E64
    .byte $68 ; | XX X   | $9E65
    .byte $41 ; | X     X| $9E66
    .byte $42 ; | X    X | $9E67
    .byte $49 ; | X  X  X| $9E68
    .byte $03 ; |      XX| $9E69
    .byte $51 ; | X X   X| $9E6A
    .byte $32 ; |  XX  X | $9E6B
    .byte $61 ; | XX    X| $9E6C
    .byte $03 ; |      XX| $9E6D
    .byte $71 ; | XXX   X| $9E6E
    .byte $22 ; |  X   X | $9E6F
    .byte $81 ; |X      X| $9E70
    .byte $03 ; |      XX| $9E71
    .byte $89 ; |X   X  X| $9E72
    .byte $12 ; |   X  X | $9E73
    .byte $99 ; |X  XX  X| $9E74
    .byte $0B ; |    X XX| $9E75
    .byte $89 ; |X   X  X| $9E76
    .byte $03 ; |      XX| $9E77
    .byte $81 ; |X      X| $9E78
    .byte $22 ; |  X   X | $9E79
    .byte $71 ; | XXX   X| $9E7A
    .byte $32 ; |  XX  X | $9E7B
    .byte $61 ; | XX    X| $9E7C
    .byte $03 ; |      XX| $9E7D
    .byte $51 ; | X X   X| $9E7E
    .byte $03 ; |      XX| $9E7F
    .byte $49 ; | X  X  X| $9E80
    .byte $42 ; | X    X | $9E81
    .byte $41 ; | X     X| $9E82
    .byte $03 ; |      XX| $9E83
    .byte $02 ; |      X | $9E84
    .byte $1B ; |   XX XX| $9E85
    .byte $04 ; |     X  | $9E86
    .byte $66 ; | XX  XX | $9E87
    .byte $20 ; |  X     | $9E88
    .byte $21 ; |  X    X| $9E89
    .byte $0A ; |    X X | $9E8A
    .byte $03 ; |      XX| $9E8B
    .byte $68 ; | XX X   | $9E8C
    .byte $02 ; |      X | $9E8D
    .byte $03 ; |      XX| $9E8E
    .byte $41 ; | X     X| $9E8F
    .byte $22 ; |  X   X | $9E90
    .byte $03 ; |      XX| $9E91
    .byte $02 ; |      X | $9E92
    .byte $03 ; |      XX| $9E93
    .byte $61 ; | XX    X| $9E94
    .byte $2A ; |  X X X | $9E95
    .byte $03 ; |      XX| $9E96
    .byte $02 ; |      X | $9E97
    .byte $03 ; |      XX| $9E98
    .byte $69 ; | XX X  X| $9E99
    .byte $32 ; |  XX  X | $9E9A
    .byte $03 ; |      XX| $9E9B
    .byte $02 ; |      X | $9E9C
    .byte $03 ; |      XX| $9E9D
    .byte $61 ; | XX    X| $9E9E
    .byte $2A ; |  X X X | $9E9F
    .byte $03 ; |      XX| $9EA0
    .byte $02 ; |      X | $9EA1
    .byte $03 ; |      XX| $9EA2
    .byte $41 ; | X     X| $9EA3
    .byte $22 ; |  X   X | $9EA4
    .byte $03 ; |      XX| $9EA5
    .byte $02 ; |      X | $9EA6
    .byte $03 ; |      XX| $9EA7
    .byte $20 ; |  X     | $9EA8
    .byte $21 ; |  X    X| $9EA9
    .byte $0A ; |    X X | $9EAA
    .byte $03 ; |      XX| $9EAB
    .byte $68 ; | XX X   | $9EAC
    .byte $02 ; |      X | $9EAD
    .byte $03 ; |      XX| $9EAE
    .byte $41 ; | X     X| $9EAF
    .byte $22 ; |  X   X | $9EB0
    .byte $03 ; |      XX| $9EB1
    .byte $02 ; |      X | $9EB2
    .byte $03 ; |      XX| $9EB3
    .byte $61 ; | XX    X| $9EB4
    .byte $2A ; |  X X X | $9EB5
    .byte $03 ; |      XX| $9EB6
    .byte $02 ; |      X | $9EB7
    .byte $03 ; |      XX| $9EB8
    .byte $69 ; | XX X  X| $9EB9
    .byte $22 ; |  X   X | $9EBA
    .byte $03 ; |      XX| $9EBB
    .byte $02 ; |      X | $9EBC
    .byte $03 ; |      XX| $9EBD
    .byte $04 ; |     X  | $9EBE
    .byte $89 ; |X   X  X| $9EBF
    .byte $68 ; | XX X   | $9EC0
    .byte $F9 ; |XXXXX  X| $9EC1
    .byte $2A ; |  X X X | $9EC2
    .byte $1A ; |   XX X | $9EC3
    .byte $F1 ; |XXXX   X| $9EC4
    .byte $2A ; |  X X X | $9EC5
    .byte $E1 ; |XXX    X| $9EC6
    .byte $3A ; |  XXX X | $9EC7
    .byte $C1 ; |XX     X| $9EC8
    .byte $03 ; |      XX| $9EC9
    .byte $99 ; |X  XX  X| $9ECA
    .byte $2A ; |  X X X | $9ECB
    .byte $61 ; | XX    X| $9ECC
    .byte $1A ; |   XX X | $9ECD
    .byte $78 ; | XXXX   | $9ECE
    .byte $49 ; | X  X  X| $9ECF
    .byte $2A ; |  X X X | $9ED0
    .byte $02 ; |      X | $9ED1
    .byte $04 ; |     X  | $9ED2
    .byte $D0 ; |XX X    | $9ED3
    .byte $68 ; | XX X   | $9ED4
    .byte $71 ; | XXX   X| $9ED5
    .byte $2A ; |  X X X | $9ED6
    .byte $13 ; |   X  XX| $9ED7
    .byte $79 ; | XXXX  X| $9ED8
    .byte $13 ; |   X  XX| $9ED9
    .byte $81 ; |X      X| $9EDA
    .byte $13 ; |   X  XX| $9EDB
    .byte $89 ; |X   X  X| $9EDC
    .byte $13 ; |   X  XX| $9EDD
    .byte $91 ; |X  X   X| $9EDE
    .byte $13 ; |   X  XX| $9EDF
    .byte $99 ; |X  XX  X| $9EE0
    .byte $13 ; |   X  XX| $9EE1
    .byte $A1 ; |X X    X| $9EE2
    .byte $13 ; |   X  XX| $9EE3
    .byte $A9 ; |X X X  X| $9EE4
    .byte $13 ; |   X  XX| $9EE5
    .byte $B1 ; |X XX   X| $9EE6
    .byte $13 ; |   X  XX| $9EE7
    .byte $B9 ; |X XXX  X| $9EE8
    .byte $13 ; |   X  XX| $9EE9
    .byte $C1 ; |XX     X| $9EEA
    .byte $13 ; |   X  XX| $9EEB
    .byte $C9 ; |XX  X  X| $9EEC
    .byte $13 ; |   X  XX| $9EED
    .byte $D1 ; |XX X   X| $9EEE
    .byte $13 ; |   X  XX| $9EEF
    .byte $D9 ; |XX XX  X| $9EF0
    .byte $13 ; |   X  XX| $9EF1
    .byte $E1 ; |XXX    X| $9EF2
    .byte $13 ; |   X  XX| $9EF3
    .byte $E9 ; |XXX X  X| $9EF4
    .byte $13 ; |   X  XX| $9EF5
    .byte $F1 ; |XXXX   X| $9EF6
    .byte $13 ; |   X  XX| $9EF7
    .byte $F9 ; |XXXXX  X| $9EF8
    .byte $13 ; |   X  XX| $9EF9
    .byte $00 ; |        | $9EFA
    .byte $00 ; |        | $9EFB
    .byte $00 ; |        | $9EFC
    .byte $00 ; |        | $9EFD
    .byte $00 ; |        | $9EFE
    .byte $00 ; |        | $9EFF
L9F00:
    .byte $00 ; |        | $9F00
L9F01:
    .byte $01 ; |       X| $9F01    sta B9 or BF 
    .byte $18 ; |   XX   | $9F02
    .byte $2A ; |  X X X | $9F03
    .byte $18 ; |   XX   | $9F04
    .byte $03 ; |      XX| $9F05
    .byte $04 ; |     X  | $9F06
    .byte $02 ; |      X | $9F07
    .byte $59 ; | X XX  X| $9F08
    .byte $20 ; |  X     | $9F09
    .byte $62 ; | XX   X | $9F0A
    .byte $0B ; |    X XX| $9F0B
    .byte $69 ; | XX X  X| $9F0C
    .byte $0B ; |    X XX| $9F0D
    .byte $79 ; | XXXX  X| $9F0E
    .byte $13 ; |   X  XX| $9F0F
    .byte $89 ; |X   X  X| $9F10
    .byte $13 ; |   X  XX| $9F11
    .byte $99 ; |X  XX  X| $9F12
    .byte $13 ; |   X  XX| $9F13
    .byte $22 ; |  X   X | $9F14
    .byte $A9 ; |X X X  X| $9F15
    .byte $1B ; |   XX XX| $9F16
    .byte $B9 ; |X XXX  X| $9F17
    .byte $1B ; |   XX XX| $9F18
    .byte $C9 ; |XX  X  X| $9F19
    .byte $1B ; |   XX XX| $9F1A
    .byte $12 ; |   X  X | $9F1B
    .byte $D9 ; |XX XX  X| $9F1C
    .byte $1B ; |   XX XX| $9F1D
    .byte $E9 ; |XXX X  X| $9F1E
    .byte $1B ; |   XX XX| $9F1F
    .byte $F9 ; |XXXXX  X| $9F20
    .byte $13 ; |   X  XX| $9F21
    .byte $01 ; |       X| $9F22
    .byte $02 ; |      X | $9F23
    .byte $04 ; |     X  | $9F24
    .byte $22 ; |  X   X | $9F25
    .byte $40 ; | X      | $9F26
    .byte $81 ; |X      X| $9F27
    .byte $4A ; | X  X X | $9F28
    .byte $03 ; |      XX| $9F29
    .byte $91 ; |X  X   X| $9F2A
    .byte $1B ; |   XX XX| $9F2B
    .byte $B1 ; |X XX   X| $9F2C
    .byte $3A ; |  XXX X | $9F2D
    .byte $03 ; |      XX| $9F2E
    .byte $E1 ; |XXX    X| $9F2F
    .byte $2A ; |  X X X | $9F30
    .byte $03 ; |      XX| $9F31
    .byte $F9 ; |XXXXX  X| $9F32
    .byte $1B ; |   XX XX| $9F33
    .byte $99 ; |X  XX  X| $9F34
    .byte $3A ; |  XXX X | $9F35
    .byte $03 ; |      XX| $9F36
    .byte $91 ; |X  X   X| $9F37
    .byte $2A ; |  X X X | $9F38
    .byte $89 ; |X   X  X| $9F39
    .byte $0B ; |    X XX| $9F3A
    .byte $79 ; | XXXX  X| $9F3B
    .byte $0B ; |    X XX| $9F3C
    .byte $61 ; | XX    X| $9F3D
    .byte $0B ; |    X XX| $9F3E
    .byte $41 ; | X     X| $9F3F
    .byte $0B ; |    X XX| $9F40
    .byte $21 ; |  X    X| $9F41
    .byte $03 ; |      XX| $9F42
    .byte $00 ; |        | $9F43
    .byte $40 ; | X      | $9F44
    .byte $91 ; |X  X   X| $9F45
    .byte $42 ; | X    X | $9F46
    .byte $32 ; |  XX  X | $9F47
    .byte $22 ; |  X   X | $9F48
    .byte $12 ; |   X  X | $9F49
    .byte $00 ; |        | $9F4A
    .byte $40 ; | X      | $9F4B
    .byte $19 ; |   XX  X| $9F4C
    .byte $22 ; |  X   X | $9F4D
    .byte $21 ; |  X    X| $9F4E
    .byte $22 ; |  X   X | $9F4F
    .byte $29 ; |  X X  X| $9F50
    .byte $22 ; |  X   X | $9F51
    .byte $31 ; |  XX   X| $9F52
    .byte $22 ; |  X   X | $9F53
    .byte $39 ; |  XXX  X| $9F54
    .byte $22 ; |  X   X | $9F55
    .byte $41 ; | X     X| $9F56
    .byte $22 ; |  X   X | $9F57
    .byte $49 ; | X  X  X| $9F58
    .byte $22 ; |  X   X | $9F59
    .byte $51 ; | X X   X| $9F5A
    .byte $22 ; |  X   X | $9F5B
    .byte $59 ; | X XX  X| $9F5C
    .byte $22 ; |  X   X | $9F5D
    .byte $61 ; | XX    X| $9F5E
    .byte $22 ; |  X   X | $9F5F
    .byte $69 ; | XX X  X| $9F60
    .byte $22 ; |  X   X | $9F61
    .byte $71 ; | XXX   X| $9F62
    .byte $22 ; |  X   X | $9F63
    .byte $79 ; | XXXX  X| $9F64
    .byte $22 ; |  X   X | $9F65
    .byte $81 ; |X      X| $9F66
    .byte $22 ; |  X   X | $9F67
    .byte $89 ; |X   X  X| $9F68
    .byte $22 ; |  X   X | $9F69
    .byte $91 ; |X  X   X| $9F6A
    .byte $22 ; |  X   X | $9F6B
    .byte $99 ; |X  XX  X| $9F6C
    .byte $22 ; |  X   X | $9F6D
    .byte $A1 ; |X X    X| $9F6E
    .byte $22 ; |  X   X | $9F6F
    .byte $A9 ; |X X X  X| $9F70
    .byte $22 ; |  X   X | $9F71
    .byte $00 ; |        | $9F72
    .byte $28 ; |  X X   | $9F73
    .byte $91 ; |X  X   X| $9F74
    .byte $2A ; |  X X X | $9F75
    .byte $13 ; |   X  XX| $9F76
    .byte $00 ; |        | $9F77
    .byte $68 ; | XX X   | $9F78
    .byte $79 ; | XXXX  X| $9F79
    .byte $2A ; |  X X X | $9F7A
    .byte $23 ; |  X   XX| $9F7B
    .byte $02 ; |      X | $9F7C
    .byte $03 ; |      XX| $9F7D
    .byte $81 ; |X      X| $9F7E
    .byte $2A ; |  X X X | $9F7F
    .byte $23 ; |  X   XX| $9F80
    .byte $02 ; |      X | $9F81
    .byte $03 ; |      XX| $9F82
    .byte $91 ; |X  X   X| $9F83
    .byte $2A ; |  X X X | $9F84
    .byte $23 ; |  X   XX| $9F85
    .byte $02 ; |      X | $9F86
    .byte $03 ; |      XX| $9F87
    .byte $A1 ; |X X    X| $9F88
    .byte $3A ; |  XXX X | $9F89
    .byte $23 ; |  X   XX| $9F8A
    .byte $02 ; |      X | $9F8B
    .byte $5B ; | X XX XX| $9F8C
    .byte $91 ; |X  X   X| $9F8D
    .byte $2A ; |  X X X | $9F8E
    .byte $23 ; |  X   XX| $9F8F
    .byte $02 ; |      X | $9F90
    .byte $03 ; |      XX| $9F91
    .byte $C1 ; |XX     X| $9F92
    .byte $3A ; |  XXX X | $9F93
    .byte $23 ; |  X   XX| $9F94
    .byte $02 ; |      X | $9F95
    .byte $1B ; |   XX XX| $9F96
    .byte $A1 ; |X X    X| $9F97
    .byte $2A ; |  X X X | $9F98
    .byte $03 ; |      XX| $9F99
    .byte $02 ; |      X | $9F9A
    .byte $91 ; |X  X   X| $9F9B
    .byte $2A ; |  X X X | $9F9C
    .byte $03 ; |      XX| $9F9D
    .byte $02 ; |      X | $9F9E
    .byte $81 ; |X      X| $9F9F
    .byte $2A ; |  X X X | $9FA0
    .byte $02 ; |      X | $9FA1
    .byte $79 ; | XXXX  X| $9FA2
    .byte $32 ; |  XX  X | $9FA3
    .byte $FB ; |XXXXX XX| $9FA4
    .byte $02 ; |      X | $9FA5
    .byte $13 ; |   X  XX| $9FA6
    .byte $40 ; | X      | $9FA7
    .byte $41 ; | X     X| $9FA8
    .byte $3A ; |  XXX X | $9FA9
    .byte $23 ; |  X   XX| $9FAA
    .byte $00 ; |        | $9FAB
    .byte $20 ; |  X     | $9FAC
    .byte $44 ; | X   X  | $9FAD
    .byte $41 ; | X     X| $9FAE
    .byte $56 ; | X X XX | $9FAF
    .byte $45 ; | X   X X| $9FB0
    .byte $20 ; |  X     | $9FB1
    .byte $53 ; | X X  XX| $9FB2
    .byte $54 ; | X X X  | $9FB3
    .byte $41 ; | X     X| $9FB4
    .byte $55 ; | X X X X| $9FB5
    .byte $47 ; | X   XXX| $9FB6
    .byte $41 ; | X     X| $9FB7
    .byte $53 ; | X X  XX| $9FB8
    .byte $20 ; |  X     | $9FB9
    .byte $4C ; | X  XX  | $9FBA
    .byte $4F ; | X  XXXX| $9FBB
    .byte $56 ; | X X XX | $9FBC
    .byte $45 ; | X   X X| $9FBD
    .byte $53 ; | X X  XX| $9FBE
    .byte $20 ; |  X     | $9FBF
    .byte $42 ; | X    X | $9FC0
    .byte $45 ; | X   X X| $9FC1
    .byte $41 ; | X     X| $9FC2
    .byte $54 ; | X X X  | $9FC3
    .byte $52 ; | X X  X | $9FC4
    .byte $49 ; | X  X  X| $9FC5
    .byte $43 ; | X    XX| $9FC6
    .byte $45 ; | X   X X| $9FC7
    .byte $20 ; |  X     | $9FC8
    .byte $48 ; | X  X   | $9FC9
    .byte $41 ; | X     X| $9FCA
    .byte $42 ; | X    X | $9FCB
    .byte $4C ; | X  XX  | $9FCC
    .byte $49 ; | X  X  X| $9FCD
    .byte $47 ; | X   XXX| $9FCE
    .byte $20 ; |  X     | $9FCF
    .byte $00 ; |        | $9FD0
    .byte $00 ; |        | $9FD1
    .byte $00 ; |        | $9FD2
    .byte $00 ; |        | $9FD3
    .byte $00 ; |        | $9FD4
    .byte $00 ; |        | $9FD5
    .byte $00 ; |        | $9FD6
    .byte $00 ; |        | $9FD7
    .byte $00 ; |        | $9FD8
    .byte $00 ; |        | $9FD9
    .byte $00 ; |        | $9FDA
    .byte $00 ; |        | $9FDB
    .byte $00 ; |        | $9FDC
    .byte $00 ; |        | $9FDD

L9FDE:
    lda    BANK_2                ; 4   bankswitch, goto LD3E3

;coming from bank 2
    jmp    L991C                 ; 3
    lda    BANK_0                ; 4   space filler... already in bank 0

;coming from bank 3
    jmp    L9100                 ; 3

L9FEA:
    lda    BANK_2                ; 4   bankswitch, goto LD100
    jmp.w  $0000                 ; 3   space filler...

START_BANK_0:
    lda    BANK_3                ; 4   bankswitch, goto START
    jmp    START                 ; 3   space filler..

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

    SC_RAM_SPACE 256                ; $B000 - $B0FF super chip ram

LB100:
    lda    #0                    ; 2
    sta    $EB                   ; 3
    sta    $EC                   ; 3
    sta    $ED                   ; 3
    lda    $B3                   ; 3
    bpl    LB121                 ; 2³
    and    #$40                  ; 2
    bne    LB169                 ; 2³
    lda    $B3                   ; 3
    cmp    #$82                  ; 2
    bne    LB11E                 ; 2³
    lda    $D5                   ; 3
    sta    $ED                   ; 3
    lda    #0                    ; 2
    sta    $D5                   ; 3
LB11E:
    jmp    LB826                 ; 3

LB121:
    lda    $82                   ; 3
    and    #$20                  ; 2
    beq    LB169                 ; 2³
    ldx    $C5                   ; 3
    bmi    LB169                 ; 2³
    cpx    #6                    ; 2
    bcs    LB169                 ; 2³
    lda    $81                   ; 3
    lsr                          ; 2
    lda    $80                   ; 3
    ror                          ; 2
    bcs    LB169                 ; 2³
    ldy    $E0                   ; 3
    cpy    #$10                  ; 2
    bmi    LB141                 ; 2³
    and    #$3F                  ; 2
    bpl    LB147                 ; 3   always branch

LB141:
    cpy    #4                    ; 2
    bmi    LB147                 ; 2³
    and    #$7F                  ; 2
LB147:
    cmp    #$0D                  ; 2
    bne    LB169                 ; 2³
    inx                          ; 2
    stx    $C5                   ; 3
    lda    $84                   ; 3
    and    #$04                  ; 2
    bne    LB15C                 ; 2³
    sta    $CF,X                 ; 4
    lda    #$27                  ; 2
    sta    $C6,X                 ; 4
    bne    LB164                 ; 3   always branch

LB15C:
    lda    #$7C                  ; 2
    sta    $CF,X                 ; 4
    lda    #7                    ; 2
    sta    $C6,X                 ; 4
LB164:
    lda    #$40                  ; 2
    sta    SC_44,X               ; 5
LB169:
    clc                          ; 2
    lda    $C3                   ; 3
    bne    LB16F                 ; 2³
    sec                          ; 2
LB16F:
    lda    #$16                  ; 2
    sbc    $C3                   ; 3
    sta    $F7                   ; 3
    sta    $FD                   ; 3
    dec    $FD                   ; 5
    lda    #$3D                  ; 2
    sbc    $C0                   ; 3
    tay                          ; 2
    lda    LBA82,Y               ; 4
    sta    $F8                   ; 3
    cmp    $F7                   ; 3
    bcc    LB189                 ; 2³
    inc    $FD                   ; 5
LB189:
    ldy    #3                    ; 2
    lda    $80                   ; 3
    and    #$03                  ; 2
    tax                          ; 2
LB190:
    lda    SC_27|READ,X          ; 4
    cmp    #$30                  ; 2
    bcs    LB1A7                 ; 2³
    dex                          ; 2
    bpl    LB19C                 ; 2³
    ldx    #3                    ; 2
LB19C:
    dey                          ; 2
    bpl    LB190                 ; 2³
    lda    #0                    ; 2
    sta    $FA                   ; 3
    sta    $FB                   ; 3
    beq    LB1B8                 ; 3   always branch

LB1A7:
    lda    SC_01|READ,X          ; 4
    sta    $FC                   ; 3
    lda    SC_14|READ,X          ; 4
    and    #$1F                  ; 2
    sta    $FA                   ; 3
    sec                          ; 2
    sbc    #1                    ; 2
    sta    $FB                   ; 3
LB1B8:
    ldx    #1                    ; 2
LB1BA:
    lda    SC_13|READ,X          ; 4
    beq    LB1C5                 ; 2³
    and    #$1F                  ; 2
    cmp    $F7                   ; 3
    beq    LB20E                 ; 2³+1
LB1C5:
    inx                          ; 2
    cpx    #5                    ; 2
    bcc    LB1BA                 ; 2³
LB1CA:
    lda    SC_13|READ,X          ; 4
    beq    LB1E5                 ; 2³
    and    #$1F                  ; 2
    cmp    $FD                   ; 3
    beq    LB1ED                 ; 2³
LB1D5:
    cmp    $F7                   ; 3
    beq    LB1ED                 ; 2³
LB1D9:
    cmp    $F8                   ; 3
    beq    LB22D                 ; 2³+1
LB1DD:
    cmp    $FA                   ; 3
    beq    LB256                 ; 2³+1
    cmp    $FB                   ; 3
    beq    LB256                 ; 2³+1
LB1E5:
    cpx    $DD                   ; 3
    inx                          ; 2
    bcc    LB1CA                 ; 2³
    jmp    LB79E                 ; 3

LB1ED:
    sta    $BF                   ; 3
    lda    SC_26|READ,X          ; 4
    bpl    LB1F7                 ; 2³
    clc                          ; 2
    adc    #$80                  ; 2
LB1F7:
    tay                          ; 2
    lda    $C4                   ; 3
    sec                          ; 2
    sbc    SC_00|READ,X          ; 4
    sta    $F9                   ; 3
    cmp    LB758,Y               ; 4
    lda    $BF                   ; 3
    bcs    LB1D9                 ; 2³+1
    cmp    $F8                   ; 3
    beq    LB22D                 ; 2³
    jmp    LB21C                 ; 3

LB20E:
    ldy    SC_26|READ,X          ; 4
    lda    $C4                   ; 3
    sec                          ; 2
    sbc    SC_00|READ,X          ; 4
    cmp    LB758,Y               ; 4
    bcs    LB228                 ; 2³
LB21C:
    lda    #$B4                  ; 2   high nibble
    sta    $F0                   ; 3
    lda    LB712,Y               ; 4
    sta    $EF                   ; 3
    jmp.ind ($00EF)              ; 5   $B4xx   done

LB228:
    ldx    #5                    ; 2
    jmp    LB1CA                 ; 3

LB22D:
    lda    SC_26|READ,X          ; 4
    bpl    LB235                 ; 2³
    clc                          ; 2
    adc    #$80                  ; 2
LB235:
    tay                          ; 2
    lda    $C1                   ; 3
    sec                          ; 2
    sbc    SC_00|READ,X          ; 4
    bcc    LB247                 ; 2³
    cmp    LB758,Y               ; 4
    lda    $F8                   ; 3
    bcs    LB1DD                 ; 2³+1
    bcc    LB276                 ; 3   always branch

LB247:
    cmp    #$FD                  ; 2
    lda    $F8                   ; 3
    bcc    LB1DD                 ; 2³+1
    lda    LB758,Y               ; 4
    bne    LB276                 ; 2³
    lda    $F8                   ; 3
    bcs    LB1DD                 ; 3+1   always branch

LB256:
    lda    SC_26|READ,X          ; 4
    bpl    LB25E                 ; 2³
    clc                          ; 2
    adc    #$80                  ; 2
LB25E:
    tay                          ; 2
    lda    $FC                   ; 3
    sec                          ; 2
    sbc    SC_00|READ,X          ; 4
    bcc    LB26F                 ; 2³
    cmp    LB758,Y               ; 4
    bcc    LB2AF                 ; 2³
    jmp    LB1E5                 ; 3

LB26F:
    cmp    #$F1                  ; 2
    bcs    LB2AF                 ; 2³
    jmp    LB1E5                 ; 3

LB276:
    lda    $B8                   ; 3
    and    $82                   ; 3
    bmi    LB2AA                 ; 2³
    lda    #$BF                  ; 2
    sta    $B3                   ; 3
    lda    #1                    ; 2
    sta    $B9                   ; 3
    lda    #$1B                  ; 2
    cmp    $BA                   ; 3
    bcs    LB28E                 ; 2³
    lda    #0                    ; 2
    sta    $BA                   ; 3
LB28E:
    lda    $B8                   ; 3
    bpl    LB2A1                 ; 2³
    clc                          ; 2
    adc    #4                    ; 2
    and    #$0C                  ; 2
    sta    $F7                   ; 3
    lda    $B8                   ; 3
    and    #$F3                  ; 2
    ora    $F7                   ; 3
    sta    $B8                   ; 3
LB2A1:
    stx    $DF                   ; 3
    lda    #0                    ; 2
    sta    $DB                   ; 3
    jmp    LB826                 ; 3

LB2AA:
    lda    $F8                   ; 3
    jmp    LB1DD                 ; 3

LB2AF:
    cpy    #$40                  ; 2
    bcs    LB2FD                 ; 2³
    cpy    #$22                  ; 2
    beq    LB2FD                 ; 2³
    cpy    #$23                  ; 2
    beq    LB2FD                 ; 2³
    cpy    #$1C                  ; 2
    bcs    LB2DA                 ; 2³
    lda    #$B4                  ; 2   high nibble
    sta    $F0                   ; 3
    bit    $B8                   ; 3
    bpl    LB2CF                 ; 2³
    lda    LB712,Y               ; 4
    sta    $EF                   ; 3
    jmp.ind ($00EF)              ; 5   $B4xx   done

LB2CF:
    lda    LB374,Y               ; 4
    sta    $EF                   ; 3
    lda    LBEA4,Y               ; 4
    jmp.ind ($00EF)              ; 5   $B4xx   done

LB2DA:
    jmp    LB1E5                 ; 3

LB2DD:
    .byte $01 ; |       X| $B2DD
    .byte $01 ; |       X| $B2DE
    .byte $01 ; |       X| $B2DF
    .byte $01 ; |       X| $B2E0
    .byte $0E ; |    XXX | $B2E1
    .byte $0E ; |    XXX | $B2E2
    .byte $0E ; |    XXX | $B2E3
    .byte $0E ; |    XXX | $B2E4
    .byte $0B ; |    X XX| $B2E5
    .byte $0A ; |    X X | $B2E6
    .byte $0B ; |    X XX| $B2E7
    .byte $0A ; |    X X | $B2E8
    .byte $01 ; |       X| $B2E9
    .byte $0E ; |    XXX | $B2EA
    .byte $0B ; |    X XX| $B2EB
    .byte $0A ; |    X X | $B2EC
LB2ED:
    .byte $D4 ; |XX X X  | $B2ED
    .byte $D4 ; |XX X X  | $B2EE
    .byte $D4 ; |XX X X  | $B2EF
    .byte $D4 ; |XX X X  | $B2F0
    .byte $3E ; |  XXXXX | $B2F1
    .byte $3E ; |  XXXXX | $B2F2
    .byte $3E ; |  XXXXX | $B2F3
    .byte $3E ; |  XXXXX | $B2F4
    .byte $C0 ; |XX      | $B2F5
    .byte $C0 ; |XX      | $B2F6
    .byte $C0 ; |XX      | $B2F7
    .byte $C0 ; |XX      | $B2F8
    .byte $C0 ; |XX      | $B2F9
    .byte $3E ; |  XXXXX | $B2FA
    .byte $C0 ; |XX      | $B2FB
    .byte $D4 ; |XX X X  | $B2FC

LB2FD:
    ldx    #0                    ; 2
    ldy    #0                    ; 2
    lda    $C5                   ; 3
    sta    $FD                   ; 3
LB305:
    lda    $C6,X                 ; 4
    and    #$1F                  ; 2
    sec                          ; 2
    sbc    $FA                   ; 3
    cmp    #$FE                  ; 2
    bcc    LB347                 ; 2³
    lda    $FC                   ; 3
    sec                          ; 2
    sbc    $CF,X                 ; 4
    bcc    LB31D                 ; 2³
    cmp    #4                    ; 2
    bcs    LB347                 ; 2³
    bcc    LB321                 ; 3   always branch

LB31D:
    cmp    #$F1                  ; 2
    bcc    LB347                 ; 2³
LB321:
    sed                          ; 2
    clc                          ; 2
    lda    $C6,X                 ; 4
    bmi    LB331                 ; 2³
    lda    #$30                  ; 2
    adc    $ED                   ; 3
    sta    $ED                   ; 3
    lda    #0                    ; 2
    beq    LB333                 ; 3   always branch

LB331:
    lda    #3                    ; 2
LB333:
    adc    $EC                   ; 3
    sta    $EC                   ; 3
    lda    $EB                   ; 3
    adc    #0                    ; 2
    sta    $EB                   ; 3
    cld                          ; 2
    dec    $C5                   ; 5
    cpx    $FD                   ; 3
    inx                          ; 2
    bcc    LB305                 ; 2³
    bcs    LB371                 ; 3   always branch

LB347:
    sty    $F9                   ; 3
    cpx    $F9                   ; 3
    beq    LB36B                 ; 2³
    lda    $C6,X                 ; 4
    and    #$7F                  ; 2
    bpl    LB355                 ; 3   always branch

LB353:
    lda    $C6,X                 ; 4
LB355:
    sta.wy $C6,Y                 ; 5
    lda    $CF,X                 ; 4
    sta.wy $CF,Y                 ; 5
    lda    SC_44|READ,X          ; 4
    sta    SC_44,Y               ; 5
    iny                          ; 2
    cpx    $FD                   ; 3
    inx                          ; 2
    bcc    LB353                 ; 2³
    bcs    LB371                 ; 3   always branch

LB36B:
    iny                          ; 2
    cpx    $FD                   ; 3
    inx                          ; 2
    bcc    LB305                 ; 2³
LB371:
    jmp    LB625                 ; 3

LB374:  ; indirect jump table
    .byte <LB4A3         ; $B374
    .byte <LB428         ; $B375
    .byte <LB428         ; $B376
    .byte <LB434         ; $B377
    .byte <LB434         ; $B378
    .byte <LB434         ; $B379
    .byte <LB434         ; $B37A
    .byte <LB400         ; $B37B
    .byte <LB400         ; $B37C
    .byte <LB400         ; $B37D
    .byte <LB451         ; $B37E
    .byte <LB451         ; $B37F
    .byte <LB451         ; $B380
    .byte <LB451         ; $B381
    .byte <LB428         ; $B382
    .byte <LB428         ; $B383
    .byte <LB428         ; $B384
    .byte <LB45C         ; $B385
    .byte <LB45C         ; $B386
    .byte <LB45C         ; $B387
    .byte <LB446         ; $B388
    .byte <LB446         ; $B389
    .byte <LB446         ; $B38A
    .byte <LB446         ; $B38B
    .byte <LB446         ; $B38C
    .byte <LB446         ; $B38D
    .byte <LB446         ; $B38E
    .byte <LB446         ; $B38F
LB390:
    .byte $FF ; |XXXXXXXX| $B390
    .byte $D4 ; |XX X X  | $B391
    .byte $D4 ; |XX X X  | $B392
    .byte $25 ; |  X  X X| $B393
    .byte $25 ; |  X  X X| $B394
    .byte $25 ; |  X  X X| $B395
    .byte $25 ; |  X  X X| $B396
    .byte $88 ; |X   X   | $B397
    .byte $88 ; |X   X   | $B398
    .byte $88 ; |X   X   | $B399
    .byte $C0 ; |XX      | $B39A
    .byte $C0 ; |XX      | $B39B
    .byte $C0 ; |XX      | $B39C
    .byte $C0 ; |XX      | $B39D
    .byte $3E ; |  XXXXX | $B39E
    .byte $3E ; |  XXXXX | $B39F
    .byte $3E ; |  XXXXX | $B3A0
    .byte $65 ; | XX  X X| $B3A1
    .byte $65 ; | XX  X X| $B3A2
    .byte $65 ; | XX  X X| $B3A3
    .byte $5D ; | X XXX X| $B3A4
    .byte $5D ; | X XXX X| $B3A5
    .byte $5D ; | X XXX X| $B3A6
    .byte $5D ; | X XXX X| $B3A7
    .byte $5D ; | X XXX X| $B3A8
    .byte $5D ; | X XXX X| $B3A9
    .byte $5D ; | X XXX X| $B3AA
    .byte $5D ; | X XXX X| $B3AB
LB3AC:
    .byte $00 ; |        | $B3AC
    .byte $FB ; |XXXXX XX| $B3AD
    .byte $FB ; |XXXXX XX| $B3AE
    .byte $3E ; |  XXXXX | $B3AF
    .byte $3E ; |  XXXXX | $B3B0
    .byte $3E ; |  XXXXX | $B3B1
    .byte $3E ; |  XXXXX | $B3B2
    .byte $C0 ; |XX      | $B3B3
    .byte $C0 ; |XX      | $B3B4
    .byte $C0 ; |XX      | $B3B5
    .byte $D4 ; |XX X X  | $B3B6
    .byte $D4 ; |XX X X  | $B3B7
    .byte $D4 ; |XX X X  | $B3B8
    .byte $D4 ; |XX X X  | $B3B9
    .byte $5D ; | X XXX X| $B3BA
    .byte $5D ; | X XXX X| $B3BB
    .byte $5D ; | X XXX X| $B3BC
    .byte $88 ; |X   X   | $B3BD
    .byte $88 ; |X   X   | $B3BE
    .byte $88 ; |X   X   | $B3BF
    .byte $65 ; | XX  X X| $B3C0
    .byte $65 ; | XX  X X| $B3C1
    .byte $65 ; | XX  X X| $B3C2
    .byte $65 ; | XX  X X| $B3C3
    .byte $65 ; | XX  X X| $B3C4
    .byte $65 ; | XX  X X| $B3C5
    .byte $65 ; | XX  X X| $B3C6
    .byte $65 ; | XX  X X| $B3C7
    .byte $00 ; |        | $B3C8
    .byte $00 ; |        | $B3C9
    .byte $00 ; |        | $B3CA
    .byte $00 ; |        | $B3CB
    .byte $00 ; |        | $B3CC
    .byte $00 ; |        | $B3CD
    .byte $00 ; |        | $B3CE
    .byte $00 ; |        | $B3CF
    .byte $00 ; |        | $B3D0
    .byte $00 ; |        | $B3D1
    .byte $00 ; |        | $B3D2
    .byte $00 ; |        | $B3D3
    .byte $00 ; |        | $B3D4
    .byte $00 ; |        | $B3D5
    .byte $00 ; |        | $B3D6
    .byte $00 ; |        | $B3D7
    .byte $00 ; |        | $B3D8
    .byte $00 ; |        | $B3D9
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
    .byte $00 ; |        | $B3E7
    .byte $00 ; |        | $B3E8
    .byte $00 ; |        | $B3E9
    .byte $00 ; |        | $B3EA
    .byte $00 ; |        | $B3EB
    .byte $00 ; |        | $B3EC
    .byte $00 ; |        | $B3ED
    .byte $00 ; |        | $B3EE
    .byte $00 ; |        | $B3EF
    .byte $00 ; |        | $B3F0
    .byte $00 ; |        | $B3F1
    .byte $00 ; |        | $B3F2
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

LB400:  ; indirect jump
    lda    #$2E                  ; 2
    sta    SC_26,X               ; 5
    lda    SC_13|READ,X          ; 4
    and    #$1F                  ; 2
    sta    SC_13,X               ; 5
    lda    LBEA4,Y               ; 4
    sta    $EC                   ; 3
    jmp    LB6A4                 ; 3

LB415:  ; indirect jump
    lda    #0                    ; 2
    sta    $C3                   ; 3
    lda    SC_13|READ,X          ; 4
    bmi    LB426                 ; 2³
    ora    #$80                  ; 2
    sta    SC_13,X               ; 5
    jmp    LB6C5                 ; 3

LB426:
    lda    #2                    ; 2
LB428:  ; indirect jump
    jmp    LB66E                 ; 3

LB42B:  ; indirect jump
    jmp    LB551                 ; 3

LB42E:  ; indirect jump
    lda    #0                    ; 2
    sta    $C3                   ; 3
    lda    #$10                  ; 2
LB434:  ; indirect jump
    jmp    LB668                 ; 3

LB437:  ; indirect jump
    lda    #0                    ; 2
    sta    $C3                   ; 3
    lda    #5                    ; 2
    jmp    LB66E                 ; 3

LB440:  ; indirect jump
    lda    #0                    ; 2
    sta    $C3                   ; 3
    lda    #3                    ; 2
LB446:  ; indirect jump
    dec    $B5                   ; 5
    jmp    LB668                 ; 3

LB44B:  ; indirect jump
    lda    #0                    ; 2
    sta    $C3                   ; 3
    lda    #4                    ; 2
LB451:  ; indirect jump
    inc    $B5                   ; 5
    jmp    LB66E                 ; 3

LB456:  ; indirect jump
    lda    #0                    ; 2
    sta    $C3                   ; 3
    lda    #1                    ; 2
LB45C:  ; indirect jump
    sta    $F7                   ; 3
    lda    $83                   ; 3
    ora    #$0F                  ; 2
    sta    $83                   ; 3
    lda    $F7                   ; 3
    ldy    #$40                  ; 2
    sty    $B3                   ; 3
    ldy    $BA                   ; 3
    beq    LB472                 ; 2³
    cpy    #$1C                  ; 2
    bcc    LB476                 ; 2³
LB472:
    ldy    #$1C                  ; 2
    sty    $BA                   ; 3
LB476:
    jmp    LB668                 ; 3

LB479:  ; indirect jump
    lda    #0                    ; 2
    sta    $C3                   ; 3
    lda    SC_13|READ,X          ; 4
    and    #$1F                  ; 2
    sta    SC_13,X               ; 5
    sec                          ; 2
    sbc    $F8                   ; 3
    beq    LB49B                 ; 2³
    bcc    LB49E                 ; 2³
    tay                          ; 2
    lda    LB6DD,Y               ; 4
    sta    $EC                   ; 3
    lda    LB6E7,Y               ; 4
    sta    SC_26,X               ; 5
    jmp    LB6A4                 ; 3

LB49B:
    jmp    LB22D                 ; 3

LB49E:  ; indirect jump (also)
    lda    $F7                   ; 3
    jmp    LB1C5                 ; 3

LB4A3:  ; indirect jump
    jmp    LB1E5                 ; 3

LB4A6:  ; indirect jump
    lda    #$26                  ; 2
    sta    $B9                   ; 3
    lda    SC_00|READ,X          ; 4
    sec                          ; 2
    sbc    #4                    ; 2
    sta    SC_00,X               ; 5
    lsr                          ; 2
    bcc    LB4BA                 ; 2³
    lsr                          ; 2
    sec                          ; 2
    bcs    LB4BB                 ; 3   always branch

LB4BA:
    lsr                          ; 2
LB4BB:
    tay                          ; 2
    adc    #4                    ; 2
    sta    $FC                   ; 3
    lda    #$30                  ; 2
    sta    SC_26,X               ; 5
    lda    #0                    ; 2
    sta    $C3                   ; 3
    lda    #8                    ; 2
    sta    $EC                   ; 3
    lda    $F7                   ; 3
    clc                          ; 2
    adc    $9C                   ; 3
    sta    $F7                   ; 3
LB4D4:
    lda    $F7                   ; 3
    cpy    #$10                  ; 2
    bcc    LB4DC                 ; 2³
    adc    #$13                  ; 2
LB4DC:
    tax                          ; 2
    lsr                          ; 2
    tya                          ; 2
    bcs    LB50F                 ; 2³+1
    lsr                          ; 2
    lda    #$FF                  ; 2
    bcs    LB4FA                 ; 2³
    eor    LBA62,Y               ; 4
    and    SC_56|READ,X          ; 4
    sta    SC_56,X               ; 5
    lda    #$FF                  ; 2
    eor    LBA62,Y               ; 4
    and    SC_37|READ,X          ; 4
    jmp    LB53A                 ; 3

LB4FA:
    eor    LBA42,Y               ; 4
    dex                          ; 2
    and    SC_56|READ,X          ; 4
    sta    SC_56,X               ; 5
    lda    #$FF                  ; 2
    eor    LBA42,Y               ; 4
    and    SC_37|READ,X          ; 4
    jmp    LB53A                 ; 3

LB50F:
    lsr                          ; 2
    lda    #$FF                  ; 2
    bcs    LB529                 ; 2³
    eor    LBA62,Y               ; 4
    dex                          ; 2
    and    SC_56|READ,X          ; 4
    sta    SC_56,X               ; 5
    lda    #$FF                  ; 2
    eor    LBA62,Y               ; 4
    and    SC_37|READ,X          ; 4
    jmp    LB53A                 ; 3

LB529:
    eor    LBA42,Y               ; 4
    and    SC_56|READ,X          ; 4
    sta    SC_56,X               ; 5
    lda    #$FF                  ; 2
    eor    LBA42,Y               ; 4
    and    SC_37|READ,X          ; 4
LB53A:
    cpx    #$0D                  ; 2
    bcc    LB546                 ; 2³
    cpx    #$16                  ; 2
    bcc    LB549                 ; 2³
    cpx    #$21                  ; 2
    bcs    LB549                 ; 2³
LB546:
    sta    SC_37,X               ; 5
LB549:
    iny                          ; 2
    cpy    $FC                   ; 3
    bne    LB4D4                 ; 2³+1
    jmp    LB826                 ; 3

LB551:
    lda    $BF                   ; 3
    cmp    $FD                   ; 3
    bne    LB55A                 ; 2³
    jmp    LB1D5                 ; 3

LB55A:
    dec    $F7                   ; 5
    lda    $F9                   ; 3
    and    #$FC                  ; 2
    clc                          ; 2
    adc    SC_00|READ,X          ; 4
    tay                          ; 2
    iny                          ; 2
    stx    $F9                   ; 3
    ldx    $C5                   ; 3
LB56A:
    lda    $C6,X                 ; 4
    and    #$1F                  ; 2
    cmp    $F7                   ; 3
    beq    LB577                 ; 2³
    dex                          ; 2
    bpl    LB56A                 ; 2³
    bmi    LB582                 ; 3   always branch

LB577:
    tya                          ; 2
    sec                          ; 2
    sbc    $CF,X                 ; 4
    cmp    #3                    ; 2
    bcc    LB589                 ; 2³
    dex                          ; 2
    bpl    LB56A                 ; 2³
LB582:
    inc    $F7                   ; 5
    ldx    $F9                   ; 3
    jmp    LB1C5                 ; 3

LB589:
    dey                          ; 2
    lda    $C6,X                 ; 4
    sta    $FA                   ; 3
    bpl    LB596                 ; 2³
    lda    #$10                  ; 2
    sta    $ED                   ; 3
    bne    LB59A                 ; 3   always branch

LB596:
    lda    #1                    ; 2
    sta    $EC                   ; 3
LB59A:
    lda    $CF,X                 ; 4
    sta    $FC                   ; 3
    stx    $FD                   ; 3
    cpx    $C5                   ; 3
    beq    LB5BD                 ; 2³
    lda    $C7,X                 ; 4
    and    #$7F                  ; 2
    bpl    LB5AC                 ; 3   always branch

LB5AA:
    lda    $C7,X                 ; 4
LB5AC:
    sta    $C6,X                 ; 4
    lda    $D0,X                 ; 4
    sta    $CF,X                 ; 4
    lda    SC_45|READ,X          ; 4
    sta    SC_44,X               ; 5
    inx                          ; 2
    cpx    $C5                   ; 3
    bne    LB5AA                 ; 2³
LB5BD:
    dec    $C5                   ; 5
    bmi    LB5D9                 ; 2³
    ldx    $FD                   ; 3
    dex                          ; 2
    bmi    LB5D9                 ; 2³
    lda    $FC                   ; 3
LB5C8:
    cmp    $CF,X                 ; 4
    beq    LB5D1                 ; 2³
    dex                          ; 2
    bpl    LB5C8                 ; 2³
    bmi    LB5D9                 ; 3   always branch

LB5D1:
    lda    $C6,X                 ; 4
    and    #$1F                  ; 2
    cmp    $F7                   ; 3
    beq    LB59A                 ; 2³
LB5D9:
    lda    $C3                   ; 3
    eor    $9C                   ; 3
    eor    #$01                  ; 2
    sta    $FB                   ; 3
    lsr                          ; 2
    tya                          ; 2
    bcc    LB5E7                 ; 2³
    sbc    #4                    ; 2
LB5E7:
    tay                          ; 2
    lda    $FA                   ; 3
    and    #$20                  ; 2
    bne    LB5F3                 ; 2³
    tya                          ; 2
    clc                          ; 2
    adc    #7                    ; 2
    tay                          ; 2
LB5F3:
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$FE                  ; 2
    tay                          ; 2
    lda    $FB                   ; 3
    lsr                          ; 2
    tya                          ; 2
    bcs    LB601                 ; 2³+1
    adc    #$1F                  ; 2
LB601:
    tax                          ; 2
    inx                          ; 2
    cmp    #$3F                  ; 2
    bmi    LB609                 ; 2³
    ldx    #$3F                  ; 2
LB609:
    txa                          ; 2
    and    #$10                  ; 2
    beq    LB610                 ; 2³
    lda    #$14                  ; 2
LB610:
    sec                          ; 2
    adc    $F7                   ; 3
    adc    $9C                   ; 3
    tay                          ; 2
    lda    SC_56|READ,Y          ; 4
    ora    LBA42,X               ; 4
    sta    SC_56,Y               ; 5
    lda    $B6                   ; 3
    ora    #$80                  ; 2
    sta    $B6                   ; 3
LB625:
    lda    $C5                   ; 3
    bne    LB634                 ; 2³
    lda    SC_44|READ            ; 4
    ora    #$40                  ; 2
    sta    SC_44                 ; 4
    jmp    LB6C5                 ; 3

LB634:
    bpl    LB651                 ; 2³
    lda    $B2                   ; 3
    cmp    #3                    ; 2
    bne    LB648                 ; 2³
    ldy    #$14                  ; 2
    sty    $DB                   ; 3
    ldy    #0                    ; 2
    sty    $DC                   ; 3
    lda    #$80                  ; 2
    bne    LB64F                 ; 3   always branch

LB648:
    lsr                          ; 2
    lda    #$80                  ; 2
    bcc    LB64F                 ; 2³
    lda    #$FF                  ; 2
LB64F:
    sta    $C5                   ; 3
LB651:
    lda    #0                    ; 2
    sta    $C3                   ; 3
    jmp    LB6C5                 ; 3

;never reached?
    lda    SC_13|READ,X          ; 4
    bmi    LB664                 ; 2³
    ora    #$80                  ; 2
    sta    SC_13,X               ; 5
    bmi    LB6C5                 ; 3   always branch

LB664:
    lda    #2                    ; 2
    bne    LB66E                 ; 3   always branch

LB668:
    bit    $B8                   ; 3
    bpl    LB69D                 ; 2³
    bmi    LB674                 ; 3   always branch

LB66E:
    bit    $B8                   ; 3
    bpl    LB69D                 ; 2³
    dec    $D3                   ; 5
LB674:
    ldy    $D5                   ; 3
    bpl    LB683                 ; 2³
    tay                          ; 2
    cpy    #$10                  ; 2
    bcc    LB67F                 ; 2³
    ldy    #2                    ; 2
LB67F:
    lda    LB6F1,Y               ; 4
    tay                          ; 2
LB683:
    lda    SC_13|READ,X          ; 4
    and    #$1F                  ; 2
    sta    SC_13,X               ; 5
    lda    LB709,Y               ; 4
    sta    SC_26,X               ; 5
    lda    LB700,Y               ; 4
    sta    $EC                   ; 3
    dey                          ; 2
    bmi    LB6C5                 ; 2³
    sty    $D5                   ; 3
    bpl    LB6C5                 ; 3   always branch

LB69D:
    sta    $EC                   ; 3
    lda    #0                    ; 2
    sta    SC_13,X               ; 5
LB6A4:
    ldy    SC_26|READ,X          ; 4
    cpy    #$1C                  ; 2
    bcc    LB6B5                 ; 2³
    cpy    #$25                  ; 2
    bcc    LB6C5                 ; 2³
    cpy    #$2F                  ; 2
    bcs    LB6C5                 ; 2³
    ldy    #7                    ; 2
LB6B5:
    lda    $BA                   ; 3
    cmp    LB390,Y               ; 4
    bcc    LB6C5                 ; 2³
    cmp    LB3AC,Y               ; 4
    bcs    LB6C5                 ; 2³
    lda    #0                    ; 2
    sta    $BA                   ; 3
LB6C5:
    lda    #$44                  ; 2
    ldx    $B9                   ; 3
    beq    LB6CF                 ; 2³
    cmp    $B9                   ; 3
    bcs    LB6D1                 ; 2³
LB6CF:
    sta    $B9                   ; 3
LB6D1:
    jmp    LB826                 ; 3

LB6D4:
    .byte $85 ; |X    X X| $B6D4
    .byte $86 ; |X    XX | $B6D5
    .byte $87 ; |X    XXX| $B6D6
    .byte $88 ; |X   X   | $B6D7
    .byte $89 ; |X   X  X| $B6D8
    .byte $8A ; |X   X X | $B6D9
    .byte $8B ; |X   X XX| $B6DA
    .byte $8C ; |X   XX  | $B6DB
    .byte $8D ; |X   XX X| $B6DC
LB6DD:
    .byte $12 ; |   X  X | $B6DD
    .byte $12 ; |   X  X | $B6DE
    .byte $09 ; |    X  X| $B6DF
    .byte $09 ; |    X  X| $B6E0
    .byte $06 ; |     XX | $B6E1
    .byte $06 ; |     XX | $B6E2
    .byte $03 ; |      XX| $B6E3
    .byte $03 ; |      XX| $B6E4
    .byte $03 ; |      XX| $B6E5
    .byte $03 ; |      XX| $B6E6
LB6E7:
    .byte $2D ; |  X XX X| $B6E7
    .byte $2D ; |  X XX X| $B6E8
    .byte $2B ; |  X X XX| $B6E9
    .byte $2B ; |  X X XX| $B6EA
    .byte $28 ; |  X X   | $B6EB
    .byte $28 ; |  X X   | $B6EC
    .byte $25 ; |  X  X X| $B6ED
    .byte $25 ; |  X  X X| $B6EE
    .byte $25 ; |  X  X X| $B6EF
    .byte $25 ; |  X  X X| $B6F0
LB6F1:
    .byte $08 ; |    X   | $B6F1
    .byte $08 ; |    X   | $B6F2
    .byte $08 ; |    X   | $B6F3
    .byte $07 ; |     XXX| $B6F4
    .byte $06 ; |     XX | $B6F5
    .byte $05 ; |     X X| $B6F6
    .byte $04 ; |     X  | $B6F7
    .byte $03 ; |      XX| $B6F8
    .byte $02 ; |      X | $B6F9
    .byte $01 ; |       X| $B6FA
    .byte $00 ; |        | $B6FB
    .byte $00 ; |        | $B6FC
    .byte $00 ; |        | $B6FD
    .byte $00 ; |        | $B6FE
    .byte $00 ; |        | $B6FF
LB700:
    .byte $10 ; |   X    | $B700
    .byte $09 ; |    X  X| $B701
    .byte $08 ; |    X   | $B702
    .byte $07 ; |     XXX| $B703
    .byte $06 ; |     XX | $B704
    .byte $05 ; |     X X| $B705
    .byte $04 ; |     X  | $B706
    .byte $03 ; |      XX| $B707
    .byte $02 ; |      X | $B708
LB709:
    .byte $2C ; |  X XX  | $B709
    .byte $2B ; |  X X XX| $B70A
    .byte $2A ; |  X X X | $B70B
    .byte $29 ; |  X X  X| $B70C
    .byte $28 ; |  X X   | $B70D
    .byte $27 ; |  X  XXX| $B70E
    .byte $26 ; |  X  XX | $B70F
    .byte $25 ; |  X  X X| $B710
    .byte $24 ; |  X  X  | $B711
LB712:  ; indirect jump table
    .byte <LB49E         ; $B712
    .byte <LB415         ; $B713
    .byte <LB415         ; $B714
    .byte <LB42E         ; $B715
    .byte <LB42E         ; $B716
    .byte <LB42E         ; $B717
    .byte <LB42E         ; $B718
    .byte <LB479         ; $B719
    .byte <LB479         ; $B71A
    .byte <LB479         ; $B71B
    .byte <LB44B         ; $B71C
    .byte <LB44B         ; $B71D
    .byte <LB44B         ; $B71E
    .byte <LB44B         ; $B71F
    .byte <LB437         ; $B720
    .byte <LB437         ; $B721
    .byte <LB437         ; $B722
    .byte <LB456         ; $B723
    .byte <LB456         ; $B724
    .byte <LB456         ; $B725
    .byte <LB440         ; $B726
    .byte <LB440         ; $B727
    .byte <LB440         ; $B728
    .byte <LB440         ; $B729
    .byte <LB440         ; $B72A
    .byte <LB440         ; $B72B
    .byte <LB440         ; $B72C
    .byte <LB440         ; $B72D
    .byte <LB49E         ; $B72E
    .byte <LB49E         ; $B72F
    .byte <LB49E         ; $B730
    .byte <LB49E         ; $B731
    .byte <LB49E         ; $B732
    .byte <LB49E         ; $B733
    .byte <LB42B         ; $B734
    .byte <LB42B         ; $B735
    .byte <LB49E         ; $B736
    .byte <LB49E         ; $B737
    .byte <LB49E         ; $B738
    .byte <LB49E         ; $B739
    .byte <LB49E         ; $B73A
    .byte <LB49E         ; $B73B
    .byte <LB49E         ; $B73C
    .byte <LB49E         ; $B73D
    .byte <LB49E         ; $B73E
    .byte <LB49E         ; $B73F
    .byte <LB49E         ; $B740
    .byte <LB4A6         ; $B741
    .byte <LB49E         ; $B742
    .byte <LB49E         ; $B743
    .byte <LB49E         ; $B744
    .byte <LB49E         ; $B745
    .byte <LB49E         ; $B746
    .byte <LB49E         ; $B747
    .byte <LB49E         ; $B748
    .byte <LB49E         ; $B749
    .byte <LB49E         ; $B74A
    .byte <LB49E         ; $B74B
    .byte <LB49E         ; $B74C
    .byte <LB49E         ; $B74D
    .byte <LB49E         ; $B74E
    .byte <LB49E         ; $B74F
    .byte <LB49E         ; $B750
    .byte <LB49E         ; $B751
    .byte <LB42B         ; $B752
    .byte <LB42B         ; $B753
    .byte <LB42B         ; $B754
    .byte <LB42B         ; $B755
    .byte <LB42B         ; $B756
    .byte <LB42B         ; $B757
LB758:
    .byte $00 ; |        | $B758
    .byte $08 ; |    X   | $B759
    .byte $08 ; |    X   | $B75A
    .byte $08 ; |    X   | $B75B
    .byte $08 ; |    X   | $B75C
    .byte $08 ; |    X   | $B75D
    .byte $08 ; |    X   | $B75E
    .byte $08 ; |    X   | $B75F
    .byte $08 ; |    X   | $B760
    .byte $08 ; |    X   | $B761
    .byte $08 ; |    X   | $B762
    .byte $08 ; |    X   | $B763
    .byte $08 ; |    X   | $B764
    .byte $08 ; |    X   | $B765
    .byte $08 ; |    X   | $B766
    .byte $08 ; |    X   | $B767
    .byte $08 ; |    X   | $B768
    .byte $08 ; |    X   | $B769
    .byte $08 ; |    X   | $B76A
    .byte $08 ; |    X   | $B76B
    .byte $08 ; |    X   | $B76C
    .byte $08 ; |    X   | $B76D
    .byte $08 ; |    X   | $B76E
    .byte $08 ; |    X   | $B76F
    .byte $08 ; |    X   | $B770
    .byte $08 ; |    X   | $B771
    .byte $08 ; |    X   | $B772
    .byte $08 ; |    X   | $B773
    .byte $00 ; |        | $B774
    .byte $00 ; |        | $B775
    .byte $00 ; |        | $B776
    .byte $00 ; |        | $B777
    .byte $00 ; |        | $B778
    .byte $00 ; |        | $B779
    .byte $04 ; |     X  | $B77A
    .byte $08 ; |    X   | $B77B
    .byte $00 ; |        | $B77C
    .byte $00 ; |        | $B77D
    .byte $00 ; |        | $B77E
    .byte $00 ; |        | $B77F
    .byte $00 ; |        | $B780
    .byte $00 ; |        | $B781
    .byte $00 ; |        | $B782
    .byte $00 ; |        | $B783
    .byte $00 ; |        | $B784
    .byte $00 ; |        | $B785
    .byte $00 ; |        | $B786
    .byte $08 ; |    X   | $B787
    .byte $00 ; |        | $B788
    .byte $00 ; |        | $B789
    .byte $00 ; |        | $B78A
    .byte $00 ; |        | $B78B
    .byte $00 ; |        | $B78C
    .byte $00 ; |        | $B78D
    .byte $00 ; |        | $B78E
    .byte $00 ; |        | $B78F
    .byte $00 ; |        | $B790
    .byte $00 ; |        | $B791
    .byte $00 ; |        | $B792
    .byte $00 ; |        | $B793
    .byte $00 ; |        | $B794
    .byte $00 ; |        | $B795
    .byte $00 ; |        | $B796
    .byte $00 ; |        | $B797
    .byte $10 ; |   X    | $B798
    .byte $14 ; |   X X  | $B799
    .byte $18 ; |   XX   | $B79A
    .byte $1C ; |   XXX  | $B79B
    .byte $20 ; |  X     | $B79C
    .byte $24 ; |  X  X  | $B79D

LB79E:
    lda    $C3                   ; 3
    beq    LB7C3                 ; 2³
    lda    $C4                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    #$15                  ; 2
    cpy    #$10                  ; 2
    bcc    LB7AF                 ; 2³
    lda    #$29                  ; 2
LB7AF:
    sec                          ; 2
    sbc    $C3                   ; 3
    clc                          ; 2
    adc    $9C                   ; 3
    tax                          ; 2
    lsr                          ; 2
    tya                          ; 2
    bcs    LB7BC                 ; 2³
    adc    #$20                  ; 2
LB7BC:
    tay                          ; 2
    lda    SC_56|READ,X          ; 4
    and    LBA42,Y               ; 4
LB7C3:
    beq    LB826                 ; 2³+1
    stx    $F7                   ; 3
    cpx    #$0D                  ; 2
    bcc    LB7D3                 ; 2³
    cpx    #$16                  ; 2
    bcc    LB7E7                 ; 2³
    cpx    #$21                  ; 2
    bcs    LB7E7                 ; 2³
LB7D3:
    lda    SC_37|READ,X          ; 4
    and    LBA42,Y               ; 4
    beq    LB7E7                 ; 2³
    ldx    $C0                   ; 3
    ldy    LBA82,X               ; 4
    iny                          ; 2
    cpy    $C3                   ; 3
    beq    LB826                 ; 2³+1
    bne    LB822                 ; 3+1   always branch

LB7E7:
    lda    $DF                   ; 3
    and    #$3F                  ; 2
    cmp    $F7                   ; 3
    beq    LB7F7                 ; 2³
    lda    $F7                   ; 3
    ora    #$40                  ; 2
    sta    $DF                   ; 3
    bne    LB822                 ; 3+1   always branch

LB7F7:
    lda    $DF                   ; 3
    clc                          ; 2
    adc    #$40                  ; 2
    sta    $DF                   ; 3
    bcc    LB822                 ; 2³
    lda    #0                    ; 2
    sta    $DF                   ; 3
    sed                          ; 2
    lda    $ED                   ; 3
    clc                          ; 2
    adc    #1                    ; 2
    sta    $ED                   ; 3
    lda    $EC                   ; 3
    adc    #0                    ; 2
    sta    $EC                   ; 3
    lda    $EB                   ; 3
    adc    #0                    ; 2
    sta    $EB                   ; 3
    cld                          ; 2
    lda    SC_56|READ,X          ; 4
    eor    LBA42,Y               ; 4
    sta    SC_56,X               ; 5
LB822:
    lda    #0                    ; 2
    sta    $C3                   ; 3
LB826:
    ldy    #9                    ; 2
    sty    $FA                   ; 3
    ldy    #0                    ; 2
    ldx    $C5                   ; 3
    bmi    LB83C                 ; 2³
    lda    INTIM                 ; 4
    cmp    LB6D4,X               ; 4
    txa                          ; 2
    bcs    LB846                 ; 2³
    jmp    LB8DE                 ; 3

LB83C:
    bit    $B8                   ; 3
    bpl    LB843                 ; 2³
    jmp    LB8DE                 ; 3

LB843:
    jmp    LB8DA                 ; 3

LB846:
    beq    LB856                 ; 2³
LB848:
    lda    $C6,X                 ; 4
    bpl    LB856                 ; 2³
    eor    $C5,X                 ; 4
    and    #$1F                  ; 2
    bne    LB856                 ; 2³
    iny                          ; 2
    dex                          ; 2
    bne    LB848                 ; 2³
LB856:
    lda    LBAD6,Y               ; 4
    sta    $F8                   ; 3
    lda    LBACD,Y               ; 4
    bne    LB8A2                 ; 2³
    ldy    $FA                   ; 3
    lda    #$23                  ; 2
    sta    SC_27,Y               ; 5
    lda    #$22                  ; 2
    sta    SC_28,Y               ; 5
    lda    $C6,X                 ; 4
    clc                          ; 2
    adc    #1                    ; 2
    bit    LBADF                 ; 4
    beq    LB883                 ; 2³
    and    #$1F                  ; 2
    sta    SC_14,Y               ; 5
    sta    SC_15,Y               ; 5
    lda    $CF,X                 ; 4
    sec                          ; 2
    bcs    LB88F                 ; 3   always branch

LB883:
    and    #$1F                  ; 2
    sta    SC_14,Y               ; 5
    sta    SC_15,Y               ; 5
    lda    $CF,X                 ; 4
    adc    $F8                   ; 3
LB88F:
    sta    SC_01,Y               ; 5
    adc    #7                    ; 2
    sta    SC_02,Y               ; 5
    iny                          ; 2
    iny                          ; 2
    sty    $FA                   ; 3
    ldy    #0                    ; 2
    dex                          ; 2
    bpl    LB846                 ; 2³
    bmi    LB8DA                 ; 3   always branch

LB8A2:
    ldy    $FA                   ; 3
    sta    SC_27,Y               ; 5
    lda    $C6,X                 ; 4
    clc                          ; 2
    adc    #1                    ; 2
    bit    LBADF                 ; 4
    bne    LB8C6                 ; 2³
    and    #$1F                  ; 2
    sta    SC_14,Y               ; 5
    lda    $CF,X                 ; 4
    adc    $F8                   ; 3
    sta    SC_01,Y               ; 5
    inc    $FA                   ; 5
    ldy    #0                    ; 2
    dex                          ; 2
    bpl    LB846                 ; 2³
    bmi    LB8DA                 ; 3   always branch

LB8C6:
    and    #$1F                  ; 2
    sta    SC_14,Y               ; 5
    lda    $CF,X                 ; 4
    sta    SC_01,Y               ; 5
    inc    $FA                   ; 5
    ldy    #0                    ; 2
    dex                          ; 2
    bmi    LB8DA                 ; 2³
    jmp    LB846                 ; 3

LB8DA:
    ldy    $FA                   ; 3
    sty    $DD                   ; 3
LB8DE:
    lda    INTIM                 ; 4
    cmp    #$84                  ; 2
    bpl    LB8E8                 ; 2³
    jmp    LBFE4                 ; 3   bankswitch, goto LD800

LB8E8:
    lda    $82                   ; 3
    ora    #$10                  ; 2
    cmp    $82                   ; 3
    sta    $82                   ; 3
    beq    LB968                 ; 2³+1
    bit    $82                   ; 3
    bvc    LB906                 ; 2³+1
    ldx    #$40                  ; 2
    stx    $C0                   ; 3
    ldx    #4                    ; 2
    lda    #0                    ; 2
LB8FE:
    sta    SC_2B,X               ; 5
    dex                          ; 2
    bpl    LB8FE                 ; 2³+1
    bmi    LB965                 ; 3   always branch

LB906:
    lda    $80                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    $B2                   ; 3
    bne    LB93B                 ; 2³
    ldx    #4                    ; 2
LB911:
    lda    SC_18|READ,X          ; 4
    bne    LB921                 ; 2³
    lda    LBAE0,Y               ; 4
    sta    SC_05,X               ; 5
    lda    #7                    ; 2
    sta    SC_2B,X               ; 5
LB921:
    iny                          ; 2
    dex                          ; 2
    bmi    LB965                 ; 2³
    lda    $E0                   ; 3
    cmp    LBAC9,X               ; 4
    bcs    LB911                 ; 2³
LB92C:
    lda    SC_18|READ,X          ; 4
    bne    LB936                 ; 2³
    lda    #0                    ; 2
    sta    SC_2B,X               ; 5
LB936:
    dex                          ; 2
    bpl    LB92C                 ; 2³
    bmi    LB965                 ; 3   always branch

LB93B:
    ldx    #2                    ; 2
LB93D:
    lda    SC_18|READ,X          ; 4
    bne    LB945                 ; 2³
    sta    SC_2B,X               ; 5
LB945:
    dex                          ; 2
    bpl    LB93D                 ; 2³
    ldx    #1                    ; 2
LB94A:
    lda    SC_1B|READ,X          ; 4
    bne    LB95A                 ; 2³
    lda    LBAE0,Y               ; 4
    sta    SC_08,X               ; 5
    lda    #7                    ; 2
    sta    SC_2E,X               ; 5
LB95A:
    iny                          ; 2
    dex                          ; 2
    bmi    LB965                 ; 2³
    lda    $E0                   ; 3
    cmp    LBACC,X               ; 4
    bcs    LB94A                 ; 2³
LB965:
    jmp    LBCEA                 ; 3

LB968:
    bit    $B3                   ; 3
    bmi    LB965                 ; 2³
    lda    $80                   ; 3
    clc                          ; 2
    adc    #1                    ; 2
    and    #$0F                  ; 2
    tax                          ; 2
    bit    $B8                   ; 3
    bmi    LB97B                 ; 2³
    jmp    LB9FE                 ; 3

LB97B:
    and    #$03                  ; 2
    sta    $F8                   ; 3
    cpx    #$0E                  ; 2
    bcs    LB9D4                 ; 2³
    lda    SC_18|READ,X          ; 4
    bne    LB9C8                 ; 2³
    dec    $D4                   ; 5
    bpl    LB9D1                 ; 2³
    lda    $85                   ; 3
    and    #$07                  ; 2
    ora    #$01                  ; 2
    dec    $D2                   ; 5
    bpl    LB99B                 ; 2³
    inc    $D2                   ; 5
    jmp    LB9D1                 ; 3

LB99B:
    sta    $D4                   ; 3
    inc    $D3                   ; 5
    lda    $B8                   ; 3
    and    #$0C                  ; 2
    ora    $F8                   ; 3
    tay                          ; 2
    lda    LB2DD,Y               ; 4
    sta    SC_2B,X               ; 5
    cmp    #$0E                  ; 2
    lda    $84                   ; 3
    and    #$7C                  ; 2
    sta    SC_05,X               ; 5
    bcs    LB9BE                 ; 2³
    lda    #$14                  ; 2
    sta    SC_18,X               ; 5
    bne    LB9D1                 ; 3   always branch

LB9BE:
    cmp    #$67                  ; 2
    lda    #$28                  ; 2
    ror                          ; 2
    sta    SC_18,X               ; 5
    bne    LB9D1                 ; 3   always branch

LB9C8:
    ldy    SC_2B|READ,X          ; 4
    lda    LBE75,Y               ; 4
    sta    SC_2B,X               ; 5
LB9D1:
    jmp    LBCEA                 ; 3

LB9D4:
    bne    LB9D1                 ; 2³
    lda    $D2                   ; 3
    beq    LB9D1                 ; 2³
    lda    $80                   ; 3
    clc                          ; 2
    adc    #1                    ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$03                  ; 2
    sta    $F8                   ; 3
    lda    $B8                   ; 3
    and    #$0C                  ; 2
    ora    $F8                   ; 3
    tay                          ; 2
    lda    $BA                   ; 3
    beq    LB9F6                 ; 2³
    cmp    #$25                  ; 2
    bcc    LB9FB                 ; 2³
LB9F6:
    lda    LB2ED,Y               ; 4
    sta    $BA                   ; 3
LB9FB:
    jmp    LBCEA                 ; 3

LB9FE:
    lda    #$BB                  ; 2   high nibble
    sta    $F0                   ; 3
    lda    LBA0A,X               ; 4
    sta    $EF                   ; 3
    jmp.ind ($00EF)              ; 5   $BBxx

LBA0A:  ; indirect jump table
    .byte <LBB00         ; $BA0A
    .byte <LBB00         ; $BA0B
    .byte <LBB00         ; $BA0C
    .byte <LBB00         ; $BA0D
    .byte <LBB00         ; $BA0E
    .byte <LBB5B         ; $BA0F
    .byte <LBBDE         ; $BA10
    .byte <LBB03         ; $BA11
    .byte <LBB2C         ; $BA12
    .byte <LBBDB         ; $BA13
    .byte <LBB84         ; $BA14
    .byte <LBB2C         ; $BA15
    .byte <LBB5B         ; $BA16
    .byte <LBB03         ; $BA17
    .byte <LBBDB         ; $BA18
    .byte <LBBDE         ; $BA19
LBA1A:
    .byte $20 ; |  X     | $BA1A
    .byte $28 ; |  X X   | $BA1B
    .byte $30 ; |  XX    | $BA1C
    .byte $38 ; |  XXX   | $BA1D
    .byte $40 ; | X      | $BA1E
    .byte $48 ; | X  X   | $BA1F
    .byte $50 ; | X X    | $BA20
    .byte $58 ; | X XX   | $BA21
LBA22:
    .byte $18 ; |   XX   | $BA22
    .byte $24 ; |  X  X  | $BA23
    .byte $82 ; |X     X | $BA24
    .byte $41 ; | X     X| $BA25
    .byte $04 ; |     X  | $BA26
    .byte $08 ; |    X   | $BA27
    .byte $24 ; |  X  X  | $BA28
    .byte $18 ; |   XX   | $BA29
    .byte $92 ; |X  X  X | $BA2A
    .byte $61 ; | XX    X| $BA2B
    .byte $48 ; | X  X   | $BA2C
    .byte $84 ; |X    X  | $BA2D
    .byte $11 ; |   X   X| $BA2E
    .byte $22 ; |  X   X | $BA2F
    .byte $43 ; | X    XX| $BA30
    .byte $83 ; |X     XX| $BA31
LBA32:
    .byte $90 ; |X  X    | $BA32
    .byte $60 ; | XX     | $BA33
    .byte $41 ; | X     X| $BA34
    .byte $82 ; |X     X | $BA35
    .byte $A2 ; |X X   X | $BA36
    .byte $51 ; | X X   X| $BA37
    .byte $0A ; |    X X | $BA38
    .byte $05 ; |     X X| $BA39
    .byte $04 ; |     X  | $BA3A
    .byte $08 ; |    X   | $BA3B
    .byte $82 ; |X     X | $BA3C
    .byte $41 ; | X     X| $BA3D
    .byte $41 ; | X     X| $BA3E
    .byte $A0 ; |X X     | $BA3F
    .byte $20 ; |  X     | $BA40
    .byte $10 ; |   X    | $BA41
LBA42:
    .byte $00 ; |        | $BA42
    .byte $40 ; | X      | $BA43
    .byte $00 ; |        | $BA44
    .byte $10 ; |   X    | $BA45
    .byte $00 ; |        | $BA46
    .byte $04 ; |     X  | $BA47
    .byte $00 ; |        | $BA48
    .byte $01 ; |       X| $BA49
    .byte $00 ; |        | $BA4A
    .byte $02 ; |      X | $BA4B
    .byte $00 ; |        | $BA4C
    .byte $08 ; |    X   | $BA4D
    .byte $00 ; |        | $BA4E
    .byte $20 ; |  X     | $BA4F
    .byte $00 ; |        | $BA50
    .byte $80 ; |X       | $BA51
    .byte $00 ; |        | $BA52
    .byte $40 ; | X      | $BA53
    .byte $00 ; |        | $BA54
    .byte $10 ; |   X    | $BA55
    .byte $00 ; |        | $BA56
    .byte $04 ; |     X  | $BA57
    .byte $00 ; |        | $BA58
    .byte $01 ; |       X| $BA59
    .byte $00 ; |        | $BA5A
    .byte $02 ; |      X | $BA5B
    .byte $00 ; |        | $BA5C
    .byte $08 ; |    X   | $BA5D
    .byte $00 ; |        | $BA5E
    .byte $20 ; |  X     | $BA5F
    .byte $00 ; |        | $BA60
    .byte $80 ; |X       | $BA61
LBA62:
    .byte $80 ; |X       | $BA62
    .byte $00 ; |        | $BA63
    .byte $20 ; |  X     | $BA64
    .byte $00 ; |        | $BA65
    .byte $08 ; |    X   | $BA66
    .byte $00 ; |        | $BA67
    .byte $02 ; |      X | $BA68
    .byte $00 ; |        | $BA69
    .byte $01 ; |       X| $BA6A
    .byte $00 ; |        | $BA6B
    .byte $04 ; |     X  | $BA6C
    .byte $00 ; |        | $BA6D
    .byte $10 ; |   X    | $BA6E
    .byte $00 ; |        | $BA6F
    .byte $40 ; | X      | $BA70
    .byte $00 ; |        | $BA71
    .byte $80 ; |X       | $BA72
    .byte $00 ; |        | $BA73
    .byte $20 ; |  X     | $BA74
    .byte $00 ; |        | $BA75
    .byte $08 ; |    X   | $BA76
    .byte $00 ; |        | $BA77
    .byte $02 ; |      X | $BA78
    .byte $00 ; |        | $BA79
    .byte $01 ; |       X| $BA7A
    .byte $00 ; |        | $BA7B
    .byte $04 ; |     X  | $BA7C
    .byte $00 ; |        | $BA7D
    .byte $10 ; |   X    | $BA7E
    .byte $00 ; |        | $BA7F
    .byte $40 ; | X      | $BA80
    .byte $00 ; |        | $BA81
LBA82:
    .byte $00 ; |        | $BA82
    .byte $00 ; |        | $BA83
    .byte $00 ; |        | $BA84
    .byte $01 ; |       X| $BA85
    .byte $01 ; |       X| $BA86
    .byte $01 ; |       X| $BA87
    .byte $02 ; |      X | $BA88
    .byte $02 ; |      X | $BA89
    .byte $02 ; |      X | $BA8A
    .byte $03 ; |      XX| $BA8B
    .byte $03 ; |      XX| $BA8C
    .byte $03 ; |      XX| $BA8D
    .byte $04 ; |     X  | $BA8E
    .byte $04 ; |     X  | $BA8F
    .byte $04 ; |     X  | $BA90
    .byte $05 ; |     X X| $BA91
    .byte $05 ; |     X X| $BA92
    .byte $05 ; |     X X| $BA93
    .byte $06 ; |     XX | $BA94
    .byte $06 ; |     XX | $BA95
    .byte $06 ; |     XX | $BA96
    .byte $07 ; |     XXX| $BA97
    .byte $07 ; |     XXX| $BA98
    .byte $07 ; |     XXX| $BA99
    .byte $08 ; |    X   | $BA9A
    .byte $08 ; |    X   | $BA9B
    .byte $08 ; |    X   | $BA9C
    .byte $09 ; |    X  X| $BA9D
    .byte $09 ; |    X  X| $BA9E
    .byte $09 ; |    X  X| $BA9F
    .byte $0A ; |    X X | $BAA0
    .byte $0A ; |    X X | $BAA1
    .byte $0A ; |    X X | $BAA2
    .byte $0B ; |    X XX| $BAA3
    .byte $0B ; |    X XX| $BAA4
    .byte $0B ; |    X XX| $BAA5
    .byte $0C ; |    XX  | $BAA6
    .byte $0C ; |    XX  | $BAA7
    .byte $0C ; |    XX  | $BAA8
    .byte $0D ; |    XX X| $BAA9
    .byte $0D ; |    XX X| $BAAA
    .byte $0D ; |    XX X| $BAAB
    .byte $0E ; |    XXX | $BAAC
    .byte $0E ; |    XXX | $BAAD
    .byte $0E ; |    XXX | $BAAE
    .byte $0F ; |    XXXX| $BAAF
    .byte $0F ; |    XXXX| $BAB0
    .byte $0F ; |    XXXX| $BAB1
    .byte $10 ; |   X    | $BAB2
    .byte $10 ; |   X    | $BAB3
    .byte $10 ; |   X    | $BAB4
    .byte $11 ; |   X   X| $BAB5
    .byte $11 ; |   X   X| $BAB6
    .byte $11 ; |   X   X| $BAB7
    .byte $12 ; |   X  X | $BAB8
    .byte $12 ; |   X  X | $BAB9
    .byte $12 ; |   X  X | $BABA
    .byte $13 ; |   X  XX| $BABB
    .byte $13 ; |   X  XX| $BABC
    .byte $13 ; |   X  XX| $BABD
    .byte $14 ; |   X X  | $BABE
    .byte $14 ; |   X X  | $BABF
LBAC0:
    .byte $14 ; |   X X  | $BAC0
    .byte $00 ; |        | $BAC1
    .byte $07 ; |     XXX| $BAC2
    .byte $14 ; |   X X  | $BAC3
    .byte $21 ; |  X    X| $BAC4
    .byte $28 ; |  X X   | $BAC5
    .byte $35 ; |  XX X X| $BAC6
    .byte $42 ; | X    X | $BAC7
    .byte $FF ; |XXXXXXXX| $BAC8
LBAC9:
    .byte $16 ; |   X XX | $BAC9
    .byte $12 ; |   X  X | $BACA
    .byte $08 ; |    X   | $BACB
LBACC:
    .byte $03 ; |      XX| $BACC
LBACD:
    .byte $22 ; |  X   X | $BACD
    .byte $23 ; |  X   XX| $BACE
    .byte $00 ; |        | $BACF
    .byte $C0 ; |XX      | $BAD0
    .byte $C1 ; |XX     X| $BAD1
    .byte $C2 ; |XX    X | $BAD2
    .byte $C3 ; |XX    XX| $BAD3
    .byte $C4 ; |XX   X  | $BAD4
    .byte $C5 ; |XX   X X| $BAD5
LBAD6:
    .byte $00 ; |        | $BAD6
    .byte $FC ; |XXXXXX  | $BAD7
    .byte $F8 ; |XXXXX   | $BAD8
    .byte $F4 ; |XXXX X  | $BAD9
    .byte $F0 ; |XXXX    | $BADA
    .byte $EC ; |XXX XX  | $BADB
    .byte $E8 ; |XXX X   | $BADC
    .byte $E4 ; |XXX  X  | $BADD
    .byte $E0 ; |XXX     | $BADE
LBADF:
    .byte $20 ; |  X     | $BADF
LBAE0:
    .byte $02 ; |      X | $BAE0
    .byte $0C ; |    XX  | $BAE1
    .byte $05 ; |     X X| $BAE2
    .byte $09 ; |    X  X| $BAE3
    .byte $0E ; |    XXX | $BAE4
    .byte $08 ; |    X   | $BAE5
    .byte $0B ; |    X XX| $BAE6
    .byte $06 ; |     XX | $BAE7
    .byte $0F ; |    XXXX| $BAE8
    .byte $03 ; |      XX| $BAE9
    .byte $10 ; |   X    | $BAEA
    .byte $07 ; |     XXX| $BAEB
    .byte $0A ; |    X X | $BAEC
    .byte $11 ; |   X   X| $BAED
    .byte $04 ; |     X  | $BAEE
    .byte $0D ; |    XX X| $BAEF
    .byte $00 ; |        | $BAF0
    .byte $00 ; |        | $BAF1
    .byte $00 ; |        | $BAF2
    .byte $00 ; |        | $BAF3
    .byte $00 ; |        | $BAF4
    .byte $00 ; |        | $BAF5
    .byte $00 ; |        | $BAF6
    .byte $00 ; |        | $BAF7
    .byte $00 ; |        | $BAF8
    .byte $00 ; |        | $BAF9
    .byte $00 ; |        | $BAFA
    .byte $00 ; |        | $BAFB
    .byte $00 ; |        | $BAFC
    .byte $00 ; |        | $BAFD
    .byte $00 ; |        | $BAFE
    .byte $00 ; |        | $BAFF

LBB00:  ; indirect jump
    jmp    LBCA5                 ; 3

LBB03:  ; indirect jump
    lda    SC_1A|READ            ; 4
    bne    LBB81                 ; 2³
    lda    $B7                   ; 3
    and    #$18                  ; 2
    cmp    #$18                  ; 2
    bne    LBB81                 ; 2³
    lda    $B7                   ; 3
    and    #$F7                  ; 2
    sta    $B7                   ; 3
    lda    $BA                   ; 3
    beq    LBB1E                 ; 2³
    cmp    #$25                  ; 2
    bcc    LBB22                 ; 2³
LBB1E:
    lda    #$C0                  ; 2
    sta    $BA                   ; 3
LBB22:
    lda    #$0B                  ; 2
    bit    $84                   ; 3
    bpl    LBB72                 ; 2³
    lda    #$0A                  ; 2
    bne    LBB72                 ; 3   always branch

LBB2C:  ; indirect jump
    lda    SC_1A|READ            ; 4
    bne    LBB81                 ; 2³
    lda    $B7                   ; 3
    and    #$60                  ; 2
    cmp    #$60                  ; 2
    bne    LBB81                 ; 2³
    lda    $BA                   ; 3
    beq    LBB41                 ; 2³
    cmp    #$25                  ; 2
    bcc    LBB45                 ; 2³
LBB41:
    lda    #$3E                  ; 2
    sta    $BA                   ; 3
LBB45:
    lda    #$0E                  ; 2
    sta    SC_2D                 ; 4
    lda    $84                   ; 3
    and    #$7C                  ; 2
    sta    SC_07                 ; 4
    cmp    #$67                  ; 2
    lda    #$28                  ; 2
    ror                          ; 2
    sta    SC_1A                 ; 4
    bne    LBB81                 ; 3   always branch

LBB5B:  ; indirect jump
    lda    SC_1A|READ            ; 4
    bne    LBB81                 ; 2³
    lda    $B7                   ; 3
    bpl    LBB81                 ; 2³
    lda    $BA                   ; 3
    beq    LBB6C                 ; 2³
    cmp    #$25                  ; 2
    bcc    LBB70                 ; 2³
LBB6C:
    lda    #$D4                  ; 2
    sta    $BA                   ; 3
LBB70:
    lda    #1                    ; 2
LBB72:
    sta    SC_2D                 ; 4
    lda    #$14                  ; 2
    sta    SC_1A                 ; 4
    lda    $84                   ; 3
    and    #$7C                  ; 2
    sta    SC_07                 ; 4
LBB81:
    jmp    LBCEA                 ; 3

LBB84:  ; indirect jump
    lda    $B2                   ; 3
    cmp    #2                    ; 2
    bcc    LBB81                 ; 2³
    lda    $80                   ; 3
    and    #$30                  ; 2
    bne    LBB81                 ; 2³
    dec    $83                   ; 5
    lda    $83                   ; 3
    and    #$0F                  ; 2
    cmp    #$0F                  ; 2
    bne    LBB81                 ; 2³
    inc    $83                   ; 5
    lda    SC_19|READ            ; 4
    bne    LBB81                 ; 2³
    lda    $BA                   ; 3
    beq    LBBA9                 ; 2³
    cmp    #$25                  ; 2
    bcc    LBBAD                 ; 2³
LBBA9:
    lda    #$65                  ; 2
    sta    $BA                   ; 3
LBBAD:
    lda    $B7                   ; 3
    and    #$FD                  ; 2
    sta    $B7                   ; 3
    lda    $84                   ; 3
    and    #$07                  ; 2
    clc                          ; 2
    adc    #7                    ; 2
    ldy    #8                    ; 2
    cpy    $E0                   ; 3
    bcc    LBBC2                 ; 2³
    ora    #$80                  ; 2
LBBC2:
    ldy    #0                    ; 2
    bit    $85                   ; 3
    bmi    LBBCC                 ; 2³
    ora    #$40                  ; 2
    ldy    #$7C                  ; 2
LBBCC:
    sta    SC_19                 ; 4
    tya                          ; 2
    sta    SC_06                 ; 4
    lda    #$11                  ; 2
    sta    SC_2C                 ; 4
    jmp    LBCEA                 ; 3

LBBDB:  ; indirect jump
    jmp    LBC51                 ; 3

LBBDE:  ; indirect jump
    lda    $B2                   ; 3
    beq    LBC03                 ; 2³+1
    lda    $B6                   ; 3
    bpl    LBC03                 ; 2³+1
    clc                          ; 2
    adc    #1                    ; 2
    sta    $B6                   ; 3
    and    #$0F                  ; 2
    bne    LBC03                 ; 2³+1
    ldy    #0                    ; 2
    lda    SC_18|READ            ; 4
    beq    LBC06                 ; 2³+1
    iny                          ; 2
    lda    SC_19|READ            ; 4
    beq    LBC06                 ; 2³+1
LBBFC:
    lda    $B6                   ; 3
    sec                          ; 2
    sbc    #8                    ; 2
    sta    $B6                   ; 3
LBC03:
    jmp    LBCEA                 ; 3

LBC06:
    lda    $B6                   ; 3
    and    #$70                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    $E0                   ; 3
    cmp    LBAC0,X               ; 4
    bcc    LBBFC                 ; 2³+1
    lda    $84                   ; 3
    and    #$07                  ; 2
    ora    $B6                   ; 3
    sta    $B6                   ; 3
    lda    $BA                   ; 3
    beq    LBC26                 ; 2³
    cmp    #$25                  ; 2
    bcc    LBC2A                 ; 2³
LBC26:
    lda    #$5D                  ; 2
    sta    $BA                   ; 3
LBC2A:
    bit    $84                   ; 3
    bmi    LBC3F                 ; 2³
    lda    #$14                  ; 2
    sta    SC_2B,Y               ; 5
    lda    #8                    ; 2
    sta    SC_18,Y               ; 5
    lda    #0                    ; 2
    sta    SC_05,Y               ; 5
    beq    LBC4E                 ; 3   always branch

LBC3F:
    lda    #$15                  ; 2
    sta    SC_2B,Y               ; 5
    lda    #8                    ; 2
    sta    SC_18,Y               ; 5
    lda    #$78                  ; 2
    sta    SC_05,Y               ; 5
LBC4E:
    jmp    LBCEA                 ; 3

LBC51:
    lda    SC_1A|READ            ; 4
    bne    LBCA2                 ; 2³
    lda    $B7                   ; 3
    and    #$04                  ; 2
    beq    LBCA2                 ; 2³
    lda    $80                   ; 3
    and    #$F0                  ; 2
    cmp    #$70                  ; 2
    bne    LBCA2                 ; 2³
    lda    $81                   ; 3
    and    #$03                  ; 2
    bne    LBCA2                 ; 2³
    lda    $BA                   ; 3
    beq    LBC72                 ; 2³
    cmp    #$25                  ; 2
    bcc    LBC76                 ; 2³
LBC72:
    lda    #$25                  ; 2
    sta    $BA                   ; 3
LBC76:
    lda    #$FF                  ; 2
    ldy    $E0                   ; 3
    cpy    #2                    ; 2
    bcc    LBC80                 ; 2³
    lda    #$40                  ; 2
LBC80:
    cmp    $84                   ; 3
    lda    $84                   ; 3
    and    #$07                  ; 2
    bcs    LBC8A                 ; 2³
    ora    #$80                  ; 2
LBC8A:
    clc                          ; 2
    adc    #$0D                  ; 2
    sta    SC_1A                 ; 4
    lda    #4                    ; 2
    ldx    #0                    ; 2
    bit    $85                   ; 3
    bpl    LBC9C                 ; 2³
    lda    #3                    ; 2
    ldx    #$7C                  ; 2
LBC9C:
    sta    SC_2D                 ; 4
    stx    SC_07                 ; 4
LBCA2:
    jmp    LBCEA                 ; 3

LBCA5:
    lda    SC_18|READ,X          ; 4
    beq    LBCB6                 ; 2³
    ldy    SC_2B|READ,X          ; 4
    lda    LBE75,Y               ; 4
    sta    SC_2B,X               ; 5
    jmp    LBCEA                 ; 3

LBCB6:
    lda    SC_2B|READ,X          ; 4
    cmp    #7                    ; 2
    bne    LBCEA                 ; 2³
    lda    SC_05|READ,X          ; 4
    sec                          ; 2
    sbc    #1                    ; 2
    sta    SC_05,X               ; 5
    bne    LBCEA                 ; 2³
    lda    $BA                   ; 3
    bne    LBCD0                 ; 2³
    lda    #$88                  ; 2
    sta    $BA                   ; 3
LBCD0:
    bit    $84                   ; 3
    bmi    LBCE0                 ; 2³
    lda    #1                    ; 2
    sta    SC_05,X               ; 5
    lda    #$E8                  ; 2
    sta    SC_18,X               ; 5
    bne    LBCEA                 ; 3   always branch

LBCE0:
    lda    #$78                  ; 2
    sta    SC_05,X               ; 5
    lda    #$68                  ; 2
    sta    SC_18,X               ; 5
LBCEA:
    lda    #0                    ; 2
    sta    $F7                   ; 3
    lda    $B5                   ; 3
    bne    LBCF5                 ; 2³
    jmp    LBFE4                 ; 3   bankswitch, goto LD800

LBCF5:
    ldx    #4                    ; 2
LBCF7:
    lda    SC_13|READ,X          ; 4
    beq    LBD06                 ; 2³+1
    lda    SC_26|READ,X          ; 4
    cmp    #$30                  ; 2
    bcc    LBD06                 ; 2³
LBD03:
    jmp    LBFE4                 ; 3   bankswitch, goto LD800

LBD06:
    dex                          ; 2
    bne    LBCF7                 ; 2³+1
    lda    INTIM                 ; 4
    cmp    #$91                  ; 2
    bcc    LBD03                 ; 2³
    lda    #$FF                  ; 2
    sta    $F7                   ; 3
    lda    $B5                   ; 3
    bmi    LBD1D                 ; 2³
    dec    $B5                   ; 5
    jmp    LBDE0                 ; 3

LBD1D:
    inc    $B5                   ; 5
    ldx    #4                    ; 2
LBD21:
    lda    SC_13|READ,X          ; 4
    and    #$1F                  ; 2
    cmp    #3                    ; 2
    bcs    LBD4A                 ; 2³
    lda    #0                    ; 2
    sta    SC_13,X               ; 5
    bit    $F7                   ; 3
    bpl    LBD53                 ; 2³
    stx    $F7                   ; 3
    lda    $84                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    LBA1A,Y               ; 4
    sta    SC_00,X               ; 5
    lda    #$2F                  ; 2
    sta    SC_26,X               ; 5
    lda    #$15                  ; 2
    sta    SC_13,X               ; 5
LBD4A:
    lda    SC_13|READ,X          ; 4
    sec                          ; 2
    sbc    #1                    ; 2
    sta    SC_13,X               ; 5
LBD53:
    dex                          ; 2
    bne    LBD21                 ; 2³
    ldx    #$80                  ; 2
    lda    $9C                   ; 3
    eor    #$01                  ; 2
    sta    $9C                   ; 3
    beq    LBD75                 ; 2³
    stx    $9B                   ; 3
    lda    #0                    ; 2
    sta    SC_58                 ; 4
    sta    SC_6C                 ; 4
    sta    SC_39                 ; 4
    sta    SC_4D                 ; 4
    sta    $B1                   ; 3
    jmp    LBDC7                 ; 3

LBD75:
    stx    $87                   ; 3
    ldx    #0                    ; 2
    stx    SC_6B                 ; 4
    stx    SC_7F                 ; 4
    stx    $B1                   ; 3
LBD81:
    lda    SC_5A|READ,X          ; 4
    sta    SC_58,X               ; 5
    lda    SC_6E|READ,X          ; 4
    sta    SC_6C,X               ; 5
    lda    SC_3B|READ,X          ; 4
    sta    SC_39,X               ; 5
    lda    SC_4F|READ,X          ; 4
    sta    SC_4D,X               ; 5
    lda    $A0,X                 ; 4
    sta    $9E,X                 ; 4
    inx                          ; 2
    cpx    #9                    ; 2
    bcc    LBD81                 ; 2³
LBDA2:
    lda    SC_5A|READ,X          ; 4
    sta    SC_58,X               ; 5
    lda    SC_6E|READ,X          ; 4
    sta    SC_6C,X               ; 5
    lda    $A0,X                 ; 4
    sta    $9E,X                 ; 4
    inx                          ; 2
    cpx    #$12                  ; 2
    bcc    LBDA2                 ; 2³
    lda    #0                    ; 2
    sta    SC_42                 ; 4
    sta    SC_56                 ; 4
    sta    SC_43                 ; 4
    sta    SC_57                 ; 4
    sta    $B0                   ; 3
LBDC7:
    ldx    $9C                   ; 3
    lda    $84                   ; 3
    and    #$07                  ; 2
    asl                          ; 2
    ora    $9C                   ; 3
    tay                          ; 2
    lda    LBA22,Y               ; 4
    sta    SC_6A,X               ; 5
    lda    LBA32,Y               ; 4
    sta    SC_7E,X               ; 5
    jmp    LBFE4                 ; 3   bankswitch, goto LD800

LBDE0:
    ldx    #4                    ; 2
LBDE2:
    lda    SC_13|READ,X          ; 4
    beq    LBDF8                 ; 2³
    clc                          ; 2
    adc    #1                    ; 2
    sta    SC_13,X               ; 5
    and    #$1F                  ; 2
    cmp    #$15                  ; 2
    bcc    LBDF8                 ; 2³
    lda    #0                    ; 2
    sta    SC_13,X               ; 5
LBDF8:
    dex                          ; 2
    bne    LBDE2                 ; 2³
    ldx    #$80                  ; 2
    lda    $9C                   ; 3
    eor    #$01                  ; 2
    sta    $9C                   ; 3
    bne    LBE1C                 ; 2³
    stx    $87                   ; 3
    lda    #0                    ; 2
    sta    SC_43                 ; 4
    sta    SC_57                 ; 4
    sta    SC_6B                 ; 4
    sta    SC_7F                 ; 4
    sta    $B1                   ; 3
    sta    $9D                   ; 3
    jmp    LBFE4                 ; 3   bankswitch, goto LD800

LBE1C:
    stx    $9B                   ; 3
    ldx    #$11                  ; 2
LBE20:
    lda    SC_58|READ,X          ; 4
    sta    SC_5A,X               ; 5
    lda    SC_6C|READ,X          ; 4
    sta    SC_6E,X               ; 5
    lda    $9E,X                 ; 4
    sta    $A0,X                 ; 4
    dex                          ; 2
    cpx    #9                    ; 2
    bcs    LBE20                 ; 2³
LBE35:
    lda    SC_58|READ,X          ; 4
    sta    SC_5A,X               ; 5
    lda    SC_6C|READ,X          ; 4
    sta    SC_6E,X               ; 5
    lda    SC_39|READ,X          ; 4
    sta    SC_3B,X               ; 5
    lda    SC_4D|READ,X          ; 4
    sta    SC_4F,X               ; 5
    lda    $9E,X                 ; 4
    sta    $A0,X                 ; 4
    dex                          ; 2
    bpl    LBE35                 ; 2³
    lda    #0                    ; 2
    sta    SC_39                 ; 4
    sta    SC_4D                 ; 4
    sta    SC_3A                 ; 4
    sta    SC_4E                 ; 4
    sta    SC_58                 ; 4
    sta    SC_6C                 ; 4
    sta    SC_59                 ; 4
    sta    SC_6D                 ; 4
    sta    $9E                   ; 3
    sta    $9D                   ; 3
    jmp    LBFE4                 ; 3   bankswitch, goto LD800

LBE75:
    .byte $00 ; |        | $BE75
    .byte $02 ; |      X | $BE76
    .byte $01 ; |       X| $BE77
    .byte $05 ; |     X X| $BE78
    .byte $06 ; |     XX | $BE79
    .byte $03 ; |      XX| $BE7A
    .byte $04 ; |     X  | $BE7B
    .byte $08 ; |    X   | $BE7C
    .byte $09 ; |    X  X| $BE7D
    .byte $07 ; |     XXX| $BE7E
    .byte $0C ; |    XX  | $BE7F
    .byte $0D ; |    XX X| $BE80
    .byte $0A ; |    X X | $BE81
    .byte $0B ; |    X XX| $BE82
    .byte $0F ; |    XXXX| $BE83
    .byte $10 ; |   X    | $BE84
    .byte $0E ; |    XXX | $BE85
    .byte $12 ; |   X  X | $BE86
    .byte $13 ; |   X  XX| $BE87
    .byte $11 ; |   X   X| $BE88
    .byte $16 ; |   X XX | $BE89
    .byte $17 ; |   X XXX| $BE8A
    .byte $18 ; |   XX   | $BE8B
    .byte $19 ; |   XX  X| $BE8C
    .byte $1A ; |   XX X | $BE8D
    .byte $1B ; |   XX XX| $BE8E
    .byte $14 ; |   X X  | $BE8F
    .byte $15 ; |   X X X| $BE90
    .byte $1C ; |   XXX  | $BE91
    .byte $1D ; |   XXX X| $BE92
    .byte $1E ; |   XXXX | $BE93
    .byte $1F ; |   XXXXX| $BE94
    .byte $20 ; |  X     | $BE95
    .byte $21 ; |  X    X| $BE96
    .byte $22 ; |  X   X | $BE97
    .byte $23 ; |  X   XX| $BE98
    .byte $24 ; |  X  X  | $BE99
    .byte $25 ; |  X  X X| $BE9A
    .byte $26 ; |  X  XX | $BE9B
    .byte $27 ; |  X  XXX| $BE9C
    .byte $28 ; |  X X   | $BE9D
    .byte $29 ; |  X X  X| $BE9E
    .byte $2A ; |  X X X | $BE9F
    .byte $2B ; |  X X XX| $BEA0
    .byte $2C ; |  X XX  | $BEA1
    .byte $2D ; |  X XX X| $BEA2
    .byte $2E ; |  X XXX | $BEA3
LBEA4:
    .byte $00 ; |        | $BEA4
    .byte $06 ; |     XX | $BEA5
    .byte $06 ; |     XX | $BEA6
    .byte $30 ; |  XX    | $BEA7
    .byte $30 ; |  XX    | $BEA8
    .byte $30 ; |  XX    | $BEA9
    .byte $30 ; |  XX    | $BEAA
    .byte $18 ; |   XX   | $BEAB
    .byte $18 ; |   XX   | $BEAC
    .byte $18 ; |   XX   | $BEAD
    .byte $12 ; |   X  X | $BEAE
    .byte $12 ; |   X  X | $BEAF
    .byte $12 ; |   X  X | $BEB0
    .byte $12 ; |   X  X | $BEB1
    .byte $15 ; |   X X X| $BEB2
    .byte $15 ; |   X X X| $BEB3
    .byte $15 ; |   X X X| $BEB4
    .byte $03 ; |      XX| $BEB5
    .byte $03 ; |      XX| $BEB6
    .byte $03 ; |      XX| $BEB7
    .byte $09 ; |    X  X| $BEB8
    .byte $09 ; |    X  X| $BEB9
    .byte $09 ; |    X  X| $BEBA
    .byte $09 ; |    X  X| $BEBB
    .byte $09 ; |    X  X| $BEBC
    .byte $09 ; |    X  X| $BEBD
    .byte $09 ; |    X  X| $BEBE
    .byte $09 ; |    X  X| $BEBF
    .byte $00 ; |        | $BEC0
    .byte $00 ; |        | $BEC1
    .byte $00 ; |        | $BEC2
    .byte $00 ; |        | $BEC3
    .byte $00 ; |        | $BEC4
    .byte $00 ; |        | $BEC5
    .byte $00 ; |        | $BEC6
    .byte $00 ; |        | $BEC7
    .byte $00 ; |        | $BEC8
    .byte $00 ; |        | $BEC9
    .byte $00 ; |        | $BECA
    .byte $00 ; |        | $BECB
    .byte $00 ; |        | $BECC
    .byte $00 ; |        | $BECD
    .byte $00 ; |        | $BECE
    .byte $00 ; |        | $BECF
    .byte $00 ; |        | $BED0
    .byte $00 ; |        | $BED1
    .byte $00 ; |        | $BED2
    .byte $00 ; |        | $BED3
    .byte $00 ; |        | $BED4
    .byte $00 ; |        | $BED5
    .byte $00 ; |        | $BED6
    .byte $00 ; |        | $BED7
    .byte $00 ; |        | $BED8
    .byte $00 ; |        | $BED9
    .byte $00 ; |        | $BEDA
    .byte $00 ; |        | $BEDB
    .byte $00 ; |        | $BEDC
    .byte $00 ; |        | $BEDD
    .byte $00 ; |        | $BEDE
    .byte $00 ; |        | $BEDF
    .byte $00 ; |        | $BEE0
    .byte $00 ; |        | $BEE1
    .byte $00 ; |        | $BEE2
    .byte $00 ; |        | $BEE3
    .byte $20 ; |  X     | $BEE4
    .byte $20 ; |  X     | $BEE5
    .byte $44 ; | X   X  | $BEE6
    .byte $41 ; | X     X| $BEE7
    .byte $56 ; | X X XX | $BEE8
    .byte $45 ; | X   X X| $BEE9
    .byte $20 ; |  X     | $BEEA
    .byte $53 ; | X X  XX| $BEEB
    .byte $54 ; | X X X  | $BEEC
    .byte $41 ; | X     X| $BEED
    .byte $55 ; | X X X X| $BEEE
    .byte $47 ; | X   XXX| $BEEF
    .byte $41 ; | X     X| $BEF0
    .byte $53 ; | X X  XX| $BEF1
    .byte $20 ; |  X     | $BEF2
    .byte $4C ; | X  XX  | $BEF3
    .byte $4F ; | X  XXXX| $BEF4
    .byte $56 ; | X X XX | $BEF5
    .byte $45 ; | X   X X| $BEF6
    .byte $53 ; | X X  XX| $BEF7
    .byte $20 ; |  X     | $BEF8
    .byte $42 ; | X    X | $BEF9
    .byte $45 ; | X   X X| $BEFA
    .byte $41 ; | X     X| $BEFB
    .byte $54 ; | X X X  | $BEFC
    .byte $52 ; | X X  X | $BEFD
    .byte $49 ; | X  X  X| $BEFE
    .byte $43 ; | X    XX| $BEFF
    .byte $45 ; | X   X X| $BF00
    .byte $20 ; |  X     | $BF01
    .byte $48 ; | X  X   | $BF02
    .byte $41 ; | X     X| $BF03
    .byte $42 ; | X    X | $BF04
    .byte $4C ; | X  XX  | $BF05
    .byte $49 ; | X  X  X| $BF06
    .byte $47 ; | X   XXX| $BF07
    .byte $20 ; |  X     | $BF08
    .byte $20 ; |  X     | $BF09
    .byte $00 ; |        | $BF0A
    .byte $00 ; |        | $BF0B
    .byte $00 ; |        | $BF0C
    .byte $00 ; |        | $BF0D
    .byte $00 ; |        | $BF0E
    .byte $00 ; |        | $BF0F
    .byte $00 ; |        | $BF10
    .byte $00 ; |        | $BF11
    .byte $00 ; |        | $BF12
    .byte $00 ; |        | $BF13
    .byte $00 ; |        | $BF14
    .byte $00 ; |        | $BF15
    .byte $00 ; |        | $BF16
    .byte $00 ; |        | $BF17
    .byte $00 ; |        | $BF18
    .byte $00 ; |        | $BF19
    .byte $00 ; |        | $BF1A
    .byte $00 ; |        | $BF1B
    .byte $00 ; |        | $BF1C
    .byte $00 ; |        | $BF1D
    .byte $00 ; |        | $BF1E
    .byte $00 ; |        | $BF1F
    .byte $00 ; |        | $BF20
    .byte $00 ; |        | $BF21
    .byte $00 ; |        | $BF22
    .byte $00 ; |        | $BF23
    .byte $00 ; |        | $BF24
    .byte $00 ; |        | $BF25
    .byte $00 ; |        | $BF26
    .byte $00 ; |        | $BF27
    .byte $00 ; |        | $BF28
    .byte $00 ; |        | $BF29
    .byte $00 ; |        | $BF2A
    .byte $00 ; |        | $BF2B
    .byte $00 ; |        | $BF2C
    .byte $00 ; |        | $BF2D
    .byte $00 ; |        | $BF2E
    .byte $00 ; |        | $BF2F
    .byte $00 ; |        | $BF30
    .byte $00 ; |        | $BF31
    .byte $00 ; |        | $BF32
    .byte $00 ; |        | $BF33
    .byte $00 ; |        | $BF34
    .byte $00 ; |        | $BF35
    .byte $00 ; |        | $BF36
    .byte $00 ; |        | $BF37
    .byte $00 ; |        | $BF38
    .byte $00 ; |        | $BF39
    .byte $00 ; |        | $BF3A
    .byte $00 ; |        | $BF3B
    .byte $00 ; |        | $BF3C
    .byte $00 ; |        | $BF3D
    .byte $00 ; |        | $BF3E
    .byte $00 ; |        | $BF3F
    .byte $00 ; |        | $BF40
    .byte $00 ; |        | $BF41
    .byte $00 ; |        | $BF42
    .byte $00 ; |        | $BF43
    .byte $00 ; |        | $BF44
    .byte $00 ; |        | $BF45
    .byte $00 ; |        | $BF46
    .byte $00 ; |        | $BF47
    .byte $00 ; |        | $BF48
    .byte $00 ; |        | $BF49
    .byte $00 ; |        | $BF4A
    .byte $00 ; |        | $BF4B
    .byte $00 ; |        | $BF4C
    .byte $00 ; |        | $BF4D
    .byte $00 ; |        | $BF4E
    .byte $00 ; |        | $BF4F
    .byte $00 ; |        | $BF50
    .byte $00 ; |        | $BF51
    .byte $00 ; |        | $BF52
    .byte $00 ; |        | $BF53
    .byte $00 ; |        | $BF54
    .byte $00 ; |        | $BF55
    .byte $00 ; |        | $BF56
    .byte $00 ; |        | $BF57
    .byte $00 ; |        | $BF58
    .byte $00 ; |        | $BF59
    .byte $00 ; |        | $BF5A
    .byte $00 ; |        | $BF5B
    .byte $00 ; |        | $BF5C
    .byte $00 ; |        | $BF5D
    .byte $00 ; |        | $BF5E
    .byte $00 ; |        | $BF5F
    .byte $00 ; |        | $BF60
    .byte $00 ; |        | $BF61
    .byte $00 ; |        | $BF62
    .byte $00 ; |        | $BF63
    .byte $00 ; |        | $BF64
    .byte $00 ; |        | $BF65
    .byte $00 ; |        | $BF66
    .byte $00 ; |        | $BF67
    .byte $00 ; |        | $BF68
    .byte $00 ; |        | $BF69
    .byte $00 ; |        | $BF6A
    .byte $00 ; |        | $BF6B
    .byte $00 ; |        | $BF6C
    .byte $00 ; |        | $BF6D
    .byte $00 ; |        | $BF6E
    .byte $00 ; |        | $BF6F
    .byte $00 ; |        | $BF70
    .byte $00 ; |        | $BF71
    .byte $00 ; |        | $BF72
    .byte $00 ; |        | $BF73
    .byte $00 ; |        | $BF74
    .byte $00 ; |        | $BF75
    .byte $00 ; |        | $BF76
    .byte $00 ; |        | $BF77
    .byte $00 ; |        | $BF78
    .byte $00 ; |        | $BF79
    .byte $00 ; |        | $BF7A
    .byte $00 ; |        | $BF7B
    .byte $00 ; |        | $BF7C
    .byte $00 ; |        | $BF7D
    .byte $00 ; |        | $BF7E
    .byte $00 ; |        | $BF7F
    .byte $00 ; |        | $BF80
    .byte $00 ; |        | $BF81
    .byte $00 ; |        | $BF82
    .byte $00 ; |        | $BF83
    .byte $00 ; |        | $BF84
    .byte $00 ; |        | $BF85
    .byte $00 ; |        | $BF86
    .byte $00 ; |        | $BF87
    .byte $00 ; |        | $BF88
    .byte $00 ; |        | $BF89
    .byte $00 ; |        | $BF8A
    .byte $00 ; |        | $BF8B
    .byte $00 ; |        | $BF8C
    .byte $00 ; |        | $BF8D
    .byte $00 ; |        | $BF8E
    .byte $00 ; |        | $BF8F
    .byte $00 ; |        | $BF90
    .byte $00 ; |        | $BF91
    .byte $00 ; |        | $BF92
    .byte $00 ; |        | $BF93
    .byte $00 ; |        | $BF94
    .byte $00 ; |        | $BF95
    .byte $00 ; |        | $BF96
    .byte $00 ; |        | $BF97
    .byte $00 ; |        | $BF98
    .byte $00 ; |        | $BF99
    .byte $00 ; |        | $BF9A
    .byte $00 ; |        | $BF9B
    .byte $00 ; |        | $BF9C
    .byte $00 ; |        | $BF9D
    .byte $00 ; |        | $BF9E
    .byte $00 ; |        | $BF9F
    .byte $00 ; |        | $BFA0
    .byte $00 ; |        | $BFA1
    .byte $00 ; |        | $BFA2
    .byte $00 ; |        | $BFA3
    .byte $00 ; |        | $BFA4
    .byte $00 ; |        | $BFA5
    .byte $00 ; |        | $BFA6
    .byte $00 ; |        | $BFA7
    .byte $00 ; |        | $BFA8
    .byte $00 ; |        | $BFA9
    .byte $00 ; |        | $BFAA
    .byte $00 ; |        | $BFAB
    .byte $00 ; |        | $BFAC
    .byte $00 ; |        | $BFAD
    .byte $00 ; |        | $BFAE
    .byte $00 ; |        | $BFAF
    .byte $00 ; |        | $BFB0
    .byte $00 ; |        | $BFB1
    .byte $00 ; |        | $BFB2
    .byte $00 ; |        | $BFB3
    .byte $00 ; |        | $BFB4
    .byte $00 ; |        | $BFB5
    .byte $00 ; |        | $BFB6
    .byte $00 ; |        | $BFB7
    .byte $00 ; |        | $BFB8
    .byte $00 ; |        | $BFB9
    .byte $00 ; |        | $BFBA
    .byte $00 ; |        | $BFBB
    .byte $00 ; |        | $BFBC
    .byte $00 ; |        | $BFBD
    .byte $00 ; |        | $BFBE
    .byte $00 ; |        | $BFBF
    .byte $00 ; |        | $BFC0
    .byte $00 ; |        | $BFC1
    .byte $00 ; |        | $BFC2
    .byte $00 ; |        | $BFC3
    .byte $00 ; |        | $BFC4
    .byte $00 ; |        | $BFC5
    .byte $00 ; |        | $BFC6
    .byte $00 ; |        | $BFC7
    .byte $00 ; |        | $BFC8
    .byte $00 ; |        | $BFC9
    .byte $00 ; |        | $BFCA
    .byte $00 ; |        | $BFCB
    .byte $00 ; |        | $BFCC
    .byte $00 ; |        | $BFCD
    .byte $00 ; |        | $BFCE
    .byte $00 ; |        | $BFCF
    .byte $00 ; |        | $BFD0
    .byte $00 ; |        | $BFD1
    .byte $00 ; |        | $BFD2
    .byte $00 ; |        | $BFD3
    .byte $00 ; |        | $BFD4
    .byte $00 ; |        | $BFD5
    .byte $00 ; |        | $BFD6
    .byte $00 ; |        | $BFD7
    .byte $00 ; |        | $BFD8
    .byte $00 ; |        | $BFD9
    .byte $00 ; |        | $BFDA
    .byte $00 ; |        | $BFDB
    .byte $00 ; |        | $BFDC
    .byte $00 ; |        | $BFDD
    .byte $00 ; |        | $BFDE
    .byte $00 ; |        | $BFDF
    .byte $00 ; |        | $BFE0
    .byte $00 ; |        | $BFE1
    .byte $00 ; |        | $BFE2
    .byte $00 ; |        | $BFE3

LBFE4:
    lda    BANK_2                ; 4   bankswitch, goto LD800
    jmp.w  $0000                 ; 3   space filler...
    lda    BANK_1                ; 4   space filler... already in bank 1

;coming from bank 2
    jmp    LB100                 ; 3

START_BANK_1:
    lda    BANK_3                ; 4   bankswitch, goto START
    jmp    START                 ; 3   space filler...

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

    SC_RAM_SPACE 256                ; $D000 - $D0FF super chip ram

LD100:
    lda    #$D3                  ; 2
    sta    $EC                   ; 3
    sta    $EE                   ; 3
    nop                          ; 2
    ldy    #0                    ; 2
    lda    $E0                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    bne    LD113                 ; 2³
    lda    #$0A                  ; 2
LD113:
    sta    $F7                   ; 3
    tax                          ; 2
    lda    LD342,X               ; 4
    sta    $EB                   ; 3
    lda    $B2                   ; 3
    clc                          ; 2
    adc    #6                    ; 2
    tax                          ; 2
    lda    LD3B3,X               ; 4
    and    #$F0                  ; 2
    ora    #$07                  ; 2
    sty    COLUBK                ; 3
    sta    COLUPF                ; 3
    lda    #$FF                  ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    lda    $E0                   ; 3
    and    #$0F                  ; 2
    bne    LD146                 ; 2³
    lda    #$0A                  ; 2
    cmp    $F7                   ; 3
    bmi    LD146                 ; 2³
    beq    LD146                 ; 2³
    lda    #0                    ; 2
LD146:
    sta    $F7                   ; 3
    tay                          ; 2
    lda    LD342,Y               ; 4
    sta    $ED                   ; 3
    lda    $E1                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    bne    LD15E                 ; 2³
    lda    #$0A                  ; 2
    cmp    $F7                   ; 3
    beq    LD15E                 ; 2³
    lda    #0                    ; 2
LD15E:
    sta    $F7                   ; 3
    tay                          ; 2
    lda    LD342,Y               ; 4
    sta    $EF                   ; 3
    lda    $E1                   ; 3
    and    #$0F                  ; 2
    bne    LD174                 ; 2³
    lda    #$0A                  ; 2
    cmp    $F7                   ; 3
    beq    LD174                 ; 2³
    lda    #0                    ; 2
LD174:
    sta    $F7                   ; 3
    tay                          ; 2
    lda    LD342,Y               ; 4
    sta    $F1                   ; 3
    lda    $E2                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LD342,Y               ; 4
    sta    $F3                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda.w  $E2                   ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LD342,Y               ; 4
    sta    $F5                   ; 3
    ldx    #0                    ; 2
    stx    COLUPF                ; 3
    lda    $82                   ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LD393,Y               ; 4
    sta    PF1                   ; 3
    lda    LD3A3,Y               ; 4
    sta    PF2                   ; 3
    stx    HMP1                  ; 3
    inx                          ; 2
    stx    VDELP0                ; 3
    lda    #3                    ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    stx    VDELP1                ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$F0                  ; 2
    sta    HMP0                  ; 3
    lda    $80                   ; 3
    ldx    #$7F                  ; 2  @76
;---------------------------------------
    sta    HMOVE                 ; 3
    bit    $82                   ; 3
    bvc    LD1CE                 ; 2³
    nop                          ; 2
    and    #$08                  ; 2
    beq    LD1D5                 ; 2³
    bne    LD1D6                 ; 3   always branch

LD1CE:
    jmp    LD1D1                 ; 3

LD1D1:
    bmi    LD1D5                 ; 2³
    bpl    LD1D6                 ; 3   always branch

LD1D5:
    tax                          ; 2
LD1D6:
    stx    COLUP0                ; 3  @20
    stx    COLUP1                ; 3
    lda    #$D3                  ; 2   high nibble
    sta    $F0                   ; 3
    sta    $F2                   ; 3
    sta    $F4                   ; 3
    sta    $F6                   ; 3
    ldx    $B4                   ; 3
    lda    LD33F,X               ; 4
    ldx    $B2                   ; 3
    and    LD3B3,X               ; 4
    sta    $D9                   ; 3
    cmp    ($F7,X)               ; 6
    lda    #0                    ; 2
    sta    $BD                   ; 3
    lda    $BD                   ; 3
    lda    $D9                   ; 3
    sta    COLUPF                ; 3
    nop                          ; 2  @76
;---------------------------------------
    ldy    #6                    ; 2
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($ED),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($EF),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($F1),Y               ; 5
    sta    $F8                   ; 3
    lda    ($F3),Y               ; 5
    tax                          ; 2
    lda    ($F5),Y               ; 5
    tay                          ; 2
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    lda    $F8                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    $D9                   ; 3
    sta    COLUPF                ; 3
    nop                          ; 2  @76
;---------------------------------------
    ldy    #5                    ; 2
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($ED),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($EF),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($F1),Y               ; 5
    sta    $F8                   ; 3
    lda    ($F3),Y               ; 5
    tax                          ; 2
    lda    ($F5),Y               ; 5
    tay                          ; 2
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    lda    $F8                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    $D9                   ; 3
    sta    COLUPF                ; 3
    nop                          ; 2  @76
;---------------------------------------
    ldy    #4                    ; 2
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($ED),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($EF),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($F1),Y               ; 5
    sta    $F8                   ; 3
    lda    ($F3),Y               ; 5
    tax                          ; 2
    lda    ($F5),Y               ; 5
    tay                          ; 2
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    lda    $F8                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    $D9                   ; 3
    sta    COLUPF                ; 3
    nop                          ; 2  @76
;---------------------------------------
    ldy    #3                    ; 2
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($ED),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($EF),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($F1),Y               ; 5
    sta    $F8                   ; 3
    lda    ($F3),Y               ; 5
    tax                          ; 2
    lda    ($F5),Y               ; 5
    tay                          ; 2
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    lda    $F8                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    $D9                   ; 3
    sta    COLUPF                ; 3
    nop                          ; 2  @76
;---------------------------------------
    ldy    #2                    ; 2
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($ED),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($EF),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($F1),Y               ; 5
    sta    $F8                   ; 3
    lda    ($F3),Y               ; 5
    tax                          ; 2
    lda    ($F5),Y               ; 5
    tay                          ; 2
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    lda    $F8                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    $D9                   ; 3
    sta    COLUPF                ; 3
    nop                          ; 2  @76
;---------------------------------------
    ldy    #1                    ; 2
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($ED),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($EF),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($F1),Y               ; 5
    sta    $F8                   ; 3
    lda    ($F3),Y               ; 5
    tax                          ; 2
    lda    ($F5),Y               ; 5
    tay                          ; 2
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    lda    $F8                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    $D9                   ; 3
    sta    COLUPF                ; 3
    nop                          ; 2  @76
;---------------------------------------
    ldy    #0                    ; 2
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($ED),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($EF),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($F1),Y               ; 5
    sta    $F8                   ; 3
    lda    ($F3),Y               ; 5
    tax                          ; 2
    lda    ($F5),Y               ; 5
    tay                          ; 2
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    lda    $F8                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    #0                    ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3  @76
;---------------------------------------
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    #2                    ; 2
    sta    VBLANK                ; 3
    lda    #$A2                  ; 2
    sta    TIM64T                ; 4
    jmp    LDFEA                 ; 3   bankswitch, goto LB100

LD33F:
    .byte $FF ; |XXXXXXXX| $D33F
    .byte $FF ; |XXXXXXXX| $D340
    .byte $F6 ; |XXXX XX | $D341
LD342:
    .byte <Zero          ; $D342
    .byte <One           ; $D343
    .byte <Two           ; $D344
    .byte <Three         ; $D345
    .byte <Four          ; $D346
    .byte <Five          ; $D347
    .byte <Six           ; $D348
    .byte <Seven         ; $D349
    .byte <Eight         ; $D34A
    .byte <Nine          ; $D34B
    .byte <BlankDigit    ; $D34C
Seven:
    .byte $18 ; |   XX   | $D34D
    .byte $18 ; |   XX   | $D34E
    .byte $18 ; |   XX   | $D34F
    .byte $0C ; |    XX  | $D350
    .byte $06 ; |     XX | $D351
    .byte $36 ; |  XX XX | $D352
Two:
    .byte $3E ; |  XXXXX | $D353   shared
    .byte $38 ; |  XXX   | $D354
    .byte $1C ; |   XXX  | $D355
    .byte $0E ; |    XXX | $D356
    .byte $36 ; |  XX XX | $D357
    .byte $36 ; |  XX XX | $D358
Zero:
    .byte $1C ; |   XXX  | $D359   shared
    .byte $36 ; |  XX XX | $D35A
    .byte $36 ; |  XX XX | $D35B
    .byte $36 ; |  XX XX | $D35C
    .byte $36 ; |  XX XX | $D35D
    .byte $36 ; |  XX XX | $D35E
Three:
    .byte $1C ; |   XXX  | $D35F   shared
    .byte $36 ; |  XX XX | $D360
    .byte $36 ; |  XX XX | $D361
    .byte $0C ; |    XX  | $D362
    .byte $06 ; |     XX | $D363
    .byte $36 ; |  XX XX | $D364
Six:
    .byte $1C ; |   XXX  | $D365   shared
    .byte $36 ; |  XX XX | $D366
    .byte $36 ; |  XX XX | $D367
    .byte $3C ; |  XXXX  | $D368
    .byte $30 ; |  XX    | $D369
    .byte $36 ; |  XX XX | $D36A
Eight:
    .byte $1C ; |   XXX  | $D36B   shared
    .byte $36 ; |  XX XX | $D36C
    .byte $36 ; |  XX XX | $D36D
    .byte $1C ; |   XXX  | $D36E
    .byte $36 ; |  XX XX | $D36F
    .byte $36 ; |  XX XX | $D370
Nine:
    .byte $1C ; |   XXX  | $D371   shared
    .byte $36 ; |  XX XX | $D372
    .byte $06 ; |     XX | $D373
    .byte $1E ; |   XXXX | $D374
    .byte $36 ; |  XX XX | $D375
    .byte $36 ; |  XX XX | $D376
Five:
    .byte $1C ; |   XXX  | $D377   shared
    .byte $36 ; |  XX XX | $D378
    .byte $06 ; |     XX | $D379
    .byte $06 ; |     XX | $D37A
    .byte $3C ; |  XXXX  | $D37B
    .byte $30 ; |  XX    | $D37C
    .byte $3E ; |  XXXXX | $D37D
One:
    .byte $0C ; |    XX  | $D37E
    .byte $0C ; |    XX  | $D37F
    .byte $0C ; |    XX  | $D380
    .byte $0C ; |    XX  | $D381
    .byte $1C ; |   XXX  | $D382
    .byte $1C ; |   XXX  | $D383
    .byte $0C ; |    XX  | $D384
Four:
    .byte $06 ; |     XX | $D385
    .byte $06 ; |     XX | $D386
    .byte $3E ; |  XXXXX | $D387
    .byte $36 ; |  XX XX | $D388
    .byte $1E ; |   XXXX | $D389
    .byte $0E ; |    XXX | $D38A
    .byte $06 ; |     XX | $D38B
BlankDigit:
    .byte $00 ; |        | $D38C
    .byte $00 ; |        | $D38D
    .byte $00 ; |        | $D38E
    .byte $00 ; |        | $D38F
    .byte $00 ; |        | $D390
    .byte $00 ; |        | $D391
    .byte $00 ; |        | $D392
LD393:
    .byte $00 ; |        | $D393
    .byte $80 ; |X       | $D394
    .byte $A0 ; |X X     | $D395
    .byte $A8 ; |X X X   | $D396
    .byte $AA ; |X X X X | $D397
    .byte $AA ; |X X X X | $D398
    .byte $AA ; |X X X X | $D399
    .byte $AA ; |X X X X | $D39A
    .byte $AA ; |X X X X | $D39B
    .byte $AA ; |X X X X | $D39C
    .byte $AA ; |X X X X | $D39D
    .byte $AA ; |X X X X | $D39E
    .byte $AA ; |X X X X | $D39F
    .byte $AA ; |X X X X | $D3A0
    .byte $AA ; |X X X X | $D3A1
    .byte $AA ; |X X X X | $D3A2
LD3A3:
    .byte $00 ; |        | $D3A3
    .byte $00 ; |        | $D3A4
    .byte $00 ; |        | $D3A5
    .byte $00 ; |        | $D3A6
    .byte $00 ; |        | $D3A7
    .byte $01 ; |       X| $D3A8
    .byte $05 ; |     X X| $D3A9
    .byte $15 ; |   X X X| $D3AA
    .byte $15 ; |   X X X| $D3AB
    .byte $15 ; |   X X X| $D3AC
    .byte $15 ; |   X X X| $D3AD
    .byte $15 ; |   X X X| $D3AE
    .byte $15 ; |   X X X| $D3AF
    .byte $15 ; |   X X X| $D3B0
    .byte $15 ; |   X X X| $D3B1
    .byte $15 ; |   X X X| $D3B2
LD3B3:
    .byte $34 ; |  XX X  | $D3B3
    .byte $84 ; |X    X  | $D3B4
    .byte $18 ; |   XX   | $D3B5
    .byte $56 ; | X X XX | $D3B6
    .byte $44 ; | X   X  | $D3B7
    .byte $66 ; | XX  XX | $D3B8
    .byte $D6 ; |XX X XX | $D3B9
    .byte $98 ; |X  XX   | $D3BA
    .byte $34 ; |  XX X  | $D3BB
    .byte $84 ; |X    X  | $D3BC
    .byte $18 ; |   XX   | $D3BD
    .byte $56 ; | X X XX | $D3BE
    .byte $44 ; | X   X  | $D3BF
    .byte $66 ; | XX  XX | $D3C0
    .byte $D6 ; |XX X XX | $D3C1
    .byte $98 ; |X  XX   | $D3C2
    .byte $34 ; |  XX X  | $D3C3
    .byte $84 ; |X    X  | $D3C4
    .byte $18 ; |   XX   | $D3C5
    .byte $56 ; | X X XX | $D3C6
    .byte $44 ; | X   X  | $D3C7
    .byte $66 ; | XX  XX | $D3C8
    .byte $D6 ; |XX X XX | $D3C9
    .byte $98 ; |X  XX   | $D3CA
    .byte $34 ; |  XX X  | $D3CB
    .byte $84 ; |X    X  | $D3CC
    .byte $18 ; |   XX   | $D3CD
    .byte $56 ; | X X XX | $D3CE
    .byte $44 ; | X   X  | $D3CF
    .byte $66 ; | XX  XX | $D3D0
    .byte $D6 ; |XX X XX | $D3D1
    .byte $98 ; |X  XX   | $D3D2
    .byte $08 ; |    X   | $D3D3
    .byte $08 ; |    X   | $D3D4
    .byte $08 ; |    X   | $D3D5
    .byte $08 ; |    X   | $D3D6
    .byte $08 ; |    X   | $D3D7
    .byte $08 ; |    X   | $D3D8
    .byte $08 ; |    X   | $D3D9
    .byte $08 ; |    X   | $D3DA
    .byte $08 ; |    X   | $D3DB
    .byte $08 ; |    X   | $D3DC
    .byte $08 ; |    X   | $D3DD
    .byte $08 ; |    X   | $D3DE
    .byte $08 ; |    X   | $D3DF
    .byte $08 ; |    X   | $D3E0
    .byte $08 ; |    X   | $D3E1
    .byte $08 ; |    X   | $D3E2

LD3E3:
    lda    $F2                   ; 3
    sta    $F9                   ; 3
    lda    $F4                   ; 3
    sta    $FA                   ; 3
    lda    $F5                   ; 3
    sta    $FB                   ; 3
    lda    #0                    ; 2
    sta    $9C,X                 ; 4
    sta    $9B,X                 ; 4
    sta    $9A,X                 ; 4
    sta    $99,X                 ; 4
    sta    $98,X                 ; 4
    ldy    #3                    ; 2
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    sty    NUSIZ0                ; 3
    sty    NUSIZ1                ; 3
    sty    VDELP0                ; 3
    sty    VDELP1                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    HMP1                  ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    ldy    #$F0                  ; 2
    sty    HMP0                  ; 3
    lda    #>LogoOne             ; 2   high nibble
    sta    $EC                   ; 3
    sta    $EE                   ; 3
    sta    $F0                   ; 3
    sta    $F2                   ; 3
    sta    $F4                   ; 3
    sta    $F6                   ; 3
    lda    #0                    ; 2   black
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    VBLANK                ; 3
    lda    #<LogoOne             ; 2   logo pointers
    sta    $EB                   ; 3
    lda    #<LogoTwo             ; 2
    sta    $ED                   ; 3
    lda    #<LogoThree           ; 2
    sta    $EF                   ; 3
    lda    #<LogoFour            ; 2
    sta    $F1                   ; 3
    lda    #<LogoFive            ; 2
    sta    $F3                   ; 3
    lda    #<LogoSix             ; 2
    sta    $F5                   ; 3
    lda    $F9                   ; 3
    bmi    LD45D                 ; 2³
    sec                          ; 2
    sbc    #$0E                  ; 2
    sta    $F9                   ; 3
    bcs    LD467                 ; 2³
    adc    $FA                   ; 3
    adc    #1                    ; 2
    jmp    LD45F                 ; 3

LD45D:
    lda    $FA                   ; 3
LD45F:
    sta    $F9                   ; 3
    lda    #$61                  ; 2
    sta    CTRLPF                ; 3
    sta    $FA                   ; 3
LD467:
    ldy    $C1                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    bit    $FA                   ; 3
    bvc    LD480                 ; 2³
    lda    #$3F                  ; 2
    sta    $FA                   ; 3
    lda    LD601,Y               ; 4
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
    tay                          ; 2
LD47B:
    dey                          ; 2
    bpl    LD47B                 ; 2³
    sta    RESBL                 ; 3
LD480:
    lda    $D9                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    $EA                   ; 3
    sec                          ; 2
    sbc    #5                    ; 2
    sta    $EA                   ; 3
    lda    #$80                  ; 2
    sta    $86,X                 ; 4
    sta    $85,X                 ; 4
    sta    $84,X                 ; 4
    sta    $83,X                 ; 4
    sta    $82,X                 ; 4
    bit    $83                   ; 3
    bmi    LD4A5                 ; 2³
    bit    $82                   ; 3
    bvs    LD4A6                 ; 2³
    bvc    LD4A9                 ; 3   always branch

LD4A5:
    clv                          ; 2
LD4A6:
    jmp    LD69F                 ; 3

LD4A9:
    lda    #$25                  ; 2
LD4AB:
    clc                          ; 2
    sta    $F7                   ; 3
LD4AE:
    ldy    $F7                   ; 3
    lda    ($EB),Y               ; 5
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ($ED),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($EF),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($F1),Y               ; 5
    sta    $F8                   ; 3
    lda    ($F3),Y               ; 5
    tax                          ; 2
    lda    ($F5),Y               ; 5
    tay                          ; 2
    lda    $F8                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    dec    $F7                   ; 5
    bpl    LD4AE                 ; 2³
    ldy    #0                    ; 2
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3  @74
;---------------------------------------
    sty    VDELP0                ; 3  @1
    sty    VDELP1                ; 3
    lda    $B4                   ; 3
    sta    VBLANK                ; 3
    lda    $F9                   ; 3
    sta    $F2                   ; 3
    ldx    $EA                   ; 3
    lda    $86,X                 ; 4
    and    #$3F                  ; 2
    tay                          ; 2
    ldx    SC_00|READ,Y          ; 4
    lda    LD600,X               ; 4
    sta    $EF                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    LD680,X               ; 4
    sta    $EB                   ; 3
    ldy    #0                    ; 2
    lda    #$93                  ; 2
    sta    $EC                   ; 3
    lda    #$95                  ; 2
    sta    $EE                   ; 3
    lda    #$97                  ; 2   high nibble
    sta    $F0                   ; 3
    lda    $FA                   ; 3
    sta    $F4                   ; 3
    lda    $EA                   ; 3
    beq    LD520                 ; 2³
    lda    $FB                   ; 3
    sta    $F5                   ; 3
    jmp    LDFDE                 ; 3   bankswitch, goto L991C

LD520:
    jmp    LD689                 ; 3

  REPEAT ($D600-*)                  ; 221 free bytes
    .byte 0
  REPEND

       ORG $4600
      RORG $D600

LD600:
    .byte $50 ; | X X    | $D600
LD601:
    .byte $40 ; | X      | $D601
    .byte $30 ; |  XX    | $D602
    .byte $20 ; |  X     | $D603
    .byte $10 ; |   X    | $D604
    .byte $00 ; |        | $D605
    .byte $F0 ; |XXXX    | $D606
    .byte $E0 ; |XXX     | $D607
    .byte $D0 ; |XX X    | $D608
    .byte $C0 ; |XX      | $D609
    .byte $B0 ; |X XX    | $D60A
    .byte $A0 ; |X X     | $D60B
    .byte $90 ; |X  X    | $D60C
    .byte $80 ; |X       | $D60D
    .byte $61 ; | XX    X| $D60E
    .byte $51 ; | X X   X| $D60F
    .byte $41 ; | X     X| $D610
    .byte $31 ; |  XX   X| $D611
    .byte $21 ; |  X    X| $D612
    .byte $11 ; |   X   X| $D613
    .byte $01 ; |       X| $D614
    .byte $F1 ; |XXXX   X| $D615
    .byte $E1 ; |XXX    X| $D616
    .byte $D1 ; |XX X   X| $D617
    .byte $C1 ; |XX     X| $D618
    .byte $B1 ; |X XX   X| $D619
    .byte $A1 ; |X X    X| $D61A
    .byte $91 ; |X  X   X| $D61B
    .byte $81 ; |X      X| $D61C
    .byte $62 ; | XX   X | $D61D
    .byte $52 ; | X X  X | $D61E
    .byte $42 ; | X    X | $D61F
    .byte $32 ; |  XX  X | $D620
    .byte $22 ; |  X   X | $D621
    .byte $12 ; |   X  X | $D622
    .byte $02 ; |      X | $D623
    .byte $F2 ; |XXXX  X | $D624
    .byte $E2 ; |XXX   X | $D625
    .byte $D2 ; |XX X  X | $D626
    .byte $C2 ; |XX    X | $D627
    .byte $B2 ; |X XX  X | $D628
    .byte $A2 ; |X X   X | $D629
    .byte $92 ; |X  X  X | $D62A
    .byte $82 ; |X     X | $D62B
    .byte $63 ; | XX   XX| $D62C
    .byte $53 ; | X X  XX| $D62D
    .byte $43 ; | X    XX| $D62E
    .byte $33 ; |  XX  XX| $D62F
    .byte $23 ; |  X   XX| $D630
    .byte $13 ; |   X  XX| $D631
    .byte $03 ; |      XX| $D632
    .byte $F3 ; |XXXX  XX| $D633
    .byte $E3 ; |XXX   XX| $D634
    .byte $D3 ; |XX X  XX| $D635
    .byte $C3 ; |XX    XX| $D636
    .byte $B3 ; |X XX  XX| $D637
    .byte $A3 ; |X X   XX| $D638
    .byte $93 ; |X  X  XX| $D639
    .byte $83 ; |X     XX| $D63A
    .byte $64 ; | XX  X  | $D63B
    .byte $54 ; | X X X  | $D63C
    .byte $44 ; | X   X  | $D63D
    .byte $34 ; |  XX X  | $D63E
    .byte $24 ; |  X  X  | $D63F
    .byte $14 ; |   X X  | $D640
    .byte $04 ; |     X  | $D641
    .byte $F4 ; |XXXX X  | $D642
    .byte $E4 ; |XXX  X  | $D643
    .byte $D4 ; |XX X X  | $D644
    .byte $C4 ; |XX   X  | $D645
    .byte $B4 ; |X XX X  | $D646
    .byte $A4 ; |X X  X  | $D647
    .byte $94 ; |X  X X  | $D648
    .byte $84 ; |X    X  | $D649
    .byte $65 ; | XX  X X| $D64A
    .byte $55 ; | X X X X| $D64B
    .byte $45 ; | X   X X| $D64C
    .byte $35 ; |  XX X X| $D64D
    .byte $25 ; |  X  X X| $D64E
    .byte $15 ; |   X X X| $D64F
    .byte $05 ; |     X X| $D650
    .byte $F5 ; |XXXX X X| $D651
    .byte $E5 ; |XXX  X X| $D652
    .byte $D5 ; |XX X X X| $D653
    .byte $C5 ; |XX   X X| $D654
    .byte $B5 ; |X XX X X| $D655
    .byte $A5 ; |X X  X X| $D656
    .byte $95 ; |X  X X X| $D657
    .byte $85 ; |X    X X| $D658
    .byte $66 ; | XX  XX | $D659
    .byte $56 ; | X X XX | $D65A
    .byte $46 ; | X   XX | $D65B
    .byte $36 ; |  XX XX | $D65C
    .byte $26 ; |  X  XX | $D65D
    .byte $16 ; |   X XX | $D65E
    .byte $06 ; |     XX | $D65F
    .byte $F6 ; |XXXX XX | $D660
    .byte $E6 ; |XXX  XX | $D661
    .byte $D6 ; |XX X XX | $D662
    .byte $C6 ; |XX   XX | $D663
    .byte $B6 ; |X XX XX | $D664
    .byte $A6 ; |X X  XX | $D665
    .byte $96 ; |X  X XX | $D666
    .byte $86 ; |X    XX | $D667
    .byte $67 ; | XX  XXX| $D668
    .byte $57 ; | X X XXX| $D669
    .byte $47 ; | X   XXX| $D66A
    .byte $37 ; |  XX XXX| $D66B
    .byte $27 ; |  X  XXX| $D66C
    .byte $17 ; |   X XXX| $D66D
    .byte $07 ; |     XXX| $D66E
    .byte $F7 ; |XXXX XXX| $D66F
    .byte $E7 ; |XXX  XXX| $D670
    .byte $D7 ; |XX X XXX| $D671
    .byte $C7 ; |XX   XXX| $D672
    .byte $B7 ; |X XX XXX| $D673
    .byte $A7 ; |X X  XXX| $D674
    .byte $97 ; |X  X XXX| $D675
    .byte $87 ; |X    XXX| $D676
    .byte $68 ; | XX X   | $D677
    .byte $58 ; | X XX   | $D678
    .byte $48 ; | X  X   | $D679
    .byte $38 ; |  XXX   | $D67A
    .byte $28 ; |  X X   | $D67B
    .byte $18 ; |   XX   | $D67C
    .byte $08 ; |    X   | $D67D
    .byte $F8 ; |XXXXX   | $D67E
    .byte $E8 ; |XXX X   | $D67F
LD680:
    .byte $00 ; |        | $D680
    .byte $1B ; |   XX XX| $D681
    .byte $36 ; |  XX XX | $D682
    .byte $51 ; | X X   X| $D683
    .byte $6C ; | XX XX  | $D684
    .byte $87 ; |X    XXX| $D685
    .byte $A2 ; |X X   X | $D686
    .byte $EE ; |XXX XXX | $D687
    .byte $C4 ; |XX   X  | $D688

LD689:
    lda    $FD                   ; 3
    sta    $EA                   ; 3
    lda    #0                    ; 2
    sta    $FD                   ; 3
    lda    $FB                   ; 3
    ldx    #$0A                  ; 2
LD695:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    LD695                 ; 2³
    sta    $F5                   ; 3
    jmp    LDFDE                 ; 3   bankswitch, goto L991C

LD69F:
    lda    #>GameOverOne         ; 2   high nibble
    sta    $EC                   ; 3
    sta    $EE                   ; 3
    sta    $F0                   ; 3
    sta    $F2                   ; 3
    sta    $F4                   ; 3
    sta    $F6                   ; 3
    bvs    LD6C9                 ; 2³
    lda    #<GameOverOne         ; 2
    sta    $EB                   ; 3
    lda    #<GameOverTwo         ; 2
    sta    $ED                   ; 3
    lda    #<GameOverThree       ; 2
    sta    $EF                   ; 3
    lda    #<GameOverFour        ; 2
    sta    $F1                   ; 3
    lda    #<GameOverFive        ; 2
    sta    $F3                   ; 3
    lda    #<GameOverSix         ; 2
    sta    $F5                   ; 3
    bne    LD6E1                 ; 3   always branch

LD6C9:
    lda    #<SelectScoreOne      ; 2
    sta    $EB                   ; 3
    lda    #<SelectScoreTwo      ; 2
    sta    $ED                   ; 3
    lda    #<SelectScoreThree    ; 2
    sta    $EF                   ; 3
    lda    #<SelectScoreFour     ; 2
    sta    $F1                   ; 3
    lda    #<SelectScoreFive     ; 2
    sta    $F3                   ; 3
    lda    #<SelectScoreSix      ; 2
    sta    $F5                   ; 3
LD6E1:
    lda    $EA                   ; 3
    sta    $FD                   ; 3
    lda    #0                    ; 2
    sta    $EA                   ; 3
    ldx    #9                    ; 2
LD6EB:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    LD6EB                 ; 2³
    lda    #$0F                  ; 2
    jmp    LD4AB                 ; 3

    .byte $00 ; |        | $D6F5   free bytes
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;                  XX XX                      XX
;                  XX XX                      XX
;                  XX XX                      XX
;               XX XX XX XX                   XX
;               XX XX XX XX                   XX
;               XX XX XX XX                   XX
;                  XX XX                      XX
;       XX  XX  XX XX XX XX                   XX
;      XXXXXXXX XX XX XX XX XXXXX   XXXX   XXXXX  XXXX
;      XXXXXXXX XX XX XX XX XXXXXX XXXXXX XXXXXX XXXXXX
;      XXXXXXXX XX XX XX XX XXXXXX XXXXXX XXXXXX XXXXXX
;      XX XX XX XX XX XX XX XX  XX XX  XX XX  XX XX  XX
;      XX XX XX XX XX XX XX XX  XX XX  XX XX  XX XX  XX
;      XX XX XX XX XX XX XX XX  XX XX  XX XX  XX XX  XX
;      XX XX XX XX XX XX XX XX  XX XX  XX XX  XX XX  XX
;      XX XX XX XX XX XX XX XX  XX XXXXXX XX  XX XXXXXX
;      XX XX XX XX XX XX XX XX  XX XXXXXX XX  XX XXXXXX
;      XX XX XX XX XX XX XX XX  XX XX     XX  XX XX
;      XX XX XX XX XX XX XX XX  XX XX     XX  XX XX
;      XX XX XX XX XX XX XX XX  XX XX     XX  XX XX
;      XX XX XX XX XX XX XX XX  XX XX     XX  XX XX
;      XX XX XX XX XX XX XX XXXXXX XXXXX  XX  XX XXXXX
;      XX XX XX XX XX XX XX XXXXXX XXXXX  XXXXXX XXXXX
;      XX XX XX XX XX XX XX XXXXX   XXXX   XXXXX  XXXX
;                           XX
;                           XX
;                           XX
;                           XX
;                           XX
;                           XX
;
;          XXXX    X XXX XXX   X   XXX XXX XXX XX  X
;         X    X   X X X X X X X   X X  X  X X X X X
;         X XX X   X X X X X X X   X X  X  X X X X X
;         X X  X   X XXX XXX XXX   XXX  X  XXX XX  X
;         X XX X   X   X X X   X   X X  X  X X X X X
;         X    X   X   X X X   X   X X  X  X X X X X
;          XXXX    X XXX XXX   X   X X  X  X X X X X
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LogoOne:
    .byte $0F ; |    XXXX| $D700
    .byte $10 ; |   X    | $D701
    .byte $16 ; |   X XX | $D702
    .byte $14 ; |   X X  | $D703
    .byte $16 ; |   X XX | $D704
    .byte $10 ; |   X    | $D705
    .byte $0F ; |    XXXX| $D706
    .byte $00 ; |        | $D707
    .byte $00 ; |        | $D708
    .byte $00 ; |        | $D709
    .byte $00 ; |        | $D70A
    .byte $00 ; |        | $D70B
    .byte $00 ; |        | $D70C
    .byte $00 ; |        | $D70D
    .byte $DB ; |XX XX XX| $D70E
    .byte $DB ; |XX XX XX| $D70F
    .byte $DB ; |XX XX XX| $D710
    .byte $DB ; |XX XX XX| $D711
    .byte $DB ; |XX XX XX| $D712
    .byte $DB ; |XX XX XX| $D713
    .byte $DB ; |XX XX XX| $D714
    .byte $DB ; |XX XX XX| $D715
    .byte $DB ; |XX XX XX| $D716
    .byte $DB ; |XX XX XX| $D717
    .byte $DB ; |XX XX XX| $D718
    .byte $DB ; |XX XX XX| $D719
    .byte $DB ; |XX XX XX| $D71A
    .byte $FF ; |XXXXXXXX| $D71B
    .byte $FF ; |XXXXXXXX| $D71C
    .byte $FF ; |XXXXXXXX| $D71D
    .byte $66 ; | XX  XX | $D71E
    .byte $00 ; |        | $D71F
    .byte $00 ; |        | $D720
    .byte $00 ; |        | $D721
    .byte $00 ; |        | $D722
    .byte $00 ; |        | $D723
    .byte $00 ; |        | $D724
    .byte $00 ; |        | $D725
LogoTwo:
    .byte $0B ; |    X XX| $D726
    .byte $88 ; |X   X   | $D727
    .byte $88 ; |X   X   | $D728
    .byte $8B ; |X   X XX| $D729
    .byte $8A ; |X   X X | $D72A
    .byte $8A ; |X   X X | $D72B
    .byte $0B ; |    X XX| $D72C
    .byte $00 ; |        | $D72D
    .byte $00 ; |        | $D72E
    .byte $00 ; |        | $D72F
    .byte $00 ; |        | $D730
    .byte $00 ; |        | $D731
    .byte $00 ; |        | $D732
    .byte $00 ; |        | $D733
    .byte $6D ; | XX XX X| $D734
    .byte $6D ; | XX XX X| $D735
    .byte $6D ; | XX XX X| $D736
    .byte $6D ; | XX XX X| $D737
    .byte $6D ; | XX XX X| $D738
    .byte $6D ; | XX XX X| $D739
    .byte $6D ; | XX XX X| $D73A
    .byte $6D ; | XX XX X| $D73B
    .byte $6D ; | XX XX X| $D73C
    .byte $6D ; | XX XX X| $D73D
    .byte $6D ; | XX XX X| $D73E
    .byte $6D ; | XX XX X| $D73F
    .byte $6D ; | XX XX X| $D740
    .byte $6D ; | XX XX X| $D741
    .byte $6D ; | XX XX X| $D742
    .byte $6D ; | XX XX X| $D743
    .byte $6D ; | XX XX X| $D744
    .byte $0D ; |    XX X| $D745
    .byte $6D ; | XX XX X| $D746
    .byte $6D ; | XX XX X| $D747
    .byte $6D ; | XX XX X| $D748
    .byte $0D ; |    XX X| $D749
    .byte $0D ; |    XX X| $D74A
    .byte $0D ; |    XX X| $D74B
LogoThree:
    .byte $B8 ; |X XXX   | $D74C
    .byte $A8 ; |X X X   | $D74D
    .byte $A8 ; |X X X   | $D74E
    .byte $BB ; |X XXX XX| $D74F
    .byte $AA ; |X X X X | $D750
    .byte $AA ; |X X X X | $D751
    .byte $B8 ; |X XXX   | $D752
    .byte $00 ; |        | $D753
    .byte $06 ; |     XX | $D754
    .byte $06 ; |     XX | $D755
    .byte $06 ; |     XX | $D756
    .byte $06 ; |     XX | $D757
    .byte $06 ; |     XX | $D758
    .byte $06 ; |     XX | $D759
    .byte $B7 ; |X XX XXX| $D75A
    .byte $B7 ; |X XX XXX| $D75B
    .byte $B7 ; |X XX XXX| $D75C
    .byte $B6 ; |X XX XX | $D75D
    .byte $B6 ; |X XX XX | $D75E
    .byte $B6 ; |X XX XX | $D75F
    .byte $B6 ; |X XX XX | $D760
    .byte $B6 ; |X XX XX | $D761
    .byte $B6 ; |X XX XX | $D762
    .byte $B6 ; |X XX XX | $D763
    .byte $B6 ; |X XX XX | $D764
    .byte $B6 ; |X XX XX | $D765
    .byte $B6 ; |X XX XX | $D766
    .byte $B7 ; |X XX XXX| $D767
    .byte $B7 ; |X XX XXX| $D768
    .byte $B7 ; |X XX XXX| $D769
    .byte $B0 ; |X XX    | $D76A
    .byte $80 ; |X       | $D76B
    .byte $B0 ; |X XX    | $D76C
    .byte $B0 ; |X XX    | $D76D
    .byte $B0 ; |X XX    | $D76E
    .byte $80 ; |X       | $D76F
    .byte $80 ; |X       | $D770
    .byte $80 ; |X       | $D771
LogoFour:
    .byte $8A ; |X   X X | $D772
    .byte $8A ; |X   X X | $D773
    .byte $8A ; |X   X X | $D774
    .byte $8E ; |X   XXX | $D775
    .byte $8A ; |X   X X | $D776
    .byte $8A ; |X   X X | $D777
    .byte $8E ; |X   XXX | $D778
    .byte $00 ; |        | $D779
    .byte $00 ; |        | $D77A
    .byte $00 ; |        | $D77B
    .byte $00 ; |        | $D77C
    .byte $00 ; |        | $D77D
    .byte $00 ; |        | $D77E
    .byte $00 ; |        | $D77F
    .byte $C7 ; |XX   XXX| $D780
    .byte $EF ; |XXX XXXX| $D781
    .byte $EF ; |XXX XXXX| $D782
    .byte $6C ; | XX XX  | $D783
    .byte $6C ; | XX XX  | $D784
    .byte $6C ; | XX XX  | $D785
    .byte $6C ; | XX XX  | $D786
    .byte $6F ; | XX XXXX| $D787
    .byte $6F ; | XX XXXX| $D788
    .byte $6C ; | XX XX  | $D789
    .byte $6C ; | XX XX  | $D78A
    .byte $6C ; | XX XX  | $D78B
    .byte $6C ; | XX XX  | $D78C
    .byte $EF ; |XXX XXXX| $D78D
    .byte $EF ; |XXX XXXX| $D78E
    .byte $C7 ; |XX   XXX| $D78F
    .byte $00 ; |        | $D790
    .byte $00 ; |        | $D791
    .byte $00 ; |        | $D792
    .byte $00 ; |        | $D793
    .byte $00 ; |        | $D794
    .byte $00 ; |        | $D795
    .byte $00 ; |        | $D796
    .byte $00 ; |        | $D797
LogoFive:
    .byte $4A ; | X  X X | $D798
    .byte $4A ; | X  X X | $D799
    .byte $4A ; | X  X X | $D79A
    .byte $4E ; | X  XXX | $D79B
    .byte $4A ; | X  X X | $D79C
    .byte $4A ; | X  X X | $D79D
    .byte $EE ; |XXX XXX | $D79E
    .byte $00 ; |        | $D79F
    .byte $00 ; |        | $D7A0
    .byte $00 ; |        | $D7A1
    .byte $00 ; |        | $D7A2
    .byte $00 ; |        | $D7A3
    .byte $00 ; |        | $D7A4
    .byte $00 ; |        | $D7A5
    .byte $8F ; |X   XXXX| $D7A6
    .byte $9F ; |X  XXXXX| $D7A7
    .byte $99 ; |X  XX  X| $D7A8
    .byte $19 ; |   XX  X| $D7A9
    .byte $19 ; |   XX  X| $D7AA
    .byte $19 ; |   XX  X| $D7AB
    .byte $19 ; |   XX  X| $D7AC
    .byte $D9 ; |XX XX  X| $D7AD
    .byte $D9 ; |XX XX  X| $D7AE
    .byte $D9 ; |XX XX  X| $D7AF
    .byte $D9 ; |XX XX  X| $D7B0
    .byte $D9 ; |XX XX  X| $D7B1
    .byte $D9 ; |XX XX  X| $D7B2
    .byte $DF ; |XX XXXXX| $D7B3
    .byte $DF ; |XX XXXXX| $D7B4
    .byte $8F ; |X   XXXX| $D7B5
    .byte $01 ; |       X| $D7B6
    .byte $01 ; |       X| $D7B7
    .byte $01 ; |       X| $D7B8
    .byte $01 ; |       X| $D7B9
    .byte $01 ; |       X| $D7BA
    .byte $01 ; |       X| $D7BB
    .byte $01 ; |       X| $D7BC
    .byte $01 ; |       X| $D7BD
LogoSix:
    .byte $A8 ; |X X X   | $D7BE
    .byte $A8 ; |X X X   | $D7BF
    .byte $A8 ; |X X X   | $D7C0
    .byte $C8 ; |XX  X   | $D7C1
    .byte $A8 ; |X X X   | $D7C2
    .byte $A8 ; |X X X   | $D7C3
    .byte $C8 ; |XX  X   | $D7C4
    .byte $00 ; |        | $D7C5
    .byte $00 ; |        | $D7C6
    .byte $00 ; |        | $D7C7
    .byte $00 ; |        | $D7C8
    .byte $00 ; |        | $D7C9
    .byte $00 ; |        | $D7CA
    .byte $00 ; |        | $D7CB
    .byte $9E ; |X  XXXX | $D7CC
    .byte $BE ; |X XXXXX | $D7CD
    .byte $BE ; |X XXXXX | $D7CE
    .byte $B0 ; |X XX    | $D7CF
    .byte $B0 ; |X XX    | $D7D0
    .byte $B0 ; |X XX    | $D7D1
    .byte $B0 ; |X XX    | $D7D2
    .byte $BF ; |X XXXXXX| $D7D3
    .byte $BF ; |X XXXXXX| $D7D4
    .byte $B3 ; |X XX  XX| $D7D5
    .byte $B3 ; |X XX  XX| $D7D6
    .byte $B3 ; |X XX  XX| $D7D7
    .byte $B3 ; |X XX  XX| $D7D8
    .byte $BF ; |X XXXXXX| $D7D9
    .byte $BF ; |X XXXXXX| $D7DA
    .byte $9E ; |X  XXXX | $D7DB
    .byte $80 ; |X       | $D7DC
    .byte $80 ; |X       | $D7DD
    .byte $80 ; |X       | $D7DE
    .byte $80 ; |X       | $D7DF
    .byte $80 ; |X       | $D7E0
    .byte $80 ; |X       | $D7E1
    .byte $80 ; |X       | $D7E2
    .byte $80 ; |X       | $D7E3

    .byte $00 ; |        | $D7E4   free bytes
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

LD800:
    lda    $F7                   ; 3
    bne    LD808                 ; 2³
    bit    $B3                   ; 3
    bpl    LD80B                 ; 2³
LD808:
    jmp    LDFE4                 ; 3   bankswitch, goto LF301

LD80B:
    ldx    #4                    ; 2
    lda    #$D9                  ; 2   high nibble
    sta    $F0                   ; 3
    bit    $B8                   ; 3
    bpl    LD817                 ; 2³
    ldx    #$0D                  ; 2
LD817:
    lda    INTIM                 ; 4
    cmp    #$83                  ; 2
    bpl    LD821                 ; 2³
    jmp    LDFE4                 ; 3   bankswitch, goto LF301

LD821:
    ldy    SC_18|READ,X          ; 4
    bne    LD82C                 ; 2³
LD826:
    dex                          ; 2
    bpl    LD817                 ; 2³
    jmp    LDFE4                 ; 3   bankswitch, goto LF301

LD82C:
    lda    SC_2B|READ,X          ; 4
    stx    $F7                   ; 3
    tax                          ; 2
    lda    LDCCD,X               ; 4
    sta    $EF                   ; 3
    ldx    $F7                   ; 3
    jmp.ind ($00EF)              ; 5   $D9xx

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;       XXXX  XX   XXXX  XXXX      XXX  XX X XXXX XXXX
;      XXXXX XXXX XXXXXX XXXX     XXXXX XX X XXXX XXXXX
;      XX    XX X XX X X XX       XX  X XX X XX   XX  X
;      XX    XX X XX X X XX       XX  X XX X XX   XX  X
;      XX XX XXXX XX X X XXXX     XX  X XX X XXXX XXXXX
;      XX  X XX X XX X X XX       XX  X XX X XX   XXXX
;      XX  X XX X XX X X XX       XX  X XX X XX   XX XX
;      XX  X XX X XX X X XX       XX  X XX X XX   XX  X
;      XX  X XX X XX X X XX       XX  X XX X XX   XX  X
;      XXXXX XX X XX X X XX       XX  X XXXX XX   XX  X
;      XXXXX XX X XX X X XXXX     XXXXX  XX  XXXX XX  X
;       XXX  XX X XX X X XXXX      XXX   XX  XXXX XX  X
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GameOverOne:
    .byte $00 ; |        | $D83C
    .byte $00 ; |        | $D83D
    .byte $73 ; | XXX  XX| $D83E
    .byte $FB ; |XXXXX XX| $D83F
    .byte $FB ; |XXXXX XX| $D840
    .byte $CB ; |XX  X XX| $D841
    .byte $CB ; |XX  X XX| $D842
    .byte $CB ; |XX  X XX| $D843
    .byte $CB ; |XX  X XX| $D844
    .byte $DB ; |XX XX XX| $D845
    .byte $C3 ; |XX    XX| $D846
    .byte $C3 ; |XX    XX| $D847
    .byte $FB ; |XXXXX XX| $D848
    .byte $79 ; | XXXX  X| $D849
    .byte $00 ; |        | $D84A
    .byte $00 ; |        | $D84B
GameOverTwo:
    .byte $00 ; |        | $D84C
    .byte $00 ; |        | $D84D
    .byte $5A ; | X XX X | $D84E
    .byte $5A ; | X XX X | $D84F
    .byte $5A ; | X XX X | $D850
    .byte $5A ; | X XX X | $D851
    .byte $5A ; | X XX X | $D852
    .byte $5A ; | X XX X | $D853
    .byte $5A ; | X XX X | $D854
    .byte $DA ; |XX XX X | $D855
    .byte $5A ; | X XX X | $D856
    .byte $5A ; | X XX X | $D857
    .byte $DF ; |XX XXXXX| $D858
    .byte $8F ; |X   XXXX| $D859
    .byte $00 ; |        | $D85A
    .byte $00 ; |        | $D85B
GameOverThree:
    .byte $00 ; |        | $D85C
    .byte $00 ; |        | $D85D
    .byte $BC ; |X XXXX  | $D85E
    .byte $BC ; |X XXXX  | $D85F
    .byte $B0 ; |X XX    | $D860
    .byte $B0 ; |X XX    | $D861
    .byte $B0 ; |X XX    | $D862
    .byte $B0 ; |X XX    | $D863
    .byte $B0 ; |X XX    | $D864
    .byte $BC ; |X XXXX  | $D865
    .byte $B0 ; |X XX    | $D866
    .byte $B0 ; |X XX    | $D867
    .byte $BC ; |X XXXX  | $D868
    .byte $3C ; |  XXXX  | $D869
    .byte $00 ; |        | $D86A
    .byte $00 ; |        | $D86B
GameOverFour:
    .byte $00 ; |        | $D86C
    .byte $00 ; |        | $D86D
    .byte $0E ; |    XXX | $D86E
    .byte $1F ; |   XXXXX| $D86F
    .byte $19 ; |   XX  X| $D870
    .byte $19 ; |   XX  X| $D871
    .byte $19 ; |   XX  X| $D872
    .byte $19 ; |   XX  X| $D873
    .byte $19 ; |   XX  X| $D874
    .byte $19 ; |   XX  X| $D875
    .byte $19 ; |   XX  X| $D876
    .byte $19 ; |   XX  X| $D877
    .byte $1F ; |   XXXXX| $D878
    .byte $0E ; |    XXX | $D879
    .byte $00 ; |        | $D87A
    .byte $00 ; |        | $D87B
GameOverFive:
    .byte $00 ; |        | $D87C
    .byte $00 ; |        | $D87D
    .byte $33 ; |  XX  XX| $D87E
    .byte $33 ; |  XX  XX| $D87F
    .byte $7B ; | XXXX XX| $D880
    .byte $6B ; | XX X XX| $D881
    .byte $6B ; | XX X XX| $D882
    .byte $6B ; | XX X XX| $D883
    .byte $6B ; | XX X XX| $D884
    .byte $6B ; | XX X XX| $D885
    .byte $6B ; | XX X XX| $D886
    .byte $6B ; | XX X XX| $D887
    .byte $6B ; | XX X XX| $D888
    .byte $6B ; | XX X XX| $D889
    .byte $00 ; |        | $D88A
    .byte $00 ; |        | $D88B
GameOverSix:
    .byte $00 ; |        | $D88C
    .byte $00 ; |        | $D88D
    .byte $D9 ; |XX XX  X| $D88E
    .byte $D9 ; |XX XX  X| $D88F
    .byte $19 ; |   XX  X| $D890
    .byte $19 ; |   XX  X| $D891
    .byte $19 ; |   XX  X| $D892
    .byte $1B ; |   XX XX| $D893
    .byte $1E ; |   XXXX | $D894
    .byte $DF ; |XX XXXXX| $D895
    .byte $19 ; |   XX  X| $D896
    .byte $19 ; |   XX  X| $D897
    .byte $DF ; |XX XXXXX| $D898
    .byte $DE ; |XX XXXX | $D899
    .byte $00 ; |        | $D89A
    .byte $00 ; |        | $D89B

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;                XXX  XXX  X    XXX  XXX  XXX
;                X    X    X    X    X     X
;                X    X    X    X    X     X
;                XXX  XXX  X    XXX  X     X
;                  X  X    X    X    X     X
;                  X  X    X    X    X     X
;                XXX  XXX  XXX  XXX  XXX   X
;
;
;      XX XXX XXX XXX XXX X X  X XXX   XX XX XXX XXX XX
;      X   X  X X X X  X  X XX X X     X  X  X X X X X
;      X   X  X X X X  X  X XXXX X     X  X  X X X X X
;      XX  X  XXX XXX  X  X X XX XXX   XX X  X X XXX XX
;       X  X  X X XX   X  X X  X X X    X X  X X XX  X
;       X  X  X X X X  X  X X  X X X    X X  X X X X X
;      XX  X  X X X X  X  X X  X XXX   XX XX XXX X X XX
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


SelectScoreOne:
    .byte $C9 ; |XX  X  X| $D89C
    .byte $49 ; | X  X  X| $D89D
    .byte $49 ; | X  X  X| $D89E
    .byte $C9 ; |XX  X  X| $D89F
    .byte $89 ; |X   X  X| $D8A0
    .byte $89 ; |X   X  X| $D8A1
    .byte $DD ; |XX XXX X| $D8A2
    .byte $00 ; |        | $D8A3
    .byte $00 ; |        | $D8A4
    .byte $00 ; |        | $D8A5
    .byte $00 ; |        | $D8A6
    .byte $00 ; |        | $D8A7
    .byte $00 ; |        | $D8A8
    .byte $00 ; |        | $D8A9
    .byte $00 ; |        | $D8AA
    .byte $00 ; |        | $D8AB
SelectScoreTwo:
    .byte $54 ; | X X X  | $D8AC
    .byte $54 ; | X X X  | $D8AD
    .byte $58 ; | X XX   | $D8AE
    .byte $DC ; |XX XXX  | $D8AF
    .byte $54 ; | X X X  | $D8B0
    .byte $54 ; | X X X  | $D8B1
    .byte $DD ; |XX XXX X| $D8B2
    .byte $00 ; |        | $D8B3
    .byte $00 ; |        | $D8B4
    .byte $39 ; |  XXX  X| $D8B5
    .byte $09 ; |    X  X| $D8B6
    .byte $09 ; |    X  X| $D8B7
    .byte $39 ; |  XXX  X| $D8B8
    .byte $21 ; |  X    X| $D8B9
    .byte $21 ; |  X    X| $D8BA
    .byte $39 ; |  XXX  X| $D8BB
SelectScoreThree:
    .byte $94 ; |X  X X  | $D8BC
    .byte $94 ; |X  X X  | $D8BD
    .byte $94 ; |X  X X  | $D8BE
    .byte $95 ; |X  X X X| $D8BF
    .byte $97 ; |X  X XXX| $D8C0
    .byte $96 ; |X  X XX | $D8C1
    .byte $D4 ; |XX X X  | $D8C2
    .byte $00 ; |        | $D8C3
    .byte $00 ; |        | $D8C4
    .byte $CE ; |XX  XXX | $D8C5
    .byte $08 ; |    X   | $D8C6
    .byte $08 ; |    X   | $D8C7
    .byte $C8 ; |XX  X   | $D8C8
    .byte $08 ; |    X   | $D8C9
    .byte $08 ; |    X   | $D8CA
    .byte $C8 ; |XX  X   | $D8CB
SelectScoreFour:
    .byte $B8 ; |X XXX   | $D8CC
    .byte $A8 ; |X X X   | $D8CD
    .byte $A8 ; |X X X   | $D8CE
    .byte $B8 ; |X XXX   | $D8CF
    .byte $A0 ; |X X     | $D8D0
    .byte $A0 ; |X X     | $D8D1
    .byte $B8 ; |X XXX   | $D8D2
    .byte $00 ; |        | $D8D3
    .byte $00 ; |        | $D8D4
    .byte $73 ; | XXX  XX| $D8D5
    .byte $42 ; | X    X | $D8D6
    .byte $42 ; | X    X | $D8D7
    .byte $72 ; | XXX  X | $D8D8
    .byte $42 ; | X    X | $D8D9
    .byte $42 ; | X    X | $D8DA
    .byte $73 ; | XXX  XX| $D8DB
SelectScoreFive:
    .byte $DB ; |XX XX XX| $D8DC
    .byte $52 ; | X X  X | $D8DD
    .byte $52 ; | X X  X | $D8DE
    .byte $D2 ; |XX X  X | $D8DF
    .byte $92 ; |X  X  X | $D8E0
    .byte $92 ; |X  X  X | $D8E1
    .byte $DB ; |XX XX XX| $D8E2
    .byte $00 ; |        | $D8E3
    .byte $00 ; |        | $D8E4
    .byte $88 ; |X   X   | $D8E5
    .byte $08 ; |    X   | $D8E6
    .byte $08 ; |    X   | $D8E7
    .byte $08 ; |    X   | $D8E8
    .byte $08 ; |    X   | $D8E9
    .byte $08 ; |    X   | $D8EA
    .byte $9C ; |X  XXX  | $D8EB
SelectScoreSix:
    .byte $AB ; |X X X XX| $D8EC
    .byte $AA ; |X X X X | $D8ED
    .byte $B2 ; |X XX  X | $D8EE
    .byte $BB ; |X XXX XX| $D8EF
    .byte $AA ; |X X X X | $D8F0
    .byte $AA ; |X X X X | $D8F1
    .byte $BB ; |X XXX XX| $D8F2
    .byte $00 ; |        | $D8F3
    .byte $00 ; |        | $D8F4
    .byte $00 ; |        | $D8F5
    .byte $00 ; |        | $D8F6
    .byte $00 ; |        | $D8F7
    .byte $00 ; |        | $D8F8
    .byte $00 ; |        | $D8F9
    .byte $00 ; |        | $D8FA
    .byte $00 ; |        | $D8FB

    .byte $00 ; |        | $D8FC   free bytes
    .byte $00 ; |        | $D8FD
    .byte $00 ; |        | $D8FE
    .byte $00 ; |        | $D8FF

LD900:  ; indirect jump
    jmp    LDB3C                 ; 3

LD903:  ; indirect jump
    jmp    LDC49                 ; 3

LD906:  ; indirect jump
    tya                          ; 2
    asl                          ; 2
    lda    #3                    ; 2
    bcc    LD90E                 ; 2³
    lda    #1                    ; 2
LD90E:
    and    $80                   ; 3
    bne    LD93F                 ; 2³
    lda    SC_2B|READ,X          ; 4
    lsr                          ; 2
    ldy    SC_05|READ,X          ; 4
    bcc    LD935                 ; 2³
    dey                          ; 2
    dey                          ; 2
    bpl    LD93B                 ; 2³
LD91F:
    lda    SC_18|READ,X          ; 4
    and    #$1F                  ; 2
    clc                          ; 2
    adc    $9C                   ; 3
    tay                          ; 2
    lda    #$80                  ; 2
    sta.wy $9C,Y                 ; 5
    lda    #0                    ; 2
    sta    SC_18,X               ; 5
    jmp    LDCB3                 ; 3

LD935:
    iny                          ; 2
    iny                          ; 2
    cpy    #$7D                  ; 2
    bcs    LD91F                 ; 2³
LD93B:
    tya                          ; 2
    sta    SC_05,X               ; 5
LD93F:
    jmp    LD826                 ; 3

LD942:  ; indirect jump
    jmp    LDB09                 ; 3

LD945:  ; indirect jump
    txa                          ; 2
    and    #$07                  ; 2
    sta    $F8                   ; 3
    lda    $80                   ; 3
    and    #$07                  ; 2
    cmp    $F8                   ; 3
    bne    LD9AD                 ; 2³
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    SC_05|READ,X          ; 4
    clc                          ; 2
    adc    LDC23,Y               ; 4
    sta    SC_05,X               ; 5
    lda    SC_18|READ,X          ; 4
    clc                          ; 2
    adc    #$1F                  ; 2
    sta    SC_18,X               ; 5
    and    #$1F                  ; 2
    bne    LD97F                 ; 2³
    sta    SC_18,X               ; 5
    bit    $B8                   ; 3
    bpl    LD97C                 ; 2³
    dec    $D3                   ; 5
    jmp    LD826                 ; 3

LD97C:
    jmp    LDCB3                 ; 3

LD97F:
    jmp    LDC7A                 ; 3

LD982:  ; indirect jump
    tya                          ; 2
    bpl    LD98E                 ; 2³
    txa                          ; 2
    and    #$03                  ; 2
    sta    $F8                   ; 3
    lda    #3                    ; 2
    bne    LD995                 ; 3   always branch

LD98E:
    txa                          ; 2
    and    #$07                  ; 2
    sta    $F8                   ; 3
    lda    #7                    ; 2
LD995:
    and    $80                   ; 3
    cmp    $F8                   ; 3
    bne    LD9D2                 ; 2³
    dey                          ; 2
    tya                          ; 2
    sta    SC_18,X               ; 5
    and    #$1F                  ; 2
    bne    LD9B3                 ; 2³
    sta    SC_18,X               ; 5
    bit    $B8                   ; 3
    bpl    LD9B0                 ; 2³
    dec    $D3                   ; 5
LD9AD:  ; indirect jump (also)
    jmp    LD826                 ; 3

LD9B0:
    jmp    LDCB3                 ; 3

LD9B3:
    lda    SC_2B|READ,X          ; 4
    tay                          ; 2
    lsr                          ; 2
    lda    SC_05|READ,X          ; 4
    bcc    LD9CB                 ; 2³
    adc    #7                    ; 2
    cmp    #$7D                  ; 2
    bcc    LD9CF                 ; 2³
LD9C3:
    tya                          ; 2
    eor    #$01                  ; 2
    sta    SC_2B,X               ; 5
    bpl    LD9D2                 ; 2³
LD9CB:
    sbc    #7                    ; 2
    bmi    LD9C3                 ; 2³
LD9CF:
    sta    SC_05,X               ; 5
LD9D2:
    jmp    LD826                 ; 3

LD9D5:  ; indirect jump
    lda    $80                   ; 3
    and    #$07                  ; 2
    cmp    #7                    ; 2
    bne    LD9AD                 ; 2³
    tya                          ; 2
    clc                          ; 2
    adc    #$20                  ; 2
    sta    SC_18,X               ; 5
    bcc    LD9AD                 ; 2³
    bit    $B8                   ; 3
    bpl    LD9F2                 ; 2³
    lda    #0                    ; 2
    sta    SC_18,X               ; 5
    jmp    LD826                 ; 3

LD9F2:
    jmp    LDAE9                 ; 3

LD9F5:  ; indirect jump
    lda    $80                   ; 3
    and    #$07                  ; 2
    cmp    $F7                   ; 3
    beq    LD9AD                 ; 2³
    cmp    LDC3A,X               ; 4
    beq    LD9AD                 ; 2³+1
    lsr                          ; 2
    lda    $E0                   ; 3
    bne    LDA09                 ; 2³
    bcs    LD9AD                 ; 2³+1
LDA09:
    lda    SC_05|READ,X          ; 4
    beq    LDA85                 ; 2³
    cmp    #$79                  ; 2
    beq    LDA85                 ; 2³
    tya                          ; 2
    asl                          ; 2
    and    #$40                  ; 2
    beq    LDA25                 ; 2³
    lda    #1                    ; 2
    bcs    LDA1E                 ; 2³
    lda    #$FF                  ; 2
LDA1E:
    clc                          ; 2
    adc    SC_05|READ,X          ; 4
    sta    SC_05,X               ; 5
LDA25:
    lda    $80                   ; 3
    and    #$07                  ; 2
    cmp    LDC30,X               ; 4
    bne    LDA96                 ; 2³
    ldy    #$0A                  ; 2
    lda    $E0                   ; 3
    cmp    #3                    ; 2
    bcc    LDA3E                 ; 2³
    dey                          ; 2
    dey                          ; 2
    cmp    #$10                  ; 2
    bcc    LDA3E                 ; 2³
    dey                          ; 2
    dey                          ; 2
LDA3E:
    sty    $F7                   ; 3
    ldy    SC_18|READ,X          ; 4
    tya                          ; 2
    and    #$1F                  ; 2
    cmp    #1                    ; 2
    beq    LDA7F                 ; 2³
    cmp    $F7                   ; 3
    bcs    LDA7A                 ; 2³
    lda    $84                   ; 3
    and    LDC44,X               ; 4
    bne    LDA6B                 ; 2³
    tya                          ; 2
    eor    #$40                  ; 2
LDA58:
    and    #$DF                  ; 2
    sta    $F7                   ; 3
    lda    $85                   ; 3
    and    LDC3F,X               ; 4
    beq    LDA65                 ; 2³
    lda    #$20                  ; 2
LDA65:
    ora    $F7                   ; 3
    sta    SC_18,X               ; 5
    tay                          ; 2
LDA6B:
    tya                          ; 2
    iny                          ; 2
    and    #$40                  ; 2
    beq    LDA73                 ; 2³
    dey                          ; 2
    dey                          ; 2
LDA73:
    tya                          ; 2
    sta    SC_18,X               ; 5
    jmp    LD826                 ; 3

LDA7A:
    tya                          ; 2
    ora    #$40                  ; 2
    bne    LDA58                 ; 3   always branch

LDA7F:
    tya                          ; 2
    and    #$BF                  ; 2
    jmp    LDA58                 ; 3

LDA85:
    lda    $BA                   ; 3
    cmp    #$88                  ; 2
    bcc    LDA93                 ; 2³
    cmp    #$C0                  ; 2
    bcs    LDA93                 ; 2³
    lda    #0                    ; 2
    sta    $BA                   ; 3
LDA93:
    jmp    LDAE9                 ; 3

LDA96:
    cmp    LDC2B,X               ; 4
    beq    LDA9E                 ; 2³
LDA9B:
    jmp    LD826                 ; 3

LDA9E:
    lda    SC_18|READ,X          ; 4
    and    #$1F                  ; 2
    clc                          ; 2
    adc    $9C                   ; 3
    sta    $F8                   ; 3
    cmp    #2                    ; 2
    bcc    LDA9B                 ; 2³
    lda    SC_05|READ,X          ; 4
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    eor    $F8                   ; 3
    lsr                          ; 2
    bcc    LDAB8                 ; 2³
    iny                          ; 2
LDAB8:
    lda    $F8                   ; 3
    cpy    #$10                  ; 2
    bcc    LDAC0                 ; 2³
    adc    #$13                  ; 2
LDAC0:
    tax                          ; 2
    lsr                          ; 2
    tya                          ; 2
    and    #$FE                  ; 2
    bcs    LDAC9                 ; 2³
    adc    #$1F                  ; 2
LDAC9:
    tay                          ; 2
    iny                          ; 2
    cmp    #$3F                  ; 2
    bmi    LDAD1                 ; 2³
    ldy    #$3F                  ; 2
LDAD1:
    lda    LDD38,Y               ; 4
    eor    #$FF                  ; 2
    tay                          ; 2
    and    SC_56|READ,X          ; 4
    sta    SC_56,X               ; 5
    tya                          ; 2
    and    SC_37|READ,X          ; 4
    sta    SC_37,X               ; 5
    ldx    $F7                   ; 3
    jmp    LD826                 ; 3

LDAE9:
    lda    $B2                   ; 3
    beq    LDAF3                 ; 2³
    lda    #0                    ; 2
    cpx    #3                    ; 2
    bcc    LDAF5                 ; 2³
LDAF3:
    lda    #7                    ; 2
LDAF5:
    sta    SC_2B,X               ; 5
    lda    #0                    ; 2
    sta    SC_18,X               ; 5
    lda    $84                   ; 3
    and    #$0F                  ; 2
    ora    #$01                  ; 2
    sta    SC_05,X               ; 5
    jmp    LD826                 ; 3

LDB09:
    tya                          ; 2
    asl                          ; 2
    lda    #3                    ; 2
    bcc    LDB11                 ; 2³
    lda    #1                    ; 2
LDB11:
    and    $80                   ; 3
    bne    LDB39                 ; 2³
    tya                          ; 2
    ldy    SC_05|READ,X          ; 4
    and    #$40                  ; 2
    bne    LDB31                 ; 2³
    iny                          ; 2
    iny                          ; 2
    cpy    #$7D                  ; 2
    bcc    LDB35                 ; 2³
LDB23:
    lda    #0                    ; 2
    sta    SC_18,X               ; 5
    lda    $83                   ; 3
    ora    #$0F                  ; 2
    sta    $83                   ; 3
    jmp    LDCB3                 ; 3

LDB31:
    dey                          ; 2
    dey                          ; 2
    bmi    LDB23                 ; 2³
LDB35:
    tya                          ; 2
    sta    SC_05,X               ; 5
LDB39:
    jmp    LD826                 ; 3

LDB3C:
    lda    #7                    ; 2
    and    $80                   ; 3
    cmp    $F7                   ; 3
    beq    LDB4C                 ; 2³
    cmp    LDC35,X               ; 4
    beq    LDB4C                 ; 2³
    jmp    LD826                 ; 3

LDB4C:
    tya                          ; 2
    bpl    LDBAB                 ; 2³
    cmp    #$81                  ; 2
    beq    LDB74                 ; 2³
    lda    SC_2B|READ,X          ; 4
    lsr                          ; 2
    lda    SC_05|READ,X          ; 4
    bcs    LDB63                 ; 2³
    adc    #2                    ; 2
    cmp    #$7E                  ; 2
    jmp    LDB67                 ; 3

LDB63:
    sbc    #2                    ; 2
    cmp    #$F0                  ; 2
LDB67:
    sta    SC_05,X               ; 5
    bcc    LDBE3                 ; 2³
    lda    #0                    ; 2
    sta    SC_18,X               ; 5
    jmp    LDCB3                 ; 3

LDB74:
    lda    SC_2B|READ,X          ; 4
    lsr                          ; 2
    lda    SC_05|READ,X          ; 4
    bcs    LDB8C                 ; 2³
    adc    #2                    ; 2
    cmp    #$6F                  ; 2
    sta    SC_05,X               ; 5
    bcs    LDBA3                 ; 2³
    cmp    #$40                  ; 2
    bcs    LDB99                 ; 2³
    bcc    LDBA8                 ; 3   always branch

LDB8C:
    sbc    #2                    ; 2
    cmp    #9                    ; 2
    sta    SC_05,X               ; 5
    bcc    LDBA3                 ; 2³
    cmp    #$3C                  ; 2
    bcs    LDBA8                 ; 2³
LDB99:
    and    #$02                  ; 2
    bne    LDBA8                 ; 2³
    lda    $84                   ; 3
    cmp    #$20                  ; 2
    bcs    LDBA8                 ; 2³
LDBA3:
    lda    #$41                  ; 2
    sta    SC_18,X               ; 5
LDBA8:
    jmp    LD826                 ; 3

LDBAB:
    lda    $80                   ; 3
    lsr                          ; 2
    bcc    LDBA8                 ; 2³
    and    #$04                  ; 2
    bne    LDBA8                 ; 2³
    tya                          ; 2
    and    #$40                  ; 2
    bne    LDBCA                 ; 2³
    tya                          ; 2
    sec                          ; 2
    sbc    #1                    ; 2
    cmp    #1                    ; 2
    bne    LDBC3                 ; 2³
    lda    #$81                  ; 2
LDBC3:
    sta    SC_18,X               ; 5
    bmi    LDBA8                 ; 2³
    bne    LDBE3                 ; 2³
LDBCA:
    tya                          ; 2
    clc                          ; 2
    adc    #1                    ; 2
    cmp    #$48                  ; 2
    bcc    LDBE0                 ; 2³
    cmp    #$4B                  ; 2
    bcs    LDBDC                 ; 2³
    ldy    #$40                  ; 2
    cpy    $85                   ; 3
    bcc    LDBE0                 ; 2³
LDBDC:
    and    #$BF                  ; 2
    ora    #$80                  ; 2
LDBE0:
    sta    SC_18,X               ; 5
LDBE3:
    lda    SC_18|READ,X          ; 4
    and    #$1F                  ; 2
    clc                          ; 2
    adc    $9C                   ; 3
    sta    $F8                   ; 3
    lda    SC_05|READ,X          ; 4
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    eor    $F8                   ; 3
    lsr                          ; 2
    bcc    LDBF9                 ; 2³
    iny                          ; 2
LDBF9:
    lda    $F8                   ; 3
    cpy    #$10                  ; 2
    bcc    LDC01                 ; 2³+1
    adc    #$13                  ; 2
LDC01:
    tax                          ; 2
    lsr                          ; 2
    tya                          ; 2
    and    #$FE                  ; 2
    bcs    LDC0A                 ; 2³
    adc    #$1F                  ; 2
LDC0A:
    tay                          ; 2
    iny                          ; 2
    cmp    #$3F                  ; 2
    bmi    LDC12                 ; 2³
    ldy    #$3F                  ; 2
LDC12:
    lda    SC_56|READ,X          ; 4
    and    LDD38,Y               ; 4
    ora    SC_37|READ,X          ; 4
    sta    SC_37,X               ; 5
    ldx    $F7                   ; 3
    jmp    LD826                 ; 3

LDC23:
    .byte $00 ; |        | $DC23
    .byte $05 ; |     X X| $DC24
    .byte $0A ; |    X X | $DC25
    .byte $05 ; |     X X| $DC26
    .byte $00 ; |        | $DC27
    .byte $FB ; |XXXXX XX| $DC28
    .byte $F6 ; |XXXX XX | $DC29
    .byte $FB ; |XXXXX XX| $DC2A
LDC2B:
    .byte $02 ; |      X | $DC2B
    .byte $02 ; |      X | $DC2C
    .byte $00 ; |        | $DC2D
    .byte $04 ; |     X  | $DC2E
    .byte $06 ; |     XX | $DC2F
LDC30:
    .byte $06 ; |     XX | $DC30
    .byte $06 ; |     XX | $DC31
    .byte $04 ; |     X  | $DC32
    .byte $00 ; |        | $DC33
    .byte $02 ; |      X | $DC34
LDC35:
    .byte $01 ; |       X| $DC35
    .byte $02 ; |      X | $DC36
    .byte $03 ; |      XX| $DC37
    .byte $00 ; |        | $DC38
    .byte $01 ; |       X| $DC39
LDC3A:
    .byte $03 ; |      XX| $DC3A
    .byte $04 ; |     X  | $DC3B
    .byte $05 ; |     X X| $DC3C
    .byte $06 ; |     XX | $DC3D
    .byte $07 ; |     XXX| $DC3E
LDC3F:
    .byte $01 ; |       X| $DC3F
    .byte $02 ; |      X | $DC40
    .byte $04 ; |     X  | $DC41
    .byte $08 ; |    X   | $DC42
    .byte $10 ; |   X    | $DC43
LDC44:
    .byte $AE ; |X X XXX | $DC44
    .byte $3B ; |  XXX XX| $DC45
    .byte $F8 ; |XXXXX   | $DC46
    .byte $75 ; | XXX X X| $DC47
    .byte $9E ; |X  XXXX | $DC48

LDC49:
    tya                          ; 2
    bpl    LDC55                 ; 2³
    txa                          ; 2
    and    #$01                  ; 2
    sta    $F8                   ; 3
    lda    #1                    ; 2
    bne    LDC5C                 ; 3   always branch

LDC55:
    txa                          ; 2
    and    #$03                  ; 2
    sta    $F8                   ; 3
    lda    #3                    ; 2
LDC5C:
    and    $80                   ; 3
    cmp    $F8                   ; 3
    bne    LDCAE                 ; 2³
    dey                          ; 2
    tya                          ; 2
    sta    SC_18,X               ; 5
    and    #$1F                  ; 2
    bne    LDC7A                 ; 2³
    sta    SC_18,X               ; 5
    bit    $B8                   ; 3
    bpl    LDC77                 ; 2³
    dec    $D3                   ; 5
    jmp    LD826                 ; 3

LDC77:
    jmp    LDCB3                 ; 3

LDC7A:
    cmp    #2                    ; 2
    bcc    LDCAE                 ; 2³
    ldy    #$E0                  ; 2
    bit    $B8                   ; 3
    bpl    LDC86                 ; 2³
    ldy    #$20                  ; 2
LDC86:
    cpy    $85                   ; 3
    bcc    LDCAE                 ; 2³
    clc                          ; 2
    adc    $9C                   ; 3
    sta    $F8                   ; 3
    lda    SC_05|READ,X          ; 4
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    $F8                   ; 3
    cpy    #$10                  ; 2
    bcc    LDC9D                 ; 2³
    adc    #$13                  ; 2
LDC9D:
    tax                          ; 2
    lsr                          ; 2
    tya                          ; 2
    bcs    LDCA4                 ; 2³
    adc    #$20                  ; 2
LDCA4:
    tay                          ; 2
    lda    SC_56|READ,X          ; 4
    ora    LDD38,Y               ; 4
    sta    SC_56,X               ; 5
LDCAE:
    ldx    $F7                   ; 3
    jmp    LD826                 ; 3

LDCB3:
    ldy    SC_2B|READ,X          ; 4
    cpy    #$1C                  ; 2
    bcs    LDCCA                 ; 2³
    lda    $BA                   ; 3
    cmp    LDD00,Y               ; 4
    bcc    LDCCA                 ; 2³
    cmp    LDD1C,Y               ; 4
    bcs    LDCCA                 ; 2³
    lda    #0                    ; 2
    sta    $BA                   ; 3
LDCCA:
    jmp    LD826                 ; 3

LDCCD:  ; indirect jump table
    .byte <LD9AD         ; $DCCD
    .byte <LD903         ; $DCCE
    .byte <LD903         ; $DCCF
    .byte <LD906         ; $DCD0
    .byte <LD906         ; $DCD1
    .byte <LD906         ; $DCD2
    .byte <LD906         ; $DCD3
    .byte <LD9F5         ; $DCD4
    .byte <LD9F5         ; $DCD5
    .byte <LD9F5         ; $DCD6
    .byte <LD982         ; $DCD7
    .byte <LD982         ; $DCD8
    .byte <LD982         ; $DCD9
    .byte <LD982         ; $DCDA
    .byte <LD945         ; $DCDB
    .byte <LD945         ; $DCDC
    .byte <LD945         ; $DCDD
    .byte <LD942         ; $DCDE
    .byte <LD942         ; $DCDF
    .byte <LD942         ; $DCE0
    .byte <LD900         ; $DCE1
    .byte <LD900         ; $DCE2
    .byte <LD900         ; $DCE3
    .byte <LD900         ; $DCE4
    .byte <LD900         ; $DCE5
    .byte <LD900         ; $DCE6
    .byte <LD900         ; $DCE7
    .byte <LD900         ; $DCE8
    .byte <LD9AD         ; $DCE9
    .byte <LD9AD         ; $DCEA
    .byte <LD9AD         ; $DCEB
    .byte <LD9AD         ; $DCEC
    .byte <LD9AD         ; $DCED
    .byte <LD9AD         ; $DCEE
    .byte <LD9AD         ; $DCEF
    .byte <LD9AD         ; $DCF0
    .byte <LD9D5         ; $DCF1
    .byte <LD9D5         ; $DCF2
    .byte <LD9D5         ; $DCF3
    .byte <LD9D5         ; $DCF4
    .byte <LD9D5         ; $DCF5
    .byte <LD9D5         ; $DCF6
    .byte <LD9D5         ; $DCF7
    .byte <LD9D5         ; $DCF8
    .byte <LD9D5         ; $DCF9
    .byte <LD9D5         ; $DCFA
    .byte <LD9D5         ; $DCFB
    .byte $00 ; |        | $DCFC   free bytes or <LD900?
    .byte $00 ; |        | $DCFD
    .byte $00 ; |        | $DCFE
    .byte $00 ; |        | $DCFF
LDD00:
    .byte $FF ; |XXXXXXXX| $DD00
    .byte $D4 ; |XX X X  | $DD01
    .byte $D4 ; |XX X X  | $DD02
    .byte $25 ; |  X  X X| $DD03
    .byte $25 ; |  X  X X| $DD04
    .byte $25 ; |  X  X X| $DD05
    .byte $25 ; |  X  X X| $DD06
    .byte $88 ; |X   X   | $DD07
    .byte $88 ; |X   X   | $DD08
    .byte $88 ; |X   X   | $DD09
    .byte $C0 ; |XX      | $DD0A
    .byte $C0 ; |XX      | $DD0B
    .byte $C0 ; |XX      | $DD0C
    .byte $C0 ; |XX      | $DD0D
    .byte $3E ; |  XXXXX | $DD0E
    .byte $3E ; |  XXXXX | $DD0F
    .byte $3E ; |  XXXXX | $DD10
    .byte $65 ; | XX  X X| $DD11
    .byte $65 ; | XX  X X| $DD12
    .byte $65 ; | XX  X X| $DD13
    .byte $5D ; | X XXX X| $DD14
    .byte $5D ; | X XXX X| $DD15
    .byte $5D ; | X XXX X| $DD16
    .byte $5D ; | X XXX X| $DD17
    .byte $5D ; | X XXX X| $DD18
    .byte $5D ; | X XXX X| $DD19
    .byte $5D ; | X XXX X| $DD1A
    .byte $5D ; | X XXX X| $DD1B
LDD1C:
    .byte $00 ; |        | $DD1C
    .byte $FB ; |XXXXX XX| $DD1D
    .byte $FB ; |XXXXX XX| $DD1E
    .byte $3E ; |  XXXXX | $DD1F
    .byte $3E ; |  XXXXX | $DD20
    .byte $3E ; |  XXXXX | $DD21
    .byte $3E ; |  XXXXX | $DD22
    .byte $C0 ; |XX      | $DD23
    .byte $C0 ; |XX      | $DD24
    .byte $C0 ; |XX      | $DD25
    .byte $D4 ; |XX X X  | $DD26
    .byte $D4 ; |XX X X  | $DD27
    .byte $D4 ; |XX X X  | $DD28
    .byte $D4 ; |XX X X  | $DD29
    .byte $5D ; | X XXX X| $DD2A
    .byte $5D ; | X XXX X| $DD2B
    .byte $5D ; | X XXX X| $DD2C
    .byte $88 ; |X   X   | $DD2D
    .byte $88 ; |X   X   | $DD2E
    .byte $88 ; |X   X   | $DD2F
    .byte $65 ; | XX  X X| $DD30
    .byte $65 ; | XX  X X| $DD31
    .byte $65 ; | XX  X X| $DD32
    .byte $65 ; | XX  X X| $DD33
    .byte $65 ; | XX  X X| $DD34
    .byte $65 ; | XX  X X| $DD35
    .byte $65 ; | XX  X X| $DD36
    .byte $65 ; | XX  X X| $DD37
LDD38:
    .byte $00 ; |        | $DD38
    .byte $40 ; | X      | $DD39
    .byte $00 ; |        | $DD3A
    .byte $10 ; |   X    | $DD3B
    .byte $00 ; |        | $DD3C
    .byte $04 ; |     X  | $DD3D
    .byte $00 ; |        | $DD3E
    .byte $01 ; |       X| $DD3F
    .byte $00 ; |        | $DD40
    .byte $02 ; |      X | $DD41
    .byte $00 ; |        | $DD42
    .byte $08 ; |    X   | $DD43
    .byte $00 ; |        | $DD44
    .byte $20 ; |  X     | $DD45
    .byte $00 ; |        | $DD46
    .byte $80 ; |X       | $DD47
    .byte $00 ; |        | $DD48
    .byte $40 ; | X      | $DD49
    .byte $00 ; |        | $DD4A
    .byte $10 ; |   X    | $DD4B
    .byte $00 ; |        | $DD4C
    .byte $04 ; |     X  | $DD4D
    .byte $00 ; |        | $DD4E
    .byte $01 ; |       X| $DD4F
    .byte $00 ; |        | $DD50
    .byte $02 ; |      X | $DD51
    .byte $00 ; |        | $DD52
    .byte $08 ; |    X   | $DD53
    .byte $00 ; |        | $DD54
    .byte $20 ; |  X     | $DD55
    .byte $00 ; |        | $DD56
    .byte $80 ; |X       | $DD57
    .byte $80 ; |X       | $DD58
    .byte $00 ; |        | $DD59
    .byte $20 ; |  X     | $DD5A
    .byte $00 ; |        | $DD5B
    .byte $08 ; |    X   | $DD5C
    .byte $00 ; |        | $DD5D
    .byte $02 ; |      X | $DD5E
    .byte $00 ; |        | $DD5F
    .byte $01 ; |       X| $DD60
    .byte $00 ; |        | $DD61
    .byte $04 ; |     X  | $DD62
    .byte $00 ; |        | $DD63
    .byte $10 ; |   X    | $DD64
    .byte $00 ; |        | $DD65
    .byte $40 ; | X      | $DD66
    .byte $00 ; |        | $DD67
    .byte $80 ; |X       | $DD68
    .byte $00 ; |        | $DD69
    .byte $20 ; |  X     | $DD6A
    .byte $00 ; |        | $DD6B
    .byte $08 ; |    X   | $DD6C
    .byte $00 ; |        | $DD6D
    .byte $02 ; |      X | $DD6E
    .byte $00 ; |        | $DD6F
    .byte $01 ; |       X| $DD70
    .byte $00 ; |        | $DD71
    .byte $04 ; |     X  | $DD72
    .byte $00 ; |        | $DD73
    .byte $10 ; |   X    | $DD74
    .byte $00 ; |        | $DD75
    .byte $40 ; | X      | $DD76
    .byte $00 ; |        | $DD77
    .byte $20 ; |  X     | $DD78
    .byte $44 ; | X   X  | $DD79
    .byte $41 ; | X     X| $DD7A
    .byte $56 ; | X X XX | $DD7B
    .byte $45 ; | X   X X| $DD7C
    .byte $20 ; |  X     | $DD7D
    .byte $53 ; | X X  XX| $DD7E
    .byte $54 ; | X X X  | $DD7F
    .byte $41 ; | X     X| $DD80
    .byte $55 ; | X X X X| $DD81
    .byte $47 ; | X   XXX| $DD82
    .byte $41 ; | X     X| $DD83
    .byte $53 ; | X X  XX| $DD84
    .byte $20 ; |  X     | $DD85
    .byte $4C ; | X  XX  | $DD86
    .byte $4F ; | X  XXXX| $DD87
    .byte $56 ; | X X XX | $DD88
    .byte $45 ; | X   X X| $DD89
    .byte $53 ; | X X  XX| $DD8A
    .byte $20 ; |  X     | $DD8B
    .byte $42 ; | X    X | $DD8C
    .byte $45 ; | X   X X| $DD8D
    .byte $41 ; | X     X| $DD8E
    .byte $54 ; | X X X  | $DD8F
    .byte $52 ; | X X  X | $DD90
    .byte $49 ; | X  X  X| $DD91
    .byte $43 ; | X    XX| $DD92
    .byte $45 ; | X   X X| $DD93
    .byte $20 ; |  X     | $DD94
    .byte $48 ; | X  X   | $DD95
    .byte $41 ; | X     X| $DD96
    .byte $42 ; | X    X | $DD97
    .byte $4C ; | X  XX  | $DD98
    .byte $49 ; | X  X  X| $DD99
    .byte $47 ; | X   XXX| $DD9A
    .byte $20 ; |  X     | $DD9B
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

  REPEAT ($DFDE-*)                  ; 478 free bytes (and probably a lot more above)
    .byte 0
  REPEND

       ORG $4FDE
      RORG $DFDE

LDFDE:
    lda    BANK_0                ; 4   bankswitch, goto L991C

;coming from bank 0
    jmp    LD3E3                 ; 3

LDFE4:
    lda    BANK_3                ; 4   bankswitch, goto LF301

;coming from bank 1
    jmp    LD800                 ; 3

LDFEA:
    lda    BANK_1                ; 4   bankswitch, goto LB100

;coming from bank 0
    jmp    LD100                 ; 3

START_BANK_2:
    lda    BANK_3                ; 4   bankswitch, goto START
    jmp    START                 ; 3   space filler...

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

    SC_RAM_SPACE 256                ; $F000 - $F0FF super chip ram

START:
    cld                          ; 2
    sei                          ; 2
    ldx    #$FF                  ; 2
    txs                          ; 2
    inx                          ; 2
    txa                          ; 2
LF107:
    sta    0,X                   ; 4
    inx                          ; 2
    bne    LF107                 ; 2³
    ldx    #$7F                  ; 2
LF10E:
    sta    SC_00,X               ; 5
    dex                          ; 2
    bpl    LF10E                 ; 2³
    stx    $84                   ; 3
    lda    #$80                  ; 2
    bne    LF11C                 ; 3   always branch

LF11A:
    lda    #2                    ; 2
LF11C:
    bit    $82                   ; 3
    sta    $82                   ; 3
    lda    #0                    ; 2
    sta    $B8                   ; 3
LF124:
    lda    $B8                   ; 3
    and    #$7F                  ; 2
    sta    $B8                   ; 3
    lda    $83                   ; 3
    and    #$40                  ; 2
    sta    $83                   ; 3
    lda    #0                    ; 2
    bvs    LF13A                 ; 2³
    sta    $E0                   ; 3
    sta    $E1                   ; 3
    sta    $E2                   ; 3
LF13A:
    sta    $B2                   ; 3
    sta    $C5                   ; 3
    sta    $B7                   ; 3
    sta    $B9                   ; 3
    sta    $BA                   ; 3
    sta    $DB                   ; 3
    sta    $B4                   ; 3
    ldx    #$0A                  ; 2
LF14A:
    sta    SC_39,X               ; 5
    sta    SC_4D,X               ; 5
    sta    $A7,X                 ; 4
    dex                          ; 2
    bpl    LF14A                 ; 2³
    ldx    #$0B                  ; 2
LF157:
    sta    $9D,X                 ; 4
    dex                          ; 2
    bpl    LF157                 ; 2³
    ldx    #$13                  ; 2
LF15E:
    lda    LFE3F,X               ; 4
    sta    SC_58,X               ; 5
    lda    LFE53,X               ; 4
    sta    SC_6C,X               ; 5
    dex                          ; 2
    bpl    LF15E                 ; 2³
    ldx    #4                    ; 2
LF16F:
    lda    LFE67,X               ; 4
    sta    SC_00,X               ; 5
    lda    LFE6C,X               ; 4
    sta    SC_13,X               ; 5
    lda    #$2F                  ; 2
    sta    SC_26,X               ; 5
    dex                          ; 2
    bne    LF16F                 ; 2³
    lda    #1                    ; 2
    sta    $9C                   ; 3
    lda    #$34                  ; 2
    sta    $D9                   ; 3
    lda    #2                    ; 2
    sta    $DA                   ; 3
    lda    #$9D                  ; 2
    sta    $BE                   ; 3
LF193:
    lda    #0                    ; 2
    sta    $B3                   ; 3
    sta    $B5                   ; 3
    lda    $83                   ; 3
    ora    #$0F                  ; 2
    sta    $83                   ; 3
    ldx    #9                    ; 2
    stx    $DD                   ; 3
    lda    #$E8                  ; 2
    sta    $E9                   ; 3
    lda    $C5                   ; 3
    bpl    LF1B0                 ; 2³
    dec    $B5                   ; 5
    jmp    LF1B2                 ; 3

LF1B0:
    dec    $B2                   ; 5
LF1B2:
    lda    #$38                  ; 2
    sta    $C0                   ; 3
    lda    #$3C                  ; 2
    sta    $C1                   ; 3
    lda    #0                    ; 2
    sta    $B9                   ; 3
    ldx    #4                    ; 2
LF1C0:
    sta    SC_18,X               ; 5
    dex                          ; 2
    bpl    LF1C0                 ; 2³
    sta    $C3                   ; 3
    lda    $82                   ; 3
    and    #$EF                  ; 2
    sta    $82                   ; 3
LF1CE:
    lda    #0                    ; 2
    sta    $B6                   ; 3
    lda    $82                   ; 3
    and    #$DF                  ; 2
    sta    $82                   ; 3
    and    #$40                  ; 2
    beq    LF1E5                 ; 2³
    lda    #$FF                  ; 2
    sta    $C5                   ; 3
    inc    $B2                   ; 5
    jmp    LF993                 ; 3

LF1E5:
    ldx    #8                    ; 2
    stx    $C5                   ; 3
    lda    $B2                   ; 3
    clc                          ; 2
    adc    #1                    ; 2
    and    #$0F                  ; 2
    sta    $B2                   ; 3
    beq    LF269                 ; 2³+1
    cmp    #4                    ; 2
    beq    LF25A                 ; 2³+1
    lsr                          ; 2
    bcs    LF25A                 ; 2³+1
LF1FB:
    lda    $B8                   ; 3
    eor    #$80                  ; 2
    sta    $B8                   ; 3
    bpl    LF25A                 ; 2³
    lda    $82                   ; 3
    bmi    LF20B                 ; 2³
    and    #$10                  ; 2
    beq    LF1FB                 ; 2³+1
LF20B:
    dec    $B2                   ; 5
    ldx    #8                    ; 2
    lda    #0                    ; 2
LF211:
    sta    SC_1D,X               ; 5
    dex                          ; 2
    bpl    LF211                 ; 2³
    stx    $C5                   ; 3
    lda    $E0                   ; 3
    ldy    #$14                  ; 2
    cmp    #4                    ; 2
    bcc    LF229                 ; 2³
    ldy    #$1E                  ; 2
    cmp    #$10                  ; 2
    bcc    LF229                 ; 2³
    ldy    #$28                  ; 2
LF229:
    sty    $D2                   ; 3
    ldy    #0                    ; 2
    ldx    #2                    ; 2
LF22F:
    lda    SC_18|READ,X          ; 4
    beq    LF246                 ; 2³
    lda    SC_2B|READ,X          ; 4
    beq    LF246                 ; 2³
    cmp    #3                    ; 2
    bcc    LF245                 ; 2³
    cmp    #$0A                  ; 2
    bcc    LF246                 ; 2³
    cmp    #$11                  ; 2
    bcs    LF246                 ; 2³
LF245:
    iny                          ; 2
LF246:
    dex                          ; 2
    bpl    LF22F                 ; 2³
    sty    $D3                   ; 3
    lda    #5                    ; 2
    sta    $D4                   ; 3
    lda    #$FF                  ; 2
    sta    $D5                   ; 3
    lda    #$12                  ; 2
    sta    $DD                   ; 3
    jmp    LF993                 ; 3

LF25A:
    lda    $B2                   ; 3
    sec                          ; 2
    sbc    #1                    ; 2
    and    #$03                  ; 2
    tax                          ; 2
    lda    LF2B5,X               ; 4
    ora    $B7                   ; 3
    sta    $B7                   ; 3
LF269:
    lda    $B2                   ; 3
    ldy    #$FF                  ; 2
    lsr                          ; 2
    bcc    LF278                 ; 2³
    ldx    $E0                   ; 3
    cpx    #4                    ; 2
    bcs    LF278                 ; 2³
    ldy    #0                    ; 2
LF278:
    sty    $F8                   ; 3
    lda    #$0F                  ; 2
    sec                          ; 2
    sbc    $B2                   ; 3
    and    #$0F                  ; 2
    clc                          ; 2
    adc    #3                    ; 2
    lsr                          ; 2
    sta    $F7                   ; 3
    lda    #$3C                  ; 2
    ldy    #$B3                  ; 2
    ldx    #0                    ; 2
LF28D:
    cpx    $F7                   ; 3
    bmi    LF2B9                 ; 2³
    lda    LF2A3,X               ; 4
    sta    $CF,X                 ; 4
    lda    LF2AC,X               ; 4
    sta    $C6,X                 ; 4
    lda    #$40                  ; 2
    sta    SC_44,X               ; 5
    jmp    LF2D4                 ; 3

LF2A3:
    .byte $40 ; | X      | $F2A3
    .byte $2F ; |  X XXXX| $F2A4
    .byte $4D ; | X  XX X| $F2A5
    .byte $0E ; |    XXX | $F2A6
    .byte $6C ; | XX XX  | $F2A7
    .byte $1F ; |   XXXXX| $F2A8
    .byte $5D ; | X XXX X| $F2A9
    .byte $02 ; |      X | $F2AA
    .byte $7C ; | XXXXX  | $F2AB
LF2AC:
    .byte $33 ; |  XX  XX| $F2AC
    .byte $12 ; |   X  X | $F2AD
    .byte $32 ; |  XX  X | $F2AE
    .byte $12 ; |   X  X | $F2AF
    .byte $32 ; |  XX  X | $F2B0
    .byte $12 ; |   X  X | $F2B1
    .byte $33 ; |  XX  XX| $F2B2
    .byte $13 ; |   X  XX| $F2B3
    .byte $33 ; |  XX  XX| $F2B4
LF2B5:
    .byte $00 ; |        | $F2B5
    .byte $04 ; |     X  | $F2B6
    .byte $40 ; | X      | $F2B7
    .byte $10 ; |   X    | $F2B8

LF2B9:
    clc                          ; 2
    adc    #4                    ; 2
    sta    $CF,X                 ; 4
    sty    $C6,X                 ; 4
    bit    $F8                   ; 3
    bmi    LF2CF                 ; 2³
    lda    SC_44|READ,X          ; 4
    and    #$9F                  ; 2
    sta    SC_44,X               ; 5
    jmp    LF2D4                 ; 3

LF2CF:
    lda    #$40                  ; 2
    sta    SC_44,X               ; 5
LF2D4:
    inx                          ; 2
    lda    $CE,X                 ; 4
    cpx    #9                    ; 2
    bne    LF28D                 ; 2³
    lda    #$33                  ; 2
    sta    $C6                   ; 3
    lda    $C3                   ; 3
    beq    LF2E9                 ; 2³
    asl                          ; 2
    adc    $C3                   ; 3
    sec                          ; 2
    sbc    #2                    ; 2
LF2E9:
    sta    $F2                   ; 3
    lda    $C0                   ; 3
    sec                          ; 2
    sbc    $F2                   ; 3
    sta    $F4                   ; 3
    lda    $F2                   ; 3
    bne    LF2FA                 ; 2³
    dec    $F2                   ; 5
    inc    $F4                   ; 5
LF2FA:
    lda    #$16                  ; 2
    sta    $DE                   ; 3
    jmp    LFFE4                 ; 3   bankswitch, goto L9100

LF301:
    lda    INTIM                 ; 4
    bmi    LF301                 ; 2³
    lda    #3                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    lda    $85                   ; 3
    asl                          ; 2
    eor    $85                   ; 3
    asl                          ; 2
    asl                          ; 2
    rol    $84                   ; 5
    rol    $85                   ; 5
    rol    $84                   ; 5
    lda    $E1                   ; 3
    cmp    #$50                  ; 2
    ror                          ; 2
    sta    $F7                   ; 3
    bit    $82                   ; 3
    bpl    LF330                 ; 2³
    lda    #$10                  ; 2
    sta    $BD                   ; 3
    lda    #0                    ; 2
    sta    $EB                   ; 3
    sta    $EC                   ; 3
    sta    $ED                   ; 3
LF330:
    sed                          ; 2
    lda    $ED                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    clc                          ; 2
    adc    $E2                   ; 3
    sta    $E2                   ; 3
    lda    $EC                   ; 3
    adc    $E1                   ; 3
    sta    $E1                   ; 3
    lda    $EB                   ; 3
    adc    $E0                   ; 3
    sta    $E0                   ; 3
    lda    $E1                   ; 3
    cld                          ; 2
    cmp    #$50                  ; 2
    ror                          ; 2
    eor    $F7                   ; 3
    sec                          ; 2
    bpl    LF366                 ; 2³
    lda    $83                   ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    sta    $83                   ; 3
    and    #$30                  ; 2
    cmp    #$30                  ; 2
    sec                          ; 2
    bne    LF366                 ; 2³
    lda    $83                   ; 3
    and    #$CF                  ; 2
    sta    $83                   ; 3
    clc                          ; 2
LF366:
    sta    WSYNC                 ; 3
;---------------------------------------
    bcs    LF378                 ; 2³
    lda    #1                    ; 2
    sta    $BA                   ; 3
    lda    $82                   ; 3
    and    #$0F                  ; 2
    cmp    #$0F                  ; 2
    beq    LF378                 ; 2³
    inc    $82                   ; 5
LF378:
    lda    $80                   ; 3
    asl                          ; 2
    asl                          ; 2
    ora    #$08                  ; 2
    sta    $D8                   ; 3
    bit    $82                   ; 3
    bpl    LF39C                 ; 2³
    lda    $B8                   ; 3
    ora    #$40                  ; 2
    sta    $B8                   ; 3
    lda    $81                   ; 3
    and    #$01                  ; 2
    beq    LF39C                 ; 2³
    lda    $B8                   ; 3
    and    #$BF                  ; 2
    sta    $B8                   ; 3
    lda    $83                   ; 3
    and    #$7F                  ; 2
    sta    $83                   ; 3
LF39C:
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    lda    #$AA                  ; 2
    sta    TIM64T                ; 4
    bit    $B3                   ; 3
    bvc    LF3BC                 ; 2³
    lda    $B3                   ; 3
    eor    #$80                  ; 2
    sta    $B3                   ; 3
    bpl    LF3BC                 ; 2³
    lda    $80                   ; 3
    lsr                          ; 2
    bcs    LF3D2                 ; 2³
    inc    $B3                   ; 5
    bne    LF3D2                 ; 2³
LF3BC:
    inc    $80                   ; 5
    bne    LF3D2                 ; 2³
    lda    $B7                   ; 3
    ora    #$08                  ; 2
    sta    $B7                   ; 3
    inc    $81                   ; 5
    bne    LF3D2                 ; 2³
    bit    $82                   ; 3
    bpl    LF3D2                 ; 2³
    lda    #2                    ; 2
    sta    $B4                   ; 3
LF3D2:
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcs    LF3F3                 ; 2³
    bit    $83                   ; 3
    lsr                          ; 2
    bvs    LF3FA                 ; 2³
    lda    #$40                  ; 2
    sta    $83                   ; 3
    bit    $82                   ; 3
    bvs    LF3F0                 ; 2³
    jsr    LF6E3                 ; 6
    bvs    LF3F0                 ; 2³
    lda    $82                   ; 3
    and    #$BF                  ; 2
    sta    $82                   ; 3
LF3F0:
    jmp    LF11A                 ; 3

LF3F3:
    lsr                          ; 2
    lda    $83                   ; 3
    and    #$BF                  ; 2
    sta    $83                   ; 3
LF3FA:
    bcs    LF437                 ; 2³+1
    lda    $82                   ; 3
    ora    #$40                  ; 2
    cmp    $82                   ; 3
    sta    $82                   ; 3
    beq    LF437                 ; 2³
    and    #$70                  ; 2
    sta    $82                   ; 3
    lda    $B8                   ; 3
    ora    #$40                  ; 2
    sta    $B8                   ; 3
    lda    $E0                   ; 3
    cmp    #6                    ; 2
    bcs    LF422                 ; 2³
    lda    #3                    ; 2
    sta    SC_32                 ; 4
    lda    #0                    ; 2
    sta    SC_33                 ; 4
    beq    LF433                 ; 3   always branch

LF422:
    lda    $E1                   ; 3
    sec                          ; 2
    sed                          ; 2
    sbc    #$50                  ; 2
    sta    SC_33                 ; 4
    lda    $E0                   ; 3
    sbc    #1                    ; 2
    sta    SC_32                 ; 4
    cld                          ; 2
LF433:
    clv                          ; 2
    jmp    LF124                 ; 3

LF437:
    bit    $82                   ; 3
    bvs    LF458                 ; 2³
    bpl    LF441                 ; 2³
    bit    $83                   ; 3
    bpl    LF444                 ; 2³
LF441:
    jmp    LF4C1                 ; 3

LF444:
    bit    INPT4                 ; 3
    bmi    LF4BB                 ; 2³
    lda    $B8                   ; 3
    and    #$DF                  ; 2
    cmp    $B8                   ; 3
    sta    $B8                   ; 3
    beq    LF4C1                 ; 2³
    jsr    LF6E3                 ; 6
    jmp    LF124                 ; 3

LF458:
    lda    $80                   ; 3
    and    #$0F                  ; 2
    bne    LF4A9                 ; 2³
    lda    SWCHA                 ; 4
    eor    #$FF                  ; 2
    and    #$30                  ; 2
    beq    LF4A9                 ; 2³
    cmp    #$10                  ; 2
    sed                          ; 2
    bne    LF492                 ; 2³
    lda    $E0                   ; 3
    cmp    #$30                  ; 2
    bcs    LF4A9                 ; 2³
    lda    #$50                  ; 2
    clc                          ; 2
    adc    $E1                   ; 3
    sta    $E1                   ; 3
    lda    #1                    ; 2
    adc    $E0                   ; 3
    sta    $E0                   ; 3
    lda    SC_33|READ            ; 4
    sec                          ; 2
    sbc    $E1                   ; 3
    lda    SC_32|READ            ; 4
    sbc    $E0                   ; 3
    bcc    LF49C                 ; 2³
    lda    #$73                  ; 2
    sta    $B9                   ; 3
    bcs    LF4A9                 ; 3   always branch

LF492:
    lda    $E1                   ; 3
    ora    $E0                   ; 3
    beq    LF4A9                 ; 2³
    lda    #$73                  ; 2
    sta    $B9                   ; 3
LF49C:
    lda    $E1                   ; 3
    sec                          ; 2
    sbc    #$50                  ; 2
    sta    $E1                   ; 3
    lda    $E0                   ; 3
    sbc    #1                    ; 2
    sta    $E0                   ; 3
LF4A9:
    cld                          ; 2
    bit    INPT4                 ; 3
    bmi    LF4BB                 ; 2³
    lda    $B8                   ; 3
    and    #$DF                  ; 2
    cmp    $B8                   ; 3
    sta    $B8                   ; 3
    beq    LF4C1                 ; 2³
    jmp    LF11A                 ; 3

LF4BB:
    lda    $B8                   ; 3
    ora    #$20                  ; 2
    sta    $B8                   ; 3
LF4C1:
    lda    $80                   ; 3
    lsr                          ; 2
    bcs    LF4FF                 ; 2³
    and    #$03                  ; 2
    tax                          ; 2
    inx                          ; 2
    lda    #$2F                  ; 2
    cmp    SC_26|READ,X          ; 4
    bcs    LF4FF                 ; 2³
    lda    $80                   ; 3
    and    #$08                  ; 2
    beq    LF4E4                 ; 2³
    lda    SC_13|READ,X          ; 4
    beq    LF4FC                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    ora    #$01                  ; 2
    bne    LF4F8                 ; 3   always branch

LF4E4:
    lda    SC_13|READ,X          ; 4
    beq    LF4FC                 ; 2³
    adc    #$20                  ; 2
    bcc    LF4EF                 ; 2³
    lda    #0                    ; 2
LF4EF:
    sta    SC_13,X               ; 5
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$FE                  ; 2
LF4F8:
    tay                          ; 2
    lda    LF956,Y               ; 4
LF4FC:
    sta    SC_26,X               ; 5
LF4FF:
    lda    $B3                   ; 3
    bmi    LF506                 ; 2³
LF503:
    jmp    LF764                 ; 3

LF506:
    and    #$40                  ; 2
    bne    LF503                 ; 2³
    lda    $80                   ; 3
    lsr                          ; 2
    bcc    LF512                 ; 2³
    jmp    LF993                 ; 3

LF512:
    dec    $B3                   ; 5
    bmi    LF537                 ; 2³
    inc    $C5                   ; 5
    bit    $82                   ; 3
    bmi    LF534                 ; 2³
    dec    $82                   ; 5
    lda    $82                   ; 3
    and    #$0F                  ; 2
    cmp    #$0F                  ; 2
    bne    LF534                 ; 2³
    lda    #$80                  ; 2
    sta    $82                   ; 3
    sta    $83                   ; 3
    sta    $80                   ; 3
    lda    #0                    ; 2
    sta    $B5                   ; 3
    sta    $81                   ; 3
LF534:
    jmp    LF193                 ; 3

LF537:
    ldx    $DF                   ; 3
    lda    $B3                   ; 3
    cmp    #$9F                  ; 2
    bne    LF569                 ; 2³
    lda    #8                    ; 2
    sta    $B9                   ; 3
    cpx    #$0A                  ; 2
    bcc    LF551                 ; 2³
    lda    SC_13|READ,X          ; 4
    sta    SC_18                 ; 4
    ldx    #5                    ; 2
    stx    $DF                   ; 3
LF551:
    lda    #$1C                  ; 2
    sta    SC_26,X               ; 5
    lda    $C1                   ; 3
    sec                          ; 2
    sbc    #2                    ; 2
    bcs    LF560                 ; 2³
    sec                          ; 2
    lda    #0                    ; 2
LF560:
    sta    SC_00,X               ; 5
    lda    #$40                  ; 2
    sta    $C0                   ; 3
    lda    #$9F                  ; 2
LF569:
    bcc    LF576                 ; 2³
    and    #$01                  ; 2
    tax                          ; 2
    lda    LF762,X               ; 4
    sta    $DA                   ; 3
    jmp    LF993                 ; 3

LF576:
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$03                  ; 2
    tay                          ; 2
    lda    LF75E,Y               ; 4
    sta    SC_26,X               ; 5
    lda    $B3                   ; 3
    cmp    #$82                  ; 2
    beq    LF58C                 ; 2³
    bcs    LF5FA                 ; 2³
    bcc    LF5BB                 ; 3   always branch

LF58C:
    lda    $9C                   ; 3
    asl                          ; 2
    clc                          ; 2
    adc    #2                    ; 2
    sta    $D2                   ; 3
    lda    #0                    ; 2
    sta    $D3                   ; 3
    sta    $D4                   ; 3
    sta    $D5                   ; 3
    sta    $C3                   ; 3
    ldx    $DD                   ; 3
    lda    #0                    ; 2
LF5A2:
    sta    SC_13,X               ; 5
    dex                          ; 2
    cpx    #5                    ; 2
    bcs    LF5A2                 ; 2³
    ldx    #5                    ; 2
    stx    $DD                   ; 3
    ldx    #$FF                  ; 2
    lda    $C5                   ; 3
    bpl    LF5B6                 ; 2³
    ldx    #$FE                  ; 2
LF5B6:
    stx    $C5                   ; 3
    jmp    LF993                 ; 3

LF5BB:
    inc    $B3                   ; 5
    dec    $D4                   ; 5
    bmi    LF5C9                 ; 2³
    lda    #$21                  ; 2
    sta    SC_2B                 ; 4
    jmp    LF993                 ; 3

LF5C9:
    lda    #6                    ; 2
    sta    $FA                   ; 3
    lda    #2                    ; 2
    sta    $FB                   ; 3
    lda    $9C                   ; 3
    lsr                          ; 2
    ror                          ; 2
    sta    $F8                   ; 3
LF5D7:
    dec    $FA                   ; 5
    bmi    LF5FA                 ; 2³
    ldy    $D3                   ; 3
    cpy    #$20                  ; 2
    bcc    LF602                 ; 2³+1
    bne    LF5FD                 ; 2³
    ldx    #$10                  ; 2
    lda    $82                   ; 3
    bpl    LF5EB                 ; 2³
    inc    $B2                   ; 5
LF5EB:
    and    #$0F                  ; 2
    bne    LF5F1                 ; 2³
    ldx    #0                    ; 2
LF5F1:
    stx    $D4                   ; 3
    lda    #0                    ; 2
    sta    SC_18                 ; 4
    inc    $D3                   ; 5
LF5FA:
    jmp    LF993                 ; 3

LF5FD:
    dec    $B3                   ; 5
    jmp    LF993                 ; 3

LF602:
    tya                          ; 2
    lsr                          ; 2
    lda    LFE71,Y               ; 4
    bcs    LF60C                 ; 2³
    lda    LFE91,Y               ; 4
LF60C:
    sta    $F7                   ; 3
    ldx    $D2                   ; 3
    txa                          ; 2
    cpy    #$10                  ; 2
    bcc    LF617                 ; 2³
    adc    #$13                  ; 2
LF617:
    tay                          ; 2
    lda    $D3                   ; 3
    lsr                          ; 2
    bcc    LF63A                 ; 2³
LF61D:
    lda    SC_56|READ,Y          ; 4
    and    $F7                   ; 3
    bne    LF652                 ; 2³
LF624:
    dex                          ; 2
    dex                          ; 2
    dey                          ; 2
    dey                          ; 2
    cpx    #3                    ; 2
    bcs    LF61D                 ; 2³
    inx                          ; 2
    bit    $F8                   ; 3
    bpl    LF633                 ; 2³
    inx                          ; 2
    inx                          ; 2
LF633:
    stx    $D2                   ; 3
    inc    $D3                   ; 5
    jmp    LF5D7                 ; 3

LF63A:
    lda    SC_56|READ,Y          ; 4
    and    $F7                   ; 3
    bne    LF688                 ; 2³
LF641:
    inx                          ; 2
    inx                          ; 2
    iny                          ; 2
    iny                          ; 2
    cpx    #$15                  ; 2
    bcc    LF63A                 ; 2³
    dex                          ; 2
    bit    $F8                   ; 3
    bmi    LF633                 ; 2³
    dex                          ; 2
    dex                          ; 2
    bcs    LF633                 ; 3   always branch

LF652:
    cpy    #$0D                  ; 2
    bcc    LF65E                 ; 2³
    cpy    #$16                  ; 2
    bcc    LF66B                 ; 2³
    cpy    #$21                  ; 2
    bcs    LF66B                 ; 2³
LF65E:
    eor    #$FF                  ; 2
    and    SC_37|READ,Y          ; 4
    cmp    SC_37|READ,Y          ; 4
    sta    SC_37,Y               ; 5
    bne    LF673                 ; 2³
LF66B:
    lda    #0                    ; 2
    sta    $9C,X                 ; 4
    dec    $FB                   ; 5
    bpl    LF624                 ; 2³
LF673:
    txa                          ; 2
    tay                          ; 2
    lda    $D3                   ; 3
    dex                          ; 2
    dex                          ; 2
    cpx    #3                    ; 2
    bcs    LF6BC                 ; 2³
    inx                          ; 2
    bit    $F8                   ; 3
    bpl    LF684                 ; 2³
    inx                          ; 2
    inx                          ; 2
LF684:
    inc    $D3                   ; 5
    bne    LF6BC                 ; 2³
LF688:
    cpy    #$0D                  ; 2
    bcc    LF694                 ; 2³
    cpy    #$16                  ; 2
    bcc    LF6A1                 ; 2³
    cpy    #$21                  ; 2
    bcs    LF6A1                 ; 2³
LF694:
    eor    #$FF                  ; 2
    and    SC_37|READ,Y          ; 4
    cmp    SC_37|READ,Y          ; 4
    sta    SC_37,Y               ; 5
    bne    LF6A9                 ; 2³
LF6A1:
    lda    #0                    ; 2
    sta    $9C,X                 ; 4
    dec    $FB                   ; 5
    bpl    LF641                 ; 2³
LF6A9:
    txa                          ; 2
    tay                          ; 2
    lda    $D3                   ; 3
    inx                          ; 2
    inx                          ; 2
    cpx    #$15                  ; 2
    bcc    LF6BC                 ; 2³
    dex                          ; 2
    bit    $F8                   ; 3
    bmi    LF6BA                 ; 2³
    dex                          ; 2
    dex                          ; 2
LF6BA:
    inc    $D3                   ; 5
LF6BC:
    stx    $D2                   ; 3
    asl                          ; 2
    asl                          ; 2
    beq    LF6C5                 ; 2³
    sec                          ; 2
    sbc    #2                    ; 2
LF6C5:
    sta    SC_05                 ; 4
    lda    #$20                  ; 2
    sta    SC_2B                 ; 4
    tya                          ; 2
    sec                          ; 2
    sbc    $9C                   ; 3
    sta    SC_18                 ; 4
    lda    #5                    ; 2
    sta    $D5                   ; 3
    lda    #$44                  ; 2
    sta    $B9                   ; 3
    lda    #1                    ; 2
    sta    $D4                   ; 3
    jmp    LF993                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF6E3 SUBROUTINE
    lda    $82                   ; 3
    ora    #$40                  ; 2
    and    #$70                  ; 2
    sta    $82                   ; 3
    lda    $B8                   ; 3
    ora    #$40                  ; 2
    sta    $B8                   ; 3
    lda    #3                    ; 2
    sta    SC_32                 ; 4
    lda    #0                    ; 2
    sta    SC_33                 ; 4
    lda    $E0                   ; 3
    bne    LF701                 ; 2³+1
    clv                          ; 2
    rts                          ; 6

LF701:
    sed                          ; 2
    cmp    #6                    ; 2
    bcc    LF716                 ; 2³
    cmp    #$31                  ; 2
    bcc    LF730                 ; 2³
    bne    LF712                 ; 2³
    lda    $E1                   ; 3
    cmp    #$50                  ; 2
    bcc    LF730                 ; 2³
LF712:
    lda    #$30                  ; 2
    bne    LF718                 ; 3   always branch

LF716:
    lda    #3                    ; 2
LF718:
    sta    $E0                   ; 3
    lda    #0                    ; 2
    sta    $E1                   ; 3
LF71E:
    lda    #0                    ; 2
    sta    $E2                   ; 3
    lda    $E0                   ; 3
    sta    SC_32                 ; 4
    lda    $E1                   ; 3
    sta    SC_33                 ; 4
    cld                          ; 2
    bit    $82                   ; 3
    rts                          ; 6

LF730:
    lda    $E1                   ; 3
    sta    $F8                   ; 3
    lda    $E0                   ; 3
    sec                          ; 2
    sbc    #3                    ; 2
    sta    $F7                   ; 3
    lda    #4                    ; 2
    sta    $E0                   ; 3
    lda    #$50                  ; 2
    sta    $E1                   ; 3
LF743:
    lda    $F8                   ; 3
    sec                          ; 2
    sbc    $E1                   ; 3
    lda    $F7                   ; 3
    sbc    $E0                   ; 3
    bcc    LF71E                 ; 2³
    lda    $E1                   ; 3
    clc                          ; 2
    adc    #$50                  ; 2
    sta    $E1                   ; 3
    lda    $E0                   ; 3
    adc    #1                    ; 2
    sta    $E0                   ; 3
    jmp    LF743                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF75E:
    .byte $1F ; |   XXXXX| $F75E
    .byte $1E ; |   XXXX | $F75F
    .byte $1D ; |   XXX X| $F760
    .byte $1C ; |   XXX  | $F761
LF762:
    .byte $40 ; | X      | $F762
    .byte $02 ; |      X | $F763

LF764:
    lda    $C5                   ; 3
    bpl    LF7CE                 ; 2³
    bit    $82                   ; 3
    bvs    LF7CE                 ; 2³
    lda    $B8                   ; 3
    bpl    LF79A                 ; 2³
    lda    $D3                   ; 3
    ora    $D2                   ; 3
    bne    LF7CE                 ; 2³
    lda    $BA                   ; 3
    cmp    #$25                  ; 2
    bcc    LF780                 ; 2³
    lda    #0                    ; 2
    sta    $BA                   ; 3
LF780:
    lda    $B8                   ; 3
    clc                          ; 2
    adc    #4                    ; 2
    and    #$0C                  ; 2
    sta    $F7                   ; 3
    lda    $B8                   ; 3
    and    #$F3                  ; 2
    ora    $F7                   ; 3
    sta    $B8                   ; 3
    lda    $82                   ; 3
    and    #$EF                  ; 2
    sta    $82                   ; 3
    jmp    LF7C9                 ; 3

LF79A:
    lda    $C5                   ; 3
    cmp    #$D0                  ; 2
    bcs    LF7C5                 ; 2³
    lda    SC_1A|READ            ; 4
    bne    LF7C5                 ; 2³
    lda    $BA                   ; 3
    beq    LF7AD                 ; 2³
    cmp    #$25                  ; 2
    bcc    LF7B1                 ; 2³
LF7AD:
    lda    #$3E                  ; 2
    sta    $BA                   ; 3
LF7B1:
    lda    #$0E                  ; 2
    sta    SC_2D                 ; 4
    lda    $84                   ; 3
    and    #$7C                  ; 2
    sta    SC_07                 ; 4
    cmp    #$67                  ; 2
    lda    #$28                  ; 2
    ror                          ; 2
    sta    SC_1A                 ; 4
LF7C5:
    inc    $C5                   ; 5
    bne    LF7CE                 ; 2³
LF7C9:
    dec    $B5                   ; 5
    jmp    LF1CE                 ; 3

LF7CE:
    ldy    #0                    ; 2
    lda    $DB                   ; 3
    beq    LF81C                 ; 2³+1
    bpl    LF7D8                 ; 2³
    ldy    #$FF                  ; 2
LF7D8:
    sty    $F7                   ; 3
    ldy    $DC                   ; 3
    cpy    #$10                  ; 2
    bcc    LF7E2                 ; 2³
    adc    #$13                  ; 2
LF7E2:
    and    #$7F                  ; 2
    tax                          ; 2
    tya                          ; 2
    lsr                          ; 2
    lda    LFE91,Y               ; 4
    bcc    LF7F0                 ; 2³
    dex                          ; 2
    lda    LFE71,Y               ; 4
LF7F0:
    sta    $F8                   ; 3
    cpx    #$0D                  ; 2
    bcc    LF7FE                 ; 2³
    cpx    #$16                  ; 2
    bcc    LF81F                 ; 2³+1
    cpx    #$21                  ; 2
    bcs    LF81F                 ; 2³+1
LF7FE:
    lda    $F8                   ; 3
    and    SC_37|READ,X          ; 4
    bne    LF834                 ; 2³
    lda    $F7                   ; 3
    eor    SC_54|READ,X          ; 4
    and    $F8                   ; 3
    sta    $F7                   ; 3
    eor    SC_56|READ,X          ; 4
    sta    SC_56,X               ; 5
    eor    $F7                   ; 3
    and    $F8                   ; 3
    bne    LF834                 ; 2³
    beq    LF83A                 ; 3   always branch

LF81C:
    jmp    LF857                 ; 3

LF81F:
    lda    $F7                   ; 3
    eor    SC_54|READ,X          ; 4
    and    $F8                   ; 3
    sta    $F7                   ; 3
    eor    SC_56|READ,X          ; 4
    sta    SC_56,X               ; 5
    eor    $F7                   ; 3
    and    $F8                   ; 3
    beq    LF83A                 ; 2³
LF834:
    lda    $DB                   ; 3
    ora    #$80                  ; 2
    bmi    LF83E                 ; 3   always branch

LF83A:
    lda    $DB                   ; 3
    and    #$7F                  ; 2
LF83E:
    sec                          ; 2
    sbc    #2                    ; 2
    sta    $DB                   ; 3
    and    #$7F                  ; 2
    cmp    #6                    ; 2
    bne    LF857                 ; 2³
    lda    #$14                  ; 2
    inc    $DC                   ; 5
    ldy    $DC                   ; 3
    cpy    #$20                  ; 2
    bcc    LF855                 ; 2³
    lda    #0                    ; 2
LF855:
    sta    $DB                   ; 3
LF857:
    bit    $82                   ; 3
    bvc    LF85E                 ; 2³
    jmp    LF993                 ; 3

LF85E:
    bpl    LF863                 ; 2³
    jmp    LF8F0                 ; 3

LF863:
    lda    $B3                   ; 3
    asl                          ; 2
    bmi    LF86B                 ; 2³
    lda    $80                   ; 3
    lsr                          ; 2
LF86B:
    bcs    LF88D                 ; 2³
    lda    SWCHA                 ; 4
    asl                          ; 2
    asl                          ; 2
    bpl    LF883                 ; 2³
    asl                          ; 2
    bmi    LF88D                 ; 2³
    dec    $C0                   ; 5
    lda    $C0                   ; 3
    cmp    #$29                  ; 2
    bne    LF88D                 ; 2³
    inc    $C0                   ; 5
    bne    LF88D                 ; 2³
LF883:
    inc    $C0                   ; 5
    lda    $C0                   ; 3
    cmp    #$39                  ; 2
    bne    LF88D                 ; 2³
    dec    $C0                   ; 5
LF88D:
    lda    SWCHA                 ; 4
    eor    #$FF                  ; 2
    and    #$C0                  ; 2
    bne    LF898                 ; 2³
    sta    $C2                   ; 3
LF898:
    lda    $C2                   ; 3
    cmp    #$17                  ; 2
    bcc    LF8A2                 ; 2³
    lda    #$16                  ; 2
    sta    $C2                   ; 3
LF8A2:
    inc    $C2                   ; 5
    ldx    $C2                   ; 3
    lda    SWCHA                 ; 4
    bpl    LF8BB                 ; 2³
    asl                          ; 2
    bmi    LF8DE                 ; 2³
    lda    LF8C6,X               ; 4
    eor    #$FF                  ; 2
    sec                          ; 2
    adc    $C1                   ; 3
    sta    $C1                   ; 3
    jmp    LF8DE                 ; 3

LF8BB:
    lda    LF8C6,X               ; 4
    clc                          ; 2
    adc    $C1                   ; 3
    sta    $C1                   ; 3
    jmp    LF8DE                 ; 3

LF8C6:
    .byte $00 ; |        | $F8C6
    .byte $00 ; |        | $F8C7
    .byte $01 ; |       X| $F8C8
    .byte $00 ; |        | $F8C9
    .byte $00 ; |        | $F8CA
    .byte $01 ; |       X| $F8CB
    .byte $00 ; |        | $F8CC
    .byte $01 ; |       X| $F8CD
    .byte $00 ; |        | $F8CE
    .byte $01 ; |       X| $F8CF
    .byte $01 ; |       X| $F8D0
    .byte $01 ; |       X| $F8D1
    .byte $01 ; |       X| $F8D2
    .byte $01 ; |       X| $F8D3
    .byte $01 ; |       X| $F8D4
    .byte $02 ; |      X | $F8D5
    .byte $01 ; |       X| $F8D6
    .byte $01 ; |       X| $F8D7
    .byte $02 ; |      X | $F8D8
    .byte $01 ; |       X| $F8D9
    .byte $01 ; |       X| $F8DA
    .byte $02 ; |      X | $F8DB
    .byte $02 ; |      X | $F8DC
    .byte $02 ; |      X | $F8DD

LF8DE:
    lda    $C1                   ; 3
    bpl    LF8E6                 ; 2³
    lda    #0                    ; 2
    sta    $C1                   ; 3
LF8E6:
    cmp    #$7D                  ; 2
    bmi    LF966                 ; 2³+1
    lda    #$7C                  ; 2
    sta    $C1                   ; 3
    bne    LF966                 ; 3+1   always branch

LF8F0:
    lda    SWCHA                 ; 4
    cmp    #$FF                  ; 2
    beq    LF8FD                 ; 2³
    lda    #0                    ; 2
    sta    $B4                   ; 3
    sta    $81                   ; 3
LF8FD:
    lda    $80                   ; 3
    bpl    LF950                 ; 2³
    and    #$01                  ; 2
    bne    LF92B                 ; 2³
    bit    $C2                   ; 3
    bpl    LF91B                 ; 2³
    lda    $C0                   ; 3
    cmp    #$38                  ; 2
    bne    LF917                 ; 2³
    lda    $C2                   ; 3
    eor    #$80                  ; 2
    sta    $C2                   ; 3
    bpl    LF92B                 ; 2³
LF917:
    inc    $C0                   ; 5
    bne    LF92B                 ; 2³
LF91B:
    lda    $C0                   ; 3
    cmp    #$2E                  ; 2
    bne    LF929                 ; 2³
    lda    $C2                   ; 3
    eor    #$80                  ; 2
    sta    $C2                   ; 3
    bmi    LF92B                 ; 2³
LF929:
    dec    $C0                   ; 5
LF92B:
    bit    $C2                   ; 3
    bvc    LF940                 ; 2³
    lda    $C1                   ; 3
    bne    LF93C                 ; 2³
    lda    $C2                   ; 3
    eor    #$40                  ; 2
    sta    $C2                   ; 3
    jmp    LF950                 ; 3

LF93C:
    dec    $C1                   ; 5
    bpl    LF950                 ; 2³
LF940:
    lda    $C1                   ; 3
    cmp    #$7C                  ; 2
    bne    LF94E                 ; 2³
    lda    $C2                   ; 3
    eor    #$40                  ; 2
    sta    $C2                   ; 3
    bne    LF950                 ; 2³
LF94E:
    inc    $C1                   ; 5
LF950:
    lda    $C3                   ; 3
    bne    LF989                 ; 2³
    beq    LF96E                 ; 3   always branch

LF956:
    .byte $30 ; |  XX    | $F956
    .byte $30 ; |  XX    | $F957
    .byte $31 ; |  XX   X| $F958
    .byte $32 ; |  XX  X | $F959
    .byte $33 ; |  XX  XX| $F95A
    .byte $34 ; |  XX X  | $F95B
    .byte $33 ; |  XX  XX| $F95C
    .byte $34 ; |  XX X  | $F95D
    .byte $33 ; |  XX  XX| $F95E
    .byte $34 ; |  XX X  | $F95F
    .byte $33 ; |  XX  XX| $F960
    .byte $34 ; |  XX X  | $F961
    .byte $35 ; |  XX X X| $F962
    .byte $36 ; |  XX XX | $F963
    .byte $37 ; |  XX XXX| $F964
    .byte $37 ; |  XX XXX| $F965

LF966:
    lda    $C3                   ; 3
    bne    LF989                 ; 2³
    lda    INPT4                 ; 3
    bmi    LF993                 ; 2³
LF96E:
    lda    #$4B                  ; 2
    ldx    $B9                   ; 3
    beq    LF978                 ; 2³
    cmp    $B9                   ; 3
    bcs    LF97A                 ; 2³
LF978:
    sta    $B9                   ; 3
LF97A:
    ldx    $C1                   ; 3
    inx                          ; 2
    stx    $C4                   ; 3
    ldx    $C0                   ; 3
    lda    LFE00,X               ; 4
    clc                          ; 2
    adc    #2                    ; 2
    sta    $C3                   ; 3
LF989:
    lda    $B3                   ; 3
    bpl    LF991                 ; 2³
    and    #$40                  ; 2
    beq    LF993                 ; 2³
LF991:
    dec    $C3                   ; 5
LF993:
    lda    $C3                   ; 3
    beq    LF99D                 ; 2³
    asl                          ; 2
    adc    $C3                   ; 3
    sec                          ; 2
    sbc    #2                    ; 2
LF99D:
    sta    $F2                   ; 3
    lda    $C0                   ; 3
    sec                          ; 2
    sbc    $F2                   ; 3
    sta    $F4                   ; 3
    lda    $F2                   ; 3
    bne    LF9AE                 ; 2³
    dec    $F2                   ; 5
    inc    $F4                   ; 5
LF9AE:
    lda    #$16                  ; 2
    sta    $DE                   ; 3
    ldx    #4                    ; 2
LF9B4:
    lda    SC_26|READ,X          ; 4
    cmp    #$38                  ; 2
    bcc    LF9C0                 ; 2³
    sbc    #8                    ; 2
    sta    SC_26,X               ; 5
LF9C0:
    dex                          ; 2
    bne    LF9B4                 ; 2³
    ldx    #$F1                  ; 2
    txs                          ; 2
    ldy    $E9                   ; 3
    ldx    $9C                   ; 3
    bne    LFA1C                 ; 2³+1
    beq    LF9F2                 ; 3   always branch

LF9CE:
    iny                          ; 2
    sec                          ; 2
    ldx    0,Y                   ; 4   collisions?
    bpl    LF9D9                 ; 2³
    txa                          ; 2
    and    #$7F                  ; 2
    tax                          ; 2
    clc                          ; 2
LF9D9:
    lda    SC_13|READ,X          ; 4
    beq    LF9F2                 ; 2³
    sbc    #0                    ; 2
    and    #$1F                  ; 2
    pha                          ; 3
    stx    $F7                   ; 3
    tax                          ; 2
    lda    #0                    ; 2
    sta    $86,X                 ; 4
    lda    $9C,X                 ; 4
    and    #$80                  ; 2
    ora    $F7                   ; 3
    sta    $9C,X                 ; 4
LF9F2:
    cpy    #$E8                  ; 2
    bcc    LF9CE                 ; 2³
    bcs    LFA20                 ; 3+1   always branch

LF9F8:
    iny                          ; 2
    sec                          ; 2
    ldx    0,Y                   ; 4   collisions?
    bpl    LFA03                 ; 2³+1
    txa                          ; 2
    and    #$7F                  ; 2
    tax                          ; 2
    clc                          ; 2
LFA03:
    lda    SC_13|READ,X          ; 4
    beq    LFA1C                 ; 2³
    adc    #0                    ; 2
    and    #$1F                  ; 2
    pha                          ; 3
    stx    $F7                   ; 3
    tax                          ; 2
    lda    #0                    ; 2
    sta    $86,X                 ; 4
    lda    $9C,X                 ; 4
    and    #$80                  ; 2
    ora    $F7                   ; 3
    sta    $9C,X                 ; 4
LFA1C:
    cpy    #$E8                  ; 2
    bcc    LF9F8                 ; 2³+1
LFA20:
    lda    #0                    ; 2
    pha                          ; 3
    ldx    #$E8                  ; 2
    txs                          ; 2
    ldy    $DD                   ; 3
LFA28:
    lda    SC_13|READ,Y          ; 4
    beq    LFA5F                 ; 2³
    and    #$1F                  ; 2
    clc                          ; 2
    adc    $9C                   ; 3
    tax                          ; 2
LFA33:
    lda    $86,X                 ; 4
    bmi    LFA65                 ; 2³
    bne    LFA4E                 ; 2³
    tya                          ; 2
    sec                          ; 2
    sbc    $9C,X                 ; 4
    beq    LFA43                 ; 2³
    cmp    #$80                  ; 2
    bne    LFA5F                 ; 2³
LFA43:
    lda    #$80                  ; 2
    sta    $86,X                 ; 4
    and    $9C,X                 ; 4
    sta    $9C,X                 ; 4
    jmp    LFA33                 ; 3

LFA4E:
    lda    $9C,X                 ; 4
    asl                          ; 2
    bne    LFA68                 ; 2³
    lda    SC_26|READ,Y          ; 4
    bmi    LFA68                 ; 2³
    tya                          ; 2
    bcc    LFA5D                 ; 2³
    ora    #$80                  ; 2
LFA5D:
    sta    $9C,X                 ; 4
LFA5F:
    dey                          ; 2
    bne    LFA28                 ; 2³
    jmp    LFB20                 ; 3

LFA65:
    asl                          ; 2
    bpl    LFA97                 ; 2³
LFA68:
    sty    $F7                   ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    $9C                   ; 3
    sta    $F8                   ; 3
    tsx                          ; 2
    bne    LFA89                 ; 2³
LFA73:
    inx                          ; 2
    ldy    0,X                   ; 4   collisions?
    bmi    LFA89                 ; 2³
    lda    SC_13|READ,Y          ; 4
    and    #$1F                  ; 2
    cmp    $F8                   ; 3
    bne    LFA89                 ; 2³
    ldy    $F7                   ; 3
    dey                          ; 2
    bne    LFA28                 ; 2³
    jmp    LFB20                 ; 3

LFA89:
    cpx    #$E8                  ; 2
    bne    LFA73                 ; 2³
    ldy    $F7                   ; 3
    tya                          ; 2
    pha                          ; 3
    dey                          ; 2
    bne    LFA28                 ; 2³
    jmp    LFB20                 ; 3

LFA97:
    bne    LFAC4                 ; 2³
    lda    SC_26|READ,Y          ; 4
    cmp    #$C0                  ; 2
    bcc    LFAB6                 ; 2³
    lda    SC_26|READ,Y          ; 4
    sta    $86,X                 ; 4
    lsr                          ; 2
    lda    $9C,X                 ; 4
    ora    SC_00|READ,Y          ; 4
    bcc    LFAB1                 ; 2³
    adc    #3                    ; 2
    stx    $DE                   ; 3
LFAB1:
    sta    $9C,X                 ; 4
    jmp    LFA5F                 ; 3

LFAB6:
    cmp    #$30                  ; 2
    tya                          ; 2
    bcs    LFABD                 ; 2³
    ora    #$80                  ; 2
LFABD:
    sta    $86,X                 ; 4
    bcs    LFADA                 ; 2³
LFAC1:
    jmp    LFA5F                 ; 3

LFAC4:
    lsr                          ; 2
    sta    $FA                   ; 3
    lda    SC_26|READ,Y          ; 4
    cmp    #$C0                  ; 2
    bcs    LFA68                 ; 2³
    cmp    #$30                  ; 2
    lda    $9C,X                 ; 4
    ora    $FA                   ; 3
    sta    $9C,X                 ; 4
    sty    $86,X                 ; 4
    bcc    LFA5F                 ; 2³
LFADA:
    lda    $85,X                 ; 4
    beq    LFB15                 ; 2³+1
    and    #$C0                  ; 2
    cmp    #$80                  ; 2
    beq    LFAC1                 ; 2³
    sty    $F7                   ; 3
    txa                          ; 2
    clc                          ; 2
    sbc    $9C                   ; 3
    sta    $F8                   ; 3
    tsx                          ; 2
    bne    LFB05                 ; 2³+1
LFAEF:
    inx                          ; 2
    ldy    0,X                   ; 4   collisions?
    bmi    LFB05                 ; 2³+1
    lda    SC_13|READ,Y          ; 4
    and    #$1F                  ; 2
    cmp    $F8                   ; 3
    bne    LFB05                 ; 2³+1
    ldy    $F7                   ; 3
    dey                          ; 2
    beq    LFB20                 ; 2³
    jmp    LFA28                 ; 3

LFB05:
    cpx    #$E8                  ; 2
    bne    LFAEF                 ; 2³+1
    ldy    $F7                   ; 3
    tya                          ; 2
    ora    #$80                  ; 2
    pha                          ; 3
    dey                          ; 2
    beq    LFB20                 ; 2³
    jmp    LFA28                 ; 3

LFB15:
    lda    #$80                  ; 2
    sta    $85,X                 ; 4
    and    $9B,X                 ; 4
    sta    $9B,X                 ; 4
    jmp    LFA5F                 ; 3

LFB20:
    ldx    #$F2                  ; 2
LFB22:
    dex                          ; 2
    ldy    0,X                   ; 4   collisions?
    beq    LFB55                 ; 2³
    lda.wy $86,Y                 ; 4
    bne    LFB22                 ; 2³
    lda.wy $87,Y                 ; 4
    beq    LFB47                 ; 2³
    cmp    #5                    ; 2
    bcc    LFB47                 ; 2³
    lda.wy $9C,Y                 ; 4
    and    #$7F                  ; 2
    tay                          ; 2
    lda    SC_26|READ,Y          ; 4
    clc                          ; 2
    adc    #8                    ; 2
    sta    SC_26,Y               ; 5
    jmp    LFB22                 ; 3

LFB47:
    lda    #$80                  ; 2
    sta.wy $86,Y                 ; 5
    and.wy $9C,Y                 ; 4
    sta.wy $9C,Y                 ; 5
    jmp    LFB22                 ; 3

LFB55:
    tsx                          ; 2
    stx    $E9                   ; 3
    ldx    #$FF                  ; 2
    txs                          ; 2
    ldx    #0                    ; 2
    stx    $F7                   ; 3
    ldx    $C5                   ; 3
    bmi    LFB72                 ; 2³
    bit    $B3                   ; 3
    bmi    LFB72                 ; 2³
    lda    $80                   ; 3
    and    #$07                  ; 2
    cmp    #3                    ; 2
    beq    LFB75                 ; 2³
    jmp    LFC5C                 ; 3

LFB72:
    jmp    LFFE4                 ; 3   bankswitch, goto L9100

LFB75:
    lda    INTIM                 ; 4
    cmp    #$85                  ; 2
    bmi    LFB72                 ; 2³
    lda    $BA                   ; 3
    bne    LFBBF                 ; 2³
    lda    $B3                   ; 3
    and    #$40                  ; 2
    beq    LFB8D                 ; 2³
    lda    #$1C                  ; 2
    sta    $BA                   ; 3
    jmp    LFBBF                 ; 3

LFB8D:
    ldx    #2                    ; 2
LFB8F:
    lda    SC_18|READ,X          ; 4
    beq    LFBA3                 ; 2³
    ldy    SC_2B|READ,X          ; 4
    cpy    #$1C                  ; 2
    bcs    LFBA3                 ; 2³
    lda    LFD86,Y               ; 4
    sta    $BA                   ; 3
    jmp    LFBBF                 ; 3

LFBA3:
    dex                          ; 2
    bpl    LFB8F                 ; 2³
    ldx    #1                    ; 2
LFBA8:
    lda    SC_1B|READ,X          ; 4
    beq    LFBBC                 ; 2³
    ldy    SC_2E|READ,X          ; 4
    cpy    #$1C                  ; 2
    bcs    LFBBC                 ; 2³
    lda    LFD86,Y               ; 4
    sta    $BA                   ; 3
    jmp    LFBBF                 ; 3

LFBBC:
    dex                          ; 2
    bpl    LFBA8                 ; 2³
LFBBF:
    lda    #0                    ; 2
    sta    $F8                   ; 3
    lda    $80                   ; 3
    and    #$08                  ; 2
    bne    LFC08                 ; 2³+1
    ldx    #9                    ; 2
LFBCB:
    lda    SC_62|READ,X          ; 4
    bne    LFBDD                 ; 2³
    lda    SC_76|READ,X          ; 4
    bne    LFBE9                 ; 2³
    lda    $A8,X                 ; 4
    and    #$7F                  ; 2
    sta    $A8,X                 ; 4
    bpl    LFBF2                 ; 3   always branch

LFBDD:
    lsr                          ; 2
    tay                          ; 2
    lda    LFF00,Y               ; 4
    adc    $F8                   ; 3
    sta    $F8                   ; 3
    lda    SC_76|READ,X          ; 4
LFBE9:
    lsr                          ; 2
    tay                          ; 2
    lda    LFF00,Y               ; 4
    adc    $F8                   ; 3
    sta    $F8                   ; 3
LFBF2:
    dex                          ; 2
    cpx    $9C                   ; 3
    bne    LFBCB                 ; 2³
    lda    $F8                   ; 3
    cmp    #$20                  ; 2
    lda    $B7                   ; 3
    and    #$DF                  ; 2
    bcs    LFC03                 ; 2³
    ora    #$20                  ; 2
LFC03:
    sta    $B7                   ; 3
    jmp    LFFE4                 ; 3   bankswitch, goto L9100

LFC08:
    lda    #7                    ; 2
    clc                          ; 2
    adc    $9C                   ; 3
    tax                          ; 2
LFC0E:
    lda    SC_58|READ,X          ; 4
    bne    LFC20                 ; 2³
    lda    SC_6C|READ,X          ; 4
    bne    LFC2C                 ; 2³
    lda    $9E,X                 ; 4
    and    #$7F                  ; 2
    sta    $9E,X                 ; 4
    bpl    LFC35                 ; 3   always branch

LFC20:
    lsr                          ; 2
    tay                          ; 2
    lda    LFF00,Y               ; 4
    adc    $F8                   ; 3
    sta    $F8                   ; 3
    lda    SC_6C|READ,X          ; 4
LFC2C:
    lsr                          ; 2
    tay                          ; 2
    lda    LFF00,Y               ; 4
    adc    $F8                   ; 3
    sta    $F8                   ; 3
LFC35:
    dex                          ; 2
    bpl    LFC0E                 ; 2³
    lda    $F8                   ; 3
    cmp    #7                    ; 2
    lda    $B7                   ; 3
    and    #$7F                  ; 2
    bcs    LFC44                 ; 2³
    ora    #$80                  ; 2
LFC44:
    sta    $B7                   ; 3
    ldx    #2                    ; 2
LFC48:
    lda    SC_60|READ,X          ; 4
    ora    SC_74|READ,X          ; 4
    bne    LFC56                 ; 2³
    lda    $A6,X                 ; 4
    and    #$7F                  ; 2
    sta    $A6,X                 ; 4
LFC56:
    dex                          ; 2
    bpl    LFC48                 ; 2³
LFC59:
    jmp    LFFE4                 ; 3   bankswitch, goto L9100

LFC5C:
    lda    SC_44|READ,X          ; 4
    and    #$40                  ; 2
    bne    LFC69                 ; 2³
    lda    $80                   ; 3
    and    #$01                  ; 2
    bne    LFC59                 ; 2³
LFC69:
    lda    $C6,X                 ; 4
    sta    $F8                   ; 3
    bpl    LFC98                 ; 2³
    lda    $F7                   ; 3
    bne    LFC7C                 ; 2³
    lda    INTIM                 ; 4
    cmp    #$85                  ; 2
    bmi    LFC59                 ; 2³
    stx    $F7                   ; 3
LFC7C:
    lda    $C5,X                 ; 4
    and    #$1F                  ; 2
    sta    $F9                   ; 3
    lda    $F8                   ; 3
    and    #$1F                  ; 2
    cmp    $F9                   ; 3
    beq    LFCC1                 ; 2³
    lda    $CF,X                 ; 4
    and    #$03                  ; 2
    bne    LFCC1                 ; 2³
    lda    $C5,X                 ; 4
    ora    #$80                  ; 2
    sta    $C6,X                 ; 4
    bne    LFCCD                 ; 3   always branch

LFC98:
    lda    $C7,X                 ; 4
    bmi    LFCA3                 ; 2³
    lda    INTIM                 ; 4
    cmp    #$85                  ; 2
    bmi    LFC59                 ; 2³
LFCA3:
    lda    $F8                   ; 3
    and    #$20                  ; 2
    bne    LFCB1                 ; 2³
    lda    $CF,X                 ; 4
    cmp    #$7C                  ; 2
    beq    LFCDB                 ; 2³
    bne    LFCB9                 ; 3   always branch

LFCB1:
    lda    $CF,X                 ; 4
    beq    LFCDB                 ; 2³
    cmp    #$7C                  ; 2
    beq    LFCC1                 ; 2³
LFCB9:
    cmp    #0                    ; 2
    beq    LFCC1                 ; 2³
    and    #$03                  ; 2
    beq    LFCDE                 ; 2³
LFCC1:
    lda    $F8                   ; 3
    and    #$20                  ; 2
    bne    LFCCB                 ; 2³
    inc    $CF,X                 ; 6
    bne    LFCCD                 ; 2³
LFCCB:
    dec    $CF,X                 ; 6
LFCCD:
    bit    $F8                   ; 3
    bmi    LFCD5                 ; 2³
    lda    #0                    ; 2
    sta    $F7                   ; 3
LFCD5:
    dex                          ; 2
    bmi    LFC59                 ; 2³
    jmp    LFC5C                 ; 3

LFCDB:
    jmp    LFD38                 ; 3

LFCDE:
    lda    $CF,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    $F8                   ; 3
    eor    #$01                  ; 2
    eor    $9C                   ; 3
    lsr                          ; 2
    and    #$10                  ; 2
    bne    LFCF0                 ; 2³
    iny                          ; 2
    iny                          ; 2
LFCF0:
    dey                          ; 2
    bmi    LFCC1                 ; 2³
    tya                          ; 2
    bcs    LFCF8                 ; 2³
    adc    #$20                  ; 2
LFCF8:
    sta    $FA                   ; 3
    tay                          ; 2
    lda    SC_44|READ,X          ; 4
    and    #$20                  ; 2
    beq    LFD09                 ; 2³
    lda    LFE71,Y               ; 4
    bne    LFD38                 ; 2³
    beq    LFCC1                 ; 3+1   always branch

LFD09:
    lda    $F8                   ; 3
    and    #$1F                  ; 2
    clc                          ; 2
    adc    $9C                   ; 3
    sta    $FB                   ; 3
    beq    LFCC1                 ; 2³+1
    lda    $FA                   ; 3
    and    #$10                  ; 2
    beq    LFD1C                 ; 2³
    lda    #$14                  ; 2
LFD1C:
    adc    $FB                   ; 3
    tay                          ; 2
    lda    SC_57|READ,Y          ; 4
    ldy    $FA                   ; 3
    and    LFE71,Y               ; 4
    beq    LFCC1                 ; 2³+1
    ldy    $FB                   ; 3
    lda.wy $9D,Y                 ; 4
    bpl    LFD38                 ; 2³
    lda    SC_44|READ,X          ; 4
    ora    #$20                  ; 2
    sta    SC_44,X               ; 5
LFD38:
    lda    $F8                   ; 3
    tay                          ; 2
    and    #$1F                  ; 2
    beq    LFD49                 ; 2³
    cmp    #5                    ; 2
    bne    LFD73                 ; 2³
    bit    $F8                   ; 3
    bvc    LFD7A                 ; 2³
    bvs    LFD6E                 ; 3   always branch

LFD49:
    lda    SC_44|READ,X          ; 4
    and    #$20                  ; 2
    beq    LFD5B                 ; 2³
    lda    SC_44|READ,X          ; 4
    and    #$DF                  ; 2
    sta    SC_44,X               ; 5
    jmp    LFD6E                 ; 3

LFD5B:
    lda    $82                   ; 3
    ora    #$20                  ; 2
    sta    $82                   ; 3
    lda    $F7                   ; 3
    beq    LFD6E                 ; 2³
    tay                          ; 2
    lda.wy $C6,Y                 ; 4
    eor    #$A0                  ; 2
    sta.wy $C6,Y                 ; 5
LFD6E:
    lda    $F8                   ; 3
    eor    #$40                  ; 2
    tay                          ; 2
LFD73:
    tya                          ; 2
    and    #$40                  ; 2
    beq    LFD7A                 ; 2³
    iny                          ; 2
    iny                          ; 2
LFD7A:
    dey                          ; 2
    tya                          ; 2
    eor    #$20                  ; 2
    sta    $C6,X                 ; 4
    jmp    LFCCD                 ; 3

;never reached?
    jmp    LFFE4                 ; 3   bankswitch, goto L9100

LFD86:
    .byte $00 ; |        | $FD86
    .byte $00 ; |        | $FD87
    .byte $00 ; |        | $FD88
    .byte $25 ; |  X  X X| $FD89
    .byte $25 ; |  X  X X| $FD8A
    .byte $25 ; |  X  X X| $FD8B
    .byte $25 ; |  X  X X| $FD8C
    .byte $88 ; |X   X   | $FD8D
    .byte $88 ; |X   X   | $FD8E
    .byte $88 ; |X   X   | $FD8F
    .byte $CE ; |XX  XXX | $FD90
    .byte $CE ; |XX  XXX | $FD91
    .byte $CE ; |XX  XXX | $FD92
    .byte $CE ; |XX  XXX | $FD93
    .byte $3E ; |  XXXXX | $FD94
    .byte $3E ; |  XXXXX | $FD95
    .byte $3E ; |  XXXXX | $FD96
    .byte $65 ; | XX  X X| $FD97
    .byte $65 ; | XX  X X| $FD98
    .byte $65 ; | XX  X X| $FD99
    .byte $5D ; | X XXX X| $FD9A
    .byte $5D ; | X XXX X| $FD9B
    .byte $5D ; | X XXX X| $FD9C
    .byte $5D ; | X XXX X| $FD9D
    .byte $5D ; | X XXX X| $FD9E
    .byte $5D ; | X XXX X| $FD9F
    .byte $5D ; | X XXX X| $FDA0
    .byte $5D ; | X XXX X| $FDA1
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
    .byte $00 ; |        | $FDB6
    .byte $00 ; |        | $FDB7
    .byte $00 ; |        | $FDB8
    .byte $00 ; |        | $FDB9
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
    .byte $00 ; |        | $FDF0
    .byte $00 ; |        | $FDF1
    .byte $00 ; |        | $FDF2
    .byte $00 ; |        | $FDF3
    .byte $00 ; |        | $FDF4
    .byte $00 ; |        | $FDF5
    .byte $00 ; |        | $FDF6
    .byte $00 ; |        | $FDF7
    .byte $00 ; |        | $FDF8
    .byte $00 ; |        | $FDF9
    .byte $00 ; |        | $FDFA
    .byte $00 ; |        | $FDFB
    .byte $00 ; |        | $FDFC
    .byte $00 ; |        | $FDFD
    .byte $00 ; |        | $FDFE
    .byte $00 ; |        | $FDFF
LFE00:
    .byte $00 ; |        | $FE00
    .byte $00 ; |        | $FE01
    .byte $00 ; |        | $FE02
    .byte $01 ; |       X| $FE03
    .byte $01 ; |       X| $FE04
    .byte $01 ; |       X| $FE05
    .byte $02 ; |      X | $FE06
    .byte $02 ; |      X | $FE07
    .byte $02 ; |      X | $FE08
    .byte $03 ; |      XX| $FE09
    .byte $03 ; |      XX| $FE0A
    .byte $03 ; |      XX| $FE0B
    .byte $04 ; |     X  | $FE0C
    .byte $04 ; |     X  | $FE0D
    .byte $04 ; |     X  | $FE0E
    .byte $05 ; |     X X| $FE0F
    .byte $05 ; |     X X| $FE10
    .byte $05 ; |     X X| $FE11
    .byte $06 ; |     XX | $FE12
    .byte $06 ; |     XX | $FE13
    .byte $06 ; |     XX | $FE14
    .byte $07 ; |     XXX| $FE15
    .byte $07 ; |     XXX| $FE16
    .byte $07 ; |     XXX| $FE17
    .byte $08 ; |    X   | $FE18
    .byte $08 ; |    X   | $FE19
    .byte $08 ; |    X   | $FE1A
    .byte $09 ; |    X  X| $FE1B
    .byte $09 ; |    X  X| $FE1C
    .byte $09 ; |    X  X| $FE1D
    .byte $0A ; |    X X | $FE1E
    .byte $0A ; |    X X | $FE1F
    .byte $0A ; |    X X | $FE20
    .byte $0B ; |    X XX| $FE21
    .byte $0B ; |    X XX| $FE22
    .byte $0B ; |    X XX| $FE23
    .byte $0C ; |    XX  | $FE24
    .byte $0C ; |    XX  | $FE25
    .byte $0C ; |    XX  | $FE26
    .byte $0D ; |    XX X| $FE27
    .byte $0D ; |    XX X| $FE28
    .byte $0D ; |    XX X| $FE29
    .byte $0E ; |    XXX | $FE2A
    .byte $0E ; |    XXX | $FE2B
    .byte $0E ; |    XXX | $FE2C
    .byte $0F ; |    XXXX| $FE2D
    .byte $0F ; |    XXXX| $FE2E
    .byte $0F ; |    XXXX| $FE2F
    .byte $10 ; |   X    | $FE30
    .byte $10 ; |   X    | $FE31
    .byte $10 ; |   X    | $FE32
    .byte $11 ; |   X   X| $FE33
    .byte $11 ; |   X   X| $FE34
    .byte $11 ; |   X   X| $FE35
    .byte $12 ; |   X  X | $FE36
    .byte $12 ; |   X  X | $FE37
    .byte $12 ; |   X  X | $FE38
    .byte $13 ; |   X  XX| $FE39
    .byte $13 ; |   X  XX| $FE3A
    .byte $13 ; |   X  XX| $FE3B
    .byte $14 ; |   X X  | $FE3C
    .byte $14 ; |   X X  | $FE3D
    .byte $14 ; |   X X  | $FE3E
LFE3F:
    .byte $00 ; |        | $FE3F
    .byte $00 ; |        | $FE40
    .byte $01 ; |       X| $FE41
    .byte $18 ; |   XX   | $FE42
    .byte $41 ; | X     X| $FE43
    .byte $00 ; |        | $FE44
    .byte $00 ; |        | $FE45
    .byte $00 ; |        | $FE46
    .byte $01 ; |       X| $FE47
    .byte $00 ; |        | $FE48
    .byte $40 ; | X      | $FE49
    .byte $03 ; |      XX| $FE4A
    .byte $10 ; |   X    | $FE4B
    .byte $80 ; |X       | $FE4C
    .byte $20 ; |  X     | $FE4D
    .byte $01 ; |       X| $FE4E
    .byte $00 ; |        | $FE4F
    .byte $00 ; |        | $FE50
    .byte $00 ; |        | $FE51
    .byte $00 ; |        | $FE52
LFE53:
    .byte $00 ; |        | $FE53
    .byte $00 ; |        | $FE54
    .byte $40 ; | X      | $FE55
    .byte $00 ; |        | $FE56
    .byte $00 ; |        | $FE57
    .byte $20 ; |  X     | $FE58
    .byte $42 ; | X    X | $FE59
    .byte $08 ; |    X   | $FE5A
    .byte $80 ; |X       | $FE5B
    .byte $02 ; |      X | $FE5C
    .byte $00 ; |        | $FE5D
    .byte $10 ; |   X    | $FE5E
    .byte $10 ; |   X    | $FE5F
    .byte $00 ; |        | $FE60
    .byte $00 ; |        | $FE61
    .byte $40 ; | X      | $FE62
    .byte $0A ; |    X X | $FE63
    .byte $30 ; |  XX    | $FE64
    .byte $84 ; |X    X  | $FE65
    .byte $00 ; |        | $FE66
LFE67:
    .byte $00 ; |        | $FE67
    .byte $20 ; |  X     | $FE68
    .byte $30 ; |  XX    | $FE69
    .byte $40 ; | X      | $FE6A
    .byte $50 ; | X X    | $FE6B
LFE6C:
    .byte $00 ; |        | $FE6C
    .byte $12 ; |   X  X | $FE6D
    .byte $0F ; |    XXXX| $FE6E
    .byte $11 ; |   X   X| $FE6F
    .byte $08 ; |    X   | $FE70
LFE71:
    .byte $00 ; |        | $FE71
    .byte $40 ; | X      | $FE72
    .byte $00 ; |        | $FE73
    .byte $10 ; |   X    | $FE74
    .byte $00 ; |        | $FE75
    .byte $04 ; |     X  | $FE76
    .byte $00 ; |        | $FE77
    .byte $01 ; |       X| $FE78
    .byte $00 ; |        | $FE79
    .byte $02 ; |      X | $FE7A
    .byte $00 ; |        | $FE7B
    .byte $08 ; |    X   | $FE7C
    .byte $00 ; |        | $FE7D
    .byte $20 ; |  X     | $FE7E
    .byte $00 ; |        | $FE7F
    .byte $80 ; |X       | $FE80
    .byte $00 ; |        | $FE81
    .byte $40 ; | X      | $FE82
    .byte $00 ; |        | $FE83
    .byte $10 ; |   X    | $FE84
    .byte $00 ; |        | $FE85
    .byte $04 ; |     X  | $FE86
    .byte $00 ; |        | $FE87
    .byte $01 ; |       X| $FE88
    .byte $00 ; |        | $FE89
    .byte $02 ; |      X | $FE8A
    .byte $00 ; |        | $FE8B
    .byte $08 ; |    X   | $FE8C
    .byte $00 ; |        | $FE8D
    .byte $20 ; |  X     | $FE8E
    .byte $00 ; |        | $FE8F
    .byte $80 ; |X       | $FE90
LFE91:
    .byte $80 ; |X       | $FE91
    .byte $00 ; |        | $FE92
    .byte $20 ; |  X     | $FE93
    .byte $00 ; |        | $FE94
    .byte $08 ; |    X   | $FE95
    .byte $00 ; |        | $FE96
    .byte $02 ; |      X | $FE97
    .byte $00 ; |        | $FE98
    .byte $01 ; |       X| $FE99
    .byte $00 ; |        | $FE9A
    .byte $04 ; |     X  | $FE9B
    .byte $00 ; |        | $FE9C
    .byte $10 ; |   X    | $FE9D
    .byte $00 ; |        | $FE9E
    .byte $40 ; | X      | $FE9F
    .byte $00 ; |        | $FEA0
    .byte $80 ; |X       | $FEA1
    .byte $00 ; |        | $FEA2
    .byte $20 ; |  X     | $FEA3
    .byte $00 ; |        | $FEA4
    .byte $08 ; |    X   | $FEA5
    .byte $00 ; |        | $FEA6
    .byte $02 ; |      X | $FEA7
    .byte $00 ; |        | $FEA8
    .byte $01 ; |       X| $FEA9
    .byte $00 ; |        | $FEAA
    .byte $04 ; |     X  | $FEAB
    .byte $00 ; |        | $FEAC
    .byte $10 ; |   X    | $FEAD
    .byte $00 ; |        | $FEAE
    .byte $40 ; | X      | $FEAF
    .byte $00 ; |        | $FEB0
    .byte $00 ; |        | $FEB1
    .byte $00 ; |        | $FEB2
    .byte $00 ; |        | $FEB3
    .byte $00 ; |        | $FEB4
    .byte $00 ; |        | $FEB5
    .byte $00 ; |        | $FEB6
    .byte $00 ; |        | $FEB7
    .byte $00 ; |        | $FEB8
    .byte $00 ; |        | $FEB9
    .byte $00 ; |        | $FEBA
    .byte $00 ; |        | $FEBB
    .byte $00 ; |        | $FEBC
    .byte $00 ; |        | $FEBD
    .byte $00 ; |        | $FEBE
    .byte $00 ; |        | $FEBF
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
    .byte $00 ; |        | $FEE0
    .byte $00 ; |        | $FEE1
    .byte $00 ; |        | $FEE2
    .byte $00 ; |        | $FEE3
    .byte $00 ; |        | $FEE4
    .byte $00 ; |        | $FEE5
    .byte $00 ; |        | $FEE6
    .byte $00 ; |        | $FEE7
    .byte $00 ; |        | $FEE8
    .byte $00 ; |        | $FEE9
    .byte $00 ; |        | $FEEA
    .byte $00 ; |        | $FEEB
    .byte $00 ; |        | $FEEC
    .byte $00 ; |        | $FEED
    .byte $00 ; |        | $FEEE
    .byte $00 ; |        | $FEEF
    .byte $00 ; |        | $FEF0
    .byte $00 ; |        | $FEF1
    .byte $00 ; |        | $FEF2
    .byte $00 ; |        | $FEF3
    .byte $00 ; |        | $FEF4
    .byte $00 ; |        | $FEF5
    .byte $00 ; |        | $FEF6
    .byte $00 ; |        | $FEF7
    .byte $00 ; |        | $FEF8
    .byte $00 ; |        | $FEF9
    .byte $00 ; |        | $FEFA
    .byte $00 ; |        | $FEFB
    .byte $00 ; |        | $FEFC
    .byte $00 ; |        | $FEFD
    .byte $00 ; |        | $FEFE
    .byte $00 ; |        | $FEFF
LFF00:
    .byte $00 ; |        | $FF00
    .byte $01 ; |       X| $FF01
    .byte $01 ; |       X| $FF02
    .byte $02 ; |      X | $FF03
    .byte $01 ; |       X| $FF04
    .byte $02 ; |      X | $FF05
    .byte $02 ; |      X | $FF06
    .byte $03 ; |      XX| $FF07
    .byte $01 ; |       X| $FF08
    .byte $02 ; |      X | $FF09
    .byte $02 ; |      X | $FF0A
    .byte $03 ; |      XX| $FF0B
    .byte $02 ; |      X | $FF0C
    .byte $03 ; |      XX| $FF0D
    .byte $03 ; |      XX| $FF0E
    .byte $04 ; |     X  | $FF0F
    .byte $01 ; |       X| $FF10
    .byte $02 ; |      X | $FF11
    .byte $02 ; |      X | $FF12
    .byte $03 ; |      XX| $FF13
    .byte $02 ; |      X | $FF14
    .byte $03 ; |      XX| $FF15
    .byte $03 ; |      XX| $FF16
    .byte $04 ; |     X  | $FF17
    .byte $02 ; |      X | $FF18
    .byte $03 ; |      XX| $FF19
    .byte $03 ; |      XX| $FF1A
    .byte $04 ; |     X  | $FF1B
    .byte $03 ; |      XX| $FF1C
    .byte $04 ; |     X  | $FF1D
    .byte $04 ; |     X  | $FF1E
    .byte $05 ; |     X X| $FF1F
    .byte $01 ; |       X| $FF20
    .byte $02 ; |      X | $FF21
    .byte $02 ; |      X | $FF22
    .byte $03 ; |      XX| $FF23
    .byte $02 ; |      X | $FF24
    .byte $03 ; |      XX| $FF25
    .byte $03 ; |      XX| $FF26
    .byte $04 ; |     X  | $FF27
    .byte $02 ; |      X | $FF28
    .byte $03 ; |      XX| $FF29
    .byte $03 ; |      XX| $FF2A
    .byte $04 ; |     X  | $FF2B
    .byte $03 ; |      XX| $FF2C
    .byte $04 ; |     X  | $FF2D
    .byte $04 ; |     X  | $FF2E
    .byte $05 ; |     X X| $FF2F
    .byte $02 ; |      X | $FF30
    .byte $03 ; |      XX| $FF31
    .byte $03 ; |      XX| $FF32
    .byte $04 ; |     X  | $FF33
    .byte $03 ; |      XX| $FF34
    .byte $04 ; |     X  | $FF35
    .byte $04 ; |     X  | $FF36
    .byte $05 ; |     X X| $FF37
    .byte $03 ; |      XX| $FF38
    .byte $04 ; |     X  | $FF39
    .byte $04 ; |     X  | $FF3A
    .byte $05 ; |     X X| $FF3B
    .byte $04 ; |     X  | $FF3C
    .byte $05 ; |     X X| $FF3D
    .byte $05 ; |     X X| $FF3E
    .byte $06 ; |     XX | $FF3F
    .byte $01 ; |       X| $FF40
    .byte $02 ; |      X | $FF41
    .byte $02 ; |      X | $FF42
    .byte $03 ; |      XX| $FF43
    .byte $02 ; |      X | $FF44
    .byte $03 ; |      XX| $FF45
    .byte $03 ; |      XX| $FF46
    .byte $04 ; |     X  | $FF47
    .byte $02 ; |      X | $FF48
    .byte $03 ; |      XX| $FF49
    .byte $03 ; |      XX| $FF4A
    .byte $04 ; |     X  | $FF4B
    .byte $03 ; |      XX| $FF4C
    .byte $04 ; |     X  | $FF4D
    .byte $04 ; |     X  | $FF4E
    .byte $05 ; |     X X| $FF4F
    .byte $02 ; |      X | $FF50
    .byte $03 ; |      XX| $FF51
    .byte $03 ; |      XX| $FF52
    .byte $04 ; |     X  | $FF53
    .byte $03 ; |      XX| $FF54
    .byte $04 ; |     X  | $FF55
    .byte $04 ; |     X  | $FF56
    .byte $05 ; |     X X| $FF57
    .byte $03 ; |      XX| $FF58
    .byte $04 ; |     X  | $FF59
    .byte $04 ; |     X  | $FF5A
    .byte $05 ; |     X X| $FF5B
    .byte $04 ; |     X  | $FF5C
    .byte $05 ; |     X X| $FF5D
    .byte $05 ; |     X X| $FF5E
    .byte $06 ; |     XX | $FF5F
    .byte $02 ; |      X | $FF60
    .byte $03 ; |      XX| $FF61
    .byte $03 ; |      XX| $FF62
    .byte $04 ; |     X  | $FF63
    .byte $03 ; |      XX| $FF64
    .byte $04 ; |     X  | $FF65
    .byte $04 ; |     X  | $FF66
    .byte $05 ; |     X X| $FF67
    .byte $03 ; |      XX| $FF68
    .byte $04 ; |     X  | $FF69
    .byte $04 ; |     X  | $FF6A
    .byte $05 ; |     X X| $FF6B
    .byte $04 ; |     X  | $FF6C
    .byte $05 ; |     X X| $FF6D
    .byte $05 ; |     X X| $FF6E
    .byte $06 ; |     XX | $FF6F
    .byte $03 ; |      XX| $FF70
    .byte $04 ; |     X  | $FF71
    .byte $04 ; |     X  | $FF72
    .byte $05 ; |     X X| $FF73
    .byte $04 ; |     X  | $FF74
    .byte $05 ; |     X X| $FF75
    .byte $05 ; |     X X| $FF76
    .byte $06 ; |     XX | $FF77
    .byte $04 ; |     X  | $FF78
    .byte $05 ; |     X X| $FF79
    .byte $05 ; |     X X| $FF7A
    .byte $06 ; |     XX | $FF7B
    .byte $05 ; |     X X| $FF7C
    .byte $06 ; |     XX | $FF7D
    .byte $06 ; |     XX | $FF7E
    .byte $07 ; |     XXX| $FF7F
    .byte $20 ; |  X     | $FF80
    .byte $44 ; | X   X  | $FF81
    .byte $41 ; | X     X| $FF82
    .byte $56 ; | X X XX | $FF83
    .byte $45 ; | X   X X| $FF84
    .byte $20 ; |  X     | $FF85
    .byte $53 ; | X X  XX| $FF86
    .byte $54 ; | X X X  | $FF87
    .byte $41 ; | X     X| $FF88
    .byte $55 ; | X X X X| $FF89
    .byte $47 ; | X   XXX| $FF8A
    .byte $41 ; | X     X| $FF8B
    .byte $53 ; | X X  XX| $FF8C
    .byte $20 ; |  X     | $FF8D
    .byte $4C ; | X  XX  | $FF8E
    .byte $4F ; | X  XXXX| $FF8F
    .byte $56 ; | X X XX | $FF90
    .byte $45 ; | X   X X| $FF91
    .byte $53 ; | X X  XX| $FF92
    .byte $20 ; |  X     | $FF93
    .byte $42 ; | X    X | $FF94
    .byte $45 ; | X   X X| $FF95
    .byte $41 ; | X     X| $FF96
    .byte $54 ; | X X X  | $FF97
    .byte $52 ; | X X  X | $FF98
    .byte $49 ; | X  X  X| $FF99
    .byte $43 ; | X    XX| $FF9A
    .byte $45 ; | X   X X| $FF9B
    .byte $20 ; |  X     | $FF9C
    .byte $48 ; | X  X   | $FF9D
    .byte $41 ; | X     X| $FF9E
    .byte $42 ; | X    X | $FF9F
    .byte $4C ; | X  XX  | $FFA0
    .byte $49 ; | X  X  X| $FFA1
    .byte $47 ; | X   XXX| $FFA2
    .byte $20 ; |  X     | $FFA3
    .byte $00 ; |        | $FFA4
    .byte $00 ; |        | $FFA5
    .byte $00 ; |        | $FFA6
    .byte $00 ; |        | $FFA7
    .byte $00 ; |        | $FFA8
    .byte $00 ; |        | $FFA9
    .byte $00 ; |        | $FFAA
    .byte $00 ; |        | $FFAB
    .byte $00 ; |        | $FFAC
    .byte $00 ; |        | $FFAD
    .byte $00 ; |        | $FFAE
    .byte $00 ; |        | $FFAF
    .byte $00 ; |        | $FFB0
    .byte $00 ; |        | $FFB1
    .byte $00 ; |        | $FFB2
    .byte $00 ; |        | $FFB3
    .byte $00 ; |        | $FFB4
    .byte $00 ; |        | $FFB5
    .byte $00 ; |        | $FFB6
    .byte $00 ; |        | $FFB7
    .byte $00 ; |        | $FFB8
    .byte $00 ; |        | $FFB9
    .byte $00 ; |        | $FFBA
    .byte $00 ; |        | $FFBB
    .byte $00 ; |        | $FFBC
    .byte $00 ; |        | $FFBD
    .byte $00 ; |        | $FFBE
    .byte $00 ; |        | $FFBF
    .byte $00 ; |        | $FFC0
    .byte $00 ; |        | $FFC1
    .byte $00 ; |        | $FFC2
    .byte $00 ; |        | $FFC3
    .byte $00 ; |        | $FFC4
    .byte $00 ; |        | $FFC5
    .byte $00 ; |        | $FFC6
    .byte $00 ; |        | $FFC7
    .byte $00 ; |        | $FFC8
    .byte $00 ; |        | $FFC9
    .byte $00 ; |        | $FFCA
    .byte $00 ; |        | $FFCB
    .byte $00 ; |        | $FFCC
    .byte $00 ; |        | $FFCD
    .byte $00 ; |        | $FFCE
    .byte $00 ; |        | $FFCF
    .byte $00 ; |        | $FFD0
    .byte $00 ; |        | $FFD1
    .byte $00 ; |        | $FFD2
    .byte $00 ; |        | $FFD3
    .byte $00 ; |        | $FFD4
    .byte $00 ; |        | $FFD5
    .byte $00 ; |        | $FFD6
    .byte $00 ; |        | $FFD7
    .byte $00 ; |        | $FFD8
    .byte $00 ; |        | $FFD9
    .byte $00 ; |        | $FFDA
    .byte $00 ; |        | $FFDB
    .byte $00 ; |        | $FFDC
    .byte $00 ; |        | $FFDD
    .byte $00 ; |        | $FFDE
    .byte $00 ; |        | $FFDF
    .byte $00 ; |        | $FFE0
    .byte $00 ; |        | $FFE1
    .byte $00 ; |        | $FFE2
    .byte $00 ; |        | $FFE3

LFFE4:
    lda    BANK_0                ; 4   bankswitch, goto L9100

;coming from bank 2
    jmp    LF301                 ; 3
    lda    BANK_3                ; 4   space filler... already in bank 3
    jmp.w  $0000                 ; 3   space filler...
    lda    BANK_3                ; 4   space filler...

;coming from all other banks
    jmp    START                 ; 3

    .byte $00 ; |        | $FFF6
    .byte $00 ; |        | $FFF7
    .byte $00 ; |        | $FFF8
    .byte $00 ; |        | $FFF9

       ORG $5FFA
      RORG $FFFA

    .word START,START,START