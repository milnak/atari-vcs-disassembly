; Disassembly of smbit.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: newdistella -pasfcSMbit.cfg smbit.bin 
;
; SMbit.cfg contents:
;
;      ORG F000
;      CODE F000 F975
;      DATA F976 F9FF
;      GFX FA00 FBD4
;      DATA FBD5 FFFB
;      GFX FFFC FFFF

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
ENAM0   =  $1D
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

; Read TIA Baseline = $00
CXM0P   =  $00
CXM1P   =  $01
CXP0FB  =  $02
INPT4   =  $0C
INPT5   =  $0D

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296
T1024T  =  $0297

       ORG $F000

START:
    cld                          ; 2
    ldx    #0                    ; 2
    lda    #0                    ; 2
LF005:
    sta    0,X                   ; 4
    txs                          ; 2
    inx                          ; 2
    bne    LF005                 ; 2³
    
    lda    #$10                  ; 2
    sta    $96                   ; 3
LF00F:
    lda    #$50                  ; 2
    sta    $83                   ; 3
    lda    #$98                  ; 2
    sta    $84                   ; 3
    sta    $85                   ; 3
    sta    $86                   ; 3
    lda    #0                    ; 2
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    ENABL                 ; 3
    ldx    #5                    ; 2
LF025:
    sta    AUDC0,X               ; 4
    dex                          ; 2
    bpl    LF025                 ; 2³
    ldx    #2                    ; 2
LF02C:
    sta    $B8,X                 ; 4
    sta    $E5,X                 ; 4
    sta    $E8,X                 ; 4
    dex                          ; 2
    bpl    LF02C                 ; 2³
    lda    #$FF                  ; 2
    sta    $BE                   ; 3
    lda    #$2B                  ; 2
    sta    $BF                   ; 3
    lda    #$A8                  ; 2
    sta    $C0                   ; 3
    lda    #$3A                  ; 2
    sta    $C1                   ; 3
    lda    #$90                  ; 2
    sta    $8F                   ; 3
    lda    #$80                  ; 2
    sta    $90                   ; 3
    lda    #$70                  ; 2
    sta    $8E                   ; 3
    lda    #$B0                  ; 2
    sta    $C4                   ; 3
    sta    $C5                   ; 3
    lda    #2                    ; 2
    sta    $D9                   ; 3
    sta    $DA                   ; 3
    ldy    $E0                   ; 3
    iny                          ; 2
    iny                          ; 2
    sty    $DB                   ; 3
    lda    #3                    ; 2
    sta    $DC                   ; 3
    lda    #5                    ; 2
    sta    $DD                   ; 3
    lda    #7                    ; 2
    sta    $DE                   ; 3
    lda    #0                    ; 2
    sta    $E4                   ; 3
    sta    $EC                   ; 3
    ldx    #5                    ; 2
    lda    #0                    ; 2
LF079:
    sta    AUDC0,X               ; 4
    dex                          ; 2
    bpl    LF079                 ; 2³
    lda    #$F0                  ; 2
    sta    $9C                   ; 3
LF082:
    lda    #3                    ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$0E                  ; 2
    and    $BE                   ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #0                    ; 2
    sta    HMP0                  ; 3
    lda    #$18                  ; 2
    sta    HMP1                  ; 3
    ldy    #5                    ; 2
    lda    #$10                  ; 2
    sta    WSYNC                 ; 3
LF09E:
    dey                          ; 2
    bpl    LF09E                 ; 2³
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
LF0A5:
    lda    INTIM                 ; 4
    bne    LF0A5                 ; 2³
    sta    WSYNC                 ; 3
    sta    VBLANK                ; 3
    sta    CXCLR                 ; 3
    sta    HMCLR                 ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    ldx    #2                    ; 2
LF0B8:
    sta    WSYNC                 ; 3
    dex                          ; 2
    bpl    LF0B8                 ; 2³
    lda    #7                    ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    lda    #7                    ; 2
    sta    $80                   ; 3
LF0C7:
    ldy    $80                   ; 3
    lda    ($AE),Y               ; 5
    sta    $81                   ; 3
    lda    ($AC),Y               ; 5
    tax                          ; 2
    sta    WSYNC                 ; 3
    nop                          ; 2
    lda    ($A4),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($A6),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($A8),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($AA),Y               ; 5
    ldy    $81                   ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    $80                   ; 5
    bpl    LF0C7                 ; 2³
    lda    #0                    ; 2
    sta    WSYNC                 ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    ENABL                 ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    lda    #$14                  ; 2
    sta    T1024T                ; 4
    lda    #0                    ; 2
    sta    NUSIZ1                ; 3
    ldy    #1                    ; 2
    lda    $98                   ; 3
    bne    LF112                 ; 2³
    ldy    #5                    ; 2
LF112:
    sty    NUSIZ0                ; 3
    lda    #$5C                  ; 2
    and    $BE                   ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$70                  ; 2
    ldx    #0                    ; 2
    jsr    LF831                 ; 6
    lda    #$20                  ; 2
    ldx    #1                    ; 2
    jsr    LF831                 ; 6
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
    sta    HMCLR                 ; 3
    ldy    #7                    ; 2
LF134:
    sta    WSYNC                 ; 3
    lda    ($B6),Y               ; 5
    sta    GRP1                  ; 3
    lda    ($96),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($96),Y               ; 5
    lda    ($96),Y               ; 5
    lda    ($96),Y               ; 5
    lda    ($96),Y               ; 5
    lda    ($96),Y               ; 5
    lda    ($96),Y               ; 5
    lda    $C6                   ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    ($98),Y               ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    bpl    LF134                 ; 2³
    ldx    #5                    ; 2
LF159:
    nop                          ; 2
    dex                          ; 2
    bpl    LF159                 ; 2³
    iny                          ; 2
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    lda    #5                    ; 2
    sta    NUSIZ0                ; 3
    lda    #0                    ; 2
    sta    NUSIZ1                ; 3
    lda    #$10                  ; 2
    sta    CTRLPF                ; 3
    lda    $83                   ; 3
    ldx    #0                    ; 2
    jsr    LF831                 ; 6
    lda    $88                   ; 3
    clc                          ; 2
    adc    #2                    ; 2
    ldx    #2                    ; 2
    jsr    LF831                 ; 6
    lda    $88                   ; 3
    ldx    #1                    ; 2
    jsr    LF831                 ; 6
    lda    $89                   ; 3
    ldx    #3                    ; 2
    jsr    LF831                 ; 6
    lda    $8A                   ; 3
    ldx    #4                    ; 2
    jsr    LF831                 ; 6
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    ldx    #3                    ; 2
LF19E:
    lda    LFB58,X               ; 4
    and.w  $BE                   ; 4
    sta    COLUP0,X              ; 4
    dex                          ; 2
    bpl    LF19E                 ; 2³
    ldy    LFB58                 ; 4
    lda    $9A                   ; 3
    cmp    #$E2                  ; 2
    bcc    LF1B5                 ; 2³
    ldy    LFB5A                 ; 4
LF1B5:
    tya                          ; 2
    and    $BE                   ; 3
    sta    COLUP1                ; 3
    ldy    #3                    ; 2
LF1BC:
    sta    HMCLR                 ; 3
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    ($B2),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($9A),Y               ; 5
    sta    GRP1                  ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    dey                          ; 2
    bpl    LF1BC                 ; 2³
    lda    #0                    ; 2
    sta    GRP1                  ; 3
    sta    HMCLR                 ; 3
    ldy    #7                    ; 2
    sty    $82                   ; 3
    clc                          ; 2
    lda    #$87                  ; 2
    adc    $E0                   ; 3
    adc    $D9                   ; 3
    sta    $81                   ; 3
    ldx    #2                    ; 2
LF1E8:
    ldy    #0                    ; 2
    lda    $8B,X                 ; 4
    cmp    $81                   ; 3
    bcs    LF1F6                 ; 2³
    cmp    #$81                  ; 2
    bcc    LF1F6                 ; 2³
    ldy    #2                    ; 2
LF1F6:
    sty    ENAM0,X               ; 4
    dex                          ; 2
    bpl    LF1E8                 ; 2³
LF1FB:
    ldy    $82                   ; 3
    lda    LFB5C,Y               ; 4
    and    $BE                   ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    COLUBK                ; 3
    lda    ($B4),Y               ; 5
    sta    GRP0                  ; 3
    lda    ($9E),Y               ; 5
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    dec    $82                   ; 5
    bpl    LF1FB                 ; 2³+1
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    ENABL                 ; 3
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda.w  $EF                   ; 4
    ldx    #0                    ; 2
    stx    NUSIZ0                ; 3
    jsr    LF831                 ; 6
    lda    #$AC                  ; 2
    and    $BE                   ; 3
    sta    COLUPF                ; 3
    lda    #$3E                  ; 2
    and    $BE                   ; 3
    sta    COLUP1                ; 3
    lda    #$80                  ; 2
    sta    $BD                   ; 3
    lda    #0                    ; 2
    sta    $BC                   ; 3
