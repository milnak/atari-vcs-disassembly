; Disassembly of actunk1.bin
; Disassembled by Omegamatrix
; Using DiStella v3.0
;
; Command Line: limit -cActunk1.cfg scrmnn.bin
;
; SCRMNN.cfg contents:
;
;      ORG F000
;      CODE F000 F0E2
;      DATA F0E3 F0FF
;      CODE F100 F3AC
;      GFX F3AD F3BE
;      CODE F3BF F699
;      DATA F69A FCFF
;      GFX FD00 FDF5
;      DATA FDF6 FDFF
;      CODE FE00 FE7F
;      DATA FE80 FEFF
;      GFX FF00 FFCB
;      DATA FFCC FFFB
;      GFX FFFC FFFD
;      DATA FFFE FFFF

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
CXCLR   =  $2C

; Read TIA Baseline = $00
INPT4   =  $0C

SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RIOT RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RIOT_RAM
       ORG $80

ram_80             ds 1  ; x5
framecounter       ds 1  ; x2   $81
ram_82             ds 1  ; x8
ram_83             ds 1  ; x3
ram_84             ds 1  ; x1
ram_85             ds 1  ; x1
ram_86             ds 2  ; x7
ram_88             ds 2  ; x3
ram_8A             ds 2  ; x1
ram_8C             ds 1  ; x1
ram_8D             ds 1  ; x3
ram_8E             ds 2  ; x1
ram_90             ds 2  ; x1
ram_92             ds 1  ; x13
ram_93             ds 1  ; x12
ram_94             ds 1  ; x21
ram_95             ds 1  ; x4
ram_96             ds 1  ; x1
ram_97             ds 1  ; x1
ram_98             ds 1  ; x1
ram_99             ds 1  ; x1
ram_9A             ds 1  ; x1
ram_9B             ds 42 ; x3
ram_C5             ds 1  ; x4
ram_C6             ds 1  ; x2
ram_C7             ds 1  ; x16
ram_C8             ds 1  ; x9
ram_C9             ds 1  ; x9
ram_CA             ds 1  ; x2
ram_CB             ds 1  ; x3
ram_CC             ds 1  ; x3
ram_CD             ds 1  ; x3
ram_CE             ds 1  ; x3
ram_CF             ds 1  ; x3
ram_D0             ds 1  ; x3
ram_D1             ds 1  ; x3
ram_D2             ds 1  ; x3
ram_D3             ds 1  ; x4
ram_D4             ds 1  ; x5
ram_D5             ds 1  ; x9
ram_D6             ds 10 ; x12
ram_E0             ds 1  ; x5
ram_E1             ds 1  ; x6
ram_E2             ds 1  ; x5
ram_E3             ds 1  ; x8
ram_E4             ds 1  ; x2
ram_E5             ds 1  ; x2
bcdTime            ds 3  ; x10  $E6-$E8
ram_E9             ds 1  ; x2
ram_EA             ds 1  ; x2
ram_EB             ds 1  ; x3
ram_EC             ds 1  ; x14
ram_ED             ds 1  ; x10
ram_EE             ds 1  ; x8
ram_EF             ds 1  ; x4
ram_F0             ds 2  ; x8
ram_F2             ds 1  ; x8
ram_F3             ds 1  ; x4
ram_F4             ds 12 ; x2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG CODE
       ORG $F000

START:
    sei                          ; 2
    cld                          ; 2
    ldx    #0                    ; 2
LF004:
    lda    #0                    ; 2
LF006:
    sta    0,X                   ; 4
    txs                          ; 2
    inx                          ; 2
    bne    LF006                 ; 2³
    jsr    LF61E                 ; 6
    ldx    ram_82                ; 3
    bne    LF019                 ; 2³
    inx                          ; 2
    stx    ram_82                ; 3
    jmp    LF33C                 ; 3

LF019:
    ldx    #$03                  ; 2
LF01B:
    lda    LFF60,X               ; 4
    sta    COLUP0,X              ; 4
    dex                          ; 2
    bpl    LF01B                 ; 2³
    ldx    #$02                  ; 2
LF025:
    txa                          ; 2
    asl                          ; 2
    asl                          ; 2
    tay                          ; 2
    lda    ram_E3,X              ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    sta.wy ram_86,Y              ; 5
    lda    ram_E3,X              ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta.wy ram_88,Y              ; 5
    dex                          ; 2
    bpl    LF025                 ; 2³
    ldx    #$00                  ; 2
    ldy    #$50                  ; 2
LF042:
    lda    ram_86,X              ; 4
    bne    LF04E                 ; 2³
    sty    ram_86,X              ; 4
    inx                          ; 2
    inx                          ; 2
    cpx    #$0A                  ; 2
    bcc    LF042                 ; 2³
LF04E:
    lda    INTIM                 ; 4
    bne    LF04E                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ram_E0                ; 3
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    and    #$02                  ; 2
    sta    VBLANK                ; 3
    sta    CXCLR                 ; 3
    jsr    LFE0C                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$00                  ; 2
    sta    COLUPF                ; 3
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMCLR                 ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    ram_EC                ; 3
    sec                          ; 2
LF07A:
    sbc    #$0F                  ; 2
    bpl    LF07A                 ; 2³
    sta    RESP0                 ; 3
    tay                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_ED                ; 3
    sec                          ; 2
    sta    ram_D4                ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
LF08C:
    sbc    #$0F                  ; 2
    bpl    LF08C                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    eor    #$70                  ; 2
    sta    HMP1                  ; 3
    tya                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    eor    #$70                  ; 2
    sta    HMP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$05                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    ram_C8                ; 3
    sta    COLUP0                ; 3
    lda    ram_C9                ; 3
    sta    COLUP1                ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta    HMCLR                 ; 3
    lda    #$80                  ; 2
    sta    PF0                   ; 3
    lda    #$EF                  ; 2
    sta    PF1                   ; 3
    lda    #$DE                  ; 2
    sta    PF2                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$04                  ; 2
    sta    COLUBK                ; 3
    sta    COLUPF                ; 3
    lda    #$07                  ; 2
    sta    ram_CA                ; 3
    ldx    ram_92                ; 3
    ldy    ram_93                ; 3
    lda    #$00                  ; 2
    sta    ram_D3                ; 3
    jmp    LF15F                 ; 3

LF0E3:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

