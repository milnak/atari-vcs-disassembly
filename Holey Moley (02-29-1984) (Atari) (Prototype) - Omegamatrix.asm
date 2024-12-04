; Disassembly of Holey Moley
; Disassembled by Omegamatrix
; Using DiStella v4.0
;
;
; Hole1.cfg contents:
;
;      ORG B000
;      CODE B000 BA95
;      GFX BA96 BFEF
;      CODE BFF0 BFF5
;      GFX BFF6 BFFF
;
; Hole2.cfg contents:
;
;      ORG F000
;      CODE F000 F2D4
;      GFX F2D5 FFEF
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
COLUBK  =  $09
CTRLPF  =  $0A
REFP0   =  $0B
REFP1   =  $0C
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
RESP1   =  $11
AUDC0   =  $15
AUDF0   =  $17
AUDV0   =  $19
GRP0    =  $1B
GRP1    =  $1C
ENABL   =  $1F
HMP0    =  $20
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
INPT0   =  $38
INPT1   =  $39
INPT2   =  $3A
INPT3   =  $3B
INPT4   =  $3C
INPT5   =  $3D
SWCHA   =  $0280
SWACNT  =  $0281
SWCHB   =  $0282
SWBCNT  =  $0283
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

ram_80             ds 1  ; x5
ram_81             ds 1  ; x3
ram_82             ds 1  ; x8
ram_83             ds 3  ; x3
ram_86             ds 2  ; x4
ram_88             ds 2  ; x5
ram_8A             ds 1  ; x3
ram_8B             ds 1  ; x3
ram_8C             ds 1  ; x13
ram_8D             ds 1  ; x6
ram_8E             ds 1  ; x3
ram_8F             ds 1  ; x4
ram_90             ds 1  ; x32
ram_91             ds 1  ; x39
ram_92             ds 1  ; x17
ram_93             ds 1  ; x3
ram_94             ds 1  ; x3
ram_95             ds 1  ; x5
ram_96             ds 1  ; x5
ram_97             ds 1  ; x9
ram_98             ds 1  ; x3
ram_99             ds 1  ; x12
ram_9A             ds 9  ; x5
ram_A3             ds 1  ; x6
ram_A4             ds 1  ; x4  ; now used to hold previous value of Joystick, bit 2 of SWCHB is also used as a firebutton debouncer
ram_A5             ds 1  ; x3
ram_A6             ds 9  ; x20
ram_AF             ds 1  ; x5
ram_B0             ds 9  ; x11
ram_B9             ds 1  ; x4
ram_BA             ds 1  ; x7
ram_BB             ds 1  ; x9
ram_BC             ds 1  ; x6
ram_BD             ds 1  ; x4
ram_BE             ds 1  ; x4
ram_BF             ds 1  ; x3
ram_C0             ds 1  ; x2
ram_C1             ds 1  ; x2
ram_C2             ds 1  ; x6
ram_C3             ds 1  ; x8
ram_C4             ds 1  ; x1
ram_C5             ds 1  ; x5
ram_C6             ds 1  ; x6
ram_C7             ds 1  ; x6
ram_C8             ds 1  ; x4
ram_C9             ds 1  ; x6
ram_CA             ds 1  ; x3
ram_CB             ds 1  ; x3
ram_CC             ds 1  ; x1
ram_CD             ds 1  ; x3
ram_CE             ds 1  ; x8
ram_CF             ds 1  ; x2
ram_D0             ds 1  ; x3
ram_D1             ds 1  ; x5
ram_D2             ds 1  ; x1
ram_D3             ds 1  ; x9
ram_D4             ds 1  ; x6
ram_D5             ds 1  ; x2
ram_D6             ds 1  ; x3
ram_D7             ds 1  ; x3
ram_D8             ds 1  ; x2
ram_D9             ds 1  ; x2
ram_DA             ds 1  ; x12
ram_DB             ds 1  ; x4
ram_DC             ds 1  ; x1
ram_DD             ds 1  ; x2
ram_DE             ds 1  ; x3
ram_DF             ds 1  ; x8
ram_E0             ds 1  ; x5
ram_E1             ds 1  ; x7
ram_E2             ds 1  ; x3
ram_E3             ds 1  ; x5
ram_E4             ds 1  ; x2
ram_E5             ds 1  ; x7
ram_E6             ds 1  ; x3
ram_E7             ds 1  ; x5
ram_E8             ds 1  ; x2
ram_E9             ds 1  ; x7
ram_EA             ds 1  ; x3
ram_EB             ds 1  ; x7
ram_EC             ds 1  ; x2
ram_ED             ds 3  ; x1
ram_F0             ds 1  ; x3
ram_F1             ds 1  ; x4
ram_F2             ds 1  ; x30
ram_F3             ds 1  ; x2
ram_F4             ds 1  ; x2
ram_F5             ds 1  ; x4
ram_F6             ds 2  ; x4
ram_F8             ds 8  ; x7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      MAIN PROGRAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG CODE

       ORG $0000
      RORG $B000

START_0:
    cld                          ; 2
    ldx    #$FF                  ; 2
    txs                          ; 2
    lda    #$00                  ; 2
LB006:
    sta    WSYNC,X               ; 4
    dex                          ; 2
    bne    LB006                 ; 2³
    jsr    LB923                 ; 6
    lda    #$FF                  ; 2
    sta    ram_99                ; 3
    sta    ram_F8                ; 3
    jsr    LB923                 ; 6
    jsr    LB616                 ; 6
    jsr    LB611                 ; 6
LB01D:
    jsr    LB063                 ; 6
    jsr    LB0A7                 ; 6
    jsr    LB63B                 ; 6
    jsr    LB0E0                 ; 6
    jsr    LB139                 ; 6
    jsr    LB63B                 ; 6
    lda    #$0B                  ; 2
    sta    ram_80                ; 3
    lda    #$F0                  ; 2
    sta    ram_81                ; 3
    jmp    LBFF0                 ; 3

    lda    ram_F8                ; 3
    bmi    LB041                 ; 2³
    jsr    LB396                 ; 6
LB041:
    lda    #$1C                  ; 2
    sta    TIM64T                ; 4
    jsr    LB63B                 ; 6
    jsr    LB27A                 ; 6
    jsr    LB605                 ; 6
    jsr    LB533                 ; 6
    jsr    LB63B                 ; 6
LB055:
    lda    INTIM                 ; 4
    bne    LB055                 ; 2³
    lda    #$02                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    jmp    LB01D                 ; 3

LB063:
    lda    #$02                  ; 2
    sta    VBLANK                ; 3
    sta    VSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------

  IF ORIGINAL

    lda    #$00                  ; 2
    sta    VSYNC                 ; 3
    ldy    #$31                  ; 2
    sty    TIM64T                ; 4
    lda    #$7F                  ; 2
    sta    VBLANK                ; 3
    sta    SWACNT                ; 4
    inc    ram_EB                ; 5
    lda    #$FF                  ; 2
    sta    ram_A3                ; 3
    sta    ram_A4                ; 3
    lda    #$36                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$F1                  ; 2
    sta    CTRLPF                ; 3
    lda    #$44                  ; 2
    sta    ram_ED                ; 3
    lda    #$4B                  ; 2
    sta    ram_EC                ; 3
    lda    #$00                  ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    jsr    LB61F                 ; 6
    rts                          ; 6

  ELSE

    LDY    #0
    STY    VSYNC
    DEY                   ; Y=$FF
    STY    ram_A3
    LDY    #$31
    STY    TIM64T
    LDA    #$7F
    STA    VBLANK
    LDA    #$04
    STA    SWBCNT
    INC    ram_EB
    LDA    #$36
    STA    COLUP0
    STA    COLUP1
    LDA    #$F1
    STA    CTRLPF
    LDA    #$44
    STA    ram_ED
    LDA    #$4B
    STA    ram_EC
    INY                ; Y=0
    STY    VDELP0
    STY    VDELP1
    STY    NUSIZ0
    STY    NUSIZ1
    JSR    LB61F
    RTS

  ENDIF

LB0A7:
    ldx    #$04                  ; 2
LB0A9:
    ldy    #$00                  ; 2
    lda    ram_EC,X              ; 4
    cmp    #$52                  ; 2
    bcc    LB0B5                 ; 2³
    sbc    #$4B                  ; 2
    ldy    #$05                  ; 2
LB0B5:
    cpx    #$02                  ; 2
    adc    #$02                  ; 2
LB0B9:
    iny                          ; 2
    sbc    #$0F                  ; 2
    bcs    LB0B9                 ; 2³
    eor    #$FF                  ; 2
    sbc    #$06                  ; 2
    asl                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sta    HMP0,X                ; 4
LB0CA:
    dey                          ; 2
    bpl    LB0CA                 ; 2³
    sta    RESP0,X               ; 4
    dex                          ; 2
    bpl    LB0A9                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    #$05                  ; 2
LB0D8:
    dex                          ; 2
    bpl    LB0D8                 ; 2³
    sta    HMCLR                 ; 3
    sta    CXCLR                 ; 3
    rts                          ; 6

LB0E0:
    lda    ram_8C                ; 3
    beq    LB0EE                 ; 2³
  IF !ORIGINAL
    BIT    INPT4
    BPL    LB0F4
  ENDIF
    lda    ram_8B                ; 3
    beq    LB0EE                 ; 2³
    lda    ram_8F                ; 3
    cmp    #$01                  ; 2
    beq    LB0F4                 ; 2³
LB0EE:
    lda    SWCHB                 ; 4
    ror                          ; 2
    bcs    LB104                 ; 2³+1
LB0F4:
    lda    ram_99                ; 3
    bpl    LB0FC                 ; 2³
    inc    ram_99                ; 5
    inc    ram_99                ; 5
LB0FC:
    jsr    LB923                 ; 6
    jsr    LB616                 ; 6
    beq    LB134                 ; 2³
LB104:
    ror                          ; 2
    bcc    LB10D                 ; 2³
    ldx    #$01                  ; 2
    stx    ram_8E                ; 3
    bne    LB134                 ; 2³
LB10D:
    jsr    LB611                 ; 6
    dec    ram_8E                ; 5
    bpl    LB134                 ; 2³
    lda    #$2D                  ; 2
    sta    ram_8E                ; 3
    lda    ram_99                ; 3
    bpl    LB11E                 ; 2³
    inc    ram_99                ; 5
LB11E:
    inc    ram_99                ; 5
    ldx    #$78                  ; 2
    stx    ram_8B                ; 3
    ldx    #$00                  ; 2
    stx    ram_EB                ; 3
    stx    ram_8D                ; 3
    lda    ram_99                ; 3
    cmp    #$05                  ; 2
    bcc    LB134                 ; 2³
    lda    #$01                  ; 2
    sta    ram_99                ; 3
LB134:
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
    rts                          ; 6

LB139:
    lda    ram_BE                ; 3
    beq    LB149                 ; 2³
    dec    ram_BE                ; 5
    bne    LB148                 ; 2³
    jsr    LB916                 ; 6
    lda    ram_8C                ; 3
  IF ORIGINAL
    bne    LB148                 ; 2³  redundant
  ENDIF
LB148:
    rts                          ; 6

LB149:
    lda    ram_BB                ; 3
    beq    LB175                 ; 2³
    ldx    #$08                  ; 2
LB14F:
    lda    ram_B0,X              ; 4
    cmp    #$16                  ; 2
    beq    LB166                 ; 2³
    clc                          ; 2
    adc    #$01                  ; 2
    sta    ram_B0,X              ; 4
    cmp    #$01                  ; 2
    bne    LB162                 ; 2³
    lda    #$02                  ; 2
    sta    ram_A6,X              ; 4
LB162:
    dex                          ; 2
    bpl    LB14F                 ; 2³
LB165:
    rts                          ; 6

LB166:
    dec    ram_C1                ; 5
    bne    LB165                 ; 2³
    inc    ram_CA                ; 5
    lda    ram_CA                ; 3
    cmp    #$04                  ; 2
    beq    LB1B6                 ; 2³
    jmp    LB1EA                 ; 3

LB175:
    ldx    #$08                  ; 2
LB177:
    stx    ram_95                ; 3
    lda    ram_B0,X              ; 4
    bne    LB180                 ; 2³
    jmp    LB201                 ; 3

LB180:
    lda    ram_C9                ; 3
    beq    LB188                 ; 2³
    cpx    ram_D0                ; 3
    beq    LB1FB                 ; 2³
LB188:
    lda    ram_EB                ; 3
    and    #$03                  ; 2
    bne    LB194                 ; 2³
    lda    ram_BA                ; 3
    cmp    #$02                  ; 2
    bcc    LB1FB                 ; 2³
LB194:
    lda    ram_B0,X              ; 4
    sec                          ; 2
    sbc    #$01                  ; 2
    sta    ram_B0,X              ; 4
    bne    LB1FB                 ; 2³
    lda    ram_A6,X              ; 4
    cmp    #$04                  ; 2
    beq    LB1AC                 ; 2³
    sed                          ; 2
    lda    ram_CE                ; 3
    sec                          ; 2
    sbc    #$01                  ; 2
    cld                          ; 2
    sta    ram_CE                ; 3
LB1AC:
    lda    #$00                  ; 2
    sta    ram_A6,X              ; 4
    sta    ram_CA                ; 3
    lda    ram_CE                ; 3
    bne    LB1FB                 ; 2³
LB1B6:
    lda    #$25                  ; 2
    sta    ram_CE                ; 3
    jsr    LB964                 ; 6
    ldy    #$00                  ; 2
    cpy    ram_BB                ; 3
    beq    LB1C5                 ; 2³
    ldy    #$06                  ; 2
LB1C5:
    sty    ram_C0                ; 3
    jsr    LB8B4                 ; 6
    inc    ram_BC                ; 5
    lda    ram_BC                ; 3
    cmp    #$03                  ; 2
    bne    LB1D6                 ; 2³
    lda    #$00                  ; 2
    sta    ram_BC                ; 3
LB1D6:
    tax                          ; 2
    lda    LBB4F,X               ; 4
    sta    ram_BB                ; 3
    beq    LB1FA                 ; 2³
    lda    #$00                  ; 2
    sta    ram_CE                ; 3
    lda    ram_BA                ; 3
    cmp    #$05                  ; 2
    beq    LB1EA                 ; 2³
    inc    ram_BA                ; 5
LB1EA:
    ldx    #$08                  ; 2
LB1EC:
    lda    #$00                  ; 2
    sta    ram_B0,X              ; 4
    dex                          ; 2
    bpl    LB1EC                 ; 2³
    ldx    ram_BA                ; 3
    lda    LBB49,X               ; 4
    sta    ram_C1                ; 3
LB1FA:
    rts                          ; 6

LB1FB:
    dex                          ; 2
    bmi    LB279                 ; 2³+1
    jmp    LB177                 ; 3

LB201:
    lda    #$02                  ; 2
    sta    ram_90                ; 3
    ldy    LBA96,X               ; 4
LB208:
    lda.wy ram_A6,Y              ; 4
    cmp    #$06                  ; 2
    bcs    LB1FB                 ; 2³+1
    dey                          ; 2
    dec    ram_90                ; 5
    bpl    LB208                 ; 2³
    ldy    ram_BA                ; 3
    lda    LBB3D,Y               ; 4
    and    ram_EB                ; 3
    bne    LB1FB                 ; 2³+1
    lda    LBB43,Y               ; 4
    sta    ram_90                ; 3
    jsr    LB61F                 ; 6
    and    ram_90                ; 3
    cmp    ram_95                ; 3
    bne    LB1FB                 ; 2³+1
    cmp    ram_CF                ; 3
    beq    LB1FB                 ; 2³+1
    lda    #$02                  ; 2
    sta    ram_92                ; 3
    jsr    LB61F                 ; 6
    and    #$03                  ; 2
    bne    LB26F                 ; 2³
    lda    ram_BA                ; 3
    bne    LB249                 ; 2³
    lda    ram_BC                ; 3
    beq    LB24D                 ; 2³
    jsr    LB61F                 ; 6
    and    #$07                  ; 2
    bne    LB26F                 ; 2³
LB249:
    lda    #$04                  ; 2
    sta    ram_92                ; 3
LB24D:
    jsr    LB61F                 ; 6
    and    #$07                  ; 2
    bne    LB26F                 ; 2³
    lda    ram_BD                ; 3
    beq    LB26F                 ; 2³
    dec    ram_BD                ; 5
    lda    #$02                  ; 2
    sta    ram_90                ; 3
    ldy    LBA96,X               ; 4
LB261:
    lda.wy ram_A6,Y              ; 4
    bne    LB26F                 ; 2³
    dey                          ; 2
    dec    ram_90                ; 5
    bpl    LB261                 ; 2³
    lda    #$06                  ; 2
    sta    ram_92                ; 3
LB26F:
    stx    ram_CF                ; 3
    lda    ram_92                ; 3
    sta    ram_A6,X              ; 4
    lda    #$32                  ; 2
    sta    ram_B0,X              ; 4
LB279:
    rts                          ; 6

LB27A:
    ldx    #$00                  ; 2
    stx    ram_D9                ; 3
    lda    ram_C6                ; 3
    beq    LB2A4                 ; 2³
    dec    ram_C6                ; 5
LB284:
    lda    ram_DA,X              ; 4
    clc                          ; 2
    adc    #$01                  ; 2
    sta    ram_DA,X              ; 4
    cmp    #$0A                  ; 2
    beq    LB299                 ; 2³
    cmp    #$0B                  ; 2
    bne    LB2D2                 ; 2³
    lda    #$01                  ; 2
    sta    ram_DA,X              ; 4
    bne    LB2D2                 ; 2³
LB299:
    lda    #$00                  ; 2
    sta    ram_DA,X              ; 4
    inx                          ; 2
    cpx    #$02                  ; 2
    bne    LB284                 ; 2³
    beq    LB2D2                 ; 2³
LB2A4:
    lda    ram_C8                ; 3
    beq    LB2D2                 ; 2³
    dec    ram_C8                ; 5
LB2AA:
    lda    ram_DA,X              ; 4
    cmp    #$0A                  ; 2
    beq    LB2BF                 ; 2³
    sec                          ; 2
    sbc    #$01                  ; 2
    sta    ram_DA,X              ; 4
    bmi    LB2B9                 ; 2³
    bpl    LB2D2                 ; 2³
LB2B9:
    lda    ram_DB                ; 3
    cmp    #$0A                  ; 2
    bne    LB2C9                 ; 2³
LB2BF:
    lda    #$00                  ; 2
    sta    ram_C5                ; 3
    lda    #$0A                  ; 2
    sta    ram_DA                ; 3
    bne    LB2D2                 ; 2³
LB2C9:
    lda    #$09                  ; 2
    sta    ram_DA,X              ; 4
    inx                          ; 2
    cpx    #$02                  ; 2
    bne    LB2AA                 ; 2³
LB2D2:
    lda    ram_8C                ; 3
    bne    LB2EE                 ; 2³
    lda    ram_BB                ; 3
    bne    LB2EE                 ; 2³
    lda    ram_CE                ; 3
    and    #$0F                  ; 2
    sta    ram_DD                ; 3
    lda    ram_CE                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    ram_DE                ; 3
    bne    LB2EE                 ; 2³
    lda    #$0A                  ; 2
    sta    ram_DE                ; 3
LB2EE:
    ldx    #$05                  ; 2
LB2F0:
    lda    ram_D9,X              ; 4
    sta    ram_91,X              ; 4
    dex                          ; 2
    bpl    LB2F0                 ; 2³
    lda    ram_8D                ; 3
    beq    LB310                 ; 2³+1
    lda    ram_EB                ; 3
    bpl    LB310                 ; 2³+1
    ldy    #$0A                  ; 2
    sty    ram_91                ; 3
    ldy    #$11                  ; 2
    sty    ram_96                ; 3
    iny                          ; 2
    sty    ram_95                ; 3
    iny                          ; 2
    sty    ram_93                ; 3
    iny                          ; 2
    sty    ram_92                ; 3
LB310:
    jsr    LB693                 ; 6
    lda    ram_8C                ; 3
    beq    LB350                 ; 2³
    lda    ram_8D                ; 3
    bne    LB350                 ; 2³
    ldy    #$0B                  ; 2
    sty    ram_D8                ; 3
    iny                          ; 2
    sty    ram_D7                ; 3
    iny                          ; 2
    sty    ram_D6                ; 3
    iny                          ; 2
    sty    ram_D5                ; 3
    iny                          ; 2
    sty    ram_D4                ; 3
    iny                          ; 2
    sty    ram_D3                ; 3
    lda    ram_99                ; 3
    bmi    LB354                 ; 2³
    jsr    LB8A5                 ; 6
    ldx    ram_99                ; 3
    cpx    #$FF                  ; 2
    bne    LB33D                 ; 2³
    inx                          ; 2
    inx                          ; 2
LB33D:
    stx    ram_D4                ; 3
    ldy    #$11                  ; 2
    sty    ram_D7                ; 3
    iny                          ; 2
    sty    ram_D6                ; 3
    txa                          ; 2
    and    #$01                  ; 2
    eor    #$01                  ; 2
    sta    ram_D2                ; 3
    jmp    LB354                 ; 3

LB350:
    ldx    #$00                  ; 2
    stx    ram_D3                ; 3
LB354:
    lda    ram_C3                ; 3
    beq    LB37B                 ; 2³
    dec    ram_C3                ; 5
    ldx    #$01                  ; 2
LB35C:
    lda    ram_D3,X              ; 4
    clc                          ; 2
    adc    #$01                  ; 2
    sta    ram_D3,X              ; 4
    cmp    #$0A                  ; 2
    beq    LB371                 ; 2³
    cmp    #$0B                  ; 2
    bne    LB37A                 ; 2³
    lda    #$01                  ; 2
    sta    ram_D3,X              ; 4
    bne    LB37A                 ; 2³
LB371:
    lda    #$00                  ; 2
    sta    ram_D3,X              ; 4
    inx                          ; 2
    cpx    #$06                  ; 2
    bne    LB35C                 ; 2³
LB37A:
    rts                          ; 6

LB37B:
    lda    ram_C5                ; 3
    beq    LB395                 ; 2³
    dec    ram_C5                ; 5
LB381:
    lda    ram_D4,X              ; 4
    sec                          ; 2
    sbc    #$01                  ; 2
    sta    ram_D4,X              ; 4
    bmi    LB38C                 ; 2³
    bpl    LB395                 ; 2³
LB38C:
    lda    #$09                  ; 2
    sta    ram_D4,X              ; 4
    inx                          ; 2
    cpx    #$02                  ; 2
    bne    LB381                 ; 2³
LB395:
    rts                          ; 6

LB396:
    lda    ram_BE                ; 3
    beq    LB3A1                 ; 2³
    lda    ram_BC                ; 3
    beq    LB3A1                 ; 2³
    jmp    LB459                 ; 3

LB3A1:
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_D1                ; 3
    and    #$0F                  ; 2
    tay                          ; 2
    lda    LBA9F,Y               ; 4
    sta    ram_91                ; 3
    lda    ram_D1                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    lda    LBA9F,Y               ; 4
    tay                          ; 2
    cmp    #$06                  ; 2
    bne    LB3C2                 ; 2³
    ldy    #$4C                  ; 2
LB3C2:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    ram_91                ; 3
    lda    #$06                  ; 2
    sta    ram_90                ; 3
LB3CA:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LBF5D,X               ; 4
    sta    GRP0                  ; 3
    lda    LBF5D,Y               ; 4
    sta    GRP1                  ; 3
    dex                          ; 2
    dey                          ; 2
    dec    ram_90                ; 5
    bpl    LB3CA                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$B8                  ; 2
    sta    ram_91                ; 3
    lda    #$09                  ; 2
    sta    ram_92                ; 3
    jsr    LB6B4                 ; 6
    jsr    LBA0E                 ; 6
    lda    #$06                  ; 2
    sta    ram_F2                ; 3
    lda    #$FF                  ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    jsr    LB9D5                 ; 6
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    ram_AF                ; 3
    ldy    #$05                  ; 2
    sty    WSYNC                 ; 3
;---------------------------------------
LB413:
    dey                          ; 2
    bpl    LB413                 ; 2³
    nop                          ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    lda    #$F0                  ; 2
    sta    HMP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jsr    LB6E5                 ; 6
    jsr    LB6E5                 ; 6
    jsr    LB6E5                 ; 6
    ldy    #$00                  ; 2
    ldx    #$00                  ; 2
LB430:
    lda    ram_D3,X              ; 4
    sta    ram_91                ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sec                          ; 2
    sbc    ram_91                ; 3
    clc                          ; 2
    adc    #$5D                  ; 2
    sta.wy ram_DF,Y              ; 5
    lda    #$BF                  ; 2
    sta.wy ram_E0,Y              ; 5
    iny                          ; 2
    iny                          ; 2
    inx                          ; 2
    cpx    #$06                  ; 2
    bne    LB430                 ; 2³
    lda    #$FF                  ; 2
    sta    ram_91                ; 3
    stx    ram_92                ; 3
    jsr    LB6B4                 ; 6
    jsr    LB9D5                 ; 6
    rts                          ; 6

LB459:
  IF ORIGINAL
    ldx    #$37                  ; 2
  ELSE
    LDX    #$33
  ENDIF
LB45B:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    LB45B                 ; 2³
    lda    ram_C2                ; 3
    cmp    #$FF                  ; 2
    bne    LB474                 ; 2³
    lda    #$14                  ; 2
    sta    ram_92                ; 3
    ldx    #$23                  ; 2
LB46C:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    LB46C                 ; 2³
    jmp    LB521                 ; 3

LB474:
    lda    #$00                  ; 2
    sta    ram_92                ; 3
    lda    ram_DA                ; 3
    sta    ram_93                ; 3
    lda    ram_DB                ; 3
    sta    ram_94                ; 3
    lda    #$0A                  ; 2
    sta    ram_91                ; 3
    sta    ram_95                ; 3
    sta    ram_96                ; 3
    jsr    LB693                 ; 6
    lda    #$06                  ; 2
    sta    ram_92                ; 3
    lda    #$FF                  ; 2
    sta    ram_91                ; 3
    jsr    LB6B4                 ; 6
    jsr    LB9D5                 ; 6
    ldx    #$05                  ; 2
LB49B:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    LB49B                 ; 2³
    lda    #$FF                  ; 2
    sta    ram_91                ; 3
    lda    #$0A                  ; 2
    sta    ram_92                ; 3
    jsr    LB6B4                 ; 6
LB4AB:
    ldy    ram_F2                ; 3
    lda    LBDD1,Y               ; 4
    sta.w  GRP0                  ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LBF3C,Y               ; 4
    sta.w  GRP1                  ; 4
    lda    LBF47,Y               ; 4
    sta.w  GRP0                  ; 4
    lda    LBF52,Y               ; 4
    sta    ram_91                ; 3
    lda    LBF52,Y               ; 4
    tax                          ; 2
    nop                          ; 2
    lda    LBDD1,Y               ; 4
    tay                          ; 2
    lda    ram_91                ; 3
    sta.w  GRP1                  ; 4
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    ram_F2                ; 5
    bpl    LB4AB                 ; 2³
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #$0A                  ; 2
    sta    ram_91                ; 3
    sta    ram_94                ; 3
    sta    ram_95                ; 3
    sta    ram_96                ; 3
    lda    #$00                  ; 2
    sta    ram_92                ; 3
    lda    ram_C2                ; 3
    and    #$0F                  ; 2
    sta    ram_93                ; 3
    lda    ram_C2                ; 3
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    beq    LB50C                 ; 2³
    sta    ram_94                ; 3
LB50C:
    jsr    LB693                 ; 6
    lda    #$06                  ; 2
    sta    ram_92                ; 3
    lda    #$B8                  ; 2
    sta    ram_91                ; 3
    jsr    LB6B4                 ; 6
    jsr    LB9D5                 ; 6
    lda    #$07                  ; 2
    sta    ram_92                ; 3
LB521:
    lda    #$FF                  ; 2
    sta    ram_91                ; 3
    jsr    LB6B4                 ; 6
    jsr    LBA52                 ; 6
    ldx    #$50                  ; 2
LB52D:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    LB52D                 ; 2³
    rts                          ; 6

LB533:
    jsr    LB96F                 ; 6
    lda    ram_8C                ; 3
    bne    LB54E                 ; 2³
    ldx    ram_A3                ; 3
    cpx    #$FF                  ; 2
    beq    LB54E                 ; 2³
    lda    #$01                  ; 2
    sta    ram_9A,X              ; 4
    ldx    #$08                  ; 2
    lda    ram_F8                ; 3
    bmi    LB54E                 ; 2³
    lda    #$00                  ; 2
    sta    ram_F0                ; 3
LB54E:
    lda    ram_9A,X              ; 4
    beq    LB557                 ; 2³
    lda    LBAA9,X               ; 4
    sta    ram_F0                ; 3
LB557:
    dex                          ; 2
    bpl    LB54E                 ; 2³
    ldx    #$08                  ; 2
    lda    ram_C9                ; 3
    beq    LB56D                 ; 2³
    dec    ram_C9                ; 5
    lda    ram_C9                ; 3
    bne    LB56A                 ; 2³
    ldx    ram_D0                ; 3
    sta    ram_A6,X              ; 4
LB56A:
  IF ORIGINAL
    jmp    LB604                 ; 3
  ELSE
    jmp    MB610                 ; 3
  ENDIF

LB56D:
    lda    ram_9A,X              ; 4
    beq    LB583                 ; 2³
    lda    ram_A6,X              ; 4
    beq    LB597                 ; 2³
    cmp    #$02                  ; 2
    beq    LB5D5                 ; 2³
    cmp    #$04                  ; 2
    beq    LB5A1                 ; 2³
    cmp    #$06                  ; 2
    beq    LB5BD                 ; 2³
    bne    LB5FE                 ; 2³
LB583:
    lda    ram_A6,X              ; 4
    cmp    #$01                  ; 2
    bne    LB58D                 ; 2³
    lda    #$00                  ; 2
    sta    ram_A6,X              ; 4
LB58D:
    cmp    #$03                  ; 2
    bne    LB5FE                 ; 2³
    lda    #$02                  ; 2
    sta    ram_A6,X              ; 4
    bne    LB5FE                 ; 2³
LB597:
    lda    #$01                  ; 2
    sta    ram_82                ; 3
    lda    #$01                  ; 2
    sta    ram_A6,X              ; 4
    bne    LB5FE                 ; 2³
LB5A1:
    lda    #$05                  ; 2
    sta    ram_A6,X              ; 4
    lda    #$19                  ; 2
    sta    ram_82                ; 3
    ldy    ram_B0,X              ; 4
    lda    #$05                  ; 2
    sec                          ; 2
    sbc    LBB0A,Y               ; 4
    sta    ram_C8                ; 3
    sta    ram_C5                ; 3
    clc                          ; 2
    adc    #$0A                  ; 2
    sta    ram_C7                ; 3
    jmp    LB5F2                 ; 3

LB5BD:
    lda    #$07                  ; 2
    sta    ram_A6,X              ; 4
    lda    #$0D                  ; 2
    sta    ram_82                ; 3
    lda    ram_97                ; 3
    and    #$07                  ; 2
    tay                          ; 2
    iny                          ; 2
    iny                          ; 2
    iny                          ; 2
    sty    ram_C3                ; 3
    sty    ram_C6                ; 3
    sty    ram_C7                ; 3
    bne    LB5F2                 ; 2³
