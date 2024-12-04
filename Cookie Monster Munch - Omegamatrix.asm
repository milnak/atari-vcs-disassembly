; Disassembly of Cookie Monster
; Disassembled by Omegamatrix
; Using DiStella v4.0
;
;
;
; Cook1.cfg contents:
;
;      ORG D000
;      CODE D000 D5CC
;      GFX D5CD D9D7
;      CODE D9D8 DA6A
;      GFX DA6B DFF1
;      CODE DFF2 DFF6
;      GFX DFF7 DFFF
;
; Cook2.cfg contents:
;
;      ORG F000
;      CODE F000 FBB2
;      GFX FBB3 FFF1
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
REFP0   =  $0B
REFP1   =  $0C
PF0     =  $0D
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
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXPPMM  =  $37
INPT0   =  $38
INPT1   =  $39
INPT4   =  $3C
SWCHA   =  $0280
SWACNT  =  $0281
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

ORIGINAL = 1  ; 0 = original, 1 = joystick conversion

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RIOT RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RIOT_RAM
       ORG $80

ram_80             ds 1  ; x17
ram_81             ds 1  ; x14
ram_82             ds 1  ; x3
ram_83             ds 1  ; x10
ram_84             ds 1  ; x6
ram_85             ds 1  ; x25
ram_86             ds 1  ; x35
ram_87             ds 1  ; x15
ram_88             ds 1  ; x3
ram_89             ds 1  ; x2
ram_8A             ds 1  ; x4
ram_8B             ds 1  ; x8
ram_8C             ds 1  ; x5
ram_8D             ds 1  ; x2
ram_8E             ds 1  ; x5
ram_8F             ds 1  ; x8
ram_90             ds 1  ; x7
ram_91             ds 1  ; x4
ram_92             ds 1  ; x2
ram_93             ds 1  ; x6
ram_94             ds 1  ; x9
ram_95             ds 1  ; x8
ram_96             ds 1  ; x8
ram_97             ds 1  ; x8
ram_98             ds 1  ; x11
ram_99             ds 1  ; x8
ram_9A             ds 1  ; x2
ram_9B             ds 1  ; x13
ram_9C             ds 1  ; x5
ram_9D             ds 1  ; x6
ram_9E             ds 1  ; x8
ram_9F             ds 1  ; x10
ram_A0             ds 1  ; x6
ram_A1             ds 1  ; x6
ram_A2             ds 1  ; x12
ram_A3             ds 1  ; x3
ram_A4             ds 1  ; x18
ram_A5             ds 1  ; x4
ram_A6             ds 1  ; x6
ram_A7             ds 1  ; x2
ram_A8             ds 1  ; x2
ram_A9             ds 8  ; x7
ram_B1             ds 1  ; x1
ram_B2             ds 1  ; x5
ram_B3             ds 1  ; x6
ram_B4             ds 1  ; x2
ram_B5             ds 1  ; x3
ram_B6             ds 1  ; x4
ram_B7             ds 1  ; x1
ram_B8             ds 1  ; x2
ram_B9             ds 1  ; x1
ram_BA             ds 1  ; x5
ram_BB             ds 1  ; x4
ram_BC             ds 1  ; x3
ram_BD             ds 1  ; x11
ram_BE             ds 1  ; x4
ram_BF             ds 1  ; x10
ram_C0             ds 1  ; x4
ram_C1             ds 1  ; x8
ram_C2             ds 1  ; x2
ram_C3             ds 1  ; x1
ram_C4             ds 1  ; x2
ram_C5             ds 1  ; x1
ram_C6             ds 1  ; x3
ram_C7             ds 1  ; x3
ram_C8             ds 1  ; x1
ram_C9             ds 1  ; x3
ram_CA             ds 1  ; x1
ram_CB             ds 1  ; x2
ram_CC             ds 1  ; x2
ram_CD             ds 1  ; x2
ram_CE             ds 1  ; x6
ram_CF             ds 1  ; x2
ram_D0             ds 1  ; x2
ram_D1             ds 1  ; x2
ram_D2             ds 1  ; x43
ram_D3             ds 1  ; x14
ram_D4             ds 1  ; x12
ram_D5             ds 1  ; x10
ram_D6             ds 1  ; x8
ram_D7             ds 1  ; x5
ram_D8             ds 1  ; x5
ram_D9             ds 1  ; x15
ram_DA             ds 1  ; x14
ram_DB             ds 1  ; x4
ram_DC             ds 1  ; x1
ram_DD             ds 1  ; x4
ram_DE             ds 1  ; x1
ram_DF             ds 1  ; x4
ram_E0             ds 1  ; x1
ram_E1             ds 1  ; x4
ram_E2             ds 1  ; x2
ram_E3             ds 1  ; x4
ram_E4             ds 1  ; x2
ram_E5             ds 1  ; x5
ram_E6             ds 1  ; x1
ram_E7             ds 1  ; x5
ram_E8             ds 1  ; x1
ram_E9             ds 1  ; x5
ram_EA             ds 1  ; x1
ram_EB             ds 1  ; x5
ram_EC             ds 1  ; x1
ram_ED             ds 1  ; x22
ram_EE             ds 1  ; x2
ram_EF             ds 1  ; x19
ram_F0             ds 1  ; x2
ram_F1             ds 1  ; x19
ram_F2             ds 1  ; x2
ram_F3             ds 1  ; x21
ram_F4             ds 1  ; x2
ram_F5             ds 1  ; x17
ram_F6             ds 1  ; x1
ram_F7             ds 1  ; x11
ram_F8             ds 8  ; x9


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 0
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG CODE
       
       ORG $0000
      RORG $D000

START_0:
    lda    #$00                  ; 2
    sta    ram_F7                ; 3
    lda    #$F0                  ; 2
    sta    ram_F8                ; 3
    jmp    LDFF2                 ; 3

LD00B:
    dec    ram_8F                ; 5
    ldx    #$19                  ; 2
LD00F:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    LD00F                 ; 2³
    lda    ram_88                ; 3
    sta    COLUPF                ; 3
    lda    #$01                  ; 2
    sta    CTRLPF                ; 3
    lda    ram_8F                ; 3
    adc    #$10                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDF1                 ; 3
    lda    #$0C                  ; 2
    sta    AUDC1                 ; 3
    lda    #$06                  ; 2
    sta    AUDV1                 ; 3
    lda    #$00                  ; 2
    sta    ram_D2                ; 3
    ldy    #$08                  ; 2
LD033:
    ldx    #$0B                  ; 2
LD035:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_D2                ; 3
    cmp    ram_8F                ; 3
    bcc    LD049                 ; 2³
    lda    (ram_DB),Y            ; 5
    sta    PF0                   ; 3
    lda    (ram_DD),Y            ; 5
    sta    PF1                   ; 3
    lda    (ram_DF),Y            ; 5
    sta    PF2                   ; 3
LD049:
    inc    ram_D2                ; 5
    dex                          ; 2
    bpl    LD035                 ; 2³
    dey                          ; 2
    bpl    LD033                 ; 2³
    ldy    #$0B                  ; 2
LD053:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    lda    #$80                  ; 2
    ldx    ram_80                ; 3
    cpx    #$04                  ; 2
    bcs    LD065                 ; 2³
    lda    #$C0                  ; 2
LD065:
    sta    PF2                   ; 3
    dey                          ; 2
    bpl    LD053                 ; 2³
    jmp    LD26B                 ; 3

    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$20                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    ldx    ram_8F                ; 3
    beq    LD07C                 ; 2³
    jmp    LD00B                 ; 3

LD07C:
    lda    #$08                  ; 2
    sta    ram_D6                ; 3
    sta    COLUPF                ; 3
    lda    ram_89                ; 3
    sta    COLUP1                ; 3
    lda    #$01                  ; 2
    sta    VDELP1                ; 3
    ldx    #$04                  ; 2
    lda    ram_A4                ; 3
    beq    LD092                 ; 2³
    ldx    #$00                  ; 2
LD092:
    stx    CTRLPF                ; 3
    lda    ram_B1                ; 3
    sta    ram_D4                ; 3
    and    #$0F                  ; 2
    sta    ram_D3                ; 3
    ldy    #$91                  ; 2
    ldx    #$18                  ; 2
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
LD0A4:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF1                   ; 3
    lda    (ram_ED),Y            ; 5
    and    (ram_F3),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_F1),Y            ; 5
    sta    COLUP0                ; 3
    lda    LDC79,X               ; 4
    sta    PF2                   ; 3
    lda    (ram_EF),Y            ; 5
    and    (ram_F5),Y            ; 5
    sta    GRP1                  ; 3
    nop                          ; 2
    dey                          ; 2
    lda    LDC78,X               ; 4
    sta    PF0                   ; 3
    lda    LDC8E,X               ; 4
    dex                          ; 2
    bpl    LD0A4                 ; 2³
    lda    #$01                  ; 2
    sta    CTRLPF                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_ED),Y            ; 5
    and    (ram_F3),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_F1),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_EF),Y            ; 5
    and    (ram_F5),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    lda    ram_88                ; 3
    sta    COLUPF                ; 3
LD0E5:
    lda    (ram_ED),Y            ; 5
    and    (ram_F3),Y            ; 5
    tax                          ; 2
    lda    (ram_F1),Y            ; 5
    sty    ram_D5                ; 3
    ldy    ram_D6                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUP0                ; 3
    stx    GRP0                  ; 3
    lda    (ram_DB),Y            ; 5
    sta    PF0                   ; 3
    lda    (ram_DD),Y            ; 5
    sta    PF1                   ; 3
    lda    (ram_DF),Y            ; 5
    sta    PF2                   ; 3
    ldy    ram_D5                ; 3
    lda    (ram_EF),Y            ; 5
    and    (ram_F5),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    lda    (ram_ED),Y            ; 5
    and    (ram_F3),Y            ; 5
    tax                          ; 2
    lda    (ram_F1),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    GRP0                  ; 3
    sta    COLUP0                ; 3
    lda    (ram_EF),Y            ; 5
    and    (ram_F5),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    lda    (ram_ED),Y            ; 5
    and    (ram_F3),Y            ; 5
    tax                          ; 2
    lda    (ram_EF),Y            ; 5
    and    (ram_F5),Y            ; 5
    sta    ram_D5                ; 3
    lda    (ram_F1),Y            ; 5
    dey                          ; 2
    sty    ram_D2                ; 3
    tay                          ; 2
    lda    ram_D5                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    GRP0                  ; 3
    sta    GRP1                  ; 3
    ldx    ram_D3                ; 3
    lda    ram_D4                ; 3
    sty    COLUP0                ; 3
LD13E:
    dex                          ; 2
    bpl    LD13E                 ; 2³
    sta    RESM1                 ; 3
    sta    HMM1                  ; 3
    ldy    ram_D2                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    (ram_ED),Y            ; 5
    and    (ram_F3),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_F1),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_EF),Y            ; 5
    and    (ram_F5),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    lda    #$D0                  ; 2
    sta    HMM1                  ; 3
    lda    #$10                  ; 2
    sta    NUSIZ1                ; 3
    ldx    #$02                  ; 2
    lda    (ram_ED),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    stx    ENAM1                 ; 3
    and    (ram_F3),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_F1),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_EF),Y            ; 5
    and    (ram_F5),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    lda    #$10                  ; 2
    sta    HMM1                  ; 3
    ldx    #$20                  ; 2
    lda    (ram_ED),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    stx    NUSIZ1                ; 3
    and    (ram_F3),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_F1),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_EF),Y            ; 5
    and    (ram_F5),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    lda    #$00                  ; 2
    sta    HMM1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    (ram_ED),Y            ; 5
    and    (ram_F3),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_F1),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_EF),Y            ; 5
    and    (ram_F5),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    lda    #$F0                  ; 2
    sta    HMM1                  ; 3
    ldx    #$10                  ; 2
    lda    (ram_ED),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    stx    NUSIZ1                ; 3
    and    (ram_F3),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_F1),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_EF),Y            ; 5
    and    (ram_F5),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    ldx    ram_D6                ; 3
    lda    ram_A8,X              ; 4
    sta    ram_D4                ; 3
    and    #$0F                  ; 2
    sta    ram_D3                ; 3
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    ENAM1                 ; 3
    lda    (ram_ED),Y            ; 5
    and    (ram_F3),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_F1),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_EF),Y            ; 5
    and    (ram_F5),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_ED),Y            ; 5
    and    (ram_F3),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_F1),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_EF),Y            ; 5
    and    (ram_F5),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_ED),Y            ; 5
    and    (ram_F3),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_F1),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_EF),Y            ; 5
    and    (ram_F5),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    lda    (ram_ED),Y            ; 5
    and    (ram_F3),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    (ram_F1),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_EF),Y            ; 5
    and    (ram_F5),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    dec    ram_D6                ; 5
    bmi    LD231                 ; 2³
    jmp    LD0E5                 ; 3

LD231:
    lda    (ram_ED),Y            ; 5
    and    (ram_F3),Y            ; 5
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP0                  ; 3
    lda    (ram_F1),Y            ; 5
    sta    COLUP0                ; 3
    lda    #$00                  ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    lda    #$80                  ; 2
    ldx    ram_80                ; 3
    cpx    #$04                  ; 2
    bcs    LD24D                 ; 2³
    lda    #$C0                  ; 2
LD24D:
    sta    PF2                   ; 3
    lda    (ram_EF),Y            ; 5
    and    (ram_F5),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
LD256:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_ED),Y            ; 5
    and    (ram_F3),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_F1),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_EF),Y            ; 5
    and    (ram_F5),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    bpl    LD256                 ; 2³
LD26B:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    PF2                   ; 3
    sta    VDELP1                ; 3
    lda    ram_8A                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$10                  ; 2
    sta    HMP1                  ; 3
    sta    REFP0                 ; 3
    lda    #$08                  ; 2
    sta    REFP1                 ; 3
    ldy    #$0A                  ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
LD28E:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    (ram_E1),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_E3),Y            ; 5
    sta    GRP1                  ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta    HMCLR                 ; 3
    dey                          ; 2
    bpl    LD28E                 ; 2³
    ldy    #$05                  ; 2
    lda    ram_8B                ; 3
LD2A6:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUPF                ; 3
    lda    (ram_E5),Y            ; 5
    and    #$F0                  ; 2
    sta    ram_D2                ; 3
    lda    (ram_E7),Y            ; 5
    and    #$0F                  ; 2
    ora    ram_D2                ; 3
    sta    PF1                   ; 3
    sta    ram_D2                ; 3
    lda    (ram_E9),Y            ; 5
    and    #$0F                  ; 2
    sta    ram_D3                ; 3
    lda    (ram_EB),Y            ; 5
    and    #$F0                  ; 2
    ora    ram_D3                ; 3
    sta    PF1                   ; 3
    ldx    ram_8C                ; 3
    stx    COLUPF                ; 3
    sta    ram_D3                ; 3
    ldx    #$02                  ; 2
LD2D0:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_8B                ; 3
    sta    COLUPF                ; 3
    lda    ram_D2                ; 3
    sta    PF1                   ; 3
    nop                          ; 2
    nop                          ; 2
    stx    ram_D4                ; 3
    tya                          ; 2
    asl                          ; 2
    asl                          ; 2
    adc    ram_D4                ; 3
    tax                          ; 2
    cpy    #$03                  ; 2
    bcs    LD2EF                 ; 2³
    lda    LDCA4,X               ; 4
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
LD2EF:
    ldx    ram_D4                ; 3
    lda    ram_8C                ; 3
    sta    COLUPF                ; 3
    lda    ram_D3                ; 3
    sta    PF1                   ; 3
    dex                          ; 2
    bpl    LD2D0                 ; 2³
    lda    ram_8B                ; 3
    dey                          ; 2
    bpl    LD2A6                 ; 2³+1
    iny                          ; 2
    sty    PF1                   ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_9A                ; 3
    sta    HMP0                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    ldy    ram_8D                ; 3
    nop                          ; 2
LD314:
    dex                          ; 2
    bpl    LD314                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sty    COLUPF                ; 3
    sty    COLUP0                ; 3
    lda    ram_83                ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    REFP0                 ; 3
    ldx    #$05                  ; 2
LD32A:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_98                ; 3
    sta    GRP0                  ; 3
    lda    ram_94                ; 3
    sta    PF1                   ; 3
    lda    ram_95                ; 3
    sta    PF2                   ; 3
    ldy    #$03                  ; 2
LD33A:
    dey                          ; 2
    bpl    LD33A                 ; 2³
    nop                          ; 2
    lda.w  ram_96                ; 4
    sta    PF2                   ; 3
    lda    ram_97                ; 3
    sta    PF1                   ; 3
    dex                          ; 2
    bpl    LD32A                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    inx                          ; 2
    stx    PF0                   ; 3
    stx    PF1                   ; 3
    stx    PF2                   ; 3
    stx    GRP0                  ; 3
    jmp    LD5A2                 ; 3

    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$31                  ; 2
    sta    CTRLPF                ; 3
    lda    #$35                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    lda    #$84                  ; 2
    sta    COLUPF                ; 3
    lda    #$0D                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta.w  RESP0                 ; 4
    nop                          ; 2
    sta.w  RESP1                 ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #$06                  ; 2
LD380:
    dey                          ; 2
    bpl    LD380                 ; 2³
    nop                          ; 2
    sta    RESBL                 ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta.w  RESM0                 ; 4
    ldy    #$03                  ; 2
LD38F:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bpl    LD38F                 ; 2³
    iny                          ; 2
    sty    REFP0                 ; 3
    lda    #$08                  ; 2
    sta    REFP1                 ; 3
    ldy    #$16                  ; 2
LD39D:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_C7),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_C9),Y            ; 5
    sta    GRP1                  ; 3
    cpy    #$05                  ; 2
    bcs    LD3B0                 ; 2³
    lda    LDCC3,Y               ; 4
    sta    PF2                   ; 3
LD3B0:
    dey                          ; 2
    bpl    LD39D                 ; 2³
    ldy    #$37                  ; 2
    sta    RESP0                 ; 3
    lda    #$37                  ; 2
    sta    NUSIZ0                ; 3
    nop                          ; 2
    sta    RESP1                 ; 3
    sta    NUSIZ1                ; 3
    lda    #$84                  ; 2
    sta    COLUP0                ; 3
    lda    #$28                  ; 2
    sta    COLUP1                ; 3
    lda    #$02                  ; 2
    sta    ENABL                 ; 3
    sta    ENAM0                 ; 3
    lda    ram_CB                ; 3
    sta    REFP0                 ; 3
    asl                          ; 2
    sta    REFP1                 ; 3
LD3D5:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$28                  ; 2
    sta    COLUP0                ; 3
    lda    (ram_E3),Y            ; 5
    sta    PF2                   ; 3
    sty    ram_D2                ; 3
    tya                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    (ram_F1),Y            ; 5
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    ldy    ram_D2                ; 3
    lda    (ram_E1),Y            ; 5
    sta    HMBL                  ; 3
    ldx    #$84                  ; 2
    stx    COLUP0                ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMM0                  ; 3
    dey                          ; 2
    bpl    LD3D5                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #$03                  ; 2
LD403:
    dey                          ; 2
    bpl    LD403                 ; 2³
    nop                          ; 2
    nop                          ; 2
    lda    #$00                  ; 2
    sta    REFP0                 ; 3
    lda    #$08                  ; 2
    sta    REFP1                 ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    lda    #$00                  ; 2
    sta    VDELP1                ; 3
    ldy    #$37                  ; 2
LD41A:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    (ram_F3),Y            ; 5
    sta    GRP1                  ; 3
    lda    #$86                  ; 2
    sta    COLUP0                ; 3
    lda    LDFAA,Y               ; 4
    sta    PF2                   ; 3
    cpy    ram_CF                ; 3
    bcs    LD437                 ; 2³
    lda    (ram_ED),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_EF),Y            ; 5
    sta    HMP0                  ; 3
LD437:
    lda    LDA75,Y               ; 4
    ldx    #$84                  ; 2
    stx    COLUP0                ; 3
    sta    HMBL                  ; 3
    eor    #$F0                  ; 2
    clc                          ; 2
    adc    #$10                  ; 2
    sta    HMM0                  ; 3
    dey                          ; 2
    bpl    LD41A                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    iny                          ; 2
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    lda    ram_8A                ; 3
    sta    COLUPF                ; 3
    sta    COLUP0                ; 3
    lda    #$7F                  ; 2
    sta    PF1                   ; 3
    ldx    #$2E                  ; 2
    sta    RESBL                 ; 3
    nop                          ; 2
    nop                          ; 2
    sta    HMCLR                 ; 3
    sty    REFP1                 ; 3
    ldy    #$02                  ; 2
    sta    RESP1                 ; 3
LD469:
    dey                          ; 2
    bpl    LD469                 ; 2³
    nop                          ; 2
    lda    #$2A                  ; 2
    sta    COLUP1                ; 3
    sta    RESM0                 ; 3
LD473:
    ldy    #$02                  ; 2
LD475:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    LDF7B,X               ; 4
    and    #$0F                  ; 2
    sta    ram_D2                ; 3
    lda    ram_8A                ; 3
    and    #$F0                  ; 2
    ora    ram_D2                ; 3
    sta    COLUPF                ; 3
    sta    COLUP0                ; 3
    cpx    #$10                  ; 2
    bne    LD492                 ; 2³
    lda    #$FF                  ; 2
    sta    PF1                   ; 3
LD492:
    lda    LDF7B,X               ; 4
    sta    HMBL                  ; 3
    eor    #$F0                  ; 2
    clc                          ; 2
    adc    #$10                  ; 2
    sta    HMM0                  ; 3
    lda    ram_C1                ; 3
    bne    LD4A6                 ; 2³
    lda    #$35                  ; 2
    sta    CTRLPF                ; 3
LD4A6:
    dex                          ; 2
    dey                          ; 2
    bpl    LD475                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    txa                          ; 2
    clc                          ; 2
    adc    #$04                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    (ram_C2),Y            ; 5
    and    #$F0                  ; 2
    sta    ram_D2                ; 3
    lda    (ram_C4),Y            ; 5
    and    #$0F                  ; 2
    ora    ram_D2                ; 3
    sta    GRP1                  ; 3
    dex                          ; 2
    bpl    LD473                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    ENABL                 ; 3
    sta    ENAM0                 ; 3
    sta    CTRLPF                ; 3
    jmp    LD5A2                 ; 3

    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #$01                  ; 2
    sty    CTRLPF                ; 3
    sty    NUSIZ1                ; 3
    dey                          ; 2
    sty    COLUBK                ; 3
    sty    HMP1                  ; 3
    sty    REFP0                 ; 3
    sty    REFP1                 ; 3
    dey                          ; 2
    sty    HMP0                  ; 3
    lda    #$03                  ; 2
    sta    NUSIZ0                ; 3
    lda    #$2C                  ; 2
    eor    ram_D7                ; 3
    sta.w  RESP0                 ; 4
    sta    RESP1                 ; 3
    and    ram_D8                ; 3
    sta    COLUPF                ; 3
    lda    #$48                  ; 2
    eor    ram_D7                ; 3
    and    ram_D8                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$80                  ; 2
    eor    ram_D7                ; 3
    and    ram_D8                ; 3
    sta    COLUBK                ; 3
    ldx    #$06                  ; 2
    lda    ram_9B                ; 3
    bmi    LD528                 ; 2³
LD519:
    lda    LDB78,X               ; 4
    sta    ram_A9,X              ; 4
    lda    LDB7F,X               ; 4
    sta    ram_ED,X              ; 4
    dex                          ; 2
    bpl    LD519                 ; 2³
    bmi    LD535                 ; 2³
LD528:
    lda    LDB86,X               ; 4
    sta    ram_A9,X              ; 4
    lda    LDB8D,X               ; 4
    sta    ram_ED,X              ; 4
    dex                          ; 2
    bpl    LD528                 ; 2³
LD535:
    ldx    #$14                  ; 2
LD537:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    LD537                 ; 2³
    ldx    #$19                  ; 2
LD53E:
    lda    #$05                  ; 2
    sta    ram_D2                ; 3
LD542:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LDB09,X               ; 4
    sta    PF1                   ; 3
    lda    LDB23,X               ; 4
    sta    PF2                   ; 3
    ldy    #$04                  ; 2
LD550:
    dey                          ; 2
    bpl    LD550                 ; 2³
    lda    LDB3D,X               ; 4
    sta.w  PF2                   ; 4
    lda    LDB57,X               ; 4
    sta    PF1                   ; 3
    dec    ram_D2                ; 5
    bne    LD542                 ; 2³
    dex                          ; 2
    bpl    LD53E                 ; 2³
    ldx    #$1B                  ; 2
LD567:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    LD567                 ; 2³
    ldx    #$06                  ; 2
LD56E:
    stx    ram_D3                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #$01                  ; 2
LD574:
    dey                          ; 2
    bpl    LD574                 ; 2³
    lda    LDB71,X               ; 4
    sta    GRP0                  ; 3
    lda    ram_A9,X              ; 4
    sta    GRP1                  ; 3
    ldy    ram_ED,X              ; 4
    lda    LDB94,X               ; 4
    sta    ram_D2                ; 3
    lda    LDFEB,X               ; 4
    ldx    ram_D2                ; 3
    sty    GRP0                  ; 3
    stx    GRP1                  ; 3
    sta    GRP0                  ; 3
    ldx    ram_D3                ; 3
    dex                          ; 2
    bpl    LD56E                 ; 2³
    inx                          ; 2
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    COLUBK                ; 3
LD5A2:
    lda    #$4D                  ; 2
    sta    ram_F7                ; 3
    lda    #$F0                  ; 2
    sta    ram_F8                ; 3
    jmp    LDFF2                 ; 3

    lda    #$FB                  ; 2
    sta    ram_F8                ; 3
    lda    #$50                  ; 2
    sta    ram_F7                ; 3
    lda    LDCAF,X               ; 4
    bne    LD5BF                 ; 2³
    lda    (ram_DB),Y            ; 5
    jmp    LD5CA                 ; 3

LD5BF:
    cmp    #$01                  ; 2
    bne    LD5C8                 ; 2³
    lda    (ram_DD),Y            ; 5
    jmp    LD5CA                 ; 3

LD5C8:
    lda    (ram_DF),Y            ; 5