LF246:
    lda    $BC                   ; 3
    tax                          ; 2
    lda    $8E,X                 ; 4
    sta    $B0                   ; 3
    lda    $84,X                 ; 4
    sta    $87                   ; 3
    txa                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$17                  ; 2
    tay                          ; 2
    sty    $82                   ; 3
    lda    #0                    ; 2
    sta    GRP1                  ; 3
    lda.wx $BF,X                 ; 4
    and    $BE                   ; 3
    sta    COLUP1                ; 3
    lda    #0                    ; 2
    sta    NUSIZ0                ; 3
    ldx    #2                    ; 2
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta    HMCLR                 ; 3
LF27B:
    lda    $BD                   ; 3
    and    #$FC                  ; 2
    ldy    #2                    ; 2
    cmp    $8B,X                 ; 4
    beq    LF287                 ; 2³
    ldy    #0                    ; 2
LF287:
    sty    ENAM0,X               ; 4
    sta    WSYNC                 ; 3
    dec    $BD                   ; 5
    lda    $BD                   ; 3
    and    #$F8                  ; 2
    cmp    $F0                   ; 3
    bne    LF29E                 ; 2³
    lda    $BD                   ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    ($9C),Y               ; 5
    bne    LF2A0                 ; 2³
LF29E:
    lda    #0                    ; 2
LF2A0:
    sta    GRP0                  ; 3
    dex                          ; 2
    bpl    LF2A7                 ; 2³
    ldx    #2                    ; 2
LF2A7:
    dec    $82                   ; 5
    bpl    LF27B                 ; 2³
    ldx    $BC                   ; 3
    lda.wx $C8,X                 ; 4
    sta    NUSIZ1                ; 3
    lda    $87                   ; 3
    ldx    #1                    ; 2
    jsr    LF831                 ; 6
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    ldy    #7                    ; 2
    sty    $82                   ; 3
    ldx    #2                    ; 2
LF2C3:
    sta    WSYNC                 ; 3
    lda    $BD                   ; 3
    and    #$FC                  ; 2
    ldy    #2                    ; 2
    cmp.wx $8B,X                 ; 4
    beq    LF2D2                 ; 2³
    ldy    #0                    ; 2
LF2D2:
    sty    ENAM0,X               ; 4
    ldy    $82                   ; 3
    lda    ($B0),Y               ; 5
    sta    GRP1                  ; 3
    dec    $BD                   ; 5
    dex                          ; 2
    bpl    LF2E1                 ; 2³
    ldx    #2                    ; 2
LF2E1:
    sta    HMCLR                 ; 3
    dec    $82                   ; 5
    bpl    LF2C3                 ; 2³
    lda    $BC                   ; 3
    cmp    #2                    ; 2
    beq    LF2F2                 ; 2³
    inc    $BC                   ; 5
    jmp    LF246                 ; 3
LF2F2:
    lda    #0                    ; 2
    ldx    #4                    ; 2
LF2F6:
    sta    GRP0,X                ; 4
    dex                          ; 2
    bpl    LF2F6                 ; 2³
    ldx    #3                    ; 2
LF2FD:
    sta    WSYNC                 ; 3
    dex                          ; 2
    bpl    LF2FD                 ; 2³+1
    lda    #$65                  ; 2
    and    $BE                   ; 3
    sta    COLUPF                ; 3
    ldy    #7                    ; 2
LF30A:
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    ldx    #2                    ; 2
LF312:
    lda    $91,X                 ; 4
    sta    $94                   ; 3
    lda    ($94),Y               ; 5
    sta    PF0,X                 ; 4
    dex                          ; 2
    bpl    LF312                 ; 2³
    dey                          ; 2
    bpl    LF30A                 ; 2³
    sta.w  WSYNC                 ; 4
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    lda    #0                    ; 2
    sta    HMP0                  ; 3
    sta    COLUBK                ; 3
    sta    COLUPF                ; 3
    ldx    #4                    ; 2
LF337:
    sta    WSYNC                 ; 3
    dex                          ; 2
    bpl    LF337                 ; 2³
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    sta    RESBL                 ; 3
    ldx    #0                    ; 2
    stx    PF0                   ; 3
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    stx    COLUPF                ; 3
    inx                          ; 2
    stx    NUSIZ0                ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    stx    NUSIZ1                ; 3
    lda    #$30                  ; 2
    sta    HMCLR                 ; 3
    sta    HMBL                  ; 3
    lsr                          ; 2
    sta    HMP1                  ; 3
    lda    #$3D                  ; 2
    sta    COLUP1                ; 3
    sta    COLUP0                ; 3
    ldx    #8                    ; 2
LF366:
    sta    WSYNC                 ; 3
    sta    HMOVE                 ; 3
    lda    LFB64,X               ; 4
    sta    GRP0                  ; 3
    lda    LFB6D,X               ; 4
    sta    GRP1                  ; 3
    nop                          ; 2
    lda    LFB7F,X               ; 4
    tay                          ; 2
    lda    LFB76,X               ; 4
    sta    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    HMCLR                 ; 3
    dex                          ; 2
    bpl    LF366                 ; 2³
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcs    LF3A3                 ; 2³
    lda    #6                    ; 2
    sta    $E1                   ; 3
    sta    $E2                   ; 3
    sta    $E3                   ; 3
    jsr    LF96B                 ; 6
    lda    #$A0                  ; 2
    sta    $98                   ; 3
LF39A:
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcc    LF39A                 ; 2³
    jmp    LF00F                 ; 3
LF3A3:
    lsr                          ; 2
    bcs    LF3D8                 ; 2³
    inc    $EB                   ; 5
    lda    $EB                   ; 3
    cmp    #6                    ; 2
    bcc    LF3B2                 ; 2³
    lda    #0                    ; 2
    sta    $EB                   ; 3
LF3B2:
    lda    $EB                   ; 3
    lsr                          ; 2
    sta    $E0                   ; 3
    lda    $EB                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$10                  ; 2
    sta    $96                   ; 3
    lda    #0                    ; 2
    sta    $98                   ; 3
    sta    $E1                   ; 3
    sta    $E2                   ; 3
    sta    $E3                   ; 3
    sta    $B4                   ; 3
    sta    $B2                   ; 3
LF3CE:
    lda    SWCHB                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    bcc    LF3CE                 ; 2³
    jmp    LF00F                 ; 3
LF3D8:
    ldy    #$FF                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    bcs    LF3E0                 ; 2³
    ldy    #$0F                  ; 2
LF3E0:
    sty    $BE                   ; 3
    inc    $C6                   ; 5
    lda    $B4                   ; 3
    bne    LF403                 ; 2³+1
    lda    $EC                   ; 3
    cmp    #4                    ; 2
    bne    LF3F1                 ; 2³
    jsr    LF919                 ; 6
LF3F1:
    lda    $EC                   ; 3
    beq    LF400                 ; 2³+1
    dec    $EC                   ; 5
    lda    $EB                   ; 3
    lsr                          ; 2
    bcc    LF400                 ; 2³+1
    lda    $EC                   ; 3
    bne    LF403                 ; 2³
LF400:
    jsr    LF885                 ; 6
LF403:
    ldx    #$20                  ; 2
    lda    #$FA                  ; 2
LF407:
    sta    $95,X                 ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LF407                 ; 2³
    lda    $E4                   ; 3
    ldy    $98                   ; 3
    bne    LF417                 ; 2³
    lda    $EB                   ; 3
    and    #$01                  ; 2
LF417:
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$10                  ; 2
    sta    $B6                   ; 3
    lda    #$FB                  ; 2
    sta    $97                   ; 3
    sta    $B7                   ; 3
    lda    $C6                   ; 3
    and    #$07                  ; 2
    bne    LF442                 ; 2³
    lda    $8F                   ; 3
    eor    #$08                  ; 2
    sta    $8F                   ; 3
    lda    $8E                   ; 3
    eor    #$08                  ; 2
    sta    $8E                   ; 3
    lda    $90                   ; 3
    eor    #$08                  ; 2
    sta    $90                   ; 3
    lda    $B2                   ; 3
    eor    #$04                  ; 2
    sta    $B2                   ; 3
LF442:
    lda    $C6                   ; 3
    and    #$0F                  ; 2
    bne    LF44E                 ; 2³
    lda    $B4                   ; 3
    eor    #$08                  ; 2
    sta    $B4                   ; 3
LF44E:
    lda    $CB                   ; 3
    bne    LF46A                 ; 2³
    lda    #9                    ; 2
    sta    $CB                   ; 3
    clc                          ; 2
    lda    $CC                   ; 3
    adc    #8                    ; 2
    cmp    #$20                  ; 2
    bcs    LF464                 ; 2³
    sta    $CC                   ; 3
    jmp    LF46C                 ; 3
LF464:
    lda    #0                    ; 2
    sta    $CC                   ; 3
    beq    LF46C                 ; 2³
LF46A:
    dec    $CB                   ; 5
LF46C:
    lda    $CC                   ; 3
    and    #$F8                  ; 2
    clc                          ; 2
    adc    #$C0                  ; 2
    sta    $9E                   ; 3
    sta    $A0                   ; 3
    sta    $A2                   ; 3
    lda    #$B8                  ; 2
    sta    $91                   ; 3
    sta    $92                   ; 3
    sta    $93                   ; 3
    ldx    #2                    ; 2
    ldy    #8                    ; 2
LF485:
    lda    $B8,X                 ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    adc    #8                    ; 2
    sta.wy $A4,Y                 ; 5
    lda    $B8,X                 ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #8                    ; 2
    sta.wy $A6,Y                 ; 5
    lda    #$FB                  ; 2
    sta.wy $A5,Y                 ; 5
    sta.wy $A7,Y                 ; 5
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    dex                          ; 2
    bpl    LF485                 ; 2³
    ldx    #0                    ; 2
