; Disassembly of Panda.bin
; Disassembled Wed Jun 15 13:21:36 2011
; Using DiStella v4.0
;
; Command Line: limit4 -cPanda.cfg Panda.bin 
;
; Panda.cfg contents:
;
;      ORG F000
;      CODE F000 F936
;      GFX F937 FED7
;      CODE FED8 FF74
;      GFX FF75 FFB2
;      CODE FFB3 FFBE
;      GFX FFBF FFFF

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
PF0     =  $0D
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
RESP1   =  $11
RESM1   =  $13
AUDC0   =  $15
AUDC1   =  $16
AUDF0   =  $17
AUDF1   =  $18
AUDV0   =  $19
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
ENAM1   =  $1E
HMP0    =  $20
HMP1    =  $21
HMM1    =  $23
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXP1FB  =  $33
CXM1FB  =  $35
CXPPMM  =  $37
INPT4   =  $3C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM8T   =  $0295
TIM64T  =  $0296


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      RIOT RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RIOT_RAM
       ORG $80

ram_80             ds 1  ; x11
ram_81             ds 2  ; x3
ram_83             ds 1  ; x6
ram_84             ds 1  ; x6
ram_85             ds 1  ; x6
ram_86             ds 1  ; x6
ram_87             ds 9  ; x3
ram_90             ds 1  ; x4
ram_91             ds 1  ; x3
ram_92             ds 1  ; x27
ram_93             ds 1  ; x12
ram_94             ds 4  ; x2
ram_98             ds 2  ; x4
ram_9A             ds 1  ; x3
ram_9B             ds 2  ; x1
ram_9D             ds 1  ; x1
ram_9E             ds 2  ; x4
ram_A0             ds 1  ; x3
ram_A1             ds 2  ; x1
ram_A3             ds 1  ; x4
ram_A4             ds 3  ; x2
ram_A7             ds 1  ; x5
ram_A8             ds 1  ; x9
ram_A9             ds 1  ; x3
ram_AA             ds 2  ; x2
ram_AC             ds 2  ; x4
ram_AE             ds 1  ; x7
ram_AF             ds 1  ; x5
ram_B0             ds 2  ; x3
ram_B2             ds 2  ; x1
ram_B4             ds 2  ; x1
ram_B6             ds 2  ; x1
ram_B8             ds 2  ; x1
ram_BA             ds 1  ; x11
ram_BB             ds 2  ; x2
ram_BD             ds 3  ; x6
ram_C0             ds 1  ; x2
ram_C1             ds 1  ; x7
ram_C2             ds 1  ; x6
ram_C3             ds 1  ; x17
ram_C4             ds 2  ; x15
ram_C6             ds 1  ; x4
ram_C7             ds 1  ; x1
ram_C8             ds 2  ; x3
ram_CA             ds 1  ; x3
ram_CB             ds 3  ; x9
ram_CE             ds 3  ; x1
ram_D1             ds 1  ; x1
ram_D2             ds 3  ; x1
ram_D5             ds 1  ; x3
ram_D6             ds 3  ; x2
ram_D9             ds 1  ; x16
ram_DA             ds 1  ; x3
ram_DB             ds 1  ; x8
ram_DC             ds 1  ; x5
ram_DD             ds 1  ; x2
ram_DE             ds 1  ; x1
ram_DF             ds 1  ; x4
ram_E0             ds 2  ; x6
ram_E2             ds 1  ; x3
ram_E3             ds 2  ; x3
ram_E5             ds 1  ; x3
ram_E6             ds 1  ; x6
ram_E7             ds 1  ; x2
ram_E8             ds 1  ; x1
ram_E9             ds 1  ; x4
ram_EA             ds 1  ; x1
ram_EB             ds 1  ; x5
ram_EC             ds 3  ; x2
ram_EF             ds 1  ; x10
ram_F0             ds 1  ; x6
ram_F1             ds 1  ; x5
ram_F2             ds 1  ; x1
ram_F3             ds 1  ; x2
ram_F4             ds 1  ; x3
ram_F5             ds 1  ; x6
ram_F6             ds 1  ; x3
ram_F7             ds 1  ; x1
ram_F8             ds 1  ; x2
ram_F9             ds 1  ; x2
ram_FA             ds 1  ; x3
ram_FB             ds 5  ; x2

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
    ldx    #$FF                  ; 2
    txs                          ; 2
    inx                          ; 2
    txa                          ; 2
LF007:
    sta    0,X                   ; 4
    inx                          ; 2
    bne    LF007                 ; 2³
    jsr    LF83B                 ; 6
    lda    #$FF                  ; 2
    sta    ram_DB                ; 3
    sta    ram_F0                ; 3
    ldx    #$0A                  ; 2
    lda    #$FC                  ; 2
LF019:
    sta    ram_AF,X              ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LF019                 ; 2³
    lda    #$FE                  ; 2
    sta    ram_A4                ; 3
LF023:
    ldy    #$FF                  ; 2
    sty    VSYNC                 ; 3
    sty    VBLANK                ; 3
    lda    #$17                  ; 2
    sta    TIM8T                 ; 4
    inc    ram_DC                ; 5
    dec    ram_DD                ; 5
    inc    ram_DE                ; 5
    inc    ram_DF                ; 5
LF036:
    ldy    INTIM                 ; 4
    bne    LF036                 ; 2³
    sty    WSYNC                 ; 3
;---------------------------------------
    sty    VSYNC                 ; 3
    lda    #$1C                  ; 2
    sta    TIM64T                ; 4
    lda    SWCHB                 ; 4
    lsr                          ; 2
    bcs    LF077                 ; 2³
    lda    ram_EB                ; 3
    bmi    LF050                 ; 2³
LF04E:
    dec    ram_EB                ; 5
LF050:
    lda    ram_C6                ; 3
    sta    ram_EF                ; 3
    ldx    #$9C                  ; 2
    lda    #$00                  ; 2
LF058:
    sta    ram_EA-$9C,X          ; 4
    dex                          ; 2
    bne    LF058                 ; 2³
    lda    ram_EF                ; 3
    sta    ram_C6                ; 3
    jsr    LF069                 ; 6
    jsr    LF83B                 ; 6
    bpl    LF0CC                 ; 2³
LF069:
    clc                          ; 2
    adc    #$01                  ; 2
    cmp    #$0A                  ; 2
    bcc    LF074                 ; 2³
    sbc    #$0A                  ; 2
    ora    #$10                  ; 2
LF074:
    sta    ram_AA                ; 3
    rts                          ; 6

LF077:
    ldx    #$00                  ; 2
    lsr                          ; 2
    bcs    LF09B                 ; 2³
    lda    ram_EB                ; 3
    bpl    LF04E                 ; 2³
    lda    ram_DA                ; 3
    beq    LF088                 ; 2³
    dec    ram_DA                ; 5
    bpl    LF09D                 ; 2³
LF088:
    stx    ram_A9                ; 3
    stx    ram_A8                ; 3
    inc    ram_EF                ; 5
    lda    ram_EF                ; 3
    and    #$0F                  ; 2
    sta    ram_EF                ; 3
    sta    ram_C6                ; 3
    jsr    LF069                 ; 6
    ldx    #$1E                  ; 2
LF09B:
    stx    ram_DA                ; 3
LF09D:
    lda    ram_E9                ; 3
    bmi    LF0DF                 ; 2³
    lda    INPT4                 ; 3
    bmi    LF0BF                 ; 2³
    lda    ram_EB                ; 3
    bpl    LF04E                 ; 2³
    lda    ram_C6                ; 3
    sta    ram_EF                ; 3
    lda    #$30                  ; 2
    sta    ram_80                ; 3
    lda    #$FF                  ; 2
    sta    ram_E9                ; 3
    inc    ram_EB                ; 5
    ldy    #$00                  ; 2
    sty    ram_AA                ; 3
    sty    ram_E5                ; 3
    beq    LF0CC                 ; 2³
LF0BF:
    lda    SWCHA                 ; 4
    and    #$F0                  ; 2
    cmp    #$F0                  ; 2
    beq    LF0CA                 ; 2³
    ldy    #$FF                  ; 2
LF0CA:
    sty    ram_E5                ; 3
LF0CC:
    lda    #$00                  ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    jsr    LF424                 ; 6
    ldx    #$01                  ; 2
    stx    CTRLPF                ; 3
    inx                          ; 2
    stx    ram_A7                ; 3
    jmp    LF550                 ; 3

LF0DF:
    lda    ram_C4                ; 3
    bne    LF104                 ; 2³+1
    lda    ram_DB                ; 3
    bpl    LF10A                 ; 2³+1
    lda    LFC3D                 ; 4
    sta    ram_9A                ; 3
    lda    LFC3E                 ; 4
    sta    ram_9B                ; 3
    lda    LFC3F                 ; 4
    sta    ram_F6                ; 3
    lda    LFC40                 ; 4
    sta    ram_F7                ; 3
    lda    #$00                  ; 2
    sta    ram_F5                ; 3
    sta    ram_DB                ; 3
    jmp    LF10A                 ; 3

LF104:
    lda    #$FF                  ; 2
    sta    ram_F5                ; 3
    sta    ram_DB                ; 3
LF10A:
    ldx    ram_F0                ; 3
    bpl    LF111                 ; 2³
    inx                          ; 2
    stx    ram_CA                ; 3
LF111:
    lda    ram_CB                ; 3
    cmp    ram_CA                ; 3
    beq    LF131                 ; 2³
    bcc    LF131                 ; 2³
    sta    ram_CA                ; 3
    tay                          ; 2
    lda    LFC41,Y               ; 4
    sta    ram_F1                ; 3
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
    lda    LFC41,Y               ; 4
    sta    ram_F2                ; 3
    lda    #$00                  ; 2
    sta    ram_F0                ; 3
    sta    AUDV1                 ; 3
LF131:
    lda    #$00                  ; 2
    sta    ram_CB                ; 3
    ldy    ram_F0                ; 3
    bmi    LF159                 ; 2³
    bne    LF157                 ; 2³
    lda    (ram_F1),Y            ; 5
    sta    AUDV0                 ; 3
    beq    LF157                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDC0                 ; 3
    iny                          ; 2
    lda    (ram_F1),Y            ; 5
    sta    AUDF0                 ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_F0                ; 3
    inc    ram_F1                ; 5
    inc    ram_F1                ; 5
LF157:
    dec    ram_F0                ; 5
LF159:
    ldy    ram_DB                ; 3
    bmi    LF1A2                 ; 2³
    bne    LF185                 ; 2³
    lda    (ram_9A),Y            ; 5
    beq    LF19D                 ; 2³
    pha                          ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFE88,Y               ; 4
    bne    LF16E                 ; 2³
    sta    AUDV1                 ; 3
LF16E:
    sta    AUDF1                 ; 3
    sta    ram_FB                ; 3
    lda    #$05                  ; 2
    sta    AUDC1                 ; 3
    pla                          ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_F3                ; 3
    sta    ram_F4                ; 3
    inc    ram_9A                ; 5
    ldy    #$0A                  ; 2
    sty    ram_DB                ; 3
LF185:
    dec    ram_F4                ; 5
    bne    LF19F                 ; 2³
    lda    ram_F3                ; 3
    sta    ram_F4                ; 3
    dey                          ; 2
    sty    ram_DB                ; 3
    lda    ram_FB                ; 3
    beq    LF199                 ; 2³
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
    tya                          ; 2
LF199:
    sta    AUDV1                 ; 3
    bpl    LF19F                 ; 2³
LF19D:
    dec    ram_DB                ; 5
LF19F:
    jsr    LF8F0                 ; 6
LF1A2:
    lda    ram_E6                ; 3
    bpl    LF1A9                 ; 2³
    jmp    LF4F9                 ; 3

LF1A9:
    lda    ram_83                ; 3
    beq    LF1C0                 ; 2³
    lda    ram_DF                ; 3
    and    #$0F                  ; 2
    bne    LF1D3                 ; 2³
    ldx    ram_80                ; 3
    beq    LF1D6                 ; 2³
    lda    #$01                  ; 2
    jsr    LFFB3                 ; 6
    dec    ram_83                ; 5
    bne    LF1D3                 ; 2³
LF1C0:
    lda    ram_DF                ; 3
    and    #$3F                  ; 2
    bne    LF1D3                 ; 2³
    ldx    ram_80                ; 3
    beq    LF1D6                 ; 2³
    dex                          ; 2
    txa                          ; 2
    sta    ram_80                ; 3
    lda    #$02                  ; 2
    jsr    LF846                 ; 6
LF1D3:
    jmp    LF1D9                 ; 3

LF1D6:
    jmp    LF2B9                 ; 3

LF1D9:
    lda    ram_92                ; 3
    sec                          ; 2
    sbc    #$08                  ; 2
    sta    ram_D5                ; 3
    lda    ram_93                ; 3
    clc                          ; 2
    adc    #$04                  ; 2
    sta    ram_D6                ; 3
    ldx    ram_C4                ; 3
    bne    LF258                 ; 2³+1
    lda    #$05                  ; 2
    sta    CTRLPF                ; 3
    lda    CXM1FB                ; 3
    asl                          ; 2
    bcc    LF255                 ; 2³+1
    lda    ram_DF                ; 3
    and    #$3F                  ; 2
    adc    #$10                  ; 2
    sta    ram_87                ; 3
    lda    ram_D5                ; 3
    cmp    #$9C                  ; 2
    bcs    LF20E                 ; 2³
    cmp    #$70                  ; 2
    bcs    LF223                 ; 2³
    cmp    #$46                  ; 2
    bcs    LF20E                 ; 2³
    cmp    #$26                  ; 2
    bcs    LF223                 ; 2³
LF20E:
    inx                          ; 2
    lda    #$01                  ; 2
    sta    ram_CB                ; 3
LF213:
    stx    ram_C4                ; 3
    lda    #$98                  ; 2
    sta    ram_92                ; 3
    lda    #$34                  ; 2
    sta    ram_93                ; 3
    lda    #$81                  ; 2
LF21F:
    sta    ram_C3                ; 3
    bne    LF255                 ; 2³
LF223:
    lda    ram_DD                ; 3
    lsr                          ; 2
    bcc    LF24C                 ; 2³
    inx                          ; 2
    inx                          ; 2
    stx    ram_C4                ; 3
    lda    #$01                  ; 2
    sta    ram_CB                ; 3
    lda    #$34                  ; 2
    sta    ram_83                ; 3
    lda    #$01                  ; 2
    sta    CTRLPF                ; 3
    lda    #$14                  ; 2
    sta    ram_92                ; 3
    sta    ram_87                ; 3
    lda    #$50                  ; 2
    sta    ram_93                ; 3
    jsr    LF838                 ; 6
    jsr    LF839                 ; 6
    lda    #$01                  ; 2
    bne    LF21F                 ; 3   always branch

LF24C:
    inx                          ; 2
    inx                          ; 2
    inx                          ; 2
    lda    #$01                  ; 2
    sta    ram_CB                ; 3
    bne    LF213                 ; 3   always branch

LF255:
    jmp    LF2DF                 ; 3

LF258:
    txa                          ; 2
    cmp    #$02                  ; 2
    beq    LF29E                 ; 2³
    lda    ram_92                ; 3
    cmp    #$14                  ; 2
    beq    LF29E                 ; 2³
    lda    ram_C3                ; 3
    asl                          ; 2
    bcs    LF29E                 ; 2³
    lda    CXP1FB                ; 3
    asl                          ; 2
    bcs    LF275                 ; 2³
    lda    ram_C3                ; 3
    and    #$1C                  ; 2
    beq    LF296                 ; 2³
    bne    LF29E                 ; 3   always branch

LF275:
    dex                          ; 2
    lda    LFC00,X               ; 4
    sta    ram_E7                ; 3
    lda    LFC03,X               ; 4
    sta    ram_E8                ; 3
    ldy    #$00                  ; 2
