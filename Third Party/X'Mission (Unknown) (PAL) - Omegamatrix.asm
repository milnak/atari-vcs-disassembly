; Disassembly of xmishome.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasfcxmisnew.cfg xmishome.bin
;
; xmisnew.cfg contents:
;
;      ORG F000
;      CODE F000 F0FB
;      GFX F0FC F116
;      CODE F117 F129
;      GFX F12A F131
;      CODE F132 F3D9
;      GFX F3DA F3FF
;      CODE F400 F436
;      GFX F437 F452
;      CODE F453 F4C3
;      GFX F4C4 F4CC
;      CODE F4CD F7D4
;      GFX F7D5 F7D8
;      CODE F7D9 F983
;      GFX F984 F985
;      CODE F986 F9DA
;      GFX F9DB F9E2
;      CODE F9E3 FA4D
;      GFX FA4E FAC4
;      CODE FAC5 FB0A
;      GFX FB0B FB14
;      CODE FB15 FB79
;      GFX FB7A FDFF
;      CODE FE00 FE79
;      GFX FE7A FE89
;      CODE FE8A FF74
;      GFX FF75 FFFF

      processor 6502

VSYNC   =  $00
VBLANK  =  $01
WSYNC   =  $02
;RSYNC   =  $03
NUSIZ0  =  $04
NUSIZ1  =  $05
COLUP0  =  $06
COLUP1  =  $07
COLUPF  =  $08
COLUBK  =  $09
CTRLPF  =  $0A
;REFP1   =  $0C
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
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMM1    =  $23
HMBL    =  $24
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C

; Read TIA Baseline = $00
CXM0P   =  $00
CXM1P   =  $01
CXP0FB  =  $02
CXP1FB  =  $03
CXM0FB  =  $04
CXPPMM  =  $07
INPT4   =  $0C

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

       ORG $F000

START:
LF000:
    sei                          ; 2
    cld                          ; 2
    lda    #0                    ; 2
    tax                          ; 2
LF005:
    sta    VSYNC,X               ; 4
    txs                          ; 2
    inx                          ; 2
    bne    LF005                 ; 2³
    jsr    LFF10                 ; 6
LF00E:
    nop                          ; 2
    lda    $8E                   ; 3
    jsr    LFE8A                 ; 6
    ldx    #0                    ; 2
    jsr    LFEA9                 ; 6
    lda    $80                   ; 3
    and    #$01                  ; 2
    tay                          ; 2
    lda.wy $8B,Y                 ; 4
    sta    $D1                   ; 3
    lda.wy $8F,Y                 ; 4
    jsr    LFE8A                 ; 6
    inx                          ; 2
    jsr    LFEA9                 ; 6
    lda    $9B                   ; 3
    jsr    LFE8A                 ; 6
    inx                          ; 2
    jsr    LFEA9                 ; 6
    lda    $91                   ; 3
    jsr    LFE8A                 ; 6
    inx                          ; 2
    jsr    LFEA9                 ; 6
    lda    $92                   ; 3
    jsr    LFE8A                 ; 6
    inx                          ; 2
    jsr    LFEA9                 ; 6
    lda    #$25                  ; 2
    sta    NUSIZ0                ; 3
    lda    #$35                  ; 2
    sta    NUSIZ1                ; 3
    lda    #$31                  ; 2
    sta    CTRLPF                ; 3
    lda    #7                    ; 2
    sta    $98                   ; 3
    lda    #$0A                  ; 2
    sta    $97                   ; 3
    sta    $99                   ; 3
    lda    $F1                   ; 3
    sta    COLUP1                ; 3
    lda    $E0                   ; 3
    sta    COLUPF                ; 3
    lda    $80                   ; 3
    and    #$0F                  ; 2
    bne    LF085                 ; 2³
    lda    $CF                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    LF12A,Y               ; 4
    sta    COLUPF                ; 3
    sta    $E0                   ; 3
    jsr    LFE31                 ; 6
    and    #$07                  ; 2
    tay                          ; 2
    lda    LF12A,Y               ; 4
    sta    COLUP1                ; 3
    sta    $F1                   ; 3
LF085:
    lda    INTIM                 ; 4
    bne    LF085                 ; 2³
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    VBLANK                ; 3
    sta    $84                   ; 3
    sta    $83                   ; 3
    sta    $85                   ; 3
    ldx    #4                    ; 2
LF098:
    sta    WSYNC                 ; 3
    ldy    $F4                   ; 3
    lda    LFD00,Y               ; 4
    sta    PF0                   ; 3
    lda    LFD15,Y               ; 4
    sta    PF1                   ; 3
    lda    LFD2A,Y               ; 4
    sta    PF2                   ; 3
    dex                          ; 2
    bpl    LF098                 ; 2³
    lda    $D5                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    $D4                   ; 3
    and    #$10                  ; 2
    beq    LF0BB                 ; 2³
    ldy    #3                    ; 2
LF0BB:
    lda    LF0FC,Y               ; 4
    sta    $81                   ; 3
    lda    LF104,Y               ; 4
    sta    $82                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LF3DA,Y               ; 4
    sta    CTRLPF                ; 3
    lda    #0                    ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    cpy    #1                    ; 2
    bne    LF0F8                 ; 2³
    lda    $CE                   ; 3
    sta    COLUPF                ; 3
    ldy    #$FF                  ; 2
LF0DE:
    ldx    #5                    ; 2
    lda    #$A1                  ; 2
LF0E2:
    sta    WSYNC                 ; 3
    sta    COLUBK                ; 3
    dex                          ; 2
    bne    LF0E2                 ; 2³
    lda    $CE                   ; 3
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    COLUBK                ; 3
    sta    CXCLR                 ; 3
    sta    HMCLR                 ; 3
    sty    PF2                   ; 3
    jmp.ind ($0081)              ; 5
LF0F8:
    ldy    #0                    ; 2
    beq    LF0DE                 ; 2³
LF0FC:
    .byte $80 ; |X       | $F0FC
    .byte $80 ; |X       | $F0FD  $F180
    .byte $80 ; |X       | $F0FE  $F22E
    .byte $2E ; |  X XXX | $F0FF
    .byte $80 ; |X       | $F100
    .byte $2E ; |  X XXX | $F101
    .byte $80 ; |X       | $F102
    .byte $2E ; |  X XXX | $F103
LF104:
    .byte $F1 ; |XXXX   X| $F104
    .byte $F1 ; |XXXX   X| $F105
    .byte $F1 ; |XXXX   X| $F106
    .byte $F2 ; |XXXX  X | $F107
    .byte $F1 ; |XXXX   X| $F108
    .byte $F2 ; |XXXX  X | $F109
    .byte $F1 ; |XXXX   X| $F10A
    .byte $F2 ; |XXXX  X | $F10B
LF10C:
    .byte $00 ; |        | $F10C
    .byte $F2 ; |XXXX  X | $F10D
    .byte $F2 ; |XXXX  X | $F10E
    .byte $C2 ; |XX    X | $F10F
    .byte $C2 ; |XX    X | $F110
    .byte $42 ; | X    X | $F111
    .byte $42 ; | X    X | $F112
    .byte $12 ; |   X  X | $F113
    .byte $12 ; |   X  X | $F114
    .byte $D0 ; |XX X    | $F115
    .byte $D0 ; |XX X    | $F116
LF117:
    inx                          ; 2
    inx                          ; 2
    cpx    #$B4                  ; 2
    bcs    LF127                 ; 2³
    sta    LF000,Y               ; 5
LF120:
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    ldy    #0                    ; 2
    beq    LF176                 ; 2³
LF127:
    jmp    LF30C                 ; 3
LF12A:
    .byte $2A ; |  X X X | $F12A
    .byte $7A ; | XXXX X | $F12B
    .byte $99 ; |X  XX  X| $F12C
    .byte $4A ; | X  X X | $F12D
    .byte $3A ; |  XXX X | $F12E
    .byte $8A ; |X   X X | $F12F
    .byte $A6 ; |X X  XX | $F130
    .byte $69 ; | XX X  X| $F131
LF132:
    lda    #0                    ; 2
    beq    LF14A                 ; 2³
LF136:
    cpx    $D1                   ; 3
    bcc    LF144                 ; 2³
    ldy    $97                   ; 3
    bmi    LF144                 ; 2³
    lda    ($86),Y               ; 5
    sta    $84                   ; 3
    dec    $97                   ; 5
LF144:
    cpx    $9A                   ; 3
    bne    LF132                 ; 2³
    lda    $9C                   ; 3
LF14A:
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    sta    ENAM0                 ; 3
    lda    $84                   ; 3
    sta    GRP1                  ; 3
    jsr    LFEA7                 ; 6
    nop                          ; 2
    nop                          ; 2
    ldy    $E1                   ; 3
    lda    ($D6),Y               ; 5
    sta    HMBL                  ; 3
    inc    $E1                   ; 5
    cpx    $8A                   ; 3
    bcc    LF117                 ; 2³
    inx                          ; 2
    inx                          ; 2
    cpx    #$B4                  ; 2
    bcs    LF127                 ; 2³
    ldy    $98                   ; 3
    bmi    LF120                 ; 2³
    dec    $98                   ; 5
    lda    LFC10,Y               ; 4
    sta    COLUP0                ; 3
LF176:
    lda    ($88),Y               ; 5
    sta    GRP0                  ; 3
    dec    $82                   ; 5
    bne    LF18B                 ; 2³
    inc    $83                   ; 5

    lda    #7                    ; 2
    sta    $82                   ; 3
    ldy    $83                   ; 3
    lda.wy $9D,Y                 ; 4
    sta    $81                   ; 3
LF18B:
    cpx    $D1                   ; 3
    bcc    LF199                 ; 2³
    ldy    $97                   ; 3
    bmi    LF199                 ; 2³
    lda    ($86),Y               ; 5
    sta    $84                   ; 3
    dec    $97                   ; 5
LF199:
    cpx    $9A                   ; 3
    bne    LF1E6                 ; 2³
    lda    $9C                   ; 3
LF19F:
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    sta    ENAM0                 ; 3
    lda    $81                   ; 3
    sta    ENABL                 ; 3
    lda    $84                   ; 3
    sta    GRP1                  ; 3
    ldy    $E1                   ; 3
    lda    ($D6),Y               ; 5
    sta    HMBL                  ; 3
    inc    $E1                   ; 5
    lsr    $81                   ; 5
    cpx    $8D                   ; 3
    bcc    LF1EA                 ; 2³
    ldy    $99                   ; 3
    bmi    LF1ED                 ; 2³
    lda    LF10C,Y               ; 4
    sta    $85                   ; 3
    dec    $99                   ; 5
LF1C6:
    cpx    $8A                   ; 3
    bcc    LF1F5                 ; 2³
    ldy    $98                   ; 3
    bmi    LF1F8                 ; 2³
    lda    ($88),Y               ; 5
    sta    GRP0                  ; 3
    lda    LFC10,Y               ; 4
    sta    COLUP0                ; 3
    dec    $98                   ; 5
LF1D9:
    lda    $85                   ; 3
    sta    ENAM1                 ; 3
    sta    HMM1                  ; 3
    inx                          ; 2
    inx                          ; 2
    nop                          ; 2
    nop                          ; 2
    jmp    LF136                 ; 3

LF1E6:
    lda    #0                    ; 2
    beq    LF19F                 ; 2³

LF1EA:
    nop                          ; 2
    lda    $85                   ; 3
LF1ED:
    lda    $85                   ; 3
    lda    #0                    ; 2
    sta    $85                   ; 3
    beq    LF1C6                 ; 2³

LF1F5:
    nop                          ; 2
    lda    $85                   ; 3
LF1F8:
    ora    ($80,X)               ; 6
    nop                          ; 2
    lda    $85                   ; 3
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    beq    LF1D9                 ; 2³+1

    jmp    LF30C                 ; 3
    rts                          ; 6

LF207:
    nop                          ; 2
    lda    $85                   ; 3
LF20A:
    asl    LF000,X               ; 7
    lda    #0                    ; 2
    beq    LF23C                 ; 2³

LF211:
    lda    #0                    ; 2
    beq    LF249                 ; 2³

LF215:
    nop                          ; 2
    lda    $85                   ; 3
LF218:
    lda    $85                   ; 3
    lda    #0                    ; 2
    sta    $85                   ; 3
    beq    LF271                 ; 2³

LF220:
    nop                          ; 2
    lda    $85                   ; 3
LF223:
    ora    ($80,X)               ; 6
    nop                          ; 2
    lda    $85                   ; 3
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    beq    LF288                 ; 2³

LF22E:
    cpx    $D1                   ; 3
    bcc    LF207                 ; 2³
    ldy    $97                   ; 3
    bmi    LF20A                 ; 2³
    lda    ($86),Y               ; 5
    sta    $84                   ; 3
    dec    $97                   ; 5
LF23C:
    lsr    LF000                 ; 6
    lda    #0                    ; 2
    sta    PF2                   ; 3
    cpx    $9A                   ; 3
    bne    LF211                 ; 2³
    lda    $9C                   ; 3