LB5D5:
    lda    #$03                  ; 2
    sta    ram_A6,X              ; 4
    lda    #$0D                  ; 2
    sta    ram_82                ; 3
    ldy    ram_B0,X              ; 4
    lda    LBB0A,Y               ; 4
    sta    ram_C3                ; 3
    sta    ram_C6                ; 3
    sta    ram_C7                ; 3
    lda    ram_BB                ; 3
    beq    LB5F2                 ; 2³
    lda    #$01                  ; 2
    sta    ram_C3                ; 3
    sta    ram_C6                ; 3
LB5F2:
    stx    ram_D0                ; 3
    ldy    #$14                  ; 2
    lda    ram_BB                ; 3
    beq    LB5FC                 ; 2³
    ldy    #$0A                  ; 2
LB5FC:
    sty    ram_C9                ; 3
LB5FE:
    dex                          ; 2
  IF ORIGINAL
    bmi    LB604                 ; 2³
  ELSE
    BMI    MB610
  ENDIF
    jmp    LB56D                 ; 3

  IF ORIGINAL
LB604:
    rts                          ; 6
  ENDIF

LB605:
    lda    ram_8C                ; 3
    beq    LB60D                 ; 2³
    lda    #$18                  ; 2
    sta    ram_82                ; 3
LB60D:
    jsr    LB985                 ; 6
MB610:
    rts                          ; 6

LB611:
    lda    #$FF                  ; 2
  IF ORIGINAL
    sta    ram_8C                ; 3
    rts                          ; 6
  ELSE
    BNE    MB61C
  ENDIF

LB616:
    lda    #$78                  ; 2
    sta    ram_8B                ; 3
    lda    #$00                  ; 2
MB61C:
    sta    ram_8C                ; 3
    rts                          ; 6

LB61F:
    asl    ram_97                ; 5
    rol    ram_98                ; 5
    bpl    LB627                 ; 2³
    inc    ram_97                ; 5
LB627:
    lda    ram_97                ; 3
    bit    LBAC2                 ; 4
    beq    LB632                 ; 2³
    eor    #$01                  ; 2
    sta    ram_97                ; 3
LB632:
    ora    ram_98                ; 3
    bne    LB638                 ; 2³
    inc    ram_97                ; 5
LB638:
    lda    ram_97                ; 3
    rts                          ; 6

  IF ORIGINAL

LB63B:
    ldy    ram_A5                ; 3
    ldx    LBABA,Y               ; 4
    inx                          ; 2
    ldy    INPT0                 ; 3
    bmi    LB647                 ; 2³
    stx    ram_A3                ; 3
LB647:
    ldy    INPT2                 ; 3
    bmi    LB64D                 ; 2³
    stx    ram_A4                ; 3
LB64D:
    inx                          ; 2
    ldy    INPT1                 ; 3
    bmi    LB654                 ; 2³
    stx    ram_A3                ; 3
LB654:
    ldy    INPT3                 ; 3
    bmi    LB65A                 ; 2³
    stx    ram_A4                ; 3
LB65A:
    inx                          ; 2
    ldy    INPT4                 ; 3
    bmi    LB661                 ; 2³
    stx    ram_A3                ; 3
LB661:
    ldy    INPT5                 ; 3
    bmi    LB667                 ; 2³
    stx    ram_A4                ; 3
LB667:
    ldx    ram_A5                ; 3
    inx                          ; 2
    cpx    #$04                  ; 2
    bne    LB670                 ; 2³
    ldx    #$00                  ; 2
LB670:
    stx    ram_A5                ; 3

  ELSE

;$A3
;key = 0, key = 1, key = 2
;key = 3, key = 4, key = 5
;key = 6, key = 7, key = 8

;$A5
;key = 1, key = 1, key = 1
;key = 2, key = 2, key = 2
;key = 3, key = 3, key = 3

;RLDU
;UL = $A0, U = $E0, UR = $60
;L = $B0, middle = INPT4, R = $70
;DL = $90, D = $D0, DR = $50

DirectionTab:
    .byte $FF             ; $00 invalid
    .byte $FF             ; $01 invalid
    .byte $FF             ; $02 invalid
    .byte $FF             ; $03 invalid
    .byte $FF             ; $04 invalid
    .byte ($03 << 4)|$08  ; $05 down-right
    .byte ($01 << 4)|$02  ; $06 up-right
    .byte ($02 << 4)|$05  ; $07 right
    .byte $FF             ; $08 invalid
    .byte ($03 << 4)|$06  ; $09 down-left
    .byte ($01 << 4)|$00  ; $0A up-left
    .byte ($02 << 4)|$03  ; $0B left
    .byte $FF             ; $0C invalid
    .byte ($03 << 4)|$07  ; $0D down
    .byte ($01 << 4)|$01  ; $0E up
    .byte ($02 << 4)|$04  ; $0F middle

LB63B:

    BIT    INPT4
    BPL    .pressed
;not pressed
    LDA    #0
    STA    SWCHB
    BEQ    .exit   ; always branch

.pressed
    LDA    SWCHB
    AND    #$04
    BEQ    .newDirection
    LAX    ram_A4
    JMP    UseLast

.newDirection:
    LDA    #$04    ; debouncer
    STA    SWCHB
    LDA    SWCHA
    LSR
    LSR
    LSR
    LSR
    TAX
    LDA    DirectionTab,X
    TAX
    STX    ram_A4  ; last value
UseLast:
    CMP    #$FF
    BEQ    .exit
    AND    #$0F
    STA    ram_A3
    TXA
    LSR
    LSR
    LSR
    LSR
    STA    ram_A5
.exit:

  ENDIF

  IF ORIGINAL
    ldy    #$82                  ; 2
    sty    VBLANK                ; 3
    ldy    #$02                  ; 2
    sty    VBLANK                ; 3
    ldy    LBABE,X               ; 4
    sty    SWCHA                 ; 4
  ELSE
    LDA    #$82
    STA    VBLANK
  ENDIF

    lda    ram_8D                ; 3
    beq    LB692                 ; 2³
    lda    ram_A3                ; 3
    cmp    #$0A                  ; 2
    bne    LB692                 ; 2³
    lda    ram_8F                ; 3
    cmp    #$02                  ; 2
    beq    LB692                 ; 2³
    inc    ram_8F                ; 5
LB692:
    rts                          ; 6

LB693:
    ldy    #$00                  ; 2
    ldx    #$00                  ; 2
LB697:
    lda    ram_91,X              ; 4
    sta    ram_90                ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sec                          ; 2
    sbc    ram_90                ; 3
    clc                          ; 2
    adc    #$5D                  ; 2
    sta.wy ram_DF,Y              ; 5
    lda    #$BF                  ; 2
    sta.wy ram_E0,Y              ; 5
    iny                          ; 2
    iny                          ; 2
    inx                          ; 2
    cpx    #$06                  ; 2
    bne    LB697                 ; 2³
    rts                          ; 6

LB6B4:
    lda    #$03                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    ldx    #$FF                  ; 2
    stx    VDELP0                ; 3
    stx    VDELP1                ; 3
    lda    ram_92                ; 3
    sta    ram_F2                ; 3
    ldy    #$06                  ; 2
    sty    WSYNC                 ; 3
;---------------------------------------
LB6C8:
    dey                          ; 2
    bpl    LB6C8                 ; 2³
    nop                          ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    lda    #$F0                  ; 2
    sta    HMP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$00                  ; 2
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    lda    ram_91                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    rts                          ; 6

LB6E5:
    stx    ram_96                ; 3
    ldx    ram_AF                ; 3
    ldy    ram_A6,X              ; 4
    lda    LBB92,Y               ; 4
    bne    LB6F4                 ; 2³

  IF ORIGINAL
    ldy    #$00                  ; 2
    beq    LB6F6                 ; 2³
  ELSE
    TAY
    .byte $0C  ; skip 2 bytes
  ENDIF

LB6F4:
    ldy    ram_C7                ; 3
LB6F6:
    lda    LBB9A,Y               ; 4
    sta    ram_E9                ; 3
    lda    LBBA9,Y               ; 4
    sta    ram_EA                ; 3
    lda    LBBB8,Y               ; 4
    sta    ram_E7                ; 3
    lda    LBBC7,Y               ; 4
    sta    ram_E8                ; 3
    inx                          ; 2
    ldy    ram_A6,X              ; 4
    lda    LBB92,Y               ; 4
    bne    LB716                 ; 2³

  IF ORIGINAL
    ldy    #$00                  ; 2
    beq    LB718                 ; 2³
  ELSE
    TAY
    .byte $0C  ; skip 2 bytes
  ENDIF

LB716:
    ldy    ram_C7                ; 3
LB718:
    lda    LBB9A,Y               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    ram_E5                ; 3
    lda    LBBA9,Y               ; 4
    sta    ram_E6                ; 3
    lda    LBBB8,Y               ; 4
    sta    ram_E3                ; 3
    lda    LBBC7,Y               ; 4
    sta    ram_E4                ; 3
    inx                          ; 2
    ldy    ram_A6,X              ; 4
    lda    LBB92,Y               ; 4
    bne    LB73A                 ; 2³

  IF ORIGINAL
    ldy    #$00                  ; 2
    beq    LB73C                 ; 2³
  ELSE
    TAY
    .byte $0C  ; skip 2 bytes
  ENDIF

     ORG $073A
    RORG $B73A

LB73A:
    ldy    ram_C7                ; 3
LB73C:
    lda    LBB9A,Y               ; 4
    sta    ram_E1                ; 3
    lda    LBBA9,Y               ; 4
    sta    ram_E2                ; 3
    lda    LBBB8,Y               ; 4
    sta    ram_DF                ; 3
    lda    LBBC7,Y               ; 4
    sta    ram_E0                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$FF                  ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    lda    #$06                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    ram_F2                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$4A                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    jsr    LB9D5                 ; 6
    ldx    ram_96                ; 3
    lda    #$36                  ; 2
    sta    ram_F1                ; 3
    lda    #$1E                  ; 2
    sta    ram_CD                ; 3
    jsr    LB876                 ; 6
    lda    LBB82,Y               ; 4
    clc                          ; 2
    adc    ram_90                ; 3
    sta    ram_E9                ; 3
    lda    LBB8A,Y               ; 4
    sta    ram_EA                ; 3
    lda    LBB72,Y               ; 4
    sta    ram_F3                ; 3
    sta    ram_F5                ; 3
    jsr    LB876                 ; 6
    lda    LBB82,Y               ; 4
    clc                          ; 2
    adc    ram_90                ; 3
    sta    ram_E5                ; 3
    lda    LBB8A,Y               ; 4
    sta    ram_E6                ; 3
    lda    ram_F5                ; 3
    ora    LBB7A,Y               ; 4
    sta    ram_F5                ; 3
    lda    LBB7A,Y               ; 4
    sta    ram_F6                ; 3
    jsr    LB876                 ; 6
    lda    LBB82,Y               ; 4
    clc                          ; 2
    adc    ram_90                ; 3
    sta    ram_E1                ; 3
    lda    LBB8A,Y               ; 4
    sta    ram_E2                ; 3
    lda    LBB72,Y               ; 4
    sta    ram_F4                ; 3
    ora    ram_F6                ; 3
    sta    ram_F6                ; 3
    lda    #$00                  ; 2
    clc                          ; 2
    adc    ram_CD                ; 3
    sta    ram_CB                ; 3
    lda    #$BD                  ; 2
    sta    ram_CC                ; 3
    lda    #$14                  ; 2
    sta    ram_F2                ; 3
    lda    ram_F1                ; 3
    sta    ram_90                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$FF                  ; 2
    stx    VDELP0                ; 3
    stx    VDELP1                ; 3
    stx    REFP1                 ; 3
    inx                          ; 2
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    lda    #$25                  ; 2
    sta    CTRLPF                ; 3
    stx    REFP0                 ; 3
    lda    ram_90                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$83                  ; 2
    sta    COLUPF                ; 3
LB7F9:
    ldy    ram_F2                ; 3
    lda    (ram_E9),Y            ; 5
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    lda    (ram_CB),Y            ; 5
    lda    (ram_CB),Y            ; 5
    sta    ENABL                 ; 3
    sta    CTRLPF                ; 3
    lda    (ram_E5),Y            ; 5
    sta    GRP0                  ; 3
    tax                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    (ram_E1),Y            ; 5
    ldy    ram_F2                ; 3
    stx    GRP1                  ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    dec    ram_F2                ; 5
    bpl    LB7F9                 ; 2³+1
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    ENABL                 ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    ram_F1                ; 3
    sta    COLUPF                ; 3
    lda    ram_F3                ; 3
    sta    PF1                   ; 3
    lda    ram_F5                ; 3
    sta    PF2                   ; 3
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    nop                          ; 2
    lda    ram_F4                ; 3
    sta    PF1                   ; 3
    lda    ram_F6                ; 3
    sta    PF2                   ; 3
    ldx    #$05                  ; 2
    ldy    #$18                  ; 2
LB84C:
    lda    #$21                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    CTRLPF                ; 3
    sty    COLUP0                ; 3
    sty    COLUP1                ; 3
    dey                          ; 2
    lda    #$00                  ; 2
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    LBC1D,X               ; 4
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    dex                          ; 2
    bpl    LB84C                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    REFP1                 ; 3
    rts                          ; 6

LB876:
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    ram_AF                ; 3
    ldy    ram_A6,X              ; 4
    lda    #$00                  ; 2
    cpy    #$02                  ; 2
    bcc    LB890                 ; 2³
    cpy    #$06                  ; 2
    bcc    LB88A                 ; 2³
    lda    #$43                  ; 2
    sta    ram_F1                ; 3
LB88A:
    lda    ram_B0,X              ; 4
    tax                          ; 2
    lda    LBAD7,X               ; 4
LB890:
    sta    ram_90                ; 3
    ldx    ram_AF                ; 3
    lda    ram_9A,X              ; 4
    beq    LB8A0                 ; 2³
    lda    ram_F0                ; 3
    beq    LB8A0                 ; 2³
    lda    ram_90                ; 3
    sta    ram_CD                ; 3
LB8A0:
    sta    WSYNC                 ; 3
;---------------------------------------
    inc    ram_AF                ; 5
    rts                          ; 6

LB8A5:
    lda    #$0A                  ; 2
    sta    ram_D3                ; 3
    sta    ram_D4                ; 3
    sta    ram_D5                ; 3
    sta    ram_D6                ; 3
    sta    ram_D7                ; 3
    sta    ram_D8                ; 3
    rts                          ; 6

LB8B4:
    jsr    LB97A                 ; 6
    lda    #$70                  ; 2
    sta    ram_F8                ; 3
    lda    ram_8C                ; 3
    bne    LB915                 ; 2³+1
    sed                          ; 2
    lda    ram_D1                ; 3
    clc                          ; 2
    adc    #$01                  ; 2
    sta    ram_D1                ; 3
    cld                          ; 2
    lda    #$03                  ; 2
    sta    ram_BD                ; 3
    lda    #$FF                  ; 2
    sta    ram_BE                ; 3
    sta    ram_C2                ; 3
    lda    ram_DB                ; 3
    cmp    #$0A                  ; 2
    bcs    LB8DC                 ; 2³
    cmp    ram_BF                ; 3
    bcs    LB8EB                 ; 2³
LB8DC:
    lda    ram_BB                ; 3
    bne    LB915                 ; 2³+1
    lda    #$FF                  ; 2
    sta    ram_8C                ; 3
    sta    ram_8D                ; 3
    lda    #$00                  ; 2
    sta    ram_8F                ; 3
    rts                          ; 6

LB8EB:
    sec                          ; 2
    sbc    ram_BF                ; 3
    tax                          ; 2
    lda    ram_DA                ; 3
    sec                          ; 2
    sbc    ram_C0                ; 3
    sta    ram_90                ; 3
    bmi    LB8DC                 ; 2³
    lda    ram_BB                ; 3
    beq    LB905                 ; 2³+1
    lda    #$64                  ; 2
    sta    ram_C3                ; 3
    lda    #$00                  ; 2
    sta    ram_C2                ; 3
    rts                          ; 6

LB905:
    lda    LBAC3,X               ; 4
    clc                          ; 2
    adc    ram_90                ; 3
    sta    ram_C3                ; 3
    lda    LBACD,X               ; 4
    clc                          ; 2
    adc    ram_DA                ; 3
    sta    ram_C2                ; 3
LB915:
    rts                          ; 6

LB916:
    lda    #$0A                  ; 2
    sta    ram_DA                ; 3
    sta    ram_DB                ; 3
    sta    ram_DC                ; 3
    sta    ram_DD                ; 3
    sta    ram_DE                ; 3
    rts                          ; 6

LB923:
    lda    #$00                  ; 2
    sta    ram_C3                ; 3
    sta    ram_C4                ; 3
    sta    ram_C6                ; 3
    sta    ram_C8                ; 3
    sta    ram_C5                ; 3
    sta    ram_C9                ; 3
    sta    ram_BB                ; 3
    sta    ram_BC                ; 3
    sta    ram_8D                ; 3
    sta    ram_F8                ; 3
    tay                          ; 2
    lda    #$01                  ; 2
    sta    ram_D1                ; 3
    lda    #$03                  ; 2
    sta    ram_BF                ; 3
    sta    ram_BD                ; 3
    ldx    ram_99                ; 3
    inx                          ; 2
    lda    LBAB2,X               ; 4
    sta    ram_BA                ; 3
    lda    ram_EB                ; 3
    ora    #$02                  ; 2
    sta    ram_97                ; 3
    sta    ram_98                ; 3
    jsr    LB8A5                 ; 6
    jsr    LB96F                 ; 6
    jsr    LB97A                 ; 6
    jsr    LB916                 ; 6
    lda    #$25                  ; 2
    sta    ram_CE                ; 3
LB964:
    ldy    #$08                  ; 2
LB966:
    lda    #$00                  ; 2
    sta.wy ram_B0,Y              ; 5
    dey                          ; 2
    bpl    LB966                 ; 2³
    rts                          ; 6

LB96F:
    ldy    #$08                  ; 2
LB971:
    lda    #$00                  ; 2
    sta.wy ram_9A,Y              ; 5
    dey                          ; 2
    bpl    LB971                 ; 2³
    rts                          ; 6

LB97A:
    ldy    #$08                  ; 2
LB97C:
    lda    #$00                  ; 2
    sta.wy ram_A6,Y              ; 5
    dey                          ; 2
    bpl    LB97C                 ; 2³
    rts                          ; 6

LB985:
    lda    #$00                  ; 2
    sta    ram_90                ; 3
    beq    LB993                 ; 2³
    lda    #$01                  ; 2
    sta    ram_90                ; 3
    bne    LB993                 ; 2³
LB991:
    inc    ram_82,X              ; 6
LB993:
    ldx    ram_90                ; 3
    ldy    ram_82,X              ; 4
    beq    LB99F                 ; 2³
    lda    ram_83,X              ; 4
    beq    LB9A0                 ; 2³
    dec    ram_83,X              ; 6
LB99F:
    rts                          ; 6

LB9A0:
    sec                          ; 2
    lda    LBBDA,Y               ; 4
    beq    LB9BC                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    #$B9                  ; 2
    pha                          ; 3
    lda    LBBD6,X               ; 4
    pha                          ; 3
    lda    LBBDA,Y               ; 4
    and    #$1F                  ; 2
    ldx    ram_90                ; 3
    clc                          ; 2
    rts                          ; 6

LB9BC:
    sta    AUDC0,X               ; 4
    bcc    LB991                 ; 2³
    sta    AUDF0,X               ; 4
    bcc    LB991                 ; 2³
    sta    AUDV0,X               ; 4
    bcc    LB991                 ; 2³
    sta    ram_83,X              ; 4
    bcc    LB991                 ; 2³
    bcs    LB9D2                 ; 2³
    iny                          ; 2
    lda    LBBDA,Y               ; 4
LB9D2:
    sta    ram_82,X              ; 4
    rts                          ; 6

LB9D5:
    ldy    ram_F2                ; 3
    lda    (ram_E9),Y            ; 5
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_E7),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_E5),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_E3),Y            ; 5
    sta    ram_91                ; 3
    lda    (ram_E1),Y            ; 5
    tax                          ; 2
    lda    (ram_DF),Y            ; 5
    tay                          ; 2
    lda    ram_91                ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    ram_F2                ; 5
    bpl    LB9D5                 ; 2³
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    rts                          ; 6

LBA0E:
    ldy    ram_F2                ; 3
    lda    LBF32,Y               ; 4
    sta.w  GRP0                  ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LBF28,Y               ; 4
    sta.w  GRP1                  ; 4
    lda    LBF1E,Y               ; 4
    sta.w  GRP0                  ; 4
    lda    LBF14,Y               ; 4
    sta    ram_91                ; 3
    lda    LBF0A,Y               ; 4
    tax                          ; 2
    nop                          ; 2
    lda    LBF00,Y               ; 4
    tay                          ; 2
    lda    ram_91                ; 3
    sta.w  GRP1                  ; 4
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    ram_F2                ; 5
    bpl    LBA0E                 ; 2³
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    rts                          ; 6

LBA52:
    ldy    ram_F2                ; 3
    lda    LBDD1,Y               ; 4
    sta.w  GRP0                  ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LBE77,Y               ; 4
    sta.w  GRP1                  ; 4
    lda    LBE8C,Y               ; 4
    sta.w  GRP0                  ; 4
    lda    LBEA1,Y               ; 4
    sta    ram_91                ; 3
    lda    LBEB6,Y               ; 4
    tax                          ; 2
    nop                          ; 2
    lda    LBECB,Y               ; 4
    tay                          ; 2
    lda    ram_91                ; 3
    sta.w  GRP1                  ; 4
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    ram_F2                ; 5
    bpl    LBA52                 ; 2³
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    rts                          ; 6

LBA96:
    .byte $02 ; |      X | $BA96
    .byte $02 ; |      X | $BA97
    .byte $02 ; |      X | $BA98
    .byte $05 ; |     X X| $BA99
    .byte $05 ; |     X X| $BA9A
    .byte $05 ; |     X X| $BA9B
    .byte $08 ; |    X   | $BA9C
    .byte $08 ; |    X   | $BA9D
    .byte $08 ; |    X   | $BA9E
LBA9F:
    .byte $06 ; |     XX | $BA9F
    .byte $0D ; |    XX X| $BAA0
    .byte $14 ; |   X X  | $BAA1
    .byte $1B ; |   XX XX| $BAA2
    .byte $22 ; |  X   X | $BAA3
    .byte $29 ; |  X X  X| $BAA4
    .byte $30 ; |  XX    | $BAA5
    .byte $37 ; |  XX XXX| $BAA6
    .byte $3E ; |  XXXXX | $BAA7
    .byte $45 ; | X   X X| $BAA8
LBAA9:
    .byte $2D ; |  X XX X| $BAA9
    .byte $4D ; | X  XX X| $BAAA
    .byte $6E ; | XX XXX | $BAAB
    .byte $2D ; |  X XX X| $BAAC
    .byte $4D ; | X  XX X| $BAAD
    .byte $6E ; | XX XXX | $BAAE
    .byte $2D ; |  X XX X| $BAAF
    .byte $4D ; | X  XX X| $BAB0
    .byte $6E ; | XX XXX | $BAB1
LBAB2:
    .byte $00 ; |        | $BAB2
    .byte $00 ; |        | $BAB3
    .byte $00 ; |        | $BAB4
    .byte $01 ; |       X| $BAB5
    .byte $02 ; |      X | $BAB6
    .byte $03 ; |      XX| $BAB7
    .byte $04 ; |     X  | $BAB8
    .byte $05 ; |     X X| $BAB9
LBABA:
    .byte $FF ; |XXXXXXXX| $BABA
    .byte $02 ; |      X | $BABB
    .byte $05 ; |     X X| $BABC
    .byte $08 ; |    X   | $BABD
LBABE:
    .byte $EE ; |XXX XXX | $BABE
    .byte $DD ; |XX XXX X| $BABF
    .byte $BB ; |X XXX XX| $BAC0
    .byte $77 ; | XXX XXX| $BAC1
LBAC2:
    .byte $02 ; |      X | $BAC2
LBAC3:
    .byte $00 ; |        | $BAC3
    .byte $0A ; |    X X | $BAC4
    .byte $14 ; |   X X  | $BAC5
    .byte $1E ; |   XXXX | $BAC6
    .byte $28 ; |  X X   | $BAC7
    .byte $32 ; |  XX  X | $BAC8
    .byte $3C ; |  XXXX  | $BAC9
    .byte $46 ; | X   XX | $BACA
    .byte $50 ; | X X    | $BACB
    .byte $5A ; | X XX X | $BACC
LBACD:
    .byte $00 ; |        | $BACD
    .byte $10 ; |   X    | $BACE
    .byte $20 ; |  X     | $BACF
    .byte $30 ; |  XX    | $BAD0
    .byte $40 ; | X      | $BAD1
    .byte $50 ; | X X    | $BAD2
    .byte $60 ; | XX     | $BAD3
    .byte $70 ; | XXX    | $BAD4
    .byte $80 ; |X       | $BAD5
    .byte $90 ; |X  X    | $BAD6
LBAD7:
    .byte $16 ; |   X XX | $BAD7
    .byte $15 ; |   X X X| $BAD8
    .byte $14 ; |   X X  | $BAD9
    .byte $13 ; |   X  XX| $BADA
    .byte $12 ; |   X  X | $BADB
    .byte $11 ; |   X   X| $BADC
    .byte $10 ; |   X    | $BADD
    .byte $0F ; |    XXXX| $BADE
    .byte $0E ; |    XXX | $BADF
    .byte $0D ; |    XX X| $BAE0
    .byte $0C ; |    XX  | $BAE1
    .byte $0B ; |    X XX| $BAE2
    .byte $0A ; |    X X | $BAE3
    .byte $09 ; |    X  X| $BAE4
    .byte $08 ; |    X   | $BAE5
    .byte $07 ; |     XXX| $BAE6
    .byte $06 ; |     XX | $BAE7
    .byte $05 ; |     X X| $BAE8
    .byte $04 ; |     X  | $BAE9
    .byte $03 ; |      XX| $BAEA
    .byte $02 ; |      X | $BAEB
    .byte $01 ; |       X| $BAEC
    .byte $00 ; |        | $BAED
    .byte $00 ; |        | $BAEE
    .byte $00 ; |        | $BAEF
    .byte $00 ; |        | $BAF0
    .byte $00 ; |        | $BAF1
    .byte $00 ; |        | $BAF2
    .byte $00 ; |        | $BAF3
    .byte $01 ; |       X| $BAF4
    .byte $02 ; |      X | $BAF5
    .byte $03 ; |      XX| $BAF6
    .byte $04 ; |     X  | $BAF7
    .byte $05 ; |     X X| $BAF8
    .byte $06 ; |     XX | $BAF9
    .byte $07 ; |     XXX| $BAFA
    .byte $08 ; |    X   | $BAFB
    .byte $09 ; |    X  X| $BAFC
    .byte $0A ; |    X X | $BAFD
    .byte $0B ; |    X XX| $BAFE
    .byte $0C ; |    XX  | $BAFF
    .byte $0D ; |    XX X| $BB00
    .byte $0E ; |    XXX | $BB01
    .byte $0F ; |    XXXX| $BB02
    .byte $10 ; |   X    | $BB03
    .byte $11 ; |   X   X| $BB04
    .byte $12 ; |   X  X | $BB05
    .byte $13 ; |   X  XX| $BB06
    .byte $14 ; |   X X  | $BB07
    .byte $15 ; |   X X X| $BB08
    .byte $16 ; |   X XX | $BB09
LBB0A:
    .byte $01 ; |       X| $BB0A
    .byte $01 ; |       X| $BB0B
    .byte $01 ; |       X| $BB0C
    .byte $01 ; |       X| $BB0D
    .byte $01 ; |       X| $BB0E
    .byte $01 ; |       X| $BB0F
    .byte $01 ; |       X| $BB10
    .byte $01 ; |       X| $BB11
    .byte $01 ; |       X| $BB12
    .byte $01 ; |       X| $BB13
    .byte $01 ; |       X| $BB14
    .byte $01 ; |       X| $BB15
    .byte $01 ; |       X| $BB16
    .byte $01 ; |       X| $BB17
    .byte $01 ; |       X| $BB18
    .byte $01 ; |       X| $BB19
    .byte $01 ; |       X| $BB1A
    .byte $01 ; |       X| $BB1B
    .byte $01 ; |       X| $BB1C
    .byte $01 ; |       X| $BB1D
    .byte $01 ; |       X| $BB1E
    .byte $01 ; |       X| $BB1F
    .byte $01 ; |       X| $BB20
    .byte $01 ; |       X| $BB21
    .byte $01 ; |       X| $BB22
    .byte $01 ; |       X| $BB23
    .byte $01 ; |       X| $BB24
    .byte $01 ; |       X| $BB25
    .byte $02 ; |      X | $BB26
    .byte $02 ; |      X | $BB27
    .byte $02 ; |      X | $BB28
    .byte $02 ; |      X | $BB29
    .byte $02 ; |      X | $BB2A
    .byte $02 ; |      X | $BB2B
    .byte $02 ; |      X | $BB2C
    .byte $03 ; |      XX| $BB2D
    .byte $03 ; |      XX| $BB2E
    .byte $03 ; |      XX| $BB2F
    .byte $03 ; |      XX| $BB30
    .byte $03 ; |      XX| $BB31
    .byte $03 ; |      XX| $BB32
    .byte $03 ; |      XX| $BB33
    .byte $03 ; |      XX| $BB34
    .byte $04 ; |     X  | $BB35
    .byte $04 ; |     X  | $BB36
    .byte $04 ; |     X  | $BB37
    .byte $04 ; |     X  | $BB38
    .byte $04 ; |     X  | $BB39
    .byte $04 ; |     X  | $BB3A
    .byte $04 ; |     X  | $BB3B
    .byte $04 ; |     X  | $BB3C
LBB3D:
    .byte $1F ; |   XXXXX| $BB3D
    .byte $1F ; |   XXXXX| $BB3E
    .byte $1F ; |   XXXXX| $BB3F
    .byte $1F ; |   XXXXX| $BB40
    .byte $0F ; |    XXXX| $BB41
    .byte $07 ; |     XXX| $BB42
LBB43:
    .byte $1F ; |   XXXXX| $BB43
    .byte $0F ; |    XXXX| $BB44
    .byte $0F ; |    XXXX| $BB45
    .byte $0F ; |    XXXX| $BB46
    .byte $0F ; |    XXXX| $BB47
    .byte $0F ; |    XXXX| $BB48
LBB49:
    .byte $BE ; |X XXXXX | $BB49
    .byte $96 ; |X  X XX | $BB4A
    .byte $8C ; |X   XX  | $BB4B
    .byte $82 ; |X     X | $BB4C
    .byte $6E ; | XX XXX | $BB4D
    .byte $50 ; | X X    | $BB4E
