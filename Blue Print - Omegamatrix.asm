; Disassembly of Blueprint
; Disassembled by Omegamatrix
; Using NewDiStella v3.0
;
; Command Line: newdistella -pasfcBP1.cfg bp1.bin > Blueprint1.asm
;
; BP1.cfg contents:
;
;      ORG D000
;      CODE D000 D9A5
;      GFX D9A6 D9DB
;      CODE D9DC DA06
;      GFX DA07 DFF1
;      CODE DFF2 DFF7
;      GFX DFF8 DFFF
;
; Command Line: newdistella -pasfcBP2.cfg bp2.bin > Blueprint2.asm
;
; BP2.cfg contents:
;
;      ORG F000
;      CODE F000 FC51
;      GFX FC52 FFF1
;      CODE FFF2 FFF7
;      GFX FFF8 FFFF

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
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
HMM0    =  $22
HMBL    =  $24
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXP0FB  =  $32
CXPPMM  =  $37
INPT4   =  $3C
INPT5   =  $3D
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM8T   =  $0295
TIM64T  =  $0296


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      CONSTANTS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SCANLINES_UNK    = $30
Y_OFFSET_UNK     = $42

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      FIRST BANK
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $D000

START:
    sta    LFFF9                 ; 4
    sta    WSYNC                 ; 3
    lda    $E3                   ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #0                    ; 2
    sta    COLUBK                ; 3
    lda    $DD                   ; 3
    bpl    LD029                 ; 2³
    lda    #0                    ; 2
    sta    HMP0                  ; 3
    lda    #$10                  ; 2
    sta    HMP1                  ; 3
    sta    RESM0                 ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    lda    #$80                  ; 2
    sta    HMM0                  ; 3
    lda    #4                    ; 2
    bne    LD03F                 ; 2³
LD029:
    nop                          ; 2
    nop                          ; 2
    lda    #$50                  ; 2
    sta    HMP0                  ; 3
    lda    #$60                  ; 2
    sta    HMP1                  ; 3
    lda    #$D0                  ; 2
    sta    HMM0                  ; 3
    lda    #0                    ; 2
    sta    RESM0                 ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
LD03F:
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    CXCLR                 ; 3
    lda    $DD                   ; 3
    bpl    LD055                 ; 2³
    jsr    LD347                 ; 6
    nop                          ; 2
    nop                          ; 2
    jmp    LD061                 ; 3
LD055:
    lda    $80                   ; 3
    sta    $82                   ; 3
    lda    $81                   ; 3
    sta    $83                   ; 3
    lda    $84                   ; 3
    sta    $85                   ; 3
LD061:
    jsr    LD347                 ; 6
    jsr    LD347                 ; 6
    ldy    #4                    ; 2
    ldx    $85                   ; 3
    lda    $84                   ; 3
    sta    ENAM0                 ; 3
    clc                          ; 2
LD070:
    sta    WSYNC                 ; 3
    lda    ($9E),Y               ; 5
    ora    ($9C),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($9A),Y               ; 5
    ora    ($98),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($A6),Y               ; 5
    ora    ($A4),Y               ; 5
    stx    ENAM0                 ; 3
    sta    GRP0                  ; 3
    lda    ($A2),Y               ; 5
    ora    ($A0),Y               ; 5
    sta    GRP1                  ; 3
    lda    $84                   ; 3
    sta    ENAM0                 ; 3
    bcs    LD095                 ; 2³
    sec                          ; 2
    bcs    LD070                 ; 2³
LD095:
    clc                          ; 2
    dey                          ; 2
    bpl    LD070                 ; 2³
    sta    WSYNC                 ; 3
    iny                          ; 2
    sty    ENAM0                 ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    NUSIZ0                ; 3
    sty    NUSIZ1                ; 3
    bit    $8A                   ; 3
    bvc    LD0AE                 ; 2³
    ldy    #$A2                  ; 2
    bne    LD0B0                 ; 2³
LD0AE:
    ldy    #$44                  ; 2
LD0B0:
    sty    COLUP0                ; 3
    lda    $88                   ; 3
    beq    LD0C2                 ; 2³
    lda    $DD                   ; 3
    and    #$40                  ; 2
    bne    LD0BF                 ; 2³
    jmp    LD4C2                 ; 3
LD0BF:
    jmp    LD4CF                 ; 3
LD0C2:
    sta    WSYNC                 ; 3
    lda    ($FB,X)               ; 6
    lda    $BE                   ; 3
    sta    HMBL                  ; 3
    ldx    $BD                   ; 3
LD0CC:
    dex                          ; 2
    bpl    LD0CC                 ; 2³
    sta    RESBL                 ; 3
    sta    WSYNC                 ; 3
    lda    ($FB,X)               ; 6
    lda    $AF                   ; 3
    sta    HMP1                  ; 3
    ldx    $AE                   ; 3
LD0DB:
    dex                          ; 2
    bpl    LD0DB                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
    lda    ($FB,X)               ; 6
    lda    $B1                   ; 3
    sta    HMP0                  ; 3
    ldx    $B0                   ; 3
LD0EA:
    dex                          ; 2
    bpl    LD0EA                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    ldy    #0                    ; 2
    lda    $DD                   ; 3
    and    #$40                  ; 2
    bne    LD100                 ; 2³+1
    lda    #1                    ; 2
    eor    $E8                   ; 3
    tay                          ; 2
LD100:
    sty    $E8                   ; 3
    lda    #$1C                  ; 2
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
    sta    HMCLR                 ; 3
    lda    #$A2                  ; 2
    sta    COLUBK                ; 3
    ldy    #0                    ; 2
    sty    $BB                   ; 3
    lda    $C0                   ; 3
    bne    LD124                 ; 2³
    lda    #4                    ; 2
    sta    $C0                   ; 3
    lda    $F0                   ; 3
    bne    LD124                 ; 2³
    lda    $BF                   ; 3
    eor    #$01                  ; 2
    sta    $BF                   ; 3
LD124:
    dec    $C0                   ; 5
    lda    $BF                   ; 3
    bne    LD134                 ; 2³
    lda    #0                    ; 2
    sta    $98                   ; 3
    lda    #$2A                  ; 2
    sta    $9A                   ; 3
    bne    LD13C                 ; 2³
LD134:
    lda    #$15                  ; 2
    sta    $98                   ; 3
    lda    #$3F                  ; 2
    sta    $9A                   ; 3
LD13C:
    sta    WSYNC                 ; 3
    lda    ($98),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($9A),Y               ; 5
    sta    GRP0                  ; 3
    lda    LDB78,Y               ; 4
    sta    COLUP1                ; 3
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    iny                          ; 2
    lda    #2                    ; 2
    cpy    $F6                   ; 3
    beq    LD15C                 ; 2³
    cpy    $BC                   ; 3
    bne    LD15E                 ; 2³
    lda    #0                    ; 2
LD15C:
    sta    $BB                   ; 3
LD15E:
    cpy    #$15                  ; 2
    bne    LD13C                 ; 2³
    sta    WSYNC                 ; 3
    ldx    CXP0FB                ; 3
    lda    CXPPMM                ; 3
    sta    CXCLR                 ; 3
    bpl    LD170                 ; 2³
    lda    #1                    ; 2
    sta    $8D                   ; 3
LD170:
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    iny                          ; 2
    lda    #2                    ; 2
    cpy    $F6                   ; 3
    beq    LD181                 ; 2³
    cpy    $BC                   ; 3
    bne    LD183                 ; 2³
    lda    #0                    ; 2
LD181:
    sta    $BB                   ; 3
LD183:
    txa                          ; 2
    and    #$40                  ; 2
    beq    LD18E                 ; 2³
    lda    #$10                  ; 2
    ora    $8A                   ; 3
    sta    $8A                   ; 3
LD18E:
    lda    $8A                   ; 3
    and    #$02                  ; 2
    beq    LD197                 ; 2³
    jmp    LD5C6                 ; 3
LD197:
    sta    WSYNC                 ; 3
    lda    #0                    ; 2
    sta    COLUBK                ; 3
    sta    COLUBK                ; 3
    lda    #$40                  ; 2
    sta    HMP1                  ; 3
    ldx    #3                    ; 2
LD1A5:
    dex                          ; 2
    bpl    LD1A5                 ; 2³
    sta    RESP1                 ; 3
    bit    $8A                   ; 3
    bvc    LD1B2                 ; 2³
    sta    WSYNC                 ; 3
    bvs    LD1D6                 ; 2³
LD1B2:
    lda    $8A                   ; 3
    bpl    LD1C7                 ; 2³
    sta    WSYNC                 ; 3
    lda    ($FB,X)               ; 6
    lda    $B6                   ; 3
    sta    HMP0                  ; 3
    ldx    $B5                   ; 3
LD1C0:
    dex                          ; 2
    bpl    LD1C0                 ; 2³
    sta    RESP0                 ; 3
    bmi    LD1D6                 ; 2³
LD1C7:
    sta    WSYNC                 ; 3
    lda    ($FB,X)               ; 6
    lda    $B3                   ; 3
    sta    HMP0                  ; 3
    ldx    $B2                   ; 3
LD1D1:
    dex                          ; 2
    bpl    LD1D1                 ; 2³
    sta    RESP0                 ; 3
LD1D6:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    #6                    ; 2
    sta    NUSIZ1                ; 3
    ldx    #0                    ; 2
    stx    NUSIZ0                ; 3
    lda    #1                    ; 2
    sta    CTRLPF                ; 3
    ldy    #2                    ; 2
    lda    $FA                   ; 3
    cmp    #2                    ; 2
    bcs    LD1EF                 ; 2³
    tay                          ; 2
LD1EF:
    lda    LDBD2,Y               ; 4
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
    sta    HMCLR                 ; 3
    lda    #$FF                  ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    $8A                   ; 3
    bmi    LD21C                 ; 2³
    lda    $AA                   ; 3
    cmp    #$7E                  ; 2
    bne    LD234                 ; 2³
    ldy    #2                    ; 2
    lda    $D1                   ; 3
    cmp    #3                    ; 2
    bcs    LD214                 ; 2³
    tay                          ; 2
    dey                          ; 2
LD214:
    lda    LDBAC,Y               ; 4
    sta    $AC                   ; 3
    jmp    LD234                 ; 3
LD21C:
    lda    $AA                   ; 3
    sta    $98                   ; 3
    lda    #$88                  ; 2
    sta    $AA                   ; 3
    lda    $AC                   ; 3
    sta    $9C                   ; 3
    lda    #$B9                  ; 2
    sta    $AC                   ; 3
    lda    $F2                   ; 3
    sta    $9A                   ; 3
    lda    $F4                   ; 3
    sta    $F2                   ; 3
LD234:
    lda    #$12                  ; 2
    sta    $FB                   ; 3
    ldy    #0                    ; 2
    jsr    LD319                 ; 6
    sta    WSYNC                 ; 3
    lda    ($AC),Y               ; 5
    sta    COLUP0                ; 3
    lda    LDA10,X               ; 4
    sta    PF1                   ; 3
    lda    ($AA),Y               ; 5
    sta    GRP0                  ; 3
    lda    LDA78,X               ; 4
    sta    PF2                   ; 3
    lda    #$30                  ; 2
    sta    HMP1                  ; 3
    nop                          ; 2
    nop                          ; 2
    sta    RESP1                 ; 3
    inx                          ; 2
    cpx    $F2                   ; 3
    bne    LD260                 ; 2³
    ldy    #$0B                  ; 2
LD260:
    cpy    #0                    ; 2
    beq    LD265                 ; 2³
    dey                          ; 2
LD265:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    ($AC),Y               ; 5
    sta    COLUP0                ; 3
    lda    LDA10,X               ; 4
    sta    PF1                   ; 3
    lda    ($AA),Y               ; 5
    sta    GRP0                  ; 3
    lda    LDA78,X               ; 4
    sta    PF2                   ; 3
    inx                          ; 2
    cpx    $F2                   ; 3
    bne    LD282                 ; 2³
    ldy    #$0B                  ; 2
LD282:
    cpy    #0                    ; 2
    beq    LD287                 ; 2³
    dey                          ; 2
LD287:
    lda    #$34                  ; 2
    sta    $FB                   ; 3
    lda    #3                    ; 2
    sta    NUSIZ1                ; 3
    lda    ($AC),Y               ; 5
    jsr    LD319                 ; 6
    sta    WSYNC                 ; 3
    lda    ($AC),Y               ; 5
    sta    COLUP0                ; 3
    lda    LDA10,X               ; 4
    sta    PF1                   ; 3
    lda    ($AA),Y               ; 5
    sta    GRP0                  ; 3
    lda    LDA78,X               ; 4
    sta    PF2                   ; 3
    inx                          ; 2
    cpx    $F2                   ; 3
    bne    LD2AF                 ; 2³
    ldy    #$0B                  ; 2
LD2AF:
    cpy    #0                    ; 2
    beq    LD2B4                 ; 2³
    dey                          ; 2
LD2B4:
    lda    #$57                  ; 2
    sta    $FB                   ; 3
    lda    #2                    ; 2
    sta    NUSIZ1                ; 3
    lda    ($AC),Y               ; 5
    jsr    LD319                 ; 6
    sta    WSYNC                 ; 3
    lda    ($AC),Y               ; 5
    sta    COLUP0                ; 3
    lda    LDA10,X               ; 4
    sta    PF1                   ; 3
    lda    ($AA),Y               ; 5
    sta    GRP0                  ; 3
    lda    LDA78,X               ; 4
    sta    PF2                   ; 3
    lda    #$70                  ; 2
    sta    HMP1                  ; 3
    sta    RESP1                 ; 3
    inx                          ; 2
    cpx    $F2                   ; 3
    bne    LD2E2                 ; 2³
    ldy    #$0B                  ; 2
LD2E2:
    cpy    #0                    ; 2
    beq    LD2E7                 ; 2³
    dey                          ; 2
LD2E7:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    ($AC),Y               ; 5
    sta    COLUP0                ; 3
    lda    LDA10,X               ; 4
    sta    PF1                   ; 3
    lda    ($AA),Y               ; 5
    sta    GRP0                  ; 3
    lda    LDA78,X               ; 4
    sta    PF2                   ; 3
    inx                          ; 2
    cpx    $F2                   ; 3
    bne    LD304                 ; 2³
    ldy    #$0B                  ; 2
LD304:
    cpy    #0                    ; 2
    beq    LD309                 ; 2³
    dey                          ; 2
LD309:
    lda    #$68                  ; 2
    sta    $FB                   ; 3
    lda    #4                    ; 2
    sta    NUSIZ1                ; 3
    lda    #$D3                  ; 2
    pha                          ; 3
    lda    #$47                  ; 2
    pha                          ; 3
    lda    ($AC),Y               ; 5
LD319:
    sta    WSYNC                 ; 3
    sta    COLUP0                ; 3
    lda    LDA10,X               ; 4
    sta    PF1                   ; 3
    lda    ($AA),Y               ; 5
    sta    GRP0                  ; 3
    lda    LDB00,X               ; 4
    sta    GRP1                  ; 3
    lda    LDA78,X               ; 4
    sta    PF2                   ; 3
    lda    LDB68,X               ; 4
    inx                          ; 2
    sta    COLUP1                ; 3
    cpx    $F2                   ; 3
    bne    LD33C                 ; 2³
    ldy    #$0B                  ; 2
LD33C:
    cpy    #0                    ; 2
    beq    LD341                 ; 2³
    dey                          ; 2
LD341:
    lda    ($AC),Y               ; 5
    cpx    $FB                   ; 3
    bne    LD319                 ; 2³
LD347:
    rts                          ; 6

LD348:
    sta    WSYNC                 ; 3
    lda    #0                    ; 2
    sta    GRP1                  ; 3
    lda    ($AA),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($AC),Y               ; 5
    sta    COLUP0                ; 3
    lda    $DE                   ; 3
    sta    PF1                   ; 3
    lda    $DF                   ; 3
    sta    PF2                   ; 3
    nop                          ; 2
    nop                          ; 2
    lda    $E0                   ; 3
    sta    PF1                   ; 3
    inx                          ; 2
    cpx    $F2                   ; 3
    bne    LD36B                 ; 2³
    ldy    #$0B                  ; 2
LD36B:
    cpy    #0                    ; 2
    beq    LD370                 ; 2³
    dey                          ; 2
LD370:
    cpx    #$6B                  ; 2
    bne    LD348                 ; 2³
    sta    WSYNC                 ; 3
    lda    ($AA),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($AC),Y               ; 5
    sta    COLUP0                ; 3
    lda    #0                    ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    NUSIZ1                ; 3
    lda    #$20                  ; 2
    sta    HMP1                  ; 3
    lda    #$FA                  ; 2
    sta    COLUPF                ; 3
    inx                          ; 2
    nop                          ; 2
    sta    RESP1                 ; 3
    cpx    $F2                   ; 3
    bne    LD39A                 ; 2³
    ldy    #$0B                  ; 2
LD39A:
    cpy    #0                    ; 2
    beq    LD39F                 ; 2³
    dey                          ; 2
LD39F:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    ($AA),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($AC),Y               ; 5
    sta    COLUP0                ; 3
    inx                          ; 2
    cpx    $F2                   ; 3
    bne    LD3B2                 ; 2³
    ldy    #$0B                  ; 2
LD3B2:
    cpy    #0                    ; 2
    beq    LD3B7                 ; 2³
    dey                          ; 2
LD3B7:
    sta    WSYNC                 ; 3
    lda    ($AA),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($AC),Y               ; 5
    sta    COLUP0                ; 3
    inx                          ; 2
    cpx    $F2                   ; 3
    bne    LD3C8                 ; 2³
    ldy    #$0B                  ; 2
LD3C8:
    cpy    #0                    ; 2
    beq    LD3CD                 ; 2³
    dey                          ; 2
LD3CD:
    cpx    #$70                  ; 2
    bne    LD3B7                 ; 2³
    sty    $FB                   ; 3
    ldy    $89                   ; 3
    lda.wy $8B,Y                 ; 4
    sta    $C1                   ; 3
    ldy    $FB                   ; 3
    bit    $8A                   ; 3
    bvc    LD40D                 ; 2³+1
    lda    #$44                  ; 2
    sta    COLUP0                ; 3
LD3E4:
    sta    WSYNC                 ; 3
    lda    ($9A),Y               ; 5
    sta    GRP0                  ; 3
    lda    LDC90,X               ; 4
    sta    GRP1                  ; 3
    bne    LD3FE                 ; 2³
    sty    $FB                   ; 3
    lsr    $C1                   ; 5
    rol                          ; 2
    tay                          ; 2
    lda    LDD2C,Y               ; 4
    sta    COLUP1                ; 3
    ldy    $FB                   ; 3
LD3FE:
    cpy    #$14                  ; 2
    beq    LD403                 ; 2³
    iny                          ; 2
LD403:
    inx                          ; 2
    cpx    #$9C                  ; 2
    bne    LD3E4                 ; 2³+1
    ldx    #$16                  ; 2
    jmp    LD96C                 ; 3
LD40D:
    lda    $8A                   ; 3
    bmi    LD448                 ; 2³
    lda    $E8                   ; 3
    bne    LD448                 ; 2³
LD415:
    sta    WSYNC                 ; 3
    lda    ($AA),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($AC),Y               ; 5
    sta    COLUP0                ; 3
    lda    LDC90,X               ; 4
    sta    GRP1                  ; 3
    bne    LD433                 ; 2³
    sty    $FB                   ; 3
    lsr    $C1                   ; 5
    rol                          ; 2
    tay                          ; 2
    lda    LDD2C,Y               ; 4
    sta    COLUP1                ; 3
    ldy    $FB                   ; 3
LD433:
    inx                          ; 2
    cpx    $F2                   ; 3
    bne    LD43A                 ; 2³
    ldy    #$0B                  ; 2
LD43A:
    cpy    #0                    ; 2
    beq    LD43F                 ; 2³
    dey                          ; 2
LD43F:
    cpx    #$9C                  ; 2
    bne    LD415                 ; 2³
    sta    WSYNC                 ; 3
    jmp    LD903                 ; 3
LD448:
    sta    WSYNC                 ; 3
    lda    LDC90,X               ; 4
    sta    GRP1                  ; 3
    lsr    $C1                   ; 5
    rol                          ; 2
    tay                          ; 2
    lda    LDD2C,Y               ; 4
    sta    COLUP1                ; 3
    lda    #0                    ; 2
    sta    NUSIZ0                ; 3
    ldy    $89                   ; 3
    lda.wy $8B,Y                 ; 4
    cmp    #$FF                  ; 2
    beq    LD469                 ; 2³
    lda    #$42                  ; 2
    bne    LD46C                 ; 2³
LD469:
    lda    #$D6                  ; 2
    nop                          ; 2
LD46C:
    sta    $FB                   ; 3
    lda    #$42                  ; 2
    sta    $FC                   ; 3
    lda    ($FB,X)               ; 6
    nop                          ; 2
    nop                          ; 2
    sta    RESP0                 ; 3
    inx                          ; 2
LD479:
    sta    WSYNC                 ; 3
    lda    LDD43,X               ; 4
    sta    PF1                   ; 3
    lda    $FB                   ; 3
    sta    COLUPF                ; 3
    lda    LDC90,X               ; 4
    sta    GRP1                  ; 3
    bne    LD496                 ; 2³
    lsr    $C1                   ; 5
    rol                          ; 2
    tay                          ; 2
    lda    LDD2C,Y               ; 4
    sta    COLUP1                ; 3
    bne    LD49B                 ; 2³
LD496:
    jsr    LD347                 ; 6
    lda    ($FB,X)               ; 6
LD49B:
    lda    LDB64,X               ; 4
    sta    GRP0                  ; 3
    lda    $FC                   ; 3
    sta    COLUP0                ; 3
    lda    #0                    ; 2
    sta    PF1                   ; 3
    inx                          ; 2
    cpx    #$9C                  ; 2
    bne    LD479                 ; 2³
    sta    WSYNC                 ; 3
    lda    $E8                   ; 3
    bne    LD4BF                 ; 2³
    lda    $98                   ; 3
    sta    $AA                   ; 3
    lda    $9A                   ; 3
    sta    $F2                   ; 3
    lda    $9C                   ; 3
    sta    $AC                   ; 3
LD4BF:
    jmp    LD903                 ; 3
LD4C2:
    sta    WSYNC                 ; 3
    lda    #$83                  ; 2
    sta    $FB                   ; 3
    lda    #$FB                  ; 2
    sta    $FC                   ; 3
    jmp    LDFF2                 ; 3
LD4CF:
    sta    WSYNC                 ; 3
    lda    #$90                  ; 2
    sta    HMP0                  ; 3
    ldx    #6                    ; 2
LD4D7:
    dex                          ; 2
    bpl    LD4D7                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    ldy    #0                    ; 2
    lda    $E1                   ; 3
    bne    LD4F6                 ; 2³
    lda    $DD                   ; 3
    bpl    LD4EE                 ; 2³
    lda    $E2                   ; 3
    bne    LD4F6                 ; 2³
LD4EE:
    lda    $F2                   ; 3
    cmp    #$80                  ; 2
    bcs    LD4F6                 ; 2³
    ldy    #1                    ; 2
LD4F6:
    sty    $FB                   ; 3
    ldy    #0                    ; 2
LD4FA:
    sta    WSYNC                 ; 3
    inx                          ; 2
    cpx    $F2                   ; 3
    bne    LD503                 ; 2³
    ldy    #$10                  ; 2
LD503:
    cpy    #0                    ; 2
    beq    LD508                 ; 2³
    dey                          ; 2
LD508:
    lda    LDEB8,Y               ; 4
    sta    GRP0                  ; 3
    lda    LDEC7,Y               ; 4
    sta    COLUP0                ; 3
    lda    $FB                   ; 3
    beq    LD569                 ; 2³
    cpx    #$91                  ; 2
    bne    LD569                 ; 2³
    sta    WSYNC                 ; 3
    lda    #$38                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #1                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #0                    ; 2
    sta    HMP0                  ; 3
    lda    #$10                  ; 2
    sta    HMP1                  ; 3
    ldy    #$B8                  ; 2
    jsr    LD347                 ; 6
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
LD53D:
    sta    WSYNC                 ; 3
    lda    LDF00,Y               ; 4
    sta    GRP0                  ; 3
    dey                          ; 2
    lda    LDF00,Y               ; 4
    sta    GRP1                  ; 3
    dey                          ; 2
    lda    LDF00,Y               ; 4
    tax                          ; 2
    dey                          ; 2
    lda    LDF00,Y               ; 4
    jsr    LD347                 ; 6
    nop                          ; 2
    stx    GRP0                  ; 3
    sta    GRP1                  ; 3
    dey                          ; 2
    bne    LD53D                 ; 2³
    sta    WSYNC                 ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    ldx    #$0C                  ; 2
    jmp    LD96C                 ; 3
LD569:
    cpx    #$B1                  ; 2
    bne    LD4FA                 ; 2³+1
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    jsr    LD57B                 ; 6
    ldx    #$12                  ; 2
    jmp    LD96C                 ; 3
LD57B:
    sta    WSYNC                 ; 3
    ldx    $89                   ; 3
    ldy    $E1,X                 ; 4
    lda    $8A                   ; 3
    and    #$02                  ; 2
    beq    LD588                 ; 2³
    dey                          ; 2
LD588:
    lda    LDBA6,Y               ; 4
    sta    $FB,X                 ; 4
    txa                          ; 2
    eor    #$01                  ; 2
    tax                          ; 2
    ldy    $E1,X                 ; 4
    lda    LDBA6,Y               ; 4
    sta    $FB,X                 ; 4
    ldx    #5                    ; 2
    lda    $DD                   ; 3
    bmi    LD5A2                 ; 2³
    lda    #0                    ; 2
    sta    $FC                   ; 3
LD5A2:
    sta    WSYNC                 ; 3
    lda    $FB                   ; 3
    sta    PF1                   ; 3
    lda    #$1C                  ; 2
    sta    COLUPF                ; 3
    lda    ($FB,X)               ; 6
    lda    ($FB,X)               ; 6
    lda    ($FB,X)               ; 6
    lda    ($FB,X)               ; 6
    lda    #$A6                  ; 2
    ldy    $FC                   ; 3
    sta    COLUPF                ; 3
    sty    PF1                   ; 3
    dex                          ; 2
    bpl    LD5A2                 ; 2³
    sta    WSYNC                 ; 3
    lda    #0                    ; 2
    sta    PF1                   ; 3
    rts                          ; 6

LD5C6:
    sta    WSYNC                 ; 3
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    lda    #0                    ; 2
    sta    COLUBK                ; 3
    lda    #$20                  ; 2
    sta    HMP0                  ; 3
    lda    #$30                  ; 2
    sta    HMP1                  ; 3
    lda    #1                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    iny                          ; 2
    lda    #2                    ; 2
    cpy    $F6                   ; 3
    bne    LD5EC                 ; 2³
    sta    $BB                   ; 3
    jsr    LD347                 ; 6
    beq    LD5FB                 ; 2³
LD5EC:
    cpy    $BC                   ; 3
    beq    LD5F5                 ; 2³
    pha                          ; 3
    pla                          ; 4
    nop                          ; 2
    bne    LD5FB                 ; 2³
LD5F5:
    lda    #0                    ; 2
    sta    $BB                   ; 3
    lda    ($FB,X)               ; 6
LD5FB:
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    iny                          ; 2
    sty    $FB                   ; 3
    ldx    #$0C                  ; 2
    lda    #2                    ; 2
    cpy    $F6                   ; 3
    beq    LD618                 ; 2³
    cpy    $BC                   ; 3
    bne    LD61A                 ; 2³
    lda    #0                    ; 2
LD618:
    sta    $BB                   ; 3
