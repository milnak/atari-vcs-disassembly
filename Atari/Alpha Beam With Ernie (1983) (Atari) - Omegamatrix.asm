; Disassembly of Alpha Beam With Ernie
; Disassembled by Omegamatrix
; Using DiStella v4.0
;
; updated to use standard joystick
;
; alp1.cfg contents:
;
;      ORG D000
;      CODE D000 D4D0
;      GFX D4D1 D4E6
;      CODE D4E7 D5EC
;      GFX D5ED D5F1
;      CODE D5F2 dA2C
;      GFX DA2D DFEF
;      CODE DFF0 DFF5
;      GFX DFF6 DFFF
;
; alp2.cfg contents:
;
;      ORG F000
;      CODE F000 FDBD
;      GFX FDBE FFEF
;      CODE FFF0 FFF5
;      GFX FFF6 FFFF

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
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXP0FB  =  $32
CXP1FB  =  $33
INPT0   =  $38
INPT1   =  $39
INPT2   =  $3A
INPT3   =  $3B
INPT4   =  $3C
INPT5   =  $3D
SWCHA   =  $0280
SWACNT  =  $0281
SWCHB   =  $0282
INTIM   =  $0284
TIM8T   =  $0295
TIM64T  =  $0296

ORIGINAL = 1 ; 1 = original, 2 = joystick conversion

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RIOT RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RIOT_RAM
       ORG $80

ram_80             ds 1  ; x8
ram_81             ds 1  ; x3
ram_82             ds 2  ; x1
ram_84             ds 2  ; x1
ram_86             ds 1  ; x1
ram_87             ds 1  ; x1
ram_88             ds 2  ; x3
ram_8A             ds 2  ; x1
ram_8C             ds 2  ; x1
ram_8E             ds 2  ; x1
ram_90             ds 2  ; x6
ram_92             ds 2  ; x6
ram_94             ds 1  ; x11
ram_95             ds 1  ; x1
ram_96             ds 1  ; x4
ram_97             ds 1  ; x31
ram_98             ds 1  ; x4
ram_99             ds 1  ; x1
ram_9A             ds 1  ; x2
ram_9B             ds 1  ; x7
ram_9C             ds 1  ; x4
ram_9D             ds 1  ; x1
ram_9E             ds 1  ; x2
ram_9F             ds 1  ; x17
ram_A0             ds 1  ; x4
ram_A1             ds 1  ; x1
ram_A2             ds 1  ; x2
ram_A3             ds 1  ; x32
ram_A4             ds 1  ; x4
ram_A5             ds 1  ; x1
ram_A6             ds 1  ; x2
ram_A7             ds 1  ; x11
ram_A8             ds 1  ; x6
ram_A9             ds 1  ; x4
ram_AA             ds 2  ; x2
ram_AC             ds 2  ; x2
ram_AE             ds 2  ; x2
ram_B0             ds 2  ; x3
ram_B2             ds 2  ; x3
ram_B4             ds 2  ; x3
ram_B6             ds 2  ; x2
ram_B8             ds 1  ; x6
ram_B9             ds 1  ; x4
ram_BA             ds 1  ; x4
ram_BB             ds 1  ; x2
ram_BC             ds 1  ; x3
ram_BD             ds 1  ; x1
ram_BE             ds 2  ; x3
ram_C0             ds 1  ; x4
ram_C1             ds 1  ; x2
ram_C2             ds 2  ; x2
ram_C4             ds 1  ; x12
ram_C5             ds 1  ; x1
ram_C6             ds 1  ; x5
ram_C7             ds 1  ; x14
ram_C8             ds 1  ; x2
ram_C9             ds 1  ; x8
ram_CA             ds 1  ; x2
ram_CB             ds 1  ; x2
ram_CC             ds 1  ; x9
ram_CD             ds 1  ; x7
ram_CE             ds 1  ; x4
ram_CF             ds 1  ; x21
ram_D0             ds 1  ; x17
ram_D1             ds 1  ; x6
ram_D2             ds 1  ; x20
ram_D3             ds 1  ; x6
ram_D4             ds 1  ; x18
ram_D5             ds 1  ; x4
ram_D6             ds 1  ; x38
ram_D7             ds 1  ; x13
ram_D8             ds 1  ; x9
ram_D9             ds 1  ; x4
ram_DA             ds 1  ; x1
ram_DB             ds 1  ; x1
ram_DC             ds 1  ; x2
ram_DD             ds 1  ; x6
ram_DE             ds 1  ; x6
ram_DF             ds 1  ; x7
ram_E0             ds 1  ; x8
ram_E1             ds 1  ; x4
ram_E2             ds 1  ; x14
ram_E3             ds 1  ; x2
ram_E4             ds 1  ; x4
ram_E5             ds 1  ; x4
ram_E6             ds 1  ; x14
ram_E7             ds 1  ; x2
ram_E8             ds 1  ; x13
ram_E9             ds 1  ; x1
ram_EA             ds 1  ; x7
ram_EB             ds 1  ; x5
ram_EC             ds 1  ; x4
ram_ED             ds 1  ; x8
ram_EE             ds 1  ; x13
ram_EF             ds 2  ; x5
ram_F1             ds 2  ; x6
ram_F3             ds 1  ; x87
ram_F4             ds 1  ; x36
ram_F5             ds 1  ; x6
ram_F6             ds 1  ; x8
ram_F7             ds 1  ; x24
ram_F8             ds 2  ; x24
ram_FA             ds 1  ; x4
ram_FB             ds 1  ; x3
ram_FC             ds 1  ; x2
ram_FD             ds 3  ; x2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG CODE

      ORG $0000
     RORG $D000

    jmp    (LDFFC)               ; 5


START_0:
    lda    #$04                  ; 2
    sta    ram_F3                ; 3
    lda    #$F7                  ; 2
    sta    ram_F4                ; 3
    jmp    LDFF0                 ; 3

    ldy    #$BF                  ; 2
LD010:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bne    LD010                 ; 2³
    jmp    LDA20                 ; 3

    ldy    #$48                  ; 2
    jsr    LD14E                 ; 6
    ldx    #$04                  ; 2
LD01F:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LD01F                 ; 2³
    jsr    LD18F                 ; 6
    lda    #$F0                  ; 2
    sta    HMM0                  ; 3
    lda    #$02                  ; 2
    sta    ENAM0                 ; 3
    ldx    #$06                  ; 2
LD031:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    dex                          ; 2
    bne    LD031                 ; 2³
    ldy    #$13                  ; 2
    lda    #$34                  ; 2
    sta    COLUP1                ; 3
    lda    #$25                  ; 2
    sta    CTRLPF                ; 3
    lda    #$E0                  ; 2
    sta    HMP0                  ; 3
    lda    #$30                  ; 2
    sta    HMBL                  ; 3
    lda    #$00                  ; 2
    sta.w  RESP1                 ; 4
    sta    RESP0                 ; 3
    sta    HMM0                  ; 3
    lda    #$30                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$C0                  ; 2
    sta    HMP1                  ; 3
    sta    RESBL                 ; 3
    lda    #$FE                  ; 2
    sta    PF2                   ; 3
    sta    ENABL                 ; 3
    lda    #$36                  ; 2
    sta    COLUP0                ; 3
    dey                          ; 2
LD06A:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    LDCA7,Y               ; 4
    sta    COLUPF                ; 3
    lda    (ram_BA),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_B8),Y            ; 5
    sta    GRP0                  ; 3
    lda    LDA44,Y               ; 4
    sta    HMBL                  ; 3
    beq    LD08A                 ; 2³
    bpl    LD088                 ; 2³
    lda    #$20                  ; 2
    bne    LD08A                 ; 2³
LD088:
    lda    #$E0                  ; 2
LD08A:
    sta    HMP1                  ; 3
    sta    HMP0                  ; 3
    dey                          ; 2
    bne    LD06A                 ; 2³
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    lda    #$1A                  ; 2
    sta    COLUP0                ; 3
    lda    ram_CC                ; 3
    sta    ENAM1                 ; 3
    stx    PF2                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    ENABL                 ; 3
    sta    HMOVE                 ; 3
    ldx    #$06                  ; 2
    lda    ram_D3                ; 3
    sta    COLUP1                ; 3
    ldy    #$03                  ; 2
LD0AD:
    dey                          ; 2
    bne    LD0AD                 ; 2³
    lda    #$10                  ; 2
    sta    HMM0                  ; 3
    dex                          ; 2
LD0B5:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldy    #$06                  ; 2
LD0BB:
    dey                          ; 2
    bne    LD0BB                 ; 2³
    dex                          ; 2
    bne    LD0B5                 ; 2³
    stx    ENAM0                 ; 3
    jsr    LD18F                 ; 6
    stx    HMP0                  ; 3
    stx    HMP1                  ; 3
    lda    #$0F                  ; 2
    sta    COLUPF                ; 3
    lda    #$05                  ; 2
    sta    CTRLPF                ; 3
    ldx    #$03                  ; 2
LD0D4:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LD0D4                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$08                  ; 2
LD0DD:
    dex                          ; 2
    bne    LD0DD                 ; 2³
    nop                          ; 2
    sta.w  RESP0                 ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$08                  ; 2
LD0E8:
    dex                          ; 2
    bne    LD0E8                 ; 2³
    nop                          ; 2
    sta.w  RESP1                 ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    ram_DC                ; 3
    jsr    LD14E                 ; 6
    lda    #$00                  ; 2
    sta    ENABL                 ; 3
    sta    ENAM1                 ; 3
    ldy    ram_DE                ; 3
LD0FE:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bmi    LD116                 ; 2³
    lda    (ram_BC),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_BE),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_D8),Y            ; 5
    sta    COLUP0                ; 3
    lda    (ram_DA),Y            ; 5
    sta    COLUP1                ; 3
    jmp    LD0FE                 ; 3

LD116:
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    ldy    ram_DD                ; 3
    lda    ram_CE                ; 3
    sta    COLUPF                ; 3
    ldx    #$0C                  ; 2
LD124:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bmi    LD13D                 ; 2³
    lda    LDEFD,X               ; 4
    sta    PF0                   ; 3
    lda    LDF09,X               ; 4
    sta    PF1                   ; 3
    lda    LDEF1,X               ; 4
    sta    PF2                   ; 3
    dex                          ; 2
    bne    LD124                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
LD13D:
    lda    #$00                  ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$82                  ; 2
    sta    VBLANK                ; 3
    jmp    LDA20                 ; 3

LD14E:
    ldx    #$0E                  ; 2
LD150:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bne    LD156                 ; 2³
    rts                          ; 6

LD156:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bne    LD15C                 ; 2³
    rts                          ; 6

LD15C:
    lda    ram_A7,X              ; 4
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
    stx    ram_F3                ; 3
    tax                          ; 2
    lda    #$02                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bne    LD16D                 ; 2³
    rts                          ; 6

LD16D:
    pha                          ; 3
    pla                          ; 4
    nop                          ; 2
    nop                          ; 2
LD171:
    dex                          ; 2
    bpl    LD171                 ; 2³
    sta    RESBL                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    dey                          ; 2
    bne    LD17E                 ; 2³
    rts                          ; 6

LD17E:
    sta    ENABL                 ; 3
    lda    #$00                  ; 2
    ldx    ram_F3                ; 3
    dex                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bne    LD18B                 ; 2³
    rts                          ; 6

LD18B:
    sta    ENABL                 ; 3
    bne    LD150                 ; 2³
LD18F:
    ldx    #$02                  ; 2
LD191:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$01                  ; 2
    sta    PF1                   ; 3
    lda    #$07                  ; 2
    sta    PF2                   ; 3
    lda    #$76                  ; 2
    sta    COLUPF                ; 3
    ldy    #$04                  ; 2
LD1A1:
    dey                          ; 2
    bne    LD1A1                 ; 2³
    nop                          ; 2
    sty    PF1                   ; 3
    sty    PF2                   ; 3
    dex                          ; 2
    bne    LD191                 ; 2³
    rts                          ; 6

    lda    ram_F7                ; 3
    and    #$7F                  ; 2
    tax                          ; 2
    lda    LDBF4,X               ; 4
    sta    ram_F3                ; 3
    lda    LDBFB,X               ; 4
    sta    ram_F4                ; 3
    jmp.ind ($00F3)              ; 5

    dec    ram_CF                ; 5
    bne    LD232                 ; 2³+1
    lda    ram_D0                ; 3
    bne    LD1CB                 ; 2³
    ldy    ram_D1                ; 3
    bmi    LD1D9                 ; 2³
LD1CB:
    ldy    ram_CD                ; 3
    cmp    LD4E2,Y               ; 4
    bne    LD1D6                 ; 2³
    ldy    #$FF                  ; 2
    sty    ram_D1                ; 3
LD1D6:
    jmp    LD229                 ; 3

LD1D9:
    lda    #$00                  ; 2
    sta    ram_D2                ; 3
    lda    #$07                  ; 2
    sta    ram_CF                ; 3
    ldx    ram_CD                ; 3
    bne    LD1F0                 ; 2³
    lda    #$84                  ; 2
    sta    ram_F7                ; 3
    lda    #$01                  ; 2
    sta    ram_DF                ; 3
    jmp    LD38C                 ; 3

LD1F0:
    ldy    LDD06,X               ; 4
    sty    ram_CE                ; 3
    ldy    #$00                  ; 2
    cpx    #$04                  ; 2
    beq    LD201                 ; 2³+1
    inx                          ; 2
    inx                          ; 2
    stx    ram_D2                ; 3
    ldy    #$01                  ; 2
LD201:
    sty    ram_F3                ; 3
    ldx    #$02                  ; 2
LD205:
    ldy    ram_F3                ; 3
    txa                          ; 2
    ror                          ; 2
    ror                          ; 2
    tya                          ; 2
    rol                          ; 2
    tay                          ; 2
    lda    LDCFF,Y               ; 4
    sta    ram_D8,X              ; 4
    lda    LDD03,Y               ; 4
    sta    ram_D9,X              ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LD205                 ; 2³
    lda    #$0C                  ; 2
    ldy    #$1C                  ; 2
    jsr    LD4A2                 ; 6
    lda    #$81                  ; 2
    sta    ram_F7                ; 3
    jmp    LD38C                 ; 3

LD229:
    clc                          ; 2
    adc    ram_D1                ; 3
    sta    ram_D0                ; 3
    lda    #$18                  ; 2
    sta    ram_CF                ; 3
LD232:
    jsr    LD4B1                 ; 6
    lda    ram_D0                ; 3
    cmp    #$02                  ; 2
    bcs    LD24B                 ; 2³
    lda    ram_D1                ; 3
    bpl    LD24B                 ; 2³
    ldx    #$00                  ; 2
    stx    AUDV0                 ; 3
    jsr    LD4C8                 ; 6
    ldx    #$02                  ; 2
    jsr    LD4C8                 ; 6
LD24B:
    jmp    LD38C                 ; 3

    dec    ram_CF                ; 5
    bne    LD2B5                 ; 2³
    lda    ram_DD                ; 3
    cmp    #$0C                  ; 2
    bne    LD2AD                 ; 2³
    lda    ram_E0                ; 3
    cmp    #$0E                  ; 2
    bne    LD264                 ; 2³
    lda    ram_E2                ; 3
    cmp    #$01                  ; 2
    beq    LD26B                 ; 2³
LD264:
    lda    #$01                  ; 2
    sta    ram_CF                ; 3
    jmp    LD38C                 ; 3

LD26B:
    lda    #$00                  ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    sta    ram_E0                ; 3
    sta    ram_E1                ; 3
    ldx    ram_CD                ; 3
    cpx    #$04                  ; 2
    beq    LD28A                 ; 2³
    lda    #$06                  ; 2
    sta    ram_DE                ; 3
    lda    #$78                  ; 2
    sta    ram_DF                ; 3
    lda    #$84                  ; 2
    sta    ram_F7                ; 3
    jmp    LD38C                 ; 3

LD28A:
    lda    #$82                  ; 2
    sta    ram_F7                ; 3
    lda    #$0C                  ; 2
    sta    ram_D4                ; 3
    sta    ram_CF                ; 3
    lda    #$02                  ; 2
    sta    ram_CC                ; 3
    ldx    #$08                  ; 2
    stx    ram_E4                ; 3
    ldx    #$1D                  ; 2
    stx    AUDF0                 ; 3
    stx    ram_E5                ; 3
    ldx    #$04                  ; 2
    stx    AUDC0                 ; 3
    ldx    #$04                  ; 2
    stx    AUDV0                 ; 3
    jmp    LD38C                 ; 3

LD2AD:
    adc    #$01                  ; 2
    sta    ram_DD                ; 3
    lda    #$07                  ; 2
    sta    ram_CF                ; 3
LD2B5:
    jmp    LD38C                 ; 3

    dec    ram_CF                ; 5
    bne    LD2E0                 ; 2³
    lda    ram_DE                ; 3
    cmp    #$0E                  ; 2
    bne    LD2D8                 ; 2³
    lda    #$00                  ; 2
    sta    ram_CC                ; 3
    lda    #$04                  ; 2
    ldy    #$0E                  ; 2
    jsr    LD4A2                 ; 6
    lda    #$83                  ; 2
    sta    ram_F7                ; 3
    lda    #$3F                  ; 2
    sta    ram_CF                ; 3
    jmp    LD38C                 ; 3

LD2D8:
    adc    #$01                  ; 2
    sta    ram_DE                ; 3
    lda    ram_D4                ; 3
    sta    ram_CF                ; 3
LD2E0:
    dec    ram_E4                ; 5
    lda    ram_E4                ; 3
    tax                          ; 2
    sta    ram_F3                ; 3
    sec                          ; 2
    sbc    ram_E5                ; 3
    tay                          ; 2
    txa                          ; 2
    and    #$07                  ; 2
    bne    LD2F8                 ; 2³
    lda    #$08                  ; 2
    sta    ram_E4                ; 3
    dec    ram_E5                ; 5
    ldy    ram_E5                ; 3
LD2F8:
    sty    AUDF0                 ; 3
    jmp    LD38C                 ; 3

    lda    ram_E0                ; 3
    bne    LD30D                 ; 2³
    dec    ram_CF                ; 5
    bne    LD30D                 ; 2³
    lda    #$84                  ; 2
    sta    ram_F7                ; 3
    lda    #$01                  ; 2
    sta    ram_DF                ; 3
LD30D:
    lda    ram_97                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    and    #$01                  ; 2
    sta    ram_D2                ; 3
    jmp    LD38C                 ; 3

    dec    ram_DF                ; 5
    lda    ram_DF                ; 3
    bne    LD32E                 ; 2³
    lda    #$05                  ; 2
    sta    ram_F7                ; 3
    lda    #$03                  ; 2
    sta    ram_F6                ; 3
    lda    ram_A3                ; 3
    ora    #$03                  ; 2
    sta    ram_A3                ; 3
LD32E:
    cmp    #$30                  ; 2
    bne    LD336                 ; 2³
    lda    #$00                  ; 2
    sta    AUDV0                 ; 3
LD336:
    jmp    LD38C                 ; 3

    lda    ram_CF                ; 3
    cmp    #$40                  ; 2
    beq    LD348                 ; 2³
    lda    ram_97                ; 3
    and    #$01                  ; 2
    bne    LD371                 ; 2³
    jsr    LD4B1                 ; 6
LD348:
    dec    ram_CF                ; 5
    bne    LD35F                 ; 2³
    lda    #$0A                  ; 2
    sta    AUDF0                 ; 3
    lda    #$05                  ; 2
    sta    AUDV0                 ; 3
    lda    #$80                  ; 2
    sta    ram_F7                ; 3
    lda    #$18                  ; 2
    sta    ram_CF                ; 3
    jmp    LD38C                 ; 3

LD35F:
    lda    ram_CF                ; 3
    sta    AUDF0                 ; 3
    cmp    #$1F                  ; 2
    bcc    LD36C                 ; 2³
    ldx    #$00                  ; 2
    jsr    LD4C8                 ; 6
LD36C:
    ldx    #$02                  ; 2
    jsr    LD4C8                 ; 6
LD371:
    jmp    LD38C                 ; 3

    dec    ram_CF                ; 5
    bne    LD383                 ; 2³
    lda    #$84                  ; 2
    sta    ram_F7                ; 3
    lda    #$80                  ; 2
    sta    ram_DF                ; 3
    jmp    LD38C                 ; 3

LD383:
    lda    ram_CF                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    eor    #$FF                  ; 2
    sta    AUDF0                 ; 3
LD38C:
    lda    #$48                  ; 2
    sec                          ; 2
    sbc    ram_DD                ; 3
    sbc    ram_DE                ; 3
    sta    ram_DC                ; 3
    ldx    #$01                  ; 2
LD397:
    lda    ram_E0,X              ; 4
    beq    LD3D5                 ; 2³
    dec    ram_E2,X              ; 6
    bne    LD3D5                 ; 2³
    dec    ram_E0,X              ; 6
    bne    LD3AA                 ; 2³
    lda    #$00                  ; 2
    sta    AUDV0,X               ; 4
    jmp    LD3D5                 ; 3

LD3AA:
    txa                          ; 2
    lsr                          ; 2
    lda    ram_E0,X              ; 4
    rol                          ; 2
    tay                          ; 2
    lda    LDCB8,Y               ; 4
    sta    ram_F3                ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LDCF7,Y               ; 4
    sta    ram_E2,X              ; 4
    lda    ram_F3                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    cmp    #$0E                  ; 2
    bne    LD3CB                 ; 2³
    lda    #$00                  ; 2
    beq    LD3D3                 ; 2³
LD3CB:
    tay                          ; 2
    lda    LDCF0,Y               ; 4
    sta    AUDF0,X               ; 4
    lda    #$05                  ; 2
LD3D3:
    sta    AUDV0,X               ; 4
LD3D5:
    dex                          ; 2
    bpl    LD397                 ; 2³
    ldy    ram_D2                ; 3
    sty    ram_F3                ; 3
    ldx    #$02                  ; 2
LD3DE:
    ldy    ram_F3                ; 3
    txa                          ; 2
    ror                          ; 2
    ror                          ; 2
    tya                          ; 2
    rol                          ; 2
    tay                          ; 2
    lda    LDDF8,Y               ; 4
    sta    ram_BC,X              ; 4
    lda    LDE04,Y               ; 4
    sta    ram_BD,X              ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LD3DE                 ; 2³
    lda    ram_97                ; 3
    lsr                          ; 2
    lsr                          ; 2
    and    #$07                  ; 2
    tax                          ; 2
    lda    LD4D1,X               ; 4
    ora    #$50                  ; 2
    sta    ram_D3                ; 3
    lda    #$00                  ; 2
    sta    ram_F3                ; 3
    lda    ram_97                ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LDC08,Y               ; 4
    ldx    ram_D0                ; 3
    and    LD4D9,X               ; 4
    beq    LD417                 ; 2³
    inc    ram_F3                ; 5
LD417:
    lda    LD4D9,X               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    clc                          ; 2
    adc    ram_F3                ; 3
    sta    ram_F3                ; 3
    ldx    #$0E                  ; 2
LD425:
    lda    $7F,X                 ; 4
    sec                          ; 2
    sbc    ram_F3                ; 3
    cmp    #$0A                  ; 2
    bcs    LD430                 ; 2³
    adc    #$90                  ; 2
LD430:
    sta    $7F,X                 ; 4
    dex                          ; 2
    bne    LD425                 ; 2³
    ldx    #$0E                  ; 2
LD437:
    lda    $7F,X                 ; 4
    ldy    #$FF                  ; 2
    cmp    #$52                  ; 2
    bcc    LD443                 ; 2³
    sbc    #$4B                  ; 2
    ldy    #$04                  ; 2
LD443:
    cpx    #$02                  ; 2
    adc    #$02                  ; 2
LD447:
    iny                          ; 2
    sbc    #$0F                  ; 2
    bcs    LD447                 ; 2³
    eor    #$FF                  ; 2
    sbc    #$06                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_F3                ; 3
    tya                          ; 2
    and    #$0F                  ; 2
    ora    ram_F3                ; 3
    sta    ram_A7,X              ; 4
    dex                          ; 2
    bne    LD437                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$06                  ; 2
LD464:
    dex                          ; 2
    bne    LD464                 ; 2³
    nop                          ; 2
    sta.w  RESM0                 ; 4
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    sta    RESM1                 ; 3
    lda    #$10                  ; 2
    sta    HMM0                  ; 3
    lda    #$20                  ; 2
    sta    HMM1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$1A                  ; 2
    sta    COLUP0                ; 3
    lda    #$30                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$34                  ; 2
    sta    COLUP1                ; 3
    lda    #$0F                  ; 2
    sta    COLUPF                ; 3
    lda    #$E0                  ; 2
    sta    HMP0                  ; 3
    stx    HMM0                  ; 3
    stx    HMM1                  ; 3
    lda    #$5D                  ; 2
    sta    ram_F3                ; 3
    lda    #$F5                  ; 2
    sta    ram_F4                ; 3
    jmp    LDFF0                 ; 3

LD4A2:
    sta    AUDC0                 ; 3
    sta    AUDC1                 ; 3
    sty    ram_E0                ; 3
    sty    ram_E1                ; 3
    lda    #$01                  ; 2
    sta    ram_E2                ; 3
    sta    ram_E3                ; 3
    rts                          ; 6

LD4B1:
    lda    #$D2                  ; 2
    sta    ram_B9                ; 3
    sta    ram_BB                ; 3
    lda    ram_97                ; 3
    sta    ram_F3                ; 3
    ror                          ; 2
    ror                          ; 2
    eor    ram_F3                ; 3
    adc    #$4E                  ; 2
    sta    ram_B8                ; 3
    eor    ram_97                ; 3
    sta    ram_BA                ; 3
    rts                          ; 6

LD4C8:
    lda    #$51                  ; 2
    sta    ram_B8,X              ; 4
    lda    #$DB                  ; 2
    sta    ram_B9,X              ; 4
    rts                          ; 6

LD4D1:
    .byte $02 ; |      X | $D4D1
    .byte $04 ; |     X  | $D4D2
    .byte $06 ; |     XX | $D4D3
    .byte $08 ; |    X   | $D4D4
    .byte $0A ; |    X X | $D4D5
    .byte $08 ; |    X   | $D4D6
    .byte $06 ; |     XX | $D4D7
    .byte $04 ; |     X  | $D4D8
LD4D9:
    .byte $00 ; |        | $D4D9
    .byte $08 ; |    X   | $D4DA
    .byte $10 ; |   X    | $D4DB
    .byte $18 ; |   XX   | $D4DC
    .byte $20 ; |  X     | $D4DD
    .byte $28 ; |  X X   | $D4DE
    .byte $30 ; |  XX    | $D4DF
    .byte $38 ; |  XXX   | $D4E0
    .byte $40 ; | X      | $D4E1
LD4E2:
    .byte $48 ; | X  X   | $D4E2
    .byte $03 ; |      XX| $D4E3
    .byte $05 ; |     X X| $D4E4
    .byte $07 ; |     XXX| $D4E5
    .byte $09 ; |    X  X| $D4E6
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$00                  ; 2
    stx    NUSIZ1                ; 3
    inx                          ; 2
    stx    CTRLPF                ; 3
    lda    #$C6                  ; 2
    eor    ram_90                ; 3
    and    ram_92                ; 3
    sta    COLUPF                ; 3
    ldx    #$06                  ; 2
    lda    ram_97                ; 3
    bmi    LD50D                 ; 2³+1
LD4FE:
    lda    LDEAF,X               ; 4
    sta    ram_80,X              ; 4
    lda    LDEB6,X               ; 4
    sta    ram_88,X              ; 4
    dex                          ; 2
    bpl    LD4FE                 ; 2³+1
    bmi    LD51A                 ; 2³
LD50D:
    lda    LDEBD,X               ; 4
    sta    ram_80,X              ; 4
    lda    LDEC4,X               ; 4
    sta    ram_88,X              ; 4
    dex                          ; 2
    bpl    LD50D                 ; 2³