LF100:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ram_CB                ; 3
    sta    COLUPF                ; 3
    lda    LFD00,X               ; 4
    sta    GRP0                  ; 3
    inx                          ; 2
    lda    LFD00,Y               ; 4
    sta    GRP1                  ; 3
    iny                          ; 2
    lda    ram_CC                ; 3
    sta    COLUPF                ; 3
    lda.w  ram_CD                ; 4
    sta    COLUPF                ; 3
    lda    ram_CE                ; 3
    sta    COLUPF                ; 3
    lda.w  ram_CF                ; 4
    sta    COLUPF                ; 3
    lda.w  ram_D0                ; 4
    sta    COLUPF                ; 3
    lda    ram_D1                ; 3
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    dec    ram_D2                ; 5
    lda    ram_CB                ; 3
    sta    COLUPF                ; 3
    sta    COLUPF                ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    ram_CC                ; 3
    sta    COLUPF                ; 3
    lda.w  ram_CD                ; 4
    sta    COLUPF                ; 3
    lda    ram_CE                ; 3
    sta    COLUPF                ; 3
    lda.w  ram_CF                ; 4
    sta    COLUPF                ; 3
    lda.w  ram_D0                ; 4
    sta    COLUPF                ; 3
    lda    ram_D1                ; 3
    sta    COLUPF                ; 3
    bit    ram_D2                ; 3
    bpl    LF100                 ; 2³
LF15F:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$04                  ; 2
    sta    COLUPF                ; 3
    lda    LFD00,X               ; 4
    sta    GRP0                  ; 3
    inx                          ; 2
    lda    LFD00,Y               ; 4
    sta    GRP1                  ; 3
    iny                          ; 2
    stx    ram_D4                ; 3
    dec    ram_CA                ; 5
    bpl    LF17C                 ; 2³
    jmp    LF1F7                 ; 3

LF17C:
    ldx    ram_D3                ; 3
    lda    ram_94,X              ; 4
    cmp    LFDA9,X               ; 4
    bne    LF187                 ; 2³
    and    ram_F0                ; 3
LF187:
    sta    ram_CB                ; 3
    lda    ram_95,X              ; 4
    cmp    LFDA9+1,X             ; 4
    bne    LF192                 ; 2³
    and    ram_F0                ; 3
LF192:
    sta    ram_CC                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ram_96,X              ; 4
    cmp    LFDA9+2,X             ; 4
    bne    LF1A1                 ; 2³
    and    ram_F0                ; 3
LF1A1:
    sta    ram_CD                ; 3
    lda    ram_97,X              ; 4
    cmp    LFDA9+3,X             ; 4
    bne    LF1AC                 ; 2³
    and    ram_F0                ; 3
LF1AC:
    sta    ram_CE                ; 3
    lda    ram_98,X              ; 4
    cmp    LFDA9+4,X             ; 4
    bne    LF1B7                 ; 2³
    and    ram_F0                ; 3
LF1B7:
    sta    ram_CF                ; 3
    lda    ram_99,X              ; 4
    cmp    LFDA9+5,X             ; 4
    bne    LF1C2                 ; 2³
    and    ram_F0                ; 3
LF1C2:
    sta    ram_D0                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    inc    ram_D4                ; 5
    ldx    ram_D4                ; 3
    lda    LFD00,X               ; 4
    sta    GRP0                  ; 3
    lda    LFD00,Y               ; 4
    sta    GRP1                  ; 3
    iny                          ; 2
    ldx    ram_D3                ; 3
    lda    ram_9A,X              ; 4
    cmp    LFDA9+6,X             ; 4
    bne    LF1E2                 ; 2³
    and    ram_F0                ; 3
LF1E2:
    sta    ram_D1                ; 3
    txa                          ; 2
    clc                          ; 2
    adc    #$07                  ; 2
    sta    ram_D3                ; 3
    ldx    ram_D4                ; 3
    lda    #$08                  ; 2
    sta    ram_D2                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jmp    LF100                 ; 3

LF1F7:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    ldy    #$07                  ; 2
    lda    ram_E2                ; 3
    and    #$1F                  ; 2
    cmp    #$14                  ; 2
    bcs    LF21C                 ; 2³
    ldy    #$00                  ; 2
    cmp    #$0C                  ; 2
    bcc    LF21C                 ; 2³
    sbc    #$0C                  ; 2
    tay                          ; 2
LF21C:
    sty    ram_F3                ; 3
    tya                          ; 2
    eor    #$07                  ; 2
    sta    ram_F4                ; 3
    lda    #$B4                  ; 2
    ldx    #$08                  ; 2
    sec                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
LF22C:
    sta    ram_88,X              ; 4
    sbc    #$08                  ; 2
    sta    ram_86,X              ; 4
    sbc    #$08                  ; 2
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
    dex                          ; 2
    bpl    LF22C                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    sta    COLUPF                ; 3
    jsr    LFE10                 ; 6
    lda    #$78                  ; 2
    sta    PF1                   ; 3
    lda    #$31                  ; 2
    sta    CTRLPF                ; 3
    sta    NUSIZ1                ; 3
    sta    HMCLR                 ; 3
    lda    #$10                  ; 2
    sta    HMBL                  ; 3
    ldy    #$07                  ; 2
    sty    ENABL                 ; 3
LF25B:
    lda    LFF84,Y               ; 4
    tax                          ; 2
    lda    LFF64,Y               ; 4
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    LFFBC,Y               ; 4
    sta    COLUPF                ; 3
    lda    LFF6C,Y               ; 4
    sta    GRP1                  ; 3
    lda    LFF74,Y               ; 4
    sta    GRP0                  ; 3
    lda    ram_F2                ; 3
    nop                          ; 2
    lda    LFF7C,Y               ; 4
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #$00                  ; 2
    sta    COLUPF                ; 3
    dey                          ; 2
    dec    ram_F4                ; 5
    bpl    LF25B                 ; 2³
    lda    #$1F                  ; 2
    ldx    #$82                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    TIM64T                ; 4
    stx    VBLANK                ; 3
    lda    #$00                  ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    sta    PF1                   ; 3
    sta    ENABL                 ; 3
    lda    ram_82                ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    eor    ram_82                ; 3
    asl                          ; 2
    rol    ram_82                ; 5
LF2B1:
    lda    INTIM                 ; 4
    bne    LF2B1                 ; 2³
    ldy    #$82                  ; 2
    sty    WSYNC                 ; 3
;---------------------------------------
    sty    VSYNC                 ; 3
    sty    WSYNC                 ; 3
    sty    WSYNC                 ; 3
    sty    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    inc    framecounter          ; 5
    bne    LF2DB                 ; 2³
    inc    ram_E1                ; 5
    lda    ram_E1                ; 3
    and    #$C7                  ; 2
    sta    ram_E1                ; 3
    and    #$07                  ; 2
    bne    LF2DB                 ; 2³
    inc    ram_E0                ; 5
    bne    LF2DB                 ; 2³
    sec                          ; 2
    ror    ram_E0                ; 5