LF249:
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    sta    ENAM0                 ; 3
    lda    $84                   ; 3
    sta    GRP1                  ; 3
    ldy    $83                   ; 3
    lda    LFBCE,Y               ; 4
    sta    PF1                   ; 3
    lda.wy $9D,Y                 ; 4
    sta    PF2                   ; 3
    nop                          ; 2
    sta    $82                   ; 3
    cpx    $8D                   ; 3
    bcc    LF215                 ; 2³
    ldy    $99                   ; 3
    bmi    LF218                 ; 2³
    lda    LF10C,Y               ; 4
    sta    $85                   ; 3
    dec    $99                   ; 5
LF271:
    lda    #0                    ; 2
    sta    PF2                   ; 3
    cpx    $8A                   ; 3
    bcc    LF220                 ; 2³
    ldy    $98                   ; 3
    bmi    LF223                 ; 2³
    lda    ($88),Y               ; 5
    sta    GRP0                  ; 3
    lda    LFC10,Y               ; 4
    sta    COLUP0                ; 3
    dec    $98                   ; 5
LF288:
    lda    $85                   ; 3
    sta    ENAM1                 ; 3
    sta    HMM1                  ; 3
    inx                          ; 2
    inx                          ; 2
    lda    $82                   ; 3
    sta    PF2                   ; 3
    cpx    $D1                   ; 3
    bcc    LF2EF                 ; 2³
    ldy    $97                   ; 3
    bmi    LF2F2                 ; 2³
    lda    ($86),Y               ; 5
    sta    $84                   ; 3
    dec    $97                   ; 5
LF2A2:
    lda    #0                    ; 2
    sta    PF2                   ; 3
    cpx    $9A                   ; 3
    bne    LF2F9                 ; 2³
    lda    $9C                   ; 3
LF2AC:
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    sta    ENAM0                 ; 3
    lda    $84                   ; 3
    sta    GRP1                  ; 3
    ldy    $83                   ; 3
    lda    LFB9C,Y               ; 4
    sta    PF0                   ; 3
    lda    $82                   ; 3
    sta    PF2                   ; 3
    cpx    $8A                   ; 3
    bcc    LF2FD                 ; 2³
    inx                          ; 2
    inx                          ; 2
    cpx    #$B4                  ; 2
    bcs    LF2EC                 ; 2³
    ldy    $98                   ; 3
    bmi    LF306                 ; 2³+1
    dec    $98                   ; 5
    lda    LFC10,Y               ; 4
    sta    $81                   ; 3
LF2D6:
    lda    #0                    ; 2
    sta    PF2                   ; 3
    lda    ($88),Y               ; 5
    tay                          ; 2
    inc    $83                   ; 5
    lda    $81                   ; 3
    sta    COLUP0                ; 3
    sty    GRP0                  ; 3
    lda    $82                   ; 3
    sta    PF2                   ; 3
    jmp    LF22E                 ; 3

LF2EC:
    jmp    LF30C                 ; 3

LF2EF:
    nop                          ; 2
    lda    $85                   ; 3
LF2F2:
    asl    LF000,X               ; 7
    lda    #0                    ; 2
    beq    LF2A2                 ; 2³

LF2F9:
    lda    #0                    ; 2
    beq    LF2AC                 ; 2³

LF2FD:
    inx                          ; 2
    inx                          ; 2
    cpx    #$B4                  ; 2
    bcs    LF2EC                 ; 2³+1
    sta    LF000,Y               ; 5
LF306:
    nop                          ; 2
    nop                          ; 2
    ldy    #0                    ; 2
    beq    LF2D6                 ; 2³+1

LF30C:
    ldx    #5                    ; 2
LF30E:
    sta    WSYNC                 ; 3
;-------------------------------------
    lda    #$A1                  ; 2
    sta    COLUBK                ; 3
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    ENABL                 ; 3
    sta    ENAM1                 ; 3
    sta    ENAM0                 ; 3
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    dex                          ; 2
    bne    LF30E                 ; 2³

    stx    WSYNC                 ; 3
;-------------------------------------
    stx    COLUBK                ; 3
    jsr    LFEA4                 ; 6
    jsr    LFEA7                 ; 6
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    lda    #$10                  ; 2
    sta    HMP0                  ; 3
    lda    #$20                  ; 2
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;-------------------------------------
    sta    HMOVE                 ; 3
    lda    #7                    ; 2
    sta    $81                   ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    lda    #0                    ; 2
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$1A                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
LF35D:
    ldy    $81                   ; 3
    lda    ($E3),Y               ; 5
    sta    $84                   ; 3
    sta    WSYNC                 ; 3
    lda    ($E5),Y               ; 5
    tax                          ; 2
    lda    ($ED),Y               ; 5
    nop                          ; 2
    sta    GRP0                  ; 3
    lda    ($EB),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($E9),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($E7),Y               ; 5
    ldy    $84                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    $81                   ; 5
    bpl    LF35D                 ; 2³
    sta    WSYNC                 ; 3
    lda    #0                    ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    ora    ($80,X)               ; 6
    sta    RESP0                 ; 3
    jsr    LFEA7                 ; 6
    sta    RESP1                 ; 3
    lda    #0                    ; 2
    sta    HMP0                  ; 3
    lda    #$30                  ; 2
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    $F2                   ; 3
    sta    NUSIZ0                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    NUSIZ1                ; 3
    ldy    #7                    ; 2
LF3B1:
    sta    WSYNC                 ; 3
    bit    $F2                   ; 3
    bpl    LF3D2                 ; 2³
    lda    LFC00,Y               ; 4
LF3BA:
    sta    GRP0                  ; 3
    lda    LFC10,Y               ; 4
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    bit    $F2                   ; 3
    bvc    LF3D6                 ; 2³
    lda    LFC00,Y               ; 4
LF3CA:
    sta    GRP1                  ; 3
    dey                          ; 2
    bpl    LF3B1                 ; 2³
    jmp    LF400                 ; 3
LF3D2:
    lda    #0                    ; 2
    beq    LF3BA                 ; 2³
LF3D6:
    lda    #0                    ; 2
    beq    LF3CA                 ; 2³
LF3DA:
    .byte $31 ; |  XX   X| $F3DA
    .byte $35 ; |  XX X X| $F3DB
    .byte $31 ; |  XX   X| $F3DC
    .byte $30 ; |  XX    | $F3DD
    .byte $31 ; |  XX   X| $F3DE
    .byte $30 ; |  XX    | $F3DF
    .byte $31 ; |  XX   X| $F3E0
    .byte $30 ; |  XX    | $F3E1
    .byte $65 ; | XX  X X| $F3E2
    .byte $C5 ; |XX   X X| $F3E3
    .byte $AE ; |X X XXX | $F3E4
    .byte $A5 ; |X X  X X| $F3E5
    .byte $66 ; | XX  XX | $F3E6
    .byte $E5 ; |XXX  X X| $F3E7
    .byte $AF ; |X X XXXX| $F3E8
    .byte $90 ; |X  X    | $F3E9
    .byte $06 ; |     XX | $F3EA
    .byte $A2 ; |X X   X | $F3EB
    .byte $87 ; |X    XXX| $F3EC
    .byte $4C ; | X  XX  | $F3ED
    .byte $AC ; |X X XX  | $F3EE
    .byte $1E ; |   XXXX | $F3EF
    .byte $38 ; |  XXX   | $F3F0
    .byte $60 ; | XX     | $F3F1
    .byte $2C ; |  X XX  | $F3F2
    .byte $10 ; |   X    | $F3F3
    .byte $C0 ; |XX      | $F3F4
    .byte $A9 ; |X X X  X| $F3F5
    .byte $17 ; |   X XXX| $F3F6
    .byte $85 ; |X    X X| $F3F7
    .byte $AA ; |X X X X | $F3F8
    .byte $A9 ; |X X X  X| $F3F9
    .byte $20 ; |  X     | $F3FA
    .byte $85 ; |X    X X| $F3FB
    .byte $AB ; |X X X XX| $F3FC
    .byte $A2 ; |X X   X | $F3FD
    .byte $1A ; |   XX X | $F3FE
    .byte $20 ; |  X     | $F3FF
LF400:
    lda    #$33                  ; 2
    sta    TIM64T                ; 4
    lda    $9C                   ; 3
    and    #$01                  ; 2
    beq    LF460                 ; 2³
    lda    $F5                   ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    cpx    #$0A                  ; 2
    bcs    LF434                 ; 2³
    lda    $F0                   ; 3
    cmp    LF449,X               ; 4
    bcc    LF434                 ; 2³
    beq    LF453                 ; 2³
LF41D:
    lda    $F5                   ; 3
    and    #$F0                  ; 2
    sta    $F5                   ; 3
    inx                          ; 2
    txa                          ; 2
    ora    $F5                   ; 3
    sta    $F5                   ; 3
    ldy    $F3                   ; 3
    iny                          ; 2
    cpy    #6                    ; 2
    bcc    LF432                 ; 2³
    ldy    #6                    ; 2
LF432:
    sty    $F3                   ; 3
LF434:
    jmp    LF45A                 ; 3
LF437:
    .byte $F4 ; |XXXX X  | $F437
    .byte $E8 ; |XXX X   | $F438
    .byte $D0 ; |XX X    | $F439
    .byte $B8 ; |X XXX   | $F43A
    .byte $A0 ; |X X     | $F43B
    .byte $88 ; |X   X   | $F43C
    .byte $58 ; | X XX   | $F43D
    .byte $28 ; |  X X   | $F43E
    .byte $F8 ; |XXXXX   | $F43F
    .byte $98 ; |X  XX   | $F440
LF441:
    .byte $7F ; | XXXXXXX| $F441
    .byte $7F ; | XXXXXXX| $F442
    .byte $7F ; | XXXXXXX| $F443
    .byte $FF ; |XXXXXXXX| $F444
    .byte $7F ; | XXXXXXX| $F445
    .byte $FF ; |XXXXXXXX| $F446
    .byte $7F ; | XXXXXXX| $F447
    .byte $7F ; | XXXXXXX| $F448
LF449:
    .byte $01 ; |       X| $F449
    .byte $03 ; |      XX| $F44A
    .byte $07 ; |     XXX| $F44B
    .byte $0B ; |    X XX| $F44C
    .byte $0F ; |    XXXX| $F44D
    .byte $13 ; |   X  XX| $F44E
    .byte $1B ; |   XX XX| $F44F
    .byte $23 ; |  X   XX| $F450
    .byte $2B ; |  X X XX| $F451
    .byte $3B ; |  XXX XX| $F452
LF453:
    lda    $EF                   ; 3
    cmp    LF437,X               ; 4
    bcs    LF41D                 ; 2³
LF45A:
    jsr    LFAC5                 ; 6
    jsr    LFEB3                 ; 6
LF460:
    ldx    #3                    ; 2
    lda    $D4                   ; 3
    and    #$10                  ; 2
    bne    LF496                 ; 2³
    lda    $D5                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    $80                   ; 3
    and    LF441,Y               ; 4
    bne    LF484                 ; 2³
    ldy    $F4                   ; 3
    iny                          ; 2
    cpy    #$14                  ; 2
    bcc    LF482                 ; 2³
    ldx    #0                    ; 2
    jsr    LF99F                 ; 6
    ldy    #$14                  ; 2
LF482:
    sty    $F4                   ; 3
LF484:
    lda    $D5                   ; 3
    and    #$08                  ; 2
    beq    LF490                 ; 2³
    lda    $80                   ; 3
    and    #$03                  ; 2
    bne    LF493                 ; 2³
LF490:
    jsr    LFE45                 ; 6
LF493:
    jmp    LF4A3                 ; 3
LF496:
    ldy    $91                   ; 3
    dey                          ; 2
    cpy    #1                    ; 2
    bcs    LF49F                 ; 2³
    ldy    #$A1                  ; 2
LF49F:
    sty    $91                   ; 3
    bne    LF490                 ; 2³
LF4A3:
    nop                          ; 2
    ldx    #3                    ; 2
    jsr    LF99F                 ; 6
    lda    $F5                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    $D5                   ; 3
    and    #$07                  ; 2
    cmp    #2                    ; 2
    bne    LF4CD                 ; 2³
    lda    $80                   ; 3
    and    LF4C5,Y               ; 4
    bne    LF4C1                 ; 2³
    dec    $E2                   ; 5
LF4C1:
    jmp    LF4DF                 ; 3
LF4C4:
    .byte $0F ; |    XXXX| $F4C4
LF4C5:
    .byte $0F ; |    XXXX| $F4C5
    .byte $07 ; |     XXX| $F4C6
    .byte $03 ; |      XX| $F4C7
    .byte $01 ; |       X| $F4C8
    .byte $00 ; |        | $F4C9
    .byte $00 ; |        | $F4CA
    .byte $00 ; |        | $F4CB
    .byte $00 ; |        | $F4CC
LF4CD:
    lda    $80                   ; 3
    and    LF4C4,Y               ; 4
    bne    LF4DF                 ; 2³
    ldy    $92                   ; 3
    iny                          ; 2
    cpy    #$A1                  ; 2
    bcc    LF4DD                 ; 2³
    ldy    #1                    ; 2
LF4DD:
    sty    $92                   ; 3