LD5CA:
    jmp    LDFF2                 ; 3

    .byte $36 ; |  XX XX | $D5CD
    .byte $14 ; |   X X  | $D5CE
    .byte $14 ; |   X X  | $D5CF
    .byte $14 ; |   X X  | $D5D0
    .byte $14 ; |   X X  | $D5D1
    .byte $1C ; |   XXX  | $D5D2
    .byte $3E ; |  XXXXX | $D5D3
    .byte $5D ; | X XXX X| $D5D4
    .byte $3E ; |  XXXXX | $D5D5
    .byte $1C ; |   XXX  | $D5D6
    .byte $08 ; |    X   | $D5D7
    .byte $1C ; |   XXX  | $D5D8
    .byte $1C ; |   XXX  | $D5D9
    .byte $1C ; |   XXX  | $D5DA
    .byte $08 ; |    X   | $D5DB
    .byte $00 ; |        | $D5DC
    .byte $00 ; |        | $D5DD
    .byte $00 ; |        | $D5DE
    .byte $00 ; |        | $D5DF
    .byte $00 ; |        | $D5E0
    .byte $00 ; |        | $D5E1
    .byte $00 ; |        | $D5E2
    .byte $18 ; |   XX   | $D5E3
    .byte $10 ; |   X    | $D5E4
    .byte $10 ; |   X    | $D5E5
    .byte $10 ; |   X    | $D5E6
    .byte $10 ; |   X    | $D5E7
    .byte $38 ; |  XXX   | $D5E8
    .byte $38 ; |  XXX   | $D5E9
    .byte $38 ; |  XXX   | $D5EA
    .byte $38 ; |  XXX   | $D5EB
    .byte $38 ; |  XXX   | $D5EC
    .byte $10 ; |   X    | $D5ED
    .byte $38 ; |  XXX   | $D5EE
    .byte $3C ; |  XXXX  | $D5EF
    .byte $38 ; |  XXX   | $D5F0
    .byte $10 ; |   X    | $D5F1
    .byte $00 ; |        | $D5F2
    .byte $00 ; |        | $D5F3
    .byte $00 ; |        | $D5F4
    .byte $00 ; |        | $D5F5
    .byte $00 ; |        | $D5F6
    .byte $00 ; |        | $D5F7
    .byte $00 ; |        | $D5F8
    .byte $30 ; |  XX    | $D5F9
    .byte $2C ; |  X XX  | $D5FA
    .byte $28 ; |  X X   | $D5FB
    .byte $28 ; |  X X   | $D5FC
    .byte $28 ; |  X X   | $D5FD
    .byte $38 ; |  XXX   | $D5FE
    .byte $38 ; |  XXX   | $D5FF
    .byte $3C ; |  XXXX  | $D600
    .byte $78 ; | XXXX   | $D601
    .byte $38 ; |  XXX   | $D602
    .byte $10 ; |   X    | $D603
    .byte $38 ; |  XXX   | $D604
    .byte $3C ; |  XXXX  | $D605
    .byte $38 ; |  XXX   | $D606
    .byte $10 ; |   X    | $D607
    .byte $00 ; |        | $D608
    .byte $00 ; |        | $D609
    .byte $00 ; |        | $D60A
    .byte $00 ; |        | $D60B
    .byte $00 ; |        | $D60C
    .byte $00 ; |        | $D60D
    .byte $00 ; |        | $D60E
    .byte $60 ; | XX     | $D60F
    .byte $46 ; | X   XX | $D610
    .byte $44 ; | X   X  | $D611
    .byte $28 ; |  X X   | $D612
    .byte $28 ; |  X X   | $D613
    .byte $38 ; |  XXX   | $D614
    .byte $78 ; | XXXX   | $D615
    .byte $BC ; |X XXXX  | $D616
    .byte $7A ; | XXXX X | $D617
    .byte $38 ; |  XXX   | $D618
    .byte $10 ; |   X    | $D619
    .byte $38 ; |  XXX   | $D61A
    .byte $3C ; |  XXXX  | $D61B
    .byte $38 ; |  XXX   | $D61C
    .byte $10 ; |   X    | $D61D
    .byte $00 ; |        | $D61E
    .byte $00 ; |        | $D61F
    .byte $00 ; |        | $D620
    .byte $00 ; |        | $D621
    .byte $00 ; |        | $D622
    .byte $00 ; |        | $D623
    .byte $00 ; |        | $D624
    .byte $00 ; |        | $D625
    .byte $00 ; |        | $D626
    .byte $00 ; |        | $D627
    .byte $00 ; |        | $D628
    .byte $00 ; |        | $D629
    .byte $00 ; |        | $D62A
    .byte $00 ; |        | $D62B
    .byte $00 ; |        | $D62C
    .byte $00 ; |        | $D62D
    .byte $00 ; |        | $D62E
    .byte $00 ; |        | $D62F
    .byte $00 ; |        | $D630
    .byte $00 ; |        | $D631
    .byte $00 ; |        | $D632
    .byte $00 ; |        | $D633
    .byte $00 ; |        | $D634
    .byte $00 ; |        | $D635
    .byte $00 ; |        | $D636
    .byte $00 ; |        | $D637
    .byte $00 ; |        | $D638
    .byte $00 ; |        | $D639
    .byte $00 ; |        | $D63A
    .byte $00 ; |        | $D63B
    .byte $00 ; |        | $D63C
    .byte $00 ; |        | $D63D
    .byte $00 ; |        | $D63E
    .byte $00 ; |        | $D63F
    .byte $00 ; |        | $D640
    .byte $00 ; |        | $D641
    .byte $00 ; |        | $D642
    .byte $00 ; |        | $D643
    .byte $30 ; |  XX    | $D644
    .byte $30 ; |  XX    | $D645
    .byte $78 ; | XXXX   | $D646
    .byte $78 ; | XXXX   | $D647
    .byte $78 ; | XXXX   | $D648
    .byte $FC ; |XXXXXX  | $D649
    .byte $FC ; |XXXXXX  | $D64A
    .byte $FC ; |XXXXXX  | $D64B
    .byte $FC ; |XXXXXX  | $D64C
    .byte $FC ; |XXXXXX  | $D64D
    .byte $FC ; |XXXXXX  | $D64E
    .byte $FC ; |XXXXXX  | $D64F
    .byte $FC ; |XXXXXX  | $D650
    .byte $78 ; | XXXX   | $D651
    .byte $78 ; | XXXX   | $D652
    .byte $78 ; | XXXX   | $D653
    .byte $30 ; |  XX    | $D654
    .byte $30 ; |  XX    | $D655
    .byte $00 ; |        | $D656
    .byte $00 ; |        | $D657
    .byte $00 ; |        | $D658
    .byte $00 ; |        | $D659
    .byte $00 ; |        | $D65A
    .byte $00 ; |        | $D65B
    .byte $00 ; |        | $D65C
    .byte $00 ; |        | $D65D
    .byte $00 ; |        | $D65E
    .byte $00 ; |        | $D65F
    .byte $00 ; |        | $D660
    .byte $00 ; |        | $D661
    .byte $00 ; |        | $D662
    .byte $00 ; |        | $D663
    .byte $00 ; |        | $D664
    .byte $00 ; |        | $D665
    .byte $00 ; |        | $D666
    .byte $00 ; |        | $D667
    .byte $00 ; |        | $D668
    .byte $00 ; |        | $D669
    .byte $00 ; |        | $D66A
    .byte $00 ; |        | $D66B
    .byte $00 ; |        | $D66C
    .byte $00 ; |        | $D66D
    .byte $00 ; |        | $D66E
    .byte $00 ; |        | $D66F
    .byte $00 ; |        | $D670
    .byte $00 ; |        | $D671
    .byte $00 ; |        | $D672
    .byte $00 ; |        | $D673
    .byte $00 ; |        | $D674
    .byte $00 ; |        | $D675
    .byte $00 ; |        | $D676
    .byte $00 ; |        | $D677
    .byte $00 ; |        | $D678
    .byte $00 ; |        | $D679
    .byte $00 ; |        | $D67A
    .byte $00 ; |        | $D67B
    .byte $00 ; |        | $D67C
    .byte $00 ; |        | $D67D
    .byte $00 ; |        | $D67E
    .byte $00 ; |        | $D67F
    .byte $00 ; |        | $D680
    .byte $00 ; |        | $D681
    .byte $00 ; |        | $D682
    .byte $00 ; |        | $D683
    .byte $00 ; |        | $D684
    .byte $00 ; |        | $D685
    .byte $00 ; |        | $D686
    .byte $00 ; |        | $D687
    .byte $00 ; |        | $D688
    .byte $00 ; |        | $D689
    .byte $00 ; |        | $D68A
    .byte $00 ; |        | $D68B
    .byte $00 ; |        | $D68C
    .byte $00 ; |        | $D68D
    .byte $00 ; |        | $D68E
    .byte $00 ; |        | $D68F
    .byte $00 ; |        | $D690
    .byte $00 ; |        | $D691
    .byte $00 ; |        | $D692
    .byte $00 ; |        | $D693
    .byte $00 ; |        | $D694
    .byte $00 ; |        | $D695
    .byte $00 ; |        | $D696
    .byte $00 ; |        | $D697
    .byte $00 ; |        | $D698
    .byte $00 ; |        | $D699
    .byte $00 ; |        | $D69A
    .byte $00 ; |        | $D69B
    .byte $00 ; |        | $D69C
    .byte $00 ; |        | $D69D
    .byte $00 ; |        | $D69E
    .byte $00 ; |        | $D69F
    .byte $00 ; |        | $D6A0
    .byte $00 ; |        | $D6A1
    .byte $00 ; |        | $D6A2
    .byte $00 ; |        | $D6A3
    .byte $00 ; |        | $D6A4
    .byte $00 ; |        | $D6A5
    .byte $00 ; |        | $D6A6
    .byte $00 ; |        | $D6A7
    .byte $00 ; |        | $D6A8
    .byte $00 ; |        | $D6A9
    .byte $00 ; |        | $D6AA
    .byte $00 ; |        | $D6AB
    .byte $00 ; |        | $D6AC
    .byte $00 ; |        | $D6AD
    .byte $00 ; |        | $D6AE
    .byte $00 ; |        | $D6AF
    .byte $00 ; |        | $D6B0
    .byte $00 ; |        | $D6B1
    .byte $00 ; |        | $D6B2
    .byte $00 ; |        | $D6B3
    .byte $00 ; |        | $D6B4
    .byte $00 ; |        | $D6B5
    .byte $00 ; |        | $D6B6
    .byte $00 ; |        | $D6B7
    .byte $00 ; |        | $D6B8
    .byte $00 ; |        | $D6B9
    .byte $00 ; |        | $D6BA
    .byte $00 ; |        | $D6BB
    .byte $00 ; |        | $D6BC
    .byte $00 ; |        | $D6BD
    .byte $00 ; |        | $D6BE
    .byte $00 ; |        | $D6BF
    .byte $00 ; |        | $D6C0
    .byte $00 ; |        | $D6C1
    .byte $00 ; |        | $D6C2
    .byte $00 ; |        | $D6C3
    .byte $00 ; |        | $D6C4
    .byte $00 ; |        | $D6C5
    .byte $00 ; |        | $D6C6
    .byte $00 ; |        | $D6C7
    .byte $00 ; |        | $D6C8
    .byte $00 ; |        | $D6C9
    .byte $00 ; |        | $D6CA
    .byte $00 ; |        | $D6CB
    .byte $00 ; |        | $D6CC
    .byte $00 ; |        | $D6CD
    .byte $00 ; |        | $D6CE
    .byte $00 ; |        | $D6CF
    .byte $00 ; |        | $D6D0
    .byte $00 ; |        | $D6D1
    .byte $00 ; |        | $D6D2
    .byte $00 ; |        | $D6D3
    .byte $FF ; |XXXXXXXX| $D6D4
    .byte $FF ; |XXXXXXXX| $D6D5
    .byte $FF ; |XXXXXXXX| $D6D6
    .byte $FF ; |XXXXXXXX| $D6D7
    .byte $FF ; |XXXXXXXX| $D6D8
    .byte $FF ; |XXXXXXXX| $D6D9
    .byte $FF ; |XXXXXXXX| $D6DA
    .byte $FF ; |XXXXXXXX| $D6DB
    .byte $FF ; |XXXXXXXX| $D6DC
    .byte $FF ; |XXXXXXXX| $D6DD
    .byte $FF ; |XXXXXXXX| $D6DE
    .byte $FF ; |XXXXXXXX| $D6DF
    .byte $FF ; |XXXXXXXX| $D6E0
    .byte $FF ; |XXXXXXXX| $D6E1
    .byte $FF ; |XXXXXXXX| $D6E2
    .byte $FF ; |XXXXXXXX| $D6E3
    .byte $FF ; |XXXXXXXX| $D6E4
    .byte $FF ; |XXXXXXXX| $D6E5
    .byte $FF ; |XXXXXXXX| $D6E6
    .byte $FF ; |XXXXXXXX| $D6E7
    .byte $FF ; |XXXXXXXX| $D6E8
    .byte $FF ; |XXXXXXXX| $D6E9
    .byte $00 ; |        | $D6EA
    .byte $00 ; |        | $D6EB
    .byte $00 ; |        | $D6EC
    .byte $00 ; |        | $D6ED
    .byte $00 ; |        | $D6EE
    .byte $00 ; |        | $D6EF
    .byte $00 ; |        | $D6F0
    .byte $00 ; |        | $D6F1
    .byte $00 ; |        | $D6F2
    .byte $00 ; |        | $D6F3
    .byte $00 ; |        | $D6F4
    .byte $00 ; |        | $D6F5
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
    .byte $00 ; |        | $D700
    .byte $00 ; |        | $D701
    .byte $00 ; |        | $D702
    .byte $00 ; |        | $D703
    .byte $00 ; |        | $D704
    .byte $00 ; |        | $D705
    .byte $00 ; |        | $D706
    .byte $00 ; |        | $D707
    .byte $00 ; |        | $D708
    .byte $00 ; |        | $D709
    .byte $00 ; |        | $D70A
    .byte $00 ; |        | $D70B
    .byte $00 ; |        | $D70C
    .byte $00 ; |        | $D70D
    .byte $00 ; |        | $D70E
    .byte $00 ; |        | $D70F
    .byte $00 ; |        | $D710
    .byte $00 ; |        | $D711
    .byte $00 ; |        | $D712
    .byte $00 ; |        | $D713
    .byte $00 ; |        | $D714
    .byte $00 ; |        | $D715
    .byte $00 ; |        | $D716
    .byte $00 ; |        | $D717
    .byte $00 ; |        | $D718
    .byte $00 ; |        | $D719
    .byte $00 ; |        | $D71A
    .byte $00 ; |        | $D71B
    .byte $00 ; |        | $D71C
    .byte $00 ; |        | $D71D
    .byte $00 ; |        | $D71E
    .byte $00 ; |        | $D71F
    .byte $00 ; |        | $D720
    .byte $00 ; |        | $D721
    .byte $00 ; |        | $D722
    .byte $00 ; |        | $D723
    .byte $00 ; |        | $D724
    .byte $00 ; |        | $D725
    .byte $00 ; |        | $D726
    .byte $00 ; |        | $D727
    .byte $00 ; |        | $D728
    .byte $00 ; |        | $D729
    .byte $00 ; |        | $D72A
    .byte $00 ; |        | $D72B
    .byte $00 ; |        | $D72C
    .byte $00 ; |        | $D72D
    .byte $00 ; |        | $D72E
    .byte $00 ; |        | $D72F
    .byte $00 ; |        | $D730
    .byte $00 ; |        | $D731
    .byte $00 ; |        | $D732
    .byte $00 ; |        | $D733
    .byte $00 ; |        | $D734
    .byte $00 ; |        | $D735
    .byte $00 ; |        | $D736
    .byte $00 ; |        | $D737
    .byte $00 ; |        | $D738
    .byte $00 ; |        | $D739
    .byte $00 ; |        | $D73A
    .byte $00 ; |        | $D73B
    .byte $00 ; |        | $D73C
    .byte $00 ; |        | $D73D
    .byte $00 ; |        | $D73E
    .byte $00 ; |        | $D73F
    .byte $00 ; |        | $D740
    .byte $00 ; |        | $D741
    .byte $00 ; |        | $D742
    .byte $00 ; |        | $D743
    .byte $00 ; |        | $D744
    .byte $00 ; |        | $D745
    .byte $00 ; |        | $D746
    .byte $00 ; |        | $D747
    .byte $00 ; |        | $D748
    .byte $00 ; |        | $D749
    .byte $00 ; |        | $D74A
    .byte $00 ; |        | $D74B
    .byte $00 ; |        | $D74C
    .byte $00 ; |        | $D74D
    .byte $00 ; |        | $D74E
    .byte $00 ; |        | $D74F
    .byte $00 ; |        | $D750
    .byte $00 ; |        | $D751
    .byte $00 ; |        | $D752
    .byte $00 ; |        | $D753
    .byte $00 ; |        | $D754
    .byte $00 ; |        | $D755
    .byte $00 ; |        | $D756
    .byte $00 ; |        | $D757
    .byte $00 ; |        | $D758
    .byte $00 ; |        | $D759
    .byte $00 ; |        | $D75A
    .byte $00 ; |        | $D75B
    .byte $00 ; |        | $D75C
    .byte $00 ; |        | $D75D
    .byte $00 ; |        | $D75E
    .byte $00 ; |        | $D75F
    .byte $00 ; |        | $D760
    .byte $00 ; |        | $D761
    .byte $00 ; |        | $D762
    .byte $00 ; |        | $D763
    .byte $00 ; |        | $D764
    .byte $00 ; |        | $D765
    .byte $00 ; |        | $D766
    .byte $00 ; |        | $D767
    .byte $00 ; |        | $D768
    .byte $00 ; |        | $D769
    .byte $00 ; |        | $D76A
    .byte $00 ; |        | $D76B
    .byte $00 ; |        | $D76C
    .byte $00 ; |        | $D76D
    .byte $00 ; |        | $D76E
    .byte $00 ; |        | $D76F
    .byte $00 ; |        | $D770
    .byte $00 ; |        | $D771
    .byte $00 ; |        | $D772
    .byte $00 ; |        | $D773
    .byte $00 ; |        | $D774
    .byte $00 ; |        | $D775
    .byte $00 ; |        | $D776
    .byte $40 ; | X      | $D777
    .byte $88 ; |X   X   | $D778
    .byte $89 ; |X   X  X| $D779
    .byte $CA ; |XX  X X | $D77A
    .byte $7C ; | XXXXX  | $D77B
    .byte $7C ; | XXXXX  | $D77C
    .byte $7E ; | XXXXXX | $D77D
    .byte $7E ; | XXXXXX | $D77E
    .byte $FF ; |XXXXXXXX| $D77F
    .byte $DF ; |XX XXXXX| $D780
    .byte $8F ; |X   XXXX| $D781
    .byte $86 ; |X    XX | $D782
    .byte $00 ; |        | $D783
    .byte $00 ; |        | $D784
    .byte $00 ; |        | $D785
    .byte $00 ; |        | $D786
    .byte $00 ; |        | $D787
    .byte $0C ; |    XX  | $D788
    .byte $88 ; |X   X   | $D789
    .byte $88 ; |X   X   | $D78A
    .byte $E8 ; |XXX X   | $D78B
    .byte $28 ; |  X X   | $D78C
    .byte $38 ; |  XXX   | $D78D
    .byte $B8 ; |X XXX   | $D78E
    .byte $BC ; |X XXXX  | $D78F
    .byte $7A ; | XXXX X | $D790
    .byte $3A ; |  XXX X | $D791
    .byte $10 ; |   X    | $D792
    .byte $38 ; |  XXX   | $D793
    .byte $3C ; |  XXXX  | $D794
    .byte $38 ; |  XXX   | $D795
    .byte $10 ; |   X    | $D796
    .byte $00 ; |        | $D797
    .byte $00 ; |        | $D798
    .byte $00 ; |        | $D799
    .byte $00 ; |        | $D79A
    .byte $00 ; |        | $D79B
    .byte $00 ; |        | $D79C
    .byte $00 ; |        | $D79D
    .byte $06 ; |     XX | $D79E
    .byte $04 ; |     X  | $D79F
    .byte $34 ; |  XX X  | $D7A0
    .byte $14 ; |   X X  | $D7A1
    .byte $14 ; |   X X  | $D7A2
    .byte $1D ; |   XXX X| $D7A3
    .byte $5D ; | X XXX X| $D7A4
    .byte $5E ; | X XXXX | $D7A5
    .byte $3C ; |  XXXX  | $D7A6
    .byte $1C ; |   XXX  | $D7A7
    .byte $08 ; |    X   | $D7A8
    .byte $1C ; |   XXX  | $D7A9
    .byte $1C ; |   XXX  | $D7AA
    .byte $1C ; |   XXX  | $D7AB
    .byte $08 ; |    X   | $D7AC
    .byte $00 ; |        | $D7AD
    .byte $00 ; |        | $D7AE
    .byte $00 ; |        | $D7AF
    .byte $00 ; |        | $D7B0
    .byte $00 ; |        | $D7B1
    .byte $00 ; |        | $D7B2
    .byte $00 ; |        | $D7B3
    .byte $36 ; |  XX XX | $D7B4
    .byte $14 ; |   X X  | $D7B5
    .byte $14 ; |   X X  | $D7B6
    .byte $14 ; |   X X  | $D7B7
    .byte $14 ; |   X X  | $D7B8
    .byte $1C ; |   XXX  | $D7B9
    .byte $5D ; | X XXX X| $D7BA
    .byte $5D ; | X XXX X| $D7BB
    .byte $3E ; |  XXXXX | $D7BC
    .byte $1C ; |   XXX  | $D7BD
    .byte $08 ; |    X   | $D7BE
    .byte $1C ; |   XXX  | $D7BF
    .byte $1C ; |   XXX  | $D7C0
    .byte $1C ; |   XXX  | $D7C1
    .byte $08 ; |    X   | $D7C2
    .byte $00 ; |        | $D7C3
    .byte $00 ; |        | $D7C4
    .byte $00 ; |        | $D7C5
    .byte $00 ; |        | $D7C6
    .byte $00 ; |        | $D7C7
    .byte $00 ; |        | $D7C8
    .byte $00 ; |        | $D7C9
    .byte $30 ; |  XX    | $D7CA
    .byte $10 ; |   X    | $D7CB
    .byte $16 ; |   X XX | $D7CC
    .byte $14 ; |   X X  | $D7CD
    .byte $14 ; |   X X  | $D7CE
    .byte $5C ; | X XXX  | $D7CF
    .byte $5D ; | X XXX X| $D7D0
    .byte $3D ; |  XXXX X| $D7D1
    .byte $1E ; |   XXXX | $D7D2
    .byte $1C ; |   XXX  | $D7D3
    .byte $08 ; |    X   | $D7D4
    .byte $1C ; |   XXX  | $D7D5
    .byte $1C ; |   XXX  | $D7D6
    .byte $1C ; |   XXX  | $D7D7
    .byte $08 ; |    X   | $D7D8
    .byte $00 ; |        | $D7D9
    .byte $00 ; |        | $D7DA
    .byte $00 ; |        | $D7DB
    .byte $00 ; |        | $D7DC
    .byte $00 ; |        | $D7DD
    .byte $00 ; |        | $D7DE
    .byte $00 ; |        | $D7DF
    .byte $36 ; |  XX XX | $D7E0
    .byte $14 ; |   X X  | $D7E1
    .byte $14 ; |   X X  | $D7E2
    .byte $14 ; |   X X  | $D7E3
    .byte $14 ; |   X X  | $D7E4
    .byte $1C ; |   XXX  | $D7E5
    .byte $1E ; |   XXXX | $D7E6
    .byte $1D ; |   XXX X| $D7E7
    .byte $1E ; |   XXXX | $D7E8
    .byte $3C ; |  XXXX  | $D7E9
    .byte $48 ; | X  X   | $D7EA
    .byte $5C ; | X XXX  | $D7EB
    .byte $5C ; | X XXX  | $D7EC
    .byte $5C ; | X XXX  | $D7ED
    .byte $68 ; | XX X   | $D7EE
    .byte $F0 ; |XXXX    | $D7EF
    .byte $F0 ; |XXXX    | $D7F0
    .byte $60 ; | XX     | $D7F1
    .byte $00 ; |        | $D7F2
    .byte $00 ; |        | $D7F3
    .byte $00 ; |        | $D7F4
    .byte $00 ; |        | $D7F5
    .byte $0C ; |    XX  | $D7F6
    .byte $08 ; |    X   | $D7F7
    .byte $08 ; |    X   | $D7F8
    .byte $08 ; |    X   | $D7F9
    .byte $08 ; |    X   | $D7FA
    .byte $1C ; |   XXX  | $D7FB
    .byte $1C ; |   XXX  | $D7FC
    .byte $3C ; |  XXXX  | $D7FD
    .byte $3C ; |  XXXX  | $D7FE
    .byte $3C ; |  XXXX  | $D7FF
    .byte $28 ; |  X X   | $D800
    .byte $5C ; | X XXX  | $D801
    .byte $5E ; | X XXXX | $D802
    .byte $5C ; | X XXX  | $D803
    .byte $88 ; |X   X   | $D804
    .byte $60 ; | XX     | $D805
    .byte $F0 ; |XXXX    | $D806
    .byte $F0 ; |XXXX    | $D807
    .byte $60 ; | XX     | $D808
    .byte $00 ; |        | $D809
    .byte $00 ; |        | $D80A
    .byte $00 ; |        | $D80B
    .byte $18 ; |   XX   | $D80C
    .byte $16 ; |   X XX | $D80D
    .byte $14 ; |   X X  | $D80E
    .byte $14 ; |   X X  | $D80F
    .byte $14 ; |   X X  | $D810
    .byte $1C ; |   XXX  | $D811
    .byte $1C ; |   XXX  | $D812
    .byte $3E ; |  XXXXX | $D813
    .byte $3C ; |  XXXX  | $D814
    .byte $3C ; |  XXXX  | $D815
    .byte $28 ; |  X X   | $D816
    .byte $5C ; | X XXX  | $D817
    .byte $5E ; | X XXXX | $D818
    .byte $5C ; | X XXX  | $D819
    .byte $88 ; |X   X   | $D81A
    .byte $60 ; | XX     | $D81B
    .byte $F0 ; |XXXX    | $D81C
    .byte $F0 ; |XXXX    | $D81D
    .byte $60 ; | XX     | $D81E
    .byte $00 ; |        | $D81F
    .byte $00 ; |        | $D820
    .byte $00 ; |        | $D821
    .byte $30 ; |  XX    | $D822
    .byte $23 ; |  X   XX| $D823
    .byte $22 ; |  X   X | $D824
    .byte $14 ; |   X X  | $D825
    .byte $14 ; |   X X  | $D826
    .byte $1C ; |   XXX  | $D827
    .byte $1C ; |   XXX  | $D828
    .byte $3E ; |  XXXXX | $D829
    .byte $3D ; |  XXXX X| $D82A
    .byte $3C ; |  XXXX  | $D82B
    .byte $28 ; |  X X   | $D82C
    .byte $5C ; | X XXX  | $D82D
    .byte $5E ; | X XXXX | $D82E
    .byte $5C ; | X XXX  | $D82F
    .byte $88 ; |X   X   | $D830
    .byte $60 ; | XX     | $D831
    .byte $F0 ; |XXXX    | $D832
    .byte $F0 ; |XXXX    | $D833
    .byte $60 ; | XX     | $D834
    .byte $00 ; |        | $D835
    .byte $00 ; |        | $D836
    .byte $00 ; |        | $D837
    .byte $06 ; |     XX | $D838
    .byte $44 ; | X   X  | $D839
    .byte $44 ; | X   X  | $D83A
    .byte $74 ; | XXX X  | $D83B
    .byte $14 ; |   X X  | $D83C
    .byte $1C ; |   XXX  | $D83D
    .byte $1C ; |   XXX  | $D83E
    .byte $3E ; |  XXXXX | $D83F
    .byte $3D ; |  XXXX X| $D840
    .byte $3D ; |  XXXX X| $D841
    .byte $28 ; |  X X   | $D842
    .byte $5C ; | X XXX  | $D843
    .byte $5E ; | X XXXX | $D844
    .byte $5C ; | X XXX  | $D845
    .byte $88 ; |X   X   | $D846
    .byte $60 ; | XX     | $D847
    .byte $F0 ; |XXXX    | $D848
    .byte $F0 ; |XXXX    | $D849
    .byte $60 ; | XX     | $D84A
    .byte $00 ; |        | $D84B
    .byte $00 ; |        | $D84C
    .byte $00 ; |        | $D84D
    .byte $06 ; |     XX | $D84E
    .byte $04 ; |     X  | $D84F
    .byte $34 ; |  XX X  | $D850
    .byte $14 ; |   X X  | $D851
    .byte $14 ; |   X X  | $D852
    .byte $1D ; |   XXX X| $D853
    .byte $1D ; |   XXX X| $D854
    .byte $1E ; |   XXXX | $D855
    .byte $1C ; |   XXX  | $D856
    .byte $3C ; |  XXXX  | $D857
    .byte $48 ; | X  X   | $D858
    .byte $5C ; | X XXX  | $D859
    .byte $5C ; | X XXX  | $D85A
    .byte $5C ; | X XXX  | $D85B
    .byte $68 ; | XX X   | $D85C
    .byte $F0 ; |XXXX    | $D85D
    .byte $F0 ; |XXXX    | $D85E
    .byte $60 ; | XX     | $D85F
    .byte $00 ; |        | $D860
    .byte $00 ; |        | $D861
    .byte $00 ; |        | $D862
    .byte $00 ; |        | $D863
    .byte $36 ; |  XX XX | $D864
    .byte $14 ; |   X X  | $D865
    .byte $14 ; |   X X  | $D866
    .byte $14 ; |   X X  | $D867
    .byte $14 ; |   X X  | $D868
    .byte $1C ; |   XXX  | $D869
    .byte $1D ; |   XXX X| $D86A
    .byte $1D ; |   XXX X| $D86B
    .byte $1E ; |   XXXX | $D86C
    .byte $3C ; |  XXXX  | $D86D
    .byte $48 ; | X  X   | $D86E
    .byte $5C ; | X XXX  | $D86F
    .byte $5C ; | X XXX  | $D870
    .byte $5C ; | X XXX  | $D871
    .byte $68 ; | XX X   | $D872
    .byte $F0 ; |XXXX    | $D873
    .byte $F0 ; |XXXX    | $D874
    .byte $60 ; | XX     | $D875
    .byte $00 ; |        | $D876
    .byte $00 ; |        | $D877
    .byte $00 ; |        | $D878
    .byte $00 ; |        | $D879
    .byte $30 ; |  XX    | $D87A
    .byte $10 ; |   X    | $D87B
    .byte $16 ; |   X XX | $D87C
    .byte $14 ; |   X X  | $D87D
    .byte $14 ; |   X X  | $D87E
    .byte $1C ; |   XXX  | $D87F
    .byte $1D ; |   XXX X| $D880
    .byte $1D ; |   XXX X| $D881
    .byte $1E ; |   XXXX | $D882
    .byte $3C ; |  XXXX  | $D883
    .byte $48 ; | X  X   | $D884
    .byte $5C ; | X XXX  | $D885
    .byte $5C ; | X XXX  | $D886
    .byte $5C ; | X XXX  | $D887
    .byte $68 ; | XX X   | $D888
    .byte $F0 ; |XXXX    | $D889
    .byte $F0 ; |XXXX    | $D88A
    .byte $60 ; | XX     | $D88B
    .byte $00 ; |        | $D88C
    .byte $00 ; |        | $D88D
    .byte $00 ; |        | $D88E
    .byte $00 ; |        | $D88F
    .byte $F8 ; |XXXXX   | $D890
    .byte $F8 ; |XXXXX   | $D891
    .byte $F8 ; |XXXXX   | $D892
    .byte $F8 ; |XXXXX   | $D893
    .byte $F8 ; |XXXXX   | $D894
    .byte $F8 ; |XXXXX   | $D895
    .byte $F8 ; |XXXXX   | $D896
    .byte $F8 ; |XXXXX   | $D897
    .byte $FC ; |XXXXXX  | $D898
    .byte $FC ; |XXXXXX  | $D899
    .byte $FC ; |XXXXXX  | $D89A
    .byte $FC ; |XXXXXX  | $D89B
    .byte $FC ; |XXXXXX  | $D89C
    .byte $FC ; |XXXXXX  | $D89D
    .byte $FC ; |XXXXXX  | $D89E
    .byte $FC ; |XXXXXX  | $D89F
    .byte $FE ; |XXXXXXX | $D8A0
    .byte $FE ; |XXXXXXX | $D8A1
    .byte $9E ; |X  XXXX | $D8A2
    .byte $1E ; |   XXXX | $D8A3
    .byte $0E ; |    XXX | $D8A4
    .byte $0E ; |    XXX | $D8A5
    .byte $0E ; |    XXX | $D8A6
    .byte $0E ; |    XXX | $D8A7
    .byte $0E ; |    XXX | $D8A8
    .byte $06 ; |     XX | $D8A9
    .byte $06 ; |     XX | $D8AA
    .byte $06 ; |     XX | $D8AB
    .byte $06 ; |     XX | $D8AC
    .byte $06 ; |     XX | $D8AD
    .byte $06 ; |     XX | $D8AE
    .byte $06 ; |     XX | $D8AF
    .byte $02 ; |      X | $D8B0
    .byte $02 ; |      X | $D8B1
    .byte $02 ; |      X | $D8B2
    .byte $02 ; |      X | $D8B3
    .byte $00 ; |        | $D8B4
    .byte $00 ; |        | $D8B5
    .byte $00 ; |        | $D8B6
    .byte $00 ; |        | $D8B7
    .byte $78 ; | XXXX   | $D8B8
    .byte $FC ; |XXXXXX  | $D8B9
    .byte $FC ; |XXXXXX  | $D8BA
    .byte $FC ; |XXXXXX  | $D8BB
    .byte $FC ; |XXXXXX  | $D8BC
    .byte $FC ; |XXXXXX  | $D8BD
    .byte $FC ; |XXXXXX  | $D8BE
    .byte $FC ; |XXXXXX  | $D8BF
    .byte $F8 ; |XXXXX   | $D8C0
    .byte $F8 ; |XXXXX   | $D8C1
    .byte $F8 ; |XXXXX   | $D8C2
    .byte $F8 ; |XXXXX   | $D8C3
    .byte $F8 ; |XXXXX   | $D8C4
    .byte $F8 ; |XXXXX   | $D8C5
    .byte $F8 ; |XXXXX   | $D8C6
    .byte $F8 ; |XXXXX   | $D8C7
    .byte $FC ; |XXXXXX  | $D8C8
    .byte $FC ; |XXXXXX  | $D8C9
    .byte $FC ; |XXXXXX  | $D8CA
    .byte $FC ; |XXXXXX  | $D8CB
    .byte $FC ; |XXXXXX  | $D8CC
    .byte $FC ; |XXXXXX  | $D8CD
    .byte $FC ; |XXXXXX  | $D8CE
    .byte $FC ; |XXXXXX  | $D8CF
    .byte $FE ; |XXXXXXX | $D8D0
    .byte $FE ; |XXXXXXX | $D8D1
    .byte $FE ; |XXXXXXX | $D8D2
    .byte $FE ; |XXXXXXX | $D8D3
    .byte $FE ; |XXXXXXX | $D8D4
    .byte $FE ; |XXXXXXX | $D8D5
    .byte $FE ; |XXXXXXX | $D8D6
    .byte $FE ; |XXXXXXX | $D8D7
    .byte $FE ; |XXXXXXX | $D8D8
    .byte $FE ; |XXXXXXX | $D8D9
    .byte $FE ; |XXXXXXX | $D8DA
    .byte $9E ; |X  XXXX | $D8DB
    .byte $0E ; |    XXX | $D8DC
    .byte $0E ; |    XXX | $D8DD
    .byte $07 ; |     XXX| $D8DE
    .byte $07 ; |     XXX| $D8DF
    .byte $07 ; |     XXX| $D8E0
    .byte $07 ; |     XXX| $D8E1
    .byte $02 ; |      X | $D8E2
    .byte $02 ; |      X | $D8E3
    .byte $02 ; |      X | $D8E4
    .byte $00 ; |        | $D8E5
    .byte $00 ; |        | $D8E6
    .byte $78 ; | XXXX   | $D8E7
    .byte $FC ; |XXXXXX  | $D8E8
    .byte $FC ; |XXXXXX  | $D8E9
    .byte $FC ; |XXXXXX  | $D8EA
    .byte $FC ; |XXXXXX  | $D8EB
    .byte $FC ; |XXXXXX  | $D8EC
    .byte $FC ; |XXXXXX  | $D8ED
    .byte $FC ; |XXXXXX  | $D8EE
    .byte $FC ; |XXXXXX  | $D8EF
    .byte $FC ; |XXXXXX  | $D8F0
    .byte $FC ; |XXXXXX  | $D8F1
    .byte $FC ; |XXXXXX  | $D8F2
    .byte $FC ; |XXXXXX  | $D8F3
    .byte $FC ; |XXXXXX  | $D8F4
    .byte $FC ; |XXXXXX  | $D8F5
    .byte $FC ; |XXXXXX  | $D8F6
    .byte $FC ; |XXXXXX  | $D8F7
    .byte $F8 ; |XXXXX   | $D8F8
    .byte $F8 ; |XXXXX   | $D8F9
    .byte $F8 ; |XXXXX   | $D8FA
    .byte $F8 ; |XXXXX   | $D8FB
    .byte $F8 ; |XXXXX   | $D8FC
    .byte $F8 ; |XXXXX   | $D8FD
    .byte $F8 ; |XXXXX   | $D8FE
    .byte $F8 ; |XXXXX   | $D8FF
    .byte $FC ; |XXXXXX  | $D900
    .byte $FC ; |XXXXXX  | $D901
    .byte $FC ; |XXXXXX  | $D902
    .byte $FC ; |XXXXXX  | $D903
    .byte $FC ; |XXXXXX  | $D904
    .byte $FC ; |XXXXXX  | $D905
    .byte $FC ; |XXXXXX  | $D906
    .byte $F8 ; |XXXXX   | $D907
    .byte $F8 ; |XXXXX   | $D908
    .byte $F8 ; |XXXXX   | $D909
    .byte $F8 ; |XXXXX   | $D90A
    .byte $FE ; |XXXXXXX | $D90B
    .byte $FE ; |XXXXXXX | $D90C
    .byte $FE ; |XXXXXXX | $D90D
    .byte $FE ; |XXXXXXX | $D90E
    .byte $FE ; |XXXXXXX | $D90F
    .byte $FE ; |XXXXXXX | $D910
    .byte $FE ; |XXXXXXX | $D911
    .byte $FE ; |XXXXXXX | $D912
    .byte $FE ; |XXXXXXX | $D913
    .byte $FE ; |XXXXXXX | $D914
    .byte $FE ; |XXXXXXX | $D915
    .byte $FE ; |XXXXXXX | $D916
    .byte $FE ; |XXXXXXX | $D917
    .byte $DE ; |XX XXXX | $D918
    .byte $8E ; |X   XXX | $D919
    .byte $06 ; |     XX | $D91A
    .byte $02 ; |      X | $D91B
    .byte $02 ; |      X | $D91C
    .byte $78 ; | XXXX   | $D91D
    .byte $FE ; |XXXXXXX | $D91E
    .byte $FE ; |XXXXXXX | $D91F
    .byte $FC ; |XXXXXX  | $D920
    .byte $FC ; |XXXXXX  | $D921
    .byte $FC ; |XXXXXX  | $D922
    .byte $FC ; |XXXXXX  | $D923
    .byte $FC ; |XXXXXX  | $D924
    .byte $FC ; |XXXXXX  | $D925
    .byte $FC ; |XXXXXX  | $D926
    .byte $FC ; |XXXXXX  | $D927
    .byte $F8 ; |XXXXX   | $D928
    .byte $F8 ; |XXXXX   | $D929
    .byte $F8 ; |XXXXX   | $D92A
    .byte $F8 ; |XXXXX   | $D92B
    .byte $F8 ; |XXXXX   | $D92C
    .byte $F8 ; |XXXXX   | $D92D
    .byte $F8 ; |XXXXX   | $D92E
    .byte $F8 ; |XXXXX   | $D92F
    .byte $00 ; |        | $D930
    .byte $F1 ; |XXXX   X| $D931
    .byte $00 ; |        | $D932
    .byte $00 ; |        | $D933
    .byte $F1 ; |XXXX   X| $D934
    .byte $00 ; |        | $D935
    .byte $F1 ; |XXXX   X| $D936
    .byte $00 ; |        | $D937
    .byte $00 ; |        | $D938
    .byte $F1 ; |XXXX   X| $D939
    .byte $00 ; |        | $D93A
    .byte $00 ; |        | $D93B
    .byte $F1 ; |XXXX   X| $D93C
    .byte $00 ; |        | $D93D
    .byte $00 ; |        | $D93E
    .byte $00 ; |        | $D93F
    .byte $F1 ; |XXXX   X| $D940
    .byte $F1 ; |XXXX   X| $D941
    .byte $00 ; |        | $D942
    .byte $00 ; |        | $D943
    .byte $00 ; |        | $D944
    .byte $F1 ; |XXXX   X| $D945
    .byte $00 ; |        | $D946
    .byte $F1 ; |XXXX   X| $D947
    .byte $00 ; |        | $D948
    .byte $00 ; |        | $D949
    .byte $F1 ; |XXXX   X| $D94A
    .byte $00 ; |        | $D94B
    .byte $00 ; |        | $D94C
    .byte $00 ; |        | $D94D
    .byte $00 ; |        | $D94E
    .byte $00 ; |        | $D94F
    .byte $00 ; |        | $D950
    .byte $00 ; |        | $D951
    .byte $1F ; |   XXXXX| $D952
    .byte $00 ; |        | $D953
    .byte $1F ; |   XXXXX| $D954
    .byte $00 ; |        | $D955
    .byte $00 ; |        | $D956
    .byte $1F ; |   XXXXX| $D957
    .byte $1F ; |   XXXXX| $D958
    .byte $00 ; |        | $D959
    .byte $1F ; |   XXXXX| $D95A
    .byte $00 ; |        | $D95B
    .byte $00 ; |        | $D95C
    .byte $1F ; |   XXXXX| $D95D
    .byte $00 ; |        | $D95E
    .byte $1F ; |   XXXXX| $D95F
    .byte $00 ; |        | $D960
    .byte $1F ; |   XXXXX| $D961
    .byte $00 ; |        | $D962
    .byte $1F ; |   XXXXX| $D963
    .byte $1F ; |   XXXXX| $D964
    .byte $1F ; |   XXXXX| $D965
    .byte $00 ; |        | $D966
    .byte $20 ; |  X     | $D967
    .byte $00 ; |        | $D968
    .byte $F1 ; |XXXX   X| $D969
    .byte $00 ; |        | $D96A
    .byte $00 ; |        | $D96B
    .byte $F1 ; |XXXX   X| $D96C
    .byte $00 ; |        | $D96D
    .byte $00 ; |        | $D96E
    .byte $00 ; |        | $D96F
    .byte $F1 ; |XXXX   X| $D970
    .byte $00 ; |        | $D971
    .byte $00 ; |        | $D972
    .byte $F1 ; |XXXX   X| $D973
    .byte $00 ; |        | $D974
    .byte $F1 ; |XXXX   X| $D975
    .byte $00 ; |        | $D976
    .byte $F1 ; |XXXX   X| $D977
    .byte $00 ; |        | $D978
    .byte $00 ; |        | $D979
    .byte $F1 ; |XXXX   X| $D97A
    .byte $00 ; |        | $D97B
    .byte $00 ; |        | $D97C
    .byte $F1 ; |XXXX   X| $D97D
    .byte $00 ; |        | $D97E
    .byte $00 ; |        | $D97F
    .byte $F1 ; |XXXX   X| $D980
    .byte $00 ; |        | $D981
    .byte $F1 ; |XXXX   X| $D982
    .byte $00 ; |        | $D983
    .byte $F1 ; |XXXX   X| $D984
    .byte $00 ; |        | $D985
    .byte $00 ; |        | $D986
    .byte $00 ; |        | $D987
    .byte $00 ; |        | $D988
    .byte $00 ; |        | $D989
    .byte $00 ; |        | $D98A
    .byte $1F ; |   XXXXX| $D98B
    .byte $00 ; |        | $D98C
    .byte $00 ; |        | $D98D
    .byte $00 ; |        | $D98E
    .byte $1F ; |   XXXXX| $D98F
    .byte $00 ; |        | $D990
    .byte $1F ; |   XXXXX| $D991
    .byte $00 ; |        | $D992
    .byte $1F ; |   XXXXX| $D993
    .byte $00 ; |        | $D994
    .byte $1F ; |   XXXXX| $D995
    .byte $1F ; |   XXXXX| $D996
    .byte $00 ; |        | $D997
    .byte $1F ; |   XXXXX| $D998
    .byte $00 ; |        | $D999
    .byte $00 ; |        | $D99A
    .byte $1F ; |   XXXXX| $D99B
    .byte $1F ; |   XXXXX| $D99C
    .byte $1F ; |   XXXXX| $D99D
    .byte $1F ; |   XXXXX| $D99E
    .byte $20 ; |  X     | $D99F
    .byte $00 ; |        | $D9A0
    .byte $00 ; |        | $D9A1
    .byte $00 ; |        | $D9A2
    .byte $00 ; |        | $D9A3
    .byte $F1 ; |XXXX   X| $D9A4
    .byte $00 ; |        | $D9A5
    .byte $00 ; |        | $D9A6
    .byte $F1 ; |XXXX   X| $D9A7
    .byte $00 ; |        | $D9A8
    .byte $00 ; |        | $D9A9
    .byte $00 ; |        | $D9AA
    .byte $00 ; |        | $D9AB
    .byte $F1 ; |XXXX   X| $D9AC
    .byte $00 ; |        | $D9AD
    .byte $00 ; |        | $D9AE
    .byte $F1 ; |XXXX   X| $D9AF
    .byte $00 ; |        | $D9B0
    .byte $F1 ; |XXXX   X| $D9B1
    .byte $00 ; |        | $D9B2
    .byte $F1 ; |XXXX   X| $D9B3
    .byte $00 ; |        | $D9B4
    .byte $F1 ; |XXXX   X| $D9B5
    .byte $00 ; |        | $D9B6
    .byte $00 ; |        | $D9B7
    .byte $F1 ; |XXXX   X| $D9B8
    .byte $00 ; |        | $D9B9
    .byte $00 ; |        | $D9BA
    .byte $F1 ; |XXXX   X| $D9BB
    .byte $00 ; |        | $D9BC
    .byte $00 ; |        | $D9BD
    .byte $F1 ; |XXXX   X| $D9BE
    .byte $00 ; |        | $D9BF
    .byte $00 ; |        | $D9C0
    .byte $00 ; |        | $D9C1
    .byte $00 ; |        | $D9C2
    .byte $00 ; |        | $D9C3
    .byte $00 ; |        | $D9C4
    .byte $00 ; |        | $D9C5
    .byte $00 ; |        | $D9C6
    .byte $00 ; |        | $D9C7
    .byte $00 ; |        | $D9C8
    .byte $1F ; |   XXXXX| $D9C9
    .byte $00 ; |        | $D9CA
    .byte $1F ; |   XXXXX| $D9CB
    .byte $1F ; |   XXXXX| $D9CC
    .byte $00 ; |        | $D9CD
    .byte $1F ; |   XXXXX| $D9CE
    .byte $1F ; |   XXXXX| $D9CF
    .byte $00 ; |        | $D9D0
    .byte $1F ; |   XXXXX| $D9D1
    .byte $1F ; |   XXXXX| $D9D2
    .byte $00 ; |        | $D9D3
    .byte $1F ; |   XXXXX| $D9D4
    .byte $1F ; |   XXXXX| $D9D5
    .byte $1F ; |   XXXXX| $D9D6
    .byte $11 ; |   X   X| $D9D7
    lda    ram_87                ; 3
    sta    REFP1                 ; 3
    lda    ram_84                ; 3
    and    #$07                  ; 2
    tax                          ; 2
    lda    SWCHB                 ; 4
    and    #$08                  ; 2
    bne    LD9EA                 ; 2³
    ldx    #$08                  ; 2