LF2DB:
    lda    #$30                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    TIM64T                ; 4
    ldy    SWCHA                 ; 4
    lda    framecounter          ; 3
    and    #$07                  ; 2
    bne    LF307                 ; 2³+1
    lda    ram_E2                ; 3
    beq    LF307                 ; 2³+1
    ldy    #$FF                  ; 2
    dec    ram_E2                ; 5
    bne    LF307                 ; 2³+1
    dec    ram_E2                ; 5
    lda    ram_E1                ; 3
    bmi    LF307                 ; 2³+1
    ora    #$80                  ; 2
    sta    ram_E1                ; 3
    lda    #$03                  ; 2
    sta    ram_80                ; 3
    ldx    #$F2                  ; 2
    bne    LF322                 ; 2³
LF307:
    tya                          ; 2
    and    #$0F                  ; 2
    sta    ram_85                ; 3
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_84                ; 3
    iny                          ; 2
    beq    LF31A                 ; 2³
    lda    #$00                  ; 2
    sta    ram_E0                ; 3
LF31A:
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcs    LF325                 ; 2³
    ldx    #$E0                  ; 2
LF322:
    jmp    LF004                 ; 3

LF325:
    ldy    #$00                  ; 2
    lsr                          ; 2
    bcs    LF358                 ; 2³
    lda    ram_83                ; 3
    beq    LF332                 ; 2³
    dec    ram_83                ; 5
    bpl    LF35A                 ; 2³
LF332:
    inc    ram_80                ; 5
    sty    ram_EB                ; 3
    sty    ram_EE                ; 3
    sty    AUDV0                 ; 3
    sty    AUDV1                 ; 3
LF33C:
    lda    ram_80                ; 3
    and    #$03                  ; 2
    sta    ram_80                ; 3
    sta    ram_E0                ; 3
    sta    ram_E1                ; 3
    ora    #$A0                  ; 2
    tay                          ; 2
    iny                          ; 2
    sty    ram_E3                ; 3
    lda    #$AA                  ; 2
    sta    ram_E4                ; 3
    sta    ram_E5                ; 3
    lda    #$FF                  ; 2
    sta    ram_E2                ; 3
    ldy    #$1E                  ; 2
LF358:
    sty    ram_83                ; 3
LF35A:
    dec    ram_E9                ; 5
    bpl    LF37F                 ; 2³
    lda    #$3B                  ; 2
    sta    ram_E9                ; 3
    sed                          ; 2
    lda    #$01                  ; 2
    clc                          ; 2
    adc    bcdTime+2             ; 3
    sta    bcdTime+2             ; 3
    cmp    #$60                  ; 2
    bne    LF37F                 ; 2³
    ldx    #$00                  ; 2
    stx    bcdTime+2             ; 3
    lda    #$01                  ; 2
    clc                          ; 2
    adc    bcdTime+1             ; 3
    sta    bcdTime+1             ; 3
    lda    bcdTime               ; 3
    adc    #$00                  ; 2
    sta    bcdTime               ; 3
LF37F:
    cld                          ; 2
    bit    ram_EB                ; 3
    bpl    LF39E                 ; 2³
    lda    bcdTime+2             ; 3
    sta    ram_E5                ; 3
    lda    bcdTime               ; 3
    sta    ram_E3                ; 3
    lda    bcdTime+1             ; 3
    asl                          ; 2
    rol    ram_E3                ; 5
    asl                          ; 2
    rol    ram_E3                ; 5
    asl                          ; 2
    rol    ram_E3                ; 5
    asl                          ; 2
    rol    ram_E3                ; 5
    ora    #$0B                  ; 2   add colon
    sta    ram_E4                ; 3
LF39E:
    ldx    ram_EE                ; 3
    lda    LF3AD,X               ; 4
    sta    ram_C5                ; 3
    lda    LF3B6,X               ; 4
    sta    ram_C6                ; 3
    jmp.ind ($00C5)              ; 5

LF3AD:
    .byte $CA ; |XX  X X | $F3AD
    .byte $CA ; |XX  X X | $F3AE
    .byte $26 ; |  X  XX | $F3AF
    .byte $50 ; | X X    | $F3B0
    .byte $AC ; |X X XX  | $F3B1
    .byte $7D ; | XXXXX X| $F3B2
    .byte $BF ; |X XXXXXX| $F3B3
    .byte $EA ; |XXX X X | $F3B4
    .byte $F1 ; |XXXX   X| $F3B5
LF3B6:
    .byte $F3 ; |XXXX  XX| $F3B6
    .byte $F3 ; |XXXX  XX| $F3B7
    .byte $F4 ; |XXXX X  | $F3B8
    .byte $F4 ; |XXXX X  | $F3B9
    .byte $F4 ; |XXXX X  | $F3BA
    .byte $F4 ; |XXXX X  | $F3BB
    .byte $F3 ; |XXXX  XX| $F3BC
    .byte $F4 ; |XXXX X  | $F3BD
    .byte $F4 ; |XXXX X  | $F3BE


    lda    ram_82                ; 3
    and    #$03                  ; 2
    clc                          ; 2
    adc    #$02                  ; 2
    tay                          ; 2
    jmp    LF402                 ; 3

    lda    ColCenterSquare       ; 4
    dec    ram_EA                ; 5
    bpl    LF3D7                 ; 2³
    lda    #$10                  ; 2
    sta    ram_EA                ; 3
    lda    #$04                  ; 2
LF3D7:
    ldx    ram_C7                ; 3
    sta    ram_94,X              ; 4
    ldx    #$FF                  ; 2
    lda    INPT4                 ; 3
    and    PF0                   ; 3
    and    #$80                  ; 2
    bne    LF3E6                 ; 2³
    inx                          ; 2
LF3E6:
    stx    ram_F0                ; 3
    lda    ram_EE                ; 3
    bne    LF3EF                 ; 2³
    jmp    LF547                 ; 3

LF3EF:
    lda    SWCHA                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    SWCHA                 ; 4
    tax                          ; 2
    ldy    LFDDA,X               ; 4
    bne    LF402                 ; 2³+1
    jmp    LF547                 ; 3