LD61A:
    sta    WSYNC                 ; 3
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    lda    LDC00,X               ; 4
    sta    GRP0                  ; 3
    lda    LDC0D,X               ; 4
    sta    GRP1                  ; 3
    lda    LDC34,X               ; 4
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldy    $FB                   ; 3
    iny                          ; 2
    sty    $FB                   ; 3
    cpy    $F6                   ; 3
    bne    LD641                 ; 2³
    lda    LDE86                 ; 4
    sta    $BB                   ; 3
    bne    LD649                 ; 2³
LD641:
    cpy    $BC                   ; 3
    beq    LD647                 ; 2³
    bne    LD649                 ; 2³
LD647:
    sta    $BB                   ; 3
LD649:
    lda    LDC1A,X               ; 4
    ldy    LDC27,X               ; 4
    sta    GRP0                  ; 3
    sty    GRP1                  ; 3
    dex                          ; 2
    bpl    LD61A                 ; 2³
    sta    WSYNC                 ; 3
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    lda    #$80                  ; 2
    sta    HMP0                  ; 3
    sta    HMP1                  ; 3
    ldy    $FB                   ; 3
    iny                          ; 2
    cpy    $F6                   ; 3
    bne    LD66D                 ; 2³
    lda    #2                    ; 2
    sta    $BB                   ; 3
LD66D:
    cpy    $BC                   ; 3
    bne    LD675                 ; 2³
    lda    #0                    ; 2
    sta    $BB                   ; 3
LD675:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    lda    #0                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$0E                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldx    #5                    ; 2
    iny                          ; 2
    lda    #2                    ; 2
    cpy    $F6                   ; 3
    beq    LD698                 ; 2³
    cpy    $BC                   ; 3
    bne    LD69A                 ; 2³
    lda    #0                    ; 2
LD698:
    sta    $BB                   ; 3
LD69A:
    sta    WSYNC                 ; 3
    lda    #0                    ; 2
    sta    PF1                   ; 3
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    jsr    LD347                 ; 6
    lda    ($FB,X)               ; 6
    iny                          ; 2
    lda    #2                    ; 2
    cpy    $F6                   ; 3
    beq    LD6B6                 ; 2³
    cpy    $BC                   ; 3
    bne    LD6B8                 ; 2³
    lda    #0                    ; 2
LD6B6:
    sta    $BB                   ; 3
LD6B8:
    lda    #$7E                  ; 2
    sta    PF1                   ; 3
    dex                          ; 2
    bpl    LD69A                 ; 2³
    tya                          ; 2
    tax                          ; 2
    ldy    #$17                  ; 2
LD6C3:
    sta    WSYNC                 ; 3
    lda    #0                    ; 2
    sta    PF1                   ; 3
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    lda    ($E9),Y               ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    lda    ($E9),Y               ; 5
    sta    GRP1                  ; 3
    inx                          ; 2
    lda    #2                    ; 2
    cpx    $F6                   ; 3
    beq    LD6E3                 ; 2³
    cpx    $BC                   ; 3
    bne    LD6E5                 ; 2³
    lda    #0                    ; 2
LD6E3:
    sta    $BB                   ; 3
LD6E5:
    lda    #$42                  ; 2
    sta    PF1                   ; 3
    dey                          ; 2
    bpl    LD6C3                 ; 2³
    txa                          ; 2
    tay                          ; 2
    ldx    #5                    ; 2
LD6F0:
    sta    WSYNC                 ; 3
    lda    #0                    ; 2
    sta    PF1                   ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    jsr    LD347                 ; 6
    iny                          ; 2
    lda    #2                    ; 2
    cpy    $F6                   ; 3
    beq    LD70E                 ; 2³
    cpy    $BC                   ; 3
    bne    LD710                 ; 2³
    lda    #0                    ; 2
LD70E:
    sta    $BB                   ; 3
LD710:
    lda    #$7E                  ; 2
    sta    PF1                   ; 3
    dex                          ; 2
    bpl    LD6F0                 ; 2³+1
    sta    WSYNC                 ; 3
    lda    #0                    ; 2
    sta    PF1                   ; 3
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    lda    #0                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    $FB                   ; 3
    sta    RESP0                 ; 3
    lda    #$CA                  ; 2
    sta    RESP1                 ; 3
    sta    COLUP0                ; 3
    lda    #$38                  ; 2
    sta    COLUP1                ; 3
    iny                          ; 2
    lda    #2                    ; 2
    cpy    $F6                   ; 3
    beq    LD742                 ; 2³
    cpy    $BC                   ; 3
    bne    LD744                 ; 2³
    lda    #0                    ; 2
LD742:
    sta    $BB                   ; 3
LD744:
    ldx    $89                   ; 3
    lda    $8E,X                 ; 4
    sta    $FD                   ; 3
    sta    WSYNC                 ; 3
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    iny                          ; 2
    lda    #2                    ; 2
    cpy    $F6                   ; 3
    beq    LD75D                 ; 2³
    cpy    $BC                   ; 3
    bne    LD75F                 ; 2³
    lda    #0                    ; 2
LD75D:
    sta    $BB                   ; 3
LD75F:
    lda    #$A6                  ; 2
    lsr    $FD                   ; 5
    bcs    LD767                 ; 2³
    lda    #$D6                  ; 2
LD767:
    sta    $EE                   ; 3
    sty    $FB                   ; 3
    ldy    #5                    ; 2
    ldx    #$2F                  ; 2
    jsr    LD9DC                 ; 6
    sta    WSYNC                 ; 3
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    ldy    $FB                   ; 3
    iny                          ; 2
    lda    #2                    ; 2
    cpy    $F6                   ; 3
    beq    LD787                 ; 2³
    cpy    $BC                   ; 3
    bne    LD789                 ; 2³
    lda    #0                    ; 2
LD787:
    sta    $BB                   ; 3
LD789:
    lda    #$AC                  ; 2
    lsr    $FD                   ; 5
    bcs    LD791                 ; 2³
    lda    #$D6                  ; 2
LD791:
    sta    $EE                   ; 3
    sty    $FB                   ; 3
    ldy    #5                    ; 2
    jsr    LD9DC                 ; 6
    sta    WSYNC                 ; 3
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    ldy    $FB                   ; 3
    iny                          ; 2
    lda    #2                    ; 2
    cpy    $F6                   ; 3
    beq    LD7AF                 ; 2³
    cpy    $BC                   ; 3
    bne    LD7B1                 ; 2³
    lda    #0                    ; 2
LD7AF:
    sta    $BB                   ; 3
LD7B1:
    lda    #$B2                  ; 2
    lsr    $FD                   ; 5
    bcs    LD7B9                 ; 2³
    lda    #$D6                  ; 2
LD7B9:
    sta    $EE                   ; 3
    sty    $FB                   ; 3
    ldy    #5                    ; 2
    jsr    LD9DC                 ; 6
    sta    WSYNC                 ; 3
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    ldy    $FB                   ; 3
    iny                          ; 2
    lda    #2                    ; 2
    cpy    $F6                   ; 3
    beq    LD7D7                 ; 2³
    cpy    $BC                   ; 3
    bne    LD7D9                 ; 2³
    lda    #0                    ; 2
LD7D7:
    sta    $BB                   ; 3
LD7D9:
    lda    #$B8                  ; 2
    lsr    $FD                   ; 5
    bcs    LD7E1                 ; 2³
    lda    #$D6                  ; 2
LD7E1:
    sta    $EE                   ; 3
    sty    $FB                   ; 3
    ldy    #5                    ; 2
    jsr    LD9DC                 ; 6
    sta    WSYNC                 ; 3
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    ldy    $FB                   ; 3
    iny                          ; 2
    lda    #2                    ; 2
    cpy    $F6                   ; 3
    beq    LD7FF                 ; 2³
    cpy    $BC                   ; 3
    bne    LD801                 ; 2³+1
    lda    #0                    ; 2
LD7FF:
    sta    $BB                   ; 3
LD801:
    lda    #$BE                  ; 2
    lsr    $FD                   ; 5
    bcs    LD809                 ; 2³
    lda    #$D6                  ; 2
LD809:
    sta    $EE                   ; 3
    sty    $FB                   ; 3
    ldy    #5                    ; 2
    jsr    LD9DC                 ; 6
    sta    WSYNC                 ; 3
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    ldy    $FB                   ; 3
    iny                          ; 2
    lda    #2                    ; 2
    cpy    $F6                   ; 3
    beq    LD827                 ; 2³
    cpy    $BC                   ; 3
    bne    LD829                 ; 2³
    lda    #0                    ; 2
LD827:
    sta    $BB                   ; 3
LD829:
    lda    #$C4                  ; 2
    lsr    $FD                   ; 5
    bcs    LD831                 ; 2³
    lda    #$D6                  ; 2
LD831:
    sta    $EE                   ; 3
    sty    $FB                   ; 3
    ldy    #5                    ; 2
    jsr    LD9DC                 ; 6
    sta    WSYNC                 ; 3
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    ldy    $FB                   ; 3
    iny                          ; 2
    lda    #2                    ; 2
    cpy    $F6                   ; 3
    beq    LD84F                 ; 2³
    cpy    $BC                   ; 3
    bne    LD851                 ; 2³
    lda    #0                    ; 2
LD84F:
    sta    $BB                   ; 3
LD851:
    lda    #$CA                  ; 2
    lsr    $FD                   ; 5
    bcs    LD859                 ; 2³
    lda    #$D6                  ; 2
LD859:
    sta    $EE                   ; 3
    sty    $FB                   ; 3
    ldy    #5                    ; 2
    jsr    LD9DC                 ; 6
    sta    WSYNC                 ; 3
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    ldy    $FB                   ; 3
    iny                          ; 2
    lda    #2                    ; 2
    cpy    $F6                   ; 3
    beq    LD877                 ; 2³
    cpy    $BC                   ; 3
    bne    LD879                 ; 2³
    lda    #0                    ; 2
LD877:
    sta    $BB                   ; 3
LD879:
    lda    #$D0                  ; 2
    lsr    $FD                   ; 5
    bcs    LD881                 ; 2³
    lda    #$D6                  ; 2
LD881:
    sta    $EE                   ; 3
    sty    $FB                   ; 3
    ldy    #5                    ; 2
    jsr    LD9DC                 ; 6
    ldy    $FB                   ; 3
    ldx    #$10                  ; 2
LD88E:
    sta    WSYNC                 ; 3
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    iny                          ; 2
    lda    #2                    ; 2
    cpy    $F6                   ; 3
    beq    LD8A1                 ; 2³
    cpy    $BC                   ; 3
    bne    LD8A3                 ; 2³
    lda    #0                    ; 2
LD8A1:
    sta    $BB                   ; 3
LD8A3:
    dex                          ; 2
    bpl    LD88E                 ; 2³
    sta    WSYNC                 ; 3
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    lda    $BA                   ; 3
    sta    HMP1                  ; 3
    ldx    $B9                   ; 3
LD8B2:
    dex                          ; 2
    bpl    LD8B2                 ; 2³
    sta    RESP1                 ; 3
    iny                          ; 2
    lda    #0                    ; 2
    sta    $BB                   ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    lda    LDD2D                 ; 4
    sta    COLUP1                ; 3
    lda    #0                    ; 2
    sta    NUSIZ1                ; 3
    ldx    #$26                  ; 2
    iny                          ; 2
    lda    #2                    ; 2
    cpy    $F6                   ; 3
    beq    LD8DC                 ; 2³
    cpy    $BC                   ; 3
    bne    LD8DE                 ; 2³
    lda    #0                    ; 2
LD8DC:
    sta    $BB                   ; 3
LD8DE:
    sta    WSYNC                 ; 3
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    lda    LDED7,X               ; 4
    sta    GRP1                  ; 3
    iny                          ; 2
    lda    #2                    ; 2
    cpy    $F6                   ; 3
    beq    LD8F6                 ; 2³
    cpy    $BC                   ; 3
    bne    LD8F8                 ; 2³
    lda    #0                    ; 2
LD8F6:
    sta    $BB                   ; 3
LD8F8:
    dex                          ; 2
    bpl    LD8DE                 ; 2³
    jsr    LD57B                 ; 6
    ldx    #$12                  ; 2
    jmp    LD96C                 ; 3
LD903:
    sta    WSYNC                 ; 3
    lda    $8A                   ; 3
    and    #$20                  ; 2
    beq    LD90F                 ; 2³
    ldx    #$14                  ; 2
    bne    LD96C                 ; 2³
LD90F:
    lda    #$0C                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$B0                  ; 2
    sta    HMP0                  ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    lda    #$C0                  ; 2
    sta    HMP1                  ; 3
    lda    #1                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    ldx    $89                   ; 3
    lda    LDBD0,X               ; 4
    sta    $FC                   ; 3
    ldy    $E1,X                 ; 4
    beq    LD937                 ; 2³
    dey                          ; 2
LD937:
    lda    LDBA6,Y               ; 4
    sta    $FB                   ; 3
    ldy    #5                    ; 2
LD93E:
    sta    WSYNC                 ; 3
    lda    #0                    ; 2
    sta    PF2                   ; 3
    lda    LDDDF,Y               ; 4
    sta    GRP0                  ; 3
    lda    LDDE5,Y               ; 4
    sta    GRP1                  ; 3
    lda    LDDEB,Y               ; 4
    ldx    LDDF1,Y               ; 4
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    lda    $FC                   ; 3
    sta    COLUPF                ; 3
    lda    $FB                   ; 3
    nop                          ; 2
    nop                          ; 2
    sta    PF2                   ; 3
    dey                          ; 2
    bpl    LD93E                 ; 2³
    sta    WSYNC                 ; 3
    iny                          ; 2
    sty    PF2                   ; 3
    ldx    #$0C                  ; 2
LD96C:
    sta    WSYNC                 ; 3
    dex                          ; 2
    bpl    LD96C                 ; 2³
    ldy    #3                    ; 2
    ldx    #$0E                  ; 2
LD975:
    lda.wy $80,Y                 ; 4
    pha                          ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $FB                   ; 3
    asl                          ; 2
    asl                          ; 2
    adc    $FB                   ; 3
    adc    #$54                  ; 2
    sta    $98,X                 ; 4
    pla                          ; 4
    and    #$0F                  ; 2
    sta    $FB                   ; 3
    asl                          ; 2
    asl                          ; 2
    adc    $FB                   ; 3
    adc    #$86                  ; 2
    dex                          ; 2
    dex                          ; 2
    sta    $98,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    dey                          ; 2
    bpl    LD975                 ; 2³
    lda    #$48                  ; 2
    sta    $FB                   ; 3
    lda    #$F1                  ; 2
    sta    $FC                   ; 3
    jmp    LDFF2                 ; 3

    .byte $00 ; |        | $D9A6
    .byte $20 ; |  X     | $D9A7
    .byte $20 ; |  X     | $D9A8
    .byte $20 ; |  X     | $D9A9
    .byte $20 ; |  X     | $D9AA
    .byte $F8 ; |XXXXX   | $D9AB
    .byte $00 ; |        | $D9AC
    .byte $F8 ; |XXXXX   | $D9AD
    .byte $80 ; |X       | $D9AE
    .byte $F0 ; |XXXX    | $D9AF
    .byte $80 ; |X       | $D9B0
    .byte $F8 ; |XXXXX   | $D9B1
    .byte $00 ; |        | $D9B2
    .byte $88 ; |X   X   | $D9B3
    .byte $88 ; |X   X   | $D9B4
    .byte $F8 ; |XXXXX   | $D9B5
    .byte $88 ; |X   X   | $D9B6
    .byte $F8 ; |XXXXX   | $D9B7
    .byte $00 ; |        | $D9B8
    .byte $F8 ; |XXXXX   | $D9B9
    .byte $80 ; |X       | $D9BA
    .byte $80 ; |X       | $D9BB
    .byte $80 ; |X       | $D9BC
    .byte $80 ; |X       | $D9BD
    .byte $00 ; |        | $D9BE
    .byte $80 ; |X       | $D9BF
    .byte $80 ; |X       | $D9C0
    .byte $F8 ; |XXXXX   | $D9C1
    .byte $88 ; |X   X   | $D9C2
    .byte $F8 ; |XXXXX   | $D9C3
    .byte $00 ; |        | $D9C4
    .byte $F8 ; |XXXXX   | $D9C5
    .byte $80 ; |X       | $D9C6
    .byte $F0 ; |XXXX    | $D9C7
    .byte $80 ; |X       | $D9C8
    .byte $F8 ; |XXXXX   | $D9C9
    .byte $00 ; |        | $D9CA
    .byte $88 ; |X   X   | $D9CB
    .byte $88 ; |X   X   | $D9CC
    .byte $F8 ; |XXXXX   | $D9CD
    .byte $88 ; |X   X   | $D9CE
    .byte $88 ; |X   X   | $D9CF
    .byte $00 ; |        | $D9D0
    .byte $98 ; |X  XX   | $D9D1
    .byte $B8 ; |X XXX   | $D9D2
    .byte $A8 ; |X X X   | $D9D3
    .byte $E8 ; |XXX X   | $D9D4
    .byte $C8 ; |XX  X   | $D9D5
    .byte $00 ; |        | $D9D6
    .byte $F8 ; |XXXXX   | $D9D7
    .byte $F8 ; |XXXXX   | $D9D8
    .byte $F8 ; |XXXXX   | $D9D9
    .byte $F8 ; |XXXXX   | $D9DA
    .byte $F8 ; |XXXXX   | $D9DB
LD9DC:
    sta    WSYNC                 ; 3
    lda    LDFB9,X               ; 4
    sta    GRP0                  ; 3
    lda    ($EE),Y               ; 5
    sta    GRP1                  ; 3
    lda    $BB                   ; 3
    sta    ENABL                 ; 3
    sty    $FC                   ; 3
    ldy    $FB                   ; 3
    iny                          ; 2
    lda    #2                    ; 2
    cpy    $F6                   ; 3
    beq    LD9FC                 ; 2³
    cpy    $BC                   ; 3
    bne    LD9FE                 ; 2³
    lda    #0                    ; 2
LD9FC:
    sta    $BB                   ; 3
LD9FE:
    sty    $FB                   ; 3
    ldy    $FC                   ; 3
    dex                          ; 2
    dey                          ; 2
    bpl    LD9DC                 ; 2³+1
    rts                          ; 6

    .byte $FF ; |XXXXXXXX| $DA07
    .byte $FF ; |XXXXXXXX| $DA08
    .byte $FF ; |XXXXXXXX| $DA09
    .byte $FF ; |XXXXXXXX| $DA0A
    .byte $FF ; |XXXXXXXX| $DA0B
    .byte $FF ; |XXXXXXXX| $DA0C
    .byte $FF ; |XXXXXXXX| $DA0D
    .byte $FF ; |XXXXXXXX| $DA0E
    .byte $FF ; |XXXXXXXX| $DA0F
LDA10:
    .byte $FF ; |XXXXXXXX| $DA10
    .byte $FF ; |XXXXXXXX| $DA11
    .byte $FE ; |XXXXXXX | $DA12
    .byte $FE ; |XXXXXXX | $DA13
    .byte $FE ; |XXXXXXX | $DA14
    .byte $FE ; |XXXXXXX | $DA15
    .byte $FE ; |XXXXXXX | $DA16
    .byte $FE ; |XXXXXXX | $DA17
    .byte $FE ; |XXXXXXX | $DA18
    .byte $FE ; |XXXXXXX | $DA19
    .byte $FE ; |XXXXXXX | $DA1A
    .byte $FE ; |XXXXXXX | $DA1B
    .byte $FE ; |XXXXXXX | $DA1C
    .byte $FE ; |XXXXXXX | $DA1D
    .byte $FE ; |XXXXXXX | $DA1E
    .byte $FE ; |XXXXXXX | $DA1F
    .byte $FF ; |XXXXXXXX| $DA20
    .byte $FF ; |XXXXXXXX| $DA21
    .byte $FF ; |XXXXXXXX| $DA22
    .byte $FF ; |XXXXXXXX| $DA23
    .byte $FF ; |XXXXXXXX| $DA24
    .byte $FF ; |XXXXXXXX| $DA25
    .byte $FF ; |XXXXXXXX| $DA26
    .byte $FF ; |XXXXXXXX| $DA27
    .byte $FF ; |XXXXXXXX| $DA28
    .byte $FF ; |XXXXXXXX| $DA29
    .byte $FF ; |XXXXXXXX| $DA2A
    .byte $FF ; |XXXXXXXX| $DA2B
    .byte $FF ; |XXXXXXXX| $DA2C
    .byte $FF ; |XXXXXXXX| $DA2D
    .byte $FF ; |XXXXXXXX| $DA2E
    .byte $FF ; |XXXXXXXX| $DA2F
    .byte $FF ; |XXXXXXXX| $DA30
    .byte $FF ; |XXXXXXXX| $DA31
    .byte $FF ; |XXXXXXXX| $DA32
    .byte $FF ; |XXXXXXXX| $DA33
    .byte $F0 ; |XXXX    | $DA34
    .byte $F0 ; |XXXX    | $DA35
    .byte $F0 ; |XXXX    | $DA36
    .byte $F0 ; |XXXX    | $DA37
    .byte $F0 ; |XXXX    | $DA38
    .byte $F0 ; |XXXX    | $DA39
    .byte $F0 ; |XXXX    | $DA3A
    .byte $F0 ; |XXXX    | $DA3B
    .byte $F0 ; |XXXX    | $DA3C
    .byte $F0 ; |XXXX    | $DA3D
    .byte $F0 ; |XXXX    | $DA3E
    .byte $F0 ; |XXXX    | $DA3F
    .byte $F0 ; |XXXX    | $DA40
    .byte $F0 ; |XXXX    | $DA41
    .byte $F3 ; |XXXX  XX| $DA42
    .byte $F3 ; |XXXX  XX| $DA43
    .byte $F3 ; |XXXX  XX| $DA44
    .byte $F3 ; |XXXX  XX| $DA45
    .byte $F3 ; |XXXX  XX| $DA46
    .byte $F3 ; |XXXX  XX| $DA47
    .byte $F3 ; |XXXX  XX| $DA48
    .byte $F3 ; |XXXX  XX| $DA49
    .byte $F3 ; |XXXX  XX| $DA4A
    .byte $F3 ; |XXXX  XX| $DA4B
    .byte $F3 ; |XXXX  XX| $DA4C
    .byte $F3 ; |XXXX  XX| $DA4D
    .byte $F3 ; |XXXX  XX| $DA4E
    .byte $F3 ; |XXXX  XX| $DA4F
    .byte $F3 ; |XXXX  XX| $DA50
    .byte $F3 ; |XXXX  XX| $DA51
    .byte $F3 ; |XXXX  XX| $DA52
    .byte $F3 ; |XXXX  XX| $DA53
    .byte $F3 ; |XXXX  XX| $DA54
    .byte $F3 ; |XXXX  XX| $DA55
    .byte $F3 ; |XXXX  XX| $DA56
    .byte $F0 ; |XXXX    | $DA57
    .byte $F0 ; |XXXX    | $DA58
    .byte $F0 ; |XXXX    | $DA59
    .byte $F0 ; |XXXX    | $DA5A
    .byte $F0 ; |XXXX    | $DA5B
    .byte $F0 ; |XXXX    | $DA5C
    .byte $F0 ; |XXXX    | $DA5D
    .byte $F0 ; |XXXX    | $DA5E
    .byte $F0 ; |XXXX    | $DA5F
    .byte $F0 ; |XXXX    | $DA60
    .byte $F0 ; |XXXX    | $DA61
    .byte $F0 ; |XXXX    | $DA62
    .byte $F0 ; |XXXX    | $DA63
    .byte $F0 ; |XXXX    | $DA64
    .byte $F3 ; |XXXX  XX| $DA65
    .byte $F3 ; |XXXX  XX| $DA66
    .byte $F3 ; |XXXX  XX| $DA67
    .byte $F3 ; |XXXX  XX| $DA68
    .byte $F3 ; |XXXX  XX| $DA69
    .byte $F2 ; |XXXX  X | $DA6A
    .byte $F2 ; |XXXX  X | $DA6B
    .byte $F2 ; |XXXX  X | $DA6C
    .byte $F2 ; |XXXX  X | $DA6D
    .byte $F2 ; |XXXX  X | $DA6E
    .byte $F2 ; |XXXX  X | $DA6F
    .byte $F2 ; |XXXX  X | $DA70
    .byte $F2 ; |XXXX  X | $DA71
    .byte $F2 ; |XXXX  X | $DA72
    .byte $F2 ; |XXXX  X | $DA73
    .byte $F2 ; |XXXX  X | $DA74
    .byte $F2 ; |XXXX  X | $DA75
    .byte $F2 ; |XXXX  X | $DA76
    .byte $F2 ; |XXXX  X | $DA77
LDA78:
    .byte $FF ; |XXXXXXXX| $DA78
    .byte $FF ; |XXXXXXXX| $DA79
    .byte $78 ; | XXXX   | $DA7A
    .byte $78 ; | XXXX   | $DA7B
    .byte $78 ; | XXXX   | $DA7C
    .byte $78 ; | XXXX   | $DA7D
    .byte $78 ; | XXXX   | $DA7E
    .byte $78 ; | XXXX   | $DA7F
    .byte $78 ; | XXXX   | $DA80
    .byte $78 ; | XXXX   | $DA81
    .byte $78 ; | XXXX   | $DA82
    .byte $78 ; | XXXX   | $DA83
    .byte $78 ; | XXXX   | $DA84
    .byte $78 ; | XXXX   | $DA85
    .byte $78 ; | XXXX   | $DA86
    .byte $78 ; | XXXX   | $DA87
    .byte $79 ; | XXXX  X| $DA88
    .byte $79 ; | XXXX  X| $DA89
    .byte $01 ; |       X| $DA8A
    .byte $01 ; |       X| $DA8B
    .byte $01 ; |       X| $DA8C
    .byte $01 ; |       X| $DA8D
    .byte $01 ; |       X| $DA8E
    .byte $01 ; |       X| $DA8F
    .byte $01 ; |       X| $DA90
    .byte $01 ; |       X| $DA91
    .byte $01 ; |       X| $DA92
    .byte $01 ; |       X| $DA93
    .byte $01 ; |       X| $DA94
    .byte $01 ; |       X| $DA95
    .byte $01 ; |       X| $DA96
    .byte $01 ; |       X| $DA97
    .byte $F9 ; |XXXXX  X| $DA98
    .byte $F9 ; |XXXXX  X| $DA99
    .byte $F9 ; |XXXXX  X| $DA9A
    .byte $F9 ; |XXXXX  X| $DA9B
    .byte $60 ; | XX     | $DA9C
    .byte $60 ; | XX     | $DA9D
    .byte $60 ; | XX     | $DA9E
    .byte $60 ; | XX     | $DA9F
    .byte $60 ; | XX     | $DAA0
    .byte $60 ; | XX     | $DAA1
    .byte $60 ; | XX     | $DAA2
    .byte $60 ; | XX     | $DAA3
    .byte $60 ; | XX     | $DAA4
    .byte $60 ; | XX     | $DAA5
    .byte $60 ; | XX     | $DAA6
    .byte $60 ; | XX     | $DAA7
    .byte $60 ; | XX     | $DAA8
    .byte $60 ; | XX     | $DAA9
    .byte $79 ; | XXXX  X| $DAAA
    .byte $79 ; | XXXX  X| $DAAB
    .byte $01 ; |       X| $DAAC
    .byte $01 ; |       X| $DAAD
    .byte $01 ; |       X| $DAAE
    .byte $01 ; |       X| $DAAF
    .byte $01 ; |       X| $DAB0
    .byte $01 ; |       X| $DAB1
    .byte $01 ; |       X| $DAB2
    .byte $01 ; |       X| $DAB3
    .byte $01 ; |       X| $DAB4
    .byte $01 ; |       X| $DAB5
    .byte $01 ; |       X| $DAB6
    .byte $01 ; |       X| $DAB7
    .byte $01 ; |       X| $DAB8
    .byte $01 ; |       X| $DAB9
    .byte $79 ; | XXXX  X| $DABA
    .byte $79 ; | XXXX  X| $DABB
    .byte $79 ; | XXXX  X| $DABC
    .byte $79 ; | XXXX  X| $DABD
    .byte $79 ; | XXXX  X| $DABE
    .byte $60 ; | XX     | $DABF
    .byte $60 ; | XX     | $DAC0
    .byte $60 ; | XX     | $DAC1
    .byte $60 ; | XX     | $DAC2
    .byte $60 ; | XX     | $DAC3
    .byte $60 ; | XX     | $DAC4
    .byte $60 ; | XX     | $DAC5
    .byte $60 ; | XX     | $DAC6
    .byte $60 ; | XX     | $DAC7
    .byte $60 ; | XX     | $DAC8
    .byte $60 ; | XX     | $DAC9
    .byte $60 ; | XX     | $DACA
    .byte $60 ; | XX     | $DACB
    .byte $60 ; | XX     | $DACC
    .byte $7F ; | XXXXXXX| $DACD
    .byte $7F ; | XXXXXXX| $DACE
    .byte $7F ; | XXXXXXX| $DACF
    .byte $7F ; | XXXXXXX| $DAD0
    .byte $7F ; | XXXXXXX| $DAD1
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
    .byte $7F ; | XXXXXXX| $DAE0
    .byte $7F ; | XXXXXXX| $DAE1
    .byte $7F ; | XXXXXXX| $DAE2
    .byte $FF ; |XXXXXXXX| $DAE3
    .byte $FF ; |XXXXXXXX| $DAE4
    .byte $FF ; |XXXXXXXX| $DAE5
    .byte $FF ; |XXXXXXXX| $DAE6
    .byte $FF ; |XXXXXXXX| $DAE7
    .byte $FF ; |XXXXXXXX| $DAE8
    .byte $FF ; |XXXXXXXX| $DAE9
    .byte $FF ; |XXXXXXXX| $DAEA
    .byte $FF ; |XXXXXXXX| $DAEB
    .byte $FF ; |XXXXXXXX| $DAEC
    .byte $FF ; |XXXXXXXX| $DAED
    .byte $FF ; |XXXXXXXX| $DAEE
    .byte $FF ; |XXXXXXXX| $DAEF
    .byte $FF ; |XXXXXXXX| $DAF0
    .byte $FF ; |XXXXXXXX| $DAF1
    .byte $FF ; |XXXXXXXX| $DAF2
    .byte $FF ; |XXXXXXXX| $DAF3
    .byte $FF ; |XXXXXXXX| $DAF4
    .byte $FF ; |XXXXXXXX| $DAF5
    .byte $FF ; |XXXXXXXX| $DAF6
    .byte $FF ; |XXXXXXXX| $DAF7
    .byte $FF ; |XXXXXXXX| $DAF8
    .byte $FF ; |XXXXXXXX| $DAF9
    .byte $FF ; |XXXXXXXX| $DAFA
    .byte $FF ; |XXXXXXXX| $DAFB
    .byte $FF ; |XXXXXXXX| $DAFC
    .byte $FF ; |XXXXXXXX| $DAFD
    .byte $FF ; |XXXXXXXX| $DAFE
    .byte $FF ; |XXXXXXXX| $DAFF