LF4AC:
    lda.wx $A4,X                 ; 4
    eor    #$08                  ; 2
    bne    LF4BC                 ; 2³
    sta.wx $A4,X                 ; 5
    inx                          ; 2
    inx                          ; 2
    cpx    #$0A                  ; 2
    bcc    LF4AC                 ; 2³
LF4BC:
    lda    #5                    ; 2
    sta    $C8                   ; 3
    sta    $CA                   ; 3
    lda    $CE                   ; 3
    beq    LF4E4                 ; 2³
    dec    $CF                   ; 5
    bne    LF503                 ; 2³+1
    lda    #$0C                  ; 2
    sta    $CF                   ; 3
    sec                          ; 2
    lda    $CE                   ; 3
    sbc    #8                    ; 2
    sta    $CE                   ; 3
    sec                          ; 2
    cmp    #8                    ; 2
    bcs    LF503                 ; 2³+1
    lda    #$20                  ; 2
    sta    $EC                   ; 3
    lda    #0                    ; 2
    sta    $CE                   ; 3
    bne    LF50D                 ; 2³+1
LF4E4:
    lda    $C4                   ; 3
    cmp    #$80                  ; 2
    bcc    LF4EF                 ; 2³
    lda    CXM1P                 ; 3
    asl                          ; 2
    bcs    LF4FB                 ; 2³
LF4EF:
    lda    $C5                   ; 3
    cmp    #$80                  ; 2
    bcc    LF50D                 ; 2³+1
    lda    CXP0FB                ; 3
    asl                          ; 2
    asl                          ; 2
    bcc    LF50D                 ; 2³+1
LF4FB:
    lda    #$0C                  ; 2
    sta    $CF                   ; 3
    lda    #$38                  ; 2
    sta    $CE                   ; 3
LF503:
    lda.w  $CE                   ; 4
    lsr                          ; 2
    sta    $B2                   ; 3
    lda    $CE                   ; 3
    sta    $B4                   ; 3
LF50D:
    lda    $D3                   ; 3
    beq    LF52A                 ; 2³
    dec    $D0                   ; 5
    bne    LF546                 ; 2³
    lda    #8                    ; 2
    sta    $D0                   ; 3
    sec                          ; 2
    lda    $D3                   ; 3
    sbc    #8                    ; 2
    sta    $D3                   ; 3
    cmp    #$40                  ; 2
    bcs    LF546                 ; 2³
    lda    #0                    ; 2
    sta    $D3                   ; 3
    beq    LF546                 ; 2³
LF52A:
    lda    $C3                   ; 3
    cmp    #$48                  ; 2
    bcc    LF54A                 ; 2³
    lda    CXM0P                 ; 3
    asl                          ; 2
    bcc    LF54A                 ; 2³
    lda    #0                    ; 2
    sta    $C3                   ; 3
    lda    #8                    ; 2
    sta    $D0                   ; 3
    lda    #$58                  ; 2
    sta    $D3                   ; 3
    lda    #$10                  ; 2
    jsr    LF8A5                 ; 6
LF546:
    lda    $D3                   ; 3
    sta    $8E                   ; 3
LF54A:
    lda    $D5                   ; 3
    beq    LF567                 ; 2³
    dec    $D2                   ; 5
    bne    LF585                 ; 2³
    lda    #8                    ; 2
    sta    $D2                   ; 3
    sec                          ; 2
    lda    $D5                   ; 3
    sbc    #8                    ; 2
    sta    $D5                   ; 3
    cmp    #$50                  ; 2
    bcs    LF585                 ; 2³
    lda    #0                    ; 2
    sta    $D5                   ; 3
    beq    LF585                 ; 2³
LF567:
    lda    $C3                   ; 3
    beq    LF589                 ; 2³
    cmp    #$28                  ; 2
    bcs    LF589                 ; 2³
    lda    CXM0P                 ; 3
    asl                          ; 2
    bcc    LF589                 ; 2³
    lda    #0                    ; 2
    sta    $C3                   ; 3
    lda    #8                    ; 2
    sta    $D2                   ; 3
    lda    #$68                  ; 2
    sta    $D5                   ; 3
    lda    #$30                  ; 2
    jsr    LF8A5                 ; 6
LF585:
    lda    $D5                   ; 3
    sta    $90                   ; 3
LF589:
    lda    $D1                   ; 3
    beq    LF58F                 ; 2³
    dec    $D1                   ; 5
LF58F:
    lda    $C3                   ; 3
    cmp    #$28                  ; 2
    bcc    LF5F2                 ; 2³
    lda    CXM0P                 ; 3
    asl                          ; 2
    bcc    LF5F2                 ; 2³
    lda    #0                    ; 2
    sta    $C3                   ; 3
    lda    #$10                  ; 2
    sta    $D1                   ; 3
    lda    #$50                  ; 2
    jsr    LF8A5                 ; 6
    lda    $85                   ; 3
    adc    #8                    ; 2
    sta    $80                   ; 3
    lda.w  $88                   ; 4
    cmp    $80                   ; 3
    bcc    LF5E7                 ; 2³
    lda    $85                   ; 3
    adc    #$18                  ; 2
    sta    $80                   ; 3
    lda    $C9                   ; 3
    cmp    #3                    ; 2
    beq    LF5C8                 ; 2³
    cmp    #6                    ; 2
    beq    LF5D4                 ; 2³
    lda    #0                    ; 2
    beq    LF5F0                 ; 2³
LF5C8:
    lda    #2                    ; 2
    ldy    $88                   ; 3
    cpy    $80                   ; 3
    bcc    LF5F0                 ; 2³
    lda    #1                    ; 2
    bne    LF5F0                 ; 2³
LF5D4:
    lda.w  $85                   ; 4
    adc    #$28                  ; 2
    sta    $80                   ; 3
    lda    #4                    ; 2
    ldy    $88                   ; 3
    cpy    $80                   ; 3
    bcc    LF5F0                 ; 2³
    lda    #2                    ; 2
    bne    LF5F0                 ; 2³
LF5E7:
    ldy    $85                   ; 3
    lda    $C9                   ; 3
    jsr    LF85B                 ; 6
    sty    $85                   ; 3
LF5F0:
    sta    $C9                   ; 3
LF5F2:
    lda    $C3                   ; 3
    cmp    #4                    ; 2
    bcc    LF62A                 ; 2³+1
    ldy    #$E0                  ; 2
    cmp    #$91                  ; 2
    bcs    LF612                 ; 2³+1
    ldy    #0                    ; 2
    cmp    #$8C                  ; 2
    bcs    LF612                 ; 2³
    ldy    #$E4                  ; 2
    cmp    #$88                  ; 2
    bcs    LF612                 ; 2³
    ldy    #$E8                  ; 2
    cmp    #$84                  ; 2
    bcs    LF612                 ; 2³
    ldy    #0                    ; 2
LF612:
    sty    $9A                   ; 3
    lda.w  $C6                   ; 4
    and    #$01                  ; 2
    bne    LF622                 ; 2³
    lda    $C3                   ; 3
    sec                          ; 2
    sbc    $DB                   ; 3
    sta    $C3                   ; 3
LF622:
    lda    $C3                   ; 3
    cmp    #$80                  ; 2
    bcs    LF653                 ; 2³
    bcc    LF633                 ; 2³
LF62A:
    lda    #0                    ; 2
    sta    $9A                   ; 3
    lda.w  $CE                   ; 4
    bne    LF653                 ; 2³
LF633:
    lda    $B4                   ; 3
    and    #$F7                  ; 2
    beq    LF653                 ; 2³
    lda    INPT4                 ; 3
    ldy    $E4                   ; 3
    beq    LF641                 ; 2³
    lda    INPT5                 ; 3
LF641:
    asl                          ; 2
    bcs    LF653                 ; 2³
    lda    #$92                  ; 2
    sta    $C3                   ; 3
    lda    #$E0                  ; 2
    sta    $C2                   ; 3
    sec                          ; 2
    lda    $83                   ; 3
    sbc    #4                    ; 2
    sta    $88                   ; 3
LF653:
    lda    $C6                   ; 3
    and    #$03                  ; 2
    bne    LF679                 ; 2³
    lda    $C4                   ; 3
    cmp    #$A8                  ; 2
    bcc    LF670                 ; 2³
    lda    $8E                   ; 3
    and    #$F7                  ; 2
    beq    LF679                 ; 2³
    clc                          ; 2
    lda    $84                   ; 3
    adc    #2                    ; 2
    sta    $89                   ; 3
    lda    #$5F                  ; 2
    sta    $C4                   ; 3
LF670:
    clc                          ; 2
    lda    $C4                   ; 3
    adc    $D9                   ; 3
    adc    $E0                   ; 3
    sta    $C4                   ; 3
LF679:
    lda    $C6                   ; 3
    and    #$01                  ; 2
    bne    LF69F                 ; 2³
    lda    $C5                   ; 3
    cmp    #$A8                  ; 2
    bcc    LF696                 ; 2³
    lda    $90                   ; 3
    and    #$F7                  ; 2
    beq    LF69F                 ; 2³
    clc                          ; 2
    lda    $86                   ; 3
    adc    #4                    ; 2
    sta    $8A                   ; 3
    lda    #7                    ; 2
    sta    $C5                   ; 3
