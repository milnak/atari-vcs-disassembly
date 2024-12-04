; Disassembly of mazec.bin
; Disassembled Sun Jun 06 11:57:28 2010
; Using DiStella v3.0
;
; Command Line: ultrastella -pasfcMaze.cfg mazec.bin 
;
; Maze.cfg contents:
;
;      ORG F000
;      GFX F000 F0FD
;      CODE F0FE FEC3
;      GFX FEC4 FFFF



; this was disassembled to see if this rom (in Rom Hunters V5 collection)
; was a bad dump. At first it appeared so    STA   ($DC,X) makes no sense where it
; is used, the other byte looks like it should be $C1 to match the rest of the table,
; but looking at the Quelle PAL version the changes are the same. The PAL Atari
; rom does not have these changes so it looks like the rom got messed when it was pirated,
; and makes even more sense when you look at the bits in each byte: $C5 instead of $C1,
; $81 instead of $85.


; Conclustion, good dump but bad rom...




      processor 6502

VSYNC   =  $00
VBLANK  =  $01
WSYNC   =  $02
NUSIZ0  =  $04
NUSIZ1  =  $05
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
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
ENAM1   =  $1E
ENABL   =  $1F
HMP0    =  $20
VDELP0  =  $25
VDELBL  =  $27
HMOVE   =  $2A

; Read TIA Baseline = $00
INPT2   =  $0A
INPT4   =  $0C

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM8T   =  $0295
TIM64T  =  $0296
LFEAD   =   $FEAD

       ORG $F000
    .byte $00 ; |        | $F000
    .byte $00 ; |        | $F001
    .byte $00 ; |        | $F002
    .byte $00 ; |        | $F003
    .byte $00 ; |        | $F004
    .byte $00 ; |        | $F005
    .byte $00 ; |        | $F006
    .byte $00 ; |        | $F007
    .byte $00 ; |        | $F008
    .byte $00 ; |        | $F009
    .byte $00 ; |        | $F00A
    .byte $00 ; |        | $F00B
    .byte $00 ; |        | $F00C
    .byte $00 ; |        | $F00D
    .byte $00 ; |        | $F00E
    .byte $00 ; |        | $F00F
    .byte $00 ; |        | $F010
    .byte $00 ; |        | $F011
    .byte $00 ; |        | $F012
    .byte $00 ; |        | $F013
    .byte $00 ; |        | $F014
    .byte $00 ; |        | $F015
    .byte $00 ; |        | $F016
    .byte $00 ; |        | $F017
    .byte $00 ; |        | $F018
    .byte $00 ; |        | $F019
    .byte $00 ; |        | $F01A
    .byte $00 ; |        | $F01B
    .byte $00 ; |        | $F01C
    .byte $00 ; |        | $F01D
    .byte $00 ; |        | $F01E
    .byte $00 ; |        | $F01F
    .byte $00 ; |        | $F020
    .byte $00 ; |        | $F021
    .byte $00 ; |        | $F022
    .byte $00 ; |        | $F023
    .byte $00 ; |        | $F024
    .byte $00 ; |        | $F025
    .byte $00 ; |        | $F026
    .byte $00 ; |        | $F027
    .byte $00 ; |        | $F028
    .byte $00 ; |        | $F029
    .byte $00 ; |        | $F02A
    .byte $00 ; |        | $F02B
    .byte $00 ; |        | $F02C
    .byte $00 ; |        | $F02D
    .byte $00 ; |        | $F02E
    .byte $00 ; |        | $F02F
    .byte $00 ; |        | $F030
    .byte $00 ; |        | $F031
    .byte $00 ; |        | $F032
    .byte $00 ; |        | $F033
    .byte $00 ; |        | $F034
    .byte $00 ; |        | $F035
    .byte $00 ; |        | $F036
    .byte $00 ; |        | $F037
    .byte $00 ; |        | $F038
    .byte $00 ; |        | $F039
    .byte $00 ; |        | $F03A
    .byte $00 ; |        | $F03B
    .byte $00 ; |        | $F03C
    .byte $00 ; |        | $F03D
    .byte $00 ; |        | $F03E
    .byte $00 ; |        | $F03F
    .byte $00 ; |        | $F040
    .byte $00 ; |        | $F041
    .byte $00 ; |        | $F042
    .byte $00 ; |        | $F043
    .byte $00 ; |        | $F044
    .byte $00 ; |        | $F045
    .byte $00 ; |        | $F046
    .byte $00 ; |        | $F047
    .byte $00 ; |        | $F048
    .byte $00 ; |        | $F049
    .byte $00 ; |        | $F04A
    .byte $00 ; |        | $F04B
    .byte $00 ; |        | $F04C
    .byte $00 ; |        | $F04D
    .byte $00 ; |        | $F04E
    .byte $00 ; |        | $F04F
    .byte $00 ; |        | $F050
    .byte $00 ; |        | $F051
    .byte $00 ; |        | $F052
    .byte $00 ; |        | $F053
    .byte $00 ; |        | $F054
    .byte $00 ; |        | $F055
    .byte $00 ; |        | $F056
    .byte $00 ; |        | $F057
    .byte $00 ; |        | $F058
    .byte $00 ; |        | $F059
    .byte $00 ; |        | $F05A
    .byte $00 ; |        | $F05B
    .byte $60 ; | XX     | $F05C
    .byte $F0 ; |XXXX    | $F05D
    .byte $60 ; | XX     | $F05E
    .byte $90 ; |X  X    | $F05F
    .byte $00 ; |        | $F060
    .byte $00 ; |        | $F061
    .byte $00 ; |        | $F062
    .byte $00 ; |        | $F063
    .byte $00 ; |        | $F064
    .byte $00 ; |        | $F065
    .byte $00 ; |        | $F066
    .byte $00 ; |        | $F067
    .byte $00 ; |        | $F068
    .byte $00 ; |        | $F069
    .byte $00 ; |        | $F06A
    .byte $00 ; |        | $F06B
    .byte $00 ; |        | $F06C
    .byte $00 ; |        | $F06D
    .byte $00 ; |        | $F06E
    .byte $00 ; |        | $F06F
    .byte $00 ; |        | $F070
    .byte $00 ; |        | $F071
    .byte $00 ; |        | $F072
    .byte $00 ; |        | $F073
    .byte $00 ; |        | $F074
    .byte $00 ; |        | $F075
    .byte $00 ; |        | $F076
    .byte $00 ; |        | $F077
    .byte $00 ; |        | $F078
    .byte $00 ; |        | $F079
    .byte $00 ; |        | $F07A
    .byte $00 ; |        | $F07B
    .byte $00 ; |        | $F07C
    .byte $00 ; |        | $F07D
    .byte $00 ; |        | $F07E
    .byte $00 ; |        | $F07F
    .byte $00 ; |        | $F080
    .byte $00 ; |        | $F081
    .byte $00 ; |        | $F082
    .byte $00 ; |        | $F083
    .byte $00 ; |        | $F084
    .byte $00 ; |        | $F085
    .byte $00 ; |        | $F086
    .byte $00 ; |        | $F087
    .byte $00 ; |        | $F088
    .byte $00 ; |        | $F089
    .byte $00 ; |        | $F08A
    .byte $00 ; |        | $F08B
    .byte $00 ; |        | $F08C
    .byte $00 ; |        | $F08D
    .byte $00 ; |        | $F08E
    .byte $00 ; |        | $F08F
    .byte $00 ; |        | $F090
    .byte $00 ; |        | $F091
    .byte $00 ; |        | $F092
    .byte $00 ; |        | $F093
    .byte $00 ; |        | $F094
    .byte $00 ; |        | $F095
    .byte $00 ; |        | $F096
    .byte $00 ; |        | $F097
    .byte $00 ; |        | $F098
    .byte $00 ; |        | $F099
    .byte $00 ; |        | $F09A
    .byte $00 ; |        | $F09B
    .byte $00 ; |        | $F09C
    .byte $00 ; |        | $F09D
    .byte $00 ; |        | $F09E
    .byte $00 ; |        | $F09F
    .byte $00 ; |        | $F0A0
    .byte $00 ; |        | $F0A1
    .byte $00 ; |        | $F0A2
    .byte $00 ; |        | $F0A3
    .byte $00 ; |        | $F0A4
    .byte $00 ; |        | $F0A5
    .byte $00 ; |        | $F0A6
    .byte $00 ; |        | $F0A7
    .byte $00 ; |        | $F0A8
    .byte $00 ; |        | $F0A9
    .byte $00 ; |        | $F0AA
    .byte $00 ; |        | $F0AB
    .byte $00 ; |        | $F0AC
    .byte $00 ; |        | $F0AD
    .byte $00 ; |        | $F0AE
    .byte $00 ; |        | $F0AF
    .byte $00 ; |        | $F0B0
    .byte $00 ; |        | $F0B1
    .byte $00 ; |        | $F0B2
    .byte $00 ; |        | $F0B3
    .byte $00 ; |        | $F0B4
    .byte $00 ; |        | $F0B5
    .byte $00 ; |        | $F0B6
    .byte $00 ; |        | $F0B7
    .byte $00 ; |        | $F0B8
    .byte $00 ; |        | $F0B9
    .byte $00 ; |        | $F0BA
    .byte $00 ; |        | $F0BB
    .byte $77 ; | XXX XXX| $F0BC
    .byte $22 ; |  X   X | $F0BD
    .byte $22 ; |  X   X | $F0BE
    .byte $33 ; |  XX  XX| $F0BF
    .byte $22 ; |  X   X | $F0C0
    .byte $77 ; | XXX XXX| $F0C1
    .byte $11 ; |   X   X| $F0C2
    .byte $77 ; | XXX XXX| $F0C3
    .byte $44 ; | X   X  | $F0C4
    .byte $77 ; | XXX XXX| $F0C5
    .byte $77 ; | XXX XXX| $F0C6
    .byte $44 ; | X   X  | $F0C7
    .byte $66 ; | XX  XX | $F0C8
    .byte $44 ; | X   X  | $F0C9
    .byte $77 ; | XXX XXX| $F0CA
    .byte $44 ; | X   X  | $F0CB
    .byte $44 ; | X   X  | $F0CC
    .byte $77 ; | XXX XXX| $F0CD
    .byte $55 ; | X X X X| $F0CE
    .byte $55 ; | X X X X| $F0CF
    .byte $77 ; | XXX XXX| $F0D0
    .byte $44 ; | X   X  | $F0D1
    .byte $77 ; | XXX XXX| $F0D2
    .byte $11 ; |   X   X| $F0D3
    .byte $77 ; | XXX XXX| $F0D4
    .byte $77 ; | XXX XXX| $F0D5
    .byte $55 ; | X X X X| $F0D6
    .byte $77 ; | XXX XXX| $F0D7
    .byte $11 ; |   X   X| $F0D8
    .byte $77 ; | XXX XXX| $F0D9
    .byte $44 ; | X   X  | $F0DA
    .byte $44 ; | X   X  | $F0DB
    .byte $44 ; | X   X  | $F0DC
    .byte $44 ; | X   X  | $F0DD
    .byte $77 ; | XXX XXX| $F0DE
    .byte $77 ; | XXX XXX| $F0DF
    .byte $55 ; | X X X X| $F0E0
    .byte $77 ; | XXX XXX| $F0E1
    .byte $55 ; | X X X X| $F0E2
    .byte $77 ; | XXX XXX| $F0E3
    .byte $77 ; | XXX XXX| $F0E4
    .byte $44 ; | X   X  | $F0E5
    .byte $77 ; | XXX XXX| $F0E6
    .byte $55 ; | X X X X| $F0E7
    .byte $77 ; | XXX XXX| $F0E8
    .byte $77 ; | XXX XXX| $F0E9
    .byte $55 ; | X X X X| $F0EA
    .byte $55 ; | X X X X| $F0EB
    .byte $55 ; | X X X X| $F0EC
    .byte $77 ; | XXX XXX| $F0ED