LDB00:
    .byte $00 ; |        | $DB00
    .byte $00 ; |        | $DB01
    .byte $18 ; |   XX   | $DB02
    .byte $18 ; |   XX   | $DB03
    .byte $3C ; |  XXXX  | $DB04
    .byte $7E ; | XXXXXX | $DB05
    .byte $FF ; |XXXXXXXX| $DB06
    .byte $FF ; |XXXXXXXX| $DB07
    .byte $7E ; | XXXXXX | $DB08
    .byte $7E ; | XXXXXX | $DB09
    .byte $7E ; | XXXXXX | $DB0A
    .byte $7E ; | XXXXXX | $DB0B
    .byte $66 ; | XX  XX | $DB0C
    .byte $66 ; | XX  XX | $DB0D
    .byte $66 ; | XX  XX | $DB0E
    .byte $66 ; | XX  XX | $DB0F
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
    .byte $18 ; |   XX   | $DB24
    .byte $18 ; |   XX   | $DB25
    .byte $3C ; |  XXXX  | $DB26
    .byte $7E ; | XXXXXX | $DB27
    .byte $FF ; |XXXXXXXX| $DB28
    .byte $FF ; |XXXXXXXX| $DB29
    .byte $7E ; | XXXXXX | $DB2A
    .byte $7E ; | XXXXXX | $DB2B
    .byte $7E ; | XXXXXX | $DB2C
    .byte $7E ; | XXXXXX | $DB2D
    .byte $66 ; | XX  XX | $DB2E
    .byte $66 ; | XX  XX | $DB2F
    .byte $66 ; | XX  XX | $DB30
    .byte $66 ; | XX  XX | $DB31
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
    .byte $18 ; |   XX   | $DB47
    .byte $18 ; |   XX   | $DB48
    .byte $3C ; |  XXXX  | $DB49
    .byte $7E ; | XXXXXX | $DB4A
    .byte $FF ; |XXXXXXXX| $DB4B
    .byte $FF ; |XXXXXXXX| $DB4C
    .byte $7E ; | XXXXXX | $DB4D
    .byte $7E ; | XXXXXX | $DB4E
    .byte $7E ; | XXXXXX | $DB4F
    .byte $7E ; | XXXXXX | $DB50
    .byte $66 ; | XX  XX | $DB51
    .byte $66 ; | XX  XX | $DB52
    .byte $66 ; | XX  XX | $DB53
    .byte $66 ; | XX  XX | $DB54
    .byte $00 ; |        | $DB55
    .byte $00 ; |        | $DB56
    .byte $00 ; |        | $DB57
    .byte $00 ; |        | $DB58
    .byte $00 ; |        | $DB59
    .byte $18 ; |   XX   | $DB5A
    .byte $18 ; |   XX   | $DB5B
    .byte $3C ; |  XXXX  | $DB5C
    .byte $7E ; | XXXXXX | $DB5D
    .byte $FF ; |XXXXXXXX| $DB5E
    .byte $FF ; |XXXXXXXX| $DB5F
    .byte $7E ; | XXXXXX | $DB60
    .byte $7E ; | XXXXXX | $DB61
    .byte $7E ; | XXXXXX | $DB62
    .byte $7E ; | XXXXXX | $DB63
LDB64:
    .byte $66 ; | XX  XX | $DB64
    .byte $66 ; | XX  XX | $DB65
    .byte $66 ; | XX  XX | $DB66
    .byte $66 ; | XX  XX | $DB67
LDB68:
    .byte $00 ; |        | $DB68
    .byte $36 ; |  XX XX | $DB69
    .byte $36 ; |  XX XX | $DB6A
    .byte $36 ; |  XX XX | $DB6B
    .byte $36 ; |  XX XX | $DB6C
    .byte $36 ; |  XX XX | $DB6D
    .byte $A6 ; |X X  XX | $DB6E
    .byte $A6 ; |X X  XX | $DB6F
    .byte $18 ; |   XX   | $DB70
    .byte $18 ; |   XX   | $DB71
    .byte $18 ; |   XX   | $DB72
    .byte $18 ; |   XX   | $DB73
    .byte $18 ; |   XX   | $DB74
    .byte $18 ; |   XX   | $DB75
    .byte $18 ; |   XX   | $DB76
    .byte $18 ; |   XX   | $DB77
LDB78:
    .byte $18 ; |   XX   | $DB78
    .byte $18 ; |   XX   | $DB79
    .byte $18 ; |   XX   | $DB7A
    .byte $18 ; |   XX   | $DB7B
    .byte $18 ; |   XX   | $DB7C
    .byte $18 ; |   XX   | $DB7D
    .byte $18 ; |   XX   | $DB7E
    .byte $16 ; |   X XX | $DB7F
    .byte $16 ; |   X XX | $DB80
    .byte $48 ; | X  X   | $DB81
    .byte $48 ; | X  X   | $DB82
    .byte $48 ; | X  X   | $DB83
    .byte $48 ; | X  X   | $DB84
    .byte $02 ; |      X | $DB85
    .byte $02 ; |      X | $DB86
    .byte $02 ; |      X | $DB87
    .byte $16 ; |   X XX | $DB88
    .byte $16 ; |   X XX | $DB89
    .byte $16 ; |   X XX | $DB8A
    .byte $16 ; |   X XX | $DB8B
    .byte $86 ; |X    XX | $DB8C
    .byte $86 ; |X    XX | $DB8D
    .byte $86 ; |X    XX | $DB8E
    .byte $86 ; |X    XX | $DB8F
    .byte $18 ; |   XX   | $DB90
    .byte $18 ; |   XX   | $DB91
    .byte $58 ; | X XX   | $DB92
    .byte $58 ; | X XX   | $DB93
    .byte $58 ; | X XX   | $DB94
    .byte $58 ; | X XX   | $DB95
    .byte $58 ; | X XX   | $DB96
    .byte $58 ; | X XX   | $DB97
    .byte $58 ; | X XX   | $DB98
    .byte $58 ; | X XX   | $DB99
    .byte $54 ; | X X X  | $DB9A
    .byte $2E ; |  X XXX | $DB9B
    .byte $44 ; | X   X  | $DB9C
    .byte $49 ; | X  X  X| $DB9D
    .byte $44 ; | X   X  | $DB9E
    .byte $4F ; | X  XXXX| $DB9F
    .byte $4D ; | X  XX X| $DBA0
    .byte $45 ; | X   X X| $DBA1
    .byte $4E ; | X  XXX | $DBA2
    .byte $49 ; | X  X  X| $DBA3
    .byte $43 ; | X    XX| $DBA4
    .byte $4F ; | X  XXXX| $DBA5
LDBA6:
    .byte $00 ; |        | $DBA6
    .byte $01 ; |       X| $DBA7
    .byte $05 ; |     X X| $DBA8
    .byte $15 ; |   X X X| $DBA9
    .byte $55 ; | X X X X| $DBAA
    .byte $55 ; | X X X X| $DBAB
LDBAC:
    .byte $F0 ; |XXXX    | $DBAC
    .byte $E5 ; |XXX  X X| $DBAD
    .byte $DA ; |XX XX X | $DBAE
    .byte $42 ; | X    X | $DBAF
    .byte $42 ; | X    X | $DBB0
    .byte $42 ; | X    X | $DBB1
    .byte $42 ; | X    X | $DBB2
    .byte $56 ; | X X XX | $DBB3
    .byte $56 ; | X X XX | $DBB4
    .byte $DA ; |XX XX X | $DBB5
    .byte $DA ; |XX XX X | $DBB6
    .byte $DA ; |XX XX X | $DBB7
    .byte $DA ; |XX XX X | $DBB8
    .byte $DA ; |XX XX X | $DBB9
    .byte $DA ; |XX XX X | $DBBA
    .byte $DA ; |XX XX X | $DBBB
    .byte $DA ; |XX XX X | $DBBC
    .byte $00 ; |        | $DBBD
    .byte $00 ; |        | $DBBE
    .byte $00 ; |        | $DBBF
    .byte $00 ; |        | $DBC0
    .byte $34 ; |  XX X  | $DBC1
    .byte $34 ; |  XX X  | $DBC2
    .byte $34 ; |  XX X  | $DBC3
    .byte $34 ; |  XX X  | $DBC4
    .byte $34 ; |  XX X  | $DBC5
    .byte $D6 ; |XX X XX | $DBC6
    .byte $D6 ; |XX X XX | $DBC7
    .byte $A8 ; |X X X   | $DBC8
    .byte $A8 ; |X X X   | $DBC9
    .byte $A8 ; |X X X   | $DBCA
    .byte $A8 ; |X X X   | $DBCB
    .byte $A8 ; |X X X   | $DBCC
    .byte $A8 ; |X X X   | $DBCD
    .byte $A8 ; |X X X   | $DBCE
    .byte $A8 ; |X X X   | $DBCF
LDBD0:
    .byte $1C ; |   XXX  | $DBD0
    .byte $A6 ; |X X  XX | $DBD1
LDBD2:
    .byte $44 ; | X   X  | $DBD2
    .byte $1C ; |   XXX  | $DBD3
    .byte $D4 ; |XX X X  | $DBD4
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
    .byte $10 ; |   X    | $DBE3
    .byte $10 ; |   X    | $DBE4
    .byte $38 ; |  XXX   | $DBE5
    .byte $7C ; | XXXXX  | $DBE6
    .byte $7C ; | XXXXX  | $DBE7
    .byte $7C ; | XXXXX  | $DBE8
    .byte $38 ; |  XXX   | $DBE9
    .byte $00 ; |        | $DBEA
    .byte $00 ; |        | $DBEB
    .byte $3C ; |  XXXX  | $DBEC
    .byte $7E ; | XXXXXX | $DBED
    .byte $C3 ; |XX    XX| $DBEE
    .byte $81 ; |X      X| $DBEF
    .byte $81 ; |X      X| $DBF0
    .byte $81 ; |X      X| $DBF1
    .byte $81 ; |X      X| $DBF2
    .byte $81 ; |X      X| $DBF3
    .byte $C3 ; |XX    XX| $DBF4
    .byte $7E ; | XXXXXX | $DBF5
    .byte $3C ; |  XXXX  | $DBF6
    .byte $00 ; |        | $DBF7
    .byte $00 ; |        | $DBF8
    .byte $E7 ; |XXX  XXX| $DBF9
    .byte $AA ; |X X X X | $DBFA
    .byte $EA ; |XXX X X | $DBFB
    .byte $8A ; |X   X X | $DBFC
    .byte $8A ; |X   X X | $DBFD
    .byte $00 ; |        | $DBFE
    .byte $00 ; |        | $DBFF
LDC00:
    .byte $00 ; |        | $DC00
    .byte $41 ; | X     X| $DC01
    .byte $41 ; | X     X| $DC02
    .byte $7D ; | XXXXX X| $DC03
    .byte $45 ; | X   X X| $DC04
    .byte $7D ; | XXXXX X| $DC05
    .byte $00 ; |        | $DC06
    .byte $00 ; |        | $DC07
    .byte $01 ; |       X| $DC08
    .byte $01 ; |       X| $DC09
    .byte $01 ; |       X| $DC0A
    .byte $01 ; |       X| $DC0B
    .byte $01 ; |       X| $DC0C
LDC0D:
    .byte $00 ; |        | $DC0D
    .byte $F7 ; |XXXX XXX| $DC0E
    .byte $15 ; |   X X X| $DC0F
    .byte $15 ; |   X X X| $DC10
    .byte $14 ; |   X X  | $DC11
    .byte $F4 ; |XXXX X  | $DC12
    .byte $00 ; |        | $DC13
    .byte $00 ; |        | $DC14
    .byte $F7 ; |XXXX XXX| $DC15
    .byte $14 ; |   X X  | $DC16
    .byte $34 ; |  XX X  | $DC17
    .byte $04 ; |     X  | $DC18
    .byte $F4 ; |XXXX X  | $DC19
LDC1A:
    .byte $00 ; |        | $DC1A
    .byte $DF ; |XX XXXXX| $DC1B
    .byte $50 ; | X X    | $DC1C
    .byte $5C ; | X XXX  | $DC1D
    .byte $50 ; | X X    | $DC1E
    .byte $5F ; | X XXXXX| $DC1F
    .byte $00 ; |        | $DC20
    .byte $00 ; |        | $DC21
    .byte $D3 ; |XX X  XX| $DC22
    .byte $53 ; | X X  XX| $DC23
    .byte $55 ; | X X X X| $DC24
    .byte $59 ; | X XX  X| $DC25
    .byte $59 ; | X XX  X| $DC26
LDC27:
    .byte $00 ; |        | $DC27
    .byte $48 ; | X  X   | $DC28
    .byte $48 ; | X  X   | $DC29
    .byte $7C ; | XXXXX  | $DC2A
    .byte $44 ; | X   X  | $DC2B
    .byte $7C ; | XXXXX  | $DC2C
    .byte $00 ; |        | $DC2D
    .byte $00 ; |        | $DC2E
    .byte $00 ; |        | $DC2F
    .byte $00 ; |        | $DC30
    .byte $00 ; |        | $DC31
    .byte $00 ; |        | $DC32
    .byte $00 ; |        | $DC33
LDC34:
    .byte $00 ; |        | $DC34
    .byte $44 ; | X   X  | $DC35
    .byte $44 ; | X   X  | $DC36
    .byte $44 ; | X   X  | $DC37
    .byte $88 ; |X   X   | $DC38
    .byte $88 ; |X   X   | $DC39
    .byte $00 ; |        | $DC3A
    .byte $00 ; |        | $DC3B
    .byte $88 ; |X   X   | $DC3C
    .byte $88 ; |X   X   | $DC3D
    .byte $44 ; | X   X  | $DC3E
    .byte $44 ; | X   X  | $DC3F
    .byte $44 ; | X   X  | $DC40
    .byte $80 ; |X       | $DC41
    .byte $01 ; |       X| $DC42
    .byte $00 ; |        | $DC43
    .byte $03 ; |      XX| $DC44
    .byte $00 ; |        | $DC45
    .byte $06 ; |     XX | $DC46
    .byte $00 ; |        | $DC47
    .byte $0C ; |    XX  | $DC48
    .byte $00 ; |        | $DC49
    .byte $18 ; |   XX   | $DC4A
    .byte $00 ; |        | $DC4B
    .byte $30 ; |  XX    | $DC4C
    .byte $00 ; |        | $DC4D
    .byte $60 ; | XX     | $DC4E
    .byte $00 ; |        | $DC4F
    .byte $00 ; |        | $DC50
    .byte $00 ; |        | $DC51
    .byte $00 ; |        | $DC52
    .byte $0A ; |    X X | $DC53
    .byte $60 ; | XX     | $DC54
    .byte $0E ; |    XXX | $DC55
    .byte $40 ; | X      | $DC56
    .byte $0A ; |    X X | $DC57
    .byte $40 ; | X      | $DC58
    .byte $80 ; |X       | $DC59
    .byte $01 ; |       X| $DC5A
    .byte $80 ; |X       | $DC5B
    .byte $01 ; |       X| $DC5C
    .byte $00 ; |        | $DC5D
    .byte $03 ; |      XX| $DC5E
    .byte $00 ; |        | $DC5F
    .byte $03 ; |      XX| $DC60
    .byte $00 ; |        | $DC61
    .byte $06 ; |     XX | $DC62
    .byte $00 ; |        | $DC63
    .byte $06 ; |     XX | $DC64
    .byte $00 ; |        | $DC65
    .byte $0C ; |    XX  | $DC66
    .byte $00 ; |        | $DC67
    .byte $0C ; |    XX  | $DC68
    .byte $00 ; |        | $DC69
    .byte $00 ; |        | $DC6A
    .byte $0A ; |    X X | $DC6B
    .byte $60 ; | XX     | $DC6C
    .byte $0E ; |    XXX | $DC6D
    .byte $40 ; | X      | $DC6E
    .byte $0A ; |    X X | $DC6F
    .byte $40 ; | X      | $DC70
    .byte $80 ; |X       | $DC71
    .byte $01 ; |       X| $DC72
    .byte $80 ; |X       | $DC73
    .byte $01 ; |       X| $DC74
    .byte $80 ; |X       | $DC75
    .byte $01 ; |       X| $DC76
    .byte $80 ; |X       | $DC77
    .byte $01 ; |       X| $DC78
    .byte $80 ; |X       | $DC79
    .byte $01 ; |       X| $DC7A
    .byte $80 ; |X       | $DC7B
    .byte $01 ; |       X| $DC7C
    .byte $80 ; |X       | $DC7D
    .byte $01 ; |       X| $DC7E
    .byte $80 ; |X       | $DC7F
    .byte $01 ; |       X| $DC80
    .byte $80 ; |X       | $DC81
    .byte $01 ; |       X| $DC82
    .byte $0A ; |    X X | $DC83
    .byte $60 ; | XX     | $DC84
    .byte $0E ; |    XXX | $DC85
    .byte $40 ; | X      | $DC86
    .byte $0A ; |    X X | $DC87
    .byte $40 ; | X      | $DC88
    .byte $80 ; |X       | $DC89
    .byte $01 ; |       X| $DC8A
    .byte $80 ; |X       | $DC8B
    .byte $01 ; |       X| $DC8C
    .byte $C0 ; |XX      | $DC8D
    .byte $00 ; |        | $DC8E
    .byte $C0 ; |XX      | $DC8F
LDC90:
    .byte $00 ; |        | $DC90
    .byte $60 ; | XX     | $DC91
    .byte $00 ; |        | $DC92
    .byte $60 ; | XX     | $DC93
    .byte $00 ; |        | $DC94
    .byte $30 ; |  XX    | $DC95
    .byte $00 ; |        | $DC96
    .byte $30 ; |  XX    | $DC97
    .byte $00 ; |        | $DC98
    .byte $00 ; |        | $DC99
    .byte $00 ; |        | $DC9A
    .byte $0A ; |    X X | $DC9B
    .byte $60 ; | XX     | $DC9C
    .byte $0E ; |    XXX | $DC9D
    .byte $40 ; | X      | $DC9E
    .byte $0A ; |    X X | $DC9F
    .byte $40 ; | X      | $DCA0
    .byte $80 ; |X       | $DCA1
    .byte $01 ; |       X| $DCA2
    .byte $C0 ; |XX      | $DCA3
    .byte $00 ; |        | $DCA4
    .byte $60 ; | XX     | $DCA5
    .byte $00 ; |        | $DCA6
    .byte $30 ; |  XX    | $DCA7
    .byte $00 ; |        | $DCA8
    .byte $18 ; |   XX   | $DCA9
    .byte $00 ; |        | $DCAA
    .byte $0C ; |    XX  | $DCAB
    .byte $00 ; |        | $DCAC
    .byte $06 ; |     XX | $DCAD
    .byte $00 ; |        | $DCAE
    .byte $00 ; |        | $DCAF
    .byte $00 ; |        | $DCB0
    .byte $00 ; |        | $DCB1
    .byte $00 ; |        | $DCB2
    .byte $0A ; |    X X | $DCB3
    .byte $60 ; | XX     | $DCB4
    .byte $0E ; |    XXX | $DCB5
    .byte $40 ; | X      | $DCB6
    .byte $0A ; |    X X | $DCB7
    .byte $40 ; | X      | $DCB8
    .byte $00 ; |        | $DCB9
    .byte $42 ; | X    X | $DCBA
    .byte $42 ; | X    X | $DCBB
    .byte $44 ; | X   X  | $DCBC
    .byte $44 ; | X   X  | $DCBD
    .byte $46 ; | X   XX | $DCBE
    .byte $46 ; | X   XX | $DCBF
    .byte $48 ; | X  X   | $DCC0
    .byte $48 ; | X  X   | $DCC1
    .byte $4A ; | X  X X | $DCC2
    .byte $4A ; | X  X X | $DCC3
    .byte $00 ; |        | $DCC4
    .byte $48 ; | X  X   | $DCC5
    .byte $48 ; | X  X   | $DCC6
    .byte $48 ; | X  X   | $DCC7
    .byte $48 ; | X  X   | $DCC8
    .byte $C6 ; |XX   XX | $DCC9
    .byte $C6 ; |XX   XX | $DCCA
    .byte $16 ; |   X XX | $DCCB
    .byte $16 ; |   X XX | $DCCC
    .byte $16 ; |   X XX | $DCCD
    .byte $16 ; |   X XX | $DCCE
    .byte $00 ; |        | $DCCF
    .byte $56 ; | X X XX | $DCD0
    .byte $56 ; | X X XX | $DCD1
    .byte $56 ; | X X XX | $DCD2
    .byte $56 ; | X X XX | $DCD3
    .byte $56 ; | X X XX | $DCD4
    .byte $56 ; | X X XX | $DCD5
    .byte $56 ; | X X XX | $DCD6
    .byte $56 ; | X X XX | $DCD7
    .byte $56 ; | X X XX | $DCD8
    .byte $56 ; | X X XX | $DCD9
    .byte $00 ; |        | $DCDA
    .byte $18 ; |   XX   | $DCDB
    .byte $18 ; |   XX   | $DCDC
    .byte $18 ; |   XX   | $DCDD
    .byte $18 ; |   XX   | $DCDE
    .byte $18 ; |   XX   | $DCDF
    .byte $1C ; |   XXX  | $DCE0
    .byte $1C ; |   XXX  | $DCE1
    .byte $1C ; |   XXX  | $DCE2
    .byte $00 ; |        | $DCE3
    .byte $00 ; |        | $DCE4
    .byte $00 ; |        | $DCE5
    .byte $A6 ; |X X  XX | $DCE6
    .byte $A6 ; |X X  XX | $DCE7
    .byte $A6 ; |X X  XX | $DCE8
    .byte $A6 ; |X X  XX | $DCE9
    .byte $A6 ; |X X  XX | $DCEA
    .byte $1C ; |   XXX  | $DCEB
    .byte $1C ; |   XXX  | $DCEC
    .byte $00 ; |        | $DCED
    .byte $00 ; |        | $DCEE
    .byte $00 ; |        | $DCEF
    .byte $00 ; |        | $DCF0
    .byte $44 ; | X   X  | $DCF1
    .byte $44 ; | X   X  | $DCF2
    .byte $44 ; | X   X  | $DCF3
    .byte $44 ; | X   X  | $DCF4
    .byte $44 ; | X   X  | $DCF5
    .byte $1C ; |   XXX  | $DCF6
    .byte $00 ; |        | $DCF7
    .byte $00 ; |        | $DCF8
    .byte $00 ; |        | $DCF9
    .byte $00 ; |        | $DCFA
    .byte $FF ; |XXXXXXXX| $DCFB
    .byte $FF ; |XXXXXXXX| $DCFC
    .byte $FF ; |XXXXXXXX| $DCFD
    .byte $FF ; |XXXXXXXX| $DCFE
    .byte $FF ; |XXXXXXXX| $DCFF

    .byte $00 ; |        | $DD00
    .byte $18 ; |   XX   | $DD01
    .byte $18 ; |   XX   | $DD02
    .byte $18 ; |   XX   | $DD03
    .byte $3C ; |  XXXX  | $DD04
    .byte $00 ; |        | $DD05
    .byte $3C ; |  XXXX  | $DD06
    .byte $18 ; |   XX   | $DD07
    .byte $18 ; |   XX   | $DD08
    .byte $3C ; |  XXXX  | $DD09
    .byte $00 ; |        | $DD0A
    .byte $3C ; |  XXXX  | $DD0B
    .byte $3C ; |  XXXX  | $DD0C
    .byte $3C ; |  XXXX  | $DD0D
    .byte $3C ; |  XXXX  | $DD0E
    .byte $00 ; |        | $DD0F
    .byte $3C ; |  XXXX  | $DD10
    .byte $3C ; |  XXXX  | $DD11
    .byte $7E ; | XXXXXX | $DD12
    .byte $7E ; | XXXXXX | $DD13
    .byte $00 ; |        | $DD14
    .byte $7E ; | XXXXXX | $DD15
    .byte $7E ; | XXXXXX | $DD16
    .byte $7E ; | XXXXXX | $DD17
    .byte $7E ; | XXXXXX | $DD18
    .byte $00 ; |        | $DD19
    .byte $7E ; | XXXXXX | $DD1A
    .byte $3C ; |  XXXX  | $DD1B
    .byte $3C ; |  XXXX  | $DD1C
    .byte $7E ; | XXXXXX | $DD1D
    .byte $00 ; |        | $DD1E
    .byte $3C ; |  XXXX  | $DD1F
    .byte $24 ; |  X  X  | $DD20
    .byte $24 ; |  X  X  | $DD21
    .byte $24 ; |  X  X  | $DD22
    .byte $00 ; |        | $DD23
    .byte $24 ; |  X  X  | $DD24
    .byte $24 ; |  X  X  | $DD25
    .byte $24 ; |  X  X  | $DD26
    .byte $7E ; | XXXXXX | $DD27
    .byte $00 ; |        | $DD28
    .byte $00 ; |        | $DD29
    .byte $00 ; |        | $DD2A
    .byte $00 ; |        | $DD2B