LD51A:
    ldx    #$0E                  ; 2
LD51C:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    LD51C                 ; 2³
    ldx    #$10                  ; 2
LD523:
    lda    #$05                  ; 2
    sta    ram_F3                ; 3
LD527:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LDFA8,X               ; 4
    sta    PF1                   ; 3
    lda    LDFB9,X               ; 4
    sta    PF2                   ; 3
    ldy    #$04                  ; 2
LD535:
    dey                          ; 2
    bpl    LD535                 ; 2³
    lda    LDFCA,X               ; 4
    sta.w  PF2                   ; 4
    lda    LDFDB,X               ; 4
    sta    PF1                   ; 3
    dec    ram_F3                ; 5
    bne    LD527                 ; 2³
    dex                          ; 2
    bpl    LD523                 ; 2³
    ldx    #$1B                  ; 2
LD54C:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bne    LD54C                 ; 2³
    sta    HMCLR                 ; 3
    txa                          ; 2
    ldy    #$0A                  ; 2
LD556:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    ENABL                 ; 3
    sta    CTRLPF                ; 3
    stx    COLUPF                ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    (ram_C4),Y            ; 5
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
    ora    #$40                  ; 2
    tax                          ; 2
    lda    (ram_C7),Y            ; 5
    dey                          ; 2
    bne    LD556                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    ENABL                 ; 3
    sta    CTRLPF                ; 3
    stx    COLUPF                ; 3
    ldx    #$1A                  ; 2
    stx    COLUP1                ; 3
    ldy    #$0C                  ; 2
    nop                          ; 2
    sta    HMCLR                 ; 3
LD585:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    (ram_C0),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    bne    LD585                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    GRP1                  ; 3
    ldx    #$1B                  ; 2
LD596:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    LD596                 ; 2³
    stx    HMP0                  ; 3
    inx                          ; 2
    stx    HMP1                  ; 3
    inx                          ; 2
    stx    NUSIZ1                ; 3
    inx                          ; 2
    inx                          ; 2
    stx    NUSIZ0                ; 3
    lda    #$C6                  ; 2
    eor    ram_90                ; 3
    and    ram_92                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    #$07                  ; 2
LD5BB:
    stx    ram_F4                ; 3
    sta    WSYNC                 ; 3
    ldy    #$02                  ; 2
LD5C1:
    dey                          ; 2
    bne    LD5C1                 ; 2³
    lda    LDEA7,X               ; 4
    sta    GRP0                  ; 3
    lda    $7F,X                 ; 4
    sta    GRP1                  ; 3
    ldy    ram_87,X              ; 4
    lda    LDECA,X               ; 4
    sta    ram_F3                ; 3
    lda    LDED1,X               ; 4
    ldx    ram_F3                ; 3
    sty    GRP0                  ; 3
    stx    GRP1                  ; 3
    sta    GRP0                  ; 3
    ldx    ram_F4                ; 3
    dex                          ; 2
    bne    LD5BB                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    jmp    LDA20                 ; 3

    .byte $00 ; |        | $D5ED
    .byte $00 ; |        | $D5EE
    .byte $00 ; |        | $D5EF
    .byte $00 ; |        | $D5F0
    .byte $00 ; |        | $D5F1
    ldy    #$1E                  ; 2
    sta    WSYNC                 ; 3
LD5F6:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_80),Y            ; 5
    and    (ram_94),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_84),Y            ; 5
    and    (ram_98),Y            ; 5
    tax                          ; 2
    lda    (ram_88),Y            ; 5
    stx    GRP1                  ; 3
    and    (ram_9C),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_8C),Y            ; 5
    and    (ram_A0),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_90),Y            ; 5
    and    (ram_A4),Y            ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    bne    LD5F6                 ; 2³+1
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    NUSIZ0                ; 3
    sty    NUSIZ1                ; 3
    pla                          ; 4
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
LD628:
    dex                          ; 2
    bpl    LD628                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_D2                ; 3
    bit    CXP0FB                ; 3
    bvc    LD645                 ; 2³
    ldx    #$04                  ; 2
    cmp    #$57                  ; 2
    bcc    LD651                 ; 2³
    inx                          ; 2
    inx                          ; 2
    cmp    #$77                  ; 2
    bcc    LD651                 ; 2³
    inx                          ; 2
    inx                          ; 2
    bcs    LD651                 ; 2³
LD645:
    bit    CXP1FB                ; 3
    bvc    LD657                 ; 2³
    ldx    #$00                  ; 2
    cmp    #$17                  ; 2
    bcc    LD651                 ; 2³
    inx                          ; 2
    inx                          ; 2
LD651:
    lda    ram_D8,X              ; 4
    ora    #$80                  ; 2
    sta    ram_D8,X              ; 4
LD657:
    sta    CXCLR                 ; 3
    ldy    #$04                  ; 2
    ldx    #$0B                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
LD661:
    dex                          ; 2
    bne    LD661                 ; 2³
    sta    HMCLR                 ; 3
    lda    #$80                  ; 2
    sta    HMP0                  ; 3
    sta    RESP0                 ; 3
LD66C:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    LDFEB,Y               ; 4
    sta    GRP0                  ; 3
    lda    ram_97                ; 3
    eor.wy ram_D8,Y              ; 4
    sta    COLUP0                ; 3
    dey                          ; 2
    bne    LD66C                 ; 2³
    ldy    #$0A                  ; 2
    lda    (ram_C4),Y            ; 5
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
    ora    #$40                  ; 2
    stx    GRP0                  ; 3
    tax                          ; 2
    lda    (ram_C7),Y            ; 5
    dey                          ; 2
LD68F:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    ENABL                 ; 3
    sta    CTRLPF                ; 3
    stx    COLUPF                ; 3
    ldx    #$03                  ; 2
LD69B:
    dex                          ; 2
    bne    LD69B                 ; 2³
    lda    (ram_C4),Y            ; 5
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
    ora    #$40                  ; 2
    tax                          ; 2
    lda    (ram_C7),Y            ; 5
    dey                          ; 2
    bne    LD68F                 ; 2³
    nop                          ; 2
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    CTRLPF                ; 3
    sta    ENABL                 ; 3
    stx    COLUPF                ; 3
    lda    #$08                  ; 2
    sta    GRP0                  ; 3
    eor    ram_97                ; 3
    lsr                          ; 2
    sta    COLUP0                ; 3
    ldx    #$08                  ; 2
LD6C4:
    dex                          ; 2
    bne    LD6C4                 ; 2³
    ldy    #$0C                  ; 2
    stx    GRP0                  ; 3
LD6CB:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    (ram_C0),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    bne    LD6CB                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    GRP1                  ; 3
    iny                          ; 2
    sty    GRP0                  ; 3
    eor    ram_97                ; 3
    lsr                          ; 2
    lsr                          ; 2
    sta    COLUP0                ; 3
    ldx    #$05                  ; 2
LD6E5:
    dex                          ; 2
    bne    LD6E5                 ; 2³
    lda    #$31                  ; 2
    sta    NUSIZ1                ; 3
    sta    NUSIZ0                ; 3
    iny                          ; 2
    sty    ENAM0                 ; 3
    sty    ENAM1                 ; 3
    stx    GRP0                  ; 3
    lda    #$76                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldy    #$0F                  ; 2
LD6FD:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    #$06                  ; 2
LD703:
    dex                          ; 2
    bne    LD703                 ; 2³
    cpy    #$0C                  ; 2
    bne    LD716                 ; 2³
    lda    #$1A                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$30                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
LD716:
    lda    LDA4F,Y               ; 4
    sta    HMM0                  ; 3
    sta    HMM1                  ; 3
    dey                          ; 2
    bne    LD6FD                 ; 2³+1
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    ENABL                 ; 3
    sty    HMBL                  ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    #$76                  ; 2
    sta.w  COLUPF                ; 4
    ldx    #$35                  ; 2
    stx    CTRLPF                ; 3
    sta    RESP0                 ; 3
    lda    #$10                  ; 2
    sta    HMP0                  ; 3
    sta    HMP1                  ; 3
    ldy    #$76                  ; 2
    ldx    #$06                  ; 2
    sta.w  RESP1                 ; 4
    sty.w  COLUPF                ; 4
    ldy    #$0C                  ; 2
    stx.w  NUSIZ0                ; 4
    lda    (ram_E8),Y            ; 5
    nop                          ; 2
    sta    RESBL                 ; 3
    sta    PF2                   ; 3
    nop                          ; 2
    lda    #$1F                  ; 2
    sta    PF1                   ; 3
    ldx    #$02                  ; 2
    sta    HMOVE                 ; 3
    sty    ENAM1                 ; 3
    stx    NUSIZ1                ; 3
    lda    LDA6C,Y               ; 4
    sta    GRP0                  ; 3
    lda    (ram_AC),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_A8),Y            ; 5
    sta    GRP0                  ; 3
    stx    ENABL                 ; 3
    ldx    #$F0                  ; 2
    lda    (ram_B0),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_B4),Y            ; 5
    sta    GRP1                  ; 3
    sta    HMCLR                 ; 3
    stx    HMBL                  ; 3
    dey                          ; 2
    lda    LDA39,Y               ; 4
    nop                          ; 2
    sta    COLUPF                ; 3
LD782:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    LDA6C,Y               ; 4
    sta    GRP0                  ; 3
    lda    (ram_E8),Y            ; 5
    sta    PF2                   ; 3
    lda    (ram_AC),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_A8),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_B0),Y            ; 5
    lda    (ram_B0),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_B4),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_B4),Y            ; 5
    lda    LDA39,Y               ; 4
    dey                          ; 2
    sta    COLUPF                ; 3
    bne    LD782                 ; 2³
    sty    GRP0                  ; 3
    nop                          ; 2
    sta    HMOVE                 ; 3
    lda    #$1F                  ; 2
    sta    PF1                   ; 3
    lda    #$FF                  ; 2
    sta    PF2                   ; 3
    lda    #$06                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$7A                  ; 2
    sta    COLUP0                ; 3
    sta    HMCLR                 ; 3
    pha                          ; 3
    pla                          ; 4
    lda    #$7F                  ; 2
    sta    PF1                   ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$1F                  ; 2
    sta    PF1                   ; 3
    lda    #$FF                  ; 2
    sta    PF2                   ; 3
    ldx    #$08                  ; 2
LD7D6:
    dex                          ; 2
    bne    LD7D6                 ; 2³
    nop                          ; 2
    lda    #$7F                  ; 2
    sta    PF1                   ; 3
    ldy    #$08                  ; 2
    lda    #$99                  ; 2
    sta    PF2                   ; 3
    lda    #$1F                  ; 2
    sta    PF1                   ; 3
LD7E8:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    lda    (ram_BA),Y            ; 5
    sta    GRP1                  ; 3
    ldx    #$7A                  ; 2
    stx    COLUP1                ; 3
    lda    (ram_BC),Y            ; 5
    tax                          ; 2
    lda    (ram_B8),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_BE),Y            ; 5
    lda    (ram_BE),Y            ; 5
    stx    GRP0                  ; 3
    ldx    #$1A                  ; 2
    sta    GRP1                  ; 3
    lda    (ram_EB),Y            ; 5
    sta    GRP1                  ; 3
    stx    COLUP1                ; 3
    dey                          ; 2
    bne    LD7E8                 ; 2³+1
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    GRP0                  ; 3
    lda    #$1F                  ; 2
    sta    PF1                   ; 3
    lda    #$FF                  ; 2
    sta    PF2                   ; 3
    lda    ram_E8                ; 3
    ldx    ram_EA                ; 3
    stx    ram_E8                ; 3
    sta    ram_EA                ; 3
    lda    ram_C4                ; 3
    ldy    ram_C6                ; 3
    sty    ram_C4                ; 3
    sta    ram_C6                ; 3
    lda    #$7F                  ; 2
    sta    PF1                   ; 3
    lda    ram_C7                ; 3
    ldy    ram_C9                ; 3
    sty    ram_C7                ; 3
    sta    ram_C9                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$1F                  ; 2
    sta    PF1                   ; 3
    lda    #$FF                  ; 2
    sta    PF2                   ; 3
    lda    #$02                  ; 2
    sta    NUSIZ1                ; 3
    ldx    #$10                  ; 2
    stx    HMBL                  ; 3
    ldx    #$06                  ; 2
LD84C:
    dex                          ; 2
    bne    LD84C                 ; 2³
    lda    #$7F                  ; 2
    sta    PF1                   ; 3
    lda    #$1A                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldy    #$0C                  ; 2
    lda    #$1F                  ; 2
    sta    PF1                   ; 3
LD85F:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    LDA6C,Y               ; 4
    sta    GRP0                  ; 3
    lda    (ram_E8),Y            ; 5
    sta    PF2                   ; 3
    lda    (ram_AE),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_AA),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_B2),Y            ; 5
    lda    (ram_B2),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_B6),Y            ; 5
    sta    GRP1                  ; 3
    nop                          ; 2
    lda    LDA30,Y               ; 4
    dey                          ; 2
    cpy    #$01                  ; 2
    sta    COLUPF                ; 3
    bne    LD85F                 ; 2³
    lda    LDA6C,Y               ; 4
    nop                          ; 2
    sta    HMOVE                 ; 3
    sta    GRP0                  ; 3
    lda    (ram_E8),Y            ; 5
    sta    PF2                   ; 3
    lda    (ram_AE),Y            ; 5
    sta    GRP1                  ; 3
    nop                          ; 2
    lda    (ram_AA),Y            ; 5
    sta    GRP0                  ; 3
    ldx    #$32                  ; 2
    lda    (ram_B2),Y            ; 5
    sta.w  GRP0                  ; 4
    lda    (ram_B6),Y            ; 5
    sta    GRP1                  ; 3
    lda    #$30                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    stx    ENAM1                 ; 3
    dey                          ; 2
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    ENABL                 ; 3
    sty    PF2                   ; 3
    sty    PF1                   ; 3
    pla                          ; 4
    sta.w  HMBL                  ; 4
    and    #$0F                  ; 2
    tax                          ; 2
    lda    ram_D7                ; 3
LD8C5:
    dex                          ; 2
    bpl    LD8C5                 ; 2³
    sta    RESBL                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    ENABL                 ; 3
    iny                          ; 2
    lda    (ram_C4),Y            ; 5
    and    #$0F                  ; 2
    ora    #$C0                  ; 2
    sta    COLUPF                ; 3
    lda    #$12                  ; 2
    sta    CTRLPF                ; 3
    lda    #$10                  ; 2
    sta    HMM0                  ; 3
    sta    HMM1                  ; 3
    sta    RESP0                 ; 3
    dey                          ; 2
    sty    HMBL                  ; 3
    ldy    #$0E                  ; 2
LD8EA:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    cpy    #$04                  ; 2
    bne    LD8FE                 ; 2³
    lda    #$31                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    lda    #$76                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
LD8FE:
    ldx    #$05                  ; 2
LD900:
    dex                          ; 2
    bne    LD900                 ; 2³
    lda    LDA5E,Y               ; 4
    sta    HMM0                  ; 3
    sta    HMM1                  ; 3
    dey                          ; 2
    bne    LD8EA                 ; 2³+1
    sty    ENAM0                 ; 3
    sty    ENAM1                 ; 3
    sty    NUSIZ0                ; 3
    sty    NUSIZ1                ; 3
    iny                          ; 2
    sty    GRP0                  ; 3
    lda    ram_97                ; 3
    sta    COLUP0                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    pla                          ; 4
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    ldy    #$0C                  ; 2
    lda    (ram_C2),Y            ; 5
LD928:
    dex                          ; 2
    bpl    LD928                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    GRP1                  ; 3
    lda    #$1A                  ; 2
    sta    COLUP1                ; 3
    inx                          ; 2
    stx    GRP0                  ; 3
    dey                          ; 2
    lda    #$80                  ; 2
    sta    HMP0                  ; 3
LD93F:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_C2),Y            ; 5
    sta    GRP1                  ; 3
    dey                          ; 2
    bne    LD93F                 ; 2³
    ldx    #$07                  ; 2
LD94A:
    dex                          ; 2
    bne    LD94A                 ; 2³
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    GRP1                  ; 3
    iny                          ; 2
    sty    GRP0                  ; 3
    lda    ram_97                ; 3
    asl                          ; 2
    sta    COLUP0                ; 3
    ldy    #$0A                  ; 2
    lda    (ram_C4),Y            ; 5
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
    ora    #$C0                  ; 2
    tax                          ; 2
    lda    (ram_C7),Y            ; 5
    dey                          ; 2
LD969:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    CTRLPF                ; 3
    sta    ENABL                 ; 3
    stx    COLUPF                ; 3
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    pha                          ; 3
    pla                          ; 4
    lda    (ram_C4),Y            ; 5
    sta    HMBL                  ; 3
    and    #$0F                  ; 2
    ora    #$C0                  ; 2
    tax                          ; 2
    lda    (ram_C7),Y            ; 5
    dey                          ; 2
    bne    LD969                 ; 2³
    pha                          ; 3
    pla                          ; 4
    pha                          ; 3
    pla                          ; 4
    sta    RESP0                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    ENABL                 ; 3
    stx    COLUPF                ; 3
    ldy    #$04                  ; 2
    sta    WSYNC                 ; 3
LD997:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    LDFEB,Y               ; 4
    sta    GRP0                  ; 3
    lda    ram_97                ; 3
    eor.wy ram_D8,Y              ; 4
    sta    COLUP0                ; 3
    dey                          ; 2
    bne    LD997                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    CXCLR                 ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    pla                          ; 4
    sta    HMP1                  ; 3
    pla                          ; 4
    sta    HMP0                  ; 3
    sta    RESP1                 ; 3
    ldx    ram_94                ; 3
    lda    ram_96                ; 3
    sta    ram_94                ; 3
    stx    ram_96                ; 3
    ldy    #$06                  ; 2
    sty    NUSIZ0                ; 3
    ldy    #$02                  ; 2
    sta    RESP0                 ; 3
    sty    NUSIZ1                ; 3
    ldx    ram_98                ; 3
    lda    ram_9A                ; 3
    sta    ram_98                ; 3
    stx    ram_9A                ; 3
    lda    #$1A                  ; 2
    sta    COLUP0                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    ram_9C                ; 3
    lda    ram_9E                ; 3
    sta    ram_9C                ; 3
    stx    ram_9E                ; 3
    ldx    ram_A0                ; 3
    lda    ram_A2                ; 3
    sta    ram_A0                ; 3
    stx    ram_A2                ; 3
    ldx    ram_A4                ; 3
    lda    ram_A6                ; 3
    sta    ram_A4                ; 3
    stx    ram_A6                ; 3
    ldy    #$1E                  ; 2
LD9F6:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_82),Y            ; 5
    and    (ram_94),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_86),Y            ; 5
    and    (ram_98),Y            ; 5
    tax                          ; 2
    lda    (ram_8A),Y            ; 5
    stx    GRP1                  ; 3
    and    (ram_9C),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_8E),Y            ; 5
    and    (ram_A0),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_92),Y            ; 5
    and    (ram_A4),Y            ; 5
    sta    GRP0                  ; 3
    dey                          ; 2
    bne    LD9F6                 ; 2³+1
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
LDA20:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$03                  ; 2
    sta    ram_F3                ; 3
    lda    #$F0                  ; 2
    sta    ram_F4                ; 3
    jmp    LDFF0                 ; 3

    .byte $00 ; |        | $DA2D
    .byte $00 ; |        | $DA2E
    .byte $00 ; |        | $DA2F
LDA30:
    .byte $00 ; |        | $DA30
    .byte $00 ; |        | $DA31
    .byte $76 ; | XXX XX | $DA32
    .byte $72 ; | XXX  X | $DA33
    .byte $74 ; | XXX X  | $DA34
    .byte $74 ; | XXX X  | $DA35
    .byte $76 ; | XXX XX | $DA36
    .byte $76 ; | XXX XX | $DA37
    .byte $78 ; | XXXX   | $DA38
LDA39:
    .byte $78 ; | XXXX   | $DA39
    .byte $7A ; | XXXX X | $DA3A
    .byte $7A ; | XXXX X | $DA3B
    .byte $7A ; | XXXX X | $DA3C
    .byte $7A ; | XXXX X | $DA3D
    .byte $78 ; | XXXX   | $DA3E
    .byte $78 ; | XXXX   | $DA3F
    .byte $76 ; | XXX XX | $DA40
    .byte $76 ; | XXX XX | $DA41
    .byte $74 ; | XXX X  | $DA42
    .byte $74 ; | XXX X  | $DA43
LDA44:
    .byte $72 ; | XXX  X | $DA44
    .byte $10 ; |   X    | $DA45
    .byte $10 ; |   X    | $DA46
    .byte $10 ; |   X    | $DA47
    .byte $10 ; |   X    | $DA48
    .byte $10 ; |   X    | $DA49
    .byte $10 ; |   X    | $DA4A
    .byte $10 ; |   X    | $DA4B
    .byte $00 ; |        | $DA4C
    .byte $00 ; |        | $DA4D
    .byte $00 ; |        | $DA4E
LDA4F:
    .byte $00 ; |        | $DA4F
    .byte $00 ; |        | $DA50
    .byte $F0 ; |XXXX    | $DA51
    .byte $F0 ; |XXXX    | $DA52
    .byte $F0 ; |XXXX    | $DA53
    .byte $F0 ; |XXXX    | $DA54
    .byte $F0 ; |XXXX    | $DA55
    .byte $F0 ; |XXXX    | $DA56
    .byte $F0 ; |XXXX    | $DA57
    .byte $F0 ; |XXXX    | $DA58
    .byte $F0 ; |XXXX    | $DA59
    .byte $F0 ; |XXXX    | $DA5A
    .byte $90 ; |X  X    | $DA5B
    .byte $10 ; |   X    | $DA5C
    .byte $F0 ; |XXXX    | $DA5D
LDA5E:
    .byte $F0 ; |XXXX    | $DA5E
    .byte $10 ; |   X    | $DA5F
    .byte $10 ; |   X    | $DA60
    .byte $10 ; |   X    | $DA61
    .byte $F0 ; |XXXX    | $DA62
    .byte $70 ; | XXX    | $DA63
    .byte $10 ; |   X    | $DA64
    .byte $10 ; |   X    | $DA65
    .byte $10 ; |   X    | $DA66
    .byte $10 ; |   X    | $DA67
    .byte $10 ; |   X    | $DA68
    .byte $10 ; |   X    | $DA69
    .byte $10 ; |   X    | $DA6A
    .byte $10 ; |   X    | $DA6B