LF0EE:
    .byte $BC ; |X XXXX  | $F0EE
    .byte $C1 ; |XX     X| $F0EF   $C5 in Maze Craze (unknown)
    .byte $C6 ; |XX   XX | $F0F0
    .byte $CB ; |XX  X XX| $F0F1
    .byte $D0 ; |XX X    | $F0F2
    .byte $D5 ; |XX X X X| $F0F3
    .byte $DA ; |XX XX X | $F0F4
    .byte $DF ; |XX XXXXX| $F0F5
    .byte $E4 ; |XXX  X  | $F0F6
    .byte $E9 ; |XXX X  X| $F0F7
    .byte $BC ; |X XXXX  | $F0F8
    .byte $C1 ; |XX     X| $F0F9
    .byte $C6 ; |XX   XX | $F0FA
    .byte $CB ; |XX  X XX| $F0FB
    .byte $D0 ; |XX X    | $F0FC
    .byte $D5 ; |XX X X X| $F0FD
    
    nop                          ; 2
    nop                          ; 2
    
LF100:
    lda    #$F0                  ; 2
    ldx    #7                    ; 2
LF104:
    sta    $F0,X                 ; 4
    dex                          ; 2
    bne    LF104                 ; 2³
    ldx    $BD                   ; 3
    txa                          ; 2
    and    #$03                  ; 2
    tay                          ; 2
    lda    LF0EE,Y               ; 4
    sta    $F6                   ; 3
    txa                          ; 2
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    and    #$03                  ; 2
    tay                          ; 2
    lda    LF0EE,Y               ; 4
    sta    $F0                   ; 3
    txa                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LF0EE,Y               ; 4
    sta    $F4                   ; 3
    lda    #$B4                  ; 2
    cpy    #9                    ; 2
    bcc    LF133                 ; 2³
    lda    #$BC                  ; 2
LF133:
    sta    $F2                   ; 3
    ldy    #4                    ; 2
LF137:
    ldx    #2                    ; 2
LF139:
    sta    WSYNC                 ; 3
    lda    #0                    ; 2
    sta    PF1                   ; 3
    lda    ($F0),Y               ; 5
    sta    PF0                   ; 3
    lda    ($F2),Y               ; 5
    and    #$F0                  ; 2
    sta    PF2                   ; 3
    lda    ($F4),Y               ; 5
    sta    PF0                   ; 3
    jsr    LF931                 ; 6
    lda    ($F6),Y               ; 5
    and    #$0F                  ; 2
    sta    PF2                   ; 3
    dex                          ; 2
    bne    LF139                 ; 2³
    dey                          ; 2
    bpl    LF137                 ; 2³
    iny                          ; 2
    sty    PF0                   ; 3
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    sta    WSYNC                 ; 3
    stx    $F4                   ; 3
    stx    $F5                   ; 3
    lda    $DF                   ; 3
    and    #$03                  ; 2
    beq    LF17E                 ; 2³
    ldx    #1                    ; 2
LF171:
    lda    $EA,X                 ; 4
    and    #$07                  ; 2
    tay                          ; 2
    lda    LFEFD,Y               ; 4
    sta    $F4,X                 ; 4
    dex                          ; 2
    bpl    LF171                 ; 2³
LF17E:
    lda    #5                    ; 2
    sta    $F0                   ; 3
LF182:
    sta    WSYNC                 ; 3
    lda    $C0                   ; 3
    sta    COLUPF                ; 3
    lda    $F4                   ; 3
    sta    PF1                   ; 3
    jsr    LF931                 ; 6
    ldx    $C1                   ; 3
    ldy    $C2                   ; 3
    stx    COLUPF                ; 3
    sty    COLUPF                ; 3
    lda    $F5                   ; 3
    sta    PF1                   ; 3
    lda    $C0                   ; 3
    sta    COLUPF                ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    stx    COLUPF                ; 3
    sty    COLUPF                ; 3
    dec    $F0                   ; 5
    bpl    LF182                 ; 2³
    lda    #0                    ; 2
    sta    PF1                   ; 3
    lda    #$F0                  ; 2
    sta    $F9                   ; 3
    sta    $FB                   ; 3
    lda    $C7                   ; 3
    asl                          ; 2
    clc                          ; 2
    adc    #0                    ; 2
    sta    $F8                   ; 3
    lda    $C8                   ; 3
    asl                          ; 2
    clc                          ; 2
    adc    #0                    ; 2
    sta    $FA                   ; 3
    ldx    #2                    ; 2
LF1C7:
    lda    $C9,X                 ; 4
    sec                          ; 2
    sbc    #$2E                  ; 2
    sta    $C9,X                 ; 4
    dex                          ; 2
    bpl    LF1C7                 ; 2³
    lda    $C4                   ; 3
    sta    COLUBK                ; 3
    bit    $B0                   ; 3
    bmi    LF1DB                 ; 2³
    lda    $C2                   ; 3
LF1DB:
    sta    WSYNC                 ; 3
    sta    COLUPF                ; 3
    stx    $F2                   ; 3
    stx    $F3                   ; 3
    ldy    #7                    ; 2
LF1E5:
    dey                          ; 2
    bne    LF1E5                 ; 2³
    ldx    #$1E                  ; 2
    txs                          ; 2
    ldx    #$0B                  ; 2
    lda    $F0                   ; 3
LF1EF:
    lda    $8C,X                 ; 4
    ora    #$AA                  ; 2
    sta    $F4                   ; 3
    sta    PF1                   ; 3
    lda    $CA                   ; 3
    and    #$FE                  ; 2
    php                          ; 3
    lda    $C9                   ; 3
    and    #$FE                  ; 2
    php                          ; 3
    lda    $F2                   ; 3
    sta    PF0                   ; 3
    lda    ($FA),Y               ; 5
    sta    GRP1                  ; 3
    lda    $98,X                 ; 4
    ora    #$55                  ; 2
    sta    $F6                   ; 3
    sta    PF2                   ; 3
    lda    $F3                   ; 3
    sta    PF0                   ; 3
    lda    $A4,X                 ; 4
    ora    #$AA                  ; 2
    sta    $F5                   ; 3
    sta    PF1                   ; 3
    lda    $B0,X                 ; 4
    ora    #$55                  ; 2
    and    #$7F                  ; 2
    sta    PF2                   ; 3
    sta    $F7                   ; 3
    iny                          ; 2
    lda    ($F8),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($FA),Y               ; 5
    sta    GRP1                  ; 3
    lda    $F2                   ; 3
    sta    PF0                   ; 3
    lda    $F4                   ; 3
    sta    PF1                   ; 3
    lda    $F6                   ; 3
    sta    PF2                   ; 3
    lda    $F3                   ; 3
    sta    PF0                   ; 3
    pla                          ; 4
    pla                          ; 4
    pla                          ; 4
    lda    $F5                   ; 3
    sta    PF1                   ; 3
    lda    $F7                   ; 3
    sta    PF2                   ; 3
    inc    $CB                   ; 5
    lda    $B0,X                 ; 4
    bmi    LF255                 ; 2³
    lda    $C2                   ; 3
    bne    LF258                 ; 2³
LF255:
    nop                          ; 2
    lda    $C4                   ; 3
LF258:
    sta    COLUPF                ; 3
    lda    $F2                   ; 3
    sta    PF0                   ; 3
    lda    $F4                   ; 3
    sta    PF1                   ; 3
    lda    $F6                   ; 3
    sta    PF2                   ; 3
    inc    $CA                   ; 5
    inc    $C9                   ; 5
    iny                          ; 2
    lda    ($F8),Y               ; 5
    sta    GRP0                  ; 3
    lda    $F3                   ; 3
    sta    PF0                   ; 3
    lda    $F5                   ; 3
    sta    PF1                   ; 3
    lda    $F7                   ; 3
    sta    PF2                   ; 3
    lda    $CB                   ; 3
    and    #$FE                  ; 2
    php                          ; 3
    lda    $F2                   ; 3
    sta    PF0                   ; 3
    lda    $CA                   ; 3
    and    #$FE                  ; 2
    php                          ; 3
    lda    $C9                   ; 3
    and    #$FE                  ; 2
    php                          ; 3
    lda    ($FA),Y               ; 5
    sta    GRP1                  ; 3
    lda    $F4                   ; 3
    sta    PF1                   ; 3
    lda    $F6                   ; 3
    sta    PF2                   ; 3
    iny                          ; 2
    lda    ($F8),Y               ; 5
    sta    GRP0                  ; 3
    lda    $F3                   ; 3
    sta    PF0                   ; 3
    lda    $F5                   ; 3
    sta    PF1                   ; 3
    lda    $F7                   ; 3
    sta    PF2                   ; 3
    lda    $80,X                 ; 4
    and    #$55                  ; 2
    sta    $F0                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $F1                   ; 3
    lda    ($FA),Y               ; 5
    sta    GRP1                  ; 3
    lda    $F2                   ; 3
    sta    PF0                   ; 3
    lda    $F4                   ; 3
    sta    PF1                   ; 3
    lda    $F6                   ; 3
    sta    PF2                   ; 3
    lda    $F3                   ; 3
    sta    PF0                   ; 3
    lda    $F5                   ; 3
    sta    PF1                   ; 3
    pla                          ; 4
    pla                          ; 4
    pla                          ; 4
    lda    $F7                   ; 3
    sta    PF2                   ; 3
    inc    $CB                   ; 5
    inc    $CA                   ; 5
    inc    $C9                   ; 5
    lda    $F2                   ; 3
    sta    PF0                   ; 3
    lda    $F4                   ; 3
    sta    PF1                   ; 3
    lda    $F6                   ; 3
    sta    PF2                   ; 3
    iny                          ; 2
    lda    ($F8),Y               ; 5
    sta    GRP0                  ; 3
    lda    $CB                   ; 3
    and    #$FE                  ; 2
    php                          ; 3
    lda    $F3                   ; 3
    sta    PF0                   ; 3
    lda    $F5                   ; 3
    sta    PF1                   ; 3
    lda    $F7                   ; 3
    sta    PF2                   ; 3
    nop                          ; 2
    lda    $F0                   ; 3
    lda    $8C,X                 ; 4
    and    #$AA                  ; 2
    sta    $F4                   ; 3
    sta    PF1                   ; 3
    lda    $CA                   ; 3
    and    #$FE                  ; 2
    php                          ; 3
    lda    $C9                   ; 3
    and    #$FE                  ; 2
    php                          ; 3
    lda    ($FA),Y               ; 5
    sta    GRP1                  ; 3
    lda    $F0                   ; 3
    sta    PF0                   ; 3
    lda    $98,X                 ; 4
    and    #$55                  ; 2
    sta    $F6                   ; 3
    sta    PF2                   ; 3
    lda    $F1                   ; 3
    sta    PF0                   ; 3
    lda    $A4,X                 ; 4
    and    #$AA                  ; 2
    sta    $F5                   ; 3
    sta    PF1                   ; 3
    lda    $B0,X                 ; 4
    and    #$55                  ; 2
    sta    PF2                   ; 3
    sta    $F7                   ; 3
    iny                          ; 2
    lda    ($F8),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($FA),Y               ; 5
    sta    GRP1                  ; 3
    lda    $F0                   ; 3
    sta    PF0                   ; 3
    lda    $F4                   ; 3
    sta    PF1                   ; 3
    lda    $F6                   ; 3
    sta    PF2                   ; 3
    lda    $F1                   ; 3
    sta    PF0                   ; 3
    pla                          ; 4
    pla                          ; 4
    pla                          ; 4
    lda    $F5                   ; 3
    sta    PF1                   ; 3
    lda    $F7                   ; 3
    sta    PF2                   ; 3
    lda    $7F,X                 ; 4
    ora    #$55                  ; 2
    sta    $F2                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $F3                   ; 3
    lda    $F0                   ; 3
    sta    PF0                   ; 3
    lda    $F4                   ; 3
    sta    PF1                   ; 3
    lda    $F6                   ; 3
    sta    PF2                   ; 3
    inc    $CB                   ; 5
    inc    $CA                   ; 5
    inc    $C9                   ; 5
    lda    $F1                   ; 3
    sta    PF0                   ; 3
    lda    $F5                   ; 3
    sta    PF1                   ; 3
    lda    $F7                   ; 3
    sta    PF2                   ; 3
    iny                          ; 2
    lda    ($F8),Y               ; 5
    sta    GRP0                  ; 3
    lda    $CB                   ; 3
    and    #$FE                  ; 2
    php                          ; 3
    lda    $F0                   ; 3
    sta    PF0                   ; 3
    lda    $CA                   ; 3
    and    #$FE                  ; 2
    php                          ; 3
    lda    $C9                   ; 3
    and    #$FE                  ; 2
    php                          ; 3
    lda    ($FA),Y               ; 5
    sta    GRP1                  ; 3
    lda    $F4                   ; 3
    sta    PF1                   ; 3
    lda    $F6                   ; 3
    sta    PF2                   ; 3
    lda    $F1                   ; 3
    sta    PF0                   ; 3
    lda    $F5                   ; 3
    sta    PF1                   ; 3
    lda    $F7                   ; 3
    sta    PF2                   ; 3
    iny                          ; 2
    lda    ($F8),Y               ; 5
    sta    GRP0                  ; 3
    inc    $CB                   ; 5
    inc    $CA                   ; 5
    inc    $C9                   ; 5
    lda    ($FA),Y               ; 5
    sta    GRP1                  ; 3
    lda    $F0                   ; 3
    sta    PF0                   ; 3
    lda    $F4                   ; 3
    sta    PF1                   ; 3
    lda    $F6                   ; 3
    sta    PF2                   ; 3
    lda    $F1                   ; 3
    sta    PF0                   ; 3
    pla                          ; 4
    pla                          ; 4
    pla                          ; 4
    lda    $F5                   ; 3
    sta    PF1                   ; 3
    lda    $F7                   ; 3
    sta    PF2                   ; 3
    iny                          ; 2
    lda    ($F8),Y               ; 5
    sta    GRP0                  ; 3
    lda    $F0                   ; 3
    sta    PF0                   ; 3
    lda    $F4                   ; 3
    sta    PF1                   ; 3
    lda    $F6                   ; 3
    sta    PF2                   ; 3
    lda    $CB                   ; 3
    and    #$FE                  ; 2
    php                          ; 3
    dec    $F4                   ; 5
    dec    $F4                   ; 5
    dec    $F4                   ; 5
    lda    $F1                   ; 3
    sta    PF0                   ; 3
    lda    $F5                   ; 3
    sta    PF1                   ; 3
    lda    $F7                   ; 3
    dex                          ; 2
    bmi    LF40D                 ; 2³
    sta    PF2                   ; 3
    jmp    LF1EF                 ; 3