LDD2C:
    .byte $8C ; |X   XX  | $DD2C
LDD2D:
    .byte $56 ; | X X XX | $DD2D
    .byte $00 ; |        | $DD2E
    .byte $00 ; |        | $DD2F
    .byte $00 ; |        | $DD30
    .byte $3C ; |  XXXX  | $DD31
    .byte $18 ; |   XX   | $DD32
    .byte $18 ; |   XX   | $DD33
    .byte $18 ; |   XX   | $DD34
    .byte $00 ; |        | $DD35
    .byte $00 ; |        | $DD36
    .byte $00 ; |        | $DD37
    .byte $00 ; |        | $DD38
    .byte $00 ; |        | $DD39
    .byte $00 ; |        | $DD3A
    .byte $3C ; |  XXXX  | $DD3B
    .byte $18 ; |   XX   | $DD3C
    .byte $18 ; |   XX   | $DD3D
    .byte $3C ; |  XXXX  | $DD3E
    .byte $00 ; |        | $DD3F
    .byte $00 ; |        | $DD40
    .byte $00 ; |        | $DD41
    .byte $00 ; |        | $DD42
LDD43:
    .byte $00 ; |        | $DD43
    .byte $00 ; |        | $DD44
    .byte $3C ; |  XXXX  | $DD45
    .byte $3C ; |  XXXX  | $DD46
    .byte $3C ; |  XXXX  | $DD47
    .byte $3C ; |  XXXX  | $DD48
    .byte $00 ; |        | $DD49
    .byte $00 ; |        | $DD4A
    .byte $00 ; |        | $DD4B
    .byte $00 ; |        | $DD4C
    .byte $00 ; |        | $DD4D
    .byte $00 ; |        | $DD4E
    .byte $7E ; | XXXXXX | $DD4F
    .byte $7E ; | XXXXXX | $DD50
    .byte $3C ; |  XXXX  | $DD51
    .byte $3C ; |  XXXX  | $DD52
    .byte $00 ; |        | $DD53
    .byte $00 ; |        | $DD54
    .byte $00 ; |        | $DD55
    .byte $00 ; |        | $DD56
    .byte $00 ; |        | $DD57
    .byte $00 ; |        | $DD58
    .byte $7E ; | XXXXXX | $DD59
    .byte $7E ; | XXXXXX | $DD5A
    .byte $7E ; | XXXXXX | $DD5B
    .byte $7E ; | XXXXXX | $DD5C
    .byte $00 ; |        | $DD5D
    .byte $00 ; |        | $DD5E
    .byte $00 ; |        | $DD5F
    .byte $00 ; |        | $DD60
    .byte $00 ; |        | $DD61
    .byte $00 ; |        | $DD62
    .byte $7E ; | XXXXXX | $DD63
    .byte $3C ; |  XXXX  | $DD64
    .byte $3C ; |  XXXX  | $DD65
    .byte $7E ; | XXXXXX | $DD66
    .byte $00 ; |        | $DD67
    .byte $00 ; |        | $DD68
    .byte $00 ; |        | $DD69
    .byte $00 ; |        | $DD6A
    .byte $00 ; |        | $DD6B
    .byte $00 ; |        | $DD6C
    .byte $24 ; |  X  X  | $DD6D
    .byte $24 ; |  X  X  | $DD6E
    .byte $24 ; |  X  X  | $DD6F
    .byte $3C ; |  XXXX  | $DD70
    .byte $00 ; |        | $DD71
    .byte $00 ; |        | $DD72
    .byte $00 ; |        | $DD73
    .byte $00 ; |        | $DD74
    .byte $00 ; |        | $DD75
    .byte $00 ; |        | $DD76
    .byte $7E ; | XXXXXX | $DD77
    .byte $24 ; |  X  X  | $DD78
    .byte $24 ; |  X  X  | $DD79
    .byte $24 ; |  X  X  | $DD7A
    .byte $00 ; |        | $DD7B
    .byte $00 ; |        | $DD7C
    .byte $00 ; |        | $DD7D
    .byte $00 ; |        | $DD7E
    .byte $38 ; |  XXX   | $DD7F
    .byte $7C ; | XXXXX  | $DD80
    .byte $7C ; | XXXXX  | $DD81
    .byte $7C ; | XXXXX  | $DD82
    .byte $38 ; |  XXX   | $DD83
    .byte $10 ; |   X    | $DD84
    .byte $10 ; |   X    | $DD85
    .byte $10 ; |   X    | $DD86
    .byte $00 ; |        | $DD87
    .byte $00 ; |        | $DD88
    .byte $24 ; |  X  X  | $DD89
    .byte $3C ; |  XXXX  | $DD8A
    .byte $3C ; |  XXXX  | $DD8B
    .byte $7E ; | XXXXXX | $DD8C
    .byte $7E ; | XXXXXX | $DD8D
    .byte $7E ; | XXXXXX | $DD8E
    .byte $3C ; |  XXXX  | $DD8F
    .byte $7E ; | XXXXXX | $DD90
    .byte $5A ; | X XX X | $DD91
    .byte $3C ; |  XXXX  | $DD92
    .byte $00 ; |        | $DD93
    .byte $14 ; |   X X  | $DD94
    .byte $14 ; |   X X  | $DD95
    .byte $14 ; |   X X  | $DD96
    .byte $1C ; |   XXX  | $DD97
    .byte $1C ; |   XXX  | $DD98
    .byte $7F ; | XXXXXXX| $DD99
    .byte $08 ; |    X   | $DD9A
    .byte $1C ; |   XXX  | $DD9B
    .byte $1C ; |   XXX  | $DD9C
    .byte $1C ; |   XXX  | $DD9D
    .byte $00 ; |        | $DD9E
    .byte $04 ; |     X  | $DD9F
    .byte $04 ; |     X  | $DDA0
    .byte $14 ; |   X X  | $DDA1
    .byte $1C ; |   XXX  | $DDA2
    .byte $1C ; |   XXX  | $DDA3
    .byte $7F ; | XXXXXXX| $DDA4
    .byte $08 ; |    X   | $DDA5
    .byte $1C ; |   XXX  | $DDA6
    .byte $1C ; |   XXX  | $DDA7
    .byte $1C ; |   XXX  | $DDA8
    .byte $00 ; |        | $DDA9
    .byte $10 ; |   X    | $DDAA
    .byte $10 ; |   X    | $DDAB
    .byte $14 ; |   X X  | $DDAC
    .byte $1C ; |   XXX  | $DDAD
    .byte $1C ; |   XXX  | $DDAE
    .byte $7F ; | XXXXXXX| $DDAF
    .byte $08 ; |    X   | $DDB0
    .byte $1C ; |   XXX  | $DDB1
    .byte $1C ; |   XXX  | $DDB2
    .byte $1C ; |   XXX  | $DDB3
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
    .byte $10 ; |   X    | $DDD8
    .byte $10 ; |   X    | $DDD9
    .byte $10 ; |   X    | $DDDA
    .byte $10 ; |   X    | $DDDB
    .byte $10 ; |   X    | $DDDC
    .byte $00 ; |        | $DDDD
    .byte $00 ; |        | $DDDE
LDDDF:
    .byte $00 ; |        | $DDDF
    .byte $3E ; |  XXXXX | $DDE0
    .byte $02 ; |      X | $DDE1
    .byte $3E ; |  XXXXX | $DDE2
    .byte $20 ; |  X     | $DDE3
    .byte $3E ; |  XXXXX | $DDE4
LDDE5:
    .byte $00 ; |        | $DDE5
    .byte $22 ; |  X   X | $DDE6
    .byte $22 ; |  X   X | $DDE7
    .byte $23 ; |  X   XX| $DDE8
    .byte $22 ; |  X   X | $DDE9
    .byte $FB ; |XXXXX XX| $DDEA
LDDEB:
    .byte $00 ; |        | $DDEB
    .byte $29 ; |  X X  X| $DDEC
    .byte $29 ; |  X X  X| $DDED
    .byte $EF ; |XXX XXXX| $DDEE
    .byte $28 ; |  X X   | $DDEF
    .byte $EF ; |XXX XXXX| $DDF0
LDDF1:
    .byte $00 ; |        | $DDF1
    .byte $08 ; |    X   | $DDF2
    .byte $08 ; |    X   | $DDF3
    .byte $88 ; |X   X   | $DDF4
    .byte $88 ; |X   X   | $DDF5
    .byte $BE ; |X XXXXX | $DDF6

    .byte $FF ; |XXXXXXXX| $DDF7
    .byte $FF ; |XXXXXXXX| $DDF8
    .byte $FF ; |XXXXXXXX| $DDF9
    .byte $FF ; |XXXXXXXX| $DDFA
    .byte $FF ; |XXXXXXXX| $DDFB
    .byte $FF ; |XXXXXXXX| $DDFC
    .byte $FF ; |XXXXXXXX| $DDFD
    .byte $FF ; |XXXXXXXX| $DDFE
    .byte $FF ; |XXXXXXXX| $DDFF

    .byte $00 ; |        | $DE00
    .byte $00 ; |        | $DE01
    .byte $7C ; | XXXXX  | $DE02
    .byte $7C ; | XXXXX  | $DE03
    .byte $7A ; | XXXX X | $DE04
    .byte $7A ; | XXXX X | $DE05
    .byte $78 ; | XXXX   | $DE06
    .byte $30 ; |  XX    | $DE07
    .byte $30 ; |  XX    | $DE08
    .byte $30 ; |  XX    | $DE09
    .byte $70 ; | XXX    | $DE0A
    .byte $70 ; | XXX    | $DE0B
    .byte $30 ; |  XX    | $DE0C
    .byte $30 ; |  XX    | $DE0D
    .byte $78 ; | XXXX   | $DE0E
    .byte $FC ; |XXXXXX  | $DE0F
    .byte $30 ; |  XX    | $DE10
    .byte $30 ; |  XX    | $DE11
    .byte $30 ; |  XX    | $DE12
    .byte $30 ; |  XX    | $DE13
    .byte $00 ; |        | $DE14
    .byte $00 ; |        | $DE15
    .byte $00 ; |        | $DE16
    .byte $7E ; | XXXXXX | $DE17
    .byte $7E ; | XXXXXX | $DE18
    .byte $7B ; | XXXX XX| $DE19
    .byte $78 ; | XXXX   | $DE1A
    .byte $78 ; | XXXX   | $DE1B
    .byte $30 ; |  XX    | $DE1C
    .byte $30 ; |  XX    | $DE1D
    .byte $30 ; |  XX    | $DE1E
    .byte $70 ; | XXX    | $DE1F
    .byte $70 ; | XXX    | $DE20
    .byte $30 ; |  XX    | $DE21
    .byte $30 ; |  XX    | $DE22
    .byte $70 ; | XXX    | $DE23
    .byte $F0 ; |XXXX    | $DE24
    .byte $30 ; |  XX    | $DE25
    .byte $50 ; | X X    | $DE26
    .byte $48 ; | X  X   | $DE27
    .byte $84 ; |X    X  | $DE28
    .byte $00 ; |        | $DE29
    .byte $18 ; |   XX   | $DE2A
    .byte $3C ; |  XXXX  | $DE2B
    .byte $3C ; |  XXXX  | $DE2C
    .byte $7E ; | XXXXXX | $DE2D
    .byte $7E ; | XXXXXX | $DE2E
    .byte $9F ; |X  XXXXX| $DE2F
    .byte $FF ; |XXXXXXXX| $DE30
    .byte $FF ; |XXXXXXXX| $DE31
    .byte $FF ; |XXXXXXXX| $DE32
    .byte $FF ; |XXXXXXXX| $DE33
    .byte $FF ; |XXXXXXXX| $DE34
    .byte $7E ; | XXXXXX | $DE35
    .byte $7E ; | XXXXXX | $DE36
    .byte $BD ; |X XXXX X| $DE37
    .byte $BD ; |X XXXX X| $DE38
    .byte $18 ; |   XX   | $DE39
    .byte $18 ; |   XX   | $DE3A
    .byte $18 ; |   XX   | $DE3B
    .byte $18 ; |   XX   | $DE3C
    .byte $18 ; |   XX   | $DE3D
    .byte $00 ; |        | $DE3E
    .byte $18 ; |   XX   | $DE3F
    .byte $3C ; |  XXXX  | $DE40
    .byte $3C ; |  XXXX  | $DE41
    .byte $7E ; | XXXXXX | $DE42
    .byte $7E ; | XXXXXX | $DE43
    .byte $9F ; |X  XXXXX| $DE44
    .byte $FF ; |XXXXXXXX| $DE45
    .byte $FF ; |XXXXXXXX| $DE46
    .byte $FF ; |XXXXXXXX| $DE47
    .byte $FF ; |XXXXXXXX| $DE48
    .byte $FF ; |XXXXXXXX| $DE49
    .byte $7E ; | XXXXXX | $DE4A
    .byte $7E ; | XXXXXX | $DE4B
    .byte $BD ; |X XXXX X| $DE4C
    .byte $BD ; |X XXXX X| $DE4D
    .byte $18 ; |   XX   | $DE4E
    .byte $18 ; |   XX   | $DE4F
    .byte $28 ; |  X X   | $DE50
    .byte $24 ; |  X  X  | $DE51
    .byte $42 ; | X    X | $DE52
    .byte $00 ; |        | $DE53
    .byte $E0 ; |XXX     | $DE54
    .byte $A0 ; |X X     | $DE55
    .byte $A0 ; |X X     | $DE56
    .byte $A0 ; |X X     | $DE57
    .byte $E0 ; |XXX     | $DE58
    .byte $40 ; | X      | $DE59
    .byte $40 ; | X      | $DE5A
    .byte $40 ; | X      | $DE5B
    .byte $40 ; | X      | $DE5C
    .byte $40 ; | X      | $DE5D
    .byte $E0 ; |XXX     | $DE5E
    .byte $80 ; |X       | $DE5F
    .byte $E0 ; |XXX     | $DE60
    .byte $20 ; |  X     | $DE61
    .byte $E0 ; |XXX     | $DE62
    .byte $E0 ; |XXX     | $DE63
    .byte $20 ; |  X     | $DE64
    .byte $60 ; | XX     | $DE65
    .byte $20 ; |  X     | $DE66
    .byte $E0 ; |XXX     | $DE67
    .byte $20 ; |  X     | $DE68
    .byte $20 ; |  X     | $DE69
    .byte $E0 ; |XXX     | $DE6A
    .byte $A0 ; |X X     | $DE6B
    .byte $A0 ; |X X     | $DE6C
    .byte $E0 ; |XXX     | $DE6D
    .byte $20 ; |  X     | $DE6E
    .byte $E0 ; |XXX     | $DE6F
    .byte $80 ; |X       | $DE70
    .byte $E0 ; |XXX     | $DE71
    .byte $E0 ; |XXX     | $DE72
    .byte $A0 ; |X X     | $DE73
    .byte $E0 ; |XXX     | $DE74
    .byte $80 ; |X       | $DE75
    .byte $E0 ; |XXX     | $DE76
    .byte $20 ; |  X     | $DE77
    .byte $20 ; |  X     | $DE78
    .byte $20 ; |  X     | $DE79
    .byte $20 ; |  X     | $DE7A
    .byte $E0 ; |XXX     | $DE7B
    .byte $E0 ; |XXX     | $DE7C
    .byte $A0 ; |X X     | $DE7D
    .byte $E0 ; |XXX     | $DE7E
    .byte $A0 ; |X X     | $DE7F
    .byte $E0 ; |XXX     | $DE80
    .byte $E0 ; |XXX     | $DE81
    .byte $20 ; |  X     | $DE82
    .byte $E0 ; |XXX     | $DE83
    .byte $A0 ; |X X     | $DE84
    .byte $E0 ; |XXX     | $DE85
LDE86:
    .byte $0E ; |    XXX | $DE86
    .byte $0A ; |    X X | $DE87
    .byte $0A ; |    X X | $DE88
    .byte $0A ; |    X X | $DE89
    .byte $0E ; |    XXX | $DE8A
    .byte $04 ; |     X  | $DE8B
    .byte $04 ; |     X  | $DE8C
    .byte $04 ; |     X  | $DE8D
    .byte $04 ; |     X  | $DE8E
    .byte $04 ; |     X  | $DE8F
    .byte $0E ; |    XXX | $DE90
    .byte $08 ; |    X   | $DE91
    .byte $0E ; |    XXX | $DE92
    .byte $02 ; |      X | $DE93
    .byte $0E ; |    XXX | $DE94
    .byte $0E ; |    XXX | $DE95
    .byte $02 ; |      X | $DE96
    .byte $06 ; |     XX | $DE97
    .byte $02 ; |      X | $DE98
    .byte $0E ; |    XXX | $DE99
    .byte $02 ; |      X | $DE9A
    .byte $02 ; |      X | $DE9B
    .byte $0E ; |    XXX | $DE9C
    .byte $0A ; |    X X | $DE9D
    .byte $0A ; |    X X | $DE9E
    .byte $0E ; |    XXX | $DE9F
    .byte $02 ; |      X | $DEA0
    .byte $0E ; |    XXX | $DEA1
    .byte $08 ; |    X   | $DEA2
    .byte $0E ; |    XXX | $DEA3
    .byte $0E ; |    XXX | $DEA4
    .byte $0A ; |    X X | $DEA5
    .byte $0E ; |    XXX | $DEA6
    .byte $08 ; |    X   | $DEA7
    .byte $0E ; |    XXX | $DEA8
    .byte $02 ; |      X | $DEA9
    .byte $02 ; |      X | $DEAA
    .byte $02 ; |      X | $DEAB
    .byte $02 ; |      X | $DEAC
    .byte $0E ; |    XXX | $DEAD
    .byte $0E ; |    XXX | $DEAE
    .byte $0A ; |    X X | $DEAF
    .byte $0E ; |    XXX | $DEB0
    .byte $0A ; |    X X | $DEB1
    .byte $0E ; |    XXX | $DEB2
    .byte $0E ; |    XXX | $DEB3
    .byte $02 ; |      X | $DEB4
    .byte $0E ; |    XXX | $DEB5
    .byte $0A ; |    X X | $DEB6
    .byte $0E ; |    XXX | $DEB7
LDEB8:
    .byte $00 ; |        | $DEB8
    .byte $14 ; |   X X  | $DEB9
    .byte $14 ; |   X X  | $DEBA
    .byte $14 ; |   X X  | $DEBB
    .byte $1C ; |   XXX  | $DEBC
    .byte $1C ; |   XXX  | $DEBD
    .byte $7F ; | XXXXXXX| $DEBE
    .byte $08 ; |    X   | $DEBF
    .byte $1C ; |   XXX  | $DEC0
    .byte $1C ; |   XXX  | $DEC1
    .byte $1C ; |   XXX  | $DEC2
    .byte $00 ; |        | $DEC3
    .byte $00 ; |        | $DEC4
    .byte $1C ; |   XXX  | $DEC5
    .byte $22 ; |  X   X | $DEC6
LDEC7:
    .byte $1C ; |   XXX  | $DEC7
    .byte $48 ; | X  X   | $DEC8
    .byte $48 ; | X  X   | $DEC9
    .byte $48 ; | X  X   | $DECA
    .byte $48 ; | X  X   | $DECB
    .byte $C6 ; |XX   XX | $DECC
    .byte $C6 ; |XX   XX | $DECD
    .byte $16 ; |   X XX | $DECE
    .byte $16 ; |   X XX | $DECF
    .byte $16 ; |   X XX | $DED0
    .byte $16 ; |   X XX | $DED1
    .byte $00 ; |        | $DED2
    .byte $00 ; |        | $DED3
    .byte $1D ; |   XXX X| $DED4
    .byte $1D ; |   XXX X| $DED5
    .byte $1D ; |   XXX X| $DED6
LDED7:
    .byte $00 ; |        | $DED7
    .byte $7E ; | XXXXXX | $DED8
    .byte $24 ; |  X  X  | $DED9
    .byte $24 ; |  X  X  | $DEDA
    .byte $24 ; |  X  X  | $DEDB
    .byte $24 ; |  X  X  | $DEDC
    .byte $24 ; |  X  X  | $DEDD
    .byte $24 ; |  X  X  | $DEDE
    .byte $24 ; |  X  X  | $DEDF
    .byte $3C ; |  XXXX  | $DEE0
    .byte $7E ; | XXXXXX | $DEE1
    .byte $3C ; |  XXXX  | $DEE2
    .byte $3C ; |  XXXX  | $DEE3
    .byte $7E ; | XXXXXX | $DEE4
    .byte $7E ; | XXXXXX | $DEE5
    .byte $7E ; | XXXXXX | $DEE6
    .byte $7E ; | XXXXXX | $DEE7
    .byte $7E ; | XXXXXX | $DEE8
    .byte $7E ; | XXXXXX | $DEE9
    .byte $7E ; | XXXXXX | $DEEA
    .byte $7E ; | XXXXXX | $DEEB
    .byte $7E ; | XXXXXX | $DEEC
    .byte $3C ; |  XXXX  | $DEED
    .byte $3C ; |  XXXX  | $DEEE
    .byte $3C ; |  XXXX  | $DEEF
    .byte $3C ; |  XXXX  | $DEF0
    .byte $3C ; |  XXXX  | $DEF1
    .byte $3C ; |  XXXX  | $DEF2
    .byte $3C ; |  XXXX  | $DEF3
    .byte $3C ; |  XXXX  | $DEF4
    .byte $3C ; |  XXXX  | $DEF5
    .byte $18 ; |   XX   | $DEF6
    .byte $18 ; |   XX   | $DEF7
    .byte $3C ; |  XXXX  | $DEF8
    .byte $3C ; |  XXXX  | $DEF9
    .byte $3C ; |  XXXX  | $DEFA
    .byte $18 ; |   XX   | $DEFB
    .byte $18 ; |   XX   | $DEFC
    .byte $18 ; |   XX   | $DEFD

    .byte $FF ; |XXXXXXXX| $DEFE
    .byte $FF ; |XXXXXXXX| $DEFF

LDF00:
    .byte $00 ; |        | $DF00
    .byte $80 ; |X       | $DF01
    .byte $94 ; |X  X X  | $DF02
    .byte $63 ; | XX   XX| $DF03
    .byte $45 ; | X   X X| $DF04
    .byte $80 ; |X       | $DF05
    .byte $5C ; | X XXX  | $DF06
    .byte $55 ; | X X X X| $DF07
    .byte $55 ; | X X X X| $DF08
    .byte $50 ; | X X    | $DF09
    .byte $55 ; | X X X X| $DF0A
    .byte $54 ; | X X X  | $DF0B
    .byte $55 ; | X X X X| $DF0C
    .byte $50 ; | X X    | $DF0D
    .byte $5D ; | X XXX X| $DF0E
    .byte $64 ; | XX  X  | $DF0F
    .byte $6D ; | XX XX X| $DF10
    .byte $08 ; |    X   | $DF11
    .byte $00 ; |        | $DF12
    .byte $00 ; |        | $DF13
    .byte $00 ; |        | $DF14
    .byte $04 ; |     X  | $DF15
    .byte $00 ; |        | $DF16
    .byte $00 ; |        | $DF17
    .byte $00 ; |        | $DF18
    .byte $FC ; |XXXXXX  | $DF19
    .byte $39 ; |  XXX  X| $DF1A
    .byte $8D ; |X   XX X| $DF1B
    .byte $39 ; |  XXX  X| $DF1C
    .byte $26 ; |  X  XX | $DF1D
    .byte $E6 ; |XXX  XX | $DF1E
    .byte $52 ; | X X  X | $DF1F
    .byte $2A ; |  X X X | $DF20
    .byte $32 ; |  XX  X | $DF21
    .byte $C5 ; |XX   X X| $DF22
    .byte $52 ; | X X  X | $DF23
    .byte $24 ; |  X  X  | $DF24
    .byte $92 ; |X  X  X | $DF25
    .byte $A4 ; |X X  X  | $DF26
    .byte $88 ; |X   X   | $DF27
    .byte $24 ; |  X  X  | $DF28
    .byte $80 ; |X       | $DF29
    .byte $94 ; |X  X X  | $DF2A
    .byte $06 ; |     XX | $DF2B
    .byte $15 ; |   X X X| $DF2C
    .byte $40 ; | X      | $DF2D
    .byte $92 ; |X  X  X | $DF2E
    .byte $80 ; |X       | $DF2F
    .byte $14 ; |   X X  | $DF30
    .byte $40 ; | X      | $DF31
    .byte $4A ; | X  X X | $DF32
    .byte $40 ; | X      | $DF33
    .byte $10 ; |   X    | $DF34
    .byte $80 ; |X       | $DF35
    .byte $49 ; | X  X  X| $DF36
    .byte $40 ; | X      | $DF37
    .byte $0C ; |    XX  | $DF38
    .byte $00 ; |        | $DF39
    .byte $30 ; |  XX    | $DF3A
    .byte $80 ; |X       | $DF3B
    .byte $03 ; |      XX| $DF3C
    .byte $00 ; |        | $DF3D
    .byte $00 ; |        | $DF3E
    .byte $00 ; |        | $DF3F
    .byte $00 ; |        | $DF40
    .byte $00 ; |        | $DF41
    .byte $00 ; |        | $DF42
    .byte $00 ; |        | $DF43
    .byte $00 ; |        | $DF44
    .byte $00 ; |        | $DF45
    .byte $00 ; |        | $DF46
    .byte $00 ; |        | $DF47
    .byte $00 ; |        | $DF48
    .byte $00 ; |        | $DF49
    .byte $00 ; |        | $DF4A
    .byte $00 ; |        | $DF4B
    .byte $00 ; |        | $DF4C
    .byte $00 ; |        | $DF4D
    .byte $00 ; |        | $DF4E
    .byte $00 ; |        | $DF4F
    .byte $00 ; |        | $DF50
    .byte $00 ; |        | $DF51
    .byte $00 ; |        | $DF52
    .byte $00 ; |        | $DF53
    .byte $00 ; |        | $DF54
    .byte $EE ; |XXX XXX | $DF55
    .byte $FE ; |XXXXXXX | $DF56
    .byte $0E ; |    XXX | $DF57
    .byte $FE ; |XXXXXXX | $DF58
    .byte $EE ; |XXX XXX | $DF59
    .byte $E6 ; |XXX  XX | $DF5A
    .byte $3E ; |  XXXXX | $DF5B
    .byte $EE ; |XXX XXX | $DF5C
    .byte $EE ; |XXX XXX | $DF5D
    .byte $E2 ; |XXX   X | $DF5E
    .byte $3A ; |  XXX X | $DF5F
    .byte $EE ; |XXX XXX | $DF60
    .byte $EC ; |XXX XX  | $DF61
    .byte $F8 ; |XXXXX   | $DF62
    .byte $72 ; | XXX  X | $DF63
    .byte $EE ; |XXX XXX | $DF64
    .byte $FE ; |XXXXXXX | $DF65
    .byte $E0 ; |XXX     | $DF66
    .byte $E2 ; |XXX   X | $DF67
    .byte $EE ; |XXX XXX | $DF68
    .byte $EE ; |XXX XXX | $DF69
    .byte $E2 ; |XXX   X | $DF6A
    .byte $E2 ; |XXX   X | $DF6B
    .byte $EE ; |XXX XXX | $DF6C
    .byte $EE ; |XXX XXX | $DF6D
    .byte $E6 ; |XXX  XX | $DF6E
    .byte $E6 ; |XXX  XX | $DF6F
    .byte $EE ; |XXX XXX | $DF70
    .byte $FE ; |XXXXXXX | $DF71
    .byte $FE ; |XXXXXXX | $DF72
    .byte $EE ; |XXX XXX | $DF73
    .byte $FE ; |XXXXXXX | $DF74
    .byte $00 ; |        | $DF75
    .byte $00 ; |        | $DF76
    .byte $00 ; |        | $DF77
    .byte $00 ; |        | $DF78
    .byte $00 ; |        | $DF79
    .byte $00 ; |        | $DF7A
    .byte $00 ; |        | $DF7B
    .byte $00 ; |        | $DF7C
    .byte $FE ; |XXXXXXX | $DF7D
    .byte $EE ; |XXX XXX | $DF7E
    .byte $EE ; |XXX XXX | $DF7F
    .byte $FE ; |XXXXXXX | $DF80
    .byte $E6 ; |XXX  XX | $DF81
    .byte $CE ; |XX  XXX | $DF82
    .byte $CE ; |XX  XXX | $DF83
    .byte $E2 ; |XXX   X | $DF84
    .byte $E2 ; |XXX   X | $DF85
    .byte $8E ; |X   XXX | $DF86
    .byte $9C ; |X  XXX  | $DF87
    .byte $E2 ; |XXX   X | $DF88
    .byte $F8 ; |XXXXX   | $DF89
    .byte $AE ; |X X XXX | $DF8A
    .byte $FC ; |XXXXXX  | $DF8B
    .byte $E6 ; |XXX  XX | $DF8C
    .byte $E0 ; |XXX     | $DF8D
    .byte $BE ; |X XXXXX | $DF8E
    .byte $9C ; |X  XXX  | $DF8F
    .byte $E0 ; |XXX     | $DF90
    .byte $E2 ; |XXX   X | $DF91
    .byte $EE ; |XXX XXX | $DF92
    .byte $B8 ; |X XXX   | $DF93
    .byte $E2 ; |XXX   X | $DF94
    .byte $E6 ; |XXX  XX | $DF95
    .byte $CE ; |XX  XXX | $DF96
    .byte $B8 ; |X XXX   | $DF97
    .byte $E6 ; |XXX  XX | $DF98
    .byte $FE ; |XXXXXXX | $DF99
    .byte $CE ; |XX  XXX | $DF9A
    .byte $F0 ; |XXXX    | $DF9B
    .byte $FE ; |XXXXXXX | $DF9C
    .byte $00 ; |        | $DF9D
    .byte $00 ; |        | $DF9E
    .byte $00 ; |        | $DF9F
    .byte $00 ; |        | $DFA0
    .byte $00 ; |        | $DFA1
    .byte $00 ; |        | $DFA2
    .byte $00 ; |        | $DFA3
    .byte $00 ; |        | $DFA4
    .byte $00 ; |        | $DFA5
    .byte $00 ; |        | $DFA6
    .byte $00 ; |        | $DFA7
    .byte $00 ; |        | $DFA8
    .byte $00 ; |        | $DFA9
    .byte $00 ; |        | $DFAA
    .byte $00 ; |        | $DFAB
    .byte $00 ; |        | $DFAC
    .byte $00 ; |        | $DFAD
    .byte $00 ; |        | $DFAE
    .byte $00 ; |        | $DFAF
    .byte $00 ; |        | $DFB0
    .byte $00 ; |        | $DFB1
    .byte $00 ; |        | $DFB2
    .byte $00 ; |        | $DFB3
    .byte $00 ; |        | $DFB4
    .byte $00 ; |        | $DFB5
    .byte $00 ; |        | $DFB6
    .byte $00 ; |        | $DFB7
    .byte $00 ; |        | $DFB8
