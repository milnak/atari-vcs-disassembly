; Disassembly of H.E.R.O.
; Using DiStella v3.0
; By Omegamatrix
;
; Converted to use Sega Genesis Controllers
;
;
; Command Line: distella -pasfcHero1.cfg hero1.bin > Hero1.asm
;
; Hero1.cfg contents:
;
;      ORG D000
;      CODE D000 D009
;      GFX D00A D00B
;      D00C D029
;      GFX D02A D078
;      CODE D079 D9E1
;      GFX D9E2 D9F0
;      CODE D9F1 DA03
;      GFX DA04 DBB1
;      CODE DBB2 DBFB
;      GFX DBFC DBFF
;      CODE DC00 DC35
;      GFX DC36 DC55
;      CODE DC56 DC5D
;      GFX DC5E DDFF
;      CODE DE00 DE71
;      GFX DE72 DFEB
;      CODE DFEC DFFB
;      GFX DFFC DFFF
;
; Command Line: distella -pasfcHero2.cfg hero2.bin > Hero2.asm
;
; Hero2.cfg contents:
;
;      ORG F000
;      CODE F000 F6D1
;      GFX F6D2 FFEB
;      CODE FFEC FFFB
;      GFX FFFC FFFF


      processor 6502

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      EQUATES
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
AUDC1   =  $16
AUDF0   =  $17
AUDF1   =  $18
AUDV0   =  $19
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
ENAM1   =  $1E
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMBL    =  $24
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C

;read TIA base line = $00
CXM1P   =  $01
CXP1FB  =  $03
CXM1FB  =  $05
CXPPMM  =  $07
INPT4   =  $0C

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

;CTRLPF
REFLECT      = %00000001
SCORE        = %00000010

CLOCK_1      = %00000000
CLOCK_2      = %00010000
CLOCK_4      = %00100000
CLOCK_8      = %00110000

;-------------------------------
COL_POWER    = LIGHT_GREY         ; shared with VDELP1, keep bit 0 clear for "no delay"

BLACK        = $00
BLUE         = $84
BROWN        = $26
GREEN        = $D6
LIGHT_GREY   = $0C
RED          = $44
YELLOW       = $1C

;-------------------------------

BANK_0       = $FFF8
BANK_1       = $FFF9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

frameCounter = $81

hPosHERO     = $9B
screen       = $9C         ; holds the current screen number of level

vPosHERO     = $9F

powerMeter   = $AB

scoreBCD     = $B7         ; $B7 - B9

height_Copy  = $BC         ; for scrolling
height_Logo  = $BD         ; for scrolling




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 0
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $D000

Start_Bank0:
    sei                          ; 2
    bit    BANK_1                   ; bankswitch


    ldx    #$FF                  ; 2
    txs                          ; 2
    jsr    Start_Bank1           ; 6

    .byte $00             ; $D00A
    .byte $00             ; $D00B

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

HorizPositioning SUBROUTINE
    cmp    #0                    ; 2
    bne    LD012                 ; 2³
    lda    #1                    ; 2
LD012:
    sec                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    bcs    .loopDivideBy15       ; 3   always branch, waste 3 cycles
.loopDivideBy15:
    sbc    #$0F                  ; 2
    bcs    .loopDivideBy15       ; 2³
    eor    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$80                  ; 2
    sta    RESP0,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMP0,X                ; 4
Waste12Cycles SUBROUTINE
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD02A:
    .byte $A1 ; |X X    X| $D02A
    .byte $A2 ; |X X   X | $D02B
    .byte $A3 ; |X X   XX| $D02C
    .byte $A4 ; |X X  X  | $D02D
    .byte $A5 ; |X X  X X| $D02E
    .byte $A6 ; |X X  XX | $D02F
    .byte $A7 ; |X X  XXX| $D030
    .byte $A8 ; |X X X   | $D031
    .byte $A9 ; |X X X  X| $D032
    .byte $10 ; |   X    | $D033
    .byte $11 ; |   X   X| $D034
    .byte $12 ; |   X  X | $D035
    .byte $13 ; |   X  XX| $D036
    .byte $14 ; |   X X  | $D037
    .byte $15 ; |   X X X| $D038
    .byte $16 ; |   X XX | $D039
    .byte $17 ; |   X XXX| $D03A
    .byte $18 ; |   XX   | $D03B
    .byte $19 ; |   XX  X| $D03C
LD03D:
    .byte $20 ; |  X     | $D03D
    .byte $40 ; | X      | $D03E
    .byte $60 ; | XX     | $D03F
    .byte $80 ; |X       | $D040
    .byte $90 ; |X  X    | $D041
    .byte $00 ; |        | $D042
    .byte $20 ; |  X     | $D043
    .byte $60 ; | XX     | $D044
    .byte $00 ; |        | $D045
    .byte $40 ; | X      | $D046
    .byte $80 ; |X       | $D047
    .byte $20 ; |  X     | $D048
    .byte $60 ; | XX     | $D049
    .byte $00 ; |        | $D04A
    .byte $20 ; |  X     | $D04B
    .byte $40 ; | X      | $D04C
    .byte $00 ; |        | $D04D
    .byte $40 ; | X      | $D04E
    .byte $00 ; |        | $D04F
    .byte $99 ; |X  XX  X| $D050
LD051:
    .byte $00 ; |        | $D051
    .byte $00 ; |        | $D052
    .byte $00 ; |        | $D053
    .byte $00 ; |        | $D054
    .byte $00 ; |        | $D055
    .byte $01 ; |       X| $D056
    .byte $01 ; |       X| $D057
    .byte $01 ; |       X| $D058
    .byte $02 ; |      X | $D059
    .byte $02 ; |      X | $D05A
    .byte $02 ; |      X | $D05B
    .byte $03 ; |      XX| $D05C
    .byte $03 ; |      XX| $D05D
    .byte $04 ; |     X  | $D05E
    .byte $04 ; |     X  | $D05F
    .byte $04 ; |     X  | $D060
    .byte $05 ; |     X X| $D061
    .byte $05 ; |     X X| $D062
    .byte $06 ; |     XX | $D063
    .byte $09 ; |    X  X| $D064
LD065:
    .byte $01 ; |       X| $D065
    .byte $03 ; |      XX| $D066
    .byte $05 ; |     X X| $D067
    .byte $07 ; |     XXX| $D068
    .byte $07 ; |     XXX| $D069
    .byte $09 ; |    X  X| $D06A
    .byte $0B ; |    X XX| $D06B
    .byte $0D ; |    XX X| $D06C
    .byte $0F ; |    XXXX| $D06D
    .byte $0F ; |    XXXX| $D06E
    .byte $0F ; |    XXXX| $D06F
    .byte $0F ; |    XXXX| $D070
    .byte $0F ; |    XXXX| $D071
    .byte $0F ; |    XXXX| $D072
    .byte $0F ; |    XXXX| $D073
    .byte $0F ; |    XXXX| $D074
    .byte $0F ; |    XXXX| $D075
    .byte $0F ; |    XXXX| $D076
    .byte $0F ; |    XXXX| $D077
    .byte $0F ; |    XXXX| $D078

LD079:
    lda    $B5                   ; 3
    bmi    LD0B0                 ; 2³
    lda    $BA                   ; 3
    bne    LD087                 ; 2³
    lda    $AF                   ; 3
    bne    LD0B0                 ; 2³
    beq    LD099                 ; 3   always branch

LD087:
    lda    $B3                   ; 3
    bne    LD0B0                 ; 2³
    lda    $B7                   ; 3
    cmp    #$AA                  ; 2
    beq    LD0B0                 ; 2³
    lda    $B6                   ; 3
    and    #$1F                  ; 2
    cmp    #$14                  ; 2
    bcc    LD0B0                 ; 2³
LD099:
    lda    $80                   ; 3
    and    #$7F                  ; 2
    cmp    #4                    ; 2
    beq    LD0B0                 ; 2³
    lda    #$CD                  ; 2
    sta    $BB                   ; 3
    lda    #$EF                  ; 2
    sta    $BC                   ; 3
    ldx    $F5                   ; 3
    lda    LD02A,X               ; 4
    sta    $BD                   ; 3
LD0B0:
    ldx    #2                    ; 2

LD0B2:
    txa                          ; 2
    asl                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda    $BB,X                 ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    sta.wy $85,Y                 ; 5
    lda    $BB,X                 ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta.wy $87,Y                 ; 5
    dex                          ; 2
    bpl    LD0B2                 ; 2³

    lda    $BB                   ; 3
    cmp    #$CD                  ; 2
    bne    LD0DD                 ; 2³
    bit    $80                   ; 3
    bpl    LD0DD                 ; 2³
    lda    #$D8                  ; 2
    sta    $8D                   ; 3
    lda    #$E0                  ; 2
    sta    $8F                   ; 3
LD0DD:
    inx                          ; 2
    ldy    #$50                  ; 2
LD0E0:
    lda    $85,X                 ; 4
    bne    LD0EC                 ; 2³
    sty    $85,X                 ; 4
    inx                          ; 2
    inx                          ; 2
    cpx    #$0A                  ; 2
    bcc    LD0E0                 ; 2³
LD0EC:
    ldx    #$0B                  ; 2
    lda    #$DF                  ; 2   copyright high nybble?
LD0F0:
    sta    $85,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LD0F0                 ; 2³
    bmi    LD0FB                 ; 3   always branch

LD0F8:
    jmp    LD17A                 ; 3

LD0FB:
    lda    INTIM                 ; 4
    bne    LD0FB                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    bit    $B4                   ; 3
    bpl    LD10A                 ; 2³
    lda    #2                    ; 2
LD10A:
    sta    VBLANK                ; 3
    ldx    #2                    ; 2
    stx    $E6                   ; 3
    dex                          ; 2
    lda    $9B                   ; 3
    sta    HMCLR                 ; 3
    jsr    HorizPositioning      ; 6
    ldx    #4                    ; 2
    lda    $A0                   ; 3
    jsr    HorizPositioning      ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    $E1                   ; 3   main background color
    sta    COLUBK                ; 3
    lda    #$FF                  ; 2
    sta    $BD                   ; 3
    dex                          ; 2
LD12C:
    lda    LDD09,X               ; 4
    ora    $A4                   ; 3
    sta    HMCLR                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    COLUPF                ; 3
    lda    LDC66,X               ; 4
    sta    PF0                   ; 3
    lda    LDC61,X               ; 4
    and    $C1                   ; 3
    sta    PF1                   ; 3
    lda    LDC61,X               ; 4
    and    $C4                   ; 3
    sta    PF2                   ; 3
    dex                          ; 2
    bpl    LD12C                 ; 2³
    stx    ENABL                 ; 3  draw middle wall (the one you can blow up)
    inx                          ; 2
    stx    NUSIZ0                ; 3
    lda    #$61                  ; 2
    sta    VDELP0                ; 3
    lda    $B0                   ; 3
    sta    REFP1                 ; 3
    ldy    #$74                  ; 2
    lda    ($95),Y               ; 5
    ldx    $C7                   ; 3
    nop                          ; 2
    sta    CXCLR                 ; 3
    nop                          ; 2
    stx    COLUPF                ; 3
    sta    HMOVE                 ; 3
    jmp    LD172                 ; 3

LD16D:
    sta.w  GRP1                  ; 4
    beq    LD1AC                 ; 3   always branch

LD172:
    sta    COLUP1                ; 3
    and    #$01                  ; 2
    beq    LD0F8                 ; 2³+1
    lda    ($91),Y               ; 5
LD17A:
    sta    GRP1                  ; 3
    ldx    $E6                   ; 3
    lda    $A1,X                 ; 4
    sta    $BC                   ; 3
    lda    CXM1FB                ; 3
    ora    $F4                   ; 3
    sta    $F4                   ; 3
    lda    $CE,X                 ; 4
    sta    $97                   ; 3
    lda    $CB,X                 ; 4
    sta    $93                   ; 3
    dey                          ; 2
    lda    $BF,X                 ; 4
    tax                          ; 2
    lda    ($95),Y               ; 5
    stx    PF1                   ; 3
    ldx    $BD                   ; 3
    sta    COLUP1                ; 3
    sta    HMOVE                 ; 3
    stx    PF0                   ; 3
    ldx    CXP1FB                ; 3
    stx    CXCLR                 ; 3
    and    #$01                  ; 2
    beq    LD16D                 ; 2³
    lda    ($91),Y               ; 5
    sta    GRP1                  ; 3
LD1AC:
    stx    $BB                   ; 3
    ldx    $E6                   ; 3
    lda    $C2,X                 ; 4
    sta    PF2                   ; 3
    lda    $C8,X                 ; 4
    sta    CTRLPF                ; 3
    lda    $BB                   ; 3
    sta    $E3,X                 ; 4
    dey                          ; 2
    lda    $C5,X                 ; 4
    tax                          ; 2
    lda    ($95),Y               ; 5
    lda    ($95),Y               ; 5
    nop                          ; 2
    sta    COLUP1                ; 3
    sta    HMOVE                 ; 3
    stx    COLUPF                ; 3
    sta    ENAM1                 ; 3
    and    #$01                  ; 2
    bne    LD1D5                 ; 2³
    sta    ENAM1                 ; 3
    beq    LD1D7                 ; 3   always branch

LD1D5:
    lda    ($91),Y               ; 5
LD1D7:
    sta    GRP1                  ; 3
    dey                          ; 2
    ldx    $E6                   ; 3
    lda    $D1,X                 ; 4
    sta    $BB                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    ($95),Y               ; 5
    jsr    Waste12Cycles         ; 12
    jsr    Waste12Cycles         ; 12
    dec    $E6                   ; 5
    sta.w  COLUP1                ; 4
    sta    HMOVE                 ; 3
    sta    ENAM1                 ; 3
    and    #$01                  ; 2
    bne    LD1FC                 ; 2³
    sta    ENAM1                 ; 3
    beq    LD1FE                 ; 3   always branch

LD1FC:
    lda    ($91),Y               ; 5
LD1FE:
    sta.w  GRP1                  ; 4
    lda    $BB                   ; 3
LD203:
    dex                          ; 2
    bne    LD203                 ; 2³
    sta    RESP0                 ; 3
    sta    HMP0                  ; 3
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ($95),Y               ; 5
    sta    COLUP1                ; 3
    sta    ENAM1                 ; 3
    lsr                          ; 2
    bcc    LD234                 ; 2³
    lda    ($91),Y               ; 5
    sta    GRP1                  ; 3
    nop                          ; 2
LD21D:
    ldx    #$12                  ; 2
    sta    HMCLR                 ; 3
LD221:
    dey                          ; 2
    sty    $BB                   ; 3
    txa                          ; 2
    sec                          ; 2
    sbc    $BC                   ; 3
    tay                          ; 2
    cmp    #$0D                  ; 2
    bcc    LD23A                 ; 2³
    ldy    #0                    ; 2
    nop                          ; 2
    nop                          ; 2
    jmp    LD23E                 ; 3

LD234:
    stx    ENAM1                 ; 3
    stx    GRP1                  ; 3
    bcc    LD21D                 ; 3   always branch

LD23A:
    lda    ($93),Y               ; 5
    sta    GRP0                  ; 3
LD23E:
    lda    ($97),Y               ; 5
    ldy    $BB                   ; 3
    sta    COLUP0                ; 3
    lda    ($95),Y               ; 5
    sta    HMOVE                 ; 3
    sta    COLUP1                ; 3
    lsr                          ; 2
    bcs    LD255                 ; 2³
    lda    #0                    ; 2
    sta    ENAM1                 ; 3
    sta    GRP1                  ; 3
    beq    LD25A                 ; 3   always branch

LD255:
    asl                          ; 2
    sta    ENAM1                 ; 3
    lda    ($91),Y               ; 5
LD25A:
    sta.w  GRP1                  ; 4
    sta    GRP1                  ; 3
    dex                          ; 2
    bpl    LD221                 ; 2³
    dey                          ; 2
    lda    CXPPMM                ; 3
    ldx    $E6                   ; 3
    sta    $D2,X                 ; 4
    lda    $D9,X                 ; 4
    sta    $99                   ; 3
    lda    $DC,X                 ; 4
    sta    $97                   ; 3
    lda    $D5,X                 ; 4
    and    #$0F                  ; 2
    tax                          ; 2
    lda    ($95),Y               ; 5
    sta    COLUP1                ; 3
    lsr                          ; 2
    sta    HMOVE                 ; 3
    bcs    LD287                 ; 2³
    lda    #0                    ; 2
    sta    ENAM1                 ; 3
    sta    GRP1                  ; 3
    beq    LD28C                 ; 3   always branch

LD287:
    asl                          ; 2
    sta    ENAM1                 ; 3
    lda    ($91),Y               ; 5
LD28C:
    sta    GRP1                  ; 3
    dey                          ; 2
LD28F:
    dex                          ; 2
    bne    LD28F                 ; 2³
    sta    RESP0                 ; 3
    lda    ($95),Y               ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    COLUP1                ; 3
    sta    ENAM1                 ; 3
    and    #$01                  ; 2
    bne    LD2A6                 ; 2³
    sta    ENAM1                 ; 3
    beq    LD2A8                 ; 3   always branch

LD2A6:
    lda    ($91),Y               ; 5
LD2A8:
    sta    GRP1                  ; 3
    ldx    $E6                   ; 3
    lda    $D5,X                 ; 4
    sta    HMP0                  ; 3
    lda    CXM1P                 ; 3
    sta    $D5,X                 ; 4
    ldx    #$0C                  ; 2
    dey                          ; 2
    sty    $BB                   ; 3
    ldy    #$0C                  ; 2
    jsr    Waste12Cycles         ; 12
LD2BE:
    lda    ($97),Y               ; 5
    ldy    $BB                   ; 3
    sta    COLUP0                ; 3
    lda    ($95),Y               ; 5
    sta    HMOVE                 ; 3
    sta    COLUP1                ; 3
    sta    ENAM1                 ; 3
    and    #$01                  ; 2
    bne    LD2D4                 ; 2³
    sta    ENAM1                 ; 3
    beq    LD2D6                 ; 3   always branch

LD2D4:
    lda    ($91),Y               ; 5
LD2D6:
    sta    GRP1                  ; 3
    nop                          ; 2
    dey                          ; 2
    bmi    LD30C                 ; 2³+1
    sty    $BB                   ; 3
    txa                          ; 2
    tay                          ; 2
    dex                          ; 2
    bmi    LD2EF                 ; 2³
    sta    HMCLR                 ; 3
    lda    ($99),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($97),Y               ; 5
    nop                          ; 2
    jmp    LD2BE                 ; 3

LD2EF:
    ldx    $E6                   ; 3
    lda    $BE                   ; 3
    ora    LD9E2,X               ; 4
    sta    $BD                   ; 3
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    ldy    $BB                   ; 3
    ldx    $A4                   ; 3
    lda    ($95),Y               ; 5
    stx    ENAM1                 ; 3
    stx.w  COLUPF                ; 4
    sta    HMOVE                 ; 3
    jmp    LD172                 ; 3

LD30C:
    ldx    $F5                   ; 3
    lda    LD065,X               ; 4
    cmp    $9C                   ; 3
    beq    LD31D                 ; 2³
    lda    $E1                   ; 3
    ldx    $9C                   ; 3
    cpx    #$0A                  ; 2
    bcc    LD325                 ; 2³
LD31D:
    lda    $F5                   ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    LDD01,X               ; 4
LD325:
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    HMOVE                 ; 3
    sta    COLUBK                ; 3
    ldy    #0                    ; 2
    sty    ENAM1                 ; 3
    sty    ENABL                 ; 3
    sty    VDELP0                ; 3
    sty    GRP1                  ; 3
    lda    CXP1FB                ; 3
    sta    $E2                   ; 3
    lda    CXM1FB                ; 3
    ora    $F4                   ; 3
    sta    $F4                   ; 3
    ldx    $FB                   ; 3
    lda    LDA1D,X               ; 4
    sta    $BB                   ; 3
    lda    #$DC                  ; 2
    sta    $BC                   ; 3
    ldx    #0                    ; 2
    cmp    ($BB,X)               ; 6
    lda    $BB                   ; 3
    nop                          ; 2
LD351:
    lda    LDD0A,Y               ; 4
    ora    $A4                   ; 3
    stx    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    COLUPF                ; 3
    lda    ($BB),Y               ; 5
    sta    PF0                   ; 3
    lda    ($BB),Y               ; 5
    and    $BF                   ; 3
    sta    PF1                   ; 3
    lda    ($BB),Y               ; 5
    and    $C2                   ; 3
    sta    PF2                   ; 3
    iny                          ; 2
    cpy    #4                    ; 2
    bcc    LD351                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sty    COLUPF                ; 3
    ldy    #$FF                  ; 2
    sty    PF0                   ; 3
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    lda    #$42                  ; 2
    sta    COLUBK                ; 3
    lda    #COL_POWER            ; 2
    ldx    #CLOCK_8              ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    stx    CTRLPF                ; 3   ball size is eight clocks
    stx    VDELP0                ; 3   - no delay
    stx    NUSIZ1                ; 3   Missile_1 size is eight clocks, Player_1 = one copy
    stx    REFP1                 ; 3   - no reflect
    stx    REFP0                 ; 3   - no reflect
    inx                          ; 2
    stx    NUSIZ0                ; 3   Missile_0 size is eight clocks, Player_0 = two close copies
    sta    COLUP0                ; 3   COL_POWER
    sta    COLUP1                ; 3   COL_POWER
    sta    VDELP1                ; 3   - no delay, "COL_POWER" bit 0 is clear
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    $AB                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LDC6B,X               ; 4
    sta    $BD                   ; 3
    lda    LDC76,X               ; 4
    sta    $BC                   ; 3
    lda    LDC69,X               ; 4
    sta    $BB                   ; 3
    sty    ENABL                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    $D7                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    $D7                   ; 3
LD3C6:
    dex                          ; 2
    bpl    LD3C6                 ; 2³
    sta.w  RESBL                 ; 4
    sta    HMBL                  ; 3
    lda    #$10                  ; 2
    sta    HMP1                  ; 3
    ldx    #4                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
LD3D6:
    sta    HMOVE                 ; 3
    sty    PF1                   ; 3
    lda    PowerOne,X            ; 4
    sta    GRP0                  ; 3
    lda    PowerTwo,X            ; 4
    sta    GRP1                  ; 3
    lda    PowerThree,X          ; 4
    ldy    $BD                   ; 3
    sty    PF2                   ; 3
    sta    GRP0                  ; 3
    lda    #$1C                  ; 2  power bar?
    sta.w  COLUPF                ; 4
    lda    $BB                   ; 3
    sta    PF0                   ; 3
    lda    $BC                   ; 3
    sta    PF1                   ; 3
    ldy    #$FF                  ; 2
    sty    PF2                   ; 3
    sty    PF0                   ; 3
    lda    #4                    ; 2
    sta.w  COLUPF                ; 4
    sta    HMCLR                 ; 3
    dex                          ; 2
    nop                          ; 2
    bpl    LD3D6                 ; 2³+1
    nop                          ; 2
    sta    HMOVE                 ; 3
    lda    #4                    ; 2
    sta    COLUBK                ; 3
    inx                          ; 2
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    stx    GRP0                  ; 3
    ldy    #$0C                  ; 2   height of lives display
    lda    $B3                   ; 3
    eor    #$07                  ; 2
    tax                          ; 2
    lda    #$83                  ; 2   for display of men and dynamite
    sta    HMP0                  ; 3
    sta.w  RESP0                 ; 4
    sta    RESP1                 ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$90                  ; 2
    sta    ENABL                 ; 3
    sta    HMP1                  ; 3
    lda    #$34                  ; 2
    sta    CTRLPF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
;load lives display pointers
    sta    HMOVE                 ; 3
    lda    #$DD                  ; 2  high nybble pointer
    sta    $92                   ; 3
    sta    $96                   ; 3
    lda    #<Lives_Gfx           ; 2
    sta    $91                   ; 3
    lda    #<Lives_Col_Tab       ; 2
    sta    $95                   ; 3
    sta    HMCLR                 ; 3
    jsr    DrawLivesDynamite     ; 6

;load dynamite display pointers
    lda    #<Dynamite_B+1        ; 2
    sta    $91                   ; 3
    lda    #<Dynamite_Col_Tab    ; 2
    sta    $95                   ; 3
    lda    #>Dynamite_B          ; 2
    sta    $92                   ; 3
    ldx    $B2                   ; 3
    inx                          ; 2
    txa                          ; 2
    eor    #$07                  ; 2
    tax                          ; 2
    ldy    #$0A                  ; 2   height of dynamite display
    jsr    DrawLivesDynamite     ; 6

    lda    #$0C                  ; 2
    ldx    $85                   ; 3
    cpx    #$60                  ; 2
    bne    LD470                 ; 2³
    lda    #$1C                  ; 2
LD470:
    sta    COLUP1                ; 3
    sta    COLUP0                ; 3
    jsr    DrawScoreCopyrightLogo  ; 6
    lda    #$0C                  ; 2
    sta    COLUP1                ; 3
    sta    COLUP0                ; 3
    sta    HMCLR                 ; 3
    ldy    #7                    ; 2
    lda    $B6                   ; 3
    and    #$1F                  ; 2
    cmp    #$14                  ; 2
    bcs    LD492                 ; 2³
    ldy    #0                    ; 2
    cmp    #$0C                  ; 2
    bcc    LD492                 ; 2³
    sbc    #$0C                  ; 2
    tay                          ; 2
LD492:
    tya                          ; 2
    eor    #$07                  ; 2
    sta    $BD                   ; 3
    lda    #<CopyrightSix        ; 2
    ldx    #8                    ; 2
    sec                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
LD4A0:
    sta    $87,X                 ; 4
    sbc    #8                    ; 2
    sta    $85,X                 ; 4
    sbc    #8                    ; 2
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
    bpl    LD4A0                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #0                    ; 2
    sta    COLUBK                ; 3
    sta    COLUPF                ; 3
    lda    #$30                  ; 2
    sta    CTRLPF                ; 3
    tya                          ; 2
    jsr    DrawScoreCopyrightLogo2  ; 6
    lda    #$1C                  ; 2
    sta    PF2                   ; 3
    lda    #$11                  ; 2
    sta    NUSIZ1                ; 3
    ldy    #7                    ; 2   start at top of logo
    sty    ENABL                 ; 3
    sta    HMCLR                 ; 3
    sta    HMBL                  ; 3
LD4D0:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    LogoFive,Y            ; 4
    lda    LogoOne,Y             ; 4
    sta    GRP0                  ; 3
    lda    ColorBarsTab,Y        ; 4
    sta    COLUPF                ; 3
    lda    LogoTwo,Y             ; 4
    sta    GRP1                  ; 3
    lda    LogoThree,Y           ; 4
    sta    GRP0                  ; 3
    nop                          ; 2
    nop                          ; 2
    lda    LogoFour,Y            ; 4
    dey                          ; 2
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #0                    ; 2
    sta    COLUPF                ; 3
    dec    $BD                   ; 5   scrolling changes height of logo
    bpl    LD4D0                 ; 2³

    lda    #$1D                  ; 2   Overscan
    ldx    #$82                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    TIM64T                ; 4
    stx    VBLANK                ; 3
    lda    #0                    ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    sta    PF2                   ; 3
    sta    ENABL                 ; 3
    ldx    #2                    ; 2
    bit    $AC                   ; 3
    bvc    LD561                 ; 2³
    lda    $9F                   ; 3
    cmp    #$17                  ; 2
    bne    LD561                 ; 2³
    beq    LD546                 ; 3   always branch

LD528:
    lda    $AD                   ; 3
    ora    $F2                   ; 3
    ora    $F7                   ; 3
    ora    $F8                   ; 3
    bne    LD561                 ; 2³
    lda    #3                    ; 2
    ldy    $F5                   ; 3
    cpy    #9                    ; 2
    bcc    LD542                 ; 2³
    lda    #1                    ; 2
    cpy    #$11                  ; 2
    bcc    LD542                 ; 2³
    lda    #0                    ; 2
LD542:
    and    $F6                   ; 3
    bne    LD561                 ; 2³
LD546:
    lda    $EA,X                 ; 4
    bpl    LD559                 ; 2³
    inc    $EA,X                 ; 6
    lda    LDC5E,X               ; 4
    cmp    $EA,X                 ; 4
    bcs    LD561                 ; 2³
    and    #$7F                  ; 2
    sta    $EA,X                 ; 4
    bpl    LD561                 ; 3   always branch

LD559:
    dec    $EA,X                 ; 6
    bpl    LD561                 ; 2³
    lda    #$80                  ; 2
    sta    $EA,X                 ; 4
LD561:
    dex                          ; 2
    bpl    LD528                 ; 2³
    ldx    #3                    ; 2
    ldy    #0                    ; 2
    lda    $F2                   ; 3
    bne    LD586                 ; 2³
    ldx    $E8                   ; 3
    ldy    $E7                   ; 3
    lda    $81                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    bcc    LD57B                 ; 2³
    dey                          ; 2
    bpl    LD57B                 ; 2³
    ldy    #2                    ; 2
LD57B:
    lda    $81                   ; 3
    and    #$03                  ; 2
    bne    LD586                 ; 2³
    dex                          ; 2
    bpl    LD586                 ; 2³
    ldx    #4                    ; 2
LD586:
    stx    $E8                   ; 3
    sty    $E7                   ; 3
    nop                          ; 2
    nop                          ; 2
    ldx    #0                    ; 2
    ldy    #0                    ; 2
    lda    $B6                   ; 3
    beq    LD59F                 ; 2³
    stx    AUDV0                 ; 3
    stx    AUDC0                 ; 3
    stx    AUDF0                 ; 3
    stx    AUDC1                 ; 3
    jmp    LD634                 ; 3

LD59F:
    lda    #5                    ; 2
    sta    AUDV0                 ; 3
    lda    $AD                   ; 3
    beq    LD5C0                 ; 2³
    cmp    #$96                  ; 2
    bcc    LD5EC                 ; 2³
    sbc    #$60                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDV0                 ; 3
    lda    $81                   ; 3
    lsr                          ; 2
    and    #$01                  ; 2
    tay                          ; 2
    ldx    LDBA0,Y               ; 4
    ldy    #$0F                  ; 2
    bne    LD5EC                 ; 3   always branch

LD5C0:
    lda    $F2                   ; 3
    beq    LD5D8                 ; 2³
    lda    $AB                   ; 3
    beq    LD5EC                 ; 2³
    lda    $81                   ; 3
    lsr                          ; 2
    and    #$03                  ; 2
    tay                          ; 2
    ldx    LDBA7,Y               ; 4
    lda    LDBAB,Y               ; 4
    tay                          ; 2
    jmp    LD5EC                 ; 3

LD5D8:
    bit    INPT4                 ; 3
    bmi    LD5EC                 ; 2³
    bit    $F3                   ; 3
    bmi    LD5EC                 ; 2³
    lda    $81                   ; 3
    and    #$03                  ; 2
    tay                          ; 2
    ldx    LDB9F,Y               ; 4
    lda    LDBA3,Y               ; 4
    tay                          ; 2
LD5EC:
    stx    AUDC0                 ; 3
    sty    AUDF0                 ; 3
    lda    #8                    ; 2
    sta    AUDC1                 ; 3
    lda    $DF                   ; 3
    ora    $E0                   ; 3
    beq    LD613                 ; 2³+1
    ldx    #0                    ; 2
LD5FC:
    inx                          ; 2
    lda    $DE,X                 ; 4
    beq    LD5FC                 ; 2³
    cmp    #$20                  ; 2
    bcc    LD60D                 ; 2³
    lda    $82                   ; 3
    and    #$03                  ; 2
    tax                          ; 2
    tay                          ; 2
    bcs    LD634                 ; 3   always branch

LD60D:
    lsr                          ; 2
    tay                          ; 2
    ldx    #$10                  ; 2
    bne    LD634                 ; 3   always branch

LD613:
    lda    $AB                   ; 3
    beq    LD622                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    eor    #$FF                  ; 2
    tax                          ; 2
    ldy    #4                    ; 2
    bit    $AF                   ; 3
    bpl    LD634                 ; 2³
LD622:
    ldx    #0                    ; 2
    ldy    #0                    ; 2
    lda    $AC                   ; 3
    ora    $AD                   ; 3
    ora    $F2                   ; 3
    bne    LD634                 ; 2³
    ldy    $E7                   ; 3
    ldx    LDBAF,Y               ; 4
    iny                          ; 2
LD634:
    sty    AUDV1                 ; 3
    stx    AUDF1                 ; 3
    lda    $AD                   ; 3
    beq    LD646                 ; 2³
    cmp    #$E0                  ; 2
    bcs    LD65C                 ; 2³
    lda    #$80                  ; 2
    ora    $FD                   ; 3
    sta    $FD                   ; 3
LD646:
    lda    $FD                   ; 3
    bmi    LD651                 ; 2³
    clc                          ; 2
    adc    #1                    ; 2
    and    #$3F                  ; 2
    bpl    LD65A                 ; 3   always branch

LD651:
    and    #$F8                  ; 2
    cmp    #$80                  ; 2
    beq    LD65C                 ; 2³
    sec                          ; 2
    sbc    #1                    ; 2
LD65A:
    sta    $FD                   ; 3
LD65C:
    ldx    #3                    ; 2
    lda    $BA                   ; 3
    ora    $AD                   ; 3
    ora    $F2                   ; 3
    bne    LD6E2                 ; 2³
    lda    $B6                   ; 3
    bne    LD66E                 ; 2³
    bit    INPT4                 ; 3
    bmi    LD6E2                 ; 2³
LD66E:
    ldy    #3                    ; 2
LD670:
    lda    #$80                  ; 2
    ora    $F3                   ; 3
    sta    $F3                   ; 3
    lda    LD9E5,Y               ; 4
    sec                          ; 2
    sbc    $9F                   ; 3
    cmp    #2                    ; 2
    bcc    LD6E2                 ; 2³
    dey                          ; 2
    bpl    LD670                 ; 2³
    bit    $F4                   ; 3
    bmi    LD6AE                 ; 2³
    bvc    LD6B6                 ; 2³
    lda    $A0                   ; 3
    cmp    #$0A                  ; 2
    bcc    LD6AE                 ; 2³
    cmp    #$99                  ; 2
    bcs    LD6AE                 ; 2³
    lda    $81                   ; 3
    lsr                          ; 2
    bcs    LD6AE                 ; 2³
    inc    $B1                   ; 5
    lda    $B1                   ; 3
    bne    LD6A0                 ; 2³
    sta    $A0                   ; 3