LF40D:
    ldx    #6                    ; 2
    sta    PF2                   ; 3
LF411:
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    ENABL                 ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #$FF                  ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    ldy    #4                    ; 2
LF429:
    dey                          ; 2
    bpl    LF429                 ; 2³
    lsr                          ; 2
    sta    PF2                   ; 3
    dex                          ; 2
    bne    LF411                 ; 2³
    lda    $C3                   ; 3
    sta    COLUBK                ; 3
    stx    PF0                   ; 3
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    ldx    #2                    ; 2
LF43E:
    dec    $C9,X                 ; 6
    dec    $C9,X                 ; 6
    dex                          ; 2
    bpl    LF43E                 ; 2³
    txs                          ; 2
    lda    #$26                  ; 2
    sta    TIM64T                ; 4
    jsr    LF945                 ; 6
LF44E:
    lda    $E1                   ; 3
    lsr                          ; 2
    bcs    LF492                 ; 2³
    lda    $BC                   ; 3
    and    #$01                  ; 2
    beq    LF460                 ; 2³
    lda    SWCHB                 ; 4
    and    #$01                  ; 2
    bne    LF48F                 ; 2³
LF460:
    lda    SWCHB                 ; 4
    and    #$03                  ; 2
    cmp    #2                    ; 2
    bne    LF476                 ; 2³
    lda    $BC                   ; 3
    ora    #$01                  ; 2
    sta    $BC                   ; 3
    lda    #0                    ; 2
    sta    $DC                   ; 3   sta    ($DC,X)   $FA02,X  where X=$FF
    jmp    LF4BE                 ; 3

LF476:
    lda    SWCHB                 ; 4
    and    #$02                  ; 2
    beq    LF495                 ; 2³
    lda    #$50                  ; 2
    sta    $E2                   ; 3
    lda    $BC                   ; 3
    and    #$60                  ; 2
    cmp    #$40                  ; 2
    bne    LF492                 ; 2³
    lda    INPT4                 ; 3
    and    PF0                   ; 3
    bmi    LF492                 ; 2³
LF48F:
    jmp    LFA7E                 ; 3

LF492:
    jmp    LF4BE                 ; 3

LF495:
    lda    $BC                   ; 3
    ora    #$50                  ; 2
    and    #$FE                  ; 2
    sta    $BC                   ; 3
    inc    $E2                   ; 5
    lda    $E2                   ; 3
    cmp    #$0D                  ; 2
    bcc    LF4BE                 ; 2³
    lda    SWCHB                 ; 4
    lsr                          ; 2
    lda    #$0C                  ; 2
    bcc    LF4AF                 ; 2³
    lda    #2                    ; 2
LF4AF:
    sta    $E2                   ; 3
    inc    $BD                   ; 5
    jsr    LF967                 ; 6
    lda    #$0A                  ; 2
    jsr    LFB89                 ; 6
    jmp    LF764                 ; 3

LF4BE:
    lda    INPT4                 ; 3
    and    PF0                   ; 3
    ora    #$7F                  ; 2
    and    SWCHA                 ; 4
    cmp    #$FF                  ; 2
    beq    LF4CF                 ; 2³
    lda    #0                    ; 2
    sta    $DC                   ; 3
LF4CF:
    ldx    #1                    ; 2
LF4D1:
    lda    INPT4,X               ; 4
    bpl    LF4DB                 ; 2³
    lda    $EA,X                 ; 4
    ora    #$10                  ; 2
    sta    $EA,X                 ; 4
LF4DB:
    dex                          ; 2
    bpl    LF4D1                 ; 2³
    lda    $BD                   ; 3
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    and    #$03                  ; 2
    tay                          ; 2
    lda    $E3                   ; 3
    and    #$07                  ; 2
    bne    LF504                 ; 2³+1
    bit    $E3                   ; 3
    lda    $E3                   ; 3
    bmi    LF4F8                 ; 2³
    bvs    LF4F8                 ; 2³
    lda    #$40                  ; 2
    ora    $E3                   ; 3
LF4F8:
    clc                          ; 2
    adc    LFEE7,Y               ; 4
    sta    $E3                   ; 3
    lda    $BC                   ; 3
    and    #$60                  ; 2
    beq    LF507                 ; 2³
LF504:
    jmp    LF6C7                 ; 3

LF507:
    ldx    #1                    ; 2
    lda    SWCHA                 ; 4
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
LF510:
    eor    #$F0                  ; 2
    sta    $F3                   ; 3
    lda    $E0                   ; 3
    and    #$04                  ; 2
    beq    LF535                 ; 2³
    lda    $DD,X                 ; 4
    beq    LF523                 ; 2³
    dec    $DD,X                 ; 6
    jmp    LF535                 ; 3

LF523:
    lda    INPT4,X               ; 4
    bmi    LF535                 ; 2³
    lda    #$7D                  ; 2
    sta    $DD,X                 ; 4
    lda    #$14                  ; 2
    sta    $E1                   ; 3
    lda    $BC                   ; 3
    ora    #$02                  ; 2
    sta    $BC                   ; 3
LF535:
    lda    SWCHB                 ; 4
    and    LFED3,X               ; 4
    beq    LF546                 ; 2³
    lda    $E3                   ; 3
    and    #$C0                  ; 2
    bne    LF546                 ; 2³
    jmp    LF638                 ; 3

LF546:
    lda    $EA,X                 ; 4
    and    #$40                  ; 2
    bne    LF55A                 ; 2³
    lda    $E4,X                 ; 4
    beq    LF581                 ; 2³
    lda    $EA,X                 ; 4
    eor    #$20                  ; 2
    sta    $EA,X                 ; 4
    and    #$20                  ; 2
    beq    LF55D                 ; 2³
LF55A:
    jmp    LF632                 ; 3

LF55D:
    dec    $E4,X                 ; 6
    lda    #$0F                  ; 2
    sta    $F0                   ; 3
    lda    $E4,X                 ; 4
    cmp    #$C8                  ; 2
    bcs    LF55A                 ; 2³
    cmp    #$96                  ; 2
    bcs    LF57B                 ; 2³
    lsr    $F0                   ; 5
    cmp    #$64                  ; 2
    bcs    LF57B                 ; 2³
    lsr    $F0                   ; 5
    cmp    #$32                  ; 2
    bcs    LF57B                 ; 2³
    lsr    $F0                   ; 5
LF57B:
    and    $F0                   ; 3
    cmp    $F0                   ; 3
    bne    LF55A                 ; 2³
LF581:
    lda    $D5,X                 ; 4
    and    #$07                  ; 2
    beq    LF5DA                 ; 2³
    cmp    #2                    ; 2
    bne    LF5D7                 ; 2³
    lda    $E0                   ; 3
    and    #$80                  ; 2
    beq    LF5D7                 ; 2³
    lda    $EA,X                 ; 4
    and    #$10                  ; 2
    beq    LF5D7                 ; 2³
    lda    INPT4,X               ; 4
    bmi    LF5D7                 ; 2³
    lda    $EA,X                 ; 4
    and    #$EF                  ; 2
    sta    $EA,X                 ; 4
    lda    $E6,X                 ; 4
    cmp    #$19                  ; 2
    beq    LF5BA                 ; 2³
    lda    $E6,X                 ; 4
    sta    $C2                   ; 3
    lda    $E8,X                 ; 4
    sta    $C3                   ; 3
    jsr    LF9F1                 ; 6
    lda    $C4                   ; 3
    eor    #$FF                  ; 2
    and    ($C5),Y               ; 5
    sta    ($C5),Y               ; 6
LF5BA:
    lda    $CE,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    sta    $E8,X                 ; 4
    sta    $C3                   ; 3
    lda    $C7,X                 ; 4
    lsr                          ; 2
    sta    $E6,X                 ; 4
    sta    $C2                   ; 3
    jsr    LF9F1                 ; 6
    lda    $C4                   ; 3
    ora    ($C5),Y               ; 5
    sta    ($C5),Y               ; 6
    lda    #5                    ; 2
    jsr    LFEA3                 ; 6
LF5D7:
    jmp    LF62F                 ; 3

LF5DA:
    lda    $F3                   ; 3
    beq    LF632                 ; 2³+1
    ldy    #$FF                  ; 2
    sty    $F1                   ; 3
    ldy    #3                    ; 2