LDFB9:
    .byte $00 ; |        | $DFB9
    .byte $1E ; |   XXXX | $DFBA
    .byte $11 ; |   X   X| $DFBB
    .byte $11 ; |   X   X| $DFBC
    .byte $11 ; |   X   X| $DFBD
    .byte $1E ; |   XXXX | $DFBE
    .byte $00 ; |        | $DFBF
    .byte $12 ; |   X  X | $DFC0
    .byte $12 ; |   X  X | $DFC1
    .byte $1F ; |   XXXXX| $DFC2
    .byte $11 ; |   X   X| $DFC3
    .byte $1F ; |   XXXXX| $DFC4
    .byte $00 ; |        | $DFC5
    .byte $1F ; |   XXXXX| $DFC6
    .byte $11 ; |   X   X| $DFC7
    .byte $11 ; |   X   X| $DFC8
    .byte $11 ; |   X   X| $DFC9
    .byte $1F ; |   XXXXX| $DFCA
    .byte $00 ; |        | $DFCB
    .byte $1F ; |   XXXXX| $DFCC
    .byte $15 ; |   X X X| $DFCD
    .byte $15 ; |   X X X| $DFCE
    .byte $11 ; |   X   X| $DFCF
    .byte $11 ; |   X   X| $DFD0
    .byte $00 ; |        | $DFD1
    .byte $1F ; |   XXXXX| $DFD2
    .byte $01 ; |       X| $DFD3
    .byte $1F ; |   XXXXX| $DFD4
    .byte $10 ; |   X    | $DFD5
    .byte $1F ; |   XXXXX| $DFD6
    .byte $00 ; |        | $DFD7
    .byte $1F ; |   XXXXX| $DFD8
    .byte $01 ; |       X| $DFD9
    .byte $1F ; |   XXXXX| $DFDA
    .byte $10 ; |   X    | $DFDB
    .byte $1F ; |   XXXXX| $DFDC
    .byte $00 ; |        | $DFDD
    .byte $11 ; |   X   X| $DFDE
    .byte $11 ; |   X   X| $DFDF
    .byte $1F ; |   XXXXX| $DFE0
    .byte $11 ; |   X   X| $DFE1
    .byte $1F ; |   XXXXX| $DFE2
    .byte $00 ; |        | $DFE3
    .byte $10 ; |   X    | $DFE4
    .byte $10 ; |   X    | $DFE5
    .byte $1F ; |   XXXXX| $DFE6
    .byte $11 ; |   X   X| $DFE7
    .byte $1F ; |   XXXXX| $DFE8

    .byte $FF ; |XXXXXXXX| $DFE9
    .byte $FF ; |XXXXXXXX| $DFEA
    .byte $FF ; |XXXXXXXX| $DFEB
    .byte $FF ; |XXXXXXXX| $DFEC
    .byte $FF ; |XXXXXXXX| $DFED
    .byte $FF ; |XXXXXXXX| $DFEE
    .byte $FF ; |XXXXXXXX| $DFEF
    .byte $FF ; |XXXXXXXX| $DFF0
    .byte $FF ; |XXXXXXXX| $DFF1
LDFF2:
    sta    LFFF9                 ; 4
    jmp.ind ($00FB)              ; 5

    .byte $FF ; |XXXXXXXX| $DFF8
LDFF9:
    .byte $F1 ; |XXXX   X| $DFF9
    .byte $FF ; |XXXXXXXX| $DFFA
    .byte $FF ; |XXXXXXXX| $DFFB

       ORG $DFFC
    .word START,START

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      SECOND BANK
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

      RORG $F000

START_2nd:
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2

    sei                          ; 2
    cld                          ; 2
    lda    #0                    ; 2
    tax                          ; 2
.loopClear:
    sta    0,X                   ; 4
    inx                          ; 2
    bne    .loopClear            ; 2³

    dex                          ; 2
    txs                          ; 2
    ldx    #$0F                  ; 2
    lda    #$DE                  ; 2
LF013:
    sta    $98,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LF013                 ; 2³
    lda    #$FD                  ; 2
    sta    $97                   ; 3
    sta    $95                   ; 3
    lda    #$0C                  ; 2
    sta    AUDC0                 ; 3
    lda    #$DD                  ; 2
    sta    $AB                   ; 3
    lda    #$DC                  ; 2
    sta    $EA                   ; 3
    lda    #$D9                  ; 2
    sta    $EF                   ; 3
    lda    #$DC                  ; 2
    sta    $AD                   ; 3
    lda    #$FF                  ; 2
    ldx    #9                    ; 2
LF037:
    sta    $D3,X                 ; 4
    dex                          ; 2
    bpl    LF037                 ; 2³
    ldy    #9                    ; 2
LF03E:
    lda    INTIM                 ; 4
    sec                          ; 2
    adc    #3                    ; 2
    and    #$0F                  ; 2
    cmp    #$0A                  ; 2
    bcs    LF03E                 ; 2³
    ldx    #9                    ; 2
LF04C:
    cmp    $D3,X                 ; 4
    beq    LF03E                 ; 2³
    dex                          ; 2
    bpl    LF04C                 ; 2³
    sta.wy $D3,Y                 ; 5
    dey                          ; 2
    bpl    LF03E                 ; 2³
    ldy    #9                    ; 2
LF05B:
    lda.wy $D3,Y                 ; 4
    cmp    #9                    ; 2
    bne    LF067                 ; 2³
    lda    #8                    ; 2
    sta.wy $D3,Y                 ; 5
LF067:
    sta.wy $C5,Y                 ; 5
    dey                          ; 2
    bpl    LF05B                 ; 2³
    jsr    LF073                 ; 6
    jmp    LF148                 ; 3
LF073:
    lda    $D9                   ; 3
    sta    $F1                   ; 3
    lda    $DC                   ; 3
    sta    $F2                   ; 3
    lda    $DA                   ; 3
    sta    $F3                   ; 3
    lda    $D8                   ; 3
    sta    $F4                   ; 3
    lda    $DB                   ; 3
    sta    $F5                   ; 3
    lda    $D4                   ; 3
    sta    $F6                   ; 3
    lda    $D6                   ; 3
    sta    $F7                   ; 3
    lda    $D3                   ; 3
    sta    $F8                   ; 3
    lda    $D5                   ; 3
    sta    $F9                   ; 3
    lda    $D7                   ; 3
    sta    $FA                   ; 3
    ldx    $89                   ; 3
    lda    $86,X                 ; 4
    cmp    #2                    ; 2
    ldx    #8                    ; 2
    bcs    LF0A9                 ; 2³
    asl                          ; 2
    adc    #3                    ; 2
    tax                          ; 2
LF0A9:
    stx    $FC                   ; 3
    ldy    #9                    ; 2
    lda    $89                   ; 3
    bne    LF0D2                 ; 2³
LF0B1:
    lda.wy $F1,Y                 ; 4
    sta.wy $D3,Y                 ; 5
    cmp    $FC                   ; 3
    bcc    LF0BD                 ; 2³
    lda    #8                    ; 2
LF0BD:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    $FB                   ; 3
    lda.wy $C5,Y                 ; 4
    and    #$0F                  ; 2
    ora    $FB                   ; 3
    sta.wy $C5,Y                 ; 5
    dey                          ; 2
    bpl    LF0B1                 ; 2³
    bmi    LF0ED                 ; 2³
LF0D2:
    lda.wy $F1,Y                 ; 4
    sta.wy $D3,Y                 ; 5
    cmp    $FC                   ; 3
    bcc    LF0DE                 ; 2³
    lda    #8                    ; 2
LF0DE:
    sta    $FB                   ; 3
    lda.wy $C5,Y                 ; 4
    and    #$F0                  ; 2
    ora    $FB                   ; 3
    sta.wy $C5,Y                 ; 5
    dey                          ; 2
    bpl    LF0D2                 ; 2³
LF0ED:
    lda    #0                    ; 2
    sta    $8A                   ; 3
    sta    $90                   ; 3
    sta    $92                   ; 3
    lda    #2                    ; 2
    sta    $CF                   ; 3
    lda    #$7B                  ; 2
    sta    $F8                   ; 3
    ldx    #$95                  ; 2
    lda    $DD                   ; 3
    and    #$40                  ; 2
    bne    LF107                 ; 2³
    ldx    #$81                  ; 2
LF107:
    stx    $F1                   ; 3
    lda    #$80                  ; 2
    sta    $F2                   ; 3
    lda    #$57                  ; 2
    sta    $F3                   ; 3
    lda    #$50                  ; 2
    sta    $F5                   ; 3
    lda    #$36                  ; 2
    sta    $F4                   ; 3
    lda    #$93                  ; 2
    sta    $AA                   ; 3
    lda    #$C4                  ; 2
    sta    $AC                   ; 3
    lda    #$50                  ; 2
    sta    $F9                   ; 3
    lda    #$55                  ; 2
    sta    $F7                   ; 3
    lda    #$A9                  ; 2
    sta    $F6                   ; 3
    lda    #3                    ; 2
    sta    $FA                   ; 3
    lda    #$70                  ; 2
    sta    $D2                   ; 3
    lda    #$41                  ; 2
    sta    $E9                   ; 3
    lda    #$8F                  ; 2
    sta    $94                   ; 3
LF13D:
    lda    #$F3                  ; 2
    sta    $DE                   ; 3
    sta    $E0                   ; 3
    lda    #$7F                  ; 2
    sta    $DF                   ; 3
    rts                          ; 6

LF148:
    sta    WSYNC                 ; 3
    lda    #$2A                  ; 2
    sta    VBLANK                ; 3
    sta    VSYNC                 ; 3
    sta    TIM8T                 ; 4
    ldx    $F0                   ; 3
    beq    LF169                 ; 2³
    dex                          ; 2
    stx    $F0                   ; 3
    bne    LF166                 ; 2³
    stx    $8D                   ; 3
    lda    #$40                  ; 2
    sta    $8A                   ; 3
    lda    #$8F                  ; 2
    sta    $94                   ; 3
LF166:
    jmp    LF1BC                 ; 3
LF169:
    lda    $88                   ; 3
    bne    LF1BC                 ; 2³
    lda    $8A                   ; 3
    and    #$20                  ; 2
    bne    LF1BC                 ; 2³
    sec                          ; 2
    lda    $F5                   ; 3
    sbc    #2                    ; 2
    sta    $FB                   ; 3
    adc    #6                    ; 2
    sta    $FC                   ; 3
    lda    $F3                   ; 3
    cmp    $FB                   ; 3
    bcc    LF1A9                 ; 2³
    cmp    $FC                   ; 3
    bcs    LF1A9                 ; 2³
    sec                          ; 2
    lda    $F4                   ; 3
    sbc    #5                    ; 2
    sta    $FB                   ; 3
    adc    #$0C                  ; 2
    sta    $FC                   ; 3
    lda    $F2                   ; 3
    cmp    $FB                   ; 3
    bcc    LF1A9                 ; 2³
    cmp    $FC                   ; 3
    bcs    LF1A9                 ; 2³
    lda    #$E7                  ; 2
    sta    $96                   ; 3
    lda    #4                    ; 2
    ora    $8A                   ; 3
    sta    $8A                   ; 3
    bne    LF1BC                 ; 2³
LF1A9:
    lda    $8D                   ; 3
    beq    LF1BC                 ; 2³
    sec                          ; 2
    lda    $F1                   ; 3
    sbc    $F8                   ; 3
    cmp    #5                    ; 2
    bcs    LF1BC                 ; 2³
    lda    #4                    ; 2
    ora    $8A                   ; 3
    sta    $8A                   ; 3
LF1BC:
    lda    INTIM                 ; 4
    bne    LF1BC                 ; 2³
    sta    WSYNC                 ; 3
    sta    VSYNC                 ; 3
    lda    #$24                  ; 2
    sta    TIM64T                ; 4
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcs    LF1F9                 ; 2³
    lda    $DD                   ; 3
    lsr                          ; 2
    bcc    LF1D7                 ; 2³
    bcs    LF251                 ; 2³+1
LF1D7:
    lda    #$45                  ; 2
    ora    $DD                   ; 3
    sta    $DD                   ; 3
    jsr    LF23D                 ; 6
    jsr    LF073                 ; 6
    lda    #1                    ; 2
    sta    $89                   ; 3
    jsr    LF073                 ; 6
    lda    #0                    ; 2
    sta    $89                   ; 3
    lda    #$40                  ; 2
    sta    $8A                   ; 3
    lda    #$0E                  ; 2
    sta    $E3                   ; 3
    jmp    LF289                 ; 3
LF1F9:
    lda    #$FE                  ; 2
    and    $DD                   ; 3
    sta    $DD                   ; 3
    lda    SWCHB                 ; 4
    and    #$02                  ; 2
    beq    LF20F                 ; 2³
    lda    $DD                   ; 3
    and    #$FD                  ; 2
    sta    $DD                   ; 3
    jmp    LF251                 ; 3
LF20F:
    lda    $DD                   ; 3
    and    #$02                  ; 2
    beq    LF217                 ; 2³
    bne    LF251                 ; 2³
LF217:
    lda    #0                    ; 2
    sta    $88                   ; 3
    lda    #2                    ; 2
    ora    $DD                   ; 3
    sta    $DD                   ; 3
    and    #$40                  ; 2
    bne    LF234                 ; 2³
    lda    #$80                  ; 2
    eor    $DD                   ; 3
    sta    $DD                   ; 3
    jsr    LF23D                 ; 6
    jsr    LF073                 ; 6
    jmp    LFADD                 ; 3
LF234:
    lda    #$BF                  ; 2
    and    $DD                   ; 3
    sta    $DD                   ; 3
    jmp    LF251                 ; 3
LF23D:
    ldx    #$13                  ; 2
    lda    #0                    ; 2
LF241:
    sta    $80,X                 ; 4
    dex                          ; 2
    bpl    LF241                 ; 2³
    lda    #3                    ; 2
    sta    $E1                   ; 3
    sta    $E2                   ; 3
    lda    #$C2                  ; 2
    sta    $96                   ; 3
    rts                          ; 6

LF251:
    lda    $8A                   ; 3
    and    #$04                  ; 2
    beq    LF289                 ; 2³
    lda    $AA                   ; 3
    cmp    #$7E                  ; 2
    bcs    LF289                 ; 2³
    sta    $FB                   ; 3
    ldx    #0                    ; 2
    lda    #$2E                  ; 2
LF263:
    cmp    $FB                   ; 3
    beq    LF26D                 ; 2³
    clc                          ; 2
    adc    #$0A                  ; 2
    inx                          ; 2
    bne    LF263                 ; 2³
LF26D:
    ldy    #0                    ; 2
    lda    ($A8),Y               ; 5
    ldy    $89                   ; 3
    and    LFCCE,Y               ; 4
    sta    $FB                   ; 3
    ldy    $89                   ; 3
    bne    LF282                 ; 2³
    txa                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    tax                          ; 2
LF282:
    txa                          ; 2
    ora    $FB                   ; 3
    ldy    #0                    ; 2
    sta    ($A8),Y               ; 6
LF289:
    lda    $F0                   ; 3
    beq    LF290                 ; 2³
    jmp    LF92F                 ; 3
LF290:
    lda    $88                   ; 3
    beq    LF297                 ; 2³
    jmp    LF8D4                 ; 3
LF297:
    bit    $8A                   ; 3
    bvc    LF29E                 ; 2³
    jmp    LFA07                 ; 3
LF29E:
    lda    $8A                   ; 3
    tax                          ; 2
    and    #$20                  ; 2
    beq    LF2A8                 ; 2³
    jmp    LFAA1                 ; 3
LF2A8:
    txa                          ; 2
    and    #$10                  ; 2
    beq    LF31A                 ; 2³+1
    lda    #$F6                  ; 2
    sta    $96                   ; 3
    ldy    #0                    ; 2
    lda    #$41                  ; 2
LF2B5:
    cmp    $E9                   ; 3
    beq    LF2BF                 ; 2³
    clc                          ; 2
    adc    #$18                  ; 2
    iny                          ; 2
    bne    LF2B5                 ; 2³
LF2BF:
    lda    LFCDA,Y               ; 4
    sta    $FB                   ; 3
    ldy    #4                    ; 2
    ldx    $89                   ; 3
    lda    $86,X                 ; 4
    cmp    #4                    ; 2
    bcs    LF2CF                 ; 2³
    tay                          ; 2
LF2CF:
    lda    LFCD5,Y               ; 4
    clc                          ; 2
    adc    $FB                   ; 3
    sta    $FB                   ; 3
    lda    #0                    ; 2
    jsr    LFC21                 ; 6
    ldx    $89                   ; 3
    inc    $86,X                 ; 6
    sec                          ; 2
    rol    $8E,X                 ; 6
    lda    $86,X                 ; 4
    cmp    #3                    ; 2
    beq    LF2ED                 ; 2³
    cmp    #$0A                  ; 2
    bne    LF2EF                 ; 2³
LF2ED:
    inc    $E1,X                 ; 6
LF2EF:
    jsr    LF073                 ; 6
    ldx    $89                   ; 3
    ldy    #0                    ; 2
    lda    $EC,X                 ; 4
    sty    $EC,X                 ; 4
    bne    LF30F                 ; 2³+1
    ldy    #8                    ; 2
    lda    $86,X                 ; 4
    cmp    #8                    ; 2
    bcc    LF305                 ; 2³
    tya                          ; 2
LF305:
    asl                          ; 2
    sta    $FB                   ; 3
    lda    $F8                   ; 3
    sec                          ; 2
    sbc    $FB                   ; 3
    sta    $F8                   ; 3
LF30F:
    lda    #2                    ; 2
    sta    $8A                   ; 3
    lda    #$70                  ; 2
    sta    $F0                   ; 3
    jmp    LF92F                 ; 3
LF31A:
    txa                          ; 2
    and    #$04                  ; 2
    beq    LF34D                 ; 2³
    lda    #0                    ; 2
    sta    $8D                   ; 3
    jsr    LF13D                 ; 6
    ldx    $89                   ; 3
    lda    $DD                   ; 3
    and    #$40                  ; 2
    beq    LF33E                 ; 2³
    dec    $E1,X                 ; 6
    lda    $DD                   ; 3
    bpl    LF33E                 ; 2³
    txa                          ; 2
    eor    #$01                  ; 2
    tax                          ; 2
    lda    $E1,X                 ; 4
    beq    LF33E                 ; 2³
    stx    $89                   ; 3
LF33E:
    lda    #1                    ; 2
    sta    $88                   ; 3
    sta    $EC,X                 ; 4
    sta    $8A                   ; 3
    lda    #$A0                  ; 2
    sta    $F2                   ; 3
    jmp    LF8D4                 ; 3
LF34D:
    ldx    #$A0                  ; 2
    dec    $F8                   ; 5
    bne    LF355                 ; 2³
    stx    $F8                   ; 3
LF355:
    dec    $F1                   ; 5
    bne    LF35B                 ; 2³
    stx    $F1                   ; 3
LF35B:
    dec    $D0                   ; 5
    bne    LF37F                 ; 2³
    lda    $AA                   ; 3
    cmp    #$7E                  ; 2
    bne    LF373                 ; 2³
    dec    $D1                   ; 5
    bne    LF373                 ; 2³
    lda    #4                    ; 2
    ora    $8A                   ; 3
    sta    $8A                   ; 3
    lda    #$E7                  ; 2
    sta    $96                   ; 3
LF373:
    lda    #$B5                  ; 2
    sta    $D0                   ; 3
    dec    $F1                   ; 5
    bne    LF37F                 ; 2³
    ldx    #$A0                  ; 2
    stx    $F1                   ; 3
LF37F:
    lda    $DD                   ; 3
    and    #$40                  ; 2
    bne    LF38C                 ; 2³
    lda    $F1                   ; 3
    sta    $E3                   ; 3
    jmp    LF657                 ; 3
LF38C:
    ldx    $89                   ; 3
    lda    $86,X                 ; 4
    cmp    #3                    ; 2
    bcs    LF3A0                 ; 2³
    lda    #$F3                  ; 2
    sta    $DE                   ; 3
    sta    $E0                   ; 3
    lda    #$7F                  ; 2
    sta    $DF                   ; 3
    bne    LF3BE                 ; 2³
LF3A0:
    bne    LF3B0                 ; 2³
    lda    #$FF                  ; 2
    sta    $DE                   ; 3
    lda    #$F3                  ; 2
    sta    $E0                   ; 3
    lda    #$7F                  ; 2
    sta    $DF                   ; 3
    bne    LF3BE                 ; 2³
LF3B0:
    cmp    #5                    ; 2
    bne    LF3BE                 ; 2³
    lda    #$FF                  ; 2
    sta    $DE                   ; 3
    sta    $E0                   ; 3
    lda    #$7F                  ; 2
    sta    $DF                   ; 3
LF3BE:
    dec    $CF                   ; 5
    beq    LF3C5                 ; 2³
    jmp    LF64E                 ; 3
LF3C5:
    lda    #2                    ; 2
    sta    $CF                   ; 3
    lda    $8A                   ; 3
    and    #$02                  ; 2
    beq    LF3D2                 ; 2³
    jmp    LF92F                 ; 3
LF3D2:
    lda    #$80                  ; 2
    ora    $8A                   ; 3
    sta    $8A                   ; 3
    lda    $F2                   ; 3
    cmp    #$6B                  ; 2
    bcc    LF3E1                 ; 2³
    jmp    LF4CE                 ; 3
LF3E1:
    lda    CXPPMM                ; 3
    bmi    LF3EC                 ; 2³
    lda    #0                    ; 2
    sta    $C4                   ; 3
    jmp    LF719                 ; 3
LF3EC:
    ldx    #$13                  ; 2
LF3EE:
    lda    $F3                   ; 3
    cmp    LFD6F,X               ; 4
    beq    LF3FC                 ; 2³
    dex                          ; 2
    dex                          ; 2
    bpl    LF3EE                 ; 2³
    jmp    LF719                 ; 3
LF3FC:
    dex                          ; 2
    lda    $F2                   ; 3
    cmp    LFD6F,X               ; 4
    beq    LF40A                 ; 2³
    dex                          ; 2
    bpl    LF3EE                 ; 2³+1
    jmp    LF719                 ; 3
LF40A:
    lda    $A8                   ; 3
    sta    $FB                   ; 3
    txa                          ; 2
    lsr                          ; 2
    adc    #$C5                  ; 2
    sta    $A8                   ; 3
    ldy    #0                    ; 2
    lda    ($A8),Y               ; 5
    ldx    $89                   ; 3
    bne    LF420                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
LF420:
    and    #$0F                  ; 2
    tax                          ; 2
    lda    #$24                  ; 2
    clc                          ; 2
LF426:
    adc    #$0A                  ; 2
    dex                          ; 2
    bpl    LF426                 ; 2³
    cmp    #$7E                  ; 2
    beq    LF44D                 ; 2³
    cmp    $AA                   ; 3
    bne    LF44D                 ; 2³
    lda    $C4                   ; 3
    beq    LF43A                 ; 2³
    jmp    LF4CB                 ; 3
LF43A:
    lda    #$FF                  ; 2
    sta    $C4                   ; 3
    lda    #$93                  ; 2
    sta    $AA                   ; 3
    lda    #$C4                  ; 2
    sta    $AC                   ; 3
    lda    #$C3                  ; 2
    sta    $96                   ; 3
    jmp    LF4CB                 ; 3
LF44D:
    ldx    $AA                   ; 3
    cpx    #$93                  ; 2
    bcs    LF45A                 ; 2³
    lda    $FB                   ; 3
    sta    $A8                   ; 3
    jmp    LF4CB                 ; 3
LF45A:
    ldx    $C4                   ; 3
    bne    LF4CB                 ; 2³
    sta    $AA                   ; 3
    cmp    #$7E                  ; 2
    bne    LF472                 ; 2³
    lda    #$DE                  ; 2
    sta    $96                   ; 3
    lda    #3                    ; 2
    sta    $D1                   ; 3
    lda    #$DA                  ; 2
    sta    $AC                   ; 3
    bne    LF490                 ; 2³
LF472:
    lda    #$C3                  ; 2
    sta    $96                   ; 3
    lda    #$CF                  ; 2
    sta    $AC                   ; 3
    lda    #$FF                  ; 2
    sta    $C4                   ; 3
    ldx    $89                   ; 3
    lda    $AA                   ; 3
    cmp    $C2,X                 ; 4
    bne    LF490                 ; 2³
    lda    ($A8),Y               ; 5
    and    LFCCE,X               ; 4
    ora    LFCD0,X               ; 4
    sta    ($A8),Y               ; 6