LDA6C:
    .byte $10 ; |   X    | $DA6C
    .byte $18 ; |   XX   | $DA6D
    .byte $1C ; |   XXX  | $DA6E
    .byte $1E ; |   XXXX | $DA6F
    .byte $1F ; |   XXXXX| $DA70
    .byte $1F ; |   XXXXX| $DA71
    .byte $1F ; |   XXXXX| $DA72
    .byte $1F ; |   XXXXX| $DA73
    .byte $1F ; |   XXXXX| $DA74
    .byte $1F ; |   XXXXX| $DA75
    .byte $1E ; |   XXXX | $DA76
    .byte $1C ; |   XXX  | $DA77
    .byte $18 ; |   XX   | $DA78
    .byte $3C ; |  XXXX  | $DA79
    .byte $66 ; | XX  XX | $DA7A
    .byte $FF ; |XXXXXXXX| $DA7B
    .byte $A5 ; |X X  X X| $DA7C
    .byte $FF ; |XXXXXXXX| $DA7D
    .byte $BD ; |X XXXX X| $DA7E
    .byte $E7 ; |XXX  XXX| $DA7F
    .byte $BD ; |X XXXX X| $DA80
    .byte $FF ; |XXXXXXXX| $DA81
    .byte $A5 ; |X X  X X| $DA82
    .byte $7E ; | XXXXXX | $DA83
    .byte $3C ; |  XXXX  | $DA84
    .byte $18 ; |   XX   | $DA85
    .byte $66 ; | XX  XX | $DA86
    .byte $DB ; |XX XX XX| $DA87
    .byte $A5 ; |X X  X X| $DA88
    .byte $7E ; | XXXXXX | $DA89
    .byte $B5 ; |X XX X X| $DA8A
    .byte $E7 ; |XXX  XXX| $DA8B
    .byte $AD ; |X X XX X| $DA8C
    .byte $7E ; | XXXXXX | $DA8D
    .byte $A5 ; |X X  X X| $DA8E
    .byte $5A ; | X XX X | $DA8F
    .byte $60 ; | XX     | $DA90
    .byte $18 ; |   XX   | $DA91
    .byte $24 ; |  X  X  | $DA92
    .byte $5A ; | X XX X | $DA93
    .byte $A5 ; |X X  X X| $DA94
    .byte $6E ; | XX XXX | $DA95
    .byte $B5 ; |X XX X X| $DA96
    .byte $66 ; | XX  XX | $DA97
    .byte $AD ; |X X XX X| $DA98
    .byte $76 ; | XXX XX | $DA99
    .byte $A5 ; |X X  X X| $DA9A
    .byte $5A ; | X XX X | $DA9B
    .byte $24 ; |  X  X  | $DA9C
    .byte $08 ; |    X   | $DA9D
    .byte $24 ; |  X  X  | $DA9E
    .byte $1A ; |   XX X | $DA9F
    .byte $A5 ; |X X  X X| $DAA0
    .byte $6A ; | XX X X | $DAA1
    .byte $94 ; |X  X X  | $DAA2
    .byte $66 ; | XX  XX | $DAA3
    .byte $29 ; |  X X  X| $DAA4
    .byte $56 ; | X X XX | $DAA5
    .byte $A5 ; |X X  X X| $DAA6
    .byte $58 ; | X XX   | $DAA7
    .byte $24 ; |  X  X  | $DAA8
    .byte $08 ; |    X   | $DAA9
    .byte $20 ; |  X     | $DAAA
    .byte $12 ; |   X  X | $DAAB
    .byte $A5 ; |X X  X X| $DAAC
    .byte $4A ; | X  X X | $DAAD
    .byte $94 ; |X  X X  | $DAAE
    .byte $66 ; | XX  XX | $DAAF
    .byte $29 ; |  X X  X| $DAB0
    .byte $52 ; | X X  X | $DAB1
    .byte $A5 ; |X X  X X| $DAB2
    .byte $08 ; |    X   | $DAB3
    .byte $24 ; |  X  X  | $DAB4
    .byte $08 ; |    X   | $DAB5
    .byte $20 ; |  X     | $DAB6
    .byte $12 ; |   X  X | $DAB7
    .byte $25 ; |  X  X X| $DAB8
    .byte $08 ; |    X   | $DAB9
    .byte $94 ; |X  X X  | $DABA
    .byte $42 ; | X    X | $DABB
    .byte $29 ; |  X X  X| $DABC
    .byte $10 ; |   X    | $DABD
    .byte $A5 ; |X X  X X| $DABE
    .byte $08 ; |    X   | $DABF
    .byte $24 ; |  X  X  | $DAC0
    .byte $08 ; |    X   | $DAC1
    .byte $20 ; |  X     | $DAC2
    .byte $02 ; |      X | $DAC3
    .byte $21 ; |  X    X| $DAC4
    .byte $08 ; |    X   | $DAC5
    .byte $94 ; |X  X X  | $DAC6
    .byte $00 ; |        | $DAC7
    .byte $29 ; |  X X  X| $DAC8
    .byte $00 ; |        | $DAC9
    .byte $25 ; |  X  X X| $DACA
    .byte $00 ; |        | $DACB
    .byte $20 ; |  X     | $DACC
    .byte $08 ; |    X   | $DACD
    .byte $00 ; |        | $DACE
    .byte $00 ; |        | $DACF
    .byte $00 ; |        | $DAD0
    .byte $00 ; |        | $DAD1
    .byte $84 ; |X    X  | $DAD2
    .byte $00 ; |        | $DAD3
    .byte $20 ; |  X     | $DAD4
    .byte $00 ; |        | $DAD5
    .byte $05 ; |     X X| $DAD6
    .byte $00 ; |        | $DAD7
    .byte $20 ; |  X     | $DAD8
    .byte $14 ; |   X X  | $DAD9
    .byte $1C ; |   XXX  | $DADA
    .byte $1C ; |   XXX  | $DADB
    .byte $1C ; |   XXX  | $DADC
    .byte $1C ; |   XXX  | $DADD
    .byte $1E ; |   XXXX | $DADE
    .byte $1C ; |   XXX  | $DADF
    .byte $7E ; | XXXXXX | $DAE0
    .byte $1C ; |   XXX  | $DAE1
    .byte $1C ; |   XXX  | $DAE2
    .byte $00 ; |        | $DAE3
    .byte $08 ; |    X   | $DAE4
    .byte $00 ; |        | $DAE5
    .byte $14 ; |   X X  | $DAE6
    .byte $22 ; |  X   X | $DAE7
    .byte $00 ; |        | $DAE8
    .byte $00 ; |        | $DAE9
    .byte $00 ; |        | $DAEA
    .byte $03 ; |      XX| $DAEB
    .byte $03 ; |      XX| $DAEC
    .byte $22 ; |  X   X | $DAED
    .byte $00 ; |        | $DAEE
    .byte $60 ; | XX     | $DAEF
    .byte $60 ; | XX     | $DAF0
    .byte $1C ; |   XXX  | $DAF1
    .byte $36 ; |  XX XX | $DAF2
    .byte $1C ; |   XXX  | $DAF3
    .byte $08 ; |    X   | $DAF4
    .byte $14 ; |   X X  | $DAF5
    .byte $1C ; |   XXX  | $DAF6
    .byte $1C ; |   XXX  | $DAF7
    .byte $1C ; |   XXX  | $DAF8
    .byte $1C ; |   XXX  | $DAF9
    .byte $1E ; |   XXXX | $DAFA
    .byte $1C ; |   XXX  | $DAFB
    .byte $7E ; | XXXXXX | $DAFC
    .byte $1C ; |   XXX  | $DAFD
    .byte $1C ; |   XXX  | $DAFE
    .byte $00 ; |        | $DAFF
    .byte $08 ; |    X   | $DB00
    .byte $00 ; |        | $DB01
    .byte $14 ; |   X X  | $DB02
    .byte $22 ; |  X   X | $DB03
    .byte $00 ; |        | $DB04
    .byte $00 ; |        | $DB05
    .byte $00 ; |        | $DB06
    .byte $03 ; |      XX| $DB07
    .byte $03 ; |      XX| $DB08
    .byte $22 ; |  X   X | $DB09
    .byte $00 ; |        | $DB0A
    .byte $C0 ; |XX      | $DB0B
    .byte $C0 ; |XX      | $DB0C
    .byte $1C ; |   XXX  | $DB0D
    .byte $36 ; |  XX XX | $DB0E
    .byte $1C ; |   XXX  | $DB0F
    .byte $08 ; |    X   | $DB10
    .byte $E2 ; |XXX   X | $DB11
    .byte $A8 ; |X X X   | $DB12
    .byte $A8 ; |X X X   | $DB13
    .byte $A8 ; |X X X   | $DB14
    .byte $A8 ; |X X X   | $DB15
    .byte $42 ; | X    X | $DB16
    .byte $64 ; | XX  X  | $DB17
    .byte $42 ; | X    X | $DB18
    .byte $64 ; | XX  X  | $DB19
    .byte $EA ; |XXX X X | $DB1A
    .byte $00 ; |        | $DB1B
    .byte $40 ; | X      | $DB1C
    .byte $00 ; |        | $DB1D
    .byte $E2 ; |XXX   X | $DB1E
    .byte $E2 ; |XXX   X | $DB1F
    .byte $00 ; |        | $DB20
    .byte $00 ; |        | $DB21
    .byte $00 ; |        | $DB22
    .byte $26 ; |  X  XX | $DB23
    .byte $EA ; |XXX X X | $DB24
    .byte $64 ; | XX  X  | $DB25
    .byte $00 ; |        | $DB26
    .byte $EA ; |XXX X X | $DB27
    .byte $26 ; |  X  XX | $DB28
    .byte $26 ; |  X  XX | $DB29
    .byte $26 ; |  X  XX | $DB2A
    .byte $26 ; |  X  XX | $DB2B
    .byte $26 ; |  X  XX | $DB2C
    .byte $00 ; |        | $DB2D
    .byte $00 ; |        | $DB2E
    .byte $00 ; |        | $DB2F
    .byte $00 ; |        | $DB30
    .byte $00 ; |        | $DB31
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
    .byte $3C ; |  XXXX  | $DB45
    .byte $7E ; | XXXXXX | $DB46
    .byte $FF ; |XXXXXXXX| $DB47
    .byte $FF ; |XXXXXXXX| $DB48
    .byte $FF ; |XXXXXXXX| $DB49
    .byte $FF ; |XXXXXXXX| $DB4A
    .byte $FF ; |XXXXXXXX| $DB4B
    .byte $FF ; |XXXXXXXX| $DB4C
    .byte $FF ; |XXXXXXXX| $DB4D
    .byte $FF ; |XXXXXXXX| $DB4E
    .byte $7E ; | XXXXXX | $DB4F
    .byte $3C ; |  XXXX  | $DB50
    .byte $00 ; |        | $DB51
    .byte $00 ; |        | $DB52
    .byte $00 ; |        | $DB53
    .byte $00 ; |        | $DB54
    .byte $00 ; |        | $DB55
    .byte $00 ; |        | $DB56
    .byte $00 ; |        | $DB57
    .byte $00 ; |        | $DB58
    .byte $00 ; |        | $DB59
    .byte $00 ; |        | $DB5A
    .byte $00 ; |        | $DB5B
    .byte $00 ; |        | $DB5C
    .byte $00 ; |        | $DB5D
    .byte $00 ; |        | $DB5E
    .byte $00 ; |        | $DB5F
    .byte $00 ; |        | $DB60
    .byte $00 ; |        | $DB61
    .byte $00 ; |        | $DB62
    .byte $00 ; |        | $DB63
    .byte $00 ; |        | $DB64
    .byte $00 ; |        | $DB65
    .byte $00 ; |        | $DB66
    .byte $00 ; |        | $DB67
    .byte $00 ; |        | $DB68
    .byte $12 ; |   X  X | $DB69
    .byte $22 ; |  X   X | $DB6A
    .byte $32 ; |  XX  X | $DB6B
    .byte $32 ; |  XX  X | $DB6C
    .byte $02 ; |      X | $DB6D
    .byte $32 ; |  XX  X | $DB6E
    .byte $32 ; |  XX  X | $DB6F
    .byte $22 ; |  X   X | $DB70
    .byte $12 ; |   X  X | $DB71
    .byte $12 ; |   X  X | $DB72
    .byte $12 ; |   X  X | $DB73
    .byte $22 ; |  X   X | $DB74
    .byte $32 ; |  XX  X | $DB75
    .byte $32 ; |  XX  X | $DB76
    .byte $02 ; |      X | $DB77
    .byte $32 ; |  XX  X | $DB78
    .byte $32 ; |  XX  X | $DB79
    .byte $22 ; |  X   X | $DB7A
    .byte $12 ; |   X  X | $DB7B
    .byte $00 ; |        | $DB7C
    .byte $00 ; |        | $DB7D
    .byte $00 ; |        | $DB7E
    .byte $AA ; |X X X X | $DB7F
    .byte $A8 ; |X X X   | $DB80
    .byte $EA ; |XXX X X | $DB81
    .byte $AA ; |X X X X | $DB82
    .byte $AA ; |X X X X | $DB83
    .byte $00 ; |        | $DB84
    .byte $00 ; |        | $DB85
    .byte $00 ; |        | $DB86
    .byte $00 ; |        | $DB87
    .byte $3C ; |  XXXX  | $DB88
    .byte $18 ; |   XX   | $DB89
    .byte $18 ; |   XX   | $DB8A
    .byte $18 ; |   XX   | $DB8B
    .byte $38 ; |  XXX   | $DB8C
    .byte $18 ; |   XX   | $DB8D
    .byte $00 ; |        | $DB8E
    .byte $00 ; |        | $DB8F
    .byte $00 ; |        | $DB90
    .byte $7E ; | XXXXXX | $DB91
    .byte $30 ; |  XX    | $DB92
    .byte $18 ; |   XX   | $DB93
    .byte $0C ; |    XX  | $DB94
    .byte $66 ; | XX  XX | $DB95
    .byte $3C ; |  XXXX  | $DB96
    .byte $00 ; |        | $DB97
    .byte $00 ; |        | $DB98
    .byte $00 ; |        | $DB99
    .byte $3C ; |  XXXX  | $DB9A
    .byte $66 ; | XX  XX | $DB9B
    .byte $0C ; |    XX  | $DB9C
    .byte $18 ; |   XX   | $DB9D
    .byte $0C ; |    XX  | $DB9E
    .byte $7E ; | XXXXXX | $DB9F
    .byte $00 ; |        | $DBA0
    .byte $00 ; |        | $DBA1
    .byte $00 ; |        | $DBA2
    .byte $06 ; |     XX | $DBA3
    .byte $06 ; |     XX | $DBA4
    .byte $7E ; | XXXXXX | $DBA5
    .byte $66 ; | XX  XX | $DBA6
    .byte $66 ; | XX  XX | $DBA7
    .byte $66 ; | XX  XX | $DBA8
    .byte $00 ; |        | $DBA9
    .byte $00 ; |        | $DBAA
    .byte $00 ; |        | $DBAB
    .byte $3C ; |  XXXX  | $DBAC
    .byte $66 ; | XX  XX | $DBAD
    .byte $06 ; |     XX | $DBAE
    .byte $7C ; | XXXXX  | $DBAF
    .byte $60 ; | XX     | $DBB0
    .byte $7E ; | XXXXXX | $DBB1
    .byte $00 ; |        | $DBB2
    .byte $00 ; |        | $DBB3
    .byte $00 ; |        | $DBB4
    .byte $3C ; |  XXXX  | $DBB5
    .byte $66 ; | XX  XX | $DBB6
    .byte $66 ; | XX  XX | $DBB7
    .byte $7C ; | XXXXX  | $DBB8
    .byte $60 ; | XX     | $DBB9
    .byte $3C ; |  XXXX  | $DBBA
    .byte $00 ; |        | $DBBB
    .byte $00 ; |        | $DBBC
    .byte $00 ; |        | $DBBD
    .byte $30 ; |  XX    | $DBBE
    .byte $30 ; |  XX    | $DBBF
    .byte $18 ; |   XX   | $DBC0
    .byte $0C ; |    XX  | $DBC1
    .byte $06 ; |     XX | $DBC2
    .byte $7E ; | XXXXXX | $DBC3
    .byte $00 ; |        | $DBC4
    .byte $00 ; |        | $DBC5
    .byte $00 ; |        | $DBC6
    .byte $3C ; |  XXXX  | $DBC7
    .byte $66 ; | XX  XX | $DBC8
    .byte $66 ; | XX  XX | $DBC9
    .byte $3C ; |  XXXX  | $DBCA
    .byte $66 ; | XX  XX | $DBCB
    .byte $3C ; |  XXXX  | $DBCC
    .byte $00 ; |        | $DBCD
    .byte $00 ; |        | $DBCE
    .byte $00 ; |        | $DBCF
    .byte $38 ; |  XXX   | $DBD0
    .byte $0C ; |    XX  | $DBD1
    .byte $06 ; |     XX | $DBD2
    .byte $3E ; |  XXXXX | $DBD3
    .byte $66 ; | XX  XX | $DBD4
    .byte $3C ; |  XXXX  | $DBD5
    .byte $00 ; |        | $DBD6
    .byte $00 ; |        | $DBD7
    .byte $00 ; |        | $DBD8
    .byte $E6 ; |XXX  XX | $DBD9
    .byte $49 ; | X  X  X| $DBDA
    .byte $49 ; | X  X  X| $DBDB
    .byte $49 ; | X  X  X| $DBDC
    .byte $C9 ; |XX  X  X| $DBDD
    .byte $46 ; | X   XX | $DBDE
    .byte $00 ; |        | $DBDF
    .byte $00 ; |        | $DBE0
    .byte $00 ; |        | $DBE1
    .byte $77 ; | XXX XXX| $DBE2
    .byte $22 ; |  X   X | $DBE3
    .byte $22 ; |  X   X | $DBE4
    .byte $22 ; |  X   X | $DBE5
    .byte $66 ; | XX  XX | $DBE6
    .byte $22 ; |  X   X | $DBE7
    .byte $00 ; |        | $DBE8
    .byte $00 ; |        | $DBE9
    .byte $00 ; |        | $DBEA
    .byte $EF ; |XXX XXXX| $DBEB
    .byte $44 ; | X   X  | $DBEC
    .byte $42 ; | X    X | $DBED
    .byte $41 ; | X     X| $DBEE
    .byte $C9 ; |XX  X  X| $DBEF
    .byte $46 ; | X   XX | $DBF0
    .byte $00 ; |        | $DBF1
    .byte $00 ; |        | $DBF2
    .byte $00 ; |        | $DBF3
LDBF4:
    .byte $BF ; |X XXXXXX| $DBF4
    .byte $4E ; | X  XXX | $DBF5
    .byte $B8 ; |X XXX   | $DBF6
    .byte $FD ; |XXXXXX X| $DBF7
    .byte $1A ; |   XX X | $DBF8
    .byte $39 ; |  XXX  X| $DBF9
    .byte $74 ; | XXX X  | $DBFA
LDBFB:
    .byte $D1 ; |XX X   X| $DBFB
    .byte $D2 ; |XX X  X | $DBFC
    .byte $D2 ; |XX X  X | $DBFD
    .byte $D2 ; |XX X  X | $DBFE
    .byte $D3 ; |XX X  XX| $DBFF
    .byte $D3 ; |XX X  XX| $DC00
    .byte $D3 ; |XX X  XX| $DC01
    .byte $1A ; |   XX X | $DC02
    .byte $1A ; |   XX X | $DC03
    .byte $1A ; |   XX X | $DC04
    .byte $1A ; |   XX X | $DC05
    .byte $1A ; |   XX X | $DC06
    .byte $1A ; |   XX X | $DC07
LDC08:
    .byte $01 ; |       X| $DC08
    .byte $08 ; |    X   | $DC09
    .byte $04 ; |     X  | $DC0A
    .byte $08 ; |    X   | $DC0B
    .byte $02 ; |      X | $DC0C
    .byte $08 ; |    X   | $DC0D
    .byte $04 ; |     X  | $DC0E
    .byte $08 ; |    X   | $DC0F
    .byte $00 ; |        | $DC10
    .byte $08 ; |    X   | $DC11
    .byte $04 ; |     X  | $DC12
    .byte $08 ; |    X   | $DC13
    .byte $02 ; |      X | $DC14
    .byte $08 ; |    X   | $DC15
    .byte $04 ; |     X  | $DC16
    .byte $08 ; |    X   | $DC17
    .byte $3C ; |  XXXX  | $DC18
    .byte $7E ; | XXXXXX | $DC19
    .byte $FF ; |XXXXXXXX| $DC1A
    .byte $BD ; |X XXXX X| $DC1B
    .byte $BD ; |X XXXX X| $DC1C
    .byte $81 ; |X      X| $DC1D
    .byte $BD ; |X XXXX X| $DC1E
    .byte $DB ; |XX XX XX| $DC1F
    .byte $E7 ; |XXX  XXX| $DC20
    .byte $FF ; |XXXXXXXX| $DC21
    .byte $7E ; | XXXXXX | $DC22
    .byte $3C ; |  XXXX  | $DC23
    .byte $7E ; | XXXXXX | $DC24
    .byte $FF ; |XXXXXXXX| $DC25
    .byte $83 ; |X     XX| $DC26
    .byte $BD ; |X XXXX X| $DC27
    .byte $BD ; |X XXXX X| $DC28
    .byte $83 ; |X     XX| $DC29
    .byte $BD ; |X XXXX X| $DC2A
    .byte $83 ; |X     XX| $DC2B
    .byte $FF ; |XXXXXXXX| $DC2C
    .byte $7E ; | XXXXXX | $DC2D
    .byte $3C ; |  XXXX  | $DC2E
    .byte $7E ; | XXXXXX | $DC2F
    .byte $FF ; |XXXXXXXX| $DC30
    .byte $C3 ; |XX    XX| $DC31
    .byte $BF ; |X XXXXXX| $DC32
    .byte $BF ; |X XXXXXX| $DC33
    .byte $BF ; |X XXXXXX| $DC34
    .byte $BF ; |X XXXXXX| $DC35
    .byte $C3 ; |XX    XX| $DC36
    .byte $FF ; |XXXXXXXX| $DC37
    .byte $7E ; | XXXXXX | $DC38
    .byte $3C ; |  XXXX  | $DC39
    .byte $7E ; | XXXXXX | $DC3A
    .byte $FF ; |XXXXXXXX| $DC3B
    .byte $87 ; |X    XXX| $DC3C
    .byte $BB ; |X XXX XX| $DC3D
    .byte $BD ; |X XXXX X| $DC3E
    .byte $BD ; |X XXXX X| $DC3F
    .byte $BB ; |X XXX XX| $DC40
    .byte $87 ; |X    XXX| $DC41
    .byte $FF ; |XXXXXXXX| $DC42
    .byte $7E ; | XXXXXX | $DC43
    .byte $3C ; |  XXXX  | $DC44
    .byte $7E ; | XXXXXX | $DC45
    .byte $FF ; |XXXXXXXX| $DC46
    .byte $81 ; |X      X| $DC47
    .byte $BF ; |X XXXXXX| $DC48
    .byte $BF ; |X XXXXXX| $DC49
    .byte $87 ; |X    XXX| $DC4A
    .byte $BF ; |X XXXXXX| $DC4B
    .byte $81 ; |X      X| $DC4C
    .byte $FF ; |XXXXXXXX| $DC4D
    .byte $7E ; | XXXXXX | $DC4E
    .byte $3C ; |  XXXX  | $DC4F
    .byte $7E ; | XXXXXX | $DC50
    .byte $FF ; |XXXXXXXX| $DC51
    .byte $DF ; |XX XXXXX| $DC52
    .byte $DF ; |XX XXXXX| $DC53
    .byte $DF ; |XX XXXXX| $DC54
    .byte $C7 ; |XX   XXX| $DC55
    .byte $DF ; |XX XXXXX| $DC56
    .byte $C1 ; |XX     X| $DC57
    .byte $FF ; |XXXXXXXX| $DC58
    .byte $7E ; | XXXXXX | $DC59
    .byte $3C ; |  XXXX  | $DC5A
    .byte $7E ; | XXXXXX | $DC5B
    .byte $FF ; |XXXXXXXX| $DC5C
    .byte $C1 ; |XX     X| $DC5D
    .byte $BD ; |X XXXX X| $DC5E
    .byte $B1 ; |X XX   X| $DC5F
    .byte $BF ; |X XXXXXX| $DC60
    .byte $BD ; |X XXXX X| $DC61
    .byte $C3 ; |XX    XX| $DC62
    .byte $FF ; |XXXXXXXX| $DC63
    .byte $7E ; | XXXXXX | $DC64
    .byte $3C ; |  XXXX  | $DC65
    .byte $7E ; | XXXXXX | $DC66
    .byte $FF ; |XXXXXXXX| $DC67
    .byte $BD ; |X XXXX X| $DC68
    .byte $BD ; |X XXXX X| $DC69
    .byte $BD ; |X XXXX X| $DC6A
    .byte $81 ; |X      X| $DC6B
    .byte $BD ; |X XXXX X| $DC6C
    .byte $BD ; |X XXXX X| $DC6D
    .byte $FF ; |XXXXXXXX| $DC6E
    .byte $7E ; | XXXXXX | $DC6F
    .byte $3C ; |  XXXX  | $DC70
    .byte $7E ; | XXXXXX | $DC71
    .byte $FF ; |XXXXXXXX| $DC72
    .byte $E3 ; |XXX   XX| $DC73
    .byte $F7 ; |XXXX XXX| $DC74
    .byte $F7 ; |XXXX XXX| $DC75
    .byte $F7 ; |XXXX XXX| $DC76
    .byte $F7 ; |XXXX XXX| $DC77
    .byte $E3 ; |XXX   XX| $DC78
    .byte $FF ; |XXXXXXXX| $DC79
    .byte $7E ; | XXXXXX | $DC7A
    .byte $3C ; |  XXXX  | $DC7B
    .byte $7E ; | XXXXXX | $DC7C
    .byte $FF ; |XXXXXXXX| $DC7D
    .byte $C7 ; |XX   XXX| $DC7E
    .byte $BB ; |X XXX XX| $DC7F
    .byte $FB ; |XXXXX XX| $DC80
    .byte $FB ; |XXXXX XX| $DC81
    .byte $FB ; |XXXXX XX| $DC82
    .byte $FB ; |XXXXX XX| $DC83
    .byte $FF ; |XXXXXXXX| $DC84
    .byte $7E ; | XXXXXX | $DC85
    .byte $3C ; |  XXXX  | $DC86
    .byte $7E ; | XXXXXX | $DC87
    .byte $FF ; |XXXXXXXX| $DC88
    .byte $BD ; |X XXXX X| $DC89
    .byte $BB ; |X XXX XX| $DC8A
    .byte $B7 ; |X XX XXX| $DC8B
    .byte $8F ; |X   XXXX| $DC8C
    .byte $B7 ; |X XX XXX| $DC8D
    .byte $BB ; |X XXX XX| $DC8E
    .byte $FF ; |XXXXXXXX| $DC8F
    .byte $7E ; | XXXXXX | $DC90
    .byte $3C ; |  XXXX  | $DC91
    .byte $7E ; | XXXXXX | $DC92
    .byte $FF ; |XXXXXXXX| $DC93
    .byte $C3 ; |XX    XX| $DC94
    .byte $DF ; |XX XXXXX| $DC95
    .byte $DF ; |XX XXXXX| $DC96
    .byte $DF ; |XX XXXXX| $DC97
    .byte $DF ; |XX XXXXX| $DC98
    .byte $DF ; |XX XXXXX| $DC99
    .byte $FF ; |XXXXXXXX| $DC9A
    .byte $7E ; | XXXXXX | $DC9B
    .byte $3C ; |  XXXX  | $DC9C
    .byte $7E ; | XXXXXX | $DC9D
    .byte $FF ; |XXXXXXXX| $DC9E
    .byte $BB ; |X XXX XX| $DC9F
    .byte $BB ; |X XXX XX| $DCA0
    .byte $BB ; |X XXX XX| $DCA1
    .byte $AB ; |X X X XX| $DCA2
    .byte $93 ; |X  X  XX| $DCA3
    .byte $BB ; |X XXX XX| $DCA4
    .byte $FF ; |XXXXXXXX| $DCA5
    .byte $7E ; | XXXXXX | $DCA6
LDCA7:
    .byte $3C ; |  XXXX  | $DCA7
    .byte $76 ; | XXX XX | $DCA8
    .byte $72 ; | XXX  X | $DCA9
    .byte $74 ; | XXX X  | $DCAA
    .byte $76 ; | XXX XX | $DCAB
    .byte $78 ; | XXXX   | $DCAC
    .byte $7A ; | XXXX X | $DCAD
    .byte $7A ; | XXXX X | $DCAE
    .byte $7A ; | XXXX X | $DCAF
    .byte $7A ; | XXXX X | $DCB0
    .byte $7A ; | XXXX X | $DCB1
    .byte $7A ; | XXXX X | $DCB2
    .byte $7A ; | XXXX X | $DCB3
    .byte $7A ; | XXXX X | $DCB4
    .byte $78 ; | XXXX   | $DCB5
    .byte $76 ; | XXX XX | $DCB6
    .byte $74 ; | XXX X  | $DCB7
LDCB8:
    .byte $72 ; | XXX  X | $DCB8
    .byte $76 ; | XXX XX | $DCB9
    .byte $07 ; |     XXX| $DCBA
    .byte $57 ; | X X XXX| $DCBB
    .byte $12 ; |   X  X | $DCBC
    .byte $42 ; | X    X | $DCBD
    .byte $12 ; |   X  X | $DCBE
    .byte $52 ; | X X  X | $DCBF
    .byte $22 ; |  X   X | $DCC0
    .byte $42 ; | X    X | $DCC1
    .byte $E0 ; |XXX     | $DCC2
    .byte $E0 ; |XXX     | $DCC3
    .byte $10 ; |   X    | $DCC4
    .byte $30 ; |  XX    | $DCC5
    .byte $E0 ; |XXX     | $DCC6
    .byte $E0 ; |XXX     | $DCC7
    .byte $10 ; |   X    | $DCC8
    .byte $30 ; |  XX    | $DCC9
    .byte $E2 ; |XXX   X | $DCCA
    .byte $E2 ; |XXX   X | $DCCB
    .byte $15 ; |   X X X| $DCCC
    .byte $35 ; |  XX X X| $DCCD
    .byte $32 ; |  XX  X | $DCCE
    .byte $02 ; |      X | $DCCF
    .byte $52 ; | X X  X | $DCD0
    .byte $12 ; |   X  X | $DCD1
    .byte $62 ; | XX   X | $DCD2
    .byte $32 ; |  XX  X | $DCD3
    .byte $E4 ; |XXX  X  | $DCD4
    .byte $E4 ; |XXX  X  | $DCD5
    .byte $15 ; |   X X X| $DCD6
    .byte $35 ; |  XX X X| $DCD7
    .byte $22 ; |  X   X | $DCD8
    .byte $42 ; | X    X | $DCD9
    .byte $32 ; |  XX  X | $DCDA
    .byte $52 ; | X X  X | $DCDB
    .byte $22 ; |  X   X | $DCDC
    .byte $42 ; | X    X | $DCDD
    .byte $E0 ; |XXX     | $DCDE
    .byte $E0 ; |XXX     | $DCDF
    .byte $10 ; |   X    | $DCE0
    .byte $30 ; |  XX    | $DCE1
    .byte $E0 ; |XXX     | $DCE2
    .byte $E0 ; |XXX     | $DCE3
    .byte $10 ; |   X    | $DCE4
    .byte $30 ; |  XX    | $DCE5
    .byte $E2 ; |XXX   X | $DCE6
    .byte $E2 ; |XXX   X | $DCE7
    .byte $15 ; |   X X X| $DCE8
    .byte $35 ; |  XX X X| $DCE9
    .byte $32 ; |  XX  X | $DCEA
    .byte $02 ; |      X | $DCEB
    .byte $52 ; | X X  X | $DCEC
    .byte $12 ; |   X  X | $DCED
    .byte $62 ; | XX   X | $DCEE
    .byte $32 ; |  XX  X | $DCEF
LDCF0:
    .byte $0B ; |    X XX| $DCF0
    .byte $0F ; |    XXXX| $DCF1
    .byte $11 ; |   X   X| $DCF2
    .byte $12 ; |   X  X | $DCF3
    .byte $14 ; |   X X  | $DCF4
    .byte $17 ; |   X XXX| $DCF5
    .byte $1F ; |   XXXXX| $DCF6
LDCF7:
    .byte $04 ; |     X  | $DCF7
    .byte $07 ; |     XXX| $DCF8
    .byte $0D ; |    XX X| $DCF9
    .byte $13 ; |   X  XX| $DCFA
    .byte $19 ; |   XX  X| $DCFB
    .byte $25 ; |  X  X X| $DCFC
    .byte $31 ; |  XX   X| $DCFD
    .byte $36 ; |  XX XX | $DCFE
LDCFF:
    .byte $11 ; |   X   X| $DCFF
    .byte $1F ; |   XXXXX| $DD00
    .byte $02 ; |      X | $DD01
    .byte $02 ; |      X | $DD02