LBB4F:
    .byte $00 ; |        | $BB4F
    .byte $00 ; |        | $BB50
    .byte $01 ; |       X| $BB51
    .byte $28 ; |  X X   | $BB52
    .byte $50 ; | X X    | $BB53
    .byte $78 ; | XXXX   | $BB54
    .byte $28 ; |  X X   | $BB55
    .byte $50 ; | X X    | $BB56
    .byte $78 ; | XXXX   | $BB57
    .byte $28 ; |  X X   | $BB58
    .byte $50 ; | X X    | $BB59
    .byte $78 ; | XXXX   | $BB5A
    .byte $00 ; |        | $BB5B
    .byte $00 ; |        | $BB5C
    .byte $00 ; |        | $BB5D
    .byte $01 ; |       X| $BB5E
    .byte $01 ; |       X| $BB5F
    .byte $01 ; |       X| $BB60
    .byte $02 ; |      X | $BB61
    .byte $02 ; |      X | $BB62
    .byte $02 ; |      X | $BB63
    .byte $00 ; |        | $BB64
    .byte $0F ; |    XXXX| $BB65
    .byte $0F ; |    XXXX| $BB66
    .byte $0F ; |    XXXX| $BB67
    .byte $0F ; |    XXXX| $BB68
    .byte $0F ; |    XXXX| $BB69
    .byte $0F ; |    XXXX| $BB6A
    .byte $00 ; |        | $BB6B
    .byte $00 ; |        | $BB6C
    .byte $00 ; |        | $BB6D
    .byte $0F ; |    XXXX| $BB6E
    .byte $0F ; |    XXXX| $BB6F
    .byte $00 ; |        | $BB70
    .byte $00 ; |        | $BB71
LBB72:
    .byte $00 ; |        | $BB72
    .byte $00 ; |        | $BB73
    .byte $01 ; |       X| $BB74
    .byte $01 ; |       X| $BB75
    .byte $01 ; |       X| $BB76
    .byte $01 ; |       X| $BB77
    .byte $01 ; |       X| $BB78
    .byte $01 ; |       X| $BB79
LBB7A:
    .byte $00 ; |        | $BB7A
    .byte $00 ; |        | $BB7B
    .byte $80 ; |X       | $BB7C
    .byte $80 ; |X       | $BB7D
    .byte $80 ; |X       | $BB7E
    .byte $80 ; |X       | $BB7F
    .byte $80 ; |X       | $BB80
    .byte $80 ; |X       | $BB81
LBB82:
    .byte $00 ; |        | $BB82
    .byte $00 ; |        | $BB83
    .byte $23 ; |  X   XX| $BB84
    .byte $51 ; | X X   X| $BB85
    .byte $36 ; |  XX XX | $BB86
    .byte $62 ; | XX   X | $BB87
    .byte $8E ; |X   XXX | $BB88
    .byte $BA ; |X XXX X | $BB89
LBB8A:
    .byte $BC ; |X XXXX  | $BB8A
    .byte $BC ; |X XXXX  | $BB8B
    .byte $BC ; |X XXXX  | $BB8C
    .byte $BC ; |X XXXX  | $BB8D
    .byte $BD ; |X XXXX X| $BB8E
    .byte $BD ; |X XXXX X| $BB8F
    .byte $BD ; |X XXXX X| $BB90
    .byte $BD ; |X XXXX X| $BB91
LBB92:
    .byte $00 ; |        | $BB92
    .byte $00 ; |        | $BB93
    .byte $00 ; |        | $BB94
    .byte $01 ; |       X| $BB95
    .byte $00 ; |        | $BB96
    .byte $01 ; |       X| $BB97
    .byte $00 ; |        | $BB98
    .byte $01 ; |       X| $BB99
LBB9A:
    .byte $00 ; |        | $BB9A
    .byte $07 ; |     XXX| $BB9B
    .byte $15 ; |   X X X| $BB9C
    .byte $23 ; |  X   XX| $BB9D
    .byte $2A ; |  X X X | $BB9E
    .byte $38 ; |  XXX   | $BB9F
    .byte $46 ; | X   XX | $BBA0
    .byte $4D ; | X  XX X| $BBA1
    .byte $46 ; | X   XX | $BBA2
    .byte $38 ; |  XXX   | $BBA3
    .byte $54 ; | X X X  | $BBA4
    .byte $5B ; | X XX XX| $BBA5
    .byte $62 ; | XX   X | $BBA6
    .byte $69 ; | XX X  X| $BBA7
    .byte $70 ; | XXX    | $BBA8
LBBA9:
    .byte $BC ; |X XXXX  | $BBA9
    .byte $BE ; |X XXXXX | $BBAA
    .byte $BE ; |X XXXXX | $BBAB
    .byte $BE ; |X XXXXX | $BBAC
    .byte $BE ; |X XXXXX | $BBAD
    .byte $BE ; |X XXXXX | $BBAE
    .byte $BE ; |X XXXXX | $BBAF
    .byte $BE ; |X XXXXX | $BBB0
    .byte $BE ; |X XXXXX | $BBB1
    .byte $BE ; |X XXXXX | $BBB2
    .byte $BE ; |X XXXXX | $BBB3
    .byte $BE ; |X XXXXX | $BBB4
    .byte $BE ; |X XXXXX | $BBB5
    .byte $BE ; |X XXXXX | $BBB6
    .byte $BE ; |X XXXXX | $BBB7
LBBB8:
    .byte $00 ; |        | $BBB8
    .byte $0E ; |    XXX | $BBB9
    .byte $1C ; |   XXX  | $BBBA
    .byte $00 ; |        | $BBBB
    .byte $31 ; |  XX   X| $BBBC
    .byte $3F ; |  XXXXXX| $BBBD
    .byte $3F ; |  XXXXXX| $BBBE
    .byte $00 ; |        | $BBBF
    .byte $00 ; |        | $BBC0
    .byte $00 ; |        | $BBC1
    .byte $00 ; |        | $BBC2
    .byte $0E ; |    XXX | $BBC3
    .byte $1C ; |   XXX  | $BBC4
    .byte $00 ; |        | $BBC5
    .byte $31 ; |  XX   X| $BBC6
LBBC7:
    .byte $BC ; |X XXXX  | $BBC7
    .byte $BE ; |X XXXXX | $BBC8
    .byte $BE ; |X XXXXX | $BBC9
    .byte $BE ; |X XXXXX | $BBCA
    .byte $BE ; |X XXXXX | $BBCB
    .byte $BE ; |X XXXXX | $BBCC
    .byte $BE ; |X XXXXX | $BBCD
    .byte $BE ; |X XXXXX | $BBCE
    .byte $BE ; |X XXXXX | $BBCF
    .byte $BE ; |X XXXXX | $BBD0
    .byte $BE ; |X XXXXX | $BBD1
    .byte $BE ; |X XXXXX | $BBD2
    .byte $BE ; |X XXXXX | $BBD3
    .byte $BE ; |X XXXXX | $BBD4
    .byte $BE ; |X XXXXX | $BBD5
LBBD6:
    .byte $BB ; |X XXX XX| $BBD6
    .byte $BF ; |X XXXXXX| $BBD7
    .byte $C3 ; |XX    XX| $BBD8
    .byte $C7 ; |XX   XXX| $BBD9
LBBDA:
    .byte $CD ; |XX  XX X| $BBDA
    .byte $38 ; |  XXX   | $BBDB
    .byte $0C ; |    XX  | $BBDC
    .byte $40 ; | X      | $BBDD
    .byte $61 ; | XX    X| $BBDE
    .byte $47 ; | X   XXX| $BBDF
    .byte $61 ; | XX    X| $BBE0
    .byte $49 ; | X  X  X| $BBE1
    .byte $63 ; | XX   XX| $BBE2
    .byte $39 ; |  XXX  X| $BBE3
    .byte $47 ; | X   XXX| $BBE4
    .byte $62 ; | XX   X | $BBE5
    .byte $00 ; |        | $BBE6
    .byte $37 ; |  XX XXX| $BBE7
    .byte $0C ; |    XX  | $BBE8
    .byte $45 ; | X   X X| $BBE9
    .byte $64 ; | XX  X  | $BBEA
    .byte $34 ; |  XX X  | $BBEB
    .byte $64 ; | XX  X  | $BBEC
    .byte $32 ; |  XX  X | $BBED
    .byte $64 ; | XX  X  | $BBEE
    .byte $2F ; |  X XXXX| $BBEF
    .byte $64 ; | XX  X  | $BBF0
    .byte $00 ; |        | $BBF1
    .byte $00 ; |        | $BBF2
    .byte $3C ; |  XXXX  | $BBF3
    .byte $44 ; | X   X  | $BBF4
    .byte $0C ; |    XX  | $BBF5
    .byte $62 ; | XX   X | $BBF6
    .byte $38 ; |  XXX   | $BBF7
    .byte $45 ; | X   X X| $BBF8
    .byte $62 ; | XX   X | $BBF9
    .byte $36 ; |  XX XX | $BBFA
    .byte $46 ; | X   XX | $BBFB
    .byte $62 ; | XX   X | $BBFC
    .byte $34 ; |  XX X  | $BBFD
    .byte $62 ; | XX   X | $BBFE
    .byte $31 ; |  XX   X| $BBFF
    .byte $00 ; |        | $BC00
    .byte $00 ; |        | $BC01
    .byte $00 ; |        | $BC02
    .byte $00 ; |        | $BC03
    .byte $00 ; |        | $BC04
    .byte $00 ; |        | $BC05
    .byte $00 ; |        | $BC06
    .byte $00 ; |        | $BC07
    .byte $00 ; |        | $BC08
    .byte $00 ; |        | $BC09
    .byte $00 ; |        | $BC0A
    .byte $00 ; |        | $BC0B
    .byte $00 ; |        | $BC0C
    .byte $00 ; |        | $BC0D
    .byte $00 ; |        | $BC0E
    .byte $00 ; |        | $BC0F
    .byte $00 ; |        | $BC10
    .byte $00 ; |        | $BC11
    .byte $00 ; |        | $BC12
    .byte $00 ; |        | $BC13
    .byte $00 ; |        | $BC14
    .byte $00 ; |        | $BC15
    .byte $00 ; |        | $BC16
    .byte $00 ; |        | $BC17
    .byte $00 ; |        | $BC18
    .byte $00 ; |        | $BC19
    .byte $00 ; |        | $BC1A
    .byte $00 ; |        | $BC1B
    .byte $00 ; |        | $BC1C
LBC1D:
    .byte $FF ; |XXXXXXXX| $BC1D
    .byte $FF ; |XXXXXXXX| $BC1E
    .byte $FF ; |XXXXXXXX| $BC1F
    .byte $7F ; | XXXXXXX| $BC20
    .byte $7F ; | XXXXXXX| $BC21
    .byte $30 ; |  XX    | $BC22
    .byte $1F ; |   XXXXX| $BC23
    .byte $1F ; |   XXXXX| $BC24
    .byte $1F ; |   XXXXX| $BC25
    .byte $18 ; |   XX   | $BC26
    .byte $17 ; |   X XXX| $BC27
    .byte $1E ; |   XXXX | $BC28
    .byte $1E ; |   XXXX | $BC29
    .byte $1B ; |   XX XX| $BC2A
    .byte $1C ; |   XXX  | $BC2B
    .byte $1F ; |   XXXXX| $BC2C
    .byte $1D ; |   XXX X| $BC2D
    .byte $0D ; |    XX X| $BC2E
    .byte $0F ; |    XXXX| $BC2F
    .byte $07 ; |     XXX| $BC30
    .byte $03 ; |      XX| $BC31
    .byte $18 ; |   XX   | $BC32
    .byte $04 ; |     X  | $BC33
    .byte $08 ; |    X   | $BC34
    .byte $10 ; |   X    | $BC35
    .byte $00 ; |        | $BC36
    .byte $00 ; |        | $BC37
    .byte $00 ; |        | $BC38
    .byte $00 ; |        | $BC39
    .byte $00 ; |        | $BC3A
    .byte $00 ; |        | $BC3B
    .byte $00 ; |        | $BC3C
    .byte $00 ; |        | $BC3D
    .byte $00 ; |        | $BC3E
    .byte $00 ; |        | $BC3F
    .byte $00 ; |        | $BC40
    .byte $00 ; |        | $BC41
    .byte $00 ; |        | $BC42
    .byte $00 ; |        | $BC43
    .byte $00 ; |        | $BC44
    .byte $00 ; |        | $BC45
    .byte $00 ; |        | $BC46
    .byte $00 ; |        | $BC47
    .byte $00 ; |        | $BC48
    .byte $00 ; |        | $BC49
    .byte $00 ; |        | $BC4A
    .byte $00 ; |        | $BC4B
    .byte $00 ; |        | $BC4C
    .byte $00 ; |        | $BC4D
    .byte $00 ; |        | $BC4E
    .byte $00 ; |        | $BC4F
    .byte $00 ; |        | $BC50
    .byte $1F ; |   XXXXX| $BC51
    .byte $1F ; |   XXXXX| $BC52
    .byte $3F ; |  XXXXXX| $BC53
    .byte $7F ; | XXXXXXX| $BC54
    .byte $FF ; |XXXXXXXX| $BC55
    .byte $E0 ; |XXX     | $BC56
    .byte $FF ; |XXXXXXXX| $BC57
    .byte $FE ; |XXXXXXX | $BC58
    .byte $F6 ; |XXXX XX | $BC59
    .byte $FB ; |XXXXX XX| $BC5A
    .byte $7C ; | XXXXX  | $BC5B
    .byte $7F ; | XXXXXXX| $BC5C
    .byte $39 ; |  XXX  X| $BC5D
    .byte $1F ; |   XXXXX| $BC5E
    .byte $0F ; |    XXXX| $BC5F
    .byte $53 ; | X X  XX| $BC60
    .byte $20 ; |  X     | $BC61
    .byte $40 ; | X      | $BC62
    .byte $80 ; |X       | $BC63
    .byte $00 ; |        | $BC64
    .byte $00 ; |        | $BC65
    .byte $00 ; |        | $BC66
    .byte $00 ; |        | $BC67
    .byte $00 ; |        | $BC68
    .byte $00 ; |        | $BC69
    .byte $00 ; |        | $BC6A
    .byte $00 ; |        | $BC6B
    .byte $00 ; |        | $BC6C
    .byte $00 ; |        | $BC6D
    .byte $00 ; |        | $BC6E
    .byte $00 ; |        | $BC6F
    .byte $00 ; |        | $BC70
    .byte $00 ; |        | $BC71
    .byte $00 ; |        | $BC72
    .byte $00 ; |        | $BC73
    .byte $00 ; |        | $BC74
    .byte $00 ; |        | $BC75
    .byte $00 ; |        | $BC76
    .byte $00 ; |        | $BC77
    .byte $00 ; |        | $BC78
    .byte $00 ; |        | $BC79
    .byte $00 ; |        | $BC7A
    .byte $00 ; |        | $BC7B
    .byte $00 ; |        | $BC7C
    .byte $00 ; |        | $BC7D
    .byte $00 ; |        | $BC7E
    .byte $00 ; |        | $BC7F
    .byte $00 ; |        | $BC80
    .byte $00 ; |        | $BC81
    .byte $00 ; |        | $BC82
    .byte $00 ; |        | $BC83
    .byte $00 ; |        | $BC84
    .byte $00 ; |        | $BC85
    .byte $00 ; |        | $BC86
    .byte $00 ; |        | $BC87
    .byte $00 ; |        | $BC88
    .byte $00 ; |        | $BC89
    .byte $00 ; |        | $BC8A
    .byte $00 ; |        | $BC8B
    .byte $00 ; |        | $BC8C
    .byte $00 ; |        | $BC8D
    .byte $00 ; |        | $BC8E
    .byte $00 ; |        | $BC8F
    .byte $00 ; |        | $BC90
    .byte $00 ; |        | $BC91
    .byte $00 ; |        | $BC92
    .byte $00 ; |        | $BC93
    .byte $00 ; |        | $BC94
    .byte $00 ; |        | $BC95
    .byte $00 ; |        | $BC96
    .byte $00 ; |        | $BC97
    .byte $00 ; |        | $BC98
    .byte $00 ; |        | $BC99
    .byte $00 ; |        | $BC9A
    .byte $00 ; |        | $BC9B
    .byte $00 ; |        | $BC9C
    .byte $00 ; |        | $BC9D
    .byte $00 ; |        | $BC9E
    .byte $00 ; |        | $BC9F
    .byte $00 ; |        | $BCA0
    .byte $00 ; |        | $BCA1
    .byte $00 ; |        | $BCA2
    .byte $00 ; |        | $BCA3
    .byte $00 ; |        | $BCA4
    .byte $00 ; |        | $BCA5
    .byte $00 ; |        | $BCA6
    .byte $00 ; |        | $BCA7
    .byte $00 ; |        | $BCA8
    .byte $00 ; |        | $BCA9
    .byte $00 ; |        | $BCAA
    .byte $00 ; |        | $BCAB
    .byte $00 ; |        | $BCAC
    .byte $00 ; |        | $BCAD
    .byte $00 ; |        | $BCAE
    .byte $00 ; |        | $BCAF
    .byte $00 ; |        | $BCB0
    .byte $00 ; |        | $BCB1
    .byte $00 ; |        | $BCB2
    .byte $00 ; |        | $BCB3
    .byte $00 ; |        | $BCB4
    .byte $00 ; |        | $BCB5
    .byte $00 ; |        | $BCB6
    .byte $00 ; |        | $BCB7
    .byte $00 ; |        | $BCB8
    .byte $00 ; |        | $BCB9
    .byte $00 ; |        | $BCBA
    .byte $00 ; |        | $BCBB
    .byte $00 ; |        | $BCBC
    .byte $00 ; |        | $BCBD
    .byte $00 ; |        | $BCBE
    .byte $00 ; |        | $BCBF
    .byte $00 ; |        | $BCC0
    .byte $00 ; |        | $BCC1
    .byte $00 ; |        | $BCC2
    .byte $00 ; |        | $BCC3
    .byte $00 ; |        | $BCC4
    .byte $00 ; |        | $BCC5
    .byte $00 ; |        | $BCC6
    .byte $00 ; |        | $BCC7
    .byte $00 ; |        | $BCC8
    .byte $00 ; |        | $BCC9
    .byte $00 ; |        | $BCCA
    .byte $00 ; |        | $BCCB
    .byte $00 ; |        | $BCCC
    .byte $00 ; |        | $BCCD
    .byte $00 ; |        | $BCCE
    .byte $00 ; |        | $BCCF
    .byte $00 ; |        | $BCD0
    .byte $00 ; |        | $BCD1
    .byte $00 ; |        | $BCD2
    .byte $00 ; |        | $BCD3
    .byte $00 ; |        | $BCD4
    .byte $00 ; |        | $BCD5
    .byte $00 ; |        | $BCD6
    .byte $00 ; |        | $BCD7
    .byte $00 ; |        | $BCD8
    .byte $00 ; |        | $BCD9
    .byte $00 ; |        | $BCDA
    .byte $00 ; |        | $BCDB
    .byte $00 ; |        | $BCDC
    .byte $00 ; |        | $BCDD
    .byte $00 ; |        | $BCDE
    .byte $00 ; |        | $BCDF
    .byte $00 ; |        | $BCE0
    .byte $00 ; |        | $BCE1
    .byte $00 ; |        | $BCE2
    .byte $00 ; |        | $BCE3
    .byte $00 ; |        | $BCE4
    .byte $00 ; |        | $BCE5
    .byte $00 ; |        | $BCE6
    .byte $00 ; |        | $BCE7
    .byte $00 ; |        | $BCE8
    .byte $00 ; |        | $BCE9
    .byte $00 ; |        | $BCEA
    .byte $00 ; |        | $BCEB
    .byte $00 ; |        | $BCEC
    .byte $00 ; |        | $BCED
    .byte $00 ; |        | $BCEE
    .byte $00 ; |        | $BCEF
    .byte $00 ; |        | $BCF0
    .byte $00 ; |        | $BCF1
    .byte $00 ; |        | $BCF2
    .byte $00 ; |        | $BCF3
    .byte $00 ; |        | $BCF4
    .byte $00 ; |        | $BCF5
    .byte $00 ; |        | $BCF6
    .byte $00 ; |        | $BCF7
    .byte $00 ; |        | $BCF8
    .byte $00 ; |        | $BCF9
    .byte $00 ; |        | $BCFA
    .byte $00 ; |        | $BCFB
    .byte $00 ; |        | $BCFC
    .byte $00 ; |        | $BCFD
    .byte $00 ; |        | $BCFE
    .byte $00 ; |        | $BCFF
    .byte $05 ; |     X X| $BD00
    .byte $05 ; |     X X| $BD01
    .byte $05 ; |     X X| $BD02
    .byte $05 ; |     X X| $BD03
    .byte $05 ; |     X X| $BD04
    .byte $05 ; |     X X| $BD05
    .byte $05 ; |     X X| $BD06
    .byte $05 ; |     X X| $BD07
    .byte $05 ; |     X X| $BD08
    .byte $05 ; |     X X| $BD09
    .byte $05 ; |     X X| $BD0A
    .byte $05 ; |     X X| $BD0B
    .byte $05 ; |     X X| $BD0C
    .byte $05 ; |     X X| $BD0D
    .byte $05 ; |     X X| $BD0E
    .byte $27 ; |  X  XXX| $BD0F
    .byte $27 ; |  X  XXX| $BD10
    .byte $37 ; |  XX XXX| $BD11
    .byte $37 ; |  XX XXX| $BD12
    .byte $27 ; |  X  XXX| $BD13
    .byte $27 ; |  X  XXX| $BD14
    .byte $05 ; |     X X| $BD15
    .byte $05 ; |     X X| $BD16
    .byte $05 ; |     X X| $BD17
    .byte $05 ; |     X X| $BD18
    .byte $05 ; |     X X| $BD19
    .byte $05 ; |     X X| $BD1A
    .byte $05 ; |     X X| $BD1B
    .byte $05 ; |     X X| $BD1C
    .byte $05 ; |     X X| $BD1D
    .byte $05 ; |     X X| $BD1E
    .byte $05 ; |     X X| $BD1F
    .byte $05 ; |     X X| $BD20
    .byte $05 ; |     X X| $BD21
    .byte $05 ; |     X X| $BD22
    .byte $05 ; |     X X| $BD23
    .byte $05 ; |     X X| $BD24
    .byte $05 ; |     X X| $BD25
    .byte $05 ; |     X X| $BD26
    .byte $05 ; |     X X| $BD27
    .byte $05 ; |     X X| $BD28
    .byte $05 ; |     X X| $BD29
    .byte $05 ; |     X X| $BD2A
    .byte $05 ; |     X X| $BD2B
    .byte $05 ; |     X X| $BD2C
    .byte $05 ; |     X X| $BD2D
    .byte $05 ; |     X X| $BD2E
    .byte $05 ; |     X X| $BD2F
    .byte $05 ; |     X X| $BD30
    .byte $05 ; |     X X| $BD31
    .byte $05 ; |     X X| $BD32
    .byte $05 ; |     X X| $BD33
    .byte $05 ; |     X X| $BD34
    .byte $05 ; |     X X| $BD35
    .byte $3F ; |  XXXXXX| $BD36
    .byte $3F ; |  XXXXXX| $BD37
    .byte $3F ; |  XXXXXX| $BD38
    .byte $3F ; |  XXXXXX| $BD39
    .byte $3F ; |  XXXXXX| $BD3A
    .byte $3F ; |  XXXXXX| $BD3B
    .byte $3F ; |  XXXXXX| $BD3C
    .byte $3F ; |  XXXXXX| $BD3D
    .byte $1F ; |   XXXXX| $BD3E
    .byte $1F ; |   XXXXX| $BD3F
    .byte $1F ; |   XXXXX| $BD40
    .byte $0F ; |    XXXX| $BD41
    .byte $0F ; |    XXXX| $BD42
    .byte $07 ; |     XXX| $BD43
    .byte $03 ; |      XX| $BD44
    .byte $01 ; |       X| $BD45
    .byte $01 ; |       X| $BD46
    .byte $00 ; |        | $BD47
    .byte $00 ; |        | $BD48
    .byte $00 ; |        | $BD49
    .byte $00 ; |        | $BD4A
    .byte $00 ; |        | $BD4B
    .byte $00 ; |        | $BD4C
    .byte $00 ; |        | $BD4D
    .byte $00 ; |        | $BD4E
    .byte $00 ; |        | $BD4F
    .byte $00 ; |        | $BD50
    .byte $00 ; |        | $BD51
    .byte $00 ; |        | $BD52
    .byte $00 ; |        | $BD53
    .byte $00 ; |        | $BD54
    .byte $00 ; |        | $BD55
    .byte $00 ; |        | $BD56
    .byte $00 ; |        | $BD57
    .byte $00 ; |        | $BD58
    .byte $00 ; |        | $BD59
    .byte $00 ; |        | $BD5A
    .byte $00 ; |        | $BD5B
    .byte $00 ; |        | $BD5C
    .byte $00 ; |        | $BD5D
    .byte $00 ; |        | $BD5E
    .byte $00 ; |        | $BD5F
    .byte $00 ; |        | $BD60
    .byte $00 ; |        | $BD61
    .byte $0F ; |    XXXX| $BD62
    .byte $1F ; |   XXXXX| $BD63
    .byte $3F ; |  XXXXXX| $BD64
    .byte $7F ; | XXXXXXX| $BD65
    .byte $7F ; | XXXXXXX| $BD66
    .byte $FF ; |XXXXXXXX| $BD67
    .byte $FF ; |XXXXXXXX| $BD68
    .byte $FF ; |XXXXXXXX| $BD69
    .byte $FF ; |XXXXXXXX| $BD6A
    .byte $7F ; | XXXXXXX| $BD6B
    .byte $7F ; | XXXXXXX| $BD6C
    .byte $3F ; |  XXXXXX| $BD6D
    .byte $3F ; |  XXXXXX| $BD6E
    .byte $1F ; |   XXXXX| $BD6F
    .byte $07 ; |     XXX| $BD70
    .byte $03 ; |      XX| $BD71
    .byte $01 ; |       X| $BD72
    .byte $00 ; |        | $BD73
    .byte $00 ; |        | $BD74
    .byte $00 ; |        | $BD75
    .byte $00 ; |        | $BD76
    .byte $00 ; |        | $BD77
    .byte $00 ; |        | $BD78
    .byte $00 ; |        | $BD79
    .byte $00 ; |        | $BD7A
    .byte $00 ; |        | $BD7B
    .byte $00 ; |        | $BD7C
    .byte $00 ; |        | $BD7D
    .byte $00 ; |        | $BD7E
    .byte $00 ; |        | $BD7F
    .byte $00 ; |        | $BD80
    .byte $00 ; |        | $BD81
    .byte $00 ; |        | $BD82
    .byte $00 ; |        | $BD83
    .byte $00 ; |        | $BD84
    .byte $00 ; |        | $BD85
    .byte $00 ; |        | $BD86
    .byte $00 ; |        | $BD87
    .byte $00 ; |        | $BD88
    .byte $00 ; |        | $BD89
    .byte $00 ; |        | $BD8A
    .byte $00 ; |        | $BD8B
    .byte $00 ; |        | $BD8C
    .byte $00 ; |        | $BD8D
    .byte $1F ; |   XXXXX| $BD8E
    .byte $1F ; |   XXXXX| $BD8F
    .byte $1F ; |   XXXXX| $BD90
    .byte $18 ; |   XX   | $BD91
    .byte $17 ; |   X XXX| $BD92
    .byte $1E ; |   XXXX | $BD93
    .byte $1E ; |   XXXX | $BD94
    .byte $1B ; |   XX XX| $BD95
    .byte $1C ; |   XXX  | $BD96
    .byte $1F ; |   XXXXX| $BD97
    .byte $1D ; |   XXX X| $BD98
    .byte $0D ; |    XX X| $BD99
    .byte $0F ; |    XXXX| $BD9A
    .byte $00 ; |        | $BD9B
    .byte $07 ; |     XXX| $BD9C
    .byte $1F ; |   XXXXX| $BD9D
    .byte $1D ; |   XXX X| $BD9E
    .byte $19 ; |   XX  X| $BD9F
    .byte $13 ; |   X  XX| $BDA0
    .byte $01 ; |       X| $BDA1
    .byte $00 ; |        | $BDA2
    .byte $00 ; |        | $BDA3
    .byte $00 ; |        | $BDA4
    .byte $00 ; |        | $BDA5
    .byte $00 ; |        | $BDA6
    .byte $00 ; |        | $BDA7
    .byte $00 ; |        | $BDA8
    .byte $00 ; |        | $BDA9
    .byte $00 ; |        | $BDAA
    .byte $00 ; |        | $BDAB
    .byte $00 ; |        | $BDAC
    .byte $00 ; |        | $BDAD
    .byte $00 ; |        | $BDAE
    .byte $00 ; |        | $BDAF
    .byte $00 ; |        | $BDB0
    .byte $00 ; |        | $BDB1
    .byte $00 ; |        | $BDB2
    .byte $00 ; |        | $BDB3
    .byte $00 ; |        | $BDB4
    .byte $00 ; |        | $BDB5
    .byte $00 ; |        | $BDB6
    .byte $00 ; |        | $BDB7
    .byte $00 ; |        | $BDB8
    .byte $00 ; |        | $BDB9
    .byte $1F ; |   XXXXX| $BDBA
    .byte $1F ; |   XXXXX| $BDBB
    .byte $3F ; |  XXXXXX| $BDBC
    .byte $7F ; | XXXXXXX| $BDBD
    .byte $FF ; |XXXXXXXX| $BDBE
    .byte $E0 ; |XXX     | $BDBF
    .byte $FF ; |XXXXXXXX| $BDC0
    .byte $FE ; |XXXXXXX | $BDC1
    .byte $F6 ; |XXXX XX | $BDC2
    .byte $FB ; |XXXXX XX| $BDC3
    .byte $7C ; | XXXXX  | $BDC4
    .byte $7F ; | XXXXXXX| $BDC5
    .byte $39 ; |  XXX  X| $BDC6
    .byte $00 ; |        | $BDC7
    .byte $07 ; |     XXX| $BDC8
    .byte $1F ; |   XXXXX| $BDC9
    .byte $1D ; |   XXX X| $BDCA
    .byte $19 ; |   XX  X| $BDCB
    .byte $13 ; |   X  XX| $BDCC
    .byte $01 ; |       X| $BDCD
    .byte $00 ; |        | $BDCE
    .byte $00 ; |        | $BDCF
    .byte $00 ; |        | $BDD0