LF5E4:
    sty    $F2                   ; 3
    asl    $F3                   ; 5
    bcc    LF5FF                 ; 2³
    lda    LFEE3,Y               ; 4
    jsr    LF990                 ; 6
    bne    LF5FF                 ; 2³
    ldy    $F2                   ; 3
    lda    LFEE3,Y               ; 4
    eor    $D5,X                 ; 4
    and    #$C0                  ; 2
    bne    LF620                 ; 2³+1
    sty    $F1                   ; 3
LF5FF:
    ldy    $F2                   ; 3
    dey                          ; 2
    bpl    LF5E4                 ; 2³+1
    ldy    $F1                   ; 3
    bpl    LF620                 ; 2³
    lda    $EC,X                 ; 4
    bne    LF61D                 ; 2³
    lda    #$1F                  ; 2
    cpx    #0                    ; 2
    beq    LF613                 ; 2³
    lsr                          ; 2
LF613:
    sta    AUDF0,X               ; 4
    lda    #$0C                  ; 2
    sta    AUDC0,X               ; 4
    lda    #5                    ; 2
    sta    AUDV0,X               ; 4
LF61D:
    jmp    LF638                 ; 3

LF620:
    lda    $EC,X                 ; 4
    bne    LF628                 ; 2³
    lda    #1                    ; 2
    sta    $EC,X                 ; 4
LF628:
    lda    LFEE3,Y               ; 4
    ora    #$04                  ; 2
    sta    $D5,X                 ; 4
LF62F:
    jsr    LFD91                 ; 6
LF632:
    lda    $EC,X                 ; 4
    bne    LF638                 ; 2³
    sta    AUDV0,X               ; 4
LF638:
    dex                          ; 2
    bmi    LF643                 ; 2³
    lda    SWCHA                 ; 4
    and    #$F0                  ; 2
    jmp    LF510                 ; 3

LF643:
    lda    $DF                   ; 3
    and    #$03                  ; 2
    beq    LF686                 ; 2³
    ldx    #1                    ; 2
LF64B:
    lda    #2                    ; 2
    sta    $F5                   ; 3
LF64F:
    ldy    $F5                   ; 3
    jsr    LFCFB                 ; 6
    bcc    LF66D                 ; 2³
    lda    LFECD,Y               ; 4
    and    $EA,X                 ; 4
    bne    LF66D                 ; 2³
    lda    LFECD,Y               ; 4
    ora    $EA,X                 ; 4
    sta    $EA,X                 ; 4
    and    #$07                  ; 2
    tay                          ; 2
    lda    LFF21,Y               ; 4
    jsr    LFEA3                 ; 6
LF66D:
    dec    $F5                   ; 5
    bpl    LF64F                 ; 2³
    dex                          ; 2
    bpl    LF64B                 ; 2³
    ldx    #2                    ; 2
LF676:
    lda    LFECD,X               ; 4
    and    $EA                   ; 3
    and    $EB                   ; 3
    beq    LF683                 ; 2³
    lda    #$AA                  ; 2
    sta    $C9,X                 ; 4
LF683:
    dex                          ; 2
    bpl    LF676                 ; 2³
LF686:
    lda    $DF                   ; 3
    and    #$94                  ; 2
    beq    LF6C7                 ; 2³
    ldx    #1                    ; 2
LF68E:
    ldy    #4                    ; 2
LF690:
    jsr    LFCFB                 ; 6
    bcc    LF6C1                 ; 2³
    lda    $E0                   ; 3
    and    #$20                  ; 2
    beq    LF6A1                 ; 2³
    jsr    LFDFD                 ; 6
    jmp    LF6C4                 ; 3

LF6A1:
    lda    $EA,X                 ; 4
    and    #$40                  ; 2
    bne    LF6C4                 ; 2³
    lda    $EA,X                 ; 4
    ora    #$40                  ; 2
    sta    $EA,X                 ; 4
    lda    $EA                   ; 3
    and    $EB                   ; 3
    and    #$40                  ; 2
    beq    LF6BB                 ; 2³
    lda    $BC                   ; 3
    ora    #$40                  ; 2
    sta    $BC                   ; 3
LF6BB:
    jsr    LFDDB                 ; 6
    jmp    LF6C4                 ; 3

LF6C1:
    dey                          ; 2
    bpl    LF690                 ; 2³
LF6C4:
    dex                          ; 2
    bpl    LF68E                 ; 2³
LF6C7:
    lda    $E0                   ; 3
    and    #$40                  ; 2
    beq    LF6ED                 ; 2³
    dec    $DE                   ; 5
    bne    LF6ED                 ; 2³
    lda    $BC                   ; 3
    and    #$60                  ; 2
    bne    LF6ED                 ; 2³
    lda    $DD                   ; 3
    cmp    #$1E                  ; 2
    bcc    LF6E1                 ; 2³
    sbc    #4                    ; 2
    sta    $DD                   ; 3
LF6E1:
    sta    $DE                   ; 3
    lda    #$1E                  ; 2
    sta    $E1                   ; 3
    lda    $BC                   ; 3
    ora    #$02                  ; 2
    sta    $BC                   ; 3
LF6ED:
    jsr    LF8D5                 ; 6
    dec    $E3                   ; 5
    lda    $E0                   ; 3
    and    #$10                  ; 2
    beq    LF73B                 ; 2³+1
    ldx    #3                    ; 2
LF6FA:
    lda    $BC                   ; 3
    and    #$10                  ; 2
    bne    LF711                 ; 2³
    lda    INPT2,X               ; 4
    bpl    LF711                 ; 2³
    lda    #$AA                  ; 2
    sta    $C7,X                 ; 4
    lda    $E8,X                 ; 4
    and    #$F7                  ; 2
    sta    $E8,X                 ; 4
    jmp    LF734                 ; 3

LF711:
    lda    $E8,X                 ; 4
    and    #$08                  ; 2
    beq    LF71F                 ; 2³
    lda    $E1                   ; 3
    and    #$1F                  ; 2
    cmp    #$1F                  ; 2
    bne    LF731                 ; 2³
LF71F:
    lda    $D3,X                 ; 4
    sta    $D5,X                 ; 4
    lda    $CC,X                 ; 4
    sta    $CE,X                 ; 4
    lda    $C5,X                 ; 4
    sta    $C7,X                 ; 4
    lda    $E8,X                 ; 4
    ora    #$08                  ; 2
    sta    $E8,X                 ; 4
LF731:
    jsr    LFD50                 ; 6
LF734:
    dex                          ; 2
    cpx    #2                    ; 2
    bpl    LF6FA                 ; 2³+1
    bmi    LF764                 ; 2³
LF73B:
    lda    $BC                   ; 3
    and    #$20                  ; 2
    bne    LF764                 ; 2³
    lda    $E3                   ; 3
    and    #$07                  ; 2
    bne    LF764                 ; 2³
    lda    $E3                   ; 3
    and    #$C0                  ; 2
    beq    LF764                 ; 2³
    ldx    #6                    ; 2
    jsr    LFD50                 ; 6
    dex                          ; 2
    lda    #$40                  ; 2
    jsr    LFD3D                 ; 6
    dex                          ; 2
    jsr    LFD50                 ; 6
    dex                          ; 2
    jsr    LFD50                 ; 6
    dex                          ; 2
    jsr    LFD3B                 ; 6
LF764:
    lda    $E3                   ; 3
    eor    #$20                  ; 2
    sta    $E3                   ; 3
    jsr    LF945                 ; 6
    ldx    #1                    ; 2
LF76F:
    lda    $EC,X                 ; 4
    cmp    #1                    ; 2
    bne    LF77D                 ; 2³
    lda    #0                    ; 2
    sta    AUDC0,X               ; 4
    lda    #8                    ; 2
    sta    AUDV0,X               ; 4
LF77D:
    dex                          ; 2
    bpl    LF76F                 ; 2³
    ldx    #4                    ; 2
LF782:
    lda    $CE,X                 ; 4
    cpx    #2                    ; 2
    adc    #$18                  ; 2
    pha                          ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    sty    $F0                   ; 3
    pla                          ; 4
    and    #$0F                  ; 2
    clc                          ; 2
    adc    $F0                   ; 3
    cmp    #$0F                  ; 2
    bcc    LF79D                 ; 2³
    sbc    #$0F                  ; 2
    iny                          ; 2
LF79D:
    cmp    #8                    ; 2
    eor    #$0F                  ; 2
    bcs    LF7A6                 ; 2³
    adc    #1                    ; 2
    dey                          ; 2
LF7A6:
    asl                          ; 2
    sta    WSYNC                 ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0,X                ; 4
LF7AE:
    dey                          ; 2
    bpl    LF7AE                 ; 2³
    sta    RESP0,X               ; 4
    dex                          ; 2
    bpl    LF782                 ; 2³
    ldx    #1                    ; 2
LF7B8:
    lda    $EC,X                 ; 4
    cmp    #1                    ; 2
    bne    LF7C6                 ; 2³
    lda    #0                    ; 2
    sta    $EC,X                 ; 4
    sta    AUDV0,X               ; 4
    sta    $EE,X                 ; 4
LF7C6:
    dex                          ; 2
    bpl    LF7B8                 ; 2³
    lda    $BD                   ; 3
    and    #$03                  ; 2
    sta    $F1                   ; 3
    dec    $E1                   ; 5
    bne    LF7E7                 ; 2³
    lda    $BC                   ; 3
    and    #$DD                  ; 2
    sta    $BC                   ; 3
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    inc    $DC                   ; 5
    inc    $DC                   ; 5
    bne    LF7E7                 ; 2³
    inc    $DC                   ; 5
LF7E7:
    lda    $BC                   ; 3
    and    #$02                  ; 2
    beq    LF7F1                 ; 2³
    lda    #0                    ; 2
    sta    $F1                   ; 3
LF7F1:
    ldy    #2                    ; 2
    sty    $F2                   ; 3
    lda    $BC                   ; 3
    and    #$01                  ; 2
    bne    LF82B                 ; 2³+1
    lda    $BC                   ; 3
    and    #$10                  ; 2
    bne    LF831                 ; 2³
    lda    $BC                   ; 3
    and    #$60                  ; 2
    beq    LF831                 ; 2³
    cmp    #$20                  ; 2
    bne    LF822                 ; 2³
    lda    $DF                   ; 3
    and    #$94                  ; 2
    beq    LF822                 ; 2³
    lda    $E1                   ; 3
    and    #$04                  ; 2
    bne    LF82B                 ; 2³
    ldy    #1                    ; 2
    lda    $E3                   ; 3
    and    #$10                  ; 2
    beq    LF82B                 ; 2³
    dey                          ; 2
    bpl    LF82B                 ; 2³
LF822:
    ldy    #1                    ; 2
    lda    $CE                   ; 3
    cmp    #$9C                  ; 2
    bcc    LF82B                 ; 2³
    dey                          ; 2
LF82B:
    lda    #0                    ; 2
    sta    $F1                   ; 3
    sty    $F2                   ; 3
LF831:
    ldy    $F1                   ; 3
    ldx    #$0B                  ; 2
LF835:
    txa                          ; 2
    cmp    LFF19,Y               ; 4
    bcs    LF846                 ; 2³
    cmp    LFF1D,Y               ; 4
    bcc    LF846                 ; 2³
    lda    $B0,X                 ; 4
    ora    #$80                  ; 2
    bne    LF84A                 ; 2³
LF846:
    lda    $B0,X                 ; 4
    and    #$7F                  ; 2
LF84A:
    sta    $B0,X                 ; 4
    dex                          ; 2
    bpl    LF835                 ; 2³
    lda    $BC                   ; 3
    and    #$51                  ; 2
    beq    LF87D                 ; 2³
    ldx    #1                    ; 2