LDD03:
    .byte $DB ; |XX XX XX| $DD03
    .byte $DB ; |XX XX XX| $DD04
    .byte $DC ; |XX XXX  | $DD05
LDD06:
    .byte $DC ; |XX XXX  | $DD06
    .byte $6C ; | XX XX  | $DD07
    .byte $B8 ; |X XXX   | $DD08
    .byte $F4 ; |XXXX X  | $DD09
    .byte $82 ; |X     X | $DD0A
    .byte $D9 ; |XX XX  X| $DD0B
    .byte $F5 ; |XXXX X X| $DD0C
    .byte $51 ; | X X   X| $DD0D
    .byte $DA ; |XX XX X | $DD0E
    .byte $DA ; |XX XX X | $DD0F
    .byte $DB ; |XX XX XX| $DD10
    .byte $E7 ; |XXX  XXX| $DD11
    .byte $03 ; |      XX| $DD12
    .byte $51 ; | X X   X| $DD13
    .byte $DA ; |XX XX X | $DD14
    .byte $DB ; |XX XX XX| $DD15
    .byte $DB ; |XX XX XX| $DD16
    .byte $00 ; |        | $DD17
    .byte $3C ; |  XXXX  | $DD18
    .byte $7E ; | XXXXXX | $DD19
    .byte $FF ; |XXXXXXXX| $DD1A
    .byte $BD ; |X XXXX X| $DD1B
    .byte $B9 ; |X XXX  X| $DD1C
    .byte $B5 ; |X XX X X| $DD1D
    .byte $AD ; |X X XX X| $DD1E
    .byte $9D ; |X  XXX X| $DD1F
    .byte $BD ; |X XXXX X| $DD20
    .byte $FF ; |XXXXXXXX| $DD21
    .byte $7E ; | XXXXXX | $DD22
    .byte $3C ; |  XXXX  | $DD23
    .byte $7E ; | XXXXXX | $DD24
    .byte $FF ; |XXXXXXXX| $DD25
    .byte $C3 ; |XX    XX| $DD26
    .byte $BD ; |X XXXX X| $DD27
    .byte $BD ; |X XXXX X| $DD28
    .byte $BD ; |X XXXX X| $DD29
    .byte $BD ; |X XXXX X| $DD2A
    .byte $C3 ; |XX    XX| $DD2B
    .byte $FF ; |XXXXXXXX| $DD2C
    .byte $7E ; | XXXXXX | $DD2D
    .byte $3C ; |  XXXX  | $DD2E
    .byte $7E ; | XXXXXX | $DD2F
    .byte $FF ; |XXXXXXXX| $DD30
    .byte $DF ; |XX XXXXX| $DD31
    .byte $DF ; |XX XXXXX| $DD32
    .byte $C3 ; |XX    XX| $DD33
    .byte $DD ; |XX XXX X| $DD34
    .byte $DD ; |XX XXX X| $DD35
    .byte $C3 ; |XX    XX| $DD36
    .byte $FF ; |XXXXXXXX| $DD37
    .byte $7E ; | XXXXXX | $DD38
    .byte $3C ; |  XXXX  | $DD39
    .byte $7E ; | XXXXXX | $DD3A
    .byte $FF ; |XXXXXXXX| $DD3B
    .byte $C5 ; |XX   X X| $DD3C
    .byte $BB ; |X XXX XX| $DD3D
    .byte $B5 ; |X XX X X| $DD3E
    .byte $BD ; |X XXXX X| $DD3F
    .byte $BD ; |X XXXX X| $DD40
    .byte $C3 ; |XX    XX| $DD41
    .byte $FF ; |XXXXXXXX| $DD42
    .byte $7E ; | XXXXXX | $DD43
    .byte $3C ; |  XXXX  | $DD44
    .byte $7E ; | XXXXXX | $DD45
    .byte $FF ; |XXXXXXXX| $DD46
    .byte $BD ; |X XXXX X| $DD47
    .byte $BB ; |X XXX XX| $DD48
    .byte $B7 ; |X XX XXX| $DD49
    .byte $83 ; |X     XX| $DD4A
    .byte $BD ; |X XXXX X| $DD4B
    .byte $83 ; |X     XX| $DD4C
    .byte $FF ; |XXXXXXXX| $DD4D
    .byte $7E ; | XXXXXX | $DD4E
    .byte $3C ; |  XXXX  | $DD4F
    .byte $7E ; | XXXXXX | $DD50
    .byte $FF ; |XXXXXXXX| $DD51
    .byte $C3 ; |XX    XX| $DD52
    .byte $FD ; |XXXXXX X| $DD53
    .byte $FD ; |XXXXXX X| $DD54
    .byte $C3 ; |XX    XX| $DD55
    .byte $BF ; |X XXXXXX| $DD56
    .byte $C3 ; |XX    XX| $DD57
    .byte $FF ; |XXXXXXXX| $DD58
    .byte $7E ; | XXXXXX | $DD59
    .byte $3C ; |  XXXX  | $DD5A
    .byte $7E ; | XXXXXX | $DD5B
    .byte $FF ; |XXXXXXXX| $DD5C
    .byte $EF ; |XXX XXXX| $DD5D
    .byte $EF ; |XXX XXXX| $DD5E
    .byte $EF ; |XXX XXXX| $DD5F
    .byte $EF ; |XXX XXXX| $DD60
    .byte $EF ; |XXX XXXX| $DD61
    .byte $83 ; |X     XX| $DD62
    .byte $FF ; |XXXXXXXX| $DD63
    .byte $7E ; | XXXXXX | $DD64
    .byte $3C ; |  XXXX  | $DD65
    .byte $7E ; | XXXXXX | $DD66
    .byte $FF ; |XXXXXXXX| $DD67
    .byte $C3 ; |XX    XX| $DD68
    .byte $BD ; |X XXXX X| $DD69
    .byte $BD ; |X XXXX X| $DD6A
    .byte $BD ; |X XXXX X| $DD6B
    .byte $BD ; |X XXXX X| $DD6C
    .byte $BD ; |X XXXX X| $DD6D
    .byte $FF ; |XXXXXXXX| $DD6E
    .byte $7E ; | XXXXXX | $DD6F
    .byte $3C ; |  XXXX  | $DD70
    .byte $7E ; | XXXXXX | $DD71
    .byte $FF ; |XXXXXXXX| $DD72
    .byte $EF ; |XXX XXXX| $DD73
    .byte $D7 ; |XX X XXX| $DD74
    .byte $BB ; |X XXX XX| $DD75
    .byte $BB ; |X XXX XX| $DD76
    .byte $BB ; |X XXX XX| $DD77
    .byte $BB ; |X XXX XX| $DD78
    .byte $FF ; |XXXXXXXX| $DD79
    .byte $7E ; | XXXXXX | $DD7A
    .byte $3C ; |  XXXX  | $DD7B
    .byte $7E ; | XXXXXX | $DD7C
    .byte $FF ; |XXXXXXXX| $DD7D
    .byte $BB ; |X XXX XX| $DD7E
    .byte $93 ; |X  X  XX| $DD7F
    .byte $AB ; |X X X XX| $DD80
    .byte $BB ; |X XXX XX| $DD81
    .byte $BB ; |X XXX XX| $DD82
    .byte $BB ; |X XXX XX| $DD83
    .byte $FF ; |XXXXXXXX| $DD84
    .byte $7E ; | XXXXXX | $DD85
    .byte $3C ; |  XXXX  | $DD86
    .byte $7E ; | XXXXXX | $DD87
    .byte $FF ; |XXXXXXXX| $DD88
    .byte $BD ; |X XXXX X| $DD89
    .byte $BD ; |X XXXX X| $DD8A
    .byte $DB ; |XX XX XX| $DD8B
    .byte $E7 ; |XXX  XXX| $DD8C
    .byte $DB ; |XX XX XX| $DD8D
    .byte $BD ; |X XXXX X| $DD8E
    .byte $FF ; |XXXXXXXX| $DD8F
    .byte $7E ; | XXXXXX | $DD90
    .byte $3C ; |  XXXX  | $DD91
    .byte $7E ; | XXXXXX | $DD92
    .byte $FF ; |XXXXXXXX| $DD93
    .byte $EF ; |XXX XXXX| $DD94
    .byte $EF ; |XXX XXXX| $DD95
    .byte $EF ; |XXX XXXX| $DD96
    .byte $EF ; |XXX XXXX| $DD97
    .byte $D7 ; |XX X XXX| $DD98
    .byte $BB ; |X XXX XX| $DD99
    .byte $FF ; |XXXXXXXX| $DD9A
    .byte $7E ; | XXXXXX | $DD9B
    .byte $3C ; |  XXXX  | $DD9C
    .byte $7E ; | XXXXXX | $DD9D
    .byte $FF ; |XXXXXXXX| $DD9E
    .byte $81 ; |X      X| $DD9F
    .byte $DF ; |XX XXXXX| $DDA0
    .byte $EF ; |XXX XXXX| $DDA1
    .byte $F7 ; |XXXX XXX| $DDA2
    .byte $FB ; |XXXXX XX| $DDA3
    .byte $81 ; |X      X| $DDA4
    .byte $FF ; |XXXXXXXX| $DDA5
    .byte $7E ; | XXXXXX | $DDA6
    .byte $3C ; |  XXXX  | $DDA7
    .byte $08 ; |    X   | $DDA8
    .byte $F8 ; |XXXXX   | $DDA9
    .byte $E6 ; |XXX  XX | $DDAA
    .byte $04 ; |     X  | $DDAB
    .byte $02 ; |      X | $DDAC
    .byte $0E ; |    XXX | $DDAD
    .byte $02 ; |      X | $DDAE
    .byte $24 ; |  X  X  | $DDAF
    .byte $16 ; |   X XX | $DDB0
    .byte $08 ; |    X   | $DDB1
    .byte $06 ; |     XX | $DDB2
    .byte $F8 ; |XXXXX   | $DDB3
    .byte $E6 ; |XXX  XX | $DDB4
    .byte $04 ; |     X  | $DDB5
    .byte $12 ; |   X  X | $DDB6
    .byte $FE ; |XXXXXXX | $DDB7
    .byte $02 ; |      X | $DDB8
    .byte $24 ; |  X  X  | $DDB9
    .byte $16 ; |   X XX | $DDBA
    .byte $08 ; |    X   | $DDBB
    .byte $04 ; |     X  | $DDBC
    .byte $F8 ; |XXXXX   | $DDBD
    .byte $E6 ; |XXX  XX | $DDBE
    .byte $04 ; |     X  | $DDBF
    .byte $22 ; |  X   X | $DDC0
    .byte $EE ; |XXX XXX | $DDC1
    .byte $02 ; |      X | $DDC2
    .byte $24 ; |  X  X  | $DDC3
    .byte $16 ; |   X XX | $DDC4
    .byte $08 ; |    X   | $DDC5
    .byte $02 ; |      X | $DDC6
    .byte $F8 ; |XXXXX   | $DDC7
    .byte $E6 ; |XXX  XX | $DDC8
    .byte $04 ; |     X  | $DDC9
    .byte $32 ; |  XX  X | $DDCA
    .byte $DE ; |XX XXXX | $DDCB
    .byte $02 ; |      X | $DDCC
    .byte $24 ; |  X  X  | $DDCD
    .byte $16 ; |   X XX | $DDCE
    .byte $08 ; |    X   | $DDCF
    .byte $00 ; |        | $DDD0
    .byte $F8 ; |XXXXX   | $DDD1
    .byte $E6 ; |XXX  XX | $DDD2
    .byte $04 ; |     X  | $DDD3
    .byte $42 ; | X    X | $DDD4
    .byte $CE ; |XX  XXX | $DDD5
    .byte $02 ; |      X | $DDD6
    .byte $24 ; |  X  X  | $DDD7
    .byte $16 ; |   X XX | $DDD8
    .byte $08 ; |    X   | $DDD9
    .byte $02 ; |      X | $DDDA
    .byte $F8 ; |XXXXX   | $DDDB
    .byte $E6 ; |XXX  XX | $DDDC
    .byte $04 ; |     X  | $DDDD
    .byte $52 ; | X X  X | $DDDE
    .byte $BE ; |X XXXXX | $DDDF
    .byte $02 ; |      X | $DDE0
    .byte $24 ; |  X  X  | $DDE1
    .byte $16 ; |   X XX | $DDE2
    .byte $08 ; |    X   | $DDE3
    .byte $04 ; |     X  | $DDE4
    .byte $F8 ; |XXXXX   | $DDE5
    .byte $E6 ; |XXX  XX | $DDE6
    .byte $04 ; |     X  | $DDE7
    .byte $62 ; | XX   X | $DDE8
    .byte $AE ; |X X XXX | $DDE9
    .byte $02 ; |      X | $DDEA
    .byte $24 ; |  X  X  | $DDEB
    .byte $16 ; |   X XX | $DDEC
    .byte $08 ; |    X   | $DDED
    .byte $06 ; |     XX | $DDEE
    .byte $F8 ; |XXXXX   | $DDEF
    .byte $E6 ; |XXX  XX | $DDF0
    .byte $04 ; |     X  | $DDF1
    .byte $72 ; | XXX  X | $DDF2
    .byte $9E ; |X  XXXX | $DDF3
    .byte $02 ; |      X | $DDF4
    .byte $24 ; |  X  X  | $DDF5
    .byte $16 ; |   X XX | $DDF6
    .byte $08 ; |    X   | $DDF7
LDDF8:
    .byte $D9 ; |XX XX  X| $DDF8
    .byte $E7 ; |XXX  XXX| $DDF9
    .byte $F5 ; |XXXX X X| $DDFA
    .byte $03 ; |      XX| $DDFB
    .byte $51 ; | X X   X| $DDFC
    .byte $51 ; | X X   X| $DDFD
    .byte $88 ; |X   X   | $DDFE
    .byte $88 ; |X   X   | $DDFF
    .byte $91 ; |X  X   X| $DE00
    .byte $91 ; |X  X   X| $DE01
    .byte $9A ; |X  XX X | $DE02
    .byte $9A ; |X  XX X | $DE03
LDE04:
    .byte $DA ; |XX XX X | $DE04
    .byte $DA ; |XX XX X | $DE05
    .byte $DA ; |XX XX X | $DE06
    .byte $DB ; |XX XX XX| $DE07
    .byte $DB ; |XX XX XX| $DE08
    .byte $DB ; |XX XX XX| $DE09
    .byte $DB ; |XX XX XX| $DE0A
    .byte $DB ; |XX XX XX| $DE0B
    .byte $DB ; |XX XX XX| $DE0C
    .byte $DB ; |XX XX XX| $DE0D
    .byte $DB ; |XX XX XX| $DE0E
    .byte $DB ; |XX XX XX| $DE0F
    .byte $00 ; |        | $DE10
    .byte $00 ; |        | $DE11
    .byte $00 ; |        | $DE12
    .byte $00 ; |        | $DE13
    .byte $00 ; |        | $DE14
    .byte $00 ; |        | $DE15
    .byte $00 ; |        | $DE16
    .byte $00 ; |        | $DE17
    .byte $3C ; |  XXXX  | $DE18
    .byte $7E ; | XXXXXX | $DE19
    .byte $FF ; |XXXXXXXX| $DE1A
    .byte $CB ; |XX  X XX| $DE1B
    .byte $B3 ; |X XX  XX| $DE1C
    .byte $BB ; |X XXX XX| $DE1D
    .byte $B3 ; |X XX  XX| $DE1E
    .byte $CB ; |XX  X XX| $DE1F
    .byte $FF ; |XXXXXXXX| $DE20
    .byte $FF ; |XXXXXXXX| $DE21
    .byte $7E ; | XXXXXX | $DE22
    .byte $3C ; |  XXXX  | $DE23
    .byte $7E ; | XXXXXX | $DE24
    .byte $FF ; |XXXXXXXX| $DE25
    .byte $D3 ; |XX X  XX| $DE26
    .byte $CD ; |XX  XX X| $DE27
    .byte $DD ; |XX XXX X| $DE28
    .byte $CD ; |XX  XX X| $DE29
    .byte $D3 ; |XX X  XX| $DE2A
    .byte $DF ; |XX XXXXX| $DE2B
    .byte $DF ; |XX XXXXX| $DE2C
    .byte $7E ; | XXXXXX | $DE2D
    .byte $3C ; |  XXXX  | $DE2E
    .byte $7E ; | XXXXXX | $DE2F
    .byte $FF ; |XXXXXXXX| $DE30
    .byte $E3 ; |XXX   XX| $DE31
    .byte $DF ; |XX XXXXX| $DE32
    .byte $DF ; |XX XXXXX| $DE33
    .byte $DF ; |XX XXXXX| $DE34
    .byte $E3 ; |XXX   XX| $DE35
    .byte $FF ; |XXXXXXXX| $DE36
    .byte $FF ; |XXXXXXXX| $DE37
    .byte $7E ; | XXXXXX | $DE38
    .byte $3C ; |  XXXX  | $DE39
    .byte $7E ; | XXXXXX | $DE3A
    .byte $FF ; |XXXXXXXX| $DE3B
    .byte $CB ; |XX  X XX| $DE3C
    .byte $B3 ; |X XX  XX| $DE3D
    .byte $BB ; |X XXX XX| $DE3E
    .byte $B3 ; |X XX  XX| $DE3F
    .byte $CB ; |XX  X XX| $DE40
    .byte $FB ; |XXXXX XX| $DE41
    .byte $FB ; |XXXXX XX| $DE42
    .byte $7E ; | XXXXXX | $DE43
    .byte $3C ; |  XXXX  | $DE44
    .byte $7E ; | XXXXXX | $DE45
    .byte $FF ; |XXXXXXXX| $DE46
    .byte $E1 ; |XXX    X| $DE47
    .byte $DF ; |XX XXXXX| $DE48
    .byte $C3 ; |XX    XX| $DE49
    .byte $DD ; |XX XXX X| $DE4A
    .byte $E3 ; |XXX   XX| $DE4B
    .byte $FF ; |XXXXXXXX| $DE4C
    .byte $FF ; |XXXXXXXX| $DE4D
    .byte $7E ; | XXXXXX | $DE4E
    .byte $3C ; |  XXXX  | $DE4F
    .byte $7E ; | XXXXXX | $DE50
    .byte $FF ; |XXXXXXXX| $DE51
    .byte $EF ; |XXX XXXX| $DE52
    .byte $EF ; |XXX XXXX| $DE53
    .byte $EF ; |XXX XXXX| $DE54
    .byte $C3 ; |XX    XX| $DE55
    .byte $EF ; |XXX XXXX| $DE56
    .byte $F3 ; |XXXX  XX| $DE57
    .byte $FF ; |XXXXXXXX| $DE58
    .byte $7E ; | XXXXXX | $DE59
    .byte $3C ; |  XXXX  | $DE5A
    .byte $7E ; | XXXXXX | $DE5B
    .byte $C3 ; |XX    XX| $DE5C
    .byte $FD ; |XXXXXX X| $DE5D
    .byte $E5 ; |XXX  X X| $DE5E
    .byte $D9 ; |XX XX  X| $DE5F
    .byte $DD ; |XX XXX X| $DE60
    .byte $D9 ; |XX XX  X| $DE61
    .byte $E5 ; |XXX  X X| $DE62
    .byte $FF ; |XXXXXXXX| $DE63
    .byte $7E ; | XXXXXX | $DE64
    .byte $3C ; |  XXXX  | $DE65
    .byte $7E ; | XXXXXX | $DE66
    .byte $FF ; |XXXXXXXX| $DE67
    .byte $DD ; |XX XXX X| $DE68
    .byte $DD ; |XX XXX X| $DE69
    .byte $CD ; |XX  XX X| $DE6A
    .byte $D3 ; |XX X  XX| $DE6B
    .byte $DF ; |XX XXXXX| $DE6C
    .byte $DF ; |XX XXXXX| $DE6D
    .byte $FF ; |XXXXXXXX| $DE6E
    .byte $7E ; | XXXXXX | $DE6F
    .byte $3C ; |  XXXX  | $DE70
    .byte $7E ; | XXXXXX | $DE71
    .byte $FF ; |XXXXXXXX| $DE72
    .byte $F7 ; |XXXX XXX| $DE73
    .byte $F7 ; |XXXX XXX| $DE74
    .byte $F7 ; |XXXX XXX| $DE75
    .byte $F7 ; |XXXX XXX| $DE76
    .byte $FF ; |XXXXXXXX| $DE77
    .byte $F7 ; |XXXX XXX| $DE78
    .byte $FF ; |XXXXXXXX| $DE79
    .byte $7E ; | XXXXXX | $DE7A
    .byte $3C ; |  XXXX  | $DE7B
    .byte $7E ; | XXXXXX | $DE7C
    .byte $E7 ; |XXX  XXX| $DE7D
    .byte $DB ; |XX XX XX| $DE7E
    .byte $FB ; |XXXXX XX| $DE7F
    .byte $FB ; |XXXXX XX| $DE80
    .byte $FB ; |XXXXX XX| $DE81
    .byte $FF ; |XXXXXXXX| $DE82
    .byte $FB ; |XXXXX XX| $DE83
    .byte $FF ; |XXXXXXXX| $DE84
    .byte $7E ; | XXXXXX | $DE85
    .byte $3C ; |  XXXX  | $DE86
    .byte $7E ; | XXXXXX | $DE87
    .byte $FF ; |XXXXXXXX| $DE88
    .byte $DD ; |XX XXX X| $DE89
    .byte $CB ; |XX  X XX| $DE8A
    .byte $D7 ; |XX X XXX| $DE8B
    .byte $DB ; |XX XX XX| $DE8C
    .byte $DF ; |XX XXXXX| $DE8D
    .byte $DF ; |XX XXXXX| $DE8E
    .byte $FF ; |XXXXXXXX| $DE8F
    .byte $7E ; | XXXXXX | $DE90
    .byte $3C ; |  XXXX  | $DE91
    .byte $7E ; | XXXXXX | $DE92
    .byte $FF ; |XXXXXXXX| $DE93
    .byte $F7 ; |XXXX XXX| $DE94
    .byte $F7 ; |XXXX XXX| $DE95
    .byte $F7 ; |XXXX XXX| $DE96
    .byte $F7 ; |XXXX XXX| $DE97
    .byte $F7 ; |XXXX XXX| $DE98
    .byte $F7 ; |XXXX XXX| $DE99
    .byte $F7 ; |XXXX XXX| $DE9A
    .byte $7E ; | XXXXXX | $DE9B
    .byte $3C ; |  XXXX  | $DE9C
    .byte $7E ; | XXXXXX | $DE9D
    .byte $FF ; |XXXXXXXX| $DE9E
    .byte $DD ; |XX XXX X| $DE9F
    .byte $D5 ; |XX X X X| $DEA0
    .byte $D5 ; |XX X X X| $DEA1
    .byte $C1 ; |XX     X| $DEA2
    .byte $EB ; |XXX X XX| $DEA3
    .byte $FF ; |XXXXXXXX| $DEA4
    .byte $FF ; |XXXXXXXX| $DEA5
    .byte $7E ; | XXXXXX | $DEA6
LDEA7:
    .byte $3C ; |  XXXX  | $DEA7
    .byte $78 ; | XXXX   | $DEA8
    .byte $84 ; |X    X  | $DEA9
    .byte $B4 ; |X XX X  | $DEAA
    .byte $A4 ; |X X  X  | $DEAB
    .byte $B4 ; |X XX X  | $DEAC
    .byte $84 ; |X    X  | $DEAD
    .byte $78 ; | XXXX   | $DEAE
LDEAF:
    .byte $55 ; | X X X X| $DEAF
    .byte $55 ; | X X X X| $DEB0
    .byte $55 ; | X X X X| $DEB1
    .byte $75 ; | XXX X X| $DEB2
    .byte $55 ; | X X X X| $DEB3
    .byte $55 ; | X X X X| $DEB4
    .byte $2E ; |  X XXX | $DEB5
LDEB6:
    .byte $55 ; | X X X X| $DEB6
    .byte $55 ; | X X X X| $DEB7
    .byte $55 ; | X X X X| $DEB8
    .byte $D9 ; |XX XX  X| $DEB9
    .byte $55 ; | X X X X| $DEBA
    .byte $55 ; | X X X X| $DEBB
    .byte $99 ; |X  XX  X| $DEBC
LDEBD:
    .byte $31 ; |  XX   X| $DEBD
    .byte $4A ; | X  X X | $DEBE
    .byte $42 ; | X    X | $DEBF
    .byte $42 ; | X    X | $DEC0
    .byte $42 ; | X    X | $DEC1
    .byte $4A ; | X  X X | $DEC2
    .byte $31 ; |  XX   X| $DEC3
LDEC4:
    .byte $8A ; |X   X X | $DEC4
    .byte $55 ; | X X X X| $DEC5
    .byte $15 ; |   X X X| $DEC6
    .byte $15 ; |   X X X| $DEC7
    .byte $11 ; |   X   X| $DEC8
    .byte $51 ; | X X   X| $DEC9
LDECA:
    .byte $91 ; |X  X   X| $DECA
    .byte $12 ; |   X  X | $DECB
    .byte $15 ; |   X X X| $DECC
    .byte $11 ; |   X   X| $DECD
    .byte $13 ; |   X  XX| $DECE
    .byte $15 ; |   X X X| $DECF
    .byte $35 ; |  XX X X| $DED0
LDED1:
    .byte $12 ; |   X  X | $DED1
    .byte $22 ; |  X   X | $DED2
    .byte $55 ; | X X X X| $DED3
    .byte $51 ; | X X   X| $DED4
    .byte $22 ; |  X   X | $DED5
    .byte $51 ; | X X   X| $DED6
    .byte $55 ; | X X X X| $DED7
    .byte $22 ; |  X   X | $DED8
    .byte $FF ; |XXXXXXXX| $DED9
    .byte $FF ; |XXXXXXXX| $DEDA
    .byte $FF ; |XXXXXXXX| $DEDB
    .byte $FF ; |XXXXXXXX| $DEDC
    .byte $FF ; |XXXXXXXX| $DEDD
    .byte $FF ; |XXXXXXXX| $DEDE
    .byte $FF ; |XXXXXXXX| $DEDF
    .byte $FF ; |XXXXXXXX| $DEE0
    .byte $FF ; |XXXXXXXX| $DEE1
    .byte $FF ; |XXXXXXXX| $DEE2
    .byte $FF ; |XXXXXXXX| $DEE3
    .byte $FF ; |XXXXXXXX| $DEE4
    .byte $99 ; |X  XX  X| $DEE5
    .byte $99 ; |X  XX  X| $DEE6
    .byte $99 ; |X  XX  X| $DEE7
    .byte $99 ; |X  XX  X| $DEE8
    .byte $99 ; |X  XX  X| $DEE9
    .byte $99 ; |X  XX  X| $DEEA
    .byte $99 ; |X  XX  X| $DEEB
    .byte $99 ; |X  XX  X| $DEEC
    .byte $99 ; |X  XX  X| $DEED
    .byte $99 ; |X  XX  X| $DEEE
    .byte $99 ; |X  XX  X| $DEEF
    .byte $99 ; |X  XX  X| $DEF0
LDEF1:
    .byte $FF ; |XXXXXXXX| $DEF1
    .byte $FF ; |XXXXXXXX| $DEF2
    .byte $FF ; |XXXXXXXX| $DEF3
    .byte $FF ; |XXXXXXXX| $DEF4
    .byte $FF ; |XXXXXXXX| $DEF5
    .byte $FF ; |XXXXXXXX| $DEF6
    .byte $FF ; |XXXXXXXX| $DEF7
    .byte $FF ; |XXXXXXXX| $DEF8
    .byte $FF ; |XXXXXXXX| $DEF9
    .byte $FF ; |XXXXXXXX| $DEFA
    .byte $FF ; |XXXXXXXX| $DEFB
    .byte $FF ; |XXXXXXXX| $DEFC