LD6A0:
    cmp    #$80                  ; 2
    bne    LD6AE                 ; 2³
    lda    $A0                   ; 3
    cmp    $9B                   ; 3
    bcc    LD6AE                 ; 2³
    adc    #3                    ; 2
    sta    $A0                   ; 3
LD6AE:
    lda    #0                    ; 2
    sta    $F4                   ; 3
    sta    $F3                   ; 3
    beq    LD6BF                 ; 3   always branch

LD6B6:
    lda    $F3                   ; 3
    clc                          ; 2
    adc    #3                    ; 2
    and    #$0F                  ; 2
    sta    $F3                   ; 3
LD6BF:
    lda    $B0                   ; 3
    bne    LD6CC                 ; 2³
    lda    #7                    ; 2
    clc                          ; 2
    adc    $9B                   ; 3
    adc    $F3                   ; 3
    bne    LD6DC                 ; 2³
LD6CC:
    lda    $9B                   ; 3
    sec                          ; 2
    sbc    #5                    ; 2
    ldy    $B1                   ; 3
    cpy    #$80                  ; 2
    bcc    LD6D9                 ; 2³
    adc    #3                    ; 2
LD6D9:
    sec                          ; 2
    sbc    $F3                   ; 3
LD6DC:
    cmp    #$9F                  ; 2
    bcc    LD6E8                 ; 2³
    bcs    LD6E6                 ; 3   always branch

LD6E2:
    lda    #$FD                  ; 2
    sta    $F3                   ; 3
LD6E6:
    lda    #0                    ; 2
LD6E8:
    jsr    HorizPositioning      ; 6
LD6EB:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    INTIM                 ; 4
    bne    LD6EB                 ; 2³
    ldy    #$82                  ; 2
    sty    WSYNC                 ; 3
;---------------------------------------
    sty    VSYNC                 ; 3
    sty    WSYNC                 ; 3
    sty    WSYNC                 ; 3
    sty    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    inc    $81                   ; 5
    bne    LD717                 ; 2³
    inc    $B5                   ; 5
    lda    $B5                   ; 3
    and    #$C7                  ; 2
    sta    $B5                   ; 3
    and    #$07                  ; 2
    bne    LD717                 ; 2³
    inc    $B4                   ; 5
    bne    LD717                 ; 2³
    sec                          ; 2
    ror    $B4                   ; 5
LD717:
    lda    #$33                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    TIM64T                ; 4
    lda    SWCHB                 ; 4
    sta    $FB                   ; 3
    lsr                          ; 2
    bcc    LD774                 ; 2³
    bit    $B4                   ; 3
    bmi    LD774                 ; 2³
    lda    $BA                   ; 3
    bne    LD774                 ; 2³
    lda    $F2                   ; 3
    bne    LD735                 ; 2³
    jmp    LD7B6                 ; 3

LD735:
    lda    $AC                   ; 3
    beq    LD73D                 ; 2³
    lda    #$40                  ; 2
    sta    $AC                   ; 3
LD73D:
    lda    $AB                   ; 3
    beq    LD761                 ; 2³
    ldy    $F5                   ; 3
    lda    #3                    ; 2
    cpy    #6                    ; 2
    bcs    LD74B                 ; 2³
    lda    #2                    ; 2
LD74B:
    and    $81                   ; 3
    bne    LD7B3                 ; 2³
    lda    LD03D,Y               ; 4
    jsr    LDBBA                 ; 6
    ldy    $F5                   ; 3
    lda    LD051,Y               ; 4
    jsr    LDBB2                 ; 6
    dec    $AB                   ; 5
    bne    LD7B3                 ; 2³
LD761:
    lda    $DF                   ; 3
    bne    LD7B3                 ; 2³
    lda    $B2                   ; 3
    beq    LD777                 ; 2³
    dec    $B2                   ; 5
    lda    #$50                  ; 2
    jsr    LDBBA                 ; 6
    lda    #$10                  ; 2
    sta    $DF                   ; 3
LD774:
    jmp    LD7B3                 ; 3

LD777:
    inc    $F2                   ; 5
    lda    $B6                   ; 3
    bne    LD792                 ; 2³
    lda    $80                   ; 3
    and    #$7F                  ; 2
    cmp    #4                    ; 2
    bne    LD792                 ; 2³
    lda    $82                   ; 3
    and    #$1F                  ; 2
    cmp    #$14                  ; 2
    bcc    LD7AC                 ; 2³
    sbc    #$0C                  ; 2
    jmp    LD7AC                 ; 3

LD792:
    inc    $F5                   ; 5
    lda    $B6                   ; 3
    beq    LD79E                 ; 2³
    lda    $F5                   ; 3
    and    #$03                  ; 2
    sta    $F5                   ; 3
LD79E:
    lda    #$13                  ; 2
    cmp    $F5                   ; 3
    bcs    LD7AE                 ; 2³
    lda    #$80                  ; 2
    ora    $80                   ; 3
    sta    $80                   ; 3
    lda    #$0C                  ; 2
LD7AC:
    sta    $F5                   ; 3
LD7AE:
    ldx    #$17                  ; 2
    jsr    LD9F1                 ; 6
LD7B3:
    jmp    LD9DF                 ; 3

LD7B6:
    lda    $AD                   ; 3
    beq    LD817                 ; 2³+1
    ldx    $AE                   ; 3
    cmp    #$96                  ; 2
    bcc    LD7F5                 ; 2³
    beq    LD7DC                 ; 2³
    lda    $9C                   ; 3
    cmp    #$0A                  ; 2
    bcc    LD7FE                 ; 2³
    lda    $9F                   ; 3
    cmp    #$16                  ; 2
    bcs    LD7FE                 ; 2³
    lda    $81                   ; 3
    and    #$07                  ; 2
    bne    LD7FE                 ; 2³
    dec    $9F                   ; 5
    bpl    LD7FE                 ; 2³
    inc    $9F                   ; 5
    beq    LD7FE                 ; 2³
LD7DC:
    lda    #$8C                  ; 2
    sta    $9F                   ; 3
    lda    #$32                  ; 2
    sta    $A1,X                 ; 4
    ldy    #0                    ; 2
    sty    $AC                   ; 3
    lda    $B6                   ; 3
    bne    LD7F5                 ; 2³
    dec    $B3                   ; 5
    bne    LD7F5                 ; 2³
    dey                          ; 2
    sty    $B6                   ; 3
    sty    $BA                   ; 3
LD7F5:
    lda    $9F                   ; 3
    cmp    LDAFC,X               ; 4
    beq    LD802                 ; 2³+1
    dec    $9F                   ; 5
LD7FE:
    dec    $AD                   ; 5
    bne    LD814                 ; 2³
LD802:
    lda    $84                   ; 3
    cmp    #$F0                  ; 2
    beq    LD814                 ; 2³
    lda    $AF                   ; 3
    beq    LD814                 ; 2³
    lda    #0                    ; 2
    sta    $AD                   ; 3
    lda    #$1F                  ; 2
    sta    $E9                   ; 3
LD814:
    jmp    LD949                 ; 3

LD817:
    lda    $E1                   ; 3
    bne    LD889                 ; 2³
    ldy    #0                    ; 2
    sty    $BB                   ; 3
    sty    $E6                   ; 3
    ldx    #2                    ; 2
LD823:
    lda    $E2,X                 ; 4
    bmi    LD830                 ; 2³
    asl                          ; 2
    bpl    LD884                 ; 2³
    lda    $A0                   ; 3
    beq    LD884                 ; 2³
    bne    LD872                 ; 3   always branch

LD830:
    lda    LD9E9,X               ; 4
    cmp    $9F                   ; 3
    beq    LD83E                 ; 2³
    sec                          ; 2
    sbc    #1                    ; 2
    cmp    $9F                   ; 3
    bne    LD859                 ; 2³
LD83E:
    lda    LD9E9,X               ; 4
    sta    $9F                   ; 3
    ldy    #$40                  ; 2
    sty    $E6                   ; 3
    bit    $84                   ; 3
    bpl    LD84D                 ; 2³
    bvs    LD884                 ; 2³
LD84D:
    bit    $AC                   ; 3
    bmi    LD855                 ; 2³
    lda    #2                    ; 2
    sta    $E8                   ; 3
LD855:
    ldy    #$80                  ; 2
    bne    LD884                 ; 3   always branch

LD859:
    lda    LD9EC,X               ; 4
    cmp    $9F                   ; 3
    beq    LD867                 ; 2³
    clc                          ; 2
    adc    #1                    ; 2
    cmp    $9F                   ; 3
    bne    LD872                 ; 2³
LD867:
    lda    LD9EC,X               ; 4
    sta    $9F                   ; 3
    lda    #$80                  ; 2
    sta    $E6                   ; 3
    bne    LD884                 ; 3   always branch

LD872:
    bit    $BB                   ; 3
    bmi    LD884                 ; 2³
    dec    $BB                   ; 5
    lda    #8                    ; 2
    and    $B0                   ; 3
    bne    LD882                 ; 2³
    dec    $9B                   ; 5
    dec    $9B                   ; 5
LD882:
    inc    $9B                   ; 5
LD884:
    dex                          ; 2
    bpl    LD823                 ; 2³
    sty    $AC                   ; 3
LD889:
    ldx    #2                    ; 2
LD88B:
    lda    $F7,X                 ; 4
    bne    LD8A6                 ; 2³
    lda    $D4,X                 ; 4
    bpl    LD8A6                 ; 2³
    cpx    #2                    ; 2
    bne    LD89D                 ; 2³
    lda    #1                    ; 2
    sta    $A4                   ; 3
    bne    LD8A6                 ; 3   always branch

LD89D:
    lda    #$50                  ; 2
    jsr    LDBBA                 ; 6
    lda    #$13                  ; 2
    sta    $F7,X                 ; 4
LD8A6:
    lda    $D1,X                 ; 4
    bpl    LD8BB                 ; 2³
    lda    $F7,X                 ; 4
    bne    LD8BB                 ; 2³
    cpx    #2                    ; 2
    bne    LD8B8                 ; 2³
    lda    #1                    ; 2
    sta    $A4                   ; 3
    bne    LD8BB                 ; 3   always branch

LD8B8:
    jsr    LDE6B                 ; 6
LD8BB:
    lda    $E2,X                 ; 4
    and    #$C0                  ; 2
    beq    LD8DC                 ; 2³
    lda    $C5,X                 ; 4
    and    #$F0                  ; 2
    cmp    #$40                  ; 2
    bne    LD8DC                 ; 2³
    stx    $BB                   ; 3
    lda    $9F                   ; 3
    cmp    #$63                  ; 2
    bcc    LD8D2                 ; 2³
    inx                          ; 2
LD8D2:
    cmp    #$25                  ; 2
    bcs    LD8D7                 ; 2³
    dex                          ; 2
LD8D7:
    jsr    LDE6B                 ; 6
    ldx    $BB                   ; 3
LD8DC:
    dex                          ; 2
    bpl    LD88B                 ; 2³
    lda    $AC                   ; 3
    beq    LD912                 ; 2³+1
    lda    $B2                   ; 3
    beq    LD912                 ; 2³+1
    ldx    #2                    ; 2
    lda    $9F                   ; 3
    cmp    #$62                  ; 2
    bcs    LD8F0                 ; 2³
    dex                          ; 2
LD8F0:
    lda    $A8,X                 ; 4
    cmp    #$93                  ; 2
    bne    LD912                 ; 2³+1
    lda    $DE,X                 ; 4
    bne    LD912                 ; 2³+1
    
;    lda    $84                   ; 3
;    cmp    #$D0                  ; 2
;    bne    LD912                 ; 2³
    
    bit   $09
    bmi   LD912
    nop
    nop
    
    lda    $9B                   ; 3
    and    #$03                  ; 2
    bne    LD912                 ; 2³
    lda    $9B                   ; 3
    cmp    #$0D                  ; 2
    bcc    LD912                 ; 2³
    sta    $A8,X                 ; 4
    lda    #$40                  ; 2
    sta    $DE,X                 ; 4
LD912:
    lda    $AD                   ; 3
    bne    LD932                 ; 2³
    jsr    LDC56                 ; 6
    bne    LD932                 ; 2³
    lda    $A9                   ; 3
    sec                          ; 2
    sbc    #7                    ; 2
    sta    $BB                   ; 3
    lda    $9B                   ; 3
    sec                          ; 2
    sbc    $BB                   ; 3
    cmp    #$0F                  ; 2
    bcs    LD932                 ; 2³
    lda    #$10                  ; 2
    jsr    LDBB2                 ; 6
    dec    $F2                   ; 5
LD932:
    bit    $AF                   ; 3
    bpl    LD949                 ; 2³
    lda    #$3F                  ; 2
    and    $81                   ; 3
    bne    LD949                 ; 2³
    dec    $AB                   ; 5
    bne    LD949                 ; 2³
    ldx    #$17                  ; 2
    jsr    LD9F1                 ; 6
    lda    #$FF                  ; 2
    sta    $AD                   ; 3
LD949:
    ldx    #2                    ; 2
LD94B:
    lda    $DE,X                 ; 4
    cmp    #$1F                  ; 2
    beq    LD956                 ; 2³
    dex                          ; 2
    bpl    LD94B                 ; 2³
    bmi    LD9C7                 ; 3   always branch

LD956:
    dec    $B2                   ; 5
    lda    $A1,X                 ; 4
    cmp    #$32                  ; 2
    beq    LD97E                 ; 2³
    lda    $A5,X                 ; 4
    sec                          ; 2
    sbc    #$13                  ; 2
    cmp    $A8,X                 ; 4
    bcs    LD97E                 ; 2³
    adc    #$23                  ; 2
    cmp    $A8,X                 ; 4
    bcc    LD97E                 ; 2³
    lda    $F7,X                 ; 4
    bne    LD97E                 ; 2³
    cpx    #2                    ; 2
    beq    LD97E                 ; 2³
    lda    #$13                  ; 2
    sta    $F7,X                 ; 4
    lda    #$50                  ; 2
    jsr    LDBBA                 ; 6
LD97E:
    lda    $A0                   ; 3
    cmp    #$99                  ; 2
    bcs    LD99B                 ; 2³
    sbc    #$0E                  ; 2
    cmp    $A8,X                 ; 4
    bcs    LD99B                 ; 2³
    adc    #$1B                  ; 2
    cmp    $A8,X                 ; 4
    bcc    LD99B                 ; 2³
    lda    #0                    ; 2
    sta    $A0                   ; 3
    lda    #$75                  ; 2
    sta    $FA                   ; 3
    jsr    LDBBA                 ; 6
LD99B:
    lda    $9F                   ; 3
    cmp    LDBFC,X               ; 4
    bcc    LD9C7                 ; 2³
    cmp    LDAFF,X               ; 4
    bcs    LD9C7                 ; 2³
    lda    $A8,X                 ; 4
    cmp    #$93                  ; 2
    bcs    LD9C7                 ; 2³
    sbc    #7                    ; 2
    sta    $BB                   ; 3
    lda    $9B                   ; 3
    sec                          ; 2
    sbc    $BB                   ; 3
    cmp    #$11                  ; 2
    bcs    LD9C7                 ; 2³
    dec    $9B                   ; 5
    lda    $B0                   ; 3
    beq    LD9C4                 ; 2³
    inc    $9B                   ; 5
    inc    $9B                   ; 5
LD9C4:
    jsr    LDE6B                 ; 6
LD9C7:
    lda    $BA                   ; 3
    ora    $AF                   ; 3
    bmi    LD9DF                 ; 2³
    lda    $AD                   ; 3
    cmp    #$77                  ; 2
    bcs    LD9DF                 ; 2³
    inc    $AB                   ; 5
    lda    #$51                  ; 2
    cmp    $AB                   ; 3
    bcs    LD9DF                 ; 2³
    sta    $AB                   ; 3
    dec    $AF                   ; 5
LD9DF:
    jmp    LDFF2                 ; 3

LD9E2:
    .byte $FF ; |XXXXXXXX| $D9E2
    .byte $00 ; |        | $D9E3
    .byte $FF ; |XXXXXXXX| $D9E4
LD9E5:
    .byte $76 ; | XXX XX | $D9E5
    .byte $50 ; | X X    | $D9E6
    .byte $29 ; |  X X  X| $D9E7
    .byte $77 ; | XXX XXX| $D9E8
LD9E9:
    .byte $3C ; |  XXXX  | $D9E9
    .byte $63 ; | XX   XX| $D9EA
    .byte $EF ; |XXX XXXX| $D9EB
LD9EC:
    .byte $EF ; |XXX XXXX| $D9EC
    .byte $24 ; |  X  X  | $D9ED
    .byte $4B ; | X  X XX| $D9EE
    .byte $A2 ; |X X   X | $D9EF
    .byte $18 ; |   XX   | $D9F0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LD9F1 SUBROUTINE

.loopLD9F1:
    lda    LDA04,X               ; 4
    sta    $9B,X                 ; 4
    dex                          ; 2
    bpl    .loopLD9F1            ; 2³
    lda    $F5                   ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    LDD13,X               ; 4
    sta    $A4                   ; 3
    rts                          ; 6

LDA04:
    .byte $20 ; |  X     | $DA04
    .byte $00 ; |        | $DA05
    .byte $00 ; |        | $DA06
    .byte $00 ; |        | $DA07
    .byte $8B ; |X   X XX| $DA08
    .byte $3D ; |  XXXX X| $DA09
    .byte $32 ; |  XX  X | $DA0A
    .byte $32 ; |  XX  X | $DA0B
    .byte $32 ; |  XX  X | $DA0C
    .byte $20 ; |  X     | $DA0D
    .byte $93 ; |X  X  XX| $DA0E
    .byte $93 ; |X  X  XX| $DA0F
    .byte $93 ; |X  X  XX| $DA10
    .byte $93 ; |X  X  XX| $DA11
    .byte $93 ; |X  X  XX| $DA12
    .byte $93 ; |X  X  XX| $DA13
    .byte $00 ; |        | $DA14
    .byte $00 ; |        | $DA15
    .byte $95 ; |X  X X X| $DA16
    .byte $01 ; |       X| $DA17
    .byte $00 ; |        | $DA18
    .byte $00 ; |        | $DA19
    .byte $00 ; |        | $DA1A
    .byte $06 ; |     XX | $DA1B
    .byte $04 ; |     X  | $DA1C
LDA1D:
    .byte $36 ; |  XX XX | $DA1D
    .byte $3A ; |  XXX X | $DA1E
    .byte $3E ; |  XXXXX | $DA1F
    .byte $42 ; | X    X | $DA20
    .byte $46 ; | X   XX | $DA21
    .byte $4A ; | X  X X | $DA22
    .byte $4E ; | X  XXX | $DA23
    .byte $52 ; | X X  X | $DA24
    .byte $00 ; |        | $DA25
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;checked between ;;;;; for used, not used. Possible some is just not being written.

Dynamite_A:
    .byte $00 ; |        | $DA26 [not used]
    .byte $1C ; |   XXX  | $DA27
    .byte $1C ; |   XXX  | $DA28
    .byte $1C ; |   XXX  | $DA29
    .byte $1C ; |   XXX  | $DA2A
    .byte $1C ; |   XXX  | $DA2B
    .byte $1C ; |   XXX  | $DA2C
    .byte $08 ; |    X   | $DA2D
    .byte $08 ; |    X   | $DA2E
    .byte $18 ; |   XX   | $DA2F
    .byte $10 ; |   X    | $DA30
    .byte $04 ; |     X  | $DA31
    .byte $00 ; |        | $DA32
Dynamite_B:
    .byte $00 ; |        | $DA33 [not used]
    .byte $1C ; |   XXX  | $DA34
    .byte $1C ; |   XXX  | $DA35
    .byte $1C ; |   XXX  | $DA36
    .byte $1C ; |   XXX  | $DA37
    .byte $1C ; |   XXX  | $DA38
    .byte $1C ; |   XXX  | $DA39
    .byte $08 ; |    X   | $DA3A
    .byte $08 ; |    X   | $DA3B
    .byte $0C ; |    XX  | $DA3C
    .byte $18 ; |   XX   | $DA3D
    .byte $08 ; |    X   | $DA3E
    .byte $00 ; |        | $DA3F
Dynamite_C:
    .byte $00 ; |        | $DA40 [not used]
    .byte $1C ; |   XXX  | $DA41
    .byte $1C ; |   XXX  | $DA42
    .byte $1C ; |   XXX  | $DA43
    .byte $1C ; |   XXX  | $DA44
    .byte $1C ; |   XXX  | $DA45
    .byte $1C ; |   XXX  | $DA46
    .byte $08 ; |    X   | $DA47
    .byte $08 ; |    X   | $DA48
    .byte $0C ; |    XX  | $DA49
    .byte $04 ; |     X  | $DA4A
    .byte $10 ; |   X    | $DA4B
    .byte $00 ; |        | $DA4C
Explosion_A:
    .byte $00 ; |        | $DA4D [not used]
    .byte $00 ; |        | $DA4E
    .byte $18 ; |   XX   | $DA4F
    .byte $3C ; |  XXXX  | $DA50
    .byte $3C ; |  XXXX  | $DA51
    .byte $18 ; |   XX   | $DA52
    .byte $3C ; |  XXXX  | $DA53
    .byte $3C ; |  XXXX  | $DA54
    .byte $18 ; |   XX   | $DA55
    .byte $00 ; |        | $DA56
    .byte $00 ; |        | $DA57
Explosion_B:
    .byte $00 ; |        | $DA58 [used only by Explosion A]
    .byte $45 ; | X   X X| $DA59   shared
    .byte $1C ; |   XXX  | $DA5A
    .byte $18 ; |   XX   | $DA5B
    .byte $3E ; |  XXXXX | $DA5C
    .byte $7C ; | XXXXX  | $DA5D
    .byte $38 ; |  XXX   | $DA5E
    .byte $9D ; |X  XXX X| $DA5F
    .byte $3C ; |  XXXX  | $DA60
    .byte $3C ; |  XXXX  | $DA61
    .byte $18 ; |   XX   | $DA62
    .byte $52 ; | X X  X | $DA63
    .byte $00 ; |        | $DA64
Explosion_C:
    .byte $22 ; |  X   X | $DA65 [not used]
    .byte $88 ; |X   X   | $DA66
    .byte $59 ; | X XX  X| $DA67
    .byte $7E ; | XXXXXX | $DA68
    .byte $3C ; |  XXXX  | $DA69
    .byte $B8 ; |X XXX   | $DA6A
    .byte $1D ; |   XXX X| $DA6B
    .byte $3C ; |  XXXX  | $DA6C
    .byte $7E ; | XXXXXX | $DA6D
    .byte $5A ; | X XX X | $DA6E
    .byte $91 ; |X  X   X| $DA6F
    .byte $04 ; |     X  | $DA70
Victim_A:
    .byte $00 ; |        | $DA71 [used only by Explosion C]
    .byte $CC ; |XX  XX  | $DA72
    .byte $5E ; | X XXXX | $DA73
    .byte $76 ; | XXX XX | $DA74
    .byte $2A ; |  X X X | $DA75
    .byte $0A ; |    X X | $DA76
    .byte $0A ; |    X X | $DA77
    .byte $0E ; |    XXX | $DA78
    .byte $04 ; |     X  | $DA79
    .byte $0C ; |    XX  | $DA7A
    .byte $0C ; |    XX  | $DA7B
    .byte $1C ; |   XXX  | $DA7C
    .byte $08 ; |    X   | $DA7D
Victim_B:
    .byte $00 ; |        | $DA7E [not used]
    .byte $CC ; |XX  XX  | $DA7F
    .byte $56 ; | X X XX | $DA80
    .byte $7A ; | XXXX X | $DA81
    .byte $2A ; |  X X X | $DA82
    .byte $0A ; |    X X | $DA83
    .byte $3A ; |  XXX X | $DA84
    .byte $2E ; |  X XXX | $DA85
    .byte $24 ; |  X  X  | $DA86
    .byte $2C ; |  X XX  | $DA87
    .byte $0C ; |    XX  | $DA88
    .byte $1C ; |   XXX  | $DA89
    .byte $08 ; |    X   | $DA8A
SeventyFive:
    .byte $00 ; |        | $DA8B
    .byte $00 ; |        | $DA8C
    .byte $00 ; |        | $DA8D
    .byte $00 ; |        | $DA8E
    .byte $2E ; |  X XXX | $DA8F
    .byte $22 ; |  X   X | $DA90
    .byte $2E ; |  X XXX | $DA91
    .byte $28 ; |  X X   | $DA92
    .byte $EE ; |XXX XXX | $DA93
    .byte $00 ; |        | $DA94 unknown if any sharing
    .byte $00 ; |        | $DA95 unknown if any sharing
    .byte $00 ; |        | $DA96 unknown if any sharing
    .byte $00 ; |        | $DA97 unknown if any sharing
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $FF ; |XXXXXXXX| $DA98
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
    .byte $62 ; | XX   X | $DAA7
    .byte $34 ; |  XX X  | $DAA8
    .byte $18 ; |   XX   | $DAA9
    .byte $00 ; |        | $DAAA
    .byte $00 ; |        | $DAAB
    .byte $00 ; |        | $DAAC
    .byte $00 ; |        | $DAAD
    .byte $00 ; |        | $DAAE
    .byte $00 ; |        | $DAAF
    .byte $00 ; |        | $DAB0
    .byte $00 ; |        | $DAB1
    .byte $00 ; |        | $DAB2
    .byte $62 ; | XX   X | $DAB3
    .byte $41 ; | X     X| $DAB4
    .byte $63 ; | XX   XX| $DAB5
    .byte $36 ; |  XX XX | $DAB6
    .byte $1C ; |   XXX  | $DAB7
    .byte $00 ; |        | $DAB8
    .byte $00 ; |        | $DAB9
    .byte $00 ; |        | $DABA
    .byte $00 ; |        | $DABB
    .byte $00 ; |        | $DABC
    .byte $00 ; |        | $DABD
    .byte $00 ; |        | $DABE
    .byte $20 ; |  X     | $DABF
    .byte $66 ; | XX  XX | $DAC0
    .byte $4B ; | X  X XX| $DAC1
    .byte $41 ; | X     X| $DAC2
    .byte $63 ; | XX   XX| $DAC3
    .byte $22 ; |  X   X | $DAC4
    .byte $36 ; |  XX XX | $DAC5
    .byte $1C ; |   XXX  | $DAC6
    .byte $00 ; |        | $DAC7
    .byte $00 ; |        | $DAC8
    .byte $00 ; |        | $DAC9
    .byte $00 ; |        | $DACA
    .byte $36 ; |  XX XX | $DACB
    .byte $60 ; | XX     | $DACC
    .byte $4C ; | X  XX  | $DACD
    .byte $52 ; | X X  X | $DACE
    .byte $53 ; | X X  XX| $DACF
    .byte $49 ; | X  X  X| $DAD0
    .byte $63 ; | XX   XX| $DAD1
    .byte $36 ; |  XX XX | $DAD2
    .byte $1C ; |   XXX  | $DAD3
    .byte $00 ; |        | $DAD4
    .byte $00 ; |        | $DAD5
    .byte $00 ; |        | $DAD6
    .byte $2F ; |  X XXXX| $DAD7
    .byte $26 ; |  X  XX | $DAD8
    .byte $26 ; |  X  XX | $DAD9
    .byte $60 ; | XX     | $DADA
    .byte $4C ; | X  XX  | $DADB
    .byte $52 ; | X X  X | $DADC
    .byte $51 ; | X X   X| $DADD
    .byte $55 ; | X X X X| $DADE
    .byte $69 ; | XX X  X| $DADF
    .byte $22 ; |  X   X | $DAE0
    .byte $1C ; |   XXX  | $DAE1

    .byte $00 ; |        | $DAE2
    .byte $6C ; | XX XX  | $DAE3
    .byte $28 ; |  X X   | $DAE4
    .byte $28 ; |  X X   | $DAE5
    .byte $28 ; |  X X   | $DAE6
    .byte $28 ; |  X X   | $DAE7
    .byte $28 ; |  X X   | $DAE8
    .byte $28 ; |  X X   | $DAE9
    .byte $28 ; |  X X   | $DAEA
    .byte $38 ; |  XXX   | $DAEB
    .byte $BA ; |X XXX X | $DAEC
    .byte $BA ; |X XXX X | $DAED
    .byte $B6 ; |X XX XX | $DAEE
    .byte $B4 ; |X XX X  | $DAEF
    .byte $7C ; | XXXXX  | $DAF0
    .byte $4A ; | X  X X | $DAF1
    .byte $36 ; |  XX XX | $DAF2
    .byte $32 ; |  XX  X | $DAF3
    .byte $7A ; | XXXX X | $DAF4
    .byte $4A ; | X  X X | $DAF5
    .byte $4A ; | X  X X | $DAF6
    .byte $36 ; |  XX XX | $DAF7
    .byte $04 ; |     X  | $DAF8
    .byte $04 ; |     X  | $DAF9
    .byte $1F ; |   XXXXX| $DAFA
    .byte $00 ; |        | $DAFB

LDAFC:
    .byte $22 ; |  X   X | $DAFC
    .byte $49 ; | X  X  X| $DAFD
    .byte $70 ; | XXX    | $DAFE
LDAFF:
    .byte $1C ; |   XXX  | $DAFF
    .byte $43 ; | X    XX| $DB00
    .byte $6A ; | XX X X | $DB01

Bat_A:
    .byte $00 ; |        | $DB02
    .byte $00 ; |        | $DB03
    .byte $00 ; |        | $DB04
    .byte $00 ; |        | $DB05
    .byte $10 ; |   X    | $DB06
    .byte $7C ; | XXXXX  | $DB07
    .byte $FE ; |XXXXXXX | $DB08
    .byte $EE ; |XXX XXX | $DB09
    .byte $D6 ; |XX X XX | $DB0A
    .byte $AA ; |X X X X | $DB0B
    .byte $82 ; |X     X | $DB0C
    .byte $00 ; |        | $DB0D
Bat_B:
    .byte $00 ; |        | $DB0E   shared
    .byte $44 ; | X   X  | $DB0F
    .byte $82 ; |X     X | $DB10
    .byte $C6 ; |XX   XX | $DB11
    .byte $D6 ; |XX X XX | $DB12
    .byte $7C ; | XXXXX  | $DB13
    .byte $38 ; |  XXX   | $DB14
    .byte $10 ; |   X    | $DB15
    .byte $28 ; |  X X   | $DB16
    .byte $00 ; |        | $DB17
    .byte $00 ; |        | $DB18
    .byte $00 ; |        | $DB19
Spider_A:
    .byte $00 ; |        | $DB1A   shared
    .byte $00 ; |        | $DB1B
    .byte $82 ; |X     X | $DB1C
    .byte $92 ; |X  X  X | $DB1D
    .byte $BA ; |X XXX X | $DB1E
    .byte $BA ; |X XXX X | $DB1F
    .byte $54 ; | X X X  | $DB20
    .byte $10 ; |   X    | $DB21
    .byte $10 ; |   X    | $DB22
    .byte $10 ; |   X    | $DB23
    .byte $10 ; |   X    | $DB24
    .byte $10 ; |   X    | $DB25
    .byte $10 ; |   X    | $DB26
Spider_B:
    .byte $00 ; |        | $DB27
    .byte $82 ; |X     X | $DB28
    .byte $92 ; |X  X  X | $DB29
    .byte $BA ; |X XXX X | $DB2A
    .byte $BA ; |X XXX X | $DB2B
    .byte $54 ; | X X X  | $DB2C
    .byte $10 ; |   X    | $DB2D
    .byte $10 ; |   X    | $DB2E
    .byte $10 ; |   X    | $DB2F
    .byte $10 ; |   X    | $DB30
    .byte $10 ; |   X    | $DB31
    .byte $10 ; |   X    | $DB32
    .byte $10 ; |   X    | $DB33
Moth_A:
    .byte $00 ; |        | $DB34
    .byte $82 ; |X     X | $DB35
    .byte $C6 ; |XX   XX | $DB36
    .byte $6C ; | XX XX  | $DB37
    .byte $28 ; |  X X   | $DB38
    .byte $38 ; |  XXX   | $DB39
    .byte $7C ; | XXXXX  | $DB3A
    .byte $38 ; |  XXX   | $DB3B
    .byte $28 ; |  X X   | $DB3C
    .byte $6C ; | XX XX  | $DB3D
    .byte $C6 ; |XX   XX | $DB3E
    .byte $82 ; |X     X | $DB3F
Moth_B:
    .byte $00 ; |        | $DB40   shared
    .byte $44 ; | X   X  | $DB41
    .byte $6C ; | XX XX  | $DB42
    .byte $28 ; |  X X   | $DB43
    .byte $28 ; |  X X   | $DB44
    .byte $38 ; |  XXX   | $DB45
    .byte $7C ; | XXXXX  | $DB46
    .byte $38 ; |  XXX   | $DB47
    .byte $28 ; |  X X   | $DB48
    .byte $28 ; |  X X   | $DB49
    .byte $6C ; | XX XX  | $DB4A
    .byte $44 ; | X   X  | $DB4B
Moth_C:
    .byte $00 ; |        | $DB4C   shared
    .byte $10 ; |   X    | $DB4D
    .byte $38 ; |  XXX   | $DB4E
    .byte $28 ; |  X X   | $DB4F
    .byte $28 ; |  X X   | $DB50
    .byte $38 ; |  XXX   | $DB51
    .byte $7C ; | XXXXX  | $DB52
    .byte $38 ; |  XXX   | $DB53
    .byte $28 ; |  X X   | $DB54
    .byte $28 ; |  X X   | $DB55
    .byte $38 ; |  XXX   | $DB56
    .byte $10 ; |   X    | $DB57
Moth_D:
    .byte $00 ; |        | $DB58   shared
    .byte $28 ; |  X X   | $DB59
    .byte $28 ; |  X X   | $DB5A
    .byte $28 ; |  X X   | $DB5B
    .byte $28 ; |  X X   | $DB5C
    .byte $38 ; |  XXX   | $DB5D
    .byte $7C ; | XXXXX  | $DB5E
    .byte $38 ; |  XXX   | $DB5F
    .byte $28 ; |  X X   | $DB60
    .byte $28 ; |  X X   | $DB61
    .byte $28 ; |  X X   | $DB62
    .byte $28 ; |  X X   | $DB63
