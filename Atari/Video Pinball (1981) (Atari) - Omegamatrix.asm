; Disassembly of VidP.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: limit4 -cVidP.cfg VidP.bin
;
; VidP.cfg contents:
;
;      ORG F000
;      CODE F000 FBFE
;      GFX FBFF FCF2
;      CODE FCF3 FCFF
;      GFX FD00 FFCE
;      CODE FFCF FFF9
;      GFX FFFA FFFF

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
HMM1    =  $23
HMBL    =  $24
VDELP0  =  $25
VDELP1  =  $26
VDELBL  =  $27
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXP0FB  =  $32
CXP1FB  =  $33
CXM1FB  =  $35
CXBLPF  =  $36
INPT4   =  $3C
INPT5   =  $3D
SWCHA   =  $0280
SWACNT  =  $0281
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      RIOT RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RIOT_RAM
       ORG $80

ram_80             ds 1  ; x21
ram_81             ds 1  ; x17
ram_82             ds 1  ; x14
ram_83             ds 1  ; x12
ram_84             ds 1  ; x18
ram_85             ds 1  ; x10
ram_86             ds 2  ; x4
ram_88             ds 1  ; x3
ram_89             ds 1  ; x3
ram_8A             ds 1  ; x4
ram_8B             ds 1  ; x4
ram_8C             ds 1  ; x8
ram_8D             ds 1  ; x5
ram_8E             ds 1  ; x6
ram_8F             ds 3  ; x3
ram_92             ds 1  ; x3
ram_93             ds 1  ; x7
ram_94             ds 2  ; x4
ram_96             ds 1  ; x4
ram_97             ds 1  ; x4
ram_98             ds 1  ; x21
ram_99             ds 1  ; x6
ram_9A             ds 1  ; x8
ram_9B             ds 1  ; x4
ram_9C             ds 1  ; x3
ram_9D             ds 1  ; x2
ram_9E             ds 1  ; x1
ram_9F             ds 1  ; x1
ram_A0             ds 1  ; x2
ram_A1             ds 1  ; x6
ram_A2             ds 1  ; x4
ram_A3             ds 1  ; x3
ram_A4             ds 1  ; x3
ram_A5             ds 1  ; x2
ram_A6             ds 1  ; x3
ram_A7             ds 1  ; x3
ram_A8             ds 1  ; x5
ram_A9             ds 1  ; x5
ram_AA             ds 1  ; x2
ram_AB             ds 1  ; x4
ram_AC             ds 1  ; x4
ram_AD             ds 1  ; x4
ram_AE             ds 1  ; x17
ram_AF             ds 1  ; x3
ram_B0             ds 2  ; x3
ram_B2             ds 2  ; x6
ram_B4             ds 2  ; x3
ram_B6             ds 2  ; x4
ram_B8             ds 1  ; x21
ram_B9             ds 1  ; x17
ram_BA             ds 1  ; x26
ram_BB             ds 1  ; x7
ram_BC             ds 1  ; x2
ram_BD             ds 1  ; x7
ram_BE             ds 1  ; x2
ram_BF             ds 1  ; x4
ram_C0             ds 1  ; x6
ram_C1             ds 1  ; x10
ram_C2             ds 1  ; x1
ram_C3             ds 1  ; x21
ram_C4             ds 1  ; x14
ram_C5             ds 1  ; x8
ram_C6             ds 1  ; x8
ram_C7             ds 1  ; x3
ram_C8             ds 1  ; x3
ram_C9             ds 1  ; x2
ram_CA             ds 1  ; x2
ram_CB             ds 1  ; x4
ram_CC             ds 2  ; x5
ram_CE             ds 1  ; x3
ram_CF             ds 2  ; x2
ram_D1             ds 1  ; x3
ram_D2             ds 1  ; x4
ram_D3             ds 1  ; x3
ram_D4             ds 1  ; x3
ram_D5             ds 1  ; x3
ram_D6             ds 1  ; x2
ram_D7             ds 1  ; x5
ram_D8             ds 2  ; x14
ram_DA             ds 2  ; x7
ram_DC             ds 2  ; x5
ram_DE             ds 2  ; x4
ram_E0             ds 2  ; x4
ram_E2             ds 2  ; x8
ram_E4             ds 2  ; x4
ram_E6             ds 2  ; x6
ram_E8             ds 2  ; x2
ram_EA             ds 22 ; x2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG CODE
       ORG $F000

START:
    cld                          ;
    sei                          ;
    ldx    #$FF                  ;
    txs                          ;
    inx                          ;
    txa                          ;
.loopClear:
    sta    0,X                   ;
    inx                          ;
    bne    .loopClear            ;

    ldx    #40                   ;
    jsr    InitializeRam         ;
    inx                          ; X=1
    stx    ram_A1                ;
    stx    ram_C1                ;

MainLoop:
    lda    #$03                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    sta    VSYNC                 ; 3
    ldy    #$00                  ; 2
    cpy    ram_D8                ; 3
    beq    LF044                 ; 2³
    lda    (ram_D8),Y            ; 5
    cmp    #$FF                  ; 2
    bne    LF030                 ; 2³
    sty    ram_D8                ; 3
    sty    AUDV0                 ; 3
    beq    LF044                 ; 3   always branch

LF030:
    inc    ram_D8                ; 5
    sta    AUDF0                 ; 3
    lda    (ram_D8),Y            ; 5
    tax                          ; 2
    and    #$0F                  ; 2
    sta    AUDV0                 ; 3
    txa                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDC0                 ; 3
    inc    ram_D8                ; 5
LF044:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$01                  ; 2
LF048:
    lda    ram_8C,X              ; 4
    and    #$7F                  ; 2
    beq    LF056                 ; 2³
    dec    ram_8C,X              ; 6
    bne    LF056                 ; 2³
    lda    #$80                  ; 2
    sta    ram_8C,X              ; 4
LF056:
    dex                          ; 2
    beq    LF048                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$08                  ; 2
    sta    HMM1                  ; 3
    nop                          ; 2
    ldy    #$0C                  ; 2
LF062:
    dey                          ; 2
    bne    LF062                 ; 2³
    sty    RESM1                 ; 3
    sty    RESP1                 ; 3
    sty    WSYNC                 ; 3
;---------------------------------------
    sty    VSYNC                 ; 3
    lda    #$29                  ; 2
    sta    TIM64T                ; 4
    lda    SWCHB                 ; 4
    ror                          ; 2
    ror                          ; 2
    bcs    LF09D                 ; 2³
    lda    ram_A2                ; 3
    bne    LF093                 ; 2³
LF07D:
    inc    ram_A1                ; 5
    inc    ram_C1                ; 5
    lda    ram_A1                ; 3
    cmp    #$05                  ; 2
    bne    LF089                 ; 2³
    lda    #$01                  ; 2
LF089:
    sta    ram_A1                ; 3
    sta    ram_99                ; 3
    eor    #$01                  ; 2
    and    #$01                  ; 2
    sta    ram_AE                ; 3
LF093:
    inc    ram_A2                ; 5
    lda    ram_A2                ; 3
    and    #$3F                  ; 2
    bne    LF0B0                 ; 2³
    beq    LF07D                 ; 3   always branch

LF09D:
    sty    ram_A2                ; 3
    rol                          ; 2
    bcs    LF0B0                 ; 2³
    ldx    #22                   ; 2
    jsr    InitializeRam         ; 6
    ldx    #$16                  ; 2
LF0A9:
    sty    ram_AB,X              ; 4
    stx    ram_99                ; 3
    dex                          ; 2
    bne    LF0A9                 ; 2³
LF0B0:
    bit    CXP0FB                ; 3
    bvs    LF0C9                 ; 2³
    bit    CXP1FB                ; 3
    bvs    LF0C9                 ; 2³
    lda    LFCA0                 ; 4
    sta    ram_D7                ; 3
    lda    ram_8B                ; 3
    beq    LF0D4                 ; 2³
    dec    ram_8B                ; 5
    jsr    LFADE                 ; 6
    jmp    LF0D4                 ; 3

LF0C9:
    lda    ram_C4                ; 3
    cmp    #$AA                  ; 2
    bcc    LF0D4                 ; 2³
    sty    ram_D7                ; 3
    jsr    LF99F                 ; 6
LF0D4:
    jsr    LF522                 ; 6
    jsr    LF80E                 ; 6
    jsr    LFCF3                 ; 6
    lda    ram_C3                ; 3
    sec                          ; 2
    adc    #$02                  ; 2
LF0E2:
    iny                          ; 2
    sbc    #$0F                  ; 2
    bcs    LF0E2                 ; 2³
    eor    #$FF                  ; 2
    sbc    #$06                  ; 2
    asl                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMBL,X                ; 4
LF0F3:
    dey                          ; 2
    bpl    LF0F3                 ; 2³
    sta    RESBL,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    stx    ram_8F                ; 3
    stx    ram_DA                ; 3
    stx    PF0                   ; 3
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    lda    SWCHB                 ; 4
    ldx    #$0F                  ; 2
    ldy    #$09                  ; 2
    and    #$08                  ; 2
    beq    LF115                 ; 2³
    ldx    #$FF                  ; 2
    ldy    #$04                  ; 2
LF115:
    stx    ram_80                ; 3
    lda    ram_C1                ; 3
    beq    LF121                 ; 2³
    lda    #$F7                  ; 2
    and    ram_80                ; 3
    sta    ram_80                ; 3
LF121:
    ldx    #$05                  ; 2
LF123:
    lda    LFF93,Y               ; 4
    eor    ram_C1                ; 3
    eor    ram_C0                ; 3
    and    ram_80                ; 3
    dey                          ; 2
    dex                          ; 2
    sta    ram_9C,X              ; 4
    beq    LF136                 ; 2³
    sta    NUSIZ1,X              ; 4
    bne    LF123                 ; 3   always branch

LF136:
    inc    ram_9A                ; 5
    bne    LF16D                 ; 2³
    stx    ram_D2                ; 3
    lda    ram_BB                ; 3
    beq    LF14A                 ; 2³
    lda    ram_9B                ; 3
    and    #$03                  ; 2
    bne    LF14A                 ; 2³
    lda    #$7B                  ; 2
    sta    ram_D2                ; 3
LF14A:
    lda    ram_AF                ; 3
    beq    LF159                 ; 2³
    lda    ram_A1                ; 3
    ror                          ; 2
    bcs    LF159                 ; 2³
    lda    ram_AE                ; 3
    eor    #$01                  ; 2
    sta    ram_AE                ; 3
LF159:
    lda    ram_C1                ; 3
    beq    LF163                 ; 2³
    inc    ram_C1                ; 5
    bne    LF163                 ; 2³
    inc    ram_C1                ; 5
LF163:
    inc    ram_9B                ; 5
    bne    LF16D                 ; 2³
    lda    ram_C1                ; 3
    bne    LF16D                 ; 2³
    inc    ram_C1                ; 5
LF16D:
    jsr    LFFD8                 ; 6

;LFFD8 SUBROUTINE  ;x1
;    lda    #$14                  ;
;    sta    CTRLPF                ;
;    lda    #$10                  ;
;    sta    NUSIZ1                ;
;    ldx    #0                    ;
;    stx    ENAM0                 ;
;    stx    ENAM1                 ;
;    stx    HMCLR                 ;
;    lda    ram_A0                ;
;    eor    ram_BD                ;
;    sta    COLUBK                ;
;    dex                          ; X=$FF
;    stx    ram_85                ;
;    lda    #<LFFC5               ;
;    sta    ram_84                ;
;    lda    #5                    ;
;    sta    ram_80                ;
;    rts                          ;

LF170:
    ldx    ram_AE                ; 3
    lda    ram_B0,X              ; 4
    tax                          ; 2
    and    #$0F                  ; 2
    tay                          ; 2
    lda    (ram_84),Y            ; 5
    and    #$F0                  ; 2
    sta    ram_81                ; 3   temp
    txa                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    (ram_84),Y            ; 5
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    ora    ram_81                ; 3   temp
    lsr                          ; 2
    pha                          ; 3   right PF2
    ldx    ram_AE                ; 3
    lda    ram_B2,X              ; 4
    tax                          ; 2
    and    #$0F                  ; 2
    tay                          ; 2
    lda    (ram_84),Y            ; 5
    and    #$0F                  ; 2
    sta    ram_81                ; 3
    txa                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    (ram_84),Y            ; 5
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    ora    ram_81                ; 3
    asl                          ; 2
    pha                          ; 3   right PF1
    ldx    ram_AE                ; 3
    lda    ram_B4,X              ; 4
    tax                          ; 2
    and    #$0F                  ; 2
    tay                          ; 2
    lda    (ram_84),Y            ; 5
    lsr                          ; 2
    pha                          ; 3   right PF0
    txa                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    (ram_84),Y            ; 5
    and    #$F0                  ; 2
    lsr                          ; 2   carry is clear,
    pha                          ; 3   left PF2
    lda    ram_84                ; 3
    sbc    #9                    ; 2   so subtracting 10...
    sta    ram_84                ; 3
    dec    ram_80                ; 5
    bne    LF170                 ; 2³

LF1CE:
    lda    INTIM                 ; 4
    bne    LF1CE                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    lda    ram_9E                ; 3
    ldx    ram_AE                ; 3
    beq    LF1DF                 ; 2³
    lda    ram_9D                ; 3
LF1DF:
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #<LFF9D               ; 2
    sta    ram_84                ; 3
    ldy    ram_AE                ; 3
    iny                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------

    ldx    #$05                  ; 2