LF282:
    lda    (ram_E7),Y            ; 5
    beq    LF296                 ; 2³
    sec                          ; 2
    sbc    ram_92                ; 3
    cmp    #$03                  ; 2
    bcc    LF290                 ; 2³
    iny                          ; 2
    bne    LF282                 ; 2³
LF290:
    lda    #$01                  ; 2
    sta    ram_C3                ; 3
    bne    LF29E                 ; 3   always branch

LF296:
    lda    #$81                  ; 2
    sta    ram_C3                ; 3
    lda    #$03                  ; 2
    sta    ram_CB                ; 3
LF29E:
    lda    CXPPMM                ; 3
    asl                          ; 2
    bcc    LF2DF                 ; 2³
    lda    ram_92                ; 3
    cmp    #$64                  ; 2
    bcc    LF2B9                 ; 2³
    lda    ram_C4                ; 3
    cmp    #$01                  ; 2
    beq    LF2CD                 ; 2³
    lda    #$81                  ; 2
    sta    ram_C3                ; 3
    lda    #$03                  ; 2
    sta    ram_CB                ; 3
    bne    LF2DF                 ; 3   always branch

LF2B9:
    ldx    #$FF                  ; 2
    stx    ram_E6                ; 3
    inx                          ; 2
    stx    ram_C3                ; 3
    stx    ram_83                ; 3
    lda    #$30                  ; 2
    sta    ram_80                ; 3
    lda    #$05                  ; 2
    sta    ram_CB                ; 3
    jmp    LF4F9                 ; 3

LF2CD:
    lda    #$0F                  ; 2
    sta    ram_83                ; 3
    lda    #$60                  ; 2
    jsr    LF846                 ; 6
    ldx    #$00                  ; 2
    stx    ram_C3                ; 3
    stx    ram_C4                ; 3
    jsr    LF83D                 ; 6
LF2DF:
    lda    ram_C3                ; 3
    bpl    LF2F7                 ; 2³
    inc    ram_DC                ; 5
    dec    ram_92                ; 5
    dec    ram_92                ; 5
    dec    ram_92                ; 5
    lda    #$14                  ; 2
    cmp    ram_92                ; 3
    bcc    LF33E                 ; 2³+1
    sta    ram_92                ; 3
    lda    #$01                  ; 2
    sta    ram_C3                ; 3
LF2F7:
    lda    SWCHA                 ; 4
    sta    ram_BA                ; 3
    lda    ram_DC                ; 3
    lsr                          ; 2
    bcc    LF333                 ; 2³
    lda    #$00                  ; 2
    sta    ram_81                ; 3
    lda    SWCHA                 ; 4
    sta    ram_BA                ; 3
    asl                          ; 2
    bmi    LF31E                 ; 2³
    jsr    LF823                 ; 6
    lda    #$01                  ; 2
    sta    ram_81                ; 3
    dec    ram_93                ; 5
    lda    #$06                  ; 2
    cmp    ram_93                ; 3
    bcc    LF31E                 ; 2³
    sta    ram_93                ; 3
LF31E:
    lda    ram_BA                ; 3
    bmi    LF333                 ; 2³
    jsr    LF823                 ; 6
    lda    #$02                  ; 2
    sta    ram_81                ; 3
    inc    ram_93                ; 5
    lda    #$90                  ; 2
    cmp    ram_93                ; 3
    bcs    LF333                 ; 2³
    sta    ram_93                ; 3
LF333:
    lda    ram_C3                ; 3
    lsr                          ; 2
    bcc    LF35F                 ; 2³
    lsr                          ; 2
    bcs    LF347                 ; 2³
    ldx    #$03                  ; 2
LF33D:
    lsr                          ; 2
LF33E:
    bcc    LF386                 ; 2³
    inc    ram_92                ; 5
    dex                          ; 2
    bne    LF33D                 ; 2³
    beq    LF386                 ; 3   always branch

LF347:
    ldx    #$03                  ; 2
LF349:
    lsr                          ; 2
    bcc    LF351                 ; 2³
    dec    ram_92                ; 5
    dex                          ; 2
    bne    LF349                 ; 2³
LF351:
    lda    #$14                  ; 2
    cmp    ram_92                ; 3
    bcc    LF386                 ; 2³
    sta    ram_92                ; 3
    lda    #$01                  ; 2
    sta    ram_C3                ; 3
    bne    LF386                 ; 3   always branch

LF35F:
    lda    ram_BA                ; 3
    and    #$20                  ; 2
    bne    LF372                 ; 2³
    jsr    LF823                 ; 6
    dec    ram_92                ; 5
    lda    #$19                  ; 2
    cmp    ram_92                ; 3
    bcc    LF372                 ; 2³
    sta    ram_92                ; 3
LF372:
    lda    ram_BA                ; 3
    and    #$10                  ; 2
    bne    LF386                 ; 2³
    jsr    LF823                 ; 6
    inc    ram_92                ; 5
    lda    #$BE                  ; 2
    cmp    ram_92                ; 3
    bcs    LF386                 ; 2³
    jsr    LF823                 ; 6
LF386:
    lda    ram_C3                ; 3
    lsr                          ; 2
    bcc    LF3CC                 ; 2³
    and    #$4E                  ; 2
    bne    LF3A7                 ; 2³
    lda    INPT4                 ; 3
    asl                          ; 2
    bcs    LF3CC                 ; 2³
    lda    #$1D                  ; 2
    sta    ram_C3                ; 3
    inc    ram_92                ; 5
    inc    ram_92                ; 5
    ldy    #$02                  ; 2
    sty    ram_CB                ; 3
    sty    ram_91                ; 3
    iny                          ; 2
    sty    ram_90                ; 3
    bne    LF3CC                 ; 2³
LF3A7:
    lda    ram_90                ; 3
    beq    LF3CC                 ; 2³
    dec    ram_91                ; 5
    bne    LF3CC                 ; 2³
    dec    ram_90                ; 5
    bne    LF3B9                 ; 2³
    lda    #$07                  ; 2
    sta    ram_C3                ; 3
    bne    LF3CC                 ; 3   always branch

LF3B9:
    lda    ram_90                ; 3
    lsr                          ; 2
    bcc    LF3C4                 ; 2³
    lda    #$05                  ; 2
    ldx    #$0E                  ; 2
    bne    LF3C8                 ; 3   always branch

LF3C4:
    lda    #$0D                  ; 2
    ldx    #$05                  ; 2
LF3C8:
    sta    ram_C3                ; 3
    stx    ram_91                ; 3
LF3CC:
    ldy    ram_C4                ; 3
    lda    LFEA0,Y               ; 4
    sta    ram_E0                ; 3
    lda    ram_EF                ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    ram_E0                ; 3
    cpy    #$05                  ; 2
    bcc    LF3E6                 ; 2³
    cpy    #$0A                  ; 2
    bcc    LF3EA                 ; 2³
    and    #$F9                  ; 2
    bne    LF3EC                 ; 2³
LF3E6:
    and    #$FB                  ; 2
    bne    LF3EC                 ; 2³
LF3EA:
    and    #$FD                  ; 2
LF3EC:
    sta    ram_E0                ; 3
    lda    ram_C4                ; 3
    cmp    #$02                  ; 2
    bne    LF402                 ; 2³+1
    lda    ram_93                ; 3
    cmp    #$07                  ; 2
    bcc    LF413                 ; 2³+1
    cmp    #$90                  ; 2
    bcc    LF41E                 ; 2³+1
    lda    #$00                  ; 2
    beq    LF413                 ; 3   always branch

LF402:
    cmp    #$03                  ; 2
    bne    LF41E                 ; 2³
    lda    ram_92                ; 3
    cmp    #$99                  ; 2
    bcc    LF41E                 ; 2³
    lda    #$99                  ; 2
    jsr    LF846                 ; 6
    lda    #$0A                  ; 2
LF413:
    sta    ram_83                ; 3
    ldx    #$00                  ; 2
    stx    ram_C3                ; 3
    stx    ram_C4                ; 3
    jsr    LF83D                 ; 6
LF41E:
    jsr    LF424                 ; 6
    jmp    LF44D                 ; 3

LF424:
    ldx    #$00                  ; 2
    ldy    ram_C4                ; 3
LF428:
    lda    LFC18,Y               ; 4
    sta    ram_9E,X              ; 4
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
    lda    LFC18,Y               ; 4
    sta    ram_98,X              ; 4
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
    lda    LFC18,Y               ; 4
    sta    ram_AC,X              ; 4
    inx                          ; 2
    cpx    #$02                  ; 2
    beq    LF44C                 ; 2³
    clc                          ; 2
    lda    #$0C                  ; 2
    adc    ram_C4                ; 3
    tay                          ; 2
    bne    LF428                 ; 2³
LF44C:
    rts                          ; 6

LF44D:
    lda    ram_C4                ; 3
    beq    LF485                 ; 2³
    cmp    #$01                  ; 2
    beq    LF48F                 ; 2³
    cmp    #$02                  ; 2
    beq    LF4A5                 ; 2³
    lda    #$06                  ; 2
    sta    ram_C7                ; 3
    lda    #$70                  ; 2
    sta    ram_C0                ; 3
    lda    ram_EF                ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lsr                          ; 2
    bcc    LF469                 ; 2³
LF469:
    inc    ram_C1                ; 5
    dec    ram_C2                ; 5
    txa                          ; 2
LF46E:
    cmp    #$05                  ; 2
    bcc    LF47E                 ; 2³
    cmp    #$0A                  ; 2
    bcc    LF47A                 ; 2³
    lda    #$02                  ; 2
    bne    LF480                 ; 3   always branch

LF47A:
    lda    #$04                  ; 2
    bne    LF480                 ; 3   always branch

LF47E:
    lda    #$00                  ; 2
LF480:
    sta    ram_C8                ; 3
    jmp    LF4AB                 ; 3

LF485:
    lda    #$88                  ; 2
    sta    ram_C1                ; 3
    sta    ram_C2                ; 3
    sta    ram_C8                ; 3
    bne    LF4BF                 ; 2³
LF48F:
    lda    #$80                  ; 2
    sta    ram_C1                ; 3
    lda    #$70                  ; 2
    sta    ram_C0                ; 3
LF497:
    lda    ram_EF                ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lsr                          ; 2
    bcc    LF49F                 ; 2³
LF49F:
    dec    ram_C2                ; 5
    txa                          ; 2
    jmp    LF46E                 ; 3

LF4A5:
    lda    #$9E                  ; 2
    sta    ram_C1                ; 3
    bne    LF497                 ; 3   always branch

LF4AB:
    lda    #$A4                  ; 2
    cmp    ram_C1                ; 3
    bcs    LF4B5                 ; 2³
    lda    #$00                  ; 2
    sta    ram_C1                ; 3
LF4B5:
    lda    #$02                  ; 2
    cmp    ram_C2                ; 3
    bcc    LF4BF                 ; 2³
    lda    #$A4                  ; 2
    sta    ram_C2                ; 3
LF4BF:
    ldy    ram_C4                ; 3
    beq    LF4F9                 ; 2³
    dey                          ; 2
    beq    LF4CD                 ; 2³
    dey                          ; 2
    beq    LF4D1                 ; 2³
    ldy    #$0C                  ; 2
    bne    LF4D3                 ; 3   always branch

LF4CD:
    ldy    #$00                  ; 2
    bne    LF4D3                 ; 2³
LF4D1:
    ldy    #$06                  ; 2
LF4D3:
    ldx    #$00                  ; 2
LF4D5:
    lda    ram_DC                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    bcc    LF4F1                 ; 2³
    iny                          ; 2
    lda    LFC06,Y               ; 4
    sta    ram_A0,X              ; 4
LF4E3:
    iny                          ; 2
    lda    LFC06,Y               ; 4
    sta    ram_CE,X              ; 4
    inx                          ; 2
    cpx    #$02                  ; 2
    beq    LF4F9                 ; 2³
    iny                          ; 2
    bne    LF4D5                 ; 2³
LF4F1:
    lda    LFC06,Y               ; 4
    sta    ram_A0,X              ; 4
    iny                          ; 2
    bne    LF4E3                 ; 2³
LF4F9:
    lda    ram_E6                ; 3
    bpl    LF535                 ; 2³+1
    dec    ram_E2                ; 5
    bpl    LF535                 ; 2³
    ldx    #$02                  ; 2
    stx    ram_E2                ; 3
    ldx    ram_E3                ; 3
    inx                          ; 2
    cpx    #$15                  ; 2
    bcc    LF52C                 ; 2³
    clc                          ; 2
    ldy    #$00                  ; 2
    dec    ram_A7                ; 5
    bpl    LF515                 ; 2³
    sty    ram_E9                ; 3
LF515:
    sty    ram_E6                ; 3
    sty    ram_C4                ; 3
    sty    ram_E3                ; 3
    sty    ram_E2                ; 3
    jsr    LF424                 ; 6
    lda    #$40                  ; 2
    sta    ram_E0                ; 3
    ldx    #$13                  ; 2
    jsr    LF83D                 ; 6
    jmp    LF535                 ; 3

LF52C:
    cpx    #$05                  ; 2
    bcs    LF530                 ; 2³
LF530:
    stx    ram_E3                ; 3
    txa                          ; 2
    dec    ram_E0                ; 5
LF535:
    jmp    LF538                 ; 3

LF538:
    ldx    #$FF                  ; 2
LF53A:
    inx                          ; 2
    cpx    #$03                  ; 2
    beq    LF547                 ; 2³
    lda    ram_A8,X              ; 4
    cmp    ram_EC,X              ; 4
    bcc    LF550                 ; 2³
    beq    LF53A                 ; 2³
LF547:
    ldx    #$02                  ; 2
LF549:
    lda    ram_A8,X              ; 4
    sta    ram_EC,X              ; 4
    dex                          ; 2
    bpl    LF549                 ; 2³
LF550:
    ldx    #$0A                  ; 2
    ldy    #$00                  ; 2
    lda    ram_E5                ; 3
    bpl    LF55A                 ; 2³
    ldy    #$44                  ; 2
LF55A:
    jsr    LF560                 ; 6
    jmp    LF59A                 ; 3

LF560:
    lda.wy ram_A8,Y              ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    adc    LFC32                 ; 4
    sta    ram_AE,X              ; 4
    lda    #$FC                  ; 2
    sta    ram_AF,X              ; 4
    dex                          ; 2
    dex                          ; 2
    lda.wy ram_A8,Y              ; 4
    and    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    LFC32                 ; 4
    sta    ram_AE,X              ; 4
    lda    #$FC                  ; 2
    sta    ram_AF,X              ; 4
    iny                          ; 2
    dex                          ; 2
    dex                          ; 2
    bpl    LF560                 ; 2³
    ldx    #$08                  ; 2
    ldy    LFC3C                 ; 4
LF58C:
    lda    ram_B0,X              ; 4
    cmp    LFC32                 ; 4
    bne    LF599                 ; 2³
    sty    ram_B0,X              ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LF58C                 ; 2³
LF599:
    rts                          ; 6

LF59A:
    lda    #$FF                  ; 2
    sta    CXCLR                 ; 3
    ldx    INTIM                 ; 4
    bne    LF59A                 ; 2³
    stx    WSYNC                 ; 3
;---------------------------------------
    stx    VBLANK                ; 3
    ldy    #$08                  ; 2
LF5A9:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    dey                          ; 2
    bne    LF5A9                 ; 2³
    ldy    #$07                  ; 2
    jsr    LF898                 ; 6
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    HMCLR                 ; 3
    ldy    #$00                  ; 2
    sty    NUSIZ1                ; 3
    lda    ram_EF                ; 3
    and    #$03                  ; 2
    tay                          ; 2
    lda    ram_E0                ; 3
    sta    COLUBK                ; 3
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    PF0                   ; 3
    sta    PF2                   ; 3
    sta    PF1                   ; 3
    lda    #$FF                  ; 2
    sta    CXCLR                 ; 3
    lda    #$F7                  ; 2
    sta    TIM64T                ; 4
    lda    ram_93                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sec                          ; 2