LF857:
    lda    $E6,X                 ; 4
    sta    $C2                   ; 3
    cmp    #$19                  ; 2
    beq    LF87A                 ; 2³
    lda    $E8,X                 ; 4
    sta    $C3                   ; 3
    jsr    LF9F1                 ; 6
    lda    $E1                   ; 3
    and    #$20                  ; 2
    beq    LF872                 ; 2³
    lda    $C4                   ; 3
    ora    ($C5),Y               ; 5
    bne    LF878                 ; 2³
LF872:
    lda    $C4                   ; 3
    eor    #$FF                  ; 2
    and    ($C5),Y               ; 5
LF878:
    sta    ($C5),Y               ; 6
LF87A:
    dex                          ; 2
    bpl    LF857                 ; 2³
LF87D:
    lda    SWCHB                 ; 4
    and    #$08                  ; 2
    tay                          ; 2
    beq    LF887                 ; 2³
    lda    #$F7                  ; 2
LF887:
    ora    #$07                  ; 2
    sta    $F3                   ; 3
    lda    $DC                   ; 3
    sta    $F4                   ; 3
    lsr                          ; 2
    bcs    LF89F                 ; 2³
    ldx    #$FF                  ; 2
    lda    $BC                   ; 3
    and    #$10                  ; 2
    bne    LF89C                 ; 2³
    stx    $F3                   ; 3
LF89C:
    inx                          ; 2
    stx    $F4                   ; 3
LF89F:
    ldx    #$FB                  ; 2
LF8A1:
    lda    LFEEB,Y               ; 4
    eor    $F4                   ; 3
    and    $F3                   ; 3
    sta    REFP0,X               ; 4
    sta    $C5,X                 ; 4
    iny                          ; 2
    inx                          ; 2
    bmi    LF8A1                 ; 2³
    jsr    LFE2C                 ; 6
    inx                          ; 2
    jsr    LFE2C                 ; 6
    lda    #$20                  ; 2
    sta    CTRLPF                ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    ldx    $F2                   ; 3
    lda    $C0,X                 ; 4
    sta    $C2                   ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
LF8C9:
    lda    INTIM                 ; 4
    bne    LF8C9                 ; 2³
    sta    WSYNC                 ; 3
    sta    VBLANK                ; 3
    jmp    LF100                 ; 3

LF8D5:
    sta    WSYNC                 ; 3
LF8D7:
    lda    INTIM                 ; 4
    bne    LF8D7                 ; 2³
    sta    WSYNC                 ; 3
    lda    #2                    ; 2
    sta    VBLANK                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    VSYNC                 ; 3
    jsr    LF8FD                 ; 6
    sta    WSYNC                 ; 3
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
    sta    VSYNC                 ; 3
    lda    #$3C                  ; 2
    sta    WSYNC                 ; 3
    sta    TIM64T                ; 4
    rts                          ; 6

LF8FD:
    lda    $BF                   ; 3
    sta    $C0                   ; 3
    lda    $BE                   ; 3
    sta    $C1                   ; 3
    asl    $C1                   ; 5
    rol    $C0                   ; 5
    asl    $C1                   ; 5
    rol    $C0                   ; 5
    lda    $BE                   ; 3
    ror                          ; 2
    ror                          ; 2
    and    #$80                  ; 2
    eor    $C0                   ; 3
    sta    $C0                   ; 3
    lda    $BE                   ; 3
    clc                          ; 2
    adc    $C1                   ; 3
    bcc    LF921                 ; 2³
    inc    $BF                   ; 5
    clc                          ; 2
LF921:
    adc    #$19                  ; 2
    sta    $BE                   ; 3
    lda    $BF                   ; 3
    adc    $C0                   ; 3
    clc                          ; 2
    adc    #$36                  ; 2
    sta    $BF                   ; 3
    clc                          ; 2
    adc    $BD                   ; 3
LF931:
    rts                          ; 6

LF932:
    sty    $F1                   ; 3
    jsr    LF8FD                 ; 6
    ldy    #0                    ; 2
    tya                          ; 2
LF93A:
    clc                          ; 2
    adc    $BF                   ; 3
    bcc    LF940                 ; 2³
    iny                          ; 2
LF940:
    dec    $F1                   ; 5
    bpl    LF93A                 ; 2³
    rts                          ; 6

LF945:
    lda    $E3                   ; 3
    and    #$20                  ; 2
    beq    LF966                 ; 2³
    lda    $DF                   ; 3
    and    #$10                  ; 2
    beq    LF966                 ; 2³
    ldx    #1                    ; 2
LF953:
    ldy    $C9,X                 ; 4
    lda    $CC,X                 ; 4
    sta    $C9,X                 ; 4
    sty    $CC,X                 ; 4
    ldy    $D0,X                 ; 4
    lda    $D3,X                 ; 4
    sta    $D0,X                 ; 4
    sty    $D3,X                 ; 4
    dex                          ; 2
    bpl    LF953                 ; 2³
LF966:
    rts                          ; 6

LF967:
    lda    $BD                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFF29,Y               ; 4
    sta    $DF                   ; 3
    lda    LFF39,Y               ; 4
    sta    $E0                   ; 3
    lda    $BD                   ; 3
    and    #$3F                  ; 2
    tay                          ; 2
    lda    #$94                  ; 2
    cpy    #$14                  ; 2
    beq    LF989                 ; 2³
    lda    #$D4                  ; 2
    cpy    #$18                  ; 2
    bne    LF98F                 ; 2³
LF989:
    sta    $DF                   ; 3
    lda    #0                    ; 2
    sta    $E0                   ; 3
LF98F:
    rts                          ; 6

LF990:
    sta    $C4                   ; 3
    lda    $CE,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    sta    $C3                   ; 3
    lda    $C7,X                 ; 4
    lsr                          ; 2
    sta    $C2                   ; 3
    lda    $C4                   ; 3
    jsr    LFA1F                 ; 6
    ldy    #1                    ; 2
LF9A4:
    lda.wy $E6,Y                 ; 4
    cmp    $C2                   ; 3
    bne    LF9B6                 ; 2³
    lda.wy $E8,Y                 ; 4
    cmp    $C3                   ; 3
    bne    LF9B6                 ; 2³
    lda    #0                    ; 2
    clc                          ; 2
    rts                          ; 6

LF9B6:
    dey                          ; 2
    bpl    LF9A4                 ; 2³
    lda    $C2                   ; 3
    cmp    #$17                  ; 2
    bcs    LF9DF                 ; 2³
    lda    $C3                   ; 3
    beq    LF9DF                 ; 2³
    cmp    #$26                  ; 2
    bcc    LF9F1                 ; 2³
    cpx    #2                    ; 2
    bcs    LF9DF                 ; 2³
    lda    $DF                   ; 3
    and    #$40                  ; 2
    bne    LF9DF                 ; 2³
    lda    $DF                   ; 3
    and    #$03                  ; 2
    beq    LF9F1                 ; 2³
    lda    $EA,X                 ; 4
    and    #$07                  ; 2
    cmp    #7                    ; 2
    beq    LF9F1                 ; 2³
LF9DF:
    sec                          ; 2
    lda    #$FF                  ; 2
    rts                          ; 6

LF9E3:
    lda    $C2                   ; 3
    cmp    #$17                  ; 2
    bcs    LF9DF                 ; 2³
    lda    $C3                   ; 3
    beq    LF9DF                 ; 2³
    cmp    $CB                   ; 3
    bcs    LF9DF                 ; 2³
LF9F1:
    ldy    $C3                   ; 3
    lda    LFEC1,Y               ; 4
    cpy    #$18                  ; 2
    bcc    LF9FD                 ; 2³
    lda    LFEAD,Y               ; 4
LF9FD:
    sta    $C4                   ; 3
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LFED9,Y               ; 4
    sta    $C5                   ; 3
    lda    $C2                   ; 3
    lsr                          ; 2
    tay                          ; 2
    lda    #0                    ; 2
    sta    $C6                   ; 3
    clc                          ; 2
    lda    $C4                   ; 3
    and    ($C5),Y               ; 5
    rts                          ; 6

LFA16:
    lda    $C9                   ; 3
LFA18:
    eor    #$80                  ; 2
    jmp    LFA1F                 ; 3

LFA1D:
    lda    $C9                   ; 3
LFA1F:
    asl                          ; 2
    bcs    LFA2A                 ; 2³
    bmi    LFA27                 ; 2³
    inc    $C3                   ; 5
    rts                          ; 6

LFA27:
    dec    $C2                   ; 5
    rts                          ; 6

LFA2A:
    bpl    LFA2F                 ; 2³
    inc    $C2                   ; 5
    rts                          ; 6

LFA2F:
    dec    $C3                   ; 5
    rts                          ; 6

LFA32:
    jsr    LF9E3                 ; 6
    bcs    LFA43                 ; 2³
    bne    LFA3D                 ; 2³
    lda    #$3F                  ; 2
    bne    LFA3F                 ; 2³
LFA3D:
    lda    #$7F                  ; 2
LFA3F:
    and    $BC                   ; 3
    sta    $BC                   ; 3
LFA43:
    rts                          ; 6

LFA44:
    lda    $BC                   ; 3
    ora    #$C0                  ; 2
    sta    $BC                   ; 3
    inc    $C2                   ; 5
    jsr    LFA32                 ; 6
    dec    $C2                   ; 5
    dec    $C2                   ; 5
    jsr    LFA32                 ; 6
    inc    $C2                   ; 5
    inc    $C3                   ; 5
    jsr    LFA32                 ; 6
    dec    $C3                   ; 5
    dec    $C3                   ; 5
    jsr    LFA32                 ; 6
    inc    $C3                   ; 5
    rts                          ; 6

LFA67:
    jsr    LF8FD                 ; 6
    and    #$0F                  ; 2
    cmp    #$0C                  ; 2
    bcs    LFA67                 ; 2³
    asl                          ; 2
    rts                          ; 6

LFA72:
    jsr    LF8FD                 ; 6
    and    #$1F                  ; 2
    cmp    #$13                  ; 2
    bcs    LFA72                 ; 2³
    sec                          ; 2
    rol                          ; 2
    rts                          ; 6

LFA7E:
    ldy    #0                    ; 2
    sty    AUDV0                 ; 3
    sty    AUDV1                 ; 3
    ldx    #$3B                  ; 2
    dey                          ; 2
LFA87:
    sty    $80,X                 ; 4
    dex                          ; 2
    bpl    LFA87                 ; 2³
    lda    $BF                   ; 3
    and    #$0F                  ; 2
    sta    $CE                   ; 3
    jsr    LFA67                 ; 6
    sta    $C2                   ; 3
    asl                          ; 2
    sta    $C7                   ; 3
    sta    $C8                   ; 3
    lda    #1                    ; 2
    sta    $C3                   ; 3
    sta    $D0                   ; 3
    sta    $CD                   ; 3
    lda    #6                    ; 2
    sta    $CF                   ; 3
    lda    #$28                  ; 2
    sta    $CB                   ; 3
    lda    #$0A                  ; 2
    sta    $D3                   ; 3
    ldx    #$10                  ; 2
    stx    $D4                   ; 3
LFAB4:
    lda    $C2                   ; 3
    sta    $D6,X                 ; 4
    lda    $C3                   ; 3
    sta    $E7,X                 ; 4
    dex                          ; 2
    bpl    LFAB4                 ; 2³
    jsr    LFC68                 ; 6
    lda    #$26                  ; 2
    sta    $CB                   ; 3
    lda    $C2                   ; 3
    sta    $D2                   ; 3
    lda    $C7                   ; 3
    lsr                          ; 2
    sta    $C2                   ; 3
    lda    #1                    ; 2
    sta    $C3                   ; 3
    lda    #$50                  ; 2
    sta    $CD                   ; 3
    jsr    LFC68                 ; 6
    ldx    #$10                  ; 2
    stx    $D5                   ; 3