.loopDrawScore:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_84),Y            ; 5
    sta    PF0                   ; 3
    ldy    ram_99                ; 3
    lda    (ram_84),Y            ; 5
    and    #$0F                  ; 2
    sta    PF1                   ; 3
    pla                          ; 4
    sta    PF2                   ; 3
    sta    ram_86                ; 3
    pla                          ; 4
    sta    PF0                   ; 3
    sta    ram_82                ; 3
    pla                          ; 4
    sta    PF1                   ; 3
    sta    ram_83                ; 3
    pla                          ; 4
    sta    PF2                   ; 3
    sta    ram_81                ; 3
    ldy    ram_AE                ; 3
    iny                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_84),Y            ; 5
    sta    PF0                   ; 3
    ldy    ram_99                ; 3
    lda    (ram_84),Y            ; 5
    and    #$0F                  ; 2
    sta    PF1                   ; 3
    lda    ram_86                ; 3
    sta    PF2                   ; 3
    ldy    ram_AE                ; 3
    iny                          ; 2
    lda    ram_82                ; 3
    sta    PF0                   ; 3
    lda    ram_83                ; 3
    sta    PF1                   ; 3
    lda    ram_81                ; 3
    sta    PF2                   ; 3
    lda    ram_84                ; 3
    clc                          ; 2
    adc    #$0A                  ; 2
    sta    ram_84                ; 3
    dex                          ; 2
    bne    .loopDrawScore                 ; 2³+1

    sta    WSYNC                 ; 3
;---------------------------------------
    stx    PF0                   ; 3
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    lda    #$15                  ; 2
    sta    CTRLPF                ; 3
    lda    #$08                  ; 2
    sta    ram_98                ; 3
    lda    ram_D6                ; 3
    pha                          ; 3
    lda    ram_D5                ; 3
    pha                          ; 3
    lda    ram_D4                ; 3
    pha                          ; 3
    lda    ram_D3                ; 3
    pha                          ; 3
    lda    ram_D2                ; 3
    pha                          ; 3
    lda    ram_D1                ; 3
    pha                          ; 3
    pha                          ; 3
    lda    ram_CF                ; 3
    pha                          ; 3
    lda    ram_CE                ; 3
    pha                          ; 3
    ldx    #$06                  ; 2
LF269:
    lda    ram_C7,X              ; 4
    pha                          ; 3
    dex                          ; 2
    bne    LF269                 ; 2³
    txa                          ; 2
    jsr    LF4EE                 ; 6
LF273:
    sta    WSYNC                 ; 3
;---------------------------------------
LF275:
    sta    PF0                   ; 3
    stx    PF1                   ; 3
    sty    PF2                   ; 3
    ldx    #$03                  ; 2
LF27D:
    sta    GRP1                  ; 3
    lda    ram_9F                ; 3
    sta    COLUPF                ; 3
    lda    ram_A0                ; 3
    sta    COLUBK                ; 3
    lda    ram_9D                ; 3
    sta    COLUP0                ; 3
    jsr    LF516                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    ENABL                 ; 3
    lda    ram_98                ; 3
    cmp    ram_C6                ; 3
    bcc    LF29C                 ; 2³
    lda    #$02                  ; 2
    sta    ENAM1                 ; 3
LF29C:
    inc    ram_98                ; 5
    dex                          ; 2
    beq    LF2A5                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    bne    LF27D                 ; 2³
LF2A5:
    lda    ram_98                ; 3
    cmp    #$0C                  ; 2
    beq    LF2D1                 ; 2³
    cmp    #$1C                  ; 2
    beq    LF2D1                 ; 2³
    cmp    #$2C                  ; 2
    beq    LF314                 ; 2³+1
    cmp    #$3C                  ; 2
    beq    LF2D1                 ; 2³
    cmp    #$4C                  ; 2
    beq    LF2D1                 ; 2³
    cmp    #$58                  ; 2
    bne    LF2C2                 ; 2³
    jmp    LF40A                 ; 3

LF2C2:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    jsr    LF516                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    LF4EE                 ; 6
    jmp    LF273                 ; 3

LF2D1:
    pla                          ; 4
    sta    ram_DC                ; 3
    pla                          ; 4
    sta    ram_DE                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    pla                          ; 4
    sta    ram_E0                ; 3
    sta    GRP1                  ; 3
    lda    ram_C5                ; 3
    sec                          ; 2
    sbc    ram_98                ; 3
    cmp    #$02                  ; 2
    rol                          ; 2
    asl                          ; 2
    eor    #$02                  ; 2
    nop                          ; 2
    nop                          ; 2
    ldy    ram_8F                ; 3
    sta    RESP0                 ; 3
    bne    LF2F7                 ; 2³
    sta    RESP0                 ; 3
    ldx    #$13                  ; 2
    bne    LF2F9                 ; 3   always branch

LF2F7:
    ldx    #$16                  ; 2
LF2F9:
    stx    NUSIZ0                ; 3
    iny                          ; 2
    cpy    #$03                  ; 2
    bne    LF302                 ; 2³
    ldy    #$00                  ; 2
LF302:
    sty    ram_8F                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    LF4EE                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    stx    PF1                   ; 3
    sty    PF2                   ; 3
    jmp    LF34C                 ; 3

LF314:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_80                ; 3
    sta    GRP1                  ; 3
    lda    ram_9C                ; 3
    sta    COLUP0                ; 3
    lda    ram_C5                ; 3
    sec                          ; 2
    sbc    ram_98                ; 3
    cmp    #$02                  ; 2
    rol                          ; 2
    asl                          ; 2
    eor    #$02                  ; 2
    tax                          ; 2
    pla                          ; 4
    sta    ram_DC                ; 3
    pla                          ; 4
    sta    ram_E0                ; 3
    pla                          ; 4
    sta    ram_85                ; 3
    pha                          ; 3
    pla                          ; 4
    txa                          ; 2
    sta    RESP0                 ; 3
    ldx    #$14                  ; 2
    stx    NUSIZ0                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    LF4EE                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    stx    PF1                   ; 3
    sty    PF2                   ; 3
    jmp    LF34C                 ; 3

LF34C:
    ldy    ram_80                ; 3
LF34E:
    lda    (ram_DC),Y            ; 5
    sta    GRP0                  ; 3
    sta.w  GRP1                  ; 4
    sta    ram_85                ; 3
    lda    (ram_DE),Y            ; 5
    tax                          ; 2
    lda    (ram_E0),Y            ; 5
    stx    GRP0                  ; 3
    sta    ram_82                ; 3
    sta    GRP0                  ; 3
    lda    ram_C5                ; 3
    sec                          ; 2
    sbc    ram_98                ; 3
    cmp    #$02                  ; 2
    rol                          ; 2
    asl                          ; 2
    eor    #$02                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    ENABL                 ; 3
    lda    (ram_DC),Y            ; 5
    sta    GRP0                  ; 3
    lda    ram_98                ; 3
    cmp    ram_C6                ; 3
    rol                          ; 2
    asl                          ; 2
    sta    ENAM1                 ; 3
    inc    ram_98                ; 5
    pha                          ; 3
    pla                          ; 4
    lda    (ram_DE),Y            ; 5
    iny                          ; 2
    sta    GRP0                  ; 3
    lda    ram_82                ; 3
    sta    GRP0                  ; 3
    lda    ram_8E                ; 3
    dec    ram_8E                ; 5
    cmp    #$04                  ; 2
    beq    LF39E                 ; 2³
    cmp    #$01                  ; 2
    beq    LF39E                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    Waste12Cycles         ;12
    jmp    LF34E                 ; 3

LF39E:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_DC),Y            ; 5
    sta    GRP0                  ; 3
    tax                          ; 2
    lda    (ram_DE),Y            ; 5
    sta    GRP1                  ; 3
    sta    ram_81                ; 3
    lda    (ram_E0),Y            ; 5
    sta    GRP1                  ; 3
    sta    ram_82                ; 3
    iny                          ; 2
    stx    ram_80                ; 3
    tax                          ; 2
    lda    ram_81                ; 3
    sta    GRP0                  ; 3
    lda    ram_82                ; 3
    sta    GRP0                  ; 3
    lda    ram_C5                ; 3
    sec                          ; 2
    sbc    ram_98                ; 3
    cmp    #$02                  ; 2
    rol                          ; 2
    asl                          ; 2
    eor    #$02                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    ENABL                 ; 3
    sty    ram_83                ; 3
    sty    ram_83                ; 3
    ldy    ram_80                ; 3
    sty    GRP0                  ; 3
    ldx    ram_DA                ; 3
    lda    LFCB3,X               ; 4
    inx                          ; 2
    sta    ram_85                ; 3
    lda    LFCB3,X               ; 4
    inx                          ; 2
    ldy    LFCB3,X               ; 4
    stx    ram_DA                ; 3
    ldx    ram_81                ; 3
    stx    GRP0                  ; 3
    ldx    ram_82                ; 3
    stx    GRP0                  ; 3
    inc    ram_DA                ; 5
    inc    ram_98                ; 5
    tax                          ; 2
    lda    ram_8E                ; 3
    beq    LF405                 ; 2³+1
    lda    ram_85                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    stx    PF1                   ; 3
    sty    PF2                   ; 3
    ldy    ram_83                ; 3
    jmp    LF34E                 ; 3

LF405:
    lda    ram_85                ; 3
    jmp    LF275                 ; 3

LF40A:
    ldx    #$21                  ; 2
    ldy    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    GRP1                  ; 3
    lda    ram_9C                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    ram_C5                ; 3
    sec                          ; 2
    sbc    ram_98                ; 3
    cmp    #$02                  ; 2
    rol                          ; 2
    asl                          ; 2
    eor    #$02                  ; 2
    stx    NUSIZ0,Y              ; 4
    stx    NUSIZ1                ; 3
    nop                          ; 2
    nop                          ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    ldx    #$11                  ; 2
    stx    HMM1                  ; 3
    stx    VDELP0                ; 3
    ldx    #$F0                  ; 2
    stx    HMP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    ENABL                 ; 3
    ldx    #$01                  ; 2
    stx    VDELP1                ; 3
    ldx    #$B0                  ; 2
    stx    ram_98                ; 3
    inc    ram_8E                ; 5
    dec    ram_8E                ; 5
    ldx    ram_DA                ; 3
    ldy    LFCB3,X               ; 4
    inx                          ; 2
    lda    LFCB3,X               ; 4
    tax                          ; 2
    lda    ram_C4                ; 3
    sec                          ; 2
    sbc    ram_98                ; 3
    inc    ram_98                ; 5
    cmp    #$04                  ; 2
    rol                          ; 2
    asl                          ; 2
    eor    #$02                  ; 2
    sta    ENABL                 ; 3
    tya                          ; 2
    ldy    #$00                  ; 2
LF465:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    stx    PF2                   ; 3
LF46B:
    lda    (ram_E2),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_E4),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_E6),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_E8),Y            ; 5
    tax                          ; 2
    lda    ram_C4                ; 3
    nop                          ; 2
    iny                          ; 2
    stx    GRP1                  ; 3
    stx    GRP0                  ; 3
    sec                          ; 2
    sbc    ram_98                ; 3
    tax                          ; 2
    dex                          ; 2
    cmp    #$04                  ; 2
    rol                          ; 2
    asl                          ; 2
    eor    #$02                  ; 2
    sta    ENABL                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_E2),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_E4),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_E6),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_E8),Y            ; 5
    cpx    #$04                  ; 2
    bcs    LF4A5                 ; 2³
    ldx    #$02                  ; 2
LF4A5:
    bcc    LF4A9                 ; 2³
    ldx    #$00                  ; 2
LF4A9:
    iny                          ; 2
    clc                          ; 2
    nop                          ; 2
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    lda    ram_98                ; 3
    adc    #$02                  ; 2
    sta    ram_98                ; 3
    cmp    #$B9                  ; 2
    bne    LF4C2                 ; 2³
    stx    ENABL                 ; 3
    ldx    #$0F                  ; 2
    lda    ram_AA                ; 3
    bne    LF465                 ; 2³
LF4C2:
    cmp    #$C1                  ; 2
    beq    LF4CC                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    ENABL                 ; 3
    bne    LF46B                 ; 3   always branch

LF4CC:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    ENAM1                 ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    lda    #$03                  ; 2
    sta    VBLANK                ; 3
    lda    #$26                  ; 2
    sta    TIM64T                ; 4
    jsr    LF664                 ; 6
LF4E6:
    lda    INTIM                 ; 4
    bne    LF4E6                 ; 2³
    jmp    MainLoop                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF4EE SUBROUTINE  ;x4
    sta    ENABL                 ; 3
    lda    ram_98                ; 3
    cmp    ram_C6                ; 3
    bcc    LF4FA                 ; 2³
    lda    #$02                  ; 2
    sta    ENAM1                 ; 3
LF4FA:
    lda    #$06                  ; 2
    sta    ram_8E                ; 3
    inc    ram_98                ; 5
    ldx    ram_DA                ; 3
    lda    LFCB3,X               ; 4
    inx                          ; 2
    sta    ram_85                ; 3
    lda    LFCB3,X               ; 4
    inx                          ; 2
    ldy    LFCB3,X               ; 4
    inx                          ; 2
    stx    ram_DA                ; 3
    tax                          ; 2
    lda    ram_85                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF516 SUBROUTINE  ;x2
    lda    ram_C5                ; 3
    sec                          ; 2
    sbc    ram_98                ; 3
    cmp    #$02                  ; 2
    rol                          ; 2
    asl                          ; 2
    eor    #$02                  ; 2
LF521:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF522 SUBROUTINE  ;x1
    ldy    #$00                  ; 2
    lda    #$F0                  ; 2
    sta    ram_8A                ; 3
    lda    ram_88                ; 3
    cmp    #$04                  ; 2
    beq    LF532                 ; 2³
    inc    ram_88                ; 5
    bne    LF556                 ; 2³
LF532:
    bit    ram_93                ; 3
    bvs    LF545                 ; 2³
    sty    ram_88                ; 3
    lda    ram_E6                ; 3
    cmp    #$80                  ; 2
    beq    LF545                 ; 2³
    sty    ram_8C                ; 3
    ldx    #$04                  ; 2
    jsr    LF648                 ; 6
LF545:
    bit    ram_93                ; 3
    bmi    LF556                 ; 2³
    lda    ram_E2                ; 3
    cmp    #$00                  ; 2
    beq    LF556                 ; 2³
    ldx    #$00                  ; 2
    sty    ram_8D                ; 3
    jsr    LF648                 ; 6