LF402:
    sty    ram_EE                ; 3
    lda    LFDEA,Y               ; 4
    sta    ram_C5                ; 3
    lda    LFDF0,Y               ; 4
    sta    ram_C6                ; 3
    ldx    ram_C7                ; 3
    lda    ColCenterSquare       ; 4
    sta    ram_94,X              ; 4
    txa                          ; 2
    ldx    #$00                  ; 2
    sec                          ; 2
LF419:
    inx                          ; 2
    sbc    #$07                  ; 2
    bpl    LF419                 ; 2³
    clc                          ; 2
    adc    #$07                  ; 2
    dex                          ; 2
    tay                          ; 2
    jmp.ind ($00C5)              ; 5

    inc    ram_EC                ; 5
    inc    ram_EC                ; 5
    dec    ram_ED                ; 5
    dec    ram_ED                ; 5
    dec    ram_D6                ; 5
    bne    LF47A                 ; 2³
    ldx    ram_D5                ; 3
    lda    ram_C8                ; 3
    sta    ram_95,X              ; 4
    lda    ram_C9                ; 3
    sta    ram_94,X              ; 4
    lda    ram_EC                ; 3
    sec                          ; 2
    sbc    #$28                  ; 2
    sta    ram_EC                ; 3
    cpx    ram_C7                ; 3
    beq    LF44B                 ; 2³
    dex                          ; 2
    jmp    LF569                 ; 3

LF44B:
    inc    ram_C7                ; 5
    jmp    LF4D8                 ; 3

    dec    ram_EC                ; 5
    dec    ram_EC                ; 5
    inc    ram_ED                ; 5
    inc    ram_ED                ; 5
    dec    ram_D6                ; 5
    bne    LF47A                 ; 2³
    ldx    ram_D5                ; 3
    lda    ram_C8                ; 3
    sta    ram_93,X              ; 4
    lda    ram_C9                ; 3
    sta    ram_94,X              ; 4
    lda    ram_EC                ; 3
    clc                          ; 2
    adc    #$28                  ; 2
    sta    ram_EC                ; 3
    cpx    ram_C7                ; 3
    beq    LF475                 ; 2³
    inx                          ; 2
    jmp    LF59E                 ; 3

LF475:
    dec    ram_C7                ; 5
    jmp    LF4D8                 ; 3

LF47A:
    jmp    LF547                 ; 3

    inc    ram_92                ; 5
    dec    ram_93                ; 5
    dec    ram_D6                ; 5
    bne    LF47A                 ; 2³
    ldx    ram_D5                ; 3
    lda    ram_C8                ; 3
    sta    ram_8D,X              ; 4
    lda    ram_C9                ; 3
    sta    ram_94,X              ; 4
    lda    ram_92                ; 3
    sec                          ; 2
    sbc    #$16                  ; 2
    sta    ram_92                ; 3
    cpx    ram_C7                ; 3
    beq    LF4A2                 ; 2³
    txa                          ; 2
    clc                          ; 2
    adc    #$07                  ; 2
    tax                          ; 2
    jmp    LF607                 ; 3

LF4A2:
    lda    ram_C7                ; 3
    sec                          ; 2
    sbc    #$07                  ; 2
    sta    ram_C7                ; 3
    jmp    LF4D8                 ; 3

    dec    ram_92                ; 5
    inc    ram_93                ; 5
    dec    ram_D6                ; 5
    bne    LF47A                 ; 2³
    ldx    ram_D5                ; 3
    lda    ram_C8                ; 3
    sta    ram_9B,X              ; 4
    lda    ram_C9                ; 3
    sta    ram_94,X              ; 4
    lda    ram_92                ; 3
    clc                          ; 2
    adc    #$16                  ; 2
    sta    ram_92                ; 3
    cpx    ram_C7                ; 3
    beq    LF4D1                 ; 2³
    txa                          ; 2
    sec                          ; 2
    sbc    #$07                  ; 2
    tax                          ; 2
    jmp    LF5D6                 ; 3

LF4D1:
    lda    ram_C7                ; 3
    clc                          ; 2
    adc    #$07                  ; 2
    sta    ram_C7                ; 3
LF4D8:
    lda    ram_EF                ; 3
    sta    ram_EE                ; 3
    lda    #$00                  ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    lda    #$4D                  ; 2
    sta    ram_92                ; 3
    sta    ram_93                ; 3
    bne    LF547                 ; 2³+1
    ldy    ram_D6                ; 3
    lda    ram_82                ; 3
    jmp    LF4FA                 ; 3

    ldy    ram_D6                ; 3
    lda    LF35A,Y               ; 4
    eor    ram_F2                ; 3
    sta    ram_F2                ; 3
LF4FA:
    and    #$1F                  ; 2
    tax                          ; 2
    lda    ram_94,X              ; 4
    pha                          ; 3
    lda.wy ram_94,Y              ; 4
    sta    ram_94,X              ; 4
    pla                          ; 4
    sta.wy ram_94,Y              ; 5
    dec    ram_D6                ; 5
    bpl    LF547                 ; 2³
    lda    ram_EF                ; 3
    sta    ram_EE                ; 3
    ldx    #$31                  ; 2
    lda    ColCenterSquare       ; 4
LF516:
    dex                          ; 2
    cmp    ram_94,X              ; 4
    bne    LF516                 ; 2³
    stx    ram_C7                ; 3
    jmp    LF547                 ; 3

LF520:
    ldx    ram_D5                ; 3
    lda    LFDA9,X               ; 4
    eor    #$0F                  ; 2
    and    #$0F                  ; 2
    ora    #$10                  ; 2
    sta    AUDF0                 ; 3
    lda    LFDA9,X               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    #$0B                  ; 2
    and    #$0F                  ; 2
    sta    AUDF1                 ; 3
    lda    #$0C                  ; 2
    sta    AUDC0                 ; 3
    sta    AUDC1                 ; 3
    lda    #$0F                  ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
LF547:
    jmp    LF019                 ; 3

    cmp    #$06                  ; 2
    beq    LF5B5                 ; 2³
    lda    LFDA0                 ; 4
    sta    ram_EC                ; 3
    lda    LFDA1                 ; 4
    sta    ram_ED                ; 3
    lda    LFDA2,X               ; 4
    sta    ram_92                ; 3
    sta    ram_93                ; 3
    tya                          ; 2
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    ram_C7                ; 3
    clc                          ; 2
    adc    #$06                  ; 2
    tax                          ; 2