LF490:
    ldx    $89                   ; 3
    lda    $86,X                 ; 4
    tax                          ; 2
    lda    $F1                   ; 3
    and    #$03                  ; 2
    cmp    #3                    ; 2
    bne    LF49E                 ; 2³
    lsr                          ; 2
LF49E:
    tay                          ; 2
    cpx    #4                    ; 2
    bne    LF4B4                 ; 2³
    lda    #$F3                  ; 2
    sta    $DE                   ; 3
    sta    $E0                   ; 3
    lda    #$7F                  ; 2
    sta    $DF                   ; 3
    lda    #$FF                  ; 2
    sta.wy $DE,Y                 ; 5
    bne    LF4CB                 ; 2³
LF4B4:
    cpx    #6                    ; 2
    bcc    LF4CB                 ; 2³
    lda    #$FF                  ; 2
    sta    $DE                   ; 3
    sta    $DF                   ; 3
    sta    $E0                   ; 3
    lda    #$F3                  ; 2
    cpy    #1                    ; 2
    bne    LF4C8                 ; 2³
    lda    #$7F                  ; 2
LF4C8:
    sta.wy $DE,Y                 ; 5
LF4CB:
    jmp    LF719                 ; 3
LF4CE:
    lda    CXPPMM                ; 3
    bmi    LF4D5                 ; 2³
    jmp    LF536                 ; 3
LF4D5:
    lda    $AA                   ; 3
    ldx    $89                   ; 3
    cmp    $C2,X                 ; 4
    beq    LF4E0                 ; 2³
    jmp    LF536                 ; 3
LF4E0:
    clc                          ; 2
    ldx    #0                    ; 2
    ldy    #$6C                  ; 2
    lda    #$2E                  ; 2
LF4E7:
    cmp    $AA                   ; 3
    bne    LF4F7                 ; 2³
    cpy    $F2                   ; 3
    beq    LF504                 ; 2³+1
    iny                          ; 2
    cpy    $F2                   ; 3
    beq    LF504                 ; 2³+1
    jmp    LF599                 ; 3
LF4F7:
    adc    #$0A                  ; 2
    sta    $FB                   ; 3
    tya                          ; 2
    adc    #5                    ; 2
    tay                          ; 2
    lda    $FB                   ; 3
    inx                          ; 2
    bne    LF4E7                 ; 2³+1
LF504:
    sec                          ; 2
    lda    #0                    ; 2
LF507:
    rol                          ; 2
    dex                          ; 2
    bpl    LF507                 ; 2³
    ldx    $89                   ; 3
    ora    $8B,X                 ; 4
    sta    $8B,X                 ; 4
    cmp    #$FF                  ; 2
    beq    LF51C                 ; 2³
    sec                          ; 2
    lda    $C2,X                 ; 4
    sbc    #$0A                  ; 2
    sta    $C2,X                 ; 4
LF51C:
    lda    #1                    ; 2
    sta    $FB                   ; 3
    lda    #0                    ; 2
    jsr    LFC21                 ; 6
    lda    #$93                  ; 2
    sta    $AA                   ; 3
    lda    #$C4                  ; 2
    sta    $AC                   ; 3
    inc    $FA                   ; 5
    lda    #$CA                  ; 2
    sta    $96                   ; 3
    jmp    LF599                 ; 3
LF536:
    lda    $AA                   ; 3
    cmp    #$93                  ; 2
    bcs    LF56C                 ; 2³
    cmp    #$7E                  ; 2
    bne    LF599                 ; 2³
    lda    $F3                   ; 3
    cmp    #$88                  ; 2
    bcc    LF599                 ; 2³
    cmp    #$8F                  ; 2
    bcs    LF599                 ; 2³
    lda    $F2                   ; 3
    cmp    #$83                  ; 2
    bcc    LF599                 ; 2³
    cmp    #$8B                  ; 2
    bcs    LF599                 ; 2³
    lda    #$93                  ; 2
    sta    $AA                   ; 3
    lda    #$C4                  ; 2
    sta    $AC                   ; 3
    lda    #$E3                  ; 2
    sta    $96                   ; 3
    lda    #0                    ; 2
    sta    $FB                   ; 3
    lda    #$25                  ; 2
    jsr    LFC21                 ; 6
    jmp    LF599                 ; 3
LF56C:
    lda    $F3                   ; 3
    cmp    #$1A                  ; 2
    bcc    LF599                 ; 2³
    cmp    #$21                  ; 2
    bcs    LF599                 ; 2³
    lda    $F2                   ; 3
    cmp    #$8C                  ; 2
    bcc    LF599                 ; 2³
    cmp    #$9B                  ; 2
    bcs    LF599                 ; 2³
    ldx    $89                   ; 3
    lda    $8B,X                 ; 4
    cmp    #$FF                  ; 2
    bne    LF599                 ; 2³
    lda    #2                    ; 2
    ora    $8A                   ; 3
    sta    $8A                   ; 3
    lda    #$20                  ; 2
    sta    $EB                   ; 3
    lda    #$12                  ; 2
    sta    $C1                   ; 3
    jmp    LF92F                 ; 3
LF599:
    lda    SWCHA                 ; 4
    ldx    INPT5                 ; 3
    ldy    $89                   ; 3
    bne    LF5A8                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    ldx    INPT4                 ; 3
LF5A8:
    and    #$0F                  ; 2
    sta    $FB                   ; 3
LF5AC:
    lda    $F2                   ; 3
    cmp    #$6B                  ; 2
    bne    LF5FE                 ; 2³
    lda    $F3                   ; 3
    cmp    #$22                  ; 2
    bcc    LF5F8                 ; 2³
    cmp    #$27                  ; 2
    bcs    LF5C6                 ; 2³
    ldy    #$24                  ; 2
    lda    $DE                   ; 3
    cmp    #$FF                  ; 2
    bne    LF5E8                 ; 2³
    beq    LF5F8                 ; 2³
LF5C6:
    cmp    #$4E                  ; 2
    bcc    LF5F8                 ; 2³
    cmp    #$53                  ; 2
    bcs    LF5D8                 ; 2³
    ldy    #$50                  ; 2
    lda    $DF                   ; 3
    cmp    #$FF                  ; 2
    bne    LF5E8                 ; 2³
    beq    LF5F8                 ; 2³
LF5D8:
    cmp    #$7A                  ; 2
    bcc    LF5F8                 ; 2³
    cmp    #$7F                  ; 2
    bcs    LF5F8                 ; 2³
    ldy    #$7C                  ; 2
    lda    $E0                   ; 3
    cmp    #$FF                  ; 2
    beq    LF5F8                 ; 2³
LF5E8:
    lda    $FB                   ; 3
    lsr                          ; 2
    bcs    LF605                 ; 2³+1
    dec    $F2                   ; 5
    lda    #1                    ; 2
    sta    $B4                   ; 3
    sty    $F3                   ; 3
    jmp    LF640                 ; 3
LF5F8:
    lda    #1                    ; 2
    ora    $FB                   ; 3
    sta    $FB                   ; 3
LF5FE:
    lda    $FB                   ; 3
    lsr                          ; 2
    bcs    LF605                 ; 2³
    dec    $F2                   ; 5
LF605:
    lsr                          ; 2
    bcs    LF60A                 ; 2³
    inc    $F2                   ; 5
LF60A:
    lsr                          ; 2
    bcs    LF60F                 ; 2³
    dec    $F3                   ; 5
LF60F:
    lsr                          ; 2
    bcs    LF614                 ; 2³
    inc    $F3                   ; 5
LF614:
    lda    $F3                   ; 3
    cmp    #$12                  ; 2
    bne    LF61C                 ; 2³
    inc    $F3                   ; 5
LF61C:
    cmp    #$90                  ; 2
    bne    LF622                 ; 2³
    dec    $F3                   ; 5
LF622:
    lda    $F2                   ; 3
    cmp    #$92                  ; 2
    bne    LF62A                 ; 2³
    dec    $F2                   ; 5
LF62A:
    txa                          ; 2
    bmi    LF640                 ; 2³
    lda    $FA                   ; 3
    beq    LF640                 ; 2³
    dec    $D2                   ; 5
    bne    LF63B                 ; 2³
    lda    #$70                  ; 2
    sta    $D2                   ; 3
    dec    $FA                   ; 5
LF63B:
    ldx    #$FF                  ; 2
    jmp    LF5AC                 ; 3
LF640:
    sta    CXCLR                 ; 3
    lda    $F5                   ; 3
    jsr    LFC41                 ; 6
    stx    $B5                   ; 3
    sta    $B6                   ; 3
    jmp    LFADD                 ; 3
LF64E:
    lda    $8A                   ; 3
    and    #$02                  ; 2
    beq    LF657                 ; 2³
    jmp    LFADD                 ; 3
LF657:
    ldx    #$3E                  ; 2
    lda    $F5                   ; 3
LF65B:
    cmp    LFCDF,X               ; 4
    beq    LF668                 ; 2³
    dex                          ; 2
LF661:
    dex                          ; 2
    dex                          ; 2
    bpl    LF65B                 ; 2³
    jmp    LF6B1                 ; 3
LF668:
    dex                          ; 2
    lda    $F4                   ; 3
    cmp    LFCDF,X               ; 4
    beq    LF674                 ; 2³
    lda    $F5                   ; 3
    bne    LF661                 ; 2³
LF674:
    dex                          ; 2
    lda    $F1                   ; 3
    sta    $FB                   ; 3
    and    #$03                  ; 2
    tay                          ; 2
    lda    $F4                   ; 3
    sta    $FC                   ; 3
    lda    LFD83,Y               ; 4
    sta    $B8                   ; 3
LF685:
    ldy    #1                    ; 2
    lda    $FB                   ; 3
    cmp    $FC                   ; 3
    bcs    LF69B                 ; 2³
LF68D:
    lda    #3                    ; 2
    and    $B8                   ; 3
    and    LFCDF,X               ; 4
    bne    LF6AF                 ; 2³
    dey                          ; 2
    bpl    LF69B                 ; 2³
    bmi    LF6A7                 ; 2³
LF69B:
    lda    #$0C                  ; 2
    and    $B8                   ; 3
    and    LFCDF,X               ; 4
    bne    LF6AF                 ; 2³
    dey                          ; 2
    bpl    LF68D                 ; 2³
LF6A7:
    lda    #$0F                  ; 2
    eor    $B8                   ; 3
    sta    $B8                   ; 3
    bne    LF685                 ; 2³
LF6AF:
    sta    $B7                   ; 3
LF6B1:
    lda    $B7                   ; 3
    lsr                          ; 2
    bcc    LF6BA                 ; 2³
    dec    $F4                   ; 5
    bne    LF6CA                 ; 2³
LF6BA:
    lsr                          ; 2
    bcc    LF6C1                 ; 2³
    inc    $F4                   ; 5
    bne    LF6CA                 ; 2³
LF6C1:
    lsr                          ; 2
    bcc    LF6C8                 ; 2³
    dec    $F5                   ; 5
    bne    LF6CA                 ; 2³
LF6C8:
    inc    $F5                   ; 5
LF6CA:
    dec    $E7                   ; 5
    bpl    LF707                 ; 2³+1
    lda    #2                    ; 2
    sta    $E7                   ; 3
    lda    $DD                   ; 3
    and    #$40                  ; 2
    beq    LF707                 ; 2³+1
    lda    $AA                   ; 3
    cmp    #$93                  ; 2
    bcc    LF707                 ; 2³+1
    cmp    #$9E                  ; 2
    beq    LF6E6                 ; 2³
    lda    #$9E                  ; 2
    bne    LF6E8                 ; 2³
LF6E6:
    lda    #$A9                  ; 2
LF6E8:
    sta    $AA                   ; 3
    lda    $F2                   ; 3
    cmp    #$68                  ; 2
    bcc    LF707                 ; 2³+1
    lda    SWCHA                 ; 4
    ldx    #$F0                  ; 2
    ldy    $89                   ; 3
    beq    LF6FB                 ; 2³
    ldx    #$0F                  ; 2
LF6FB:
    stx    $FB                   ; 3
    and    $FB                   ; 3
    cmp    $FB                   ; 3
    bne    LF707                 ; 2³
    lda    #$93                  ; 2
    sta    $AA                   ; 3
LF707:
    lda    #$7F                  ; 2
    and    $8A                   ; 3
    sta    $8A                   ; 3
    lda    $F3                   ; 3
    jsr    LFC41                 ; 6
    stx    $B2                   ; 3
    sta    $B3                   ; 3
    jmp    LFADD                 ; 3
LF719:
    lda    SWCHA                 ; 4
    ldx    INPT5                 ; 3
    ldy    $89                   ; 3
    bne    LF728                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    ldx    INPT4                 ; 3
LF728:
    and    #$0F                  ; 2
    sta    $FB                   ; 3
    sta    $E6                   ; 3
    stx    $FC                   ; 3
LF730:
    ldx    #$50                  ; 2
LF732:
    lda    $F3                   ; 3
LF734:
    cmp    LFD1E,X               ; 4
    beq    LF740                 ; 2³
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
    bpl    LF734                 ; 2³
    bmi    LF74C                 ; 2³
LF740:
    dex                          ; 2
    lda    $F2                   ; 3
    cmp    LFD1E,X               ; 4
    beq    LF77C                 ; 2³
    dex                          ; 2
    dex                          ; 2
    bpl    LF732                 ; 2³
LF74C:
    lda    $E6                   ; 3
    bpl    LF753                 ; 2³
    jmp    LF872                 ; 3
LF753:
    lda    $B4                   ; 3
    lsr                          ; 2
    bcc    LF75C                 ; 2³
    lda    #2                    ; 2
    bne    LF772                 ; 2³
LF75C:
    lsr                          ; 2
    bcc    LF763                 ; 2³
    lda    #1                    ; 2
    bne    LF772                 ; 2³
LF763:
    lsr                          ; 2
    bcc    LF76A                 ; 2³
    lda    #8                    ; 2
    bne    LF772                 ; 2³
LF76A:
    lsr                          ; 2
    bcs    LF770                 ; 2³
    jmp    LF872                 ; 3
LF770:
    lda    #4                    ; 2
LF772:
    tay                          ; 2
    and    $FB                   ; 3
    bne    LF779                 ; 2³
    sty    $B4                   ; 3
LF779:
    jmp    LF872                 ; 3
LF77C:
    dex                          ; 2
    lda    $B4                   ; 3
    lsr                          ; 2
    bcc    LF7BB                 ; 2³
    lda    $FB                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    bcc    LF7A5                 ; 2³
    lsr                          ; 2
    bcc    LF7B0                 ; 2³
LF78C:
    lda    $FB                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    bcs    LF797                 ; 2³
    ldy    #2                    ; 2
    jmp    LF870                 ; 3
LF797:
    lda    #1                    ; 2
    tay                          ; 2
    and    LFD1E,X               ; 4
    bne    LF7A2                 ; 2³
    jmp    LF891                 ; 3
LF7A2:
    jmp    LF870                 ; 3
LF7A5:
    lda    #4                    ; 2
    and    LFD1E,X               ; 4
    beq    LF78C                 ; 2³
    tay                          ; 2
    jmp    LF870                 ; 3
LF7B0:
    lda    #8                    ; 2
    and    LFD1E,X               ; 4
    beq    LF78C                 ; 2³
    tay                          ; 2
    jmp    LF870                 ; 3
LF7BB:
    lsr                          ; 2
    bcc    LF7F6                 ; 2³
    lda    $FB                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    bcc    LF7E0                 ; 2³
    lsr                          ; 2
    bcc    LF7EB                 ; 2³
LF7C8:
    lda    $FB                   ; 3
    lsr                          ; 2
    bcs    LF7D2                 ; 2³
    ldy    #1                    ; 2
    jmp    LF870                 ; 3
LF7D2:
    lda    #2                    ; 2
    tay                          ; 2
    and    LFD1E,X               ; 4
    bne    LF7DD                 ; 2³
    jmp    LF891                 ; 3
LF7DD:
    jmp    LF870                 ; 3
LF7E0:
    lda    #4                    ; 2
    and    LFD1E,X               ; 4
    beq    LF7C8                 ; 2³
    tay                          ; 2
    jmp    LF870                 ; 3
LF7EB:
    lda    #8                    ; 2
    and    LFD1E,X               ; 4
    beq    LF7C8                 ; 2³
    tay                          ; 2
    jmp    LF870                 ; 3
LF7F6:
    lsr                          ; 2
    bcc    LF832                 ; 2³+1
    lda    $FB                   ; 3
    lsr                          ; 2
    bcc    LF81C                 ; 2³+1
    lsr                          ; 2
    bcc    LF827                 ; 2³
LF801:
    lda    $FB                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    bcs    LF80E                 ; 2³
    ldy    #8                    ; 2
    jmp    LF870                 ; 3
LF80E:
    lda    #4                    ; 2
    tay                          ; 2
    and    LFD1E,X               ; 4
    bne    LF819                 ; 2³
    jmp    LF891                 ; 3
LF819:
    jmp    LF870                 ; 3
LF81C:
    lda    #1                    ; 2
    and    LFD1E,X               ; 4
    beq    LF801                 ; 2³
    tay                          ; 2
    jmp    LF870                 ; 3
LF827:
    lda    #2                    ; 2
    and    LFD1E,X               ; 4
    beq    LF801                 ; 2³
    tay                          ; 2
    jmp    LF870                 ; 3
LF832:
    lsr                          ; 2
    bcs    LF838                 ; 2³
    jmp    LF891                 ; 3
LF838:
    lda    $FB                   ; 3
    lsr                          ; 2
    bcc    LF85A                 ; 2³
    lsr                          ; 2
    bcc    LF865                 ; 2³
LF840:
    lda    $FB                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    bcs    LF84C                 ; 2³
    ldy    #4                    ; 2
    jmp    LF870                 ; 3
LF84C:
    lda    #8                    ; 2
    tay                          ; 2
    and    LFD1E,X               ; 4
    bne    LF857                 ; 2³
    jmp    LF891                 ; 3
LF857:
    jmp    LF870                 ; 3
LF85A:
    lda    #1                    ; 2
    and    LFD1E,X               ; 4
    beq    LF840                 ; 2³
    tay                          ; 2
    jmp    LF870                 ; 3
LF865:
    lda    #2                    ; 2
    and    LFD1E,X               ; 4
    beq    LF840                 ; 2³
    tay                          ; 2
    jmp    LF870                 ; 3
LF870:
    sty    $B4                   ; 3
LF872:
    lda    $B4                   ; 3
    lsr                          ; 2
    bcc    LF87C                 ; 2³
    dec    $F2                   ; 5
    jmp    LF891                 ; 3
LF87C:
    lsr                          ; 2
    bcc    LF884                 ; 2³
    inc    $F2                   ; 5
    jmp    LF891                 ; 3
LF884:
    lsr                          ; 2
    bcc    LF88C                 ; 2³
    dec    $F3                   ; 5
    jmp    LF891                 ; 3
LF88C:
    lsr                          ; 2
    bcc    LF891                 ; 2³
    inc    $F3                   ; 5
LF891:
    lda    $8A                   ; 3
    and    #$20                  ; 2
    beq    LF898                 ; 2³
    rts                          ; 6

LF898:
    lda    $F2                   ; 3
    cmp    #$5D                  ; 2
    bcc    LF8B6                 ; 2³
    ldx    #2                    ; 2
    lda    $F3                   ; 3
LF8A2:
    cmp    LFCD2,X               ; 4
    beq    LF8AC                 ; 2³
    dex                          ; 2
    bpl    LF8A2                 ; 2³
    bmi    LF8B2                 ; 2³
LF8AC:
    ldy    $DE,X                 ; 4
    cpy    #$FF                  ; 2
    bne    LF8B6                 ; 2³
LF8B2:
    lda    #$5C                  ; 2
    sta    $F2                   ; 3
LF8B6:
    lda    $FC                   ; 3
    bmi    LF8D1                 ; 2³
    lda    $FA                   ; 3
    beq    LF8D1                 ; 2³
    dec    $D2                   ; 5
    bne    LF8C8                 ; 2³
    lda    #$70                  ; 2
    sta    $D2                   ; 3
    dec    $FA                   ; 5
LF8C8:
    lda    #$FF                  ; 2
    sta    $FC                   ; 3
    sta    $E6                   ; 3
    jmp    LF730                 ; 3
LF8D1:
    jmp    LF640                 ; 3
LF8D4:
    lda    $8A                   ; 3
    beq    LF8ED                 ; 2³
    ldy    #0                    ; 2
    lda    ($96),Y               ; 5
    beq    LF8E7                 ; 2³
    lda    $DD                   ; 3
    and    #$40                  ; 2
    beq    LF8ED                 ; 2³
    jmp    LFADD                 ; 3
LF8E7:
    sta    $8A                   ; 3
    ldx    #$CF                  ; 2
    stx    $96                   ; 3
LF8ED:
    lda    #1                    ; 2
    eor    $E5                   ; 3
    sta    $E5                   ; 3
    beq    LF8F8                 ; 2³
    jmp    LFADD                 ; 3
LF8F8:
    dec    $F2                   ; 5
    beq    LF8FF                 ; 2³
    jmp    LFADD                 ; 3
LF8FF:
    lda    $E1                   ; 3
    bne    LF911                 ; 2³
    lda    $DD                   ; 3
    bpl    LF90B                 ; 2³
    lda    $E2                   ; 3
    bne    LF911                 ; 2³
LF90B:
    lda    $DD                   ; 3
    and    #$BF                  ; 2
    sta    $DD                   ; 3
LF911:
    lda    #0                    ; 2
    sta    $88                   ; 3
    jsr    LF0ED                 ; 6
    ldx    $89                   ; 3
    beq    LF92C                 ; 2³
    lda    $DD                   ; 3
    and    #$04                  ; 2
    beq    LF92C                 ; 2³
    lda    #$40                  ; 2
    sta    $8A                   ; 3
    lda    #$FB                  ; 2
    and    $DD                   ; 3
    sta    $DD                   ; 3
LF92C:
    jmp    LF289                 ; 3
LF92F:
    ldx    $F0                   ; 3
    beq    LF936                 ; 2³
    jmp    LF9E4                 ; 3
LF936:
    ldy    $C1                   ; 3
    beq    LF940                 ; 2³
    dey                          ; 2
    sty    $C1                   ; 3
    jmp    LF9E4                 ; 3
LF940:
    lda    SWCHA                 ; 4
    ldx    INPT5                 ; 3
    ldy    $89                   ; 3
    bne    LF94F                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    ldx    INPT4                 ; 3
LF94F:
    and    #$0F                  ; 2
    sta    $FB                   ; 3
    stx    $FC                   ; 3
    and    #$01                  ; 2
    bne    LF972                 ; 2³
    dec    $EB                   ; 5
    bne    LF972                 ; 2³
    lda    #$20                  ; 2
    sta    $EB                   ; 3
    lda    $F6                   ; 3
    cmp    #$A9                  ; 2
    bne    LF972                 ; 2³
    lda    $E9                   ; 3
    cmp    #$A1                  ; 2
    beq    LF972                 ; 2³
    clc                          ; 2
    adc    #$18                  ; 2
    sta    $E9                   ; 3
LF972:
    lda    $FB                   ; 3
    and    #$08                  ; 2
    bne    LF98A                 ; 2³
    lda    #$6B                  ; 2
    cmp    $F9                   ; 3
    beq    LF9A0                 ; 2³
    inc    $F9                   ; 5
    lda    $F6                   ; 3
    cmp    #$83                  ; 2
    bcc    LF9A0                 ; 2³
    inc    $F7                   ; 5
    bcs    LF9A0                 ; 2³
LF98A:
    lda    $FB                   ; 3
    and    #$04                  ; 2
    bne    LF9A0                 ; 2³
    lda    #$23                  ; 2
    cmp    $F9                   ; 3
    beq    LF9A0                 ; 2³
    dec    $F9                   ; 5
    lda    $F6                   ; 3
    cmp    #$83                  ; 2
    bcc    LF9A0                 ; 2³
    dec    $F7                   ; 5
LF9A0:
    lda    $8A                   ; 3
    and    #$08                  ; 2
    bne    LF9B4                 ; 2³
    ldx    $FC                   ; 3
    bmi    LF9E4                 ; 2³
    lda    $8A                   ; 3
    ora    #$08                  ; 2
    sta    $8A                   ; 3
    lda    #$ED                  ; 2
    sta    $96                   ; 3
LF9B4:
    ldy    #0                    ; 2
    lda    #$41                  ; 2
LF9B8:
    cmp    $E9                   ; 3
    beq    LF9C2                 ; 2³
    clc                          ; 2
    adc    #$18                  ; 2
    iny                          ; 2
    bne    LF9B8                 ; 2³
LF9C2:
    dec    $F6                   ; 5
    beq    LF9CB                 ; 2³
    dey                          ; 2
    bpl    LF9C2                 ; 2³
    bmi    LF9E4                 ; 2³
LF9CB:
    lda    #$A9                  ; 2
    sta    $F6                   ; 3
    clc                          ; 2
    lda    $F9                   ; 3
    adc    #5                    ; 2
    sta    $F7                   ; 3
    lda    #$F7                  ; 2
    and    $8A                   ; 3
    sta    $8A                   ; 3
    lda    #$41                  ; 2
    sta    $E9                   ; 3
    lda    #$20                  ; 2
    sta    $EB                   ; 3
LF9E4:
    clc                          ; 2
    lda    $F6                   ; 3
    adc    #7                    ; 2
    sta    $BC                   ; 3
    lda    $F9                   ; 3
    jsr    LFC41                 ; 6
    stx    $B9                   ; 3
    sta    $BA                   ; 3
    lda    $F7                   ; 3
    jsr    LFC41                 ; 6
    stx    $BD                   ; 3
    sta    $BE                   ; 3
    lda    $F0                   ; 3
    beq    LFA04                 ; 2³
    jmp    LFAEF                 ; 3
LFA04:
    jmp    LFADD                 ; 3
LFA07:
    ldx    $89                   ; 3
    lda    #$FF                  ; 2
    sta    $8B,X                 ; 4
    lda    $C0                   ; 3
    beq    LFA14                 ; 2³
    jmp    LFADD                 ; 3
LFA14:
    dec    $F8                   ; 5
    dec    $F1                   ; 5
    lda    #$55                  ; 2
    cmp    $F1                   ; 3
    beq    LFA21                 ; 2³
    jmp    LFADD                 ; 3
LFA21:
    lda    #$20                  ; 2
    sta    $8A                   ; 3
    lda    #$24                  ; 2
    sta    $AA                   ; 3
    lda    #$FC                  ; 2
    sta    $A9                   ; 3
    lda    #$CF                  ; 2
    sta    $AC                   ; 3
    lda    #$FF                  ; 2
    sta    $E4                   ; 3
    ldy    #2                    ; 2
    ldx    $89                   ; 3
    lda    $86,X                 ; 4
    cmp    #2                    ; 2
    bcs    LFA40                 ; 2³
    tay                          ; 2
LFA40:
    lda    LFC53,Y               ; 4
    sta    $E6                   ; 3
LFA45:
    clc                          ; 2
    lda    #$0A                  ; 2
    adc    $AA                   ; 3
    cmp    $E6                   ; 3
    bne    LFA6D                 ; 2³
    lda    #0                    ; 2
    sta    $A9                   ; 3
    sta    $8A                   ; 3
    lda    $AA                   ; 3
    ldx    $89                   ; 3
    sta    $C2,X                 ; 4
    lda    #$93                  ; 2
    sta    $AA                   ; 3
    lda    #$C4                  ; 2
    sta    $AC                   ; 3
    lda    #$80                  ; 2
    sta    $F2                   ; 3
    lda    #$57                  ; 2
    sta    $F3                   ; 3
    jmp    LF707                 ; 3
LFA6D:
    sta    $AA                   ; 3
    ldx    $89                   ; 3
    asl    $8B,X                 ; 6
    ldx    #1                    ; 2
    stx    $B4                   ; 3
    lda    #$50                  ; 2
    sta    $F3                   ; 3
    ldx    $E4                   ; 3
    inx                          ; 2
    stx    $E4                   ; 3
    lda    LFC60,X               ; 4
    sta    $F2                   ; 3
    ldy    #$FF                  ; 2