LF696:
    clc                          ; 2
    lda    $C5                   ; 3
    adc    $DA                   ; 3
    adc    $E0                   ; 3
    sta    $C5                   ; 3
LF69F:
    ldx    #2                    ; 2
LF6A1:
    lda    $C3,X                 ; 4
    and    #$FC                  ; 2
    sta    $8B,X                 ; 4
    dex                          ; 2
    bpl    LF6A1                 ; 2³
    lda    $98                   ; 3
    bne    LF6B1                 ; 2³
    jmp    LF75F                 ; 3
LF6B1:
    lda    #8                    ; 2
    sta    AUDC0                 ; 3
    lda    #7                    ; 2
    ldy    $C3                   ; 3
    beq    LF6C3                 ; 2³
    cpy    #$88                  ; 2
    bcs    LF6C7                 ; 2³
    cpy    #$50                  ; 2
    bcs    LF6CD                 ; 2³
LF6C3:
    lda    #0                    ; 2
    beq    LF6CD                 ; 2³
LF6C7:
    ldy    #$0C                  ; 2
    sty    AUDC0                 ; 3
    lda    #$0B                  ; 2
LF6CD:
    sta    AUDV0                 ; 3
    lda    $C3                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDF0                 ; 3
    lda    #0                    ; 2
    sta    AUDV1                 ; 3
    ldy    $C4                   ; 3
    beq    LF6F1                 ; 2³
    cpy    #$70                  ; 2
    bcs    LF6F1                 ; 2³
    lda    #5                    ; 2
    sta    AUDV1                 ; 3
    lda    $C4                   ; 3
    eor    #$0F                  ; 2
    sta    AUDF1                 ; 3
    lda    #4                    ; 2
    sta    AUDC1                 ; 3
LF6F1:
    ldy    $C5                   ; 3
    beq    LF705                 ; 2³+1
    cpy    #$20                  ; 2
    bcs    LF705                 ; 2³+1
    lda    #5                    ; 2
    sta    AUDV1                 ; 3
    lda    $C5                   ; 3
    sta    AUDF1                 ; 3
    lda    #$0C                  ; 2
    sta    AUDC1                 ; 3
LF705:
    lda    $CE                   ; 3
    beq    LF718                 ; 2³
    lda    #8                    ; 2
    sta    AUDC0                 ; 3
    lda    $CE                   ; 3
    ora    $CF                   ; 3
    lsr                          ; 2
    sta    AUDV0                 ; 3
    eor    #$FF                  ; 2
    sta    AUDF0                 ; 3
LF718:
    lda    $D3                   ; 3
    beq    LF72C                 ; 2³
    lda    #8                    ; 2
    sta    AUDC1                 ; 3
    lda    $D3                   ; 3
    ora    $D0                   ; 3
    asl                          ; 2
    asl                          ; 2
    sta    AUDV1                 ; 3
    eor    #$1F                  ; 2
    sta    AUDF1                 ; 3
LF72C:
    lda    $D5                   ; 3
    beq    LF73F                 ; 2³
    lda    #8                    ; 2
    sta    AUDC1                 ; 3
    lda    $D5                   ; 3
    ora    $D2                   ; 3
    lsr                          ; 2
    sta    AUDV1                 ; 3
    eor    #$0F                  ; 2
    sta    AUDF1                 ; 3
LF73F:
    lda    $D1                   ; 3
    beq    LF74D                 ; 2³
    sta    AUDV1                 ; 3
    lda    #4                    ; 2
    sta    AUDC1                 ; 3
    lda    $D1                   ; 3
    sta    AUDF1                 ; 3
LF74D:
    lda    $ED                   ; 3
    beq    LF75F                 ; 2³
    dec    $ED                   ; 5
    lda    $ED                   ; 3
    sta    AUDF1                 ; 3
    lda    #4                    ; 2
    sta    AUDC1                 ; 3
    lda    #$0C                  ; 2
    sta    AUDV1                 ; 3
LF75F:
    lda    INTIM                 ; 4
    bne    LF75F                 ; 2³
    lda    #$82                  ; 2
    sta    WSYNC                 ; 3
    sta    VBLANK                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    VSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    lda    #0                    ; 2
    sta    VSYNC                 ; 3
    lda    #$2C                  ; 2
    sta    TIM64T                ; 4
    lda    SWCHA                 ; 4
    ldy    $E4                   ; 3
    beq    LF78C                 ; 2³
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
LF78C:
    ldy    $83                   ; 3
    asl                          ; 2
    bcs    LF799                 ; 2³
    cpy    #$90                  ; 2
    bcs    LF7A1                 ; 2³
    iny                          ; 2
    jmp    LF7A1                 ; 3
LF799:
    asl                          ; 2
    bcs    LF7A1                 ; 2³
    cpy    #8                    ; 2
    bcc    LF7A1                 ; 2³
    dey                          ; 2
LF7A1:
    sty    $83                   ; 3
    lda    $D6                   ; 3
    beq    LF7AC                 ; 2³
    dec    $D6                   ; 5
    jmp    LF7C4                 ; 3
LF7AC:
    lda    $DC                   ; 3
    sta    $D6                   ; 3
    sta    $82                   ; 3
    lda    $84                   ; 3
    sec                          ; 2
    sbc    $82                   ; 3
    tay                          ; 2
    cpy    #4                    ; 2
    bcs    LF7C2                 ; 2³
    lda    #$70                  ; 2
    sta    $8E                   ; 3
    ldy    #$A0                  ; 2
LF7C2:
    sty    $84                   ; 3
LF7C4:
    lda    $D7                   ; 3
    beq    LF7CD                 ; 2³
    dec    $D7                   ; 5
    jmp    LF7E6                 ; 3
LF7CD:
    lda    $DD                   ; 3
    sta    $D7                   ; 3
    sta    $82                   ; 3
    lda    $85                   ; 3
    sec                          ; 2
    sbc    $82                   ; 3
    tay                          ; 2
    cpy    #4                    ; 2
    bcs    LF7E4                 ; 2³
    lda    $C9                   ; 3
    jsr    LF85B                 ; 6
    sta    $C9                   ; 3
LF7E4:
    sty    $85                   ; 3
LF7E6:
    lda    $D8                   ; 3
    beq    LF7EF                 ; 2³
    dec    $D8                   ; 5
    jmp    LF807                 ; 3
LF7EF:
    lda    $DE                   ; 3
    sta    $D8                   ; 3
    sta    $82                   ; 3
    sec                          ; 2
    lda    $86                   ; 3
    sbc    $82                   ; 3
    tay                          ; 2
    cpy    #4                    ; 2
    bcs    LF805                 ; 2³+1
    lda    #$80                  ; 2
    sta    $90                   ; 3
    ldy    #$A0                  ; 2
LF805:
    sty    $86                   ; 3
LF807:
    lda    $C6                   ; 3
    and    #$0F                  ; 2
    bne    LF82E                 ; 2³
    lda    $C6                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFB9D,Y               ; 4
    sta    $F0                   ; 3
    lda    $84                   ; 3
    eor.w  $85                   ; 4
    eor.w  $86                   ; 4
    and    #$7F                  ; 2
    sta    $EF                   ; 3
    lda.w  $9C                   ; 4
    eor    #$08                  ; 2
    sta    $9C                   ; 3
LF82E:
    jmp    LF082                 ; 3
LF831:
    clc                          ; 2
    adc    #$2E                  ; 2
    tay                          ; 2
    and    #$0F                  ; 2
    sta.w  $82                   ; 4
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    clc                          ; 2
    adc.w  $82                   ; 4
    cmp    #$0F                  ; 2
    bcc    LF84B                 ; 2³
    sbc    #$0F                  ; 2
    iny                          ; 2
LF84B:
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0,X                ; 4
    sta    WSYNC                 ; 3
LF855:
    dey                          ; 2
    bpl    LF855                 ; 2³
    sta    RESP0,X               ; 4
    rts                          ; 6

LF85B:
    ldx    #6                    ; 2
LF85D:
    cmp    LFB88,X               ; 4
    beq    LF86B                 ; 2³
    dex                          ; 2
    bpl    LF85D                 ; 2³
    ldy    #$98                  ; 2
    lda    #0                    ; 2
    beq    LF884                 ; 2³
LF86B:
    clc                          ; 2
    tya                          ; 2
    adc    LFB8F,X               ; 4
    tay                          ; 2
    lda    LFB96,X               ; 4
    cmp    #$FF                  ; 2
    bne    LF884                 ; 2³
    lda    $83                   ; 3
    adc    $86                   ; 3
    and    #$07                  ; 2
    cmp    #7                    ; 2
    bne    LF884                 ; 2³
    lda    #0                    ; 2
LF884:
    rts                          ; 6

LF885:
    lda    $E1                   ; 3
    beq    LF8A4                 ; 2³
    lda    SWCHA                 ; 4
    ldy    $E4                   ; 3
    bne    LF894                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
LF894:
    lsr                          ; 2
    bcs    LF8A4                 ; 2³
    lda    #$A0                  ; 2
    sta    $B4                   ; 3
    lda    #$B0                  ; 2
    sta    $B2                   ; 3
    dec    $E1                   ; 5
    jsr    LF96B                 ; 6
LF8A4:
    rts                          ; 6

LF8A5:
    tay                          ; 2
    lda    $B9                   ; 3
    and    #$F0                  ; 2
    sta    $82                   ; 3
    tya                          ; 2
    clc                          ; 2
    ldx    #2                    ; 2
    sed                          ; 2