LFADE:
    ldx    $D5                   ; 3
    lda    $D6,X                 ; 4
    sta    $C2                   ; 3
    lda    $E7,X                 ; 4
    sta    $C3                   ; 3
    lda    #$18                  ; 2
    sta    $CD                   ; 3
    jsr    LFC68                 ; 6
    dec    $D5                   ; 5
    bpl    LFADE                 ; 2³
    lda    #$FF                  ; 2
    sta    $D4                   ; 3
    lda    #$16                  ; 2
    sta    $D7                   ; 3
    lda    #$25                  ; 2
    sta    $D6                   ; 3
LFAFF:
    lda    $D7                   ; 3
    sta    $C2                   ; 3
    lda    $D6                   ; 3
    sta    $C3                   ; 3
    jsr    LFA44                 ; 6
    lda    $BC                   ; 3
    and    #$40                  ; 2
    beq    LFB56                 ; 2³
    jsr    LF8FD                 ; 6
    sta    $C9                   ; 3
    lsr                          ; 2
    lda    #$40                  ; 2
    bcs    LFB1C                 ; 2³
    lda    #$C0                  ; 2
LFB1C:
    sta    $D8                   ; 3
LFB1E:
    lda    $C9                   ; 3
    clc                          ; 2
    adc    $D8                   ; 3
    sta    $C9                   ; 3
    lda    $D7                   ; 3
    sta    $C2                   ; 3
    lda    $D6                   ; 3
    sta    $C3                   ; 3
LFB2D:
    jsr    LFA1D                 ; 6
    jsr    LFA1D                 ; 6
    jsr    LFA44                 ; 6
    lda    $BC                   ; 3
    and    #$80                  ; 2
    bne    LFB1E                 ; 2³
    lda    $BC                   ; 3
    and    #$40                  ; 2
    bne    LFB2D                 ; 2³
    lda    #5                    ; 2
    sta    $CD                   ; 3
    lda    $C9                   ; 3
    eor    #$80                  ; 2
    and    #$C0                  ; 2
    ora    #$01                  ; 2
    sta    $C9                   ; 3
    jsr    LFC77                 ; 6
    jmp    LFAFF                 ; 3

LFB56:
    dec    $D6                   ; 5
    dec    $D6                   ; 5
    bpl    LFAFF                 ; 2³+1
    lda    #$25                  ; 2
    sta    $D6                   ; 3
    dec    $D7                   ; 5
    dec    $D7                   ; 5
    bpl    LFAFF                 ; 2³+1
    lda    #0                    ; 2
    sta    $BC                   ; 3
    jsr    LF967                 ; 6
    lda    $DF                   ; 3
    and    #$03                  ; 2
    tay                          ; 2
    lda    LFF05,Y               ; 4
    sta    $EA                   ; 3
    sta    $EB                   ; 3
    lda    $D2                   ; 3
    jsr    LFB89                 ; 6
    lda    #0                    ; 2
    sta    $EC                   ; 3
    sta    $ED                   ; 3
    sta    $DC                   ; 3
    jmp    LF44E                 ; 3

LFB89:
    sta    $C4                   ; 3
    ldx    #4                    ; 2
    txa                          ; 2
LFB8E:
    sta    $CE,X                 ; 4
    dex                          ; 2
    bpl    LFB8E                 ; 2³
    lda    #$AA                  ; 2
    ldx    #4                    ; 2
LFB97:
    sta    $C9,X                 ; 4
    dex                          ; 2
    bpl    LFB97                 ; 2³
    ldx    #4                    ; 2
LFB9E:
    lda    $DF                   ; 3
    and    LFEF8,X               ; 4
    beq    LFBAE                 ; 2³
    lda    #$94                  ; 2
    sta    $D0,X                 ; 4
    lda    $C4                   ; 3
    asl                          ; 2
    sta    $C9,X                 ; 4
LFBAE:
    dex                          ; 2
    bpl    LFB9E                 ; 2³
    lda    $DF                   ; 3
    and    #$01                  ; 2
    beq    LFBD7                 ; 2³
    ldx    #1                    ; 2
    lda    #$54                  ; 2
LFBBB:
    sta    $D0,X                 ; 4
    jsr    LFA67                 ; 6
    asl                          ; 2
    sta    $C9,X                 ; 4
    lda    #$64                  ; 2
    dex                          ; 2
    bpl    LFBBB                 ; 2³
    lda    $DF                   ; 3
    and    #$02                  ; 2
    beq    LFBD7                 ; 2³
    lda    $C4                   ; 3
    asl                          ; 2
    sta    $CB                   ; 3
    lda    #$94                  ; 2
    sta    $D2                   ; 3
LFBD7:
    lda    #$80                  ; 2
    ldx    #6                    ; 2
LFBDB:
    sta    $D5,X                 ; 4
    dex                          ; 2
    bpl    LFBDB                 ; 2³
    ldx    #4                    ; 2
    jsr    LFD50                 ; 6
    jsr    LFD50                 ; 6
    jsr    LFD50                 ; 6
    jsr    LF8D5                 ; 6
    dex                          ; 2
    jsr    LFD50                 ; 6
    dex                          ; 2
    jsr    LFD3B                 ; 6
    jsr    LFD3B                 ; 6
    ldx    #0                    ; 2
    stx    $E4                   ; 3
    stx    $E5                   ; 3
    stx    $DD                   ; 3
    stx    $DE                   ; 3
    inx                          ; 2
    stx    $E3                   ; 3
    stx    VDELP0                ; 3
    stx    VDELBL                ; 3
    lda    $E0                   ; 3
    and    #$40                  ; 2
    beq    LFC16                 ; 2³
    lda    #$FA                  ; 2
    sta    $DD                   ; 3
    sta    $DE                   ; 3
LFC16:
    lda    #$19                  ; 2
    sta    $E6                   ; 3
    sta    $E7                   ; 3
    rts                          ; 6

LFC1D:
    jsr    LFA16                 ; 6
    jsr    LF9F1                 ; 6
    eor    ($C5),Y               ; 5
    sta    ($C5),Y               ; 6
    lda    $BF                   ; 3
    ora    #$02                  ; 2
    sta    COLUBK                ; 3
    jsr    LFA1D                 ; 6
    lda    $C3                   ; 3
    cmp    $D0                   ; 3
    bcc    LFC44                 ; 2³
    sta    $D0                   ; 3
    lda    $C2                   ; 3
    sta    $D1                   ; 3
    lda    #$40                  ; 2
    cmp    $CD                   ; 3
    bcc    LFC44                 ; 2³
    sta    $CD                   ; 3
LFC44:
    lda    $C3                   ; 3
    cmp    #$27                  ; 2
    bcs    LFC81                 ; 2³
    dec    $D3                   ; 5
    bne    LFC60                 ; 2³
    lda    #$0A                  ; 2
    sta    $D3                   ; 3
    ldx    $D4                   ; 3
    bmi    LFC60                 ; 2³
    lda    $C2                   ; 3
    sta    $D6,X                 ; 4
    lda    $C3                   ; 3
    sta    $E7,X                 ; 4
    dec    $D4                   ; 5
LFC60:
    dec    $C9                   ; 5
    lda    $C9                   ; 3
    and    #$03                  ; 2
    bne    LFC77                 ; 2³
LFC68:
    lda    $BF                   ; 3
    and    $CE                   ; 3
    tay                          ; 2
    jsr    LF8FD                 ; 6
    and    #$C0                  ; 2
    ora    LFF09,Y               ; 4
    sta    $C9                   ; 3
LFC77:
    dec    $CD                   ; 5
    bne    LFC96                 ; 2³
    lda    $CB                   ; 3
    cmp    #$28                  ; 2
    bcs    LFC82                 ; 2³
LFC81:
    rts                          ; 6

LFC82:
    dec    $CF                   ; 5
    bne    LFC96                 ; 2³
    lda    $D1                   ; 3
    sta    $C2                   ; 3
    lda    $D0                   ; 3
    sta    $C3                   ; 3
    inc    $CF                   ; 5
    lda    #$40                  ; 2
    sta    $CD                   ; 3
    bne    LFC68                 ; 2³
LFC96:
    lda    $C9                   ; 3
    sta    $CA                   ; 3
    lda    #$40                  ; 2
    bit    $BE                   ; 3
    bpl    LFCA2                 ; 2³
    lda    #$C0                  ; 2
LFCA2:
    sta    $CC                   ; 3
LFCA4:
    jsr    LFA1D                 ; 6
    jsr    LFA1D                 ; 6
    jsr    LFA44                 ; 6
    lda    $BC                   ; 3
    and    #$80                  ; 2
    bne    LFCBC                 ; 2³
    lda    $BC                   ; 3
    and    #$40                  ; 2
    beq    LFCBC                 ; 2³
    jmp    LFC1D                 ; 3

LFCBC:
    jsr    LFA16                 ; 6
    jsr    LFA16                 ; 6
    lda    $C9                   ; 3
    clc                          ; 2
    adc    $CC                   ; 3
    sta    $C9                   ; 3
    cmp    $CA                   ; 3
    bne    LFCA4                 ; 2³
    jsr    LF8FD                 ; 6
    sta    $CA                   ; 3
LFCD2:
    jsr    LFA1F                 ; 6
    jsr    LF9E3                 ; 6
    bcs    LFCDC                 ; 2³
    beq    LFCF3                 ; 2³
LFCDC:
    lda    $CA                   ; 3
    jsr    LFA18                 ; 6
    lda    $BF                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    lda    #$40                  ; 2
    bcc    LFCEC                 ; 2³
    lda    #$BF                  ; 2
LFCEC:
    adc    $CA                   ; 3
    sta    $CA                   ; 3
    jmp    LFCD2                 ; 3

LFCF3:
    lda    $CA                   ; 3
    jsr    LFA1F                 ; 6
    jmp    LFC68                 ; 3

LFCFB:
    lda.wy $C9,Y                 ; 4
    clc                          ; 2
    adc    #1                    ; 2
    cmp    $C7,X                 ; 4
    bcc    LFD1D                 ; 2³
    lda    $C7,X                 ; 4
    adc    #0                    ; 2
    cmp.wy $C9,Y                 ; 4
    bcc    LFD1D                 ; 2³
    lda.wy $D0,Y                 ; 4
    sbc    #3                    ; 2
    cmp    $CE,X                 ; 4
    bcs    LFD1C                 ; 2³
    adc    #5                    ; 2
    cmp    $CE,X                 ; 4
    rts                          ; 6

LFD1C:
    clc                          ; 2
LFD1D:
    rts                          ; 6


START:
    sei                          ; 2
    cld                          ; 2
    ldx    #0                    ; 2
    txa                          ; 2
LFD23:
    sta    VSYNC,X               ; 4
    inx                          ; 2
    bne    LFD23                 ; 2³
    dex                          ; 2
    txs                          ; 2
    lda    INTIM                 ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFFE5,Y               ; 4
    sta    $BF                   ; 3
    sta    TIM8T                 ; 4
    jmp    LFA7E                 ; 3

LFD3B:
    lda    #$C0                  ; 2
LFD3D:
    sta    $F1                   ; 3
    jsr    LFDBE                 ; 6
LFD42:
    lda    $D5,X                 ; 4
    clc                          ; 2
    adc    $F1                   ; 3
    sta    $D5,X                 ; 4
    jsr    LF990                 ; 6
    bne    LFD42                 ; 2³
    beq    LFD8B                 ; 2³
LFD50:
    jsr    LFDBE                 ; 6
    sta    $F1                   ; 3
    lda    #$FF                  ; 2
    sta    $F2                   ; 3