LFA87:
    iny                          ; 2
    lda.wy $C5,Y                 ; 4
    ldx    $89                   ; 3
    bne    LFA93                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
LFA93:
    and    #$0F                  ; 2
    cmp    $E4                   ; 3
    bne    LFA87                 ; 2³
    lda    LFC56,Y               ; 4
    sta    $A8                   ; 3
    jmp    LF707                 ; 3
LFAA1:
    ldx    #$A0                  ; 2
    dec    $F8                   ; 5
    bne    LFAA9                 ; 2³
    stx    $F8                   ; 3
LFAA9:
    dec    $F1                   ; 5
    bne    LFAAF                 ; 2³
    stx    $F1                   ; 3
LFAAF:
    ldx    #2                    ; 2
    ldy    #0                    ; 2
LFAB3:
    lda    $F2                   ; 3
    cmp    ($A8),Y               ; 5
    beq    LFAC2                 ; 2³
LFAB9:
    jsr    LF872                 ; 6
    dex                          ; 2
    bpl    LFAB3                 ; 2³
    jmp    LF707                 ; 3
LFAC2:
    inc    $A8                   ; 5
    lda    $F3                   ; 3
    cmp    ($A8),Y               ; 5
    beq    LFACE                 ; 2³
    dec    $A8                   ; 5
    bne    LFAB9                 ; 2³
LFACE:
    inc    $A8                   ; 5
    lda    ($A8),Y               ; 5
    bne    LFAD7                 ; 2³
    jmp    LFA45                 ; 3
LFAD7:
    sta    $B4                   ; 3
    inc    $A8                   ; 5
    bne    LFAB9                 ; 2³
LFADD:
    lda    $F8                   ; 3
    jsr    LFC41                 ; 6
    stx    $AE                   ; 3
    sta    $AF                   ; 3
    lda    $F1                   ; 3
    jsr    LFC41                 ; 6
    stx    $B0                   ; 3
    sta    $B1                   ; 3
LFAEF:
    lda    $DD                   ; 3
    and    #$40                  ; 2
    bne    LFAFB                 ; 2³
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    beq    LFB6F                 ; 2³+1
LFAFB:
    ldy    #0                    ; 2
    ldx    #8                    ; 2
    lda    ($96),Y               ; 5
    beq    LFB05                 ; 2³
    ldx    #0                    ; 2
LFB05:
    stx    AUDV0                 ; 3
    dec    $90                   ; 5
    bpl    LFB2C                 ; 2³
    lda    #6                    ; 2
    sta    $90                   ; 3
    dec    $92                   ; 5
    bpl    LFB2C                 ; 2³
    inc    $94                   ; 5
    lda    ($94),Y               ; 5
    bne    LFB1F                 ; 2³
    lda    #$90                  ; 2
    sta    $94                   ; 3
    lda    ($94),Y               ; 5
LFB1F:
    tax                          ; 2
    and    #$1F                  ; 2
    sta    AUDF0                 ; 3
    txa                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $92                   ; 3
LFB2C:
    lda    ($96),Y               ; 5
    bne    LFB3C                 ; 2³
    sta    AUDV1                 ; 3
    lda    $8D                   ; 3
    beq    LFB6F                 ; 2³
    lda    #$F1                  ; 2
    sta    $96                   ; 3
    lda    ($96),Y               ; 5
LFB3C:
    ldx    #$0F                  ; 2
    stx    AUDV1                 ; 3
    cmp    #$FF                  ; 2
    beq    LFB52                 ; 2³
    dec    $91                   ; 5
    bpl    LFB6F                 ; 2³
    lda    #6                    ; 2
    sta    $91                   ; 3
    dec    $93                   ; 5
    bpl    LFB6F                 ; 2³
    bmi    LFB5C                 ; 2³
LFB52:
    inc    $96                   ; 5
    lda    ($96),Y               ; 5
    sta    AUDC1                 ; 3
    lda    #6                    ; 2
    sta    $91                   ; 3
LFB5C:
    inc    $96                   ; 5
    lda    ($96),Y               ; 5
    beq    LFB2C                 ; 2³
    tax                          ; 2
    and    #$1F                  ; 2
    sta    AUDF1                 ; 3
    txa                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    $93                   ; 3
LFB6F:
    lda    INTIM                 ; 4
    bne    LFB6F                 ; 2³
    sta    WSYNC                 ; 3
    sta    VBLANK                ; 3
    lda    #3                    ; 2
    sta    $FB                   ; 3
    lda    #$D0                  ; 2
    sta    $FC                   ; 3
    jmp    LFFF2                 ; 3
    sta    WSYNC                 ; 3
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    lda    #1                    ; 2
    sta    NUSIZ1                ; 3
    lda    #$F0                  ; 2
    sta    HMP0                  ; 3
    lda    #0                    ; 2
    sta    HMP1                  ; 3
    lda    ($FB,X)               ; 6
    jsr    LFC51                 ; 6
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    ldx    #SCANLINES_UNK        ; 2
LFBA4:
    sta    WSYNC                 ; 3
    dex                          ; 2
    bpl    LFBA4                 ; 2³
    ldy    #Y_OFFSET_UNK         ; 2
    lda    LFE00,Y               ; 4
LFBAE:
    sta    WSYNC                 ; 3
    sta    GRP0                  ; 3
    lda    LFE43,Y               ; 4
    sta    GRP1                  ; 3
    lda    LFF85,Y               ; 4
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    LFF43,Y               ; 4
    sta    $FB                   ; 3
    lda    LFE86,Y               ; 4
    ldx    LFF00,Y               ; 4
    sty    $FC                   ; 3
    ldy    $FB                   ; 3
    nop                          ; 2
    sta    GRP0                  ; 3
    stx    GRP1                  ; 3
    sty    GRP0                  ; 3
    ldy    $FC                   ; 3
    dey                          ; 2
    bmi    LFBDF                 ; 2³
    lda    LFE00,Y               ; 4
    jmp    LFBAE                 ; 3
LFBDF:
    sta    WSYNC                 ; 3
    lda    #$FF                  ; 2
    cmp    $8E                   ; 3
    beq    LFBEF                 ; 2³
    cmp    $8F                   ; 3
    beq    LFBEF                 ; 2³
    ldx    #$59                  ; 2
    bne    LFC16                 ; 2³+1
LFBEF:
    sta    WSYNC                 ; 3
    ldx    #8                    ; 2
LFBF3:
    dex                          ; 2
    bpl    LFBF3                 ; 2³
    sta    RESP0                 ; 3
    lda    #$70                  ; 2
    sta    HMP0                  ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    #$0E                  ; 2
    sta    COLUP0                ; 3
    lda    #0                    ; 2
    sta    NUSIZ0                ; 3
    ldx    #8                    ; 2
LFC0A:
    sta    WSYNC                 ; 3
    lda    LFD87,X               ; 4
    sta    GRP0                  ; 3
    dex                          ; 2
    bpl    LFC0A                 ; 2³
    ldx    #$4E                  ; 2
LFC16:
    lda    #$6C                  ; 2
    sta    $FB                   ; 3
    lda    #$D9                  ; 2
    sta    $FC                   ; 3
    jmp    LFFF2                 ; 3
LFC21:
    sed                          ; 2
    ldx    $89                   ; 3
    beq    LFC27                 ; 2³
    inx                          ; 2
LFC27:
    clc                          ; 2
    adc    $80,X                 ; 4
    sta    $80,X                 ; 4
    inx                          ; 2
    lda    #0                    ; 2
    adc    $FB                   ; 3
    adc    $80,X                 ; 4
    sta    $80,X                 ; 4
    lda    #0                    ; 2
    rol                          ; 2
    asl                          ; 2
    ldx    $89                   ; 3
    eor    $84,X                 ; 4
    sta    $84,X                 ; 4
    cld                          ; 2
    rts                          ; 6

LFC41:
    ldx    #$FF                  ; 2
    sec                          ; 2
LFC44:
    sbc    #$0F                  ; 2
    inx                          ; 2
    bcs    LFC44                 ; 2³
    adc    #$0F                  ; 2
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
LFC51:
    rts                          ; 6

    .byte $FF ; |XXXXXXXX| $FC52
LFC53:
    .byte $4C ; | X  XX  | $FC53
    .byte $60 ; | XX     | $FC54
    .byte $7E ; | XXXXXX | $FC55
LFC56:
    .byte $68 ; | XX X   | $FC56
    .byte $74 ; | XXX X  | $FC57
    .byte $83 ; |X     XX| $FC58
    .byte $8F ; |X   XXXX| $FC59
    .byte $9B ; |X  XX XX| $FC5A
    .byte $9E ; |X  XXXX | $FC5B
    .byte $AA ; |X X X X | $FC5C
    .byte $B6 ; |X XX XX | $FC5D
    .byte $C2 ; |XX    X | $FC5E
    .byte $C8 ; |XX  X   | $FC5F
LFC60:
    .byte $6D ; | XX XX X| $FC60
    .byte $72 ; | XXX  X | $FC61
    .byte $77 ; | XXX XXX| $FC62
    .byte $7C ; | XXXXX  | $FC63
    .byte $81 ; |X      X| $FC64
    .byte $86 ; |X    XX | $FC65
    .byte $8B ; |X   X XX| $FC66
    .byte $90 ; |X  X    | $FC67
    .byte $36 ; |  XX XX | $FC68
    .byte $50 ; | X X    | $FC69
    .byte $04 ; |     X  | $FC6A
    .byte $36 ; |  XX XX | $FC6B
    .byte $38 ; |  XXX   | $FC6C
    .byte $01 ; |       X| $FC6D
    .byte $04 ; |     X  | $FC6E
    .byte $38 ; |  XXX   | $FC6F
    .byte $04 ; |     X  | $FC70
    .byte $04 ; |     X  | $FC71
    .byte $30 ; |  XX    | $FC72
    .byte $00 ; |        | $FC73
    .byte $36 ; |  XX XX | $FC74
    .byte $50 ; | X X    | $FC75
    .byte $04 ; |     X  | $FC76
    .byte $36 ; |  XX XX | $FC77
    .byte $38 ; |  XXX   | $FC78
    .byte $01 ; |       X| $FC79
    .byte $14 ; |   X X  | $FC7A
    .byte $38 ; |  XXX   | $FC7B
    .byte $08 ; |    X   | $FC7C
    .byte $14 ; |   X X  | $FC7D
    .byte $50 ; | X X    | $FC7E
    .byte $01 ; |       X| $FC7F
    .byte $04 ; |     X  | $FC80
    .byte $50 ; | X X    | $FC81
    .byte $00 ; |        | $FC82
    .byte $36 ; |  XX XX | $FC83
    .byte $50 ; | X X    | $FC84
    .byte $08 ; |    X   | $FC85
    .byte $36 ; |  XX XX | $FC86
    .byte $68 ; | XX X   | $FC87
    .byte $01 ; |       X| $FC88
    .byte $04 ; |     X  | $FC89
    .byte $68 ; | XX X   | $FC8A
    .byte $08 ; |    X   | $FC8B
    .byte $04 ; |     X  | $FC8C
    .byte $70 ; | XXX    | $FC8D
    .byte $00 ; |        | $FC8E
    .byte $36 ; |  XX XX | $FC8F
    .byte $50 ; | X X    | $FC90
    .byte $04 ; |     X  | $FC91
    .byte $36 ; |  XX XX | $FC92
    .byte $38 ; |  XXX   | $FC93
    .byte $01 ; |       X| $FC94
    .byte $26 ; |  X  XX | $FC95
    .byte $38 ; |  XXX   | $FC96
    .byte $08 ; |    X   | $FC97
    .byte $26 ; |  X  XX | $FC98
    .byte $40 ; | X      | $FC99
    .byte $00 ; |        | $FC9A
    .byte $26 ; |  X  XX | $FC9B
    .byte $50 ; | X X    | $FC9C
    .byte $00 ; |        | $FC9D
    .byte $36 ; |  XX XX | $FC9E
    .byte $50 ; | X X    | $FC9F
    .byte $08 ; |    X   | $FCA0
    .byte $36 ; |  XX XX | $FCA1
    .byte $68 ; | XX X   | $FCA2
    .byte $01 ; |       X| $FCA3
    .byte $26 ; |  X  XX | $FCA4
    .byte $68 ; | XX X   | $FCA5
    .byte $04 ; |     X  | $FCA6
    .byte $26 ; |  X  XX | $FCA7
    .byte $60 ; | XX     | $FCA8
    .byte $00 ; |        | $FCA9
    .byte $36 ; |  XX XX | $FCAA
    .byte $50 ; | X X    | $FCAB
    .byte $04 ; |     X  | $FCAC
    .byte $36 ; |  XX XX | $FCAD
    .byte $38 ; |  XXX   | $FCAE
    .byte $02 ; |      X | $FCAF
    .byte $49 ; | X  X  X| $FCB0
    .byte $38 ; |  XXX   | $FCB1
    .byte $08 ; |    X   | $FCB2
    .byte $49 ; | X  X  X| $FCB3
    .byte $40 ; | X      | $FCB4
    .byte $00 ; |        | $FCB5
    .byte $36 ; |  XX XX | $FCB6
    .byte $50 ; | X X    | $FCB7
    .byte $08 ; |    X   | $FCB8
    .byte $36 ; |  XX XX | $FCB9
    .byte $68 ; | XX X   | $FCBA
    .byte $02 ; |      X | $FCBB
    .byte $49 ; | X  X  X| $FCBC
    .byte $68 ; | XX X   | $FCBD
    .byte $04 ; |     X  | $FCBE
    .byte $49 ; | X  X  X| $FCBF
    .byte $60 ; | XX     | $FCC0
    .byte $00 ; |        | $FCC1
    .byte $5C ; | X XXX  | $FCC2
    .byte $50 ; | X X    | $FCC3
    .byte $04 ; |     X  | $FCC4
    .byte $5C ; | X XXX  | $FCC5
    .byte $30 ; |  XX    | $FCC6
    .byte $00 ; |        | $FCC7
    .byte $5C ; | X XXX  | $FCC8
    .byte $50 ; | X X    | $FCC9
    .byte $08 ; |    X   | $FCCA
    .byte $5C ; | X XXX  | $FCCB
    .byte $70 ; | XXX    | $FCCC
    .byte $00 ; |        | $FCCD
LFCCE:
    .byte $0F ; |    XXXX| $FCCE
    .byte $F0 ; |XXXX    | $FCCF
LFCD0:
    .byte $80 ; |X       | $FCD0
    .byte $08 ; |    X   | $FCD1
LFCD2:
    .byte $24 ; |  X  X  | $FCD2
    .byte $50 ; | X X    | $FCD3
    .byte $7C ; | XXXXX  | $FCD4
LFCD5:
    .byte $02 ; |      X | $FCD5
    .byte $04 ; |     X  | $FCD6
    .byte $06 ; |     XX | $FCD7
    .byte $08 ; |    X   | $FCD8
    .byte $10 ; |   X    | $FCD9
LFCDA:
    .byte $05 ; |     X X| $FCDA
    .byte $04 ; |     X  | $FCDB
    .byte $03 ; |      XX| $FCDC
    .byte $02 ; |      X | $FCDD
    .byte $01 ; |       X| $FCDE
LFCDF:
    .byte $0C ; |    XX  | $FCDF
    .byte $14 ; |   X X  | $FCE0
    .byte $50 ; | X X    | $FCE1
    .byte $0E ; |    XXX | $FCE2
    .byte $36 ; |  XX XX | $FCE3
    .byte $50 ; | X X    | $FCE4
    .byte $0D ; |    XX X| $FCE5
    .byte $5C ; | X XXX  | $FCE6
    .byte $50 ; | X X    | $FCE7
    .byte $0A ; |    X X | $FCE8
    .byte $26 ; |  X  XX | $FCE9
    .byte $24 ; |  X  X  | $FCEA
    .byte $0B ; |    X XX| $FCEB
    .byte $49 ; | X  X  X| $FCEC
    .byte $24 ; |  X  X  | $FCED
    .byte $01 ; |       X| $FCEE
    .byte $5C ; | X XXX  | $FCEF
    .byte $24 ; |  X  X  | $FCF0
    .byte $02 ; |      X | $FCF1
    .byte $04 ; |     X  | $FCF2
    .byte $38 ; |  XXX   | $FCF3
    .byte $0B ; |    X XX| $FCF4
    .byte $14 ; |   X X  | $FCF5
    .byte $38 ; |  XXX   | $FCF6
    .byte $07 ; |     XXX| $FCF7
    .byte $26 ; |  X  XX | $FCF8
    .byte $38 ; |  XXX   | $FCF9
    .byte $0B ; |    X XX| $FCFA
    .byte $36 ; |  XX XX | $FCFB
    .byte $38 ; |  XXX   | $FCFC
    .byte $05 ; |     X X| $FCFD
    .byte $49 ; | X  X  X| $FCFE
    .byte $38 ; |  XXX   | $FCFF
    .byte $08 ; |    X   | $FD00
    .byte $5C ; | X XXX  | $FD01
    .byte $38 ; |  XXX   | $FD02
    .byte $02 ; |      X | $FD03
    .byte $04 ; |     X  | $FD04
    .byte $68 ; | XX X   | $FD05
    .byte $07 ; |     XXX| $FD06
    .byte $14 ; |   X X  | $FD07
    .byte $68 ; | XX X   | $FD08
    .byte $0B ; |    X XX| $FD09
    .byte $26 ; |  X  XX | $FD0A
    .byte $68 ; | XX X   | $FD0B
    .byte $07 ; |     XXX| $FD0C
    .byte $36 ; |  XX XX | $FD0D
    .byte $68 ; | XX X   | $FD0E
    .byte $09 ; |    X  X| $FD0F
    .byte $49 ; | X  X  X| $FD10
    .byte $68 ; | XX X   | $FD11
    .byte $04 ; |     X  | $FD12
    .byte $5C ; | X XXX  | $FD13
    .byte $68 ; | XX X   | $FD14
    .byte $06 ; |     XX | $FD15
    .byte $26 ; |  X  XX | $FD16
    .byte $7C ; | XXXXX  | $FD17
    .byte $07 ; |     XXX| $FD18
    .byte $49 ; | X  X  X| $FD19
    .byte $7C ; | XXXXX  | $FD1A
    .byte $01 ; |       X| $FD1B
    .byte $5C ; | X XXX  | $FD1C
    .byte $7C ; | XXXXX  | $FD1D
LFD1E:
    .byte $08 ; |    X   | $FD1E
    .byte $04 ; |     X  | $FD1F
    .byte $30 ; |  XX    | $FD20
    .byte $02 ; |      X | $FD21
    .byte $04 ; |     X  | $FD22
    .byte $50 ; | X X    | $FD23
    .byte $04 ; |     X  | $FD24
    .byte $04 ; |     X  | $FD25
    .byte $70 ; | XXX    | $FD26
    .byte $04 ; |     X  | $FD27
    .byte $26 ; |  X  XX | $FD28
    .byte $40 ; | X      | $FD29
    .byte $02 ; |      X | $FD2A
    .byte $26 ; |  X  XX | $FD2B
    .byte $50 ; | X X    | $FD2C
    .byte $08 ; |    X   | $FD2D
    .byte $26 ; |  X  XX | $FD2E
    .byte $60 ; | XX     | $FD2F
    .byte $04 ; |     X  | $FD30
    .byte $49 ; | X  X  X| $FD31
    .byte $40 ; | X      | $FD32
    .byte $08 ; |    X   | $FD33
    .byte $49 ; | X  X  X| $FD34
    .byte $60 ; | XX     | $FD35
    .byte $08 ; |    X   | $FD36
    .byte $5C ; | X XXX  | $FD37
    .byte $30 ; |  XX    | $FD38
    .byte $04 ; |     X  | $FD39
    .byte $5C ; | X XXX  | $FD3A
    .byte $70 ; | XXX    | $FD3B
    .byte $0A ; |    X X | $FD3C
    .byte $26 ; |  X  XX | $FD3D
    .byte $24 ; |  X  X  | $FD3E
    .byte $0B ; |    X XX| $FD3F
    .byte $49 ; | X  X  X| $FD40
    .byte $24 ; |  X  X  | $FD41
    .byte $06 ; |     XX | $FD42
    .byte $04 ; |     X  | $FD43
    .byte $38 ; |  XXX   | $FD44
    .byte $0B ; |    X XX| $FD45
    .byte $14 ; |   X X  | $FD46
    .byte $38 ; |  XXX   | $FD47
    .byte $0F ; |    XXXX| $FD48
    .byte $26 ; |  X  XX | $FD49
    .byte $38 ; |  XXX   | $FD4A
    .byte $0B ; |    X XX| $FD4B
    .byte $36 ; |  XX XX | $FD4C
    .byte $38 ; |  XXX   | $FD4D
    .byte $0D ; |    XX X| $FD4E
    .byte $49 ; | X  X  X| $FD4F
    .byte $38 ; |  XXX   | $FD50
    .byte $0D ; |    XX X| $FD51
    .byte $14 ; |   X X  | $FD52
    .byte $50 ; | X X    | $FD53
    .byte $0F ; |    XXXX| $FD54
    .byte $36 ; |  XX XX | $FD55
    .byte $50 ; | X X    | $FD56
    .byte $0F ; |    XXXX| $FD57
    .byte $5C ; | X XXX  | $FD58
    .byte $50 ; | X X    | $FD59
    .byte $0A ; |    X X | $FD5A
    .byte $04 ; |     X  | $FD5B
    .byte $68 ; | XX X   | $FD5C
    .byte $07 ; |     XXX| $FD5D
    .byte $14 ; |   X X  | $FD5E
    .byte $68 ; | XX X   | $FD5F
    .byte $0F ; |    XXXX| $FD60
    .byte $26 ; |  X  XX | $FD61
    .byte $68 ; | XX X   | $FD62
    .byte $07 ; |     XXX| $FD63
    .byte $36 ; |  XX XX | $FD64
    .byte $68 ; | XX X   | $FD65
    .byte $0D ; |    XX X| $FD66
    .byte $49 ; | X  X  X| $FD67
    .byte $68 ; | XX X   | $FD68
    .byte $06 ; |     XX | $FD69
    .byte $26 ; |  X  XX | $FD6A
    .byte $7C ; | XXXXX  | $FD6B
    .byte $07 ; |     XXX| $FD6C
    .byte $49 ; | X  X  X| $FD6D
    .byte $7C ; | XXXXX  | $FD6E
LFD6F:
    .byte $04 ; |     X  | $FD6F
    .byte $30 ; |  XX    | $FD70
    .byte $04 ; |     X  | $FD71
    .byte $50 ; | X X    | $FD72
    .byte $04 ; |     X  | $FD73
    .byte $70 ; | XXX    | $FD74
    .byte $26 ; |  X  XX | $FD75
    .byte $40 ; | X      | $FD76
    .byte $26 ; |  X  XX | $FD77
    .byte $50 ; | X X    | $FD78
    .byte $26 ; |  X  XX | $FD79
    .byte $60 ; | XX     | $FD7A
    .byte $49 ; | X  X  X| $FD7B
    .byte $40 ; | X      | $FD7C
    .byte $49 ; | X  X  X| $FD7D
    .byte $60 ; | XX     | $FD7E
    .byte $5C ; | X XXX  | $FD7F
    .byte $30 ; |  XX    | $FD80
    .byte $5C ; | X XXX  | $FD81
    .byte $70 ; | XXX    | $FD82
LFD83:
    .byte $05 ; |     X X| $FD83
    .byte $06 ; |     XX | $FD84
    .byte $09 ; |    X  X| $FD85
    .byte $0A ; |    X X | $FD86
LFD87:
    .byte $00 ; |        | $FD87
    .byte $FF ; |XXXXXXXX| $FD88
    .byte $C3 ; |XX    XX| $FD89
    .byte $A5 ; |X X  X X| $FD8A
    .byte $99 ; |X  XX  X| $FD8B
    .byte $99 ; |X  XX  X| $FD8C
    .byte $A5 ; |X X  X X| $FD8D
    .byte $C3 ; |XX    XX| $FD8E
    .byte $FF ; |XXXXXXXX| $FD8F
    .byte $5F ; | X XXXXX| $FD90
    .byte $58 ; | X XX   | $FD91
    .byte $B4 ; |X XX X  | $FD92
    .byte $5F ; | X XXXXX| $FD93
    .byte $38 ; |  XXX   | $FD94
    .byte $54 ; | X X X  | $FD95
    .byte $18 ; |   XX   | $FD96
    .byte $32 ; |  XX  X | $FD97
    .byte $14 ; |   X X  | $FD98
    .byte $5F ; | X XXXXX| $FD99
    .byte $58 ; | X XX   | $FD9A
    .byte $B4 ; |X XX X  | $FD9B
    .byte $5F ; | X XXXXX| $FD9C
    .byte $38 ; |  XXX   | $FD9D
    .byte $54 ; | X X X  | $FD9E
    .byte $18 ; |   XX   | $FD9F
    .byte $37 ; |  XX XXX| $FDA0
    .byte $14 ; |   X X  | $FDA1
    .byte $57 ; | X X XXX| $FDA2
    .byte $52 ; | X X  X | $FDA3
    .byte $AF ; |X X XXXX| $FDA4
    .byte $57 ; | X X XXX| $FDA5
    .byte $32 ; |  XX  X | $FDA6
    .byte $4F ; | X  XXXX| $FDA7
    .byte $12 ; |   X  X | $FDA8
    .byte $31 ; |  XX   X| $FDA9
    .byte $0F ; |    XXXX| $FDAA
    .byte $5F ; | X XXXXX| $FDAB
    .byte $58 ; | X XX   | $FDAC
    .byte $B4 ; |X XX X  | $FDAD
    .byte $5F ; | X XXXXX| $FDAE
    .byte $38 ; |  XXX   | $FDAF
    .byte $54 ; | X X X  | $FDB0
    .byte $18 ; |   XX   | $FDB1
    .byte $37 ; |  XX XXX| $FDB2
    .byte $12 ; |   X  X | $FDB3
    .byte $54 ; | X X X  | $FDB4
    .byte $57 ; | X X XXX| $FDB5
    .byte $B4 ; |X XX X  | $FDB6
    .byte $9C ; |X  XXX  | $FDB7
    .byte $14 ; |   X X  | $FDB8
    .byte $52 ; | X X  X | $FDB9
    .byte $50 ; | X X    | $FDBA
    .byte $AF ; |X X XXXX| $FDBB
    .byte $94 ; |X  X X  | $FDBC
    .byte $10 ; |   X    | $FDBD
    .byte $4F ; | X  XXXX| $FDBE
    .byte $50 ; | X X    | $FDBF
    .byte $52 ; | X X  X | $FDC0
    .byte $54 ; | X X X  | $FDC1
    .byte $00 ; |        | $FDC2
    .byte $FF ; |XXXXXXXX| $FDC3
    .byte $04 ; |     X  | $FDC4
    .byte $0D ; |    XX X| $FDC5
    .byte $0C ; |    XX  | $FDC6
    .byte $0B ; |    X XX| $FDC7
    .byte $0A ; |    X X | $FDC8
    .byte $00 ; |        | $FDC9
    .byte $FF ; |XXXXXXXX| $FDCA
    .byte $04 ; |     X  | $FDCB
    .byte $37 ; |  XX XXX| $FDCC
    .byte $4B ; | X  X XX| $FDCD
    .byte $00 ; |        | $FDCE
    .byte $FF ; |XXXXXXXX| $FDCF
    .byte $04 ; |     X  | $FDD0
    .byte $73 ; | XXX  XX| $FDD1
    .byte $4E ; | X  XXX | $FDD2
    .byte $8B ; |X   X XX| $FDD3
    .byte $73 ; | XXX  XX| $FDD4
    .byte $4E ; | X  XXX | $FDD5
    .byte $8B ; |X   X XX| $FDD6
    .byte $73 ; | XXX  XX| $FDD7
    .byte $4E ; | X  XXX | $FDD8
    .byte $CB ; |XX  X XX| $FDD9
    .byte $0E ; |    XXX | $FDDA
    .byte $17 ; |   X XXX| $FDDB
    .byte $BD ; |X XXXX X| $FDDC
    .byte $00 ; |        | $FDDD
    .byte $FF ; |XXXXXXXX| $FDDE
    .byte $07 ; |     XXX| $FDDF
    .byte $BF ; |X XXXXXX| $FDE0
    .byte $BA ; |X XXX X | $FDE1
    .byte $00 ; |        | $FDE2
    .byte $FF ; |XXXXXXXX| $FDE3
    .byte $08 ; |    X   | $FDE4
    .byte $7A ; | XXXX X | $FDE5
    .byte $00 ; |        | $FDE6
    .byte $FF ; |XXXXXXXX| $FDE7
    .byte $08 ; |    X   | $FDE8
    .byte $46 ; | X   XX | $FDE9
    .byte $5F ; | X XXXXX| $FDEA
    .byte $50 ; | X X    | $FDEB
    .byte $00 ; |        | $FDEC
    .byte $FF ; |XXXXXXXX| $FDED
    .byte $08 ; |    X   | $FDEE
    .byte $24 ; |  X  X  | $FDEF
    .byte $00 ; |        | $FDF0
    .byte $FF ; |XXXXXXXX| $FDF1
    .byte $04 ; |     X  | $FDF2
    .byte $38 ; |  XXX   | $FDF3
    .byte $3E ; |  XXXXX | $FDF4
    .byte $00 ; |        | $FDF5
    .byte $FF ; |XXXXXXXX| $FDF6
    .byte $04 ; |     X  | $FDF7
    .byte $73 ; | XXX  XX| $FDF8
    .byte $0B ; |    X XX| $FDF9
    .byte $13 ; |   X  XX| $FDFA
    .byte $8E ; |X   XXX | $FDFB
    .byte $17 ; |   X XXX| $FDFC
    .byte $13 ; |   X  XX| $FDFD
    .byte $6E ; | XX XXX | $FDFE
    .byte $00 ; |        | $FDFF