LD9EA:
    ldy    LDBE9,X               ; 4
    lda    ram_85                ; 3
    and    #$41                  ; 2
    beq    LD9F9                 ; 2³
    tya                          ; 2
    and    #$F0                  ; 2
    ora    #$02                  ; 2
    tay                          ; 2
LD9F9:
    lda    ram_80                ; 3
    cmp    #$10                  ; 2
    bcc    LDA05                 ; 2³+1
    lda    ram_A1                ; 3
    bne    LDA05                 ; 2³
    ldy    #$00                  ; 2
LDA05:
    sty    ram_88                ; 3
    lda    ram_A1                ; 3
    beq    LDA0D                 ; 2³
    dec    ram_A1                ; 5
LDA0D:
    lda    LDBF2,X               ; 4
    sta    ram_8A                ; 3
    lda    LDFE2,X               ; 4
    sta    ram_89                ; 3
    lda    #$36                  ; 2
    sta    ram_8B                ; 3
    lda    #$C6                  ; 2
    sta    ram_8C                ; 3
    lda    #$00                  ; 2
    ldx    ram_80                ; 3
    cpx    #$04                  ; 2
    bcc    LDA2B                 ; 2³
    ldx    ram_83                ; 3
    lda    ram_8B,X              ; 4
LDA2B:
    sta    ram_8D                ; 3
    bit    ram_85                ; 3
    bvs    LDA4D                 ; 2³
    lda    ram_83                ; 3
    tax                          ; 2
    eor    #$01                  ; 2
    tay                          ; 2
    lda    #$04                  ; 2
    sta.wy ram_8B,Y              ; 5
    lda    ram_85                ; 3
    lsr                          ; 2
    bcc    LDA45                 ; 2³
    lda    #$04                  ; 2
    sta    ram_8B,X              ; 4
LDA45:
    bit    ram_82                ; 3
    bmi    LDA4D                 ; 2³
    lda    #$00                  ; 2
    sta    ram_8C                ; 3
LDA4D:
    lda    ram_9F                ; 3
    bne    LDA53                 ; 2³
    sta    ram_8B                ; 3
LDA53:
    lda    ram_A0                ; 3
    bne    LDA59                 ; 2³
    sta    ram_8C                ; 3
LDA59:
    lda    ram_9F                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    #$F6                  ; 2
    sta    ram_F8                ; 3
    lda    #$C8                  ; 2
    sta    ram_F7                ; 3
    jmp    LDFF2                 ; 3

    .byte $00 ; |        | $DA6B
    .byte $00 ; |        | $DA6C
    .byte $00 ; |        | $DA6D
    .byte $00 ; |        | $DA6E
    .byte $00 ; |        | $DA6F
    .byte $00 ; |        | $DA70
    .byte $00 ; |        | $DA71
    .byte $00 ; |        | $DA72
    .byte $00 ; |        | $DA73
    .byte $10 ; |   X    | $DA74
LDA75:
    .byte $00 ; |        | $DA75
    .byte $00 ; |        | $DA76
    .byte $10 ; |   X    | $DA77
    .byte $00 ; |        | $DA78
    .byte $00 ; |        | $DA79
    .byte $10 ; |   X    | $DA7A
    .byte $00 ; |        | $DA7B
    .byte $00 ; |        | $DA7C
    .byte $10 ; |   X    | $DA7D
    .byte $00 ; |        | $DA7E
    .byte $00 ; |        | $DA7F
    .byte $00 ; |        | $DA80
    .byte $10 ; |   X    | $DA81
    .byte $00 ; |        | $DA82
    .byte $00 ; |        | $DA83
    .byte $10 ; |   X    | $DA84
    .byte $00 ; |        | $DA85
    .byte $00 ; |        | $DA86
    .byte $10 ; |   X    | $DA87
    .byte $00 ; |        | $DA88
    .byte $00 ; |        | $DA89
    .byte $00 ; |        | $DA8A
    .byte $10 ; |   X    | $DA8B
    .byte $00 ; |        | $DA8C
    .byte $00 ; |        | $DA8D
    .byte $10 ; |   X    | $DA8E
    .byte $00 ; |        | $DA8F
    .byte $00 ; |        | $DA90
    .byte $10 ; |   X    | $DA91
    .byte $00 ; |        | $DA92
    .byte $00 ; |        | $DA93
    .byte $00 ; |        | $DA94
    .byte $10 ; |   X    | $DA95
    .byte $00 ; |        | $DA96
    .byte $00 ; |        | $DA97
    .byte $10 ; |   X    | $DA98
    .byte $00 ; |        | $DA99
    .byte $00 ; |        | $DA9A
    .byte $10 ; |   X    | $DA9B
    .byte $00 ; |        | $DA9C
    .byte $00 ; |        | $DA9D
    .byte $00 ; |        | $DA9E
    .byte $10 ; |   X    | $DA9F
    .byte $00 ; |        | $DAA0
    .byte $00 ; |        | $DAA1
    .byte $10 ; |   X    | $DAA2
    .byte $00 ; |        | $DAA3
    .byte $00 ; |        | $DAA4
    .byte $10 ; |   X    | $DAA5
    .byte $00 ; |        | $DAA6
    .byte $00 ; |        | $DAA7
    .byte $00 ; |        | $DAA8
    .byte $00 ; |        | $DAA9
    .byte $00 ; |        | $DAAA
    .byte $00 ; |        | $DAAB
    .byte $00 ; |        | $DAAC
    .byte $00 ; |        | $DAAD
    .byte $18 ; |   XX   | $DAAE
    .byte $3C ; |  XXXX  | $DAAF
    .byte $3C ; |  XXXX  | $DAB0
    .byte $7E ; | XXXXXX | $DAB1
    .byte $7E ; | XXXXXX | $DAB2
    .byte $7E ; | XXXXXX | $DAB3
    .byte $FF ; |XXXXXXXX| $DAB4
    .byte $FF ; |XXXXXXXX| $DAB5
    .byte $FF ; |XXXXXXXX| $DAB6
    .byte $F3 ; |XXXX  XX| $DAB7
    .byte $F3 ; |XXXX  XX| $DAB8
    .byte $F3 ; |XXXX  XX| $DAB9
    .byte $F3 ; |XXXX  XX| $DABA
    .byte $F3 ; |XXXX  XX| $DABB
    .byte $F3 ; |XXXX  XX| $DABC
    .byte $F3 ; |XXXX  XX| $DABD
    .byte $7E ; | XXXXXX | $DABE
    .byte $7E ; | XXXXXX | $DABF
    .byte $7E ; | XXXXXX | $DAC0
    .byte $3C ; |  XXXX  | $DAC1
    .byte $3C ; |  XXXX  | $DAC2
    .byte $18 ; |   XX   | $DAC3
    .byte $00 ; |        | $DAC4
    .byte $18 ; |   XX   | $DAC5
    .byte $3C ; |  XXXX  | $DAC6
    .byte $3C ; |  XXXX  | $DAC7
    .byte $7E ; | XXXXXX | $DAC8
    .byte $7E ; | XXXXXX | $DAC9
    .byte $7E ; | XXXXXX | $DACA
    .byte $F3 ; |XXXX  XX| $DACB
    .byte $F3 ; |XXXX  XX| $DACC
    .byte $F3 ; |XXXX  XX| $DACD
    .byte $F3 ; |XXXX  XX| $DACE
    .byte $F3 ; |XXXX  XX| $DACF
    .byte $F3 ; |XXXX  XX| $DAD0
    .byte $F3 ; |XXXX  XX| $DAD1
    .byte $FF ; |XXXXXXXX| $DAD2
    .byte $FF ; |XXXXXXXX| $DAD3
    .byte $FF ; |XXXXXXXX| $DAD4
    .byte $7E ; | XXXXXX | $DAD5
    .byte $7E ; | XXXXXX | $DAD6
    .byte $7E ; | XXXXXX | $DAD7
    .byte $3C ; |  XXXX  | $DAD8
    .byte $3C ; |  XXXX  | $DAD9
    .byte $18 ; |   XX   | $DADA
    .byte $00 ; |        | $DADB
    .byte $18 ; |   XX   | $DADC
    .byte $3C ; |  XXXX  | $DADD
    .byte $3C ; |  XXXX  | $DADE
    .byte $7E ; | XXXXXX | $DADF
    .byte $7E ; | XXXXXX | $DAE0
    .byte $7E ; | XXXXXX | $DAE1
    .byte $CF ; |XX  XXXX| $DAE2
    .byte $CF ; |XX  XXXX| $DAE3
    .byte $CF ; |XX  XXXX| $DAE4
    .byte $CF ; |XX  XXXX| $DAE5
    .byte $CF ; |XX  XXXX| $DAE6
    .byte $CF ; |XX  XXXX| $DAE7
    .byte $CF ; |XX  XXXX| $DAE8
    .byte $FF ; |XXXXXXXX| $DAE9
    .byte $FF ; |XXXXXXXX| $DAEA
    .byte $FF ; |XXXXXXXX| $DAEB
    .byte $7E ; | XXXXXX | $DAEC
    .byte $7E ; | XXXXXX | $DAED
    .byte $7E ; | XXXXXX | $DAEE
    .byte $3C ; |  XXXX  | $DAEF
    .byte $3C ; |  XXXX  | $DAF0
    .byte $18 ; |   XX   | $DAF1
    .byte $00 ; |        | $DAF2
    .byte $18 ; |   XX   | $DAF3
    .byte $3C ; |  XXXX  | $DAF4
    .byte $3C ; |  XXXX  | $DAF5
    .byte $7E ; | XXXXXX | $DAF6
    .byte $7E ; | XXXXXX | $DAF7
    .byte $7E ; | XXXXXX | $DAF8
    .byte $FF ; |XXXXXXXX| $DAF9
    .byte $FF ; |XXXXXXXX| $DAFA
    .byte $FF ; |XXXXXXXX| $DAFB
    .byte $CF ; |XX  XXXX| $DAFC
    .byte $CF ; |XX  XXXX| $DAFD
    .byte $CF ; |XX  XXXX| $DAFE
    .byte $CF ; |XX  XXXX| $DAFF
    .byte $CF ; |XX  XXXX| $DB00
    .byte $CF ; |XX  XXXX| $DB01
    .byte $CF ; |XX  XXXX| $DB02
    .byte $7E ; | XXXXXX | $DB03
    .byte $7E ; | XXXXXX | $DB04
    .byte $7E ; | XXXXXX | $DB05
    .byte $3C ; |  XXXX  | $DB06
    .byte $3C ; |  XXXX  | $DB07
    .byte $18 ; |   XX   | $DB08
LDB09:
    .byte $00 ; |        | $DB09
    .byte $04 ; |     X  | $DB0A
    .byte $04 ; |     X  | $DB0B
    .byte $04 ; |     X  | $DB0C
    .byte $04 ; |     X  | $DB0D
    .byte $05 ; |     X X| $DB0E
    .byte $06 ; |     XX | $DB0F
    .byte $04 ; |     X  | $DB10
    .byte $00 ; |        | $DB11
    .byte $00 ; |        | $DB12
    .byte $45 ; | X   X X| $DB13
    .byte $45 ; | X   X X| $DB14
    .byte $45 ; | X   X X| $DB15
    .byte $45 ; | X   X X| $DB16
    .byte $55 ; | X X X X| $DB17
    .byte $6C ; | XX XX  | $DB18
    .byte $44 ; | X   X  | $DB19
    .byte $00 ; |        | $DB1A
    .byte $00 ; |        | $DB1B
    .byte $07 ; |     XXX| $DB1C
    .byte $04 ; |     X  | $DB1D
    .byte $04 ; |     X  | $DB1E
    .byte $04 ; |     X  | $DB1F
    .byte $04 ; |     X  | $DB20
    .byte $04 ; |     X  | $DB21
    .byte $07 ; |     XXX| $DB22
LDB23:
    .byte $00 ; |        | $DB23
    .byte $BA ; |X XXX X | $DB24
    .byte $AA ; |X X X X | $DB25
    .byte $AA ; |X X X X | $DB26
    .byte $AA ; |X X X X | $DB27
    .byte $AA ; |X X X X | $DB28
    .byte $03 ; |      XX| $DB29
    .byte $02 ; |      X | $DB2A
    .byte $00 ; |        | $DB2B
    .byte $00 ; |        | $DB2C
    .byte $AB ; |X X X XX| $DB2D
    .byte $2A ; |  X X X | $DB2E
    .byte $AA ; |X X X X | $DB2F
    .byte $AA ; |X X X X | $DB30
    .byte $BB ; |X XXX XX| $DB31
    .byte $00 ; |        | $DB32
    .byte $00 ; |        | $DB33
    .byte $00 ; |        | $DB34
    .byte $00 ; |        | $DB35
    .byte $DD ; |XX XXX X| $DB36
    .byte $55 ; | X X X X| $DB37
    .byte $54 ; | X X X  | $DB38
    .byte $54 ; | X X X  | $DB39
    .byte $DC ; |XX XXX  | $DB3A
    .byte $01 ; |       X| $DB3B
    .byte $01 ; |       X| $DB3C
LDB3D:
    .byte $00 ; |        | $DB3D
    .byte $5D ; | X XXX X| $DB3E
    .byte $51 ; | X X   X| $DB3F
    .byte $51 ; | X X   X| $DB40
    .byte $51 ; | X X   X| $DB41
    .byte $DD ; |XX XXX X| $DB42
    .byte $01 ; |       X| $DB43
    .byte $01 ; |       X| $DB44
    .byte $00 ; |        | $DB45
    .byte $00 ; |        | $DB46
    .byte $C9 ; |XX  X  X| $DB47
    .byte $49 ; | X  X  X| $DB48
    .byte $C9 ; |XX  X  X| $DB49
    .byte $09 ; |    X  X| $DB4A
    .byte $C9 ; |XX  X  X| $DB4B
    .byte $1C ; |   XXX  | $DB4C
    .byte $08 ; |    X   | $DB4D
    .byte $00 ; |        | $DB4E
    .byte $00 ; |        | $DB4F
    .byte $AA ; |X X X X | $DB50
    .byte $AA ; |X X X X | $DB51
    .byte $B2 ; |X XX  X | $DB52
    .byte $AA ; |X X X X | $DB53
    .byte $AA ; |X X X X | $DB54
    .byte $20 ; |  X     | $DB55
    .byte $22 ; |  X   X | $DB56
LDB57:
    .byte $00 ; |        | $DB57
    .byte $02 ; |      X | $DB58
    .byte $02 ; |      X | $DB59
    .byte $02 ; |      X | $DB5A
    .byte $02 ; |      X | $DB5B
    .byte $03 ; |      XX| $DB5C
    .byte $00 ; |        | $DB5D
    .byte $00 ; |        | $DB5E
    .byte $00 ; |        | $DB5F
    .byte $00 ; |        | $DB60
    .byte $0B ; |    X XX| $DB61
    .byte $08 ; |    X   | $DB62
    .byte $0B ; |    X XX| $DB63
    .byte $0A ; |    X X | $DB64
    .byte $3B ; |  XXX XX| $DB65
    .byte $00 ; |        | $DB66
    .byte $00 ; |        | $DB67
    .byte $00 ; |        | $DB68
    .byte $00 ; |        | $DB69
    .byte $07 ; |     XXX| $DB6A
    .byte $01 ; |       X| $DB6B
    .byte $07 ; |     XXX| $DB6C
    .byte $05 ; |     X X| $DB6D
    .byte $07 ; |     XXX| $DB6E
    .byte $00 ; |        | $DB6F
    .byte $00 ; |        | $DB70
LDB71:
    .byte $78 ; | XXXX   | $DB71
    .byte $84 ; |X    X  | $DB72
    .byte $B4 ; |X XX X  | $DB73
    .byte $A4 ; |X X  X  | $DB74
    .byte $B4 ; |X XX X  | $DB75
    .byte $84 ; |X    X  | $DB76
    .byte $78 ; | XXXX   | $DB77
LDB78:
    .byte $55 ; | X X X X| $DB78
    .byte $55 ; | X X X X| $DB79
    .byte $55 ; | X X X X| $DB7A
    .byte $75 ; | XXX X X| $DB7B
    .byte $55 ; | X X X X| $DB7C
    .byte $55 ; | X X X X| $DB7D
    .byte $2E ; |  X XXX | $DB7E
LDB7F:
    .byte $55 ; | X X X X| $DB7F
    .byte $55 ; | X X X X| $DB80
    .byte $55 ; | X X X X| $DB81
    .byte $D9 ; |XX XX  X| $DB82
    .byte $55 ; | X X X X| $DB83
    .byte $55 ; | X X X X| $DB84
    .byte $99 ; |X  XX  X| $DB85
LDB86:
    .byte $31 ; |  XX   X| $DB86
    .byte $4A ; | X  X X | $DB87
    .byte $42 ; | X    X | $DB88
    .byte $42 ; | X    X | $DB89
    .byte $42 ; | X    X | $DB8A
    .byte $4A ; | X  X X | $DB8B
    .byte $31 ; |  XX   X| $DB8C
LDB8D:
    .byte $8A ; |X   X X | $DB8D
    .byte $55 ; | X X X X| $DB8E
    .byte $15 ; |   X X X| $DB8F
    .byte $15 ; |   X X X| $DB90
    .byte $11 ; |   X   X| $DB91
    .byte $51 ; | X X   X| $DB92
    .byte $91 ; |X  X   X| $DB93
LDB94:
    .byte $12 ; |   X  X | $DB94
    .byte $15 ; |   X X X| $DB95
    .byte $11 ; |   X   X| $DB96
    .byte $13 ; |   X  XX| $DB97
    .byte $15 ; |   X X X| $DB98
    .byte $35 ; |  XX X X| $DB99
    .byte $12 ; |   X  X | $DB9A
    .byte $FF ; |XXXXXXXX| $DB9B
    .byte $FF ; |XXXXXXXX| $DB9C
    .byte $FF ; |XXXXXXXX| $DB9D
    .byte $FF ; |XXXXXXXX| $DB9E
    .byte $FF ; |XXXXXXXX| $DB9F
    .byte $FF ; |XXXXXXXX| $DBA0
    .byte $FF ; |XXXXXXXX| $DBA1
    .byte $FF ; |XXXXXXXX| $DBA2
    .byte $FF ; |XXXXXXXX| $DBA3
    .byte $FE ; |XXXXXXX | $DBA4
    .byte $FE ; |XXXXXXX | $DBA5
    .byte $FE ; |XXXXXXX | $DBA6
    .byte $FE ; |XXXXXXX | $DBA7
    .byte $FC ; |XXXXXX  | $DBA8
    .byte $FC ; |XXXXXX  | $DBA9
    .byte $FC ; |XXXXXX  | $DBAA
    .byte $FC ; |XXXXXX  | $DBAB
    .byte $F8 ; |XXXXX   | $DBAC
    .byte $F8 ; |XXXXX   | $DBAD
    .byte $FC ; |XXXXXX  | $DBAE
    .byte $FC ; |XXXXXX  | $DBAF
    .byte $FE ; |XXXXXXX | $DBB0
    .byte $FE ; |XXXXXXX | $DBB1
    .byte $FE ; |XXXXXXX | $DBB2
    .byte $FF ; |XXXXXXXX| $DBB3
    .byte $FF ; |XXXXXXXX| $DBB4
    .byte $FF ; |XXXXXXXX| $DBB5
    .byte $EF ; |XXX XXXX| $DBB6
    .byte $F7 ; |XXXX XXX| $DBB7
    .byte $FB ; |XXXXX XX| $DBB8
    .byte $F9 ; |XXXXX  X| $DBB9
    .byte $FC ; |XXXXXX  | $DBBA
    .byte $FE ; |XXXXXXX | $DBBB
    .byte $FE ; |XXXXXXX | $DBBC
    .byte $FF ; |XXXXXXXX| $DBBD
    .byte $FF ; |XXXXXXXX| $DBBE
    .byte $F7 ; |XXXX XXX| $DBBF
    .byte $FB ; |XXXXX XX| $DBC0
    .byte $FD ; |XXXXXX X| $DBC1
    .byte $FE ; |XXXXXXX | $DBC2
    .byte $FE ; |XXXXXXX | $DBC3
    .byte $FF ; |XXXXXXXX| $DBC4
    .byte $FF ; |XXXXXXXX| $DBC5
    .byte $EF ; |XXX XXXX| $DBC6
    .byte $EF ; |XXX XXXX| $DBC7
    .byte $F7 ; |XXXX XXX| $DBC8
    .byte $F3 ; |XXXX  XX| $DBC9
    .byte $FB ; |XXXXX XX| $DBCA
    .byte $FC ; |XXXXXX  | $DBCB
    .byte $7C ; | XXXXX  | $DBCC
    .byte $7C ; | XXXXX  | $DBCD
    .byte $7C ; | XXXXX  | $DBCE
    .byte $3C ; |  XXXX  | $DBCF
    .byte $3C ; |  XXXX  | $DBD0
    .byte $1C ; |   XXX  | $DBD1
    .byte $08 ; |    X   | $DBD2
    .byte $84 ; |X    X  | $DBD3
    .byte $84 ; |X    X  | $DBD4
    .byte $84 ; |X    X  | $DBD5
    .byte $84 ; |X    X  | $DBD6
    .byte $84 ; |X    X  | $DBD7
    .byte $84 ; |X    X  | $DBD8
    .byte $84 ; |X    X  | $DBD9
    .byte $84 ; |X    X  | $DBDA
    .byte $84 ; |X    X  | $DBDB
    .byte $84 ; |X    X  | $DBDC
    .byte $84 ; |X    X  | $DBDD
    .byte $84 ; |X    X  | $DBDE
    .byte $84 ; |X    X  | $DBDF
    .byte $84 ; |X    X  | $DBE0
    .byte $84 ; |X    X  | $DBE1
    .byte $84 ; |X    X  | $DBE2
    .byte $84 ; |X    X  | $DBE3
    .byte $0E ; |    XXX | $DBE4
    .byte $28 ; |  X X   | $DBE5
    .byte $28 ; |  X X   | $DBE6
    .byte $28 ; |  X X   | $DBE7
    .byte $28 ; |  X X   | $DBE8
LDBE9:
    .byte $C6 ; |XX   XX | $DBE9
    .byte $EC ; |XXX XX  | $DBEA
    .byte $32 ; |  XX  X | $DBEB
    .byte $52 ; | X X  X | $DBEC
    .byte $46 ; | X   XX | $DBED
    .byte $F4 ; |XXXX X  | $DBEE
    .byte $8A ; |X   X X | $DBEF
    .byte $0B ; |    X XX| $DBF0
    .byte $08 ; |    X   | $DBF1