LDEFD:
    .byte $F0 ; |XXXX    | $DEFD
    .byte $FF ; |XXXXXXXX| $DEFE
    .byte $FF ; |XXXXXXXX| $DEFF
    .byte $FF ; |XXXXXXXX| $DF00
    .byte $FF ; |XXXXXXXX| $DF01
    .byte $FF ; |XXXXXXXX| $DF02
    .byte $F0 ; |XXXX    | $DF03
    .byte $E0 ; |XXX     | $DF04
    .byte $80 ; |X       | $DF05
    .byte $00 ; |        | $DF06
    .byte $00 ; |        | $DF07
    .byte $00 ; |        | $DF08
LDF09:
    .byte $00 ; |        | $DF09
    .byte $FF ; |XXXXXXXX| $DF0A
    .byte $FF ; |XXXXXXXX| $DF0B
    .byte $FF ; |XXXXXXXX| $DF0C
    .byte $FF ; |XXXXXXXX| $DF0D
    .byte $FF ; |XXXXXXXX| $DF0E
    .byte $FF ; |XXXXXXXX| $DF0F
    .byte $FF ; |XXXXXXXX| $DF10
    .byte $FF ; |XXXXXXXX| $DF11
    .byte $3F ; |  XXXXXX| $DF12
    .byte $07 ; |     XXX| $DF13
    .byte $00 ; |        | $DF14
    .byte $00 ; |        | $DF15
    .byte $00 ; |        | $DF16
    .byte $00 ; |        | $DF17
    .byte $3C ; |  XXXX  | $DF18
    .byte $7E ; | XXXXXX | $DF19
    .byte $FF ; |XXXXXXXX| $DF1A
    .byte $DB ; |XX XX XX| $DF1B
    .byte $DB ; |XX XX XX| $DF1C
    .byte $DB ; |XX XX XX| $DF1D
    .byte $C3 ; |XX    XX| $DF1E
    .byte $E7 ; |XXX  XXX| $DF1F
    .byte $FF ; |XXXXXXXX| $DF20
    .byte $FF ; |XXXXXXXX| $DF21
    .byte $7E ; | XXXXXX | $DF22
    .byte $3C ; |  XXXX  | $DF23
    .byte $7E ; | XXXXXX | $DF24
    .byte $FF ; |XXXXXXXX| $DF25
    .byte $E7 ; |XXX  XXX| $DF26
    .byte $DB ; |XX XX XX| $DF27
    .byte $DB ; |XX XX XX| $DF28
    .byte $DB ; |XX XX XX| $DF29
    .byte $E7 ; |XXX  XXX| $DF2A
    .byte $FF ; |XXXXXXXX| $DF2B
    .byte $FF ; |XXXXXXXX| $DF2C
    .byte $7E ; | XXXXXX | $DF2D
    .byte $3C ; |  XXXX  | $DF2E
    .byte $7E ; | XXXXXX | $DF2F
    .byte $DF ; |XX XXXXX| $DF30
    .byte $DF ; |XX XXXXX| $DF31
    .byte $D3 ; |XX X  XX| $DF32
    .byte $CD ; |XX  XX X| $DF33
    .byte $DD ; |XX XXX X| $DF34
    .byte $CD ; |XX  XX X| $DF35
    .byte $D3 ; |XX X  XX| $DF36
    .byte $FF ; |XXXXXXXX| $DF37
    .byte $7E ; | XXXXXX | $DF38
    .byte $3C ; |  XXXX  | $DF39
    .byte $7E ; | XXXXXX | $DF3A
    .byte $FD ; |XXXXXX X| $DF3B
    .byte $FB ; |XXXXX XX| $DF3C
    .byte $FB ; |XXXXX XX| $DF3D
    .byte $CB ; |XX  X XX| $DF3E
    .byte $B3 ; |X XX  XX| $DF3F
    .byte $BB ; |X XXX XX| $DF40
    .byte $B3 ; |X XX  XX| $DF41
    .byte $CB ; |XX  X XX| $DF42
    .byte $7E ; | XXXXXX | $DF43
    .byte $3C ; |  XXXX  | $DF44
    .byte $7E ; | XXXXXX | $DF45
    .byte $FF ; |XXXXXXXX| $DF46
    .byte $DF ; |XX XXXXX| $DF47
    .byte $DF ; |XX XXXXX| $DF48
    .byte $DF ; |XX XXXXX| $DF49
    .byte $CD ; |XX  XX X| $DF4A
    .byte $D3 ; |XX X  XX| $DF4B
    .byte $FF ; |XXXXXXXX| $DF4C
    .byte $FF ; |XXXXXXXX| $DF4D
    .byte $7E ; | XXXXXX | $DF4E
    .byte $3C ; |  XXXX  | $DF4F
    .byte $7E ; | XXXXXX | $DF50
    .byte $FF ; |XXXXXXXX| $DF51
    .byte $C3 ; |XX    XX| $DF52
    .byte $FD ; |XXXXXX X| $DF53
    .byte $E3 ; |XXX   XX| $DF54
    .byte $DF ; |XX XXXXX| $DF55
    .byte $E3 ; |XXX   XX| $DF56
    .byte $FF ; |XXXXXXXX| $DF57
    .byte $FF ; |XXXXXXXX| $DF58
    .byte $7E ; | XXXXXX | $DF59
    .byte $3C ; |  XXXX  | $DF5A
    .byte $7E ; | XXXXXX | $DF5B
    .byte $FF ; |XXXXXXXX| $DF5C
    .byte $F3 ; |XXXX  XX| $DF5D
    .byte $EF ; |XXX XXXX| $DF5E
    .byte $EF ; |XXX XXXX| $DF5F
    .byte $C3 ; |XX    XX| $DF60
    .byte $EF ; |XXX XXXX| $DF61
    .byte $EF ; |XXX XXXX| $DF62
    .byte $FF ; |XXXXXXXX| $DF63
    .byte $7E ; | XXXXXX | $DF64
    .byte $3C ; |  XXXX  | $DF65
    .byte $7E ; | XXXXXX | $DF66
    .byte $FF ; |XXXXXXXX| $DF67
    .byte $E5 ; |XXX  X X| $DF68
    .byte $D9 ; |XX XX  X| $DF69
    .byte $DD ; |XX XXX X| $DF6A
    .byte $DD ; |XX XXX X| $DF6B
    .byte $DD ; |XX XXX X| $DF6C
    .byte $FF ; |XXXXXXXX| $DF6D
    .byte $FF ; |XXXXXXXX| $DF6E
    .byte $7E ; | XXXXXX | $DF6F
    .byte $3C ; |  XXXX  | $DF70
    .byte $7E ; | XXXXXX | $DF71
    .byte $FF ; |XXXXXXXX| $DF72
    .byte $F7 ; |XXXX XXX| $DF73
    .byte $EB ; |XXX X XX| $DF74
    .byte $DD ; |XX XXX X| $DF75
    .byte $DD ; |XX XXX X| $DF76
    .byte $DD ; |XX XXX X| $DF77
    .byte $FF ; |XXXXXXXX| $DF78
    .byte $FF ; |XXXXXXXX| $DF79
    .byte $7E ; | XXXXXX | $DF7A
    .byte $3C ; |  XXXX  | $DF7B
    .byte $7E ; | XXXXXX | $DF7C
    .byte $FF ; |XXXXXXXX| $DF7D
    .byte $EB ; |XXX X XX| $DF7E
    .byte $C1 ; |XX     X| $DF7F
    .byte $D5 ; |XX X X X| $DF80
    .byte $D5 ; |XX X X X| $DF81
    .byte $DD ; |XX XXX X| $DF82
    .byte $FF ; |XXXXXXXX| $DF83
    .byte $FF ; |XXXXXXXX| $DF84
    .byte $7E ; | XXXXXX | $DF85
    .byte $3C ; |  XXXX  | $DF86
    .byte $7E ; | XXXXXX | $DF87
    .byte $FF ; |XXXXXXXX| $DF88
    .byte $DD ; |XX XXX X| $DF89
    .byte $EB ; |XXX X XX| $DF8A
    .byte $F7 ; |XXXX XXX| $DF8B
    .byte $EB ; |XXX X XX| $DF8C
    .byte $DD ; |XX XXX X| $DF8D
    .byte $FF ; |XXXXXXXX| $DF8E
    .byte $FF ; |XXXXXXXX| $DF8F
    .byte $7E ; | XXXXXX | $DF90
    .byte $3C ; |  XXXX  | $DF91
    .byte $7E ; | XXXXXX | $DF92
    .byte $DF ; |XX XXXXX| $DF93
    .byte $EF ; |XXX XXXX| $DF94
    .byte $F7 ; |XXXX XXX| $DF95
    .byte $EB ; |XXX X XX| $DF96
    .byte $DD ; |XX XXX X| $DF97
    .byte $DD ; |XX XXX X| $DF98
    .byte $FF ; |XXXXXXXX| $DF99
    .byte $FF ; |XXXXXXXX| $DF9A
    .byte $7E ; | XXXXXX | $DF9B
    .byte $3C ; |  XXXX  | $DF9C
    .byte $7E ; | XXXXXX | $DF9D
    .byte $FF ; |XXXXXXXX| $DF9E
    .byte $C1 ; |XX     X| $DF9F
    .byte $EF ; |XXX XXXX| $DFA0
    .byte $F7 ; |XXXX XXX| $DFA1
    .byte $FB ; |XXXXX XX| $DFA2
    .byte $C1 ; |XX     X| $DFA3
    .byte $FF ; |XXXXXXXX| $DFA4
    .byte $FF ; |XXXXXXXX| $DFA5
    .byte $7E ; | XXXXXX | $DFA6
    .byte $3C ; |  XXXX  | $DFA7
LDFA8:
    .byte $00 ; |        | $DFA8
    .byte $07 ; |     XXX| $DFA9
    .byte $04 ; |     X  | $DFAA
    .byte $04 ; |     X  | $DFAB
    .byte $07 ; |     XXX| $DFAC
    .byte $04 ; |     X  | $DFAD
    .byte $04 ; |     X  | $DFAE
    .byte $07 ; |     XXX| $DFAF
    .byte $00 ; |        | $DFB0
    .byte $00 ; |        | $DFB1
    .byte $22 ; |  X   X | $DFB2
    .byte $22 ; |  X   X | $DFB3
    .byte $22 ; |  X   X | $DFB4
    .byte $3E ; |  XXXXX | $DFB5
    .byte $22 ; |  X   X | $DFB6
    .byte $22 ; |  X   X | $DFB7
    .byte $3E ; |  XXXXX | $DFB8
LDFB9:
    .byte $00 ; |        | $DFB9
    .byte $7B ; | XXXX XX| $DFBA
    .byte $0A ; |    X X | $DFBB
    .byte $0A ; |    X X | $DFBC
    .byte $3B ; |  XXX XX| $DFBD
    .byte $09 ; |    X  X| $DFBE
    .byte $09 ; |    X  X| $DFBF
    .byte $79 ; | XXXX  X| $DFC0
    .byte $00 ; |        | $DFC1
    .byte $00 ; |        | $DFC2
    .byte $2F ; |  X XXXX| $DFC3
    .byte $21 ; |  X    X| $DFC4
    .byte $21 ; |  X    X| $DFC5
    .byte $E1 ; |XXX    X| $DFC6
    .byte $21 ; |  X    X| $DFC7
    .byte $21 ; |  X    X| $DFC8
    .byte $E1 ; |XXX    X| $DFC9
LDFCA:
    .byte $00 ; |        | $DFCA
    .byte $8A ; |X   X X | $DFCB
    .byte $8A ; |X   X X | $DFCC
    .byte $8A ; |X   X X | $DFCD
    .byte $FA ; |XXXXX X | $DFCE
    .byte $8A ; |X   X X | $DFCF
    .byte $8A ; |X   X X | $DFD0
    .byte $FB ; |XXXXX XX| $DFD1
    .byte $00 ; |        | $DFD2
    .byte $00 ; |        | $DFD3
    .byte $11 ; |   X   X| $DFD4
    .byte $11 ; |   X   X| $DFD5
    .byte $11 ; |   X   X| $DFD6
    .byte $DF ; |XX XXXXX| $DFD7
    .byte $51 ; | X X   X| $DFD8
    .byte $51 ; | X X   X| $DFD9
    .byte $D1 ; |XX X   X| $DFDA
LDFDB:
    .byte $00 ; |        | $DFDB
    .byte $04 ; |     X  | $DFDC
    .byte $04 ; |     X  | $DFDD
    .byte $04 ; |     X  | $DFDE
    .byte $05 ; |     X X| $DFDF
    .byte $05 ; |     X X| $DFE0
    .byte $05 ; |     X X| $DFE1
    .byte $07 ; |     XXX| $DFE2
    .byte $00 ; |        | $DFE3
    .byte $00 ; |        | $DFE4
    .byte $22 ; |  X   X | $DFE5
    .byte $22 ; |  X   X | $DFE6
    .byte $22 ; |  X   X | $DFE7
    .byte $3E ; |  XXXXX | $DFE8
    .byte $22 ; |  X   X | $DFE9
    .byte $22 ; |  X   X | $DFEA
LDFEB:
    .byte $3E ; |  XXXXX | $DFEB
    .byte $01 ; |       X| $DFEC
    .byte $00 ; |        | $DFED
    .byte $00 ; |        | $DFEE
    .byte $80 ; |X       | $DFEF

      ORG $0FF0
     RORG $DFF0

LDFF0:
    bit    $DFF9                 ; 4
    jmp.ind ($00F3)              ; 5

    .byte $00 ; |        | $DFF6
    .byte $00 ; |        | $DFF7
    .byte $00 ; |        | $DFF8
    .byte $00 ; |        | $DFF9

    .word START_0
LDFFC:
    .word START_0
    .word START_0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 1
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


      ORG $1000
     RORG $F000

    jmp    (LFFFC)               ; 5

LF003:
    lda    #$24                  ; 2
    sta    TIM64T                ; 4
    lda    ram_A3                ; 3
    and    #$03                  ; 2
    bne    LF038                 ; 2³
    ldy    #$10                  ; 2
LF010:
    ldx    $94,Y                 ; 4
    lda.wy ram_96,Y              ; 4
    sta.wy ram_94,Y              ; 5
    stx    $96,Y                 ; 4
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    dey                          ; 2
    bpl    LF010                 ; 2³
    lda    ram_E8                ; 3
    ldx    ram_EA                ; 3
    stx    ram_E8                ; 3
    sta    ram_EA                ; 3
    lda    ram_C4                ; 3
    ldy    ram_C6                ; 3
    sty    ram_C4                ; 3
    sta    ram_C6                ; 3
    lda    ram_C7                ; 3
    ldy    ram_C9                ; 3
    sty    ram_C7                ; 3
    sta    ram_C9                ; 3
LF038:
    lda    ram_A7                ; 3
    cmp    #$03                  ; 2
    bcs    LF050                 ; 2³
    lda    ram_A3                ; 3
    and    #$10                  ; 2
    beq    LF04A                 ; 2³
    jsr    LF755                 ; 6
    jmp    LF519                 ; 3

LF04A:
    jsr    LF7C5                 ; 6
    jmp    LF519                 ; 3

LF050:
    jsr    LF746                 ; 6
    bcs    LF058                 ; 2³
    jmp    LF519                 ; 3

LF058:
    inc    ram_97                ; 5
    bne    LF081                 ; 2³
    inc    ram_9B                ; 5
    bne    LF081                 ; 2³
    lda    ram_A3                ; 3
    and    #$40                  ; 2
    beq    LF06C                 ; 2³
    lda    ram_A3                ; 3
    ora    #$20                  ; 2
    sta    ram_A3                ; 3
LF06C:
    lda    ram_A3                ; 3
    and    #$FC                  ; 2
    ora    #$42                  ; 2
    sta    ram_A3                ; 3
    ldx    #$FF                  ; 2
    stx    ram_92                ; 3
    inx                          ; 2
    stx    ram_90                ; 3
    stx    ram_D2                ; 3
    stx    AUDV0                 ; 3
    stx    AUDV1                 ; 3
LF081:
    lda    ram_97                ; 3
    and    #$01                  ; 2
    sta    ram_F8                ; 3
    lda    ram_A3                ; 3
    and    #$60                  ; 2
    beq    LF09C                 ; 2³
    cmp    #$40                  ; 2
    beq    LF099                 ; 2³
    lda    #$F7                  ; 2
    sta    ram_92                ; 3
    lda    ram_9B                ; 3
    sta    ram_90                ; 3
LF099:
    jmp    LF4C1                 ; 3

LF09C:
    ldx    ram_F7                ; 3
    bpl    LF0A3                 ; 2³
    jmp    LF519                 ; 3

LF0A3:
    lda    LFEF0,X               ; 4
    sta    ram_F3                ; 3
    lda    LFEF7,X               ; 4
    sta    ram_F4                ; 3
    jmp.ind ($00F3)              ; 5

    dec    ram_F6                ; 5
    beq    LF0D6                 ; 2³
    lda    ram_97                ; 3
    and    #$03                  ; 2
    bne    LF0D3                 ; 2³
    lda    ram_E8                ; 3
    sec                          ; 2
    sbc    #$0C                  ; 2
    cmp    LFF97                 ; 4
    beq    LF0D3                 ; 2³
    inc    ram_E8                ; 5
    ldx    #$00                  ; 2
    lda    #$08                  ; 2
    jsr    LFD63                 ; 6
    bit    ram_A3                ; 3
    bpl    LF0D3                 ; 2³
    dec    ram_EA                ; 5
LF0D3:
    jmp    LF264                 ; 3

LF0D6:
    lda    #$00                  ; 2
    sta    ram_F7                ; 3
    jmp    LF264                 ; 3

    dec    ram_F6                ; 5
    beq    LF100                 ; 2³+1
    lda    ram_97                ; 3
    and    #$03                  ; 2
    bne    LF0FD                 ; 2³
    lda    ram_E8                ; 3
    cmp    LFF97                 ; 4
    beq    LF0FD                 ; 2³
    dec    ram_E8                ; 5
    ldx    #$00                  ; 2
    lda    #$08                  ; 2
    jsr    LFD63                 ; 6
    bit    ram_A3                ; 3
    bpl    LF0FD                 ; 2³
    inc    ram_EA                ; 5
LF0FD:
    jmp    LF264                 ; 3

LF100:
    ldx    #$01                  ; 2
    stx    ram_E2                ; 3
    stx    ram_E3                ; 3
    stx    ram_D1                ; 3
    dex                          ; 2
    stx    ram_E0                ; 3
    stx    ram_E1                ; 3
    stx    ram_D0                ; 3
    stx    ram_CC                ; 3
    stx    ram_DD                ; 3
    stx    ram_DE                ; 3
    stx    AUDV1                 ; 3
    ldy    #$04                  ; 2
    lda    ram_D6                ; 3
    and    ram_D7                ; 3
    and    #$F0                  ; 2
LF11F:
    rol                          ; 2
    bcc    LF123                 ; 2³
    inx                          ; 2
LF123:
    dey                          ; 2
    bne    LF11F                 ; 2³
    stx    ram_CD                ; 3
    ldx    #$0E                  ; 2
LF12A:
    jsr    LFC93                 ; 6
    cmp    #$93                  ; 2
    bcc    LF133                 ; 2³
    and    #$7F                  ; 2
LF133:
    cmp    #$0A                  ; 2
    bcs    LF139                 ; 2³
    ora    #$12                  ; 2
LF139:
    sta    $7F,X                 ; 4
    dex                          ; 2
    bne    LF12A                 ; 2³
    ldx    ram_CD                ; 3
    bne    LF168                 ; 2³
    ldx    LFF4B                 ; 4
    inx                          ; 2
    stx    ram_B8                ; 3
    stx    ram_BA                ; 3
    ldx    LFF00                 ; 4
    stx    ram_B9                ; 3
    stx    ram_BB                ; 3
    lda    #$0F                  ; 2
    sta    AUDF0                 ; 3
    lda    #$01                  ; 2
    sta    AUDC0                 ; 3
    lda    #$05                  ; 2
    sta    AUDV0                 ; 3
    lda    #$80                  ; 2
    sta    ram_CF                ; 3
    lda    #$86                  ; 2
    sta    ram_F7                ; 3
    jmp    LF17C                 ; 3

LF168:
    lda    #$40                  ; 2
    sta    ram_CF                ; 3
    lda    #$08                  ; 2
    sta    AUDC0                 ; 3
    lda    #$0A                  ; 2
    sta    AUDF0                 ; 3
    lda    #$05                  ; 2
    sta    AUDV0                 ; 3
    lda    #$85                  ; 2
    sta    ram_F7                ; 3
LF17C:
    lda    ram_A3                ; 3
    and    #$FC                  ; 2
    ora    #$01                  ; 2
    sta    ram_A3                ; 3
    jmp    LF519                 ; 3

    dec    ram_F6                ; 5
    lda    ram_F6                ; 3
    beq    LF197                 ; 2³
    cmp    #$02                  ; 2
    beq    LF1B4                 ; 2³
    jsr    LFA76                 ; 6
    jmp    LF519                 ; 3

LF197:
    jsr    LFAB6                 ; 6
    lda    #$80                  ; 2
    sta    VBLANK                ; 3
    lda    #$00                  ; 2
    sta    VBLANK                ; 3
    lda    #$EE                  ; 2
    sta    SWCHA                 ; 4
    lda    #$06                  ; 2
    sta    ram_F7                ; 3
    lda    #$36                  ; 2
    sta    ram_F6                ; 3
    sta    CXCLR                 ; 3
    jmp    LF519                 ; 3

LF1B4:
    jsr    LF95A                 ; 6
    jmp    LF519                 ; 3

    lda    ram_D6                ; 3
    and    ram_D7                ; 3
    cmp    #$F0                  ; 2
    bcc    LF1D5                 ; 2³
    ldx    ram_9F                ; 3
    ldy    #$02                  ; 2
    lda    LFEC0,X               ; 4
    and    #$3C                  ; 2
    beq    LF1D3                 ; 2³
    ldy    #$04                  ; 2
    lda    #$02                  ; 2
    sta    ram_EE                ; 3
LF1D3:
    sty    ram_F7                ; 3
LF1D5:
    lda    ram_A3                ; 3
    and    #$10                  ; 2
    bne    LF231                 ; 2³+1
    ldx    ram_9F                ; 3
    lda    LFEC0,X               ; 4
    and    #$3C                  ; 2
    beq    LF231                 ; 2³+1
    lsr                          ; 2
    lsr                          ; 2
    ldy    ram_F7                ; 3
    cpy    #$04                  ; 2
    bne    LF1EE                 ; 2³
    lda    #$01                  ; 2
LF1EE:
    sta    ram_FA                ; 3
    dec    ram_ED                ; 5
    bne    LF231                 ; 2³+1
    dec    ram_EE                ; 5
    bne    LF22D                 ; 2³+1
    ldx    ram_EB                ; 3
    dex                          ; 2
    dex                          ; 2
    stx    ram_F3                ; 3
    lda    ram_EC                ; 3
    sta    ram_F4                ; 3
    jsr    LFBA2                 ; 6
    bne    LF20F                 ; 2³
    ldy    ram_F7                ; 3
    cpy    #$04                  ; 2
    bne    LF22D                 ; 2³
    beq    LF213                 ; 2³
LF20F:
    cmp    #$37                  ; 2
    bne    LF219                 ; 2³
LF213:
    lda    #$02                  ; 2
    sta    ram_F7                ; 3
    lda    #$01                  ; 2
LF219:
    sec                          ; 2
    sbc    #$01                  ; 2
    jsr    LF866                 ; 6
    ldx    ram_F3                ; 3
    inx                          ; 2
    inx                          ; 2
    stx    ram_EB                ; 3
    ldx    ram_F4                ; 3
    stx    ram_EC                ; 3
    ldx    ram_FA                ; 3
    stx    ram_EE                ; 3
LF22D:
    ldx    #$43                  ; 2
    stx    ram_ED                ; 3
LF231:
    lda    ram_E6                ; 3
    ora    ram_E7                ; 3
    bne    LF264                 ; 2³
    ldy    ram_F7                ; 3
    cpy    #$02                  ; 2
    bne    LF262                 ; 2³
    ldy    #$02                  ; 2
LF23F:
    tya                          ; 2
    asl                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda    ram_A8,X              ; 4
    cmp    LFFDD,Y               ; 4
    bne    LF25C                 ; 2³
    lda    ram_A9,X              ; 4
    cmp    LFFE0,Y               ; 4
    bne    LF25C                 ; 2³
    dey                          ; 2
    bpl    LF23F                 ; 2³
    lda    #$7D                  ; 2
    sta    ram_EB                ; 3
    lda    #$DB                  ; 2
    sta    ram_EC                ; 3
LF25C:
    ldy    #$03                  ; 2
    lda    #$78                  ; 2
    sta    ram_F6                ; 3
LF262:
    sty    ram_F7                ; 3
LF264:
    lda    ram_D3                ; 3
    bit    CXP0FB                ; 3
    bvc    LF27A                 ; 2³
    ldx    #$04                  ; 2
    cmp    #$57                  ; 2
    bcc    LF286                 ; 2³
    inx                          ; 2
    inx                          ; 2
    cmp    #$77                  ; 2
    bcc    LF286                 ; 2³
    inx                          ; 2
    inx                          ; 2
    bcs    LF286                 ; 2³
LF27A:
    bit    CXP1FB                ; 3
    bvc    LF28C                 ; 2³
    ldx    #$00                  ; 2
    cmp    #$17                  ; 2
    bcc    LF286                 ; 2³
    inx                          ; 2
    inx                          ; 2
LF286:
    lda    ram_D9,X              ; 4
    ora    #$80                  ; 2
    sta    ram_D9,X              ; 4
LF28C:
    sta    CXCLR                 ; 3
    ldx    ram_F8                ; 3
    lda    ram_E6,X              ; 4
    bne    LF297                 ; 2³
    jmp    LF315                 ; 3

LF297:
    lda    ram_D6,X              ; 4
    and    #$01                  ; 2
    bne    LF2A0                 ; 2³
    jmp    LF359                 ; 3

LF2A0:
    dec    ram_E6,X              ; 6
    beq    LF2CC                 ; 2³
    jsr    LF856                 ; 6
    clc                          ; 2
    adc    #$43                  ; 2
    jsr    LF866                 ; 6
    jsr    LF881                 ; 6
    jsr    LFDB0                 ; 6
    clc                          ; 2
    adc    ram_F3                ; 3
    sta    ram_F3                ; 3
    jsr    LFD73                 ; 6
    jsr    LF856                 ; 6
    eor    #$07                  ; 2
    clc                          ; 2
    adc    #$43                  ; 2
    jsr    LF866                 ; 6
    jsr    LFD8A                 ; 6
    jmp    LF478                 ; 3

LF2CC:
    jsr    LF881                 ; 6
    stx    ram_F3                ; 3
    sta    ram_F4                ; 3
    ldx    ram_F3                ; 3
    ldy    ram_9F                ; 3
    lda    LFFB0,Y               ; 4
    and    #$40                  ; 2
    beq    LF2EB                 ; 2³
    lda    ram_F4                ; 3
    jsr    LFB6C                 ; 6
    ldx    ram_F3                ; 3
    jsr    LFD55                 ; 6
    jmp    LF2F2                 ; 3

LF2EB:
    lda    ram_F4                ; 3
    jsr    LFD55                 ; 6
    lda    #$00                  ; 2
LF2F2:
    jsr    LF866                 ; 6
    jsr    LFDB0                 ; 6
    clc                          ; 2
    adc    ram_F3                ; 3
    sta    ram_F3                ; 3
    jsr    LFD73                 ; 6
    ldx    ram_F8                ; 3
    lda    ram_D4,X              ; 4
    jsr    LF866                 ; 6
    jsr    LFD8A                 ; 6
    ldx    ram_F8                ; 3
    lda    ram_D6,X              ; 4
    and    #$F0                  ; 2
    sta    ram_D6,X              ; 4
    jmp    LF478                 ; 3

