; Rough Disassembly of Dig Dug (NTSC) includes an infinite lives hack
; By Omegamatrix
; Using DiStella v3.0
;
;
; Dig Dug uses Atari's Superchip. The Superchip (SC) provides an extra 128 bytes of ram for the game.
; The address for the SC ram is from $x000 - $x0FF, where "x" is an odd hex number (either 1,3,5,7,9,B,D, or F).
; In a normal Atari game tne location of the SC ram would be rom space. The consequence of the Superchip is that
; you lose the first 256 bytes (called a page) out of EVERY 4K bank of rom space. You might be wondering why 256
; bytes when the SC only has 128 bytes. It has to do with how the SC ram gets addressed...
;
;    0 1 1 1 1 1 1 1  (binary number 01111111, hex number $7F, decimal number 127)
;    | | | | | | | |
;    | | | | | | | 0
;    | | | | | | 1
;    | | | | | 2
;    | | | | 3
;    | | | 4
;    | | 5
;    | 6
;    7 ----- bit 7 (0 for write, 1 for read)
;
;
; Because we are using 0 as an address; the 128 bytes of Superchip ram are referred to as being from 0 to 127. In
; decimal that is 0 to 127, in hexidecimal that is $00 to $7F, and in binary that is 00000000 to 01111111. By looking at
; the decimal representation we can see the far left bit (bit 7) is always zero. The setting or clearing of "bit 7" lets you
; choose to either read or write to a particular SC ram register. For the SC it has to be done this way. The consequence is
; double the address space is needed for the ram. In this disassembly the superchip ram is labelled as "sc_xx". When reading
; a particular SC register bit 7 has to be set so a "bitwise OR" is done.
;
;
; As a final note, the SC needs the first page out of every 4K bank, but the ram is mirrored. You don't get anymore then those
; 128 bytes. No matter what bank you are in you still only see those 128 bytes.
;
;
; Thank you to Kevin Horton for his explaination on bankswitching types. I was pulling out my hair until I RTFM, lol.
;
;
;
;configuration files
;
;Dig1.cfg
;      ORG 9000
;      DATA 9000 90FF
;      CODE 9100 91EC
;      GFX 91ED 91FF
;      CODE 9200 9456
;      GFX 9457 94FF
;      CODE 9500 95E8
;      GFX 95E9 95FF
;      CODE 9600 967A
;      GFX 967B 96FF
;      CODE 9700 9862
;      GFX 9863 99F2
;      CODE 99F3 99F9
;      GFX 99FA 9BB0
;      CODE 9BB1 9CFB
;      GFX 9CFC 9EFF
;      CODE 9F00 9FDB
;      GFX 9FDC 9FDD
;      CODE 9FDE 9FE9
;      GFX 9FEA 9FEC
;      CODE 9FED 9FF5
;      GFX 9FF6 9FFF
;
;Dig2.cfg
;      ORG B000
;      DATA B000 B0FF
;      CODE B100 B102
;      GFX B103 B188
;      CODE B189 B2C6
;      GFX B2C7 B35F
;      CODE B360 B86B
;      GFX B86C BFE6
;      CODE BFE7 BFF5
;      GFX BFF6 BFFF
;
;Dig3.cfg
;      ORG D000
;      DATA D000 D0FF
;      CODE D100 DF39
;      GFX DF3A DFDA
;      CODE DFDB DFF5
;      GFX DFF6 DFFF
;
;Dig4.cfg
;      ORG F000
;      DATA F000 F0FF
;      CODE F100 F2BE
;      GFX F2BF F2C4
;      CODE F2C5 FAFB
;      GFX FAFC FB2E
;      CODE FB2F FBCC
;      GFX FBCD FBEC
;      CODE FBED FEDF
;      GFX FEE0 FFDD
;      CODE FFDE FFE0
;      GFX FFE1 FFE3
;      CODE FFE4 FFF2
;      GFX FFF3 FFFF


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

BANK_0        =  $FFF6
BANK_1        =  $FFF7
BANK_2        =  $FFF8
BANK_3        =  $FFF9

READ          =  $0080
MIRROR        =  $0100

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      USER SWITCHES
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 1 = ON, 0 = OFF

INFINITE_LIVES  =  0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


        SEG.U RamVariables
        ORG $80

ram_80             ds 1  ; x29
ram_81             ds 1  ; x31
ram_82             ds 1  ; x4
ram_83             ds 1  ; x31
ram_84             ds 1  ; x4
ram_85             ds 1  ; x8
ram_86             ds 1  ; x3
ram_87             ds 1  ; x3
ram_88             ds 1  ; x3
ram_89             ds 1  ; x3
ram_8A             ds 1  ; x3
ram_8B             ds 1  ; x3
ram_8C             ds 1  ; x3
ram_8D             ds 1  ; x3
ram_8E             ds 1  ; x3
ram_8F             ds 1  ; x9
ram_90             ds 1  ; x9
ram_91             ds 1  ; x2
ram_92             ds 21 ; x1
ram_A7             ds 1  ; x2
ram_A8             ds 21 ; x1
ram_BD             ds 1  ; x13
ram_BE             ds 1  ; x8
ram_BF             ds 1  ; x3
ram_C0             ds 1  ; x4
ram_C1             ds 1  ; x1
ram_C2             ds 1  ; x3
ram_C3             ds 1  ; x1
ram_C4             ds 1  ; x3
ram_C5             ds 1  ; x1
ram_C6             ds 1  ; x3
ram_C7             ds 3  ; x1
ram_CA             ds 1  ; x5
ram_CB             ds 1  ; x3
ram_CC             ds 1  ; x3
ram_CD             ds 1  ; x9
ram_CE             ds 1  ; x11
ram_CF             ds 1  ; x10
ram_D0             ds 1  ; x10
ram_D1             ds 1  ; x3
ram_D2             ds 1  ; x6
ram_D3             ds 1  ; x11
ram_D4             ds 1  ; x7
ram_D5             ds 1  ; x121
ram_D6             ds 1  ; x45
ram_D7             ds 1  ; x45
ram_D8             ds 1  ; x21
ram_D9             ds 1  ; x56
ram_DA             ds 1  ; x15
ram_DB             ds 1  ; x18
ram_DC             ds 1  ; x16
ram_DD             ds 1  ; x22
ram_DE             ds 1  ; x6
ram_DF             ds 1  ; x28
ram_E0             ds 1  ; x1
ram_E1             ds 1  ; x3
ram_E2             ds 1  ; x1
ram_E3             ds 1  ; x11
ram_E4             ds 1  ; x1
ram_E5             ds 1  ; x8
ram_E6             ds 3  ; x8
ram_E9             ds 1  ; x4
ram_EA             ds 1  ; x8
ram_EB             ds 1  ; x2
ram_EC             ds 1  ; x42
ram_ED             ds 1  ; x18
ram_EE             ds 1  ; x34
ram_EF             ds 1  ; x22
ram_F0             ds 1  ; x29
ram_F1             ds 1  ; x18
framecounter       ds 1  ; x16
ram_F3             ds 1  ; x50
ram_F4             ds 1  ; x19
ram_F5             ds 1  ; x13
ram_F6             ds 1  ; x28
ram_F7             ds 1  ; x16
ram_F8             ds 1  ; x30
ram_F9             ds 7  ; x50


        SEG.U SuperchipRam
        ORG $F000

;superchip ram assignment
numOfLives         ds 1
sc_01              ds 1
sc_02              ds 6
sc_08              ds 1
sc_09              ds 1
sc_0A              ds 1
sc_0B              ds 4
sc_0F              ds 1
sc_10              ds 1
sc_11              ds 1
sc_12              ds 1
sc_13              ds 1
sc_14              ds 1
sc_15              ds 1
sc_16              ds 3
sc_19              ds 1
sc_1A              ds 1
sc_1B              ds 1
sc_1C              ds 1
sc_1D              ds 2
sc_1F              ds 39
sc_46              ds 1
sc_47              ds 38
sc_6D              ds 1
sc_6E              ds 1
sc_6F              ds 1
sc_70              ds 1
sc_71              ds 7
sc_78              ds 1
sc_79              ds 1
sc_7A              ds 1
sc_7B              ds 1
sc_7C              ds 1
sc_7D              ds 1
sc_7E              ds 1
sc_7F              ds 1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MACROS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  MAC SC_RAM_SPACE
    REPEAT {1}
      .byte $FF
    REPEND
  ENDM

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 0
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        SEG code

        ORG $1000
       RORG $9000

    SC_RAM_SPACE 256

START_BANK_0:
    lda    BANK_3                ; 4   bankswitch, do clear loop

L9103:
    stx    GRP0|MIRROR           ; 4   uses an extra cycle
    lda    #$9B                  ; 2
    sta    ram_BF                ; 3
    sta    ram_C1                ; 3
    sta    ram_C3                ; 3
    sta    ram_C5                ; 3
    sta    ram_C7                ; 3
    lda    numOfLives|READ       ; 4
    and    #$07                  ; 2
    tay                          ; 2
    lda    #3                    ; 2
    sta    VDELP0                ; 3
    sta    RESP0|MIRROR          ; 4   uses an extra cycle
    sta    RESP1                 ; 3
    sta    VDELP1                ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    L98F4,Y               ; 4
    sta    PF2                   ; 3
    lda    L9DF8,Y               ; 4
    sta    HMOVE                 ; 3
    sta    PF1                   ; 3   draw lives display
    stx    COLUPF                ; 3
    stx    PF0                   ; 3
    ldy    #$50                  ; 2
    sec                          ; 2
    lda    ram_80                ; 3
    bne    L9142                 ; 2³
    lda    #$58                  ; 2
    bne    L914E                 ; 3   always branch

L9142:
    lda    sc_7F|READ            ; 4
    and    #$F0                  ; 2
    bne    L914D                 ; 2³
    sty    ram_BE                ; 3
    beq    L9150                 ; 3   always branch

L914D:
    lsr                          ; 2
L914E:
    sta    ram_BE                ; 3
L9150:
    lda    sc_7F|READ            ; 4
    and    #$0F                  ; 2
    bcc    L915D                 ; 2³
    bne    L915D                 ; 2³
    sty    ram_C0                ; 3
    beq    L9162                 ; 3   always branch

L915D:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_C0                ; 3
L9162:
    lda    sc_7E|READ            ; 4
    and    #$F0                  ; 2
    bcc    L916F                 ; 2³
    bne    L916F                 ; 2³
    sty    ram_C2                ; 3
    beq    L9172                 ; 3   always branch

L916F:
    lsr                          ; 2
    sta    ram_C2                ; 3
L9172:
    lda    sc_7E|READ            ; 4
    and    #$0F                  ; 2
    bcc    L917F                 ; 2³
    bne    L917F                 ; 2³
    sty    ram_C4                ; 3
    beq    L9184                 ; 3   always branch

L917F:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_C4                ; 3
L9184:
    lda    sc_7D|READ            ; 4
    and    #$F0                  ; 2
    bcc    L9191                 ; 2³
    bne    L9191                 ; 2³
    sty    ram_C6                ; 3
    beq    L9194                 ; 3   always branch

L9191:
    lsr                          ; 2
    sta    ram_C6                ; 3
L9194:
    ldx    #$CD                  ; 2
    txs                          ; 2
    lda    #$6C                  ; 2
    pha                          ; 3
    lda    #$C6                  ; 2
    pha                          ; 3
    pha                          ; 3
    pha                          ; 3
    lda    #$6C                  ; 2
    pha                          ; 3
    lda    #$38                  ; 2
    pha                          ; 3
    sta    ram_CE                ; 3
    ldy    #6                    ; 2
    sty    ram_EC                ; 3
    lda    #$36                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
L91B3:
    sta    COLUPF                ; 3
    lda    (ram_BE),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_C0),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_C2),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_C4),Y            ; 5
    tax                          ; 2
    lda    (ram_C6),Y            ; 5
    tay                          ; 2
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    pla                          ; 4
    dec    ram_EC                ; 5
    stx    GRP1|MIRROR           ; 4   uses an extra cycle
    sty    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    #$36                  ; 2
    ldy    ram_EC                ; 3
    bpl    L91B3                 ; 2³
    iny                          ; 2
    sty    VDELP0                ; 3
    sty    VDELP1                ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    jmp    L9FE4                 ; 3   goto LF14D

    .byte $11 ; |   X   X| $91ED
    .byte $3C ; |  XXXX  | $91EE
    .byte $F8 ; |XXXXX   | $91EF
    .byte $21 ; |  X    X| $91F0
    .byte $25 ; |  X  X X| $91F1
    .byte $03 ; |      XX| $91F2
    .byte $CD ; |XX  XX X| $91F3
    .byte $18 ; |   XX   | $91F4
    .byte $02 ; |      X | $91F5
    .byte $D1 ; |XX X   X| $91F6
    .byte $E1 ; |XXX    X| $91F7
    .byte $C9 ; |XX  X  X| $91F8
    .byte $E5 ; |XXX  X X| $91F9
    .byte $11 ; |   X   X| $91FA
    .byte $A0 ; |X X     | $91FB
    .byte $F8 ; |XXXXX   | $91FC
    .byte $21 ; |  X    X| $91FD
    .byte $32 ; |  XX  X | $91FE
    .byte $03 ; |      XX| $91FF

L9200:
    lda    #0                    ; 2
    sta    framecounter          ; 3   reset framecounter
    sta    ram_F0                ; 3

FinishVblank:
.waitVblankEnd:
    ldy    INTIM                 ; 4
    bne    .waitVblankEnd        ; 2³

    ldy    #6                    ; 2
.loopSixLines:
    sta    WSYNC                 ; 3   do 6 more scanlines of Vblank
;---------------------------------------
    dey                          ; 2
    bne    .loopSixLines         ; 2³

    sty    VBLANK                ; 3   Vblank ends
    sty    HMCLR                 ; 3
    ldx    #$FF                  ; 2   reset the stack pointer
    txs                          ; 2
    iny                          ; 2   Y=1
    sty    ram_D7                ; 3
    sty    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2   Y=0
    sty    GRP0                  ; 3   clear player sprites,
    sty    GRP1                  ; 3   and get "fine position"
    lda    #$80                  ; 2   right 8
    sta    HMP0                  ; 3
    lda    #$90                  ; 2   right 7
    sta    HMP1                  ; 3
    pha                          ; 3   kill 16 cycles
    pla                          ; 4
    pha                          ; 3
    pla                          ; 4
    nop                          ;+2 = @34
    sta    RESP0                 ; 3   get "rough position"
    sta    RESP1                 ; 3
    ldy    sc_1A|READ            ; 4
    dey                          ; 2
    bne    L9248                 ; 2³
    lda    sc_1B|READ            ; 4
    cmp    #$45                  ; 2
    bcc    L9248                 ; 2³
    lda    #$BB                  ; 2
    adc    sc_1B|READ            ; 4
    sta    ram_D7                ; 3
L9248:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3   reposition sprites (P0 @ $38, P1 @ $40)
    ldy    #$34                  ; 2   "Dig Dug" logo height
    lda    #3                    ; 2
    sta    VDELP0                ; 3   use delay
    sta    VDELP1                ; 3
    sta    NUSIZ0                ; 3   3 copies (close)
    sta    NUSIZ1                ; 3
    ldx    #9                    ;+2 = @21

.delay44cycles:
    dex                          ; 2
    bne    .delay44cycles        ; 2³  buffer to start the drawing loop at the correct cycle

; 21 + 44 = @65 cycles

L925D:
    lda    L945E,Y               ; 4
    sta    GRP0|MIRROR           ; 4   uses an extra cycle
    lda    L9A73,Y               ; 4
    sta    GRP1                  ; 3
    lda    L9A00,Y               ; 4
    sta    GRP0                  ; 3
    lda    L987B,Y               ; 4
    sta    ram_EC                ; 3
    lda    L9998,Y               ; 4
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sty    ram_EE                ; 3
    lda    L98AF,Y               ; 4
    ldx    L9AA7,Y               ; 4
    ldy    ram_EC                ; 3
    stx    GRP1                  ; 3
    sty    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    ldy    ram_EE                ; 3
    dey                          ; 2
    cpy    ram_D7                ; 3
    bcs    L925D                 ; 2³

    lda    #0                    ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    REFP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    ram_D7                ; 3
    cpx    #2                    ; 2
    bcc    L92B0                 ; 2³
    dex                          ; 2

.coverUpLogo:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    .coverUpLogo          ; 2³
L92B0:
    ldy    #$0E                  ; 2

.wait15scanlines:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bne    .wait15scanlines      ; 2³

    sta    ram_EE                ; 3   A=0
    lda    #$99                  ; 2
    sta    ram_82                ; 3
    sta    ram_84                ; 3
    sta    ram_D8                ; 3
    sta    ram_ED                ; 3
    ldy    sc_1A|READ            ; 4
    dey                          ; 2
    tya                          ; 2
    lsr                          ; 2
    bcs    L933E                 ; 2³+1
    tay                          ; 2
    ldx    sc_10|READ            ; 4
    inx                          ; 2
    stx    sc_10                 ; 4
    txa                          ; 2
    and    #$03                  ; 2
    cpy    #1                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    beq    L92FF                 ; 2³
    tax                          ; 2
    bne    L92E9                 ; 2³
    lda    sc_1B|READ            ; 4
    clc                          ; 2
    adc    L95E9,Y               ; 4
    sta    sc_1B                 ; 4
L92E9:
    lda    sc_10|READ            ; 4
    and    #$0C                  ; 2
    bne    L92F5                 ; 2³
    ora    #$04                  ; 2
    sta    sc_10                 ; 4
L92F5:
    lda    sc_1B|READ            ; 4
    cmp    L98E8,Y               ; 4
    beq    L9326                 ; 2³+1
    bne    L9364                 ; 3+1   always branch

L92FF:
    tax                          ; 2
    bne    L9309                 ; 2³
    ldx    sc_1C|READ            ; 4
    inx                          ; 2
    stx    sc_1C                 ; 4
L9309:
    lda    sc_10|READ            ; 4
    and    #$0C                  ; 2
    beq    L9314                 ; 2³
    cmp    #$0C                  ; 2
    bne    L931E                 ; 2³
L9314:
    lda    sc_10|READ            ; 4
    and    #$F3                  ; 2
    ora    #$04                  ; 2
    sta    sc_10                 ; 4
L931E:
    lda    sc_1C|READ            ; 4
    cmp    L98E8,Y               ; 4
    bne    L9364                 ; 2³
L9326:
    sta    WSYNC                 ; 3
;---------------------------------------
    inc    ram_EE                ; 5
    ldy    sc_1A|READ            ; 4
    iny                          ; 2
    cpy    #9                    ; 2
    bcc    L9333                 ; 2³
    dey                          ; 2
L9333:
    sty    sc_1A                 ; 4
    lda    #4                    ; 2
    sta    sc_10                 ; 4
    dey                          ; 2
    tya                          ; 2
    lsr                          ; 2
L933E:
    tay                          ; 2
    ldx    sc_10|READ            ; 4
    inx                          ; 2
    stx    sc_10                 ; 4
    txa                          ; 2
    cmp    L98E4,Y               ; 4
    lda    #1                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    bcs    L9354                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    bcc    L936D                 ; 2³
L9354:
    ldy    sc_1A|READ            ; 4
    iny                          ; 2
    cpy    #9                    ; 2
    bcs    L935F                 ; 2³
    sty    sc_1A                 ; 4
L935F:
    lda    #4                    ; 2
    sta    sc_10                 ; 4
L9364:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    sc_10|READ            ; 4
    lsr                          ; 2
    lsr                          ; 2
    and    #$03                  ; 2
L936D:
    ldy    sc_1A|READ            ; 4
    dey                          ; 2
    clc                          ; 2
    adc    L9AF5,Y               ; 4
    tay                          ; 2
    dey                          ; 2
    lda    L98EC,Y               ; 4
    sta    ram_81                ; 3
    ldy    sc_1A|READ            ; 4
    dey                          ; 2
    tya                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    ram_EE                ; 3
    bne    L938B                 ; 2³
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
L938B:
    lda    sc_1B|READ            ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
L9390:
    and    #$0F                  ; 2
    sta    ram_EE                ; 3
    lda    #7                    ; 2
    sec                          ; 2
    sbc    ram_EE                ; 3
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    cmp    #$80                  ; 2
    bne    L93AF                 ; 2³
    lda    sc_1B|READ            ; 4
    clc                          ; 2
    adc    L95E9,Y               ; 4
    sta    sc_1B                 ; 4
    bpl    L9390                 ; 2³
L93AF:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMP0                  ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    sc_1B|READ            ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    beq    L93C4                 ; 2³
L93C0:
    dex                          ; 2
    bne    L93C0                 ; 2³
    nop                          ; 2
L93C4:
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$7F                  ; 2
    sta    COLUP0                ; 3
    lda    #$3A                  ; 2
    sta    COLUP1                ; 3
    lda    #0                    ; 2
    sta    HMP1                  ; 3
    ldy    sc_1A|READ            ; 4
    cpy    #2                    ; 2
    bcc    L93FC                 ; 2³
    beq    L93E1                 ; 2³
    lda    #0                    ; 2
    bcs    L940A                 ; 3+1   always branch

L93E1:
    lda    sc_10|READ            ; 4
    lsr                          ; 2
    bcc    L93F5                 ; 2³
    lda    #$88                  ; 2
    sta    REFP1                 ; 3
    sta    HMP1                  ; 3
    lda    #$7F                  ; 2
    sta    COLUP1                ; 3
    lda    #8                    ; 2
    bcs    L940A                 ; 3+1   always branch

L93F5:
    lda    sc_10|READ            ; 4
    cmp    #$14                  ; 2
    bcs    L9400                 ; 2³+1
L93FC:
    lda    #$3B                  ; 2
    bne    L940A                 ; 3   always branch

L9400:
    cmp    #$32                  ; 2
    bcc    L9408                 ; 2³
    ldx    #5                    ; 2
    stx    NUSIZ1                ; 3
L9408:
    lda    #$12                  ; 2
L940A:
    sta    ram_83                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_80                ; 3
    bne    L9416                 ; 2³
    lda    #$50                  ; 2
    bne    L9418                 ; 3   always branch

L9416:
    lda    #0                    ; 2
L9418:
    sta    ram_D7                ; 3
    ldx    #0                    ; 2
    stx    ram_D6                ; 3
    inx                          ; 2
    stx    ram_D5                ; 3
    cpy    #6                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    bcc    L9442                 ; 2³
    beq    L942D                 ; 2³
    lda    #0                    ; 2
    bcs    L9452                 ; 3   always branch

L942D:
    lda    sc_10|READ            ; 4
    lsr                          ; 2
    bcc    L943B                 ; 2³
    lda    #0                    ; 2
    sta    ram_D5                ; 3
    lda    #8                    ; 2
    bcs    L9452                 ; 3   always branch

L943B:
    lda    sc_10|READ            ; 4
    cmp    #$14                  ; 2
    bcs    L9446                 ; 2³
L9442:
    lda    #$1D                  ; 2
    bne    L9452                 ; 3   always branch

L9446:
    cmp    #$32                  ; 2
    bcc    L9450                 ; 2³
    ldy    #5                    ; 2
    sty    ram_D6                ; 3
    bne    L9442                 ; 3   always branch

L9450:
    lda    #$46                  ; 2
L9452:
    sta    ram_EC                ; 3
    jmp    L9500                 ; 3

    .byte $1E ; |   XXXX | $9457
    .byte $1C ; |   XXX  | $9458
    .byte $1E ; |   XXXX | $9459
    .byte $1C ; |   XXX  | $945A
    .byte $14 ; |   X X  | $945B
    .byte $15 ; |   X X X| $945C
    .byte $13 ; |   X  XX| $945D
L945E:
    .byte $14 ; |   X X  | $945E
    .byte $FF ; |XXXXXXXX| $945F
    .byte $FF ; |XXXXXXXX| $9460
    .byte $FF ; |XXXXXXXX| $9461
    .byte $FF ; |XXXXXXXX| $9462
    .byte $FF ; |XXXXXXXX| $9463
    .byte $F0 ; |XXXX    | $9464
    .byte $F0 ; |XXXX    | $9465
    .byte $F0 ; |XXXX    | $9466
    .byte $F0 ; |XXXX    | $9467
    .byte $F0 ; |XXXX    | $9468
    .byte $F0 ; |XXXX    | $9469
    .byte $F0 ; |XXXX    | $946A
    .byte $F0 ; |XXXX    | $946B
    .byte $F0 ; |XXXX    | $946C
    .byte $F0 ; |XXXX    | $946D
    .byte $F0 ; |XXXX    | $946E
    .byte $F0 ; |XXXX    | $946F
    .byte $F0 ; |XXXX    | $9470
    .byte $F0 ; |XXXX    | $9471
    .byte $FF ; |XXXXXXXX| $9472
    .byte $FF ; |XXXXXXXX| $9473
    .byte $FF ; |XXXXXXXX| $9474
    .byte $FF ; |XXXXXXXX| $9475
    .byte $FF ; |XXXXXXXX| $9476
    .byte $00 ; |        | $9477
    .byte $00 ; |        | $9478
    .byte $00 ; |        | $9479
    .byte $00 ; |        | $947A
    .byte $1F ; |   XXXXX| $947B
    .byte $1F ; |   XXXXX| $947C
    .byte $1F ; |   XXXXX| $947D
    .byte $1F ; |   XXXXX| $947E
    .byte $1F ; |   XXXXX| $947F
    .byte $1E ; |   XXXX | $9480
    .byte $1E ; |   XXXX | $9481
    .byte $1E ; |   XXXX | $9482
    .byte $1E ; |   XXXX | $9483
    .byte $1E ; |   XXXX | $9484
    .byte $1E ; |   XXXX | $9485
    .byte $1E ; |   XXXX | $9486
    .byte $1E ; |   XXXX | $9487
    .byte $1E ; |   XXXX | $9488
    .byte $1E ; |   XXXX | $9489
    .byte $1E ; |   XXXX | $948A
    .byte $1E ; |   XXXX | $948B
    .byte $1E ; |   XXXX | $948C
    .byte $1E ; |   XXXX | $948D
    .byte $1F ; |   XXXXX| $948E
    .byte $1F ; |   XXXXX| $948F
    .byte $1F ; |   XXXXX| $9490
    .byte $1F ; |   XXXXX| $9491
    .byte $1F ; |   XXXXX| $9492
    .byte $1B ; |   XX XX| $9493
    .byte $18 ; |   XX   | $9494
    .byte $15 ; |   X X X| $9495
    .byte $14 ; |   X X  | $9496
    .byte $12 ; |   X  X | $9497
    .byte $10 ; |   X    | $9498
    .byte $0E ; |    XXX | $9499
L949A:
    .byte $0D ; |    XX X| $949A
    .byte $0D ; |    XX X| $949B
    .byte $0D ; |    XX X| $949C
    .byte $0D ; |    XX X| $949D
    .byte $04 ; |     X  | $949E
    .byte $04 ; |     X  | $949F
    .byte $04 ; |     X  | $94A0
    .byte $04 ; |     X  | $94A1
    .byte $1C ; |   XXX  | $94A2
    .byte $19 ; |   XX  X| $94A3
    .byte $16 ; |   X XX | $94A4
    .byte $15 ; |   X X X| $94A5
    .byte $13 ; |   X  XX| $94A6
    .byte $11 ; |   X   X| $94A7
    .byte $0F ; |    XXXX| $94A8
    .byte $0E ; |    XXX | $94A9
    .byte $0F ; |    XXXX| $94AA
    .byte $10 ; |   X    | $94AB
    .byte $0F ; |    XXXX| $94AC
    .byte $10 ; |   X    | $94AD
    .byte $11 ; |   X   X| $94AE
    .byte $10 ; |   X    | $94AF
    .byte $11 ; |   X   X| $94B0
    .byte $12 ; |   X  X | $94B1
    .byte $11 ; |   X   X| $94B2
    .byte $12 ; |   X  X | $94B3
    .byte $13 ; |   X  XX| $94B4
    .byte $14 ; |   X X  | $94B5
    .byte $14 ; |   X X  | $94B6
    .byte $0D ; |    XX X| $94B7
    .byte $0D ; |    XX X| $94B8
    .byte $0E ; |    XXX | $94B9
    .byte $0F ; |    XXXX| $94BA
    .byte $0E ; |    XXX | $94BB
    .byte $0F ; |    XXXX| $94BC
    .byte $10 ; |   X    | $94BD
    .byte $0F ; |    XXXX| $94BE
    .byte $10 ; |   X    | $94BF
    .byte $11 ; |   X   X| $94C0
    .byte $10 ; |   X    | $94C1
    .byte $11 ; |   X   X| $94C2
    .byte $12 ; |   X  X | $94C3
    .byte $13 ; |   X  XX| $94C4
    .byte $13 ; |   X  XX| $94C5
    .byte $0C ; |    XX  | $94C6
    .byte $0C ; |    XX  | $94C7
L94C8:
    .byte $06 ; |     XX | $94C8
    .byte $06 ; |     XX | $94C9
    .byte $06 ; |     XX | $94CA
    .byte $05 ; |     X X| $94CB
    .byte $05 ; |     X X| $94CC
    .byte $05 ; |     X X| $94CD
    .byte $04 ; |     X  | $94CE
    .byte $04 ; |     X  | $94CF
    .byte $04 ; |     X  | $94D0
    .byte $03 ; |      XX| $94D1
    .byte $03 ; |      XX| $94D2
    .byte $03 ; |      XX| $94D3
    .byte $02 ; |      X | $94D4
    .byte $02 ; |      X | $94D5
    .byte $08 ; |    X   | $94D6
    .byte $08 ; |    X   | $94D7
L94D8:
    .byte $05 ; |     X X| $94D8
    .byte $05 ; |     X X| $94D9
    .byte $05 ; |     X X| $94DA
    .byte $04 ; |     X  | $94DB
    .byte $04 ; |     X  | $94DC
    .byte $04 ; |     X  | $94DD
    .byte $03 ; |      XX| $94DE
    .byte $03 ; |      XX| $94DF
    .byte $03 ; |      XX| $94E0
    .byte $02 ; |      X | $94E1
    .byte $02 ; |      X | $94E2
    .byte $02 ; |      X | $94E3
    .byte $01 ; |       X| $94E4
    .byte $01 ; |       X| $94E5
    .byte $08 ; |    X   | $94E6
L94E7:
    .byte $08 ; |    X   | $94E7
    .byte $18 ; |   XX   | $94E8
    .byte $3F ; |  XXXXXX| $94E9
    .byte $3F ; |  XXXXXX| $94EA
    .byte $04 ; |     X  | $94EB
    .byte $08 ; |    X   | $94EC
    .byte $08 ; |    X   | $94ED
    .byte $0A ; |    X X | $94EE
    .byte $18 ; |   XX   | $94EF
    .byte $09 ; |    X  X| $94F0
    .byte $14 ; |   X X  | $94F1
    .byte $08 ; |    X   | $94F2
    .byte $05 ; |     X X| $94F3
    .byte $1F ; |   XXXXX| $94F4
    .byte $06 ; |     XX | $94F5
    .byte $0C ; |    XX  | $94F6
    .byte $17 ; |   X XXX| $94F7
    .byte $15 ; |   X X X| $94F8
    .byte $10 ; |   X    | $94F9
    .byte $3F ; |  XXXXXX| $94FA
    .byte $08 ; |    X   | $94FB
    .byte $7E ; | XXXXXX | $94FC
    .byte $B7 ; |X XX XXX| $94FD
    .byte $C8 ; |XX  X   | $94FE
    .byte $CD ; |XX  XX X| $94FF

L9500:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #6                    ; 2
L9504:
    dex                          ; 2
    bne    L9504                 ; 2³
    sta    RESP1                 ; 3
    ldy    #$0A                  ; 2
    sty    ram_EE                ; 3
    ldx    #0                    ; 2
    lda    #<L961B               ; 2
    sta    ram_D9                ; 3
    lda    #>L961B               ; 2
    sta    ram_DA                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    bne    L9526                 ; 3   always branch

L951D:
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    jmp    L953F                 ; 3

L9523:
    nop                          ; 2
    bcc    L9533                 ; 3   always branch

L9526:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
L952A:
    cpy    #$0A                  ; 2
    bcc    L9523                 ; 2³
    cpx    sc_1C|READ            ; 4
    bne    L951D                 ; 2³
L9533:
    lda    (ram_81),Y            ; 5
    dey                          ; 2
    bpl    L953F                 ; 2³
    ldy    #$0A                  ; 2
    sta    GRP0                  ; 3
    jmp.ind ($00D9)              ; 5

L953F:
    sta    GRP0|MIRROR           ; 4   uses an extra cycle
    jmp.ind ($00D9)              ; 5

L9545:
    lda    #0                    ; 2
    sta    GRP1                  ; 3
    sta    HMP0                  ; 3
    lda    #$24                  ; 2
    sta    COLUP1                ; 3
    lda    #6                    ; 2
    sta    ram_EE                ; 3
    lda    #$90                  ; 2
    sta    HMP1                  ; 3
    lda    #<L9562               ; 2
    sta    ram_D9                ; 3
    lda    #>L9562               ; 2
    sta    ram_DA                ; 3
    jmp    L9634                 ; 3

L9562:
    lda    #<L957E               ; 2
    sta    ram_D9                ; 3
    lda    #>L957E               ; 2
    sta    ram_DA                ; 3
    sta    RESP1                 ; 3
    inx                          ; 2
    lda    #0                    ; 2
    sta    REFP1                 ; 3
    sta    NUSIZ1                ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jmp    L952A                 ; 3

L957E:
    lda    #<L9600               ; 2
    sta    ram_D9                ; 3
    lda    #>L9600               ; 2
    sta    ram_DA                ; 3
    jmp    L9634                 ; 3

L9589:
    lda    #0                    ; 2
    sta    GRP1                  ; 3
    sta    HMP0                  ; 3
    lda    ram_D5                ; 3
    beq    L9595                 ; 2³
    lda    #$80                  ; 2
L9595:
    sta    HMP1                  ; 3
    lda    #<L95A6               ; 2
    sta    ram_D9                ; 3
    lda    #>L95A6               ; 2
    sta    ram_DA                ; 3
    lda    #$7F                  ; 2
    sta    COLUP1                ; 3
    jmp    L9634                 ; 3

L95A6:
    lda    #<L95CA               ; 2
    sta    ram_D9                ; 3
    lda    #>L95CA               ; 2
    sta    ram_DA                ; 3
    lda    #$0A                  ; 2
    sta    ram_EE                ; 3
    inx                          ; 2
    lda    ram_D6                ; 3
    sta    RESP1                 ; 3
    sta    NUSIZ1                ; 3
    lda    ram_D5                ; 3
    beq    L95C3                 ; 2³
    lda    #$D8                  ; 2
    sta    COLUP1                ; 3
    lda    #0                    ; 2
L95C3:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jmp    L952A                 ; 3

L95CA:
    lda    #<L95DA               ; 2
    sta    ram_D9                ; 3
    lda    #>L95DA               ; 2
    sta    ram_DA                ; 3
    jmp    L9634                 ; 3

L95DA:
    sty    ram_EF                ; 3
    ldy    ram_EE                ; 3
    lda    (ram_EC),Y            ; 5
    dey                          ; 2
    sty    ram_EE                ; 3
    ldy    ram_EF                ; 3
    sta    GRP1                  ; 3
    cpx    #$22                  ; 2
    beq    L9638                 ; 2³+1
    jmp    L9634                 ; 3

L95E9:
    .byte $FF ; |XXXXXXXX| $95E9
    .byte $00 ; |        | $95EA
    .byte $01 ; |       X| $95EB
L95EC:
    .byte $01 ; |       X| $95EC
    .byte $00 ; |        | $95ED
    .byte $0D ; |    XX X| $95EE
    .byte $0D ; |    XX X| $95EF
    .byte $00 ; |        | $95F0
    .byte $01 ; |       X| $95F1
    .byte $00 ; |        | $95F2
    .byte $04 ; |     X  | $95F3
    .byte $00 ; |        | $95F4
    .byte $00 ; |        | $95F5
    .byte $00 ; |        | $95F6
    .byte $00 ; |        | $95F7
    .byte $0D ; |    XX X| $95F8
    .byte $0D ; |    XX X| $95F9
    .byte $00 ; |        | $95FA
    .byte $00 ; |        | $95FB
    .byte $0D ; |    XX X| $95FC
    .byte $0D ; |    XX X| $95FD
    .byte $0D ; |    XX X| $95FE
    .byte $0D ; |    XX X| $95FF

L9600:
    sty    ram_EF                ; 3
    ldy    ram_EE                ; 3
    lda    (ram_D7),Y            ; 5
    dey                          ; 2
    sty    ram_EE                ; 3
    ldy    ram_EF                ; 3
    sta    GRP1                  ; 3
    cpx    #$14                  ; 2
    bne    L9634                 ; 2³
    lda    #<L9589               ; 2
    sta    ram_D9                ; 3
    lda    #>L9589               ; 2
    sta    ram_DA                ; 3
    bne    L9634                 ; 3   always branch

L961B:
    sty    ram_EF                ; 3
    ldy    ram_EE                ; 3
    lda    (ram_83),Y            ; 5
    dey                          ; 2
    sty    ram_EE                ; 3
    ldy    ram_EF                ; 3
    sta    GRP1                  ; 3
    cpx    #$0A                  ; 2
    bne    L9634                 ; 2³
    lda    #<L9545               ; 2
    sta    ram_D9                ; 3
    lda    #>L9545               ; 2
    sta    ram_DA                ; 3
L9634:
    inx                          ; 2
    jmp    L9526                 ; 3

L9638:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    ldy    #$1E                  ; 2
L9644:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bne    L9644                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$A0                  ; 2
    sta    HMP0                  ; 3
    lda    #$B0                  ; 2
    sta    HMP1|MIRROR           ; 4   uses an extra cycle
    ldx    #4                    ; 2
L9656:
    dex                          ; 2
    bne    L9656                 ; 2³
    nop                          ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    ldy    #$18                  ; 2
    sty    ram_EE|MIRROR         ; 4   uses an extra cycle
    ldx    #6                    ; 2
L9673:
    dex                          ; 2
    bne    L9673                 ; 2³
    sty    ram_EE                ; 3
    jmp    L9700                 ; 3

L967B:
    .byte $00 ; |        | $967B
    .byte $00 ; |        | $967C
    .byte $77 ; | XXX XXX| $967D
    .byte $51 ; | X X   X| $967E
    .byte $73 ; | XXX  XX| $967F
    .byte $51 ; | X X   X| $9680
    .byte $77 ; | XXX XXX| $9681
    .byte $00 ; |        | $9682
    .byte $00 ; |        | $9683
    .byte $00 ; |        | $9684
    .byte $98 ; |X  XX   | $9685
    .byte $98 ; |X  XX   | $9686
    .byte $98 ; |X  XX   | $9687
    .byte $18 ; |   XX   | $9688
    .byte $18 ; |   XX   | $9689
    .byte $18 ; |   XX   | $968A
    .byte $18 ; |   XX   | $968B
    .byte $18 ; |   XX   | $968C
    .byte $18 ; |   XX   | $968D
    .byte $98 ; |X  XX   | $968E
    .byte $98 ; |X  XX   | $968F
    .byte $18 ; |   XX   | $9690
    .byte $18 ; |   XX   | $9691
    .byte $18 ; |   XX   | $9692
    .byte $18 ; |   XX   | $9693
L9694:
    .byte $43 ; | X    XX| $9694
    .byte $41 ; | X     X| $9695
    .byte $77 ; | XXX XXX| $9696
    .byte $55 ; | X X X X| $9697
    .byte $75 ; | XXX X X| $9698
    .byte $00 ; |        | $9699
    .byte $00 ; |        | $969A
    .byte $00 ; |        | $969B
    .byte $00 ; |        | $969C
    .byte $00 ; |        | $969D
    .byte $04 ; |     X  | $969E
    .byte $04 ; |     X  | $969F
    .byte $0C ; |    XX  | $96A0
    .byte $0C ; |    XX  | $96A1
    .byte $FC ; |XXXXXX  | $96A2
    .byte $F8 ; |XXXXX   | $96A3
    .byte $18 ; |   XX   | $96A4
    .byte $18 ; |   XX   | $96A5
    .byte $10 ; |   X    | $96A6
    .byte $B0 ; |X XX    | $96A7
    .byte $B0 ; |X XX    | $96A8
    .byte $E0 ; |XXX     | $96A9
    .byte $E3 ; |XXX   XX| $96AA
    .byte $E3 ; |XXX   XX| $96AB
    .byte $43 ; | X    XX| $96AC
L96AD:
    .byte $01 ; |       X| $96AD
    .byte $01 ; |       X| $96AE
    .byte $8C ; |X   XX  | $96AF
    .byte $8C ; |X   XX  | $96B0
    .byte $8C ; |X   XX  | $96B1
    .byte $8D ; |X   XX X| $96B2
    .byte $8D ; |X   XX X| $96B3
    .byte $8D ; |X   XX X| $96B4
    .byte $06 ; |     XX | $96B5
    .byte $06 ; |     XX | $96B6
    .byte $8B ; |X   X XX| $96B7
    .byte $8B ; |X   X XX| $96B8
    .byte $8B ; |X   X XX| $96B9
    .byte $8F ; |X   XXXX| $96BA
    .byte $8F ; |X   XXXX| $96BB
    .byte $8F ; |X   XXXX| $96BC
    .byte $03 ; |      XX| $96BD
    .byte $03 ; |      XX| $96BE
    .byte $8C ; |X   XX  | $96BF
    .byte $8C ; |X   XX  | $96C0
    .byte $8C ; |X   XX  | $96C1
    .byte $8D ; |X   XX X| $96C2
    .byte $8D ; |X   XX X| $96C3
    .byte $8D ; |X   XX X| $96C4
    .byte $0A ; |    X X | $96C5
    .byte $0A ; |    X X | $96C6
    .byte $0F ; |    XXXX| $96C7
    .byte $0F ; |    XXXX| $96C8
    .byte $0F ; |    XXXX| $96C9
    .byte $8E ; |X   XXX | $96CA
    .byte $8E ; |X   XXX | $96CB
    .byte $8E ; |X   XXX | $96CC
L96CD:
    .byte $05 ; |     X X| $96CD
    .byte $04 ; |     X  | $96CE
    .byte $03 ; |      XX| $96CF
    .byte $02 ; |      X | $96D0
    .byte $10 ; |   X    | $96D1
    .byte $08 ; |    X   | $96D2
    .byte $06 ; |     XX | $96D3
L96D4:
    .byte $04 ; |     X  | $96D4
    .byte $04 ; |     X  | $96D5
    .byte $06 ; |     XX | $96D6
    .byte $08 ; |    X   | $96D7
    .byte $10 ; |   X    | $96D8
    .byte $10 ; |   X    | $96D9
    .byte $20 ; |  X     | $96DA
    .byte $20 ; |  X     | $96DB
    .byte $30 ; |  XX    | $96DC
    .byte $30 ; |  XX    | $96DD
    .byte $40 ; | X      | $96DE
    .byte $40 ; | X      | $96DF
    .byte $50 ; | X X    | $96E0
    .byte $50 ; | X X    | $96E1
    .byte $60 ; | XX     | $96E2
    .byte $60 ; | XX     | $96E3
    .byte $70 ; | XXX    | $96E4
    .byte $70 ; | XXX    | $96E5
    .byte $80 ; |X       | $96E6
L96E7:
    .byte $00 ; |        | $96E7
    .byte $00 ; |        | $96E8
    .byte $17 ; |   X XXX| $96E9
    .byte $11 ; |   X   X| $96EA
    .byte $17 ; |   X XXX| $96EB
    .byte $15 ; |   X X X| $96EC
    .byte $17 ; |   X XXX| $96ED
    .byte $00 ; |        | $96EE
    .byte $00 ; |        | $96EF
    .byte $00 ; |        | $96F0
    .byte $61 ; | XX    X| $96F1
    .byte $61 ; | XX    X| $96F2
    .byte $63 ; | XX   XX| $96F3
    .byte $63 ; | XX   XX| $96F4
    .byte $67 ; | XX  XXX| $96F5
    .byte $7E ; | XXXXXX | $96F6
    .byte $7E ; | XXXXXX | $96F7
    .byte $7F ; | XXXXXXX| $96F8
    .byte $67 ; | XX  XXX| $96F9
    .byte $63 ; | XX   XX| $96FA
    .byte $61 ; | XX    X| $96FB
    .byte $63 ; | XX   XX| $96FC
    .byte $77 ; | XXX XXX| $96FD
    .byte $7E ; | XXXXXX | $96FE
    .byte $3C ; |  XXXX  | $96FF

L9700:
    ldy    ram_EE                ; 3
    lda    L9A5B,Y               ; 4
    sta    GRP0|MIRROR           ; 4   uses an extra cycle
    lda    L9694,Y               ; 4
    sta    GRP1                  ; 3
    lda    L9ADC,Y               ; 4
    sta    GRP0                  ; 3
    lda    L96E7,Y               ; 4
    sta    ram_EC                ; 3
    tya                          ; 2
    asl                          ; 2
    adc    framecounter          ; 3  creates the scrolling colors effect on the Atari Logo
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    L967B,Y               ; 4
    ldx    L9863,Y               ; 4
    ldy    ram_EC                ; 3
    stx    GRP1                  ; 3
    sty    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    ram_EE                ; 5
    bpl    L9700                 ; 2³
    ldx    #0                    ; 2
    stx    NUSIZ0                ; 3
    stx    NUSIZ1                ; 3
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    stx    GRP0                  ; 3
    stx    VDELP0                ; 3
    stx    VDELP1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    bit    INPT4                 ; 3
    bpl    L9756                 ; 2³
    lsr    SWCHB                 ; 6
    bcs    L9759                 ; 2³
    lda    ram_80                ; 3
    beq    L9754                 ; 2³
    lda    #1                    ; 2
L9754:
    sta    ram_80                ; 3
L9756:
    jmp    L97DC                 ; 3

L9759:
    inc    framecounter          ; 5
    lda    sc_19|READ            ; 4
    beq    L9768                 ; 2³
    sec                          ; 2
    sbc    #1                    ; 2
    sta    sc_19                 ; 4
    bpl    L97B5                 ; 2³
L9768:
    lda    SWCHB                 ; 4
    and    #$02                  ; 2
    bne    L97B5                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    sc_11|READ            ; 4
    bne    L97A6                 ; 2³
    sty    sc_10                 ; 4
    sty    sc_1C                 ; 4
    iny                          ; 2
    sty    sc_11                 ; 4
    sty    sc_1A                 ; 4
    lda    #$78                  ; 2
    sta    sc_1B                 ; 4
    lda    sc_0F|READ            ; 4
    and    #$FE                  ; 2
    sta    sc_0F                 ; 4
    lda    #$82                  ; 2
    sta    sc_15                 ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$10                  ; 2
    sta    sc_19                 ; 4
    lda    ram_80                ; 3
    beq    L97A2                 ; 2³
    lda    #1                    ; 2
L97A2:
    sta    ram_80                ; 3
    bpl    L97F1                 ; 3   always branch

L97A6:
    lda    ram_80                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    eor    #$01                  ; 2
    sta    ram_80                ; 3
    lda    #$10                  ; 2
    sta    sc_19                 ; 4
    bne    L97F1                 ; 3   always branch

L97B5:
    lda    framecounter          ; 3
    bne    L97ED                 ; 2³
    inc    ram_F0                ; 5
    lda    ram_F0                ; 3
    cmp    #4                    ; 2
    bcc    L97ED                 ; 2³
    ldy    sc_11|READ            ; 4
    bne    L97ED                 ; 2³
    lda    sc_0F|READ            ; 4
    ora    #$01                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    sc_0F                 ; 4
    lda    ram_80                ; 3
    beq    L97D6                 ; 2³
    lda    #1                    ; 2
L97D6:
    sta    ram_80                ; 3
    lda    #$82                  ; 2
    bne    L97E2                 ; 3   always branch

L97DC:
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #3                    ; 2
L97E2:
    sta    sc_15                 ; 4
    lda    #$FF                  ; 2
    sta    sc_1A                 ; 4
    jmp    L9FE4                 ; 3   goto LF14D

L97ED:
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
L97F1:
    lda    #$2C                  ; 2
    sta    TIM64T                ; 4
L97F6:
    lda    INTIM                 ; 4
    bne    L97F6                 ; 2³
    ldx    #2                    ; 2
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    VSYNC                 ; 3
    stx    VBLANK                ; 3
    stx    WSYNC                 ; 3
    stx    WSYNC                 ; 3
    stx    WSYNC                 ; 3
    stx    WSYNC                 ; 3
;---------------------------------------
    ldx    #0                    ; 2
    stx    VSYNC                 ; 3
    ldx    #$2C                  ; 2
    stx    TIM64T                ; 4
    jmp    FinishVblank          ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L9817 SUBROUTINE
    sta    ram_D4                ; 3
    lda    sc_15|READ            ; 4
    and    #$83                  ; 2
    bne    L9861                 ; 2³
    lda    ram_D4                ; 3
    sed                          ; 2
    clc                          ; 2
    adc    sc_7D|READ            ; 4
    sta    sc_7D                 ; 4
    tya                          ; 2
    adc    sc_7E|READ            ; 4
    sta    sc_7E                 ; 4
    bcc    L9861                 ; 2³
    lda    #0                    ; 2
    adc    sc_7F|READ            ; 4
    sta    sc_7F                 ; 4
    cmp    #$21                  ; 2
    bcs    L9861                 ; 2³
    cmp    #2                    ; 2
    beq    L984B                 ; 2³
    and    #$0F                  ; 2
    beq    L984B                 ; 2³
    cmp    #5                    ; 2
    bne    L9861                 ; 2³
L984B:
    cld                          ; 2
    lda    numOfLives|READ       ; 4
    and    #$07                  ; 2
    cmp    #7                    ; 2
    beq    L9861                 ; 2³
    ldy    numOfLives|READ       ; 4
    iny                          ; 2
    sty    numOfLives            ; 4
    ldy    #$0F                  ; 2
    jmp    L99F3                 ; 3   finishes subroutine there, and returns

L9861:
    cld                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L9863:
    .byte $80 ; |X       | $9863
    .byte $80 ; |X       | $9864
    .byte $AB ; |X X X XX| $9865
    .byte $AA ; |X X X X | $9866
    .byte $BA ; |X XXX X | $9867
    .byte $22 ; |  X   X | $9868
    .byte $27 ; |  X  XXX| $9869
    .byte $22 ; |  X   X | $986A
    .byte $00 ; |        | $986B
    .byte $00 ; |        | $986C
    .byte $02 ; |      X | $986D
    .byte $02 ; |      X | $986E
    .byte $06 ; |     XX | $986F
    .byte $06 ; |     XX | $9870
    .byte $FE ; |XXXXXXX | $9871
    .byte $FC ; |XXXXXX  | $9872
    .byte $8C ; |X   XX  | $9873
    .byte $8C ; |X   XX  | $9874
    .byte $88 ; |X   X   | $9875
    .byte $D8 ; |XX XX   | $9876
    .byte $D8 ; |XX XX   | $9877
    .byte $70 ; | XXX    | $9878
    .byte $70 ; | XXX    | $9879
    .byte $70 ; | XXX    | $987A
L987B:
    .byte $20 ; |  X     | $987B
    .byte $07 ; |     XXX| $987C
    .byte $0F ; |    XXXX| $987D
    .byte $1F ; |   XXXXX| $987E
    .byte $1F ; |   XXXXX| $987F
    .byte $3F ; |  XXXXXX| $9880
    .byte $3F ; |  XXXXXX| $9881
    .byte $7E ; | XXXXXX | $9882
    .byte $7C ; | XXXXX  | $9883
    .byte $78 ; | XXXX   | $9884
    .byte $78 ; | XXXX   | $9885
    .byte $78 ; | XXXX   | $9886
    .byte $78 ; | XXXX   | $9887
    .byte $78 ; | XXXX   | $9888
    .byte $78 ; | XXXX   | $9889
    .byte $78 ; | XXXX   | $988A
    .byte $78 ; | XXXX   | $988B
    .byte $7C ; | XXXXX  | $988C
    .byte $7E ; | XXXXXX | $988D
    .byte $3F ; |  XXXXXX| $988E
    .byte $3F ; |  XXXXXX| $988F
    .byte $1F ; |   XXXXX| $9890
    .byte $1F ; |   XXXXX| $9891
    .byte $0F ; |    XXXX| $9892
    .byte $07 ; |     XXX| $9893
    .byte $00 ; |        | $9894
    .byte $00 ; |        | $9895
    .byte $00 ; |        | $9896
    .byte $00 ; |        | $9897
    .byte $3F ; |  XXXXXX| $9898
    .byte $7F ; | XXXXXXX| $9899
    .byte $FF ; |XXXXXXXX| $989A
    .byte $FF ; |XXXXXXXX| $989B
    .byte $FF ; |XXXXXXXX| $989C
    .byte $F8 ; |XXXXX   | $989D
    .byte $F0 ; |XXXX    | $989E
    .byte $E0 ; |XXX     | $989F
    .byte $C0 ; |XX      | $98A0
    .byte $C3 ; |XX    XX| $98A1
    .byte $C3 ; |XX    XX| $98A2
    .byte $C3 ; |XX    XX| $98A3
    .byte $C3 ; |XX    XX| $98A4
    .byte $C0 ; |XX      | $98A5
    .byte $C0 ; |XX      | $98A6
    .byte $C0 ; |XX      | $98A7
    .byte $E0 ; |XXX     | $98A8
    .byte $F0 ; |XXXX    | $98A9
    .byte $F8 ; |XXXXX   | $98AA
    .byte $FF ; |XXXXXXXX| $98AB
    .byte $FF ; |XXXXXXXX| $98AC
    .byte $FF ; |XXXXXXXX| $98AD
    .byte $7F ; | XXXXXXX| $98AE
L98AF:
    .byte $3F ; |  XXXXXX| $98AF
    .byte $F0 ; |XXXX    | $98B0
    .byte $F8 ; |XXXXX   | $98B1
    .byte $FC ; |XXXXXX  | $98B2
    .byte $FE ; |XXXXXXX | $98B3
    .byte $FF ; |XXXXXXXX| $98B4
    .byte $1F ; |   XXXXX| $98B5
    .byte $0F ; |    XXXX| $98B6
    .byte $0F ; |    XXXX| $98B7
    .byte $0F ; |    XXXX| $98B8
    .byte $7F ; | XXXXXXX| $98B9
    .byte $7F ; | XXXXXXX| $98BA
    .byte $7F ; | XXXXXXX| $98BB
    .byte $7F ; | XXXXXXX| $98BC
    .byte $00 ; |        | $98BD
    .byte $00 ; |        | $98BE
    .byte $00 ; |        | $98BF
    .byte $00 ; |        | $98C0
    .byte $0F ; |    XXXX| $98C1
    .byte $1F ; |   XXXXX| $98C2
    .byte $FF ; |XXXXXXXX| $98C3
    .byte $FE ; |XXXXXXX | $98C4
    .byte $FC ; |XXXXXX  | $98C5
    .byte $F8 ; |XXXXX   | $98C6
    .byte $F0 ; |XXXX    | $98C7
    .byte $00 ; |        | $98C8
    .byte $00 ; |        | $98C9
    .byte $00 ; |        | $98CA
    .byte $00 ; |        | $98CB
    .byte $80 ; |X       | $98CC
    .byte $C0 ; |XX      | $98CD
    .byte $E0 ; |XXX     | $98CE
    .byte $F0 ; |XXXX    | $98CF
    .byte $F8 ; |XXXXX   | $98D0
    .byte $F8 ; |XXXXX   | $98D1
    .byte $78 ; | XXXX   | $98D2
    .byte $78 ; | XXXX   | $98D3
    .byte $78 ; | XXXX   | $98D4
    .byte $F8 ; |XXXXX   | $98D5
    .byte $F8 ; |XXXXX   | $98D6
    .byte $F8 ; |XXXXX   | $98D7
    .byte $F8 ; |XXXXX   | $98D8
    .byte $00 ; |        | $98D9
    .byte $00 ; |        | $98DA
    .byte $00 ; |        | $98DB
    .byte $00 ; |        | $98DC
    .byte $78 ; | XXXX   | $98DD
    .byte $F8 ; |XXXXX   | $98DE
    .byte $F8 ; |XXXXX   | $98DF
    .byte $F0 ; |XXXX    | $98E0
    .byte $E0 ; |XXX     | $98E1
    .byte $C0 ; |XX      | $98E2
    .byte $80 ; |X       | $98E3
L98E4:
    .byte $50 ; | X X    | $98E4
    .byte $01 ; |       X| $98E5
    .byte $50 ; | X X    | $98E6
    .byte $50 ; | X X    | $98E7
L98E8:
    .byte $28 ; |  X X   | $98E8
    .byte $18 ; |   XX   | $98E9
    .byte $50 ; | X X    | $98EA
    .byte $69 ; | XX X  X| $98EB
L98EC:
    .byte $78 ; | XXXX   | $98EC
    .byte $83 ; |X     XX| $98ED
    .byte $8E ; |X   XXX | $98EE
    .byte $31 ; |  XX   X| $98EF
    .byte $27 ; |  X  XXX| $98F0
    .byte $57 ; | X X XXX| $98F1
    .byte $62 ; | XX   X | $98F2
    .byte $6D ; | XX XX X| $98F3
L98F4:
    .byte $00 ; |        | $98F4
    .byte $00 ; |        | $98F5
    .byte $00 ; |        | $98F6
    .byte $00 ; |        | $98F7
    .byte $00 ; |        | $98F8
    .byte $01 ; |       X| $98F9
    .byte $05 ; |     X X| $98FA
    .byte $15 ; |   X X X| $98FB
    .byte $6D ; | XX XX X| $98FC
    .byte $61 ; | XX    X| $98FD
    .byte $6E ; | XX XXX | $98FE
    .byte $64 ; | XX  X  | $98FF
    .byte $00 ; |        | $9900
    .byte $00 ; |        | $9901
    .byte $00 ; |        | $9902
    .byte $00 ; |        | $9903
    .byte $00 ; |        | $9904
    .byte $00 ; |        | $9905
    .byte $00 ; |        | $9906
    .byte $00 ; |        | $9907
    .byte $00 ; |        | $9908
    .byte $00 ; |        | $9909
    .byte $00 ; |        | $990A
    .byte $06 ; |     XX | $990B
    .byte $89 ; |X   X  X| $990C
    .byte $50 ; | X X    | $990D
    .byte $20 ; |  X     | $990E
    .byte $00 ; |        | $990F
    .byte $00 ; |        | $9910
    .byte $00 ; |        | $9911
    .byte $00 ; |        | $9912
    .byte $E7 ; |XXX  XXX| $9913
    .byte $3C ; |  XXXX  | $9914
    .byte $7E ; | XXXXXX | $9915
    .byte $FF ; |XXXXXXXX| $9916
    .byte $DB ; |XX XX XX| $9917
    .byte $DB ; |XX XX XX| $9918
    .byte $99 ; |X  XX  X| $9919
    .byte $FF ; |XXXXXXXX| $991A
    .byte $7E ; | XXXXXX | $991B
    .byte $3C ; |  XXXX  | $991C
    .byte $7C ; | XXXXX  | $991D
    .byte $F7 ; |XXXX XXX| $991E
    .byte $FB ; |XXXXX XX| $991F
    .byte $7E ; | XXXXXX | $9920
    .byte $76 ; | XXX XX | $9921
    .byte $FA ; |XXXXX X | $9922
    .byte $1C ; |   XXX  | $9923
    .byte $1C ; |   XXX  | $9924
    .byte $FC ; |XXXXXX  | $9925
    .byte $68 ; | XX X   | $9926
    .byte $10 ; |   X    | $9927
    .byte $0A ; |    X X | $9928
    .byte $4A ; | X  X X | $9929
    .byte $86 ; |X    XX | $992A
    .byte $94 ; |X  X X  | $992B
    .byte $94 ; |X  X X  | $992C
    .byte $94 ; |X  X X  | $992D
    .byte $D4 ; |XX X X  | $992E
    .byte $F4 ; |XXXX X  | $992F
    .byte $76 ; | XXX XX | $9930
    .byte $08 ; |    X   | $9931
    .byte $49 ; | X  X  X| $9932
    .byte $81 ; |X      X| $9933
    .byte $97 ; |X  X XXX| $9934
    .byte $94 ; |X  X X  | $9935
    .byte $94 ; |X  X X  | $9936
    .byte $D5 ; |XX X X X| $9937
    .byte $F5 ; |XXXX X X| $9938
    .byte $77 ; | XXX XXX| $9939
    .byte $0C ; |    XX  | $993A
    .byte $00 ; |        | $993B
    .byte $36 ; |  XX XX | $993C
    .byte $24 ; |  X  X  | $993D
    .byte $24 ; |  X  X  | $993E
    .byte $3C ; |  XXXX  | $993F
    .byte $7E ; | XXXXXX | $9940
    .byte $ED ; |XXX XX X| $9941
    .byte $ED ; |XXX XX X| $9942
    .byte $C9 ; |XX  X  X| $9943
    .byte $7E ; | XXXXXX | $9944
    .byte $3C ; |  XXXX  | $9945
    .byte $7E ; | XXXXXX | $9946
    .byte $FF ; |XXXXXXXX| $9947
    .byte $FF ; |XXXXXXXX| $9948
    .byte $FF ; |XXXXXXXX| $9949
    .byte $7F ; | XXXXXXX| $994A
    .byte $FB ; |XXXXX XX| $994B
    .byte $FD ; |XXXXXX X| $994C
    .byte $0D ; |    XX X| $994D
    .byte $FC ; |XXXXXX  | $994E
    .byte $6C ; | XX XX  | $994F
    .byte $38 ; |  XXX   | $9950
    .byte $6C ; | XX XX  | $9951
    .byte $6C ; | XX XX  | $9952
    .byte $7C ; | XXXXX  | $9953
    .byte $54 ; | X X X  | $9954
    .byte $BA ; |X XXX X | $9955
    .byte $C6 ; |XX   XX | $9956
    .byte $38 ; |  XXX   | $9957
    .byte $30 ; |  XX    | $9958
    .byte $78 ; | XXXX   | $9959
    .byte $74 ; | XXX X  | $995A
    .byte $42 ; | X    X | $995B
    .byte $00 ; |        | $995C
    .byte $3C ; |  XXXX  | $995D
    .byte $E0 ; |XXX     | $995E
    .byte $C0 ; |XX      | $995F
    .byte $FC ; |XXXXXX  | $9960
    .byte $70 ; | XXX    | $9961
    .byte $30 ; |  XX    | $9962
    .byte $26 ; |  X  XX | $9963
    .byte $78 ; | XXXX   | $9964
    .byte $74 ; | XXX X  | $9965
    .byte $42 ; | X    X | $9966
    .byte $00 ; |        | $9967
    .byte $3C ; |  XXXX  | $9968
    .byte $E0 ; |XXX     | $9969
    .byte $C0 ; |XX      | $996A
    .byte $FC ; |XXXXXX  | $996B
    .byte $70 ; | XXX    | $996C
    .byte $6C ; | XX XX  | $996D
    .byte $48 ; | X  X   | $996E
    .byte $78 ; | XXXX   | $996F
    .byte $74 ; | XXX X  | $9970
    .byte $46 ; | X   XX | $9971
    .byte $00 ; |        | $9972
    .byte $3C ; |  XXXX  | $9973
    .byte $E0 ; |XXX     | $9974
    .byte $C0 ; |XX      | $9975
    .byte $FC ; |XXXXXX  | $9976
    .byte $70 ; | XXX    | $9977
    .byte $1C ; |   XXX  | $9978
    .byte $0C ; |    XX  | $9979
    .byte $1E ; |   XXXX | $997A
    .byte $2E ; |  X XXX | $997B
    .byte $42 ; | X    X | $997C
    .byte $00 ; |        | $997D
    .byte $3C ; |  XXXX  | $997E
    .byte $07 ; |     XXX| $997F
    .byte $03 ; |      XX| $9980
    .byte $3F ; |  XXXXXX| $9981
    .byte $0E ; |    XXX | $9982
    .byte $0C ; |    XX  | $9983
    .byte $64 ; | XX  X  | $9984
    .byte $1E ; |   XXXX | $9985
    .byte $2E ; |  X XXX | $9986
    .byte $42 ; | X    X | $9987
    .byte $00 ; |        | $9988
    .byte $3C ; |  XXXX  | $9989
    .byte $07 ; |     XXX| $998A
    .byte $03 ; |      XX| $998B
    .byte $3F ; |  XXXXXX| $998C
    .byte $0E ; |    XXX | $998D
    .byte $36 ; |  XX XX | $998E
    .byte $12 ; |   X  X | $998F
    .byte $1E ; |   XXXX | $9990
    .byte $2E ; |  X XXX | $9991
    .byte $62 ; | XX   X | $9992
    .byte $00 ; |        | $9993
    .byte $3C ; |  XXXX  | $9994
    .byte $07 ; |     XXX| $9995
    .byte $03 ; |      XX| $9996
    .byte $3F ; |  XXXXXX| $9997
L9998:
    .byte $0E ; |    XXX | $9998
    .byte $32 ; |  XX  X | $9999
    .byte $32 ; |  XX  X | $999A
    .byte $32 ; |  XX  X | $999B
    .byte $32 ; |  XX  X | $999C
    .byte $32 ; |  XX  X | $999D
    .byte $32 ; |  XX  X | $999E
    .byte $32 ; |  XX  X | $999F
    .byte $32 ; |  XX  X | $99A0
    .byte $32 ; |  XX  X | $99A1
    .byte $32 ; |  XX  X | $99A2
    .byte $32 ; |  XX  X | $99A3
    .byte $32 ; |  XX  X | $99A4
    .byte $32 ; |  XX  X | $99A5
    .byte $34 ; |  XX X  | $99A6
    .byte $34 ; |  XX X  | $99A7
    .byte $34 ; |  XX X  | $99A8
    .byte $34 ; |  XX X  | $99A9
    .byte $34 ; |  XX X  | $99AA
    .byte $34 ; |  XX X  | $99AB
    .byte $34 ; |  XX X  | $99AC
    .byte $34 ; |  XX X  | $99AD
    .byte $34 ; |  XX X  | $99AE
    .byte $34 ; |  XX X  | $99AF
    .byte $34 ; |  XX X  | $99B0
    .byte $34 ; |  XX X  | $99B1
    .byte $34 ; |  XX X  | $99B2
    .byte $26 ; |  X  XX | $99B3
    .byte $26 ; |  X  XX | $99B4
    .byte $26 ; |  X  XX | $99B5
    .byte $26 ; |  X  XX | $99B6
    .byte $26 ; |  X  XX | $99B7
    .byte $26 ; |  X  XX | $99B8
    .byte $26 ; |  X  XX | $99B9
    .byte $26 ; |  X  XX | $99BA
    .byte $26 ; |  X  XX | $99BB
    .byte $26 ; |  X  XX | $99BC
    .byte $26 ; |  X  XX | $99BD
    .byte $26 ; |  X  XX | $99BE
    .byte $26 ; |  X  XX | $99BF
    .byte $26 ; |  X  XX | $99C0
    .byte $26 ; |  X  XX | $99C1
    .byte $2A ; |  X X X | $99C2
    .byte $2A ; |  X X X | $99C3
    .byte $2A ; |  X X X | $99C4
    .byte $2A ; |  X X X | $99C5
    .byte $2A ; |  X X X | $99C6
    .byte $2A ; |  X X X | $99C7
    .byte $2A ; |  X X X | $99C8
    .byte $2A ; |  X X X | $99C9
    .byte $2A ; |  X X X | $99CA
    .byte $2A ; |  X X X | $99CB
L99CC:
    .byte $2A ; |  X X X | $99CC
    .byte $20 ; |  X     | $99CD
    .byte $41 ; | X     X| $99CE
    .byte $21 ; |  X    X| $99CF
    .byte $E0 ; |XXX     | $99D0
    .byte $21 ; |  X    X| $99D1
    .byte $20 ; |  X     | $99D2
    .byte $21 ; |  X    X| $99D3
    .byte $00 ; |        | $99D4
    .byte $40 ; | X      | $99D5
    .byte $00 ; |        | $99D6
    .byte $40 ; | X      | $99D7
    .byte $61 ; | XX    X| $99D8
    .byte $61 ; | XX    X| $99D9
    .byte $40 ; | X      | $99DA
    .byte $C0 ; |XX      | $99DB
    .byte $61 ; | XX    X| $99DC
    .byte $C1 ; |XX     X| $99DD
    .byte $61 ; | XX    X| $99DE
L99DF:
    .byte $81 ; |X      X| $99DF
    .byte $9E ; |X  XXXX | $99E0
    .byte $9E ; |X  XXXX | $99E1
    .byte $9E ; |X  XXXX | $99E2
    .byte $99 ; |X  XX  X| $99E3
    .byte $94 ; |X  X X  | $99E4
    .byte $9E ; |X  XXXX | $99E5
    .byte $9E ; |X  XXXX | $99E6
    .byte $9E ; |X  XXXX | $99E7
    .byte $9E ; |X  XXXX | $99E8
    .byte $9E ; |X  XXXX | $99E9
    .byte $94 ; |X  X X  | $99EA
    .byte $9E ; |X  XXXX | $99EB
    .byte $9B ; |X  XX XX| $99EC
    .byte $9E ; |X  XXXX | $99ED
    .byte $9E ; |X  XXXX | $99EE
    .byte $9D ; |X  XXX X| $99EF
    .byte $9D ; |X  XXX X| $99F0
    .byte $94 ; |X  X X  | $99F1
    .byte $9D ; |X  XXX X| $99F2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L99F3 SUBROUTINE
    cpy    ram_D3                ; 3
    bcc    L99F9                 ; 2³
    sty    ram_D3                ; 3
L99F9:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $CD ; |XX  XX X| $99FA
    .byte $D3 ; |XX X  XX| $99FB
    .byte $05 ; |     X X| $99FC
    .byte $D1 ; |XX X   X| $99FD
    .byte $E1 ; |XXX    X| $99FE
    .byte $C5 ; |XX   X X| $99FF
L9A00:
    .byte $2A ; |  X X X | $9A00
    .byte $0F ; |    XXXX| $9A01
    .byte $0F ; |    XXXX| $9A02
    .byte $1F ; |   XXXXX| $9A03
    .byte $1F ; |   XXXXX| $9A04
    .byte $3E ; |  XXXXX | $9A05
    .byte $3E ; |  XXXXX | $9A06
    .byte $3C ; |  XXXX  | $9A07
    .byte $3C ; |  XXXX  | $9A08
    .byte $3C ; |  XXXX  | $9A09
    .byte $3C ; |  XXXX  | $9A0A
    .byte $3C ; |  XXXX  | $9A0B
    .byte $3C ; |  XXXX  | $9A0C
    .byte $3C ; |  XXXX  | $9A0D
    .byte $3C ; |  XXXX  | $9A0E
    .byte $3C ; |  XXXX  | $9A0F
    .byte $3C ; |  XXXX  | $9A10
    .byte $3C ; |  XXXX  | $9A11
    .byte $3C ; |  XXXX  | $9A12
    .byte $3C ; |  XXXX  | $9A13
    .byte $3C ; |  XXXX  | $9A14
    .byte $3C ; |  XXXX  | $9A15
    .byte $3C ; |  XXXX  | $9A16
    .byte $3C ; |  XXXX  | $9A17
    .byte $3C ; |  XXXX  | $9A18
    .byte $00 ; |        | $9A19
    .byte $00 ; |        | $9A1A
    .byte $00 ; |        | $9A1B
    .byte $00 ; |        | $9A1C
    .byte $07 ; |     XXX| $9A1D
    .byte $07 ; |     XXX| $9A1E
    .byte $07 ; |     XXX| $9A1F
    .byte $07 ; |     XXX| $9A20
    .byte $87 ; |X    XXX| $9A21
    .byte $87 ; |X    XXX| $9A22
    .byte $C7 ; |XX   XXX| $9A23
    .byte $C7 ; |XX   XXX| $9A24
    .byte $C7 ; |XX   XXX| $9A25
    .byte $C7 ; |XX   XXX| $9A26
    .byte $C7 ; |XX   XXX| $9A27
    .byte $C7 ; |XX   XXX| $9A28
    .byte $C7 ; |XX   XXX| $9A29
    .byte $C7 ; |XX   XXX| $9A2A
    .byte $C7 ; |XX   XXX| $9A2B
    .byte $C7 ; |XX   XXX| $9A2C
    .byte $C7 ; |XX   XXX| $9A2D
    .byte $C7 ; |XX   XXX| $9A2E
    .byte $87 ; |X    XXX| $9A2F
    .byte $87 ; |X    XXX| $9A30
    .byte $07 ; |     XXX| $9A31
    .byte $07 ; |     XXX| $9A32
    .byte $07 ; |     XXX| $9A33
L9A34:
    .byte $07 ; |     XXX| $9A34
    .byte $A0 ; |X X     | $9A35
    .byte $09 ; |    X  X| $9A36
    .byte $09 ; |    X  X| $9A37
    .byte $00 ; |        | $9A38
    .byte $93 ; |X  X  XX| $9A39
    .byte $9C ; |X  XXX  | $9A3A
    .byte $8E ; |X   XXX | $9A3B
    .byte $DC ; |XX XXX  | $9A3C
    .byte $F4 ; |XXXX X  | $9A3D
    .byte $B0 ; |X XX    | $9A3E
    .byte $57 ; | X X XXX| $9A3F
    .byte $05 ; |     X X| $9A40
    .byte $73 ; | XXX  XX| $9A41
    .byte $00 ; |        | $9A42
    .byte $48 ; | X  X   | $9A43
    .byte $17 ; |   X XXX| $9A44
    .byte $2D ; |  X XX X| $9A45
    .byte $B8 ; |X XXX   | $9A46
L9A47:
    .byte $7C ; | XXXXX  | $9A47
    .byte $00 ; |        | $9A48
    .byte $51 ; | X X   X| $9A49
    .byte $51 ; | X X   X| $9A4A
    .byte $00 ; |        | $9A4B
    .byte $A2 ; |X X   X | $9A4C
    .byte $00 ; |        | $9A4D
    .byte $C4 ; |XX   X  | $9A4E
    .byte $00 ; |        | $9A4F
    .byte $00 ; |        | $9A50
    .byte $00 ; |        | $9A51
    .byte $00 ; |        | $9A52
    .byte $97 ; |X  X XXX| $9A53
    .byte $92 ; |X  X  X | $9A54
    .byte $00 ; |        | $9A55
    .byte $00 ; |        | $9A56
    .byte $00 ; |        | $9A57
    .byte $68 ; | XX X   | $9A58
    .byte $A9 ; |X X X  X| $9A59
    .byte $B9 ; |X XXX  X| $9A5A
L9A5B:
    .byte $00 ; |        | $9A5B
    .byte $00 ; |        | $9A5C
    .byte $77 ; | XXX XXX| $9A5D
    .byte $45 ; | X   X X| $9A5E
    .byte $77 ; | XXX XXX| $9A5F
    .byte $00 ; |        | $9A60
    .byte $00 ; |        | $9A61
    .byte $00 ; |        | $9A62
    .byte $00 ; |        | $9A63
    .byte $00 ; |        | $9A64
    .byte $04 ; |     X  | $9A65
    .byte $04 ; |     X  | $9A66
    .byte $06 ; |     XX | $9A67
    .byte $06 ; |     XX | $9A68
    .byte $07 ; |     XXX| $9A69
    .byte $03 ; |      XX| $9A6A
    .byte $03 ; |      XX| $9A6B
    .byte $03 ; |      XX| $9A6C
    .byte $01 ; |       X| $9A6D
    .byte $01 ; |       X| $9A6E
    .byte $01 ; |       X| $9A6F
    .byte $00 ; |        | $9A70
    .byte $00 ; |        | $9A71
    .byte $00 ; |        | $9A72
L9A73:
    .byte $00 ; |        | $9A73
    .byte $E0 ; |XXX     | $9A74
    .byte $F0 ; |XXXX    | $9A75
    .byte $F8 ; |XXXXX   | $9A76
    .byte $F8 ; |XXXXX   | $9A77
    .byte $FC ; |XXXXXX  | $9A78
    .byte $FC ; |XXXXXX  | $9A79
    .byte $7E ; | XXXXXX | $9A7A
    .byte $3E ; |  XXXXX | $9A7B
    .byte $1E ; |   XXXX | $9A7C
    .byte $1E ; |   XXXX | $9A7D
    .byte $1E ; |   XXXX | $9A7E
    .byte $1E ; |   XXXX | $9A7F
    .byte $1E ; |   XXXX | $9A80
    .byte $1E ; |   XXXX | $9A81
    .byte $1E ; |   XXXX | $9A82
    .byte $1E ; |   XXXX | $9A83
    .byte $3E ; |  XXXXX | $9A84
    .byte $7E ; | XXXXXX | $9A85
    .byte $FC ; |XXXXXX  | $9A86
    .byte $FC ; |XXXXXX  | $9A87
    .byte $F8 ; |XXXXX   | $9A88
    .byte $F8 ; |XXXXX   | $9A89
    .byte $F0 ; |XXXX    | $9A8A
    .byte $E0 ; |XXX     | $9A8B
    .byte $00 ; |        | $9A8C
    .byte $00 ; |        | $9A8D
    .byte $00 ; |        | $9A8E
    .byte $00 ; |        | $9A8F
    .byte $FC ; |XXXXXX  | $9A90
    .byte $FE ; |XXXXXXX | $9A91
    .byte $FF ; |XXXXXXXX| $9A92
    .byte $FF ; |XXXXXXXX| $9A93
    .byte $FF ; |XXXXXXXX| $9A94
    .byte $1F ; |   XXXXX| $9A95
    .byte $0F ; |    XXXX| $9A96
    .byte $07 ; |     XXX| $9A97
    .byte $03 ; |      XX| $9A98
    .byte $03 ; |      XX| $9A99
    .byte $03 ; |      XX| $9A9A
    .byte $03 ; |      XX| $9A9B
    .byte $03 ; |      XX| $9A9C
    .byte $03 ; |      XX| $9A9D
    .byte $03 ; |      XX| $9A9E
    .byte $03 ; |      XX| $9A9F
    .byte $07 ; |     XXX| $9AA0
    .byte $0F ; |    XXXX| $9AA1
    .byte $1F ; |   XXXXX| $9AA2
    .byte $FF ; |XXXXXXXX| $9AA3
    .byte $FF ; |XXXXXXXX| $9AA4
    .byte $FF ; |XXXXXXXX| $9AA5
    .byte $FE ; |XXXXXXX | $9AA6
L9AA7:
    .byte $FC ; |XXXXXX  | $9AA7
    .byte $F0 ; |XXXX    | $9AA8
    .byte $F0 ; |XXXX    | $9AA9
    .byte $F8 ; |XXXXX   | $9AAA
    .byte $F8 ; |XXXXX   | $9AAB
    .byte $7C ; | XXXXX  | $9AAC
    .byte $7C ; | XXXXX  | $9AAD
    .byte $3C ; |  XXXX  | $9AAE
    .byte $3C ; |  XXXX  | $9AAF
    .byte $3C ; |  XXXX  | $9AB0
    .byte $3C ; |  XXXX  | $9AB1
    .byte $3C ; |  XXXX  | $9AB2
    .byte $3C ; |  XXXX  | $9AB3
    .byte $3C ; |  XXXX  | $9AB4
    .byte $3C ; |  XXXX  | $9AB5
    .byte $3C ; |  XXXX  | $9AB6
    .byte $3C ; |  XXXX  | $9AB7
    .byte $3C ; |  XXXX  | $9AB8
    .byte $3C ; |  XXXX  | $9AB9
    .byte $3C ; |  XXXX  | $9ABA
    .byte $3C ; |  XXXX  | $9ABB
    .byte $3C ; |  XXXX  | $9ABC
    .byte $3C ; |  XXXX  | $9ABD
    .byte $3C ; |  XXXX  | $9ABE
    .byte $3C ; |  XXXX  | $9ABF
    .byte $00 ; |        | $9AC0
    .byte $00 ; |        | $9AC1
    .byte $00 ; |        | $9AC2
    .byte $00 ; |        | $9AC3
    .byte $E0 ; |XXX     | $9AC4
    .byte $E0 ; |XXX     | $9AC5
    .byte $E0 ; |XXX     | $9AC6
    .byte $E0 ; |XXX     | $9AC7
    .byte $E1 ; |XXX    X| $9AC8
    .byte $E1 ; |XXX    X| $9AC9
    .byte $E3 ; |XXX   XX| $9ACA
    .byte $E3 ; |XXX   XX| $9ACB
    .byte $E3 ; |XXX   XX| $9ACC
    .byte $E3 ; |XXX   XX| $9ACD
    .byte $E3 ; |XXX   XX| $9ACE
    .byte $E3 ; |XXX   XX| $9ACF
    .byte $E3 ; |XXX   XX| $9AD0
    .byte $E3 ; |XXX   XX| $9AD1
    .byte $E3 ; |XXX   XX| $9AD2
    .byte $E3 ; |XXX   XX| $9AD3
    .byte $E3 ; |XXX   XX| $9AD4
    .byte $E3 ; |XXX   XX| $9AD5
    .byte $E1 ; |XXX    X| $9AD6
    .byte $E1 ; |XXX    X| $9AD7
    .byte $E0 ; |XXX     | $9AD8
    .byte $E0 ; |XXX     | $9AD9
    .byte $E0 ; |XXX     | $9ADA
    .byte $E0 ; |XXX     | $9ADB
L9ADC:
    .byte $01 ; |       X| $9ADC
    .byte $00 ; |        | $9ADD
    .byte $4B ; | X  X XX| $9ADE
    .byte $4A ; | X  X X | $9ADF
    .byte $6B ; | XX X XX| $9AE0
    .byte $00 ; |        | $9AE1
    .byte $08 ; |    X   | $9AE2
    .byte $00 ; |        | $9AE3
    .byte $00 ; |        | $9AE4
    .byte $00 ; |        | $9AE5
    .byte $62 ; | XX   X | $9AE6
    .byte $62 ; | XX   X | $9AE7
    .byte $63 ; | XX   XX| $9AE8
    .byte $63 ; | XX   XX| $9AE9
    .byte $63 ; | XX   XX| $9AEA
    .byte $61 ; | XX    X| $9AEB
    .byte $61 ; | XX    X| $9AEC
    .byte $61 ; | XX    X| $9AED
    .byte $60 ; | XX     | $9AEE
    .byte $60 ; | XX     | $9AEF
    .byte $60 ; | XX     | $9AF0
    .byte $60 ; | XX     | $9AF1
    .byte $FC ; |XXXXXX  | $9AF2
    .byte $FC ; |XXXXXX  | $9AF3
    .byte $FC ; |XXXXXX  | $9AF4
L9AF5:
    .byte $00 ; |        | $9AF5
    .byte $00 ; |        | $9AF6
    .byte $03 ; |      XX| $9AF7
    .byte $03 ; |      XX| $9AF8
    .byte $05 ; |     X X| $9AF9
    .byte $05 ; |     X X| $9AFA
    .byte $05 ; |     X X| $9AFB
    .byte $00 ; |        | $9AFC
    .byte $DB ; |XX XX XX| $9AFD
    .byte $0D ; |    XX X| $9AFE
    .byte $C3 ; |XX    XX| $9AFF
    .byte $38 ; |  XXX   | $9B00
    .byte $6C ; | XX XX  | $9B01
    .byte $C6 ; |XX   XX | $9B02
    .byte $C6 ; |XX   XX | $9B03
    .byte $C6 ; |XX   XX | $9B04
    .byte $6C ; | XX XX  | $9B05
    .byte $38 ; |  XXX   | $9B06
    .byte $00 ; |        | $9B07
    .byte $7E ; | XXXXXX | $9B08
    .byte $18 ; |   XX   | $9B09
    .byte $18 ; |   XX   | $9B0A
    .byte $18 ; |   XX   | $9B0B
    .byte $18 ; |   XX   | $9B0C
    .byte $38 ; |  XXX   | $9B0D
    .byte $18 ; |   XX   | $9B0E
    .byte $00 ; |        | $9B0F
    .byte $FE ; |XXXXXXX | $9B10
    .byte $C0 ; |XX      | $9B11
    .byte $E0 ; |XXX     | $9B12
    .byte $3C ; |  XXXX  | $9B13
    .byte $06 ; |     XX | $9B14
    .byte $C6 ; |XX   XX | $9B15
    .byte $7C ; | XXXXX  | $9B16
    .byte $00 ; |        | $9B17
    .byte $FC ; |XXXXXX  | $9B18
    .byte $06 ; |     XX | $9B19
    .byte $06 ; |     XX | $9B1A
    .byte $7C ; | XXXXX  | $9B1B
    .byte $06 ; |     XX | $9B1C
    .byte $06 ; |     XX | $9B1D
    .byte $FC ; |XXXXXX  | $9B1E
    .byte $00 ; |        | $9B1F
    .byte $0C ; |    XX  | $9B20
    .byte $0C ; |    XX  | $9B21
    .byte $0C ; |    XX  | $9B22
    .byte $FE ; |XXXXXXX | $9B23
    .byte $CC ; |XX  XX  | $9B24
    .byte $CC ; |XX  XX  | $9B25
    .byte $CC ; |XX  XX  | $9B26
    .byte $00 ; |        | $9B27
    .byte $FC ; |XXXXXX  | $9B28
    .byte $06 ; |     XX | $9B29
    .byte $06 ; |     XX | $9B2A
    .byte $FC ; |XXXXXX  | $9B2B
    .byte $C0 ; |XX      | $9B2C
    .byte $C0 ; |XX      | $9B2D
    .byte $FC ; |XXXXXX  | $9B2E
    .byte $00 ; |        | $9B2F
    .byte $7C ; | XXXXX  | $9B30
    .byte $C6 ; |XX   XX | $9B31
    .byte $C6 ; |XX   XX | $9B32
    .byte $FC ; |XXXXXX  | $9B33
    .byte $C0 ; |XX      | $9B34
    .byte $C0 ; |XX      | $9B35
    .byte $7C ; | XXXXX  | $9B36
    .byte $00 ; |        | $9B37
    .byte $30 ; |  XX    | $9B38
    .byte $30 ; |  XX    | $9B39
    .byte $18 ; |   XX   | $9B3A
    .byte $18 ; |   XX   | $9B3B
    .byte $0C ; |    XX  | $9B3C
    .byte $06 ; |     XX | $9B3D
    .byte $FE ; |XXXXXXX | $9B3E
    .byte $00 ; |        | $9B3F
    .byte $7C ; | XXXXX  | $9B40
    .byte $C6 ; |XX   XX | $9B41
    .byte $C6 ; |XX   XX | $9B42
    .byte $7C ; | XXXXX  | $9B43
    .byte $C6 ; |XX   XX | $9B44
    .byte $C6 ; |XX   XX | $9B45
    .byte $7C ; | XXXXX  | $9B46
    .byte $00 ; |        | $9B47
    .byte $7C ; | XXXXX  | $9B48
    .byte $06 ; |     XX | $9B49
    .byte $06 ; |     XX | $9B4A
    .byte $7E ; | XXXXXX | $9B4B
    .byte $C6 ; |XX   XX | $9B4C
    .byte $C6 ; |XX   XX | $9B4D
    .byte $7C ; | XXXXX  | $9B4E
    .byte $00 ; |        | $9B4F
    .byte $00 ; |        | $9B50
    .byte $00 ; |        | $9B51
    .byte $00 ; |        | $9B52
    .byte $00 ; |        | $9B53
    .byte $00 ; |        | $9B54
    .byte $00 ; |        | $9B55
    .byte $00 ; |        | $9B56
    .byte $00 ; |        | $9B57
    .byte $38 ; |  XXX   | $9B58
    .byte $6C ; | XX XX  | $9B59
    .byte $6C ; | XX XX  | $9B5A
    .byte $7C ; | XXXXX  | $9B5B
    .byte $54 ; | X X X  | $9B5C
    .byte $BA ; |X XXX X | $9B5D
    .byte $C6 ; |XX   XX | $9B5E
L9B5F:
    .byte $00 ; |        | $9B5F
    .byte $04 ; |     X  | $9B60
    .byte $04 ; |     X  | $9B61
    .byte $04 ; |     X  | $9B62
    .byte $00 ; |        | $9B63
    .byte $01 ; |       X| $9B64
    .byte $0D ; |    XX X| $9B65
    .byte $07 ; |     XXX| $9B66
    .byte $04 ; |     X  | $9B67
    .byte $04 ; |     X  | $9B68
    .byte $04 ; |     X  | $9B69
    .byte $00 ; |        | $9B6A
    .byte $04 ; |     X  | $9B6B
    .byte $04 ; |     X  | $9B6C
    .byte $04 ; |     X  | $9B6D
    .byte $04 ; |     X  | $9B6E
    .byte $0D ; |    XX X| $9B6F
    .byte $04 ; |     X  | $9B70
    .byte $0D ; |    XX X| $9B71
    .byte $04 ; |     X  | $9B72
    .byte $17 ; |   X XXX| $9B73
    .byte $00 ; |        | $9B74
    .byte $17 ; |   X XXX| $9B75
    .byte $00 ; |        | $9B76
    .byte $1C ; |   XXX  | $9B77
    .byte $00 ; |        | $9B78
    .byte $17 ; |   X XXX| $9B79
    .byte $00 ; |        | $9B7A
    .byte $14 ; |   X X  | $9B7B
    .byte $00 ; |        | $9B7C
    .byte $12 ; |   X  X | $9B7D
    .byte $00 ; |        | $9B7E
    .byte $11 ; |   X   X| $9B7F
    .byte $00 ; |        | $9B80
    .byte $0F ; |    XXXX| $9B81
    .byte $00 ; |        | $9B82
    .byte $0D ; |    XX X| $9B83
    .byte $00 ; |        | $9B84
    .byte $0D ; |    XX X| $9B85
    .byte $00 ; |        | $9B86
    .byte $0D ; |    XX X| $9B87
    .byte $00 ; |        | $9B88
    .byte $0D ; |    XX X| $9B89
    .byte $00 ; |        | $9B8A
    .byte $00 ; |        | $9B8B
    .byte $00 ; |        | $9B8C
    .byte $00 ; |        | $9B8D
    .byte $00 ; |        | $9B8E
    .byte $00 ; |        | $9B8F
    .byte $00 ; |        | $9B90
    .byte $00 ; |        | $9B91
    .byte $0B ; |    X XX| $9B92
    .byte $00 ; |        | $9B93
    .byte $0F ; |    XXXX| $9B94
    .byte $00 ; |        | $9B95
    .byte $00 ; |        | $9B96
    .byte $00 ; |        | $9B97
    .byte $0F ; |    XXXX| $9B98
    .byte $00 ; |        | $9B99
    .byte $0B ; |    X XX| $9B9A
    .byte $00 ; |        | $9B9B
    .byte $0F ; |    XXXX| $9B9C
    .byte $00 ; |        | $9B9D
    .byte $00 ; |        | $9B9E
    .byte $00 ; |        | $9B9F
    .byte $0F ; |    XXXX| $9BA0
    .byte $00 ; |        | $9BA1
    .byte $0B ; |    X XX| $9BA2
    .byte $00 ; |        | $9BA3
    .byte $0F ; |    XXXX| $9BA4
    .byte $00 ; |        | $9BA5
    .byte $00 ; |        | $9BA6
    .byte $00 ; |        | $9BA7
    .byte $0F ; |    XXXX| $9BA8
    .byte $00 ; |        | $9BA9
    .byte $00 ; |        | $9BAA
    .byte $00 ; |        | $9BAB
    .byte $0F ; |    XXXX| $9BAC
    .byte $00 ; |        | $9BAD
    .byte $0F ; |    XXXX| $9BAE
    .byte $00 ; |        | $9BAF
    .byte $0F ; |    XXXX| $9BB0

L9BB1:
    lda    ram_F6                ; 3
    tay                          ; 2
    and    #$60                  ; 2
    cmp    #$60                  ; 2
    bne    L9BF6                 ; 2³
    tya                          ; 2
    and    #$1C                  ; 2
    cmp    #$1C                  ; 2
    beq    L9BF6                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    sc_16|READ,X          ; 4
    bpl    L9BF6                 ; 2³
    lda    sc_71|READ,X          ; 4
    cmp    sc_7A|READ            ; 4
    bne    L9BF6                 ; 2³
    lda    sc_01|READ,X          ; 4
    cmp    sc_0A|READ            ; 4
    bne    L9BF6                 ; 2³
    lda    #$40                  ; 2
    sta    sc_16,X               ; 5
    lda    #0                    ; 2
    sta    sc_71,X               ; 5
    ldx    ram_80                ; 3
    cpx    #$13                  ; 2
    bcc    L9BEB                 ; 2³
    ldx    #$12                  ; 2
L9BEB:
    ldy    L96D4,X               ; 4
    jsr    L9817                 ; 6
    ldy    #$0E                  ; 2
    jsr    L99F3                 ; 6
L9BF6:
    jmp    L9CF6                 ; 3

L9BF9:
    ldx    #6                    ; 2
L9BFB:
    lda    ram_F9,X              ; 4
    bpl    L9C07                 ; 2³+1
    lda    sc_16|READ,X          ; 4
    tay                          ; 2
    and    #$08                  ; 2
    bne    L9C0A                 ; 2³
L9C07:
    jmp    L9CF0                 ; 3

L9C0A:
    tya                          ; 2
    and    #$C0                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_EC                ; 3
    tya                          ; 2
    and    #$07                  ; 2
    cmp    #7                    ; 2
    bne    L9C8A                 ; 2³
    ldy    #0                    ; 2
    lda    sc_71|READ,X          ; 4
    adc    #4                    ; 2
L9C20:
    sec                          ; 2
    sbc    #$0C                  ; 2
    bmi    L9C28                 ; 2³
    iny                          ; 2
    bpl    L9C20                 ; 2³
L9C28:
    lda    #$40                  ; 2
    and    sc_16|READ,X          ; 4
    beq    L9C3B                 ; 2³
    lda    ram_F1                ; 3
    and    #$C0                  ; 2
    cmp    #$C0                  ; 2
    beq    L9C3B                 ; 2³
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
L9C3B:
    lda    L96CD,Y               ; 4
    tay                          ; 2
    lda    #0                    ; 2
    jsr    L9817                 ; 6
    ldy    #$0A                  ; 2
    jsr    L99F3                 ; 6
    lda    ram_F6                ; 3
    and    #$1C                  ; 2
    cmp    #$1C                  ; 2
    bne    L9C5F                 ; 2³
    txa                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    #$E3                  ; 2
    and    ram_F6                ; 3
    sta    ram_F6                ; 3
    lda    #0                    ; 2
    sta    sc_16,X               ; 5
L9C5F:
    lda    #0                    ; 2
    sta    ram_F9,X              ; 4
    sta    sc_71,X               ; 5
    dec    ram_F4                ; 5
    lda    ram_F4                ; 3
    and    #$07                  ; 2
    cmp    #1                    ; 2
    bne    L9C7F                 ; 2³
    lda    ram_80                ; 3
    beq    L9C7A                 ; 2³
    lda    ram_F3                ; 3
    ora    #$02                  ; 2
    sta    ram_F3                ; 3
L9C7A:
    ldy    #$0D                  ; 2
    jsr    L99F3                 ; 6
L9C7F:
    lda    #$3F                  ; 2
    and    ram_F3                ; 3
    ora    #$20                  ; 2
    sta    ram_F3                ; 3
    jmp    L9CF0                 ; 3

L9C8A:
    cpx    ram_DD                ; 3
    bne    L9CAC                 ; 2³
    lda    ram_F3                ; 3
    bpl    L9CAC                 ; 2³
    and    #$60                  ; 2
    cmp    #$40                  ; 2
    beq    L9CAC                 ; 2³
    bcs    L9CA0                 ; 2³
    lda    ram_F0                ; 3
    and    #$0F                  ; 2
    bne    L9CF0                 ; 2³
L9CA0:
    lda    ram_F3                ; 3
    and    #$9F                  ; 2
    sta    ram_F3                ; 3
    tya                          ; 2
    clc                          ; 2
    adc    #1                    ; 2
    bne    L9CBB                 ; 2³
L9CAC:
    tya                          ; 2
    and    #$07                  ; 2
    beq    L9CCC                 ; 2³
    lda    ram_F0                ; 3
    and    #$1F                  ; 2
    bne    L9CF0                 ; 2³
    tya                          ; 2
    sec                          ; 2
    sbc    #1                    ; 2
L9CBB:
    sta    sc_16,X               ; 5
    and    #$07                  ; 2
    clc                          ; 2
    adc    ram_EC                ; 3
    tay                          ; 2
    lda    L96AD,Y               ; 4
    sta    sc_0B,X               ; 5
    bne    L9CF0                 ; 2³
L9CCC:
    lda    ram_F5                ; 3
    and    #$03                  ; 2
    sta    ram_D5                ; 3
    lda    ram_F9,X              ; 4
    and    #$30                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    cmp    ram_D5                ; 3
    bne    L9CF0                 ; 2³
    tya                          ; 2
    and    #$F0                  ; 2
    sta    sc_16,X               ; 5
    lda    ram_F9,X              ; 4
    and    #$BF                  ; 2
    sta    ram_F9,X              ; 4
    lda    #$7F                  ; 2
    and    ram_F3                ; 3
    sta    ram_F3                ; 3
L9CF0:
    dex                          ; 2
    bmi    L9CF6                 ; 2³
    jmp    L9BFB                 ; 3

L9CF6:
    jsr    L9F00                 ; 6
    jmp    L9FF0                 ; 3   goto LB189

    .byte $20 ; |  X     | $9CFC
    .byte $53 ; | X X  XX| $9CFD
    .byte $63 ; | XX   XX| $9CFE
    .byte $72 ; | XXX  X | $9CFF
    .byte $00 ; |        | $9D00
    .byte $00 ; |        | $9D01
    .byte $13 ; |   X  XX| $9D02
    .byte $00 ; |        | $9D03
    .byte $13 ; |   X  XX| $9D04
    .byte $00 ; |        | $9D05
    .byte $13 ; |   X  XX| $9D06
    .byte $00 ; |        | $9D07
    .byte $00 ; |        | $9D08
    .byte $00 ; |        | $9D09
    .byte $13 ; |   X  XX| $9D0A
    .byte $00 ; |        | $9D0B
    .byte $13 ; |   X  XX| $9D0C
    .byte $00 ; |        | $9D0D
    .byte $13 ; |   X  XX| $9D0E
    .byte $00 ; |        | $9D0F
    .byte $00 ; |        | $9D10
    .byte $00 ; |        | $9D11
    .byte $13 ; |   X  XX| $9D12
    .byte $00 ; |        | $9D13
    .byte $13 ; |   X  XX| $9D14
    .byte $00 ; |        | $9D15
    .byte $13 ; |   X  XX| $9D16
    .byte $0F ; |    XXXX| $9D17
    .byte $00 ; |        | $9D18
    .byte $12 ; |   X  X | $9D19
    .byte $00 ; |        | $9D1A
    .byte $11 ; |   X   X| $9D1B
    .byte $00 ; |        | $9D1C
    .byte $12 ; |   X  X | $9D1D
    .byte $00 ; |        | $9D1E
    .byte $0E ; |    XXX | $9D1F
    .byte $00 ; |        | $9D20
    .byte $12 ; |   X  X | $9D21
    .byte $00 ; |        | $9D22
    .byte $11 ; |   X   X| $9D23
    .byte $00 ; |        | $9D24
    .byte $12 ; |   X  X | $9D25
    .byte $00 ; |        | $9D26
    .byte $0D ; |    XX X| $9D27
    .byte $00 ; |        | $9D28
    .byte $12 ; |   X  X | $9D29
    .byte $00 ; |        | $9D2A
    .byte $11 ; |   X   X| $9D2B
    .byte $00 ; |        | $9D2C
    .byte $12 ; |   X  X | $9D2D
    .byte $11 ; |   X   X| $9D2E
    .byte $10 ; |   X    | $9D2F
    .byte $0F ; |    XXXX| $9D30
    .byte $00 ; |        | $9D31
    .byte $12 ; |   X  X | $9D32
    .byte $11 ; |   X   X| $9D33
    .byte $00 ; |        | $9D34
    .byte $14 ; |   X X  | $9D35
    .byte $12 ; |   X  X | $9D36
    .byte $00 ; |        | $9D37
    .byte $17 ; |   X XXX| $9D38
    .byte $14 ; |   X X  | $9D39
    .byte $00 ; |        | $9D3A
    .byte $18 ; |   XX   | $9D3B
    .byte $17 ; |   X XXX| $9D3C
    .byte $17 ; |   X XXX| $9D3D
    .byte $00 ; |        | $9D3E
    .byte $0B ; |    X XX| $9D3F
    .byte $0B ; |    X XX| $9D40
L9D41:
    .byte $17 ; |   X XXX| $9D41
    .byte $03 ; |      XX| $9D42
    .byte $02 ; |      X | $9D43
    .byte $02 ; |      X | $9D44
    .byte $00 ; |        | $9D45
    .byte $03 ; |      XX| $9D46
    .byte $03 ; |      XX| $9D47
    .byte $03 ; |      XX| $9D48
    .byte $00 ; |        | $9D49
    .byte $03 ; |      XX| $9D4A
    .byte $04 ; |     X  | $9D4B
    .byte $07 ; |     XXX| $9D4C
    .byte $04 ; |     X  | $9D4D
    .byte $04 ; |     X  | $9D4E
    .byte $07 ; |     XXX| $9D4F
    .byte $05 ; |     X X| $9D50
    .byte $03 ; |      XX| $9D51
    .byte $04 ; |     X  | $9D52
    .byte $00 ; |        | $9D53
L9D54:
    .byte $04 ; |     X  | $9D54
    .byte $00 ; |        | $9D55
    .byte $02 ; |      X | $9D56
    .byte $02 ; |      X | $9D57
    .byte $00 ; |        | $9D58
    .byte $03 ; |      XX| $9D59
    .byte $00 ; |        | $9D5A
    .byte $03 ; |      XX| $9D5B
    .byte $00 ; |        | $9D5C
    .byte $00 ; |        | $9D5D
    .byte $00 ; |        | $9D5E
    .byte $00 ; |        | $9D5F
    .byte $07 ; |     XXX| $9D60
    .byte $03 ; |      XX| $9D61
    .byte $00 ; |        | $9D62
    .byte $00 ; |        | $9D63
    .byte $03 ; |      XX| $9D64
    .byte $04 ; |     X  | $9D65
    .byte $00 ; |        | $9D66
    .byte $04 ; |     X  | $9D67
    .byte $00 ; |        | $9D68
    .byte $00 ; |        | $9D69
    .byte $00 ; |        | $9D6A
    .byte $14 ; |   X X  | $9D6B
    .byte $00 ; |        | $9D6C
    .byte $00 ; |        | $9D6D
    .byte $13 ; |   X  XX| $9D6E
    .byte $00 ; |        | $9D6F
    .byte $00 ; |        | $9D70
    .byte $12 ; |   X  X | $9D71
    .byte $00 ; |        | $9D72
    .byte $00 ; |        | $9D73
    .byte $10 ; |   X    | $9D74
    .byte $00 ; |        | $9D75
    .byte $00 ; |        | $9D76
    .byte $0F ; |    XXXX| $9D77
    .byte $00 ; |        | $9D78
    .byte $00 ; |        | $9D79
    .byte $00 ; |        | $9D7A
    .byte $00 ; |        | $9D7B
    .byte $0F ; |    XXXX| $9D7C
    .byte $00 ; |        | $9D7D
    .byte $0F ; |    XXXX| $9D7E
    .byte $00 ; |        | $9D7F
    .byte $0F ; |    XXXX| $9D80
    .byte $00 ; |        | $9D81
    .byte $0F ; |    XXXX| $9D82
    .byte $0F ; |    XXXX| $9D83
    .byte $0F ; |    XXXX| $9D84
    .byte $0F ; |    XXXX| $9D85
    .byte $12 ; |   X  X | $9D86
    .byte $12 ; |   X  X | $9D87
    .byte $12 ; |   X  X | $9D88
    .byte $12 ; |   X  X | $9D89
    .byte $0F ; |    XXXX| $9D8A
    .byte $0F ; |    XXXX| $9D8B
    .byte $12 ; |   X  X | $9D8C
    .byte $12 ; |   X  X | $9D8D
    .byte $12 ; |   X  X | $9D8E
    .byte $12 ; |   X  X | $9D8F
    .byte $0F ; |    XXXX| $9D90
    .byte $0F ; |    XXXX| $9D91
    .byte $0D ; |    XX X| $9D92
    .byte $0D ; |    XX X| $9D93
    .byte $12 ; |   X  X | $9D94
    .byte $00 ; |        | $9D95
    .byte $12 ; |   X  X | $9D96
    .byte $00 ; |        | $9D97
    .byte $12 ; |   X  X | $9D98
    .byte $12 ; |   X  X | $9D99
    .byte $12 ; |   X  X | $9D9A
    .byte $12 ; |   X  X | $9D9B
    .byte $14 ; |   X X  | $9D9C
    .byte $14 ; |   X X  | $9D9D
    .byte $17 ; |   X XXX| $9D9E
    .byte $17 ; |   X XXX| $9D9F
    .byte $17 ; |   X XXX| $9DA0
    .byte $17 ; |   X XXX| $9DA1
    .byte $16 ; |   X XX | $9DA2
    .byte $16 ; |   X XX | $9DA3
    .byte $16 ; |   X XX | $9DA4
    .byte $16 ; |   X XX | $9DA5
    .byte $1F ; |   XXXXX| $9DA6
    .byte $1F ; |   XXXXX| $9DA7
    .byte $1F ; |   XXXXX| $9DA8
    .byte $1F ; |   XXXXX| $9DA9
    .byte $16 ; |   X XX | $9DAA
    .byte $16 ; |   X XX | $9DAB
    .byte $1F ; |   XXXXX| $9DAC
    .byte $1F ; |   XXXXX| $9DAD
    .byte $1F ; |   XXXXX| $9DAE
    .byte $1F ; |   XXXXX| $9DAF
    .byte $16 ; |   X XX | $9DB0
    .byte $16 ; |   X XX | $9DB1
    .byte $16 ; |   X XX | $9DB2
    .byte $16 ; |   X XX | $9DB3
    .byte $14 ; |   X X  | $9DB4
    .byte $00 ; |        | $9DB5
    .byte $14 ; |   X X  | $9DB6
    .byte $00 ; |        | $9DB7
    .byte $14 ; |   X X  | $9DB8
    .byte $14 ; |   X X  | $9DB9
    .byte $14 ; |   X X  | $9DBA
    .byte $12 ; |   X  X | $9DBB
    .byte $12 ; |   X  X | $9DBC
    .byte $10 ; |   X    | $9DBD
    .byte $10 ; |   X    | $9DBE
    .byte $0F ; |    XXXX| $9DBF
    .byte $0F ; |    XXXX| $9DC0
    .byte $14 ; |   X X  | $9DC1
    .byte $14 ; |   X X  | $9DC2
    .byte $0F ; |    XXXX| $9DC3
    .byte $0F ; |    XXXX| $9DC4
    .byte $14 ; |   X X  | $9DC5
    .byte $14 ; |   X X  | $9DC6
    .byte $0F ; |    XXXX| $9DC7
    .byte $0F ; |    XXXX| $9DC8
    .byte $14 ; |   X X  | $9DC9
    .byte $14 ; |   X X  | $9DCA
    .byte $0F ; |    XXXX| $9DCB
    .byte $0F ; |    XXXX| $9DCC
    .byte $14 ; |   X X  | $9DCD
    .byte $14 ; |   X X  | $9DCE
    .byte $0F ; |    XXXX| $9DCF
    .byte $0F ; |    XXXX| $9DD0
    .byte $14 ; |   X X  | $9DD1
    .byte $14 ; |   X X  | $9DD2
    .byte $0F ; |    XXXX| $9DD3
    .byte $0F ; |    XXXX| $9DD4
    .byte $14 ; |   X X  | $9DD5
    .byte $14 ; |   X X  | $9DD6
    .byte $0F ; |    XXXX| $9DD7
    .byte $0F ; |    XXXX| $9DD8
    .byte $14 ; |   X X  | $9DD9
    .byte $14 ; |   X X  | $9DDA
    .byte $0F ; |    XXXX| $9DDB
    .byte $0F ; |    XXXX| $9DDC
    .byte $14 ; |   X X  | $9DDD
    .byte $14 ; |   X X  | $9DDE
    .byte $11 ; |   X   X| $9DDF
    .byte $11 ; |   X   X| $9DE0
    .byte $14 ; |   X X  | $9DE1
    .byte $00 ; |        | $9DE2
    .byte $14 ; |   X X  | $9DE3
    .byte $00 ; |        | $9DE4
    .byte $14 ; |   X X  | $9DE5
    .byte $00 ; |        | $9DE6
    .byte $11 ; |   X   X| $9DE7
    .byte $11 ; |   X   X| $9DE8
    .byte $14 ; |   X X  | $9DE9
    .byte $14 ; |   X X  | $9DEA
    .byte $11 ; |   X   X| $9DEB
    .byte $11 ; |   X   X| $9DEC
    .byte $14 ; |   X X  | $9DED
    .byte $14 ; |   X X  | $9DEE
    .byte $10 ; |   X    | $9DEF
    .byte $10 ; |   X    | $9DF0
    .byte $14 ; |   X X  | $9DF1
    .byte $14 ; |   X X  | $9DF2
    .byte $10 ; |   X    | $9DF3
    .byte $10 ; |   X    | $9DF4
    .byte $14 ; |   X X  | $9DF5
    .byte $14 ; |   X X  | $9DF6
    .byte $10 ; |   X    | $9DF7
L9DF8:
    .byte $00 ; |        | $9DF8  lives display
    .byte $80 ; |X       | $9DF9
    .byte $A0 ; |X X     | $9DFA
    .byte $A8 ; |X X X   | $9DFB
    .byte $AA ; |X X X X | $9DFC
    .byte $AA ; |X X X X | $9DFD
    .byte $AA ; |X X X X | $9DFE
    .byte $AA ; |X X X X | $9DFF

    .byte $12 ; |   X  X | $9E00
    .byte $11 ; |   X   X| $9E01
    .byte $10 ; |   X    | $9E02
    .byte $0F ; |    XXXX| $9E03
    .byte $0D ; |    XX X| $9E04
    .byte $0F ; |    XXXX| $9E05
    .byte $12 ; |   X  X | $9E06
    .byte $15 ; |   X X X| $9E07
    .byte $19 ; |   XX  X| $9E08
    .byte $0F ; |    XXXX| $9E09
    .byte $00 ; |        | $9E0A
    .byte $0F ; |    XXXX| $9E0B
    .byte $00 ; |        | $9E0C
    .byte $0F ; |    XXXX| $9E0D
    .byte $0F ; |    XXXX| $9E0E
    .byte $0F ; |    XXXX| $9E0F
    .byte $00 ; |        | $9E10
    .byte $0F ; |    XXXX| $9E11
    .byte $00 ; |        | $9E12
    .byte $0F ; |    XXXX| $9E13
    .byte $00 ; |        | $9E14
    .byte $0F ; |    XXXX| $9E15
    .byte $00 ; |        | $9E16
    .byte $0F ; |    XXXX| $9E17
    .byte $00 ; |        | $9E18
    .byte $0F ; |    XXXX| $9E19
    .byte $00 ; |        | $9E1A
    .byte $0F ; |    XXXX| $9E1B
    .byte $00 ; |        | $9E1C
    .byte $0F ; |    XXXX| $9E1D
    .byte $0F ; |    XXXX| $9E1E
    .byte $0F ; |    XXXX| $9E1F
    .byte $00 ; |        | $9E20
    .byte $0F ; |    XXXX| $9E21
    .byte $00 ; |        | $9E22
    .byte $0F ; |    XXXX| $9E23
    .byte $00 ; |        | $9E24
    .byte $0F ; |    XXXX| $9E25
    .byte $00 ; |        | $9E26
    .byte $12 ; |   X  X | $9E27
    .byte $12 ; |   X  X | $9E28
    .byte $11 ; |   X   X| $9E29
    .byte $11 ; |   X   X| $9E2A
    .byte $11 ; |   X   X| $9E2B
    .byte $00 ; |        | $9E2C
    .byte $11 ; |   X   X| $9E2D
    .byte $11 ; |   X   X| $9E2E
    .byte $11 ; |   X   X| $9E2F
    .byte $00 ; |        | $9E30
    .byte $11 ; |   X   X| $9E31
    .byte $11 ; |   X   X| $9E32
    .byte $12 ; |   X  X | $9E33
    .byte $12 ; |   X  X | $9E34
    .byte $11 ; |   X   X| $9E35
    .byte $11 ; |   X   X| $9E36
    .byte $0F ; |    XXXX| $9E37
    .byte $0F ; |    XXXX| $9E38
    .byte $11 ; |   X   X| $9E39
    .byte $11 ; |   X   X| $9E3A
    .byte $11 ; |   X   X| $9E3B
    .byte $00 ; |        | $9E3C
    .byte $11 ; |   X   X| $9E3D
    .byte $11 ; |   X   X| $9E3E
    .byte $11 ; |   X   X| $9E3F
    .byte $00 ; |        | $9E40
    .byte $11 ; |   X   X| $9E41
    .byte $11 ; |   X   X| $9E42
    .byte $12 ; |   X  X | $9E43
    .byte $12 ; |   X  X | $9E44
    .byte $11 ; |   X   X| $9E45
    .byte $11 ; |   X   X| $9E46
    .byte $10 ; |   X    | $9E47
    .byte $17 ; |   X XXX| $9E48
    .byte $14 ; |   X X  | $9E49
    .byte $12 ; |   X  X | $9E4A
    .byte $17 ; |   X XXX| $9E4B
    .byte $1F ; |   XXXXX| $9E4C
    .byte $00 ; |        | $9E4D
    .byte $0D ; |    XX X| $9E4E
    .byte $00 ; |        | $9E4F
    .byte $0F ; |    XXXX| $9E50
    .byte $0F ; |    XXXX| $9E51
    .byte $0F ; |    XXXX| $9E52
    .byte $0F ; |    XXXX| $9E53
    .byte $00 ; |        | $9E54
    .byte $0F ; |    XXXX| $9E55
    .byte $0F ; |    XXXX| $9E56
    .byte $0F ; |    XXXX| $9E57
    .byte $00 ; |        | $9E58
    .byte $10 ; |   X    | $9E59
    .byte $10 ; |   X    | $9E5A
    .byte $10 ; |   X    | $9E5B
    .byte $00 ; |        | $9E5C
    .byte $10 ; |   X    | $9E5D
    .byte $10 ; |   X    | $9E5E
    .byte $10 ; |   X    | $9E5F
    .byte $00 ; |        | $9E60
    .byte $11 ; |   X   X| $9E61
    .byte $11 ; |   X   X| $9E62
    .byte $11 ; |   X   X| $9E63
    .byte $00 ; |        | $9E64
    .byte $11 ; |   X   X| $9E65
    .byte $11 ; |   X   X| $9E66
    .byte $11 ; |   X   X| $9E67
    .byte $00 ; |        | $9E68
    .byte $12 ; |   X  X | $9E69
    .byte $12 ; |   X  X | $9E6A
    .byte $12 ; |   X  X | $9E6B
    .byte $00 ; |        | $9E6C
    .byte $12 ; |   X  X | $9E6D
    .byte $12 ; |   X  X | $9E6E
    .byte $12 ; |   X  X | $9E6F
    .byte $00 ; |        | $9E70
    .byte $13 ; |   X  XX| $9E71
    .byte $13 ; |   X  XX| $9E72
    .byte $13 ; |   X  XX| $9E73
    .byte $00 ; |        | $9E74
    .byte $13 ; |   X  XX| $9E75
    .byte $13 ; |   X  XX| $9E76
    .byte $13 ; |   X  XX| $9E77
    .byte $00 ; |        | $9E78
    .byte $13 ; |   X  XX| $9E79
    .byte $13 ; |   X  XX| $9E7A
    .byte $13 ; |   X  XX| $9E7B
    .byte $00 ; |        | $9E7C
    .byte $13 ; |   X  XX| $9E7D
    .byte $13 ; |   X  XX| $9E7E
    .byte $13 ; |   X  XX| $9E7F
    .byte $00 ; |        | $9E80
    .byte $14 ; |   X X  | $9E81
    .byte $14 ; |   X X  | $9E82
    .byte $14 ; |   X X  | $9E83
    .byte $00 ; |        | $9E84
    .byte $14 ; |   X X  | $9E85
    .byte $14 ; |   X X  | $9E86
    .byte $14 ; |   X X  | $9E87
    .byte $00 ; |        | $9E88
    .byte $12 ; |   X  X | $9E89
    .byte $12 ; |   X  X | $9E8A
    .byte $12 ; |   X  X | $9E8B
    .byte $00 ; |        | $9E8C
    .byte $10 ; |   X    | $9E8D
    .byte $10 ; |   X    | $9E8E
    .byte $10 ; |   X    | $9E8F
    .byte $0F ; |    XXXX| $9E90
    .byte $0F ; |    XXXX| $9E91
    .byte $0E ; |    XXX | $9E92
    .byte $0E ; |    XXX | $9E93
    .byte $0D ; |    XX X| $9E94
    .byte $0D ; |    XX X| $9E95
    .byte $0E ; |    XXX | $9E96
    .byte $0E ; |    XXX | $9E97
    .byte $11 ; |   X   X| $9E98
    .byte $14 ; |   X X  | $9E99
    .byte $18 ; |   XX   | $9E9A
    .byte $0E ; |    XXX | $9E9B
    .byte $14 ; |   X X  | $9E9C
    .byte $12 ; |   X  X | $9E9D
    .byte $14 ; |   X X  | $9E9E
    .byte $13 ; |   X  XX| $9E9F
    .byte $0F ; |    XXXX| $9EA0
    .byte $0E ; |    XXX | $9EA1
    .byte $0F ; |    XXXX| $9EA2
    .byte $0E ; |    XXX | $9EA3
    .byte $0F ; |    XXXX| $9EA4
    .byte $0E ; |    XXX | $9EA5
    .byte $0F ; |    XXXX| $9EA6
    .byte $0E ; |    XXX | $9EA7
    .byte $0F ; |    XXXX| $9EA8
    .byte $0E ; |    XXX | $9EA9
    .byte $0F ; |    XXXX| $9EAA
    .byte $0E ; |    XXX | $9EAB
    .byte $1F ; |   XXXXX| $9EAC
    .byte $1E ; |   XXXX | $9EAD
    .byte $1F ; |   XXXXX| $9EAE
    .byte $1E ; |   XXXX | $9EAF
    .byte $1F ; |   XXXXX| $9EB0
    .byte $1E ; |   XXXX | $9EB1
    .byte $1F ; |   XXXXX| $9EB2
    .byte $1E ; |   XXXX | $9EB3
    .byte $1F ; |   XXXXX| $9EB4
    .byte $1E ; |   XXXX | $9EB5
    .byte $1F ; |   XXXXX| $9EB6
    .byte $1E ; |   XXXX | $9EB7
    .byte $0F ; |    XXXX| $9EB8
    .byte $0E ; |    XXX | $9EB9
    .byte $0F ; |    XXXX| $9EBA
    .byte $10 ; |   X    | $9EBB
    .byte $11 ; |   X   X| $9EBC
    .byte $10 ; |   X    | $9EBD
    .byte $0E ; |    XXX | $9EBE
    .byte $0D ; |    XX X| $9EBF
    .byte $0E ; |    XXX | $9EC0
    .byte $0F ; |    XXXX| $9EC1
    .byte $0E ; |    XXX | $9EC2
    .byte $0F ; |    XXXX| $9EC3
L9EC4:
    .byte $0A ; |    X X | $9EC4
    .byte $00 ; |        | $9EC5
    .byte $0A ; |    X X | $9EC6
    .byte $00 ; |        | $9EC7
    .byte $0A ; |    X X | $9EC8
    .byte $00 ; |        | $9EC9
    .byte $0A ; |    X X | $9ECA
    .byte $00 ; |        | $9ECB
    .byte $0A ; |    X X | $9ECC
    .byte $00 ; |        | $9ECD
    .byte $0A ; |    X X | $9ECE
    .byte $00 ; |        | $9ECF
    .byte $0A ; |    X X | $9ED0
    .byte $00 ; |        | $9ED1
    .byte $0A ; |    X X | $9ED2
    .byte $00 ; |        | $9ED3
    .byte $04 ; |     X  | $9ED4
    .byte $04 ; |     X  | $9ED5
    .byte $04 ; |     X  | $9ED6
    .byte $04 ; |     X  | $9ED7
    .byte $04 ; |     X  | $9ED8
    .byte $04 ; |     X  | $9ED9
    .byte $04 ; |     X  | $9EDA
    .byte $04 ; |     X  | $9EDB
    .byte $1A ; |   XX X | $9EDC
    .byte $1A ; |   XX X | $9EDD
    .byte $19 ; |   XX  X| $9EDE
    .byte $19 ; |   XX  X| $9EDF
    .byte $18 ; |   XX   | $9EE0
    .byte $18 ; |   XX   | $9EE1
    .byte $17 ; |   X XXX| $9EE2
    .byte $17 ; |   X XXX| $9EE3
    .byte $16 ; |   X XX | $9EE4
    .byte $16 ; |   X XX | $9EE5
    .byte $15 ; |   X X X| $9EE6
    .byte $15 ; |   X X X| $9EE7
    .byte $14 ; |   X X  | $9EE8
    .byte $14 ; |   X X  | $9EE9
    .byte $13 ; |   X  XX| $9EEA
    .byte $13 ; |   X  XX| $9EEB
    .byte $12 ; |   X  X | $9EEC
    .byte $12 ; |   X  X | $9EED
    .byte $17 ; |   X XXX| $9EEE
    .byte $18 ; |   XX   | $9EEF
    .byte $19 ; |   XX  X| $9EF0
    .byte $1A ; |   XX X | $9EF1
    .byte $1B ; |   XX XX| $9EF2
    .byte $1C ; |   XXX  | $9EF3
    .byte $0B ; |    X XX| $9EF4
    .byte $08 ; |    X   | $9EF5
    .byte $06 ; |     XX | $9EF6
    .byte $0B ; |    X XX| $9EF7
    .byte $08 ; |    X   | $9EF8
    .byte $06 ; |     XX | $9EF9
    .byte $0B ; |    X XX| $9EFA
    .byte $08 ; |    X   | $9EFB
    .byte $06 ; |     XX | $9EFC
    .byte $31 ; |  XX   X| $9EFD
    .byte $04 ; |     X  | $9EFE
    .byte $ED ; |XXX XX X| $9EFF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L9F00 SUBROUTINE
    lda    sc_15|READ            ; 4
    bmi    L9F2B                 ; 2³
    lda    sc_7C|READ            ; 4
    and    #$1F                  ; 2
    cmp    ram_D3                ; 3
    bcs    L9F19                 ; 2³
    lda    ram_F5                ; 3
    and    #$03                  ; 2
    sta    ram_F5                ; 3
    lda    ram_D3                ; 3
    sta    sc_7C                 ; 4
L9F19:
    tax                          ; 2
    beq    L9F33                 ; 2³
    lda    sc_7C|READ            ; 4
    tay                          ; 2
    and    #$E0                  ; 2
    beq    L9F2C                 ; 2³
    tya                          ; 2
    sec                          ; 2
    sbc    #$20                  ; 2
    sta    sc_7C                 ; 4
L9F2B:
    rts                          ; 6

L9F2C:
    lda    ram_F5                ; 3
    lsr                          ; 2
    lsr                          ; 2
    cmp    L94E7,X               ; 4
L9F33:
    beq    L9FA5                 ; 2³
    cpx    #2                    ; 2
    beq    L9F3D                 ; 2³
    cpx    #3                    ; 2
    bne    L9F41                 ; 2³
L9F3D:
    ldy    ram_F6                ; 3
    bmi    L9FA5                 ; 2³
L9F41:
    tay                          ; 2
    lda    L99DF,X               ; 4
    sta    ram_ED                ; 3
    lda    L9A34,X               ; 4
    sta    ram_EC                ; 3
    lda    (ram_EC),Y            ; 5
    sta    AUDF0                 ; 3
    beq    L9F61                 ; 2³
    lda    L9D41,X               ; 4
    bne    L9F61                 ; 2³
    lda    L9EC4,Y               ; 4
    cpx    #8                    ; 2
    beq    L9F61                 ; 2³
    lda    L94C8,Y               ; 4
L9F61:
    sta    AUDV0                 ; 3
    lda    L9B5F,X               ; 4
    bne    L9F6B                 ; 2³
    lda    L949A,Y               ; 4
L9F6B:
    sta    AUDC0                 ; 3
    lda    L99CC,X               ; 4
    and    #$01                  ; 2
    bne    L9F78                 ; 2³
    sta    AUDV1                 ; 3
    beq    L9F92                 ; 3   always branch

L9F78:
    lda    L9A47,X               ; 4
    sta    ram_EC                ; 3
    lda    (ram_EC),Y            ; 5
    sta    AUDF1                 ; 3
    beq    L9F8B                 ; 2³
    lda    L9D54,X               ; 4
    bne    L9F8B                 ; 2³
    lda    L94D8,Y               ; 4
L9F8B:
    sta    AUDV1                 ; 3
    lda    L95EC,X               ; 4
    sta    AUDC1                 ; 3
L9F92:
    lda    ram_F5                ; 3
    clc                          ; 2
    adc    #4                    ; 2
    sta    ram_F5                ; 3
    lda    L99CC,X               ; 4
    and    #$E0                  ; 2
    ora    sc_7C|READ            ; 4
    sta    sc_7C                 ; 4
L9FA4:
    rts                          ; 6

L9FA5:
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    sta    sc_7C                 ; 4
    lda    sc_15|READ            ; 4
    and    #$0B                  ; 2
    bne    L9FA4                 ; 2³
    cpx    #5                    ; 2
    bcs    L9FD4                 ; 2³
    lda    ram_F6                ; 3
    bmi    L9FCC                 ; 2³
    ldy    #2                    ; 2
    tya                          ; 2
    bit    ram_F3                ; 3
    beq    L9FC6                 ; 2³
    ldy    #3                    ; 2
L9FC6:
    jsr    L99F3                 ; 6
    jmp    L9F00                 ; 3   repeat subroutine again

L9FCC:
    cpx    #4                    ; 2
    beq    L9FD8                 ; 2³
    cpx    #1                    ; 2
    beq    L9FD8                 ; 2³
L9FD4:
    ldy    #4                    ; 2
    bpl    L9FC6                 ; 3   always branch

L9FD8:
    ldy    #1                    ; 2
    bpl    L9FC6                 ; 3   always branch

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $CA ; |XX  X X | $9FDC
    .byte $21 ; |  X    X| $9FDD

;all bs from bank 2
    jmp    L9200                 ; 3
    jmp    L9CF6                 ; 3

L9FE4:
    lda    BANK_3                ; 4   bankswitch, goto LF14D

;bs from bank 2
    jmp    L9BF9                 ; 3

    .byte $56 ; | X X XX | $9FEA
    .byte $EB ; |XXX X XX| $9FEB
    .byte $ED ; |XXX XX X| $9FEC

;bs from bank 2
    jmp    L9BB1                 ; 3

L9FF0:
    lda    BANK_1                ; 4   bankswitch, goto LB189

;bs from bank 1
    jmp    L9103                 ; 3

    .byte $00 ; |        | $9FF6
    .byte $00 ; |        | $9FF7
    .byte $00 ; |        | $9FF8
    .byte $00 ; |        | $9FF9
    .byte $00 ; |        | $9FFA
    .byte $D3 ; |XX X  XX| $9FFB

        ORG $1FFC
       RORG $9FFC

    .word START_BANK_0

    .byte $FA ; |XXXXX X | $9FFE
    .byte $D3 ; |XX X  XX| $9FFF


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 1
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


        ORG $2000
       RORG $B000

     SC_RAM_SPACE 256

START_BANK_1:
    lda    BANK_3                ; 4   bankswitch, do clear loop

LB103:
    .byte $00 ; |        | $B103
    .byte $32 ; |  XX  X | $B104
    .byte $32 ; |  XX  X | $B105
    .byte $34 ; |  XX X  | $B106
    .byte $34 ; |  XX X  | $B107
    .byte $34 ; |  XX X  | $B108
    .byte $26 ; |  X  XX | $B109
    .byte $26 ; |  X  XX | $B10A
    .byte $26 ; |  X  XX | $B10B
    .byte $2A ; |  X X X | $B10C
    .byte $2A ; |  X X X | $B10D
    .byte $2A ; |  X X X | $B10E
    .byte $F4 ; |XXXX X  | $B10F
    .byte $F4 ; |XXXX X  | $B110
    .byte $FA ; |XXXXX X | $B111
    .byte $FA ; |XXXXX X | $B112
    .byte $FA ; |XXXXX X | $B113
    .byte $E8 ; |XXX X   | $B114
    .byte $E8 ; |XXX X   | $B115
    .byte $E8 ; |XXX X   | $B116
    .byte $CA ; |XX  X X | $B117
    .byte $CA ; |XX  X X | $B118
    .byte $CA ; |XX  X X | $B119
    .byte $04 ; |     X  | $B11A
    .byte $04 ; |     X  | $B11B
    .byte $B6 ; |X XX XX | $B11C
    .byte $B6 ; |X XX XX | $B11D
    .byte $B6 ; |X XX XX | $B11E
    .byte $FC ; |XXXXXX  | $B11F
    .byte $FC ; |XXXXXX  | $B120
    .byte $FC ; |XXXXXX  | $B121
    .byte $6A ; | XX X X | $B122
    .byte $6A ; | XX X X | $B123
    .byte $6A ; | XX X X | $B124
    .byte $00 ; |        | $B125
    .byte $00 ; |        | $B126
    .byte $00 ; |        | $B127
    .byte $00 ; |        | $B128
    .byte $0A ; |    X X | $B129
    .byte $15 ; |   X X X| $B12A
    .byte $2A ; |  X X X | $B12B
    .byte $55 ; | X X X X| $B12C
    .byte $2A ; |  X X X | $B12D
    .byte $55 ; | X X X X| $B12E
    .byte $2A ; |  X X X | $B12F
    .byte $54 ; | X X X  | $B130
    .byte $68 ; | XX X   | $B131
    .byte $E0 ; |XXX     | $B132
    .byte $20 ; |  X     | $B133
    .byte $00 ; |        | $B134
    .byte $00 ; |        | $B135
    .byte $00 ; |        | $B136
    .byte $00 ; |        | $B137
    .byte $60 ; | XX     | $B138
    .byte $4C ; | X  XX  | $B139
    .byte $68 ; | XX X   | $B13A
    .byte $38 ; |  XXX   | $B13B
    .byte $66 ; | XX  XX | $B13C
    .byte $70 ; | XXX    | $B13D
    .byte $58 ; | X XX   | $B13E
    .byte $C8 ; |XX  X   | $B13F
    .byte $84 ; |X    X  | $B140
    .byte $F0 ; |XXXX    | $B141
    .byte $60 ; | XX     | $B142
    .byte $00 ; |        | $B143
    .byte $00 ; |        | $B144
    .byte $00 ; |        | $B145
    .byte $00 ; |        | $B146
    .byte $30 ; |  XX    | $B147
    .byte $06 ; |     XX | $B148
    .byte $78 ; | XXXX   | $B149
    .byte $CC ; |XX  XX  | $B14A
    .byte $80 ; |X       | $B14B
    .byte $F4 ; |XXXX X  | $B14C
    .byte $60 ; | XX     | $B14D
    .byte $00 ; |        | $B14E
    .byte $00 ; |        | $B14F
    .byte $00 ; |        | $B150
    .byte $00 ; |        | $B151
    .byte $00 ; |        | $B152
    .byte $00 ; |        | $B153
    .byte $00 ; |        | $B154
    .byte $00 ; |        | $B155
    .byte $02 ; |      X | $B156
    .byte $03 ; |      XX| $B157
    .byte $02 ; |      X | $B158
    .byte $00 ; |        | $B159
    .byte $00 ; |        | $B15A
    .byte $00 ; |        | $B15B
    .byte $00 ; |        | $B15C
    .byte $00 ; |        | $B15D
    .byte $00 ; |        | $B15E
    .byte $00 ; |        | $B15F
    .byte $00 ; |        | $B160
    .byte $00 ; |        | $B161
    .byte $40 ; | X      | $B162
    .byte $C0 ; |XX      | $B163
    .byte $40 ; | X      | $B164
    .byte $00 ; |        | $B165
    .byte $00 ; |        | $B166
    .byte $00 ; |        | $B167
    .byte $00 ; |        | $B168
    .byte $00 ; |        | $B169
    .byte $00 ; |        | $B16A
    .byte $00 ; |        | $B16B
    .byte $00 ; |        | $B16C
    .byte $00 ; |        | $B16D
    .byte $00 ; |        | $B16E
    .byte $00 ; |        | $B16F
    .byte $08 ; |    X   | $B170
    .byte $1C ; |   XXX  | $B171
    .byte $08 ; |    X   | $B172
LB173:
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
    .byte $00 ; |        | $B17F
    .byte $00 ; |        | $B180
    .byte $00 ; |        | $B181
    .byte $00 ; |        | $B182
    .byte $00 ; |        | $B183
    .byte $00 ; |        | $B184
    .byte $00 ; |        | $B185
    .byte $00 ; |        | $B186
    .byte $FF ; |XXXXXXXX| $B187
    .byte $FF ; |XXXXXXXX| $B188

LB189:
    lda    #<LB195               ; 2
    sta    ram_EC                ; 3
    lda    #>LB195               ; 2
    sta    ram_ED                ; 3
    lda    ram_85                ; 3
    ldy    #0                    ; 2

LB195:
    cmp    ram_86                ; 3
    bcc    LB19E                 ; 2³
    ldx    ram_86                ; 3
    sta    ram_86                ; 3
    txa                          ; 2
LB19E:
    cmp    ram_87                ; 3
    bcc    LB1A7                 ; 2³
    ldx    ram_87                ; 3
    sta    ram_87                ; 3
    txa                          ; 2
LB1A7:
    cmp    ram_88                ; 3
    bcc    LB1B0                 ; 2³
    ldx    ram_88                ; 3
    sta    ram_88                ; 3
    txa                          ; 2
LB1B0:
    cmp    ram_89                ; 3
    bcc    LB1B9                 ; 2³
    ldx    ram_89                ; 3
    sta    ram_89                ; 3
    txa                          ; 2
LB1B9:
    cmp    ram_8A                ; 3
    bcc    LB1C2                 ; 2³
    ldx    ram_8A                ; 3
    sta    ram_8A                ; 3
    txa                          ; 2
LB1C2:
    cmp    ram_8B                ; 3
    bcc    LB1CB                 ; 2³
    ldx    ram_8B                ; 3
    sta    ram_8B                ; 3
    txa                          ; 2
LB1CB:
    cmp    ram_8C                ; 3
    bcc    LB1D4                 ; 2³
    ldx    ram_8C                ; 3
    sta    ram_8C                ; 3
    txa                          ; 2
LB1D4:
    cmp    ram_8D                ; 3
    bcc    LB1DD                 ; 2³
    ldx    ram_8D                ; 3
    sta    ram_8D                ; 3
    txa                          ; 2
LB1DD:
    cmp    ram_8E                ; 3
    bcc    LB1E6                 ; 2³
    ldx    ram_8E                ; 3
    sta    ram_8E                ; 3
    txa                          ; 2
LB1E6:
    sta.wy ram_85,Y              ; 5
    lda    LBE00,Y               ; 4
    clc                          ; 2
    adc    ram_EC                ; 3
    sta    ram_EC                ; 3
    iny                          ; 2
    lda.wy ram_85,Y              ; 4
    jmp.ind ($00EC)              ; 5


    lda    #$10                  ; 2
    sta    ram_BD                ; 3
    ldx    #$EA                  ; 2
    txs                          ; 2
    ldy    #4                    ; 2
LB201:
    pha                          ; 3
    pha                          ; 3
    pha                          ; 3
    pha                          ; 3
    pha                          ; 3
    pha                          ; 3
    pha                          ; 3
    pha                          ; 3
    pha                          ; 3
    dey                          ; 2
    bpl    LB201                 ; 2³
    ldy    #9                    ; 2
    sty    ram_EC                ; 3
LB211:
    lda.wy ram_85,Y              ; 4
    and    #$0F                  ; 2
    tax                          ; 2
    lda    sc_71|READ,X          ; 4
    sta    ram_F0                ; 3
    bne    LB221                 ; 2³

;bs from bank 3
    jmp    LB2AE                 ; 3

LB221:
    lsr                          ; 2
    tay                          ; 2
    lda    #$10                  ; 2
    cmp.wy ram_D6,Y              ; 4
    bne    LB261                 ; 2³
    cmp.wy ram_D5,Y              ; 4
    bne    LB261                 ; 2³
    lda    sc_0B|READ,X          ; 4
    cmp    #$C6                  ; 2
    bne    LB245                 ; 2³
    lda    #$10                  ; 2
    sec                          ; 2
    sbc.wy ram_D7,Y              ; 4
    bne    LB261                 ; 2³
    sta.wy ram_D5,Y              ; 5
    iny                          ; 2
    lda    sc_0B|READ,X          ; 4
LB245:
    lsr    ram_F0                ; 5
    bcs    LB24B                 ; 2³
    ora    #$10                  ; 2
LB24B:
    sta.wy ram_D6,Y              ; 5
    lda    sc_01|READ,X          ; 4
    txs                          ; 2
    tax                          ; 2
    lda    LB86C,X               ; 4
    tsx                          ; 2
    sta.wy ram_92,Y              ; 5
    lda    #0                    ; 2
    sta.wy ram_D5,Y              ; 5
    beq    LB2AA                 ; 3   always branch

LB261:
    tya                          ; 2
    lsr    ram_F0                ; 5
    rol                          ; 2
    clc                          ; 2
    adc    #1                    ; 2
    sta    ram_F0                ; 3
    lsr                          ; 2
    tay                          ; 2
    lda    #$10                  ; 2
    cmp.wy ram_BF,Y              ; 4
    bne    LB2B6                 ; 2³
    cmp.wy ram_BE,Y              ; 4
    bne    LB2B6                 ; 2³
    lda    sc_0B|READ,X          ; 4
    cmp    #$C6                  ; 2
    bne    LB28E                 ; 2³
    lda    #$10                  ; 2
    sec                          ; 2
    sbc.wy ram_C0,Y              ; 4
    bne    LB2B6                 ; 2³
    sta.wy ram_BE,Y              ; 5
    iny                          ; 2
    lda    sc_0B|READ,X          ; 4
LB28E:
    lsr    ram_F0                ; 5
    bcs    LB294                 ; 2³
    ora    #$10                  ; 2
LB294:
    ora    #$20                  ; 2
    sta.wy ram_BF,Y              ; 5
    lda    #0                    ; 2
    sta.wy ram_BE,Y              ; 5
    lda    sc_01|READ,X          ; 4
    txs                          ; 2
    tax                          ; 2
    lda    LB86C,X               ; 4
    sta.wy ram_A8,Y              ; 5
    tsx                          ; 2
LB2AA:
    ldy    ram_EC                ; 3
    stx    ram_85,Y              ; 4
LB2AE:
    dey                          ; 2
LB2AF:
    sty    ram_EC                ; 3
    bmi    LB2C4                 ; 2³
    jmp    LB211                 ; 3

LB2B6:
    ldy    ram_EC                ; 3
    lda.wy ram_85,Y              ; 4
    clc                          ; 2
    adc    #$10                  ; 2
    sta.wy ram_85,Y              ; 5
    dey                          ; 2
    bpl    LB2AF                 ; 2³
LB2C4:
    jmp    LB360                 ; 3

    .byte $77 ; | XXX XXX| $B2C7
    .byte $BD ; |X XXXX X| $B2C8
    .byte $CE ; |XX  XXX | $B2C9
    .byte $B2 ; |X XX  X | $B2CA
    .byte $8D ; |X   XX X| $B2CB
    .byte $F9 ; |XXXXX  X| $B2CC
    .byte $FF ; |XXXXXXXX| $B2CD
    .byte $00 ; |        | $B2CE
    .byte $71 ; | XXX   X| $B2CF
    .byte $27 ; |  X  XXX| $B2D0
    .byte $00 ; |        | $B2D1
    .byte $00 ; |        | $B2D2
    .byte $00 ; |        | $B2D3
    .byte $00 ; |        | $B2D4
    .byte $00 ; |        | $B2D5
    .byte $05 ; |     X X| $B2D6
    .byte $61 ; | XX    X| $B2D7
    .byte $77 ; | XXX XXX| $B2D8
    .byte $18 ; |   XX   | $B2D9
    .byte $23 ; |  X   XX| $B2DA
    .byte $00 ; |        | $B2DB
    .byte $00 ; |        | $B2DC
    .byte $00 ; |        | $B2DD
    .byte $10 ; |   X    | $B2DE
    .byte $61 ; | XX    X| $B2DF
    .byte $87 ; |X    XXX| $B2E0
    .byte $17 ; |   X XXX| $B2E1
    .byte $35 ; |  XX X X| $B2E2
    .byte $11 ; |   X   X| $B2E3
    .byte $00 ; |        | $B2E4
    .byte $00 ; |        | $B2E5
    .byte $12 ; |   X  X | $B2E6
    .byte $82 ; |X     X | $B2E7
    .byte $66 ; | XX  XX | $B2E8
    .byte $78 ; | XXXX   | $B2E9
    .byte $26 ; |  X  XX | $B2EA
    .byte $22 ; |  X   X | $B2EB
    .byte $00 ; |        | $B2EC
    .byte $00 ; |        | $B2ED
    .byte $06 ; |     XX | $B2EE
    .byte $70 ; | XXX    | $B2EF
    .byte $67 ; | XX  XXX| $B2F0
    .byte $29 ; |  X X  X| $B2F1
    .byte $34 ; |  XX X  | $B2F2
    .byte $11 ; |   X   X| $B2F3
    .byte $00 ; |        | $B2F4
    .byte $00 ; |        | $B2F5
    .byte $0E ; |    XXX | $B2F6
    .byte $81 ; |X      X| $B2F7
    .byte $64 ; | XX  X  | $B2F8
    .byte $77 ; | XXX XXX| $B2F9
    .byte $38 ; |  XXX   | $B2FA
    .byte $18 ; |   XX   | $B2FB
    .byte $31 ; |  XX   X| $B2FC
    .byte $00 ; |        | $B2FD
    .byte $02 ; |      X | $B2FE
    .byte $72 ; | XXX  X | $B2FF
    .byte $31 ; |  XX   X| $B300
    .byte $11 ; |   X   X| $B301
    .byte $25 ; |  X  X X| $B302
    .byte $38 ; |  XXX   | $B303
    .byte $72 ; | XXX  X | $B304
    .byte $00 ; |        | $B305
    .byte $11 ; |   X   X| $B306
    .byte $64 ; | XX  X  | $B307
    .byte $77 ; | XXX XXX| $B308
    .byte $41 ; | X     X| $B309
    .byte $13 ; |   X  XX| $B30A
    .byte $64 ; | XX  X  | $B30B
    .byte $41 ; | X     X| $B30C
    .byte $77 ; | XXX XXX| $B30D
    .byte $46 ; | X   XX | $B30E
    .byte $80 ; |X       | $B30F
    .byte $53 ; | X X  XX| $B310
    .byte $53 ; | X X  XX| $B311
    .byte $76 ; | XXX XX | $B312
    .byte $37 ; |  XX XXX| $B313
    .byte $12 ; |   X  X | $B314
    .byte $21 ; |  X    X| $B315
    .byte $05 ; |     X X| $B316
    .byte $72 ; | XXX  X | $B317
    .byte $76 ; | XXX XX | $B318
    .byte $38 ; |  XXX   | $B319
    .byte $18 ; |   XX   | $B31A
    .byte $44 ; | X   X  | $B31B
    .byte $12 ; |   X  X | $B31C
    .byte $12 ; |   X  X | $B31D
    .byte $69 ; | XX X  X| $B31E
    .byte $5A ; | X XX X | $B31F
    .byte $26 ; |  X  XX | $B320
    .byte $11 ; |   X   X| $B321
    .byte $41 ; | X     X| $B322
    .byte $86 ; |X    XX | $B323
    .byte $47 ; | X   XXX| $B324
    .byte $5A ; | X XX X | $B325
    .byte $1E ; |   XXXX | $B326
    .byte $61 ; | XX    X| $B327
    .byte $57 ; | X X XXX| $B328
    .byte $57 ; | X X XXX| $B329
    .byte $29 ; |  X X  X| $B32A
    .byte $13 ; |   X  XX| $B32B
    .byte $40 ; | X      | $B32C
    .byte $40 ; | X      | $B32D
    .byte $10 ; |   X    | $B32E
    .byte $81 ; |X      X| $B32F
    .byte $96 ; |X  X XX | $B330
    .byte $36 ; |  XX XX | $B331
    .byte $12 ; |   X  X | $B332
    .byte $59 ; | X XX  X| $B333
    .byte $36 ; |  XX XX | $B334
    .byte $81 ; |X      X| $B335
    .byte $44 ; | X   X  | $B336
    .byte $76 ; | XXX XX | $B337
    .byte $16 ; |   X XX | $B338
    .byte $42 ; | X    X | $B339
    .byte $23 ; |  X   XX| $B33A
    .byte $76 ; | XXX XX | $B33B
    .byte $16 ; |   X XX | $B33C
    .byte $38 ; |  XXX   | $B33D
    .byte $31 ; |  XX   X| $B33E
    .byte $62 ; | XX   X | $B33F
    .byte $27 ; |  X  XXX| $B340
    .byte $10 ; |   X    | $B341
    .byte $86 ; |X    XX | $B342
    .byte $49 ; | X  X  X| $B343
    .byte $62 ; | XX   X | $B344
    .byte $10 ; |   X    | $B345
    .byte $66 ; | XX  XX | $B346
    .byte $50 ; | X X    | $B347
    .byte $64 ; | XX  X  | $B348
    .byte $64 ; | XX  X  | $B349
    .byte $77 ; | XXX XXX| $B34A
    .byte $38 ; |  XXX   | $B34B
    .byte $16 ; |   X XX | $B34C
    .byte $14 ; |   X X  | $B34D
    .byte $FF ; |XXXXXXXX| $B34E
    .byte $72 ; | XXX  X | $B34F
    .byte $33 ; |  XX  XX| $B350
    .byte $11 ; |   X   X| $B351
    .byte $05 ; |     X X| $B352
    .byte $18 ; |   XX   | $B353
    .byte $67 ; | XX  XXX| $B354
    .byte $00 ; |        | $B355
    .byte $FF ; |XXXXXXXX| $B356
    .byte $61 ; | XX    X| $B357
    .byte $01 ; |       X| $B358
    .byte $23 ; |  X   XX| $B359
    .byte $16 ; |   X XX | $B35A
    .byte $27 ; |  X  XXX| $B35B
    .byte $38 ; |  XXX   | $B35C
    .byte $00 ; |        | $B35D
    .byte $1C ; |   XXX  | $B35E
    .byte $E3 ; |XXX   XX| $B35F

LB360:
    ldy    #$FF                  ; 2
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    lda    #$80                  ; 2
    sta    PF0                   ; 3
LB36A:
    lda    INTIM                 ; 4
    bne    LB36A                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    ldx    #$84                  ; 2
    stx    ram_EC                ; 3
    stx    COLUPF                ; 3
    ldx    #$54                  ; 2
    txs                          ; 2
    lda    #$15                  ; 2
    sta    ram_90                ; 3
    lda    #<LBB60               ; 2
    sta    ram_81                ; 3
    lda    #>LBB60               ; 2
    sta    ram_82                ; 3
    sty    ram_EE                ; 3
    sty    ram_ED                ; 3
    sty    ram_EF                ; 3
    sty    sc_6D                 ; 4
    sty    sc_6E                 ; 4
    sty    sc_6F                 ; 4
    sty    sc_70                 ; 4
    ldx    ram_D4                ; 3
    lda    LBA00,X               ; 4
    sec                          ; 2
    sbc    #8                    ; 2
    sta    ram_83                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_8F                ; 3
    sta    ram_D4                ; 3
    lda    ram_BD                ; 3
    sty    ram_BD                ; 3
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    lsr                          ; 2
    tay                          ; 2
    bcs    LB3EB                 ; 2³
    beq    LB3CF                 ; 2³
LB3B8:
    dey                          ; 2
    bne    LB3B8                 ; 2³
    ldy    #7                    ; 2
    sta    RESP1                 ; 3
LB3BF:
    lda    LBB00,X               ; 4
    sta    NUSIZ1                ; 3
    lda    LB900,X               ; 4
    sta    COLUP1                ; 3
    lda    LBC00,X               ; 4
    jmp    LB402                 ; 3

LB3CF:
    sta    RESP1                 ; 3
    ldy    #7                    ; 2
    jmp    LB3BF                 ; 3

LB3D6:
    lda    LBB00,X               ; 4
    sta    NUSIZ1                ; 3
    lda    LB900,X               ; 4
    sta    COLUP1                ; 3
    lda    LBC00,X               ; 4
    sta    RESP1|MIRROR          ; 4   uses an extra cycle
    ldy    #7                    ; 2
    jmp    LB402                 ; 3

LB3EB:
    beq    LB3D6                 ; 2³
    lda    LBB00,X               ; 4
    sta    NUSIZ1                ; 3
    lda    LB900,X               ; 4
    sta    COLUP1                ; 3
    lda    LBC00,X               ; 4
LB3FA:
    dey                          ; 2
    bne    LB3FA                 ; 2³
    ldy    #7                    ; 2
    sta    RESP1|MIRROR          ; 4   uses an extra cycle
LB402:
    sta    ram_84                ; 3
    lda    #$FF                  ; 2
    jmp    LB647                 ; 3

LB409:
    lda    ram_BD                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    lda    (ram_81),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_83),Y            ; 5
    sta    GRP1                  ; 3
    lda    ram_EE                ; 3
    sta    PF2                   ; 3
    ldy    ram_90                ; 3
    lda.wy ram_91,Y              ; 4
    sta    ram_F0                ; 3
    lda    ram_EF                ; 3
    sta    PF1                   ; 3
    lda    ram_ED                ; 3
    sta    PF2|MIRROR            ; 4   uses an extra cycle
    lda.wy ram_D5,Y              ; 4
    bne    LB447                 ; 2³
    nop                          ; 2
    nop                          ; 2
    lda    LB173,Y               ; 4
    ldy    #6                    ; 2
    sta    PF2                   ; 3
    sta    PF1                   ; 3
    lda    (ram_81),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_83),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    jmp    LB4B3                 ; 3

LB447:
    tax                          ; 2
    lda    LB173,Y               ; 4
    ldy    #6                    ; 2
    sta    PF2|MIRROR            ; 4   uses an extra cycle
    sta    PF1                   ; 3
    lda    (ram_83),Y            ; 5
    sta    GRP1                  ; 3
    lda    LBC00,X               ; 4
    sta    ram_82                ; 3
    lda    ram_F0                ; 3
    sta    HMP0                  ; 3
    and    #$0F                  ; 2
    lsr                          ; 2
    tay                          ; 2
    bcs    LB49A                 ; 2³
    beq    LB47E                 ; 2³
LB467:
    dey                          ; 2
    bne    LB467                 ; 2³
    ldy    #5                    ; 2
    sta    RESP0                 ; 3
LB46E:
    lda    LBA00,X               ; 4
    sta    ram_81                ; 3
    lda    LBB00,X               ; 4
    sta    NUSIZ0                ; 3
    lda    LB900,X               ; 4
    jmp    LB4B1                 ; 3

LB47E:
    sta    RESP0                 ; 3
    ldy    #5                    ; 2
    jmp    LB46E                 ; 3

LB485:
    lda    LBA00,X               ; 4
    sta    ram_81                ; 3
    lda    LBB00,X               ; 4
    sta    NUSIZ0                ; 3
    lda    LB900,X               ; 4
    sta    RESP0|MIRROR          ; 4   uses an extra cycle
    ldy    #5                    ; 2
    jmp    LB4B1                 ; 3

LB49A:
    beq    LB485                 ; 2³
    lda    LBA00,X               ; 4
    sta    ram_81                ; 3
    lda    LBB00,X               ; 4
    sta    NUSIZ0                ; 3
    lda    LB900,X               ; 4
LB4A9:
    dey                          ; 2
    bne    LB4A9                 ; 2³
    ldy    #5                    ; 2
    sta    RESP0|MIRROR          ; 4   uses an extra cycle
LB4B1:
    sta    COLUP0                ; 3
LB4B3:
    lda    (ram_81),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    lda    ram_EC                ; 3
    sta    COLUPF                ; 3
    lda    (ram_83),Y            ; 5
    sta    GRP1                  ; 3
    lda    ram_BD                ; 3
    sta    PF1                   ; 3
    lda    ram_EE                ; 3
    sta    PF2                   ; 3
    sta    HMCLR                 ; 3
    dey                          ; 2
    lda    ram_90                ; 3
    lsr                          ; 2
    ldx    ram_ED                ; 3
    stx    PF2                   ; 3
    ldx    ram_EF                ; 3
    stx    PF1                   ; 3
    adc    ram_EB                ; 3
    tax                          ; 2
    lda    LB103,X               ; 4
    sta    ram_EC                ; 3
    nop                          ; 2
    lda    #0                    ; 2
    sta    ENABL                 ; 3
    ldx    ram_90                ; 3
    lda    ram_BD                ; 3
    sta    PF1                   ; 3
    lda    ram_EE                ; 3
    sta    PF2                   ; 3
    lda    (ram_81),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_83),Y            ; 5
    sta    GRP1                  ; 3
    ldy    LBD00,X               ; 4
    sta.wy RESBL,Y               ; 5
    lda    ram_ED                ; 3
    cpy    #$1F                  ; 2
    beq    LB556                 ; 2³
    sta    PF2|MIRROR            ; 4   uses an extra cycle
    lda    ram_EF|MIRROR         ; 4   uses an extra cycle
    sta    PF1                   ; 3
    bcc    LB511                 ; 2³
    sta    RESBL|MIRROR          ; 4   uses an extra cycle
LB511:
    lda    #$50                  ; 2
    sta    HMBL                  ; 3
    lda    ram_BD                ; 3
    sta    PF1                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
LB51B:
    ldy    #3                    ; 2
    lda    (ram_81),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_83),Y            ; 5
    sta    GRP1                  ; 3
    lda    ram_EE                ; 3
    sta    PF2                   ; 3
    ldy    ram_90                ; 3
    beq    LB56B                 ; 2³
    lda.wy ram_A7,Y              ; 4
    sta    ram_F0                ; 3
    lda    ram_EF                ; 3
    sta    PF1                   ; 3
    lda    ram_ED                ; 3
    sta    PF2                   ; 3
    lda.wy ram_BE,Y              ; 4
    bne    LB57A                 ; 2³
    nop                          ; 2
    nop                          ; 2
    lda    LB173,Y               ; 4
    ldy    #2                    ; 2
    sta    PF2                   ; 3
    sta    PF1                   ; 3
    lda    (ram_81),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_83),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    jmp    LB5E6                 ; 3

LB556:
    sta    PF2                   ; 3
    nop                          ; 2
    sta    RESBL                 ; 3
    lda    ram_EF                ; 3
    sta    PF1                   ; 3
    lda    ram_BD                ; 3
    nop                          ; 2
    ldy    #$50                  ; 2
    sty    HMBL                  ; 3
    sta    PF1|MIRROR            ; 4   uses an extra cycle
    bne    LB51B                 ; 3   always branch

LB56B:
    nop                          ; 2
    stx    sc_6D                 ; 4
    lda    ram_EF                ; 3
    sta    PF1                   ; 3
    lda    ram_ED                ; 3
    sta    PF2                   ; 3
    jmp    LB85D                 ; 3

LB57A:
    tax                          ; 2
    lda    LB173,Y               ; 4
    ldy    #2                    ; 2
    sta    PF2|MIRROR            ; 4   uses an extra cycle
    sta    PF1                   ; 3
    lda    (ram_81),Y            ; 5
    sta    GRP0                  ; 3
    lda    LBC00,X               ; 4
    sta    ram_84                ; 3
    lda    ram_F0                ; 3
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    lsr                          ; 2
    tay                          ; 2
    bcs    LB5CD                 ; 2³
    beq    LB5B1                 ; 2³
LB59A:
    dey                          ; 2
    bne    LB59A                 ; 2³
    ldy    #1                    ; 2
    sta    RESP1                 ; 3
LB5A1:
    lda    LBA00,X               ; 4
    sta    ram_83                ; 3
    lda    LBB00,X               ; 4
    sta    NUSIZ1                ; 3
    lda    LB900,X               ; 4
    jmp    LB5E4                 ; 3

LB5B1:
    sta    RESP1                 ; 3
    ldy    #1                    ; 2
    jmp    LB5A1                 ; 3

LB5B8:
    lda    LBA00,X               ; 4
    sta    ram_83                ; 3
    lda    LBB00,X               ; 4
    sta    NUSIZ1                ; 3
    lda    LB900,X               ; 4
    sta    RESP1|MIRROR          ; 4   uses an extra cycle
    ldy    #1                    ; 2
    jmp    LB5E4                 ; 3

LB5CD:
    beq    LB5B8                 ; 2³
    lda    LBA00,X               ; 4
    sta    ram_83                ; 3
    lda    LBB00,X               ; 4
    sta    NUSIZ1                ; 3
    lda    LB900,X               ; 4
LB5DC:
    dey                          ; 2
    bne    LB5DC                 ; 2³
    ldy    #1                    ; 2
    sta    RESP1|MIRROR          ; 4   uses an extra cycle
LB5E4:
    sta    COLUP1                ; 3
LB5E6:
    lda    (ram_81),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    lda    ram_EC                ; 3
    sta    COLUPF                ; 3
    lda    (ram_83),Y            ; 5
    sta    GRP1                  ; 3
    lda    ram_EA                ; 3
    sta    PF1                   ; 3
    tsx                          ; 2
    lda    sc_1A|READ,X          ; 4
    sta    PF2                   ; 3
    lda    sc_1B|READ,X          ; 4
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
    sta    PF2                   ; 3
    sta    ram_ED                ; 3
    lda    sc_1F|READ,X          ; 4
    sta    PF1                   ; 3
    sta    ram_EF                ; 3
    nop                          ; 2
    nop                          ; 2
    lda    sc_1D|READ,X          ; 4
    sta    ram_EE                ; 3
    dey                          ; 2
    sta    PF2                   ; 3
    dex                          ; 2
    txs                          ; 2
    lda    ram_EA                ; 3
    sta    PF1                   ; 3
    lda    (ram_81),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_83),Y            ; 5
    sta    GRP1                  ; 3
    lda    ram_81                ; 3
    sec                          ; 2
    sbc    #8                    ; 2
    sta    ram_81                ; 3
    lda    ram_EF                ; 3
    ldy    #7                    ; 2
    ldx    ram_ED                ; 3
    stx    PF2                   ; 3
    sta    PF1                   ; 3
    lda    ram_83                ; 3
    sec                          ; 2
    sbc    #8                    ; 2
    sta    ram_83                ; 3
    dec    ram_90                ; 5
    sta    HMCLR                 ; 3
    lda    ram_EA                ; 3
LB647:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    lda    (ram_81),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_83),Y            ; 5
    sta    GRP1                  ; 3
    lda    ram_EE                ; 3
    sta    PF2                   ; 3
    ldy    ram_90                ; 3
    lda.wy ram_91,Y              ; 4
    sta    ram_F0                ; 3
    lda    ram_EF                ; 3
    sta    PF1                   ; 3
    lda    ram_ED                ; 3
    sta    PF2|MIRROR            ; 4   uses an extra cycle
    lda.wy ram_D5,Y              ; 4
    bne    LB683                 ; 2³
    nop                          ; 2
    nop                          ; 2
    lda    LB173,Y               ; 4
    ldy    #6                    ; 2
    sta    PF2                   ; 3
    sta    PF1                   ; 3
    lda    (ram_81),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_83),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    jmp    LB6EF                 ; 3

LB683:
    tax                          ; 2
    lda    LB173,Y               ; 4
    ldy    #6                    ; 2
    sta    PF2|MIRROR            ; 4   uses an extra cycle
    sta    PF1                   ; 3
    lda    (ram_83),Y            ; 5
    sta    GRP1                  ; 3
    lda    LBC00,X               ; 4
    sta    ram_82                ; 3
    lda    ram_F0                ; 3
    sta    HMP0                  ; 3
    and    #$0F                  ; 2
    lsr                          ; 2
    tay                          ; 2
    bcs    LB6D6                 ; 2³
    beq    LB6BA                 ; 2³
LB6A3:
    dey                          ; 2
    bne    LB6A3                 ; 2³
    ldy    #5                    ; 2
    sta    RESP0                 ; 3
LB6AA:
    lda    LBA00,X               ; 4
    sta    ram_81                ; 3
    lda    LBB00,X               ; 4
    sta    NUSIZ0                ; 3
    lda    LB900,X               ; 4
    jmp    LB6ED                 ; 3

LB6BA:
    sta    RESP0                 ; 3
    ldy    #5                    ; 2
    jmp    LB6AA                 ; 3

LB6C1:
    lda    LBA00,X               ; 4
    sta    ram_81                ; 3
    lda    LBB00,X               ; 4
    sta    NUSIZ0                ; 3
    lda    LB900,X               ; 4
    sta    RESP0|MIRROR          ; 4   uses an extra cycle
    ldy    #5                    ; 2
    jmp    LB6ED                 ; 3

LB6D6:
    beq    LB6C1                 ; 2³
    lda    LBA00,X               ; 4
    sta    ram_81                ; 3
    lda    LBB00,X               ; 4
    sta    NUSIZ0                ; 3
    lda    LB900,X               ; 4
LB6E5:
    dey                          ; 2
    bne    LB6E5                 ; 2³
    ldy    #5                    ; 2
    sta    RESP0|MIRROR          ; 4   uses an extra cycle
LB6ED:
    sta    COLUP0                ; 3
LB6EF:
    lda    (ram_81),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    tsx                          ; 2
    sta    GRP0                  ; 3
    lda    (ram_83),Y            ; 5
    sta    GRP1                  ; 3
    lda    sc_19|READ,X          ; 4
    sta    PF1                   ; 3
    sta    ram_BD                ; 3
    lda    sc_1A|READ,X          ; 4
    sta    PF2                   ; 3
    lda    sc_1B|READ,X          ; 4
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
    dey                          ; 2
    sta    PF2                   ; 3
    sta    ram_ED                ; 3
    lda    sc_1F|READ,X          ; 4
    sta    PF1                   ; 3
    sta    ram_EF                ; 3
    lda    sc_1D|READ,X          ; 4
    sta    ram_EE                ; 3
    nop                          ; 2
    sta    PF2                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    lda    ram_BD                ; 3
    sta    PF1                   ; 3
    lda    (ram_81),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_83),Y            ; 5
    sta    GRP1                  ; 3
    cpx    #$49                  ; 2
    bcs    LB74F                 ; 2³
    lsr    ram_D4                ; 5
    sta    HMCLR                 ; 3
    lda    ram_EF                ; 3
    sta    PF1                   ; 3
    lda    ram_ED                ; 3
    sta    PF2                   ; 3
    txs                          ; 2
    dey                          ; 2
    lda    #0                    ; 2
    rol                          ; 2
    rol                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta    ENABL                 ; 3
    jmp    LB75C                 ; 3

LB74F:
    lda    ram_EF                ; 3
    sta    PF1                   ; 3
    txs                          ; 2
    sta    HMCLR                 ; 3
    dey                          ; 2
    lda    ram_ED                ; 3
    sta    PF2|MIRROR            ; 4   uses an extra cycle
LB75C:
    lda    ram_BD                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    lda    (ram_81),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_83),Y            ; 5
    sta    GRP1                  ; 3
    lda    ram_EE                ; 3
    sta    PF2                   ; 3
    ldy    ram_90                ; 3
    lda.wy ram_A7,Y              ; 4
    sta    ram_F0                ; 3
    lda    ram_EF                ; 3
    sta    PF1                   ; 3
    lda    ram_ED                ; 3
    sta    PF2|MIRROR            ; 4   uses an extra cycle
    lda.wy ram_BE,Y              ; 4
    bne    LB79A                 ; 2³
    nop                          ; 2
    nop                          ; 2
    lda    LB173,Y               ; 4
    ldy    #2                    ; 2
    sta    PF2                   ; 3
    sta    PF1                   ; 3
    lda    (ram_81),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_83),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    jmp    LB806                 ; 3

LB79A:
    tax                          ; 2
    lda    LB173,Y               ; 4
    ldy    #2                    ; 2
    sta    PF2|MIRROR            ; 4   uses an extra cycle
    sta    PF1                   ; 3
    lda    (ram_81),Y            ; 5
    sta    GRP0                  ; 3
    lda    LBC00,X               ; 4
    sta    ram_84                ; 3
    lda    ram_F0                ; 3
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    lsr                          ; 2
    tay                          ; 2
    bcs    LB7ED                 ; 2³
    beq    LB7D1                 ; 2³
LB7BA:
    dey                          ; 2
    bne    LB7BA                 ; 2³
    ldy    #1                    ; 2
    sta    RESP1                 ; 3
LB7C1:
    lda    LBA00,X               ; 4
    sta    ram_83                ; 3
    lda    LBB00,X               ; 4
    sta    NUSIZ1                ; 3
    lda    LB900,X               ; 4
    jmp    LB804                 ; 3

LB7D1:
    sta    RESP1                 ; 3
    ldy    #1                    ; 2
    jmp    LB7C1                 ; 3

LB7D8:
    lda    LBA00,X               ; 4
    sta    ram_83                ; 3
    lda    LBB00,X               ; 4
    sta    NUSIZ1                ; 3
    lda    LB900,X               ; 4
    sta    RESP1|MIRROR          ; 4   uses an extra cycle
    ldy    #1                    ; 2
    jmp    LB804                 ; 3

LB7ED:
    beq    LB7D8                 ; 2³
    lda    LBA00,X               ; 4
    sta    ram_83                ; 3
    lda    LBB00,X               ; 4
    sta    NUSIZ1                ; 3
    lda    LB900,X               ; 4
LB7FC:
    dey                          ; 2
    bne    LB7FC                 ; 2³
    ldy    #1                    ; 2
    sta    RESP1|MIRROR          ; 4   uses an extra cycle
LB804:
    sta    COLUP1                ; 3
LB806:
    lda    (ram_81),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    (ram_83),Y            ; 5
    sta    GRP1                  ; 3
    lda    ram_BD                ; 3
    sta    PF1                   ; 3
    lda    ram_EE                ; 3
    sta    PF2                   ; 3
    dey                          ; 2
    tsx                          ; 2
    lda    ram_EF                ; 3
    sta    PF1                   ; 3
    lda    ram_ED                ; 3
    sta    PF2                   ; 3
    sta    HMCLR                 ; 3
    lda    sc_19|READ,X          ; 4
    sta    ram_EA                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_BD                ; 3
    sta    PF1                   ; 3
    lda    ram_EE                ; 3
    sta    PF2                   ; 3
    lda    (ram_81),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_83),Y            ; 5
    sta    GRP1                  ; 3
    lda    ram_81                ; 3
    sec                          ; 2
    sbc    #8                    ; 2
    sta    ram_81                ; 3
    ldy    #7                    ; 2
    lda    ram_ED                ; 3
    sec                          ; 2
    sta    PF2                   ; 3
    lda    ram_EF                ; 3
    sta    PF1                   ; 3
    lda    ram_83                ; 3
    sbc    #8                    ; 2
    sta    ram_83                ; 3
    dec    ram_90                ; 5
    jmp    LB409                 ; 3

LB85D:
    stx    sc_6E                 ; 4
    stx    sc_6F                 ; 4
    stx    sc_70                 ; 4
    dex                          ; 2
    stx    PF2                   ; 3
    jmp    LBFE7                 ; 3

LB86C:
    .byte $70 ; | XXX    | $B86C
    .byte $70 ; | XXX    | $B86D
    .byte $60 ; | XX     | $B86E
    .byte $50 ; | X X    | $B86F
    .byte $40 ; | X      | $B870
    .byte $30 ; |  XX    | $B871
    .byte $20 ; |  X     | $B872
    .byte $10 ; |   X    | $B873
    .byte $00 ; |        | $B874
    .byte $F0 ; |XXXX    | $B875
    .byte $E0 ; |XXX     | $B876
    .byte $D0 ; |XX X    | $B877
    .byte $C0 ; |XX      | $B878
    .byte $B0 ; |X XX    | $B879
    .byte $A0 ; |X X     | $B87A
    .byte $90 ; |X  X    | $B87B
    .byte $80 ; |X       | $B87C
    .byte $62 ; | XX   X | $B87D
    .byte $52 ; | X X  X | $B87E
    .byte $42 ; | X    X | $B87F
    .byte $32 ; |  XX  X | $B880
    .byte $22 ; |  X   X | $B881
    .byte $12 ; |   X  X | $B882
    .byte $02 ; |      X | $B883
    .byte $F2 ; |XXXX  X | $B884
    .byte $E2 ; |XXX   X | $B885
    .byte $D2 ; |XX X  X | $B886
    .byte $C2 ; |XX    X | $B887
    .byte $B2 ; |X XX  X | $B888
    .byte $A2 ; |X X   X | $B889
    .byte $92 ; |X  X  X | $B88A
    .byte $82 ; |X     X | $B88B
    .byte $64 ; | XX  X  | $B88C
    .byte $54 ; | X X X  | $B88D
    .byte $44 ; | X   X  | $B88E
    .byte $34 ; |  XX X  | $B88F
    .byte $24 ; |  X  X  | $B890
    .byte $14 ; |   X X  | $B891
    .byte $04 ; |     X  | $B892
    .byte $F4 ; |XXXX X  | $B893
    .byte $E4 ; |XXX  X  | $B894
    .byte $D4 ; |XX X X  | $B895
    .byte $C4 ; |XX   X  | $B896
    .byte $B4 ; |X XX X  | $B897
    .byte $A4 ; |X X  X  | $B898
    .byte $94 ; |X  X X  | $B899
    .byte $84 ; |X    X  | $B89A
    .byte $66 ; | XX  XX | $B89B
    .byte $56 ; | X X XX | $B89C
    .byte $46 ; | X   XX | $B89D
    .byte $36 ; |  XX XX | $B89E
    .byte $26 ; |  X  XX | $B89F
    .byte $16 ; |   X XX | $B8A0
    .byte $06 ; |     XX | $B8A1
    .byte $F6 ; |XXXX XX | $B8A2
    .byte $E6 ; |XXX  XX | $B8A3
    .byte $D6 ; |XX X XX | $B8A4
    .byte $C6 ; |XX   XX | $B8A5
    .byte $B6 ; |X XX XX | $B8A6
    .byte $A6 ; |X X  XX | $B8A7
    .byte $96 ; |X  X XX | $B8A8
    .byte $86 ; |X    XX | $B8A9
    .byte $61 ; | XX    X| $B8AA
    .byte $51 ; | X X   X| $B8AB
    .byte $41 ; | X     X| $B8AC
    .byte $31 ; |  XX   X| $B8AD
    .byte $21 ; |  X    X| $B8AE
    .byte $11 ; |   X   X| $B8AF
    .byte $01 ; |       X| $B8B0
    .byte $F1 ; |XXXX   X| $B8B1
    .byte $E1 ; |XXX    X| $B8B2
    .byte $D1 ; |XX X   X| $B8B3
    .byte $C1 ; |XX     X| $B8B4
    .byte $B1 ; |X XX   X| $B8B5
    .byte $A1 ; |X X    X| $B8B6
    .byte $91 ; |X  X   X| $B8B7
    .byte $81 ; |X      X| $B8B8
    .byte $63 ; | XX   XX| $B8B9
    .byte $53 ; | X X  XX| $B8BA
    .byte $43 ; | X    XX| $B8BB
    .byte $33 ; |  XX  XX| $B8BC
    .byte $23 ; |  X   XX| $B8BD
    .byte $13 ; |   X  XX| $B8BE
    .byte $03 ; |      XX| $B8BF
    .byte $F3 ; |XXXX  XX| $B8C0
    .byte $E3 ; |XXX   XX| $B8C1
    .byte $D3 ; |XX X  XX| $B8C2
    .byte $C3 ; |XX    XX| $B8C3
    .byte $B3 ; |X XX  XX| $B8C4
    .byte $A3 ; |X X   XX| $B8C5
    .byte $93 ; |X  X  XX| $B8C6
    .byte $83 ; |X     XX| $B8C7
    .byte $65 ; | XX  X X| $B8C8
    .byte $55 ; | X X X X| $B8C9
    .byte $45 ; | X   X X| $B8CA
    .byte $35 ; |  XX X X| $B8CB
    .byte $25 ; |  X  X X| $B8CC
    .byte $15 ; |   X X X| $B8CD
    .byte $05 ; |     X X| $B8CE
    .byte $F5 ; |XXXX X X| $B8CF
    .byte $E5 ; |XXX  X X| $B8D0
    .byte $D5 ; |XX X X X| $B8D1
    .byte $C5 ; |XX   X X| $B8D2
    .byte $B5 ; |X XX X X| $B8D3
    .byte $A5 ; |X X  X X| $B8D4
    .byte $95 ; |X  X X X| $B8D5
    .byte $85 ; |X    X X| $B8D6
    .byte $67 ; | XX  XXX| $B8D7
    .byte $57 ; | X X XXX| $B8D8
    .byte $47 ; | X   XXX| $B8D9
    .byte $37 ; |  XX XXX| $B8DA
    .byte $27 ; |  X  XXX| $B8DB
    .byte $17 ; |   X XXX| $B8DC
    .byte $07 ; |     XXX| $B8DD
LB8DE:
    .byte $F7 ; |XXXX XXX| $B8DE
    .byte $E7 ; |XXX  XXX| $B8DF
    .byte $D7 ; |XX X XXX| $B8E0
    .byte $C7 ; |XX   XXX| $B8E1
    .byte $B7 ; |X XX XXX| $B8E2
    .byte $A7 ; |X X  XXX| $B8E3
    .byte $97 ; |X  X XXX| $B8E4
    .byte $D8 ; |XX XX   | $B8E5
    .byte $C3 ; |XX    XX| $B8E6
    .byte $24 ; |  X  X  | $B8E7
    .byte $29 ; |  X X  X| $B8E8
    .byte $CD ; |XX  XX X| $B8E9
    .byte $CC ; |XX  XX  | $B8EA
    .byte $22 ; |  X   X | $B8EB
    .byte $D8 ; |XX XX   | $B8EC
    .byte $00 ; |        | $B8ED
    .byte $00 ; |        | $B8EE
    .byte $00 ; |        | $B8EF
    .byte $00 ; |        | $B8F0
    .byte $7E ; | XXXXXX | $B8F1
    .byte $FF ; |XXXXXXXX| $B8F2
    .byte $FF ; |XXXXXXXX| $B8F3
    .byte $FF ; |XXXXXXXX| $B8F4
    .byte $7F ; | XXXXXXX| $B8F5
    .byte $FB ; |XXXXX XX| $B8F6
    .byte $FD ; |XXXXXX X| $B8F7
    .byte $0D ; |    XX X| $B8F8
    .byte $FC ; |XXXXXX  | $B8F9
    .byte $6C ; | XX XX  | $B8FA
    .byte $38 ; |  XXX   | $B8FB
    .byte $00 ; |        | $B8FC
    .byte $00 ; |        | $B8FD
    .byte $00 ; |        | $B8FE
    .byte $00 ; |        | $B8FF
LB900:
    .byte $00 ; |        | $B900
    .byte $3A ; |  XXX X | $B901
    .byte $3A ; |  XXX X | $B902
    .byte $3A ; |  XXX X | $B903
    .byte $3A ; |  XXX X | $B904
    .byte $24 ; |  X  X  | $B905
    .byte $D8 ; |XX XX   | $B906
    .byte $42 ; | X    X | $B907
    .byte $7F ; | XXXXXXX| $B908
    .byte $7F ; | XXXXXXX| $B909
    .byte $D8 ; |XX XX   | $B90A
    .byte $DC ; |XX XXX  | $B90B
    .byte $F4 ; |XXXX X  | $B90C
    .byte $16 ; |   X XX | $B90D
    .byte $7F ; | XXXXXXX| $B90E
    .byte $D8 ; |XX XX   | $B90F
    .byte $00 ; |        | $B910
    .byte $3A ; |  XXX X | $B911
    .byte $3A ; |  XXX X | $B912
    .byte $3A ; |  XXX X | $B913
    .byte $3A ; |  XXX X | $B914
    .byte $24 ; |  X  X  | $B915
    .byte $D8 ; |XX XX   | $B916
    .byte $42 ; | X    X | $B917
    .byte $7F ; | XXXXXXX| $B918
    .byte $7F ; | XXXXXXX| $B919
    .byte $D8 ; |XX XX   | $B91A
    .byte $DC ; |XX XXX  | $B91B
    .byte $F4 ; |XXXX X  | $B91C
    .byte $16 ; |   X XX | $B91D
    .byte $7F ; | XXXXXXX| $B91E
    .byte $D8 ; |XX XX   | $B91F
    .byte $00 ; |        | $B920
    .byte $3A ; |  XXX X | $B921
    .byte $3A ; |  XXX X | $B922
    .byte $3A ; |  XXX X | $B923
    .byte $3A ; |  XXX X | $B924
    .byte $24 ; |  X  X  | $B925
    .byte $D8 ; |XX XX   | $B926
    .byte $42 ; | X    X | $B927
    .byte $7F ; | XXXXXXX| $B928
    .byte $7F ; | XXXXXXX| $B929
    .byte $D8 ; |XX XX   | $B92A
    .byte $DC ; |XX XXX  | $B92B
    .byte $F4 ; |XXXX X  | $B92C
    .byte $16 ; |   X XX | $B92D
    .byte $7F ; | XXXXXXX| $B92E
    .byte $D8 ; |XX XX   | $B92F
    .byte $00 ; |        | $B930
    .byte $3A ; |  XXX X | $B931
    .byte $3A ; |  XXX X | $B932
    .byte $3A ; |  XXX X | $B933
    .byte $3A ; |  XXX X | $B934
    .byte $24 ; |  X  X  | $B935
    .byte $D8 ; |XX XX   | $B936
    .byte $42 ; | X    X | $B937
    .byte $7F ; | XXXXXXX| $B938
    .byte $7F ; | XXXXXXX| $B939
    .byte $D8 ; |XX XX   | $B93A
    .byte $DC ; |XX XXX  | $B93B
    .byte $F4 ; |XXXX X  | $B93C
    .byte $16 ; |   X XX | $B93D
    .byte $7F ; | XXXXXXX| $B93E
    .byte $D8 ; |XX XX   | $B93F
    .byte $7F ; | XXXXXXX| $B940
    .byte $7F ; | XXXXXXX| $B941
    .byte $7F ; | XXXXXXX| $B942
    .byte $D8 ; |XX XX   | $B943
    .byte $7F ; | XXXXXXX| $B944
    .byte $7F ; | XXXXXXX| $B945
    .byte $7F ; | XXXXXXX| $B946
    .byte $D8 ; |XX XX   | $B947
    .byte $7F ; | XXXXXXX| $B948
    .byte $7F ; | XXXXXXX| $B949
    .byte $7F ; | XXXXXXX| $B94A
    .byte $7F ; | XXXXXXX| $B94B
    .byte $3E ; |  XXXXX | $B94C
    .byte $3E ; |  XXXXX | $B94D
    .byte $DE ; |XX XXXX | $B94E
    .byte $DE ; |XX XXXX | $B94F
    .byte $7F ; | XXXXXXX| $B950
    .byte $7F ; | XXXXXXX| $B951
    .byte $7F ; | XXXXXXX| $B952
    .byte $D8 ; |XX XX   | $B953
    .byte $7F ; | XXXXXXX| $B954
    .byte $7F ; | XXXXXXX| $B955
    .byte $7F ; | XXXXXXX| $B956
    .byte $D8 ; |XX XX   | $B957
    .byte $7F ; | XXXXXXX| $B958
    .byte $7F ; | XXXXXXX| $B959
    .byte $7F ; | XXXXXXX| $B95A
    .byte $7F ; | XXXXXXX| $B95B
    .byte $3E ; |  XXXXX | $B95C
    .byte $3E ; |  XXXXX | $B95D
    .byte $DE ; |XX XXXX | $B95E
    .byte $DE ; |XX XXXX | $B95F
    .byte $7F ; | XXXXXXX| $B960
    .byte $7F ; | XXXXXXX| $B961
    .byte $7F ; | XXXXXXX| $B962
    .byte $D8 ; |XX XX   | $B963
    .byte $7F ; | XXXXXXX| $B964
    .byte $7F ; | XXXXXXX| $B965
    .byte $7F ; | XXXXXXX| $B966
    .byte $D8 ; |XX XX   | $B967
    .byte $7F ; | XXXXXXX| $B968
    .byte $7F ; | XXXXXXX| $B969
    .byte $7F ; | XXXXXXX| $B96A
    .byte $7F ; | XXXXXXX| $B96B
    .byte $3E ; |  XXXXX | $B96C
    .byte $3E ; |  XXXXX | $B96D
    .byte $DE ; |XX XXXX | $B96E
    .byte $DE ; |XX XXXX | $B96F
    .byte $7F ; | XXXXXXX| $B970
    .byte $7F ; | XXXXXXX| $B971
    .byte $7F ; | XXXXXXX| $B972
    .byte $D8 ; |XX XX   | $B973
    .byte $7F ; | XXXXXXX| $B974
    .byte $7F ; | XXXXXXX| $B975
    .byte $7F ; | XXXXXXX| $B976
    .byte $D8 ; |XX XX   | $B977
    .byte $7F ; | XXXXXXX| $B978
    .byte $7F ; | XXXXXXX| $B979
    .byte $7F ; | XXXXXXX| $B97A
    .byte $7F ; | XXXXXXX| $B97B
    .byte $3E ; |  XXXXX | $B97C
    .byte $3E ; |  XXXXX | $B97D
    .byte $DE ; |XX XXXX | $B97E
    .byte $DE ; |XX XXXX | $B97F
    .byte $34 ; |  XX X  | $B980
    .byte $7F ; | XXXXXXX| $B981
    .byte $34 ; |  XX X  | $B982
    .byte $34 ; |  XX X  | $B983
    .byte $34 ; |  XX X  | $B984
    .byte $24 ; |  X  X  | $B985
    .byte $34 ; |  XX X  | $B986
    .byte $24 ; |  X  X  | $B987
    .byte $34 ; |  XX X  | $B988
    .byte $24 ; |  X  X  | $B989
    .byte $34 ; |  XX X  | $B98A
    .byte $D8 ; |XX XX   | $B98B
    .byte $3A ; |  XXX X | $B98C
    .byte $3A ; |  XXX X | $B98D
    .byte $D8 ; |XX XX   | $B98E
    .byte $D8 ; |XX XX   | $B98F
    .byte $34 ; |  XX X  | $B990
    .byte $7F ; | XXXXXXX| $B991
    .byte $34 ; |  XX X  | $B992
    .byte $34 ; |  XX X  | $B993
    .byte $34 ; |  XX X  | $B994
    .byte $24 ; |  X  X  | $B995
    .byte $34 ; |  XX X  | $B996
    .byte $24 ; |  X  X  | $B997
    .byte $34 ; |  XX X  | $B998
    .byte $24 ; |  X  X  | $B999
    .byte $34 ; |  XX X  | $B99A
    .byte $D8 ; |XX XX   | $B99B
    .byte $3A ; |  XXX X | $B99C
    .byte $3A ; |  XXX X | $B99D
    .byte $D8 ; |XX XX   | $B99E
    .byte $D8 ; |XX XX   | $B99F
    .byte $34 ; |  XX X  | $B9A0
    .byte $7F ; | XXXXXXX| $B9A1
    .byte $34 ; |  XX X  | $B9A2
    .byte $34 ; |  XX X  | $B9A3
    .byte $34 ; |  XX X  | $B9A4
    .byte $24 ; |  X  X  | $B9A5
    .byte $34 ; |  XX X  | $B9A6
    .byte $24 ; |  X  X  | $B9A7
    .byte $34 ; |  XX X  | $B9A8
    .byte $24 ; |  X  X  | $B9A9
    .byte $34 ; |  XX X  | $B9AA
    .byte $D8 ; |XX XX   | $B9AB
    .byte $3A ; |  XXX X | $B9AC
    .byte $3A ; |  XXX X | $B9AD
    .byte $D8 ; |XX XX   | $B9AE
    .byte $D8 ; |XX XX   | $B9AF
    .byte $34 ; |  XX X  | $B9B0
    .byte $7F ; | XXXXXXX| $B9B1
    .byte $34 ; |  XX X  | $B9B2
    .byte $34 ; |  XX X  | $B9B3
    .byte $34 ; |  XX X  | $B9B4
    .byte $24 ; |  X  X  | $B9B5
    .byte $34 ; |  XX X  | $B9B6
    .byte $24 ; |  X  X  | $B9B7
    .byte $34 ; |  XX X  | $B9B8
    .byte $24 ; |  X  X  | $B9B9
    .byte $34 ; |  XX X  | $B9BA
    .byte $D8 ; |XX XX   | $B9BB
    .byte $3A ; |  XXX X | $B9BC
    .byte $3A ; |  XXX X | $B9BD
    .byte $D8 ; |XX XX   | $B9BE
    .byte $D8 ; |XX XX   | $B9BF
    .byte $24 ; |  X  X  | $B9C0
    .byte $D4 ; |XX X X  | $B9C1
    .byte $52 ; | X X  X | $B9C2
    .byte $D4 ; |XX X X  | $B9C3
    .byte $32 ; |  XX  X | $B9C4
    .byte $42 ; | X    X | $B9C5
    .byte $7F ; | XXXXXXX| $B9C6
    .byte $26 ; |  X  XX | $B9C7
    .byte $7F ; | XXXXXXX| $B9C8
    .byte $7F ; | XXXXXXX| $B9C9
    .byte $42 ; | X    X | $B9CA
    .byte $42 ; | X    X | $B9CB
    .byte $42 ; | X    X | $B9CC
    .byte $7F ; | XXXXXXX| $B9CD
    .byte $34 ; |  XX X  | $B9CE
    .byte $34 ; |  XX X  | $B9CF
    .byte $24 ; |  X  X  | $B9D0
    .byte $D4 ; |XX X X  | $B9D1
    .byte $52 ; | X X  X | $B9D2
    .byte $D4 ; |XX X X  | $B9D3
    .byte $32 ; |  XX  X | $B9D4
    .byte $42 ; | X    X | $B9D5
    .byte $7F ; | XXXXXXX| $B9D6
    .byte $26 ; |  X  XX | $B9D7
    .byte $7F ; | XXXXXXX| $B9D8
    .byte $7F ; | XXXXXXX| $B9D9
    .byte $42 ; | X    X | $B9DA
    .byte $42 ; | X    X | $B9DB
    .byte $42 ; | X    X | $B9DC
    .byte $7F ; | XXXXXXX| $B9DD
    .byte $34 ; |  XX X  | $B9DE
    .byte $34 ; |  XX X  | $B9DF
    .byte $24 ; |  X  X  | $B9E0
    .byte $D4 ; |XX X X  | $B9E1
    .byte $52 ; | X X  X | $B9E2
    .byte $D4 ; |XX X X  | $B9E3
    .byte $32 ; |  XX  X | $B9E4
    .byte $42 ; | X    X | $B9E5
    .byte $7F ; | XXXXXXX| $B9E6
    .byte $26 ; |  X  XX | $B9E7
    .byte $7F ; | XXXXXXX| $B9E8
    .byte $7F ; | XXXXXXX| $B9E9
    .byte $42 ; | X    X | $B9EA
    .byte $42 ; | X    X | $B9EB
    .byte $42 ; | X    X | $B9EC
    .byte $7F ; | XXXXXXX| $B9ED
    .byte $34 ; |  XX X  | $B9EE
    .byte $34 ; |  XX X  | $B9EF
    .byte $24 ; |  X  X  | $B9F0
    .byte $D4 ; |XX X X  | $B9F1
    .byte $52 ; | X X  X | $B9F2
    .byte $D4 ; |XX X X  | $B9F3
    .byte $32 ; |  XX  X | $B9F4
    .byte $42 ; | X    X | $B9F5
    .byte $7F ; | XXXXXXX| $B9F6
    .byte $26 ; |  X  XX | $B9F7
    .byte $7F ; | XXXXXXX| $B9F8
    .byte $7F ; | XXXXXXX| $B9F9
    .byte $42 ; | X    X | $B9FA
    .byte $42 ; | X    X | $B9FB
    .byte $42 ; | X    X | $B9FC
    .byte $7F ; | XXXXXXX| $B9FD
    .byte $34 ; |  XX X  | $B9FE
    .byte $34 ; |  XX X  | $B9FF
LBA00:
    .byte $69 ; | XX X  X| $BA00
    .byte $E3 ; |XXX   XX| $BA01
    .byte $3D ; |  XXXX X| $BA02
    .byte $59 ; | X XX  X| $BA03
    .byte $68 ; | XX X   | $BA04
    .byte $46 ; | X   XX | $BA05
    .byte $2E ; |  X XXX | $BA06
    .byte $6E ; | XX XXX | $BA07
    .byte $81 ; |X      X| $BA08
    .byte $9D ; |X  XXX X| $BA09
    .byte $1F ; |   XXXXX| $BA0A
    .byte $75 ; | XXX X X| $BA0B
    .byte $D5 ; |XX X X X| $BA0C
    .byte $F2 ; |XXXX  X | $BA0D
    .byte $81 ; |X      X| $BA0E
    .byte $F6 ; |XXXX XX | $BA0F
    .byte $6D ; | XX XX X| $BA10
    .byte $E7 ; |XXX  XXX| $BA11
    .byte $41 ; | X     X| $BA12
    .byte $5D ; | X XXX X| $BA13
    .byte $6C ; | XX XX  | $BA14
    .byte $4A ; | X  X X | $BA15
    .byte $32 ; |  XX  X | $BA16
    .byte $72 ; | XXX  X | $BA17
    .byte $85 ; |X    X X| $BA18
    .byte $A1 ; |X X    X| $BA19
    .byte $23 ; |  X   XX| $BA1A
    .byte $79 ; | XXXX  X| $BA1B
    .byte $D9 ; |XX XX  X| $BA1C
    .byte $F6 ; |XXXX XX | $BA1D
    .byte $85 ; |X    X X| $BA1E
    .byte $FA ; |XXXXX X | $BA1F
    .byte $6D ; | XX XX X| $BA20
    .byte $E7 ; |XXX  XXX| $BA21
    .byte $41 ; | X     X| $BA22
    .byte $5D ; | X XXX X| $BA23
    .byte $6C ; | XX XX  | $BA24
    .byte $4A ; | X  X X | $BA25
    .byte $32 ; |  XX  X | $BA26
    .byte $72 ; | XXX  X | $BA27
    .byte $85 ; |X    X X| $BA28
    .byte $A1 ; |X X    X| $BA29
    .byte $23 ; |  X   XX| $BA2A
    .byte $79 ; | XXXX  X| $BA2B
    .byte $D9 ; |XX XX  X| $BA2C
    .byte $F6 ; |XXXX XX | $BA2D
    .byte $85 ; |X    X X| $BA2E
    .byte $FA ; |XXXXX X | $BA2F
    .byte $71 ; | XXX   X| $BA30
    .byte $EB ; |XXX X XX| $BA31
    .byte $45 ; | X   X X| $BA32
    .byte $61 ; | XX    X| $BA33
    .byte $70 ; | XXX    | $BA34
    .byte $4E ; | X  XXX | $BA35
    .byte $36 ; |  XX XX | $BA36
    .byte $76 ; | XXX XX | $BA37
    .byte $89 ; |X   X  X| $BA38
    .byte $A5 ; |X X  X X| $BA39
    .byte $27 ; |  X  XXX| $BA3A
    .byte $7D ; | XXXXX X| $BA3B
    .byte $DD ; |XX XXX X| $BA3C
    .byte $FA ; |XXXXX X | $BA3D
    .byte $89 ; |X   X  X| $BA3E
    .byte $FE ; |XXXXXXX | $BA3F
    .byte $19 ; |   XX  X| $BA40
    .byte $28 ; |  X X   | $BA41
    .byte $37 ; |  XX XXX| $BA42
    .byte $D8 ; |XX XX   | $BA43
    .byte $46 ; | X   XX | $BA44
    .byte $55 ; | X X X X| $BA45
    .byte $64 ; | XX  X  | $BA46
    .byte $E7 ; |XXX  XXX| $BA47
    .byte $73 ; | XXX  XX| $BA48
    .byte $9F ; |X  XXXXX| $BA49
    .byte $82 ; |X     X | $BA4A
    .byte $91 ; |X  X   X| $BA4B
    .byte $BC ; |X XXXX  | $BA4C
    .byte $C9 ; |XX  X  X| $BA4D
    .byte $AE ; |X X XXX | $BA4E
    .byte $55 ; | X X X X| $BA4F
    .byte $1D ; |   XXX X| $BA50
    .byte $2C ; |  X XX  | $BA51
    .byte $3B ; |  XXX XX| $BA52
    .byte $DC ; |XX XXX  | $BA53
    .byte $4A ; | X  X X | $BA54
    .byte $59 ; | X XX  X| $BA55
    .byte $68 ; | XX X   | $BA56
    .byte $EB ; |XXX X XX| $BA57
    .byte $77 ; | XXX XXX| $BA58
    .byte $A3 ; |X X   XX| $BA59
    .byte $86 ; |X    XX | $BA5A
    .byte $95 ; |X  X X X| $BA5B
    .byte $C0 ; |XX      | $BA5C
    .byte $CD ; |XX  XX X| $BA5D
    .byte $B2 ; |X XX  X | $BA5E
    .byte $59 ; | X XX  X| $BA5F
    .byte $1D ; |   XXX X| $BA60
    .byte $2C ; |  X XX  | $BA61
    .byte $3B ; |  XXX XX| $BA62
    .byte $DC ; |XX XXX  | $BA63
    .byte $4A ; | X  X X | $BA64
    .byte $59 ; | X XX  X| $BA65
    .byte $68 ; | XX X   | $BA66
    .byte $EB ; |XXX X XX| $BA67
    .byte $77 ; | XXX XXX| $BA68
    .byte $A3 ; |X X   XX| $BA69
    .byte $86 ; |X    XX | $BA6A
    .byte $95 ; |X  X X X| $BA6B
    .byte $C0 ; |XX      | $BA6C
    .byte $CD ; |XX  XX X| $BA6D
    .byte $B2 ; |X XX  X | $BA6E
    .byte $59 ; | X XX  X| $BA6F
    .byte $21 ; |  X    X| $BA70
    .byte $30 ; |  XX    | $BA71
    .byte $3F ; |  XXXXXX| $BA72
    .byte $E0 ; |XXX     | $BA73
    .byte $4E ; | X  XXX | $BA74
    .byte $5D ; | X XXX X| $BA75
    .byte $6C ; | XX XX  | $BA76
    .byte $EF ; |XXX XXXX| $BA77
    .byte $7B ; | XXXX XX| $BA78
    .byte $A7 ; |X X  XXX| $BA79
    .byte $8A ; |X   X X | $BA7A
    .byte $99 ; |X  XX  X| $BA7B
    .byte $C4 ; |XX   X  | $BA7C
    .byte $D1 ; |XX X   X| $BA7D
    .byte $B6 ; |X XX XX | $BA7E
    .byte $5D ; | X XXX X| $BA7F
    .byte $8E ; |X   XXX | $BA80
    .byte $9D ; |X  XXX X| $BA81
    .byte $8E ; |X   XXX | $BA82
    .byte $AC ; |X X XX  | $BA83
    .byte $8E ; |X   XXX | $BA84
    .byte $64 ; | XX  X  | $BA85
    .byte $4A ; | X  X X | $BA86
    .byte $28 ; |  X X   | $BA87
    .byte $4A ; | X  X X | $BA88
    .byte $37 ; |  XX XXX| $BA89
    .byte $4A ; | X  X X | $BA8A
    .byte $19 ; |   XX  X| $BA8B
    .byte $F6 ; |XXXX XX | $BA8C
    .byte $F6 ; |XXXX XX | $BA8D
    .byte $1F ; |   XXXXX| $BA8E
    .byte $2E ; |  X XXX | $BA8F
    .byte $92 ; |X  X  X | $BA90
    .byte $A1 ; |X X    X| $BA91
    .byte $92 ; |X  X  X | $BA92
    .byte $B0 ; |X XX    | $BA93
    .byte $92 ; |X  X  X | $BA94
    .byte $68 ; | XX X   | $BA95
    .byte $4E ; | X  XXX | $BA96
    .byte $2C ; |  X XX  | $BA97
    .byte $4E ; | X  XXX | $BA98
    .byte $3B ; |  XXX XX| $BA99
    .byte $4E ; | X  XXX | $BA9A
    .byte $1D ; |   XXX X| $BA9B
    .byte $FA ; |XXXXX X | $BA9C
    .byte $FA ; |XXXXX X | $BA9D
    .byte $23 ; |  X   XX| $BA9E
    .byte $32 ; |  XX  X | $BA9F
    .byte $92 ; |X  X  X | $BAA0
    .byte $A1 ; |X X    X| $BAA1
    .byte $92 ; |X  X  X | $BAA2
    .byte $B0 ; |X XX    | $BAA3
    .byte $92 ; |X  X  X | $BAA4
    .byte $68 ; | XX X   | $BAA5
    .byte $4E ; | X  XXX | $BAA6
    .byte $2C ; |  X XX  | $BAA7
    .byte $4E ; | X  XXX | $BAA8
    .byte $3B ; |  XXX XX| $BAA9
    .byte $4E ; | X  XXX | $BAAA
    .byte $1D ; |   XXX X| $BAAB
    .byte $FA ; |XXXXX X | $BAAC
    .byte $FA ; |XXXXX X | $BAAD
    .byte $23 ; |  X   XX| $BAAE
    .byte $32 ; |  XX  X | $BAAF
    .byte $96 ; |X  X XX | $BAB0
    .byte $A5 ; |X X  X X| $BAB1
    .byte $96 ; |X  X XX | $BAB2
    .byte $B4 ; |X XX X  | $BAB3
    .byte $96 ; |X  X XX | $BAB4
    .byte $6C ; | XX XX  | $BAB5
    .byte $52 ; | X X  X | $BAB6
    .byte $30 ; |  XX    | $BAB7
    .byte $52 ; | X X  X | $BAB8
    .byte $3F ; |  XXXXXX| $BAB9
    .byte $52 ; | X X  X | $BABA
    .byte $21 ; |  X    X| $BABB
    .byte $FE ; |XXXXXXX | $BABC
    .byte $FE ; |XXXXXXX | $BABD
    .byte $27 ; |  X  XXX| $BABE
    .byte $36 ; |  XX XX | $BABF
    .byte $71 ; | XXX   X| $BAC0
    .byte $7F ; | XXXXXXX| $BAC1
    .byte $8E ; |X   XXX | $BAC2
    .byte $AB ; |X X X XX| $BAC3
    .byte $B9 ; |X XXX  X| $BAC4
    .byte $C6 ; |XX   XX | $BAC5
    .byte $DD ; |XX XXX X| $BAC6
    .byte $2E ; |  X XXX | $BAC7
    .byte $4C ; | X  XX  | $BAC8
    .byte $3D ; |  XXXX X| $BAC9
    .byte $58 ; | X XX   | $BACA
    .byte $64 ; | XX  X  | $BACB
    .byte $75 ; | XXX X X| $BACC
    .byte $69 ; | XX X  X| $BACD
    .byte $B9 ; |X XXX  X| $BACE
    .byte $C7 ; |XX   XXX| $BACF
    .byte $75 ; | XXX X X| $BAD0
    .byte $83 ; |X     XX| $BAD1
    .byte $92 ; |X  X  X | $BAD2
    .byte $AF ; |X X XXXX| $BAD3
    .byte $BD ; |X XXXX X| $BAD4
    .byte $CA ; |XX  X X | $BAD5
    .byte $E1 ; |XXX    X| $BAD6
    .byte $32 ; |  XX  X | $BAD7
    .byte $50 ; | X X    | $BAD8
    .byte $41 ; | X     X| $BAD9
    .byte $5C ; | X XXX  | $BADA
    .byte $68 ; | XX X   | $BADB
    .byte $79 ; | XXXX  X| $BADC
    .byte $6D ; | XX XX X| $BADD
    .byte $BD ; |X XXXX X| $BADE
    .byte $CB ; |XX  X XX| $BADF
    .byte $75 ; | XXX X X| $BAE0
    .byte $83 ; |X     XX| $BAE1
    .byte $92 ; |X  X  X | $BAE2
    .byte $AF ; |X X XXXX| $BAE3
    .byte $BD ; |X XXXX X| $BAE4
    .byte $CA ; |XX  X X | $BAE5
    .byte $E1 ; |XXX    X| $BAE6
    .byte $32 ; |  XX  X | $BAE7
    .byte $50 ; | X X    | $BAE8
    .byte $41 ; | X     X| $BAE9
    .byte $5C ; | X XXX  | $BAEA
    .byte $68 ; | XX X   | $BAEB
    .byte $79 ; | XXXX  X| $BAEC
    .byte $6D ; | XX XX X| $BAED
    .byte $BD ; |X XXXX X| $BAEE
    .byte $CB ; |XX  X XX| $BAEF
    .byte $79 ; | XXXX  X| $BAF0
    .byte $87 ; |X    XXX| $BAF1
    .byte $96 ; |X  X XX | $BAF2
    .byte $B3 ; |X XX  XX| $BAF3
    .byte $C1 ; |XX     X| $BAF4
    .byte $CE ; |XX  XXX | $BAF5
    .byte $E5 ; |XXX  X X| $BAF6
    .byte $36 ; |  XX XX | $BAF7
    .byte $54 ; | X X X  | $BAF8
    .byte $45 ; | X   X X| $BAF9
    .byte $60 ; | XX     | $BAFA
    .byte $6C ; | XX XX  | $BAFB
    .byte $7D ; | XXXXX X| $BAFC
    .byte $71 ; | XXX   X| $BAFD
    .byte $C1 ; |XX     X| $BAFE
    .byte $CF ; |XX  XXXX| $BAFF
LBB00:
    .byte $00 ; |        | $BB00   NUSIZx table
    .byte $00 ; |        | $BB01
    .byte $00 ; |        | $BB02
    .byte $00 ; |        | $BB03
    .byte $00 ; |        | $BB04
    .byte $00 ; |        | $BB05
    .byte $00 ; |        | $BB06
    .byte $00 ; |        | $BB07
    .byte $00 ; |        | $BB08
    .byte $00 ; |        | $BB09
    .byte $00 ; |        | $BB0A
    .byte $00 ; |        | $BB0B
    .byte $00 ; |        | $BB0C
    .byte $00 ; |        | $BB0D
    .byte $05 ; |     X X| $BB0E
    .byte $00 ; |        | $BB0F
    .byte $00 ; |        | $BB10
    .byte $00 ; |        | $BB11
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
    .byte $05 ; |     X X| $BB1E
    .byte $00 ; |        | $BB1F
    .byte $00 ; |        | $BB20
    .byte $00 ; |        | $BB21
    .byte $00 ; |        | $BB22
    .byte $00 ; |        | $BB23
    .byte $00 ; |        | $BB24
    .byte $00 ; |        | $BB25
    .byte $00 ; |        | $BB26
    .byte $00 ; |        | $BB27
    .byte $00 ; |        | $BB28
    .byte $00 ; |        | $BB29
    .byte $00 ; |        | $BB2A
    .byte $00 ; |        | $BB2B
    .byte $00 ; |        | $BB2C
    .byte $00 ; |        | $BB2D
    .byte $05 ; |     X X| $BB2E
    .byte $00 ; |        | $BB2F
    .byte $00 ; |        | $BB30
    .byte $00 ; |        | $BB31
    .byte $00 ; |        | $BB32
    .byte $00 ; |        | $BB33
    .byte $00 ; |        | $BB34
    .byte $00 ; |        | $BB35
    .byte $00 ; |        | $BB36
    .byte $00 ; |        | $BB37
    .byte $00 ; |        | $BB38
    .byte $00 ; |        | $BB39
    .byte $00 ; |        | $BB3A
    .byte $00 ; |        | $BB3B
    .byte $00 ; |        | $BB3C
    .byte $00 ; |        | $BB3D
    .byte $05 ; |     X X| $BB3E
    .byte $00 ; |        | $BB3F
    .byte $00 ; |        | $BB40
    .byte $00 ; |        | $BB41
    .byte $00 ; |        | $BB42
    .byte $00 ; |        | $BB43
    .byte $00 ; |        | $BB44
    .byte $00 ; |        | $BB45
    .byte $00 ; |        | $BB46
    .byte $00 ; |        | $BB47
    .byte $00 ; |        | $BB48
    .byte $00 ; |        | $BB49
    .byte $00 ; |        | $BB4A
    .byte $00 ; |        | $BB4B
    .byte $00 ; |        | $BB4C
    .byte $00 ; |        | $BB4D
    .byte $00 ; |        | $BB4E
    .byte $00 ; |        | $BB4F
    .byte $00 ; |        | $BB50
    .byte $00 ; |        | $BB51
    .byte $00 ; |        | $BB52
    .byte $00 ; |        | $BB53
    .byte $00 ; |        | $BB54
    .byte $00 ; |        | $BB55
    .byte $00 ; |        | $BB56
    .byte $00 ; |        | $BB57
    .byte $00 ; |        | $BB58
    .byte $00 ; |        | $BB59
    .byte $00 ; |        | $BB5A
    .byte $00 ; |        | $BB5B
    .byte $00 ; |        | $BB5C
    .byte $00 ; |        | $BB5D
    .byte $00 ; |        | $BB5E
    .byte $00 ; |        | $BB5F
LBB60:
    .byte $00 ; |        | $BB60
    .byte $00 ; |        | $BB61
    .byte $00 ; |        | $BB62
    .byte $00 ; |        | $BB63
    .byte $00 ; |        | $BB64
    .byte $00 ; |        | $BB65
    .byte $00 ; |        | $BB66
    .byte $00 ; |        | $BB67
    .byte $00 ; |        | $BB68
    .byte $00 ; |        | $BB69
    .byte $00 ; |        | $BB6A
    .byte $00 ; |        | $BB6B
    .byte $00 ; |        | $BB6C
    .byte $00 ; |        | $BB6D
    .byte $00 ; |        | $BB6E
    .byte $00 ; |        | $BB6F
    .byte $00 ; |        | $BB70
    .byte $00 ; |        | $BB71
    .byte $00 ; |        | $BB72
    .byte $00 ; |        | $BB73
    .byte $00 ; |        | $BB74
    .byte $00 ; |        | $BB75
    .byte $00 ; |        | $BB76
    .byte $00 ; |        | $BB77
    .byte $00 ; |        | $BB78
    .byte $00 ; |        | $BB79
    .byte $00 ; |        | $BB7A
    .byte $00 ; |        | $BB7B
    .byte $00 ; |        | $BB7C
    .byte $00 ; |        | $BB7D
    .byte $00 ; |        | $BB7E
    .byte $00 ; |        | $BB7F
    .byte $00 ; |        | $BB80
    .byte $00 ; |        | $BB81
    .byte $05 ; |     X X| $BB82
    .byte $00 ; |        | $BB83
    .byte $07 ; |     XXX| $BB84
    .byte $00 ; |        | $BB85
    .byte $00 ; |        | $BB86
    .byte $00 ; |        | $BB87
    .byte $05 ; |     X X| $BB88
    .byte $00 ; |        | $BB89
    .byte $07 ; |     XXX| $BB8A
    .byte $00 ; |        | $BB8B
    .byte $00 ; |        | $BB8C
    .byte $05 ; |     X X| $BB8D
    .byte $05 ; |     X X| $BB8E
    .byte $05 ; |     X X| $BB8F
    .byte $00 ; |        | $BB90
    .byte $00 ; |        | $BB91
    .byte $05 ; |     X X| $BB92
    .byte $00 ; |        | $BB93
    .byte $07 ; |     XXX| $BB94
    .byte $00 ; |        | $BB95
    .byte $00 ; |        | $BB96
    .byte $00 ; |        | $BB97
    .byte $05 ; |     X X| $BB98
    .byte $00 ; |        | $BB99
    .byte $07 ; |     XXX| $BB9A
    .byte $00 ; |        | $BB9B
    .byte $00 ; |        | $BB9C
    .byte $05 ; |     X X| $BB9D
    .byte $05 ; |     X X| $BB9E
    .byte $05 ; |     X X| $BB9F
    .byte $00 ; |        | $BBA0
    .byte $00 ; |        | $BBA1
    .byte $05 ; |     X X| $BBA2
    .byte $00 ; |        | $BBA3
    .byte $07 ; |     XXX| $BBA4
    .byte $00 ; |        | $BBA5
    .byte $00 ; |        | $BBA6
    .byte $00 ; |        | $BBA7
    .byte $05 ; |     X X| $BBA8
    .byte $00 ; |        | $BBA9
    .byte $07 ; |     XXX| $BBAA
    .byte $00 ; |        | $BBAB
    .byte $00 ; |        | $BBAC
    .byte $05 ; |     X X| $BBAD
    .byte $05 ; |     X X| $BBAE
    .byte $05 ; |     X X| $BBAF
    .byte $00 ; |        | $BBB0
    .byte $00 ; |        | $BBB1
    .byte $05 ; |     X X| $BBB2
    .byte $00 ; |        | $BBB3
    .byte $07 ; |     XXX| $BBB4
    .byte $00 ; |        | $BBB5
    .byte $00 ; |        | $BBB6
    .byte $00 ; |        | $BBB7
    .byte $05 ; |     X X| $BBB8
    .byte $00 ; |        | $BBB9
    .byte $07 ; |     XXX| $BBBA
    .byte $00 ; |        | $BBBB
    .byte $00 ; |        | $BBBC
    .byte $05 ; |     X X| $BBBD
    .byte $05 ; |     X X| $BBBE
    .byte $05 ; |     X X| $BBBF
    .byte $00 ; |        | $BBC0
    .byte $00 ; |        | $BBC1
    .byte $00 ; |        | $BBC2
    .byte $00 ; |        | $BBC3
    .byte $00 ; |        | $BBC4
    .byte $00 ; |        | $BBC5
    .byte $00 ; |        | $BBC6
    .byte $00 ; |        | $BBC7
    .byte $00 ; |        | $BBC8
    .byte $00 ; |        | $BBC9
    .byte $00 ; |        | $BBCA
    .byte $00 ; |        | $BBCB
    .byte $00 ; |        | $BBCC
    .byte $00 ; |        | $BBCD
    .byte $07 ; |     XXX| $BBCE
    .byte $07 ; |     XXX| $BBCF
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
    .byte $07 ; |     XXX| $BBDE
    .byte $07 ; |     XXX| $BBDF
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
    .byte $07 ; |     XXX| $BBEE
    .byte $07 ; |     XXX| $BBEF
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
    .byte $07 ; |     XXX| $BBFE
    .byte $07 ; |     XXX| $BBFF
LBC00:
    .byte $BB ; |X XXX XX| $BC00
    .byte $BD ; |X XXXX X| $BC01
    .byte $BD ; |X XXXX X| $BC02
    .byte $BD ; |X XXXX X| $BC03
    .byte $BD ; |X XXXX X| $BC04
    .byte $BF ; |X XXXXXX| $BC05
    .byte $BD ; |X XXXX X| $BC06
    .byte $B1 ; |X XX   X| $BC07
    .byte $BD ; |X XXXX X| $BC08
    .byte $BD ; |X XXXX X| $BC09
    .byte $BD ; |X XXXX X| $BC0A
    .byte $BD ; |X XXXX X| $BC0B
    .byte $BD ; |X XXXX X| $BC0C
    .byte $BD ; |X XXXX X| $BC0D
    .byte $BD ; |X XXXX X| $BC0E
    .byte $B8 ; |X XXX   | $BC0F
    .byte $BB ; |X XXX XX| $BC10
    .byte $BD ; |X XXXX X| $BC11
    .byte $BD ; |X XXXX X| $BC12
    .byte $BD ; |X XXXX X| $BC13
    .byte $BD ; |X XXXX X| $BC14
    .byte $BF ; |X XXXXXX| $BC15
    .byte $BD ; |X XXXX X| $BC16
    .byte $B1 ; |X XX   X| $BC17
    .byte $BD ; |X XXXX X| $BC18
    .byte $BD ; |X XXXX X| $BC19
    .byte $BD ; |X XXXX X| $BC1A
    .byte $BD ; |X XXXX X| $BC1B
    .byte $BD ; |X XXXX X| $BC1C
    .byte $BD ; |X XXXX X| $BC1D
    .byte $BD ; |X XXXX X| $BC1E
    .byte $B8 ; |X XXX   | $BC1F
    .byte $BB ; |X XXX XX| $BC20
    .byte $BD ; |X XXXX X| $BC21
    .byte $BD ; |X XXXX X| $BC22
    .byte $BD ; |X XXXX X| $BC23
    .byte $BD ; |X XXXX X| $BC24
    .byte $BF ; |X XXXXXX| $BC25
    .byte $BD ; |X XXXX X| $BC26
    .byte $B1 ; |X XX   X| $BC27
    .byte $BD ; |X XXXX X| $BC28
    .byte $BD ; |X XXXX X| $BC29
    .byte $BD ; |X XXXX X| $BC2A
    .byte $BD ; |X XXXX X| $BC2B
    .byte $BD ; |X XXXX X| $BC2C
    .byte $BD ; |X XXXX X| $BC2D
    .byte $BD ; |X XXXX X| $BC2E
    .byte $B8 ; |X XXX   | $BC2F
    .byte $BB ; |X XXX XX| $BC30
    .byte $BD ; |X XXXX X| $BC31
    .byte $BD ; |X XXXX X| $BC32
    .byte $BD ; |X XXXX X| $BC33
    .byte $BD ; |X XXXX X| $BC34
    .byte $BF ; |X XXXXXX| $BC35
    .byte $BD ; |X XXXX X| $BC36
    .byte $B1 ; |X XX   X| $BC37
    .byte $BD ; |X XXXX X| $BC38
    .byte $BD ; |X XXXX X| $BC39
    .byte $BD ; |X XXXX X| $BC3A
    .byte $BD ; |X XXXX X| $BC3B
    .byte $BD ; |X XXXX X| $BC3C
    .byte $BD ; |X XXXX X| $BC3D
    .byte $BD ; |X XXXX X| $BC3E
    .byte $B8 ; |X XXX   | $BC3F
    .byte $BE ; |X XXXXX | $BC40
    .byte $BE ; |X XXXXX | $BC41
    .byte $BE ; |X XXXXX | $BC42
    .byte $BE ; |X XXXXX | $BC43
    .byte $BE ; |X XXXXX | $BC44
    .byte $BE ; |X XXXXX | $BC45
    .byte $BE ; |X XXXXX | $BC46
    .byte $BE ; |X XXXXX | $BC47
    .byte $BE ; |X XXXXX | $BC48
    .byte $BE ; |X XXXXX | $BC49
    .byte $BE ; |X XXXXX | $BC4A
    .byte $BE ; |X XXXXX | $BC4B
    .byte $BE ; |X XXXXX | $BC4C
    .byte $BE ; |X XXXXX | $BC4D
    .byte $BE ; |X XXXXX | $BC4E
    .byte $BF ; |X XXXXXX| $BC4F
    .byte $BE ; |X XXXXX | $BC50
    .byte $BE ; |X XXXXX | $BC51
    .byte $BE ; |X XXXXX | $BC52
    .byte $BE ; |X XXXXX | $BC53
    .byte $BE ; |X XXXXX | $BC54
    .byte $BE ; |X XXXXX | $BC55
    .byte $BE ; |X XXXXX | $BC56
    .byte $BE ; |X XXXXX | $BC57
    .byte $BE ; |X XXXXX | $BC58
    .byte $BE ; |X XXXXX | $BC59
    .byte $BE ; |X XXXXX | $BC5A
    .byte $BE ; |X XXXXX | $BC5B
    .byte $BE ; |X XXXXX | $BC5C
    .byte $BE ; |X XXXXX | $BC5D
    .byte $BE ; |X XXXXX | $BC5E
    .byte $BF ; |X XXXXXX| $BC5F
    .byte $BE ; |X XXXXX | $BC60
    .byte $BE ; |X XXXXX | $BC61
    .byte $BE ; |X XXXXX | $BC62
    .byte $BE ; |X XXXXX | $BC63
    .byte $BE ; |X XXXXX | $BC64
    .byte $BE ; |X XXXXX | $BC65
    .byte $BE ; |X XXXXX | $BC66
    .byte $BE ; |X XXXXX | $BC67
    .byte $BE ; |X XXXXX | $BC68
    .byte $BE ; |X XXXXX | $BC69
    .byte $BE ; |X XXXXX | $BC6A
    .byte $BE ; |X XXXXX | $BC6B
    .byte $BE ; |X XXXXX | $BC6C
    .byte $BE ; |X XXXXX | $BC6D
    .byte $BE ; |X XXXXX | $BC6E
    .byte $BF ; |X XXXXXX| $BC6F
    .byte $BE ; |X XXXXX | $BC70
    .byte $BE ; |X XXXXX | $BC71
    .byte $BE ; |X XXXXX | $BC72
    .byte $BE ; |X XXXXX | $BC73
    .byte $BE ; |X XXXXX | $BC74
    .byte $BE ; |X XXXXX | $BC75
    .byte $BE ; |X XXXXX | $BC76
    .byte $BE ; |X XXXXX | $BC77
    .byte $BE ; |X XXXXX | $BC78
    .byte $BE ; |X XXXXX | $BC79
    .byte $BE ; |X XXXXX | $BC7A
    .byte $BE ; |X XXXXX | $BC7B
    .byte $BE ; |X XXXXX | $BC7C
    .byte $BE ; |X XXXXX | $BC7D
    .byte $BE ; |X XXXXX | $BC7E
    .byte $BF ; |X XXXXXX| $BC7F
    .byte $BD ; |X XXXX X| $BC80
    .byte $BF ; |X XXXXXX| $BC81
    .byte $BD ; |X XXXX X| $BC82
    .byte $BD ; |X XXXX X| $BC83
    .byte $BD ; |X XXXX X| $BC84
    .byte $BF ; |X XXXXXX| $BC85
    .byte $BD ; |X XXXX X| $BC86
    .byte $BF ; |X XXXXXX| $BC87
    .byte $BD ; |X XXXX X| $BC88
    .byte $BF ; |X XXXXXX| $BC89
    .byte $BD ; |X XXXX X| $BC8A
    .byte $BF ; |X XXXXXX| $BC8B
    .byte $BE ; |X XXXXX | $BC8C
    .byte $BE ; |X XXXXX | $BC8D
    .byte $BD ; |X XXXX X| $BC8E
    .byte $BD ; |X XXXX X| $BC8F
    .byte $BD ; |X XXXX X| $BC90
    .byte $BF ; |X XXXXXX| $BC91
    .byte $BD ; |X XXXX X| $BC92
    .byte $BD ; |X XXXX X| $BC93
    .byte $BD ; |X XXXX X| $BC94
    .byte $BF ; |X XXXXXX| $BC95
    .byte $BD ; |X XXXX X| $BC96
    .byte $BF ; |X XXXXXX| $BC97
    .byte $BD ; |X XXXX X| $BC98
    .byte $BF ; |X XXXXXX| $BC99
    .byte $BD ; |X XXXX X| $BC9A
    .byte $BF ; |X XXXXXX| $BC9B
    .byte $BE ; |X XXXXX | $BC9C
    .byte $BE ; |X XXXXX | $BC9D
    .byte $BD ; |X XXXX X| $BC9E
    .byte $BD ; |X XXXX X| $BC9F
    .byte $BD ; |X XXXX X| $BCA0
    .byte $BF ; |X XXXXXX| $BCA1
    .byte $BD ; |X XXXX X| $BCA2
    .byte $BD ; |X XXXX X| $BCA3
    .byte $BD ; |X XXXX X| $BCA4
    .byte $BF ; |X XXXXXX| $BCA5
    .byte $BD ; |X XXXX X| $BCA6
    .byte $BF ; |X XXXXXX| $BCA7
    .byte $BD ; |X XXXX X| $BCA8
    .byte $BF ; |X XXXXXX| $BCA9
    .byte $BD ; |X XXXX X| $BCAA
    .byte $BF ; |X XXXXXX| $BCAB
    .byte $BE ; |X XXXXX | $BCAC
    .byte $BE ; |X XXXXX | $BCAD
    .byte $BD ; |X XXXX X| $BCAE
    .byte $BD ; |X XXXX X| $BCAF
    .byte $BD ; |X XXXX X| $BCB0
    .byte $BF ; |X XXXXXX| $BCB1
    .byte $BD ; |X XXXX X| $BCB2
    .byte $BD ; |X XXXX X| $BCB3
    .byte $BD ; |X XXXX X| $BCB4
    .byte $BF ; |X XXXXXX| $BCB5
    .byte $BD ; |X XXXX X| $BCB6
    .byte $BF ; |X XXXXXX| $BCB7
    .byte $BD ; |X XXXX X| $BCB8
    .byte $BF ; |X XXXXXX| $BCB9
    .byte $BD ; |X XXXX X| $BCBA
    .byte $BF ; |X XXXXXX| $BCBB
    .byte $BE ; |X XXXXX | $BCBC
    .byte $BE ; |X XXXXX | $BCBD
    .byte $BD ; |X XXXX X| $BCBE
    .byte $BD ; |X XXXX X| $BCBF
    .byte $BF ; |X XXXXXX| $BCC0
    .byte $BF ; |X XXXXXX| $BCC1
    .byte $BF ; |X XXXXXX| $BCC2
    .byte $BF ; |X XXXXXX| $BCC3
    .byte $BF ; |X XXXXXX| $BCC4
    .byte $BF ; |X XXXXXX| $BCC5
    .byte $BF ; |X XXXXXX| $BCC6
    .byte $B1 ; |X XX   X| $BCC7
    .byte $B1 ; |X XX   X| $BCC8
    .byte $B1 ; |X XX   X| $BCC9
    .byte $B1 ; |X XX   X| $BCCA
    .byte $B1 ; |X XX   X| $BCCB
    .byte $B1 ; |X XX   X| $BCCC
    .byte $BB ; |X XXX XX| $BCCD
    .byte $BD ; |X XXXX X| $BCCE
    .byte $BD ; |X XXXX X| $BCCF
    .byte $BF ; |X XXXXXX| $BCD0
    .byte $BF ; |X XXXXXX| $BCD1
    .byte $BF ; |X XXXXXX| $BCD2
    .byte $BF ; |X XXXXXX| $BCD3
    .byte $BF ; |X XXXXXX| $BCD4
    .byte $BF ; |X XXXXXX| $BCD5
    .byte $BF ; |X XXXXXX| $BCD6
    .byte $B1 ; |X XX   X| $BCD7
    .byte $B1 ; |X XX   X| $BCD8
    .byte $B1 ; |X XX   X| $BCD9
    .byte $B1 ; |X XX   X| $BCDA
    .byte $B1 ; |X XX   X| $BCDB
    .byte $B1 ; |X XX   X| $BCDC
    .byte $BB ; |X XXX XX| $BCDD
    .byte $BD ; |X XXXX X| $BCDE
    .byte $BD ; |X XXXX X| $BCDF
    .byte $BF ; |X XXXXXX| $BCE0
    .byte $BF ; |X XXXXXX| $BCE1
    .byte $BF ; |X XXXXXX| $BCE2
    .byte $BF ; |X XXXXXX| $BCE3
    .byte $BF ; |X XXXXXX| $BCE4
    .byte $BF ; |X XXXXXX| $BCE5
    .byte $BF ; |X XXXXXX| $BCE6
    .byte $B1 ; |X XX   X| $BCE7
    .byte $B1 ; |X XX   X| $BCE8
    .byte $B1 ; |X XX   X| $BCE9
    .byte $B1 ; |X XX   X| $BCEA
    .byte $B1 ; |X XX   X| $BCEB
    .byte $B1 ; |X XX   X| $BCEC
    .byte $BB ; |X XXX XX| $BCED
    .byte $BD ; |X XXXX X| $BCEE
    .byte $BD ; |X XXXX X| $BCEF
    .byte $BF ; |X XXXXXX| $BCF0
    .byte $BF ; |X XXXXXX| $BCF1
    .byte $BF ; |X XXXXXX| $BCF2
    .byte $BF ; |X XXXXXX| $BCF3
    .byte $BF ; |X XXXXXX| $BCF4
    .byte $BF ; |X XXXXXX| $BCF5
    .byte $BF ; |X XXXXXX| $BCF6
    .byte $B1 ; |X XX   X| $BCF7
    .byte $B1 ; |X XX   X| $BCF8
    .byte $B1 ; |X XX   X| $BCF9
    .byte $B1 ; |X XX   X| $BCFA
    .byte $B1 ; |X XX   X| $BCFB
    .byte $B1 ; |X XX   X| $BCFC
    .byte $BB ; |X XXX XX| $BCFD
    .byte $BD ; |X XXXX X| $BCFE
    .byte $BD ; |X XXXX X| $BCFF
LBD00:
    .byte $20 ; |  X     | $BD00
    .byte $20 ; |  X     | $BD01
    .byte $00 ; |        | $BD02
    .byte $00 ; |        | $BD03
    .byte $20 ; |  X     | $BD04
    .byte $20 ; |  X     | $BD05
    .byte $1F ; |   XXXXX| $BD06
    .byte $1F ; |   XXXXX| $BD07
    .byte $00 ; |        | $BD08
    .byte $00 ; |        | $BD09
    .byte $1F ; |   XXXXX| $BD0A
    .byte $1F ; |   XXXXX| $BD0B
    .byte $20 ; |  X     | $BD0C
    .byte $20 ; |  X     | $BD0D
    .byte $00 ; |        | $BD0E
    .byte $00 ; |        | $BD0F
    .byte $20 ; |  X     | $BD10
    .byte $20 ; |  X     | $BD11
    .byte $00 ; |        | $BD12
    .byte $00 ; |        | $BD13
    .byte $20 ; |  X     | $BD14
    .byte $20 ; |  X     | $BD15
    .byte $00 ; |        | $BD16
    .byte $00 ; |        | $BD17
    .byte $00 ; |        | $BD18
    .byte $00 ; |        | $BD19
    .byte $7C ; | XXXXX  | $BD1A
    .byte $F7 ; |XXXX XXX| $BD1B
    .byte $FB ; |XXXXX XX| $BD1C
    .byte $7E ; | XXXXXX | $BD1D
    .byte $76 ; | XXX XX | $BD1E
    .byte $FA ; |XXXXX X | $BD1F
    .byte $1C ; |   XXX  | $BD20
    .byte $FC ; |XXXXXX  | $BD21
    .byte $FC ; |XXXXXX  | $BD22
    .byte $68 ; | XX X   | $BD23
    .byte $10 ; |   X    | $BD24
    .byte $00 ; |        | $BD25
    .byte $00 ; |        | $BD26
    .byte $00 ; |        | $BD27
    .byte $00 ; |        | $BD28
    .byte $3E ; |  XXXXX | $BD29
    .byte $EF ; |XXX XXXX| $BD2A
    .byte $BF ; |X XXXXXX| $BD2B
    .byte $7E ; | XXXXXX | $BD2C
    .byte $6E ; | XX XXX | $BD2D
    .byte $5F ; | X XXXXX| $BD2E
    .byte $38 ; |  XXX   | $BD2F
    .byte $3F ; |  XXXXXX| $BD30
    .byte $3F ; |  XXXXXX| $BD31
    .byte $16 ; |   X XX | $BD32
    .byte $08 ; |    X   | $BD33
    .byte $00 ; |        | $BD34
    .byte $00 ; |        | $BD35
    .byte $00 ; |        | $BD36
    .byte $00 ; |        | $BD37
    .byte $36 ; |  XX XX | $BD38
    .byte $24 ; |  X  X  | $BD39
    .byte $3C ; |  XXXX  | $BD3A
    .byte $7E ; | XXXXXX | $BD3B
    .byte $ED ; |XXX XX X| $BD3C
    .byte $ED ; |XXX XX X| $BD3D
    .byte $C9 ; |XX  X  X| $BD3E
    .byte $7E ; | XXXXXX | $BD3F
    .byte $3C ; |  XXXX  | $BD40
    .byte $00 ; |        | $BD41
    .byte $00 ; |        | $BD42
    .byte $00 ; |        | $BD43
    .byte $00 ; |        | $BD44
    .byte $00 ; |        | $BD45
    .byte $00 ; |        | $BD46
    .byte $E0 ; |XXX     | $BD47
    .byte $78 ; | XXXX   | $BD48
    .byte $1C ; |   XXX  | $BD49
    .byte $EC ; |XXX XX  | $BD4A
    .byte $73 ; | XXX  XX| $BD4B
    .byte $1F ; |   XXXXX| $BD4C
    .byte $2C ; |  X XX  | $BD4D
    .byte $70 ; | XXX    | $BD4E
    .byte $C0 ; |XX      | $BD4F
    .byte $00 ; |        | $BD50
    .byte $00 ; |        | $BD51
    .byte $00 ; |        | $BD52
    .byte $00 ; |        | $BD53
    .byte $00 ; |        | $BD54
    .byte $6C ; | XX XX  | $BD55
    .byte $24 ; |  X  X  | $BD56
    .byte $24 ; |  X  X  | $BD57
    .byte $3C ; |  XXXX  | $BD58
    .byte $7E ; | XXXXXX | $BD59
    .byte $B7 ; |X XX XXX| $BD5A
    .byte $B7 ; |X XX XXX| $BD5B
    .byte $93 ; |X  X  XX| $BD5C
    .byte $7E ; | XXXXXX | $BD5D
    .byte $3C ; |  XXXX  | $BD5E
    .byte $00 ; |        | $BD5F
    .byte $00 ; |        | $BD60
    .byte $00 ; |        | $BD61
    .byte $00 ; |        | $BD62
    .byte $6C ; | XX XX  | $BD63
    .byte $24 ; |  X  X  | $BD64
    .byte $3C ; |  XXXX  | $BD65
    .byte $7E ; | XXXXXX | $BD66
    .byte $B7 ; |X XX XXX| $BD67
    .byte $B7 ; |X XX XXX| $BD68
    .byte $93 ; |X  X  XX| $BD69
    .byte $7E ; | XXXXXX | $BD6A
    .byte $3C ; |  XXXX  | $BD6B
    .byte $00 ; |        | $BD6C
    .byte $00 ; |        | $BD6D
    .byte $00 ; |        | $BD6E
    .byte $00 ; |        | $BD6F
    .byte $00 ; |        | $BD70
    .byte $00 ; |        | $BD71
    .byte $10 ; |   X    | $BD72
    .byte $38 ; |  XXX   | $BD73
    .byte $7C ; | XXXXX  | $BD74
    .byte $7C ; | XXXXX  | $BD75
    .byte $7C ; | XXXXX  | $BD76
    .byte $38 ; |  XXX   | $BD77
    .byte $00 ; |        | $BD78
    .byte $00 ; |        | $BD79
    .byte $00 ; |        | $BD7A
    .byte $00 ; |        | $BD7B
    .byte $00 ; |        | $BD7C
    .byte $00 ; |        | $BD7D
    .byte $00 ; |        | $BD7E
    .byte $06 ; |     XX | $BD7F
    .byte $89 ; |X   X  X| $BD80
    .byte $50 ; | X X    | $BD81
    .byte $20 ; |  X     | $BD82
    .byte $00 ; |        | $BD83
    .byte $00 ; |        | $BD84
    .byte $00 ; |        | $BD85
    .byte $00 ; |        | $BD86
    .byte $00 ; |        | $BD87
    .byte $00 ; |        | $BD88
    .byte $00 ; |        | $BD89
    .byte $00 ; |        | $BD8A
    .byte $07 ; |     XXX| $BD8B
    .byte $1E ; |   XXXX | $BD8C
    .byte $38 ; |  XXX   | $BD8D
    .byte $37 ; |  XX XXX| $BD8E
    .byte $CE ; |XX  XXX | $BD8F
    .byte $F8 ; |XXXXX   | $BD90
    .byte $34 ; |  XX X  | $BD91
    .byte $0E ; |    XXX | $BD92
    .byte $03 ; |      XX| $BD93
    .byte $00 ; |        | $BD94
    .byte $00 ; |        | $BD95
    .byte $00 ; |        | $BD96
    .byte $00 ; |        | $BD97
    .byte $10 ; |   X    | $BD98
    .byte $08 ; |    X   | $BD99
    .byte $04 ; |     X  | $BD9A
    .byte $04 ; |     X  | $BD9B
    .byte $0C ; |    XX  | $BD9C
    .byte $30 ; |  XX    | $BD9D
    .byte $20 ; |  X     | $BD9E
    .byte $10 ; |   X    | $BD9F
    .byte $08 ; |    X   | $BDA0
    .byte $08 ; |    X   | $BDA1
    .byte $10 ; |   X    | $BDA2
    .byte $00 ; |        | $BDA3
    .byte $00 ; |        | $BDA4
    .byte $00 ; |        | $BDA5
    .byte $00 ; |        | $BDA6
    .byte $00 ; |        | $BDA7
    .byte $80 ; |X       | $BDA8
    .byte $60 ; | XX     | $BDA9
    .byte $38 ; |  XXX   | $BDAA
    .byte $1E ; |   XXXX | $BDAB
    .byte $0F ; |    XXXX| $BDAC
    .byte $07 ; |     XXX| $BDAD
    .byte $02 ; |      X | $BDAE
    .byte $02 ; |      X | $BDAF
    .byte $00 ; |        | $BDB0
    .byte $00 ; |        | $BDB1
    .byte $00 ; |        | $BDB2
    .byte $00 ; |        | $BDB3
    .byte $00 ; |        | $BDB4
    .byte $00 ; |        | $BDB5
    .byte $80 ; |X       | $BDB6
    .byte $E0 ; |XXX     | $BDB7
    .byte $50 ; | X X    | $BDB8
    .byte $38 ; |  XXX   | $BDB9
    .byte $EC ; |XXX XX  | $BDBA
    .byte $5C ; | X XXX  | $BDBB
    .byte $30 ; |  XX    | $BDBC
    .byte $C0 ; |XX      | $BDBD
    .byte $00 ; |        | $BDBE
    .byte $00 ; |        | $BDBF
    .byte $00 ; |        | $BDC0
    .byte $00 ; |        | $BDC1
    .byte $00 ; |        | $BDC2
    .byte $00 ; |        | $BDC3
    .byte $04 ; |     X  | $BDC4
    .byte $1C ; |   XXX  | $BDC5
    .byte $28 ; |  X X   | $BDC6
    .byte $70 ; | XXX    | $BDC7
    .byte $DC ; |XX XXX  | $BDC8
    .byte $E8 ; |XXX X   | $BDC9
    .byte $30 ; |  XX    | $BDCA
    .byte $0C ; |    XX  | $BDCB
    .byte $00 ; |        | $BDCC
    .byte $00 ; |        | $BDCD
    .byte $00 ; |        | $BDCE
    .byte $00 ; |        | $BDCF
    .byte $00 ; |        | $BDD0
    .byte $3C ; |  XXXX  | $BDD1
    .byte $18 ; |   XX   | $BDD2
    .byte $08 ; |    X   | $BDD3
    .byte $3F ; |  XXXXXX| $BDD4
    .byte $FF ; |XXXXXXXX| $BDD5
    .byte $DD ; |XX XXX X| $BDD6
    .byte $7A ; | XXXX X | $BDD7
    .byte $3E ; |  XXXXX | $BDD8
    .byte $1C ; |   XXX  | $BDD9
    .byte $00 ; |        | $BDDA
    .byte $00 ; |        | $BDDB
    .byte $00 ; |        | $BDDC
    .byte $00 ; |        | $BDDD
    .byte $00 ; |        | $BDDE
    .byte $36 ; |  XX XX | $BDDF
    .byte $24 ; |  X  X  | $BDE0
    .byte $24 ; |  X  X  | $BDE1
    .byte $3C ; |  XXXX  | $BDE2
    .byte $7E ; | XXXXXX | $BDE3
    .byte $ED ; |XXX XX X| $BDE4
    .byte $ED ; |XXX XX X| $BDE5
    .byte $C9 ; |XX  X  X| $BDE6
    .byte $7E ; | XXXXXX | $BDE7
    .byte $3C ; |  XXXX  | $BDE8
    .byte $00 ; |        | $BDE9
    .byte $00 ; |        | $BDEA
    .byte $00 ; |        | $BDEB
    .byte $00 ; |        | $BDEC
    .byte $10 ; |   X    | $BDED
    .byte $10 ; |   X    | $BDEE
    .byte $10 ; |   X    | $BDEF
    .byte $10 ; |   X    | $BDF0
    .byte $54 ; | X X X  | $BDF1
    .byte $7C ; | XXXXX  | $BDF2
    .byte $7C ; | XXXXX  | $BDF3
    .byte $FE ; |XXXXXXX | $BDF4
    .byte $FE ; |XXXXXXX | $BDF5
    .byte $BA ; |X XXX X | $BDF6
    .byte $10 ; |   X    | $BDF7
    .byte $00 ; |        | $BDF8
    .byte $00 ; |        | $BDF9
    .byte $00 ; |        | $BDFA
    .byte $00 ; |        | $BDFB
    .byte $00 ; |        | $BDFC
    .byte $20 ; |  X     | $BDFD
    .byte $20 ; |  X     | $BDFE
    .byte $74 ; | XXX X  | $BDFF
LBE00:
    .byte $09 ; |    X  X| $BE00
    .byte $09 ; |    X  X| $BE01
    .byte $09 ; |    X  X| $BE02
    .byte $09 ; |    X  X| $BE03
    .byte $09 ; |    X  X| $BE04
    .byte $09 ; |    X  X| $BE05
    .byte $09 ; |    X  X| $BE06
    .byte $09 ; |    X  X| $BE07
    .byte $1B ; |   XX XX| $BE08
    .byte $65 ; | XX  X X| $BE09
    .byte $61 ; | XX    X| $BE0A
    .byte $74 ; | XXX X  | $BE0B
    .byte $65 ; | XX  X X| $BE0C
    .byte $20 ; |  X     | $BE0D
    .byte $20 ; |  X     | $BE0E
    .byte $00 ; |        | $BE0F
    .byte $00 ; |        | $BE10
    .byte $00 ; |        | $BE11
    .byte $00 ; |        | $BE12
    .byte $00 ; |        | $BE13
    .byte $38 ; |  XXX   | $BE14
    .byte $30 ; |  XX    | $BE15
    .byte $78 ; | XXXX   | $BE16
    .byte $74 ; | XXX X  | $BE17
    .byte $42 ; | X    X | $BE18
    .byte $00 ; |        | $BE19
    .byte $3C ; |  XXXX  | $BE1A
    .byte $E0 ; |XXX     | $BE1B
    .byte $C0 ; |XX      | $BE1C
    .byte $FC ; |XXXXXX  | $BE1D
    .byte $70 ; | XXX    | $BE1E
    .byte $00 ; |        | $BE1F
    .byte $00 ; |        | $BE20
    .byte $00 ; |        | $BE21
    .byte $00 ; |        | $BE22
    .byte $30 ; |  XX    | $BE23
    .byte $26 ; |  X  XX | $BE24
    .byte $78 ; | XXXX   | $BE25
    .byte $74 ; | XXX X  | $BE26
    .byte $42 ; | X    X | $BE27
    .byte $00 ; |        | $BE28
    .byte $3C ; |  XXXX  | $BE29
    .byte $E0 ; |XXX     | $BE2A
    .byte $C0 ; |XX      | $BE2B
    .byte $FC ; |XXXXXX  | $BE2C
    .byte $70 ; | XXX    | $BE2D
    .byte $00 ; |        | $BE2E
    .byte $00 ; |        | $BE2F
    .byte $00 ; |        | $BE30
    .byte $00 ; |        | $BE31
    .byte $6C ; | XX XX  | $BE32
    .byte $48 ; | X  X   | $BE33
    .byte $78 ; | XXXX   | $BE34
    .byte $74 ; | XXX X  | $BE35
    .byte $46 ; | X   XX | $BE36
    .byte $00 ; |        | $BE37
    .byte $3C ; |  XXXX  | $BE38
    .byte $E0 ; |XXX     | $BE39
    .byte $C0 ; |XX      | $BE3A
    .byte $FC ; |XXXXXX  | $BE3B
    .byte $70 ; | XXX    | $BE3C
    .byte $00 ; |        | $BE3D
    .byte $00 ; |        | $BE3E
    .byte $00 ; |        | $BE3F
    .byte $00 ; |        | $BE40
    .byte $1C ; |   XXX  | $BE41
    .byte $0C ; |    XX  | $BE42
    .byte $1E ; |   XXXX | $BE43
    .byte $2E ; |  X XXX | $BE44
    .byte $42 ; | X    X | $BE45
    .byte $00 ; |        | $BE46
    .byte $3C ; |  XXXX  | $BE47
    .byte $07 ; |     XXX| $BE48
    .byte $03 ; |      XX| $BE49
    .byte $3F ; |  XXXXXX| $BE4A
    .byte $0E ; |    XXX | $BE4B
    .byte $00 ; |        | $BE4C
    .byte $00 ; |        | $BE4D
    .byte $00 ; |        | $BE4E
    .byte $00 ; |        | $BE4F
    .byte $0C ; |    XX  | $BE50
    .byte $64 ; | XX  X  | $BE51
    .byte $1E ; |   XXXX | $BE52
    .byte $2E ; |  X XXX | $BE53
    .byte $42 ; | X    X | $BE54
    .byte $00 ; |        | $BE55
    .byte $3C ; |  XXXX  | $BE56
    .byte $07 ; |     XXX| $BE57
    .byte $03 ; |      XX| $BE58
    .byte $3F ; |  XXXXXX| $BE59
    .byte $0E ; |    XXX | $BE5A
    .byte $00 ; |        | $BE5B
    .byte $00 ; |        | $BE5C
    .byte $00 ; |        | $BE5D
    .byte $00 ; |        | $BE5E
    .byte $36 ; |  XX XX | $BE5F
    .byte $12 ; |   X  X | $BE60
    .byte $1E ; |   XXXX | $BE61
    .byte $2E ; |  X XXX | $BE62
    .byte $62 ; | XX   X | $BE63
    .byte $00 ; |        | $BE64
    .byte $3C ; |  XXXX  | $BE65
    .byte $07 ; |     XXX| $BE66
    .byte $03 ; |      XX| $BE67
    .byte $3F ; |  XXXXXX| $BE68
    .byte $0E ; |    XXX | $BE69
    .byte $00 ; |        | $BE6A
    .byte $00 ; |        | $BE6B
    .byte $00 ; |        | $BE6C
    .byte $00 ; |        | $BE6D
    .byte $08 ; |    X   | $BE6E
    .byte $76 ; | XXX XX | $BE6F
    .byte $F4 ; |XXXX X  | $BE70
    .byte $D4 ; |XX X X  | $BE71
    .byte $94 ; |X  X X  | $BE72
    .byte $94 ; |X  X X  | $BE73
    .byte $94 ; |X  X X  | $BE74
    .byte $86 ; |X    XX | $BE75
    .byte $4A ; | X  X X | $BE76
    .byte $0A ; |    X X | $BE77
    .byte $10 ; |   X    | $BE78
    .byte $00 ; |        | $BE79
    .byte $00 ; |        | $BE7A
    .byte $00 ; |        | $BE7B
    .byte $00 ; |        | $BE7C
    .byte $10 ; |   X    | $BE7D
    .byte $0A ; |    X X | $BE7E
    .byte $4A ; | X  X X | $BE7F
    .byte $86 ; |X    XX | $BE80
    .byte $94 ; |X  X X  | $BE81
    .byte $94 ; |X  X X  | $BE82
    .byte $94 ; |X  X X  | $BE83
    .byte $D4 ; |XX X X  | $BE84
    .byte $F4 ; |XXXX X  | $BE85
    .byte $76 ; | XXX XX | $BE86
    .byte $08 ; |    X   | $BE87
    .byte $00 ; |        | $BE88
    .byte $00 ; |        | $BE89
    .byte $00 ; |        | $BE8A
    .byte $00 ; |        | $BE8B
    .byte $08 ; |    X   | $BE8C
    .byte $49 ; | X  X  X| $BE8D
    .byte $81 ; |X      X| $BE8E
    .byte $97 ; |X  X XXX| $BE8F
    .byte $94 ; |X  X X  | $BE90
    .byte $94 ; |X  X X  | $BE91
    .byte $D5 ; |XX X X X| $BE92
    .byte $F5 ; |XXXX X X| $BE93
    .byte $77 ; | XXX XXX| $BE94
    .byte $0C ; |    XX  | $BE95
    .byte $00 ; |        | $BE96
    .byte $00 ; |        | $BE97
    .byte $00 ; |        | $BE98
    .byte $00 ; |        | $BE99
    .byte $00 ; |        | $BE9A
    .byte $0C ; |    XX  | $BE9B
    .byte $77 ; | XXX XXX| $BE9C
    .byte $F5 ; |XXXX X X| $BE9D
    .byte $D5 ; |XX X X X| $BE9E
    .byte $94 ; |X  X X  | $BE9F
    .byte $94 ; |X  X X  | $BEA0
    .byte $97 ; |X  X XXX| $BEA1
    .byte $81 ; |X      X| $BEA2
    .byte $49 ; | X  X  X| $BEA3
    .byte $08 ; |    X   | $BEA4
    .byte $00 ; |        | $BEA5
    .byte $00 ; |        | $BEA6
    .byte $00 ; |        | $BEA7
    .byte $00 ; |        | $BEA8
    .byte $3C ; |  XXXX  | $BEA9
    .byte $24 ; |  X  X  | $BEAA
    .byte $42 ; | X    X | $BEAB
    .byte $BD ; |X XXXX X| $BEAC
    .byte $E7 ; |XXX  XXX| $BEAD
    .byte $81 ; |X      X| $BEAE
    .byte $24 ; |  X  X  | $BEAF
    .byte $5A ; | X XX X | $BEB0
    .byte $99 ; |X  XX  X| $BEB1
    .byte $66 ; | XX  XX | $BEB2
    .byte $00 ; |        | $BEB3
    .byte $00 ; |        | $BEB4
    .byte $00 ; |        | $BEB5
    .byte $00 ; |        | $BEB6
    .byte $00 ; |        | $BEB7
    .byte $00 ; |        | $BEB8
    .byte $66 ; | XX  XX | $BEB9
    .byte $FF ; |XXXXXXXX| $BEBA
    .byte $81 ; |X      X| $BEBB
    .byte $99 ; |X  XX  X| $BEBC
    .byte $DB ; |XX XX XX| $BEBD
    .byte $7E ; | XXXXXX | $BEBE
    .byte $00 ; |        | $BEBF
    .byte $00 ; |        | $BEC0
    .byte $00 ; |        | $BEC1
    .byte $00 ; |        | $BEC2
    .byte $00 ; |        | $BEC3
    .byte $00 ; |        | $BEC4
    .byte $00 ; |        | $BEC5
    .byte $66 ; | XX  XX | $BEC6
    .byte $FF ; |XXXXXXXX| $BEC7
    .byte $FF ; |XXXXXXXX| $BEC8
    .byte $99 ; |X  XX  X| $BEC9
    .byte $FF ; |XXXXXXXX| $BECA
    .byte $7E ; | XXXXXX | $BECB
    .byte $3C ; |  XXXX  | $BECC
    .byte $00 ; |        | $BECD
    .byte $00 ; |        | $BECE
    .byte $00 ; |        | $BECF
    .byte $00 ; |        | $BED0
    .byte $00 ; |        | $BED1
    .byte $00 ; |        | $BED2
    .byte $FB ; |XXXXX XX| $BED3
    .byte $3E ; |  XXXXX | $BED4
    .byte $CE ; |XX  XXX | $BED5
    .byte $BE ; |X XXXXX | $BED6
    .byte $EE ; |XXX XXX | $BED7
    .byte $DF ; |XX XXXXX| $BED8
    .byte $38 ; |  XXX   | $BED9
    .byte $38 ; |  XXX   | $BEDA
    .byte $3F ; |  XXXXXX| $BEDB
    .byte $16 ; |   X XX | $BEDC
    .byte $08 ; |    X   | $BEDD
    .byte $00 ; |        | $BEDE
    .byte $00 ; |        | $BEDF
    .byte $00 ; |        | $BEE0
    .byte $00 ; |        | $BEE1
    .byte $CF ; |XX  XXXX| $BEE2
    .byte $7C ; | XXXXX  | $BEE3
    .byte $73 ; | XXX  XX| $BEE4
    .byte $7D ; | XXXXX X| $BEE5
    .byte $77 ; | XXX XXX| $BEE6
    .byte $FB ; |XXXXX XX| $BEE7
    .byte $1C ; |   XXX  | $BEE8
    .byte $1C ; |   XXX  | $BEE9
    .byte $FC ; |XXXXXX  | $BEEA
    .byte $68 ; | XX X   | $BEEB
    .byte $10 ; |   X    | $BEEC
    .byte $00 ; |        | $BEED
    .byte $00 ; |        | $BEEE
    .byte $00 ; |        | $BEEF
    .byte $00 ; |        | $BEF0
    .byte $00 ; |        | $BEF1
    .byte $E7 ; |XXX  XXX| $BEF2
    .byte $3C ; |  XXXX  | $BEF3
    .byte $7E ; | XXXXXX | $BEF4
    .byte $FF ; |XXXXXXXX| $BEF5
    .byte $DB ; |XX XX XX| $BEF6
    .byte $DB ; |XX XX XX| $BEF7
    .byte $99 ; |X  XX  X| $BEF8
    .byte $FF ; |XXXXXXXX| $BEF9
    .byte $7E ; | XXXXXX | $BEFA
    .byte $3C ; |  XXXX  | $BEFB
    .byte $00 ; |        | $BEFC
    .byte $00 ; |        | $BEFD
    .byte $00 ; |        | $BEFE
    .byte $00 ; |        | $BEFF
    .byte $00 ; |        | $BF00
    .byte $00 ; |        | $BF01
    .byte $00 ; |        | $BF02
    .byte $00 ; |        | $BF03
    .byte $00 ; |        | $BF04
    .byte $00 ; |        | $BF05
    .byte $00 ; |        | $BF06
    .byte $00 ; |        | $BF07
    .byte $00 ; |        | $BF08
    .byte $00 ; |        | $BF09
    .byte $46 ; | X   XX | $BF0A
    .byte $75 ; | XXX X X| $BF0B
    .byte $6E ; | XX XXX | $BF0C
    .byte $63 ; | XX   XX| $BF0D
    .byte $74 ; | XXX X  | $BF0E
    .byte $69 ; | XX X  X| $BF0F
    .byte $00 ; |        | $BF10
    .byte $00 ; |        | $BF11
    .byte $00 ; |        | $BF12
    .byte $00 ; |        | $BF13
    .byte $7E ; | XXXXXX | $BF14
    .byte $FF ; |XXXXXXXX| $BF15
    .byte $FF ; |XXXXXXXX| $BF16
    .byte $FF ; |XXXXXXXX| $BF17
    .byte $FE ; |XXXXXXX | $BF18
    .byte $DF ; |XX XXXXX| $BF19
    .byte $BF ; |X XXXXXX| $BF1A
    .byte $B0 ; |X XX    | $BF1B
    .byte $3F ; |  XXXXXX| $BF1C
    .byte $36 ; |  XX XX | $BF1D
    .byte $1C ; |   XXX  | $BF1E
    .byte $00 ; |        | $BF1F
    .byte $00 ; |        | $BF20
    .byte $00 ; |        | $BF21
    .byte $00 ; |        | $BF22
    .byte $73 ; | XXX  XX| $BF23
    .byte $73 ; | XXX  XX| $BF24
    .byte $66 ; | XX  XX | $BF25
    .byte $66 ; | XX  XX | $BF26
    .byte $62 ; | XX   X | $BF27
    .byte $42 ; | X    X | $BF28
    .byte $40 ; | X      | $BF29
    .byte $00 ; |        | $BF2A
    .byte $00 ; |        | $BF2B
    .byte $00 ; |        | $BF2C
    .byte $00 ; |        | $BF2D
    .byte $00 ; |        | $BF2E
    .byte $00 ; |        | $BF2F
    .byte $00 ; |        | $BF30
    .byte $00 ; |        | $BF31
    .byte $B2 ; |X XX  X | $BF32
    .byte $45 ; | X   X X| $BF33
    .byte $44 ; | X   X  | $BF34
    .byte $04 ; |     X  | $BF35
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
    .byte $3C ; |  XXXX  | $BF42
    .byte $3C ; |  XXXX  | $BF43
    .byte $3C ; |  XXXX  | $BF44
    .byte $3C ; |  XXXX  | $BF45
    .byte $3C ; |  XXXX  | $BF46
    .byte $3C ; |  XXXX  | $BF47
    .byte $3C ; |  XXXX  | $BF48
    .byte $00 ; |        | $BF49
    .byte $00 ; |        | $BF4A
    .byte $00 ; |        | $BF4B
    .byte $00 ; |        | $BF4C
    .byte $00 ; |        | $BF4D
    .byte $00 ; |        | $BF4E
    .byte $00 ; |        | $BF4F
    .byte $81 ; |X      X| $BF50
    .byte $E7 ; |XXX  XXX| $BF51
    .byte $BD ; |X XXXX X| $BF52
    .byte $42 ; | X    X | $BF53
    .byte $24 ; |  X  X  | $BF54
    .byte $3C ; |  XXXX  | $BF55
    .byte $00 ; |        | $BF56
    .byte $24 ; |  X  X  | $BF57
    .byte $5A ; | X XX X | $BF58
    .byte $99 ; |X  XX  X| $BF59
    .byte $66 ; | XX  XX | $BF5A
    .byte $00 ; |        | $BF5B
    .byte $00 ; |        | $BF5C
    .byte $00 ; |        | $BF5D
    .byte $00 ; |        | $BF5E
    .byte $00 ; |        | $BF5F
    .byte $08 ; |    X   | $BF60
    .byte $1C ; |   XXX  | $BF61
    .byte $3E ; |  XXXXX | $BF62
    .byte $7E ; | XXXXXX | $BF63
    .byte $7E ; | XXXXXX | $BF64
    .byte $7C ; | XXXXX  | $BF65
    .byte $38 ; |  XXX   | $BF66
    .byte $10 ; |   X    | $BF67
    .byte $00 ; |        | $BF68
    .byte $00 ; |        | $BF69
    .byte $00 ; |        | $BF6A
    .byte $00 ; |        | $BF6B
    .byte $00 ; |        | $BF6C
    .byte $00 ; |        | $BF6D
    .byte $10 ; |   X    | $BF6E
    .byte $38 ; |  XXX   | $BF6F
    .byte $7C ; | XXXXX  | $BF70
    .byte $7C ; | XXXXX  | $BF71
    .byte $7C ; | XXXXX  | $BF72
    .byte $38 ; |  XXX   | $BF73
    .byte $00 ; |        | $BF74
    .byte $00 ; |        | $BF75
    .byte $00 ; |        | $BF76
    .byte $00 ; |        | $BF77
    .byte $00 ; |        | $BF78
    .byte $00 ; |        | $BF79
    .byte $00 ; |        | $BF7A
    .byte $0F ; |    XXXX| $BF7B
    .byte $1F ; |   XXXXX| $BF7C
    .byte $3C ; |  XXXX  | $BF7D
    .byte $70 ; | XXX    | $BF7E
    .byte $60 ; | XX     | $BF7F
    .byte $E0 ; |XXX     | $BF80
    .byte $C0 ; |XX      | $BF81
    .byte $C0 ; |XX      | $BF82
    .byte $80 ; |X       | $BF83
    .byte $00 ; |        | $BF84
    .byte $00 ; |        | $BF85
    .byte $00 ; |        | $BF86
    .byte $00 ; |        | $BF87
    .byte $00 ; |        | $BF88
    .byte $30 ; |  XX    | $BF89
    .byte $78 ; | XXXX   | $BF8A
    .byte $7C ; | XXXXX  | $BF8B
    .byte $7C ; | XXXXX  | $BF8C
    .byte $7C ; | XXXXX  | $BF8D
    .byte $3E ; |  XXXXX | $BF8E
    .byte $1E ; |   XXXX | $BF8F
    .byte $07 ; |     XXX| $BF90
    .byte $07 ; |     XXX| $BF91
    .byte $03 ; |      XX| $BF92
    .byte $02 ; |      X | $BF93
    .byte $00 ; |        | $BF94
    .byte $00 ; |        | $BF95
    .byte $00 ; |        | $BF96
    .byte $00 ; |        | $BF97
    .byte $08 ; |    X   | $BF98
    .byte $49 ; | X  X  X| $BF99
    .byte $2A ; |  X X X | $BF9A
    .byte $1C ; |   XXX  | $BF9B
    .byte $77 ; | XXX XXX| $BF9C
    .byte $1C ; |   XXX  | $BF9D
    .byte $2A ; |  X X X | $BF9E
    .byte $49 ; | X  X  X| $BF9F
    .byte $08 ; |    X   | $BFA0
    .byte $00 ; |        | $BFA1
    .byte $00 ; |        | $BFA2
    .byte $00 ; |        | $BFA3
    .byte $00 ; |        | $BFA4
    .byte $00 ; |        | $BFA5
    .byte $00 ; |        | $BFA6
    .byte $38 ; |  XXX   | $BFA7
    .byte $7C ; | XXXXX  | $BFA8
    .byte $5C ; | X XXX  | $BFA9
    .byte $D6 ; |XX X XX | $BFAA
    .byte $D6 ; |XX X XX | $BFAB
    .byte $F6 ; |XXXX XX | $BFAC
    .byte $FE ; |XXXXXXX | $BFAD
    .byte $44 ; | X   X  | $BFAE
    .byte $00 ; |        | $BFAF
    .byte $00 ; |        | $BFB0
    .byte $00 ; |        | $BFB1
    .byte $00 ; |        | $BFB2
    .byte $00 ; |        | $BFB3
    .byte $00 ; |        | $BFB4
    .byte $1C ; |   XXX  | $BFB5
    .byte $3E ; |  XXXXX | $BFB6
    .byte $7F ; | XXXXXXX| $BFB7
    .byte $7F ; | XXXXXXX| $BFB8
    .byte $7F ; | XXXXXXX| $BFB9
    .byte $7F ; | XXXXXXX| $BFBA
    .byte $3E ; |  XXXXX | $BFBB
    .byte $1C ; |   XXX  | $BFBC
    .byte $00 ; |        | $BFBD
    .byte $00 ; |        | $BFBE
    .byte $00 ; |        | $BFBF
    .byte $00 ; |        | $BFC0
    .byte $00 ; |        | $BFC1
    .byte $00 ; |        | $BFC2
    .byte $18 ; |   XX   | $BFC3
    .byte $3C ; |  XXXX  | $BFC4
    .byte $7E ; | XXXXXX | $BFC5
    .byte $7E ; | XXXXXX | $BFC6
    .byte $FF ; |XXXXXXXX| $BFC7
    .byte $81 ; |X      X| $BFC8
    .byte $00 ; |        | $BFC9
    .byte $00 ; |        | $BFCA
    .byte $00 ; |        | $BFCB
    .byte $00 ; |        | $BFCC
    .byte $00 ; |        | $BFCD
    .byte $00 ; |        | $BFCE
    .byte $00 ; |        | $BFCF
    .byte $10 ; |   X    | $BFD0
    .byte $10 ; |   X    | $BFD1
    .byte $08 ; |    X   | $BFD2
    .byte $08 ; |    X   | $BFD3
    .byte $08 ; |    X   | $BFD4
    .byte $10 ; |   X    | $BFD5
    .byte $20 ; |  X     | $BFD6
    .byte $20 ; |  X     | $BFD7
    .byte $20 ; |  X     | $BFD8
    .byte $10 ; |   X    | $BFD9
    .byte $08 ; |    X   | $BFDA
    .byte $08 ; |    X   | $BFDB
    .byte $08 ; |    X   | $BFDC
    .byte $10 ; |   X    | $BFDD
    .byte $20 ; |  X     | $BFDE
    .byte $20 ; |  X     | $BFDF
    .byte $20 ; |  X     | $BFE0
    .byte $10 ; |   X    | $BFE1
    .byte $10 ; |   X    | $BFE2
    .byte $00 ; |        | $BFE3
    .byte $00 ; |        | $BFE4
    .byte $00 ; |        | $BFE5
    .byte $00 ; |        | $BFE6

LBFE7:
    stx    PF1                   ; 3
    stx    HMP0                  ; 3
    inx                          ; 2
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    lda    BANK_0                ; 4   bankswitch, goto L9103

;bs from bank 0
    jmp    LB189                 ; 3


    .byte $00 ; |        | $BFF6
    .byte $00 ; |        | $BFF7
    .byte $00 ; |        | $BFF8
    .byte $00 ; |        | $BFF9
    .byte $3E ; |  XXXXX | $BFFA
    .byte $23 ; |  X   XX| $BFFB

        ORG $2FFC
       RORG $BFFC

    .word START_BANK_1
    .word 0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 2
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


        ORG $3000
       RORG $D000

    SC_RAM_SPACE 256

START_BANK_2:
    lda    BANK_3                ; 4   bankswitch, do clear loop

LD103 SUBROUTINE
    sty    ram_E5                ; 3
    sta    ram_E6                ; 3
    ldy    #7                    ; 2
LD109:
    lda    ram_E5                ; 3
    clc                          ; 2
    adc    LDF6E,Y               ; 4
    cmp    sc_01|READ,X          ; 4
    bne    LD128                 ; 2³
    lda    LDFB3,Y               ; 4
    and    ram_8F                ; 3
    beq    LD12A                 ; 2³
    lda    ram_E6                ; 3
    clc                          ; 2
    adc    LDF76,Y               ; 4
    cmp    sc_71|READ,X          ; 4
    bne    LD12A                 ; 2³
    beq    LD12D                 ; 3   always branch

LD128:
    dey                          ; 2
    dey                          ; 2
LD12A:
    dey                          ; 2
    bpl    LD109                 ; 2³
LD12D:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD12E SUBROUTINE
    sty    ram_E5                ; 3
    sta    ram_E6                ; 3
    ldy    #7                    ; 2
LD134:
    lda    ram_E5                ; 3
    clc                          ; 2
    adc    LDF6E,Y               ; 4
    cmp    sc_01|READ,X          ; 4
    bit    ram_F0                ; 3
    bpl    LD149                 ; 2³
    bcc    LD163                 ; 2³
    cmp    ram_CF                ; 3
    bcs    LD163                 ; 2³
    bcc    LD14F                 ; 3   always branch

LD149:
    bcs    LD163                 ; 2³
    cmp    ram_CF                ; 3
    bcc    LD163                 ; 2³
LD14F:
    lda    LDFB3,Y               ; 4
    and    ram_8F                ; 3
    beq    LD165                 ; 2³
    lda    ram_E6                ; 3
    clc                          ; 2
    adc    LDF76,Y               ; 4
    cmp    sc_71|READ,X          ; 4
    bne    LD165                 ; 2³
    beq    LD168                 ; 3   always branch

LD163:
    dey                          ; 2
    dey                          ; 2
LD165:
    dey                          ; 2
    bpl    LD134                 ; 2³
LD168:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD169 SUBROUTINE
    sty    ram_E5                ; 3
    sta    ram_E6                ; 3
    ldy    #7                    ; 2
LD16F:
    lda    ram_E5                ; 3
    clc                          ; 2
    adc    LDF6E,Y               ; 4
    cmp    sc_01|READ,X          ; 4
    bne    LD19E                 ; 2³
    lda    LDFB3,Y               ; 4
    and    ram_8F                ; 3
    beq    LD1A0                 ; 2³
    lda    ram_E6                ; 3
    clc                          ; 2
    adc    LDF76,Y               ; 4
    cmp    sc_71|READ,X          ; 4
    bit    ram_F0                ; 3
    bpl    LD196                 ; 2³
    bcc    LD1A0                 ; 2³
    cmp    ram_CF                ; 3
    bcs    LD1A0                 ; 2³
    bcc    LD1A4                 ; 3   always branch

LD196:
    bcs    LD1A0                 ; 2³
    cmp    ram_CF                ; 3
    bcc    LD1A0                 ; 2³
    bcs    LD1A4                 ; 3   always branch

LD19E:
    dey                          ; 2
    dey                          ; 2
LD1A0:
    dey                          ; 2
    bpl    LD16F                 ; 2³
    rts                          ; 6

LD1A4:
    lda    #0                    ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD1A7:
    lda    ram_F3                ; 3
    bmi    LD1C1                 ; 2³
    tay                          ; 2
    and    #$60                  ; 2
    beq    LD1C4                 ; 2³
    cmp    #$20                  ; 2
    beq    LD1BC                 ; 2³
    tya                          ; 2
    sec                          ; 2
    sbc    #$20                  ; 2
    sta    ram_F3                ; 3
    bne    LD1C4                 ; 2³
LD1BC:
    lda    #0                    ; 2
    sta    sc_79                 ; 4
LD1C1:
    jmp    LDB92                 ; 3

LD1C4:
    lda    #8                    ; 2
    and    numOfLives|READ       ; 4
    beq    LD1CE                 ; 2³
    jmp    LDB92                 ; 3

LD1CE:
    ldx    #0                    ; 2
    lda    ram_F1                ; 3
    bpl    LD1E3                 ; 2³
    asl                          ; 2
    bpl    LD1DD                 ; 2³
    asl                          ; 2
    bpl    LD1E0                 ; 2³
    jmp    LD3F7                 ; 3

LD1DD:
    jmp    LD303                 ; 3

LD1E0:
    jmp    LD51B                 ; 3

LD1E3:
    dex                          ; 2
    stx    ram_F0                ; 3
    lda    sc_0A|READ            ; 4
    tay                          ; 2
    clc                          ; 2
    adc    #$17                  ; 2
    sta    ram_D9                ; 3
    tya                          ; 2
    and    #$FC                  ; 2
    sta    ram_D5                ; 3
LD1F4:
    tay                          ; 2
    lda    sc_7A|READ            ; 4
    lsr                          ; 2
    jsr    LDABB                 ; 6
    bne    LD213                 ; 2³+1
    lda    ram_D5                ; 3
    clc                          ; 2
    adc    #4                    ; 2
    sta    ram_D5                ; 3
    cmp    ram_D9                ; 3
    bcs    LD20F                 ; 2³
    lda    ram_D5                ; 3
    bmi    LD234                 ; 2³
    bpl    LD1F4                 ; 3+1   always branch

LD20F:
    lda    ram_D9                ; 3
    sta    ram_D5                ; 3
LD213:
    lda    ram_D5                ; 3
    tax                          ; 2
    sec                          ; 2
    sbc    sc_0A|READ            ; 4
    cmp    #8                    ; 2
    bne    LD234                 ; 2³
    txa                          ; 2
    clc                          ; 2
    adc    #4                    ; 2
    bmi    LD234                 ; 2³
    tay                          ; 2
    lda    sc_7A|READ            ; 4
    lsr                          ; 2
    jsr    LDABB                 ; 6
    bne    LD234                 ; 2³
    txa                          ; 2
    clc                          ; 2
    adc    #8                    ; 2
    sta    ram_D5                ; 3
LD234:
    lda    ram_D5                ; 3
    sta    ram_CF                ; 3
    ldx    #9                    ; 2
    ldy    #$1A                  ; 2
    txa                          ; 2
    jsr    LD12E                 ; 6
    bmi    LD24A                 ; 2³
    lda    LDF6E,Y               ; 4
    clc                          ; 2
    adc    #$1A                  ; 2
    sta    ram_D5                ; 3
LD24A:
    ldy    #7                    ; 2
    sty    ram_D7                ; 3
LD24E:
    dey                          ; 2
    bmi    LD28A                 ; 2³
    lda.wy ram_F9,Y              ; 4
    bpl    LD24E                 ; 2³
    lda    sc_16|READ,Y          ; 4
    and    #$10                  ; 2
    bne    LD24E                 ; 2³
    lda    sc_71|READ,Y          ; 4
    sec                          ; 2
    sbc    sc_7A|READ            ; 4
    bpl    LD26B                 ; 2³
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #1                    ; 2
LD26B:
    cmp    #2                    ; 2
    bcs    LD24E                 ; 2³
    lda    sc_01|READ,Y          ; 4
    cmp    sc_0A|READ            ; 4
    bcc    LD24E                 ; 2³
    ldx    ram_D7                ; 3
    cpx    #7                    ; 2
    beq    LD285                 ; 2³
    lda    sc_01|READ,X          ; 4
    cmp    sc_01|READ,Y          ; 4
    bcc    LD24E                 ; 2³
LD285:
    sty    ram_D7                ; 3
    clc                          ; 2
    bcc    LD24E                 ; 3   always branch

LD28A:
    ldx    ram_D7                ; 3
    cpx    #7                    ; 2
    beq    LD29E                 ; 2³
    lda    sc_01|READ,X          ; 4
    cmp    ram_D5                ; 3
    bcs    LD29E                 ; 2³
    sta    ram_D5                ; 3
    jsr    LD622                 ; 6
    bmi    LD2A1                 ; 3   always branch

LD29E:
    jsr    LD2E6                 ; 6
LD2A1:
    ldx    #0                    ; 2
    stx    sc_79                 ; 4
    lda    ram_D5                ; 3
    sec                          ; 2
    sbc    sc_0A|READ            ; 4
    sec                          ; 2
    sbc    #7                    ; 2
    sta    ram_D6                ; 3
    bmi    LD2E3                 ; 2³
    beq    LD2E3                 ; 2³
LD2B5:
    cmp    LDF3C,X               ; 4
    beq    LD2C3                 ; 2³
    bcc    LD2C3                 ; 2³
    cpx    #1                    ; 2
    beq    LD2C3                 ; 2³
    inx                          ; 2
    bpl    LD2B5                 ; 2³
LD2C3:
    lda    LDF3A,X               ; 4
    sta    sc_13                 ; 4
    lda    sc_7A|READ            ; 4
    sta    sc_79                 ; 4
    lda    LDF3C,X               ; 4
    sec                          ; 2
    sbc    ram_D6                ; 3
    sta    ram_D6                ; 3
    lda    sc_0A|READ            ; 4
    clc                          ; 2
    adc    #7                    ; 2
    sec                          ; 2
    sbc    ram_D6                ; 3
    sta    sc_09                 ; 4
LD2E3:
    jmp    LDB92                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD2E6 SUBROUTINE
    ldy    #9                    ; 2
    jsr    LDAEF                 ; 6
    lda    ram_F3                ; 3
    tax                          ; 2
    and    #$60                  ; 2
    beq    LD2FD                 ; 2³
    cmp    #$20                  ; 2
    bne    LD302                 ; 2³+1
    lda    #0                    ; 2
    sta    sc_79                 ; 4
    beq    LD302                 ; 3+1   always branch

LD2FD:
    txa                          ; 2
    ora    #$60                  ; 2
    sta    ram_F3                ; 3
LD302:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD303:
    stx    ram_F0                ; 3
    lda    sc_0A|READ            ; 4
    tay                          ; 2
    sec                          ; 2
    sbc    #$10                  ; 2
    bpl    LD310                 ; 2³
    lda    #0                    ; 2
LD310:
    sta    ram_D9                ; 3
    tya                          ; 2
    and    #$FC                  ; 2
    sta    ram_D5                ; 3
LD317:
    tay                          ; 2
    lda    sc_7A|READ            ; 4
    lsr                          ; 2
    jsr    LDABB                 ; 6
    bne    LD334                 ; 2³
    lda    ram_D5                ; 3
    cmp    ram_D9                ; 3
    bcc    LD330                 ; 2³
    sec                          ; 2
    sbc    #4                    ; 2
    bmi    LD354                 ; 2³
    sta    ram_D5                ; 3
    bpl    LD317                 ; 3   always branch

LD330:
    lda    ram_D9                ; 3
    bpl    LD339                 ; 2³
LD334:
    lda    ram_D5                ; 3
    clc                          ; 2
    adc    #4                    ; 2
LD339:
    sta    ram_D5                ; 3
    tax                          ; 2
    cmp    sc_0A|READ            ; 4
    bne    LD354                 ; 2³
    sec                          ; 2
    sbc    #8                    ; 2
    tay                          ; 2
    lda    sc_7A|READ            ; 4
    lsr                          ; 2
    jsr    LDABB                 ; 6
    bne    LD354                 ; 2³
    txa                          ; 2
    sec                          ; 2
    sbc    #8                    ; 2
    sta    ram_D5                ; 3
LD354:
    lda    ram_D5                ; 3
    sta    ram_CF                ; 3
    ldx    #9                    ; 2
    ldy    #$1D                  ; 2
    txa                          ; 2
    jsr    LD12E                 ; 6
    bmi    LD36A                 ; 2³
    lda    LDF6E,Y               ; 4
    clc                          ; 2
    adc    #$1E                  ; 2
    sta    ram_D5                ; 3
LD36A:
    ldy    #7                    ; 2
    sty    ram_D7                ; 3
LD36E:
    dey                          ; 2
    bmi    LD3AA                 ; 2³
    lda.wy ram_F9,Y              ; 4
    bpl    LD36E                 ; 2³
    lda    sc_16|READ,Y          ; 4
    and    #$10                  ; 2
    bne    LD36E                 ; 2³
    lda    sc_71|READ,Y          ; 4
    sec                          ; 2
    sbc    sc_7A|READ            ; 4
    bpl    LD38B                 ; 2³
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #1                    ; 2
LD38B:
    cmp    #2                    ; 2
    bcs    LD36E                 ; 2³
    lda    sc_01|READ,Y          ; 4
    cmp    sc_0A|READ            ; 4
    bcs    LD36E                 ; 2³
    ldx    ram_D7                ; 3
    cpx    #7                    ; 2
    beq    LD3A5                 ; 2³
    lda    sc_01|READ,X          ; 4
    cmp    sc_01|READ,Y          ; 4
    bcs    LD36E                 ; 2³
LD3A5:
    sty    ram_D7                ; 3
    clc                          ; 2
    bcc    LD36E                 ; 3   always branch

LD3AA:
    ldx    ram_D7                ; 3
    cpx    #7                    ; 2
    beq    LD3C1                 ; 2³
    lda    sc_01|READ,X          ; 4
    clc                          ; 2
    adc    #8                    ; 2
    cmp    ram_D5                ; 3
    bcc    LD3C1                 ; 2³
    sta    ram_D5                ; 3
    jsr    LD622                 ; 6
    bmi    LD3C4                 ; 3   always branch

LD3C1:
    jsr    LD2E6                 ; 6
LD3C4:
    ldx    #0                    ; 2
    stx    sc_79                 ; 4
    lda    sc_0A|READ            ; 4
    sec                          ; 2
    sbc    ram_D5                ; 3
    sta    ram_D6                ; 3
    bmi    LD3F4                 ; 2³
    beq    LD3F4                 ; 2³
LD3D5:
    cmp    LDF3C,X               ; 4
    beq    LD3E3                 ; 2³
    bcc    LD3E3                 ; 2³
    cpx    #1                    ; 2
    beq    LD3E3                 ; 2³
    inx                          ; 2
    bpl    LD3D5                 ; 2³
LD3E3:
    lda    LDF3A,X               ; 4
    sta    sc_13                 ; 4
    lda    sc_7A|READ            ; 4
    sta    sc_79                 ; 4
    lda    ram_D5                ; 3
    sta    sc_09                 ; 4
LD3F4:
    jmp    LDB92                 ; 3

LD3F7:
    dex                          ; 2
    stx    ram_F0                ; 3
    ldx    #9                    ; 2
    ldy    #$18                  ; 2
    lda    #5                    ; 2
    jsr    LD103                 ; 6
    bpl    LD3F4                 ; 2³+1
    lda    sc_7A|READ            ; 4
    sta    ram_D5                ; 3
    clc                          ; 2
    adc    #5                    ; 2
    sta    ram_D9                ; 3
LD40F:
    lda    ram_D5                ; 3
    clc                          ; 2
    adc    #3                    ; 2
    cmp    #$2C                  ; 2
    bcs    LD43C                 ; 2³
    tay                          ; 2
    and    #$03                  ; 2
    cmp    #2                    ; 2
    bcs    LD42F                 ; 2³
    tya                          ; 2
    and    #$03                  ; 2
    bne    LD425                 ; 2³
    dey                          ; 2
LD425:
    tya                          ; 2
    lsr                          ; 2
    ldy    sc_0A|READ            ; 4
    jsr    LDABB                 ; 6
    bne    LD43C                 ; 2³
LD42F:
    ldy    ram_D5                ; 3
    iny                          ; 2
    sty    ram_D5                ; 3
    cpy    ram_D9                ; 3
    bcc    LD40F                 ; 2³
    lda    ram_D9                ; 3
    sta    ram_D5                ; 3
LD43C:
    lda    ram_D5                ; 3
    clc                          ; 2
    adc    #3                    ; 2
    sta    ram_D5                ; 3
    tay                          ; 2
    and    #$03                  ; 2
    bne    LD468                 ; 2³
    tya                          ; 2
    sec                          ; 2
    sbc    sc_7A|READ            ; 4
    cmp    #4                    ; 2
    bcs    LD468                 ; 2³
    tya                          ; 2
    cmp    #$2C                  ; 2
    bcs    LD47F                 ; 2³
    iny                          ; 2
    tya                          ; 2
    lsr                          ; 2
    ldy    sc_0A|READ            ; 4
    jsr    LDABB                 ; 6
    bne    LD468                 ; 2³
    lda    ram_D5                ; 3
    clc                          ; 2
    adc    #2                    ; 2
    sta    ram_D5                ; 3
LD468:
    lda    ram_D5                ; 3
    sta    ram_CF                ; 3
    ldx    #9                    ; 2
    ldy    #$18                  ; 2
    lda    #9                    ; 2
    jsr    LD169                 ; 6
    bmi    LD47F                 ; 2³
    lda    LDF76,Y               ; 4
    clc                          ; 2
    adc    #$0A                  ; 2
    sta    ram_D5                ; 3
LD47F:
    ldy    #7                    ; 2
    sty    ram_D7                ; 3
LD483:
    dey                          ; 2
    bmi    LD4BF                 ; 2³
    lda.wy ram_F9,Y              ; 4
    bpl    LD483                 ; 2³
    lda    sc_16|READ,Y          ; 4
    and    #$10                  ; 2
    bne    LD483                 ; 2³
    lda    sc_01|READ,Y          ; 4
    sec                          ; 2
    sbc    sc_0A|READ            ; 4
    bpl    LD4A0                 ; 2³
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #1                    ; 2
LD4A0:
    cmp    #6                    ; 2
    bcs    LD483                 ; 2³
    lda    sc_71|READ,Y          ; 4
    cmp    sc_7A|READ            ; 4
    bcc    LD483                 ; 2³
    ldx    ram_D7                ; 3
    cpx    #7                    ; 2
    beq    LD4BA                 ; 2³
    lda    sc_71|READ,X          ; 4
    cmp    sc_71|READ,Y          ; 4
    bcc    LD483                 ; 2³
LD4BA:
    sty    ram_D7                ; 3
    clc                          ; 2
    bcc    LD483                 ; 3   always branch

LD4BF:
    ldx    ram_D7                ; 3
    cpx    #7                    ; 2
    beq    LD4D3                 ; 2³
    lda    sc_71|READ,X          ; 4
    cmp    ram_D5                ; 3
    bcs    LD4D3                 ; 2³
    sta    ram_D5                ; 3
    jsr    LD622                 ; 6
    bmi    LD4D6                 ; 3   always branch

LD4D3:
    jsr    LD2E6                 ; 6
LD4D6:
    ldx    #0                    ; 2
    stx    sc_79                 ; 4
    lda    ram_D5                ; 3
    sec                          ; 2
    sbc    sc_7A|READ            ; 4
    sec                          ; 2
    sbc    #3                    ; 2
    sta    ram_D6                ; 3
    bmi    LD518                 ; 2³+1
    beq    LD518                 ; 2³+1
LD4EA:
    cmp    LDF40,X               ; 4
    beq    LD4F8                 ; 2³
    bcc    LD4F8                 ; 2³
    cpx    #1                    ; 2
    beq    LD4F8                 ; 2³
    inx                          ; 2
    bpl    LD4EA                 ; 2³
LD4F8:
    lda    LDF3E,X               ; 4
    sta    sc_13                 ; 4
    lda    LDF40,X               ; 4
    sec                          ; 2
    sbc    ram_D6                ; 3
    sta    ram_D6                ; 3
    lda    sc_7A|READ            ; 4
    clc                          ; 2
    adc    #3                    ; 2
    sec                          ; 2
    sbc    ram_D6                ; 3
    sta    sc_79                 ; 4
    lda    sc_0A|READ            ; 4
    sta    sc_09                 ; 4
LD518:
    jmp    LDB92                 ; 3

LD51B:
    stx    ram_F0                ; 3
    lda    sc_7A|READ            ; 4
    sta    ram_D5                ; 3
    sec                          ; 2
    sbc    #5                    ; 2
    sta    ram_D9                ; 3
LD527:
    ldy    ram_D5                ; 3
    cpy    #1                    ; 2
    beq    LD556                 ; 2³
    dey                          ; 2
    tya                          ; 2
    and    #$03                  ; 2
    cmp    #1                    ; 2
    beq    LD549                 ; 2³
    cmp    #2                    ; 2
    beq    LD549                 ; 2³
    cmp    #3                    ; 2
    bne    LD53E                 ; 2³
    dey                          ; 2
LD53E:
    dey                          ; 2
    tya                          ; 2
    lsr                          ; 2
    ldy    sc_0A|READ            ; 4
    jsr    LDABB                 ; 6
    bne    LD556                 ; 2³
LD549:
    ldy    ram_D5                ; 3
    dey                          ; 2
    sty    ram_D5                ; 3
    cpy    ram_D9                ; 3
    bcs    LD527                 ; 2³
    lda    ram_D9                ; 3
    sta    ram_D5                ; 3
LD556:
    lda    ram_D5                ; 3
    tay                          ; 2
    cmp    #1                    ; 2
    bcc    LD57C                 ; 2³
    and    #$03                  ; 2
    cmp    #1                    ; 2
    bne    LD57C                 ; 2³
    tya                          ; 2
    cmp    sc_7A|READ            ; 4
    bne    LD57C                 ; 2³
    sec                          ; 2
    sbc    #4                    ; 2
    lsr                          ; 2
    ldy    sc_0A|READ            ; 4
    jsr    LDABB                 ; 6
    bne    LD57C                 ; 2³
    lda    ram_D5                ; 3
    sec                          ; 2
    sbc    #2                    ; 2
    sta    ram_D5                ; 3
LD57C:
    lda    ram_D5                ; 3
    sta    ram_CF                ; 3
    ldx    #9                    ; 2
    ldy    #$18                  ; 2
    lda    #$0A                  ; 2
    jsr    LD169                 ; 6
    bmi    LD593                 ; 2³
    lda    LDF76,Y               ; 4
    clc                          ; 2
    adc    #$0B                  ; 2
    sta    ram_D5                ; 3
LD593:
    ldy    #7                    ; 2
    sty    ram_D7                ; 3
LD597:
    dey                          ; 2
    bmi    LD5D5                 ; 2³
    lda.wy ram_F9,Y              ; 4
    bpl    LD597                 ; 2³
    lda    sc_16|READ,Y          ; 4
    and    #$10                  ; 2
    bne    LD597                 ; 2³
    lda    sc_01|READ,Y          ; 4
    sec                          ; 2
    sbc    sc_0A|READ            ; 4
    bpl    LD5B4                 ; 2³
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #1                    ; 2
LD5B4:
    cmp    #6                    ; 2
    bcs    LD597                 ; 2³
    lda    sc_71|READ,Y          ; 4
    cmp    sc_7A|READ            ; 4
    beq    LD5C2                 ; 2³
    bcs    LD597                 ; 2³
LD5C2:
    ldx    ram_D7                ; 3
    cpx    #7                    ; 2
    beq    LD5D0                 ; 2³
    lda    sc_71|READ,X          ; 4
    cmp    sc_71|READ,Y          ; 4
    bcs    LD597                 ; 2³
LD5D0:
    sty    ram_D7                ; 3
    clc                          ; 2
    bcc    LD597                 ; 3   always branch

LD5D5:
    ldx    ram_D7                ; 3
    cpx    #7                    ; 2
    beq    LD5EC                 ; 2³
    lda    sc_71|READ,X          ; 4
    clc                          ; 2
    adc    #2                    ; 2
    cmp    ram_D5                ; 3
    bcc    LD5EC                 ; 2³
    sta    ram_D5                ; 3
    jsr    LD622                 ; 6
    bmi    LD5EF                 ; 3   always branch

LD5EC:
    jsr    LD2E6                 ; 6
LD5EF:
    ldx    #0                    ; 2
    stx    sc_79                 ; 4
    lda    sc_7A|READ            ; 4
    sec                          ; 2
    sbc    ram_D5                ; 3
    sta    ram_D6                ; 3
    bmi    LD61F                 ; 2³+1
    beq    LD61F                 ; 2³
LD600:
    cmp    LDF40,X               ; 4
    beq    LD60E                 ; 2³
    bcc    LD60E                 ; 2³
    cpx    #1                    ; 2
    beq    LD60E                 ; 2³
    inx                          ; 2
    bpl    LD600                 ; 2³
LD60E:
    lda    LDF3E,X               ; 4
    sta    sc_13                 ; 4
    lda    ram_D5                ; 3
    sta    sc_79                 ; 4
    lda    sc_0A|READ            ; 4
    sta    sc_09                 ; 4
LD61F:
    jmp    LDB92                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD622 SUBROUTINE
    lda    sc_16|READ,X          ; 4
    tay                          ; 2
    and    #$08                  ; 2
    bne    LD655                 ; 2³
    lda    ram_F7                ; 3
    bpl    LD641                 ; 2³
    and    #$07                  ; 2
    cmp    ram_D7                ; 3
    bne    LD641                 ; 2³
    lda    ram_F7                ; 3
    and    #$7F                  ; 2
    sta    ram_F7                ; 3
    lda    #0                    ; 2
    sta    sc_78                 ; 4
    beq    LD655                 ; 3   always branch

LD641:
    lda    ram_F9,X              ; 4
    and    #$CF                  ; 2
    ora    #$40                  ; 2
    sta    ram_F9,X              ; 4
    lda    ram_F5                ; 3
    and    #$03                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    ram_F9,X              ; 4
    sta    ram_F9,X              ; 4
LD655:
    tya                          ; 2
    ora    #$09                  ; 2
    sta    sc_16,X               ; 5
    txa                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_DD                ; 3
    lda    ram_F3                ; 3
    and    #$E3                  ; 2
    ora    ram_DD                ; 3
    ora    #$E0                  ; 2
    sta    ram_F3                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD66B:
    lda    #$10                  ; 2
    and    numOfLives|READ       ; 4
    bne    LD6D2                 ; 2³
    lda    #4                    ; 2
    sta    ram_DA                ; 3
    lda    ram_F5                ; 3
    tay                          ; 2
    and    #$FC                  ; 2
    sta    ram_F5                ; 3
    tya                          ; 2
    clc                          ; 2
    adc    #1                    ; 2
    and    #$03                  ; 2
    tay                          ; 2
    ora    ram_F5                ; 3
    sta    ram_F5                ; 3
    tya                          ; 2
    asl                          ; 2
    sta    ram_CA                ; 3
    ldx    #7                    ; 2
LD68E:
    dex                          ; 2
    bmi    LD6D2                 ; 2³
    stx    ram_D7                ; 3
    ldy    ram_CA                ; 3
    cpy    ram_D7                ; 3
    beq    LD69E                 ; 2³
    iny                          ; 2
    cpy    ram_D7                ; 3
    bne    LD6A5                 ; 2³
LD69E:
    jsr    LD6D5                 ; 6
    ldx    ram_D7                ; 3
    bpl    LD68E                 ; 2³
LD6A5:
    lda    ram_F9,X              ; 4
    tay                          ; 2
    and    #$C0                  ; 2
    cmp    #$80                  ; 2
    bne    LD68E                 ; 2³
    lda    #$20                  ; 2
    and    sc_16|READ,X          ; 4
    bne    LD68E                 ; 2³
    tya                          ; 2
    and    #$03                  ; 2
    lsr                          ; 2
    bcc    LD68E                 ; 2³
    lsr                          ; 2
    bcs    LD6C8                 ; 2³
    ldy    sc_01|READ,X          ; 4
    iny                          ; 2
    tya                          ; 2
    sta    sc_01,X               ; 5
    bpl    LD68E                 ; 2³
LD6C8:
    ldy    sc_01|READ,X          ; 4
    dey                          ; 2
    tya                          ; 2
    sta    sc_01,X               ; 5
    bpl    LD68E                 ; 2³
LD6D2:
    jmp    LDB92                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;very long subroutine, many jumps away
;from it...

LD6D5 SUBROUTINE
    lda    ram_F9,X              ; 4
    tay                          ; 2
    and    #$C0                  ; 2
    cmp    #$80                  ; 2
    beq    LD6DF                 ; 2³
    rts                          ; 6

LD6DF:
    lda    #0                    ; 2
    sta    ram_D9                ; 3
    tya                          ; 2
    and    #$0D                  ; 2
    beq    LD6F8                 ; 2³
    lda    sc_7B|READ            ; 4
    and    #$08                  ; 2
    beq    LD6F8                 ; 2³
    lda    framecounter          ; 3
    cmp    #$18                  ; 2
    bcs    LD6F8                 ; 2³
    jsr    LD872                 ; 6
LD6F8:
    tya                          ; 2
    and    #$03                  ; 2
    tay                          ; 2
    iny                          ; 2
    sty    ram_D8                ; 3
    lda    sc_01|READ,X          ; 4
    sta    ram_DB                ; 3
    lda    sc_71|READ,X          ; 4
    sta    ram_DC                ; 3
    lda    sc_0A|READ            ; 4
    sta    ram_E9                ; 3
    lda    sc_7A|READ            ; 4
    sta    ram_EA                ; 3
    lda    #$30                  ; 2
    and    sc_7B|READ            ; 4
    cmp    #$30                  ; 2
    bne    LD724                 ; 2³
    lda    #$44                  ; 2
    sta    ram_E9                ; 3
    lda    #$29                  ; 2
    sta    ram_EA                ; 3
LD724:
    lda    ram_F4                ; 3
    and    #$07                  ; 2
    cmp    #1                    ; 2
    bne    LD746                 ; 2³
    lda    ram_DB                ; 3
    bne    LD73E                 ; 2³
    lda    ram_DC                ; 3
    cmp    #$29                  ; 2
    bne    LD73E                 ; 2³
    lda    #0                    ; 2
    sta    sc_71,X               ; 5
    jmp    LDB2A                 ; 3

LD73E:
    lda    #0                    ; 2
    sta    ram_E9                ; 3
    lda    #$29                  ; 2
    sta    ram_EA                ; 3
LD746:
    lda    ram_DB                ; 3
    cmp    #$3C                  ; 2
    bcc    LD74E                 ; 2³
    sbc    #$3C                  ; 2
LD74E:
    cmp    #$30                  ; 2
    bcc    LD754                 ; 2³
    sbc    #$30                  ; 2
LD754:
    tay                          ; 2
    lda    LDF83,Y               ; 4
    sta    ram_D6                ; 3
    ldy    #1                    ; 2
    lda    ram_EA                ; 3
    sec                          ; 2
    sbc    ram_DC                ; 3
    bpl    LD765                 ; 2³
    ldy    #3                    ; 2
LD765:
    sty    ram_CD                ; 3
    sta    ram_CB                ; 3
    ldy    #2                    ; 2
    lda    ram_E9                ; 3
    sec                          ; 2
    sbc    ram_DB                ; 3
    bpl    LD774                 ; 2³
    ldy    #4                    ; 2
LD774:
    sty    ram_CE                ; 3
    sta    ram_CC                ; 3
    lda    sc_16|READ,X          ; 4
    and    #$20                  ; 2
    beq    LD782                 ; 2³
    jmp    LD8D4                 ; 3

LD782:
    lda    ram_F8                ; 3
    and    #$7F                  ; 2
    cmp    #$48                  ; 2
    bcc    LD7B6                 ; 2³
    lda    ram_DC                ; 3
    cmp    sc_78|READ            ; 4
    bcs    LD7B6                 ; 2³
    lda    ram_DB                ; 3
    cmp    sc_08|READ            ; 4
    bne    LD7B6                 ; 2³
    lda    ram_D8                ; 3
    lsr                          ; 2
    bcc    LD7B3                 ; 2³
    ldy    ram_CE                ; 3
    jsr    LD8B9                 ; 6
    bmi    LD813                 ; 2³+1
    jsr    LD9C9                 ; 6
    bmi    LD813                 ; 2³+1
    ldy    ram_CE                ; 3
    ldx    LDF80,Y               ; 4
    jsr    LD8BC                 ; 6
    bmi    LD813                 ; 2³+1
LD7B3:
    jmp    LD886                 ; 3

LD7B6:
    lda    ram_CC                ; 3
    bne    LD7BE                 ; 2³
    ldy    ram_CD                ; 3
    bpl    LD7C4                 ; 2³
LD7BE:
    lda    ram_CB                ; 3
    bne    LD7D4                 ; 2³
    ldy    ram_CE                ; 3
LD7C4:
    ldx    ram_D8                ; 3
    lda    LDF7E,X               ; 4
    cmp    LDF80,Y               ; 4
    beq    LD7D4                 ; 2³
    jsr    LD8B9                 ; 6
    bpl    LD7D4                 ; 2³
    rts                          ; 6

LD7D4:
    ldx    ram_D7                ; 3
    lda    ram_F9,X              ; 4
    and    #$0C                  ; 2
    bne    LD814                 ; 2³+1
    ldy    ram_D8                ; 3
    jsr    LD8B9                 ; 6
    bmi    LD813                 ; 2³+1
    ldy    ram_CE                ; 3
    lda    ram_D8                ; 3
    lsr                          ; 2
    bcs    LD7EC                 ; 2³
    ldy    ram_CD                ; 3
LD7EC:
    sty    ram_DD                ; 3
    jsr    LD8B9                 ; 6
    bmi    LD813                 ; 2³+1
    ldx    ram_D7                ; 3
    lda    ram_80                ; 3
    beq    LD801                 ; 2³+1
    lda    ram_F4                ; 3
    and    #$07                  ; 2
    cmp    #1                    ; 2
    beq    LD868                 ; 2³
LD801:
    ldy    ram_DD                ; 3
    ldx    LDF80,Y               ; 4
    jsr    LD8BC                 ; 6
    bmi    LD813                 ; 2³
    ldx    ram_D7                ; 3
    jsr    LD872                 ; 6
    jmp    LD886                 ; 3

LD813:
    rts                          ; 6

LD814:
    cmp    #4                    ; 2
    bne    LD820                 ; 2³
    lda    ram_CD                ; 3
    sta    ram_DD                ; 3
    ldy    ram_CE                ; 3
    bpl    LD826                 ; 2³
LD820:
    lda    ram_CE                ; 3
    sta    ram_DD                ; 3
    ldy    ram_CD                ; 3
LD826:
    ldx    ram_D8                ; 3
    lda    LDF7E,X               ; 4
    cmp    LDF80,Y               ; 4
    beq    LD835                 ; 2³
    jsr    LD8B9                 ; 6
    bmi    LD871                 ; 2³
LD835:
    ldy    ram_DD                ; 3
    ldx    ram_D8                ; 3
    lda    LDF7E,X               ; 4
    cmp    LDF80,Y               ; 4
    beq    LD846                 ; 2³
    jsr    LD8B9                 ; 6
    bmi    LD871                 ; 2³
LD846:
    ldy    ram_D8                ; 3
    jsr    LD8B9                 ; 6
    bmi    LD871                 ; 2³
    ldx    ram_D7                ; 3
    lda    ram_80                ; 3
    beq    LD86B                 ; 2³
    lda    ram_F4                ; 3
    and    #$07                  ; 2
    cmp    #1                    ; 2
    beq    LD868                 ; 2³
    lda    sc_7B|READ            ; 4
    and    #$0A                  ; 2
    beq    LD86B                 ; 2³
    lda    framecounter          ; 3
    cmp    #$64                  ; 2
    bcs    LD86B                 ; 2³
LD868:
    jmp    LD942                 ; 3

LD86B:
    jsr    LD872                 ; 6
    jmp    LD886                 ; 3

LD871:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD872 SUBROUTINE
    lda    ram_F9,X              ; 4
    and    #$0C                  ; 2
    clc                          ; 2
    adc    #4                    ; 2
    and    #$0C                  ; 2
    sta    ram_D5                ; 3
    lda    ram_F9,X              ; 4
    and    #$F3                  ; 2
    ora    ram_D5                ; 3
    sta    ram_F9,X              ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD886:
    ldy    ram_D8                ; 3
    iny                          ; 2
    iny                          ; 2
LD88A SUBROUTINE
    lda    LDF7E,Y               ; 4
    ldx    ram_D7                ; 3
    cmp    #0                    ; 2
    bne    LD896                 ; 2³
    jmp    LD9B2                 ; 3

LD896:
    cmp    #1                    ; 2
    bne    LD8A6                 ; 2³
    ldy    ram_DB                ; 3
    iny                          ; 2
    tya                          ; 2
    sta    ram_DB                ; 3
    sta    sc_01,X               ; 5
    jmp    LDA9C                 ; 3

LD8A6:
    cmp    #2                    ; 2
    bne    LD8AD                 ; 2³
    jmp    LDA07                 ; 3

LD8AD:
    ldy    ram_DB                ; 3
    dey                          ; 2
    tya                          ; 2
    sta    ram_DB                ; 3
    sta    sc_01,X               ; 5
    jmp    LDA4D                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD8B9 SUBROUTINE
    ldx    LDF7E,Y               ; 4
LD8BC SUBROUTINE
    cpx    #0                    ; 2
    bne    LD8C3                 ; 2³
    jmp    LD97B                 ; 3

LD8C3:
    cpx    #1                    ; 2
    bne    LD8CA                 ; 2³
    jmp    LDA6C                 ; 3

LD8CA:
    cpx    #2                    ; 2
    bne    LD8D1                 ; 2³
    jmp    LD9C9                 ; 3  jump to a subroutine

LD8D1:
    jmp    LDA20                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD8D4:
    lda    ram_DB                ; 3
    and    #$03                  ; 2
    bne    LD956                 ; 2³+1
    ldy    ram_DC                ; 3
    dey                          ; 2
    tya                          ; 2
    and    #$03                  ; 2
    bne    LD956                 ; 2³+1
    lda    ram_DC                ; 3
    lsr                          ; 2
    ldy    ram_DB                ; 3
    jsr    LDADD                 ; 6
    bne    LD956                 ; 2³+1
    bit    ram_F8                ; 3
    bpl    LD900                 ; 2³+1
    bvc    LD900                 ; 2³+1
    lda    ram_DC                ; 3
    cmp    sc_78|READ            ; 4
    bne    LD900                 ; 2³+1
    lda    ram_DB                ; 3
    cmp    sc_08|READ            ; 4
    beq    LD956                 ; 2³
LD900:
    ldx    ram_D7                ; 3
    ldy    #$18                  ; 2
    lda    #9                    ; 2
    jsr    LD103                 ; 6
    bpl    LD956                 ; 2³
    ldy    #$14                  ; 2
    lda    #9                    ; 2
    jsr    LD103                 ; 6
    bpl    LD956                 ; 2³
    ldy    #$1C                  ; 2
    lda    #9                    ; 2
    jsr    LD103                 ; 6
    bpl    LD956                 ; 2³
    ldy    #$10                  ; 2
    lda    #9                    ; 2
    jsr    LD103                 ; 6
    bpl    LD956                 ; 2³
    ldy    #$20                  ; 2
    lda    #9                    ; 2
    jsr    LD103                 ; 6
    bpl    LD956                 ; 2³
    lda    sc_16|READ,X          ; 4
    and    #$DF                  ; 2
    sta    sc_16,X               ; 5
    dec    ram_CD                ; 5
    lda    ram_F9,X              ; 4
    and    #$F0                  ; 2
    ora    ram_CD                ; 3
    sta    ram_F9,X              ; 4
    rts                          ; 6

LD942:
    lda    sc_16|READ,X          ; 4
    ora    #$20                  ; 2
    sta    sc_16,X               ; 5
    ldy    #$4C                  ; 2
    and    #$40                  ; 2
    beq    LD952                 ; 2³
    ldy    #$4E                  ; 2
LD952:
    tya                          ; 2
    sta    sc_0B,X               ; 5
LD956:
    lda    ram_CB                ; 3
    bne    LD95E                 ; 2³
    ldy    ram_CE                ; 3
    bpl    LD973                 ; 2³
LD95E:
    lda    ram_CC                ; 3
    bne    LD966                 ; 2³
    ldy    ram_CD                ; 3
    bpl    LD978                 ; 2³
LD966:
    lda    ram_D8                ; 3
    lsr                          ; 2
    bcc    LD96F                 ; 2³
    ldy    ram_CE                ; 3
    bpl    LD973                 ; 2³
LD96F:
    ldy    ram_CD                ; 3
    bpl    LD978                 ; 2³
LD973:
    jsr    LD88A                 ; 6
    ldy    ram_CE                ; 3
LD978:
    jmp    LD88A                 ; 3

LD97B:
    lda    ram_D9                ; 3
    lsr                          ; 2
    bcs    LD9C0                 ; 2³
    ldx    ram_D7                ; 3
    lda    ram_DC                ; 3
    tay                          ; 2
    clc                          ; 2
    adc    #3                    ; 2
    and    #$03                  ; 2
    cmp    #2                    ; 2
    bcs    LD9B2                 ; 2³
    lda    ram_D6                ; 3
    bne    LD9C0                 ; 2³
    cpy    #$29                  ; 2
    beq    LD9C0                 ; 2³
    tya                          ; 2
    clc                          ; 2
    adc    #3                    ; 2
    tay                          ; 2
    and    #$03                  ; 2
    bne    LD9A0                 ; 2³
    dey                          ; 2
LD9A0:
    tya                          ; 2
    lsr                          ; 2
    ldy    ram_DB                ; 3
    jsr    LDADD                 ; 6
    bne    LD9C0                 ; 2³
    ldy    #$18                  ; 2
    lda    #5                    ; 2
    jsr    LD103                 ; 6
    bpl    LD9C0                 ; 2³
LD9B2:
    ldy    ram_DC                ; 3
    iny                          ; 2
    tya                          ; 2
    sta    sc_71,X               ; 5
    lda    ram_F9,X              ; 4
    and    #$FC                  ; 2
    sta    ram_F9,X              ; 4
    rts                          ; 6

LD9C0:
    lda    ram_D9                ; 3
    ora    #$01                  ; 2
    sta    ram_D9                ; 3
    ldx    #0                    ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD9C9 SUBROUTINE
    lda    #4                    ; 2
    bit    ram_D9                ; 3
    bne    LDA17                 ; 2³+1
    ldx    ram_D7                ; 3
    ldy    ram_DC                ; 3
    dey                          ; 2
    tya                          ; 2
    and    #$03                  ; 2
    cmp    #1                    ; 2
    bne    LD9DE                 ; 2³
    jmp    LDA07                 ; 3

LD9DE:
    cmp    #2                    ; 2
    beq    LDA07                 ; 2³+1
    lda    ram_D6                ; 3
    bne    LDA17                 ; 2³+1
    ldy    ram_DC                ; 3
    dey                          ; 2
    beq    LDA17                 ; 2³+1
    tya                          ; 2
    and    #$03                  ; 2
    bne    LD9F3                 ; 2³
    dey                          ; 2
    bpl    LD9F5                 ; 2³
LD9F3:
    dey                          ; 2
    dey                          ; 2
LD9F5:
    tya                          ; 2
    lsr                          ; 2
    ldy    ram_DB                ; 3
    jsr    LDADD                 ; 6
    bne    LDA17                 ; 2³+1
    ldy    #$18                  ; 2
    lda    #$0D                  ; 2
    jsr    LD103                 ; 6
    bpl    LDA17                 ; 2³
LDA07:
    ldy    ram_DC                ; 3
    dey                          ; 2
    tya                          ; 2
    sta    sc_71,X               ; 5
    lda    ram_F9,X              ; 4
    and    #$FC                  ; 2
    ora    #$02                  ; 2
    sta    ram_F9,X              ; 4
    rts                          ; 6

LDA17:
    lda    ram_D9                ; 3
    ora    #$04                  ; 2
    sta    ram_D9                ; 3
    ldx    #0                    ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LDA20:
    lda    #8                    ; 2
    bit    ram_D9                ; 3
    bne    LDA63                 ; 2³
    ldx    ram_D7                ; 3
    lda    ram_DC                ; 3
    and    #$03                  ; 2
    cmp    #1                    ; 2
    bne    LDA63                 ; 2³
    ldy    ram_DB                ; 3
    beq    LDA63                 ; 2³
    dey                          ; 2
    tya                          ; 2
    sta    sc_01,X               ; 5
    and    #$FC                  ; 2
    tay                          ; 2
    lda    ram_DC                ; 3
    lsr                          ; 2
    jsr    LDABB                 ; 6
    bne    LDA5E                 ; 2³
    ldy    #$23                  ; 2
    lda    #9                    ; 2
    jsr    LD103                 ; 6
    bpl    LDA5E                 ; 2³
LDA4D:
    lda    sc_16|READ,X          ; 4
    ora    #$80                  ; 2
    sta    sc_16,X               ; 5
    lda    ram_F9,X              ; 4
    and    #$FC                  ; 2
    ora    #$03                  ; 2
    sta    ram_F9,X              ; 4
    rts                          ; 6

LDA5E:
    lda    ram_DB                ; 3
    sta    sc_01,X               ; 5
LDA63:
    lda    ram_D9                ; 3
    ora    #$08                  ; 2
    sta    ram_D9                ; 3
    ldx    #0                    ; 2
    rts                          ; 6

LDA6C:
    lda    #2                    ; 2
    bit    ram_D9                ; 3
    bne    LDAB2                 ; 2³
    ldx    ram_D7                ; 3
    lda    ram_DC                ; 3
    and    #$03                  ; 2
    cmp    #1                    ; 2
    bne    LDAB2                 ; 2³
    ldy    ram_DB                ; 3
    cpy    #$78                  ; 2
    beq    LDAB2                 ; 2³
    iny                          ; 2
    tya                          ; 2
    sta    sc_01,X               ; 5
    clc                          ; 2
    adc    #7                    ; 2
    tay                          ; 2
    lda    ram_DC                ; 3
    lsr                          ; 2
    jsr    LDABB                 ; 6
    bne    LDAAD                 ; 2³
    ldy    #$0D                  ; 2
    lda    #9                    ; 2
    jsr    LD103                 ; 6
    bpl    LDAAD                 ; 2³
LDA9C:
    lda    sc_16|READ,X          ; 4
    and    #$7F                  ; 2
    sta    sc_16,X               ; 5
    lda    ram_F9,X              ; 4
    and    #$FC                  ; 2
    ora    #$01                  ; 2
    sta    ram_F9,X              ; 4
    rts                          ; 6

LDAAD:
    lda    ram_DB                ; 3
    sta    sc_01,X               ; 5
LDAB2:
    lda    ram_D9                ; 3
    ora    #$02                  ; 2
    sta    ram_D9                ; 3
    ldx    #0                    ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LDABB SUBROUTINE
    asl                          ; 2
    asl                          ; 2
    sta    ram_DF                ; 3
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_EC                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    ram_DF                ; 3
    sta    ram_DF                ; 3
    tay                          ; 2
LDACD:
    lda    sc_1D|READ,Y          ; 4
    sta    ram_D0                ; 3
    ldy    ram_EC                ; 3
    lda    LDFBB,Y               ; 4
    ora    ram_D0                ; 3
    cmp    LDFBB,Y               ; 4
LDADC:
    rts                          ; 6

LDADD SUBROUTINE
    jsr    LDABB                 ; 6
    bne    LDADC                 ; 2³
    ldy    ram_DF                ; 3
    inc    ram_EC                ; 5
    lda    ram_EC                ; 3
    and    #$07                  ; 2
    bne    LDACD                 ; 2³
    iny                          ; 2
    bpl    LDACD                 ; 2³   always branch?

LDAEF SUBROUTINE
    cpy    ram_D3                ; 3
    bcc    LDAF5                 ; 2³
    sty    ram_D3                ; 3
LDAF5:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LDAF6:
    lda    numOfLives|READ       ; 4
    ora    #$20                  ; 2
    and    #$EF                  ; 2
    sta    numOfLives            ; 4
    lda    ram_F4                ; 3
    and    #$07                  ; 2
    beq    LDB2A                 ; 2³
    lda    ram_F8                ; 3
    bmi    LDB17                 ; 2³
    lda    sc_15|READ            ; 4
    and    #$70                  ; 2
    beq    LDB17                 ; 2³
    lda    ram_F8                ; 3
    ora    #$80                  ; 2
    sta    ram_F8                ; 3
LDB17:
    lda    #$0E                  ; 2
    ora    sc_15|READ            ; 4
    sta    sc_15                 ; 4
    lda    #4                    ; 2
    ldy    sc_7B|READ            ; 4
    bpl    LDB46                 ; 2³
    lda    #$11                  ; 2
    bne    LDB46                 ; 3   always branch

LDB2A:
    ldy    ram_80                ; 3
    beq    LDB35                 ; 2³
    bpl    LDB32                 ; 2³
    dey                          ; 2
    dey                          ; 2
LDB32:
    iny                          ; 2
    sty    ram_80                ; 3
LDB35:
    lda    sc_15|READ            ; 4
    and    #$F9                  ; 2
    ora    #$0A                  ; 2
    sta    sc_15                 ; 4
    lda    #0                    ; 2
    sta    ram_F8                ; 3
    sta    sc_78                 ; 4
LDB46:
    sta    sc_7B                 ; 4
    lda    ram_80                ; 3
    lsr                          ; 2
    lsr                          ; 2
    and    #$0F                  ; 2
    clc                          ; 2
    adc    #7                    ; 2
    adc    sc_7B|READ            ; 4
    sta    sc_7B                 ; 4
    cmp    #$12                  ; 2
    bcc    LDB5E                 ; 2³
    lda    #$12                  ; 2
LDB5E:
    sta    sc_7B                 ; 4
    lda    #0                    ; 2
    sta    sc_79                 ; 4
    lda    #$80                  ; 2
    sta    sc_09                 ; 4
    lda    sc_15|READ            ; 4
    and    #$8F                  ; 2
    sta    sc_15                 ; 4
    lda    ram_F6                ; 3
    tay                          ; 2
    and    #$60                  ; 2
    cmp    #$60                  ; 2
    bne    LDB92                 ; 2³
    tya                          ; 2
    and    #$1C                  ; 2
    cmp    #$1C                  ; 2
    beq    LDB92                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    tax                          ; 2
    lda    #$40                  ; 2
    sta    sc_16,X               ; 5
    lda    #0                    ; 2
    sta    sc_71,X               ; 5

LDB92:
.waitOverscanToEnd
    lda    INTIM                 ; 4
    bmi    LDB99                 ; 2³
    bne    .waitOverscanToEnd    ; 2³

LDB99:
    lda    #2                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3   start Vsync
    sta    VBLANK                ; 3   turn electron beam off
    lda    framecounter          ; 3
    sta    ram_F0                ; 3
    inc    framecounter          ; 5
    bne    LDBD8                 ; 2³  once every 256 frames
    lda    sc_7B|READ            ; 4
    bmi    LDBB4                 ; 2³
    clc                          ; 2
    adc    #1                    ; 2
    jmp    LDBB9                 ; 3

LDBB4:
    clc                          ; 2
    adc    #1                    ; 2
    ora    #$80                  ; 2
LDBB9:
    sta    sc_7B                 ; 4
    bmi    LDBC2                 ; 2³
    cmp    #$14                  ; 2
    bcc    LDBD8                 ; 2³
LDBC2:
    lda    ram_80                ; 3
    beq    LDBD8                 ; 2³
    lda    #2                    ; 2
    bit    ram_F3                ; 3
    bne    LDBD8                 ; 2³
    ora    ram_F3                ; 3
    sta    ram_F3                ; 3
    ldy    #$10                  ; 2
    cpy    ram_D3                ; 3
    bcc    LDBD8                 ; 2³
    sty    ram_D3                ; 3
LDBD8:
    sta    WSYNC                 ; 3   1 scanline of Vsync
;---------------------------------------
    lda    ram_F3                ; 3
    bpl    LDBEF                 ; 2³
    lda    #$40                  ; 2
    ldy    INPT4                 ; 3
    bmi    LDBEB                 ; 2³
    ldy    #8                    ; 2
    jsr    LDAEF                 ; 6
    lda    #$20                  ; 2
LDBEB:
    ora    ram_F3                ; 3
    sta    ram_F3                ; 3
LDBEF:
    lda    ram_F3                ; 3
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    sta    ram_DD                ; 3
    sta    WSYNC                 ; 3   2 scanlines of Vsync
;---------------------------------------
    tax                          ; 2
    lda    numOfLives|READ       ; 4
    and    #$30                  ; 2
    bne    LDC0C                 ; 2³
    lda    ram_F9,X              ; 4
    bpl    LDC12                 ; 2³
    lda    sc_16|READ,X          ; 4
    and    #$10                  ; 2
    beq    LDC12                 ; 2³
LDC0C:
    lda    ram_F3                ; 3
    and    #$7F                  ; 2
    sta    ram_F3                ; 3
LDC12:
    sta    WSYNC                 ; 3   3 scanlines of Vsync
;---------------------------------------
    ldy    #0                    ; 2
    sty    VSYNC                 ; 3   Vsync ends
    lda    #$2C                  ; 2
    sta    TIM64T                ; 4
    lda    sc_15|READ            ; 4
    bpl    LDC2B                 ; 2³
    lda    sc_0F|READ            ; 4
    lsr                          ; 2
    bcs    LDC2B                 ; 2³
    jmp    LDFDB                 ; 3   goto L9200

LDC2B:
    lda    ram_DA                ; 3
    beq    LDC88                 ; 2³
    lsr                          ; 2
    bcc    LDC35                 ; 2³
    jmp    LDFE4                 ; 3   goto L9BF9

LDC35:
    lda    #$30                  ; 2
    and    numOfLives|READ       ; 4
    bne    LDC7F                 ; 2³
    ldy    #6                    ; 2
LDC3E:
    lda    #$80                  ; 2
    and.wy ram_F9,Y              ; 4
    beq    LDC7C                 ; 2³
    lda    sc_16|READ,Y          ; 4
    tax                          ; 2
    and    #$18                  ; 2
    bne    LDC7C                 ; 2³
    txa                          ; 2
    ldx    #3                    ; 2
    and    #$60                  ; 2
    cmp    #$20                  ; 2
    bne    LDC58                 ; 2³
    ldx    #2                    ; 2
LDC58:
    stx    ram_D5                ; 3
    lda    sc_7A|READ            ; 4
    sec                          ; 2
    sbc    sc_71|READ,Y          ; 4
    bpl    LDC67                 ; 2³
    eor    #$FF                  ; 2
    adc    #1                    ; 2
LDC67:
    cmp    ram_D5                ; 3
    bcs    LDC7C                 ; 2³
    lda    sc_0A|READ            ; 4
    sec                          ; 2
    sbc    sc_01|READ,Y          ; 4
    bpl    LDC78                 ; 2³
    eor    #$FF                  ; 2
    adc    #1                    ; 2
LDC78:
    cmp    #6                    ; 2
    bcc    LDC8B                 ; 2³
LDC7C:
    dey                          ; 2
    bpl    LDC3E                 ; 2³
LDC7F:
    lda    ram_DA                ; 3
    cmp    #2                    ; 2
    bne    LDC88                 ; 2³
    jmp    LDFEA                 ; 3   goto L9BB1

LDC88:
    jmp    LDFDE                 ; 3   goto L9CF6

LDC8B:
    lda    numOfLives|READ       ; 4
    ora    #$10                  ; 2
    sta    numOfLives            ; 4
    ldy    #$0C                  ; 2
    jsr    LDAEF                 ; 6
    jmp    LDC7F                 ; 3

LDC9B:
    jmp    LDF03                 ; 3

LDC9E:
    lda    ram_F7                ; 3
    bpl    LDCA5                 ; 2³
    jmp    LDE79                 ; 3

LDCA5:
    lda    ram_CA                ; 3
    beq    LDC9B                 ; 2³
    bit    ram_F8                ; 3
    bvs    LDC9B                 ; 2³
    lda    framecounter          ; 3
    cmp    #$0C                  ; 2
    bcs    LDC9B                 ; 2³
    lda    sc_7B|READ            ; 4
    bmi    LDCBC                 ; 2³
    cmp    #7                    ; 2
    bcc    LDC9B                 ; 2³
LDCBC:
    and    #$06                  ; 2
    beq    LDC9B                 ; 2³
    lda    ram_F8                ; 3
    bmi    LDC9B                 ; 2³
    lda    ram_F7                ; 3
    and    #$07                  ; 2
    sec                          ; 2
    sbc    #1                    ; 2
    bmi    LDCD2                 ; 2³
    tax                          ; 2
    sta    ram_EC                ; 3
    bpl    LDCE0                 ; 2³
LDCD2:
    ldx    #6                    ; 2
    stx    ram_EC                ; 3
    bpl    LDCE0                 ; 3   always branch

LDCD8:
    bpl    LDCDC                 ; 2³
    ldx    #6                    ; 2
LDCDC:
    cpx    ram_EC                ; 3
    beq    LDC9B                 ; 2³
LDCE0:
    lda    ram_F9,X              ; 4
    and    #$C1                  ; 2
    cmp    #$81                  ; 2
    beq    LDCEB                 ; 2³
    jmp    LDCF4                 ; 3

LDCEB:
    lda    sc_16|READ,X          ; 4
    and    #$68                  ; 2
    cmp    #$40                  ; 2
    beq    LDCF8                 ; 2³
LDCF4:
    dex                          ; 2
    jmp    LDCD8                 ; 3

LDCF8:
    ldy    #0                    ; 2
    lda    sc_16|READ,X          ; 4
    bpl    LDD02                 ; 2³+1
    jmp    LDDCC                 ; 3

LDD02:
    dey                          ; 2
    sty    ram_F0                ; 3
    lda    sc_01|READ,X          ; 4
    tay                          ; 2
    clc                          ; 2
    adc    #$26                  ; 2
    cmp    #$80                  ; 2
    bcc    LDD12                 ; 2³
    lda    #$80                  ; 2
LDD12:
    sta    ram_D9                ; 3
    tya                          ; 2
    and    #$FC                  ; 2
    sta    ram_D5                ; 3
    sta    ram_D6                ; 3
LDD1B:
    tay                          ; 2
    lda    sc_71|READ,X          ; 4
    lsr                          ; 2
    jsr    LDABB                 ; 6
    bne    LDD34                 ; 2³
LDD25:
    lda    ram_D5                ; 3
    clc                          ; 2
    adc    #4                    ; 2
    sta    ram_D5                ; 3
    cmp    ram_D9                ; 3
    bcc    LDD1B                 ; 2³
    lda    ram_D9                ; 3
    sta    ram_D5                ; 3
LDD34:
    lda    ram_D5                ; 3
    sec                          ; 2
    sbc    ram_D6                ; 3
    cmp    #4                    ; 2
    bne    LDD43                 ; 2³
    lda    ram_D6                ; 3
    sta    ram_D5                ; 3
    bne    LDD4F                 ; 2³
LDD43:
    lda    ram_D5                ; 3
    sta    ram_D6                ; 3
    cmp    #$7C                  ; 2
    beq    LDD4F                 ; 2³
    cmp    ram_D9                ; 3
    bne    LDD25                 ; 2³
LDD4F:
    sta    ram_CF                ; 3
    ldy    #$1A                  ; 2
    lda    #9                    ; 2
    jsr    LD12E                 ; 6
    bmi    LDD62                 ; 2³
    lda    LDF6E,Y               ; 4
    clc                          ; 2
    adc    #$1A                  ; 2
    sta    ram_D5                ; 3
LDD62:
    lda    ram_D5                ; 3
    sec                          ; 2
    sbc    sc_01|READ,X          ; 4
    sec                          ; 2
    sbc    #6                    ; 2
    sta    ram_D5                ; 3
    ldy    #3                    ; 2
LDD6F:
    lda    LDF42,Y               ; 4
    cmp    ram_D5                ; 3
    beq    LDD7E                 ; 2³
    bcc    LDD7E                 ; 2³
    dey                          ; 2
    bpl    LDD6F                 ; 2³
    jmp    LDF03                 ; 3

LDD7E:
    lda    #$43                  ; 2
    sta    sc_0B,X               ; 5
    lda    sc_01|READ,X          ; 4
    clc                          ; 2
    adc    #6                    ; 2
    sta    sc_08                 ; 4
    lda    LDF46,Y               ; 4
    sta    sc_12                 ; 4
LDD92:
    lda    numOfLives|READ       ; 4
    and    #$3F                  ; 2
    sta    numOfLives            ; 4
    tya                          ; 2
    clc                          ; 2
    ror                          ; 2
    ror                          ; 2
    ror                          ; 2
    ora    numOfLives|READ       ; 4
    sta    numOfLives            ; 4
    lda    ram_F9,X              ; 4
    ora    #$40                  ; 2
    and    #$CF                  ; 2
    sta    ram_F9,X              ; 4
    lda    ram_F5                ; 3
    and    #$03                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    ram_F9,X              ; 4
    sta    ram_F9,X              ; 4
    txa                          ; 2
    ora    #$80                  ; 2
    sta    ram_F7                ; 3
    lda    sc_71|READ,X          ; 4
    sta    sc_78                 ; 4
    ldy    #7                    ; 2
    jsr    LDAEF                 ; 6
    jmp    LDE79                 ; 3

LDDCC:
    sty    ram_F0                ; 3
    lda    sc_01|READ,X          ; 4
    tay                          ; 2
    sec                          ; 2
    sbc    #$1E                  ; 2
    bmi    LDDDB                 ; 2³
    cmp    #1                    ; 2
    bcs    LDDDD                 ; 2³
LDDDB:
    lda    #1                    ; 2
LDDDD:
    sta    ram_D9                ; 3
    tya                          ; 2
    and    #$FC                  ; 2
    sta    ram_D5                ; 3
    tay                          ; 2
    clc                          ; 2
    adc    #8                    ; 2
    sta    ram_D6                ; 3
    tya                          ; 2
LDDEB:
    tay                          ; 2
    lda    sc_71|READ,X          ; 4
    lsr                          ; 2
    jsr    LDABB                 ; 6
    bne    LDE06                 ; 2³+1
    lda    ram_D5                ; 3
    sec                          ; 2
    sbc    #4                    ; 2
LDDFA:
    sta    ram_D5                ; 3
    bmi    LDE02                 ; 2³+1
    cmp    ram_D9                ; 3
    bcs    LDDEB                 ; 2³+1
LDE02:
    lda    ram_D9                ; 3
    bpl    LDE0B                 ; 2³
LDE06:
    lda    ram_D5                ; 3
    clc                          ; 2
    adc    #4                    ; 2
LDE0B:
    sta    ram_D5                ; 3
    lda    ram_D6                ; 3
    sec                          ; 2
    sbc    ram_D5                ; 3
    cmp    #4                    ; 2
    bne    LDE1C                 ; 2³
    lda    ram_D6                ; 3
    sta    ram_D5                ; 3
    bne    LDE2F                 ; 2³
LDE1C:
    lda    ram_D5                ; 3
    sta    ram_D6                ; 3
    sec                          ; 2
    sbc    #8                    ; 2
    bmi    LDE2D                 ; 2³
    cmp    ram_D9                ; 3
    bcc    LDE2D                 ; 2³
    cmp    #1                    ; 2
    bcs    LDDFA                 ; 2³+1
LDE2D:
    lda    ram_D5                ; 3
LDE2F:
    sta    ram_CF                ; 3
    ldy    #$1E                  ; 2
    lda    #9                    ; 2
    jsr    LD12E                 ; 6
    bmi    LDE42                 ; 2³
    lda    LDF6E,Y               ; 4
    clc                          ; 2
    adc    #$1E                  ; 2
    sta    ram_D5                ; 3
LDE42:
    lda    sc_01|READ,X          ; 4
    sec                          ; 2
    sbc    ram_D5                ; 3
    clc                          ; 2
    adc    #2                    ; 2
    sta    ram_D5                ; 3
    ldy    #3                    ; 2
LDE4F:
    lda    LDF42,Y               ; 4
    cmp    ram_D5                ; 3
    beq    LDE5E                 ; 2³
    bcc    LDE5E                 ; 2³
    dey                          ; 2
    bpl    LDE4F                 ; 2³
    jmp    LDF03                 ; 3

LDE5E:
    lda    #$47                  ; 2
    sta    sc_0B,X               ; 5
    lda    sc_01|READ,X          ; 4
    sec                          ; 2
    sbc    LDF42,Y               ; 4
    clc                          ; 2
    adc    #2                    ; 2
    sta    sc_08                 ; 4
    lda    LDF4A,Y               ; 4
    sta    sc_12                 ; 4
    jmp    LDD92                 ; 3

LDE79:
    bit    ram_F8                ; 3
    bvs    LDEBA                 ; 2³
    lda    sc_7A|READ            ; 4
    sec                          ; 2
    sbc    sc_78|READ            ; 4
    bpl    LDE8B                 ; 2³
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #1                    ; 2
LDE8B:
    cmp    #2                    ; 2
    bcs    LDEBA                 ; 2³
    lda    sc_08|READ            ; 4
    sec                          ; 2
    sbc    #3                    ; 2
    cmp    sc_0A|READ            ; 4
    bcs    LDEBA                 ; 2³
    lda    numOfLives|READ       ; 4
    and    #$C0                  ; 2
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    tay                          ; 2
    lda    LDF42,Y               ; 4
    clc                          ; 2
    adc    sc_08|READ            ; 4
    sec                          ; 2
    sbc    #2                    ; 2
    cmp    sc_0A|READ            ; 4
    bcc    LDEBA                 ; 2³
    ldy    #$0C                  ; 2
    jsr    LDAEF                 ; 6
    jmp    LDAF6                 ; 3

LDEBA:
    lda    ram_F7                ; 3
    and    #$78                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    cmp    #$0F                  ; 2
    bne    LDEF3                 ; 2³
    lda    ram_F7                ; 3
    and    #$07                  ; 2
    tax                          ; 2
    lda    ram_F5                ; 3
    and    #$03                  ; 2
    sta    ram_D5                ; 3
    lda    ram_F9,X              ; 4
    and    #$30                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    cmp    ram_D5                ; 3
    bne    LDF03                 ; 2³+1
    lda    ram_F9,X              ; 4
    and    #$BF                  ; 2
    sta    ram_F9,X              ; 4
    bit    ram_F8                ; 3
    bvs    LDEEB                 ; 2³
    lda    #0                    ; 2
    sta    sc_78                 ; 4
LDEEB:
    lda    ram_F7                ; 3
    and    #$7F                  ; 2
    sta    ram_F7                ; 3
    bpl    LDF03                 ; 2³+1
LDEF3:
    tax                          ; 2
    inx                          ; 2
    lda    ram_F7                ; 3
    and    #$87                  ; 2
    sta    ram_F7                ; 3
    txa                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    ram_F7                ; 3
    sta    ram_F7                ; 3
LDF03:
    lda    ram_F4                ; 3
    and    #$07                  ; 2
    beq    LDF37                 ; 2³
    lda    framecounter          ; 3
    and    #$07                  ; 2
    bne    LDF34                 ; 2³
    ldx    #6                    ; 2
LDF11:
    lda    ram_F9,X              ; 4
    and    #$C0                  ; 2
    cmp    #$80                  ; 2
    bne    LDF31                 ; 2³
    lda    sc_16|READ,X          ; 4
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    and    #$07                  ; 2
    tay                          ; 2
    lda    LDF5E,Y               ; 4
    cmp    sc_0B|READ,X          ; 4
    bne    LDF2E                 ; 2³
    lda    LDF66,Y               ; 4
LDF2E:
    sta    sc_0B,X               ; 5
LDF31:
    dex                          ; 2
    bpl    LDF11                 ; 2³
LDF34:
    jmp    LDB92                 ; 3

LDF37:
    jmp    LDB2A                 ; 3

LDF3A:
    .byte $08 ; |    X   | $DF3A
    .byte $0E ; |    XXX | $DF3B
LDF3C:
    .byte $08 ; |    X   | $DF3C
    .byte $10 ; |   X    | $DF3D
LDF3E:
    .byte $09 ; |    X  X| $DF3E
    .byte $C6 ; |XX   XX | $DF3F
LDF40:
    .byte $03 ; |      XX| $DF40
    .byte $05 ; |     X X| $DF41
LDF42:
    .byte $08 ; |    X   | $DF42
    .byte $10 ; |   X    | $DF43
    .byte $18 ; |   XX   | $DF44
    .byte $20 ; |  X     | $DF45
LDF46:
    .byte $80 ; |X       | $DF46
    .byte $82 ; |X     X | $DF47
    .byte $CF ; |XX  XXXX| $DF48
    .byte $84 ; |X    X  | $DF49
LDF4A:
    .byte $86 ; |X    XX | $DF4A
    .byte $88 ; |X   X   | $DF4B
    .byte $CE ; |XX  XXX | $DF4C
    .byte $8A ; |X   X X | $DF4D
    .byte $3D ; |  XXXX X| $DF4E
    .byte $20 ; |  X     | $DF4F
    .byte $B1 ; |X XX   X| $DF50
    .byte $18 ; |   XX   | $DF51
    .byte $00 ; |        | $DF52
    .byte $FD ; |XXXXXX X| $DF53
    .byte $6E ; | XX XXX | $DF54
    .byte $C0 ; |XX      | $DF55
    .byte $FD ; |XXXXXX X| $DF56
    .byte $66 ; | XX  XX | $DF57
    .byte $C1 ; |XX     X| $DF58
    .byte $11 ; |   X   X| $DF59
    .byte $D2 ; |XX X  X | $DF5A
    .byte $00 ; |        | $DF5B
    .byte $19 ; |   XX  X| $DF5C
    .byte $FD ; |XXXXXX X| $DF5D
LDF5E:
    .byte $01 ; |       X| $DF5E
    .byte $4C ; | X  XX  | $DF5F
    .byte $06 ; |     XX | $DF60
    .byte $4E ; | X  XXX | $DF61
    .byte $03 ; |      XX| $DF62
    .byte $4C ; | X  XX  | $DF63
    .byte $0A ; |    X X | $DF64
    .byte $4E ; | X  XXX | $DF65
LDF66:
    .byte $02 ; |      X | $DF66
    .byte $4D ; | X  XX X| $DF67
    .byte $43 ; | X    XX| $DF68
    .byte $4F ; | X  XXXX| $DF69
    .byte $04 ; |     X  | $DF6A
    .byte $4D ; | X  XX X| $DF6B
    .byte $47 ; | X   XXX| $DF6C
    .byte $4F ; | X  XXXX| $DF6D
LDF6E:
    .byte $30 ; |  XX    | $DF6E
    .byte $30 ; |  XX    | $DF6F
    .byte $00 ; |        | $DF70
    .byte $00 ; |        | $DF71
    .byte $00 ; |        | $DF72
    .byte $48 ; | X  X   | $DF73
    .byte $48 ; | X  X   | $DF74
    .byte $48 ; | X  X   | $DF75
LDF76:
    .byte $00 ; |        | $DF76
    .byte $08 ; |    X   | $DF77
    .byte $04 ; |     X  | $DF78
    .byte $10 ; |   X    | $DF79
    .byte $18 ; |   XX   | $DF7A
    .byte $0C ; |    XX  | $DF7B
    .byte $14 ; |   X X  | $DF7C
    .byte $1C ; |   XXX  | $DF7D
LDF7E:
    .byte $03 ; |      XX| $DF7E
    .byte $00 ; |        | $DF7F
LDF80:
    .byte $01 ; |       X| $DF80
    .byte $02 ; |      X | $DF81
    .byte $03 ; |      XX| $DF82
LDF83:
    .byte $00 ; |        | $DF83
    .byte $01 ; |       X| $DF84
    .byte $02 ; |      X | $DF85
    .byte $03 ; |      XX| $DF86
    .byte $04 ; |     X  | $DF87
    .byte $05 ; |     X X| $DF88
    .byte $06 ; |     XX | $DF89
    .byte $07 ; |     XXX| $DF8A
    .byte $08 ; |    X   | $DF8B
    .byte $09 ; |    X  X| $DF8C
    .byte $0A ; |    X X | $DF8D
    .byte $0B ; |    X XX| $DF8E
    .byte $00 ; |        | $DF8F
    .byte $01 ; |       X| $DF90
    .byte $02 ; |      X | $DF91
    .byte $03 ; |      XX| $DF92
    .byte $04 ; |     X  | $DF93
    .byte $05 ; |     X X| $DF94
    .byte $06 ; |     XX | $DF95
    .byte $07 ; |     XXX| $DF96
    .byte $08 ; |    X   | $DF97
    .byte $09 ; |    X  X| $DF98
    .byte $0A ; |    X X | $DF99
    .byte $0B ; |    X XX| $DF9A
    .byte $00 ; |        | $DF9B
    .byte $01 ; |       X| $DF9C
    .byte $02 ; |      X | $DF9D
    .byte $03 ; |      XX| $DF9E
    .byte $04 ; |     X  | $DF9F
    .byte $05 ; |     X X| $DFA0
    .byte $06 ; |     XX | $DFA1
    .byte $07 ; |     XXX| $DFA2
    .byte $08 ; |    X   | $DFA3
    .byte $09 ; |    X  X| $DFA4
    .byte $0A ; |    X X | $DFA5
    .byte $0B ; |    X XX| $DFA6
    .byte $00 ; |        | $DFA7
    .byte $01 ; |       X| $DFA8
    .byte $02 ; |      X | $DFA9
    .byte $03 ; |      XX| $DFAA
    .byte $04 ; |     X  | $DFAB
    .byte $05 ; |     X X| $DFAC
    .byte $06 ; |     XX | $DFAD
    .byte $07 ; |     XXX| $DFAE
    .byte $08 ; |    X   | $DFAF
    .byte $09 ; |    X  X| $DFB0
    .byte $0A ; |    X X | $DFB1
    .byte $0B ; |    X XX| $DFB2
LDFB3:
    .byte $80 ; |X       | $DFB3
    .byte $20 ; |  X     | $DFB4
    .byte $40 ; | X      | $DFB5
    .byte $08 ; |    X   | $DFB6
    .byte $02 ; |      X | $DFB7
    .byte $10 ; |   X    | $DFB8
    .byte $04 ; |     X  | $DFB9
    .byte $01 ; |       X| $DFBA
LDFBB:
    .byte $7F ; | XXXXXXX| $DFBB
    .byte $BF ; |X XXXXXX| $DFBC
    .byte $DF ; |XX XXXXX| $DFBD
    .byte $EF ; |XXX XXXX| $DFBE
    .byte $F7 ; |XXXX XXX| $DFBF
    .byte $FB ; |XXXXX XX| $DFC0
    .byte $FD ; |XXXXXX X| $DFC1
    .byte $FE ; |XXXXXXX | $DFC2
    .byte $FE ; |XXXXXXX | $DFC3
    .byte $FD ; |XXXXXX X| $DFC4
    .byte $FB ; |XXXXX XX| $DFC5
    .byte $F7 ; |XXXX XXX| $DFC6
    .byte $EF ; |XXX XXXX| $DFC7
    .byte $DF ; |XX XXXXX| $DFC8
    .byte $BF ; |X XXXXXX| $DFC9
    .byte $7F ; | XXXXXXX| $DFCA
    .byte $7F ; | XXXXXXX| $DFCB
    .byte $BF ; |X XXXXXX| $DFCC
    .byte $DF ; |XX XXXXX| $DFCD
    .byte $EF ; |XXX XXXX| $DFCE
    .byte $F7 ; |XXXX XXX| $DFCF
    .byte $FB ; |XXXXX XX| $DFD0
    .byte $FD ; |XXXXXX X| $DFD1
    .byte $FE ; |XXXXXXX | $DFD2
    .byte $FE ; |XXXXXXX | $DFD3
    .byte $FD ; |XXXXXX X| $DFD4
    .byte $FB ; |XXXXX XX| $DFD5
    .byte $F7 ; |XXXX XXX| $DFD6
    .byte $EF ; |XXX XXXX| $DFD7
    .byte $DF ; |XX XXXXX| $DFD8
    .byte $BF ; |X XXXXXX| $DFD9
    .byte $7F ; | XXXXXXX| $DFDA

LDFDB:
    lda    BANK_0                ; 4   bankswitch, goto L9200

LDFDE:
    lda    BANK_0                ; 4   bankswitch, goto L9CF6

;bs from bank 3
    jmp    LDC9E                 ; 3

LDFE4:
    lda    BANK_0                ; 4   bankswitch, goto L9BF9

;bs from bank 3
    jmp    LDB92                 ; 3

LDFEA:
    lda    BANK_0                ; 4   bankswitch, goto L9BB1

;all bs from bank 3
    jmp    LD1A7                 ; 3
    jmp    LD66B                 ; 3
    jmp    LDAF6                 ; 3

    .byte $00 ; |        | $DFF6
    .byte $00 ; |        | $DFF7
    .byte $00 ; |        | $DFF8
    .byte $00 ; |        | $DFF9
    .byte $D6 ; |XX X XX | $DFFA
    .byte $0E ; |    XXX | $DFFB

        ORG $3FFC
       RORG $DFFC

    .word START_BANK_2
    .byte $46 ; | X   XX | $DFFE
    .byte $80 ; |X       | $DFFF


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 3
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


        ORG $4000
       RORG $F000

    SC_RAM_SPACE 256

    nop                          ; 2
    nop                          ; 2
    nop                          ; 2

START_BANK_3:
;clear TIA registers and RIOT ram
    sei                          ; 2
    cld                          ; 2
    ldx    #$FD                  ; 2
    lda    #0                    ; 2
.loopClearNormalRam:
    sta    2,X                   ; 4   but don't clear $FE and $FF...
    dex                          ; 2
    bne    .loopClearNormalRam   ; 2³

;clear Superchip ram
    ldx    #$7F                  ; 2
.loopClearExtraRam:
    sta    numOfLives,X          ; 5
    dex                          ; 2
    bpl    .loopClearExtraRam    ; 2³

    inc    ram_80                ; 5
    lda    #$21                  ; 2   reflect playfield, ball 4 clocks wide
    sta    CTRLPF                ; 3
    lda    #$2C                  ; 2
    sta    TIM64T                ; 4

LF121:
    lda    #0                    ; 2
    sta    sc_11                 ; 4
    sta    sc_19                 ; 4
LF129:
    ldx    #0                    ; 2
    stx    sc_10                 ; 4
    stx    sc_1C                 ; 4
    stx    AUDV0                 ; 3   kill volume
    stx    AUDV1                 ; 3
    lda    sc_0F|READ            ; 4
    and    #$FE                  ; 2
    sta    sc_0F                 ; 4
    lda    #$82                  ; 2
    sta    sc_15                 ; 4
    lda    #$78                  ; 2
    sta    sc_1B                 ; 4
    inx                          ; 2   X=1
    stx    sc_1A                 ; 4
    bpl    LF175                 ; 3   always branch

LF14D:
    lda    #$2C                  ; 2
    sta    TIM64T                ; 4
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    ram_DA                ; 3
    sta    ram_D3                ; 3
    ldx    #$C5                  ; 2
    txs                          ; 2
    lda    SWCHB                 ; 4   test reset switch
    lsr                          ; 2
    bcs    LF178                 ; 2³  no, reset not pressed
    ldy    ram_80                ; 3   yes, do reset
    beq    LF169                 ; 2³
    ldy    #1                    ; 2
LF169:
    sty    ram_80                ; 3
    lda    #3                    ; 2
    sta    sc_15                 ; 4
    lda    #$FF                  ; 2
    sta    sc_1A                 ; 4
LF175:
    jmp    LFFE4                 ; 3   goto LDB92

LF178:
    lsr                          ; 2
    bcs    LF18F                 ; 2³
    lda    #$10                  ; 2
    sta    sc_19                 ; 4
    lda    ram_80                ; 3
    beq    LF186                 ; 2³
    lda    #1                    ; 2
LF186:
    sta    ram_80                ; 3
    ldy    #1                    ; 2
    sty    sc_11                 ; 4
    bpl    LF129                 ; 3   always branch

LF18F:
    lda    sc_1A|READ            ; 4
    cmp    #$FF                  ; 2
    beq    LF1A4                 ; 2³
    lda    sc_15|READ            ; 4
    bpl    LF1D7                 ; 2³
    lda    INPT4                 ; 3
    bmi    LF1D7                 ; 2³
    lda    #3                    ; 2
    sta    sc_15                 ; 4
LF1A4:
    ldx    #$0D                  ; 2
    lda    #0                    ; 2
LF1A8:
    sta    framecounter,X        ; 4
    sta    sc_6F,X               ; 5
    dex                          ; 2
    bpl    LF1A8                 ; 2³
    sta    sc_6D                 ; 4
    sta    sc_6E                 ; 4
    tax                          ; 2
    sta    sc_1A                 ; 4
    lda    #1                    ; 2
    ldy    sc_15|READ            ; 4
    bmi    LF1CC                 ; 2³
    stx    sc_7D                 ; 4
    stx    sc_7E                 ; 4
    stx    sc_7F                 ; 4
    asl                          ; 2
    asl                          ; 2
LF1CC:
    sta    numOfLives            ; 4
    ldx    #9                    ; 2
LF1D1:
    txa                          ; 2
    sta    ram_85,X              ; 4
    dex                          ; 2
    bpl    LF1D1                 ; 2³
LF1D7:
    ldy    #$FF                  ; 2
    sty    ram_E4                ; 3
    lda    #$F0                  ; 2
    sta    ram_E0                ; 3
    sta    ram_E2                ; 3
    bit    ram_F8                ; 3
    bvs    LF1EF                 ; 2³
    lda    numOfLives|READ       ; 4
    and    #$10                  ; 2
    beq    LF1EF                 ; 2³
    jmp    LFFF0                 ; 3   goto LDAF6

LF1EF:
    lda    #8                    ; 2
    bit    sc_15|READ            ; 4
    beq    LF218                 ; 2³+1
    lda    numOfLives|READ       ; 4
    and    #$20                  ; 2
    bne    LF272                 ; 2³+1
    ldx    sc_09|READ            ; 4
    bpl    LF207                 ; 2³
    ldy    #$11                  ; 2
    jsr    LF2C8                 ; 6
LF207:
    dex                          ; 2
    stx    sc_09                 ; 4
    bne    LF215                 ; 2³
    lda    #$F7                  ; 2
    and    sc_15|READ            ; 4
    sta    sc_15                 ; 4
LF215:
    jmp    LFFE4                 ; 3   goto LDB92

LF218:
    lda    #2                    ; 2
    bit    sc_15|READ            ; 4
    bne    LF222                 ; 2³
    jmp    LF2CF                 ; 3

LF222:
    lda    sc_15|READ            ; 4
    and    #$04                  ; 2
    bne    LF264                 ; 2³
    sta    PF0                   ; 3
LF22B:
    lda    INTIM                 ; 4
    bne    LF22B                 ; 2³
    ldx    #2                    ; 2
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    VSYNC                 ; 3
    stx    VBLANK                ; 3
LF238:
    stx    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    LF238                 ; 2³
    stx    WSYNC                 ; 3
;---------------------------------------
    inx                          ; 2
    stx    VSYNC                 ; 3
    ldx    #$29                  ; 2
    stx    TIM64T                ; 4
LF247:
    lda    INTIM                 ; 4
    bne    LF247                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    lda    #$DF                  ; 2
    sta    TIM64T                ; 4
    jsr    LFC81                 ; 6
LF258:
    lda    INTIM                 ; 4
    bne    LF258                 ; 2³
    lda    #$2C                  ; 2
    sta    TIM64T                ; 4
    bne    LF267                 ; 3   always branch

LF264:
    jsr    LFC81                 ; 6
LF267:
    lda    sc_15|READ            ; 4
    and    #$FD                  ; 2
    sta    sc_15                 ; 4
    jmp    LFFE4                 ; 3   goto LDB92

LF272:
    ldx    sc_09|READ            ; 4
    dex                          ; 2
    stx    sc_09                 ; 4
    beq    LF2A0                 ; 2³
    cpx    #$60                  ; 2
    bne    LF289                 ; 2³
    ldy    #7                    ; 2
    lda    #0                    ; 2
LF283:
    sta    sc_71,Y               ; 5
    dey                          ; 2
    bpl    LF283                 ; 2³
LF289:
    cpx    #$54                  ; 2
    bne    LF292                 ; 2³
    ldy    #$12                  ; 2
    jsr    LF2C8                 ; 6
LF292:
    txa                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LFFCF,X               ; 4
    sta    sc_14                 ; 4
    bne    LF2BC                 ; 2³
LF2A0:
    lda    sc_15|READ            ; 4
    and    #$F7                  ; 2
    sta    sc_15                 ; 4
    lda    numOfLives|READ       ; 4
    and    #$DF                  ; 2
    sta    numOfLives            ; 4
    tax                          ; 2
    and    #$07                  ; 2
    bne    LF2B8                 ; 2³
    jmp    LF121                 ; 3

LF2B8:

  IF INFINITE_LIVES
    nop                          ; 2   do nothing instead of decreasing lives
  ELSE
    dex                          ; 2   regular code decreases the lives by 1
  ENDIF

    stx    numOfLives            ; 4
LF2BC:
    jmp    LFFE4                 ; 3   goto LDB92

LF2BF:
    .byte $00 ; |        | $F2BF
    .byte $0B ; |    X XX| $F2C0
    .byte $16 ; |   X XX | $F2C1
    .byte $12 ; |   X  X | $F2C2
    .byte $CD ; |XX  XX X| $F2C3
    .byte $F9 ; |XXXXX  X| $F2C4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;is bus contention an issue here?

LF2C5 SUBROUTINE
    sta    BANK_1                ; 4   bankswitch, goto LB2AE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF2C8 SUBROUTINE
    cpy    ram_D3                ; 3
    bcc    LF2CE                 ; 2³
    sty    ram_D3                ; 3
LF2CE:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF2CF:
    lda    framecounter          ; 3
    tax                          ; 2
    and    #$07                  ; 2
    tay                          ; 2
    and    #$03                  ; 2
    bne    LF2DC                 ; 2³
    jmp    LF843                 ; 3

LF2DC:
    txa                          ; 2
    ldx    #0                    ; 2
    and    #$18                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_D5                ; 3
    lda    ram_F3                ; 3
    and    #$01                  ; 2
    clc                          ; 2
    adc    ram_D5                ; 3
    tax                          ; 2
    lda    LFFC7,Y               ; 4
    and    LFFB0,X               ; 4
    bne    LF309                 ; 2³+1
    lda    ram_F3                ; 3
    lsr                          ; 2
    and    #$01                  ; 2
    clc                          ; 2
    adc    ram_D5                ; 3
    tax                          ; 2
    lda    LFFC7,Y               ; 4
    and    LFFB8,X               ; 4
    beq    LF2BC                 ; 2³+1
    jmp    LFFED                 ; 3   goto LD66B

LF309:
    ldx    #2                    ; 2
    lda    ram_F6                ; 3
    tay                          ; 2
    and    #$80                  ; 2
    sta    ram_D1                ; 3
    tya                          ; 2
    and    #$03                  ; 2
    beq    LF31C                 ; 2³
    sec                          ; 2
    sbc    #1                    ; 2
    bpl    LF31D                 ; 2³
LF31C:
    txa                          ; 2
LF31D:
    sta    ram_D2                ; 3
    tya                          ; 2
    and    #$7C                  ; 2
    ora    ram_D2                ; 3
    sta    ram_F6                ; 3
    stx    ram_DA                ; 3
    lda    sc_15|READ            ; 4
    bpl    LF35E                 ; 2³
    lda    sc_0F|READ            ; 4
    lsr                          ; 2
    bcs    LF336                 ; 2³
    jmp    LFFE4                 ; 3   goto LDB92

LF336:
    ldy    sc_1A|READ            ; 4
    lda    LFB0F,Y               ; 4
    bpl    LF346                 ; 2³
    asl                          ; 2
    bpl    LF346                 ; 2³
    lda    sc_7A|READ            ; 4
    bpl    LF349                 ; 2³
LF346:
    lda    sc_0A|READ            ; 4
LF349:
    cmp    LFB1F,Y               ; 4
    bne    LF358                 ; 2³
    cpy    #$0F                  ; 2
    bne    LF354                 ; 2³
    ldy    #3                    ; 2
LF354:
    iny                          ; 2
    sty    sc_1A                 ; 4
LF358:
    lda    LFB0F,Y               ; 4
    jmp    LF3F0                 ; 3

LF35E:
    lda    sc_15|READ            ; 4
    lsr                          ; 2
    bcc    LF3AD                 ; 2³
    lda    sc_0A|READ            ; 4
    cmp    #$3C                  ; 2
    beq    LF378                 ; 2³
    cmp    #$5C                  ; 2
    bne    LF374                 ; 2³
    ldy    #$13                  ; 2
    jsr    LF2C8                 ; 6
LF374:
    lda    #$BF                  ; 2
    bmi    LF3F0                 ; 3   always branch

LF378:
    lda    sc_7A|READ            ; 4
    cmp    #$15                  ; 2
    beq    LF383                 ; 2³
    lda    #$DF                  ; 2
    bmi    LF3F0                 ; 3   always branch

LF383:
    lda    #$42                  ; 2
    sta    sc_14                 ; 4
    lda    #$7F                  ; 2
    sta    ram_F1                ; 3
    lda    #$FE                  ; 2
    and    sc_15|READ            ; 4
    ora    #$08                  ; 2
    sta    sc_15                 ; 4
    lda    ram_F6                ; 3
    ora    #$80                  ; 2
    sta    ram_F6                ; 3
    ldy    #6                    ; 2
LF39E:
    lda.wy ram_F9,Y              ; 4
    bpl    LF3A8                 ; 2³
    and    #$BF                  ; 2
    sta.wy ram_F9,Y              ; 5
LF3A8:
    dey                          ; 2
    bpl    LF39E                 ; 2³
    bmi    LF40A                 ; 3+1   always branch

LF3AD:
    lda    numOfLives|READ       ; 4
    and    #$30                  ; 2
    beq    LF3BC                 ; 2³
    ldy    #4                    ; 2
    jsr    LF2C8                 ; 6
    jmp    LF40A                 ; 3

LF3BC:
    lda    INPT4                 ; 3
    bmi    LF3D1                 ; 2³
    lda    ram_F3                ; 3
    and    #$E0                  ; 2
    cmp    #$20                  ; 2
    beq    LF3D9                 ; 2³
    lda    ram_F6                ; 3
    ora    #$80                  ; 2
    sta    ram_F6                ; 3
    jmp    LFFEA                 ; 3   goto LD1A7

LF3D1:
    lda    ram_F3                ; 3
    bmi    LF3D9                 ; 2³
    and    #$9F                  ; 2
    sta    ram_F3                ; 3
LF3D9:
    lda    SWCHA                 ; 4
    sta    ram_D5                ; 3
    lda    ram_F1                ; 3
    eor    #$FF                  ; 2
    bit    ram_D5                ; 3
    bne    LF3EE                 ; 2³
    ora    ram_D5                ; 3
    cmp    #$FF                  ; 2
    beq    LF3EE                 ; 2³
    sta    ram_D5                ; 3
LF3EE:
    lda    ram_D5                ; 3
LF3F0:
    bpl    LF40D                 ; 2³+1
    asl                          ; 2
    bpl    LF410                 ; 2³+1
    asl                          ; 2
    bpl    LF416                 ; 2³+1
    asl                          ; 2
    bpl    LF413                 ; 2³+1
    lda    ram_F6                ; 3
    ora    #$80                  ; 2
    sta    ram_F6                ; 3
    lda    ram_F3                ; 3
    bmi    LF40A                 ; 2³
    lda    #0                    ; 2
    sta    sc_79                 ; 4
LF40A:
    jmp    LFFE4                 ; 3   goto LDB92

LF40D:
    jmp    LF550                 ; 3

LF410:
    jmp    LF5E0                 ; 3

LF413:
    jmp    LF4AD                 ; 3

LF416:
    lda    sc_0A|READ            ; 4
    cmp    #$3C                  ; 2
    bcc    LF41F                 ; 2³
    sbc    #$3C                  ; 2
LF41F:
    cmp    #$30                  ; 2
    bcc    LF425                 ; 2³
    sbc    #$30                  ; 2
LF425:
    tax                          ; 2
    lda    ram_F1                ; 3
    ldy    LFF80,X               ; 4
    beq    LF430                 ; 2³
    tay                          ; 2
    bne    LF3F0                 ; 2³+1
LF430:
    cmp    #$DF                  ; 2
    bne    LF43C                 ; 2³
    lda    ram_D1                ; 3
    bmi    LF43C                 ; 2³
    lda    ram_D2                ; 3
    bne    LF40A                 ; 2³
LF43C:
    ldx    #$4A                  ; 2
    cpx    sc_14|READ            ; 4
    bne    LF444                 ; 2³
    inx                          ; 2
LF444:
    stx    sc_14                 ; 4
    lda    #$DF                  ; 2
    sta    ram_F1                ; 3
    ldx    sc_7A|READ            ; 4
    dex                          ; 2
    beq    LF478                 ; 2³
    ldx    #9                    ; 2
    ldy    #$18                  ; 2
    lda    #$0B                  ; 2
    jsr    LFBA2                 ; 6
    bmi    LF463                 ; 2³
    lda    #$EF                  ; 2
    sta    ram_F1                ; 3
    jmp    LF779                 ; 3

LF463:
    ldx    sc_7A|READ            ; 4
    dex                          ; 2
    stx    sc_7A                 ; 4
    txa                          ; 2
    and    #$03                  ; 2
    sta    ram_DD                ; 3
    beq    LF47B                 ; 2³
    cmp    #3                    ; 2
    beq    LF47B                 ; 2³
    jsr    LF7E4                 ; 6
LF478:
    jmp    LF66F                 ; 3

LF47B:
    txa                          ; 2
    lsr                          ; 2
    sec                          ; 2
    sbc    #1                    ; 2
    sta    ram_D6                ; 3
    ldy    sc_0A|READ            ; 4
    jsr    LFC5B                 ; 6
    jsr    LF7E4                 ; 6
    ldy    ram_DD                ; 3
    lda    sc_0A|READ            ; 4
    ldx    #0                    ; 2
LF492:
    sec                          ; 2
    sbc    #$0C                  ; 2
    bmi    LF49A                 ; 2³
    inx                          ; 2
    bpl    LF492                 ; 2³
LF49A:
    stx    ram_D5                ; 3
    cpy    #3                    ; 2
    bne    LF4A6                 ; 2³
    lda    #$3C                  ; 2
    sta    ram_D9                ; 3
    bpl    LF4AA                 ; 3   always branch

LF4A6:
    lda    #$0C                  ; 2
    sta    ram_D9                ; 3
LF4AA:
    jmp    LF783                 ; 3

LF4AD:
    lda    sc_0A|READ            ; 4
    cmp    #$3C                  ; 2
    bcc    LF4B6                 ; 2³
    sbc    #$3C                  ; 2
LF4B6:
    cmp    #$30                  ; 2
    bcc    LF4BC                 ; 2³
    sbc    #$30                  ; 2
LF4BC:
    tax                          ; 2
    lda    ram_F1                ; 3
    ldy    LFF80,X               ; 4
    beq    LF4C8                 ; 2³
    tay                          ; 2
    jmp    LF3F0                 ; 3

LF4C8:
    cmp    #$EF                  ; 2
    bne    LF4D7                 ; 2³
    lda    ram_D1                ; 3
    bmi    LF4D7                 ; 2³
    lda    ram_D2                ; 3
    beq    LF4D7                 ; 2³
    jmp    LFFE4                 ; 3   goto LDB92

LF4D7:
    ldx    #$48                  ; 2
    cpx    sc_14|READ            ; 4
    bne    LF4DF                 ; 2³
    inx                          ; 2
LF4DF:
    stx    sc_14                 ; 4
    lda    #$EF                  ; 2
    sta    ram_F1                ; 3
    ldx    sc_7A|READ            ; 4
    cpx    #$29                  ; 2
    bne    LF4F8                 ; 2³
    lda    #$42                  ; 2
    sta    sc_14                 ; 4
    lda    #$7F                  ; 2
    sta    ram_F1                ; 3
    bpl    LF512                 ; 3+1   always branch

LF4F8:
    ldx    #9                    ; 2
    ldy    #$18                  ; 2
    lda    #5                    ; 2
    jsr    LFBA2                 ; 6
    bpl    LF512                 ; 2³
    ldx    sc_7A|READ            ; 4
    inx                          ; 2
    stx    sc_7A                 ; 4
    txa                          ; 2
    and    #$02                  ; 2
    bne    LF515                 ; 2³
    jsr    LF7F3                 ; 6
LF512:
    jmp    LF66F                 ; 3

LF515:
    lda    sc_7A|READ            ; 4
    lsr                          ; 2
    sec                          ; 2
    sbc    #1                    ; 2
    sta    ram_D6                ; 3
    inx                          ; 2
    txa                          ; 2
    lsr                          ; 2
    ldy    sc_0A|READ            ; 4
    jsr    LFC5B                 ; 6
    jsr    LF7F3                 ; 6
    lda    sc_7A|READ            ; 4
    and    #$03                  ; 2
    tay                          ; 2
    lda    sc_0A|READ            ; 4
    ldx    #0                    ; 2
LF535:
    sec                          ; 2
    sbc    #$0C                  ; 2
    bmi    LF53D                 ; 2³
    inx                          ; 2
    bpl    LF535                 ; 2³
LF53D:
    stx    ram_D5                ; 3
    cpy    #2                    ; 2
    bne    LF549                 ; 2³
    lda    #$30                  ; 2
    sta    ram_D9                ; 3
    bpl    LF54D                 ; 3   always branch

LF549:
    lda    #$F0                  ; 2
    sta    ram_D9                ; 3
LF54D:
    jmp    LF783                 ; 3

LF550:
    lda    sc_7A|READ            ; 4
    and    #$03                  ; 2
    cmp    #1                    ; 2
    beq    LF55E                 ; 2³
    lda    ram_F1                ; 3
    jmp    LF3F0                 ; 3

LF55E:
    ldy    ram_D2                ; 3
    lda    LFFD7,Y               ; 4
    sta    sc_14                 ; 4
    lda    #$7F                  ; 2
    sta    ram_F1                ; 3
    ldx    sc_0A|READ            ; 4
    cpx    #$78                  ; 2
    beq    LF5AB                 ; 2³
    ldx    #9                    ; 2
    ldy    #$11                  ; 2
    txa                          ; 2
    jsr    LFBA2                 ; 6
    bmi    LF582                 ; 2³
    lda    #$BF                  ; 2
    sta    ram_F1                ; 3
    jmp    LF779                 ; 3

LF582:
    lda    ram_F8                ; 3
    cmp    #$D4                  ; 2
    bcc    LF59A                 ; 2³
    lda    sc_7A|READ            ; 4
    cmp    sc_78|READ            ; 4
    bne    LF59A                 ; 2³
    lda    sc_0A|READ            ; 4
    adc    #4                    ; 2
    cmp    sc_08|READ            ; 4
    beq    LF5AB                 ; 2³
LF59A:
    ldx    sc_0A|READ            ; 4
    inx                          ; 2
    stx    sc_0A                 ; 4
    txa                          ; 2
    and    #$03                  ; 2
    cmp    #1                    ; 2
    beq    LF5AE                 ; 2³
    jsr    LF813                 ; 6
LF5AB:
    jmp    LF66F                 ; 3

LF5AE:
    txa                          ; 2
    clc                          ; 2
    adc    #7                    ; 2
    tay                          ; 2
    lda    sc_7A|READ            ; 4
    lsr                          ; 2
    sta    ram_D6                ; 3
    jsr    LFC21                 ; 6
    jsr    LF813                 ; 6
    lda    sc_0A|READ            ; 4
    clc                          ; 2
    adc    #3                    ; 2
    ldx    #0                    ; 2
    sec                          ; 2
LF5C8:
    sbc    #$0C                  ; 2
    bmi    LF5CF                 ; 2³
    inx                          ; 2
    bpl    LF5C8                 ; 2³
LF5CF:
    adc    #$0C                  ; 2
    ora    #$FC                  ; 2
    cmp    #$FC                  ; 2
    bne    LF5AB                 ; 2³
    lda    #$28                  ; 2
    sta    ram_D9                ; 3
    stx    ram_D5                ; 3
    jmp    LF783                 ; 3

LF5E0:
    lda    sc_7A|READ            ; 4
    and    #$03                  ; 2
    cmp    #1                    ; 2
    beq    LF5EE                 ; 2³
    lda    ram_F1                ; 3
    jmp    LF3F0                 ; 3

LF5EE:
    ldy    ram_D2                ; 3
    lda    LFFDA,Y               ; 4
    sta    sc_14                 ; 4
    lda    #$BF                  ; 2
    sta    ram_F1                ; 3
    ldx    sc_0A|READ            ; 4
    beq    LF639                 ; 2³+1
    ldx    #9                    ; 2
    ldy    #$1F                  ; 2
    txa                          ; 2
    jsr    LFBA2                 ; 6
    bmi    LF610                 ; 2³
    lda    #$7F                  ; 2
    sta    ram_F1                ; 3
    jmp    LF779                 ; 3

LF610:
    lda    ram_F8                ; 3
    cmp    #$D4                  ; 2
    bcc    LF628                 ; 2³
    lda    sc_7A|READ            ; 4
    cmp    sc_78|READ            ; 4
    bne    LF628                 ; 2³
    lda    sc_08|READ            ; 4
    adc    #4                    ; 2
    cmp    sc_0A|READ            ; 4
    beq    LF639                 ; 2³
LF628:
    ldx    sc_0A|READ            ; 4
    dex                          ; 2
    stx    sc_0A                 ; 4
    txa                          ; 2
    and    #$03                  ; 2
    cmp    #3                    ; 2
    beq    LF63C                 ; 2³
    jsr    LF824                 ; 6
LF639:
    jmp    LF66F                 ; 3

LF63C:
    txa                          ; 2
    and    #$FC                  ; 2
    tay                          ; 2
    lda    sc_7A|READ            ; 4
    lsr                          ; 2
    sta    ram_D6                ; 3
    jsr    LFC21                 ; 6
    jsr    LF824                 ; 6
    lda    sc_0A|READ            ; 4
    sec                          ; 2
    sbc    #4                    ; 2
    bmi    LF66F                 ; 2³
    ldx    #0                    ; 2
LF656:
    sbc    #$0C                  ; 2
    bmi    LF65D                 ; 2³
    inx                          ; 2
    bpl    LF656                 ; 2³
LF65D:
    adc    #$0C                  ; 2
    and    #$03                  ; 2
    cmp    #3                    ; 2
    bne    LF66F                 ; 2³
    lda    #$14                  ; 2
    sta    ram_D9                ; 3
    inx                          ; 2
    stx    ram_D5                ; 3
    jmp    LF783                 ; 3

LF66F:
    lda    ram_F3                ; 3
    lsr                          ; 2
    bcc    LF679                 ; 2³
    lda    #0                    ; 2
    sta    sc_79                 ; 4
LF679:
    lda    #$7F                  ; 2
    and    ram_F3                ; 3
    sta    ram_F3                ; 3
    lda    numOfLives|READ       ; 4
    and    #$F7                  ; 2
    sta    numOfLives            ; 4
    lda    ram_F1                ; 3
    rol                          ; 2
    bcc    LF6B2                 ; 2³
    rol                          ; 2
    bcc    LF695                 ; 2³
    rol                          ; 2
    bcs    LF698                 ; 2³
    jmp    LF770                 ; 3

LF695:
    jmp    LF732                 ; 3

LF698:
    ldx    #9                    ; 2
    ldy    #$18                  ; 2
    lda    #3                    ; 2
    jsr    LFBA2                 ; 6
    bpl    LF6AE                 ; 2³
LF6A3:
    ldx    #9                    ; 2
    ldy    #$18                  ; 2
    lda    #5                    ; 2
    jsr    LFBA2                 ; 6
    bmi    LF714                 ; 2³+1
LF6AE:
    lda    #$40                  ; 2
    bpl    LF6EC                 ; 3   always branch

LF6B2:
    lda    #$50                  ; 2
    and    sc_15|READ            ; 4
    bne    LF717                 ; 2³+1
    ldx    #9                    ; 2
    ldy    #$11                  ; 2
    lda    #5                    ; 2
    jsr    LFBA2                 ; 6
    bmi    LF6DB                 ; 2³
    sty    ram_DD                ; 3
    lda    LFF50,Y               ; 4
    clc                          ; 2
    adc    #5                    ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LFF58,Y               ; 4
    clc                          ; 2
    adc    #$1C                  ; 2
    tay                          ; 2
    txa                          ; 2
    jsr    LFBED                 ; 6
    beq    LF6E8                 ; 2³
LF6DB:
    ldx    #9                    ; 2
    ldy    #$15                  ; 2
    lda    #5                    ; 2
    jsr    LFBA2                 ; 6
    bmi    LF6A3                 ; 2³
    bpl    LF6EA                 ; 3   always branch

LF6E8:
    ldy    ram_DD                ; 3
LF6EA:
    lda    #$20                  ; 2
LF6EC:
    bit    ram_F8                ; 3
    bmi    LF6FA                 ; 2³
    ora    sc_15|READ            ; 4
    sta    sc_15                 ; 4
    sty    ram_F8                ; 3
    bpl    LF714                 ; 2³+1
LF6FA:
    bvs    LF706                 ; 2³+1
    lda    ram_F8                ; 3
    and    #$07                  ; 2
    sta    ram_D5                ; 3
    cpy    ram_D5                ; 3
    beq    LF714                 ; 2³
LF706:
    ora    sc_15|READ            ; 4
    sta    sc_15                 ; 4
    tya                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    ram_F4                ; 3
    sta    ram_F4                ; 3
LF714:
    jmp    LFFE4                 ; 3   goto LDB92

LF717:
    lda    ram_F8                ; 3
    bmi    LF72A                 ; 2³
    ora    #$80                  ; 2
    sta    ram_F8                ; 3
    lda    sc_15|READ            ; 4
    and    #$8F                  ; 2
    sta    sc_15                 ; 4
LF727:
    jmp    LFFE4                 ; 3   goto LDB92

LF72A:
    lda    ram_F4                ; 3
    ora    #$80                  ; 2
    sta    ram_F4                ; 3
    bmi    LF727                 ; 3   always branch

LF732:
    lda    #$60                  ; 2
    and    sc_15|READ            ; 4
    bne    LF717                 ; 2³
    ldx    #9                    ; 2
    ldy    #$1F                  ; 2
    lda    #5                    ; 2
    jsr    LFBA2                 ; 6
    bmi    LF75B                 ; 2³
    sty    ram_DD                ; 3
    lda    LFF50,Y               ; 4
    clc                          ; 2
    adc    #5                    ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LFF58,Y               ; 4
    clc                          ; 2
    adc    #$18                  ; 2
    tay                          ; 2
    txa                          ; 2
    jsr    LFBED                 ; 6
    beq    LF769                 ; 2³
LF75B:
    ldx    #9                    ; 2
    ldy    #$1B                  ; 2
    lda    #5                    ; 2
    jsr    LFBA2                 ; 6
    bpl    LF76B                 ; 2³
    jmp    LF6A3                 ; 3

LF769:
    ldy    ram_DD                ; 3
LF76B:
    lda    #$10                  ; 2
    jmp    LF6EC                 ; 3

LF770:
    lda    #$70                  ; 2
    and    sc_15|READ            ; 4
    bne    LF717                 ; 2³
    beq    LF714                 ; 3   always branch

LF779:
    lda    numOfLives|READ       ; 4
    ora    #$08                  ; 2
    sta    numOfLives            ; 4
    bne    LF714                 ; 3   always branch

LF783:
    lda    ram_D6                ; 3
    tax                          ; 2
    lsr                          ; 2
    bcc    LF78A                 ; 2³
    inx                          ; 2
LF78A:
    txa                          ; 2
    clc                          ; 2
    adc    #4                    ; 2
    sta    ram_D6                ; 3
    bit    ram_D9                ; 3
    bpl    LF79B                 ; 2³
    ldx    ram_D5                ; 3
    ldy    ram_D6                ; 3
    jsr    LFB2F                 ; 6
LF79B:
    asl    ram_D9                ; 5
    bpl    LF7A7                 ; 2³
    ldx    ram_D5                ; 3
    dex                          ; 2
    ldy    ram_D6                ; 3
    jsr    LFB2F                 ; 6
LF7A7:
    asl    ram_D9                ; 5
    bpl    LF7B4                 ; 2³
    ldx    ram_D5                ; 3
    ldy    ram_D6                ; 3
    dey                          ; 2
    dey                          ; 2
    jsr    LFB2F                 ; 6
LF7B4:
    asl    ram_D9                ; 5
    bpl    LF7C2                 ; 2³
    ldx    ram_D5                ; 3
    dex                          ; 2
    ldy    ram_D6                ; 3
    dey                          ; 2
    dey                          ; 2
    jsr    LFB2F                 ; 6
LF7C2:
    asl    ram_D9                ; 5
    bpl    LF7D1                 ; 2³
    ldx    ram_D5                ; 3
    lda    ram_D6                ; 3
    sec                          ; 2
    sbc    #4                    ; 2
    tay                          ; 2
    jsr    LFB2F                 ; 6
LF7D1:
    asl    ram_D9                ; 5
    bpl    LF7E1                 ; 2³
    ldx    ram_D5                ; 3
    dex                          ; 2
    lda    ram_D6                ; 3
    sec                          ; 2
    sbc    #4                    ; 2
    tay                          ; 2
    jsr    LFB2F                 ; 6
LF7E1:
    jmp    LF66F                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF7E4 SUBROUTINE
    lda    ram_F3                ; 3
    lsr                          ; 2
    bcs    LF80F                 ; 2³+1
    ldx    sc_7A|READ            ; 4
    dex                          ; 2
    bmi    LF80F                 ; 2³+1
    ldy    #$CC                  ; 2
    bne    LF802                 ; 3+1   always branch

LF7F3 SUBROUTINE
    lda    ram_F3                ; 3
    lsr                          ; 2
    bcs    LF80F                 ; 2³+1
    ldx    sc_7A|READ            ; 4
    inx                          ; 2
    cpx    #$2C                  ; 2
    bcs    LF80F                 ; 2³
    ldy    #7                    ; 2
LF802:
    lda    sc_0A|READ            ; 4
    sta    sc_09                 ; 4
    sty    sc_13                 ; 4
LF80B:
    stx    sc_79                 ; 4
    rts                          ; 6

LF80F:
    ldx    #0                    ; 2
    beq    LF80B                 ; 3   always branch

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF813 SUBROUTINE
    lda    ram_F3                ; 3
    lsr                          ; 2
    bcs    LF83F                 ; 2³
    ldx    sc_0A|READ            ; 4
    cpx    #$78                  ; 2
    bcs    LF83F                 ; 2³
    inx                          ; 2
    ldy    #$CA                  ; 2
    bne    LF832                 ; 3   always branch

LF824 SUBROUTINE
    lda    ram_F3                ; 3
    lsr                          ; 2
    bcs    LF83F                 ; 2³
    ldx    sc_0A|READ            ; 4
    dex                          ; 2
    dex                          ; 2
    bmi    LF83F                 ; 2³
    ldy    #$CB                  ; 2
LF832:
    sty    sc_13                 ; 4
    stx    sc_09                 ; 4
    lda    sc_7A|READ            ; 4
LF83B:
    sta    sc_79                 ; 4
    rts                          ; 6

LF83F:
    lda    #0                    ; 2
    beq    LF83B                 ; 3   always branch

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF843:
    lda    #1                    ; 2
    sta    ram_DA                ; 3
    sta    ram_CA                ; 3
    lda    ram_F8                ; 3
    bpl    LF883                 ; 2³
    bit    ram_F8                ; 3
    bvs    LF886                 ; 2³
    and    #$07                  ; 2
    tax                          ; 2
    lda    #$18                  ; 2
    clc                          ; 2
    adc    LFF58,X               ; 4
    sta    sc_08                 ; 4
    lda    #9                    ; 2
    clc                          ; 2
    adc    LFF50,X               ; 4
    sta    sc_78                 ; 4
    lda    #5                    ; 2
    sta    sc_12                 ; 4
    lda    LFFC0,X               ; 4
    eor    #$FF                  ; 2
    and    ram_8F                ; 3
    sta    ram_8F                ; 3
    lda    #$C0                  ; 2
    sta    ram_F8                ; 3
    lda    ram_F7                ; 3
    ora    #$78                  ; 2
    sta    ram_F7                ; 3
    ldy    #$0B                  ; 2
    jsr    LF2C8                 ; 6
LF883:
    jmp    LFA5D                 ; 3

LF886:
    and    #$3F                  ; 2
    cmp    #$10                  ; 2
    bcs    LF89D                 ; 2³
    ldy    #5                    ; 2
    lda    #4                    ; 2
    bit    ram_F8                ; 3
    bne    LF896                 ; 2³
    ldy    #$85                  ; 2
LF896:
    sty    sc_12                 ; 4
LF899:
    inc    ram_F8                ; 5
    bne    LF883                 ; 2³
LF89D:
    cmp    #$20                  ; 2
    bne    LF8A4                 ; 2³
    jmp    LF9BE                 ; 3

LF8A4:
    cmp    #$14                  ; 2
    bcc    LF8BF                 ; 2³
    cmp    #$1C                  ; 2
    bcc    LF8B0                 ; 2³
    lda    #$89                  ; 2
    bne    LF8BA                 ; 3   always branch

LF8B0:
    cmp    #$18                  ; 2
    bcc    LF8B8                 ; 2³
    lda    #$87                  ; 2
    bne    LF8BA                 ; 3   always branch

LF8B8:
    lda    #5                    ; 2
LF8BA:
    sta    sc_12                 ; 4
    bne    LF899                 ; 3   always branch

LF8BF:
    ldx    #9                    ; 2
    jsr    LFE6C                 ; 6
    bmi    LF8E1                 ; 2³
    lda    numOfLives|READ       ; 4
    ora    #$20                  ; 2
    sta    numOfLives            ; 4
    ldx    sc_78|READ            ; 4
    dex                          ; 2
    dex                          ; 2
    stx    sc_7A                 ; 4
    lda    ram_F3                ; 3
    and    #$1F                  ; 2
    sta    ram_F3                ; 3
    lda    #0                    ; 2
    sta    sc_79                 ; 4
LF8E1:
    ldy    #0                    ; 2
    ldx    #6                    ; 2
LF8E5:
    lda    ram_F9,X              ; 4
    bpl    LF908                 ; 2³+1
    jsr    LFE6C                 ; 6
    bmi    LF908                 ; 2³+1
    iny                          ; 2
    lda    sc_78|READ            ; 4
    sec                          ; 2
    sbc    #2                    ; 2
    sta    sc_71,X               ; 5
    lda    ram_F9,X              ; 4
    ora    #$40                  ; 2
    sta    ram_F9,X              ; 4
    lda    sc_16|READ,X          ; 4
    and    #$F0                  ; 2
    ora    #$10                  ; 2
    sta    sc_16,X               ; 5
LF908:
    dex                          ; 2
    bpl    LF8E5                 ; 2³+1
    sty    ram_D6                ; 3
    ldx    #7                    ; 2
    ldy    #$18                  ; 2
    lda    #$0B                  ; 2
    jsr    LFBA2                 ; 6
    bpl    LF943                 ; 2³
    ldy    sc_78|READ            ; 4
    dey                          ; 2
    beq    LF943                 ; 2³
    tya                          ; 2
    and    #$03                  ; 2
    beq    LF929                 ; 2³
    cmp    #3                    ; 2
    beq    LF97A                 ; 2³
    bne    LF98A                 ; 3   always branch

LF929:
    dey                          ; 2
    tya                          ; 2
    lsr                          ; 2
    ldy    sc_08|READ            ; 4
    jsr    LFBED                 ; 6
    beq    LF98A                 ; 2³
    ldy    sc_08|READ            ; 4
    lda    sc_78|READ            ; 4
    sec                          ; 2
    sbc    #4                    ; 2
    lsr                          ; 2
    jsr    LFC0F                 ; 6
    beq    LF946                 ; 2³
LF943:
    jmp    LF9A0                 ; 3

LF946:
    ldy    sc_08|READ            ; 4
    lda    sc_78|READ            ; 4
    sec                          ; 2
    sbc    #2                    ; 2
    lsr                          ; 2
    sta    ram_D8                ; 3
    ldx    ram_F3                ; 3
    jsr    LFC5B                 ; 6
    stx    ram_F3                ; 3
    lda    sc_08|READ            ; 4
    ldx    #0                    ; 2
LF95E:
    sec                          ; 2
    sbc    #$0C                  ; 2
    bmi    LF966                 ; 2³
    inx                          ; 2
    bpl    LF95E                 ; 2³
LF966:
    stx    ram_D5                ; 3
    ldy    ram_D8                ; 3
    iny                          ; 2
    jsr    LFB2F                 ; 6
    ldx    ram_D5                ; 3
    dex                          ; 2
    ldy    ram_D8                ; 3
    iny                          ; 2
    jsr    LFB2F                 ; 6
    jmp    LF98A                 ; 3

LF97A:
    ldy    sc_78|READ            ; 4
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    tya                          ; 2
    lsr                          ; 2
    ldy    sc_08|READ            ; 4
    jsr    LFC0F                 ; 6
    bne    LF9A0                 ; 2³
LF98A:
    lda    ram_F8                ; 3
    cmp    #$D3                  ; 2
    bne    LF992                 ; 2³
    lda    #$CF                  ; 2
LF992:
    clc                          ; 2
    adc    #1                    ; 2
    sta    ram_F8                ; 3
    ldy    sc_78|READ            ; 4
    dey                          ; 2
    sty    sc_78                 ; 4
    bpl    LF9BB                 ; 2³
LF9A0:
    lda    #$40                  ; 2
    bit    ram_F6                ; 3
    beq    LF9A8                 ; 2³
    lda    #$20                  ; 2
LF9A8:
    ora    ram_F6                ; 3
    sta    ram_F6                ; 3
    ldy    #6                    ; 2
    lda    ram_D6                ; 3
    beq    LF9B4                 ; 2³
    ldy    #5                    ; 2
LF9B4:
    jsr    LF2C8                 ; 6
    lda    #$D4                  ; 2
    sta    ram_F8                ; 3
LF9BB:
    jmp    LFA5D                 ; 3

LF9BE:
    ldy    #0                    ; 2
    sty    ram_CA                ; 3
    ldx    #6                    ; 2
LF9C4:
    lda    ram_F9,X              ; 4
    bpl    LF9EF                 ; 2³
    lda    sc_16|READ,X          ; 4
    and    #$10                  ; 2
    beq    LF9EF                 ; 2³
    iny                          ; 2
    lda    ram_F6                ; 3
    and    #$1C                  ; 2
    cmp    #$1C                  ; 2
    bne    LF9E6                 ; 2³
    txa                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    #$E3                  ; 2
    and    ram_F6                ; 3
    sta    ram_F6                ; 3
    lda    #0                    ; 2
    sta    sc_16,X               ; 5
LF9E6:
    lda    #0                    ; 2
    sta    ram_F9,X              ; 4
    sta    sc_71,X               ; 5
    dec    ram_F4                ; 5
LF9EF:
    dex                          ; 2
    bpl    LF9C4                 ; 2³
    tya                          ; 2
    beq    LFA24                 ; 2³+1
    sec                          ; 2
    sbc    #1                    ; 2
    asl                          ; 2
    tax                          ; 2
    lda    LFF72,X               ; 4
    inx                          ; 2
    ldy    LFF72,X               ; 4
    jsr    LFE94                 ; 6
    ldy    LFF72,X               ; 4
    dex                          ; 2
    lda    LFF72,X               ; 4
    jsr    LFE94                 ; 6
    lda    ram_F4                ; 3
    and    #$07                  ; 2
    cmp    #1                    ; 2
    bne    LFA24                 ; 2³
    ldy    ram_80                ; 3
    beq    LFA1F                 ; 2³
    asl                          ; 2
    ora    ram_F3                ; 3
    sta    ram_F3                ; 3
LFA1F:
    ldy    #$0D                  ; 2
    jsr    LF2C8                 ; 6
LFA24:
    lda    #0                    ; 2
    sta    ram_F8                ; 3
    sta    sc_78                 ; 4
    lda    sc_15|READ            ; 4
    and    #$70                  ; 2
    beq    LFA53                 ; 2³
    lda    ram_F4                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    sta    ram_F8                ; 3
    bit    ram_F4                ; 3
    bpl    LFA4D                 ; 2³
    lda    ram_F8                ; 3
    ora    #$80                  ; 2
    sta    ram_F8                ; 3
    lda    sc_15|READ            ; 4
    and    #$8F                  ; 2
    sta    sc_15                 ; 4
LFA4D:
    lda    ram_F4                ; 3
    and    #$47                  ; 2
    sta    ram_F4                ; 3
LFA53:
    lda    #$20                  ; 2
    and    numOfLives|READ       ; 4
    beq    LFA5D                 ; 2³
    jmp    LFFF0                 ; 3   goto LDAF6

LFA5D:
    lda    ram_F6                ; 3
    tay                          ; 2
    and    #$60                  ; 2
    cmp    #$60                  ; 2
    bne    LFA6D                 ; 2³
    tya                          ; 2
    and    #$1C                  ; 2
    cmp    #$1C                  ; 2
    bne    LFA70                 ; 2³
LFA6D:
    jmp    LFAF9                 ; 3

LFA70:
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    tax                          ; 2
    lda    sc_16|READ,X          ; 4
    and    #$40                  ; 2
    bne    LFAF9                 ; 2³
    lda    #$20                  ; 2
    and    sc_16|READ,X          ; 4
    bne    LFA98                 ; 2³
    lda    #$20                  ; 2
    sta    sc_16,X               ; 5
    lda    sc_7B|READ            ; 4
    clc                          ; 2
    adc    #1                    ; 2
    and    #$07                  ; 2
    ora    sc_16|READ,X          ; 4
    sta    sc_16,X               ; 5
    bne    LFAF9                 ; 2³
LFA98:
    lda    sc_16|READ,X          ; 4
    bmi    LFADF                 ; 2³
    lda    sc_7B|READ            ; 4
    and    #$07                  ; 2
    sta    ram_DD                ; 3
    lda    sc_16|READ,X          ; 4
    and    #$07                  ; 2
    cmp    ram_DD                ; 3
    bne    LFAF9                 ; 2³
    ldy    ram_80                ; 3
    cpy    #$13                  ; 2
    bcc    LFAB5                 ; 2³
    ldy    #$12                  ; 2
LFAB5:
    lda    LFAFC,Y               ; 4
    sta    sc_0B,X               ; 5
    lda    #$3C                  ; 2
    sta    sc_01,X               ; 5
    lda    #$15                  ; 2
    sta    sc_71,X               ; 5
    lda    #$80                  ; 2
    ora    sc_16|READ,X          ; 4
    and    #$F8                  ; 2
    sta    sc_16,X               ; 5
    lda    sc_7B|READ            ; 4
    clc                          ; 2
    adc    #3                    ; 2
    and    #$07                  ; 2
    ora    sc_16|READ,X          ; 4
    sta    sc_16,X               ; 5
    bne    LFAF9                 ; 2³
LFADF:
    lda    sc_7B|READ            ; 4
    and    #$07                  ; 2
    sta    ram_DD                ; 3
    lda    sc_16|READ,X          ; 4
    and    #$07                  ; 2
    cmp    ram_DD                ; 3
    bne    LFAF9                 ; 2³
    lda    #0                    ; 2
    sta    sc_71,X               ; 5
    lda    #$40                  ; 2
    sta    sc_16,X               ; 5
LFAF9:
    jmp    LFFDE                 ; 3   goto LDC9E

LFAFC:
    .byte $83 ; |X     XX| $FAFC
    .byte $83 ; |X     XX| $FAFD
    .byte $0B ; |    X XX| $FAFE
    .byte $0C ; |    XX  | $FAFF
    .byte $C1 ; |XX     X| $FB00
    .byte $C1 ; |XX     X| $FB01
    .byte $C2 ; |XX    X | $FB02
    .byte $C2 ; |XX    X | $FB03
    .byte $C3 ; |XX    XX| $FB04
    .byte $C3 ; |XX    XX| $FB05
    .byte $C4 ; |XX   X  | $FB06
    .byte $C4 ; |XX   X  | $FB07
    .byte $C0 ; |XX      | $FB08
    .byte $C0 ; |XX      | $FB09
    .byte $C5 ; |XX   X X| $FB0A
    .byte $C5 ; |XX   X X| $FB0B
    .byte $0D ; |    XX X| $FB0C
    .byte $0D ; |    XX X| $FB0D
    .byte $C7 ; |XX   XXX| $FB0E
LFB0F:
    .byte $DF ; |XX XXXXX| $FB0F
    .byte $BF ; |X XXXXXX| $FB10
    .byte $EF ; |XXX XXXX| $FB11
    .byte $7F ; | XXXXXXX| $FB12
    .byte $EF ; |XXX XXXX| $FB13
    .byte $7F ; | XXXXXXX| $FB14
    .byte $DF ; |XX XXXXX| $FB15
    .byte $7F ; | XXXXXXX| $FB16
    .byte $DF ; |XX XXXXX| $FB17
    .byte $BF ; |X XXXXXX| $FB18
    .byte $EF ; |XXX XXXX| $FB19
    .byte $EF ; |XXX XXXX| $FB1A
    .byte $7F ; | XXXXXXX| $FB1B
    .byte $DF ; |XX XXXXX| $FB1C
    .byte $BF ; |X XXXXXX| $FB1D
    .byte $EF ; |XXX XXXX| $FB1E
LFB1F:
    .byte $11 ; |   X   X| $FB1F
    .byte $18 ; |   XX   | $FB20
    .byte $15 ; |   X X X| $FB21
    .byte $24 ; |  X  X  | $FB22
    .byte $1C ; |   XXX  | $FB23
    .byte $54 ; | X X X  | $FB24
    .byte $11 ; |   X   X| $FB25
    .byte $78 ; | XXXX   | $FB26
    .byte $05 ; |     X X| $FB27
    .byte $3C ; |  XXXX  | $FB28
    .byte $0A ; |    X X | $FB29
    .byte $25 ; |  X  X X| $FB2A
    .byte $54 ; | X X X  | $FB2B
    .byte $01 ; |       X| $FB2C
    .byte $00 ; |        | $FB2D
    .byte $11 ; |   X   X| $FB2E

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFB2F SUBROUTINE
    lda    #$9D                  ; 2
    sta    ram_DF                ; 3
    tya                          ; 2
    cmp    #1                    ; 2
    bcc    LFBA1                 ; 2³
    cmp    #$13                  ; 2
    bcs    LFBA1                 ; 2³
    asl                          ; 2
    asl                          ; 2
    adc    ram_DF                ; 3
    sta    ram_DF                ; 3
    txa                          ; 2
    bmi    LFBA1                 ; 2³
    cmp    #$0A                  ; 2
    bcs    LFBA1                 ; 2³
    cmp    #5                    ; 2
    bcc    LFB53                 ; 2³
    lda    ram_DF                ; 3
    adc    #1                    ; 2
    sta    ram_DF                ; 3
LFB53:
    txa                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_E3                ; 3
    ldx    #3                    ; 2
LFB5B:
    ldy    #0                    ; 2
    lda    (ram_DF),Y            ; 5
    ora    (ram_E3),Y            ; 5
    cmp    (ram_E3),Y            ; 5
    bne    LFBA1                 ; 2³
    iny                          ; 2
    lda    (ram_DF),Y            ; 5
    ora    (ram_E3),Y            ; 5
    cmp    (ram_E3),Y            ; 5
    bne    LFBA1                 ; 2³
    dex                          ; 2
    beq    LFB80                 ; 2³
    lda    ram_DF                ; 3
    sec                          ; 2
    sbc    #4                    ; 2
    sta    ram_DF                ; 3
    lda    ram_E3                ; 3
    adc    #1                    ; 2
    sta    ram_E3                ; 3
    bne    LFB5B                 ; 2³
LFB80:
    lda    ram_DF                ; 3
    clc                          ; 2
    adc    #4                    ; 2
    sta    ram_DF                ; 3
    sec                          ; 2
    sbc    #$80                  ; 2
    sta    ram_E1                ; 3
    lda    ram_E3                ; 3
    adc    #1                    ; 2
    sta    ram_E3                ; 3
    ldy    #0                    ; 2
    lda    (ram_DF),Y            ; 5
    and    (ram_E3),Y            ; 5
    sta    (ram_E1),Y            ; 6
    iny                          ; 2
    lda    (ram_DF),Y            ; 5
    and    (ram_E3),Y            ; 5
    sta    (ram_E1),Y            ; 6
LFBA1:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFBA2 SUBROUTINE
    sty    ram_E5                ; 3
    sta    ram_E6                ; 3
    ldy    #7                    ; 2
LFBA8:
    lda    ram_E5                ; 3
    clc                          ; 2
    adc    LFF58,Y               ; 4
    cmp    sc_01|READ,X          ; 4
    bne    LFBC7                 ; 2³
    lda    LFFC0,Y               ; 4
    and    ram_8F                ; 3
    beq    LFBC9                 ; 2³
    lda    ram_E6                ; 3
    clc                          ; 2
    adc    LFF50,Y               ; 4
    cmp    sc_71|READ,X          ; 4
    bne    LFBC9                 ; 2³
    beq    LFBCC                 ; 3   always branch

LFBC7:
    dey                          ; 2
    dey                          ; 2
LFBC9:
    dey                          ; 2
    bpl    LFBA8                 ; 2³
LFBCC:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFBCD:
    .byte $7F ; | XXXXXXX| $FBCD
    .byte $BF ; |X XXXXXX| $FBCE
    .byte $DF ; |XX XXXXX| $FBCF
    .byte $EF ; |XXX XXXX| $FBD0
    .byte $F7 ; |XXXX XXX| $FBD1
    .byte $FB ; |XXXXX XX| $FBD2
    .byte $FD ; |XXXXXX X| $FBD3
    .byte $FE ; |XXXXXXX | $FBD4
    .byte $FE ; |XXXXXXX | $FBD5
    .byte $FD ; |XXXXXX X| $FBD6
    .byte $FB ; |XXXXX XX| $FBD7
    .byte $F7 ; |XXXX XXX| $FBD8
    .byte $EF ; |XXX XXXX| $FBD9
    .byte $DF ; |XX XXXXX| $FBDA
    .byte $BF ; |X XXXXXX| $FBDB
    .byte $7F ; | XXXXXXX| $FBDC
    .byte $7F ; | XXXXXXX| $FBDD
    .byte $BF ; |X XXXXXX| $FBDE
    .byte $DF ; |XX XXXXX| $FBDF
    .byte $EF ; |XXX XXXX| $FBE0
    .byte $F7 ; |XXXX XXX| $FBE1
    .byte $FB ; |XXXXX XX| $FBE2
    .byte $FD ; |XXXXXX X| $FBE3
    .byte $FE ; |XXXXXXX | $FBE4
    .byte $FE ; |XXXXXXX | $FBE5
    .byte $FD ; |XXXXXX X| $FBE6
    .byte $FB ; |XXXXX XX| $FBE7
    .byte $F7 ; |XXXX XXX| $FBE8
    .byte $EF ; |XXX XXXX| $FBE9
    .byte $DF ; |XX XXXXX| $FBEA
    .byte $BF ; |X XXXXXX| $FBEB
    .byte $7F ; | XXXXXXX| $FBEC

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFBED SUBROUTINE
    asl                          ; 2
    asl                          ; 2
    sta    ram_DF                ; 3
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_EC                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    ram_DF                ; 3
    sta    ram_DF                ; 3
    tay                          ; 2
LFBFF:
    lda    sc_1D|READ,Y          ; 4
    sta    ram_D0                ; 3
    ldy    ram_EC                ; 3
    lda    LFBCD,Y               ; 4
    ora    ram_D0                ; 3
    cmp    LFBCD,Y               ; 4
LFC0E:
    rts                          ; 6

LFC0F SUBROUTINE
    jsr    LFBED                 ; 6
    bne    LFC0E                 ; 2³
    ldy    ram_DF                ; 3
    inc    ram_EC                ; 5
    lda    ram_EC                ; 3
    and    #$07                  ; 2
    bne    LFBFF                 ; 2³+1
    iny                          ; 2
    bpl    LFBFF                 ; 2³+1

LFC21 SUBROUTINE
    asl                          ; 2
    asl                          ; 2
    sta    ram_DF                ; 3
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_EC                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    ram_DF                ; 3
    sta    ram_DF                ; 3
    tay                          ; 2
    lda    sc_1D|READ,Y          ; 4
    sta    ram_D0                ; 3
    lda    #1                    ; 2
    ora    ram_F3                ; 3
    sta    ram_F3                ; 3
    ldy    ram_EC                ; 3
    lda    LFBCD,Y               ; 4
    and    ram_D0                ; 3
    cmp    ram_D0                ; 3
    beq    LFC80                 ; 2³
    ldy    ram_DF                ; 3
    sta    sc_1D,Y               ; 5
    lda    #$FE                  ; 2
    and    ram_F3                ; 3
    sta    ram_F3                ; 3
    ldy    #0                    ; 2
    lda    #5                    ; 2
    jmp    LFE94                 ; 3

LFC5B SUBROUTINE
    jsr    LFC21                 ; 6
    ldy    ram_DF                ; 3
    inc    ram_EC                ; 5
    lda    ram_EC                ; 3
    and    #$07                  ; 2
    bne    LFC6B                 ; 2³
    iny                          ; 2
    sty    ram_DF                ; 3
LFC6B:
    lda    sc_1D|READ,Y          ; 4
    sta    ram_D0                ; 3
    ldy    ram_EC                ; 3
    lda    LFBCD,Y               ; 4
    and    ram_D0                ; 3
    cmp    ram_D0                ; 3
    beq    LFC80                 ; 2³
    ldy    ram_DF                ; 3
    sta    sc_1D,Y               ; 5
LFC80:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;very long subroutine

LFC81 SUBROUTINE
    lda    #1                    ; 2
    ldx    sc_15|READ            ; 4
    bpl    LFC8C                 ; 2³
    ldx    #0                    ; 2
    beq    LFCB3                 ; 3   always branch

LFC8C:
    ldx    ram_80                ; 3
    cpx    #$7F                  ; 2
    bcc    LFC9E                 ; 2³
    lda    framecounter          ; 3
    and    #$1F                  ; 2
    tax                          ; 2
    lda    ram_80                ; 3
    sec                          ; 2
    sbc    #$6F                  ; 2
    bpl    LFCB3                 ; 2³
LFC9E:
    stx    ram_D5                ; 3
    dex                          ; 2
    bmi    LFCB5                 ; 2³
    cpx    #$0F                  ; 2
    bcc    LFCB5                 ; 2³
    lda    ram_80                ; 3
    and    #$FC                  ; 2
    sta    ram_D5                ; 3
    lda    ram_80                ; 3
    sbc    ram_D5                ; 3
    adc    #$0B                  ; 2
LFCB3:
    sta    ram_D5                ; 3
LFCB5:
    lda    #4                    ; 2
    bit    sc_15|READ            ; 4
    bne    LFD21                 ; 2³+1
    txa                          ; 2
    bpl    LFCC0                 ; 2³
    inx                          ; 2
LFCC0:
    sec                          ; 2
    sbc    #$0C                  ; 2
    bpl    LFCC0                 ; 2³
    adc    #$0C                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LF2BF,X               ; 4
    sta    ram_EB                ; 3
    ldx    #$4F                  ; 2
    lda    #$FF                  ; 2
LFCD3:
    sta    sc_1D,X               ; 5
    dex                          ; 2
    bpl    LFCD3                 ; 2³
    ldy    ram_D5                ; 3
    lda    LFF60,Y               ; 4
    cpy    #$10                  ; 2
    bcc    LFCE4                 ; 2³
    and    framecounter          ; 3
LFCE4:
    sta    ram_8F                ; 3
    ldx    #7                    ; 2
LFCE8:
    lda    LFFC0,X               ; 4
    and    ram_8F                ; 3
    beq    LFCFF                 ; 2³
    lda    #$18                  ; 2
    clc                          ; 2
    adc    LFF58,X               ; 4
    tay                          ; 2
    lda    #9                    ; 2
    adc    LFF50,X               ; 4
    lsr                          ; 2
    jsr    LFC5B                 ; 6
LFCFF:
    dex                          ; 2
    bpl    LFCE8                 ; 2³+1
    lda    #$0F                  ; 2
    sta    sc_46                 ; 4
    sta    sc_47                 ; 4
    lda    sc_15|READ            ; 4
    lsr                          ; 2
    bcs    LFD21                 ; 2³
    lda    #$0B                  ; 2
    sta    ram_D8                ; 3
LFD14:
    ldy    #$3C                  ; 2
    jsr    LFC5B                 ; 6
    inc    ram_D8                ; 5
    lda    ram_D8                ; 3
    cmp    #$14                  ; 2
    bne    LFD14                 ; 2³
LFD21:
    ldy    ram_D5                ; 3
    tya                          ; 2
    ldx    LFEE0,Y               ; 4
    stx    ram_EE                ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    tax                          ; 2
    jsr    LF2C5                 ; 6   goto LB2AE
    cpy    #$10                  ; 2
    bcc    LFD39                 ; 2³
    lda    framecounter          ; 3
    sta    ram_EE                ; 3
    rol                          ; 2
LFD39:
    sta    ram_F0                ; 3
    inx                          ; 2
    txa                          ; 2
    clc                          ; 2
    adc    #7                    ; 2
    sta    ram_D9                ; 3
    lda    #0                    ; 2
    sta    ram_DD                ; 3
    sta    ram_D6                ; 3
LFD48:
    jsr    LF2C5                 ; 6   goto LB2AE
    sta    ram_DE                ; 3
    bne    LFD52                 ; 2³
    jmp    LFDF7                 ; 3

LFD52:
    ldy    ram_DD                ; 3
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_D7                ; 3
    lsr                          ; 2
    clc                          ; 2
    adc    ram_D7                ; 3
    sta    ram_D7                ; 3
    sta    sc_01,Y               ; 5
    lda    ram_DE                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    asl                          ; 2
    sta    ram_D8                ; 3
    asl                          ; 2
    adc    #1                    ; 2
    sta    sc_71,Y               ; 5
    lda    #4                    ; 2
    bit    sc_15|READ            ; 4
    beq    LFDA2                 ; 2³
    lda.wy ram_F9,Y              ; 4
    bmi    LFD86                 ; 2³
    lda    #0                    ; 2
    sta    sc_71,Y               ; 5
    bpl    LFDF7                 ; 3   always branch

LFD86:
    inc    ram_D6                ; 5
    lda    #$80                  ; 2
    sta.wy ram_F9,Y              ; 5
    lda    sc_16|READ,Y          ; 4
    and    #$40                  ; 2
    sta    sc_16,Y               ; 5
    beq    LFD9B                 ; 2³
    lda    #6                    ; 2
    bpl    LFD9D                 ; 3   always branch

LFD9B:
    lda    #1                    ; 2
LFD9D:
    sta    sc_0B,Y               ; 5
    bpl    LFDF7                 ; 3   always branch

LFDA2:
    lsr    ram_EE                ; 5
    bcs    LFDAF                 ; 2³
    lda    #1                    ; 2
    sta    sc_0B,Y               ; 5
    lda    #0                    ; 2
    beq    LFDB6                 ; 3   always branch

LFDAF:
    lda    #6                    ; 2
    sta    sc_0B,Y               ; 5
    lda    #$40                  ; 2
LFDB6:
    sta    sc_16,Y               ; 5
    lda    sc_15|READ            ; 4
    lsr                          ; 2
    bcc    LFDC3                 ; 2³
    lda    #$C0                  ; 2
    bmi    LFDC5                 ; 3   always branch

LFDC3:
    lda    #$80                  ; 2
LFDC5:
    sta.wy ram_F9,Y              ; 5
    inc    ram_D6                ; 5
    lsr    ram_F0                ; 5
    bcs    LFDE6                 ; 2³
    lda    #3                    ; 2
    sta    ram_DE                ; 3
LFDD2:
    lda    ram_D8                ; 3
    ldy    ram_D7                ; 3
    jsr    LFC5B                 ; 6
    lda    ram_D7                ; 3
    clc                          ; 2
    adc    #8                    ; 2
    sta    ram_D7                ; 3
    dec    ram_DE                ; 5
    bpl    LFDD2                 ; 2³
    bmi    LFDF7                 ; 3   always branch

LFDE6:
    lda    #4                    ; 2
    sta    ram_DE                ; 3
LFDEA:
    lda    ram_D8                ; 3
    ldy    ram_D7                ; 3
    jsr    LFC5B                 ; 6
    inc    ram_D8                ; 5
    dec    ram_DE                ; 5
    bpl    LFDEA                 ; 2³
LFDF7:
    inx                          ; 2
    inc    ram_DD                ; 5
    cpx    ram_D9                ; 3
    beq    LFE01                 ; 2³+1
    jmp    LFD48                 ; 3

LFE01:
    lda    #4                    ; 2
    and    sc_15|READ            ; 4
    bne    LFE21                 ; 2³
    lda    ram_F6                ; 3
    and    #$83                  ; 2
    sta    ram_F6                ; 3
    lda    #$1C                  ; 2
    ldy    ram_D6                ; 3
    cpy    #7                    ; 2
    bcs    LFE1D                 ; 2³
    ldy    #0                    ; 2
    sty    sc_1C                 ; 4
    lda    #$18                  ; 2
LFE1D:
    ora    ram_F6                ; 3
    sta    ram_F6                ; 3
LFE21:
    lda    numOfLives|READ       ; 4
    and    #$F7                  ; 2
    sta    numOfLives            ; 4
    lda    ram_F4                ; 3
    and    #$F8                  ; 2
    ora    ram_D6                ; 3
    sta    ram_F4                ; 3
    lda    ram_F3                ; 3
    and    #$1C                  ; 2
    ora    #$01                  ; 2
    sta    ram_F3                ; 3
    lda    #$7F                  ; 2
    sta    sc_09                 ; 4
    lda    sc_15|READ            ; 4
    ror                          ; 2
    bcs    LFE5C                 ; 2³
    rol                          ; 2
    ora    #$08                  ; 2
    sta    sc_15                 ; 4
    lda    ram_F6                ; 3
    ora    #$80                  ; 2
    sta    ram_F6                ; 3
    lda    #$7F                  ; 2
    sta    ram_F1                ; 3
    lda    #$42                  ; 2
    ldx    #$3C                  ; 2
    ldy    #$15                  ; 2
    bpl    LFE62                 ; 3   always branch

LFE5C:
    lda    #$46                  ; 2
    ldx    #$78                  ; 2
    ldy    #$29                  ; 2
LFE62:
    sta    sc_14                 ; 4
    stx    sc_0A                 ; 4
    sty    sc_7A                 ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFE6C SUBROUTINE
    lda    sc_08|READ            ; 4
    sec                          ; 2
    sbc    sc_01|READ,X          ; 4
    bpl    LFE7A                 ; 2³
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    #1                    ; 2
LFE7A:
    cmp    #5                    ; 2
    bcs    LFE91                 ; 2³
    lda    sc_78|READ            ; 4
    clc                          ; 2
    adc    #1                    ; 2
    sec                          ; 2
    sbc    sc_71|READ,X          ; 4
    bmi    LFE91                 ; 2³
    cmp    #5                    ; 2
    bcs    LFE91                 ; 2³
    lda    #0                    ; 2
    rts                          ; 6

LFE91:
    lda    #$FF                  ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFE94 SUBROUTINE
    sta    ram_D4                ; 3
    lda    sc_15|READ            ; 4
    and    #$83                  ; 2
    bne    LFEDE                 ; 2³
    lda    ram_D4                ; 3
    sed                          ; 2
    clc                          ; 2
    adc    sc_7D|READ            ; 4
    sta    sc_7D                 ; 4
    tya                          ; 2
    adc    sc_7E|READ            ; 4
    sta    sc_7E                 ; 4
    bcc    LFEDE                 ; 2³
    lda    #0                    ; 2
    adc    sc_7F|READ            ; 4
    sta    sc_7F                 ; 4
    cmp    #$21                  ; 2
    bcs    LFEDE                 ; 2³
    cmp    #2                    ; 2
    beq    LFEC8                 ; 2³
    and    #$0F                  ; 2
    beq    LFEC8                 ; 2³
    cmp    #5                    ; 2
    bne    LFEDE                 ; 2³
LFEC8:
    cld                          ; 2
    lda    numOfLives|READ       ; 4
    and    #$07                  ; 2
    cmp    #7                    ; 2
    beq    LFEDE                 ; 2³
    ldy    numOfLives|READ       ; 4
    iny                          ; 2
    sty    numOfLives            ; 4
    ldy    #$0F                  ; 2
    jmp    LF2C8                 ; 3

LFEDE:
    cld                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFEE0:
    .byte $01 ; |       X| $FEE0
    .byte $08 ; |    X   | $FEE1
    .byte $06 ; |     XX | $FEE2
    .byte $0C ; |    XX  | $FEE3
    .byte $14 ; |   X X  | $FEE4
    .byte $38 ; |  XXX   | $FEE5
    .byte $1E ; |   XXXX | $FEE6
    .byte $0E ; |    XXX | $FEE7
    .byte $51 ; | X X   X| $FEE8
    .byte $78 ; | XXXX   | $FEE9
    .byte $3C ; |  XXXX  | $FEEA
    .byte $1C ; |   XXX  | $FEEB
    .byte $2D ; |  X XX X| $FEEC
    .byte $2A ; |  X X X | $FEED
    .byte $6C ; | XX XX  | $FEEE
    .byte $61 ; | XX    X| $FEEF
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

    .byte $8F ; |X   XXXX| $FF00
    .byte $FF ; |XXXXXXXX| $FF01
    .byte $AF ; |X X XXXX| $FF02
    .byte $FF ; |XXXXXXXX| $FF03
    .byte $8F ; |X   XXXX| $FF04
    .byte $FF ; |XXXXXXXX| $FF05
    .byte $DF ; |XX XXXXX| $FF06
    .byte $FF ; |XXXXXXXX| $FF07
    .byte $F1 ; |XXXX   X| $FF08
    .byte $FF ; |XXXXXXXX| $FF09
    .byte $F5 ; |XXXX X X| $FF0A
    .byte $FF ; |XXXXXXXX| $FF0B
    .byte $F1 ; |XXXX   X| $FF0C
    .byte $FF ; |XXXXXXXX| $FF0D
    .byte $FB ; |XXXXX XX| $FF0E
    .byte $FF ; |XXXXXXXX| $FF0F
    .byte $FE ; |XXXXXXX | $FF10
    .byte $FC ; |XXXXXX  | $FF11
    .byte $FE ; |XXXXXXX | $FF12
    .byte $FD ; |XXXXXX X| $FF13
    .byte $FE ; |XXXXXXX | $FF14
    .byte $FC ; |XXXXXX  | $FF15
    .byte $FF ; |XXXXXXXX| $FF16
    .byte $FE ; |XXXXXXX | $FF17
    .byte $FF ; |XXXXXXXX| $FF18
    .byte $E3 ; |XXX   XX| $FF19
    .byte $FF ; |XXXXXXXX| $FF1A
    .byte $EB ; |XXX X XX| $FF1B
    .byte $FF ; |XXXXXXXX| $FF1C
    .byte $E3 ; |XXX   XX| $FF1D
    .byte $FF ; |XXXXXXXX| $FF1E
    .byte $F7 ; |XXXX XXX| $FF1F
    .byte $FF ; |XXXXXXXX| $FF20
    .byte $1F ; |   XXXXX| $FF21
    .byte $FF ; |XXXXXXXX| $FF22
    .byte $5F ; | X XXXXX| $FF23
    .byte $FF ; |XXXXXXXX| $FF24
    .byte $1F ; |   XXXXX| $FF25
    .byte $FF ; |XXXXXXXX| $FF26
    .byte $BF ; |X XXXXXX| $FF27
    .byte $1F ; |   XXXXX| $FF28
    .byte $FF ; |XXXXXXXX| $FF29
    .byte $5F ; | X XXXXX| $FF2A
    .byte $FF ; |XXXXXXXX| $FF2B
    .byte $1F ; |   XXXXX| $FF2C
    .byte $FF ; |XXXXXXXX| $FF2D
    .byte $BF ; |X XXXXXX| $FF2E
    .byte $FF ; |XXXXXXXX| $FF2F
    .byte $E3 ; |XXX   XX| $FF30
    .byte $FF ; |XXXXXXXX| $FF31
    .byte $EB ; |XXX X XX| $FF32
    .byte $FF ; |XXXXXXXX| $FF33
    .byte $E3 ; |XXX   XX| $FF34
    .byte $FF ; |XXXXXXXX| $FF35
    .byte $F7 ; |XXXX XXX| $FF36
    .byte $FF ; |XXXXXXXX| $FF37
    .byte $FC ; |XXXXXX  | $FF38
    .byte $FE ; |XXXXXXX | $FF39
    .byte $FD ; |XXXXXX X| $FF3A
    .byte $FE ; |XXXXXXX | $FF3B
    .byte $FC ; |XXXXXX  | $FF3C
    .byte $FE ; |XXXXXXX | $FF3D
    .byte $FE ; |XXXXXXX | $FF3E
    .byte $FF ; |XXXXXXXX| $FF3F
    .byte $FF ; |XXXXXXXX| $FF40
    .byte $F1 ; |XXXX   X| $FF41
    .byte $FF ; |XXXXXXXX| $FF42
    .byte $F5 ; |XXXX X X| $FF43
    .byte $FF ; |XXXXXXXX| $FF44
    .byte $F1 ; |XXXX   X| $FF45
    .byte $FF ; |XXXXXXXX| $FF46
    .byte $FB ; |XXXXX XX| $FF47
    .byte $FF ; |XXXXXXXX| $FF48
    .byte $8F ; |X   XXXX| $FF49
    .byte $FF ; |XXXXXXXX| $FF4A
    .byte $AF ; |X X XXXX| $FF4B
    .byte $FF ; |XXXXXXXX| $FF4C
    .byte $8F ; |X   XXXX| $FF4D
    .byte $FF ; |XXXXXXXX| $FF4E
    .byte $DF ; |XX XXXXX| $FF4F
LFF50:
    .byte $00 ; |        | $FF50
    .byte $08 ; |    X   | $FF51
    .byte $04 ; |     X  | $FF52
    .byte $10 ; |   X    | $FF53
    .byte $18 ; |   XX   | $FF54
    .byte $0C ; |    XX  | $FF55
    .byte $14 ; |   X X  | $FF56
    .byte $1C ; |   XXX  | $FF57
LFF58:
    .byte $30 ; |  XX    | $FF58
    .byte $30 ; |  XX    | $FF59
    .byte $00 ; |        | $FF5A
    .byte $00 ; |        | $FF5B
    .byte $00 ; |        | $FF5C
    .byte $48 ; | X  X   | $FF5D
    .byte $48 ; | X  X   | $FF5E
    .byte $48 ; | X  X   | $FF5F
LFF60:
    .byte $61 ; | XX    X| $FF60
    .byte $98 ; |X  XX   | $FF61
    .byte $D2 ; |XX X  X | $FF62
    .byte $39 ; |  XXX  X| $FF63
    .byte $CD ; |XX  XX X| $FF64
    .byte $AD ; |X X XX X| $FF65
    .byte $6C ; | XX XX  | $FF66
    .byte $D2 ; |XX X  X | $FF67
    .byte $59 ; | X XX  X| $FF68
    .byte $C9 ; |XX  X  X| $FF69
    .byte $6C ; | XX XX  | $FF6A
    .byte $E1 ; |XXX    X| $FF6B
    .byte $DC ; |XX XXX  | $FF6C
    .byte $63 ; | XX   XX| $FF6D
    .byte $F0 ; |XXXX    | $FF6E
    .byte $53 ; | X X  XX| $FF6F
    .byte $D9 ; |XX XX  X| $FF70
    .byte $47 ; | X   XXX| $FF71
LFF72:
    .byte $00 ; |        | $FF72
    .byte $05 ; |     X X| $FF73
    .byte $50 ; | X X    | $FF74
    .byte $12 ; |   X  X | $FF75
    .byte $00 ; |        | $FF76
    .byte $20 ; |  X     | $FF77
    .byte $00 ; |        | $FF78
    .byte $30 ; |  XX    | $FF79
    .byte $00 ; |        | $FF7A
    .byte $40 ; | X      | $FF7B
    .byte $00 ; |        | $FF7C
    .byte $50 ; | X X    | $FF7D
    .byte $00 ; |        | $FF7E
    .byte $60 ; | XX     | $FF7F
LFF80:
    .byte $00 ; |        | $FF80
    .byte $01 ; |       X| $FF81
    .byte $02 ; |      X | $FF82
    .byte $03 ; |      XX| $FF83
    .byte $04 ; |     X  | $FF84
    .byte $05 ; |     X X| $FF85
    .byte $06 ; |     XX | $FF86
    .byte $07 ; |     XXX| $FF87
    .byte $08 ; |    X   | $FF88
    .byte $09 ; |    X  X| $FF89
    .byte $0A ; |    X X | $FF8A
    .byte $0B ; |    X XX| $FF8B
    .byte $00 ; |        | $FF8C
    .byte $01 ; |       X| $FF8D
    .byte $02 ; |      X | $FF8E
    .byte $03 ; |      XX| $FF8F
    .byte $04 ; |     X  | $FF90
    .byte $05 ; |     X X| $FF91
    .byte $06 ; |     XX | $FF92
    .byte $07 ; |     XXX| $FF93
    .byte $08 ; |    X   | $FF94
    .byte $09 ; |    X  X| $FF95
    .byte $0A ; |    X X | $FF96
    .byte $0B ; |    X XX| $FF97
    .byte $00 ; |        | $FF98
    .byte $01 ; |       X| $FF99
    .byte $02 ; |      X | $FF9A
    .byte $03 ; |      XX| $FF9B
    .byte $04 ; |     X  | $FF9C
    .byte $05 ; |     X X| $FF9D
    .byte $06 ; |     XX | $FF9E
    .byte $07 ; |     XXX| $FF9F
    .byte $08 ; |    X   | $FFA0
    .byte $09 ; |    X  X| $FFA1
    .byte $0A ; |    X X | $FFA2
    .byte $0B ; |    X XX| $FFA3
    .byte $00 ; |        | $FFA4
    .byte $01 ; |       X| $FFA5
    .byte $02 ; |      X | $FFA6
    .byte $03 ; |      XX| $FFA7
    .byte $04 ; |     X  | $FFA8
    .byte $05 ; |     X X| $FFA9
    .byte $06 ; |     XX | $FFAA
    .byte $07 ; |     XXX| $FFAB
    .byte $08 ; |    X   | $FFAC
    .byte $09 ; |    X  X| $FFAD
    .byte $0A ; |    X X | $FFAE
    .byte $0B ; |    X XX| $FFAF
LFFB0:
    .byte $42 ; | X    X | $FFB0
    .byte $4A ; | X  X X | $FFB1
    .byte $84 ; |X    X  | $FFB2
    .byte $84 ; |X    X  | $FFB3
    .byte $20 ; |  X     | $FFB4
    .byte $24 ; |  X  X  | $FFB5
    .byte $22 ; |  X   X | $FFB6
    .byte $22 ; |  X   X | $FFB7
LFFB8:
    .byte $24 ; |  X  X  | $FFB8
    .byte $A4 ; |X X  X  | $FFB9
    .byte $22 ; |  X   X | $FFBA
    .byte $2A ; |  X X X | $FFBB
    .byte $42 ; | X    X | $FFBC
    .byte $CA ; |XX  X X | $FFBD
    .byte $44 ; | X   X  | $FFBE
    .byte $44 ; | X   X  | $FFBF
LFFC0:
    .byte $80 ; |X       | $FFC0
    .byte $20 ; |  X     | $FFC1
    .byte $40 ; | X      | $FFC2
    .byte $08 ; |    X   | $FFC3
    .byte $02 ; |      X | $FFC4
    .byte $10 ; |   X    | $FFC5
    .byte $04 ; |     X  | $FFC6
LFFC7:
    .byte $01 ; |       X| $FFC7
    .byte $02 ; |      X | $FFC8
    .byte $04 ; |     X  | $FFC9
    .byte $08 ; |    X   | $FFCA
    .byte $10 ; |   X    | $FFCB
    .byte $20 ; |  X     | $FFCC
    .byte $40 ; | X      | $FFCD
    .byte $80 ; |X       | $FFCE
LFFCF:
    .byte $10 ; |   X    | $FFCF
    .byte $81 ; |X      X| $FFD0
    .byte $C8 ; |XX  X   | $FFD1
    .byte $C8 ; |XX  X   | $FFD2
    .byte $C8 ; |XX  X   | $FFD3
    .byte $C9 ; |XX  X  X| $FFD4
    .byte $C9 ; |XX  X  X| $FFD5
    .byte $C9 ; |XX  X  X| $FFD6
LFFD7:
    .byte $42 ; | X    X | $FFD7
    .byte $41 ; | X     X| $FFD8
    .byte $40 ; | X      | $FFD9
LFFDA:
    .byte $46 ; | X   XX | $FFDA
    .byte $45 ; | X   X X| $FFDB
    .byte $44 ; | X   X  | $FFDC
    .byte $00 ; |        | $FFDD

LFFDE:
    lda    BANK_2                ; 4   bankswitch, goto LDC9E

    .byte $00 ; |        | $FFE1
    .byte $00 ; |        | $FFE2
    .byte $00 ; |        | $FFE3

LFFE4:
    lda    BANK_2                ; 4   bankswitch, goto LDB92

;bs from bank 0
    jmp    LF14D                 ; 3

LFFEA:
    lda    BANK_2                ; 4   bankswitch, goto LD1A7
LFFED:
    lda    BANK_2                ; 4   bankswitch, goto LD66B
LFFF0:
    lda    BANK_2                ; 4   bankswitch, goto LDAF6

    .byte $00 ; |        | $FFF3
    .byte $00 ; |        | $FFF4
    .byte $00 ; |        | $FFF5
    .byte $00 ; |        | $FFF6
    .byte $00 ; |        | $FFF7
    .byte $00 ; |        | $FFF8
    .byte $00 ; |        | $FFF9
    .byte $00 ; |        | $FFFA
    .byte $00 ; |        | $FFFB

        ORG $4FFC
       RORG $FFFC

    .word START_BANK_3
    .word 0