LF4DF:
    lda    #$18                  ; 2
    sta    $84                   ; 3
    lda    #$FC                  ; 2
    sta    $85                   ; 3
    jsr    LF986                 ; 6
    lda    $D5                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    $80                   ; 3
    and    #$01                  ; 2
    bne    LF504                 ; 2³+1
    lda    LFAA5,Y               ; 4
    sta    $84                   ; 3
    lda    LFAAD,Y               ; 4
    sta    $85                   ; 3
    jsr    LF992                 ; 6
    bne    LF511                 ; 2³
LF504:
    lda    LFAB5,Y               ; 4
    sta    $84                   ; 3
    lda    LFABD,Y               ; 4
    sta    $85                   ; 3
    jsr    LF992                 ; 6
LF511:
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcs    LF53F                 ; 2³
    lda    #0                    ; 2
    sta    $D5                   ; 3
    sta    $EF                   ; 3
    sta    $F0                   ; 3
    sta    $F5                   ; 3
    lda    #3                    ; 2
    sta    $F3                   ; 3
LF525:
    ldx    #1                    ; 2
    stx    $9C                   ; 3
LF529:
    ldx    #0                    ; 2
    stx    AUDV0                 ; 3
    stx    AUDV1                 ; 3
    stx    $E2                   ; 3
    stx    $D4                   ; 3
    lda    $D5                   ; 3
    and    #$07                  ; 2
    sta    $D5                   ; 3
    jsr    LFF23                 ; 6
    jmp    LF925                 ; 3
LF53F:
    lda    $9C                   ; 3
    and    #$9F                  ; 2
    cmp    #2                    ; 2
    beq    LF5B3                 ; 2³
    cmp    #3                    ; 2
    beq    LF5B3                 ; 2³
    bit    $9C                   ; 3
    bpl    LF5C3                 ; 2³
    lda    CXM0FB                ; 3
    and    #$C0                  ; 2
    beq    LF55D                 ; 2³
    lda    $D5                   ; 3
    and    #$07                  ; 2
    cmp    #1                    ; 2
    bne    LF572                 ; 2³
LF55D:
    lda    $9B                   ; 3
    sbc    #8                    ; 2
    tay                          ; 2
    sty    $9B                   ; 3
    cpy    #$F0                  ; 2
    bcc    LF59F                 ; 2³
LF568:
    lda    $9C                   ; 3
    and    #$01                  ; 2
    ora    #$04                  ; 2
    sta    $9C                   ; 3
    bne    LF59F                 ; 2³
LF572:
    lda    $9A                   ; 3
    sta    $81                   ; 3
    lda    #$F0                  ; 2
    sta    $82                   ; 3
    lda    $D5                   ; 3
    and    #$07                  ; 2
    cmp    #3                    ; 2
    beq    LF5A2                 ; 2³
    cmp    #5                    ; 2
    beq    LF5A2                 ; 2³
    cmp    #7                    ; 2
    beq    LF5A2                 ; 2³
    jsr    LFE00                 ; 6
LF58D:
    lda    $9C                   ; 3
    and    #$01                  ; 2
    ora    #$02                  ; 2
    sta    $9C                   ; 3
    ldx    #6                    ; 2
    jsr    LF99F                 ; 6
    lda    #5                    ; 2
    jsr    LFAFB                 ; 6
LF59F:
    jmp    LF5E4                 ; 3
LF5A2:
    lda    $9B                   ; 3
    sta    $82                   ; 3
    jsr    LFB48                 ; 6
    bit    $82                   ; 3
    bpl    LF55D                 ; 2³
    jsr    LFB15                 ; 6
    jmp    LF58D                 ; 3
LF5B3:
    ldy    $9B                   ; 3
    iny                          ; 2
    iny                          ; 2
    sty    $9B                   ; 3
    lda    $8E                   ; 3
    adc    #$10                  ; 2
    cmp    $9B                   ; 3
    bcc    LF568                 ; 2³
    bcs    LF59F                 ; 2³
LF5C3:
    lda    $9C                   ; 3
    and    #$01                  ; 2
    beq    LF5CD                 ; 2³
    bit    INPT4                 ; 3
    bmi    LF59F                 ; 2³
LF5CD:
    lda    $9C                   ; 3
    ora    #$82                  ; 2
    sta    $9C                   ; 3
    ldx    #5                    ; 2
    jsr    LF99F                 ; 6
    lda    $8A                   ; 3
    adc    #5                    ; 2
    sta    $9A                   ; 3
    lda    $8E                   ; 3
    sbc    #3                    ; 2
    sta    $9B                   ; 3
LF5E4:
    lda    $9C                   ; 3
    eor    #$01                  ; 2
    bne    LF5ED                 ; 2³
    jmp    LF525                 ; 3
LF5ED:
    nop                          ; 2
    lda    CXP1FB                ; 3
    and    #$C0                  ; 2
    beq    LF61C                 ; 2³+1
    lda    $D1                   ; 3
    sta    $81                   ; 3
    lda    #0                    ; 2
    sta    $82                   ; 3
    lda    $D5                   ; 3
    and    #$07                  ; 2
    cmp    #1                    ; 2
    beq    LF617                 ; 2³
    cmp    #3                    ; 2
    beq    LF62B                 ; 2³
    cmp    #5                    ; 2
    beq    LF62B                 ; 2³
    cmp    #7                    ; 2
    beq    LF62B                 ; 2³
    jsr    LFE00                 ; 6
    bit    $82                   ; 3
    bpl    LF61C                 ; 2³
LF617:
    ldx    #2                    ; 2
    jsr    LF99F                 ; 6
LF61C:
    lda    $D4                   ; 3
    and    #$01                  ; 2
    bne    LF663                 ; 2³
    lda    $D4                   ; 3
    and    #$10                  ; 2
    beq    LF63D                 ; 2³
    jmp    LF789                 ; 3
LF62B:
    lda    $80                   ; 3
    and    #$01                  ; 2
    tay                          ; 2
    lda.wy $8F,Y                 ; 4
    cmp    #$21                  ; 2
    bcc    LF61C                 ; 2³
    cmp    #$4F                  ; 2
    bcs    LF61C                 ; 2³
    bcc    LF617                 ; 2³
LF63D:
    bit    CXM1P                 ; 3
    bpl    LF663                 ; 2³
    lda    $9C                   ; 3
    and    #$01                  ; 2
    ora    #$04                  ; 2
    sta    $9C                   ; 3
    lda    #0                    ; 2
    sta    $D4                   ; 3
    lda    $8D                   ; 3
    adc    #$0C                  ; 2
    cmp    $8A                   ; 3
    bcs    LF675                 ; 2³
    adc    #8                    ; 2
    cmp    $8A                   ; 3
    bcc    LF675                 ; 2³
    ldx    #4                    ; 2
    jsr    LF99F                 ; 6
    jmp    LF789                 ; 3
LF663:
    lda    $9C                   ; 3
    and    #$01                  ; 2
    beq    LF67D                 ; 2³
    bit    CXM0P                 ; 3
    bvs    LF675                 ; 2³
    bit    CXPPMM                ; 3
    bmi    LF675                 ; 2³
    bit    CXP0FB                ; 3
    bvc    LF67D                 ; 2³
LF675:
    ldx    #0                    ; 2
    jsr    LF99F                 ; 6
    jmp    LF6B2                 ; 3
LF67D:
    bit    CXM0P                 ; 3
    bpl    LF6B2                 ; 2³
    lda    $D1                   ; 3
    adc    #$14                  ; 2
    cmp    $9A                   ; 3
    bcc    LF6B2                 ; 2³
    ldx    #1                    ; 2
    jsr    LF99F                 ; 6
    lda    $9C                   ; 3
    and    #$01                  ; 2
    ora    #$04                  ; 2
    sta    $9C                   ; 3
    lda    $80                   ; 3
    and    #$01                  ; 2
    bne    LF6AC                 ; 2³
    lda    $D5                   ; 3
    ora    #$20                  ; 2
LF6A0:
    sta    $D5                   ; 3
    bmi    LF6B2                 ; 2³
    and    #$07                  ; 2
    ora    #$80                  ; 2
    sta    $D5                   ; 3
    bne    LF6B2                 ; 2³
LF6AC:
    lda    $D5                   ; 3
    ora    #$40                  ; 2
    bne    LF6A0                 ; 2³
LF6B2:
    ldx    #0                    ; 2
    lda    $D4                   ; 3
    lsr                          ; 2
    bcc    LF70A                 ; 2³+1
    stx    AUDV1                 ; 3
    lda    $9C                   ; 3
    and    #$01                  ; 2
    ora    #$04                  ; 2
    sta    $9C                   ; 3
    jsr    LF9E3                 ; 6
    lda    $83                   ; 3
    beq    LF6E2                 ; 2³
    lda    $CE                   ; 3
    adc    #1                    ; 2
    sta    $CE                   ; 3
    lda    #$A3                  ; 2
    sta    $84                   ; 3
    lda    #$FA                  ; 2
    sta    $85                   ; 3
    jsr    LF986                 ; 6
    lda    #$5C                  ; 2
    sta    $86                   ; 3
    jmp    LF954                 ; 3
LF6E2:
    lda    $9C                   ; 3
    and    #$01                  ; 2
    bne    LF6F9                 ; 2³
    lda    $D5                   ; 3
    and    #$F0                  ; 2
    sta    $81                   ; 3
    lda    $D5                   ; 3
    tay                          ; 2
    iny                          ; 2
    tya                          ; 2
    and    #$07                  ; 2
    ora    $81                   ; 3
    sta    $D5                   ; 3
LF6F9:
    dec    $F3                   ; 5
    bpl    LF707                 ; 2³+1
    ldx    #0                    ; 2
    stx    $9C                   ; 3
    dex                          ; 2
    stx    $F3                   ; 3
    jmp    LF529                 ; 3
LF707:
    jmp    LF525                 ; 3
LF70A:
    inx                          ; 2
    lsr                          ; 2
    bcs    LF718                 ; 2³
    inx                          ; 2
    lsr                          ; 2
    bcc    LF77E                 ; 2³
    jsr    LF9E3                 ; 6
    jmp    LF789                 ; 3
LF718:
    jsr    LF9E3                 ; 6
    lda    $80                   ; 3
    and    #$01                  ; 2
    tay                          ; 2
    lda    $83                   ; 3
    beq    LF759                 ; 2³
    lda    $D5                   ; 3
    and    #$60                  ; 2
    beq    LF789                 ; 2³
    and    #$20                  ; 2
    beq    LF752                 ; 2³
    ldx    #2                    ; 2
    tya                          ; 2
    bne    LF745                 ; 2³
LF733:
    lda    $D5                   ; 3
    and    #$10                  ; 2
    bne    LF745                 ; 2³
    jsr    LFE45                 ; 6
    jsr    LFE63                 ; 6
    jsr    LFE63                 ; 6
LF742:
    jmp    LF8AD                 ; 3
LF745:
    lda    #$A3                  ; 2
    sta    $84                   ; 3
    lda    #$FA                  ; 2
    sta    $85                   ; 3
    jsr    LF992                 ; 6
    bne    LF742                 ; 2³
LF752:
    ldx    #1                    ; 2
    tya                          ; 2
    bne    LF733                 ; 2³
    beq    LF745                 ; 2³
LF759:
    lda    $D5                   ; 3
    tay                          ; 2
    and    #$60                  ; 2
    bne    LF768                 ; 2³
    lda    #$32                  ; 2
    jsr    LFAFB                 ; 6
    jmp    LF789                 ; 3
LF768:
    lda    #$64                  ; 2
    jsr    LFAFB                 ; 6
    tya                          ; 2
    and    #$10                  ; 2
    bne    LF779                 ; 2³
    tya                          ; 2
    ora    #$10                  ; 2
LF775:
    sta    $D5                   ; 3
    bne    LF789                 ; 2³
LF779:
    tya                          ; 2
    ora    #$08                  ; 2
    bne    LF775                 ; 2³
LF77E:
    inx                          ; 2
    lsr                          ; 2
    bcc    LF789                 ; 2³
    jsr    LF9E3                 ; 6
    lda    #8                    ; 2
    sta    AUDV0                 ; 3
LF789:
    ldx    #4                    ; 2
    lda    $D4                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    bcs    LF797                 ; 2³
    jmp    LF811                 ; 3
LF797:
    jsr    LF9E3                 ; 6
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    lda    $83                   ; 3
    bne    LF7DC                 ; 2³
    lda    $D5                   ; 3
    and    #$F0                  ; 2
    sta    $81                   ; 3
    lda    $D5                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    iny                          ; 2
    cpy    #7                    ; 2
    bcc    LF7C3                 ; 2³
    lda    $F5                   ; 3
    tax                          ; 2
    and    #$0F                  ; 2
    sta    $84                   ; 3
    txa                          ; 2
    clc                          ; 2
    adc    #$10                  ; 2
    and    #$7F                  ; 2
    ora    $84                   ; 3
    sta    $F5                   ; 3
LF7C3:
    tya                          ; 2
    and    #$07                  ; 2
    ora    $81                   ; 3
    sta    $D5                   ; 3
    lda    $9C                   ; 3
    and    #$01                  ; 2
    bne    LF7D9                 ; 2³
    sta    $D5                   ; 3
    jmp    LF529                 ; 3
    .byte $04 ; |     X  | $F7D5
    .byte $0C ; |    XX  | $F7D6
    .byte $01 ; |       X| $F7D7
    .byte $05 ; |     X X| $F7D8