LF8B1:
    adc.wx $B8,X                 ; 4
    sta    $B8,X                 ; 4
    lda    #0                    ; 2
    dex                          ; 2
    bpl    LF8B1                 ; 2³
    lda    $B8                   ; 3
    bne    LF8C5                 ; 2³
    lda    $B9                   ; 3
    cmp    #$50                  ; 2
    bcc    LF8C7                 ; 2³
LF8C5:
    lda    #$50                  ; 2
LF8C7:
    and    #$F0                  ; 2
    clc                          ; 2
    ldx    #2                    ; 2
LF8CC:
    adc.wx $B8,X                 ; 4
    sta    $B8,X                 ; 4
    lda    #0                    ; 2
    dex                          ; 2
    bpl    LF8CC                 ; 2³
    cld                          ; 2
    lda    $B9                   ; 3
    and    #$F0                  ; 2
    cmp    $82                   ; 3
    beq    LF8EE                 ; 2³
    lda    #$2F                  ; 2
    sta    $ED                   ; 3
    lda    $E1                   ; 3
    cmp    #9                    ; 2
    bcs    LF8EE                 ; 2³
    inc    $E1                   ; 5
    jsr    LF96B                 ; 6
LF8EE:
    lda    $B9                   ; 3
    cmp    $DF                   ; 3
    beq    LF918                 ; 2³+1
    sta    $DF                   ; 3
    adc    $BA                   ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    tay                          ; 2
    lda    LFBAD,Y               ; 4
    sta    $DC                   ; 3
    lda    LFBB5,Y               ; 4
    sta    $DD                   ; 3
    lda    LFBBD,Y               ; 4
    sta    $DE                   ; 3
    lda    LFBC5,Y               ; 4
    sta    $D9                   ; 3
    lda    LFBCD,Y               ; 4
    sta    $DA                   ; 3
LF918:
    rts                          ; 6

LF919:
    lda    $EB                   ; 3
    and    #$01                  ; 2
    beq    LF96A                 ; 2³
    lda    $E4                   ; 3
    beq    LF943                 ; 2³
    ldx    #2                    ; 2
LF925:
    lda    $B8,X                 ; 4
    sta    $E5,X                 ; 4
    dex                          ; 2
    bpl    LF925                 ; 2³
    lda    $E1                   ; 3
    sta    $E2                   ; 3
    lda    $E3                   ; 3
    sta    $E1                   ; 3
    ldx    #2                    ; 2
LF936:
    lda    $E8,X                 ; 4
    sta    $B8,X                 ; 4
    dex                          ; 2
    bpl    LF936                 ; 2³
    lda    #0                    ; 2
    sta    $E4                   ; 3
    beq    LF961                 ; 2³
LF943:
    ldx    #2                    ; 2
LF945:
    lda    $B8,X                 ; 4
    sta    $E8,X                 ; 4
    dex                          ; 2
    bpl    LF945                 ; 2³
    lda    $E1                   ; 3
    sta    $E3                   ; 3
    lda    $E2                   ; 3
    sta    $E1                   ; 3
    ldx    #2                    ; 2
LF956:
    lda    $E5,X                 ; 4
    sta    $B8,X                 ; 4
    dex                          ; 2
    bpl    LF956                 ; 2³
    lda    #1                    ; 2
    sta    $E4                   ; 3
LF961:
    lda    $E1                   ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #8                    ; 2
    sta    $96                   ; 3
LF96A:
    rts                          ; 6

LF96B:
    lda.w  $E1                   ; 4
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #8                    ; 2
    sta    $96                   ; 3
    rts                          ; 6