Lantern:
    .byte $00 ; |        | $DB64   shared
    .byte $09 ; |    X  X| $DB65
    .byte $1D ; |   XXX X| $DB66
    .byte $3F ; |  XXXXXX| $DB67
    .byte $1D ; |   XXX X| $DB68
    .byte $3F ; |  XXXXXX| $DB69
    .byte $1D ; |   XXX X| $DB6A
    .byte $09 ; |    X  X| $DB6B
    .byte $0F ; |    XXXX| $DB6C
Fifty_A:
    .byte $00 ; |        | $DB6D   shared
    .byte $00 ; |        | $DB6E   shared
    .byte $00 ; |        | $DB6F   shared
    .byte $00 ; |        | $DB70   shared
    .byte $EE ; |XXX XXX | $DB71
    .byte $A8 ; |X X X   | $DB72
    .byte $AE ; |X X XXX | $DB73
    .byte $A2 ; |X X   X | $DB74
    .byte $EE ; |XXX XXX | $DB75
Fifty_B:
    .byte $00 ; |        | $DB76   shared
    .byte $00 ; |        | $DB77   shared
    .byte $00 ; |        | $DB78   shared
    .byte $00 ; |        | $DB79   shared
    .byte $EE ; |XXX XXX | $DB7A
    .byte $2A ; |  X X X | $DB7B
    .byte $EA ; |XXX X X | $DB7C
    .byte $8A ; |X   X X | $DB7D
    .byte $EE ; |XXX XXX | $DB7E
Snake_A:
    .byte $00 ; |        | $DB7F   shared
    .byte $00 ; |        | $DB80   shared
    .byte $00 ; |        | $DB81   shared
    .byte $00 ; |        | $DB82   shared
    .byte $02 ; |      X | $DB83
    .byte $07 ; |     XXX| $DB84
    .byte $FC ; |XXXXXX  | $DB85
    .byte $F9 ; |XXXXX  X| $DB86
    .byte $FF ; |XXXXXXXX| $DB87
    .byte $0D ; |    XX X| $DB88
    .byte $06 ; |     XX | $DB89
    .byte $00 ; |        | $DB8A
    .byte $00 ; |        | $DB8B

    .byte $00 ; |        | $DB8C [not used]
    .byte $00 ; |        | $DB8D [not used]
    .byte $00 ; |        | $DB8E [not used]
    .byte $00 ; |        | $DB8F [not used]
    .byte $00 ; |        | $DB90 [not used]
    .byte $00 ; |        | $DB91 [not used]

Snake_B:
    .byte $00 ; |        | $DB92
    .byte $00 ; |        | $DB93
    .byte $00 ; |        | $DB94
    .byte $00 ; |        | $DB95
    .byte $00 ; |        | $DB96
    .byte $02 ; |      X | $DB97
    .byte $FF ; |XXXXXXXX| $DB98
    .byte $FD ; |XXXXXX X| $DB99
    .byte $FF ; |XXXXXXXX| $DB9A
    .byte $0D ; |    XX X| $DB9B
    .byte $06 ; |     XX | $DB9C
    .byte $00 ; |        | $DB9D
    .byte $00 ; |        | $DB9E

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LDB9F:
    .byte $0C ; |    XX  | $DB9F
LDBA0:
    .byte $0C ; |    XX  | $DBA0
    .byte $04 ; |     X  | $DBA1
    .byte $04 ; |     X  | $DBA2
LDBA3:
    .byte $0C ; |    XX  | $DBA3
    .byte $0F ; |    XXXX| $DBA4
    .byte $1C ; |   XXX  | $DBA5
    .byte $1F ; |   XXXXX| $DBA6
LDBA7:
    .byte $0C ; |    XX  | $DBA7
    .byte $00 ; |        | $DBA8
    .byte $00 ; |        | $DBA9
    .byte $00 ; |        | $DBAA
LDBAB:
    .byte $0F ; |    XXXX| $DBAB
    .byte $00 ; |        | $DBAC
    .byte $00 ; |        | $DBAD
    .byte $00 ; |        | $DBAE
LDBAF:
    .byte $10 ; |   X    | $DBAF
    .byte $13 ; |   X  XX| $DBB0
    .byte $17 ; |   X XXX| $DBB1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LDBB2 SUBROUTINE
    ldy    $B7                   ; 3
    sty    $BB                   ; 3
    ldy    #1                    ; 2
    bne    LDBC0                 ; 3   always branch

LDBBA SUBROUTINE
    ldy    $B7                   ; 3
    sty    $BB                   ; 3
    ldy    #2                    ; 2
LDBC0:
    sta    $BC                   ; 3
    lda    $B6                   ; 3
    bne    LDBFB                 ; 2³
    lda    $BC                   ; 3
    sed                          ; 2
    cmp    #$99                  ; 2
LDBCB:
    adc.wy $B7,Y                 ; 4
    sta.wy $B7,Y                 ; 5
    lda    #0                    ; 2
    dey                          ; 2
    bpl    LDBCB                 ; 2³
    cld                          ; 2
    bcc    LDBE5                 ; 2³
    sty    $BA                   ; 3
    sty    $B6                   ; 3
    lda    #$BB                  ; 2
    sta    $B7                   ; 3
    sta    $B8                   ; 3
    sta    $B9                   ; 3
LDBE5:
    lda    $BB                   ; 3
    and    #$12                  ; 2
    sta    $BB                   ; 3
    lda    $B7                   ; 3
    and    #$12                  ; 2
    eor    $BB                   ; 3
    beq    LDBFB                 ; 2³
    ldy    #7                    ; 2
    cpy    $B3                   ; 3
    beq    LDBFB                 ; 2³
    inc    $B3                   ; 5
LDBFB:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LDBFC:
    .byte $15 ; |   X X X| $DBFC
    .byte $3C ; |  XXXX  | $DBFD
    .byte $63 ; | XX   XX| $DBFE
    .byte $00 ; |        | $DBFF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DrawLivesDynamite SUBROUTINE

.loopDrawLivesDynamite:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ($91),Y               ; 5
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    ($95),Y               ; 5
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    LDC6C,X               ; 4
    sta    PF2                   ; 3
    lda    LDC6A,X               ; 4
    sta    PF0                   ; 3
    lda    LDC77,X               ; 4
    sta    PF1                   ; 3
    dey                          ; 2
    bpl    .loopDrawLivesDynamite  ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    iny                          ; 2
    sty    PF0                   ; 3
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $FF ; |XXXXXXXX| $DC36
    .byte $7E ; | XXXXXX | $DC37
    .byte $3C ; |  XXXX  | $DC38
    .byte $18 ; |   XX   | $DC39
    .byte $FF ; |XXXXXXXX| $DC3A
    .byte $FC ; |XXXXXX  | $DC3B
    .byte $78 ; | XXXX   | $DC3C
    .byte $30 ; |  XX    | $DC3D
    .byte $FF ; |XXXXXXXX| $DC3E
    .byte $F9 ; |XXXXX  X| $DC3F
    .byte $F0 ; |XXXX    | $DC40
    .byte $60 ; | XX     | $DC41
    .byte $FF ; |XXXXXXXX| $DC42
    .byte $F3 ; |XXXX  XX| $DC43
    .byte $E1 ; |XXX    X| $DC44
    .byte $C0 ; |XX      | $DC45
    .byte $FF ; |XXXXXXXX| $DC46
    .byte $E7 ; |XXX  XXX| $DC47
    .byte $C3 ; |XX    XX| $DC48
    .byte $81 ; |X      X| $DC49
    .byte $FF ; |XXXXXXXX| $DC4A
    .byte $CF ; |XX  XXXX| $DC4B
    .byte $87 ; |X    XXX| $DC4C
    .byte $03 ; |      XX| $DC4D
    .byte $FF ; |XXXXXXXX| $DC4E
    .byte $9F ; |X  XXXXX| $DC4F
    .byte $0F ; |    XXXX| $DC50
    .byte $06 ; |     XX | $DC51
    .byte $FF ; |XXXXXXXX| $DC52
    .byte $3F ; |  XXXXXX| $DC53
    .byte $1E ; |   XXXX | $DC54
    .byte $0C ; |    XX  | $DC55

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LDC56 SUBROUTINE
    ldx    $F5                   ; 3
    lda    LD065,X               ; 4
    cmp    $9C                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LDC5E:
    .byte $87 ; |X    XXX| $DC5E
    .byte $96 ; |X  X XX | $DC5F
    .byte $E0 ; |XXX     | $DC60
LDC61:
    .byte $FF ; |XXXXXXXX| $DC61
    .byte $7E ; | XXXXXX | $DC62
    .byte $3C ; |  XXXX  | $DC63
    .byte $18 ; |   XX   | $DC64
    .byte $00 ; |        | $DC65  2nd peak on roof
LDC66:
    .byte $F0 ; |XXXX    | $DC66
    .byte $F0 ; |XXXX    | $DC67
    .byte $60 ; | XX     | $DC68  peak on roof
LDC69:
    .byte $00 ; |        | $DC69
LDC6A:
    .byte $00 ; |        | $DC6A
LDC6B:
    .byte $00 ; |        | $DC6B
LDC6C:
    .byte $03 ; |      XX| $DC6C
    .byte $0F ; |    XXXX| $DC6D
    .byte $3F ; |  XXXXXX| $DC6E
    .byte $FF ; |XXXXXXXX| $DC6F
    .byte $FF ; |XXXXXXXX| $DC70   playfield (solid grey)
    .byte $FF ; |XXXXXXXX| $DC71
    .byte $FF ; |XXXXXXXX| $DC72
    .byte $FF ; |XXXXXXXX| $DC73
    .byte $FF ; |XXXXXXXX| $DC74
    .byte $FF ; |XXXXXXXX| $DC75
LDC76:
    .byte $00 ; |        | $DC76
LDC77:
    .byte $00 ; |        | $DC77
    .byte $00 ; |        | $DC78
    .byte $00 ; |        | $DC79
    .byte $00 ; |        | $DC7A
    .byte $00 ; |        | $DC7B
    .byte $00 ; |        | $DC7C
    .byte $C0 ; |XX      | $DC7D
    .byte $F0 ; |XXXX    | $DC7E
    .byte $FC ; |XXXXXX  | $DC7F
    .byte $FF ; |XXXXXXXX| $DC80

    .byte $FF ; |XXXXXXXX| $DC81
    .byte $00 ; |        | $DC82
    .byte $02 ; |      X | $DC83
    .byte $43 ; | X    XX| $DC84
    .byte $44 ; | X   X  | $DC85
    .byte $74 ; | XXX X  | $DC86
    .byte $14 ; |   X X  | $DC87
    .byte $1C ; |   XXX  | $DC88
    .byte $1C ; |   XXX  | $DC89
    .byte $18 ; |   XX   | $DC8A
    .byte $1C ; |   XXX  | $DC8B
    .byte $22 ; |  X   X | $DC8C
    .byte $2E ; |  X XXX | $DC8D
    .byte $76 ; | XXX XX | $DC8E
    .byte $76 ; | XXX XX | $DC8F
    .byte $7E ; | XXXXXX | $DC90
    .byte $6C ; | XX XX  | $DC91
    .byte $26 ; |  X  XX | $DC92
    .byte $2E ; |  X XXX | $DC93
    .byte $28 ; |  X X   | $DC94
    .byte $28 ; |  X X   | $DC95
    .byte $26 ; |  X  XX | $DC96
    .byte $20 ; |  X     | $DC97
    .byte $20 ; |  X     | $DC98
    .byte $F8 ; |XXXXX   | $DC99

    .byte $FF ; |XXXXXXXX| $DC9A
    .byte $0C ; |    XX  | $DC9B
    .byte $08 ; |    X   | $DC9C
    .byte $28 ; |  X X   | $DC9D
    .byte $28 ; |  X X   | $DC9E
    .byte $3E ; |  XXXXX | $DC9F
    .byte $0A ; |    X X | $DCA0
    .byte $0E ; |    XXX | $DCA1
    .byte $1C ; |   XXX  | $DCA2
    .byte $18 ; |   XX   | $DCA3
    .byte $1C ; |   XXX  | $DCA4
    .byte $32 ; |  XX  X | $DCA5
    .byte $34 ; |  XX X  | $DCA6
    .byte $76 ; | XXX XX | $DCA7
    .byte $76 ; | XXX XX | $DCA8
    .byte $7E ; | XXXXXX | $DCA9
    .byte $6C ; | XX XX  | $DCAA
    .byte $26 ; |  X  XX | $DCAB
    .byte $2E ; |  X XXX | $DCAC
    .byte $28 ; |  X X   | $DCAD
    .byte $28 ; |  X X   | $DCAE
    .byte $26 ; |  X  XX | $DCAF
    .byte $20 ; |  X     | $DCB0
    .byte $20 ; |  X     | $DCB1
    .byte $70 ; | XXX    | $DCB2

    .byte $FF ; |XXXXXXXX| $DCB3
    .byte $10 ; |   X    | $DCB4
    .byte $20 ; |  X     | $DCB5
    .byte $22 ; |  X   X | $DCB6
    .byte $24 ; |  X  X  | $DCB7
    .byte $34 ; |  XX X  | $DCB8
    .byte $32 ; |  XX  X | $DCB9
    .byte $16 ; |   X XX | $DCBA
    .byte $1E ; |   XXXX | $DCBB
    .byte $1C ; |   XXX  | $DCBC
    .byte $1C ; |   XXX  | $DCBD
    .byte $32 ; |  XX  X | $DCBE
    .byte $34 ; |  XX X  | $DCBF
    .byte $76 ; | XXX XX | $DCC0
    .byte $76 ; | XXX XX | $DCC1
    .byte $7E ; | XXXXXX | $DCC2
    .byte $6C ; | XX XX  | $DCC3
    .byte $26 ; |  X  XX | $DCC4
    .byte $2E ; |  X XXX | $DCC5
    .byte $28 ; |  X X   | $DCC6
    .byte $28 ; |  X X   | $DCC7
    .byte $26 ; |  X  XX | $DCC8
    .byte $20 ; |  X     | $DCC9
    .byte $20 ; |  X     | $DCCA
    .byte $20 ; |  X     | $DCCB

    .byte $FF ; |XXXXXXXX| $DCCC
    .byte $00 ; |        | $DCCD
    .byte $80 ; |X       | $DCCE
    .byte $80 ; |X       | $DCCF
    .byte $C3 ; |XX    XX| $DCD0
    .byte $62 ; | XX   X | $DCD1
    .byte $62 ; | XX   X | $DCD2
    .byte $36 ; |  XX XX | $DCD3
    .byte $3E ; |  XXXXX | $DCD4
    .byte $1C ; |   XXX  | $DCD5
    .byte $1C ; |   XXX  | $DCD6
    .byte $32 ; |  XX  X | $DCD7
    .byte $34 ; |  XX X  | $DCD8
    .byte $76 ; | XXX XX | $DCD9
    .byte $76 ; | XXX XX | $DCDA
    .byte $7E ; | XXXXXX | $DCDB
    .byte $6C ; | XX XX  | $DCDC
    .byte $26 ; |  X  XX | $DCDD
    .byte $2E ; |  X XXX | $DCDE
    .byte $28 ; |  X X   | $DCDF
    .byte $28 ; |  X X   | $DCE0
    .byte $26 ; |  X  XX | $DCE1
    .byte $20 ; |  X     | $DCE2
    .byte $20 ; |  X     | $DCE3
    .byte $70 ; | XXX    | $DCE4

    .byte $FF ; |XXXXXXXX| $DCE5
    .byte $00 ; |        | $DCE6
    .byte $00 ; |        | $DCE7
    .byte $00 ; |        | $DCE8
    .byte $00 ; |        | $DCE9
    .byte $00 ; |        | $DCEA
    .byte $33 ; |  XX  XX| $DCEB
    .byte $72 ; | XXX  X | $DCEC
    .byte $DA ; |XX XX X | $DCED
    .byte $1E ; |   XXXX | $DCEE
    .byte $1C ; |   XXX  | $DCEF
    .byte $22 ; |  X   X | $DCF0
    .byte $2E ; |  X XXX | $DCF1
    .byte $76 ; | XXX XX | $DCF2
    .byte $76 ; | XXX XX | $DCF3
    .byte $7E ; | XXXXXX | $DCF4
    .byte $6C ; | XX XX  | $DCF5
    .byte $26 ; |  X  XX | $DCF6
    .byte $2E ; |  X XXX | $DCF7
    .byte $28 ; |  X X   | $DCF8
    .byte $28 ; |  X X   | $DCF9
    .byte $26 ; |  X  XX | $DCFA
    .byte $20 ; |  X     | $DCFB
    .byte $20 ; |  X     | $DCFC
    .byte $F8 ; |XXXXX   | $DCFD

    .byte $FF ; |XXXXXXXX| $DCFE
    .byte $00 ; |        | $DCFF

    .byte $00 ; |        | $DD00
LDD01:
    .byte $84 ; |X    X  | $DD01
    .byte $54 ; | X X X  | $DD02
    .byte $24 ; |  X  X  | $DD03
    .byte $C4 ; |XX   X  | $DD04
    .byte $00 ; |        | $DD05
    .byte $1C ; |   XXX  | $DD06
    .byte $2A ; |  X X X | $DD07
    .byte $26 ; |  X  XX | $DD08
LDD09:
    .byte $04 ; |     X  | $DD09
LDD0A:
    .byte $06 ; |     XX | $DD0A
    .byte $08 ; |    X   | $DD0B
    .byte $0A ; |    X X | $DD0C
    .byte $0C ; |    XX  | $DD0D
    .byte $00 ; |        | $DD0E
    .byte $00 ; |        | $DD0F
    .byte $00 ; |        | $DD10
    .byte $00 ; |        | $DD11
    .byte $00 ; |        | $DD12
LDD13:
    .byte $20 ; |  X     | $DD13
    .byte $C0 ; |XX      | $DD14
    .byte $90 ; |X  X    | $DD15
    .byte $00 ; |        | $DD16
    .byte $00 ; |        | $DD17
    .byte $00 ; |        | $DD18
    .byte $00 ; |        | $DD19
    .byte $00 ; |        | $DD1A
    .byte $C4 ; |XX   X  | $DD1B
    .byte $C6 ; |XX   XX | $DD1C
    .byte $C8 ; |XX  X   | $DD1D
    .byte $CA ; |XX  X X | $DD1E
    .byte $C8 ; |XX  X   | $DD1F
    .byte $C6 ; |XX   XX | $DD20
    .byte $C4 ; |XX   X  | $DD21
    .byte $00 ; |        | $DD22
    .byte $00 ; |        | $DD23
    .byte $00 ; |        | $DD24
    .byte $00 ; |        | $DD25
    .byte $08 ; |    X   | $DD26
    .byte $08 ; |    X   | $DD27
    .byte $08 ; |    X   | $DD28
    .byte $08 ; |    X   | $DD29
    .byte $C8 ; |XX  X   | $DD2A
    .byte $C8 ; |XX  X   | $DD2B
    .byte $C8 ; |XX  X   | $DD2C
    .byte $C8 ; |XX  X   | $DD2D
    .byte $4A ; | X  X X | $DD2E
    .byte $4A ; | X  X X | $DD2F
    .byte $4A ; | X  X X | $DD30
    .byte $08 ; |    X   | $DD31
    .byte $1E ; |   XXXX | $DD32
    .byte $00 ; |        | $DD33
    .byte $06 ; |     XX | $DD34
    .byte $08 ; |    X   | $DD35
    .byte $0A ; |    X X | $DD36
    .byte $28 ; |  X X   | $DD37
    .byte $26 ; |  X  XX | $DD38
    .byte $24 ; |  X  X  | $DD39
    .byte $26 ; |  X  XX | $DD3A
    .byte $28 ; |  X X   | $DD3B
    .byte $0A ; |    X X | $DD3C
    .byte $08 ; |    X   | $DD3D
    .byte $06 ; |     XX | $DD3E
    .byte $00 ; |        | $DD3F

Explosion_Col_Tab:
    .byte $00 ; |        | $DD40   explosion, points for explosion
    .byte YELLOW+2             ; $DD41
    .byte YELLOW+2             ; $DD42
    .byte YELLOW+2             ; $DD43
    .byte YELLOW+2             ; $DD44
    .byte YELLOW+2             ; $DD45
    .byte YELLOW+2             ; $DD46
    .byte YELLOW+2             ; $DD47
    .byte YELLOW+2             ; $DD48
    .byte YELLOW+2             ; $DD49
    .byte YELLOW+2             ; $DD4A
    .byte YELLOW+2             ; $DD4B
    .byte YELLOW+2             ; $DD4C

    .byte $00 ; |        | $DD4D
    .byte $24 ; |  X  X  | $DD4E
    .byte $24 ; |  X  X  | $DD4F  PF colors?
    .byte $26 ; |  X  XX | $DD50
    .byte $28 ; |  X X   | $DD51
    .byte $2A ; |  X X X | $DD52
    .byte $2C ; |  X XX  | $DD53
    .byte $08 ; |    X   | $DD54
    .byte $08 ; |    X   | $DD55
    .byte $08 ; |    X   | $DD56
    .byte $08 ; |    X   | $DD57
    .byte $08 ; |    X   | $DD58
    .byte $08 ; |    X   | $DD59
    .byte $00 ; |        | $DD5A
    .byte $28 ; |  X X   | $DD5B
    .byte $2A ; |  X X X | $DD5C
    .byte $28 ; |  X X   | $DD5D
    .byte $26 ; |  X  XX | $DD5E
    .byte $26 ; |  X  XX | $DD5F
    .byte $26 ; |  X  XX | $DD60
    .byte $26 ; |  X  XX | $DD61
    .byte $28 ; |  X X   | $DD62
    .byte $2A ; |  X X X | $DD63
    .byte $2A ; |  X X X | $DD64
    .byte $2A ; |  X X X | $DD65
    .byte $2A ; |  X X X | $DD66
    .byte $0C ; |    XX  | $DD67
    .byte $0C ; |    XX  | $DD68

Dynamite_Col_Tab:
    .byte $44 ; | X   X  | $DD69   colors for dynamite display
    .byte $44 ; | X   X  | $DD6A
    .byte $44 ; | X   X  | $DD6B
    .byte $44 ; | X   X  | $DD6C
    .byte $44 ; | X   X  | $DD6D
    .byte $44 ; | X   X  | $DD6E
    .byte $1C ; |   XXX  | $DD6F
    .byte $1C ; |   XXX  | $DD70
    .byte $1C ; |   XXX  | $DD71
    .byte $1C ; |   XXX  | $DD72
    .byte $1C ; |   XXX  | $DD73

;colors for man
    .byte $01 ; |       X| $DD74  $00  black
    .byte $0D ; |    XX X| $DD75  $0C
    .byte $0D ; |    XX X| $DD76  $0C
    .byte $0D ; |    XX X| $DD77  $0C
    .byte $0D ; |    XX X| $DD78  $0C
    .byte $0D ; |    XX X| $DD79  $0C
    .byte $0D ; |    XX X| $DD7A  $0C
    .byte $0D ; |    XX X| $DD7B  $0C
    .byte $0D ; |    XX X| $DD7C  $0C
    .byte $0D ; |    XX X| $DD7D  $0C
    .byte $0D ; |    XX X| $DD7E  $0C
    .byte $99 ; |X  XX  X| $DD7F  $98
    .byte $99 ; |X  XX  X| $DD80  $98
    .byte $99 ; |X  XX  X| $DD81  $98
    .byte $99 ; |X  XX  X| $DD82  $98
    .byte $99 ; |X  XX  X| $DD83  $98
    .byte $99 ; |X  XX  X| $DD84  $98
    .byte $45 ; | X   X X| $DD85  $44
    .byte $45 ; | X   X X| $DD86  $44
    .byte $45 ; | X   X X| $DD87  $44
    .byte $47 ; | X   XXX| $DD88  $46
    .byte $45 ; | X   X X| $DD89  $44
    .byte $1D ; |   XXX X| $DD8A  $1C  yellow
    .byte $1D ; |   XXX X| $DD8B  $1C
    .byte $1D ; |   XXX X| $DD8C  $1C



    .byte $01 ; |       X| $DD8D
    .byte $00 ; |        | $DD8E
    .byte $1E ; |   XXXX | $DD8F
    .byte $1E ; |   XXXX | $DD90
    .byte $06 ; |     XX | $DD91
    .byte $1E ; |   XXXX | $DD92
    .byte $06 ; |     XX | $DD93
    .byte $06 ; |     XX | $DD94
    .byte $06 ; |     XX | $DD95
    .byte $06 ; |     XX | $DD96
    .byte $06 ; |     XX | $DD97
    .byte $00 ; |        | $DD98
    .byte $00 ; |        | $DD99
    .byte $00 ; |        | $DD9A
    .byte $00 ; |        | $DD9B
    .byte $04 ; |     X  | $DD9C
    .byte $04 ; |     X  | $DD9D
    .byte $04 ; |     X  | $DD9E
    .byte $04 ; |     X  | $DD9F
    .byte $04 ; |     X  | $DDA0
    .byte $04 ; |     X  | $DDA1
    .byte $04 ; |     X  | $DDA2
    .byte $04 ; |     X  | $DDA3
    .byte $04 ; |     X  | $DDA4
    .byte $04 ; |     X  | $DDA5
    .byte $04 ; |     X  | $DDA6
    .byte $04 ; |     X  | $DDA7
    .byte $00 ; |        | $DDA8

Lives_Gfx:
    .byte $10 ; |   X    | $DDA9
    .byte $10 ; |   X    | $DDAA
    .byte $18 ; |   XX   | $DDAB
    .byte $08 ; |    X   | $DDAC
    .byte $08 ; |    X   | $DDAD
    .byte $14 ; |   X X  | $DDAE
    .byte $14 ; |   X X  | $DDAF
    .byte $34 ; |  XX X  | $DDB0
    .byte $28 ; |  X X   | $DDB1
    .byte $2C ; |  X XX  | $DDB2
    .byte $2C ; |  X XX  | $DDB3
    .byte $20 ; |  X     | $DDB4
    .byte $70 ; | XXX    | $DDB5

    .byte $0C ; |    XX  | $DDB6  never used?

Lives_Col_Tab:
    .byte $0C ; |    XX  | $DDB7
    .byte $0C ; |    XX  | $DDB8
    .byte $0C ; |    XX  | $DDB9
    .byte $0C ; |    XX  | $DDBA
    .byte $0C ; |    XX  | $DDBB
    .byte $94 ; |X  X X  | $DDBC
    .byte $94 ; |X  X X  | $DDBD
    .byte $94 ; |X  X X  | $DDBE
    .byte $94 ; |X  X X  | $DDBF
    .byte $46 ; | X   XX | $DDC0
    .byte $46 ; | X   XX | $DDC1
    .byte $1C ; |   XXX  | $DDC2
    .byte $1C ; |   XXX  | $DDC3

    .byte $AA ; |X X X X | $DDC4
    .byte $AA ; |X X X X | $DDC5
    .byte $AA ; |X X X X | $DDC6
    .byte $AA ; |X X X X | $DDC7
    .byte $AA ; |X X X X | $DDC8
    .byte $AA ; |X X X X | $DDC9
    .byte $AA ; |X X X X | $DDCA
    .byte $AA ; |X X X X | $DDCB
    .byte $AA ; |X X X X | $DDCC
    .byte $AA ; |X X X X | $DDCD
    .byte $AA ; |X X X X | $DDCE
    .byte $AA ; |X X X X | $DDCF
    .byte $AA ; |X X X X | $DDD0

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

ColorBarsTab:
    .byte BLUE            ; $DDEC   color stripes used in the Activison logo
    .byte GREEN           ; $DDED
    .byte GREEN           ; $DDEE
    .byte YELLOW-2        ; $DDEF
    .byte BROWN           ; $DDF0
    .byte BROWN           ; $DDF1
    .byte RED             ; $DDF2
    .byte BLACK           ; $DDF3

    .byte $00             ; $DDF4   bytes never used?
    .byte $00             ; $DDF5
    .byte $00             ; $DDF6
    .byte $00             ; $DDF7
    .byte $00             ; $DDF8
    .byte $00             ; $DDF9
    .byte $00             ; $DDFA
    .byte $00             ; $DDFB
    .byte $00             ; $DDFC
    .byte $00             ; $DDFD
    .byte $00             ; $DDFE
    .byte $00             ; $DDFF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DrawScoreCopyrightLogo SUBROUTINE
    lda    #7                    ; 2
DrawScoreCopyrightLogo2 SUBROUTINE
    ldy    #0                    ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    $BC                   ; 3
    lda    #7                    ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    lsr                          ; 2
    sta    NUSIZ0                ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta.w  RESBL                 ; 4
    sta    NUSIZ1                ; 3
    lda    #$90                  ; 2
    sta    HMP1                  ; 3
    lda    #$80                  ; 2
    sta    HMP0                  ; 3
    nop                          ; 2
    nop                          ; 2
LDE30:
    ldy    $BC                   ; 3   variable for copyright height (scrolling)
    lda    ($8D),Y               ; 5   drawing copyright, stationary logo done elsewhere
    tax                          ; 2
    lda    ($8F),Y               ; 5
    sta    HMOVE                 ; 3
    sta    $BB                   ; 3
    lda    ($85),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($87),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($89),Y               ; 5
    sta    HMCLR                 ; 3
    sta    GRP0                  ; 3
    lda    ($8B),Y               ; 5
    ldy    $BB                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    dec    $BC                   ; 5
    bpl    LDE30                 ; 2³
    lda    #$80                  ; 2
    sta    HMP0                  ; 3
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    asl                          ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LDE6B SUBROUTINE
    stx    $AE                   ; 3
    lda    #$FF                  ; 2
    sta    $AD                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;    XXX XXX X   X XXX XXX
;    X X X X X X X X   X X
;    XXX X X XXXXX XX  XX
;    X   X X XX XX X   X X
;    X   XXX X   X XXX X X
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PowerOne:
    .byte $23 ; |  X   XX| $DE72
    .byte $22 ; |  X   X | $DE73
    .byte $3A ; |  XXX X | $DE74
    .byte $2A ; |  X X X | $DE75
    .byte $3B ; |  XXX XX| $DE76
PowerTwo:
    .byte $A2 ; |X X   X | $DE77
    .byte $B6 ; |X XX XX | $DE78
    .byte $BE ; |X XXXXX | $DE79
    .byte $AA ; |X X X X | $DE7A
    .byte $A2 ; |X X   X | $DE7B
PowerThree:
    .byte $EA ; |XXX X X | $DE7C
    .byte $8A ; |X   X X | $DE7D
    .byte $CC ; |XX  XX  | $DE7E
    .byte $8A ; |X   X X | $DE7F
    .byte $EE ; |XXX XXX | $DE80

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $FF ; |XXXXXXXX| $DE81

Flying_HERO_One:
    .byte $10 ; |   X    | $DE82
    .byte $10 ; |   X    | $DE83
    .byte $10 ; |   X    | $DE84
    .byte $18 ; |   XX   | $DE85
    .byte $18 ; |   XX   | $DE86
    .byte $08 ; |    X   | $DE87
    .byte $08 ; |    X   | $DE88
    .byte $0C ; |    XX  | $DE89
    .byte $0C ; |    XX  | $DE8A
    .byte $1C ; |   XXX  | $DE8B
    .byte $32 ; |  XX  X | $DE8C
    .byte $34 ; |  XX X  | $DE8D
    .byte $76 ; | XXX XX | $DE8E
    .byte $76 ; | XXX XX | $DE8F
    .byte $7E ; | XXXXXX | $DE90
    .byte $6C ; | XX XX  | $DE91
    .byte $26 ; |  X  XX | $DE92
    .byte $2E ; |  X XXX | $DE93
    .byte $28 ; |  X X   | $DE94
    .byte $28 ; |  X X   | $DE95
    .byte $26 ; |  X  XX | $DE96
    .byte $20 ; |  X     | $DE97
    .byte $20 ; |  X     | $DE98
    .byte $F8 ; |XXXXX   | $DE99   blades start (fully extended left - right)
    .byte $FF ; |XXXXXXXX| $DE9A

Flying_HERO_Two:
    .byte $10 ; |   X    | $DE9B
    .byte $10 ; |   X    | $DE9C
    .byte $10 ; |   X    | $DE9D
    .byte $18 ; |   XX   | $DE9E
    .byte $18 ; |   XX   | $DE9F
    .byte $08 ; |    X   | $DEA0
    .byte $08 ; |    X   | $DEA1
    .byte $0C ; |    XX  | $DEA2
    .byte $0C ; |    XX  | $DEA3
    .byte $1C ; |   XXX  | $DEA4
    .byte $32 ; |  XX  X | $DEA5
    .byte $34 ; |  XX X  | $DEA6
    .byte $76 ; | XXX XX | $DEA7
    .byte $76 ; | XXX XX | $DEA8
    .byte $7E ; | XXXXXX | $DEA9
    .byte $6C ; | XX XX  | $DEAA
    .byte $26 ; |  X  XX | $DEAB
    .byte $2E ; |  X XXX | $DEAC
    .byte $28 ; |  X X   | $DEAD
    .byte $28 ; |  X X   | $DEAE
    .byte $26 ; |  X  XX | $DEAF
    .byte $20 ; |  X     | $DEB0
    .byte $20 ; |  X     | $DEB1
    .byte $70 ; | XXX    | $DEB2   blades turn 45 degrees
    .byte $FF ; |XXXXXXXX| $DEB3

Flying_HERO_Three:
    .byte $10 ; |   X    | $DEB4
    .byte $10 ; |   X    | $DEB5
    .byte $10 ; |   X    | $DEB6
    .byte $18 ; |   XX   | $DEB7
    .byte $18 ; |   XX   | $DEB8
    .byte $08 ; |    X   | $DEB9
    .byte $08 ; |    X   | $DEBA
    .byte $0C ; |    XX  | $DEBB
    .byte $0C ; |    XX  | $DEBC
    .byte $1C ; |   XXX  | $DEBD
    .byte $32 ; |  XX  X | $DEBE
    .byte $34 ; |  XX X  | $DEBF
    .byte $76 ; | XXX XX | $DEC0
    .byte $76 ; | XXX XX | $DEC1
    .byte $7E ; | XXXXXX | $DEC2
    .byte $6C ; | XX XX  | $DEC3
    .byte $26 ; |  X  XX | $DEC4
    .byte $2E ; |  X XXX | $DEC5
    .byte $28 ; |  X X   | $DEC6
    .byte $28 ; |  X X   | $DEC7
    .byte $26 ; |  X  XX | $DEC8
    .byte $20 ; |  X     | $DEC9
    .byte $20 ; |  X     | $DECA
    .byte $20 ; |  X     | $DECB   blades now turned 90 degrees
    .byte $FF ; |XXXXXXXX| $DECC