LDBF2:
    .byte $52 ; | X X  X | $DBF2
    .byte $C6 ; |XX   XX | $DBF3
    .byte $52 ; | X X  X | $DBF4
    .byte $32 ; |  XX  X | $DBF5
    .byte $52 ; | X X  X | $DBF6
    .byte $C6 ; |XX   XX | $DBF7
    .byte $32 ; |  XX  X | $DBF8
    .byte $52 ; | X X  X | $DBF9
    .byte $06 ; |     XX | $DBFA
    .byte $00 ; |        | $DBFB
    .byte $00 ; |        | $DBFC
    .byte $00 ; |        | $DBFD
    .byte $00 ; |        | $DBFE
    .byte $00 ; |        | $DBFF
    .byte $00 ; |        | $DC00
    .byte $00 ; |        | $DC01
    .byte $00 ; |        | $DC02
    .byte $C0 ; |XX      | $DC03
    .byte $C0 ; |XX      | $DC04
    .byte $00 ; |        | $DC05
    .byte $00 ; |        | $DC06
    .byte $00 ; |        | $DC07
    .byte $00 ; |        | $DC08
    .byte $C0 ; |XX      | $DC09
    .byte $00 ; |        | $DC0A
    .byte $00 ; |        | $DC0B
    .byte $00 ; |        | $DC0C
    .byte $00 ; |        | $DC0D
    .byte $00 ; |        | $DC0E
    .byte $00 ; |        | $DC0F
    .byte $C0 ; |XX      | $DC10
    .byte $00 ; |        | $DC11
    .byte $00 ; |        | $DC12
    .byte $C0 ; |XX      | $DC13
    .byte $00 ; |        | $DC14
    .byte $00 ; |        | $DC15
    .byte $00 ; |        | $DC16
    .byte $C0 ; |XX      | $DC17
    .byte $C0 ; |XX      | $DC18
    .byte $C0 ; |XX      | $DC19
    .byte $C0 ; |XX      | $DC1A
    .byte $00 ; |        | $DC1B
    .byte $00 ; |        | $DC1C
    .byte $C0 ; |XX      | $DC1D
    .byte $00 ; |        | $DC1E
    .byte $00 ; |        | $DC1F
    .byte $00 ; |        | $DC20
    .byte $00 ; |        | $DC21
    .byte $00 ; |        | $DC22
    .byte $00 ; |        | $DC23
    .byte $00 ; |        | $DC24
    .byte $00 ; |        | $DC25
    .byte $00 ; |        | $DC26
    .byte $C0 ; |XX      | $DC27
    .byte $00 ; |        | $DC28
    .byte $00 ; |        | $DC29
    .byte $00 ; |        | $DC2A
    .byte $00 ; |        | $DC2B
    .byte $00 ; |        | $DC2C
    .byte $00 ; |        | $DC2D
    .byte $00 ; |        | $DC2E
    .byte $00 ; |        | $DC2F
    .byte $00 ; |        | $DC30
    .byte $C0 ; |XX      | $DC31
    .byte $C0 ; |XX      | $DC32
    .byte $00 ; |        | $DC33
    .byte $00 ; |        | $DC34
    .byte $00 ; |        | $DC35
    .byte $00 ; |        | $DC36
    .byte $00 ; |        | $DC37
    .byte $00 ; |        | $DC38
    .byte $00 ; |        | $DC39
    .byte $00 ; |        | $DC3A
    .byte $C0 ; |XX      | $DC3B
    .byte $00 ; |        | $DC3C
    .byte $00 ; |        | $DC3D
    .byte $00 ; |        | $DC3E
    .byte $00 ; |        | $DC3F
    .byte $00 ; |        | $DC40
    .byte $00 ; |        | $DC41
    .byte $C0 ; |XX      | $DC42
    .byte $00 ; |        | $DC43
    .byte $00 ; |        | $DC44
    .byte $C0 ; |XX      | $DC45
    .byte $00 ; |        | $DC46
    .byte $00 ; |        | $DC47
    .byte $00 ; |        | $DC48
    .byte $00 ; |        | $DC49
    .byte $C0 ; |XX      | $DC4A
    .byte $C0 ; |XX      | $DC4B
    .byte $C0 ; |XX      | $DC4C
    .byte $00 ; |        | $DC4D
    .byte $00 ; |        | $DC4E
    .byte $C0 ; |XX      | $DC4F
    .byte $00 ; |        | $DC50
    .byte $00 ; |        | $DC51
    .byte $C0 ; |XX      | $DC52
    .byte $C0 ; |XX      | $DC53
    .byte $C0 ; |XX      | $DC54
    .byte $C0 ; |XX      | $DC55
    .byte $C0 ; |XX      | $DC56
    .byte $00 ; |        | $DC57
    .byte $00 ; |        | $DC58
    .byte $C0 ; |XX      | $DC59
    .byte $00 ; |        | $DC5A
    .byte $00 ; |        | $DC5B
    .byte $C0 ; |XX      | $DC5C
    .byte $C0 ; |XX      | $DC5D
    .byte $C0 ; |XX      | $DC5E
    .byte $00 ; |        | $DC5F
    .byte $00 ; |        | $DC60
    .byte $00 ; |        | $DC61
    .byte $00 ; |        | $DC62
    .byte $C0 ; |XX      | $DC63
    .byte $00 ; |        | $DC64
    .byte $00 ; |        | $DC65
    .byte $C0 ; |XX      | $DC66
    .byte $00 ; |        | $DC67
    .byte $00 ; |        | $DC68
    .byte $C0 ; |XX      | $DC69
    .byte $C0 ; |XX      | $DC6A
    .byte $00 ; |        | $DC6B
    .byte $00 ; |        | $DC6C
    .byte $C0 ; |XX      | $DC6D
    .byte $C0 ; |XX      | $DC6E
    .byte $00 ; |        | $DC6F
    .byte $C0 ; |XX      | $DC70
    .byte $C0 ; |XX      | $DC71
    .byte $C0 ; |XX      | $DC72
    .byte $C0 ; |XX      | $DC73
    .byte $C0 ; |XX      | $DC74
    .byte $00 ; |        | $DC75
    .byte $00 ; |        | $DC76
    .byte $C0 ; |XX      | $DC77
LDC78:
    .byte $00 ; |        | $DC78
LDC79:
    .byte $00 ; |        | $DC79
    .byte $00 ; |        | $DC7A
    .byte $00 ; |        | $DC7B
    .byte $44 ; | X   X  | $DC7C
    .byte $44 ; | X   X  | $DC7D
    .byte $44 ; | X   X  | $DC7E
    .byte $FF ; |XXXXXXXX| $DC7F
    .byte $FF ; |XXXXXXXX| $DC80
    .byte $44 ; | X   X  | $DC81
    .byte $44 ; | X   X  | $DC82
    .byte $44 ; | X   X  | $DC83
    .byte $FF ; |XXXXXXXX| $DC84
    .byte $FF ; |XXXXXXXX| $DC85
    .byte $44 ; | X   X  | $DC86
    .byte $44 ; | X   X  | $DC87
    .byte $44 ; | X   X  | $DC88
    .byte $00 ; |        | $DC89
    .byte $00 ; |        | $DC8A
    .byte $00 ; |        | $DC8B
    .byte $00 ; |        | $DC8C
    .byte $00 ; |        | $DC8D
LDC8E:
    .byte $00 ; |        | $DC8E
    .byte $00 ; |        | $DC8F
    .byte $00 ; |        | $DC90
    .byte $00 ; |        | $DC91
    .byte $22 ; |  X   X | $DC92
    .byte $22 ; |  X   X | $DC93
    .byte $22 ; |  X   X | $DC94
    .byte $FF ; |XXXXXXXX| $DC95
    .byte $FF ; |XXXXXXXX| $DC96
    .byte $22 ; |  X   X | $DC97
    .byte $22 ; |  X   X | $DC98
    .byte $22 ; |  X   X | $DC99
    .byte $FF ; |XXXXXXXX| $DC9A
    .byte $FF ; |XXXXXXXX| $DC9B
    .byte $22 ; |  X   X | $DC9C
    .byte $22 ; |  X   X | $DC9D
    .byte $22 ; |  X   X | $DC9E
    .byte $00 ; |        | $DC9F
    .byte $00 ; |        | $DCA0
    .byte $00 ; |        | $DCA1
    .byte $00 ; |        | $DCA2
    .byte $00 ; |        | $DCA3
LDCA4:
    .byte $00 ; |        | $DCA4
    .byte $00 ; |        | $DCA5
    .byte $00 ; |        | $DCA6
    .byte $00 ; |        | $DCA7
    .byte $1F ; |   XXXXX| $DCA8
    .byte $3F ; |  XXXXXX| $DCA9
    .byte $3F ; |  XXXXXX| $DCAA
    .byte $00 ; |        | $DCAB
    .byte $7F ; | XXXXXXX| $DCAC
    .byte $7F ; | XXXXXXX| $DCAD
    .byte $7F ; | XXXXXXX| $DCAE
LDCAF:
    .byte $00 ; |        | $DCAF
    .byte $00 ; |        | $DCB0
    .byte $01 ; |       X| $DCB1
    .byte $01 ; |       X| $DCB2
    .byte $01 ; |       X| $DCB3
    .byte $01 ; |       X| $DCB4
    .byte $02 ; |      X | $DCB5
    .byte $02 ; |      X | $DCB6
    .byte $02 ; |      X | $DCB7
    .byte $02 ; |      X | $DCB8
    .byte $02 ; |      X | $DCB9
    .byte $02 ; |      X | $DCBA
    .byte $02 ; |      X | $DCBB
    .byte $02 ; |      X | $DCBC
    .byte $01 ; |       X| $DCBD
    .byte $01 ; |       X| $DCBE
    .byte $01 ; |       X| $DCBF
    .byte $01 ; |       X| $DCC0
    .byte $00 ; |        | $DCC1
    .byte $00 ; |        | $DCC2
LDCC3:
    .byte $F8 ; |XXXXX   | $DCC3
    .byte $F8 ; |XXXXX   | $DCC4
    .byte $F8 ; |XXXXX   | $DCC5
    .byte $F0 ; |XXXX    | $DCC6
    .byte $F0 ; |XXXX    | $DCC7
    .byte $FF ; |XXXXXXXX| $DCC8
    .byte $00 ; |        | $DCC9
    .byte $F0 ; |XXXX    | $DCCA
    .byte $EF ; |XXX XXXX| $DCCB
    .byte $1F ; |   XXXXX| $DCCC
    .byte $0F ; |    XXXX| $DCCD
    .byte $07 ; |     XXX| $DCCE
    .byte $03 ; |      XX| $DCCF
    .byte $07 ; |     XXX| $DCD0
    .byte $01 ; |       X| $DCD1
    .byte $00 ; |        | $DCD2
    .byte $FF ; |XXXXXXXX| $DCD3
    .byte $00 ; |        | $DCD4
    .byte $0F ; |    XXXX| $DCD5
    .byte $7F ; | XXXXXXX| $DCD6
    .byte $FF ; |XXXXXXXX| $DCD7
    .byte $FF ; |XXXXXXXX| $DCD8
    .byte $FF ; |XXXXXXXX| $DCD9
    .byte $7F ; | XXXXXXX| $DCDA
    .byte $0F ; |    XXXX| $DCDB
    .byte $00 ; |        | $DCDC
    .byte $00 ; |        | $DCDD
    .byte $FF ; |XXXXXXXX| $DCDE
    .byte $00 ; |        | $DCDF
    .byte $00 ; |        | $DCE0
    .byte $00 ; |        | $DCE1
    .byte $0F ; |    XXXX| $DCE2
    .byte $FF ; |XXXXXXXX| $DCE3
    .byte $3F ; |  XXXXXX| $DCE4
    .byte $07 ; |     XXX| $DCE5
    .byte $00 ; |        | $DCE6
    .byte $01 ; |       X| $DCE7
    .byte $00 ; |        | $DCE8
    .byte $FF ; |XXXXXXXX| $DCE9
    .byte $00 ; |        | $DCEA
    .byte $00 ; |        | $DCEB
    .byte $00 ; |        | $DCEC
    .byte $00 ; |        | $DCED
    .byte $FF ; |XXXXXXXX| $DCEE
    .byte $7F ; | XXXXXXX| $DCEF
    .byte $1F ; |   XXXXX| $DCF0
    .byte $01 ; |       X| $DCF1
    .byte $03 ; |      XX| $DCF2
    .byte $03 ; |      XX| $DCF3
    .byte $FF ; |XXXXXXXX| $DCF4
    .byte $00 ; |        | $DCF5
    .byte $FF ; |XXXXXXXX| $DCF6
    .byte $7F ; | XXXXXXX| $DCF7
    .byte $1F ; |   XXXXX| $DCF8
    .byte $01 ; |       X| $DCF9
    .byte $03 ; |      XX| $DCFA
    .byte $03 ; |      XX| $DCFB
    .byte $00 ; |        | $DCFC
    .byte $00 ; |        | $DCFD
    .byte $00 ; |        | $DCFE
    .byte $00 ; |        | $DCFF
    .byte $FF ; |XXXXXXXX| $DD00
    .byte $CC ; |XX  XX  | $DD01
    .byte $CC ; |XX  XX  | $DD02
    .byte $FF ; |XXXXXXXX| $DD03
    .byte $0C ; |    XX  | $DD04
    .byte $0C ; |    XX  | $DD05
    .byte $FC ; |XXXXXX  | $DD06
    .byte $C0 ; |XX      | $DD07
    .byte $C0 ; |XX      | $DD08
    .byte $FF ; |XXXXXXXX| $DD09
    .byte $FF ; |XXXXXXXX| $DD0A
    .byte $30 ; |  XX    | $DD0B
    .byte $30 ; |  XX    | $DD0C
    .byte $FF ; |XXXXXXXX| $DD0D
    .byte $30 ; |  XX    | $DD0E
    .byte $30 ; |  XX    | $DD0F
    .byte $F0 ; |XXXX    | $DD10
    .byte $C0 ; |XX      | $DD11
    .byte $C0 ; |XX      | $DD12
    .byte $FF ; |XXXXXXXX| $DD13
    .byte $FF ; |XXXXXXXX| $DD14
    .byte $0C ; |    XX  | $DD15
    .byte $0C ; |    XX  | $DD16
    .byte $FC ; |XXXXXX  | $DD17
    .byte $0C ; |    XX  | $DD18
    .byte $0C ; |    XX  | $DD19
    .byte $CC ; |XX  XX  | $DD1A
    .byte $FC ; |XXXXXX  | $DD1B
    .byte $C0 ; |XX      | $DD1C
    .byte $FF ; |XXXXXXXX| $DD1D
    .byte $FF ; |XXXXXXXX| $DD1E
    .byte $C0 ; |XX      | $DD1F
    .byte $C0 ; |XX      | $DD20
    .byte $F0 ; |XXXX    | $DD21
    .byte $30 ; |  XX    | $DD22
    .byte $30 ; |  XX    | $DD23
    .byte $F0 ; |XXXX    | $DD24
    .byte $C0 ; |XX      | $DD25
    .byte $C0 ; |XX      | $DD26
    .byte $FF ; |XXXXXXXX| $DD27
    .byte $FF ; |XXXXXXXX| $DD28
    .byte $C0 ; |XX      | $DD29
    .byte $FC ; |XXXXXX  | $DD2A
    .byte $0C ; |    XX  | $DD2B
    .byte $0C ; |    XX  | $DD2C
    .byte $0C ; |    XX  | $DD2D
    .byte $FF ; |XXXXXXXX| $DD2E
    .byte $C0 ; |XX      | $DD2F
    .byte $C0 ; |XX      | $DD30
    .byte $FF ; |XXXXXXXX| $DD31
    .byte $FF ; |XXXXXXXX| $DD32
    .byte $30 ; |  XX    | $DD33
    .byte $F0 ; |XXXX    | $DD34
    .byte $30 ; |  XX    | $DD35
    .byte $30 ; |  XX    | $DD36
    .byte $30 ; |  XX    | $DD37
    .byte $F0 ; |XXXX    | $DD38
    .byte $C0 ; |XX      | $DD39
    .byte $C0 ; |XX      | $DD3A
    .byte $FF ; |XXXXXXXX| $DD3B
    .byte $FF ; |XXXXXXXX| $DD3C
    .byte $30 ; |  XX    | $DD3D
    .byte $FC ; |XXXXXX  | $DD3E
    .byte $0C ; |    XX  | $DD3F
    .byte $0C ; |    XX  | $DD40
    .byte $0C ; |    XX  | $DD41
    .byte $CC ; |XX  XX  | $DD42
    .byte $FC ; |XXXXXX  | $DD43
    .byte $C0 ; |XX      | $DD44
    .byte $FF ; |XXXXXXXX| $DD45
    .byte $FF ; |XXXXXXXX| $DD46
    .byte $CC ; |XX  XX  | $DD47
    .byte $CC ; |XX  XX  | $DD48
    .byte $0C ; |    XX  | $DD49
    .byte $0C ; |    XX  | $DD4A
    .byte $FC ; |XXXXXX  | $DD4B
    .byte $C0 ; |XX      | $DD4C
    .byte $C0 ; |XX      | $DD4D
    .byte $C0 ; |XX      | $DD4E
    .byte $FF ; |XXXXXXXX| $DD4F
    .byte $FF ; |XXXXXXXX| $DD50
    .byte $C0 ; |XX      | $DD51
    .byte $F0 ; |XXXX    | $DD52
    .byte $3C ; |  XXXX  | $DD53
    .byte $0C ; |    XX  | $DD54
    .byte $0C ; |    XX  | $DD55
    .byte $FF ; |XXXXXXXX| $DD56
    .byte $C0 ; |XX      | $DD57
    .byte $C0 ; |XX      | $DD58
    .byte $FF ; |XXXXXXXX| $DD59
    .byte $FF ; |XXXXXXXX| $DD5A
    .byte $0C ; |    XX  | $DD5B
    .byte $FC ; |XXXXXX  | $DD5C
    .byte $0F ; |    XXXX| $DD5D
    .byte $3C ; |  XXXX  | $DD5E
    .byte $0C ; |    XX  | $DD5F
    .byte $FF ; |XXXXXXXX| $DD60
    .byte $C0 ; |XX      | $DD61
    .byte $C0 ; |XX      | $DD62
    .byte $FF ; |XXXXXXXX| $DD63
    .byte $FF ; |XXXXXXXX| $DD64
    .byte $CC ; |XX  XX  | $DD65
    .byte $CC ; |XX  XX  | $DD66
    .byte $0F ; |    XXXX| $DD67
    .byte $0C ; |    XX  | $DD68
    .byte $0C ; |    XX  | $DD69
    .byte $FF ; |XXXXXXXX| $DD6A
    .byte $C0 ; |XX      | $DD6B
    .byte $C0 ; |XX      | $DD6C
    .byte $FF ; |XXXXXXXX| $DD6D
    .byte $FF ; |XXXXXXXX| $DD6E
    .byte $0C ; |    XX  | $DD6F
    .byte $FC ; |XXXXXX  | $DD70
    .byte $0C ; |    XX  | $DD71
    .byte $FC ; |XXXXXX  | $DD72
    .byte $0C ; |    XX  | $DD73
    .byte $FC ; |XXXXXX  | $DD74
    .byte $C0 ; |XX      | $DD75
    .byte $C0 ; |XX      | $DD76
    .byte $FF ; |XXXXXXXX| $DD77
    .byte $00 ; |        | $DD78
    .byte $0E ; |    XXX | $DD79
    .byte $0A ; |    X X | $DD7A
    .byte $0A ; |    X X | $DD7B
    .byte $0A ; |    X X | $DD7C
    .byte $0E ; |    XXX | $DD7D
    .byte $00 ; |        | $DD7E
    .byte $44 ; | X   X  | $DD7F
    .byte $44 ; | X   X  | $DD80
    .byte $44 ; | X   X  | $DD81
    .byte $44 ; | X   X  | $DD82
    .byte $44 ; | X   X  | $DD83
    .byte $00 ; |        | $DD84
    .byte $EE ; |XXX XXX | $DD85
    .byte $88 ; |X   X   | $DD86
    .byte $EE ; |XXX XXX | $DD87
    .byte $22 ; |  X   X | $DD88
    .byte $EE ; |XXX XXX | $DD89
    .byte $00 ; |        | $DD8A
    .byte $EE ; |XXX XXX | $DD8B
    .byte $22 ; |  X   X | $DD8C
    .byte $66 ; | XX  XX | $DD8D
    .byte $22 ; |  X   X | $DD8E
    .byte $EE ; |XXX XXX | $DD8F
    .byte $00 ; |        | $DD90
    .byte $22 ; |  X   X | $DD91
    .byte $22 ; |  X   X | $DD92
    .byte $EE ; |XXX XXX | $DD93
    .byte $AA ; |X X X X | $DD94
    .byte $AA ; |X X X X | $DD95
    .byte $00 ; |        | $DD96
    .byte $EE ; |XXX XXX | $DD97
    .byte $22 ; |  X   X | $DD98
    .byte $EE ; |XXX XXX | $DD99
    .byte $88 ; |X   X   | $DD9A
    .byte $EE ; |XXX XXX | $DD9B
    .byte $00 ; |        | $DD9C
    .byte $EE ; |XXX XXX | $DD9D
    .byte $AA ; |X X X X | $DD9E
    .byte $EE ; |XXX XXX | $DD9F
    .byte $88 ; |X   X   | $DDA0
    .byte $EE ; |XXX XXX | $DDA1
    .byte $00 ; |        | $DDA2
    .byte $22 ; |  X   X | $DDA3
    .byte $22 ; |  X   X | $DDA4
    .byte $22 ; |  X   X | $DDA5
    .byte $22 ; |  X   X | $DDA6
    .byte $EE ; |XXX XXX | $DDA7
    .byte $00 ; |        | $DDA8
    .byte $EE ; |XXX XXX | $DDA9
    .byte $AA ; |X X X X | $DDAA
    .byte $EE ; |XXX XXX | $DDAB
    .byte $AA ; |X X X X | $DDAC
    .byte $EE ; |XXX XXX | $DDAD
    .byte $00 ; |        | $DDAE
    .byte $EE ; |XXX XXX | $DDAF
    .byte $22 ; |  X   X | $DDB0
    .byte $EE ; |XXX XXX | $DDB1
    .byte $AA ; |X X X X | $DDB2
    .byte $EE ; |XXX XXX | $DDB3
    .byte $00 ; |        | $DDB4
    .byte $0E ; |    XXX | $DDB5
    .byte $0A ; |    X X | $DDB6
    .byte $0A ; |    X X | $DDB7
    .byte $0A ; |    X X | $DDB8
    .byte $0E ; |    XXX | $DDB9
    .byte $E7 ; |XXX  XXX| $DDBA
    .byte $7E ; | XXXXXX | $DDBB
    .byte $3C ; |  XXXX  | $DDBC
    .byte $7E ; | XXXXXX | $DDBD
    .byte $7E ; | XXXXXX | $DDBE
    .byte $FF ; |XXXXXXXX| $DDBF
    .byte $FF ; |XXXXXXXX| $DDC0
    .byte $FF ; |XXXXXXXX| $DDC1
    .byte $FF ; |XXXXXXXX| $DDC2
    .byte $7E ; | XXXXXX | $DDC3
    .byte $7E ; | XXXXXX | $DDC4
    .byte $7E ; | XXXXXX | $DDC5
    .byte $7E ; | XXXXXX | $DDC6
    .byte $3C ; |  XXXX  | $DDC7
    .byte $3C ; |  XXXX  | $DDC8
    .byte $3C ; |  XXXX  | $DDC9
    .byte $3C ; |  XXXX  | $DDCA
    .byte $14 ; |   X X  | $DDCB
    .byte $00 ; |        | $DDCC
    .byte $00 ; |        | $DDCD
    .byte $00 ; |        | $DDCE
    .byte $00 ; |        | $DDCF
    .byte $E0 ; |XXX     | $DDD0
    .byte $60 ; | XX     | $DDD1
    .byte $37 ; |  XX XXX| $DDD2
    .byte $7E ; | XXXXXX | $DDD3
    .byte $7C ; | XXXXX  | $DDD4
    .byte $FC ; |XXXXXX  | $DDD5
    .byte $FE ; |XXXXXXX | $DDD6
    .byte $FE ; |XXXXXXX | $DDD7
    .byte $FE ; |XXXXXXX | $DDD8
    .byte $FE ; |XXXXXXX | $DDD9
    .byte $FC ; |XXXXXX  | $DDDA
    .byte $FC ; |XXXXXX  | $DDDB
    .byte $FC ; |XXXXXX  | $DDDC
    .byte $78 ; | XXXX   | $DDDD
    .byte $78 ; | XXXX   | $DDDE
    .byte $78 ; | XXXX   | $DDDF
    .byte $70 ; | XXX    | $DDE0
    .byte $50 ; | X X    | $DDE1
    .byte $00 ; |        | $DDE2
    .byte $00 ; |        | $DDE3
    .byte $00 ; |        | $DDE4
    .byte $00 ; |        | $DDE5
    .byte $E7 ; |XXX  XXX| $DDE6
    .byte $7E ; | XXXXXX | $DDE7
    .byte $3C ; |  XXXX  | $DDE8
    .byte $7E ; | XXXXXX | $DDE9
    .byte $7E ; | XXXXXX | $DDEA
    .byte $FF ; |XXXXXXXX| $DDEB
    .byte $FF ; |XXXXXXXX| $DDEC
    .byte $FF ; |XXXXXXXX| $DDED
    .byte $FF ; |XXXXXXXX| $DDEE
    .byte $FE ; |XXXXXXX | $DDEF
    .byte $FE ; |XXXXXXX | $DDF0
    .byte $FE ; |XXXXXXX | $DDF1
    .byte $FE ; |XXXXXXX | $DDF2
    .byte $BC ; |X XXXX  | $DDF3
    .byte $BC ; |X XXXX  | $DDF4
    .byte $BC ; |X XXXX  | $DDF5
    .byte $BC ; |X XXXX  | $DDF6
    .byte $14 ; |   X X  | $DDF7
    .byte $60 ; | XX     | $DDF8
    .byte $F0 ; |XXXX    | $DDF9
    .byte $F0 ; |XXXX    | $DDFA
    .byte $60 ; | XX     | $DDFB
    .byte $00 ; |        | $DDFC
    .byte $00 ; |        | $DDFD
    .byte $00 ; |        | $DDFE
    .byte $00 ; |        | $DDFF
    .byte $FF ; |XXXXXXXX| $DE00
    .byte $0C ; |    XX  | $DE01
    .byte $0C ; |    XX  | $DE02
    .byte $0F ; |    XXXX| $DE03
    .byte $0C ; |    XX  | $DE04
    .byte $0C ; |    XX  | $DE05
    .byte $0C ; |    XX  | $DE06
    .byte $0C ; |    XX  | $DE07
    .byte $0C ; |    XX  | $DE08
    .byte $FF ; |XXXXXXXX| $DE09
    .byte $FF ; |XXXXXXXX| $DE0A
    .byte $0C ; |    XX  | $DE0B
    .byte $0C ; |    XX  | $DE0C
    .byte $0C ; |    XX  | $DE0D
    .byte $0C ; |    XX  | $DE0E
    .byte $FC ; |XXXXXX  | $DE0F
    .byte $0C ; |    XX  | $DE10
    .byte $0C ; |    XX  | $DE11
    .byte $0C ; |    XX  | $DE12
    .byte $FF ; |XXXXXXXX| $DE13
    .byte $FF ; |XXXXXXXX| $DE14
    .byte $0C ; |    XX  | $DE15
    .byte $0C ; |    XX  | $DE16
    .byte $3C ; |  XXXX  | $DE17
    .byte $30 ; |  XX    | $DE18
    .byte $30 ; |  XX    | $DE19
    .byte $3C ; |  XXXX  | $DE1A
    .byte $0C ; |    XX  | $DE1B
    .byte $0C ; |    XX  | $DE1C
    .byte $FF ; |XXXXXXXX| $DE1D
    .byte $FF ; |XXXXXXXX| $DE1E
    .byte $0C ; |    XX  | $DE1F
    .byte $0C ; |    XX  | $DE20
    .byte $0C ; |    XX  | $DE21
    .byte $0C ; |    XX  | $DE22
    .byte $0C ; |    XX  | $DE23
    .byte $0C ; |    XX  | $DE24
    .byte $0C ; |    XX  | $DE25
    .byte $0C ; |    XX  | $DE26
    .byte $FF ; |XXXXXXXX| $DE27
    .byte $FF ; |XXXXXXXX| $DE28
    .byte $0C ; |    XX  | $DE29
    .byte $0C ; |    XX  | $DE2A
    .byte $3F ; |  XXXXXX| $DE2B
    .byte $30 ; |  XX    | $DE2C
    .byte $30 ; |  XX    | $DE2D
    .byte $30 ; |  XX    | $DE2E
    .byte $3C ; |  XXXX  | $DE2F
    .byte $0C ; |    XX  | $DE30
    .byte $FF ; |XXXXXXXX| $DE31
    .byte $FF ; |XXXXXXXX| $DE32
    .byte $0C ; |    XX  | $DE33
    .byte $0C ; |    XX  | $DE34
    .byte $0F ; |    XXXX| $DE35
    .byte $0C ; |    XX  | $DE36
    .byte $0C ; |    XX  | $DE37
    .byte $0C ; |    XX  | $DE38
    .byte $0C ; |    XX  | $DE39
    .byte $0C ; |    XX  | $DE3A
    .byte $FF ; |XXXXXXXX| $DE3B
    .byte $FF ; |XXXXXXXX| $DE3C
    .byte $30 ; |  XX    | $DE3D
    .byte $3C ; |  XXXX  | $DE3E
    .byte $0C ; |    XX  | $DE3F
    .byte $3C ; |  XXXX  | $DE40
    .byte $30 ; |  XX    | $DE41
    .byte $3C ; |  XXXX  | $DE42
    .byte $0C ; |    XX  | $DE43
    .byte $0C ; |    XX  | $DE44
    .byte $FF ; |XXXXXXXX| $DE45
    .byte $FF ; |XXXXXXXX| $DE46
    .byte $0C ; |    XX  | $DE47
    .byte $0C ; |    XX  | $DE48
    .byte $0C ; |    XX  | $DE49
    .byte $0C ; |    XX  | $DE4A
    .byte $0C ; |    XX  | $DE4B
    .byte $0F ; |    XXXX| $DE4C
    .byte $0C ; |    XX  | $DE4D
    .byte $0C ; |    XX  | $DE4E
    .byte $FF ; |XXXXXXXX| $DE4F
    .byte $FF ; |XXXXXXXX| $DE50
    .byte $0C ; |    XX  | $DE51
    .byte $3C ; |  XXXX  | $DE52
    .byte $30 ; |  XX    | $DE53
    .byte $3F ; |  XXXXXX| $DE54
    .byte $30 ; |  XX    | $DE55
    .byte $3F ; |  XXXXXX| $DE56
    .byte $0C ; |    XX  | $DE57
    .byte $0C ; |    XX  | $DE58
    .byte $FF ; |XXXXXXXX| $DE59
    .byte $FF ; |XXXXXXXX| $DE5A
    .byte $0C ; |    XX  | $DE5B
    .byte $0C ; |    XX  | $DE5C
    .byte $FF ; |XXXXXXXX| $DE5D
    .byte $0C ; |    XX  | $DE5E
    .byte $FF ; |XXXXXXXX| $DE5F
    .byte $0C ; |    XX  | $DE60
    .byte $FF ; |XXXXXXXX| $DE61
    .byte $0C ; |    XX  | $DE62
    .byte $FF ; |XXXXXXXX| $DE63
    .byte $FF ; |XXXXXXXX| $DE64
    .byte $0C ; |    XX  | $DE65
    .byte $0C ; |    XX  | $DE66
    .byte $3F ; |  XXXXXX| $DE67
    .byte $30 ; |  XX    | $DE68
    .byte $F0 ; |XXXX    | $DE69
    .byte $3F ; |  XXXXXX| $DE6A
    .byte $0C ; |    XX  | $DE6B
    .byte $0C ; |    XX  | $DE6C
    .byte $FF ; |XXXXXXXX| $DE6D
    .byte $FF ; |XXXXXXXX| $DE6E
    .byte $0C ; |    XX  | $DE6F
    .byte $3C ; |  XXXX  | $DE70
    .byte $33 ; |  XX  XX| $DE71
    .byte $3F ; |  XXXXXX| $DE72
    .byte $30 ; |  XX    | $DE73
    .byte $3F ; |  XXXXXX| $DE74
    .byte $0C ; |    XX  | $DE75
    .byte $0C ; |    XX  | $DE76
    .byte $FF ; |XXXXXXXX| $DE77
    .byte $00 ; |        | $DE78
    .byte $E0 ; |XXX     | $DE79
    .byte $A0 ; |X X     | $DE7A
    .byte $A0 ; |X X     | $DE7B
    .byte $A0 ; |X X     | $DE7C
    .byte $E0 ; |XXX     | $DE7D
    .byte $00 ; |        | $DE7E
    .byte $44 ; | X   X  | $DE7F
    .byte $44 ; | X   X  | $DE80
    .byte $44 ; | X   X  | $DE81
    .byte $44 ; | X   X  | $DE82
    .byte $44 ; | X   X  | $DE83
    .byte $00 ; |        | $DE84
    .byte $EE ; |XXX XXX | $DE85
    .byte $22 ; |  X   X | $DE86
    .byte $EE ; |XXX XXX | $DE87
    .byte $88 ; |X   X   | $DE88
    .byte $EE ; |XXX XXX | $DE89
    .byte $00 ; |        | $DE8A
    .byte $EE ; |XXX XXX | $DE8B
    .byte $88 ; |X   X   | $DE8C
    .byte $CC ; |XX  XX  | $DE8D
    .byte $88 ; |X   X   | $DE8E
    .byte $EE ; |XXX XXX | $DE8F
    .byte $00 ; |        | $DE90
    .byte $88 ; |X   X   | $DE91
    .byte $88 ; |X   X   | $DE92
    .byte $EE ; |XXX XXX | $DE93
    .byte $AA ; |X X X X | $DE94
    .byte $AA ; |X X X X | $DE95
    .byte $00 ; |        | $DE96
    .byte $EE ; |XXX XXX | $DE97
    .byte $88 ; |X   X   | $DE98
    .byte $EE ; |XXX XXX | $DE99
    .byte $22 ; |  X   X | $DE9A
    .byte $EE ; |XXX XXX | $DE9B
    .byte $00 ; |        | $DE9C
    .byte $EE ; |XXX XXX | $DE9D
    .byte $AA ; |X X X X | $DE9E
    .byte $EE ; |XXX XXX | $DE9F
    .byte $22 ; |  X   X | $DEA0
    .byte $EE ; |XXX XXX | $DEA1
    .byte $00 ; |        | $DEA2
    .byte $88 ; |X   X   | $DEA3
    .byte $88 ; |X   X   | $DEA4
    .byte $88 ; |X   X   | $DEA5
    .byte $88 ; |X   X   | $DEA6
    .byte $EE ; |XXX XXX | $DEA7
    .byte $00 ; |        | $DEA8
    .byte $EE ; |XXX XXX | $DEA9
    .byte $AA ; |X X X X | $DEAA
    .byte $EE ; |XXX XXX | $DEAB
    .byte $AA ; |X X X X | $DEAC
    .byte $EE ; |XXX XXX | $DEAD
    .byte $00 ; |        | $DEAE
    .byte $EE ; |XXX XXX | $DEAF
    .byte $88 ; |X   X   | $DEB0
    .byte $EE ; |XXX XXX | $DEB1
    .byte $AA ; |X X X X | $DEB2
    .byte $EE ; |XXX XXX | $DEB3
    .byte $00 ; |        | $DEB4
    .byte $E0 ; |XXX     | $DEB5
    .byte $A0 ; |X X     | $DEB6
    .byte $A0 ; |X X     | $DEB7
    .byte $A0 ; |X X     | $DEB8
    .byte $E0 ; |XXX     | $DEB9
    .byte $E0 ; |XXX     | $DEBA
    .byte $60 ; | XX     | $DEBB
    .byte $37 ; |  XX XXX| $DEBC
    .byte $7E ; | XXXXXX | $DEBD
    .byte $7C ; | XXXXX  | $DEBE
    .byte $FC ; |XXXXXX  | $DEBF
    .byte $FE ; |XXXXXXX | $DEC0
    .byte $FE ; |XXXXXXX | $DEC1
    .byte $FE ; |XXXXXXX | $DEC2
    .byte $FE ; |XXXXXXX | $DEC3
    .byte $FC ; |XXXXXX  | $DEC4
    .byte $FC ; |XXXXXX  | $DEC5
    .byte $FE ; |XXXXXXX | $DEC6
    .byte $7E ; | XXXXXX | $DEC7
    .byte $7A ; | XXXX X | $DEC8
    .byte $7A ; | XXXX X | $DEC9
    .byte $72 ; | XXX  X | $DECA
    .byte $50 ; | X X    | $DECB
    .byte $06 ; |     XX | $DECC
    .byte $0F ; |    XXXX| $DECD
    .byte $0F ; |    XXXX| $DECE
    .byte $06 ; |     XX | $DECF
    .byte $E0 ; |XXX     | $DED0
    .byte $60 ; | XX     | $DED1
    .byte $37 ; |  XX XXX| $DED2
    .byte $7E ; | XXXXXX | $DED3
    .byte $7C ; | XXXXX  | $DED4
    .byte $FC ; |XXXXXX  | $DED5
    .byte $FC ; |XXXXXX  | $DED6
    .byte $FE ; |XXXXXXX | $DED7
    .byte $FE ; |XXXXXXX | $DED8
    .byte $FE ; |XXXXXXX | $DED9
    .byte $FE ; |XXXXXXX | $DEDA
    .byte $FC ; |XXXXXX  | $DEDB
    .byte $FC ; |XXXXXX  | $DEDC
    .byte $FC ; |XXXXXX  | $DEDD
    .byte $F8 ; |XXXXX   | $DEDE
    .byte $B8 ; |X XXX   | $DEDF
    .byte $B8 ; |X XXX   | $DEE0
    .byte $28 ; |  X X   | $DEE1
    .byte $60 ; | XX     | $DEE2
    .byte $F0 ; |XXXX    | $DEE3
    .byte $F0 ; |XXXX    | $DEE4
    .byte $60 ; | XX     | $DEE5
    .byte $E7 ; |XXX  XXX| $DEE6
    .byte $7E ; | XXXXXX | $DEE7
    .byte $3C ; |  XXXX  | $DEE8
    .byte $7E ; | XXXXXX | $DEE9
    .byte $7E ; | XXXXXX | $DEEA
    .byte $FF ; |XXXXXXXX| $DEEB
    .byte $FF ; |XXXXXXXX| $DEEC
    .byte $FF ; |XXXXXXXX| $DEED
    .byte $FF ; |XXXXXXXX| $DEEE
    .byte $FF ; |XXXXXXXX| $DEEF
    .byte $FF ; |XXXXXXXX| $DEF0
    .byte $FF ; |XXXXXXXX| $DEF1
    .byte $FF ; |XXXXXXXX| $DEF2
    .byte $BD ; |X XXXX X| $DEF3
    .byte $BD ; |X XXXX X| $DEF4
    .byte $FD ; |XXXXXX X| $DEF5
    .byte $ED ; |XXX XX X| $DEF6
    .byte $14 ; |   X X  | $DEF7
    .byte $20 ; |  X     | $DEF8
    .byte $88 ; |X   X   | $DEF9
    .byte $21 ; |  X    X| $DEFA
    .byte $00 ; |        | $DEFB
    .byte $00 ; |        | $DEFC
    .byte $00 ; |        | $DEFD
    .byte $00 ; |        | $DEFE
    .byte $00 ; |        | $DEFF
    .byte $00 ; |        | $DF00
    .byte $00 ; |        | $DF01
    .byte $00 ; |        | $DF02
    .byte $00 ; |        | $DF03
    .byte $00 ; |        | $DF04
    .byte $00 ; |        | $DF05
    .byte $00 ; |        | $DF06
    .byte $00 ; |        | $DF07
    .byte $00 ; |        | $DF08
    .byte $00 ; |        | $DF09
    .byte $00 ; |        | $DF0A
    .byte $00 ; |        | $DF0B
    .byte $00 ; |        | $DF0C
    .byte $00 ; |        | $DF0D
    .byte $00 ; |        | $DF0E
    .byte $00 ; |        | $DF0F
    .byte $00 ; |        | $DF10
    .byte $00 ; |        | $DF11
    .byte $00 ; |        | $DF12
    .byte $00 ; |        | $DF13
    .byte $00 ; |        | $DF14
    .byte $00 ; |        | $DF15
    .byte $00 ; |        | $DF16
    .byte $00 ; |        | $DF17
    .byte $00 ; |        | $DF18
    .byte $00 ; |        | $DF19
    .byte $00 ; |        | $DF1A
    .byte $00 ; |        | $DF1B
    .byte $01 ; |       X| $DF1C
    .byte $03 ; |      XX| $DF1D
    .byte $07 ; |     XXX| $DF1E
    .byte $07 ; |     XXX| $DF1F
    .byte $03 ; |      XX| $DF20
    .byte $01 ; |       X| $DF21
    .byte $00 ; |        | $DF22
    .byte $00 ; |        | $DF23
    .byte $00 ; |        | $DF24
    .byte $00 ; |        | $DF25
    .byte $00 ; |        | $DF26
    .byte $00 ; |        | $DF27
    .byte $00 ; |        | $DF28
    .byte $00 ; |        | $DF29
    .byte $00 ; |        | $DF2A
    .byte $00 ; |        | $DF2B
    .byte $00 ; |        | $DF2C
    .byte $02 ; |      X | $DF2D
    .byte $08 ; |    X   | $DF2E
    .byte $08 ; |    X   | $DF2F
    .byte $00 ; |        | $DF30
    .byte $00 ; |        | $DF31
    .byte $00 ; |        | $DF32
    .byte $00 ; |        | $DF33
    .byte $00 ; |        | $DF34
    .byte $40 ; | X      | $DF35
    .byte $00 ; |        | $DF36
    .byte $00 ; |        | $DF37
    .byte $81 ; |X      X| $DF38
    .byte $45 ; | X   X X| $DF39
    .byte $87 ; |X    XXX| $DF3A
    .byte $03 ; |      XX| $DF3B
    .byte $00 ; |        | $DF3C
    .byte $00 ; |        | $DF3D
    .byte $04 ; |     X  | $DF3E
    .byte $00 ; |        | $DF3F
    .byte $00 ; |        | $DF40
    .byte $00 ; |        | $DF41
    .byte $00 ; |        | $DF42
    .byte $00 ; |        | $DF43
    .byte $00 ; |        | $DF44
    .byte $00 ; |        | $DF45
    .byte $40 ; | X      | $DF46
    .byte $00 ; |        | $DF47
    .byte $00 ; |        | $DF48
    .byte $00 ; |        | $DF49
    .byte $00 ; |        | $DF4A
    .byte $00 ; |        | $DF4B
    .byte $00 ; |        | $DF4C
    .byte $00 ; |        | $DF4D
    .byte $04 ; |     X  | $DF4E
    .byte $00 ; |        | $DF4F
    .byte $10 ; |   X    | $DF50
    .byte $18 ; |   XX   | $DF51
    .byte $08 ; |    X   | $DF52
    .byte $00 ; |        | $DF53
    .byte $00 ; |        | $DF54
    .byte $00 ; |        | $DF55
    .byte $01 ; |       X| $DF56
    .byte $01 ; |       X| $DF57
    .byte $00 ; |        | $DF58
    .byte $00 ; |        | $DF59
    .byte $00 ; |        | $DF5A
    .byte $00 ; |        | $DF5B
    .byte $40 ; | X      | $DF5C
    .byte $40 ; | X      | $DF5D
    .byte $02 ; |      X | $DF5E
    .byte $00 ; |        | $DF5F
    .byte $00 ; |        | $DF60
    .byte $00 ; |        | $DF61
    .byte $00 ; |        | $DF62
    .byte $00 ; |        | $DF63
    .byte $00 ; |        | $DF64
    .byte $00 ; |        | $DF65
    .byte $00 ; |        | $DF66
    .byte $03 ; |      XX| $DF67
    .byte $06 ; |     XX | $DF68
    .byte $80 ; |X       | $DF69
    .byte $81 ; |X      X| $DF6A
    .byte $01 ; |       X| $DF6B
    .byte $00 ; |        | $DF6C
    .byte $00 ; |        | $DF6D
    .byte $00 ; |        | $DF6E
    .byte $00 ; |        | $DF6F
    .byte $00 ; |        | $DF70
    .byte $00 ; |        | $DF71
    .byte $10 ; |   X    | $DF72
    .byte $00 ; |        | $DF73
    .byte $08 ; |    X   | $DF74
    .byte $08 ; |    X   | $DF75
    .byte $08 ; |    X   | $DF76
    .byte $00 ; |        | $DF77
    .byte $00 ; |        | $DF78
    .byte $80 ; |X       | $DF79
    .byte $00 ; |        | $DF7A