LF7D9:
    jmp    LF525                 ; 3
LF7DC:
    lda    $91                   ; 3
    sta    $8E                   ; 3
    adc    #$0F                  ; 2
    sta    $8F                   ; 3
    sta    $90                   ; 3
    lda    $8D                   ; 3
    adc    #$11                  ; 2
    sta    $8A                   ; 3
    sta    $8B                   ; 3
    sta    $8C                   ; 3
    lda    #$7D                  ; 2
    sta    $84                   ; 3
    lda    #$FC                  ; 2
    sta    $85                   ; 3
    jsr    LF992                 ; 6
    lda    $F4                   ; 3
    cmp    #$14                  ; 2
    bcs    LF80E                 ; 2³
    lda    $80                   ; 3
    and    #$0F                  ; 2
    bne    LF80E                 ; 2³
    lda    #$1E                  ; 2
    jsr    LFAFB                 ; 6
    inc    $F4                   ; 5
LF80E:
    jmp    LF954                 ; 3
LF811:
    inx                          ; 2
    lsr                          ; 2
    bcc    LF81B                 ; 2³
    jsr    LF9E3                 ; 6
    jmp    LF823                 ; 3
LF81B:
    inx                          ; 2
    lsr                          ; 2
    bcc    LF822                 ; 2³
    jsr    LF9E3                 ; 6
LF822:
    nop                          ; 2
LF823:
    lda    $D5                   ; 3
    tay                          ; 2
    and    #$08                  ; 2
    beq    LF830                 ; 2³
    lda    #$5C                  ; 2
    sta    $86                   ; 3
    bne    LF8AD                 ; 2³
LF830:
    tya                          ; 2
    and    #$10                  ; 2
    beq    LF888                 ; 2³
    tya                          ; 2
    and    #$20                  ; 2
    bne    LF861                 ; 2³
    ldx    #1                    ; 2
    jsr    LFE45                 ; 6
    jsr    LFE45                 ; 6
    jsr    LFE63                 ; 6
    lda    $D5                   ; 3
    and    #$07                  ; 2
    tax                          ; 2
    lda    LFAB5,X               ; 4
    sta    $84                   ; 3
    lda    LFABD,X               ; 4
    sta    $85                   ; 3
    jsr    LF992                 ; 6
    lda    $8F                   ; 3
    sta    $90                   ; 3
    lda    $8B                   ; 3
    sta    $8C                   ; 3
    bne    LF8AD                 ; 2³
LF861:
    ldx    #2                    ; 2
    jsr    LFE45                 ; 6
    jsr    LFE45                 ; 6
    jsr    LFE63                 ; 6
    lda    $D5                   ; 3
    and    #$07                  ; 2
    tax                          ; 2
    lda    LFAA5,X               ; 4
    sta    $84                   ; 3
    lda    LFAAD,X               ; 4
    sta    $85                   ; 3
    jsr    LF992                 ; 6
LF87E:
    lda    $90                   ; 3
    sta    $8F                   ; 3
    lda    $8C                   ; 3
    sta    $8B                   ; 3
    bne    LF8AD                 ; 2³
LF888:
    ldx    #1                    ; 2
    jsr    LFE45                 ; 6
    jsr    LFE63                 ; 6
    lda    $9C                   ; 3
    and    #$01                  ; 2
    beq    LF89C                 ; 2³
    lda    $F5                   ; 3
    and    #$F0                  ; 2
    beq    LF89F                 ; 2³
LF89C:
    jsr    LFE63                 ; 6
LF89F:
    inx                          ; 2
    jsr    LFE45                 ; 6
    jsr    LFE45                 ; 6
    jsr    LFE63                 ; 6
    bit    $D5                   ; 3
    bpl    LF87E                 ; 2³
LF8AD:
    lda    $80                   ; 3
    and    #$01                  ; 2
    tay                          ; 2
    lda    $9C                   ; 3
    and    #$01                  ; 2
    beq    LF8C6                 ; 2³
    lda    $F5                   ; 3
    and    #$F0                  ; 2
    bne    LF8C6                 ; 2³
    lda    $D5                   ; 3
    and    #$07                  ; 2
    cmp    #1                    ; 2
    bne    LF8DB                 ; 2³
LF8C6:
    bit    $D5                   ; 3
    bpl    LF8DB                 ; 2³
    lda    $D5                   ; 3
    and    #$08                  ; 2
    bne    LF8DB                 ; 2³
    lda    $CF                   ; 3
    cmp    #5                    ; 2
    bcs    LF8DB                 ; 2³
    lda    LF984,Y               ; 4
    sta    $86                   ; 3
LF8DB:
    lda    $9C                   ; 3
    and    #$01                  ; 2
    bne    LF8EB                 ; 2³
    tax                          ; 2
    jsr    LFE45                 ; 6
    lda    #$85                  ; 2
    sta    $8E                   ; 3
    bne    LF954                 ; 2³+1
LF8EB:
    bit    CXP0FB                ; 3
    bpl    LF905                 ; 2³+1
    lda    $D5                   ; 3
    and    #$07                  ; 2
    cmp    #1                    ; 2
    beq    LF905                 ; 2³+1
    lda    $F6                   ; 3
    beq    LF946                 ; 2³+1
    cmp    #1                    ; 2
    beq    LF938                 ; 2³+1
    cmp    #2                    ; 2
    beq    LF919                 ; 2³
    bne    LF92A                 ; 2³
LF905:
    lda    SWCHA                 ; 4
    ldx    #0                    ; 2
    asl                          ; 2
    bcc    LF938                 ; 2³
    inx                          ; 2
    asl                          ; 2
    bcc    LF946                 ; 2³
    inx                          ; 2
    asl                          ; 2
    bcc    LF92A                 ; 2³
    inx                          ; 2
    asl                          ; 2
    bcs    LF925                 ; 2³
LF919:
    ldy    $8A                   ; 3
    dey                          ; 2
    dey                          ; 2
    cpy    #$FA                  ; 2
    bcc    LF923                 ; 2³
    ldy    #0                    ; 2
LF923:
    sty    $8A                   ; 3
LF925:
    stx    $F6                   ; 3
    jmp    LF954                 ; 3
LF92A:
    ldy    $8A                   ; 3
    iny                          ; 2
    iny                          ; 2
    cpy    #$A4                  ; 2
    bcc    LF934                 ; 2³
    ldy    #$A4                  ; 2
LF934:
    sty    $8A                   ; 3
    bne    LF925                 ; 2³
LF938:
    ldy    $8E                   ; 3
    iny                          ; 2
    iny                          ; 2
    cpy    #$8E                  ; 2
    bcc    LF942                 ; 2³
    ldy    #$8E                  ; 2
LF942:
    sty    $8E                   ; 3
    bne    LF925                 ; 2³
LF946:
    ldy    $8E                   ; 3
    dey                          ; 2
    dey                          ; 2
    cpy    #5                    ; 2
    bcs    LF950                 ; 2³
    ldy    #5                    ; 2
LF950:
    sty    $8E                   ; 3
    bne    LF925                 ; 2³
LF954:
    lda    INTIM                 ; 4
    bne    LF954                 ; 2³
    ldy    #$82                  ; 2
    sty    WSYNC                 ; 3
    sty    VBLANK                ; 3
    sty    VSYNC                 ; 3
    sty    WSYNC                 ; 3
    sty    WSYNC                 ; 3
    sty    WSYNC                 ; 3
    sta    VSYNC                 ; 3
    lda    $E2                   ; 3
    sta    $E1                   ; 3
    jsr    LFE31                 ; 6
    inc    $80                   ; 5
    lda    #$23                  ; 2
    sta    TIM64T                ; 4
    lda    $9C                   ; 3
    and    #$01                  ; 2
    bne    LF981                 ; 2³
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
LF981:
    jmp    LF00E                 ; 3
LF984:
    .byte $81 ; |X      X| $F984
    .byte $8C ; |X   XX  | $F985
LF986:
    lda    $80                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    and    #$01                  ; 2
    tay                          ; 2
    lda    ($84),Y               ; 5
    sta    $88                   ; 3
    rts                          ; 6

LF992:
    lda    $80                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$01                  ; 2
    tay                          ; 2
    lda    ($84),Y               ; 5
    sta    $86                   ; 3
    rts                          ; 6

LF99F:
    stx    $82                   ; 3
    cpx    #4                    ; 2
    bcc    LF9A9                 ; 2³
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
LF9A9:
    dex                          ; 2
    bmi    LF9C2                 ; 2³
    lda    $82                   ; 3
    cmp    #4                    ; 2
    bcs    LF9BA                 ; 2³
    lda    $D4                   ; 3
    and    LF9DB,X               ; 4
    beq    LF9A9                 ; 2³
    rts                          ; 6

LF9BA:
    lda    $D4                   ; 3
    and    LF9DF,X               ; 4
    beq    LF9A9                 ; 2³
    rts                          ; 6

LF9C2:
    ldx    $82                   ; 3
    cpx    #4                    ; 2
    bcs    LF9D2                 ; 2³
    lda    $D4                   ; 3
    and    #$F0                  ; 2
    ora    LF9DB,X               ; 4
LF9CF:
    sta    $D4                   ; 3
    rts                          ; 6

LF9D2:
    lda    $D4                   ; 3
    and    #$0F                  ; 2
    ora    LF9DB,X               ; 4
    bne    LF9CF                 ; 2³
LF9DB:
    .byte $01 ; |       X| $F9DB
    .byte $02 ; |      X | $F9DC
    .byte $04 ; |     X  | $F9DD
    .byte $08 ; |    X   | $F9DE
LF9DF:
    .byte $10 ; |   X    | $F9DF
    .byte $20 ; |  X     | $F9E0
    .byte $40 ; | X      | $F9E1
    .byte $80 ; |X       | $F9E2
LF9E3:
    stx    $82                   ; 3
    ldy    LFA56,X               ; 4
    lda    $D8,X                 ; 4
    sta    $84                   ; 3
    cpx    #4                    ; 2
    bcc    LF9F4                 ; 2³
    ldx    #1                    ; 2
    bne    LF9F6                 ; 2³
LF9F4:
    ldx    #0                    ; 2
LF9F6:
    stx    $81                   ; 3
    sty    AUDC0,X               ; 4
    lda    $D2,X                 ; 4
    beq    LFA04                 ; 2³+1
    dec    $D2,X                 ; 6
    bmi    LFA04                 ; 2³
    bpl    LFA23                 ; 2³
LFA04:
    ldy    $84                   ; 3
    lda    LFA5E,Y               ; 4
    bne    LFA10                 ; 2³
    dec    $84                   ; 5
    jmp    LFA1F                 ; 3
LFA10:
    sta    AUDF0,X               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LFA4E,Y               ; 4
    sta    $D2,X                 ; 4
    lda    #$FF                  ; 2
LFA1F:
    sta    AUDV0,X               ; 4
    inc    $84                   ; 5
LFA23:
    ldx    $82                   ; 3
    lda    $84                   ; 3
    sta    $D8,X                 ; 4
    ldy    $D8,X                 ; 4
    lda    LFA5E,Y               ; 4
    sta    $83                   ; 3
    bne    LFA4D                 ; 2³
    ldy    $81                   ; 3
    sta.wy $D2,Y                 ; 5
    sta.wy AUDV0,Y               ; 5
    lda    LFFF4,X               ; 4
    sta    $D8,X                 ; 4
    lda    #1                    ; 2
LFA41:
    dex                          ; 2
    bmi    LFA47                 ; 2³
    asl                          ; 2
    bne    LFA41                 ; 2³
LFA47:
    eor    #$FF                  ; 2
    and    $D4                   ; 3
    sta    $D4                   ; 3
LFA4D:
    rts                          ; 6

LFA4E:
    .byte $00 ; |        | $FA4E
    .byte $01 ; |       X| $FA4F
    .byte $03 ; |      XX| $FA50
    .byte $07 ; |     XXX| $FA51
    .byte $0F ; |    XXXX| $FA52
    .byte $1F ; |   XXXXX| $FA53
    .byte $3F ; |  XXXXXX| $FA54
    .byte $7F ; | XXXXXXX| $FA55
LFA56:
    .byte $08 ; |    X   | $FA56
    .byte $01 ; |       X| $FA57
    .byte $04 ; |     X  | $FA58
    .byte $0C ; |    XX  | $FA59
    .byte $0C ; |    XX  | $FA5A
    .byte $08 ; |    X   | $FA5B
    .byte $01 ; |       X| $FA5C
    .byte $04 ; |     X  | $FA5D