LF5E6:
    sbc    #$0F                  ; 2
    bcs    LF5E6                 ; 2³
    eor    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$90                  ; 2
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    HMCLR                 ; 3
    ldx    ram_94                ; 3
    lda    #$C0                  ; 2
    sta    ram_D9                ; 3
    lda    ram_D2                ; 3
    sta    NUSIZ0                ; 3
    lda    ram_D6                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sec                          ; 2
LF611:
    sbc    #$0F                  ; 2
    bcs    LF611                 ; 2³
    eor    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$90                  ; 2
    sta    RESM1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    HMM1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    HMCLR                 ; 3
    lda    ram_C1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sec                          ; 2
LF632:
    sbc    #$0F                  ; 2
    bcs    LF632                 ; 2³
    eor    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$90                  ; 2
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    HMP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    HMCLR                 ; 3
    lda    ram_A0                ; 3
    sta    ram_A3                ; 3
    lda    #$FE                  ; 2
    sta    ram_A4                ; 3
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #$02                  ; 2
    sta    COLUP1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$C8                  ; 2
    sta    COLUPF                ; 3
    lda    #$36                  ; 2
    sta    COLUP0                ; 3
    lda    #$08                  ; 2
    sta    REFP0                 ; 3
    lda    ram_9D                ; 3
    sta    ram_D1                ; 3
    ldy    #$00                  ; 2
    sty    ram_BD                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ram_C4                ; 3
    beq    LF681                 ; 2³
    jmp    LF6CE                 ; 3

LF681:
    lda    ram_D9                ; 3
    dec    ram_D9                ; 5
    cmp    ram_92                ; 3
    bcs    LF696                 ; 2³
    lda    LFDFC,X               ; 4
    sta    COLUP1                ; 3
    lda    LFEB4,X               ; 4
    beq    LF694                 ; 2³
    inx                          ; 2
LF694:
    sta    GRP1                  ; 3
LF696:
    lda    ram_D9                ; 3
    lsr                          ; 2
    bcs    LF6AD                 ; 2³
    lda    ram_D9                ; 3
    cmp    ram_D5                ; 3
    php                          ; 3
    pla                          ; 4
    sta    ENAM1                 ; 3
    lda    ram_D9                ; 3
    beq    LF6CB                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    bne    LF681                 ; 2³
LF6AD:
    lsr                          ; 2
    bcs    LF6BC                 ; 2³
    tay                          ; 2
    lda    (ram_9E),Y            ; 5
    sta    PF1                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jmp    LF681                 ; 3

LF6BC:
    tay                          ; 2
    lda    (ram_98),Y            ; 5
    sta    PF2                   ; 3
    lda    (ram_AC),Y            ; 5
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    bcs    LF681                 ; 2³
LF6CB:
    jmp    LF7AD                 ; 3

LF6CE:
    lda    ram_D9                ; 3
    dec    ram_D9                ; 5
    cmp    ram_92                ; 3
    bcs    LF6E3                 ; 2³
    lda    LFDFC,X               ; 4
    sta    COLUP1                ; 3
    lda    LFEB4,X               ; 4
    beq    LF6E1                 ; 2³
    inx                          ; 2
LF6E1:
    sta    GRP1                  ; 3
LF6E3:
    lda    ram_D9                ; 3
    lsr                          ; 2
    bcs    LF6FF                 ; 2³
    lda    #$81                  ; 2
    cmp    ram_D9                ; 3
    bcc    LF6F8                 ; 2³
    ldy    ram_BD                ; 3
    lda    (ram_A3),Y            ; 5
    sta    GRP0                  ; 3
    beq    LF6F8                 ; 2³
    inc    ram_BD                ; 5
LF6F8:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jmp    LF6CE                 ; 3

LF6FF:
    lsr                          ; 2
    bcs    LF713                 ; 2³
    tay                          ; 2
    lda    (ram_9E),Y            ; 5
    sta    PF1                   ; 3
    lda    ram_D9                ; 3
    cmp    #$6D                  ; 2
    beq    LF722                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    bne    LF6CE                 ; 2³+1
LF713:
    tay                          ; 2
    lda    (ram_98),Y            ; 5
    sta    PF2                   ; 3
    lda    (ram_AC),Y            ; 5
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    bcs    LF6CE                 ; 2³+1
LF722:
    lda    #$08                  ; 2
    sta    COLUP0                ; 3
    lda    #$00                  ; 2
    sta    REFP0                 ; 3
    sta    GRP0                  ; 3
    lda    ram_C2                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sec                          ; 2
LF733:
    sbc    #$0F                  ; 2
    bcs    LF733                 ; 2³
    eor    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$90                  ; 2
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    HMP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    HMCLR                 ; 3
    lda    #$00                  ; 2
    sta    ram_BD                ; 3
    lda    ram_C8                ; 3
    sta    NUSIZ0                ; 3
    lda    ram_A1                ; 3
    sta    ram_A3                ; 3
LF759:
    lda    ram_D9                ; 3
    dec    ram_D9                ; 5
    cmp    ram_92                ; 3
    bcs    LF76E                 ; 2³
    lda    LFDFC,X               ; 4
    sta    COLUP1                ; 3
    lda    LFEB4,X               ; 4
    beq    LF76C                 ; 2³
    inx                          ; 2
LF76C:
    sta    GRP1                  ; 3
LF76E:
    lda    ram_D9                ; 3
    lsr                          ; 2
    bcs    LF78A                 ; 2³
    lda    ram_87                ; 3
    cmp    ram_D9                ; 3
    bcc    LF783                 ; 2³
    ldy    ram_BD                ; 3
    lda    (ram_A3),Y            ; 5
    sta    GRP0                  ; 3
    beq    LF783                 ; 2³
    inc    ram_BD                ; 5
LF783:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jmp    LF759                 ; 3

LF78A:
    lsr                          ; 2
    bcs    LF79E                 ; 2³
    tay                          ; 2
    lda    (ram_9E),Y            ; 5
    sta    PF1                   ; 3
    lda    ram_D9                ; 3
    cmp    #$01                  ; 2
    beq    LF7AD                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    bne    LF759                 ; 2³
LF79E:
    tay                          ; 2
    lda    (ram_98),Y            ; 5
    sta    PF2                   ; 3
    lda    (ram_AC),Y            ; 5
    sta    COLUPF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    bcs    LF759                 ; 2³
LF7AD:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
LF7B1:
    sta    HMOVE                 ; 3
    lda    INTIM                 ; 4
    bne    LF7B1                 ; 2³
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    COLUBK                ; 3
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    REFP0                 ; 3
    sta    ENAM1                 ; 3
    lda    #$28                  ; 2
    sta    TIM64T                ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$0A                  ; 2
    lda    ram_E9                ; 3
    bpl    LF7FD                 ; 2³
    lda    ram_E6                ; 3
    bmi    LF7EA                 ; 2³
    jsr    LFED8                 ; 6
    ldx    #$0A                  ; 2
    ldy    #$DC                  ; 2
    jsr    LFF43                 ; 6
    ldy    #$03                  ; 2
    jmp    LF80B                 ; 3

LF7EA:
    ldy    ram_A7                ; 3
LF7EC:
    lda    LFC31                 ; 4
    dey                          ; 2
    bpl    LF7F5                 ; 2³
    lda    LFC3C                 ; 4
LF7F5:
    sta    ram_AE,X              ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LF7EC                 ; 2³
    bmi    LF809                 ; 3+1   always branch

LF7FD:
    lda    LFC30                 ; 4
    clc                          ; 2
LF801:
    sta    ram_AE,X              ; 4
    adc    #$08                  ; 2
    dex                          ; 2
    dex                          ; 2
    bpl    LF801                 ; 2³
LF809:
    ldy    #$07                  ; 2
LF80B:
    ldx    #$00                  ; 2
    stx    COLUBK                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    LF898                 ; 6
LF814:
    lda    INTIM                 ; 4
    bne    LF814                 ; 2³
    ldy    #$02                  ; 2
LF81B:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bpl    LF81B                 ; 2³
    jmp    LF023                 ; 3

LF823:
    lda    ram_E6                ; 3
    bmi    LF837                 ; 2³
    ldx    #$00                  ; 2
    lda    ram_DC                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    bcc    LF833                 ; 2³
    bcs    LF835                 ; 3   always branch

LF833:
    ldx    #$12                  ; 2
LF835:
    stx    ram_94                ; 3
LF837:
    rts                          ; 6

LF838:
    rts                          ; 6

LF839:
    rts                          ; 6

    rts                          ; 6

LF83B:
    ldx    #$24                  ; 2
LF83D:
    lda    #$78                  ; 2
    sta    ram_92                ; 3
    lda    #$48                  ; 2
    sta    ram_93                ; 3
    rts                          ; 6

LF846:
    sed                          ; 2
    cmp    #$90                  ; 2
    ldy    ram_A9                ; 3
    ldx    #$02                  ; 2
LF84D:
    adc    ram_A8,X              ; 4
    sta    ram_A8,X              ; 4
    lda    #$00                  ; 2
    dex                          ; 2
    bpl    LF84D                 ; 2³
    cld                          ; 2
    tya                          ; 2
    eor    ram_A9                ; 3
    and    #$F0                  ; 2
    beq    LF867                 ; 2³
    ldy    ram_A7                ; 3
    iny                          ; 2
    cpy    #$07                  ; 2
    bcs    LF867                 ; 2³
    sty    ram_A7                ; 3
LF867:
    rts                          ; 6

LF868:
    sta    WSYNC                 ; 3
;---------------------------------------
    sec                          ; 2
LF86B:
    sbc    #$0F                  ; 2
    bcs    LF86B                 ; 2³
    eor    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$90                  ; 2
    sta    RESP0,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMP0,X                ; 4
    rts                          ; 6

    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sec                          ; 2
LF883:
    sbc    #$0F                  ; 2
    bcs    LF883                 ; 2³
    eor    #$0F                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    #$90                  ; 2
    sta    RESP0,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    HMP0,X                ; 4
    rts                          ; 6

LF898:
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    stx    WSYNC                 ; 3
;---------------------------------------
    lda    #$3B                  ; 2
    jsr    LF868                 ; 6
    lda    #$43                  ; 2
    inx                          ; 2
    jsr    LF868                 ; 6
    stx    VDELP0                ; 3
    stx    VDELP1                ; 3
    ldx    #$03                  ; 2
    stx    NUSIZ0                ; 3
    stx    NUSIZ1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$68                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
LF8BD:
    lda    (ram_AE),Y            ; 5
    sta    ram_BA                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_B8),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_B6),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_B4),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_B2),Y            ; 5
    tax                          ; 2
    lda    (ram_B0),Y            ; 5
    sty    ram_BB                ; 3
    ldy    ram_BA                ; 3
    stx    GRP1                  ; 3
    sta    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    ldy    ram_BB                ; 3
    dey                          ; 2
    bpl    LF8BD                 ; 2³
    lda    #$00                  ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    rts                          ; 6

LF8F0:
    ldy    ram_F5                ; 3
    bmi    LF936                 ; 2³+1
    bne    LF91C                 ; 2³+1
    lda    (ram_F6),Y            ; 5
    beq    LF934                 ; 2³+1
    pha                          ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFE88,Y               ; 4
    bne    LF905                 ; 2³
    sta    AUDV0                 ; 3
LF905:
    sta    AUDF0                 ; 3
    sta    ram_F8                ; 3
    lda    #$05                  ; 2
    sta    AUDC0                 ; 3
    pla                          ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_F9                ; 3
    sta    ram_FA                ; 3
    inc    ram_F6                ; 5
    ldy    #$0A                  ; 2
    sty    ram_F5                ; 3
LF91C:
    dec    ram_FA                ; 5
    bne    LF936                 ; 2³
    lda    ram_F9                ; 3
    sta    ram_FA                ; 3
    dey                          ; 2
    sty    ram_F5                ; 3
    lda    ram_F8                ; 3
    beq    LF92F                 ; 2³
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
    tya                          ; 2
LF92F:
    sta    AUDV0                 ; 3
    jmp    LF936                 ; 3

LF934:
    dec    ram_F5                ; 5