LDF7B:
    .byte $04 ; |     X  | $DF7B
    .byte $04 ; |     X  | $DF7C
    .byte $14 ; |   X X  | $DF7D
    .byte $00 ; |        | $DF7E
    .byte $04 ; |     X  | $DF7F
    .byte $04 ; |     X  | $DF80
    .byte $04 ; |     X  | $DF81
    .byte $00 ; |        | $DF82
    .byte $14 ; |   X X  | $DF83
    .byte $04 ; |     X  | $DF84
    .byte $04 ; |     X  | $DF85
    .byte $00 ; |        | $DF86
    .byte $14 ; |   X X  | $DF87
    .byte $04 ; |     X  | $DF88
    .byte $04 ; |     X  | $DF89
    .byte $00 ; |        | $DF8A
    .byte $14 ; |   X X  | $DF8B
    .byte $04 ; |     X  | $DF8C
    .byte $04 ; |     X  | $DF8D
    .byte $00 ; |        | $DF8E
    .byte $14 ; |   X X  | $DF8F
    .byte $14 ; |   X X  | $DF90
    .byte $04 ; |     X  | $DF91
    .byte $00 ; |        | $DF92
    .byte $14 ; |   X X  | $DF93
    .byte $14 ; |   X X  | $DF94
    .byte $12 ; |   X  X | $DF95
    .byte $00 ; |        | $DF96
    .byte $12 ; |   X  X | $DF97
    .byte $02 ; |      X | $DF98
    .byte $00 ; |        | $DF99
    .byte $00 ; |        | $DF9A
    .byte $F0 ; |XXXX    | $DF9B
    .byte $E2 ; |XXX   X | $DF9C
    .byte $F2 ; |XXXX  X | $DF9D
    .byte $00 ; |        | $DF9E
    .byte $F4 ; |XXXX X  | $DF9F
    .byte $04 ; |     X  | $DFA0
    .byte $04 ; |     X  | $DFA1
    .byte $00 ; |        | $DFA2
    .byte $04 ; |     X  | $DFA3
    .byte $04 ; |     X  | $DFA4
    .byte $14 ; |   X X  | $DFA5
    .byte $00 ; |        | $DFA6
    .byte $16 ; |   X XX | $DFA7
    .byte $16 ; |   X XX | $DFA8
    .byte $18 ; |   XX   | $DFA9
LDFAA:
    .byte $FF ; |XXXXXXXX| $DFAA
    .byte $FF ; |XXXXXXXX| $DFAB
    .byte $FF ; |XXXXXXXX| $DFAC
    .byte $FF ; |XXXXXXXX| $DFAD
    .byte $FF ; |XXXXXXXX| $DFAE
    .byte $FF ; |XXXXXXXX| $DFAF
    .byte $FF ; |XXXXXXXX| $DFB0
    .byte $FF ; |XXXXXXXX| $DFB1
    .byte $FF ; |XXXXXXXX| $DFB2
    .byte $FF ; |XXXXXXXX| $DFB3
    .byte $FF ; |XXXXXXXX| $DFB4
    .byte $FF ; |XXXXXXXX| $DFB5
    .byte $FF ; |XXXXXXXX| $DFB6
    .byte $FF ; |XXXXXXXX| $DFB7
    .byte $FF ; |XXXXXXXX| $DFB8
    .byte $FF ; |XXXXXXXX| $DFB9
    .byte $FE ; |XXXXXXX | $DFBA
    .byte $FE ; |XXXXXXX | $DFBB
    .byte $FE ; |XXXXXXX | $DFBC
    .byte $FE ; |XXXXXXX | $DFBD
    .byte $FE ; |XXXXXXX | $DFBE
    .byte $FE ; |XXXXXXX | $DFBF
    .byte $FE ; |XXXXXXX | $DFC0
    .byte $FE ; |XXXXXXX | $DFC1
    .byte $FC ; |XXXXXX  | $DFC2
    .byte $FC ; |XXXXXX  | $DFC3
    .byte $FC ; |XXXXXX  | $DFC4
    .byte $FC ; |XXXXXX  | $DFC5
    .byte $FC ; |XXXXXX  | $DFC6
    .byte $FC ; |XXXXXX  | $DFC7
    .byte $FC ; |XXXXXX  | $DFC8
    .byte $FC ; |XXXXXX  | $DFC9
    .byte $FC ; |XXXXXX  | $DFCA
    .byte $FC ; |XXXXXX  | $DFCB
    .byte $FC ; |XXXXXX  | $DFCC
    .byte $FC ; |XXXXXX  | $DFCD
    .byte $FC ; |XXXXXX  | $DFCE
    .byte $FC ; |XXXXXX  | $DFCF
    .byte $FC ; |XXXXXX  | $DFD0
    .byte $FC ; |XXXXXX  | $DFD1
    .byte $F8 ; |XXXXX   | $DFD2
    .byte $F8 ; |XXXXX   | $DFD3
    .byte $F8 ; |XXXXX   | $DFD4
    .byte $F8 ; |XXXXX   | $DFD5
    .byte $F8 ; |XXXXX   | $DFD6
    .byte $F8 ; |XXXXX   | $DFD7
    .byte $F8 ; |XXXXX   | $DFD8
    .byte $F8 ; |XXXXX   | $DFD9
    .byte $F8 ; |XXXXX   | $DFDA
    .byte $F8 ; |XXXXX   | $DFDB
    .byte $F8 ; |XXXXX   | $DFDC
    .byte $F8 ; |XXXXX   | $DFDD
    .byte $F8 ; |XXXXX   | $DFDE
    .byte $F8 ; |XXXXX   | $DFDF
    .byte $F8 ; |XXXXX   | $DFE0
    .byte $F8 ; |XXXXX   | $DFE1
LDFE2:
    .byte $28 ; |  X X   | $DFE2
    .byte $34 ; |  XX X  | $DFE3
    .byte $28 ; |  X X   | $DFE4
    .byte $28 ; |  X X   | $DFE5
    .byte $2A ; |  X X X | $DFE6
    .byte $2A ; |  X X X | $DFE7
    .byte $2A ; |  X X X | $DFE8
    .byte $2A ; |  X X X | $DFE9
    .byte $06 ; |     XX | $DFEA
LDFEB:
    .byte $22 ; |  X   X | $DFEB
    .byte $55 ; | X X X X| $DFEC
    .byte $51 ; | X X   X| $DFED
    .byte $22 ; |  X   X | $DFEE
    .byte $51 ; | X X   X| $DFEF
    .byte $55 ; | X X X X| $DFF0
    .byte $22 ; |  X   X | $DFF1
    
       ORG $0FF2
      RORG $DFF2
    
LDFF2:
    cmp    $FFF9                 ; 4
    jmp.ind ($00F7)              ; 5

    .byte $00 ; |        | $DFF8
LDFF9:
    .byte $00 ; |        | $DFF9
    
    .word START_0
    .word START_0
    .word START_0

    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 1
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $1000
      RORG $F000

START_1:
    sei                          ; 2
    cld                          ; 2
    ldx    #$00                  ; 2
    txa                          ; 2
LF005:
    sta    0,X                   ; 4
    inx                          ; 2
    bne    LF005                 ; 2³
    dex                          ; 2
    stx    ram_85                ; 3
    
  IF ORIGINAL  
    stx    SWACNT                ; 4
  ELSE
    NOP
    NOP
    NOP
  ENDIF
  
    txs                          ; 2
    lda    #$DC                  ; 2
    sta    ram_DC                ; 3
    lda    #$DD                  ; 2
    sta    ram_DE                ; 3
    lda    #$DE                  ; 2
    sta    ram_E0                ; 3
    lda    #$DD                  ; 2
    sta    ram_E6                ; 3
    sta    ram_E8                ; 3
    sta    ram_C3                ; 3
    sta    ram_C5                ; 3
    lda    #$DE                  ; 2
    sta    ram_EA                ; 3
    sta    ram_EC                ; 3
    lda    #$78                  ; 2
    sta    ram_E5                ; 3
    sta    ram_E7                ; 3
    lda    #$78                  ; 2
    sta    ram_E9                ; 3
    sta    ram_EB                ; 3
    lda    #$FD                  ; 2
    sta    ram_B7                ; 3
    lda    #$FE                  ; 2
    sta    ram_B9                ; 3
    jsr    LF7CC                 ; 6
    lda    #$81                  ; 2
    sta    ram_85                ; 3
    lda    #$05                  ; 2
    jsr    LFB9D                 ; 6
LF04D:
    ldx    #$00                  ; 2
    stx    COLUBK                ; 3
    lda    #$26                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    TIM64T                ; 4
    lda    #$02                  ; 2
    sta    VBLANK                ; 3
    jsr    LF9B9                 ; 6
    lda    ram_83                ; 3
    beq    LF066                 ; 2³
    jsr    LFB71                 ; 6
LF066:
    inc    ram_9B                ; 5
    bne    LF08F                 ; 2³
    inc    ram_9C                ; 5
    bne    LF08F                 ; 2³
    lda    #$00                  ; 2
    sta    AUDV0                 ; 3
    jsr    LFB9D                 ; 6
    bit    ram_85                ; 3
    bpl    LF083                 ; 2³
    lda    #$91                  ; 2
    sta    ram_85                ; 3
    lda    #$F7                  ; 2
    sta    ram_D8                ; 3
    bne    LF08F                 ; 2³
LF083:
    lda    #$4F                  ; 2
    sta    ram_D9                ; 3
    lda    #$F4                  ; 2
    sta    ram_DA                ; 3
    lda    #$81                  ; 2
    sta    ram_85                ; 3
LF08F:
    lda    ram_85                ; 3
    and    #$10                  ; 2
    beq    LF099                 ; 2³
    lda    ram_9C                ; 3
    sta    ram_D7                ; 3
LF099:
    jmp.ind ($00D9)              ; 5

    lda    #$01                  ; 2
    sta    ram_A1                ; 3
    lda    ram_9B                ; 3
    and    #$1F                  ; 2
    ora    ram_8F                ; 3
    beq    LF0AB                 ; 2³
    jmp    LF130                 ; 3

LF0AB:
    ldy    ram_9D                ; 3
    lda    LFDE5,Y               ; 4
    tay                          ; 2
    jsr    LF993                 ; 6
    and    #$1F                  ; 2
    tax                          ; 2
    lda    LFFC0,X               ; 4
    tax                          ; 2
LF0BB:
    cpy    #$00                  ; 2
    bne    LF0C7                 ; 2³
    cpx    #$09                  ; 2
    beq    LF0CC                 ; 2³
    cpx    #$0A                  ; 2
    beq    LF0CC                 ; 2³
LF0C7:
    jsr    LFB27                 ; 6
    bcs    LF0D3                 ; 2³
LF0CC:
    dex                          ; 2
    bne    LF0BB                 ; 2³
    ldx    #$12                  ; 2
    bne    LF0BB                 ; 2³
LF0D3:
    lda    LFFAD,X               ; 4
    sta.wy ram_A9,Y              ; 5
    lda    #$07                  ; 2
    jsr    LFB89                 ; 6
    inc    ram_9D                ; 5
    lda    #$09                  ; 2
    ldx    ram_81                ; 3
    bne    LF0F6                 ; 2³
    ldx    ram_80                ; 3
    lda    ram_84                ; 3
    clc                          ; 2
    adc    LFFE4,X               ; 4
    cmp    LFEEF,X               ; 4
    bcc    LF0F6                 ; 2³
    lda    LFEEF,X               ; 4
LF0F6:
    cmp    ram_9D                ; 3
    bne    LF130                 ; 2³+1
    lda    ram_84                ; 3
    bne    LF120                 ; 2³+1
    lda    ram_80                ; 3
    cmp    #$04                  ; 2
    bcc    LF120                 ; 2³
    lda    #$33                  ; 2
    sta    ram_D9                ; 3
    lda    #$F1                  ; 2
    sta    ram_DA                ; 3
    lda    #$13                  ; 2
    sta    ram_99                ; 3
    lda    #$00                  ; 2
    sta    ram_98                ; 3
    sta    ram_94                ; 3
    sta    ram_95                ; 3
    sta    ram_96                ; 3
    sta    ram_97                ; 3
    sta    ram_93                ; 3
    beq    LF130                 ; 2³
LF120:
    lda    #$33                  ; 2
    sta    ram_D9                ; 3
    lda    #$F2                  ; 2
    sta    ram_DA                ; 3
    lda    #$01                  ; 2
    clc                          ; 2
    adc    ram_81                ; 3
    jsr    LFB9D                 ; 6
LF130:
    jmp    LF44F                 ; 3

    lda    ram_98                ; 3
    cmp    #$FF                  ; 2
    bne    LF151                 ; 2³
    ldy    #$01                  ; 2
LF13B:
    sec                          ; 2
    ror    ram_94                ; 5
    rol    ram_95                ; 5
    ror    ram_96                ; 5
    rol    ram_97                ; 5
    dey                          ; 2
    bpl    LF13B                 ; 2³
    iny                          ; 2
    sty    ram_98                ; 3
    lda    ram_99                ; 3
    clc                          ; 2
    adc    #$08                  ; 2
    sta    ram_99                ; 3
LF151:
    sec                          ; 2
    ror    ram_98                ; 5
    lda    #$02                  ; 2
    jsr    LFB89                 ; 6
    inc    ram_93                ; 5
    ldx    ram_80                ; 3
    lda    LFC0F,X               ; 4
    cmp    ram_93                ; 3
    bne    LF176                 ; 2³
    lda    #$01                  ; 2
    sta    ram_93                ; 3
    clc                          ; 2
    adc    ram_81                ; 3
    jsr    LFB9D                 ; 6
    lda    #$33                  ; 2
    sta    ram_D9                ; 3
    lda    #$F2                  ; 2
    sta    ram_DA                ; 3
LF176:
    jmp    LF44F                 ; 3

    lda    ram_9B                ; 3
    lsr                          ; 2
    bcc    LF18D                 ; 2³
    dec    ram_91                ; 5
    bne    LF18D                 ; 2³
    inc    ram_84                ; 5
    lda    ram_80                ; 3
    cmp    #$04                  ; 2
    bcc    LF199                 ; 2³
    jsr    LF861                 ; 6
LF18D:
    jmp    LF44F                 ; 3

    lda    ram_9B                ; 3
    lsr                          ; 2
    bcc    LF1AF                 ; 2³
    dec    ram_92                ; 5
    bne    LF1AF                 ; 2³
LF199:
    lda    #$20                  ; 2
    sta    ram_85                ; 3
    lda    #$0B                  ; 2
    sta    ram_BF                ; 3
    lda    #$00                  ; 2
    sta    ram_C0                ; 3
    sta    ram_C1                ; 3
    lda    #$4F                  ; 2
    sta    ram_D9                ; 3
    lda    #$F4                  ; 2
    sta    ram_DA                ; 3
LF1AF:
    jmp    LF44F                 ; 3

    lda    ram_C6                ; 3
    beq    LF1D7                 ; 2³
    dec    ram_C6                ; 5
    lsr                          ; 2
    lsr                          ; 2
    and    #$03                  ; 2
    tax                          ; 2
    clc                          ; 2
    adc    #$0C                  ; 2
    sta    AUDF1                 ; 3
    lda    LFDF2,X               ; 4
    sta    ram_C7                ; 3
    lda    LFDF6,X               ; 4
    sta    ram_C9                ; 3
    lda    #$0C                  ; 2
    sta    AUDC1                 ; 3
    lda    #$03                  ; 2
    sta    AUDV1                 ; 3
    jmp    LF44F                 ; 3

LF1D7:
    sta    AUDV1                 ; 3
    lda    ram_80                ; 3
    cmp    #$04                  ; 2
    bcs    LF1E5                 ; 2³
    lda    #$00                  ; 2
    sta    ram_9F                ; 3
    beq    LF1F5                 ; 2³
LF1E5:
    lda    ram_83                ; 3
    bne    LF200                 ; 2³+1
    bit    ram_82                ; 3
    bvs    LF200                 ; 2³+1
    inc    ram_83                ; 5
    lda    #$00                  ; 2
    sta    ram_84                ; 3
    sta    ram_9E                ; 3
LF1F5:
    sta    ram_85                ; 3
    jsr    LF861                 ; 6
    lda    #$80                  ; 2
    sta    ram_8F                ; 3
    bne    LF20C                 ; 2³
LF200:
    lda    #$4F                  ; 2
    sta    ram_D9                ; 3
    lda    #$F4                  ; 2
    sta    ram_DA                ; 3
    lda    #$01                  ; 2
    sta    ram_85                ; 3
LF20C:
    jmp    LF44F                 ; 3

    lda    ram_9B                ; 3
    and    #$0F                  ; 2
    bne    LF21A                 ; 2³
    lda    #$05                  ; 2
    jsr    LFB89                 ; 6
LF21A:
    dec    ram_90                ; 5
    bne    LF22C                 ; 2³
    lda    #$33                  ; 2
    sta    ram_D9                ; 3
    lda    #$F2                  ; 2
    sta    ram_DA                ; 3
    lda    ram_87                ; 3
    and    #$7F                  ; 2
    sta    ram_87                ; 3
LF22C:
    bit    ram_87                ; 3
    bpl    LF233                 ; 2³
    jmp    LF44F                 ; 3

LF233:
    bit    CXPPMM                ; 3
    bpl    LF261                 ; 2³
    lda    ram_87                ; 3
    and    #$10                  ; 2
    beq    LF261                 ; 2³
    lda    ram_87                ; 3
    and    #$EF                  ; 2
    ora    #$80                  ; 2
    sta    ram_87                ; 3
    lda    ram_86                ; 3
    and    #$7F                  ; 2
    sta    ram_86                ; 3
    lda    #$0F                  ; 2
    sta    ram_D9                ; 3
    lda    #$F2                  ; 2
    sta    ram_DA                ; 3
    lda    #$78                  ; 2
    sta    ram_90                ; 3
    lda    #$00                  ; 2
    sta    ram_9E                ; 3
    sec                          ; 2
    adc    ram_81                ; 3
    jsr    LFB9D                 ; 6
LF261:
    lda    ram_80                ; 3
    cmp    #$04                  ; 2
    bcc    LF2B1                 ; 2³
    ldx    ram_81                ; 3
    lda    ram_A4,X              ; 4
    cmp    #$78                  ; 2
    bne    LF273                 ; 2³
    lda    ram_9E                ; 3
    bne    LF2B1                 ; 2³
LF273:
    dec    ram_93                ; 5
    bne    LF2B1                 ; 2³
    lda    #$B4                  ; 2
    sta    ram_93                ; 3
    lda    ram_98                ; 3
    bne    LF295                 ; 2³
    ldy    #$01                  ; 2
LF281:
    lsr    ram_97                ; 5
    rol    ram_96                ; 5
    ror    ram_95                ; 5
    rol    ram_94                ; 5
    dey                          ; 2
    bpl    LF281                 ; 2³
    sty    ram_98                ; 3
    lda    ram_99                ; 3
    sec                          ; 2
    sbc    #$08                  ; 2
    sta    ram_99                ; 3
LF295:
    asl    ram_98                ; 5
    lda    ram_94                ; 3
    ora    ram_98                ; 3
    bne    LF2B1                 ; 2³
    lda    #$05                  ; 2
    jsr    LFB9D                 ; 6
    lda    #$90                  ; 2
    sta    ram_D9                ; 3
    lda    #$F1                  ; 2
    sta    ram_DA                ; 3
    lda    #$FF                  ; 2
    sta    ram_92                ; 3
    jmp    LF44F                 ; 3

LF2B1:
    lda    ram_9D                ; 3
    bne    LF2D0                 ; 2³
    lda    ram_87                ; 3
    ora    ram_86                ; 3
    and    #$10                  ; 2
    ora    ram_90                ; 3
    bne    LF2D0                 ; 2³
    lda    #$04                  ; 2
    jsr    LFB9D                 ; 6
    lda    #$79                  ; 2
    sta    ram_D9                ; 3
    lda    #$F1                  ; 2
    sta    ram_DA                ; 3
    lda    #$96                  ; 2
    sta    ram_91                ; 3
LF2D0:
    lda    ram_86                ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    LFFE3,X               ; 4
    cmp    ram_A4                ; 3
    bne    LF2E1                 ; 2³
    lda    #$04                  ; 2
    jsr    LFB89                 ; 6