Standing_HERO:
    .byte $0E ; |    XXX | $DECD
    .byte $0C ; |    XX  | $DECE
    .byte $0C ; |    XX  | $DECF
    .byte $0C ; |    XX  | $DED0
    .byte $0C ; |    XX  | $DED1
    .byte $0C ; |    XX  | $DED2
    .byte $0C ; |    XX  | $DED3
    .byte $0C ; |    XX  | $DED4
    .byte $0C ; |    XX  | $DED5
    .byte $1C ; |   XXX  | $DED6
    .byte $22 ; |  X   X | $DED7
    .byte $2E ; |  X XXX | $DED8
    .byte $76 ; | XXX XX | $DED9
    .byte $76 ; | XXX XX | $DEDA
    .byte $7E ; | XXXXXX | $DEDB
    .byte $6C ; | XX XX  | $DEDC
    .byte $26 ; |  X  XX | $DEDD
    .byte $2E ; |  X XXX | $DEDE
    .byte $28 ; |  X X   | $DEDF
    .byte $28 ; |  X X   | $DEE0
    .byte $26 ; |  X  XX | $DEE1
    .byte $20 ; |  X     | $DEE2
    .byte $20 ; |  X     | $DEE3
    .byte $70 ; | XXX    | $DEE4
    .byte $FF ; |XXXXXXXX| $DEE5

    .byte $00 ; |        | $DEE6   maybe not used

Explosion_HERO:
    .byte $10 ; |   X    | $DEE7
    .byte $10 ; |   X    | $DEE8
    .byte $10 ; |   X    | $DEE9
    .byte $18 ; |   XX   | $DEEA
    .byte $18 ; |   XX   | $DEEB
    .byte $08 ; |    X   | $DEEC
    .byte $08 ; |    X   | $DEED
    .byte $0C ; |    XX  | $DEEE
    .byte $0C ; |    XX  | $DEEF
    .byte $1C ; |   XXX  | $DEF0
    .byte $32 ; |  XX  X | $DEF1
    .byte $34 ; |  XX X  | $DEF2
    .byte $76 ; | XXX XX | $DEF3
    .byte $76 ; | XXX XX | $DEF4
    .byte $7E ; | XXXXXX | $DEF5
    .byte $6C ; | XX XX  | $DEF6
    .byte $26 ; |  X  XX | $DEF7
    .byte $2E ; |  X XXX | $DEF8
    .byte $28 ; |  X X   | $DEF9
    .byte $28 ; |  X X   | $DEFA
    .byte $26 ; |  X  XX | $DEFB
    .byte $20 ; |  X     | $DEFC
    .byte $20 ; |  X     | $DEFD
    .byte $70 ; | XXX    | $DEFE
    .byte $00 ; |        | $DEFF   this byte is used

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      NUMBERS & CHARACTERS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Zero:
    .byte $3C ; |  XXXX  | $DF00
    .byte $66 ; | XX  XX | $DF01
    .byte $66 ; | XX  XX | $DF02
    .byte $66 ; | XX  XX | $DF03
    .byte $66 ; | XX  XX | $DF04
    .byte $66 ; | XX  XX | $DF05
    .byte $66 ; | XX  XX | $DF06
    .byte $3C ; |  XXXX  | $DF07
One:
    .byte $3C ; |  XXXX  | $DF08
    .byte $18 ; |   XX   | $DF09
    .byte $18 ; |   XX   | $DF0A
    .byte $18 ; |   XX   | $DF0B
    .byte $18 ; |   XX   | $DF0C
    .byte $18 ; |   XX   | $DF0D
    .byte $38 ; |  XXX   | $DF0E
    .byte $18 ; |   XX   | $DF0F
Two:
    .byte $7E ; | XXXXXX | $DF10
    .byte $60 ; | XX     | $DF11
    .byte $60 ; | XX     | $DF12
    .byte $3C ; |  XXXX  | $DF13
    .byte $06 ; |     XX | $DF14
    .byte $06 ; |     XX | $DF15
    .byte $46 ; | X   XX | $DF16
    .byte $3C ; |  XXXX  | $DF17
Three:
    .byte $3C ; |  XXXX  | $DF18
    .byte $46 ; | X   XX | $DF19
    .byte $06 ; |     XX | $DF1A
    .byte $0C ; |    XX  | $DF1B
    .byte $0C ; |    XX  | $DF1C
    .byte $06 ; |     XX | $DF1D
    .byte $46 ; | X   XX | $DF1E
    .byte $3C ; |  XXXX  | $DF1F
Four:
    .byte $0C ; |    XX  | $DF20
    .byte $0C ; |    XX  | $DF21
    .byte $0C ; |    XX  | $DF22
    .byte $7E ; | XXXXXX | $DF23
    .byte $4C ; | X  XX  | $DF24
    .byte $2C ; |  X XX  | $DF25
    .byte $1C ; |   XXX  | $DF26
    .byte $0C ; |    XX  | $DF27
Five:
    .byte $7C ; | XXXXX  | $DF28
    .byte $46 ; | X   XX | $DF29
    .byte $06 ; |     XX | $DF2A
    .byte $06 ; |     XX | $DF2B
    .byte $7C ; | XXXXX  | $DF2C
    .byte $60 ; | XX     | $DF2D
    .byte $60 ; | XX     | $DF2E
    .byte $7E ; | XXXXXX | $DF2F
Six:
    .byte $3C ; |  XXXX  | $DF30
    .byte $66 ; | XX  XX | $DF31
    .byte $66 ; | XX  XX | $DF32
    .byte $66 ; | XX  XX | $DF33
    .byte $7C ; | XXXXX  | $DF34
    .byte $60 ; | XX     | $DF35
    .byte $62 ; | XX   X | $DF36
    .byte $3C ; |  XXXX  | $DF37
Seven:
    .byte $18 ; |   XX   | $DF38
    .byte $18 ; |   XX   | $DF39
    .byte $18 ; |   XX   | $DF3A
    .byte $18 ; |   XX   | $DF3B
    .byte $0C ; |    XX  | $DF3C
    .byte $06 ; |     XX | $DF3D
    .byte $42 ; | X    X | $DF3E
    .byte $7E ; | XXXXXX | $DF3F
Eight:
    .byte $3C ; |  XXXX  | $DF40
    .byte $66 ; | XX  XX | $DF41
    .byte $66 ; | XX  XX | $DF42
    .byte $3C ; |  XXXX  | $DF43
    .byte $3C ; |  XXXX  | $DF44
    .byte $66 ; | XX  XX | $DF45
    .byte $66 ; | XX  XX | $DF46
    .byte $3C ; |  XXXX  | $DF47
Nine:
    .byte $3C ; |  XXXX  | $DF48
    .byte $46 ; | X   XX | $DF49
    .byte $06 ; |     XX | $DF4A
    .byte $3E ; |  XXXXX | $DF4B
    .byte $66 ; | XX  XX | $DF4C
    .byte $66 ; | XX  XX | $DF4D
    .byte $66 ; | XX  XX | $DF4E
    .byte $3C ; |  XXXX  | $DF4F

Blank_Digit:
    .byte $00 ; |        | $DF50
    .byte $00 ; |        | $DF51
    .byte $00 ; |        | $DF52
    .byte $00 ; |        | $DF53
    .byte $00 ; |        | $DF54
    .byte $00 ; |        | $DF55
    .byte $00 ; |        | $DF56
    .byte $00 ; |        | $DF57

Exclamation_Mark:
    .byte $FF ; |XXXXXXXX| $DF58
    .byte $E7 ; |XXX  XXX| $DF59
    .byte $FF ; |XXXXXXXX| $DF5A
    .byte $E7 ; |XXX  XXX| $DF5B
    .byte $E7 ; |XXX  XXX| $DF5C
    .byte $E7 ; |XXX  XXX| $DF5D
    .byte $E7 ; |XXX  XXX| $DF5E
    .byte $FF ; |XXXXXXXX| $DF5F

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;    XX   XXXX XX XX XXXX XX   XX
;    XX   XXXX XX XX XXXX XX   XX
;    XX   XX   XX XX XX   XX   XX
;    XX   XXX  XX XX XXX  XX
;    XX   XXX  XX XX XXX  XX
;    XX   XX    XXX  XX   XX   XX
;    XXXX XXXX  XXX  XXXX XXXX XX
;    XXXX XXXX   X   XXXX XXXX XX
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Level_Pt_One:
    .byte $1E ; |   XXXX | $DF60
    .byte $1E ; |   XXXX | $DF61
    .byte $18 ; |   XX   | $DF62
    .byte $18 ; |   XX   | $DF63
    .byte $18 ; |   XX   | $DF64
    .byte $18 ; |   XX   | $DF65
    .byte $18 ; |   XX   | $DF66
    .byte $18 ; |   XX   | $DF67
Level_Pt_Two:
    .byte $F1 ; |XXXX   X| $DF68
    .byte $F3 ; |XXXX  XX| $DF69
    .byte $C3 ; |XX    XX| $DF6A
    .byte $E6 ; |XXX  XX | $DF6B
    .byte $E6 ; |XXX  XX | $DF6C
    .byte $C6 ; |XX   XX | $DF6D
    .byte $F6 ; |XXXX XX | $DF6E
    .byte $F6 ; |XXXX XX | $DF6F
Level_Pt_Three:
    .byte $1E ; |   XXXX | $DF70
    .byte $9E ; |X  XXXX | $DF71
    .byte $98 ; |X  XX   | $DF72
    .byte $DC ; |XX XXX  | $DF73
    .byte $DC ; |XX XXX  | $DF74
    .byte $D8 ; |XX XX   | $DF75
    .byte $DE ; |XX XXXX | $DF76
    .byte $DE ; |XX XXXX | $DF77
Level_Pt_Four:
    .byte $F6 ; |XXXX XX | $DF78
    .byte $F6 ; |XXXX XX | $DF79
    .byte $C6 ; |XX   XX | $DF7A
    .byte $C0 ; |XX      | $DF7B
    .byte $C0 ; |XX      | $DF7C
    .byte $C6 ; |XX   XX | $DF7D
    .byte $C6 ; |XX   XX | $DF7E
    .byte $C6 ; |XX   XX | $DF7F

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;          X XXXXXXXX    XXXXXXX
;         XX    X   X   XX
;        XXX XX X X X  XX  XXX X XXX X  X
;       XX X X  X X X XX X X   X X X XX X
;      XXXXX X  X X XXX  X XXX X X X XXXX
;     XX   X X  X X XX   X   X X X X X XX
;    XX    X XX X X X    X XXX X XXX X  X
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LogoOne:
    .byte $0C ; |    XX  | $DF80
    .byte $06 ; |     XX | $DF81
    .byte $03 ; |      XX| $DF82
    .byte $01 ; |       X| $DF83
    .byte $00 ; |        | $DF84
    .byte $00 ; |        | $DF85
    .byte $00 ; |        | $DF86
    .byte $00 ; |        | $DF87
LogoTwo:
    .byte $2D ; |  X XX X| $DF88
    .byte $29 ; |  X X  X| $DF89
    .byte $E9 ; |XXX X  X| $DF8A
    .byte $A9 ; |X X X  X| $DF8B
    .byte $ED ; |XXX XX X| $DF8C
    .byte $61 ; | XX    X| $DF8D
    .byte $2F ; |  X XXXX| $DF8E
    .byte $00 ; |        | $DF8F
LogoThree:
    .byte $50 ; | X X    | $DF90
    .byte $58 ; | X XX   | $DF91
    .byte $5C ; | X XXX  | $DF92
    .byte $56 ; | X X XX | $DF93
    .byte $53 ; | X X  XX| $DF94
    .byte $11 ; |   X   X| $DF95
    .byte $F0 ; |XXXX    | $DF96
    .byte $00 ; |        | $DF97
LogoFour:
    .byte $BA ; |X XXX X | $DF98
    .byte $8A ; |X   X X | $DF99
    .byte $BA ; |X XXX X | $DF9A
    .byte $A2 ; |X X   X | $DF9B
    .byte $3A ; |  XXX X | $DF9C
    .byte $80 ; |X       | $DF9D
    .byte $FE ; |XXXXXXX | $DF9E
    .byte $00 ; |        | $DF9F
LogoFive:
    .byte $E9 ; |XXX X  X| $DFA0
    .byte $AB ; |X X X XX| $DFA1
    .byte $AF ; |X X XXXX| $DFA2
    .byte $AD ; |X X XX X| $DFA3
    .byte $E9 ; |XXX X  X| $DFA4
    .byte $00 ; |        | $DFA5
    .byte $00 ; |        | $DFA6
    .byte $00 ; |        | $DFA7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;    XXXX                X     X   X    X XXX XXX X X
;    X  X                      X  XXX   X X X X X X X
;    X    XXX XXX X X XX X XXX XXX X    X XXX XXX XXX
;    X  X X X X X X X X  X X X X X X    X   X X X   X
;    XXXX XXX XXX XXX X  X XXX X X X    X   X XXX   X
;             X     X        X
;             X   XXX      XXX
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CopyrightOne:
    .byte $00 ; |        | $DFA8
    .byte $00 ; |        | $DFA9
    .byte $00 ; |        | $DFAA
    .byte $F7 ; |XXXX XXX| $DFAB
    .byte $95 ; |X  X X X| $DFAC
    .byte $87 ; |X    XXX| $DFAD
    .byte $90 ; |X  X    | $DFAE
    .byte $F0 ; |XXXX    | $DFAF
CopyrightTwo:
    .byte $00 ; |        | $DFB0
    .byte $47 ; | X   XXX| $DFB1
    .byte $41 ; | X     X| $DFB2
    .byte $77 ; | XXX XXX| $DFB3
    .byte $55 ; | X X X X| $DFB4
    .byte $75 ; | XXX X X| $DFB5
    .byte $00 ; |        | $DFB6
    .byte $00 ; |        | $DFB7
CopyrightThree:
    .byte $00 ; |        | $DFB8
    .byte $03 ; |      XX| $DFB9
    .byte $00 ; |        | $DFBA
    .byte $4B ; | X  X XX| $DFBB
    .byte $4A ; | X  X X | $DFBC
    .byte $6B ; | XX X XX| $DFBD
    .byte $00 ; |        | $DFBE
    .byte $08 ; |    X   | $DFBF
CopyrightFour:
    .byte $00 ; |        | $DFC0
    .byte $80 ; |X       | $DFC1
    .byte $80 ; |X       | $DFC2
    .byte $AA ; |X X X X | $DFC3
    .byte $AA ; |X X X X | $DFC4
    .byte $BA ; |X XXX X | $DFC5
    .byte $27 ; |  X  XXX| $DFC6
    .byte $22 ; |  X   X | $DFC7
CopyrightFive:
    .byte $00 ; |        | $DFC8
    .byte $00 ; |        | $DFC9
    .byte $00 ; |        | $DFCA
    .byte $11 ; |   X   X| $DFCB
    .byte $11 ; |   X   X| $DFCC
    .byte $17 ; |   X XXX| $DFCD
    .byte $15 ; |   X X X| $DFCE
    .byte $17 ; |   X XXX| $DFCF
CopyrightSix:
    .byte $00 ; |        | $DFD0
    .byte $00 ; |        | $DFD1
    .byte $00 ; |        | $DFD2
    .byte $71 ; | XXX   X| $DFD3
    .byte $51 ; | X X   X| $DFD4
    .byte $77 ; | XXX XXX| $DFD5
    .byte $55 ; | X X X X| $DFD6
    .byte $75 ; | XXX X X| $DFD7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;    XXX  XXXX   XXX
;    XXXX XXXXX XX XX
;    XX X XX XX XX XX
;    XX X XX XX XX XX
;    XXXX XXXX  XX XX
;    XXX  XXXX  XX XX
;    XX   XX XX XX XX
;    XX   XX XX  XXX
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ProOne:
    .byte $C6 ; |XX   XX | $DFD8
    .byte $C6 ; |XX   XX | $DFD9
    .byte $E7 ; |XXX  XXX| $DFDA
    .byte $F7 ; |XXXX XXX| $DFDB
    .byte $D6 ; |XX X XX | $DFDC
    .byte $D6 ; |XX X XX | $DFDD
    .byte $F7 ; |XXXX XXX| $DFDE
    .byte $E7 ; |XXX  XXX| $DFDF
ProTwo:
    .byte $CE ; |XX  XXX | $DFE0
    .byte $DB ; |XX XX XX| $DFE1
    .byte $9B ; |X  XX XX| $DFE2
    .byte $9B ; |X  XX XX| $DFE3
    .byte $DB ; |XX XX XX| $DFE4
    .byte $DB ; |XX XX XX| $DFE5
    .byte $DB ; |XX XX XX| $DFE6
    .byte $8E ; |X   XXX | $DFE7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $00             ; $DFE8
    .byte $00             ; $DFE9
    .byte $00             ; $DFEA
    .byte $00             ; $DFEB

LDFEC:
    ldx    #$FF                  ; 2
    txs                          ; 2
LDFEF:
    jmp    LD079                 ; 3

LDFF2:
    bit    BANK_1                   ; bankswitch, goto LF042

    jsr    LFFF5-3               ; 6  goto LDFF2, to do a bankswitch

    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2

       ORG $DFFC
    .word Start_Bank0,Start_Bank0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 1
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


       RORG $F000

Start_Bank1:
    sei                          ; 2
    sta    BANK_1                ; makes no sense, already in bank 1

    cld                          ; 2
    ldx    #0                    ; 2
LF007:
    lda    #0                    ; 2
.loopClear:
    sta    0,X                   ; 4
    txs                          ; 2
    inx                          ; 2
    bne    .loopClear            ; 2³

LF00F:
    lda    $B6                   ; 3
    bne    LF01A                 ; 2³
    lda    $80                   ; 3
    and    #$7F                  ; 2
    sta    $80                   ; 3
    tax                          ; 2
LF01A:
    lda    LFF6D,X               ; 4
    sta    $F5                   ; 3
    ldx    #$18                  ; 2
LF021:
    lda    LFF72,X               ; 4
    sta    $9B,X                 ; 4
    dex                          ; 2
    bpl    LF021                 ; 2³
    lda    $F5                   ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    LFF6A,X               ; 4
    sta    $A4                   ; 3
    ldx    $82                   ; 3
    beq    LF03A                 ; 2³
    jmp    LF0BA                 ; 3

LF03A:
    inx                          ; 2
    stx    $82                   ; 3
    dec    $BA                   ; 5
    jmp    LF093                 ; 3

LF042:
    ldy    SWCHA                 ; 4
    lda    $81                   ; 3
    and    #$07                  ; 2
    bne    LF063                 ; 2³
    lda    $B6                   ; 3
    beq    LF063                 ; 2³
    ldy    #$FF                  ; 2
    dec    $B6                   ; 5
    bne    LF063                 ; 2³
    dec    $B6                   ; 5
    lda    $B5                   ; 3
    bmi    LF063                 ; 2³
    ora    #$80                  ; 2
    sta    $B5                   ; 3
    ldx    #$BA                  ; 2
    bne    LF07B                 ; 3   always branch

LF063:
    tya                          ; 2
    and    #$F0                  ; 2
    sta    $84                   ; 3
    iny                          ; 2
    beq    LF06F                 ; 2³
    lda    #0                    ; 2
    sta    $B4                   ; 3
LF06F:
    lda    $FB                   ; 3
    nop                          ; 2
    lsr                          ; 2
    bcs    LF07E                 ; 2³
    lda    #0                    ; 2
    sta    $BA                   ; 3
    ldx    #$B4                  ; 2
LF07B:
    jmp    LF007                 ; 3

LF07E:
    ldy    #0                    ; 2
    lsr                          ; 2
    bcs    LF0B8                 ; 2³
    lda    #$FF                  ; 2
    sta    $BA                   ; 3
    sta    $AD                   ; 3
    lda    $83                   ; 3
    beq    LF091                 ; 2³
    dec    $83                   ; 5
    bpl    LF0BA                 ; 2³
LF091:
    inc    $80                   ; 5
LF093:
    lda    $80                   ; 3
    and    #$7F                  ; 2
    cmp    #5                    ; 2
    bcc    LF0A2                 ; 2³
    lda    #$80                  ; 2
    and    $80                   ; 3
    sta    $80                   ; 3
    asl                          ; 2
LF0A2:
    sta    $B4                   ; 3
    sta    $B5                   ; 3
    ora    #$A0                  ; 2
    tay                          ; 2
    iny                          ; 2
    sty    $B9                   ; 3
    lda    #$AA                  ; 2
    sta    $B7                   ; 3
    sta    $B8                   ; 3
    lda    #$1F                  ; 2
    sta    $B6                   ; 3
    ldy    #$1E                  ; 2
LF0B8:
    sty    $83                   ; 3
LF0BA:
    lda    $AD                   ; 3
    ora    $F2                   ; 3
    ora    $F7                   ; 3
    ora    $F8                   ; 3
    bne    LF0C6                 ; 2³
    inc    $F6                   ; 5
LF0C6:
    lda    $82                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    eor    $82                   ; 3
    asl                          ; 2
    rol    $82                   ; 5
    lda    $B6                   ; 3
    beq    LF106                 ; 2³+1
    bit    $B4                   ; 3
    bpl    LF0DB                 ; 2³
    jmp    LF282                 ; 3

LF0DB:
    jsr    LF630                 ; 6
    ldx    LFF42,Y               ; 4
    lda    $AC                   ; 3
    beq    LF104                 ; 2³+1
    lda    $DF                   ; 3
    beq    LF0F3                 ; 2³
    cmp    #$2C                  ; 2
    bcc    LF104                 ; 2³+1
    ldx    LFF56,Y               ; 4
    jmp    LF104                 ; 3

LF0F3:
    lda    $A0                   ; 3
    sec                          ; 2
    sbc    #$0F                  ; 2
    cmp    $9B                   ; 3
    bcs    LF104                 ; 2³+1
    adc    #$17                  ; 2
    cmp    $9B                   ; 3
    bcc    LF104                 ; 2³
    ldx    #$D0                  ; 2
LF104:
    stx    $84                   ; 3
LF106:
    lda    #0                    ; 2
    sta    $BD                   ; 3
    lda    $D8                   ; 3
    cmp    #$97                  ; 2
    bne    LF14B                 ; 2³
    lda    $AD                   ; 3
    bne    LF14B                 ; 2³
    lda    $9C                   ; 3
    cmp    #$0B                  ; 2
    bcc    LF14B                 ; 2³
    bit    CXPPMM                ; 3
    bpl    LF14B                 ; 2³
    lda    $EC                   ; 3
    and    #$7F                  ; 2
    clc                          ; 2
    adc    #$18                  ; 2
    sta    $BB                   ; 3
    lda    $9B                   ; 3
    sec                          ; 2
    sbc    $BB                   ; 3
    cmp    #9                    ; 2
    bcs    LF14B                 ; 2³
    lda    #$40                  ; 2
    sta    $E6                   ; 3
    sta    $AC                   ; 3
    lda    #8                    ; 2
    bit    $EC                   ; 3
    bpl    LF13E                 ; 2³
    lda    #0                    ; 2
LF13E:
    sta    $B0                   ; 3
    lda    #$FF                  ; 2
    sta    $BD                   ; 3
    lda    $BB                   ; 3
    clc                          ; 2
    adc    #4                    ; 2
    sta    $9B                   ; 3
LF14B:
    lda    $D8                   ; 3
    cmp    #$97                  ; 2
    beq    LF177                 ; 2³
    cmp    #$99                  ; 2
    beq    LF177                 ; 2³
    bit    $D1                   ; 3
    bmi    LF177                 ; 2³
    lda    $AD                   ; 3
    bne    LF177                 ; 2³
    bit    CXPPMM                ; 3
    bpl    LF177                 ; 2³
    lda    $9C                   ; 3
    cmp    #$0B                  ; 2
    bcc    LF177                 ; 2³
    ldx    #$F0                  ; 2
    lda    $9B                   ; 3
    cmp    $A8                   ; 3
    beq    LF175                 ; 2³
    ldx    #$70                  ; 2
    bcc    LF175                 ; 2³
    ldx    #$B0                  ; 2
LF175:
    stx    $84                   ; 3
LF177:
    lda    $E1                   ; 3
    ora    $BA                   ; 3
    ora    $F2                   ; 3
    ora    $AD                   ; 3
    beq    LF184                 ; 2³
    jmp    LF282                 ; 3

LF184:
    lda    #$10                  ; 2
    and    $84                   ; 3
    bne    LF190                 ; 2³
    inc    $E9                   ; 5
    bit    $E9                   ; 3
    bvc    LF196                 ; 2³
LF190:
    dec    $E9                   ; 5
    bpl    LF196                 ; 2³
    inc    $E9                   ; 5
LF196:
    ldx    $F5                   ; 3
    lda    LFF00,X               ; 4
    clc                          ; 2
    adc    $9C                   ; 3
    tax                          ; 2
    lda    $E9                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    $9C                   ; 3
    sta    $BB                   ; 3
    cmp    #$0B                  ; 2
    bcc    LF1B2                 ; 2³
    cpy    #0                    ; 2
    bne    LF1B2                 ; 2³
    iny                          ; 2
LF1B2:
    lda    $9F                   ; 3
    cpy    #4                    ; 2
    bcc    LF1D8                 ; 2³
    bit    $E6                   ; 3
    bmi    LF20E                 ; 2³+1
    clc                          ; 2
    adc    LFFB0,Y               ; 4
    cmp    #$8A                  ; 2
    bcc    LF20C                 ; 2³+1
    lda    #4                    ; 2
    sta    $9F                   ; 3
    dec    $9C                   ; 5
    bpl    LF1D2                 ; 2³
    inc    $9C                   ; 5
    lda    #$8A                  ; 2
    bne    LF20C                 ; 3+1   always branch

LF1D2:
    jsr    LF63A                 ; 6
    jmp    LF20E                 ; 3

LF1D8:
    bit    $E6                   ; 3
    bvs    LF20E                 ; 2³+1
    sec                          ; 2
    sbc    LFFB0,Y               ; 4
    cmp    #$16                  ; 2
    bcs    LF1F4                 ; 2³
    ldx    $9C                   ; 3
    cpx    #$0A                  ; 2
    bcc    LF1F4                 ; 2³
    ldx    #0                    ; 2
    stx    $AE                   ; 3
    lda    #$FF                  ; 2
    sta    $AD                   ; 3
    lda    #$15                  ; 2
LF1F4:
    cmp    #$FE                  ; 2
    bcc    LF20C                 ; 2³+1
    lda    #$89                  ; 2
    sta    $9F                   ; 3
    lda    $9E                   ; 3
    cmp    $9C                   ; 3
    bne    LF204                 ; 2³
    inc    $9E                   ; 5
LF204:
    inc    $9C                   ; 5
    jsr    LF63A                 ; 6
    jmp    LF20E                 ; 3

LF20C:
    sta    $9F                   ; 3
LF20E:
    bit    $BD                   ; 3
    bmi    LF282                 ; 2³
    lda    $AD                   ; 3
    bne    LF282                 ; 2³
    lda    $9B                   ; 3
    and    #$03                  ; 2
    bne    LF236                 ; 2³
    bit    $84                   ; 3
    bpl    LF224                 ; 2³
    bvs    LF282                 ; 2³
    lda    #8                    ; 2
LF224:
    cmp    $B0                   ; 3
    beq    LF234                 ; 2³
    ldx    #$FD                  ; 2
    stx    $F3                   ; 3
    ldx    $AC                   ; 3
    bne    LF234                 ; 2³
    ldx    #3                    ; 2
    stx    $FC                   ; 3
LF234:
    sta    $B0                   ; 3
LF236:
    lda    $9C                   ; 3
    sta    $BB                   ; 3
    dec    $FC                   ; 5
    bpl    LF282                 ; 2³
    inc    $FC                   ; 5
    lda    $9B                   ; 3
    ldx    $B0                   ; 3
    beq    LF253                 ; 2³
    sec                          ; 2
    sbc    #1                    ; 2
    sta    $9B                   ; 3
    cmp    #$0C                  ; 2
    bcs    LF282                 ; 2³
    ldx    #0                    ; 2
    beq    LF25E                 ; 3   always branch

LF253:
    clc                          ; 2
    adc    #1                    ; 2
    sta    $9B                   ; 3
    cmp    #$93                  ; 2
    bcc    LF282                 ; 2³
    ldx    #1                    ; 2
LF25E:
    jsr    LF630                 ; 6
    lda    LF900,Y               ; 4
    and    #$01                  ; 2
    cmp    LFFAA,X               ; 4
    beq    LF278                 ; 2³
    lda    $9E                   ; 3
    cmp    $9C                   ; 3
    bne    LF273                 ; 2³
    inc    $9E                   ; 5
LF273:
    inc    $9C                   ; 5
    jmp    LF27A                 ; 3

LF278:
    dec    $9C                   ; 5
LF27A:
    lda    LFFAC,X               ; 4
    sta    $9B                   ; 3
    jsr    LF63A                 ; 6
LF282:
    ldx    #2                    ; 2
LF284:
    lda    $A4                   ; 3
    lsr                          ; 2
    bcc    LF293                 ; 2³
    lda    $E0                   ; 3
    ora    $DF                   ; 3
    beq    LF298                 ; 2³
    lda    #2                    ; 2
    bne    LF298                 ; 3   always branch

LF293:
    lda    LFFAE,X               ; 4
    ora    $A4                   ; 3
LF298:
    sta    $C5,X                 ; 4
    dex                          ; 2
    bpl    LF284                 ; 2³
    jsr    LF630                 ; 6
    lda    LF700,Y               ; 4
    cmp    #$93                  ; 2
    beq    LF2A9                 ; 2³
    and    #$FC                  ; 2
LF2A9:
    sta    $A5                   ; 3
    lda    LF800,Y               ; 4
    cmp    #$93                  ; 2
    beq    LF2B4                 ; 2³
    and    #$FC                  ; 2
LF2B4:
    sta    $A6                   ; 3
    lda    LF900,Y               ; 4
    and    #$FC                  ; 2
    ora    #$01                  ; 2
    cmp    #$91                  ; 2
    bne    LF2C3                 ; 2³
    lda    #$93                  ; 2
LF2C3:
    sta    $A7                   ; 3
    lda    #$C0                  ; 2   PF1 shape top section
    ldx    $9C                   ; 3
    beq    LF2D4                 ; 2³
    lda    #$FF                  ; 2
    cpx    #$0B                  ; 2
    bcs    LF2D4                 ; 2³
    lda    LFAFF,Y               ; 4
LF2D4:
    sta    $C1                   ; 3
    lda    LFA00,Y               ; 4
    sta    $C0                   ; 3
    lda    LFB00,Y               ; 4
    sta    $BF                   ; 3
    lda    #0                    ; 2
    ldx    $9C                   ; 3
    beq    LF2EF                 ; 2³
    lda    #$FF                  ; 2
    cpx    #$0B                  ; 2
    bcs    LF2EF                 ; 2³
    lda    LFCFF,Y               ; 4
LF2EF:
    sta    $C4                   ; 3
    lda    LFC00,Y               ; 4
    sta    $C3                   ; 3
    lda    LFD00,Y               ; 4
    sta    $C2                   ; 3
    lda    $B1                   ; 3
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    and    #$03                  ; 2
    tax                          ; 2
    lda    LFF3E,X               ; 4
    sta    NUSIZ1                ; 3
    sta    $BB                   ; 3
    ora    #$05                  ; 2
    sta    CTRLPF                ; 3
    sta    $C8                   ; 3
    sta    $CA                   ; 3
    lda    LFE00,Y               ; 4
    lsr                          ; 2
    lda    #5                    ; 2
    bcc    LF31C                 ; 2³
    lda    #4                    ; 2
LF31C:
    ora    $BB                   ; 3
    sta    $C9                   ; 3
    lda    LFE00,Y               ; 4
    lsr                          ; 2
    lsr                          ; 2
    bcc    LF334                 ; 2³
    lda    $81                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$01                  ; 2
    tax                          ; 2
    lda    LFF3C,X               ; 4
    sta    $C6                   ; 3
LF334:
    lda    #$FF                  ; 2
    sta    $BE                   ; 3
    lda    $9C                   ; 3
    cmp    #$0A                  ; 2
    bcs    LF351                 ; 2³
    ldx    $F5                   ; 3
    lda    LFF28,X               ; 4
    cmp    $9C                   ; 3
    beq    LF355                 ; 2³
    lda    $A0                   ; 3
    cmp    #9                    ; 2
    beq    LF351                 ; 2³
    cmp    #$99                  ; 2
    bne    LF355                 ; 2³
LF351:
    lda    #0                    ; 2
    sta    $BE                   ; 3
LF355:
    lda    $C3                   ; 3
    cmp    #$7F                  ; 2
    bne    LF374                 ; 2³
    lda    $C0                   ; 3
    cmp    #$FF                  ; 2
    bne    LF374                 ; 2³
    lda    $F5                   ; 3
    cmp    #$0D                  ; 2
    bcc    LF374                 ; 2³
    lda    $FD                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    tax                          ; 2
    lda    LFFB8,X               ; 4
    sta    $C3                   ; 3
LF374:
    lda    $F6                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    and    #$03                  ; 2
    tax                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LFF8B,Y               ; 4
    sta    $85                   ; 3
    lda    LFF8D,Y               ; 4
    sta    $86                   ; 3
    lda    LFF8F,X               ; 4
    sta    $87                   ; 3
    lda    LFF9B,Y               ; 4
    sta    $88                   ; 3
    lda    #$4D                  ; 2
    sta    $89                   ; 3
    lda    #$5A                  ; 2
    sta    $8A                   ; 3
    lda    #$33                  ; 2
    sta    $8B                   ; 3
    lda    #$17                  ; 2
    sta    $8C                   ; 3
    lda    $EA                   ; 3
    and    #$7F                  ; 2
    sta    $BB                   ; 3
    lda    $EB                   ; 3
    and    #$7F                  ; 2
    sta    $BC                   ; 3
    ldx    #2                    ; 2