LF936:
    rts                          ; 6

    .byte $00 ; |        | $F937
    .byte $00 ; |        | $F938
    .byte $00 ; |        | $F939
    .byte $00 ; |        | $F93A
    .byte $00 ; |        | $F93B
    .byte $00 ; |        | $F93C
    .byte $00 ; |        | $F93D
    .byte $00 ; |        | $F93E
    .byte $00 ; |        | $F93F
    .byte $00 ; |        | $F940
    .byte $00 ; |        | $F941
    .byte $20 ; |  X     | $F942
    .byte $70 ; | XXX    | $F943
    .byte $F0 ; |XXXX    | $F944
    .byte $60 ; | XX     | $F945
    .byte $20 ; |  X     | $F946
    .byte $00 ; |        | $F947
    .byte $00 ; |        | $F948
    .byte $00 ; |        | $F949
    .byte $07 ; |     XXX| $F94A
    .byte $03 ; |      XX| $F94B
    .byte $01 ; |       X| $F94C
    .byte $01 ; |       X| $F94D
    .byte $03 ; |      XX| $F94E
    .byte $01 ; |       X| $F94F
    .byte $00 ; |        | $F950
    .byte $00 ; |        | $F951
    .byte $00 ; |        | $F952
    .byte $00 ; |        | $F953
    .byte $00 ; |        | $F954
    .byte $10 ; |   X    | $F955
    .byte $38 ; |  XXX   | $F956
    .byte $38 ; |  XXX   | $F957
    .byte $1C ; |   XXX  | $F958
    .byte $18 ; |   XX   | $F959
    .byte $00 ; |        | $F95A
    .byte $00 ; |        | $F95B
    .byte $00 ; |        | $F95C
    .byte $00 ; |        | $F95D
    .byte $00 ; |        | $F95E
    .byte $00 ; |        | $F95F
    .byte $5C ; | X XXX  | $F960
    .byte $5C ; | X XXX  | $F961
    .byte $FE ; |XXXXXXX | $F962
    .byte $7C ; | XXXXX  | $F963
    .byte $38 ; |  XXX   | $F964
    .byte $10 ; |   X    | $F965
    .byte $00 ; |        | $F966
    .byte $00 ; |        | $F967
    .byte $00 ; |        | $F968
    .byte $1C ; |   XXX  | $F969
    .byte $14 ; |   X X  | $F96A
    .byte $14 ; |   X X  | $F96B
    .byte $3E ; |  XXXXX | $F96C
    .byte $1C ; |   XXX  | $F96D
    .byte $08 ; |    X   | $F96E
    .byte $00 ; |        | $F96F
    .byte $00 ; |        | $F970
    .byte $00 ; |        | $F971
    .byte $00 ; |        | $F972
    .byte $00 ; |        | $F973
    .byte $00 ; |        | $F974
    .byte $00 ; |        | $F975
    .byte $00 ; |        | $F976
    .byte $00 ; |        | $F977
    .byte $00 ; |        | $F978
    .byte $00 ; |        | $F979
    .byte $0F ; |    XXXX| $F97A
    .byte $06 ; |     XX | $F97B
    .byte $02 ; |      X | $F97C
    .byte $03 ; |      XX| $F97D
    .byte $07 ; |     XXX| $F97E
    .byte $03 ; |      XX| $F97F
    .byte $01 ; |       X| $F980
    .byte $00 ; |        | $F981
    .byte $00 ; |        | $F982
    .byte $00 ; |        | $F983
    .byte $00 ; |        | $F984
    .byte $20 ; |  X     | $F985
    .byte $70 ; | XXX    | $F986
    .byte $78 ; | XXXX   | $F987
    .byte $FC ; |XXXXXX  | $F988
    .byte $F8 ; |XXXXX   | $F989
    .byte $F0 ; |XXXX    | $F98A
    .byte $60 ; | XX     | $F98B
    .byte $00 ; |        | $F98C
    .byte $00 ; |        | $F98D
    .byte $00 ; |        | $F98E
    .byte $00 ; |        | $F98F
    .byte $00 ; |        | $F990
    .byte $00 ; |        | $F991
    .byte $00 ; |        | $F992
    .byte $00 ; |        | $F993
    .byte $00 ; |        | $F994
    .byte $00 ; |        | $F995
    .byte $00 ; |        | $F996
    .byte $5C ; | X XXX  | $F997
    .byte $5C ; | X XXX  | $F998
    .byte $28 ; |  X X   | $F999
    .byte $26 ; |  X  XX | $F99A
    .byte $24 ; |  X  X  | $F99B
    .byte $08 ; |    X   | $F99C
    .byte $06 ; |     XX | $F99D
    .byte $04 ; |     X  | $F99E
    .byte $5C ; | X XXX  | $F99F
    .byte $5C ; | X XXX  | $F9A0
    .byte $5C ; | X XXX  | $F9A1
    .byte $56 ; | X X XX | $F9A2
    .byte $56 ; | X X XX | $F9A3
    .byte $56 ; | X X XX | $F9A4
    .byte $56 ; | X X XX | $F9A5
    .byte $56 ; | X X XX | $F9A6
    .byte $5C ; | X XXX  | $F9A7
    .byte $5C ; | X XXX  | $F9A8
    .byte $5C ; | X XXX  | $F9A9
    .byte $04 ; |     X  | $F9AA
    .byte $06 ; |     XX | $F9AB
    .byte $A6 ; |X X  XX | $F9AC
    .byte $A4 ; |X X  X  | $F9AD
    .byte $88 ; |X   X   | $F9AE
    .byte $88 ; |X   X   | $F9AF
    .byte $88 ; |X   X   | $F9B0
    .byte $5C ; | X XXX  | $F9B1
    .byte $5C ; | X XXX  | $F9B2
    .byte $5C ; | X XXX  | $F9B3
    .byte $5C ; | X XXX  | $F9B4
    .byte $56 ; | X X XX | $F9B5
    .byte $56 ; | X X XX | $F9B6
    .byte $56 ; | X X XX | $F9B7
    .byte $56 ; | X X XX | $F9B8
    .byte $56 ; | X X XX | $F9B9
    .byte $56 ; | X X XX | $F9BA
    .byte $56 ; | X X XX | $F9BB
    .byte $5C ; | X XXX  | $F9BC
    .byte $5C ; | X XXX  | $F9BD
    .byte $5C ; | X XXX  | $F9BE
    .byte $5C ; | X XXX  | $F9BF
    .byte $9A ; |X  XX X | $F9C0
    .byte $98 ; |X  XX   | $F9C1
    .byte $0E ; |    XXX | $F9C2
    .byte $0E ; |    XXX | $F9C3
    .byte $0E ; |    XXX | $F9C4
    .byte $0E ; |    XXX | $F9C5
    .byte $5C ; | X XXX  | $F9C6
    .byte $FF ; |XXXXXXXX| $F9C7
    .byte $00 ; |        | $F9C8
    .byte $FF ; |XXXXXXXX| $F9C9
    .byte $FF ; |XXXXXXXX| $F9CA
    .byte $04 ; |     X  | $F9CB
    .byte $FE ; |XXXXXXX | $F9CC
    .byte $FE ; |XXXXXXX | $F9CD
    .byte $20 ; |  X     | $F9CE
    .byte $F8 ; |XXXXX   | $F9CF
    .byte $F8 ; |XXXXX   | $F9D0
    .byte $F8 ; |XXXXX   | $F9D1
    .byte $80 ; |X       | $F9D2
    .byte $E0 ; |XXX     | $F9D3
    .byte $E0 ; |XXX     | $F9D4
    .byte $E0 ; |XXX     | $F9D5
    .byte $E0 ; |XXX     | $F9D6
    .byte $E0 ; |XXX     | $F9D7
    .byte $80 ; |X       | $F9D8
    .byte $80 ; |X       | $F9D9
    .byte $81 ; |X      X| $F9DA
    .byte $83 ; |X     XX| $F9DB
    .byte $80 ; |X       | $F9DC
    .byte $80 ; |X       | $F9DD
    .byte $80 ; |X       | $F9DE
    .byte $80 ; |X       | $F9DF
    .byte $80 ; |X       | $F9E0
    .byte $C0 ; |XX      | $F9E1
    .byte $F0 ; |XXXX    | $F9E2
    .byte $80 ; |X       | $F9E3
    .byte $80 ; |X       | $F9E4
    .byte $80 ; |X       | $F9E5
    .byte $80 ; |X       | $F9E6
    .byte $00 ; |        | $F9E7
    .byte $80 ; |X       | $F9E8
    .byte $C0 ; |XX      | $F9E9
    .byte $E0 ; |XXX     | $F9EA
    .byte $F0 ; |XXXX    | $F9EB
    .byte $F9 ; |XXXXX  X| $F9EC
    .byte $FF ; |XXXXXXXX| $F9ED
    .byte $BF ; |X XXXXXX| $F9EE
    .byte $7E ; | XXXXXX | $F9EF
    .byte $17 ; |   X XXX| $F9F0
    .byte $02 ; |      X | $F9F1
    .byte $00 ; |        | $F9F2
    .byte $00 ; |        | $F9F3
    .byte $00 ; |        | $F9F4
    .byte $00 ; |        | $F9F5
    .byte $00 ; |        | $F9F6
    .byte $07 ; |     XXX| $F9F7
    .byte $01 ; |       X| $F9F8
    .byte $01 ; |       X| $F9F9
    .byte $01 ; |       X| $F9FA
    .byte $00 ; |        | $F9FB
    .byte $00 ; |        | $F9FC
    .byte $00 ; |        | $F9FD
    .byte $C0 ; |XX      | $F9FE
    .byte $C0 ; |XX      | $F9FF
    .byte $E0 ; |XXX     | $FA00
    .byte $E0 ; |XXX     | $FA01
    .byte $E0 ; |XXX     | $FA02
    .byte $E0 ; |XXX     | $FA03
    .byte $F8 ; |XXXXX   | $FA04
    .byte $F8 ; |XXXXX   | $FA05
    .byte $FC ; |XXXXXX  | $FA06
    .byte $FC ; |XXXXXX  | $FA07
    .byte $FE ; |XXXXXXX | $FA08
    .byte $FF ; |XXXXXXXX| $FA09
    .byte $FF ; |XXXXXXXX| $FA0A
    .byte $FF ; |XXXXXXXX| $FA0B
    .byte $FF ; |XXXXXXXX| $FA0C
    .byte $FF ; |XXXXXXXX| $FA0D
    .byte $FF ; |XXXXXXXX| $FA0E
    .byte $FF ; |XXXXXXXX| $FA0F
    .byte $FC ; |XXXXXX  | $FA10
    .byte $FC ; |XXXXXX  | $FA11
    .byte $FC ; |XXXXXX  | $FA12
    .byte $F8 ; |XXXXX   | $FA13
    .byte $F8 ; |XXXXX   | $FA14
    .byte $F8 ; |XXXXX   | $FA15
    .byte $F8 ; |XXXXX   | $FA16
    .byte $F0 ; |XXXX    | $FA17
    .byte $F8 ; |XXXXX   | $FA18
    .byte $FC ; |XXXXXX  | $FA19
    .byte $FE ; |XXXXXXX | $FA1A
    .byte $FF ; |XXXXXXXX| $FA1B
    .byte $FF ; |XXXXXXXX| $FA1C
    .byte $FF ; |XXXXXXXX| $FA1D
    .byte $FF ; |XXXXXXXX| $FA1E
    .byte $FB ; |XXXXX XX| $FA1F
    .byte $AE ; |X X XXX | $FA20
    .byte $05 ; |     X X| $FA21
    .byte $00 ; |        | $FA22
    .byte $00 ; |        | $FA23
    .byte $00 ; |        | $FA24
    .byte $00 ; |        | $FA25
    .byte $00 ; |        | $FA26
    .byte $26 ; |  X  XX | $FA27
    .byte $26 ; |  X  XX | $FA28
    .byte $26 ; |  X  XX | $FA29
    .byte $26 ; |  X  XX | $FA2A
    .byte $26 ; |  X  XX | $FA2B
    .byte $26 ; |  X  XX | $FA2C
    .byte $24 ; |  X  X  | $FA2D
    .byte $24 ; |  X  X  | $FA2E
    .byte $24 ; |  X  X  | $FA2F
    .byte $24 ; |  X  X  | $FA30
    .byte $24 ; |  X  X  | $FA31
    .byte $24 ; |  X  X  | $FA32
    .byte $24 ; |  X  X  | $FA33
    .byte $22 ; |  X   X | $FA34
    .byte $22 ; |  X   X | $FA35
    .byte $22 ; |  X   X | $FA36
    .byte $22 ; |  X   X | $FA37
    .byte $22 ; |  X   X | $FA38
    .byte $22 ; |  X   X | $FA39
    .byte $22 ; |  X   X | $FA3A
    .byte $22 ; |  X   X | $FA3B
    .byte $22 ; |  X   X | $FA3C
    .byte $20 ; |  X     | $FA3D
    .byte $20 ; |  X     | $FA3E
    .byte $20 ; |  X     | $FA3F
    .byte $20 ; |  X     | $FA40
    .byte $20 ; |  X     | $FA41
    .byte $20 ; |  X     | $FA42
    .byte $52 ; | X X  X | $FA43
    .byte $52 ; | X X  X | $FA44
    .byte $52 ; | X X  X | $FA45
    .byte $52 ; | X X  X | $FA46
    .byte $54 ; | X X X  | $FA47
    .byte $56 ; | X X XX | $FA48
    .byte $56 ; | X X XX | $FA49
    .byte $58 ; | X XX   | $FA4A
    .byte $58 ; | X XX   | $FA4B
    .byte $56 ; | X X XX | $FA4C
    .byte $56 ; | X X XX | $FA4D
    .byte $56 ; | X X XX | $FA4E
    .byte $54 ; | X X X  | $FA4F
    .byte $54 ; | X X X  | $FA50
    .byte $54 ; | X X X  | $FA51
    .byte $54 ; | X X X  | $FA52
    .byte $54 ; | X X X  | $FA53
    .byte $54 ; | X X X  | $FA54
    .byte $54 ; | X X X  | $FA55
    .byte $54 ; | X X X  | $FA56
    .byte $54 ; | X X X  | $FA57
    .byte $FF ; |XXXXXXXX| $FA58
    .byte $FF ; |XXXXXXXX| $FA59
    .byte $FF ; |XXXXXXXX| $FA5A
    .byte $FF ; |XXXXXXXX| $FA5B
    .byte $FF ; |XXXXXXXX| $FA5C
    .byte $FF ; |XXXXXXXX| $FA5D
    .byte $FF ; |XXXXXXXX| $FA5E
    .byte $FF ; |XXXXXXXX| $FA5F
    .byte $FF ; |XXXXXXXX| $FA60
    .byte $FF ; |XXXXXXXX| $FA61
    .byte $07 ; |     XXX| $FA62
    .byte $12 ; |   X  X | $FA63
    .byte $4D ; | X  XX X| $FA64
    .byte $33 ; |  XX  XX| $FA65
    .byte $1A ; |   XX X | $FA66
    .byte $06 ; |     XX | $FA67
    .byte $29 ; |  X X  X| $FA68
    .byte $08 ; |    X   | $FA69
    .byte $01 ; |       X| $FA6A
    .byte $02 ; |      X | $FA6B
    .byte $04 ; |     X  | $FA6C
    .byte $00 ; |        | $FA6D
    .byte $00 ; |        | $FA6E
    .byte $00 ; |        | $FA6F
    .byte $00 ; |        | $FA70
    .byte $00 ; |        | $FA71
    .byte $00 ; |        | $FA72
    .byte $00 ; |        | $FA73
    .byte $00 ; |        | $FA74
    .byte $04 ; |     X  | $FA75
    .byte $07 ; |     XXX| $FA76
    .byte $17 ; |   X XXX| $FA77
    .byte $0D ; |    XX X| $FA78
    .byte $03 ; |      XX| $FA79
    .byte $05 ; |     X X| $FA7A
    .byte $03 ; |      XX| $FA7B
    .byte $09 ; |    X  X| $FA7C
    .byte $26 ; |  X  XX | $FA7D
    .byte $59 ; | X XX  X| $FA7E
    .byte $26 ; |  X  XX | $FA7F
    .byte $13 ; |   X  XX| $FA80
    .byte $2D ; |  X XX X| $FA81
    .byte $1A ; |   XX X | $FA82
    .byte $0F ; |    XXXX| $FA83
    .byte $07 ; |     XXX| $FA84
    .byte $2A ; |  X X X | $FA85
    .byte $17 ; |   X XXX| $FA86
    .byte $0C ; |    XX  | $FA87
    .byte $17 ; |   X XXX| $FA88
    .byte $FF ; |XXXXXXXX| $FA89
    .byte $FF ; |XXXXXXXX| $FA8A
    .byte $FF ; |XXXXXXXX| $FA8B
    .byte $FF ; |XXXXXXXX| $FA8C
    .byte $FF ; |XXXXXXXX| $FA8D
    .byte $FF ; |XXXXXXXX| $FA8E
    .byte $FF ; |XXXXXXXX| $FA8F
    .byte $FF ; |XXXXXXXX| $FA90
    .byte $FF ; |XXXXXXXX| $FA91
    .byte $FF ; |XXXXXXXX| $FA92
    .byte $FF ; |XXXXXXXX| $FA93
    .byte $FF ; |XXXXXXXX| $FA94
    .byte $D7 ; |XX X XXX| $FA95
    .byte $56 ; | X X XX | $FA96
    .byte $55 ; | X X X X| $FA97
    .byte $55 ; | X X X X| $FA98
    .byte $52 ; | X X  X | $FA99
    .byte $52 ; | X X  X | $FA9A
    .byte $52 ; | X X  X | $FA9B
    .byte $4A ; | X  X X | $FA9C
    .byte $4A ; | X  X X | $FA9D
    .byte $4A ; | X  X X | $FA9E
    .byte $49 ; | X  X  X| $FA9F
    .byte $49 ; | X  X  X| $FAA0
    .byte $49 ; | X  X  X| $FAA1
    .byte $49 ; | X  X  X| $FAA2
    .byte $49 ; | X  X  X| $FAA3
    .byte $49 ; | X  X  X| $FAA4
    .byte $79 ; | XXXX  X| $FAA5
    .byte $5F ; | X XXXXX| $FAA6
    .byte $FF ; |XXXXXXXX| $FAA7
    .byte $D5 ; |XX X X X| $FAA8
    .byte $FF ; |XXXXXXXX| $FAA9
    .byte $DF ; |XX XXXXX| $FAAA
    .byte $FF ; |XXXXXXXX| $FAAB
    .byte $FD ; |XXXXXX X| $FAAC
    .byte $BA ; |X XXX X | $FAAD
    .byte $EF ; |XXX XXXX| $FAAE
    .byte $FF ; |XXXXXXXX| $FAAF
    .byte $FF ; |XXXXXXXX| $FAB0
    .byte $ED ; |XXX XX X| $FAB1
    .byte $FF ; |XXXXXXXX| $FAB2
    .byte $FF ; |XXXXXXXX| $FAB3
    .byte $FB ; |XXXXX XX| $FAB4
    .byte $D6 ; |XX X XX | $FAB5
    .byte $7D ; | XXXXX X| $FAB6
    .byte $DB ; |XX XX XX| $FAB7
    .byte $6C ; | XX XX  | $FAB8
    .byte $43 ; | X    XX| $FAB9
    .byte $45 ; | X   X X| $FABA
    .byte $47 ; | X   XXX| $FABB
    .byte $49 ; | X  X  X| $FABC
    .byte $4B ; | X  X XX| $FABD
    .byte $4D ; | X  XX X| $FABE
    .byte $4F ; | X  XXXX| $FABF
    .byte $2F ; |  X XXXX| $FAC0
    .byte $2F ; |  X XXXX| $FAC1
    .byte $5D ; | X XXX X| $FAC2
    .byte $5D ; | X XXX X| $FAC3
    .byte $93 ; |X  X  XX| $FAC4
    .byte $93 ; |X  X  XX| $FAC5
    .byte $3D ; |  XXXX X| $FAC6
    .byte $3D ; |  XXXX X| $FAC7
    .byte $58 ; | X XX   | $FAC8
    .byte $58 ; | X XX   | $FAC9
    .byte $3D ; |  XXXX X| $FACA
    .byte $1F ; |   XXXXX| $FACB
    .byte $58 ; | X XX   | $FACC
    .byte $3D ; |  XXXX X| $FACD
    .byte $3D ; |  XXXX X| $FACE
    .byte $3D ; |  XXXX X| $FACF
    .byte $3D ; |  XXXX X| $FAD0
    .byte $54 ; | X X X  | $FAD1
    .byte $1F ; |   XXXXX| $FAD2
    .byte $3D ; |  XXXX X| $FAD3
    .byte $57 ; | X X XXX| $FAD4
    .byte $57 ; | X X XXX| $FAD5
    .byte $58 ; | X XX   | $FAD6
    .byte $58 ; | X XX   | $FAD7
    .byte $58 ; | X XX   | $FAD8
    .byte $58 ; | X XX   | $FAD9
    .byte $58 ; | X XX   | $FADA
    .byte $58 ; | X XX   | $FADB
    .byte $58 ; | X XX   | $FADC
    .byte $57 ; | X X XXX| $FADD
    .byte $57 ; | X X XXX| $FADE
    .byte $57 ; | X X XXX| $FADF
    .byte $57 ; | X X XXX| $FAE0
    .byte $57 ; | X X XXX| $FAE1
    .byte $57 ; | X X XXX| $FAE2
    .byte $57 ; | X X XXX| $FAE3
    .byte $54 ; | X X X  | $FAE4
    .byte $54 ; | X X X  | $FAE5
    .byte $54 ; | X X X  | $FAE6
    .byte $54 ; | X X X  | $FAE7
    .byte $54 ; | X X X  | $FAE8
    .byte $FF ; |XXXXXXXX| $FAE9
    .byte $38 ; |  XXX   | $FAEA
    .byte $38 ; |  XXX   | $FAEB
    .byte $38 ; |  XXX   | $FAEC
    .byte $00 ; |        | $FAED
    .byte $00 ; |        | $FAEE
    .byte $00 ; |        | $FAEF
    .byte $00 ; |        | $FAF0
    .byte $00 ; |        | $FAF1
    .byte $E0 ; |XXX     | $FAF2
    .byte $00 ; |        | $FAF3
    .byte $00 ; |        | $FAF4
    .byte $00 ; |        | $FAF5
    .byte $06 ; |     XX | $FAF6
    .byte $00 ; |        | $FAF7
    .byte $00 ; |        | $FAF8
    .byte $00 ; |        | $FAF9
    .byte $00 ; |        | $FAFA
    .byte $00 ; |        | $FAFB
    .byte $00 ; |        | $FAFC
    .byte $70 ; | XXX    | $FAFD
    .byte $00 ; |        | $FAFE
    .byte $00 ; |        | $FAFF
    .byte $00 ; |        | $FB00
    .byte $02 ; |      X | $FB01
    .byte $00 ; |        | $FB02
    .byte $00 ; |        | $FB03
    .byte $00 ; |        | $FB04
    .byte $C0 ; |XX      | $FB05
    .byte $C0 ; |XX      | $FB06
    .byte $C0 ; |XX      | $FB07
    .byte $F0 ; |XXXX    | $FB08
    .byte $FC ; |XXXXXX  | $FB09
    .byte $FC ; |XXXXXX  | $FB0A
    .byte $FE ; |XXXXXXX | $FB0B
    .byte $FF ; |XXXXXXXX| $FB0C
    .byte $FF ; |XXXXXXXX| $FB0D
    .byte $FF ; |XXXXXXXX| $FB0E
    .byte $FF ; |XXXXXXXX| $FB0F
    .byte $FF ; |XXXXXXXX| $FB10
    .byte $FF ; |XXXXXXXX| $FB11
    .byte $FF ; |XXXXXXXX| $FB12
    .byte $FC ; |XXXXXX  | $FB13
    .byte $FC ; |XXXXXX  | $FB14
    .byte $F0 ; |XXXX    | $FB15
    .byte $F0 ; |XXXX    | $FB16
    .byte $C0 ; |XX      | $FB17
    .byte $C0 ; |XX      | $FB18
    .byte $00 ; |        | $FB19
    .byte $FF ; |XXXXXXXX| $FB1A
    .byte $80 ; |X       | $FB1B
    .byte $80 ; |X       | $FB1C
    .byte $80 ; |X       | $FB1D
    .byte $80 ; |X       | $FB1E
    .byte $80 ; |X       | $FB1F
    .byte $80 ; |X       | $FB20
    .byte $86 ; |X    XX | $FB21
    .byte $00 ; |        | $FB22
    .byte $00 ; |        | $FB23
    .byte $00 ; |        | $FB24
    .byte $00 ; |        | $FB25
    .byte $00 ; |        | $FB26
    .byte $00 ; |        | $FB27
    .byte $40 ; | X      | $FB28
    .byte $00 ; |        | $FB29
    .byte $00 ; |        | $FB2A
    .byte $00 ; |        | $FB2B
    .byte $00 ; |        | $FB2C
    .byte $00 ; |        | $FB2D
    .byte $86 ; |X    XX | $FB2E
    .byte $00 ; |        | $FB2F
    .byte $00 ; |        | $FB30
    .byte $00 ; |        | $FB31
    .byte $00 ; |        | $FB32
    .byte $00 ; |        | $FB33
    .byte $00 ; |        | $FB34
    .byte $3C ; |  XXXX  | $FB35
    .byte $00 ; |        | $FB36
    .byte $00 ; |        | $FB37
    .byte $00 ; |        | $FB38
    .byte $00 ; |        | $FB39
    .byte $00 ; |        | $FB3A
    .byte $00 ; |        | $FB3B
    .byte $00 ; |        | $FB3C
    .byte $00 ; |        | $FB3D
    .byte $E3 ; |XXX   XX| $FB3E
    .byte $E3 ; |XXX   XX| $FB3F
    .byte $03 ; |      XX| $FB40
    .byte $03 ; |      XX| $FB41
    .byte $00 ; |        | $FB42
    .byte $00 ; |        | $FB43
    .byte $00 ; |        | $FB44
    .byte $00 ; |        | $FB45
    .byte $00 ; |        | $FB46
    .byte $00 ; |        | $FB47
    .byte $00 ; |        | $FB48
    .byte $00 ; |        | $FB49
    .byte $00 ; |        | $FB4A
    .byte $41 ; | X     X| $FB4B
    .byte $43 ; | X    XX| $FB4C
    .byte $43 ; | X    XX| $FB4D
    .byte $45 ; | X   X X| $FB4E
    .byte $45 ; | X   X X| $FB4F
    .byte $43 ; | X    XX| $FB50
    .byte $43 ; | X    XX| $FB51
    .byte $43 ; | X    XX| $FB52
    .byte $43 ; | X    XX| $FB53
    .byte $43 ; | X    XX| $FB54
    .byte $43 ; | X    XX| $FB55
    .byte $43 ; | X    XX| $FB56
    .byte $43 ; | X    XX| $FB57
    .byte $43 ; | X    XX| $FB58
    .byte $43 ; | X    XX| $FB59
    .byte $43 ; | X    XX| $FB5A
    .byte $43 ; | X    XX| $FB5B
    .byte $43 ; | X    XX| $FB5C
    .byte $43 ; | X    XX| $FB5D
    .byte $43 ; | X    XX| $FB5E
    .byte $43 ; | X    XX| $FB5F
    .byte $43 ; | X    XX| $FB60
    .byte $43 ; | X    XX| $FB61
    .byte $43 ; | X    XX| $FB62
    .byte $43 ; | X    XX| $FB63
    .byte $43 ; | X    XX| $FB64
    .byte $43 ; | X    XX| $FB65
    .byte $43 ; | X    XX| $FB66
    .byte $43 ; | X    XX| $FB67
    .byte $43 ; | X    XX| $FB68
    .byte $45 ; | X   X X| $FB69
    .byte $45 ; | X   X X| $FB6A
    .byte $47 ; | X   XXX| $FB6B
    .byte $47 ; | X   XXX| $FB6C
    .byte $47 ; | X   XXX| $FB6D
    .byte $49 ; | X  X  X| $FB6E
    .byte $49 ; | X  X  X| $FB6F
    .byte $49 ; | X  X  X| $FB70
    .byte $4B ; | X  X XX| $FB71
    .byte $4B ; | X  X XX| $FB72
    .byte $4B ; | X  X XX| $FB73
    .byte $4D ; | X  XX X| $FB74
    .byte $4D ; | X  XX X| $FB75
    .byte $4F ; | X  XXXX| $FB76
    .byte $4F ; | X  XXXX| $FB77
    .byte $2F ; |  X XXXX| $FB78
    .byte $2F ; |  X XXXX| $FB79
    .byte $2F ; |  X XXXX| $FB7A
    .byte $00 ; |        | $FB7B
    .byte $81 ; |X      X| $FB7C
    .byte $75 ; | XXX X X| $FB7D
    .byte $65 ; | XX  X X| $FB7E
    .byte $55 ; | X X X X| $FB7F
    .byte $3D ; |  XXXX X| $FB80
    .byte $2D ; |  X XX X| $FB81
    .byte $21 ; |  X    X| $FB82
    .byte $15 ; |   X X X| $FB83
    .byte $00 ; |        | $FB84
    .byte $81 ; |X      X| $FB85
    .byte $75 ; | XXX X X| $FB86
    .byte $65 ; | XX  X X| $FB87
    .byte $65 ; | XX  X X| $FB88
    .byte $65 ; | XX  X X| $FB89
    .byte $49 ; | X  X  X| $FB8A
    .byte $39 ; |  XXX  X| $FB8B
    .byte $21 ; |  X    X| $FB8C
    .byte $21 ; |  X    X| $FB8D
    .byte $21 ; |  X    X| $FB8E
    .byte $31 ; |  XX   X| $FB8F
    .byte $4D ; | X  XX X| $FB90
    .byte $00 ; |        | $FB91
    .byte $FF ; |XXXXXXXX| $FB92
    .byte $FF ; |XXXXXXXX| $FB93
    .byte $00 ; |        | $FB94
    .byte $00 ; |        | $FB95
    .byte $FF ; |XXXXXXXX| $FB96
    .byte $FF ; |XXXXXXXX| $FB97
    .byte $00 ; |        | $FB98
    .byte $00 ; |        | $FB99
    .byte $FF ; |XXXXXXXX| $FB9A
    .byte $FF ; |XXXXXXXX| $FB9B
    .byte $00 ; |        | $FB9C
    .byte $00 ; |        | $FB9D
    .byte $FF ; |XXXXXXXX| $FB9E
    .byte $FF ; |XXXXXXXX| $FB9F
    .byte $00 ; |        | $FBA0
    .byte $00 ; |        | $FBA1
    .byte $FF ; |XXXXXXXX| $FBA2
    .byte $FF ; |XXXXXXXX| $FBA3
    .byte $00 ; |        | $FBA4
    .byte $00 ; |        | $FBA5
    .byte $FF ; |XXXXXXXX| $FBA6
    .byte $FF ; |XXXXXXXX| $FBA7
    .byte $00 ; |        | $FBA8
    .byte $00 ; |        | $FBA9
    .byte $FF ; |XXXXXXXX| $FBAA
    .byte $FF ; |XXXXXXXX| $FBAB
    .byte $00 ; |        | $FBAC
    .byte $00 ; |        | $FBAD
    .byte $FF ; |XXXXXXXX| $FBAE
    .byte $FF ; |XXXXXXXX| $FBAF
    .byte $00 ; |        | $FBB0
    .byte $00 ; |        | $FBB1
    .byte $FF ; |XXXXXXXX| $FBB2
    .byte $FF ; |XXXXXXXX| $FBB3
    .byte $00 ; |        | $FBB4
    .byte $00 ; |        | $FBB5
    .byte $FF ; |XXXXXXXX| $FBB6
    .byte $FF ; |XXXXXXXX| $FBB7
    .byte $00 ; |        | $FBB8
    .byte $00 ; |        | $FBB9
    .byte $FF ; |XXXXXXXX| $FBBA
    .byte $FF ; |XXXXXXXX| $FBBB
    .byte $00 ; |        | $FBBC
    .byte $00 ; |        | $FBBD
    .byte $FF ; |XXXXXXXX| $FBBE
    .byte $FF ; |XXXXXXXX| $FBBF
    .byte $00 ; |        | $FBC0
    .byte $00 ; |        | $FBC1
    .byte $FF ; |XXXXXXXX| $FBC2
    .byte $FF ; |XXXXXXXX| $FBC3
    .byte $00 ; |        | $FBC4
    .byte $00 ; |        | $FBC5
    .byte $FF ; |XXXXXXXX| $FBC6
    .byte $FF ; |XXXXXXXX| $FBC7
    .byte $00 ; |        | $FBC8
    .byte $00 ; |        | $FBC9
    .byte $FF ; |XXXXXXXX| $FBCA
    .byte $FF ; |XXXXXXXX| $FBCB
    .byte $00 ; |        | $FBCC
    .byte $00 ; |        | $FBCD
    .byte $FF ; |XXXXXXXX| $FBCE
    .byte $FF ; |XXXXXXXX| $FBCF
    .byte $00 ; |        | $FBD0
    .byte $00 ; |        | $FBD1
    .byte $FF ; |XXXXXXXX| $FBD2
    .byte $FF ; |XXXXXXXX| $FBD3
    .byte $00 ; |        | $FBD4
    .byte $00 ; |        | $FBD5
    .byte $FF ; |XXXXXXXX| $FBD6
    .byte $FF ; |XXXXXXXX| $FBD7
    .byte $00 ; |        | $FBD8
    .byte $00 ; |        | $FBD9
    .byte $FF ; |XXXXXXXX| $FBDA
    .byte $FF ; |XXXXXXXX| $FBDB
    .byte $00 ; |        | $FBDC
    .byte $00 ; |        | $FBDD
    .byte $FF ; |XXXXXXXX| $FBDE
    .byte $FF ; |XXXXXXXX| $FBDF
    .byte $00 ; |        | $FBE0
    .byte $00 ; |        | $FBE1
    .byte $FF ; |XXXXXXXX| $FBE2
    .byte $FF ; |XXXXXXXX| $FBE3
    .byte $00 ; |        | $FBE4
    .byte $00 ; |        | $FBE5
    .byte $FF ; |XXXXXXXX| $FBE6
    .byte $FF ; |XXXXXXXX| $FBE7
    .byte $00 ; |        | $FBE8
    .byte $00 ; |        | $FBE9
    .byte $FF ; |XXXXXXXX| $FBEA
    .byte $FF ; |XXXXXXXX| $FBEB
    .byte $00 ; |        | $FBEC
    .byte $00 ; |        | $FBED
    .byte $FF ; |XXXXXXXX| $FBEE
    .byte $FF ; |XXXXXXXX| $FBEF
    .byte $00 ; |        | $FBF0
    .byte $00 ; |        | $FBF1
    .byte $FF ; |XXXXXXXX| $FBF2
    .byte $FF ; |XXXXXXXX| $FBF3
    .byte $00 ; |        | $FBF4
    .byte $00 ; |        | $FBF5
    .byte $FF ; |XXXXXXXX| $FBF6
    .byte $FF ; |XXXXXXXX| $FBF7
    .byte $00 ; |        | $FBF8
    .byte $00 ; |        | $FBF9
    .byte $FF ; |XXXXXXXX| $FBFA
    .byte $FF ; |XXXXXXXX| $FBFB
    .byte $00 ; |        | $FBFC
    .byte $00 ; |        | $FBFD
    .byte $FF ; |XXXXXXXX| $FBFE
    .byte $FF ; |XXXXXXXX| $FBFF