LF569:
    stx    ram_D5                ; 3
    lda    ram_94,X              ; 4
    sta    ram_C8                ; 3
    lda    ram_95,X              ; 4
    sta    ram_C9                ; 3
    lda    #$04                  ; 2
    sta    ram_94,X              ; 4
    sta    ram_95,X              ; 4
    lda    #$0A                  ; 2
    sta    ram_D6                ; 3
LF57D:
    bne    LF520                 ; 2³
    cmp    #$00                  ; 2
    beq    LF5B5                 ; 2³
    lda    LFD9C                 ; 4
    sta    ram_EC                ; 3
    lda    LFD9B                 ; 4
    sta    ram_ED                ; 3
    lda    LFDA2,X               ; 4
    sta    ram_92                ; 3
    sta    ram_93                ; 3
    tya                          ; 2
    eor    #$FF                  ; 2
    clc                          ; 2
    adc    ram_C7                ; 3
    clc                          ; 2
    adc    #$02                  ; 2
    tax                          ; 2
LF59E:
    stx    ram_D5                ; 3
    lda    ram_94,X              ; 4
    sta    ram_C8                ; 3
    lda    ram_93,X              ; 4
    sta    ram_C9                ; 3
    lda    #$04                  ; 2
    sta    ram_94,X              ; 4
    sta    ram_93,X              ; 4
    lda    #$0A                  ; 2
    sta    ram_D6                ; 3
    jmp    LF57D                 ; 3

LF5B5:
    lda    ram_EF                ; 3
    sta    ram_EE                ; 3
    jmp    LF547                 ; 3

    cpx    #$06                  ; 2
    beq    LF5B5                 ; 2³
    lda    LFDA7                 ; 4
    sta    ram_92                ; 3
    lda    LFDA8                 ; 4
    sta    ram_93                ; 3
    lda    LFD9B,Y               ; 4
    sta    ram_EC                ; 3
    sta    ram_ED                ; 3
    tya                          ; 2
    clc                          ; 2
    adc    #$23                  ; 2
    tax                          ; 2
LF5D6:
    stx    ram_D5                ; 3
    lda    ram_94,X              ; 4
    sta    ram_C8                ; 3
    lda    ram_9B,X              ; 4
    sta    ram_C9                ; 3
    lda    #$04                  ; 2
    sta    ram_94,X              ; 4
    sta    ram_9B,X              ; 4
    lda    #$0B                  ; 2
    sta    ram_D6                ; 3
    jmp    LF57D                 ; 3

    cpx    #$00                  ; 2
    beq    LF5B5                 ; 2³
    lda    LFDA3                 ; 4
    sta    ram_92                ; 3
    lda    LFDA2                 ; 4
    sta    ram_93                ; 3
    lda    LFD9B,Y               ; 4
    sta    ram_EC                ; 3
    sta    ram_ED                ; 3
    tya                          ; 2
    clc                          ; 2
    adc    #$07                  ; 2
    tax                          ; 2
LF607:
    stx    ram_D5                ; 3
    lda    ram_94,X              ; 4
    sta    ram_C8                ; 3
    lda    ram_8D,X              ; 4
    sta    ram_C9                ; 3
    lda    #$04                  ; 2
    sta    ram_94,X              ; 4
    sta    ram_8D,X              ; 4
    lda    #$0B                  ; 2
    sta    ram_D6                ; 3
    jmp    LF57D                 ; 3

LF61E:
    ldx    #$01                  ; 2
LF620:
    lda    #$04                  ; 2
    sta    AUDV0,X               ; 4
    dex                          ; 2
    bpl    LF620                 ; 2³
    ldx    #$0B                  ; 2
    lda    #$FF                  ; 2
LF62B:
    sta    ram_86,X              ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LF62B                 ; 2³
    ldx    #$30                  ; 2
LF633:
    lda    LFDA9,X               ; 4
    sta    ram_94,X              ; 4
    dex                          ; 2
    bpl    LF633                 ; 2³
    lda    #$18                  ; 2
    sta    ram_C7                ; 3
    lda    #$4D                  ; 2
    sta    ram_92                ; 3
    sta    ram_93                ; 3
    sta    ram_EC                ; 3
    sta    ram_ED                ; 3
    ldx    ram_82                ; 3
    beq    LF665                 ; 2³
    ldx    ram_80                ; 3
    lda    LFFC4,X               ; 4
    sta    ram_EE                ; 3
    lda    LFFC8,X               ; 4
    sta    ram_EF                ; 3
    lda    #$30                  ; 2
    sta    ram_D6                ; 3
    txa                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    ror                          ; 2
    eor    #$80                  ; 2
    sta    ram_EB                ; 3
LF665:
    rts                          ; 6

    jsr    LF68D                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    rts                          ; 6

LF66E:
    clc                          ; 2
    adc    #$2E                  ; 2
    tay                          ; 2
    and    #$0F                  ; 2
    sta    ram_F2                ; 3
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    clc                          ; 2
    adc    ram_F2                ; 3
    cmp    #$0F                  ; 2
    bcc    LF686                 ; 2³
    sbc    #$0F                  ; 2
    iny                          ; 2
LF686:
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    rts                          ; 6

LF68D:
    jsr    LF66E                 ; 6
    sta    HMP0,X                ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
LF694:
    dey                          ; 2
    bpl    LF694                 ; 2³
    sta    RESP0,X               ; 4
    rts                          ; 6

LF69A:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF

LFD00:
    .byte $00 ; |        | $FD00
    .byte $00 ; |        | $FD01
    .byte $00 ; |        | $FD02
    .byte $00 ; |        | $FD03
    .byte $00 ; |        | $FD04
    .byte $00 ; |        | $FD05
    .byte $00 ; |        | $FD06
    .byte $00 ; |        | $FD07
    .byte $00 ; |        | $FD08
    .byte $00 ; |        | $FD09
    .byte $00 ; |        | $FD0A
    .byte $00 ; |        | $FD0B
    .byte $00 ; |        | $FD0C
    .byte $00 ; |        | $FD0D
    .byte $00 ; |        | $FD0E
    .byte $00 ; |        | $FD0F
    .byte $00 ; |        | $FD10
    .byte $00 ; |        | $FD11
    .byte $00 ; |        | $FD12
    .byte $00 ; |        | $FD13
    .byte $00 ; |        | $FD14
    .byte $00 ; |        | $FD15
    .byte $00 ; |        | $FD16
    .byte $00 ; |        | $FD17
    .byte $00 ; |        | $FD18
    .byte $00 ; |        | $FD19
    .byte $00 ; |        | $FD1A
    .byte $00 ; |        | $FD1B
    .byte $00 ; |        | $FD1C
    .byte $00 ; |        | $FD1D
    .byte $00 ; |        | $FD1E
    .byte $00 ; |        | $FD1F
    .byte $00 ; |        | $FD20
    .byte $00 ; |        | $FD21
    .byte $00 ; |        | $FD22
    .byte $00 ; |        | $FD23
    .byte $00 ; |        | $FD24
    .byte $00 ; |        | $FD25
    .byte $00 ; |        | $FD26
    .byte $00 ; |        | $FD27
    .byte $00 ; |        | $FD28
    .byte $00 ; |        | $FD29
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
    .byte $00 ; |        | $FD37
    .byte $00 ; |        | $FD38
    .byte $00 ; |        | $FD39
    .byte $00 ; |        | $FD3A
    .byte $00 ; |        | $FD3B
    .byte $00 ; |        | $FD3C
    .byte $00 ; |        | $FD3D
    .byte $00 ; |        | $FD3E
    .byte $00 ; |        | $FD3F
    .byte $00 ; |        | $FD40
    .byte $00 ; |        | $FD41
    .byte $00 ; |        | $FD42
    .byte $00 ; |        | $FD43
    .byte $FF ; |XXXXXXXX| $FD44
    .byte $FF ; |XXXXXXXX| $FD45
    .byte $FF ; |XXXXXXXX| $FD46
    .byte $FF ; |XXXXXXXX| $FD47
    .byte $FF ; |XXXXXXXX| $FD48
    .byte $FF ; |XXXXXXXX| $FD49
    .byte $FF ; |XXXXXXXX| $FD4A
    .byte $FF ; |XXXXXXXX| $FD4B
    .byte $FF ; |XXXXXXXX| $FD4C
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
    .byte $00 ; |        | $FD6F
    .byte $00 ; |        | $FD70
    .byte $00 ; |        | $FD71
    .byte $00 ; |        | $FD72
    .byte $00 ; |        | $FD73
    .byte $00 ; |        | $FD74
    .byte $00 ; |        | $FD75
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
    .byte $00 ; |        | $FD8C
    .byte $00 ; |        | $FD8D
    .byte $00 ; |        | $FD8E
    .byte $00 ; |        | $FD8F
    .byte $00 ; |        | $FD90
    .byte $00 ; |        | $FD91
    .byte $00 ; |        | $FD92
    .byte $00 ; |        | $FD93
    .byte $00 ; |        | $FD94
    .byte $00 ; |        | $FD95
    .byte $00 ; |        | $FD96
    .byte $00 ; |        | $FD97
    .byte $00 ; |        | $FD98
    .byte $00 ; |        | $FD99
    .byte $00 ; |        | $FD9A
LFD9B:
    .byte $0C ; |    XX  | $FD9B
LFD9C:
    .byte $20 ; |  X     | $FD9C
    .byte $34 ; |  XX X  | $FD9D
    .byte $48 ; | X  X   | $FD9E
    .byte $5C ; | X XXX  | $FD9F
LFDA0:
    .byte $70 ; | XXX    | $FDA0
LFDA1:
    .byte $84 ; |X    X  | $FDA1
LFDA2:
    .byte $42 ; | X    X | $FDA2
LFDA3:
    .byte $37 ; |  XX XXX| $FDA3
    .byte $2C ; |  X XX  | $FDA4
    .byte $21 ; |  X    X| $FDA5
    .byte $16 ; |   X XX | $FDA6
LFDA7:
    .byte $0B ; |    X XX| $FDA7
LFDA8:
    .byte $00 ; |        | $FDA8
    
GREEN   = $C0
ORANGE  = $20
RED     = $40
    
LFDA9:
    .byte RED            ; $FDA9
    .byte RED+2          ; $FDAA
    .byte RED+4          ; $FDAB
    .byte RED+6          ; $FDAC
    .byte RED+8          ; $FDAD
    .byte RED+10         ; $FDAE
    .byte RED+12         ; $FDAF
    
    .byte ORANGE         ; $FDB0
    .byte ORANGE+2       ; $FDB1
    .byte ORANGE+4       ; $FDB2
    .byte ORANGE+6       ; $FDB3
    .byte ORANGE+8       ; $FDB4
    .byte ORANGE+10      ; $FDB5
    .byte ORANGE+12      ; $FDB6
    
    .byte $E0 ; |XXX     | $FDB7
    .byte $E2 ; |XXX   X | $FDB8
    .byte $E4 ; |XXX  X  | $FDB9
    .byte $E6 ; |XXX  XX | $FDBA
    .byte $E8 ; |XXX X   | $FDBB
    .byte $EA ; |XXX X X | $FDBC
    .byte $EC ; |XXX XX  | $FDBD
    
    .byte GREEN          ; $FDBE
    .byte GREEN+2        ; $FDBF
    .byte GREEN+4        ; $FDC0
ColCenterSquare:
    .byte GREEN+6        ; $FDC1
    .byte GREEN+8        ; $FDC2
    .byte GREEN+10       ; $FDC3
    .byte GREEN+12       ; $FDC4
    
    .byte $A0 ; |X X     | $FDC5
    .byte $A2 ; |X X   X | $FDC6
    .byte $A4 ; |X X  X  | $FDC7
    .byte $A6 ; |X X  XX | $FDC8
    .byte $A8 ; |X X X   | $FDC9
    .byte $AA ; |X X X X | $FDCA
    .byte $AC ; |X X XX  | $FDCB
    
    .byte $80 ; |X       | $FDCC
    .byte $82 ; |X     X | $FDCD
    .byte $84 ; |X    X  | $FDCE
    .byte $86 ; |X    XX | $FDCF
    .byte $88 ; |X   X   | $FDD0
    .byte $8A ; |X   X X | $FDD1
    .byte $8C ; |X   XX  | $FDD2
    
    .byte $60 ; | XX     | $FDD3
    .byte $62 ; | XX   X | $FDD4
    .byte $64 ; | XX  X  | $FDD5
    .byte $66 ; | XX  XX | $FDD6
    .byte $68 ; | XX X   | $FDD7
    .byte $6A ; | XX X X | $FDD8
    .byte $6C ; | XX XX  | $FDD9
LFDDA:
    .byte $00 ; |        | $FDDA
    .byte $00 ; |        | $FDDB
    .byte $00 ; |        | $FDDC
    .byte $00 ; |        | $FDDD
    .byte $00 ; |        | $FDDE
    .byte $00 ; |        | $FDDF
    .byte $00 ; |        | $FDE0
    .byte $02 ; |      X | $FDE1
    .byte $00 ; |        | $FDE2
    .byte $00 ; |        | $FDE3
    .byte $00 ; |        | $FDE4
    .byte $03 ; |      XX| $FDE5
    .byte $00 ; |        | $FDE6
    .byte $04 ; |     X  | $FDE7
    .byte $05 ; |     X X| $FDE8
    .byte $00 ; |        | $FDE9