LFD59:
    lda    $D5,X                 ; 4
    clc                          ; 2
    adc    #$40                  ; 2
    sta    $D5,X                 ; 4
    cmp    $F1                   ; 3
    beq    LFD76                 ; 2³
    jsr    LF990                 ; 6
    bne    LFD59                 ; 2³
    inc    $F2                   ; 5
    lda    $F3                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    ora    $D5,X                 ; 4
    sta    $F3                   ; 3
    jmp    LFD59                 ; 3

LFD76:
    ldy    $F2                   ; 3
    bmi    LFD87                 ; 2³
    jsr    LF932                 ; 6
    lda    $F3                   ; 3
LFD7F:
    dey                          ; 2
    bmi    LFD87                 ; 2³
    asl                          ; 2
    asl                          ; 2
    jmp    LFD7F                 ; 3

LFD87:
    and    #$C0                  ; 2
    sta    $D5,X                 ; 4
LFD8B:
    lda    $D5,X                 ; 4
    ora    #$04                  ; 2
    sta    $D5,X                 ; 4
LFD91:
    dec    $D5,X                 ; 6
    lda    $D5,X                 ; 4
    asl                          ; 2
    bcs    LFDB4                 ; 2³
    bmi    LFDB1                 ; 2³
    inc    $CE,X                 ; 6
    inc    $CE,X                 ; 6
    lda    $CE,X                 ; 4
    cmp    #$9C                  ; 2
    bcc    LFDBD                 ; 2³
    lda    #$FF                  ; 2
    sta    $EC,X                 ; 4
    lda    #0                    ; 2
    sta    $EE,X                 ; 4
    lda    #$60                  ; 2
    jmp    LFDF4                 ; 3

LFDB1:
    dec    $C7,X                 ; 6
    rts                          ; 6

LFDB4:
    bpl    LFDB9                 ; 2³
    inc    $C7,X                 ; 6
    rts                          ; 6

LFDB9:
    dec    $CE,X                 ; 6
    dec    $CE,X                 ; 6
LFDBD:
    rts                          ; 6

LFDBE:
    lda    $C7,X                 ; 4
    cmp    #$2D                  ; 2
    bcc    LFDC7                 ; 2³
    pla                          ; 4
    pla                          ; 4
    rts                          ; 6

LFDC7:
    lda    $D5,X                 ; 4
    and    #$07                  ; 2
    beq    LFDD2                 ; 2³
    pla                          ; 4
    pla                          ; 4
    jmp    LFD91                 ; 3

LFDD2:
    lda    $D5,X                 ; 4
    eor    #$80                  ; 2
    and    #$C0                  ; 2
    sta    $D5,X                 ; 4
    rts                          ; 6

LFDDB:
    lda    $DF                   ; 3
    and    #$BF                  ; 2
    sta    $DF                   ; 3
    lda    #3                    ; 2
LFDE3:
    jsr    LFEA3                 ; 6
    lda    $E3                   ; 3
    and    #$EF                  ; 2
    cpx    #0                    ; 2
    bne    LFDF0                 ; 2³
    ora    #$10                  ; 2
LFDF0:
    sta    $E3                   ; 3
    lda    #$20                  ; 2
LFDF4:
    ora    $BC                   ; 3
    sta    $BC                   ; 3
    lda    #$40                  ; 2
    sta    $E1                   ; 3
LFDFC:
    rts                          ; 6

LFDFD:
    lda    $E4,X                 ; 4
    cmp    #$D2                  ; 2
    bcs    LFDFC                 ; 2³+1
    lda    #$FA                  ; 2
    sta    $E4,X                 ; 4
    lda    #2                    ; 2
    bne    LFDE3                 ; 2³+1
LFE0B:
    lda    #$15                  ; 2
    cpx    #0                    ; 2
    beq    LFE12                 ; 2³
    lsr                          ; 2
LFE12:
    sta    AUDF0,X               ; 4
    lda    $EE,X                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    sta    $F0                   ; 3
    lda    #$0C                  ; 2
    sta    AUDC0,X               ; 4
    sec                          ; 2
    sbc    $F0                   ; 3
    sta    AUDV0,X               ; 4
    inc    $EE,X                 ; 6
    lda    $EE,X                 ; 4
    cmp    #$28                  ; 2
    bcs    LFEA1                 ; 2³
    rts                          ; 6

LFE2C:
    lda    $DC                   ; 3
    lsr                          ; 2
    bcs    LFEA1                 ; 2³
    lda    $BC                   ; 3
    and    #$10                  ; 2
    bne    LFEA1                 ; 2³
    lda    $EC,X                 ; 4
    beq    LFE90                 ; 2³
    cmp    #$FF                  ; 2
    beq    LFEAC                 ; 2³
    cmp    #5                    ; 2
    beq    LFE0B                 ; 2³
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    and    #$07                  ; 2
    tay                          ; 2
    lda    LFF49,Y               ; 4
    sta    $F6                   ; 3
    lda    $EC,X                 ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    lda    $EE,X                 ; 4
    cpy    #3                    ; 2
    bne    LFE5B                 ; 2³
    lsr                          ; 2
LFE5B:
    clc                          ; 2
    adc    LFFE0,Y               ; 4
    tay                          ; 2
    lda    LFF4C,Y               ; 4
    bmi    LFE91                 ; 2³
    clc                          ; 2
    adc    $F6                   ; 3
    cpx    #0                    ; 2
    beq    LFE6D                 ; 2³
    lsr                          ; 2
LFE6D:
    sta    AUDF0,X               ; 4
    lda    $EC,X                 ; 4
    cmp    #3                    ; 2
    bne    LFE7B                 ; 2³
    lda    LFF6C,Y               ; 4
    jmp    LFE7D                 ; 3

LFE7B:
    lda    #8                    ; 2
LFE7D:
    sta    AUDV0,X               ; 4
    lda    $EC,X                 ; 4
    cmp    #3                    ; 2
    beq    LFE89                 ; 2³
    lda    #$0C                  ; 2
    bne    LFE8C                 ; 2³
LFE89:
    lda    LFFA7,Y               ; 4
LFE8C:
    sta    AUDC0,X               ; 4
    inc    $EE,X                 ; 6
LFE90:
    rts                          ; 6

LFE91:
    lda    $EC,X                 ; 4
    and    #$F0                  ; 2
    beq    LFEA1                 ; 2³
    lda    $EC,X                 ; 4
    sec                          ; 2
    sbc    #$20                  ; 2
    sta    $EC,X                 ; 4
    jmp    LFEA5                 ; 3

LFEA1:
    lda    #0                    ; 2
LFEA3:
    sta    $EC,X                 ; 4
LFEA5:
    lda    #0                    ; 2
    sta    $EE,X                 ; 4
    sta    AUDV0,X               ; 4
    rts                          ; 6

LFEAC:
    lda    $EE,X                 ; 4
    cmp    #$40                  ; 2
    bcs    LFEA1                 ; 2³
    jsr    LF8FD                 ; 6
    cpx    #0                    ; 2
    beq    LFEBB                 ; 2³
    and    #$07                  ; 2
LFEBB:
    sta    AUDF0,X               ; 4
    lda    #$0F                  ; 2
    bne    LFE7D                 ; 2³
LFEC1:
    bpl    LFEE3                 ; 2³
    rti                          ; 6

    .byte $80 ; |X       | $FEC4
    .byte $80 ; |X       | $FEC5
    .byte $40 ; | X      | $FEC6
    .byte $20 ; |  X     | $FEC7
    .byte $10 ; |   X    | $FEC8
    .byte $08 ; |    X   | $FEC9
    .byte $04 ; |     X  | $FECA
    .byte $02 ; |      X | $FECB
    .byte $01 ; |       X| $FECC
LFECD:
    .byte $01 ; |       X| $FECD
    .byte $02 ; |      X | $FECE
    .byte $04 ; |     X  | $FECF
    .byte $08 ; |    X   | $FED0
    .byte $10 ; |   X    | $FED1
    .byte $20 ; |  X     | $FED2
LFED3:
    .byte $40 ; | X      | $FED3
    .byte $80 ; |X       | $FED4
    .byte $01 ; |       X| $FED5
    .byte $02 ; |      X | $FED6
    .byte $04 ; |     X  | $FED7
    .byte $08 ; |    X   | $FED8
LFED9:
    .byte $80 ; |X       | $FED9
    .byte $8C ; |X   XX  | $FEDA
    .byte $8C ; |X   XX  | $FEDB
    .byte $98 ; |X  XX   | $FEDC
    .byte $98 ; |X  XX   | $FEDD
    .byte $80 ; |X       | $FEDE
    .byte $A4 ; |X X  X  | $FEDF
    .byte $A4 ; |X X  X  | $FEE0
    .byte $B0 ; |X XX    | $FEE1
    .byte $B0 ; |X XX    | $FEE2
LFEE3:
    .byte $C0 ; |XX      | $FEE3
    .byte $40 ; | X      | $FEE4
    .byte $80 ; |X       | $FEE5
    .byte $00 ; |        | $FEE6
LFEE7:
    .byte $42 ; | X    X | $FEE7
    .byte $41 ; | X     X| $FEE8
    .byte $43 ; | X    XX| $FEE9
    .byte $45 ; | X   X X| $FEEA
LFEEB:
    .byte $0F ; |    XXXX| $FEEB
    .byte $01 ; |       X| $FEEC
    .byte $02 ; |      X | $FEED
    .byte $0C ; |    XX  | $FEEE
    .byte $06 ; |     XX | $FEEF
    .byte $00 ; |        | $FEF0
    .byte $00 ; |        | $FEF1
    .byte $00 ; |        | $FEF2
    .byte $42 ; | X    X | $FEF3
    .byte $92 ; |X  X  X | $FEF4
    .byte $C4 ; |XX   X  | $FEF5
    .byte $00 ; |        | $FEF6
    .byte $26 ; |  X  XX | $FEF7
LFEF8:
    .byte $80 ; |X       | $FEF8
    .byte $80 ; |X       | $FEF9
    .byte $04 ; |     X  | $FEFA
    .byte $10 ; |   X    | $FEFB
    .byte $10 ; |   X    | $FEFC
LFEFD:
    .byte $49 ; | X  X  X| $FEFD
    .byte $09 ; |    X  X| $FEFE
    .byte $41 ; | X     X| $FEFF
    .byte $01 ; |       X| $FF00
    .byte $48 ; | X  X   | $FF01
    .byte $08 ; |    X   | $FF02
    .byte $40 ; | X      | $FF03
    .byte $00 ; |        | $FF04
LFF05:
    .byte $00 ; |        | $FF05
    .byte $04 ; |     X  | $FF06
    .byte $00 ; |        | $FF07
    .byte $00 ; |        | $FF08
LFF09:
    .byte $01 ; |       X| $FF09
    .byte $01 ; |       X| $FF0A
    .byte $02 ; |      X | $FF0B
    .byte $03 ; |      XX| $FF0C
    .byte $02 ; |      X | $FF0D
    .byte $02 ; |      X | $FF0E
    .byte $03 ; |      XX| $FF0F
    .byte $03 ; |      XX| $FF10
    .byte $01 ; |       X| $FF11
    .byte $03 ; |      XX| $FF12
    .byte $02 ; |      X | $FF13
    .byte $01 ; |       X| $FF14
    .byte $03 ; |      XX| $FF15
    .byte $01 ; |       X| $FF16
    .byte $01 ; |       X| $FF17
    .byte $01 ; |       X| $FF18
LFF19:
    .byte $00 ; |        | $FF19
    .byte $08 ; |    X   | $FF1A
    .byte $0A ; |    X X | $FF1B
    .byte $0F ; |    XXXX| $FF1C