LFC00:
    .byte $7C ; | XXXXX  | $FC00
    .byte $7C ; | XXXXX  | $FC01
    .byte $85 ; |X    X X| $FC02
LFC03:
    .byte $FB ; |XXXXX XX| $FC03
    .byte $FB ; |XXXXX XX| $FC04
    .byte $FB ; |XXXXX XX| $FC05
LFC06:
    .byte $21 ; |  X    X| $FC06
    .byte $2C ; |  X XX  | $FC07
    .byte $37 ; |  XX XXX| $FC08
    .byte $42 ; | X    X | $FC09
    .byte $4A ; | X  X X | $FC0A
    .byte $51 ; | X X   X| $FC0B
    .byte $21 ; |  X    X| $FC0C
    .byte $2C ; |  X XX  | $FC0D
    .byte $37 ; |  XX XXX| $FC0E
    .byte $59 ; | X XX  X| $FC0F
    .byte $60 ; | XX     | $FC10
    .byte $67 ; | XX  XXX| $FC11
    .byte $6E ; | XX XXX | $FC12
    .byte $77 ; | XXX XXX| $FC13
    .byte $7F ; | XXXXXXX| $FC14
    .byte $42 ; | X    X | $FC15
    .byte $4A ; | X  X X | $FC16
    .byte $51 ; | X X   X| $FC17