LBDD1:
    .byte $00 ; |        | $BDD1
    .byte $00 ; |        | $BDD2
    .byte $00 ; |        | $BDD3
    .byte $00 ; |        | $BDD4
    .byte $00 ; |        | $BDD5
    .byte $00 ; |        | $BDD6
    .byte $00 ; |        | $BDD7
    .byte $00 ; |        | $BDD8
    .byte $00 ; |        | $BDD9
    .byte $00 ; |        | $BDDA
    .byte $00 ; |        | $BDDB
    .byte $00 ; |        | $BDDC
    .byte $00 ; |        | $BDDD
    .byte $00 ; |        | $BDDE
    .byte $00 ; |        | $BDDF
    .byte $00 ; |        | $BDE0
    .byte $00 ; |        | $BDE1
    .byte $00 ; |        | $BDE2
    .byte $00 ; |        | $BDE3
    .byte $00 ; |        | $BDE4
    .byte $00 ; |        | $BDE5
    .byte $00 ; |        | $BDE6
    .byte $00 ; |        | $BDE7
    .byte $00 ; |        | $BDE8
    .byte $00 ; |        | $BDE9
    .byte $00 ; |        | $BDEA
    .byte $00 ; |        | $BDEB
    .byte $00 ; |        | $BDEC
    .byte $00 ; |        | $BDED
    .byte $00 ; |        | $BDEE
    .byte $00 ; |        | $BDEF
    .byte $00 ; |        | $BDF0
    .byte $00 ; |        | $BDF1
    .byte $00 ; |        | $BDF2
    .byte $00 ; |        | $BDF3
    .byte $00 ; |        | $BDF4
    .byte $00 ; |        | $BDF5
    .byte $00 ; |        | $BDF6
    .byte $00 ; |        | $BDF7
    .byte $00 ; |        | $BDF8
    .byte $00 ; |        | $BDF9
    .byte $00 ; |        | $BDFA
    .byte $00 ; |        | $BDFB
    .byte $00 ; |        | $BDFC
    .byte $00 ; |        | $BDFD
    .byte $00 ; |        | $BDFE
    .byte $00 ; |        | $BDFF
    .byte $DF ; |XX XXXXX| $BE00
    .byte $DB ; |XX XX XX| $BE01
    .byte $DB ; |XX XX XX| $BE02
    .byte $DB ; |XX XX XX| $BE03
    .byte $DB ; |XX XX XX| $BE04
    .byte $DB ; |XX XX XX| $BE05
    .byte $DF ; |XX XXXXX| $BE06
    .byte $03 ; |      XX| $BE07
    .byte $03 ; |      XX| $BE08
    .byte $03 ; |      XX| $BE09
    .byte $03 ; |      XX| $BE0A
    .byte $03 ; |      XX| $BE0B
    .byte $07 ; |     XXX| $BE0C
    .byte $03 ; |      XX| $BE0D
    .byte $7C ; | XXXXX  | $BE0E
    .byte $6C ; | XX XX  | $BE0F
    .byte $6C ; | XX XX  | $BE10
    .byte $6C ; | XX XX  | $BE11
    .byte $6C ; | XX XX  | $BE12
    .byte $6C ; | XX XX  | $BE13
    .byte $7C ; | XXXXX  | $BE14
    .byte $07 ; |     XXX| $BE15
    .byte $06 ; |     XX | $BE16
    .byte $06 ; |     XX | $BE17
    .byte $07 ; |     XXX| $BE18
    .byte $00 ; |        | $BE19
    .byte $06 ; |     XX | $BE1A
    .byte $07 ; |     XXX| $BE1B
    .byte $DF ; |XX XXXXX| $BE1C
    .byte $DB ; |XX XX XX| $BE1D
    .byte $1B ; |   XX XX| $BE1E
    .byte $DB ; |XX XX XX| $BE1F
    .byte $DB ; |XX XX XX| $BE20
    .byte $DB ; |XX XX XX| $BE21
    .byte $DF ; |XX XXXXX| $BE22
    .byte $07 ; |     XXX| $BE23
    .byte $06 ; |     XX | $BE24
    .byte $00 ; |        | $BE25
    .byte $03 ; |      XX| $BE26
    .byte $00 ; |        | $BE27
    .byte $06 ; |     XX | $BE28
    .byte $07 ; |     XXX| $BE29
    .byte $01 ; |       X| $BE2A
    .byte $01 ; |       X| $BE2B
    .byte $01 ; |       X| $BE2C
    .byte $0F ; |    XXXX| $BE2D
    .byte $0D ; |    XX X| $BE2E
    .byte $0D ; |    XX X| $BE2F
    .byte $0D ; |    XX X| $BE30
    .byte $9F ; |X  XXXXX| $BE31
    .byte $9B ; |X  XX XX| $BE32
    .byte $9B ; |X  XX XX| $BE33
    .byte $DB ; |XX XX XX| $BE34
    .byte $9B ; |X  XX XX| $BE35
    .byte $9B ; |X  XX XX| $BE36
    .byte $9F ; |X  XXXXX| $BE37
    .byte $07 ; |     XXX| $BE38
    .byte $06 ; |     XX | $BE39
    .byte $00 ; |        | $BE3A
    .byte $07 ; |     XXX| $BE3B
    .byte $06 ; |     XX | $BE3C
    .byte $06 ; |     XX | $BE3D
    .byte $07 ; |     XXX| $BE3E
    .byte $DF ; |XX XXXXX| $BE3F
    .byte $DB ; |XX XX XX| $BE40
    .byte $DB ; |XX XX XX| $BE41
    .byte $DB ; |XX XX XX| $BE42
    .byte $1B ; |   XX XX| $BE43
    .byte $DB ; |XX XX XX| $BE44
    .byte $DF ; |XX XXXXX| $BE45
    .byte $07 ; |     XXX| $BE46
    .byte $06 ; |     XX | $BE47
    .byte $06 ; |     XX | $BE48
    .byte $07 ; |     XXX| $BE49
    .byte $06 ; |     XX | $BE4A
    .byte $06 ; |     XX | $BE4B
    .byte $07 ; |     XXX| $BE4C
    .byte $00 ; |        | $BE4D
    .byte $00 ; |        | $BE4E
    .byte $00 ; |        | $BE4F
    .byte $00 ; |        | $BE50
    .byte $00 ; |        | $BE51
    .byte $06 ; |     XX | $BE52
    .byte $07 ; |     XXX| $BE53
    .byte $37 ; |  XX XXX| $BE54
    .byte $36 ; |  XX XX | $BE55
    .byte $36 ; |  XX XX | $BE56
    .byte $36 ; |  XX XX | $BE57
    .byte $36 ; |  XX XX | $BE58
    .byte $76 ; | XXX XX | $BE59
    .byte $37 ; |  XX XXX| $BE5A
    .byte $03 ; |      XX| $BE5B
    .byte $03 ; |      XX| $BE5C
    .byte $E3 ; |XXX   XX| $BE5D
    .byte $E3 ; |XXX   XX| $BE5E
    .byte $03 ; |      XX| $BE5F
    .byte $07 ; |     XXX| $BE60
    .byte $03 ; |      XX| $BE61
    .byte $07 ; |     XXX| $BE62
    .byte $06 ; |     XX | $BE63
    .byte $06 ; |     XX | $BE64
    .byte $E7 ; |XXX  XXX| $BE65
    .byte $E0 ; |XXX     | $BE66
    .byte $06 ; |     XX | $BE67
    .byte $07 ; |     XXX| $BE68
    .byte $07 ; |     XXX| $BE69
    .byte $06 ; |     XX | $BE6A
    .byte $00 ; |        | $BE6B
    .byte $E3 ; |XXX   XX| $BE6C
    .byte $E0 ; |XXX     | $BE6D
    .byte $06 ; |     XX | $BE6E
    .byte $07 ; |     XXX| $BE6F
    .byte $01 ; |       X| $BE70
    .byte $01 ; |       X| $BE71
    .byte $01 ; |       X| $BE72
    .byte $EF ; |XXX XXXX| $BE73
    .byte $ED ; |XXX XX X| $BE74
    .byte $0D ; |    XX X| $BE75
    .byte $0D ; |    XX X| $BE76
LBE77:
    .byte $00 ; |        | $BE77
    .byte $7C ; | XXXXX  | $BE78
    .byte $66 ; | XX  XX | $BE79
    .byte $66 ; | XX  XX | $BE7A
    .byte $7C ; | XXXXX  | $BE7B
    .byte $66 ; | XX  XX | $BE7C
    .byte $7C ; | XXXXX  | $BE7D
    .byte $00 ; |        | $BE7E
    .byte $00 ; |        | $BE7F
    .byte $00 ; |        | $BE80
    .byte $00 ; |        | $BE81
    .byte $00 ; |        | $BE82
    .byte $00 ; |        | $BE83
    .byte $00 ; |        | $BE84
    .byte $00 ; |        | $BE85
    .byte $3C ; |  XXXX  | $BE86
    .byte $06 ; |     XX | $BE87
    .byte $06 ; |     XX | $BE88
    .byte $3C ; |  XXXX  | $BE89
    .byte $60 ; | XX     | $BE8A
    .byte $3C ; |  XXXX  | $BE8B
LBE8C:
    .byte $00 ; |        | $BE8C
    .byte $3C ; |  XXXX  | $BE8D
    .byte $66 ; | XX  XX | $BE8E
    .byte $66 ; | XX  XX | $BE8F
    .byte $66 ; | XX  XX | $BE90
    .byte $66 ; | XX  XX | $BE91
    .byte $3C ; |  XXXX  | $BE92
    .byte $00 ; |        | $BE93
    .byte $00 ; |        | $BE94
    .byte $00 ; |        | $BE95
    .byte $00 ; |        | $BE96
    .byte $00 ; |        | $BE97
    .byte $00 ; |        | $BE98
    .byte $00 ; |        | $BE99
    .byte $00 ; |        | $BE9A
    .byte $3C ; |  XXXX  | $BE9B
    .byte $66 ; | XX  XX | $BE9C
    .byte $66 ; | XX  XX | $BE9D
    .byte $66 ; | XX  XX | $BE9E
    .byte $66 ; | XX  XX | $BE9F
    .byte $3C ; |  XXXX  | $BEA0
LBEA1:
    .byte $00 ; |        | $BEA1
    .byte $66 ; | XX  XX | $BEA2
    .byte $66 ; | XX  XX | $BEA3
    .byte $7E ; | XXXXXX | $BEA4
    .byte $7E ; | XXXXXX | $BEA5
    .byte $76 ; | XXX XX | $BEA6
    .byte $66 ; | XX  XX | $BEA7
    .byte $00 ; |        | $BEA8
    .byte $66 ; | XX  XX | $BEA9
    .byte $66 ; | XX  XX | $BEAA
    .byte $7E ; | XXXXXX | $BEAB
    .byte $7E ; | XXXXXX | $BEAC
    .byte $76 ; | XXX XX | $BEAD
    .byte $66 ; | XX  XX | $BEAE
    .byte $00 ; |        | $BEAF
    .byte $66 ; | XX  XX | $BEB0
    .byte $6C ; | XX XX  | $BEB1
    .byte $7C ; | XXXXX  | $BEB2
    .byte $66 ; | XX  XX | $BEB3
    .byte $66 ; | XX  XX | $BEB4
    .byte $7C ; | XXXXX  | $BEB5
LBEB6:
    .byte $00 ; |        | $BEB6
    .byte $7E ; | XXXXXX | $BEB7
    .byte $66 ; | XX  XX | $BEB8
    .byte $66 ; | XX  XX | $BEB9
    .byte $66 ; | XX  XX | $BEBA
    .byte $66 ; | XX  XX | $BEBB
    .byte $66 ; | XX  XX | $BEBC
    .byte $00 ; |        | $BEBD
    .byte $3C ; |  XXXX  | $BEBE
    .byte $66 ; | XX  XX | $BEBF
    .byte $66 ; | XX  XX | $BEC0
    .byte $66 ; | XX  XX | $BEC1
    .byte $66 ; | XX  XX | $BEC2
    .byte $3C ; |  XXXX  | $BEC3
    .byte $00 ; |        | $BEC4
    .byte $66 ; | XX  XX | $BEC5
    .byte $6C ; | XX XX  | $BEC6
    .byte $7C ; | XXXXX  | $BEC7
    .byte $66 ; | XX  XX | $BEC8
    .byte $66 ; | XX  XX | $BEC9
    .byte $7C ; | XXXXX  | $BECA
LBECB:
    .byte $00 ; |        | $BECB
    .byte $3C ; |  XXXX  | $BECC
    .byte $06 ; |     XX | $BECD
    .byte $06 ; |     XX | $BECE
    .byte $3C ; |  XXXX  | $BECF
    .byte $60 ; | XX     | $BED0
    .byte $3C ; |  XXXX  | $BED1
    .byte $00 ; |        | $BED2
    .byte $00 ; |        | $BED3
    .byte $00 ; |        | $BED4
    .byte $00 ; |        | $BED5
    .byte $00 ; |        | $BED6
    .byte $00 ; |        | $BED7
    .byte $00 ; |        | $BED8
    .byte $00 ; |        | $BED9
    .byte $18 ; |   XX   | $BEDA
    .byte $18 ; |   XX   | $BEDB
    .byte $18 ; |   XX   | $BEDC
    .byte $3C ; |  XXXX  | $BEDD
    .byte $66 ; | XX  XX | $BEDE
    .byte $66 ; | XX  XX | $BEDF
    .byte $00 ; |        | $BEE0
    .byte $00 ; |        | $BEE1
    .byte $00 ; |        | $BEE2
    .byte $00 ; |        | $BEE3
    .byte $00 ; |        | $BEE4
    .byte $00 ; |        | $BEE5
    .byte $00 ; |        | $BEE6
    .byte $00 ; |        | $BEE7
    .byte $00 ; |        | $BEE8
    .byte $00 ; |        | $BEE9
    .byte $00 ; |        | $BEEA
    .byte $00 ; |        | $BEEB
    .byte $00 ; |        | $BEEC
    .byte $00 ; |        | $BEED
    .byte $00 ; |        | $BEEE
    .byte $00 ; |        | $BEEF
    .byte $00 ; |        | $BEF0
    .byte $00 ; |        | $BEF1
    .byte $00 ; |        | $BEF2
    .byte $00 ; |        | $BEF3
    .byte $00 ; |        | $BEF4
    .byte $00 ; |        | $BEF5
    .byte $00 ; |        | $BEF6
    .byte $00 ; |        | $BEF7
    .byte $00 ; |        | $BEF8
    .byte $00 ; |        | $BEF9
    .byte $00 ; |        | $BEFA
    .byte $00 ; |        | $BEFB
    .byte $00 ; |        | $BEFC
    .byte $00 ; |        | $BEFD
    .byte $00 ; |        | $BEFE
    .byte $00 ; |        | $BEFF
LBF00:
    .byte $00 ; |        | $BF00
    .byte $AE ; |X X XXX | $BF01
    .byte $CC ; |XX  XX  | $BF02
    .byte $A8 ; |X X X   | $BF03
    .byte $CE ; |XX  XXX | $BF04
    .byte $00 ; |        | $BF05
    .byte $AC ; |X X XX  | $BF06
    .byte $EA ; |XXX X X | $BF07
    .byte $EA ; |XXX X X | $BF08
    .byte $AC ; |X X XX  | $BF09
LBF0A:
    .byte $00 ; |        | $BF0A
    .byte $EE ; |XXX XXX | $BF0B
    .byte $8A ; |X   X X | $BF0C
    .byte $8A ; |X   X X | $BF0D
    .byte $EE ; |XXX XXX | $BF0E
    .byte $00 ; |        | $BF0F
    .byte $EE ; |XXX XXX | $BF10
    .byte $AA ; |X X X X | $BF11
    .byte $AA ; |X X X X | $BF12
    .byte $EA ; |XXX X X | $BF13
LBF14:
    .byte $00 ; |        | $BF14
    .byte $0E ; |    XXX | $BF15
    .byte $06 ; |     XX | $BF16
    .byte $08 ; |    X   | $BF17
    .byte $0E ; |    XXX | $BF18
    .byte $00 ; |        | $BF19
    .byte $0A ; |    X X | $BF1A
    .byte $0C ; |    XX  | $BF1B
    .byte $0A ; |    X X | $BF1C
    .byte $0C ; |    XX  | $BF1D
LBF1E:
    .byte $00 ; |        | $BF1E
    .byte $80 ; |X       | $BF1F
    .byte $80 ; |X       | $BF20
    .byte $80 ; |X       | $BF21
    .byte $C0 ; |XX      | $BF22
    .byte $00 ; |        | $BF23
    .byte $C0 ; |XX      | $BF24
    .byte $80 ; |X       | $BF25
    .byte $00 ; |        | $BF26
    .byte $C0 ; |XX      | $BF27
LBF28:
    .byte $00 ; |        | $BF28
    .byte $D4 ; |XX X X  | $BF29
    .byte $5C ; | X XXX  | $BF2A
    .byte $5C ; | X XXX  | $BF2B
    .byte $55 ; | X X X X| $BF2C
    .byte $00 ; |        | $BF2D
    .byte $ED ; |XXX XX X| $BF2E
    .byte $A9 ; |X X X  X| $BF2F
    .byte $A9 ; |X X X  X| $BF30
    .byte $E9 ; |XXX X  X| $BF31
LBF32:
    .byte $00 ; |        | $BF32
    .byte $DD ; |XX XXX X| $BF33
    .byte $95 ; |X  X X X| $BF34
    .byte $95 ; |X  X X X| $BF35
    .byte $DD ; |XX XXX X| $BF36
    .byte $00 ; |        | $BF37
    .byte $22 ; |  X   X | $BF38
    .byte $2A ; |  X X X | $BF39
    .byte $3E ; |  XXXXX | $BF3A
    .byte $36 ; |  XX XX | $BF3B
LBF3C:
    .byte $00 ; |        | $BF3C
    .byte $00 ; |        | $BF3D
    .byte $00 ; |        | $BF3E
    .byte $00 ; |        | $BF3F
    .byte $00 ; |        | $BF40
    .byte $F0 ; |XXXX    | $BF41
    .byte $F0 ; |XXXX    | $BF42
    .byte $00 ; |        | $BF43
    .byte $00 ; |        | $BF44
    .byte $00 ; |        | $BF45
    .byte $00 ; |        | $BF46
LBF47:
    .byte $00 ; |        | $BF47
    .byte $FF ; |XXXXXXXX| $BF48
    .byte $00 ; |        | $BF49
    .byte $7E ; | XXXXXX | $BF4A
    .byte $4E ; | X  XXX | $BF4B
    .byte $0E ; |    XXX | $BF4C
    .byte $1C ; |   XXX  | $BF4D
    .byte $0E ; |    XXX | $BF4E
    .byte $4E ; | X  XXX | $BF4F
    .byte $7E ; | XXXXXX | $BF50
    .byte $00 ; |        | $BF51
LBF52:
    .byte $00 ; |        | $BF52
    .byte $FF ; |XXXXXXXX| $BF53
    .byte $00 ; |        | $BF54
    .byte $7E ; | XXXXXX | $BF55
    .byte $72 ; | XXX  X | $BF56
    .byte $72 ; | XXX  X | $BF57
    .byte $72 ; | XXX  X | $BF58
    .byte $72 ; | XXX  X | $BF59
    .byte $72 ; | XXX  X | $BF5A
    .byte $7E ; | XXXXXX | $BF5B
    .byte $00 ; |        | $BF5C
LBF5D:
    .byte $7E ; | XXXXXX | $BF5D
    .byte $72 ; | XXX  X | $BF5E
    .byte $72 ; | XXX  X | $BF5F
    .byte $72 ; | XXX  X | $BF60
    .byte $72 ; | XXX  X | $BF61
    .byte $72 ; | XXX  X | $BF62
    .byte $7E ; | XXXXXX | $BF63
    .byte $1C ; |   XXX  | $BF64
    .byte $1C ; |   XXX  | $BF65
    .byte $1C ; |   XXX  | $BF66
    .byte $1C ; |   XXX  | $BF67
    .byte $1C ; |   XXX  | $BF68
    .byte $1C ; |   XXX  | $BF69
    .byte $3C ; |  XXXX  | $BF6A
    .byte $7E ; | XXXXXX | $BF6B
    .byte $40 ; | X      | $BF6C
    .byte $7E ; | XXXXXX | $BF6D
    .byte $0E ; |    XXX | $BF6E
    .byte $0E ; |    XXX | $BF6F
    .byte $4E ; | X  XXX | $BF70
    .byte $7E ; | XXXXXX | $BF71
    .byte $7E ; | XXXXXX | $BF72
    .byte $4E ; | X  XXX | $BF73
    .byte $0E ; |    XXX | $BF74
    .byte $1C ; |   XXX  | $BF75
    .byte $0E ; |    XXX | $BF76
    .byte $4E ; | X  XXX | $BF77
    .byte $7E ; | XXXXXX | $BF78
    .byte $1C ; |   XXX  | $BF79
    .byte $1C ; |   XXX  | $BF7A
    .byte $7E ; | XXXXXX | $BF7B
    .byte $5C ; | X XXX  | $BF7C
    .byte $5C ; | X XXX  | $BF7D
    .byte $5C ; | X XXX  | $BF7E
    .byte $7C ; | XXXXX  | $BF7F
    .byte $7E ; | XXXXXX | $BF80
    .byte $4E ; | X  XXX | $BF81
    .byte $0E ; |    XXX | $BF82
    .byte $7E ; | XXXXXX | $BF83
    .byte $40 ; | X      | $BF84
    .byte $4E ; | X  XXX | $BF85
    .byte $7E ; | XXXXXX | $BF86
    .byte $7E ; | XXXXXX | $BF87
    .byte $4E ; | X  XXX | $BF88
    .byte $4E ; | X  XXX | $BF89
    .byte $7E ; | XXXXXX | $BF8A
    .byte $40 ; | X      | $BF8B
    .byte $4E ; | X  XXX | $BF8C
    .byte $7E ; | XXXXXX | $BF8D
    .byte $0E ; |    XXX | $BF8E
    .byte $0E ; |    XXX | $BF8F
    .byte $0E ; |    XXX | $BF90
    .byte $0E ; |    XXX | $BF91
    .byte $0E ; |    XXX | $BF92
    .byte $4E ; | X  XXX | $BF93
    .byte $7E ; | XXXXXX | $BF94
    .byte $7E ; | XXXXXX | $BF95
    .byte $4E ; | X  XXX | $BF96
    .byte $4E ; | X  XXX | $BF97
    .byte $7E ; | XXXXXX | $BF98
    .byte $72 ; | XXX  X | $BF99
    .byte $72 ; | XXX  X | $BF9A
    .byte $7E ; | XXXXXX | $BF9B
    .byte $7E ; | XXXXXX | $BF9C
    .byte $72 ; | XXX  X | $BF9D
    .byte $02 ; |      X | $BF9E
    .byte $7E ; | XXXXXX | $BF9F
    .byte $72 ; | XXX  X | $BFA0
    .byte $72 ; | XXX  X | $BFA1
    .byte $7E ; | XXXXXX | $BFA2
    .byte $00 ; |        | $BFA3
    .byte $00 ; |        | $BFA4
    .byte $00 ; |        | $BFA5
    .byte $00 ; |        | $BFA6
    .byte $00 ; |        | $BFA7
    .byte $00 ; |        | $BFA8
    .byte $00 ; |        | $BFA9
    .byte $6C ; | XX XX  | $BFAA
    .byte $82 ; |X     X | $BFAB
    .byte $BA ; |X XXX X | $BFAC
    .byte $A2 ; |X X   X | $BFAD
    .byte $BA ; |X XXX X | $BFAE
    .byte $82 ; |X     X | $BFAF
    .byte $6C ; | XX XX  | $BFB0
    .byte $00 ; |        | $BFB1
    .byte $77 ; | XXX XXX| $BFB2
    .byte $21 ; |  X    X| $BFB3
    .byte $21 ; |  X    X| $BFB4
    .byte $27 ; |  X  XXX| $BFB5
    .byte $65 ; | XX  X X| $BFB6
    .byte $27 ; |  X  XXX| $BFB7
    .byte $00 ; |        | $BFB8
    .byte $77 ; | XXX XXX| $BFB9
    .byte $51 ; | X X   X| $BFBA
    .byte $51 ; | X X   X| $BFBB
    .byte $77 ; | XXX XXX| $BFBC
    .byte $51 ; | X X   X| $BFBD
    .byte $77 ; | XXX XXX| $BFBE
    .byte $00 ; |        | $BFBF
    .byte $05 ; |     X X| $BFC0
    .byte $05 ; |     X X| $BFC1
    .byte $25 ; |  X  X X| $BFC2
    .byte $27 ; |  X  XXX| $BFC3
    .byte $05 ; |     X X| $BFC4
    .byte $07 ; |     XXX| $BFC5
    .byte $00 ; |        | $BFC6
    .byte $25 ; |  X  X X| $BFC7
    .byte $25 ; |  X  X X| $BFC8
    .byte $25 ; |  X  X X| $BFC9
    .byte $27 ; |  X  XXX| $BFCA
    .byte $25 ; |  X  X X| $BFCB
    .byte $77 ; | XXX XXX| $BFCC
    .byte $00 ; |        | $BFCD
    .byte $47 ; | X   XXX| $BFCE
    .byte $42 ; | X    X | $BFCF
    .byte $42 ; | X    X | $BFD0
    .byte $42 ; | X    X | $BFD1
    .byte $52 ; | X X  X | $BFD2
    .byte $77 ; | XXX XXX| $BFD3
    .byte $00 ; |        | $BFD4
    .byte $EA ; |XXX X X | $BFD5
    .byte $AA ; |X X X X | $BFD6
    .byte $EE ; |XXX XXX | $BFD7
    .byte $8A ; |X   X X | $BFD8
    .byte $EE ; |XXX XXX | $BFD9
    .byte $00 ; |        | $BFDA
    .byte $00 ; |        | $BFDB
    .byte $AB ; |X X X XX| $BFDC
    .byte $AA ; |X X X X | $BFDD
    .byte $FB ; |XXXXX XX| $BFDE
    .byte $DA ; |XX XX X | $BFDF
    .byte $8B ; |X   X XX| $BFE0
    .byte $00 ; |        | $BFE1
    .byte $00 ; |        | $BFE2
    .byte $42 ; | X    X | $BFE3
    .byte $A5 ; |X X  X X| $BFE4
    .byte $A8 ; |X X X   | $BFE5
    .byte $A8 ; |X X X   | $BFE6
    .byte $48 ; | X  X   | $BFE7
    .byte $00 ; |        | $BFE8
    .byte $00 ; |        | $BFE9
    .byte $35 ; |  XX X X| $BFEA
    .byte $25 ; |  X  X X| $BFEB
    .byte $B6 ; |X XX XX | $BFEC
    .byte $A5 ; |X X  X X| $BFED
    .byte $B6 ; |X XX XX | $BFEE
    .byte $00 ; |        | $BFEF

       ORG $0FF0
      RORG $BFF0

LBFF0:
    lda    $FFF9                 ; 4
    jmp.ind ($0080)              ; 5

    .byte $00 ; |        | $BFF6
    .byte $00 ; |        | $BFF7
    .byte $00 ; |        | $BFF8
    .byte $00 ; |        | $BFF9

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
    lda    #$00                  ; 2
    sta    ram_80                ; 3
    lda    #$B0                  ; 2
    sta    ram_81                ; 3
    jmp    LFFF0                 ; 3

    lda    ram_8A                ; 3
    bne    LF014                 ; 2³
    dec    ram_8A                ; 5
    jsr    LF2B6                 ; 6
LF014:
    jsr    LF26B                 ; 6
LF017:
    lda    INTIM                 ; 4
    bne    LF017                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    sta    HMOVE                 ; 3
    jsr    LF033                 ; 6
    lda    #$3A                  ; 2
    sta    ram_80                ; 3
    lda    #$B0                  ; 2
    sta    ram_81                ; 3
    jmp    LFFF0                 ; 3

LF030:
    sta    WSYNC                 ; 3
;---------------------------------------
LF032:
    rts                          ; 6

LF033:
    lda    ram_8C                ; 3
    beq    LF030                 ; 2³
    lda    ram_EB                ; 3
    and    #$03                  ; 2
    bne    LF03F                 ; 2³
    dec    ram_F8                ; 5
LF03F:
    lda    ram_F8                ; 3
    bpl    LF032                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_B9                ; 3
    beq    LF04D                 ; 2³
    cmp    #$3E                  ; 2
    bne    LF053                 ; 2³
LF04D:
    lda    ram_97                ; 3
    and    #$0F                  ; 2
    bne    LF05B                 ; 2³
LF053:
    dec    ram_B9                ; 5
    bpl    LF05B                 ; 2³
    lda    #$7C                  ; 2
    sta    ram_B9                ; 3
LF05B:
    lda    ram_B9                ; 3
    sta    ram_90                ; 3
    cmp    #$3F                  ; 2
    bcc    LF06A                 ; 2³
    lda    #$7C                  ; 2
    sec                          ; 2
    sbc    ram_90                ; 3
    sta    ram_90                ; 3
LF06A:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$20                  ; 2
    clc                          ; 2
    adc    ram_90                ; 3
    sta    ram_E9                ; 3
    lda    #$F7                  ; 2
    sta    ram_EA                ; 3
    lda    #$20                  ; 2
    clc                          ; 2
    adc    ram_90                ; 3
    sta    ram_E7                ; 3
    lda    #$F8                  ; 2
    sta    ram_E8                ; 3
    lda    #$20                  ; 2
    clc                          ; 2
    adc    ram_90                ; 3
    sta    ram_E5                ; 3
    lda    #$F9                  ; 2
    sta    ram_E6                ; 3
    lda    #$20                  ; 2
    clc                          ; 2
    adc    ram_90                ; 3
    sta    ram_E3                ; 3
    lda    #$FA                  ; 2
    sta    ram_E4                ; 3
    lda    #$20                  ; 2
    clc                          ; 2
    adc    ram_90                ; 3
    sta    ram_E1                ; 3
    lda    #$FB                  ; 2
    sta    ram_E2                ; 3
    lda    #$20                  ; 2
    clc                          ; 2
    adc    ram_90                ; 3
    sta    ram_DF                ; 3
    lda    #$FC                  ; 2
    sta    ram_E0                ; 3
    ldy    #$20                  ; 2
LF0B0:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    dey                          ; 2
    bpl    LF0B0                 ; 2³
    lda    #$B8                  ; 2
    sta    ram_91                ; 3
    jsr    LF23A                 ; 6
    lda    #$1B                  ; 2
    sta    ram_F2                ; 3
LF0CA:
    ldy    ram_F2                ; 3
    lda    LF79B,Y               ; 4
    sta.w  GRP0                  ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LF89B,Y               ; 4
    sta.w  GRP1                  ; 4
    lda    LF99B,Y               ; 4
    sta.w  GRP0                  ; 4
    lda    LFA9B,Y               ; 4
    sta    ram_91                ; 3
    lda    LFB9B,Y               ; 4
    tax                          ; 2
    nop                          ; 2
    lda    LFC9B,Y               ; 4
    tay                          ; 2
    lda    ram_91                ; 3
    sta.w  GRP1                  ; 4
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    ram_F2                ; 5
    bpl    LF0CA                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #$36                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$3C                  ; 2
    sta    ram_F2                ; 3
LF10F:
    ldy    ram_F2                ; 3
    lda    (ram_E9),Y            ; 5
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_E7),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_E5),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_E3),Y            ; 5
    sta    ram_91                ; 3
    lda    (ram_E1),Y            ; 5
    tax                          ; 2
    lda    (ram_DF),Y            ; 5
    tay                          ; 2
    lda    ram_91                ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    ram_F2                ; 5
    bpl    LF10F                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #$15                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$06                  ; 2
    sta    ram_F2                ; 3
LF149:
    ldy    ram_F2                ; 3
    lda    LF719,Y               ; 4
    sta.w  GRP0                  ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LF819,Y               ; 4
    sta.w  GRP1                  ; 4
    lda    LF919,Y               ; 4
    sta.w  GRP0                  ; 4
    lda    LFA19,Y               ; 4
    sta    ram_91                ; 3
    lda    LFB19,Y               ; 4
    tax                          ; 2
    nop                          ; 2
    lda    LFC19,Y               ; 4
    tay                          ; 2
    lda    ram_91                ; 3
    sta.w  GRP1                  ; 4
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    ram_F2                ; 5
    bpl    LF149                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    lda    #$B8                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$17                  ; 2
    sta    ram_F2                ; 3
LF18E:
    ldy    ram_F2                ; 3
    lda    LF700,Y               ; 4
    sta.w  GRP0                  ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    LF800,Y               ; 4
    sta.w  GRP1                  ; 4
    lda    LF900,Y               ; 4
    sta.w  GRP0                  ; 4
    lda    LFA00,Y               ; 4
    sta    ram_91                ; 3
    lda    LFB00,Y               ; 4
    tax                          ; 2
    nop                          ; 2
    lda    LFC00,Y               ; 4
    tay                          ; 2
    lda    ram_91                ; 3
    sta.w  GRP1                  ; 4
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    ram_F2                ; 5
    bpl    LF18E                 ; 2³
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    ldy    #$00                  ; 2
    ldx    #$00                  ; 2