LFA5E:
    .byte $FF ; |XXXXXXXX| $FA5E
    .byte $FF ; |XXXXXXXX| $FA5F
    .byte $00 ; |        | $FA60
    .byte $77 ; | XXX XXX| $FA61
    .byte $77 ; | XXX XXX| $FA62
    .byte $00 ; |        | $FA63
    .byte $3D ; |  XXXX X| $FA64
    .byte $3F ; |  XXXXXX| $FA65
    .byte $3C ; |  XXXX  | $FA66
    .byte $37 ; |  XX XXX| $FA67
    .byte $00 ; |        | $FA68
    .byte $77 ; | XXX XXX| $FA69
    .byte $7F ; | XXXXXXX| $FA6A
    .byte $7C ; | XXXXX  | $FA6B
    .byte $97 ; |X  X XXX| $FA6C
    .byte $00 ; |        | $FA6D
    .byte $97 ; |X  X XXX| $FA6E
    .byte $78 ; | XXXX   | $FA6F
    .byte $77 ; | XXX XXX| $FA70
    .byte $77 ; | XXX XXX| $FA71
    .byte $75 ; | XXX X X| $FA72
    .byte $73 ; | XXX  XX| $FA73
    .byte $77 ; | XXX XXX| $FA74
    .byte $75 ; | XXX X X| $FA75
    .byte $73 ; | XXX  XX| $FA76
    .byte $6E ; | XX XXX | $FA77
    .byte $77 ; | XXX XXX| $FA78
    .byte $71 ; | XXX   X| $FA79
    .byte $73 ; | XXX  XX| $FA7A
    .byte $75 ; | XXX X X| $FA7B
    .byte $7A ; | XXXX X | $FA7C
    .byte $AF ; |X X XXXX| $FA7D
    .byte $73 ; | XXX  XX| $FA7E
    .byte $75 ; | XXX X X| $FA7F
    .byte $7A ; | XXXX X | $FA80
    .byte $7A ; | XXXX X | $FA81
    .byte $39 ; |  XXX  X| $FA82
    .byte $77 ; | XXX XXX| $FA83
    .byte $71 ; | XXX   X| $FA84
    .byte $6F ; | XX XXXX| $FA85
    .byte $71 ; | XXX   X| $FA86
    .byte $6E ; | XX XXX | $FA87
    .byte $71 ; | XXX   X| $FA88
    .byte $6F ; | XX XXXX| $FA89
    .byte $6E ; | XX XXX | $FA8A
    .byte $91 ; |X  X   X| $FA8B
    .byte $77 ; | XXX XXX| $FA8C
    .byte $71 ; | XXX   X| $FA8D
    .byte $73 ; | XXX  XX| $FA8E
    .byte $75 ; | XXX X X| $FA8F
    .byte $BA ; |X XXX X | $FA90
    .byte $77 ; | XXX XXX| $FA91
    .byte $00 ; |        | $FA92
    .byte $97 ; |X  X XXX| $FA93
    .byte $A2 ; |X X   X | $FA94
    .byte $AD ; |X X XX X| $FA95
    .byte $B8 ; |X XXX   | $FA96
    .byte $1A ; |   XX X | $FA97
    .byte $25 ; |  X  X X| $FA98
    .byte $1A ; |   XX X | $FA99
    .byte $30 ; |  XX    | $FA9A
    .byte $25 ; |  X  X X| $FA9B
    .byte $30 ; |  XX    | $FA9C
    .byte $1A ; |   XX X | $FA9D
    .byte $B8 ; |X XXX   | $FA9E
    .byte $AD ; |X X XX X| $FA9F
    .byte $3B ; |  XXX XX| $FAA0
    .byte $30 ; |  XX    | $FAA1
    .byte $3B ; |  XXX XX| $FAA2
    .byte $46 ; | X   XX | $FAA3
    .byte $51 ; | X X   X| $FAA4
LFAA5:
    .byte $97 ; |X  X XXX| $FAA5
    .byte $99 ; |X  XX  X| $FAA6
    .byte $9B ; |X  XX XX| $FAA7
    .byte $9D ; |X  XXX X| $FAA8
    .byte $9F ; |X  XXXXX| $FAA9
    .byte $93 ; |X  X  XX| $FAAA
    .byte $95 ; |X  X X X| $FAAB
    .byte $9B ; |X  XX XX| $FAAC
LFAAD:
    .byte $FA ; |XXXXX X | $FAAD
    .byte $FA ; |XXXXX X | $FAAE
    .byte $FA ; |XXXXX X | $FAAF
    .byte $FA ; |XXXXX X | $FAB0
    .byte $FA ; |XXXXX X | $FAB1
    .byte $FA ; |XXXXX X | $FAB2
    .byte $FA ; |XXXXX X | $FAB3
    .byte $FA ; |XXXXX X | $FAB4
LFAB5:
    .byte $A1 ; |X X    X| $FAB5
    .byte $9F ; |X  XXXXX| $FAB6
    .byte $9D ; |X  XXX X| $FAB7
    .byte $9B ; |X  XX XX| $FAB8
    .byte $99 ; |X  XX  X| $FAB9
    .byte $9B ; |X  XX XX| $FABA
    .byte $93 ; |X  X  XX| $FABB
    .byte $95 ; |X  X X X| $FABC
LFABD:
    .byte $FA ; |XXXXX X | $FABD
    .byte $FA ; |XXXXX X | $FABE
    .byte $FA ; |XXXXX X | $FABF
    .byte $FA ; |XXXXX X | $FAC0
    .byte $FA ; |XXXXX X | $FAC1
    .byte $FA ; |XXXXX X | $FAC2
    .byte $FA ; |XXXXX X | $FAC3
    .byte $FA ; |XXXXX X | $FAC4
LFAC5:
    lda    #0                    ; 2
    sta    $F2                   ; 3
    ldy    $F3                   ; 3
    bne    LFACE                 ; 2³
LFACD:
    rts                          ; 6

LFACE:
    bit    $F3                   ; 3
    bmi    LFACD                 ; 2³
    cpy    #3                    ; 2
    bcs    LFADD                 ; 2³
    dey                          ; 2
    tya                          ; 2
    ora    #$80                  ; 2
LFADA:
    sta    $F2                   ; 3
    rts                          ; 6

LFADD:
    lda    #$83                  ; 2
    sta    $F2                   ; 3
    cpy    #4                    ; 2
    bcc    LFACD                 ; 2³
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    cpy    #2                    ; 2
    bcc    LFAF1                 ; 2³
    lda    #$DB                  ; 2
    bne    LFADA                 ; 2³
LFAF1:
    tya                          ; 2
    ora    #$08                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    $F2                   ; 3
    bne    LFADA                 ; 2³
LFAFB:
    sta    $81                   ; 3
    lda    $EF                   ; 3
    clc                          ; 2
    adc    $81                   ; 3
    sta    $EF                   ; 3
    lda    $F0                   ; 3
    adc    #0                    ; 2
    sta    $F0                   ; 3
    rts                          ; 6

LFB0B:
    .byte $80 ; |X       | $FB0B
LFB0C:
    .byte $80 ; |X       | $FB0C
    .byte $40 ; | X      | $FB0D
    .byte $20 ; |  X     | $FB0E
    .byte $10 ; |   X    | $FB0F
    .byte $08 ; |    X   | $FB10
    .byte $04 ; |     X  | $FB11
    .byte $02 ; |      X | $FB12
    .byte $01 ; |       X| $FB13
    .byte $00 ; |        | $FB14
LFB15:
    lda    $81                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    ldy    #0                    ; 2
LFB1C:
    lda    $9D,X                 ; 4
    and    LFB0C,Y               ; 4
    bne    LFB26                 ; 2³
    iny                          ; 2
    bne    LFB1C                 ; 2³
LFB26:
    bit    $82                   ; 3
    bmi    LFB3E                 ; 2³
    lda    $9D,X                 ; 4
    ora    LFB0B,Y               ; 4
    sta    $84                   ; 3
    cmp    $9D,X                 ; 4
    beq    LFB3B                 ; 2³
    lda    #$F0                  ; 2
    sta    $82                   ; 3
    lda    $84                   ; 3
LFB3B:
    sta    $9D,X                 ; 4
    rts                          ; 6

LFB3E:
    lda    LFB0C,Y               ; 4
    eor    #$FF                  ; 2
    and    $9D,X                 ; 4
    jmp    LFB3B                 ; 3
LFB48:
    lda    $81                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    ldx    #$FF                  ; 2
LFB4F:
    lda    $82                   ; 3
    cmp    #$51                  ; 2
    bcs    LFB63                 ; 2³
    adc    #4                    ; 2
    sta    $82                   ; 3
    inx                          ; 2
    cpx    #9                    ; 2
    bcc    LFB4F                 ; 2³
LFB5E:
    lda    #0                    ; 2
LFB60:
    sta    $82                   ; 3
    rts                          ; 6

LFB63:
    txa                          ; 2
    bmi    LFB5E                 ; 2³
    lda.wy $9D,Y                 ; 4
    and    LFB0C,X               ; 4
    bne    LFB76                 ; 2³
    lda.wy $9D,Y                 ; 4
    and    LFB0B,X               ; 4
    beq    LFB5E                 ; 2³
LFB76:
    lda    #$F0                  ; 2
    bne    LFB60                 ; 2³
    .byte $2E ; |  X XXX | $FB7A
    .byte $A0 ; |X X     | $FB7B
    .byte $05 ; |     X X| $FB7C
    .byte $91 ; |X  X   X| $FB7D
    .byte $AC ; |X X XX  | $FB7E
    .byte $BD ; |X XXXX X| $FB7F
    .byte $A2 ; |X X   X | $FB80
    .byte $2E ; |  X XXX | $FB81
    .byte $C8 ; |XX  X   | $FB82
    .byte $91 ; |X  X   X| $FB83
    .byte $AC ; |X X XX  | $FB84
    .byte $BD ; |X XXXX X| $FB85
    .byte $E4 ; |XXX  X  | $FB86
    .byte $2E ; |  X XXX | $FB87
    .byte $C8 ; |XX  X   | $FB88
    .byte $91 ; |X  X   X| $FB89
    .byte $AC ; |X X XX  | $FB8A
    .byte $BD ; |X XXXX X| $FB8B
    .byte $34 ; |  XX X  | $FB8C
    .byte $30 ; |  XX    | $FB8D
    .byte $C8 ; |XX  X   | $FB8E
    .byte $91 ; |X  X   X| $FB8F
    .byte $AC ; |X X XX  | $FB90
    .byte $BD ; |X XXXX X| $FB91
    .byte $35 ; |  XX X X| $FB92
    .byte $30 ; |  XX    | $FB93
    .byte $C8 ; |XX  X   | $FB94
    .byte $91 ; |X  X   X| $FB95
    .byte $AC ; |X X XX  | $FB96
    .byte $E0 ; |XXX     | $FB97
    .byte $00 ; |        | $FB98
    .byte $D0 ; |XX X    | $FB99
    .byte $14 ; |   X X  | $FB9A
    .byte $A9 ; |X X X  X| $FB9B
LFB9C:
    .byte $20 ; |  X     | $FB9C
    .byte $50 ; | X X    | $FB9D
    .byte $20 ; |  X     | $FB9E
    .byte $00 ; |        | $FB9F
    .byte $00 ; |        | $FBA0
    .byte $00 ; |        | $FBA1
    .byte $00 ; |        | $FBA2
    .byte $00 ; |        | $FBA3
    .byte $70 ; | XXX    | $FBA4
    .byte $20 ; |  X     | $FBA5
    .byte $70 ; | XXX    | $FBA6
    .byte $00 ; |        | $FBA7
    .byte $00 ; |        | $FBA8
    .byte $00 ; |        | $FBA9
    .byte $A0 ; |X X     | $FBAA
    .byte $00 ; |        | $FBAB
    .byte $00 ; |        | $FBAC
    .byte $00 ; |        | $FBAD
    .byte $00 ; |        | $FBAE
    .byte $50 ; | X X    | $FBAF
    .byte $00 ; |        | $FBB0
    .byte $50 ; | X X    | $FBB1
    .byte $00 ; |        | $FBB2
    .byte $00 ; |        | $FBB3
    .byte $00 ; |        | $FBB4
    .byte $00 ; |        | $FBB5
    .byte $00 ; |        | $FBB6
    .byte $00 ; |        | $FBB7
    .byte $00 ; |        | $FBB8
    .byte $00 ; |        | $FBB9
    .byte $00 ; |        | $FBBA
    .byte $00 ; |        | $FBBB
    .byte $20 ; |  X     | $FBBC
    .byte $50 ; | X X    | $FBBD
    .byte $20 ; |  X     | $FBBE
    .byte $00 ; |        | $FBBF
    .byte $00 ; |        | $FBC0
    .byte $00 ; |        | $FBC1
    .byte $00 ; |        | $FBC2
    .byte $00 ; |        | $FBC3
    .byte $F0 ; |XXXX    | $FBC4
    .byte $90 ; |X  X    | $FBC5
    .byte $90 ; |X  X    | $FBC6
    .byte $F0 ; |XXXX    | $FBC7
    .byte $00 ; |        | $FBC8
    .byte $00 ; |        | $FBC9
    .byte $00 ; |        | $FBCA
    .byte $00 ; |        | $FBCB
    .byte $00 ; |        | $FBCC
    .byte $80 ; |X       | $FBCD