LFC18:
    .byte $37 ; |  XX XXX| $FC18
    .byte $C7 ; |XX   XXX| $FC19
    .byte $58 ; | X XX   | $FC1A
    .byte $E9 ; |XXX X  X| $FC1B
    .byte $67 ; | XX  XXX| $FC1C
    .byte $F7 ; |XXXX XXX| $FC1D
    .byte $89 ; |X   X  X| $FC1E
    .byte $1A ; |   XX X | $FC1F
    .byte $97 ; |X  X XXX| $FC20
    .byte $27 ; |  X  XXX| $FC21
    .byte $B9 ; |X XXX  X| $FC22
    .byte $4B ; | X  X XX| $FC23
    .byte $F9 ; |XXXXX  X| $FC24
    .byte $F9 ; |XXXXX  X| $FC25
    .byte $FA ; |XXXXX X | $FC26
    .byte $FA ; |XXXXX X | $FC27
    .byte $F9 ; |XXXXX  X| $FC28
    .byte $F9 ; |XXXXX  X| $FC29
    .byte $FA ; |XXXXX X | $FC2A
    .byte $FB ; |XXXXX XX| $FC2B
    .byte $F9 ; |XXXXX  X| $FC2C
    .byte $FA ; |XXXXX X | $FC2D
    .byte $FA ; |XXXXX X | $FC2E
    .byte $FB ; |XXXXX XX| $FC2F
LFC30:
    .byte $4C ; | X  XX  | $FC30
LFC31:
    .byte $D4 ; |XX X X  | $FC31
LFC32:
    .byte $7C ; | XXXXX  | $FC32
    .byte $84 ; |X    X  | $FC33
    .byte $8C ; |X   XX  | $FC34
    .byte $94 ; |X  X X  | $FC35
    .byte $9C ; |X  XXX  | $FC36
    .byte $A4 ; |X X  X  | $FC37
    .byte $AC ; |X X XX  | $FC38
    .byte $B4 ; |X XX X  | $FC39
    .byte $BC ; |X XXXX  | $FC3A
    .byte $C4 ; |XX   X  | $FC3B
LFC3C:
    .byte $CC ; |XX  XX  | $FC3C
LFC3D:
    .byte $79 ; | XXXX  X| $FC3D
LFC3E:
    .byte $FD ; |XXXXXX X| $FC3E
LFC3F:
    .byte $00 ; |        | $FC3F
LFC40:
    .byte $FD ; |XXXXXX X| $FC40
LFC41:
    .byte $00 ; |        | $FC41
    .byte $B6 ; |X XX XX | $FC42
    .byte $DA ; |XX XX X | $FC43
    .byte $D5 ; |XX X X X| $FC44
    .byte $B6 ; |X XX XX | $FC45
    .byte $E3 ; |XXX   XX| $FC46
    .byte $FD ; |XXXXXX X| $FC47
    .byte $FD ; |XXXXXX X| $FC48
    .byte $FD ; |XXXXXX X| $FC49
    .byte $FD ; |XXXXXX X| $FC4A
    .byte $FD ; |XXXXXX X| $FC4B
    .byte $00 ; |        | $FC4C
    .byte $00 ; |        | $FC4D
    .byte $00 ; |        | $FC4E
    .byte $00 ; |        | $FC4F
    .byte $00 ; |        | $FC50
    .byte $00 ; |        | $FC51
    .byte $00 ; |        | $FC52
    .byte $00 ; |        | $FC53
    .byte $00 ; |        | $FC54
    .byte $00 ; |        | $FC55
    .byte $00 ; |        | $FC56
    .byte $00 ; |        | $FC57
    .byte $00 ; |        | $FC58
    .byte $00 ; |        | $FC59
    .byte $00 ; |        | $FC5A
    .byte $00 ; |        | $FC5B
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
    .byte $00 ; |        | $FC6C
    .byte $00 ; |        | $FC6D
    .byte $00 ; |        | $FC6E
    .byte $00 ; |        | $FC6F
    .byte $00 ; |        | $FC70
    .byte $00 ; |        | $FC71
    .byte $00 ; |        | $FC72
    .byte $00 ; |        | $FC73
    .byte $00 ; |        | $FC74
    .byte $00 ; |        | $FC75
    .byte $00 ; |        | $FC76
    .byte $00 ; |        | $FC77
    .byte $00 ; |        | $FC78
    .byte $00 ; |        | $FC79
    .byte $00 ; |        | $FC7A
    .byte $00 ; |        | $FC7B
    .byte $3C ; |  XXXX  | $FC7C
    .byte $72 ; | XXX  X | $FC7D
    .byte $72 ; | XXX  X | $FC7E
    .byte $72 ; | XXX  X | $FC7F
    .byte $72 ; | XXX  X | $FC80
    .byte $72 ; | XXX  X | $FC81
    .byte $72 ; | XXX  X | $FC82
    .byte $3C ; |  XXXX  | $FC83
    .byte $18 ; |   XX   | $FC84
    .byte $18 ; |   XX   | $FC85
    .byte $18 ; |   XX   | $FC86
    .byte $18 ; |   XX   | $FC87
    .byte $18 ; |   XX   | $FC88
    .byte $18 ; |   XX   | $FC89
    .byte $18 ; |   XX   | $FC8A
    .byte $38 ; |  XXX   | $FC8B
    .byte $7E ; | XXXXXX | $FC8C
    .byte $46 ; | X   XX | $FC8D
    .byte $40 ; | X      | $FC8E
    .byte $3C ; |  XXXX  | $FC8F
    .byte $0E ; |    XXX | $FC90
    .byte $0E ; |    XXX | $FC91
    .byte $4E ; | X  XXX | $FC92
    .byte $3C ; |  XXXX  | $FC93
    .byte $3E ; |  XXXXX | $FC94
    .byte $4E ; | X  XXX | $FC95
    .byte $0E ; |    XXX | $FC96
    .byte $1C ; |   XXX  | $FC97
    .byte $1C ; |   XXX  | $FC98
    .byte $0E ; |    XXX | $FC99
    .byte $4E ; | X  XXX | $FC9A
    .byte $3C ; |  XXXX  | $FC9B
    .byte $0C ; |    XX  | $FC9C
    .byte $0C ; |    XX  | $FC9D
    .byte $7E ; | XXXXXX | $FC9E
    .byte $4C ; | X  XX  | $FC9F
    .byte $4C ; | X  XX  | $FCA0
    .byte $4C ; | X  XX  | $FCA1
    .byte $4C ; | X  XX  | $FCA2
    .byte $4C ; | X  XX  | $FCA3
    .byte $7C ; | XXXXX  | $FCA4
    .byte $4E ; | X  XXX | $FCA5
    .byte $0E ; |    XXX | $FCA6
    .byte $0E ; |    XXX | $FCA7
    .byte $7C ; | XXXXX  | $FCA8
    .byte $40 ; | X      | $FCA9
    .byte $40 ; | X      | $FCAA
    .byte $7E ; | XXXXXX | $FCAB
    .byte $3C ; |  XXXX  | $FCAC
    .byte $4E ; | X  XXX | $FCAD
    .byte $4E ; | X  XXX | $FCAE
    .byte $4E ; | X  XXX | $FCAF
    .byte $7C ; | XXXXX  | $FCB0
    .byte $40 ; | X      | $FCB1
    .byte $42 ; | X    X | $FCB2
    .byte $3C ; |  XXXX  | $FCB3
    .byte $18 ; |   XX   | $FCB4
    .byte $18 ; |   XX   | $FCB5
    .byte $0C ; |    XX  | $FCB6
    .byte $0C ; |    XX  | $FCB7
    .byte $06 ; |     XX | $FCB8
    .byte $06 ; |     XX | $FCB9
    .byte $46 ; | X   XX | $FCBA
    .byte $7E ; | XXXXXX | $FCBB
    .byte $3C ; |  XXXX  | $FCBC
    .byte $4E ; | X  XXX | $FCBD
    .byte $4E ; | X  XXX | $FCBE
    .byte $3C ; |  XXXX  | $FCBF
    .byte $3C ; |  XXXX  | $FCC0
    .byte $72 ; | XXX  X | $FCC1
    .byte $72 ; | XXX  X | $FCC2
    .byte $3C ; |  XXXX  | $FCC3
    .byte $3C ; |  XXXX  | $FCC4
    .byte $42 ; | X    X | $FCC5
    .byte $02 ; |      X | $FCC6
    .byte $3E ; |  XXXXX | $FCC7
    .byte $72 ; | XXX  X | $FCC8
    .byte $72 ; | XXX  X | $FCC9
    .byte $72 ; | XXX  X | $FCCA
    .byte $3C ; |  XXXX  | $FCCB
    .byte $00 ; |        | $FCCC
    .byte $00 ; |        | $FCCD
    .byte $00 ; |        | $FCCE
    .byte $00 ; |        | $FCCF
    .byte $00 ; |        | $FCD0
    .byte $00 ; |        | $FCD1
    .byte $00 ; |        | $FCD2
    .byte $00 ; |        | $FCD3
    .byte $00 ; |        | $FCD4
    .byte $4A ; | X  X X | $FCD5
    .byte $1C ; |   XXX  | $FCD6
    .byte $28 ; |  X X   | $FCD7
    .byte $28 ; |  X X   | $FCD8
    .byte $3C ; |  XXXX  | $FCD9
    .byte $3C ; |  XXXX  | $FCDA
    .byte $24 ; |  X  X  | $FCDB
    .byte $81 ; |X      X| $FCDC
    .byte $66 ; | XX  XX | $FCDD
    .byte $7E ; | XXXXXX | $FCDE
    .byte $3C ; |  XXXX  | $FCDF
    .byte $3C ; |  XXXX  | $FCE0
    .byte $7E ; | XXXXXX | $FCE1
    .byte $66 ; | XX  XX | $FCE2
    .byte $81 ; |X      X| $FCE3
    .byte $00 ; |        | $FCE4
    .byte $81 ; |X      X| $FCE5
    .byte $24 ; |  X  X  | $FCE6
    .byte $42 ; | X    X | $FCE7
    .byte $18 ; |   XX   | $FCE8
    .byte $18 ; |   XX   | $FCE9
    .byte $42 ; | X    X | $FCEA
    .byte $24 ; |  X  X  | $FCEB
    .byte $81 ; |X      X| $FCEC
    .byte $00 ; |        | $FCED
    .byte $24 ; |  X  X  | $FCEE
    .byte $81 ; |X      X| $FCEF
    .byte $42 ; | X    X | $FCF0
    .byte $81 ; |X      X| $FCF1
    .byte $81 ; |X      X| $FCF2
    .byte $42 ; | X    X | $FCF3
    .byte $81 ; |X      X| $FCF4
    .byte $24 ; |  X  X  | $FCF5
    .byte $00 ; |        | $FCF6
    .byte $00 ; |        | $FCF7
    .byte $00 ; |        | $FCF8
    .byte $00 ; |        | $FCF9
    .byte $FF ; |XXXXXXXX| $FCFA
    .byte $FF ; |XXXXXXXX| $FCFB
    .byte $00 ; |        | $FCFC
    .byte $00 ; |        | $FCFD
    .byte $FF ; |XXXXXXXX| $FCFE
    .byte $FF ; |XXXXXXXX| $FCFF
    .byte $11 ; |   X   X| $FD00
    .byte $15 ; |   X X X| $FD01
    .byte $13 ; |   X  XX| $FD02
    .byte $15 ; |   X X X| $FD03
    .byte $11 ; |   X   X| $FD04
    .byte $15 ; |   X X X| $FD05
    .byte $13 ; |   X  XX| $FD06
    .byte $15 ; |   X X X| $FD07
    .byte $11 ; |   X   X| $FD08
    .byte $16 ; |   X XX | $FD09
    .byte $14 ; |   X X  | $FD0A
    .byte $16 ; |   X XX | $FD0B
    .byte $11 ; |   X   X| $FD0C
    .byte $15 ; |   X X X| $FD0D
    .byte $13 ; |   X  XX| $FD0E
    .byte $15 ; |   X X X| $FD0F
    .byte $11 ; |   X   X| $FD10
    .byte $15 ; |   X X X| $FD11
    .byte $13 ; |   X  XX| $FD12
    .byte $15 ; |   X X X| $FD13
    .byte $11 ; |   X   X| $FD14
    .byte $15 ; |   X X X| $FD15
    .byte $13 ; |   X  XX| $FD16
    .byte $15 ; |   X X X| $FD17
    .byte $11 ; |   X   X| $FD18
    .byte $16 ; |   X XX | $FD19
    .byte $14 ; |   X X  | $FD1A
    .byte $16 ; |   X XX | $FD1B
    .byte $11 ; |   X   X| $FD1C
    .byte $15 ; |   X X X| $FD1D
    .byte $13 ; |   X  XX| $FD1E
    .byte $15 ; |   X X X| $FD1F
    .byte $11 ; |   X   X| $FD20
    .byte $15 ; |   X X X| $FD21
    .byte $13 ; |   X  XX| $FD22
    .byte $15 ; |   X X X| $FD23
    .byte $11 ; |   X   X| $FD24
    .byte $15 ; |   X X X| $FD25
    .byte $13 ; |   X  XX| $FD26
    .byte $15 ; |   X X X| $FD27
    .byte $11 ; |   X   X| $FD28
    .byte $16 ; |   X XX | $FD29
    .byte $14 ; |   X X  | $FD2A
    .byte $16 ; |   X XX | $FD2B
    .byte $11 ; |   X   X| $FD2C
    .byte $15 ; |   X X X| $FD2D
    .byte $13 ; |   X  XX| $FD2E
    .byte $15 ; |   X X X| $FD2F
    .byte $11 ; |   X   X| $FD30
    .byte $15 ; |   X X X| $FD31
    .byte $13 ; |   X  XX| $FD32
    .byte $15 ; |   X X X| $FD33
    .byte $11 ; |   X   X| $FD34
    .byte $15 ; |   X X X| $FD35
    .byte $13 ; |   X  XX| $FD36
    .byte $15 ; |   X X X| $FD37
    .byte $14 ; |   X X  | $FD38
    .byte $13 ; |   X  XX| $FD39
    .byte $22 ; |  X   X | $FD3A
    .byte $41 ; | X     X| $FD3B
    .byte $11 ; |   X   X| $FD3C
    .byte $15 ; |   X X X| $FD3D
    .byte $13 ; |   X  XX| $FD3E
    .byte $15 ; |   X X X| $FD3F
    .byte $11 ; |   X   X| $FD40
    .byte $15 ; |   X X X| $FD41
    .byte $13 ; |   X  XX| $FD42
    .byte $15 ; |   X X X| $FD43
    .byte $11 ; |   X   X| $FD44
    .byte $16 ; |   X XX | $FD45
    .byte $14 ; |   X X  | $FD46
    .byte $16 ; |   X XX | $FD47
    .byte $11 ; |   X   X| $FD48
    .byte $15 ; |   X X X| $FD49
    .byte $13 ; |   X  XX| $FD4A
    .byte $15 ; |   X X X| $FD4B
    .byte $11 ; |   X   X| $FD4C
    .byte $15 ; |   X X X| $FD4D
    .byte $13 ; |   X  XX| $FD4E
    .byte $15 ; |   X X X| $FD4F
    .byte $11 ; |   X   X| $FD50
    .byte $15 ; |   X X X| $FD51
    .byte $13 ; |   X  XX| $FD52
    .byte $15 ; |   X X X| $FD53
    .byte $11 ; |   X   X| $FD54
    .byte $16 ; |   X XX | $FD55
    .byte $14 ; |   X X  | $FD56
    .byte $16 ; |   X XX | $FD57
    .byte $11 ; |   X   X| $FD58
    .byte $15 ; |   X X X| $FD59
    .byte $13 ; |   X  XX| $FD5A
    .byte $15 ; |   X X X| $FD5B
    .byte $11 ; |   X   X| $FD5C
    .byte $15 ; |   X X X| $FD5D
    .byte $13 ; |   X  XX| $FD5E
    .byte $15 ; |   X X X| $FD5F
    .byte $11 ; |   X   X| $FD60
    .byte $15 ; |   X X X| $FD61
    .byte $13 ; |   X  XX| $FD62
    .byte $15 ; |   X X X| $FD63
    .byte $11 ; |   X   X| $FD64
    .byte $16 ; |   X XX | $FD65
    .byte $14 ; |   X X  | $FD66
    .byte $16 ; |   X XX | $FD67
    .byte $11 ; |   X   X| $FD68
    .byte $15 ; |   X X X| $FD69
    .byte $13 ; |   X  XX| $FD6A
    .byte $15 ; |   X X X| $FD6B
    .byte $11 ; |   X   X| $FD6C
    .byte $15 ; |   X X X| $FD6D
    .byte $13 ; |   X  XX| $FD6E
    .byte $15 ; |   X X X| $FD6F
    .byte $11 ; |   X   X| $FD70
    .byte $15 ; |   X X X| $FD71
    .byte $13 ; |   X  XX| $FD72
    .byte $15 ; |   X X X| $FD73
    .byte $14 ; |   X X  | $FD74
    .byte $13 ; |   X  XX| $FD75
    .byte $22 ; |  X   X | $FD76
    .byte $41 ; | X     X| $FD77
    .byte $00 ; |        | $FD78
    .byte $21 ; |  X    X| $FD79
    .byte $21 ; |  X    X| $FD7A
    .byte $21 ; |  X    X| $FD7B
    .byte $21 ; |  X    X| $FD7C
    .byte $21 ; |  X    X| $FD7D
    .byte $26 ; |  X  XX | $FD7E
    .byte $25 ; |  X  X X| $FD7F
    .byte $23 ; |  X   XX| $FD80
    .byte $21 ; |  X    X| $FD81
    .byte $21 ; |  X    X| $FD82
    .byte $21 ; |  X    X| $FD83
    .byte $21 ; |  X    X| $FD84
    .byte $21 ; |  X    X| $FD85
    .byte $26 ; |  X  XX | $FD86
    .byte $45 ; | X   X X| $FD87
    .byte $28 ; |  X X   | $FD88
    .byte $28 ; |  X X   | $FD89
    .byte $27 ; |  X  XXX| $FD8A
    .byte $25 ; |  X  X X| $FD8B
    .byte $26 ; |  X  XX | $FD8C
    .byte $26 ; |  X  XX | $FD8D
    .byte $25 ; |  X  X X| $FD8E
    .byte $23 ; |  X   XX| $FD8F
    .byte $21 ; |  X    X| $FD90
    .byte $22 ; |  X   X | $FD91
    .byte $23 ; |  X   XX| $FD92
    .byte $21 ; |  X    X| $FD93
    .byte $26 ; |  X  XX | $FD94
    .byte $27 ; |  X  XXX| $FD95
    .byte $48 ; | X  X   | $FD96
    .byte $31 ; |  XX   X| $FD97
    .byte $11 ; |   X   X| $FD98
    .byte $31 ; |  XX   X| $FD99
    .byte $11 ; |   X   X| $FD9A
    .byte $31 ; |  XX   X| $FD9B
    .byte $16 ; |   X XX | $FD9C
    .byte $35 ; |  XX X X| $FD9D
    .byte $13 ; |   X  XX| $FD9E
    .byte $31 ; |  XX   X| $FD9F
    .byte $11 ; |   X   X| $FDA0
    .byte $31 ; |  XX   X| $FDA1
    .byte $11 ; |   X   X| $FDA2
    .byte $31 ; |  XX   X| $FDA3
    .byte $16 ; |   X XX | $FDA4
    .byte $45 ; | X   X X| $FDA5
    .byte $38 ; |  XXX   | $FDA6
    .byte $18 ; |   XX   | $FDA7
    .byte $37 ; |  XX XXX| $FDA8
    .byte $15 ; |   X X X| $FDA9
    .byte $36 ; |  XX XX | $FDAA
    .byte $16 ; |   X XX | $FDAB
    .byte $35 ; |  XX X X| $FDAC
    .byte $13 ; |   X  XX| $FDAD
    .byte $31 ; |  XX   X| $FDAE
    .byte $12 ; |   X  X | $FDAF
    .byte $33 ; |  XX  XX| $FDB0
    .byte $11 ; |   X   X| $FDB1
    .byte $36 ; |  XX XX | $FDB2
    .byte $17 ; |   X XXX| $FDB3
    .byte $48 ; | X  X   | $FDB4
    .byte $00 ; |        | $FDB5
    .byte $81 ; |X      X| $FDB6
    .byte $F5 ; |XXXX X X| $FDB7
    .byte $82 ; |X     X | $FDB8
    .byte $F7 ; |XXXX XXX| $FDB9
    .byte $83 ; |X     XX| $FDBA
    .byte $F7 ; |XXXX XXX| $FDBB
    .byte $85 ; |X    X X| $FDBC
    .byte $F7 ; |XXXX XXX| $FDBD
    .byte $86 ; |X    XX | $FDBE
    .byte $F7 ; |XXXX XXX| $FDBF
    .byte $85 ; |X    X X| $FDC0
    .byte $F7 ; |XXXX XXX| $FDC1
    .byte $85 ; |X    X X| $FDC2
    .byte $F7 ; |XXXX XXX| $FDC3
    .byte $86 ; |X    XX | $FDC4
    .byte $F7 ; |XXXX XXX| $FDC5
    .byte $87 ; |X    XXX| $FDC6
    .byte $F7 ; |XXXX XXX| $FDC7
    .byte $86 ; |X    XX | $FDC8
    .byte $F7 ; |XXXX XXX| $FDC9
    .byte $85 ; |X    X X| $FDCA
    .byte $F7 ; |XXXX XXX| $FDCB
    .byte $84 ; |X    X  | $FDCC
    .byte $F7 ; |XXXX XXX| $FDCD
    .byte $83 ; |X     XX| $FDCE
    .byte $F7 ; |XXXX XXX| $FDCF
    .byte $82 ; |X     X | $FDD0
    .byte $F7 ; |XXXX XXX| $FDD1
    .byte $81 ; |X      X| $FDD2
    .byte $F7 ; |XXXX XXX| $FDD3
    .byte $00 ; |        | $FDD4
    .byte $1F ; |   XXXXX| $FDD5
    .byte $8F ; |X   XXXX| $FDD6
    .byte $1F ; |   XXXXX| $FDD7
    .byte $8D ; |X   XX X| $FDD8
    .byte $00 ; |        | $FDD9
    .byte $1F ; |   XXXXX| $FDDA
    .byte $FF ; |XXXXXXXX| $FDDB
    .byte $CA ; |XX  X X | $FDDC
    .byte $C9 ; |XX  X  X| $FDDD
    .byte $CA ; |XX  X X | $FDDE
    .byte $C8 ; |XX  X   | $FDDF
    .byte $CA ; |XX  X X | $FDE0
    .byte $C9 ; |XX  X  X| $FDE1
    .byte $00 ; |        | $FDE2
    .byte $1F ; |   XXXXX| $FDE3
    .byte $FE ; |XXXXXXX | $FDE4
    .byte $1F ; |   XXXXX| $FDE5
    .byte $FC ; |XXXXXX  | $FDE6
    .byte $1C ; |   XXX  | $FDE7
    .byte $FA ; |XXXXX X | $FDE8
    .byte $1C ; |   XXX  | $FDE9
    .byte $F8 ; |XXXXX   | $FDEA
    .byte $1A ; |   XX X | $FDEB
    .byte $FE ; |XXXXXXX | $FDEC
    .byte $1A ; |   XX X | $FDED
    .byte $FC ; |XXXXXX  | $FDEE
    .byte $17 ; |   X XXX| $FDEF
    .byte $FA ; |XXXXX X | $FDF0
    .byte $17 ; |   X XXX| $FDF1
    .byte $F8 ; |XXXXX   | $FDF2
    .byte $14 ; |   X X  | $FDF3
    .byte $FE ; |XXXXXXX | $FDF4
    .byte $14 ; |   X X  | $FDF5
    .byte $FC ; |XXXXXX  | $FDF6
    .byte $12 ; |   X  X | $FDF7
    .byte $FA ; |XXXXX X | $FDF8
    .byte $12 ; |   X  X | $FDF9
    .byte $F8 ; |XXXXX   | $FDFA
    .byte $00 ; |        | $FDFB