LF3AF:
    cpx    #2                    ; 2
    beq    LF400                 ; 2³+1
    jsr    LF630                 ; 6
    lda    LF700,Y               ; 4
    and    #$03                  ; 2
    cpx    #0                    ; 2
    beq    LF3C4                 ; 2³
    lda    LF800,Y               ; 4
    and    #$03                  ; 2
LF3C4:
    tay                          ; 2
    lda    $A1,X                 ; 4
    cmp    #$32                  ; 2
    beq    LF3F3                 ; 2³
    cpy    #3                    ; 2
    bne    LF3E1                 ; 2³
    lda    $F7,X                 ; 4
    beq    LF3D7                 ; 2³
    lda    #9                    ; 2
    bne    LF3D9                 ; 3   always branch

LF3D7:
    lda    $BB                   ; 3
LF3D9:
    clc                          ; 2
    adc    $A5,X                 ; 4
    sta    $A5,X                 ; 4
    jmp    LF3F3                 ; 3

LF3E1:
    tya                          ; 2
    beq    LF3F3                 ; 2³
    lda    $BB                   ; 3
    sta    $A1,X                 ; 4
    cpy    #2                    ; 2
    bne    LF3F3                 ; 2³
    lda    $BC                   ; 3
    clc                          ; 2
    adc    $A5,X                 ; 4
    sta    $A5,X                 ; 4
LF3F3:
    lda.wy $85,Y                 ; 4
    sta    $CB,X                 ; 4
    lda.wy $89,Y                 ; 4
    sta    $CE,X                 ; 4
    jmp    LF408                 ; 3

LF400:
    lda    #$8E                  ; 2
    sta    $D0                   ; 3
    lda    #$64                  ; 2
    sta    $CD                   ; 3
LF408:
    lda    $F7,X                 ; 4
    beq    LF41F                 ; 2³
    sec                          ; 2
    sbc    #1                    ; 2
    sta    $F7,X                 ; 4
    bne    LF417                 ; 2³
    lda    #$32                  ; 2
    sta    $A1,X                 ; 4
LF417:
    lda    #$76                  ; 2
    sta    $CB,X                 ; 4
    lda    #$40                  ; 2
    sta    $CE,X                 ; 4
LF41F:
    lda    $A5,X                 ; 4
    cmp    #$93                  ; 2
    bcc    LF429                 ; 2³
    lda    #$8A                  ; 2
    sta    $CB,X                 ; 4
LF429:
    dex                          ; 2
    bmi    LF42F                 ; 2³
    jmp    LF3AF                 ; 3

LF42F:
    lda    $A4                   ; 3
    lsr                          ; 2
    bcc    LF447                 ; 2³
    ldx    #2                    ; 2
LF436:
    lda    $DE,X                 ; 4
    bne    LF447                 ; 2³
    lda    $CB,X                 ; 4
    cmp    #$76                  ; 2
    beq    LF444                 ; 2³
    lda    #$9B                  ; 2
    sta    $CE,X                 ; 4
LF444:
    dex                          ; 2
    bpl    LF436                 ; 2³
LF447:
    ldx    #2                    ; 2
LF449:
    ldy    $E7                   ; 3
    lda    LFF93,Y               ; 4
    sta    $D8,X                 ; 4
    lda    #$68                  ; 2
    sta    $DB,X                 ; 4
    lda    $DE,X                 ; 4
    beq    LF48C                 ; 2³
    dec    $DE,X                 ; 6
    lda    $DE,X                 ; 4
    bne    LF466                 ; 2³
    sta    $FA                   ; 3
    lda    #$93                  ; 2
    sta    $A8,X                 ; 4
    bne    LF48C                 ; 3   always branch

LF466:
    cmp    #$20                  ; 2
    bcs    LF48C                 ; 2³
    cmp    #$13                  ; 2
    bcs    LF476                 ; 2³
    ldy    $FA                   ; 3
    beq    LF476                 ; 2³
    ldy    #4                    ; 2
    bne    LF47A                 ; 3   always branch

LF476:
    lsr                          ; 2
    and    #$03                  ; 2
    tay                          ; 2
LF47A:
    lda    LFF96,Y               ; 4
    sta    $D8,X                 ; 4
    lda    #$40                  ; 2
    sta    $DB,X                 ; 4
    lda    $F2                   ; 3
    bne    LF48C                 ; 2³
    lda    LFFA5,Y               ; 4
    sta    $E1                   ; 3
LF48C:
    lda    $A8,X                 ; 4
    cmp    #$93                  ; 2
    bne    LF496                 ; 2³
    lda    #$99                  ; 2
    sta    $D8,X                 ; 4
LF496:
    dex                          ; 2
    bpl    LF449                 ; 2³
    lda    $9C                   ; 3
    cmp    #$0B                  ; 2
    bcc    LF4C0                 ; 2³
    lda    $F5                   ; 3
    cmp    #9                    ; 2
    bcc    LF4C0                 ; 2³
    lda    $C2                   ; 3
    bne    LF4C0                 ; 2³
    lda    $BF                   ; 3
    cmp    #$C0                  ; 2
    bne    LF4C0                 ; 2³
    lda    #$97                  ; 2
    sta    $D8                   ; 3
    lda    #5                    ; 2
    sta    $DB                   ; 3
    lda    $EC                   ; 3
    and    #$7F                  ; 2
    clc                          ; 2
    adc    #$1C                  ; 2
    sta    $A8                   ; 3
LF4C0:
    lda    $F5                   ; 3
    cmp    #$10                  ; 2
    bcc    LF502                 ; 2³+1
    lda    $9C                   ; 3
    cmp    #$0B                  ; 2
    bcc    LF54A                 ; 2³+1
    lda    $C2                   ; 3
    bne    LF54A                 ; 2³+1
    lda    $BF                   ; 3
    cmp    #$E0                  ; 2
    bne    LF54A                 ; 2³+1
    lda    $D8                   ; 3
    cmp    #$97                  ; 2
    beq    LF54A                 ; 2³+1
    lda    $A8                   ; 3
    cmp    #$93                  ; 2
    bne    LF4F0                 ; 2³
    ldx    #$78                  ; 2
    lda    #8                    ; 2
    and    $B0                   ; 3
    bne    LF4EC                 ; 2³
LF4EA:
    ldx    #$1C                  ; 2
LF4EC:
    stx    $A8                   ; 3
    bne    LF52B                 ; 2³+1
LF4F0:
    cmp    #$92                  ; 2
    beq    LF54A                 ; 2³+1
    lda    $AD                   ; 3
    cmp    #$95                  ; 2
    bne    LF505                 ; 2³+1
    lda    $AE                   ; 3
    bne    LF505                 ; 2³+1
    lda    #$92                  ; 2
    sta    $A8                   ; 3
LF502:
    jmp    LF54A                 ; 3

LF505:
    lda    #3                    ; 2
    ldx    $F5                   ; 3
    cpx    #$12                  ; 2
    bcc    LF50F                 ; 2³
    lda    #1                    ; 2
LF50F:
    and    $81                   ; 3
    bne    LF52B                 ; 2³
    ldy    $A8                   ; 3
    cpy    $9B                   ; 3
    beq    LF52B                 ; 2³
    bcs    LF524                 ; 2³
    iny                          ; 2
    ldx    #$78                  ; 2
    cpy    #$78                  ; 2
    bcs    LF4EC                 ; 2³+1
    bcc    LF529                 ; 3   always branch

LF524:
    dey                          ; 2
    cpy    #$1C                  ; 2
    bcc    LF4EA                 ; 2³+1
LF529:
    sty    $A8                   ; 3
LF52B:
    lda    $F6                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    ldx    $AD                   ; 3
    beq    LF540                 ; 2³
    txa                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LFFC0,X               ; 4
LF540:
    tax                          ; 2
    lda    LF6D2,X               ; 4
    sta    $D8                   ; 3
    lda    #$C4                  ; 2
    sta    $DB                   ; 3
LF54A:
    lda    #$DD                  ; 2
    sta    $98                   ; 3
    lda    #$DB                  ; 2
    sta    $94                   ; 3
    lda    #$DA                  ; 2
    sta    $9A                   ; 3
    lda    $9F                   ; 3
    sec                          ; 2
    sbc    #$17                  ; 2
    sta    $BB                   ; 3
    lda    #$DA                  ; 2
    sta    $92                   ; 3
    ldx    #$E2                  ; 2
    lda    $AD                   ; 3
    cmp    #$96                  ; 2
    bcs    LF58A                 ; 2³
    lda    #$DE                  ; 2
    sta    $92                   ; 3
    ldx    #$E6                  ; 2
    lda    $E1                   ; 3
    bne    LF58A                 ; 2³
    ldy    $E7                   ; 3
    ldx    LFFA2,Y               ; 4
    lda    $AC                   ; 3
    beq    LF58A                 ; 2³
    ldx    #$CC                  ; 2
    asl                          ; 2
    bcc    LF58A                 ; 2³
    lda    #$DC                  ; 2
    sta    $92                   ; 3
    ldy    $E8                   ; 3
    ldx    LFF9D,Y               ; 4
LF58A:
    txa                          ; 2
    sec                          ; 2
    sbc    $BB                   ; 3
    sta    $91                   ; 3
    lda    #$74                  ; 2
    sec                          ; 2
    sbc    $BB                   ; 3
    sta    $95                   ; 3
    lda    #$DD                  ; 2
    sta    $96                   ; 3
    ldy    $F5                   ; 3
    lda    LFF28,Y               ; 4
    cmp    $9C                   ; 3
    bne    LF5DC                 ; 2³
    lda    #$71                  ; 2
    sta    $D9                   ; 3
    lda    #$26                  ; 2
    sta    $DC                   ; 3
    lda    #$80                  ; 2
    sta    $A9                   ; 3
    lda    LFF14,Y               ; 4
    tay                          ; 2
    lda    LFE00,Y               ; 4
    and    #$FC                  ; 2
    cmp    #8                    ; 2
    bne    LF5D4                 ; 2³
    ldx    #1                    ; 2
LF5BF:
    lda    $CB,X                 ; 4
    cmp    #$76                  ; 2
    bne    LF5C9                 ; 2³
    lda    #$6D                  ; 2
    sta    $CB,X                 ; 4
LF5C9:
    dex                          ; 2
    bpl    LF5BF                 ; 2³
    lda    #8                    ; 2
    sta    REFP0                 ; 3
    lda    #$18                  ; 2
    sta    $A9                   ; 3
LF5D4:
    lda    $F2                   ; 3
    beq    LF5DC                 ; 2³
    lda    #$7E                  ; 2
    sta    $D9                   ; 3
LF5DC:
    ldx    #6                    ; 2
    lda    $A5,X                 ; 4
    clc                          ; 2
    adc    #$30                  ; 2
    bne    LF5EF                 ; 2³
LF5E5:
    lda    $A5,X                 ; 4
    cmp    #$93                  ; 2
    bcc    LF5EF                 ; 2³
    lda    #$A9                  ; 2
    bne    LF606                 ; 3+1   always branch

LF5EF:
    ldy    #$FF                  ; 2
    sec                          ; 2
LF5F2:
    iny                          ; 2
    sbc    #$0F                  ; 2
    bcs    LF5F2                 ; 2³
    eor    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$80                  ; 2
    and    #$F0                  ; 2
    sta    $D1,X                 ; 4
    tya                          ; 2
    ora    $D1,X                 ; 4
LF606:
    sta    $D1,X                 ; 4
    dex                          ; 2
    bpl    LF5E5                 ; 2³+1
    inx                          ; 2
    lda    $9C                   ; 3
    cmp    #$0A                  ; 2
    bcs    LF61B                 ; 2³
    ldy    $F5                   ; 3
    lda    LFF28,Y               ; 4
    cmp    $9C                   ; 3
    bne    LF622                 ; 2³
LF61B:
    lda    $81                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    tax                          ; 2
LF622:
    stx    $FB                   ; 3
    ldx    #2                    ; 2
LF626:
    lda    $B7,X                 ; 4
    sta    $BB,X                 ; 4
    dex                          ; 2
    bpl    LF626                 ; 2³
    jmp    LFFEC                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF630 SUBROUTINE
    ldy    $F5                   ; 3
    lda    LFF00,Y               ; 4
    clc                          ; 2
    adc    $9C                   ; 3  screen number
    tay                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF63A SUBROUTINE
    ldx    #2                    ; 2
LF63C:
    lda    $F7,X                 ; 4
    beq    LF648                 ; 2³
    lda    #$32                  ; 2
    sta    $A1,X                 ; 4
    lda    #0                    ; 2
    sta    $F7,X                 ; 4
LF648:
    dex                          ; 2
    bpl    LF63C                 ; 2³
    lda    #0                    ; 2
    sta    $B1                   ; 3
    sta    $FA                   ; 3
    sta    $EA                   ; 3
    sta    $EB                   ; 3
    sta    $F6                   ; 3
    lda    #$50                  ; 2
    sta    $FD                   ; 3
    lda    #$93                  ; 2
    sta    $A8                   ; 3
    sta    $A9                   ; 3
    sta    $AA                   ; 3
    lda    $B0                   ; 3
    cmp    #8                    ; 2
    lda    #$80                  ; 2
    bcc    LF66D                 ; 2³
    lda    #$60                  ; 2
LF66D:
    sta    $EC                   ; 3
    lda    $BB                   ; 3
    ldx    $9C                   ; 3
    cpx    $9D                   ; 3
    sta    $9D                   ; 3
    bne    LF68B                 ; 2³
    ldx    #4                    ; 2
LF67B:
    lda    $A0,X                 ; 4
    sta    $BB                   ; 3
    lda    $ED,X                 ; 4
    sta    $A0,X                 ; 4
    lda    $BB                   ; 3
    sta    $ED,X                 ; 4
    dex                          ; 2
    bpl    LF67B                 ; 2³
    rts                          ; 6

LF68B:
    ldx    #4                    ; 2
LF68D:
    lda    $A0,X                 ; 4
    sta    $ED,X                 ; 4
    dex                          ; 2
    bpl    LF68D                 ; 2³
    lda    $F5                   ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    LFF6A,X               ; 4
    sta    $A4                   ; 3
    ldx    $F5                   ; 3
    lda    LFF00,X               ; 4
    clc                          ; 2
    adc    $9C                   ; 3
    tax                          ; 2
    lda    LFE00,X               ; 4
    and    #$FC                  ; 2
    beq    LF6B0                 ; 2³
    ora    #$01                  ; 2
LF6B0:
    sta    $A0                   ; 3
    tax                          ; 2
    cpx    #9                    ; 2
    beq    LF6BD                 ; 2³
    cpx    #$99                  ; 2
    beq    LF6BD                 ; 2³
    ldx    #0                    ; 2
LF6BD:
    lda    $9E                   ; 3
    cmp    $9C                   ; 3
    bne    LF6C7                 ; 2³
    lda    #0                    ; 2
    beq    LF6CB                 ; 3   always branch

LF6C7:
    stx    $A0                   ; 3
    lda    #$32                  ; 2
LF6CB:
    sta    $A1                   ; 3
    sta    $A2                   ; 3
    sta    $A3                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF6D2:
    .byte $A6 ; |X X  XX | $F6D2
    .byte $B2 ; |X XX  X | $F6D3
    .byte $BE ; |X XXXXX | $F6D4
    .byte $CA ; |XX  X X | $F6D5
    .byte $D6 ; |XX X XX | $F6D6
    .byte $CA ; |XX  X X | $F6D7
    .byte $BE ; |X XXXXX | $F6D8
    .byte $B2 ; |X XX  X | $F6D9
    .byte $00 ; |        | $F6DA
    .byte $00 ; |        | $F6DB
    .byte $00 ; |        | $F6DC
    .byte $00 ; |        | $F6DD
    .byte $00 ; |        | $F6DE
    .byte $00 ; |        | $F6DF
    .byte $00 ; |        | $F6E0
    .byte $00 ; |        | $F6E1
    .byte $00 ; |        | $F6E2
    .byte $00 ; |        | $F6E3
    .byte $00 ; |        | $F6E4
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
LF700:
    .byte $93 ; |X  X  XX| $F700
    .byte $93 ; |X  X  XX| $F701
    .byte $93 ; |X  X  XX| $F702
    .byte $93 ; |X  X  XX| $F703
    .byte $50 ; | X X    | $F704
    .byte $93 ; |X  X  XX| $F705
    .byte $93 ; |X  X  XX| $F706
    .byte $46 ; | X   XX | $F707
    .byte $93 ; |X  X  XX| $F708
    .byte $28 ; |  X X   | $F709
    .byte $93 ; |X  X  XX| $F70A
    .byte $93 ; |X  X  XX| $F70B
    .byte $93 ; |X  X  XX| $F70C
    .byte $93 ; |X  X  XX| $F70D
    .byte $4C ; | X  XX  | $F70E
    .byte $18 ; |   XX   | $F70F
    .byte $40 ; | X      | $F710
    .byte $4C ; | X  XX  | $F711
    .byte $51 ; | X X   X| $F712
    .byte $93 ; |X  X  XX| $F713
    .byte $93 ; |X  X  XX| $F714
    .byte $93 ; |X  X  XX| $F715
    .byte $5E ; | X XXXX | $F716
    .byte $93 ; |X  X  XX| $F717
    .byte $7B ; | XXXX XX| $F718
    .byte $93 ; |X  X  XX| $F719
    .byte $71 ; | XXX   X| $F71A
    .byte $93 ; |X  X  XX| $F71B
    .byte $93 ; |X  X  XX| $F71C
    .byte $1A ; |   XX X | $F71D
    .byte $50 ; | X X    | $F71E
    .byte $60 ; | XX     | $F71F
    .byte $93 ; |X  X  XX| $F720
    .byte $3C ; |  XXXX  | $F721
    .byte $18 ; |   XX   | $F722
    .byte $68 ; | XX X   | $F723
    .byte $93 ; |X  X  XX| $F724
    .byte $93 ; |X  X  XX| $F725
    .byte $93 ; |X  X  XX| $F726
    .byte $44 ; | X   X  | $F727
    .byte $93 ; |X  X  XX| $F728
    .byte $93 ; |X  X  XX| $F729
    .byte $13 ; |   X  XX| $F72A
    .byte $72 ; | XXX  X | $F72B
    .byte $19 ; |   XX  X| $F72C
    .byte $50 ; | X X    | $F72D
    .byte $68 ; | XX X   | $F72E
    .byte $78 ; | XXXX   | $F72F
    .byte $48 ; | X  X   | $F730
    .byte $93 ; |X  X  XX| $F731
    .byte $93 ; |X  X  XX| $F732
    .byte $50 ; | X X    | $F733
    .byte $50 ; | X X    | $F734
    .byte $68 ; | XX X   | $F735
    .byte $1B ; |   XX XX| $F736
    .byte $93 ; |X  X  XX| $F737
    .byte $93 ; |X  X  XX| $F738
    .byte $93 ; |X  X  XX| $F739
    .byte $63 ; | XX   XX| $F73A
    .byte $93 ; |X  X  XX| $F73B
    .byte $93 ; |X  X  XX| $F73C
    .byte $36 ; |  XX XX | $F73D
    .byte $53 ; | X X  XX| $F73E
    .byte $93 ; |X  X  XX| $F73F
    .byte $93 ; |X  X  XX| $F740
    .byte $7C ; | XXXXX  | $F741
    .byte $38 ; |  XXX   | $F742
    .byte $3D ; |  XXXX X| $F743
    .byte $93 ; |X  X  XX| $F744
    .byte $3A ; |  XXX X | $F745
    .byte $93 ; |X  X  XX| $F746
    .byte $18 ; |   XX   | $F747
    .byte $93 ; |X  X  XX| $F748
    .byte $2A ; |  X X X | $F749
    .byte $4E ; | X  XXX | $F74A
    .byte $3E ; |  XXXXX | $F74B
    .byte $53 ; | X X  XX| $F74C
    .byte $52 ; | X X  X | $F74D
    .byte $93 ; |X  X  XX| $F74E
    .byte $93 ; |X  X  XX| $F74F
    .byte $93 ; |X  X  XX| $F750
    .byte $19 ; |   XX  X| $F751
    .byte $93 ; |X  X  XX| $F752
    .byte $1D ; |   XXX X| $F753
    .byte $93 ; |X  X  XX| $F754
    .byte $28 ; |  X X   | $F755
    .byte $81 ; |X      X| $F756
    .byte $2E ; |  X XXX | $F757
    .byte $2E ; |  X XXX | $F758
    .byte $2E ; |  X XXX | $F759
    .byte $26 ; |  X  XX | $F75A
    .byte $3E ; |  XXXXX | $F75B
    .byte $53 ; | X X  XX| $F75C
    .byte $93 ; |X  X  XX| $F75D
    .byte $2A ; |  X X X | $F75E
    .byte $93 ; |X  X  XX| $F75F
    .byte $93 ; |X  X  XX| $F760
    .byte $38 ; |  XXX   | $F761
    .byte $85 ; |X    X X| $F762
    .byte $50 ; | X X    | $F763
    .byte $14 ; |   X X  | $F764
    .byte $15 ; |   X X X| $F765
    .byte $36 ; |  XX XX | $F766
    .byte $41 ; | X     X| $F767
    .byte $4D ; | X  XX X| $F768
    .byte $65 ; | XX  X X| $F769
    .byte $93 ; |X  X  XX| $F76A
    .byte $6D ; | XX XX X| $F76B
    .byte $3C ; |  XXXX  | $F76C
    .byte $64 ; | XX  X  | $F76D
    .byte $20 ; |  X     | $F76E
    .byte $93 ; |X  X  XX| $F76F
    .byte $93 ; |X  X  XX| $F770
    .byte $7D ; | XXXXX X| $F771
    .byte $93 ; |X  X  XX| $F772
    .byte $29 ; |  X X  X| $F773
    .byte $43 ; | X    XX| $F774
    .byte $28 ; |  X X   | $F775
    .byte $5A ; | X XX X | $F776
    .byte $93 ; |X  X  XX| $F777
    .byte $36 ; |  XX XX | $F778
    .byte $52 ; | X X  X | $F779
    .byte $5D ; | X XXX X| $F77A
    .byte $57 ; | X X XXX| $F77B
    .byte $93 ; |X  X  XX| $F77C
    .byte $64 ; | XX  X  | $F77D
    .byte $3C ; |  XXXX  | $F77E
    .byte $32 ; |  XX  X | $F77F
    .byte $93 ; |X  X  XX| $F780
    .byte $6C ; | XX XX  | $F781
    .byte $93 ; |X  X  XX| $F782
    .byte $93 ; |X  X  XX| $F783
    .byte $93 ; |X  X  XX| $F784
    .byte $88 ; |X   X   | $F785
    .byte $93 ; |X  X  XX| $F786
    .byte $51 ; | X X   X| $F787
    .byte $6D ; | XX XX X| $F788
    .byte $93 ; |X  X  XX| $F789
    .byte $3D ; |  XXXX X| $F78A
    .byte $62 ; | XX   X | $F78B
    .byte $4C ; | X  XX  | $F78C
    .byte $5E ; | X XXXX | $F78D
    .byte $65 ; | XX  X X| $F78E
    .byte $3E ; |  XXXXX | $F78F
    .byte $93 ; |X  X  XX| $F790
    .byte $93 ; |X  X  XX| $F791
    .byte $43 ; | X    XX| $F792
    .byte $93 ; |X  X  XX| $F793
    .byte $43 ; | X    XX| $F794
    .byte $32 ; |  XX  X | $F795
    .byte $93 ; |X  X  XX| $F796
    .byte $93 ; |X  X  XX| $F797
    .byte $25 ; |  X  X X| $F798
    .byte $93 ; |X  X  XX| $F799
    .byte $16 ; |   X XX | $F79A
    .byte $5E ; | X XXXX | $F79B
    .byte $44 ; | X   X  | $F79C
    .byte $53 ; | X X  XX| $F79D
    .byte $42 ; | X    X | $F79E
    .byte $5C ; | X XXX  | $F79F
    .byte $93 ; |X  X  XX| $F7A0
    .byte $93 ; |X  X  XX| $F7A1
    .byte $40 ; | X      | $F7A2
    .byte $93 ; |X  X  XX| $F7A3
    .byte $42 ; | X    X | $F7A4
    .byte $93 ; |X  X  XX| $F7A5
    .byte $6B ; | XX X XX| $F7A6
    .byte $93 ; |X  X  XX| $F7A7
    .byte $93 ; |X  X  XX| $F7A8
    .byte $93 ; |X  X  XX| $F7A9
    .byte $2A ; |  X X X | $F7AA
    .byte $53 ; | X X  XX| $F7AB
    .byte $5B ; | X XX XX| $F7AC
    .byte $3C ; |  XXXX  | $F7AD
    .byte $93 ; |X  X  XX| $F7AE
    .byte $31 ; |  XX   X| $F7AF
    .byte $93 ; |X  X  XX| $F7B0
    .byte $93 ; |X  X  XX| $F7B1
    .byte $32 ; |  XX  X | $F7B2
    .byte $4C ; | X  XX  | $F7B3
    .byte $7F ; | XXXXXXX| $F7B4
    .byte $36 ; |  XX XX | $F7B5
    .byte $42 ; | X    X | $F7B6
    .byte $60 ; | XX     | $F7B7
    .byte $61 ; | XX    X| $F7B8
    .byte $61 ; | XX    X| $F7B9
    .byte $4D ; | X  XX X| $F7BA
    .byte $5C ; | X XXX  | $F7BB
    .byte $1E ; |   XXXX | $F7BC
    .byte $4C ; | X  XX  | $F7BD
    .byte $5E ; | X XXXX | $F7BE
    .byte $93 ; |X  X  XX| $F7BF
    .byte $93 ; |X  X  XX| $F7C0
    .byte $81 ; |X      X| $F7C1
    .byte $21 ; |  X    X| $F7C2
    .byte $52 ; | X X  X | $F7C3
    .byte $4A ; | X  X X | $F7C4
    .byte $93 ; |X  X  XX| $F7C5
    .byte $19 ; |   XX  X| $F7C6
    .byte $93 ; |X  X  XX| $F7C7
    .byte $5E ; | X XXXX | $F7C8
    .byte $40 ; | X      | $F7C9
    .byte $13 ; |   X  XX| $F7CA
    .byte $2E ; |  X XXX | $F7CB
    .byte $65 ; | XX  X X| $F7CC
    .byte $53 ; | X X  XX| $F7CD
    .byte $2C ; |  X XX  | $F7CE
    .byte $70 ; | XXX    | $F7CF
    .byte $93 ; |X  X  XX| $F7D0
    .byte $19 ; |   XX  X| $F7D1
    .byte $6B ; | XX X XX| $F7D2
    .byte $51 ; | X X   X| $F7D3
    .byte $13 ; |   X  XX| $F7D4
    .byte $93 ; |X  X  XX| $F7D5
    .byte $26 ; |  X  XX | $F7D6
    .byte $93 ; |X  X  XX| $F7D7
    .byte $93 ; |X  X  XX| $F7D8
    .byte $31 ; |  XX   X| $F7D9
    .byte $93 ; |X  X  XX| $F7DA
    .byte $5E ; | X XXXX | $F7DB
    .byte $4C ; | X  XX  | $F7DC
    .byte $35 ; |  XX X X| $F7DD
    .byte $46 ; | X   XX | $F7DE
    .byte $93 ; |X  X  XX| $F7DF
    .byte $93 ; |X  X  XX| $F7E0
    .byte $93 ; |X  X  XX| $F7E1
    .byte $3E ; |  XXXXX | $F7E2
    .byte $76 ; | XXX XX | $F7E3
    .byte $89 ; |X   X  X| $F7E4
    .byte $93 ; |X  X  XX| $F7E5
    .byte $40 ; | X      | $F7E6
    .byte $31 ; |  XX   X| $F7E7
    .byte $2E ; |  X XXX | $F7E8
    .byte $35 ; |  XX X X| $F7E9
    .byte $74 ; | XXX X  | $F7EA
    .byte $2E ; |  X XXX | $F7EB
    .byte $4C ; | X  XX  | $F7EC
    .byte $64 ; | XX  X  | $F7ED
    .byte $93 ; |X  X  XX| $F7EE
    .byte $69 ; | XX X  X| $F7EF
    .byte $93 ; |X  X  XX| $F7F0
    .byte $80 ; |X       | $F7F1
    .byte $62 ; | XX   X | $F7F2
    .byte $28 ; |  X X   | $F7F3
    .byte $3A ; |  XXX X | $F7F4
    .byte $2E ; |  X XXX | $F7F5
    .byte $70 ; | XXX    | $F7F6
    .byte $6A ; | XX X X | $F7F7
    .byte $62 ; | XX   X | $F7F8
    .byte $70 ; | XXX    | $F7F9
    .byte $4E ; | X  XXX | $F7FA
    .byte $4C ; | X  XX  | $F7FB
    .byte $70 ; | XXX    | $F7FC
    .byte $66 ; | XX  XX | $F7FD
    .byte $6A ; | XX X X | $F7FE
    .byte $93 ; |X  X  XX| $F7FF