LF556:
    sty    ram_93                ; 3
    sty    SWACNT                ; 4
    lda    ram_AF                ; 3
    ora    ram_C1                ; 3
    ora    ram_A9                ; 3
    bne    LF521                 ; 2³   shared RTS
    lda    ram_AE                ; 3
    lsr                          ; 2
    php                          ; 3
    lda    INPT5                 ; 3
    bcs    LF56D                 ; 2³
    lda    INPT4                 ; 3
LF56D:
    sta    ram_80                ; 3
    bmi    LF58D                 ; 2³
    lda    ram_C6                ; 3
    ldx    #$43                  ; 2
    stx    ram_C6                ; 3
    ldx    ram_BB                ; 3
    bne    LF58D                 ; 2³
    sec                          ; 2
    sbc    #$43                  ; 2
    beq    LF58D                 ; 2³
    asl                          ; 2
    sta    ram_EA                ; 3
    adc    #$D6                  ; 2
    sta    ram_B9                ; 3
    sta    ram_BB                ; 3
    lda    #$1A                  ; 2
    sta    ram_D8                ; 3
LF58D:
    lda    SWCHA                 ; 4
    plp                          ; 4
    bcs    LF597                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
LF597:
    and    #$0F                  ; 2
    ldx    ram_BB                ; 3
    bne    LF5B5                 ; 2³
    ldx    ram_C6                ; 3
    cmp    #$0D                  ; 2
    bne    LF5A9                 ; 2³
    cpx    #$57                  ; 2
    beq    LF5A9                 ; 2³
    inc    ram_C6                ; 5
LF5A9:
    cmp    #$0E                  ; 2
    bne    LF5F1                 ; 2³
    cpx    #$43                  ; 2
    beq    LF5F1                 ; 2³
    dec    ram_C6                ; 5
    bne    LF5F1                 ; 2³
LF5B5:
    bit    ram_80                ; 3
    bmi    LF5F1                 ; 2³
    tax                          ; 2
    lda    ram_9A                ; 3
    and    #$01                  ; 2
    ora    ram_94                ; 3
    bne    LF5F1                 ; 2³
    txa                          ; 2
    cmp    #$0E                  ; 2
    bne    LF5CE                 ; 2³
    dec    ram_C4                ; 5
    sec                          ; 2
    rol    ram_A5                ; 5
    bne    LF5E6                 ; 3   always branch

LF5CE:
    cmp    #$07                  ; 2
    bne    LF5DB                 ; 2³
    inc    ram_C3                ; 5
    lsr    ram_A4                ; 5
    sec                          ; 2
    rol    ram_A3                ; 5
    bne    LF5E6                 ; 3   always branch

LF5DB:
    cmp    #$0B                  ; 2
    bne    LF656                 ; 2³+1
    dec    ram_C3                ; 5
    lsr    ram_A3                ; 5
    sec                          ; 2
    rol    ram_A4                ; 5
LF5E6:
    bcc    LF5F0                 ; 2³
    lda    #$42                  ; 2
    sta    ram_BD                ; 3
    sty    ram_A8                ; 3
    sty    ram_AD                ; 3
LF5F0:
    rts                          ; 6

LF5F1:
    ldx    ram_BD                ; 3
    bne    LF5F0                 ; 2³
    cmp    #$07                  ; 2
    beq    LF605                 ; 2³+1
    cmp    #$0B                  ; 2
    beq    LF623                 ; 2³+1
    cmp    #$0E                  ; 2
    bne    LF656                 ; 2³
    lda    #$01                  ; 2
    sta    ram_89                ; 3
LF605:
    lda    ram_9B                ; 3
    and    #$03                  ; 2
    sta    ram_9B                ; 3
    lda    ram_8C                ; 3
    bne    LF613                 ; 2³
    lda    RESP0                 ; 3
    sta    ram_8C                ; 3
LF613:
    lda    #$40                  ; 2
    ora    ram_93                ; 3
    sta    ram_93                ; 3
    lda    ram_E6                ; 3
    cmp    #$B0                  ; 2
    beq    LF640                 ; 2³
    ldx    #$04                  ; 2
    bne    LF639                 ; 3   always branch

LF623:
    lda    ram_8D                ; 3
    bne    LF62B                 ; 2³
    lda    RESP0                 ; 3
    sta    ram_8D                ; 3
LF62B:
    lda    #$80                  ; 2
    ora    ram_93                ; 3
    sta    ram_93                ; 3
    lda    ram_E2                ; 3
    cmp    #$30                  ; 2
    beq    LF656                 ; 2³
    ldx    #$00                  ; 2
LF639:
    lda    #$10                  ; 2
    sta    ram_8A                ; 3
    jsr    LF648                 ; 6
LF640:
    lda    ram_89                ; 3
    beq    LF656                 ; 2³
    sty    ram_89                ; 3
    bne    LF623                 ; 3   always branch

LF648 SUBROUTINE  ;x3
    clc                          ; 2
    lda    ram_E2,X              ; 4
    adc    ram_8A                ; 3
    sta    ram_E2,X              ; 4
    clc                          ; 2
    lda    ram_E4,X              ; 4
    adc    ram_8A                ; 3
    sta    ram_E4,X              ; 4
LF656:
    rts                          ; 6

;unused code??
    lda    ram_D7                ; 3
    bne    LF656                 ; 2³
    lda    ram_BA                ; 3
    and    #$BF                  ; 2
    sta    ram_BA                ; 3
    jmp    LFAC5                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF664 SUBROUTINE  ;x1
    lda    #$00                  ; 2
    sta    AUDV1                 ; 3
    bit    CXM1FB                ; 3
    bvc    LF679                 ; 2³
    bit    ram_C3                ; 3
    bpl    LF679                 ; 2³
    ldx    ram_BD                ; 3
    beq    LF676                 ; 2³
    inc    ram_A9                ; 5
LF676:
    jmp    LF98D                 ; 3

LF679:
    bit    CXBLPF                ; 3
    bmi    LF68B                 ; 2³
    sta    ram_94                ; 3
    jsr    LFB2A                 ; 6
    jsr    LF8B3                 ; 6
    jsr    LF8DB                 ; 6
    jmp    LF87A                 ; 3

LF68B:
    lda    ram_BB                ; 3
    beq    LF656                 ; 2³   shared RTS
    lda    #$31                  ; 2
    ldx    ram_94                ; 3
    bne    LF69F                 ; 2³
    sta    ram_94                ; 3
    sta    AUDF1                 ; 3
    lda    #$05                  ; 2
    sta    AUDC1                 ; 3
    sta    AUDV1                 ; 3
LF69F:
    lsr                          ; 2
    cmp    ram_B8                ; 3
    bcc    LF6A6                 ; 2³
    sta    ram_B8                ; 3
LF6A6:
    ldx    #$80                  ; 2
    ldy    ram_C4                ; 3
    lda    ram_C3                ; 3
    jsr    LF721                 ; 6
    lda    #$03                  ; 2
    sta    ram_83                ; 3
    bit    ram_BA                ; 3
    bvc    LF6C2                 ; 2³
    ldx    #$00                  ; 2
    stx    ram_81                ; 3
    jsr    LF7EE                 ; 6
    bne    LF6D7                 ; 2³
    beq    LF6CD                 ; 3   always branch

LF6C2:
    lda    #$40                  ; 2
    sta    ram_81                ; 3
    ldx    #$2B                  ; 2
    jsr    LF7EE                 ; 6
    bne    LF6D7                 ; 2³
LF6CD:
    lda    #$FE                  ; 2
    and    ram_83                ; 3
    sta    ram_83                ; 3
    lda    #$00                  ; 2
    sta    ram_81                ; 3
LF6D7:
    ldx    #$40                  ; 2
    lda    ram_C4                ; 3
    ldy    ram_C3                ; 3
    jsr    LF721                 ; 6
    bit    ram_BA                ; 3
    bpl    LF6FA                 ; 2³
    lda    #$80                  ; 2
    sta    ram_82                ; 3
    ldx    #$3B                  ; 2
    jsr    LF7EE                 ; 6
    bne    LF718                 ; 2³+1
    ldy    ram_AB                ; 3
    bpl    LF70E                 ; 2³+1
    jsr    LF7ED                 ; 6
    bne    LF718                 ; 2³+1
    beq    LF70E                 ; 3+1   always branch

LF6FA:
    lda    #$C0                  ; 2
    sta    ram_82                ; 3
    ldx    #$6A                  ; 2
    jsr    LF7EE                 ; 6
    bne    LF718                 ; 2³
    ldy    ram_AB                ; 3
    bpl    LF70E                 ; 2³
    jsr    LF7ED                 ; 6
    bne    LF718                 ; 2³
LF70E:
    lda    #$FD                  ; 2
    and    ram_83                ; 3
    sta    ram_83                ; 3
    ldx    #$00                  ; 2
    stx    ram_82                ; 3
LF718:
    lda    ram_83                ; 3
    ror                          ; 2
    bcs    LF728                 ; 2³
    ror                          ; 2
    bcs    LF728                 ; 2³
    rts                          ; 6

;--------------
;can be moved!

LF721 SUBROUTINE  ;x2
    sta    ram_84                ; 3
    stx    ram_85                ; 3
    sty    ram_86                ; 3
    rts                          ; 6

;--------------

LF728:
    lda    ram_83                ; 3
    cmp    #$03                  ; 2
    bne    LF73A                 ; 2³
    lda    #$C0                  ; 2
    sta    ram_96                ; 3
    eor    ram_82                ; 3
    bne    LF777                 ; 2³
    sta    ram_82                ; 3
    beq    LF777                 ; 3   always branch

LF73A:
    lda    ram_81                ; 3
    ora    ram_82                ; 3
    sta    ram_97                ; 3
    lda    #$40                  ; 2
    sta    ram_BF                ; 3
    bit    ram_96                ; 3
    bpl    LF74D                 ; 2³
    bvc    LF74D                 ; 2³
    jmp    LF777                 ; 3

LF74D:
    ldy    #$40                  ; 2
    ldx    #$01                  ; 2
    bit    ram_97                ; 3
    bmi    LF76D                 ; 2³
    bit    ram_97                ; 3
    bvs    LF763                 ; 2³
LF759:
    tya                          ; 2
    eor    #$FF                  ; 2
    and    ram_BA                ; 3
    dec    ram_C3,X              ; 6
    jmp    LF768                 ; 3

LF763:
    tya                          ; 2
    ora    ram_BA                ; 3
    inc    ram_C3,X              ; 6
LF768:
    sta    ram_BA                ; 3
    jmp    LF79C                 ; 3

LF76D:
    ldy    #$80                  ; 2
    ldx    #$00                  ; 2
    bit    ram_97                ; 3
    bvc    LF759                 ; 2³
    bvs    LF763                 ; 3   always branch

LF777:
    ldx    ram_B8                ; 3
    ldy    ram_B9                ; 3
    cpy    #$05                  ; 2
    bcs    LF781                 ; 2³
    ldy    #$05                  ; 2
LF781:
    sty    ram_B8                ; 3
    cpx    #$05                  ; 2
    bcs    LF789                 ; 2³
    ldx    #$05                  ; 2
LF789:
    stx    ram_B9                ; 3
    lda    ram_81                ; 3
    ora    ram_82                ; 3
    asl                          ; 2
    rol                          ; 2
    ora    ram_BA                ; 3
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    tax                          ; 2
    lda    LFF83,X               ; 4
    sta    ram_BA                ; 3
LF79C:
    lda    ram_BD                ; 3
    bne    LF7C8                 ; 2³
    ldx    #$0C                  ; 2
    jsr    LF854                 ; 6
    bne    LF7B2                 ; 2³
    ldx    #$00                  ; 2
    jsr    LF854                 ; 6
    beq    LF7C8                 ; 2³
    lda    #$2C                  ; 2
    bne    LF7C2                 ; 3   always branch

LF7B2:
    lda    ram_CC                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    ldx    ram_AE                ; 3
    sed                          ; 2
    clc                          ; 2
    adc    ram_B2,X              ; 4
    jsr    LFBF5                 ; 6
    lda    #$01                  ; 2
LF7C2:
    sta    ram_D8                ; 3
    lda    #$80                  ; 2
    sta    ram_BF                ; 3
LF7C8:
    lda    ram_C8                ; 3
    ora    ram_C9                ; 3
    ora    ram_CA                ; 3
    bne    LF7EA                 ; 2³
    jsr    LF984                 ; 6
    lda    ram_CC                ; 3
    clc                          ; 2
    sta    ram_C0                ; 3
    adc    #$08                  ; 2
    cmp    #$50                  ; 2
    bne    LF7E0                 ; 2³
    lda    #$48                  ; 2
LF7E0:
    sta    ram_CC                ; 3
    sta    ram_D1                ; 3
    sta    ram_D3                ; 3
    lda    #$8B                  ; 2
    sta    ram_D8                ; 3
LF7EA:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF7EB:
    inx                          ; 2
    inx                          ; 2
LF7ED SUBROUTINE  ;x2
    inx                          ; 2
LF7EE SUBROUTINE  ;x4
    ldy    LFED2,X               ; 4
    beq    LF80D                 ; 2³+1
    sec                          ; 2
    lda    ram_86                ; 3
    sbc    LFED2,X               ; 4
    cmp    #$04                  ; 2
    bcs    LF7EB                 ; 2³
    lda    ram_84                ; 3
    cmp    LFED3,X               ; 4
    bcc    LF7EB                 ; 2³+1
    cmp    LFED4,X               ; 4
    bcs    LF7EB                 ; 2³+1
    lda    ram_85                ; 3
    sta    ram_96                ; 3
LF80D:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF80E SUBROUTINE  ;x1
    ldx    ram_BC                ; 3
    bne    LF826                 ; 2³
    lda    ram_C5                ; 3
    cmp    #$14                  ; 2
    bcs    LF826                 ; 2³
    sta    ram_BC                ; 3
    lda    ram_9A                ; 3
    and    #$3F                  ; 2
    sta    ram_B9                ; 3
    lda    ram_EA                ; 3
    asl                          ; 2
    asl                          ; 2
    sta    ram_B8                ; 3