LF976:
    .byte $38,$48,$5A,$32,$36,$1A,$05,$24,$12,$44,$64,$5A,$7C,$6A,$86,$3F
    .byte $93,$6A,$5F,$44,$1A,$24,$42,$74,$B3,$DE,$EC,$E2,$86,$70,$52,$6D
    .byte $B4,$C6,$C0,$A0,$C6,$E2,$B8,$64,$38,$22,$44,$88,$54,$78,$A4,$C1
    .byte $D8,$C8,$C1,$92,$02,$01,$03,$05,$03,$04,$04,$01,$2E,$C8,$C8,$64
    .byte $C8,$2E,$64,$BA,$03,$05,$05,$08,$05,$03,$08,$04,$07,$06,$05,$05
    .byte $04,$04,$03,$03,$02,$01,$03,$04,$05,$01,$04,$02,$CB,$A5,$CC,$29
    .byte $F8,$18,$69,$C0,$85,$9E,$85,$A0,$85,$A2,$A9,$B8,$85,$91,$85,$92
    .byte $85,$93,$A2,$02,$A0,$08,$B5,$B8,$29,$F0,$4A,$69,$08,$99,$A4,$00
    .byte $B5,$B8,$29,$0F,$0A,$0A,$FF,$FF,$FF,$FF
    .byte $00 ; |        | $FA00
    .byte $00 ; |        | $FA01
    .byte $00 ; |        | $FA02
    .byte $00 ; |        | $FA03
    .byte $00 ; |        | $FA04
    .byte $00 ; |        | $FA05
    .byte $00 ; |        | $FA06
    .byte $00 ; |        | $FA07
    .byte $00 ; |        | $FA08
    .byte $00 ; |        | $FA09
    .byte $00 ; |        | $FA0A
    .byte $00 ; |        | $FA0B
    .byte $00 ; |        | $FA0C
    .byte $00 ; |        | $FA0D
    .byte $00 ; |        | $FA0E
    .byte $00 ; |        | $FA0F
    .byte $00 ; |        | $FA10
    .byte $00 ; |        | $FA11
    .byte $00 ; |        | $FA12
    .byte $08 ; |    X   | $FA13
    .byte $14 ; |   X X  | $FA14
    .byte $08 ; |    X   | $FA15
    .byte $00 ; |        | $FA16
    .byte $00 ; |        | $FA17
    .byte $10 ; |   X    | $FA18
    .byte $44 ; | X   X  | $FA19
    .byte $00 ; |        | $FA1A
    .byte $82 ; |X     X | $FA1B
    .byte $00 ; |        | $FA1C
    .byte $44 ; | X   X  | $FA1D
    .byte $10 ; |   X    | $FA1E
    .byte $00 ; |        | $FA1F
    .byte $00 ; |        | $FA20
    .byte $00 ; |        | $FA21
    .byte $00 ; |        | $FA22
    .byte $08 ; |    X   | $FA23
    .byte $14 ; |   X X  | $FA24
    .byte $08 ; |    X   | $FA25
    .byte $00 ; |        | $FA26
    .byte $00 ; |        | $FA27
    .byte $10 ; |   X    | $FA28
    .byte $44 ; | X   X  | $FA29
    .byte $00 ; |        | $FA2A
    .byte $82 ; |X     X | $FA2B
    .byte $00 ; |        | $FA2C
    .byte $44 ; | X   X  | $FA2D
    .byte $10 ; |   X    | $FA2E
    .byte $00 ; |        | $FA2F
    .byte $5A ; | X XX X | $FA30
    .byte $A5 ; |X X  X X| $FA31
    .byte $5A ; | X XX X | $FA32
    .byte $BD ; |X XXXX X| $FA33
    .byte $BD ; |X XXXX X| $FA34
    .byte $5A ; | X XX X | $FA35
    .byte $A5 ; |X X  X X| $FA36
    .byte $5A ; | X XX X | $FA37
    .byte $81 ; |X      X| $FA38
    .byte $5A ; | X XX X | $FA39
    .byte $24 ; |  X  X  | $FA3A
    .byte $42 ; | X    X | $FA3B
    .byte $42 ; | X    X | $FA3C
    .byte $24 ; |  X  X  | $FA3D
    .byte $5A ; | X XX X | $FA3E
    .byte $81 ; |X      X| $FA3F
    .byte $08 ; |    X   | $FA40
    .byte $40 ; | X      | $FA41
    .byte $10 ; |   X    | $FA42
    .byte $00 ; |        | $FA43
    .byte $00 ; |        | $FA44
    .byte $00 ; |        | $FA45
    .byte $00 ; |        | $FA46
    .byte $00 ; |        | $FA47
    .byte $40 ; | X      | $FA48
    .byte $14 ; |   X X  | $FA49
    .byte $00 ; |        | $FA4A
    .byte $40 ; | X      | $FA4B
    .byte $0A ; |    X X | $FA4C
    .byte $10 ; |   X    | $FA4D
    .byte $00 ; |        | $FA4E
    .byte $00 ; |        | $FA4F
    .byte $00 ; |        | $FA50
    .byte $00 ; |        | $FA51
    .byte $04 ; |     X  | $FA52
    .byte $40 ; | X      | $FA53
    .byte $40 ; | X      | $FA54
    .byte $14 ; |   X X  | $FA55
    .byte $4A ; | X  X X | $FA56
    .byte $10 ; |   X    | $FA57
    .byte $10 ; |   X    | $FA58
    .byte $54 ; | X X X  | $FA59
    .byte $28 ; |  X X   | $FA5A
    .byte $C6 ; |XX   XX | $FA5B
    .byte $28 ; |  X X   | $FA5C
    .byte $54 ; | X X X  | $FA5D
    .byte $10 ; |   X    | $FA5E
    .byte $00 ; |        | $FA5F
    .byte $00 ; |        | $FA60
    .byte $10 ; |   X    | $FA61
    .byte $28 ; |  X X   | $FA62
    .byte $44 ; | X   X  | $FA63
    .byte $10 ; |   X    | $FA64
    .byte $00 ; |        | $FA65
    .byte $00 ; |        | $FA66
    .byte $00 ; |        | $FA67
    .byte $00 ; |        | $FA68
    .byte $00 ; |        | $FA69
    .byte $00 ; |        | $FA6A
    .byte $08 ; |    X   | $FA6B
    .byte $14 ; |   X X  | $FA6C
    .byte $08 ; |    X   | $FA6D
    .byte $00 ; |        | $FA6E
    .byte $00 ; |        | $FA6F
    .byte $00 ; |        | $FA70
    .byte $CC ; |XX  XX  | $FA71
    .byte $22 ; |  X   X | $FA72
    .byte $3C ; |  XXXX  | $FA73
    .byte $56 ; | X X XX | $FA74
    .byte $3C ; |  XXXX  | $FA75
    .byte $00 ; |        | $FA76
    .byte $00 ; |        | $FA77
    .byte $00 ; |        | $FA78
    .byte $33 ; |  XX  XX| $FA79
    .byte $44 ; | X   X  | $FA7A
    .byte $3C ; |  XXXX  | $FA7B
    .byte $6A ; | XX X X | $FA7C
    .byte $3C ; |  XXXX  | $FA7D
    .byte $00 ; |        | $FA7E
    .byte $00 ; |        | $FA7F
    .byte $30 ; |  XX    | $FA80
    .byte $28 ; |  X X   | $FA81
    .byte $98 ; |X  XX   | $FA82
    .byte $60 ; | XX     | $FA83
    .byte $60 ; | XX     | $FA84
    .byte $98 ; |X  XX   | $FA85
    .byte $28 ; |  X X   | $FA86
    .byte $20 ; |  X     | $FA87
    .byte $04 ; |     X  | $FA88
    .byte $09 ; |    X  X| $FA89
    .byte $5F ; | X XXXXX| $FA8A
    .byte $30 ; |  XX    | $FA8B
    .byte $30 ; |  XX    | $FA8C
    .byte $5F ; | X XXXXX| $FA8D
    .byte $09 ; |    X  X| $FA8E
    .byte $04 ; |     X  | $FA8F
    .byte $00 ; |        | $FA90
    .byte $40 ; | X      | $FA91
    .byte $34 ; |  XX X  | $FA92
    .byte $3E ; |  XXXXX | $FA93
    .byte $7B ; | XXXX XX| $FA94
    .byte $D2 ; |XX X  X | $FA95
    .byte $03 ; |      XX| $FA96
    .byte $00 ; |        | $FA97
    .byte $03 ; |      XX| $FA98
    .byte $0E ; |    XXX | $FA99
    .byte $7B ; | XXXX XX| $FA9A
    .byte $38 ; |  XXX   | $FA9B
    .byte $78 ; | XXXX   | $FA9C
    .byte $D0 ; |XX X    | $FA9D
    .byte $50 ; | X X    | $FA9E
    .byte $00 ; |        | $FA9F
    .byte $00 ; |        | $FAA0
    .byte $18 ; |   XX   | $FAA1
    .byte $3C ; |  XXXX  | $FAA2
    .byte $6E ; | XX XXX | $FAA3
    .byte $FE ; |XXXXXXX | $FAA4
    .byte $9F ; |X  XXXXX| $FAA5
    .byte $02 ; |      X | $FAA6
    .byte $28 ; |  X X   | $FAA7
    .byte $00 ; |        | $FAA8
    .byte $00 ; |        | $FAA9
    .byte $18 ; |   XX   | $FAAA
    .byte $3C ; |  XXXX  | $FAAB
    .byte $76 ; | XXX XX | $FAAC
    .byte $FE ; |XXXXXXX | $FAAD
    .byte $9F ; |X  XXXXX| $FAAE
    .byte $02 ; |      X | $FAAF
    .byte $20 ; |  X     | $FAB0
    .byte $10 ; |   X    | $FAB1
    .byte $04 ; |     X  | $FAB2
    .byte $00 ; |        | $FAB3
    .byte $10 ; |   X    | $FAB4
    .byte $08 ; |    X   | $FAB5
    .byte $00 ; |        | $FAB6
    .byte $02 ; |      X | $FAB7
    .byte $FF ; |XXXXXXXX| $FAB8
    .byte $DE ; |XX XXXX | $FAB9
    .byte $CF ; |XX  XXXX| $FABA
    .byte $73 ; | XXX  XX| $FABB
    .byte $D3 ; |XX X  XX| $FABC
    .byte $98 ; |X  XX   | $FABD
    .byte $1C ; |   XXX  | $FABE
    .byte $08 ; |    X   | $FABF
    .byte $00 ; |        | $FAC0
    .byte $00 ; |        | $FAC1
    .byte $00 ; |        | $FAC2
    .byte $26 ; |  X  XX | $FAC3
    .byte $FF ; |XXXXXXXX| $FAC4
    .byte $FA ; |XXXXX X | $FAC5
    .byte $70 ; | XXX    | $FAC6
    .byte $00 ; |        | $FAC7
    .byte $00 ; |        | $FAC8
    .byte $00 ; |        | $FAC9
    .byte $70 ; | XXX    | $FACA
    .byte $F8 ; |XXXXX   | $FACB
    .byte $FB ; |XXXXX XX| $FACC
    .byte $2F ; |  X XXXX| $FACD
    .byte $0E ; |    XXX | $FACE
    .byte $00 ; |        | $FACF
    .byte $00 ; |        | $FAD0
    .byte $00 ; |        | $FAD1
    .byte $60 ; | XX     | $FAD2
    .byte $FE ; |XXXXXXX | $FAD3
    .byte $FF ; |XXXXXXXX| $FAD4
    .byte $7B ; | XXXX XX| $FAD5
    .byte $31 ; |  XX   X| $FAD6
    .byte $00 ; |        | $FAD7
    .byte $06 ; |     XX | $FAD8
    .byte $1F ; |   XXXXX| $FAD9
    .byte $FF ; |XXXXXXXX| $FADA
    .byte $FE ; |XXXXXXX | $FADB
    .byte $7C ; | XXXXX  | $FADC
    .byte $78 ; | XXXX   | $FADD
    .byte $38 ; |  XXX   | $FADE
    .byte $00 ; |        | $FADF
    .byte $81 ; |X      X| $FAE0
    .byte $82 ; |X     X | $FAE1
    .byte $44 ; | X   X  | $FAE2
    .byte $38 ; |  XXX   | $FAE3
    .byte $A8 ; |X X X   | $FAE4
    .byte $20 ; |  X     | $FAE5
    .byte $50 ; | X X    | $FAE6
    .byte $00 ; |        | $FAE7
    .byte $40 ; | X      | $FAE8
    .byte $90 ; |X  X    | $FAE9
    .byte $00 ; |        | $FAEA
    .byte $00 ; |        | $FAEB
    .byte $00 ; |        | $FAEC
    .byte $00 ; |        | $FAED
    .byte $00 ; |        | $FAEE
    .byte $00 ; |        | $FAEF
    .byte $00 ; |        | $FAF0
    .byte $10 ; |   X    | $FAF1
    .byte $28 ; |  X X   | $FAF2
    .byte $44 ; | X   X  | $FAF3
    .byte $28 ; |  X X   | $FAF4
    .byte $10 ; |   X    | $FAF5
    .byte $00 ; |        | $FAF6
    .byte $00 ; |        | $FAF7
    .byte $00 ; |        | $FAF8
    .byte $00 ; |        | $FAF9
    .byte $24 ; |  X  X  | $FAFA
    .byte $42 ; | X    X | $FAFB
    .byte $42 ; | X    X | $FAFC
    .byte $24 ; |  X  X  | $FAFD
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
    .byte $3C ; |  XXXX  | $FB08
    .byte $66 ; | XX  XX | $FB09
    .byte $66 ; | XX  XX | $FB0A
    .byte $66 ; | XX  XX | $FB0B
    .byte $66 ; | XX  XX | $FB0C
    .byte $66 ; | XX  XX | $FB0D
    .byte $66 ; | XX  XX | $FB0E
    .byte $3C ; |  XXXX  | $FB0F
    .byte $3C ; |  XXXX  | $FB10
    .byte $18 ; |   XX   | $FB11
    .byte $18 ; |   XX   | $FB12
    .byte $18 ; |   XX   | $FB13
    .byte $18 ; |   XX   | $FB14
    .byte $18 ; |   XX   | $FB15
    .byte $38 ; |  XXX   | $FB16
    .byte $18 ; |   XX   | $FB17
    .byte $7E ; | XXXXXX | $FB18
    .byte $60 ; | XX     | $FB19
    .byte $60 ; | XX     | $FB1A
    .byte $3C ; |  XXXX  | $FB1B
    .byte $06 ; |     XX | $FB1C
    .byte $06 ; |     XX | $FB1D
    .byte $46 ; | X   XX | $FB1E
    .byte $3C ; |  XXXX  | $FB1F
    .byte $3C ; |  XXXX  | $FB20
    .byte $46 ; | X   XX | $FB21
    .byte $06 ; |     XX | $FB22
    .byte $0C ; |    XX  | $FB23
    .byte $0C ; |    XX  | $FB24
    .byte $06 ; |     XX | $FB25
    .byte $46 ; | X   XX | $FB26
    .byte $3C ; |  XXXX  | $FB27
    .byte $0C ; |    XX  | $FB28
    .byte $0C ; |    XX  | $FB29
    .byte $0C ; |    XX  | $FB2A
    .byte $7E ; | XXXXXX | $FB2B
    .byte $4C ; | X  XX  | $FB2C
    .byte $2C ; |  X XX  | $FB2D
    .byte $1C ; |   XXX  | $FB2E
    .byte $0C ; |    XX  | $FB2F
    .byte $7C ; | XXXXX  | $FB30
    .byte $46 ; | X   XX | $FB31
    .byte $06 ; |     XX | $FB32
    .byte $06 ; |     XX | $FB33
    .byte $7C ; | XXXXX  | $FB34
    .byte $60 ; | XX     | $FB35
    .byte $60 ; | XX     | $FB36
    .byte $7E ; | XXXXXX | $FB37
    .byte $3C ; |  XXXX  | $FB38
    .byte $66 ; | XX  XX | $FB39
    .byte $66 ; | XX  XX | $FB3A
    .byte $66 ; | XX  XX | $FB3B
    .byte $7C ; | XXXXX  | $FB3C
    .byte $60 ; | XX     | $FB3D
    .byte $62 ; | XX   X | $FB3E
    .byte $3C ; |  XXXX  | $FB3F
    .byte $18 ; |   XX   | $FB40
    .byte $18 ; |   XX   | $FB41
    .byte $18 ; |   XX   | $FB42
    .byte $18 ; |   XX   | $FB43
    .byte $0C ; |    XX  | $FB44
    .byte $06 ; |     XX | $FB45
    .byte $42 ; | X    X | $FB46
    .byte $7E ; | XXXXXX | $FB47
    .byte $3C ; |  XXXX  | $FB48
    .byte $66 ; | XX  XX | $FB49
    .byte $66 ; | XX  XX | $FB4A
    .byte $3C ; |  XXXX  | $FB4B
    .byte $3C ; |  XXXX  | $FB4C
    .byte $66 ; | XX  XX | $FB4D
    .byte $66 ; | XX  XX | $FB4E
    .byte $3C ; |  XXXX  | $FB4F
    .byte $3C ; |  XXXX  | $FB50
    .byte $46 ; | X   XX | $FB51
    .byte $06 ; |     XX | $FB52
    .byte $3E ; |  XXXXX | $FB53
    .byte $66 ; | XX  XX | $FB54
    .byte $66 ; | XX  XX | $FB55
    .byte $66 ; | XX  XX | $FB56
    .byte $3C ; |  XXXX  | $FB57