LF315:
    jsr    LF881                 ; 6
    bcs    LF31D                 ; 2³
    jmp    LF3A2                 ; 3

LF31D:
    lda    ram_97                ; 3
    ror                          ; 2
    txa                          ; 2
    rol                          ; 2
    rol                          ; 2
    tax                          ; 2
    lda    ram_80,X              ; 4
    sta    ram_F3                ; 3
    lda    ram_81,X              ; 4
    sta    ram_F4                ; 3
    txa                          ; 2
    ror                          ; 2
    ror                          ; 2
    tax                          ; 2
    lda    #$00                  ; 2
    rol                          ; 2
    jsr    LFDB0                 ; 6
    eor    #$FF                  ; 2
    sec                          ; 2
    adc    ram_F3                ; 3
    sta    ram_F3                ; 3
    jsr    LFBA2                 ; 6
    tay                          ; 2
    ldx    ram_F8                ; 3
    sty    ram_D4,X              ; 4
    lda    #$38                  ; 2
    sta    ram_E6,X              ; 4
    lda    ram_D6,X              ; 4
    and    #$F0                  ; 2
    ora    #$01                  ; 2
    sta    ram_D6,X              ; 4
    lda    #$07                  ; 2
    jsr    LFD63                 ; 6
    jmp    LF478                 ; 3

LF359:
    dec    ram_E6,X              ; 6
    beq    LF37D                 ; 2³
    jsr    LF856                 ; 6
    eor    #$07                  ; 2
    clc                          ; 2
    adc    #$43                  ; 2
    jsr    LF866                 ; 6
    jsr    LFB89                 ; 6
    jsr    LFD99                 ; 6
    jsr    LF856                 ; 6
    clc                          ; 2
    adc    #$43                  ; 2
    jsr    LF866                 ; 6
    jsr    LFD8A                 ; 6
    jmp    LF478                 ; 3

LF37D:
    ldx    ram_F8                ; 3
    lda    ram_D4,X              ; 4
    jsr    LF866                 ; 6
    jsr    LFB89                 ; 6
    jsr    LFD99                 ; 6
    ldy    #$00                  ; 2
    ldx    ram_F8                ; 3
    sty    ram_D4,X              ; 4
    tya                          ; 2
    jsr    LF866                 ; 6
    jsr    LFD8A                 ; 6
    ldx    ram_F8                ; 3
    lda    ram_D6,X              ; 4
    and    #$F0                  ; 2
    sta    ram_D6,X              ; 4
    jmp    LF478                 ; 3

LF3A2:
    ldx    ram_F8                ; 3
    lda    ram_D6,X              ; 4
    and    #$02                  ; 2
    bne    LF3AD                 ; 2³
    jmp    LF478                 ; 3

LF3AD:
    lda    ram_D4,X              ; 4
    bne    LF3B4                 ; 2³
    jmp    LF478                 ; 3

LF3B4:
    jsr    LFB89                 ; 6
    bcs    LF3BC                 ; 2³
    jmp    LF478                 ; 3

LF3BC:
    stx    ram_F4                ; 3
    jsr    LF7FB                 ; 6
    bcc    LF3C6                 ; 2³
    jmp    LF478                 ; 3

LF3C6:
    lda    ram_E2,X              ; 4
    cmp    #$35                  ; 2
    beq    LF3D4                 ; 2³
    jsr    LF83F                 ; 6
    bcs    LF3D4                 ; 2³
    jmp    LF478                 ; 3

LF3D4:
    bit    ram_A3                ; 3
    bmi    LF3DB                 ; 2³
    jmp    LF45A                 ; 3

LF3DB:
    tya                          ; 2
    eor    #$01                  ; 2
    ldx    ram_F4                ; 3
    jsr    LF7FD                 ; 6
    bcc    LF404                 ; 2³+1
    jsr    LF873                 ; 6
    jsr    LFBA2                 ; 6
    cmp    #$43                  ; 2
    bcc    LF44F                 ; 2³+1
    lda    ram_D4                ; 3
    cmp    ram_D5                ; 3
    beq    LF45A                 ; 2³+1
    clc                          ; 2
    adc    #$1A                  ; 2
    cmp    #$35                  ; 2
    bcc    LF3FE                 ; 2³
    sbc    #$34                  ; 2
LF3FE:
    cmp    ram_D5                ; 3
    beq    LF45A                 ; 2³
    bne    LF478                 ; 2³
LF404:
    ldy    ram_9F                ; 3
    cpy    #$09                  ; 2
    bcc    LF45A                 ; 2³
    cpy    #$0C                  ; 2
    bcs    LF45A                 ; 2³
    sta    ram_FC                ; 3
    eor    #$01                  ; 2
    sta    ram_FD                ; 3
    stx    ram_FA                ; 3
    ldx    #$03                  ; 2
    stx    ram_FB                ; 3
LF41A:
    ldx    ram_FB                ; 3
    cpx    ram_FA                ; 3
    beq    LF448                 ; 2³
    lda    ram_FC                ; 3
    jsr    LF873                 ; 6
    jsr    LFBA2                 ; 6
    cmp    #$43                  ; 2
    bcs    LF435                 ; 2³
    ldy    ram_FD                ; 3
    jsr    LF83F                 ; 6
    bcc    LF448                 ; 2³
    bcs    LF478                 ; 2³
LF435:
    lda    ram_D4                ; 3
    cmp    ram_D5                ; 3
    beq    LF478                 ; 2³
    clc                          ; 2
    adc    #$1A                  ; 2
    cmp    #$35                  ; 2
    bcc    LF444                 ; 2³
    sbc    #$34                  ; 2
LF444:
    cmp    ram_D5                ; 3
    beq    LF478                 ; 2³
LF448:
    dec    ram_FB                ; 5
    bpl    LF41A                 ; 2³
    jmp    LF45A                 ; 3

LF44F:
    tax                          ; 2
    ldy    ram_F8                ; 3
    txa                          ; 2
    jsr    LF83F                 ; 6
    bcs    LF45A                 ; 2³
    bcc    LF478                 ; 2³
LF45A:
    jsr    LFB89                 ; 6
    ldy    ram_F8                ; 3
    lda    #$38                  ; 2
    sta.wy ram_E6,Y              ; 5
    lda.wy ram_D6,Y              ; 4
    and    #$F0                  ; 2
    ora    #$02                  ; 2
    ora    LFE5B,X               ; 4
    sta.wy ram_D6,Y              ; 5
    ldx    ram_F8                ; 3
    lda    #$07                  ; 2
    jsr    LFD63                 ; 6
LF478:
    jsr    LF93A                 ; 6
    ldx    ram_F8                ; 3
    jsr    LFCAA                 ; 6
    ldx    ram_F8                ; 3
    lda    ram_E6,X              ; 4
    bne    LF4BE                 ; 2³
    lda    ram_9F                ; 3
    cmp    #$03                  ; 2
    bcs    LF4AC                 ; 2³
    lda    ram_D4,X              ; 4
    bne    LF49E                 ; 2³
    ldy    #$07                  ; 2
LF492:
    lda    LFED2,Y               ; 4
    cmp    ram_D2,X              ; 4
    beq    LF4AC                 ; 2³
    dey                          ; 2
    bne    LF492                 ; 2³
    beq    LF4B8                 ; 2³
LF49E:
    ldy    #$06                  ; 2
LF4A0:
    lda    LFED9,Y               ; 4
    cmp    ram_D2,X              ; 4
    beq    LF4AC                 ; 2³
    dey                          ; 2
    bne    LF4A0                 ; 2³
    beq    LF4B8                 ; 2³
LF4AC:
    lda    ram_D6,X              ; 4
    and    #$F0                  ; 2
    sta    ram_D6,X              ; 4
    lda    ram_D0,X              ; 4
    and    #$DF                  ; 2
    sta    ram_D0,X              ; 4
LF4B8:
    lda    ram_D6,X              ; 4
    and    #$FC                  ; 2
    sta    ram_D6,X              ; 4
LF4BE:
    jmp    LF519                 ; 3

LF4C1:
    ldx    ram_D2                ; 3
    inx                          ; 2
    stx    ram_D2                ; 3
    bne    LF4D3                 ; 2³
    ldy    ram_D4                ; 3
    iny                          ; 2
    cpy    #$35                  ; 2
    bcc    LF4D1                 ; 2³
    ldy    #$01                  ; 2
LF4D1:
    sty    ram_D4                ; 3
LF4D3:
    cpx    #$A6                  ; 2
    bcs    LF505                 ; 2³+1
    cpx    #$08                  ; 2
    bcc    LF505                 ; 2³+1
    ldx    #$00                  ; 2
    lda    ram_D6                ; 3
    ora    #$08                  ; 2
    sta    ram_D6                ; 3
    jsr    LFCF0                 ; 6
    ldx    #$01                  ; 2
    lda    ram_D2                ; 3
    sec                          ; 2
    sbc    #$06                  ; 2
    jsr    LF80A                 ; 6
    jsr    LF82D                 ; 6
    ldx    #$04                  ; 2
    lda    ram_D2                ; 3
    sec                          ; 2
    sbc    #$03                  ; 2
    jsr    LF80A                 ; 6
    jsr    LF82D                 ; 6
    ldx    ram_D4                ; 3
    jmp    LF50F                 ; 3

LF505:
    lda    #$50                  ; 2
    sta    ram_C7                ; 3
    lda    #$DB                  ; 2
    sta    ram_C8                ; 3
    ldx    #$00                  ; 2
LF50F:
    lda    LFF4B,X               ; 4
    sta    ram_C0                ; 3
    lda    LFF00,X               ; 4
    sta    ram_C1                ; 3
LF519:
    lda    INTIM                 ; 4
    bne    LF519                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$02                  ; 2
    sta    VSYNC                 ; 3
    lda    #$22                  ; 2
    sta    TIM8T                 ; 4
    ldx    #$01                  ; 2
    jsr    LFBF5                 ; 6
LF530:
    lda    INTIM                 ; 4
    bne    LF530                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    VSYNC                 ; 3
    lda    #$2C                  ; 2
    sta    TIM64T                ; 4
    lda    ram_A3                ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    LFDE0,X               ; 4
    sta    ram_F3                ; 3
    lda    LFDE4,X               ; 4
    sta    ram_F4                ; 3
    jmp.ind ($00F3)              ; 5

    lda    #$AD                  ; 2
    sta    ram_F3                ; 3
    lda    #$D1                  ; 2
    sta    ram_F4                ; 3
    jmp    LFFF0                 ; 3

    jmp    LF6ED                 ; 3

    lda    ram_9F                ; 3
    cmp    #$03                  ; 2
    bcc    LF58A                 ; 2³
    ldx    ram_F8                ; 3
    beq    LF570                 ; 2³
    lda    ram_A3                ; 3
    and    #$10                  ; 2
    bne    LF58A                 ; 2³
LF570:
    lda    ram_E6,X              ; 4
    beq    LF57A                 ; 2³
    lda    ram_D6,X              ; 4
    and    #$01                  ; 2
    bne    LF58A                 ; 2³
LF57A:
    jsr    LF8DE                 ; 6
    lda    ram_E6,X              ; 4
    beq    LF587                 ; 2³
    lda    ram_D6,X              ; 4
    and    #$01                  ; 2
    bne    LF58A                 ; 2³
LF587:
    jsr    LF89D                 ; 6
LF58A:
    lda    INTIM                 ; 4
    cmp    #$24                  ; 2
    beq    LF593                 ; 2³
    bcs    LF58A                 ; 2³
LF593:
    ldx    #$02                  ; 2
    jsr    LFBF5                 ; 6
    lda    INTIM                 ; 4
    sec                          ; 2
    sbc    #$08                  ; 2
    sta    ram_F4                ; 3
    lda    #$00                  ; 2
    sta    ENABL                 ; 3
    ldx    #$00                  ; 2
    lda    ram_CC                ; 3
    jsr    LF80A                 ; 6
    jsr    LF82D                 ; 6
    ldx    #$01                  ; 2
    lda    ram_CE                ; 3
    jsr    LF80A                 ; 6
    jsr    LF82D                 ; 6
    ldx    #$02                  ; 2
    lda    #$0A                  ; 2
    jsr    LF80A                 ; 6
    jsr    LF82D                 ; 6
    ldx    #$03                  ; 2
    lda    #$12                  ; 2
    jsr    LF80A                 ; 6
    jsr    LF82D                 ; 6
    ldx    #$04                  ; 2
    lda    ram_D2                ; 3
    clc                          ; 2
    adc    #$03                  ; 2
    jsr    LF80A                 ; 6
    jsr    LF82D                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
LF5DD:
    lda    INTIM                 ; 4
    cmp    ram_F4                ; 3
    beq    LF5E6                 ; 2³
    bcs    LF5DD                 ; 2³
LF5E6:
    ldx    #$03                  ; 2
    jsr    LFBF5                 ; 6
    lda    INTIM                 ; 4
    sec                          ; 2
    sbc    #$08                  ; 2
    bpl    LF5F4                 ; 2³
    brk                          ; 7
LF5F4:
    sta    ram_F4                ; 3
    ldx    #$01                  ; 2
LF5F8:
    lda    ram_F1,X              ; 4
    bne    LF600                 ; 2³+1
    sta    AUDV0,X               ; 4
    beq    LF66B                 ; 2³
LF600:
    cmp    #$08                  ; 2
    bne    LF608                 ; 2³
    lda    ram_F8                ; 3
    bne    LF66B                 ; 2³
LF608:
    dec    ram_EF,X              ; 6
    ldy    ram_F1,X              ; 4
    cpy    #$07                  ; 2
    bne    LF62A                 ; 2³
    lda    LFDFA,X               ; 4
    sta    AUDC0,X               ; 4
    jsr    LFC93                 ; 6
    and    #$0F                  ; 2
    sta    AUDF0,X               ; 4
    lda    ram_EF,X              ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LFDD0,Y               ; 4
    sta    AUDV0,X               ; 4
    bne    LF665                 ; 2³
LF62A:
    cpy    #$06                  ; 2
    bne    LF633                 ; 2³
    lda    LFDFA,X               ; 4
    sta    AUDC0,X               ; 4
LF633:
    lda    LFDFB,Y               ; 4
    sta    ram_F3                ; 3
    lda    LFE05,Y               ; 4
    sta    ram_F4                ; 3
    ldy    ram_EF,X              ; 4
    lda    (ram_F3),Y            ; 5
    and    #$7F                  ; 2
    cmp    #$20                  ; 2
    bcs    LF64D                 ; 2³
    and    #$1F                  ; 2
    sta    AUDV0,X               ; 4
    bpl    LF661                 ; 2³
LF64D:
    cmp    #$40                  ; 2
    bcs    LF657                 ; 2³
    and    #$1F                  ; 2
    sta    AUDF0,X               ; 4
    bpl    LF661                 ; 2³
LF657:
    cmp    #$60                  ; 2
    bcs    LF661                 ; 2³
    and    #$1F                  ; 2
    sta    AUDC0,X               ; 4
    bpl    LF661                 ; 2³
LF661:
    lda    (ram_F3),Y            ; 5
    bpl    LF608                 ; 2³
LF665:
    lda    ram_EF,X              ; 4
    bne    LF66B                 ; 2³
    sta    ram_F1,X              ; 4
LF66B:
    dex                          ; 2
    bpl    LF5F8                 ; 2³+1
    jsr    LF93A                 ; 6
    ldx    #$00                  ; 2
    lda    ram_CD                ; 3
    jsr    LF80A                 ; 6
    pha                          ; 3
    lda    ram_CF                ; 3
    clc                          ; 2
    adc    #$06                  ; 2
    jsr    LF80A                 ; 6
    pha                          ; 3
    lda    ram_D3                ; 3
    sec                          ; 2
    sbc    #$06                  ; 2
    jsr    LF80A                 ; 6
    pha                          ; 3
    ldx    #$04                  ; 2
    lda    ram_D3                ; 3
    sec                          ; 2
    sbc    #$03                  ; 2
    jsr    LF80A                 ; 6
    pha                          ; 3
    ldx    #$00                  ; 2
    lda    ram_D2                ; 3
    sec                          ; 2
    sbc    #$06                  ; 2
    jsr    LF80A                 ; 6
    pha                          ; 3

  IF ORIGINAL
    bit    INPT0                 ; 3
    bmi    LF6AB                 ; 2³
    lda    ram_D6                ; 3
    and    #$F0                  ; 2
    sta    ram_D6                ; 3
LF6AB:
    bit    INPT2                 ; 3
    bmi    LF6B5                 ; 2³
    lda    ram_D7                ; 3
    and    #$F0                  ; 2
    sta    ram_D7                ; 3

  ELSE

    NOP  ; free byte
    NOP  ; free byte  2
    NOP  ; free byte
    NOP  ; free byte  4
    NOP  ; free byte
    NOP  ; free byte  6
    NOP  ; free byte
    NOP  ; free byte  8
    NOP  ; free byte
    NOP  ; free byte  10
    NOP  ; free byte
    NOP  ; free byte  12
    NOP  ; free byte
    NOP  ; free byte  14
    NOP  ; free byte
    NOP  ; free byte  16
    NOP  ; free byte
    NOP  ; free byte  18
    NOP  ; free byte
    NOP  ; free byte  20

  ENDIF

LF6B5:
    lda    #$80                  ; 2
    sta    VBLANK                ; 3
    lda    #$00                  ; 2
    sta    VBLANK                ; 3
    lda    #$EE                  ; 2
    sta    SWCHA                 ; 4
    sta    HMCLR                 ; 3
    lda    #$12                  ; 2
    sta    CTRLPF                ; 3
    lda    ram_97                ; 3
    and    #$1C                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LFDE8,X               ; 4
    ora    #$40                  ; 2
    sta    COLUPF                ; 3
    ldx    #$00                  ; 2
    lda    ram_D6                ; 3
    and    #$01                  ; 2
    beq    LF6E0                 ; 2³
    ldx    #$02                  ; 2
LF6E0:
    stx    ENABL                 ; 3
    lda    ram_D7                ; 3
    and    #$01                  ; 2
    beq    LF6ED                 ; 2³
    lda    LFE6C                 ; 4
    sta    ram_C9                ; 3
LF6ED:
    lda    ram_A3                ; 3
    and    #$03                  ; 2
    tax                          ; 2
    lda    LFDD8,X               ; 4
    sta    ram_F3                ; 3
    lda    LFDDC,X               ; 4
    sta    ram_F4                ; 3
LF6FC:
    lda    INTIM                 ; 4
    bne    LF6FC                 ; 2³+1
    jmp    LFFF0                 ; 3


START_1:
    sei                          ; 2
    cld                          ; 2
    lda    #$00                  ; 2
    tax                          ; 2
LF709:
    sta    VSYNC,X               ; 4
    inx                          ; 2
    bne    LF709                 ; 2³
    dex                          ; 2
    txs                          ; 2

  IF ORIGINAL
    stx    SWACNT                ; 4
  ELSE
    NOP
    NOP
    NOP
  ENDIF

    stx    ram_92                ; 3
    inx                          ; 2
    stx    ram_97                ; 3
    stx    ram_9B                ; 3
    stx    ram_90                ; 3
    stx    ram_D2                ; 3
    inx                          ; 2
    stx    ram_9F                ; 3
    stx    ram_D4                ; 3
    lda    #$03                  ; 2
    sta    ram_A7                ; 3
    lda    LFE6D                 ; 4
    sta    ram_C8                ; 3
    lda    LFE6B                 ; 4
    sta    ram_C7                ; 3
    sta    ram_C9                ; 3
    lda    LFE76                 ; 4
    sta    ram_C5                ; 3
    lda    LFE6E                 ; 4
    sta    ram_C4                ; 3
    sta    ram_C6                ; 3
    lda    #$42                  ; 2
    sta    ram_A3                ; 3
    jmp    LF003                 ; 3

LF746:
    lda    SWCHB                 ; 4
    ror                          ; 2
    bcc    LF7C5                 ; 2³
    ror                          ; 2
    bcc    LF755                 ; 2³
    ldx    #$03                  ; 2
    stx    ram_A7                ; 3
LF753:
    sec                          ; 2
    rts                          ; 6

LF755:
    dec    ram_A7                ; 5
    lda    ram_A7                ; 3
    cmp    #$03                  ; 2
    bcs    LF753                 ; 2³
    cmp    #$02                  ; 2
    beq    LF776                 ; 2³
    cmp    #$01                  ; 2
    beq    LF79D                 ; 2³
    jsr    LFAB6                 ; 6
    ldx    ram_9F                ; 3
    lda    LFE7D,X               ; 4
    sta    ram_F5                ; 3
    lda    #$1E                  ; 2
    sta    ram_A7                ; 3
    jmp    LF7BF                 ; 3

LF776:
    ldx    ram_9F                ; 3
    lda    ram_A3                ; 3
    and    #$10                  ; 2
    beq    LF785                 ; 2³
    inx                          ; 2
    cpx    #$13                  ; 2
    bne    LF785                 ; 2³
    ldx    #$01                  ; 2
LF785:
    stx    ram_9F                ; 3
    lda    LFFB0,X               ; 4
    and    #$80                  ; 2
    ora    #$10                  ; 2
    sta    ram_A3                ; 3
    ldx    ram_9F                ; 3
    lda    LFE7D,X               ; 4
    sta    ram_F5                ; 3
    jsr    LF95A                 ; 6
    jmp    LF7BF                 ; 3

LF79D:
    jsr    LFA76                 ; 6
    clc                          ; 2
    ldx    #$00                  ; 2
    stx    ram_DB                ; 3
    stx    ram_DD                ; 3
    stx    ram_DF                ; 3
    ldy    ram_9F                ; 3
    lda    LFFB0,Y               ; 4
    tay                          ; 2
    and    #$0F                  ; 2
    adc    #$36                  ; 2
    sta    ram_D9                ; 3
    tya                          ; 2
    bpl    LF7B9                 ; 2³
    inx                          ; 2
LF7B9:
    inx                          ; 2
    txa                          ; 2
    adc    #$36                  ; 2
    sta    ram_E1                ; 3
LF7BF:
    lda    #$00                  ; 2
    sta    ram_F7                ; 3
    beq    LF7F5                 ; 2³
LF7C5:
    dec    ram_A7                ; 5
    lda    ram_A7                ; 3
    cmp    #$03                  ; 2
    bcs    LF753                 ; 2³
    cmp    #$02                  ; 2
    beq    LF7E2                 ; 2³
    cmp    #$01                  ; 2
    beq    LF7EE                 ; 2³
    jsr    LFAB6                 ; 6
    ldx    #$1E                  ; 2
    stx    ram_A7                ; 3
    lda    #$36                  ; 2
    sta    ram_F6                ; 3
    bne    LF7F1                 ; 2³
LF7E2:
    jsr    LF95A                 ; 6
    lda    ram_A3                ; 3
    and    #$8F                  ; 2
    sta    ram_A3                ; 3
    jmp    LF7F1                 ; 3

LF7EE:
    jsr    LFA76                 ; 6
LF7F1:
    lda    #$06                  ; 2
    sta    ram_F7                ; 3
LF7F5:
    lda    #$00                  ; 2
    sta    ram_9B                ; 3
    clc                          ; 2
    rts                          ; 6

LF7FB:
    lda    ram_F8                ; 3
LF7FD:
    tay                          ; 2
    clc                          ; 2
    lda.wy ram_D6,Y              ; 4
    and    LFE5B,X               ; 4
    beq    LF808                 ; 2³
    sec                          ; 2
LF808:
    tya                          ; 2
    rts                          ; 6

LF80A:
    ldy    #$FF                  ; 2
    cmp    #$52                  ; 2
    bcc    LF814                 ; 2³
    sbc    #$4B                  ; 2
    ldy    #$04                  ; 2
LF814:
    cpx    #$02                  ; 2
    adc    #$02                  ; 2
LF818:
    iny                          ; 2
    sbc    #$0F                  ; 2
    bcs    LF818                 ; 2³
    eor    #$FF                  ; 2
    sbc    #$06                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    ram_F3                ; 3
    tya                          ; 2
    and    #$0F                  ; 2
    ora    ram_F3                ; 3
    rts                          ; 6

LF82D:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMP0,X                ; 4
    and    #$0F                  ; 2
    tay                          ; 2
    jmp    LF837                 ; 3

LF837:
    nop                          ; 2
    nop                          ; 2
LF839:
    dey                          ; 2
    bpl    LF839                 ; 2³
    sta    RESP0,X               ; 4
    rts                          ; 6

LF83F:
    cmp.wy ram_D4,Y              ; 4
    beq    LF854                 ; 2³
    clc                          ; 2
    adc    #$1A                  ; 2
    cmp    #$35                  ; 2
    bcc    LF84D                 ; 2³
    sbc    #$34                  ; 2
LF84D:
    cmp.wy ram_D4,Y              ; 4
    beq    LF854                 ; 2³
    clc                          ; 2
    rts                          ; 6

LF854:
    sec                          ; 2
    rts                          ; 6

LF856:
    ldy    ram_F8                ; 3
    lda.wy ram_E6,Y              ; 4
    tay                          ; 2
    lsr                          ; 2
    tya                          ; 2
    and    #$F8                  ; 2
    adc    #$07                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    rts                          ; 6

LF866:
    tay                          ; 2
    lda    LFF4B,Y               ; 4
    sta    ram_F3                ; 3
    lda    LFF00,Y               ; 4
    sta    ram_F4                ; 3
    tya                          ; 2
    rts                          ; 6

LF873:
    ror                          ; 2
    txa                          ; 2
    rol                          ; 2
    rol                          ; 2
    tax                          ; 2
    lda    ram_A8,X              ; 4
    sta    ram_F3                ; 3
    lda    ram_A9,X              ; 4
    sta    ram_F4                ; 3
    rts                          ; 6

LF881:
    lda    ram_97                ; 3
    ror                          ; 2
    lda    #$04                  ; 2
    rol                          ; 2
    tax                          ; 2
LF888:
    lda    ram_D8,X              ; 4
    cmp    #$80                  ; 2
    bcs    LF894                 ; 2³
    dex                          ; 2
    dex                          ; 2
    bpl    LF888                 ; 2³
    clc                          ; 2
    rts                          ; 6

LF894:
    and    #$7F                  ; 2
    tay                          ; 2
    txa                          ; 2
    lsr                          ; 2
    tax                          ; 2
    tya                          ; 2
    sec                          ; 2
    rts                          ; 6

LF89D:
    lda    ram_97                ; 3
    ror                          ; 2
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFF99,Y               ; 4
    and    #$04                  ; 2
    bne    LF8AB                 ; 2³
    rts                          ; 6

LF8AB:
    lda    #$01                  ; 2
    rol                          ; 2
    tax                          ; 2
    and    #$01                  ; 2
    tay                          ; 2
LF8B2:
    lda    ram_CC,X              ; 4
    cmp    LFE5F,X               ; 4
    beq    LF8C1                 ; 2³
    cmp    LFE63,X               ; 4
    beq    LF8C1                 ; 2³
    jmp    LF8CA                 ; 3

LF8C1:
    lda.wy ram_D0,Y              ; 4
    eor    LFE4F,X               ; 4
    sta.wy ram_D0,Y              ; 5
LF8CA:
    lda.wy ram_D0,Y              ; 4
    and    LFE4F,X               ; 4
    bne    LF8D7                 ; 2³
    dec    ram_CC,X              ; 6
    jmp    LF8D9                 ; 3

LF8D7:
    inc    ram_CC,X              ; 6
LF8D9:
    dex                          ; 2
    dex                          ; 2
    bpl    LF8B2                 ; 2³
    rts                          ; 6

LF8DE:
    lda    ram_97                ; 3
    lsr                          ; 2
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFF99,Y               ; 4
    and    #$08                  ; 2
    bne    LF8EC                 ; 2³
    rts                          ; 6

LF8EC:
    txa                          ; 2
    clc                          ; 2
    adc    #$08                  ; 2
    tax                          ; 2