LF826:
    ldy    #$03                  ; 2
LF828:
    ldx    #$00                  ; 2
    bit    ram_BA                ; 3
    bpl    LF83B                 ; 2³
LF82E:
    lda    ram_B6,X              ; 4
    clc                          ; 2
    adc    ram_B8,X              ; 4
    sta    ram_B6,X              ; 4
    bcc    LF846                 ; 2³
    inc    ram_C3,X              ; 6
    bne    LF846                 ; 2³
LF83B:
    lda    ram_B6,X              ; 4
    sec                          ; 2
    sbc    ram_B8,X              ; 4
    sta    ram_B6,X              ; 4
    bcs    LF846                 ; 2³
    dec    ram_C3,X              ; 6
LF846:
    txa                          ; 2
    bne    LF850                 ; 2³
    inx                          ; 2
    bit    ram_BA                ; 3
    bvc    LF83B                 ; 2³
    bvs    LF82E                 ; 3   always branch

LF850:
    dey                          ; 2
    bne    LF828                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF854 SUBROUTINE  ;x2
    ldy    #$00                  ; 2
LF856:
    lda    ram_C4                ; 3
    cmp    LFF6B,X               ; 4
    bcc    LF870                 ; 2³
    cmp    LFF6C,X               ; 4
    bcs    LF870                 ; 2³
    lda    ram_C3                ; 3
    cmp    LFF6D,X               ; 4
    bcc    LF870                 ; 2³
    cmp    LFF6E,X               ; 4
    bcs    LF870                 ; 2³
    tax                          ; 2
    rts                          ; 6

LF870:
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    iny                          ; 2
    cpy    #$03                  ; 2
    bne    LF856                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;jumped to from LF664 SUBROUTINE

LF87A:
    ldx    #$00                  ; 2
    cpx    ram_BB                ; 3
    beq    LF8B2                 ; 2³
LF880:
    lda    ram_B8,X              ; 4
    tay                          ; 2
    bit    ram_BF                ; 3
    bmi    LF89F                 ; 2³
    bvc    LF8B2                 ; 2³
    bit    ram_96                ; 3
    bpl    LF892                 ; 2³
    txa                          ; 2
    beq    LF8A9                 ; 2³
    bne    LF895                 ; 3   always branch

LF892:
    txa                          ; 2
    bne    LF8A9                 ; 2³
LF895:
    tya                          ; 2
    clc                          ; 2
    adc    #$E8                  ; 2
    bcs    LF8A7                 ; 2³
    lda    #$01                  ; 2
    bne    LF8A7                 ; 3   always branch

LF89F:
    tya                          ; 2
    clc                          ; 2
    adc    #$10                  ; 2
    bcc    LF8A7                 ; 2³
    lda    #$FF                  ; 2
LF8A7:
    sta    ram_B8,X              ; 4
LF8A9:
    inx                          ; 2
    cpx    #$02                  ; 2
    bne    LF880                 ; 2³
    lda    #$00                  ; 2
    sta    ram_BF                ; 3
LF8B2:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF8B3 SUBROUTINE  ;x1
    ldy    #$FF                  ; 2
    lda    ram_BD                ; 3
    bne    LF8C5                 ; 2³
    lda    SWCHB                 ; 4
    rol                          ; 2
    ldx    ram_AE                ; 3
    bne    LF8C2                 ; 2³
    rol                          ; 2
LF8C2:
    bcs    LF8C5                 ; 2³
    iny                          ; 2
LF8C5:
    sty    ram_AB                ; 3
    ldx    #$FF                  ; 2
    tya                          ; 2
    bpl    LF8CE                 ; 2³
    ldx    #$FB                  ; 2
LF8CE:
    stx    ram_AA                ; 3
    lda    ram_C4                ; 3
    cmp    #$C0                  ; 2
    bcc    LF934                 ; 2³+1
    inc    ram_A9                ; 5
    jmp    LF98D                 ; 3

LF8DB SUBROUTINE  ;x1
    lda    ram_BB                ; 3
    beq    LF901                 ; 2³+1
    bit    ram_BA                ; 3
    lda    ram_B9                ; 3
    bvs    LF8F8                 ; 2³
    sec                          ; 2
    sbc    ram_D7                ; 3
    bcs    LF8FF                 ; 2³
    eor    #$FF                  ; 2
    adc    #$01                  ; 2
    sta    ram_B9                ; 3
    lda    ram_BA                ; 3
    ora    #$40                  ; 2
    sta    ram_BA                ; 3
    bne    LF901                 ; 3+1   always branch

LF8F8:
    clc                          ; 2
    adc    ram_D7                ; 3
    bcc    LF8FF                 ; 2³
    lda    #$FF                  ; 2
LF8FF:
    sta    ram_B9                ; 3
LF901:
    lda    ram_A9                ; 3
    beq    LF934                 ; 2³
    lda    ram_D8                ; 3
    bne    LF934                 ; 2³
    lda    ram_A6                ; 3
    beq    LF935                 ; 2³
    dec    ram_A6                ; 5
    lda    #$43                  ; 2
    sta    ram_D8                ; 3
    lda    ram_CB                ; 3
    sec                          ; 2
    sbc    #$08                  ; 2
    bne    LF91C                 ; 2³
    lda    #$48                  ; 2
LF91C:
    sta    ram_CB                ; 3
    ldy    ram_AD                ; 3
    iny                          ; 2
    cpy    #$05                  ; 2
    bcc    LF927                 ; 2³
    ldy    #$04                  ; 2
LF927:
    tya                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sed                          ; 2
    ldx    ram_AE                ; 3
    adc    ram_B2,X              ; 4
    jsr    LFBF5                 ; 6
LF934:
    rts                          ; 6

LF935:
    sta    ram_A9                ; 3
    sta    ram_AC                ; 3
    ldx    ram_A8                ; 3
    beq    LF945                 ; 2³
    sta    ram_A8                ; 3
    jsr    LF97A                 ; 6
    jmp    LF98D                 ; 3

LF945:
    lda    ram_A1                ; 3
    tax                          ; 2
    lsr                          ; 2
    bcs    LF953                 ; 2³
    lda    ram_AE                ; 3
    eor    #$01                  ; 2
    sta    ram_AE                ; 3
    bne    LF960                 ; 2³
LF953:
    ldy    ram_99                ; 3
    cpy    #$03                  ; 2
    beq    LF95D                 ; 2³
    inc    ram_99                ; 5
    bne    LF960                 ; 2³
LF95D:
    inc    ram_AF                ; 5
    rts                          ; 6

LF960:
    txa                          ; 2
    ldx    #$08                  ; 2
    cmp    #$03                  ; 2
    bcs    LF970                 ; 2³
    lsr                          ; 2
    bcs    LF976                 ; 2³
    lda    ram_CC                ; 3
    ldx    ram_C7                ; 3
    sta    ram_C7                ; 3
LF970:
    stx    ram_CC                ; 3
    stx    ram_D1                ; 3
    stx    ram_D3                ; 3
LF976:
    lda    #$00                  ; 2
    sta    ram_AD                ; 3
LF97A SUBROUTINE  ;x1
    lda    #$00                  ; 2
    sta    ram_D2                ; 3
    sta    ram_D4                ; 3
    sta    ram_D5                ; 3
    sta    ram_D6                ; 3
LF984 SUBROUTINE  ;x1
    lda    #$50                  ; 2
    sta    ram_C8                ; 3
    sta    ram_C9                ; 3
    sta    ram_CA                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;ending for 3 subroutines

LF98D:
    lda    #$00                  ; 2
    ldx    #$09                  ; 2
LF991:
    dex                          ; 2
    sta    ram_B8,X              ; 4
    bne    LF991                 ; 2³
    lda    #$95                  ; 2
    sta    ram_C3                ; 3
    lda    #$84                  ; 2
    sta    ram_C4                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LF99F SUBROUTINE  ;x1
    sec                          ; 2
    lda    #$BE                  ; 2
    sbc    ram_C4                ; 3
    sta    ram_80                ; 3
    lda    #$3F                  ; 2
    clc                          ; 2
    adc    ram_80                ; 3
    cmp    ram_C3                ; 3
    bcs    LF9F7                 ; 2³
    lda    #$5E                  ; 2
    sec                          ; 2
    sbc    ram_80                ; 3
    cmp    ram_C3                ; 3
    bcc    LF9F7                 ; 2³
    lda    ram_8B                ; 3
    bne    LF9F7                 ; 2³
    lda    ram_C3                ; 3
    cmp    #$4F                  ; 2
    bcs    LF9D0                 ; 2³
    lda    ram_E2                ; 3
    cmp    #$30                  ; 2
    bne    LF9F7                 ; 2³
    bit    ram_BA                ; 3
    bmi    LF9F7                 ; 2³
    bvc    LF9EA                 ; 2³
    bvs    LF9DC                 ; 3   always branch

LF9D0:
    lda    ram_E6                ; 3
    cmp    #$B0                  ; 2
    bne    LF9F7                 ; 2³
    bit    ram_BA                ; 3
    bpl    LF9F7                 ; 2³
    bvc    LF9EA                 ; 2³
LF9DC:
    lda    ram_C4                ; 3
    cmp    #$BA                  ; 2
    bcs    LF9EA                 ; 2³
    lda    ram_B8                ; 3
    lsr                          ; 2
    nop                          ; 2
    cmp    ram_B9                ; 3
    bcc    LF9F7                 ; 2³
LF9EA:
    lda    #$00                  ; 2
    sta    ram_B8                ; 3
    lda    #$40                  ; 2
    sta    ram_B9                ; 3
    sta    ram_BA                ; 3
    sta    ram_BE                ; 3
LF9F6:
    rts                          ; 6

LF9F7:
    bit    ram_BE                ; 3
    bvs    LF9F6                 ; 2³
    lda    #$03                  ; 2
    sta    ram_8B                ; 3
    lda    ram_C3                ; 3
    cmp    #$4F                  ; 2
    bcc    LFA21                 ; 2³
LFA05:
    ldx    #$02                  ; 2
    lda    ram_E6                ; 3
    cmp    #$80                  ; 2
    beq    LFA3D                 ; 2³
    ldx    #$01                  ; 2
    cmp    #$90                  ; 2
    beq    LFA3D                 ; 2³
    ldx    #$82                  ; 2
    cmp    #$A0                  ; 2
    beq    LFA3D                 ; 2³
    ldx    #$84                  ; 2
    cmp    #$B0                  ; 2
    beq    LFA3D                 ; 2³
    bne    LFA05                 ; 3   always branch

LFA21:
    ldx    #$82                  ; 2
    lda    ram_E2                ; 3
    cmp    #$00                  ; 2
    beq    LFA3D                 ; 2³
    ldx    #$81                  ; 2
    cmp    #$10                  ; 2
    beq    LFA3D                 ; 2³
    ldx    #$02                  ; 2
    cmp    #$20                  ; 2
    beq    LFA3D                 ; 2³
    ldx    #$04                  ; 2
    cmp    #$30                  ; 2
    beq    LFA3D                 ; 2³
    bne    LFA21                 ; 3   always branch

LFA3D:
    stx    ram_92                ; 3
    ldx    #$01                  ; 2
LFA41:
    lda    ram_B8,X              ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_80,X              ; 4
    bne    LFA4E                 ; 2³
    lda    #$01                  ; 2
    bne    LFA5D                 ; 3   always branch

LFA4E:
    lda    ram_92                ; 3
    and    #$07                  ; 2
    tay                          ; 2
    lda    ram_80,X              ; 4
    clc                          ; 2
LFA56:
    dey                          ; 2
    beq    LFA5D                 ; 2³
    adc    ram_80,X              ; 4
    bne    LFA56                 ; 2³
LFA5D:
    sta    ram_80,X              ; 4
    dex                          ; 2
    beq    LFA41                 ; 2³
    bit    ram_92                ; 3
    bpl    LFA6C                 ; 2³
    bit    ram_BA                ; 3
    bpl    LFA72                 ; 2³
    bmi    LFA87                 ; 3   always branch

LFA6C:
    bit    ram_BA                ; 3
    bmi    LFA72                 ; 2³
    bpl    LFA87                 ; 3   always branch

LFA72:
    sec                          ; 2
    lda    ram_B8                ; 3
    sbc    ram_81                ; 3
    bcs    LFA8C                 ; 2³
    eor    #$FF                  ; 2
    adc    #$01                  ; 2
    tax                          ; 2
    lda    ram_BA                ; 3
    eor    #$80                  ; 2
    sta    ram_BA                ; 3
    txa                          ; 2
    bne    LFA8C                 ; 2³
LFA87:
    lda    ram_81                ; 3
    clc                          ; 2
    adc    ram_B8                ; 3
LFA8C:
    sta    ram_B8                ; 3
    lda    ram_B9                ; 3
    sec                          ; 2
    sbc    ram_81                ; 3
    bcc    LFA97                 ; 2³
    sta    ram_B9                ; 3
LFA97:
    lda    ram_BA                ; 3
    and    #$BF                  ; 2
    sta    ram_BA                ; 3
    clc                          ; 2
    lda    ram_B9                ; 3
    adc    ram_80                ; 3
    bcc    LFAA6                 ; 2³
    lda    #$FF                  ; 2
LFAA6:
    sta    ram_B9                ; 3
    sec                          ; 2
    lda    ram_B8                ; 3
    sbc    ram_80                ; 3
    bcc    LFAB1                 ; 2³
    sta    ram_B8                ; 3
LFAB1:
    lda    ram_C3                ; 3
    cmp    #$4F                  ; 2
    bcs    LFABF                 ; 2³
    lda    ram_8D                ; 3
    and    #$7F                  ; 2
    beq    LFADD                 ; 2³
    bne    LFAC5                 ; 3   always branch

LFABF:
    lda    ram_8C                ; 3
    and    #$7F                  ; 2
    beq    LFADD                 ; 2³