LFDEA:
    .byte $00 ; |        | $FDEA
    .byte $00 ; |        | $FDEB
    .byte $4A ; | X  X X | $FDEC
    .byte $7F ; | XXXXXXX| $FDED
    .byte $BC ; |X XXXX  | $FDEE
    .byte $ED ; |XXX XX X| $FDEF
LFDF0:
    .byte $00 ; |        | $FDF0
    .byte $00 ; |        | $FDF1
    .byte $F5 ; |XXXX X X| $FDF2
    .byte $F5 ; |XXXX X X| $FDF3
    .byte $F5 ; |XXXX X X| $FDF4
    .byte $F5 ; |XXXX X X| $FDF5

LFDF6:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF


    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    #$0B                  ; 2
LFE06:
    sta    ram_86,X              ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LFE06                 ; 2³
LFE0C:
    lda    #$07                  ; 2
    sta    ram_F3                ; 3
LFE10:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$0C                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldx    #$F3                  ; 2
    stx    NUSIZ0                ; 3
    stx    NUSIZ1                ; 3
    ldy    #$01                  ; 2
    lda    #$40                  ; 2
    nop                          ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    RESBL                 ; 3
    sty    CTRLPF                ; 3
    sta    HMBL                  ; 3
    stx    HMP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sty    VDELP0                ; 3
    sty    VDELP1                ; 3
    dey                          ; 2
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    sta    ram_F2                ; 3
    sta    HMCLR                 ; 3
LFE44:
    ldy    ram_F3                ; 3
    lda    (ram_90),Y            ; 5
    sta    ram_F2                ; 3
    lda    (ram_8E),Y            ; 5
    tax                          ; 2
    lda    (ram_86),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    lda    (ram_88),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_8A),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_8C),Y            ; 5
    ldy    ram_F2                ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    ram_F3                ; 5
    bpl    LFE44                 ; 2³
    lda    #$80                  ; 2
    sta    HMP0                  ; 3
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    rts                          ; 6

LFE80:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF


    .byte $3C ; |  XXXX  | $FF00
    .byte $66 ; | XX  XX | $FF01
    .byte $66 ; | XX  XX | $FF02
    .byte $66 ; | XX  XX | $FF03
    .byte $66 ; | XX  XX | $FF04
    .byte $66 ; | XX  XX | $FF05
    .byte $66 ; | XX  XX | $FF06
    .byte $3C ; |  XXXX  | $FF07
    .byte $3C ; |  XXXX  | $FF08
    .byte $18 ; |   XX   | $FF09
    .byte $18 ; |   XX   | $FF0A
    .byte $18 ; |   XX   | $FF0B
    .byte $18 ; |   XX   | $FF0C
    .byte $18 ; |   XX   | $FF0D
    .byte $38 ; |  XXX   | $FF0E
    .byte $18 ; |   XX   | $FF0F
    .byte $7E ; | XXXXXX | $FF10
    .byte $60 ; | XX     | $FF11
    .byte $60 ; | XX     | $FF12
    .byte $3C ; |  XXXX  | $FF13
    .byte $06 ; |     XX | $FF14
    .byte $06 ; |     XX | $FF15
    .byte $46 ; | X   XX | $FF16
    .byte $3C ; |  XXXX  | $FF17
    .byte $3C ; |  XXXX  | $FF18
    .byte $46 ; | X   XX | $FF19
    .byte $06 ; |     XX | $FF1A
    .byte $0C ; |    XX  | $FF1B
    .byte $0C ; |    XX  | $FF1C
    .byte $06 ; |     XX | $FF1D
    .byte $46 ; | X   XX | $FF1E
    .byte $3C ; |  XXXX  | $FF1F
    .byte $0C ; |    XX  | $FF20
    .byte $0C ; |    XX  | $FF21
    .byte $0C ; |    XX  | $FF22
    .byte $7E ; | XXXXXX | $FF23
    .byte $4C ; | X  XX  | $FF24
    .byte $2C ; |  X XX  | $FF25
    .byte $1C ; |   XXX  | $FF26
    .byte $0C ; |    XX  | $FF27
    .byte $7C ; | XXXXX  | $FF28
    .byte $46 ; | X   XX | $FF29
    .byte $06 ; |     XX | $FF2A
    .byte $06 ; |     XX | $FF2B
    .byte $7C ; | XXXXX  | $FF2C
    .byte $60 ; | XX     | $FF2D
    .byte $60 ; | XX     | $FF2E
    .byte $7E ; | XXXXXX | $FF2F
    .byte $3C ; |  XXXX  | $FF30
    .byte $66 ; | XX  XX | $FF31
    .byte $66 ; | XX  XX | $FF32
    .byte $66 ; | XX  XX | $FF33
    .byte $7C ; | XXXXX  | $FF34
    .byte $60 ; | XX     | $FF35
    .byte $62 ; | XX   X | $FF36
    .byte $3C ; |  XXXX  | $FF37
    .byte $18 ; |   XX   | $FF38
    .byte $18 ; |   XX   | $FF39
    .byte $18 ; |   XX   | $FF3A
    .byte $18 ; |   XX   | $FF3B
    .byte $0C ; |    XX  | $FF3C
    .byte $06 ; |     XX | $FF3D
    .byte $42 ; | X    X | $FF3E
    .byte $7E ; | XXXXXX | $FF3F
    .byte $3C ; |  XXXX  | $FF40
    .byte $66 ; | XX  XX | $FF41
    .byte $66 ; | XX  XX | $FF42
    .byte $3C ; |  XXXX  | $FF43
    .byte $3C ; |  XXXX  | $FF44
    .byte $66 ; | XX  XX | $FF45
    .byte $66 ; | XX  XX | $FF46
    .byte $3C ; |  XXXX  | $FF47
    .byte $3C ; |  XXXX  | $FF48
    .byte $46 ; | X   XX | $FF49
    .byte $06 ; |     XX | $FF4A
    .byte $3E ; |  XXXXX | $FF4B
    .byte $66 ; | XX  XX | $FF4C
    .byte $66 ; | XX  XX | $FF4D
    .byte $66 ; | XX  XX | $FF4E
    .byte $3C ; |  XXXX  | $FF4F
    .byte $00 ; |        | $FF50
    .byte $00 ; |        | $FF51
    .byte $00 ; |        | $FF52
    .byte $00 ; |        | $FF53
    .byte $00 ; |        | $FF54
    .byte $00 ; |        | $FF55
    .byte $00 ; |        | $FF56
    .byte $00 ; |        | $FF57
    .byte $00 ; |        | $FF58
    .byte $00 ; |        | $FF59
    .byte $18 ; |   XX   | $FF5A
    .byte $18 ; |   XX   | $FF5B
    .byte $00 ; |        | $FF5C
    .byte $18 ; |   XX   | $FF5D
    .byte $18 ; |   XX   | $FF5E
    .byte $00 ; |        | $FF5F