LFDFC:
    .byte $00 ; |        | $FDFC
    .byte $0C ; |    XX  | $FDFD
    .byte $0C ; |    XX  | $FDFE
    .byte $0F ; |    XXXX| $FDFF
    .byte $0F ; |    XXXX| $FE00
    .byte $0C ; |    XX  | $FE01
    .byte $0C ; |    XX  | $FE02
    .byte $00 ; |        | $FE03
    .byte $00 ; |        | $FE04
    .byte $02 ; |      X | $FE05
    .byte $02 ; |      X | $FE06
    .byte $06 ; |     XX | $FE07
    .byte $0C ; |    XX  | $FE08
    .byte $0C ; |    XX  | $FE09
    .byte $06 ; |     XX | $FE0A
    .byte $02 ; |      X | $FE0B
    .byte $00 ; |        | $FE0C
    .byte $00 ; |        | $FE0D
    .byte $0C ; |    XX  | $FE0E
    .byte $0C ; |    XX  | $FE0F
    .byte $0F ; |    XXXX| $FE10
    .byte $0F ; |    XXXX| $FE11
    .byte $0C ; |    XX  | $FE12
    .byte $0C ; |    XX  | $FE13
    .byte $00 ; |        | $FE14
    .byte $00 ; |        | $FE15
    .byte $02 ; |      X | $FE16
    .byte $02 ; |      X | $FE17
    .byte $06 ; |     XX | $FE18
    .byte $0C ; |    XX  | $FE19
    .byte $0C ; |    XX  | $FE1A
    .byte $06 ; |     XX | $FE1B
    .byte $02 ; |      X | $FE1C
    .byte $00 ; |        | $FE1D
    .byte $A4 ; |X X  X  | $FE1E
    .byte $AA ; |X X X X | $FE1F
    .byte $00 ; |        | $FE20
    .byte $18 ; |   XX   | $FE21
    .byte $38 ; |  XXX   | $FE22
    .byte $6C ; | XX XX  | $FE23
    .byte $8E ; |X   XXX | $FE24
    .byte $1B ; |   XX XX| $FE25
    .byte $19 ; |   XX  X| $FE26
    .byte $28 ; |  X X   | $FE27
    .byte $28 ; |  X X   | $FE28
    .byte $48 ; | X  X   | $FE29
    .byte $08 ; |    X   | $FE2A
    .byte $00 ; |        | $FE2B
    .byte $18 ; |   XX   | $FE2C
    .byte $3C ; |  XXXX  | $FE2D
    .byte $76 ; | XXX XX | $FE2E
    .byte $51 ; | X X   X| $FE2F
    .byte $98 ; |X  XX   | $FE30
    .byte $18 ; |   XX   | $FE31
    .byte $14 ; |   X X  | $FE32
    .byte $12 ; |   X  X | $FE33
    .byte $10 ; |   X    | $FE34
    .byte $10 ; |   X    | $FE35
    .byte $00 ; |        | $FE36
    .byte $5D ; | X XXX X| $FE37
    .byte $58 ; | X XX   | $FE38
    .byte $5B ; | X XX XX| $FE39
    .byte $5B ; | X XX XX| $FE3A
    .byte $5B ; | X XX XX| $FE3B
    .byte $58 ; | X XX   | $FE3C
    .byte $5B ; | X XX XX| $FE3D
    .byte $5B ; | X XX XX| $FE3E
    .byte $58 ; | X XX   | $FE3F
    .byte $5B ; | X XX XX| $FE40
    .byte $00 ; |        | $FE41
    .byte $01 ; |       X| $FE42
    .byte $0D ; |    XX X| $FE43
    .byte $5E ; | X XXXX | $FE44
    .byte $7E ; | XXXXXX | $FE45
    .byte $FE ; |XXXXXXX | $FE46
    .byte $37 ; |  XX XXX| $FE47
    .byte $51 ; | X X   X| $FE48
    .byte $00 ; |        | $FE49
    .byte $0C ; |    XX  | $FE4A
    .byte $5F ; | X XXXXX| $FE4B
    .byte $7E ; | XXXXXX | $FE4C
    .byte $FE ; |XXXXXXX | $FE4D
    .byte $26 ; |  X  XX | $FE4E
    .byte $2C ; |  X XX  | $FE4F
    .byte $00 ; |        | $FE50
    .byte $12 ; |   X  X | $FE51
    .byte $34 ; |  XX X  | $FE52
    .byte $56 ; | X X XX | $FE53
    .byte $78 ; | XXXX   | $FE54
    .byte $9A ; |X  XX X | $FE55
    .byte $BC ; |X XXXX  | $FE56
    .byte $DE ; |XX XXXX | $FE57
    .byte $00 ; |        | $FE58
    .byte $3C ; |  XXXX  | $FE59
    .byte $DF ; |XX XXXXX| $FE5A
    .byte $FE ; |XXXXXXX | $FE5B
    .byte $7E ; | XXXXXX | $FE5C
    .byte $33 ; |  XX  XX| $FE5D
    .byte $55 ; | X X X X| $FE5E
    .byte $00 ; |        | $FE5F
    .byte $3C ; |  XXXX  | $FE60
    .byte $5F ; | X XXXXX| $FE61
    .byte $FE ; |XXXXXXX | $FE62
    .byte $FE ; |XXXXXXX | $FE63
    .byte $36 ; |  XX XX | $FE64
    .byte $22 ; |  X   X | $FE65
    .byte $00 ; |        | $FE66
    .byte $92 ; |X  X  X | $FE67
    .byte $82 ; |X     X | $FE68
    .byte $72 ; | XXX  X | $FE69
    .byte $62 ; | XX   X | $FE6A
    .byte $51 ; | X X   X| $FE6B
    .byte $42 ; | X    X | $FE6C
    .byte $00 ; |        | $FE6D
    .byte $21 ; |  X    X| $FE6E
    .byte $E1 ; |XXX    X| $FE6F
    .byte $42 ; | X    X | $FE70
    .byte $FC ; |XXXXXX  | $FE71
    .byte $3E ; |  XXXXX | $FE72
    .byte $26 ; |  X  XX | $FE73
    .byte $4B ; | X  X XX| $FE74
    .byte $A9 ; |X X X  X| $FE75
    .byte $00 ; |        | $FE76
    .byte $E0 ; |XXX     | $FE77
    .byte $C3 ; |XX    XX| $FE78
    .byte $3C ; |  XXXX  | $FE79
    .byte $3C ; |  XXXX  | $FE7A
    .byte $24 ; |  X  X  | $FE7B
    .byte $22 ; |  X   X | $FE7C
    .byte $42 ; | X    X | $FE7D
    .byte $00 ; |        | $FE7E
    .byte $22 ; |  X   X | $FE7F
    .byte $32 ; |  XX  X | $FE80
    .byte $42 ; | X    X | $FE81
    .byte $52 ; | X X  X | $FE82
    .byte $62 ; | XX   X | $FE83
    .byte $72 ; | XXX  X | $FE84
    .byte $82 ; |X     X | $FE85
    .byte $92 ; |X  X  X | $FE86
    .byte $00 ; |        | $FE87