LFAC5:
    lda    ram_C3                ; 3
    cmp    #$44                  ; 2
    bcc    LFAD3                 ; 2³
    cmp    #$5F                  ; 2
    bcs    LFAD3                 ; 2³
    lda    #$80                  ; 2
    bne    LFAD5                 ; 3   always branch

LFAD3:
    lda    #$28                  ; 2
LFAD5:
    adc    ram_B9                ; 3
    bcc    LFADB                 ; 2³
    lda    #$FF                  ; 2
LFADB:
    sta    ram_B9                ; 3
LFADD:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFADE SUBROUTINE  ;x1
    lda    ram_C4                ; 3
    cmp    #$B3                  ; 2
    bcc    LFAFE                 ; 2³
    lda    ram_C3                ; 3
    cmp    #$49                  ; 2
    bcc    LFAFE                 ; 2³
    cmp    #$4C                  ; 2
    bcs    LFAFE                 ; 2³
    ldx    ram_8D                ; 3
    bne    LFAFF                 ; 2³
    cmp    #$51                  ; 2
    bcc    LFAFE                 ; 2³
    cmp    #$55                  ; 2
    bcs    LFAFE                 ; 2³
    ldx    ram_8C                ; 3
    bne    LFAFF                 ; 2³
LFAFE:
    rts                          ; 6

LFAFF:
    jmp    LF9F7                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFB02:
    jsr    LFBE9                 ; 6
    lda    ram_9A                ; 3
    ror                          ; 2
    ror                          ; 2
    and    #$C0                  ; 2
    sta    ram_BA                ; 3
    asl                          ; 2
    bcc    LFB15                 ; 2³
    lsr    ram_B8                ; 5
    asl    ram_B9                ; 5
    rts                          ; 6

LFB15:
    asl    ram_B8                ; 5
    lsr    ram_B9                ; 5
    rts                          ; 6

LFB1A:
    lda    #$10                  ; 2
    adc    ram_B2,X              ; 4
    jsr    LFBF5                 ; 6
    lda    #$76                  ; 2
    sta    ram_D8                ; 3
    lda    #$10                  ; 2
    sta    ram_C0                ; 3
    rts                          ; 6

LFB2A SUBROUTINE  ;x1
    ldx    ram_AE                ; 3
    lda    ram_A7                ; 3
    ora    ram_BD                ; 3
    bne    LFB53                 ; 2³
    bit    CXP0FB                ; 3
    bvc    LFB53                 ; 2³
    ldy    ram_C4                ; 3
    cpy    #$90                  ; 2
    bcs    LFB53                 ; 2³
    lda    #$F3                  ; 2
    sta    ram_A7                ; 3
    and    ram_9A                ; 3
    sta    ram_9A                ; 3
    sed                          ; 2
    cpy    #$30                  ; 2
    bcc    LFB81                 ; 2³
    cpy    #$50                  ; 2
    bcc    LFBA2                 ; 2³
    cpy    #$70                  ; 2
    bcc    LFB02                 ; 2³
    bcs    LFB1A                 ; 3   always branch

LFB53:
    cld                          ; 2
    lda    ram_9A                ; 3
    and    #$1F                  ; 2
    bne    LFB5C                 ; 2³
    sta    ram_A7                ; 3
LFB5C:
    lda    ram_9A                ; 3
    lsr                          ; 2
    bcc    LFB77                 ; 2³
    lda    ram_C0                ; 3
    beq    LFB67                 ; 2³
    dec    ram_C0                ; 5
LFB67:
    lda    ram_CE                ; 3
    cmp    #$6C                  ; 2
    bne    LFB6F                 ; 2³
    lda    #$50                  ; 2
LFB6F:
    clc                          ; 2
    adc    #$07                  ; 2
    sta    ram_CE                ; 3
    sta    ram_CF                ; 3
    rts                          ; 6

LFB77:
    lsr                          ; 2
    bcc    LFB80                 ; 2³
    lsr    ram_A5                ; 5
    lsr    ram_A4                ; 5
    lsr    ram_A3                ; 5
LFB80:
    rts                          ; 6

LFB81:
    sec                          ; 2
    jsr    LFBF0                 ; 6
    lda    ram_C3                ; 3
    ldx    #$00                  ; 2
    cmp    #$48                  ; 2
    bcc    LFB93                 ; 2³
    cmp    #$58                  ; 2
    bcc    LFB92                 ; 2³
    inx                          ; 2
LFB92:
    inx                          ; 2
LFB93:
    lda    #$00                  ; 2
    sta    ram_C8,X              ; 4
    lda    #$BF                  ; 2
    sta    ram_D8                ; 3
    lda    #$40                  ; 2
    ora    ram_BA                ; 3
    sta    ram_BA                ; 3
    rts                          ; 6

LFBA2:
    lda    #$62                  ; 2
    sta    ram_D8                ; 3
    lda    #$0C                  ; 2
    sta    ram_B8                ; 3
    bit    ram_C3                ; 3
    bvs    LFBC3                 ; 2³
    lda    ram_CB                ; 3
    cld                          ; 2
    clc                          ; 2
    adc    #$08                  ; 2
    cmp    #$50                  ; 2
    bne    LFBBA                 ; 2³
    lda    #$08                  ; 2
LFBBA:
    sta    ram_CB                ; 3
    sec                          ; 2
    jsr    LFBF0                 ; 6
    inc    ram_A6                ; 5
    rts                          ; 6

LFBC3:
    sec                          ; 2
    jsr    LFBF0                 ; 6
    ldx    ram_A8                ; 3
    bne    LFBD9                 ; 2³
    ldx    ram_AC                ; 3
    cpx    #$03                  ; 2
    beq    LFBDA                 ; 2³
    lda    #$73                  ; 2
    sta    ram_D4,X              ; 4
    inc    ram_AC                ; 5
    inc    ram_AD                ; 5
LFBD9:
    rts                          ; 6

LFBDA:
    lda    #$00                  ; 2
    sta    ram_AC                ; 3
    ldx    #$10                  ; 2
    stx    ram_C0                ; 3
    ldx    #$83                  ; 2
    stx    ram_D5                ; 3
    inc    ram_A8                ; 5
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFBE9 SUBROUTINE  ;x1
    clc                          ; 2
    lda    ram_B0,X              ; 4
    adc    #1                    ; 2
    sta    ram_B0,X              ; 4
LFBF0 SUBROUTINE  ;x3
    sed                          ; 2
    lda    ram_B2,X              ; 4
    adc    #0                    ; 2
LFBF5 SUBROUTINE  ;x3
    sta    ram_B2,X              ; 4
    lda    ram_B4,X              ; 4
    adc    #0                    ; 2
    sta    ram_B4,X              ; 4
    cld                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $00 ; |        | $FBFF

       ORG $FC00

    .byte $00 ; |        | $FC00
    .byte $00 ; |        | $FC01
    .byte $00 ; |        | $FC02
    .byte $00 ; |        | $FC03
    .byte $00 ; |        | $FC04
    .byte $00 ; |        | $FC05
    .byte $00 ; |        | $FC06
    .byte $00 ; |        | $FC07
    .byte $00 ; |        | $FC08
    .byte $10 ; |   X    | $FC09
    .byte $30 ; |  XX    | $FC0A
    .byte $10 ; |   X    | $FC0B
    .byte $10 ; |   X    | $FC0C
    .byte $10 ; |   X    | $FC0D
    .byte $38 ; |  XXX   | $FC0E
    .byte $00 ; |        | $FC0F
    .byte $00 ; |        | $FC10
    .byte $78 ; | XXXX   | $FC11
    .byte $48 ; | X  X   | $FC12
    .byte $08 ; |    X   | $FC13
    .byte $78 ; | XXXX   | $FC14
    .byte $40 ; | X      | $FC15
    .byte $78 ; | XXXX   | $FC16
    .byte $00 ; |        | $FC17
    .byte $00 ; |        | $FC18
    .byte $78 ; | XXXX   | $FC19
    .byte $08 ; |    X   | $FC1A
    .byte $38 ; |  XXX   | $FC1B
    .byte $08 ; |    X   | $FC1C
    .byte $08 ; |    X   | $FC1D
    .byte $78 ; | XXXX   | $FC1E
    .byte $00 ; |        | $FC1F
    .byte $00 ; |        | $FC20
    .byte $48 ; | X  X   | $FC21
    .byte $48 ; | X  X   | $FC22
    .byte $48 ; | X  X   | $FC23
    .byte $7C ; | XXXXX  | $FC24
    .byte $08 ; |    X   | $FC25
    .byte $08 ; |    X   | $FC26
    .byte $00 ; |        | $FC27
    .byte $00 ; |        | $FC28
    .byte $78 ; | XXXX   | $FC29
    .byte $40 ; | X      | $FC2A
    .byte $78 ; | XXXX   | $FC2B
    .byte $08 ; |    X   | $FC2C
    .byte $48 ; | X  X   | $FC2D
    .byte $78 ; | XXXX   | $FC2E
    .byte $00 ; |        | $FC2F
    .byte $00 ; |        | $FC30
    .byte $78 ; | XXXX   | $FC31
    .byte $40 ; | X      | $FC32
    .byte $78 ; | XXXX   | $FC33
    .byte $48 ; | X  X   | $FC34
    .byte $48 ; | X  X   | $FC35
    .byte $78 ; | XXXX   | $FC36
    .byte $00 ; |        | $FC37
    .byte $00 ; |        | $FC38
    .byte $78 ; | XXXX   | $FC39
    .byte $48 ; | X  X   | $FC3A
    .byte $08 ; |    X   | $FC3B
    .byte $10 ; |   X    | $FC3C
    .byte $10 ; |   X    | $FC3D
    .byte $10 ; |   X    | $FC3E
    .byte $00 ; |        | $FC3F
    .byte $00 ; |        | $FC40
    .byte $78 ; | XXXX   | $FC41
    .byte $48 ; | X  X   | $FC42
    .byte $78 ; | XXXX   | $FC43
    .byte $48 ; | X  X   | $FC44
    .byte $48 ; | X  X   | $FC45
    .byte $78 ; | XXXX   | $FC46
    .byte $00 ; |        | $FC47
    .byte $00 ; |        | $FC48
    .byte $78 ; | XXXX   | $FC49
    .byte $48 ; | X  X   | $FC4A
    .byte $78 ; | XXXX   | $FC4B
    .byte $08 ; |    X   | $FC4C
    .byte $48 ; | X  X   | $FC4D
    .byte $78 ; | XXXX   | $FC4E
    .byte $00 ; |        | $FC4F
    .byte $10 ; |   X    | $FC50
    .byte $28 ; |  X X   | $FC51
    .byte $54 ; | X X X  | $FC52
    .byte $BA ; |X XXX X | $FC53
    .byte $54 ; | X X X  | $FC54
    .byte $28 ; |  X X   | $FC55
    .byte $10 ; |   X    | $FC56
    .byte $00 ; |        | $FC57
    .byte $30 ; |  XX    | $FC58
    .byte $00 ; |        | $FC59
    .byte $00 ; |        | $FC5A
    .byte $84 ; |X    X  | $FC5B
    .byte $48 ; | X  X   | $FC5C
    .byte $00 ; |        | $FC5D
    .byte $00 ; |        | $FC5E
    .byte $10 ; |   X    | $FC5F
    .byte $08 ; |    X   | $FC60
    .byte $80 ; |X       | $FC61
    .byte $80 ; |X       | $FC62
    .byte $08 ; |    X   | $FC63
    .byte $10 ; |   X    | $FC64
    .byte $00 ; |        | $FC65
    .byte $00 ; |        | $FC66
    .byte $48 ; | X  X   | $FC67
    .byte $84 ; |X    X  | $FC68
    .byte $00 ; |        | $FC69
    .byte $00 ; |        | $FC6A
    .byte $30 ; |  XX    | $FC6B
    .byte $00 ; |        | $FC6C
    .byte $20 ; |  X     | $FC6D
    .byte $40 ; | X      | $FC6E
    .byte $04 ; |     X  | $FC6F
    .byte $04 ; |     X  | $FC70
    .byte $40 ; | X      | $FC71
    .byte $20 ; |  X     | $FC72
    .byte $00 ; |        | $FC73
    .byte $28 ; |  X X   | $FC74
    .byte $28 ; |  X X   | $FC75
    .byte $28 ; |  X X   | $FC76
    .byte $28 ; |  X X   | $FC77
    .byte $54 ; | X X X  | $FC78
    .byte $92 ; |X  X  X | $FC79
    .byte $00 ; |        | $FC7A
    .byte $10 ; |   X    | $FC7B
    .byte $38 ; |  XXX   | $FC7C
    .byte $54 ; | X X X  | $FC7D
    .byte $FE ; |XXXXXXX | $FC7E
    .byte $54 ; | X X X  | $FC7F
    .byte $38 ; |  XXX   | $FC80
    .byte $10 ; |   X    | $FC81
    .byte $00 ; |        | $FC82
    .byte $EE ; |XXX XXX | $FC83
    .byte $44 ; | X   X  | $FC84
    .byte $28 ; |  X X   | $FC85
    .byte $10 ; |   X    | $FC86
    .byte $28 ; |  X X   | $FC87
    .byte $44 ; | X   X  | $FC88
    .byte $EE ; |XXX XXX | $FC89

    .byte $00 ; |        | $FC8A

LFC8B:
    .byte $95 ; |X  X X X| $FC8B  ram_C2
    .byte $95 ; |X  X X X| $FC8C  ram_C3
    .byte $84 ; |X    X  | $FC8D  ram_C4
    .byte $42 ; | X    X | $FC8E  ram_C5
    .byte $43 ; | X    XX| $FC8F  ram_C6
    .byte $08 ; |    X   | $FC90  ram_C7
    .byte $50 ; | X X    | $FC91  ram_C8
    .byte $50 ; | X X    | $FC92  ram_C9
    .byte $50 ; | X X    | $FC93  ram_CA
    .byte $08 ; |    X   | $FC94  ram_CB
    .byte $08 ; |    X   | $FC95  ram_CC
    .byte $73 ; | XXX  XX| $FC96  ram_CD
    .byte $57 ; | X X XXX| $FC97  ram_CE
    .byte $57 ; | X X XXX| $FC98  ram_CF
    .byte $30 ; |  XX    | $FC99  ram_D0
    .byte $08 ; |    X   | $FC9A  ram_D1
    .byte $00 ; |        | $FC9B  ram_D2
    .byte $08 ; |    X   | $FC9C  ram_D3
    .byte $00 ; |        | $FC9D  ram_D4
    .byte $00 ; |        | $FC9E  ram_D5
    .byte $00 ; |        | $FC9F  ram_D6