LFBCE:
    .byte $55 ; | X X X X| $FBCE
    .byte $00 ; |        | $FBCF
    .byte $00 ; |        | $FBD0
    .byte $22 ; |  X   X | $FBD1
    .byte $14 ; |   X X  | $FBD2
    .byte $08 ; |    X   | $FBD3
    .byte $14 ; |   X X  | $FBD4
    .byte $22 ; |  X   X | $FBD5
    .byte $00 ; |        | $FBD6
    .byte $00 ; |        | $FBD7
    .byte $00 ; |        | $FBD8
    .byte $00 ; |        | $FBD9
    .byte $0A ; |    X X | $FBDA
    .byte $00 ; |        | $FBDB
    .byte $0A ; |    X X | $FBDC
    .byte $00 ; |        | $FBDD
    .byte $20 ; |  X     | $FBDE
    .byte $50 ; | X X    | $FBDF
    .byte $20 ; |  X     | $FBE0
    .byte $00 ; |        | $FBE1
    .byte $00 ; |        | $FBE2
    .byte $00 ; |        | $FBE3
    .byte $00 ; |        | $FBE4
    .byte $00 ; |        | $FBE5
    .byte $02 ; |      X | $FBE6
    .byte $07 ; |     XXX| $FBE7
    .byte $02 ; |      X | $FBE8
    .byte $00 ; |        | $FBE9
    .byte $00 ; |        | $FBEA
    .byte $00 ; |        | $FBEB
    .byte $00 ; |        | $FBEC
    .byte $60 ; | XX     | $FBED
    .byte $90 ; |X  X    | $FBEE
    .byte $90 ; |X  X    | $FBEF
    .byte $60 ; | XX     | $FBF0
    .byte $00 ; |        | $FBF1
    .byte $04 ; |     X  | $FBF2
    .byte $0A ; |    X X | $FBF3
    .byte $11 ; |   X   X| $FBF4
    .byte $0A ; |    X X | $FBF5
    .byte $04 ; |     X  | $FBF6
    .byte $00 ; |        | $FBF7
    .byte $00 ; |        | $FBF8
    .byte $00 ; |        | $FBF9
    .byte $00 ; |        | $FBFA
    .byte $00 ; |        | $FBFB
    .byte $08 ; |    X   | $FBFC
    .byte $1C ; |   XXX  | $FBFD
    .byte $08 ; |    X   | $FBFE
    .byte $00 ; |        | $FBFF
LFC00:
    .byte $00 ; |        | $FC00
    .byte $18 ; |   XX   | $FC01
    .byte $3C ; |  XXXX  | $FC02
    .byte $7E ; | XXXXXX | $FC03
    .byte $AB ; |X X X XX| $FC04
    .byte $7E ; | XXXXXX | $FC05
    .byte $3C ; |  XXXX  | $FC06
    .byte $18 ; |   XX   | $FC07
    .byte $00 ; |        | $FC08
    .byte $18 ; |   XX   | $FC09
    .byte $3C ; |  XXXX  | $FC0A
    .byte $7E ; | XXXXXX | $FC0B
    .byte $D5 ; |XX X X X| $FC0C
    .byte $7E ; | XXXXXX | $FC0D
    .byte $3C ; |  XXXX  | $FC0E
    .byte $18 ; |   XX   | $FC0F
LFC10:
    .byte $4A ; | X  X X | $FC10
    .byte $2A ; |  X X X | $FC11
    .byte $7A ; | XXXX X | $FC12
    .byte $8A ; |X   X X | $FC13
    .byte $3A ; |  XXX X | $FC14
    .byte $8A ; |X   X X | $FC15
    .byte $7A ; | XXXX X | $FC16
    .byte $2A ; |  X X X | $FC17
    .byte $00 ; |        | $FC18
    .byte $08 ; |    X   | $FC19
    .byte $00 ; |        | $FC1A
    .byte $81 ; |X      X| $FC1B
    .byte $42 ; | X    X | $FC1C
    .byte $3C ; |  XXXX  | $FC1D
    .byte $7E ; | XXXXXX | $FC1E
    .byte $FF ; |XXXXXXXX| $FC1F
    .byte $5A ; | X XX X | $FC20
    .byte $3C ; |  XXXX  | $FC21
    .byte $24 ; |  X  X  | $FC22
    .byte $42 ; | X    X | $FC23
    .byte $81 ; |X      X| $FC24
    .byte $00 ; |        | $FC25
    .byte $24 ; |  X  X  | $FC26
    .byte $42 ; | X    X | $FC27
    .byte $3C ; |  XXXX  | $FC28
    .byte $7E ; | XXXXXX | $FC29
    .byte $FF ; |XXXXXXXX| $FC2A
    .byte $7E ; | XXXXXX | $FC2B
    .byte $3C ; |  XXXX  | $FC2C
    .byte $24 ; |  X  X  | $FC2D
    .byte $42 ; | X    X | $FC2E
    .byte $24 ; |  X  X  | $FC2F
    .byte $00 ; |        | $FC30
    .byte $66 ; | XX  XX | $FC31
    .byte $18 ; |   XX   | $FC32
    .byte $81 ; |X      X| $FC33
    .byte $99 ; |X  XX  X| $FC34
    .byte $5A ; | X XX X | $FC35
    .byte $5A ; | X XX X | $FC36
    .byte $99 ; |X  XX  X| $FC37
    .byte $81 ; |X      X| $FC38
    .byte $18 ; |   XX   | $FC39
    .byte $66 ; | XX  XX | $FC3A
    .byte $00 ; |        | $FC3B
    .byte $24 ; |  X  X  | $FC3C
    .byte $42 ; | X    X | $FC3D
    .byte $A5 ; |X X  X X| $FC3E
    .byte $18 ; |   XX   | $FC3F
    .byte $3C ; |  XXXX  | $FC40
    .byte $3C ; |  XXXX  | $FC41
    .byte $18 ; |   XX   | $FC42
    .byte $A5 ; |X X  X X| $FC43
    .byte $42 ; | X    X | $FC44
    .byte $24 ; |  X  X  | $FC45
    .byte $00 ; |        | $FC46
    .byte $82 ; |X     X | $FC47
    .byte $24 ; |  X  X  | $FC48
    .byte $05 ; |     X X| $FC49
    .byte $50 ; | X X    | $FC4A
    .byte $B4 ; |X XX X  | $FC4B
    .byte $29 ; |  X X  X| $FC4C
    .byte $10 ; |   X    | $FC4D
    .byte $44 ; | X   X  | $FC4E
    .byte $21 ; |  X    X| $FC4F
    .byte $84 ; |X    X  | $FC50
    .byte $00 ; |        | $FC51
    .byte $10 ; |   X    | $FC52
    .byte $12 ; |   X  X | $FC53
    .byte $44 ; | X   X  | $FC54
    .byte $8D ; |X   XX X| $FC55
    .byte $42 ; | X    X | $FC56
    .byte $14 ; |   X X  | $FC57
    .byte $62 ; | XX   X | $FC58
    .byte $31 ; |  XX   X| $FC59
    .byte $48 ; | X  X   | $FC5A
    .byte $22 ; |  X   X | $FC5B
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
    .byte $A8 ; |X X X   | $FC6C
    .byte $10 ; |   X    | $FC6D
    .byte $04 ; |     X  | $FC6E
    .byte $00 ; |        | $FC6F
    .byte $00 ; |        | $FC70
    .byte $00 ; |        | $FC71
    .byte $00 ; |        | $FC72
    .byte $00 ; |        | $FC73
    .byte $00 ; |        | $FC74
    .byte $00 ; |        | $FC75
    .byte $00 ; |        | $FC76
    .byte $08 ; |    X   | $FC77
    .byte $14 ; |   X X  | $FC78
    .byte $48 ; | X  X   | $FC79
    .byte $10 ; |   X    | $FC7A
    .byte $00 ; |        | $FC7B
    .byte $00 ; |        | $FC7C
    .byte $67 ; | XX  XXX| $FC7D
    .byte $72 ; | XXX  X | $FC7E
    .byte $FC ; |XXXXXX  | $FC7F
    .byte $FC ; |XXXXXX  | $FC80
    .byte $81 ; |X      X| $FC81
    .byte $81 ; |X      X| $FC82
    .byte $42 ; | X    X | $FC83
    .byte $3C ; |  XXXX  | $FC84
    .byte $7E ; | XXXXXX | $FC85
    .byte $FF ; |XXXXXXXX| $FC86
    .byte $5A ; | X XX X | $FC87
    .byte $3C ; |  XXXX  | $FC88
    .byte $24 ; |  X  X  | $FC89
    .byte $42 ; | X    X | $FC8A
    .byte $81 ; |X      X| $FC8B
    .byte $18 ; |   XX   | $FC8C
    .byte $66 ; | XX  XX | $FC8D
    .byte $18 ; |   XX   | $FC8E
    .byte $81 ; |X      X| $FC8F
    .byte $99 ; |X  XX  X| $FC90
    .byte $5A ; | X XX X | $FC91
    .byte $5A ; | X XX X | $FC92
    .byte $99 ; |X  XX  X| $FC93
    .byte $81 ; |X      X| $FC94
    .byte $18 ; |   XX   | $FC95
    .byte $66 ; | XX  XX | $FC96
    .byte $00 ; |        | $FC97
    .byte $66 ; | XX  XX | $FC98
    .byte $24 ; |  X  X  | $FC99
    .byte $24 ; |  X  X  | $FC9A
    .byte $18 ; |   XX   | $FC9B
    .byte $3D ; |  XXXX X| $FC9C
    .byte $3D ; |  XXXX X| $FC9D
    .byte $3D ; |  XXXX X| $FC9E
    .byte $7E ; | XXXXXX | $FC9F
    .byte $98 ; |X  XX   | $FCA0
    .byte $58 ; | X XX   | $FCA1
    .byte $00 ; |        | $FCA2
    .byte $C3 ; |XX    XX| $FCA3
    .byte $42 ; | X    X | $FCA4
    .byte $24 ; |  X  X  | $FCA5
    .byte $18 ; |   XX   | $FCA6
    .byte $BC ; |X XXXX  | $FCA7
    .byte $BC ; |X XXXX  | $FCA8
    .byte $BC ; |X XXXX  | $FCA9
    .byte $7E ; | XXXXXX | $FCAA
    .byte $19 ; |   XX  X| $FCAB
    .byte $1A ; |   XX X | $FCAC
    .byte $00 ; |        | $FCAD
    .byte $81 ; |X      X| $FCAE
    .byte $81 ; |X      X| $FCAF
    .byte $42 ; | X    X | $FCB0
    .byte $7E ; | XXXXXX | $FCB1
    .byte $DB ; |XX XX XX| $FCB2
    .byte $E7 ; |XXX  XXX| $FCB3
    .byte $FF ; |XXXXXXXX| $FCB4
    .byte $99 ; |X  XX  X| $FCB5
    .byte $7E ; | XXXXXX | $FCB6
    .byte $3C ; |  XXXX  | $FCB7
    .byte $00 ; |        | $FCB8
    .byte $18 ; |   XX   | $FCB9
    .byte $24 ; |  X  X  | $FCBA
    .byte $42 ; | X    X | $FCBB
    .byte $7E ; | XXXXXX | $FCBC
    .byte $FF ; |XXXXXXXX| $FCBD
    .byte $E7 ; |XXX  XXX| $FCBE
    .byte $FF ; |XXXXXXXX| $FCBF
    .byte $FF ; |XXXXXXXX| $FCC0
    .byte $7E ; | XXXXXX | $FCC1
    .byte $3C ; |  XXXX  | $FCC2
    .byte $C9 ; |XX  X  X| $FCC3
    .byte $A0 ; |X X     | $FCC4
    .byte $D0 ; |XX X    | $FCC5
    .byte $03 ; |      XX| $FCC6
    .byte $88 ; |X   X   | $FCC7
    .byte $10 ; |   X    | $FCC8
    .byte $F6 ; |XXXX XX | $FCC9
    .byte $18 ; |   XX   | $FCCA
    .byte $69 ; | XX X  X| $FCCB
    .byte $01 ; |       X| $FCCC
    .byte $99 ; |X  XX  X| $FCCD
    .byte $A6 ; |X X  XX | $FCCE
    .byte $2E ; |  X XXX | $FCCF
    .byte $68 ; | XX X   | $FCD0
    .byte $AA ; |X X X X | $FCD1
    .byte $68 ; | XX X   | $FCD2
    .byte $A8 ; |X X X   | $FCD3
    .byte $68 ; | XX X   | $FCD4
    .byte $60 ; | XX     | $FCD5
    .byte $8D ; |X   XX X| $FCD6
    .byte $94 ; |X  X X  | $FCD7
    .byte $2E ; |  X XXX | $FCD8
    .byte $48 ; | X  X   | $FCD9
    .byte $98 ; |X  XX   | $FCDA
    .byte $48 ; | X  X   | $FCDB
    .byte $8A ; |X   X X | $FCDC
    .byte $48 ; | X  X   | $FCDD
    .byte $A2 ; |X X   X | $FCDE
    .byte $00 ; |        | $FCDF
    .byte $20 ; |  X     | $FCE0
    .byte $C5 ; |XX   X X| $FCE1
    .byte $2D ; |  X XX X| $FCE2
    .byte $20 ; |  X     | $FCE3
    .byte $D2 ; |XX X  X | $FCE4
    .byte $2D ; |  X XX X| $FCE5
    .byte $EE ; |XXX XXX | $FCE6
    .byte $8E ; |X   XXX | $FCE7
    .byte $2E ; |  X XXX | $FCE8
    .byte $D0 ; |XX X    | $FCE9
    .byte $03 ; |      XX| $FCEA
    .byte $EE ; |XXX XXX | $FCEB
    .byte $8F ; |X   XXXX| $FCEC
    .byte $2E ; |  X XXX | $FCED
    .byte $E6 ; |XXX  XX | $FCEE
    .byte $81 ; |X      X| $FCEF
    .byte $D0 ; |XX X    | $FCF0
    .byte $02 ; |      X | $FCF1
    .byte $E6 ; |XXX  XX | $FCF2
    .byte $82 ; |X     X | $FCF3
    .byte $68 ; | XX X   | $FCF4
    .byte $AA ; |X X X X | $FCF5
    .byte $68 ; | XX X   | $FCF6
    .byte $A8 ; |X X X   | $FCF7
    .byte $68 ; | XX X   | $FCF8
    .byte $60 ; | XX     | $FCF9
    .byte $84 ; |X    X  | $FCFA
    .byte $AA ; |X X X X | $FCFB
    .byte $85 ; |X    X X| $FCFC
    .byte $AB ; |X X X XX| $FCFD
    .byte $48 ; | X  X   | $FCFE
    .byte $98 ; |X  XX   | $FCFF