LFF1D:
    .byte $01 ; |       X| $FF1D
    .byte $04 ; |     X  | $FF1E
    .byte $02 ; |      X | $FF1F
    .byte $00 ; |        | $FF20
LFF21:
    .byte $00 ; |        | $FF21
    .byte $04 ; |     X  | $FF22
    .byte $04 ; |     X  | $FF23
    .byte $24 ; |  X  X  | $FF24
    .byte $04 ; |     X  | $FF25
    .byte $24 ; |  X  X  | $FF26
    .byte $24 ; |  X  X  | $FF27
    .byte $44 ; | X   X  | $FF28
LFF29:
    .byte $00 ; |        | $FF29
    .byte $80 ; |X       | $FF2A
    .byte $84 ; |X    X  | $FF2B
    .byte $03 ; |      XX| $FF2C
    .byte $84 ; |X    X  | $FF2D
    .byte $00 ; |        | $FF2E
    .byte $00 ; |        | $FF2F
    .byte $03 ; |      XX| $FF30
    .byte $80 ; |X       | $FF31
    .byte $C0 ; |XX      | $FF32
    .byte $C4 ; |XX   X  | $FF33
    .byte $03 ; |      XX| $FF34
    .byte $80 ; |X       | $FF35
    .byte $03 ; |      XX| $FF36
    .byte $C4 ; |XX   X  | $FF37
    .byte $00 ; |        | $FF38
LFF39:
    .byte $40 ; | X      | $FF39
    .byte $04 ; |     X  | $FF3A
    .byte $04 ; |     X  | $FF3B
    .byte $40 ; | X      | $FF3C
    .byte $20 ; |  X     | $FF3D
    .byte $04 ; |     X  | $FF3E
    .byte $10 ; |   X    | $FF3F
    .byte $84 ; |X    X  | $FF40
    .byte $00 ; |        | $FF41
    .byte $00 ; |        | $FF42
    .byte $00 ; |        | $FF43
    .byte $C0 ; |XX      | $FF44
    .byte $24 ; |  X  X  | $FF45
    .byte $04 ; |     X  | $FF46
    .byte $40 ; | X      | $FF47
    .byte $00 ; |        | $FF48
LFF49:
    .byte $F8 ; |XXXXX   | $FF49
    .byte $FE ; |XXXXXXX | $FF4A
    .byte $00 ; |        | $FF4B
LFF4C:
    .byte $18 ; |   XX   | $FF4C
    .byte $1A ; |   XX X | $FF4D
    .byte $1C ; |   XXX  | $FF4E
    .byte $1E ; |   XXXX | $FF4F
    .byte $20 ; |  X     | $FF50
    .byte $22 ; |  X   X | $FF51
    .byte $20 ; |  X     | $FF52
    .byte $1E ; |   XXXX | $FF53
    .byte $1C ; |   XXX  | $FF54
    .byte $1A ; |   XX X | $FF55
    .byte $18 ; |   XX   | $FF56
    .byte $1A ; |   XX X | $FF57
    .byte $1C ; |   XXX  | $FF58
    .byte $1A ; |   XX X | $FF59
    .byte $18 ; |   XX   | $FF5A
    .byte $1A ; |   XX X | $FF5B
    .byte $1C ; |   XXX  | $FF5C
    .byte $1E ; |   XXXX | $FF5D
    .byte $20 ; |  X     | $FF5E
    .byte $1E ; |   XXXX | $FF5F
    .byte $1C ; |   XXX  | $FF60
    .byte $1A ; |   XX X | $FF61
    .byte $1C ; |   XXX  | $FF62
    .byte $1A ; |   XX X | $FF63
    .byte $1C ; |   XXX  | $FF64
    .byte $1A ; |   XX X | $FF65
    .byte $FF ; |XXXXXXXX| $FF66
    .byte $18 ; |   XX   | $FF67
    .byte $1A ; |   XX X | $FF68
    .byte $1C ; |   XXX  | $FF69
    .byte $1E ; |   XXXX | $FF6A
    .byte $20 ; |  X     | $FF6B
LFF6C:
    .byte $22 ; |  X   X | $FF6C
    .byte $24 ; |  X  X  | $FF6D
    .byte $26 ; |  X  XX | $FF6E
    .byte $24 ; |  X  X  | $FF6F
    .byte $22 ; |  X   X | $FF70
    .byte $20 ; |  X     | $FF71
    .byte $1E ; |   XXXX | $FF72
    .byte $1C ; |   XXX  | $FF73
    .byte $1A ; |   XX X | $FF74
    .byte $18 ; |   XX   | $FF75
    .byte $0A ; |    X X | $FF76
    .byte $0C ; |    XX  | $FF77
    .byte $0E ; |    XXX | $FF78
    .byte $10 ; |   X    | $FF79
    .byte $1A ; |   XX X | $FF7A
    .byte $14 ; |   X X  | $FF7B
    .byte $16 ; |   X XX | $FF7C
    .byte $14 ; |   X X  | $FF7D
    .byte $12 ; |   X  X | $FF7E
    .byte $10 ; |   X    | $FF7F
    .byte $0E ; |    XXX | $FF80
    .byte $0C ; |    XX  | $FF81
    .byte $0A ; |    X X | $FF82
    .byte $FF ; |XXXXXXXX| $FF83
    .byte $1F ; |   XXXXX| $FF84
    .byte $1D ; |   XXX X| $FF85
    .byte $1F ; |   XXXXX| $FF86
    .byte $1D ; |   XXX X| $FF87
    .byte $1B ; |   XX XX| $FF88
    .byte $1D ; |   XXX X| $FF89
    .byte $1B ; |   XX XX| $FF8A
    .byte $1D ; |   XXX X| $FF8B
    .byte $1B ; |   XX XX| $FF8C
    .byte $19 ; |   XX  X| $FF8D
    .byte $1B ; |   XX XX| $FF8E
    .byte $19 ; |   XX  X| $FF8F
    .byte $17 ; |   X XXX| $FF90
    .byte $15 ; |   X X X| $FF91
    .byte $17 ; |   X XXX| $FF92
    .byte $15 ; |   X X X| $FF93
    .byte $13 ; |   X  XX| $FF94
    .byte $15 ; |   X X X| $FF95
    .byte $13 ; |   X  XX| $FF96
    .byte $15 ; |   X X X| $FF97
    .byte $13 ; |   X  XX| $FF98
    .byte $11 ; |   X   X| $FF99
    .byte $13 ; |   X  XX| $FF9A
    .byte $11 ; |   X   X| $FF9B
    .byte $0F ; |    XXXX| $FF9C
    .byte $11 ; |   X   X| $FF9D
    .byte $0F ; |    XXXX| $FF9E
    .byte $0D ; |    XX X| $FF9F
    .byte $0F ; |    XXXX| $FFA0
    .byte $0D ; |    XX X| $FFA1
    .byte $0B ; |    X XX| $FFA2
    .byte $FF ; |XXXXXXXX| $FFA3
    .byte $0E ; |    XXX | $FFA4
    .byte $02 ; |      X | $FFA5
    .byte $00 ; |        | $FFA6
LFFA7:
    .byte $0D ; |    XX X| $FFA7
    .byte $0C ; |    XX  | $FFA8
    .byte $0E ; |    XXX | $FFA9
    .byte $02 ; |      X | $FFAA
    .byte $02 ; |      X | $FFAB
    .byte $01 ; |       X| $FFAC
    .byte $0A ; |    X X | $FFAD
    .byte $0D ; |    XX X| $FFAE
    .byte $04 ; |     X  | $FFAF
    .byte $07 ; |     XXX| $FFB0
    .byte $01 ; |       X| $FFB1
    .byte $0C ; |    XX  | $FFB2
    .byte $08 ; |    X   | $FFB3
    .byte $06 ; |     XX | $FFB4
    .byte $00 ; |        | $FFB5
    .byte $0E ; |    XXX | $FFB6
    .byte $0E ; |    XXX | $FFB7
    .byte $00 ; |        | $FFB8
    .byte $05 ; |     X X| $FFB9
    .byte $05 ; |     X X| $FFBA
    .byte $02 ; |      X | $FFBB
    .byte $02 ; |      X | $FFBC
    .byte $0A ; |    X X | $FFBD
    .byte $0D ; |    XX X| $FFBE
    .byte $0C ; |    XX  | $FFBF
    .byte $0F ; |    XXXX| $FFC0
    .byte $07 ; |     XXX| $FFC1
    .byte $07 ; |     XXX| $FFC2
    .byte $07 ; |     XXX| $FFC3
    .byte $07 ; |     XXX| $FFC4
    .byte $07 ; |     XXX| $FFC5
    .byte $07 ; |     XXX| $FFC6
    .byte $07 ; |     XXX| $FFC7
    .byte $07 ; |     XXX| $FFC8
    .byte $07 ; |     XXX| $FFC9
    .byte $03 ; |      XX| $FFCA
    .byte $03 ; |      XX| $FFCB
    .byte $08 ; |    X   | $FFCC
    .byte $08 ; |    X   | $FFCD
    .byte $08 ; |    X   | $FFCE
    .byte $08 ; |    X   | $FFCF
    .byte $08 ; |    X   | $FFD0
    .byte $08 ; |    X   | $FFD1
    .byte $08 ; |    X   | $FFD2
    .byte $08 ; |    X   | $FFD3
    .byte $08 ; |    X   | $FFD4
    .byte $08 ; |    X   | $FFD5
    .byte $08 ; |    X   | $FFD6
    .byte $08 ; |    X   | $FFD7
    .byte $08 ; |    X   | $FFD8
    .byte $08 ; |    X   | $FFD9
    .byte $09 ; |    X  X| $FFDA
    .byte $08 ; |    X   | $FFDB
    .byte $09 ; |    X  X| $FFDC
    .byte $08 ; |    X   | $FFDD
    .byte $09 ; |    X  X| $FFDE
    .byte $08 ; |    X   | $FFDF
LFFE0:
    .byte $00 ; |        | $FFE0
    .byte $00 ; |        | $FFE1
    .byte $00 ; |        | $FFE2
    .byte $1B ; |   XX XX| $FFE3
    .byte $38 ; |  XXX   | $FFE4
LFFE5:
    .byte $FF ; |XXXXXXXX| $FFE5
    .byte $01 ; |       X| $FFE6
    .byte $02 ; |      X | $FFE7
    .byte $03 ; |      XX| $FFE8
    .byte $04 ; |     X  | $FFE9
    .byte $05 ; |     X X| $FFEA
    .byte $06 ; |     XX | $FFEB
    .byte $07 ; |     XXX| $FFEC
    .byte $FE ; |XXXXXXX | $FFED
    .byte $09 ; |    X  X| $FFEE
    .byte $0A ; |    X X | $FFEF
    .byte $28 ; |  X X   | $FFF0
    .byte $FC ; |XXXXXX  | $FFF1
    .byte $FA ; |XXXXX X | $FFF2
    .byte $0E ; |    XXX | $FFF3
    .byte $0F ; |    XXXX| $FFF4
    .byte $10 ; |   X    | $FFF5
    .byte $F8 ; |XXXXX   | $FFF6
    .byte $12 ; |   X  X | $FFF7
    .byte $F6 ; |XXXX XX | $FFF8
    .byte $14 ; |   X X  | $FFF9
    .byte $15 ; |   X X X| $FFFA
    .byte $16 ; |   X XX | $FFFB
    .byte $1E ; |   XXXX | $FFFC
    .byte $FD ; |XXXXXX X| $FFFD
    .byte $FE ; |XXXXXXX | $FFFE
    .byte $1A ; |   XX X | $FFFF