LF800:
    .byte $93 ; |X  X  XX| $F800  hmove lines?
    .byte $30 ; |  XX    | $F801
    .byte $93 ; |X  X  XX| $F802
    .byte $3C ; |  XXXX  | $F803
    .byte $39 ; |  XXX  X| $F804
    .byte $6D ; | XX XX X| $F805
    .byte $93 ; |X  X  XX| $F806
    .byte $2C ; |  X XX  | $F807
    .byte $30 ; |  XX    | $F808
    .byte $69 ; | XX X  X| $F809
    .byte $42 ; | X    X | $F80A
    .byte $2A ; |  X X X | $F80B
    .byte $93 ; |X  X  XX| $F80C
    .byte $7C ; | XXXXX  | $F80D
    .byte $79 ; | XXXX  X| $F80E
    .byte $6B ; | XX X XX| $F80F
    .byte $42 ; | X    X | $F810
    .byte $6C ; | XX XX  | $F811
    .byte $84 ; |X    X  | $F812
    .byte $53 ; | X X  XX| $F813
    .byte $93 ; |X  X  XX| $F814
    .byte $16 ; |   X XX | $F815
    .byte $4C ; | X  XX  | $F816
    .byte $4C ; | X  XX  | $F817
    .byte $16 ; |   X XX | $F818
    .byte $4C ; | X  XX  | $F819
    .byte $28 ; |  X X   | $F81A
    .byte $4E ; | X  XXX | $F81B
    .byte $93 ; |X  X  XX| $F81C
    .byte $61 ; | XX    X| $F81D
    .byte $49 ; | X  X  X| $F81E
    .byte $22 ; |  X   X | $F81F
    .byte $56 ; | X X XX | $F820
    .byte $71 ; | XXX   X| $F821
    .byte $81 ; |X      X| $F822
    .byte $41 ; | X     X| $F823
    .byte $1E ; |   XXXX | $F824
    .byte $34 ; |  XX X  | $F825
    .byte $93 ; |X  X  XX| $F826
    .byte $34 ; |  XX X  | $F827
    .byte $59 ; | X XX  X| $F828
    .byte $2B ; |  X X XX| $F829
    .byte $22 ; |  X   X | $F82A
    .byte $3C ; |  XXXX  | $F82B
    .byte $80 ; |X       | $F82C
    .byte $17 ; |   X XXX| $F82D
    .byte $68 ; | XX X   | $F82E
    .byte $4C ; | X  XX  | $F82F
    .byte $81 ; |X      X| $F830
    .byte $4D ; | X  XX X| $F831
    .byte $93 ; |X  X  XX| $F832
    .byte $3C ; |  XXXX  | $F833
    .byte $93 ; |X  X  XX| $F834
    .byte $1A ; |   XX X | $F835
    .byte $93 ; |X  X  XX| $F836
    .byte $4C ; | X  XX  | $F837
    .byte $70 ; | XXX    | $F838
    .byte $5B ; | X XX XX| $F839
    .byte $1D ; |   XXX X| $F83A
    .byte $93 ; |X  X  XX| $F83B
    .byte $4C ; | X  XX  | $F83C
    .byte $63 ; | XX   XX| $F83D
    .byte $28 ; |  X X   | $F83E
    .byte $4C ; | X  XX  | $F83F
    .byte $93 ; |X  X  XX| $F840
    .byte $1D ; |   XXX X| $F841
    .byte $93 ; |X  X  XX| $F842
    .byte $93 ; |X  X  XX| $F843
    .byte $93 ; |X  X  XX| $F844
    .byte $93 ; |X  X  XX| $F845
    .byte $5C ; | X XXX  | $F846
    .byte $93 ; |X  X  XX| $F847
    .byte $41 ; | X     X| $F848
    .byte $54 ; | X X X  | $F849
    .byte $80 ; |X       | $F84A
    .byte $93 ; |X  X  XX| $F84B
    .byte $70 ; | XXX    | $F84C
    .byte $70 ; | XXX    | $F84D
    .byte $84 ; |X    X  | $F84E
    .byte $4C ; | X  XX  | $F84F
    .byte $93 ; |X  X  XX| $F850
    .byte $2E ; |  X XXX | $F851
    .byte $6A ; | XX X X | $F852
    .byte $2E ; |  X XXX | $F853
    .byte $73 ; | XXX  XX| $F854
    .byte $6F ; | XX XXXX| $F855
    .byte $42 ; | X    X | $F856
    .byte $18 ; |   XX   | $F857
    .byte $93 ; |X  X  XX| $F858
    .byte $59 ; | X XX  X| $F859
    .byte $11 ; |   X   X| $F85A
    .byte $2E ; |  X XXX | $F85B
    .byte $3D ; |  XXXX X| $F85C
    .byte $93 ; |X  X  XX| $F85D
    .byte $2E ; |  X XXX | $F85E
    .byte $3E ; |  XXXXX | $F85F
    .byte $93 ; |X  X  XX| $F860
    .byte $93 ; |X  X  XX| $F861
    .byte $2A ; |  X X X | $F862
    .byte $16 ; |   X XX | $F863
    .byte $72 ; | XXX  X | $F864
    .byte $32 ; |  XX  X | $F865
    .byte $4C ; | X  XX  | $F866
    .byte $93 ; |X  X  XX| $F867
    .byte $5C ; | X XXX  | $F868
    .byte $93 ; |X  X  XX| $F869
    .byte $3C ; |  XXXX  | $F86A
    .byte $5E ; | X XXXX | $F86B
    .byte $7C ; | XXXXX  | $F86C
    .byte $5E ; | X XXXX | $F86D
    .byte $79 ; | XXXX  X| $F86E
    .byte $2E ; |  X XXX | $F86F
    .byte $93 ; |X  X  XX| $F870
    .byte $24 ; |  X  X  | $F871
    .byte $4C ; | X  XX  | $F872
    .byte $70 ; | XXX    | $F873
    .byte $46 ; | X   XX | $F874
    .byte $59 ; | X XX  X| $F875
    .byte $93 ; |X  X  XX| $F876
    .byte $76 ; | XXX XX | $F877
    .byte $28 ; |  X X   | $F878
    .byte $12 ; |   X  X | $F879
    .byte $10 ; |   X    | $F87A
    .byte $12 ; |   X  X | $F87B
    .byte $53 ; | X X  XX| $F87C
    .byte $22 ; |  X   X | $F87D
    .byte $2E ; |  X XXX | $F87E
    .byte $42 ; | X    X | $F87F
    .byte $93 ; |X  X  XX| $F880
    .byte $14 ; |   X X  | $F881
    .byte $32 ; |  XX  X | $F882
    .byte $22 ; |  X   X | $F883
    .byte $56 ; | X X XX | $F884
    .byte $81 ; |X      X| $F885
    .byte $89 ; |X   X  X| $F886
    .byte $2A ; |  X X X | $F887
    .byte $38 ; |  XXX   | $F888
    .byte $12 ; |   X  X | $F889
    .byte $62 ; | XX   X | $F88A
    .byte $3C ; |  XXXX  | $F88B
    .byte $12 ; |   X  X | $F88C
    .byte $2E ; |  X XXX | $F88D
    .byte $42 ; | X    X | $F88E
    .byte $3E ; |  XXXXX | $F88F
    .byte $93 ; |X  X  XX| $F890
    .byte $32 ; |  XX  X | $F891
    .byte $5E ; | X XXXX | $F892
    .byte $49 ; | X  X  X| $F893
    .byte $6D ; | XX XX X| $F894
    .byte $93 ; |X  X  XX| $F895
    .byte $78 ; | XXXX   | $F896
    .byte $89 ; |X   X  X| $F897
    .byte $32 ; |  XX  X | $F898
    .byte $2C ; |  X XX  | $F899
    .byte $45 ; | X   X X| $F89A
    .byte $2E ; |  X XXX | $F89B
    .byte $35 ; |  XX X X| $F89C
    .byte $24 ; |  X  X  | $F89D
    .byte $6C ; | XX XX  | $F89E
    .byte $59 ; | X XX  X| $F89F
    .byte $93 ; |X  X  XX| $F8A0
    .byte $32 ; |  XX  X | $F8A1
    .byte $39 ; |  XXX  X| $F8A2
    .byte $3A ; |  XXX X | $F8A3
    .byte $21 ; |  X    X| $F8A4
    .byte $4D ; | X  XX X| $F8A5
    .byte $18 ; |   XX   | $F8A6
    .byte $19 ; |   XX  X| $F8A7
    .byte $18 ; |   XX   | $F8A8
    .byte $93 ; |X  X  XX| $F8A9
    .byte $59 ; | X XX  X| $F8AA
    .byte $22 ; |  X   X | $F8AB
    .byte $33 ; |  XX  XX| $F8AC
    .byte $6B ; | XX X XX| $F8AD
    .byte $3E ; |  XXXXX | $F8AE
    .byte $4C ; | X  XX  | $F8AF
    .byte $93 ; |X  X  XX| $F8B0
    .byte $89 ; |X   X  X| $F8B1
    .byte $26 ; |  X  XX | $F8B2
    .byte $54 ; | X X X  | $F8B3
    .byte $2D ; |  X XX X| $F8B4
    .byte $39 ; |  XXX  X| $F8B5
    .byte $70 ; | XXX    | $F8B6
    .byte $31 ; |  XX   X| $F8B7
    .byte $93 ; |X  X  XX| $F8B8
    .byte $93 ; |X  X  XX| $F8B9
    .byte $6E ; | XX XXX | $F8BA
    .byte $20 ; |  X     | $F8BB
    .byte $6E ; | XX XXX | $F8BC
    .byte $21 ; |  X    X| $F8BD
    .byte $2E ; |  X XXX | $F8BE
    .byte $38 ; |  XXX   | $F8BF
    .byte $93 ; |X  X  XX| $F8C0
    .byte $2E ; |  X XXX | $F8C1
    .byte $80 ; |X       | $F8C2
    .byte $52 ; | X X  X | $F8C3
    .byte $4A ; | X  X X | $F8C4
    .byte $4D ; | X  XX X| $F8C5
    .byte $32 ; |  XX  X | $F8C6
    .byte $66 ; | XX  XX | $F8C7
    .byte $78 ; | XXXX   | $F8C8
    .byte $93 ; |X  X  XX| $F8C9
    .byte $32 ; |  XX  X | $F8CA
    .byte $78 ; | XXXX   | $F8CB
    .byte $1E ; |   XXXX | $F8CC
    .byte $39 ; |  XXX  X| $F8CD
    .byte $18 ; |   XX   | $F8CE
    .byte $2E ; |  X XXX | $F8CF
    .byte $93 ; |X  X  XX| $F8D0
    .byte $32 ; |  XX  X | $F8D1
    .byte $88 ; |X   X   | $F8D2
    .byte $2E ; |  X XXX | $F8D3
    .byte $2E ; |  X XXX | $F8D4
    .byte $6A ; | XX X X | $F8D5
    .byte $26 ; |  X  XX | $F8D6
    .byte $4D ; | X  XX X| $F8D7
    .byte $93 ; |X  X  XX| $F8D8
    .byte $72 ; | XXX  X | $F8D9
    .byte $56 ; | X X XX | $F8DA
    .byte $24 ; |  X  X  | $F8DB
    .byte $20 ; |  X     | $F8DC
    .byte $60 ; | XX     | $F8DD
    .byte $88 ; |X   X   | $F8DE
    .byte $2A ; |  X X X | $F8DF
    .byte $93 ; |X  X  XX| $F8E0
    .byte $36 ; |  XX XX | $F8E1
    .byte $6E ; | XX XXX | $F8E2
    .byte $21 ; |  X    X| $F8E3
    .byte $80 ; |X       | $F8E4
    .byte $4C ; | X  XX  | $F8E5
    .byte $93 ; |X  X  XX| $F8E6
    .byte $2E ; |  X XXX | $F8E7
    .byte $43 ; | X    XX| $F8E8
    .byte $58 ; | X XX   | $F8E9
    .byte $3F ; |  XXXXXX| $F8EA
    .byte $75 ; | XXX X X| $F8EB
    .byte $15 ; |   X X X| $F8EC
    .byte $22 ; |  X   X | $F8ED
    .byte $28 ; |  X X   | $F8EE
    .byte $62 ; | XX   X | $F8EF
    .byte $93 ; |X  X  XX| $F8F0
    .byte $36 ; |  XX XX | $F8F1
    .byte $21 ; |  X    X| $F8F2
    .byte $73 ; | XXX  XX| $F8F3
    .byte $3A ; |  XXX X | $F8F4
    .byte $93 ; |X  X  XX| $F8F5
    .byte $12 ; |   X  X | $F8F6
    .byte $31 ; |  XX   X| $F8F7
    .byte $31 ; |  XX   X| $F8F8
    .byte $93 ; |X  X  XX| $F8F9
    .byte $88 ; |X   X   | $F8FA
    .byte $21 ; |  X    X| $F8FB
    .byte $1E ; |   XXXX | $F8FC
    .byte $25 ; |  X  X X| $F8FD
    .byte $2E ; |  X XXX | $F8FE
    .byte $1A ; |   XX X | $F8FF
LF900:
    .byte $90 ; |X  X    | $F900
    .byte $90 ; |X  X    | $F901
    .byte $90 ; |X  X    | $F902
    .byte $90 ; |X  X    | $F903
    .byte $90 ; |X  X    | $F904
    .byte $90 ; |X  X    | $F905
    .byte $90 ; |X  X    | $F906
    .byte $50 ; | X X    | $F907
    .byte $90 ; |X  X    | $F908
    .byte $68 ; | XX X   | $F909
    .byte $90 ; |X  X    | $F90A
    .byte $90 ; |X  X    | $F90B
    .byte $90 ; |X  X    | $F90C
    .byte $50 ; | X X    | $F90D
    .byte $14 ; |   X X  | $F90E
    .byte $24 ; |  X  X  | $F90F
    .byte $18 ; |   XX   | $F910
    .byte $50 ; | X X    | $F911
    .byte $84 ; |X    X  | $F912
    .byte $90 ; |X  X    | $F913
    .byte $90 ; |X  X    | $F914
    .byte $51 ; | X X   X| $F915
    .byte $91 ; |X  X   X| $F916
    .byte $80 ; |X       | $F917
    .byte $4C ; | X  XX  | $F918
    .byte $80 ; |X       | $F919
    .byte $50 ; | X X    | $F91A
    .byte $90 ; |X  X    | $F91B
    .byte $90 ; |X  X    | $F91C
    .byte $50 ; | X X    | $F91D
    .byte $84 ; |X    X  | $F91E
    .byte $50 ; | X X    | $F91F
    .byte $60 ; | XX     | $F920
    .byte $34 ; |  XX X  | $F921
    .byte $70 ; | XXX    | $F922
    .byte $18 ; |   XX   | $F923
    .byte $68 ; | XX X   | $F924
    .byte $90 ; |X  X    | $F925
    .byte $90 ; |X  X    | $F926
    .byte $50 ; | X X    | $F927
    .byte $18 ; |   XX   | $F928
    .byte $4C ; | X  XX  | $F929
    .byte $64 ; | XX  X  | $F92A
    .byte $80 ; |X       | $F92B
    .byte $28 ; |  X X   | $F92C
    .byte $1C ; |   XXX  | $F92D
    .byte $50 ; | X X    | $F92E
    .byte $78 ; | XXXX   | $F92F
    .byte $40 ; | X      | $F930
    .byte $90 ; |X  X    | $F931
    .byte $90 ; |X  X    | $F932
    .byte $50 ; | X X    | $F933
    .byte $68 ; | XX X   | $F934
    .byte $50 ; | X X    | $F935
    .byte $68 ; | XX X   | $F936
    .byte $78 ; | XXXX   | $F937
    .byte $50 ; | X X    | $F938
    .byte $18 ; |   XX   | $F939
    .byte $68 ; | XX X   | $F93A
    .byte $30 ; |  XX    | $F93B
    .byte $39 ; |  XXX  X| $F93C
    .byte $91 ; |X  X   X| $F93D
    .byte $91 ; |X  X   X| $F93E
    .byte $91 ; |X  X   X| $F93F
    .byte $90 ; |X  X    | $F940
    .byte $50 ; | X X    | $F941
    .byte $80 ; |X       | $F942
    .byte $80 ; |X       | $F943
    .byte $80 ; |X       | $F944
    .byte $80 ; |X       | $F945
    .byte $80 ; |X       | $F946
    .byte $40 ; | X      | $F947
    .byte $18 ; |   XX   | $F948
    .byte $50 ; | X X    | $F949
    .byte $80 ; |X       | $F94A
    .byte $90 ; |X  X    | $F94B
    .byte $90 ; |X  X    | $F94C
    .byte $90 ; |X  X    | $F94D
    .byte $90 ; |X  X    | $F94E
    .byte $90 ; |X  X    | $F94F
    .byte $90 ; |X  X    | $F950
    .byte $50 ; | X X    | $F951
    .byte $80 ; |X       | $F952
    .byte $4C ; | X  XX  | $F953
    .byte $4C ; | X  XX  | $F954
    .byte $1C ; |   XXX  | $F955
    .byte $28 ; |  X X   | $F956
    .byte $84 ; |X    X  | $F957
    .byte $88 ; |X   X   | $F958
    .byte $88 ; |X   X   | $F959
    .byte $81 ; |X      X| $F95A
    .byte $91 ; |X  X   X| $F95B
    .byte $91 ; |X  X   X| $F95C
    .byte $91 ; |X  X   X| $F95D
    .byte $91 ; |X  X   X| $F95E
    .byte $91 ; |X  X   X| $F95F
    .byte $90 ; |X  X    | $F960
    .byte $50 ; | X X    | $F961
    .byte $68 ; | XX X   | $F962
    .byte $84 ; |X    X  | $F963
    .byte $50 ; | X X    | $F964
    .byte $2C ; |  X XX  | $F965
    .byte $84 ; |X    X  | $F966
    .byte $68 ; | XX X   | $F967
    .byte $88 ; |X   X   | $F968
    .byte $88 ; |X   X   | $F969
    .byte $68 ; | XX X   | $F96A
    .byte $90 ; |X  X    | $F96B
    .byte $90 ; |X  X    | $F96C
    .byte $90 ; |X  X    | $F96D
    .byte $90 ; |X  X    | $F96E
    .byte $90 ; |X  X    | $F96F
    .byte $93 ; |X  X  XX| $F970
    .byte $50 ; | X X    | $F971
    .byte $1C ; |   XXX  | $F972
    .byte $90 ; |X  X    | $F973
    .byte $70 ; | XXX    | $F974
    .byte $50 ; | X X    | $F975
    .byte $88 ; |X   X   | $F976
    .byte $80 ; |X       | $F977
    .byte $90 ; |X  X    | $F978
    .byte $68 ; | XX X   | $F979
    .byte $69 ; | XX X  X| $F97A
    .byte $91 ; |X  X   X| $F97B
    .byte $91 ; |X  X   X| $F97C
    .byte $91 ; |X  X   X| $F97D
    .byte $91 ; |X  X   X| $F97E
    .byte $91 ; |X  X   X| $F97F
    .byte $91 ; |X  X   X| $F980
    .byte $50 ; | X X    | $F981
    .byte $2C ; |  X XX  | $F982
    .byte $18 ; |   XX   | $F983
    .byte $28 ; |  X X   | $F984
    .byte $88 ; |X   X   | $F985
    .byte $88 ; |X   X   | $F986
    .byte $90 ; |X  X    | $F987
    .byte $50 ; | X X    | $F988
    .byte $2D ; |  X XX X| $F989
    .byte $91 ; |X  X   X| $F98A
    .byte $91 ; |X  X   X| $F98B
    .byte $91 ; |X  X   X| $F98C
    .byte $91 ; |X  X   X| $F98D
    .byte $91 ; |X  X   X| $F98E
    .byte $91 ; |X  X   X| $F98F
    .byte $90 ; |X  X    | $F990
    .byte $51 ; | X X   X| $F991
    .byte $91 ; |X  X   X| $F992
    .byte $50 ; | X X    | $F993
    .byte $90 ; |X  X    | $F994
    .byte $50 ; | X X    | $F995
    .byte $68 ; | XX X   | $F996
    .byte $84 ; |X    X  | $F997
    .byte $90 ; |X  X    | $F998
    .byte $88 ; |X   X   | $F999
    .byte $4C ; | X  XX  | $F99A
    .byte $90 ; |X  X    | $F99B
    .byte $90 ; |X  X    | $F99C
    .byte $90 ; |X  X    | $F99D
    .byte $90 ; |X  X    | $F99E
    .byte $90 ; |X  X    | $F99F
    .byte $90 ; |X  X    | $F9A0
    .byte $50 ; | X X    | $F9A1
    .byte $68 ; | XX X   | $F9A2
    .byte $60 ; | XX     | $F9A3
    .byte $20 ; |  X     | $F9A4
    .byte $58 ; | X XX   | $F9A5
    .byte $80 ; |X       | $F9A6
    .byte $80 ; |X       | $F9A7
    .byte $80 ; |X       | $F9A8
    .byte $80 ; |X       | $F9A9
    .byte $51 ; | X X   X| $F9AA
    .byte $91 ; |X  X   X| $F9AB
    .byte $91 ; |X  X   X| $F9AC
    .byte $91 ; |X  X   X| $F9AD
    .byte $91 ; |X  X   X| $F9AE
    .byte $91 ; |X  X   X| $F9AF
    .byte $90 ; |X  X    | $F9B0
    .byte $18 ; |   XX   | $F9B1
    .byte $90 ; |X  X    | $F9B2
    .byte $78 ; | XXXX   | $F9B3
    .byte $68 ; | XX X   | $F9B4
    .byte $14 ; |   X X  | $F9B5
    .byte $64 ; | XX  X  | $F9B6
    .byte $88 ; |X   X   | $F9B7
    .byte $88 ; |X   X   | $F9B8
    .byte $88 ; |X   X   | $F9B9
    .byte $78 ; | XXXX   | $F9BA
    .byte $90 ; |X  X    | $F9BB
    .byte $90 ; |X  X    | $F9BC
    .byte $90 ; |X  X    | $F9BD
    .byte $90 ; |X  X    | $F9BE
    .byte $90 ; |X  X    | $F9BF
    .byte $90 ; |X  X    | $F9C0
    .byte $50 ; | X X    | $F9C1
    .byte $28 ; |  X X   | $F9C2
    .byte $78 ; | XXXX   | $F9C3
    .byte $88 ; |X   X   | $F9C4
    .byte $68 ; | XX X   | $F9C5
    .byte $4C ; | X  XX  | $F9C6
    .byte $81 ; |X      X| $F9C7
    .byte $91 ; |X  X   X| $F9C8
    .byte $80 ; |X       | $F9C9
    .byte $65 ; | XX  X X| $F9CA
    .byte $91 ; |X  X   X| $F9CB
    .byte $91 ; |X  X   X| $F9CC
    .byte $91 ; |X  X   X| $F9CD
    .byte $91 ; |X  X   X| $F9CE
    .byte $91 ; |X  X   X| $F9CF
    .byte $90 ; |X  X    | $F9D0
    .byte $50 ; | X X    | $F9D1
    .byte $80 ; |X       | $F9D2
    .byte $7C ; | XXXXX  | $F9D3
    .byte $50 ; | X X    | $F9D4
    .byte $80 ; |X       | $F9D5
    .byte $90 ; |X  X    | $F9D6
    .byte $3C ; |  XXXX  | $F9D7
    .byte $4C ; | X  XX  | $F9D8
    .byte $4C ; | X  XX  | $F9D9
    .byte $4C ; | X  XX  | $F9DA
    .byte $90 ; |X  X    | $F9DB
    .byte $90 ; |X  X    | $F9DC
    .byte $90 ; |X  X    | $F9DD
    .byte $90 ; |X  X    | $F9DE
    .byte $90 ; |X  X    | $F9DF
    .byte $90 ; |X  X    | $F9E0
    .byte $4C ; | X  XX  | $F9E1
    .byte $70 ; | XXX    | $F9E2
    .byte $5C ; | X XXX  | $F9E3
    .byte $24 ; |  X  X  | $F9E4
    .byte $88 ; |X   X   | $F9E5
    .byte $4C ; | X  XX  | $F9E6
    .byte $68 ; | XX X   | $F9E7
    .byte $6C ; | XX XX  | $F9E8
    .byte $88 ; |X   X   | $F9E9
    .byte $79 ; | XXXX  X| $F9EA
    .byte $91 ; |X  X   X| $F9EB
    .byte $91 ; |X  X   X| $F9EC
    .byte $91 ; |X  X   X| $F9ED
    .byte $91 ; |X  X   X| $F9EE
    .byte $91 ; |X  X   X| $F9EF
    .byte $90 ; |X  X    | $F9F0
    .byte $4C ; | X  XX  | $F9F1
    .byte $80 ; |X       | $F9F2
    .byte $88 ; |X   X   | $F9F3
    .byte $88 ; |X   X   | $F9F4
    .byte $88 ; |X   X   | $F9F5
    .byte $80 ; |X       | $F9F6
    .byte $70 ; | XXX    | $F9F7
    .byte $80 ; |X       | $F9F8
    .byte $80 ; |X       | $F9F9
    .byte $84 ; |X    X  | $F9FA
    .byte $90 ; |X  X    | $F9FB
    .byte $90 ; |X  X    | $F9FC
    .byte $90 ; |X  X    | $F9FD
    .byte $90 ; |X  X    | $F9FE
    .byte $90 ; |X  X    | $F9FF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      Middle Section PF1 shapes
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFA00:

;Level 1
    .byte $00 ; |        | $FA00   screen 1               Middle Section PF1 shapes
    .byte $C0 ; |XX      | $FA01      2
;Level 2
    .byte $00 ; |        | $FA02   screen 1
    .byte $00 ; |        | $FA03      2
    .byte $E0 ; |XXX     | $FA04      3
    .byte $C0 ; |XX      | $FA05      4
;Level 3
    .byte $00 ; |        | $FA06   screen 1
    .byte $00 ; |        | $FA07      2
    .byte $00 ; |        | $FA08      3
    .byte $00 ; |        | $FA09      4
    .byte $00 ; |        | $FA0A      5
    .byte $C0 ; |XX      | $FA0B      6
;Level 4
    .byte $80 ; |X       | $FA0C   screen 1
    .byte $00 ; |        | $FA0D      2
    .byte $03 ; |      XX| $FA0E      3
    .byte $80 ; |X       | $FA0F      4
    .byte $80 ; |X       | $FA10      5
    .byte $00 ; |        | $FA11      6
    .byte $00 ; |        | $FA12      7
    .byte $C0 ; |XX      | $FA13      8
;Level 5
    .byte $00 ; |        | $FA14   screen 1
    .byte $00 ; |        | $FA15      2
    .byte $00 ; |        | $FA16      3
    .byte $FF ; |XXXXXXXX| $FA17      4
    .byte $00 ; |        | $FA18      5
    .byte $00 ; |        | $FA19      6
    .byte $00 ; |        | $FA1A      7
    .byte $00 ; |        | $FA1B      8
;Level 6
    .byte $00 ; |        | $FA1C   screen 1
    .byte $00 ; |        | $FA1D      2
    .byte $00 ; |        | $FA1E      3
    .byte $C0 ; |XX      | $FA1F      4
    .byte $FF ; |XXXXXXXX| $FA20      5
    .byte $00 ; |        | $FA21      6
    .byte $00 ; |        | $FA22      7
    .byte $00 ; |        | $FA23      8
    .byte $C0 ; |XX      | $FA24      9
    .byte $C0 ; |XX      | $FA25     10
;Level 7
    .byte $80 ; |X       | $FA26   screen 1
    .byte $80 ; |X       | $FA27      2
    .byte $00 ; |        | $FA28      3
    .byte $FF ; |XXXXXXXX| $FA29      4
    .byte $F0 ; |XXXX    | $FA2A      5
    .byte $F0 ; |XXXX    | $FA2B      6
    .byte $FC ; |XXXXXX  | $FA2C      7
    .byte $E0 ; |XXX     | $FA2D      8
    .byte $E0 ; |XXX     | $FA2E      9
    .byte $C0 ; |XX      | $FA2F     10
    .byte $00 ; |        | $FA30     11
    .byte $00 ; |        | $FA31     12
;Level 8
    .byte $80 ; |X       | $FA32   screen 1
    .byte $00 ; |        | $FA33      2
    .byte $FF ; |XXXXXXXX| $FA34      3
    .byte $00 ; |        | $FA35      4
    .byte $F8 ; |XXXXX   | $FA36      5
    .byte $F8 ; |XXXXX   | $FA37      6
    .byte $00 ; |        | $FA38      7
    .byte $00 ; |        | $FA39      8
    .byte $E0 ; |XXX     | $FA3A      9
    .byte $F0 ; |XXXX    | $FA3B     10
    .byte $00 ; |        | $FA3C     11
    .byte $00 ; |        | $FA3D     12
    .byte $00 ; |        | $FA3E     13
    .byte $00 ; |        | $FA3F     14
;Level 9
    .byte $00 ; |        | $FA40   screen 1
    .byte $00 ; |        | $FA41      2
    .byte $81 ; |X      X| $FA42      3
    .byte $F1 ; |XXXX   X| $FA43      4
    .byte $FE ; |XXXXXXX | $FA44      5
    .byte $FF ; |XXXXXXXX| $FA45      6
    .byte $FF ; |XXXXXXXX| $FA46      7
    .byte $00 ; |        | $FA47      8
    .byte $00 ; |        | $FA48      9
    .byte $FF ; |XXXXXXXX| $FA49     10
    .byte $00 ; |        | $FA4A     11
    .byte $00 ; |        | $FA4B     12
    .byte $00 ; |        | $FA4C     13
    .byte $00 ; |        | $FA4D     14
    .byte $00 ; |        | $FA4E     15
    .byte $00 ; |        | $FA4F     16
;Level 10
    .byte $00 ; |        | $FA50   screen 1
    .byte $00 ; |        | $FA51      2
    .byte $00 ; |        | $FA52      3
    .byte $00 ; |        | $FA53      4
    .byte $FC ; |XXXXXX  | $FA54      5
    .byte $01 ; |       X| $FA55      6
    .byte $00 ; |        | $FA56      7
    .byte $CF ; |XX  XXXX| $FA57      8
    .byte $FF ; |XXXXXXXX| $FA58      9
    .byte $FF ; |XXXXXXXX| $FA59     10
    .byte $00 ; |        | $FA5A     11
    .byte $00 ; |        | $FA5B     12
    .byte $00 ; |        | $FA5C     13
    .byte $00 ; |        | $FA5D     14
    .byte $00 ; |        | $FA5E     15
    .byte $00 ; |        | $FA5F     16
;Level 11
    .byte $80 ; |X       | $FA60   screen 1
    .byte $FF ; |XXXXXXXX| $FA61      2
    .byte $00 ; |        | $FA62      3
    .byte $00 ; |        | $FA63      4
    .byte $00 ; |        | $FA64      5
    .byte $9C ; |X  XXX  | $FA65      6
    .byte $00 ; |        | $FA66      7
    .byte $FF ; |XXXXXXXX| $FA67      8
    .byte $FF ; |XXXXXXXX| $FA68      9
    .byte $FF ; |XXXXXXXX| $FA69     10
    .byte $03 ; |      XX| $FA6A     11
    .byte $00 ; |        | $FA6B     12
    .byte $00 ; |        | $FA6C     13
    .byte $00 ; |        | $FA6D     14
    .byte $00 ; |        | $FA6E     15
    .byte $00 ; |        | $FA6F     16
;Level 12
    .byte $E0 ; |XXX     | $FA70   screen 1
    .byte $C0 ; |XX      | $FA71      2
    .byte $00 ; |        | $FA72      3
    .byte $00 ; |        | $FA73      4
    .byte $00 ; |        | $FA74      5
    .byte $FC ; |XXXXXX  | $FA75      6
    .byte $F3 ; |XXXX  XX| $FA76      7
    .byte $00 ; |        | $FA77      8
    .byte $00 ; |        | $FA78      9
    .byte $00 ; |        | $FA79     10
    .byte $00 ; |        | $FA7A     11
    .byte $00 ; |        | $FA7B     12
    .byte $00 ; |        | $FA7C     13
    .byte $00 ; |        | $FA7D     14
    .byte $00 ; |        | $FA7E     15
    .byte $00 ; |        | $FA7F     16
;Level 13
    .byte $00 ; |        | $FA80   screen 1
    .byte $00 ; |        | $FA81      2
    .byte $9C ; |X  XXX  | $FA82      3
    .byte $80 ; |X       | $FA83      4
    .byte $F0 ; |XXXX    | $FA84      5
    .byte $C3 ; |XX    XX| $FA85      6
    .byte $03 ; |      XX| $FA86      7
    .byte $00 ; |        | $FA87      8
    .byte $00 ; |        | $FA88      9
    .byte $00 ; |        | $FA89     10
    .byte $00 ; |        | $FA8A     11
    .byte $00 ; |        | $FA8B     12
    .byte $00 ; |        | $FA8C     13
    .byte $00 ; |        | $FA8D     14
    .byte $00 ; |        | $FA8E     15
    .byte $00 ; |        | $FA8F     16
;Level 14
    .byte $00 ; |        | $FA90   screen 1
    .byte $00 ; |        | $FA91      2
    .byte $00 ; |        | $FA92      3
    .byte $00 ; |        | $FA93      4
    .byte $00 ; |        | $FA94      5
    .byte $FF ; |XXXXXXXX| $FA95      6
    .byte $00 ; |        | $FA96      7
    .byte $00 ; |        | $FA97      8
    .byte $00 ; |        | $FA98      9
    .byte $FC ; |XXXXXX  | $FA99     10
    .byte $03 ; |      XX| $FA9A     11
    .byte $00 ; |        | $FA9B     12
    .byte $00 ; |        | $FA9C     13
    .byte $00 ; |        | $FA9D     14
    .byte $00 ; |        | $FA9E     15
    .byte $00 ; |        | $FA9F     16
;Level 15
    .byte $00 ; |        | $FAA0   screen 1
    .byte $F8 ; |XXXXX   | $FAA1      2
    .byte $FC ; |XXXXXX  | $FAA2      3
    .byte $00 ; |        | $FAA3      4
    .byte $00 ; |        | $FAA4      5
    .byte $00 ; |        | $FAA5      6
    .byte $00 ; |        | $FAA6      7
    .byte $00 ; |        | $FAA7      8
    .byte $00 ; |        | $FAA8      9
    .byte $FF ; |XXXXXXXX| $FAA9     10
    .byte $00 ; |        | $FAAA     11
    .byte $00 ; |        | $FAAB     12
    .byte $03 ; |      XX| $FAAC     13
    .byte $00 ; |        | $FAAD     14
    .byte $00 ; |        | $FAAE     15
    .byte $00 ; |        | $FAAF     16
;Level 16
    .byte $00 ; |        | $FAB0   screen 1
    .byte $00 ; |        | $FAB1      2
    .byte $00 ; |        | $FAB2      3
    .byte $FF ; |XXXXXXXX| $FAB3      4
    .byte $00 ; |        | $FAB4      5
    .byte $00 ; |        | $FAB5      6
    .byte $FF ; |XXXXXXXX| $FAB6      7
    .byte $FF ; |XXXXXXXX| $FAB7      8
    .byte $FF ; |XXXXXXXX| $FAB8      9
    .byte $FF ; |XXXXXXXX| $FAB9     10
    .byte $00 ; |        | $FABA     11
    .byte $00 ; |        | $FABB     12
    .byte $00 ; |        | $FABC     13
    .byte $03 ; |      XX| $FABD     14
    .byte $00 ; |        | $FABE     15
    .byte $00 ; |        | $FABF     16
;Level 17
    .byte $00 ; |        | $FAC0   screen 1
    .byte $F0 ; |XXXX    | $FAC1      2
    .byte $C3 ; |XX    XX| $FAC2      3
    .byte $FF ; |XXXXXXXX| $FAC3      4
    .byte $FF ; |XXXXXXXX| $FAC4      5
    .byte $FF ; |XXXXXXXX| $FAC5      6
    .byte $00 ; |        | $FAC6      7
    .byte $00 ; |        | $FAC7      8
    .byte $F0 ; |XXXX    | $FAC8      9
    .byte $FF ; |XXXXXXXX| $FAC9     10
    .byte $00 ; |        | $FACA     11
    .byte $00 ; |        | $FACB     12
    .byte $00 ; |        | $FACC     13
    .byte $00 ; |        | $FACD     14
    .byte $00 ; |        | $FACE     15
    .byte $00 ; |        | $FACF     16
;Level 18
    .byte $00 ; |        | $FAD0   screen 1
    .byte $00 ; |        | $FAD1      2
    .byte $07 ; |     XXX| $FAD2      3
    .byte $00 ; |        | $FAD3      4
    .byte $00 ; |        | $FAD4      5
    .byte $00 ; |        | $FAD5      6
    .byte $00 ; |        | $FAD6      7
    .byte $FF ; |XXXXXXXX| $FAD7      8
    .byte $FF ; |XXXXXXXX| $FAD8      9
    .byte $00 ; |        | $FAD9     10
    .byte $0E ; |    XXX | $FADA     11
    .byte $00 ; |        | $FADB     12
    .byte $00 ; |        | $FADC     13
    .byte $00 ; |        | $FADD     14
    .byte $00 ; |        | $FADE     15
    .byte $00 ; |        | $FADF     16
;Level 19
    .byte $00 ; |        | $FAE0   screen 1
    .byte $00 ; |        | $FAE1      2
    .byte $E0 ; |XXX     | $FAE2      3
    .byte $F0 ; |XXXX    | $FAE3      4
    .byte $FC ; |XXXXXX  | $FAE4      5
    .byte $C0 ; |XX      | $FAE5      6
    .byte $FF ; |XXXXXXXX| $FAE6      7
    .byte $FC ; |XXXXXX  | $FAE7      8
    .byte $FF ; |XXXXXXXX| $FAE8      9
    .byte $FF ; |XXXXXXXX| $FAE9     10
    .byte $1F ; |   XXXXX| $FAEA     11
    .byte $00 ; |        | $FAEB     12
    .byte $00 ; |        | $FAEC     13
    .byte $00 ; |        | $FAED     14
    .byte $00 ; |        | $FAEE     15
    .byte $00 ; |        | $FAEF     16
;Level 20
    .byte $00 ; |        | $FAF0   screen 1
    .byte $00 ; |        | $FAF1      2
    .byte $F3 ; |XXXX  XX| $FAF2      3
    .byte $F3 ; |XXXX  XX| $FAF3      4
    .byte $FF ; |XXXXXXXX| $FAF4      5
    .byte $FF ; |XXXXXXXX| $FAF5      6
    .byte $00 ; |        | $FAF6      7
    .byte $FF ; |XXXXXXXX| $FAF7      8
    .byte $00 ; |        | $FAF8      9
    .byte $FF ; |XXXXXXXX| $FAF9     10
    .byte $0F ; |    XXXX| $FAFA     11
    .byte $03 ; |      XX| $FAFB     12
    .byte $00 ; |        | $FAFC     13
    .byte $00 ; |        | $FAFD     14
    .byte $00 ; |        | $FAFE     15
LFAFF:
    .byte $00 ; |        | $FAFF     16

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      Top, Bottom Section PF1 shapes
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFB00:

;Level 1
    .byte $FF ; |XXXXXXXX| $FB00   screen 1               Top sections are offsetted by -1
    .byte $FF ; |XXXXXXXX| $FB01      2