LFCA0:
    .byte $03 ; |      XX| $FCA0  ram_D7
    .byte $00 ; |        | $FCA1  ram_D8
    .byte $FE ; |XXXXXXX | $FCA2  ram_D9
    .byte $00 ; |        | $FCA3  ram_DA
    .byte $FC ; |XXXXXX  | $FCA4  ram_DB
    .byte $00 ; |        | $FCA5  ram_DC
    .byte $FC ; |XXXXXX  | $FCA6  ram_DD
    .byte $00 ; |        | $FCA7  ram_DE
    .byte $FC ; |XXXXXX  | $FCA8  ram_DF
    .byte $00 ; |        | $FCA9  ram_E0
    .byte $FC ; |XXXXXX  | $FCAA  ram_E1
    .byte $00 ; |        | $FCAB  ram_E2
    .byte $FD ; |XXXXXX X| $FCAC  ram_E3
    .byte $40 ; | X      | $FCAD  ram_E4
    .byte $FD ; |XXXXXX X| $FCAE  ram_E5
    .byte $80 ; |X       | $FCAF  ram_E6
    .byte $FD ; |XXXXXX X| $FCB0  ram_E7
    .byte $C0 ; |XX      | $FCB1  ram_E8
    .byte $FD ; |XXXXXX X| $FCB2  ram_E9