LF2E1:
    lda    ram_9B                ; 3
    and    #$01                  ; 2
    tax                          ; 2
    bne    LF2EC                 ; 2³
    lda    ram_90                ; 3
    bne    LF360                 ; 2³+1
LF2EC:
    lda    ram_9B                ; 3
    lsr                          ; 2
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFF00,Y               ; 4
    and    ram_A7,X              ; 4
    beq    LF360                 ; 2³+1
    lda    ram_86,X              ; 4
    and    #$0C                  ; 2
    beq    LF33E                 ; 2³+1
    and    #$04                  ; 2
    beq    LF308                 ; 2³
    inc    ram_A2,X              ; 6
    jmp    LF30A                 ; 3

LF308:
    dec    ram_A2,X              ; 6
LF30A:
    lda    ram_A4,X              ; 4
    cmp    #$6C                  ; 2
    bne    LF32C                 ; 2³
    lda    ram_A2,X              ; 4
    cmp    #$4C                  ; 2
    beq    LF33E                 ; 2³
    cmp    #$54                  ; 2
    beq    LF33E                 ; 2³
    cmp    #$50                  ; 2
    bne    LF324                 ; 2³
    lda    ram_86,X              ; 4
    and    #$F3                  ; 2
    sta    ram_86,X              ; 4
LF324:
    ldy    #$17                  ; 2
    lda    ram_80                ; 3
    cmp    #$04                  ; 2
    bcc    LF32E                 ; 2³
LF32C:
    ldy    #$11                  ; 2
LF32E:
    lda    ram_A2,X              ; 4
LF330:
    cmp    LFC5F,Y               ; 4
    bne    LF33B                 ; 2³
    lda    ram_86,X              ; 4
    and    #$F3                  ; 2
    sta    ram_86,X              ; 4
LF33B:
    dey                          ; 2
    bpl    LF330                 ; 2³
LF33E:
    lda    ram_86,X              ; 4
    and    #$03                  ; 2
    beq    LF360                 ; 2³
    lsr                          ; 2
    bcc    LF34C                 ; 2³
    dec    ram_A4,X              ; 6
    jmp    LF34E                 ; 3

LF34C:
    inc    ram_A4,X              ; 6
LF34E:
    lda    ram_A4,X              ; 4
    ldy    #$0A                  ; 2
LF352:
    cmp    LFC78,Y               ; 4
    bne    LF35D                 ; 2³
    lda    ram_86,X              ; 4
    and    #$FC                  ; 2
    sta    ram_86,X              ; 4
LF35D:
    dey                          ; 2
    bpl    LF352                 ; 2³
LF360:
    ldy    ram_81                ; 3
    lda.wy ram_A4,Y              ; 4
    cmp    #$78                  ; 2
    bne    LF3B1                 ; 2³
    lda.wy ram_86,Y              ; 4
    and    #$10                  ; 2
    beq    LF3B1                 ; 2³
    lda    ram_9B                ; 3
    and    #$1F                  ; 2
    bne    LF3AE                 ; 2³
    sta    AUDV0                 ; 3
    jsr    LFB9D                 ; 6
    ldx    ram_83                ; 3
    sed                          ; 2
    lda    ram_9F,X              ; 4
    clc                          ; 2
    adc    #$01                  ; 2
    sta    ram_9F,X              ; 4
    cld                          ; 2
    lda    #$07                  ; 2
    dec    ram_9E                ; 5
    bne    LF3AB                 ; 2³
    lda.wy ram_86,Y              ; 4
    and    #$EF                  ; 2
    sta.wy ram_86,Y              ; 5
    lda    ram_86                ; 3
    and    #$7F                  ; 2
    sta    ram_86                ; 3
    ldx    ram_A6                ; 3
    lda    LFCED,X               ; 4
    sta    ram_A6                ; 3
    lda    #$01                  ; 2
    clc                          ; 2
    adc    ram_81                ; 3
    jsr    LFB9D                 ; 6
    lda    #$06                  ; 2
LF3AB:
    jsr    LFB89                 ; 6
LF3AE:
    jmp    LF414                 ; 3

LF3B1:
    ldy    ram_81                ; 3
    beq    LF3B8                 ; 2³
    jsr    LF9EF                 ; 6
LF3B8:
    ldy    #$00                  ; 2
    lda    ram_86                ; 3
    and    #$0F                  ; 2
    ora    ram_81                ; 3
    bne    LF3F2                 ; 2³
    ldx    ram_BE                ; 3
    bne    LF407                 ; 2³+1
    lda    ram_BD                ; 3
    cmp    #$05                  ; 2
    bne    LF407                 ; 2³+1
    stx    ram_BD                ; 3
    lda    ram_80                ; 3
    cmp    #$04                  ; 2
    bcs    LF3DB                 ; 2³
    lda    ram_9E                ; 3
    beq    LF3DB                 ; 2³
    clc                          ; 2
    bcc    LF3DE                 ; 2³
LF3DB:
    jsr    LF91F                 ; 6
LF3DE:
    lda    #$01                  ; 2
    bcc    LF3EC                 ; 2³
    inc    ram_9E                ; 5
    lda    ram_86                ; 3
    ora    #$10                  ; 2
    sta    ram_86                ; 3
    lda    #$07                  ; 2
LF3EC:
    jsr    LFB89                 ; 6
    jmp    LF407                 ; 3

LF3F2:
    bit    ram_86                ; 3
    bpl    LF407                 ; 2³+1
    jsr    LF91F                 ; 6
    bcc    LF407                 ; 2³+1
    lda    #$0F                  ; 2
    sta    ram_D9                ; 3
    lda    #$F2                  ; 2
    sta    ram_DA                ; 3
    lda    #$B4                  ; 2
    sta    ram_90                ; 3
LF407:
    ldy    ram_81                ; 3
    bne    LF411                 ; 2³
    jsr    LF9EF                 ; 6
    jmp    LF414                 ; 3

LF411:
    jsr    LFA75                 ; 6
LF414:
    ldy    ram_81                ; 3
    beq    LF44F                 ; 2³
    lda    ram_87                ; 3
    and    #$0F                  ; 2
    ora    ram_BE                ; 3
    bne    LF44F                 ; 2³
    lda    ram_BD                ; 3
    cmp    #$05                  ; 2
    bne    LF44F                 ; 2³
    jsr    LF91F                 ; 6
    bcs    LF433                 ; 2³
    lda    #$00                  ; 2
    sta    ram_BD                ; 3
    lda    #$01                  ; 2
    bne    LF44C                 ; 2³
LF433:
    lda    ram_86                ; 3
    ora    #$80                  ; 2
    sta    ram_86                ; 3
    lda    #$03                  ; 2
    jsr    LFB9D                 ; 6
    inc    ram_9E                ; 5
    lda    ram_87                ; 3
    ora    #$10                  ; 2
    sta    ram_87                ; 3
    lda    #$40                  ; 2
    sta    ram_A1                ; 3
    lda    #$07                  ; 2
LF44C:
    jsr    LFB89                 ; 6
LF44F:
    jsr    LF7BA                 ; 6
LF452:
    ldx    INTIM                 ; 4
    bne    LF452                 ; 2³
    lda    #$02                  ; 2
    sta    VSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$00                  ; 2
    stx    VSYNC                 ; 3
    lda    #$27                  ; 2
    sta    TIM64T                ; 4
    inx                          ; 2
    jsr    LF9B9                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    ram_A2                ; 3
    lda    LFF0F,X               ; 4
    sta.w  HMP0                  ; 4
    and    #$0F                  ; 2
    tay                          ; 2
LF47D:
    dey                          ; 2
    bpl    LF47D                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    ram_A3                ; 3
    lda    LFF0F,X               ; 4
    sta.w  HMP1                  ; 4
    and    #$0F                  ; 2
    tay                          ; 2
LF48F:
    dey                          ; 2
    bpl    LF48F                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    ram_83                ; 3
    beq    LF49F                 ; 2³
    jsr    LFB71                 ; 6
LF49F:
    lda    ram_B3                ; 3
    beq    LF4E1                 ; 2³
    lda    ram_B5                ; 3
    beq    LF4AB                 ; 2³
    dec    ram_B5                ; 5
    bpl    LF4E1                 ; 2³
LF4AB:
    dec    ram_BB                ; 5
    bpl    LF4B5                 ; 2³
    lda    #$00                  ; 2
    sta    ram_B3                ; 3
    beq    LF4E1                 ; 2³
LF4B5:
    ldy    ram_BB                ; 3
    lda    (ram_B8),Y            ; 5
    tax                          ; 2
    and    #$7F                  ; 2
    cmp    #$20                  ; 2
    bcs    LF4C6                 ; 2³
    and    #$1F                  ; 2
    sta    AUDV1                 ; 3
    bpl    LF4DE                 ; 2³
LF4C6:
    cmp    #$40                  ; 2
    bcs    LF4D0                 ; 2³
    and    #$1F                  ; 2
    sta    AUDF1                 ; 3
    bpl    LF4DE                 ; 2³
LF4D0:
    cmp    #$60                  ; 2
    bcs    LF4DA                 ; 2³
    and    #$1F                  ; 2
    sta    AUDC1                 ; 3
    bpl    LF4DE                 ; 2³
LF4DA:
    and    #$1F                  ; 2
    sta    ram_B5                ; 3
LF4DE:
    txa                          ; 2
    bpl    LF4AB                 ; 2³
LF4E1:
    lda    ram_B2                ; 3
    beq    LF52B                 ; 2³+1
    ldx    ram_BC                ; 3
    cpx    #$02                  ; 2
    bne    LF4EF                 ; 2³
    dec    ram_B4                ; 5
    bne    LF52B                 ; 2³+1
LF4EF:
    ldy    ram_BA                ; 3
    lda    (ram_B6),Y            ; 5
    and    #$F0                  ; 2
    beq    LF4FA                 ; 2³
    lda    LFC49,X               ; 4
LF4FA:
    sta    AUDV0                 ; 3
    dec    ram_BC                ; 5
    bpl    LF52B                 ; 2³
    dec    ram_BA                ; 5
    bpl    LF50B                 ; 2³
    ldy    ram_B2                ; 3
    lda    LFC2C,Y               ; 4
    sta    ram_BA                ; 3
LF50B:
    ldy    ram_BA                ; 3
    lda    (ram_B6),Y            ; 5
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LFC3D,X               ; 4
    sta    AUDF0                 ; 3
    lda    #$0C                  ; 2
    sta    AUDC0                 ; 3
    lda    (ram_B6),Y            ; 5
    and    #$0F                  ; 2
    tax                          ; 2
    lda    LFC32,X               ; 4
    sta    ram_B4                ; 3
    lda    #$04                  ; 2
    sta    ram_BC                ; 3
LF52B:
    lda    ram_85                ; 3
    and    #$20                  ; 2
    bne    LF534                 ; 2³
    jmp    LF618                 ; 3

LF534:
    lda    ram_C0                ; 3
    beq    LF53F                 ; 2³
    dec    ram_C0                ; 5
    beq    LF53F                 ; 2³
    jmp    LF5FA                 ; 3

LF53F:
    dec    ram_BF                ; 5
    ldy    ram_BF                ; 3
    lda    LFE73,Y               ; 4
    cmp    #$0F                  ; 2
    bcs    LF561                 ; 2³
    tax                          ; 2
    lda    LFDD4,X               ; 4
    sta    ram_E3                ; 3
    lda    LFDD7,X               ; 4
    sta    ram_E4                ; 3
    lda    LFDDA,X               ; 4
    sta    ram_E1                ; 3
    lda    LFDDD,X               ; 4
    sta    ram_E2                ; 3
    bne    LF53F                 ; 2³
LF561:
    cmp    #$1F                  ; 2
    bcs    LF57C                 ; 2³
    and    #$0F                  ; 2
    tax                          ; 2
    lda    LFDE0,X               ; 4
    sta    ram_F1                ; 3
    lda    LFC0E,X               ; 4
    cpx    #$03                  ; 2
    bne    LF577                 ; 2³
    jsr    LF993                 ; 6
LF577:
    sta    ram_CB                ; 3
    jmp    LF53F                 ; 3

LF57C:
    cmp    #$20                  ; 2
    bne    LF58A                 ; 2³
    dec    ram_BF                ; 5
    lda    LFE72,Y               ; 4
    sta    ram_CE                ; 3
    jmp    LF53F                 ; 3

LF58A:
    cmp    #$30                  ; 2
    bne    LF598                 ; 2³
    dec    ram_BF                ; 5
    lda    LFE72,Y               ; 4
    sta    ram_F3                ; 3
    jmp    LF53F                 ; 3

LF598:
    cmp    #$40                  ; 2
    bne    LF5C1                 ; 2³
    dec    ram_BF                ; 5
    dec    ram_BF                ; 5
    lda    LFE72,Y               ; 4
    jsr    LFB59                 ; 6
LF5A6:
    dex                          ; 2
    bmi    LF5AD                 ; 2³
    asl                          ; 2
    jmp    LF5A6                 ; 3

LF5AD:
    sta    ram_CC                ; 3
    lda    LFE71,Y               ; 4
    jsr    LFB59                 ; 6
LF5B5:
    dex                          ; 2
    bmi    LF5BC                 ; 2³
    asl                          ; 2
    jmp    LF5B5                 ; 3

LF5BC:
    sta    ram_CD                ; 3
    jmp    LF53F                 ; 3

LF5C1:
    cmp    #$5F                  ; 2
    bcs    LF5CD                 ; 2³
    and    #$0F                  ; 2
    jsr    LFB89                 ; 6
    jmp    LF53F                 ; 3

LF5CD:
    and    #$7F                  ; 2
    jsr    LFB59                 ; 6
LF5D2:
    dex                          ; 2
    bmi    LF5D9                 ; 2³
    lsr                          ; 2
    jmp    LF5D2                 ; 3

LF5D9:
    sta    ram_C0                ; 3
    lda    ram_BF                ; 3
    cmp    #$3F                  ; 2
    bne    LF5EA                 ; 2³
    sed                          ; 2
    lda    ram_C1                ; 3
    clc                          ; 2
    adc    #$01                  ; 2
    sta    ram_C1                ; 3
    cld                          ; 2
LF5EA:
    lda    ram_BF                ; 3
    bne    LF5FA                 ; 2³
    ldx    ram_83                ; 3
    lda    ram_9F,X              ; 4
    cmp    ram_C1                ; 3
    beq    LF608                 ; 2³+1
    lda    #$45                  ; 2
    sta    ram_BF                ; 3
LF5FA:
    jsr    LF8CB                 ; 6
    lda    #$AD                  ; 2
    sta    ram_C7                ; 3
    lda    #$C4                  ; 2
    sta    ram_C9                ; 3
    jmp    LF618                 ; 3

LF608:
    lda    #$08                  ; 2
    sta    ram_85                ; 3
    lda    #$B2                  ; 2
    sta    ram_D9                ; 3
    lda    #$F1                  ; 2
    sta    ram_DA                ; 3
    lda    #$70                  ; 2
    sta    ram_C6                ; 3
LF618:
    lda    ram_85                ; 3
    and    #$28                  ; 2
    beq    LF629                 ; 2³
    lda    #$D3                  ; 2
    sta    ram_F8                ; 3
    lda    #$58                  ; 2
    sta    ram_F7                ; 3
    jmp    LF7A2                 ; 3

LF629:
    ldy    #$00                  ; 2
    lda    ram_90                ; 3
    beq    LF640                 ; 2³
    cmp    #$82                  ; 2
    bcc    LF637                 ; 2³
    lda    #$20                  ; 2
    bne    LF65F                 ; 2³
LF637:
    lda    ram_9B                ; 3
    lsr                          ; 2
    sta    REFP0                 ; 3
    lda    #$50                  ; 2
    bne    LF661                 ; 2³
LF640:
    lda    ram_86                ; 3
    and    #$0C                  ; 2
    beq    LF64F                 ; 2³
    jsr    LF95B                 ; 6
    lda    LFEB8,X               ; 4
    jmp    LF655                 ; 3

LF64F:
    jsr    LF977                 ; 6
    lda    LFEC8,X               ; 4
LF655:
    ldx    ram_A4                ; 3
    beq    LF65F                 ; 2³
    cpx    #$05                  ; 2
    bcs    LF65F                 ; 2³
    lda    #$60                  ; 2
LF65F:
    sta    REFP0                 ; 3
LF661:
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LFCB9,X               ; 4
    clc                          ; 2
    adc    ram_A4                ; 3
    sta    ram_ED                ; 3
    lda    #$00                  ; 2
    adc    LFCC0,X               ; 4
    sta    ram_EE                ; 3
    ldy    #$01                  ; 2
    lda    ram_87                ; 3
    and    #$0F                  ; 2
    beq    LF69D                 ; 2³
    and    #$0C                  ; 2
    beq    LF694                 ; 2³
    jsr    LF95B                 ; 6
    lda    ram_87                ; 3
    and    #$08                  ; 2
    beq    LF68E                 ; 2³
    lda    LFEE0,X               ; 4
    tax                          ; 2
LF68E:
    lda    LFC91,X               ; 4
    jmp    LF6A9                 ; 3

LF694:
    jsr    LF977                 ; 6
    lda    LFCA1,X               ; 4
    jmp    LF6A9                 ; 3

LF69D:
    lda    ram_87                ; 3
    and    #$10                  ; 2
    beq    LF6A7                 ; 2³
    lda    #$80                  ; 2
    bne    LF6A9                 ; 2³
LF6A7:
    lda    #$00                  ; 2
LF6A9:
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LFCC7,X               ; 4
    clc                          ; 2
    adc    ram_A5                ; 3
    sta    ram_EF                ; 3
    lda    #$00                  ; 2
    adc    LFCD7,X               ; 4
    sta    ram_F0                ; 3
    lda    #$D9                  ; 2
    sta    ram_F8                ; 3
    lda    #$D8                  ; 2
    sta    ram_F7                ; 3
    jmp    LFFF2                 ; 3

    ldy    LFCF1,X               ; 4
    bit    ram_85                ; 3
    bvs    LF6D8                 ; 2³
    cpy    ram_E5                ; 3
    beq    LF6DA                 ; 2³
    ldy    ram_E5                ; 3
    jsr    LF9AC                 ; 6
LF6D8:
    sty    ram_E5                ; 3
LF6DA:
    lda    ram_9F                ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    ldy    LFCF1,X               ; 4
    bit    ram_85                ; 3
    bvs    LF6F5                 ; 2³
    lda    ram_9F                ; 3
    cmp    #$01                  ; 2
    beq    LF6F5                 ; 2³
    cpy    ram_E7                ; 3
    beq    LF6F7                 ; 2³
    ldy    ram_E7                ; 3
    jsr    LF9AC                 ; 6
LF6F5:
    sty    ram_E7                ; 3
LF6F7:
    lda    ram_A0                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    ldy    LFCF1,X               ; 4
    bit    ram_85                ; 3
    bvs    LF70E                 ; 2³
    cpy    ram_E9                ; 3
    beq    LF710                 ; 2³
    ldy    ram_E9                ; 3
    jsr    LF9AC                 ; 6
LF70E:
    sty    ram_E9                ; 3
LF710:
    lda    ram_A0                ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    ldy    LFCF1,X               ; 4
    bit    ram_85                ; 3
    bvs    LF72B                 ; 2³
    lda    ram_A0                ; 3
    cmp    #$01                  ; 2
    beq    LF72B                 ; 2³
    cpy    ram_EB                ; 3
    beq    LF72D                 ; 2³
    ldy    ram_EB                ; 3
    jsr    LF9AC                 ; 6
LF72B:
    sty    ram_EB                ; 3
LF72D:
    lda    #$55                  ; 2
    clc                          ; 2
    adc    ram_A4                ; 3
    sta    ram_F1                ; 3
    lda    #$00                  ; 2
    adc    #$DB                  ; 2
    sta    ram_F2                ; 3
    lda    #$56                  ; 2
    clc                          ; 2
    adc    ram_A4                ; 3
    sta    ram_F3                ; 3
    lda    #$00                  ; 2
    adc    #$D6                  ; 2
    sta    ram_F4                ; 3
    lda    #$56                  ; 2
    clc                          ; 2
    adc    ram_A5                ; 3
    sta    ram_F5                ; 3
    lda    #$00                  ; 2
    adc    #$D6                  ; 2
    sta    ram_F6                ; 3
    ldx    #$04                  ; 2
    lda    ram_B3                ; 3
    cmp    #$07                  ; 2
    beq    LF772                 ; 2³
    cmp    #$06                  ; 2
    bne    LF770                 ; 2³
    lda    ram_BB                ; 3
    cmp    #$2D                  ; 2
    bcs    LF772                 ; 2³
    lda    ram_9B                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$03                  ; 2
    tax                          ; 2
    bcs    LF772                 ; 2³
LF770:
    ldx    #$05                  ; 2
LF772:
    lda    LFCE7,X               ; 4
    sta    ram_E1                ; 3
    lda    LFDFA,X               ; 4
    sta    ram_E3                ; 3
    lda    #$DC                  ; 2
    sta    ram_E2                ; 3
    sta    ram_E4                ; 3
    ldx    ram_99                ; 3
    lda    LFF10,X               ; 4
    sta    ram_9A                ; 3
    ldx    #$02                  ; 2
    jsr    LF9B9                 ; 6
    lda    #$6D                  ; 2
    sta    ram_F7                ; 3
    lda    #$D0                  ; 2
    sta    ram_F8                ; 3
    bit    ram_85                ; 3
    bpl    LF7A2                 ; 2³
    lda    #$D6                  ; 2
    sta    ram_F7                ; 3
    lda    #$D4                  ; 2
    sta    ram_F8                ; 3
LF7A2:
    ldy    INTIM                 ; 4
    bne    LF7A2                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_91                ; 3
    beq    LF7B1                 ; 2³
    cmp    #$14                  ; 2
    bcc    LF7B3                 ; 2³
LF7B1:
    sty    VBLANK                ; 3
LF7B3:
    sty    CXCLR                 ; 3
    sty    HMCLR                 ; 3
    jmp    LFFF2                 ; 3

LF7BA:
    lda    SWCHB                 ; 4
    ror                          ; 2
    bcc    LF82C                 ; 2³+1
    ror                          ; 2
    bcc    LF7C8                 ; 2³
    ldx    #$01                  ; 2
    stx    ram_8E                ; 3
LF7C7:
    rts                          ; 6

LF7C8:
    dec    ram_8E                ; 5
    bne    LF7C7                 ; 2³
LF7CC:
    lda    #$20                  ; 2
    sta    ram_8E                ; 3
    ldx    ram_80                ; 3
    bit    ram_85                ; 3
    bvc    LF7DF                 ; 2³
    inx                          ; 2
    cpx    #$12                  ; 2
    bne    LF7DD                 ; 2³
    ldx    #$01                  ; 2
LF7DD:
    stx    ram_80                ; 3
LF7DF:
    lda    LFBDB,X               ; 4
    tay                          ; 2
    and    #$1F                  ; 2
    sta    ram_9F                ; 3
    tya                          ; 2
    rol                          ; 2
    rol                          ; 2
    rol                          ; 2
    and    #$03                  ; 2
    sta    ram_A0                ; 3
    tya                          ; 2
    sta    ram_82                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$01                  ; 2
    sta    ram_81                ; 3
    jsr    LF861                 ; 6
    ldx    #$00                  ; 2
    stx    ram_B3                ; 3
    stx    AUDV1                 ; 3
    stx    ram_8F                ; 3
    stx    ram_98                ; 3
    dex                          ; 2
    stx    ram_94                ; 3
    stx    ram_95                ; 3
    stx    ram_96                ; 3
    stx    ram_97                ; 3
    ldx    ram_80                ; 3
    lda    LFBFA,X               ; 4
    sta    ram_A7                ; 3
    lda    LFBEC,X               ; 4
    sta    ram_A8                ; 3
    lda    #$40                  ; 2
    sta    ram_85                ; 3
    lda    #$4F                  ; 2
    sta    ram_D9                ; 3
    lda    #$F4                  ; 2
    sta    ram_DA                ; 3
    jmp    LF84B                 ; 3

LF82C:
    dec    ram_8E                ; 5
    bne    LF7C7                 ; 2³+1
    ldx    #$10                  ; 2
    stx    ram_8E                ; 3
    lda    #$00                  ; 2
    sta    ram_9F                ; 3
    sta    ram_A0                ; 3
    sta    ram_94                ; 3
    sta    ram_95                ; 3
    sta    ram_96                ; 3
    sta    ram_97                ; 3
    sta    ram_98                ; 3
    sta    ram_83                ; 3
    sta    ram_85                ; 3
    jsr    LF861                 ; 6
LF84B:
    ldy    #$00                  ; 2
    sty    ram_84                ; 3
    sty    ram_B2                ; 3
    sty    AUDV0                 ; 3
    sty    ram_91                ; 3
    sty    ram_D7                ; 3
    iny                          ; 2
    sty    ram_9C                ; 3
    lda    #$FF                  ; 2
    sta    ram_D8                ; 3
    sta    CXCLR                 ; 3
    rts                          ; 6

LF861:
    lda    #$9C                  ; 2
    sta    ram_D9                ; 3
    lda    #$F0                  ; 2
    sta    ram_DA                ; 3
    ldx    ram_80                ; 3
    lda    LFBC6,X               ; 4
    sta    ram_D2                ; 3
    jsr    LF993                 ; 6
    and    #$03                  ; 2
    tax                          ; 2
    lda    LFBD8,X               ; 4
    clc                          ; 2
    adc    ram_D2                ; 3
    sta    ram_DB                ; 3
    jsr    LF993                 ; 6
    and    #$03                  ; 2
    tax                          ; 2
    lda    LFBD8,X               ; 4
    clc                          ; 2
    adc    ram_D2                ; 3
    sta    ram_DD                ; 3
    jsr    LF993                 ; 6
    and    #$03                  ; 2
    tax                          ; 2
    lda    LFBD8,X               ; 4
    clc                          ; 2
    adc    ram_D2                ; 3
    sta    ram_DF                ; 3
    lda    #$80                  ; 2
    sta    ram_8F                ; 3
    ldx    #$08                  ; 2
    lda    #$00                  ; 2
LF8A2:
    sta    ram_A9,X              ; 4
    dex                          ; 2
    bpl    LF8A2                 ; 2³
    sta    ram_9D                ; 3
    sta    ram_90                ; 3
    sta    ram_A1                ; 3
    sta    ram_9E                ; 3
    sta    ram_BD                ; 3
    sta    ram_87                ; 3
    ldx    ram_81                ; 3
    lda    LFC0E,X               ; 4
    sta    ram_86                ; 3
    lda    #$50                  ; 2
    sta    ram_A2                ; 3
    sta    ram_A3                ; 3
    lda    LFC0D,X               ; 4
    sta    ram_A4                ; 3
    lda    LFC0C,X               ; 4
    sta    ram_A5                ; 3
    rts                          ; 6

LF8CB:
    lda    #$DA                  ; 2
    sta    ram_C8                ; 3
    sta    ram_CA                ; 3
    lda    ram_CE                ; 3
    clc                          ; 2
    adc    ram_CC                ; 3
    sta    ram_CE                ; 3
    lda    #$38                  ; 2
    sec                          ; 2
    sbc    ram_CE                ; 3
    sta    ram_CF                ; 3
    lda    #$9B                  ; 2
    clc                          ; 2
    adc    ram_CE                ; 3
    sta    ram_ED                ; 3
    lda    #$00                  ; 2
    adc    #$DB                  ; 2
    sta    ram_EE                ; 3
    lda    #$6B                  ; 2
    clc                          ; 2
    adc    ram_CE                ; 3
    sta    ram_EF                ; 3
    lda    #$00                  ; 2
    adc    #$DA                  ; 2
    sta    ram_F0                ; 3
    lda    ram_F3                ; 3
    clc                          ; 2
    adc    ram_CD                ; 3
    sta    ram_F3                ; 3
    lda    ram_C1                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LFCF1,X               ; 4
    sta    ram_C2                ; 3
    lda    ram_C1                ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    LFCF1,X               ; 4
    sta    ram_C4                ; 3
    lda    #$DF                  ; 2
    sta    ram_F2                ; 3
    lda    #$D6                  ; 2
    sta    ram_F4                ; 3
    rts                          ; 6

LF91F:
    lda.wy ram_86,Y              ; 4
    and    #$0F                  ; 2
    bne    LF959                 ; 2³
    lda.wy ram_A2,Y              ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LFFAD,X               ; 4
    sta    ram_D2                ; 3
    lda.wy ram_A4,Y              ; 4
    beq    LF959                 ; 2³
    ldx    #$0C                  ; 2
LF939:
    dex                          ; 2
    cmp    LFC77,X               ; 4
    bne    LF939                 ; 2³
    lda    LFC84,X               ; 4
    tax                          ; 2
    lda    ram_A9,X              ; 4
    cmp    ram_D2                ; 3
    bne    LF959                 ; 2³
    lda    #$00                  ; 2
    sta    ram_A9,X              ; 4
    dec    ram_9D                ; 5
    cpy    ram_81                ; 3
    bne    LF957                 ; 2³
    lda    #$01                  ; 2
    sta    ram_BE                ; 3
LF957:
    sec                          ; 2
    rts                          ; 6

LF959:
    clc                          ; 2
    rts                          ; 6

LF95B:
    lda.wy ram_A2,Y              ; 4
    sec                          ; 2
    sbc    #$04                  ; 2
LF961:
    cmp    #$08                  ; 2
    bcc    LF96A                 ; 2³
    sec                          ; 2
    sbc    #$08                  ; 2
    bne    LF961                 ; 2³
LF96A:
    sta    ram_D2                ; 3
    lda.wy ram_86,Y              ; 4
    and    #$10                  ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    ram_D2                ; 3
    tax                          ; 2
    rts                          ; 6

LF977:
    lda.wy ram_A4,Y              ; 4
LF97A:
    cmp    #$0C                  ; 2
    bcc    LF983                 ; 2³
    sec                          ; 2
    sbc    #$0C                  ; 2
    bne    LF97A                 ; 2³
LF983:
    sta    ram_D2                ; 3
    lda.wy ram_86,Y              ; 4
    and    #$10                  ; 2
    beq    LF98E                 ; 2³
    lda    #$0C                  ; 2
LF98E:
    clc                          ; 2
    adc    ram_D2                ; 3
    tax                          ; 2
    rts                          ; 6

LF993:
    lda    ram_D0                ; 3
    ldx    ram_D1                ; 3
    eor    LF04D,X               ; 4
    eor    ram_80,X              ; 4
    eor    ram_9B                ; 3
    eor    ram_9C                ; 3
    eor    INTIM                 ; 4
    asl                          ; 2
    adc    #$00                  ; 2
    inx                          ; 2
    stx    ram_D1                ; 3
    sta    ram_D0                ; 3
    rts                          ; 6

LF9AC:
    lda    ram_9B                ; 3
    lsr                          ; 2
    bcc    LF9B8                 ; 2³
    iny                          ; 2
    cpy    #$B4                  ; 2
    bne    LF9B8                 ; 2³
    ldy    #$78                  ; 2
LF9B8:
    rts                          ; 6
    
LF9B9:

  IF ORIGINAL
  
    ldy    LFFDD,X               ; 4
    bit    INPT0                 ; 3
    bmi    LF9C6                 ; 2³
    bit    INPT1                 ; 3
    bpl    LF9D4                 ; 2³
    sty    ram_BD                ; 3
LF9C6:
    iny                          ; 2
    bit    INPT1                 ; 3
    bmi    LF9CD                 ; 2³
    sty    ram_BD                ; 3
LF9CD:
    iny                          ; 2
    bit    INPT4                 ; 3
    bmi    LF9D4                 ; 2³
    sty    ram_BD                ; 3

  ELSE

    LDY    #5
    BIT    INPT4
    BPL    .storeResult
    INY                        ; Y=6
    LDA    SWCHA
    BPL    .storeResult
    LDY    #4
    ASL
    BPL    .storeResult
    LDY    #8
    ASL
    BPL    .storeResult
    LDY    #2
    ASL
    BPL    .storeResult
    .byte $0C                  ; skip 2 bytes
.storeResult:
    STY     ram_BD
    NOP
    NOP
    NOP

  ENDIF
    
LF9D4:
    lda    ram_BD                ; 3
    beq    LF9E0                 ; 2³
    cmp    #$05                  ; 2
    beq    LF9E0                 ; 2³
    lda    #$00                  ; 2
    sta    ram_BE                ; 3