LFE88:
    .byte $1C ; |   XXX  | $FE88
    .byte $1A ; |   XX X | $FE89
    .byte $17 ; |   X XXX| $FE8A
    .byte $14 ; |   X X  | $FE8B
    .byte $13 ; |   X  XX| $FE8C
    .byte $11 ; |   X   X| $FE8D
    .byte $0F ; |    XXXX| $FE8E
    .byte $0D ; |    XX X| $FE8F
    .byte $0C ; |    XX  | $FE90
    .byte $0B ; |    X XX| $FE91
    .byte $0A ; |    X X | $FE92
    .byte $09 ; |    X  X| $FE93
    .byte $08 ; |    X   | $FE94
    .byte $1E ; |   XXXX | $FE95
    .byte $1C ; |   XXX  | $FE96
    .byte $00 ; |        | $FE97
    .byte $33 ; |  XX  XX| $FE98
    .byte $30 ; |  XX    | $FE99
    .byte $33 ; |  XX  XX| $FE9A
    .byte $30 ; |  XX    | $FE9B
    .byte $33 ; |  XX  XX| $FE9C
    .byte $30 ; |  XX    | $FE9D
    .byte $33 ; |  XX  XX| $FE9E
    .byte $30 ; |  XX    | $FE9F
LFEA0:
    .byte $5F ; | X XXXXX| $FEA0
    .byte $8F ; |X   XXXX| $FEA1
    .byte $BF ; |X XXXXXX| $FEA2
    .byte $CF ; |XX  XXXX| $FEA3
    .byte $01 ; |       X| $FEA4
    .byte $05 ; |     X X| $FEA5
    .byte $0C ; |    XX  | $FEA6
    .byte $01 ; |       X| $FEA7
    .byte $05 ; |     X X| $FEA8
    .byte $0C ; |    XX  | $FEA9
    .byte $DC ; |XX XXX  | $FEAA
    .byte $E5 ; |XXX  X X| $FEAB
    .byte $EE ; |XXX XXX | $FEAC
    .byte $F7 ; |XXXX XXX| $FEAD
    .byte $F7 ; |XXXX XXX| $FEAE
    .byte $FC ; |XXXXXX  | $FEAF
    .byte $FC ; |XXXXXX  | $FEB0
    .byte $FC ; |XXXXXX  | $FEB1
    .byte $FC ; |XXXXXX  | $FEB2
    .byte $FC ; |XXXXXX  | $FEB3
LFEB4:
    .byte $24 ; |  X  X  | $FEB4
    .byte $3C ; |  XXXX  | $FEB5
    .byte $3C ; |  XXXX  | $FEB6
    .byte $28 ; |  X X   | $FEB7
    .byte $28 ; |  X X   | $FEB8
    .byte $1C ; |   XXX  | $FEB9
    .byte $4A ; | X  X X | $FEBA
    .byte $7F ; | XXXXXXX| $FEBB
    .byte $FF ; |XXXXXXXX| $FEBC
    .byte $FD ; |XXXXXX X| $FEBD
    .byte $BD ; |X XXXX X| $FEBE
    .byte $BC ; |X XXXX  | $FEBF
    .byte $3C ; |  XXXX  | $FEC0
    .byte $3E ; |  XXXXX | $FEC1
    .byte $36 ; |  XX XX | $FEC2
    .byte $36 ; |  XX XX | $FEC3
    .byte $13 ; |   X  XX| $FEC4
    .byte $00 ; |        | $FEC5
    .byte $24 ; |  X  X  | $FEC6
    .byte $3C ; |  XXXX  | $FEC7
    .byte $3C ; |  XXXX  | $FEC8
    .byte $28 ; |  X X   | $FEC9
    .byte $28 ; |  X X   | $FECA
    .byte $1C ; |   XXX  | $FECB
    .byte $4A ; | X  X X | $FECC
    .byte $F7 ; |XXXX XXX| $FECD
    .byte $FF ; |XXXXXXXX| $FECE
    .byte $FD ; |XXXXXX X| $FECF
    .byte $BD ; |X XXXX X| $FED0
    .byte $3D ; |  XXXX X| $FED1
    .byte $3C ; |  XXXX  | $FED2
    .byte $3E ; |  XXXXX | $FED3
    .byte $36 ; |  XX XX | $FED4
    .byte $36 ; |  XX XX | $FED5
    .byte $62 ; | XX   X | $FED6
    .byte $00 ; |        | $FED7

LFED8:
    lda    ram_80                ; 3
    beq    LFEFA                 ; 2³
    cmp    #$30                  ; 2
    beq    LFF03                 ; 2³+1
    cmp    #$20                  ; 2
    beq    LFF07                 ; 2³+1
    bcs    LFF12                 ; 2³+1
    cmp    #$10                  ; 2
    beq    LFF24                 ; 2³+1
    bcs    LFF2F                 ; 2³+1
    lda    #$00                  ; 2
    sta    ram_85                ; 3
    sta    ram_86                ; 3
    ldx    ram_80                ; 3
    lda    LFF75,X               ; 4
    sta    ram_84                ; 3
    rts                          ; 6

LFEFA:
    lda    #$00                  ; 2
LFEFC:
    sta    ram_84                ; 3
    sta    ram_85                ; 3
    sta    ram_86                ; 3
    rts                          ; 6

LFF03:
    lda    #$88                  ; 2
    bne    LFEFC                 ; 3+1   always branch

LFF07:
    lda    #$88                  ; 2
    sta    ram_84                ; 3
    sta    ram_85                ; 3
    lda    #$00                  ; 2
    sta    ram_86                ; 3
    rts                          ; 6

LFF12:
    lda    #$88                  ; 2
    sta    ram_84                ; 3
    sta    ram_85                ; 3
    sec                          ; 2
    lda    ram_80                ; 3
    sbc    #$20                  ; 2
    tax                          ; 2
    lda    LFF75,X               ; 4
    sta    ram_86                ; 3
    rts                          ; 6

LFF24:
    lda    #$88                  ; 2
    sta    ram_84                ; 3
    lda    #$00                  ; 2
    sta    ram_85                ; 3
    sta    ram_86                ; 3
    rts                          ; 6

LFF2F:
    lda    #$88                  ; 2
    sta    ram_84                ; 3
    lda    #$00                  ; 2
    sta    ram_86                ; 3
    sec                          ; 2
    lda    ram_80                ; 3
    sbc    #$10                  ; 2
    tax                          ; 2
    lda    LFF75,X               ; 4
    sta    ram_85                ; 3
    rts                          ; 6

LFF43:
    lda.wy ram_A8,Y              ; 4
    and    #$F0                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    stx    ram_BA                ; 3
    tax                          ; 2
    lda    LFFAA,X               ; 4
    ldx    ram_BA                ; 3
    sta    ram_AE,X              ; 4
    lda    #$FF                  ; 2
    sta    ram_AF,X              ; 4
    dex                          ; 2
    dex                          ; 2
    lda.wy ram_A8,Y              ; 4
    and    #$0F                  ; 2
    stx    ram_BA                ; 3
    tax                          ; 2
    lda    LFFAA,X               ; 4
    ldx    ram_BA                ; 3
    sta    ram_AE,X              ; 4
    lda    #$FF                  ; 2
    sta    ram_AF,X              ; 4
    iny                          ; 2
    dex                          ; 2
    dex                          ; 2
    bpl    LFF43                 ; 2³
    rts                          ; 6

LFF75:
    .byte $10 ; |   X    | $FF75
    .byte $10 ; |   X    | $FF76
    .byte $20 ; |  X     | $FF77
    .byte $30 ; |  XX    | $FF78
    .byte $40 ; | X      | $FF79
    .byte $50 ; | X X    | $FF7A
    .byte $60 ; | XX     | $FF7B
    .byte $70 ; | XXX    | $FF7C
    .byte $80 ; |X       | $FF7D
    .byte $81 ; |X      X| $FF7E
    .byte $82 ; |X     X | $FF7F
    .byte $83 ; |X     XX| $FF80
    .byte $84 ; |X    X  | $FF81
    .byte $85 ; |X    X X| $FF82
    .byte $86 ; |X    XX | $FF83
    .byte $87 ; |X    XXX| $FF84
    .byte $88 ; |X   X   | $FF85
    .byte $00 ; |        | $FF86
    .byte $00 ; |        | $FF87
    .byte $00 ; |        | $FF88
    .byte $00 ; |        | $FF89
    .byte $80 ; |X       | $FF8A
    .byte $80 ; |X       | $FF8B
    .byte $80 ; |X       | $FF8C
    .byte $80 ; |X       | $FF8D
    .byte $C0 ; |XX      | $FF8E
    .byte $C0 ; |XX      | $FF8F
    .byte $C0 ; |XX      | $FF90
    .byte $C0 ; |XX      | $FF91
    .byte $E0 ; |XXX     | $FF92
    .byte $E0 ; |XXX     | $FF93
    .byte $E0 ; |XXX     | $FF94
    .byte $E0 ; |XXX     | $FF95
    .byte $F0 ; |XXXX    | $FF96
    .byte $F0 ; |XXXX    | $FF97
    .byte $F0 ; |XXXX    | $FF98
    .byte $F0 ; |XXXX    | $FF99
    .byte $F8 ; |XXXXX   | $FF9A
    .byte $F8 ; |XXXXX   | $FF9B
    .byte $F8 ; |XXXXX   | $FF9C
    .byte $F8 ; |XXXXX   | $FF9D
    .byte $FC ; |XXXXXX  | $FF9E
    .byte $FC ; |XXXXXX  | $FF9F
    .byte $FC ; |XXXXXX  | $FFA0
    .byte $FC ; |XXXXXX  | $FFA1
    .byte $FE ; |XXXXXXX | $FFA2
    .byte $FE ; |XXXXXXX | $FFA3
    .byte $FE ; |XXXXXXX | $FFA4
    .byte $FE ; |XXXXXXX | $FFA5
    .byte $FF ; |XXXXXXXX| $FFA6
    .byte $FF ; |XXXXXXXX| $FFA7
    .byte $FF ; |XXXXXXXX| $FFA8
    .byte $FF ; |XXXXXXXX| $FFA9
LFFAA:
    .byte $86 ; |X    XX | $FFAA
    .byte $8A ; |X   X X | $FFAB
    .byte $8E ; |X   XXX | $FFAC
    .byte $92 ; |X  X  X | $FFAD
    .byte $96 ; |X  X XX | $FFAE
    .byte $9A ; |X  XX X | $FFAF
    .byte $9E ; |X  XXXX | $FFB0
    .byte $A2 ; |X X   X | $FFB1
    .byte $A6 ; |X X  XX | $FFB2

LFFB3:
    clc                          ; 2
    adc    ram_80                ; 3
    cmp    #$30                  ; 2
    bcc    LFFBC                 ; 2³
    lda    #$30                  ; 2
LFFBC:
    sta    ram_80                ; 3
    rts                          ; 6

    .byte $FF ; |XXXXXXXX| $FFBF
    .byte $00 ; |        | $FFC0
    .byte $00 ; |        | $FFC1
    .byte $FF ; |XXXXXXXX| $FFC2
    .byte $FF ; |XXXXXXXX| $FFC3
    .byte $00 ; |        | $FFC4
    .byte $00 ; |        | $FFC5
    .byte $FF ; |XXXXXXXX| $FFC6
    .byte $FF ; |XXXXXXXX| $FFC7
    .byte $00 ; |        | $FFC8
    .byte $00 ; |        | $FFC9
    .byte $FF ; |XXXXXXXX| $FFCA
    .byte $FF ; |XXXXXXXX| $FFCB
    .byte $00 ; |        | $FFCC
    .byte $00 ; |        | $FFCD
    .byte $FF ; |XXXXXXXX| $FFCE
    .byte $FF ; |XXXXXXXX| $FFCF
    .byte $00 ; |        | $FFD0
    .byte $00 ; |        | $FFD1
    .byte $FF ; |XXXXXXXX| $FFD2
    .byte $FF ; |XXXXXXXX| $FFD3
    .byte $00 ; |        | $FFD4
    .byte $00 ; |        | $FFD5
    .byte $FF ; |XXXXXXXX| $FFD6
    .byte $FF ; |XXXXXXXX| $FFD7
    .byte $00 ; |        | $FFD8
    .byte $00 ; |        | $FFD9
    .byte $FF ; |XXXXXXXX| $FFDA
    .byte $FF ; |XXXXXXXX| $FFDB
    .byte $00 ; |        | $FFDC
    .byte $00 ; |        | $FFDD
    .byte $FF ; |XXXXXXXX| $FFDE
    .byte $FF ; |XXXXXXXX| $FFDF
    .byte $00 ; |        | $FFE0
    .byte $00 ; |        | $FFE1
    .byte $FF ; |XXXXXXXX| $FFE2
    .byte $FF ; |XXXXXXXX| $FFE3
    .byte $00 ; |        | $FFE4
    .byte $00 ; |        | $FFE5
    .byte $FF ; |XXXXXXXX| $FFE6
    .byte $FF ; |XXXXXXXX| $FFE7
    .byte $00 ; |        | $FFE8
    .byte $00 ; |        | $FFE9
    .byte $FF ; |XXXXXXXX| $FFEA
    .byte $FF ; |XXXXXXXX| $FFEB
    .byte $00 ; |        | $FFEC
    .byte $00 ; |        | $FFED
    .byte $FF ; |XXXXXXXX| $FFEE
    .byte $FF ; |XXXXXXXX| $FFEF
    .byte $00 ; |        | $FFF0
    .byte $00 ; |        | $FFF1
    .byte $FF ; |XXXXXXXX| $FFF2
    .byte $FF ; |XXXXXXXX| $FFF3
    .byte $00 ; |        | $FFF4
    .byte $00 ; |        | $FFF5
    .byte $FF ; |XXXXXXXX| $FFF6
    .byte $FF ; |XXXXXXXX| $FFF7
    .byte $00 ; |        | $FFF8
    .byte $00 ; |        | $FFF9
    .byte $FF ; |XXXXXXXX| $FFFA
    .byte $FF ; |XXXXXXXX| $FFFB
    
       ORG $FFFC
       
    .word START
    .word START