LF1D5:
    lda    ram_D3,X              ; 4
    sta    ram_91                ; 3
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    sec                          ; 2
    sbc    ram_91                ; 3
    clc                          ; 2
    adc    #$00                  ; 2
    sta.wy ram_DF,Y              ; 5
    lda    #$FD                  ; 2
    sta.wy ram_E0,Y              ; 5
    iny                          ; 2
    iny                          ; 2
    inx                          ; 2
    cpx    #$06                  ; 2
    bne    LF1D5                 ; 2³
    lda    #$FF                  ; 2
    sta    ram_91                ; 3
    stx    ram_92                ; 3
    ldy    #$12                  ; 2
LF1F9:
    sta    WSYNC                 ; 3
;---------------------------------------
    dey                          ; 2
    bpl    LF1F9                 ; 2³
    jsr    LF23A                 ; 6
LF201:
    ldy    ram_F2                ; 3
    lda    (ram_E9),Y            ; 5
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_E7),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_E5),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_E3),Y            ; 5
    sta    ram_91                ; 3
    lda    (ram_E1),Y            ; 5
    tax                          ; 2
    lda    (ram_DF),Y            ; 5
    tay                          ; 2
    lda    ram_91                ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sta    GRP0                  ; 3
    dec    ram_F2                ; 5
    bpl    LF201                 ; 2³
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    rts                          ; 6

LF23A:
    lda    #$03                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    ldx    #$FF                  ; 2
    stx    VDELP0                ; 3
    stx    VDELP1                ; 3
    lda    ram_92                ; 3
    sta    ram_F2                ; 3
    ldy    #$06                  ; 2
    sty    WSYNC                 ; 3
;---------------------------------------
LF24E:
    dey                          ; 2
    bpl    LF24E                 ; 2³
    nop                          ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    lda    #$F0                  ; 2
    sta    HMP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$00                  ; 2
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    lda    ram_91                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    rts                          ; 6

LF26B:
    ldx    #$01                  ; 2
LF26D:
    jsr    LF278                 ; 6
    lda    ram_8C                ; 3
    beq    LF277                 ; 2³
    dex                          ; 2
    bpl    LF26D                 ; 2³
LF277:
    rts                          ; 6

LF278:
    ldy    ram_88,X              ; 4
    beq    LF2AD                 ; 2³
    inc    ram_86,X              ; 6
    lda    LF2D8,Y               ; 4
    cmp    ram_86,X              ; 4
    bcc    LF294                 ; 2³
LF285:
    lda    ram_86,X              ; 4
    tay                          ; 2
    lda    LF339,Y               ; 4
    sta    AUDV0,X               ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    AUDC0,X               ; 4
    rts                          ; 6

LF294:
    jsr    LF29A                 ; 6
    jmp    LF285                 ; 3

LF29A:
    inc    ram_88,X              ; 6
    ldy    ram_88,X              ; 4
    lda    LF2D8,Y               ; 4
    beq    LF2AD                 ; 2³
    and    #$E0                  ; 2
    sta    ram_86,X              ; 4
    lda    LF308,Y               ; 4
    sta    AUDF0,X               ; 4
    rts                          ; 6

LF2AD:
    lda    #$00                  ; 2
    sta    ram_88,X              ; 4
    sta    AUDV0,X               ; 4
    sta    ram_8A                ; 3
    rts                          ; 6

LF2B6:
    lda    #$00                  ; 2
    tay                          ; 2
    ldx    #$01                  ; 2
LF2BB:
    lda    LF2D5,Y               ; 4
    sta    ram_88,X              ; 4
    lda    LF2D7,Y               ; 4
    beq    LF2CC                 ; 2³
    tya                          ; 2
    pha                          ; 3
    jsr    LF29A                 ; 6
    pla                          ; 4
    tay                          ; 2
LF2CC:
    iny                          ; 2
    lda    ram_8C                ; 3
    beq    LF2D4                 ; 2³
    dex                          ; 2
    bpl    LF2BB                 ; 2³
LF2D4:
    rts                          ; 6

LF2D5:
    .byte $1C ; |   XXX  | $F2D5
    .byte $00 ; |        | $F2D6
LF2D7:
    .byte $01 ; |       X| $F2D7
LF2D8:
    .byte $01 ; |       X| $F2D8
    .byte $11 ; |   X   X| $F2D9
    .byte $08 ; |    X   | $F2DA
    .byte $08 ; |    X   | $F2DB
    .byte $08 ; |    X   | $F2DC
    .byte $08 ; |    X   | $F2DD
    .byte $19 ; |   XX  X| $F2DE
    .byte $08 ; |    X   | $F2DF
    .byte $08 ; |    X   | $F2E0
    .byte $08 ; |    X   | $F2E1
    .byte $08 ; |    X   | $F2E2
    .byte $08 ; |    X   | $F2E3
    .byte $19 ; |   XX  X| $F2E4
    .byte $08 ; |    X   | $F2E5
    .byte $08 ; |    X   | $F2E6
    .byte $08 ; |    X   | $F2E7
    .byte $08 ; |    X   | $F2E8
    .byte $08 ; |    X   | $F2E9
    .byte $08 ; |    X   | $F2EA
    .byte $08 ; |    X   | $F2EB
    .byte $08 ; |    X   | $F2EC
    .byte $08 ; |    X   | $F2ED
    .byte $08 ; |    X   | $F2EE
    .byte $08 ; |    X   | $F2EF
    .byte $08 ; |    X   | $F2F0
    .byte $08 ; |    X   | $F2F1
    .byte $11 ; |   X   X| $F2F2
    .byte $19 ; |   XX  X| $F2F3
    .byte $00 ; |        | $F2F4
    .byte $51 ; | X X   X| $F2F5
    .byte $51 ; | X X   X| $F2F6
    .byte $51 ; | X X   X| $F2F7
    .byte $5F ; | X XXXXX| $F2F8
    .byte $23 ; |  X   XX| $F2F9
    .byte $51 ; | X X   X| $F2FA
    .byte $51 ; | X X   X| $F2FB
    .byte $5F ; | X XXXXX| $F2FC
    .byte $23 ; |  X   XX| $F2FD
    .byte $51 ; | X X   X| $F2FE
    .byte $51 ; | X X   X| $F2FF
    .byte $48 ; | X  X   | $F300
    .byte $51 ; | X X   X| $F301
    .byte $48 ; | X  X   | $F302
    .byte $48 ; | X  X   | $F303
    .byte $48 ; | X  X   | $F304
    .byte $48 ; | X  X   | $F305
    .byte $48 ; | X  X   | $F306
    .byte $48 ; | X  X   | $F307
LF308:
    .byte $00 ; |        | $F308
    .byte $13 ; |   X  XX| $F309
    .byte $0E ; |    XXX | $F30A
    .byte $0F ; |    XXXX| $F30B
    .byte $11 ; |   X   X| $F30C
    .byte $13 ; |   X  XX| $F30D
    .byte $17 ; |   X XXX| $F30E
    .byte $13 ; |   X  XX| $F30F
    .byte $0E ; |    XXX | $F310
    .byte $0F ; |    XXXX| $F311
    .byte $11 ; |   X   X| $F312
    .byte $10 ; |   X    | $F313
    .byte $0F ; |    XXXX| $F314
    .byte $13 ; |   X  XX| $F315
    .byte $0F ; |    XXXX| $F316
    .byte $13 ; |   X  XX| $F317
    .byte $11 ; |   X   X| $F318
    .byte $13 ; |   X  XX| $F319
    .byte $0F ; |    XXXX| $F31A
    .byte $13 ; |   X  XX| $F31B
    .byte $11 ; |   X   X| $F31C
    .byte $17 ; |   X XXX| $F31D
    .byte $13 ; |   X  XX| $F31E
    .byte $11 ; |   X   X| $F31F
    .byte $10 ; |   X    | $F320
    .byte $0F ; |    XXXX| $F321
    .byte $0E ; |    XXX | $F322
    .byte $0B ; |    X XX| $F323
    .byte $00 ; |        | $F324
    .byte $1D ; |   XXX X| $F325
    .byte $1D ; |   XXX X| $F326
    .byte $1A ; |   XX X | $F327
    .byte $1D ; |   XXX X| $F328
    .byte $00 ; |        | $F329
    .byte $1D ; |   XXX X| $F32A
    .byte $1A ; |   XX X | $F32B
    .byte $1F ; |   XXXXX| $F32C
    .byte $00 ; |        | $F32D
    .byte $1A ; |   XX X | $F32E
    .byte $1F ; |   XXXXX| $F32F
    .byte $1A ; |   XX X | $F330
    .byte $1F ; |   XXXXX| $F331
    .byte $1A ; |   XX X | $F332
    .byte $1F ; |   XXXXX| $F333
    .byte $1A ; |   XX X | $F334
    .byte $16 ; |   X XX | $F335
    .byte $17 ; |   X XXX| $F336
    .byte $1D ; |   XXX X| $F337
    .byte $00 ; |        | $F338
LF339:
    .byte $5A ; | X XX X | $F339
    .byte $5C ; | X XXX  | $F33A
    .byte $5D ; | X XXX X| $F33B
    .byte $5C ; | X XXX  | $F33C
    .byte $5B ; | X XX XX| $F33D
    .byte $5A ; | X XX X | $F33E
    .byte $59 ; | X XX  X| $F33F
    .byte $58 ; | X XX   | $F340
    .byte $58 ; | X XX   | $F341
    .byte $57 ; | X X XXX| $F342
    .byte $57 ; | X X XXX| $F343
    .byte $56 ; | X X XX | $F344
    .byte $56 ; | X X XX | $F345
    .byte $55 ; | X X X X| $F346
    .byte $55 ; | X X X X| $F347
    .byte $54 ; | X X X  | $F348
    .byte $54 ; | X X X  | $F349
    .byte $53 ; | X X  XX| $F34A
    .byte $53 ; | X X  XX| $F34B
    .byte $53 ; | X X  XX| $F34C
    .byte $52 ; | X X  X | $F34D
    .byte $52 ; | X X  X | $F34E
    .byte $52 ; | X X  X | $F34F
    .byte $52 ; | X X  X | $F350
    .byte $51 ; | X X   X| $F351
    .byte $51 ; | X X   X| $F352
    .byte $51 ; | X X   X| $F353
    .byte $51 ; | X X   X| $F354
    .byte $51 ; | X X   X| $F355
    .byte $51 ; | X X   X| $F356
    .byte $50 ; | X X    | $F357
    .byte $50 ; | X X    | $F358
    .byte $00 ; |        | $F359
    .byte $00 ; |        | $F35A
    .byte $00 ; |        | $F35B
    .byte $00 ; |        | $F35C
    .byte $00 ; |        | $F35D
    .byte $00 ; |        | $F35E
    .byte $00 ; |        | $F35F
    .byte $00 ; |        | $F360
    .byte $00 ; |        | $F361
    .byte $00 ; |        | $F362
    .byte $00 ; |        | $F363
    .byte $00 ; |        | $F364
    .byte $00 ; |        | $F365
    .byte $00 ; |        | $F366
    .byte $00 ; |        | $F367
    .byte $00 ; |        | $F368
    .byte $00 ; |        | $F369
    .byte $00 ; |        | $F36A
    .byte $00 ; |        | $F36B
    .byte $00 ; |        | $F36C
    .byte $00 ; |        | $F36D
    .byte $00 ; |        | $F36E
    .byte $00 ; |        | $F36F
    .byte $00 ; |        | $F370
    .byte $00 ; |        | $F371
    .byte $00 ; |        | $F372
    .byte $00 ; |        | $F373
    .byte $00 ; |        | $F374
    .byte $00 ; |        | $F375
    .byte $00 ; |        | $F376
    .byte $00 ; |        | $F377
    .byte $00 ; |        | $F378
    .byte $52 ; | X X  X | $F379
    .byte $53 ; | X X  XX| $F37A
    .byte $54 ; | X X X  | $F37B
    .byte $55 ; | X X X X| $F37C
    .byte $56 ; | X X XX | $F37D
    .byte $56 ; | X X XX | $F37E
    .byte $56 ; | X X XX | $F37F
    .byte $55 ; | X X X X| $F380
    .byte $55 ; | X X X X| $F381
    .byte $55 ; | X X X X| $F382
    .byte $55 ; | X X X X| $F383
    .byte $54 ; | X X X  | $F384
    .byte $54 ; | X X X  | $F385
    .byte $54 ; | X X X  | $F386
    .byte $53 ; | X X  XX| $F387
    .byte $53 ; | X X  XX| $F388
    .byte $53 ; | X X  XX| $F389
    .byte $53 ; | X X  XX| $F38A
    .byte $53 ; | X X  XX| $F38B
    .byte $52 ; | X X  X | $F38C
    .byte $52 ; | X X  X | $F38D
    .byte $52 ; | X X  X | $F38E
    .byte $52 ; | X X  X | $F38F
    .byte $52 ; | X X  X | $F390
    .byte $51 ; | X X   X| $F391
    .byte $51 ; | X X   X| $F392
    .byte $51 ; | X X   X| $F393
    .byte $51 ; | X X   X| $F394
    .byte $51 ; | X X   X| $F395
    .byte $51 ; | X X   X| $F396
    .byte $51 ; | X X   X| $F397
    .byte $00 ; |        | $F398
    .byte $00 ; |        | $F399
    .byte $00 ; |        | $F39A
    .byte $00 ; |        | $F39B
    .byte $00 ; |        | $F39C
    .byte $00 ; |        | $F39D
    .byte $00 ; |        | $F39E
    .byte $00 ; |        | $F39F
    .byte $00 ; |        | $F3A0
    .byte $00 ; |        | $F3A1
    .byte $00 ; |        | $F3A2
    .byte $00 ; |        | $F3A3
    .byte $00 ; |        | $F3A4
    .byte $00 ; |        | $F3A5
    .byte $00 ; |        | $F3A6
    .byte $00 ; |        | $F3A7
    .byte $00 ; |        | $F3A8
    .byte $00 ; |        | $F3A9
    .byte $00 ; |        | $F3AA
    .byte $00 ; |        | $F3AB
    .byte $00 ; |        | $F3AC
    .byte $00 ; |        | $F3AD
    .byte $00 ; |        | $F3AE
    .byte $00 ; |        | $F3AF
    .byte $00 ; |        | $F3B0
    .byte $00 ; |        | $F3B1
    .byte $00 ; |        | $F3B2
    .byte $00 ; |        | $F3B3
    .byte $00 ; |        | $F3B4
    .byte $00 ; |        | $F3B5
    .byte $00 ; |        | $F3B6
    .byte $00 ; |        | $F3B7
    .byte $00 ; |        | $F3B8
    .byte $00 ; |        | $F3B9
    .byte $00 ; |        | $F3BA
    .byte $00 ; |        | $F3BB
    .byte $00 ; |        | $F3BC
    .byte $00 ; |        | $F3BD
    .byte $00 ; |        | $F3BE
    .byte $00 ; |        | $F3BF
    .byte $00 ; |        | $F3C0
    .byte $00 ; |        | $F3C1
    .byte $00 ; |        | $F3C2
    .byte $00 ; |        | $F3C3
    .byte $00 ; |        | $F3C4
    .byte $00 ; |        | $F3C5
    .byte $00 ; |        | $F3C6
    .byte $00 ; |        | $F3C7
    .byte $00 ; |        | $F3C8
    .byte $00 ; |        | $F3C9
    .byte $00 ; |        | $F3CA
    .byte $00 ; |        | $F3CB
    .byte $00 ; |        | $F3CC
    .byte $00 ; |        | $F3CD
    .byte $00 ; |        | $F3CE
    .byte $00 ; |        | $F3CF
    .byte $00 ; |        | $F3D0
    .byte $00 ; |        | $F3D1
    .byte $00 ; |        | $F3D2
    .byte $00 ; |        | $F3D3
    .byte $00 ; |        | $F3D4
    .byte $00 ; |        | $F3D5
    .byte $00 ; |        | $F3D6
    .byte $00 ; |        | $F3D7
    .byte $00 ; |        | $F3D8
    .byte $00 ; |        | $F3D9
    .byte $00 ; |        | $F3DA
    .byte $00 ; |        | $F3DB
    .byte $00 ; |        | $F3DC
    .byte $00 ; |        | $F3DD
    .byte $00 ; |        | $F3DE
    .byte $00 ; |        | $F3DF
    .byte $00 ; |        | $F3E0
    .byte $00 ; |        | $F3E1
    .byte $00 ; |        | $F3E2
    .byte $00 ; |        | $F3E3
    .byte $00 ; |        | $F3E4
    .byte $00 ; |        | $F3E5
    .byte $00 ; |        | $F3E6
    .byte $00 ; |        | $F3E7
    .byte $00 ; |        | $F3E8
    .byte $00 ; |        | $F3E9
    .byte $00 ; |        | $F3EA
    .byte $00 ; |        | $F3EB
    .byte $00 ; |        | $F3EC
    .byte $00 ; |        | $F3ED
    .byte $00 ; |        | $F3EE
    .byte $00 ; |        | $F3EF
    .byte $00 ; |        | $F3F0
    .byte $00 ; |        | $F3F1
    .byte $00 ; |        | $F3F2
    .byte $00 ; |        | $F3F3
    .byte $00 ; |        | $F3F4
    .byte $00 ; |        | $F3F5
    .byte $00 ; |        | $F3F6
    .byte $00 ; |        | $F3F7
    .byte $00 ; |        | $F3F8
    .byte $00 ; |        | $F3F9
    .byte $00 ; |        | $F3FA
    .byte $00 ; |        | $F3FB
    .byte $00 ; |        | $F3FC
    .byte $00 ; |        | $F3FD
    .byte $00 ; |        | $F3FE
    .byte $00 ; |        | $F3FF
    .byte $00 ; |        | $F400
    .byte $00 ; |        | $F401
    .byte $00 ; |        | $F402
    .byte $00 ; |        | $F403
    .byte $00 ; |        | $F404
    .byte $00 ; |        | $F405
    .byte $00 ; |        | $F406
    .byte $00 ; |        | $F407
    .byte $00 ; |        | $F408
    .byte $00 ; |        | $F409
    .byte $00 ; |        | $F40A
    .byte $00 ; |        | $F40B
    .byte $00 ; |        | $F40C
    .byte $00 ; |        | $F40D
    .byte $00 ; |        | $F40E
    .byte $00 ; |        | $F40F
    .byte $00 ; |        | $F410
    .byte $00 ; |        | $F411
    .byte $00 ; |        | $F412
    .byte $00 ; |        | $F413
    .byte $00 ; |        | $F414
    .byte $00 ; |        | $F415
    .byte $00 ; |        | $F416
    .byte $00 ; |        | $F417
    .byte $00 ; |        | $F418
    .byte $00 ; |        | $F419
    .byte $00 ; |        | $F41A
    .byte $00 ; |        | $F41B
    .byte $00 ; |        | $F41C
    .byte $00 ; |        | $F41D
    .byte $00 ; |        | $F41E
    .byte $00 ; |        | $F41F
    .byte $00 ; |        | $F420
    .byte $00 ; |        | $F421
    .byte $00 ; |        | $F422
    .byte $00 ; |        | $F423
    .byte $00 ; |        | $F424
    .byte $00 ; |        | $F425
    .byte $00 ; |        | $F426
    .byte $00 ; |        | $F427
    .byte $00 ; |        | $F428
    .byte $00 ; |        | $F429
    .byte $00 ; |        | $F42A
    .byte $00 ; |        | $F42B
    .byte $00 ; |        | $F42C
    .byte $00 ; |        | $F42D
    .byte $00 ; |        | $F42E
    .byte $00 ; |        | $F42F
    .byte $00 ; |        | $F430
    .byte $00 ; |        | $F431
    .byte $00 ; |        | $F432
    .byte $00 ; |        | $F433
    .byte $00 ; |        | $F434
    .byte $00 ; |        | $F435
    .byte $00 ; |        | $F436
    .byte $00 ; |        | $F437
    .byte $00 ; |        | $F438
    .byte $00 ; |        | $F439
    .byte $00 ; |        | $F43A
    .byte $00 ; |        | $F43B
    .byte $00 ; |        | $F43C
    .byte $00 ; |        | $F43D
    .byte $00 ; |        | $F43E
    .byte $00 ; |        | $F43F
    .byte $00 ; |        | $F440
    .byte $00 ; |        | $F441
    .byte $00 ; |        | $F442
    .byte $00 ; |        | $F443
    .byte $00 ; |        | $F444
    .byte $00 ; |        | $F445
    .byte $00 ; |        | $F446
    .byte $00 ; |        | $F447
    .byte $00 ; |        | $F448
    .byte $00 ; |        | $F449
    .byte $00 ; |        | $F44A
    .byte $00 ; |        | $F44B
    .byte $00 ; |        | $F44C
    .byte $00 ; |        | $F44D
    .byte $00 ; |        | $F44E
    .byte $00 ; |        | $F44F
    .byte $00 ; |        | $F450
    .byte $00 ; |        | $F451
    .byte $00 ; |        | $F452
    .byte $00 ; |        | $F453
    .byte $00 ; |        | $F454
    .byte $00 ; |        | $F455
    .byte $00 ; |        | $F456
    .byte $00 ; |        | $F457
    .byte $00 ; |        | $F458
    .byte $00 ; |        | $F459
    .byte $00 ; |        | $F45A
    .byte $00 ; |        | $F45B
    .byte $00 ; |        | $F45C
    .byte $00 ; |        | $F45D
    .byte $00 ; |        | $F45E
    .byte $00 ; |        | $F45F
    .byte $00 ; |        | $F460
    .byte $00 ; |        | $F461
    .byte $00 ; |        | $F462
    .byte $00 ; |        | $F463
    .byte $00 ; |        | $F464
    .byte $00 ; |        | $F465
    .byte $00 ; |        | $F466
    .byte $00 ; |        | $F467
    .byte $00 ; |        | $F468
    .byte $00 ; |        | $F469
    .byte $00 ; |        | $F46A
    .byte $00 ; |        | $F46B
    .byte $00 ; |        | $F46C
    .byte $00 ; |        | $F46D
    .byte $00 ; |        | $F46E
    .byte $00 ; |        | $F46F
    .byte $00 ; |        | $F470
    .byte $00 ; |        | $F471
    .byte $00 ; |        | $F472
    .byte $00 ; |        | $F473
    .byte $00 ; |        | $F474
    .byte $00 ; |        | $F475
    .byte $00 ; |        | $F476
    .byte $00 ; |        | $F477
    .byte $00 ; |        | $F478
    .byte $00 ; |        | $F479
    .byte $00 ; |        | $F47A
    .byte $00 ; |        | $F47B
    .byte $00 ; |        | $F47C
    .byte $00 ; |        | $F47D
    .byte $00 ; |        | $F47E
    .byte $00 ; |        | $F47F
    .byte $00 ; |        | $F480
    .byte $00 ; |        | $F481
    .byte $00 ; |        | $F482
    .byte $00 ; |        | $F483
    .byte $00 ; |        | $F484
    .byte $00 ; |        | $F485
    .byte $00 ; |        | $F486
    .byte $00 ; |        | $F487
    .byte $00 ; |        | $F488
    .byte $00 ; |        | $F489
    .byte $00 ; |        | $F48A
    .byte $00 ; |        | $F48B
    .byte $00 ; |        | $F48C
    .byte $00 ; |        | $F48D
    .byte $00 ; |        | $F48E
    .byte $00 ; |        | $F48F
    .byte $00 ; |        | $F490
    .byte $00 ; |        | $F491
    .byte $00 ; |        | $F492
    .byte $00 ; |        | $F493
    .byte $00 ; |        | $F494
    .byte $00 ; |        | $F495
    .byte $00 ; |        | $F496
    .byte $00 ; |        | $F497
    .byte $00 ; |        | $F498
    .byte $00 ; |        | $F499
    .byte $00 ; |        | $F49A
    .byte $00 ; |        | $F49B
    .byte $00 ; |        | $F49C
    .byte $00 ; |        | $F49D
    .byte $00 ; |        | $F49E
    .byte $00 ; |        | $F49F
    .byte $00 ; |        | $F4A0
    .byte $00 ; |        | $F4A1
    .byte $00 ; |        | $F4A2
    .byte $00 ; |        | $F4A3
    .byte $00 ; |        | $F4A4
    .byte $00 ; |        | $F4A5
    .byte $00 ; |        | $F4A6
    .byte $00 ; |        | $F4A7
    .byte $00 ; |        | $F4A8
    .byte $00 ; |        | $F4A9
    .byte $00 ; |        | $F4AA
    .byte $00 ; |        | $F4AB
    .byte $00 ; |        | $F4AC
    .byte $00 ; |        | $F4AD
    .byte $00 ; |        | $F4AE
    .byte $00 ; |        | $F4AF
    .byte $00 ; |        | $F4B0
    .byte $00 ; |        | $F4B1
    .byte $00 ; |        | $F4B2
    .byte $00 ; |        | $F4B3
    .byte $00 ; |        | $F4B4
    .byte $00 ; |        | $F4B5
    .byte $00 ; |        | $F4B6
    .byte $00 ; |        | $F4B7
    .byte $00 ; |        | $F4B8
    .byte $00 ; |        | $F4B9
    .byte $00 ; |        | $F4BA
    .byte $00 ; |        | $F4BB
    .byte $00 ; |        | $F4BC
    .byte $00 ; |        | $F4BD
    .byte $00 ; |        | $F4BE
    .byte $00 ; |        | $F4BF
    .byte $00 ; |        | $F4C0
    .byte $00 ; |        | $F4C1
    .byte $00 ; |        | $F4C2
    .byte $00 ; |        | $F4C3
    .byte $00 ; |        | $F4C4
    .byte $00 ; |        | $F4C5
    .byte $00 ; |        | $F4C6
    .byte $00 ; |        | $F4C7
    .byte $00 ; |        | $F4C8
    .byte $00 ; |        | $F4C9
    .byte $00 ; |        | $F4CA
    .byte $00 ; |        | $F4CB
    .byte $00 ; |        | $F4CC
    .byte $00 ; |        | $F4CD
    .byte $00 ; |        | $F4CE
    .byte $00 ; |        | $F4CF
    .byte $00 ; |        | $F4D0
    .byte $00 ; |        | $F4D1
    .byte $00 ; |        | $F4D2
    .byte $00 ; |        | $F4D3
    .byte $00 ; |        | $F4D4
    .byte $00 ; |        | $F4D5
    .byte $00 ; |        | $F4D6
    .byte $00 ; |        | $F4D7
    .byte $00 ; |        | $F4D8
    .byte $00 ; |        | $F4D9
    .byte $00 ; |        | $F4DA
    .byte $00 ; |        | $F4DB
    .byte $00 ; |        | $F4DC
    .byte $00 ; |        | $F4DD
    .byte $00 ; |        | $F4DE
    .byte $00 ; |        | $F4DF
    .byte $00 ; |        | $F4E0
    .byte $00 ; |        | $F4E1
    .byte $00 ; |        | $F4E2
    .byte $00 ; |        | $F4E3
    .byte $00 ; |        | $F4E4
    .byte $00 ; |        | $F4E5
    .byte $00 ; |        | $F4E6
    .byte $00 ; |        | $F4E7
    .byte $00 ; |        | $F4E8
    .byte $00 ; |        | $F4E9
    .byte $00 ; |        | $F4EA
    .byte $00 ; |        | $F4EB
    .byte $00 ; |        | $F4EC
    .byte $00 ; |        | $F4ED
    .byte $00 ; |        | $F4EE
    .byte $00 ; |        | $F4EF
    .byte $00 ; |        | $F4F0
    .byte $00 ; |        | $F4F1
    .byte $00 ; |        | $F4F2
    .byte $00 ; |        | $F4F3
    .byte $00 ; |        | $F4F4
    .byte $00 ; |        | $F4F5
    .byte $00 ; |        | $F4F6
    .byte $00 ; |        | $F4F7
    .byte $00 ; |        | $F4F8
    .byte $00 ; |        | $F4F9
    .byte $00 ; |        | $F4FA
    .byte $00 ; |        | $F4FB
    .byte $00 ; |        | $F4FC
    .byte $00 ; |        | $F4FD
    .byte $00 ; |        | $F4FE
    .byte $00 ; |        | $F4FF
    .byte $00 ; |        | $F500
    .byte $00 ; |        | $F501
    .byte $00 ; |        | $F502
    .byte $00 ; |        | $F503
    .byte $00 ; |        | $F504
    .byte $00 ; |        | $F505
    .byte $00 ; |        | $F506
    .byte $00 ; |        | $F507
    .byte $00 ; |        | $F508
    .byte $00 ; |        | $F509
    .byte $00 ; |        | $F50A
    .byte $00 ; |        | $F50B
    .byte $00 ; |        | $F50C
    .byte $00 ; |        | $F50D
    .byte $00 ; |        | $F50E
    .byte $00 ; |        | $F50F
    .byte $00 ; |        | $F510
    .byte $00 ; |        | $F511
    .byte $00 ; |        | $F512
    .byte $00 ; |        | $F513
    .byte $00 ; |        | $F514
    .byte $00 ; |        | $F515
    .byte $00 ; |        | $F516
    .byte $00 ; |        | $F517
    .byte $00 ; |        | $F518
    .byte $00 ; |        | $F519
    .byte $00 ; |        | $F51A
    .byte $00 ; |        | $F51B
    .byte $00 ; |        | $F51C
    .byte $00 ; |        | $F51D
    .byte $00 ; |        | $F51E
    .byte $00 ; |        | $F51F
    .byte $00 ; |        | $F520
    .byte $00 ; |        | $F521
    .byte $00 ; |        | $F522
    .byte $00 ; |        | $F523
    .byte $00 ; |        | $F524
    .byte $00 ; |        | $F525
    .byte $00 ; |        | $F526
    .byte $00 ; |        | $F527
    .byte $00 ; |        | $F528
    .byte $00 ; |        | $F529
    .byte $00 ; |        | $F52A
    .byte $00 ; |        | $F52B
    .byte $00 ; |        | $F52C
    .byte $00 ; |        | $F52D
    .byte $00 ; |        | $F52E
    .byte $00 ; |        | $F52F
    .byte $00 ; |        | $F530
    .byte $00 ; |        | $F531
    .byte $00 ; |        | $F532
    .byte $00 ; |        | $F533
    .byte $00 ; |        | $F534
    .byte $00 ; |        | $F535
    .byte $00 ; |        | $F536
    .byte $00 ; |        | $F537
    .byte $00 ; |        | $F538
    .byte $00 ; |        | $F539
    .byte $00 ; |        | $F53A
    .byte $00 ; |        | $F53B
    .byte $00 ; |        | $F53C
    .byte $00 ; |        | $F53D
    .byte $00 ; |        | $F53E
    .byte $00 ; |        | $F53F
    .byte $00 ; |        | $F540
    .byte $00 ; |        | $F541
    .byte $00 ; |        | $F542
    .byte $00 ; |        | $F543
    .byte $00 ; |        | $F544
    .byte $00 ; |        | $F545
    .byte $00 ; |        | $F546
    .byte $00 ; |        | $F547
    .byte $00 ; |        | $F548
    .byte $00 ; |        | $F549
    .byte $00 ; |        | $F54A
    .byte $00 ; |        | $F54B
    .byte $00 ; |        | $F54C
    .byte $00 ; |        | $F54D
    .byte $00 ; |        | $F54E
    .byte $00 ; |        | $F54F
    .byte $00 ; |        | $F550
    .byte $00 ; |        | $F551
    .byte $00 ; |        | $F552
    .byte $00 ; |        | $F553
    .byte $00 ; |        | $F554
    .byte $00 ; |        | $F555
    .byte $00 ; |        | $F556
    .byte $00 ; |        | $F557
    .byte $00 ; |        | $F558
    .byte $00 ; |        | $F559
    .byte $00 ; |        | $F55A
    .byte $00 ; |        | $F55B
    .byte $00 ; |        | $F55C
    .byte $00 ; |        | $F55D
    .byte $00 ; |        | $F55E
    .byte $00 ; |        | $F55F
    .byte $00 ; |        | $F560
    .byte $00 ; |        | $F561
    .byte $00 ; |        | $F562
    .byte $00 ; |        | $F563
    .byte $00 ; |        | $F564
    .byte $00 ; |        | $F565
    .byte $00 ; |        | $F566
    .byte $00 ; |        | $F567
    .byte $00 ; |        | $F568
    .byte $00 ; |        | $F569
    .byte $00 ; |        | $F56A
    .byte $00 ; |        | $F56B
    .byte $00 ; |        | $F56C
    .byte $00 ; |        | $F56D
    .byte $00 ; |        | $F56E
    .byte $00 ; |        | $F56F
    .byte $00 ; |        | $F570
    .byte $00 ; |        | $F571
    .byte $00 ; |        | $F572
    .byte $00 ; |        | $F573
    .byte $00 ; |        | $F574
    .byte $00 ; |        | $F575
    .byte $00 ; |        | $F576
    .byte $00 ; |        | $F577
    .byte $00 ; |        | $F578
    .byte $00 ; |        | $F579
    .byte $00 ; |        | $F57A
    .byte $00 ; |        | $F57B
    .byte $00 ; |        | $F57C
    .byte $00 ; |        | $F57D
    .byte $00 ; |        | $F57E
    .byte $00 ; |        | $F57F
    .byte $00 ; |        | $F580
    .byte $00 ; |        | $F581
    .byte $00 ; |        | $F582
    .byte $00 ; |        | $F583
    .byte $00 ; |        | $F584
    .byte $00 ; |        | $F585
    .byte $00 ; |        | $F586
    .byte $00 ; |        | $F587
    .byte $00 ; |        | $F588
    .byte $00 ; |        | $F589
    .byte $00 ; |        | $F58A
    .byte $00 ; |        | $F58B
    .byte $00 ; |        | $F58C
    .byte $00 ; |        | $F58D
    .byte $00 ; |        | $F58E
    .byte $00 ; |        | $F58F
    .byte $00 ; |        | $F590
    .byte $00 ; |        | $F591
    .byte $00 ; |        | $F592
    .byte $00 ; |        | $F593
    .byte $00 ; |        | $F594
    .byte $00 ; |        | $F595
    .byte $00 ; |        | $F596
    .byte $00 ; |        | $F597
    .byte $00 ; |        | $F598
    .byte $00 ; |        | $F599
    .byte $00 ; |        | $F59A
    .byte $00 ; |        | $F59B
    .byte $00 ; |        | $F59C
    .byte $00 ; |        | $F59D
    .byte $00 ; |        | $F59E
    .byte $00 ; |        | $F59F
    .byte $00 ; |        | $F5A0
    .byte $00 ; |        | $F5A1
    .byte $00 ; |        | $F5A2
    .byte $00 ; |        | $F5A3
    .byte $00 ; |        | $F5A4
    .byte $00 ; |        | $F5A5
    .byte $00 ; |        | $F5A6
    .byte $00 ; |        | $F5A7
    .byte $00 ; |        | $F5A8
    .byte $00 ; |        | $F5A9
    .byte $00 ; |        | $F5AA
    .byte $00 ; |        | $F5AB
    .byte $00 ; |        | $F5AC
    .byte $00 ; |        | $F5AD
    .byte $00 ; |        | $F5AE
    .byte $00 ; |        | $F5AF
    .byte $00 ; |        | $F5B0
    .byte $00 ; |        | $F5B1
    .byte $00 ; |        | $F5B2
    .byte $00 ; |        | $F5B3
    .byte $00 ; |        | $F5B4
    .byte $00 ; |        | $F5B5
    .byte $00 ; |        | $F5B6
    .byte $00 ; |        | $F5B7
    .byte $00 ; |        | $F5B8
    .byte $00 ; |        | $F5B9
    .byte $00 ; |        | $F5BA
    .byte $00 ; |        | $F5BB
    .byte $00 ; |        | $F5BC
    .byte $00 ; |        | $F5BD
    .byte $00 ; |        | $F5BE
    .byte $00 ; |        | $F5BF
    .byte $00 ; |        | $F5C0
    .byte $00 ; |        | $F5C1
    .byte $00 ; |        | $F5C2
    .byte $00 ; |        | $F5C3
    .byte $00 ; |        | $F5C4
    .byte $00 ; |        | $F5C5
    .byte $00 ; |        | $F5C6
    .byte $00 ; |        | $F5C7
    .byte $00 ; |        | $F5C8
    .byte $00 ; |        | $F5C9
    .byte $00 ; |        | $F5CA
    .byte $00 ; |        | $F5CB
    .byte $00 ; |        | $F5CC
    .byte $00 ; |        | $F5CD
    .byte $00 ; |        | $F5CE
    .byte $00 ; |        | $F5CF
    .byte $00 ; |        | $F5D0
    .byte $00 ; |        | $F5D1
    .byte $00 ; |        | $F5D2
    .byte $00 ; |        | $F5D3
    .byte $00 ; |        | $F5D4
    .byte $00 ; |        | $F5D5
    .byte $00 ; |        | $F5D6
    .byte $00 ; |        | $F5D7
    .byte $00 ; |        | $F5D8
    .byte $00 ; |        | $F5D9
    .byte $00 ; |        | $F5DA
    .byte $00 ; |        | $F5DB
    .byte $00 ; |        | $F5DC
    .byte $00 ; |        | $F5DD
    .byte $00 ; |        | $F5DE
    .byte $00 ; |        | $F5DF
    .byte $00 ; |        | $F5E0
    .byte $00 ; |        | $F5E1
    .byte $00 ; |        | $F5E2
    .byte $00 ; |        | $F5E3
    .byte $00 ; |        | $F5E4
    .byte $00 ; |        | $F5E5
    .byte $00 ; |        | $F5E6
    .byte $00 ; |        | $F5E7
    .byte $00 ; |        | $F5E8
    .byte $00 ; |        | $F5E9
    .byte $00 ; |        | $F5EA
    .byte $00 ; |        | $F5EB
    .byte $00 ; |        | $F5EC
    .byte $00 ; |        | $F5ED
    .byte $00 ; |        | $F5EE
    .byte $00 ; |        | $F5EF
    .byte $00 ; |        | $F5F0
    .byte $00 ; |        | $F5F1
    .byte $00 ; |        | $F5F2
    .byte $00 ; |        | $F5F3
    .byte $00 ; |        | $F5F4
    .byte $00 ; |        | $F5F5
    .byte $00 ; |        | $F5F6
    .byte $00 ; |        | $F5F7
    .byte $00 ; |        | $F5F8
    .byte $00 ; |        | $F5F9
    .byte $00 ; |        | $F5FA
    .byte $00 ; |        | $F5FB
    .byte $00 ; |        | $F5FC
    .byte $00 ; |        | $F5FD
    .byte $00 ; |        | $F5FE
    .byte $00 ; |        | $F5FF
    .byte $00 ; |        | $F600
    .byte $00 ; |        | $F601
    .byte $00 ; |        | $F602
    .byte $00 ; |        | $F603
    .byte $00 ; |        | $F604
    .byte $00 ; |        | $F605
    .byte $00 ; |        | $F606
    .byte $00 ; |        | $F607
    .byte $00 ; |        | $F608
    .byte $00 ; |        | $F609
    .byte $00 ; |        | $F60A
    .byte $00 ; |        | $F60B
    .byte $00 ; |        | $F60C
    .byte $00 ; |        | $F60D
    .byte $00 ; |        | $F60E
    .byte $00 ; |        | $F60F
    .byte $00 ; |        | $F610
    .byte $00 ; |        | $F611
    .byte $00 ; |        | $F612
    .byte $00 ; |        | $F613
    .byte $00 ; |        | $F614
    .byte $00 ; |        | $F615
    .byte $00 ; |        | $F616
    .byte $00 ; |        | $F617
    .byte $00 ; |        | $F618
    .byte $00 ; |        | $F619
    .byte $00 ; |        | $F61A
    .byte $00 ; |        | $F61B
    .byte $00 ; |        | $F61C
    .byte $00 ; |        | $F61D
    .byte $00 ; |        | $F61E
    .byte $00 ; |        | $F61F
    .byte $00 ; |        | $F620
    .byte $00 ; |        | $F621
    .byte $00 ; |        | $F622
    .byte $00 ; |        | $F623
    .byte $00 ; |        | $F624
    .byte $00 ; |        | $F625
    .byte $00 ; |        | $F626
    .byte $00 ; |        | $F627
    .byte $00 ; |        | $F628
    .byte $00 ; |        | $F629
    .byte $00 ; |        | $F62A
    .byte $00 ; |        | $F62B
    .byte $00 ; |        | $F62C
    .byte $00 ; |        | $F62D
    .byte $00 ; |        | $F62E
    .byte $00 ; |        | $F62F
    .byte $00 ; |        | $F630
    .byte $00 ; |        | $F631
    .byte $00 ; |        | $F632
    .byte $00 ; |        | $F633
    .byte $00 ; |        | $F634
    .byte $00 ; |        | $F635
    .byte $00 ; |        | $F636
    .byte $00 ; |        | $F637
    .byte $00 ; |        | $F638
    .byte $00 ; |        | $F639
    .byte $00 ; |        | $F63A
    .byte $00 ; |        | $F63B
    .byte $00 ; |        | $F63C
    .byte $00 ; |        | $F63D
    .byte $00 ; |        | $F63E
    .byte $00 ; |        | $F63F
    .byte $00 ; |        | $F640
    .byte $00 ; |        | $F641
    .byte $00 ; |        | $F642
    .byte $00 ; |        | $F643
    .byte $00 ; |        | $F644
    .byte $00 ; |        | $F645
    .byte $00 ; |        | $F646
    .byte $00 ; |        | $F647
    .byte $00 ; |        | $F648
    .byte $00 ; |        | $F649
    .byte $00 ; |        | $F64A
    .byte $00 ; |        | $F64B
    .byte $00 ; |        | $F64C
    .byte $00 ; |        | $F64D
    .byte $00 ; |        | $F64E
    .byte $00 ; |        | $F64F
    .byte $00 ; |        | $F650
    .byte $00 ; |        | $F651
    .byte $00 ; |        | $F652
    .byte $00 ; |        | $F653
    .byte $00 ; |        | $F654
    .byte $00 ; |        | $F655
    .byte $00 ; |        | $F656
    .byte $00 ; |        | $F657
    .byte $00 ; |        | $F658
    .byte $00 ; |        | $F659
    .byte $00 ; |        | $F65A
    .byte $00 ; |        | $F65B
    .byte $00 ; |        | $F65C
    .byte $00 ; |        | $F65D
    .byte $00 ; |        | $F65E
    .byte $00 ; |        | $F65F
    .byte $00 ; |        | $F660
    .byte $00 ; |        | $F661
    .byte $00 ; |        | $F662
    .byte $00 ; |        | $F663
    .byte $00 ; |        | $F664
    .byte $00 ; |        | $F665
    .byte $00 ; |        | $F666
    .byte $00 ; |        | $F667
    .byte $00 ; |        | $F668
    .byte $00 ; |        | $F669
    .byte $00 ; |        | $F66A
    .byte $00 ; |        | $F66B
    .byte $00 ; |        | $F66C
    .byte $00 ; |        | $F66D
    .byte $00 ; |        | $F66E
    .byte $00 ; |        | $F66F
    .byte $00 ; |        | $F670
    .byte $00 ; |        | $F671
    .byte $00 ; |        | $F672
    .byte $00 ; |        | $F673
    .byte $00 ; |        | $F674
    .byte $00 ; |        | $F675
    .byte $00 ; |        | $F676
    .byte $00 ; |        | $F677
    .byte $00 ; |        | $F678
    .byte $00 ; |        | $F679
    .byte $00 ; |        | $F67A
    .byte $00 ; |        | $F67B
    .byte $00 ; |        | $F67C
    .byte $00 ; |        | $F67D
    .byte $00 ; |        | $F67E
    .byte $00 ; |        | $F67F
    .byte $00 ; |        | $F680
    .byte $00 ; |        | $F681
    .byte $00 ; |        | $F682
    .byte $00 ; |        | $F683
    .byte $00 ; |        | $F684
    .byte $00 ; |        | $F685
    .byte $00 ; |        | $F686
    .byte $00 ; |        | $F687
    .byte $00 ; |        | $F688
    .byte $00 ; |        | $F689
    .byte $00 ; |        | $F68A
    .byte $00 ; |        | $F68B
    .byte $00 ; |        | $F68C
    .byte $00 ; |        | $F68D
    .byte $00 ; |        | $F68E
    .byte $00 ; |        | $F68F
    .byte $00 ; |        | $F690
    .byte $00 ; |        | $F691
    .byte $00 ; |        | $F692
    .byte $00 ; |        | $F693
    .byte $00 ; |        | $F694
    .byte $00 ; |        | $F695
    .byte $00 ; |        | $F696
    .byte $00 ; |        | $F697
    .byte $00 ; |        | $F698
    .byte $00 ; |        | $F699
    .byte $00 ; |        | $F69A
    .byte $00 ; |        | $F69B
    .byte $00 ; |        | $F69C
    .byte $00 ; |        | $F69D
    .byte $00 ; |        | $F69E
    .byte $00 ; |        | $F69F
    .byte $00 ; |        | $F6A0
    .byte $00 ; |        | $F6A1
    .byte $00 ; |        | $F6A2
    .byte $00 ; |        | $F6A3
    .byte $00 ; |        | $F6A4
    .byte $00 ; |        | $F6A5
    .byte $00 ; |        | $F6A6
    .byte $00 ; |        | $F6A7
    .byte $00 ; |        | $F6A8
    .byte $00 ; |        | $F6A9
    .byte $00 ; |        | $F6AA
    .byte $00 ; |        | $F6AB
    .byte $00 ; |        | $F6AC
    .byte $00 ; |        | $F6AD
    .byte $00 ; |        | $F6AE
    .byte $00 ; |        | $F6AF
    .byte $00 ; |        | $F6B0
    .byte $00 ; |        | $F6B1
    .byte $00 ; |        | $F6B2
    .byte $00 ; |        | $F6B3
    .byte $00 ; |        | $F6B4
    .byte $00 ; |        | $F6B5
    .byte $00 ; |        | $F6B6
    .byte $00 ; |        | $F6B7
    .byte $00 ; |        | $F6B8
    .byte $00 ; |        | $F6B9
    .byte $00 ; |        | $F6BA
    .byte $00 ; |        | $F6BB
    .byte $00 ; |        | $F6BC
    .byte $00 ; |        | $F6BD
    .byte $00 ; |        | $F6BE
    .byte $00 ; |        | $F6BF
    .byte $00 ; |        | $F6C0
    .byte $00 ; |        | $F6C1
    .byte $00 ; |        | $F6C2
    .byte $00 ; |        | $F6C3
    .byte $00 ; |        | $F6C4
    .byte $00 ; |        | $F6C5
    .byte $00 ; |        | $F6C6
    .byte $00 ; |        | $F6C7
    .byte $00 ; |        | $F6C8
    .byte $00 ; |        | $F6C9
    .byte $00 ; |        | $F6CA
    .byte $00 ; |        | $F6CB
    .byte $00 ; |        | $F6CC
    .byte $00 ; |        | $F6CD
    .byte $00 ; |        | $F6CE
    .byte $00 ; |        | $F6CF
    .byte $00 ; |        | $F6D0
    .byte $00 ; |        | $F6D1
    .byte $00 ; |        | $F6D2
    .byte $00 ; |        | $F6D3
    .byte $00 ; |        | $F6D4
    .byte $00 ; |        | $F6D5
    .byte $00 ; |        | $F6D6
    .byte $00 ; |        | $F6D7
    .byte $00 ; |        | $F6D8
    .byte $00 ; |        | $F6D9
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
    .byte $F8 ; |XXXXX   | $F700
    .byte $F8 ; |XXXXX   | $F701
    .byte $F8 ; |XXXXX   | $F702
    .byte $F8 ; |XXXXX   | $F703
    .byte $F8 ; |XXXXX   | $F704
    .byte $F8 ; |XXXXX   | $F705
    .byte $F8 ; |XXXXX   | $F706
    .byte $F8 ; |XXXXX   | $F707
    .byte $F8 ; |XXXXX   | $F708
    .byte $F8 ; |XXXXX   | $F709
    .byte $FA ; |XXXXX X | $F70A
    .byte $F7 ; |XXXX XXX| $F70B
    .byte $FF ; |XXXXXXXX| $F70C
    .byte $FF ; |XXXXXXXX| $F70D
    .byte $FF ; |XXXXXXXX| $F70E
    .byte $FF ; |XXXXXXXX| $F70F
    .byte $FF ; |XXXXXXXX| $F710
    .byte $FF ; |XXXXXXXX| $F711
    .byte $FF ; |XXXXXXXX| $F712
    .byte $FF ; |XXXXXXXX| $F713
    .byte $FF ; |XXXXXXXX| $F714
    .byte $FD ; |XXXXXX X| $F715
    .byte $F8 ; |XXXXX   | $F716
    .byte $F0 ; |XXXX    | $F717
    .byte $00 ; |        | $F718