LF9E0:
    lda    #$82                  ; 2
    sta    VBLANK                ; 3
    lda    #$02                  ; 2
    sta    VBLANK                ; 3
    
  IF ORIGINAL  
    lda    LFFE0,X               ; 4
    sta    SWCHA                 ; 4
  ENDIF
  
    rts                          ; 6

    
     ORG $19EF
    RORG $F9EF
    
LF9EF:
    lda    ram_BD                ; 3
    beq    LF9F6                 ; 2³
    lsr                          ; 2
    bcc    LF9F7                 ; 2³
LF9F6:
    rts                          ; 6

LF9F7:
    sty    ram_D2                ; 3
    sta    ram_D3                ; 3
    tax                          ; 2
    lda    #$01                  ; 2
    sta    ram_9C                ; 3
    lda    ram_85                ; 3
    and    #$7F                  ; 2
    sta    ram_85                ; 3
    lda.wy ram_86,Y              ; 4
    and    #$0F                  ; 2
    beq    LFA23                 ; 2³
    and    #$0C                  ; 2
    beq    LFA1A                 ; 2³
    cpx    #$02                  ; 2
    beq    LFA61                 ; 2³
    cpx    #$03                  ; 2
    beq    LFA61                 ; 2³
    rts                          ; 6

LFA1A:
    cpx    #$01                  ; 2
    beq    LFA61                 ; 2³
    cpx    #$04                  ; 2
    beq    LFA61                 ; 2³
    rts                          ; 6

LFA23:
    lda.wy ram_A2,Y              ; 4
    sta    ram_D5                ; 3
    clc                          ; 2
    adc    LFDED,X               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_D4                ; 3
    lda.wy ram_A4,Y              ; 4
    cmp    #$78                  ; 2
    bne    LFA3C                 ; 2³
    cpx    #$01                  ; 2
    bne    LFA59                 ; 2³
LFA3C:
    clc                          ; 2
    adc    LFFED,X               ; 4
    ldy    #$0D                  ; 2
LFA42:
    dey                          ; 2
    cmp    LFC77,Y               ; 4
    bne    LFA42                 ; 2³
    lda    LFC84,Y               ; 4
    tay                          ; 2
    cpy    #$09                  ; 2
    beq    LFA59                 ; 2³
    lda    ram_D5                ; 3
    ldx    ram_D4                ; 3
    jsr    LFB27                 ; 6
    bcs    LFA61                 ; 2³
LFA59:
    lda    #$01                  ; 2
    jsr    LFB89                 ; 6
    jmp    LFA70                 ; 3

LFA61:
    ldy    ram_D2                ; 3
    ldx    ram_D3                ; 3
    lda.wy ram_86,Y              ; 4
    and    #$F0                  ; 2
    ora    LFFD8,X               ; 4
    sta.wy ram_86,Y              ; 5
LFA70:
    lda    #$00                  ; 2
    sta    ram_BD                ; 3
    rts                          ; 6

LFA75:
    lda    ram_86                ; 3
    and    #$0F                  ; 2
    beq    LFA7C                 ; 2³
    rts                          ; 6

LFA7C:
    lda    #$01                  ; 2
    sta    ram_D2                ; 3
    sta    ram_D3                ; 3
    sta    ram_D4                ; 3
    lda    #$03                  ; 2
    sta    ram_D5                ; 3
    bit    ram_86                ; 3
    bmi    LFA94                 ; 2³
    sta    ram_D4                ; 3
    lda    #$01                  ; 2
    sta    ram_D5                ; 3
    bne    LFAB8                 ; 2³
LFA94:
    lda    ram_A2                ; 3
    cmp    ram_A3                ; 3
    beq    LFAA6                 ; 2³
    bcc    LFAA2                 ; 2³
    inc    ram_D2                ; 5
    inc    ram_D2                ; 5
    bpl    LFAA6                 ; 2³
LFAA2:
    inc    ram_D3                ; 5
    inc    ram_D3                ; 5
LFAA6:
    lda    ram_A4                ; 3
    cmp    ram_A5                ; 3
    beq    LFAB8                 ; 2³
    bcc    LFAB4                 ; 2³
    inc    ram_D4                ; 5
    inc    ram_D4                ; 5
    bpl    LFAB8                 ; 2³
LFAB4:
    inc    ram_D5                ; 5
    inc    ram_D5                ; 5
LFAB8:
    ldy    #$03                  ; 2
LFABA:
    cpy    ram_A6                ; 3
    beq    LFAC7                 ; 2³
    lda.wy ram_D2,Y              ; 4
    clc                          ; 2
    adc    #$03                  ; 2
    sta.wy ram_D2,Y              ; 5
LFAC7:
    dey                          ; 2
    bpl    LFABA                 ; 2³
    ldx    #$03                  ; 2
LFACC:
    stx    ram_D6                ; 3
    lda    ram_A4                ; 3
    clc                          ; 2
    adc    LFC5C,X               ; 4
    ldy    #$0D                  ; 2
LFAD6:
    dey                          ; 2
    cmp    LFC77,Y               ; 4
    bne    LFAD6                 ; 2³
    lda    LFC84,Y               ; 4
    tay                          ; 2
    lda    ram_A2                ; 3
    clc                          ; 2
    adc    LFC5A,X               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    cpy    #$FF                  ; 2
    bne    LFAF4                 ; 2³
    lda    ram_D6                ; 3
    cmp    #$03                  ; 2
    bne    LFAFB                 ; 2³
LFAF4:
    lda    ram_A2                ; 3
    jsr    LFB27                 ; 6
    bcs    LFB01                 ; 2³+1
LFAFB:
    ldx    ram_D6                ; 3
    lda    #$00                  ; 2
    sta    ram_D2,X              ; 4
LFB01:
    ldx    ram_D6                ; 3
    dex                          ; 2
    bpl    LFACC                 ; 2³+1
    ldx    #$03                  ; 2
    lda    #$00                  ; 2
LFB0A:
    cmp    ram_D2,X              ; 4
    beq    LFB10                 ; 2³
    bcs    LFB14                 ; 2³
LFB10:
    lda    ram_D2,X              ; 4
    stx    ram_A6                ; 3
LFB14:
    dex                          ; 2
    bpl    LFB0A                 ; 2³
    lda    ram_A6                ; 3
    tay                          ; 2
    lda    LFCED,Y               ; 4
    sta    ram_A6                ; 3
    lda    ram_86                ; 3
    ora    LFEF9,Y               ; 4
    sta    ram_86                ; 3
    rts                          ; 6

LFB27:
    cpx    #$00                  ; 2
    beq    LFB57                 ; 2³
    cpx    #$13                  ; 2
    beq    LFB57                 ; 2³
    cpy    #$0A                  ; 2
    beq    LFB57                 ; 2³
    cpy    #$FE                  ; 2
    beq    LFB57                 ; 2³
    cpy    #$FF                  ; 2
    bne    LFB45                 ; 2³
    cmp    #$4C                  ; 2
    bcc    LFB57                 ; 2³
    cmp    #$54                  ; 2
    bcs    LFB57                 ; 2³
    bcc    LFB55                 ; 2³
LFB45:
    lda    #$D5                  ; 2
    sta    ram_F8                ; 3
    lda    #$AD                  ; 2
    sta    ram_F7                ; 3
    jmp    LFFF2                 ; 3

    and    LFBB3,X               ; 4
    beq    LFB57                 ; 2³
LFB55:
    sec                          ; 2
    rts                          ; 6

LFB57:
    clc                          ; 2
    rts                          ; 6

LFB59:
    sta    ram_D2                ; 3
    ldx    #$00                  ; 2
    lda    ram_C1                ; 3
    cmp    #$05                  ; 2
    bcc    LFB6E                 ; 2³
    inx                          ; 2
    cmp    #$10                  ; 2
    bcc    LFB6E                 ; 2³
    inx                          ; 2
    cmp    #$20                  ; 2
    bcc    LFB6E                 ; 2³
    inx                          ; 2
LFB6E:
    lda    ram_D2                ; 3
    rts                          ; 6

LFB71:
    lda    ram_94                ; 3
    ldx    ram_97                ; 3
    stx    ram_94                ; 3
    sta    ram_97                ; 3
    lda    ram_95                ; 3
    ldx    ram_96                ; 3
    stx    ram_95                ; 3
    sta    ram_96                ; 3
    lda    #$9E                  ; 2
    sec                          ; 2
    sbc    ram_99                ; 3
    sta    ram_99                ; 3
    rts                          ; 6

LFB89:
    cmp    ram_B3                ; 3
    beq    LFB9C                 ; 2³
    bcc    LFB9C                 ; 2³
    sta    ram_B3                ; 3
    tay                          ; 2
    lda    LFC52,Y               ; 4
    sta    ram_B8                ; 3
    lda    LFC20,Y               ; 4
    sta    ram_BB                ; 3
LFB9C:
    rts                          ; 6

LFB9D:
    cmp    ram_B2                ; 3
    beq    LFBB2                 ; 2³
    sty    ram_D2                ; 3
    sta    ram_B2                ; 3
    tay                          ; 2
    lda    LFC4D,Y               ; 4
    sta    ram_B6                ; 3
    lda    LFC27,Y               ; 4
    sta    ram_BA                ; 3
    ldy    ram_D2                ; 3
LFBB2:
    rts                          ; 6

LFBB3:
    .byte $30 ; |  XX    | $FBB3
    .byte $C0 ; |XX      | $FBB4
    .byte $C0 ; |XX      | $FBB5
    .byte $30 ; |  XX    | $FBB6
    .byte $0C ; |    XX  | $FBB7
    .byte $03 ; |      XX| $FBB8
    .byte $03 ; |      XX| $FBB9
    .byte $0C ; |    XX  | $FBBA
    .byte $30 ; |  XX    | $FBBB
    .byte $C0 ; |XX      | $FBBC
    .byte $C0 ; |XX      | $FBBD
    .byte $30 ; |  XX    | $FBBE
    .byte $0C ; |    XX  | $FBBF
    .byte $03 ; |      XX| $FBC0
    .byte $03 ; |      XX| $FBC1
    .byte $0C ; |    XX  | $FBC2
    .byte $30 ; |  XX    | $FBC3
    .byte $C0 ; |XX      | $FBC4
    .byte $C0 ; |XX      | $FBC5
LFBC6:
    .byte $30 ; |  XX    | $FBC6
    .byte $00 ; |        | $FBC7
    .byte $28 ; |  X X   | $FBC8
    .byte $50 ; | X X    | $FBC9
    .byte $00 ; |        | $FBCA
    .byte $00 ; |        | $FBCB
    .byte $28 ; |  X X   | $FBCC
    .byte $28 ; |  X X   | $FBCD
    .byte $50 ; | X X    | $FBCE
    .byte $50 ; | X X    | $FBCF
    .byte $00 ; |        | $FBD0
    .byte $00 ; |        | $FBD1
    .byte $28 ; |  X X   | $FBD2
    .byte $28 ; |  X X   | $FBD3
    .byte $50 ; | X X    | $FBD4
    .byte $50 ; | X X    | $FBD5
    .byte $50 ; | X X    | $FBD6
    .byte $50 ; | X X    | $FBD7
LFBD8:
    .byte $00 ; |        | $FBD8
    .byte $0A ; |    X X | $FBD9
    .byte $14 ; |   X X  | $FBDA
LFBDB:
    .byte $1E ; |   XXXX | $FBDB
    .byte $41 ; | X     X| $FBDC
    .byte $42 ; | X    X | $FBDD
    .byte $43 ; | X    XX| $FBDE
    .byte $44 ; | X   X  | $FBDF
    .byte $84 ; |X    X  | $FBE0
    .byte $45 ; | X   X X| $FBE1
    .byte $85 ; |X    X X| $FBE2
    .byte $46 ; | X   XX | $FBE3
    .byte $86 ; |X    XX | $FBE4
    .byte $67 ; | XX  XXX| $FBE5
    .byte $A7 ; |X X  XXX| $FBE6
    .byte $68 ; | XX X   | $FBE7
    .byte $A8 ; |X X X   | $FBE8
    .byte $69 ; | XX X  X| $FBE9
    .byte $A9 ; |X X X  X| $FBEA
    .byte $70 ; | XXX    | $FBEB
LFBEC:
    .byte $B0 ; |X XX    | $FBEC
    .byte $00 ; |        | $FBED
    .byte $00 ; |        | $FBEE
    .byte $00 ; |        | $FBEF
    .byte $00 ; |        | $FBF0
    .byte $00 ; |        | $FBF1
    .byte $00 ; |        | $FBF2
    .byte $00 ; |        | $FBF3
    .byte $00 ; |        | $FBF4
    .byte $00 ; |        | $FBF5
    .byte $0A ; |    X X | $FBF6
    .byte $0A ; |    X X | $FBF7
    .byte $0A ; |    X X | $FBF8
    .byte $0A ; |    X X | $FBF9
LFBFA:
    .byte $0A ; |    X X | $FBFA
    .byte $0A ; |    X X | $FBFB
    .byte $0A ; |    X X | $FBFC
    .byte $0A ; |    X X | $FBFD
    .byte $0C ; |    XX  | $FBFE
    .byte $0C ; |    XX  | $FBFF
    .byte $0C ; |    XX  | $FC00
    .byte $0C ; |    XX  | $FC01
    .byte $0C ; |    XX  | $FC02
    .byte $0C ; |    XX  | $FC03
    .byte $06 ; |     XX | $FC04
    .byte $06 ; |     XX | $FC05
    .byte $08 ; |    X   | $FC06
    .byte $08 ; |    X   | $FC07
    .byte $0C ; |    XX  | $FC08
    .byte $0C ; |    XX  | $FC09
    .byte $0E ; |    XXX | $FC0A
    .byte $0E ; |    XXX | $FC0B
LFC0C:
    .byte $8D ; |X   XX X| $FC0C
LFC0D:
    .byte $78 ; | XXXX   | $FC0D
LFC0E:
    .byte $00 ; |        | $FC0E
LFC0F:
    .byte $04 ; |     X  | $FC0F
    .byte $00 ; |        | $FC10
    .byte $00 ; |        | $FC11
    .byte $00 ; |        | $FC12
    .byte $64 ; | XX  X  | $FC13
    .byte $64 ; | XX  X  | $FC14
    .byte $50 ; | X X    | $FC15
    .byte $50 ; | X X    | $FC16
    .byte $3C ; |  XXXX  | $FC17
    .byte $3C ; |  XXXX  | $FC18
    .byte $64 ; | XX  X  | $FC19
    .byte $64 ; | XX  X  | $FC1A
    .byte $50 ; | X X    | $FC1B
    .byte $50 ; | X X    | $FC1C
    .byte $3C ; |  XXXX  | $FC1D
    .byte $3C ; |  XXXX  | $FC1E
    .byte $3C ; |  XXXX  | $FC1F
LFC20:
    .byte $3C ; |  XXXX  | $FC20
    .byte $05 ; |     X X| $FC21
    .byte $05 ; |     X X| $FC22
    .byte $00 ; |        | $FC23
    .byte $1F ; |   XXXXX| $FC24
    .byte $0A ; |    X X | $FC25
    .byte $40 ; | X      | $FC26
LFC27:
    .byte $12 ; |   X  X | $FC27
    .byte $59 ; | X XX  X| $FC28
    .byte $30 ; |  XX    | $FC29
    .byte $29 ; |  X X  X| $FC2A
    .byte $0C ; |    XX  | $FC2B
LFC2C:
    .byte $16 ; |   X XX | $FC2C
    .byte $57 ; | X X XXX| $FC2D
    .byte $2E ; |  X XXX | $FC2E
    .byte $27 ; |  X  XXX| $FC2F
    .byte $00 ; |        | $FC30
    .byte $00 ; |        | $FC31
LFC32:
    .byte $03 ; |      XX| $FC32
    .byte $07 ; |     XXX| $FC33
    .byte $0B ; |    X XX| $FC34
    .byte $13 ; |   X  XX| $FC35
    .byte $1B ; |   XX XX| $FC36
    .byte $2B ; |  X X XX| $FC37
    .byte $3B ; |  XXX XX| $FC38
    .byte $5B ; | X XX XX| $FC39
    .byte $7B ; | XXXX XX| $FC3A
    .byte $BB ; |X XXX XX| $FC3B
    .byte $06 ; |     XX | $FC3C
LFC3D:
    .byte $01 ; |       X| $FC3D
    .byte $1F ; |   XXXXX| $FC3E
    .byte $1B ; |   XX XX| $FC3F
    .byte $19 ; |   XX  X| $FC40
    .byte $18 ; |   XX   | $FC41
    .byte $17 ; |   X XXX| $FC42
    .byte $15 ; |   X X X| $FC43
    .byte $14 ; |   X X  | $FC44
    .byte $12 ; |   X  X | $FC45
    .byte $10 ; |   X    | $FC46
    .byte $0F ; |    XXXX| $FC47
    .byte $0D ; |    XX X| $FC48
LFC49:
    .byte $00 ; |        | $FC49
    .byte $01 ; |       X| $FC4A
    .byte $02 ; |      X | $FC4B
    .byte $03 ; |      XX| $FC4C
LFC4D:
    .byte $02 ; |      X | $FC4D
    .byte $00 ; |        | $FC4E
    .byte $59 ; | X XX  X| $FC4F
    .byte $89 ; |X   X  X| $FC50
    .byte $B2 ; |X XX  X | $FC51
LFC52:
    .byte $BE ; |X XXXXX | $FC52
    .byte $00 ; |        | $FC53
    .byte $05 ; |     X X| $FC54
    .byte $0A ; |    X X | $FC55
    .byte $0A ; |    X X | $FC56
    .byte $29 ; |  X X  X| $FC57
    .byte $33 ; |  XX  XX| $FC58
    .byte $61 ; | XX    X| $FC59
LFC5A:
    .byte $F8 ; |XXXXX   | $FC5A
    .byte $08 ; |    X   | $FC5B
LFC5C:
    .byte $00 ; |        | $FC5C
    .byte $00 ; |        | $FC5D
    .byte $F4 ; |XXXX X  | $FC5E
LFC5F:
    .byte $0C ; |    XX  | $FC5F
    .byte $14 ; |   X X  | $FC60
    .byte $1C ; |   XXX  | $FC61
    .byte $24 ; |  X  X  | $FC62
    .byte $2C ; |  X XX  | $FC63
    .byte $34 ; |  XX X  | $FC64
    .byte $3C ; |  XXXX  | $FC65
    .byte $44 ; | X   X  | $FC66
    .byte $4C ; | X  XX  | $FC67
    .byte $54 ; | X X X  | $FC68
    .byte $5C ; | X XXX  | $FC69
    .byte $64 ; | XX  X  | $FC6A
    .byte $6C ; | XX XX  | $FC6B
    .byte $74 ; | XXX X  | $FC6C
    .byte $7C ; | XXXXX  | $FC6D
    .byte $84 ; |X    X  | $FC6E
    .byte $8C ; |X   XX  | $FC6F
    .byte $94 ; |X  X X  | $FC70
    .byte $4D ; | X  XX X| $FC71
    .byte $4E ; | X  XXX | $FC72
    .byte $4F ; | X  XXXX| $FC73
    .byte $51 ; | X X   X| $FC74
    .byte $52 ; | X X  X | $FC75
    .byte $53 ; | X X  XX| $FC76
LFC77:
    .byte $F4 ; |XXXX X  | $FC77
LFC78:
    .byte $00 ; |        | $FC78
    .byte $0C ; |    XX  | $FC79
    .byte $18 ; |   XX   | $FC7A
    .byte $24 ; |  X  X  | $FC7B
    .byte $30 ; |  XX    | $FC7C
    .byte $3C ; |  XXXX  | $FC7D
    .byte $48 ; | X  X   | $FC7E
    .byte $54 ; | X X X  | $FC7F
    .byte $60 ; | XX     | $FC80
    .byte $6C ; | XX XX  | $FC81
    .byte $78 ; | XXXX   | $FC82
    .byte $84 ; |X    X  | $FC83
LFC84:
    .byte $0A ; |    X X | $FC84
    .byte $09 ; |    X  X| $FC85
    .byte $08 ; |    X   | $FC86
    .byte $07 ; |     XXX| $FC87
    .byte $06 ; |     XX | $FC88
    .byte $05 ; |     X X| $FC89
    .byte $04 ; |     X  | $FC8A
    .byte $03 ; |      XX| $FC8B
    .byte $02 ; |      X | $FC8C
    .byte $01 ; |       X| $FC8D
    .byte $00 ; |        | $FC8E
    .byte $FF ; |XXXXXXXX| $FC8F
    .byte $FE ; |XXXXXXX | $FC90
LFC91:
    .byte $10 ; |   X    | $FC91
    .byte $20 ; |  X     | $FC92
    .byte $30 ; |  XX    | $FC93
    .byte $40 ; | X      | $FC94
    .byte $10 ; |   X    | $FC95
    .byte $20 ; |  X     | $FC96
    .byte $30 ; |  XX    | $FC97
    .byte $40 ; | X      | $FC98
    .byte $90 ; |X  X    | $FC99
    .byte $A0 ; |X X     | $FC9A
    .byte $B0 ; |X XX    | $FC9B
    .byte $C0 ; |XX      | $FC9C
    .byte $90 ; |X  X    | $FC9D
    .byte $A0 ; |X X     | $FC9E
    .byte $B0 ; |X XX    | $FC9F
    .byte $C0 ; |XX      | $FCA0
LFCA1:
    .byte $50 ; | X X    | $FCA1
    .byte $60 ; | XX     | $FCA2
    .byte $70 ; | XXX    | $FCA3
    .byte $60 ; | XX     | $FCA4
    .byte $50 ; | X X    | $FCA5
    .byte $60 ; | XX     | $FCA6
    .byte $70 ; | XXX    | $FCA7
    .byte $60 ; | XX     | $FCA8
    .byte $50 ; | X X    | $FCA9
    .byte $60 ; | XX     | $FCAA
    .byte $70 ; | XXX    | $FCAB
    .byte $60 ; | XX     | $FCAC
    .byte $D0 ; |XX X    | $FCAD
    .byte $E0 ; |XXX     | $FCAE
    .byte $F0 ; |XXXX    | $FCAF
    .byte $E0 ; |XXX     | $FCB0
    .byte $D0 ; |XX X    | $FCB1
    .byte $E0 ; |XXX     | $FCB2
    .byte $F0 ; |XXXX    | $FCB3
    .byte $E0 ; |XXX     | $FCB4
    .byte $D0 ; |XX X    | $FCB5
    .byte $E0 ; |XXX     | $FCB6
    .byte $F0 ; |XXXX    | $FCB7
    .byte $E0 ; |XXX     | $FCB8
LFCB9:
    .byte $3C ; |  XXXX  | $FCB9
    .byte $52 ; | X X  X | $FCBA
    .byte $68 ; | XX X   | $FCBB
    .byte $3C ; |  XXXX  | $FCBC
    .byte $52 ; | X X  X | $FCBD
    .byte $68 ; | XX X   | $FCBE
    .byte $F4 ; |XXXX X  | $FCBF
LFCC0:
    .byte $DD ; |XX XXX X| $FCC0
    .byte $DD ; |XX XXX X| $FCC1
    .byte $DD ; |XX XXX X| $FCC2
    .byte $DE ; |XX XXXX | $FCC3
    .byte $DE ; |XX XXXX | $FCC4
    .byte $DE ; |XX XXXX | $FCC5
    .byte $D6 ; |XX X XX | $FCC6
LFCC7:
    .byte $4F ; | X  XXXX| $FCC7
    .byte $65 ; | XX  X X| $FCC8
    .byte $7B ; | XXXX XX| $FCC9
    .byte $91 ; |X  X   X| $FCCA
    .byte $0A ; |    X X | $FCCB
    .byte $20 ; |  X     | $FCCC
    .byte $36 ; |  XX XX | $FCCD
    .byte $4C ; | X  XX  | $FCCE
    .byte $62 ; | XX   X | $FCCF
    .byte $78 ; | XXXX   | $FCD0
    .byte $8E ; |X   XXX | $FCD1
    .byte $A4 ; |X X  X  | $FCD2
    .byte $BA ; |X XXX X | $FCD3
    .byte $D0 ; |XX X    | $FCD4
    .byte $E6 ; |XXX  XX | $FCD5
    .byte $FC ; |XXXXXX  | $FCD6
LFCD7:
    .byte $D5 ; |XX X X X| $FCD7
    .byte $D5 ; |XX X X X| $FCD8
    .byte $D5 ; |XX X X X| $FCD9
    .byte $D5 ; |XX X X X| $FCDA
    .byte $D7 ; |XX X XXX| $FCDB
    .byte $D7 ; |XX X XXX| $FCDC
    .byte $D7 ; |XX X XXX| $FCDD
    .byte $D7 ; |XX X XXX| $FCDE
    .byte $D7 ; |XX X XXX| $FCDF
    .byte $D7 ; |XX X XXX| $FCE0
    .byte $D7 ; |XX X XXX| $FCE1
    .byte $D7 ; |XX X XXX| $FCE2
    .byte $D7 ; |XX X XXX| $FCE3
    .byte $D7 ; |XX X XXX| $FCE4
    .byte $D7 ; |XX X XXX| $FCE5
    .byte $D7 ; |XX X XXX| $FCE6
LFCE7:
    .byte $C8 ; |XX  X   | $FCE7
    .byte $D3 ; |XX X  XX| $FCE8
    .byte $DE ; |XX XXXX | $FCE9
    .byte $D3 ; |XX X  XX| $FCEA
    .byte $E9 ; |XXX X  X| $FCEB
    .byte $F4 ; |XXXX X  | $FCEC
LFCED:
    .byte $01 ; |       X| $FCED
    .byte $00 ; |        | $FCEE
    .byte $03 ; |      XX| $FCEF
    .byte $02 ; |      X | $FCF0
LFCF1:
    .byte $78 ; | XXXX   | $FCF1
    .byte $7E ; | XXXXXX | $FCF2
    .byte $84 ; |X    X  | $FCF3
    .byte $8A ; |X   X X | $FCF4
    .byte $90 ; |X  X    | $FCF5
    .byte $96 ; |X  X XX | $FCF6
    .byte $9C ; |X  XXX  | $FCF7
    .byte $A2 ; |X X   X | $FCF8
    .byte $A8 ; |X X X   | $FCF9
    .byte $AE ; |X X XXX | $FCFA
    .byte $B4 ; |X XX X  | $FCFB
    .byte $00 ; |        | $FCFC
    .byte $00 ; |        | $FCFD
    .byte $00 ; |        | $FCFE
    .byte $00 ; |        | $FCFF
    .byte $74 ; | XXX X  | $FD00
    .byte $61 ; | XX    X| $FD01
    .byte $41 ; | X     X| $FD02
    .byte $21 ; |  X    X| $FD03
    .byte $21 ; |  X    X| $FD04
    .byte $01 ; |       X| $FD05
    .byte $21 ; |  X    X| $FD06
    .byte $91 ; |X  X   X| $FD07
    .byte $01 ; |       X| $FD08
    .byte $21 ; |  X    X| $FD09
    .byte $91 ; |X  X   X| $FD0A
    .byte $01 ; |       X| $FD0B
    .byte $71 ; | XXX   X| $FD0C
    .byte $A1 ; |X X    X| $FD0D
    .byte $01 ; |       X| $FD0E
    .byte $21 ; |  X    X| $FD0F
    .byte $A1 ; |X X    X| $FD10
    .byte $01 ; |       X| $FD11
    .byte $81 ; |X      X| $FD12
    .byte $71 ; | XXX   X| $FD13
    .byte $61 ; | XX    X| $FD14
    .byte $21 ; |  X    X| $FD15
    .byte $24 ; |  X  X  | $FD16
    .byte $41 ; | X     X| $FD17
    .byte $01 ; |       X| $FD18
    .byte $61 ; | XX    X| $FD19
    .byte $71 ; | XXX   X| $FD1A
    .byte $01 ; |       X| $FD1B
    .byte $71 ; | XXX   X| $FD1C
    .byte $61 ; | XX    X| $FD1D
    .byte $41 ; | X     X| $FD1E
    .byte $21 ; |  X    X| $FD1F
    .byte $91 ; |X  X   X| $FD20
    .byte $01 ; |       X| $FD21
    .byte $71 ; | XXX   X| $FD22
    .byte $61 ; | XX    X| $FD23
    .byte $41 ; | X     X| $FD24
    .byte $21 ; |  X    X| $FD25
    .byte $91 ; |X  X   X| $FD26
    .byte $01 ; |       X| $FD27
    .byte $71 ; | XXX   X| $FD28
    .byte $61 ; | XX    X| $FD29
    .byte $41 ; | X     X| $FD2A
    .byte $21 ; |  X    X| $FD2B
    .byte $84 ; |X    X  | $FD2C
    .byte $81 ; |X      X| $FD2D
    .byte $71 ; | XXX   X| $FD2E
    .byte $61 ; | XX    X| $FD2F
    .byte $61 ; | XX    X| $FD30
    .byte $71 ; | XXX   X| $FD31
    .byte $81 ; |X      X| $FD32
    .byte $91 ; |X  X   X| $FD33
    .byte $01 ; |       X| $FD34
    .byte $21 ; |  X    X| $FD35
    .byte $91 ; |X  X   X| $FD36
    .byte $01 ; |       X| $FD37
    .byte $71 ; | XXX   X| $FD38
    .byte $A1 ; |X X    X| $FD39
    .byte $01 ; |       X| $FD3A
    .byte $21 ; |  X    X| $FD3B
    .byte $A1 ; |X X    X| $FD3C
    .byte $01 ; |       X| $FD3D
    .byte $81 ; |X      X| $FD3E
    .byte $71 ; | XXX   X| $FD3F
    .byte $61 ; | XX    X| $FD40
    .byte $21 ; |  X    X| $FD41
    .byte $24 ; |  X  X  | $FD42
    .byte $41 ; | X     X| $FD43
    .byte $01 ; |       X| $FD44
    .byte $61 ; | XX    X| $FD45
    .byte $71 ; | XXX   X| $FD46
    .byte $01 ; |       X| $FD47
    .byte $71 ; | XXX   X| $FD48
    .byte $61 ; | XX    X| $FD49
    .byte $41 ; | X     X| $FD4A
    .byte $21 ; |  X    X| $FD4B
    .byte $91 ; |X  X   X| $FD4C
    .byte $01 ; |       X| $FD4D
    .byte $71 ; | XXX   X| $FD4E
    .byte $61 ; | XX    X| $FD4F
    .byte $41 ; | X     X| $FD50
    .byte $21 ; |  X    X| $FD51
    .byte $91 ; |X  X   X| $FD52
    .byte $01 ; |       X| $FD53
    .byte $71 ; | XXX   X| $FD54
    .byte $61 ; | XX    X| $FD55
    .byte $41 ; | X     X| $FD56
    .byte $21 ; |  X    X| $FD57
    .byte $04 ; |     X  | $FD58
    .byte $01 ; |       X| $FD59
    .byte $82 ; |X     X | $FD5A
    .byte $0B ; |    X XX| $FD5B
    .byte $84 ; |X    X  | $FD5C
    .byte $91 ; |X  X   X| $FD5D
    .byte $81 ; |X      X| $FD5E
    .byte $71 ; | XXX   X| $FD5F
    .byte $91 ; |X  X   X| $FD60
    .byte $01 ; |       X| $FD61
    .byte $B1 ; |X XX   X| $FD62
    .byte $91 ; |X  X   X| $FD63
    .byte $01 ; |       X| $FD64
    .byte $B1 ; |X XX   X| $FD65
    .byte $A1 ; |X X    X| $FD66
    .byte $01 ; |       X| $FD67
    .byte $91 ; |X  X   X| $FD68
    .byte $81 ; |X      X| $FD69
    .byte $01 ; |       X| $FD6A
    .byte $91 ; |X  X   X| $FD6B
    .byte $81 ; |X      X| $FD6C
    .byte $01 ; |       X| $FD6D
    .byte $71 ; | XXX   X| $FD6E
    .byte $21 ; |  X    X| $FD6F
    .byte $01 ; |       X| $FD70
    .byte $21 ; |  X    X| $FD71
    .byte $61 ; | XX    X| $FD72
    .byte $01 ; |       X| $FD73
    .byte $81 ; |X      X| $FD74
    .byte $71 ; | XXX   X| $FD75
    .byte $01 ; |       X| $FD76
    .byte $81 ; |X      X| $FD77
    .byte $91 ; |X  X   X| $FD78
    .byte $01 ; |       X| $FD79
    .byte $81 ; |X      X| $FD7A
    .byte $91 ; |X  X   X| $FD7B
    .byte $01 ; |       X| $FD7C
    .byte $B1 ; |X XX   X| $FD7D
    .byte $A1 ; |X X    X| $FD7E
    .byte $01 ; |       X| $FD7F
    .byte $91 ; |X  X   X| $FD80
    .byte $81 ; |X      X| $FD81
    .byte $01 ; |       X| $FD82
    .byte $91 ; |X  X   X| $FD83
    .byte $81 ; |X      X| $FD84
    .byte $01 ; |       X| $FD85
    .byte $71 ; | XXX   X| $FD86
    .byte $21 ; |  X    X| $FD87
    .byte $04 ; |     X  | $FD88
    .byte $70 ; | XXX    | $FD89
    .byte $90 ; |X  X    | $FD8A
    .byte $80 ; |X       | $FD8B
    .byte $90 ; |X  X    | $FD8C
    .byte $80 ; |X       | $FD8D
    .byte $70 ; | XXX    | $FD8E
    .byte $60 ; | XX     | $FD8F
    .byte $70 ; | XXX    | $FD90
    .byte $50 ; | X X    | $FD91
    .byte $80 ; |X       | $FD92
    .byte $70 ; | XXX    | $FD93
    .byte $80 ; |X       | $FD94
    .byte $70 ; | XXX    | $FD95
    .byte $50 ; | X X    | $FD96
    .byte $40 ; | X      | $FD97
    .byte $50 ; | X X    | $FD98
    .byte $40 ; | X      | $FD99
    .byte $50 ; | X X    | $FD9A
    .byte $70 ; | XXX    | $FD9B
    .byte $80 ; |X       | $FD9C
    .byte $40 ; | X      | $FD9D
    .byte $50 ; | X X    | $FD9E
    .byte $70 ; | XXX    | $FD9F
    .byte $80 ; |X       | $FDA0
    .byte $82 ; |X     X | $FDA1
    .byte $82 ; |X     X | $FDA2
    .byte $82 ; |X     X | $FDA3
    .byte $82 ; |X     X | $FDA4
    .byte $70 ; | XXX    | $FDA5
    .byte $80 ; |X       | $FDA6
    .byte $90 ; |X  X    | $FDA7
    .byte $A0 ; |X X     | $FDA8
    .byte $70 ; | XXX    | $FDA9
    .byte $80 ; |X       | $FDAA
    .byte $90 ; |X  X    | $FDAB
    .byte $A0 ; |X X     | $FDAC
    .byte $A2 ; |X X   X | $FDAD
    .byte $A2 ; |X X   X | $FDAE
    .byte $A2 ; |X X   X | $FDAF
    .byte $A2 ; |X X   X | $FDB0
    .byte $04 ; |     X  | $FDB1
    .byte $00 ; |        | $FDB2
    .byte $B3 ; |X XX  XX| $FDB3
    .byte $83 ; |X     XX| $FDB4
    .byte $25 ; |  X  X X| $FDB5
    .byte $43 ; | X    XX| $FDB6
    .byte $61 ; | XX    X| $FDB7
    .byte $73 ; | XXX  XX| $FDB8
    .byte $81 ; |X      X| $FDB9
    .byte $91 ; |X  X   X| $FDBA
    .byte $81 ; |X      X| $FDBB
    .byte $85 ; |X    X X| $FDBC
    .byte $03 ; |      XX| $FDBD
    .byte $01 ; |       X| $FDBE
    .byte $A2 ; |X X   X | $FDBF
    .byte $11 ; |   X   X| $FDC0
    .byte $11 ; |   X   X| $FDC1
    .byte $A1 ; |X X    X| $FDC2
    .byte $A0 ; |X X     | $FDC3
    .byte $A0 ; |X X     | $FDC4
    .byte $03 ; |      XX| $FDC5
    .byte $96 ; |X  X XX | $FDC6
    .byte $71 ; | XXX   X| $FDC7
    .byte $71 ; | XXX   X| $FDC8
    .byte $91 ; |X  X   X| $FDC9
    .byte $90 ; |X  X    | $FDCA
    .byte $90 ; |X  X    | $FDCB
    .byte $03 ; |      XX| $FDCC
    .byte $86 ; |X    XX | $FDCD
    .byte $51 ; | X X   X| $FDCE
    .byte $51 ; | X X   X| $FDCF
    .byte $81 ; |X      X| $FDD0
    .byte $80 ; |X       | $FDD1
    .byte $80 ; |X       | $FDD2
    .byte $06 ; |     XX | $FDD3