;Level 2
    .byte $FF ; |XXXXXXXX| $FB02   screen 1
    .byte $FC ; |XXXXXX  | $FB03      2
    .byte $FF ; |XXXXXXXX| $FB04      3
    .byte $FF ; |XXXXXXXX| $FB05      4
;Level 3
    .byte $FF ; |XXXXXXXX| $FB06   screen 1
    .byte $C0 ; |XX      | $FB07      2
    .byte $FF ; |XXXXXXXX| $FB08      3
    .byte $FC ; |XXXXXX  | $FB09      4
    .byte $FF ; |XXXXXXXX| $FB0A      5
    .byte $FF ; |XXXXXXXX| $FB0B      6
;Level 4
    .byte $FF ; |XXXXXXXX| $FB0C   screen 1
    .byte $9F ; |X  XXXXX| $FB0D      2
    .byte $F1 ; |XXXX   X| $FB0E      3
    .byte $0F ; |    XXXX| $FB0F      4
    .byte $FF ; |XXXXXXXX| $FB10      5
    .byte $9F ; |X  XXXXX| $FB11      6
    .byte $FF ; |XXXXXXXX| $FB12      7
    .byte $FF ; |XXXXXXXX| $FB13      8
;Level 5
    .byte $FF ; |XXXXXXXX| $FB14   screen 1
    .byte $FF ; |XXXXXXXX| $FB15      2
    .byte $C0 ; |XX      | $FB16      3
    .byte $FF ; |XXXXXXXX| $FB17      4
    .byte $CF ; |XX  XXXX| $FB18      5
    .byte $FF ; |XXXXXXXX| $FB19      6
    .byte $FC ; |XXXXXX  | $FB1A      7
    .byte $FF ; |XXXXXXXX| $FB1B      8
;Level 6
    .byte $FF ; |XXXXXXXX| $FB1C   screen 1
    .byte $80 ; |X       | $FB1D      2
    .byte $FF ; |XXXXXXXX| $FB1E      3
    .byte $E7 ; |XXX  XXX| $FB1F      4
    .byte $FF ; |XXXXXXXX| $FB20      5
    .byte $FC ; |XXXXXX  | $FB21      6
    .byte $CF ; |XX  XXXX| $FB22      7
    .byte $FF ; |XXXXXXXX| $FB23      8
    .byte $FF ; |XXXXXXXX| $FB24      9
    .byte $FF ; |XXXXXXXX| $FB25     10
;Level 7
    .byte $FF ; |XXXXXXXX| $FB26   screen 1
    .byte $CF ; |XX  XXXX| $FB27      2
    .byte $FF ; |XXXXXXXX| $FB28      3
    .byte $FF ; |XXXXXXXX| $FB29      4
    .byte $C3 ; |XX    XX| $FB2A      5
    .byte $00 ; |        | $FB2B      6
    .byte $07 ; |     XXX| $FB2C      7
    .byte $FF ; |XXXXXXXX| $FB2D      8
    .byte $F0 ; |XXXX    | $FB2E      9
    .byte $FF ; |XXXXXXXX| $FB2F     10
    .byte $F0 ; |XXXX    | $FB30     11
    .byte $FF ; |XXXXXXXX| $FB31     12
;Level 8
    .byte $FF ; |XXXXXXXX| $FB32   screen 1
    .byte $FF ; |XXXXXXXX| $FB33      2
    .byte $FF ; |XXXXXXXX| $FB34      3
    .byte $FF ; |XXXXXXXX| $FB35      4
    .byte $F0 ; |XXXX    | $FB36      5
    .byte $FF ; |XXXXXXXX| $FB37      6
    .byte $CF ; |XX  XXXX| $FB38      7
    .byte $FF ; |XXXXXXXX| $FB39      8
    .byte $00 ; |        | $FB3A      9
    .byte $C0 ; |XX      | $FB3B     10
    .byte $FC ; |XXXXXX  | $FB3C     11
    .byte $FE ; |XXXXXXX | $FB3D     12
    .byte $F0 ; |XXXX    | $FB3E     13
    .byte $FF ; |XXXXXXXX| $FB3F     14
;Level 9
    .byte $FF ; |XXXXXXXX| $FB40   screen 1
    .byte $C3 ; |XX    XX| $FB41      2
    .byte $C0 ; |XX      | $FB42      3
    .byte $C0 ; |XX      | $FB43      4
    .byte $C0 ; |XX      | $FB44      5
    .byte $C0 ; |XX      | $FB45      6
    .byte $FF ; |XXXXXXXX| $FB46      7
    .byte $CF ; |XX  XXXX| $FB47      8
    .byte $FF ; |XXXXXXXX| $FB48      9
    .byte $C0 ; |XX      | $FB49     10
    .byte $FF ; |XXXXXXXX| $FB4A     11
    .byte $F0 ; |XXXX    | $FB4B     12
    .byte $80 ; |X       | $FB4C     13
    .byte $FF ; |XXXXXXXX| $FB4D     14
    .byte $C0 ; |XX      | $FB4E     15
    .byte $FF ; |XXXXXXXX| $FB4F     16
;Level 10
    .byte $FF ; |XXXXXXXX| $FB50   screen 1
    .byte $CF ; |XX  XXXX| $FB51      2
    .byte $FF ; |XXXXXXXX| $FB52      3
    .byte $E7 ; |XXX  XXX| $FB53      4
    .byte $E7 ; |XXX  XXX| $FB54      5
    .byte $F8 ; |XXXXX   | $FB55      6
    .byte $87 ; |X    XXX| $FB56      7
    .byte $00 ; |        | $FB57      8
    .byte $00 ; |        | $FB58      9
    .byte $C0 ; |XX      | $FB59     10
    .byte $F0 ; |XXXX    | $FB5A     11
    .byte $E0 ; |XXX     | $FB5B     12
    .byte $C0 ; |XX      | $FB5C     13
    .byte $C0 ; |XX      | $FB5D     14
    .byte $FC ; |XXXXXX  | $FB5E     15
    .byte $FF ; |XXXXXXXX| $FB5F     16
;Level 11
    .byte $FF ; |XXXXXXXX| $FB60   screen 1
    .byte $FF ; |XXXXXXXX| $FB61      2
    .byte $9F ; |X  XXXXX| $FB62      3
    .byte $FF ; |XXXXXXXX| $FB63      4
    .byte $9E ; |X  XXXX | $FB64      5
    .byte $9F ; |X  XXXXX| $FB65      6
    .byte $FF ; |XXXXXXXX| $FB66      7
    .byte $00 ; |        | $FB67      8
    .byte $00 ; |        | $FB68      9
    .byte $FF ; |XXXXXXXX| $FB69     10
    .byte $C0 ; |XX      | $FB6A     11
    .byte $F0 ; |XXXX    | $FB6B     12
    .byte $C0 ; |XX      | $FB6C     13
    .byte $FF ; |XXXXXXXX| $FB6D     14
    .byte $C0 ; |XX      | $FB6E     15
    .byte $FF ; |XXXXXXXX| $FB6F     16
;Level 12
    .byte $FF ; |XXXXXXXX| $FB70   screen 1
    .byte $E7 ; |XXX  XXX| $FB71      2
    .byte $FF ; |XXXXXXXX| $FB72      3
    .byte $FC ; |XXXXXX  | $FB73      4
    .byte $FF ; |XXXXXXXX| $FB74      5
    .byte $00 ; |        | $FB75      6
    .byte $C0 ; |XX      | $FB76      7
    .byte $FF ; |XXXXXXXX| $FB77      8
    .byte $FF ; |XXXXXXXX| $FB78      9
    .byte $FF ; |XXXXXXXX| $FB79     10
    .byte $C0 ; |XX      | $FB7A     11
    .byte $00 ; |        | $FB7B     12
    .byte $FF ; |XXXXXXXX| $FB7C     13
    .byte $00 ; |        | $FB7D     14
    .byte $C0 ; |XX      | $FB7E     15
    .byte $FF ; |XXXXXXXX| $FB7F     16
;Level 13
    .byte $FF ; |XXXXXXXX| $FB80   screen 1
    .byte $9E ; |X  XXXX | $FB81      2
    .byte $0F ; |    XXXX| $FB82      3
    .byte $FC ; |XXXXXX  | $FB83      4
    .byte $03 ; |      XX| $FB84      5
    .byte $0F ; |    XXXX| $FB85      6
    .byte $FF ; |XXXXXXXX| $FB86      7
    .byte $FF ; |XXXXXXXX| $FB87      8
    .byte $FE ; |XXXXXXX | $FB88      9
    .byte $FF ; |XXXXXXXX| $FB89     10
    .byte $FF ; |XXXXXXXX| $FB8A     11
    .byte $C0 ; |XX      | $FB8B     12
    .byte $C0 ; |XX      | $FB8C     13
    .byte $C0 ; |XX      | $FB8D     14
    .byte $FF ; |XXXXXXXX| $FB8E     15
    .byte $FF ; |XXXXXXXX| $FB8F     16
;Level 14
    .byte $FF ; |XXXXXXXX| $FB90   screen 1
    .byte $FF ; |XXXXXXXX| $FB91      2
    .byte $FF ; |XXXXXXXX| $FB92      3
    .byte $FF ; |XXXXXXXX| $FB93      4
    .byte $C3 ; |XX    XX| $FB94      5
    .byte $FF ; |XXXXXXXX| $FB95      6
    .byte $81 ; |X      X| $FB96      7
    .byte $FF ; |XXXXXXXX| $FB97      8
    .byte $C0 ; |XX      | $FB98      9
    .byte $FF ; |XXXXXXXX| $FB99     10
    .byte $80 ; |X       | $FB9A     11
    .byte $C0 ; |XX      | $FB9B     12
    .byte $C0 ; |XX      | $FB9C     13
    .byte $C0 ; |XX      | $FB9D     14
    .byte $C0 ; |XX      | $FB9E     15
    .byte $FF ; |XXXXXXXX| $FB9F     16
;Level 15
    .byte $FF ; |XXXXXXXX| $FBA0   screen 1
    .byte $FF ; |XXXXXXXX| $FBA1      2
    .byte $FF ; |XXXXXXXX| $FBA2      3
    .byte $F3 ; |XXXX  XX| $FBA3      4
    .byte $FF ; |XXXXXXXX| $FBA4      5
    .byte $CF ; |XX  XXXX| $FBA5      6
    .byte $C0 ; |XX      | $FBA6      7
    .byte $CF ; |XX  XXXX| $FBA7      8
    .byte $CF ; |XX  XXXX| $FBA8      9
    .byte $FF ; |XXXXXXXX| $FBA9     10
    .byte $FC ; |XXXXXX  | $FBAA     11
    .byte $00 ; |        | $FBAB     12
    .byte $00 ; |        | $FBAC     13
    .byte $C0 ; |XX      | $FBAD     14
    .byte $FF ; |XXXXXXXX| $FBAE     15
    .byte $FF ; |XXXXXXXX| $FBAF     16
;Level 16
    .byte $CF ; |XX  XXXX| $FBB0   screen 1
    .byte $FF ; |XXXXXXXX| $FBB1      2
    .byte $F0 ; |XXXX    | $FBB2      3
    .byte $FF ; |XXXXXXXX| $FBB3      4
    .byte $9F ; |X  XXXXX| $FBB4      5
    .byte $FF ; |XXXXXXXX| $FBB5      6
    .byte $00 ; |        | $FBB6      7
    .byte $00 ; |        | $FBB7      8
    .byte $00 ; |        | $FBB8      9
    .byte $F0 ; |XXXX    | $FBB9     10
    .byte $C0 ; |XX      | $FBBA     11
    .byte $C0 ; |XX      | $FBBB     12
    .byte $E0 ; |XXX     | $FBBC     13
    .byte $C0 ; |XX      | $FBBD     14
    .byte $F0 ; |XXXX    | $FBBE     15
    .byte $FF ; |XXXXXXXX| $FBBF     16
;Level 17
    .byte $FF ; |XXXXXXXX| $FBC0   screen 1
    .byte $00 ; |        | $FBC1      2
    .byte $F0 ; |XXXX    | $FBC2      3
    .byte $00 ; |        | $FBC3      4
    .byte $FF ; |XXXXXXXX| $FBC4      5
    .byte $FF ; |XXXXXXXX| $FBC5      6
    .byte $CF ; |XX  XXXX| $FBC6      7
    .byte $FF ; |XXXXXXXX| $FBC7      8
    .byte $C0 ; |XX      | $FBC8      9
    .byte $FF ; |XXXXXXXX| $FBC9     10
    .byte $C7 ; |XX   XXX| $FBCA     11
    .byte $E0 ; |XXX     | $FBCB     12
    .byte $E0 ; |XXX     | $FBCC     13
    .byte $E0 ; |XXX     | $FBCD     14
    .byte $C0 ; |XX      | $FBCE     15
    .byte $F8 ; |XXXXX   | $FBCF     16
;Level 18
    .byte $FF ; |XXXXXXXX| $FBD0   screen 1
    .byte $CC ; |XX  XX  | $FBD1      2
    .byte $E0 ; |XXX     | $FBD2      3
    .byte $FF ; |XXXXXXXX| $FBD3      4
    .byte $CF ; |XX  XXXX| $FBD4      5
    .byte $FF ; |XXXXXXXX| $FBD5      6
    .byte $F0 ; |XXXX    | $FBD6      7
    .byte $FF ; |XXXXXXXX| $FBD7      8
    .byte $FF ; |XXXXXXXX| $FBD8      9
    .byte $9F ; |X  XXXXX| $FBD9     10
    .byte $FF ; |XXXXXXXX| $FBDA     11
    .byte $E0 ; |XXX     | $FBDB     12
    .byte $C0 ; |XX      | $FBDC     13
    .byte $E0 ; |XXX     | $FBDD     14
    .byte $FF ; |XXXXXXXX| $FBDE     15
    .byte $FC ; |XXXXXX  | $FBDF     16
;Level 19
    .byte $FF ; |XXXXXXXX| $FBE0   screen 1
    .byte $FC ; |XXXXXX  | $FBE1      2
    .byte $FF ; |XXXXXXXX| $FBE2      3
    .byte $01 ; |       X| $FBE3      4
    .byte $07 ; |     XXX| $FBE4      5
    .byte $FF ; |XXXXXXXX| $FBE5      6
    .byte $FF ; |XXXXXXXX| $FBE6      7
    .byte $FE ; |XXXXXXX | $FBE7      8
    .byte $00 ; |        | $FBE8      9
    .byte $F0 ; |XXXX    | $FBE9     10
    .byte $80 ; |X       | $FBEA     11
    .byte $E0 ; |XXX     | $FBEB     12
    .byte $C0 ; |XX      | $FBEC     13
    .byte $F0 ; |XXXX    | $FBED     14
    .byte $E0 ; |XXX     | $FBEE     15
    .byte $FF ; |XXXXXXXX| $FBEF     16
;Level 20
    .byte $FF ; |XXXXXXXX| $FBF0   screen 1
    .byte $C0 ; |XX      | $FBF1      2
    .byte $00 ; |        | $FBF2      3
    .byte $00 ; |        | $FBF3      4
    .byte $00 ; |        | $FBF4      5
    .byte $C0 ; |XX      | $FBF5      6
    .byte $FC ; |XXXXXX  | $FBF6      7
    .byte $C0 ; |XX      | $FBF7      8
    .byte $F0 ; |XXXX    | $FBF8      9
    .byte $80 ; |X       | $FBF9     10
    .byte $80 ; |X       | $FBFA     11
    .byte $C0 ; |XX      | $FBFB     12
    .byte $E0 ; |XXX     | $FBFC     13
    .byte $F0 ; |XXXX    | $FBFD     14
    .byte $E0 ; |XXX     | $FBFE     15
    .byte $FF ; |XXXXXXXX| $FBFF     16

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      Middle Section PF2 shapes
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFC00:

;Level 1
    .byte $00 ; |        | $FC00   screen 1               Middle Section PF2 shapes
    .byte $00 ; |        | $FC01      2
;Level 2
    .byte $00 ; |        | $FC02   screen 1
    .byte $00 ; |        | $FC03      2
    .byte $F0 ; |XXXX    | $FC04      3
    .byte $00 ; |        | $FC05      4
;Level 3
    .byte $00 ; |        | $FC06   screen 1
    .byte $00 ; |        | $FC07      2
    .byte $00 ; |        | $FC08      3
    .byte $00 ; |        | $FC09      4
    .byte $00 ; |        | $FC0A      5
    .byte $00 ; |        | $FC0B      6
;Level 4
    .byte $00 ; |        | $FC0C   screen 1
    .byte $00 ; |        | $FC0D      2
    .byte $FF ; |XXXXXXXX| $FC0E      3
    .byte $FF ; |XXXXXXXX| $FC0F      4
    .byte $00 ; |        | $FC10      5
    .byte $00 ; |        | $FC11      6
    .byte $00 ; |        | $FC12      7
    .byte $C0 ; |XX      | $FC13      8
;Level 5
    .byte $00 ; |        | $FC14   screen 1
    .byte $00 ; |        | $FC15      2
    .byte $00 ; |        | $FC16      3
    .byte $00 ; |        | $FC17      4
    .byte $00 ; |        | $FC18      5
    .byte $00 ; |        | $FC19      6
    .byte $00 ; |        | $FC1A      7
    .byte $00 ; |        | $FC1B      8
;Level 6
    .byte $00 ; |        | $FC1C   screen 1
    .byte $00 ; |        | $FC1D      2
    .byte $00 ; |        | $FC1E      3
    .byte $00 ; |        | $FC1F      4
    .byte $00 ; |        | $FC20      5
    .byte $FE ; |XXXXXXX | $FC21      6
    .byte $00 ; |        | $FC22      7
    .byte $00 ; |        | $FC23      8
    .byte $00 ; |        | $FC24      9
    .byte $00 ; |        | $FC25     10
;Level 7
    .byte $00 ; |        | $FC26   screen 1
    .byte $00 ; |        | $FC27      2
    .byte $00 ; |        | $FC28      3
    .byte $00 ; |        | $FC29      4
    .byte $F0 ; |XXXX    | $FC2A      5
    .byte $00 ; |        | $FC2B      6
    .byte $FC ; |XXXXXX  | $FC2C      7
    .byte $00 ; |        | $FC2D      8
    .byte $00 ; |        | $FC2E      9
    .byte $00 ; |        | $FC2F     10
    .byte $00 ; |        | $FC30     11
    .byte $00 ; |        | $FC31     12
;Level 8
    .byte $00 ; |        | $FC32   screen 1
    .byte $00 ; |        | $FC33      2
    .byte $1F ; |   XXXXX| $FC34      3
    .byte $00 ; |        | $FC35      4
    .byte $F8 ; |XXXXX   | $FC36      5
    .byte $00 ; |        | $FC37      6
    .byte $00 ; |        | $FC38      7
    .byte $F0 ; |XXXX    | $FC39      8
    .byte $C0 ; |XX      | $FC3A      9
    .byte $FF ; |XXXXXXXX| $FC3B     10
    .byte $00 ; |        | $FC3C     11
    .byte $FC ; |XXXXXX  | $FC3D     12
    .byte $00 ; |        | $FC3E     13
    .byte $00 ; |        | $FC3F     14
;Level 9
    .byte $00 ; |        | $FC40   screen 1
    .byte $00 ; |        | $FC41      2
    .byte $FF ; |XXXXXXXX| $FC42      3
    .byte $FF ; |XXXXXXXX| $FC43      4
    .byte $FC ; |XXXXXX  | $FC44      5
    .byte $F1 ; |XXXX   X| $FC45      6
    .byte $01 ; |       X| $FC46      7
    .byte $00 ; |        | $FC47      8
    .byte $00 ; |        | $FC48      9
    .byte $1F ; |   XXXXX| $FC49     10
    .byte $00 ; |        | $FC4A     11
    .byte $00 ; |        | $FC4B     12
    .byte $00 ; |        | $FC4C     13
    .byte $F0 ; |XXXX    | $FC4D     14
    .byte $FF ; |XXXXXXXX| $FC4E     15
    .byte $00 ; |        | $FC4F     16
;Level 10
    .byte $00 ; |        | $FC50   screen 1
    .byte $00 ; |        | $FC51      2
    .byte $00 ; |        | $FC52      3
    .byte $00 ; |        | $FC53      4
    .byte $FC ; |XXXXXX  | $FC54      5
    .byte $FF ; |XXXXXXXX| $FC55      6
    .byte $00 ; |        | $FC56      7
    .byte $7F ; | XXXXXXX| $FC57      8
    .byte $3F ; |  XXXXXX| $FC58      9
    .byte $0F ; |    XXXX| $FC59     10
    .byte $FF ; |XXXXXXXX| $FC5A     11
    .byte $00 ; |        | $FC5B     12
    .byte $00 ; |        | $FC5C     13
    .byte $C0 ; |XX      | $FC5D     14
    .byte $00 ; |        | $FC5E     15
    .byte $00 ; |        | $FC5F     16
;Level 11
    .byte $00 ; |        | $FC60   screen 1
    .byte $3F ; |  XXXXXX| $FC61      2
    .byte $C0 ; |XX      | $FC62      3
    .byte $00 ; |        | $FC63      4
    .byte $1C ; |   XXX  | $FC64      5
    .byte $00 ; |        | $FC65      6
    .byte $00 ; |        | $FC66      7
    .byte $3F ; |  XXXXXX| $FC67      8
    .byte $C3 ; |XX    XX| $FC68      9
    .byte $3F ; |  XXXXXX| $FC69     10
    .byte $C3 ; |XX    XX| $FC6A     11
    .byte $00 ; |        | $FC6B     12
    .byte $C0 ; |XX      | $FC6C     13
    .byte $00 ; |        | $FC6D     14
    .byte $00 ; |        | $FC6E     15
    .byte $00 ; |        | $FC6F     16
;Level 12
    .byte $00 ; |        | $FC70   screen 1
    .byte $00 ; |        | $FC71      2
    .byte $00 ; |        | $FC72      3
    .byte $00 ; |        | $FC73      4
    .byte $00 ; |        | $FC74      5
    .byte $00 ; |        | $FC75      6
    .byte $FF ; |XXXXXXXX| $FC76      7
    .byte $00 ; |        | $FC77      8
    .byte $F8 ; |XXXXX   | $FC78      9
    .byte $FC ; |XXXXXX  | $FC79     10
    .byte $C0 ; |XX      | $FC7A     11
    .byte $00 ; |        | $FC7B     12
    .byte $C0 ; |XX      | $FC7C     13
    .byte $00 ; |        | $FC7D     14
    .byte $C0 ; |XX      | $FC7E     15
    .byte $00 ; |        | $FC7F     16
;Level 13
    .byte $00 ; |        | $FC80   screen 1
    .byte $1C ; |   XXX  | $FC81      2
    .byte $00 ; |        | $FC82      3
    .byte $00 ; |        | $FC83      4
    .byte $00 ; |        | $FC84      5
    .byte $FF ; |XXXXXXXX| $FC85      6
    .byte $FF ; |XXXXXXXX| $FC86      7
    .byte $00 ; |        | $FC87      8
    .byte $00 ; |        | $FC88      9
    .byte $00 ; |        | $FC89     10
    .byte $00 ; |        | $FC8A     11
    .byte $00 ; |        | $FC8B     12
    .byte $E0 ; |XXX     | $FC8C     13
    .byte $00 ; |        | $FC8D     14
    .byte $00 ; |        | $FC8E     15
    .byte $00 ; |        | $FC8F     16
;Level 14
    .byte $00 ; |        | $FC90   screen 1
    .byte $00 ; |        | $FC91      2
    .byte $00 ; |        | $FC92      3
    .byte $00 ; |        | $FC93      4
    .byte $00 ; |        | $FC94      5
    .byte $7F ; | XXXXXXX| $FC95      6
    .byte $FF ; |XXXXXXXX| $FC96      7
    .byte $00 ; |        | $FC97      8
    .byte $00 ; |        | $FC98      9
    .byte $00 ; |        | $FC99     10
    .byte $03 ; |      XX| $FC9A     11
    .byte $00 ; |        | $FC9B     12
    .byte $E0 ; |XXX     | $FC9C     13
    .byte $00 ; |        | $FC9D     14
    .byte $00 ; |        | $FC9E     15
    .byte $00 ; |        | $FC9F     16
;Level 15
    .byte $00 ; |        | $FCA0   screen 1
    .byte $00 ; |        | $FCA1      2
    .byte $F0 ; |XXXX    | $FCA2      3
    .byte $00 ; |        | $FCA3      4
    .byte $00 ; |        | $FCA4      5
    .byte $00 ; |        | $FCA5      6
    .byte $F0 ; |XXXX    | $FCA6      7
    .byte $00 ; |        | $FCA7      8
    .byte $00 ; |        | $FCA8      9
    .byte $7F ; | XXXXXXX| $FCA9     10
    .byte $FF ; |XXXXXXXX| $FCAA     11
    .byte $00 ; |        | $FCAB     12
    .byte $03 ; |      XX| $FCAC     13
    .byte $FF ; |XXXXXXXX| $FCAD     14
    .byte $00 ; |        | $FCAE     15
    .byte $00 ; |        | $FCAF     16
;Level 16
    .byte $00 ; |        | $FCB0   screen 1
    .byte $F0 ; |XXXX    | $FCB1      2
    .byte $E0 ; |XXX     | $FCB2      3
    .byte $03 ; |      XX| $FCB3      4
    .byte $C0 ; |XX      | $FCB4      5
    .byte $E0 ; |XXX     | $FCB5      6
    .byte $F3 ; |XXXX  XX| $FCB6      7
    .byte $7F ; | XXXXXXX| $FCB7      8
    .byte $7C ; | XXXXX  | $FCB8      9
    .byte $7F ; | XXXXXXX| $FCB9     10
    .byte $C0 ; |XX      | $FCBA     11
    .byte $FF ; |XXXXXXXX| $FCBB     12
    .byte $00 ; |        | $FCBC     13
    .byte $FF ; |XXXXXXXX| $FCBD     14
    .byte $00 ; |        | $FCBE     15
    .byte $C0 ; |XX      | $FCBF     16
;Level 17
    .byte $00 ; |        | $FCC0   screen 1
    .byte $00 ; |        | $FCC1      2
    .byte $FF ; |XXXXXXXX| $FCC2      3
    .byte $00 ; |        | $FCC3      4
    .byte $03 ; |      XX| $FCC4      5
    .byte $03 ; |      XX| $FCC5      6
    .byte $00 ; |        | $FCC6      7
    .byte $00 ; |        | $FCC7      8
    .byte $00 ; |        | $FCC8      9
    .byte $7F ; | XXXXXXX| $FCC9     10
    .byte $00 ; |        | $FCCA     11
    .byte $FF ; |XXXXXXXX| $FCCB     12
    .byte $00 ; |        | $FCCC     13
    .byte $00 ; |        | $FCCD     14
    .byte $FF ; |XXXXXXXX| $FCCE     15
    .byte $00 ; |        | $FCCF     16
;Level 18
    .byte $00 ; |        | $FCD0   screen 1
    .byte $00 ; |        | $FCD1      2
    .byte $FF ; |XXXXXXXX| $FCD2      3
    .byte $00 ; |        | $FCD3      4
    .byte $00 ; |        | $FCD4      5
    .byte $00 ; |        | $FCD5      6
    .byte $00 ; |        | $FCD6      7
    .byte $00 ; |        | $FCD7      8
    .byte $7F ; | XXXXXXX| $FCD8      9
    .byte $1C ; |   XXX  | $FCD9     10
    .byte $00 ; |        | $FCDA     11
    .byte $FF ; |XXXXXXXX| $FCDB     12
    .byte $FF ; |XXXXXXXX| $FCDC     13
    .byte $00 ; |        | $FCDD     14
    .byte $00 ; |        | $FCDE     15
    .byte $C0 ; |XX      | $FCDF     16
;Level 19
    .byte $00 ; |        | $FCE0   screen 1
    .byte $00 ; |        | $FCE1      2
    .byte $E0 ; |XXX     | $FCE2      3
    .byte $00 ; |        | $FCE3      4
    .byte $FC ; |XXXXXX  | $FCE4      5
    .byte $00 ; |        | $FCE5      6
    .byte $7F ; | XXXXXXX| $FCE6      7
    .byte $C0 ; |XX      | $FCE7      8
    .byte $3F ; |  XXXXXX| $FCE8      9
    .byte $CF ; |XX  XXXX| $FCE9     10
    .byte $1F ; |   XXXXX| $FCEA     11
    .byte $FC ; |XXXXXX  | $FCEB     12
    .byte $FF ; |XXXXXXXX| $FCEC     13
    .byte $00 ; |        | $FCED     14
    .byte $C0 ; |XX      | $FCEE     15
    .byte $C0 ; |XX      | $FCEF     16
;Level 20
    .byte $00 ; |        | $FCF0   screen 1
    .byte $00 ; |        | $FCF1      2
    .byte $FF ; |XXXXXXXX| $FCF2      3
    .byte $FF ; |XXXXXXXX| $FCF3      4
    .byte $03 ; |      XX| $FCF4      5
    .byte $7F ; | XXXXXXX| $FCF5      6
    .byte $FF ; |XXXXXXXX| $FCF6      7
    .byte $FC ; |XXXXXX  | $FCF7      8
    .byte $FC ; |XXXXXX  | $FCF8      9
    .byte $FC ; |XXXXXX  | $FCF9     10
    .byte $FF ; |XXXXXXXX| $FCFA     11
    .byte $FF ; |XXXXXXXX| $FCFB     12
    .byte $C0 ; |XX      | $FCFC     13
    .byte $F0 ; |XXXX    | $FCFD     14
    .byte $C0 ; |XX      | $FCFE     15
LFCFF:
    .byte $C0 ; |XX      | $FCFF     16                   Top section level 1??

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      Bottom, Top Section PF2 shapes
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; ** levels here are shown by the "bottom sections", the "top sections" are offsetted by -1 byte.**
;
; The top section uses the previous screen's bottom section. That way all the drop holes match up.
; you wouldn't want to drop into a solid ceiling, would you?

LFD00:

;Level 1
    .byte $3F ; |  XXXXXX| $FD00   screen 1
    .byte $FF ; |XXXXXXXX| $FD01      2
;Level 2
    .byte $3F ; |  XXXXXX| $FD02   screen 1
    .byte $FF ; |XXXXXXXX| $FD03      2
    .byte $03 ; |      XX| $FD04      3
    .byte $FF ; |XXXXXXXX| $FD05      4
;Level 3
    .byte $3F ; |  XXXXXX| $FD06   screen 1
    .byte $00 ; |        | $FD07      2
    .byte $FC ; |XXXXXX  | $FD08      3
    .byte $FF ; |XXXXXXXX| $FD09      4
    .byte $3F ; |  XXXXXX| $FD0A      5
    .byte $FF ; |XXXXXXXX| $FD0B      6
;Level 4
    .byte $3F ; |  XXXXXX| $FD0C   screen 1
    .byte $FF ; |XXXXXXXX| $FD0D      2
    .byte $FF ; |XXXXXXXX| $FD0E      3
    .byte $FF ; |XXXXXXXX| $FD0F      4
    .byte $3F ; |  XXXXXX| $FD10      5
    .byte $FF ; |XXXXXXXX| $FD11      6
    .byte $07 ; |     XXX| $FD12      7
    .byte $FF ; |XXXXXXXX| $FD13      8
;Level 5
    .byte $3F ; |  XXXXXX| $FD14   screen 1
    .byte $FF ; |XXXXXXXX| $FD15      2
    .byte $00 ; |        | $FD16      3
    .byte $7F ; | XXXXXXX| $FD17      4
    .byte $FF ; |XXXXXXXX| $FD18      5
    .byte $3F ; |  XXXXXX| $FD19      6
    .byte $FF ; |XXXXXXXX| $FD1A      7
    .byte $FF ; |XXXXXXXX| $FD1B      8
;Level 6
    .byte $3F ; |  XXXXXX| $FD1C   screen 1
    .byte $FC ; |XXXXXX  | $FD1D      2
    .byte $3F ; |  XXXXXX| $FD1E      3
    .byte $F3 ; |XXXX  XX| $FD1F      4
    .byte $F9 ; |XXXXX  X| $FD20      5
    .byte $00 ; |        | $FD21      6
    .byte $FF ; |XXXXXXXX| $FD22      7
    .byte $FC ; |XXXXXX  | $FD23      8
    .byte $3F ; |  XXXXXX| $FD24      9
    .byte $FF ; |XXXXXXXX| $FD25     10
;Level 7
    .byte $3F ; |  XXXXXX| $FD26   screen 1
    .byte $FF ; |XXXXXXXX| $FD27      2
    .byte $7F ; | XXXXXXX| $FD28      3
    .byte $F9 ; |XXXXX  X| $FD29      4
    .byte $FF ; |XXXXXXXX| $FD2A      5
    .byte $FF ; |XXXXXXXX| $FD2B      6
    .byte $FF ; |XXXXXXXX| $FD2C      7
    .byte $3F ; |  XXXXXX| $FD2D      8
    .byte $FF ; |XXXXXXXX| $FD2E      9
    .byte $CF ; |XX  XXXX| $FD2F     10
    .byte $00 ; |        | $FD30     11
    .byte $FF ; |XXXXXXXX| $FD31     12
;Level 8
    .byte $3F ; |  XXXXXX| $FD32   screen 1
    .byte $00 ; |        | $FD33      2
    .byte $3F ; |  XXXXXX| $FD34      3
    .byte $FC ; |XXXXXX  | $FD35      4
    .byte $FE ; |XXXXXXX | $FD36      5
    .byte $3F ; |  XXXXXX| $FD37      6
    .byte $FF ; |XXXXXXXX| $FD38      7
    .byte $FC ; |XXXXXX  | $FD39      8
    .byte $FC ; |XXXXXX  | $FD3A      9
    .byte $F0 ; |XXXX    | $FD3B     10
    .byte $00 ; |        | $FD3C     11
    .byte $00 ; |        | $FD3D     12
    .byte $C0 ; |XX      | $FD3E     13
    .byte $FF ; |XXXXXXXX| $FD3F     14