LF8F1:
    txa                          ; 2
    lsr                          ; 2
    tay                          ; 2
    txa                          ; 2
    asl                          ; 2
    tax                          ; 2
    lsr                          ; 2
    and    #$01                  ; 2
    sta    ram_F3                ; 3
    lda    ram_94,X              ; 4
    cmp    #$32                  ; 2
    beq    LF90E                 ; 2³
    cmp    #$44                  ; 2
    beq    LF90E                 ; 2³
    lda    ram_F3                ; 3
    stx    ram_F3                ; 3
    tax                          ; 2
    jmp    LF91A                 ; 3

LF90E:
    lda    ram_F3                ; 3
    stx    ram_F3                ; 3
    tax                          ; 2
    lda    ram_D0,X              ; 4
    eor    LFE53,Y               ; 4
    sta    ram_D0,X              ; 4
LF91A:
    lda    ram_D0,X              ; 4
    and    LFE53,Y               ; 4
    bne    LF92A                 ; 2³
    ldx    ram_F3                ; 3
    dec    ram_80,X              ; 6
    dec    ram_94,X              ; 6
    jmp    LF930                 ; 3

LF92A:
    ldx    ram_F3                ; 3
    inc    ram_80,X              ; 6
    inc    ram_94,X              ; 6
LF930:
    txa                          ; 2
    lsr                          ; 2
    tax                          ; 2
    dex                          ; 2
    dex                          ; 2
    bpl    LF8F1                 ; 2³+1
    inx                          ; 2
    inx                          ; 2
    rts                          ; 6

LF93A:
    ldx    ram_F8                ; 3
    lda    ram_9F                ; 3
    cmp    #$0E                  ; 2
    bcs    LF959                 ; 2³
    lda    ram_E6,X              ; 4
    bne    LF959                 ; 2³
    lda    ram_D4,X              ; 4
    beq    LF959                 ; 2³
    lda    ram_D6,X              ; 4
    ror                          ; 2
    bcc    LF959                 ; 2³
    rol                          ; 2
    and    #$FE                  ; 2
    sta    ram_D6,X              ; 4
    lda    #$04                  ; 2
    jsr    LFD63                 ; 6
LF959:
    rts                          ; 6

LF95A:
    ldy    ram_9F                ; 3
    lda    LFEC0,Y               ; 4
    sta    ram_ED                ; 3
    and    #$03                  ; 2
    tay                          ; 2
    lda    LFEE8,Y               ; 4
    sta    ram_F3                ; 3
    lda    LFEEC,Y               ; 4
    sta    ram_F4                ; 3
    jmp.ind ($00F3)              ; 5

    ldx    #$03                  ; 2
    lda    #$35                  ; 2
LF975:
    sta    ram_E2,X              ; 4
    dex                          ; 2
    bpl    LF975                 ; 2³
    jmp    LF9B8                 ; 3

    lda    ram_F5                ; 3
    jsr    LFB6C                 ; 6
    ldx    #$03                  ; 2
LF984:
    sta    ram_E2,X              ; 4
    dex                          ; 2
    bpl    LF984                 ; 2³
    sta    ram_F5                ; 3
    jmp    LF9B8                 ; 3

    ldx    #$00                  ; 2
    lda    ram_F5                ; 3
LF992:
    jsr    LFB6C                 ; 6
    sta    ram_E2,X              ; 4
    inx                          ; 2
    cpx    #$04                  ; 2
    bne    LF992                 ; 2³
    sta    ram_F5                ; 3
    jmp    LF9B8                 ; 3

    ldx    #$03                  ; 2
LF9A3:
    jsr    LFC93                 ; 6
    jsr    LFC82                 ; 6
    bit    ram_ED                ; 3
    bmi    LF9B0                 ; 2³
    clc                          ; 2
    adc    #$1A                  ; 2
LF9B0:
    sta    ram_E2,X              ; 4
    dex                          ; 2
    bpl    LF9A3                 ; 2³
    jmp    LF9B8                 ; 3

LF9B8:
    lda    #$01                  ; 2
    sta    ram_EE                ; 3
LF9BC:
    lda    ram_EE                ; 3
    ror                          ; 2
    lda    ram_9F                ; 3
    rol                          ; 2
    tay                          ; 2
    lda    LFE9B,Y               ; 4
    sta    ram_ED                ; 3
    and    #$03                  ; 2
    tay                          ; 2
    lda    LFEE0,Y               ; 4
    sta    ram_F3                ; 3
    lda    LFEE4,Y               ; 4
    sta    ram_F4                ; 3
    jmp.ind ($00F3)              ; 5

    ldx    #$04                  ; 2
LF9DA:
    lda    ram_EE                ; 3
    ldy    #$00                  ; 2
    jsr    LFD58                 ; 6
    dex                          ; 2
    bpl    LF9DA                 ; 2³
    jmp    LFA52                 ; 3

    ldx    #$03                  ; 2
LF9E9:
    lda    ram_EE                ; 3
    ldy    ram_E2                ; 3
    jsr    LFD58                 ; 6
    dex                          ; 2
    bpl    LF9E9                 ; 2³
    ldx    #$04                  ; 2
    lda    ram_EE                ; 3
    ldy    #$00                  ; 2
    jsr    LFD58                 ; 6
    jmp    LFA52                 ; 3

    jsr    LFC93                 ; 6
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFFCD,Y               ; 4
    sta    ram_F3                ; 3
    ldx    #$03                  ; 2
LFA0C:
    lda    ram_F3                ; 3
    and    #$03                  ; 2
    tay                          ; 2
    lda.wy ram_E2,Y              ; 4
    bit    ram_ED                ; 3
    bpl    LFA1E                 ; 2³
    cmp    #$1B                  ; 2
    bcc    LFA1E                 ; 2³
    sbc    #$1A                  ; 2
LFA1E:
    tay                          ; 2
    lda    ram_EE                ; 3
    jsr    LFD58                 ; 6
    lsr    ram_F3                ; 5
    lsr    ram_F3                ; 5
    dex                          ; 2
    bpl    LFA0C                 ; 2³
    ldx    #$04                  ; 2
    lda    ram_EE                ; 3
    ldy    #$00                  ; 2
    jsr    LFD58                 ; 6
    jmp    LFA52                 ; 3

    ldx    #$04                  ; 2
LFA39:
    jsr    LFC93                 ; 6
    jsr    LFC82                 ; 6
    bit    ram_ED                ; 3
    bmi    LFA46                 ; 2³
    clc                          ; 2
    adc    #$1A                  ; 2
LFA46:
    tay                          ; 2
    lda    ram_EE                ; 3
    jsr    LFD58                 ; 6
    dex                          ; 2
    bpl    LFA39                 ; 2³
    jmp    LFA52                 ; 3

LFA52:
    dec    ram_EE                ; 5
    bmi    LFA59                 ; 2³
    jmp    LF9BC                 ; 3

LFA59:
    ldy    ram_9F                ; 3
    lda    LFEC0,Y               ; 4
    and    #$40                  ; 2
    beq    LFA6B                 ; 2³
    ldx    #$03                  ; 2
    lda    #$35                  ; 2
LFA66:
    sta    ram_E2,X              ; 4
    dex                          ; 2
    bpl    LFA66                 ; 2³
LFA6B:
    lda    #$00                  ; 2
    sta    ENABL                 ; 3
    lda    ram_A3                ; 3
    ora    #$03                  ; 2
    sta    ram_A3                ; 3
    rts                          ; 6

LFA76:
    lda    #$4E                  ; 2
    sta    ram_D2                ; 3
    sta    ram_D3                ; 3
    ldx    #$03                  ; 2
LFA7E:
    lda    ram_E2,X              ; 4
    jsr    LF866                 ; 6
    txa                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda    ram_F3                ; 3
    clc                          ; 2
    adc    #$02                  ; 2
    sta    ram_B8,X              ; 4
    lda    ram_F4                ; 3
    sta    ram_B9,X              ; 4
    txa                          ; 2
    lsr                          ; 2
    tax                          ; 2
    dex                          ; 2
    bpl    LFA7E                 ; 2³
    inx                          ; 2
    txa                          ; 2
    inx                          ; 2
LFA9A:
    sta    ram_F1,X              ; 4
    sta    AUDV0,X               ; 4
    sta    ram_E6,X              ; 4
    dex                          ; 2
    bpl    LFA9A                 ; 2³
    lda    LFF96                 ; 4
    sta    ram_E9                ; 3
    lda    LFF97                 ; 4
    sta    ram_E8                ; 3
    lda    LFF98                 ; 4
    clc                          ; 2
    adc    #$0C                  ; 2
    sta    ram_EA                ; 3
    rts                          ; 6

LFAB6:
    ldx    #$0E                  ; 2
    lda    LFF4B                 ; 4
    ldy    LFF00                 ; 4
LFABE:
    sta    ram_A8,X              ; 4
    sty    ram_A9,X              ; 4
    dex                          ; 2
    dex                          ; 2
    bpl    LFABE                 ; 2³
    ldx    #$09                  ; 2
LFAC8:
    lda    ram_D8,X              ; 4
    jsr    LF866                 ; 6
    cmp    #$36                  ; 2
    bcc    LFAD5                 ; 2³
    lda    #$F8                  ; 2
    bne    LFADA                 ; 2³
LFAD5:
    jsr    LFC93                 ; 6
    ora    #$F0                  ; 2
LFADA:
    tay                          ; 2
    clc                          ; 2
    adc    ram_F3                ; 3
    sta    ram_F3                ; 3
    txa                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda    ram_F3                ; 3
    sta    ram_80,X              ; 4
    lda    ram_F4                ; 3
    sta    ram_81,X              ; 4
    tya                          ; 2
    clc                          ; 2
    adc    #$44                  ; 2
    sta    ram_F3                ; 3
    lda    ram_F3                ; 3
    sta    ram_94,X              ; 4
    txa                          ; 2
    lsr                          ; 2
    tax                          ; 2
    dex                          ; 2
    bpl    LFAC8                 ; 2³
    lda    #$55                  ; 2
    sta    ram_D0                ; 3
    lda    #$95                  ; 2
    sta    ram_D1                ; 3
    lda    #$4E                  ; 2
    sta    ram_CC                ; 3
    lda    #$0E                  ; 2
    sta    ram_CE                ; 3
    lda    #$4F                  ; 2
    sta    ram_CD                ; 3
    lda    #$0B                  ; 2
    sta    ram_CF                ; 3
    ldx    #$00                  ; 2
    stx    ram_D6                ; 3
    bit    ram_A3                ; 3
    bmi    LFB1D                 ; 2³
    ldx    #$F0                  ; 2
LFB1D:
    stx    ram_D7                ; 3
    lda    #$50                  ; 2
    sta    ram_C9                ; 3
    lda    #$DB                  ; 2
    sta    ram_95                ; 3
    sta    ram_99                ; 3
    sta    ram_9D                ; 3
    sta    ram_A1                ; 3
    sta    ram_A5                ; 3
    ldx    #$01                  ; 2
LFB31:
    lda    #$00                  ; 2
    sta    ram_D4,X              ; 4
    jsr    LF866                 ; 6
    txa                          ; 2
    jsr    LFD8C                 ; 6
    tax                          ; 2
    dex                          ; 2
    bpl    LFB31                 ; 2³
    ldy    #$00                  ; 2
    ldx    ram_9F                ; 3
    lda    LFEC0,X               ; 4
    and    #$3C                  ; 2
    beq    LFB55                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_EE                ; 3
    lda    #$43                  ; 2
    sta    ram_ED                ; 3
    lda    #$3F                  ; 2
LFB55:
    tay                          ; 2
    lda    LFF4B,Y               ; 4
    clc                          ; 2
    adc    #$02                  ; 2
    sta    ram_EB                ; 3
    lda    LFF00,Y               ; 4
    sta    ram_EC                ; 3
    sta    CXCLR                 ; 3
    lda    ram_A3                ; 3
    and    #$FC                  ; 2
    sta    ram_A3                ; 3
    rts                          ; 6

LFB6C:
    clc                          ; 2
    adc    #$01                  ; 2
    cmp    #$1B                  ; 2
    beq    LFB85                 ; 2³
    cmp    #$35                  ; 2
    beq    LFB85                 ; 2³
    cmp    #$FF                  ; 2
    bne    LFB7E                 ; 2³
    lda    #$01                  ; 2
    rts                          ; 6

LFB7E:
    cmp    #$FE                  ; 2
    bne    LFB84                 ; 2³
    lda    #$1B                  ; 2
LFB84:
    rts                          ; 6

LFB85:
    sec                          ; 2
    sbc    #$1A                  ; 2
    rts                          ; 6

LFB89:
    ldx    ram_F8                ; 3
    lda    ram_D2,X              ; 4
    ldx    #$00                  ; 2
LFB8F:
    cmp    LFFA9,X               ; 4
    bcc    LFB9E                 ; 2³
    cmp    LFFAD,X               ; 4
    bcc    LFBA0                 ; 2³
    inx                          ; 2
    cpx    #$04                  ; 2
    bcc    LFB8F                 ; 2³
LFB9E:
    clc                          ; 2
    rts                          ; 6

LFBA0:
    sec                          ; 2
    rts                          ; 6

LFBA2:
    ldy    #$03                  ; 2
LFBA4:
    ldx    LFFC3,Y               ; 4
    lda    LFF00,X               ; 4
    cmp    ram_F4                ; 3
    beq    LFBD7                 ; 2³
    dey                          ; 2
    bpl    LFBA4                 ; 2³
    ldx    #$00                  ; 2
    lda    LFF00,X               ; 4
    cmp    ram_F4                ; 3
    bne    LFBC1                 ; 2³
    lda    LFF4B,X               ; 4
    cmp    ram_F3                ; 3
    beq    LFBF3                 ; 2³
LFBC1:
    ldx    #$4A                  ; 2
LFBC3:
    lda    LFF00,X               ; 4
    cmp    ram_F4                ; 3
    bne    LFBD1                 ; 2³
    lda    LFF4B,X               ; 4
    cmp    ram_F3                ; 3
    beq    LFBF3                 ; 2³
LFBD1:
    dex                          ; 2
    cpx    #$34                  ; 2
    bpl    LFBC3                 ; 2³
    brk                          ; 7
LFBD7:
    lda    LFF4B,X               ; 4
    cmp    ram_F3                ; 3
    beq    LFBF3                 ; 2³
    bcs    LFBE4                 ; 2³
    txa                          ; 2
    adc    #$07                  ; 2
    tax                          ; 2
LFBE4:
    dex                          ; 2
    ldy    #$06                  ; 2
LFBE7:
    lda    LFF4B,X               ; 4
    cmp    ram_F3                ; 3
    beq    LFBF3                 ; 2³
    dex                          ; 2
    dey                          ; 2
    bne    LFBE7                 ; 2³
    brk                          ; 7
LFBF3:
    txa                          ; 2
    rts                          ; 6

LFBF5:
    lda    ram_A3                ; 3
    and    #$13                  ; 2
    bne    LFC73                 ; 2³+1
    lda    ram_F7                ; 3
    bne    LFC73                 ; 2³+1
    ldy    ram_F8                ; 3
    lda.wy ram_D0,Y              ; 4
    and    #$20                  ; 2
    bne    LFC73                 ; 2³

  IF ORIGINAL

    lda    ram_F8                ; 3
    bne    LFC3F                 ; 2³
    lda    ram_E6                ; 3
    bne    LFC73                 ; 2³
    ldy    LFE3B,X               ; 4
    bit    INPT0                 ; 3
    bmi    LFC20                 ; 2³
    lda    ram_D6                ; 3
    and    #$F0                  ; 2
    ora    LFE42,Y               ; 4   P0 LEFT, ora $08 ($FE46), goto LFC73
    sta    ram_D6                ; 3
LFC20:
    iny                          ; 2
    bit    INPT1                 ; 3
    bmi    LFC2E                 ; 2³
    lda    ram_D6                ; 3
    and    #$F0                  ; 2
    ora    LFE42,Y               ; 4   P0 UP, ora $01 ($FE44), goto LFC73
    sta    ram_D6                ; 3   P0 DOWN, ora $02 ($FE4A), goto LFC73
LFC2E:
    iny                          ; 2
    bit    INPT4                 ; 3
    bmi    LFC73                 ; 2³
    lda    ram_D6                ; 3
    and    #$F0                  ; 2
    ora    LFE42,Y               ; 4   P0 RIGHT, ora $04 ($FE48), goto LFC73
    sta    ram_D6                ; 3
    jmp    LFC73                 ; 3
LFC3F:
    bit    ram_A3                ; 3
    bpl    LFC73                 ; 2³
    lda    ram_E7                ; 3
    bne    LFC73                 ; 2³
    ldy    LFE3B,X               ; 4
    bit    INPT2                 ; 3
    bmi    LFC57                 ; 2³
    lda    ram_D7                ; 3
    and    #$F0                  ; 2
    ora    LFE90,Y               ; 4   P1 LEFT, ora $08 ($FE94), goto LFC73
    sta    ram_D7                ; 3
LFC57:
    iny                          ; 2
    bit    INPT3                 ; 3
    bmi    LFC65                 ; 2³
    lda    ram_D7                ; 3
    and    #$F0                  ; 2
    ora    LFE90,Y               ; 4   P1 UP, ora $02 ($FE92), goto LFC73
    sta    ram_D7                ; 3   P1 DOWN, ora $01 ($FE98), goto LFC73
LFC65:
    iny                          ; 2
    bit    INPT5                 ; 3
    bmi    LFC73                 ; 2³
    lda    ram_D7                ; 3
    and    #$F0                  ; 2   P1 RIGHT, ora $04 ($FE96), goto LFC73
    ora    LFE90,Y               ; 4
    sta    ram_D7                ; 3

  ELSE

    LDA    SWCHA
    LDY    ram_F8
    BNE    .doP1      ; if P1 then branch
    ASL
    LDY    #$04       ; right P0
    BCC    .finishP0
    ASL
    LDY    #$08       ; left P0
    BCC    .finishP0
    ASL
    LDY    #$02       ; down P0
    BCC    .finishP0
    ASL
    DEY               ; Y=1, up P0
    BCC    .finishP0
    BCS    .exit      ; always branch

.finishP0:
    LDA    ram_D6
    AND    #$F0
    STA    ram_D6
    TYA
    ORA    ram_D6
    STA    ram_D6
    BNE    .exit

.doP1:
    BIT    ram_A3
    BPL    .exit
    ASL
    ASL
    ASL
    LDY    #$04       ; right P1
    ASL
    BPL    .finishP1
    LDY    #$08       ; left P1
    ASL
    BPL    .finishP1
    LDY    #$01       ; down P1
    ASL
    BPL    .finishP1
    INY               ; Y=2, up P1
    ASL
    BPL    .finishP1
    BMI    .exit      ; always branch

    NOP  ; free byte
    NOP  ; free byte  2
    NOP  ; free byte
    NOP  ; free byte  4
    NOP  ; free byte
    NOP  ; free byte  6
    NOP  ; free byte
    NOP  ; free byte  8
    NOP  ; free byte
    NOP  ; free byte  10
    NOP  ; free byte
    NOP  ; free byte  12
    NOP  ; free byte
    NOP  ; free byte  14
    NOP  ; free byte
    NOP  ; free byte  16
    NOP  ; free byte
    NOP  ; free byte  18
    NOP  ; free byte
    NOP  ; free byte  20
    NOP  ; free byte
    NOP  ; free byte  22
    NOP  ; free byte
    NOP  ; free byte  24
    NOP  ; free byte
    NOP  ; free byte  26
    NOP  ; free byte

.finishP1:
    LDA    ram_D7
    AND    #$F0
    STA    ram_D7
    TYA
    ORA    ram_D7
    STA    ram_D7
.exit:

  ENDIF

     ORG $1C73
    RORG $FC73

LFC73:
    ldy    #$80                  ; 2
    sty    VBLANK                ; 3
    ldy    #$00                  ; 2
    sty    VBLANK                ; 3
    ldy    LFE3F,X               ; 4
    sty    SWCHA                 ; 4
    rts                          ; 6

LFC82:
    lsr                          ; 2
    and    #$1F                  ; 2
    clc                          ; 2
    adc    #$01                  ; 2
    cmp    #$1B                  ; 2
    bcc    LFC92                 ; 2³
    sbc    #$1A                  ; 2
    tay                          ; 2
    lda    LFFC6,Y               ; 4
LFC92:
    rts                          ; 6

LFC93:
    lda    ram_CA                ; 3
    ldy    ram_CB                ; 3
    eor    LF003,Y               ; 4
    eor    LF746,Y               ; 4
    asl                          ; 2
    adc    #$00                  ; 2
    iny                          ; 2
    sty    ram_CB                ; 3
    eor    ram_9B                ; 3
    eor    ram_97                ; 3
    sta    ram_CA                ; 3
    rts                          ; 6

LFCAA:
    lda    ram_E6,X              ; 4
    bne    LFCF0                 ; 2³
    lda    ram_D6,X              ; 4
    and    #$0C                  ; 2
    beq    LFCF0                 ; 2³
    ldy    #$00                  ; 2
    sty    ram_9B                ; 3
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    ram_D2,X              ; 4
    cmp    LFE66,Y               ; 4
    bne    LFCCB                 ; 2³
    lda    ram_D6,X              ; 4
    and    #$F3                  ; 2
    sta    ram_D6,X              ; 4
    jmp    LFCF0                 ; 3

LFCCB:
    lda    ram_D0,X              ; 4
    ora    #$20                  ; 2
    sta    ram_D0,X              ; 4
    lda    LFE68,Y               ; 4
    sta    ram_F3                ; 3
    lda    ram_97                ; 3
    lsr                          ; 2
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LFF99,Y               ; 4
    and    #$08                  ; 2
    bne    LFCE6                 ; 2³
    jmp    LFCF0                 ; 3

LFCE6:
    lda    ram_D2,X              ; 4
    clc                          ; 2
    adc    ram_F3                ; 3
    sta    ram_D2,X              ; 4
    jmp    LFCF0                 ; 3

LFCF0:
    lda    ram_D6,X              ; 4
    and    #$0C                  ; 2
    beq    LFD04                 ; 2³+1
    lda    ram_97                ; 3
    and    #$07                  ; 2
    sta    ram_F3                ; 3
    lda    #$06                  ; 2
    jsr    LFD63                 ; 6
    jmp    LFD0C                 ; 3

LFD04:
    lda    ram_97                ; 3
    and    #$1C                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_F3                ; 3
LFD0C:
    txa                          ; 2
    tay                          ; 2
    asl                          ; 2
    tax                          ; 2
    lda.wy ram_D6,Y              ; 4
    and    #$03                  ; 2
    beq    LFD3B                 ; 2³
    cmp    LFE53,Y               ; 4
    beq    LFD24                 ; 2³
    lda    LFE6C                 ; 4
    sta    ram_C7,X              ; 4
    jmp    LFD29                 ; 3

LFD24:
    lda    LFE6B                 ; 4
    sta    ram_C7,X              ; 4
LFD29:
    lda    #$00                  ; 2
    sta    ram_9B                ; 3
    stx    ram_F4                ; 3
    tya                          ; 2
    tax                          ; 2
    lda    #$04                  ; 2
    jsr    LFD63                 ; 6
    ldx    ram_F4                ; 3
    jmp    LFD40                 ; 3

LFD3B:
    lda    LFE6B                 ; 4
    sta    ram_C7,X              ; 4
LFD40:
    bit    ram_A3                ; 3
    bmi    LFD4D                 ; 2³
    lda    ram_F8                ; 3
    beq    LFD4D                 ; 2³
    lda    #$50                  ; 2
    sta    ram_C9                ; 3
    rts                          ; 6

LFD4D:
    ldy    ram_F3                ; 3
    lda    LFE6E,Y               ; 4
    sta    ram_C4,X              ; 4
    rts                          ; 6

LFD55:
    tay                          ; 2
    lda    ram_97                ; 3
LFD58:
    ror                          ; 2
    txa                          ; 2
    rol                          ; 2
    tax                          ; 2
    sty    ram_D8,X              ; 4
    txa                          ; 2
    ror                          ; 2
    tax                          ; 2
    tya                          ; 2
    rts                          ; 6

LFD63:
    cmp    ram_F1,X              ; 4
    bcc    LFD72                 ; 2³
    beq    LFD72                 ; 2³
    sta    ram_F1,X              ; 4
    tay                          ; 2
    lda    LFDEF,Y               ; 4
    sta    ram_EF,X              ; 4
    tya                          ; 2
LFD72:
    rts                          ; 6

LFD73:
    lda    ram_97                ; 3
    ror                          ; 2
    txa                          ; 2
    rol                          ; 2
    rol                          ; 2
    tax                          ; 2
    lda    ram_F3                ; 3
    sta    ram_80,X              ; 4
    lda    ram_F4                ; 3
    sta    ram_81,X              ; 4
    txa                          ; 2
    ror                          ; 2
    ror                          ; 2
    tax                          ; 2
    lda    #$00                  ; 2
    rol                          ; 2
    rts                          ; 6

LFD8A:
    lda    ram_F8                ; 3
LFD8C:
    asl                          ; 2
    tax                          ; 2
    lda    ram_F3                ; 3
    sta    ram_C0,X              ; 4
    lda    ram_F4                ; 3
    sta    ram_C1,X              ; 4
    txa                          ; 2
    ror                          ; 2
    rts                          ; 6

LFD99:
    lda    ram_97                ; 3
    ror                          ; 2
    txa                          ; 2
    rol                          ; 2
    rol                          ; 2
    tax                          ; 2
    lda    ram_F3                ; 3
    sta    ram_A8,X              ; 4
    lda    ram_F4                ; 3
    sta    ram_A9,X              ; 4
    txa                          ; 2
    ror                          ; 2
    ror                          ; 2
    tax                          ; 2
    lda    #$00                  ; 2
    rol                          ; 2
    rts                          ; 6

LFDB0:
    lda    ram_97                ; 3
    ror                          ; 2
    txa                          ; 2
    rol                          ; 2
    rol                          ; 2
    tay                          ; 2
    lda.wy ram_94,Y              ; 4
    sec                          ; 2
    sbc    #$44                  ; 2
    rts                          ; 6

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
    .byte $00 ; |        | $FDC8
    .byte $00 ; |        | $FDC9
    .byte $00 ; |        | $FDCA
    .byte $00 ; |        | $FDCB
    .byte $00 ; |        | $FDCC
    .byte $00 ; |        | $FDCD
    .byte $00 ; |        | $FDCE
    .byte $00 ; |        | $FDCF
LFDD0:
    .byte $01 ; |       X| $FDD0
    .byte $02 ; |      X | $FDD1
    .byte $03 ; |      XX| $FDD2
    .byte $04 ; |     X  | $FDD3
    .byte $05 ; |     X X| $FDD4
    .byte $04 ; |     X  | $FDD5
    .byte $03 ; |      XX| $FDD6
    .byte $02 ; |      X | $FDD7
LFDD8:
    .byte $F2 ; |XXXX  X | $FDD8
    .byte $18 ; |   XX   | $FDD9
    .byte $E7 ; |XXX  XXX| $FDDA
    .byte $0E ; |    XXX | $FDDB
LFDDC:
    .byte $D5 ; |XX X X X| $FDDC
    .byte $D0 ; |XX X    | $FDDD
    .byte $D4 ; |XX X X  | $FDDE
    .byte $D0 ; |XX X    | $FDDF
LFDE0:
    .byte $60 ; | XX     | $FDE0
    .byte $52 ; | X X  X | $FDE1
    .byte $ED ; |XXX XX X| $FDE2
    .byte $ED ; |XXX XX X| $FDE3
LFDE4:
    .byte $F5 ; |XXXX X X| $FDE4
    .byte $F5 ; |XXXX X X| $FDE5
    .byte $F6 ; |XXXX XX | $FDE6
    .byte $F6 ; |XXXX XX | $FDE7