LFE00:
    .byte $00 ; |        | $FE00
    .byte $3C ; |  XXXX  | $FE01
    .byte $42 ; | X    X | $FE02
    .byte $99 ; |X  XX  X| $FE03
    .byte $A1 ; |X X    X| $FE04
    .byte $A1 ; |X X    X| $FE05
    .byte $99 ; |X  XX  X| $FE06
    .byte $42 ; | X    X | $FE07
    .byte $3C ; |  XXXX  | $FE08
    .byte $00 ; |        | $FE09
    .byte $00 ; |        | $FE0A
    .byte $8A ; |X   X X | $FE0B
    .byte $8A ; |X   X X | $FE0C
    .byte $AA ; |X X X X | $FE0D
    .byte $AA ; |X X X X | $FE0E
    .byte $DA ; |XX XX X | $FE0F
    .byte $00 ; |        | $FE10
    .byte $00 ; |        | $FE11
    .byte $00 ; |        | $FE12
    .byte $03 ; |      XX| $FE13
    .byte $02 ; |      X | $FE14
    .byte $02 ; |      X | $FE15
    .byte $03 ; |      XX| $FE16
    .byte $01 ; |       X| $FE17
    .byte $01 ; |       X| $FE18
    .byte $01 ; |       X| $FE19
    .byte $00 ; |        | $FE1A
    .byte $00 ; |        | $FE1B
    .byte $00 ; |        | $FE1C
    .byte $00 ; |        | $FE1D
    .byte $00 ; |        | $FE1E
    .byte $C0 ; |XX      | $FE1F
    .byte $C0 ; |XX      | $FE20
    .byte $C0 ; |XX      | $FE21
    .byte $FE ; |XXXXXXX | $FE22
    .byte $FE ; |XXXXXXX | $FE23
    .byte $C6 ; |XX   XX | $FE24
    .byte $FE ; |XXXXXXX | $FE25
    .byte $FE ; |XXXXXXX | $FE26
    .byte $00 ; |        | $FE27
    .byte $00 ; |        | $FE28
    .byte $7F ; | XXXXXXX| $FE29
    .byte $7F ; | XXXXXXX| $FE2A
    .byte $63 ; | XX   XX| $FE2B
    .byte $7F ; | XXXXXXX| $FE2C
    .byte $7E ; | XXXXXX | $FE2D
    .byte $66 ; | XX  XX | $FE2E
    .byte $7E ; | XXXXXX | $FE2F
    .byte $7E ; | XXXXXX | $FE30
    .byte $00 ; |        | $FE31
    .byte $00 ; |        | $FE32
    .byte $00 ; |        | $FE33
    .byte $08 ; |    X   | $FE34
    .byte $08 ; |    X   | $FE35
    .byte $0E ; |    XXX | $FE36
    .byte $0A ; |    X X | $FE37
    .byte $0E ; |    XXX | $FE38
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
LFE43:
    .byte $00 ; |        | $FE43
    .byte $00 ; |        | $FE44
    .byte $00 ; |        | $FE45
    .byte $5D ; | X XXX X| $FE46
    .byte $45 ; | X   X X| $FE47
    .byte $5D ; | X XXX X| $FE48
    .byte $55 ; | X X X X| $FE49
    .byte $5D ; | X XXX X| $FE4A
    .byte $00 ; |        | $FE4B
    .byte $00 ; |        | $FE4C
    .byte $00 ; |        | $FE4D
    .byte $C7 ; |XX   XXX| $FE4E
    .byte $AA ; |X X X X | $FE4F
    .byte $AA ; |X X X X | $FE50
    .byte $A8 ; |X X X   | $FE51
    .byte $C8 ; |XX  X   | $FE52
    .byte $00 ; |        | $FE53
    .byte $00 ; |        | $FE54
    .byte $00 ; |        | $FE55
    .byte $98 ; |X  XX   | $FE56
    .byte $A5 ; |X X  X X| $FE57
    .byte $45 ; | X   X X| $FE58
    .byte $48 ; | X  X   | $FE59
    .byte $50 ; | X X    | $FE5A
    .byte $48 ; | X  X   | $FE5B
    .byte $04 ; |     X  | $FE5C
    .byte $C4 ; |XX   X  | $FE5D
    .byte $38 ; |  XXX   | $FE5E
    .byte $00 ; |        | $FE5F
    .byte $00 ; |        | $FE60
    .byte $00 ; |        | $FE61
    .byte $66 ; | XX  XX | $FE62
    .byte $66 ; | XX  XX | $FE63
    .byte $66 ; | XX  XX | $FE64
    .byte $7F ; | XXXXXXX| $FE65
    .byte $7F ; | XXXXXXX| $FE66
    .byte $63 ; | XX   XX| $FE67
    .byte $7F ; | XXXXXXX| $FE68
    .byte $7F ; | XXXXXXX| $FE69
    .byte $00 ; |        | $FE6A
    .byte $00 ; |        | $FE6B
    .byte $7E ; | XXXXXX | $FE6C
    .byte $7E ; | XXXXXX | $FE6D
    .byte $60 ; | XX     | $FE6E
    .byte $60 ; | XX     | $FE6F
    .byte $60 ; | XX     | $FE70
    .byte $60 ; | XX     | $FE71
    .byte $60 ; | XX     | $FE72
    .byte $60 ; | XX     | $FE73
    .byte $00 ; |        | $FE74
    .byte $00 ; |        | $FE75
    .byte $00 ; |        | $FE76
    .byte $AE ; |X X XXX | $FE77
    .byte $A8 ; |X X X   | $FE78
    .byte $CC ; |XX  XX  | $FE79
    .byte $A8 ; |X X X   | $FE7A
    .byte $EE ; |XXX XXX | $FE7B
    .byte $00 ; |        | $FE7C
    .byte $00 ; |        | $FE7D
    .byte $7E ; | XXXXXX | $FE7E
    .byte $FE ; |XXXXXXX | $FE7F
    .byte $C0 ; |XX      | $FE80
    .byte $C0 ; |XX      | $FE81
    .byte $C0 ; |XX      | $FE82
    .byte $C0 ; |XX      | $FE83
    .byte $FE ; |XXXXXXX | $FE84
    .byte $7E ; | XXXXXX | $FE85
LFE86:
    .byte $00 ; |        | $FE86
    .byte $01 ; |       X| $FE87
    .byte $00 ; |        | $FE88
    .byte $DD ; |XX XXX X| $FE89
    .byte $50 ; | X X    | $FE8A
    .byte $DC ; |XX XXX  | $FE8B
    .byte $44 ; | X   X  | $FE8C
    .byte $DC ; |XX XXX  | $FE8D
    .byte $00 ; |        | $FE8E
    .byte $00 ; |        | $FE8F
    .byte $00 ; |        | $FE90
    .byte $29 ; |  X X  X| $FE91
    .byte $A9 ; |X X X  X| $FE92
    .byte $B9 ; |X XXX  X| $FE93
    .byte $AA ; |X X X X | $FE94
    .byte $BA ; |X XXX X | $FE95
    .byte $00 ; |        | $FE96
    .byte $00 ; |        | $FE97
    .byte $00 ; |        | $FE98
    .byte $D3 ; |XX X  XX| $FE99
    .byte $2E ; |  X XXX | $FE9A
    .byte $2C ; |  X XX  | $FE9B
    .byte $8A ; |X   X X | $FE9C
    .byte $69 ; | XX X  X| $FE9D
    .byte $09 ; |    X  X| $FE9E
    .byte $04 ; |     X  | $FE9F
    .byte $04 ; |     X  | $FEA0
    .byte $03 ; |      XX| $FEA1
    .byte $00 ; |        | $FEA2
    .byte $00 ; |        | $FEA3
    .byte $00 ; |        | $FEA4
    .byte $33 ; |  XX  XX| $FEA5
    .byte $33 ; |  XX  XX| $FEA6
    .byte $33 ; |  XX  XX| $FEA7
    .byte $33 ; |  XX  XX| $FEA8
    .byte $33 ; |  XX  XX| $FEA9
    .byte $33 ; |  XX  XX| $FEAA
    .byte $33 ; |  XX  XX| $FEAB
    .byte $33 ; |  XX  XX| $FEAC
    .byte $00 ; |        | $FEAD
    .byte $00 ; |        | $FEAE
    .byte $7F ; | XXXXXXX| $FEAF
    .byte $7F ; | XXXXXXX| $FEB0
    .byte $63 ; | XX   XX| $FEB1
    .byte $63 ; | XX   XX| $FEB2
    .byte $63 ; | XX   XX| $FEB3
    .byte $63 ; | XX   XX| $FEB4
    .byte $63 ; | XX   XX| $FEB5
    .byte $63 ; | XX   XX| $FEB6
    .byte $00 ; |        | $FEB7
    .byte $00 ; |        | $FEB8
    .byte $00 ; |        | $FEB9
    .byte $EE ; |XXX XXX | $FEBA
    .byte $28 ; |  X X   | $FEBB
    .byte $EC ; |XXX XX  | $FEBC
    .byte $88 ; |X   X   | $FEBD
    .byte $EE ; |XXX XXX | $FEBE
    .byte $00 ; |        | $FEBF
    .byte $00 ; |        | $FEC0
    .byte $7F ; | XXXXXXX| $FEC1
    .byte $7F ; | XXXXXXX| $FEC2
    .byte $63 ; | XX   XX| $FEC3
    .byte $7F ; | XXXXXXX| $FEC4
    .byte $7E ; | XXXXXX | $FEC5
    .byte $66 ; | XX  XX | $FEC6
    .byte $7E ; | XXXXXX | $FEC7
    .byte $7E ; | XXXXXX | $FEC8
    .byte $FF ; |XXXXXXXX| $FEC9
    .byte $FF ; |XXXXXXXX| $FECA
    .byte $FF ; |XXXXXXXX| $FECB
    .byte $FF ; |XXXXXXXX| $FECC
    .byte $FF ; |XXXXXXXX| $FECD
    .byte $FF ; |XXXXXXXX| $FECE
    .byte $FF ; |XXXXXXXX| $FECF
    .byte $FF ; |XXXXXXXX| $FED0
    .byte $FF ; |XXXXXXXX| $FED1
    .byte $FF ; |XXXXXXXX| $FED2
    .byte $FF ; |XXXXXXXX| $FED3
    .byte $FF ; |XXXXXXXX| $FED4
    .byte $FF ; |XXXXXXXX| $FED5
    .byte $FF ; |XXXXXXXX| $FED6
    .byte $FF ; |XXXXXXXX| $FED7
    .byte $FF ; |XXXXXXXX| $FED8
    .byte $FF ; |XXXXXXXX| $FED9
    .byte $FF ; |XXXXXXXX| $FEDA
    .byte $FF ; |XXXXXXXX| $FEDB
    .byte $FF ; |XXXXXXXX| $FEDC
    .byte $FF ; |XXXXXXXX| $FEDD
    .byte $FF ; |XXXXXXXX| $FEDE
    .byte $FF ; |XXXXXXXX| $FEDF
    .byte $FF ; |XXXXXXXX| $FEE0
    .byte $FF ; |XXXXXXXX| $FEE1
    .byte $FF ; |XXXXXXXX| $FEE2
    .byte $FF ; |XXXXXXXX| $FEE3
    .byte $FF ; |XXXXXXXX| $FEE4
    .byte $FF ; |XXXXXXXX| $FEE5
    .byte $FF ; |XXXXXXXX| $FEE6
    .byte $FF ; |XXXXXXXX| $FEE7
    .byte $FF ; |XXXXXXXX| $FEE8
    .byte $FF ; |XXXXXXXX| $FEE9
    .byte $FF ; |XXXXXXXX| $FEEA
    .byte $FF ; |XXXXXXXX| $FEEB
    .byte $FF ; |XXXXXXXX| $FEEC
    .byte $FF ; |XXXXXXXX| $FEED
    .byte $FF ; |XXXXXXXX| $FEEE
    .byte $FF ; |XXXXXXXX| $FEEF
    .byte $FF ; |XXXXXXXX| $FEF0
    .byte $FF ; |XXXXXXXX| $FEF1
    .byte $FF ; |XXXXXXXX| $FEF2
    .byte $FF ; |XXXXXXXX| $FEF3
    .byte $FF ; |XXXXXXXX| $FEF4
    .byte $FF ; |XXXXXXXX| $FEF5
    .byte $FF ; |XXXXXXXX| $FEF6
    .byte $FF ; |XXXXXXXX| $FEF7
    .byte $FF ; |XXXXXXXX| $FEF8
    .byte $FF ; |XXXXXXXX| $FEF9
    .byte $FF ; |XXXXXXXX| $FEFA
    .byte $FF ; |XXXXXXXX| $FEFB
    .byte $FF ; |XXXXXXXX| $FEFC
    .byte $FF ; |XXXXXXXX| $FEFD  
    .byte $FF ; |XXXXXXXX| $FEFE
    .byte $FF ; |XXXXXXXX| $FEFF
LFF00:
    .byte $00 ; |        | $FF00
    .byte $00 ; |        | $FF01
    .byte $80 ; |X       | $FF02
    .byte $AE ; |X X XXX | $FF03
    .byte $22 ; |  X   X | $FF04
    .byte $2E ; |  X XXX | $FF05
    .byte $2A ; |  X X X | $FF06
    .byte $2E ; |  X XXX | $FF07
    .byte $00 ; |        | $FF08
    .byte $00 ; |        | $FF09
    .byte $00 ; |        | $FF0A
    .byte $11 ; |   X   X| $FF0B
    .byte $11 ; |   X   X| $FF0C
    .byte $15 ; |   X X X| $FF0D
    .byte $95 ; |X  X X X| $FF0E
    .byte $9B ; |X  XX XX| $FF0F
    .byte $03 ; |      XX| $FF10
    .byte $00 ; |        | $FF11
    .byte $00 ; |        | $FF12
    .byte $BF ; |X XXXXXX| $FF13
    .byte $62 ; | XX   X | $FF14
    .byte $53 ; | X X  XX| $FF15
    .byte $49 ; | X  X  X| $FF16
    .byte $48 ; | X  X   | $FF17
    .byte $24 ; |  X  X  | $FF18
    .byte $A4 ; |X X  X  | $FF19
    .byte $98 ; |X  XX   | $FF1A
    .byte $00 ; |        | $FF1B
    .byte $00 ; |        | $FF1C
    .byte $00 ; |        | $FF1D
    .byte $00 ; |        | $FF1E
    .byte $1E ; |   XXXX | $FF1F
    .byte $1E ; |   XXXX | $FF20
    .byte $36 ; |  XX XX | $FF21
    .byte $36 ; |  XX XX | $FF22
    .byte $66 ; | XX  XX | $FF23
    .byte $66 ; | XX  XX | $FF24
    .byte $C6 ; |XX   XX | $FF25
    .byte $C6 ; |XX   XX | $FF26
    .byte $00 ; |        | $FF27
    .byte $00 ; |        | $FF28
    .byte $3F ; |  XXXXXX| $FF29
    .byte $3F ; |  XXXXXX| $FF2A
    .byte $30 ; |  XX    | $FF2B
    .byte $3E ; |  XXXXX | $FF2C
    .byte $3E ; |  XXXXX | $FF2D
    .byte $30 ; |  XX    | $FF2E
    .byte $3F ; |  XXXXXX| $FF2F
    .byte $3F ; |  XXXXXX| $FF30
    .byte $00 ; |        | $FF31
    .byte $00 ; |        | $FF32
    .byte $00 ; |        | $FF33
    .byte $92 ; |X  X  X | $FF34
    .byte $92 ; |X  X  X | $FF35
    .byte $B2 ; |X XX  X | $FF36
    .byte $D2 ; |XX X  X | $FF37
    .byte $97 ; |X  X XXX| $FF38
    .byte $00 ; |        | $FF39
    .byte $00 ; |        | $FF3A
    .byte $3E ; |  XXXXX | $FF3B
    .byte $3F ; |  XXXXXX| $FF3C
    .byte $03 ; |      XX| $FF3D
    .byte $3F ; |  XXXXXX| $FF3E
    .byte $3F ; |  XXXXXX| $FF3F
    .byte $30 ; |  XX    | $FF40
    .byte $3F ; |  XXXXXX| $FF41
    .byte $1F ; |   XXXXX| $FF42
LFF43:
    .byte $00 ; |        | $FF43
    .byte $00 ; |        | $FF44
    .byte $00 ; |        | $FF45
    .byte $EE ; |XXX XXX | $FF46
    .byte $A2 ; |X X   X | $FF47
    .byte $E6 ; |XXX  XX | $FF48
    .byte $A2 ; |X X   X | $FF49
    .byte $EE ; |XXX XXX | $FF4A
    .byte $00 ; |        | $FF4B
    .byte $0E ; |    XXX | $FF4C
    .byte $02 ; |      X | $FF4D
    .byte $4E ; | X  XXX | $FF4E
    .byte $4A ; | X  X X | $FF4F
    .byte $6E ; | XX XXX | $FF50
    .byte $40 ; | X      | $FF51
    .byte $70 ; | XXX    | $FF52
    .byte $00 ; |        | $FF53
    .byte $80 ; |X       | $FF54
    .byte $40 ; | X      | $FF55
    .byte $C0 ; |XX      | $FF56
    .byte $60 ; | XX     | $FF57
    .byte $20 ; |  X     | $FF58
    .byte $20 ; |  X     | $FF59
    .byte $00 ; |        | $FF5A
    .byte $00 ; |        | $FF5B
    .byte $00 ; |        | $FF5C
    .byte $00 ; |        | $FF5D
    .byte $00 ; |        | $FF5E
    .byte $00 ; |        | $FF5F
    .byte $00 ; |        | $FF60
    .byte $00 ; |        | $FF61
    .byte $18 ; |   XX   | $FF62
    .byte $18 ; |   XX   | $FF63
    .byte $18 ; |   XX   | $FF64
    .byte $18 ; |   XX   | $FF65
    .byte $18 ; |   XX   | $FF66
    .byte $18 ; |   XX   | $FF67
    .byte $7E ; | XXXXXX | $FF68
    .byte $7E ; | XXXXXX | $FF69
    .byte $00 ; |        | $FF6A
    .byte $00 ; |        | $FF6B
    .byte $00 ; |        | $FF6C
    .byte $00 ; |        | $FF6D
    .byte $00 ; |        | $FF6E
    .byte $3E ; |  XXXXX | $FF6F
    .byte $3E ; |  XXXXX | $FF70
    .byte $00 ; |        | $FF71
    .byte $00 ; |        | $FF72
    .byte $00 ; |        | $FF73
    .byte $00 ; |        | $FF74
    .byte $00 ; |        | $FF75
    .byte $00 ; |        | $FF76
    .byte $70 ; | XXX    | $FF77
    .byte $10 ; |   X    | $FF78
    .byte $70 ; | XXX    | $FF79
    .byte $40 ; | X      | $FF7A
    .byte $70 ; | XXX    | $FF7B
    .byte $00 ; |        | $FF7C
    .byte $00 ; |        | $FF7D
    .byte $00 ; |        | $FF7E
    .byte $00 ; |        | $FF7F
    .byte $00 ; |        | $FF80
    .byte $00 ; |        | $FF81
    .byte $00 ; |        | $FF82
    .byte $00 ; |        | $FF83
    .byte $00 ; |        | $FF84
LFF85:
    .byte $00 ; |        | $FF85
    .byte $1C ; |   XXX  | $FF86
    .byte $1C ; |   XXX  | $FF87
    .byte $1C ; |   XXX  | $FF88
    .byte $1C ; |   XXX  | $FF89
    .byte $1C ; |   XXX  | $FF8A
    .byte $1C ; |   XXX  | $FF8B
    .byte $1C ; |   XXX  | $FF8C
    .byte $1C ; |   XXX  | $FF8D
    .byte $38 ; |  XXX   | $FF8E
    .byte $38 ; |  XXX   | $FF8F
    .byte $38 ; |  XXX   | $FF90
    .byte $38 ; |  XXX   | $FF91
    .byte $38 ; |  XXX   | $FF92
    .byte $38 ; |  XXX   | $FF93
    .byte $38 ; |  XXX   | $FF94
    .byte $38 ; |  XXX   | $FF95
    .byte $38 ; |  XXX   | $FF96
    .byte $38 ; |  XXX   | $FF97
    .byte $38 ; |  XXX   | $FF98
    .byte $38 ; |  XXX   | $FF99
    .byte $38 ; |  XXX   | $FF9A
    .byte $38 ; |  XXX   | $FF9B
    .byte $38 ; |  XXX   | $FF9C
    .byte $38 ; |  XXX   | $FF9D
    .byte $38 ; |  XXX   | $FF9E
    .byte $38 ; |  XXX   | $FF9F
    .byte $38 ; |  XXX   | $FFA0
    .byte $00 ; |        | $FFA1
    .byte $00 ; |        | $FFA2
    .byte $00 ; |        | $FFA3
    .byte $8C ; |X   XX  | $FFA4
    .byte $8C ; |X   XX  | $FFA5
    .byte $8A ; |X   X X | $FFA6
    .byte $8A ; |X   X X | $FFA7
    .byte $88 ; |X   X   | $FFA8
    .byte $88 ; |X   X   | $FFA9
    .byte $86 ; |X    XX | $FFAA
    .byte $84 ; |X    X  | $FFAB
    .byte $00 ; |        | $FFAC
    .byte $00 ; |        | $FFAD
    .byte $84 ; |X    X  | $FFAE
    .byte $86 ; |X    XX | $FFAF
    .byte $88 ; |X   X   | $FFB0
    .byte $88 ; |X   X   | $FFB1
    .byte $8A ; |X   X X | $FFB2
    .byte $8A ; |X   X X | $FFB3
    .byte $8C ; |X   XX  | $FFB4
    .byte $8C ; |X   XX  | $FFB5
    .byte $00 ; |        | $FFB6
    .byte $00 ; |        | $FFB7
    .byte $00 ; |        | $FFB8
    .byte $46 ; | X   XX | $FFB9
    .byte $46 ; | X   XX | $FFBA
    .byte $46 ; | X   XX | $FFBB
    .byte $46 ; | X   XX | $FFBC
    .byte $46 ; | X   XX | $FFBD
    .byte $00 ; |        | $FFBE
    .byte $00 ; |        | $FFBF
    .byte $1C ; |   XXX  | $FFC0
    .byte $1C ; |   XXX  | $FFC1
    .byte $1C ; |   XXX  | $FFC2
    .byte $1C ; |   XXX  | $FFC3
    .byte $1C ; |   XXX  | $FFC4
    
    .byte $1C ; |   XXX  | $FFC5
    .byte $1C ; |   XXX  | $FFC6
    .byte $1C ; |   XXX  | $FFC7
    .byte $FF ; |XXXXXXXX| $FFC8
    .byte $FF ; |XXXXXXXX| $FFC9
    .byte $FF ; |XXXXXXXX| $FFCA
    .byte $FF ; |XXXXXXXX| $FFCB
    .byte $FF ; |XXXXXXXX| $FFCC
    .byte $FF ; |XXXXXXXX| $FFCD
    .byte $FF ; |XXXXXXXX| $FFCE
    .byte $FF ; |XXXXXXXX| $FFCF
    .byte $FF ; |XXXXXXXX| $FFD0
    .byte $FF ; |XXXXXXXX| $FFD1
    .byte $FF ; |XXXXXXXX| $FFD2
    .byte $FF ; |XXXXXXXX| $FFD3
    .byte $FF ; |XXXXXXXX| $FFD4
    .byte $FF ; |XXXXXXXX| $FFD5
    .byte $FF ; |XXXXXXXX| $FFD6
    .byte $FF ; |XXXXXXXX| $FFD7
    .byte $FF ; |XXXXXXXX| $FFD8
    .byte $FF ; |XXXXXXXX| $FFD9
    .byte $FF ; |XXXXXXXX| $FFDA
    .byte $FF ; |XXXXXXXX| $FFDB
    .byte $FF ; |XXXXXXXX| $FFDC
    .byte $FF ; |XXXXXXXX| $FFDD
    .byte $FF ; |XXXXXXXX| $FFDE
    .byte $FF ; |XXXXXXXX| $FFDF
    .byte $FF ; |XXXXXXXX| $FFE0
    .byte $FF ; |XXXXXXXX| $FFE1
    .byte $FF ; |XXXXXXXX| $FFE2
    .byte $FF ; |XXXXXXXX| $FFE3
    .byte $FF ; |XXXXXXXX| $FFE4
    .byte $FF ; |XXXXXXXX| $FFE5
    .byte $FF ; |XXXXXXXX| $FFE6
    .byte $FF ; |XXXXXXXX| $FFE7
    .byte $FF ; |XXXXXXXX| $FFE8
    .byte $FF ; |XXXXXXXX| $FFE9
    .byte $FF ; |XXXXXXXX| $FFEA
    .byte $FF ; |XXXXXXXX| $FFEB
    .byte $FF ; |XXXXXXXX| $FFEC
    .byte $FF ; |XXXXXXXX| $FFED
    .byte $FF ; |XXXXXXXX| $FFEE
    .byte $FF ; |XXXXXXXX| $FFEF
    .byte $FF ; |XXXXXXXX| $FFF0
    .byte $FF ; |XXXXXXXX| $FFF1

LFFF2:
    sta    LFFF8                 ; 4
    jmp.ind ($00FB)              ; 5

LFFF8:
    .byte $FF ; |XXXXXXXX| $FFF8
LFFF9:
    .byte $F1 ; |XXXX   X| $FFF9
    .byte $FF ; |XXXXXXXX| $FFFA
    .byte $FF ; |XXXXXXXX| $FFFB

      RORG $FFFC
    .word START_2nd,START_2nd