LFB58:
    .byte $4D ; | X  XX X| $FB58
    .byte $3D ; |  XXXX X| $FB59
LFB5A:
    .byte $9C ; |X  XXX  | $FB5A
    .byte $00 ; |        | $FB5B
LFB5C:
    .byte $D1 ; |XX X   X| $FB5C
    .byte $D1 ; |XX X   X| $FB5D
    .byte $D1 ; |XX X   X| $FB5E
    .byte $D1 ; |XX X   X| $FB5F
    .byte $00 ; |        | $FB60
    .byte $00 ; |        | $FB61
    .byte $00 ; |        | $FB62
    .byte $00 ; |        | $FB63
LFB64:
    .byte $00 ; |        | $FB64
    .byte $31 ; |  XX   X| $FB65
    .byte $49 ; | X  X  X| $FB66
    .byte $B5 ; |X XX X X| $FB67
    .byte $A5 ; |X X  X X| $FB68
    .byte $A5 ; |X X  X X| $FB69
    .byte $B5 ; |X XX X X| $FB6A
    .byte $49 ; | X  X  X| $FB6B
    .byte $31 ; |  XX   X| $FB6C
LFB6D:
    .byte $00 ; |        | $FB6D
    .byte $D2 ; |XX X  X | $FB6E
    .byte $D2 ; |XX X  X | $FB6F
    .byte $52 ; | X X  X | $FB70
    .byte $D2 ; |XX X  X | $FB71
    .byte $92 ; |X  X  X | $FB72
    .byte $D2 ; |XX X  X | $FB73
    .byte $57 ; | X X XXX| $FB74
    .byte $D7 ; |XX X XXX| $FB75
LFB76:
    .byte $00 ; |        | $FB76
    .byte $37 ; |  XX XXX| $FB77
    .byte $37 ; |  XX XXX| $FB78
    .byte $37 ; |  XX XXX| $FB79
    .byte $25 ; |  X  X X| $FB7A
    .byte $25 ; |  X  X X| $FB7B
    .byte $25 ; |  X  X X| $FB7C
    .byte $37 ; |  XX XXX| $FB7D
    .byte $37 ; |  XX XXX| $FB7E
LFB7F:
    .byte $00 ; |        | $FB7F
    .byte $54 ; | X X X  | $FB80
    .byte $54 ; | X X X  | $FB81
    .byte $64 ; | XX  X  | $FB82
    .byte $77 ; | XXX XXX| $FB83
    .byte $77 ; | XXX XXX| $FB84
    .byte $55 ; | X X X X| $FB85
    .byte $55 ; | X X X X| $FB86
    .byte $77 ; | XXX XXX| $FB87
LFB88:
    .byte $00 ; |        | $FB88
    .byte $01 ; |       X| $FB89
    .byte $02 ; |      X | $FB8A
    .byte $03 ; |      XX| $FB8B
    .byte $04 ; |     X  | $FB8C
    .byte $05 ; |     X X| $FB8D
    .byte $06 ; |     XX | $FB8E
LFB8F:
    .byte $9E ; |X  XXXX | $FB8F
    .byte $0F ; |    XXXX| $FB90
    .byte $1F ; |   XXXXX| $FB91
    .byte $0F ; |    XXXX| $FB92
    .byte $3F ; |  XXXXXX| $FB93
    .byte $9E ; |X  XXXX | $FB94
    .byte $1F ; |   XXXXX| $FB95
LFB96:
    .byte $FF ; |XXXXXXXX| $FB96
    .byte $00 ; |        | $FB97
    .byte $00 ; |        | $FB98
    .byte $01 ; |       X| $FB99
    .byte $00 ; |        | $FB9A
    .byte $FF ; |XXXXXXXX| $FB9B
    .byte $02 ; |      X | $FB9C
LFB9D:
    .byte $50 ; | X X    | $FB9D
    .byte $18 ; |   XX   | $FB9E
    .byte $10 ; |   X    | $FB9F
    .byte $20 ; |  X     | $FBA0
    .byte $48 ; | X  X   | $FBA1
    .byte $30 ; |  XX    | $FBA2
    .byte $20 ; |  X     | $FBA3
    .byte $40 ; | X      | $FBA4
    .byte $18 ; |   XX   | $FBA5
    .byte $20 ; |  X     | $FBA6
    .byte $40 ; | X      | $FBA7
    .byte $28 ; |  X X   | $FBA8
    .byte $38 ; |  XXX   | $FBA9
    .byte $18 ; |   XX   | $FBAA
    .byte $48 ; | X  X   | $FBAB
    .byte $18 ; |   XX   | $FBAC
LFBAD:
    .byte $05 ; |     X X| $FBAD
    .byte $02 ; |      X | $FBAE
    .byte $07 ; |     XXX| $FBAF
    .byte $04 ; |     X  | $FBB0
    .byte $08 ; |    X   | $FBB1
    .byte $03 ; |      XX| $FBB2
    .byte $01 ; |       X| $FBB3
    .byte $06 ; |     XX | $FBB4
LFBB5:
    .byte $03 ; |      XX| $FBB5
    .byte $08 ; |    X   | $FBB6
    .byte $01 ; |       X| $FBB7
    .byte $07 ; |     XXX| $FBB8
    .byte $05 ; |     X X| $FBB9
    .byte $06 ; |     XX | $FBBA
    .byte $08 ; |    X   | $FBBB
    .byte $02 ; |      X | $FBBC
LFBBD:
    .byte $01 ; |       X| $FBBD
    .byte $03 ; |      XX| $FBBE
    .byte $05 ; |     X X| $FBBF
    .byte $02 ; |      X | $FBC0
    .byte $08 ; |    X   | $FBC1
    .byte $04 ; |     X  | $FBC2
    .byte $06 ; |     XX | $FBC3
    .byte $07 ; |     XXX| $FBC4
LFBC5:
    .byte $01 ; |       X| $FBC5
    .byte $03 ; |      XX| $FBC6
    .byte $04 ; |     X  | $FBC7
    .byte $02 ; |      X | $FBC8
    .byte $05 ; |     X X| $FBC9
    .byte $03 ; |      XX| $FBCA
    .byte $02 ; |      X | $FBCB
    .byte $04 ; |     X  | $FBCC
LFBCD:
    .byte $05 ; |     X X| $FBCD
    .byte $04 ; |     X  | $FBCE
    .byte $05 ; |     X X| $FBCF
    .byte $07 ; |     XXX| $FBD0
    .byte $06 ; |     XX | $FBD1
    .byte $04 ; |     X  | $FBD2
    .byte $03 ; |      XX| $FBD3
    .byte $06 ; |     XX | $FBD4