LF719:
    .byte $FF ; |XXXXXXXX| $F719
    .byte $7F ; | XXXXXXX| $F71A
    .byte $3F ; |  XXXXXX| $F71B
    .byte $1F ; |   XXXXX| $F71C
    .byte $0F ; |    XXXX| $F71D
    .byte $07 ; |     XXX| $F71E
    .byte $03 ; |      XX| $F71F
    .byte $00 ; |        | $F720
    .byte $00 ; |        | $F721
    .byte $00 ; |        | $F722
    .byte $00 ; |        | $F723
    .byte $00 ; |        | $F724
    .byte $00 ; |        | $F725
    .byte $00 ; |        | $F726
    .byte $00 ; |        | $F727
    .byte $00 ; |        | $F728
    .byte $00 ; |        | $F729
    .byte $00 ; |        | $F72A
    .byte $00 ; |        | $F72B
    .byte $00 ; |        | $F72C
    .byte $00 ; |        | $F72D
    .byte $00 ; |        | $F72E
    .byte $00 ; |        | $F72F
    .byte $00 ; |        | $F730
    .byte $00 ; |        | $F731
    .byte $00 ; |        | $F732
    .byte $00 ; |        | $F733
    .byte $00 ; |        | $F734
    .byte $00 ; |        | $F735
    .byte $00 ; |        | $F736
    .byte $00 ; |        | $F737
    .byte $00 ; |        | $F738
    .byte $00 ; |        | $F739
    .byte $00 ; |        | $F73A
    .byte $00 ; |        | $F73B
    .byte $00 ; |        | $F73C
    .byte $00 ; |        | $F73D
    .byte $00 ; |        | $F73E
    .byte $00 ; |        | $F73F
    .byte $00 ; |        | $F740
    .byte $00 ; |        | $F741
    .byte $00 ; |        | $F742
    .byte $00 ; |        | $F743
    .byte $00 ; |        | $F744
    .byte $00 ; |        | $F745
    .byte $00 ; |        | $F746
    .byte $00 ; |        | $F747
    .byte $00 ; |        | $F748
    .byte $00 ; |        | $F749
    .byte $00 ; |        | $F74A
    .byte $01 ; |       X| $F74B
    .byte $1F ; |   XXXXX| $F74C
    .byte $00 ; |        | $F74D
    .byte $00 ; |        | $F74E
    .byte $00 ; |        | $F74F
    .byte $01 ; |       X| $F750
    .byte $07 ; |     XXX| $F751
    .byte $1C ; |   XXX  | $F752
    .byte $30 ; |  XX    | $F753
    .byte $00 ; |        | $F754
    .byte $00 ; |        | $F755
    .byte $00 ; |        | $F756
    .byte $01 ; |       X| $F757
    .byte $03 ; |      XX| $F758
    .byte $06 ; |     XX | $F759
    .byte $0C ; |    XX  | $F75A
    .byte $18 ; |   XX   | $F75B
    .byte $00 ; |        | $F75C
    .byte $00 ; |        | $F75D
    .byte $00 ; |        | $F75E
    .byte $00 ; |        | $F75F
    .byte $00 ; |        | $F760
    .byte $00 ; |        | $F761
    .byte $00 ; |        | $F762
    .byte $00 ; |        | $F763
    .byte $00 ; |        | $F764
    .byte $00 ; |        | $F765
    .byte $00 ; |        | $F766
    .byte $00 ; |        | $F767
    .byte $00 ; |        | $F768
    .byte $00 ; |        | $F769
    .byte $00 ; |        | $F76A
    .byte $00 ; |        | $F76B
    .byte $00 ; |        | $F76C
    .byte $00 ; |        | $F76D
    .byte $00 ; |        | $F76E
    .byte $00 ; |        | $F76F
    .byte $00 ; |        | $F770
    .byte $00 ; |        | $F771
    .byte $00 ; |        | $F772
    .byte $00 ; |        | $F773
    .byte $00 ; |        | $F774
    .byte $00 ; |        | $F775
    .byte $00 ; |        | $F776
    .byte $00 ; |        | $F777
    .byte $00 ; |        | $F778
    .byte $00 ; |        | $F779
    .byte $00 ; |        | $F77A
    .byte $00 ; |        | $F77B
    .byte $00 ; |        | $F77C
    .byte $00 ; |        | $F77D
    .byte $00 ; |        | $F77E
    .byte $00 ; |        | $F77F
    .byte $00 ; |        | $F780
    .byte $00 ; |        | $F781
    .byte $00 ; |        | $F782
    .byte $00 ; |        | $F783
    .byte $00 ; |        | $F784
    .byte $00 ; |        | $F785
    .byte $00 ; |        | $F786
    .byte $00 ; |        | $F787
    .byte $00 ; |        | $F788
    .byte $00 ; |        | $F789
    .byte $00 ; |        | $F78A
    .byte $00 ; |        | $F78B
    .byte $00 ; |        | $F78C
    .byte $00 ; |        | $F78D
    .byte $00 ; |        | $F78E
    .byte $00 ; |        | $F78F
    .byte $00 ; |        | $F790
    .byte $00 ; |        | $F791
    .byte $00 ; |        | $F792
    .byte $00 ; |        | $F793
    .byte $00 ; |        | $F794
    .byte $00 ; |        | $F795
    .byte $00 ; |        | $F796
    .byte $00 ; |        | $F797
    .byte $00 ; |        | $F798
    .byte $00 ; |        | $F799
    .byte $00 ; |        | $F79A
LF79B:
    .byte $F8 ; |XXXXX   | $F79B
    .byte $F8 ; |XXXXX   | $F79C
    .byte $F8 ; |XXXXX   | $F79D
    .byte $F8 ; |XXXXX   | $F79E
    .byte $F8 ; |XXXXX   | $F79F
    .byte $F8 ; |XXXXX   | $F7A0
    .byte $F8 ; |XXXXX   | $F7A1
    .byte $F8 ; |XXXXX   | $F7A2
    .byte $F8 ; |XXXXX   | $F7A3
    .byte $F8 ; |XXXXX   | $F7A4
    .byte $F8 ; |XXXXX   | $F7A5
    .byte $F8 ; |XXXXX   | $F7A6
    .byte $FF ; |XXXXXXXX| $F7A7
    .byte $FF ; |XXXXXXXX| $F7A8
    .byte $FF ; |XXXXXXXX| $F7A9
    .byte $FF ; |XXXXXXXX| $F7AA
    .byte $FF ; |XXXXXXXX| $F7AB
    .byte $FF ; |XXXXXXXX| $F7AC
    .byte $FF ; |XXXXXXXX| $F7AD
    .byte $FF ; |XXXXXXXX| $F7AE
    .byte $F8 ; |XXXXX   | $F7AF
    .byte $F8 ; |XXXXX   | $F7B0
    .byte $F8 ; |XXXXX   | $F7B1
    .byte $F8 ; |XXXXX   | $F7B2
    .byte $F8 ; |XXXXX   | $F7B3
    .byte $F8 ; |XXXXX   | $F7B4
    .byte $F8 ; |XXXXX   | $F7B5
    .byte $F8 ; |XXXXX   | $F7B6
    .byte $00 ; |        | $F7B7
    .byte $00 ; |        | $F7B8
    .byte $00 ; |        | $F7B9
    .byte $00 ; |        | $F7BA
    .byte $00 ; |        | $F7BB
    .byte $00 ; |        | $F7BC
    .byte $00 ; |        | $F7BD
    .byte $00 ; |        | $F7BE
    .byte $00 ; |        | $F7BF
    .byte $00 ; |        | $F7C0
    .byte $00 ; |        | $F7C1
    .byte $00 ; |        | $F7C2
    .byte $00 ; |        | $F7C3
    .byte $00 ; |        | $F7C4
    .byte $00 ; |        | $F7C5
    .byte $00 ; |        | $F7C6
    .byte $00 ; |        | $F7C7
    .byte $00 ; |        | $F7C8
    .byte $00 ; |        | $F7C9
    .byte $00 ; |        | $F7CA
    .byte $00 ; |        | $F7CB
    .byte $00 ; |        | $F7CC
    .byte $00 ; |        | $F7CD
    .byte $00 ; |        | $F7CE
    .byte $00 ; |        | $F7CF
    .byte $00 ; |        | $F7D0
    .byte $00 ; |        | $F7D1
    .byte $00 ; |        | $F7D2
    .byte $00 ; |        | $F7D3
    .byte $00 ; |        | $F7D4
    .byte $00 ; |        | $F7D5
    .byte $00 ; |        | $F7D6
    .byte $00 ; |        | $F7D7
    .byte $00 ; |        | $F7D8
    .byte $00 ; |        | $F7D9
    .byte $00 ; |        | $F7DA
    .byte $00 ; |        | $F7DB
    .byte $00 ; |        | $F7DC
    .byte $00 ; |        | $F7DD
    .byte $00 ; |        | $F7DE
    .byte $00 ; |        | $F7DF
    .byte $00 ; |        | $F7E0
    .byte $00 ; |        | $F7E1
    .byte $00 ; |        | $F7E2
    .byte $00 ; |        | $F7E3
    .byte $00 ; |        | $F7E4
    .byte $00 ; |        | $F7E5
    .byte $00 ; |        | $F7E6
    .byte $00 ; |        | $F7E7
    .byte $00 ; |        | $F7E8
    .byte $00 ; |        | $F7E9
    .byte $00 ; |        | $F7EA
    .byte $00 ; |        | $F7EB
    .byte $00 ; |        | $F7EC
    .byte $00 ; |        | $F7ED
    .byte $00 ; |        | $F7EE
    .byte $00 ; |        | $F7EF
    .byte $00 ; |        | $F7F0
    .byte $00 ; |        | $F7F1
    .byte $00 ; |        | $F7F2
    .byte $00 ; |        | $F7F3
    .byte $00 ; |        | $F7F4
    .byte $00 ; |        | $F7F5
    .byte $00 ; |        | $F7F6
    .byte $00 ; |        | $F7F7
    .byte $00 ; |        | $F7F8
    .byte $00 ; |        | $F7F9
    .byte $00 ; |        | $F7FA
    .byte $00 ; |        | $F7FB
    .byte $00 ; |        | $F7FC
    .byte $00 ; |        | $F7FD
    .byte $00 ; |        | $F7FE
    .byte $00 ; |        | $F7FF
LF800:
    .byte $FB ; |XXXXX XX| $F800
    .byte $FB ; |XXXXX XX| $F801
    .byte $FB ; |XXXXX XX| $F802
    .byte $FB ; |XXXXX XX| $F803
    .byte $FB ; |XXXXX XX| $F804
    .byte $FB ; |XXXXX XX| $F805
    .byte $FB ; |XXXXX XX| $F806
    .byte $FB ; |XXXXX XX| $F807
    .byte $FB ; |XXXXX XX| $F808
    .byte $FB ; |XXXXX XX| $F809
    .byte $FB ; |XXXXX XX| $F80A
    .byte $7B ; | XXXX XX| $F80B
    .byte $FB ; |XXXXX XX| $F80C
    .byte $FB ; |XXXXX XX| $F80D
    .byte $FB ; |XXXXX XX| $F80E
    .byte $FB ; |XXXXX XX| $F80F
    .byte $FB ; |XXXXX XX| $F810
    .byte $FB ; |XXXXX XX| $F811
    .byte $FB ; |XXXXX XX| $F812
    .byte $FB ; |XXXXX XX| $F813
    .byte $FB ; |XXXXX XX| $F814
    .byte $FB ; |XXXXX XX| $F815
    .byte $FB ; |XXXXX XX| $F816
    .byte $7B ; | XXXX XX| $F817
    .byte $00 ; |        | $F818