LFDE8:
    .byte $08 ; |    X   | $FDE8
    .byte $06 ; |     XX | $FDE9
    .byte $04 ; |     X  | $FDEA
    .byte $02 ; |      X | $FDEB
    .byte $00 ; |        | $FDEC
    .byte $02 ; |      X | $FDED
    .byte $04 ; |     X  | $FDEE
LFDEF:
    .byte $06 ; |     XX | $FDEF
    .byte $00 ; |        | $FDF0
    .byte $00 ; |        | $FDF1
    .byte $04 ; |     X  | $FDF2
    .byte $04 ; |     X  | $FDF3
    .byte $0A ; |    X X | $FDF4
    .byte $09 ; |    X  X| $FDF5
    .byte $71 ; | XXX   X| $FDF6
    .byte $1B ; |   XX XX| $FDF7
    .byte $00 ; |        | $FDF8
    .byte $00 ; |        | $FDF9
LFDFA:
    .byte $04 ; |     X  | $FDFA
LFDFB:
    .byte $0C ; |    XX  | $FDFB
    .byte $10 ; |   X    | $FDFC
    .byte $10 ; |   X    | $FDFD
    .byte $10 ; |   X    | $FDFE
    .byte $14 ; |   X X  | $FDFF
    .byte $18 ; |   XX   | $FE00
    .byte $18 ; |   XX   | $FE01
    .byte $21 ; |  X    X| $FE02
    .byte $21 ; |  X    X| $FE03
    .byte $21 ; |  X    X| $FE04
LFE05:
    .byte $21 ; |  X    X| $FE05
    .byte $FE ; |XXXXXXX | $FE06
    .byte $FE ; |XXXXXXX | $FE07
    .byte $FE ; |XXXXXXX | $FE08
    .byte $FE ; |XXXXXXX | $FE09
    .byte $FE ; |XXXXXXX | $FE0A
    .byte $FE ; |XXXXXXX | $FE0B
    .byte $FE ; |XXXXXXX | $FE0C
    .byte $FE ; |XXXXXXX | $FE0D
    .byte $FE ; |XXXXXXX | $FE0E
    .byte $FE ; |XXXXXXX | $FE0F
    .byte $E0 ; |XXX     | $FE10
    .byte $AF ; |X X XXXX| $FE11
    .byte $04 ; |     X  | $FE12
    .byte $41 ; | X     X| $FE13
    .byte $E0 ; |XXX     | $FE14
    .byte $AF ; |X X XXXX| $FE15
    .byte $04 ; |     X  | $FE16
    .byte $41 ; | X     X| $FE17
    .byte $B5 ; |X XX X X| $FE18
    .byte $B4 ; |X XX X  | $FE19
    .byte $B3 ; |X XX  XX| $FE1A
    .byte $B2 ; |X XX  X | $FE1B
    .byte $B1 ; |X XX   X| $FE1C
    .byte $B2 ; |X XX  X | $FE1D
    .byte $B3 ; |X XX  XX| $FE1E
    .byte $84 ; |X    X  | $FE1F
    .byte $34 ; |  XX X  | $FE20
    .byte $BF ; |X XXXXXX| $FE21
    .byte $BB ; |X XXX XX| $FE22
    .byte $B7 ; |X XX XXX| $FE23
    .byte $B3 ; |X XX  XX| $FE24
    .byte $AF ; |X X XXXX| $FE25
    .byte $AB ; |X X X XX| $FE26
    .byte $A9 ; |X X X  X| $FE27
    .byte $A9 ; |X X X  X| $FE28
    .byte $A9 ; |X X X  X| $FE29
    .byte $A9 ; |X X X  X| $FE2A
    .byte $A9 ; |X X X  X| $FE2B
    .byte $A9 ; |X X X  X| $FE2C
    .byte $A9 ; |X X X  X| $FE2D
    .byte $A9 ; |X X X  X| $FE2E
    .byte $A9 ; |X X X  X| $FE2F
    .byte $A9 ; |X X X  X| $FE30
    .byte $A9 ; |X X X  X| $FE31
    .byte $A9 ; |X X X  X| $FE32
    .byte $A9 ; |X X X  X| $FE33
    .byte $AB ; |X X X XX| $FE34
    .byte $AF ; |X X XXXX| $FE35
    .byte $B3 ; |X XX  XX| $FE36
    .byte $B7 ; |X XX XXX| $FE37
    .byte $BB ; |X XXX XX| $FE38
    .byte $BF ; |X XXXXXX| $FE39
    .byte $05 ; |     X X| $FE3A
LFE3B:
    .byte $4F ; | X  XXXX| $FE3B
    .byte $01 ; |       X| $FE3C
    .byte $04 ; |     X  | $FE3D
    .byte $07 ; |     XXX| $FE3E
LFE3F:
    .byte $0A ; |    X X | $FE3F
    .byte $DD ; |XX XXX X| $FE40
    .byte $BB ; |X XXX XX| $FE41
LFE42:
    .byte $FF ; |XXXXXXXX| $FE42
    .byte $00 ; |        | $FE43
    .byte $01 ; |       X| $FE44
    .byte $00 ; |        | $FE45
    .byte $08 ; |    X   | $FE46
    .byte $00 ; |        | $FE47
    .byte $04 ; |     X  | $FE48
    .byte $00 ; |        | $FE49
    .byte $02 ; |      X | $FE4A
    .byte $00 ; |        | $FE4B
    .byte $00 ; |        | $FE4C
    .byte $00 ; |        | $FE4D
    .byte $00 ; |        | $FE4E
LFE4F:
    .byte $40 ; | X      | $FE4F
    .byte $40 ; | X      | $FE50
    .byte $80 ; |X       | $FE51
    .byte $80 ; |X       | $FE52
LFE53:
    .byte $01 ; |       X| $FE53
    .byte $02 ; |      X | $FE54
    .byte $04 ; |     X  | $FE55
    .byte $08 ; |    X   | $FE56
    .byte $10 ; |   X    | $FE57
    .byte $20 ; |  X     | $FE58
    .byte $40 ; | X      | $FE59
    .byte $80 ; |X       | $FE5A
LFE5B:
    .byte $80 ; |X       | $FE5B
    .byte $40 ; | X      | $FE5C
    .byte $20 ; |  X     | $FE5D
    .byte $10 ; |   X    | $FE5E
LFE5F:
    .byte $4A ; | X  X X | $FE5F
    .byte $4A ; | X  X X | $FE60
    .byte $0A ; |    X X | $FE61
    .byte $0A ; |    X X | $FE62
LFE63:
    .byte $52 ; | X X  X | $FE63
    .byte $52 ; | X X  X | $FE64
    .byte $12 ; |   X  X | $FE65
LFE66:
    .byte $12 ; |   X  X | $FE66
    .byte $92 ; |X  X  X | $FE67
LFE68:
    .byte $0A ; |    X X | $FE68
    .byte $01 ; |       X| $FE69
    .byte $FF ; |XXXXXXXX| $FE6A
LFE6B:
    .byte $67 ; | XX  XXX| $FE6B
LFE6C:
    .byte $71 ; | XXX   X| $FE6C
LFE6D:
    .byte $DB ; |XX XX XX| $FE6D
LFE6E:
    .byte $A7 ; |X X  XXX| $FE6E
    .byte $B1 ; |X XX   X| $FE6F
    .byte $BB ; |X XXX XX| $FE70
    .byte $C5 ; |XX   X X| $FE71
    .byte $CF ; |XX  XXXX| $FE72
    .byte $D9 ; |XX XX  X| $FE73
    .byte $E3 ; |XXX   XX| $FE74
    .byte $ED ; |XXX XX X| $FE75
LFE76:
    .byte $DD ; |XX XXX X| $FE76
    .byte $DD ; |XX XXX X| $FE77
    .byte $DD ; |XX XXX X| $FE78
    .byte $DD ; |XX XXX X| $FE79
    .byte $DD ; |XX XXX X| $FE7A
    .byte $DD ; |XX XXX X| $FE7B
    .byte $DD ; |XX XXX X| $FE7C
LFE7D:
    .byte $DD ; |XX XXX X| $FE7D
    .byte $00 ; |        | $FE7E
    .byte $FD ; |XXXXXX X| $FE7F
    .byte $00 ; |        | $FE80
    .byte $00 ; |        | $FE81
    .byte $FD ; |XXXXXX X| $FE82
    .byte $FD ; |XXXXXX X| $FE83
    .byte $FD ; |XXXXXX X| $FE84
    .byte $FD ; |XXXXXX X| $FE85
    .byte $FD ; |XXXXXX X| $FE86
    .byte $FD ; |XXXXXX X| $FE87
    .byte $FD ; |XXXXXX X| $FE88
    .byte $FD ; |XXXXXX X| $FE89
    .byte $FD ; |XXXXXX X| $FE8A
    .byte $02 ; |      X | $FE8B
    .byte $03 ; |      XX| $FE8C
    .byte $00 ; |        | $FE8D
    .byte $00 ; |        | $FE8E
    .byte $02 ; |      X | $FE8F
LFE90:
    .byte $00 ; |        | $FE90
    .byte $00 ; |        | $FE91
    .byte $02 ; |      X | $FE92
    .byte $00 ; |        | $FE93
    .byte $08 ; |    X   | $FE94
    .byte $00 ; |        | $FE95
    .byte $04 ; |     X  | $FE96
    .byte $00 ; |        | $FE97
    .byte $01 ; |       X| $FE98
    .byte $00 ; |        | $FE99
    .byte $00 ; |        | $FE9A
LFE9B:
    .byte $00 ; |        | $FE9B
    .byte $00 ; |        | $FE9C
    .byte $81 ; |X      X| $FE9D
    .byte $00 ; |        | $FE9E
    .byte $81 ; |X      X| $FE9F
    .byte $00 ; |        | $FEA0
    .byte $82 ; |X     X | $FEA1
    .byte $00 ; |        | $FEA2
    .byte $82 ; |X     X | $FEA3
    .byte $82 ; |X     X | $FEA4
    .byte $02 ; |      X | $FEA5
    .byte $00 ; |        | $FEA6
    .byte $02 ; |      X | $FEA7
    .byte $02 ; |      X | $FEA8
    .byte $82 ; |X     X | $FEA9
    .byte $00 ; |        | $FEAA
    .byte $82 ; |X     X | $FEAB
    .byte $82 ; |X     X | $FEAC
    .byte $82 ; |X     X | $FEAD
    .byte $82 ; |X     X | $FEAE
    .byte $02 ; |      X | $FEAF
    .byte $02 ; |      X | $FEB0
    .byte $82 ; |X     X | $FEB1
    .byte $02 ; |      X | $FEB2
    .byte $82 ; |X     X | $FEB3
    .byte $00 ; |        | $FEB4
    .byte $82 ; |X     X | $FEB5
    .byte $82 ; |X     X | $FEB6
    .byte $C3 ; |XX    XX| $FEB7
    .byte $00 ; |        | $FEB8
    .byte $C3 ; |XX    XX| $FEB9
    .byte $C3 ; |XX    XX| $FEBA
    .byte $43 ; | X    XX| $FEBB
    .byte $00 ; |        | $FEBC
    .byte $43 ; | X    XX| $FEBD
    .byte $43 ; | X    XX| $FEBE
    .byte $C3 ; |XX    XX| $FEBF
LFEC0:
    .byte $43 ; | X    XX| $FEC0
    .byte $81 ; |X      X| $FEC1
    .byte $01 ; |       X| $FEC2
    .byte $82 ; |X     X | $FEC3
    .byte $82 ; |X     X | $FEC4
    .byte $02 ; |      X | $FEC5
    .byte $02 ; |      X | $FEC6
    .byte $02 ; |      X | $FEC7
    .byte $02 ; |      X | $FEC8
    .byte $42 ; | X    X | $FEC9
    .byte $42 ; | X    X | $FECA
    .byte $42 ; | X    X | $FECB
    .byte $22 ; |  X   X | $FECC
    .byte $22 ; |  X   X | $FECD
    .byte $B3 ; |X XX  XX| $FECE
    .byte $B3 ; |X XX  XX| $FECF
    .byte $27 ; |  X  XXX| $FED0
    .byte $27 ; |  X  XXX| $FED1
LFED2:
    .byte $18 ; |   XX   | $FED2
    .byte $0A ; |    X X | $FED3
    .byte $0E ; |    XXX | $FED4
    .byte $2E ; |  X XXX | $FED5
    .byte $4E ; | X  XXX | $FED6
    .byte $6E ; | XX XXX | $FED7
    .byte $8E ; |X   XXX | $FED8
LFED9:
    .byte $92 ; |X  X  X | $FED9
    .byte $0A ; |    X X | $FEDA
    .byte $34 ; |  XX X  | $FEDB
    .byte $44 ; | X   X  | $FEDC
    .byte $54 ; | X X X  | $FEDD
    .byte $64 ; | XX  X  | $FEDE
    .byte $92 ; |X  X  X | $FEDF
LFEE0:
    .byte $D8 ; |XX XX   | $FEE0
    .byte $E7 ; |XXX  XXX| $FEE1
    .byte $FF ; |XXXXXXXX| $FEE2
    .byte $37 ; |  XX XXX| $FEE3
LFEE4:
    .byte $F9 ; |XXXXX  X| $FEE4
    .byte $F9 ; |XXXXX  X| $FEE5
    .byte $F9 ; |XXXXX  X| $FEE6
    .byte $FA ; |XXXXX X | $FEE7
LFEE8:
    .byte $71 ; | XXX   X| $FEE8
    .byte $7D ; | XXXXX X| $FEE9
    .byte $8E ; |X   XXX | $FEEA
    .byte $A1 ; |X X    X| $FEEB
LFEEC:
    .byte $F9 ; |XXXXX  X| $FEEC
    .byte $F9 ; |XXXXX  X| $FEED
    .byte $F9 ; |XXXXX  X| $FEEE
    .byte $F9 ; |XXXXX  X| $FEEF
LFEF0:
    .byte $BA ; |X XXX X | $FEF0
    .byte $D5 ; |XX X X X| $FEF1
    .byte $BA ; |X XXX X | $FEF2
    .byte $DD ; |XX XXX X| $FEF3
    .byte $D5 ; |XX X X X| $FEF4
    .byte $87 ; |X    XXX| $FEF5
    .byte $B0 ; |X XX    | $FEF6
LFEF7:
    .byte $F1 ; |XXXX   X| $FEF7
    .byte $F1 ; |XXXX   X| $FEF8
    .byte $F1 ; |XXXX   X| $FEF9
    .byte $F0 ; |XXXX    | $FEFA
    .byte $F1 ; |XXXX   X| $FEFB
    .byte $F1 ; |XXXX   X| $FEFC
    .byte $F0 ; |XXXX    | $FEFD
    .byte $00 ; |        | $FEFE
    .byte $00 ; |        | $FEFF
LFF00:
    .byte $DB ; |XX XX XX| $FF00
    .byte $DC ; |XX XXX  | $FF01
    .byte $DC ; |XX XXX  | $FF02
    .byte $DC ; |XX XXX  | $FF03
    .byte $DC ; |XX XXX  | $FF04
    .byte $DC ; |XX XXX  | $FF05
    .byte $DC ; |XX XXX  | $FF06
    .byte $DC ; |XX XXX  | $FF07
    .byte $DC ; |XX XXX  | $FF08
    .byte $DC ; |XX XXX  | $FF09
    .byte $DC ; |XX XXX  | $FF0A
    .byte $DC ; |XX XXX  | $FF0B
    .byte $DC ; |XX XXX  | $FF0C
    .byte $DC ; |XX XXX  | $FF0D
    .byte $DD ; |XX XXX X| $FF0E
    .byte $DD ; |XX XXX X| $FF0F
    .byte $DD ; |XX XXX X| $FF10
    .byte $DD ; |XX XXX X| $FF11
    .byte $DD ; |XX XXX X| $FF12
    .byte $DD ; |XX XXX X| $FF13
    .byte $DD ; |XX XXX X| $FF14
    .byte $DD ; |XX XXX X| $FF15
    .byte $DD ; |XX XXX X| $FF16
    .byte $DD ; |XX XXX X| $FF17
    .byte $DD ; |XX XXX X| $FF18
    .byte $DD ; |XX XXX X| $FF19
    .byte $DD ; |XX XXX X| $FF1A
    .byte $DE ; |XX XXXX | $FF1B
    .byte $DE ; |XX XXXX | $FF1C
    .byte $DE ; |XX XXXX | $FF1D
    .byte $DE ; |XX XXXX | $FF1E
    .byte $DE ; |XX XXXX | $FF1F
    .byte $DE ; |XX XXXX | $FF20
    .byte $DE ; |XX XXXX | $FF21
    .byte $DE ; |XX XXXX | $FF22
    .byte $DE ; |XX XXXX | $FF23
    .byte $DE ; |XX XXXX | $FF24
    .byte $DE ; |XX XXXX | $FF25
    .byte $DE ; |XX XXXX | $FF26
    .byte $DE ; |XX XXXX | $FF27
    .byte $DF ; |XX XXXXX| $FF28
    .byte $DF ; |XX XXXXX| $FF29
    .byte $DF ; |XX XXXXX| $FF2A
    .byte $DF ; |XX XXXXX| $FF2B
    .byte $DF ; |XX XXXXX| $FF2C
    .byte $DF ; |XX XXXXX| $FF2D
    .byte $DF ; |XX XXXXX| $FF2E
    .byte $DF ; |XX XXXXX| $FF2F
    .byte $DF ; |XX XXXXX| $FF30
    .byte $DF ; |XX XXXXX| $FF31
    .byte $DF ; |XX XXXXX| $FF32
    .byte $DF ; |XX XXXXX| $FF33
    .byte $DF ; |XX XXXXX| $FF34
    .byte $DB ; |XX XX XX| $FF35
    .byte $DB ; |XX XX XX| $FF36
    .byte $DB ; |XX XX XX| $FF37
    .byte $DB ; |XX XX XX| $FF38
    .byte $DB ; |XX XX XX| $FF39
    .byte $DB ; |XX XX XX| $FF3A
    .byte $DB ; |XX XX XX| $FF3B
    .byte $DB ; |XX XX XX| $FF3C
    .byte $DB ; |XX XX XX| $FF3D
    .byte $DB ; |XX XX XX| $FF3E
    .byte $DB ; |XX XX XX| $FF3F
    .byte $DB ; |XX XX XX| $FF40
    .byte $DB ; |XX XX XX| $FF41
    .byte $DB ; |XX XX XX| $FF42
    .byte $DA ; |XX XX X | $FF43
    .byte $DA ; |XX XX X | $FF44
    .byte $DA ; |XX XX X | $FF45
    .byte $DA ; |XX XX X | $FF46
    .byte $DA ; |XX XX X | $FF47
    .byte $DA ; |XX XX X | $FF48
    .byte $DA ; |XX XX X | $FF49
    .byte $DA ; |XX XX X | $FF4A
LFF4B:
    .byte $50 ; | X X    | $FF4B
    .byte $17 ; |   X XXX| $FF4C
    .byte $22 ; |  X   X | $FF4D
    .byte $2D ; |  X XX X| $FF4E
    .byte $38 ; |  XXX   | $FF4F
    .byte $43 ; | X    XX| $FF50
    .byte $4E ; | X  XXX | $FF51
    .byte $59 ; | X XX  X| $FF52
    .byte $64 ; | XX  X  | $FF53
    .byte $6F ; | XX XXXX| $FF54
    .byte $7A ; | XXXX X | $FF55
    .byte $85 ; |X    X X| $FF56
    .byte $90 ; |X  X    | $FF57
    .byte $9B ; |X  XX XX| $FF58
    .byte $17 ; |   X XXX| $FF59
    .byte $22 ; |  X   X | $FF5A
    .byte $2D ; |  X XX X| $FF5B
    .byte $38 ; |  XXX   | $FF5C
    .byte $43 ; | X    XX| $FF5D
    .byte $4E ; | X  XXX | $FF5E
    .byte $59 ; | X XX  X| $FF5F
    .byte $64 ; | XX  X  | $FF60
    .byte $6F ; | XX XXXX| $FF61
    .byte $7A ; | XXXX X | $FF62
    .byte $85 ; |X    X X| $FF63
    .byte $90 ; |X  X    | $FF64
    .byte $9B ; |X  XX XX| $FF65
    .byte $17 ; |   X XXX| $FF66
    .byte $22 ; |  X   X | $FF67
    .byte $2D ; |  X XX X| $FF68
    .byte $38 ; |  XXX   | $FF69
    .byte $43 ; | X    XX| $FF6A
    .byte $4E ; | X  XXX | $FF6B
    .byte $59 ; | X XX  X| $FF6C
    .byte $64 ; | XX  X  | $FF6D
    .byte $6F ; | XX XXXX| $FF6E
    .byte $7A ; | XXXX X | $FF6F
    .byte $85 ; |X    X X| $FF70
    .byte $90 ; |X  X    | $FF71
    .byte $9B ; |X  XX XX| $FF72
    .byte $17 ; |   X XXX| $FF73
    .byte $22 ; |  X   X | $FF74
    .byte $2D ; |  X XX X| $FF75
    .byte $38 ; |  XXX   | $FF76
    .byte $43 ; | X    XX| $FF77
    .byte $4E ; | X  XXX | $FF78
    .byte $59 ; | X XX  X| $FF79
    .byte $64 ; | XX  X  | $FF7A
    .byte $6F ; | XX XXXX| $FF7B
    .byte $7A ; | XXXX X | $FF7C
    .byte $85 ; |X    X X| $FF7D
    .byte $90 ; |X  X    | $FF7E
    .byte $9B ; |X  XX XX| $FF7F
    .byte $44 ; | X   X  | $FF80
    .byte $7B ; | XXXX XX| $FF81
    .byte $84 ; |X    X  | $FF82
    .byte $8D ; |X   XX X| $FF83
    .byte $96 ; |X  X XX | $FF84
    .byte $9F ; |X  XXXXX| $FF85
    .byte $A8 ; |X X X   | $FF86
    .byte $B1 ; |X XX   X| $FF87
    .byte $BA ; |X XXX X | $FF88
    .byte $C3 ; |XX    XX| $FF89
    .byte $CC ; |XX  XX  | $FF8A
    .byte $D5 ; |XX X X X| $FF8B
    .byte $DE ; |XX XXXX | $FF8C
    .byte $E7 ; |XXX  XXX| $FF8D
    .byte $CC ; |XX  XX  | $FF8E
    .byte $C0 ; |XX      | $FF8F
    .byte $B4 ; |X XX X  | $FF90
    .byte $A8 ; |X X X   | $FF91
    .byte $9C ; |X  XXX  | $FF92
    .byte $90 ; |X  X    | $FF93
    .byte $84 ; |X    X  | $FF94
    .byte $78 ; | XXXX   | $FF95
LFF96:
    .byte $DE ; |XX XXXX | $FF96
LFF97:
    .byte $D8 ; |XX XX   | $FF97
LFF98:
    .byte $E4 ; |XXX  X  | $FF98
LFF99:
    .byte $01 ; |       X| $FF99
    .byte $08 ; |    X   | $FF9A
    .byte $04 ; |     X  | $FF9B
    .byte $08 ; |    X   | $FF9C
    .byte $02 ; |      X | $FF9D
    .byte $08 ; |    X   | $FF9E
    .byte $04 ; |     X  | $FF9F
    .byte $08 ; |    X   | $FFA0
    .byte $00 ; |        | $FFA1
    .byte $08 ; |    X   | $FFA2
    .byte $04 ; |     X  | $FFA3
    .byte $08 ; |    X   | $FFA4
    .byte $02 ; |      X | $FFA5
    .byte $08 ; |    X   | $FFA6
    .byte $04 ; |     X  | $FFA7
    .byte $08 ; |    X   | $FFA8
LFFA9:
    .byte $31 ; |  XX   X| $FFA9
    .byte $41 ; | X     X| $FFAA
    .byte $51 ; | X X   X| $FFAB
    .byte $61 ; | XX    X| $FFAC
LFFAD:
    .byte $38 ; |  XXX   | $FFAD
    .byte $48 ; | X  X   | $FFAE
    .byte $58 ; | X XX   | $FFAF
LFFB0:
    .byte $68 ; | XX X   | $FFB0
    .byte $01 ; |       X| $FFB1
    .byte $02 ; |      X | $FFB2
    .byte $03 ; |      XX| $FFB3
    .byte $83 ; |X     XX| $FFB4
    .byte $04 ; |     X  | $FFB5
    .byte $84 ; |X    X  | $FFB6
    .byte $05 ; |     X X| $FFB7
    .byte $85 ; |X    X X| $FFB8
    .byte $86 ; |X    XX | $FFB9
    .byte $87 ; |X    XXX| $FFBA
    .byte $88 ; |X   X   | $FFBB
    .byte $29 ; |  X X  X| $FFBC
    .byte $A9 ; |X X X  X| $FFBD
    .byte $6A ; | XX X X | $FFBE
    .byte $EA ; |XXX X X | $FFBF
    .byte $6B ; | XX X XX| $FFC0
    .byte $EB ; |XXX X XX| $FFC1
    .byte $EC ; |XXX XX  | $FFC2
LFFC3:
    .byte $07 ; |     XXX| $FFC3
    .byte $14 ; |   X X  | $FFC4
    .byte $21 ; |  X    X| $FFC5
LFFC6:
    .byte $2E ; |  X XXX | $FFC6
    .byte $01 ; |       X| $FFC7
    .byte $05 ; |     X X| $FFC8
    .byte $09 ; |    X  X| $FFC9
    .byte $0F ; |    XXXX| $FFCA
    .byte $15 ; |   X X X| $FFCB
    .byte $19 ; |   XX  X| $FFCC
LFFCD:
    .byte $6C ; | XX XX  | $FFCD
    .byte $78 ; | XXXX   | $FFCE
    .byte $72 ; | XXX  X | $FFCF
    .byte $4B ; | X  X XX| $FFD0
    .byte $9C ; |X  XXX  | $FFD1
    .byte $B4 ; |X XX X  | $FFD2
    .byte $B1 ; |X XX   X| $FFD3
    .byte $87 ; |X    XXX| $FFD4
    .byte $D8 ; |XX XX   | $FFD5
    .byte $E4 ; |XXX  X  | $FFD6
    .byte $E1 ; |XXX    X| $FFD7
    .byte $C6 ; |XX   XX | $FFD8
    .byte $1B ; |   XX XX| $FFD9
    .byte $27 ; |  X  XXX| $FFDA
    .byte $2D ; |  X XX X| $FFDB
    .byte $36 ; |  XX XX | $FFDC
LFFDD:
    .byte $9B ; |X  XX XX| $FFDD
    .byte $6F ; | XX XXXX| $FFDE
    .byte $2D ; |  X XX X| $FFDF
LFFE0:
    .byte $DC ; |XX XXX  | $FFE0
    .byte $DD ; |XX XXX X| $FFE1
    .byte $DC ; |XX XXX  | $FFE2
    .byte $00 ; |        | $FFE3
    .byte $00 ; |        | $FFE4
    .byte $00 ; |        | $FFE5
    .byte $00 ; |        | $FFE6
    .byte $00 ; |        | $FFE7
    .byte $00 ; |        | $FFE8
    .byte $00 ; |        | $FFE9
    .byte $00 ; |        | $FFEA
    .byte $00 ; |        | $FFEB
    .byte $00 ; |        | $FFEC
    .byte $00 ; |        | $FFED
    .byte $00 ; |        | $FFEE
    .byte $00 ; |        | $FFEF

      ORG $1FF0
     RORG $FFF0

LFFF0:
    bit    $FFF8                 ; 4
    jmp.ind ($00F3)              ; 5

    .byte $00 ; |        | $FFF6
    .byte $00 ; |        | $FFF7
    .byte $00 ; |        | $FFF8
    .byte $00 ; |        | $FFF9

    .word START_1
LFFFC:
    .word START_1
    .word START_1