;Level 9
    .byte $3F ; |  XXXXXX| $FD40   screen 1
    .byte $FF ; |XXXXXXXX| $FD41      2
    .byte $00 ; |        | $FD42      3
    .byte $00 ; |        | $FD43      4
    .byte $00 ; |        | $FD44      5
    .byte $00 ; |        | $FD45      6
    .byte $C3 ; |XX    XX| $FD46      7
    .byte $FF ; |XXXXXXXX| $FD47      8
    .byte $3F ; |  XXXXXX| $FD48      9
    .byte $00 ; |        | $FD49     10
    .byte $00 ; |        | $FD4A     11
    .byte $00 ; |        | $FD4B     12
    .byte $C0 ; |XX      | $FD4C     13
    .byte $00 ; |        | $FD4D     14
    .byte $00 ; |        | $FD4E     15
    .byte $FF ; |XXXXXXXX| $FD4F     16
;Level 10
    .byte $3F ; |  XXXXXX| $FD50   screen 1
    .byte $FF ; |XXXXXXXX| $FD51      2
    .byte $7F ; | XXXXXXX| $FD52      3
    .byte $7F ; | XXXXXXX| $FD53      4
    .byte $FF ; |XXXXXXXX| $FD54      5
    .byte $FF ; |XXXXXXXX| $FD55      6
    .byte $3F ; |  XXXXXX| $FD56      7
    .byte $00 ; |        | $FD57      8
    .byte $00 ; |        | $FD58      9
    .byte $00 ; |        | $FD59     10
    .byte $00 ; |        | $FD5A     11
    .byte $00 ; |        | $FD5B     12
    .byte $C0 ; |XX      | $FD5C     13
    .byte $00 ; |        | $FD5D     14
    .byte $C0 ; |XX      | $FD5E     15
    .byte $FF ; |XXXXXXXX| $FD5F     16
;Level 11
    .byte $3F ; |  XXXXXX| $FD60   screen 1
    .byte $00 ; |        | $FD61      2
    .byte $FF ; |XXXXXXXX| $FD62      3
    .byte $3F ; |  XXXXXX| $FD63      4
    .byte $7E ; | XXXXXX | $FD64      5
    .byte $FF ; |XXXXXXXX| $FD65      6
    .byte $00 ; |        | $FD66      7
    .byte $00 ; |        | $FD67      8
    .byte $00 ; |        | $FD68      9
    .byte $00 ; |        | $FD69     10
    .byte $E0 ; |XXX     | $FD6A     11
    .byte $C0 ; |XX      | $FD6B     12
    .byte $00 ; |        | $FD6C     13
    .byte $F0 ; |XXXX    | $FD6D     14
    .byte $FF ; |XXXXXXXX| $FD6E     15
    .byte $FF ; |XXXXXXXX| $FD6F     16
;Level 12
    .byte $3F ; |  XXXXXX| $FD70   screen 1
    .byte $FF ; |XXXXXXXX| $FD71      2
    .byte $FF ; |XXXXXXXX| $FD72      3
    .byte $FF ; |XXXXXXXX| $FD73      4
    .byte $3F ; |  XXXXXX| $FD74      5
    .byte $FF ; |XXXXXXXX| $FD75      6
    .byte $00 ; |        | $FD76      7
    .byte $FF ; |XXXXXXXX| $FD77      8
    .byte $00 ; |        | $FD78      9
    .byte $00 ; |        | $FD79     10
    .byte $E0 ; |XXX     | $FD7A     11
    .byte $E0 ; |XXX     | $FD7B     12
    .byte $00 ; |        | $FD7C     13
    .byte $C0 ; |XX      | $FD7D     14
    .byte $00 ; |        | $FD7E     15
    .byte $00 ; |        | $FD7F     16
;Level 13
    .byte $3F ; |  XXXXXX| $FD80   screen 1
    .byte $3E ; |  XXXXX | $FD81      2
    .byte $FF ; |XXXXXXXX| $FD82      3
    .byte $FF ; |XXXXXXXX| $FD83      4
    .byte $FF ; |XXXXXXXX| $FD84      5
    .byte $FF ; |XXXXXXXX| $FD85      6
    .byte $FF ; |XXXXXXXX| $FD86      7
    .byte $3F ; |  XXXXXX| $FD87      8
    .byte $FE ; |XXXXXXX | $FD88      9
    .byte $FF ; |XXXXXXXX| $FD89     10
    .byte $FF ; |XXXXXXXX| $FD8A     11
    .byte $E0 ; |XXX     | $FD8B     12
    .byte $00 ; |        | $FD8C     13
    .byte $C0 ; |XX      | $FD8D     14
    .byte $F0 ; |XXXX    | $FD8E     15
    .byte $00 ; |        | $FD8F     16
;Level 14
    .byte $3F ; |  XXXXXX| $FD90   screen 1
    .byte $FF ; |XXXXXXXX| $FD91      2
    .byte $3F ; |  XXXXXX| $FD92      3
    .byte $FF ; |XXXXXXXX| $FD93      4
    .byte $3F ; |  XXXXXX| $FD94      5
    .byte $00 ; |        | $FD95      6
    .byte $FF ; |XXXXXXXX| $FD96      7
    .byte $FF ; |XXXXXXXX| $FD97      8
    .byte $FE ; |XXXXXXX | $FD98      9
    .byte $7F ; | XXXXXXX| $FD99     10
    .byte $00 ; |        | $FD9A     11
    .byte $E0 ; |XXX     | $FD9B     12
    .byte $00 ; |        | $FD9C     13
    .byte $C0 ; |XX      | $FD9D     14
    .byte $0F ; |    XXXX| $FD9E     15
    .byte $C0 ; |XX      | $FD9F     16
;Level 15
    .byte $3F ; |  XXXXXX| $FDA0   screen 1
    .byte $FC ; |XXXXXX  | $FDA1      2
    .byte $03 ; |      XX| $FDA2      3
    .byte $FF ; |XXXXXXXX| $FDA3      4
    .byte $0F ; |    XXXX| $FDA4      5
    .byte $7F ; | XXXXXXX| $FDA5      6
    .byte $FF ; |XXXXXXXX| $FDA6      7
    .byte $FF ; |XXXXXXXX| $FDA7      8
    .byte $7F ; | XXXXXXX| $FDA8      9
    .byte $3F ; |  XXXXXX| $FDA9     10
    .byte $00 ; |        | $FDAA     11
    .byte $C0 ; |XX      | $FDAB     12
    .byte $F0 ; |XXXX    | $FDAC     13
    .byte $00 ; |        | $FDAD     14
    .byte $FF ; |XXXXXXXX| $FDAE     15
    .byte $F8 ; |XXXXX   | $FDAF     16
;Level 16
    .byte $3F ; |  XXXXXX| $FDB0   screen 1
    .byte $FF ; |XXXXXXXX| $FDB1      2
    .byte $00 ; |        | $FDB2      3
    .byte $00 ; |        | $FDB3      4
    .byte $FF ; |XXXXXXXX| $FDB4      5
    .byte $01 ; |       X| $FDB5      6
    .byte $00 ; |        | $FDB6      7
    .byte $00 ; |        | $FDB7      8
    .byte $00 ; |        | $FDB8      9
    .byte $00 ; |        | $FDB9     10
    .byte $00 ; |        | $FDBA     11
    .byte $00 ; |        | $FDBB     12
    .byte $C0 ; |XX      | $FDBC     13
    .byte $00 ; |        | $FDBD     14
    .byte $E0 ; |XXX     | $FDBE     15
    .byte $00 ; |        | $FDBF     16
;Level 17
    .byte $3F ; |  XXXXXX| $FDC0   screen 1
    .byte $FF ; |XXXXXXXX| $FDC1      2
    .byte $00 ; |        | $FDC2      3
    .byte $00 ; |        | $FDC3      4
    .byte $00 ; |        | $FDC4      5
    .byte $7F ; | XXXXXXX| $FDC5      6
    .byte $FF ; |XXXXXXXX| $FDC6      7
    .byte $FF ; |XXXXXXXX| $FDC7      8
    .byte $00 ; |        | $FDC8      9
    .byte $01 ; |       X| $FDC9     10
    .byte $FF ; |XXXXXXXX| $FDCA     11
    .byte $00 ; |        | $FDCB     12
    .byte $C0 ; |XX      | $FDCC     13
    .byte $C0 ; |XX      | $FDCD     14
    .byte $00 ; |        | $FDCE     15
    .byte $00 ; |        | $FDCF     16
;Level 18
    .byte $3F ; |  XXXXXX| $FDD0   screen 1
    .byte $FF ; |XXXXXXXX| $FDD1      2
    .byte $FF ; |XXXXXXXX| $FDD2      3
    .byte $3F ; |  XXXXXX| $FDD3      4
    .byte $FF ; |XXXXXXXX| $FDD4      5
    .byte $FF ; |XXXXXXXX| $FDD5      6
    .byte $E0 ; |XXX     | $FDD6      7
    .byte $7F ; | XXXXXXX| $FDD7      8
    .byte $7F ; | XXXXXXX| $FDD8      9
    .byte $7C ; | XXXXX  | $FDD9     10
    .byte $FF ; |XXXXXXXX| $FDDA     11
    .byte $00 ; |        | $FDDB     12
    .byte $00 ; |        | $FDDC     13
    .byte $C0 ; |XX      | $FDDD     14
    .byte $00 ; |        | $FDDE     15
    .byte $00 ; |        | $FDDF     16
;Level 19
    .byte $7F ; | XXXXXXX| $FDE0   screen 1
    .byte $FF ; |XXXXXXXX| $FDE1      2
    .byte $07 ; |     XXX| $FDE2      3
    .byte $FF ; |XXXXXXXX| $FDE3      4
    .byte $FF ; |XXXXXXXX| $FDE4      5
    .byte $7F ; | XXXXXXX| $FDE5      6
    .byte $00 ; |        | $FDE6      7
    .byte $00 ; |        | $FDE7      8
    .byte $00 ; |        | $FDE8      9
    .byte $00 ; |        | $FDE9     10
    .byte $00 ; |        | $FDEA     11
    .byte $00 ; |        | $FDEB     12
    .byte $00 ; |        | $FDEC     13
    .byte $C0 ; |XX      | $FDED     14
    .byte $00 ; |        | $FDEE     15
    .byte $00 ; |        | $FDEF     16
;Level 20
    .byte $7F ; | XXXXXXX| $FDF0   screen 1
    .byte $FF ; |XXXXXXXX| $FDF1      2
    .byte $00 ; |        | $FDF2      3
    .byte $00 ; |        | $FDF3      4
    .byte $00 ; |        | $FDF4      5
    .byte $00 ; |        | $FDF5      6
    .byte $00 ; |        | $FDF6      7
    .byte $F0 ; |XXXX    | $FDF7      8
    .byte $F0 ; |XXXX    | $FDF8      9
    .byte $F0 ; |XXXX    | $FDF9     10
    .byte $00 ; |        | $FDFA     11
    .byte $00 ; |        | $FDFB     12
    .byte $00 ; |        | $FDFC     13
    .byte $00 ; |        | $FDFD     14
    .byte $00 ; |        | $FDFE     15
    .byte $00 ; |        | $FDFF     16

LFE00:
    .byte $00 ; |        | $FE00  something to do with lava
    .byte $08 ; |    X   | $FE01
    .byte $00 ; |        | $FE02
    .byte $34 ; |  XX X  | $FE03
    .byte $01 ; |       X| $FE04
    .byte $98 ; |X  XX   | $FE05
    .byte $00 ; |        | $FE06
    .byte $00 ; |        | $FE07
    .byte $00 ; |        | $FE08
    .byte $4C ; | X  XX  | $FE09
    .byte $5C ; | X XXX  | $FE0A
    .byte $08 ; |    X   | $FE0B
    .byte $00 ; |        | $FE0C
    .byte $00 ; |        | $FE0D
    .byte $00 ; |        | $FE0E
    .byte $00 ; |        | $FE0F
    .byte $5C ; | X XXX  | $FE10
    .byte $2C ; |  X XX  | $FE11
    .byte $2C ; |  X XX  | $FE12
    .byte $98 ; |X  XX   | $FE13
    .byte $00 ; |        | $FE14
    .byte $9A ; |X  XX X | $FE15
    .byte $08 ; |    X   | $FE16
    .byte $02 ; |      X | $FE17
    .byte $34 ; |  XX X  | $FE18
    .byte $32 ; |  XX  X | $FE19
    .byte $3A ; |  XXX X | $FE1A
    .byte $00 ; |        | $FE1B
    .byte $02 ; |      X | $FE1C
    .byte $3C ; |  XXXX  | $FE1D
    .byte $5E ; | X XXXX | $FE1E
    .byte $00 ; |        | $FE1F
    .byte $4E ; | X  XXX | $FE20
    .byte $01 ; |       X| $FE21
    .byte $02 ; |      X | $FE22
    .byte $4C ; | X  XX  | $FE23
    .byte $3E ; |  XXXXX | $FE24
    .byte $08 ; |    X   | $FE25
    .byte $42 ; | X    X | $FE26
    .byte $5C ; | X XXX  | $FE27
    .byte $3E ; |  XXXXX | $FE28
    .byte $40 ; | X      | $FE29
    .byte $03 ; |      XX| $FE2A
    .byte $64 ; | XX  X  | $FE2B
    .byte $03 ; |      XX| $FE2C
    .byte $64 ; | XX  X  | $FE2D
    .byte $3E ; |  XXXXX | $FE2E
    .byte $64 ; | XX  X  | $FE2F
    .byte $0A ; |    X X | $FE30
    .byte $98 ; |X  XX   | $FE31
    .byte $02 ; |      X | $FE32
    .byte $02 ; |      X | $FE33
    .byte $02 ; |      X | $FE34
    .byte $3E ; |  XXXXX | $FE35
    .byte $02 ; |      X | $FE36
    .byte $3E ; |  XXXXX | $FE37
    .byte $3E ; |  XXXXX | $FE38
    .byte $76 ; | XXX XX | $FE39
    .byte $02 ; |      X | $FE3A
    .byte $02 ; |      X | $FE3B
    .byte $9A ; |X  XX X | $FE3C
    .byte $10 ; |   X    | $FE3D
    .byte $4C ; | X  XX  | $FE3E
    .byte $08 ; |    X   | $FE3F
    .byte $02 ; |      X | $FE40
    .byte $36 ; |  XX XX | $FE41
    .byte $02 ; |      X | $FE42
    .byte $02 ; |      X | $FE43
    .byte $02 ; |      X | $FE44
    .byte $02 ; |      X | $FE45
    .byte $02 ; |      X | $FE46
    .byte $72 ; | XXX  X | $FE47
    .byte $2E ; |  X XXX | $FE48
    .byte $02 ; |      X | $FE49
    .byte $0A ; |    X X | $FE4A
    .byte $90 ; |X  X    | $FE4B
    .byte $4C ; | X  XX  | $FE4C
    .byte $90 ; |X  X    | $FE4D
    .byte $00 ; |        | $FE4E
    .byte $98 ; |X  XX   | $FE4F
    .byte $02 ; |      X | $FE50
    .byte $6E ; | XX XXX | $FE51
    .byte $3E ; |  XXXXX | $FE52
    .byte $6E ; | XX XXX | $FE53
    .byte $03 ; |      XX| $FE54
    .byte $02 ; |      X | $FE55
    .byte $5E ; | X XXXX | $FE56
    .byte $02 ; |      X | $FE57
    .byte $02 ; |      X | $FE58
    .byte $02 ; |      X | $FE59
    .byte $9A ; |X  XX X | $FE5A
    .byte $00 ; |        | $FE5B
    .byte $4C ; | X  XX  | $FE5C
    .byte $02 ; |      X | $FE5D
    .byte $4C ; | X  XX  | $FE5E
    .byte $08 ; |    X   | $FE5F
    .byte $02 ; |      X | $FE60
    .byte $02 ; |      X | $FE61
    .byte $22 ; |  X   X | $FE62
    .byte $32 ; |  XX  X | $FE63
    .byte $02 ; |      X | $FE64
    .byte $02 ; |      X | $FE65
    .byte $02 ; |      X | $FE66
    .byte $02 ; |      X | $FE67
    .byte $02 ; |      X | $FE68
    .byte $02 ; |      X | $FE69
    .byte $08 ; |    X   | $FE6A
    .byte $4E ; | X  XXX | $FE6B
    .byte $02 ; |      X | $FE6C
    .byte $4C ; | X  XX  | $FE6D
    .byte $4C ; | X  XX  | $FE6E
    .byte $98 ; |X  XX   | $FE6F
    .byte $02 ; |      X | $FE70
    .byte $36 ; |  XX XX | $FE71
    .byte $0A ; |    X X | $FE72
    .byte $9A ; |X  XX X | $FE73
    .byte $3A ; |  XXX X | $FE74
    .byte $62 ; | XX   X | $FE75
    .byte $02 ; |      X | $FE76
    .byte $0A ; |    X X | $FE77
    .byte $9A ; |X  XX X | $FE78
    .byte $02 ; |      X | $FE79
    .byte $9A ; |X  XX X | $FE7A
    .byte $4E ; | X  XXX | $FE7B
    .byte $1C ; |   XXX  | $FE7C
    .byte $4E ; | X  XXX | $FE7D
    .byte $02 ; |      X | $FE7E
    .byte $0A ; |    X X | $FE7F
    .byte $02 ; |      X | $FE80
    .byte $22 ; |  X   X | $FE81
    .byte $02 ; |      X | $FE82
    .byte $4E ; | X  XXX | $FE83
    .byte $4E ; | X  XXX | $FE84
    .byte $02 ; |      X | $FE85
    .byte $0A ; |    X X | $FE86
    .byte $9A ; |X  XX X | $FE87
    .byte $90 ; |X  X    | $FE88
    .byte $9A ; |X  XX X | $FE89
    .byte $4E ; | X  XXX | $FE8A
    .byte $4E ; | X  XXX | $FE8B
    .byte $02 ; |      X | $FE8C
    .byte $4E ; | X  XXX | $FE8D
    .byte $00 ; |        | $FE8E
    .byte $08 ; |    X   | $FE8F
    .byte $02 ; |      X | $FE90
    .byte $9B ; |X  XX XX| $FE91
    .byte $0A ; |    X X | $FE92
    .byte $0A ; |    X X | $FE93
    .byte $9A ; |X  XX X | $FE94
    .byte $02 ; |      X | $FE95
    .byte $03 ; |      XX| $FE96
    .byte $0A ; |    X X | $FE97
    .byte $9A ; |X  XX X | $FE98
    .byte $5A ; | X XX X | $FE99
    .byte $08 ; |    X   | $FE9A
    .byte $4E ; | X  XXX | $FE9B
    .byte $92 ; |X  X  X | $FE9C
    .byte $4E ; | X  XXX | $FE9D
    .byte $36 ; |  XX XX | $FE9E
    .byte $9A ; |X  XX X | $FE9F
    .byte $02 ; |      X | $FEA0
    .byte $5E ; | X XXXX | $FEA1
    .byte $03 ; |      XX| $FEA2
    .byte $6E ; | XX XXX | $FEA3
    .byte $32 ; |  XX  X | $FEA4
    .byte $2E ; |  X XXX | $FEA5
    .byte $02 ; |      X | $FEA6
    .byte $4E ; | X  XXX | $FEA7
    .byte $66 ; | XX  XX | $FEA8
    .byte $02 ; |      X | $FEA9
    .byte $11 ; |   X   X| $FEAA
    .byte $4E ; | X  XXX | $FEAB
    .byte $45 ; | X   X X| $FEAC
    .byte $02 ; |      X | $FEAD
    .byte $00 ; |        | $FEAE
    .byte $08 ; |    X   | $FEAF
    .byte $02 ; |      X | $FEB0
    .byte $0A ; |    X X | $FEB1
    .byte $9A ; |X  XX X | $FEB2
    .byte $02 ; |      X | $FEB3
    .byte $22 ; |  X   X | $FEB4
    .byte $2A ; |  X X X | $FEB5
    .byte $02 ; |      X | $FEB6
    .byte $02 ; |      X | $FEB7
    .byte $02 ; |      X | $FEB8
    .byte $02 ; |      X | $FEB9
    .byte $0A ; |    X X | $FEBA
    .byte $02 ; |      X | $FEBB
    .byte $4E ; | X  XXX | $FEBC
    .byte $8E ; |X   XXX | $FEBD
    .byte $4E ; | X  XXX | $FEBE
    .byte $9A ; |X  XX X | $FEBF
    .byte $02 ; |      X | $FEC0
    .byte $62 ; | XX   X | $FEC1
    .byte $02 ; |      X | $FEC2
    .byte $00 ; |        | $FEC3
    .byte $02 ; |      X | $FEC4
    .byte $02 ; |      X | $FEC5
    .byte $66 ; | XX  XX | $FEC6
    .byte $9A ; |X  XX X | $FEC7
    .byte $0B ; |    X XX| $FEC8
    .byte $02 ; |      X | $FEC9
    .byte $9A ; |X  XX X | $FECA
    .byte $10 ; |   X    | $FECB
    .byte $4E ; | X  XXX | $FECC
    .byte $4C ; | X  XX  | $FECD
    .byte $02 ; |      X | $FECE
    .byte $08 ; |    X   | $FECF
    .byte $02 ; |      X | $FED0
    .byte $62 ; | XX   X | $FED1
    .byte $02 ; |      X | $FED2
    .byte $62 ; | XX   X | $FED3
    .byte $6A ; | XX X X | $FED4
    .byte $0A ; |    X X | $FED5
    .byte $9A ; |X  XX X | $FED6
    .byte $02 ; |      X | $FED7
    .byte $02 ; |      X | $FED8
    .byte $02 ; |      X | $FED9
    .byte $0A ; |    X X | $FEDA
    .byte $88 ; |X   X   | $FEDB
    .byte $02 ; |      X | $FEDC
    .byte $4E ; | X  XXX | $FEDD
    .byte $02 ; |      X | $FEDE
    .byte $9A ; |X  XX X | $FEDF
    .byte $02 ; |      X | $FEE0
    .byte $5E ; | X XXXX | $FEE1
    .byte $03 ; |      XX| $FEE2
    .byte $6A ; | XX X X | $FEE3
    .byte $03 ; |      XX| $FEE4
    .byte $5A ; | X XX X | $FEE5
    .byte $02 ; |      X | $FEE6
    .byte $01 ; |       X| $FEE7
    .byte $02 ; |      X | $FEE8
    .byte $02 ; |      X | $FEE9
    .byte $98 ; |X  XX   | $FEEA
    .byte $10 ; |   X    | $FEEB
    .byte $02 ; |      X | $FEEC
    .byte $4E ; | X  XXX | $FEED
    .byte $12 ; |   X  X | $FEEE
    .byte $0A ; |    X X | $FEEF
    .byte $02 ; |      X | $FEF0
    .byte $5E ; | X XXXX | $FEF1
    .byte $00 ; |        | $FEF2
    .byte $02 ; |      X | $FEF3
    .byte $02 ; |      X | $FEF4
    .byte $02 ; |      X | $FEF5
    .byte $02 ; |      X | $FEF6
    .byte $02 ; |      X | $FEF7
    .byte $02 ; |      X | $FEF8
    .byte $02 ; |      X | $FEF9
    .byte $08 ; |    X   | $FEFA
    .byte $8E ; |X   XXX | $FEFB
    .byte $8A ; |X   X X | $FEFC
    .byte $8A ; |X   X X | $FEFD
    .byte $02 ; |      X | $FEFE
    .byte $9A ; |X  XX X | $FEFF
LFF00:
    .byte $00 ; |        | $FF00
    .byte $02 ; |      X | $FF01
    .byte $06 ; |     XX | $FF02
    .byte $0C ; |    XX  | $FF03
    .byte $14 ; |   X X  | $FF04
    .byte $1C ; |   XXX  | $FF05
    .byte $26 ; |  X  XX | $FF06
    .byte $32 ; |  XX  X | $FF07
    .byte $40 ; | X      | $FF08
    .byte $50 ; | X X    | $FF09
    .byte $60 ; | XX     | $FF0A
    .byte $70 ; | XXX    | $FF0B
    .byte $80 ; |X       | $FF0C
    .byte $90 ; |X  X    | $FF0D
    .byte $A0 ; |X X     | $FF0E
    .byte $B0 ; |X XX    | $FF0F
    .byte $C0 ; |XX      | $FF10
    .byte $D0 ; |XX X    | $FF11
    .byte $E0 ; |XXX     | $FF12
    .byte $F0 ; |XXXX    | $FF13
LFF14:
    .byte $01 ; |       X| $FF14
    .byte $05 ; |     X X| $FF15
    .byte $0B ; |    X XX| $FF16
    .byte $13 ; |   X  XX| $FF17
    .byte $1B ; |   XX XX| $FF18
    .byte $25 ; |  X  X X| $FF19
    .byte $31 ; |  XX   X| $FF1A
    .byte $3F ; |  XXXXXX| $FF1B
    .byte $4F ; | X  XXXX| $FF1C
    .byte $5F ; | X XXXXX| $FF1D
    .byte $6F ; | XX XXXX| $FF1E
    .byte $7F ; | XXXXXXX| $FF1F
    .byte $8F ; |X   XXXX| $FF20
    .byte $9F ; |X  XXXXX| $FF21
    .byte $AF ; |X X XXXX| $FF22
    .byte $BF ; |X XXXXXX| $FF23
    .byte $CF ; |XX  XXXX| $FF24
    .byte $DF ; |XX XXXXX| $FF25
    .byte $EF ; |XXX XXXX| $FF26
    .byte $FF ; |XXXXXXXX| $FF27
LFF28:
    .byte $01 ; |       X| $FF28
    .byte $03 ; |      XX| $FF29
    .byte $05 ; |     X X| $FF2A
    .byte $07 ; |     XXX| $FF2B
    .byte $07 ; |     XXX| $FF2C
    .byte $09 ; |    X  X| $FF2D
    .byte $0B ; |    X XX| $FF2E
    .byte $0D ; |    XX X| $FF2F
    .byte $0F ; |    XXXX| $FF30
    .byte $0F ; |    XXXX| $FF31
    .byte $0F ; |    XXXX| $FF32
    .byte $0F ; |    XXXX| $FF33
    .byte $0F ; |    XXXX| $FF34
    .byte $0F ; |    XXXX| $FF35
    .byte $0F ; |    XXXX| $FF36
    .byte $0F ; |    XXXX| $FF37
    .byte $0F ; |    XXXX| $FF38
    .byte $0F ; |    XXXX| $FF39
    .byte $0F ; |    XXXX| $FF3A
    .byte $0F ; |    XXXX| $FF3B
LFF3C:
    .byte $42 ; | X    X | $FF3C
    .byte $44 ; | X   X  | $FF3D
LFF3E:
    .byte $30 ; |  XX    | $FF3E
    .byte $30 ; |  XX    | $FF3F
    .byte $20 ; |  X     | $FF40
    .byte $20 ; |  X     | $FF41
LFF42:
    .byte $70 ; | XXX    | $FF42
    .byte $B0 ; |X XX    | $FF43
    .byte $70 ; | XXX    | $FF44
    .byte $B0 ; |X XX    | $FF45
    .byte $70 ; | XXX    | $FF46
    .byte $70 ; | XXX    | $FF47
    .byte $70 ; | XXX    | $FF48
    .byte $B0 ; |X XX    | $FF49
    .byte $70 ; | XXX    | $FF4A
    .byte $B0 ; |X XX    | $FF4B
    .byte $70 ; | XXX    | $FF4C
    .byte $B0 ; |X XX    | $FF4D
    .byte $70 ; | XXX    | $FF4E
    .byte $70 ; | XXX    | $FF4F
    .byte $B0 ; |X XX    | $FF50
    .byte $70 ; | XXX    | $FF51
    .byte $B0 ; |X XX    | $FF52
    .byte $70 ; | XXX    | $FF53
    .byte $B0 ; |X XX    | $FF54
    .byte $70 ; | XXX    | $FF55
LFF56:
    .byte $B0 ; |X XX    | $FF56
    .byte $70 ; | XXX    | $FF57
    .byte $B0 ; |X XX    | $FF58
    .byte $70 ; | XXX    | $FF59
    .byte $B0 ; |X XX    | $FF5A
    .byte $B0 ; |X XX    | $FF5B
    .byte $B0 ; |X XX    | $FF5C
    .byte $70 ; | XXX    | $FF5D
    .byte $B0 ; |X XX    | $FF5E
    .byte $70 ; | XXX    | $FF5F
    .byte $B0 ; |X XX    | $FF60
    .byte $70 ; | XXX    | $FF61
    .byte $B0 ; |X XX    | $FF62
    .byte $B0 ; |X XX    | $FF63
    .byte $70 ; | XXX    | $FF64
    .byte $B0 ; |X XX    | $FF65
    .byte $70 ; | XXX    | $FF66
    .byte $B0 ; |X XX    | $FF67
    .byte $70 ; | XXX    | $FF68
    .byte $B0 ; |X XX    | $FF69
LFF6A:
    .byte $20 ; |  X     | $FF6A
    .byte $C0 ; |XX      | $FF6B
    .byte $90 ; |X  X    | $FF6C
LFF6D:
    .byte $00 ; |        | $FF6D
    .byte $04 ; |     X  | $FF6E
    .byte $08 ; |    X   | $FF6F
    .byte $0C ; |    XX  | $FF70
    .byte $10 ; |   X    | $FF71
LFF72:
    .byte $20 ; |  X     | $FF72
    .byte $00 ; |        | $FF73
    .byte $00 ; |        | $FF74
    .byte $00 ; |        | $FF75
    .byte $8B ; |X   X XX| $FF76
    .byte $3D ; |  XXXX X| $FF77
    .byte $32 ; |  XX  X | $FF78
    .byte $32 ; |  XX  X | $FF79
    .byte $32 ; |  XX  X | $FF7A
    .byte $20 ; |  X     | $FF7B
    .byte $93 ; |X  X  XX| $FF7C
    .byte $93 ; |X  X  XX| $FF7D
    .byte $93 ; |X  X  XX| $FF7E
    .byte $93 ; |X  X  XX| $FF7F
    .byte $93 ; |X  X  XX| $FF80
    .byte $93 ; |X  X  XX| $FF81
    .byte $00 ; |        | $FF82
    .byte $00 ; |        | $FF83
    .byte $95 ; |X  X X X| $FF84
    .byte $01 ; |       X| $FF85
    .byte $00 ; |        | $FF86
    .byte $00 ; |        | $FF87
    .byte $00 ; |        | $FF88
    .byte $06 ; |     XX | $FF89
    .byte $04 ; |     X  | $FF8A
LFF8B:
    .byte $1A ; |   XX X | $FF8B
    .byte $27 ; |  X  XXX| $FF8C
LFF8D:
    .byte $02 ; |      X | $FF8D
    .byte $0E ; |    XXX | $FF8E

LFF8F:
    .byte $34 ; |  XX X  | $FF8F
    .byte $40 ; | X      | $FF90
    .byte $4C ; | X  XX  | $FF91
    .byte $58 ; | X XX   | $FF92
LFF93:
    .byte $26 ; |  X  XX | $FF93
    .byte $33 ; |  XX  XX| $FF94
    .byte $40 ; | X      | $FF95
LFF96:
    .byte $4D ; | X  XX X| $FF96
    .byte $58 ; | X XX   | $FF97
    .byte $65 ; | XX  X X| $FF98
    .byte $8A ; |X   X X | $FF99
    .byte $8B ; |X   X XX| $FF9A
LFF9B:
    .byte $7F ; | XXXXXXX| $FF9B
    .byte $92 ; |X  X  X | $FF9C
LFF9D:
    .byte $E5 ; |XXX  X X| $FF9D
    .byte $CC ; |XX  XX  | $FF9E
    .byte $B3 ; |X XX  XX| $FF9F
    .byte $9A ; |X  XX X | $FFA0
    .byte $81 ; |X      X| $FFA1
LFFA2:
    .byte $81 ; |X      X| $FFA2
    .byte $9A ; |X  XX X | $FFA3
    .byte $B3 ; |X XX  XX| $FFA4
LFFA5:
    .byte $00 ; |        | $FFA5
    .byte $00 ; |        | $FFA6
    .byte $00 ; |        | $FFA7
    .byte $0A ; |    X X | $FFA8
    .byte $00 ; |        | $FFA9
LFFAA:
    .byte $00 ; |        | $FFAA
    .byte $01 ; |       X| $FFAB
LFFAC:
    .byte $93 ; |X  X  XX| $FFAC
    .byte $0F ; |    XXXX| $FFAD
LFFAE:
    .byte $06 ; |     XX | $FFAE
    .byte $04 ; |     X  | $FFAF
LFFB0:
    .byte $02 ; |      X | $FFB0
    .byte $01 ; |       X| $FFB1
    .byte $00 ; |        | $FFB2
    .byte $00 ; |        | $FFB3
    .byte $00 ; |        | $FFB4
    .byte $00 ; |        | $FFB5
    .byte $01 ; |       X| $FFB6
    .byte $02 ; |      X | $FFB7
LFFB8:
    .byte $0F ; |    XXXX| $FFB8
    .byte $1F ; |   XXXXX| $FFB9
    .byte $3F ; |  XXXXXX| $FFBA
    .byte $7F ; | XXXXXXX| $FFBB
    .byte $FF ; |XXXXXXXX| $FFBC
    .byte $7F ; | XXXXXXX| $FFBD
    .byte $3F ; |  XXXXXX| $FFBE
    .byte $1F ; |   XXXXX| $FFBF
LFFC0:
    .byte $00 ; |        | $FFC0
    .byte $00 ; |        | $FFC1
    .byte $00 ; |        | $FFC2
    .byte $00 ; |        | $FFC3
    .byte $00 ; |        | $FFC4
    .byte $01 ; |       X| $FFC5
    .byte $02 ; |      X | $FFC6
    .byte $03 ; |      XX| $FFC7
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
    .byte $00 ; |        | $FFE4
    .byte $00 ; |        | $FFE5
    .byte $00 ; |        | $FFE6
    .byte $00 ; |        | $FFE7
    .byte $00 ; |        | $FFE8
    .byte $00 ; |        | $FFE9
    .byte $00 ; |        | $FFEA
    .byte $00 ; |        | $FFEB

LFFEC:
    bit    BANK_0                   ; bankswitch, goto LD079

    jsr    LDFEF-3               ; 6  goto LFFEC, to do a bankswitch

LFFF2:
    ldx    #$FF                  ; 2
    txs                          ; 2
LFFF5:
    jmp    LF042                 ; 3

    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2

       RORG $FFFC
    .word Start_Bank1,Start_Bank1