LFD00:
    .byte $00 ; |        | $FD00
    .byte $10 ; |   X    | $FD01
    .byte $30 ; |  XX    | $FD02
    .byte $70 ; | XXX    | $FD03
    .byte $F0 ; |XXXX    | $FD04
    .byte $F0 ; |XXXX    | $FD05
    .byte $F0 ; |XXXX    | $FD06
    .byte $F0 ; |XXXX    | $FD07
    .byte $F0 ; |XXXX    | $FD08
    .byte $F0 ; |XXXX    | $FD09
    .byte $F0 ; |XXXX    | $FD0A
    .byte $F0 ; |XXXX    | $FD0B
    .byte $F0 ; |XXXX    | $FD0C
    .byte $F0 ; |XXXX    | $FD0D
    .byte $F0 ; |XXXX    | $FD0E
    .byte $F0 ; |XXXX    | $FD0F
    .byte $F0 ; |XXXX    | $FD10
    .byte $F0 ; |XXXX    | $FD11
    .byte $F0 ; |XXXX    | $FD12
    .byte $F0 ; |XXXX    | $FD13
    .byte $F0 ; |XXXX    | $FD14
LFD15:
    .byte $00 ; |        | $FD15
    .byte $00 ; |        | $FD16
    .byte $00 ; |        | $FD17
    .byte $00 ; |        | $FD18
    .byte $00 ; |        | $FD19
    .byte $80 ; |X       | $FD1A
    .byte $C0 ; |XX      | $FD1B
    .byte $E0 ; |XXX     | $FD1C
    .byte $F0 ; |XXXX    | $FD1D
    .byte $F8 ; |XXXXX   | $FD1E
    .byte $FC ; |XXXXXX  | $FD1F
    .byte $FE ; |XXXXXXX | $FD20
    .byte $FF ; |XXXXXXXX| $FD21
    .byte $FF ; |XXXXXXXX| $FD22
    .byte $FF ; |XXXXXXXX| $FD23
    .byte $FF ; |XXXXXXXX| $FD24
    .byte $FF ; |XXXXXXXX| $FD25
    .byte $FF ; |XXXXXXXX| $FD26
    .byte $FF ; |XXXXXXXX| $FD27
    .byte $FF ; |XXXXXXXX| $FD28
    .byte $FF ; |XXXXXXXX| $FD29
LFD2A:
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
    .byte $00 ; |        | $FD34
    .byte $00 ; |        | $FD35
    .byte $00 ; |        | $FD36
    .byte $01 ; |       X| $FD37
    .byte $03 ; |      XX| $FD38
    .byte $07 ; |     XXX| $FD39
    .byte $0F ; |    XXXX| $FD3A
    .byte $1F ; |   XXXXX| $FD3B
    .byte $3F ; |  XXXXXX| $FD3C
    .byte $7F ; | XXXXXXX| $FD3D
    .byte $FF ; |XXXXXXXX| $FD3E
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
    .byte $00 ; |        | $FD54
    .byte $00 ; |        | $FD55
    .byte $00 ; |        | $FD56
    .byte $00 ; |        | $FD57
    .byte $00 ; |        | $FD58
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
LFD6F:
    .byte $67 ; | XX  XXX| $FD6F
    .byte $00 ; |        | $FD70
    .byte $5F ; | X XXXXX| $FD71
    .byte $00 ; |        | $FD72
    .byte $57 ; | X X XXX| $FD73
    .byte $00 ; |        | $FD74
    .byte $4F ; | X  XXXX| $FD75
    .byte $00 ; |        | $FD76
    .byte $47 ; | X   XXX| $FD77
    .byte $00 ; |        | $FD78
    .byte $3F ; |  XXXXXX| $FD79
    .byte $00 ; |        | $FD7A
    .byte $00 ; |        | $FD7B
    .byte $00 ; |        | $FD7C
    .byte $00 ; |        | $FD7D
    .byte $00 ; |        | $FD7E
    .byte $00 ; |        | $FD7F
    .byte $00 ; |        | $FD80
    .byte $00 ; |        | $FD81
    .byte $3C ; |  XXXX  | $FD82
    .byte $66 ; | XX  XX | $FD83
    .byte $66 ; | XX  XX | $FD84
    .byte $66 ; | XX  XX | $FD85
    .byte $66 ; | XX  XX | $FD86
    .byte $66 ; | XX  XX | $FD87
    .byte $66 ; | XX  XX | $FD88
    .byte $3C ; |  XXXX  | $FD89
    .byte $3C ; |  XXXX  | $FD8A
    .byte $18 ; |   XX   | $FD8B
    .byte $18 ; |   XX   | $FD8C
    .byte $18 ; |   XX   | $FD8D
    .byte $18 ; |   XX   | $FD8E
    .byte $18 ; |   XX   | $FD8F
    .byte $38 ; |  XXX   | $FD90
    .byte $18 ; |   XX   | $FD91
    .byte $7E ; | XXXXXX | $FD92
    .byte $60 ; | XX     | $FD93
    .byte $60 ; | XX     | $FD94
    .byte $3C ; |  XXXX  | $FD95
    .byte $06 ; |     XX | $FD96
    .byte $06 ; |     XX | $FD97
    .byte $46 ; | X   XX | $FD98
    .byte $3C ; |  XXXX  | $FD99
    .byte $3C ; |  XXXX  | $FD9A
    .byte $46 ; | X   XX | $FD9B
    .byte $06 ; |     XX | $FD9C
    .byte $0C ; |    XX  | $FD9D
    .byte $0C ; |    XX  | $FD9E
    .byte $06 ; |     XX | $FD9F
    .byte $46 ; | X   XX | $FDA0
    .byte $3C ; |  XXXX  | $FDA1
    .byte $0C ; |    XX  | $FDA2
    .byte $0C ; |    XX  | $FDA3
    .byte $0C ; |    XX  | $FDA4
    .byte $7E ; | XXXXXX | $FDA5
    .byte $4C ; | X  XX  | $FDA6
    .byte $2C ; |  X XX  | $FDA7
    .byte $1C ; |   XXX  | $FDA8
    .byte $0C ; |    XX  | $FDA9
    .byte $7C ; | XXXXX  | $FDAA
    .byte $46 ; | X   XX | $FDAB
    .byte $06 ; |     XX | $FDAC
    .byte $06 ; |     XX | $FDAD
    .byte $7C ; | XXXXX  | $FDAE
    .byte $60 ; | XX     | $FDAF
    .byte $60 ; | XX     | $FDB0
    .byte $7E ; | XXXXXX | $FDB1
    .byte $3C ; |  XXXX  | $FDB2
    .byte $66 ; | XX  XX | $FDB3
    .byte $66 ; | XX  XX | $FDB4
    .byte $66 ; | XX  XX | $FDB5
    .byte $7C ; | XXXXX  | $FDB6
    .byte $60 ; | XX     | $FDB7
    .byte $62 ; | XX   X | $FDB8
    .byte $3C ; |  XXXX  | $FDB9
    .byte $18 ; |   XX   | $FDBA
    .byte $18 ; |   XX   | $FDBB
    .byte $18 ; |   XX   | $FDBC
    .byte $18 ; |   XX   | $FDBD
    .byte $0C ; |    XX  | $FDBE
    .byte $06 ; |     XX | $FDBF
    .byte $42 ; | X    X | $FDC0
    .byte $7E ; | XXXXXX | $FDC1
    .byte $3C ; |  XXXX  | $FDC2
    .byte $66 ; | XX  XX | $FDC3
    .byte $66 ; | XX  XX | $FDC4
    .byte $3C ; |  XXXX  | $FDC5
    .byte $3C ; |  XXXX  | $FDC6
    .byte $66 ; | XX  XX | $FDC7
    .byte $66 ; | XX  XX | $FDC8
    .byte $3C ; |  XXXX  | $FDC9
    .byte $3C ; |  XXXX  | $FDCA
    .byte $46 ; | X   XX | $FDCB
    .byte $06 ; |     XX | $FDCC
    .byte $3E ; |  XXXXX | $FDCD
    .byte $66 ; | XX  XX | $FDCE
    .byte $66 ; | XX  XX | $FDCF
    .byte $66 ; | XX  XX | $FDD0
    .byte $3C ; |  XXXX  | $FDD1
LFDD2:
    .byte $00 ; |        | $FDD2
    .byte $01 ; |       X| $FDD3
    .byte $00 ; |        | $FDD4
    .byte $0A ; |    X X | $FDD5
    .byte $00 ; |        | $FDD6
    .byte $64 ; | XX  X  | $FDD7
    .byte $00 ; |        | $FDD8
    .byte $E8 ; |XXX X   | $FDD9
    .byte $00 ; |        | $FDDA
    .byte $10 ; |   X    | $FDDB
LFDDC:
    .byte $00 ; |        | $FDDC
    .byte $00 ; |        | $FDDD
    .byte $00 ; |        | $FDDE
    .byte $00 ; |        | $FDDF
    .byte $00 ; |        | $FDE0
    .byte $00 ; |        | $FDE1
    .byte $00 ; |        | $FDE2
    .byte $03 ; |      XX| $FDE3
    .byte $00 ; |        | $FDE4
    .byte $27 ; |  X  XXX| $FDE5
    .byte $D0 ; |XX X    | $FDE6
    .byte $0E ; |    XXX | $FDE7
    .byte $A5 ; |X X  X X| $FDE8
    .byte $81 ; |X      X| $FDE9
    .byte $C9 ; |XX  X  X| $FDEA
    .byte $FC ; |XXXXXX  | $FDEB
    .byte $D0 ; |XX X    | $FDEC
    .byte $08 ; |    X   | $FDED
    .byte $CC ; |XX  XX  | $FDEE
    .byte $E2 ; |XXX   X | $FDEF
    .byte $2E ; |  X XXX | $FDF0
    .byte $F0 ; |XXXX    | $FDF1
    .byte $03 ; |      XX| $FDF2
    .byte $99 ; |X  XX  X| $FDF3
    .byte $88 ; |X   X   | $FDF4
    .byte $C0 ; |XX      | $FDF5
    .byte $20 ; |  X     | $FDF6
    .byte $D6 ; |XX X XX | $FDF7
    .byte $03 ; |      XX| $FDF8
    .byte $A0 ; |X X     | $FDF9
    .byte $15 ; |   X X X| $FDFA
    .byte $B1 ; |X XX   X| $FDFB
    .byte $B0 ; |X XX    | $FDFC
    .byte $91 ; |X  X   X| $FDFD
    .byte $AC ; |X X XX  | $FDFE
    .byte $88 ; |X   X   | $FDFF
LFE00:
    ldy    #0                    ; 2
    lda    $81                   ; 3
LFE04:
    cmp    #$1C                  ; 2
    bcc    LFE0D                 ; 2³
    sbc    #$1C                  ; 2
    iny                          ; 2
    bne    LFE04                 ; 2³
LFE0D:
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    #1                    ; 2
LFE12:
    asl                          ; 2
    dex                          ; 2
    bpl    LFE12                 ; 2³
    bit    $82                   ; 3
    bmi    LFE28                 ; 2³
    ora.wy $9D,Y                 ; 4
    cmp.wy $9D,Y                 ; 4
    beq    LFE2D                 ; 2³
    ldx    #$F0                  ; 2
    stx    $82                   ; 3
    bne    LFE2D                 ; 2³
LFE28:
    eor    #$FF                  ; 2
    and.wy $9D,Y                 ; 4
LFE2D:
    sta.wy $9D,Y                 ; 5
    rts                          ; 6

LFE31:
    lda    $CF                   ; 3
    lsr                          ; 2
    eor    $D0                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    eor    $D0                   ; 3
    lsr                          ; 2
    eor    $D0                   ; 3
    eor    #$01                  ; 2
    lsr                          ; 2
    ror    $CF                   ; 5
    ror    $D0                   ; 5
    rts                          ; 6

LFE45:
    lda    $8A,X                 ; 4
    cmp    $93,X                 ; 4
    bcs    LFE4F                 ; 2³
    inc    $8A,X                 ; 6
    bne    LFE62                 ; 2³