LFDD4:
    .byte $90 ; |X  X    | $FDD4
    .byte $C0 ; |XX      | $FDD5
    .byte $F8 ; |XXXXX   | $FDD6
LFDD7:
    .byte $D8 ; |XX XX   | $FDD7
    .byte $D8 ; |XX XX   | $FDD8
    .byte $D8 ; |XX XX   | $FDD9
LFDDA:
    .byte $30 ; |  XX    | $FDDA
    .byte $68 ; | XX X   | $FDDB
    .byte $A0 ; |X X     | $FDDC
LFDDD:
    .byte $D9 ; |XX XX  X| $FDDD
    .byte $D9 ; |XX XX  X| $FDDE
    .byte $D9 ; |XX XX  X| $FDDF
LFDE0:
    .byte $00 ; |        | $FDE0
    .byte $11 ; |   X   X| $FDE1
    .byte $2C ; |  X XX  | $FDE2
    .byte $47 ; | X   XXX| $FDE3
    .byte $5F ; | X XXXXX| $FDE4
LFDE5:
    .byte $04 ; |     X  | $FDE5
    .byte $06 ; |     XX | $FDE6
    .byte $01 ; |       X| $FDE7
    .byte $03 ; |      XX| $FDE8
    .byte $08 ; |    X   | $FDE9
    .byte $05 ; |     X X| $FDEA
    .byte $00 ; |        | $FDEB
    .byte $07 ; |     XXX| $FDEC
LFDED:
    .byte $02 ; |      X | $FDED
    .byte $00 ; |        | $FDEE
    .byte $F4 ; |XXXX X  | $FDEF
    .byte $04 ; |     X  | $FDF0
    .byte $00 ; |        | $FDF1
LFDF2:
    .byte $AD ; |X X XX X| $FDF2
    .byte $C4 ; |XX   X  | $FDF3
    .byte $DB ; |XX XX XX| $FDF4
    .byte $F2 ; |XXXX  X | $FDF5
LFDF6:
    .byte $F2 ; |XXXX  X | $FDF6
    .byte $AD ; |X X XX X| $FDF7
    .byte $C4 ; |XX   X  | $FDF8
    .byte $DB ; |XX XX XX| $FDF9
LFDFA:
    .byte $DE ; |XX XXXX | $FDFA
    .byte $D3 ; |XX X  XX| $FDFB
    .byte $C8 ; |XX  X   | $FDFC
    .byte $D3 ; |XX X  XX| $FDFD
    .byte $E9 ; |XXX X  X| $FDFE
    .byte $F4 ; |XXXX X  | $FDFF
    .byte $80 ; |X       | $FE00
    .byte $E4 ; |XXX  X  | $FE01
    .byte $09 ; |    X  X| $FE02
    .byte $28 ; |  X X   | $FE03
    .byte $49 ; | X  X  X| $FE04
    .byte $80 ; |X       | $FE05
    .byte $E0 ; |XXX     | $FE06
    .byte $2A ; |  X X X | $FE07
    .byte $0A ; |    X X | $FE08
    .byte $44 ; | X   X  | $FE09
    .byte $80 ; |X       | $FE0A
    .byte $84 ; |X    X  | $FE0B
    .byte $E3 ; |XXX   XX| $FE0C
    .byte $3E ; |  XXXXX | $FE0D
    .byte $BD ; |X XXXX X| $FE0E
    .byte $BC ; |X XXXX  | $FE0F
    .byte $BA ; |X XXX X | $FE10
    .byte $B7 ; |X XX XXX| $FE11
    .byte $B4 ; |X XX X  | $FE12
    .byte $B2 ; |X XX  X | $FE13
    .byte $B0 ; |X XX    | $FE14
    .byte $AE ; |X X XXX | $FE15
    .byte $AD ; |X X XX X| $FE16
    .byte $AC ; |X X XX  | $FE17
    .byte $AC ; |X X XX  | $FE18
    .byte $AD ; |X X XX X| $FE19
    .byte $AE ; |X X XXX | $FE1A
    .byte $B0 ; |X XX    | $FE1B
    .byte $B2 ; |X XX  X | $FE1C
    .byte $B4 ; |X XX X  | $FE1D
    .byte $B7 ; |X XX XXX| $FE1E
    .byte $BA ; |X XXX X | $FE1F
    .byte $BC ; |X XXXX  | $FE20
    .byte $BD ; |X XXXX X| $FE21
    .byte $09 ; |    X  X| $FE22
    .byte $87 ; |X    XXX| $FE23
    .byte $BE ; |X XXXXX | $FE24
    .byte $05 ; |     X X| $FE25
    .byte $82 ; |X     X | $FE26
    .byte $3F ; |  XXXXXX| $FE27
    .byte $4C ; | X  XX  | $FE28
    .byte $80 ; |X       | $FE29
    .byte $8F ; |X   XXXX| $FE2A
    .byte $8D ; |X   XX X| $FE2B
    .byte $8B ; |X   X XX| $FE2C
    .byte $89 ; |X   X  X| $FE2D
    .byte $87 ; |X    XXX| $FE2E
    .byte $63 ; | XX   XX| $FE2F
    .byte $05 ; |     X X| $FE30
    .byte $3F ; |  XXXXXX| $FE31
    .byte $48 ; | X  X   | $FE32
    .byte $80 ; |X       | $FE33
    .byte $8E ; |X   XXX | $FE34
    .byte $88 ; |X   X   | $FE35
    .byte $8D ; |X   XX X| $FE36
    .byte $88 ; |X   X   | $FE37
    .byte $8D ; |X   XX X| $FE38
    .byte $88 ; |X   X   | $FE39
    .byte $8C ; |X   XX  | $FE3A
    .byte $88 ; |X   X   | $FE3B
    .byte $8C ; |X   XX  | $FE3C
    .byte $88 ; |X   X   | $FE3D
    .byte $8B ; |X   X XX| $FE3E
    .byte $E1 ; |XXX    X| $FE3F
    .byte $08 ; |    X   | $FE40
    .byte $E1 ; |XXX    X| $FE41
    .byte $0B ; |    X XX| $FE42
    .byte $E1 ; |XXX    X| $FE43
    .byte $08 ; |    X   | $FE44
    .byte $E1 ; |XXX    X| $FE45
    .byte $0A ; |    X X | $FE46
    .byte $E3 ; |XXX   XX| $FE47
    .byte $07 ; |     XXX| $FE48
    .byte $E2 ; |XXX   X | $FE49
    .byte $0A ; |    X X | $FE4A
    .byte $E3 ; |XXX   XX| $FE4B
    .byte $06 ; |     XX | $FE4C
    .byte $E3 ; |XXX   XX| $FE4D
    .byte $08 ; |    X   | $FE4E
    .byte $E5 ; |XXX  X X| $FE4F
    .byte $05 ; |     X X| $FE50
    .byte $E3 ; |XXX   XX| $FE51
    .byte $07 ; |     XXX| $FE52
    .byte $E4 ; |XXX  X  | $FE53
    .byte $03 ; |      XX| $FE54
    .byte $E6 ; |XXX  XX | $FE55
    .byte $05 ; |     X X| $FE56
    .byte $EC ; |XXX XX  | $FE57
    .byte $01 ; |       X| $FE58
    .byte $EC ; |XXX XX  | $FE59
    .byte $04 ; |     X  | $FE5A
    .byte $E4 ; |XXX  X  | $FE5B
    .byte $01 ; |       X| $FE5C
    .byte $E4 ; |XXX  X  | $FE5D
    .byte $45 ; | X   X X| $FE5E
    .byte $3D ; |  XXXX X| $FE5F
    .byte $05 ; |     X X| $FE60
    .byte $80 ; |X       | $FE61
    .byte $B3 ; |X XX  XX| $FE62
    .byte $01 ; |       X| $FE63
    .byte $B7 ; |X XX XXX| $FE64
    .byte $03 ; |      XX| $FE65
    .byte $B9 ; |X XXX  X| $FE66
    .byte $05 ; |     X X| $FE67
    .byte $BB ; |X XXX XX| $FE68
    .byte $07 ; |     XXX| $FE69
    .byte $BD ; |X XXXX X| $FE6A
    .byte $09 ; |    X  X| $FE6B
    .byte $BF ; |X XXXXXX| $FE6C
    .byte $0B ; |    X XX| $FE6D
    .byte $BE ; |X XXXXX | $FE6E
    .byte $BE ; |X XXXXX | $FE6F
    .byte $8F ; |X   XXXX| $FE70
LFE71:
    .byte $3F ; |  XXXXXX| $FE71
LFE72:
    .byte $45 ; | X   X X| $FE72
LFE73:
    .byte $81 ; |X      X| $FE73
    .byte $B8 ; |X XXX   | $FE74
    .byte $00 ; |        | $FE75
    .byte $00 ; |        | $FE76
    .byte $40 ; | X      | $FE77
    .byte $56 ; | X X XX | $FE78
    .byte $30 ; |  XX    | $FE79
    .byte $38 ; |  XXX   | $FE7A
    .byte $20 ; |  X     | $FE7B
    .byte $10 ; |   X    | $FE7C
    .byte $02 ; |      X | $FE7D
    .byte $88 ; |X   X   | $FE7E
    .byte $13 ; |   X  XX| $FE7F
    .byte $02 ; |      X | $FE80
    .byte $88 ; |X   X   | $FE81
    .byte $01 ; |       X| $FE82
    .byte $55 ; | X X X X| $FE83
    .byte $88 ; |X   X   | $FE84
    .byte $00 ; |        | $FE85
    .byte $88 ; |X   X   | $FE86
    .byte $12 ; |   X  X | $FE87
    .byte $01 ; |       X| $FE88
    .byte $88 ; |X   X   | $FE89
    .byte $13 ; |   X  XX| $FE8A
    .byte $02 ; |      X | $FE8B
    .byte $88 ; |X   X   | $FE8C
    .byte $01 ; |       X| $FE8D
    .byte $55 ; | X X X X| $FE8E
    .byte $88 ; |X   X   | $FE8F
    .byte $00 ; |        | $FE90
    .byte $88 ; |X   X   | $FE91
    .byte $14 ; |   X X  | $FE92
    .byte $01 ; |       X| $FE93
    .byte $88 ; |X   X   | $FE94
    .byte $13 ; |   X  XX| $FE95
    .byte $02 ; |      X | $FE96
    .byte $88 ; |X   X   | $FE97
    .byte $01 ; |       X| $FE98
    .byte $00 ; |        | $FE99
    .byte $00 ; |        | $FE9A
    .byte $40 ; | X      | $FE9B
    .byte $55 ; | X X X X| $FE9C
    .byte $88 ; |X   X   | $FE9D
    .byte $00 ; |        | $FE9E
    .byte $88 ; |X   X   | $FE9F
    .byte $12 ; |   X  X | $FEA0
    .byte $01 ; |       X| $FEA1
    .byte $88 ; |X   X   | $FEA2
    .byte $10 ; |   X    | $FEA3
    .byte $02 ; |      X | $FEA4
    .byte $88 ; |X   X   | $FEA5
    .byte $01 ; |       X| $FEA6
    .byte $55 ; | X X X X| $FEA7
    .byte $90 ; |X  X    | $FEA8
    .byte $00 ; |        | $FEA9
    .byte $01 ; |       X| $FEAA
    .byte $40 ; | X      | $FEAB
    .byte $56 ; | X X XX | $FEAC
    .byte $30 ; |  XX    | $FEAD
    .byte $11 ; |   X   X| $FEAE
    .byte $57 ; | X X XXX| $FEAF
    .byte $90 ; |X  X    | $FEB0
    .byte $00 ; |        | $FEB1
    .byte $90 ; |X  X    | $FEB2
    .byte $01 ; |       X| $FEB3
    .byte $98 ; |X  XX   | $FEB4
    .byte $FF ; |XXXXXXXX| $FEB5
    .byte $FF ; |XXXXXXXX| $FEB6
    .byte $40 ; | X      | $FEB7
LFEB8:
    .byte $00 ; |        | $FEB8
    .byte $00 ; |        | $FEB9
    .byte $10 ; |   X    | $FEBA
    .byte $10 ; |   X    | $FEBB
    .byte $00 ; |        | $FEBC
    .byte $00 ; |        | $FEBD
    .byte $18 ; |   XX   | $FEBE
    .byte $18 ; |   XX   | $FEBF
    .byte $20 ; |  X     | $FEC0
    .byte $20 ; |  X     | $FEC1
    .byte $40 ; | X      | $FEC2
    .byte $40 ; | X      | $FEC3
    .byte $20 ; |  X     | $FEC4
    .byte $20 ; |  X     | $FEC5
    .byte $38 ; |  XXX   | $FEC6
    .byte $38 ; |  XXX   | $FEC7
LFEC8:
    .byte $00 ; |        | $FEC8
    .byte $00 ; |        | $FEC9
    .byte $18 ; |   XX   | $FECA
    .byte $18 ; |   XX   | $FECB
    .byte $18 ; |   XX   | $FECC
    .byte $00 ; |        | $FECD
    .byte $00 ; |        | $FECE
    .byte $00 ; |        | $FECF
    .byte $10 ; |   X    | $FED0
    .byte $10 ; |   X    | $FED1
    .byte $10 ; |   X    | $FED2
    .byte $00 ; |        | $FED3
    .byte $20 ; |  X     | $FED4
    .byte $20 ; |  X     | $FED5
    .byte $38 ; |  XXX   | $FED6
    .byte $38 ; |  XXX   | $FED7
    .byte $38 ; |  XXX   | $FED8
    .byte $20 ; |  X     | $FED9
    .byte $20 ; |  X     | $FEDA
    .byte $20 ; |  X     | $FEDB
    .byte $40 ; | X      | $FEDC
    .byte $40 ; | X      | $FEDD
    .byte $40 ; | X      | $FEDE
    .byte $20 ; |  X     | $FEDF
LFEE0:
    .byte $07 ; |     XXX| $FEE0
    .byte $06 ; |     XX | $FEE1
    .byte $05 ; |     X X| $FEE2
    .byte $04 ; |     X  | $FEE3
    .byte $03 ; |      XX| $FEE4
    .byte $02 ; |      X | $FEE5
    .byte $01 ; |       X| $FEE6
    .byte $00 ; |        | $FEE7
    .byte $0F ; |    XXXX| $FEE8
    .byte $0E ; |    XXX | $FEE9
    .byte $0D ; |    XX X| $FEEA
    .byte $0C ; |    XX  | $FEEB
    .byte $0B ; |    X XX| $FEEC
    .byte $0A ; |    X X | $FEED
    .byte $09 ; |    X  X| $FEEE
LFEEF:
    .byte $08 ; |    X   | $FEEF
    .byte $03 ; |      XX| $FEF0
    .byte $06 ; |     XX | $FEF1
    .byte $09 ; |    X  X| $FEF2
    .byte $03 ; |      XX| $FEF3
    .byte $03 ; |      XX| $FEF4
    .byte $06 ; |     XX | $FEF5
    .byte $06 ; |     XX | $FEF6
    .byte $09 ; |    X  X| $FEF7
    .byte $09 ; |    X  X| $FEF8
LFEF9:
    .byte $08 ; |    X   | $FEF9
    .byte $04 ; |     X  | $FEFA
    .byte $01 ; |       X| $FEFB
    .byte $02 ; |      X | $FEFC
    .byte $00 ; |        | $FEFD
    .byte $00 ; |        | $FEFE
    .byte $00 ; |        | $FEFF
LFF00:
    .byte $01 ; |       X| $FF00
    .byte $08 ; |    X   | $FF01
    .byte $04 ; |     X  | $FF02
    .byte $08 ; |    X   | $FF03
    .byte $02 ; |      X | $FF04
    .byte $08 ; |    X   | $FF05
    .byte $04 ; |     X  | $FF06
    .byte $08 ; |    X   | $FF07
    .byte $00 ; |        | $FF08
    .byte $08 ; |    X   | $FF09
    .byte $04 ; |     X  | $FF0A
    .byte $08 ; |    X   | $FF0B
    .byte $02 ; |      X | $FF0C
    .byte $08 ; |    X   | $FF0D
    .byte $04 ; |     X  | $FF0E
LFF0F:
    .byte $08 ; |    X   | $FF0F
LFF10:
    .byte $60 ; | XX     | $FF10
    .byte $50 ; | X X    | $FF11
    .byte $40 ; | X      | $FF12
    .byte $30 ; |  XX    | $FF13
    .byte $20 ; |  X     | $FF14
    .byte $10 ; |   X    | $FF15
    .byte $00 ; |        | $FF16
    .byte $F0 ; |XXXX    | $FF17
    .byte $E0 ; |XXX     | $FF18
    .byte $D0 ; |XX X    | $FF19
    .byte $C0 ; |XX      | $FF1A
    .byte $B0 ; |X XX    | $FF1B
    .byte $A0 ; |X X     | $FF1C
    .byte $90 ; |X  X    | $FF1D
    .byte $71 ; | XXX   X| $FF1E
    .byte $61 ; | XX    X| $FF1F
    .byte $51 ; | X X   X| $FF20
    .byte $41 ; | X     X| $FF21
    .byte $31 ; |  XX   X| $FF22
    .byte $21 ; |  X    X| $FF23
    .byte $11 ; |   X   X| $FF24
    .byte $01 ; |       X| $FF25
    .byte $F1 ; |XXXX   X| $FF26
    .byte $E1 ; |XXX    X| $FF27
    .byte $D1 ; |XX X   X| $FF28
    .byte $C1 ; |XX     X| $FF29
    .byte $B1 ; |X XX   X| $FF2A
    .byte $A1 ; |X X    X| $FF2B
    .byte $91 ; |X  X   X| $FF2C
    .byte $72 ; | XXX  X | $FF2D
    .byte $62 ; | XX   X | $FF2E
    .byte $52 ; | X X  X | $FF2F
    .byte $42 ; | X    X | $FF30
    .byte $32 ; |  XX  X | $FF31
    .byte $22 ; |  X   X | $FF32
    .byte $12 ; |   X  X | $FF33
    .byte $02 ; |      X | $FF34
    .byte $F2 ; |XXXX  X | $FF35
    .byte $E2 ; |XXX   X | $FF36
    .byte $D2 ; |XX X  X | $FF37
    .byte $C2 ; |XX    X | $FF38
    .byte $B2 ; |X XX  X | $FF39
    .byte $A2 ; |X X   X | $FF3A
    .byte $92 ; |X  X  X | $FF3B
    .byte $73 ; | XXX  XX| $FF3C
    .byte $63 ; | XX   XX| $FF3D
    .byte $53 ; | X X  XX| $FF3E
    .byte $43 ; | X    XX| $FF3F
    .byte $33 ; |  XX  XX| $FF40
    .byte $23 ; |  X   XX| $FF41
    .byte $13 ; |   X  XX| $FF42
    .byte $03 ; |      XX| $FF43
    .byte $F3 ; |XXXX  XX| $FF44
    .byte $E3 ; |XXX   XX| $FF45
    .byte $D3 ; |XX X  XX| $FF46
    .byte $C3 ; |XX    XX| $FF47
    .byte $B3 ; |X XX  XX| $FF48
    .byte $A3 ; |X X   XX| $FF49
    .byte $93 ; |X  X  XX| $FF4A
    .byte $74 ; | XXX X  | $FF4B
    .byte $64 ; | XX  X  | $FF4C
    .byte $54 ; | X X X  | $FF4D
    .byte $44 ; | X   X  | $FF4E
    .byte $34 ; |  XX X  | $FF4F
    .byte $24 ; |  X  X  | $FF50
    .byte $14 ; |   X X  | $FF51
    .byte $04 ; |     X  | $FF52
    .byte $F4 ; |XXXX X  | $FF53
    .byte $E4 ; |XXX  X  | $FF54
    .byte $D4 ; |XX X X  | $FF55
    .byte $C4 ; |XX   X  | $FF56
    .byte $B4 ; |X XX X  | $FF57
    .byte $A4 ; |X X  X  | $FF58
    .byte $94 ; |X  X X  | $FF59
    .byte $75 ; | XXX X X| $FF5A
    .byte $65 ; | XX  X X| $FF5B
    .byte $55 ; | X X X X| $FF5C
    .byte $45 ; | X   X X| $FF5D
    .byte $35 ; |  XX X X| $FF5E
    .byte $25 ; |  X  X X| $FF5F
    .byte $15 ; |   X X X| $FF60
    .byte $05 ; |     X X| $FF61
    .byte $F5 ; |XXXX X X| $FF62
    .byte $E5 ; |XXX  X X| $FF63
    .byte $D5 ; |XX X X X| $FF64
    .byte $C5 ; |XX   X X| $FF65
    .byte $B5 ; |X XX X X| $FF66
    .byte $A5 ; |X X  X X| $FF67
    .byte $95 ; |X  X X X| $FF68
    .byte $76 ; | XXX XX | $FF69
    .byte $66 ; | XX  XX | $FF6A
    .byte $56 ; | X X XX | $FF6B
    .byte $46 ; | X   XX | $FF6C
    .byte $36 ; |  XX XX | $FF6D
    .byte $26 ; |  X  XX | $FF6E
    .byte $16 ; |   X XX | $FF6F
    .byte $06 ; |     XX | $FF70
    .byte $F6 ; |XXXX XX | $FF71
    .byte $E6 ; |XXX  XX | $FF72
    .byte $D6 ; |XX X XX | $FF73
    .byte $C6 ; |XX   XX | $FF74
    .byte $B6 ; |X XX XX | $FF75
    .byte $A6 ; |X X  XX | $FF76
    .byte $96 ; |X  X XX | $FF77
    .byte $77 ; | XXX XXX| $FF78
    .byte $67 ; | XX  XXX| $FF79
    .byte $57 ; | X X XXX| $FF7A
    .byte $47 ; | X   XXX| $FF7B
    .byte $37 ; |  XX XXX| $FF7C
    .byte $27 ; |  X  XXX| $FF7D
    .byte $17 ; |   X XXX| $FF7E
    .byte $07 ; |     XXX| $FF7F
    .byte $F7 ; |XXXX XXX| $FF80
    .byte $E7 ; |XXX  XXX| $FF81
    .byte $D7 ; |XX X XXX| $FF82
    .byte $C7 ; |XX   XXX| $FF83
    .byte $B7 ; |X XX XXX| $FF84
    .byte $A7 ; |X X  XXX| $FF85
    .byte $97 ; |X  X XXX| $FF86
    .byte $78 ; | XXXX   | $FF87
    .byte $68 ; | XX X   | $FF88
    .byte $58 ; | X XX   | $FF89
    .byte $48 ; | X  X   | $FF8A
    .byte $38 ; |  XXX   | $FF8B
    .byte $28 ; |  X X   | $FF8C
    .byte $18 ; |   XX   | $FF8D
    .byte $08 ; |    X   | $FF8E
    .byte $F8 ; |XXXXX   | $FF8F
    .byte $E8 ; |XXX X   | $FF90
    .byte $D8 ; |XX XX   | $FF91
    .byte $C8 ; |XX  X   | $FF92
    .byte $B8 ; |X XXX   | $FF93
    .byte $A8 ; |X X X   | $FF94
    .byte $98 ; |X  XX   | $FF95
    .byte $79 ; | XXXX  X| $FF96
    .byte $69 ; | XX X  X| $FF97
    .byte $59 ; | X XX  X| $FF98
    .byte $49 ; | X  X  X| $FF99
    .byte $39 ; |  XXX  X| $FF9A
    .byte $29 ; |  X X  X| $FF9B
    .byte $19 ; |   XX  X| $FF9C
    .byte $09 ; |    X  X| $FF9D
    .byte $F9 ; |XXXXX  X| $FF9E
    .byte $E9 ; |XXX X  X| $FF9F
    .byte $D9 ; |XX XX  X| $FFA0
    .byte $C9 ; |XX  X  X| $FFA1
    .byte $B9 ; |X XXX  X| $FFA2
    .byte $A9 ; |X X X  X| $FFA3
    .byte $99 ; |X  XX  X| $FFA4
    .byte $7A ; | XXXX X | $FFA5
    .byte $6A ; | XX X X | $FFA6
    .byte $5A ; | X XX X | $FFA7
    .byte $4A ; | X  X X | $FFA8
    .byte $3A ; |  XXX X | $FFA9
    .byte $2A ; |  X X X | $FFAA
    .byte $1A ; |   XX X | $FFAB
    .byte $0A ; |    X X | $FFAC
LFFAD:
    .byte $20 ; |  X     | $FFAD
    .byte $A0 ; |X X     | $FFAE
    .byte $11 ; |   X   X| $FFAF
    .byte $91 ; |X  X   X| $FFB0
    .byte $02 ; |      X | $FFB1
    .byte $73 ; | XXX  XX| $FFB2
    .byte $F3 ; |XXXX  XX| $FFB3
    .byte $64 ; | XX  X  | $FFB4
    .byte $E4 ; |XXX  X  | $FFB5
    .byte $55 ; | X X X X| $FFB6
    .byte $D5 ; |XX X X X| $FFB7
    .byte $46 ; | X   XX | $FFB8
    .byte $C6 ; |XX   XX | $FFB9
    .byte $37 ; |  XX XXX| $FFBA
    .byte $B7 ; |X XX XXX| $FFBB
    .byte $28 ; |  X X   | $FFBC
    .byte $A8 ; |X X X   | $FFBD
    .byte $19 ; |   XX  X| $FFBE
    .byte $99 ; |X  XX  X| $FFBF
LFFC0:
    .byte $03 ; |      XX| $FFC0
    .byte $06 ; |     XX | $FFC1
    .byte $07 ; |     XXX| $FFC2
    .byte $0B ; |    X XX| $FFC3
    .byte $0C ; |    XX  | $FFC4
    .byte $0D ; |    XX X| $FFC5
    .byte $0F ; |    XXXX| $FFC6
    .byte $10 ; |   X    | $FFC7
    .byte $11 ; |   X   X| $FFC8
    .byte $12 ; |   X  X | $FFC9
    .byte $02 ; |      X | $FFCA
    .byte $03 ; |      XX| $FFCB
    .byte $05 ; |     X X| $FFCC
    .byte $06 ; |     XX | $FFCD
    .byte $08 ; |    X   | $FFCE
    .byte $09 ; |    X  X| $FFCF
    .byte $0A ; |    X X | $FFD0
    .byte $0B ; |    X XX| $FFD1
    .byte $0C ; |    XX  | $FFD2
    .byte $0D ; |    XX X| $FFD3
    .byte $0E ; |    XXX | $FFD4
    .byte $0F ; |    XXXX| $FFD5
    .byte $10 ; |   X    | $FFD6
    .byte $11 ; |   X   X| $FFD7
LFFD8:
    .byte $12 ; |   X  X | $FFD8
    .byte $01 ; |       X| $FFD9
    .byte $08 ; |    X   | $FFDA
    .byte $04 ; |     X  | $FFDB
    .byte $02 ; |      X | $FFDC
LFFDD:
    .byte $01 ; |       X| $FFDD
    .byte $04 ; |     X  | $FFDE
    .byte $07 ; |     XXX| $FFDF
LFFE0:
    .byte $DD ; |XX XXX X| $FFE0
    .byte $BB ; |X XXX XX| $FFE1
    .byte $EE ; |XXX XXX | $FFE2
LFFE3:
    .byte $FF ; |XXXXXXXX| $FFE3
LFFE4:
    .byte $06 ; |     XX | $FFE4
    .byte $01 ; |       X| $FFE5
    .byte $04 ; |     X  | $FFE6
    .byte $07 ; |     XXX| $FFE7
    .byte $01 ; |       X| $FFE8
    .byte $01 ; |       X| $FFE9
    .byte $04 ; |     X  | $FFEA
    .byte $04 ; |     X  | $FFEB
    .byte $07 ; |     XXX| $FFEC
LFFED:
    .byte $07 ; |     XXX| $FFED
    .byte $F4 ; |XXXX X  | $FFEE
    .byte $00 ; |        | $FFEF
    .byte $00 ; |        | $FFF0
    .byte $0C ; |    XX  | $FFF1

      ORG $1FF2
     RORG $FFF2
    
LFFF2:
    cmp    LFFF8                 ; 4
    jmp.ind ($00F7)              ; 5

LFFF8:
    .byte $00 ; |        | $FFF8
    .byte $00 ; |        | $FFF9
    
    .word START_1
    .word START_1
    .word START_1