LFCB3:
    .byte $F0 ; |XXXX    | $FCB3
    .byte $FF ; |XXXXXXXX| $FCB4
    .byte $FF ; |XXXXXXXX| $FCB5
    .byte $70 ; | XXX    | $FCB6
    .byte $00 ; |        | $FCB7
    .byte $00 ; |        | $FCB8
    .byte $30 ; |  XX    | $FCB9
    .byte $00 ; |        | $FCBA
    .byte $00 ; |        | $FCBB
    .byte $30 ; |  XX    | $FCBC
    .byte $00 ; |        | $FCBD
    .byte $00 ; |        | $FCBE
    .byte $30 ; |  XX    | $FCBF
    .byte $02 ; |      X | $FCC0
    .byte $C2 ; |XX    X | $FCC1
    .byte $B0 ; |X XX    | $FCC2
    .byte $02 ; |      X | $FCC3
    .byte $42 ; | X    X | $FCC4
    .byte $B0 ; |X XX    | $FCC5
    .byte $02 ; |      X | $FCC6
    .byte $42 ; | X    X | $FCC7
    .byte $B0 ; |X XX    | $FCC8
    .byte $02 ; |      X | $FCC9
    .byte $C2 ; |XX    X | $FCCA
    .byte $B0 ; |X XX    | $FCCB
    .byte $00 ; |        | $FCCC
    .byte $00 ; |        | $FCCD
    .byte $B0 ; |X XX    | $FCCE
    .byte $00 ; |        | $FCCF
    .byte $00 ; |        | $FCD0
    .byte $B0 ; |X XX    | $FCD1
    .byte $00 ; |        | $FCD2
    .byte $00 ; |        | $FCD3
    .byte $B0 ; |X XX    | $FCD4
    .byte $00 ; |        | $FCD5
    .byte $C0 ; |XX      | $FCD6
    .byte $B0 ; |X XX    | $FCD7
    .byte $03 ; |      XX| $FCD8
    .byte $03 ; |      XX| $FCD9
    .byte $B0 ; |X XX    | $FCDA
    .byte $02 ; |      X | $FCDB
    .byte $02 ; |      X | $FCDC
    .byte $B0 ; |X XX    | $FCDD
    .byte $02 ; |      X | $FCDE
    .byte $02 ; |      X | $FCDF
    .byte $B0 ; |X XX    | $FCE0
    .byte $03 ; |      XX| $FCE1
    .byte $03 ; |      XX| $FCE2
    .byte $B0 ; |X XX    | $FCE3
    .byte $00 ; |        | $FCE4
    .byte $00 ; |        | $FCE5
    .byte $B0 ; |X XX    | $FCE6
    .byte $80 ; |X       | $FCE7
    .byte $00 ; |        | $FCE8
    .byte $B0 ; |X XX    | $FCE9
    .byte $C0 ; |XX      | $FCEA
    .byte $00 ; |        | $FCEB
    .byte $B0 ; |X XX    | $FCEC
    .byte $E0 ; |XXX     | $FCED
    .byte $00 ; |        | $FCEE
    .byte $F0 ; |XXXX    | $FCEF
    .byte $00 ; |        | $FCF0
    .byte $B0 ; |X XX    | $FCF1
    .byte $00 ; |        | $FCF2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFCF3 SUBROUTINE  ;x1
    lda    ram_C4                ; 3
    lsr                          ; 2
    sta    ram_C5                ; 3
    tya                          ; 2
    tax                          ; 2
    rol                          ; 2
    sta    VDELBL                ; 3
    stx    CXCLR                 ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $FD00

    .byte $00 ; |        | $FD00
    .byte $00 ; |        | $FD01
    .byte $00 ; |        | $FD02
    .byte $00 ; |        | $FD03
    .byte $00 ; |        | $FD04
    .byte $00 ; |        | $FD05
    .byte $00 ; |        | $FD06
    .byte $00 ; |        | $FD07
    .byte $C0 ; |XX      | $FD08
    .byte $F0 ; |XXXX    | $FD09
    .byte $FC ; |XXXXXX  | $FD0A
    .byte $FF ; |XXXXXXXX| $FD0B
    .byte $FF ; |XXXXXXXX| $FD0C
    .byte $FF ; |XXXXXXXX| $FD0D
    .byte $07 ; |     XXX| $FD0E
    .byte $00 ; |        | $FD0F
    .byte $00 ; |        | $FD10
    .byte $00 ; |        | $FD11
    .byte $00 ; |        | $FD12
    .byte $00 ; |        | $FD13
    .byte $00 ; |        | $FD14
    .byte $00 ; |        | $FD15
    .byte $00 ; |        | $FD16
    .byte $00 ; |        | $FD17
    .byte $F8 ; |XXXXX   | $FD18
    .byte $FF ; |XXXXXXXX| $FD19
    .byte $FF ; |XXXXXXXX| $FD1A
    .byte $FF ; |XXXXXXXX| $FD1B
    .byte $FF ; |XXXXXXXX| $FD1C
    .byte $F8 ; |XXXXX   | $FD1D
    .byte $00 ; |        | $FD1E
    .byte $00 ; |        | $FD1F
    .byte $00 ; |        | $FD20
    .byte $00 ; |        | $FD21
    .byte $00 ; |        | $FD22
    .byte $00 ; |        | $FD23
    .byte $00 ; |        | $FD24
    .byte $00 ; |        | $FD25
    .byte $01 ; |       X| $FD26
    .byte $1F ; |   XXXXX| $FD27
    .byte $FF ; |XXXXXXXX| $FD28
    .byte $FF ; |XXXXXXXX| $FD29
    .byte $FE ; |XXXXXXX | $FD2A
    .byte $F8 ; |XXXXX   | $FD2B
    .byte $F0 ; |XXXX    | $FD2C
    .byte $C0 ; |XX      | $FD2D
    .byte $00 ; |        | $FD2E
    .byte $00 ; |        | $FD2F
    .byte $00 ; |        | $FD30
    .byte $00 ; |        | $FD31
    .byte $00 ; |        | $FD32
    .byte $01 ; |       X| $FD33
    .byte $03 ; |      XX| $FD34
    .byte $0F ; |    XXXX| $FD35
    .byte $1F ; |   XXXXX| $FD36
    .byte $7E ; | XXXXXX | $FD37
    .byte $FC ; |XXXXXX  | $FD38
    .byte $F8 ; |XXXXX   | $FD39
    .byte $F0 ; |XXXX    | $FD3A
    .byte $E0 ; |XXX     | $FD3B
    .byte $C0 ; |XX      | $FD3C
    .byte $80 ; |X       | $FD3D
    .byte $00 ; |        | $FD3E
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
    .byte $C0 ; |XX      | $FD4C
    .byte $F0 ; |XXXX    | $FD4D
    .byte $F8 ; |XXXXX   | $FD4E
    .byte $38 ; |  XXX   | $FD4F
    .byte $00 ; |        | $FD50
    .byte $00 ; |        | $FD51
    .byte $00 ; |        | $FD52
    .byte $00 ; |        | $FD53
    .byte $00 ; |        | $FD54
    .byte $00 ; |        | $FD55
    .byte $00 ; |        | $FD56
    .byte $00 ; |        | $FD57
    .byte $00 ; |        | $FD58
    .byte $C0 ; |XX      | $FD59
    .byte $F8 ; |XXXXX   | $FD5A
    .byte $F8 ; |XXXXX   | $FD5B
    .byte $C0 ; |XX      | $FD5C
    .byte $00 ; |        | $FD5D
    .byte $00 ; |        | $FD5E
    .byte $00 ; |        | $FD5F
    .byte $00 ; |        | $FD60
    .byte $00 ; |        | $FD61
    .byte $00 ; |        | $FD62
    .byte $00 ; |        | $FD63
    .byte $00 ; |        | $FD64
    .byte $18 ; |   XX   | $FD65
    .byte $F8 ; |XXXXX   | $FD66
    .byte $F0 ; |XXXX    | $FD67
    .byte $C0 ; |XX      | $FD68
    .byte $80 ; |X       | $FD69
    .byte $00 ; |        | $FD6A
    .byte $00 ; |        | $FD6B
    .byte $00 ; |        | $FD6C
    .byte $00 ; |        | $FD6D
    .byte $00 ; |        | $FD6E
    .byte $00 ; |        | $FD6F
    .byte $00 ; |        | $FD70
    .byte $30 ; |  XX    | $FD71
    .byte $70 ; | XXX    | $FD72
    .byte $E0 ; |XXX     | $FD73
    .byte $C0 ; |XX      | $FD74
    .byte $80 ; |X       | $FD75
    .byte $00 ; |        | $FD76
    .byte $00 ; |        | $FD77
    .byte $00 ; |        | $FD78
    .byte $00 ; |        | $FD79
    .byte $00 ; |        | $FD7A
    .byte $00 ; |        | $FD7B
    .byte $00 ; |        | $FD7C
    .byte $00 ; |        | $FD7D
    .byte $00 ; |        | $FD7E
    .byte $00 ; |        | $FD7F

    .byte $00 ; |        | $FD80
    .byte $00 ; |        | $FD81
    .byte $00 ; |        | $FD82
    .byte $00 ; |        | $FD83
    .byte $00 ; |        | $FD84
    .byte $00 ; |        | $FD85
    .byte $00 ; |        | $FD86
    .byte $00 ; |        | $FD87
    .byte $00 ; |        | $FD88
    .byte $00 ; |        | $FD89
    .byte $00 ; |        | $FD8A
    .byte $00 ; |        | $FD8B
    .byte $03 ; |      XX| $FD8C
    .byte $0F ; |    XXXX| $FD8D
    .byte $1F ; |   XXXXX| $FD8E
    .byte $1C ; |   XXX  | $FD8F
    .byte $00 ; |        | $FD90
    .byte $00 ; |        | $FD91
    .byte $00 ; |        | $FD92
    .byte $00 ; |        | $FD93
    .byte $00 ; |        | $FD94
    .byte $00 ; |        | $FD95
    .byte $00 ; |        | $FD96
    .byte $00 ; |        | $FD97
    .byte $00 ; |        | $FD98
    .byte $03 ; |      XX| $FD99
    .byte $1F ; |   XXXXX| $FD9A
    .byte $1F ; |   XXXXX| $FD9B
    .byte $03 ; |      XX| $FD9C
    .byte $00 ; |        | $FD9D
    .byte $00 ; |        | $FD9E
    .byte $00 ; |        | $FD9F
    .byte $00 ; |        | $FDA0
    .byte $00 ; |        | $FDA1
    .byte $00 ; |        | $FDA2
    .byte $00 ; |        | $FDA3
    .byte $00 ; |        | $FDA4
    .byte $18 ; |   XX   | $FDA5
    .byte $1F ; |   XXXXX| $FDA6
    .byte $0F ; |    XXXX| $FDA7
    .byte $03 ; |      XX| $FDA8
    .byte $01 ; |       X| $FDA9
    .byte $00 ; |        | $FDAA
    .byte $00 ; |        | $FDAB
    .byte $00 ; |        | $FDAC
    .byte $00 ; |        | $FDAD
    .byte $00 ; |        | $FDAE
    .byte $00 ; |        | $FDAF
    .byte $00 ; |        | $FDB0
    .byte $0C ; |    XX  | $FDB1
    .byte $0E ; |    XXX | $FDB2
    .byte $07 ; |     XXX| $FDB3
    .byte $03 ; |      XX| $FDB4
    .byte $01 ; |       X| $FDB5
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
    .byte $03 ; |      XX| $FDC8
    .byte $0F ; |    XXXX| $FDC9
    .byte $3F ; |  XXXXXX| $FDCA
    .byte $FF ; |XXXXXXXX| $FDCB
    .byte $FF ; |XXXXXXXX| $FDCC
    .byte $FF ; |XXXXXXXX| $FDCD
    .byte $E0 ; |XXX     | $FDCE
    .byte $00 ; |        | $FDCF
    .byte $00 ; |        | $FDD0
    .byte $00 ; |        | $FDD1
    .byte $00 ; |        | $FDD2
    .byte $00 ; |        | $FDD3
    .byte $00 ; |        | $FDD4
    .byte $00 ; |        | $FDD5
    .byte $00 ; |        | $FDD6
    .byte $00 ; |        | $FDD7
    .byte $1F ; |   XXXXX| $FDD8
    .byte $FF ; |XXXXXXXX| $FDD9
    .byte $FF ; |XXXXXXXX| $FDDA
    .byte $FF ; |XXXXXXXX| $FDDB
    .byte $FF ; |XXXXXXXX| $FDDC
    .byte $1F ; |   XXXXX| $FDDD
    .byte $00 ; |        | $FDDE
    .byte $00 ; |        | $FDDF
    .byte $00 ; |        | $FDE0
    .byte $00 ; |        | $FDE1
    .byte $00 ; |        | $FDE2
    .byte $00 ; |        | $FDE3
    .byte $00 ; |        | $FDE4
    .byte $00 ; |        | $FDE5
    .byte $80 ; |X       | $FDE6
    .byte $F8 ; |XXXXX   | $FDE7
    .byte $FF ; |XXXXXXXX| $FDE8
    .byte $FF ; |XXXXXXXX| $FDE9
    .byte $7F ; | XXXXXXX| $FDEA
    .byte $1F ; |   XXXXX| $FDEB
    .byte $0F ; |    XXXX| $FDEC
    .byte $03 ; |      XX| $FDED
    .byte $00 ; |        | $FDEE
    .byte $00 ; |        | $FDEF
    .byte $00 ; |        | $FDF0
    .byte $00 ; |        | $FDF1
    .byte $00 ; |        | $FDF2
    .byte $80 ; |X       | $FDF3
    .byte $C0 ; |XX      | $FDF4
    .byte $F0 ; |XXXX    | $FDF5
    .byte $F8 ; |XXXXX   | $FDF6
    .byte $7E ; | XXXXXX | $FDF7
    .byte $3F ; |  XXXXXX| $FDF8
    .byte $1F ; |   XXXXX| $FDF9
    .byte $0F ; |    XXXX| $FDFA
    .byte $07 ; |     XXX| $FDFB
    .byte $03 ; |      XX| $FDFC
    .byte $01 ; |       X| $FDFD
    .byte $00 ; |        | $FDFE
    .byte $00 ; |        | $FDFF

       ORG $FE00

    .byte $FF ; |XXXXXXXX| $FE00
    .byte $04 ; |     X  | $FE01
    .byte $CF ; |XX  XXXX| $FE02
    .byte $05 ; |     X X| $FE03
    .byte $CF ; |XX  XXXX| $FE04
    .byte $06 ; |     XX | $FE05
    .byte $CF ; |XX  XXXX| $FE06
    .byte $0C ; |    XX  | $FE07
    .byte $CE ; |XX  XXX | $FE08
    .byte $18 ; |   XX   | $FE09
    .byte $CB ; |XX  X XX| $FE0A
    .byte $1E ; |   XXXX | $FE0B
    .byte $C0 ; |XX      | $FE0C
    .byte $04 ; |     X  | $FE0D
    .byte $CF ; |XX  XXXX| $FE0E
    .byte $06 ; |     XX | $FE0F
    .byte $CF ; |XX  XXXX| $FE10
    .byte $08 ; |    X   | $FE11
    .byte $CF ; |XX  XXXX| $FE12
    .byte $0A ; |    X X | $FE13
    .byte $CF ; |XX  XXXX| $FE14
    .byte $0C ; |    XX  | $FE15
    .byte $CB ; |XX  X XX| $FE16
    .byte $0E ; |    XXX | $FE17
    .byte $C7 ; |XX   XXX| $FE18
    .byte $FF ; |XXXXXXXX| $FE19
    .byte $03 ; |      XX| $FE1A
    .byte $FF ; |XXXXXXXX| $FE1B
    .byte $03 ; |      XX| $FE1C
    .byte $F0 ; |XXXX    | $FE1D
    .byte $03 ; |      XX| $FE1E
    .byte $FF ; |XXXXXXXX| $FE1F
    .byte $03 ; |      XX| $FE20
    .byte $FF ; |XXXXXXXX| $FE21
    .byte $03 ; |      XX| $FE22
    .byte $FE ; |XXXXXXX | $FE23
    .byte $03 ; |      XX| $FE24
    .byte $F9 ; |XXXXX  X| $FE25
    .byte $03 ; |      XX| $FE26
    .byte $F4 ; |XXXX X  | $FE27
    .byte $03 ; |      XX| $FE28
    .byte $F6 ; |XXXX XX | $FE29
    .byte $03 ; |      XX| $FE2A
    .byte $F9 ; |XXXXX  X| $FE2B
    .byte $03 ; |      XX| $FE2C
    .byte $F9 ; |XXXXX  X| $FE2D
    .byte $03 ; |      XX| $FE2E
    .byte $F7 ; |XXXX XXX| $FE2F
    .byte $03 ; |      XX| $FE30
    .byte $F5 ; |XXXX X X| $FE31
    .byte $03 ; |      XX| $FE32
    .byte $F7 ; |XXXX XXX| $FE33
    .byte $03 ; |      XX| $FE34
    .byte $F7 ; |XXXX XXX| $FE35
    .byte $03 ; |      XX| $FE36
    .byte $F5 ; |XXXX X X| $FE37
    .byte $03 ; |      XX| $FE38
    .byte $F4 ; |XXXX X  | $FE39
    .byte $03 ; |      XX| $FE3A
    .byte $F5 ; |XXXX X X| $FE3B
    .byte $03 ; |      XX| $FE3C
    .byte $F3 ; |XXXX  XX| $FE3D
    .byte $03 ; |      XX| $FE3E
    .byte $F4 ; |XXXX X  | $FE3F
    .byte $03 ; |      XX| $FE40
    .byte $F2 ; |XXXX  X | $FE41
    .byte $FF ; |XXXXXXXX| $FE42
    .byte $10 ; |   X    | $FE43
    .byte $5F ; | X XXXXX| $FE44
    .byte $11 ; |   X   X| $FE45
    .byte $5F ; | X XXXXX| $FE46
    .byte $12 ; |   X  X | $FE47
    .byte $5F ; | X XXXXX| $FE48
    .byte $13 ; |   X  XX| $FE49
    .byte $5F ; | X XXXXX| $FE4A
    .byte $14 ; |   X X  | $FE4B
    .byte $5F ; | X XXXXX| $FE4C
    .byte $15 ; |   X X X| $FE4D
    .byte $5B ; | X XX XX| $FE4E
    .byte $16 ; |   X XX | $FE4F
    .byte $57 ; | X X XXX| $FE50
    .byte $17 ; |   X XXX| $FE51
    .byte $57 ; | X X XXX| $FE52
    .byte $18 ; |   XX   | $FE53
    .byte $57 ; | X X XXX| $FE54
    .byte $19 ; |   XX  X| $FE55
    .byte $57 ; | X X XXX| $FE56
    .byte $1A ; |   XX X | $FE57
    .byte $55 ; | X X X X| $FE58
    .byte $1B ; |   XX XX| $FE59
    .byte $53 ; | X X  XX| $FE5A
    .byte $1C ; |   XXX  | $FE5B
    .byte $53 ; | X X  XX| $FE5C
    .byte $1D ; |   XXX X| $FE5D
    .byte $52 ; | X X  X | $FE5E
    .byte $1E ; |   XXXX | $FE5F
    .byte $51 ; | X X   X| $FE60
    .byte $FF ; |XXXXXXXX| $FE61
    .byte $00 ; |        | $FE62
    .byte $5F ; | X XXXXX| $FE63
    .byte $04 ; |     X  | $FE64
    .byte $5F ; | X XXXXX| $FE65
    .byte $08 ; |    X   | $FE66
    .byte $5F ; | X XXXXX| $FE67
    .byte $0C ; |    XX  | $FE68
    .byte $5F ; | X XXXXX| $FE69
    .byte $10 ; |   X    | $FE6A
    .byte $5F ; | X XXXXX| $FE6B
    .byte $14 ; |   X X  | $FE6C
    .byte $5F ; | X XXXXX| $FE6D
    .byte $18 ; |   XX   | $FE6E
    .byte $5F ; | X XXXXX| $FE6F
    .byte $1C ; |   XXX  | $FE70
    .byte $5F ; | X XXXXX| $FE71
    .byte $1E ; |   XXXX | $FE72
    .byte $5F ; | X XXXXX| $FE73
    .byte $1E ; |   XXXX | $FE74
    .byte $5F ; | X XXXXX| $FE75
    .byte $00 ; |        | $FE76
    .byte $5F ; | X XXXXX| $FE77
    .byte $04 ; |     X  | $FE78
    .byte $5F ; | X XXXXX| $FE79
    .byte $08 ; |    X   | $FE7A
    .byte $5F ; | X XXXXX| $FE7B
    .byte $0C ; |    XX  | $FE7C
    .byte $5F ; | X XXXXX| $FE7D
    .byte $10 ; |   X    | $FE7E
    .byte $5F ; | X XXXXX| $FE7F
    .byte $14 ; |   X X  | $FE80
    .byte $5F ; | X XXXXX| $FE81
    .byte $18 ; |   XX   | $FE82
    .byte $5F ; | X XXXXX| $FE83
    .byte $1C ; |   XXX  | $FE84
    .byte $5F ; | X XXXXX| $FE85
    .byte $1E ; |   XXXX | $FE86
    .byte $5F ; | X XXXXX| $FE87
    .byte $1E ; |   XXXX | $FE88
    .byte $5F ; | X XXXXX| $FE89
    .byte $FF ; |XXXXXXXX| $FE8A
    .byte $1D ; |   XXX X| $FE8B
    .byte $CF ; |XX  XXXX| $FE8C
    .byte $1C ; |   XXX  | $FE8D
    .byte $CF ; |XX  XXXX| $FE8E
    .byte $1B ; |   XX XX| $FE8F
    .byte $CF ; |XX  XXXX| $FE90
    .byte $1A ; |   XX X | $FE91
    .byte $CF ; |XX  XXXX| $FE92
    .byte $19 ; |   XX  X| $FE93
    .byte $CF ; |XX  XXXX| $FE94
    .byte $18 ; |   XX   | $FE95
    .byte $CF ; |XX  XXXX| $FE96
    .byte $16 ; |   X XX | $FE97
    .byte $CF ; |XX  XXXX| $FE98
    .byte $12 ; |   X  X | $FE99
    .byte $CF ; |XX  XXXX| $FE9A
    .byte $1E ; |   XXXX | $FE9B
    .byte $CF ; |XX  XXXX| $FE9C
    .byte $1D ; |   XXX X| $FE9D
    .byte $CF ; |XX  XXXX| $FE9E
    .byte $1C ; |   XXX  | $FE9F
    .byte $CF ; |XX  XXXX| $FEA0
    .byte $1B ; |   XX XX| $FEA1
    .byte $CF ; |XX  XXXX| $FEA2
    .byte $1A ; |   XX X | $FEA3
    .byte $CF ; |XX  XXXX| $FEA4
    .byte $19 ; |   XX  X| $FEA5
    .byte $CF ; |XX  XXXX| $FEA6
    .byte $18 ; |   XX   | $FEA7
    .byte $CF ; |XX  XXXX| $FEA8
    .byte $16 ; |   X XX | $FEA9
    .byte $CF ; |XX  XXXX| $FEAA
    .byte $12 ; |   X  X | $FEAB
    .byte $CF ; |XX  XXXX| $FEAC
    .byte $1E ; |   XXXX | $FEAD
    .byte $CF ; |XX  XXXX| $FEAE
    .byte $1D ; |   XXX X| $FEAF
    .byte $CF ; |XX  XXXX| $FEB0
    .byte $1C ; |   XXX  | $FEB1
    .byte $CF ; |XX  XXXX| $FEB2
    .byte $1B ; |   XX XX| $FEB3
    .byte $CF ; |XX  XXXX| $FEB4
    .byte $1A ; |   XX X | $FEB5
    .byte $CF ; |XX  XXXX| $FEB6
    .byte $19 ; |   XX  X| $FEB7
    .byte $CF ; |XX  XXXX| $FEB8
    .byte $18 ; |   XX   | $FEB9
    .byte $CF ; |XX  XXXX| $FEBA
    .byte $16 ; |   X XX | $FEBB
    .byte $CF ; |XX  XXXX| $FEBC
    .byte $12 ; |   X  X | $FEBD
    .byte $CF ; |XX  XXXX| $FEBE
    .byte $1E ; |   XXXX | $FEBF
    .byte $CF ; |XX  XXXX| $FEC0
    .byte $1D ; |   XXX X| $FEC1
    .byte $CF ; |XX  XXXX| $FEC2
    .byte $1C ; |   XXX  | $FEC3
    .byte $CF ; |XX  XXXX| $FEC4
    .byte $1B ; |   XX XX| $FEC5
    .byte $CF ; |XX  XXXX| $FEC6
    .byte $1A ; |   XX X | $FEC7
    .byte $CF ; |XX  XXXX| $FEC8
    .byte $19 ; |   XX  X| $FEC9
    .byte $CF ; |XX  XXXX| $FECA
    .byte $18 ; |   XX   | $FECB
    .byte $CF ; |XX  XXXX| $FECC
    .byte $16 ; |   X XX | $FECD
    .byte $CF ; |XX  XXXX| $FECE
    .byte $12 ; |   X  X | $FECF
    .byte $CF ; |XX  XXXX| $FED0
    .byte $FF ; |XXXXXXXX| $FED1
LFED2:
    .byte $38 ; |  XXX   | $FED2
LFED3:
    .byte $0B ; |    X XX| $FED3