LF819:
    .byte $FF ; |XXXXXXXX| $F819
    .byte $FF ; |XXXXXXXX| $F81A
    .byte $FF ; |XXXXXXXX| $F81B
    .byte $FF ; |XXXXXXXX| $F81C
    .byte $FF ; |XXXXXXXX| $F81D
    .byte $FF ; |XXXXXXXX| $F81E
    .byte $FF ; |XXXXXXXX| $F81F
    .byte $1F ; |   XXXXX| $F820
    .byte $1F ; |   XXXXX| $F821
    .byte $1F ; |   XXXXX| $F822
    .byte $3F ; |  XXXXXX| $F823
    .byte $3F ; |  XXXXXX| $F824
    .byte $3F ; |  XXXXXX| $F825
    .byte $3F ; |  XXXXXX| $F826
    .byte $3F ; |  XXXXXX| $F827
    .byte $7F ; | XXXXXXX| $F828
    .byte $7F ; | XXXXXXX| $F829
    .byte $7F ; | XXXXXXX| $F82A
    .byte $7F ; | XXXXXXX| $F82B
    .byte $7F ; | XXXXXXX| $F82C
    .byte $7F ; | XXXXXXX| $F82D
    .byte $FF ; |XXXXXXXX| $F82E
    .byte $FF ; |XXXXXXXX| $F82F
    .byte $FF ; |XXXXXXXX| $F830
    .byte $FF ; |XXXXXXXX| $F831
    .byte $FF ; |XXXXXXXX| $F832
    .byte $FF ; |XXXXXXXX| $F833
    .byte $F2 ; |XXXX  X | $F834
    .byte $FD ; |XXXXXX X| $F835
    .byte $FE ; |XXXXXXX | $F836
    .byte $CF ; |XX  XXXX| $F837
    .byte $F1 ; |XXXX   X| $F838
    .byte $FE ; |XXXXXXX | $F839
    .byte $FF ; |XXXXXXXX| $F83A
    .byte $F9 ; |XXXXX  X| $F83B
    .byte $67 ; | XX  XXX| $F83C
    .byte $7E ; | XXXXXX | $F83D
    .byte $7D ; | XXXXX X| $F83E
    .byte $7B ; | XXXX XX| $F83F
    .byte $3F ; |  XXXXXX| $F840
    .byte $3F ; |  XXXXXX| $F841
    .byte $3F ; |  XXXXXX| $F842
    .byte $3F ; |  XXXXXX| $F843
    .byte $1F ; |   XXXXX| $F844
    .byte $1F ; |   XXXXX| $F845
    .byte $1F ; |   XXXXX| $F846
    .byte $1F ; |   XXXXX| $F847
    .byte $1F ; |   XXXXX| $F848
    .byte $0F ; |    XXXX| $F849
    .byte $6F ; | XX XXXX| $F84A
    .byte $E7 ; |XXX  XXX| $F84B
    .byte $07 ; |     XXX| $F84C
    .byte $03 ; |      XX| $F84D
    .byte $1E ; |   XXXX | $F84E
    .byte $7C ; | XXXXX  | $F84F
    .byte $C3 ; |XX    XX| $F850
    .byte $06 ; |     XX | $F851
    .byte $0D ; |    XX X| $F852
    .byte $19 ; |   XX  X| $F853
    .byte $33 ; |  XX  XX| $F854
    .byte $62 ; | XX   X | $F855
    .byte $C6 ; |XX   XX | $F856
    .byte $84 ; |X    X  | $F857
    .byte $04 ; |     X  | $F858
    .byte $0C ; |    XX  | $F859
    .byte $08 ; |    X   | $F85A
    .byte $08 ; |    X   | $F85B
    .byte $18 ; |   XX   | $F85C
    .byte $00 ; |        | $F85D
    .byte $00 ; |        | $F85E
    .byte $00 ; |        | $F85F
    .byte $00 ; |        | $F860
    .byte $00 ; |        | $F861
    .byte $00 ; |        | $F862
    .byte $00 ; |        | $F863
    .byte $00 ; |        | $F864
    .byte $00 ; |        | $F865
    .byte $00 ; |        | $F866
    .byte $00 ; |        | $F867
    .byte $00 ; |        | $F868
    .byte $00 ; |        | $F869
    .byte $00 ; |        | $F86A
    .byte $00 ; |        | $F86B
    .byte $00 ; |        | $F86C
    .byte $00 ; |        | $F86D
    .byte $00 ; |        | $F86E
    .byte $00 ; |        | $F86F
    .byte $00 ; |        | $F870
    .byte $00 ; |        | $F871
    .byte $00 ; |        | $F872
    .byte $00 ; |        | $F873
    .byte $00 ; |        | $F874
    .byte $00 ; |        | $F875
    .byte $00 ; |        | $F876
    .byte $00 ; |        | $F877
    .byte $00 ; |        | $F878
    .byte $00 ; |        | $F879
    .byte $00 ; |        | $F87A
    .byte $00 ; |        | $F87B
    .byte $00 ; |        | $F87C
    .byte $00 ; |        | $F87D
    .byte $00 ; |        | $F87E
    .byte $00 ; |        | $F87F
    .byte $00 ; |        | $F880
    .byte $00 ; |        | $F881
    .byte $00 ; |        | $F882
    .byte $00 ; |        | $F883
    .byte $00 ; |        | $F884
    .byte $00 ; |        | $F885
    .byte $00 ; |        | $F886
    .byte $00 ; |        | $F887
    .byte $00 ; |        | $F888
    .byte $00 ; |        | $F889
    .byte $00 ; |        | $F88A
    .byte $00 ; |        | $F88B
    .byte $00 ; |        | $F88C
    .byte $00 ; |        | $F88D
    .byte $00 ; |        | $F88E
    .byte $00 ; |        | $F88F
    .byte $00 ; |        | $F890
    .byte $00 ; |        | $F891
    .byte $00 ; |        | $F892
    .byte $00 ; |        | $F893
    .byte $00 ; |        | $F894
    .byte $00 ; |        | $F895
    .byte $00 ; |        | $F896
    .byte $00 ; |        | $F897
    .byte $00 ; |        | $F898
    .byte $00 ; |        | $F899
    .byte $00 ; |        | $F89A
LF89B:
    .byte $FB ; |XXXXX XX| $F89B
    .byte $FB ; |XXXXX XX| $F89C
    .byte $FB ; |XXXXX XX| $F89D
    .byte $FB ; |XXXXX XX| $F89E
    .byte $FB ; |XXXXX XX| $F89F
    .byte $FB ; |XXXXX XX| $F8A0
    .byte $FB ; |XXXXX XX| $F8A1
    .byte $FB ; |XXXXX XX| $F8A2
    .byte $FB ; |XXXXX XX| $F8A3
    .byte $FB ; |XXXXX XX| $F8A4
    .byte $FB ; |XXXXX XX| $F8A5
    .byte $FB ; |XXXXX XX| $F8A6
    .byte $FB ; |XXXXX XX| $F8A7
    .byte $FB ; |XXXXX XX| $F8A8
    .byte $FB ; |XXXXX XX| $F8A9
    .byte $FB ; |XXXXX XX| $F8AA
    .byte $FB ; |XXXXX XX| $F8AB
    .byte $FB ; |XXXXX XX| $F8AC
    .byte $FB ; |XXXXX XX| $F8AD
    .byte $FB ; |XXXXX XX| $F8AE
    .byte $FB ; |XXXXX XX| $F8AF
    .byte $FB ; |XXXXX XX| $F8B0
    .byte $FB ; |XXXXX XX| $F8B1
    .byte $FB ; |XXXXX XX| $F8B2
    .byte $FB ; |XXXXX XX| $F8B3
    .byte $FB ; |XXXXX XX| $F8B4
    .byte $FB ; |XXXXX XX| $F8B5
    .byte $FB ; |XXXXX XX| $F8B6
    .byte $00 ; |        | $F8B7
    .byte $00 ; |        | $F8B8
    .byte $00 ; |        | $F8B9
    .byte $00 ; |        | $F8BA
    .byte $00 ; |        | $F8BB
    .byte $00 ; |        | $F8BC
    .byte $00 ; |        | $F8BD
    .byte $00 ; |        | $F8BE
    .byte $00 ; |        | $F8BF
    .byte $00 ; |        | $F8C0
    .byte $00 ; |        | $F8C1
    .byte $00 ; |        | $F8C2
    .byte $00 ; |        | $F8C3
    .byte $00 ; |        | $F8C4
    .byte $00 ; |        | $F8C5
    .byte $00 ; |        | $F8C6
    .byte $00 ; |        | $F8C7
    .byte $00 ; |        | $F8C8
    .byte $00 ; |        | $F8C9
    .byte $00 ; |        | $F8CA
    .byte $00 ; |        | $F8CB
    .byte $00 ; |        | $F8CC
    .byte $00 ; |        | $F8CD
    .byte $00 ; |        | $F8CE
    .byte $00 ; |        | $F8CF
    .byte $00 ; |        | $F8D0
    .byte $00 ; |        | $F8D1
    .byte $00 ; |        | $F8D2
    .byte $00 ; |        | $F8D3
    .byte $00 ; |        | $F8D4
    .byte $00 ; |        | $F8D5
    .byte $00 ; |        | $F8D6
    .byte $00 ; |        | $F8D7
    .byte $00 ; |        | $F8D8
    .byte $00 ; |        | $F8D9
    .byte $00 ; |        | $F8DA
    .byte $00 ; |        | $F8DB
    .byte $00 ; |        | $F8DC
    .byte $00 ; |        | $F8DD
    .byte $00 ; |        | $F8DE
    .byte $00 ; |        | $F8DF
    .byte $00 ; |        | $F8E0
    .byte $00 ; |        | $F8E1
    .byte $00 ; |        | $F8E2
    .byte $00 ; |        | $F8E3
    .byte $00 ; |        | $F8E4
    .byte $00 ; |        | $F8E5
    .byte $00 ; |        | $F8E6
    .byte $00 ; |        | $F8E7
    .byte $00 ; |        | $F8E8
    .byte $00 ; |        | $F8E9
    .byte $00 ; |        | $F8EA
    .byte $00 ; |        | $F8EB
    .byte $00 ; |        | $F8EC
    .byte $00 ; |        | $F8ED
    .byte $00 ; |        | $F8EE
    .byte $00 ; |        | $F8EF
    .byte $00 ; |        | $F8F0
    .byte $00 ; |        | $F8F1
    .byte $00 ; |        | $F8F2
    .byte $00 ; |        | $F8F3
    .byte $00 ; |        | $F8F4
    .byte $00 ; |        | $F8F5
    .byte $00 ; |        | $F8F6
    .byte $00 ; |        | $F8F7
    .byte $00 ; |        | $F8F8
    .byte $00 ; |        | $F8F9
    .byte $00 ; |        | $F8FA
    .byte $00 ; |        | $F8FB
    .byte $00 ; |        | $F8FC
    .byte $00 ; |        | $F8FD
    .byte $00 ; |        | $F8FE
    .byte $00 ; |        | $F8FF
LF900:
    .byte $FD ; |XXXXXX X| $F900
    .byte $FD ; |XXXXXX X| $F901
    .byte $FD ; |XXXXXX X| $F902
    .byte $FD ; |XXXXXX X| $F903
    .byte $FD ; |XXXXXX X| $F904
    .byte $FD ; |XXXXXX X| $F905
    .byte $FD ; |XXXXXX X| $F906
    .byte $FD ; |XXXXXX X| $F907
    .byte $DD ; |XX XXX X| $F908
    .byte $DD ; |XX XXX X| $F909
    .byte $DD ; |XX XXX X| $F90A
    .byte $DD ; |XX XXX X| $F90B
    .byte $DD ; |XX XXX X| $F90C
    .byte $DD ; |XX XXX X| $F90D
    .byte $DD ; |XX XXX X| $F90E
    .byte $DD ; |XX XXX X| $F90F
    .byte $DD ; |XX XXX X| $F910
    .byte $DD ; |XX XXX X| $F911
    .byte $FD ; |XXXXXX X| $F912
    .byte $FD ; |XXXXXX X| $F913
    .byte $FD ; |XXXXXX X| $F914
    .byte $FD ; |XXXXXX X| $F915
    .byte $FD ; |XXXXXX X| $F916
    .byte $FD ; |XXXXXX X| $F917
    .byte $00 ; |        | $F918
LF919:
    .byte $FF ; |XXXXXXXX| $F919
    .byte $FF ; |XXXXXXXX| $F91A
    .byte $FF ; |XXXXXXXX| $F91B
    .byte $FF ; |XXXXXXXX| $F91C
    .byte $FF ; |XXXXXXXX| $F91D
    .byte $FF ; |XXXXXXXX| $F91E
    .byte $FF ; |XXXXXXXX| $F91F
    .byte $FF ; |XXXXXXXX| $F920
    .byte $FF ; |XXXXXXXX| $F921
    .byte $FF ; |XXXXXXXX| $F922
    .byte $FF ; |XXXXXXXX| $F923
    .byte $FF ; |XXXXXXXX| $F924
    .byte $FF ; |XXXXXXXX| $F925
    .byte $FF ; |XXXXXXXX| $F926
    .byte $FF ; |XXXXXXXX| $F927
    .byte $F0 ; |XXXX    | $F928
    .byte $E7 ; |XXX  XXX| $F929
    .byte $DF ; |XX XXXXX| $F92A
    .byte $DF ; |XX XXXXX| $F92B
    .byte $E0 ; |XXX     | $F92C
    .byte $E0 ; |XXX     | $F92D
    .byte $EF ; |XXX XXXX| $F92E
    .byte $CF ; |XX  XXXX| $F92F
    .byte $CF ; |XX  XXXX| $F930
    .byte $8F ; |X   XXXX| $F931
    .byte $8F ; |X   XXXX| $F932
    .byte $00 ; |        | $F933
    .byte $7F ; | XXXXXXX| $F934
    .byte $FF ; |XXXXXXXX| $F935
    .byte $FF ; |XXXXXXXX| $F936
    .byte $FF ; |XXXXXXXX| $F937
    .byte $F8 ; |XXXXX   | $F938
    .byte $70 ; | XXX    | $F939
    .byte $F0 ; |XXXX    | $F93A
    .byte $F0 ; |XXXX    | $F93B
    .byte $74 ; | XXX X  | $F93C
    .byte $F2 ; |XXXX  X | $F93D
    .byte $F8 ; |XXXXX   | $F93E
    .byte $FF ; |XXXXXXXX| $F93F
    .byte $0F ; |    XXXX| $F940
    .byte $07 ; |     XXX| $F941
    .byte $90 ; |X  X    | $F942
    .byte $83 ; |X     XX| $F943
    .byte $C7 ; |XX   XXX| $F944
    .byte $EF ; |XXX XXXX| $F945
    .byte $FF ; |XXXXXXXX| $F946
    .byte $F7 ; |XXXX XXX| $F947
    .byte $E7 ; |XXX  XXX| $F948
    .byte $CF ; |XX  XXXX| $F949
    .byte $9F ; |X  XXXXX| $F94A
    .byte $FF ; |XXXXXXXX| $F94B
    .byte $FF ; |XXXXXXXX| $F94C
    .byte $FF ; |XXXXXXXX| $F94D
    .byte $FF ; |XXXXXXXX| $F94E
    .byte $FF ; |XXXXXXXX| $F94F
    .byte $3F ; |  XXXXXX| $F950
    .byte $8F ; |X   XXXX| $F951
    .byte $80 ; |X       | $F952
    .byte $00 ; |        | $F953
    .byte $00 ; |        | $F954
    .byte $00 ; |        | $F955
    .byte $00 ; |        | $F956
    .byte $00 ; |        | $F957
    .byte $00 ; |        | $F958
    .byte $00 ; |        | $F959
    .byte $00 ; |        | $F95A
    .byte $00 ; |        | $F95B
    .byte $00 ; |        | $F95C
    .byte $00 ; |        | $F95D
    .byte $00 ; |        | $F95E
    .byte $00 ; |        | $F95F
    .byte $00 ; |        | $F960
    .byte $00 ; |        | $F961
    .byte $00 ; |        | $F962
    .byte $00 ; |        | $F963
    .byte $00 ; |        | $F964
    .byte $00 ; |        | $F965
    .byte $00 ; |        | $F966
    .byte $00 ; |        | $F967
    .byte $00 ; |        | $F968
    .byte $00 ; |        | $F969
    .byte $00 ; |        | $F96A
    .byte $00 ; |        | $F96B
    .byte $00 ; |        | $F96C
    .byte $00 ; |        | $F96D
    .byte $00 ; |        | $F96E
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
    .byte $00 ; |        | $F97A
    .byte $00 ; |        | $F97B
    .byte $00 ; |        | $F97C
    .byte $00 ; |        | $F97D
    .byte $00 ; |        | $F97E
    .byte $00 ; |        | $F97F
    .byte $00 ; |        | $F980
    .byte $00 ; |        | $F981
    .byte $00 ; |        | $F982
    .byte $00 ; |        | $F983
    .byte $00 ; |        | $F984
    .byte $00 ; |        | $F985
    .byte $00 ; |        | $F986
    .byte $00 ; |        | $F987
    .byte $00 ; |        | $F988
    .byte $00 ; |        | $F989
    .byte $00 ; |        | $F98A
    .byte $00 ; |        | $F98B
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
    .byte $00 ; |        | $F997
    .byte $00 ; |        | $F998
    .byte $00 ; |        | $F999
    .byte $00 ; |        | $F99A
LF99B:
    .byte $FD ; |XXXXXX X| $F99B
    .byte $FD ; |XXXXXX X| $F99C
    .byte $FD ; |XXXXXX X| $F99D
    .byte $FD ; |XXXXXX X| $F99E
    .byte $FD ; |XXXXXX X| $F99F
    .byte $FD ; |XXXXXX X| $F9A0
    .byte $FD ; |XXXXXX X| $F9A1
    .byte $FD ; |XXXXXX X| $F9A2
    .byte $FD ; |XXXXXX X| $F9A3
    .byte $DD ; |XX XXX X| $F9A4
    .byte $DD ; |XX XXX X| $F9A5
    .byte $DD ; |XX XXX X| $F9A6
    .byte $DD ; |XX XXX X| $F9A7
    .byte $DD ; |XX XXX X| $F9A8
    .byte $DD ; |XX XXX X| $F9A9
    .byte $DD ; |XX XXX X| $F9AA
    .byte $DD ; |XX XXX X| $F9AB
    .byte $DD ; |XX XXX X| $F9AC
    .byte $DD ; |XX XXX X| $F9AD
    .byte $DD ; |XX XXX X| $F9AE
    .byte $FD ; |XXXXXX X| $F9AF
    .byte $FD ; |XXXXXX X| $F9B0
    .byte $FD ; |XXXXXX X| $F9B1
    .byte $FD ; |XXXXXX X| $F9B2
    .byte $FD ; |XXXXXX X| $F9B3
    .byte $FD ; |XXXXXX X| $F9B4
    .byte $FD ; |XXXXXX X| $F9B5
    .byte $FD ; |XXXXXX X| $F9B6
    .byte $00 ; |        | $F9B7
    .byte $00 ; |        | $F9B8
    .byte $00 ; |        | $F9B9
    .byte $00 ; |        | $F9BA
    .byte $00 ; |        | $F9BB
    .byte $00 ; |        | $F9BC
    .byte $00 ; |        | $F9BD
    .byte $00 ; |        | $F9BE
    .byte $00 ; |        | $F9BF
    .byte $00 ; |        | $F9C0
    .byte $00 ; |        | $F9C1
    .byte $00 ; |        | $F9C2
    .byte $00 ; |        | $F9C3
    .byte $00 ; |        | $F9C4
    .byte $00 ; |        | $F9C5
    .byte $00 ; |        | $F9C6
    .byte $00 ; |        | $F9C7
    .byte $00 ; |        | $F9C8
    .byte $00 ; |        | $F9C9
    .byte $00 ; |        | $F9CA
    .byte $00 ; |        | $F9CB
    .byte $00 ; |        | $F9CC
    .byte $00 ; |        | $F9CD
    .byte $00 ; |        | $F9CE
    .byte $00 ; |        | $F9CF
    .byte $00 ; |        | $F9D0
    .byte $00 ; |        | $F9D1
    .byte $00 ; |        | $F9D2
    .byte $00 ; |        | $F9D3
    .byte $00 ; |        | $F9D4
    .byte $00 ; |        | $F9D5
    .byte $00 ; |        | $F9D6
    .byte $00 ; |        | $F9D7
    .byte $00 ; |        | $F9D8
    .byte $00 ; |        | $F9D9
    .byte $00 ; |        | $F9DA
    .byte $00 ; |        | $F9DB
    .byte $00 ; |        | $F9DC
    .byte $00 ; |        | $F9DD
    .byte $00 ; |        | $F9DE
    .byte $00 ; |        | $F9DF
    .byte $00 ; |        | $F9E0
    .byte $00 ; |        | $F9E1
    .byte $00 ; |        | $F9E2
    .byte $00 ; |        | $F9E3
    .byte $00 ; |        | $F9E4
    .byte $00 ; |        | $F9E5
    .byte $00 ; |        | $F9E6
    .byte $00 ; |        | $F9E7
    .byte $00 ; |        | $F9E8
    .byte $00 ; |        | $F9E9
    .byte $00 ; |        | $F9EA
    .byte $00 ; |        | $F9EB
    .byte $00 ; |        | $F9EC
    .byte $00 ; |        | $F9ED
    .byte $00 ; |        | $F9EE
    .byte $00 ; |        | $F9EF
    .byte $00 ; |        | $F9F0
    .byte $00 ; |        | $F9F1
    .byte $00 ; |        | $F9F2
    .byte $00 ; |        | $F9F3
    .byte $00 ; |        | $F9F4
    .byte $00 ; |        | $F9F5
    .byte $00 ; |        | $F9F6
    .byte $00 ; |        | $F9F7
    .byte $00 ; |        | $F9F8
    .byte $00 ; |        | $F9F9
    .byte $00 ; |        | $F9FA
    .byte $00 ; |        | $F9FB
    .byte $00 ; |        | $F9FC
    .byte $00 ; |        | $F9FD
    .byte $00 ; |        | $F9FE
    .byte $00 ; |        | $F9FF
LFA00:
    .byte $FB ; |XXXXX XX| $FA00
    .byte $FB ; |XXXXX XX| $FA01
    .byte $FB ; |XXXXX XX| $FA02
    .byte $FB ; |XXXXX XX| $FA03
    .byte $FB ; |XXXXX XX| $FA04
    .byte $FB ; |XXXXX XX| $FA05
    .byte $FB ; |XXXXX XX| $FA06
    .byte $FB ; |XXXXX XX| $FA07
    .byte $FB ; |XXXXX XX| $FA08
    .byte $FB ; |XXXXX XX| $FA09
    .byte $FB ; |XXXXX XX| $FA0A
    .byte $FB ; |XXXXX XX| $FA0B
    .byte $FB ; |XXXXX XX| $FA0C
    .byte $C3 ; |XX    XX| $FA0D
    .byte $DF ; |XX XXXXX| $FA0E
    .byte $DF ; |XX XXXXX| $FA0F
    .byte $DF ; |XX XXXXX| $FA10
    .byte $DF ; |XX XXXXX| $FA11
    .byte $DF ; |XX XXXXX| $FA12
    .byte $DF ; |XX XXXXX| $FA13
    .byte $DF ; |XX XXXXX| $FA14
    .byte $DF ; |XX XXXXX| $FA15
    .byte $DF ; |XX XXXXX| $FA16
    .byte $DF ; |XX XXXXX| $FA17
    .byte $00 ; |        | $FA18
LFA19:
    .byte $FF ; |XXXXXXXX| $FA19
    .byte $FF ; |XXXXXXXX| $FA1A
    .byte $FF ; |XXXXXXXX| $FA1B
    .byte $FF ; |XXXXXXXX| $FA1C
    .byte $FF ; |XXXXXXXX| $FA1D
    .byte $FF ; |XXXXXXXX| $FA1E
    .byte $FF ; |XXXXXXXX| $FA1F
    .byte $FF ; |XXXXXXXX| $FA20
    .byte $FF ; |XXXXXXXX| $FA21
    .byte $FF ; |XXXXXXXX| $FA22
    .byte $FF ; |XXXXXXXX| $FA23
    .byte $FF ; |XXXXXXXX| $FA24
    .byte $FF ; |XXXXXXXX| $FA25
    .byte $FF ; |XXXXXXXX| $FA26
    .byte $FF ; |XXXXXXXX| $FA27
    .byte $3F ; |  XXXXXX| $FA28
    .byte $9F ; |X  XXXXX| $FA29
    .byte $EF ; |XXX XXXX| $FA2A
    .byte $EF ; |XXX XXXX| $FA2B
    .byte $3F ; |  XXXXXX| $FA2C
    .byte $1F ; |   XXXXX| $FA2D
    .byte $DF ; |XX XXXXX| $FA2E
    .byte $CF ; |XX  XXXX| $FA2F
    .byte $CF ; |XX  XXXX| $FA30
    .byte $C7 ; |XX   XXX| $FA31
    .byte $C7 ; |XX   XXX| $FA32
    .byte $03 ; |      XX| $FA33
    .byte $F9 ; |XXXXX  X| $FA34
    .byte $FE ; |XXXXXXX | $FA35
    .byte $FD ; |XXXXXX X| $FA36
    .byte $FF ; |XXXXXXXX| $FA37
    .byte $7F ; | XXXXXXX| $FA38
    .byte $3C ; |  XXXX  | $FA39
    .byte $3F ; |  XXXXXX| $FA3A
    .byte $3E ; |  XXXXX | $FA3B
    .byte $3B ; |  XXX XX| $FA3C
    .byte $3D ; |  XXXX X| $FA3D
    .byte $7E ; | XXXXXX | $FA3E
    .byte $FF ; |XXXXXXXX| $FA3F
    .byte $E1 ; |XXX    X| $FA40
    .byte $C1 ; |XX     X| $FA41
    .byte $13 ; |   X  XX| $FA42
    .byte $83 ; |X     XX| $FA43
    .byte $C7 ; |XX   XXX| $FA44
    .byte $EF ; |XXX XXXX| $FA45
    .byte $FF ; |XXXXXXXX| $FA46
    .byte $BF ; |X XXXXXX| $FA47
    .byte $9F ; |X  XXXXX| $FA48
    .byte $CF ; |XX  XXXX| $FA49
    .byte $E7 ; |XXX  XXX| $FA4A
    .byte $FF ; |XXXXXXXX| $FA4B
    .byte $FF ; |XXXXXXXX| $FA4C
    .byte $FF ; |XXXXXXXX| $FA4D
    .byte $FF ; |XXXXXXXX| $FA4E
    .byte $FE ; |XXXXXXX | $FA4F
    .byte $F1 ; |XXXX   X| $FA50
    .byte $C9 ; |XX  X  X| $FA51
    .byte $0C ; |    XX  | $FA52
    .byte $06 ; |     XX | $FA53
    .byte $06 ; |     XX | $FA54
    .byte $03 ; |      XX| $FA55
    .byte $01 ; |       X| $FA56
    .byte $00 ; |        | $FA57
    .byte $00 ; |        | $FA58
    .byte $00 ; |        | $FA59
    .byte $00 ; |        | $FA5A
    .byte $00 ; |        | $FA5B
    .byte $00 ; |        | $FA5C
    .byte $00 ; |        | $FA5D
    .byte $00 ; |        | $FA5E
    .byte $00 ; |        | $FA5F
    .byte $00 ; |        | $FA60
    .byte $00 ; |        | $FA61
    .byte $00 ; |        | $FA62
    .byte $00 ; |        | $FA63
    .byte $00 ; |        | $FA64
    .byte $00 ; |        | $FA65
    .byte $00 ; |        | $FA66
    .byte $00 ; |        | $FA67
    .byte $00 ; |        | $FA68
    .byte $00 ; |        | $FA69
    .byte $00 ; |        | $FA6A
    .byte $00 ; |        | $FA6B
    .byte $00 ; |        | $FA6C
    .byte $00 ; |        | $FA6D
    .byte $00 ; |        | $FA6E
    .byte $00 ; |        | $FA6F
    .byte $00 ; |        | $FA70
    .byte $00 ; |        | $FA71
    .byte $00 ; |        | $FA72
    .byte $00 ; |        | $FA73
    .byte $00 ; |        | $FA74
    .byte $00 ; |        | $FA75
    .byte $00 ; |        | $FA76
    .byte $00 ; |        | $FA77
    .byte $00 ; |        | $FA78
    .byte $00 ; |        | $FA79
    .byte $00 ; |        | $FA7A
    .byte $00 ; |        | $FA7B
    .byte $00 ; |        | $FA7C
    .byte $00 ; |        | $FA7D
    .byte $00 ; |        | $FA7E
    .byte $00 ; |        | $FA7F
    .byte $00 ; |        | $FA80
    .byte $00 ; |        | $FA81
    .byte $00 ; |        | $FA82
    .byte $00 ; |        | $FA83
    .byte $00 ; |        | $FA84
    .byte $00 ; |        | $FA85
    .byte $00 ; |        | $FA86
    .byte $00 ; |        | $FA87
    .byte $00 ; |        | $FA88
    .byte $00 ; |        | $FA89
    .byte $00 ; |        | $FA8A
    .byte $00 ; |        | $FA8B
    .byte $00 ; |        | $FA8C
    .byte $00 ; |        | $FA8D
    .byte $00 ; |        | $FA8E
    .byte $00 ; |        | $FA8F
    .byte $00 ; |        | $FA90
    .byte $00 ; |        | $FA91
    .byte $00 ; |        | $FA92
    .byte $00 ; |        | $FA93
    .byte $00 ; |        | $FA94
    .byte $00 ; |        | $FA95
    .byte $00 ; |        | $FA96
    .byte $00 ; |        | $FA97
    .byte $00 ; |        | $FA98
    .byte $00 ; |        | $FA99
    .byte $00 ; |        | $FA9A
LFA9B:
    .byte $FB ; |XXXXX XX| $FA9B
    .byte $FB ; |XXXXX XX| $FA9C
    .byte $FB ; |XXXXX XX| $FA9D
    .byte $FB ; |XXXXX XX| $FA9E
    .byte $FB ; |XXXXX XX| $FA9F
    .byte $FB ; |XXXXX XX| $FAA0
    .byte $FB ; |XXXXX XX| $FAA1
    .byte $FB ; |XXXXX XX| $FAA2
    .byte $FB ; |XXXXX XX| $FAA3
    .byte $FB ; |XXXXX XX| $FAA4
    .byte $FB ; |XXXXX XX| $FAA5
    .byte $FB ; |XXXXX XX| $FAA6
    .byte $C3 ; |XX    XX| $FAA7
    .byte $DF ; |XX XXXXX| $FAA8
    .byte $DF ; |XX XXXXX| $FAA9
    .byte $DF ; |XX XXXXX| $FAAA
    .byte $DF ; |XX XXXXX| $FAAB
    .byte $DF ; |XX XXXXX| $FAAC
    .byte $DF ; |XX XXXXX| $FAAD
    .byte $DF ; |XX XXXXX| $FAAE
    .byte $DF ; |XX XXXXX| $FAAF
    .byte $DF ; |XX XXXXX| $FAB0
    .byte $DF ; |XX XXXXX| $FAB1
    .byte $DF ; |XX XXXXX| $FAB2
    .byte $DF ; |XX XXXXX| $FAB3
    .byte $DF ; |XX XXXXX| $FAB4
    .byte $DF ; |XX XXXXX| $FAB5
    .byte $DF ; |XX XXXXX| $FAB6
    .byte $00 ; |        | $FAB7
    .byte $00 ; |        | $FAB8
    .byte $00 ; |        | $FAB9
    .byte $00 ; |        | $FABA
    .byte $00 ; |        | $FABB
    .byte $00 ; |        | $FABC
    .byte $00 ; |        | $FABD
    .byte $00 ; |        | $FABE
    .byte $00 ; |        | $FABF
    .byte $00 ; |        | $FAC0
    .byte $00 ; |        | $FAC1
    .byte $00 ; |        | $FAC2
    .byte $00 ; |        | $FAC3
    .byte $00 ; |        | $FAC4
    .byte $00 ; |        | $FAC5
    .byte $00 ; |        | $FAC6
    .byte $00 ; |        | $FAC7
    .byte $00 ; |        | $FAC8
    .byte $00 ; |        | $FAC9
    .byte $00 ; |        | $FACA
    .byte $00 ; |        | $FACB
    .byte $00 ; |        | $FACC
    .byte $00 ; |        | $FACD
    .byte $00 ; |        | $FACE
    .byte $00 ; |        | $FACF
    .byte $00 ; |        | $FAD0
    .byte $00 ; |        | $FAD1
    .byte $00 ; |        | $FAD2
    .byte $00 ; |        | $FAD3
    .byte $00 ; |        | $FAD4
    .byte $00 ; |        | $FAD5
    .byte $00 ; |        | $FAD6
    .byte $00 ; |        | $FAD7
    .byte $00 ; |        | $FAD8
    .byte $00 ; |        | $FAD9
    .byte $00 ; |        | $FADA
    .byte $00 ; |        | $FADB
    .byte $00 ; |        | $FADC
    .byte $00 ; |        | $FADD
    .byte $00 ; |        | $FADE
    .byte $00 ; |        | $FADF
    .byte $00 ; |        | $FAE0
    .byte $00 ; |        | $FAE1
    .byte $00 ; |        | $FAE2
    .byte $00 ; |        | $FAE3
    .byte $00 ; |        | $FAE4
    .byte $00 ; |        | $FAE5
    .byte $00 ; |        | $FAE6
    .byte $00 ; |        | $FAE7
    .byte $00 ; |        | $FAE8
    .byte $00 ; |        | $FAE9
    .byte $00 ; |        | $FAEA
    .byte $00 ; |        | $FAEB
    .byte $00 ; |        | $FAEC
    .byte $00 ; |        | $FAED
    .byte $00 ; |        | $FAEE
    .byte $00 ; |        | $FAEF
    .byte $00 ; |        | $FAF0
    .byte $00 ; |        | $FAF1
    .byte $00 ; |        | $FAF2
    .byte $00 ; |        | $FAF3
    .byte $00 ; |        | $FAF4
    .byte $00 ; |        | $FAF5
    .byte $00 ; |        | $FAF6
    .byte $00 ; |        | $FAF7
    .byte $00 ; |        | $FAF8
    .byte $00 ; |        | $FAF9
    .byte $00 ; |        | $FAFA
    .byte $00 ; |        | $FAFB
    .byte $00 ; |        | $FAFC
    .byte $00 ; |        | $FAFD
    .byte $00 ; |        | $FAFE
    .byte $00 ; |        | $FAFF