LFBD5:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$88,$CA,$4A,$AA,$88
    .byte $AE,$2C,$2C,$08,$67,$64,$2B,$2C,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$62,$F9,$85,$8D,$A9
    .byte $08,$85,$CA,$A9,$30,$85,$8B,$D0,$04,$A9,$00,$85,$CA,$E6,$B3,$A5
    .byte $8C,$D0,$4D,$E6,$A9,$A5,$8F,$4A,$25,$A9,$D0,$44,$A5,$8E,$4A,$B0
    .byte $20,$C6,$A6,$C6,$A6,$E6,$A4,$A5,$A4,$29,$07,$85,$AA,$D0,$0F,$F8
    .byte $38,$A5,$D9,$E9,$10,$85,$D9,$A5,$D8,$E9,$00,$85,$D8,$D8,$4C,$49
    .byte $F4,$E6,$A6,$E6,$A6,$C6,$A4,$A5,$A4,$29,$07,$85,$AA,$C9,$07,$D0
    .byte $0F,$F8,$18,$A5,$D9,$69,$10,$85,$D9,$A5,$D8,$69,$00,$85,$D8,$D8
    .byte $A9,$FD,$85,$A7,$A9,$FA,$85,$AD,$85,$AF,$A5,$AA,$85,$A3,$A5,$8F
    .byte $4A,$25,$B3,$D0,$37,$A4,$8E,$A6,$90,$AD,$80,$02,$0A,$B0,$0E,$E0
    .byte $90,$B0,$0A,$E8,$E8,$98,$29,$03,$09,$08,$A8,$D0,$1B,$0A,$B0,$0E
    .byte $E0,$08,$90,$0A,$CA,$CA,$98,$29,$03,$09,$04,$A8,$D0,$0A,$0A,$B0
    .byte $02,$A0,$00,$0A,$B0,$02,$A0,$01,$84,$8E,$86,$90,$A5,$C9,$F0,$4E
    .byte $C9,$40,$F0,$02,$C6,$C9,$A6,$A1,$A4,$C6,$A5,$C7,$4A,$4A,$4A,$90
    .byte $0A,$CA,$CA,$CA,$CA,$E0,$18,$B0,$27,$90,$2B,$4A,$90,$0A,$E8,$E8
    .byte $E8,$E8,$E0,$80,$90,$1A,$B0,$1E,$A5,$C7,$4A,$90,$0B,$C8,$C8,$C8
    .byte $C8,$C0,$D0,$90,$0B,$4C,$DF,$F4,$88,$88,$88,$88,$C0,$68,$90,$06
    .byte $86,$A1,$84,$C6,$D0,$08,$A9,$00,$85,$A1,$85,$03,$05,$05,$08,$05
    .byte $03,$08,$04,$07,$06,$05,$05,$04,$04,$03,$03,$02,$01,$03,$04,$05
    .byte $01,$04,$02,$CB,$A5,$CC,$29,$F8,$18,$69,$C0,$85,$9E,$85,$A0,$85
    .byte $A2,$A9,$B8,$85,$91,$85,$92,$85,$93,$A2,$02,$A0,$08,$B5,$B8,$29
    .byte $F0,$4A,$69,$08,$99,$A4,$00,$B5,$B8,$29,$0F,$0A,$0A,$FF,$FF,$FF
    .byte $FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$08,$14,$08,$00,$00,$10,$44,$00,$82,$00,$44,$10
    .byte $00,$00,$00,$00,$08,$14,$08,$00,$00,$10,$44,$00,$82,$00,$44,$10
    .byte $00,$5A,$A5,$5A,$BD,$BD,$5A,$A5,$5A,$81,$5A,$24,$42,$42,$24,$5A
    .byte $81,$08,$40,$10,$00,$00,$00,$00,$00,$40,$14,$00,$40,$0A,$10,$00
    .byte $00,$00,$00,$04,$40,$40,$14,$4A,$10,$10,$54,$28,$C6,$28,$54,$10
    .byte $00,$00,$10,$28,$44,$10,$00,$00,$00,$00,$00,$00,$08,$14,$08,$00
    .byte $00,$00,$CC,$22,$3C,$56,$3C,$00,$00,$00,$33,$44,$3C,$6A,$3C,$00
    .byte $00,$30,$28,$98,$60,$60,$98,$28,$20,$04,$09,$5F,$30,$30,$5F,$09
    .byte $04,$00,$40,$34,$3E,$7B,$D2,$03,$00,$03,$0E,$7B,$38,$78,$D0,$50
    .byte $00,$00,$18,$3C,$6E,$FE,$9F,$02,$28,$00,$00,$18,$3C,$76,$FE,$9F
    .byte $02,$20,$10,$04,$00,$10,$08,$00,$02,$FF,$DE,$90,$A5,$D1,$F0,$02
    .byte $C6,$D1,$A5,$C3,$C9,$28,$90,$5D,$A5,$00,$0A,$90,$58,$A9,$00,$85
    .byte $C3,$A9,$10,$85,$D1,$A9,$50,$20,$A1,$F8,$A5,$85,$69,$08,$85,$80
    .byte $AD,$88,$00,$C5,$80,$90,$33,$A5,$85,$69,$18,$85,$80,$A5,$C9,$C9
    .byte $03,$F0,$08,$C9,$06,$F0,$10,$A9,$00,$F0,$28,$A9,$02,$A4,$88,$C4
    .byte $80,$90,$20,$A9,$01,$D0,$1C,$AD,$85,$00,$69,$28,$85,$80,$A9,$04
    .byte $A4,$88,$C4,$80,$90,$0D,$A9,$02,$D0,$09,$A4,$85,$A5,$C9,$20,$57
    .byte $F8,$84,$85,$85,$C9,$A5,$C3,$C9,$04,$90,$32,$A0,$E0,$C9,$91,$B0
    .byte $14,$A0,$00,$C9,$8C,$B0,$0E,$A0,$E4,$C9,$88,$B0,$08,$A0,$E8,$C9
    .byte $84,$B0,$02,$A0,$00,$84,$9A,$AD,$C6,$00,$29,$01,$D0,$07,$A5,$C3
    .byte $38,$E5,$DB,$85,$C3,$A5,$C3,$C9,$80,$B0,$2B,$90,$09,$A9,$00,$85
    .byte $9A,$AD,$CE,$00,$D0,$20,$A5,$B4,$29,$F7,$F0,$1A,$A5,$0C,$A4,$E4
    .byte $F0,$02,$A5,$0D,$0A,$B0,$0F,$A9,$92,$85,$C3,$A9,$E0,$85,$C2,$38
    .byte $A5,$83,$E9,$04,$85,$88,$A5,$C6,$29,$03,$D0,$20,$A5,$C4,$C9,$A8
    .byte $90,$11,$A5,$8E,$29,$F7,$F0,$14,$18,$A5,$84,$69,$02,$85,$89,$A9
    .byte $5F,$85,$C4,$18,$A5,$C4,$65,$D9,$65,$E0,$85,$C4,$A5,$C6,$29,$01
    .byte $D0,$20,$A5,$C5,$C9,$A8,$90,$11,$A5,$90,$29,$B9,$C2,$F9,$85,$D6
    .byte $60,$18,$A5,$CC,$69,$08,$C9,$90,$90,$02,$A9,$40,$85,$CC,$A8,$8D
    .byte $CA,$00,$B1,$A6,$65,$CC,$29,$7F,$69,$10,$8D,$B5,$00,$A9,$00,$85
    .byte $8B,$A5,$D1,$65,$D2,$29,$1F,$C9,$08,$90,$02,$A9,$05,$18,$29,$07
    .byte $A8,$85,$E1,$69,$20,$85,$B4,$B9,$B2,$F9,$85,$D3,$A5,$D2,$4A,$B0
    .byte $03,$A0,$13,$60,$A0,$EF,$60,$A9,$00,$85,$15,$85,$16,$85,$17,$85
    .byte $18,$85,$19,$85,$1A,$60,$A5,$B4,$29,$0F,$C9,$00,$F0,$3D,$C9,$05
    .byte $F0,$39,$C9,$07,$F0,$35,$85,$C5,$A5,$B5,$18,$69,$0B,$C5,$A1,$90
    .byte $17,$A5,$C5,$4A,$90,$04,$A9,$10,$D0,$09,$4A,$90,$04,$A9,$20,$D0
    .byte $02,$A9,$40,$18,$65,$B5,$85,$B5,$A5,$C5,$4A,$25,$C5,$A8,$18,$69
    .byte $20,$85,$B4,$85,$C5,$B9,$B2,$F9,$85,$D3,$60,$A9,$00,$85,$C5,$60
    .byte $A5,$A8,$85,$02,$C5,$B6,$D0,$04,$A9,$07,$85,$B1,$A4,$B1,$F0,$02
    .byte $C6,$B1,$B9,$E6,$FB,$05,$8D,$25,$A5,$85,$07,$B1,$AE,$85,$1C,$20
    .byte $AE,$F7,$C6,$A8,$60,$85,$02,$A4,$A8,$B1,$A6,$85,$0D,$60,$18,$69
    .byte $2E,$A8,$29,$0F,$8D,$A0,$00,$98,$4A,$4A,$4A,$4A,$A8,$18,$6D,$A0
    .byte $00,$C9,$0F,$90,$03,$E9,$0F,$C8,$49,$07,$0A,$0A,$0A,$0A,$95,$20
    .byte $85,$02,$88,$10,$FD,$95,$10
    
       ORG $FFFC

    .word START,START