LFE4F:
    beq    LFE55                 ; 2³
    dec    $8A,X                 ; 6
    bne    LFE62                 ; 2³
LFE55:
    jsr    LFE31                 ; 6
    lda    $CF                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    LFE7A,Y               ; 4
    sta    $93,X                 ; 4
LFE62:
    rts                          ; 6

LFE63:
    lda    $F5                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    $8E,X                 ; 4
    clc                          ; 2
    adc    LFE82,Y               ; 4
    tay                          ; 2
    cpy    #$A1                  ; 2
    bcc    LFE77                 ; 2³
    ldy    #1                    ; 2
LFE77:
    sty    $8E,X                 ; 4
    rts                          ; 6

LFE7A:
    .byte $03 ; |      XX| $FE7A
    .byte $1E ; |   XXXX | $FE7B
    .byte $6E ; | XX XXX | $FE7C
    .byte $96 ; |X  X XX | $FE7D
    .byte $50 ; | X X    | $FE7E
    .byte $32 ; |  XX  X | $FE7F
    .byte $B0 ; |X XX    | $FE80
    .byte $78 ; | XXXX   | $FE81
LFE82:
    .byte $01 ; |       X| $FE82
    .byte $01 ; |       X| $FE83
    .byte $01 ; |       X| $FE84
    .byte $01 ; |       X| $FE85
    .byte $02 ; |      X | $FE86
    .byte $02 ; |      X | $FE87
    .byte $02 ; |      X | $FE88
    .byte $02 ; |      X | $FE89
LFE8A:
    clc                          ; 2
    adc    #$2E                  ; 2
    tay                          ; 2
    and    #$0F                  ; 2
    sta    $81                   ; 3
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    clc                          ; 2
    adc    $81                   ; 3
    cmp    #$0F                  ; 2
    bcc    LFEA2                 ; 2³
    sbc    #$0F                  ; 2
    iny                          ; 2
LFEA2:
    eor    #$07                  ; 2
LFEA4:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
LFEA7:
    asl                          ; 2
    rts                          ; 6

LFEA9:
    sta    HMP0,X                ; 4
    sta    WSYNC                 ; 3
LFEAD:
    dey                          ; 2
    bpl    LFEAD                 ; 2³
    sta    RESP0,X               ; 4
    rts                          ; 6

LFEB3:
    lda    #$82                  ; 2
    sta    $E3                   ; 3
    lda    #$FD                  ; 2
    sta    $E4                   ; 3
    lda    $EF                   ; 3
    sta    $85                   ; 3
    lda    $F0                   ; 3
    sta    $83                   ; 3
    lda    #$80                  ; 2
    sta    $82                   ; 3
    ldx    #9                    ; 2
LFEC9:
    lda    #0                    ; 2
    sta    $84                   ; 3
LFECD:
    sec                          ; 2
    lda    $85                   ; 3
    sbc    LFDD2,X               ; 4
    sta    $81                   ; 3
    lda    $83                   ; 3
    sbc    LFDDC,X               ; 4
    bcc    LFEE6                 ; 2³
    sta    $83                   ; 3
    lda    $81                   ; 3
    sta    $85                   ; 3
    inc    $84                   ; 5
    bne    LFECD                 ; 2³
LFEE6:
    ldy    $84                   ; 3
    cpx    #0                    ; 2
    bne    LFEFB                 ; 2³
LFEEC:
    lda    LFF97,Y               ; 4
    sta    $E5,X                 ; 4
    dex                          ; 2
    lda    LFF8D,Y               ; 4
    sta    $E5,X                 ; 4
LFEF7:
    dex                          ; 2
    bpl    LFEC9                 ; 2³
    rts                          ; 6

LFEFB:
    cpy    #0                    ; 2
    beq    LFF01                 ; 2³+1
    sty    $82                   ; 3
LFF01:
    bit    $82                   ; 3
    bpl    LFEEC                 ; 2³+1
    lda    #$FD                  ; 2
    sta    $E5,X                 ; 4
    dex                          ; 2
    lda    #$7A                  ; 2
    sta    $E5,X                 ; 4
    bne    LFEF7                 ; 2³+1
LFF10:
    lda    #$10                  ; 2
    sta    $D4                   ; 3
    ldx    #$0B                  ; 2
LFF16:
    lda    #$FD                  ; 2
    sta    $E3,X                 ; 4
    dex                          ; 2
    lda    LFD6F,X               ; 4
    sta    $E3,X                 ; 4
    dex                          ; 2
    bpl    LFF16                 ; 2³
LFF23:
    ldx    #$30                  ; 2
    lda    $D5                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    LFF75,Y               ; 4
LFF2D:
    sta    $9D,X                 ; 4
    dex                          ; 2
    bpl    LFF2D                 ; 2³
    lda    #$FC                  ; 2
    sta    $89                   ; 3
    sta    $87                   ; 3
    lda    #$64                  ; 2
    sta    $8A                   ; 3
    lda    #$32                  ; 2
    sta    $8B                   ; 3
    sta    $94                   ; 3
    sta    $95                   ; 3
    lda    #$80                  ; 2
    sta    $8E                   ; 3
    lda    #$14                  ; 2
    sta    $92                   ; 3
    lda    #$15                  ; 2
    sta    $8F                   ; 3
    sta    $90                   ; 3
    sta    $91                   ; 3
    lda    #0                    ; 2
    sta    $CE                   ; 3
    lda    $D5                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    LFF7D,Y               ; 4
    sta    $D6                   ; 3
    lda    LFF85,Y               ; 4
    sta    $D7                   ; 3
    ldx    #7                    ; 2
LFF69:
    lda    LFFF4,X               ; 4
    sta    $D8,X                 ; 4
    dex                          ; 2
    bpl    LFF69                 ; 2³
    inx                          ; 2
    stx    $F4                   ; 3
    rts                          ; 6

LFF75:
    .byte $08 ; |    X   | $FF75
    .byte $00 ; |        | $FF76
    .byte $FF ; |XXXXXXXX| $FF77
    .byte $AA ; |X X X X | $FF78
    .byte $FF ; |XXXXXXXX| $FF79
    .byte $E7 ; |XXX  XXX| $FF7A
    .byte $FF ; |XXXXXXXX| $FF7B
    .byte $FF ; |XXXXXXXX| $FF7C
LFF7D:
    .byte $B0 ; |X XX    | $FF7D
    .byte $00 ; |        | $FF7E
    .byte $A7 ; |X X  XXX| $FF7F
    .byte $00 ; |        | $FF80
    .byte $30 ; |  XX    | $FF81
    .byte $00 ; |        | $FF82
    .byte $86 ; |X    XX | $FF83
    .byte $00 ; |        | $FF84
LFF85:
    .byte $FC ; |XXXXXX  | $FF85
    .byte $F0 ; |XXXX    | $FF86
    .byte $FA ; |XXXXX X | $FF87
    .byte $F0 ; |XXXX    | $FF88
    .byte $FA ; |XXXXX X | $FF89
    .byte $F0 ; |XXXX    | $FF8A
    .byte $FA ; |XXXXX X | $FF8B
    .byte $F0 ; |XXXX    | $FF8C
LFF8D:
    .byte $82 ; |X     X | $FF8D
    .byte $8A ; |X   X X | $FF8E
    .byte $92 ; |X  X  X | $FF8F
    .byte $9A ; |X  XX X | $FF90
    .byte $A2 ; |X X   X | $FF91
    .byte $AA ; |X X X X | $FF92
    .byte $B2 ; |X XX  X | $FF93
    .byte $BA ; |X XXX X | $FF94
    .byte $C2 ; |XX    X | $FF95
    .byte $CA ; |XX  X X | $FF96
LFF97:
    .byte $FD ; |XXXXXX X| $FF97
    .byte $FD ; |XXXXXX X| $FF98
    .byte $FD ; |XXXXXX X| $FF99
    .byte $FD ; |XXXXXX X| $FF9A
    .byte $FD ; |XXXXXX X| $FF9B
    .byte $FD ; |XXXXXX X| $FF9C
    .byte $FD ; |XXXXXX X| $FF9D
    .byte $FD ; |XXXXXX X| $FF9E
    .byte $FD ; |XXXXXX X| $FF9F
    .byte $FD ; |XXXXXX X| $FFA0
    .byte $A0 ; |X X     | $FFA1
    .byte $A0 ; |X X     | $FFA2
    .byte $A0 ; |X X     | $FFA3
    .byte $AD ; |X X XX X| $FFA4
    .byte $A0 ; |X X     | $FFA5
    .byte $A0 ; |X X     | $FFA6
    .byte $A0 ; |X X     | $FFA7
    .byte $A0 ; |X X     | $FFA8
    .byte $A0 ; |X X     | $FFA9
    .byte $AD ; |X X XX X| $FFAA
    .byte $A0 ; |X X     | $FFAB
    .byte $A0 ; |X X     | $FFAC
    .byte $A0 ; |X X     | $FFAD
    .byte $A0 ; |X X     | $FFAE
    .byte $A0 ; |X X     | $FFAF
    .byte $AD ; |X X XX X| $FFB0
    .byte $A0 ; |X X     | $FFB1
    .byte $A0 ; |X X     | $FFB2
    .byte $A0 ; |X X     | $FFB3
    .byte $A0 ; |X X     | $FFB4
    .byte $A0 ; |X X     | $FFB5
    .byte $A0 ; |X X     | $FFB6
    .byte $A0 ; |X X     | $FFB7
    .byte $D4 ; |XX X X  | $FFB8
    .byte $A0 ; |X X     | $FFB9
    .byte $A0 ; |X X     | $FFBA
    .byte $A0 ; |X X     | $FFBB
    .byte $A0 ; |X X     | $FFBC
    .byte $A0 ; |X X     | $FFBD
    .byte $D4 ; |XX X X  | $FFBE
    .byte $A0 ; |X X     | $FFBF
    .byte $A0 ; |X X     | $FFC0
    .byte $A0 ; |X X     | $FFC1
    .byte $A0 ; |X X     | $FFC2
    .byte $A0 ; |X X     | $FFC3
    .byte $D4 ; |XX X X  | $FFC4
    .byte $A0 ; |X X     | $FFC5
    .byte $A0 ; |X X     | $FFC6
    .byte $A0 ; |X X     | $FFC7
    .byte $A0 ; |X X     | $FFC8
    .byte $A0 ; |X X     | $FFC9
    .byte $D4 ; |XX X X  | $FFCA
    .byte $A0 ; |X X     | $FFCB
    .byte $A0 ; |X X     | $FFCC
    .byte $A0 ; |X X     | $FFCD
    .byte $C6 ; |XX   XX | $FFCE
    .byte $A0 ; |X X     | $FFCF
    .byte $D4 ; |XX X X  | $FFD0
    .byte $A0 ; |X X     | $FFD1
    .byte $A0 ; |X X     | $FFD2
    .byte $A0 ; |X X     | $FFD3
    .byte $C6 ; |XX   XX | $FFD4
    .byte $A0 ; |X X     | $FFD5
    .byte $D4 ; |XX X X  | $FFD6
    .byte $A0 ; |X X     | $FFD7
    .byte $A0 ; |X X     | $FFD8
    .byte $A0 ; |X X     | $FFD9
    .byte $C6 ; |XX   XX | $FFDA
    .byte $A0 ; |X X     | $FFDB
    .byte $D4 ; |XX X X  | $FFDC
    .byte $A0 ; |X X     | $FFDD
    .byte $A0 ; |X X     | $FFDE
    .byte $A0 ; |X X     | $FFDF
    .byte $C6 ; |XX   XX | $FFE0
    .byte $A0 ; |X X     | $FFE1
    .byte $D4 ; |XX X X  | $FFE2
    .byte $A0 ; |X X     | $FFE3
    .byte $AD ; |X X XX X| $FFE4
    .byte $A0 ; |X X     | $FFE5
    .byte $D3 ; |XX X  XX| $FFE6
    .byte $A0 ; |X X     | $FFE7
    .byte $A0 ; |X X     | $FFE8
    .byte $A0 ; |X X     | $FFE9
    .byte $AD ; |X X XX X| $FFEA
    .byte $A0 ; |X X     | $FFEB
    .byte $D3 ; |XX X  XX| $FFEC
    .byte $A0 ; |X X     | $FFED
    .byte $A0 ; |X X     | $FFEE
    .byte $A0 ; |X X     | $FFEF
    .byte $AD ; |X X XX X| $FFF0
    .byte $A0 ; |X X     | $FFF1
    .byte $D3 ; |XX X  XX| $FFF2
    .byte $AD ; |X X XX X| $FFF3
LFFF4:
    .byte $00 ; |        | $FFF4
    .byte $03 ; |      XX| $FFF5
    .byte $06 ; |     XX | $FFF6
    .byte $0B ; |    X XX| $FFF7
    .byte $10 ; |   X    | $FFF8
    .byte $03 ; |      XX| $FFF9
    .byte $03 ; |      XX| $FFFA
    .byte $35 ; |  XX X X| $FFFB
    .byte $00 ; |        | $FFFC
    .byte $F0 ; |XXXX    | $FFFD
    .byte $E0 ; |XXX     | $FFFE
    .byte $88 ; |X   X   | $FFFF