LFF60:
    .byte $1E ; |   XXXX | $FF60
    .byte $1E ; |   XXXX | $FF61
    .byte $0E ; |    XXX | $FF62
    .byte $06 ; |     XX | $FF63
LFF64:
    .byte $0C ; |    XX  | $FF64
    .byte $06 ; |     XX | $FF65
    .byte $03 ; |      XX| $FF66
    .byte $01 ; |       X| $FF67
    .byte $00 ; |        | $FF68
    .byte $00 ; |        | $FF69
    .byte $00 ; |        | $FF6A
    .byte $00 ; |        | $FF6B
LFF6C:
    .byte $2D ; |  X XX X| $FF6C
    .byte $29 ; |  X X  X| $FF6D
    .byte $E9 ; |XXX X  X| $FF6E
    .byte $A9 ; |X X X  X| $FF6F
    .byte $ED ; |XXX XX X| $FF70
    .byte $61 ; | XX    X| $FF71
    .byte $2F ; |  X XXXX| $FF72
    .byte $00 ; |        | $FF73
LFF74:
    .byte $50 ; | X X    | $FF74
    .byte $58 ; | X XX   | $FF75
    .byte $5C ; | X XXX  | $FF76
    .byte $56 ; | X X XX | $FF77
    .byte $53 ; | X X  XX| $FF78
    .byte $11 ; |   X   X| $FF79
    .byte $F0 ; |XXXX    | $FF7A
    .byte $00 ; |        | $FF7B
LFF7C:
    .byte $BA ; |X XXX X | $FF7C
    .byte $8A ; |X   X X | $FF7D
    .byte $BA ; |X XXX X | $FF7E
    .byte $A2 ; |X X   X | $FF7F
    .byte $3A ; |  XXX X | $FF80
    .byte $80 ; |X       | $FF81
    .byte $FE ; |XXXXXXX | $FF82
    .byte $00 ; |        | $FF83
LFF84:
    .byte $E9 ; |XXX X  X| $FF84
    .byte $AB ; |X X X XX| $FF85
    .byte $AF ; |X X XXXX| $FF86
    .byte $AD ; |X X XX X| $FF87
    .byte $E9 ; |XXX X  X| $FF88
    .byte $00 ; |        | $FF89
    .byte $00 ; |        | $FF8A
    .byte $00 ; |        | $FF8B
    .byte $00 ; |        | $FF8C
    .byte $00 ; |        | $FF8D
    .byte $00 ; |        | $FF8E
    .byte $F7 ; |XXXX XXX| $FF8F
    .byte $95 ; |X  X X X| $FF90
    .byte $87 ; |X    XXX| $FF91
    .byte $90 ; |X  X    | $FF92
    .byte $F0 ; |XXXX    | $FF93
    .byte $00 ; |        | $FF94
    .byte $47 ; | X   XXX| $FF95
    .byte $41 ; | X     X| $FF96
    .byte $77 ; | XXX XXX| $FF97
    .byte $55 ; | X X X X| $FF98
    .byte $75 ; | XXX X X| $FF99
    .byte $00 ; |        | $FF9A
    .byte $00 ; |        | $FF9B
    .byte $00 ; |        | $FF9C
    .byte $03 ; |      XX| $FF9D
    .byte $00 ; |        | $FF9E
    .byte $4B ; | X  X XX| $FF9F
    .byte $4A ; | X  X X | $FFA0
    .byte $6B ; | XX X XX| $FFA1
    .byte $00 ; |        | $FFA2
    .byte $08 ; |    X   | $FFA3
    .byte $00 ; |        | $FFA4
    .byte $80 ; |X       | $FFA5
    .byte $80 ; |X       | $FFA6
    .byte $AA ; |X X X X | $FFA7
    .byte $AA ; |X X X X | $FFA8
    .byte $BA ; |X XXX X | $FFA9
    .byte $27 ; |  X  XXX| $FFAA
    .byte $22 ; |  X   X | $FFAB
    .byte $00 ; |        | $FFAC
    .byte $00 ; |        | $FFAD
    .byte $00 ; |        | $FFAE
    .byte $11 ; |   X   X| $FFAF
    .byte $11 ; |   X   X| $FFB0
    .byte $17 ; |   X XXX| $FFB1
    .byte $15 ; |   X X X| $FFB2
    .byte $17 ; |   X XXX| $FFB3
    .byte $00 ; |        | $FFB4
    .byte $00 ; |        | $FFB5
    .byte $00 ; |        | $FFB6
    .byte $77 ; | XXX XXX| $FFB7
    .byte $51 ; | X X   X| $FFB8
    .byte $73 ; | XXX  XX| $FFB9
    .byte $51 ; | X X   X| $FFBA
    .byte $77 ; | XXX XXX| $FFBB
LFFBC:
    .byte $84 ; |X    X  | $FFBC
    .byte $D6 ; |XX X XX | $FFBD
    .byte $D6 ; |XX X XX | $FFBE
    .byte $1A ; |   XX X | $FFBF
    .byte $26 ; |  X  XX | $FFC0
    .byte $26 ; |  X  XX | $FFC1
    .byte $44 ; | X   X  | $FFC2
    .byte $00 ; |        | $FFC3
LFFC4:
    .byte $07 ; |     XXX| $FFC4
    .byte $08 ; |    X   | $FFC5
    .byte $01 ; |       X| $FFC6
    .byte $06 ; |     XX | $FFC7
LFFC8:
    .byte $01 ; |       X| $FFC8
    .byte $01 ; |       X| $FFC9
    .byte $01 ; |       X| $FFCA
    .byte $06 ; |     XX | $FFCB
LFFCC:
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF


    .byte $00 ; |        | $FFFC
    .byte $F0 ; |XXXX    | $FFFD
LFFFE:
    .byte $FF,$FF