LFED4:
    .byte $10 ; |   X    | $FED4
    .byte $38 ; |  XXX   | $FED5
    .byte $8F ; |X   XXXX| $FED6
    .byte $94 ; |X  X X  | $FED7
    .byte $B8 ; |X XXX   | $FED8
    .byte $1A ; |   XX X | $FED9
    .byte $84 ; |X    X  | $FEDA
    .byte $30 ; |  XX    | $FEDB
    .byte $27 ; |  X  XXX| $FEDC
    .byte $78 ; | XXXX   | $FEDD
    .byte $68 ; | XX X   | $FEDE
    .byte $47 ; | X   XXX| $FEDF
    .byte $58 ; | X XX   | $FEE0
    .byte $70 ; | XXX    | $FEE1
    .byte $27 ; |  X  XXX| $FEE2
    .byte $78 ; | XXXX   | $FEE3
    .byte $98 ; |X  XX   | $FEE4
    .byte $8A ; |X   X X | $FEE5
    .byte $93 ; |X  X  XX| $FEE6
    .byte $98 ; |X  XX   | $FEE7
    .byte $0A ; |    X X | $FEE8
    .byte $14 ; |   X X  | $FEE9
    .byte $A0 ; |X X     | $FEEA
    .byte $86 ; |X    XX | $FEEB
    .byte $8F ; |X   XXXX| $FEEC
    .byte $A0 ; |X X     | $FEED
    .byte $0E ; |    XXX | $FEEE
    .byte $18 ; |   XX   | $FEEF
    .byte $A8 ; |X X X   | $FEF0
    .byte $82 ; |X     X | $FEF1
    .byte $8B ; |X   X XX| $FEF2
    .byte $A8 ; |X X X   | $FEF3
    .byte $12 ; |   X  X | $FEF4
    .byte $1C ; |   XXX  | $FEF5
    .byte $B0 ; |X XX    | $FEF6
    .byte $7E ; | XXXXXX | $FEF7
    .byte $88 ; |X   X   | $FEF8
    .byte $B0 ; |X XX    | $FEF9
    .byte $18 ; |   XX   | $FEFA
    .byte $20 ; |  X     | $FEFB
    .byte $00 ; |        | $FEFC
    .byte $17 ; |   X XXX| $FEFD
    .byte $08 ; |    X   | $FEFE
    .byte $95 ; |X  X X X| $FEFF
    .byte $4F ; | X  XXXX| $FF00
    .byte $26 ; |  X  XX | $FF01
    .byte $78 ; | XXXX   | $FF02
    .byte $1F ; |   XXXXX| $FF03
    .byte $04 ; |     X  | $FF04
    .byte $99 ; |X  XX  X| $FF05
    .byte $6F ; | XX XXXX| $FF06
    .byte $47 ; | X   XXX| $FF07
    .byte $58 ; | X XX   | $FF08
    .byte $8F ; |X   XXXX| $FF09
    .byte $26 ; |  X  XX | $FF0A
    .byte $78 ; | XXXX   | $FF0B
    .byte $00 ; |        | $FF0C
    .byte $27 ; |  X  XXX| $FF0D
    .byte $2F ; |  X XXXX| $FF0E
    .byte $93 ; |X  X  XX| $FF0F
    .byte $0B ; |    X XX| $FF10
    .byte $38 ; |  XXX   | $FF11
    .byte $C3 ; |XX    XX| $FF12
    .byte $8F ; |X   XXXX| $FF13
    .byte $38 ; |  XXX   | $FF14
    .byte $9C ; |X  XXX  | $FF15
    .byte $93 ; |X  X  XX| $FF16
    .byte $16 ; |   X XX | $FF17
    .byte $23 ; |  X   XX| $FF18
    .byte $97 ; |X  X XXX| $FF19
    .byte $1E ; |   XXXX | $FF1A
    .byte $C3 ; |XX    XX| $FF1B
    .byte $73 ; | XXX  XX| $FF1C
    .byte $2F ; |  X XXXX| $FF1D
    .byte $53 ; | X X  XX| $FF1E
    .byte $67 ; | XX  XXX| $FF1F
    .byte $2F ; |  X XXXX| $FF20
    .byte $93 ; |X  X  XX| $FF21
    .byte $47 ; | X   XXX| $FF22
    .byte $2F ; |  X XXXX| $FF23
    .byte $73 ; | XXX  XX| $FF24
    .byte $33 ; |  XX  XX| $FF25
    .byte $2F ; |  X XXXX| $FF26
    .byte $53 ; | X X  XX| $FF27
    .byte $8B ; |X   X XX| $FF28
    .byte $93 ; |X  X  XX| $FF29
    .byte $A5 ; |X X  X X| $FF2A
    .byte $87 ; |X    XXX| $FF2B
    .byte $9B ; |X  XX XX| $FF2C
    .byte $AD ; |X X XX X| $FF2D
    .byte $83 ; |X     XX| $FF2E
    .byte $A3 ; |X X   XX| $FF2F
    .byte $B5 ; |X XX X X| $FF30
    .byte $7F ; | XXXXXXX| $FF31
    .byte $AB ; |X X X XX| $FF32
    .byte $BD ; |X XXXX X| $FF33
    .byte $00 ; |        | $FF34
    .byte $28 ; |  X X   | $FF35
    .byte $B7 ; |X XX XXX| $FF36
    .byte $C3 ; |XX    XX| $FF37
    .byte $7B ; | XXXX XX| $FF38
    .byte $B7 ; |X XX XXX| $FF39
    .byte $C3 ; |XX    XX| $FF3A
    .byte $00 ; |        | $FF3B
    .byte $08 ; |    X   | $FF3C
    .byte $16 ; |   X XX | $FF3D
    .byte $23 ; |  X   XX| $FF3E
    .byte $0C ; |    XX  | $FF3F
    .byte $38 ; |  XXX   | $FF40
    .byte $9C ; |X  XXX  | $FF41
    .byte $90 ; |X  X    | $FF42
    .byte $38 ; |  XXX   | $FF43
    .byte $C3 ; |XX    XX| $FF44
    .byte $04 ; |     X  | $FF45
    .byte $1E ; |   XXXX | $FF46
    .byte $C3 ; |XX    XX| $FF47
    .byte $28 ; |  X X   | $FF48
    .byte $2F ; |  X XXXX| $FF49
    .byte $53 ; | X X  XX| $FF4A
    .byte $34 ; |  XX X  | $FF4B
    .byte $2F ; |  X XXXX| $FF4C
    .byte $93 ; |X  X  XX| $FF4D
    .byte $54 ; | X X X  | $FF4E
    .byte $2F ; |  X XXXX| $FF4F
    .byte $73 ; | XXX  XX| $FF50
    .byte $68 ; | XX X   | $FF51
    .byte $2F ; |  X XXXX| $FF52
    .byte $53 ; | X X  XX| $FF53
    .byte $74 ; | XXX X  | $FF54
    .byte $2F ; |  X XXXX| $FF55
    .byte $93 ; |X  X  XX| $FF56
    .byte $10 ; |   X    | $FF57
    .byte $93 ; |X  X  XX| $FF58
    .byte $A5 ; |X X  X X| $FF59
    .byte $14 ; |   X X  | $FF5A
    .byte $9B ; |X  XX XX| $FF5B
    .byte $AD ; |X X XX X| $FF5C
    .byte $18 ; |   XX   | $FF5D
    .byte $A3 ; |X X   XX| $FF5E
    .byte $B5 ; |X XX X X| $FF5F
    .byte $1C ; |   XXX  | $FF60
    .byte $AB ; |X X X XX| $FF61
    .byte $BD ; |X XXXX X| $FF62
    .byte $00 ; |        | $FF63
    .byte $20 ; |  X     | $FF64
    .byte $B7 ; |X XX XXX| $FF65
    .byte $C3 ; |XX    XX| $FF66
    .byte $74 ; | XXX X  | $FF67
    .byte $B7 ; |X XX XXX| $FF68
    .byte $C3 ; |XX    XX| $FF69
    .byte $00 ; |        | $FF6A
LFF6B:
    .byte $98 ; |X  XX   | $FF6B
LFF6C:
    .byte $B8 ; |X XXX   | $FF6C
LFF6D:
    .byte $0E ; |    XXX | $FF6D
LFF6E:
    .byte $23 ; |  X   XX| $FF6E
    .byte $98 ; |X  XX   | $FF6F
    .byte $B8 ; |X XXX   | $FF70
    .byte $7C ; | XXXXX  | $FF71
    .byte $90 ; |X  X    | $FF72
    .byte $00 ; |        | $FF73
    .byte $00 ; |        | $FF74
    .byte $00 ; |        | $FF75
    .byte $00 ; |        | $FF76
    .byte $2F ; |  X XXXX| $FF77
    .byte $53 ; | X X  XX| $FF78
    .byte $46 ; | X   XX | $FF79
    .byte $59 ; | X XX  X| $FF7A
    .byte $6F ; | XX XXXX| $FF7B
    .byte $94 ; |X  X X  | $FF7C
    .byte $26 ; |  X  XX | $FF7D
    .byte $39 ; |  XXX  X| $FF7E
    .byte $6F ; | XX XXXX| $FF7F
    .byte $94 ; |X  X X  | $FF80
    .byte $66 ; | XX  XX | $FF81
    .byte $79 ; | XXXX  X| $FF82
LFF83:
    .byte $00 ; |        | $FF83
    .byte $80 ; |X       | $FF84
    .byte $00 ; |        | $FF85
    .byte $C0 ; |XX      | $FF86
    .byte $C0 ; |XX      | $FF87
    .byte $80 ; |X       | $FF88
    .byte $00 ; |        | $FF89
    .byte $00 ; |        | $FF8A
    .byte $00 ; |        | $FF8B
    .byte $00 ; |        | $FF8C
    .byte $80 ; |X       | $FF8D
    .byte $00 ; |        | $FF8E
    .byte $40 ; | X      | $FF8F
    .byte $00 ; |        | $FF90
    .byte $40 ; | X      | $FF91
    .byte $C0 ; |XX      | $FF92
LFF93:
    .byte $0F ; |    XXXX| $FF93
    .byte $2B ; |  X X XX| $FF94
    .byte $F8 ; |XXXXX   | $FF95
    .byte $76 ; | XXX XX | $FF96
    .byte $00 ; |        | $FF97
    .byte $0F ; |    XXXX| $FF98
    .byte $2F ; |  X XXXX| $FF99
    .byte $F8 ; |XXXXX   | $FF9A
    .byte $76 ; | XXX XX | $FF9B
    .byte $00 ; |        | $FF9C
LFF9D:
    .byte $E7 ; |XXX  XXX| $FF9D
    .byte $66 ; | XX  XX | $FF9E
    .byte $E7 ; |XXX  XXX| $FF9F
    .byte $E7 ; |XXX  XXX| $FFA0
    .byte $A5 ; |X X  X X| $FFA1
    .byte $E7 ; |XXX  XXX| $FFA2
    .byte $E7 ; |XXX  XXX| $FFA3
    .byte $E7 ; |XXX  XXX| $FFA4
    .byte $E7 ; |XXX  XXX| $FFA5
    .byte $E7 ; |XXX  XXX| $FFA6

    .byte $A5 ; |X X  X X| $FFA7
    .byte $42 ; | X    X | $FFA8
    .byte $81 ; |X      X| $FFA9
    .byte $81 ; |X      X| $FFAA
    .byte $A5 ; |X X  X X| $FFAB
    .byte $24 ; |  X  X  | $FFAC
    .byte $24 ; |  X  X  | $FFAD
    .byte $81 ; |X      X| $FFAE
    .byte $A5 ; |X X  X X| $FFAF
    .byte $A5 ; |X X  X X| $FFB0

    .byte $A5 ; |X X  X X| $FFB1
    .byte $42 ; | X    X | $FFB2
    .byte $E7 ; |XXX  XXX| $FFB3
    .byte $C3 ; |XX    XX| $FFB4
    .byte $E7 ; |XXX  XXX| $FFB5
    .byte $E7 ; |XXX  XXX| $FFB6
    .byte $E7 ; |XXX  XXX| $FFB7
    .byte $42 ; | X    X | $FFB8
    .byte $E7 ; |XXX  XXX| $FFB9
    .byte $E7 ; |XXX  XXX| $FFBA

    .byte $A5 ; |X X  X X| $FFBB
    .byte $42 ; | X    X | $FFBC
    .byte $24 ; |  X  X  | $FFBD
    .byte $81 ; |X      X| $FFBE
    .byte $81 ; |X      X| $FFBF
    .byte $81 ; |X      X| $FFC0
    .byte $A5 ; |X X  X X| $FFC1
    .byte $42 ; | X    X | $FFC2
    .byte $A5 ; |X X  X X| $FFC3
    .byte $81 ; |X      X| $FFC4
LFFC5:
    .byte $E7 ; |XXX  XXX| $FFC5
    .byte $E7 ; |XXX  XXX| $FFC6
    .byte $E7 ; |XXX  XXX| $FFC7
    .byte $E7 ; |XXX  XXX| $FFC8
    .byte $81 ; |X      X| $FFC9
    .byte $E7 ; |XXX  XXX| $FFCA
    .byte $E7 ; |XXX  XXX| $FFCB
    .byte $42 ; | X    X | $FFCC
    .byte $E7 ; |XXX  XXX| $FFCD
    .byte $E7 ; |XXX  XXX| $FFCE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

InitializeRam SUBROUTINE  ;x2
    lda    LFC8B-1,X             ; 4
    sta    ram_C2-1,X            ; 4
    dex                          ; 2
    bne    InitializeRam         ; 2³
Waste12Cycles SUBROUTINE  ;x1
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFFD8 SUBROUTINE  ;x1
    lda    #$14                  ; 2
    sta    CTRLPF                ; 3
    lda    #$10                  ; 2
    sta    NUSIZ1                ; 3
    ldx    #0                    ; 2
    stx    ENAM0                 ; 3
    stx    ENAM1                 ; 3
    stx    HMCLR                 ; 3
    lda    ram_A0                ; 3
    eor    ram_BD                ; 3
    sta    COLUBK                ; 3
    dex                          ; 2   X=$FF
    stx    ram_85                ; 3
    lda    #<LFFC5               ; 2
    sta    ram_84                ; 3
    lda    #5                    ; 2
    sta    ram_80                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $00 ; |        | $FFFA
    .byte $00 ; |        | $FFFB

       ORG $FFFC

    .word START

    .byte $00 ; |        | $FFFE
    .byte $00 ; |        | $FFFF