LFB00:
    .byte $E3 ; |XXX   XX| $FB00
    .byte $E3 ; |XXX   XX| $FB01
    .byte $E3 ; |XXX   XX| $FB02
    .byte $E3 ; |XXX   XX| $FB03
    .byte $E3 ; |XXX   XX| $FB04
    .byte $E3 ; |XXX   XX| $FB05
    .byte $E3 ; |XXX   XX| $FB06
    .byte $E3 ; |XXX   XX| $FB07
    .byte $E3 ; |XXX   XX| $FB08
    .byte $E3 ; |XXX   XX| $FB09
    .byte $E3 ; |XXX   XX| $FB0A
    .byte $E7 ; |XXX  XXX| $FB0B
    .byte $0F ; |    XXXX| $FB0C
    .byte $EF ; |XXX XXXX| $FB0D
    .byte $EF ; |XXX XXXX| $FB0E
    .byte $EF ; |XXX XXXX| $FB0F
    .byte $0F ; |    XXXX| $FB10
    .byte $EF ; |XXX XXXX| $FB11
    .byte $EF ; |XXX XXXX| $FB12
    .byte $EF ; |XXX XXXX| $FB13
    .byte $EF ; |XXX XXXX| $FB14
    .byte $EE ; |XXX XXX | $FB15
    .byte $EC ; |XXX XX  | $FB16
    .byte $E8 ; |XXX X   | $FB17
    .byte $00 ; |        | $FB18
LFB19:
    .byte $FF ; |XXXXXXXX| $FB19
    .byte $FF ; |XXXXXXXX| $FB1A
    .byte $FF ; |XXXXXXXX| $FB1B
    .byte $FF ; |XXXXXXXX| $FB1C
    .byte $FF ; |XXXXXXXX| $FB1D
    .byte $FF ; |XXXXXXXX| $FB1E
    .byte $FF ; |XXXXXXXX| $FB1F
    .byte $E0 ; |XXX     | $FB20
    .byte $E0 ; |XXX     | $FB21
    .byte $E0 ; |XXX     | $FB22
    .byte $F0 ; |XXXX    | $FB23
    .byte $F0 ; |XXXX    | $FB24
    .byte $F0 ; |XXXX    | $FB25
    .byte $F0 ; |XXXX    | $FB26
    .byte $F0 ; |XXXX    | $FB27
    .byte $F8 ; |XXXXX   | $FB28
    .byte $F8 ; |XXXXX   | $FB29
    .byte $F8 ; |XXXXX   | $FB2A
    .byte $F8 ; |XXXXX   | $FB2B
    .byte $F8 ; |XXXXX   | $FB2C
    .byte $F8 ; |XXXXX   | $FB2D
    .byte $F8 ; |XXXXX   | $FB2E
    .byte $FC ; |XXXXXX  | $FB2F
    .byte $FC ; |XXXXXX  | $FB30
    .byte $FC ; |XXXXXX  | $FB31
    .byte $FC ; |XXXXXX  | $FB32
    .byte $FC ; |XXXXXX  | $FB33
    .byte $3C ; |  XXXX  | $FB34
    .byte $FC ; |XXXXXX  | $FB35
    .byte $FC ; |XXXXXX  | $FB36
    .byte $E4 ; |XXX  X  | $FB37
    .byte $1C ; |   XXX  | $FB38
    .byte $FC ; |XXXXXX  | $FB39
    .byte $FC ; |XXXXXX  | $FB3A
    .byte $7C ; | XXXXX  | $FB3B
    .byte $98 ; |X  XX   | $FB3C
    .byte $F8 ; |XXXXX   | $FB3D
    .byte $F8 ; |XXXXX   | $FB3E
    .byte $78 ; | XXXX   | $FB3F
    .byte $F0 ; |XXXX    | $FB40
    .byte $F0 ; |XXXX    | $FB41
    .byte $F0 ; |XXXX    | $FB42
    .byte $F0 ; |XXXX    | $FB43
    .byte $E0 ; |XXX     | $FB44
    .byte $E0 ; |XXX     | $FB45
    .byte $E0 ; |XXX     | $FB46
    .byte $E0 ; |XXX     | $FB47
    .byte $E0 ; |XXX     | $FB48
    .byte $D8 ; |XX XX   | $FB49
    .byte $DE ; |XX XXXX | $FB4A
    .byte $C3 ; |XX    XX| $FB4B
    .byte $80 ; |X       | $FB4C
    .byte $80 ; |X       | $FB4D
    .byte $60 ; | XX     | $FB4E
    .byte $38 ; |  XXX   | $FB4F
    .byte $0E ; |    XXX | $FB50
    .byte $83 ; |X     XX| $FB51
    .byte $C0 ; |XX      | $FB52
    .byte $60 ; | XX     | $FB53
    .byte $30 ; |  XX    | $FB54
    .byte $18 ; |   XX   | $FB55
    .byte $8C ; |X   XX  | $FB56
    .byte $86 ; |X    XX | $FB57
    .byte $C3 ; |XX    XX| $FB58
    .byte $61 ; | XX    X| $FB59
    .byte $30 ; |  XX    | $FB5A
    .byte $10 ; |   X    | $FB5B
    .byte $00 ; |        | $FB5C
    .byte $00 ; |        | $FB5D
    .byte $00 ; |        | $FB5E
    .byte $00 ; |        | $FB5F
    .byte $00 ; |        | $FB60
    .byte $00 ; |        | $FB61
    .byte $00 ; |        | $FB62
    .byte $00 ; |        | $FB63
    .byte $00 ; |        | $FB64
    .byte $00 ; |        | $FB65
    .byte $00 ; |        | $FB66
    .byte $00 ; |        | $FB67
    .byte $00 ; |        | $FB68
    .byte $00 ; |        | $FB69
    .byte $00 ; |        | $FB6A
    .byte $00 ; |        | $FB6B
    .byte $00 ; |        | $FB6C
    .byte $00 ; |        | $FB6D
    .byte $00 ; |        | $FB6E
    .byte $00 ; |        | $FB6F
    .byte $00 ; |        | $FB70
    .byte $00 ; |        | $FB71
    .byte $00 ; |        | $FB72
    .byte $00 ; |        | $FB73
    .byte $00 ; |        | $FB74
    .byte $00 ; |        | $FB75
    .byte $00 ; |        | $FB76
    .byte $00 ; |        | $FB77
    .byte $00 ; |        | $FB78
    .byte $00 ; |        | $FB79
    .byte $00 ; |        | $FB7A
    .byte $00 ; |        | $FB7B
    .byte $00 ; |        | $FB7C
    .byte $00 ; |        | $FB7D
    .byte $00 ; |        | $FB7E
    .byte $00 ; |        | $FB7F
    .byte $00 ; |        | $FB80
    .byte $00 ; |        | $FB81
    .byte $00 ; |        | $FB82
    .byte $00 ; |        | $FB83
    .byte $00 ; |        | $FB84
    .byte $00 ; |        | $FB85
    .byte $00 ; |        | $FB86
    .byte $00 ; |        | $FB87
    .byte $00 ; |        | $FB88
    .byte $00 ; |        | $FB89
    .byte $00 ; |        | $FB8A
    .byte $00 ; |        | $FB8B
    .byte $00 ; |        | $FB8C
    .byte $00 ; |        | $FB8D
    .byte $00 ; |        | $FB8E
    .byte $00 ; |        | $FB8F
    .byte $00 ; |        | $FB90
    .byte $00 ; |        | $FB91
    .byte $00 ; |        | $FB92
    .byte $00 ; |        | $FB93
    .byte $00 ; |        | $FB94
    .byte $00 ; |        | $FB95
    .byte $00 ; |        | $FB96
    .byte $00 ; |        | $FB97
    .byte $00 ; |        | $FB98
    .byte $00 ; |        | $FB99
    .byte $00 ; |        | $FB9A
LFB9B:
    .byte $E3 ; |XXX   XX| $FB9B
    .byte $E3 ; |XXX   XX| $FB9C
    .byte $E3 ; |XXX   XX| $FB9D
    .byte $E3 ; |XXX   XX| $FB9E
    .byte $E3 ; |XXX   XX| $FB9F
    .byte $E3 ; |XXX   XX| $FBA0
    .byte $E3 ; |XXX   XX| $FBA1
    .byte $E3 ; |XXX   XX| $FBA2
    .byte $E3 ; |XXX   XX| $FBA3
    .byte $E3 ; |XXX   XX| $FBA4
    .byte $E3 ; |XXX   XX| $FBA5
    .byte $E3 ; |XXX   XX| $FBA6
    .byte $E3 ; |XXX   XX| $FBA7
    .byte $E7 ; |XXX  XXX| $FBA8
    .byte $0F ; |    XXXX| $FBA9
    .byte $EF ; |XXX XXXX| $FBAA
    .byte $EF ; |XXX XXXX| $FBAB
    .byte $EF ; |XXX XXXX| $FBAC
    .byte $0F ; |    XXXX| $FBAD
    .byte $EF ; |XXX XXXX| $FBAE
    .byte $EF ; |XXX XXXX| $FBAF
    .byte $EF ; |XXX XXXX| $FBB0
    .byte $EF ; |XXX XXXX| $FBB1
    .byte $EF ; |XXX XXXX| $FBB2
    .byte $EF ; |XXX XXXX| $FBB3
    .byte $EE ; |XXX XXX | $FBB4
    .byte $EC ; |XXX XX  | $FBB5
    .byte $E8 ; |XXX X   | $FBB6
    .byte $00 ; |        | $FBB7
    .byte $00 ; |        | $FBB8
    .byte $00 ; |        | $FBB9
    .byte $00 ; |        | $FBBA
    .byte $00 ; |        | $FBBB
    .byte $00 ; |        | $FBBC
    .byte $00 ; |        | $FBBD
    .byte $00 ; |        | $FBBE
    .byte $00 ; |        | $FBBF
    .byte $00 ; |        | $FBC0
    .byte $00 ; |        | $FBC1
    .byte $00 ; |        | $FBC2
    .byte $00 ; |        | $FBC3
    .byte $00 ; |        | $FBC4
    .byte $00 ; |        | $FBC5
    .byte $00 ; |        | $FBC6
    .byte $00 ; |        | $FBC7
    .byte $00 ; |        | $FBC8
    .byte $00 ; |        | $FBC9
    .byte $00 ; |        | $FBCA
    .byte $00 ; |        | $FBCB
    .byte $00 ; |        | $FBCC
    .byte $00 ; |        | $FBCD
    .byte $00 ; |        | $FBCE
    .byte $00 ; |        | $FBCF
    .byte $00 ; |        | $FBD0
    .byte $00 ; |        | $FBD1
    .byte $00 ; |        | $FBD2
    .byte $00 ; |        | $FBD3
    .byte $00 ; |        | $FBD4
    .byte $00 ; |        | $FBD5
    .byte $00 ; |        | $FBD6
    .byte $00 ; |        | $FBD7
    .byte $00 ; |        | $FBD8
    .byte $00 ; |        | $FBD9
    .byte $00 ; |        | $FBDA
    .byte $00 ; |        | $FBDB
    .byte $00 ; |        | $FBDC
    .byte $00 ; |        | $FBDD
    .byte $00 ; |        | $FBDE
    .byte $00 ; |        | $FBDF
    .byte $00 ; |        | $FBE0
    .byte $00 ; |        | $FBE1
    .byte $00 ; |        | $FBE2
    .byte $00 ; |        | $FBE3
    .byte $00 ; |        | $FBE4
    .byte $00 ; |        | $FBE5
    .byte $00 ; |        | $FBE6
    .byte $00 ; |        | $FBE7
    .byte $00 ; |        | $FBE8
    .byte $00 ; |        | $FBE9
    .byte $00 ; |        | $FBEA
    .byte $00 ; |        | $FBEB
    .byte $00 ; |        | $FBEC
    .byte $00 ; |        | $FBED
    .byte $00 ; |        | $FBEE
    .byte $00 ; |        | $FBEF
    .byte $00 ; |        | $FBF0
    .byte $00 ; |        | $FBF1
    .byte $00 ; |        | $FBF2
    .byte $00 ; |        | $FBF3
    .byte $00 ; |        | $FBF4
    .byte $00 ; |        | $FBF5
    .byte $00 ; |        | $FBF6
    .byte $00 ; |        | $FBF7
    .byte $00 ; |        | $FBF8
    .byte $00 ; |        | $FBF9
    .byte $00 ; |        | $FBFA
    .byte $00 ; |        | $FBFB
    .byte $00 ; |        | $FBFC
    .byte $00 ; |        | $FBFD
    .byte $00 ; |        | $FBFE
    .byte $00 ; |        | $FBFF
LFC00:
    .byte $F0 ; |XXXX    | $FC00
    .byte $F0 ; |XXXX    | $FC01
    .byte $F0 ; |XXXX    | $FC02
    .byte $F0 ; |XXXX    | $FC03
    .byte $F0 ; |XXXX    | $FC04
    .byte $F0 ; |XXXX    | $FC05
    .byte $F0 ; |XXXX    | $FC06
    .byte $F0 ; |XXXX    | $FC07
    .byte $F0 ; |XXXX    | $FC08
    .byte $F0 ; |XXXX    | $FC09
    .byte $F0 ; |XXXX    | $FC0A
    .byte $F8 ; |XXXXX   | $FC0B
    .byte $FC ; |XXXXXX  | $FC0C
    .byte $FE ; |XXXXXXX | $FC0D
    .byte $FE ; |XXXXXXX | $FC0E
    .byte $FE ; |XXXXXXX | $FC0F
    .byte $FE ; |XXXXXXX | $FC10
    .byte $FE ; |XXXXXXX | $FC11
    .byte $FE ; |XXXXXXX | $FC12
    .byte $BE ; |X XXXXX | $FC13
    .byte $1E ; |   XXXX | $FC14
    .byte $0E ; |    XXX | $FC15
    .byte $06 ; |     XX | $FC16
    .byte $02 ; |      X | $FC17
    .byte $00 ; |        | $FC18
LFC19:
    .byte $FC ; |XXXXXX  | $FC19
    .byte $F8 ; |XXXXX   | $FC1A
    .byte $F0 ; |XXXX    | $FC1B
    .byte $E0 ; |XXX     | $FC1C
    .byte $C0 ; |XX      | $FC1D
    .byte $80 ; |X       | $FC1E
    .byte $00 ; |        | $FC1F
    .byte $00 ; |        | $FC20
    .byte $00 ; |        | $FC21
    .byte $00 ; |        | $FC22
    .byte $00 ; |        | $FC23
    .byte $00 ; |        | $FC24
    .byte $00 ; |        | $FC25
    .byte $00 ; |        | $FC26
    .byte $00 ; |        | $FC27
    .byte $00 ; |        | $FC28
    .byte $00 ; |        | $FC29
    .byte $00 ; |        | $FC2A
    .byte $00 ; |        | $FC2B
    .byte $00 ; |        | $FC2C
    .byte $00 ; |        | $FC2D
    .byte $00 ; |        | $FC2E
    .byte $00 ; |        | $FC2F
    .byte $00 ; |        | $FC30
    .byte $00 ; |        | $FC31
    .byte $00 ; |        | $FC32
    .byte $00 ; |        | $FC33
    .byte $00 ; |        | $FC34
    .byte $00 ; |        | $FC35
    .byte $00 ; |        | $FC36
    .byte $00 ; |        | $FC37
    .byte $00 ; |        | $FC38
    .byte $00 ; |        | $FC39
    .byte $00 ; |        | $FC3A
    .byte $00 ; |        | $FC3B
    .byte $00 ; |        | $FC3C
    .byte $00 ; |        | $FC3D
    .byte $00 ; |        | $FC3E
    .byte $00 ; |        | $FC3F
    .byte $00 ; |        | $FC40
    .byte $00 ; |        | $FC41
    .byte $00 ; |        | $FC42
    .byte $00 ; |        | $FC43
    .byte $00 ; |        | $FC44
    .byte $00 ; |        | $FC45
    .byte $00 ; |        | $FC46
    .byte $00 ; |        | $FC47
    .byte $00 ; |        | $FC48
    .byte $00 ; |        | $FC49
    .byte $00 ; |        | $FC4A
    .byte $E0 ; |XXX     | $FC4B
    .byte $00 ; |        | $FC4C
    .byte $00 ; |        | $FC4D
    .byte $00 ; |        | $FC4E
    .byte $00 ; |        | $FC4F
    .byte $00 ; |        | $FC50
    .byte $80 ; |X       | $FC51
    .byte $E0 ; |XXX     | $FC52
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
    .byte $00 ; |        | $FC7C
    .byte $00 ; |        | $FC7D
    .byte $00 ; |        | $FC7E
    .byte $00 ; |        | $FC7F
    .byte $00 ; |        | $FC80
    .byte $00 ; |        | $FC81
    .byte $00 ; |        | $FC82
    .byte $00 ; |        | $FC83
    .byte $00 ; |        | $FC84
    .byte $00 ; |        | $FC85
    .byte $00 ; |        | $FC86
    .byte $00 ; |        | $FC87
    .byte $00 ; |        | $FC88
    .byte $00 ; |        | $FC89
    .byte $00 ; |        | $FC8A
    .byte $00 ; |        | $FC8B
    .byte $00 ; |        | $FC8C
    .byte $00 ; |        | $FC8D
    .byte $00 ; |        | $FC8E
    .byte $00 ; |        | $FC8F
    .byte $00 ; |        | $FC90
    .byte $00 ; |        | $FC91
    .byte $00 ; |        | $FC92
    .byte $00 ; |        | $FC93
    .byte $00 ; |        | $FC94
    .byte $00 ; |        | $FC95
    .byte $00 ; |        | $FC96
    .byte $00 ; |        | $FC97
    .byte $00 ; |        | $FC98
    .byte $00 ; |        | $FC99
    .byte $00 ; |        | $FC9A
LFC9B:
    .byte $F0 ; |XXXX    | $FC9B
    .byte $F0 ; |XXXX    | $FC9C
    .byte $F0 ; |XXXX    | $FC9D
    .byte $F0 ; |XXXX    | $FC9E
    .byte $F0 ; |XXXX    | $FC9F
    .byte $F0 ; |XXXX    | $FCA0
    .byte $F0 ; |XXXX    | $FCA1
    .byte $F0 ; |XXXX    | $FCA2
    .byte $F0 ; |XXXX    | $FCA3
    .byte $F0 ; |XXXX    | $FCA4
    .byte $F0 ; |XXXX    | $FCA5
    .byte $F0 ; |XXXX    | $FCA6
    .byte $F8 ; |XXXXX   | $FCA7
    .byte $FC ; |XXXXXX  | $FCA8
    .byte $FE ; |XXXXXXX | $FCA9
    .byte $FE ; |XXXXXXX | $FCAA
    .byte $FE ; |XXXXXXX | $FCAB
    .byte $FE ; |XXXXXXX | $FCAC
    .byte $FE ; |XXXXXXX | $FCAD
    .byte $FE ; |XXXXXXX | $FCAE
    .byte $FE ; |XXXXXXX | $FCAF
    .byte $FE ; |XXXXXXX | $FCB0
    .byte $FE ; |XXXXXXX | $FCB1
    .byte $BE ; |X XXXXX | $FCB2
    .byte $1E ; |   XXXX | $FCB3
    .byte $0E ; |    XXX | $FCB4
    .byte $06 ; |     XX | $FCB5
    .byte $02 ; |      X | $FCB6
    .byte $00 ; |        | $FCB7
    .byte $00 ; |        | $FCB8
    .byte $00 ; |        | $FCB9
    .byte $00 ; |        | $FCBA
    .byte $00 ; |        | $FCBB
    .byte $00 ; |        | $FCBC
    .byte $00 ; |        | $FCBD
    .byte $00 ; |        | $FCBE
    .byte $00 ; |        | $FCBF
    .byte $00 ; |        | $FCC0
    .byte $00 ; |        | $FCC1
    .byte $00 ; |        | $FCC2
    .byte $00 ; |        | $FCC3
    .byte $00 ; |        | $FCC4
    .byte $00 ; |        | $FCC5
    .byte $00 ; |        | $FCC6
    .byte $00 ; |        | $FCC7
    .byte $00 ; |        | $FCC8
    .byte $00 ; |        | $FCC9
    .byte $00 ; |        | $FCCA
    .byte $00 ; |        | $FCCB
    .byte $00 ; |        | $FCCC
    .byte $00 ; |        | $FCCD
    .byte $00 ; |        | $FCCE
    .byte $00 ; |        | $FCCF
    .byte $00 ; |        | $FCD0
    .byte $00 ; |        | $FCD1
    .byte $00 ; |        | $FCD2
    .byte $00 ; |        | $FCD3
    .byte $00 ; |        | $FCD4
    .byte $00 ; |        | $FCD5
    .byte $00 ; |        | $FCD6
    .byte $00 ; |        | $FCD7
    .byte $00 ; |        | $FCD8
    .byte $00 ; |        | $FCD9
    .byte $00 ; |        | $FCDA
    .byte $00 ; |        | $FCDB
    .byte $00 ; |        | $FCDC
    .byte $00 ; |        | $FCDD
    .byte $00 ; |        | $FCDE
    .byte $00 ; |        | $FCDF
    .byte $00 ; |        | $FCE0
    .byte $00 ; |        | $FCE1
    .byte $00 ; |        | $FCE2
    .byte $00 ; |        | $FCE3
    .byte $00 ; |        | $FCE4
    .byte $00 ; |        | $FCE5
    .byte $00 ; |        | $FCE6
    .byte $00 ; |        | $FCE7
    .byte $00 ; |        | $FCE8
    .byte $00 ; |        | $FCE9
    .byte $00 ; |        | $FCEA
    .byte $00 ; |        | $FCEB
    .byte $00 ; |        | $FCEC
    .byte $00 ; |        | $FCED
    .byte $00 ; |        | $FCEE
    .byte $00 ; |        | $FCEF
    .byte $00 ; |        | $FCF0
    .byte $00 ; |        | $FCF1
    .byte $00 ; |        | $FCF2
    .byte $00 ; |        | $FCF3
    .byte $00 ; |        | $FCF4
    .byte $00 ; |        | $FCF5
    .byte $00 ; |        | $FCF6
    .byte $00 ; |        | $FCF7
    .byte $00 ; |        | $FCF8
    .byte $00 ; |        | $FCF9
    .byte $00 ; |        | $FCFA
    .byte $00 ; |        | $FCFB
    .byte $00 ; |        | $FCFC
    .byte $00 ; |        | $FCFD
    .byte $00 ; |        | $FCFE
    .byte $00 ; |        | $FCFF
    .byte $7E ; | XXXXXX | $FD00
    .byte $72 ; | XXX  X | $FD01
    .byte $72 ; | XXX  X | $FD02
    .byte $72 ; | XXX  X | $FD03
    .byte $72 ; | XXX  X | $FD04
    .byte $72 ; | XXX  X | $FD05
    .byte $7E ; | XXXXXX | $FD06
    .byte $1C ; |   XXX  | $FD07
    .byte $1C ; |   XXX  | $FD08
    .byte $1C ; |   XXX  | $FD09
    .byte $1C ; |   XXX  | $FD0A
    .byte $1C ; |   XXX  | $FD0B
    .byte $1C ; |   XXX  | $FD0C
    .byte $3C ; |  XXXX  | $FD0D
    .byte $7E ; | XXXXXX | $FD0E
    .byte $40 ; | X      | $FD0F
    .byte $7E ; | XXXXXX | $FD10
    .byte $0E ; |    XXX | $FD11
    .byte $0E ; |    XXX | $FD12
    .byte $4E ; | X  XXX | $FD13
    .byte $7E ; | XXXXXX | $FD14
    .byte $7E ; | XXXXXX | $FD15
    .byte $4E ; | X  XXX | $FD16
    .byte $0E ; |    XXX | $FD17
    .byte $1C ; |   XXX  | $FD18
    .byte $0E ; |    XXX | $FD19
    .byte $4E ; | X  XXX | $FD1A
    .byte $7E ; | XXXXXX | $FD1B
    .byte $1C ; |   XXX  | $FD1C
    .byte $1C ; |   XXX  | $FD1D
    .byte $7E ; | XXXXXX | $FD1E
    .byte $5C ; | X XXX  | $FD1F
    .byte $5C ; | X XXX  | $FD20
    .byte $5C ; | X XXX  | $FD21
    .byte $7C ; | XXXXX  | $FD22
    .byte $7E ; | XXXXXX | $FD23
    .byte $4E ; | X  XXX | $FD24
    .byte $0E ; |    XXX | $FD25
    .byte $7E ; | XXXXXX | $FD26
    .byte $40 ; | X      | $FD27
    .byte $4E ; | X  XXX | $FD28
    .byte $7E ; | XXXXXX | $FD29
    .byte $7E ; | XXXXXX | $FD2A
    .byte $4E ; | X  XXX | $FD2B
    .byte $4E ; | X  XXX | $FD2C
    .byte $7E ; | XXXXXX | $FD2D
    .byte $40 ; | X      | $FD2E
    .byte $4E ; | X  XXX | $FD2F
    .byte $7E ; | XXXXXX | $FD30
    .byte $0E ; |    XXX | $FD31
    .byte $0E ; |    XXX | $FD32
    .byte $0E ; |    XXX | $FD33
    .byte $0E ; |    XXX | $FD34
    .byte $0E ; |    XXX | $FD35
    .byte $4E ; | X  XXX | $FD36
    .byte $7E ; | XXXXXX | $FD37
    .byte $7E ; | XXXXXX | $FD38
    .byte $4E ; | X  XXX | $FD39
    .byte $4E ; | X  XXX | $FD3A
    .byte $7E ; | XXXXXX | $FD3B
    .byte $72 ; | XXX  X | $FD3C
    .byte $72 ; | XXX  X | $FD3D
    .byte $7E ; | XXXXXX | $FD3E
    .byte $7E ; | XXXXXX | $FD3F
    .byte $72 ; | XXX  X | $FD40
    .byte $02 ; |      X | $FD41
    .byte $7E ; | XXXXXX | $FD42
    .byte $72 ; | XXX  X | $FD43
    .byte $72 ; | XXX  X | $FD44
    .byte $7E ; | XXXXXX | $FD45
    .byte $00 ; |        | $FD46
    .byte $00 ; |        | $FD47
    .byte $00 ; |        | $FD48
    .byte $00 ; |        | $FD49
    .byte $00 ; |        | $FD4A
    .byte $00 ; |        | $FD4B
    .byte $00 ; |        | $FD4C
    .byte $6C ; | XX XX  | $FD4D
    .byte $82 ; |X     X | $FD4E
    .byte $BA ; |X XXX X | $FD4F
    .byte $A2 ; |X X   X | $FD50
    .byte $BA ; |X XXX X | $FD51
    .byte $82 ; |X     X | $FD52
    .byte $6C ; | XX XX  | $FD53
    .byte $00 ; |        | $FD54
    .byte $77 ; | XXX XXX| $FD55
    .byte $21 ; |  X    X| $FD56
    .byte $21 ; |  X    X| $FD57
    .byte $27 ; |  X  XXX| $FD58
    .byte $65 ; | XX  X X| $FD59
    .byte $27 ; |  X  XXX| $FD5A
    .byte $00 ; |        | $FD5B
    .byte $77 ; | XXX XXX| $FD5C
    .byte $51 ; | X X   X| $FD5D
    .byte $51 ; | X X   X| $FD5E
    .byte $77 ; | XXX XXX| $FD5F
    .byte $51 ; | X X   X| $FD60
    .byte $77 ; | XXX XXX| $FD61
    .byte $00 ; |        | $FD62
    .byte $05 ; |     X X| $FD63
    .byte $05 ; |     X X| $FD64
    .byte $25 ; |  X  X X| $FD65
    .byte $27 ; |  X  XXX| $FD66
    .byte $05 ; |     X X| $FD67
    .byte $07 ; |     XXX| $FD68
    .byte $00 ; |        | $FD69
    .byte $25 ; |  X  X X| $FD6A
    .byte $25 ; |  X  X X| $FD6B
    .byte $25 ; |  X  X X| $FD6C
    .byte $27 ; |  X  XXX| $FD6D
    .byte $25 ; |  X  X X| $FD6E
    .byte $77 ; | XXX XXX| $FD6F
    .byte $00 ; |        | $FD70
    .byte $47 ; | X   XXX| $FD71
    .byte $42 ; | X    X | $FD72
    .byte $42 ; | X    X | $FD73
    .byte $42 ; | X    X | $FD74
    .byte $52 ; | X X  X | $FD75
    .byte $77 ; | XXX XXX| $FD76
    .byte $00 ; |        | $FD77
    .byte $EA ; |XXX X X | $FD78
    .byte $AA ; |X X X X | $FD79
    .byte $EE ; |XXX XXX | $FD7A
    .byte $8A ; |X   X X | $FD7B
    .byte $EE ; |XXX XXX | $FD7C
    .byte $00 ; |        | $FD7D
    .byte $00 ; |        | $FD7E
    .byte $AB ; |X X X XX| $FD7F
    .byte $AA ; |X X X X | $FD80
    .byte $FB ; |XXXXX XX| $FD81
    .byte $DA ; |XX XX X | $FD82
    .byte $8B ; |X   X XX| $FD83
    .byte $00 ; |        | $FD84
    .byte $00 ; |        | $FD85
    .byte $42 ; | X    X | $FD86
    .byte $A5 ; |X X  X X| $FD87
    .byte $A8 ; |X X X   | $FD88
    .byte $A8 ; |X X X   | $FD89
    .byte $48 ; | X  X   | $FD8A
    .byte $00 ; |        | $FD8B
    .byte $00 ; |        | $FD8C
    .byte $35 ; |  XX X X| $FD8D
    .byte $25 ; |  X  X X| $FD8E
    .byte $B6 ; |X XX XX | $FD8F
    .byte $A5 ; |X X  X X| $FD90
    .byte $B6 ; |X XX XX | $FD91
    .byte $00 ; |        | $FD92
    .byte $00 ; |        | $FD93  not sure where the unused bits start...

  REPEAT ($FFF0-*)
    .byte 0
  REPEND


       ORG $1FF0
      RORG $FFF0

LFFF0:
    lda    $FFF8                 ; 4
    jmp.ind ($0080)              ; 5

    .byte $00 ; |        | $FFF6
    .byte $00 ; |        | $FFF7
    .byte $00 ; |        | $FFF8
    .byte $00 ; |        | $FFF9

    .word START_1
    .word START_1
    .word START_1
